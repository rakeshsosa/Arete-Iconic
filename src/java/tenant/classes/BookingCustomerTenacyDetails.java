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
@Table(name = "booking_customer_tenancy_details", schema = "arete_tms")
public class BookingCustomerTenacyDetails implements java.io.Serializable{

    private Integer sno;
    private String orgId;
    private String userId;
    private String bookingId;
    private  String quotationNo;
    private String customerType;
    private String customerName;
    private String tenantId;
    private String businessName;
    private String businessCrNumber;
    private String contactPerson;
    private String registeredEmailID;
    private String phoneNo;
    private String status;
    private Date lastmodifiedDate;

    public BookingCustomerTenacyDetails(){
    }

    public BookingCustomerTenacyDetails(String orgId, String userId, String bookingId, String quotationNo, String customerType, String customerName, String tenantId, 
            String businessName, String businessCrNumber, String contactPerson, String registeredEmailID, String phoneNo, String status, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.bookingId = bookingId;
        this.quotationNo = quotationNo;
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
    }

    public BookingCustomerTenacyDetails(Integer sno, String orgId, String userId, String bookingId, String quotationNo, String customerType, String customerName, 
            String tenantId, String businessName, String businessCrNumber, String contactPerson, String registeredEmailID, String phoneNo, String status, Date lastmodifiedDate) {
        this.sno = sno;
        this.orgId = orgId;
        this.userId = userId;
        this.bookingId = bookingId;
        this.quotationNo = quotationNo;
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
     
    @Column(name = "STATUS")
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
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
    
    @Column(name = "quotation_no")
    public String getQuotationNo() {
        return quotationNo;
    }

    public void setQuotationNo(String quotationNo) {
        this.quotationNo = quotationNo;
    }
    
    @Column(name = "booking_id")
    public String getBookingId() {
        return bookingId;
    }

    public void setBookingId(String bookingId) {
        this.bookingId = bookingId;
    }
    
}
