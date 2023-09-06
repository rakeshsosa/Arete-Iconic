/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.classes;

import java.sql.Timestamp;
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
 * @author ebs05
 */
@Entity
@Table(name = "item_supplier", schema = "arete_tms"
)
public class ItemSupplier implements java.io.Serializable {

    private Integer sno;
    private String userId;
    private String orgId;
    private String itemCode;
    private String supplierName;
    private String supplierCode;
    private String baseUom;
    private Double purchasePrice;
    private String uom1;
    private Double uom1Price;
    private String uom2;
    private Double uom2Price;
    private String uom3;
    private Double uom3Price;
    private String status;
    private Date lastmodifiedDate;

    public ItemSupplier() {
    }

    public ItemSupplier(String userId, String orgId, String itemCode, String supplierName, String supplierCode,
            Double purchasePrice, String status, Date lastmodifiedDate,
            String baseUom, String uom1, Double uom1Price, String uom2, Double uom2Price, String uom3, Double uom3Price) {
        this.userId = userId;
        this.orgId = orgId;
        this.itemCode = itemCode;
        this.supplierName = supplierName;
        this.supplierCode = supplierCode;
        this.purchasePrice = purchasePrice;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.baseUom = baseUom;
        this.uom1 = uom1;
        this.uom1Price = uom1Price;
        this.uom2 = uom2;
        this.uom2Price = uom2Price;
        this.uom3 = uom3;
        this.uom3Price = uom3Price;
    }

    public ItemSupplier(Integer sno, String userId, String orgId, String itemCode, String supplierName, String supplierCode,
            Double purchasePrice, String status, Date lastmodifiedDate,
            String baseUom, String uom1, Double uom1Price, String uom2, Double uom2Price, String uom3, Double uom3Price) {
        this.sno = sno;
        this.userId = userId;
        this.orgId = orgId;
        this.itemCode = itemCode;
        this.supplierName = supplierName;
        this.supplierCode = supplierCode;
        this.purchasePrice = purchasePrice;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.baseUom = baseUom;
        this.uom1 = uom1;
        this.uom1Price = uom1Price;
        this.uom2 = uom2;
        this.uom2Price = uom2Price;
        this.uom3 = uom3;
        this.uom3Price = uom3Price;
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

    @Column(name = "user_id", length = 50)
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name = "org_id", length = 50)
    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name = "item_code", length = 50)
    public String getItemCode() {
        return itemCode;
    }

    public void setItemCode(String itemCode) {
        this.itemCode = itemCode;
    }

    @Column(name = "supplier_name", length = 50)
    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    @Column(name = "supplier_code", length = 50)
    public String getSupplierCode() {
        return supplierCode;
    }

    public void setSupplierCode(String supplierCode) {
        this.supplierCode = supplierCode;
    }

    @Column(name = "base_uom", length = 50)
    public String getBaseUom() {
        return baseUom;
    }

    public void setBaseUom(String baseUom) {
        this.baseUom = baseUom;
    }

    @Column(name = "purchase_price", length = 50)
    public Double getPurchasePrice() {
        return purchasePrice;
    }

    public void setPurchasePrice(Double purchasePrice) {
        this.purchasePrice = purchasePrice;
    }

    @Column(name = "uom1", length = 50)
    public String getUom1() {
        return uom1;
    }

    public void setUom1(String uom1) {
        this.uom1 = uom1;
    }

    @Column(name = "uom1_price", length = 50)
    public Double getUom1Price() {
        return uom1Price;
    }

    public void setUom1Price(Double uom1Price) {
        this.uom1Price = uom1Price;
    }

    @Column(name = "uom2", length = 50)
    public String getUom2() {
        return uom2;
    }

    public void setUom2(String uom2) {
        this.uom2 = uom2;
    }

    @Column(name = "uom2_price", length = 50)
    public Double getUom2Price() {
        return uom2Price;
    }

    public void setUom2Price(Double uom2Price) {
        this.uom2Price = uom2Price;
    }

    @Column(name = "uom3", length = 50)
    public String getUom3() {
        return uom3;
    }

    public void setUom3(String uom3) {
        this.uom3 = uom3;
    }

    @Column(name = "uom3_price", length = 50)
    public Double getUom3Price() {
        return uom3Price;
    }

    public void setUom3Price(Double uom3Price) {
        this.uom3Price = uom3Price;
    }

    @Column(name = "status", length = 50)
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
