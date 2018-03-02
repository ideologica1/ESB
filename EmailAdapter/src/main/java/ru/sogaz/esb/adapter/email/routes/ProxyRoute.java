package ru.sogaz.esb.adapter.email.routes;

import org.apache.camel.builder.RouteBuilder;
import ru.sogaz.esb.configurations.Config;
import ru.sogaz.esb.configurations.EsbConfiguration;

/**
 * @author DNAvetik
 * 28.02.2018.
 */
public class ProxyRoute extends RouteBuilder {

    private static final EsbConfiguration config = Config.getEsbConfiguration();

    // smtp://login@host:port?password=password
    private static final String smtpEndpoint = String.format("smtp://%s@%s:%d?password=%s",
            config.getEmailEndpoint().getCredential().getLogin(),
            config.getEmailEndpoint().getHost(),
            config.getEmailSmtpPort(),
            config.getEmailEndpoint().getCredential().getPassword()
    );

    public void configure() throws Exception {
        from("direct-vm:emailAdapter:send").routeId("EmailAdapterProxyRoute")
                .to(smtpEndpoint);
    }
}
