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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author vaijayanti
 */
@Entity
@Table(name = "terms_condition1", schema = "arete_tms")        
public class TermsCondition1 implements java.io.Serializable{
    
     private Integer sno;
     private String paymentTerms1;
     private String contactTerms1;
     private String addAttachment1;
     //private byte[] attachment;
     private String orgId;
     private String userId;
     
     private String quotationNo1;
     private String bookingId1;
     private Boolean status;
     private Date lastmodifiedDate;

       
    public TermsCondition1() {
    }

    public TermsCondition1(String paymentTerms1, String contactTerms1, String addAttachment1, String orgId, String userId, String quotationNo1, String bookingId1, Boolean status, Date lastmodifiedDate) {
        this.paymentTerms1 = paymentTerms1;
        this.contactTerms1 = contactTerms1;
        this.addAttachment1 = addAttachment1;
        this.orgId = orgId;
        this.userId = userId;
        this.quotationNo1 = quotationNo1;
        this.bookingId1 = bookingId1;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public TermsCondition1(Integer sno, String paymentTerms1, String contactTerms1, String addAttachment1, String orgId, String userId, String quotationNo1, String bookingId1, Boolean status, Date lastmodifiedDate) {
        this.sno = sno;
        this.paymentTerms1 = paymentTerms1;
        this.contactTerms1 = contactTerms1;
        this.addAttachment1 = addAttachment1;
        this.orgId = orgId;
        this.userId = userId;
        this.quotationNo1 = quotationNo1;
        this.bookingId1 = bookingId1;
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

    @Column(name = "payment_terms1")
    public String getPaymentTerms1() {
        return paymentTerms1;
    }

    public void setPaymentTerms1(String paymentTerms1) {
        this.paymentTerms1 = paymentTerms1;
    }

    @Column(name = "contract_terms1")
    public String getContactTerms1() {
        return contactTerms1;
    }

    public void setContactTerms1(String contactTerms1) {
        this.contactTerms1 = contactTerms1;
    }

    @Column(name = "attachment1")
    public String getAddAttachment1() {
        return addAttachment1;
    }

    public void setAddAttachment1(String addAttachment1) {
        this.addAttachment1 = addAttachment1;
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

    @Column(name = "booking_id1")
    public String getBookingId1() {
        return bookingId1;
    }

    public void setBookingId1(String bookingId1) {
        this.bookingId1 = bookingId1;
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

