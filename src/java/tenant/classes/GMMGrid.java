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
@Table(name = "gmm_grid", schema = "arete_tms") 
public class GMMGrid implements java.io.Serializable{
    
    private Integer SNo;
    private String orgId;
    private String userId;
    private String assetCode;
    private String itemName;
    private String itemCode;
    private String availableStock;
    private String quantity;
    private String uom;
    private Date lastmodifiedDate;
    private Boolean status;

    public GMMGrid() {
    }

    public GMMGrid(String orgId, String userId, String assetCode, String itemName, String itemCode, String availableStock, String quantity, String uom, Date lastmodifiedDate, Boolean status) {
        this.orgId = orgId;
        this.userId = userId;
        this.assetCode = assetCode;
        this.itemName = itemName;
        this.itemCode = itemCode;
        this.availableStock = availableStock;
        this.quantity = quantity;
        this.uom = uom;
        this.lastmodifiedDate = lastmodifiedDate;
        this.status = status;
    }

    public GMMGrid(Integer SNo, String orgId, String userId, String assetCode, String itemName, String itemCode, String availableStock, String quantity, String uom, Date lastmodifiedDate, Boolean status) {
        this.SNo = SNo;
        this.orgId = orgId;
        this.userId = userId;
        this.assetCode = assetCode;
        this.itemName = itemName;
        this.itemCode = itemCode;
        this.availableStock = availableStock;
        this.quantity = quantity;
        this.uom = uom;
        this.lastmodifiedDate = lastmodifiedDate;
        this.status = status;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "s_no")
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

    @Column(name = "asset_code")
    public String getAssetCode() {
        return assetCode;
    }

    public void setAssetCode(String assetCode) {
        this.assetCode = assetCode;
    }

    @Column(name = "item_name")
    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    @Column(name = "item_code")
    public String getItemCode() {
        return itemCode;
    }

    public void setItemCode(String itemCode) {
        this.itemCode = itemCode;
    }

    @Column(name = "available_stock")
    public String getAvailableStock() {
        return availableStock;
    }

    public void setAvailableStock(String availableStock) {
        this.availableStock = availableStock;
    }

    @Column(name = "quantity")
    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    @Column(name = "uom")
    public String getUom() {
        return uom;
    }

    public void setUom(String uom) {
        this.uom = uom;
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
