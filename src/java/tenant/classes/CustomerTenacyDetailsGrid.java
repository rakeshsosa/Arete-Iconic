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
@Table(name = "customer_tenancy_details_grid", schema = "arete_tms")          
public class CustomerTenacyDetailsGrid implements java.io.Serializable{
    
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
    private Boolean status;
    private Date lastmodifiedDate;

    public CustomerTenacyDetailsGrid(){
    }
    
    public CustomerTenacyDetailsGrid(String orgId, String userId, String customerType, String customerName, String tenantId, String businessName, String businessCrNumber, String contactPerson, 
            String registeredEmailID, String phoneNo,Boolean status,Date lastmodifiedDate, String quotationNo) {
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
         this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;   
        this.quotationNo = quotationNo;
    }
    
    public CustomerTenacyDetailsGrid(Integer sno, String orgId, String userId, String customerType, 
            String customerName, String tenantId, String businessName, String businessCrNumber, String contactPerson, 
            String registeredEmailID, String phoneNo,Boolean status,Date lastmodifiedDate, String quotationNo) {
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
}
