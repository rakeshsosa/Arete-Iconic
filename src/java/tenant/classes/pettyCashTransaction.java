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
@Table(name = "petty_cash_transaction", schema = "arete_tms")
public class pettyCashTransaction implements java.io.Serializable{
    
    private Integer sNo;
    private String userId;
    private String transactionNumber;
    private String walletNumber;
    private String walletName;
    private String openBalance;
    private String closingBal;
    private String remarks;
    private Date lastmodifiedDate;
    private Boolean status;

    public pettyCashTransaction() {
    }

    public pettyCashTransaction(String userId, String transactionNumber, String walletNumber, String walletName, String openBalance, String closingBal, String remarks, Date lastmodifiedDate, Boolean status) {
        this.userId = userId;
        this.transactionNumber = transactionNumber;
        this.walletNumber = walletNumber;
        this.walletName = walletName;
        this.openBalance = openBalance;
        this.closingBal = closingBal;
        this.remarks = remarks;
        this.lastmodifiedDate = lastmodifiedDate;
        this.status = status;
    }

    public pettyCashTransaction(Integer sNo, String userId, String transactionNumber, String walletNumber, String walletName, String openBalance, String closingBal, String remarks, Date lastmodifiedDate, Boolean status) {
        this.sNo = sNo;
        this.userId = userId;
        this.transactionNumber = transactionNumber;
        this.walletNumber = walletNumber;
        this.walletName = walletName;
        this.openBalance = openBalance;
        this.closingBal = closingBal;
        this.remarks = remarks;
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

    @Column(name = "wallet_number")
    public String getWalletNumber() {
        return walletNumber;
    }

    public void setWalletNumber(String walletNumber) {
        this.walletNumber = walletNumber;
    }

    @Column(name = "wallet_name")
    public String getWalletName() {
        return walletName;
    }

    public void setWalletName(String walletName) {
        this.walletName = walletName;
    }

    @Column(name = "open_balance")
    public String getOpenBalance() {
        return openBalance;
    }

    public void setOpenBalance(String openBalance) {
        this.openBalance = openBalance;
    }

    @Column(name = "closing_balance")
    public String getClosingBal() {
        return closingBal;
    }

    public void setClosingBal(String closingBal) {
        this.closingBal = closingBal;
    }

    @Column(name = "remarks")
    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
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
