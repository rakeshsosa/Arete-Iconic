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
 * @author Vaijayanti
 */
@Entity
@Table(name = "quotation_details1", schema = "arete_tms")          
public class QuotationDetails1 implements java.io.Serializable { 
    
    private Integer SNo;
    private String orgId;
    private String userId;
    private String  quotationId1;
    private String  enquiryId1;
    private String  propertyName1;
    private String  quotationNumber1; 
    private Date quotationDate1;
    private Date quotationExpiry1;
    private String currency1;
    private Boolean status;
    private Date lastmodifiedDate;
    
      public  QuotationDetails1(){

}

    public QuotationDetails1(Integer SNo, String orgId, String userId, String quotationId1, String enquiryId1, String propertyName1, String quotationNumber1, Date quotationDate1, Date quotationExpiry1, String currency1, Boolean status, Date lastmodifiedDate) {
        this.SNo = SNo;
        this.orgId = orgId;
        this.userId = userId;
        this.quotationId1 = quotationId1;
        this.enquiryId1 = enquiryId1;
        this.propertyName1 = propertyName1;
        this.quotationNumber1 = quotationNumber1;
        this.quotationDate1 = quotationDate1;
        this.quotationExpiry1 = quotationExpiry1;
        this.currency1 = currency1;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public QuotationDetails1(String orgId, String userId, String quotationId1, String enquiryId1, String propertyName1, String quotationNumber1, Date quotationDate1, Date quotationExpiry1, String currency1, Boolean status, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.quotationId1 = quotationId1;
        this.enquiryId1 = enquiryId1;
        this.propertyName1 = propertyName1;
        this.quotationNumber1 = quotationNumber1;
        this.quotationDate1 = quotationDate1;
        this.quotationExpiry1 = quotationExpiry1;
        this.currency1 = currency1;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
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

    @Column(name = "quotation_id1")
    public String getQuotationId1() {
        return quotationId1;
    }

    public void setQuotationId1(String quotationId1) {
        this.quotationId1 = quotationId1;
    }

    @Column(name = "enquiry_id1")
    public String getEnquiryId1() {
        return enquiryId1;
    }

    public void setEnquiryId1(String enquiryId1) {
        this.enquiryId1 = enquiryId1;
    }

    @Column(name = "property_name1")
    public String getPropertyName1() {
        return propertyName1;
    }

    public void setPropertyName1(String propertyName1) {
        this.propertyName1 = propertyName1;
    }

    @Column(name = "quotation_number1")
    public String getQuotationNumber1() {
        return quotationNumber1;
    }

    public void setQuotationNumber1(String quotationNumber1) {
        this.quotationNumber1 = quotationNumber1;
    }

    @Column(name = "quotation_date1")
    public Date getQuotationDate1() {
        return quotationDate1;
    }

    public void setQuotationDate1(Date quotationDate1) {
        this.quotationDate1 = quotationDate1;
    }

    @Column(name = "quotation_expiry1")
    public Date getQuotationExpiry1() {
        return quotationExpiry1;
    }

    public void setQuotationExpiry1(Date quotationExpiry1) {
        this.quotationExpiry1 = quotationExpiry1;
    }

    @Column(name = "currency1")
    public String getCurrency1() {
        return currency1;
    }

    public void setCurrency1(String currency1) {
        this.currency1 = currency1;
    }

    @Column(name = "status")
    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    @Column(name = "last_modified_date")
    public Date getLastmodifiedDate() {
        return lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }

    
}
