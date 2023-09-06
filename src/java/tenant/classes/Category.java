package tenant.classes;
// Generated 10 Jun, 2016 10:18:54 AM by Hibernate Tools 4.3.1

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
 * Category generated by hbm2java
 */
@Entity
@Table(name = "tenant_category", schema = "arete_tms"
) 
public class Category implements java.io.Serializable {

    private Integer sno;
    private String userId;
    private String orgId;
    private String tenantCategory;
    private String categoryDesc;
    private String categorySeqNo;
    private String extra1;
    private String extra2;
    private String extra3;
    private String extra4;
    private String extra5;
    private String status;
    private Date creationDate;
    private Date lastmodifiedDate;

    public Category() {
    }

    public Category(String userId, String orgId, String tenantCategory, String categoryDesc, String categorySeqNo, String extra1, String extra2, String extra3, String extra4, String extra5, String status, Date creationDate, Date lastmodifiedDate) {
        this.userId = userId;
        this.orgId = orgId;
        this.tenantCategory = tenantCategory;
        this.categoryDesc = categoryDesc;
        this.categorySeqNo = categorySeqNo;
        this.extra1 = extra1;
        this.extra2 = extra2;
        this.extra3 = extra3;
        this.extra4 = extra4;
        this.extra5 = extra5;
        this.status = status;
        this.creationDate = creationDate;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public Category(Integer sno, String userId, String orgId, String tenantCategory, String categoryDesc, String categorySeqNo, String extra1, String extra2, String extra3, String extra4, String extra5, String status, Date creationDate, Date lastmodifiedDate) {
        this.sno = sno;
        this.userId = userId;
        this.orgId = orgId;
        this.tenantCategory = tenantCategory;
        this.categoryDesc = categoryDesc;
        this.categorySeqNo = categorySeqNo;
        this.extra1 = extra1;
        this.extra2 = extra2;
        this.extra3 = extra3;
        this.extra4 = extra4;
        this.extra5 = extra5;
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

    @Column(name = "ORG_ID", length = 11)
    public String getOrgId() {
        return this.orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name = "TENANT_CATEGORY", length = 30)
    public String getTenantCategory() {
        return this.tenantCategory;
    }

    public void setTenantCategory(String tenantCategory) {
        this.tenantCategory = tenantCategory;
    }

    @Column(name = "CATEGORY_DESC", length = 200)
    public String getCategoryDesc() {
        return this.categoryDesc;
    }

    public void setCategoryDesc(String categoryDesc) {
        this.categoryDesc = categoryDesc;
    }

    @Column(name = "CATEGORY_CODE", length = 20)
    public String getCategorySeqNo() {
        return this.categorySeqNo;
    }

    public void setCategorySeqNo(String categorySeqNo) {
        this.categorySeqNo = categorySeqNo;
    }

    @Column(name = "ATTRIBUTE1", length = 60)
    public String getExtra1() {
        return this.extra1;
    }

    public void setExtra1(String extra1) {
        this.extra1 = extra1;
    }

    @Column(name = "ATTRIBUTE2", length = 60)
    public String getExtra2() {
        return this.extra2;
    }

    public void setExtra2(String extra2) {
        this.extra2 = extra2;
    }

    @Column(name = "ATTRIBUTE3", length = 60)
    public String getExtra3() {
        return this.extra3;
    }

    public void setExtra3(String extra3) {
        this.extra3 = extra3;
    }

    @Column(name = "ATTRIBUTE4", length = 500)
    public String getExtra4() {
        return this.extra4;
    }

    public void setExtra4(String extra4) {
        this.extra4 = extra4;
    }

    @Column(name = "ATTRIBUTE5", length = 500)
    public String getExtra5() {
        return this.extra5;
    }

    public void setExtra5(String extra5) {
        this.extra5 = extra5;
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