/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.classes;

import java.sql.Timestamp;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Munusamy
 */
@Entity
@Table(name = "purchase_item_desc", schema = "arete_tms"
)
public class PurchaseItemDescription implements java.io.Serializable{
    
    private Integer sno;
    private String orgId;
    private String userId;
    private String itemdesc;
    private Double itemrate;
    private Double itemqty;
    private Double itemtotal;
    private String itemdetails;
    private Double subTotal;
    private Double taxpercent;
    private Double total;
    private Double baldue;
    private String invoiceno;
    private String status;
    private String recordStatus;
    private Double rate;
    private String taxType;
    private String discountType;
    private Double discountrate;
    private String currencyType;
    private String incsummary;
    private Double amountpaid;
    private Double amountPaidRate;
    
    private String productCategory;
   private Double vatAmount;
    private String document;
   private Double itemvattotal;
   private Double vatpertotl;
   private Double discAmount;
   private Double itemdisctotal;
    private String itemType;
    //private  Double stock;
   // private Double servicetimespan;
    private Double discpercent;
    //private String servicetimespan;
    private String uomType;
    
    private String brandName ;
    
    
    private java.sql.Timestamp lastmodifiedDate;
    
    private String poCode;
    private String grnNumber;
    private Date receiptDate;
    
   
    
    
    
    public PurchaseItemDescription(){
        
    }
    
    public PurchaseItemDescription(String userId,String orgId,String poCode,String itemdetails,String productCategory,
            Double itemrate,Double vatAmount,Double itemqty,Double itemtotal,Double subTotal,Double taxpercent,
            Double total,String status,String recordStatus,java.sql.Timestamp lastmodifiedDate,Double itemvattotal,
            String uomType,Double discAmount,Double itemdisctotal){
        this.userId=userId;
        this.orgId=orgId;
        this.poCode = poCode;
        this.itemdetails=itemdetails;
        this.productCategory=productCategory;
        this.itemrate=itemrate;
        this.vatAmount = vatAmount;
        this.itemqty=itemqty;
        this.itemtotal=itemtotal;
        this.subTotal=subTotal;
        this.taxpercent=taxpercent;
        this.total=total;
        this.status=status;
        this.recordStatus=recordStatus;
        this.lastmodifiedDate=lastmodifiedDate;
        this.itemvattotal = itemvattotal;
        this.uomType = uomType;
        this.discAmount = discAmount;
        this.itemdisctotal = itemdisctotal;
       
       
    }
    
    
     public PurchaseItemDescription(Integer sno,String userId,String orgId,String poCode,String itemdetails,String productCategory,
            Double itemrate,Double vatAmount,Double itemqty,Double itemtotal,Double subTotal,Double taxpercent,
            Double total,String status,String recordStatus,java.sql.Timestamp lastmodifiedDate,Double itemvattotal,
            String uomType,Double discAmount,Double itemdisctotal){
        this.sno=sno;
        this.userId=userId;
        this.orgId=orgId;
        this.poCode = poCode;
        this.itemdetails=itemdetails;
        this.productCategory=productCategory;
        this.itemrate=itemrate;
        this.vatAmount = vatAmount;
        this.itemqty=itemqty;
        this.itemtotal=itemtotal;
        this.subTotal=subTotal;
        this.taxpercent=taxpercent;
        this.total=total;
        this.status=status;
        this.recordStatus=recordStatus;
        this.lastmodifiedDate=lastmodifiedDate;
        this.itemvattotal = itemvattotal;
        this.uomType = uomType;
        this.discAmount = discAmount;
        this.itemdisctotal = itemdisctotal;       
       
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

    @Column(name="org_id", length=50)
    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    @Column(name="user_id", length=50)
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Column(name="item_desc", length=50)
    public String getItemdesc() {
        return itemdesc;
    }

    public void setItemdesc(String itemdesc) {
        this.itemdesc = itemdesc;
    }
    
    @Column(name="item_rate", length=50)
    public Double getItemrate() {
        return itemrate;
    }

    public void setItemrate(Double itemrate) {
        this.itemrate = itemrate;
    }

    @Column(name="item_qty", length=50)
    public Double getItemqty() {
        return itemqty;
    }

    public void setItemqty(Double itemqty) {
        this.itemqty = itemqty;
    }

    @Column(name="item_total", length=50)
    public Double getItemtotal() {
        return itemtotal;
    }

    public void setItemtotal(Double itemtotal) {
        this.itemtotal = itemtotal;
    }

   

    @Column(name="sub_total", length=50)
    public Double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(Double subTotal) {
        this.subTotal = subTotal;
    }
    
    @Column(name="tax_percent", length=50)
    public Double getTaxpercent() {
        return taxpercent;
    }

    public void setTaxpercent(Double taxpercent) {
        this.taxpercent = taxpercent;
    }

    @Column(name="total", length=50)
    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }
    
    @Column(name="invoice_no", length=50)
    public String getInvoiceno() {
        return invoiceno;
    }

