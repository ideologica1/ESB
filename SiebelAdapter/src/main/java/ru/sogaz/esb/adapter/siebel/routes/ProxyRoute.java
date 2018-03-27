package ru.sogaz.esb.adapter.siebel.routes;

import org.apache.camel.LoggingLevel;
import org.apache.camel.builder.RouteBuilder;
import ru.sogaz.esb.adapter.siebel.mapping.EsbToSiebel;

/**
 * @author DNAvetik
 * 28.02.2018.
 */
public class ProxyRoute extends RouteBuilder {

    public void configure() throws Exception {

        onException(Exception.class)
                .handled(true)
                .log(LoggingLevel.ERROR, "${exception.stacktrace}")
                .maximumRedeliveries(2)
                .redeliveryDelay(15000)
                .to("direct-vm:emailAdapter:send");

        from("direct-vm:siebelAdapter:sendSR").routeId("SiebelRoute")
                .log(LoggingLevel.INFO, "Try execute mapping ESB to Siebel: uuid - ${header[uuid]}; SR - ${body}")
                .bean(new EsbToSiebel(), "mapping")
                .log(LoggingLevel.INFO, "Try call Siebel to send SR: uuid - ${header[uuid]}; SR - ${body}")
                .to("bean:siebelEndpoint")
                .log(LoggingLevel.INFO, "Successful call Siebel to send SR: uuid - ${header[uuid]}; SR - ${body}")
                .choice()
                    .when(simple("${body.errorCode} != 'OK'"))
                        .throwException(new RuntimeException("Unsuccessful call siebel"))
                    .otherwise()
                .endChoice()
        ;
    }
}
