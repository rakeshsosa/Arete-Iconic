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
 * @author IT SUPPORT
 */
@Entity
@Table(name = "customer_tenancy_details", schema = "arete_tms")             
public class CustomerTenacyDetails implements java.io.Serializable{
    
    private Integer sno;
    private String orgId;
    private String userId;
    private  String quotationNo;
    private String customerType;
    private String customerName;
    private String tenantId;
    private String businessName;
    private String businessCrNumber;
    private String contactPerson;
    private String registeredEmailID;
    private String phoneNo;
    private String billingAddress;
    private String permenamtAddress;
    private String jointeeName1;
    private String jointeeAddress1;
    private String jointeeName2;
    private String jointeeAddress2;
    private String sponsorName;
    private String ifWorking;
    private String sponsorAddress;
    private String sponsorEmail;
    private String attachment;
    private String idCardType;
    private Boolean status;
    private Date lastmodifiedDate;

    public CustomerTenacyDetails(){
    }
    
    public CustomerTenacyDetails(String orgId, String userId, String customerType, String customerName, String tenantId, String businessName, String businessCrNumber, String contactPerson, 
            String registeredEmailID, String phoneNo, String billingAddress, String permenamtAddress, String jointeeName1, String jointeeAddress1, String jointeeName2, String jointeeAddress2,String sponsorName,
            String ifWorking, String sponsorAddress, String sponsorEmail, String attachment, String idCardType,Boolean status,Date lastmodifiedDate, String quotationNo) {
        this.orgId = orgId;
        this.userId = userId;
        this.customerType = customerType;
        this.customerName = customerName;
        this.tenantId = tenantId;
        this.businessName = businessName;
        this.businessCrNumber = businessCrNumber;
        this.contactPerson = contactPerson;
        this.registeredEmailID = registeredEmailID;
        this.phoneNo = phoneNo;
        this.billingAddress = billingAddress;
        this.permenamtAddress = permenamtAddress;
        this.jointeeName1 = jointeeName1;
        this.jointeeAddress1 = jointeeAddress1;
        this.jointeeName2 = jointeeName2;
        this.jointeeAddress2 = jointeeAddress2;
        this.sponsorName = sponsorName;
        this.ifWorking = ifWorking;
        this.sponsorAddress = sponsorAddress;
        this.sponsorEmail = sponsorEmail;
        this.attachment = attachment;
        this.idCardType = idCardType;
         this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;   
        this.quotationNo = quotationNo;
    }
    
    public CustomerTenacyDetails(Integer sno, String orgId, String userId, String customerType, String customerName, String tenantId, String businessName, String businessCrNumber, String contactPerson, 
            String registeredEmailID, String phoneNo,String billingAddress, String permenamtAddress, String jointeeName1, String jointeeAddress1, String jointeeName2, String jointeeAddress2, String sponsorName,
            String ifWorking, String sponsorAddress, String sponsorEmail, String attachment, String idCardType,Boolean status,Date lastmodifiedDate, String quotationNo) {
        this.sno = sno;
        this.orgId = orgId;
        this.userId = userId;
        this.customerType = customerType;
        this.customerName = customerName;
        this.tenantId = tenantId;
        this.businessName = businessName;
        this.businessCrNumber = businessCrNumber;
        this.contactPerson = contactPerson;
        this.registeredEmailID = registeredEmailID;
        this.phoneNo = phoneNo;
        this.billingAddress = billingAddress;
        this.permenamtAddress = permenamtAddress;
        this.jointeeName1 = jointeeName1;
        this.jointeeAddress1 = jointeeAddress1;
        this.jointeeName2 = jointeeName2;
        this.jointeeAddress2 = jointeeAddress2;
        this.sponsorName = sponsorName;
        this.ifWorking = ifWorking;
        this.sponsorAddress = sponsorAddress;
        this.sponsorEmail = sponsorEmail;
        this.attachment = attachment;
        this.idCardType = idCardType;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.quotationNo = quotationNo;
        
    }

