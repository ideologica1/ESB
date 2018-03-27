
package com.siebel.xml.sgz_20service_20request_20website;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for ListOfSgzServiceRequestWebsiteTopElmt complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ListOfSgzServiceRequestWebsiteTopElmt">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="ListOfSgzServiceRequestWebsite" type="{http://www.siebel.com/xml/SGZ%20Service%20Request%20Website}ListOfSgzServiceRequestWebsite"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ListOfSgzServiceRequestWebsiteTopElmt", propOrder = {
    "listOfSgzServiceRequestWebsite"
})
public class ListOfSgzServiceRequestWebsiteTopElmt {

    @XmlElement(name = "ListOfSgzServiceRequestWebsite", required = true)
    protected ListOfSgzServiceRequestWebsite listOfSgzServiceRequestWebsite;

    /**
     * Gets the value of the listOfSgzServiceRequestWebsite property.
     * 
     * @return
     *     possible object is
     *     {@link ListOfSgzServiceRequestWebsite }
     *     
     */
    public ListOfSgzServiceRequestWebsite getListOfSgzServiceRequestWebsite() {
        return listOfSgzServiceRequestWebsite;
    }

    /**
     * Sets the value of the listOfSgzServiceRequestWebsite property.
     * 
     * @param value
     *     allowed object is
     *     {@link ListOfSgzServiceRequestWebsite }
     *     
     */
    public void setListOfSgzServiceRequestWebsite(ListOfSgzServiceRequestWebsite value) {
        this.listOfSgzServiceRequestWebsite = value;
    }

}
