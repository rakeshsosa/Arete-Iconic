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
@Table(name = "tenant_services_grid", schema = "arete_tms") 
public class TenantServicesGrid implements java.io.Serializable{
    
    private Integer sNo;
    private String userId;
    private String propertyName;
    private String serviceName;
    private String fixedServiceCharges;
    private String serviceChargesInterval;
    private String serviceCharges;
    private String ServiceChargeMonthlyAmount;
    private String TotalMonthlyServiceCharge;
    private Date lastmodifiedDate;
    private Boolean status;

    public TenantServicesGrid() {
    }

    public TenantServicesGrid(String userId, String propertyName, String serviceName, String fixedServiceCharges, String serviceChargesInterval, String serviceCharges, String ServiceChargeMonthlyAmount, String TotalMonthlyServiceCharge, Date lastmodifiedDate, Boolean status) {
        this.userId = userId;
        this.propertyName = propertyName;
        this.serviceName = serviceName;
        this.fixedServiceCharges = fixedServiceCharges;
        this.serviceChargesInterval = serviceChargesInterval;
        this.serviceCharges = serviceCharges;
        this.ServiceChargeMonthlyAmount = ServiceChargeMonthlyAmount;
        this.TotalMonthlyServiceCharge = TotalMonthlyServiceCharge;
        this.lastmodifiedDate = lastmodifiedDate;
        this.status = status;
    }

    public TenantServicesGrid(Integer sNo, String userId, String propertyName, String serviceName, String fixedServiceCharges, String serviceChargesInterval, String serviceCharges, String ServiceChargeMonthlyAmount, String TotalMonthlyServiceCharge, Date lastmodifiedDate, Boolean status) {
        this.sNo = sNo;
        this.userId = userId;
        this.propertyName = propertyName;
        this.serviceName = serviceName;
        this.fixedServiceCharges = fixedServiceCharges;
        this.serviceChargesInterval = serviceChargesInterval;
        this.serviceCharges = serviceCharges;
        this.ServiceChargeMonthlyAmount = ServiceChargeMonthlyAmount;
        this.TotalMonthlyServiceCharge = TotalMonthlyServiceCharge;
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

    @Column(name = "property_name")
    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    @Column(name = "service_name")
    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    @Column(name = "fixed_serv_charges")
    public String getFixedServiceCharges() {
        return fixedServiceCharges;
    }

    public void setFixedServiceCharges(String fixedServiceCharges) {
        this.fixedServiceCharges = fixedServiceCharges;
    }

    @Column(name = "serv_charges_interval")
    public String getServiceChargesInterval() {
        return serviceChargesInterval;
    }

    public void setServiceChargesInterval(String serviceChargesInterval) {
        this.serviceChargesInterval = serviceChargesInterval;
    }

    @Column(name = "service_charges")
    public String getServiceCharges() {
        return serviceCharges;
    }

    public void setServiceCharges(String serviceCharges) {
        this.serviceCharges = serviceCharges;
    }

    @Column(name = "serv_charge_monthly_amount")
    public String getServiceChargeMonthlyAmount() {
        return ServiceChargeMonthlyAmount;
    }

    public void setServiceChargeMonthlyAmount(String ServiceChargeMonthlyAmount) {
        this.ServiceChargeMonthlyAmount = ServiceChargeMonthlyAmount;
    }

    @Column(name = "total_monthly_serv_charge")
    public String getTotalMonthlyServiceCharge() {
        return TotalMonthlyServiceCharge;
    }

    public void setTotalMonthlyServiceCharge(String TotalMonthlyServiceCharge) {
        this.TotalMonthlyServiceCharge = TotalMonthlyServiceCharge;
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
