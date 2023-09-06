/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.classes;



import java.io.Serializable;
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

@Entity
@Table(name = "store_TypeMaster", schema = "arete_tms")
public class StoreTypeMaster implements java.io.Serializable
{
      private int sno;
    private String orgId;
    private String userId;
    private String storeTypeID;
    private String storeType;
    private String storeCategory;
    private String storeTypeDesc;
    private String attribute1;
    private String attribute2;
    private String attribute3;
    private String attribute4;
    private String attribute5;
    private String status;

    public StoreTypeMaster(int sno, String orgId, String userId, String storeTypeID, String storeType, String storeCategory, String storeTypeDesc, String attribute1, String attribute2, String attribute3, String attribute4, String attribute5, String status, Date creationDate, Date lastmodifiedDate) {
        this.sno = sno;
        this.orgId = orgId;
        this.userId = userId;
        this.storeTypeID = storeTypeID;
        this.storeType= storeType;
        this.storeCategory = storeCategory;
        this.storeTypeDesc = storeTypeDesc;
        this.attribute1 = attribute1;
        this.attribute2 = attribute2;
        this.attribute3 = attribute3;
        this.attribute4 = attribute4;
        this.attribute5 = attribute5;
        this.status = status;
        this.creationDate = creationDate;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public StoreTypeMaster(String orgId, String userId, String storeTypeID, String storeType, String storeCategory, String storeTypeDesc, String attribute1, String attribute2, String attribute3, String attribute4, String attribute5, String status, Date creationDate, Date lastmodifiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.storeTypeID = storeTypeID;
        this.storeType = storeType;
        this.storeCategory = storeCategory;
        this.storeTypeDesc = storeTypeDesc;
        this.attribute1 = attribute1;
        this.attribute2 = attribute2;
        this.attribute3 = attribute3;
        this.attribute4 = attribute4;
        this.attribute5 = attribute5;
        this.status = status;
        this.creationDate = creationDate;
        this.lastmodifiedDate = lastmodifiedDate;
    }
    

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "s_no", nullable = false, unique = true)
    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

    @Column(name = "ORG_ID", length = 50)
    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name = "USER_ID", length = 50)
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name = "Store_TypeId",unique=true, length = 50)
    public String getStoreTypeID() {
        return storeTypeID;
    }

    public void setStoreTypeID(String storeTypeID) {
        this.storeTypeID = storeTypeID;
    }

    @Column(name = "Store_TypeName", length = 50)
    public String getStoreTypeName() {
        return storeType;
    }

    public void setStoreTypeName(String storeType) {
        this.storeType = storeType;
    }

    @Column(name = "Store_TypeCategory", length = 50)
    public String getStoreTypeCategory() {
        return storeCategory;
    }

    public void setStoreTypeCategory(String storeCategory) {
        this.storeCategory = storeCategory;
    }

    @Column(name = "Store_TypeDesc", length = 50)
    public String getStoreTypeDesc() {
        return storeTypeDesc;
    }

    public void setStoreTypeDesc(String storeTypeDesc) {
        this.storeTypeDesc = storeTypeDesc;
    }

    @Column(name = "ATTRIBUTE1")
    public String getAttribute1() {
        return attribute1;
    }

    public void setAttribute1(String attribute1) {
        this.attribute1 = attribute1;
    }

    @Column(name = "ATTRIBUTE2")
    public String getAttribute2() {
        return attribute2;
    }

    public void setAttribute2(String attribute2) {
        this.attribute2 = attribute2;
    }

    @Column(name = "ATTRIBUTE3")
    public String getAttribute3() {
        return attribute3;
    }

    public void setAttribute3(String attribute3) {
        this.attribute3 = attribute3;
    }

    @Column(name = "ATTRIBUTE4")
    public String getAttribute4() {
        return attribute4;
    }

    public void setAttribute4(String attribute4) {
        this.attribute4 = attribute4;
    }

    @Column(name = "ATTRIBUTE5")
    public String getAttribute5() {
        return attribute5;
    }

    public void setAttribute5(String attribute5) {
        this.attribute5 = attribute5;
    }

    @Column(name = "STATUS", length = 50)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "CREATION_DATE", length = 19)
    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "LASTMODIFIED_DATE", length = 19)
    public Date getLastmodifiedDate() {
        return lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }
    private Date creationDate;
    private Date lastmodifiedDate;

}

    

