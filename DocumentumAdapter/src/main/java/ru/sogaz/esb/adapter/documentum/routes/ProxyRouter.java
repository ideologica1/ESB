package ru.sogaz.esb.adapter.documentum.routes;

import org.apache.camel.Exchange;
import org.apache.camel.LoggingLevel;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.model.dataformat.JaxbDataFormat;
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

    private static final ConfigEndpointType DOCUMENTUM_ENDPOINT = Config.getEsbConfiguration().getDocumentumEndpoint();

    /*http://s00-0000-dm13:7001/dctm-rest72/repositories/orclord/folders/0c000001816ffaba/documents*/
    private static final String DOCUMENTUM_CREATE_PATH = "http://" + DOCUMENTUM_ENDPOINT.getHost() +
            ":" + DOCUMENTUM_ENDPOINT.getPort() + "/dctm-rest72/repositories/orclord/folders/0c000001816ffaba/documents";

    @Override
    public void configure() throws Exception {



        onException(Exception.class)
                .handled(true)
                .log(LoggingLevel.ERROR, "${exception.stacktrace}")
                .maximumRedeliveries(2)
                .redeliveryDelay(15000)
                .to("direct-vm:emailAdapter:send");

        from("direct-vm:documentumAdapter:create").routeId("DocumentumProxyRoute")
                .streamCaching()
                .split(header("attachments")).parallelProcessing()
                .aggregationStrategy(new LinkAggregationStrategy())
                    .removeHeaders("*", "uuid")
                    .process(new NewDocumentProcessor())
                .log(LoggingLevel.DEBUG, "Trying to marshal Document.class to JSON request; request - ${body}")
                    .marshal().json(JsonLibrary.Jackson)
                .log(LoggingLevel.DEBUG, "Successful marshaling Document.class to JSON request; request - ${body}")
                    .setHeader(Exchange.CONTENT_TYPE, constant("application/vnd.emc.documentum+json;charset=UTF-8"))
                    .setHeader(Exchange.HTTP_METHOD, constant("POST"))
                    .setHeader("Authorization").simple("Basic " + DOCUMENTUM_ENDPOINT.getCredential().getBase64String())
                    .log(LoggingLevel.INFO, "Try call documentum to create document: uuid - ${header[uuid]}; request - ${body}")
                    .to(DOCUMENTUM_CREATE_PATH)
                .log(LoggingLevel.DEBUG, "Trying to unmarshal JSON response")
                    .unmarshal().json(JsonLibrary.Jackson, Document.class)
                .log(LoggingLevel.DEBUG, "Successfully unmarshaled JSON response")
                    .process(exchange -> {
                        Document document = exchange.getIn().getBody(Document.class);
                        for (Link link : document.getLinks()) {
                            if (link.getRel().equalsIgnoreCase("self")) {
                                exchange.getIn().setHeader("link", link.getHref());
                            }
                        }
                    })
                    .setHeader(Exchange.CONTENT_TYPE, constant("application/octet-stream"))
                    .setHeader(Exchange.HTTP_METHOD, constant("POST"))

                    .log(LoggingLevel.INFO, "Try call documentum to send document: uuid - ${header[uuid]}; document - ${body}")
                    .process(new FileToInputStreamProcessor())
                    .recipientList(simple("${header[Location]}/contents?overwrite=true&format=${header[fileFormat]}"))

                    .transform(header("link"))
                .end();
    }
}
