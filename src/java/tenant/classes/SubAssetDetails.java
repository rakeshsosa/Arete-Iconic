package tenant.classes;
// Generated 21 Sep, 2016 3:04:58 PM by Hibernate Tools 4.3.1

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * SubAssetDetails generated by hbm2java
 */
@Entity
@Table(name = "sub_asset_details", schema = "arete_tms"
)       
public class SubAssetDetails implements java.io.Serializable {

    private Integer SNo;
    private String actualRent;
    private String area;
    private String assetCode;
    private String assetName;
    private String attribute1;
    private String attribute2;
    private String attribute3;
    private String attribute4;
    private String attribute5;
    private String floor;
    private Date lastmodifiedDate;
    private String length;
    private String minimumRentFixed;
    private String orgId;
    private String parking;
    private String remarks;
    private String status;
    private String subAssetCode;
    private String subAssetName;
    private String subAssetType;
    private String userId;
    private String utilityNo1;
    private String utilityNo2;
    private String valueOfSubAsset;
    private String valueOfSubClassifiedAsset;
    private String width;
    private String recordStatus;
    private String unitName;
    private String unitType;
    private Boolean status1; 

    public SubAssetDetails() {
    }
//, String parking, String utilityNo1, String utilityNo2
    public SubAssetDetails(String orgId, String userId, String assetCode, String assetName, String subAssetCode, String subAssetName,
            String floor, String subAssetType, String area, String valueOfSubAsset, String minimumRentFixed, 
            String actualRent, String remarks, String status, String attribute1, String attribute2, String attribute3, String attribute4,
            String attribute5, Date lastmodifiedDate, String recordStatus,String unitName,String unitType, Boolean status1) {
        this.actualRent = actualRent;
        this.area = area;
        this.assetCode = assetCode;
        this.assetName = assetName;
        this.attribute1 = attribute1;
        this.attribute2 = attribute2;
        this.attribute3 = attribute3;
        this.attribute4 = attribute4;
        this.attribute5 = attribute5;
        this.floor = floor;
        this.lastmodifiedDate = lastmodifiedDate;
        this.length = length;
        this.minimumRentFixed = minimumRentFixed;
        this.orgId = orgId;
        //this.parking = parking;
        this.remarks = remarks;
        this.status = status;
        this.subAssetCode = subAssetCode;
        this.subAssetName = subAssetName;
        this.subAssetType = subAssetType;
        this.userId = userId;
//        this.utilityNo1 = utilityNo1;
//        this.utilityNo2 = utilityNo2;
        this.valueOfSubAsset = valueOfSubAsset;
        this.width = width;
        this.recordStatus = recordStatus;
        this.unitName = unitName;
        this.unitType = unitType;
        this.status1 = status1;
    }
//, String parking, String utilityNo1, String utilityNo2
    public SubAssetDetails(Integer SNo, String orgId, String userId, String assetCode, String assetName, String subAssetCode,
            String subAssetName, String floor, String subAssetType, String area, String valueOfSubAsset, String minimumRentFixed,
            String actualRent, String remarks, String status, String attribute1, String attribute2, String attribute3, String attribute4,
            String attribute5, Date lastmodifiedDate, String recordStatus,String unitName,String unitType, Boolean status1) {
        this.SNo = SNo;
        this.actualRent = actualRent;
        this.area = area;
        this.assetCode = assetCode;
        this.assetName = assetName;
        this.attribute1 = attribute1;
        this.attribute2 = attribute2;
        this.attribute3 = attribute3;
        this.attribute4 = attribute4;
        this.attribute5 = attribute5;
        this.floor = floor;
        this.lastmodifiedDate = lastmodifiedDate;
        this.length = length;
        this.minimumRentFixed = minimumRentFixed;
        this.orgId = orgId;
        //this.parking = parking;
        this.remarks = remarks;
        this.status = status;
        this.subAssetCode = subAssetCode;
        this.subAssetName = subAssetName;
        this.subAssetType = subAssetType;
        this.userId = userId;
//        this.utilityNo1 = utilityNo1;
//        this.utilityNo2 = utilityNo2;
        this.valueOfSubAsset = valueOfSubAsset;
        this.width = width;
        this.recordStatus = recordStatus;
        this.unitName = unitName;
        this.unitType = unitType;
        this.status1 = status1;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "s_no", unique = true, nullable = false)
    public Integer getSNo() {
        return this.SNo;
    }

    public void setSNo(Integer SNo) {
        this.SNo = SNo;
    }

    @Column(name = "actual_rent", length = 60)
    public String getActualRent() {
        return this.actualRent;
    }

    public void setActualRent(String actualRent) {
        this.actualRent = actualRent;
    }

