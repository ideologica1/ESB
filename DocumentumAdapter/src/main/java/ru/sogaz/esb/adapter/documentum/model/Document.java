package ru.sogaz.esb.adapter.documentum.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.ArrayList;
import java.util.List;

/**
 * @author DNAvetik
 * 02.03.2018.
 */

@JsonIgnoreProperties(ignoreUnknown=true)
public class Document {


    private String name;


    private String type;

    public Document() {
    }

    private String definition;


    private List<Property> properties;


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

    public void setProperties(List<Property> properties) {
        this.properties = properties;
    }

    public void setLinks(List<Link> links) {
        this.links = links;
    }
}
