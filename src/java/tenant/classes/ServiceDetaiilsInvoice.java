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

@Entity
@Table(name = "service_details_invoice", schema = "arete_tms")
public class ServiceDetaiilsInvoice implements java.io.Serializable {

    private Integer serviceDetailsPk;
    private String userId;
    private String orgId;
    private String invoiceNo;
    private String invoiceType;
    private String serviceCategory;
    private String serviceDesc;
    private Double serviceChargeAmount;
    private Double vatPercentage;
    private Double vat;
    private Double totalAmount;
    private Date creationDate;
    private Date lastModifiedDate;

    public ServiceDetaiilsInvoice() {
    }

    public ServiceDetaiilsInvoice(String userId, String orgId, String invoiceNo, String invoiceType, String serviceCategory, String serviceDesc, Double serviceChargeAmount, 
            Double vatPercentage, Double vat, Double totalAmount, Date creationDate, Date lastModifiedDate) {
        this.userId = userId;
        this.orgId = orgId;
        this.invoiceNo = invoiceNo;
        this.invoiceType = invoiceType;
        this.serviceCategory = serviceCategory;
        this.serviceDesc = serviceDesc;
        this.serviceChargeAmount = serviceChargeAmount;
        this.vatPercentage = vatPercentage;
        this.vat = vat;
        this.totalAmount = totalAmount;
        this.creationDate = creationDate;
        this.lastModifiedDate = lastModifiedDate;
    }

    public ServiceDetaiilsInvoice(Integer serviceDetailsPk, String userId, String orgId, String invoiceNo, String invoiceType, String serviceCategory, String serviceDesc, 
            Double serviceChargeAmount, Double vatPercentage, Double vat, Double totalAmount, Date creationDate, Date lastModifiedDate) {
        this.serviceDetailsPk = serviceDetailsPk;
        this.userId = userId;
        this.orgId = orgId;
        this.invoiceNo = invoiceNo;
        this.invoiceType = invoiceType;
        this.serviceCategory = serviceCategory;
        this.serviceDesc = serviceDesc;
        this.serviceChargeAmount = serviceChargeAmount;
        this.vatPercentage = vatPercentage;
        this.vat = vat;
        this.totalAmount = totalAmount;
        this.creationDate = creationDate;
        this.lastModifiedDate = lastModifiedDate;
    }
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="serviceDetails_pk")
    public Integer getServiceDetailsPk() {
        return serviceDetailsPk;
    }

    public void setServiceDetailsPk(Integer serviceDetailsPk) {
        this.serviceDetailsPk = serviceDetailsPk;
    }

    @Column(name="user_id")
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name="org_id")
    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name="invoice_no")
    public String getInvoiceNo() {
        return invoiceNo;
    }

    public void setInvoiceNo(String invoiceNo) {
        this.invoiceNo = invoiceNo;
    }

    @Column(name="invoice_type")
    public String getInvoiceType() {
        return invoiceType;
    }

    public void setInvoiceType(String invoiceType) {
        this.invoiceType = invoiceType;
    }

    @Column(name="service_catg")
    public String getServiceCategory() {
        return serviceCategory;
    }

    public void setServiceCategory(String serviceCategory) {
        this.serviceCategory = serviceCategory;
    }

    @Column(name="service_desc")
    public String getServiceDesc() {
        return serviceDesc;
    }

    public void setServiceDesc(String serviceDesc) {
        this.serviceDesc = serviceDesc;
    }

    @Column(name="service_charge_amt")
    public Double getServiceChargeAmount() {
        return serviceChargeAmount;
    }

    public void setServiceChargeAmount(Double serviceChargeAmount) {
        this.serviceChargeAmount = serviceChargeAmount;
    }

    @Column(name="vat_perct")
    public Double getVatPercentage() {
        return vatPercentage;
    }

    public void setVatPercentage(Double vatPercentage) {
        this.vatPercentage = vatPercentage;
    }

    @Column(name="vat_amt")
    public Double getVat() {
        return vat;
    }

    public void setVat(Double vat) {
        this.vat = vat;
    }

    @Column(name="total_amt")
    public Double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }

    @Column(name="cdate")
    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    @Column(name="lastmodified_date")
    public Date getLastModifiedDate() {
        return lastModifiedDate;
    }

    public void setLastModifiedDate(Date lastModifiedDate) {
        this.lastModifiedDate = lastModifiedDate;
    }
    
}
