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
@Table(name = "purchase_request", schema = "arete_tms"
)
public class PurchaseRequest implements java.io.Serializable {

    private Integer SNo;
    private String userId;
    private String orgId;
    private String division;
    private String purchaseType;
    private String prNo;
    private Date prDate;
    private String projectCode;
    private String projectName;
    private String department;
    private String deliveryLocation;
    private String itemCategory;
    private String itemSubCategory;
    private String itemName;
    private String description;
    private Date requiredDate;
    private String priority;
    private Double quantity;
    private String unit;
    private Double unitPrice;
    private Double totalPrice;
    private String remarks;
    private String needReview;
    private String reviewerName;
    private String reviewerRecordStatus;
    private String reviewerRemarks;
    private String approverName;
    private String approverRemarks;
    private String approverRecordStatus;
    private Date reviewerDate;
    private Date approverDate;
    private byte[] attachment;
    private String fileName;
    private String recordStatus;
    private String status;
    private Date lastmodifiedDate;
    private String itemCode;
    private String reqsno;
    private Double miQty;
    private Double purchaseQty;
    private String isuueStatus = "Pending";
    private String orderType = "New Request";
    private String assetCategory;
    private String subAssetCategory;

    public PurchaseRequest() {
    }

    public PurchaseRequest(Integer SNo, String userId, String orgId, String division, String purchaseType, String prNo, Date prDate, String projectCode, String projectName, String department, String deliveryLocation, String itemCategory, String itemSubCategory, String itemCode, String itemName, String description, Date requiredDate, String priority, Double quantity, String unit, Double unitPrice, Double totalPrice, String remarks, String needReview, String reviewerName, String recordStatus, String status, Date lastmodifiedDate, String reqsno, Double purchaseQty) {
        this.SNo = SNo;
        this.userId = userId;
        this.orgId = orgId;
        this.division = division;
        this.purchaseType = purchaseType;
        this.prNo = prNo;
        this.prDate = prDate;
        this.projectCode = projectCode;
        this.projectName = projectName;
        this.department = department;
        this.deliveryLocation = deliveryLocation;
        this.itemCategory = itemCategory;
        this.itemSubCategory = itemSubCategory;
        this.itemCode = itemCode;
        this.itemName = itemName;
        this.description = description;
        this.requiredDate = requiredDate;
        this.priority = priority;
        this.quantity = quantity;
        this.unit = unit;
        this.unitPrice = unitPrice;
        this.totalPrice = totalPrice;
        this.remarks = remarks;
        this.needReview = needReview;
        this.reviewerName = reviewerName;
        this.recordStatus = recordStatus;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.reqsno = reqsno;
        this.purchaseQty = purchaseQty;
    }

    public PurchaseRequest(String userId, String orgId, String division,String assetCategory,String subAssetCategory, String purchaseType, String prNo, Date prDate, String projectCode, String projectName, String department, String deliveryLocation, String itemCategory, String itemSubCategory, String itemCode, String itemName, String description, Date requiredDate, String priority, Double quantity, String unit, Double unitPrice, Double totalPrice, String remarks, String needReview, String reviewerName, byte[] attachment, String fileName, String recordStatus, String status, Date lastmodifiedDate, String reqsno, Double purchaseQty) {
        this.userId = userId;
        this.orgId = orgId;
        this.division = division;
        this.purchaseType = purchaseType;
        this.prNo = prNo;
        this.prDate = prDate;
        this.projectCode = projectCode;
        this.projectName = projectName;
        this.department = department;
        this.deliveryLocation = deliveryLocation;
        this.itemCategory = itemCategory;
        this.itemSubCategory = itemSubCategory;
        this.itemCode = itemCode;
        this.itemName = itemName;
        this.description = description;
        this.requiredDate = requiredDate;
        this.priority = priority;
        this.quantity = quantity;
        this.unit = unit;
        this.unitPrice = unitPrice;
        this.totalPrice = totalPrice;
        this.remarks = remarks;
        this.needReview = needReview;
        this.reviewerName = reviewerName;
        this.attachment = attachment;
        this.fileName = fileName;
        this.recordStatus = recordStatus;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.reqsno = reqsno;
        this.purchaseQty = purchaseQty;
        this.assetCategory = assetCategory;
        this.subAssetCategory = subAssetCategory;
    }
    
