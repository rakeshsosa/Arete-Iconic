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
@Table(name = "booking_property_details1", schema = "arete_tms")    
public class BookingPropertyDetails1 implements java.io.Serializable{
    
    private Integer sno;
    private String orgId;
    private String userId;
    private String bookingId1;
    private String bookingRef1; 
    private Date bookingDate1;
    private String quotationNumber1;
    private String assetCode1;
    private String assetName1;
    private Date tenancyStartDate1;
    private Date tenancyEndDate1;
    private String mezzanineFloor1;
    private String assetType11;
    private String baserent1;
    private String propertyCode1;
    private String propertyName1;
    private String unitNo1;
    private String status;
    private Date lastmodifiedDate;
    private String customerName1;
    
     public  BookingPropertyDetails1(){
     }

    public BookingPropertyDetails1(String orgId, String userId, String bookingId1, String bookingRef1, Date bookingDate1, String quotationNumber1, String assetCode1, String assetName1, Date tenancyStartDate1, Date tenancyEndDate1, String mezzanineFloor1, String assetType11, String baserent1, String propertyCode1, String propertyName1, String unitNo1, String status, Date lastmodifiedDate, String customerName1) {
        this.orgId = orgId;
        this.userId = userId;
        this.bookingId1 = bookingId1;
        this.bookingRef1 = bookingRef1;
        this.bookingDate1 = bookingDate1;
        this.quotationNumber1 = quotationNumber1;
        this.assetCode1 = assetCode1;
        this.assetName1 = assetName1;
        this.tenancyStartDate1 = tenancyStartDate1;
        this.tenancyEndDate1 = tenancyEndDate1;
        this.mezzanineFloor1 = mezzanineFloor1;
        this.assetType11 = assetType11;
        this.baserent1 = baserent1;
        this.propertyCode1 = propertyCode1;
        this.propertyName1 = propertyName1;
        this.unitNo1 = unitNo1;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.customerName1 = customerName1;
    }

    public BookingPropertyDetails1(Integer sno, String orgId, String userId, String bookingId1, String bookingRef1, Date bookingDate1, String quotationNumber1, String assetCode1, String assetName1, Date tenancyStartDate1, Date tenancyEndDate1, String mezzanineFloor1, String assetType11, String baserent1, String propertyCode1, String propertyName1, String unitNo1, String status, Date lastmodifiedDate, String customerName1) {
        this.sno = sno;
        this.orgId = orgId;
        this.userId = userId;
        this.bookingId1 = bookingId1;
        this.bookingRef1 = bookingRef1;
        this.bookingDate1 = bookingDate1;
        this.quotationNumber1 = quotationNumber1;
        this.assetCode1 = assetCode1;
        this.assetName1 = assetName1;
        this.tenancyStartDate1 = tenancyStartDate1;
        this.tenancyEndDate1 = tenancyEndDate1;
        this.mezzanineFloor1 = mezzanineFloor1;
        this.assetType11 = assetType11;
        this.baserent1 = baserent1;
        this.propertyCode1 = propertyCode1;
        this.propertyName1 = propertyName1;
        this.unitNo1 = unitNo1;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.customerName1 = customerName1;
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

     @Column(name = "booking_ref1")
    public String getBookingRef1() {
        return bookingRef1;
    }

    public void setBookingRef1(String bookingRef1) {
        this.bookingRef1 = bookingRef1;
    }

     @Column(name = "booking_date1")
    public Date getBookingDate1() {
        return bookingDate1;
    }

    public void setBookingDate1(Date bookingDate1) {
        this.bookingDate1 = bookingDate1;
    }

     @Column(name = "quotation_number1")
    public String getQuotationNumber1() {
        return quotationNumber1;
    }

    public void setQuotationNumber1(String quotationNumber1) {
        this.quotationNumber1 = quotationNumber1;
    }

     @Column(name = "asset_code1")
    public String getAssetCode1() {
        return assetCode1;
    }

    public void setAssetCode1(String assetCode1) {
        this.assetCode1 = assetCode1;
    }

     @Column(name = "asset_name1")
    public String getAssetName1() {
        return assetName1;
    }

    public void setAssetName1(String assetName1) {
        this.assetName1 = assetName1;
    }

     @Column(name = "tenancy_start_date1")
    public Date getTenancyStartDate1() {
        return tenancyStartDate1;
    }

    public void setTenancyStartDate1(Date tenancyStartDate1) {
        this.tenancyStartDate1 = tenancyStartDate1;
    }

     @Column(name = "tenancy_end_date1")
    public Date getTenancyEndDate1() {
        return tenancyEndDate1;
    }

    public void setTenancyEndDate1(Date tenancyEndDate1) {
        this.tenancyEndDate1 = tenancyEndDate1;
    }

     @Column(name = "mezzanine_floor1")
    public String getMezzanineFloor1() {
        return mezzanineFloor1;
    }

    public void setMezzanineFloor1(String mezzanineFloor1) {
        this.mezzanineFloor1 = mezzanineFloor1;
    }

     @Column(name = "asset_type1")
    public String getAssetType11() {
        return assetType11;
    }

    public void setAssetType11(String assetType11) {
        this.assetType11 = assetType11;
    }

     @Column(name = "base_rent1")
    public String getBaserent1() {
        return baserent1;
    }

    public void setBaserent1(String baserent1) {
        this.baserent1 = baserent1;
    }

     @Column(name = "property_code1")
    public String getPropertyCode1() {
        return propertyCode1;
    }

    public void setPropertyCode1(String propertyCode1) {
        this.propertyCode1 = propertyCode1;
    }

     @Column(name = "property_name1")
    public String getPropertyName1() {
        return propertyName1;
    }

    public void setPropertyName1(String propertyName1) {
        this.propertyName1 = propertyName1;
    }

     @Column(name = "unit_no1")
    public String getUnitNo1() {
        return unitNo1;
    }

    public void setUnitNo1(String unitNo1) {
        this.unitNo1 = unitNo1;
    }

     @Column(name = "status")
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

     @Column(name = "last_modified_date")
    public Date getLastmodifiedDate() {
        return lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }

     @Column(name = "customer_name1")
    public String getCustomerName1() {
        return customerName1;
    }

    public void setCustomerName1(String customerName1) {
        this.customerName1 = customerName1;
    }

    
    
    
}
