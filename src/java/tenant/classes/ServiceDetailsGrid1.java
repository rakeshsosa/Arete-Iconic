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
@Table(name = "service_details_grid1", schema = "arete_tms") 
public class ServiceDetailsGrid1 implements java.io.Serializable{
    private Integer sno;
    private String orgId;
    private String userId;
    private String bookingId1;
    private String quotationNo1;
    private String serviceCategory1;
    private String serviceName1;
    private double chargesQuoted11;
    private double vatPercentage11;
    private double vatAmount11;
    private double totalAmount11;
    private String securityDeposit1;
    private String advance1;
    private Boolean status;
    private Date lastmodifiedDate;
    
    
    public ServiceDetailsGrid1(){
    
    }

    public ServiceDetailsGrid1(Integer sno, String orgId, String userId, String bookingId1, String quotationNo1, String serviceCategory1, String serviceName1, double chargesQuoted11, double vatPercentage11, double vatAmount11, double totalAmount11, String securityDeposit1, String advance1, Boolean status, Date lastmodifiedDate) {
        this.sno = sno;
        this.orgId = orgId;
        this.userId = userId;
        this.bookingId1 = bookingId1;
        this.quotationNo1 = quotationNo1;
        this.serviceCategory1 = serviceCategory1;
        this.serviceName1 = serviceName1;
        this.chargesQuoted11 = chargesQuoted11;
        this.vatPercentage11 = vatPercentage11;
        this.vatAmount11 = vatAmount11;
        this.totalAmount11 = totalAmount11;
        this.securityDeposit1 = securityDeposit1;
        this.advance1 = advance1;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public ServiceDetailsGrid1(String orgId, String userId, String bookingId1, String quotationNo1, String serviceCategory1, String serviceName1, double chargesQuoted11, double vatPercentage11, double vatAmount11, double totalAmount11, String securityDeposit1, String advance1, Boolean status, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.bookingId1 = bookingId1;
        this.quotationNo1 = quotationNo1;
        this.serviceCategory1 = serviceCategory1;
        this.serviceName1 = serviceName1;
        this.chargesQuoted11 = chargesQuoted11;
        this.vatPercentage11 = vatPercentage11;
        this.vatAmount11 = vatAmount11;
        this.totalAmount11 = totalAmount11;
        this.securityDeposit1 = securityDeposit1;
        this.advance1 = advance1;
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

    @Column(name = "booking_id1")
    public String getBookingId1() {
        return bookingId1;
    }

    public void setBookingId1(String bookingId1) {
        this.bookingId1 = bookingId1;
    }

    @Column(name = "quotation_number1")
    public String getQuotationNo1() {
        return quotationNo1;
    }

    public void setQuotationNo1(String quotationNo1) {
        this.quotationNo1 = quotationNo1;
    }

    @Column(name = "service_category1")
    public String getServiceCategory1() {
        return serviceCategory1;
    }

    public void setServiceCategory1(String serviceCategory1) {
        this.serviceCategory1 = serviceCategory1;
    }

    @Column(name = "service_name1")
    public String getServiceName1() {
        return serviceName1;
    }

    public void setServiceName1(String serviceName1) {
        this.serviceName1 = serviceName1;
    }

    @Column(name = "charges_quoted1")
    public double getChargesQuoted11() {
        return chargesQuoted11;
    }

    public void setChargesQuoted11(double chargesQuoted11) {
        this.chargesQuoted11 = chargesQuoted11;
    }

    @Column(name = "vat_percentage1")
    public double getVatPercentage11() {
        return vatPercentage11;
    }

    public void setVatPercentage11(double vatPercentage11) {
        this.vatPercentage11 = vatPercentage11;
    }

    @Column(name = "vat_amount1")
    public double getVatAmount11() {
        return vatAmount11;
    }

    public void setVatAmount11(double vatAmount11) {
        this.vatAmount11 = vatAmount11;
    }

    @Column(name = "total_amount1")
    public double getTotalAmount11() {
        return totalAmount11;
    }

    public void setTotalAmount11(double totalAmount11) {
        this.totalAmount11 = totalAmount11;
    }

    @Column(name = "security_deposite1")
    public String getSecurityDeposit1() {
        return securityDeposit1;
    }

    public void setSecurityDeposit1(String securityDeposit1) {
        this.securityDeposit1 = securityDeposit1;
    }

    @Column(name = "advance1")
    public String getAdvance1() {
        return advance1;
    }

    public void setAdvance1(String advance1) {
        this.advance1 = advance1;
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
