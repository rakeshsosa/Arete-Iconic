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
@Table(name = "penalty_type", schema = "arete_tms"
)
public class PenaltyType {

    private Integer sno;
    private String orgId;
    private String userId;
    private String penaltyType;
    private String penaltyTypeDescription;
    private String penaltyAmount;
    private Date creationDate;
    private String status;
    private Date lastmodifiedDate;

    public PenaltyType() {
    }

    public PenaltyType(String orgId, String userId, String penaltyType, String penaltyTypeDescription, String penaltyAmount, Date creationDate, String status, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
//        this.requestedTypeId = requestedTypeId;
        this.penaltyType = penaltyType;
        this.penaltyTypeDescription = penaltyTypeDescription;
        this.penaltyAmount = penaltyAmount;
        this.creationDate = creationDate;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public PenaltyType(Integer sno, String orgId, String userId, String penaltyType, String penaltyTypeDescription, String penaltyAmount,Date creationDate, String status, Date lastmodifiedDate) {
        this.sno = sno;
        this.orgId = orgId;
        this.userId = userId;
//        this.requestedTypeId = requestedTypeId;
        this.penaltyType = penaltyType;
        this.penaltyTypeDescription = penaltyTypeDescription;
        this.penaltyAmount = penaltyAmount;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.creationDate = creationDate;

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

//    @Column(name = "REDUESTEDTYPE_ID", length = 50)
//
//    public String getRequestedTypeId() {
//        return requestedTypeId;
//    }
//
//    public void setRequestedTypeId(String requestedTypeId) {
//        this.requestedTypeId = requestedTypeId;
//    }
    @Column(name = "penalty_type", length = 60)
    public String getPenaltyType() {
        return penaltyType;
    }

    public void setPenaltyType(String penaltyType) {
        this.penaltyType = penaltyType;
    }

    @Column(name = "penalty_type_description", length = 60)
    public String getPenaltyTypeDescription() {
        return penaltyTypeDescription;
    }

    public void setPenaltyTypeDescription(String penaltyTypeDescription) {
        this.penaltyTypeDescription = penaltyTypeDescription;
    }

    @Column(name = "penalty_amount", length = 60)
    public String getPenaltyAmount() {
        return penaltyAmount;
    }

    public void setPenaltyAmount(String penaltyAmount) {
        this.penaltyAmount = penaltyAmount;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "creation_date", length = 19)
    public Date getCreationDate() {
        return this.creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    @Column(name = "status", length = 50)
    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
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