     @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "s_no", unique = true, nullable = false)
    public Integer getSno() {
        return sno;
    }

    public void setSno(Integer sno) {
        this.sno = sno;
    }

    @Column(name = "org_id", length = 50)
    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

     @Column(name = "user_id", length = 50)
    public String getUserId() {
        return userId;
    }

    
    public void setUserId(String userId) {
        this.userId = userId;
    }

      @Column(name = "customer_type")
    public String getCustomerType() {
        return customerType;
    }

    public void setCustomerType(String customerType) {
        this.customerType = customerType;
    }

      @Column(name = "customer_name")
    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

      @Column(name = "tenant_id")
    public String getTenantId() {
        return tenantId;
    }

    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }

      @Column(name = "business_name")
    public String getBusinessName() {
        return businessName;
    }

    public void setBusinessName(String businessName) {
        this.businessName = businessName;
    }

      @Column(name = "business_cr_number")
    public String getBusinessCrNumber() {
        return businessCrNumber;
    }

    public void setBusinessCrNumber(String businessCrNumber) {
        this.businessCrNumber = businessCrNumber;
    }

      @Column(name = "contact_person")
    public String getContactPerson() {
        return contactPerson;
    }

    public void setContactPerson(String contactPerson) {
        this.contactPerson = contactPerson;
    }

    
      @Column(name = "registered_email_id")
    public String getRegisteredEmailID() {
        return registeredEmailID;
    }

    public void setRegisteredEmailID(String registeredEmailID) {
        this.registeredEmailID = registeredEmailID;
    }

      @Column(name = "phone_no")
    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }
    @Column(name = "status")
    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }
     
   

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "lastmodified_date", length = 19)
    public Date getLastmodifiedDate() {
        return lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }
    
    @Column(name = "quotation_number")
    public String getQuotationNo() {
        return quotationNo;
    }

    public void setQuotationNo(String quotationNo) {
        this.quotationNo = quotationNo;
    }

    @Column(name = "billing_address")
    public String getBillingAddress() {
        return billingAddress;
    }

    public void setBillingAddress(String billingAddress) {
        this.billingAddress = billingAddress;
    }

    @Column(name = "permenant_address")
    public String getPermenamtAddress() {
        return permenamtAddress;
    }

    public void setPermenamtAddress(String permenamtAddress) {
        this.permenamtAddress = permenamtAddress;
    }

    @Column(name = "jointee_name_1")
    public String getJointeeName1() {
        return jointeeName1;
    }

    public void setJointeeName1(String jointeeName1) {
        this.jointeeName1 = jointeeName1;
    }

    @Column(name = "jointee_address_1")
    public String getJointeeAddress1() {
        return jointeeAddress1;
    }

    public void setJointeeAddress1(String jointeeAddress1) {
        this.jointeeAddress1 = jointeeAddress1;
    }

    @Column(name = "jointee_name_2")
    public String getJointeeName2() {
        return jointeeName2;
    }

    public void setJointeeName2(String jointeeName2) {
        this.jointeeName2 = jointeeName2;
    }

    @Column(name = "jointee_address_2")
    public String getJointeeAddress2() {
        return jointeeAddress2;
    }

    public void setJointeeAddress2(String jointeeAddress2) {
        this.jointeeAddress2 = jointeeAddress2;
    }

    @Column(name = "sponsor_name")
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

    @Column(name = "sponsor_address")
    public String getSponsorAddress() {
        return sponsorAddress;
    }

    public void setSponsorAddress(String sponsorAddress) {
        this.sponsorAddress = sponsorAddress;
    }

    @Column(name = "sponsor_email")
    public String getSponsorEmail() {
        return sponsorEmail;
    }

    public void setSponsorEmail(String sponsorEmail) {
        this.sponsorEmail = sponsorEmail;
    }

    @Column(name = "attachment")
    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    @Column(name = "id_card_type")
    public String getIdCardType() {
        return idCardType;
    }

    public void setIdCardType(String idCardType) {
        this.idCardType = idCardType;
    }
    
    
    
    
}
