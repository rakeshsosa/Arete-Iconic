package tenant.classes;
// Generated 22 Sep, 2016 10:06:28 AM by Hibernate Tools 4.3.1

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
 * InsuranceAttach generated by hbm2java
 */
@Entity
@Table(name = "insurance_attach", schema = "arete_tms"
)
public class InsuranceAttach implements java.io.Serializable {

    private Integer sno;
    private String orgId;
    private String userId;
    private String insuranceNo;
    private String insuranceId;
    private byte[] content;
    private String contentType;
    private String filename;
    private String status;
    private Date creationDate;
    private Date lastmodifiedDate;

    public InsuranceAttach() {
    }

    public InsuranceAttach(String insuranceId) {
        this.insuranceId = insuranceId;
    }

    public InsuranceAttach(String orgId, String userId, String insuranceNo, String insuranceId, byte[] content, String contentType, String filename, String status, Date creationDate, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.insuranceNo = insuranceNo;
        this.insuranceId = insuranceId;
        this.content = content;
        this.contentType = contentType;
        this.filename = filename;
        this.status = status;
        this.creationDate = creationDate;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)

    @Column(name = "SNO", unique = true, nullable = false)
    public Integer getSno() {
        return this.sno;
    }

    public void setSno(Integer sno) {
        this.sno = sno;
    }

    @Column(name = "ORG_ID", length = 11)
    public String getOrgId() {
        return this.orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name = "USER_ID", length = 50)
    public String getUserId() {
        return this.userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name = "INSURANCE_NO", length = 20)
    public String getInsuranceNo() {
        return this.insuranceNo;
    }

    public void setInsuranceNo(String insuranceNo) {
        this.insuranceNo = insuranceNo;
    }

    @Column(name = "INSURANCE_ID", length = 20)
    public String getInsuranceId() {
        return this.insuranceId;
    }

    public void setInsuranceId(String insuranceId) {
        this.insuranceId = insuranceId;
    }

    @Column(name = "CONTENT", columnDefinition = "MEDIUMBLOB")
    public byte[] getContent() {
        return this.content;
    }

    public void setContent(byte[] content) {
        this.content = content;
    }

    @Column(name = "CONTENT_TYPE", length = 100)
    public String getContentType() {
        return this.contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    @Column(name = "FILENAME", length = 100)
    public String getFilename() {
        return this.filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    @Column(name = "STATUS", length = 50)
    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "CREATION_DATE", length = 19)
    public Date getCreationDate() {
        return this.creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
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
