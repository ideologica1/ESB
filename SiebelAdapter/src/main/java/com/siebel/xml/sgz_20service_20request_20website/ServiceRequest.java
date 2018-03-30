
package com.siebel.xml.sgz_20service_20request_20website;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for ServiceRequest complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ServiceRequest">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="contract_site" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="ins_product" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="web_request_number" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="birthdate" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="request_date" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="ins_sub-area" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="ins_area" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="email" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="ins_type" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="applicant" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="contact_phone" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="contact_fax" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="Contact_Id" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="LK_Consumer_GUID" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="LK_Id" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="ip_address" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="url_address" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="abstract" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="description" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="SGZProject" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="insurer" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="contract_policy" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="contact_number_new" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="revenue" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="source" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="SGZ_Complaint_Type" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="SGZ_Sub_Complaint_Type" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="SGZ_Agreement_DRP_Flag" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="sub_office" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="contact_guid" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="ins_sub_type" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="complaint_type2" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="customer_status" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="payment_site" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="ListOfSgzEmcDocs" type="{http://www.siebel.com/xml/SGZ%20Service%20Request%20Website}ListOfSgzEmcDocs" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ServiceRequest", propOrder = {
    "contractSite",
    "insProduct",
    "webRequestNumber",
    "birthdate",
    "requestDate",
    "insSubArea",
    "insArea",
    "email",
    "insType",
    "applicant",
    "contactPhone",
    "contactFax",
    "contactId",
    "lkConsumerGUID",
    "lkId",
    "ipAddress",
    "urlAddress",
    "_abstract",
    "description",
    "sgzProject",
    "insurer",
    "contractPolicy",
    "contactNumberNew",
    "revenue",
    "source",
    "sgzComplaintType",
    "sgzSubComplaintType",
    "sgzAgreementDRPFlag",
    "subOffice",
    "contactGuid",
    "insSubType",
    "complaintType2",
    "customerStatus",
    "paymentSite",
    "listOfSgzEmcDocs"
})
public class ServiceRequest {

    @XmlElement(name = "contract_site")
    protected String contractSite;
    @XmlElement(name = "ins_product", required = true)
    protected String insProduct;
    @XmlElement(name = "web_request_number")
    protected String webRequestNumber;
    protected String birthdate;
    @XmlElement(name = "request_date")
    protected String requestDate;
    @XmlElement(name = "ins_sub-area")
    protected String insSubArea;
    @XmlElement(name = "ins_area")
    protected String insArea;
    protected String email;
    @XmlElement(name = "ins_type")
    protected String insType;
    protected String applicant;
    @XmlElement(name = "contact_phone")
    protected String contactPhone;
    @XmlElement(name = "contact_fax")
    protected String contactFax;
    @XmlElement(name = "Contact_Id")
    protected String contactId;
    @XmlElement(name = "LK_Consumer_GUID")
    protected String lkConsumerGUID;
    @XmlElement(name = "LK_Id")
    protected String lkId;
    @XmlElement(name = "ip_address")
    protected String ipAddress;
    @XmlElement(name = "url_address")
    protected String urlAddress;
    @XmlElement(name = "abstract")
    protected String _abstract;
    protected String description;
    @XmlElement(name = "SGZProject")
    protected String sgzProject;
    protected String insurer;
    @XmlElement(name = "contract_policy")
    protected String contractPolicy;
    @XmlElement(name = "contact_number_new")
    protected String contactNumberNew;
    protected String revenue;
    protected String source;
    @XmlElement(name = "SGZ_Complaint_Type")
    protected String sgzComplaintType;
    @XmlElement(name = "SGZ_Sub_Complaint_Type")
    protected String sgzSubComplaintType;
    @XmlElement(name = "SGZ_Agreement_DRP_Flag")
    protected String sgzAgreementDRPFlag;
    @XmlElement(name = "sub_office")
    protected String subOffice;
    @XmlElement(name = "contact_guid")
    protected String contactGuid;
    @XmlElement(name = "ins_sub_type")
    protected String insSubType;
    @XmlElement(name = "complaint_type2")
    protected String complaintType2;
    @XmlElement(name = "customer_status")
    protected String customerStatus;
    @XmlElement(name = "payment_site")
    protected String paymentSite;
    @XmlElement(name = "ListOfSgzEmcDocs")
    protected ListOfSgzEmcDocs listOfSgzEmcDocs;

