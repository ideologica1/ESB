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
    public ConfigEndpointType getEmailEndpoint() {
        return getURL("ESB.Email.URL");
    }

    public int getEmailImapPort() {
        return getInt("ESB.Email.ImapPort", 143);
    }

    public int getEmailSmtpPort() {
        return getInt("ESB.Email.SmtpPort", 25);
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
