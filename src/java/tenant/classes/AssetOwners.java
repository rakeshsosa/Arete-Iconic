package tenant.classes;
// Generated 13 Oct, 2016 5:14:32 PM by Hibernate Tools 4.3.1

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
 * AssetOwners generated by hbm2java
 */
@Entity
@Table(name = "ASSET_OWNERS", schema = "arete_tms"
)
public class AssetOwners implements java.io.Serializable {

    private Integer SNo;
    private String userId;
    private String orgId;
    private String assetOwnerId;
    private String assetOwnerName;
    private String assetOwnerDescription;
    private String status;
    private Date createdDate;
    private Date lastModifiedDate;

    public AssetOwners() {
    }

    public AssetOwners(String userId, String orgId, String assetOwnerId, String assetOwnerName, String assetOwnerDescription, String status, Date createdDate, Date lastModifiedDate) {
        this.userId = userId;
        this.orgId = orgId;
        this.assetOwnerId = assetOwnerId;
        this.assetOwnerName = assetOwnerName;
        this.assetOwnerDescription = assetOwnerDescription;
        this.status = status;
        this.createdDate = createdDate;
        this.lastModifiedDate = lastModifiedDate;
    }

    public AssetOwners(Integer Sno, String userId, String orgId, String assetOwnerId, String assetOwnerName, String assetOwnerDescription, String status, Date createdDate, Date lastModifiedDate) {
        this.SNo = Sno;
        this.userId = userId;
        this.orgId = orgId;
        this.assetOwnerId = assetOwnerId;
        this.assetOwnerName = assetOwnerName;
        this.assetOwnerDescription = assetOwnerDescription;
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

    @Column(name = "asset_owner_id", length = 60)
    public String getAssetOwnerId() {
        return this.assetOwnerId;
    }

    public void setAssetOwnerId(String assetOwnerId) {
        this.assetOwnerId = assetOwnerId;
    }

    @Column(name = "asset_owner_name", length = 60)
    public String getAssetOwnerName() {
        return this.assetOwnerName;
    }

    public void setAssetOwnerName(String assetOwnerName) {
        this.assetOwnerName = assetOwnerName;
    }

    @Column(name = "asset_owner_description", length = 600)
    public String getAssetOwnerDescription() {
        return this.assetOwnerDescription;
    }

    public void setAssetOwnerDescription(String assetOwnerDescription) {
        this.assetOwnerDescription = assetOwnerDescription;
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

}
