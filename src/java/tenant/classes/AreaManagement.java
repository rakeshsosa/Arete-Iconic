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
 * @author Munusamy
 */
@Entity
@Table(name = "area_management", schema = "arete_tms"
)      
public class AreaManagement implements java.io.Serializable{
    
    private Integer sno;
    private String userId;
    private String orgId;
    private String areaCode;
    private String assetCode;
    private String assetName;
    private String totalLandArea;
    private String builtUpArea;
    private String commonArea;
    private String totalRentalArea;
    private String status;
    private String units;
    private String floor;
    private Date lastmodifiedDate;
    
    public AreaManagement(){
        
    }

    public AreaManagement(String userId, String orgId, String areaCode, String assetCode, String assetName,
            String totalLandArea, String builtUpArea, String commonArea, String totalRentalArea, String status,String units,String floor, Date lastmodifiedDate) {
        this.userId = userId;
        this.orgId = orgId;
        this.areaCode = areaCode;
        this.assetCode = assetCode;
        this.assetName = assetName;
        this.totalLandArea = totalLandArea;
        this.builtUpArea = builtUpArea;
        this.commonArea = commonArea;
        this.totalRentalArea = totalRentalArea;
        this.status = status;
        this.units = units;
        this.floor = floor;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public AreaManagement(Integer sno, String userId, String orgId, String areaCode, String assetCode, String assetName, String totalLandArea, 
            String builtUpArea, String commonArea, String totalRentalArea, String status,String units,String floor, Date lastmodifiedDate) {
        this.sno = sno;
        this.userId = userId;
        this.orgId = orgId;
        this.areaCode = areaCode;
        this.assetCode = assetCode;
        this.assetName = assetName;
        this.totalLandArea = totalLandArea;
        this.builtUpArea = builtUpArea;
        this.commonArea = commonArea;
        this.totalRentalArea = totalRentalArea;
        this.status = status;
        this.units = units;
        this.floor = floor;
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

    @Column(name = "user_id")
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name = "org_id")
    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name = "area_code")
    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
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

    @Column(name = "total_land_area")
    public String getTotalLandArea() {
        return totalLandArea;
    }

    public void setTotalLandArea(String totalLandArea) {
        this.totalLandArea = totalLandArea;
    }

    @Column(name = "built_up_area")
    public String getBuiltUpArea() {
        return builtUpArea;
    }

    public void setBuiltUpArea(String builtUpArea) {
        this.builtUpArea = builtUpArea;
    }

    @Column(name = "common_area")
    public String getCommonArea() {
        return commonArea;
    }

    public void setCommonArea(String commonArea) {
        this.commonArea = commonArea;
    }

    @Column(name = "total_rental_area")
    public String getTotalRentalArea() {
        return totalRentalArea;
    }

    public void setTotalRentalArea(String totalRentalArea) {
        this.totalRentalArea = totalRentalArea;
    }

    @Column(name = "status")
    public String getStatus() {
        return status;
    }

    @Column(name = "units")
    public String getUnits() {
        return units;
    }

    public void setUnits(String units) {
        this.units = units;
    }
    
    @Column(name = "floor")
    public String getFloor() {
        return this.floor;
    }

    public void setFloor(String floor) {
        this.floor = floor;
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
}
