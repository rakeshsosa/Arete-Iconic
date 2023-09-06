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
@Table(name = "tenant_services", schema = "arete_tms") 
public class TenantServices implements java.io.Serializable{
    
    private Integer sNo;
    private String userId;
    private String propertyName;
    private String unitNameNo;
    private String tenantName;
    private String noOfServices;
    private String totalMonthlyCharges;
    private Date lastmodifiedDate;
    private Boolean status;

    public TenantServices() {
    }

    public TenantServices(String userId, String propertyName, String unitNameNo, String tenantName, String noOfServices, String totalMonthlyCharges, Date lastmodifiedDate, Boolean status) {
        this.userId = userId;
        this.propertyName = propertyName;
        this.unitNameNo = unitNameNo;
        this.tenantName = tenantName;
        this.noOfServices = noOfServices;
        this.totalMonthlyCharges = totalMonthlyCharges;
        this.lastmodifiedDate = lastmodifiedDate;
        this.status = status;
    }

    public TenantServices(Integer sNo, String userId, String propertyName, String unitNameNo, String tenantName, String noOfServices, String totalMonthlyCharges, Date lastmodifiedDate, Boolean status) {
        this.sNo = sNo;
        this.userId = userId;
        this.propertyName = propertyName;
        this.unitNameNo = unitNameNo;
        this.tenantName = tenantName;
        this.noOfServices = noOfServices;
        this.totalMonthlyCharges = totalMonthlyCharges;
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

    @Column(name = "unit_name_no")
    public String getUnitNameNo() {
        return unitNameNo;
    }

    public void setUnitNameNo(String unitNameNo) {
        this.unitNameNo = unitNameNo;
    }

    @Column(name = "tenant_name")
    public String getTenantName() {
        return tenantName;
    }

    public void setTenantName(String tenantName) {
        this.tenantName = tenantName;
    }

    @Column(name = "no_of_services")
    public String getNoOfServices() {
        return noOfServices;
    }

    public void setNoOfServices(String noOfServices) {
        this.noOfServices = noOfServices;
    }

    @Column(name = "total_monthly_charges")
    public String getTotalMonthlyCharges() {
        return totalMonthlyCharges;
    }

    public void setTotalMonthlyCharges(String totalMonthlyCharges) {
        this.totalMonthlyCharges = totalMonthlyCharges;
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
