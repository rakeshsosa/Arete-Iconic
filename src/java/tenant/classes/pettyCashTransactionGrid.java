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

/**
 *
 * @author vinay
 */
@Entity
@Table(name = "petty_cash_transaction_grid", schema = "arete_tms")
public class pettyCashTransactionGrid implements java.io.Serializable{
    
    private Integer sNo;
    private String userId;
    private String transactionNumber;
    private Date toDate;
    private String narration;
    private String amount;
    private String trfNumber;
    private String billRefNumber;
    private String propertyUnit;
    private Date lastmodifiedDate;
    private Boolean status;

    public pettyCashTransactionGrid() {
    }

    public pettyCashTransactionGrid(String userId, String transactionNumber, Date toDate, String narration, String amount, String trfNumber, String billRefNumber, String propertyUnit, Date lastmodifiedDate, Boolean status) {
        this.userId = userId;
        this.transactionNumber = transactionNumber;
        this.toDate = toDate;
        this.narration = narration;
        this.amount = amount;
        this.trfNumber = trfNumber;
        this.billRefNumber = billRefNumber;
        this.propertyUnit = propertyUnit;
        this.lastmodifiedDate = lastmodifiedDate;
        this.status = status;
    }

    public pettyCashTransactionGrid(Integer sNo, String userId, String transactionNumber, Date toDate, String narration, String amount, String trfNumber, String billRefNumber, String propertyUnit, Date lastmodifiedDate, Boolean status) {
        this.sNo = sNo;
        this.userId = userId;
        this.transactionNumber = transactionNumber;
        this.toDate = toDate;
        this.narration = narration;
        this.amount = amount;
        this.trfNumber = trfNumber;
        this.billRefNumber = billRefNumber;
        this.propertyUnit = propertyUnit;
        this.lastmodifiedDate = lastmodifiedDate;
        this.status = status;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "s_no")
    public Integer getsNo() {
        return sNo;
    }

    public void setsNo(Integer sNo) {
        this.sNo = sNo;
    }

    @Column(name = "user_id")
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name = "transaction_number")
    public String getTransactionNumber() {
        return transactionNumber;
    }

    public void setTransactionNumber(String transactionNumber) {
        this.transactionNumber = transactionNumber;
    }

    @Column(name = "to_date")
    public Date getToDate() {
        return toDate;
    }

    public void setToDate(Date toDate) {
        this.toDate = toDate;
    }

    @Column(name = "narration")
    public String getNarration() {
        return narration;
    }

    public void setNarration(String narration) {
        this.narration = narration;
    }

    @Column(name = "amount")
    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    @Column(name = "trf_number")
    public String getTrfNumber() {
        return trfNumber;
    }

    public void setTrfNumber(String trfNumber) {
        this.trfNumber = trfNumber;
    }

    @Column(name = "bill_ref_number")
    public String getBillRefNumber() {
        return billRefNumber;
    }

    public void setBillRefNumber(String billRefNumber) {
        this.billRefNumber = billRefNumber;
    }

    @Column(name = "property_unit")
    public String getPropertyUnit() {
        return propertyUnit;
    }

    public void setPropertyUnit(String propertyUnit) {
        this.propertyUnit = propertyUnit;
    }

    @Column(name = "last_modified_date")
    public Date getLastmodifiedDate() {
        return lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }

    @Column(name = "status")
    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }
    
    
    
}
