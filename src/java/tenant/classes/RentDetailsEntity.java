/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.classes;

import java.util.Date;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "invoice_rent_details", schema = "arete_tms")
public class RentDetailsEntity implements java.io.Serializable {
    
    private Integer rentDetailsPk;
    private String mappingKey;
    private String rentDesc;
    private Double rentAmt;
    private Double vatPercentage;
    private Double vatAmt;
    private Double totalAmt;
    private Date creationDate;
    private Boolean activeStatus;
    private String invoiceId;
    private String invoiceName;

    public RentDetailsEntity() {
    }

    public RentDetailsEntity(String mappingKey, String rentDesc, Double rentAmt, Double vatPercentage, Double vatAmt, Double totalAmt, Date creationDate, Boolean activeStatus, String invoiceId, String invoiceName) {
        this.mappingKey = mappingKey;
        this.rentDesc = rentDesc;
        this.rentAmt = rentAmt;
        this.vatPercentage = vatPercentage;
        this.vatAmt = vatAmt;
        this.totalAmt = totalAmt;
        this.creationDate = creationDate;
        this.activeStatus = activeStatus;
        this.invoiceId = invoiceId;
        this.invoiceName = invoiceName;
    }

    public RentDetailsEntity(Integer rentDetailsPk, String mappingKey, String rentDesc, Double rentAmt, Double vatPercentage, Double vatAmt, Double totalAmt, Date creationDate, Boolean activeStatus, String invoiceId, String invoiceName) {
        this.rentDetailsPk = rentDetailsPk;
        this.mappingKey = mappingKey;
        this.rentDesc = rentDesc;
        this.rentAmt = rentAmt;
        this.vatPercentage = vatPercentage;
        this.vatAmt = vatAmt;
        this.totalAmt = totalAmt;
        this.creationDate = creationDate;
        this.activeStatus = activeStatus;
        this.invoiceId = invoiceId;
        this.invoiceName = invoiceName;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="rent_details_pk")
    public Integer getRentDetailsPk() {
        return rentDetailsPk;
    }

    public void setRentDetailsPk(Integer rentDetailsPk) {
        this.rentDetailsPk = rentDetailsPk;
    }

    @Column(name="mapping_key")
    public String getMappingKey() {
        return mappingKey;
    }

    public void setMappingKey(String mappingKey) {
        this.mappingKey = mappingKey;
    }

    @Column(name="rent_desc")
    public String getRentDesc() {
        return rentDesc;
    }

    public void setRentDesc(String rentDesc) {
        this.rentDesc = rentDesc;
    }

    @Column(name="rent_amt")
    public Double getRentAmt() {
        return rentAmt;
    }

    public void setRentAmt(Double rentAmt) {
        this.rentAmt = rentAmt;
    }

     @Column(name="vat_percentage")
    public Double getVatPercentage() {
        return vatPercentage;
    }

    public void setVatPercentage(Double vatPercentage) {
        this.vatPercentage = vatPercentage;
    }

    @Column(name="vat_amt")
    public Double getVatAmt() {
        return vatAmt;
    }

    public void setVatAmt(Double vatAmt) {
        this.vatAmt = vatAmt;
    }

    @Column(name="total_amt")
    public Double getTotalAmt() {
        return totalAmt;
    }

    public void setTotalAmt(Double totalAmt) {
        this.totalAmt = totalAmt;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="creation_date")
    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    @Column(name="active_status",columnDefinition = "default=true")
    public Boolean getActiveStatus() {
        return activeStatus;
    }

    public void setActiveStatus(Boolean activeStatus) {
        this.activeStatus = activeStatus;
    }

    @Column(name="invoice_id")
    public String getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(String invoiceId) {
        this.invoiceId = invoiceId;
    }

    @Column(name="invoice_name")
    public String getInvoiceName() {
        return invoiceName;
    }

    public void setInvoiceName(String invoiceName) {
        this.invoiceName = invoiceName;
    } 
	 
}
