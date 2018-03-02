package ru.sogaz.esb.configurations.type;

/**
 * @author DNAvetik
 * 26.06.17.
 */
public class ConfigEndpointType {
    private String endpoint;
    private ConfigCredentialType credential;
    private Integer connectionTimeout;
    private Integer timeout;
    private String host;
    private String port;

    public ConfigEndpointType() {
    }

    public String getEndpoint() {
        return this.endpoint;
    }

    public void setEndpoint(String endpoint) {
        this.endpoint = endpoint;
    }

    public ConfigCredentialType getCredential() {
        return this.credential;
    }

    public void setCredential(ConfigCredentialType credential) {
        this.credential = credential;
    }

    public Integer getConnectionTimeout() {
        return this.connectionTimeout;
    }

    public void setConnectionTimeout(Integer connectionTimeout) {
        this.connectionTimeout = connectionTimeout;
    }

    public Integer getTimeout() {
        return this.timeout;
    }

    public void setTimeout(Integer timeout) {
        this.timeout = timeout;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }
}
