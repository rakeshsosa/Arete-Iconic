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
 * @author admin
 */
@Entity
@Table(name = "tenant_profiling", schema = "arete_tms")        
public class TenantProfilings implements java.io.Serializable{
    
    private Integer sno;
    private String orgId;
    private String userId;    
    private String propertyName;
    private String unitNumber;
    private String customerName;
    private Date contractStartDate;
    private Date contractEndDate;
    private String customerReference;
    private String tenantName;
    private Date billingDate;
    private Date renewalDate;
    private String vacateCode;
    private Date vacateNoticeDate;
    private String vacateReasonType;
    private Date tenatativeVacateDate;
    private String vacateLetterAttachment;
    private Boolean doYouWantToRegister;
    private String TenantPhone;
    private String TenantEmail;
    private String TenantIdcardType;
    private String TenantCardNum;
    private String Tenantaddress;
    private String Tenantattachment;
    private Date lastmodifiedDate;
    private Boolean status;

    public TenantProfilings() {
    }

    public TenantProfilings(String orgId, String userId, String propertyName, String unitNumber, String customerName, Date contractStartDate, Date contractEndDate, String customerReference, String tenantName, Date billingDate, Date renewalDate, String vacateCode, Date vacateNoticeDate, String vacateReasonType, Date tenatativeVacateDate, String vacateLetterAttachment,
            Boolean doYouWantToRegister, String TenantPhone, String TenantEmail, String TenantIdcardType, String TenantCardNum, String Tenantaddress, String Tenantattachment, Date lastmodifiedDate, Boolean status) {
        this.orgId = orgId;
        this.userId = userId;
        this.propertyName = propertyName;
        this.unitNumber = unitNumber;
        this.customerName = customerName;
        this.contractStartDate = contractStartDate;
        this.contractEndDate = contractEndDate;
        this.customerReference = customerReference;
        this.tenantName = tenantName;
        this.billingDate = billingDate;
        this.renewalDate = renewalDate;
        this.vacateCode = vacateCode;
        this.vacateNoticeDate = vacateNoticeDate;
        this.vacateReasonType = vacateReasonType;
        this.tenatativeVacateDate = tenatativeVacateDate;
        this.vacateLetterAttachment = vacateLetterAttachment;
        this.doYouWantToRegister = doYouWantToRegister;
        this.TenantPhone = TenantPhone;
        this.TenantEmail = TenantEmail;
        this.TenantIdcardType = TenantIdcardType;
        this.TenantCardNum = TenantCardNum;
        this.Tenantaddress = Tenantaddress;
        this.Tenantattachment = Tenantattachment;
        this.lastmodifiedDate = lastmodifiedDate;
        this.status = status;
    }

