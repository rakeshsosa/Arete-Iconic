/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.classes;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Lakshmi
 */
@Entity
@Table(name = "Booking_Ten_Util_Details", schema="arete_tms") 
public class BookingTenantUtilityDetails implements Serializable {

    private Integer SNo;
    private String assetCode;
    private String assetName;
    private String tenantCode;
    
    private String utility;
//    private String utilityBill;
//    private String comUtility;
//    private String comutilityBill;
//    private String utilityBillType;
//    private String comUtilityBillType;
//    private String totUtiAmount;
//    private String totComUtiAmount;
    
    private String utiltyNumbers;
    private String unitsNumbers;
    private String utilityindividual;
    private String utilityCodeindividual;
    private String utilityCategoryindividual;
    
    private String utilityCategory;
    private String utilityCode;
    private String utiltyNumbers1;
    private String unitsNumbers1;
    
    
    private Date lastmodifiedDate;
    private Boolean status;

    public BookingTenantUtilityDetails() {
    }
    
    public BookingTenantUtilityDetails(String assetCode, String assetName, String tenantCode, String utility, String utiltyNumbers, String unitsNumbers, String utilityindividual, String utilityCodeindividual, String utilityCategoryindividual, String utilityCategory, String utilityCode, String utiltyNumbers1, String unitsNumbers1, Date lastmodifiedDate, Boolean status) {
        this.assetCode = assetCode;
        this.assetName = assetName;
        this.tenantCode = tenantCode;
        this.utility = utility;
        this.utiltyNumbers = utiltyNumbers;
        this.unitsNumbers = unitsNumbers;
        this.utilityindividual = utilityindividual;
        this.utilityCodeindividual = utilityCodeindividual;
        this.utilityCategoryindividual = utilityCategoryindividual;
        this.utilityCategory = utilityCategory;
        this.utilityCode = utilityCode;
        this.utiltyNumbers1 = utiltyNumbers1;
        this.unitsNumbers1 = unitsNumbers1;
        this.lastmodifiedDate = lastmodifiedDate;
        this.status = status;
    }

    public BookingTenantUtilityDetails(Integer SNo, String assetCode, String assetName, String tenantCode, String utility, String utiltyNumbers, String unitsNumbers, String utilityindividual, String utilityCodeindividual, String utilityCategoryindividual, String utilityCategory, String utilityCode, String utiltyNumbers1, String unitsNumbers1, Date lastmodifiedDate, Boolean status) {
        this.SNo = SNo;
        this.assetCode = assetCode;
        this.assetName = assetName;
        this.tenantCode = tenantCode;
        this.utility = utility;
        this.utiltyNumbers = utiltyNumbers;
        this.unitsNumbers = unitsNumbers;
        this.utilityindividual = utilityindividual;
        this.utilityCodeindividual = utilityCodeindividual;
        this.utilityCategoryindividual = utilityCategoryindividual;
        this.utilityCategory = utilityCategory;
        this.utilityCode = utilityCode;
        this.utiltyNumbers1 = utiltyNumbers1;
        this.unitsNumbers1 = unitsNumbers1;
        this.lastmodifiedDate = lastmodifiedDate;
        this.status = status;
    }

     @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "s_no")
    public Integer getSNo() {
        return SNo;
    }

    public void setSNo(Integer SNo) {
        this.SNo = SNo;
    }

    @Column(name = "asset_code")
    public String getAssetCode() {
        return assetCode;
    }

    public void setAssetCode(String assetCode) {
        this.assetCode = assetCode;
    }

    @Column(name = "asset_name")
    public String getAssetName() {
        return assetName;
    }

    public void setAssetName(String assetName) {
        this.assetName = assetName;
    }

    @Column(name = "tenant_code")
    public String getTenantCode() {
        return tenantCode;
    }

    public void setTenantCode(String tenantCode) {
        this.tenantCode = tenantCode;
    }

    @Column(name = "utility")
    public String getUtility() {
        return utility;
    }

    public void setUtility(String utility) {
        this.utility = utility;
    }

    @Column(name = "individual_utility_number")
    public String getUtiltyNumbers() {
        return utiltyNumbers;
    }

    public void setUtiltyNumbers(String utiltyNumbers) {
        this.utiltyNumbers = utiltyNumbers;
    }

    @Column(name = "individual_unit_number")
    public String getUnitsNumbers() {
        return unitsNumbers;
    }

    public void setUnitsNumbers(String unitsNumbers) {
        this.unitsNumbers = unitsNumbers;
    }

    @Column(name = "utility_individual")
    public String getUtilityindividual() {
        return utilityindividual;
    }

    public void setUtilityindividual(String utilityindividual) {
        this.utilityindividual = utilityindividual;
    }

    @Column(name = "individual_utility_code")
    public String getUtilityCodeindividual() {
        return utilityCodeindividual;
    }

    public void setUtilityCodeindividual(String utilityCodeindividual) {
        this.utilityCodeindividual = utilityCodeindividual;
    }

    @Column(name = "individual_utility_category")
    public String getUtilityCategoryindividual() {
        return utilityCategoryindividual;
    }

    public void setUtilityCategoryindividual(String utilityCategoryindividual) {
        this.utilityCategoryindividual = utilityCategoryindividual;
    }

    @Column(name = "common_utility_category")
    public String getUtilityCategory() {
        return utilityCategory;
    }

    public void setUtilityCategory(String utilityCategory) {
        this.utilityCategory = utilityCategory;
    }

    @Column(name = "common_utility_code")
    public String getUtilityCode() {
        return utilityCode;
    }

    public void setUtilityCode(String utilityCode) {
        this.utilityCode = utilityCode;
    }

    @Column(name = "common_utility_number1")
    public String getUtiltyNumbers1() {
        return utiltyNumbers1;
    }

    public void setUtiltyNumbers1(String utiltyNumbers1) {
        this.utiltyNumbers1 = utiltyNumbers1;
    }

    @Column(name = "common_utility_unit_number1")
    public String getUnitsNumbers1() {
        return unitsNumbers1;
    }

    public void setUnitsNumbers1(String unitsNumbers1) {
        this.unitsNumbers1 = unitsNumbers1;
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