    public void setInvoiceno(String invoiceno) {
        this.invoiceno = invoiceno;
    }
    
    

    @Column(name="bal_due", length=50)
    public Double getBaldue() {
        return baldue;
    }

    public void setBaldue(Double baldue) {
        this.baldue = baldue;
    }

    @Column(name="status", length=50)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    @Column(name="record_status", length=50)
    public String getRecordStatus() {
        return recordStatus;
    }

    public void setRecordStatus(String recordStatus) {
        this.recordStatus = recordStatus;
    }

    @Column(name="rate", length=50)
    public Double getRate() {
        return rate;
    }

    public void setRate(Double rate) {
        this.rate = rate;
    }
    
    

    @Column(name = "lastmodified_date")
    public Timestamp getLastmodifiedDate() {
        return lastmodifiedDate;
    }

    public void setLastmodifiedDate(Timestamp lastmodifiedDate) {
        this.lastmodifiedDate = lastmodifiedDate;
    }

    @Column(name="tax_type", length=50)
    public String getTaxType() {
        return taxType;
    }

    public void setTaxType(String taxType) {
        this.taxType = taxType;
    }

    @Column(name="discount_type", length=50)
    public String getDiscountType() {
        return discountType;
    }

    public void setDiscountType(String discountType) {
        this.discountType = discountType;
    }

    @Column(name="discount_rate", length=50)
    public Double getDiscountrate() {
        return discountrate;
    }

    public void setDiscountrate(Double discountrate) {
        this.discountrate = discountrate;
    }
    
    @Column(name="currency_type", length=50)
    public String getCurrencyType() {
        return currencyType;
    }

    public void setCurrencyType(String currencyType) {
        this.currencyType = currencyType;
    }

    @Column(name="inc_summary", length=50)
    public String getIncsummary() {
        return incsummary;
    }

    public void setIncsummary(String incsummary) {
        this.incsummary = incsummary;
    }

    @Column(name="amount_paid", length=50)
    public Double getAmountpaid() {
        return amountpaid;
    }

    public void setAmountpaid(Double amountpaid) {
        this.amountpaid = amountpaid;
    }

    @Column(name="amount_paid_rate", length=50)
    public Double getAmountPaidRate() {
        return amountPaidRate;
    }

    public void setAmountPaidRate(Double amountPaidRate) {
        this.amountPaidRate = amountPaidRate;
    }
     
     @Column(name="product_category", length=50)
    public String getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(String productCategory) {
        this.productCategory = productCategory;
    }

   
   
    

    @Column(name="document",length = 300)
    public String getDocument() {
        return document;
    }

    public void setDocument(String document) {
        this.document = document;
    }

   
    @Column(name="item_type")
    public String getItemType() {
        return itemType;
    }

    public void setItemType(String itemType) {
        this.itemType = itemType;
    }

    
   
  

    @Column(name="discpercent")
    public Double getDiscpercent() {
        return discpercent;
    }

    public void setDiscpercent(Double discpercent) {
        this.discpercent = discpercent;
    }

    @Column(name="uom_type")
    public String getUomType() {
        return uomType;
    }

    public void setUomType(String uomType) {
        this.uomType = uomType;
    }

   @Column(name="vat_amount")
    public Double getVatAmount() {
        return vatAmount;
    }

    public void setVatAmount(Double vatAmount) {
        this.vatAmount = vatAmount;
    }

    @Column(name="item_vat_total")
    public Double getItemvattotal() {
        return itemvattotal;
    }

    public void setItemvattotal(Double itemvattotal) {
        this.itemvattotal = itemvattotal;
    }
    
    @Column(name="vat_per_total")
    public Double getVatpertotl() {
        return vatpertotl;
    }

    public void setVatpertotl(Double vatpertotl) {
        this.vatpertotl = vatpertotl;
    }
    
    @Column(name = "brand_name")
    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    @Column(name = "purchase_order_code")
    public String getPoCode() {
        return poCode;
    }

    public void setPoCode(String poCode) {
        this.poCode = poCode;
    }

    @Column(name = "disc_amount")
    public Double getDiscAmount() {
        return discAmount;
    }

    public void setDiscAmount(Double discAmount) {
        this.discAmount = discAmount;
    }

    @Column(name = "item_disc_total")
    public Double getItemdisctotal() {
        return itemdisctotal;
    }

    public void setItemdisctotal(Double itemdisctotal) {
        this.itemdisctotal = itemdisctotal;
    }
   
    @Column(name = "grn_number")
    public String getGrnNumber() {
        return grnNumber;
    }

    public void setGrnNumber(String grnNumber) {
        this.grnNumber = grnNumber;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "receipt_date")
    public Date getReceiptDate() {
        return receiptDate;
    }

    public void setReceiptDate(Date receiptDate) {
        this.receiptDate = receiptDate;
    }
    
    @Column(name="item_details", length=250)
    public String getItemdetails() {
        return itemdetails;
    }

    public void setItemdetails(String itemdetails) {
        this.itemdetails = itemdetails;
    }
}
