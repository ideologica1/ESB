
package com.siebel.xml.sgz_20service_20request_20website;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the com.siebel.xml.sgz_20service_20request_20website package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _ListOfSgzServiceRequestWebsite_QNAME = new QName("http://www.siebel.com/xml/SGZ%20Service%20Request%20Website", "ListOfSgzServiceRequestWebsite");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: com.siebel.xml.sgz_20service_20request_20website
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link ListOfSgzServiceRequestWebsite }
     * 
     */
    public ListOfSgzServiceRequestWebsite createListOfSgzServiceRequestWebsite() {
        return new ListOfSgzServiceRequestWebsite();
    }

    /**
     * Create an instance of {@link ListOfSgzEmcDocs }
     * 
     */
    public ListOfSgzEmcDocs createListOfSgzEmcDocs() {
        return new ListOfSgzEmcDocs();
    }

    /**
     * Create an instance of {@link SgzEmcDocs }
     * 
     */
    public SgzEmcDocs createSgzEmcDocs() {
        return new SgzEmcDocs();
    }

    /**
     * Create an instance of {@link ListOfSgzServiceRequestWebsiteTopElmt }
     * 
     */
    public ListOfSgzServiceRequestWebsiteTopElmt createListOfSgzServiceRequestWebsiteTopElmt() {
        return new ListOfSgzServiceRequestWebsiteTopElmt();
    }

    /**
     * Create an instance of {@link ServiceRequest }
     * 
     */
    public ServiceRequest createServiceRequest() {
        return new ServiceRequest();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ListOfSgzServiceRequestWebsite }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://www.siebel.com/xml/SGZ%20Service%20Request%20Website", name = "ListOfSgzServiceRequestWebsite")
    public JAXBElement<ListOfSgzServiceRequestWebsite> createListOfSgzServiceRequestWebsite(ListOfSgzServiceRequestWebsite value) {
        return new JAXBElement<ListOfSgzServiceRequestWebsite>(_ListOfSgzServiceRequestWebsite_QNAME, ListOfSgzServiceRequestWebsite.class, null, value);
    }

}
