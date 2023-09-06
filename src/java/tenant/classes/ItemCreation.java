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
 * @author ebs05
 */
@Entity
@Table(name = "item_creation", schema = "arete_tms"
)
public class ItemCreation implements java.io.Serializable {

    private Integer sno;
    private String userId;
    private String orgId;
    private String itemCategory;
    private String mainCategory;
    private String itemSubCategory;
    private String itemName;
    private String barCode;
    private String itemDesc;
    private String baseUom;
    private String uom1;
    private Double conversionFactor1;
    private String uom2;
    private Double conversionFactor2;
    private String uom3;
    private Double conversionFactor3;
    private Double sellingPrice;
    private Double purchasePrice;
    private Date pricevalidDate;
    private String specDrawingno;
    private String status;
    private Date lastmodifiedDate;
    private String itemCode;
    private Integer saftyStock;
    private String storeLocation;
    private String expenseCode;
    private Double costFactor;
    private String itemNaturalAcct;

    public ItemCreation() {
    }

    public ItemCreation(Integer sno, String userId, String orgId, String itemCategory, String itemSubCategory, String itemName, String barCode, String itemDesc, String baseUom, String uom1, Double conversionFactor1, String uom2, Double conversionFactor2, String uom3, Double conversionFactor3, Double sellingPrice, Double purchasePrice, Date pricevalidDate,
            String specDrawingno, String status, Date lastmodifiedDate, String itemCode,
            String storeLocation, String expenseCode, Double costFactor, String mainCategory, String itemNaturalAcct) {
        this.sno = sno;
        this.userId = userId;
        this.orgId = orgId;
        this.itemCategory = itemCategory;
        this.itemSubCategory = itemSubCategory;
        this.itemName = itemName;
        this.barCode = barCode;
        this.itemDesc = itemDesc;
        this.baseUom = baseUom;
        this.uom1 = uom1;
        this.conversionFactor1 = conversionFactor1;
        this.uom2 = uom2;
        this.conversionFactor2 = conversionFactor2;
        this.uom3 = uom3;
        this.conversionFactor3 = conversionFactor3;
        this.sellingPrice = sellingPrice;
        this.purchasePrice = purchasePrice;
        this.pricevalidDate = pricevalidDate;
        this.specDrawingno = specDrawingno;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.itemCode = itemCode;
        this.storeLocation = storeLocation;
        this.expenseCode = expenseCode;
        this.costFactor = costFactor;
        this.mainCategory = mainCategory;
        this.itemNaturalAcct = itemNaturalAcct;
    }

