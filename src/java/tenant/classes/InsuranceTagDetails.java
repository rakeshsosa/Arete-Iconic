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
 * @author Lakshmi
 */
@Entity
@Table(name = "Insure_Tag_Details", schema = "arete_tms")
public class InsuranceTagDetails implements java.io.Serializable {

    private int sno;
    private String orgId;
    private String userId;
    private String insuranceNo;
    private String insuranceCategory;
    private String insuranceFor;
    private String insuranceCompName;
    private Date insValidFrom;
    private Date insValidTo;
    private String insurTerm;
    private String assetName;
    private String propertyName;
    private String floorName;
    private String flatName;
    private String remarks;
    private String assetPropVal;
    private String insuranceCoverage;
    private byte[] attachments;
    private String fileName;
    private String status;
    private Date lastmodifiedDate;

    public InsuranceTagDetails() {
    }

    public InsuranceTagDetails(String orgId, String userId, String insuranceNo, String insuranceCategory, String insuranceFor, String insuranceCompName, Date insValidFrom, Date insValidTo, String insurTerm, String assetName, String propertyName, String floorName, String flatName, String remarks, String assetPropVal, String insuranceCoverage, byte[] attachments, String fileName, String status, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.insuranceNo = insuranceNo;
        this.insuranceCategory = insuranceCategory;
        this.insuranceFor = insuranceFor;
        this.insuranceCompName = insuranceCompName;
        this.insValidFrom = insValidFrom;
        this.insValidTo = insValidTo;
        this.insurTerm = insurTerm;
        this.assetName = assetName;
        this.propertyName = propertyName;
        this.floorName = floorName;
        this.flatName = flatName;
        this.remarks = remarks;
        this.assetPropVal = assetPropVal;
        this.insuranceCoverage = insuranceCoverage;
        this.attachments = attachments;
        this.fileName = fileName;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public InsuranceTagDetails(int sNo, String orgId, String userId, String insuranceNo, String insuranceCategory, String insuranceFor, String insuranceCompName, Date insValidFrom, Date insValidTo, String insurTerm, String assetName, String propertyName, String floorName, String flatName, String remarks, String assetPropVal, String insuranceCoverage, byte[] attachments, String fileName, String status, Date lastmodifiedDate) {
        this.sno = sNo;
        this.orgId = orgId;
        this.userId = userId;
        this.insuranceNo = insuranceNo;
        this.insuranceCategory = insuranceCategory;
        this.insuranceFor = insuranceFor;
        this.insuranceCompName = insuranceCompName;
        this.insValidFrom = insValidFrom;
        this.insValidTo = insValidTo;
        this.insurTerm = insurTerm;
        this.assetName = assetName;
        this.propertyName = propertyName;
        this.floorName = floorName;
        this.flatName = flatName;
        this.remarks = remarks;
        this.assetPropVal = assetPropVal;
        this.insuranceCoverage = insuranceCoverage;
        this.attachments = attachments;
        this.fileName = fileName;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    
    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "sno", unique= true, nullable=false)
    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
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

    @Column(name = "insur_no")
    public String getInsuranceNo() {
        return insuranceNo;
    }

    public void setInsuranceNo(String insuranceNo) {
        this.insuranceNo = insuranceNo;
    }

    @Column(name = "insur_category")
    public String getInsuranceCategory() {
        return insuranceCategory;
    }

    public void setInsuranceCategory(String insuranceCategory) {
        this.insuranceCategory = insuranceCategory;
    }

    @Column(name = "insur_for")
    public String getInsuranceFor() {
        return insuranceFor;
    }

    public void setInsuranceFor(String insuranceFor) {
        this.insuranceFor = insuranceFor;
    }

    @Column(name = "insur_comp_name")
    public String getInsuranceCompName() {
        return insuranceCompName;
    }

    public void setInsuranceCompName(String insuranceCompName) {
        this.insuranceCompName = insuranceCompName;
    }

    @Column(name = "insur_valid_from")
    @Temporal(javax.persistence.TemporalType.DATE)
    public Date getInsValidFrom() {
        return insValidFrom;
    }

    public void setInsValidFrom(Date insValidFrom) {
        this.insValidFrom = insValidFrom;
    }

     @Column(name = "insur_valid_to")
    @Temporal(javax.persistence.TemporalType.DATE)
    public Date getInsValidTo() {
        return insValidTo;
    }

    public void setInsValidTo(Date insValidTo) {
        this.insValidTo = insValidTo;
    }

     @Column(name = "insur_term")
    public String getInsurTerm() {
        return insurTerm;
    }

    public void setInsurTerm(String insurTerm) {
        this.insurTerm = insurTerm;
    }

     @Column(name = "asset_name")
    public String getAssetName() {
        return assetName;
    }

    public void setAssetName(String assetName) {
        this.assetName = assetName;
    }

     @Column(name = "prop_name")
    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

     @Column(name = "floor_name")
    public String getFloorName() {
        return floorName;
    }

    public void setFloorName(String floorName) {
        this.floorName = floorName;
    }

     @Column(name = "flat_name")
    public String getFlatName() {
        return flatName;
    }

    public void setFlatName(String flatName) {
        this.flatName = flatName;
    }

     @Column(name = "remarks")
    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

     @Column(name = "asset_prop_val")
    public String getAssetPropVal() {
        return assetPropVal;
    }

    public void setAssetPropVal(String assetPropVal) {
        this.assetPropVal = assetPropVal;
    }

     @Column(name = "insur_coverage")
    public String getInsuranceCoverage() {
        return insuranceCoverage;
    }

    public void setInsuranceCoverage(String insuranceCoverage) {
        this.insuranceCoverage = insuranceCoverage;
    }

     @Column(name = "attachment" , columnDefinition = "mediumblob")
    public byte[] getAttachments() {
        return attachments;
    }

    public void setAttachments(byte[] attachments) {
        this.attachments = attachments;
    }

     @Column(name = "file_name")
    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

     @Column(name = "status")
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


    

}
