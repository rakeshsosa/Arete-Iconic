package tenant.classes;
// Generated Oct 12, 2016 10:31:09 AM by Hibernate Tools 4.3.1

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
 * ServiceRequest generated by hbm2java
 */
@Entity
@Table(name = "serivce_request", schema = "arete_tms"
)
public class ServiceRequest implements java.io.Serializable {

    private Integer sno;
    private String orgId;
    private String userId;
    private String serviceRequestNo;
    private Date serviceRequestDate;
    private String serviceRequesterName;
    private String tenantUniqueNo;
    private String serviceRequested;
    private String serviceRequestedCost;
    private String propertyName;
    private String propertyNo;
    private Date completedBy;
    private String serviceCategory;
    private String itemCode;
    private String serviceItems;
    private String uom;
    private String qty;
    private String unitPrice;
    private String margin;
    private String totalPrice;
    private String totalAmount;
    private String remarks;
    private String appremarks;
    private String appremarks1;
    private String recordstatus;
    private String issueStatus;
    private String attribute1;
    private String attribute2;
    private String attribute3;
    private String attribute4;
    private String attribute5;
    private String status;
    private Date creationDate;
    private Date lastmodifiedDate;

    public ServiceRequest() {
    }

    public ServiceRequest(String serviceRequestNo) {
        this.serviceRequestNo = serviceRequestNo;
    }

