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
@Table(name = "individual_utility_management", schema = "arete_tms")    
public class IndividualUtilityManagement implements java.io.Serializable{
    
    private Integer sNo;
    private String userId;
    private String propertyName;
    private String unitNumber;
    private String tenantName;
    private String utilityBillNumber;
    private String utilityType;
    private Date billingStartDate;
    private Date billingEndDate;
    private String fixChargeShare;
    private String additionalCharges;
    private String totalBillConsuption;
    private Date lastmodifiedDate;
    private Boolean status;
    private String updateStatus;

    public IndividualUtilityManagement() {
    }

    public IndividualUtilityManagement(String userId, String propertyName, String unitNumber, String tenantName, String utilityBillNumber, String utilityType, Date billingStartDate, Date billingEndDate, String fixChargeShare, String additionalCharges, String totalBillConsuption, Date lastmodifiedDate, Boolean status, String updateStatus) {
        this.userId = userId;
        this.propertyName = propertyName;
        this.unitNumber = unitNumber;
        this.tenantName = tenantName;
        this.utilityBillNumber = utilityBillNumber;
        this.utilityType = utilityType;
        this.billingStartDate = billingStartDate;
        this.billingEndDate = billingEndDate;
        this.fixChargeShare = fixChargeShare;
        this.additionalCharges = additionalCharges;
        this.totalBillConsuption = totalBillConsuption;
        this.lastmodifiedDate = lastmodifiedDate;
        this.status = status;
        this.updateStatus = updateStatus;
    }

    public IndividualUtilityManagement(Integer sNo, String userId, String propertyName, String unitNumber, String tenantName, String utilityBillNumber, String utilityType, Date billingStartDate, Date billingEndDate, String fixChargeShare, String additionalCharges, String totalBillConsuption, Date lastmodifiedDate, Boolean status, String updateStatus) {
        this.sNo = sNo;
        this.userId = userId;
        this.propertyName = propertyName;
        this.unitNumber = unitNumber;
        this.tenantName = tenantName;
        this.utilityBillNumber = utilityBillNumber;
        this.utilityType = utilityType;
        this.billingStartDate = billingStartDate;
        this.billingEndDate = billingEndDate;
        this.fixChargeShare = fixChargeShare;
        this.additionalCharges = additionalCharges;
        this.totalBillConsuption = totalBillConsuption;
        this.lastmodifiedDate = lastmodifiedDate;
        this.status = status;
        this.updateStatus = updateStatus;
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

    @Column(name = "property_name")
    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    @Column(name = "unit_number")
    public String getUnitNumber() {
        return unitNumber;
    }

    public void setUnitNumber(String unitNumber) {
        this.unitNumber = unitNumber;
    }

    @Column(name = "tenant_name")
    public String getTenantName() {
        return tenantName;
    }

    public void setTenantName(String tenantName) {
        this.tenantName = tenantName;
    }

    @Column(name = "utility_bill_number")
    public String getUtilityBillNumber() {
        return utilityBillNumber;
    }

    public void setUtilityBillNumber(String utilityBillNumber) {
        this.utilityBillNumber = utilityBillNumber;
    }

    @Column(name = "utility_type")
    public String getUtilityType() {
        return utilityType;
    }

    public void setUtilityType(String utilityType) {
        this.utilityType = utilityType;
    }

    @Column(name = "billing_start_date")
    public Date getBillingStartDate() {
        return billingStartDate;
    }

    public void setBillingStartDate(Date billingStartDate) {
        this.billingStartDate = billingStartDate;
    }

    @Column(name = "billing_end_date")
    public Date getBillingEndDate() {
        return billingEndDate;
    }

    public void setBillingEndDate(Date billingEndDate) {
        this.billingEndDate = billingEndDate;
    }

    @Column(name = "fix_charges_share")
    public String getFixChargeShare() {
        return fixChargeShare;
    }

    public void setFixChargeShare(String fixChargeShare) {
        this.fixChargeShare = fixChargeShare;
    }

    @Column(name = "additional_charges")
    public String getAdditionalCharges() {
        return additionalCharges;
    }

    public void setAdditionalCharges(String additionalCharges) {
        this.additionalCharges = additionalCharges;
    }

    @Column(name = "total_bill_consuption")
    public String getTotalBillConsuption() {
        return totalBillConsuption;
    }

    public void setTotalBillConsuption(String totalBillConsuption) {
        this.totalBillConsuption = totalBillConsuption;
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

    @Column(name = "update_status")
    public String getUpdateStatus() {
        return updateStatus;
    }

    public void setUpdateStatus(String updateStatus) {
        this.updateStatus = updateStatus;
    }
    
    
    
}
