package ru.sogaz.esb.adapter.email.routes;

import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.model.dataformat.JsonLibrary;
import ru.sogaz.esb.adapter.email.processors.AttachmentProcessor;
import ru.sogaz.esb.configurations.Config;
import ru.sogaz.esb.configurations.EsbConfiguration;
import ru.sogaz.esb.model.Message;

/**
 * @author DNAvetik
 * 27.02.2018.
 */
public class FacadeRoute extends RouteBuilder {

    private static final EsbConfiguration config = Config.getEsbConfiguration();

    // imap://login@host:port?password=password&consumer.delay=60000
    private static final String imapEndpoint = String.format("imap://%s@%s:%d?password=%s&consumer.delay=60000",
            config.getEmailEndpoint().getCredential().getLogin(),
            config.getEmailEndpoint().getHost(),
            config.getEmailImapPort(),
            config.getEmailEndpoint().getCredential().getPassword()
    );

    public void configure() throws Exception {
        from(imapEndpoint).routeId("EmailAdapterFacadeRoute")
                .process(new AttachmentProcessor())
                .setHeader("xmlBody", simple("${body}"))
                .unmarshal().jacksonxml(Message.class)
                .setHeader("objectBody", simple("${body}"))
                .to("direct-vm:srMediator:main")
                .log("${body}")
        ;
    }
}
