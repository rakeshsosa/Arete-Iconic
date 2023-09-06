/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.classes;

import java.io.Serializable;
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
 * @author ebs-sdd41
 */
@Entity
@Table(name = "flat_type", schema = "arete_tms"
)
public class FlatType  implements Serializable{
    
    private Integer sno;
    private String userId;
    private String orgId;
    private String flatType;
    private String typeDesc;
    private String typeSeqNo;
    private String status;
    private Date creationDate;
    private Date lastmodifiedDate;

    public FlatType() {
    }

    public FlatType(String userId, String orgId, String flatType, String typeDesc, String typeSeqNo, String status, Date creationDate, Date lastmodifiedDate) {
        this.userId = userId;
        this.orgId = orgId;
        this.flatType = flatType;
        this.typeDesc = typeDesc;
        this.typeSeqNo = typeSeqNo;
        this.status = status;
        this.creationDate = creationDate;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public FlatType(Integer sno, String userId, String orgId, String flatType, String typeDesc, String typeSeqNo, String status, Date creationDate, Date lastmodifiedDate) {
        this.sno = sno;
        this.userId = userId;
        this.orgId = orgId;
        this.flatType = flatType;
        this.typeDesc = typeDesc;
        this.typeSeqNo = typeSeqNo;
        this.status = status;
        this.creationDate = creationDate;
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

    @Column(name = "user_id", length = 50)
    public String getUserId() {
        return this.userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name = "org_id", length = 11)
    public String getOrgId() {
        return this.orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

     @Column(name = "flat_type", length = 50)
    public String getFlatType() {
        return flatType;
    }

    public void setFlatType(String flatType) {
        this.flatType = flatType;
    }

 

    @Column(name = "type_desc", length = 200)
    public String getTypeDesc() {
        return this.typeDesc;
    }

    public void setTypeDesc(String typeDesc) {
        this.typeDesc = typeDesc;
    }

    @Column(name = "type_code", length = 20)
    public String getTypeSeqNo() {
        return this.typeSeqNo;
    }

    public void setTypeSeqNo(String typeSeqNo) {
        this.typeSeqNo = typeSeqNo;
    }

    

    @Column(name = "status", length = 50)
    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "creation_date")
    public Date getCreationDate() {
        return this.creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "lastmodified_date")
    public Date getLastmodifiedDate() {
        return this.lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }
    
    
}
