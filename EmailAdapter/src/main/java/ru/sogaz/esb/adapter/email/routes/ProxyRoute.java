package ru.sogaz.esb.adapter.email.routes;

import org.apache.camel.LoggingLevel;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.model.dataformat.JsonLibrary;
import ru.sogaz.esb.configurations.Config;
import ru.sogaz.esb.configurations.EsbConfiguration;
import ru.sogaz.esb.model.EmailMessage;

/**
 * @author DNAvetik
 * 28.02.2018.
 */
public class ProxyRoute extends RouteBuilder {

    private static final EsbConfiguration config = Config.getEsbConfiguration();

    // smtp://login@host:port?password=password
    private static final String smtpEndpoint = String.format("smtps://%s:%d?username=%s&password=%s",
            config.getEmailSmtpEndpoint().getHost(),
            config.getEmailSmtpPort(),
            config.getEmailSmtpEndpoint().getCredential().getLogin(),
            config.getEmailSmtpEndpoint().getCredential().getPassword()
    );

    public void configure() throws Exception {

        onException(Exception.class)
                .handled(true)
                .log(LoggingLevel.ERROR, "${exception.stacktrace}")
                .maximumRedeliveries(2)
                .redeliveryDelay(15000);

        from("direct-vm:emailAdapter:send").routeId("EmailAdapterProxyRoute")
                .choice()
                    .when(header("CamelExceptionCaught").isNull())
                        .transform(header("xmlBody"))
                        .to("xslt:classpath:/xsl/message_m.xsl")
                        .unmarshal().jacksonxml(EmailMessage.class)
                        .process(exchange -> {
                            EmailMessage em = exchange.getIn().getBody(EmailMessage.class);
                            em.setText(exchange.getIn().getHeader("emailMessageText", String.class));
                            exchange.getIn().setBody(em);
                        })
                        .log(LoggingLevel.INFO, "Successful transform xml to EmailMessage: uuid - ${header[uuid]}; EmailMessage - ${body}")
                        .removeHeaders("*", "uuid")

                        /*.setHeader("to", simple("${body.to}"))*/
                        .setHeader("to", simple("ideyniy@mail.ru"))
                        .setHeader("cc", simple("${body.cc}"))
                        .setHeader("bcc", simple("${body.bcc}"))
                        .setHeader("subject", simple("${body.subject}"))
                        .setHeader("from", simple(config.getFromEmail()))
                        .transform(simple("${body.text}"))

                        .log(LoggingLevel.INFO, "Try send e-mail message to suppurate department: uuid - ${header[uuid]}; EmailMessage - ${body}")
                        .to(smtpEndpoint)
                        .log(LoggingLevel.INFO, "Successful send e-mail message to suppurate department: uuid - ${header[uuid]}; EmailMessage - ${body}")
                    .otherwise()
                        .removeHeaders("*", "uuid")

                        .setHeader("to", simple(config.getAdminEmail()))
                        .setHeader("subject", simple("${header[CamelExceptionCaught]}"))
                        .setHeader("from", simple(config.getFromEmail()))
                        .transform(simple("${exception.stacktrace}"))

                        .log(LoggingLevel.INFO, "Try send e-mail message to admin: uuid - ${header[uuid]}; EmailMessage - ${header[CamelExceptionCaught]}")
                        .to(smtpEndpoint)
                        .log(LoggingLevel.INFO, "Successful send e-mail message to admin: uuid - ${header[uuid]}; EmailMessage - ${header[CamelExceptionCaught]}")
                .endChoice()
        ;
    }
}
