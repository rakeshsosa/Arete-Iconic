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
@Table(name = "property_details", schema = "arete_tms") 
public class PropertyDetails implements java.io.Serializable{
    private Integer sno;
    private String orgId;
    private String userId;
    private  String quotationNo;
    private String assetCode;
    private String assetName;
    private  Date tenancyStartDate;
    private  Date tenancyEndDate;
    private String mezzanineFloor;
    private String assetType1;
    private String baserent;
    private String status;
    private Date lastmodifiedDate;
    private String customerName;
    
     public  PropertyDetails(){
     }

    public PropertyDetails(String orgId, String userId, String assetCode, String assetName,  Date tenancyStartDate, 
             Date tenancyEndDate, String mezzanineFloor, String assetType1, String baserent,String status,Date lastmodifiedDate,  String quotationNo, String customerName) {
        this.orgId = orgId;
        this.userId = userId;
        this.assetCode = assetCode;
        this.assetName = assetName;
        this.tenancyStartDate = tenancyStartDate;
        this.tenancyEndDate = tenancyEndDate;
        this.mezzanineFloor = mezzanineFloor;
        this.assetType1 = assetType1;
        this.baserent = baserent;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.quotationNo = quotationNo;
        this.customerName = customerName;
    }
     

    public PropertyDetails(Integer sno, String orgId, String userId, String assetCode, String assetName, Date tenancyStartDate, Date tenancyEndDate, 
            String mezzanineFloor, String assetType1,String baserent,String status,Date lastmodifiedDate,  String quotationNo, String customerName) {
        this.sno = sno;
        this.orgId = orgId;
        this.userId = userId;
        this.assetCode = assetCode;
        this.assetName = assetName;
        this.tenancyStartDate = tenancyStartDate;
        this.tenancyEndDate = tenancyEndDate;
        this.mezzanineFloor = mezzanineFloor;
        this.assetType1 = assetType1;
        this.baserent = baserent;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.quotationNo = quotationNo;
        this.customerName = customerName;
    }

//    public PropertyDetails(String orgId, String userId, String propertyCode, String unitName,  Date tenancyStartDate,  Date tenancyEndDate, String floor, String customerType, int parseInt) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
//
//    public PropertyDetails(int parseInt, String orgId, String userId, String propertyCode, String unitName,  Date tenancyStartDate,  Date tenancyEndDate, String floor, String customerType, int parseInt0) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }

    
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

      @Column(name = "asset_code")
    public String getAssetCode() {
        return assetCode;
    }

    public void setAssetCode(String assetCode) {
        this.assetCode = assetCode;
    }

     @Column(name = "asset_name")
    public String getAssetName() {
        return assetName;
    }

    public void setAssetName(String assetName) {
        this.assetName = assetName;
    }

     @Column(name = "tenancy_start_date")
    public Date getTenancyStartDate() {
        return tenancyStartDate;
    }

    public void setTenancyStartDate( Date tenancyStartDate) {
        this.tenancyStartDate = tenancyStartDate;
    }

    
      @Column(name = "tenancy_end_date")
    public Date getTenancyEndDate() {
        return tenancyEndDate;
    }

    public void setTenancyEndDate( Date tenancyEndDate) {
        this.tenancyEndDate = tenancyEndDate;
    }

      @Column(name = "mezzanine_floor")
    public String getMezzanineFloor() {
        return mezzanineFloor;
    }

    public void setMezzanineFloor(String mezzanineFloor) {
        this.mezzanineFloor = mezzanineFloor;
    }

    @Column(name = "asset_type1")
    public String getAssetType1() {
        return assetType1;
    }

    public void setAssetType1(String assetType1) {
        this.assetType1 = assetType1;
    }

    @Column(name = "base_rent")
    public String getBaserent() {
        return baserent;
    }

    public void setBaserent(String baserent) {
        this.baserent = baserent;
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

    @Column(name = "customer_name")
    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
    
}
