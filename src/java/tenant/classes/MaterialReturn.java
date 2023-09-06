package tenant.classes;
// Generated Oct 17, 2016 11:50:43 AM by Hibernate Tools 4.3.1

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
 * MaterialReturn generated by hbm2java
 */
@Entity
@Table(name = "material_return", schema = "arete_tms"
)
public class MaterialReturn implements java.io.Serializable {

    private Integer sno;
    private String orgId;
    private String userId;
    private String mrNo;
    private String qa;
    private String poNo;
    private String qaBy;
    private String customerInvoiceNo;
    private Date customerInvoiceDate;
    private String supplierName;
    private String supplierAddress;
    private String supplierContactNo;
    private String supplierMailId;
    private String inventoryLocation;
    private String itemName;
    private String itemCode;
    private Date expiryDate;
    private String orderedQty;
    private String receivedqty;
    private String rejectQty;
    private String foc;
    private String uom;
    private String batchNo;
    private String warrwntyPeriod;
    private String remarks;
    private String approvalStatus1;
    private String approvalStatus2;
    private String approverRemarks1;
    private String approverRemarks2;
    private String returnStatus;
    private String status;
//     private Date creationDate;
    private Date lastmodifiedDate;

    public MaterialReturn() {
    }

    public MaterialReturn(String qa, String poNo) {
        this.qa = qa;
        this.poNo = poNo;
    }

