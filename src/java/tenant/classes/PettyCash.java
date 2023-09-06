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
@Table(name = "petty_cash", schema = "arete_tms")
public class PettyCash implements java.io.Serializable{
    
     private Integer sNo;
     private String userId;
     private String walletNumber;
     private String walletName;
     private String custodianName;
     private String description;
     private String walletLimit;
     private String currency;
     private String openBalance;
     private String propertyName;
     private String remarks;
     private Date lastmodifiedDate;
     private Boolean status;

    public PettyCash() {
    }

    public PettyCash(String userId, String walletNumber, String walletName, String custodianName, String description, String walletLimit, String currency, String openBalance, String propertyName, String remarks, Date lastmodifiedDate, Boolean status) {
        this.userId = userId;
        this.walletNumber = walletNumber;
        this.walletName = walletName;
        this.custodianName = custodianName;
        this.description = description;
        this.walletLimit = walletLimit;
        this.currency = currency;
        this.openBalance = openBalance;
        this.propertyName = propertyName;
        this.remarks = remarks;
        this.lastmodifiedDate = lastmodifiedDate;
        this.status = status;
    }

    public PettyCash(Integer sNo, String userId, String walletNumber, String walletName, String custodianName, String description, String walletLimit, String currency, String openBalance, String propertyName, String remarks, Date lastmodifiedDate, Boolean status) {
        this.sNo = sNo;
        this.userId = userId;
        this.walletNumber = walletNumber;
        this.walletName = walletName;
        this.custodianName = custodianName;
        this.description = description;
        this.walletLimit = walletLimit;
        this.currency = currency;
        this.openBalance = openBalance;
        this.propertyName = propertyName;
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

    @Column(name = "custodian_name")
    public String getCustodianName() {
        return custodianName;
    }

    public void setCustodianName(String custodianName) {
        this.custodianName = custodianName;
    }

    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Column(name = "wallet_limit")
    public String getWalletLimit() {
        return walletLimit;
    }

    public void setWalletLimit(String walletLimit) {
        this.walletLimit = walletLimit;
    }

    @Column(name = "to_currency")
    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    @Column(name = "open_balance")
    public String getOpenBalance() {
        return openBalance;
    }

    public void setOpenBalance(String openBalance) {
        this.openBalance = openBalance;
    }

    @Column(name = "property_name")
    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
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
