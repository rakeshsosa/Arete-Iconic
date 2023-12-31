package tenant.classes;
// Generated Sep 7, 2016 12:08:23 PM by Hibernate Tools 4.3.1

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
 * TenantDetails generated by hbm2java
 */
@Entity
@Table(name = "common_comutility", schema = "arete_tms"
) 
public class CommonUtility implements java.io.Serializable {

    private Integer SNo;
    private Date lastmodifiedDate;
    private String comUtility;
    private String remarks;
    private String comutilityBill;
    private String comUtilityCode;
    private String comUtilityBillType;
    private String status;    

    public CommonUtility() {
    }    
    public CommonUtility(Integer SNo, String comUtility,String remarks, String comutilityBill,String comUtilityCode,String comUtilityBillType,String status,Date lastmodifiedDate) {
        this.SNo = SNo;
        this.comUtility = comUtility;
        this.remarks = remarks;
        this.comutilityBill = comutilityBill;             
        this.status = status;
        this.comUtilityCode = comUtilityCode;
        this.comUtilityBillType = comUtilityBillType;
        this.lastmodifiedDate = lastmodifiedDate;
        
    }
    public CommonUtility(String comUtility,String remarks, String comutilityBill,String comUtilityCode,String comUtilityBillType,String status,Date lastmodifiedDate) {
       
        this.comUtility = comUtility;
        this.remarks = remarks;
        this.comutilityBill = comutilityBill;
        this.comUtilityCode = comUtilityCode;
        this.comUtilityBillType = comUtilityBillType;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }   

    @Id
    @GeneratedValue(strategy = IDENTITY)

    @Column(name = "s_no", unique = true, nullable = false)
    public Integer getSNo() {
        return this.SNo;
    }

    public void setSNo(Integer SNo) {
        this.SNo = SNo;
    }    

    @Column(name = "comUtility", length = 60)
    public String getComUtility() {
        return this.comUtility;
    }

    public void setComUtility(String comUtility) {
        this.comUtility = comUtility;
    }
    @Column(name = "comUtility_bill", length = 60)
    public String getComutilityBill() {
        return this.comutilityBill;
    }

    public void setComutilityBill(String comutilityBill) {
        this.comutilityBill = comutilityBill;
    }
    @Column(name = "comUtility_code", length = 60)
    public String getComUtilityCode() {
        return this.comUtilityCode;
    }

    public void setComUtilityCode(String comUtilityCode) {
        this.comUtilityCode = comUtilityCode;
    }  
    @Column(name = "comUtility_bill_type", length = 60)
    public String getComUtilityBillType() {
        return this.comUtilityBillType;
    }

    public void setComUtilityBillType(String comUtilityBillType) {
        this.comUtilityBillType = comUtilityBillType;
    }  

    @Column(name = "status", length = 50)
    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Column(name = "remarks")
    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
    
    

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "lastmodified_date", length = 19)
    public Date getLastmodifiedDate() {
        return this.lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }

}
