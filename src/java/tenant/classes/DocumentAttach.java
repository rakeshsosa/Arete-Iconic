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
import javax.persistence.GenerationType;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Munusamy
 */
@Entity
@Table(name = "document_attach", schema="arete_tms"
)    
public class DocumentAttach implements java.io.Serializable{
    
    private Integer SNo; 
    private byte[] content;
    private String contentType;
    private String assetCode;
    private String assetName;
    private String subAssetName;
    private String subAssetCode;
    private String filename;
    private Date lastmodifiedDate;
    private String orgId;
    private String status;
    private String userId;
    private String name;
    private String email;
    private String customerType;
    private String documentName;
    private String documentCategory;
    private String documentType;
    private Date documentExpirtyDate;
    private Date documentDateOfUploadDate;
    private String reminderNote;
    private Date reminderDate;
    
    
    public DocumentAttach() {
    }

    public DocumentAttach(byte[] content, String contentType, String assetCode,String assetName,String subAssetName,String subAssetCode, String filename, Date lastmodifiedDate, String orgId,
            String status, String userId,String name,String email,String customerType,String documentName,String documentCategory,
            String documentType,Date documentExpirtyDate,Date documentDateOfUploadDate,String reminderNote, Date reminderDate) {
        this.content = content;
        this.contentType = contentType;
        this.assetCode = assetCode;
        this.assetName = assetName;
        this.subAssetName = subAssetName;
        this.subAssetCode = subAssetCode;
        this.filename = filename;
        this.lastmodifiedDate = lastmodifiedDate;
        this.orgId = orgId;
        this.status = status;
        this.userId = userId;
        this.name = name;
        this.email= email;
        this.customerType = contentType;
        this.documentName = documentName;
        this.documentCategory = documentCategory;
        this.documentType = documentType;
        this.documentExpirtyDate = documentExpirtyDate;
        this.documentDateOfUploadDate = documentDateOfUploadDate;
        this.reminderNote = reminderNote;
        this.reminderDate = reminderDate;
    }

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "s_no", unique = true, nullable = false)
    public Integer getSNo() {
        return this.SNo;
    }

    public void setSNo(Integer SNo) {
        this.SNo = SNo;
    }

    @Column(name = "content")
    public byte[] getContent() {
        return this.content;
    }

    public void setContent(byte[] content) {
        this.content = content;
    }

    @Column(name = "content_type", length = 100)
    public String getContentType() {
        return this.contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    @Column(name = "asset_code", length = 100)
    public String getAssetCode() {
        return this.assetCode;
    }

    public void setAssetCode(String assetCode) {
        this.assetCode = assetCode;
    }

    @Column(name = "file_name", length = 100)
    public String getFilename() {
        return this.filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "lastmodified_date", length = 19)
    public Date getLastmodifiedDate() {
        return this.lastmodifiedDate;
    }

    public void setLastmodifiedDate(Date lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }

    @Column(name = "org_id", length = 11)
    public String getOrgId() {
        return this.orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name = "status", length = 50)
    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Column(name = "user_id", length = 50)
    public String getUserId() {
        return this.userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Column(name = "customer_type")
    public String getCustomerType() {
        return customerType;
    }

    public void setCustomerType(String customerType) {
        this.customerType = customerType;
    }

    @Column(name = "document_name")
    public String getDocumentName() {
        return documentName;
    }

    public void setDocumentName(String documentName) {
        this.documentName = documentName;
    }

    @Column(name = "document_category")
    public String getDocumentCategory() {
        return documentCategory;
    }

    public void setDocumentCategory(String documentCategory) {
        this.documentCategory = documentCategory;
    }

    @Column(name = "document_type")
    public String getDocumentType() {
        return documentType;
    }

    public void setDocumentType(String documentType) {
        this.documentType = documentType;
    }

    @Column(name = "document_expiry_date")
    public Date getDocumentExpirtyDate() {
        return documentExpirtyDate;
    }

    public void setDocumentExpirtyDate(Date documentExpirtyDate) {
        this.documentExpirtyDate = documentExpirtyDate;
    }

    @Column(name = "document_date_of_upload")
    public Date getDocumentDateOfUploadDate() {
        return documentDateOfUploadDate;
    }

    public void setDocumentDateOfUploadDate(Date documentDateOfUploadDate) {
        this.documentDateOfUploadDate = documentDateOfUploadDate;
    }

    @Column(name = "asset_name")
    public String getAssetName() {
        return assetName;
    }

    public void setAssetName(String assetName) {
        this.assetName = assetName;
    }

    @Column(name = "sub_asset_name")
    public String getSubAssetName() {
        return subAssetName;
    }

    public void setSubAssetName(String subAssetName) {
        this.subAssetName = subAssetName;
    }

    @Column(name = "sub_asset_code")
    public String getSubAssetCode() {
        return subAssetCode;
    }

    public void setSubAssetCode(String subAssetCode) {
        this.subAssetCode = subAssetCode;
    }

    @Column(name = "reminder_note")
    public String getReminderNote() {
        return reminderNote;
    }

    public void setReminderNote(String reminderNote) {
        this.reminderNote = reminderNote;
    }

    @Column(name = "reminder_date")
    public Date getReminderDate() {
        return reminderDate;
    }

    public void setReminderDate(Date reminderDate) {
        this.reminderDate = reminderDate;
    }
    
    
    
}
