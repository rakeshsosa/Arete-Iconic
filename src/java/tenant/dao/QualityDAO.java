/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
//import tenant.classes.GRNFinance;
import tenant.classes.GoodsReceiptNote;
import tenant.classes.PurchaseOrder;
import tenant.classes.Grn;
import tenant.classes.InventoryCount;
import tenant.classes.Inventorylist;
import tenant.classes.ItemCategory;
import tenant.classes.ItemCreation;
import tenant.classes.ItemMaster;
import tenant.classes.ItemSubcategory;
import tenant.classes.ItemSupplier;
import tenant.classes.ItemsStore;
import tenant.classes.MaterialReturn;
import tenant.classes.Quality;
import tenant.classes.QualityInspection;
import tenant.classes.ReceivingProcess;
import tenant.classes.StockEntry;
import tenant.classes.StockLedger;
import tenant.classes.StoreMaster;
import tenant.classes.SupplierMaster;
import tenant.classes.UomMaster;
import tenant.other.classes.commonInterface;

/**
 *
 * @author EBS-SDD15
 */
public class QualityDAO extends HibernateDaoSupport implements commonInterface {

    public Integer checkUser(String user, String pass) {
        Integer noofuser = 0;
        List<BigInteger> totuser = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            totuser = session.createSQLQuery("SELECT count(*) FROM user_registration where USER_ID='" + user + "' and PASSWORD='" + pass + "'").list();
            String val = "" + totuser.get(0);
            noofuser = Integer.parseInt(val);
            tx.commit();
            tx = null;
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return noofuser;
    }

    public List<String> testForm(String link, String tab) {
        List<String> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("SELECT SNO,Field_Name,Field_Status,Is_Required FROM arete_tms.test_form where Jsp_Page='" + link + "' and TAB_NAME='" + tab + "'");

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
//************** Purchase Order List******************//

    public List<PurchaseOrder> poList(String SNo) {
        List<PurchaseOrder> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo != null) {
                query = session.createQuery("from PurchaseOrder where status!='Inactive' and SNo='" + SNo + "' ");
            } else {
                query = session.createQuery("from PurchaseOrder where status!='Inactive' and (recordStatus!='Approved' and recordStatus!='Rejected') group by poNo");
            }
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
//************** Quality List******************//

    public List<Quality> qaList(String SNo) {
        List<Quality> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo != null) {
                query = session.createQuery("from Quality where status!='Inactive' and SNo='" + SNo + "' ");
            } else {
                query = session.createQuery("from Quality where status!='Inactive' group by poNo");
            }
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
//************** Purchase Order List******************//

    public List<PurchaseOrder> poFormList(String SNo) {
        List<PurchaseOrder> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo != null) {
                query = session.createQuery("from PurchaseOrder where status!='Inactive'");
            } else {
                query = session.createQuery("from PurchaseOrder where status!='Inactive' ");
            }
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }
//************** Purchase Order List******************//

    public List<PurchaseOrder> poFormList1(String poNo) {
        List<PurchaseOrder> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (poNo != null) {
                query = session.createQuery("from PurchaseOrder where status!='Inactive' and poNo='" + poNo + "'");
            } else {
                query = session.createQuery("from PurchaseOrder where status!='Inactive' and poNo='" + poNo + "'");
            }
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    //************** To get Auto Genneration code for Quality******************//
    public List<Quality> getQANo(String miDate) {
        List<Quality> code = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (miDate != null) {
                query = session.createSQLQuery("SELECT qa FROM arete_tms.quality where qa like '%Quality%' ORDER BY sno ASC");
            } else {
                query = session.createQuery("from Quality where  status!='Inactive' ORDER BY lastmodifiedDate DESC");
            }
            code = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }

        return code;
    }

    //************** Quality Save******************//
    @Override
    public void globalSave(Object quality) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(quality);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    //************** Updating the Purchase Order Status******************//
    public void PurchaseStatus(String poNo, String qualityStatus) throws HibernateException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update PurchaseOrder set recordStatus='" + qualityStatus + "' where poNo='" + poNo + "'";
            Query query = session.createQuery(hql);
            query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    //************** Quality Rejected List******************//
    public List<Quality> rejectedList1(String SNo) {
        List<Quality> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo != null) {
                query = session.createQuery("from Quality where status!='Inactive' and SNo='" + SNo + "'");
            } else {
                query = session.createQuery("from Quality where status!='Inactive' and qualityStatus ='Rejected'");
            }
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    //************** Quality Rejected Form******************//
    public List<QualityInspection> rejectedFormList(String qa) {
        List<QualityInspection> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (qa != null) {
                query = session.createSQLQuery("select * from arete_tms.quality_inspection where rejected_qty > 0 and material_receipt_no='" + qa + "'");
            } else {
                query = session.createQuery("from QualityInspection where status!='Inactive' and rejectedQty !=' '");
            }
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    //************** Quality Approved List******************//
    public List<Quality> approvedList(String SNo) {
        List<Quality> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo != null) {
                query = session.createQuery("from Quality where status!='Inactive' and SNo='" + SNo + "'");
            } else {
//                query = session.createQuery("from Quality where status!='Inactive' and qualityStatus ='Approved' group by qa");
                query = session.createQuery("from Quality where qtyAccepted > 0 and qualityStatus ='Approved' group by qa");
            }
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    //************** To Fetch Batch No.******************//
    public void fetchbatchNo(HttpServletRequest req, HttpServletResponse res, String batchNo) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<Quality> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM Quality where ((lower(batchNo) like lower('" + batchNo + "')) or (upper (batchNo) like upper ('" + batchNo + "'))) and status!='Inactive'");
            citydata = query.list();
            if (citydata.isEmpty()) {
                out.append("Available");
            } else {
                out.append("Already Exists.Enter another");
            }
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("exception");
        } finally {
            session.close();
        }
    }

    //************** To Fetch Invoice******************//
    public void fetchInvoice(HttpServletRequest req, HttpServletResponse res, String customerInvoiceNo) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<Quality> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM Quality where ((lower(customerInvoiceNo) like lower('" + customerInvoiceNo + "')) or (upper (customerInvoiceNo) like upper ('" + customerInvoiceNo + "'))) and status!='Inactive'");
            citydata = query.list();
            if (citydata.isEmpty()) {
                out.append("Available");
            } else {
                out.append("Already Exists.Enter another");
            }
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("exception");
        } finally {
            session.close();
        }
    }

