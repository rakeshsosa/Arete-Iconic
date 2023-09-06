/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import tenant.classes.GoodsReceiptNote;

import tenant.classes.InvoiceDetails;

/**
 *
 * @author ebs05
 */
public class InvoiceDAO extends HibernateDaoSupport {

    public List<InvoiceDetails> getInvoiceDetailsForList(String orgId) {
        List<InvoiceDetails> grnDetails = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            String sqlQry = "SELECT distinct invoice_no,po_no,supplier_name,grn,doc_type,doc_date FROM arete_tms.invoice_details WHERE status!='Inactive' and org_id='" + orgId + "'";
            grnDetails = session.createSQLQuery(sqlQry).list();
            tx.commit();
            tx = null;
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return grnDetails;
    }

    public List<String> getSupplierDetails(String orgId) {
        List<String> grnDetails = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            String nsQry = "SELECT DISTINCT supplier_name FROM arete_tms.good_receipt_note WHERE status!='Inactive' and org_id='" + orgId + "' and (invoice_status IS NULL OR invoice_status!='GENERATED')";
            grnDetails = session.createSQLQuery(nsQry).list();
            tx.commit();
            tx = null;
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return grnDetails;
    }

    public void getGRNDetailsBySupNoAndPONoFromDB(HttpServletResponse response, String orgId, String supplyName, String qpono) {
        List<Object[]> poNoList = null;
        Transaction tx = null;
        PrintWriter out = null;
        String allGRNNo = "";
        Session session = getSessionFactory().openSession();
        try {
            out = response.getWriter();
            tx = session.beginTransaction();
            String nsQry = "SELECT distinct g.po_no,(SELECT distinct payment_terms from arete_tms.purchase_order where purchase_order_no=g.po_no) as pterms,invoice_date,invoice_no,good_receipt_no FROM arete_tms.good_receipt_note g  WHERE g.status!='Inactive' and g.org_id='" + orgId + "' and g.supplier_name='" + supplyName + "' and " + qpono + " and (g.invoice_status IS NULL OR g.invoice_status!='GENERATED')";
            //            String nsQry="SELECT g.S_NO,g.PO_NO,p.PAYMENT_TERMS FROM GOODS_RECEIPT_NOTE g INNER JOIN PURCHASE_ORDER p on g.PO_NO=p.PURCHASE_ORDER_NO WHERE g.STATUS!='Inactive' and g.ORG_ID='"+orgId+"' and g.SUPPLIER_NAME='"+supplyName+"' and g.PO_NO='"+pono+"' and (g.INVOICE_STATUS IS NULL OR g.INVOICE_STATUS!='GENERATED')";
            poNoList = session.createSQLQuery(nsQry).list();
            Iterator<Object[]> itr = poNoList.iterator();
            while (itr.hasNext()) {
                Object[] grnDetails = itr.next();
                if ("".equals(allGRNNo) || allGRNNo == null) {
                    allGRNNo = "" + grnDetails[0] + "," + grnDetails[1] + "," + grnDetails[2] + "," + grnDetails[3] + "," + grnDetails[4];
                } else {
                    String rVal = "" + grnDetails[0] + "," + grnDetails[1] + "," + grnDetails[2] + "," + grnDetails[3] + "," + grnDetails[4];
                    allGRNNo = allGRNNo + "_" + rVal;
                }
            }
            out.append(allGRNNo);
            tx.commit();
            tx = null;
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            session.close();
        }

    }

