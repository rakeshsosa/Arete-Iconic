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
@Table(name = "revaluation_attach", schema = "arete_tms"
)
public class RevaluationAttach implements java.io.Serializable {

    private Integer SNo;
    private byte[] content;
    private String contentType;
    private String assetCode;
    private String filename;
    private Date lastmodifiedDate;
    private String orgId;
    private String status;
    private String userId;
    private String revaluationNo;

    public RevaluationAttach() {
    }

    public RevaluationAttach(byte[] content, String contentType, String assetCode, String filename, Date lastmodifiedDate, String orgId, String status, String userId, String revaluationNo) {
        this.content = content;
        this.contentType = contentType;
        this.assetCode = assetCode;
        this.filename = filename;
        this.lastmodifiedDate = lastmodifiedDate;
        this.orgId = orgId;
        this.status = status;
        this.userId = userId;
        this.revaluationNo = revaluationNo;
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

    @Column(name = "content", columnDefinition = "MEDIUMBLOB")
    public byte[] getContent() {
        return this.content;
    }

    public void setContent(byte[] content) {
        this.content = content;
    }

    @Column(name = "content_type", length = 100)
    public String getContentType() {
        return this.contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    @Column(name = "asset_code", length = 100)
    public String getAssetCode() {
        return this.assetCode;
    }

    public void setAssetCode(String assetCode) {
        this.assetCode = assetCode;
    }

    @Column(name = "file_name", length = 100)
    public String getFilename() {
        return this.filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "lastmodified_date", length = 19)
    public Date getLastmodifiedDate() {
        return this.lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }

    @Column(name = "org_id", length = 11)
    public String getOrgId() {
        return this.orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name = "status", length = 50)
    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Column(name = "user_id", length = 50)
    public String getUserId() {
        return this.userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name = "revaluation_no", length = 50)
    public String getRevaluationNo() {
        return revaluationNo;
    }

    public void setRevaluationNo(String revaluationNo) {
        this.revaluationNo = revaluationNo;
    }

}
