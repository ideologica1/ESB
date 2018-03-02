package ru.sogaz.esb.adapter.siebel.routes;

import org.apache.camel.builder.RouteBuilder;
import ru.sogaz.esb.adapter.siebel.mapping.EsbToSiebel;

/**
 * @author DNAvetik
 * 28.02.2018.
 */
public class SiebelAdapterRoute extends RouteBuilder {

    public void configure() throws Exception {
        from("direct-vm:siebelAdapter:sendSR")
                .bean(new EsbToSiebel(), "mapping")
                .to("bean:siebelEndpoint");
    }
}
