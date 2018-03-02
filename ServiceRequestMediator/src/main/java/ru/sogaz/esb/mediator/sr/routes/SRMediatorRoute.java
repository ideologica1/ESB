package ru.sogaz.esb.mediator.sr.routes;

import org.apache.camel.Exchange;
import org.apache.camel.Processor;
import org.apache.camel.builder.RouteBuilder;
import ru.sogaz.esb.model.Message;

import java.util.List;

/**
 * @author DNAvetik
 * 01.03.2018.
 */
public class SRMediatorRoute extends RouteBuilder {

    public void configure() throws Exception {
        from("direct-vm:srMediator:main")

                .transform(header("xmlBody"))
                .to("xslt:classpath:/xsl/message_h.xsl")

                .to("direct-vm:documentumAdapter:create")
                .process(exchange -> {
                    Message message = exchange.getIn().getHeader("objectBody", Message.class);
                    message.getLinks().addAll(exchange.getIn().getBody(List.class));
                    exchange.getIn().setBody(message);
                })

                .log("before message_m - ${body}")
                .setHeader("originalBody", simple("${body}"))
                .to("xslt:classpath:/xsl/message_m.xsl")
                .log("after message_m - ${body}")

                .transform(header("originalBody"))
                .log("before message_s - ${body}")
                .to("xslt:classpath:/xsl/message_s.xsl")
                .log("after message_s - ${body}")

                .transform(header("originalBody"))
                .log("before message_h - ${body}")
                .to("xslt:classpath:/xsl/message_h.xsl")
                .log("after message_h - ${body}")
        ;
    }
}
