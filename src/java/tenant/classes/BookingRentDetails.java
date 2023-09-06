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
 * @author IT SUPPORT
 */
@Entity
@Table(name = "booking_rent_details", schema = "arete_tms")

public class BookingRentDetails implements java.io.Serializable{
    
    private Integer sno;
    private String orgId;
    private String userId;
    private String bookingId;
    private  String quotationNo;
    private String unitNo;
    private String rentPeriod;
    private double chargesQuoted;
    private double vatPercentage;
    private double vatAmount;
    private double totalAmount;
    private String status;
    private Date lastmodifiedDate;

    public BookingRentDetails(){
    }

    public BookingRentDetails(String orgId, String userId, String bookingId, String quotationNo, String unitNo, String rentPeriod, double chargesQuoted, 
            double vatPercentage, double vatAmount, double totalAmount, String status, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.bookingId = bookingId;
        this.quotationNo = quotationNo;
        this.unitNo = unitNo;
        this.rentPeriod = rentPeriod;
        this.chargesQuoted = chargesQuoted;
        this.vatPercentage = vatPercentage;
        this.vatAmount = vatAmount;
        this.totalAmount = totalAmount;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public BookingRentDetails(Integer sno, String orgId, String userId, String bookingId, String quotationNo, String unitNo, String rentPeriod, double chargesQuoted, 
            double vatPercentage, double vatAmount, double totalAmount, String status, Date lastmodifiedDate) {
        this.sno = sno;
        this.orgId = orgId;
        this.userId = userId;
        this.bookingId = bookingId;
        this.quotationNo = quotationNo;
        this.unitNo = unitNo;
        this.rentPeriod = rentPeriod;
        this.chargesQuoted = chargesQuoted;
        this.vatPercentage = vatPercentage;
        this.vatAmount = vatAmount;
        this.totalAmount = totalAmount;
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
    
@Column(name = "unit_no")
    public String getUnitNo() {
        return unitNo;
    }

    public void setUnitNo(String unitNo) {
        this.unitNo = unitNo;
    }

    @Column(name = "rent_period")
    public String getRentPeriod() {
        return rentPeriod;
    }

    public void setRentPeriod(String rentPeriod) {
        this.rentPeriod = rentPeriod;
    }

    @Column(name = "charges_quoted")
    public double getChargesQuoted() {
        return chargesQuoted;
    }

    public void setChargesQuoted(double chargesQuoted) {
        this.chargesQuoted = chargesQuoted;
    }

    @Column(name = "vat_percentage")
    public double getVatPercentage() {
        return vatPercentage;
    }

    public void setVatPercentage(double vatPercentage) {
        this.vatPercentage = vatPercentage;
    }

    @Column(name = "vat_amount")
    public double getVatAmount() {
        return vatAmount;
    }

    public void setVatAmount(double vatAmount) {
        this.vatAmount = vatAmount;
    }

    @Column(name = "total_amount")
    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
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
