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
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author admin
 */
@Entity
@Table(name = "com_utility", schema = "arete_tms"
)   
public class ComUtility implements java.io.Serializable{
    private Integer SNo;
    private String userId;
    
    private String propertyName;
    private String totalUnits;
    private String billNumber;
    private String billType;
    private String utilityName;
    private Date billingStartDate;
    private Date billingEndDate;
    private String consumptionComArea;
    private String consumptionOthers;
    private String consumptionperTenant;
    private String fixChargeShare;
    private String totalPayTenant;
    
    private Date lastmodifiedDate;
    private Boolean status;

    public ComUtility() {
    }

    public ComUtility(String userId, String propertyName, String totalUnits, String billNumber, String billType, String utilityName, Date billingStartDate, Date billingEndDate, String consumptionComArea, String consumptionOthers, String consumptionperTenant, String fixChargeShare,String totalPayTenant, Date lastmodifiedDate, Boolean status) {
        this.userId = userId;
        this.propertyName = propertyName;
        this.totalUnits = totalUnits;
        this.billNumber = billNumber;
        this.billType = billType;
        this.utilityName = utilityName;
        this.billingStartDate = billingStartDate;
        this.billingEndDate = billingEndDate;
        this.consumptionComArea = consumptionComArea;
        this.consumptionOthers = consumptionOthers;
        this.consumptionperTenant = consumptionperTenant;
        this.fixChargeShare = fixChargeShare;
        this.totalPayTenant = totalPayTenant;
        this.lastmodifiedDate = lastmodifiedDate;
        this.status = status;
    }

    public ComUtility(Integer SNo, String userId, String propertyName, String totalUnits, String billNumber, String billType, String utilityName, Date billingStartDate, Date billingEndDate, String consumptionComArea, String consumptionOthers, String consumptionperTenant, String fixChargeShare, String totalPayTenant,Date lastmodifiedDate, Boolean status) {
        this.SNo = SNo;
        this.userId = userId;
        this.propertyName = propertyName;
        this.totalUnits = totalUnits;
        this.billNumber = billNumber;
        this.billType = billType;
        this.utilityName = utilityName;
        this.billingStartDate = billingStartDate;
        this.billingEndDate = billingEndDate;
        this.consumptionComArea = consumptionComArea;
        this.consumptionOthers = consumptionOthers;
        this.consumptionperTenant = consumptionperTenant;
        this.fixChargeShare = fixChargeShare;
        this.totalPayTenant = totalPayTenant;
        this.lastmodifiedDate = lastmodifiedDate;
        this.status = status;
    }

    
    
    @Id
    @GeneratedValue(strategy = IDENTITY)

    @Column(name = "s_no")
    public Integer getSNo() {
        return SNo;
    }

    public void setSNo(Integer SNo) {
        this.SNo = SNo;
    }
    @Column(name = "last_modified_date")
    public Date getLastmodifiedDate() {
        return lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }
   
    @Column(name = "property_name")
    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }
    @Column(name = "total_units")
    public String getTotalUnits() {
        return totalUnits;
    }
    
    public void setTotalUnits(String totalUnits) {
        this.totalUnits = totalUnits;
    }
    @Column(name = "bill_number")
    public String getBillNumber() {
        return billNumber;
    }

    public void setBillNumber(String billNumber) {
        this.billNumber = billNumber;
    }
    @Column(name = "utility_name")
    public String getUtilityName() {
        return utilityName;
    }

    public void setUtilityName(String utilityName) {
        this.utilityName = utilityName;
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
    @Column(name = "cons_com_area")
    public String getConsumptionComArea() {
        return consumptionComArea;
    }

    public void setConsumptionComArea(String consumptionComArea) {
        this.consumptionComArea = consumptionComArea;
    }
    @Column(name = "cons_others")
    public String getConsumptionOthers() {
        return consumptionOthers;
    }

    public void setConsumptionOthers(String consumptionOthers) {
        this.consumptionOthers = consumptionOthers;
    }
    @Column(name = "cons_per_tenant")
    public String getConsumptionperTenant() {
        return consumptionperTenant;
    }

    public void setConsumptionperTenant(String consumptionperTenant) {
        this.consumptionperTenant = consumptionperTenant;
    }
    @Column(name = "fix_charge_share")
    public String getFixChargeShare() {
        return fixChargeShare;
    }

    public void setFixChargeShare(String fixChargeShare) {
        this.fixChargeShare = fixChargeShare;
    }
    @Column(name = "user_id")
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
    @Column(name = "bill_type")
    public String getBillType() {
        return billType;
    }

    public void setBillType(String billType) {
        this.billType = billType;
    }
    @Column(name = "status")
    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }
    @Column(name = "total_pay_tenant")
    public String getTotalPayTenant() {
        return totalPayTenant;
    }

    public void setTotalPayTenant(String totalPayTenant) {
        this.totalPayTenant = totalPayTenant;
    }
    
    
}
