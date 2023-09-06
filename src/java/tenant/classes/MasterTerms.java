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
@Table(name = "master_terms", schema = "arete_tms"
) 
public class MasterTerms implements java.io.Serializable {

    private Integer sno;
    private String termType;
    private String termCode;
    private String termName;
    private String termDesc;
    private String status;
    private Date lastmodifiedDate;

    public MasterTerms() {
    }

    public MasterTerms(String termType, String termCode, String termName, String termDesc, String status, java.sql.Timestamp lastmodifiedDate) {
        this.termType = termType;
        this.termCode = termCode;
        this.termName = termName;
        this.termDesc = termDesc;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public MasterTerms(Integer sno, String termType, String termCode, String termName, String termDesc, String status, java.sql.Timestamp lastmodifiedDate) {
        this.sno = sno;
        this.termType = termType;
        this.termCode = termCode;
        this.termName = termName;
        this.termDesc = termDesc;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)

    @Column(name = "sno", unique = true, nullable = false)
    public Integer getSno() {
        return sno;
    }

    public void setSno(Integer sno) {
        this.sno = sno;
    }

    @Column(name = "term_type", length = 50)
    public String getTermType() {
        return termType;
    }

    public void setTermType(String termType) {
        this.termType = termType;
    }

    @Column(name = "term_code", length = 50)
    public String getTermCode() {
        return termCode;
    }

    public void setTermCode(String termCode) {
        this.termCode = termCode;
    }

    @Column(name = "term_name", length = 50)
    public String getTermName() {
        return termName;
    }

    public void setTermName(String termName) {
        this.termName = termName;
    }

    @Column(name = "term_desc", length = 50)
    public String getTermDesc() {
        return termDesc;
    }

    public void setTermDesc(String termDesc) {
        this.termDesc = termDesc;
    }

    @Column(name = "status", length = 50)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "lastmodified_date", length = 19)
    public Date getLastmodifiedDate() {
        return lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }

}
