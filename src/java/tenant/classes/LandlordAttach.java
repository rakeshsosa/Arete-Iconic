package tenant.classes;
// Generated Sep 27, 2016 1:52:37 PM by Hibernate Tools 4.3.1

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
 * LandlordAttach generated by hbm2java
 */
@Entity
@Table(name = "landlord_attach", schema = "arete_tms"
)
public class LandlordAttach implements java.io.Serializable {

    private Integer sno;
    private String userId;
    private String orgId;
    private String landlordId;
    private byte[] contentTo;
    private String filename;
    private String status;
    private Date creationDate;
    private Date lastmodifiedDate;

    public LandlordAttach() {
    }

    public LandlordAttach(String userId, String orgId, String landlordId, byte[] contentTo, String filename, String status, Date creationDate, Date lastmodifiedDate) {
        this.userId = userId;
        this.orgId = orgId;
        this.landlordId = landlordId;
        this.contentTo = contentTo;
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

    @Column(name = "USER_ID", length = 50)
    public String getUserId() {
        return this.userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name = "ORG_ID", length = 50)
    public String getOrgId() {
        return this.orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name = "LANDLORD_ID", length = 50)
    public String getLandlordId() {
        return this.landlordId;
    }

    public void setLandlordId(String landlordId) {
        this.landlordId = landlordId;
    }
    @Column(name = "CONTENT_TO", length = 100)
    public byte[] getContentTo() {
        return contentTo;
    }

    public void setContentTo(byte[] contentTo) {
        this.contentTo = contentTo;
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
    @Column(name = "creation_date", length = 60)
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
