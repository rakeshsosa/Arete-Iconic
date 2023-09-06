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
@Table(name = "splitasset_attachment", schema = "arete_tms")
public class SplitAssetAttachment implements java.io.Serializable {

    private Integer SNo;
    private String orgId;
    private String userId;
    private String assetCode;
    private byte[] assetAttach;
    private String attachName;
    private Date lasttmodifiedDate;
    private String status;

    public SplitAssetAttachment() {
    }

    public SplitAssetAttachment(String assetCode, byte[] assetAttach) {
        this.assetCode = assetCode;
        this.assetAttach = assetAttach;
    }

    public SplitAssetAttachment(String orgId, String userId, String assetCode, byte[] assetAttach, String attachName, Date lasttmodifiedDate, String status) {
        this.orgId = orgId;
        this.userId = userId;
        this.assetCode = assetCode;
        this.assetAttach = assetAttach;
        this.attachName = attachName;
        this.lasttmodifiedDate = lasttmodifiedDate;
        this.status = status;
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

    @Column(name = "org_id", length = 20)
    public String getOrgId() {
        return this.orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name = "user_id", length = 20)
    public String getUserId() {
        return this.userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name = "asset_code", length = 20)
    public String getAssetCode() {
        return assetCode;
    }

    public void setAssetCode(String assetCode) {
        this.assetCode = assetCode;
    }

    @Column(name = "asset_attach", columnDefinition = "MEDIUMBLOB")
    public byte[] getAssetAttach() {
        return assetAttach;
    }

    public void setAssetAttach(byte[] assetAttach) {
        this.assetAttach = assetAttach;
    }

    @Column(name = "attach_name", length = 250)
    public String getAttachName() {
        return attachName;
    }

    public void setAttachName(String attachName) {
        this.attachName = attachName;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "lasttmodified_date", length = 19)
    public Date getLasttmodifiedDate() {
        return this.lasttmodifiedDate;
    }

    public void setLasttmodifiedDate(Date lasttmodifiedDate) {
        this.lasttmodifiedDate = lasttmodifiedDate;
    }

    @Column(name = "status", length = 20)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    

}