//    @Override
//    public List<Class> list(String instanceVariable, String className) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
    @Override
    public List<Class> list(Integer instanceVariable, String className) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void globalDelete(Integer instanceVariable) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    //************** Accepted Quality List******************//
    public List<Quality> qualityList(String qa) {
        List<Quality> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from Quality where qa='" + qa + "' and qtyAccepted > 0 ");

            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    //************** GRN List******************//
    public List<Grn> grnList1(String grnNo) {
        List<Grn> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from Grn where grnNo='" + grnNo + "' ");

            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    //************** To Calculate Total Accepted Price******************//
    public List<Quality> qualityListSumTotal(String poNo) {
        List<Quality> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("select sum(qtyAccepted * unitPrice) from Quality where status!='Inactive' and poNo='" + poNo + "' and qualityStatus ='Approved' ");

            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    //************** To Update Quality Status******************//
    public void updateQuality(String poNo) throws HibernateException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update Quality set qualityStatus='GRN Created' where poNo='" + poNo + "'";
            Query query = session.createQuery(hql);
            query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    //************** To Auto Generate GRN Code******************//
    public List<Grn> getGrnNo(String poNo) {
        List<Grn> code = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (poNo != null) {
                query = session.createSQLQuery("SELECT grn_no FROM arete_tms.grn_details where grn_no like '%GRN%' ORDER BY s_no ASC");
            } else {
                query = session.createQuery("from Grn where  status!='Inactive' ORDER BY lastmodifiedDate DESC");
            }
            code = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }

        return code;
    }

    //************** GRN Save******************//
    public void grnSave(Object Grn) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(Grn);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    //************** To Update Quality Status******************//
    public void updateReturnStatus(String qa) {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update QualityInspection set returnStatus='Returned' where materialReceiptNo='" + qa + "'";
            Query query = session.createQuery(hql);
            int row = query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }

    }

    //************** To Save Inventory******************//
    public void SaveInventory(Inventorylist transientInstance) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(transientInstance);
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.clear();
            session.close();
        }
    }

    //************** To Save Inventory******************//
    public void SaveInventory(List<Inventorylist> grid) throws HibernateException, SQLException {
        for (Iterator<Inventorylist> iterator = grid.iterator(); iterator.hasNext();) {
            Inventorylist test = (Inventorylist) iterator.next();
            SaveInventory(test);
        }
    }

    //************** Inventory List******************//
    public List<Inventorylist> fetchinventlist(String itemCode) {
        List<Inventorylist> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (itemCode != null) {
                query = session.createQuery("from Inventorylist where  status!='Inactive' and itemCode='" + itemCode + "'");

            }
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    //************** Update Inventory******************//
    public void updateinventory(String itemCode, Double availableQty) {

        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        String hql = null;
        try {
            tx = session.beginTransaction();
            if (availableQty != null) {
                hql = "update Inventorylist set totalStock='" + availableQty + "' where itemCode='" + itemCode + "' ";
            }
            query = session.createQuery(hql);
            int row = query.executeUpdate();

            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    //************** GRN List******************//
    public List<GoodsReceiptNote> grnList(String sno) {
        List<GoodsReceiptNote> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from GoodsReceiptNote where status!='Inactive' and SNo='" + sno + "'");
            } else {
                query = session.createQuery("from GoodsReceiptNote where status!='Inactive' group by goodReceiptNo");
            }
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    //************** Material Return List******************//
    public List<MaterialReturn> returnList(String sno) {
        List<MaterialReturn> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from MaterialReturn where status!='Inactive' and SNo='" + sno + "'");
            } else {
                query = session.createQuery("from MaterialReturn where status!='Inactive' group by mrNo");
            }
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    // Newly added by lakshmi for dashboard based on from and to dates on 26mar2019
     public List<MaterialReturn> returnList1(String sno,String fromDate, String toDate) {
        List<MaterialReturn> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from MaterialReturn where status!='Inactive' and SNo='" + sno + "'");
            } else {
//                query = session.createQuery("from MaterialReturn where status!='Inactive' and lastmodifiedDate >='" + fromDate + "' and lastmodifiedDate <='" + toDate + "'and return_status='Material Returned' and status!='Inactive' group by mrNo");
                query = session.createQuery("from MaterialReturn where status!='Inactive' and lastmodifiedDate >='" + fromDate + "' and lastmodifiedDate <='" + toDate + "'and return_status='CFO Approved' and status!='Inactive' group by mrNo");
            }
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
    //************** Quality Rejected List******************//
    public List<Quality> rejectedList(String SNo) {
        List<Quality> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo != null) {
                query = session.createQuery("from Quality where status!='Inactive'");
            } else {
                query = session.createQuery("from Quality where qtyRejected > 0 group by qa");
            }
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    //************** To Auto generate Material Return Code ******************//
    public Integer getMRNo() throws HibernateException, SQLException {
        List<MaterialReturn> datalist = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        Integer tsno = null;
        try {
            query = session.createQuery("from MaterialReturn order by sno DESC");
            query.setMaxResults(1);
            datalist = query.list();
            if (datalist.size() == 0) {
                tsno = 0;
            } else {
                MaterialReturn tc = datalist.get(0);
                tsno = tc.getSno();
            }
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tsno;
    }

    //**************  Material Return GMC Approval List ******************//
    public List<MaterialReturn> gmcApprovalList(String sno, String mrNo) {
        List<MaterialReturn> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null || sno != "") {
                query = session.createQuery("from MaterialReturn where status!='Inactive' and mrNo='" + mrNo + "'");
            } else {
                query = session.createQuery("from MaterialReturn where status!='Inactive' and returnStatus='Material Returned' group by mrNo");
            }
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    //************** To Update Material Return  ******************//
    public void mrApproval1(String mrNo, String approvalStatus1, String approverRemarks1) throws HibernateException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update MaterialReturn set returnStatus='" + approvalStatus1 + "', approverRemarks1='" + approverRemarks1 + "' where mrNo='" + mrNo + "'";
            Query query = session.createQuery(hql);
            query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    //************** To Update Material Return Approval Status ******************//
    public void mrApproval2(String mrNo, String approvalStatus1, String approverRemarks1) throws HibernateException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update MaterialReturn set returnStatus='" + approvalStatus1 + "', approverRemarks2='" + approverRemarks1 + "' where mrNo='" + mrNo + "'";
            Query query = session.createQuery(hql);
            query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    //**************  Material Return GMC Approval List ******************//
    public List<MaterialReturn> gmcApprovalList2(String sno, String mrNo) {
        List<MaterialReturn> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null || sno != "") {
                query = session.createQuery("from MaterialReturn where status!='Inactive' and returnStatus='Material Returned' group by mrNo");
            } else {
                query = session.createQuery("from MaterialReturn where status!='Inactive' and returnStatus='Material Returned' group by mrNo");
            }
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    //**************  Material Return Approval 2 List ******************//
    public List<MaterialReturn> cfoApprovalList2(String sno, String mrNo) {
        List<MaterialReturn> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null || sno != "") {
                query = session.createQuery("from MaterialReturn where status!='Inactive' and (returnStatus='GFC Approved' or returnStatus='CFO Approved') group by mrNo");
            } else {
                query = session.createQuery("from MaterialReturn where status!='Inactive' and (returnStatus='GFC Approved' or returnStatus='CFO Approved') group by mrNo");
            }
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    //**************  Material Return Approval 2 List ******************//
    public List<MaterialReturn> cfoApprovalList(String sno, String mrNo) {
        List<MaterialReturn> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null || sno != "") {
                query = session.createQuery("from MaterialReturn where status!='Inactive' and mrNo='" + mrNo + "'");
            } else {
                query = session.createQuery("from MaterialReturn where status!='Inactive' and returnStatus='GFC Approved' group by mrNo");
            }
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    //**************  Inventory List ******************//
    public List<Inventorylist> inventoryList(String SNo) {
        List<Inventorylist> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo != null) {
                query = session.createQuery("from Inventorylist where status!='Inactive' and SNo='" + SNo + "' group by itemCode");
            } else {
                query = session.createQuery("from Inventorylist where status!='Inactive' and totalStock!='0' group by itemCode");
            }
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    //**************  Inventory Count List ******************//
    public List<InventoryCount> inventoryCountList(String orgId, String SNo) {
        List<InventoryCount> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo != null) {
                query = session.createQuery("from InventoryCount where status!='Inactive' and SNo='" + SNo + "'");
            } else {
                query = session.createQuery("from InventoryCount where status!='Inactive'");
            }
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    /////// Newly added By Lakshmi/////////
    public List<StockEntry> totalStockEntryList(String orgId, String SNo) {
        List<StockEntry> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo != null) {
                query = session.createQuery("from StockEntry where status!='Inactive' and SNo='" + SNo + "'");
            } else {
                query = session.createQuery("from StockEntry where status!='Inactive'");
            }
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    //**************  Inventory Count List ******************//
    public List<StockEntry> stockEntryCountList(String orgId, String SNo) {
        List<StockEntry> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo != null) {
                query = session.createQuery("from stockEntry where status!='Inactive' and S_no='" + SNo + "'");
            } else {
                query = session.createQuery("from stockEntry where status!='Inactive'");
            }
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    //////////////////////////////////////
    //**************  Accessory  List ******************//
    public List<ItemMaster> itemmaster(String itemCate) {
        List<ItemMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct i.ITEM_CODE,i.ITEM_NAME,u.UOM_NAME,i.STATUS\n"
                    + " from item_master i, uom_master u\n"
                    + "where i.ITEM_UOM=u.UOM_ID and i.STATUS!='Inactive'");
            datalist = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
        return datalist;

    }

    //**************  Batch List ******************//
//    public void batchList(HttpServletRequest req, HttpServletResponse res, String itemCode) throws IOException {
//        res.setContentType("text/html;charset=UTF-8");
//        PrintWriter out = res.getWriter();
//        Transaction tx = null;
//        List<Object[]> code = null;
//        Session session = getSessionFactory().openSession();
//        List<Inventorylist> citydata = null;
//        Query query = null;
//        try {
//            tx = session.beginTransaction();
//            query = session.createSQLQuery("select total_stock from inventorylist where item_code='" + itemCode + "' and status!='Inactive'");
//            citydata = query.list();
//            if (citydata.isEmpty() || citydata.contains(null)) {
//                out.append("a");
//            } else {
//                out.append(citydata.toString());
//            }
//            tx.commit();
//        } catch (HibernateException e) {
//            if (tx != null) {
//                tx.rollback();
//            }
//            e.printStackTrace();
//        } finally {
//            session.close();
//        }
//
//    }
    public void batchList(HttpServletRequest req, HttpServletResponse res, String itemCode, String storeLocationName) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        List<Object[]> code = null;
        Session session = getSessionFactory().openSession();
        // SQLQuery query = null;
        Query query = null;
        try {
            tx = session.beginTransaction();
//            query = session.createQuery("select batchNo,expiryDate,stockQty,unitPrice,unit,supplierCode from InventoryList where itemCode='" + itemCode + "' and storeLocationName='" + storeLocationName + "' and stockQty!=0  and status!='Inactive'  ");
            query = session.createSQLQuery("select I.batch_no,I.expiry_date ,I.stock_qty,I.unit_price,I.supplier_code from arete_tms.inventorylist I ,arete_tms.item_store S\n"
                    + "where I.item_code='" + itemCode + "' AND I.item_code=S.item_code and  I.store_location_name='" + storeLocationName + "' AND I.store_location_name=S.store_name and I.stock_qty!=0 \n"
                    + "and I.status!='Inactive' AND S.status!='Inactive'");
            code = query.list();
            for (Object[] getcode : code) {
                //System.out.println("vcbdvbc"+query.list());

                out.println(getcode[0].toString() + "/" + getcode[1].toString() + "/" + getcode[2].toString() + "/" + getcode[3].toString() + "/" + getcode[4].toString() + ",");
            }

            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }

    }

    //************** Save Inventory ******************//
    public void saveinvent(InventoryCount count) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(count);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }

    }

//    /////// Newly added By Lakshmi/////////
//    
//    public void saveStock(StockEntry Entry) {
//        Session session = getSessionFactory().openSession();
//        try {
//            Transaction tx = session.beginTransaction();
//            session.saveOrUpdate(Entry);
//            tx.commit();
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            session.clear();
//            session.close();
//        }
//
//    }
    //************** Save Inventory ******************//
    public void save1(List<InventoryCount> grid) {
        for (Iterator<InventoryCount> iterator = grid.iterator(); iterator.hasNext();) {
            InventoryCount test = (InventoryCount) iterator.next();
            saveinvent(test);
        }
    }

    /////// Newly added By Lakshmi/////////
    //************** Save StockEntry ******************//
