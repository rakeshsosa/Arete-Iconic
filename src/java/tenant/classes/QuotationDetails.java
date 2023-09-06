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
@Table(name = "quotation_details", schema = "arete_tms")              
public class QuotationDetails implements java.io.Serializable { 
    
    private Integer SNo;
    private String orgId;
    private String userId;
    private String  quotationId;
    private String  enquiryId;
    private String  propertyName;
    private String  quotationNumber; 
    private Date quotationDate;
    private Date quotationExpiry;
    private String currency;
    private Boolean status;
    private Date lastmodifiedDate;
    
      public  QuotationDetails(){

}

    public QuotationDetails(String orgId, String userId, String  quotationId,String  enquiryId,String  propertyName,String  quotationNumber, Date quotationDate,
            Date quotationExpiry, String currency,Boolean status,Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.quotationNumber = quotationNumber;
        this.quotationId = quotationId;
        this.enquiryId = enquiryId;
        this.propertyName = propertyName;
        this.quotationDate = quotationDate;
        this.quotationExpiry = quotationExpiry;
        this.currency = currency;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }
    
    


    public QuotationDetails(Integer SNo, String orgId, String userId, String  quotationId,String  enquiryId,String  propertyName,String quotationNumber, Date quotationDate,
            Date quotationExpiry, String currency,Boolean status,Date lastmodifiedDate) {
        this.SNo = SNo;
        this.orgId = orgId;
        this.userId = userId;
        this.quotationNumber = quotationNumber;
        this.quotationId = quotationId;
        this.enquiryId = enquiryId;
        this.propertyName = propertyName;
        this.quotationDate = quotationDate;
        this.quotationExpiry = quotationExpiry;
        this.currency = currency;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        
    }

//    public QuotationDetails(String orgId, String userId, String quotationNo, Date quotationDate1, Date quotationExpiry1, String currency) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }


    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "s_no", unique = true, nullable = false)
    public Integer getSNo() {
        return SNo;
    }

    public void setSNo(Integer SNo) {
        this.SNo = SNo;
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

     @Column(name = "quotation_number")
    public String  getQuotationNumber() {
        return quotationNumber;
    }

    public void setQuotationNumber(String quotationNumber) {
        this.quotationNumber = quotationNumber;
    }

     @Column(name = "quotation_date")
    public Date getQuotationDate() {
        return quotationDate;
    }

    public void setQuotationDate(Date quotationDate) {
        this.quotationDate = quotationDate;
    }

    @Column(name = "quotation_expiry")
    public Date getQuotationExpiry() {
        return quotationExpiry;
    }

    public void setQuotationExpiry(Date quotationExpiry) {
        this.quotationExpiry = quotationExpiry;
    }

    @Column(name = "currency")
    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
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

    @Column(name = "quotation_id")
    public String getQuotationId() {
        return quotationId;
    }

    public void setQuotationId(String quotationId) {
        this.quotationId = quotationId;
    }

    @Column(name = "enquiry_id")
    public String getEnquiryId() {
        return enquiryId;
    }

    public void setEnquiryId(String enquiryId) {
        this.enquiryId = enquiryId;
    }

    @Column(name = "property_name")
    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }
    
}
