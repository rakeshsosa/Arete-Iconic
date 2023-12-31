package tenant.classes;


// Generated Sep 7, 2016 12:08:23 PM by Hibernate Tools 4.3.1

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
 * InterestDetails generated by hbm2java
 */
@Entity
@Table(name = "interst_details", catalog = "arete_tms"
)
public class InterestDetails implements java.io.Serializable {

    private Integer SNo;
    
   
    //private String orgId;
   // private String userId;
//    private String receiptNo;
    private Date period;
    private Date toDate;
   // private String penaltyType;
    private String tenantCode;
    private String tenantName;
    private String assetNames;
    private String buildingNo;
    private String blockNo;
    private String streetNo;
    private String plotNo;

   // private String flotNo;
   // private String subassetCode;
   // private String penaltyamount;
    private String status;
    private Date creationDate;
    private Date lastmodifiedDate;
    private String advanceAmount;
    private String interestPer;
    private String interestAmount;
//    private Date dueDate;
//    private String totalAmount;
//    private String discountforadvance;
//    private String discountforrent;
//    private Date contractSigningDate;
//    private String recordstatus;
    private String vacatestatus;
    private String appstatus;
//    private String gfcremarks;
//    private String cforemarks;
//    private String extra1;
//    private String extra2;
//    private String extra3;
//    private String extra4;
//    private String extra5;
//    private String status;
   

    public InterestDetails() {
    }
//interestDate1, tenantCode, tenantName, assetNames, buildingNo, blockNo, streetNo, plotNo, advanceAmount, interestPer, "Update0", today, today, interestAmount);
    
    
    
    public InterestDetails(Integer SNo, Date period, Date toDate, String tenantCode, String tenantName, String assetNames, String buildingNo, String blockNo, String streetNo, String plotNo,String advanceAmount,String interestPer, String status, Date creationDate, Date lastmodifiedDate,  String interestAmount ) {

        this.SNo = SNo;
        //this.orgId = orgId;
        //this.userId = userId;
        //this.receiptNo = receiptNo;
        this.period = period;
        this.toDate = toDate;
        this.advanceAmount = advanceAmount;
        this.tenantCode = tenantCode;
        this.tenantName = tenantName;
        this.assetNames = assetNames;
        this.buildingNo = buildingNo;
        this.blockNo = blockNo;
        this.streetNo = streetNo;
        this.plotNo = plotNo;

        //this.flotNo = flotNo;
        this.interestAmount = interestAmount;
        this.interestPer = interestPer;
        this.status = status;
        this.creationDate = creationDate;
        this.lastmodifiedDate = lastmodifiedDate;

    }
    
    public InterestDetails( Date period, Date toDate, String tenantCode, String tenantName, String assetNames, String buildingNo, String blockNo, String streetNo, String plotNo,String advanceAmount,String interestPer, String status, Date creationDate, Date lastmodifiedDate,  String interestAmount ) {

        //this.SNo = SNo;
        //this.orgId = orgId;
        //this.userId = userId;
        //this.receiptNo = receiptNo;
        this.period = period;
        this.toDate = toDate;
        this.advanceAmount = advanceAmount;
        this.tenantCode = tenantCode;
        this.tenantName = tenantName;
        this.assetNames = assetNames;
        this.buildingNo = buildingNo;
        this.blockNo = blockNo;
        this.streetNo = streetNo;
        this.plotNo = plotNo;

        //this.flotNo = flotNo;
        this.interestAmount = interestAmount;
        this.interestPer = interestPer;
        this.status = status;
        this.creationDate = creationDate;
        this.lastmodifiedDate = lastmodifiedDate;

    }

   

   @Id
    @GeneratedValue(strategy = IDENTITY)

    @Column(name = "s_no", unique = true, nullable = false)
    public Integer getSNo() {
        return this.SNo;
    }

