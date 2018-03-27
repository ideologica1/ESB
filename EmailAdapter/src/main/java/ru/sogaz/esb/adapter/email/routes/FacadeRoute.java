package ru.sogaz.esb.adapter.email.routes;

import org.apache.camel.Exchange;
import org.apache.camel.LoggingLevel;
import org.apache.camel.Processor;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.model.dataformat.JsonLibrary;
import org.apache.camel.processor.aggregate.AggregationStrategy;
import ru.sogaz.esb.adapter.email.processors.AttachmentProcessor;
import ru.sogaz.esb.configurations.Config;
import ru.sogaz.esb.configurations.EsbConfiguration;
import ru.sogaz.esb.model.EmailMessage;
import ru.sogaz.esb.model.Message;

/**
 * @author DNAvetik
 * 27.02.2018.
 */
public class FacadeRoute extends RouteBuilder {

    private static final EsbConfiguration config = Config.getEsbConfiguration();

    // imap://login@host:port?password=password&consumer.delay=60000
    private static final String imapEndpoint = String.format("imaps://%s:%d?username=%s&password=%s&consumer.delay=60000&unseen=true&peek=false",
            config.getEmailImapEndpoint().getHost(),
            config.getEmailImapPort(),
            config.getEmailImapEndpoint().getCredential().getLogin(),
            config.getEmailImapEndpoint().getCredential().getPassword()
    );

    /*private static final String imapEndpoint = "imaps://imap.gmail.com:993?username=ideyniy5@gmail.com&password=4j3n65GMD" + "&delete=false&unseen=true&consumer.delay=60000";*/

    public void configure() throws Exception {
        from(imapEndpoint).
        routeId("EmailAdapterFacadeRoute")
                .setHeader("uuid").simple("${bean:uuidGenerator.getUUID}").to("log:newmail")
                .log(LoggingLevel.INFO, "Get e-mail message from exchange: uuid - ${header[uuid]}; body - ${body}")
                .setHeader("emailMessageText", simple("${body}"))
                .process(new AttachmentProcessor())
                .log(LoggingLevel.INFO, "Get attachment and message.xml from e-mail message: uuid - ${header[uuid]}; attachments - ${header[attachments]}")
                .setHeader("xmlBody", simple("${body}"))
                .unmarshal().jacksonxml(Message.class)
                .setHeader("objectBody", simple("${body}"))
                .log(LoggingLevel.INFO, "Successful transform message.xml to xml and object:  uuid - ${header[uuid]}; object - ${header[objectBody]}; xml - ${header[xmlBody]}")
                .enrich("direct-vm:emailAdapter:send", (oldExchange, newExchange) -> oldExchange)
                .to("direct-vm:srMediator:main")
        ;
    }
}
