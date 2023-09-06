/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.classes;

import java.util.Date;
import java.util.List;

public class ReceivableInvoice {
    
    private Integer invoicePk;
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
	private List<RentDetailsEntity> rentDetailsList;
	private List<BankDetailsEntity> bankDetailsList;
	private String processingStatus;
	private String saveType;
	private Date creationDate;
	private Boolean activeStatus;

    public ReceivableInvoice(String invoiceId, String invoiceName, String invoiceType, String invoiceDesc, String taxCode, String pdChequeNo, String lpNo, String unitName, String tenantName, Date dueDate, String propertyName, String serviceAreaDesc, String custName, Date fromDate, Date toDate, Boolean recurringBtn, Double discount, Double amtPaid, String paymentTerms, String contractTerms, List<RentDetailsEntity> rentDetailsList, List<BankDetailsEntity> bankDetailsList, String processingStatus, String saveType) {
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
        this.rentDetailsList = rentDetailsList;
        this.bankDetailsList = bankDetailsList;
        this.processingStatus = processingStatus;
        this.saveType = saveType;
    }

    public ReceivableInvoice(Integer invoicePk, String invoiceId, String invoiceName, String invoiceType, String invoiceDesc, String taxCode, String pdChequeNo, String lpNo, String unitName, String tenantName, Date dueDate, String propertyName, String serviceAreaDesc, String custName, Date fromDate, Date toDate, Boolean recurringBtn, Double discount, Double amtPaid, String paymentTerms, String contractTerms, List<RentDetailsEntity> rentDetailsList, List<BankDetailsEntity> bankDetailsList, String processingStatus, String saveType, Date creationDate, Boolean activeStatus) {
        this.invoicePk = invoicePk;
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
        this.rentDetailsList = rentDetailsList;
        this.bankDetailsList = bankDetailsList;
        this.processingStatus = processingStatus;
        this.saveType = saveType;
        this.creationDate = creationDate;
        this.activeStatus = activeStatus;
    }
        
        
}
