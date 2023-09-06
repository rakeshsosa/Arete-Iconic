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
 * @author Munusamy
 */
@Entity
@Table(name = "asset_owner_item", schema = "arete_tms")  
public class assetOwnerItem implements java.io.Serializable{
    
    private Integer SNo;
    private String orgId;
    private String userId;
    private String status;
    private String assetCode;
    private String assetOwnerType;
    private Date lastmodifiedDate;
    
    public assetOwnerItem(){
        
    }

    public assetOwnerItem(String orgId, String userId, String status, String assetCode, String assetOwnerType, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.status = status;
        this.assetCode = assetCode;
        this.assetOwnerType = assetOwnerType;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public assetOwnerItem(Integer SNo, String orgId, String userId, String status, String assetCode, String assetOwnerType, Date lastmodifiedDate) {
        this.SNo = SNo;
        this.orgId = orgId;
        this.userId = userId;
        this.status = status;
        this.assetCode = assetCode;
        this.assetOwnerType = assetOwnerType;
        this.lastmodifiedDate = lastmodifiedDate;
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

    @Column(name = "status")
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Column(name = "asset_code")
    public String getAssetCode() {
        return assetCode;
    }

    public void setAssetCode(String assetCode) {
        this.assetCode = assetCode;
    }

    @Column(name = "asset_owner_type")
    public String getAssetOwnerType() {
        return assetOwnerType;
    }

    public void setAssetOwnerType(String assetOwnerType) {
        this.assetOwnerType = assetOwnerType;
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
