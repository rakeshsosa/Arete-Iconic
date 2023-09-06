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
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "standard_invoice", schema = "arete_tms") 
public class StandardInvoice implements java.io.Serializable {

    //InvoiceDetails
    private Integer SNo;
    private String userId;
    private String orgId;
    private String invoiceNo;
    private String invoiceType;
    private String description;
    private String taxCode;
    
    //TenentDetails
    private String propertyName;
    private String servcieAreaDescription;
    private String customerName;
    private Date dueDate;
    private Date fromDate;
    private Date toPeriod;
    private String pdChequeNo;
    private String lpNo;
    private String unitName;
    private String tenantName;
    
    //AdditionalDetails
    private String bankAccountDetails;
    private String paymentTerms;
    private String contractTerms;
    private Double discount;
    private Double amountPaid;
    private Double subtotal;
    private Double vat;
    private Double discountedAmount;
    private Double totalPayableAmt;
    private Double balance;
    
    private String invoiceName;
    private String status;
    private Date createdDate;
    private String recordStatus;
    private Boolean recurringBtn;
    private String frequency;
    private Date nextIssueDate;
    private String invoiceRecurringType;
    private Date lastModifiedDate;
    private String invoiceProcessingType;
    private String ledgerVoucherType;
    
    //Process Payment
    private String paymentType;
    private String transactionRefNo;
    private Date paymentDate;

    public StandardInvoice() {
    }

    public StandardInvoice(String userId, String orgId, String invoiceNo, String invoiceName, String invoiceType, String description, String taxCode, String pdChequeNo, String lpNo, 
            String unitName, String tenantName, Date dueDate, String propertyName, String servcieAreaDescription, String customerName, Date fromDate, Date toDate, Boolean recurringBtn, 
            Double discount, Double amtPaid, String paymentTerms, String contractTerms, Date creationDate, String activeStatus, String frequency, Date nextIssueDate, 
            String invoiceRecurringType, Double subtotal, Double balance, Double vat, Double totalPayableAmount, String recordStatus, String bankAccountDetails, String invoiceProcessingType) {
        this.userId = userId;
        this.orgId = orgId;
        this.invoiceNo = invoiceNo;
        this.invoiceType = invoiceType;
        this.description = description;
        this.taxCode = taxCode;
        this.propertyName = propertyName;
        this.servcieAreaDescription = servcieAreaDescription;
        this.customerName = customerName;
        this.dueDate = dueDate;
        this.fromDate = fromDate;
        this.toPeriod = toDate;
        this.pdChequeNo = pdChequeNo;
        this.lpNo = lpNo;
        this.unitName = unitName;
        this.tenantName = tenantName;
        this.bankAccountDetails = bankAccountDetails;
        this.paymentTerms = paymentTerms;
        this.contractTerms = contractTerms;
        this.discount = discount;
        this.amountPaid = amtPaid;
        this.subtotal = subtotal;
        this.vat = vat;
        this.discountedAmount = discount;
        this.totalPayableAmt = totalPayableAmount;
        this.balance = balance;
        this.invoiceName = invoiceName;
        this.status = activeStatus;
        this.createdDate = creationDate;
        this.recordStatus = recordStatus;
        this.recurringBtn = recurringBtn;
        this.frequency = frequency;
        this.nextIssueDate = nextIssueDate;
        this.invoiceRecurringType = invoiceRecurringType;
        this.invoiceProcessingType = invoiceProcessingType;
    }

