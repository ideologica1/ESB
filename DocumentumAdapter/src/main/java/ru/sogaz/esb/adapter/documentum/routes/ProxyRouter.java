package ru.sogaz.esb.adapter.documentum.routes;

import org.apache.camel.Exchange;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.model.dataformat.JsonLibrary;
import ru.sogaz.esb.adapter.documentum.aggregation.LinkAggregationStrategy;
import ru.sogaz.esb.adapter.documentum.model.Document;
import ru.sogaz.esb.adapter.documentum.model.Link;
import ru.sogaz.esb.adapter.documentum.processors.FileToInputStreamProcessor;
import ru.sogaz.esb.adapter.documentum.processors.NewDocumentProcessor;
import ru.sogaz.esb.configurations.Config;
import ru.sogaz.esb.configurations.type.ConfigEndpointType;

/**
 * @author DNAvetik
 * 02.03.2018.
 */
public class ProxyRouter extends RouteBuilder {

    private static ConfigEndpointType DOCUMENTUM_ENDPOINT = Config.getEsbConfiguration().getDocumentumEndpoint();

    /*http://s00-0000-dm13:7001/dctm-rest72/repositories/orclord/folders/0c000001816ffaba/documents*/
    private static String DOCUMENTUM_CREATE_PATH = "http://" + DOCUMENTUM_ENDPOINT.getHost() +
            ":" + DOCUMENTUM_ENDPOINT.getPort() + "/repositories/orclord/documents/0900000189ae216e";

    @Override
    public void configure() throws Exception {
        from("direct-vm:documentumAdapter:create")
                .split(header("attachments")).parallelProcessing()
                .aggregationStrategy(new LinkAggregationStrategy())
                    .process(new NewDocumentProcessor())
                    .marshal().json(JsonLibrary.Jackson)

                    .setHeader(Exchange.CONTENT_TYPE, simple("application/vnd.emc.documentum+json;charset=UTF-8"))
                    .setHeader(Exchange.HTTP_METHOD, simple("POST"))
                    .setHeader("Authorization").simple("Basic " + DOCUMENTUM_ENDPOINT.getCredential().getBase64String())
                    .to(DOCUMENTUM_CREATE_PATH)

                    .unmarshal().json(JsonLibrary.Jackson, Document.class)
                    .process(exchange -> {
                        Document document = exchange.getIn().getBody(Document.class);
                        for (Link link : document.getLinks()) {
                            if (link.getRel().equalsIgnoreCase("self")) {
                                exchange.getIn().setHeader("link", link.getHref());
                            }
                        }
                    })

                    .setHeader(Exchange.CONTENT_TYPE, simple("application/octet-stream"))
                    .setHeader(Exchange.HTTP_METHOD, simple("POST"))
                    .process(new FileToInputStreamProcessor())
                    .to(header("Location").toString() + "/contents?overwrite=true&format=" + header("fileFormat").toString())
                    .transform(header("link"))
                .end();
    }
}
