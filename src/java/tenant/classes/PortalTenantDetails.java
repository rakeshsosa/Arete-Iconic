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
 * @author ebs
 */
@Entity
@Table(name = "portal_tenant_detail", schema = "arete_tms"
)
public class PortalTenantDetails implements java.io.Serializable {

    private Integer SNo;
    private String orgId;
    private String userId;
    private String tenantCode;
    private String llCategory;
    private String llName;
    private String llId;
    private String llCrNo;
    private String llContactno;
    private String llWorkContactno;
    private String llMailid;
    private byte[] llAttachment;
    private String llOrgfileName;
    private String tenantType;
    private String tenantCategory;
    private String tenantFname;
    private String tenantLname;
    private String tenantCitizenship;
    private String tenantId;
    private byte[] tenantAttachment;
    private String tenOrgfileName;
    private String tenantCrNo;
    private String companyAddress;
    private String postalCode1;
    private String tenantContactno;
    private String tenantWorkContactno;
    private String tenantMailid;
    private String permanentAddress;
    private String correspondenceAddress;
    private String postalCode;
    private String postboxNo;
    private String sponcerName;
    private String sponcerAddress;
    private String companyName;
    private String postboxNo1;
    private String jointeeName1;
    private String jointeeAddress1;
    private String jointeeName2;
    private String jointeeAddress2;
    private String remarks;
    private String assetName;
    private String assetNames;
    private String subclassifiedAstno;
    private String flatNo;
    private String buildingNo;
    private String wayNo;
    private String assetArea;
    private String blockNo;
    private String plotNo;
    private String streetNo;
    private String waterBillno;
    private String electricityBillno;
    private String assetPostalCode;
    private String assetPostboxNo;
    private String contractPeriod;
    private String contractName;
    private Date startsFrom;
    private Date endsTo;
    private byte[] contractAttachment;
    private String contOrgfileName;
    private String billingCycle;
    private String advanceAmount;
    private Date dueDate;
    private String totalAmount;
    private String discountforadvance;
    private String discountforrent;
    private Date contractSigningDate;
    private String recordstatus;
    private String vacatestatus;
    private String appstatus;
    private String gfcremarks;
    private String cforemarks;
    private String crIdNo;
    private String extra2;
    private String extra3;
    private String extra4;
    private String extra5;
    private String status;
    private Date creationDate;
    private Date lastmodifiedDate;
    private String amctenantName;
    private Date startDate;
    private Date endDate;
    private String percentage;
    private String amcamount;

    public PortalTenantDetails() {
    }

