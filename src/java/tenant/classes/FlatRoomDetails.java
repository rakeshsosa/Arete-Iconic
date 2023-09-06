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
 * @author ebs-sdd41
 */
@Entity
@Table(name = "flat_room_details", schema = "arete_tms"
)
public class FlatRoomDetails {

    private Integer SNo;
    private String orgId;
    private String userId;
    private String roomCode;
    private String roomName;
    private String roomType;
    private String assetCode;
    private String subAssetCode;
    private String actualRent;
    private String minimumRentFixed;
    private String parking;
    private String remarks;
    private String status;
    private Date lastmodifiedDate;
    private String utilityNo1;
    private String utilityNo2;
    private String recordStatus;

    public FlatRoomDetails() {
    }
//, String utilityNo1, String utilityNo2, String parking,
    public FlatRoomDetails(String orgId, String userId, String roomCode, String roomName, String assetCode, String subAssetCode, String actualRent, String minimumRentFixed, String remarks, String status, Date lastmodifiedDate, String recordStatus) {
        this.orgId = orgId;
        this.userId = userId;
        this.roomCode = roomCode;
        this.roomName = roomName;
        this.assetCode = assetCode;
        this.subAssetCode = subAssetCode;
        this.actualRent = actualRent;
        this.minimumRentFixed = minimumRentFixed;
        this.parking = parking;
        this.remarks = remarks;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.utilityNo1 = utilityNo1;
        this.utilityNo2 = utilityNo2;
        this.recordStatus = recordStatus;
    }

    public FlatRoomDetails(Integer SNo, String orgId, String userId, String roomCode, String roomName, String assetCode, String subAssetCode, String actualRent, String minimumRentFixed, String remarks, String status, Date lastmodifiedDate, String recordStatus) {
        this.SNo = SNo;
        this.orgId = orgId;
        this.userId = userId;
        this.roomCode = roomCode;
        this.roomName = roomName;
        this.assetCode = assetCode;
        this.subAssetCode = subAssetCode;
        this.actualRent = actualRent;
        this.minimumRentFixed = minimumRentFixed;
        this.parking = parking;
        this.remarks = remarks;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.utilityNo1 = utilityNo1;
        this.utilityNo2 = utilityNo2;
        this.recordStatus = recordStatus;
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

    @Column(name = "org_id", length = 20)
    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name = "user_id", length = 20)
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name = "room_code", length = 20)
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

    @Column(name = "room_type", length = 60)
    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }
    
    

    @Column(name = "asset_code", length = 60)
    public String getAssetCode() {
        return assetCode;
    }

    public void setAssetCode(String assetCode) {
        this.assetCode = assetCode;
    }

    @Column(name = "subasset_code", length = 60)
    public String getSubAssetCode() {
        return subAssetCode;
    }

    public void setSubAssetCode(String subAssetCode) {
        this.subAssetCode = subAssetCode;
    }

    @Column(name = "actual_rent", length = 60)
    public String getActualRent() {
        return actualRent;
    }

    public void setActualRent(String actualRent) {
        this.actualRent = actualRent;
    }

    @Column(name = "minimum_rent_fixed", length = 60)
    public String getMinimumRentFixed() {
        return minimumRentFixed;
    }

    public void setMinimumRentFixed(String minimumRentFixed) {
        this.minimumRentFixed = minimumRentFixed;
    }

    @Column(name = "parking", length = 60)
    public String getParking() {
        return parking;
    }

    public void setParking(String parking) {
        this.parking = parking;
    }

    @Column(name = "remarks", length = 250)
    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Column(name = "status", length = 20)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
     @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "lastmodified_date")
    public Date getLastmodifiedDate() {
        return lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }

    @Column(name = "utilityno1", length = 20)
    public String getUtilityNo1() {
        return utilityNo1;
    }

    public void setUtilityNo1(String utilityNo1) {
        this.utilityNo1 = utilityNo1;
    }

    @Column(name = "utilityno2", length = 20)
    public String getUtilityNo2() {
        return utilityNo2;
    }

    public void setUtilityNo2(String utilityNo2) {
        this.utilityNo2 = utilityNo2;
    }

    @Column(name = "record_status", length = 30)
    public String getRecordStatus() {
        return recordStatus;
    }

    public void setRecordStatus(String recordStatus) {
        this.recordStatus = recordStatus;
    }
    
    
    
    

}
