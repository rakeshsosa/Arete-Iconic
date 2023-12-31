package tenant.classes;
// Generated 3 Sep, 2016 5:28:08 PM by Hibernate Tools 4.3.1

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
 * CampaignMedia generated by hbm2java
 */
@Entity
@Table(name = "campaign_media", schema = "arete_tms"
)
public class CampaignMedia implements java.io.Serializable {

    private Integer sno;
    private String userId;
    private String orgId;
    private String mediaCode;
    private String mediaName;
    private String mediaDesc;
    private String attribute1;
    private String attribute2;
    private String attribute3;
    private String attribute4;
    private String attribute5;
    private String status;
    private Date lastmodifiedDate;

    public CampaignMedia() {
    }

    public CampaignMedia(Integer sno, String mediaCode, String status, Date lastmodifiedDate, String userId, String mediaName, String orgId, String mediaDesc) {
        this.sno = sno;
        this.mediaCode = mediaCode;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.userId = userId;
        this.mediaName = mediaName;
        this.orgId = orgId;
        this.mediaDesc = mediaDesc;
    }

    public CampaignMedia(String mediaCode, String status, Date lastmodifiedDate, String userId, String mediaName, String orgId, String mediaDesc) {
        this.mediaCode = mediaCode;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.userId = userId;
        this.mediaName = mediaName;
        this.orgId = orgId;
        this.mediaDesc = mediaDesc;
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

    @Column(name = "user_Id", nullable = false, length = 20)
    public String getUserId() {
        return this.userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name = "org_Id", length = 20)
    public String getOrgId() {
        return this.orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name = "media_Code", length = 50)
    public String getMediaCode() {
        return this.mediaCode;
    }

    public void setMediaCode(String mediaCode) {
        this.mediaCode = mediaCode;
    }

    @Column(name = "media_Name", length = 50)
    public String getMediaName() {
        return this.mediaName;
    }

    public void setMediaName(String mediaName) {
        this.mediaName = mediaName;
    }

    @Column(name = "media_Desc", length = 500)
    public String getMediaDesc() {
        return mediaDesc;
    }

    public void setMediaDesc(String mediaDesc) {
        this.mediaDesc = mediaDesc;
    }

    @Column(name = "attribute1", length = 100)
    public String getAttribute1() {
        return attribute1;
    }

    public void setAttribute1(String attribute1) {
        this.attribute1 = attribute1;
    }

    @Column(name = "attribute2", length = 100)
    public String getAttribute2() {
        return attribute2;
    }

    public void setAttribute2(String attribute2) {
        this.attribute2 = attribute2;
    }

    @Column(name = "attribute3", length = 100)
    public String getAttribute3() {
        return attribute3;
    }

    public void setAttribute3(String attribute3) {
        this.attribute3 = attribute3;
    }

    @Column(name = "attribute4", length = 500)
    public String getAttribute4() {
        return attribute4;
    }

    public void setAttribute4(String attribute4) {
        this.attribute4 = attribute4;
    }

    @Column(name = "attribute5", length = 500)
    public String getAttribute5() {
        return attribute5;
    }

    public void setAttribute5(String attribute5) {
        this.attribute5 = attribute5;
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
