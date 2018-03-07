package ru.sogaz.esb.mediator.sr.routes;

import org.apache.camel.builder.RouteBuilder;
import ru.sogaz.esb.model.Message;

import java.util.List;

/**
 * @author DNAvetik
 * 01.03.2018.
 */
public class SRMediatorRoute extends RouteBuilder {

    public void configure() throws Exception {
        from("direct-vm:srMediator:main").routeId("SRMediatorRoute")
                .enrich("direct-vm:documentumAdapter:create", (oldExchange, newExchange) -> {
                    oldExchange.getIn().setBody(newExchange.getIn().getBody());
                    return oldExchange;
                })
                .log("body - ${body}")
                .process(exchange -> {
                    Message message = exchange.getIn().getHeader("objectBody", Message.class);
                    message.getLinks().addAll(exchange.getIn().getBody(List.class));
                    exchange.getIn().setBody(message);
                })

                .to("direct-vm:siebelAdapter:sendSR")
        ;
    }
}