    public ItemCreation(String userId, String orgId, String itemCategory, String itemSubCategory, String itemName, String barCode,
            String itemDesc, String baseUom, String uom1, Double conversionFactor1, String uom2, Double conversionFactor2,
            String uom3, Double conversionFactor3, Double sellingPrice, Double purchasePrice, Date pricevalidDate,
            String specDrawingno, String status, Date lastmodifiedDate, String itemCode,
            String storeLocation, String expenseCode, Double costFactor, String mainCategory, String itemNaturalAcct) {
        this.userId = userId;
        this.orgId = orgId;
        this.itemCategory = itemCategory;
        this.itemSubCategory = itemSubCategory;
        this.itemName = itemName;
        this.barCode = barCode;
        this.itemDesc = itemDesc;
        this.baseUom = baseUom;
        this.uom1 = uom1;
        this.conversionFactor1 = conversionFactor1;
        this.uom2 = uom2;
        this.conversionFactor2 = conversionFactor2;
        this.uom3 = uom3;
        this.conversionFactor3 = conversionFactor3;
        this.sellingPrice = sellingPrice;
        this.purchasePrice = purchasePrice;
        this.pricevalidDate = pricevalidDate;
        this.specDrawingno = specDrawingno;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.itemCode = itemCode;
        this.storeLocation = storeLocation;
        this.expenseCode = expenseCode;
        this.costFactor = costFactor;
        this.mainCategory = mainCategory;
        this.itemNaturalAcct = itemNaturalAcct;
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

    @Column(name = "item_category", length = 50)
    public String getItemCategory() {
        return itemCategory;
    }

    public void setItemCategory(String itemCategory) {
        this.itemCategory = itemCategory;
    }

    @Column(name = "main_category", length = 50)
    public String getMainCategory() {
        return mainCategory;
    }

    public void setMainCategory(String mainCategory) {
        this.mainCategory = mainCategory;
    }

    @Column(name = "item_sub_category", length = 50)
    public String getItemSubCategory() {
        return itemSubCategory;
    }

    public void setItemSubCategory(String itemSubCategory) {
        this.itemSubCategory = itemSubCategory;
    }

    @Column(name = "item_name", length = 50)
    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    @Column(name = "bar_code", length = 50)
    public String getBarCode() {
        return barCode;
    }

    public void setBarCode(String barCode) {
        this.barCode = barCode;
    }

    @Column(name = "item_desc", length = 50)
    public String getItemDesc() {
        return itemDesc;
    }

    public void setItemDesc(String itemDesc) {
        this.itemDesc = itemDesc;
    }

    @Column(name = "base_uom", length = 50)
    public String getBaseUom() {
        return baseUom;
    }

    public void setBaseUom(String baseUom) {
        this.baseUom = baseUom;
    }

    @Column(name = "uom1", length = 50)
    public String getUom1() {
        return uom1;
    }

    public void setUom1(String uom1) {
        this.uom1 = uom1;
    }

    @Column(name = "conversion_factor1", length = 50)
    public Double getConversionFactor1() {
        return conversionFactor1;
    }

    public void setConversionFactor1(Double conversionFactor1) {
        this.conversionFactor1 = conversionFactor1;
    }

    @Column(name = "uom2", length = 50)
    public String getUom2() {
        return uom2;
    }

    public void setUom2(String uom2) {
        this.uom2 = uom2;
    }

    @Column(name = "conversion_factor2", length = 50)
    public Double getConversionFactor2() {
        return conversionFactor2;
    }

    public void setConversionFactor2(Double conversionFactor2) {
        this.conversionFactor2 = conversionFactor2;
    }

    @Column(name = "uom3", length = 50)
    public String getUom3() {
        return uom3;
    }

    public void setUom3(String uom3) {
        this.uom3 = uom3;
    }

    @Column(name = "conversion_factor3", length = 50)
    public Double getConversionFactor3() {
        return conversionFactor3;
    }

    public void setConversionFactor3(Double conversionFactor3) {
        this.conversionFactor3 = conversionFactor3;
    }

    @Column(name = "selling_price", length = 50)
    public Double getSellingPrice() {
        return sellingPrice;
    }

    public void setSellingPrice(Double sellingPrice) {
        this.sellingPrice = sellingPrice;
    }

    @Column(name = "purchase_price", length = 50)
    public Double getPurchasePrice() {
        return purchasePrice;
    }

    public void setPurchasePrice(Double purchasePrice) {
        this.purchasePrice = purchasePrice;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "pricevalid_date", length = 19)
    public Date getPricevalidDate() {
        return pricevalidDate;
    }

    public void setPricevalidDate(Date pricevalidDate) {
        this.pricevalidDate = pricevalidDate;
    }

    @Column(name = "spec_drawing_no", length = 50)
    public String getSpecDrawingno() {
        return specDrawingno;
    }

    public void setSpecDrawingno(String specDrawingno) {
        this.specDrawingno = specDrawingno;
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

    @Column(name = "item_code", length = 50)
    public String getItemCode() {
        return itemCode;
    }

    public void setItemCode(String itemCode) {
        this.itemCode = itemCode;
    }

    @Column(name = "safty_stock", length = 50)
    public Integer getSaftyStock() {
        return saftyStock;
    }

    public void setSaftyStock(Integer saftyStock) {
        this.saftyStock = saftyStock;
    }

    @Column(name = "store_location", length = 50)
    public String getStoreLocation() {
        return storeLocation;
    }

    public void setStoreLocation(String storeLocation) {
        this.storeLocation = storeLocation;
    }

    @Column(name = "expense_code", length = 50)
    public String getExpenseCode() {
        return expenseCode;
    }

    public void setExpenseCode(String expenseCode) {
        this.expenseCode = expenseCode;
    }

    @Column(name = "cost_factor", length = 50)
    public Double getCostFactor() {
        return costFactor;
    }

    public void setCostFactor(Double costFactor) {
        this.costFactor = costFactor;
    }

    @Column(name = "item_natural_acct", length = 50)
    public String getItemNaturalAcct() {
        return itemNaturalAcct;
    }

    public void setItemNaturalAcct(String itemNaturalAcct) {
        this.itemNaturalAcct = itemNaturalAcct;
    }

}
