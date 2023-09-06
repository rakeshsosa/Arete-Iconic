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
@Table(name = "income_tracking_grid", schema = "arete_tms")
public class IncomeTrackingGrid implements java.io.Serializable{
    
    private Integer sNo;
    private String userId;
    private String property;
    private String incomeType;
    private String customerName;
    private String propertyName;
    private String totalPayble;
    private Date lastmodifiedDate;
    private Boolean status;

    public IncomeTrackingGrid() {
    }

    public IncomeTrackingGrid(String userId, String property, String incomeType, String customerName, String propertyName, String totalPayble, Date lastmodifiedDate, Boolean status) {
        this.userId = userId;
        this.property = property;
        this.incomeType = incomeType;
        this.customerName = customerName;
        this.propertyName = propertyName;
        this.totalPayble = totalPayble;
        this.lastmodifiedDate = lastmodifiedDate;
        this.status = status;
    }

    public IncomeTrackingGrid(Integer sNo, String userId, String property, String incomeType, String customerName, String propertyName, String totalPayble, Date lastmodifiedDate, Boolean status) {
        this.sNo = sNo;
        this.userId = userId;
        this.property = property;
        this.incomeType = incomeType;
        this.customerName = customerName;
        this.propertyName = propertyName;
        this.totalPayble = totalPayble;
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

    @Column(name = "property")
    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property;
    }

    @Column(name = "income_type")
    public String getIncomeType() {
        return incomeType;
    }

    public void setIncomeType(String incomeType) {
        this.incomeType = incomeType;
    }

    @Column(name = "customer_name")
    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    @Column(name = "property_name")
    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    @Column(name = "total_payble")
    public String getTotalPayble() {
        return totalPayble;
    }

    public void setTotalPayble(String totalPayble) {
        this.totalPayble = totalPayble;
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