    public TenantProfilings(Integer sno, String orgId, String userId, String propertyName, String unitNumber, String customerName, Date contractStartDate, Date contractEndDate, String customerReference, String tenantName, Date billingDate, Date renewalDate, String vacateCode, Date vacateNoticeDate, String vacateReasonType, Date tenatativeVacateDate, String vacateLetterAttachment,
            Boolean doYouWantToRegister, String TenantPhone, String TenantEmail, String TenantIdcardType, String TenantCardNum, String Tenantaddress, String Tenantattachment, Date lastmodifiedDate, Boolean status) {
        this.sno = sno;
        this.orgId = orgId;
        this.userId = userId;
        this.propertyName = propertyName;
        this.unitNumber = unitNumber;
        this.customerName = customerName;
        this.contractStartDate = contractStartDate;
        this.contractEndDate = contractEndDate;
        this.customerReference = customerReference;
        this.tenantName = tenantName;
        this.billingDate = billingDate;
        this.renewalDate = renewalDate;
        this.vacateCode = vacateCode;
        this.vacateNoticeDate = vacateNoticeDate;
        this.vacateReasonType = vacateReasonType;
        this.tenatativeVacateDate = tenatativeVacateDate;
        this.vacateLetterAttachment = vacateLetterAttachment;
        this.doYouWantToRegister = doYouWantToRegister;
        this.TenantPhone = TenantPhone;
        this.TenantEmail = TenantEmail;
        this.TenantIdcardType = TenantIdcardType;
        this.TenantCardNum = TenantCardNum;
        this.Tenantaddress = Tenantaddress;
        this.Tenantattachment = Tenantattachment;
        this.lastmodifiedDate = lastmodifiedDate;
        this.status = status;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "s_no")
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
    @Column(name = "property_name")
    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }
    @Column(name = "unit_number")
    public String getUnitNumber() {
        return unitNumber;
    }

    public void setUnitNumber(String unitNumber) {
        this.unitNumber = unitNumber;
    }
    @Column(name = "customer_name")
    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
    
    @Column(name = "customer_reference")
    public String getCustomerReference() {
        return customerReference;
    }

    public void setCustomerReference(String customerReference) {
        this.customerReference = customerReference;
    }
    @Column(name = "tenant_name")
    public String getTenantName() {
        return tenantName;
    }

    public void setTenantName(String tenantName) {
        this.tenantName = tenantName;
    }
    
   
    @Column(name = "vacate_code")
    public String getVacateCode() {
        return vacateCode;
    }

    public void setVacateCode(String vacateCode) {
        this.vacateCode = vacateCode;
    }
    
    @Column(name = "vacate_reason_type")
    public String getVacateReasonType() {
        return vacateReasonType;
    }

    public void setVacateReasonType(String vacateReasonType) {
        this.vacateReasonType = vacateReasonType;
    }
    
    @Column(name = "vacate_letter_att")
    public String getVacateLetterAttachment() {
        return vacateLetterAttachment;
    }

    public void setVacateLetterAttachment(String vacateLetterAttachment) {
        this.vacateLetterAttachment = vacateLetterAttachment;
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
    @Column(name = "contract_start_date")
    public Date getContractStartDate() {
        return contractStartDate;
    }

    public void setContractStartDate(Date contractStartDate) {
        this.contractStartDate = contractStartDate;
    }
    @Column(name = "contract_end_date")
    public Date getContractEndDate() {
        return contractEndDate;
    }

    public void setContractEndDate(Date contractEndDate) {
        this.contractEndDate = contractEndDate;
    }
    @Column(name = "billing_date")
    public Date getBillingDate() {
        return billingDate;
    }

    public void setBillingDate(Date billingDate) {
        this.billingDate = billingDate;
    }
    @Column(name = "renewal_date")
    public Date getRenewalDate() {
        return renewalDate;
    }

    public void setRenewalDate(Date renewalDate) {
        this.renewalDate = renewalDate;
    }
    
    @Column(name = "vacate_notice_date")
    public Date getVacateNoticeDate() {
        return vacateNoticeDate;
    }

    public void setVacateNoticeDate(Date vacateNoticeDate) {
        this.vacateNoticeDate = vacateNoticeDate;
    }
    @Column(name = "tentative_vacate_date")
    public Date getTenatativeVacateDate() {
        return tenatativeVacateDate;
    }

    public void setTenatativeVacateDate(Date tenatativeVacateDate) {
        this.tenatativeVacateDate = tenatativeVacateDate;
    }

    @Column(name = "tenant_phone")
    public String getTenantPhone() {
        return TenantPhone;
    }

    public void setTenantPhone(String TenantPhone) {
        this.TenantPhone = TenantPhone;
    }

    @Column(name = "tenant_email")
    public String getTenantEmail() {
        return TenantEmail;
    }

    public void setTenantEmail(String TenantEmail) {
        this.TenantEmail = TenantEmail;
    }

    @Column(name = "id_card_type")
    public String getTenantIdcardType() {
        return TenantIdcardType;
    }

    public void setTenantIdcardType(String TenantIdcardType) {
        this.TenantIdcardType = TenantIdcardType;
    }

    @Column(name = "tenant_card_no")
    public String getTenantCardNum() {
        return TenantCardNum;
    }

    public void setTenantCardNum(String TenantCardNum) {
        this.TenantCardNum = TenantCardNum;
    }

    @Column(name = "tenant_address")
    public String getTenantaddress() {
        return Tenantaddress;
    }

    public void setTenantaddress(String Tenantaddress) {
        this.Tenantaddress = Tenantaddress;
    }

    @Column(name = "tenant_attachment")
    public String getTenantattachment() {
        return Tenantattachment;
    }

    public void setTenantattachment(String Tenantattachment) {
        this.Tenantattachment = Tenantattachment;
    }

    @Column(name = "do_yo_want_to_register")
    public Boolean getDoYouWantToRegister() {
        return doYouWantToRegister;
    }

    public void setDoYouWantToRegister(Boolean doYouWantToRegister) {
        this.doYouWantToRegister = doYouWantToRegister;
    }
    
    
    
}