    public PortalTenantDetails(String orgId, String userId, String tenantCode, String llCategory, String llName, String llId, String llCrNo, String llContactno, String llWorkContactno, String llMailid, byte[] llAttachment, String llOrgfileName, String tenantType, String tenantCategory, String tenantFname, String tenantLname, String tenantCitizenship, String tenantId, byte[] tenantAttachment, String tenOrgfileName, String tenantCrNo, String companyAddress, String postalCode1, String tenantContactno, String tenantWorkContactno, String tenantMailid, String permanentAddress, String correspondenceAddress, String postalCode, String postboxNo, String sponcerName, String sponcerAddress, String companyName, String postboxNo1, String jointeeName1, String jointeeAddress1, String jointeeName2, String jointeeAddress2, String remarks, String assetName, String assetNames, String subclassifiedAstno, String flatNo, String buildingNo, String wayNo, String assetArea, String blockNo, String plotNo, String streetNo, String assetPostalCode, String assetPostboxNo, String contractPeriod, String contractName, Date startsFrom, Date endsTo, byte[] contractAttachment, String contOrgfileName, String billingCycle, String advanceAmount, Date dueDate, String totalAmount, String discountforadvance, String discountforrent, Date contractSigningDate, String recordstatus, String appstatus, String crIdNo, String extra2, String extra3, String extra4, String extra5, String status, Date creationDate, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.tenantCode = tenantCode;
        this.llCategory = llCategory;
        this.llName = llName;
        this.llId = llId;
        this.llCrNo = llCrNo;
        this.llContactno = llContactno;
        this.llWorkContactno = llWorkContactno;
        this.llMailid = llMailid;
        this.llAttachment = llAttachment;
        this.llOrgfileName = llOrgfileName;
        this.tenantType = tenantType;
        this.tenantCategory = tenantCategory;
        this.tenantFname = tenantFname;
        this.tenantLname = tenantLname;
        this.tenantCitizenship = tenantCitizenship;
        this.tenantId = tenantId;
        this.tenantAttachment = tenantAttachment;
        this.tenOrgfileName = tenOrgfileName;
        this.tenantCrNo = tenantCrNo;
        this.companyAddress = companyAddress;
        this.postalCode1 = postalCode1;
        this.tenantContactno = tenantContactno;
        this.tenantWorkContactno = tenantWorkContactno;
        this.tenantMailid = tenantMailid;
        this.permanentAddress = permanentAddress;
        this.correspondenceAddress = correspondenceAddress;
        this.postalCode = postalCode;
        this.postboxNo = postboxNo;
        this.sponcerName = sponcerName;
        this.sponcerAddress = sponcerAddress;
        this.companyName = companyName;
        this.postboxNo1 = postboxNo1;
        this.jointeeName1 = jointeeName1;
        this.jointeeAddress1 = jointeeAddress1;
        this.jointeeName2 = jointeeName2;
        this.jointeeAddress2 = jointeeAddress2;
        this.remarks = remarks;
        this.assetName = assetName;
        this.assetNames = assetNames;
        this.subclassifiedAstno = subclassifiedAstno;
        this.flatNo = flatNo;
        this.buildingNo = buildingNo;
        this.wayNo = wayNo;
        this.assetArea = assetArea;
        this.blockNo = blockNo;
        this.plotNo = plotNo;
        this.streetNo = streetNo;
//        this.waterBillno = waterBillno;
//        this.electricityBillno = electricityBillno;
        this.assetPostalCode = assetPostalCode;
        this.assetPostboxNo = assetPostboxNo;
        this.contractPeriod = contractPeriod;
        this.contractName = contractName;
        this.startsFrom = startsFrom;
        this.endsTo = endsTo;
        this.contractAttachment = contractAttachment;
        this.contOrgfileName = contOrgfileName;
        this.billingCycle = billingCycle;
        this.advanceAmount = advanceAmount;
        this.dueDate = dueDate;
        this.totalAmount = totalAmount;
        this.discountforadvance = discountforadvance;
        this.discountforrent = discountforrent;
        this.contractSigningDate = contractSigningDate;
        this.recordstatus = recordstatus;
        this.appstatus = appstatus;;
        this.crIdNo = crIdNo;
        this.extra2 = extra2;
        this.extra3 = extra3;
        this.extra4 = extra4;
        this.extra5 = extra5;
        this.status = status;
        this.creationDate = creationDate;
//        this.lastmodifiedDate = lastmodifiedDate;
//        this.amctenantName = amctenantName;
//        this.startDate = startDate;
//        this.endDate = endDate;
//        this.percentage = percentage;
//        this.amcamount = amcamount;
    }
    public PortalTenantDetails(String orgId, String userId, String tenantCode, String llCategory, String llName, String llId, String llCrNo, String llContactno, String llWorkContactno, String llMailid, byte[] llAttachment, String llOrgfileName, String tenantType, String tenantCategory, String tenantFname, String tenantLname, String tenantCitizenship, String tenantId, String tenantCrNo, String companyAddress, String postalCode1, String tenantContactno, String tenantWorkContactno, String tenantMailid, String permanentAddress, String correspondenceAddress, String postalCode, String postboxNo, String sponcerName, String sponcerAddress, String companyName, String postboxNo1, String jointeeName1, String jointeeAddress1, String jointeeName2, String jointeeAddress2, String remarks, String assetName, String assetNames, String subclassifiedAstno, String flatNo, String buildingNo, String wayNo, String assetArea, String blockNo, String plotNo, String streetNo, String assetPostalCode, String assetPostboxNo, String contractPeriod, String contractName, Date startsFrom, Date endsTo, byte[] contractAttachment, String contOrgfileName, String billingCycle, String advanceAmount, Date dueDate, String totalAmount, String discountforadvance, String discountforrent, Date contractSigningDate, String recordstatus, String appstatus, String crIdNo, String extra2, String extra3, String extra4, String extra5, String status, Date creationDate, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.tenantCode = tenantCode;
        this.llCategory = llCategory;
        this.llName = llName;
        this.llId = llId;
        this.llCrNo = llCrNo;
        this.llContactno = llContactno;
        this.llWorkContactno = llWorkContactno;
        this.llMailid = llMailid;
        this.llAttachment = llAttachment;
        this.llOrgfileName = llOrgfileName;
        this.tenantType = tenantType;
        this.tenantCategory = tenantCategory;
        this.tenantFname = tenantFname;
        this.tenantLname = tenantLname;
        this.tenantCitizenship = tenantCitizenship;
        this.tenantId = tenantId;
//        this.tenantAttachment = tenantAttachment;
//        this.tenOrgfileName = tenOrgfileName;
        this.tenantCrNo = tenantCrNo;
        this.companyAddress = companyAddress;
        this.postalCode1 = postalCode1;
        this.tenantContactno = tenantContactno;
        this.tenantWorkContactno = tenantWorkContactno;
        this.tenantMailid = tenantMailid;
        this.permanentAddress = permanentAddress;
        this.correspondenceAddress = correspondenceAddress;
        this.postalCode = postalCode;
        this.postboxNo = postboxNo;
        this.sponcerName = sponcerName;
        this.sponcerAddress = sponcerAddress;
        this.companyName = companyName;
        this.postboxNo1 = postboxNo1;
        this.jointeeName1 = jointeeName1;
        this.jointeeAddress1 = jointeeAddress1;
        this.jointeeName2 = jointeeName2;
        this.jointeeAddress2 = jointeeAddress2;
        this.remarks = remarks;
        this.assetName = assetName;
        this.assetNames = assetNames;
        this.subclassifiedAstno = subclassifiedAstno;
        this.flatNo = flatNo;
        this.buildingNo = buildingNo;
        this.wayNo = wayNo;
        this.assetArea = assetArea;
        this.blockNo = blockNo;
        this.plotNo = plotNo;
        this.streetNo = streetNo;
//        this.waterBillno = waterBillno;
//        this.electricityBillno = electricityBillno;
        this.assetPostalCode = assetPostalCode;
        this.assetPostboxNo = assetPostboxNo;
        this.contractPeriod = contractPeriod;
        this.contractName = contractName;
        this.startsFrom = startsFrom;
        this.endsTo = endsTo;
        this.contractAttachment = contractAttachment;
        this.contOrgfileName = contOrgfileName;
        this.billingCycle = billingCycle;
        this.advanceAmount = advanceAmount;
        this.dueDate = dueDate;
        this.totalAmount = totalAmount;
        this.discountforadvance = discountforadvance;
        this.discountforrent = discountforrent;
        this.contractSigningDate = contractSigningDate;
        this.recordstatus = recordstatus;
        this.appstatus = appstatus;;
        this.crIdNo = crIdNo;
        this.extra2 = extra2;
        this.extra3 = extra3;
        this.extra4 = extra4;
        this.extra5 = extra5;
        this.status = status;
        this.creationDate = creationDate;
//        this.lastmodifiedDate = lastmodifiedDate;
//        this.amctenantName = amctenantName;
//        this.startDate = startDate;
//        this.endDate = endDate;
//        this.percentage = percentage;
//        this.amcamount = amcamount;
    }