    public void getGRNDetailsBySupNoAndGRNFromDB(HttpServletResponse response, String orgId, String supplyName, String grnVal) {
        List<Object[]> poNoList = null;
        Transaction tx = null;
        PrintWriter out = null;
        String allGRNNo = "";
        Session session = getSessionFactory().openSession();
        try {
            out = response.getWriter();
            tx = session.beginTransaction();
            String nsQry = "SELECT distinct g.po_no,(SELECT distinct payment_terms from arete_tms.purchase_order where purchase_order_no=g.po_no) as pterms,invoice_date,invoice_no,good_receipt_no  FROM arete_tms.good_receipt_note g  WHERE g.status!='Inactive' and g.org_id='" + orgId + "' and g.supplier_name='" + supplyName + "' and " + grnVal + " and (g.invoice_status IS NULL OR g.invoice_status!='GENERATED')";
            poNoList = session.createSQLQuery(nsQry).list();
            Iterator<Object[]> itr = poNoList.iterator();
            while (itr.hasNext()) {
                Object[] grnDetails = itr.next();
                if ("".equals(allGRNNo) || allGRNNo == null) {
                    allGRNNo = "" + grnDetails[0] + "," + grnDetails[1] + "," + grnDetails[2] + "," + grnDetails[3] + "," + grnDetails[4];
                } else {
                    String rVal = "" + grnDetails[0] + "," + grnDetails[1] + "," + grnDetails[2] + "," + grnDetails[3] + "," + grnDetails[4];
                    allGRNNo = allGRNNo + "_" + rVal;
                }
            }
            out.append(allGRNNo);
            tx.commit();
            tx = null;
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            session.close();
        }

    }

    public List<String> getPONo(HttpServletResponse response, String orgId, String supplyName) {
        List<String> poNoList = null;
        Transaction tx = null;
        PrintWriter out = null;
        String allPoNo = "";
        Session session = getSessionFactory().openSession();
        try {
            out = response.getWriter();
            tx = session.beginTransaction();
            String nsQry = "SELECT DISTINCT po_no FROM arete_tms.good_receipt_note WHERE status!='Inactive' and org_id='" + orgId + "' and supplier_name='" + supplyName + "' and (invoice_status IS NULL OR invoice_status!='GENERATED')";
            poNoList = session.createSQLQuery(nsQry).list();
            Iterator<String> itr = poNoList.iterator();
            while (itr.hasNext()) {
                String pono = itr.next();
                if ("".equals(allPoNo) || allPoNo == null) {
                    allPoNo = pono;
                } else {
                    allPoNo = allPoNo + "_" + pono;
                }
            }
            out.append(allPoNo);
            tx.commit();
            tx = null;
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            session.close();
        }
        return poNoList;
    }

    public List<String> getGRNNo(HttpServletResponse response, String orgId, String supplyName) {
        List<String> poNoList = null;
        Transaction tx = null;
        PrintWriter out = null;
        String allGRNNo = "";
        Session session = getSessionFactory().openSession();
        try {
            out = response.getWriter();
            tx = session.beginTransaction();
            String nsQry = "SELECT DISTINCT good_receipt_no FROM arete_tms.good_receipt_note WHERE status!='Inactive' and org_id='" + orgId + "' and supplier_name='" + supplyName + "' and (invoice_status IS NULL OR invoice_status!='GENERATED')";
            poNoList = session.createSQLQuery(nsQry).list();
            Iterator<String> itr = poNoList.iterator();
            while (itr.hasNext()) {
                String grnno = itr.next();
                if ("".equals(allGRNNo) || allGRNNo == null) {
                    allGRNNo = grnno;
                } else {
                    allGRNNo = allGRNNo + "_" + grnno;
                }
            }
            out.append(allGRNNo);
            tx.commit();
            tx = null;
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            session.close();
        }
        return poNoList;
    }

    public List<GoodsReceiptNote> getGrnDetails2(String orgId, String pono, String grnno) {
        List<GoodsReceiptNote> grnDetails = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            String hqlQry = "from GoodsReceiptNote where status!='Inactive' and orgId='" + orgId + "' and poNo='" + pono + "' and goodReceiptNo='" + grnno + "'";
            grnDetails = session.createQuery(hqlQry).list();
            tx.commit();
            tx = null;
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return grnDetails;
    }

    public String getGeneratedReceiveForQty(String orgId, String supplyName, String qpono, String itemnm) {
        List<Object> poNoList = null;
        String qty = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            String nsQry = "SELECT SUM(grn_qty) FROM arete_tms.invoice_details WHERE status!='Inactive' and org_id='" + orgId + "' and supplier_name='" + supplyName + "' and po_no='" + qpono + "' and item_name='" + itemnm + "'";
            poNoList = session.createSQLQuery(nsQry).list();
            qty = "" + poNoList.get(0);
            tx.commit();
            tx = null;
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return qty;
    }

