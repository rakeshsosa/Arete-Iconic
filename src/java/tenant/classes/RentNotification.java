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

/**
 *
 * @author Lakshmi
 */
@Entity
@Table(name = "rent_notification", schema = "arete_tms")
public class RentNotification implements java.io.Serializable {

    private Integer SNo;
    private String tenantCode;
    private String tenantName;
    private String tenantCrNo;
    private String tenantContactno;
    private String correspondenceAddress;
    private String assetCode;
    private String assetName;
    private String billingCycle;
    private String contractName;
    private Date dueDate;
    private String llId;
    private String landlordName;
    private String landlordContactno;
    private String postalCode;
    private String postboxNo;
    private Date notificationDate;
    private String notificationMonth;
    private String rentAmount;

    @Id
    @GeneratedValue(strategy = IDENTITY)

    @Column(name = "s_no", unique = true, nullable = false)
    public Integer getSNo() {
        return SNo;
    }

    public void setSNo(Integer SNo) {
        this.SNo = SNo;
    }

    @Column(name = "t_code")
    public String getTenantCode() {
        return tenantCode;
    }

    public void setTenantCode(String tenantCode) {
        this.tenantCode = tenantCode;
    }

    @Column(name = "t_name")
    public String getTenantName() {
        return tenantName;
    }

    public void setTenantName(String tenantName) {
        this.tenantName = tenantName;
    }

    @Column(name = "t_crno")
    public String getTenantCrNo() {
        return tenantCrNo;
    }

    public void setTenantCrNo(String tenantCrNo) {
        this.tenantCrNo = tenantCrNo;
    }

    @Column(name = "t_contact_number")
    public String getTenantContactno() {
        return tenantContactno;
    }

    public void setTenantContactno(String tenantContactno) {
        this.tenantContactno = tenantContactno;
    }

    @Column(name = "t_corre_addr")
    public String getCorrespondenceAddress() {
        return correspondenceAddress;
    }

    public void setCorrespondenceAddress(String correspondenceAddress) {
        this.correspondenceAddress = correspondenceAddress;
    }

    @Column(name = "asset_code")
    public String getAssetCode() {
        return assetCode;
    }

    public void setAssetCode(String assetCode) {
        this.assetCode = assetCode;
    }

    @Column(name = "asset_name")
    public String getAssetName() {
        return assetName;
    }

    public void setAssetName(String assetName) {
        this.assetName = assetName;
    }

    @Column(name = "billing_cycle")
    public String getBillingCycle() {
        return billingCycle;
    }

    public void setBillingCycle(String billingCycle) {
        this.billingCycle = billingCycle;
    }

    @Column(name = "contract_name")
    public String getContractName() {
        return contractName;
    }

    public void setContractName(String contractName) {
        this.contractName = contractName;
    }

    @Column(name = "due_date")
    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    @Column(name = "ll_id")
    public String getLlId() {
        return llId;
    }

    public void setLlId(String llId) {
        this.llId = llId;
    }

    @Column(name = "ll_name")
    public String getLandlordName() {
        return landlordName;
    }

    public void setLandlordName(String landlordName) {
        this.landlordName = landlordName;
    }

    @Column(name = "ll_contact_number")
    public String getLandlordContactno() {
        return landlordContactno;
    }

    public void setLandlordContactno(String landlordContactno) {
        this.landlordContactno = landlordContactno;
    }

    @Column(name = "postal_code")
    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    @Column(name = "post_box_num")
    public String getPostboxNo() {
        return postboxNo;
    }

    public void setPostboxNo(String postboxNo) {
        this.postboxNo = postboxNo;
    }

    @Column(name = "notification_date")
    public Date getNotificationDate() {
        return notificationDate;
    }

    public void setNotificationDate(Date notificationDate) {
        this.notificationDate = notificationDate;
    }

    @Column(name = "notification_month")
    public String getNotificationMonth() {
        return notificationMonth;
    }

    public void setNotificationMonth(String notificationMonth) {
        this.notificationMonth = notificationMonth;
    }

    @Column(name = "rent_amount")
    public String getRentAmount() {
        return rentAmount;
    }

    public void setRentAmount(String rentAmount) {
        this.rentAmount = rentAmount;
    }
}