    public PurchaseRequest(String userId, String orgId, String division, String purchaseType,
            String prNo, Date prDate, String projectCode, String projectName,
            String department, String deliveryLocation, String itemCategory,
            String itemSubCategory, String itemName, String description, Date requiredDate,
            String priority, Double quantity, String unit, Double unitPrice, Double totalPrice,
            String recordStatus, String status, Date lastmodifiedDate, String itemCode,String reqsno,String remarks,String orderType) {
        this.userId = userId;
        this.orgId = orgId;
        this.division = division;
        this.purchaseType = purchaseType;
        this.prNo = prNo;
        this.prDate = prDate;
        this.projectCode = projectCode;
        this.projectName = projectName;
        this.department = department;
        this.deliveryLocation = deliveryLocation;
        this.itemCategory = itemCategory;
        this.itemSubCategory = itemSubCategory;
        this.itemName = itemName;
        this.description = description;
        this.requiredDate = requiredDate;
        this.priority = priority;
        this.quantity = quantity;
        this.unit = unit;
        this.unitPrice = unitPrice;
        this.totalPrice = totalPrice;
        this.recordStatus = recordStatus;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.itemCode = itemCode;
        this.reqsno = reqsno;
        this.remarks=remarks;
        this.orderType=orderType;
    }


    @Id
    @GeneratedValue(strategy = IDENTITY)

    @Column(name = "sno", unique = true, nullable = false)
    public Integer getSNo() {
        return SNo;
    }

    public void setSNo(Integer SNo) {
        this.SNo = SNo;
    }

