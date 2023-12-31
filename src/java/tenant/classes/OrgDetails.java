package tenant.classes;
// Generated 30 May, 2016 12:22:21 PM by Hibernate Tools 4.3.1

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
 * OrgDetails generated by hbm2java
 */
@Entity
@Table(name = "org_details", schema = "arete_tms"
)
public class OrgDetails implements java.io.Serializable {

    private Integer sno;
    private String orgCode;
    private String orgName;
    private String orgCrNo;
    private Date orgregDate;
    private String suborgCode;
    private String orgType;
    private String orgAddress;
    private String city;
    private String state;
    private String pinCode;
    private String country;
    private String phoneNumber;
    private String fax;
    private String webSite;
    private String orgEmail;
    private String bankName;
    private String accountNumber;
    private String ifscCode;
    private String branchName;
    private String address;
    private String contactNumber;
    private String emailId;
    private String status;
    private Date lastmodifiedDate;

    public OrgDetails() {
    }

    public OrgDetails(String orgCode, String orgName, String orgCrNo, Date orgregDate, String orgType, String orgAddress, String city, String state, String pinCode, String country, String phoneNumber, String fax, String webSite, String orgEmail, String bankName, String accountNumber, String ifscCode, String branchName, String address, String contactNumber, String emailId, String suborgCode, String status, java.sql.Timestamp lastmodifiedDate) {
        this.orgCode = orgCode;
        this.orgName = orgName;
        this.orgCrNo = orgCrNo;
        this.orgregDate = orgregDate;
        this.orgType = orgType;
        this.orgAddress = orgAddress;
        this.suborgCode = suborgCode;
        this.city = city;
        this.state = state;
        this.pinCode = pinCode;
        this.country = country;
        this.phoneNumber = phoneNumber;
        this.fax = fax;
        this.webSite = webSite;
        this.orgEmail = orgEmail;
        this.bankName = bankName;
        this.accountNumber = accountNumber;
        this.ifscCode = ifscCode;
        this.branchName = branchName;
        this.address = address;
        this.contactNumber = contactNumber;
        this.emailId = emailId;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    public OrgDetails(Integer sno, String orgCode, String orgName, String orgCrNo, Date orgregDate, String orgType, String orgAddress, String city, String state, String pinCode, String country, String phoneNumber, String fax, String webSite, String orgEmail, String bankName, String accountNumber, String ifscCode, String branchName, String address, String contactNumber, String emailId, String suborgCode, String status, java.sql.Timestamp lastmodifiedDate) {
        this.sno = sno;
        this.orgCode = orgCode;
        this.orgName = orgName;
        this.orgCrNo = orgCrNo;
        this.orgregDate = orgregDate;
        this.orgType = orgType;
        this.orgAddress = orgAddress;
        this.suborgCode = suborgCode;
        this.city = city;
        this.state = state;
        this.pinCode = pinCode;
        this.country = country;
        this.phoneNumber = phoneNumber;
        this.fax = fax;
        this.webSite = webSite;
        this.orgEmail = orgEmail;
        this.bankName = bankName;
        this.accountNumber = accountNumber;
        this.ifscCode = ifscCode;
        this.branchName = branchName;
        this.address = address;
        this.contactNumber = contactNumber;
        this.emailId = emailId;
        this.status = status;
        this.lastmodifiedDate = lastmodifiedDate;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)

    @Column(name = "SNO", unique = true, nullable = false)
    public Integer getSno() {
        return this.sno;
    }

    public void setSno(Integer sno) {
        this.sno = sno;
    }

    @Column(name = "ORG_CODE", length = 50)
    public String getOrgCode() {
        return this.orgCode;
    }

    public void setOrgCode(String orgCode) {
        this.orgCode = orgCode;
    }

    @Column(name = "ORG_NAME", length = 100)
    public String getOrgName() {
        return this.orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    @Column(name = "ORG_ADDRESS", length = 100)
    public String getOrgAddress() {
        return this.orgAddress;
    }

    public void setOrgAddress(String orgAddress) {
        this.orgAddress = orgAddress;
    }

    @Column(name = "SUBORG_CODE", length = 50)
    public String getSuborgCode() {
        return this.suborgCode;
    }

    public void setSuborgCode(String suborgCode) {
        this.suborgCode = suborgCode;
    }

    @Column(name = "STATUS", length = 50)
    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "LASTMODIFIED_DATE", length = 19)
    public Date getLastmodifiedDate() {
        return this.lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }

    @Column(name = "org_crno", length = 100)
    public String getOrgCrNo() {
        return orgCrNo;
    }

    public void setOrgCrNo(String orgCrNo) {
        this.orgCrNo = orgCrNo;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "orgreg_Date", length = 10)
    public Date getOrgregDate() {
        return orgregDate;
    }

    public void setOrgregDate(Date orgregDate) {
        this.orgregDate = orgregDate;
    }

    @Column(name = "org_type", length = 100)
    public String getOrgType() {
        return orgType;
    }

    public void setOrgType(String orgType) {
        this.orgType = orgType;
    }

    @Column(name = "city", length = 100)
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Column(name = "state", length = 100)
    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    @Column(name = "pin_code", length = 100)
    public String getPinCode() {
        return pinCode;
    }

    public void setPinCode(String pinCode) {
        this.pinCode = pinCode;
    }

    @Column(name = "country", length = 100)
    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    @Column(name = "phone_number", length = 100)
    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @Column(name = "fax", length = 100)
    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    @Column(name = "web_site", length = 100)
    public String getWebSite() {
        return webSite;
    }

    public void setWebSite(String webSite) {
        this.webSite = webSite;
    }

    @Column(name = "org_email", length = 100)
    public String getOrgEmail() {
        return orgEmail;
    }

    public void setOrgEmail(String orgEmail) {
        this.orgEmail = orgEmail;
    }

    @Column(name = "bank_name", length = 100)
    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    @Column(name = "account_number", length = 100)
    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    @Column(name = "ifsc_code", length = 100)
    public String getIfscCode() {
        return ifscCode;
    }

    public void setIfscCode(String ifscCode) {
        this.ifscCode = ifscCode;
    }

    @Column(name = "branch_name", length = 100)
    public String getBranchName() {
        return branchName;
    }

    public void setBranchName(String branchName) {
        this.branchName = branchName;
    }

    @Column(name = "address", length = 100)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Column(name = "contact_cumber", length = 100)
    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    @Column(name = "email_id", length = 100)
    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

}
