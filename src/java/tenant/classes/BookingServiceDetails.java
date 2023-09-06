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
@Table(name = "booking_service_details", schema = "arete_tms")
public class BookingServiceDetails implements java.io.Serializable{
    
    private Integer sno;
    private String orgId;
    private String userId;
    private String bookingId;
    private String quotationNo;
    private String serviceCategory;
    private String serviceName;
    private double chargesQuoted;
    private double vatPercentage;
    private double vatAmount;
    private double totalAmount;
    private String securityDeposit;
    private String advance;
    private String status;
    private Date lastmodifiedDate;
      
    public BookingServiceDetails(){
    }

    public BookingServiceDetails(String orgId, String userId, String bookingId, String quotationNo, String serviceCategory, String serviceName, double chargesQuoted, 
            double vatPercentage, double vatAmount, double totalAmount, String securityDeposit, String advance, String status, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.bookingId = bookingId;
        this.quotationNo = quotationNo;
        this.serviceCategory = serviceCategory;
        this.serviceName = serviceName;
        this.chargesQuoted = chargesQuoted;
        this.vatPercentage = vatPercentage;
        this.vatAmount = vatAmount;
        this.totalAmount = totalAmount;
        this.securityDeposit = securityDeposit;
        this.advance = advance;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public BookingServiceDetails(Integer sno, String orgId, String userId, String bookingId, String quotationNo, String serviceCategory, String serviceName, 
            double chargesQuoted, double vatPercentage, double vatAmount, double totalAmount, String securityDeposit, String advance, String status, Date lastmodifiedDate) {
        this.sno = sno;
        this.orgId = orgId;
        this.userId = userId;
        this.bookingId = bookingId;
        this.quotationNo = quotationNo;
        this.serviceCategory = serviceCategory;
        this.serviceName = serviceName;
        this.chargesQuoted = chargesQuoted;
        this.vatPercentage = vatPercentage;
        this.vatAmount = vatAmount;
        this.totalAmount = totalAmount;
        this.securityDeposit = securityDeposit;
        this.advance = advance;
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

    @Column(name = "service_category")
    public String getServiceCategory() {
        return serviceCategory;
    }

    public void setServiceCategory(String serviceCategory) {
        this.serviceCategory = serviceCategory;
    }

    @Column(name = "service_name")
    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
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

    @Column(name = "security_deposit")
    public String getSecurityDeposit() {
        return securityDeposit;
    }

    public void setSecurityDeposit(String securityDeposit) {
        this.securityDeposit = securityDeposit;
    }

      @Column(name = "advance")
    public String getAdvance() {
        return advance;
    }

    public void setAdvance(String advance) {
        this.advance = advance;
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
