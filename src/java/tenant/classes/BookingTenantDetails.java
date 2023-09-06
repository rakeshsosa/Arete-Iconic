/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.classes;

import java.io.Serializable;
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
 * @author Lakshmi
 */
@Entity
@Table(name = "Booking_Tenant_Details", schema = "arete_tms")
public class BookingTenantDetails implements Serializable {

    private Integer SNo;
    private String orgId;
    private String userId;
    private String tenantCode;
    private String tenantCategory;
    private String tenantType;
    private String tenantId;
    private String tenantFname;
    private String tenantLname;
    private String tenantMailid;
    private String tenantCrNo;
    private String tenantContactno;
    private String permanentAddress;
    private String assetCode;
    private String assetName;

    private String subclassifiedAstno;
    private String flatNo;
    private String roomCode;
    private String roomName;
    private String buildingNo;
    private String blockNo;
    private String plotNo;
    private String status;
    private String appstatus;
    private String appremarks;

    
    private Date creationDate;
    private Date lastmodifiedDate;

    public BookingTenantDetails() {
    }

    public BookingTenantDetails(String orgId, String userId, String tenantCode, String tenantCategory, String tenantType, String tenantId, String tenantFname, String tenantLname, String tenantMailid, String tenantCrNo, String tenantContactno, String permanentAddress, String assetCode, String assetName, String subclassifiedAstno, String flatNo, String roomCode, String roomName, String buildingNo, String blockNo, String plotNo,String appstatus, String appremarks, String status, Date creationDate, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.tenantCode = tenantCode;
        this.tenantCategory = tenantCategory;
        this.tenantType = tenantType;
        this.tenantId = tenantId;
        this.tenantFname = tenantFname;
        this.tenantLname = tenantLname;
        this.tenantMailid = tenantMailid;
        this.tenantCrNo = tenantCrNo;
        this.tenantContactno = tenantContactno;
        this.permanentAddress = permanentAddress;
        this.assetCode = assetCode;
        this.assetName = assetName;
        this.subclassifiedAstno = subclassifiedAstno;
        this.flatNo = flatNo;
        this.roomCode = roomCode;
        this.roomName = roomName;
        this.buildingNo = buildingNo;
        this.blockNo = blockNo;
        this.plotNo = plotNo;
        this.appstatus = appstatus;
        this.appremarks = appremarks;
        this.status = status;
        this.creationDate = creationDate;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public BookingTenantDetails(Integer SNo, String orgId, String userId, String tenantCode, String tenantCategory, String tenantType, String tenantId, String tenantFname, String tenantLname, String tenantMailid, String tenantCrNo, String tenantContactno, String permanentAddress, String assetCode, String assetName, String subclassifiedAstno, String flatNo, String roomCode, String roomName, String buildingNo, String blockNo, String plotNo,String appstatus, String appremarks, String status, Date creationDate, Date lastmodifiedDate) {
        this.SNo = SNo;
        this.orgId = orgId;
        this.userId = userId;
        this.tenantCode = tenantCode;
        this.tenantCategory = tenantCategory;
        this.tenantType = tenantType;
        this.tenantId = tenantId;
        this.tenantFname = tenantFname;
        this.tenantLname = tenantLname;
        this.tenantMailid = tenantMailid;
        this.tenantCrNo = tenantCrNo;
        this.tenantContactno = tenantContactno;
        this.permanentAddress = permanentAddress;
        this.assetCode = assetCode;
        this.assetName = assetName;
        this.subclassifiedAstno = subclassifiedAstno;
        this.flatNo = flatNo;
        this.roomCode = roomCode;
        this.roomName = roomName;
        this.buildingNo = buildingNo;
        this.blockNo = blockNo;
        this.plotNo = plotNo;
        this.appstatus = appstatus;
        this.appremarks = appremarks;
        this.status = status;
        this.creationDate = creationDate;
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

    @Column(name = "tenant_code", length = 60)
    public String getTenantCode() {
        return tenantCode;
    }

    public void setTenantCode(String tenantCode) {
        this.tenantCode = tenantCode;
    }

    @Column(name = "tenant_category", length = 60)
    public String getTenantCategory() {
        return tenantCategory;
    }

    public void setTenantCategory(String tenantCategory) {
        this.tenantCategory = tenantCategory;
    }

    @Column(name = "tenant_type", length = 60)
    public String getTenantType() {
        return tenantType;
    }

    public void setTenantType(String tenantType) {
        this.tenantType = tenantType;
    }

    public String getTenantId() {
        return tenantId;
    }

    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }

    @Column(name = "tenant_fname", length = 60)
    public String getTenantFname() {
        return tenantFname;
    }

    public void setTenantFname(String tenantFname) {
        this.tenantFname = tenantFname;
    }

    @Column(name = "tenant_lname", length = 60)
    public String getTenantLname() {
        return tenantLname;
    }

    public void setTenantLname(String tenantLname) {
        this.tenantLname = tenantLname;
    }

    @Column(name = "tenant_mailid", length = 60)
    public String getTenantMailid() {
        return tenantMailid;
    }

    public void setTenantMailid(String tenantMailid) {
        this.tenantMailid = tenantMailid;
    }

    @Column(name = "tenant_cr_no", length = 60)
    public String getTenantCrNo() {
        return tenantCrNo;
    }

    public void setTenantCrNo(String tenantCrNo) {
        this.tenantCrNo = tenantCrNo;
    }

    @Column(name = "tenant_contactno", length = 15)
    public String getTenantContactno() {
        return tenantContactno;
    }

    public void setTenantContactno(String tenantContactno) {
        this.tenantContactno = tenantContactno;
    }

    @Column(name = "permanent_address", length = 250)
    public String getPermanentAddress() {
        return permanentAddress;
    }

    public void setPermanentAddress(String permanentAddress) {
        this.permanentAddress = permanentAddress;
    }

    @Column(name = "asset_code", length = 60)
    
    public String getAssetCode() {
        return assetCode;
    }

    public void setAssetCode(String assetCode) {
        this.assetCode = assetCode;
    }
    
    @Column(name = "asset_name", length = 60)
    
     public String getAssetName() {
        return assetName;
    }

    public void setAssetName(String assetName) {
        this.assetName = assetName;
    }
    
    @Column(name = "subasset_code", length = 60)
    public String getSubclassifiedAstno() {
        return subclassifiedAstno;
    }

    public void setSubclassifiedAstno(String subclassifiedAstno) {
        this.subclassifiedAstno = subclassifiedAstno;
    }

    @Column(name = "flat_no", length = 60)
    public String getFlatNo() {
        return flatNo;
    }

    public void setFlatNo(String flatNo) {
        this.flatNo = flatNo;
    }

    @Column(name = "room_code", length = 60)
    public String getRoomCode() {
        return roomCode;
    }

    public void setRoomCode(String roomCode) {
        this.roomCode = roomCode;
    }

    @Column(name = "room_name", length = 60)
    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    @Column(name = "building_no", length = 60)
    public String getBuildingNo() {
        return buildingNo;
    }

    public void setBuildingNo(String buildingNo) {
        this.buildingNo = buildingNo;
    }

    @Column(name = "block_no", length = 60)
    public String getBlockNo() {
        return blockNo;
    }

    public void setBlockNo(String blockNo) {
        this.blockNo = blockNo;
    }

    @Column(name = "plot_no", length = 60)
    public String getPlotNo() {
        return plotNo;
    }

    public void setPlotNo(String plotNo) {
        this.plotNo = plotNo;
    }

    @Column(name = "appstatus", length = 60)
    public String getAppstatus() {
        return appstatus;
    }

    public void setAppstatus(String appstatus) {
        this.appstatus = appstatus;
    }
    
     @Column(name = "app_remarks", length = 60)
    public String getAppremarks() {
        return appremarks;
    }

    public void setAppremarks(String appremarks) {
        this.appremarks = appremarks;
    }
    
    @Column(name = "status", length = 50)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "creation_date", length = 60)
    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "lastmodified_date", length = 19)
    public Date getLastmodifiedDate() {
        return lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }

}
