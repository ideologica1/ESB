package ru.sogaz.esb.model;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author DNAvetik
 * 06.03.2018.
 */
@XmlRootElement(name = "email_message")
@XmlAccessorType(XmlAccessType.FIELD)
public class EmailMessage {

    @XmlElement(name = "to")
    private String to;

    @XmlElement(name = "cc")
    private String cc;

    @XmlElement(name = "bcc")
    private String bcc;

    @XmlElement(name = "subject")
    private String subject;

    @XmlElement(name = "message_body")
    private String text;

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getCc() {
        return cc;
    }

    public void setCc(String cc) {
        this.cc = cc;
    }

    public String getBcc() {
        return bcc;
    }

    public void setBcc(String bcc) {
        this.bcc = bcc;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    @Override
    public String toString() {
        return "{" +
                "to='" + to + '\'' +
                ", cc='" + cc + '\'' +
                ", bcc='" + bcc + '\'' +
                ", subject='" + subject + '\'' +
                ", text='" + text + '\'' +
                '}';
    }
}
