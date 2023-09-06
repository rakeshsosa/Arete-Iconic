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
@Table(name = "good_receipt_note", schema = "arete_tms"
)
public class GoodsReceiptNote implements java.io.Serializable {

    private Integer SNo;
    private String goodReceiptNo;
    private Date goodReceiptDate;
    private String divisionName;
    private String purchaseType;
    private String materialReceiptNo;
    private Date materialReceiptDate;
    private String poNo;
    private String projectCode;
    private String department;
    private String receivedBy;
    private String inspectedBy;
    private String supplierName;
    private String deliveryLocation;
    private String invoiceNo;
    private Date invoiceDate;
    private String itemCategory;
    private String itemSubCategory;
    private String itemName;
    private String itemDescription;
    private String uom;
    private Double orderQuantity;
    private Double unitPrice;
    private Double orderValue;
    private Double receivingQty;
    private Double acceptedQty;
    private Double acceptedValue;
    private Double rejectedQty;
    private Double rejectedValue;
    private String extraField1;
    private String extraField2;
    private String qaRemarks;
    private String approverRemarks;
    private String status;
    private Date lastmodifiedDate;
    private String userId;
    private String orgId;
    private String batchNo;
    private Date expiryDate;
    private Double discount;
    private Double focQty;
    private String invoiceStatus;
    private String itemCode;
    private Double lumSumDiscount;
    private Date deliveryDate;
    private String issueUom;

    public GoodsReceiptNote() {
    }

    public GoodsReceiptNote(Integer SNo) {
        this.SNo = SNo;
    }

    public GoodsReceiptNote(String goodReceiptNo, Date goodReceiptDate, String divisionName, String purchaseType,
            String materialReceiptNo, Date materialReceiptDate, String poNo, String projectCode, String department,
            String receivedBy, String inspectedBy, String supplierName, String deliveryLocation, String invoiceNo,
            Date invoiceDate, String itemCategory, String itemSubCategory, String itemName, String itemDescription,
            String uom, Double orderQuantity, Double unitPrice, Double orderValue, Double acceptedQty, Double acceptedValue,
            Double rejectedQty, Double rejectedValue, String qaRemarks, String approverRemarks, String status,
            Date lastmodifiedDate, String userId, String orgId, String batchNo, Date expiryDate, Double discount,
            Double focQty, Double receivingQty, String itemCode, Double lumSumDiscount, Date deliveryDate) {
        this.goodReceiptNo = goodReceiptNo;
        this.goodReceiptDate = goodReceiptDate;
        this.divisionName = divisionName;
        this.purchaseType = purchaseType;
        this.materialReceiptNo = materialReceiptNo;
        this.materialReceiptDate = materialReceiptDate;
        this.poNo = poNo;
        this.projectCode = projectCode;
        this.department = department;
        this.receivedBy = receivedBy;
        this.inspectedBy = inspectedBy;
        this.supplierName = supplierName;
        this.deliveryLocation = deliveryLocation;
        this.invoiceNo = invoiceNo;
        this.invoiceDate = invoiceDate;
        this.itemCategory = itemCategory;
        this.itemSubCategory = itemSubCategory;
        this.itemName = itemName;
        this.itemDescription = itemDescription;
        this.uom = uom;
        this.orderQuantity = orderQuantity;
        this.unitPrice = unitPrice;
        this.orderValue = orderValue;

        this.acceptedQty = acceptedQty;
        this.acceptedValue = acceptedValue;
        this.rejectedQty = rejectedQty;
        this.rejectedValue = rejectedValue;
        this.qaRemarks = qaRemarks;
        this.approverRemarks = approverRemarks;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.userId = userId;
        this.orgId = orgId;
        this.batchNo = batchNo;
        this.expiryDate = expiryDate;
        this.discount = discount;
        this.focQty = focQty;
        this.receivingQty = receivingQty;
        this.itemCode = itemCode;
        this.lumSumDiscount = lumSumDiscount;
        this.deliveryDate = deliveryDate;
    }

