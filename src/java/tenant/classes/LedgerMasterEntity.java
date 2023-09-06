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
@Table(name = "ledger_master", schema = "arete_tms")
public class LedgerMasterEntity {
    
    private Integer ledgerMasterPk;
    private String ledgerNo;
    private String ledgerCode;
    private String ledgerDescription;
    private String ledgerGroup;
    private String ledgerName;
    private String bankAccountNo;
    private double ledgerOpeningBalance;
    private double ledgerClosingBalance;
    private String ledgerReportGroup;
    private String ledgerSubgroup;
    private String bankAccountName;
    private String shop;
    private String costCenter;
    private Date creationDate;
    private String cdate;
    private Boolean activeStatus;
    private String month;
    private String year;

    public LedgerMasterEntity() {
    }

    public LedgerMasterEntity(String ledgerNo, String ledgerCode, String ledgerDescription, String ledgerGroup, String ledgerName, String bankAccountNo, 
            double ledgerOpeningBalance, double ledgerClosingBalance, String ledgerReportGroup, String ledgerSubgroup, String bankAccountName, String shop, 
            String costCenter, Date creationDate, String cdate, Boolean activeStatus, String month, String year) {
        this.ledgerNo = ledgerNo;
        this.ledgerCode = ledgerCode;
        this.ledgerDescription = ledgerDescription;
        this.ledgerGroup = ledgerGroup;
        this.ledgerName = ledgerName;
        this.bankAccountNo = bankAccountNo;
        this.ledgerOpeningBalance = ledgerOpeningBalance;
        this.ledgerClosingBalance = ledgerClosingBalance;
        this.ledgerReportGroup = ledgerReportGroup;
        this.ledgerSubgroup = ledgerSubgroup;
        this.bankAccountName = bankAccountName;
        this.shop = shop;
        this.costCenter = costCenter;
        this.creationDate = creationDate;
        this.cdate = cdate;
        this.activeStatus = activeStatus;
        this.month = month;
        this.year = year;
    }

    public LedgerMasterEntity(Integer ledgerMasterPk, String ledgerNo, String ledgerCode, String ledgerDescription, String ledgerGroup, String ledgerName, 
            String bankAccountNo, double ledgerOpeningBalance, double ledgerClosingBalance, String ledgerReportGroup, String ledgerSubgroup, String bankAccountName, 
            String shop, String costCenter, Date creationDate, String cdate, Boolean activeStatus, String month, String year) {
        this.ledgerMasterPk = ledgerMasterPk;
        this.ledgerNo = ledgerNo;
        this.ledgerCode = ledgerCode;
        this.ledgerDescription = ledgerDescription;
        this.ledgerGroup = ledgerGroup;
        this.ledgerName = ledgerName;
        this.bankAccountNo = bankAccountNo;
        this.ledgerOpeningBalance = ledgerOpeningBalance;
        this.ledgerClosingBalance = ledgerClosingBalance;
        this.ledgerReportGroup = ledgerReportGroup;
        this.ledgerSubgroup = ledgerSubgroup;
        this.bankAccountName = bankAccountName;
        this.shop = shop;
        this.costCenter = costCenter;
        this.creationDate = creationDate;
        this.cdate = cdate;
        this.activeStatus = activeStatus;
        this.month = month;
        this.year = year;
    }

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="ledger_master_pk")
    public Integer getLedgerMasterPk() {
        return ledgerMasterPk;
    }

    public void setLedgerMasterPk(Integer ledgerMasterPk) {
        this.ledgerMasterPk = ledgerMasterPk;
    }

    @Column(name="ledger_no")
    public String getLedgerNo() {
        return ledgerNo;
    }

    public void setLedgerNo(String ledgerNo) {
        this.ledgerNo = ledgerNo;
    }

    @Column(name="ledger_code")
    public String getLedgerCode() {
        return ledgerCode;
    }

    public void setLedgerCode(String ledgerCode) {
        this.ledgerCode = ledgerCode;
    }

    @Column(name="ledger_description")
    public String getLedgerDescription() {
        return ledgerDescription;
    }

    public void setLedgerDescription(String ledgerDescription) {
        this.ledgerDescription = ledgerDescription;
    }

    @Column(name="ledger_group")
    public String getLedgerGroup() {
        return ledgerGroup;
    }

    public void setLedgerGroup(String ledgerGroup) {
        this.ledgerGroup = ledgerGroup;
    }

    @Column(name="ledger_name")
    public String getLedgerName() {
        return ledgerName;
    }

    public void setLedgerName(String ledgerName) {
        this.ledgerName = ledgerName;
    }

    @Column(name="bank_account_no")
    public String getBankAccountNo() {
        return bankAccountNo;
    }

    public void setBankAccountNo(String bankAccountNo) {
        this.bankAccountNo = bankAccountNo;
    }

    @Column(name="ledger_opening_balance")
    public double getLedgerOpeningBalance() {
        return ledgerOpeningBalance;
    }

    public void setLedgerOpeningBalance(double ledgerOpeningBalance) {
        this.ledgerOpeningBalance = ledgerOpeningBalance;
    }

    @Column(name="ledger_report_group")
    public String getLedgerReportGroup() {
        return ledgerReportGroup;
    }

    public void setLedgerReportGroup(String ledgerReportGroup) {
        this.ledgerReportGroup = ledgerReportGroup;
    }

    @Column(name="ledger_subgroup")
    public String getLedgerSubgroup() {
        return ledgerSubgroup;
    }

    public void setLedgerSubgroup(String ledgerSubgroup) {
        this.ledgerSubgroup = ledgerSubgroup;
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

    @Column(name = "bank_account_name")
    public String getBankAccountName() {
        return bankAccountName;
    }

    public void setBankAccountName(String bankAccountName) {
        this.bankAccountName = bankAccountName;
    }

    @Column(name = "shop")
    public String getShop() {
        return shop;
    }

    public void setShop(String shop) {
        this.shop = shop;
    }

    @Column(name = "cost_center")
    public String getCostCenter() {
        return costCenter;
    }

    public void setCostCenter(String costCenter) {
        this.costCenter = costCenter;
    }

    @Column(name = "cdate")
    public String getCdate() {
        return cdate;
    }

    public void setCdate(String cdate) {
        this.cdate = cdate;
    }

    @Column(name="ledger_closing_balance")
    public double getLedgerClosingBalance() {
        return ledgerClosingBalance;
    }

    public void setLedgerClosingBalance(double ledgerClosingBalance) {
        this.ledgerClosingBalance = ledgerClosingBalance;
    }

    @Column(name="cal_month")
    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    @Column(name="cal_year")
    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }
    
}
