
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
 * @author ebs-sdd27
 */@Entity
@Table(name = "tenant_utility_details", schema = "arete_tms"
)
public class TenantUtilityDetails {
    private int SNo;
    private String assetCode;
    private String assetName;
    private Date lastmodifiedDate;
    private String utility;
    private String utilityBill;
    private String comUtility;
    private String comutilityBill;
     //private String totalUtility;
    //private String comTotalUtility;
    private String utilityBillType;
    private String comUtilityBillType;
    private String totUtiAmount;
    private String totComUtiAmount;
    private String status;
    private String tenantCode;
    private String contractPeriod;
    
    
    public TenantUtilityDetails() {
    }
    public TenantUtilityDetails(String contractPeriod,String tenantCode,String assetCode,String assetName,String status,String utility,String utilityBill,String comUtility,String comutilityBill,String utilityBillType,String comUtilityBillType,String totUtiAmount,String totComUtiAmount, Date lastmodifiedDate) {
    this.assetCode = assetCode;
    this.contractPeriod = contractPeriod;
    this.assetName = assetName;
    this.lastmodifiedDate = lastmodifiedDate;
    this.utility = utility;
    this.utilityBill = utilityBill;
    this.comUtility = comUtility;
    this.comutilityBill = comutilityBill;
    this.utilityBillType = utilityBillType;
    this.comUtilityBillType = comUtilityBillType;
    this.totUtiAmount = totUtiAmount;
    this.totComUtiAmount = totComUtiAmount; 
    this.status = status;
    this.tenantCode = tenantCode;
    }
    public TenantUtilityDetails(int SNo,String contractPeriod,String tenantCode,String assetCode,String assetName,String status,String utility,String utilityBill,String comUtility,String comutilityBill,String totalUtility,String comTotalUtility,String utilityBillType,String comUtilityBillType,String totUtiAmount,String totComUtiAmount, Date lastmodifiedDate) {
    this.SNo = SNo;
    this.assetCode = assetCode;
    this.assetName = assetName;
    this.lastmodifiedDate = lastmodifiedDate;
    this.utility = utility;
    this.utilityBill = utilityBill;
    this.comUtility = comUtility;
    this.comutilityBill = comutilityBill;
    this.utilityBillType = utilityBillType;
    this.comUtilityBillType = comUtilityBillType;
    this.totUtiAmount = totUtiAmount;
    this.totComUtiAmount = totComUtiAmount; 
    this.status = status;
    this.tenantCode = tenantCode;
     this.contractPeriod = contractPeriod;
    }
    //,String utility,String utilityBill,String comUtility,String comutilityBill,String totalUtility,String comTotalUtility,String utilityBillType,String comUtilityBillType,String totUtiAmount,String totComUtiAmount
            
            @Id
    @GeneratedValue(strategy = IDENTITY)

    @Column(name = "s_no", unique = true, nullable = false)
    public int getSNo() {
        return this.SNo;
    }

    public void setSNo(int SNo) {
        this.SNo = SNo;
    }
    @Column(name = "contract_period", length = 60)
    public String getContractPeriod() {
        return this.contractPeriod;
    }

    public void setContractPeriod(String contractPeriod) {
        this.contractPeriod = contractPeriod;
    }
    @Column(name = "utility_bill_type", length = 60)
    public String getUtilityBillType() {
        return this.utilityBillType;
    }

    public void setUtilityBillType(String utilityBillType) {
        this.utilityBillType = utilityBillType;
    }
    @Column(name = "tot_utility_amount", length = 60)
    public String getTotUtiAmount() {
        return this.totUtiAmount;
    }

    public void setTotUtiAmount(String totUtiAmount) {
        this.totUtiAmount = totUtiAmount;
    }
    @Column(name = "tot_com_utility_amount", length = 60)
    public String getTotComUtiAmount() {
        return this.totComUtiAmount;
    }

    public void setTotComUtiAmount(String totComUtiAmount) {
        this.totComUtiAmount = totComUtiAmount;
    }
    
    @Column(name = "com_utility_bill_type", length = 60)
    public String getComUtilityBillType() {
        return this.comUtilityBillType;
    }

    public void setComUtilityBillType(String comUtilityBillType) {
        this.comUtilityBillType = comUtilityBillType;
    }
    @Column(name = "utility", length = 60)
    public String getUtility() {
        return this.utility;
    }

    public void setUtility(String utility) {
        this.utility = utility;
    }
     @Column(name = "utilityBill", length = 60)
    public String getUtilityBill() {
        return this.utilityBill;
    }

    public void setUtilityBill(String utilityBill) {
        this.utilityBill = utilityBill;
    }
     @Column(name = "comUtility", length = 60)
    public String getComUtility() {
        return this.comUtility;
    }

    public void setComUtility(String comUtility) {
        this.comUtility = comUtility;
    }
     @Column(name = "comutilityBill", length = 60)
    public String getComutilityBill() {
        return this.comutilityBill;
    }

    public void setComutilityBill(String comutilityBill) {
        this.comutilityBill = comutilityBill;
    }
    @Column(name = "asset_code", length = 60)
    public String getAssetCode() {
        return this.assetCode;
    }

    public void setAssetCode(String assetCode) {
        this.assetCode = assetCode;
    }    
      @Column(name = "tenant_code", length = 60)
    public String getTenantCode() {
        return this.tenantCode;
    }

    public void setTenantCode(String tenantCode) {
        this.tenantCode = tenantCode;
    }

    @Column(name = "asset_name", length = 60)
    public String getAssetName() {
        return this.assetName;
    }

    public void setAssetName(String assetName) {
        this.assetName = assetName;
    }
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "lastmodified_date", length = 19)
    public Date getLastmodifiedDate() {
        return this.lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }
    @Column(name = "status", length = 50)
    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

