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
@Table(name = "item_store", schema = "arete_tms"
)
public class ItemsStore implements java.io.Serializable {

    private Integer sno;
    private String userId;
    private String orgId;
    private String itemCode;
    private String division;
    private String storeName;

    private String saftyStock;
    private String status;
    private Date lastmodifiedDate;

    public ItemsStore() {
    }

    public ItemsStore(String userId, String orgId, String itemCode, String division, String storeName, String saftyStock,
            String status, Date lastmodifiedDate) {
        this.userId = userId;
        this.orgId = orgId;
        this.itemCode = itemCode;
        this.division = division;
        this.storeName = storeName;

        this.saftyStock = saftyStock;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;

    }

    public ItemsStore(Integer sno, String userId, String orgId, String itemCode, String division, String storeName, String saftyStock,
            String status, Date lastmodifiedDate) {
        this.sno = sno;
        this.userId = userId;
        this.orgId = orgId;
        this.itemCode = itemCode;
        this.division = division;
        this.storeName = storeName;

        this.saftyStock = saftyStock;
        this.status = status;
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

    @Column(name = "division", length = 50)
    public String getDivision() {
        return division;
    }

    public void setDivision(String division) {
        this.division = division;
    }

    @Column(name = "store_name", length = 50)
    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    @Column(name = "safty_stock", length = 50)
    public String getSaftyStock() {
        return saftyStock;
    }

    public void setSaftyStock(String saftyStock) {
        this.saftyStock = saftyStock;
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
