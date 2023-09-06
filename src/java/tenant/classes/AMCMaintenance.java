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
@Table(name = "amc_maintenance", schema = "arete_tms") 
public class AMCMaintenance implements java.io.Serializable { 

    private Integer SNo;
    
    private String assetCode;
    
    
    private String propertyName;
    
    private String amcId;
    
    
    private String amcType;
    
    private String serviceArea;
    private String unitNo;
    private String utilityArea;
    private String chooseUnit;
    private String serviceName;
    private String serviceDesc;
    private String schedule;
    private Date dueDate;
    private Date amcDate;
    private String priority;
    private String responsibility;
    private String approvedCost;
    private String cost;
    private String contactPerson;
    private String amsStatus;
    private String docAttachment;
    
    private String unit;
    
    private String vendor;
    
    private String assignedTo;
    
    
    private String status;
    private Date lastmodifiedDate;
    private String orgId;
    private String userId;
    private String workDescription;
    
    
    private String qiFeedBack;

    public AMCMaintenance() {

    }

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
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

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "lastmodified_date", length = 19)
    public Date getLastmodifiedDate() {
        return lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
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
    
    @Column(name = "qi_feedback", length = 60)
    public String getQiFeedBack() {
        return qiFeedBack;
    }

    public void setQiFeedBack(String qiFeedBack) {
        this.qiFeedBack = qiFeedBack;
    }

    @Column(name = "asset_code")
    public String getAssetCode() {
        return assetCode;
    }

    public void setAssetCode(String assetCode) {
        this.assetCode = assetCode;
    }

    @Column(name = "amc_id")
    public String getAmcId() {
        return amcId;
    }

    public void setAmcId(String amcId) {
        this.amcId = amcId;
    }

    @Column(name = "service_area")
    public String getServiceArea() {
        return serviceArea;
    }

    public void setServiceArea(String serviceArea) {
        this.serviceArea = serviceArea;
    }

    @Column(name = "unit_no")
    public String getUnitNo() {
        return unitNo;
    }

    public void setUnitNo(String unitNo) {
        this.unitNo = unitNo;
    }

    @Column(name = "utility_area")
    public String getUtilityArea() {
        return utilityArea;
    }

    public void setUtilityArea(String utilityArea) {
        this.utilityArea = utilityArea;
    }

    @Column(name = "choose_unit")
    public String getChooseUnit() {
        return chooseUnit;
    }

    public void setChooseUnit(String chooseUnit) {
        this.chooseUnit = chooseUnit;
    }

    @Column(name = "service_name")
    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    @Column(name = "service_desc")
    public String getServiceDesc() {
        return serviceDesc;
    }

    public void setServiceDesc(String serviceDesc) {
        this.serviceDesc = serviceDesc;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "amc_date", length = 60)
    public Date getAmcDate() {
        return amcDate;
    }

    public void setAmcDate(Date amcDate) {
        this.amcDate = amcDate;
    }

    @Column(name = "responsibility")
    public String getResponsibility() {
        return responsibility;
    }

    public void setResponsibility(String responsibility) {
        this.responsibility = responsibility;
    }

    @Column(name = "approved_cost")
    public String getApprovedCost() {
        return approvedCost;
    }

    public void setApprovedCost(String approvedCost) {
        this.approvedCost = approvedCost;
    }

    @Column(name = "attachemet")
    public String getDocAttachment() {
        return docAttachment;
    }

    public void setDocAttachment(String docAttachment) {
        this.docAttachment = docAttachment;
    }
    
    

    public AMCMaintenance(String assetCode, String propertyName, String amcId, String amcType, String serviceArea, String unitNo,
            String utilityArea, String chooseUnit, String serviceName, String serviceDesc, String schedule, Date dueDate, Date amcDate,
            String priority, String responsibility, String approvedCost, String cost, String contactPerson, String amsStatus, String docAttachment,
            String status, Date lastmodifiedDate, String orgId, String userId) {
        this.assetCode = assetCode;
        this.propertyName = propertyName;
        this.amcId = amcId;
        this.amcType = amcType;
        this.serviceArea = serviceArea;
        this.unitNo = unitNo;
        this.utilityArea = utilityArea;
        this.chooseUnit = chooseUnit;
        this.serviceName = serviceName;
        this.serviceDesc = serviceDesc;
        this.schedule = schedule;
        this.dueDate = dueDate;
        this.amcDate = amcDate;
        this.priority = priority;
        this.responsibility = responsibility;
        this.approvedCost = approvedCost;
        this.cost = cost;
        this.contactPerson = contactPerson;
        this.amsStatus = amsStatus;
        this.docAttachment = docAttachment;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.orgId = orgId;
        this.userId = userId;
    }

    public AMCMaintenance(Integer SNo, String assetCode, String propertyName, String amcId, String amcType, String serviceArea, String unitNo,
            String utilityArea, String chooseUnit, String serviceName, String serviceDesc, String schedule, Date dueDate, Date amcDate,
            String priority, String responsibility, String approvedCost, String cost, String contactPerson, String amsStatus, String docAttachment,
            String status, Date lastmodifiedDate, String orgId, String userId) {
        this.SNo = SNo;
        this.assetCode = assetCode;
        this.propertyName = propertyName;
        this.amcId = amcId;
        this.amcType = amcType;
        this.serviceArea = serviceArea;
        this.unitNo = unitNo;
        this.utilityArea = utilityArea;
        this.chooseUnit = chooseUnit;
        this.serviceName = serviceName;
        this.serviceDesc = serviceDesc;
        this.schedule = schedule;
        this.dueDate = dueDate;
        this.amcDate = amcDate;
        this.priority = priority;
        this.responsibility = responsibility;
        this.approvedCost = approvedCost;
        this.cost = cost;
        this.contactPerson = contactPerson;
        this.amsStatus = amsStatus;
        this.docAttachment = docAttachment;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.orgId = orgId;
        this.userId = userId;
    }

    

}
