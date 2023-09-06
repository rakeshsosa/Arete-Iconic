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
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author ebs-sdd05
 */
@Entity
@Table(name = "campaign_attachment", schema = "arete_tms")
public class CampaignAttachment implements java.io.Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(nullable = false)
    private int sno;
    private String userId;

    @Column(nullable = false)
    private String orgId;
    private String campCode;
    private String fileName;

    @Column(columnDefinition = "MEDIUMBLOB")
    private byte[] content;
    private String status;
    private Date lastmodifiedDate;

    public CampaignAttachment() {
    }

    public CampaignAttachment(String userId, String orgId, String campCode, String fileName, byte[] content, String status, Date lastmodifiedDate) {
        this.userId = userId;
        this.orgId = orgId;
        this.campCode = campCode;
        this.fileName = fileName;
        this.content = content;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public CampaignAttachment(int sno, String userId, String orgId, String campCode, String fileName, byte[] content, String status, Date lastmodifiedDate) {
        this.sno = sno;
        this.userId = userId;
        this.orgId = orgId;
        this.campCode = campCode;
        this.fileName = fileName;
        this.content = content;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    public String getCampCode() {
        return campCode;
    }

    public void setCampCode(String campCode) {
        this.campCode = campCode;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public byte[] getContent() {
        return content;
    }

    public void setContent(byte[] content) {
        this.content = content;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getLastmodifiedDate() {
        return lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }

}
