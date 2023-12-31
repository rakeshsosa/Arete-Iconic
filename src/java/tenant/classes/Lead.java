package tenant.classes;
// Generated 7 Sep, 2016 4:46:33 PM by Hibernate Tools 4.3.1

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
 * Lead generated by hbm2java
 */
@Entity
@Table(name = "lead", schema = "arete_tms"
)
public class Lead implements java.io.Serializable {

    private Integer sno;
    private String userId;
    private String orgId;
    private String leadCode;
    private String leadName;
    private String leadType;
    private String leadIndustry;
    private String contacts;
    private String leadAddress;
    private String remarks;
    private String salutation;
    private String firstName;
    private String lastName;
    private String designation;
    private String email;
    private String mobileNo;
    private String countrt;
    private String city;
    private String postBoxNo;
    private String postalCode;
    private Date dob;
    private String contaceAddress;

    private byte[] businessAttachment;
    private String businessFilename;

    private String assetCode;
    private String assetName;
    private String assetPlotCode;
    private String assetPlotNo;
    private Date folloeUpDate;
    private String followUpRemarks;
    private String recordStatus;
    private String creationFrom;
    private String attribute1;
    private String attribute2;
    private String attribute3;
    private String attribute4;
    private String attribute5;
    private String status;
    private Date lastmodefiedDate;

    public Lead() {
    }

    public Lead(String userId) {
        this.userId = userId;
    }

    public Lead(String userId, String orgId, String leadCode, String leadName, String leadType, String leadIndustry, String contacts, String leadAddress, String remarks, String salutation, String firstName, String lastName, String designation, String email, String mobileNo, String countrt, String city, String postBoxNo, String postalCode, Date dob, String contaceAddress, String assetCode, String assetName, String assetPlotCode, String assetPlotNo, Date folloeUpDate, String followUpRemarks, String recordStatus, String creationFrom, byte[] businessAttachment, String businessFilename, String attribute1, String attribute2, String attribute3, String attribute4, String attribute5, String status, Date lastmodefiedDate) {
        this.userId = userId;
        this.orgId = orgId;
        this.leadCode = leadCode;
        this.leadName = leadName;
        this.leadType = leadType;
        this.leadIndustry = leadIndustry;
        this.contacts = contacts;
        this.leadAddress = leadAddress;
        this.remarks = remarks;
        this.salutation = salutation;
        this.firstName = firstName;
        this.lastName = lastName;
        this.designation = designation;
        this.email = email;
        this.mobileNo = mobileNo;
        this.countrt = countrt;
        this.city = city;
        this.postBoxNo = postBoxNo;
        this.postalCode = postalCode;
        this.dob = dob;
        this.contaceAddress = contaceAddress;
        this.assetCode = assetCode;
        this.assetName = assetName;
        this.assetPlotCode = assetPlotCode;
        this.assetPlotNo = assetPlotNo;
        this.folloeUpDate = folloeUpDate;
        this.followUpRemarks = followUpRemarks;
        this.recordStatus = recordStatus;
        this.creationFrom = creationFrom;
        this.businessAttachment = businessAttachment;
        this.businessFilename = businessFilename;
        this.attribute1 = attribute1;
        this.attribute2 = attribute2;
        this.attribute3 = attribute3;
        this.attribute4 = attribute4;
        this.attribute5 = attribute5;
        this.status = status;
        this.lastmodefiedDate = lastmodefiedDate;
    }

    public Lead(String userId, String orgId, String leadCode, String leadName, String leadType, String leadIndustry, String contacts, String leadAddress, String remarks, String salutation, String firstName, String lastName, String designation, String email, String mobileNo, String countrt, String city, String postBoxNo, String postalCode, Date dob, String contaceAddress, String assetCode, String assetName, String assetPlotCode, String assetPlotNo, Date folloeUpDate, String followUpRemarks, String recordStatus, String status, Date lastmodefiedDate) {
        this.userId = userId;
        this.orgId = orgId;
        this.leadCode = leadCode;
        this.leadName = leadName;
        this.leadType = leadType;
        this.leadIndustry = leadIndustry;
        this.contacts = contacts;
        this.leadAddress = leadAddress;
        this.remarks = remarks;
        this.salutation = salutation;
        this.firstName = firstName;
        this.lastName = lastName;
        this.designation = designation;
        this.email = email;
        this.mobileNo = mobileNo;
        this.countrt = countrt;
        this.city = city;
        this.postBoxNo = postBoxNo;
        this.postalCode = postalCode;
        this.dob = dob;
        this.contaceAddress = contaceAddress;
        this.assetCode = assetCode;
        this.assetName = assetName;
        this.assetPlotCode = assetPlotCode;
        this.assetPlotNo = assetPlotNo;
        this.folloeUpDate = folloeUpDate;
        this.followUpRemarks = followUpRemarks;
        this.recordStatus = recordStatus;

        this.status = status;
        this.lastmodefiedDate = lastmodefiedDate;
    }

