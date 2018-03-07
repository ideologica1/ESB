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

    private String title;
    private String subject;
    private String authors;
    private String keywords;
    private String a_application_type;
    private String a_status;
    private String r_creation_date;
    private String r_modify_date;
    private String r_modifier;
    private String r_access_date;
    private Boolean a_is_hidden;
    private Boolean i_is_deleted;
    private String a_retention_date;
    private Boolean a_archive;
    private String a_compound_architecture;
    private Boolean a_link_resolved;


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

    public String getTitle() {
        return title;
    }

    public String getSubject() {
        return subject;
    }

    public String getAuthors() {
        return authors;
    }

    public String getKeywords() {
        return keywords;
    }

    public String getA_application_type() {
        return a_application_type;
    }

    public String getA_status() {
        return a_status;
    }

    public String getR_creation_date() {
        return r_creation_date;
    }

    public String getR_modify_date() {
        return r_modify_date;
    }

    public String getR_modifier() {
        return r_modifier;
    }

    public String getR_access_date() {
        return r_access_date;
    }

    public Boolean getA_is_hidden() {
        return a_is_hidden;
    }

    public Boolean getI_is_deleted() {
        return i_is_deleted;
    }

    public String getA_retention_date() {
        return a_retention_date;
    }

    public Boolean getA_archive() {
        return a_archive;
    }

    public String getA_compound_architecture() {
        return a_compound_architecture;
    }

    public Boolean getA_link_resolved() {
        return a_link_resolved;
    }
}
