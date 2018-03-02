package ru.sogaz.esb.model;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;

/**
 * @author DNAvetik
 * 01.03.2018.
 */
@XmlAccessorType(XmlAccessType.FIELD)
public class Contact {

    @XmlElement(name = "fio")
    private String fio;

    @XmlElement(name = "phone")
    private String phone;

    @XmlElement(name = "fax")
    private String fax;

    @XmlElement(name = "email")
    private String email;

    @XmlElement(name = "Contact_Id")
    private Integer contactId;

    @XmlElement(name = "ip")
    private String ip;

    @XmlElement(name = "datetime")
    private String dateTime;

    public String getFio() {
        return fio;
    }

    public void setFio(String fio) {
        this.fio = fio;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getContactId() {
        return contactId;
    }

    public void setContactId(Integer contactId) {
        this.contactId = contactId;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }
}
