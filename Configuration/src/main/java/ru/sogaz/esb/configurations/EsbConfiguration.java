package ru.sogaz.esb.configurations;


import ru.sogaz.esb.configurations.type.ConfigEndpointType;

public class EsbConfiguration extends AbstractConfiguration {

    /**
     * @param cfgFilePath
     * @param refreshDelay
     */
    public EsbConfiguration(String cfgFilePath, int refreshDelay) {
        super(cfgFilePath, refreshDelay);
    }

    //------------------------------------------------E-MAIL------------------------------------------------//
    public ConfigEndpointType getEmailSmtpEndpoint() {
        return getURL("ESB.Email.Smtp-URL");
    }

    public ConfigEndpointType getEmailImapEndpoint() {
        return getURL("ESB.Email.Imap-URL");
    }

    public int getEmailImapPort() {
        return getInt("ESB.Email.ImapPort", 993);
    }

    public int getEmailSmtpPort() {
        return getInt("ESB.Email.SmtpPort", 465);
    }

    public ConfigEndpointType getSiebelEndpoint() {
        return getURL("ESB.Siebel.URL");
    }

    public ConfigEndpointType getDocumentumEndpoint() {
        return getURL("ESB.Documentum.URL");
    }

    public String getAdminEmail() {
        return getString("ESB.Email.AdminEmail", "admin@sogaz.ru");
    }

    public String getFromEmail() {
        return getString("ESB.Email.FromEmail", "davetikov@siblion.ru");
    }

}
