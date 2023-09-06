/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.classes;

import java.util.Date;

public class VoucherMaster {
    
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

    public VoucherMaster(String voucherId, String invoiceId, String ledgerNo, Double voucherAmt, String voucherAmtType, String typeOfVoucher, String voucherAccountStatus, String voucherNarration, String voucherRemarks) {
        this.voucherId = voucherId;
        this.invoiceId = invoiceId;
        this.ledgerNo = ledgerNo;
        this.voucherAmt = voucherAmt;
        this.voucherAmtType = voucherAmtType;
        this.typeOfVoucher = typeOfVoucher;
        this.voucherAccountStatus = voucherAccountStatus;
        this.voucherNarration = voucherNarration;
        this.voucherRemarks = voucherRemarks;
    }

    public VoucherMaster(String voucherId, String invoiceId, String ledgerNo, Double voucherAmt, String voucherAmtType, String typeOfVoucher, String voucherAccountStatus, String voucherNarration, String voucherRemarks, Date creationDate, Boolean activeStatus) {
        this.voucherId = voucherId;
        this.invoiceId = invoiceId;
        this.ledgerNo = ledgerNo;
        this.voucherAmt = voucherAmt;
        this.voucherAmtType = voucherAmtType;
        this.typeOfVoucher = typeOfVoucher;
        this.voucherAccountStatus = voucherAccountStatus;
        this.voucherNarration = voucherNarration;
        this.voucherRemarks = voucherRemarks;
        this.creationDate = creationDate;
        this.activeStatus = activeStatus;
    }
    
    
}
