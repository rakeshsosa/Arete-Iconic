/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.classes;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Munusamy
 */
@Entity
@Table(name = "additional_details", schema = "arete_tms"
)       
public class AdditionalDetails implements java.io.Serializable{
    
    private Integer sno;
    private String orgId;
    private String userId;
    private Integer municipalCharges;
    private Integer maintenanceCharges;
    private String billingCycle;
    private Date billingDueDate;
    private Integer municipalAgreementNo;
    private String municipalFormNo;
    private String document;
    private String contractCode;
    private String propertyName;
    private String propertyCode;
    private String unitNo;
    private String status;
    private Date creationDate;
    private Date lastmodifiedDate;
    
    public AdditionalDetails(){
        
    }

    public AdditionalDetails(String orgId, String userId, Integer municipalCharges, Integer maintenanceCharges, String billingCycle,
            Date billingDueDate, Integer municipalAgreementNo, String municipalFormNo, String document, String contractCode, 
            String propertyName, String propertyCode, String unitNo, String status, Date creationDate, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.municipalCharges = municipalCharges;
        this.maintenanceCharges = maintenanceCharges;
        this.billingCycle = billingCycle;
        this.billingDueDate = billingDueDate;
        this.municipalAgreementNo = municipalAgreementNo;
        this.municipalFormNo = municipalFormNo;
        this.document = document;
        this.contractCode = contractCode;
        this.propertyName = propertyName;
        this.propertyCode = propertyCode;
        this.unitNo = unitNo;
        this.status = status;
        this.creationDate = creationDate;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public AdditionalDetails(Integer sno, String orgId, String userId, Integer municipalCharges, Integer maintenanceCharges, String billingCycle,
            Date billingDueDate, Integer municipalAgreementNo, String municipalFormNo, String document, String contractCode, 
            String propertyName, String propertyCode, String unitNo, String status, Date creationDate, Date lastmodifiedDate) {
        this.sno = sno;
        this.orgId = orgId;
        this.userId = userId;
        this.municipalCharges = municipalCharges;
        this.maintenanceCharges = maintenanceCharges;
        this.billingCycle = billingCycle;
        this.billingDueDate = billingDueDate;
        this.municipalAgreementNo = municipalAgreementNo;
        this.municipalFormNo = municipalFormNo;
        this.document = document;
        this.contractCode = contractCode;
        this.propertyName = propertyName;
        this.propertyCode = propertyCode;
        this.unitNo = unitNo;
        this.status = status;
        this.creationDate = creationDate;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "sno", unique = true, nullable = false)
    public Integer getSno() {
        return sno;
    }

    public void setSno(Integer sno) {
        this.sno = sno;
    }

    @Column(name = "org_id")
    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name = "user_id")
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name = "municipal_charges")    
    public Integer getMunicipalCharges() {
        return municipalCharges;
    }

    public void setMunicipalCharges(Integer municipalCharges) {
        this.municipalCharges = municipalCharges;
    }

     @Column(name = "maintenance_charges")
    public Integer getMaintenanceCharges() {
        return maintenanceCharges;
    }

    public void setMaintenanceCharges(Integer maintenanceCharges) {
        this.maintenanceCharges = maintenanceCharges;
    }

    @Column(name = "billing_cycle")
    public String getBillingCycle() {
        return billingCycle;
    }

    public void setBillingCycle(String billingCycle) {
        this.billingCycle = billingCycle;
    }

    @Column(name = "billing_due_date")
    public Date getBillingDueDate() {
        return billingDueDate;
    }

    public void setBillingDueDate(Date billingDueDate) {
        this.billingDueDate = billingDueDate;
    }

    @Column(name = "municipal_agreement_no")
    public Integer getMunicipalAgreementNo() {
        return municipalAgreementNo;
    }

    public void setMunicipalAgreementNo(Integer municipalAgreementNo) {
        this.municipalAgreementNo = municipalAgreementNo;
    }

    @Column(name = "municipal_form_no")    
    public String getMunicipalFormNo() {
        return municipalFormNo;
    }

    public void setMunicipalFormNo(String municipalFormNo) {
        this.municipalFormNo = municipalFormNo;
    }

    @Column(name = "document")
    public String getDocument() {
        return document;
    }

    public void setDocument(String document) {
        this.document = document;
    }

    @Column(name = "contract_code")
    public String getContractCode() {
        return contractCode;
    }

    public void setContractCode(String contractCode) {
        this.contractCode = contractCode;
    }

    @Column(name = "property_name")
    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    @Column(name = "proprty_code")
    public String getPropertyCode() {
        return propertyCode;
    }

    public void setPropertyCode(String propertyCode) {
        this.propertyCode = propertyCode;
    }

    @Column(name = "unit_no")
    public String getUnitNo() {
        return unitNo;
    }

    public void setUnitNo(String unitNo) {
        this.unitNo = unitNo;
    }

    @Column(name = "status")
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Column(name = "creation_date")
    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "lastmodified_date", length = 19)
    public Date getLastmodifiedDate() {
        return lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }
    
    
    
}
