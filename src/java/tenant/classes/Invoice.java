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
@Table(name="invoice", schema = "arete_tms")
public class Invoice implements java.io.Serializable{
    
    private int SNo;
    
    //tenant details
    private String tenantCode;
    private String tenantName;
    private String tenantId;
    private String billingCycle;
    private String tenantCategory;
     
    //property details
    private String assetCode;
    private String assetName;
    private String flatNo;
    private String plotNo;
    private String buildingNo;
    private String blockNo;
    private String streetNo;
    private String subAssetCode;
    private String rentAmount;
    
    //billingcycle
    private String contractCode;
    private Date period;
    private Date period1;
    private Date creationDate;
    private Date printedDate;
    
    private Date dueDate;
    private String invoiceNo;
    private String status;
    private Date lastmodifiedDate;
    private Date invoiceDate;

    public Invoice() {
    }

    public Invoice(String tenantCode, String tenantName,String tenantId, String billingCycle, String tenantCategory, String assetCode, String assetName, String flatNo, String plotNo, String buildingNo, String blockNo, String streetNo, String subAssetCode, String rentAmount, String contractCode, Date period, Date period1, Date creationDate, Date printedDate, String invoiceNo, String status, Date lastmodifiedDate,Date dueDate,Date invoiceDate) {
        this.tenantCode = tenantCode;
        this.tenantName = tenantName;
        this.tenantId = tenantId;
        this.billingCycle = billingCycle;
        this.tenantCategory = tenantCategory;
        this.assetCode = assetCode;
        this.assetName = assetName;
        this.flatNo = flatNo;
        this.plotNo = plotNo;
        this.buildingNo = buildingNo;
        this.blockNo = blockNo;
        this.streetNo = streetNo;
        this.subAssetCode = subAssetCode;
        this.rentAmount = rentAmount;
        this.contractCode = contractCode;
        this.period = period;
        this.period1 = period1;
        this.creationDate = creationDate;
        this.printedDate = printedDate;
        this.invoiceNo = invoiceNo;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.dueDate = dueDate;
        this.invoiceDate = invoiceDate;
      
        
    }
    
    public Invoice(int SNo, String tenantCode, String tenantName, String tenantId, String billingCycle, String tenantCategory, String assetCode, String assetName, String flatNo, String plotNo, String buildingNo, String blockNo, String streetNo, String subAssetCode, String rentAmount, String contractCode, Date period, Date period1, Date creationDate, Date printedDate, String invoiceNo, String status, Date lastmodifiedDate, Date dueDate,Date invoiceDate) {
        this.SNo = SNo;
        this.tenantCode = tenantCode;
        this.tenantName = tenantName;
        this.tenantId = tenantId;
        this.billingCycle = billingCycle;
        this.tenantCategory = tenantCategory;
        this.assetCode = assetCode;
        this.assetName = assetName;
        this.flatNo = flatNo;
        this.plotNo = plotNo;
        this.buildingNo = buildingNo;
        this.blockNo = blockNo;
        this.streetNo = streetNo;
        this.subAssetCode = subAssetCode;
        this.rentAmount = rentAmount;
        this.contractCode = contractCode;
        this.period = period;
        this.period1 = period1;
        this.creationDate = creationDate;
        this.printedDate = printedDate;
        this.invoiceNo = invoiceNo;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.dueDate = dueDate;
        this.invoiceDate = invoiceDate;
       
    }
    
    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "s_no", unique = true, nullable = false)
    public int getSNo() {
        return SNo;
    }

    public void setSNo(int SNo) {
        this.SNo = SNo;
    }
    
    @Column(name = "tenant_code", length = 60)
    public String getTenantCode() {
        return tenantCode;
    }

    public void setTenantCode(String tenantCode) {
        this.tenantCode = tenantCode;
    }

    @Column(name = "tenant_Name", length = 60)
    public String getTenantName() {
        return tenantName;
    }

    public void setTenantName(String tenantName) {
        this.tenantName = tenantName;
    }
    
    @Column(name = "tenant_Id", length = 60)
    public String getTenantId() {
        return tenantId;
    }

    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }

    @Column(name = "asset_code", length = 60)
    public String getAssetCode() {
        return assetCode;
    }

    public void setAssetCode(String assetCode) {
        this.assetCode = assetCode;
    }
    
    @Column(name = "billing_cycle", length = 60)
    public String getBillingCycle() {
        return billingCycle;
    }

    public void setBillingCycle(String billingCycle) {
        this.billingCycle = billingCycle;
    }
    
    @Temporal(TemporalType.DATE)
    @Column(name = "due_date", length = 20)
    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    @Column(name = "tenant_category", length = 60)
    public String getTenantCategory() {
        return tenantCategory;
    }

    public void setTenantCategory(String tenantCategory) {
        this.tenantCategory = tenantCategory;
    }

    @Column(name = "asset_name", length = 60)
    public String getAssetName() {
        return assetName;
    }

    public void setAssetName(String assetName) {
        this.assetName = assetName;
    }

    @Column(name = "flat_no", length = 60)
    public String getFlatNo() {
        return flatNo;
    }

    public void setFlatNo(String flatNo) {
        this.flatNo = flatNo;
    }

    @Column(name = "plot_no", length = 60)
    public String getPlotNo() {
        return plotNo;
    }

    public void setPlotNo(String plotNo) {
        this.plotNo = plotNo;
    }

    @Column(name = "building_no", length = 60)
    public String getBuildingNo() {
        return buildingNo;
    }

    public void setBuildingNo(String buildingNo) {
        this.buildingNo = buildingNo;
    }

    @Column(name = "block_no", length = 60)
    public String getBlockNo() {
        return blockNo;
    }

    public void setBlockNo(String blockNo) {
        this.blockNo = blockNo;
    }

    @Column(name = "street_no", length = 60)
    public String getStreetNo() {
        return streetNo;
    }

    public void setStreetNo(String streetNo) {
        this.streetNo = streetNo;
    }

    @Column(name = "subasset_code", length = 60)
    public String getSubAssetCode() {
        return subAssetCode;
    }

    public void setSubAssetCode(String subAssetCode) {
        this.subAssetCode = subAssetCode;
    }

    @Column(name = "rent_amount", length = 60)
    public String getRentAmount() {
        return rentAmount;
    }

    public void setRentAmount(String rentAmount) {
        this.rentAmount = rentAmount;
    }

    @Column(name = "contract_code", length = 20)
    public String getContractCode() {
        return contractCode;
    }

    public void setContractCode(String contractCode) {
        this.contractCode = contractCode;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "period", length = 19)
    public Date getPeriod() {
        return period;
    }

    public void setPeriod(Date period) {
        this.period = period;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "period1", length = 19)
    public Date getPeriod1() {
        return period1;
    }

    public void setPeriod1(Date period1) {
        this.period1 = period1;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "create_date", length = 20)
    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }
    
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "printed_date", length = 20)
    public Date getPrintedDate() {
        return printedDate;
    }

    public void setPrintedDate(Date printedDate) {
        this.printedDate = printedDate;
    }

    @Column(name = "invoice_no", length = 60)
    public String getInvoiceNo() {
        return invoiceNo;
    }

    public void setInvoiceNo(String invoiceNo) {
        this.invoiceNo = invoiceNo;
    }

    @Column(name = "status", length = 60)
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

     @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "invoice_date", length = 19)
    public Date getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDate(Date invoiceDate) {
        this.invoiceDate = invoiceDate;
    }

  
    
    
    
    
    
}
