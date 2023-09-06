/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.classes;

import java.util.Date;

public class LedgerMaster {
    
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
	private Date creationDate;
	private Boolean activeStatus;
        private String month;
        private String year;

    public LedgerMaster(String ledgerNo, String ledgerCode, String ledgerDescription, String ledgerGroup, String ledgerName, String bankAccountNo, double ledgerOpeningBalance, double ledgerClosingBalance, String ledgerReportGroup, String ledgerSubgroup) {
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
    }

    public LedgerMaster(Integer ledgerMasterPk, String ledgerNo, String ledgerCode, String ledgerDescription, String ledgerGroup, String ledgerName, String bankAccountNo, double ledgerOpeningBalance, double ledgerClosingBalance, String ledgerReportGroup, String ledgerSubgroup, Date creationDate, Boolean activeStatus) {
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
        this.creationDate = creationDate;
        this.activeStatus = activeStatus;
    }
        
    
}
