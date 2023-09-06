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
 * @author IT SUPPORT
 */
@Entity
@Table(name = "vendor_details", schema = "arete_tms")  
public class VendorDetails implements java.io.Serializable{
    
    private Integer sno;
    private String orgId;
    private String userId;
    private String vendorCode;
    private String businessType;
    private String businessName;
    private String postalCode;
    private String address;
    private String physicalAddress;
    private String regNo;
    private String vatNo;
    private String taxNo;
    private String supplierName;
    private String designation;
    private String mobile;
    private String altmobile;
    private String email;
    private String status;
    private Date lastmodifiedDate;


    public  VendorDetails(){

}

    public VendorDetails(String orgId, String userId, String vendorCode, String businessType, String businessName, 
            String postalCode, String address, String physicalAddress, String regNo, String vatNo, String taxNo,
            String supplierName, String designation, String mobile, String altmobile, String email, String status,
            Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
       this.vendorCode = vendorCode;
        this.businessType = businessType;
        this.businessName = businessName;
       this.postalCode = postalCode;
        this.address = address;
        this.physicalAddress = physicalAddress;
        this.regNo = regNo;
       this.vatNo = vatNo;
        this.taxNo = taxNo;
       this.supplierName = supplierName;
       this.designation = designation;
        this.mobile = mobile;
        this.altmobile = altmobile;
        this.email = email;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public VendorDetails(Integer sno, String orgId, String userId, String vendorCode, String businessType, String businessName, String postalCode, String address, String physicalAddress, String regNo, String vatNo, String taxNo, String supplierName, String designation, String mobile, String altmobile, String email, String status, Date lastmodifiedDate) {
        this.sno = sno;
        this.orgId = orgId;
       this.userId = userId;
        this.vendorCode = vendorCode;
       this.businessType = businessType;
        this.businessName = businessName;
       this.postalCode = postalCode;
        this.address = address;
        this.physicalAddress = physicalAddress;
        this.regNo = regNo;
        this.vatNo = vatNo;
        this.taxNo = taxNo;
       this.supplierName = supplierName;
        this.designation = designation;
        this.mobile = mobile;
        this.altmobile = altmobile;
        this.email = email;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
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

   @Column(name = "vendor_code")
    public String getVendorCode() {
        return vendorCode;
    }

    public void setVendorCode(String vendorCode) {
        this.vendorCode = vendorCode;
    }

   @Column(name = "business_type")
    public String getBusinessType() {
        return businessType;
    }

    public void setBusinessType(String businessType) {
        this.businessType = businessType;
    }

    @Column(name = "business_name")
    public String getBusinessName() {
        return businessName;
   }

    public void setBusinessName(String businessName) {
        this.businessName = businessName;
    }

    @Column(name = "postal_code")
    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }
    @Column(name = "business_address")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Column(name = "physical_address")
    public String getPhysicalAddress() {
        return physicalAddress;
    }

    public void setPhysicalAddress(String physicalAddress) {
        this.physicalAddress = physicalAddress;
    }

   @Column(name = "business_reg_no")
    public String getRegNo() {
        return regNo;
    }
   public void setRegNo(String regNo) {
        this.regNo = regNo;
    }

    @Column(name = "vat_no")
    public String getVatNo() {
        return vatNo;
    }

    public void setVatNo(String vatNo) {
        this.vatNo = vatNo;
    }

    @Column(name = "tax_no")
    public String getTaxNo() {
        return taxNo;
    }

    public void setTaxNo(String taxNo) {
        this.taxNo = taxNo;
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

      @Column(name = "STATUS")
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
