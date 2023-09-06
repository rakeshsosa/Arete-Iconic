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
@Table(name = "service_amenties", schema = "arete_tms"
)      
public class ServiceAmenties implements java.io.Serializable{
    
    private Integer sno;
    private String orgId;
    private String userId;
    private String serviceName;
    private String description;
    private Double serviceCharge;
    private Double fixedServiceCharge;
    private String contractCode;
    private String unitNo;
    private String status;
    private Date creationDate;
    private Date lastmodifiedDate;
    
    public ServiceAmenties(){
        
    }

    public ServiceAmenties(String orgId, String userId, String serviceName, String description, Double serviceCharge, Double fixedServiceCharge,
            String contractCode, String unitNo, String status, Date creationDate, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.serviceName = serviceName;
        this.description = description;
        this.serviceCharge = serviceCharge;
        this.fixedServiceCharge = fixedServiceCharge;
        this.contractCode = contractCode;
        this.unitNo = unitNo;
        this.status = status;
        this.creationDate = creationDate;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public ServiceAmenties(Integer sno, String orgId, String userId, String serviceName, String description, Double serviceCharge,
            Double fixedServiceCharge, String contractCode, String unitNo, String status, Date creationDate, Date lastmodifiedDate) {
        this.sno = sno;
        this.orgId = orgId;
        this.userId = userId;
        this.serviceName = serviceName;
        this.description = description;
        this.serviceCharge = serviceCharge;
        this.fixedServiceCharge = fixedServiceCharge;
        this.contractCode = contractCode;
        this.unitNo = unitNo;
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

    @Column(name = "service_name")
    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Column(name = "service_charge")
    public Double getServiceCharge() {
        return serviceCharge;
    }

    public void setServiceCharge(Double serviceCharge) {
        this.serviceCharge = serviceCharge;
    }

    @Column(name = "fixed_service_charge")
    public Double getFixedServiceCharge() {
        return fixedServiceCharge;
    }

    public void setFixedServiceCharge(Double fixedServiceCharge) {
        this.fixedServiceCharge = fixedServiceCharge;
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
