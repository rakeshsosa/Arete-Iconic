/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.classes;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author ramalingaiahd
 */
@Entity
@Table(name = "amc_type", schema = "arete_tms"
)
public class AMCType implements java.io.Serializable { 

    private Integer SNo;
    private String amcType;
    private String schedule;
    private String vendor;
    private String cost;
    private String amcDescription;

    private String status;
    // private Date lastmodifiedDate;
    private String orgId;
    private String userId;
    private String annualCost;

    public AMCType() {
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "s_no", unique = true, nullable = false)
    public Integer getSNo() {
        return SNo;
    }

    public void setSNo(Integer SNo) {
        this.SNo = SNo;
    }

    @Column(name = "amc_Type", length = 60)
    public String getAmcType() {
        return amcType;
    }

    public void setAmcType(String amcType) {
        this.amcType = amcType;
    }

    @Column(name = "schedule", length = 60)
    public String getSchedule() {
        return schedule;
    }

    public void setSchedule(String schedule) {
        this.schedule = schedule;
    }

    @Column(name = "vendor", length = 60)
    public String getVendor() {
        return vendor;
    }

    public void setVendor(String vendor) {
        this.vendor = vendor;
    }

    @Column(name = "cost", length = 60)
    public String getCost() {
        return cost;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }

    @Column(name = "amc_descriptin", length = 60)
    public String getAmcDescription() {
        return amcDescription;
    }

    public void setAmcDescription(String amcDescription) {
        this.amcDescription = amcDescription;
    }

    @Column(name = "status", length = 60)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
    
//@Column(name = "last_modifiedDate", length = 60)
//    public Date getLastmodifiedDate() {
//        return lastmodifiedDate;
//    }
//
//    public void setLastmodifiedDate(Date lastmodifiedDate) {
//        this.lastmodifiedDate = lastmodifiedDate;
//    }

    @Column(name = "org_id", length = 60)
    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name = "user_id", length = 60)
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

     @Column(name = "annual_Cost", length = 60)
    public String getAnnualCost() {
        return annualCost;
    }

    public void setAnnualCost(String annualCost) {
        this.annualCost = annualCost;
    }
    
    

    public AMCType(String amcType, String schedule, String vendor, String cost, String amcDescription, String status, String orgId, String userId,String annualCost) {
        //this.SNo = SNo;
        this.amcType = amcType;
        this.schedule = schedule;
        this.vendor = vendor;
        this.cost = cost;
        this.amcDescription = amcDescription;
        this.status = status;
        //  this.lastmodifiedDate = lastmodifiedDate;
        this.orgId = orgId;
        this.userId = userId;
        this.annualCost=annualCost;
    }

    public AMCType(Integer SNo, String amcType, String schedule, String vendor, String cost, String amcDescription, String status, String orgId, String userId ,String annualCost) {
        this.SNo = SNo;
        this.amcType = amcType;
        this.schedule = schedule;
        this.vendor = vendor;
        this.cost = cost;
        this.amcDescription = amcDescription;
        this.status = status;
        //this.lastmodifiedDate = lastmodifiedDate;
        this.orgId = orgId;
        this.userId = userId;
        this.annualCost=annualCost;
    }

}
