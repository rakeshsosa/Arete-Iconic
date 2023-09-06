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
@Table(name = "petty_cash_grid", schema = "arete_tms")
public class PettyCashGrid implements java.io.Serializable{
    
    private Integer sNo;
    private String userId;
    private String walletNumber;
    private String walletNumberGrid;
    private Date depositDateGrid;
    private String depositAmountGrid;
    private String trfNumberGrid;
    private String paymentTypeGrid;
    private Date lastmodifiedDate;
    private Boolean status;

    public PettyCashGrid() {
    }

    public PettyCashGrid(String userId, String walletNumber, String walletNumberGrid, Date depositDateGrid, String depositAmountGrid, String trfNumberGrid, String paymentTypeGrid, Date lastmodifiedDate, Boolean status) {
        this.userId = userId;
        this.walletNumber = walletNumber;
        this.walletNumberGrid = walletNumberGrid;
        this.depositDateGrid = depositDateGrid;
        this.depositAmountGrid = depositAmountGrid;
        this.trfNumberGrid = trfNumberGrid;
        this.paymentTypeGrid = paymentTypeGrid;
        this.lastmodifiedDate = lastmodifiedDate;
        this.status = status;
    }

    public PettyCashGrid(Integer sNo, String userId, String walletNumber, String walletNumberGrid, Date depositDateGrid, String depositAmountGrid, String trfNumberGrid, String paymentTypeGrid, Date lastmodifiedDate, Boolean status) {
        this.sNo = sNo;
        this.userId = userId;
        this.walletNumber = walletNumber;
        this.walletNumberGrid = walletNumberGrid;
        this.depositDateGrid = depositDateGrid;
        this.depositAmountGrid = depositAmountGrid;
        this.trfNumberGrid = trfNumberGrid;
        this.paymentTypeGrid = paymentTypeGrid;
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

    @Column(name = "wallet_number_grid")
    public String getWalletNumberGrid() {
        return walletNumberGrid;
    }

    public void setWalletNumberGrid(String walletNumberGrid) {
        this.walletNumberGrid = walletNumberGrid;
    }

    @Column(name = "deposit_date_grid")
    public Date getDepositDateGrid() {
        return depositDateGrid;
    }

    public void setDepositDateGrid(Date depositDateGrid) {
        this.depositDateGrid = depositDateGrid;
    }

    @Column(name = "deposit_amount_grid")
    public String getDepositAmountGrid() {
        return depositAmountGrid;
    }

    public void setDepositAmountGrid(String depositAmountGrid) {
        this.depositAmountGrid = depositAmountGrid;
    }

    @Column(name = "trf_number")
    public String getTrfNumberGrid() {
        return trfNumberGrid;
    }

    public void setTrfNumberGrid(String trfNumberGrid) {
        this.trfNumberGrid = trfNumberGrid;
    }

    @Column(name = "payment_type_grid")
    public String getPaymentTypeGrid() {
        return paymentTypeGrid;
    }

    public void setPaymentTypeGrid(String paymentTypeGrid) {
        this.paymentTypeGrid = paymentTypeGrid;
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
