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
@Table(name = "rent_posting", schema = "arete_tms"
)
public class RentPosting {

    private int SNo;
    private String orgId;
    private String userId;
    private String assetName;
    private String subclassifiedAstno;
    private String buildingNo;
    private String wayNo;
    private String assetArea;
    private String blockNo;
    private String plotNo;
    private String streetNo;
    private String assetPostalCode;
    private String assetPostboxNo;
    private String waterBillno;
    private String electricityBillno;
    private Date rentpostingDate;
    private String rentpostingType;
    private String landlordName;
    private String mailId;
    private String contactNo;
    private String advanceAmount;
    private String rentAmount;
    private String status;
    private String rentpostingstatus;
    private Date lastmodifiedDate;
    private Date creationDate;
    private String actualRent;
    private String minimumRentFixed;

    public RentPosting() {
    }

    public RentPosting(String orgId, String userId, String assetName, String subclassifiedAstno, String buildingNo, String wayNo, String assetArea, String blockNo, String plotNo, String streetNo, String assetPostalCode, String assetPostboxNo, String waterBillno, String electricityBillno, Date rentpostingDate, String rentpostingType, String landlordName, String mailId, String contactNo, String advanceAmount, String rentAmount, String status, String rentpostingstatus, Date lastmodifiedDate, Date creationDate, String actualRent, String minimumRentFixed) {
        this.orgId = orgId;
        this.userId = userId;
        this.assetName = assetName;
        this.subclassifiedAstno = subclassifiedAstno;
        this.buildingNo = buildingNo;
        this.wayNo = wayNo;
        this.assetArea = assetArea;
        this.blockNo = blockNo;
        this.plotNo = plotNo;
        this.streetNo = streetNo;
        this.assetPostalCode = assetPostalCode;
        this.assetPostboxNo = assetPostboxNo;
        this.waterBillno = waterBillno;
        this.electricityBillno = electricityBillno;
        this.lastmodifiedDate = lastmodifiedDate;
        this.creationDate = creationDate;
        this.rentpostingDate = rentpostingDate;
        this.rentpostingType = rentpostingType;
        this.landlordName = landlordName;
        this.mailId = mailId;
        this.contactNo = contactNo;
        this.advanceAmount = advanceAmount;
        this.rentAmount = rentAmount;
        this.status = status;
        this.rentpostingstatus = rentpostingstatus;
        this.actualRent = actualRent;
        this.minimumRentFixed = minimumRentFixed;

    }

    public RentPosting(int SNo, String orgId, String userId, String assetName, String subclassifiedAstno, String buildingNo, String wayNo, String assetArea, String blockNo, String plotNo, String streetNo, String assetPostalCode, String assetPostboxNo, String waterBillno, String electricityBillno, Date rentpostingDate, String rentpostingType, String landlordName, String mailId, String contactNo, String advanceAmount, String rentAmount, String status, String rentpostingstatus, Date lastmodifiedDate, Date creationDate, String actualRent, String minimumRentFixed) {
        this.SNo = SNo;
        this.orgId = orgId;
        this.userId = userId;
        this.assetName = assetName;
        this.subclassifiedAstno = subclassifiedAstno;
        this.buildingNo = buildingNo;
        this.wayNo = wayNo;
        this.assetArea = assetArea;
        this.blockNo = blockNo;
        this.plotNo = plotNo;
        this.streetNo = streetNo;
        this.assetPostalCode = assetPostalCode;
        this.assetPostboxNo = assetPostboxNo;
        this.waterBillno = waterBillno;
        this.electricityBillno = electricityBillno;
        this.lastmodifiedDate = lastmodifiedDate;
        this.creationDate = creationDate;
        this.rentpostingDate = rentpostingDate;
        this.rentpostingType = rentpostingType;
        this.landlordName = landlordName;
        this.mailId = mailId;
        this.contactNo = contactNo;
        this.advanceAmount = advanceAmount;
        this.rentAmount = rentAmount;
        this.status = status;
        this.rentpostingstatus = rentpostingstatus;
        this.actualRent = actualRent;
        this.minimumRentFixed = minimumRentFixed;

    }

