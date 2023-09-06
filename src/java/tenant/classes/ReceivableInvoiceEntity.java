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
@Table(name = "receivable_invoice", schema = "arete_tms")
public class ReceivableInvoiceEntity implements java.io.Serializable  {
    
    private Integer invoicePk;
    private String userId;
    private String orgId; 
    private String invoiceId;
    private String invoiceName;
    private String invoiceType;
	private String invoiceDesc;
	private String taxCode;
	private String pdChequeNo;
	private String lpNo;
	private String unitName;
	private String tenantName;
	private Date dueDate;
	private String propertyName;
	private String serviceAreaDesc;
	private String custName;
	private Date fromDate;
	private Date toDate;
	private Boolean recurringBtn;
	private Double discount;
	private Double amtPaid;
	private String paymentTerms;
	private String contractTerms;
//	private List<RentDetailsEntity> rentDetailsList;
//	private List<BankDetailsEntity> bankDetailsList;
//	private InvoiceProcessingType processingStatus;
//	private SaveType saveType;
	private Date creationDate;
	private Boolean activeStatus;
	
	private String frequency;
	private Date nextIssueDate;
	private String invoiceRecurringType;
	private Double subTotal;
	private Double balance;
	private Double vat;
	private Double totalPayableAmount;
	private String recordStatus;
        private String bankAccountDetails;

    public ReceivableInvoiceEntity() {
    }

    public ReceivableInvoiceEntity(String userId, String orgId, String invoiceId, String invoiceName, String invoiceType, String invoiceDesc, String taxCode, String pdChequeNo, String lpNo, 
            String unitName, String tenantName, Date dueDate, String propertyName, String serviceAreaDesc, String custName, Date fromDate, Date toDate, Boolean recurringBtn, 
            Double discount, Double amtPaid, String paymentTerms, String contractTerms, Date creationDate, Boolean activeStatus, String frequency, Date nextIssueDate, 
            String invoiceRecurringType, Double subTotal, Double balance, Double vat, Double totalPayableAmount, String recordStatus, String bankAccountDetails) {
        this.invoiceId = invoiceId;
        this.userId = userId;
        this.orgId = orgId;
        this.invoiceName = invoiceName;
        this.invoiceType = invoiceType;
        this.invoiceDesc = invoiceDesc;
        this.taxCode = taxCode;
        this.pdChequeNo = pdChequeNo;
        this.lpNo = lpNo;
        this.unitName = unitName;
        this.tenantName = tenantName;
        this.dueDate = dueDate;
        this.propertyName = propertyName;
        this.serviceAreaDesc = serviceAreaDesc;
        this.custName = custName;
        this.fromDate = fromDate;
        this.toDate = toDate;
        this.recurringBtn = recurringBtn;
        this.discount = discount;
        this.amtPaid = amtPaid;
        this.paymentTerms = paymentTerms;
        this.contractTerms = contractTerms;
        this.creationDate = creationDate;
        this.activeStatus = activeStatus;
        this.frequency = frequency;
        this.nextIssueDate = nextIssueDate;
        this.invoiceRecurringType = invoiceRecurringType;
        this.subTotal = subTotal;
        this.balance = balance;
        this.vat = vat;
        this.totalPayableAmount = totalPayableAmount;
        this.recordStatus = recordStatus;
        this.bankAccountDetails = bankAccountDetails;
    }