    @Column(name = "area", length = 60)
    public String getArea() {
        return this.area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    @Column(name = "asset_code", length = 60)
    public String getAssetCode() {
        return this.assetCode;
    }

    public void setAssetCode(String assetCode) {
        this.assetCode = assetCode;
    }

    @Column(name = "asset_name", length = 60)
    public String getAssetName() {
        return this.assetName;
    }

    public void setAssetName(String assetName) {
        this.assetName = assetName;
    }

    @Column(name = "attribute_1", length = 60)
    public String getAttribute1() {
        return this.attribute1;
    }

    public void setAttribute1(String attribute1) {
        this.attribute1 = attribute1;
    }

    @Column(name = "attribute_2", length = 60)
    public String getAttribute2() {
        return this.attribute2;
    }

    public void setAttribute2(String attribute2) {
        this.attribute2 = attribute2;
    }

    @Column(name = "attribute_3", length = 60)
    public String getAttribute3() {
        return this.attribute3;
    }

    public void setAttribute3(String attribute3) {
        this.attribute3 = attribute3;
    }

    @Column(name = "attribute_4")
    public String getAttribute4() {
        return this.attribute4;
    }

    public void setAttribute4(String attribute4) {
        this.attribute4 = attribute4;
    }

    @Column(name = "attribute_5")
    public String getAttribute5() {
        return this.attribute5;
    }

    public void setAttribute5(String attribute5) {
        this.attribute5 = attribute5;
    }

    @Column(name = "floor", length = 60)
    public String getFloor() {
        return this.floor;
    }

    public void setFloor(String floor) {
        this.floor = floor;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "lastmodified_date", length = 19)
    public Date getLastmodifiedDate() {
        return this.lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }

    @Column(name = "length", length = 60)
    public String getLength() {
        return this.length;
    }

    public void setLength(String length) {
        this.length = length;
    }

    @Column(name = "minimum_rent_fixed", length = 60)
    public String getMinimumRentFixed() {
        return this.minimumRentFixed;
    }

    public void setMinimumRentFixed(String minimumRentFixed) {
        this.minimumRentFixed = minimumRentFixed;
    }

    @Column(name = "org_id", length = 60)
    public String getOrgId() {
        return this.orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name = "parking", length = 60)
    public String getParking() {
        return this.parking;
    }

    public void setParking(String parking) {
        this.parking = parking;
    }

    @Column(name = "remarks", length = 500)
    public String getRemarks() {
        return this.remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Column(name = "status", length = 60)
    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Column(name = "sub_asset_code", length = 60)
    public String getSubAssetCode() {
        return this.subAssetCode;
    }

    public void setSubAssetCode(String subAssetCode) {
        this.subAssetCode = subAssetCode;
    }

    @Column(name = "sub_asset_name", length = 60)
    public String getSubAssetName() {
        return this.subAssetName;
    }

    public void setSubAssetName(String subAssetName) {
        this.subAssetName = subAssetName;
    }

    @Column(name = "sub_asset_type", length = 60)
    public String getSubAssetType() {
        return this.subAssetType;
    }

    public void setSubAssetType(String subAssetType) {
        this.subAssetType = subAssetType;
    }

    @Column(name = "user_id", length = 60)
    public String getUserId() {
        return this.userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name = "utility_no_1", length = 60)
    public String getUtilityNo1() {
        return this.utilityNo1;
    }

    public void setUtilityNo1(String utilityNo1) {
        this.utilityNo1 = utilityNo1;
    }

    @Column(name = "utility_no_2", length = 60)
    public String getUtilityNo2() {
        return this.utilityNo2;
    }

    public void setUtilityNo2(String utilityNo2) {
        this.utilityNo2 = utilityNo2;
    }

    @Column(name = "value_of_sub_asset", length = 60)
    public String getValueOfSubAsset() {
        return this.valueOfSubAsset;
    }

    public void setValueOfSubAsset(String valueOfSubAsset) {
        this.valueOfSubAsset = valueOfSubAsset;
    }

    @Column(name = "value_of_sub_classified_asset", length = 60)
    public String getValueOfSubClassifiedAsset() {
        return this.valueOfSubClassifiedAsset;
    }

    public void setValueOfSubClassifiedAsset(String valueOfSubClassifiedAsset) {
        this.valueOfSubClassifiedAsset = valueOfSubClassifiedAsset;
    }

    @Column(name = "width", length = 60)
    public String getWidth() {
        return this.width;
    }

    public void setWidth(String width) {
        this.width = width;
    }

    @Column(name = "record_status", length = 60)
    public String getRecordStatus() {
        return this.recordStatus;
    }

    public void setRecordStatus(String recordStatus) {
        this.recordStatus = recordStatus;
    }

    @Column(name = "unit_name")
    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName;
    }

    @Column(name = "unit_type")
    public String getUnitType() {
        return unitType;
    }

    public void setUnitType(String unitType) {
        this.unitType = unitType;
    }

    @Column(name = "status_one")
    public Boolean getStatus1() {
        return status1;
    }

    public void setStatus1(Boolean status1) {
        this.status1 = status1;
    }

    
    
}
