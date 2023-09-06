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
 * created on 08-mar-2019
 *
 * @author Lakshmi
 */
@Entity
@Table(name = "third_party_tenant_details", schema = "arete_tms")
public class ThirdPartyTenantDetails {

    private Integer SNo;
    private String orgId;
    private String userId;
    private String tenantCode;
    private String tenantId;
    private String tenantType;
    private String tenantFirstName;
    private String tenantLaststName;
    private String mobileNumber;
    private String emailId;
    private String nationality;
    private byte[] tenantAttachment;
    private String tenfileName;
    private Date creationDate;
    private String contractPeriod;
    private String contractName;
    private String appstatus;
    private String vacatestatus;
    private String status;
    private Date lastmodifiedDate;

    public ThirdPartyTenantDetails(String orgId, String userId, String tenantCode, String tenantId, String tenantType, String tenantFirstName, String tenantLaststName, String mobileNumber, String emailId, String nationality, byte[] tenantAttachment, String tenfileName, Date creationDate, String contractPeriod, String contractName, String appstatus, String vacatestatus, String status, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.tenantCode = tenantCode;
        this.tenantId = tenantId;
        this.tenantType = tenantType;
        this.tenantFirstName = tenantFirstName;
        this.tenantLaststName = tenantLaststName;
        this.mobileNumber = mobileNumber;
        this.emailId = emailId;
        this.nationality = nationality;
        this.tenantAttachment = tenantAttachment;
        this.tenfileName = tenfileName;
        this.creationDate = creationDate;
        this.contractPeriod = contractPeriod;
        this.contractName = contractName;
        this.appstatus = appstatus;
        this.vacatestatus = vacatestatus;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public ThirdPartyTenantDetails(Integer SNo, String orgId, String userId, String tenantCode, String tenantId, String tenantType, String tenantFirstName, String tenantLaststName, String mobileNumber, String emailId, String nationality, byte[] tenantAttachment, String tenfileName, Date creationDate, String contractPeriod, String contractName, String appstatus, String vacatestatus, String status, Date lastmodifiedDate) {
        this.SNo = SNo;
        this.orgId = orgId;
        this.userId = userId;
        this.tenantCode = tenantCode;
        this.tenantId = tenantId;
        this.tenantType = tenantType;
        this.tenantFirstName = tenantFirstName;
        this.tenantLaststName = tenantLaststName;
        this.mobileNumber = mobileNumber;
        this.emailId = emailId;
        this.nationality = nationality;
        this.tenantAttachment = tenantAttachment;
        this.tenfileName = tenfileName;
        this.creationDate = creationDate;
        this.contractPeriod = contractPeriod;
        this.contractName = contractName;
        this.appstatus = appstatus;
        this.vacatestatus = vacatestatus;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public ThirdPartyTenantDetails() {
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "s_no", unique = true, nullable = false)
    public Integer getSNo() {
        return SNo;
    }

    public void setSNo(Integer SNo) {
        this.SNo = SNo;
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

    @Column(name = "tenant_code")
    public String getTenantCode() {
        return tenantCode;
    }

    public void setTenantCode(String tenantCode) {
        this.tenantCode = tenantCode;
    }

    @Column(name = "tenant_id")
    public String getTenantId() {
        return tenantId;
    }

    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }

    @Column(name = "tenant_type")
    public String getTenantType() {
        return tenantType;
    }

    public void setTenantType(String tenantType) {
        this.tenantType = tenantType;
    }

    @Column(name = "third_party_tenant_fname")
    public String getTenantFirstName() {
        return tenantFirstName;
    }

    public void setTenantFirstName(String tenantFirstName) {
        this.tenantFirstName = tenantFirstName;
    }

    @Column(name = "third_party_tenant_lname")
    public String getTenantLaststName() {
        return tenantLaststName;
    }

    public void setTenantLaststName(String tenantLaststName) {
        this.tenantLaststName = tenantLaststName;
    }

    @Column(name = "third_party_mobile")
    public String getMobileNumber() {
        return mobileNumber;
    }

    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    @Column(name = "third_party_emailid")
    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    @Column(name = "third_party_nationality")
    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    @Column(name = "tenant_attachment", columnDefinition = "MEDIUMBLOB")
    public byte[] getTenantAttachment() {
        return tenantAttachment;
    }

    public void setTenantAttachment(byte[] tenantAttachment) {
        this.tenantAttachment = tenantAttachment;
    }

    @Column(name = "ten_file_name")
    public String getTenfileName() {
        return tenfileName;
    }

    public void setTenfileName(String tenfileName) {
        this.tenfileName = tenfileName;
    }

    @Column(name = "creation_date")
    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    @Column(name = "contract_period")
    public String getContractPeriod() {
        return contractPeriod;
    }

    public void setContractPeriod(String contractPeriod) {
        this.contractPeriod = contractPeriod;
    }

    @Column(name = "contract_name")
    public String getContractName() {
        return contractName;
    }

    public void setContractName(String contractName) {
        this.contractName = contractName;
    }

    @Column(name = "appstatus")
    public String getAppstatus() {
        return appstatus;
    }

    public void setAppstatus(String appstatus) {
        this.appstatus = appstatus;
    }

    @Column(name = "vacatestatus")
    public String getVacatestatus() {
        return vacatestatus;
    }

    public void setVacatestatus(String vacatestatus) {
        this.vacatestatus = vacatestatus;
    }

    @Column(name = "status")
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