//    public void saveStockEntry(List<StockEntry> grid) {
//        for (Iterator<StockEntry> iterator = grid.iterator(); iterator.hasNext();) {
//            StockEntry test = (StockEntry) iterator.next();
//            saveStock(test);
//        }
//    }
    /////// Newly added By Lakshmi/////////
    public void saveInsuranceTaggingDetails(StockEntry stock) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(stock);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }

    }

    public void saveStockEntry(List<StockEntry> grid) {
        for (Iterator<StockEntry> iterator = grid.iterator(); iterator.hasNext();) {
            StockEntry test = (StockEntry) iterator.next();
            saveInsuranceTaggingDetails(test);
        }
    }
    //////////////

    @Override
    public void globalInactive(String instanceVariable, String className) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Class> roleperm(String orgId, String roleName, String submodule, String tab) {
        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from RolePermission where status!='Inactive' and orgId='" + orgId + "' and roleName='" + roleName + "' and submoduleName='" + submodule + "' and tabName='" + tab + "' order by SNO");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    public List<Inventorylist> inventlist5(String itemId, String projectCode) {
        List<Inventorylist> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("select store_location_name,item_code,item_name,stock_qty,unit,batch_no,expiry_date from inventorylist where   stock_qty!=0");

            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    public List<Inventorylist> paginationList(String userId, String orgId, String SNo, String searchData, Integer iDisplayStart, Integer displayLength, String order, String listPage, String recordStatus, String sCol)
            throws HibernateException, SQLException {
        List<Inventorylist> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (listPage.equalsIgnoreCase("inventoryList")) {

                if (sCol == null) {
                    sCol = "lastmodified_date";
                }
                if (sCol.equals("0")) {
                    sCol = "store_location_name";
                }
                if (sCol.equals("1")) {
                    sCol = "item_code";
                }
                if (sCol.equals("2")) {
                    sCol = "item_name";
                }
                if (sCol.equals("3")) {
                    sCol = "stock_qty";
                }
                if (sCol.equals("4")) {
                    sCol = "unit";
                }
                if (sCol.equals("5")) {
                    sCol = "batch_no";
                }
                if (sCol.equals("6")) {
                    sCol = "expiry_date";
                }

                query = session.createSQLQuery("SELECT store_location_name,item_code,item_name,stock_qty,unit,batch_no,expiry_date from arete_tms.inventorylist where stock_qty!=0 and (lower(store_location_name) LIKE lower('%" + searchData + "%')  "
                        + "or lower(item_code) LIKE lower('%" + searchData + "%') or lower(item_name) LIKE lower('%" + searchData + "%') or lower(stock_qty) LIKE lower('%" + searchData + "%')"
                        + "or lower(unit) LIKE lower('%" + searchData + "%')or lower(batch_no) LIKE lower('%" + searchData + "%')"
                        + "or lower(expiry_date) LIKE lower('%" + searchData + "%')) order by " + sCol + "  " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);

            }
            if (listPage.equalsIgnoreCase("StockList")) {

                if (sCol == null) {
                    sCol = "lastmodified_date";
                }
                if (sCol.equals("0")) {
                    sCol = "store_location_name";
                }
                if (sCol.equals("1")) {
                    sCol = "item_code";
                }
                if (sCol.equals("2")) {
                    sCol = "item_name";
                }
                if (sCol.equals("3")) {
                    sCol = "stock_qty";
                }
                if (sCol.equals("4")) {
                    sCol = "unit";
                }
                if (sCol.equals("5")) {
                    sCol = "batch_no";
                }
                if (sCol.equals("6")) {
                    sCol = "expiry_date";
                }

                query = session.createSQLQuery("SELECT store_location_name,item_code,item_name,stock_qty,unit,batch_no,expiry_date from arete_tms.inventorylist where stock_qty!=0 and (lower(store_location_name) LIKE lower('%" + searchData + "%')  "
                        + "or lower(item_code) LIKE lower('%" + searchData + "%') or lower(item_name) LIKE lower('%" + searchData + "%') or lower(stock_qty) LIKE lower('%" + searchData + "%')"
                        + "or lower(unit) LIKE lower('%" + searchData + "%')or lower(batch_no) LIKE lower('%" + searchData + "%')"
                        + "or lower(expiry_date) LIKE lower('%" + searchData + "%'))order by " + sCol + "  " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);

            }
            if (listPage.equalsIgnoreCase("inventoryCountList")) {
                query = session.createSQLQuery("SELECT store_location_name,item_name,batch_no,expiry_date,available_stock,physical_count_qty,physical_count_date,uom,s_no,variance_qty\n"
                        + "from arete_tms.inventory_count where org_id='" + orgId + "' and status!='Inactive' and "
                        + "(lower(store_location_name) LIKE lower('%" + searchData + "%')  "
                        + "or lower(batch_no) LIKE lower('%" + searchData + "%') "
                        + "or lower(item_name) LIKE lower('%" + searchData + "%')"
                        + " or lower(available_stock) LIKE lower('%" + searchData + "%')"
                        + "or lower(physical_count_qty) LIKE lower('%" + searchData + "%') "
                        + "or lower(physical_count_date) LIKE lower('%" + searchData + "%')"
                        + "or lower(variance_qty) LIKE lower('%" + searchData + "%')"
                        + "or lower(uom) LIKE lower('%" + searchData + "%')"
                        + "or lower(expiry_date) LIKE lower('%" + searchData + "%'))order by s_no " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);
            }
            if (listPage.equalsIgnoreCase("storeManagerCountList")) {
                query = session.createSQLQuery("SELECT STORE_LOCATION_NAME,ITEM_NAME,BATCH_NO,EXPIRY_DATE,AVAILABLE_STOCK,PHYSICAL_COUNT_QTY,PHYSICAL_COUNT_DATE,UOM,S_NO,VARIANCE_QTY,INVENTORY_STATUS\n"
                        + "from INVENTORY_COUNT where ORG_ID='" + orgId + "' and status!='Inactive' and INVENTORY_STATUS='Requested' and "
                        + "(lower(STORE_LOCATION_NAME) LIKE lower('%" + searchData + "%')  "
                        + "or lower(BATCH_NO) LIKE lower('%" + searchData + "%') "
                        + "or lower(ITEM_NAME) LIKE lower('%" + searchData + "%')"
                        + " or lower(AVAILABLE_STOCK) LIKE lower('%" + searchData + "%')"
                        + "or lower(PHYSICAL_COUNT_QTY) LIKE lower('%" + searchData + "%') "
                        + "or lower(PHYSICAL_COUNT_DATE) LIKE lower('%" + searchData + "%')"
                        + "or lower(VARIANCE_QTY) LIKE lower('%" + searchData + "%')"
                        + "or lower(UOM) LIKE lower('%" + searchData + "%')"
                        + "or lower(EXPIRY_DATE) LIKE lower('%" + searchData + "%'))order by S_NO " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);
            }
            if (listPage.equalsIgnoreCase("financeManagerCountList")) {
                query = session.createSQLQuery("SELECT STORE_LOCATION_NAME,ITEM_NAME,BATCH_NO,EXPIRY_DATE,AVAILABLE_STOCK,PHYSICAL_COUNT_QTY,PHYSICAL_COUNT_DATE,UOM,S_NO,VARIANCE_QTY,INVENTORY_STATUS\n"
                        + "from INVENTORY_COUNT where ORG_ID='" + orgId + "' and status!='Inactive' and INVENTORY_STATUS='ApprovedByStoreManager' and "
                        + "(lower(STORE_LOCATION_NAME) LIKE lower('%" + searchData + "%')  "
                        + "or lower(BATCH_NO) LIKE lower('%" + searchData + "%') "
                        + "or lower(ITEM_NAME) LIKE lower('%" + searchData + "%')"
                        + " or lower(AVAILABLE_STOCK) LIKE lower('%" + searchData + "%')"
                        + "or lower(PHYSICAL_COUNT_QTY) LIKE lower('%" + searchData + "%') "
                        + "or lower(PHYSICAL_COUNT_DATE) LIKE lower('%" + searchData + "%')"
                        + "or lower(VARIANCE_QTY) LIKE lower('%" + searchData + "%')"
                        + "or lower(UOM) LIKE lower('%" + searchData + "%')"
                        + "or lower(EXPIRY_DATE) LIKE lower('%" + searchData + "%'))order by S_NO " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);
            }
            if (listPage.equalsIgnoreCase("inventoryStockAdjustment")) {

                query = session.createSQLQuery("SELECT STORE_LOCATION_NAME,ITEM_NAME,BATCH_NO,EXPIRY_DATE,AVAILABLE_STOCK,PHYSICAL_COUNT_QTY,PHYSICAL_COUNT_DATE,UOM,S_NO,VARIANCE_QTY,INVENTORY_STATUS\n"
                        + "from INVENTORY_COUNT where ORG_ID='" + orgId + "' and status!='Inactive' and INVENTORY_STATUS='ApprovedByFinanceManager' and "
                        + "(lower(STORE_LOCATION_NAME) LIKE lower('%" + searchData + "%')  "
                        + "or lower(BATCH_NO) LIKE lower('%" + searchData + "%') "
                        + "or lower(ITEM_NAME) LIKE lower('%" + searchData + "%')"
                        + " or lower(AVAILABLE_STOCK) LIKE lower('%" + searchData + "%')"
                        + "or lower(PHYSICAL_COUNT_QTY) LIKE lower('%" + searchData + "%') "
                        + "or lower(PHYSICAL_COUNT_DATE) LIKE lower('%" + searchData + "%')"
                        + "or lower(VARIANCE_QTY) LIKE lower('%" + searchData + "%')"
                        + "or lower(UOM) LIKE lower('%" + searchData + "%')"
                        + "or lower(EXPIRY_DATE) LIKE lower('%" + searchData + "%'))order by S_NO " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);
            }
            if (listPage.equalsIgnoreCase("grnList")) {

                if (sCol == null) {
                    sCol = "s_no";
                }
                if (sCol.equals("0")) {
                    sCol = "s_no";
                }
                if (sCol.equals("1")) {
                    sCol = "good_receipt_date";
                }
                if (sCol.equals("2")) {
                    sCol = "po_no";
                }
                if (sCol.equals("3")) {
                    sCol = "supplier_name";
                }

                query = session.createSQLQuery("SELECT good_receipt_no,good_receipt_date,po_no,project_code,supplier_name,invoice_no,invoice_date,expiry_date,batch_no FROM arete_tms.good_receipt_note \n"
                        + "WHERE s_no in (select min(s_no) \n"
                        + "                        from arete_tms.good_receipt_note\n"
                        + "   WHERE  status!='Inactive'and "
                        + " (lower(good_receipt_no) LIKE lower('%" + searchData + "%')  "
                        + "or lower(good_receipt_date) LIKE lower('%" + searchData + "%') "
                        + "or lower(po_no) LIKE lower('%" + searchData + "%')"
                        + " or lower(supplier_name) LIKE lower('%" + searchData + "%')) GROUP by good_receipt_no)order by " + sCol + "  " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);
            }
            if (listPage.equalsIgnoreCase("receiptsList")) {

                if (sCol == null) {
                    sCol = "lastmodified_date";
                }
                if (sCol.equals("0")) {
                    sCol = "lastmodified_date";
                }
                if (sCol.equals("1")) {
                    sCol = "purchase_order_date";
                }
                if (sCol.equals("2")) {
                    sCol = "supplier_name";
                }
                if (sCol.equals("3")) {
                    sCol = "ship_to_location";
                }
                if (sCol.equals("4")) {
                    sCol = "approval_status";
                }

                query = session.createSQLQuery("select purchase_order_no,purchase_order_date,supplier_name,ship_to_location,approval_status,sno,item_code\n"
                        + "from arete_tms.purchase_order where sno in ( select min(sno) from \n"
                        + "arete_tms.purchase_order where status!='Inactive' and \n"
                        + "record_status='Approved' and approval_status!='Fully Receipt' and approval_status!='Cancelled MR' and \n"
                        + "(lower(purchase_order_no) LIKE lower('%" + searchData + "%')  "
                        + "or lower(purchase_order_date) LIKE lower('%" + searchData + "%') "
                        + "or lower(supplier_name) LIKE lower('%" + searchData + "%')"
                        + " or lower(ship_to_location) LIKE lower('%" + searchData + "%')) group by purchase_order_no)order by " + sCol + "  " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);
            }
            if (listPage.equalsIgnoreCase("mrList")) {

                if (sCol == null) {
                    sCol = "LASTMODIFIED_DATE";
                }
                if (sCol.equals("0")) {
                    sCol = "LASTMODIFIED_DATE";
                }
                if (sCol.equals("1")) {
                    sCol = "RECEIPT_DATE";
                }
                if (sCol.equals("2")) {
                    sCol = "PO_NO";
                }
                if (sCol.equals("3")) {
                    sCol = "RECEIVED_BY";
                }
                if (sCol.equals("4")) {
                    sCol = "SUPPLIER_NAME";
                }
                query = session.createSQLQuery("SELECT receipt_no,receipt_date,po_no,received_by,supplier_name,sno FROM arete_tms.receiving_process \n"
                        + "                        WHERE sno in (select min(sno) \n"
                        + "                                         from arete_tms.receiving_process\n"
                        + "                   WHERE  status!='Inactive'  and record_status='" + recordStatus + "' and  "
                        + "(lower(receipt_no) LIKE lower('%" + searchData + "%')  "
                        + "or lower(receipt_date) LIKE lower('%" + searchData + "%') "
                        + "or lower(po_no) LIKE lower('%" + searchData + "%')"
                        + " or lower(received_by) LIKE lower('%" + searchData + "%') "
                        + "or lower(supplier_name) LIKE lower('%" + searchData + "%')) GROUP by receipt_no)order by " + sCol + "  " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);
            }
            if (listPage.equalsIgnoreCase("inspectList")) {
                if (sCol == null) {
                    sCol = "LASTMODIFIED_DATE";
                }
                if (sCol.equals("0")) {
                    sCol = "LASTMODIFIED_DATE";
                }
                if (sCol.equals("1")) {
                    sCol = "MATERIAL_RECEIPT_DATE";
                }
                if (sCol.equals("2")) {
                    sCol = "PO_NO";
                }
                if (sCol.equals("3")) {
                    sCol = "USER_ID";
                }
                if (sCol.equals("4")) {
                    sCol = "SUPPLIER_NAME";
                }
                query = session.createSQLQuery("SELECT material_receipt_no,material_receipt_date,po_no,user_id,supplier_name,record_status FROM arete_tms.quality_inspection \n"
                        + "                        WHERE sno in (select min(sno) \n"
                        + "                                         from arete_tms.quality_inspection\n"
                        + "                   WHERE  status!='Inactive'  and record_status='Initial' and  "
                        + "(lower(material_receipt_no) LIKE lower('%" + searchData + "%')  "
                        + "or lower(material_receipt_date) LIKE lower('%" + searchData + "%') "
                        + "or lower(po_no) LIKE lower('%" + searchData + "%')"
                        + " or lower(user_id) LIKE lower('%" + searchData + "%') "
                        + "or lower(supplier_name) LIKE lower('%" + searchData + "%')) GROUP by material_receipt_no)order by " + sCol + "  " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);
            }
//            System.out.println("query"+query);
            datalist = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist;
    }

    public BigInteger paginationCount(String userId, String orgId, String SNo, String searchData, String order, String listPage, String recordStatus, String sCol)
            throws HibernateException, SQLException {
        BigInteger datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (listPage.equalsIgnoreCase("inventoryList")) {
                query = session.createSQLQuery("Select count(sno)  from arete_tms.inventorylist where stock_qty!=0 and (lower(store_location_name) LIKE lower('%" + searchData + "%')  "
                        + "or lower(item_code) LIKE lower('%" + searchData + "%') or lower(item_name) LIKE lower('%" + searchData + "%') or lower(stock_qty) LIKE lower('%" + searchData + "%')"
                        + "or lower(unit) LIKE lower('%" + searchData + "%')or lower(batch_no) LIKE lower('%" + searchData + "%')"
                        + "or lower(expiry_date) LIKE lower('%" + searchData + "%')) order by lastmodified_date " + order + "");
            }
            if (listPage.equalsIgnoreCase("StockList")) {
                query = session.createSQLQuery("Select count(sno)  from arete_tms.inventorylist where stock_qty!=0 and (lower(store_location_name) LIKE lower('%" + searchData + "%')  "
                        + "or lower(item_code) LIKE lower('%" + searchData + "%') or lower(item_name) LIKE lower('%" + searchData + "%') or lower(stock_qty) LIKE lower('%" + searchData + "%')"
                        + "or lower(unit) LIKE lower('%" + searchData + "%')or lower(batch_no) LIKE lower('%" + searchData + "%')"
                        + "or lower(expiry_date) LIKE lower('%" + searchData + "%')) order by lastmodified_date " + order + "");
            }
            if (listPage.equalsIgnoreCase("inventoryCountList")) {
                query = session.createSQLQuery("Select count(s_no)\n"
                        + "from arete_tms.inventory_count where org_id='" + orgId + "' and status!='Inactive' and "
                        + "(lower(store_location_name) LIKE lower('%" + searchData + "%')  "
                        + "or lower(batch_no) LIKE lower('%" + searchData + "%') "
                        + "or lower(item_name) LIKE lower('%" + searchData + "%')"
                        + " or lower(available_stock) LIKE lower('%" + searchData + "%')"
                        + "or lower(physical_count_qty) LIKE lower('%" + searchData + "%') "
                        + "or lower(physical_count_date) LIKE lower('%" + searchData + "%')"
                        + "or lower(variance_qty) LIKE lower('%" + searchData + "%')"
                        + "or lower(uom) LIKE lower('%" + searchData + "%')"
                        + "or lower(expiry_date) LIKE lower('%" + searchData + "%'))order by s_no " + order + "");
            }
            if (listPage.equalsIgnoreCase("storeManagerCountList")) {
                query = session.createSQLQuery("SELECT count(S_NO)\n"
                        + "from INVENTORY_COUNT where ORG_ID='" + orgId + "' and status!='Inactive' and INVENTORY_STATUS='Requested' and "
                        + "(lower(STORE_LOCATION_NAME) LIKE lower('%" + searchData + "%')  "
                        + "or lower(BATCH_NO) LIKE lower('%" + searchData + "%') "
                        + "or lower(ITEM_NAME) LIKE lower('%" + searchData + "%')"
                        + " or lower(AVAILABLE_STOCK) LIKE lower('%" + searchData + "%')"
                        + "or lower(PHYSICAL_COUNT_QTY) LIKE lower('%" + searchData + "%') "
                        + "or lower(PHYSICAL_COUNT_DATE) LIKE lower('%" + searchData + "%')"
                        + "or lower(VARIANCE_QTY) LIKE lower('%" + searchData + "%')"
                        + "or lower(UOM) LIKE lower('%" + searchData + "%')"
                        + "or lower(EXPIRY_DATE) LIKE lower('%" + searchData + "%'))order by S_NO " + order + "");
            }
            if (listPage.equalsIgnoreCase("financeManagerCountList")) {
                query = session.createSQLQuery("SELECT count(S_NO)\n"
                        + "from INVENTORY_COUNT where ORG_ID='" + orgId + "' and INVENTORY_STATUS='ApprovedByStoreManager' and status!='Inactive' and "
                        + "(lower(STORE_LOCATION_NAME) LIKE lower('%" + searchData + "%')  "
                        + "or lower(BATCH_NO) LIKE lower('%" + searchData + "%') "
                        + "or lower(ITEM_NAME) LIKE lower('%" + searchData + "%')"
                        + " or lower(AVAILABLE_STOCK) LIKE lower('%" + searchData + "%')"
                        + "or lower(PHYSICAL_COUNT_QTY) LIKE lower('%" + searchData + "%') "
                        + "or lower(PHYSICAL_COUNT_DATE) LIKE lower('%" + searchData + "%')"
                        + "or lower(VARIANCE_QTY) LIKE lower('%" + searchData + "%')"
                        + "or lower(UOM) LIKE lower('%" + searchData + "%')"
                        + "or lower(EXPIRY_DATE) LIKE lower('%" + searchData + "%'))order by S_NO " + order + "");
            }
            if (listPage.equalsIgnoreCase("inventoryStockAdjustment")) {
                query = session.createSQLQuery("SELECT count(S_NO)\n"
                        + "from INVENTORY_COUNT where INVENTORY_STATUS='ApprovedByFinanceManager' and ORG_ID='" + orgId + "' and status!='Inactive' and "
                        + "(lower(STORE_LOCATION_NAME) LIKE lower('%" + searchData + "%')  "
                        + "or lower(BATCH_NO) LIKE lower('%" + searchData + "%') "
                        + "or lower(ITEM_NAME) LIKE lower('%" + searchData + "%')"
                        + " or lower(AVAILABLE_STOCK) LIKE lower('%" + searchData + "%')"
                        + "or lower(PHYSICAL_COUNT_QTY) LIKE lower('%" + searchData + "%') "
                        + "or lower(PHYSICAL_COUNT_DATE) LIKE lower('%" + searchData + "%')"
                        + "or lower(VARIANCE_QTY) LIKE lower('%" + searchData + "%')"
                        + "or lower(UOM) LIKE lower('%" + searchData + "%')"
                        + "or lower(EXPIRY_DATE) LIKE lower('%" + searchData + "%'))order by S_NO " + order + "");
            }
            if (listPage.equalsIgnoreCase("grnList")) {
                query = session.createSQLQuery("SELECT count(good_receipt_no) FROM arete_tms.good_receipt_note \n"
                        + "WHERE s_no in (select min(s_no) \n"
                        + "from arete_tms.good_receipt_note\n"
                        + "   WHERE status!='Inactive' and "
                        + " (lower(good_receipt_no) LIKE lower('%" + searchData + "%')  "
                        + "or lower(good_receipt_date) LIKE lower('%" + searchData + "%') "
                        + "or lower(po_no) LIKE lower('%" + searchData + "%')"
                        + " or lower(supplier_name) LIKE lower('%" + searchData + "%')) GROUP by good_receipt_no)order by lastmodified_date " + order + "");
            }
            if (listPage.equalsIgnoreCase("receiptsList")) {
                query = session.createSQLQuery("select count(purchase_order_no) \n"
                        + "from arete_tms.purchase_order where sno in ( select min(sno) from \n"
                        + "arete_tms.purchase_order where status!='Inactive' and \n"
                        + "record_status='Approved' and approval_status!='Fully Receipt' and approval_status!='Cancelled MR' and \n"
                        + "(lower(purchase_order_no) LIKE lower('%" + searchData + "%')  "
                        + "or lower(purchase_order_date) LIKE lower('%" + searchData + "%') "
                        + "or lower(supplier_name) LIKE lower('%" + searchData + "%')"
                        + " or lower(ship_to_location) LIKE lower('%" + searchData + "%')) group by purchase_order_no)order by lastmodified_date " + order + "");
            }
            if (listPage.equalsIgnoreCase("mrList")) {
                query = session.createSQLQuery("SELECT count(receipt_no) FROM arete_tms.receiving_process \n"
                        + "                        WHERE sno in (select min(sno) \n"
                        + "                                         from arete_tms.receiving_process\n"
                        + "                   WHERE  status!='Inactive' and record_status='" + recordStatus + "' and  "
                        + "(lower(receipt_no) LIKE lower('%" + searchData + "%')  "
                        + "or lower(receipt_date) LIKE lower('%" + searchData + "%') "
                        + "or lower(po_no) LIKE lower('%" + searchData + "%')"
                        + " or lower(received_by) LIKE lower('%" + searchData + "%') "
                        + "or lower(supplier_name) LIKE lower('%" + searchData + "%')) GROUP by receipt_no)order by lastmodified_date " + order + "");
            }
            if (listPage.equalsIgnoreCase("inspectList")) {
                query = session.createSQLQuery("SELECT count(material_receipt_no) FROM arete_tms.quality_inspection \n"
                        + "                        WHERE sno in (select min(sno) \n"
                        + "                                         from arete_tms.quality_inspection\n"
                        + "                   WHERE  status!='Inactive' and record_status='Initial' and  "
                        + "(lower(material_receipt_no) LIKE lower('%" + searchData + "%')  "
                        + "or lower(material_receipt_date) LIKE lower('%" + searchData + "%') "
                        + "or lower(po_no) LIKE lower('%" + searchData + "%')"
                        + " or lower(user_id) LIKE lower('%" + searchData + "%') "
                        + "or lower(supplier_name) LIKE lower('%" + searchData + "%')) GROUP by material_receipt_no)order by lastmodified_date " + order + "");
            }

            datalist = (BigInteger) query.uniqueResult();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist;
    }

    public List<StoreMaster> storeMasterdivisionwise(String division) throws HibernateException {
        List<StoreMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (division == null) {
                query = session.createQuery("from StoreMaster where  status!='Inactive'");
            } else {
                query = session.createQuery("from StoreMaster where division='" + division + "' and status!='Inactive'");
            }
            datalist = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist;
    }

    public List<Inventorylist> reorderpaginationList(String userId, String orgId, String SNo, String searchData, Integer iDisplayStart, Integer displayLength, String order, String listPage, String storeName, String sCol)
            throws HibernateException, SQLException {
        List<Inventorylist> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (listPage.equalsIgnoreCase("saftyList1")) {

                if (sCol == null) {
                    sCol = "lastmodified_date";
                }
                if (sCol.equals("0")) {
                    sCol = "store_location_name";
                }
                if (sCol.equals("1")) {
                    sCol = "item_code";
                }
                if (sCol.equals("2")) {
                    sCol = "item_name";
                }
                if (sCol.equals("3")) {
                    sCol = "safty_stock";
                }

                query = session.createSQLQuery("SELECT A.item_code, SUM(A.stock_qty) as totalstock,A.item_name,M.safty_stock,A.store_location_name,A.item_code as itmcode,A.status \n"
                        + "                                          from arete_tms.inventorylist A ,arete_tms.item_store M where A.item_code= M.item_code GROUP BY A.item_code,M.safty_stock,A.store_location_name,A.item_name,A.status,M.store_name\n"
                        + "                                            having SUM(A.stock_qty)<M.safty_stock\n"
                        + "                                           and A.item_code not in (select r.ITEM_CODE from PURCHASE_REQUEST r where\n"
                        + "                                         r.RECORD_STATUS!='Rejected'and (RECORD_STATUS='Need Review' or\n"
                        + "                                            r.RECORD_STATUS='Store Reviewed' or r.RECORD_STATUS='Reviewed') and r.STATUS!='Inactive') and A.STORE_LOCATION_NAME='" + storeName + "' and M.STORE_NAME='" + storeName + "'\n"
                        + "                                            and \n"
                        + "                                             (lower(M.STORE_NAME) LIKE lower('%" + searchData + "%')or lower(A.ITEM_CODE) LIKE lower('%" + searchData + "%') or lower(A.ITEM_NAME) LIKE lower('%" + searchData + "%')\n"
                        + "                       or lower(M.SAFTY_STOCK) LIKE lower('%" + searchData + "%'))\n"
                        + "                                            \n"
                        + "                                           UNION\n"
                        + "                                            SELECT I.ITEM_CODE, 0 as totalstock,I.ITEM_NAME,T.SAFTY_STOCK,T.STORE_NAME,I.ITEM_CODE as itmcode,I.STATUS\n"
                        + "                                           from ITEM_CREATION I,ITEMS_STORE T where I.ITEM_CODE=T.ITEM_CODE AND I.ITEM_CATEGORY!='Service' and\n"
                        + "                                         I.ITEM_SUB_CATEGORY!='Non-Stockable' and T.SAFTY_STOCK!='0'  and I.ITEM_CODE not in (select r.ITEM_CODE from PURCHASE_REQUEST r\n"
                        + "                                            where\n"
                        + "                                       r.RECORD_STATUS!='Rejected'and (RECORD_STATUS='Need Review' or\n"
                        + "                                      r.RECORD_STATUS='Store Reviewed' or r.RECORD_STATUS='Reviewed') and r.STATUS!='Inactive')\n"
                        + "                                        and I.ITEM_CODE not in (select p.ITEM_CODE from INVENTORY_LIST p) and T.STORE_NAME='" + storeName + "'\n"
                        + "                    and                   \n"
                        + "                   \n"
                        + "                    (lower(T.STORE_NAME) LIKE lower('%" + searchData + "%')or lower(I.ITEM_CODE) LIKE lower('%" + searchData + "%') or lower(I.ITEM_NAME) LIKE lower('%" + searchData + "%')\n"
                        + "                       or lower(T.SAFTY_STOCK) LIKE lower('%" + searchData + "%'))order by " + sCol + "  " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);

            }
            if (listPage.equalsIgnoreCase("saftyList")) {
                if (sCol == null) {
                    sCol = "lastmodified_date";
                }
                if (sCol.equals("0")) {
                    sCol = "store_location_name";
                }
                if (sCol.equals("1")) {
                    sCol = "item_code";
                }
                if (sCol.equals("2")) {
                    sCol = "item_name";
                }
                if (sCol.equals("3")) {
                    sCol = "safty_stock";
                }
                query = session.createSQLQuery("SELECT item_code, SUM(stock_qty) as totalstock,item_name,safty_stock,store_location_name,item_code as itmcode,sno  \n"
                        + "                    from arete_tms.inventorylist where  "
                        + "(lower(store_location_name) LIKE lower('%" + searchData + "%')  "
                        + "or lower(item_code) LIKE lower('%" + searchData + "%') "
                        + "or lower(item_name) LIKE lower('%" + searchData + "%')"
                        + "or lower(safty_stock) LIKE lower('%" + searchData + "%')) GROUP BY item_code,safty_stock,store_location_name,item_name\n"
                        + "                    having SUM(stock_qty)<safty_stock\n"
                        + "                    and item_code not in (select r.item_code from arete_tms.purchase_request r where\n"
                        + "                  r.record_status!='Rejected'and (record_status='Need Review' or \n"
                        + "                    r.record_status='Store Reviewed' or r.record_status='Reviewed') and r.status!='Inactive')\n"
                        + "                    UNION\n"
                        + "                    SELECT I.item_code, 0 as totalstock,I.item_name,T.safty_stock,T.store_name,I.item_code as itmcode,I.sno\n"
                        + "                    from arete_tms.item_creation I,arete_tms.item_store T where I.item_code=T.item_code AND I.item_category!='Service' and \n"
                        + "                    I.item_sub_category!='Non-Stockable' and T.safty_stock!='0'  and I.item_code not in (select r.item_code from arete_tms.purchase_request r\n"
                        + "                    where\n"
                        + "                    r.record_status!='Rejected'and (record_status='Need Review' or \n"
                        + "                    r.record_status='Store Reviewed' or r.record_status='Reviewed') and r.status!='Inactive')\n"
                        + "                    and I.item_code not in (select p.item_code from arete_tms.inventorylist p)order by " + sCol + "  " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);

            }
            datalist = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist;
    }

    public Integer reorderpaginationCount(String userId, String orgId, String SNo, String searchData, String order, String listPage, String storeName, String sCol)
            throws HibernateException, SQLException {
        Integer datalist = null;
        List list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            if (listPage.equalsIgnoreCase("saftyList1")) {
                query = session.createSQLQuery("SELECT A.ITEM_CODE, SUM(A.STOCK_QTY) as totalstock,A.ITEM_NAME,M.SAFTY_STOCK,A.STORE_LOCATION_NAME,A.item_code as itmcode,A.STATUS \n"
                        + "                                          from INVENTORY_LIST A ,ITEMS_STORE M where A.ITEM_CODE= M.ITEM_CODE GROUP BY A.ITEM_CODE,M.SAFTY_STOCK,A.STORE_LOCATION_NAME,A.ITEM_NAME,A.STATUS,M.STORE_NAME\n"
                        + "                                            having SUM(A.STOCK_QTY)<M.SAFTY_STOCK\n"
                        + "                                           and A.ITEM_CODE not in (select r.ITEM_CODE from PURCHASE_REQUEST r where\n"
                        + "                                         r.RECORD_STATUS!='Rejected'and (RECORD_STATUS='Need Review' or\n"
                        + "                                            r.RECORD_STATUS='Store Reviewed' or r.RECORD_STATUS='Reviewed') and r.STATUS!='Inactive') and A.STORE_LOCATION_NAME='" + storeName + "' and M.STORE_NAME='" + storeName + "'\n"
                        + "                                            and \n"
                        + "                                             (lower(M.STORE_NAME) LIKE lower('%" + searchData + "%')or lower(A.ITEM_CODE) LIKE lower('%" + searchData + "%') or lower(A.ITEM_NAME) LIKE lower('%" + searchData + "%')\n"
                        + "                       or lower(M.SAFTY_STOCK) LIKE lower('%" + searchData + "%'))\n"
                        + "                                            \n"
                        + "                                           UNION\n"
                        + "                                            SELECT I.ITEM_CODE, 0 as totalstock,I.ITEM_NAME,T.SAFTY_STOCK,T.STORE_NAME,I.ITEM_CODE as itmcode,I.STATUS\n"
                        + "                                           from ITEM_CREATION I,ITEMS_STORE T where I.ITEM_CODE=T.ITEM_CODE AND I.ITEM_CATEGORY!='Service' and\n"
                        + "                                         I.ITEM_SUB_CATEGORY!='Non-Stockable' and T.SAFTY_STOCK!='0'  and I.ITEM_CODE not in (select r.ITEM_CODE from PURCHASE_REQUEST r\n"
                        + "                                            where\n"
                        + "                                       r.RECORD_STATUS!='Rejected'and (RECORD_STATUS='Need Review' or\n"
                        + "                                      r.RECORD_STATUS='Store Reviewed' or r.RECORD_STATUS='Reviewed') and r.STATUS!='Inactive')\n"
                        + "                                        and I.ITEM_CODE not in (select p.ITEM_CODE from INVENTORY_LIST p) and T.STORE_NAME='" + storeName + "' and (lower(T.STORE_NAME) LIKE lower('%" + searchData + "%')or lower(I.ITEM_CODE) LIKE lower('%" + searchData + "%') or lower(I.ITEM_NAME) LIKE lower('%" + searchData + "%')\n"
                        + "                       or lower(T.SAFTY_STOCK) LIKE lower('%" + searchData + "%'))");

            }
            if (listPage.equalsIgnoreCase("saftyList")) {
                query = session.createSQLQuery("SELECT item_code, SUM(stock_qty) as totalstock,item_name,safty_stock,store_location_name \n"
                        + "                    from arete_tms.inventorylist where  "
                        + "(lower(store_location_name) LIKE lower('%" + searchData + "%')  "
                        + "or lower(item_code) LIKE lower('%" + searchData + "%') "
                        + "or lower(item_name) LIKE lower('%" + searchData + "%')"
                        + "or lower(safty_stock) LIKE lower('%" + searchData + "%')) GROUP BY ITEM_CODE,safty_stock,store_location_name,item_name\n"
                        + "                    having SUM(stock_qty)<safty_stock\n"
                        + "                    and item_code not in (select r.item_code from arete_tms.purchase_request r where\n"
                        + "                  r.record_status!='Rejected'and (record_status='Need Review' or \n"
                        + "                    r.record_status='Store Reviewed' or r.record_status='Reviewed') and r.status!='Inactive')\n"
                        + "                    UNION\n"
                        + "                    SELECT I.item_code, 0 as totalstock,I.item_name,T.safty_stock,T.store_name\n"
                        + "                    from arete_tms.item_creation I,arete_tms.item_store T where I.item_code=T.item_code AND I.item_category!='Service' and \n"
                        + "                    I.item_sub_category!='Non-Stockable' and T.safty_stock!='0'  and I.item_code not in (select r.item_code from arete_tms.purchase_request r \n"
                        + "                    where\n"
                        + "                    r.record_status!='Rejected'and (record_status='Need Review' or \n"
                        + "                    r.record_status='Store Reviewed' or r.record_status='Reviewed') and r.status!='Inactive')\n"
                        + "                    and I.item_code not in (select p.item_code from arete_tms.inventorylist p)");

            }

            list = query.list();
            datalist = Integer.valueOf(list.size());
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist;
    }

    public List<PurchaseOrder> poCount() {
        List<PurchaseOrder> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT COUNT(record_status) FROM arete_tms.purchase_order where record_status='Approved' and approval_status!='Fully Receipt'");
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return inventory;
    }

    public List<ReceivingProcess> mrlist(String recordNo, String orgId, String maxNo, String recordStatus) {
        List<ReceivingProcess> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (recordNo != null) {
                query = session.createQuery("from ReceivingProcess where receiptNo='" + recordNo + "' and status!='Inactive'");
            } else if (maxNo.equals("1")) {
                query = session.createSQLQuery("select max(cast(substring(receipt_no,5,2) as signed)) as max1 from arete_tms.receiving_process");
            } else {
                query = session.createQuery("from ReceivingProcess where orgId='" + orgId + "' and recordStatus='" + recordStatus + "' and status!='Inactive'  ORDER BY lastmodifiedDate DESC");
            }
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return inventory;
    }

    public List<UomMaster> uomList1(String userId, String orgId) {
        List<UomMaster> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from UomMaster where status!='Inactive' ORDER BY UPPER(uomName) asc");

//                System.out.println(query);
            conts = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return conts;
    }

    public List<PurchaseOrder> fetchSupplier()
            throws HibernateException, SQLException {
        List<PurchaseOrder> result = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("select supplier_code, supplier_name, supplier_address, supplier_email from arete_tms.purchase_order WHERE sno in (select min(sno) from arete_tms.purchase_order where record_status='Approved' GROUP by supplier_code)ORDER by sno");

            result = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return result;
    }

    public List<Object[]> fetchPoNo(String supplierCode)
            throws HibernateException, SQLException {
        List<Object[]> result = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("SELECT purchase_order_no, purchase_type, ship_to_location from arete_tms.purchase_order WHERE sno in (select min(sno) from arete_tms.purchase_order where record_status='Approved' and approval_status!='Fully Receipt' AND supplier_code='" + supplierCode + "' GROUP by purchase_order_no)ORDER by sno");

            result = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return result;
    }

    public void fetchPODetails(HttpServletRequest req, HttpServletResponse res, String pono) throws HibernateException, SQLException, IOException {

        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;

        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT item_sub_category, item_code, item_name, qty, unit_price, uom, sno, item_category, description, discount from arete_tms.purchase_order WHERE purchase_order_no='" + pono + "'");

            List<Object[]> cityData = query.list();

            if (!cityData.isEmpty()) {
                for (Object[] st : cityData) {

                    out.append(st[0].toString() + ",," + st[1].toString() + ",," + st[2].toString() + ",," + st[3].toString() + ",," + st[4].toString() + ",," + st[5].toString() + ",," + st[6].toString() + ",," + st[7].toString() + ",," + st[8] + ",," + st[9].toString() + "//");
                }
            } else {

                out.append("No Data");
            }

            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();

        } finally {
            session.close();
        }

    }

    public void cancelrecept(HttpServletRequest req, HttpServletResponse res, String sno) throws HibernateException, SQLException, IOException {

        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();

        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update PurchaseOrder set approvalStatus='Cancelled MR' where SNo='" + sno + "'";
            Query query = session.createQuery(hql);
            int row = query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            throw (new SQLException("New Purchaseorder Delete Exception", e));
        } finally {
            session.close();
        }
    }

    public void uomNew(HttpServletRequest req, HttpServletResponse res, String poNo, String itemCode) throws HibernateException, SQLException, IOException {

        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        List<Object[]> cityData = null;
        List<Object[]> cityData2 = null;

        Session session = getSessionFactory().openSession();

        Query query = null;

        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("SELECT I.item_code, I.base_uom, I.uom1, I.uom2, I.uom3, I.conversion_factor1, I.conversion_factor2, I.conversion_factor3 from arete_tms.item_creation I WHERE I.item_code IN(SELECT R.item_code from arete_tms.purchase_order R WHERE R.purchase_order_no='" + poNo + "' and R.item_code='" + itemCode + "')");

            cityData = query.list();

            for (Object[] o : cityData) {
                out.append(o[0] + ",," + o[1] + ",," + o[2] + ",," + o[3] + ",," + o[4] + ",," + o[5] + ",," + o[6] + ",," + o[7] + ",,");
            }

            tx.commit();

        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }

    }

    public void itmsupplier(HttpServletRequest req, HttpServletResponse res, String itemCode, String suppCode) throws HibernateException, SQLException, IOException {

        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        List<Object[]> cityData = null;
        List<Object[]> cityData2 = null;

        Session session = getSessionFactory().openSession();

        Query query2 = null;
        try {
            tx = session.beginTransaction();

            //query2 = session.createSQLQuery("select ITEM_CODE, SUPPLIER_CODE, PURCHASE_PRICE, UOM1_PRICE, UOM2_PRICE, UOM3_PRICE from ITEM_SUPPLIER where ITEM_CODE ='"+itemCode+"' and SUPPLIER_CODE ='"+suppCode+"' ");
            query2 = session.createSQLQuery("select item_code, supplier_code, unit_price, uom1_price, uom2_price, uom3_price from arete_tms.purchase_order  where item_code ='" + itemCode + "' and supplier_code ='" + suppCode + "'");

            cityData2 = query2.list();

            for (Object[] o : cityData2) {
                out.append(o[0] + ",," + o[1] + ",," + o[2] + ",," + o[3] + ",," + o[4] + ",," + o[5] + ",,");
            }

            tx.commit();

        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }

    }

    public void fetchreceivedQty1(HttpServletRequest req, HttpServletResponse res, String pono, String itemCode, String orgId, String orgCode, String suppCode) throws HibernateException, SQLException, IOException {

        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query1 = null;
        Query query2 = null;
        Query query3 = null;
        Query query4 = null;
        String n = "";

        String stockable = "No";
        String batchitem = "No";
        String mandetory = "Yes";
        String uom = "";
        String suppStatus = "";

        try {
            tx = session.beginTransaction();
            query1 = session.createSQLQuery("SELECT SUM(receiving_qty) FROM arete_tms.receiving_process where po_no='" + pono + "' and item_code='" + itemCode + "'");

            //query2 = session.createSQLQuery("select SPEC_DRAWINGNO, EXPENSE_CODE from ITEM_CREATION where ITEM_CODE='" + itemCode + "'");
            query2 = session.createSQLQuery("select specdrawng_no, batch_item from arete_tms.item_store where item_code='" + itemCode + "'");   // and ORG_ID='"+orgId+"' and DIVISION='"+orgCode+"'

            query3 = session.createSQLQuery("SELECT uom FROM arete_tms.receiving_process where po_no='" + pono + "' and item_code='" + itemCode + "'");

            query4 = session.createSQLQuery("SELECT status from arete_tms.item_supplier where item_code ='" + itemCode + "' and supplier_code ='" + suppCode + "'");

            List<Object[]> cityData2 = query2.list();

            if (!cityData2.isEmpty()) {
                for (Object[] st : cityData2) {
                    if (st[0] == null) {
                        stockable = "Yes";
                    } else {
                        stockable = st[0].toString();
                    }
                    if (st[1] == null) {
                        batchitem = "Yes";
                    } else {
                        batchitem = st[1].toString();
                    }

                }
            }

            if (stockable.equals("No") && batchitem.equals("No")) {
                mandetory = "No";
            }
            if (stockable.equals("Yes") && batchitem.equals("No")) {
                mandetory = "Default";
            }

            List cityData3 = query3.list();
            for (Object m3 : cityData3) {
                uom = m3.toString();
            }

            List cityData4 = query4.list();
            for (Object m4 : cityData4) {
                suppStatus = m4.toString();
            }

            List cityData = query1.list();

            for (Object m : cityData) {
                if (m == null) {
                    out.append("0" + "," + mandetory + "," + uom + "," + suppStatus);
                } else {
                    n = m.toString();
                    out.append(n + "," + mandetory + "," + uom + "," + suppStatus);
                }

            }

            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();

        } finally {
            session.close();
        }

    }

    public void receiptStatus(String recordNo, String itemCode, String recordStatus, Integer SNo) throws HibernateException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update PurchaseOrder set approvalStatus='" + recordStatus + "' where purchaseOrderNo='" + recordNo + "' and itemCode='" + itemCode + "' and SNo='" + SNo + "'";
            Query query = session.createQuery(hql);
            query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

    }

    public void SaveMR(List<ReceivingProcess> grid) throws HibernateException, SQLException {
        for (Iterator<ReceivingProcess> iterator = grid.iterator(); iterator.hasNext();) {
            ReceivingProcess test = (ReceivingProcess) iterator.next();
            save(test);
        }
    }

    public void save(ReceivingProcess transientInstance) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(transientInstance);
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.clear();
            session.close();
        }
    }

    public List<ItemMaster> itemlist1(String userId, String orgId) {
        List<ItemMaster> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (orgId == null) {
                query = session.createQuery("from ItemMaster where status!='Inactive'");
            } else {
                query = session.createQuery("from ItemMaster where status!='Inactive'");
            }
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    public List<ItemCategory> itemSubCategory(String userId, String orgId) {
        List<ItemCategory> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (orgId == null) {
                query = session.createQuery("from ItemCategory where status!='Inactive'");
            } else {
                query = session.createQuery("from ItemCategory where status!='Inactive'");
            }
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    public List<SupplierMaster> supplierDetails(String contRef) {
        List<SupplierMaster> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (contRef != null) {
                query = session.createQuery("from SupplierMaster where supplierCode='" + contRef + "' and status!='Inactive'");
            } else {
                query = session.createQuery("from SupplierMaster where status!='Inactive'");
            }
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return inventory;
    }

    public List<PurchaseOrder> polist(String recordNo, String orgId, String pofor, String appStatus, String recordStatus) {
        List<PurchaseOrder> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (recordNo != null) {
                query = session.createQuery("from PurchaseOrder where purchaseOrderNo='" + recordNo + "' and recordStatus='" + appStatus + "'  and approvalStatus!='" + recordStatus + "' and status!='Inactive'");
            } else if (pofor != null) {
                query = session.createSQLQuery("SELECT purchase_order_no FROM arete_tms.purchase_order where purchase_order_no like '%" + pofor + "%'");
            } else {
                query = session.createQuery("from PurchaseOrder where orgId='" + orgId + "' and recordStatus='" + appStatus + "' and approvalStatus!='" + recordStatus + "' and status!='Inactive'");
            }
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    public List<ReceivingProcess> mrlistApproved(String recordNo, String orgId, String recordStatus, String poNo) {
        List<ReceivingProcess> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (recordNo != null) {
                query = session.createQuery("from ReceivingProcess where receiptNo='" + recordNo + "' and poNo='" + poNo + "'");
            } else {
                query = session.createSQLQuery("SELECT receipt_no,receipt_date,po_no,received_by,supplier_name FROM arete_tms.receiving_process \n"
                        + "                        WHERE sno in (select min(sno) \n"
                        + "                                         from arete_tms.receiving_process\n"
                        + "                   WHERE  status!='Inactive'  and record_status='" + recordStatus + "' GROUP by receipt_no)ORDER by sno");
            }
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return inventory;
    }

    public List<ReceivingProcess> mrlist2(String poNo, String orgId) {
        List<ReceivingProcess> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (poNo != null) {
                query = session.createQuery("from ReceivingProcess where poNo='" + poNo + "' and status!='Inactive'");
            } else {
                query = session.createQuery("from ReceivingProcess where orgId='" + orgId + "' and status!='Inactive' ORDER BY lastmodifiedDate DESC");
            }
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return inventory;
    }

    public List<UomMaster> listUom(String orgId) {
        List<UomMaster> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from UomMaster where orgId='" + orgId + "' and  status!='Inactive'");
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return inventory;
    }

    public List<ItemsStore> itemlist3(String userId, String orgId) {
        List<ItemsStore> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from ItemsStore");
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    public List<ItemSupplier> itemSupplier1() {
        List<ItemSupplier> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM ItemSupplier where  status='Active'");
//            System.out.println("query" +query);
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    public List<ItemSupplier> itemSupplierNew(String recordNo) {
        List<ItemSupplier> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT I.item_code,I.base_uom,I.uom1,I.uom2,I.uom3,I.supplier_code from arete_tms.item_supplier I WHERE I.status='Active' and I.item_code IN(SELECT R.item_code from arete_tms.purchase_order R WHERE R.purchase_order_no='" + recordNo + "')");
//            System.out.println("query" +query);
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    public List<ItemCreation> uomNew(String recordNo) {
        List<ItemCreation> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT I.item_code,I.item_uom from arete_tms.item_master I WHERE I.item_code IN(SELECT R.item_code from arete_tms.purchase_order R WHERE R.purchase_order_no='" + recordNo + "')");
//            System.out.println("query" +query);
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    public List<QualityInspection> inspectList(String inspectionNo, String orgId, String maxNo, String recordStatus) {
        List<QualityInspection> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (inspectionNo != null) {
                query = session.createQuery("from QualityInspection where materialReceiptNo='" + inspectionNo + "' and status!='Inactive'");
            } else if (maxNo.equals("1")) {
                query = session.createSQLQuery("SELECT material_receipt_no FROM arete_tms.quality_inspection ORDER BY sno DESC ");
            } else if (maxNo.equals("5")) {
                query = session.createSQLQuery("SELECT material_receipt_no FROM arete_tms.quality_inspection ORDER BY sno DESC");
            } else {
                query = session.createQuery("from QualityInspection where orgId='" + orgId + "' and recordStatus='" + recordStatus + "' and status!='Inactive'");
            }
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    public List<QualityInspection> inspecttotallist1() {
        List<QualityInspection> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("FROM QualityInspection ");
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    public List<QualityInspection> qty(String userId, String sno) {
        List<QualityInspection> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("select divisionName from QualityInspection");
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    public List<ReceivingProcess> mrlist1(String recordNo, String orgId) {
        List<ReceivingProcess> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (recordNo != null) {
                query = session.createQuery("from ReceivingProcess where receiptNo='" + recordNo + "' and status!='Inactive'");
            } else {
                query = session.createQuery("from ReceivingProcess where status!='Inactive' ORDER BY lastmodifiedDate DESC");
            }
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return inventory;
    }

    public void delete(String materialreceiptNo) {
        String hql = null;

        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = null;
            Query query = null;

            tx = session.beginTransaction();

            hql = "delete from QualityInspection  where materialReceiptNo='" + materialreceiptNo + "'";

            query = session.createQuery(hql);
            int row = query.executeUpdate();

            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void saveInspection(List<QualityInspection> grid) throws HibernateException, SQLException {
        for (Iterator<QualityInspection> iterator = grid.iterator(); iterator.hasNext();) {
            QualityInspection test = (QualityInspection) iterator.next();
            save(test);
        }
    }

    public void save(QualityInspection transientInstance) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(transientInstance);
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.clear();
            session.close();
        }
    }

    public void mrStatus(String materialreceiptNo, String itemCode, String recordStatus) {
        String hql = null;

        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = null;
            Query query = null;

            tx = session.beginTransaction();

            hql = "update ReceivingProcess set recordStatus='" + recordStatus + "' where receiptNo='" + materialreceiptNo + "' and itemCode='" + itemCode + "'";

            query = session.createQuery(hql);
            int row = query.executeUpdate();

            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public List<QualityInspection> inspectlist(String recordNo, String orgId, String maxNo, String recordStatus) {
        List<QualityInspection> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (recordNo != null) {
                query = session.createQuery("from QualityInspection where materialReceiptNo='" + recordNo + "' and recordStatus='" + recordStatus + "' and status!='Inactive'");
            } else if (maxNo.equals("1")) {
                query = session.createQuery("SELECT materialReceiptNo FROM arete_tms.quality_inspection ORDER BY sno DESC LIMIT 1");
            } else if (maxNo.equals("5")) {
                query = session.createQuery("SELECT materialReceiptNo FROM arete_tms.quality_inspection ORDER BY sno DESC LIMIT 1");
            } else {
                query = session.createQuery("from QualityInspection where orgId='" + orgId + "' and recordStatus='" + recordStatus + "' and status!='Inactive'  ORDER BY lastmodifiedDate DESC");
            }
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    public List<QualityInspection> inspectlist1(String recordNo, String orgId, String maxNo, String recordStatus, String storeName) {
        List<QualityInspection> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (recordNo != null) {
                query = session.createQuery("from QualityInspection where materialReceiptNo='" + recordNo + "' and recordStatus='" + recordStatus + "' and status!='Inactive' and deliveryLocation='" + storeName + "'");
            } else if (maxNo.equals("1")) {
                query = session.createQuery("SELECT material_receipt_no FROM arete_tms.quality_inspection ORDER BY sno DESC LIMIT 1");
            } else if (maxNo.equals("5")) {
                query = session.createQuery("SELECT material_receipt_no FROM arete_tms.quality_inspection ORDER BY sno DESC LIMIT 1");
            } else {
                query = session.createSQLQuery("SELECT material_receipt_no,material_receipt_date,po_no,user_id,supplier_name,record_status from arete_tms.quality_inspection \n"
                        + "WHERE sno in (select min(sno) \n"
                        + "                        from arete_tms.quality_inspection\n"
                        + "                        WHERE delivery_location='" + storeName + "' and record_status='" + recordStatus + "' and status!='Inactive' GROUP by material_receipt_no)ORDER by sno");
            }
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    public String rowmrreceiptcountFetch(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        Object s = null;
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("select count(*) from QualityInspection");
            List passdata = query.list();
            Iterator it = passdata.iterator();
            while (it.hasNext()) {
                s = (Object) it.next();
                out.append(s.toString());
            }
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return s.toString();
    }

    public List<StoreMaster> storeMaster(Integer SNo) throws HibernateException {
        List<StoreMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from StoreMaster where  status!='Inactive'");
            } else {
                query = session.createQuery("from StoreMaster where sno='" + SNo + "' and status!='Inactive'");
            }
            datalist = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist;
    }

    public List<ItemsStore> itemlist2(String divisionName, String grnNo) {
        List<ItemsStore> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();

        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT I.safty_stock,I.item_code from arete_tms.item_store I WHERE \n"
                    + "I.status!='Inactive' and division='" + divisionName + "' and I.item_code IN(SELECT R.item_code from arete_tms.quality_inspection R WHERE R.material_receipt_no='" + grnNo + "')");
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    public List<ItemCreation> uomNew3(String recordNo) {
        List<ItemCreation> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT I.item_code,I.base_uom,I.uom1,I.uom2,I.uom3,I.conversion_factor1,I.conversion_factor2,I.conversion_factor3 from arete_tms.item_creation I WHERE I.item_code IN(SELECT R.item_code from arete_tms.quality_inspection R WHERE R.material_receipt_no='" + recordNo + "')");

            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    public List<ItemSupplier> itemSupplier(String suppId) {
        List<ItemSupplier> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM ItemSupplier where supplierCode='" + suppId + "' and status='Active'");
//            System.out.println("query" +query);
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    public void inspectStatus(String inspectionNo, String recordStatus, String remarks, String inspectedBy) {

        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            String hql = "update QualityInspection set recordStatus='" + recordStatus + "',qaRemarks='" + remarks + "',inspectedBy='" + inspectedBy + "' where materialReceiptNo='" + inspectionNo + "'";
            query = session.createQuery(hql);
            query.executeUpdate();

            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public List<Inventorylist> inventlist(String itemId, String projectCode, String batchNo, String expiryDate) {
        List<Inventorylist> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (itemId != null) {
                query = session.createQuery("from Inventorylist where itemCode='" + itemId + "' and storeLocationName='" + projectCode + "' and batchNo='" + batchNo + "' and expiryDate='" + expiryDate + "'");
            } else {
                query = session.createQuery("from Inventorylist");
            }
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    public List<Object[]> itemsStorePrice(String itemCode, String orgId, String storeName) {

        List<Object[]> numb = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (itemCode != null) {
                numb = session.createSQLQuery("select sum(stock_qty*unit_price),sum(stock_qty) from arete_tms.inventorylist where item_code='" + itemCode + "'and org_id='" + orgId + "' and store_location_name='" + storeName + "' group by item_code,org_id,store_location_name").list();

            }
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return numb;
    }

    public void updateWeightedAvgPrice(Double Price, String itemCode, String storeName, String orgId) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update ItemsStore set weightedAvgCost='" + Price + "' where itemCode='" + itemCode + "' and  storeName='" + storeName + "' and orgId='" + orgId + "' and status!='Inactive' ";
            Query query = session.createQuery(hql);
            int row = query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            throw (new SQLException("New Purchaseorder Delete Exception", e));
        }finally {
            session.close();
        }
    }

    public void updateinventory(String itemId, Double qty, Double totalValue, String project, String batchNo, String expiryDate) {

        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            String hql = "update InventoryList set stockQty='" + qty + "',totalValue='" + totalValue + "' where storeLocationName='" + project + "' and itemCode='" + itemId + "' and batchNo='" + batchNo + "' and expiryDate='" + expiryDate + "'";
            query = session.createQuery(hql);
            query.executeUpdate();

            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void saveInventory(List<Inventorylist> grid) throws HibernateException, SQLException {
        for (Iterator<Inventorylist> iterator = grid.iterator(); iterator.hasNext();) {
            Inventorylist test = (Inventorylist) iterator.next();
            saveBI(test);
        }
    }

    public void saveBI(Inventorylist transientInstance) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(transientInstance);
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    public List<StockLedger> fetchStockLedger(String itemId, String storeLocationName) {
        List<StockLedger> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (itemId != null) {
                query = session.createQuery(
                        "  from StockLedger\n"
                        + " where SNo in (select max(SNo) \n"
                        + "                               from StockLedger where  itemCode='" + itemId + "'  and storeName='" + storeLocationName + "')");

            }

            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    public void saveStock(List<StockLedger> grid) throws HibernateException, SQLException {
        for (Iterator<StockLedger> iterator = grid.iterator(); iterator.hasNext();) {
            StockLedger test = (StockLedger) iterator.next();
            saveStockLedger(test);
        }
    }

    public void saveStockLedger(StockLedger transientInstance) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(transientInstance);
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    public void saveGRN(List<GoodsReceiptNote> grid) throws HibernateException, SQLException {
        for (Iterator<GoodsReceiptNote> iterator = grid.iterator(); iterator.hasNext();) {
            GoodsReceiptNote test = (GoodsReceiptNote) iterator.next();
            saveIM(test);
//            String grnNo = test.getGoodReceiptNo();
//            String itemCode = test.getItemCode();
//            try {
//                GRNFinance gRNFinance = new GRNFinance();
//                gRNFinance.callOracleStoredProcINParameter("GRN", grnNo, itemCode);
//            } catch (SQLException e) {
//            }
        }
    }

    public void saveIM(GoodsReceiptNote transientInstance) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        String grnNo = transientInstance.getGoodReceiptNo();
        String itemCode = transientInstance.getItemCode();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(transientInstance);
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    public List<QualityInspection> inspectlist1(String orgId, String recordStatus, String mat) {
        List<QualityInspection> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (mat.equals("Accepted")) {
                query = session.createQuery("from QualityInspection where orgId='" + orgId + "' and recordStatus='" + recordStatus + "' and qaAcceptedQty>0 and status!='Inactive'  ORDER BY lastmodifiedDate DESC");
            } else {
                query = session.createQuery("from QualityInspection where orgId='" + orgId + "' and recordStatus='" + recordStatus + "' and rejectedQty>0 and status!='Inactive'  ORDER BY lastmodifiedDate DESC");
            }
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    //------------------GRN Duplicate----------------------
    public void grnAvail(HttpServletRequest req, HttpServletResponse res, String recordNo, String userId) throws HibernateException, SQLException, IOException {

        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;

        try {
            tx = session.beginTransaction();
            query = session.createQuery("select materialReceiptNo,userId,lastmodifiedDate FROM QualityInspection where materialReceiptNo='" + recordNo + "' and recordStatus='Approved' and status!='Inactive'");
            List<Object[]> cityData = query.list();
            if (cityData.isEmpty()) {
                out.append("Available");

            } else {
                for (Object[] st : cityData) {
                    out.append("Already Exists.Enter another" + "," + st[1] + "," + st[2] + ",");
                }
            }
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("exception");
        } finally {
            session.close();
        }

    }

    public List<QualityInspection> inspectrejectlist(String orgId, String recordStatus, String mat) {
        List<QualityInspection> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (mat.equals("Accepted")) {
                query = session.createQuery("from QualityInspection where orgId='" + orgId + "' and recordStatus='" + recordStatus + "' and qaAcceptedQty>0 and status!='Inactive' ORDER BY lastmodifiedDate DESC");
            } else {
                query = session.createSQLQuery("select project_code,material_receipt_no,material_receipt_date,po_no,inspected_by,supplier_name,inspection_no from arete_tms.quality_inspection\n"
                        + "                          where sno in ( select min(sno) from arete_tms.quality_inspection\n"
                        + "                        where  status!='Inactive' and  return_status='' and rejected_qty>0 and\n"
                        + "                        record_status='" + recordStatus + "'  \n"
                        + "                        group by material_receipt_no)order by  sno");
            }
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    public void recheckMrStatus(String materialreceiptNo, String recordStatus) {
        String hql = null;

        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = null;
            Query query = null;

            tx = session.beginTransaction();

            hql = "update ReceivingProcess set recordStatus='" + recordStatus + "' where receiptNo='" + materialreceiptNo + "'";

            query = session.createQuery(hql);
            int row = query.executeUpdate();

            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

    }

    public void recheckInsStatus(String inspectionNo, String appremarks, String recordStatus) {
        String hql = null;

        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = null;
            Query query = null;

            tx = session.beginTransaction();

            hql = "update QualityInspection set recordStatus='" + recordStatus + "',qaRemarks='" + appremarks + "' where materialReceiptNo='" + inspectionNo + "'";

            query = session.createQuery(hql);
            int row = query.executeUpdate();

            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

    }

    public List<ItemMaster> itemCreaList(String SNo)
            throws HibernateException, SQLException {
        List<ItemMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from ItemMaster where status!='Inactive'");
            } else {
                query = session.createQuery("from ItemMaster where sno='" + SNo + "'");
            }
            datalist = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist;
    }

    public List<ItemsStore> itemStore(String itemCode)
            throws HibernateException, SQLException {
        List<ItemsStore> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (itemCode == null) {
                query = session.createQuery("from ItemsStore where status!='Inactive'");
            } else {
                query = session.createQuery("from ItemsStore where itemCode='" + itemCode + "' and status!='Inactive'");
            }
            datalist = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist;
    }

    public List<ItemCategory> itemcategList(String SNo)
            throws HibernateException, SQLException {
        List<ItemCategory> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from ItemCategory where status!='Inactive' ");
            } else {
                query = session.createQuery("from ItemCategory where sno='" + SNo + "' and status!='Inactive'");
            }
            datalist = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist;
    }

    public List<ItemSubcategory> itemsubcategList(String SNo)
            throws HibernateException, SQLException {
        List<ItemSubcategory> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from ItemSubcategory where status!='Inactive' order by UPPER(itemSubCategory) asc");
            } else {
                query = session.createQuery("from ItemSubcategory where sno='" + SNo + "' and status!='Inactive'");
            }
            datalist = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist;
    }

    public List<ItemMaster> itemCreaListEdit(String itemCode)
            throws HibernateException, SQLException {
        List<ItemMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from ItemMaster where itemCode='" + itemCode + "'");

            datalist = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist;
    }

    public List<ItemCreation> saftyList() {
        List<ItemCreation> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("SELECT item_code, SUM(stock_qty) as totalstock,item_name,safty_stock,store_location_name \n"
                    + "                    from arete_tms.inventorylist GROUP BY item_code,safty_stock,store_location_name,item_name\n"
                    + "                    having SUM(stock_qty)<safty_stock\n"
                    + "                    and item_code not in (select r.item_code from arete_tms.purchase_request r where\n"
                    + "                  r.record_status!='Rejected'and (record_status='Need Review' or \n"
                    + "                    r.record_status='Store Reviewed' or r.record_status='Reviewed') and r.status!='Inactive')\n"
                    + "                    UNION\n"
                    + "                    SELECT I.item_code, 0 as totalstock,I.item_name,T.safty_stock,T.store_name\n"
                    + "                    from arete_tms.item_creation I,arete_tms.item_store T where I.item_code=T.item_code AND I.item_category!='Service' and \n"
                    + "                    I.item_sub_category!='Non-Stockable' and T.safty_stock!='0'  and I.item_code not in (select r.item_code from arete_tms.purchase_request r\n"
                    + "                    where\n"
                    + "                    r.record_status!='Rejected'and (record_status='Need Review' or \n"
                    + "                    r.record_status='Store Reviewed' or r.record_status='Reviewed') and r.status!='Inactive')\n"
                    + "                    and I.item_code not in (select p.item_code from arete_tms.inventorylist p)");

            inventory = query.list();

            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    public List<Inventorylist> batchinventList1(String userId, String orgId, String month) throws HibernateException, SQLException {
        List<Inventorylist> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (month != null && month.equalsIgnoreCase("Expired")) {
                query = session.createQuery("from ExpiryList where  status!='Inactive' and stockQty!=0");
            } else {
                query = session.createQuery("from Inventorylist where  status!='Inactive' and stockQty!=0");
            }

            datalist = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist;
    }

    public List<ItemSupplier> itemlist4(String userId, String orgId) {
        List<ItemSupplier> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from ItemSupplier where orgId='" + orgId + "'");
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    public List<Inventorylist> inventoryList2() {
        List<Inventorylist> usertab = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("Select distinct project_code from arete_tms.inventorylist ");

            usertab = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return usertab;
    }

    public List<Inventorylist> inventoryList1(String orgId) {
        List<Inventorylist> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from Inventorylist where orgId='" + orgId + "' and status!='Inactive'");
            conts = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return conts;
    }

    public List<ItemCreation> item() {
        List<ItemCreation> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from ItemCreation where status!='inactive' ");
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    public List<Inventorylist> inventoryCount(String prcode) {

        Transaction tx = null;
        List<Inventorylist> list = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("from SubAssetDetails ");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;

    }

    public List<Inventorylist> inventryCountPagination(String userId, String orgId, String SNo, String searchData, Integer iDisplayStart, Integer displayLength, String order, String idcheck, String roleName, String sCol, String prcode)
            throws HibernateException, SQLException {
        List<Inventorylist> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                if (sCol == null) {
                    sCol = "lastmodified_date";
                }
                if (sCol.equals("0")) {
                    sCol = "item_code";
                }
                if (sCol.equals("1")) {
                    sCol = "item_name";
                }
                if (sCol.equals("2")) {
                    sCol = "item_desc";
                }
                if (sCol.equals("3")) {
                    sCol = "unit";
                }
                query = session.createSQLQuery("SELECT il.item_code,il.item_name,il.item_desc,il.unit,il.item_sub_category,il.unit_price,im.ITEM_UOM FROM arete_tms.inventorylist il inner join arete_tms.item_master im on im.ITEM_CODE=il.item_code where il.sno in ( select max(sno)   \n"
                        + "from arete_tms.inventorylist where status!='Inactive' and stock_qty!=0 and store_location_name='" + prcode + "' and (lower(item_code) LIKE lower('%" + searchData + "%')  or lower(ITEM_NAME) LIKE lower('%" + searchData + "%') or lower(ITEM_DESC) LIKE lower('%" + searchData + "%') or lower(UNIT) LIKE lower('%" + searchData + "%')) and status!='Inactive' group by ITEM_CODE )order by  il." + sCol + "  " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);
//                System.out.println("qq"+query);
            } else {
                query = session.createQuery("from InventoryList where SNo='" + SNo + "' and status!='Inactive' ");
            }

            datalist = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist;
    }

    public BigInteger inventryCntPaginationCount(String userId, String orgId, String SNo, String searchData, Integer iDisplayStart, Integer displayLength, String order, String idcheck, String roleName, String sCol, String prcode)
            throws HibernateException, SQLException {

        BigInteger datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createSQLQuery("SELECT count(item_code) From arete_tms.inventorylist  where sno in ( select max(sno)  \n"
                        + "from arete_tms.inventorylist where status!='Inactive' and stock_qty!=0 and store_location_name='" + prcode + "' and (lower(item_code) LIKE lower('%" + searchData + "%')  or lower(item_name) LIKE lower('%" + searchData + "%') or lower(item_desc) LIKE lower('%" + searchData + "%') or lower(unit) LIKE lower('%" + searchData + "%')) and status!='Inactive' group by item_code ) order by sno " + order + "");
//                System.out.println("qq"+query);
            } else {
                query = session.createQuery("from Inventorylist where SNo='" + SNo + "' and status!='Inactive' ");
            }

            datalist = (BigInteger) query.uniqueResult();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist;
    }

    public void matdetailDel1(String sNo) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update PurchaseOrder set approvalStatus='Cancelled MR' where SNo='" + sNo + "'";
            Query query = session.createQuery(hql);
            int row = query.executeUpdate();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            throw (new SQLException("New Purchaseorder Delete Exception", e));
        }
        tx.commit();
        session.close();
    }

    public List<PurchaseOrder> polist1(String purchaseOrderNo, String orgId) {
        List<PurchaseOrder> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (purchaseOrderNo == null) {
                query = session.createSQLQuery("select purchase_order_no,purchase_order_date,supplier_name,ship_to_location,approval_status,sno\n"
                        + "from arete_tms.purchase_order where sno in ( select min(sno) from \n"
                        + "arete_tms.purchase_order where  status!='Inactive' and \n"
                        + "record_status='Approved' and approval_status!='Fully Receipt' and approval_status!='Cancelled MR' group by purchase_order_no)order by  sno");
            } else {
                query = session.createQuery("from PurchaseOrder where orgId='" + orgId + "' and purchaseOrderNo='" + purchaseOrderNo + "' and recordStatus='Approved'  and status!='Inactive' and approvalStatus!='Fully Receipt' and approvalStatus!='Cancelled MR'");
            }
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    public List<Inventorylist> inventoryCount1(String storename) {
        Transaction tx = null;
        List<Inventorylist> list = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT il.item_code,il.item_name,il.item_desc,il.unit,il.item_sub_category,il.unit_price,im.ITEM_UOM,il.batch_No FROM arete_tms.inventorylist il inner join arete_tms.item_master im on im.ITEM_CODE=il.item_code ");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;

    }

    ////Newly Added By Lakshmi///////
    public List<StockEntry> StockEntryList() {
        Transaction tx = null;
        List<StockEntry> list = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT il.stock_entry_no,il.item_code,il.item_name,il.unit_price,il.physical_stock_qty,il.uom,il.total_price,il.s_no FROM arete_tms.Stock_Entry il");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;

    }

    ////////////////////////
    @Override
    public List<Class> list(String instanceVariable, String className) {

        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (instanceVariable != "") {
                query = session.createQuery("from " + className + " where status!='Inactive' and sno='" + instanceVariable + "'");
            } else {
                query = session.createQuery("from " + className + " where status!='Inactive'");
            }
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;

    }

    public void updateinventory1(String storeLocation, String itemCode, String batchNo, Double phyQty) {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update Inventorylist set stockQty=' " + phyQty + "' where storeLocationName='" + storeLocation + "'and itemCode='" + itemCode + "'and batchNo='" + batchNo + "'";
            Query query = session.createQuery(hql);
            int row = query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            session.close();
        }

    }

    public void updateItmstore(String itemCode, String storeName, String safetyStock) {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();

        try {
            String hql = "update ItemsStore set saftyStock='" + safetyStock + "' where itemCode='" + itemCode + "'and storeName='" + storeName + "'";
            Query query = session.createQuery(hql);
            int row = query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            session.close();
        }

    }
}
