
package com.siebel.xml.sgz_20service_20request_20website;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for SgzEmcDocs complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="SgzEmcDocs">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="Comment" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="DocType" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="DocFileDate" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="DocFileExt" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="DocFileName" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="DocFileSize" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="DocumentumId" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "SgzEmcDocs", propOrder = {
    "comment",
    "docType",
    "docFileDate",
    "docFileExt",
    "docFileName",
    "docFileSize",
    "documentumId"
})
public class SgzEmcDocs {

    @XmlElement(name = "Comment")
    protected String comment;
    @XmlElement(name = "DocType")
    protected String docType;
    @XmlElement(name = "DocFileDate")
    protected String docFileDate;
    @XmlElement(name = "DocFileExt")
    protected String docFileExt;
    @XmlElement(name = "DocFileName", required = true)
    protected String docFileName;
    @XmlElement(name = "DocFileSize")
    protected String docFileSize;
    @XmlElement(name = "DocumentumId", required = true)
    protected String documentumId;

    /**
     * Gets the value of the comment property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getComment() {
        return comment;
    }

    /**
     * Sets the value of the comment property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setComment(String value) {
        this.comment = value;
    }

    /**
     * Gets the value of the docType property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDocType() {
        return docType;
    }

    /**
     * Sets the value of the docType property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDocType(String value) {
        this.docType = value;
    }

    /**
     * Gets the value of the docFileDate property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDocFileDate() {
        return docFileDate;
    }

    /**
     * Sets the value of the docFileDate property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDocFileDate(String value) {
        this.docFileDate = value;
    }

    /**
     * Gets the value of the docFileExt property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDocFileExt() {
        return docFileExt;
    }

    /**
     * Sets the value of the docFileExt property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDocFileExt(String value) {
        this.docFileExt = value;
    }

    /**
     * Gets the value of the docFileName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDocFileName() {
        return docFileName;
    }

    /**
     * Sets the value of the docFileName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDocFileName(String value) {
        this.docFileName = value;
    }

    /**
     * Gets the value of the docFileSize property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDocFileSize() {
        return docFileSize;
    }

    /**
     * Sets the value of the docFileSize property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDocFileSize(String value) {
        this.docFileSize = value;
    }

    /**
     * Gets the value of the documentumId property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDocumentumId() {
        return documentumId;
    }

    /**
     * Sets the value of the documentumId property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDocumentumId(String value) {
        this.documentumId = value;
    }

}
