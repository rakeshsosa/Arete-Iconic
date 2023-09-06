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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author ramalingaiahd
 */
@Entity
@Table(name = "amc_jobs", schema = "arete_tms")

public class AMCJobs implements java.io.Serializable {

    private Integer SNo;
    private String amcType;
    private String propertyName;
    private String unit;
    private String invoiceNo;
    private String vendor;
    private String cost;
    private String assignedTo;
    private String priority;
    private Date dueDate;
    private String status;
    private String orgId;
    private String userId;
    private String workDescription;
    private String contactPerson;
    private String amsStatus;
    private Date nextAmcDate;
    private Date lastmodifiedDate;

    

    public AMCJobs() {

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

    @Column(name = "amc_type", length = 60)
    public String getAmcType() {
        return amcType;
    }

    public void setAmcType(String amcType) {
        this.amcType = amcType;
    }

    @Column(name = "property_name", length = 60)
    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    @Column(name = "unit", length = 60)
    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

//    @Column(name = "schedule", length = 60)
//    public String getSchedule() {
//        return schedule;
//    }
//
//    public void setSchedule(String schedule) {
//        this.schedule = schedule;
//    }
    @Column(name = "invoice_No", length = 60)
    public String getInvoiceNo() {
        return invoiceNo;
    }

    public void setInvoiceNo(String invoiceNo) {
        this.invoiceNo = invoiceNo;
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

    @Column(name = "assigned_to", length = 60)
    public String getAssignedTo() {
        return assignedTo;
    }

    public void setAssignedTo(String assignedTo) {
        this.assignedTo = assignedTo;
    }

    @Column(name = "priority", length = 60)
    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "due_date", length = 60)
    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    @Column(name = "status", length = 60)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

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

    @Column(name = "work_description", length = 60)
    public String getWorkDescription() {
        return workDescription;
    }

    public void setWorkDescription(String workDescription) {
        this.workDescription = workDescription;
    }

    @Column(name = "contact_Person", length = 60)
    public String getContactPerson() {
        return contactPerson;
    }

    public void setContactPerson(String contactPerson) {
        this.contactPerson = contactPerson;
    }

    @Column(name = "ams_status", length = 60)
    public String getAmsStatus() {
        return amsStatus;
    }

    public void setAmsStatus(String amsStatus) {
        this.amsStatus = amsStatus;
    }
    
    @Temporal(TemporalType.DATE)
    @Column(name = "next_AMC_date", length = 60)
    public Date getNextAmcDate() {
        return nextAmcDate;
    }

    public void setNextAmcDate(Date nextAmcDate) {
        this.nextAmcDate = nextAmcDate;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "lastmodified_date", length = 19)
    public Date getLastmodifiedDate() {
        return lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public AMCJobs(Integer SNo, String amcType, String propertyName, String unit, String invoiceNo, String vendor, String cost, String assignedTo, String priority, Date dueDate, String status, String orgId, String userId, String workDescription, String contactPerson, String amsStatus,Date nextAmcDate, Date lastmodifiedDate) {
        this.SNo = SNo;
        this.amcType = amcType;
        this.propertyName = propertyName;
        this.unit = unit;
        this.invoiceNo = invoiceNo;
        this.vendor = vendor;
        this.cost = cost;
        this.assignedTo = assignedTo;
        this.priority = priority;
        this.dueDate = dueDate;
        this.status = status;
        this.orgId = orgId;
        this.userId = userId;
        this.workDescription = workDescription;
        this.contactPerson = contactPerson;
        this.amsStatus = amsStatus;
        this.nextAmcDate = nextAmcDate;
        this.lastmodifiedDate = lastmodifiedDate;
        
        
    }

    public AMCJobs(String amcType, String propertyName, String unit, String invoiceNo, String vendor, String cost, String assignedTo, String priority, Date dueDate, String status, String orgId, String userId, String workDescription, String contactPerson, String amsStatus,Date nextAmcDate, Date lastmodifiedDate) {
        this.amcType = amcType;
        this.propertyName = propertyName;
        this.unit = unit;
        this.invoiceNo = invoiceNo;
        this.vendor = vendor;
        this.cost = cost;
        this.assignedTo = assignedTo;
        this.priority = priority;
        this.dueDate = dueDate;
        this.status = status;
        this.orgId = orgId;
        this.userId = userId;
        this.workDescription = workDescription;
        this.contactPerson = contactPerson;
        this.amsStatus = amsStatus;
        this.nextAmcDate = nextAmcDate;
        this.lastmodifiedDate = lastmodifiedDate;
    }

}
