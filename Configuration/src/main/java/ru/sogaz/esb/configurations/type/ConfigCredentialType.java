package ru.sogaz.esb.configurations.type;


import java.util.Base64;

/**
 * @author DNAvetik
 * 26.06.17.
 */
public class ConfigCredentialType {
    private String login;
    private String password;

    public ConfigCredentialType() {
    }

    public String getLogin() {
        return this.login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getBase64String() {
        return Base64.getEncoder().encodeToString(
                (getLogin() + ":" + getPassword()).getBytes()
        );
    }
}
