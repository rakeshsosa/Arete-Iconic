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
@Table(name="rent_invoice", schema = "arete_tms")
public class RentInvoice implements java.io.Serializable{
    
    private int SNo;
    //landlord details
    private String llName;
    private String llId;
    private String llCrNo;
    private String llContactno;
    private String llMailid;
    //tenant details
    private String tenantCode;
    private String tenantFname;
    private String tenantLname;

    private String tenantId;
    private String tenantContactno;
    private String correspondenceAddress;
    private String postalCode;
    private String postboxNo;
    //property details
    private String assetCode;
    private String assetName;
    private String flatNo;
    private String plotNo;
    private String assetPostalCode;
    private String assetPostboxNo;
    private String buildingNo;
    private String blockNo;
    private String streetNo;
    
    //billingcycle
    private String totalAmount;
//    private String discountforadvance;
    private String discountforrent;
    private String billingCycle;
    private String advanceAmount;
    private Date dueDate;
    
    
    private String subtotal;
    private String subtotalLessDiscount;
    private String taxRate;
    private String totalTax;
    
    //contract
    private Date contractFromDate;
    private Date contractToDate;

    private Date rentFromDate;
    private Date rentToDate;
    
    private String invoiceNo;
    private Date printedDate;
    private Date lastmodifiedDate;
    private Date invoiceDate;

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "s_no", unique = true, nullable = false)
    public int getSNo() {
        return SNo;
    }

    public void setSNo(int SNo) {
        this.SNo = SNo;
    }

    @Column(name = "ll_name", length = 60)
    public String getLlName() {
        return llName;
    }

    public void setLlName(String llName) {
        this.llName = llName;
    }

    @Column(name = "ll_id", length = 60)
    public String getLlId() {
        return llId;
    }

    public void setLlId(String llId) {
        this.llId = llId;
    }

    @Column(name = "ll_cr_no", length = 60)
    public String getLlCrNo() {
        return llCrNo;
    }

    public void setLlCrNo(String llCrNo) {
        this.llCrNo = llCrNo;
    }

    @Column(name = "l_contact_number")
    public String getLlContactno() {
        return llContactno;
    }

    public void setLlContactno(String llContactno) {
        this.llContactno = llContactno;
    }

    @Column(name = "ll_mailid", length = 60)
    public String getLlMailid() {
        return llMailid;
    }

    public void setLlMailid(String llMailid) {
        this.llMailid = llMailid;
    }

    @Column(name = "t_code")
    public String getTenantCode() {
        return tenantCode;
    }

    public void setTenantCode(String tenantCode) {
        this.tenantCode = tenantCode;
    }
    
    @Column(name = "t_fname")
     public String getTenantFname() {
        return tenantFname;
    }

    public void setTenantFname(String tenantFname) {
        this.tenantFname = tenantFname;
    }

    @Column(name = "t_lname")
    public String getTenantLname() {
        return tenantLname;
    }

    public void setTenantLname(String tenantLname) {
        this.tenantLname = tenantLname;
    }

    @Column(name = "tenant_id", length = 60)
    public String getTenantId() {
        return tenantId;
    }

    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }

    @Column(name = "t_contact_number")
    public String getTenantContactno() {
        return tenantContactno;
    }

    public void setTenantContactno(String tenantContactno) {
        this.tenantContactno = tenantContactno;
    }

    @Column(name = "correspondence_address", length = 250)
    public String getCorrespondenceAddress() {
        return correspondenceAddress;
    }

    public void setCorrespondenceAddress(String correspondenceAddress) {
        this.correspondenceAddress = correspondenceAddress;
    }

    @Column(name = "t_postal_code", length = 10)
    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    @Column(name = "t_postbox_no", length = 60)
    public String getPostboxNo() {
        return postboxNo;
    }

    public void setPostboxNo(String postboxNo) {
        this.postboxNo = postboxNo;
    }

    @Column(name = "asset_code")
    public String getAssetCode() {
        return assetCode;
    }

    public void setAssetCode(String assetCode) {
        this.assetCode = assetCode;
    }

    @Column(name = "asset_name")
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

    @Column(name = "total_amount", length = 60)
    public String getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(String totalAmount) {
        this.totalAmount = totalAmount;
    }

//    @Column(name = "discount_advance", length = 60)
//    public String getDiscountforadvance() {
//        return discountforadvance;
//    }
//
//    public void setDiscountforadvance(String discountforadvance) {
//        this.discountforadvance = discountforadvance;
//    }

    @Column(name = "discount_rent", length = 60)
    public String getDiscountforrent() {
        return discountforrent;
    }

    public void setDiscountforrent(String discountforrent) {
        this.discountforrent = discountforrent;
    }

    @Column(name = "billing_cycle")
    public String getBillingCycle() {
        return billingCycle;
    }

    public void setBillingCycle(String billingCycle) {
        this.billingCycle = billingCycle;
    }

    @Column(name = "advance_amount", length = 60)
    public String getAdvanceAmount() {
        return advanceAmount;
    }

    public void setAdvanceAmount(String advanceAmount) {
        this.advanceAmount = advanceAmount;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "due_date", length = 10)
    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    @Column(name = "sub_total", length = 60)
    public String getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(String subtotal) {
        this.subtotal = subtotal;
    }

    @Column(name = "sub_tot_less_discount", length = 60)
    public String getSubtotalLessDiscount() {
        return subtotalLessDiscount;
    }

    public void setSubtotalLessDiscount(String subtotalLessDiscount) {
        this.subtotalLessDiscount = subtotalLessDiscount;
    }

    @Column(name = "tax_rate", length = 60)
    public String getTaxRate() {
        return taxRate;
    }

    public void setTaxRate(String taxRate) {
        this.taxRate = taxRate;
    }

    @Column(name = "total_tax", length = 60)
    public String getTotalTax() {
        return totalTax;
    }

    public void setTotalTax(String totalTax) {
        this.totalTax = totalTax;
    }

//    @Temporal(TemporalType.DATE)
//    @Column(name = "date", length = 60)
//    public Date getDate() {
//        return date;
//    }
//
//    public void setDate(Date date) {
//        this.date = date;
//    }

    @Column(name = "invoice_no", length = 60)
    public String getInvoiceNo() {
        return invoiceNo;
    }

    public void setInvoiceNo(String invoiceNo) {
        this.invoiceNo = invoiceNo;
    }
    
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "contract_fr_date", length = 19)
    public Date getContractFromDate() {
        return contractFromDate;
    }

    public void setContractFromDate(Date contractFromDate) {
        this.contractFromDate = contractFromDate;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "contract_to_date", length = 19)
    public Date getContractToDate() {
        return contractToDate;
    }

    public void setContractToDate(Date contractToDate) {
        this.contractToDate = contractToDate;
    }
    
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "printed_date", length = 19)
     public Date getPrintedDate() {
        return printedDate;
    }

    public void setPrintedDate(Date printedDate) {
        this.printedDate = printedDate;
    }
    
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "rent_fr_date", length = 19)
    public Date getRentFromDate() {
        return rentFromDate;
    }

    public void setRentFromDate(Date rentFromDate) {
        this.rentFromDate = rentFromDate;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "rent_to_date", length = 19)
    public Date getRentToDate() {
        return rentToDate;
    }

    public void setRentToDate(Date rentToDate) {
        this.rentToDate = rentToDate;
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
