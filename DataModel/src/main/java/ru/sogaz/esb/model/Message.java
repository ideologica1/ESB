package ru.sogaz.esb.model;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.ArrayList;
import java.util.List;

/**
 * @author DNAvetik
 * 01.03.2018.
 */
@XmlRootElement(name = "message")
public class Message {

    @XmlElement(name = "type")
    private Type type;

    @XmlElement(name = "ins_line")
    private InsLine insLine;

    @XmlElement(name = "ins_product")
    private InsProduct insProduct;

    @XmlElement(name = "contact")
    private Contact contact;

    @XmlElement(name = "policy")
    private Policy policy;

    @XmlElement(name = "branch")
    private Branch branch;

    @XmlElement(name = "extra_info")
    private String extraInfo;

    @XmlElement(name = "res_url")
    private String resUrl;

    @XmlElement(name = "links")
    private List<String> links;

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public InsLine getInsLine() {
        return insLine;
    }

    public void setInsLine(InsLine insLine) {
        this.insLine = insLine;
    }

    public InsProduct getInsProduct() {
        return insProduct;
    }

    public void setInsProduct(InsProduct insProduct) {
        this.insProduct = insProduct;
    }

    public Contact getContact() {
        return contact;
    }

    public void setContact(Contact contact) {
        this.contact = contact;
    }

    public Policy getPolicy() {
        return policy;
    }

    public void setPolicy(Policy policy) {
        this.policy = policy;
    }

    public Branch getBranch() {
        return branch;
    }

    public void setBranch(Branch branch) {
        this.branch = branch;
    }

    public String getExtraInfo() {
        return extraInfo;
    }

    public void setExtraInfo(String extraInfo) {
        this.extraInfo = extraInfo;
    }

    public String getResUrl() {
        return resUrl;
    }

    public void setResUrl(String resUrl) {
        this.resUrl = resUrl;
    }

    public List<String> getLinks() {
        if (null == links) {
            links = new ArrayList<>();
        }
        return links;
    }

    @Override
    public String toString() {
        return "{" +
                "type=" + type +
                ", insLine=" + insLine +
                ", insProduct=" + insProduct +
                ", contact=" + contact +
                ", policy=" + policy +
                ", branch=" + branch +
                ", extraInfo='" + extraInfo + '\'' +
                ", resUrl='" + resUrl + '\'' +
                ", links=" + links +
                '}';
    }
}
