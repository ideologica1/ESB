package ru.sogaz.esb.model;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;

/**
 * @author DNAvetik
 * 01.03.2018.
 */
@XmlAccessorType(XmlAccessType.FIELD)
public class Branch {

    @XmlElement(name = "id_state")
    private Integer idState;

    @XmlElement(name = "name_state")
    private String nameState;

    @XmlElement(name = "id_branch")
    private Integer idBranch;

    @XmlElement(name = "name_branch")
    private String nameBranch;

    @XmlElement(name = "id_dep")
    private Integer idDep;

    @XmlElement(name = "name_dep")
    private String nameDep;

    public Integer getIdState() {
        return idState;
    }

    public void setIdState(Integer idState) {
        this.idState = idState;
    }

    public String getNameState() {
        return nameState;
    }

    public void setNameState(String nameState) {
        this.nameState = nameState;
    }

    public Integer getIdBranch() {
        return idBranch;
    }

    public void setIdBranch(Integer idBranch) {
        this.idBranch = idBranch;
    }

    public String getNameBranch() {
        return nameBranch;
    }

    public void setNameBranch(String nameBranch) {
        this.nameBranch = nameBranch;
    }

    public Integer getIdDep() {
        return idDep;
    }

    public void setIdDep(Integer idDep) {
        this.idDep = idDep;
    }

    public String getNameDep() {
        return nameDep;
    }

    public void setNameDep(String nameDep) {
        this.nameDep = nameDep;
    }

    @Override
    public String toString() {
        return "{" +
                "idState=" + idState +
                ", nameState='" + nameState + '\'' +
                ", idBranch=" + idBranch +
                ", nameBranch='" + nameBranch + '\'' +
                ", idDep=" + idDep +
                ", nameDep='" + nameDep + '\'' +
                '}';
    }
}
