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
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
/**
 *
 * @author vinay
 */
@Entity
@Table(name = "enqueries", schema = "arete_tms") 
public class Enqueries implements java.io.Serializable{
    
    private Integer sNo;
    private String userId;
    private String enquiryId;
    private String coutmerName;
    private String companyName;
    private String contactNumber;
    private Date enquiryDate;
    private String email;
    private String property;
    private String unit;
    private String remarks;
    private Date lastmodifiedDate;
    private Boolean status;

    public Enqueries() {
    }

    public Enqueries(String userId, String enquiryId, String coutmerName, String companyName, String contactNumber, Date enquiryDate, String email, String property, String unit, String remarks, Date lastmodifiedDate, Boolean status) {
        this.userId = userId;
        this.enquiryId = enquiryId;
        this.coutmerName = coutmerName;
        this.companyName = companyName;
        this.contactNumber = contactNumber;
        this.enquiryDate = enquiryDate;
        this.email = email;
        this.property = property;
        this.unit = unit;
        this.remarks = remarks;
        this.lastmodifiedDate = lastmodifiedDate;
        this.status = status;
    }

    public Enqueries(Integer sNo, String userId, String enquiryId, String coutmerName, String companyName, String contactNumber, Date enquiryDate, String email, String property, String unit, String remarks, Date lastmodifiedDate, Boolean status) {
        this.sNo = sNo;
        this.userId = userId;
        this.enquiryId = enquiryId;
        this.coutmerName = coutmerName;
        this.companyName = companyName;
        this.contactNumber = contactNumber;
        this.enquiryDate = enquiryDate;
        this.email = email;
        this.property = property;
        this.unit = unit;
        this.remarks = remarks;
        this.lastmodifiedDate = lastmodifiedDate;
        this.status = status;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "s_no")
    public Integer getsNo() {
        return sNo;
    }

    public void setsNo(Integer sNo) {
        this.sNo = sNo;
    }

    @Column(name = "user_id")
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name = "enquiry_id")
    public String getEnquiryId() {
        return enquiryId;
    }

    public void setEnquiryId(String enquiryId) {
        this.enquiryId = enquiryId;
    }

    @Column(name = "coustomerName")
    public String getCoutmerName() {
        return coutmerName;
    }

    public void setCoutmerName(String coutmerName) {
        this.coutmerName = coutmerName;
    }

    @Column(name = "company_name")
    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    @Column(name = "contact_number")
    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    @Column(name = "enquiry_date")
    public Date getEnquiryDate() {
        return enquiryDate;
    }

    public void setEnquiryDate(Date enquiryDate) {
        this.enquiryDate = enquiryDate;
    }

    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Column(name = "property")
    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property;
    }

    @Column(name = "unit")
    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    @Column(name = "remarks")
    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Column(name = "last_modified_date")
    public Date getLastmodifiedDate() {
        return lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }

    @Column(name = "status")
    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }
    
    
    
}
