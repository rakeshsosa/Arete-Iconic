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
@Table(name = "receiving_process", schema = "arete_tms"
)
public class ReceivingProcess implements java.io.Serializable {

    private Integer SNo;
    private String userId;
    private String orgId;
    private String divisionName;
    private String purchaseType;
    private String receiptNo;
    private Date receiptDate;
    private String poNo;
    private String projectCode;
    private String department;
    private String receivedBy;
    private String supplierName;
    private String deliveryLocation;
    private String invoiceNo;
    private Date invoiceDate;
    private String itemCategory;
    private String itemSubCategory;
    private String itemName;
    private String itemDescription;
    private Double orderQuantity;
    private Double unitPrice;
    private Double receiptedQty;
    private Double receivingQty;
    private String uom;
    private String batchNo;
    private Date expiryDate;
    private String status;
    private Date lastmodifiedDate;
    private String recordStatus;
    private String itemCode;
    private Double discount;
    private Double focQty;
    private Date deliveryDate;

    public ReceivingProcess() {
    }

    public ReceivingProcess(String userId, String orgId, String divisionName, String purchaseType,
            String receiptNo, Date receiptDate,
            String poNo, String projectCode, String department, String receivedBy, String supplierName,
            String deliveryLocation, String invoiceNo, Date invoiceDate, String itemCategory,
            String itemSubCategory, String itemName, String itemDescription, Double orderQuantity,
            Double unitPrice, Double receiptedQty, Double receivingQty, String uom, String batchNo,
            Date expiryDate, String status, Date lastmodifiedDate, String recordStatus, String itemCode,
            Double discount, Double focQty, Date deliveryDate) {
        this.userId = userId;
        this.orgId = orgId;
        this.divisionName = divisionName;
        this.purchaseType = purchaseType;
        this.receiptNo = receiptNo;
        this.receiptDate = receiptDate;
        this.poNo = poNo;
        this.projectCode = projectCode;
        this.department = department;
        this.receivedBy = receivedBy;
        this.supplierName = supplierName;
        this.deliveryLocation = deliveryLocation;
        this.invoiceNo = invoiceNo;
        this.invoiceDate = invoiceDate;
        this.itemCategory = itemCategory;
        this.itemSubCategory = itemSubCategory;
        this.itemName = itemName;
        this.itemDescription = itemDescription;
        this.orderQuantity = orderQuantity;
        this.unitPrice = unitPrice;
        this.receiptedQty = receiptedQty;
        this.receivingQty = receivingQty;
        this.uom = uom;
        this.batchNo = batchNo;
        this.expiryDate = expiryDate;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.recordStatus = recordStatus;
        this.itemCode = itemCode;
        this.discount = discount;
        this.focQty = focQty;
        this.deliveryDate = deliveryDate;
    }

