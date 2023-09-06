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
 * @author vinay
 */
@Entity
@Table(name = "area_management_grid", schema = "arete_tms")     
public class AreaManagementGrid implements java.io.Serializable{
    
    private Integer sno;
    private String userId;
    private String orgId;
    private String assetCode;
    private String totalLandArea;
    private String builtUpArea;
    private String commonArea;
    private String totalRentalArea;
    private String units;
    private String floor;
    private Date lastmodifiedDate;
    private String status;

    public AreaManagementGrid() {
    }

    public AreaManagementGrid(String userId, String orgId, String assetCode, String totalLandArea, String builtUpArea, String commonArea, String totalRentalArea, String units, String floor, Date lastmodifiedDate, String status) {
        this.userId = userId;
        this.orgId = orgId;
        this.assetCode = assetCode;
        this.totalLandArea = totalLandArea;
        this.builtUpArea = builtUpArea;
        this.commonArea = commonArea;
        this.totalRentalArea = totalRentalArea;
        this.units = units;
        this.floor = floor;
        this.lastmodifiedDate = lastmodifiedDate;
        this.status = status;
    }

    public AreaManagementGrid(Integer sno, String userId, String orgId, String assetCode, String totalLandArea, String builtUpArea, String commonArea, String totalRentalArea, String units, String floor, Date lastmodifiedDate, String status) {
        this.sno = sno;
        this.userId = userId;
        this.orgId = orgId;
        this.assetCode = assetCode;
        this.totalLandArea = totalLandArea;
        this.builtUpArea = builtUpArea;
        this.commonArea = commonArea;
        this.totalRentalArea = totalRentalArea;
        this.units = units;
        this.floor = floor;
        this.lastmodifiedDate = lastmodifiedDate;
        this.status = status;
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

    @Column(name = "units")
    public String getUnits() {
        return units;
    }

    public void setUnits(String units) {
        this.units = units;
    }

    @Column(name = "floor")
    public String getFloor() {
        return floor;
    }

    public void setFloor(String floor) {
        this.floor = floor;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "lastmodified_date", length = 19)
    public Date getLastmodifiedDate() {
        return lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }

    @Column(name = "status")
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Column(name = "asset_code")
    public String getAssetCode() {
        return assetCode;
    }

    public void setAssetCode(String assetCode) {
        this.assetCode = assetCode;
    }
    
    
    
}