    //-------  1 GRN M PO-----------------
    public GoodsReceiptNote(String goodReceiptNo, Date goodReceiptDate, String divisionName, String purchaseType,
            String materialReceiptNo, Date materialReceiptDate, String poNo, String projectCode, String department,
            String receivedBy, String inspectedBy, String supplierName, String deliveryLocation, String invoiceNo,
            Date invoiceDate, String itemCategory, String itemSubCategory, String itemName, String itemDescription,
            String uom, Double orderQuantity, Double unitPrice, Double orderValue, Double acceptedQty, Double acceptedValue,
            Double rejectedQty, Double rejectedValue, String qaRemarks, String approverRemarks, String status,
            Date lastmodifiedDate, String userId, String orgId, String batchNo, Date expiryDate, Double discount, Double focQty, Double receivingQty,
            String issueUom,
            String itemCode,
            Double lumSumDiscount, Date deliveryDate) {

        this.goodReceiptNo = goodReceiptNo;
        this.goodReceiptDate = goodReceiptDate;
        this.divisionName = divisionName;
        this.purchaseType = purchaseType;
        this.materialReceiptNo = materialReceiptNo;
        this.materialReceiptDate = materialReceiptDate;
        this.poNo = poNo;
        this.projectCode = projectCode;
        this.department = department;
        this.receivedBy = receivedBy;
        this.inspectedBy = inspectedBy;
        this.supplierName = supplierName;
        this.deliveryLocation = deliveryLocation;
        this.invoiceNo = invoiceNo;
        this.invoiceDate = invoiceDate;
        this.itemCategory = itemCategory;
        this.itemSubCategory = itemSubCategory;
        this.itemName = itemName;
        this.itemDescription = itemDescription;
        this.uom = uom;
        this.orderQuantity = orderQuantity;
        this.unitPrice = unitPrice;
        this.orderValue = orderValue;

        this.acceptedQty = acceptedQty;
        this.acceptedValue = acceptedValue;
        this.rejectedQty = rejectedQty;
        this.rejectedValue = rejectedValue;
        this.qaRemarks = qaRemarks;
        this.approverRemarks = approverRemarks;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.userId = userId;
        this.orgId = orgId;
        this.batchNo = batchNo;
        this.expiryDate = expiryDate;
        this.discount = discount;
        this.focQty = focQty;
        this.receivingQty = receivingQty;

//        this.storageCapacity = storageCapacity;
//        this.currentStorage = currentStorage;
//        this.balanceStorage = balanceStorage;
        this.issueUom = issueUom;
        this.itemCode = itemCode;
        this.lumSumDiscount = lumSumDiscount;
        this.deliveryDate = deliveryDate;
    }

