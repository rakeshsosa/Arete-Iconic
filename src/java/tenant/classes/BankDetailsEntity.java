/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.classes;

import java.util.Date;

public class BankDetailsEntity {
    
    private Integer bankDetailsPk;
    private String mappingKey;
    private String bankName;
    private String branchName;
    private String bankAddress;
    private String ifscCode;
    private String accountNo;
    private Date creationDate;
    private Boolean activeStatus;

    public BankDetailsEntity(String mappingKey, String bankName, String branchName, String bankAddress, String ifscCode, String accountNo) {
        this.mappingKey = mappingKey;
        this.bankName = bankName;
        this.branchName = branchName;
        this.bankAddress = bankAddress;
        this.ifscCode = ifscCode;
        this.accountNo = accountNo;
    }

    public BankDetailsEntity(Integer bankDetailsPk, String mappingKey, String bankName, String branchName, String bankAddress, String ifscCode, String accountNo, Date creationDate, Boolean activeStatus) {
        this.bankDetailsPk = bankDetailsPk;
        this.mappingKey = mappingKey;
        this.bankName = bankName;
        this.branchName = branchName;
        this.bankAddress = bankAddress;
        this.ifscCode = ifscCode;
        this.accountNo = accountNo;
        this.creationDate = creationDate;
        this.activeStatus = activeStatus;
    }
    
    
}
