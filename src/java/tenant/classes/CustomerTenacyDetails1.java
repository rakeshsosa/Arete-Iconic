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
@Table(name = "customer_tenancy_details1", schema = "arete_tms")  

public class CustomerTenacyDetails1 implements java.io.Serializable{
    
    private Integer sno;
    private String orgId;
    private String userId;
    private  String quotationNo1;
    private String customerType1;
    private String customerName1;
    private String tenantId1;
    private String businessName1;
    private String businessCrNumber1;
    private String contactPerson1;
    private String registeredEmailID1;
    private String phoneNo1;
    private String billingAddress1;
    private String permenamtAddress1;
    private String jointeeName11;
    private String jointeeAddress11;
    private String jointeeName21;
    private String jointeeAddress21;
    private String sponsorName1;
    private String ifWorking1;
    private String sponsorAddress1;
    private String sponsorEmail1;
    private String attachment1;
    private String idCardType1;
    private Boolean status;
    private Date lastmodifiedDate;

    public CustomerTenacyDetails1(){
    }

    public CustomerTenacyDetails1(String orgId, String userId, String quotationNo1, String customerType1, String customerName1, String tenantId1, String businessName1, String businessCrNumber1, String contactPerson1, String registeredEmailID1, String phoneNo1, String billingAddress1, String permenamtAddress1, String jointeeName11, String jointeeAddress11, String jointeeName21, String jointeeAddress21, String sponsorName1, String ifWorking1, String sponsorAddress1, String sponsorEmail1, String attachment1, String idCardType1, Boolean status, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.quotationNo1 = quotationNo1;
        this.customerType1 = customerType1;
        this.customerName1 = customerName1;
        this.tenantId1 = tenantId1;
        this.businessName1 = businessName1;
        this.businessCrNumber1 = businessCrNumber1;
        this.contactPerson1 = contactPerson1;
        this.registeredEmailID1 = registeredEmailID1;
        this.phoneNo1 = phoneNo1;
        this.billingAddress1 = billingAddress1;
        this.permenamtAddress1 = permenamtAddress1;
        this.jointeeName11 = jointeeName11;
        this.jointeeAddress11 = jointeeAddress11;
        this.jointeeName21 = jointeeName21;
        this.jointeeAddress21 = jointeeAddress21;
        this.sponsorName1 = sponsorName1;
        this.ifWorking1 = ifWorking1;
        this.sponsorAddress1 = sponsorAddress1;
        this.sponsorEmail1 = sponsorEmail1;
        this.attachment1 = attachment1;
        this.idCardType1 = idCardType1;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public CustomerTenacyDetails1(Integer sno, String orgId, String userId, String quotationNo1, String customerType1, String customerName1, String tenantId1, String businessName1, String businessCrNumber1, String contactPerson1, String registeredEmailID1, String phoneNo1, String billingAddress1, String permenamtAddress1, String jointeeName11, String jointeeAddress11, String jointeeName21, String jointeeAddress21, String sponsorName1, String ifWorking1, String sponsorAddress1, String sponsorEmail1, String attachment1, String idCardType1, Boolean status, Date lastmodifiedDate) {
        this.sno = sno;
        this.orgId = orgId;
        this.userId = userId;
        this.quotationNo1 = quotationNo1;
        this.customerType1 = customerType1;
        this.customerName1 = customerName1;
        this.tenantId1 = tenantId1;
        this.businessName1 = businessName1;
        this.businessCrNumber1 = businessCrNumber1;
        this.contactPerson1 = contactPerson1;
        this.registeredEmailID1 = registeredEmailID1;
        this.phoneNo1 = phoneNo1;
        this.billingAddress1 = billingAddress1;
        this.permenamtAddress1 = permenamtAddress1;
        this.jointeeName11 = jointeeName11;
        this.jointeeAddress11 = jointeeAddress11;
        this.jointeeName21 = jointeeName21;
        this.jointeeAddress21 = jointeeAddress21;
        this.sponsorName1 = sponsorName1;
        this.ifWorking1 = ifWorking1;
        this.sponsorAddress1 = sponsorAddress1;
        this.sponsorEmail1 = sponsorEmail1;
        this.attachment1 = attachment1;
        this.idCardType1 = idCardType1;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
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

    @Column(name = "quotation_number1")
    public String getQuotationNo1() {
        return quotationNo1;
    }

    public void setQuotationNo1(String quotationNo1) {
        this.quotationNo1 = quotationNo1;
    }

     @Column(name = "customer_type1")
    public String getCustomerType1() {
        return customerType1;
    }

    public void setCustomerType1(String customerType1) {
        this.customerType1 = customerType1;
    }

     @Column(name = "customer_name1")
    public String getCustomerName1() {
        return customerName1;
    }

    public void setCustomerName1(String customerName1) {
        this.customerName1 = customerName1;
    }

    @Column(name = "tenant_id1")
    public String getTenantId1() {
        return tenantId1;
    }

    public void setTenantId1(String tenantId1) {
        this.tenantId1 = tenantId1;
    }

    @Column(name = "business_name1")
    public String getBusinessName1() {
        return businessName1;
    }

    public void setBusinessName1(String businessName1) {
        this.businessName1 = businessName1;
    }

    @Column(name = "business_cr_number1")
    public String getBusinessCrNumber1() {
        return businessCrNumber1;
    }

    public void setBusinessCrNumber1(String businessCrNumber1) {
        this.businessCrNumber1 = businessCrNumber1;
    }

    @Column(name = "contact_person1")
    public String getContactPerson1() {
        return contactPerson1;
    }

    public void setContactPerson1(String contactPerson1) {
        this.contactPerson1 = contactPerson1;
    }

    @Column(name = "registered_email_id1")
    public String getRegisteredEmailID1() {
        return registeredEmailID1;
    }

    public void setRegisteredEmailID1(String registeredEmailID1) {
        this.registeredEmailID1 = registeredEmailID1;
    }

    @Column(name = "phone_no1")
    public String getPhoneNo1() {
        return phoneNo1;
    }

    public void setPhoneNo1(String phoneNo1) {
        this.phoneNo1 = phoneNo1;
    }

    @Column(name = "billing_address1")
    public String getBillingAddress1() {
        return billingAddress1;
    }

    public void setBillingAddress1(String billingAddress1) {
        this.billingAddress1 = billingAddress1;
    }

    @Column(name = "permanant_address1")
    public String getPermenamtAddress1() {
        return permenamtAddress1;
    }

    public void setPermenamtAddress1(String permenamtAddress1) {
        this.permenamtAddress1 = permenamtAddress1;
    }

    @Column(name = "jointee_name11")
    public String getJointeeName11() {
        return jointeeName11;
    }

    public void setJointeeName11(String jointeeName11) {
        this.jointeeName11 = jointeeName11;
    }

    @Column(name = "jointee_address11")
    public String getJointeeAddress11() {
        return jointeeAddress11;
    }

    public void setJointeeAddress11(String jointeeAddress11) {
        this.jointeeAddress11 = jointeeAddress11;
    }

    @Column(name = "jointee_name21")
    public String getJointeeName21() {
        return jointeeName21;
    }

    public void setJointeeName21(String jointeeName21) {
        this.jointeeName21 = jointeeName21;
    }

    @Column(name = "jointee_address21")
    public String getJointeeAddress21() {
        return jointeeAddress21;
    }

    public void setJointeeAddress21(String jointeeAddress21) {
        this.jointeeAddress21 = jointeeAddress21;
    }

    @Column(name = "sponsor_name1")
    public String getSponsorName1() {
        return sponsorName1;
    }

    public void setSponsorName1(String sponsorName1) {
        this.sponsorName1 = sponsorName1;
    }

    @Column(name = "if_working1")
    public String getIfWorking1() {
        return ifWorking1;
    }

    public void setIfWorking1(String ifWorking1) {
        this.ifWorking1 = ifWorking1;
    }

    @Column(name = "sponsor_address1")
    public String getSponsorAddress1() {
        return sponsorAddress1;
    }

    public void setSponsorAddress1(String sponsorAddress1) {
        this.sponsorAddress1 = sponsorAddress1;
    }

    @Column(name = "Sponsor_email1")
    public String getSponsorEmail1() {
        return sponsorEmail1;
    }

    public void setSponsorEmail1(String sponsorEmail1) {
        this.sponsorEmail1 = sponsorEmail1;
    }

    @Column(name = "attachment1")
    public String getAttachment1() {
        return attachment1;
    }

    public void setAttachment1(String attachment1) {
        this.attachment1 = attachment1;
    }

    @Column(name = "id_card_type1")
    public String getIdCardType1() {
        return idCardType1;
    }

    public void setIdCardType1(String idCardType1) {
        this.idCardType1 = idCardType1;
    }

    @Column(name = "status")
    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    @Column(name = "last_modified_date")
    public Date getLastmodifiedDate() {
        return lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }
    
    
    
    
    
}
