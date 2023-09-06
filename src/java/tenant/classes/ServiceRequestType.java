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
 * @author ebs05
 */
@Entity
@Table(name = "service_request_type", schema = "arete_tms"
) 
public class ServiceRequestType {

    private Integer sno;
    private String orgId;
    private String userId;
//    private String requestedTypeId;
    private String serviceRequested;
    private String serviceRequestedCost;
    private Date creationDate;
    private String status;
    private Date lastmodifiedDate;

    public ServiceRequestType() {
    }

    public ServiceRequestType(String orgId, String userId, String serviceRequested, String serviceRequestedCost, Date creationDate, String status, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
//        this.requestedTypeId = requestedTypeId;
        this.serviceRequested = serviceRequested;
        this.serviceRequestedCost = serviceRequestedCost;
        this.creationDate = creationDate;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public ServiceRequestType(Integer sno, String orgId, String userId, String serviceRequested, String serviceRequestedCost, Date creationDate, String status, Date lastmodifiedDate) {
        this.sno = sno;
        this.orgId = orgId;
        this.userId = userId;
//        this.requestedTypeId = requestedTypeId;
        this.serviceRequested = serviceRequested;
        this.serviceRequestedCost = serviceRequestedCost;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.creationDate = creationDate;

    }

    @Id
    @GeneratedValue(strategy = IDENTITY)

    @Column(name = "SNO", unique = true, nullable = false)
    public Integer getSno() {
        return this.sno;
    }

    public void setSno(Integer sno) {
        this.sno = sno;
    }

    @Column(name = "ORG_ID", length = 50)
    public String getOrgId() {
        return this.orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name = "USER_ID", length = 50)
    public String getUserId() {
        return this.userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

//    @Column(name = "REDUESTEDTYPE_ID", length = 50)
//
//    public String getRequestedTypeId() {
//        return requestedTypeId;
//    }
//
//    public void setRequestedTypeId(String requestedTypeId) {
//        this.requestedTypeId = requestedTypeId;
//    }
    @Column(name = "SERVICE_REQUESTED", length = 50)
    public String getServiceRequested() {
        return serviceRequested;
    }

    public void setServiceRequested(String serviceRequested) {
        this.serviceRequested = serviceRequested;
    }

    @Column(name = "SERVICE_REQUESTED_COST", length = 50)
    public String getServiceRequestedCost() {
        return serviceRequestedCost;
    }

    public void setServiceRequestedCost(String serviceRequestedCost) {
        this.serviceRequestedCost = serviceRequestedCost;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "CREATION_DATE", length = 19)
    public Date getCreationDate() {
        return this.creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    @Column(name = "STATUS", length = 50)
    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "LASTMODIFIED_DATE", length = 19)
    public Date getLastmodifiedDate() {
        return this.lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }

}
