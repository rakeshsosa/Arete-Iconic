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
 * @author Munusamy
 */
@Entity
@Table(name = "unit_utility_category", schema = "arete_tms"
)      
public class UnitUtilityCategory implements java.io.Serializable{
    
    private Integer sno;
    private String orgId;
    private String userId;
    private String utilityCategory;
    private String utilityName;
    private String contractCode;
    private String unitNo;
    private String propertyName;
    private String propertyCode;
    private String status;
    private Date creationDate;
    private Date lastmodifiedDate;
    
    public UnitUtilityCategory(){
        
    }

    public UnitUtilityCategory(String orgId, String userId, String utilityCategory, String utilityName, String contractCode, String unitNo,
            String propertyName, String propertyCode, String status, Date creationDate, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.utilityCategory = utilityCategory;
        this.utilityName = utilityName;
        this.contractCode = contractCode;
        this.unitNo = unitNo;
        this.propertyName = propertyName;
        this.propertyCode = propertyCode;
        this.status = status;
        this.creationDate = creationDate;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public UnitUtilityCategory(Integer sno, String orgId, String userId, String utilityCategory, String utilityName, String contractCode, 
            String unitNo, String propertyName, String propertyCode, String status, Date creationDate, Date lastmodifiedDate) {
        this.sno = sno;
        this.orgId = orgId;
        this.userId = userId;
        this.utilityCategory = utilityCategory;
        this.utilityName = utilityName;
        this.contractCode = contractCode;
        this.unitNo = unitNo;
        this.propertyName = propertyName;
        this.propertyCode = propertyCode;
        this.status = status;
        this.creationDate = creationDate;
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

    @Column(name = "org_id")
    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name = "user_id")
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name = "utility_category")
    public String getUtilityCategory() {
        return utilityCategory;
    }

    public void setUtilityCategory(String utilityCategory) {
        this.utilityCategory = utilityCategory;
    }

    @Column(name = "utility_name")
    public String getUtilityName() {
        return utilityName;
    }

    public void setUtilityName(String utilityName) {
        this.utilityName = utilityName;
    }

    @Column(name = "contract_code")
    public String getContractCode() {
        return contractCode;
    }

    public void setContractCode(String contractCode) {
        this.contractCode = contractCode;
    }

    @Column(name = "unit_no")
    public String getUnitNo() {
        return unitNo;
    }

    public void setUnitNo(String unitNo) {
        this.unitNo = unitNo;
    }

    @Column(name = "property_name")
    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    @Column(name = "property_code")
    public String getPropertyCode() {
        return propertyCode;
    }

    public void setPropertyCode(String propertyCode) {
        this.propertyCode = propertyCode;
    }

    @Column(name = "status")
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Column(name = "creation_date")
    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
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
