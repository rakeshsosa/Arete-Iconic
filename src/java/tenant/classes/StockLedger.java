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
@Table(name = "stock_ledger", schema = "arete_tms"
)
public class StockLedger implements java.io.Serializable {
    
    private Integer SNo;
    private String userId;
    private String orgId;
    private String division;
    private String storeName;
    private String itemSubCategory;
    private String itemCode;
    private String itemName;
    private Date transactionDate;
    private String documentNo;
    private String receiptNo;
    private Double receiptQty;
    private Double receiptPrice;
    private Double receiptAmount;
    private String issueNo;
    private Double issueQty;
    private Double issuePrice;
    private Double issueAmount;
    private Double balanceQty;
    private Double balanceRate;
    private Double balnaceAmount;
    private String transactionType;
     private String uom;

    public StockLedger() {
    }

    public StockLedger(String userId, String orgId, String division, String storeName, String itemSubCategory, 
            String itemCode, String itemName, Date transactionDate, String documentNo, String receiptNo, 
            Double receiptQty, Double receiptPrice, Double receiptAmount, String issueNo, Double issueQty, 
            Double issuePrice, Double issueAmount, Double balanceQty, Double balanceRate, Double balnaceAmount,String transactionType,String uom) {
        this.userId = userId;
        this.orgId = orgId;
        this.division = division;
        this.storeName = storeName;
        this.itemSubCategory = itemSubCategory;
        this.itemCode = itemCode;
        this.itemName = itemName;
        this.transactionDate = transactionDate;
        this.documentNo = documentNo;
        this.receiptNo = receiptNo;
        this.receiptQty = receiptQty;
        this.receiptPrice = receiptPrice;
        this.receiptAmount = receiptAmount;
        this.issueNo = issueNo;
        this.issueQty = issueQty;
        this.issuePrice = issuePrice;
        this.issueAmount = issueAmount;
        this.balanceQty = balanceQty;
        this.balanceRate = balanceRate;
        this.balnaceAmount = balnaceAmount;
        this.transactionType = transactionType;
        this.uom = uom;
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

    @Column(name = "division", length = 60)
    public String getDivision() {
        return division;
    }

    public void setDivision(String division) {
        this.division = division;
    }

    @Column(name = "store_name", length = 60)
    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    @Column(name = "item_sub_category", length = 60)
    public String getItemSubCategory() {
        return itemSubCategory;
    }

    public void setItemSubCategory(String itemSubCategory) {
        this.itemSubCategory = itemSubCategory;
    }

    @Column(name = "item_code", length = 60)
    public String getItemCode() {
        return itemCode;
    }

    public void setItemCode(String itemCode) {
        this.itemCode = itemCode;
    }

    @Column(name = "item_name", length = 60)
    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "transaction_date", length = 60)
    public Date getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(Date transactionDate) {
        this.transactionDate = transactionDate;
    }

    @Column(name = "document_no", length = 60)
    public String getDocumentNo() {
        return documentNo;
    }

    public void setDocumentNo(String documentNo) {
        this.documentNo = documentNo;
    }

    @Column(name = "receipt_no", length = 60)
    public String getReceiptNo() {
        return receiptNo;
    }

    public void setReceiptNo(String receiptNo) {
        this.receiptNo = receiptNo;
    }

    @Column(name = "receipt_qty", length = 60)
    public Double getReceiptQty() {
        return receiptQty;
    }

    public void setReceiptQty(Double receiptQty) {
        this.receiptQty = receiptQty;
    }

    @Column(name = "receipt_price", length = 60)
    public Double getReceiptPrice() {
        return receiptPrice;
    }

    public void setReceiptPrice(Double receiptPrice) {
        this.receiptPrice = receiptPrice;
    }

    @Column(name = "receipt_amount", length = 60)
    public Double getReceiptAmount() {
        return receiptAmount;
    }

    public void setReceiptAmount(Double receiptAmount) {
        this.receiptAmount = receiptAmount;
    }

    @Column(name = "issue_no", length = 60)
    public String getIssueNo() {
        return issueNo;
    }

    public void setIssueNo(String issueNo) {
        this.issueNo = issueNo;
    }

    @Column(name = "issue_qty", length = 60)
    public Double getIssueQty() {
        return issueQty;
    }

    public void setIssueQty(Double issueQty) {
        this.issueQty = issueQty;
    }

    @Column(name = "issue_price", length = 60)
    public Double getIssuePrice() {
        return issuePrice;
    }

    public void setIssuePrice(Double issuePrice) {
        this.issuePrice = issuePrice;
    }

    @Column(name = "issue_amount", length = 60)
    public Double getIssueAmount() {
        return issueAmount;
    }

    public void setIssueAmount(Double issueAmount) {
        this.issueAmount = issueAmount;
    }

    @Column(name = "balance_qty", length = 60)
    public Double getBalanceQty() {
        return balanceQty;
    }

    public void setBalanceQty(Double balanceQty) {
        this.balanceQty = balanceQty;
    }

    @Column(name = "balance_rate", length = 60)
    public Double getBalanceRate() {
        return balanceRate;
    }

    public void setBalanceRate(Double balanceRate) {
        this.balanceRate = balanceRate;
    }

    @Column(name = "balnace_amount", length = 60)
    public Double getBalnaceAmount() {
        return balnaceAmount;
    }

    public void setBalnaceAmount(Double balnaceAmount) {
        this.balnaceAmount = balnaceAmount;
    }

    @Column(name = "transaction_type", length = 60)
    public String getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }

    @Column(name = "uom", length = 60)
    public String getUom() {
        return uom;
    }

    public void setUom(String uom) {
        this.uom = uom;
    }
    
    
}
