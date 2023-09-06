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
 * @author vaijayanti
 */
@Entity
@Table(name = "expence_tracking_grid", schema = "arete_tms") 
public class ExpenceTrackingGrid implements java.io.Serializable{
    
    private Integer sNo;
    private String userId;
    private String property;
    private String incomeType;
    private String vendor;
    private String paymentType;
    private String amount;
    private String totalPayble;
    private Date lastmodifiedDate;
    private Boolean status;

    public ExpenceTrackingGrid() {
    }

    public ExpenceTrackingGrid(String userId, String property, String incomeType, String vendor, String paymentType,String amount, String totalPayble, Date lastmodifiedDate, Boolean status) {
        this.userId = userId;
        this.property = property;
        this.incomeType = incomeType;
        this.vendor = vendor;
        this.paymentType = paymentType;
        this.amount = amount;
        this.totalPayble = totalPayble;
        this.lastmodifiedDate = lastmodifiedDate;
        this.status = status;
    }

    public ExpenceTrackingGrid(Integer sNo, String userId, String property, String incomeType, String vendor, String paymentType,String amount, String totalPayble, Date lastmodifiedDate, Boolean status) {
        this.sNo = sNo;
        this.userId = userId;
        this.property = property;
        this.incomeType = incomeType;
        this.vendor = vendor;
        this.paymentType = paymentType;
        this.amount = amount;
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

     @Column(name = "vendor")
    public String getVendor() {
        return vendor;
    }

    public void setVendor(String vendor) {
        this.vendor = vendor;
    }

    @Column(name = "payment_type")
    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    @Column(name = "amount")
    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
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