    public StandardInvoice(Integer Sno, String userId, String orgId, String invoiceNo, String invoiceName, String invoiceType, String description, String taxCode, String pdChequeNo, String lpNo, 
            String unitName, String tenantName, Date dueDate, String propertyName, String servcieAreaDescription, String customerName, Date fromDate, Date toDate, Boolean recurringBtn, 
            Double discount, Double amtPaid, String paymentTerms, String contractTerms, Date creationDate, String activeStatus, String frequency, Date nextIssueDate, 
            String invoiceRecurringType, Double subtotal, Double balance, Double vat, Double totalPayableAmount, String recordStatus, String bankAccountDetails, String invoiceProcessingType) {
        this.SNo = Sno;
        this.userId = userId;
        this.orgId = orgId;
        this.invoiceNo = invoiceNo;
        this.invoiceType = invoiceType;
        this.description = description;
        this.taxCode = taxCode;
        this.propertyName = propertyName;
        this.servcieAreaDescription = servcieAreaDescription;
        this.customerName = customerName;
        this.dueDate = dueDate;
        this.fromDate = fromDate;
        this.toPeriod = toDate;
        this.pdChequeNo = pdChequeNo;
        this.lpNo = lpNo;
        this.unitName = unitName;
        this.tenantName = tenantName;
        this.bankAccountDetails = bankAccountDetails;
        this.paymentTerms = paymentTerms;
        this.contractTerms = contractTerms;
        this.discount = discount;
        this.amountPaid = amtPaid;
        this.subtotal = subtotal;
        this.vat = vat;
        this.discountedAmount = discount;
        this.totalPayableAmt = totalPayableAmount;
        this.balance = balance;
        this.invoiceName = invoiceName;
        this.status = activeStatus;
        this.createdDate = creationDate;
        this.recordStatus = recordStatus;
        this.recurringBtn = recurringBtn;
        this.frequency = frequency;
        this.nextIssueDate = nextIssueDate;
        this.invoiceRecurringType = invoiceRecurringType;
        this.invoiceProcessingType = invoiceProcessingType;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="sno")
    public Integer getSNo() {
        return SNo;
    }

    public void setSNo(Integer SNo) {
        this.SNo = SNo;
    }

