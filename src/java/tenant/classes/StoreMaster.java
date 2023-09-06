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
@Table(name = "store_master", schema = "arete_tms"
)
public class StoreMaster implements java.io.Serializable {

    private Integer sno;
    private String userId;
    private String orgId;
    private String division;
    private String storeType;
    private String storeName;
    private String address;
    private String storeID;
    private String storeCategory;
    private String status;
    private Date lastmodifiedDate;

    public StoreMaster() {
    }

    public StoreMaster(Integer sno, String userId, String orgId, String division, String storeType, String storeName, String address, String storeID, String storeCategory, String status, Date lastmodifiedDate) {
        this.sno = sno;
        this.userId = userId;
        this.orgId = orgId;
        this.division = division;
        this.storeType = storeType;
        this.storeName = storeName;
        this.address = address;
        this.storeID = storeID;
        this.storeCategory = storeCategory;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public StoreMaster(String userId, String orgId, String division, String storeType, String storeName, String address, String storeID, String storeCategory, String status, Date lastmodifiedDate) {
        this.userId = userId;
        this.orgId = orgId;
        this.division = division;
        this.storeType = storeType;
        this.storeName = storeName;
        this.address = address;
        this.storeID = storeID;
        this.storeCategory = storeCategory;
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

    @Column(name = "division", length = 50)
    public String getDivision() {
        return division;
    }

    public void setDivision(String division) {
        this.division = division;
    }

    @Column(name = "store_type", length = 50)
    public String getStoreType() {
        return storeType;
    }

    public void setStoreType(String storeType) {
        this.storeType = storeType;
    }

    @Column(name = "store_ID", unique = true, length = 50)
    public String getStoreID() {
        return storeID;
    }

    public void setStoreID(String storeID) {
        this.storeID = storeID;
    }

    @Column(name = "store_Category", length = 50)
    public String getStoreCategory() {
        return storeCategory;
    }

    public void setStoreCategory(String storeCategory) {
        this.storeCategory = storeCategory;
    }

    @Column(name = "store_name", length = 50)
    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    @Column(name = "address", length = 50)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Column(name = "status", length = 50)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "lastmodified_date", length = 10)
    public Date getLastmodifiedDate() {
        return lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }

}
