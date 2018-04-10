package ru.sogaz.esb.adapter.documentum.model;

/**
 * @author DNAvetik
 * 02.03.2018.
 */

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;

@JsonIgnoreProperties
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Link {


    private String rel;


    private String href;

    public Link() {
    }

    public String getRel() {
        return rel;
    }

    public void setRel(String rel) {
        this.rel = rel;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }
}
