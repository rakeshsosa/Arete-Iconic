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
 * @author Munusamy
 */
@Entity
@Table(name = "gmm", schema = "arete_tms"
) 
public class GMM implements java.io.Serializable{
    
    private Integer SNo;
    private String orgId;
    private String userId;
    private String assetCode;
    private String assetName;
    private String serviceReqNo;
    private Date serviceReqDate;
    private String serviceArea;
    private String unitNo;
    private String serviceName;
    private String serviceDesc;
    private String approvedBudget;
    private Date deadLine;
    private String actualCost;
    private String remarks;
    private String status;
    private Date lastmodifiedDate;
    
    public GMM(){
        
    }

    public GMM(String orgId, String userId, String assetCode, String assetName, String serviceReqNo, Date serviceReqDate, String serviceArea,
            String unitNo, String serviceName, String serviceDesc, String approvedBudget, Date deadLine, String actualCost, String remarks,
            String status, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.assetCode = assetCode;
        this.assetName = assetName;
        this.serviceReqNo = serviceReqNo;
        this.serviceReqDate = serviceReqDate;
        this.serviceArea = serviceArea;
        this.unitNo = unitNo;
        this.serviceName = serviceName;
        this.serviceDesc = serviceDesc;
        this.approvedBudget = approvedBudget;
        this.deadLine = deadLine;
        this.actualCost = actualCost;
        this.remarks = remarks;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public GMM(Integer SNo, String orgId, String userId, String assetCode, String assetName, String serviceReqNo, Date serviceReqDate, String serviceArea, String unitNo, String serviceName, String serviceDesc, String approvedBudget, Date deadLine, String actualCost, String remarks, String status, Date lastmodifiedDate) {
        this.SNo = SNo;
        this.orgId = orgId;
        this.userId = userId;
        this.assetCode = assetCode;
        this.assetName = assetName;
        this.serviceReqNo = serviceReqNo;
        this.serviceReqDate = serviceReqDate;
        this.serviceArea = serviceArea;
        this.unitNo = unitNo;
        this.serviceName = serviceName;
        this.serviceDesc = serviceDesc;
        this.approvedBudget = approvedBudget;
        this.deadLine = deadLine;
        this.actualCost = actualCost;
        this.remarks = remarks;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
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

    @Column(name = "org_id")
    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name = "user_id")
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
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

    @Column(name = "service_req_no")
    public String getServiceReqNo() {
        return serviceReqNo;
    }

    public void setServiceReqNo(String serviceReqNo) {
        this.serviceReqNo = serviceReqNo;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "service_req_Date", length = 19)
    public Date getServiceReqDate() {
        return serviceReqDate;
    }

    public void setServiceReqDate(Date serviceReqDate) {
        this.serviceReqDate = serviceReqDate;
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

    @Column(name = "approved_budget")
    public String getApprovedBudget() {
        return approvedBudget;
    }

    public void setApprovedBudget(String approvedBudget) {
        this.approvedBudget = approvedBudget;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "dead_line", length = 19)
    public Date getDeadLine() {
        return deadLine;
    }

    public void setDeadLine(Date deadLine) {
        this.deadLine = deadLine;
    }

    @Column(name = "actual_cost")
    public String getActualCost() {
        return actualCost;
    }

    public void setActualCost(String actualCost) {
        this.actualCost = actualCost;
    }

    @Column(name = "remarks")
    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Column(name = "status")
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
    
    
    
}
