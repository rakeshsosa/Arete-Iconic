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
@Table(name = "work_flow", schema = "arete_tms"
)
public class Workflow {
    
    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "s_no", unique = true, nullable = false)
    private Integer sno;

    @Column(name = "org_id", length = 50)
    private String orgId;

    @Column(name = "submodule_name", length = 250)
    private String submodulename;

    @Column(name = "tab_name", length = 250)
    private String tabname;

    @Column(name = "Role", length = 50)
    private String role;    

    @Column(name = "user_id", nullable = false)
    private String userId;

    @Column(name = "level", length = 50)
    private String level;

    @Column(name = "status", length = 50)
    private String status;

    @Column(name = "createdby_id", length = 50)
    private String createdId;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "creation_date", length = 20)
    private Date creationDate;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "lastmodified_date", length = 20)
    private Date lastmodifiedDate;

    @Column(name = "txn", nullable = false)
    private Integer txn;

    public Integer getSno() {
        return sno;
    }

    public void setSno(Integer sno) {
        this.sno = sno;
    }

    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    public String getSubmodulename() {
        return submodulename;
    }

    public void setSubmodulename(String submodulename) {
        this.submodulename = submodulename;
    }

    public String getTabname() {
        return tabname;
    }

    public void setTabname(String tabname) {
        this.tabname = tabname;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }    

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreatedId() {
        return createdId;
    }

    public void setCreatedId(String createdId) {
        this.createdId = createdId;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Date getLastmodifiedDate() {
        return lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public Integer getTxn() {
        return txn;
    }

    public void setTxn(Integer txn) {
        this.txn = txn;
    }

    
}