    @Column(name="user_id")
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name="org_id")
    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name="invoice_no")
    public String getInvoiceNo() {
        return invoiceNo;
    }

    public void setInvoiceNo(String invoiceNo) {
        this.invoiceNo = invoiceNo;
    }

    @Column(name="invoice_type")
    public String getInvoiceType() {
        return invoiceType;
    }

    public void setInvoiceType(String invoiceType) {
        this.invoiceType = invoiceType;
    }

    @Column(name="description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Column(name="tax_code")
    public String getTaxCode() {
        return taxCode;
    }

    public void setTaxCode(String taxCode) {
        this.taxCode = taxCode;
    }

    @Column(name="property_name")
    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    @Column(name="service_area_desc")
    public String getServcieAreaDescription() {
        return servcieAreaDescription;
    }

    public void setServcieAreaDescription(String servcieAreaDescription) {
        this.servcieAreaDescription = servcieAreaDescription;
    }

    @Column(name="customer_name")
    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    @Column(name="due_date")
    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    @Column(name="from_date")
    public Date getFromDate() {
        return fromDate;
    }

    public void setFromDate(Date fromDate) {
        this.fromDate = fromDate;
    }

    @Column(name="to_period")
    public Date getToPeriod() {
        return toPeriod;
    }

    public void setToPeriod(Date toPeriod) {
        this.toPeriod = toPeriod;
    }

    @Column(name="bank_details")
    public String getBankAccountDetails() {
        return bankAccountDetails;
    }

    public void setBankAccountDetails(String bankAccountDetails) {
        this.bankAccountDetails = bankAccountDetails;
    }

    @Column(name="payment_terms")
    public String getPaymentTerms() {
        return paymentTerms;
    }

    public void setPaymentTerms(String paymentTerms) {
        this.paymentTerms = paymentTerms;
    }

    @Column(name="contract_terms")
    public String getContractTerms() {
        return contractTerms;
    }

    public void setContractTerms(String contractTerms) {
        this.contractTerms = contractTerms;
    }

    @Column(name="discount")
    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    @Column(name="amt_paid")
    public Double getAmountPaid() {
        return amountPaid;
    }

    public void setAmountPaid(Double amountPaid) {
        this.amountPaid = amountPaid;
    }

    @Column(name="subtotal")
    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    @Column(name="vat")
    public Double getVat() {
        return vat;
    }

    public void setVat(Double vat) {
        this.vat = vat;
    }

    @Column(name="discounted_amt")
    public Double getDiscountedAmount() {
        return discountedAmount;
    }

    public void setDiscountedAmount(Double discountedAmount) {
        this.discountedAmount = discountedAmount;
    }

    @Column(name="total_payable")
    public Double getTotalPayableAmt() {
        return totalPayableAmt;
    }

    public void setTotalPayableAmt(Double totalPayableAmt) {
        this.totalPayableAmt = totalPayableAmt;
    }

    @Column(name="balance")
    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }

    @Column(name="status")
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Column(name="cdate")
    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    @Column(name="lastmodified_date")
    public Date getLastModifiedDate() {
        return lastModifiedDate;
    }

    public void setLastModifiedDate(Date lastModifiedDate) {
        this.lastModifiedDate = lastModifiedDate;
    }

    @Column(name="pd_cheque_no")
    public String getPdChequeNo() {
        return pdChequeNo;
    }

    public void setPdChequeNo(String pdChequeNo) {
        this.pdChequeNo = pdChequeNo;
    }

    @Column(name="lp_no")
    public String getLpNo() {
        return lpNo;
    }

    public void setLpNo(String lpNo) {
        this.lpNo = lpNo;
    }

    @Column(name="unit_name")
    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName;
    }

    @Column(name="tenant_name")
    public String getTenantName() {
        return tenantName;
    }

    public void setTenantName(String tenantName) {
        this.tenantName = tenantName;
    }

    @Column(name="invocie_name")
    public String getInvoiceName() {
        return invoiceName;
    }

    public void setInvoiceName(String invoiceName) {
        this.invoiceName = invoiceName;
    }

    @Column(name="record_status")
    public String getRecordStatus() {
        return recordStatus;
    }

    public void setRecordStatus(String recordStatus) {
        this.recordStatus = recordStatus;
    }

    @Column(name="recurring_btn")
    public Boolean getRecurringBtn() {
        return recurringBtn;
    }

    public void setRecurringBtn(Boolean recurringBtn) {
        this.recurringBtn = recurringBtn;
    }

    @Column(name="frequency")
    public String getFrequency() {
        return frequency;
    }

    public void setFrequency(String frequency) {
        this.frequency = frequency;
    }

    @Column(name="next_issue_date")
    public Date getNextIssueDate() {
        return nextIssueDate;
    }

    public void setNextIssueDate(Date nextIssueDate) {
        this.nextIssueDate = nextIssueDate;
    }

    @Column(name="invoice_recurring_type")
    public String getInvoiceRecurringType() {
        return invoiceRecurringType;
    }

    public void setInvoiceRecurringType(String invoiceRecurringType) {
        this.invoiceRecurringType = invoiceRecurringType;
    }

    @Column(name="payment_type")
    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    @Column(name="transaction_ref_no")
    public String getTransactionRefNo() {
        return transactionRefNo;
    }

    public void setTransactionRefNo(String transactionRefNo) {
        this.transactionRefNo = transactionRefNo;
    }

    @Column(name="payment_date")
    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    @Column(name="processing_status")
    public String getInvoiceProcessingType() {
        return invoiceProcessingType;
    }

    public void setInvoiceProcessingType(String invoiceProcessingType) {
        this.invoiceProcessingType = invoiceProcessingType;
    }

    @Column(name="ledger_voucher_status")
    public String getLedgerVoucherType() {
        return ledgerVoucherType;
    }

    public void setLedgerVoucherType(String ledgerVoucherType) {
        this.ledgerVoucherType = ledgerVoucherType;
    }
    
}

