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
 * @author vaijayanti
 */
@Entity
@Table(name = "rent_details1", schema = "arete_tms") 

public class RentDetails1 implements java.io.Serializable{
    private Integer sno;
    private String orgId;
    private String userId;
    private  String quotationNo21;
    private String unitNo121;
    private String rentPeriod21;
    private double chargesQuoted21;
    private double vatPercentage21;
    private double vatAmount21;
    private double totalAmount21;
    private Boolean status;
    private Date lastmodifiedDate;

     public RentDetails1(){
    
    }

    public RentDetails1(String orgId, String userId, String quotationNo21, String unitNo121, String rentPeriod21, double chargesQuoted21, double vatPercentage21, double vatAmount21, double totalAmount21, Boolean status, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.quotationNo21 = quotationNo21;
        this.unitNo121 = unitNo121;
        this.rentPeriod21 = rentPeriod21;
        this.chargesQuoted21 = chargesQuoted21;
        this.vatPercentage21 = vatPercentage21;
        this.vatAmount21 = vatAmount21;
        this.totalAmount21 = totalAmount21;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public RentDetails1(Integer sno, String orgId, String userId, String quotationNo21, String unitNo121, String rentPeriod21, double chargesQuoted21, double vatPercentage21, double vatAmount21, double totalAmount21, Boolean status, Date lastmodifiedDate) {
        this.sno = sno;
        this.orgId = orgId;
        this.userId = userId;
        this.quotationNo21 = quotationNo21;
        this.unitNo121 = unitNo121;
        this.rentPeriod21 = rentPeriod21;
        this.chargesQuoted21 = chargesQuoted21;
        this.vatPercentage21 = vatPercentage21;
        this.vatAmount21 = vatAmount21;
        this.totalAmount21 = totalAmount21;
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

    @Column(name = "quotation_number1")
    public String getQuotationNo21() {
        return quotationNo21;
    }

    public void setQuotationNo21(String quotationNo21) {
        this.quotationNo21 = quotationNo21;
    }

    @Column(name = "unit_no21")
    public String getUnitNo121() {
        return unitNo121;
    }

    public void setUnitNo121(String unitNo121) {
        this.unitNo121 = unitNo121;
    }

    @Column(name = "rent_period21")
    public String getRentPeriod21() {
        return rentPeriod21;
    }

    public void setRentPeriod21(String rentPeriod21) {
        this.rentPeriod21 = rentPeriod21;
    }

    @Column(name = "charges_quoted21")
    public double getChargesQuoted21() {
        return chargesQuoted21;
    }

    public void setChargesQuoted21(double chargesQuoted21) {
        this.chargesQuoted21 = chargesQuoted21;
    }

    @Column(name = "vat_percentage21")
    public double getVatPercentage21() {
        return vatPercentage21;
    }

    public void setVatPercentage21(double vatPercentage21) {
        this.vatPercentage21 = vatPercentage21;
    }

    @Column(name = "vat_amount21")
    public double getVatAmount21() {
        return vatAmount21;
    }

    public void setVatAmount21(double vatAmount21) {
        this.vatAmount21 = vatAmount21;
    }

    @Column(name = "total_amount21")
    public double getTotalAmount21() {
        return totalAmount21;
    }

    public void setTotalAmount21(double totalAmount21) {
        this.totalAmount21 = totalAmount21;
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
