package ru.sogaz.esb.adapter.documentum.model;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.ArrayList;
import java.util.List;

/**
 * @author DNAvetik
 * 02.03.2018.
 */
@XmlRootElement(name = "document")
public class Document {

    @XmlElement(name = "name")
    private String name;

    @XmlElement(name = "type")
    private String type;

    @XmlElement(name = "definition")
    private String definition;

    @XmlElement(name = "properties")
    private List<Property> properties;

    @XmlElement(name = "links")
    private List<Link> links;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDefinition() {
        return definition;
    }

    public void setDefinition(String definition) {
        this.definition = definition;
    }

    public List<Property> getProperties() {
        if (null == properties) {
            properties = new ArrayList<>();
        }
        return properties;
    }

    public List<Link> getLinks() {
        if (null == links) {
            links = new ArrayList<>();
        }
        return links;
    }
}
