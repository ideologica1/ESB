package ru.sogaz.esb.adapter.documentum.model;

/**
 * @author DNAvetik
 * 02.03.2018.
 */

import javax.xml.bind.annotation.XmlElement;

public class Link {

    @XmlElement(name = "rel")
    private String rel;

    @XmlElement(name = "href")
    private String href;

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
