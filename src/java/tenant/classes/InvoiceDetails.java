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
@Table(name = "invoice_details", schema = "arete_tms"
)
public class InvoiceDetails implements java.io.Serializable {

    private Integer sNo;
    private String invoiceNo;
    private String supplierName;
    private String poNo;
    private String grn;
    private String orgId;
    private String docType;
    private String docRef;
    private Date docDate;
    private String paymentTerms;
    private String itemName;
    private Double unitPrice;
    private Double grnQty;
    private Double totQty;
    private Double billedAmt;
    private String status;
    private Date lastModifiedDate;
    private String currency;

    public InvoiceDetails() {
        //no-op
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)

    @Column(name = "sno", unique = true, nullable = false)
    public Integer getsNo() {
        return sNo;
    }

    public void setsNo(Integer sNo) {
        this.sNo = sNo;
    }

    @Column(name = "invoice_no", length = 50)
    public String getInvoiceNo() {
        return invoiceNo;
    }

    public void setInvoiceNo(String invoiceNo) {
        this.invoiceNo = invoiceNo;
    }

    @Column(name = "supplier_name", length = 50)
    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    @Column(name = "po_no", length = 50)
    public String getPoNo() {
        return poNo;
    }

    public void setPoNo(String poNo) {
        this.poNo = poNo;
    }

    @Column(name = "grn", length = 50)
    public String getGrn() {
        return grn;
    }

    public void setGrn(String grn) {
        this.grn = grn;
    }

    @Column(name = "org_id", length = 50)
    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name = "doc_type", length = 50)
    public String getDocType() {
        return docType;
    }

    public void setDocType(String docType) {
        this.docType = docType;
    }

    @Column(name = "doc_ref", length = 50)
    public String getDocRef() {
        return docRef;
    }

    public void setDocRef(String docRef) {
        this.docRef = docRef;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "doc_date", length = 19)
    public Date getDocDate() {
        return docDate;
    }

    public void setDocDate(Date docDate) {
        this.docDate = docDate;
    }

    @Column(name = "payment_terms", length = 50)
    public String getPaymentTerms() {
        return paymentTerms;
    }

    public void setPaymentTerms(String paymentTerms) {
        this.paymentTerms = paymentTerms;
    }

    @Column(name = "item_name", length = 50)
    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    @Column(name = "unit_price", length = 50)
    public Double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Double unitPrice) {
        this.unitPrice = unitPrice;
    }

    @Column(name = "grn_qty", length = 50)
    public Double getGrnQty() {
        return grnQty;
    }

    public void setGrnQty(Double grnQty) {
        this.grnQty = grnQty;
    }

    @Column(name = "tot_qty", length = 50)
    public Double getTotQty() {
        return totQty;
    }

    public void setTotQty(Double totQty) {
        this.totQty = totQty;
    }

    @Column(name = "billed_amt", length = 50)
    public Double getBilledAmt() {
        return billedAmt;
    }

    public void setBilledAmt(Double billedAmt) {
        this.billedAmt = billedAmt;
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
    public Date getLastModifiedDate() {
        return lastModifiedDate;
    }

    public void setLastModifiedDate(Date lastModifiedDate) {
        this.lastModifiedDate = lastModifiedDate;
    }

    @Column(name = "currency", length = 50)
    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

}