    public ServiceRequest(String orgId, String userId, String serviceRequestNo, Date serviceRequestDate, String serviceRequesterName, String tenantUniqueNo, String serviceRequested, String serviceRequestedCost, String propertyName, String propertyNo, Date completedBy, String serviceCategory, String itemCode, String serviceItems, String uom, String qty, String unitPrice, String margin, String totalPrice, String totalAmount, String remarks, String recordstatus, String attribute1, String attribute2, String attribute3, String attribute4, String attribute5, String status, Date creationDate, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.serviceRequestNo = serviceRequestNo;
        this.serviceRequestDate = serviceRequestDate;
        this.serviceRequesterName = serviceRequesterName;
        this.tenantUniqueNo = tenantUniqueNo;
        this.serviceRequested = serviceRequested;
        this.serviceRequestedCost = serviceRequestedCost;
        this.propertyName = propertyName;
        this.propertyNo = propertyNo;
        this.completedBy = completedBy;
        this.serviceCategory = serviceCategory;
        this.itemCode = itemCode;
        this.serviceItems = serviceItems;
        this.uom = uom;
        this.qty = qty;
        this.unitPrice = unitPrice;
        this.margin = margin;
        this.totalPrice = totalPrice;
        this.totalAmount = totalAmount;
        this.remarks = remarks;
        this.recordstatus = recordstatus;
        this.attribute1 = attribute1;
        this.attribute2 = attribute2;
        this.attribute3 = attribute3;
        this.attribute4 = attribute4;
        this.attribute5 = attribute5;
        this.status = status;
        this.creationDate = creationDate;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public ServiceRequest(Integer sno, String orgId, String userId, String serviceRequestNo, Date serviceRequestDate, String serviceRequesterName, String tenantUniqueNo, String serviceRequested, String serviceRequestedCost, String propertyName, String propertyNo, Date completedBy, String serviceCategory, String itemCode, String serviceItems, String uom, String qty, String unitPrice, String margin, String totalPrice, String totalAmount, String remarks, String recordstatus, String attribute1, String attribute2, String attribute3, String attribute4, String attribute5, String status, Date lastmodifiedDate) {
        this.sno = sno;
        this.orgId = orgId;
        this.userId = userId;
        this.serviceRequestNo = serviceRequestNo;
        this.serviceRequestDate = serviceRequestDate;
        this.serviceRequesterName = serviceRequesterName;
        this.tenantUniqueNo = tenantUniqueNo;
        this.serviceRequested = serviceRequested;
        this.serviceRequestedCost = serviceRequestedCost;
        this.propertyName = propertyName;
        this.propertyNo = propertyNo;
        this.completedBy = completedBy;
        this.serviceCategory = serviceCategory;
        this.itemCode = itemCode;
        this.serviceItems = serviceItems;
        this.uom = uom;
        this.qty = qty;
        this.unitPrice = unitPrice;
        this.margin = margin;
        this.totalPrice = totalPrice;
        this.totalAmount = totalAmount;
        this.remarks = remarks;
        this.recordstatus = recordstatus;
        this.attribute1 = attribute1;
        this.attribute2 = attribute2;
        this.attribute3 = attribute3;
        this.attribute4 = attribute4;
        this.attribute5 = attribute5;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)

    @Column(name = "sno", unique = true, nullable = false)
    public Integer getSno() {
        return this.sno;
    }

    public void setSno(Integer sno) {
        this.sno = sno;
    }

    @Column(name = "org_id", length = 50)
    public String getOrgId() {
        return this.orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name = "user_id", length = 50)
    public String getUserId() {
        return this.userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name = "service_request_no", nullable = false, length = 60)
    public String getServiceRequestNo() {
        return this.serviceRequestNo;
    }

    public void setServiceRequestNo(String serviceRequestNo) {
        this.serviceRequestNo = serviceRequestNo;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "service_request_date", length = 19)
    public Date getServiceRequestDate() {
        return this.serviceRequestDate;
    }

    public void setServiceRequestDate(Date serviceRequestDate) {
        this.serviceRequestDate = serviceRequestDate;
    }

    @Column(name = "service_requester_name", length = 60)
    public String getServiceRequesterName() {
        return this.serviceRequesterName;
    }

    public void setServiceRequesterName(String serviceRequesterName) {
        this.serviceRequesterName = serviceRequesterName;
    }

    @Column(name = "tenant_unique_no", length = 60)
    public String getTenantUniqueNo() {
        return this.tenantUniqueNo;
    }

    public void setTenantUniqueNo(String tenantUniqueNo) {
        this.tenantUniqueNo = tenantUniqueNo;
    }

    @Column(name = "service_requested", length = 60)
    public String getServiceRequested() {
        return this.serviceRequested;
    }

    public void setServiceRequested(String serviceRequested) {
        this.serviceRequested = serviceRequested;
    }

    @Column(name = "service_requested_cost", length = 60)

    public String getServiceRequestedCost() {
        return serviceRequestedCost;
    }

    public void setServiceRequestedCost(String serviceRequestedCost) {
        this.serviceRequestedCost = serviceRequestedCost;
    }

    @Column(name = "property_name", length = 60)
    public String getPropertyName() {
        return this.propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    @Column(name = "Property_no", length = 60)
    public String getPropertyNo() {
        return this.propertyNo;
    }

    public void setPropertyNo(String propertyNo) {
        this.propertyNo = propertyNo;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "completed_by", length = 19)
    public Date getCompletedBy() {
        return this.completedBy;
    }

    public void setCompletedBy(Date completedBy) {
        this.completedBy = completedBy;
    }

    @Column(name = "service_category", length = 60)
    public String getServiceCategory() {
        return this.serviceCategory;
    }

    public void setServiceCategory(String serviceCategory) {
        this.serviceCategory = serviceCategory;
    }

    @Column(name = "item_code", length = 60)
    public String getItemCode() {
        return itemCode;
    }

    public void setItemCode(String itemCode) {
        this.itemCode = itemCode;
    }

    @Column(name = "service_items", length = 60)
    public String getServiceItems() {
        return this.serviceItems;
    }

    public void setServiceItems(String serviceItems) {
        this.serviceItems = serviceItems;
    }

    @Column(name = "uom", length = 60)
    public String getUom() {
        return this.uom;
    }

    public void setUom(String uom) {
        this.uom = uom;
    }

    @Column(name = "qty", length = 60)
    public String getQty() {
        return this.qty;
    }

    public void setQty(String qty) {
        this.qty = qty;
    }

    @Column(name = "unit_price", length = 60)
    public String getUnitPrice() {
        return this.unitPrice;
    }

    public void setUnitPrice(String unitPrice) {
        this.unitPrice = unitPrice;
    }

    @Column(name = "margin", length = 60)
    public String getMargin() {
        return this.margin;
    }

    public void setMargin(String margin) {
        this.margin = margin;
    }

    @Column(name = "total_price", length = 60)
    public String getTotalPrice() {
        return this.totalPrice;
    }

    public void setTotalPrice(String totalPrice) {
        this.totalPrice = totalPrice;
    }

    @Column(name = "total_amount", length = 60)
    public String getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(String totalAmount) {
        this.totalAmount = totalAmount;
    }

    @Column(name = "remarks", length = 300)
    public String getRemarks() {
        return this.remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Column(name = "app_remarks", length = 300)
    public String getAppremarks() {
        return appremarks;
    }

    public void setAppremarks(String appremarks) {
        this.appremarks = appremarks;
    }

    @Column(name = "app_remarks1", length = 300)
    public String getAppremarks1() {
        return appremarks1;
    }

    public void setAppremarks1(String appremarks1) {
        this.appremarks1 = appremarks1;
    }

    @Column(name = "recordstatus", length = 60)
    public String getRecordstatus() {
        return recordstatus;
    }

    public void setRecordstatus(String recordstatus) {
        this.recordstatus = recordstatus;
    }

    @Column(name = "attribute1", length = 60)
    public String getAttribute1() {
        return this.attribute1;
    }

    @Column(name = "issue_status", length = 60)
    public String getIssueStatus() {
        return issueStatus;
    }

    public void setIssueStatus(String issueStatus) {
        this.issueStatus = issueStatus;
    }

    public void setAttribute1(String attribute1) {
        this.attribute1 = attribute1;
    }

    @Column(name = "attribute2", length = 60)
    public String getAttribute2() {
        return this.attribute2;
    }

    public void setAttribute2(String attribute2) {
        this.attribute2 = attribute2;
    }

    @Column(name = "attribute3", length = 60)
    public String getAttribute3() {
        return this.attribute3;
    }

    public void setAttribute3(String attribute3) {
        this.attribute3 = attribute3;
    }

    @Column(name = "attribute4", length = 300)
    public String getAttribute4() {
        return this.attribute4;
    }

    public void setAttribute4(String attribute4) {
        this.attribute4 = attribute4;
    }

    @Column(name = "attribute5", length = 300)
    public String getAttribute5() {
        return this.attribute5;
    }

    public void setAttribute5(String attribute5) {
        this.attribute5 = attribute5;
    }

    @Column(name = "status", length = 60)
    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "creation_date", length = 19)
    public Date getCreationDate() {
        return this.creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "lastmodified_date", length = 19)
    public Date getLastmodifiedDate() {
        return this.lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }

}
