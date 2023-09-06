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
 * @author Vaijayanti
 */
@Entity
@Table(name = "Building_History_Management_Grid", schema = "arete_tms")   
public class BuildingHistoryManagementGrid implements java.io.Serializable{
    
    private Integer sno;
    private String orgId;
    private String userId;
    private String assetCode;
    private String sname;
    private String scontact;
    private String semail;
    private String saddress;
    private Boolean status;
    private Date lastmodifiedDate;

    public BuildingHistoryManagementGrid() {
    }

    public BuildingHistoryManagementGrid(String orgId, String userId, String assetCode, String sname, String scontact, String semail, String saddress, Boolean status, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.assetCode = assetCode;
        this.sname = sname;
        this.scontact = scontact;
        this.semail = semail;
        this.saddress = saddress;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public BuildingHistoryManagementGrid(Integer sno, String orgId, String userId, String assetCode, String sname, String scontact, String semail, String saddress, Boolean status, Date lastmodifiedDate) {
        this.sno = sno;
        this.orgId = orgId;
        this.userId = userId;
        this.assetCode = assetCode;
        this.sname = sname;
        this.scontact = scontact;
        this.semail = semail;
        this.saddress = saddress;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "s_no", unique = true, nullable = false)
    public Integer getSno() {
        return sno;
    }

    public void setSno(Integer sno) {
        this.sno = sno;
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

    @Column(name = "Second_Owner_name")
    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    @Column(name = "Second_Owner_ContactNo")
    public String getScontact() {
        return scontact;
    }

    public void setScontact(String scontact) {
        this.scontact = scontact;
    }

    @Column(name = "Second_Owner_Email")
    public String getSemail() {
        return semail;
    }

    public void setSemail(String semail) {
        this.semail = semail;
    }

    @Column(name = "Second_Owner_Address")
    public String getSaddress() {
        return saddress;
    }

    public void setSaddress(String saddress) {
        this.saddress = saddress;
    }

    @Column(name = "STATUS")
    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
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