    public GoodsReceiptNote(Integer SNo, String goodReceiptNo, Date goodReceiptDate, String divisionName, String purchaseType, String materialReceiptNo, Date materialReceiptDate, String poNo, String projectCode, String department, String receivedBy, String inspectedBy, String supplierName, String deliveryLocation, String invoiceNo, Date invoiceDate, String itemCategory, String itemSubCategory, String itemName, String itemDescription, String uom, Double orderQuantity, Double unitPrice, Double orderValue, Double receivingQty, Double acceptedQty, Double acceptedValue, Double rejectedQty, Double rejectedValue, String extraField1, String extraField2, String qaRemarks, String approverRemarks, String status, java.sql.Timestamp lastmodifiedDate, String userId, String orgId) {
        this.SNo = SNo;
        this.goodReceiptNo = goodReceiptNo;
        this.goodReceiptDate = goodReceiptDate;
        this.divisionName = divisionName;
        this.purchaseType = purchaseType;
        this.materialReceiptNo = materialReceiptNo;
        this.materialReceiptDate = materialReceiptDate;
        this.poNo = poNo;
        this.projectCode = projectCode;
        this.department = department;
        this.receivedBy = receivedBy;
        this.inspectedBy = inspectedBy;
        this.supplierName = supplierName;
        this.deliveryLocation = deliveryLocation;
        this.invoiceNo = invoiceNo;
        this.invoiceDate = invoiceDate;
        this.itemCategory = itemCategory;
        this.itemSubCategory = itemSubCategory;
        this.itemName = itemName;
        this.itemDescription = itemDescription;
        this.uom = uom;
        this.orderQuantity = orderQuantity;
        this.unitPrice = unitPrice;
        this.orderValue = orderValue;
        this.receivingQty = receivingQty;
        this.acceptedQty = acceptedQty;
        this.acceptedValue = acceptedValue;
        this.rejectedQty = rejectedQty;
        this.rejectedValue = rejectedValue;
        this.extraField1 = extraField1;
        this.extraField2 = extraField2;
        this.qaRemarks = qaRemarks;
        this.approverRemarks = approverRemarks;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.userId = userId;
        this.orgId = orgId;
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

    @Column(name = "good_receipt_no", length = 60)
    public String getGoodReceiptNo() {
        return goodReceiptNo;
    }

    public void setGoodReceiptNo(String goodReceiptNo) {
        this.goodReceiptNo = goodReceiptNo;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "good_receipt_date", length = 60)
    public Date getGoodReceiptDate() {
        return goodReceiptDate;
    }

    public void setGoodReceiptDate(Date goodReceiptDate) {
        this.goodReceiptDate = goodReceiptDate;
    }

    @Column(name = "division_name", length = 60)
    public String getDivisionName() {
        return divisionName;
    }

    public void setDivisionName(String divisionName) {
        this.divisionName = divisionName;
    }

    @Column(name = "purchase_type", length = 60)
    public String getPurchaseType() {
        return purchaseType;
    }

    public void setPurchaseType(String purchaseType) {
        this.purchaseType = purchaseType;
    }

    @Column(name = "material_receipt_no", length = 60)
    public String getMaterialReceiptNo() {
        return materialReceiptNo;
    }

    public void setMaterialReceiptNo(String materialReceiptNo) {
        this.materialReceiptNo = materialReceiptNo;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "material_receipt_date", length = 60)
    public Date getMaterialReceiptDate() {
        return materialReceiptDate;
    }

    public void setMaterialReceiptDate(Date materialReceiptDate) {
        this.materialReceiptDate = materialReceiptDate;
    }

    @Column(name = "po_no", length = 60)
    public String getPoNo() {
        return poNo;
    }

    public void setPoNo(String poNo) {
        this.poNo = poNo;
    }

    @Column(name = "project_code", length = 60)
    public String getProjectCode() {
        return projectCode;
    }

    public void setProjectCode(String projectCode) {
        this.projectCode = projectCode;
    }

    @Column(name = "department", length = 60)
    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    @Column(name = "received_by", length = 60)
    public String getReceivedBy() {
        return receivedBy;
    }

    public void setReceivedBy(String receivedBy) {
        this.receivedBy = receivedBy;
    }

    @Column(name = "inspected_by", length = 60)
    public String getInspectedBy() {
        return inspectedBy;
    }

    public void setInspectedBy(String inspectedBy) {
        this.inspectedBy = inspectedBy;
    }

    @Column(name = "supplier_name", length = 60)
    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    @Column(name = "delivery_location", length = 60)
    public String getDeliveryLocation() {
        return deliveryLocation;
    }

    public void setDeliveryLocation(String deliveryLocation) {
        this.deliveryLocation = deliveryLocation;
    }

    @Column(name = "invoice_no", length = 60)
    public String getInvoiceNo() {
        return invoiceNo;
    }

    public void setInvoiceNo(String invoiceNo) {
        this.invoiceNo = invoiceNo;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "invoice_date", length = 60)
    public Date getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDate(Date invoiceDate) {
        this.invoiceDate = invoiceDate;
    }

    @Column(name = "item_category", length = 60)
    public String getItemCategory() {
        return itemCategory;
    }

    public void setItemCategory(String itemCategory) {
        this.itemCategory = itemCategory;
    }

    @Column(name = "item_sub_category", length = 60)
    public String getItemSubCategory() {
        return itemSubCategory;
    }

    public void setItemSubCategory(String itemSubCategory) {
        this.itemSubCategory = itemSubCategory;
    }

    @Column(name = "item_name", length = 60)
    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    @Column(name = "item_description", length = 60)
    public String getItemDescription() {
        return itemDescription;
    }

    public void setItemDescription(String itemDescription) {
        this.itemDescription = itemDescription;
    }

    @Column(name = "uom", length = 60)
    public String getUom() {
        return uom;
    }

    public void setUom(String uom) {
        this.uom = uom;
    }

    @Column(name = "order_quantity", length = 60)
    public Double getOrderQuantity() {
        return orderQuantity;
    }

    public void setOrderQuantity(Double orderQuantity) {
        this.orderQuantity = orderQuantity;
    }

    @Column(name = "unit_price", length = 60)
    public Double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Double unitPrice) {
        this.unitPrice = unitPrice;
    }