    public Lead(Integer sno, String userId, String orgId, String leadCode, String leadName, String leadType, String leadIndustry, String contacts, String leadAddress, String remarks, String salutation, String firstName, String lastName, String designation, String email, String mobileNo, String countrt, String city, String postBoxNo, String postalCode, Date dob, String contaceAddress, String assetCode, String assetName, String assetPlotCode, String assetPlotNo, Date folloeUpDate, String followUpRemarks, String recordStatus, String creationFrom, byte[] businessAttachment, String businessFilename, String attribute1, String attribute2, String attribute3, String attribute4, String attribute5, String status, Date lastmodefiedDate) {
        this.sno = sno;
        this.userId = userId;
        this.orgId = orgId;
        this.leadCode = leadCode;
        this.leadName = leadName;
        this.leadType = leadType;
        this.leadIndustry = leadIndustry;
        this.contacts = contacts;
        this.leadAddress = leadAddress;
        this.remarks = remarks;
        this.salutation = salutation;
        this.firstName = firstName;
        this.lastName = lastName;
        this.designation = designation;
        this.email = email;
        this.mobileNo = mobileNo;
        this.countrt = countrt;
        this.city = city;
        this.postBoxNo = postBoxNo;
        this.postalCode = postalCode;
        this.dob = dob;
        this.contaceAddress = contaceAddress;
        this.assetCode = assetCode;
        this.assetName = assetName;
        this.assetPlotCode = assetPlotCode;
        this.assetPlotNo = assetPlotNo;
        this.folloeUpDate = folloeUpDate;
        this.followUpRemarks = followUpRemarks;
        this.recordStatus = recordStatus;
        this.creationFrom = creationFrom;
        this.businessAttachment = businessAttachment;
        this.businessFilename = businessFilename;
        this.attribute1 = attribute1;
        this.attribute2 = attribute2;
        this.attribute3 = attribute3;
        this.attribute4 = attribute4;
        this.attribute5 = attribute5;
        this.status = status;
        this.lastmodefiedDate = lastmodefiedDate;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)

    @Column(name = "sno", unique = true, nullable = false)
    public Integer getSno() {
        return this.sno;
    }

    public void setSno(Integer sno) {
        this.sno = sno;
    }

    @Column(name = "user_Id", nullable = false, length = 20)
    public String getUserId() {
        return this.userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name = "org_Id", length = 20)
    public String getOrgId() {
        return this.orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name = "Lead_Code", length = 100)
    public String getLeadCode() {
        return this.leadCode;
    }

    public void setLeadCode(String leadCode) {
        this.leadCode = leadCode;
    }

    @Column(name = "Lead_Name", length = 100)
    public String getLeadName() {
        return leadName;
    }

    public void setLeadName(String leadName) {
        this.leadName = leadName;
    }

    @Column(name = "Lead_Type", length = 100)
    public String getLeadType() {
        return this.leadType;
    }

    public void setLeadType(String leadType) {
        this.leadType = leadType;
    }

    @Column(name = "Lead_Industry", length = 200)
    public String getLeadIndustry() {
        return this.leadIndustry;
    }

    public void setLeadIndustry(String leadIndustry) {
        this.leadIndustry = leadIndustry;
    }

    @Column(name = "Contacts", length = 100)
    public String getContacts() {
        return this.contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts;
    }

    @Column(name = "Lead_Address", length = 500)
    public String getLeadAddress() {
        return this.leadAddress;
    }

    public void setLeadAddress(String leadAddress) {
        this.leadAddress = leadAddress;
    }

