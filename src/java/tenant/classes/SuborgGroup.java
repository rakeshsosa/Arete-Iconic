package tenant.classes;
// Generated 30 May, 2016 12:22:21 PM by Hibernate Tools 4.3.1

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
 * SuborgGroup generated by hbm2java
 */
@Entity
@Table(name = "suborg_group", schema = "arete_tms"
)
public class SuborgGroup implements java.io.Serializable {

    private Integer sno;
    private String suborgCode;
    private String suborgName;
    private String suborgDesc;
    private String suborgAddress;
    private String groupCode;
    private String status;
    private Date lastmodifiedDate;

    public SuborgGroup() {
    }

    public SuborgGroup(String suborgCode, String suborgName, String suborgDesc, String suborgAddress, String groupCode, String status, java.sql.Timestamp lastmodifiedDate) {
        this.suborgCode = suborgCode;
        this.suborgName = suborgName;
        this.suborgDesc = suborgDesc;
        this.suborgAddress = suborgAddress;
        this.groupCode = groupCode;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public SuborgGroup(Integer sno, String suborgCode, String suborgName, String suborgDesc, String suborgAddress, String groupCode, String status, java.sql.Timestamp lastmodifiedDate) {
        this.sno = sno;
        this.suborgCode = suborgCode;
        this.suborgName = suborgName;
        this.suborgDesc = suborgDesc;
        this.suborgAddress = suborgAddress;
        this.groupCode = groupCode;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)

    @Column(name = "s_no", unique = true, nullable = false)
    public Integer getSno() {
        return this.sno;
    }

    public void setSno(Integer sno) {
        this.sno = sno;
    }

    @Column(name = "suborg_code", length = 50)
    public String getSuborgCode() {
        return this.suborgCode;
    }

    public void setSuborgCode(String suborgCode) {
        this.suborgCode = suborgCode;
    }

    @Column(name = "suborg_name", length = 100)
    public String getSuborgName() {
        return this.suborgName;
    }

    public void setSuborgName(String suborgName) {
        this.suborgName = suborgName;
    }

    @Column(name = "suborg_desc", length = 100)
    public String getSuborgDesc() {
        return this.suborgDesc;
    }

    public void setSuborgDesc(String suborgDesc) {
        this.suborgDesc = suborgDesc;
    }

    @Column(name = "suborg_address", length = 100)
    public String getSuborgAddress() {
        return this.suborgAddress;
    }

    public void setSuborgAddress(String suborgAddress) {
        this.suborgAddress = suborgAddress;
    }

    @Column(name = "group_code", length = 50)
    public String getGroupCode() {
        return this.groupCode;
    }

    public void setGroupCode(String groupCode) {
        this.groupCode = groupCode;
    }

    @Column(name = "status", length = 20)
    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "lastmodified_date", length = 19)
    public Date getLastmodifiedDate() {
        return this.lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }

}