    @Column(name = "order_value", length = 60)
    public Double getOrderValue() {
        return orderValue;
    }

    public void setOrderValue(Double orderValue) {
        this.orderValue = orderValue;
    }

    @Column(name = "receiving_qty", length = 60)
    public Double getReceivingQty() {
        return receivingQty;
    }

    public void setReceivingQty(Double receivingQty) {
        this.receivingQty = receivingQty;
    }

    @Column(name = "accepted_qty", length = 60)
    public Double getAcceptedQty() {
        return acceptedQty;
    }

    public void setAcceptedQty(Double acceptedQty) {
        this.acceptedQty = acceptedQty;
    }

    @Column(name = "accepted_value", length = 60)
    public Double getAcceptedValue() {
        return acceptedValue;
    }

    public void setAcceptedValue(Double acceptedValue) {
        this.acceptedValue = acceptedValue;
    }

    @Column(name = "rejected_qty", length = 60)
    public Double getRejectedQty() {
        return rejectedQty;
    }

    public void setRejectedQty(Double rejectedQty) {
        this.rejectedQty = rejectedQty;
    }

    @Column(name = "rejected_value", length = 60)
    public Double getRejectedValue() {
        return rejectedValue;
    }

    public void setRejectedValue(Double rejectedValue) {
        this.rejectedValue = rejectedValue;
    }

    @Column(name = "qa_remarks", length = 60)
    public String getQaRemarks() {
        return qaRemarks;
    }

    public void setQaRemarks(String qaRemarks) {
        this.qaRemarks = qaRemarks;
    }

    @Column(name = "approver_remarks", length = 60)
    public String getApproverRemarks() {
        return approverRemarks;
    }

    public void setApproverRemarks(String approverRemarks) {
        this.approverRemarks = approverRemarks;
    }

    @Column(name = "status", length = 60)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "lastmodified_date", length = 60)
    public Date getLastmodifiedDate() {
        return lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }

    @Column(name = "user_id", length = 60)
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name = "org_id", length = 60)
    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name = "batch_no", length = 60)
    public String getBatchNo() {
        return batchNo;
    }

    public void setBatchNo(String batchNo) {
        this.batchNo = batchNo;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "expiry_date", length = 60)
    public Date getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Date expiryDate) {
        this.expiryDate = expiryDate;
    }

    @Column(name = "discount", length = 60)
    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    @Column(name = "foc_qty", length = 60)
    public Double getFocQty() {
        return focQty;
    }

    public void setFocQty(Double focQty) {
        this.focQty = focQty;
    }

    @Column(name = "invoice_status", length = 60)
    public String getInvoiceStatus() {
        return invoiceStatus;
    }

    public void setInvoiceStatus(String invoiceStatus) {
        this.invoiceStatus = invoiceStatus;
    }

    @Column(name = "item_code", length = 60)
    public String getItemCode() {
        return itemCode;
    }

    public void setItemCode(String itemCode) {
        this.itemCode = itemCode;
    }

    @Column(name = "lum_sum_discount", length = 60)
    public Double getLumSumDiscount() {
        return lumSumDiscount;
    }

    public void setLumSumDiscount(Double lumSumDiscount) {
        this.lumSumDiscount = lumSumDiscount;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "delivery_date", length = 60)
    public Date getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    @Column(name = "issue_uom", length = 60)
    public String getIssueUom() {
        return issueUom;
    }

    public void setIssueUom(String issueUom) {
        this.issueUom = issueUom;
    }

}