    @Column(name = "Remarks", length = 200)
    public String getRemarks() {
        return this.remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Column(name = "Salutation", length = 50)
    public String getSalutation() {
        return this.salutation;
    }

    public void setSalutation(String salutation) {
        this.salutation = salutation;
    }

    @Column(name = "First_Name", length = 50)
    public String getFirstName() {
        return this.firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    @Column(name = "Last_Name", length = 50)
    public String getLastName() {
        return this.lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Column(name = "Designation", length = 50)
    public String getDesignation() {
        return this.designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    @Column(name = "Email", length = 50)
    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Column(name = "Mobile_No", length = 50)
    public String getMobileNo() {
        return this.mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }

    @Column(name = "Country", length = 50)
    public String getCountrt() {
        return this.countrt;
    }

    public void setCountrt(String countrt) {
        this.countrt = countrt;
    }

    @Column(name = "City", length = 50)
    public String getCity() {
        return this.city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Column(name = "Post_BoxNo", length = 50)
    public String getPostBoxNo() {
        return this.postBoxNo;
    }

    public void setPostBoxNo(String postBoxNo) {
        this.postBoxNo = postBoxNo;
    }

    @Column(name = "Postal_Code", length = 50)
    public String getPostalCode() {
        return this.postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "DOB", length = 19)
    public Date getDob() {
        return this.dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    @Column(name = "Contace_Address", length = 200)
    public String getContaceAddress() {
        return this.contaceAddress;
    }

    public void setContaceAddress(String contaceAddress) {
        this.contaceAddress = contaceAddress;
    }

    @Column(name = "Asset_Code", length = 50)
    public String getAssetCode() {
        return this.assetCode;
    }

    public void setAssetCode(String assetCode) {
        this.assetCode = assetCode;
    }

    @Column(name = "Asset_Name", length = 50)
    public String getAssetName() {
        return this.assetName;
    }

    public void setAssetName(String assetName) {
        this.assetName = assetName;
    }

    @Column(name = "subAsset_Code", length = 50)
    public String getAssetPlotCode() {
        return this.assetPlotCode;
    }

    public void setAssetPlotCode(String assetPlotCode) {
        this.assetPlotCode = assetPlotCode;
    }

    @Column(name = "subAsset_PlotNo", length = 50)
    public String getAssetPlotNo() {
        return this.assetPlotNo;
    }

    public void setAssetPlotNo(String assetPlotNo) {
        this.assetPlotNo = assetPlotNo;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "FollowUp_Date", length = 19)
    public Date getFolloeUpDate() {
        return this.folloeUpDate;
    }

    public void setFolloeUpDate(Date folloeUpDate) {
        this.folloeUpDate = folloeUpDate;
    }

    @Column(name = "FollowUp_Remarks", length = 500)
    public String getFollowUpRemarks() {
        return this.followUpRemarks;
    }

    public void setFollowUpRemarks(String followUpRemarks) {
        this.followUpRemarks = followUpRemarks;
    }

    @Column(name = "Record_Status", length = 50)
    public String getRecordStatus() {
        return this.recordStatus;
    }

    public void setRecordStatus(String recordStatus) {
        this.recordStatus = recordStatus;
    }

    @Column(name = "Creation_from", length = 50)
    public String getcreationFrom() {
        return creationFrom;
    }

    public void setcreationFrom(String creationFrom) {
        this.creationFrom = creationFrom;
    }

    @Column(name = "Business_Attachment", columnDefinition = "MEDIUMBLOB")
    public byte[] getBusinessAttachment() {
        return businessAttachment;
    }

    public void setBusinessAttachment(byte[] businessAttachment) {
        this.businessAttachment = businessAttachment;
    }

    @Column(name = "Business_Filename", length = 50)
    public String getBusinessFilename() {
        return businessFilename;
    }

    public void setBusinessFilename(String businessFilename) {
        this.businessFilename = businessFilename;
    }

    @Column(name = "lead_Source", length = 50)
    public String getAttribute1() {
        return attribute1;
    }

    public void setAttribute1(String attribute1) {
        this.attribute1 = attribute1;
    }

    @Column(name = "Attribute2", length = 50)
    public String getAttribute2() {
        return attribute2;
    }

    public void setAttribute2(String attribute2) {
        this.attribute2 = attribute2;
    }

    @Column(name = "Attribute3", length = 50)
    public String getAttribute3() {
        return attribute3;
    }

    public void setAttribute3(String attribute3) {
        this.attribute3 = attribute3;
    }

    @Column(name = "Attribute4", length = 500)
    public String getAttribute4() {
        return attribute4;
    }

    public void setAttribute4(String attribute4) {
        this.attribute4 = attribute4;
    }

    @Column(name = "Attribute5", length = 500)
    public String getAttribute5() {
        return attribute5;
    }

    public void setAttribute5(String attribute5) {
        this.attribute5 = attribute5;
    }

    @Column(name = "Status", length = 50)
    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "Lastmodefied_Date", length = 19)
    public Date getLastmodefiedDate() {
        return this.lastmodefiedDate;
    }

    public void setLastmodefiedDate(Date lastmodefiedDate) {
        this.lastmodefiedDate = lastmodefiedDate;
    }

}
