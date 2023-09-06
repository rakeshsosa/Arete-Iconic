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

@Entity
@Table(name = "liabilities", schema = "arete_tms") 
public class Liabilities implements java.io.Serializable {

    private Integer SNo;
    private String userId;
    private String orgId;
    private String liabilitiesClassId;
    private String liabilitiesClassName;
    private String liabilitiesClassDescription;
    private String status;
    private Date createdDate;
    private Date lastModifiedDate;

    public Liabilities() {
    }

    public Liabilities(String userId, String orgId, String liabilitiesClassId, String liabilitiesClassName, String liabilitiesClassDescription, String status, 
            Date createdDate, Date lastModifiedDate) {
        this.userId = userId;
        this.orgId = orgId;
        this.liabilitiesClassId = liabilitiesClassId;
        this.liabilitiesClassName = liabilitiesClassName;
        this.liabilitiesClassDescription = liabilitiesClassDescription;
        this.status = status;
        this.createdDate = createdDate;
        this.lastModifiedDate = lastModifiedDate;
    }

    public Liabilities(Integer SNo, String userId, String orgId, String liabilitiesClassId, String liabilitiesClassName, String liabilitiesClassDescription, 
            String status, Date createdDate, Date lastModifiedDate) {
        this.SNo = SNo;
        this.userId = userId;
        this.orgId = orgId;
        this.liabilitiesClassId = liabilitiesClassId;
        this.liabilitiesClassName = liabilitiesClassName;
        this.liabilitiesClassDescription = liabilitiesClassDescription;
        this.status = status;
        this.createdDate = createdDate;
        this.lastModifiedDate = lastModifiedDate;
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

    @Column(name = "user_id", length = 60)
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name = "org_Id", length = 60)
    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name = "liabilities_class_id", length = 60)
    public String getLiabilitiesClassId() {
        return liabilitiesClassId;
    }

    public void setLiabilitiesClassId(String liabilitiesClassId) {
        this.liabilitiesClassId = liabilitiesClassId;
    }

    @Column(name = "liabilities_class_name", length = 60)
    public String getLiabilitiesClassName() {
        return liabilitiesClassName;
    }

    public void setLiabilitiesClassName(String liabilitiesClassName) {
        this.liabilitiesClassName = liabilitiesClassName;
    }

    @Column(name = "liabilities_class_description", length = 600)
    public String getLiabilitiesClassDescription() {
        return liabilitiesClassDescription;
    }

    public void setLiabilitiesClassDescription(String liabilitiesClassDescription) {
        this.liabilitiesClassDescription = liabilitiesClassDescription;
    }

    @Column(name = "status", length = 60)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "createdDate", length = 10)
    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "lastModifiedDate", length = 10)
    public Date getLastModifiedDate() {
        return lastModifiedDate;
    }

    public void setLastModifiedDate(Date lastModifiedDate) {
        this.lastModifiedDate = lastModifiedDate;
    }
    
    
}
