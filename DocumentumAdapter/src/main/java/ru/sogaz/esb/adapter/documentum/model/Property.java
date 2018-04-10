package ru.sogaz.esb.adapter.documentum.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;

/**
 * @author DNAvetik
 * 02.03.2018.
 */

@JsonIgnoreProperties
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Property {


    @JsonProperty("r_object_type")
    private String objectType;

    @JsonProperty("object_name")
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

    public Property() {
    }

    public void setTitle(String title) {

        this.title = title;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public void setAuthors(String authors) {
        this.authors = authors;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public void setA_application_type(String a_application_type) {
        this.a_application_type = a_application_type;
    }

    public void setA_status(String a_status) {
        this.a_status = a_status;
    }

    public void setR_creation_date(String r_creation_date) {
        this.r_creation_date = r_creation_date;
    }

    public void setR_modify_date(String r_modify_date) {
        this.r_modify_date = r_modify_date;
    }

    public void setR_modifier(String r_modifier) {
        this.r_modifier = r_modifier;
    }

    public void setR_access_date(String r_access_date) {
        this.r_access_date = r_access_date;
    }

    public void setA_is_hidden(Boolean a_is_hidden) {
        this.a_is_hidden = a_is_hidden;
    }

    public void setI_is_deleted(Boolean i_is_deleted) {
        this.i_is_deleted = i_is_deleted;
    }

    public void setA_retention_date(String a_retention_date) {
        this.a_retention_date = a_retention_date;
    }

    public void setA_archive(Boolean a_archive) {
        this.a_archive = a_archive;
    }

    public void setA_compound_architecture(String a_compound_architecture) {
        this.a_compound_architecture = a_compound_architecture;
    }

    public void setA_link_resolved(Boolean a_link_resolved) {
        this.a_link_resolved = a_link_resolved;
    }
}
