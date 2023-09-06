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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "voucher_master", schema = "arete_tms")
public class VoucherMasterEntity implements java.io.Serializable {
    
    private Integer voucherPk;
    private String voucherId;
    private String invoiceId;
    private String ledgerNo;
    private Double voucherAmt;
    private String voucherAmtType;
    private String typeOfVoucher;
    private String voucherAccountStatus;
    private String voucherNarration;
    private String voucherRemarks;
    private Date creationDate;
    private Boolean activeStatus;
    private String cdate;
    private String transationRefNumber;
    private String makeRecurring;
    private String drcrType;

    public VoucherMasterEntity() {
    }

    public VoucherMasterEntity(String voucherId, String invoiceId, String ledgerNo, String typeOfVoucher, String voucherAccountStatus, String voucherNarration, 
            String voucherRemarks, Date creationDate, Boolean activeStatus, String cdate, String transationRefNumber,Double voucherAmt, String voucherAmtType, 
            String makeRecurring, String drcrType) {
        this.voucherId = voucherId;
        this.invoiceId = invoiceId;
        this.ledgerNo = ledgerNo;
        this.typeOfVoucher = typeOfVoucher;
        this.voucherAccountStatus = voucherAccountStatus;
        this.voucherNarration = voucherNarration;
        this.voucherRemarks = voucherRemarks;
        this.creationDate = creationDate;
        this.activeStatus = activeStatus;
        this.cdate = cdate;
        this.transationRefNumber = transationRefNumber;
        this.voucherAmt = voucherAmt;
        this.voucherAmtType = voucherAmtType;
        this.makeRecurring = makeRecurring;
        this.drcrType = drcrType;
    }

    public VoucherMasterEntity(Integer voucherPk, String voucherId, String invoiceId, String ledgerNo, String typeOfVoucher, String voucherAccountStatus, 
            String voucherNarration, String voucherRemarks, Date creationDate, Boolean activeStatus, String cdate, String transationRefNumber, Double voucherAmt, 
            String voucherAmtType, String makeRecurring, String drcrType) {
        this.voucherPk = voucherPk;
        this.voucherId = voucherId;
        this.invoiceId = invoiceId;
        this.ledgerNo = ledgerNo;
        this.typeOfVoucher = typeOfVoucher;
        this.voucherAccountStatus = voucherAccountStatus;
        this.voucherNarration = voucherNarration;
        this.voucherRemarks = voucherRemarks;
        this.creationDate = creationDate;
        this.activeStatus = activeStatus;
        this.cdate = cdate;
        this.transationRefNumber = transationRefNumber;
        this.voucherAmt = voucherAmt;
        this.voucherAmtType = voucherAmtType;
        this.makeRecurring = makeRecurring;
        this.drcrType = drcrType;
    }

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="voucher_pk")
    public Integer getVoucherPk() {
        return voucherPk;
    }

    public void setVoucherPk(Integer voucherPk) {
        this.voucherPk = voucherPk;
    }

    @Column(name="voucher_id")
    public String getVoucherId() {
        return voucherId;
    }

    public void setVoucherId(String voucherId) {
        this.voucherId = voucherId;
    }

    @Column(name="invoice_id")
    public String getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(String invoiceId) {
        this.invoiceId = invoiceId;
    }

    @Column(name="ledger_no")
    public String getLedgerNo() {
        return ledgerNo;
    }

    public void setLedgerNo(String ledgerNo) {
        this.ledgerNo = ledgerNo;
    }

    @Column(name="type_of_voucher")
    public String getTypeOfVoucher() {
        return typeOfVoucher;
    }

    public void setTypeOfVoucher(String typeOfVoucher) {
        this.typeOfVoucher = typeOfVoucher;
    }

    @Column(name="voucher_account_status")
    public String getVoucherAccountStatus() {
        return voucherAccountStatus;
    }

    public void setVoucherAccountStatus(String voucherAccountStatus) {
        this.voucherAccountStatus = voucherAccountStatus;
    }

    @Column(name="voucher_narration")
    public String getVoucherNarration() {
        return voucherNarration;
    }

    public void setVoucherNarration(String voucherNarration) {
        this.voucherNarration = voucherNarration;
    }

    @Column(name="voucher_remarks")
    public String getVoucherRemarks() {
        return voucherRemarks;
    }

    public void setVoucherRemarks(String voucherRemarks) {
        this.voucherRemarks = voucherRemarks;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="creation_date")
    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    @Column(name="active_status")
    public Boolean getActiveStatus() {
        return activeStatus;
    }

    public void setActiveStatus(Boolean activeStatus) {
        this.activeStatus = activeStatus;
    }

    @Column(name="cdate")
    public String getCdate() {
        return cdate;
    }

    public void setCdate(String cdate) {
        this.cdate = cdate;
    }

    @Column(name="voucher_amt")
    public Double getVoucherAmt() {
        return voucherAmt;
    }

    public void setVoucherAmt(Double voucherAmt) {
        this.voucherAmt = voucherAmt;
    }

    @Column(name="voucher_amt_type")
    public String getVoucherAmtType() {
        return voucherAmtType;
    }

    public void setVoucherAmtType(String voucherAmtType) {
        this.voucherAmtType = voucherAmtType;
    }
    
    @Column(name="transation_ref_number")
    public String getTransationRefNumber() {
        return transationRefNumber;
    }

    public void setTransationRefNumber(String transationRefNumber) {
        this.transationRefNumber = transationRefNumber;
    }

    @Column(name="make_recurring")
    public String getMakeRecurring() {
        return makeRecurring;
    }

    public void setMakeRecurring(String makeRecurring) {
        this.makeRecurring = makeRecurring;
    }

    @Column(name="drcr_type")
    public String getDrcrType() {
        return drcrType;
    }

    public void setDrcrType(String drcrType) {
        this.drcrType = drcrType;
    }
    
}
