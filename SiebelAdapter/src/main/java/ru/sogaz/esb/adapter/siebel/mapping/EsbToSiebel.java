package ru.sogaz.esb.adapter.siebel.mapping;

import com.siebel.customui.ImportSRInput;
import com.siebel.xml.sgz_20service_20request_20website.ListOfSgzEmcDocs;
import com.siebel.xml.sgz_20service_20request_20website.ListOfSgzServiceRequestWebsite;
import com.siebel.xml.sgz_20service_20request_20website.ServiceRequest;
import com.siebel.xml.sgz_20service_20request_20website.SgzEmcDocs;
import org.apache.camel.Exchange;
import org.apache.camel.Expression;
import ru.sogaz.esb.model.Message;

import java.util.List;

/**
 * @author DNAvetik
 * 01.03.2018.
 */
public class EsbToSiebel {

    public static ImportSRInput mapping(Message message) {
        ImportSRInput result = new ImportSRInput();

        ListOfSgzServiceRequestWebsite lstSgzSR = new ListOfSgzServiceRequestWebsite();
        List<ServiceRequest> serviceRequestList = lstSgzSR.getServiceRequest();
        ServiceRequest sr = new ServiceRequest();
        sr.setInsProduct(message.getType().getName());
        sr.setInsArea(message.getInsLine().getName());
        sr.setInsSubArea(message.getInsProduct().getName());
        sr.setApplicant(message.getContact().getFio());
        sr.setContactPhone(message.getContact().getPhone());
        sr.setContactFax(message.getContact().getFax());
        sr.setEmail(message.getContact().getEmail());
        sr.setIpAddress(message.getContact().getIp());
        sr.setUrlAddress(message.getResUrl());
        sr.setWebRequestNumber(message.getType().getNumber());
        sr.setRequestDate(message.getContact().getDateTime());
        sr.setAbstract("В случае страхового события по ВПМЖ параметры полиса см. на закладке ВЛОЖЕНИЯ (файл message_h.htm).");
        sr.setDescription(message.getExtraInfo());
        sr.setSource(message.getType().getSource());
        sr.setContractSite(message.getBranch().getNameBranch());
        sr.setSubOffice(String.valueOf(message.getBranch().getIdDep()));

        ListOfSgzEmcDocs listOfSgzEmcDocs = new ListOfSgzEmcDocs();
        List<SgzEmcDocs> sgzEmcDocs = listOfSgzEmcDocs.getSgzEmcDocs();
        for (String link : message.getLinks()) {
            SgzEmcDocs sgzEmcDoc = new SgzEmcDocs();
            String[] linkParts = link.split("[/]");
            sgzEmcDoc.setDocumentumId(linkParts[linkParts.length-1]);
            sgzEmcDocs.add(sgzEmcDoc);
        }
        sr.setListOfSgzEmcDocs(listOfSgzEmcDocs);
        serviceRequestList.add(sr);
        result.setListOfSgzServiceRequestWebsite(lstSgzSR);

        return result;
    }
}
