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
@Table(name = "units_contract_template", schema = "arete_tms")
public class UnitsContractTemplate implements java.io.Serializable{
    
    private Integer sNo;
    private String userId;
    private String contractCategory;
    private String contractType;
    private String contractPeriod;
    private String unitType;
    private String unitDescription;
    private String propertyName;
    private String monthlyRentIncome;
    private String expectedSecurityDeposit;
    private String serviceCharges;
    private String paymentType;
    private String vat;
    private Boolean isFitOutApplicable;
    private String fitOutPeriod;
    private Date lastmodifiedDate;
    private Boolean status;

    public UnitsContractTemplate() {
    }

    public UnitsContractTemplate(String userId, String contractCategory, String contractType, String contractPeriod, String unitType, String unitDescription, String propertyName, String monthlyRentIncome, String expectedSecurityDeposit, String serviceCharges, String paymentType, String vat, Boolean isFitOutApplicable, String fitOutPeriod, Date lastmodifiedDate, Boolean status) {
        this.userId = userId;
        this.contractCategory = contractCategory;
        this.contractType = contractType;
        this.contractPeriod = contractPeriod;
        this.unitType = unitType;
        this.unitDescription = unitDescription;
        this.propertyName = propertyName;
        this.monthlyRentIncome = monthlyRentIncome;
        this.expectedSecurityDeposit = expectedSecurityDeposit;
        this.serviceCharges = serviceCharges;
        this.paymentType = paymentType;
        this.vat = vat;
        this.isFitOutApplicable = isFitOutApplicable;
        this.fitOutPeriod = fitOutPeriod;
        this.lastmodifiedDate = lastmodifiedDate;
        this.status = status;
    }

    public UnitsContractTemplate(Integer sNo, String userId, String contractCategory, String contractType, String contractPeriod, String unitType, String unitDescription, String propertyName, String monthlyRentIncome, String expectedSecurityDeposit, String serviceCharges, String paymentType, String vat, Boolean isFitOutApplicable, String fitOutPeriod, Date lastmodifiedDate, Boolean status) {
        this.sNo = sNo;
        this.userId = userId;
        this.contractCategory = contractCategory;
        this.contractType = contractType;
        this.contractPeriod = contractPeriod;
        this.unitType = unitType;
        this.unitDescription = unitDescription;
        this.propertyName = propertyName;
        this.monthlyRentIncome = monthlyRentIncome;
        this.expectedSecurityDeposit = expectedSecurityDeposit;
        this.serviceCharges = serviceCharges;
        this.paymentType = paymentType;
        this.vat = vat;
        this.isFitOutApplicable = isFitOutApplicable;
        this.fitOutPeriod = fitOutPeriod;
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

    @Column(name = "contract_category")
    public String getContractCategory() {
        return contractCategory;
    }

    public void setContractCategory(String contractCategory) {
        this.contractCategory = contractCategory;
    }

    @Column(name = "contract_type")
    public String getContractType() {
        return contractType;
    }

    public void setContractType(String contractType) {
        this.contractType = contractType;
    }

    @Column(name = "contract_period")
    public String getContractPeriod() {
        return contractPeriod;
    }

    public void setContractPeriod(String contractPeriod) {
        this.contractPeriod = contractPeriod;
    }

    @Column(name = "unit_type")
    public String getUnitType() {
        return unitType;
    }

    public void setUnitType(String unitType) {
        this.unitType = unitType;
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

    @Column(name = "monthly_rental_income")
    public String getMonthlyRentIncome() {
        return monthlyRentIncome;
    }

    public void setMonthlyRentIncome(String monthlyRentIncome) {
        this.monthlyRentIncome = monthlyRentIncome;
    }

    @Column(name = "expected_security_deposit")
    public String getExpectedSecurityDeposit() {
        return expectedSecurityDeposit;
    }

    public void setExpectedSecurityDeposit(String expectedSecurityDeposit) {
        this.expectedSecurityDeposit = expectedSecurityDeposit;
    }

    @Column(name = "service_charges")
    public String getServiceCharges() {
        return serviceCharges;
    }

    public void setServiceCharges(String serviceCharges) {
        this.serviceCharges = serviceCharges;
    }

    @Column(name = "payment_type")
    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    @Column(name = "vat")
    public String getVat() {
        return vat;
    }

    public void setVat(String vat) {
        this.vat = vat;
    }

    @Column(name = "is_fitout_applicable")
    public Boolean getIsFitOutApplicable() {
        return isFitOutApplicable;
    }

    public void setIsFitOutApplicable(Boolean isFitOutApplicable) {
        this.isFitOutApplicable = isFitOutApplicable;
    }

    @Column(name = "fit_out_period")
    public String getFitOutPeriod() {
        return fitOutPeriod;
    }

    public void setFitOutPeriod(String fitOutPeriod) {
        this.fitOutPeriod = fitOutPeriod;
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
