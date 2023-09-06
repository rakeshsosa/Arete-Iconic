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
@Table(name = "service_details", schema = "arete_tms")        
public class ServiceDetails implements java.io.Serializable{
    private Integer sno;
    private String orgId;
    private String userId;
    private String quotationNo;
    private String serviceCategory;
    private String serviceName;
    private double chargesQuoted1;
    private double vatPercentage1;
    private double vatAmount1;
    private double totalAmount1;
    private String securityDeposit;
    private String advance;
    private Boolean status;
    private Date lastmodifiedDate;
    
    
    public ServiceDetails(){
    
    }

    public ServiceDetails(String orgId, String userId, String quotationNo, String serviceCategory, String serviceName, double chargesQuoted1, double vatPercentage1, double vatAmount1, double totalAmount1, String securityDeposit, String advance, Boolean status, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.quotationNo = quotationNo;
        this.serviceCategory = serviceCategory;
        this.serviceName = serviceName;
        this.chargesQuoted1 = chargesQuoted1;
        this.vatPercentage1 = vatPercentage1;
        this.vatAmount1 = vatAmount1;
        this.totalAmount1 = totalAmount1;
        this.securityDeposit = securityDeposit;
        this.advance = advance;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public ServiceDetails(Integer sno, String orgId, String userId, String quotationNo, String serviceCategory, String serviceName, double chargesQuoted1, double vatPercentage1, double vatAmount1, double totalAmount1, String securityDeposit, String advance, Boolean status, Date lastmodifiedDate) {
        this.sno = sno;
        this.orgId = orgId;
        this.userId = userId;
        this.quotationNo = quotationNo;
        this.serviceCategory = serviceCategory;
        this.serviceName = serviceName;
        this.chargesQuoted1 = chargesQuoted1;
        this.vatPercentage1 = vatPercentage1;
        this.vatAmount1 = vatAmount1;
        this.totalAmount1 = totalAmount1;
        this.securityDeposit = securityDeposit;
        this.advance = advance;
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

      @Column(name = "org_id", length = 50)
    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

     @Column(name = "user_id", length = 50)
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name = "service_category")
    public String getServiceCategory() {
        return serviceCategory;
    }

    public void setServiceCategory(String serviceCategory) {
        this.serviceCategory = serviceCategory;
    }

    @Column(name = "service_name")
    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    
    @Column(name = "security_deposit")
    public String getSecurityDeposit() {
        return securityDeposit;
    }

    public void setSecurityDeposit(String securityDeposit) {
        this.securityDeposit = securityDeposit;
    }

      @Column(name = "advance")
    public String getAdvance() {
        return advance;
    }

    public void setAdvance(String advance) {
        this.advance = advance;
    }

    @Column(name = "status")
    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
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
    
    @Column(name = "quotation_number")
    public String getQuotationNo() {
        return quotationNo;
    }

    public void setQuotationNo(String quotationNo) {
        this.quotationNo = quotationNo;
    }
    @Column(name = "charges_quoted1")
    public double getChargesQuoted1() {
        return chargesQuoted1;
    }

    public void setChargesQuoted1(double chargesQuoted1) {
        this.chargesQuoted1 = chargesQuoted1;
    }
    
    @Column(name = "vat_percentage1")
    public double getVatPercentage1() {
        return vatPercentage1;
    }

    public void setVatPercentage1(double vatPercentage1) {
        this.vatPercentage1 = vatPercentage1;
    }

    @Column(name = "vat_amount1")
    public double getVatAmount1() {
        return vatAmount1;
    }

    public void setVatAmount1(double vatAmount1) {
        this.vatAmount1 = vatAmount1;
    }

    @Column(name = "total_amount1")
    public double getTotalAmount1() {
        return totalAmount1;
    }

    public void setTotalAmount1(double totalAmount1) {
        this.totalAmount1 = totalAmount1;
    }

    
}
