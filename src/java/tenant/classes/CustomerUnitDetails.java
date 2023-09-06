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
@Table(name = "customer_unit_details", schema = "arete_tms"
)       
public class CustomerUnitDetails implements java.io.Serializable{
    
    private Integer sno;
    private String orgId;
    private String userId;
    private String customerName;
    private String customerReference;
    private String customerRefId;
    private String customerId;
    private String customerType;
    private String businessName;
    private String crNo;
    private String customerPerson;
    private String customerEmailId;
    private String phoneNo;
    private String unitNo;
    private String contractCode;
    private String propertyName;
    private String propertyCode;
    private String billingAddress;
    private String permanentAddress;
    private String jointeeName1;
    private String jointeeName2;
    private String jointeeAddress1;
    private String jointeeAddress2;
    private String sponsorName;
    private String ifWorking;
    private String SponserAddress;
    private String sponsorEmailId;
    private String document;
    private String idCardType;
    private String status;
    private Date creationDate;
    private Date lastmodifiedDate;
    
    public  CustomerUnitDetails(){
        
    }

    
    //Corporate
    public CustomerUnitDetails(Integer sno, String orgId, String userId, String customerName, String customerReference, String customerRefId,
            String customerId, String customerType, String businessName, String crNo, String customerPerson, String customerEmailId, String phoneNo,
            String unitNo, String contractCode, String propertyName, String propertyCode, String status, Date creationDate, Date lastmodifiedDate) {
        this.sno = sno;
        this.orgId = orgId;
        this.userId = userId;
        this.customerName = customerName;
        this.customerReference = customerReference;
        this.customerRefId = customerRefId;
        this.customerId = customerId;
        this.customerType = customerType;
        this.businessName = businessName;
        this.crNo = crNo;
        this.customerPerson = customerPerson;
        this.customerEmailId = customerEmailId;
        this.phoneNo = phoneNo;
        this.unitNo = unitNo;
        this.contractCode = contractCode;
        this.propertyName = propertyName;
        this.propertyCode = propertyCode;
        this.status = status;
        this.creationDate = creationDate;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public CustomerUnitDetails( String orgId, String userId, String customerName, String customerReference, String customerRefId,
            String customerId, String customerType, String businessName, String crNo, String customerPerson, String customerEmailId, String phoneNo,
            String unitNo, String contractCode, String propertyName, String propertyCode, String status, Date creationDate, Date lastmodifiedDate) {
       
        this.orgId = orgId;
        this.userId = userId;
        this.customerName = customerName;
        this.customerReference = customerReference;
        this.customerRefId = customerRefId;
        this.customerId = customerId;
        this.customerType = customerType;
        this.businessName = businessName;
        this.crNo = crNo;
        this.customerPerson = customerPerson;
        this.customerEmailId = customerEmailId;
        this.phoneNo = phoneNo;
        this.unitNo = unitNo;
        this.contractCode = contractCode;
        this.propertyName = propertyName;
        this.propertyCode = propertyCode;
        this.status = status;
        this.creationDate = creationDate;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    //Residential
    public CustomerUnitDetails(String orgId, String userId, String customerName, String customerReference, String customerRefId,
            String customerId, String customerType, String customerPerson, String customerEmailId, String phoneNo, String unitNo, String contractCode,
            String propertyName, String propertyCode, String billingAddress, String permanentAddress, String jointeeName1, String jointeeName2,
            String jointeeAddress1, String jointeeAddress2, String sponsorName, String ifWorking, String SponserAddress, String sponsorEmailId,
            String document, String idCardType, String status, Date creationDate, Date lastmodifiedDate) {
       
        this.orgId = orgId;
        this.userId = userId;
        this.customerName = customerName;
        this.customerReference = customerReference;
        this.customerRefId = customerRefId;
        this.customerId = customerId;
        this.customerType = customerType;
        this.customerPerson = customerPerson;
        this.customerEmailId = customerEmailId;
        this.phoneNo = phoneNo;
        this.unitNo = unitNo;
        this.contractCode = contractCode;
        this.propertyName = propertyName;
        this.propertyCode = propertyCode;
        this.billingAddress = billingAddress;
        this.permanentAddress = permanentAddress;
        this.jointeeName1 = jointeeName1;
        this.jointeeName2 = jointeeName2;
        this.jointeeAddress1 = jointeeAddress1;
        this.jointeeAddress2 = jointeeAddress2;
        this.sponsorName = sponsorName;
        this.ifWorking = ifWorking;
        this.SponserAddress = SponserAddress;
        this.sponsorEmailId = sponsorEmailId;
        this.document = document;
        this.idCardType = idCardType;
        this.status = status;
        this.creationDate = creationDate;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public CustomerUnitDetails(Integer sno,String orgId, String userId, String customerName, String customerReference, String customerRefId,
            String customerId, String customerType, String customerPerson, String customerEmailId, String phoneNo, String unitNo, String contractCode,
            String propertyName, String propertyCode, String billingAddress, String permanentAddress, String jointeeName1, String jointeeName2,
            String jointeeAddress1, String jointeeAddress2, String sponsorName, String ifWorking, String SponserAddress, String sponsorEmailId,
            String document, String idCardType, String status, Date creationDate, Date lastmodifiedDate) {
        this.sno = sno;
        this.orgId = orgId;
        this.userId = userId;
        this.customerName = customerName;
        this.customerReference = customerReference;
        this.customerRefId = customerRefId;
        this.customerId = customerId;
        this.customerType = customerType;
        this.customerPerson = customerPerson;
        this.customerEmailId = customerEmailId;
        this.phoneNo = phoneNo;
        this.unitNo = unitNo;
        this.contractCode = contractCode;
        this.propertyName = propertyName;
        this.propertyCode = propertyCode;
        this.billingAddress = billingAddress;
        this.permanentAddress = permanentAddress;
        this.jointeeName1 = jointeeName1;
        this.jointeeName2 = jointeeName2;
        this.jointeeAddress1 = jointeeAddress1;
        this.jointeeAddress2 = jointeeAddress2;
        this.sponsorName = sponsorName;
        this.ifWorking = ifWorking;
        this.SponserAddress = SponserAddress;
        this.sponsorEmailId = sponsorEmailId;
        this.document = document;
        this.idCardType = idCardType;
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

    @Column(name = "customer_name")
    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    @Column(name = "customer_reference")
    public String getCustomerReference() {
        return customerReference;
    }

    public void setCustomerReference(String customerReference) {
        this.customerReference = customerReference;
    }

    @Column(name = "customer_reference_id")
    public String getCustomerRefId() {
        return customerRefId;
    }

    public void setCustomerRefId(String customerRefId) {
        this.customerRefId = customerRefId;
    }

    @Column(name = "customer_id")
    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    @Column(name = "customer_type")
    public String getCustomerType() {
        return customerType;
    }

    public void setCustomerType(String customerType) {
        this.customerType = customerType;
    }

    @Column(name = "customer_person")
    public String getCustomerPerson() {
        return customerPerson;
    }

    public void setCustomerPerson(String customerPerson) {
        this.customerPerson = customerPerson;
    }

    @Column(name = "customer_email_id")
    public String getCustomerEmailId() {
        return customerEmailId;
    }

    public void setCustomerEmailId(String customerEmailId) {
        this.customerEmailId = customerEmailId;
    }

    @Column(name = "phone_no")
    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    @Column(name = "unit_no")
    public String getUnitNo() {
        return unitNo;
    }

    public void setUnitNo(String unitNo) {
        this.unitNo = unitNo;
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

    @Column(name = "property_code")
    public String getPropertyCode() {
        return propertyCode;
    }

    public void setPropertyCode(String propertyCode) {
        this.propertyCode = propertyCode;
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

    @Column(name = "business_name")
    public String getBusinessName() {
        return businessName;
    }

    public void setBusinessName(String businessName) {
        this.businessName = businessName;
    }

    @Column(name = "cr_no")
    public String getCrNo() {
        return crNo;
    }

    public void setCrNo(String crNo) {
        this.crNo = crNo;
    }

    @Column(name = "billing_address")
    public String getBillingAddress() {
        return billingAddress;
    }

    public void setBillingAddress(String billingAddress) {
        this.billingAddress = billingAddress;
    }

    @Column(name = "permanent_address")
    public String getPermanentAddress() {
        return permanentAddress;
    }

    public void setPermanentAddress(String permanentAddress) {
        this.permanentAddress = permanentAddress;
    }

    @Column(name = "jointee_name1")
    public String getJointeeName1() {
        return jointeeName1;
    }

    public void setJointeeName1(String jointeeName1) {
        this.jointeeName1 = jointeeName1;
    }

    @Column(name = "jointee_name2")
    public String getJointeeName2() {
        return jointeeName2;
    }

    public void setJointeeName2(String jointeeName2) {
        this.jointeeName2 = jointeeName2;
    }

    @Column(name = "jointee_address1")
    public String getJointeeAddress1() {
        return jointeeAddress1;
    }

    public void setJointeeAddress1(String jointeeAddress1) {
        this.jointeeAddress1 = jointeeAddress1;
    }

    @Column(name = "jointee_address2")
    public String getJointeeAddress2() {
        return jointeeAddress2;
    }

    public void setJointeeAddress2(String jointeeAddress2) {
        this.jointeeAddress2 = jointeeAddress2;
    }

    @Column(name = "sponser_name")
    public String getSponsorName() {
        return sponsorName;
    }

    public void setSponsorName(String sponsorName) {
        this.sponsorName = sponsorName;
    }

    @Column(name = "if_working")
    public String getIfWorking() {
        return ifWorking;
    }

    public void setIfWorking(String ifWorking) {
        this.ifWorking = ifWorking;
    }

    @Column(name = "sponser_address")
    public String getSponserAddress() {
        return SponserAddress;
    }

    public void setSponserAddress(String SponserAddress) {
        this.SponserAddress = SponserAddress;
    }

    @Column(name = "sponsor_email_id")
    public String getSponsorEmailId() {
        return sponsorEmailId;
    }

    public void setSponsorEmailId(String sponsorEmailId) {
        this.sponsorEmailId = sponsorEmailId;
    }

    @Column(name = "document")
    public String getDocument() {
        return document;
    }

    public void setDocument(String document) {
        this.document = document;
    }

    @Column(name = "id_card_type")
    public String getIdCardType() {
        return idCardType;
    }

    public void setIdCardType(String idCardType) {
        this.idCardType = idCardType;
    }
    
    
    
}