    public ReceivableInvoiceEntity(Integer invoicePk, String userId, String orgId, String invoiceId, String invoiceName, String invoiceType, String invoiceDesc, String taxCode, String pdChequeNo, 
            String lpNo, String unitName, String tenantName, Date dueDate, String propertyName, String serviceAreaDesc, String custName, Date fromDate, Date toDate, 
            Boolean recurringBtn, Double discount, Double amtPaid, String paymentTerms, String contractTerms, Date creationDate, Boolean activeStatus, String frequency, 
            Date nextIssueDate, String invoiceRecurringType, Double subTotal, Double balance, Double vat, Double totalPayableAmount, String recordStatus, String bankAccountDetails) {
        this.invoicePk = invoicePk;
        this.userId = userId;
        this.orgId = orgId;
        this.invoiceId = invoiceId;
        this.invoiceName = invoiceName;
        this.invoiceType = invoiceType;
        this.invoiceDesc = invoiceDesc;
        this.taxCode = taxCode;
        this.pdChequeNo = pdChequeNo;
        this.lpNo = lpNo;
        this.unitName = unitName;
        this.tenantName = tenantName;
        this.dueDate = dueDate;
        this.propertyName = propertyName;
        this.serviceAreaDesc = serviceAreaDesc;
        this.custName = custName;
        this.fromDate = fromDate;
        this.toDate = toDate;
        this.recurringBtn = recurringBtn;
        this.discount = discount;
        this.amtPaid = amtPaid;
        this.paymentTerms = paymentTerms;
        this.contractTerms = contractTerms;
        this.creationDate = creationDate;
        this.activeStatus = activeStatus;
        this.frequency = frequency;
        this.nextIssueDate = nextIssueDate;
        this.invoiceRecurringType = invoiceRecurringType;
        this.subTotal = subTotal;
        this.balance = balance;
        this.vat = vat;
        this.totalPayableAmount = totalPayableAmount;
        this.recordStatus = recordStatus;
        this.bankAccountDetails = bankAccountDetails;
    }
    
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="invoice_pk")
    public Integer getInvoicePk() {
        return invoicePk;
    }

    public void setInvoicePk(Integer invoicePk) {
        this.invoicePk = invoicePk;
    }

    @Column(name="invoice_id")
    public String getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(String invoiceId) {
        this.invoiceId = invoiceId;
    }

    @Column(name="invoice_name")
    public String getInvoiceName() {
        return invoiceName;
    }

    public void setInvoiceName(String invoiceName) {
        this.invoiceName = invoiceName;
    }

    @Column(name="invoice_type")
    public String getInvoiceType() {
        return invoiceType;
    }

    public void setInvoiceType(String invoiceType) {
        this.invoiceType = invoiceType;
    }

    @Column(name="invoice_desc")
    public String getInvoiceDesc() {
        return invoiceDesc;
    }

    public void setInvoiceDesc(String invoiceDesc) {
        this.invoiceDesc = invoiceDesc;
    }

    @Column(name="tax_code")
    public String getTaxCode() {
        return taxCode;
    }

    public void setTaxCode(String taxCode) {
        this.taxCode = taxCode;
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

    @Column(name="due_date")
    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    @Column(name="property_name")
    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    @Column(name="service_area_desc")
    public String getServiceAreaDesc() {
        return serviceAreaDesc;
    }

    public void setServiceAreaDesc(String serviceAreaDesc) {
        this.serviceAreaDesc = serviceAreaDesc;
    }

    @Column(name="cust_name")
    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    @Column(name="from_date")
    public Date getFromDate() {
        return fromDate;
    }

    public void setFromDate(Date fromDate) {
        this.fromDate = fromDate;
    }

    @Column(name="to_date")
    public Date getToDate() {
        return toDate;
    }

    public void setToDate(Date toDate) {
        this.toDate = toDate;
    }

    @Column(name="recurring_btn")
    public Boolean getRecurringBtn() {
        return recurringBtn;
    }

    public void setRecurringBtn(Boolean recurringBtn) {
        this.recurringBtn = recurringBtn;
    }

    @Column(name="discount")
    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    @Column(name="amt_paid")
    public Double getAmtPaid() {
        return amtPaid;
    }

    public void setAmtPaid(Double amtPaid) {
        this.amtPaid = amtPaid;
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

    @Column(name="creation_date")
    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    //@Column(name="active_status")
    @Column(name="active_status",columnDefinition = "default=true")
    public Boolean getActiveStatus() {
        return activeStatus;
    }

    public void setActiveStatus(Boolean activeStatus) {
        this.activeStatus = activeStatus;
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

    @Column(name="invocie_recurring_type")
    public String getInvoiceRecurringType() {
        return invoiceRecurringType;
    }

    public void setInvoiceRecurringType(String invoiceRecurringType) {
        this.invoiceRecurringType = invoiceRecurringType;
    }

    @Column(name="sub_total")
    public Double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(Double subTotal) {
        this.subTotal = subTotal;
    }

    @Column(name="balance")
    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }

    @Column(name="vat")
    public Double getVat() {
        return vat;
    }

    public void setVat(Double vat) {
        this.vat = vat;
    }

    @Column(name="total_payable")
    public Double getTotalPayableAmount() {
        return totalPayableAmount;
    }

    public void setTotalPayableAmount(Double totalPayableAmount) {
        this.totalPayableAmount = totalPayableAmount;
    }

    @Column(name="record_status")
    public String getRecordStatus() {
        return recordStatus;
    }

    public void setRecordStatus(String recordStatus) {
        this.recordStatus = recordStatus;
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

    @Column(name="bank_acc_details")
    public String getBankAccountDetails() {
        return bankAccountDetails;
    }

    public void setBankAccountDetails(String bankAccountDetails) {
        this.bankAccountDetails = bankAccountDetails;
    }
        
}
