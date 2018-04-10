package ru.sogaz.esb.adapter.email.routes;

import org.apache.camel.Exchange;
import org.apache.camel.LoggingLevel;
import org.apache.camel.Processor;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.model.dataformat.JsonLibrary;
import org.apache.camel.processor.aggregate.AggregationStrategy;
import ru.sogaz.esb.adapter.email.NoMessageXmlException;
import ru.sogaz.esb.adapter.email.processors.AttachmentProcessor;
import ru.sogaz.esb.adapter.email.processors.MessageProcessor;
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

    private static final String imapEndpoint = String.format("imaps://%s:%d?username=%s&password=%s&closeFolder=false$consumer.delay=60000&unseen=true&peek=false",
            config.getEmailImapEndpoint().getHost(),
            config.getEmailImapPort(),
            config.getEmailImapEndpoint().getCredential().getLogin(),
            config.getEmailImapEndpoint().getCredential().getPassword()
    );



    public void configure() throws Exception {

        onException(NoMessageXmlException.class)
                .handled(false)
                .log(LoggingLevel.ERROR, "E-mail message doesn't contain message.xml file or format is unsatisfied: ${exception.stacktrace}")
                .to("direct-vm:emailAdapter:send");

        from(imapEndpoint).
        routeId("EmailAdapterFacadeRoute")
                .log(LoggingLevel.INFO, "Retrieving e-mail from the inbox folder")
                .setHeader("uuid").simple("${bean:uuidGenerator.getUUID}").to("log:newmail")
                .log(LoggingLevel.INFO, "E-mail was successfully consumed: uuid - ${header[uuid]}; body - ${body}")
                .log(LoggingLevel.INFO, "Attachments extraction and message.xml validation: uuid - ${header[uuid]}")
                .setHeader("emailMessageText", simple("${body}"))
                .process(new MessageProcessor())
                .log(LoggingLevel.INFO, "Creating message_h.html using message_h.xsl template: uuid - ${body}")
                .to("xslt:classpath:/xsl/message_h.xsl")
                .log(LoggingLevel.INFO, "Successfully created message_h.html using message_h.xsl template: uuid - ${body}")
                .process(new AttachmentProcessor())
                .log(LoggingLevel.INFO, "Message.xml status - OK : uuid - ${header[uuid]}; attachments - ${header[attachments]}")
                .setHeader("xmlBody", simple("${body}"))
                .unmarshal().jacksonxml(Message.class)
                .setHeader("objectBody", simple("${body}"))
                .log(LoggingLevel.INFO, "Successful transform message.xml to xml and object:  uuid - ${header[uuid]}; object - ${header[objectBody]}; xml - ${header[xmlBody]}")
                .enrich("direct-vm:emailAdapter:send", (oldExchange, newExchange) -> oldExchange)
                .to("direct-vm:srMediator:main")
        ;

    }

}
