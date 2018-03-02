package ru.sogaz.esb.adapter.documentum.model;

import javax.xml.bind.annotation.XmlElement;

/**
 * @author DNAvetik
 * 02.03.2018.
 */
public class Property {

    @XmlElement(name = "r_object_type", defaultValue = "dm_document")
    private String objectType;

    @XmlElement(name = "object_name")
    private String objectName;

    public String getObjectType() {
        return objectType;
    }

    public void setObjectType(String objectType) {
        this.objectType = objectType;
    }

    public String getObjectName() {
        return objectName;
    }

    public void setObjectName(String objectName) {
        this.objectName = objectName;
    }
}