    public PortalTenantDetails(String orgId, String userId, String tenantCode, String llCategory, String llName, String llId, String llCrNo, String llContactno, String llWorkContactno, String llMailid, byte[] llAttachment, String llOrgfileName, String tenantType, String tenantCategory, String tenantFname, String tenantLname, String tenantCitizenship, String tenantId, byte[] tenantAttachment, String tenOrgfileName, String tenantCrNo, String companyAddress, String postalCode1, String tenantContactno, String tenantWorkContactno, String tenantMailid, String permanentAddress, String correspondenceAddress, String postalCode, String postboxNo, String sponcerName, String sponcerAddress, String companyName, String postboxNo1, String jointeeName1, String jointeeAddress1, String jointeeName2, String jointeeAddress2, String remarks, String assetName, String assetNames, String subclassifiedAstno, String flatNo, String buildingNo, String wayNo, String assetArea, String blockNo, String plotNo, String streetNo, String waterBillno, String electricityBillno, String assetPostalCode, String assetPostboxNo, String contractPeriod, Date startsFrom, Date endsTo, byte[] contractAttachment, String contOrgfileName, String billingCycle, String advanceAmount, Date dueDate, String totalAmount, Date contractSigningDate, String recordstatus, String appstatus, String crIdNo, String extra2, String extra3, String extra4, String extra5, String status, Date creationDate, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.tenantCode = tenantCode;
        this.llCategory = llCategory;
        this.llName = llName;
        this.llId = llId;
        this.llCrNo = llCrNo;
        this.llContactno = llContactno;
        this.llWorkContactno = llWorkContactno;
        this.llMailid = llMailid;
        this.llAttachment = llAttachment;
        this.llOrgfileName = llOrgfileName;
        this.tenantType = tenantType;
        this.tenantCategory = tenantCategory;
        this.tenantFname = tenantFname;
        this.tenantLname = tenantLname;
        this.tenantCitizenship = tenantCitizenship;
        this.tenantId = tenantId;
        this.tenantAttachment = tenantAttachment;
        this.tenOrgfileName = tenOrgfileName;
        this.tenantCrNo = tenantCrNo;
        this.companyAddress = companyAddress;
        this.postalCode1 = postalCode1;
        this.tenantContactno = tenantContactno;
        this.tenantWorkContactno = tenantWorkContactno;
        this.tenantMailid = tenantMailid;
        this.permanentAddress = permanentAddress;
        this.correspondenceAddress = correspondenceAddress;
        this.postalCode = postalCode;
        this.postboxNo = postboxNo;
        this.sponcerName = sponcerName;
        this.sponcerAddress = sponcerAddress;
        this.companyName = companyName;
        this.postboxNo1 = postboxNo1;
        this.jointeeName1 = jointeeName1;
        this.jointeeAddress1 = jointeeAddress1;
        this.jointeeName2 = jointeeName2;
        this.jointeeAddress2 = jointeeAddress2;
        this.remarks = remarks;
        this.assetName = assetName;
        this.assetNames = assetNames;
        this.subclassifiedAstno = subclassifiedAstno;
        this.flatNo = flatNo;
        this.buildingNo = buildingNo;
        this.wayNo = wayNo;
        this.assetArea = assetArea;
        this.blockNo = blockNo;
        this.plotNo = plotNo;
        this.streetNo = streetNo;
        this.waterBillno = waterBillno;
        this.electricityBillno = electricityBillno;
        this.assetPostalCode = assetPostalCode;
        this.assetPostboxNo = assetPostboxNo;
        this.contractPeriod = contractPeriod;
        this.startsFrom = startsFrom;
        this.endsTo = endsTo;
        this.contractAttachment = contractAttachment;
        this.contOrgfileName = contOrgfileName;
        this.billingCycle = billingCycle;
        this.advanceAmount = advanceAmount;
        this.dueDate = dueDate;
        this.totalAmount = totalAmount;
        this.contractSigningDate = contractSigningDate;
        this.recordstatus = recordstatus;
        this.appstatus = appstatus;
        this.crIdNo = crIdNo;
        this.extra2 = extra2;
        this.extra3 = extra3;
        this.extra4 = extra4;
        this.extra5 = extra5;
        this.status = status;
        this.creationDate = creationDate;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public PortalTenantDetails(Integer SNo, String orgId, String userId, String tenantCode, String llCategory, String llName, String llId, String llCrNo, String llContactno, String llWorkContactno, String llMailid, byte[] llAttachment, String llOrgfileName, String tenantType, String tenantCategory, String tenantFname, String tenantLname, String tenantCitizenship, String tenantId, byte[] tenantAttachment, String tenOrgfileName, String tenantCrNo, String companyAddress, String postalCode1, String tenantContactno, String tenantWorkContactno, String tenantMailid, String permanentAddress, String correspondenceAddress, String postalCode, String postboxNo, String sponcerName, String sponcerAddress, String companyName, String postboxNo1, String jointeeName1, String jointeeAddress1, String jointeeName2, String jointeeAddress2, String remarks, String assetName, String assetNames, String subclassifiedAstno, String flatNo, String buildingNo, String wayNo, String assetArea, String blockNo, String plotNo, String streetNo, String assetPostalCode, String assetPostboxNo, String contractPeriod, String contractName, Date startsFrom, Date endsTo, byte[] contractAttachment, String contOrgfileName, String billingCycle, String advanceAmount, Date dueDate, String totalAmount, String discountforadvance, String discountforrent, Date contractSigningDate, String recordstatus, String appstatus, String crIdNo, String extra2, String extra3, String extra4, String extra5, String status, Date creationDate, Date lastmodifiedDate, String amctenantName, Date startDate, Date endDate, String percentage, String amcamount) {
        this.SNo = SNo;
        this.orgId = orgId;
        this.userId = userId;
        this.tenantCode = tenantCode;
        this.llCategory = llCategory;
        this.llName = llName;
        this.llId = llId;
        this.llCrNo = llCrNo;
        this.llContactno = llContactno;
        this.llWorkContactno = llWorkContactno;
        this.llMailid = llMailid;
        this.llAttachment = llAttachment;
        this.llOrgfileName = llOrgfileName;
        this.tenantType = tenantType;
        this.tenantCategory = tenantCategory;
        this.tenantFname = tenantFname;
        this.tenantLname = tenantLname;
        this.tenantCitizenship = tenantCitizenship;
        this.tenantId = tenantId;
        this.tenantAttachment = tenantAttachment;
        this.tenOrgfileName = tenOrgfileName;
        this.tenantCrNo = tenantCrNo;
        this.companyAddress = companyAddress;
        this.postalCode1 = postalCode1;
        this.tenantContactno = tenantContactno;
        this.tenantWorkContactno = tenantWorkContactno;
        this.tenantMailid = tenantMailid;
        this.permanentAddress = permanentAddress;
        this.correspondenceAddress = correspondenceAddress;
        this.postalCode = postalCode;
        this.postboxNo = postboxNo;
        this.sponcerName = sponcerName;
        this.sponcerAddress = sponcerAddress;
        this.companyName = companyName;
        this.postboxNo1 = postboxNo1;
        this.jointeeName1 = jointeeName1;
        this.jointeeAddress1 = jointeeAddress1;
        this.jointeeName2 = jointeeName2;
        this.jointeeAddress2 = jointeeAddress2;
        this.remarks = remarks;
        this.assetName = assetName;
        this.assetNames = assetNames;
        this.subclassifiedAstno = subclassifiedAstno;
        this.flatNo = flatNo;
        this.buildingNo = buildingNo;
        this.wayNo = wayNo;
        this.assetArea = assetArea;
        this.blockNo = blockNo;
        this.plotNo = plotNo;
        this.streetNo = streetNo;
//        this.waterBillno = waterBillno;
//        this.electricityBillno = electricityBillno;
        this.assetPostalCode = assetPostalCode;
        this.assetPostboxNo = assetPostboxNo;
        this.contractPeriod = contractPeriod;
        this.contractName = contractName;
        this.startsFrom = startsFrom;
        this.endsTo = endsTo;
        this.contractAttachment = contractAttachment;
        this.contOrgfileName = contOrgfileName;
        this.billingCycle = billingCycle;
        this.advanceAmount = advanceAmount;
        this.dueDate = dueDate;
        this.totalAmount = totalAmount;
        this.discountforadvance = discountforadvance;
        this.discountforrent = discountforrent;
        this.contractSigningDate = contractSigningDate;
        this.recordstatus = recordstatus;
        this.appstatus = appstatus;
        this.crIdNo = crIdNo;
        this.extra2 = extra2;
        this.extra3 = extra3;
        this.extra4 = extra4;
        this.extra5 = extra5;
        this.status = status;
        this.creationDate = creationDate;
        this.lastmodifiedDate = lastmodifiedDate;
        this.amctenantName = amctenantName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.percentage = percentage;
        this.amcamount = amcamount;
    }

    public PortalTenantDetails(Integer SNo, String orgId, String userId, String tenantCode, String llCategory, String llName, String llId, String llCrNo, String llContactno, String llWorkContactno, String llMailid, byte[] llAttachment, String llOrgfileName, String tenantType, String tenantCategory, String tenantFname, String tenantLname, String tenantCitizenship, String tenantId, byte[] tenantAttachment, String tenOrgfileName, String tenantCrNo, String companyAddress, String postalCode1, String tenantContactno, String tenantWorkContactno, String tenantMailid, String permanentAddress, String correspondenceAddress, String postalCode, String postboxNo, String sponcerName, String sponcerAddress, String companyName, String postboxNo1, String jointeeName1, String jointeeAddress1, String jointeeName2, String jointeeAddress2, String remarks, String assetName, String assetNames, String subclassifiedAstno, String buildingNo, String wayNo, String assetArea, String blockNo, String plotNo, String streetNo, String waterBillno, String electricityBillno, String assetPostalCode, String assetPostboxNo, String contractPeriod, Date startsFrom, Date endsTo, byte[] contractAttachment, String contOrgfileName, String billingCycle, String advanceAmount, Date dueDate, String totalAmount, Date contractSigningDate, String recordstatus, String appstatus, String crIdNo, String extra2, String extra3, String extra4, String extra5, String status, Date lastmodifiedDate) {
        this.SNo = SNo;
        this.orgId = orgId;
        this.userId = userId;
        this.tenantCode = tenantCode;
        this.llCategory = llCategory;
        this.llName = llName;
        this.llId = llId;
        this.llCrNo = llCrNo;
        this.llContactno = llContactno;
        this.llWorkContactno = llWorkContactno;
        this.llMailid = llMailid;
        this.llAttachment = llAttachment;
        this.llOrgfileName = llOrgfileName;
        this.tenantType = tenantType;
        this.tenantCategory = tenantCategory;
        this.tenantFname = tenantFname;
        this.tenantLname = tenantLname;
        this.tenantCitizenship = tenantCitizenship;
        this.tenantId = tenantId;
        this.tenantAttachment = tenantAttachment;
        this.tenOrgfileName = tenOrgfileName;
        this.tenantCrNo = tenantCrNo;
        this.companyAddress = companyAddress;
        this.postalCode1 = postalCode1;
        this.tenantContactno = tenantContactno;
        this.tenantWorkContactno = tenantWorkContactno;
        this.tenantMailid = tenantMailid;
        this.permanentAddress = permanentAddress;
        this.correspondenceAddress = correspondenceAddress;
        this.postalCode = postalCode;
        this.postboxNo = postboxNo;
        this.sponcerName = sponcerName;
        this.sponcerAddress = sponcerAddress;
        this.companyName = companyName;
        this.postboxNo1 = postboxNo1;
        this.jointeeName1 = jointeeName1;
        this.jointeeAddress1 = jointeeAddress1;
        this.jointeeName2 = jointeeName2;
        this.jointeeAddress2 = jointeeAddress2;
        this.remarks = remarks;
        this.assetName = assetName;
        this.assetNames = assetNames;
        this.subclassifiedAstno = subclassifiedAstno;
        this.buildingNo = buildingNo;
        this.wayNo = wayNo;
        this.assetArea = assetArea;
        this.blockNo = blockNo;
        this.plotNo = plotNo;
        this.streetNo = streetNo;
        this.waterBillno = waterBillno;
        this.electricityBillno = electricityBillno;
        this.assetPostalCode = assetPostalCode;
        this.assetPostboxNo = assetPostboxNo;
        this.contractPeriod = contractPeriod;
        this.startsFrom = startsFrom;
        this.endsTo = endsTo;
        this.contractAttachment = contractAttachment;
        this.contOrgfileName = contOrgfileName;
        this.billingCycle = billingCycle;
        this.advanceAmount = advanceAmount;
        this.dueDate = dueDate;
        this.totalAmount = totalAmount;
        this.contractSigningDate = contractSigningDate;
        this.recordstatus = recordstatus;
        this.appstatus = appstatus;
        this.crIdNo = crIdNo;
        this.extra2 = extra2;
        this.extra3 = extra3;
        this.extra4 = extra4;
        this.extra5 = extra5;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public PortalTenantDetails(String tenantCategory, String tenantFname, String tenantLname, String tenantType, String tenantId, String tenantContactno) {

        this.tenantCategory = tenantCategory;
        this.tenantFname = tenantFname;
        this.tenantLname = tenantLname;
        this.tenantType = tenantType;
        this.tenantId = tenantId;
        this.tenantContactno = tenantContactno;

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

    @Column(name = "tenant_code", length = 60)
    public String getTenantCode() {
        return this.tenantCode;
    }

    public void setTenantCode(String tenantCode) {
        this.tenantCode = tenantCode;
    }

    @Column(name = "ll_category", length = 60)
    public String getLlCategory() {
        return this.llCategory;
    }

    public void setLlCategory(String llCategory) {
        this.llCategory = llCategory;
    }

    @Column(name = "ll_name", length = 60)
    public String getLlName() {
        return this.llName;
    }

    public void setLlName(String llName) {
        this.llName = llName;
    }

    @Column(name = "ll_id", length = 60)
    public String getLlId() {
        return this.llId;
    }

    public void setLlId(String llId) {
        this.llId = llId;
    }

    @Column(name = "ll_cr_no", length = 60)
    public String getLlCrNo() {
        return this.llCrNo;
    }

    public void setLlCrNo(String llCrNo) {
        this.llCrNo = llCrNo;
    }

    @Column(name = "ll_contactno", length = 15)
    public String getLlContactno() {
        return this.llContactno;
    }

    public void setLlContactno(String llContactno) {
        this.llContactno = llContactno;
    }

    @Column(name = "ll_work_contactno", length = 15)
    public String getLlWorkContactno() {
        return this.llWorkContactno;
    }

    public void setLlWorkContactno(String llWorkContactno) {
        this.llWorkContactno = llWorkContactno;
    }

    @Column(name = "ll_mailid", length = 60)
    public String getLlMailid() {
        return this.llMailid;
    }

    public void setLlMailid(String llMailid) {
        this.llMailid = llMailid;
    }

    @Column(name = "ll_attachment", columnDefinition = "MEDIUMBLOB")
    public byte[] getLlAttachment() {
        return this.llAttachment;
    }

    public void setLlAttachment(byte[] llAttachment) {
        this.llAttachment = llAttachment;
    }

    @Column(name = "ll_orgfile_name", length = 60)
    public String getLlOrgfileName() {
        return this.llOrgfileName;
    }

    public void setLlOrgfileName(String llOrgfileName) {
        this.llOrgfileName = llOrgfileName;
    }

    @Column(name = "tenant_type", length = 60)
    public String getTenantType() {
        return this.tenantType;
    }

    public void setTenantType(String tenantType) {
        this.tenantType = tenantType;
    }

    @Column(name = "tenant_category", length = 60)
    public String getTenantCategory() {
        return this.tenantCategory;
    }

    public void setTenantCategory(String tenantCategory) {
        this.tenantCategory = tenantCategory;
    }

    @Column(name = "tenant_fname", length = 60)
    public String getTenantFname() {
        return this.tenantFname;
    }

    public void setTenantFname(String tenantFname) {
        this.tenantFname = tenantFname;
    }

    @Column(name = "tenant_lname", length = 60)
    public String getTenantLname() {
        return this.tenantLname;
    }

    public void setTenantLname(String tenantLname) {
        this.tenantLname = tenantLname;
    }

    @Column(name = "tenant_citizenship", length = 60)
    public String getTenantCitizenship() {
        return this.tenantCitizenship;
    }

    public void setTenantCitizenship(String tenantCitizenship) {
        this.tenantCitizenship = tenantCitizenship;
    }

    @Column(name = "tenant_id", length = 60)
    public String getTenantId() {
        return this.tenantId;
    }

    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }

    @Column(name = "tenant_attachment", columnDefinition = "MEDIUMBLOB")
    public byte[] getTenantAttachment() {
        return this.tenantAttachment;
    }

    public void setTenantAttachment(byte[] tenantAttachment) {
        this.tenantAttachment = tenantAttachment;
    }

    @Column(name = "ten_orgfile_name", length = 60)
    public String getTenOrgfileName() {
        return this.tenOrgfileName;
    }

    public void setTenOrgfileName(String tenOrgfileName) {
        this.tenOrgfileName = tenOrgfileName;
    }

    @Column(name = "tenant_cr_no", length = 60)
    public String getTenantCrNo() {
        return this.tenantCrNo;
    }

    public void setTenantCrNo(String tenantCrNo) {
        this.tenantCrNo = tenantCrNo;
    }

    @Column(name = "company_address", length = 250)
    public String getCompanyAddress() {
        return this.companyAddress;
    }

    public void setCompanyAddress(String companyAddress) {
        this.companyAddress = companyAddress;
    }

    @Column(name = "postal_code1", length = 60)
    public String getPostalCode1() {
        return this.postalCode1;
    }

    public void setPostalCode1(String postalCode1) {
        this.postalCode1 = postalCode1;
    }

    @Column(name = "tenant_contactno", length = 15)
    public String getTenantContactno() {
        return this.tenantContactno;
    }

    public void setTenantContactno(String tenantContactno) {
        this.tenantContactno = tenantContactno;
    }

    @Column(name = "tenant_work_contactno", length = 15)
    public String getTenantWorkContactno() {
        return this.tenantWorkContactno;
    }

    public void setTenantWorkContactno(String tenantWorkContactno) {
        this.tenantWorkContactno = tenantWorkContactno;
    }

    @Column(name = "tenant_mailid", length = 60)
    public String getTenantMailid() {
        return this.tenantMailid;
    }

    public void setTenantMailid(String tenantMailid) {
        this.tenantMailid = tenantMailid;
    }

    @Column(name = "permanent_address", length = 250)
    public String getPermanentAddress() {
        return this.permanentAddress;
    }

    public void setPermanentAddress(String permanentAddress) {
        this.permanentAddress = permanentAddress;
    }

    @Column(name = "correspondence_address", length = 250)
    public String getCorrespondenceAddress() {
        return this.correspondenceAddress;
    }

    public void setCorrespondenceAddress(String correspondenceAddress) {
        this.correspondenceAddress = correspondenceAddress;
    }

    @Column(name = "postal_code", length = 10)
    public String getPostalCode() {
        return this.postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    @Column(name = "postbox_no", length = 60)
    public String getPostboxNo() {
        return this.postboxNo;
    }

    public void setPostboxNo(String postboxNo) {
        this.postboxNo = postboxNo;
    }

    @Column(name = "sponcer_name", length = 60)
    public String getSponcerName() {
        return this.sponcerName;
    }

    public void setSponcerName(String sponcerName) {
        this.sponcerName = sponcerName;
    }

    @Column(name = "sponcer_address", length = 250)
    public String getSponcerAddress() {
        return this.sponcerAddress;
    }

    public void setSponcerAddress(String sponcerAddress) {
        this.sponcerAddress = sponcerAddress;
    }

    @Column(name = "company_name", length = 60)
    public String getCompanyName() {
        return this.companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    @Column(name = "postbox_no1", length = 60)
    public String getPostboxNo1() {
        return this.postboxNo1;
    }

    public void setPostboxNo1(String postboxNo1) {
        this.postboxNo1 = postboxNo1;
    }

    @Column(name = "jointee_name1", length = 60)
    public String getJointeeName1() {
        return this.jointeeName1;
    }

    public void setJointeeName1(String jointeeName1) {
        this.jointeeName1 = jointeeName1;
    }

    @Column(name = "jointee_address1", length = 250)
    public String getJointeeAddress1() {
        return this.jointeeAddress1;
    }

    public void setJointeeAddress1(String jointeeAddress1) {
        this.jointeeAddress1 = jointeeAddress1;
    }

    @Column(name = "jointee_name2", length = 60)
    public String getJointeeName2() {
        return this.jointeeName2;
    }

    public void setJointeeName2(String jointeeName2) {
        this.jointeeName2 = jointeeName2;
    }

    @Column(name = "jointee_address2", length = 250)
    public String getJointeeAddress2() {
        return this.jointeeAddress2;
    }

    public void setJointeeAddress2(String jointeeAddress2) {
        this.jointeeAddress2 = jointeeAddress2;
    }

    @Column(name = "remarks", length = 250)
    public String getRemarks() {
        return this.remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Column(name = "asset_code", length = 60)
    public String getAssetName() {
        return this.assetName;
    }

    public void setAssetName(String assetName) {
        this.assetName = assetName;
    }

    @Column(name = "asset_name", length = 60)
    public String getAssetNames() {
        return assetNames;
    }

    public void setAssetNames(String assetNames) {
        this.assetNames = assetNames;
    }

    @Column(name = "subasset_code", length = 60)
    public String getSubclassifiedAstno() {
        return this.subclassifiedAstno;
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

    @Column(name = "building_no", length = 60)
    public String getBuildingNo() {
        return this.buildingNo;
    }

    public void setBuildingNo(String buildingNo) {
        this.buildingNo = buildingNo;
    }

    @Column(name = "way_no", length = 60)
    public String getWayNo() {
        return this.wayNo;
    }

    public void setWayNo(String wayNo) {
        this.wayNo = wayNo;
    }

    @Column(name = "asset_area", length = 60)
    public String getAssetArea() {
        return this.assetArea;
    }

    public void setAssetArea(String assetArea) {
        this.assetArea = assetArea;
    }

    @Column(name = "block_no", length = 60)
    public String getBlockNo() {
        return this.blockNo;
    }

    public void setBlockNo(String blockNo) {
        this.blockNo = blockNo;
    }

    @Column(name = "plot_no", length = 60)
    public String getPlotNo() {
        return this.plotNo;
    }

    public void setPlotNo(String plotNo) {
        this.plotNo = plotNo;
    }

    @Column(name = "street_no", length = 60)
    public String getStreetNo() {
        return this.streetNo;
    }

    public void setStreetNo(String streetNo) {
        this.streetNo = streetNo;
    }

    @Column(name = "water_billno", length = 60)
    public String getWaterBillno() {
        return this.waterBillno;
    }

    public void setWaterBillno(String waterBillno) {
        this.waterBillno = waterBillno;
    }

    @Column(name = "electricity_billno", length = 60)
    public String getElectricityBillno() {
        return this.electricityBillno;
    }

    public void setElectricityBillno(String electricityBillno) {
        this.electricityBillno = electricityBillno;
    }

    @Column(name = "asset_postal_code", length = 60)
    public String getAssetPostalCode() {
        return this.assetPostalCode;
    }

    public void setAssetPostalCode(String assetPostalCode) {
        this.assetPostalCode = assetPostalCode;
    }

    @Column(name = "asset_postbox_no", length = 60)
    public String getAssetPostboxNo() {
        return this.assetPostboxNo;
    }

    public void setAssetPostboxNo(String assetPostboxNo) {
        this.assetPostboxNo = assetPostboxNo;
    }

    @Column(name = "contract_period", length = 60)
    public String getContractPeriod() {
        return this.contractPeriod;
    }

    public void setContractPeriod(String contractPeriod) {
        this.contractPeriod = contractPeriod;
    }

    @Column(name = "contract_name", length = 60)
    public String getContractName() {
        return contractName;
    }

    public void setContractName(String contractName) {
        this.contractName = contractName;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "starts_from", length = 10)
    public Date getStartsFrom() {
        return this.startsFrom;
    }

    public void setStartsFrom(Date startsFrom) {
        this.startsFrom = startsFrom;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "ends_to", length = 10)
    public Date getEndsTo() {
        return this.endsTo;
    }

    public void setEndsTo(Date endsTo) {
        this.endsTo = endsTo;
    }

    @Column(name = "contract_attachment", columnDefinition = "MEDIUMBLOB")
    public byte[] getContractAttachment() {
        return this.contractAttachment;
    }

    public void setContractAttachment(byte[] contractAttachment) {
        this.contractAttachment = contractAttachment;
    }

    @Column(name = "cont_orgfile_name", length = 60)
    public String getContOrgfileName() {
        return this.contOrgfileName;
    }

    public void setContOrgfileName(String contOrgfileName) {
        this.contOrgfileName = contOrgfileName;
    }

    @Column(name = "billing_cycle", length = 60)
    public String getBillingCycle() {
        return this.billingCycle;
    }

    public void setBillingCycle(String billingCycle) {
        this.billingCycle = billingCycle;
    }

    @Column(name = "advance_amount", length = 60)
    public String getAdvanceAmount() {
        return this.advanceAmount;
    }

    public void setAdvanceAmount(String advanceAmount) {
        this.advanceAmount = advanceAmount;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "due_date", length = 10)
    public Date getDueDate() {
        return this.dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    @Column(name = "total_amount", length = 60)
    public String getTotalAmount() {
        return this.totalAmount;
    }

    public void setTotalAmount(String totalAmount) {
        this.totalAmount = totalAmount;
    }

    @Column(name = "discount_advance", length = 60)
    public String getDiscountforadvance() {
        return discountforadvance;
    }

    public void setDiscountforadvance(String discountforadvance) {
        this.discountforadvance = discountforadvance;
    }

    @Column(name = "discount_rent", length = 60)
    public String getDiscountforrent() {
        return discountforrent;
    }

    public void setDiscountforrent(String discountforrent) {
        this.discountforrent = discountforrent;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "contract_signing_date", length = 60)
    public Date getContractSigningDate() {
        return this.contractSigningDate;
    }

    public void setContractSigningDate(Date contractSigningDate) {
        this.contractSigningDate = contractSigningDate;
    }

    @Column(name = "record_status", length = 60)
    public String getRecordstatus() {
        return this.recordstatus;
    }

    public void setRecordstatus(String recordstatus) {
        this.recordstatus = recordstatus;
    }

    @Column(name = "attribute1", length = 60)
    public String getCrIdNo() {
        return crIdNo;
    }

    public void setCrIdNo(String crIdNo) {
        this.crIdNo = crIdNo;
    }
//
//    @Column(name = "attribute1", length = 60)
//    public String getExtra1() {
//        return this.extra1;
//    }
//
//    public void setExtra1(String extra1) {
//        this.extra1 = extra1;
//    }

    @Column(name = "attribute2", length = 60)
    public String getExtra2() {
        return this.extra2;
    }

    public void setExtra2(String extra2) {
        this.extra2 = extra2;
    }

    @Column(name = "attribute3", length = 60)
    public String getExtra3() {
        return this.extra3;
    }

    public void setExtra3(String extra3) {
        this.extra3 = extra3;
    }

    @Column(name = "attribute4", length = 500)
    public String getExtra4() {
        return this.extra4;
    }

    public void setExtra4(String extra4) {
        this.extra4 = extra4;
    }

    @Column(name = "attribute5", length = 500)
    public String getExtra5() {
        return this.extra5;
    }

    public void setExtra5(String extra5) {
        this.extra5 = extra5;
    }

    @Column(name = "status", length = 50)
    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
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

    @Column(name = "gfc_remarks", length = 500)
    public String getGfcremarks() {
        return gfcremarks;
    }

    public void setGfcremarks(String gfcremarks) {
        this.gfcremarks = gfcremarks;
    }

    @Column(name = "cfo_remarks", length = 500)
    public String getCforemarks() {
        return cforemarks;
    }

    public void setCforemarks(String cforemarks) {
        this.cforemarks = cforemarks;
    }

    @Column(name = "vacatestatus", length = 60)
    public String getVacatestatus() {
        return vacatestatus;
    }

    public void setVacatestatus(String vacatestatus) {
        this.vacatestatus = vacatestatus;
    }

    @Column(name = "appstatus", length = 60)
    public String getAppstatus() {
        return appstatus;
    }

    public void setAppstatus(String appstatus) {
        this.appstatus = appstatus;
    }

    @Column(name = "amctenant_name", length = 60)
    public String getAmctenantName() {
        return amctenantName;
    }

    public void setAmctenantName(String amctenantName) {
        this.amctenantName = amctenantName;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "start_date", length = 19)
    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "end_date", length = 19)
    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    @Column(name = "percentage", length = 60)
    public String getPercentage() {
        return percentage;
    }

    public void setPercentage(String percentage) {
        this.percentage = percentage;
    }

    @Column(name = "amc_amount", length = 60)
    public String getAmcamount() {
        return amcamount;
    }

    public void setAmcamount(String amcamount) {
        this.amcamount = amcamount;
    }

}
