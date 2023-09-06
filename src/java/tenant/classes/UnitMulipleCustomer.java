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
@Table(name = "unit_multiple_customer", schema = "arete_tms"
)      
public class UnitMulipleCustomer implements java.io.Serializable{
    
    private Integer sno;
    private String orgId;
    private String userId;
    private String customerType;
    private String contactPersonName;
    private String emailId;
    private String phoneNumber;
    private String contractCode;
    private String unitNo;
    private String status;
    private Date creationDate;
    private Date lastmodifiedDate;
    
    public UnitMulipleCustomer(){
        
    }

    public UnitMulipleCustomer(String orgId, String userId, String customerType, String contactPersonName, String emailId, String phoneNumber,
            String contractCode, String unitNo, String status, Date creationDate, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.customerType = customerType;
        this.contactPersonName = contactPersonName;
        this.emailId = emailId;
        this.phoneNumber = phoneNumber;
        this.contractCode = contractCode;
        this.unitNo = unitNo;
        this.status = status;
        this.creationDate = creationDate;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public UnitMulipleCustomer(Integer sno, String orgId, String userId, String customerType, String contactPersonName, String emailId, 
            String phoneNumber, String contractCode, String unitNo, String status, Date creationDate, Date lastmodifiedDate) {
        this.sno = sno;
        this.orgId = orgId;
        this.userId = userId;
        this.customerType = customerType;
        this.contactPersonName = contactPersonName;
        this.emailId = emailId;
        this.phoneNumber = phoneNumber;
        this.contractCode = contractCode;
        this.unitNo = unitNo;
        this.status = status;
        this.creationDate = creationDate;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "SNO", unique = true, nullable = false)
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
    
    @Column(name = "customer_type")
    public String getCustomerType() {
        return customerType;
    }

    public void setCustomerType(String customerType) {
        this.customerType = customerType;
    }

    @Column(name = "contact_person_name")
    public String getContactPersonName() {
        return contactPersonName;
    }

    public void setContactPersonName(String contactPersonName) {
        this.contactPersonName = contactPersonName;
    }

    @Column(name = "email_id")
    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    @Column(name = "phone_number")
    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
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

    @Override
    public String toString() {
        return "UnitMulipleCustomer{" + "sno=" + sno + ", orgId=" + orgId + ", userId=" + userId + ", customerType=" + customerType + ", contactPersonName=" + contactPersonName + ", emailId=" + emailId + ", phoneNumber=" + phoneNumber + ", contractCode=" + contractCode + ", unitNo=" + unitNo + ", status=" + status + ", creationDate=" + creationDate + ", lastmodifiedDate=" + lastmodifiedDate + '}';
    }
    
    
}
