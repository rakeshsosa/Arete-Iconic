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
@Table(name = "booking_quotation_details", schema = "arete_tms")
public class BookingQuotationDetails implements java.io.Serializable{ 
    
    private Integer SNo;
    private String orgId;
    private String userId;
    private String bookingId;
    private String bookingRef; 
    private Date bookingDate;
    private String quotationNumber; 
    private Date quotationDate;
    private Date quotationExpiry;
    private String currency;
    private String status;
    private Date lastmodifiedDate;
    
    public  BookingQuotationDetails(){
    }

    public BookingQuotationDetails(String orgId, String userId, String bookingId, String bookingRef, Date bookingDate, String quotationNumber, Date quotationDate, 
            Date quotationExpiry, String currency, String status, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.bookingId = bookingId;
        this.bookingRef = bookingRef;
        this.bookingDate = bookingDate;
        this.quotationNumber = quotationNumber;
        this.quotationDate = quotationDate;
        this.quotationExpiry = quotationExpiry;
        this.currency = currency;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public BookingQuotationDetails(Integer SNo, String orgId, String userId, String bookingId, String bookingRef, Date bookingDate, String quotationNumber, Date quotationDate, 
            Date quotationExpiry, String currency, String status, Date lastmodifiedDate) {
        this.SNo = SNo;
        this.orgId = orgId;
        this.userId = userId;
        this.bookingId = bookingId;
        this.bookingRef = bookingRef;
        this.bookingDate = bookingDate;
        this.quotationNumber = quotationNumber;
        this.quotationDate = quotationDate;
        this.quotationExpiry = quotationExpiry;
        this.currency = currency;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }


    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "s_no", unique = true, nullable = false)
    public Integer getSNo() {
        return SNo;
    }

    public void setSNo(Integer SNo) {
        this.SNo = SNo;
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

     @Column(name = "quotation_number")
    public String  getQuotationNumber() {
        return quotationNumber;
    }

    public void setQuotationNumber(String quotationNumber) {
        this.quotationNumber = quotationNumber;
    }

     @Column(name = "quotation_date")
    public Date getQuotationDate() {
        return quotationDate;
    }

    public void setQuotationDate(Date quotationDate) {
        this.quotationDate = quotationDate;
    }

    @Column(name = "quotation_expiry")
    public Date getQuotationExpiry() {
        return quotationExpiry;
    }

    public void setQuotationExpiry(Date quotationExpiry) {
        this.quotationExpiry = quotationExpiry;
    }

    @Column(name = "currency")
    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
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

    @Column(name = "booking_id")
    public String getBookingId() {
        return bookingId;
    }

    public void setBookingId(String bookingId) {
        this.bookingId = bookingId;
    }

    @Column(name = "booking_ref")
    public String getBookingRef() {
        return bookingRef;
    }

    public void setBookingRef(String bookingRef) {
        this.bookingRef = bookingRef;
    }

    @Column(name = "booking_date")
    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }
    
   
}
