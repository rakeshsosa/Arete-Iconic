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
@Table(name = "Item_sub_category", schema = "arete_tms"
)
public class ItemSubcategory implements java.io.Serializable {

    private Integer sno;
    private String userId;
    private String orgId;
    private String itemCategory;
    private String mainCategory;
    private String itemSubCategory;
    private String itemsubDesc;
    private String subCatCode;
    private String status;
    private Date lastmodifiedDate;

    public ItemSubcategory() {
    }

    public ItemSubcategory(Integer sno, String userId, String orgId, String itemCategory, String itemSubCategory,
            String itemsubDesc, String status, Date lastmodifiedDate, String mainCategory, String subCatCode) {
        this.sno = sno;
        this.userId = userId;
        this.orgId = orgId;
        this.itemCategory = itemCategory;
        this.itemSubCategory = itemSubCategory;
        this.itemsubDesc = itemsubDesc;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.mainCategory = mainCategory;
        this.subCatCode = subCatCode;
    }

    public ItemSubcategory(String userId, String orgId, String itemCategory, String itemSubCategory,
            String itemsubDesc, String status, Date lastmodifiedDate, String mainCategory, String subCatCode) {
        this.userId = userId;
        this.orgId = orgId;
        this.itemCategory = itemCategory;
        this.itemSubCategory = itemSubCategory;
        this.itemsubDesc = itemsubDesc;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
        this.mainCategory = mainCategory;
        this.subCatCode = subCatCode;
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

    @Column(name = "item_sub_desc", length = 50)
    public String getItemsubDesc() {
        return itemsubDesc;
    }

    public void setItemsubDesc(String itemsubDesc) {
        this.itemsubDesc = itemsubDesc;
    }

    @Column(name = "sub_cat_code", length = 50)
    public String getSubCatCode() {
        return subCatCode;
    }

    public void setSubCatCode(String subCatCode) {
        this.subCatCode = subCatCode;
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
