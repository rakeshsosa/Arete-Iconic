/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.classes;

// Generated 26 Feb, 2016 4:46:53 PM by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * Currency generated by hbm2java
 */
@Entity
@Table(name="currency"
    ,schema = "arete_tms"
)
public class CurrencyRate  implements java.io.Serializable {


     private Integer sno;
     private String userId;
     private String orgId;
     private String currencyCode;
     private String currencyName;
     private String currencyDesc;
     private Double currencyRate;
     private String status;
     private java.sql.Timestamp lastmodifiedDate;

    public CurrencyRate() {
    }

	
    public CurrencyRate(String userId, String orgId, String currencyCode, String currencyName,String currencyDesc,Double currencyRate,String status, java.sql.Timestamp lastmodifiedDate) {
        
        this.userId = userId;
        this.orgId = orgId;
        this.currencyCode = currencyCode;
        this.currencyName = currencyName;
        this.currencyDesc=currencyDesc;
        this.currencyRate=currencyRate;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }
    public CurrencyRate(Integer sno, String userId, String orgId, String currencyCode, String currencyName,String currencyDesc,Double currencyRate,String status, java.sql.Timestamp lastmodifiedDate) {
       this.sno = sno;
       this.userId = userId;
       this.orgId = orgId;
       this.currencyCode = currencyCode;
       this.currencyName = currencyName;
       this.currencyRate = currencyRate;
       this.currencyDesc = currencyDesc;
       
       this.status = status;
       this.lastmodifiedDate = lastmodifiedDate;
    }
   
     @Id 
     @SequenceGenerator(name = "table_seq", sequenceName = "currency_sequence",allocationSize=1)
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "table_seq")

    
    @Column(name="s_no", unique=true, nullable=false, precision=38, scale=0)
    public Integer getSno() {
        return this.sno;
    }
    
    public void setSno(Integer sno) {
        this.sno = sno;
    }

    
    @Column(name="user_id", nullable=false, length=50)
    public String getUserId() {
        return this.userId;
    }
    
    public void setUserId(String userId) {
        this.userId = userId;
    }

    
    @Column(name="org_id", nullable=false, length=50)
    public String getOrgId() {
        return this.orgId;
    }
    
    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    
    @Column(name="currencry_code", unique=true, nullable=false, length=50)
    public String getCurrencyCode() {
        return this.currencyCode;
    }
    
    public void setCurrencyCode(String currencyCode) {
        this.currencyCode = currencyCode;
    }

    
    @Column(name="currency_name", nullable=false, length=50)
    public String getCurrencyName() {
        return this.currencyName;
    }
    
    public void setCurrencyName(String currencyName) {
        this.currencyName = currencyName;
    }

    
    @Column(name="currency_desc", length=250)
    public String getCurrencyDesc() {
        return this.currencyDesc;
    }
    
    public void setCurrencyDesc(String currencyDesc) {
        this.currencyDesc = currencyDesc;
    }

    
    @Column(name="currency_rate", precision=126, scale=0)
    public Double getCurrencyRate() {
        return this.currencyRate;
    }
    
    public void setCurrencyRate(Double currencyRate) {
        this.currencyRate = currencyRate;
    }

    
    @Column(name="status", nullable=false, length=50)
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }

    
    @Column(name="lastmodified_date", nullable=false)
    public java.sql.Timestamp getLastmodifiedDate() {
        return this.lastmodifiedDate;
    }
    
    public void setLastmodifiedDate(java.sql.Timestamp lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }




}



