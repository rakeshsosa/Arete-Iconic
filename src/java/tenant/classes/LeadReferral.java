/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
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
 * @author IT SUPPORT
 */
@Entity
@Table(name = "lead_referral", schema = "arete_tms")
public class LeadReferral implements java.io.Serializable {

    private Integer SNo;
    private String userId;
    private String orgId;
    private String subGroupName;
    private String leadDescription;
    private String status;
    private Date createdDate;
    private Date lastModifiedDate;

    public LeadReferral() {
    }

    public LeadReferral(String userId, String orgId, String subGroupName, String leadDescription, String status, Date createdDate, Date lastModifiedDate) {
        this.userId = userId;
        this.orgId = orgId;
        this.subGroupName = subGroupName;
        this.leadDescription = leadDescription;
        this.status = status;
        this.createdDate = createdDate;
        this.lastModifiedDate = lastModifiedDate;
    }

    public LeadReferral(Integer SNo, String userId, String orgId, String subGroupName, String leadDescription, String status, Date createdDate, Date lastModifiedDate) {
        this.SNo = SNo;
        this.userId = userId;
        this.orgId = orgId;
        this.subGroupName = subGroupName;
        this.leadDescription = leadDescription;
        this.status = status;
        this.createdDate = createdDate;
        this.lastModifiedDate = lastModifiedDate;
    } 

    @Id
    @GeneratedValue(strategy = IDENTITY)

    @Column(name = "s_no", unique = true, nullable = false)
    public Integer getSNo() {
        return this.SNo;
    }

    public void setSNo(Integer SNo) {
        this.SNo = SNo;
    }

    @Column(name = "user_id", length = 60)
    public String getUserId() {
        return this.userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name = "org_Id", length = 60)
    public String getOrgId() {
        return this.orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }
    
    @Column(name = "status", length = 60)
    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "createdDate", length = 10)
    public Date getCreatedDate() {
        return this.createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "lastModifiedDate", length = 10)
    public Date getLastModifiedDate() {
        return this.lastModifiedDate;
    }

    public void setLastModifiedDate(Date lastModifiedDate) {
        this.lastModifiedDate = lastModifiedDate;
    }

    @Column(name = "sub_group_name")
    public String getSubGroupName() {
        return subGroupName;
    }

    public void setSubGroupName(String subGroupName) {
        this.subGroupName = subGroupName;
    }

    @Column(name = "lead_description")
    public String getLeadDescription() {
        return leadDescription;
    }

    public void setLeadDescription(String leadDescription) {
        this.leadDescription = leadDescription;
    }

    
}
