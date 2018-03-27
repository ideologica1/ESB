
package com.siebel.xml.sgz_20service_20request_20website;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for ListOfSgzEmcDocs complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ListOfSgzEmcDocs">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="SgzEmcDocs" type="{http://www.siebel.com/xml/SGZ%20Service%20Request%20Website}SgzEmcDocs" maxOccurs="unbounded" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ListOfSgzEmcDocs", propOrder = {
    "sgzEmcDocs"
})
public class ListOfSgzEmcDocs {

    @XmlElement(name = "SgzEmcDocs")
    protected List<SgzEmcDocs> sgzEmcDocs;

    /**
     * Gets the value of the sgzEmcDocs property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the sgzEmcDocs property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getSgzEmcDocs().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link SgzEmcDocs }
     * 
     * 
     */
    public List<SgzEmcDocs> getSgzEmcDocs() {
        if (sgzEmcDocs == null) {
            sgzEmcDocs = new ArrayList<SgzEmcDocs>();
        }
        return this.sgzEmcDocs;
    }

}