    public MaterialReturn(String orgId, String userId, String mrNo, String qa, String poNo, String qaBy, String customerInvoiceNo, Date customerInvoiceDate, String supplierName, String supplierAddress, String supplierContactNo, String supplierMailId, String inventoryLocation, String itemName, String itemCode, Date expiryDate, String orderedQty, String receivedqty, String rejectQty, String foc, String uom, String batchNo, String warrwntyPeriod, String remarks, String returnStatus, String status, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.mrNo = mrNo;
        this.qa = qa;
        this.poNo = poNo;
        this.qaBy = qaBy;
        this.customerInvoiceNo = customerInvoiceNo;
        this.customerInvoiceDate = customerInvoiceDate;
        this.supplierName = supplierName;
        this.supplierAddress = supplierAddress;
        this.supplierContactNo = supplierContactNo;
        this.supplierMailId = supplierMailId;
        this.inventoryLocation = inventoryLocation;
        this.itemName = itemName;
        this.itemCode = itemCode;
        this.expiryDate = expiryDate;
        this.orderedQty = orderedQty;
        this.receivedqty = receivedqty;
        this.rejectQty = rejectQty;
        this.foc = foc;
        this.uom = uom;
        this.batchNo = batchNo;
        this.warrwntyPeriod = warrwntyPeriod;
        this.remarks = remarks;
//       this.approvalStatus1 = approvalStatus1;
//       this.approvalStatus2 = approvalStatus2;
        this.returnStatus = returnStatus;
        this.status = status;
//       this.creationDate = creationDate;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public MaterialReturn(String orgId, String userId, String mrNo, String qa, String poNo, String qaBy, String customerInvoiceNo, Date customerInvoiceDate, String supplierName, String supplierAddress, String supplierContactNo, String supplierMailId, String inventoryLocation, String itemName, String itemCode, Date expiryDate, String orderedQty, String receivedqty, String rejectQty, String foc, String uom, String batchNo, String remarks, String returnStatus, String status, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.mrNo = mrNo;
        this.qa = qa;
        this.poNo = poNo;
        this.qaBy = qaBy;
        this.customerInvoiceNo = customerInvoiceNo;
        this.customerInvoiceDate = customerInvoiceDate;
        this.supplierName = supplierName;
        this.supplierAddress = supplierAddress;
        this.supplierContactNo = supplierContactNo;
        this.supplierMailId = supplierMailId;
        this.inventoryLocation = inventoryLocation;
        this.itemName = itemName;
        this.itemCode = itemCode;
        this.expiryDate = expiryDate;
        this.orderedQty = orderedQty;
        this.receivedqty = receivedqty;
        this.rejectQty = rejectQty;
        this.foc = foc;
        this.uom = uom;
        this.batchNo = batchNo;
        this.remarks = remarks;
//       this.approvalStatus1 = approvalStatus1;
//       this.approvalStatus2 = approvalStatus2;
        this.returnStatus = returnStatus;
        this.status = status;
//       this.creationDate = creationDate;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public MaterialReturn(Integer sno, String orgId, String userId, String mrNo, String qa, String poNo, String qaBy, String customerInvoiceNo, Date customerInvoiceDate, String supplierName, String supplierAddress, String supplierContactNo, String supplierMailId, String inventoryLocation, String itemName, String itemCode, Date expiryDate, String orderedQty, String receivedqty, String rejectQty, String foc, String uom, String batchNo, String warrwntyPeriod, String remarks, String approvalStatus1, String approvalStatus2, String returnStatus, String status, Date lastmodifiedDate) {
        this.sno = sno;
        this.orgId = orgId;
        this.userId = userId;
        this.mrNo = mrNo;
        this.qa = qa;
        this.poNo = poNo;
        this.qaBy = qaBy;
        this.customerInvoiceNo = customerInvoiceNo;
        this.customerInvoiceDate = customerInvoiceDate;
        this.supplierName = supplierName;
        this.supplierAddress = supplierAddress;
        this.supplierContactNo = supplierContactNo;
        this.supplierMailId = supplierMailId;
        this.inventoryLocation = inventoryLocation;
        this.itemName = itemName;
        this.itemCode = itemCode;
        this.expiryDate = expiryDate;
        this.orderedQty = orderedQty;
        this.receivedqty = receivedqty;
        this.rejectQty = rejectQty;
        this.foc = foc;
        this.uom = uom;
        this.batchNo = batchNo;
        this.warrwntyPeriod = warrwntyPeriod;
        this.remarks = remarks;
        this.approvalStatus1 = approvalStatus1;
        this.approvalStatus2 = approvalStatus2;
        this.returnStatus = returnStatus;
        this.status = status;
//       this.creationDate = creationDate;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public MaterialReturn(Integer sno, String orgId, String userId, String mrNo, String qa, String poNo, String qaBy, String customerInvoiceNo, Date customerInvoiceDate, String supplierName, String supplierAddress, String supplierContactNo, String supplierMailId, String inventoryLocation, String itemName, String itemCode, Date expiryDate, String orderedQty, String receivedqty, String rejectQty, String foc, String uom, String batchNo, String remarks, String approvalStatus1, String approvalStatus2, String returnStatus, String status, Date lastmodifiedDate) {
        this.sno = sno;
        this.orgId = orgId;
        this.userId = userId;
        this.mrNo = mrNo;
        this.qa = qa;
        this.poNo = poNo;
        this.qaBy = qaBy;
        this.customerInvoiceNo = customerInvoiceNo;
        this.customerInvoiceDate = customerInvoiceDate;
        this.supplierName = supplierName;
        this.supplierAddress = supplierAddress;
        this.supplierContactNo = supplierContactNo;
        this.supplierMailId = supplierMailId;
        this.inventoryLocation = inventoryLocation;
        this.itemName = itemName;
        this.itemCode = itemCode;
        this.expiryDate = expiryDate;
        this.orderedQty = orderedQty;
        this.receivedqty = receivedqty;
        this.rejectQty = rejectQty;
        this.foc = foc;
        this.uom = uom;
        this.batchNo = batchNo;
        this.remarks = remarks;
        this.approvalStatus1 = approvalStatus1;
        this.approvalStatus2 = approvalStatus2;
        this.returnStatus = returnStatus;
        this.status = status;
//       this.creationDate = creationDate;
        this.lastmodifiedDate = lastmodifiedDate;
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

    @Column(name = "qa", nullable = false, length = 60)
    public String getQa() {
        return this.qa;
    }

    public void setQa(String qa) {
        this.qa = qa;
    }

    @Column(name = "po_no", nullable = false, length = 60)
    public String getPoNo() {
        return this.poNo;
    }

    public void setPoNo(String poNo) {
        this.poNo = poNo;
    }

    @Column(name = "qa_by", length = 60)
    public String getQaBy() {
        return qaBy;
    }

    public void setQaBy(String qaBy) {
        this.qaBy = qaBy;
    }

    @Column(name = "customer_invoice_no", length = 60)
    public String getCustomerInvoiceNo() {
        return this.customerInvoiceNo;
    }

    public void setCustomerInvoiceNo(String customerInvoiceNo) {
        this.customerInvoiceNo = customerInvoiceNo;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "CUSTOMER_INVOICE_DATE", length = 60)
    public Date getCustomerInvoiceDate() {
        return customerInvoiceDate;
    }

    public void setCustomerInvoiceDate(Date customerInvoiceDate) {
        this.customerInvoiceDate = customerInvoiceDate;
    }

    @Column(name = "supplier_name", length = 60)
    public String getSupplierName() {
        return this.supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    @Column(name = "supplier_address", length = 500)
    public String getSupplierAddress() {
        return this.supplierAddress;
    }

    public void setSupplierAddress(String supplierAddress) {
        this.supplierAddress = supplierAddress;
    }

    @Column(name = "supplier_contact_no", length = 60)
    public String getSupplierContactNo() {
        return this.supplierContactNo;
    }

    public void setSupplierContactNo(String supplierContactNo) {
        this.supplierContactNo = supplierContactNo;
    }

    @Column(name = "supplier_mail_id", length = 60)
    public String getSupplierMailId() {
        return this.supplierMailId;
    }

    public void setSupplierMailId(String supplierMailId) {
        this.supplierMailId = supplierMailId;
    }

    @Column(name = "inventory_location", length = 100)
    public String getInventoryLocation() {
        return this.inventoryLocation;
    }

    public void setInventoryLocation(String inventoryLocation) {
        this.inventoryLocation = inventoryLocation;
    }

    @Column(name = "item_name", length = 60)
    public String getItemName() {
        return this.itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    @Column(name = "item_code", length = 60)
    public String getItemCode() {
        return this.itemCode;
    }

    public void setItemCode(String itemCode) {
        this.itemCode = itemCode;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "expiry_date", length = 60)
    public Date getExpiryDate() {
        return this.expiryDate;
    }

    public void setExpiryDate(Date expiryDate) {
        this.expiryDate = expiryDate;
    }

    @Column(name = "ordered_qty", length = 60)
    public String getOrderedQty() {
        return this.orderedQty;
    }

    public void setOrderedQty(String orderedQty) {
        this.orderedQty = orderedQty;
    }

    @Column(name = "received_qty", length = 60)
    public String getReceivedqty() {
        return this.receivedqty;
    }

    public void setReceivedqty(String receivedqty) {
        this.receivedqty = receivedqty;
    }

    @Column(name = "foc", length = 60)
    public String getFoc() {
        return this.foc;
    }

    public void setFoc(String foc) {
        this.foc = foc;
    }

    @Column(name = "uom", length = 60)
    public String getUom() {
        return this.uom;
    }

    public void setUom(String uom) {
        this.uom = uom;
    }

    @Column(name = "batch_no", length = 60)
    public String getBatchNo() {
        return this.batchNo;
    }

    public void setBatchNo(String batchNo) {
        this.batchNo = batchNo;
    }

    @Column(name = "warrwnty_period", length = 60)
    public String getWarrwntyPeriod() {
        return this.warrwntyPeriod;
    }

    public void setWarrwntyPeriod(String warrwntyPeriod) {
        this.warrwntyPeriod = warrwntyPeriod;
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

//    @Temporal(TemporalType.TIMESTAMP)
//    @Column(name="creation_date", length=19)
//    public Date getCreationDate() {
//        return this.creationDate;
//    }
//    
//    public void setCreationDate(Date creationDate) {
//        this.creationDate = creationDate;
//    }
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "lastmodified_date", length = 60)
    public Date getLastmodifiedDate() {
        return this.lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }

    @Column(name = "mr_no", length = 60)
    public String getMrNo() {
        return mrNo;
    }

    public void setMrNo(String mrNo) {
        this.mrNo = mrNo;
    }

    @Column(name = "rejected_qty", length = 60)
    public String getRejectQty() {
        return rejectQty;
    }

    public void setRejectQty(String rejectQty) {
        this.rejectQty = rejectQty;
    }

    @Column(name = "return_status", length = 60)
    public String getReturnStatus() {
        return returnStatus;
    }

    public void setReturnStatus(String returnStatus) {
        this.returnStatus = returnStatus;
    }

    @Column(name = "approver_status1", length = 60)

    public String getApprovalStatus1() {
        return approvalStatus1;
    }

    public void setApprovalStatus1(String approvalStatus1) {
        this.approvalStatus1 = approvalStatus1;
    }

    @Column(name = "approver_status2", length = 60)

    public String getApprovalStatus2() {
        return approvalStatus2;
    }

    public void setApprovalStatus2(String approvalStatus2) {
        this.approvalStatus2 = approvalStatus2;
    }

    @Column(name = "approver_remarks1", length = 500)

    public String getApproverRemarks1() {
        return approverRemarks1;
    }

    public void setApproverRemarks1(String approverRemarks1) {
        this.approverRemarks1 = approverRemarks1;
    }

    @Column(name = "approver_remarks2", length = 500)

    public String getApproverRemarks2() {
        return approverRemarks2;
    }

    public void setApproverRemarks2(String approverRemarks2) {
        this.approverRemarks2 = approverRemarks2;
    }

}