    @Column(name = "user_id", length = 50)
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name = "org_id", length = 50)
    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }
    @Column(name = "asset_category", length = 50)
    public String getAssetCategory() {
        return this.assetCategory;
    }

    public void setAssetCategory(String assetCategory) {
        this.assetCategory = assetCategory;
    }

    @Column(name = "sub_asset_category", length = 50)
    public String getSubAssetCategory() {
        return this.subAssetCategory;
    }

    public void setSubAssetCategory(String subAssetCategory) {
        this.subAssetCategory = subAssetCategory;
    }

    @Column(name = "division", length = 50)
    public String getDivision() {
        return division;
    }

    public void setDivision(String division) {
        this.division = division;
    }

    @Column(name = "purchase_type", length = 50)
    public String getPurchaseType() {
        return purchaseType;
    }

    public void setPurchaseType(String purchaseType) {
        this.purchaseType = purchaseType;
    }

    @Column(name = "pr_no", length = 50)
    public String getPrNo() {
        return prNo;
    }

    public void setPrNo(String prNo) {
        this.prNo = prNo;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "pr_date", length = 19)
    public Date getPrDate() {
        return prDate;
    }

    public void setPrDate(Date prDate) {
        this.prDate = prDate;
    }

    @Column(name = "project_code", length = 50)
    public String getProjectCode() {
        return projectCode;
    }

    public void setProjectCode(String projectCode) {
        this.projectCode = projectCode;
    }

    @Column(name = "project_name", length = 50)
    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    @Column(name = "department", length = 50)
    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    @Column(name = "delivery_location", length = 50)
    public String getDeliveryLocation() {
        return deliveryLocation;
    }

    public void setDeliveryLocation(String deliveryLocation) {
        this.deliveryLocation = deliveryLocation;
    }

    @Column(name = "item_category", length = 50)
    public String getItemCategory() {
        return itemCategory;
    }

    public void setItemCategory(String itemCategory) {
        this.itemCategory = itemCategory;
    }

    @Column(name = "item_sub_category", length = 50)
    public String getItemSubCategory() {
        return itemSubCategory;
    }

    public void setItemSubCategory(String itemSubCategory) {
        this.itemSubCategory = itemSubCategory;
    }

    @Column(name = "item_name", length = 50)
    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    @Column(name = "description", length = 50)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "required_date", length = 19)
    public Date getRequiredDate() {
        return requiredDate;
    }

    public void setRequiredDate(Date requiredDate) {
        this.requiredDate = requiredDate;
    }

    @Column(name = "priority", length = 50)
    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    @Column(name = "quantity", length = 50)
    public Double getQuantity() {
        return quantity;
    }

    public void setQuantity(Double quantity) {
        this.quantity = quantity;
    }

    @Column(name = "unit", length = 50)
    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    @Column(name = "unit_price", length = 50)
    public Double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Double unitPrice) {
        this.unitPrice = unitPrice;
    }

    @Column(name = "total_price", length = 50)
    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    @Column(name = "remarks", length = 50)
    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Column(name = "need_review", length = 50)
    public String getNeedReview() {
        return needReview;
    }

    public void setNeedReview(String needReview) {
        this.needReview = needReview;
    }

    @Column(name = "reviewer_name", length = 50)
    public String getReviewerName() {
        return reviewerName;
    }

    public void setReviewerName(String reviewerName) {
        this.reviewerName = reviewerName;
    }

    @Column(name = "reviewer_record_status", length = 50)
    public String getReviewerRecordStatus() {
        return reviewerRecordStatus;
    }

    public void setReviewerRecordStatus(String reviewerRecordStatus) {
        this.reviewerRecordStatus = reviewerRecordStatus;
    }

    @Column(name = "reviewer_remarks", length = 50)
    public String getReviewerRemarks() {
        return reviewerRemarks;
    }

    public void setReviewerRemarks(String reviewerRemarks) {
        this.reviewerRemarks = reviewerRemarks;
    }

    @Column(name = "approver_name", length = 50)
    public String getApproverName() {
        return approverName;
    }

    public void setApproverName(String approverName) {
        this.approverName = approverName;
    }

    @Column(name = "approver_remarks", length = 50)
    public String getApproverRemarks() {
        return approverRemarks;
    }

    public void setApproverRemarks(String approverRemarks) {
        this.approverRemarks = approverRemarks;
    }

    @Column(name = "approver_record_status", length = 50)
    public String getApproverRecordStatus() {
        return approverRecordStatus;
    }

    public void setApproverRecordStatus(String approverRecordStatus) {
        this.approverRecordStatus = approverRecordStatus;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "reviewer_date", length = 19)
    public Date getReviewerDate() {
        return reviewerDate;
    }

    public void setReviewerDate(Date reviewerDate) {
        this.reviewerDate = reviewerDate;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "approver_date", length = 19)
    public Date getApproverDate() {
        return approverDate;
    }

    public void setApproverDate(Date approverDate) {
        this.approverDate = approverDate;
    }

    @Column(name = "attachment", columnDefinition = "mediumblob")
    public byte[] getAttachment() {
        return attachment;
    }

    public void setAttachment(byte[] attachment) {
        this.attachment = attachment;
    }

    @Column(name = "file_name", length = 50)
    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    @Column(name = "record_status", length = 50)
    public String getRecordStatus() {
        return recordStatus;
    }

    public void setRecordStatus(String recordStatus) {
        this.recordStatus = recordStatus;
    }

    @Column(name = "status", length = 50)
    public String getStatus() {
        return status;
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

    @Column(name = "item_code", length = 50)
    public String getItemCode() {
        return itemCode;
    }

    public void setItemCode(String itemCode) {
        this.itemCode = itemCode;
    }

    @Column(name = "reqs_no", length = 50)
    public String getReqsno() {
        return reqsno;
    }

    public void setReqsno(String reqsno) {
        this.reqsno = reqsno;
    }

    @Column(name = "mi_qty", length = 50)
    public Double getMiQty() {
        return miQty;
    }

    public void setMiQty(Double miQty) {
        this.miQty = miQty;
    }

    @Column(name = "purchase_qty", length = 50)
    public Double getPurchaseQty() {
        return purchaseQty;
    }

    public void setPurchaseQty(Double purchaseQty) {
        this.purchaseQty = purchaseQty;
    }

    @Column(name = "isuue_status", length = 50)
    public String getIsuueStatus() {
        return isuueStatus;
    }

    public void setIsuueStatus(String isuueStatus) {
        this.isuueStatus = isuueStatus;
    }

    @Column(name = "order_type", length = 50)
    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }

}
