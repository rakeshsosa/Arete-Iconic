package tenant.classes;
// Generated 7 Oct, 2016 10:15:08 AM by Hibernate Tools 4.3.1

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
 * DailyWorkSheet generated by hbm2java
 */
@Entity
@Table(name = "daily_work_sheet", schema = "arete_tms"
)
public class DailyWorkSheet implements java.io.Serializable {

    private Integer sno;
    private String orgId;
    private String userId;
    private String dwsCode;
    private String empName;
    private String empCode;
    private Date date;
    private String leadName;
    private String timeIn;
    private String timeOut;
    private Date followUpDate;
    private String followUpHistory;
    private String stage;
    private String remarks;
    private String attribute1;
    private String attribute2;
    private String attribute3;
    private String attribute4;
    private String attribute5;
    private Date creationDate;
    private String recordStatus;
    private String status;
    private Date lastmodefiedDate;

    public DailyWorkSheet() {
    }

    public DailyWorkSheet(String userId) {
        this.userId = userId;
    }

    public DailyWorkSheet(String orgId, String userId, String dwsCode, String empName, String empCode, Date date, String leadName, String timeIn, String timeOut, Date followUpDate, String followUpHistory, String stage, String remarks, String attribute1, String attribute2, String attribute3, String attribute4, String attribute5, Date creationDate, String recordStatus, String status, Date lastmodefiedDate) {
        this.orgId = orgId;
        this.userId = userId;
        this.dwsCode = dwsCode;
        this.empName = empName;
        this.empCode = empCode;
        this.date = date;
        this.leadName = leadName;
        this.timeIn = timeIn;
        this.timeOut = timeOut;
        this.followUpDate = followUpDate;
        this.followUpHistory = followUpHistory;
        this.stage = stage;
        this.remarks = remarks;
        this.attribute1 = attribute1;
        this.attribute2 = attribute2;
        this.attribute3 = attribute3;
        this.attribute4 = attribute4;
        this.attribute5 = attribute5;
        this.creationDate = creationDate;
        this.recordStatus = recordStatus;
        this.status = status;
        this.lastmodefiedDate = lastmodefiedDate;
    }

    public DailyWorkSheet(Integer sno, String orgId, String userId, String dwsCode, String empName, String empCode, Date date, String leadName, String timeIn, String timeOut, Date followUpDate, String followUpHistory, String stage, String remarks, String attribute1, String attribute2, String attribute3, String attribute4, String attribute5, Date creationDate, String recordStatus, String status, Date lastmodefiedDate) {
        this.sno = sno;
        this.orgId = orgId;
        this.userId = userId;
        this.dwsCode = dwsCode;
        this.empName = empName;
        this.empCode = empCode;
        this.date = date;
        this.leadName = leadName;
        this.timeIn = timeIn;
        this.timeOut = timeOut;
        this.followUpDate = followUpDate;
        this.followUpHistory = followUpHistory;
        this.stage = stage;
        this.remarks = remarks;
        this.attribute1 = attribute1;
        this.attribute2 = attribute2;
        this.attribute3 = attribute3;
        this.attribute4 = attribute4;
        this.attribute5 = attribute5;
        this.creationDate = creationDate;
        this.recordStatus = recordStatus;
        this.status = status;
        this.lastmodefiedDate = lastmodefiedDate;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)

    @Column(name = "sno", unique = true, nullable = false)
    public Integer getSno() {
        return this.sno;
    }

    public void setSno(Integer sno) {
        this.sno = sno;
    }

    @Column(name = "org_Id", length = 20)
    public String getOrgId() {
        return this.orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name = "user_Id", nullable = false, length = 20)
    public String getUserId() {
        return this.userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name = "DWS_Code", length = 50)
    public String getDwsCode() {
        return this.dwsCode;
    }

    public void setDwsCode(String dwsCode) {
        this.dwsCode = dwsCode;
    }

    @Column(name = "Emp_Name", length = 50)
    public String getEmpName() {
        return this.empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    @Column(name = "Emp_Code", length = 50)
    public String getEmpCode() {
        return this.empCode;
    }

    public void setEmpCode(String empCode) {
        this.empCode = empCode;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "Date", length = 19)
    public Date getDate() {
        return this.date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Column(name = "Lead_Name", length = 50)
    public String getLeadName() {
        return this.leadName;
    }

    public void setLeadName(String leadName) {
        this.leadName = leadName;
    }

    @Column(name = "Time_In", length = 50)
    public String getTimeIn() {
        return this.timeIn;
    }

    public void setTimeIn(String timeIn) {
        this.timeIn = timeIn;
    }

    @Column(name = "Time_Out", length = 50)
    public String getTimeOut() {
        return this.timeOut;
    }

    public void setTimeOut(String timeOut) {
        this.timeOut = timeOut;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "FollowUp_Date", length = 19)
    public Date getFollowUpDate() {
        return this.followUpDate;
    }

    public void setFollowUpDate(Date followUpDate) {
        this.followUpDate = followUpDate;
    }

    @Column(name = "FollowUp_History", length = 500)
    public String getFollowUpHistory() {
        return this.followUpHistory;
    }

    public void setFollowUpHistory(String followUpHistory) {
        this.followUpHistory = followUpHistory;
    }

    @Column(name = "Stage", length = 50)
    public String getStage() {
        return this.stage;
    }

    public void setStage(String stage) {
        this.stage = stage;
    }

    @Column(name = "Remarks", length = 500)
    public String getRemarks() {
        return this.remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Column(name = "Attribute1", length = 50)
    public String getAttribute1() {
        return this.attribute1;
    }

    public void setAttribute1(String attribute1) {
        this.attribute1 = attribute1;
    }

    @Column(name = "Attribute2", length = 50)
    public String getAttribute2() {
        return this.attribute2;
    }

    public void setAttribute2(String attribute2) {
        this.attribute2 = attribute2;
    }

    @Column(name = "Attribute3", length = 50)
    public String getAttribute3() {
        return this.attribute3;
    }

    public void setAttribute3(String attribute3) {
        this.attribute3 = attribute3;
    }

    @Column(name = "Attribute4")
    public String getAttribute4() {
        return this.attribute4;
    }

    public void setAttribute4(String attribute4) {
        this.attribute4 = attribute4;
    }

    @Column(name = "Attribute5")
    public String getAttribute5() {
        return this.attribute5;
    }

    public void setAttribute5(String attribute5) {
        this.attribute5 = attribute5;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "Creation_date", length = 19)
    public Date getCreationDate() {
        return this.creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    @Column(name = "Record_Status", length = 50)
    public String getRecordStatus() {
        return this.recordStatus;
    }

    public void setRecordStatus(String recordStatus) {
        this.recordStatus = recordStatus;
    }

    @Column(name = "Status", length = 50)
    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "Lastmodefied_Date", length = 19)
    public Date getLastmodefiedDate() {
        return this.lastmodefiedDate;
    }

    public void setLastmodefiedDate(Date lastmodefiedDate) {
        this.lastmodefiedDate = lastmodefiedDate;
    }

}