    @Id
    @GeneratedValue(strategy = IDENTITY)

    @Column(name = "s_no", unique = true, nullable = false)
    public int getSNo() {
        return this.SNo;
    }

    public void setSNo(int SNo) {
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

    @Column(name = "building_no", length = 60)
    public String getBuildingNo() {
        return buildingNo;
    }

    public void setBuildingNo(String buildingNo) {
        this.buildingNo = buildingNo;
    }

    @Column(name = "way_no", length = 60)
    public String getWayNo() {
        return wayNo;
    }

    public void setWayNo(String wayNo) {
        this.wayNo = wayNo;
    }

    @Column(name = "asset_area", length = 60)
    public String getAssetArea() {
        return assetArea;
    }

    public void setAssetArea(String assetArea) {
        this.assetArea = assetArea;
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

    @Column(name = "street_no", length = 60)
    public String getStreetNo() {
        return streetNo;
    }

    public void setStreetNo(String streetNo) {
        this.streetNo = streetNo;
    }

    @Column(name = "asset_postal_code", length = 60)
    public String getAssetPostalCode() {
        return assetPostalCode;
    }

    public void setAssetPostalCode(String assetPostalCode) {
        this.assetPostalCode = assetPostalCode;
    }

    @Column(name = "asset_postbox_no", length = 60)
    public String getAssetPostboxNo() {
        return assetPostboxNo;
    }

    public void setAssetPostboxNo(String assetPostboxNo) {
        this.assetPostboxNo = assetPostboxNo;
    }

    @Column(name = "water_billno", length = 60)
    public String getWaterBillno() {
        return waterBillno;
    }

    public void setWaterBillno(String waterBillno) {
        this.waterBillno = waterBillno;
    }

    @Column(name = "electricity_billno", length = 60)
    public String getElectricityBillno() {
        return electricityBillno;
    }

    public void setElectricityBillno(String electricityBillno) {
        this.electricityBillno = electricityBillno;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "lastmodified_date", length = 19)
    public Date getLastmodifiedDate() {
        return lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
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
    @Column(name = "rentposting_date", length = 60)
    public Date getRentpostingDate() {
        return rentpostingDate;
    }

    public void setRentpostingDate(Date rentpostingDate) {
        this.rentpostingDate = rentpostingDate;
    }

    @Column(name = "rentposting_type", length = 60)
    public String getRentpostingType() {
        return rentpostingType;
    }

    public void setRentpostingType(String rentpostingType) {
        this.rentpostingType = rentpostingType;
    }

    @Column(name = "landlord_name", length = 60)
    public String getLandlordName() {
        return landlordName;
    }

    public void setLandlordName(String landlordName) {
        this.landlordName = landlordName;
    }

    @Column(name = "mail_id", length = 60)
    public String getMailId() {
        return mailId;
    }

    public void setMailId(String mailId) {
        this.mailId = mailId;
    }

    @Column(name = "contact_no", length = 60)
    public String getContactNo() {
        return contactNo;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    @Column(name = "advance_amount", length = 60)
    public String getAdvanceAmount() {
        return advanceAmount;
    }

    public void setAdvanceAmount(String advanceAmount) {
        this.advanceAmount = advanceAmount;
    }

    @Column(name = "rent_amount", length = 60)
    public String getRentAmount() {
        return rentAmount;
    }

    public void setRentAmount(String rentAmount) {
        this.rentAmount = rentAmount;
    }

    @Column(name = "status", length = 50)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Column(name = "rentposting_status", length = 50)
    public String getRentpostingstatus() {
        return rentpostingstatus;
    }

    public void setRentpostingstatus(String rentpostingstatus) {
        this.rentpostingstatus = rentpostingstatus;
    }

    @Column(name = "actual_rent", length = 50)
    public String getActualRent() {
        return actualRent;
    }

    public void setActualRent(String actualRent) {
        this.actualRent = actualRent;
    }

    @Column(name = "minimum_rentfixed", length = 50)
    public String getMinimumRentFixed() {
        return minimumRentFixed;
    }

    public void setMinimumRentFixed(String minimumRentFixed) {
        this.minimumRentFixed = minimumRentFixed;
    }

}