    public ReceivingProcess(Integer SNo, String userId, String orgId, String status, Date lastmodifiedDate) {
        this.SNo = SNo;
        this.userId = userId;
        this.orgId = orgId;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public ReceivingProcess(Integer SNo, String userId, String orgId, String divisionName, String purchaseType, String receiptNo, Date receiptDate, String poNo, String projectCode, String department, String receivedBy, String supplierName, String deliveryLocation, String invoiceNo, Date invoiceDate, String itemCategory, String itemSubCategory, String itemName, String itemDescription, Double orderQuantity, Double unitPrice, Double receiptedQty, Double receivingQty, String uom, String batchNo, Date expiryDate, String status, Date lastmodifiedDate, String recordStatus, String itemCode) {
        this.SNo = SNo;
        this.userId = userId;
        this.orgId = orgId;
        this.divisionName = divisionName;
        this.purchaseType = purchaseType;
        this.receiptNo = receiptNo;
        this.receiptDate = receiptDate;
        this.poNo = poNo;
        this.projectCode = projectCode;
        this.department = department;
        this.receivedBy = receivedBy;
        this.supplierName = supplierName;
        this.deliveryLocation = deliveryLocation;
        this.invoiceNo = invoiceNo;
        this.invoiceDate = invoiceDate;
        this.itemCategory = itemCategory;
        this.itemSubCategory = itemSubCategory;
        this.itemName = itemName;
        this.itemDescription = itemDescription;
        this.orderQuantity = orderQuantity;
        this.unitPrice = unitPrice;
        this.receiptedQty = receiptedQty;
        this.receivingQty = receivingQty;
        this.uom = uom;
        this.batchNo = batchNo;
        this.expiryDate = expiryDate;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.recordStatus = recordStatus;
        this.itemCode = itemCode;
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

    @Column(name = "division_name", length = 50)
    public String getDivisionName() {
        return divisionName;
    }

    public void setDivisionName(String divisionName) {
        this.divisionName = divisionName;
    }

    @Column(name = "purchase_type", length = 50)
    public String getPurchaseType() {
        return purchaseType;
    }

    public void setPurchaseType(String purchaseType) {
        this.purchaseType = purchaseType;
    }

    @Column(name = "receipt_no", length = 50)
    public String getReceiptNo() {
        return receiptNo;
    }

    public void setReceiptNo(String receiptNo) {
        this.receiptNo = receiptNo;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "receipt_date", length = 19)
    public Date getReceiptDate() {
        return receiptDate;
    }

    public void setReceiptDate(Date receiptDate) {
        this.receiptDate = receiptDate;
    }

    @Column(name = "po_no", length = 50)
    public String getPoNo() {
        return poNo;
    }

    public void setPoNo(String poNo) {
        this.poNo = poNo;
    }

    @Column(name = "project_code", length = 50)
    public String getProjectCode() {
        return projectCode;
    }

    public void setProjectCode(String projectCode) {
        this.projectCode = projectCode;
    }

    @Column(name = "department", length = 50)
    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    @Column(name = "received_by", length = 50)
    public String getReceivedBy() {
        return receivedBy;
    }

    public void setReceivedBy(String receivedBy) {
        this.receivedBy = receivedBy;
    }

    @Column(name = "supplier_name", length = 50)
    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    @Column(name = "delivery_location", length = 50)
    public String getDeliveryLocation() {
        return deliveryLocation;
    }

    public void setDeliveryLocation(String deliveryLocation) {
        this.deliveryLocation = deliveryLocation;
    }

    @Column(name = "invoice_no", length = 50)
    public String getInvoiceNo() {
        return invoiceNo;
    }

    public void setInvoiceNo(String invoiceNo) {
        this.invoiceNo = invoiceNo;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "invoice_date", length = 19)
    public Date getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDate(Date invoiceDate) {
        this.invoiceDate = invoiceDate;
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

    @Column(name = "item_description", length = 50)
    public String getItemDescription() {
        return itemDescription;
    }

    public void setItemDescription(String itemDescription) {
        this.itemDescription = itemDescription;
    }

    @Column(name = "order_quantity", length = 50)
    public Double getOrderQuantity() {
        return orderQuantity;
    }

    public void setOrderQuantity(Double orderQuantity) {
        this.orderQuantity = orderQuantity;
    }

    @Column(name = "unit_price", length = 50)
    public Double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Double unitPrice) {
        this.unitPrice = unitPrice;
    }

    @Column(name = "receipted_qty", length = 50)
    public Double getReceiptedQty() {
        return receiptedQty;
    }

    public void setReceiptedQty(Double receiptedQty) {
        this.receiptedQty = receiptedQty;
    }

    @Column(name = "receiving_qty", length = 50)
    public Double getReceivingQty() {
        return receivingQty;
    }

    public void setReceivingQty(Double receivingQty) {
        this.receivingQty = receivingQty;
    }

    @Column(name = "uom", length = 50)
    public String getUom() {
        return uom;
    }

    public void setUom(String uom) {
        this.uom = uom;
    }

    @Column(name = "batch_no", length = 50)
    public String getBatchNo() {
        return batchNo;
    }

    public void setBatchNo(String batchNo) {
        this.batchNo = batchNo;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "expiry_date", length = 19)
    public Date getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Date expiryDate) {
        this.expiryDate = expiryDate;
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

    @Column(name = "record_status", length = 50)
    public String getRecordStatus() {
        return recordStatus;
    }

    public void setRecordStatus(String recordStatus) {
        this.recordStatus = recordStatus;
    }

    @Column(name = "item_code", length = 50)
    public String getItemCode() {
        return itemCode;
    }

    public void setItemCode(String itemCode) {
        this.itemCode = itemCode;
    }

    @Column(name = "discount", length = 50)
    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    @Column(name = "foc_qty", length = 50)
    public Double getFocQty() {
        return focQty;
    }

    public void setFocQty(Double focQty) {
        this.focQty = focQty;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "delivery_date", length = 19)
    public Date getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

}
