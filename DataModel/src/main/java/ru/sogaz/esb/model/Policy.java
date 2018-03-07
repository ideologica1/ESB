package ru.sogaz.esb.model;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;

/**
 * @author DNAvetik
 * 01.03.2018.
 */
@XmlAccessorType(XmlAccessType.FIELD)
public class Policy {

    @XmlElement(name = "number")
    private String number;

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    @Override
    public String toString() {
        return "{" +
                "number='" + number + '\'' +
                '}';
    }
}
