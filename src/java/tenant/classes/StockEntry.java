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
@Table(name = "Stock_Entry", schema = "arete_tms"
)
public class StockEntry implements java.io.Serializable {

    private Integer SNo;
    private String userId;
    private String orgId;
    private String storeLocationName;
    private String itemCode;
    private String itemName;
    private String itemDesc;

    
    private Double physicalQty;
    private Date expiryDate;
    private String uom;
    private Date sDate;
    private Double unitPrice;
    private Double totalPrice;
    private int stockEntryNo;
    private String preparedBy;
    private String status;
    private Date lastmodifiedDate;
    private byte[] attachment;
    private String fileName;
     private String remarks;
    

    public StockEntry() {
    }

    public StockEntry(String userId, String orgId, String storeLocationName, String itemCode, String itemName, String itemDesc, Double physicalQty, Date expiryDate, String uom, Date sDate, Double unitPrice, Double totalPrice, int stockEntryNo, String preparedBy, String status, Date lastmodifiedDate,String fileName,byte[] attachment,String remarks) {

        this.userId = userId;
        this.orgId = orgId;
        this.storeLocationName = storeLocationName;
        this.itemCode = itemCode;
        this.itemName = itemName;
        this.itemDesc = itemDesc;
        this.physicalQty = physicalQty;
        this.expiryDate = expiryDate;
        this.uom = uom;
        this.sDate = sDate;
        this.unitPrice = unitPrice;
        this.totalPrice = totalPrice;
        this.stockEntryNo = stockEntryNo;
        this.preparedBy = preparedBy;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.attachment = attachment;
        this.fileName = fileName;
        this.remarks = remarks;
        
    }

    public StockEntry(Integer SNo, String userId, String orgId, String storeLocationName, String itemCode, String itemName, String itemDesc, Double physicalQty, Date expiryDate, String uom, Date sDate, Double unitPrice, Double totalPrice, int stockEntryNo, String preparedBy, String status, Date lastmodifiedDate, String fileName,byte[] attachment,String remarks) {
        this.SNo = SNo;
        this.userId = userId;
        this.orgId = orgId;
        this.storeLocationName = storeLocationName;
        this.itemCode = itemCode;
        this.itemName = itemName;
        this.itemDesc = itemDesc;
        this.physicalQty = physicalQty;
        this.expiryDate = expiryDate;
        this.uom = uom;
        this.sDate = sDate;
        this.unitPrice = unitPrice;
        this.totalPrice = totalPrice;
        this.stockEntryNo = stockEntryNo;
        this.preparedBy = preparedBy;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.attachment = attachment;
        this.fileName = fileName;
        this.remarks = remarks;
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

    @Column(name = "user_id", nullable = false)
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name = "org_id", nullable = false)
    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name = "store_location_name", nullable = false)
    public String getStoreLocationName() {
        return storeLocationName;
    }

    public void setStoreLocationName(String storeLocationName) {
        this.storeLocationName = storeLocationName;
    }

    @Column(name = "item_code", length = 80)
    public String getItemCode() {
        return itemCode;
    }

    public void setItemCode(String itemCode) {
        this.itemCode = itemCode;
    }

    @Column(name = "item_name", length = 120)
    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    @Column(name = "item_Description", length = 120)
    public String getItemDesc() {
        return itemDesc;
    }

    public void setItemDesc(String itemDesc) {
        this.itemDesc = itemDesc;
    }
    
    @Column(name = "physical_stock_qty", precision = 10, scale = 0)
    public Double getPhysicalQty() {
        return physicalQty;
    }

    public void setPhysicalQty(Double physicalQty) {
        this.physicalQty = physicalQty;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "expiry_date", length = 7)
    public Date getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Date expiryDate) {
        this.expiryDate = expiryDate;
    }

    @Column(name = "uom", length = 50)
    public String getUom() {
        return uom;
    }

    public void setUom(String uom) {
        this.uom = uom;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "date", length = 7)
    public Date getsDate() {
        return sDate;
    }

    public void setsDate(Date sDate) {
        this.sDate = sDate;
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

    @Column(name = "stock_entry_no", length = 50)
    public int getStockEntryNo() {
        return stockEntryNo;
    }

    public void setStockEntryNo(int stockEntryNo) {
        this.stockEntryNo = stockEntryNo;
    }

    @Column(name = "prepared_by", length = 50)
    public String getPreparedBy() {
        return preparedBy;
    }

    public void setPreparedBy(String preparedBy) {
        this.preparedBy = preparedBy;
    }

    @Column(name = "status", length = 50)
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
    @Column(name = "Remarks", length = 50)
    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
    

}
