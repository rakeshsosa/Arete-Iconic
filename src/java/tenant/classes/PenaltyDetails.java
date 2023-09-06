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
 * @author ebs05
 */
@Entity
@Table(name = "penalty_details", schema = "arete_tms"
)
public class PenaltyDetails {

    private Integer SNo;
    private String orgId;
    private String userId;
//    private String receiptNo;
    private Date penaltyFromDate;
    private Date penaltyToDate;
    private String penaltyType;
    private String tenantCode;
    private String tenantName;
    private String assetNames;
    private String buildingNo;
    private String blockNo;
    private String streetNo;
    private String plotNo;

    private String flotNo;
    private String subassetCode;
    private String penaltyamount;
    private String status;
    private Date creationDate;
    private Date lastmodifiedDate;
    private String interestPer;
    private String totalAmount;

    public PenaltyDetails() {
    }

    public PenaltyDetails(String orgId, String userId, Date penaltyFromDate, Date penaltyToDate, String penaltyType, String tenantCode, String tenantName, String assetNames, String buildingNo, String blockNo, String streetNo, String plotNo, String flotNo, String subassetCode, String status, Date creationDate, Date lastmodifiedDate, String penaltyamount, String interestPer, String totalAmount) {
        this.orgId = orgId;
        this.userId = userId;
        //this.receiptNo = receiptNo;
        this.penaltyFromDate = penaltyFromDate;
        this.penaltyToDate = penaltyToDate;
        this.penaltyType = penaltyType;
        this.tenantCode = tenantCode;
        this.tenantName = tenantName;
        this.assetNames = assetNames;
        this.buildingNo = buildingNo;
        this.blockNo = blockNo;
        this.streetNo = streetNo;
        this.plotNo = plotNo;

        this.flotNo = flotNo;
        this.subassetCode = subassetCode;
        this.penaltyamount = penaltyamount;
        this.status = status;
        this.creationDate = creationDate;
        this.lastmodifiedDate = lastmodifiedDate;
        this.interestPer = interestPer;
        this.totalAmount = totalAmount;        

    }

    public PenaltyDetails(Integer SNo, String orgId, String userId, Date penaltyFromDate, Date penaltyToDate, String penaltyType, String tenantCode, String tenantName, String assetNames, String buildingNo, String blockNo, String streetNo, String plotNo, String flotNo, String subassetCode, String status, Date creationDate, Date lastmodifiedDate, String penaltyamount, String interestPer, String totalAmount) {

        this.SNo = SNo;
        this.orgId = orgId;
        this.userId = userId;
        //this.receiptNo = receiptNo;
        this.penaltyFromDate = penaltyFromDate;
        this.penaltyToDate = penaltyToDate;
        this.penaltyType = penaltyType;
        this.tenantCode = tenantCode;
        this.tenantName = tenantName;
        this.assetNames = assetNames;
        this.buildingNo = buildingNo;
        this.blockNo = blockNo;
        this.streetNo = streetNo;
        this.plotNo = plotNo;

        this.flotNo = flotNo;
        this.subassetCode = subassetCode;
        this.penaltyamount = penaltyamount;
        this.status = status;
        this.creationDate = creationDate;
        this.lastmodifiedDate = lastmodifiedDate;
        this.interestPer = interestPer;
        this.totalAmount = totalAmount;    

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

    @Column(name = "org_id", length = 50)
    public String getOrgId() {
        return this.orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name = "user_id", length = 50)
    public String getUserId() {
        return this.userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

//    @Column(name = "receipt_no", length = 60)
//    public String getReceiptNo() {
//        return this.receiptNo;
//    }
//
//    public void setReceiptNo(String receiptNo) {
//        this.receiptNo = receiptNo;
//    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "penalty_from_date", length = 19)
    public Date getPenaltyFromDate() {
        return penaltyFromDate;
    }

    public void setPenaltyFromDate(Date penaltyFromDate) {
        this.penaltyFromDate = penaltyFromDate;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "penalty_to_date", length = 19)
    public Date getPenaltyToDate() {
        return penaltyToDate;
    }

    public void setPenaltyToDate(Date penaltyToDate) {
        this.penaltyToDate = penaltyToDate;
    }
    
    

    @Column(name = "penalty_type", length = 60)
    public String getPenaltyType() {
        return penaltyType;
    }

    public void setPenaltyType(String penaltyType) {
        this.penaltyType = penaltyType;
    }

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

    @Column(name = "flat_no", length = 60)
    public String getFlotNo() {
        return flotNo;
    }

    public void setFlotNo(String flotNo) {
        this.flotNo = flotNo;
    }

    @Column(name = "subass_code", length = 60)
    public String getSubassetCode() {
        return subassetCode;
    }

    public void setSubassetCode(String subassetCode) {
        this.subassetCode = subassetCode;
    }

    @Column(name = "penalty_amount", length = 60)
    public String getPenaltyamount() {
        return penaltyamount;
    }

    public void setPenaltyamount(String penaltyamount) {
        this.penaltyamount = penaltyamount;
    }

    @Column(name = "status", length = 60)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Column(name = "interest_percentage", length = 60)
    public String getInterestPer() {
        return interestPer;
    }

    public void setInterestPer(String interestPer) {
        this.interestPer = interestPer;
    }

    @Column(name = "total_amount", length = 60)
    public String getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(String totalAmount) {
        this.totalAmount = totalAmount;
    }

    
}
