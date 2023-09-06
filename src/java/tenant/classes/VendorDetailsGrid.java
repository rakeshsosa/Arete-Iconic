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
 * @author vinay
 */
@Entity
@Table(name = "vendor_details_grid", schema = "arete_tms")  
public class VendorDetailsGrid implements java.io.Serializable{
    
    private Integer sno;
    private String orgId;
    private String userId;
    private String vendorCode;
    private String supplierName;
    private String designation;
    private String mobile;
    private String altmobile;
    private String email;
    private Date lastmodifiedDate;
    private String status;

    public VendorDetailsGrid() {
    }

    public VendorDetailsGrid(String orgId, String userId, String vendorCode, String supplierName, String designation, String mobile, String altmobile, String email, Date lastmodifiedDate, String status) {
        this.orgId = orgId;
        this.userId = userId;
        this.vendorCode = vendorCode;
        this.supplierName = supplierName;
        this.designation = designation;
        this.mobile = mobile;
        this.altmobile = altmobile;
        this.email = email;
        this.lastmodifiedDate = lastmodifiedDate;
        this.status = status;
    }

    public VendorDetailsGrid(Integer sno, String orgId, String userId, String vendorCode, String supplierName, String designation, String mobile, String altmobile, String email, Date lastmodifiedDate, String status) {
        this.sno = sno;
        this.orgId = orgId;
        this.userId = userId;
        this.vendorCode = vendorCode;
        this.supplierName = supplierName;
        this.designation = designation;
        this.mobile = mobile;
        this.altmobile = altmobile;
        this.email = email;
        this.lastmodifiedDate = lastmodifiedDate;
        this.status = status;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "s_no", unique = true, nullable = false)
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

    @Column(name = "vendor_code")
    public String getVendorCode() {
        return vendorCode;
    }

    public void setVendorCode(String vendorCode) {
        this.vendorCode = vendorCode;
    }

    @Column(name = "supplier_name")
    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    @Column(name = "designation")
    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    @Column(name = "mobile_no")
    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    @Column(name = "alternate_mobile_no")
    public String getAltmobile() {
        return altmobile;
    }

    public void setAltmobile(String altmobile) {
        this.altmobile = altmobile;
    }

    @Column(name = "email_id")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "lastmodified_date", length = 19)
    public Date getLastmodifiedDate() {
        return lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }

    @Column(name = "status")
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
    
}
