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
@Table(name = "contract_unit_details", schema = "arete_tms"
)      
public class ContractUnitDetails  implements java.io.Serializable{
    
    private Integer sno;
    private String orgId;
    private String userId;
    private String contractode;
    private String contractType;
    private String contractCategory;
    private String isPeriodcheckBox;
    private String contractPeriod;
    private String unitDescription;
    private String propertyName;
    private String propertyCode;
    private Integer monthlyRentIncome;
    private Integer expectedSecurityDeposit;
    private Integer serviceCharges;
    private String paymentType;
    private Double vatPercent;
    private String unitNo;
    private Date startDate;
    private Date endDate;
    private Date renewalDate;
    private String renewalNotification;
    private String insuranceTagged;
    private String noticePeriod;
    private String actualRentIncome;
    private String actualYearlyIncome;
    private String status;
    private Date creationDate;
    private String rejectRemark;
    private Date lastmodifiedDate;
    
    public ContractUnitDetails(){
        
    }

    public ContractUnitDetails(String orgId, String userId, String contractode, String contractType, String contractCategory, 
            String isPeriodcheckBox, String contractPeriod, String unitDescription, String propertyName, String propertyCode, 
            Integer monthlyRentIncome, Integer expectedSecurityDeposit, Integer serviceCharges, String paymentType, Double vatPercent,
            String unitNo, Date startDate, Date endDate, Date renewalDate, String renewalNotification, String insuranceTagged, 
            String noticePeriod, String actualRentIncome, String actualYearlyIncome, String status, Date creationDate, String rejectRemark, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.contractode = contractode;
        this.contractType = contractType;
        this.contractCategory = contractCategory;
        this.isPeriodcheckBox = isPeriodcheckBox;
        this.contractPeriod = contractPeriod;
        this.unitDescription = unitDescription;
        this.propertyName = propertyName;
        this.propertyCode = propertyCode;
        this.monthlyRentIncome = monthlyRentIncome;
        this.expectedSecurityDeposit = expectedSecurityDeposit;
        this.serviceCharges = serviceCharges;
        this.paymentType = paymentType;
        this.vatPercent = vatPercent;
        this.unitNo = unitNo;
        this.startDate = startDate;
        this.endDate = endDate;
        this.renewalDate = renewalDate;
        this.renewalNotification = renewalNotification;
        this.insuranceTagged = insuranceTagged;
        this.noticePeriod = noticePeriod;
        this.actualRentIncome = actualRentIncome;
        this.actualYearlyIncome = actualYearlyIncome;
        this.status = status;
        this.creationDate = creationDate;
        this.rejectRemark = rejectRemark;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public ContractUnitDetails(Integer sno, String orgId, String userId, String contractode, String contractType, String contractCategory,
            String isPeriodcheckBox, String contractPeriod, String unitDescription, String propertyName, String propertyCode, 
            Integer monthlyRentIncome, Integer expectedSecurityDeposit, Integer serviceCharges, String paymentType, Double vatPercent, 
            String unitNo, Date startDate, Date endDate, Date renewalDate, String renewalNotification, String insuranceTagged, String noticePeriod,
            String actualRentIncome, String actualYearlyIncome, String status, Date creationDate,String rejectRemark, Date lastmodifiedDate) {
        this.sno = sno;
        this.orgId = orgId;
        this.userId = userId;
        this.contractode = contractode;
        this.contractType = contractType;
        this.contractCategory = contractCategory;
        this.isPeriodcheckBox = isPeriodcheckBox;
        this.contractPeriod = contractPeriod;
        this.unitDescription = unitDescription;
        this.propertyName = propertyName;
        this.propertyCode = propertyCode;
        this.monthlyRentIncome = monthlyRentIncome;
        this.expectedSecurityDeposit = expectedSecurityDeposit;
        this.serviceCharges = serviceCharges;
        this.paymentType = paymentType;
        this.vatPercent = vatPercent;
        this.unitNo = unitNo;
        this.startDate = startDate;
        this.endDate = endDate;
        this.renewalDate = renewalDate;
        this.renewalNotification = renewalNotification;
        this.insuranceTagged = insuranceTagged;
        this.noticePeriod = noticePeriod;
        this.actualRentIncome = actualRentIncome;
        this.actualYearlyIncome = actualYearlyIncome;
        this.status = status;
        this.creationDate = creationDate;
        this.rejectRemark = rejectRemark;
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

    @Column(name = "contract_code")
    public String getContractode() {
        return contractode;
    }

    public void setContractode(String contractode) {
        this.contractode = contractode;
    }

    @Column(name = "contract_tyoe")
    public String getContractType() {
        return contractType;
    }

    public void setContractType(String contractType) {
        this.contractType = contractType;
    }

    @Column(name = "contract_category")
    public String getContractCategory() {
        return contractCategory;
    }

    public void setContractCategory(String contractCategory) {
        this.contractCategory = contractCategory;
    }

    @Column(name = "is_period_check_box")
    public String getIsPeriodcheckBox() {
        return isPeriodcheckBox;
    }

    public void setIsPeriodcheckBox(String isPeriodcheckBox) {
        this.isPeriodcheckBox = isPeriodcheckBox;
    }
    
    @Column(name = "contract_period")
    public String getContractPeriod() {
        return contractPeriod;
    }

    public void setContractPeriod(String contractPeriod) {
        this.contractPeriod = contractPeriod;
    }

    @Column(name = "unit_description")
    public String getUnitDescription() {
        return unitDescription;
    }

    public void setUnitDescription(String unitDescription) {
        this.unitDescription = unitDescription;
    }

    @Column(name = "property_name")
    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    @Column(name = "property_code")
    public String getPropertyCode() {
        return propertyCode;
    }

    public void setPropertyCode(String propertyCode) {
        this.propertyCode = propertyCode;
    }

    @Column(name = "monthly_rent_income")
    public Integer getMonthlyRentIncome() {
        return monthlyRentIncome;
    }

    public void setMonthlyRentIncome(Integer monthlyRentIncome) {
        this.monthlyRentIncome = monthlyRentIncome;
    }

    @Column(name = "expected_security_deposit")
    public Integer getExpectedSecurityDeposit() {
        return expectedSecurityDeposit;
    }

    public void setExpectedSecurityDeposit(Integer expectedSecurityDeposit) {
        this.expectedSecurityDeposit = expectedSecurityDeposit;
    }

    @Column(name = "service_charges")
    public Integer getServiceCharges() {
        return serviceCharges;
    }

    public void setServiceCharges(Integer serviceCharges) {
        this.serviceCharges = serviceCharges;
    }

    @Column(name = "payment_type")
    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    @Column(name = "vat_percent")
    public Double getVatPercent() {
        return vatPercent;
    }

    public void setVatPercent(Double vatPercent) {
        this.vatPercent = vatPercent;
    }

    @Column(name = "unit_no")
    public String getUnitNo() {
        return unitNo;
    }

    public void setUnitNo(String unitNo) {
        this.unitNo = unitNo;
    }

    @Column(name = "start_date")
    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    @Column(name = "end_date")
    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    @Column(name = "renewal_date")
    public Date getRenewalDate() {
        return renewalDate;
    }

    public void setRenewalDate(Date renewalDate) {
        this.renewalDate = renewalDate;
    }

    @Column(name = "renewal_notification")
    public String getRenewalNotification() {
        return renewalNotification;
    }

    public void setRenewalNotification(String renewalNotification) {
        this.renewalNotification = renewalNotification;
    }

    @Column(name = "insurence_tagged")
    public String getInsuranceTagged() {
        return insuranceTagged;
    }

    public void setInsuranceTagged(String insuranceTagged) {
        this.insuranceTagged = insuranceTagged;
    }

    @Column(name = "notice_period")
    public String getNoticePeriod() {
        return noticePeriod;
    }

    public void setNoticePeriod(String noticePeriod) {
        this.noticePeriod = noticePeriod;
    }

    @Column(name = "actual_rent_income")
    public String getActualRentIncome() {
        return actualRentIncome;
    }

    public void setActualRentIncome(String actualRentIncome) {
        this.actualRentIncome = actualRentIncome;
    }

    @Column(name = "actual_yearly_income")
    public String getActualYearlyIncome() {
        return actualYearlyIncome;
    }

    public void setActualYearlyIncome(String actualYearlyIncome) {
        this.actualYearlyIncome = actualYearlyIncome;
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

    @Column(name = "rejectRemark")
    public String getRejectRemark() {
        return rejectRemark;
    }

    public void setRejectRemark(String rejectRemark) {
        this.rejectRemark = rejectRemark;
    }
    
    
}
