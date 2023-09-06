/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.classes;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


/**
 * Uom generated by hbm2java
 */
@Entity
@Table(name = "uom", schema = "arete_tms"
)
public class Uom implements java.io.Serializable {

    private Integer sno;
    private String userId;
    private String orgId;
    private String uomCode;
    private String uomName;
    private String uomDesc;
    private String status;
    private java.sql.Timestamp lastmodifiedDate;

    public Uom() {
    }

    public Uom(Integer sno, String userId, String orgId, String uomCode, String uomName, String uomDesc, String status, java.sql.Timestamp lastmodifiedDate) {
        this.sno = sno;
        this.userId = userId;
        this.orgId = orgId;
        this.uomCode = uomCode;
        this.uomName = uomName;
        this.uomDesc = uomDesc;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public Uom(String userId, String orgId, String uomCode, String uomName, String uomDesc, String status, java.sql.Timestamp lastmodifiedDate) {
        this.userId = userId;
        this.orgId = orgId;
        this.uomCode = uomCode;
        this.uomName = uomName;
        this.uomDesc = uomDesc;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    @Id
    @SequenceGenerator(name = "table_seq", sequenceName = "uom_sequence",allocationSize=1)
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "table_seq")
    

    @Column(name = "s_no", unique = true, nullable = false, precision = 38, scale = 0)
    public Integer getSno() {
        return this.sno;
    }

    public void setSno(Integer sno) {
        this.sno = sno;
    }

    @Column(name = "user_id", nullable = false, length = 50)
    public String getUserId() {
        return this.userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name = "org_id", nullable = false, length = 50)
    public String getOrgId() {
        return this.orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name = "uom_code", unique = true, nullable = false, length = 50)
    public String getUomCode() {
        return this.uomCode;
    }

    public void setUomCode(String uomCode) {
        this.uomCode = uomCode;
    }

    @Column(name = "uom_name", nullable = false, length = 50)
    public String getUomName() {
        return this.uomName;
    }

    public void setUomName(String uomName) {
        this.uomName = uomName;
    }

    @Column(name = "uom_desc", length = 250)
    public String getUomDesc() {
        return this.uomDesc;
    }

    public void setUomDesc(String uomDesc) {
        this.uomDesc = uomDesc;
    }

    @Column(name = "status", nullable = false, length = 50)
    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Column(name = "lastmodified_date", nullable = false)
    public java.sql.Timestamp getLastmodifiedDate() {
        return this.lastmodifiedDate;
    }

    public void setLastmodifiedDate(java.sql.Timestamp lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }

}