    /**
     * Gets the value of the contractSite property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getContractSite() {
        return contractSite;
    }

    /**
     * Sets the value of the contractSite property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setContractSite(String value) {
        this.contractSite = value;
    }

    /**
     * Gets the value of the insProduct property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getInsProduct() {
        return insProduct;
    }

    /**
     * Sets the value of the insProduct property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setInsProduct(String value) {
        this.insProduct = value;
    }

    /**
     * Gets the value of the webRequestNumber property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getWebRequestNumber() {
        return webRequestNumber;
    }

    /**
     * Sets the value of the webRequestNumber property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setWebRequestNumber(String value) {
        this.webRequestNumber = value;
    }

    /**
     * Gets the value of the birthdate property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getBirthdate() {
        return birthdate;
    }

    /**
     * Sets the value of the birthdate property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setBirthdate(String value) {
        this.birthdate = value;
    }

    /**
     * Gets the value of the requestDate property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getRequestDate() {
        return requestDate;
    }

    /**
     * Sets the value of the requestDate property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setRequestDate(String value) {
        this.requestDate = value;
    }

    /**
     * Gets the value of the insSubArea property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getInsSubArea() {
        return insSubArea;
    }

    /**
     * Sets the value of the insSubArea property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setInsSubArea(String value) {
        this.insSubArea = value;
    }

    /**
     * Gets the value of the insArea property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getInsArea() {
        return insArea;
    }

    /**
     * Sets the value of the insArea property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setInsArea(String value) {
        this.insArea = value;
    }

    /**
     * Gets the value of the email property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getEmail() {
        return email;
    }

    /**
     * Sets the value of the email property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setEmail(String value) {
        this.email = value;
    }

    /**
     * Gets the value of the insType property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getInsType() {
        return insType;
    }

    /**
     * Sets the value of the insType property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setInsType(String value) {
        this.insType = value;
    }

    /**
     * Gets the value of the applicant property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getApplicant() {
        return applicant;
    }

    /**
     * Sets the value of the applicant property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setApplicant(String value) {
        this.applicant = value;
    }

    /**
     * Gets the value of the contactPhone property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getContactPhone() {
        return contactPhone;
    }

    /**
     * Sets the value of the contactPhone property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setContactPhone(String value) {
        this.contactPhone = value;
    }

    /**
     * Gets the value of the contactFax property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getContactFax() {
        return contactFax;
    }

    /**
     * Sets the value of the contactFax property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setContactFax(String value) {
        this.contactFax = value;
    }

    /**
     * Gets the value of the contactId property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getContactId() {
        return contactId;
    }

    /**
     * Sets the value of the contactId property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setContactId(String value) {
        this.contactId = value;
    }

    /**
     * Gets the value of the lkConsumerGUID property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getLKConsumerGUID() {
        return lkConsumerGUID;
    }

    /**
     * Sets the value of the lkConsumerGUID property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setLKConsumerGUID(String value) {
        this.lkConsumerGUID = value;
    }

    /**
     * Gets the value of the lkId property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getLKId() {
        return lkId;
    }

    /**
     * Sets the value of the lkId property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setLKId(String value) {
        this.lkId = value;
    }

    /**
     * Gets the value of the ipAddress property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getIpAddress() {
        return ipAddress;
    }

    /**
     * Sets the value of the ipAddress property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setIpAddress(String value) {
        this.ipAddress = value;
    }

    /**
     * Gets the value of the urlAddress property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getUrlAddress() {
        return urlAddress;
    }

    /**
     * Sets the value of the urlAddress property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUrlAddress(String value) {
        this.urlAddress = value;
    }

    /**
     * Gets the value of the abstract property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getAbstract() {
        return _abstract;
    }

    /**
     * Sets the value of the abstract property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setAbstract(String value) {
        this._abstract = value;
    }

    /**
     * Gets the value of the description property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDescription() {
        return description;
    }

    /**
     * Sets the value of the description property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDescription(String value) {
        this.description = value;
    }

    /**
     * Gets the value of the sgzProject property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSGZProject() {
        return sgzProject;
    }

    /**
     * Sets the value of the sgzProject property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSGZProject(String value) {
        this.sgzProject = value;
    }

    /**
     * Gets the value of the insurer property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getInsurer() {
        return insurer;
    }

    /**
     * Sets the value of the insurer property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setInsurer(String value) {
        this.insurer = value;
    }

    /**
     * Gets the value of the contractPolicy property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getContractPolicy() {
        return contractPolicy;
    }

    /**
     * Sets the value of the contractPolicy property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setContractPolicy(String value) {
        this.contractPolicy = value;
    }

    /**
     * Gets the value of the contactNumberNew property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getContactNumberNew() {
        return contactNumberNew;
    }

    /**
     * Sets the value of the contactNumberNew property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setContactNumberNew(String value) {
        this.contactNumberNew = value;
    }

    /**
     * Gets the value of the revenue property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getRevenue() {
        return revenue;
    }

    /**
     * Sets the value of the revenue property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setRevenue(String value) {
        this.revenue = value;
    }

    /**
     * Gets the value of the source property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSource() {
        return source;
    }

    /**
     * Sets the value of the source property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSource(String value) {
        this.source = value;
    }

    /**
     * Gets the value of the sgzComplaintType property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSGZComplaintType() {
        return sgzComplaintType;
    }

    /**
     * Sets the value of the sgzComplaintType property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSGZComplaintType(String value) {
        this.sgzComplaintType = value;
    }

    /**
     * Gets the value of the sgzSubComplaintType property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSGZSubComplaintType() {
        return sgzSubComplaintType;
    }

    /**
     * Sets the value of the sgzSubComplaintType property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSGZSubComplaintType(String value) {
        this.sgzSubComplaintType = value;
    }

    /**
     * Gets the value of the sgzAgreementDRPFlag property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSGZAgreementDRPFlag() {
        return sgzAgreementDRPFlag;
    }

    /**
     * Sets the value of the sgzAgreementDRPFlag property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSGZAgreementDRPFlag(String value) {
        this.sgzAgreementDRPFlag = value;
    }

    /**
     * Gets the value of the subOffice property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSubOffice() {
        return subOffice;
    }

    /**
     * Sets the value of the subOffice property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSubOffice(String value) {
        this.subOffice = value;
    }

    /**
     * Gets the value of the contactGuid property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getContactGuid() {
        return contactGuid;
    }

    /**
     * Sets the value of the contactGuid property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setContactGuid(String value) {
        this.contactGuid = value;
    }

    /**
     * Gets the value of the insSubType property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getInsSubType() {
        return insSubType;
    }

    /**
     * Sets the value of the insSubType property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setInsSubType(String value) {
        this.insSubType = value;
    }

    /**
     * Gets the value of the complaintType2 property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getComplaintType2() {
        return complaintType2;
    }

    /**
     * Sets the value of the complaintType2 property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setComplaintType2(String value) {
        this.complaintType2 = value;
    }

    /**
     * Gets the value of the customerStatus property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustomerStatus() {
        return customerStatus;
    }

    /**
     * Sets the value of the customerStatus property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustomerStatus(String value) {
        this.customerStatus = value;
    }

    /**
     * Gets the value of the paymentSite property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPaymentSite() {
        return paymentSite;
    }

    /**
     * Sets the value of the paymentSite property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPaymentSite(String value) {
        this.paymentSite = value;
    }

    /**
     * Gets the value of the listOfSgzEmcDocs property.
     * 
     * @return
     *     possible object is
     *     {@link ListOfSgzEmcDocs }
     *     
     */
    public ListOfSgzEmcDocs getListOfSgzEmcDocs() {
        return listOfSgzEmcDocs;
    }

