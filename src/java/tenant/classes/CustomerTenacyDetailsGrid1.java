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
 * @author Vaijayanti
 */
@Entity
@Table(name = "customer_tenancy_details_grid1", schema = "arete_tms")     

public class CustomerTenacyDetailsGrid1 implements java.io.Serializable{
    
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
    private Boolean status;
    private Date lastmodifiedDate;

    public CustomerTenacyDetailsGrid1(){
    }

    public CustomerTenacyDetailsGrid1(String orgId, String userId, String quotationNo1, String customerType1, String customerName1, String tenantId1, String businessName1, String businessCrNumber1, String contactPerson1, String registeredEmailID1, String phoneNo1, Boolean status, Date lastmodifiedDate) {
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
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public CustomerTenacyDetailsGrid1(Integer sno, String orgId, String userId, String quotationNo1, String customerType1, String customerName1, String tenantId1, String businessName1, String businessCrNumber1, String contactPerson1, String registeredEmailID1, String phoneNo1, Boolean status, Date lastmodifiedDate) {
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