    public void setSNo(Integer SNo) {
        this.SNo = SNo;
    }

//    @Column(name = "org_id", length = 50)
//    public String getOrgId() {
//        return this.orgId;
//    }
//
//    public void setOrgId(String orgId) {
//        this.orgId = orgId;
//    }
//
//    @Column(name = "user_id", length = 50)
//    public String getUserId() {
//        return this.userId;
//    }
//
//    public void setUserId(String userId) {
//        this.userId = userId;
//    }

//    @Column(name = "receipt_no", length = 60)
//    public String getReceiptNo() {
//        return this.receiptNo;
//    }
//
//    public void setReceiptNo(String receiptNo) {
//        this.receiptNo = receiptNo;
//    }
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "from_date", length = 19)
    public Date getPeriod() {
        return period;
    }

    public void setPeriod(Date period) {
        this.period = period;
    }
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "t_date", length = 19)
    public Date getToDate() {
        return toDate;
    }

    public void setToDate(Date toDate) {
        this.toDate = toDate;
    }

//    @Column(name = "penalty_type", length = 60)
//    public String getPenaltyType() {
//        return penaltyType;
//    }
//
//    public void setPenaltyType(String penaltyType) {
//        this.penaltyType = penaltyType;
//    }

    @Column(name = "tenant_code", length = 60)
    public String getTenantCode() {
        return this.tenantCode;
    }

    public void setTenantCode(String tenantCode) {
        this.tenantCode = tenantCode;
    }

    @Column(name = "tenant_name", length = 60)
    public String getTenantName() {
        return this.tenantName;
    }

    public void setTenantName(String tenantName) {
        this.tenantName = tenantName;
    }

    @Column(name = "asset_name", length = 60)
    public String getAssetNames() {
        return this.assetNames;
    }

    public void setAssetNames(String assetNames) {
        this.assetNames = assetNames;
    }

    @Column(name = "building_no", length = 60)
    public String getBuildingNo() {
        return this.buildingNo;
    }

    public void setBuildingNo(String buildingNo) {
        this.buildingNo = buildingNo;
    }

    @Column(name = "block_no", length = 60)
    public String getBlockNo() {
        return this.blockNo;
    }

    public void setBlockNo(String blockNo) {
        this.blockNo = blockNo;
    }

    @Column(name = "street_no", length = 60)
    public String getStreetNo() {
        return this.streetNo;
    }

    public void setStreetNo(String streetNo) {
        this.streetNo = streetNo;
    }

    @Column(name = "plot_no", length = 60)
    public String getPlotNo() {
        return this.plotNo;
    }

    public void setPlotNo(String plotNo) {
        this.plotNo = plotNo;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "creation_date", length = 60)
    public Date getCreationDate() {
        return this.creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "lastmodified_date", length = 19)
    public Date getLastmodifiedDate() {
        return this.lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }

//    @Column(name = "flat_no", length = 60)
//    public String getFlotNo() {
//        return flotNo;
//    }
//
//    public void setFlotNo(String flotNo) {
//        this.flotNo = flotNo;
//    }

//    @Column(name = "subass_code", length = 60)
//    public String getSubassetCode() {
//        return subassetCode;
//    }
//
//    public void setSubassetCode(String subassetCode) {
//        this.subassetCode = subassetCode;
//    }advanceAmount interestPer

    @Column(name = "Interest_Percent", length = 60)
    public String getInterestPer() {
        return interestPer;
    }

    public void setInterestPer(String interestPer) {
        this.interestPer = interestPer;
    }
    
    @Column(name = "Advance_Amount", length = 60)
    public String getAdvanceAmount() {
        return advanceAmount;
    }

    public void setAdvanceAmount(String advanceAmount) {
        this.advanceAmount = advanceAmount;
    }
    @Column(name = "interest_amount", length = 60)
    public String getInterestAmount() {
        return interestAmount;
    }

    public void setInterestAmount(String interestAmount) {
        this.interestAmount = interestAmount;
    }

    @Column(name = "status", length = 60)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
