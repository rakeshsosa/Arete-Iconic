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
 * @author IT SUPPORT
 */
@Entity
@Table(name = "terms_condition", schema = "arete_tms")           
public class TermsCondition implements java.io.Serializable{
    
     private Integer sno;
     private String paymentTerms;
     private String contactTerms;
     private String addAttachment;
     //private byte[] attachment;
     private String orgId;
     private String userId;
     
     private String quotationNo;
     private String bookingId;
     private Boolean status;
     private Date lastmodifiedDate;

    

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
   
    
      @Column(name = "payment_terms")
    public String getPaymentTerms() {
        return paymentTerms;
    }

    public void setPaymentTerms(String paymentTerms) {
        this.paymentTerms = paymentTerms;
    }

     @Column(name = "contact_terms")
    public String getContactTerms() {
        return contactTerms;
    }

    public void setContactTerms(String contactTerms) {
        this.contactTerms = contactTerms;
    }

     @Column(name = "add_attachment")
    public String getAddAttachment() {
        return addAttachment;
    }

    public void setAddAttachment(String addAttachment) {
        this.addAttachment = addAttachment;
    }

//    public byte[] getAttachment() {
//        return attachment;
//    }
//
//    public void setAttachment(byte[] attachment) {
//        this.attachment = attachment;
//    }
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
    
    @Column(name = "booking_id")
    public String getBookingId() {
        return bookingId;
    }

    public void setBookingId(String bookingId) {
        this.bookingId = bookingId;
    }
    
    
    public TermsCondition() {
    }

    public TermsCondition(String paymentTerms, String contactTerms, String addAttachment,  String orgId, String userId, String quotationNo, String bookingId, Boolean status, Date lastmodifiedDate) {
        this.paymentTerms = paymentTerms;
        this.contactTerms = contactTerms;
        this.addAttachment = addAttachment;
        //this.attachment = attachment;
        this.orgId = orgId;
        this.userId = userId;
        this.quotationNo = quotationNo;
        this.bookingId = bookingId;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public TermsCondition(Integer sno, String paymentTerms, String contactTerms, String addAttachment,  String orgId, String userId, String quotationNo, String bookingId, Boolean status, Date lastmodifiedDate) {
        this.sno = sno;
        this.paymentTerms = paymentTerms;
        this.contactTerms = contactTerms;
        this.addAttachment = addAttachment;
        //this.attachment = attachment;
        this.orgId = orgId;
        this.userId = userId;
        this.quotationNo = quotationNo;
        this.bookingId = bookingId;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

   
 
   

}

