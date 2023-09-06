package tenant.classes;
// Generated 4 Oct, 2016 3:09:04 PM by Hibernate Tools 4.3.1

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
 * ContractApproval generated by hbm2java
 */
@Entity
@Table(name = "contract_approval", schema = "arete_tms"
)
public class ContractApproval implements java.io.Serializable {

    private Integer sno;
    private String approvalLevel;
    private String approvalRole;
    private String comments;
    private Date lastmodifiedDate;
    private Integer levelNo;
    private String orgName;
    private String status;
    private String submoduleName;
    private String tabName;
    private String testNo;
    private String userId;
    private String userName;

    public ContractApproval() {
    }

    public ContractApproval(String approvalLevel, String approvalRole, String comments, Date lastmodifiedDate, Integer levelNo, String orgName, String status, String submoduleName, String tabName, String testNo, String userId, String userName) {
        this.approvalLevel = approvalLevel;
        this.approvalRole = approvalRole;
        this.comments = comments;
        this.lastmodifiedDate = lastmodifiedDate;
        this.levelNo = levelNo;
        this.orgName = orgName;
        this.status = status;
        this.submoduleName = submoduleName;
        this.tabName = tabName;
        this.testNo = testNo;
        this.userId = userId;
        this.userName = userName;
    }

    public ContractApproval(Integer sno, String approvalLevel, String approvalRole, String comments, Date lastmodifiedDate, Integer levelNo, String orgName, String status, String submoduleName, String tabName, String testNo, String userId, String userName) {
        this.sno = sno;
        this.approvalLevel = approvalLevel;
        this.approvalRole = approvalRole;
        this.comments = comments;
        this.lastmodifiedDate = lastmodifiedDate;
        this.levelNo = levelNo;
        this.orgName = orgName;
        this.status = status;
        this.submoduleName = submoduleName;
        this.tabName = tabName;
        this.testNo = testNo;
        this.userId = userId;
        this.userName = userName;
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

    @Column(name = "Approval_level", length = 50)
    public String getApprovalLevel() {
        return this.approvalLevel;
    }

    public void setApprovalLevel(String approvalLevel) {
        this.approvalLevel = approvalLevel;
    }

    @Column(name = "Approval_Role", length = 50)
    public String getApprovalRole() {
        return this.approvalRole;
    }

    public void setApprovalRole(String approvalRole) {
        this.approvalRole = approvalRole;
    }

    @Column(name = "Comments", length = 80)
    public String getComments() {
        return this.comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "LASTMODIFIED_DATE", length = 19)
    public Date getLastmodifiedDate() {
        return this.lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }

    @Column(name = "level_no")
    public Integer getLevelNo() {
        return this.levelNo;
    }

    public void setLevelNo(Integer levelNo) {
        this.levelNo = levelNo;
    }

    @Column(name = "ORG_NAME", length = 50)
    public String getOrgName() {
        return this.orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    @Column(name = "STATUS", length = 50)
    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Column(name = "SUBMODULE_NAME", length = 80)
    public String getSubmoduleName() {
        return this.submoduleName;
    }

    public void setSubmoduleName(String submoduleName) {
        this.submoduleName = submoduleName;
    }

    @Column(name = "TAB_NAME", length = 80)
    public String getTabName() {
        return this.tabName;
    }

    public void setTabName(String tabName) {
        this.tabName = tabName;
    }

    @Column(name = "test_No", length = 50)
    public String getTestNo() {
        return this.testNo;
    }

    public void setTestNo(String testNo) {
        this.testNo = testNo;
    }

    @Column(name = "USER_ID", length = 50)
    public String getUserId() {
        return this.userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name = "USER_NAME", length = 50)
    public String getUserName() {
        return this.userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

}