    /**
     * Sets the value of the listOfSgzEmcDocs property.
     * 
     * @param value
     *     allowed object is
     *     {@link ListOfSgzEmcDocs }
     *     
     */
    public void setListOfSgzEmcDocs(ListOfSgzEmcDocs value) {
        this.listOfSgzEmcDocs = value;
    }

    public String getLkConsumerGUID() {
        return lkConsumerGUID;
    }

    public ServiceRequest() {
    }

    public void setLkConsumerGUID(String lkConsumerGUID) {
        this.lkConsumerGUID = lkConsumerGUID;
    }

    public String getLkId() {
        return lkId;
    }

    public void setLkId(String lkId) {
        this.lkId = lkId;
    }

    public String get_abstract() {
        return _abstract;
    }

    public void set_abstract(String _abstract) {
        this._abstract = _abstract;
    }

    public String getSgzProject() {
        return sgzProject;
    }

    public void setSgzProject(String sgzProject) {
        this.sgzProject = sgzProject;
    }

    public String getSgzComplaintType() {
        return sgzComplaintType;
    }

    public void setSgzComplaintType(String sgzComplaintType) {
        this.sgzComplaintType = sgzComplaintType;
    }

    public String getSgzSubComplaintType() {
        return sgzSubComplaintType;
    }

    public void setSgzSubComplaintType(String sgzSubComplaintType) {
        this.sgzSubComplaintType = sgzSubComplaintType;
    }

    public String getSgzAgreementDRPFlag() {
        return sgzAgreementDRPFlag;
    }

    public void setSgzAgreementDRPFlag(String sgzAgreementDRPFlag) {
        this.sgzAgreementDRPFlag = sgzAgreementDRPFlag;
    }
}
