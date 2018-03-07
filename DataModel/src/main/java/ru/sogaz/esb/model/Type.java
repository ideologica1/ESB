package ru.sogaz.esb.model;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;

/**
 * @author DNAvetik
 * 01.03.2018.
 */
@XmlAccessorType(XmlAccessType.FIELD)
public class Type {

    @XmlElement(name = "id")
    private Integer id;

    @XmlElement(name = "name")
    private String name;

    @XmlElement(name = "number")
    private String number;

    @XmlElement(name = "source")
    private String source;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    @Override
    public String toString() {
        return "{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", number='" + number + '\'' +
                ", source='" + source + '\'' +
                '}';
    }
}