    public String getCurrencyByPO(String orgId, String poNo) {
        List<String> grnDetails = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        String cur = null;
        try {
            tx = session.beginTransaction();
            String nsQry = "SELECT currency FROM arete_tms.purchase_order where purchase_order_no='" + poNo + "' and org_id='" + orgId + "' and status!='Inactive'";
            grnDetails = session.createSQLQuery(nsQry).list();
            cur = grnDetails.get(0);
            tx.commit();
            tx = null;
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return cur;
    }

    public List<GoodsReceiptNote> getGrnDetailsByGRNNo(String orgId, String pono, String grnNo) {
        List<GoodsReceiptNote> grnDetails = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
//            String sqlQry="SELECT PO_NO,GOOD_RECEIPT_NO,ITEM_NAME,UNIT_PRICE,RECEIVING_QTY,DISCOUNT FROM GOODS_RECEIPT_NOTE where ORG_ID='"+orgId+"' and PO_NO='"+pono+"' and STATUS!='Inactive' and GOOD_RECEIPT_NO IN("+grnNo+") and (INVOICE_STATUS IS NULL OR INVOICE_STATUS!='GENERATED')";
            String hqlQry = "from GoodsReceiptNote where status!='Inactive' and orgId='" + orgId + "' and poNo='" + pono + "' and goodReceiptNo in(" + grnNo + ")";
            grnDetails = session.createQuery(hqlQry).list();
            tx.commit();
            tx = null;
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return grnDetails;
    }

    public String getGeneratedReceiveForQty1(String orgId, String supplyName, String qpono, String itemnm, String grn) {
        List<Object> poNoList = null;
        String qty = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            String nsQry = "SELECT SUM(grn_qty) FROM arete_tms.invoice_details WHERE status!='Inactive' and org_id='" + orgId + "' and supplier_name='" + supplyName + "' and po_no='" + qpono + "' and item_name='" + itemnm + "' and grn='" + grn + "'";
            poNoList = session.createSQLQuery(nsQry).list();
            qty = "" + poNoList.get(0);
            tx.commit();
            tx = null;
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return qty;
    }

    public String saveInvoiceDetails(String orgId, String supplierName, String poNo, String docType, String unitP, String grnQty, String stype, String grno, String invNo) {
        List<String> grnDetails = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        String cur = null;
        try {

            DateFormat dateFormat = new SimpleDateFormat("dd-mm-yyyy");
            String docDate = dateFormat.format(new Date());
            tx = session.beginTransaction();
            String payTermVal = getPayTermsByPO(orgId, supplierName, poNo);
            List<GoodsReceiptNote> getGrnDetails = getGrnDetails2(orgId, poNo, grno);
            Iterator<GoodsReceiptNote> itr = getGrnDetails.iterator();
            String unitPArr[] = unitP.split("_");
            String grnQtyArr[] = grnQty.split("_");
            Integer cnt = 0;
            Integer icnt = 0;
            while (itr.hasNext()) {
                GoodsReceiptNote grNote = itr.next();
                InvoiceDetails invoiceDetails = new InvoiceDetails();
                invoiceDetails.setInvoiceNo(invNo);
                invoiceDetails.setSupplierName(supplierName);
                invoiceDetails.setPoNo(poNo);
                invoiceDetails.setGrn(grNote.getGoodReceiptNo());
                invoiceDetails.setDocType(docType);
                invoiceDetails.setDocRef(grNote.getInvoiceNo());
                invoiceDetails.setDocDate(grNote.getInvoiceDate());
                invoiceDetails.setPaymentTerms(payTermVal);
                invoiceDetails.setItemName(grNote.getItemName());
                Double billAmt = 0.0;
                Double uPrice = 0.0;
                Double gQty = 0.0;
                if (unitP == null || unitP == "") {
                    invoiceDetails.setUnitPrice(grNote.getUnitPrice());
                    uPrice = grNote.getUnitPrice();
                } else {
                    invoiceDetails.setUnitPrice(Double.parseDouble(unitPArr[cnt]));
                    uPrice = Double.parseDouble(unitPArr[cnt]);
                }
                if (grnQty == null || grnQty == "") {
                    invoiceDetails.setGrnQty(grNote.getReceivingQty());
                    gQty = grNote.getReceivingQty();
                } else {
                    invoiceDetails.setGrnQty(Double.parseDouble(grnQtyArr[cnt]));
                    gQty = Double.parseDouble(grnQtyArr[cnt]);
                }
                invoiceDetails.setTotQty(grNote.getOrderQuantity());

                if (grNote.getOrderQuantity() - gQty == 0) {
                    icnt++;
                }

                Double totAmt = uPrice * gQty;
                Double totDiscount = (totAmt * (grNote.getDiscount())) / 100;
                billAmt = totAmt - totDiscount;

                invoiceDetails.setBilledAmt(billAmt);
                invoiceDetails.setStatus("update0");
                invoiceDetails.setLastModifiedDate(new Date());
                invoiceDetails.setCurrency(getCurrencyByPO(orgId, poNo));
                invoiceDetails.setOrgId(orgId);
                session.save(invoiceDetails);
                cnt++;
            }

            if (cnt - icnt == 0) {
                String nsql = "UPDATE arete_tms.good_receipt_note SET invoice_status='GENERATED' WHERE org_id='" + orgId + "' and supplier_name='" + supplierName + "' and po_no='" + poNo + "'";
                Query q = session.createSQLQuery(nsql);
                q.executeUpdate();
                String nsql1 = "UPDATE arete_tms.purchase_order SET invoice_status='GENERATED' WHERE org_id='" + orgId + "' and supplier_code='" + supplierName + "' and purchase_order_no='" + poNo + "'";
                Query q1 = session.createSQLQuery(nsql1);
                q1.executeUpdate();
            } else {
                String nsql = "UPDATE arete_tms.good_receipt_note SET invoice_status='PARTIALLY GENERATED' WHERE org_id='" + orgId + "' and supplier_name='" + supplierName + "' and po_no='" + poNo + "'";
                Query q = session.createSQLQuery(nsql);
                q.executeUpdate();
                String nsql1 = "UPDATE arete_tms.purchase_order SET invoice_status='PARTIALLY GENERATED' WHERE org_id='" + orgId + "' and supplier_code='" + supplierName + "' and purchase_order_no='" + poNo + "'";
                Query q1 = session.createSQLQuery(nsql1);
                q1.executeUpdate();
            }
            tx.commit();
            tx = null;
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return cur;
    }

    public String getPayTermsByPO(String orgId, String supplyName, String qpono) {
        List<Object[]> poNoList = null;
        String payTerms = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            String nsQry = "SELECT DISTINCT payment_terms FROM arete_tms.purchase_order where org_id='" + orgId + "' and supplier_code='" + supplyName + "' and purchase_order_no='" + qpono + "'";
            poNoList = session.createSQLQuery(nsQry).list();
            payTerms = "" + poNoList.get(0);
            tx.commit();
            tx = null;
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return payTerms;
    }

    public List<InvoiceDetails> getInvoiceDetailsByInvRefNo(String orgId, String invrefno) {
        List<InvoiceDetails> grnDetails = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            String sqlQry = "from InvoiceDetails where orgId='" + orgId + "' and invoiceNo='" + invrefno + "'";
            grnDetails = session.createQuery(sqlQry).list();
            tx.commit();
            tx = null;
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return grnDetails;
    }

    public String getCurrencyByInvNo(String orgId, String invno) {
        List<String> grnDetails = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        String cur = null;
        try {
            tx = session.beginTransaction();
            String nsQry = "SELECT currency FROM arete_tms.invoice_details WHERE org_id='" + orgId + "' and invoice_no='" + invno + "'";
            grnDetails = session.createSQLQuery(nsQry).list();
            cur = grnDetails.get(0);
            tx.commit();
            tx = null;
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return cur;
    }

    public List<InvoiceDetails> getInvoiceDetailsDistinct(String orgId, String invno) {
        List<InvoiceDetails> grnDetails = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            String nsQry = "SELECT DISTINCT supplier_name,grn,po_no,doc_type,doc_ref,doc_date,payment_terms FROM arete_tms.invoice_details WHERE org_id='" + orgId + "' and invoice_no='" + invno + "'";
            grnDetails = session.createSQLQuery(nsQry).list();
            tx.commit();
            tx = null;
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return grnDetails;
    }
}
