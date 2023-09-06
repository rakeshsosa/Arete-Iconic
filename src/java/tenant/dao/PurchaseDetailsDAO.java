/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.mail.MessagingException;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import javax.persistence.NamedQueries;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import tenant.classes.ApprovalLevel;
import tenant.classes.AssetAttach;
import tenant.classes.BilltoLocation;
import tenant.classes.BuildingHistoryManagement;
import tenant.classes.ContractCreation;
import tenant.classes.CostCenterMst;
import tenant.classes.CurrencyRate;
import tenant.classes.FinalQuotation;
import tenant.classes.HostEmailConfig;
import tenant.classes.IncomeTracking;
import tenant.classes.IncomeTrackingGrid;
import tenant.classes.Inventorylist;
import tenant.classes.ItemCategory;
import tenant.classes.ItemCreation;
import tenant.classes.ItemMaster;
import tenant.classes.ItemSubcategory;
import tenant.classes.ItemSupplier;
import tenant.classes.MasterTerms;
import tenant.classes.OrgDetails;
import tenant.classes.PurchAttach;
import tenant.classes.PurchRequisition;
import tenant.classes.PurchaseAttachments;
import tenant.classes.PurchaseItemDescription;
import tenant.classes.PurchaseOrder;
import tenant.classes.PurchaseRequest;
import tenant.classes.RequiAttach;
import tenant.classes.StandardInvoice;
import tenant.classes.StoreMaster;
import tenant.classes.SubAssetDetails;
import tenant.classes.SuborgGroup;
import tenant.classes.SupplierEnquiry;
import tenant.classes.SupplierMaster;
import tenant.classes.SupplierQuotation;
import tenant.classes.Uom;
import tenant.classes.UomMaster;
import tenant.classes.VendorDetails;
import tenant.classes.VendorDetailsGrid;
import tenant.controller.Common;
import tenant.other.classes.commonInterface;

/**
 *
 * @author ebs
 */
public class PurchaseDetailsDAO extends HibernateDaoSupport implements commonInterface {

    @Override
    public void globalSave(Object transientInstance) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(transientInstance);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    public void requiattchSave(Object transientInstance) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(transientInstance);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    public void requiattachmentDelete(Integer sno)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
//            if (sno != null) {
            query = session.createQuery("delete from RequiAttach where sno='" + sno + "'");
//            } else {
//                query = session.createQuery("delete from SalesCustomMenuList where bufferOne='" + orderNo + "'");
//            }
            query.executeUpdate();
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

    public List<PurchaseOrder> selectPOPopUp(String accessoryCode)
            throws HibernateException, SQLException {
        List<PurchaseOrder> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
//            if (sno != null) {
            query = session.createQuery("from PurchaseOrder where itemCode='" + accessoryCode + "'");
            query.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
//            } else {
//                query = session.createQuery("delete from SalesCustomMenuList where bufferOne='" + orderNo + "'");
//            }
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

    public List<String> getAccessoriesPrice(String accessoryCode, String poName)
            throws HibernateException, SQLException {
        List<String> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
//            if (sno != null) {
            query = session.createSQLQuery("SELECT cast(unit_price AS char(50)) as unitprice FROM arete_tms.purchase_order where purchase_order_no='" + poName + "' AND item_code='" + accessoryCode + "'");
//            } else {
//                query = session.createQuery("delete from SalesCustomMenuList where bufferOne='" + orderNo + "'");
//            }
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

    public List finalquotelist(String supplierCode) {

        List list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

//                query = session.createSQLQuery("select s.SUPPLIER_CODE,s.SUPPLIER_CONT_NUM,\n"
//                    + "                   s.supplier_name,s.SUPPLIER_ADDRESS,\n"
//                    + "                     s.MAIL_ID,s.ACCOUNT_NUMBER,q.PRIORITY,q.ITEM_CODE,q.QTY,q.PRICE,q.DISCOUNT,q.TOTAL\n"
//                    + "                  from arete_tms.final_quotation q join arete_tms.supplier_master s\n"
//                    + "                    on q.VENDOR_CODE=s.SUPPLIER_CODE\n"
//                       +" where q.VENDOR_CODE ='"+suppcode+"' order by REVERSE(q.PRIORITY))");
//                query = session.createSQLQuery("select s.SUPPLIER_CODE,s.SUPPLIER_CONT_NUM, s.supplier_name,s.SUPPLIER_ADDRESS, s.MAIL_ID, s.ACCOUNT_NUMBER,q.PRIORITY,q.ITEM_CODE,q.QTY,q.PRICE,q.DISCOUNT,q.TOTAL from arete_tms.final_quotation q join arete_tms.supplier_master s on q.VENDOR_CODE=s.SUPPLIER_CODE	where q.VENDOR_CODE='" +suppcode+ "' order by REVERSE(q.PRIORITY)");
            query = session.createSQLQuery("select s.SUPPLIER_CODE,s.SUPPLIER_CONT_NUM, s.supplier_name,s.SUPPLIER_ADDRESS, "
                    + "s.MAIL_ID, s.ACCOUNT_NUMBER,q.PRIORITY,q.ITEM_CODE,q.QTY,q.PRICE,q.DISCOUNT,q.TOTAL from "
                    + "arete_tms.final_quotation q join arete_tms.supplier_master s on q.VENDOR_CODE=s.SUPPLIER_CODE	"
                    + "where s.SUPPLIER_CODE='" + supplierCode + "' order by REVERSE(q.PRIORITY)");

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;

    }

    //to fetch asset Name in poviewform
    public List<ItemCategory> assetCod(String sno, String assetcod)
            throws HibernateException, SQLException {
        List<ItemCategory> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select i1.asset_code,i1.asset_name \n"
                    + "from arete_tms.asset_details i1 , arete_tms.purch_requisition i2 \n"
                    + "where i1.asset_code='" + assetcod + "' limit 1");

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

    //to fetch sub asset Name in poviewform
    public List<ItemCategory> subassetCod(String sno, String subassetcod)
            throws HibernateException, SQLException {
        List<ItemCategory> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select i1.sub_asset_code,i1.sub_asset_name \n"
                    + "from arete_tms.sub_asset_details i1 , arete_tms.purch_requisition i2 \n"
                    + "where i1.sub_asset_code='" + subassetcod + "' limit 1");

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

    //to fetch sub item Name in poviewform
    public List<ItemMaster> itemCod(String sno, String subassetcod)
            throws HibernateException, SQLException {
        List<ItemMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from ItemMaster");

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

    public List<Class> list2(String instanceVariable, String className) {

        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (instanceVariable != "") {
                query = session.createQuery("select ad.assetCode,ad.assetName,sad.SNo,sad.subAssetCode,sad.subAssetName from AssetDetails ad, SubAssetDetails sad, AccessoriesTagging at where ad.assetCode=at.assetCode and sad.subAssetCode=at.subAssetCode group by sad.subAssetCode");
            } else {
                query = session.createQuery("from " + className + " ");
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

    public List<Class> reqlist(String instanceVariable, String className) {

        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from PurchRequisition where status!='Inactive' group by requisitionNo");

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;

    }

    public List<Class> polist(String instanceVariable, String className) {

        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from PurchaseOrder group by purchaseOrderNo");

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;

    }

    public List<Class> list1(String instanceVariable, String className) {

        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (instanceVariable != "") {
                query = session.createQuery("from " + className + " where status!='Inactive' and poNo='" + instanceVariable + "'");
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

    public List<Class> quote(String instanceVariable, String className) {

        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (instanceVariable != "") {
                query = session.createQuery("from " + className + " where status!='Inactive' and quotationNo='" + instanceVariable + "'");
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

    //--------For Dynamic Label and Field Activation ---------//
    //------Function Starts----------------------------------//
    public List<String> purchRequiForm(String link, String tab) {
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

    //Purchase Requisition Autogenerate
    public List<ContractCreation> PurchReqAutoGen(String requisitionNo, String materialCode, String appStatus) {
        List<ContractCreation> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (requisitionNo != null) {
                query = session.createQuery("from PurchRequisition where requisitionNo='" + requisitionNo + "' and approvalStatus='" + appStatus + "' and status!='Inactive'");
            } else if (materialCode != null) {
                query = session.createSQLQuery("SELECT REQUISITION_NO FROM arete_tms.purch_requisition where REQUISITION_NO like '%REQ%' and STATUS!='Inactive'");

            } else {
                query = session.createQuery("from MatIssue where  reviewStatus='" + appStatus + "' and status!='Inactive' ORDER BY lastmodifiedDate DESC");
            }
            //System.out.println(query);
            inventory = query.list();
            //System.out.println(inventory);
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }

        return inventory;
    }

    // view Page
    public List<Class> Viewlist(String instanceVariable, String className) {

        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (instanceVariable != "") {
                query = session.createQuery("from " + className + " where status!='Inactive' and requisitionNo='" + instanceVariable + "'");
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

    // to save requisition Attachment 
    public void requiAttachSave(RequiAttach document) {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();

        session.save(document);
        tx.commit();
        session.close();
    }

    // to save purchase Attachment 
    public void POAttachSave(PurchAttach document) {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();

        session.save(document);
        tx.commit();
        session.close();
    }

    public void RequiattachmentDelete(Integer sno, String orderNo)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("delete from RequiAttach where sno='" + sno + "'");
            } else {
                query = session.createQuery("delete from SalesCustomMenuList where bufferOne='" + orderNo + "'");
            }
            query.executeUpdate();
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

    // Requisition Attach List
    public List<RequiAttach> RequiAttachlist(String requisitionNo) {
        List<RequiAttach> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from RequiAttach where requisitionNo='" + requisitionNo + "'");

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    // Purchase Attach List
    public List<PurchAttach> PurchAttachlist(String poNo) {
        List<PurchAttach> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from PurchAttach where poNo='" + poNo + "'");

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    public RequiAttach getRequiAttach(Integer id) {
        Session session = getSessionFactory().openSession();
        RequiAttach exp = (RequiAttach) session.get(RequiAttach.class, id);
        session.close();
        return exp;
    }

    public List<PurchRequisition> requiList(String userId, String orgId, String SNo, String recordStatus)
            throws HibernateException, SQLException {
        List<PurchRequisition> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from PurchRequisition where status!='Inactive' and recordStatus='Request Generated'");

            } else {
                query = session.createQuery("from PurchRequisition where sno='" + SNo + "' and status!='Inactive'");
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

    //to fetch requi list in Approval form
    public List<PurchRequisition> requiApprovList(String userId, String orgId, String RequiNo)
            throws HibernateException, SQLException {
        List<PurchRequisition> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from PurchRequisition where status!='Inactive' and requisitionNo='" + RequiNo + "'");
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

    public void approvUpdate(String prNo, String reviewerRemarks, String recordStatus)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update PurchRequisition set recordStatus='" + recordStatus + "',approvar1Remark='" + reviewerRemarks + "' where requisitionNo='" + prNo + "'");
            query.executeUpdate();
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

    public List<PurchRequisition> requiList1(String userId, String orgId, String SNo, String recordStatus)
            throws HibernateException, SQLException {
        List<PurchRequisition> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from PurchRequisition where status!='Inactive' and recordStatus='AM APPROVED'");

            } else {
                query = session.createQuery("from PurchRequisition where sno='" + SNo + "' and status!='Inactive'");
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

    public List<PurchRequisition> requiList2(String userId, String orgId, String SNo, String recordStatus)
            throws HibernateException, SQLException {
        List<PurchRequisition> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from PurchRequisition where status!='Inactive' and recordStatus='GFC APPROVED'");

            } else {
                query = session.createQuery("from PurchRequisition where sno='" + SNo + "' and status!='Inactive'");
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

    public List<PurchRequisition> requiList3(String userId, String orgId, String SNo, String recordStatus)
            throws HibernateException, SQLException {
        List<PurchRequisition> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from PurchRequisition where status!='Inactive' and (recordStatus='CFO APPROVED' or recordStatus='PO Created') ");

            } else {
                query = session.createQuery("from PurchRequisition where sno='" + SNo + "' and status!='Inactive'");
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

    public List<PurchRequisition> rejectRequiList1(String userId, String orgId, String SNo, String recordStatus)
            throws HibernateException, SQLException {
        List<PurchRequisition> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from PurchRequisition where status!='Inactive' and recordStatus='REJECTED'");

            } else {
                query = session.createQuery("from PurchRequisition where sno='" + SNo + "' and status!='Inactive'");
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

    public void approv2Update(String prNo, String reviewerRemarks, String recordStatus)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update PurchRequisition set recordStatus='" + recordStatus + "',approvar2Remark='" + reviewerRemarks + "' where requisitionNo='" + prNo + "'");
            query.executeUpdate();
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

    public void approv3Update(String prNo, String reviewerRemarks, String recordStatus)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update PurchRequisition set recordStatus='" + recordStatus + "',approvar3Remark='" + reviewerRemarks + "' where requisitionNo='" + prNo + "'");
            query.executeUpdate();
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

    public void reject1Update(String prNo, String reviewerRemarks, String recordStatus)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update PurchRequisition set recordStatus='" + recordStatus + "',approvar1Remark='" + reviewerRemarks + "' where requisitionNo='" + prNo + "'");
            query.executeUpdate();
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

    public void reject2Update(String prNo, String reviewerRemarks, String recordStatus)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update PurchRequisition set recordStatus='" + recordStatus + "',approvar2Remark='" + reviewerRemarks + "' where requisitionNo='" + prNo + "'");
            query.executeUpdate();
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

    public void reject3Update(String prNo, String reviewerRemarks, String recordStatus)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update PurchRequisition set recordStatus='" + recordStatus + "',approvar3Remark='" + reviewerRemarks + "' where requisitionNo='" + prNo + "'");
            query.executeUpdate();
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

    public void recheck1Update(String prNo, String reviewerRemarks, String recordStatus)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update PurchRequisition set recordStatus='" + recordStatus + "',approvar2Remark='" + reviewerRemarks + "' where requisitionNo='" + prNo + "'");
            query.executeUpdate();
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

    //Purchase Order Autogenerate
    public List<PurchaseOrder> POAutoGen(String requisitionNo, String materialCode, String appStatus) {
        List<PurchaseOrder> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (requisitionNo != null) {
                query = session.createQuery("from PurchaseOrder where requisitionNo='" + requisitionNo + "' and approvalStatus='" + appStatus + "' and status!='Inactive'");
            } else if (materialCode != null) {
                query = session.createSQLQuery("SELECT po_no FROM arete_tms.purchase_order where po_no like '%PO%' and STATUS!='Inactive'");

            } else {
                query = session.createQuery("from MatIssue where  reviewStatus='" + appStatus + "' and status!='Inactive' ORDER BY lastmodifiedDate DESC");
            }
            //System.out.println(query);
            inventory = query.list();
            //System.out.println(inventory);
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }

        return inventory;
    }

    // to save po Attachment 
    public void poAttachSave(PurchAttach document) {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();

        try {
            session.save(document);
            tx.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

    }

    public List<PurchaseOrder> poList(String userId, String orgId, String SNo, String recordStatus)
            throws HibernateException, SQLException {
        List<PurchaseOrder> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from PurchaseOrder where status!='Inactive' and recordStatus='PO Generated'");

            } else {
                query = session.createQuery("from PurchRequisition where sno='" + SNo + "' and status!='Inactive'");
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

    public List<PurchaseOrder> poList4(String userId, String orgId, String SNo, String recordStatus)
            throws HibernateException, SQLException {
        List<PurchaseOrder> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null && recordStatus == null) {
                query = session.createSQLQuery("Select purchase_order_no,lastmodified_date,supplier_name,prepared_by,sno,record_status,po_rev_no,email_status  from arete_tms.purchase_order  where sno in ( select min(sno) keep \n"
                        + "from arete_tms.purchase_order where org_id='" + orgId + "' and user_id='" + userId + "' and status!='Inactive' group by purchase_order_no ) order by sno desc");

            } else if (recordStatus != null) {
                query = session.createSQLQuery("Select purchase_order_no,lastmodified_date,supplier_name,prepared_by,sno,record_status,po_rev_no,email_status  from arete_tms.purchase_order  where sno in ( select min(sno) keep \n"
                        + "from arete_tms.purchase_order where org_id='" + orgId + "' and status!='Inactive' and record_status='" + recordStatus + "' group by purchase_order_no ) order by sno desc");

            } else {
                query = session.createQuery("from PurchaseOrder where SNo='" + SNo + "' and status!='Inactive'");
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

    //Newly added by lakshmi for pending PO List
    public List<PurchaseOrder> pendingPoList(String userId, String orgId, String SNo, String recordStatus)
            throws HibernateException, SQLException {
        List<PurchaseOrder> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null && recordStatus == null) {
                query = session.createSQLQuery("Select purchase_order_no,purchase_order_date,supplier_name,prepared_by,sno,record_status,po_rev_no,email_status  from purchase_order  where sno in ( select min(sno) keep \n"
                        + "from arete_tms.purchase_order where org_id='" + orgId + "' and record_status!='Approved' and record_status!='Rejected' and user_id='" + userId + "' and status!='Inactive' group by purchase_order_no ) order by sno desc");

            } else if (recordStatus != null) {
                query = session.createSQLQuery("Select purchase_order_no,purchase_order_date,supplier_name,prepared_by,sno,record_status,po_rev_no,email_status  from purchase_order  where sno in ( select min(sno) keep \n"
                        + "from arete_tms.purchase_order where org_id='" + orgId + "' and status!='Inactive' and record_status!='Approved' and record_status!='Rejected' group by purchase_order_no ) order by sno desc");

            } else {
                query = session.createQuery("from PurchaseOrder where SNo='" + SNo + "' and status!='Inactive' and record_status!='Approved' and record_status!='Rejected'");
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

    //newly added by lakshmi for dash board based on from and to dates
    public List<PurchaseOrder> poList41(String userId, String orgId, String SNo, String recordStatus, String fromDate, String toDate)
            throws HibernateException, SQLException {
        List<PurchaseOrder> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null && recordStatus == null) {
                query = session.createSQLQuery("Select purchase_order_no,purchase_order_date,supplier_name,prepared_by,sno,record_status,po_rev_no,email_status  from purchase_order  where sno in ( select min(sno) keep \n"
                        + "from arete_tms.purchase_order where org_id='" + orgId + "' and user_id='" + userId + "' and status!='Inactive' group by purchase_order_no )and lastmodified_date >='" + fromDate + "' and lastmodified_date <='" + toDate + "' order by sno desc");

            } else if (recordStatus != null) {
                query = session.createSQLQuery("Select purchase_order_no,purchase_order_date,supplier_name,prepared_by,sno,record_status,po_rev_no,email_status  from purchase_order  where sno in ( select min(sno) keep \n"
                        + "from arete_tms.purchase_order where org_id='" + orgId + "' and status!='Inactive' and record_status !='" + recordStatus + "' and record_status!='Rejected' group by purchase_order_no )and lastmodified_date >='" + fromDate + "' and lastmodified_date <='" + toDate + "' order by sno desc");

            } else {
                query = session.createQuery("from PurchaseOrder where SNo='" + SNo + "' and status!='Inactive'");
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

    //to fetch PO list in Approval form
    public List<PurchaseOrder> POApprovList(String userId, String orgId, String poNo)
            throws HibernateException, SQLException {
        List<PurchaseOrder> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from PurchaseOrder where status!='Inactive' and poNo='" + poNo + "'");
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

    public List<PurchaseOrder> poList1(String userId, String orgId, String SNo, String recordStatus)
            throws HibernateException, SQLException {
        List<PurchaseOrder> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from PurchaseOrder where status!='Inactive' and recordStatus='AM APPROVED'");

            } else {
                query = session.createQuery("from PurchRequisition where sno='" + SNo + "' and status!='Inactive'");
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

    //to fetch po list in Approval form
    public List<PurchaseOrder> poApprovList(String userId, String orgId, String poNo)
            throws HibernateException, SQLException {
        List<PurchaseOrder> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from PurchaseOrder where status!='Inactive' and poNo='" + poNo + "'");
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

    public void poApprov2Update(String poNo, String reviewerRemarks, String recordStatus)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update PurchaseOrder set recordStatus='" + recordStatus + "',approvar2Remark='" + reviewerRemarks + "' where poNo='" + poNo + "'");
            query.executeUpdate();
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

    public void poApprovUpdate(String poNo, String reviewerRemarks, String recordStatus)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update PurchaseOrder set recordStatus='" + recordStatus + "',approvar1Remark='" + reviewerRemarks + "' where poNo='" + poNo + "'");
            query.executeUpdate();
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

    public List<PurchaseOrder> poList2(String userId, String orgId, String SNo, String recordStatus)
            throws HibernateException, SQLException {
        List<PurchaseOrder> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from PurchaseOrder where status!='Inactive' and recordStatus='GFC APPROVED'");

            } else {
                query = session.createQuery("from PurchRequisition where sno='" + SNo + "' and status!='Inactive'");
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

    public List<PurchaseOrder> poList3(String userId, String orgId, String SNo, String recordStatus)
            throws HibernateException, SQLException {
        List<PurchaseOrder> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from PurchaseOrder where status!='Inactive' and recordStatus='CFO APPROVED'");

            } else {
                query = session.createQuery("from PurchRequisition where sno='" + SNo + "' and status!='Inactive'");
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

    public List<PurchaseOrder> rejectPOList1(String userId, String orgId, String SNo, String recordStatus)
            throws HibernateException, SQLException {
        List<PurchaseOrder> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from PurchaseOrder where status!='Inactive' and recordStatus='REJECTED'");

            } else {
                query = session.createQuery("from PurchRequisition where sno='" + SNo + "' and status!='Inactive'");
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

    public void POapprov3Update(String poNo, String reviewerRemarks, String recordStatus)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update PurchaseOrder set recordStatus='" + recordStatus + "',approvar3Remark='" + reviewerRemarks + "' where poNo='" + poNo + "'");
            query.executeUpdate();
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

    public void poReject1Update(String poNo, String reviewerRemarks, String recordStatus)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update PurchaseOrder set recordStatus='" + recordStatus + "',approvar1Remark='" + reviewerRemarks + "' where poNo='" + poNo + "'");
            query.executeUpdate();
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

    public void poReject2Update(String poNo, String reviewerRemarks, String recordStatus)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update PurchaseOrder set recordStatus='" + recordStatus + "',approvar2Remark='" + reviewerRemarks + "' where poNo='" + poNo + "'");
            query.executeUpdate();
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

    public void poReject3Update(String poNo, String reviewerRemarks, String recordStatus)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update PurchaseOrder set recordStatus='" + recordStatus + "',approvar3Remark='" + reviewerRemarks + "' where poNo='" + poNo + "'");
            query.executeUpdate();
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

    public void poRecheck2Update(String poNo, String reviewerRemarks, String recordStatus)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update PurchaseOrder set recordStatus='" + recordStatus + "',approvar2Remark='" + reviewerRemarks + "' where poNo='" + poNo + "'");
            query.executeUpdate();
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
    /// update PR table After PO is created

    public void PRUpdate(String reNo, String recordStatus)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update PurchRequisition set recordStatus='PO Created' where requisitionNo='" + reNo + "'");
            query.executeUpdate();
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

    //PR Attachment update
    public void prAttachRecheckUpdate(String sno, String requiNo)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update RequiAttach set requisitionNo='" + requiNo + "' where sno='" + sno + "'");
            query.executeUpdate();
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

    //PR Attachment update
    public void poAttachRecheckUpdate(String sno, String poNo)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update PurchAttach set poNo='" + poNo + "' where sno='" + sno + "'");
            query.executeUpdate();
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

    //----------------------------Quotation-----------------------------------------//
    //Quotation Autogenerate
    public List<FinalQuotation> QuoteReqAutoGen(String requisitionNo, String materialCode, String appStatus) {
        List<FinalQuotation> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (requisitionNo != null) {
                query = session.createQuery("from PurchRequisition where requisitionNo='" + requisitionNo + "' and approvalStatus='" + appStatus + "' and status!='Inactive'");
            } else if (materialCode != null) {
                query = session.createSQLQuery("SELECT QUOTATION_NO FROM arete_tms.final_quotation where QUOTATION_NO like '%QUOT%' and STATUS!='Inactive'");

            } else {
                query = session.createQuery("from MatIssue where  reviewStatus='" + appStatus + "' and status!='Inactive' ORDER BY lastmodifiedDate DESC");
            }
            //System.out.println(query);
            inventory = query.list();
            //System.out.println(inventory);
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }

        return inventory;
    }

    public List<FinalQuotation> suppQuot() {
        List<FinalQuotation> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("select distinct s.SUPPLIER_CODE,s.SUPPLIER_CONT_NUM,\n"
                    + "                   s.SUPPLIER_NAME,s.SUPPLIER_ADDRESS,\n"
                    + "                     s.MAIL_ID,s.ACCOUNT_NUMBER,q.PRIORITY,q.ITEM_CODE,q.QTY,q.PRICE,q.DISCOUNT,q.TOTAL\n"
                    + "                  from arete_tms.final_quotation q join arete_tms.supplier_master s\n"
                    + "                    on q.VENDOR_CODE=s.SUPPLIER_CODE  group by q.VENDOR_CODE\n"
                    + "                   order by REVERSE(q.PRIORITY)");

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    @Override
    public List<Class> list(Integer instanceVariable, String className) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void globalDelete(Integer instanceVariable) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    //===================Row Delete from Grid LEAD =======================
    public void PRGridDataDelete(Integer sno)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("update PurchRequisition set status='Inactive' where  sno='" + sno + "' ");

            query.executeUpdate();
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

    public void PoGridDataDelete(Integer sno)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("update PurchaseOrder set status='Inactive' where  sno='" + sno + "' ");

            query.executeUpdate();
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

    public void prUpdate(int sno) {
        Session session = getSessionFactory().openSession();
        Transaction tx = null;
        List<PurchRequisition> cList = new ArrayList<PurchRequisition>();
        Query query = null;

        try {

            tx = session.beginTransaction();

            query = session.createQuery("update PurchRequisition set recordStatus='Request Generated' where sno='" + sno + "'");

            int row = query.executeUpdate();

            tx.commit();
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

    }

    //**************Fetch Requisition Details for Email******************//
    public List<PurchRequisition> tdList(String userId, String orgId, String requisitionNo) throws HibernateException, SQLException {
        List<PurchRequisition> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from PurchRequisition where requisitionNo='" + requisitionNo + "' and status!='Inactive'");
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

    public List<PurchaseOrder> getPOList(String poNo) throws HibernateException, SQLException {
        List<PurchaseOrder> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from PurchaseOrder where poNo='" + poNo + "' and status!='Inactive'");
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

    public List<ItemMaster> getAccessoryList() throws HibernateException, SQLException {
        List<ItemMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from ItemMaster");
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

    public List<SubAssetDetails> flatList()
            throws HibernateException, SQLException {
        List<SubAssetDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from SubAssetDetails where status!='Inactive'");

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

    //**************Fetch Purchase Details for Email******************//
    public List<PurchaseOrder> tdList1(String userId, String orgId, String poNo) throws HibernateException, SQLException {
        List<PurchaseOrder> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from PurchaseOrder where poNo='" + poNo + "' and status!='Inactive'");
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

    @Override
    public List<Class> roleperm(String orgId, String roleName, String submoduleName, String tab) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public List<Class> globalApprovalList(String columnvalue, String className, String columnNamne, String submodule, String tabname) throws HibernateException {
        List<Class> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (columnvalue == null) {

                query = session.createQuery("from " + className + " where status!='Inactive' and submodulename='" + submodule + "' and tabname='" + tabname + "'");
            } else {
                query = session.createQuery("from " + className + " where " + columnNamne + "='" + columnvalue + "' and submodulename='" + submodule + "' and tabname='" + tabname + "'");
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

    public List<PurchaseRequest> autoGenNo(String requisitionNo, String max)
            throws HibernateException, SQLException {
        List<PurchaseRequest> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (max.equals("0")) {
                //query = session.createSQLQuery("Select * from purchase_request where pr_no='" + requisitionNo + "' and status!='Inactive' ORDER BY sno");
                query = session.createQuery("select distinct p from arete_tms.PurchaseRequest p where p.prNo='" + requisitionNo + "' ORDER BY p.SNo");
            } else {

                query = session.createSQLQuery("select MAX(cast(SUBSTR(pr_no,INSTR(pr_no,'-')+1,1000) as signed)) from arete_tms.purchase_request;");//select MAX(CAST(SUBSTR(pr_no,INSTR(pr_no,'-')+1,1000) as Int)) from purchase_request");// createSQLQuery

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

    public List<ItemMaster> itemCreaList(String itemSubCat)
            throws HibernateException, SQLException {
        List<ItemMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from ItemMaster where  itemCategory='" + itemSubCat + "' and status!='Inactive'");//ItemCreation//itemSubCategory//ItemMaster//itemCategory
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

    public List<PurchaseRequest> paginationList(String userId, String orgId, String SNo, String searchData, Integer iDisplayStart, Integer displayLength, String order, String listPage, String itemCat)
            throws HibernateException, SQLException {
        List<PurchaseRequest> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (listPage.equalsIgnoreCase("selectItems")) {
                query = session.createSQLQuery("select item_code,item_name,item_desc,item_category,sno"
                        + " from arete_tms.item_master where item_category='" + itemCat + "' and status!='Inactive' and \n"
                        + "(lower(item_code) LIKE lower('%" + searchData + "%')"
                        + " or lower(item_name) LIKE lower('%" + searchData + "%')"
                        + " or lower(item_category) LIKE lower('%" + searchData + "%')"
                        + " or lower(item_desc) LIKE lower('%" + searchData + "%'))"
                        + " order by sno " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);

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

    public BigInteger paginationCount(String userId, String orgId, String SNo, String searchData, String order, String listPage, String itemCat)
            throws HibernateException, SQLException {
        BigInteger datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            if (listPage.equalsIgnoreCase("selectItems")) {
                query = session.createSQLQuery("SELECT COUNT(SNO)"
                        + " from arete_tms.item_master where ITEM_CATEGORY='" + itemCat + "' and STATUS!='Inactive' and \n"
                        + "(lower(ITEM_CODE) LIKE lower('%" + searchData + "%')"
                        + " or lower(ITEM_NAME) LIKE lower('%" + searchData + "%')"
                        + " or lower(ITEM_CATEGORY) LIKE lower('%" + searchData + "%')"
                        + " or lower(ITEM_DESC) LIKE lower('%" + searchData + "%'))"
                        + " order by SNO " + order + "");

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

    public void savedetaillist(List<PurchaseRequest> grid) throws HibernateException, SQLException {

        for (Iterator<PurchaseRequest> iterator = grid.iterator(); iterator.hasNext();) {

            PurchaseRequest test = (PurchaseRequest) iterator.next();
            matDetailSave(test);
        }
    }

    public void matDetailSave(PurchaseRequest data) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(data);

            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void saveAttch(PurchaseAttachments data) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(data);

            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
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

    public List<PurchaseRequest> reqlist(String userId, String orgId, String SNo)
            throws HibernateException, SQLException {
        List<PurchaseRequest> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createSQLQuery("select DISTINCT pr_no,pr_date,project_code,item_code,user_id,file_name,sno,record_status from arete_tms.purchase_request where org_id='" + orgId + "' and record_status!='Approved' and record_status!='Rejected'  and status!='Inactive' order by sno desc").setMaxResults(100);
                // + "from purchase_request where ord_id='" + orgId + "' and status!='Inactive' group by pr_no ) order by s_no desc").setMaxResults(100);//("Select pr_no,pr_date,project_code,item_code,user_id,file_name,s_no,record_status  from purchase_request  where s_no in ( select min(s_no) keep (dense_rank first order by s_no asc) \n"
                //+ "from purchase_request where ord_id='" + orgId + "' and status!='Inactive' group by pr_no ) order by s_no desc").setMaxResults(100);

            } else {
                query = session.createQuery(" select DISTINCT p from PurchaseRequest p where p.SNo='" + SNo + "' and p.status!='Inactive'");
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

    ////newly added
    public List<PurchaseRequest> totreqlist(String userId, String orgId, String SNo)
            throws HibernateException, SQLException {
        List<PurchaseRequest> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createSQLQuery("select DISTINCT pr_no,pr_date,project_code,item_code,user_id,file_name,sno,record_status from arete_tms.purchase_request where org_id='" + orgId + "' and record_status!='PO Created' and status!='Inactive' order by sno desc").setMaxResults(100);
                // + "from purchase_request where ord_id='" + orgId + "' and status!='Inactive' group by pr_no ) order by s_no desc").setMaxResults(100);//("Select pr_no,pr_date,project_code,item_code,user_id,file_name,s_no,record_status  from purchase_request  where s_no in ( select min(s_no) keep (dense_rank first order by s_no asc) \n"
                //+ "from purchase_request where ord_id='" + orgId + "' and status!='Inactive' group by pr_no ) order by s_no desc").setMaxResults(100);

            } else {
                query = session.createQuery(" select DISTINCT p from arete_tms.PurchaseRequest p where p.SNo='" + SNo + "' and p.status!='Inactive'");
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

    public List<PurchaseRequest> totreqlist1(String userId, String orgId, String SNo, String fromDate, String toDate)
            throws HibernateException, SQLException {
        List<PurchaseRequest> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createSQLQuery("select DISTINCT pr_no,pr_date,project_code,item_code,user_id,file_name,sno,record_status from arete_tms.purchase_request where org_id='" + orgId + "' and status!='Inactive' and lastmodified_date >='" + fromDate + "' and lastmodified_date <='" + toDate + "' order by sno desc").setMaxResults(100);
                // + "from purchase_request where ord_id='" + orgId + "' and status!='Inactive' group by pr_no ) order by s_no desc").setMaxResults(100);//("Select pr_no,pr_date,project_code,item_code,user_id,file_name,s_no,record_status  from purchase_request  where s_no in ( select min(s_no) keep (dense_rank first order by s_no asc) \n"
                //+ "from purchase_request where ord_id='" + orgId + "' and status!='Inactive' group by pr_no ) order by s_no desc").setMaxResults(100);

            } else {
                query = session.createQuery(" select DISTINCT p from PurchaseRequest p where p.SNo='" + SNo + "' and p.status!='Inactive'");
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

    //newly added by lakshmi for dashboard based on from and to dates
    public List<PurchaseRequest> reqlist1(String userId, String orgId, String SNo, String fromDate, String toDate)
            throws HibernateException, SQLException {
        List<PurchaseRequest> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createSQLQuery("select DISTINCT pr_no,pr_date,project_code,item_code,user_id,file_name,sno,record_status from arete_tms.purchase_request where org_id='" + orgId + "' and record_status!='Approved' and record_status!='Rejected' and record_status!='PO Created' and status!='Inactive' and lastmodified_date >='" + fromDate + "' and lastmodified_date <='" + toDate + "' order by sno desc");
                // + "from purchase_request where ord_id='" + orgId + "' and status!='Inactive' group by pr_no ) order by s_no desc").setMaxResults(100);//("Select pr_no,pr_date,project_code,item_code,user_id,file_name,s_no,record_status  from purchase_request  where s_no in ( select min(s_no) keep (dense_rank first order by s_no asc) \n"
                //+ "from purchase_request where ord_id='" + orgId + "' and status!='Inactive' group by pr_no ) order by s_no desc").setMaxResults(100);

            } else {
                query = session.createQuery(" select DISTINCT p from PurchaseRequest p where p.SNo='" + SNo + "' and p.status!='Inactive'");
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

    public List<PurchaseAttachments> purchDocList(String refno)
            throws HibernateException, SQLException {
        List<PurchaseAttachments> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from PurchaseAttachments where refNo='" + refno + "' and status!='Inactive'");

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

    public List<PurchaseRequest> purchList(String refno)
            throws HibernateException, SQLException {
        List<PurchaseRequest> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from PurchaseRequest where prNo='" + refno + "' and status!='Inactive'");

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

    public List<Uom> uom() {
        List<Uom> usertab = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            usertab = session.createQuery("select distinct uomCode from Uom where status!='Inactive' ").list();
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
        return usertab;
    }

    public void purchReqDel(String reqNo) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update PurchaseRequest set status='Inactive' where prNo='" + reqNo + "'";
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

    public void purchReqActive(String reqNo) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update PurchaseRequest set status='update0' where prNo='" + reqNo + "'";
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

    public List<PurchaseRequest> reqlist1(String userRole, String userId, String orgId, String SNo, String searchData, Integer iDisplayStart, Integer displayLength, String order, String sCol)
            throws HibernateException, SQLException {
        List<PurchaseRequest> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            if (sCol == null) {
                sCol = "lastmodified_date";
            }
            if (sCol.equals("0")) {
                sCol = "lastmodified_date";
            }
            if (sCol.equals("1")) {
                sCol = "pr_date";
            }
            if (sCol.equals("2")) {
                sCol = "user_id";
            }
            if (sCol.equals("3")) {
                sCol = "record_status";
            }
            if (SNo == null) {
                if (userRole.toLowerCase().contains("admin")) {
                    query = session.createSQLQuery("select pr_no,pr_date,project_code,item_code,user_id,file_name,sno,record_status, status  from purchase_request  where sno in ( select min(sno)  \n"
                            + "from arete_tms.purchase_request where org_id='" + orgId + "' and (lower(pr_no) LIKE lower('%" + searchData + "%')  or lower(pr_date) LIKE lower('%" + searchData + "%') or lower(user_id) LIKE lower('%" + searchData + "%') or lower(record_status) LIKE lower('%" + searchData + "%') "
                            + "or lower(item_name) LIKE lower('%" + searchData + "%')) group by pr_no ) and record_status!='Approved' and record_status!='Rejected'  and status!='Inactive' order by " + sCol + " " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);

                } else {
                    query = session.createSQLQuery("select pr_no,pr_date,project_code,item_code,user_id,file_name,sno,record_status  from purchase_request  where sno in ( select min(sno)  \n"
                            + "from arete_tms.purchase_request where org_id='" + orgId + "' and user_id='" + userId + "' and (lower(pr_no) LIKE lower('%" + searchData + "%')  "
                            + "or lower(pr_date) LIKE lower('%" + searchData + "%') "
                            + "or lower(user_id) LIKE lower('%" + searchData + "%') "
                            + "or lower(record_status) LIKE lower('%" + searchData + "%') or lower(item_name) LIKE lower('%" + searchData + "%')) group by pr_no ) and record_status!='Approved' and record_status!='Rejected' and status!='Inactive' order by " + sCol + " " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);

                }

//                System.out.println("qq"+query);
            } else {
                query = session.createQuery("from PurchaseRequest where SNo='" + SNo + "' and status!='Inactive'");
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

    //newly added by lakshmi for dashboard based on from and to dates for total requisitions
    public List<PurchaseRequest> reqlist121(String userRole, String userId, String orgId, String SNo, String searchData, Integer iDisplayStart, Integer displayLength, String order, String sCol, String fromDate, String toDate)
            throws HibernateException, SQLException {
        List<PurchaseRequest> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            if (sCol == null) {
                sCol = "lastmodified_date";
            }
            if (sCol.equals("0")) {
                sCol = "lastmodified_date";
            }
            if (sCol.equals("1")) {
                sCol = "pr_date";
            }
            if (sCol.equals("2")) {
                sCol = "user_id";
            }
            if (sCol.equals("3")) {
                sCol = "record_status";
            }
            if (SNo == null) {
                if (userRole.toLowerCase().contains("admin")) {
                    query = session.createSQLQuery("select pr_no,pr_date,project_code,item_code,user_id,file_name,sno,record_status, status  from arete_tms.purchase_request  where sno in ( select min(sno)  \n"
                            + "from arete_tms.purchase_request where org_id='" + orgId + "' and (lower(pr_no) LIKE lower('%" + searchData + "%')  or lower(pr_date) LIKE lower('%" + searchData + "%') or lower(user_id) LIKE lower('%" + searchData + "%') or lower(record_status) LIKE lower('%" + searchData + "%') "
                            + "or lower(item_name) LIKE lower('%" + searchData + "%')) group by pr_no ) and status!='Inactive' and lastmodified_date >='" + fromDate + "' and lastmodified_date <='" + toDate + "' order by " + sCol + " " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);

                } else {
                    query = session.createSQLQuery("select pr_no,pr_date,project_code,item_code,user_id,file_name,sno,record_status  from arete_tms.purchase_request  where sno in ( select min(sno)  \n"
                            + "from arete_tms.purchase_request where org_id='" + orgId + "' and user_id='" + userId + "' and (lower(pr_no) LIKE lower('%" + searchData + "%')  "
                            + "or lower(pr_date) LIKE lower('%" + searchData + "%') "
                            + "or lower(user_id) LIKE lower('%" + searchData + "%') "
                            + "or lower(record_status) LIKE lower('%" + searchData + "%') or lower(item_name) LIKE lower('%" + searchData + "%')) group by pr_no ) and status!='Inactive' and lastmodified_date >='" + fromDate + "' and lastmodified_date <='" + toDate + "' order by " + sCol + " " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);

                }

//                System.out.println("qq"+query);
            } else {
                query = session.createQuery("from PurchaseRequest where SNo='" + SNo + "' and status!='Inactive'");
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

    //newly added by lakshmi for dashboard based on from and to dates
    public List<PurchaseRequest> reqlist12(String userRole, String userId, String orgId, String SNo, String searchData, Integer iDisplayStart, Integer displayLength, String order, String sCol, String fromDate, String toDate)
            throws HibernateException, SQLException {
        List<PurchaseRequest> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            if (sCol == null) {
                sCol = "lastmodified_date";
            }
            if (sCol.equals("0")) {
                sCol = "lastmodified_date";
            }
            if (sCol.equals("1")) {
                sCol = "pr_date";
            }
            if (sCol.equals("2")) {
                sCol = "user_id";
            }
            if (sCol.equals("3")) {
                sCol = "record_status";
            }
            if (SNo == null) {
                if (userRole.toLowerCase().contains("admin")) {
                    query = session.createSQLQuery("select pr_no,pr_date,project_code,item_code,user_id,file_name,sno,record_status, status  from purchase_request  where sno in ( select min(sno)  \n"
                            + "from arete_tms.purchase_request where org_id='" + orgId + "' and (lower(pr_no) LIKE lower('%" + searchData + "%')  or lower(pr_date) LIKE lower('%" + searchData + "%') or lower(user_id) LIKE lower('%" + searchData + "%') or lower(record_status) LIKE lower('%" + searchData + "%') "
                            + "or lower(item_name) LIKE lower('%" + searchData + "%')) group by pr_no ) and record_status!='Approved' and record_status!='Rejected' and record_status!='PO Created' and status!='Inactive' and lastmodified_date >='" + fromDate + "' and lastmodified_date <='" + toDate + "' order by " + sCol + " " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);

                } else {
                    query = session.createSQLQuery("select pr_no,pr_date,project_code,item_code,user_id,file_name,sno,record_status  from purchase_request  where sno in ( select min(sno)  \n"
                            + "from arete_tms.purchase_request where org_id='" + orgId + "' and user_id='" + userId + "' and (lower(pr_no) LIKE lower('%" + searchData + "%')  "
                            + "or lower(pr_date) LIKE lower('%" + searchData + "%') "
                            + "or lower(user_id) LIKE lower('%" + searchData + "%') "
                            + "or lower(record_status) LIKE lower('%" + searchData + "%') or lower(item_name) LIKE lower('%" + searchData + "%')) group by pr_no ) and record_status!='Approved' and record_status!='Rejected' and record_status!='PO Created' and status!='Inactive' and lastmodified_date >='" + fromDate + "' and lastmodified_date <='" + toDate + "' order by " + sCol + " " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);

                }

//                System.out.println("qq"+query);
            } else {
                query = session.createQuery("from PurchaseRequest where SNo='" + SNo + "' and status!='Inactive'");
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

    public BigInteger reqlistCount(String userRole, String userId, String orgId, String SNo, String searchData, String order)
            throws HibernateException, SQLException {
        BigInteger datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                if (userRole.toLowerCase().contains("admin")) {
                    query = session.createSQLQuery("Select count(pr_no) from arete_tms.purchase_request  where sno in ( select min(sno)  \n"
                            + "from arete_tms.purchase_request where org_id='" + orgId + "' and (lower(pr_no) LIKE lower('%" + searchData + "%') "
                            + " or lower(pr_date) LIKE lower('%" + searchData + "%') "
                            + "or lower(user_id) LIKE lower('%" + searchData + "%') "
                            + "or lower(record_status) LIKE lower('%" + searchData + "%') or lower(item_name) LIKE lower('%" + searchData + "%')) and status!='Inactive' group by pr_no ) and record_status!='Approved' and record_status!='Rejected'  and status!='Inactive' order by sno " + order + "");
                } else {
                    query = session.createSQLQuery("Select count(pr_no) from arete_tms.purchase_request  where sno in ( select min(sno)  \n"
                            + "from arete_tms.purchase_request where org_id='" + orgId + "' and  user_id='" + userId + "' and (lower(pr_no) LIKE lower('%" + searchData + "%') "
                            + " or lower(pr_date) LIKE lower('%" + searchData + "%') "
                            + "or lower(user_id) LIKE lower('%" + searchData + "%') "
                            + "or lower(record_status) LIKE lower('%" + searchData + "%') or lower(item_name) LIKE lower('%" + searchData + "%')) and status!='Inactive' group by pr_no ) and record_status!='Approved' and record_status!='Rejected'  and status!='Inactive' order by sno " + order + "");
                }

//                System.out.println("qq"+query);
            } else {
                query = session.createQuery("from PurchaseRequest where SNo='" + SNo + "' and status!='Inactive'");
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

    //newly added by lakshmi for dashboard based on from and to dates for total requisitions
    public BigInteger reqlistCount12(String userRole, String userId, String orgId, String SNo, String searchData, String order, String fromDate, String toDate)
            throws HibernateException, SQLException {
        BigInteger datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                if (userRole.toLowerCase().contains("admin")) {
                    query = session.createSQLQuery("Select count(pr_no) from arete_tms.purchase_request  where sno in ( select min(sno)  \n"
                            + "from arete_tms.purchase_request where org_id='" + orgId + "' and (lower(pr_no) LIKE lower('%" + searchData + "%') "
                            + " or lower(pr_date) LIKE lower('%" + searchData + "%') "
                            + "or lower(user_id) LIKE lower('%" + searchData + "%') "
                            + "or lower(record_status) LIKE lower('%" + searchData + "%') or lower(item_name) LIKE lower('%" + searchData + "%')) and status!='Inactive' group by pr_no ) and status!='Inactive' and lastmodified_date >='" + fromDate + "' and lastmodified_date <='" + toDate + "' order by sno " + order + "");
                } else {
                    query = session.createSQLQuery("Select count(pr_no) from arete_tms.purchase_request  where sno in ( select min(sno)  \n"
                            + "from arete_tms.purchase_request where org_id='" + orgId + "' and  user_id='" + userId + "' and (lower(pr_no) LIKE lower('%" + searchData + "%') "
                            + " or lower(pr_date) LIKE lower('%" + searchData + "%') "
                            + "or lower(user_id) LIKE lower('%" + searchData + "%') "
                            + "or lower(record_status) LIKE lower('%" + searchData + "%') or lower(item_name) LIKE lower('%" + searchData + "%')) and status!='Inactive' group by pr_no ) and status!='Inactive' and lastmodified_date >='" + fromDate + "' and lastmodified_date <='" + toDate + "' order by sno " + order + "");
                }

//                System.out.println("qq"+query);
            } else {
                query = session.createQuery("from PurchaseRequest where SNo='" + SNo + "' and status!='Inactive'");
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

    //newly added by lakshmi for dashboard based on from and to dates
    public BigInteger reqlistCount1(String userRole, String userId, String orgId, String SNo, String searchData, String order, String fromDate, String toDate)
            throws HibernateException, SQLException {
        BigInteger datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                if (userRole.toLowerCase().contains("admin")) {
                    query = session.createSQLQuery("Select count(pr_no) from arete_tms.purchase_request  where sno in ( select min(sno)  \n"
                            + "from arete_tms.purchase_request where org_id='" + orgId + "' and (lower(pr_no) LIKE lower('%" + searchData + "%') "
                            + " or lower(pr_date) LIKE lower('%" + searchData + "%') "
                            + "or lower(user_id) LIKE lower('%" + searchData + "%') "
                            + "or lower(record_status) LIKE lower('%" + searchData + "%') or lower(item_name) LIKE lower('%" + searchData + "%')) and status!='Inactive' group by pr_no ) and record_status!='Approved' and record_status!='Rejected' and record_status!='PO Created' and status!='Inactive' and lastmodified_date >='" + fromDate + "' and lastmodified_date <='" + toDate + "' order by sno " + order + "");
                } else {
                    query = session.createSQLQuery("Select count(pr_no) from arete_tms.purchase_request  where sno in ( select min(sno)  \n"
                            + "from arete_tms.purchase_request where org_id='" + orgId + "' and  user_id='" + userId + "' and (lower(pr_no) LIKE lower('%" + searchData + "%') "
                            + " or lower(pr_date) LIKE lower('%" + searchData + "%') "
                            + "or lower(user_id) LIKE lower('%" + searchData + "%') "
                            + "or lower(record_status) LIKE lower('%" + searchData + "%') or lower(item_name) LIKE lower('%" + searchData + "%')) and status!='Inactive' group by pr_no ) and record_status!='Approved' and record_status!='Rejected' and record_status!='PO Created' and status!='Inactive' and lastmodified_date >='" + fromDate + "' and lastmodified_date <='" + toDate + "' order by sno " + order + "");
                }

//                System.out.println("qq"+query);
            } else {
                query = session.createQuery("from PurchaseRequest where SNo='" + SNo + "' and status!='Inactive'");
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

    public List<PurchaseRequest> reviewList(String userId, String orgId, String SNo)
            throws HibernateException, SQLException {
        List<PurchaseRequest> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createSQLQuery("select pr_no,pr_date,project_code,item_code,user_id,file_name,sno,record_status  from arete_tms.purchase_request  where sno in ( select min(sno) \n"
                        + "from arete_tms.purchase_request where org_id='" + orgId + "' and status!='Inactive' and record_Status='Need Review' group by pr_no ) order by sno desc").setMaxResults(500);

            } else {
                query = session.createQuery("from PurchaseRequest where SNo='" + SNo + "' and status!='Inactive'");
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

    public PurchaseAttachments get(Integer id) {
        Session session = getSessionFactory().openSession();
        PurchaseAttachments supp = (PurchaseAttachments) session.get(PurchaseAttachments.class, id);
        session.close();
        return supp;
    }

    public List<PurchaseRequest> reviewPaginationList(String userId, String orgId, String SNo, String searchData, Integer iDisplayStart, Integer displayLength, String order, String sCol)
            throws HibernateException, SQLException {
        List<PurchaseRequest> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            if (sCol == null) {
                sCol = "lastmodified_date";
            }
            if (sCol.equals("0")) {
                sCol = "lastmodified_date";
            }
            if (sCol.equals("1")) {
                sCol = "pr_date";
            }
            if (sCol.equals("2")) {
                sCol = "user_id";
            }
            if (sCol.equals("3")) {
                sCol = "record_status";
            }

            if (SNo == null) {
                query = session.createSQLQuery("Select pr_no,pr_date,project_code,item_code,user_id,file_name,sno,record_status  from arete_tms.purchase_request  where sno in ( select min(sno)\n"
                        + "from arete_tms.purchase_request where org_id='" + orgId + "' and record_Status='Need Review' and status!='Inactive' and "
                        + "(lower(pr_no) LIKE lower('%" + searchData + "%')  "
                        + "or lower(pr_date) LIKE lower('%" + searchData + "%') "
                        + "or lower(user_id) LIKE lower('%" + searchData + "%') "
                        + "or lower(record_status) LIKE lower('%" + searchData + "%') "
                        + "or lower(item_name) LIKE lower('%" + searchData + "%')) group by pr_no ) order by " + sCol + " " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);

            } else {
                query = session.createQuery("from PurchaseRequest where SNo='" + SNo + "' and status!='Inactive'");
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

    public BigInteger reviewPaginationCount(String userId, String orgId, String SNo, String searchData, String order)
            throws HibernateException, SQLException {
        BigInteger datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createSQLQuery("Select count(pr_no)  from arete_tms.purchase_request  where sno in ( select min(sno) \n"
                        + "from arete_tms.purchase_request where org_id='" + orgId + "' and record_Status='Need Review'  and status!='Inactive'  and "
                        + "(lower(pr_no) LIKE lower('%" + searchData + "%')  "
                        + "or lower(pr_date) LIKE lower('%" + searchData + "%') "
                        + "or lower(user_id) LIKE lower('%" + searchData + "%') "
                        + "or lower(record_status) LIKE lower('%" + searchData + "%') "
                        + "or lower(item_name) LIKE lower('%" + searchData + "%')) group by pr_no ) order by sno " + order + "");

            } else {
                query = session.createQuery("from PurchaseRequest where SNo='" + SNo + "' and status!='Inactive'");
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

    public List<PurchaseRequest> storeRevList(String userId, String orgId, String SNo)
            throws HibernateException, SQLException {
        List<PurchaseRequest> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createSQLQuery("select pr_no,pr_date,project_code,item_code,user_id,file_name,sno,record_status  from arete_tms.purchase_request  where sno in ( select min(sno) \n"
                        + "from arete_tms.purchase_request where org_id='" + orgId + "' and status!='Inactive' and record_Status='Reviewed' group by pr_no ) order by sno desc");

            } else {
                query = session.createQuery("from PurchaseRequest where SNo='" + SNo + "' and status!='Inactive'");
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

    public List<PurchaseRequest> reviewInventory(String requisitionNo)
            throws HibernateException, SQLException {
        List<PurchaseRequest> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from PurchaseRequest where prNo='" + requisitionNo + "' and status!='Inactive' and recordStatus='Reviewed' ORDER BY SNo");

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

    public List<PurchaseRequest> storeRevPaginationList(String userId, String orgId, String SNo, String searchData, Integer iDisplayStart, Integer displayLength, String order, String sCol)
            throws HibernateException, SQLException {
        List<PurchaseRequest> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            if (sCol == null) {
                sCol = "lastmodified_date";
            }
            if (sCol.equals("0")) {
                sCol = "lastmodified_date";
            }
            if (sCol.equals("1")) {
                sCol = "pr_date";
            }
            if (sCol.equals("2")) {
                sCol = "user_id";
            }
            if (sCol.equals("3")) {
                sCol = "record_status";
            }
            if (SNo == null) {
                query = session.createSQLQuery("Select pr_no,pr_date,project_code,item_code,user_id,file_name,sno,record_status  from arete_tms.purchase_request  where sno in ( select min(sno)\n"
                        + "from arete_tms.purchase_request where org_id='" + orgId + "' and record_Status='Reviewed' and status!='Inactive' and"
                        + " (lower(pr_no) LIKE lower('%" + searchData + "%')  "
                        + "or lower(pr_date) LIKE lower('%" + searchData + "%') "
                        + "or lower(user_id) LIKE lower('%" + searchData + "%') "
                        + "or lower(record_status) LIKE lower('%" + searchData + "%') "
                        + "or lower(item_name) LIKE lower('%" + searchData + "%'))  group by pr_no ) order by sno " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);

            } else {
                query = session.createQuery("from PurchaseRequest where SNo='" + SNo + "' and status!='Inactive'");
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

    public BigInteger storeRevPaginationCount(String userId, String orgId, String SNo, String searchData, String order)
            throws HibernateException, SQLException {
        BigInteger datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createSQLQuery("Select count(pr_no)  from arete_tms.purchase_request  where sno in ( select min(sno) \n"
                        + "from arete_tms.purchase_request where org_id='" + orgId + "' and record_Status='Reviewed' and status!='Inactive' and (lower(pr_no) LIKE lower('%" + searchData + "%')  "
                        + "or lower(pr_date) LIKE lower('%" + searchData + "%') "
                        + "or lower(user_id) LIKE lower('%" + searchData + "%') "
                        + "or lower(record_status) LIKE lower('%" + searchData + "%') "
                        + "or lower(item_name) LIKE lower('%" + searchData + "%')) group by pr_no ) order by sno " + order + "");

            } else {
                query = session.createQuery("from PurchaseRequest where SNo='" + SNo + "' and status!='Inactive'");
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

    public void updateStoreApprove(Integer pk, String recordStatus, String storeUser, String storeComment, String storeDate, Double quantity, Double issueQty, Double purchQty)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update PurchaseRequest set  recordStatus='" + recordStatus
                    + "', approverName='" + storeUser + "',approverRemarks='" + storeComment
                    + "' ,approverDate='" + storeDate + "',quantity='" + quantity + "',miQty='" + issueQty
                    + "',purchaseQty='" + purchQty + "' where SNo='" + pk + "'");
            query.executeUpdate();
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

    public List<Inventorylist> inventoryList(String itemCode, String orgCode)
            throws HibernateException, SQLException {
        List<Inventorylist> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

//            query = session.createQuery("Select i.itemCode,i.itemName,sum(i.stockQty) from InventoryList i where itemCode='" + itemCode + "' and storeLocationName='" + orgCode + "' and status!='Inactive' group by i.itemCode,i.itemName");
            query = session.createQuery("Select i.itemCode,i.itemName,i.stockQty,i.storeLocationName,i.batchNo,i.expiryDate from Inventorylist i where itemCode='" + itemCode + "' and status!='Inactive'");
//         query = session.createSQLQuery("Select ITEM_CODE,ITEM_NAME,ITEM_DESC,STOCK_QTY from INVENTORY_LIST  where s_no in ( select min(s_no) keep (dense_rank first order by s_no asc) \n"
//                        + "from INVENTORY_LIST where ITEM_CODE='" + itemCode + "' and STORE_LOCATION_NAME='" + orgCode + "' and status!='Inactive' group by ITEM_CODE ) order by s_no desc");

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

    public void chkInvenStock(HttpServletRequest req, HttpServletResponse res, String itemCode, String orgCode, String storeName) throws IOException {

        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null, query1 = null;
        List<Object[]> details = null;
        List<UomMaster> prlist = null;
        Map<String, Double> itm = new HashMap();
        String issueUom = "";
        Double stock = 0.0;
        try {
            tx = session.beginTransaction();
//            query = session.createQuery("SELECT SUM(i.stockQty)\n"
//                    + "FROM InventoryList i where itemCode='" + itemCode + "'and storeLocationName='" + storeName + "'\n"
//                    + "GROUP BY i.itemCode");
            query = session.createQuery("SELECT unit,stockQty\n"
                    + "FROM Inventorylist  where itemCode='" + itemCode + "'and storeLocationName='" + storeName + "' and status!='Inactive'");
            details = query.list();

            //query1 = session.createQuery("FROM ItemCreation  where itemCode='" + itemCode + "' and status!='Inactive'");
            query1 = session.createQuery("FROM UomMaster  where status!='Inactive'");
            prlist = query1.list();

            for (UomMaster prlist1 : prlist) {
                if (prlist1.getUomName() != null) {
                    itm.put(prlist1.getUomName(), 1.0);
                    issueUom = prlist1.getUomName();
                }

                /*if (prlist1.getUomDesc() != null) {
                 itm.put(prlist1.getUomDesc(), prlist1.getConversionFactor2());
                 }
                 if (prlist1.getUom3() != null) {
                 itm.put(prlist1.getUom3(), prlist1.getConversionFactor3());
                 }*/
            }
//            for (Map.Entry<String, Double> entry : itm.entrySet()) {
//                System.out.println(entry.getKey() + " : " + entry.getValue());
//            }

            if (details.isEmpty()) {
                out.append("0");

            } else {
                for (Object[] detail : details) {

                    if (itm.get(detail[0].toString()) != null) {
                        stock = stock + (Double.parseDouble(detail[1].toString()) / itm.get(detail[0].toString()));
//                        System.out.println("ss" + itm.get(detail[0].toString()));
                    }
                }
                if (stock != 0) {
                    out.append(new DecimalFormat("0.000").format(stock) + " [" + issueUom + "]");
                } else {
                    out.append("0");
                }

            }
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

    }

    public List<PurchaseRequest> appreovedReqList(String userId, String orgId, String reqNo)
            throws HibernateException, SQLException {
        List<PurchaseRequest> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (reqNo == null) {
                query = session.createSQLQuery("select pr_no,pr_date,project_code,item_code,user_id,file_name,sno,record_status,delivery_location  from arete_tms.purchase_request  where sno in ( select min(sno) \n"
                        + "from arete_tms.purchase_request where org_id='" + orgId + "' and status!='Inactive' and (record_Status='Store Reviewed' OR record_Status='MI Requested') and purchase_qty!='0' group by pr_no ) order by sno desc");

            } else {
                query = session.createQuery("from PurchaseRequest where prNo='" + reqNo + "' and status!='Inactive' and purchaseQty!='0' and (record_Status='Store Reviewed' OR record_Status='MI Requested') ORDER BY SNo");
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

    public List<PurchaseRequest> appreovedReqPaginationList(String userId, String orgId, String SNo, String searchData, Integer iDisplayStart, Integer displayLength, String order, String sCol)
            throws HibernateException, SQLException {
        List<PurchaseRequest> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sCol == null) {
                sCol = "lastmodified_date";
            }
            if (sCol.equals("0")) {
                sCol = "lastmodified_date";
            }
            if (sCol.equals("1")) {
                sCol = "delivery_location";
            }
            if (sCol.equals("2")) {
                sCol = "pr_no";
            }
            if (sCol.equals("3")) {
                sCol = "pr_date";
            }
            if (sCol.equals("4")) {
                sCol = "user_id";
            }
            if (sCol.equals("5")) {
                sCol = "record_status";
            }

            if (SNo == null) {
                query = session.createSQLQuery("Select pr_no,pr_date,project_code,item_code,user_id,file_name,sno,record_status,delivery_location  from arete_tms.purchase_request  where sno in ( select min(sno)\n"
                        + "from arete_tms.purchase_request where org_id='" + orgId + "' and status!='Inactive' and (record_Status='Store Reviewed' OR record_Status='MI Requested') and purchase_qty!='0' and "
                        + "(lower(pr_no) LIKE lower('%" + searchData + "%')  or "
                        + "lower(pr_date) LIKE lower('%" + searchData + "%') or "
                        + "lower(user_id) LIKE lower('%" + searchData + "%') or "
                        + "lower(record_status) LIKE lower('%" + searchData + "%') or "
                        + "lower(delivery_location) LIKE lower('%" + searchData + "%') "
                        + "or lower(item_name) LIKE lower('%" + searchData + "%'))  group by pr_no ) order by " + sCol + " " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);

            } else {
                query = session.createQuery("from PurchaseRequest where SNo='" + SNo + "' and status!='Inactive'");
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

    public BigInteger appreovedReqPaginationCount(String userId, String orgId, String SNo, String searchData, String order)
            throws HibernateException, SQLException {
        BigInteger datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createSQLQuery("Select count(pr_no)  from arete_tms.purchase_request  where sno in ( select min(sno) \n"
                        + "from arete_tms.purchase_request where org_id='" + orgId + "' and status!='Inactive' and (record_Status='Store Reviewed' OR record_Status='MI Requested') and purchase_qty!='0' "
                        + " and (lower(pr_no) LIKE lower('%" + searchData + "%')  or "
                        + " lower(pr_date) LIKE lower('%" + searchData + "%') or "
                        + "lower(user_id) LIKE lower('%" + searchData + "%') or "
                        + "lower(record_status) LIKE lower('%" + searchData + "%') or "
                        + "lower(delivery_location) LIKE lower('%" + searchData + "%') "
                        + "or lower(item_name) LIKE lower('%" + searchData + "%')) group by pr_no ) order by sno " + order + "");

            } else {
                query = session.createQuery("from PurchaseRequest where SNo='" + SNo + "' and status!='Inactive'");
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

    public List<PurchaseRequest> enquiryForm(String requisitionNo)
            throws HibernateException, SQLException {
        List<PurchaseRequest> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from PurchaseRequest where prNo='" + requisitionNo + "' and status!='Inactive' and purchaseQty!='0' and (record_Status='Store Reviewed' OR record_Status='MI Requested') ORDER BY SNo");

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

    public List<SupplierMaster> supplierReqList(String SNo, String recordStatus)
            throws HibernateException, SQLException {
        List<SupplierMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {

                query = session.createQuery("from SupplierMaster where status!='Inactive' ORDER BY sno DESC");
            } else {
                query = session.createQuery("from SupplierMaster where sno='" + SNo + "' and status!='Inactive'");
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

    //newly added by lakshmi for dashboard based on from and to dates
    public List<SupplierMaster> supplierReqList1(String SNo, String recordStatus, String fromDate, String toDate)
            throws HibernateException, SQLException {
        List<SupplierMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {

                query = session.createQuery("from SupplierMaster where status!='Inactive' and lastmodifiedDate >='" + fromDate + "' and lastmodifiedDate <='" + toDate + "' ORDER BY sno DESC");
            } else {
                query = session.createQuery("from SupplierMaster where sno='" + SNo + "' and status!='Inactive' and lastmodifiedDate >='" + fromDate + "' and lastmodifiedDate <='" + toDate + "'");
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

    public void reqQuotApp(Integer pk, String recordStatus)
            throws HibernateException, SQLException {

        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update PurchaseRequest set recordStatus='" + recordStatus + "' where SNo='" + pk + "'");
            query.executeUpdate();
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

    public List<PurchaseRequest> reqQuotation(String requisitionNo)
            throws HibernateException, SQLException {
        List<PurchaseRequest> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from PurchaseRequest where prNo='" + requisitionNo + "' and status!='Inactive' and recordStatus='Store Reviewed'");

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

    public List<PurchaseRequest> createEnquiryList(String userId, String orgId, String SNo)
            throws HibernateException, SQLException {
        List<PurchaseRequest> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createSQLQuery("Select p.pr_no,p.pr_date,p.project_code,p.item_code,p.user_id,p.file_name,p.sno,p.reviewer_name,p.approver_name from arete_tms.purchase_request p where p.org_id='" + orgId + "'and p.status!='Inactive' and p.record_Status='Enquiry Required'");

            } else {
                query = session.createQuery("from PurchaseRequest where SNo='" + SNo + "' and status!='Inactive'");
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

    public List<OrgDetails> orgCode(String orgCode) {
        List<OrgDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (orgCode != null) {
                query = session.createQuery("from OrgDetails where status!='Inactive' and orgCode='" + orgCode + "'");
            } else {
                query = session.createQuery("from OrgDetails where status!='Inactive'");
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

    public void SaveEnqQuotation(List<SupplierEnquiry> grid) throws HibernateException, SQLException {
        for (Iterator<SupplierEnquiry> iterator = grid.iterator(); iterator.hasNext();) {
            SupplierEnquiry test = (SupplierEnquiry) iterator.next();
            save(test, test.getPrSno());
        }
    }

    public void save(SupplierEnquiry transientInstance, Integer pk) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = null;
        try {
            Query query = null;
            tx = session.beginTransaction();
            session.saveOrUpdate(transientInstance);
//            query = session.createQuery("update PurchaseRequest set recordStatus='Enquiry Created' where SNo='" + pk + "'");
//            query.executeUpdate();
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
    }

    public List<HostEmailConfig> hostEmailCofig(String userId, String orgId, String moduleName) {
        List<HostEmailConfig> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from HostEmailConfig where moduleName='" + moduleName + "' and status!='Inactive'");

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

    public List<SupplierEnquiry> enquiryAutoGenNo(String enquiriesNo, String max)
            throws HibernateException, SQLException {
        List<SupplierEnquiry> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (max.equals("0")) {
                query = session.createQuery("from SupplierEnquiry where enquiriesNo='" + enquiriesNo + "' ");
            } else {

                query = session.createSQLQuery("select MAX(SUBSTR(enquiries_no,INSTR(enquiries_no,'-')+1,1000)) from arete_tms.supplier_enquiry");
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

    public List<PurchaseRequest> groupReqList(String userId, String orgId, String reqNo)
            throws HibernateException, SQLException {
        List<PurchaseRequest> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("select prNo,prDate from PurchaseRequest where prNo='" + reqNo + "' and status!='Inactive' group by prNo,prDate");

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

    public List<BilltoLocation> billlocList(Integer SNo) throws HibernateException, SQLException {
        List<BilltoLocation> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from BilltoLocation where status!='Inactive'  order by sno");
            } else {
                query = session.createQuery("from BilltoLocation where sno='" + SNo + "' and status!='Inactive'");
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

    public List<ItemSupplier> ItemWiseSupplier(String orgId, String status, String itemCode)
            throws HibernateException, SQLException {
        List<ItemSupplier> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (status.equalsIgnoreCase("Active")) {
                query = session.createQuery("from ItemSupplier where orgId='" + orgId + "' and status='Active'");
            }
            if (status.equalsIgnoreCase("All")) {
                query = session.createQuery("from ItemSupplier where orgId='" + orgId + "' and itemCode='" + itemCode + "'");
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

    public List<CurrencyRate> currencyList(Integer SNo) throws HibernateException, SQLException {
        List<CurrencyRate> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from CurrencyRate where status!='Inactive' order by sno");
            } else {
                query = session.createQuery("from CurrencyRate where sno='" + SNo + "' and status!='Inactive'");
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

    public List<CostCenterMst> costCenterList(Integer SNo) throws HibernateException, SQLException {
        List<CostCenterMst> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from CostCenterMst where status!='N'  order by SNo");
            } else {
                query = session.createQuery("from CostCenterMst where sno='" + SNo + "' and status!='N'");
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

    public List<PurchaseOrder> purchOrderAutoGenNo(String poNo, String max)
            throws HibernateException, SQLException {
        List<PurchaseOrder> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (max.equals("0")) {
                query = session.createQuery("from PurchaseOrder where purchaseOrderNo='" + poNo + "' and status!='Inactive'");
            }
            if (max.equals("2")) {
                query = session.createQuery("select poRevNo from PurchaseOrder where purchaseOrderNo='" + poNo + "' and status!='Inactive'");
            } else {

                //query = session.createSQLQuery("select MAX(SUBSTR(purchase_order_no,INSTR(purchase_order_no,'-')+1,1000) ) from purchase_order");
                //query = session.createSQLQuery("select MAX(SUBSTR(purchase_order_no,INSTR(purchase_order_no,'-')+1,1000) ) from purchase_order where record_status='PO Created'");
  //              query = session.createSQLQuery("SELECT MAX(CONVERT((SUBSTRING_INDEX(purchase_order_no,'-', -1*(CHAR_LENGTH(purchase_order_no)-CHAR_LENGTH(REPLACE(purchase_order_no,'-',''))))),UNSIGNED  INTEGER))FROM arete_tms.purchase_order");

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
    
    public List<PurchaseOrder> poCodeinc(String userId, String orgId, String orderNo, String orderStatus, String limit) {
        List<PurchaseOrder> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (limit.equals("1")) {
  
                query = session.createQuery("from PurchaseOrder ORDER BY SNo");
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

    public List<SupplierMaster> supplierCodeWiseList(String orgId, String supCode)
            throws HibernateException, SQLException {
        List<SupplierMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (supCode == null) {

                query = session.createQuery("from SupplierMaster where orgId='" + orgId + "' and status!='Inactive' and recordStatus='Approved' ORDER BY sno DESC");
            } else {
                query = session.createQuery("from SupplierMaster where supplierCode='" + supCode + "' and status!='Inactive' and recordStatus='Approved'");
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

    public List<Object> unitPriceCalc(String itemCode, String unit, Double unitPrice) throws IOException {
        List<Object> list = new ArrayList<Object>();
        List<ItemCreation> prlist = itemList(itemCode);
        Map<String, Double> itm = new HashMap();
        Map<String, Double> unit_Price = new HashMap();
        Double baseUomPrice, issueUomPrice, uom1Price, uom2Price;
        for (ItemCreation prlist1 : prlist) {
            if (prlist1.getBaseUom() != null) {
                itm.put(prlist1.getBaseUom(), 1.0);
            }
            if (prlist1.getUom1() != null) {
                itm.put(prlist1.getUom1(), prlist1.getConversionFactor1());
            }

            if (prlist1.getUom2() != null) {
                itm.put(prlist1.getUom2(), prlist1.getConversionFactor2());
            }
            if (prlist1.getUom3() != null) {
                itm.put(prlist1.getUom3(), prlist1.getConversionFactor3());
            }

            if (prlist1.getBaseUom() != null && !prlist1.getBaseUom().equalsIgnoreCase(unit)) {
                itm.put(prlist1.getBaseUom(), 1.0);
                baseUomPrice = unitPrice * itm.get(unit) / itm.get(prlist1.getBaseUom());
                unit_Price.put(prlist1.getBaseUom(), baseUomPrice);
            }
            if (prlist1.getUom1() != null && !prlist1.getUom1().equalsIgnoreCase(unit)) {
                itm.put(prlist1.getUom1(), prlist1.getConversionFactor1());
                issueUomPrice = unitPrice * itm.get(unit) / itm.get(prlist1.getUom1());
                unit_Price.put(prlist1.getUom1(), issueUomPrice);
            }

            if (prlist1.getUom2() != null && !prlist1.getUom2().equalsIgnoreCase(unit)) {
                itm.put(prlist1.getUom2(), prlist1.getConversionFactor2());
                uom1Price = unitPrice * itm.get(unit) / itm.get(prlist1.getUom2());
                unit_Price.put(prlist1.getUom2(), uom1Price);
            }
            if (prlist1.getUom3() != null && !prlist1.getUom3().equalsIgnoreCase(unit)) {
                itm.put(prlist1.getUom3(), prlist1.getConversionFactor3());
                uom2Price = unitPrice * itm.get(unit) / itm.get(prlist1.getUom3());
                unit_Price.put(prlist1.getUom3(), uom2Price);
            }

        }
        for (Map.Entry<String, Double> entrySet : unit_Price.entrySet()) {
            String key = entrySet.getKey();
            list.add(key);
            Double value = entrySet.getValue();
            list.add(value);

        }

        return list;

    }

    public List<ItemCreation> itemList(String itemCode) throws IOException {

        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<ItemCreation> prlist = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM ItemCreation  where itemCode='" + itemCode + "'");
            prlist = query.list();

            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return prlist;

    }

    public void savePurchaseOrder(List<PurchaseOrder> grid, String reqPO) throws HibernateException, SQLException {
        for (Iterator<PurchaseOrder> iterator = grid.iterator(); iterator.hasNext();) {
            PurchaseOrder test = (PurchaseOrder) iterator.next();
            savePo(test, reqPO);
        }
    }

    public void savePo(PurchaseOrder transientInstance, String reqPO) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = null;
        Query supquery = null, purquery = null, purreq = null, itmquery = null;
        Integer quotSno = transientInstance.getQtSno(), prSno = transientInstance.getPrSno();
        try {
            tx = session.beginTransaction();
            session.saveOrUpdate(transientInstance);

//            if (reqPO != null && reqPO.equalsIgnoreCase("reqPO")) {
//                itmquery = session.createQuery("update ItemSupplier set purchasePrice='" + transientInstance.getUnitPrice() + "' where supplierCode='" + transientInstance.getSupplierCode() + "' and itemCode='" + transientInstance.getItemCode() + "'");
//                itmquery.executeUpdate();
//            }
            itmquery = session.createQuery("update ItemSupplier set supplierCode='" + transientInstance.getSupplierCode() + "',supplierName='" + transientInstance.getSupplierName() + "' where itemCode='" + transientInstance.getItemCode() + "' and status='Active'");
            itmquery.executeUpdate();
            if (quotSno != null) {
                supquery = session.createQuery("update SupplierQuotation set recordStatus='PO Created' where SNo='" + quotSno + "'");
                supquery.executeUpdate();
            }
            if (prSno != null) {
                purreq = session.createQuery("update PurchaseRequest set recordStatus='PO Created' where SNo='" + prSno + "'");
                purreq.executeUpdate();
            }
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
    }

    public List<PurchaseRequest> rejectedReqList(String userId, String orgId, String SNo)
            throws HibernateException, SQLException {
        List<PurchaseRequest> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createSQLQuery("Select pr_no,pr_date,project_code,item_code,user_id,file_name,sno,record_Status  from arete_tms.purchase_request  where sno in ( select min(sno) \n"
                        + "from arete_tms.purchase_request where org_id='" + orgId + "' and status!='Inactive' and record_Status='Rejected' group by pr_no ) order by sno desc");

            } else {
                query = session.createQuery("from PurchaseRequest where prNo='" + SNo + "' and status!='Inactive' and recordStatus='Rejected' ORDER BY SNo");
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

    public List<SupplierEnquiry> supplierEnquiryList(String userId, String orgId, String enquiriesNo, String suppEmid, String recordStatus)
            throws HibernateException, SQLException {
        List<SupplierEnquiry> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (enquiriesNo == null && recordStatus == null) {
                query = session.createSQLQuery("Select pr_no,pr_date,enquiries_no,enquiries_date,division_name,supplier_mail_id,user_id,s_no,status from arete_tms.supplier_enquiry  where s_no in ( select min(s_no) \n"
                        + "from arete_tms.supplier_enquiry where org_id='" + orgId + "' group by enquiries_no ) order by s_no desc");

            } else if (enquiriesNo != null && suppEmid != null && recordStatus != null) {
                query = session.createQuery("from SupplierEnquiry where enquiriesNo='" + enquiriesNo + "'and supplierMailId='" + suppEmid + "' and status!='Inactive' and recordStatus='" + recordStatus + "'");
            } else if (recordStatus != null) {
                query = session.createSQLQuery("Select pr_no,pr_date,enquiries_no,enquiries_date,division_name,supplier_mail_id,user_id,s_no,status  from arete_tms.supplier_enquiry  where s_no in ( select min(s_no) \n"
                        + "from arete_tms.supplier_enquiry where org_id='" + orgId + "' and record_status='" + recordStatus + "' group by enquiries_no,supplier_mail_id ) order by s_no desc");

            } else {
                query = session.createQuery("from SupplierEnquiry where enquiriesNo='" + enquiriesNo + "' and status!='Inactive'");
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

    //newly added by lakshmi for dashboard based on from and to dates
    public List<SupplierEnquiry> supplierEnquiryList1(String userId, String orgId, String enquiriesNo, String suppEmid, String recordStatus, String fromDate, String toDate)
            throws HibernateException, SQLException {
        List<SupplierEnquiry> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (enquiriesNo == null && recordStatus == null) {
                query = session.createSQLQuery("Select pr_no,pr_date,enquiries_no,enquiries_date,division_name,supplier_mail_id,user_id,s_no,status from arete_tms.supplier_enquiry  where s_no in ( select min(s_no) \n"
                        + "from arete_tms.supplier_enquiry where org_id='" + orgId + "' group by enquiries_no ) and lastmodified_date >='" + fromDate + "' and lastmodified_date <='" + toDate + "' order by s_no desc");

            } else if (enquiriesNo != null && suppEmid != null && recordStatus != null) {
                query = session.createQuery("from SupplierEnquiry where enquiriesNo='" + enquiriesNo + "'and supplierMailId='" + suppEmid + "' and status!='Inactive' and recordStatus='" + recordStatus + "' and lastmodifiedDate >='" + fromDate + "' and lastmodifiedDate <='" + toDate + "'");
            } else if (recordStatus != null) {
                query = session.createSQLQuery("Select pr_no,pr_date,enquiries_no,enquiries_date,division_name,supplier_mail_id,user_id,s_no,status  from arete_tms.supplier_enquiry  where s_no in ( select min(s_no) \n"
                        + "from arete_tms.supplier_enquiry where org_id='" + orgId + "' and record_status='" + recordStatus + "' group by enquiries_no,supplier_mail_id ) and lastmodified_date >='" + fromDate + "' and lastmodified_date <='" + toDate + "' order by s_no desc");

            } else {
                query = session.createQuery("from SupplierEnquiry where enquiriesNo='" + enquiriesNo + "' and status!='Inactive' and lastmodifiedDate >='" + fromDate + "' and lastmodifiedDate <='" + toDate + "'");
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

    public List<MasterTerms> TermsList(Integer SNo, String termType) throws HibernateException, SQLException {
        List<MasterTerms> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from MasterTerms where status!='Inactive' and termType='" + termType + "' order by sno");
            } else {
                query = session.createQuery("from MasterTerms where sno='" + SNo + "' and status!='Inactive'");
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

    public void saveQuotation(List<SupplierQuotation> grid) throws HibernateException, SQLException {
        for (Iterator<SupplierQuotation> iterator = grid.iterator(); iterator.hasNext();) {
            SupplierQuotation test = (SupplierQuotation) iterator.next();
            saveQuot(test, test.getEnqSno());
        }
    }

    public void saveQuot(SupplierQuotation transientInstance, Integer enqSno) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = null;
        Query supquery = null, purquery = null;
        try {
            tx = session.beginTransaction();
            session.saveOrUpdate(transientInstance);
            supquery = session.createQuery("update SupplierEnquiry set recordStatus='Quotation Created' where SNo='" + enqSno + "'");
//            purquery = session.createQuery("update PurchaseRequest set recordStatus='Quotation Created' where SNo='" + reqSno + "'");
            supquery.executeUpdate();
//            purquery.executeUpdate();
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
    }

    public void chkQuotno(HttpServletRequest req, HttpServletResponse res, String quotationNo) throws IOException {

        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<SupplierQuotation> details = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM SupplierQuotation where quotationNo='" + quotationNo + "' ");
            details = query.list();
            if (details.isEmpty()) {
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
            e.printStackTrace();
        } finally {
            session.close();
        }

    }

    public List<SupplierQuotation> quotList(String userId, String orgId, String quotationNo, String recordStatus)
            throws HibernateException, SQLException {
        List<SupplierQuotation> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (quotationNo == null) {
                query = session.createSQLQuery("Select division_name,pr_no,quotation_no,quotation_date,supplier_name,supplier_address,user_id,s_no,enquiries_no  from arete_tms.supplier_quotation where s_no in ( select min(s_no) \n"
                        + "from arete_tms.supplier_quotation where org_id='" + orgId + "' and status!='Inactive' and record_status='" + recordStatus + "' group by pr_no) order by s_no desc");

            } else {
                query = session.createQuery("from SupplierQuotation where quotationNo='" + quotationNo + "' and status!='Inactive'");
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

    public void checkEnterQuot(HttpServletRequest req, HttpServletResponse res, String enquiriesNo) throws IOException {

        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<SupplierEnquiry> details = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from SupplierEnquiry where enquiriesNo='" + enquiriesNo + "' and status!='Inactive' and  recordStatus='Enquiry Created'");
            details = query.list();
            if (details.isEmpty()) {
                out.append("No Pending Quotation");

            } else {
                out.append("Enter Quotation");
            }
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

    }

    public List<SupplierQuotation> quotCompList(String userId, String orgId, String reqNo, String recordStatus, String enqNo)
            throws HibernateException, SQLException {
        List<SupplierQuotation> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (reqNo == null) {
                query = session.createSQLQuery("Select p.division_name,p.pr_no,p.quotation_no,p.quotation_date,p.supplier_name,p.supplier_address,p.user_id,p.s_no from arete_tms.supplier_quotation p where p.org_id='" + orgId + "' and p.status!='Inactive' and p.record_status='" + recordStatus + "'");//and p.equries_no='" + enqNo + "'
//                    query = session.createQuery("from PurchaseRequest where userId='" + userId + "' and orgId='" + orgId + "' and status!='Inactive' and recordStatus='Need Review' ORDER BY SNo DESC");

            } else {
                query = session.createQuery("from SupplierQuotation where prNo='" + reqNo + "' and  status!='Inactive'");//enquiriesNo='" + enqNo + "' and
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

    public List<SupplierQuotation> quotItemCompList(String userId, String orgId, String reqNo, String recordStatus, String enqNo)
            throws HibernateException, SQLException {
        List<SupplierQuotation> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (reqNo == null) {
                query = session.createSQLQuery("Select p.division_name,p.pr_no,p.quotation_no,p.quotation_date,p.supplier_name,p.supplier_address,p.user_id,p.s_no from arete_tms.supplier_quotation p where p.org_id='" + orgId + "' and p.status!='Inactive' and p.record_status='" + recordStatus + "'");//and p.equries_no='" + enqNo + "'
//                    query = session.createQuery("from PurchaseRequest where userId='" + userId + "' and orgId='" + orgId + "' and status!='Inactive' and recordStatus='Need Review' ORDER BY SNo DESC");

            } else {
                query = session.createQuery("Select s.itemName,s.description,s.itemCode,s.deliveryDate from SupplierQuotation s where s.prNo='" + reqNo + "' and s.status!='Inactive' Group By s.itemName,s.description,s.itemCode,s.deliveryDate");//and enquiriesNo='" + enqNo + "' 
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

    public void updateQuotDetails(String pk, Double qty, Double unitPrice, Double discount, Double total, String recordStatus)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update SupplierQuotation set  recordStatus='" + recordStatus + "', quantity='" + qty + "',unitPrice='" + unitPrice + "' ,discount='" + discount + "' ,totalPrice='" + total + "' where SNo='" + pk + "'");
            query.executeUpdate();
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

    public void updateQuotStatus(String reqNo, String recordStatus)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update SupplierQuotation set  recordStatus='" + recordStatus + "' where prNo='" + reqNo + "'");
            query.executeUpdate();
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

    public List<SupplierQuotation> groupSupList(String userId, String orgId, String reqNo, String recordStatus)
            throws HibernateException, SQLException {
        List<SupplierQuotation> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (reqNo == null) {
                query = session.createSQLQuery("Select p.division_name,p.pr_no,p.quotation_no,p.quotation_date,p.supplier_name,p.supplier_address,p.user_id,p.s_no from arete_tms.supplier_quotation p where p.org_id='" + orgId + "'and p.status!='Inactive' and p.record_status='" + recordStatus + "'");
//                    query = session.createQuery("from PurchaseRequest where userId='" + userId + "' and orgId='" + orgId + "' and status!='Inactive' and recordStatus='Need Review' ORDER BY SNo DESC");

            } else {
                query = session.createQuery("Select s.supplierCode,s.supplierName,s.paymentTerms,s.deliveryTerms,s.specialSpecificationDetails from SupplierQuotation s where s.prNo='" + reqNo + "' and s.status!='Inactive' Group By s.supplierCode,s.supplierName,s.paymentTerms,s.deliveryTerms,s.specialSpecificationDetails");
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

    public void updateQuotApprover(String userId, String remarks, String date, String pk, Double qty, Double unitPrice, Double discount, Double total, String recordStatus, String reqNo)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null, query2 = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update SupplierQuotation set  recordStatus='" + recordStatus + "', quantity='" + qty + "',unitPrice='" + unitPrice + "' ,discount='" + discount + "' ,totalPrice='" + total + "',approverName='" + userId + "',approverRemarks='" + remarks + "'  ,approverDate='" + date + "' where SNo='" + pk + "'");
            query2 = session.createQuery("update SupplierQuotation set  recordStatus='Rejected' where prNo='" + reqNo + "' and recordStatus='Quotation Compared'");
            query.executeUpdate();
            query2.executeUpdate();
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

    public List<SupplierQuotation> approvedQuotList(String userId, String orgId, String quotationNo, String recordStatus)
            throws HibernateException, SQLException {
        List<SupplierQuotation> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (quotationNo == null) {
                query = session.createSQLQuery("Select division_name,pr_no,quotation_no,quotation_date,supplier_name,supplier_address,user_id,s_no from arete_tms.supplier_quotation   where s_no in \n"
                        + "( select min(s_no) from arete_tms.supplier_quotation \n"
                        + " where record_status='Quotation Approved' group by supplier_name ) order by s_no desc");
//                    query = session.createQuery("from PurchaseRequest where userId='" + userId + "' and orgId='" + orgId + "' and status!='Inactive' and recordStatus='Need Review' ORDER BY SNo DESC");

            } else {
                query = session.createQuery("from SupplierQuotation where quotationNo='" + quotationNo + "' and status!='Inactive' and recordStatus='" + recordStatus + "'");
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

    //newly added by lakshmi for dashboard based on from and to dates
    public List<SupplierQuotation> approvedQuotList1(String userId, String orgId, String quotationNo, String recordStatus, String fromDate, String toDate)
            throws HibernateException, SQLException {
        List<SupplierQuotation> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (quotationNo == null) {
                query = session.createSQLQuery("Select division_name,pr_no,quotation_no,quotation_date,supplier_name,supplier_address,user_id,s_no from arete_tms.supplier_quotation   where s_no in \n"
                        + "( select min(s_no) from arete_tms.supplier_quotation \n"
                        + " where record_status='Quotation Approved' group by supplier_name )and lastmodified_date >='" + fromDate + "' and lastmodified_date <='" + toDate + "' order by s_no desc");
//                    query = session.createQuery("from PurchaseRequest where userId='" + userId + "' and orgId='" + orgId + "' and status!='Inactive' and recordStatus='Need Review' ORDER BY SNo DESC");

            } else {
                query = session.createQuery("from SupplierQuotation where quotationNo='" + quotationNo + "' and status!='Inactive' and recordStatus='" + recordStatus + "' and lastmodifiedDate >='" + fromDate + "' and lastmodifiedDate <='" + toDate + "'");
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

    public void approverEmail(String userId, String orgId, String subject, String body, String level, String submoduleName) throws HibernateException, SQLException, MessagingException {
        Common cm = new Common();
//        String from = "excelajh123@gmail.com";
//        String pass = "excel123";
        String[] to = {};
        String from = "";
        String pass = "";
        String hostName = null, cc = null;
        String ccMail[] = null;
        String sendToMail[];

        List<HostEmailConfig> hostEmailCofig = hostEmailCofig(userId, orgId, submoduleName);
        for (HostEmailConfig hostEmailCofig1 : hostEmailCofig) {
            if (hostEmailCofig1.getEmailFrom() != null) {
                from = hostEmailCofig1.getEmailFrom();
            }
            if (hostEmailCofig1.getPasswordFrom() != null) {
                pass = hostEmailCofig1.getPasswordFrom();
            }
            if (hostEmailCofig1.getHostName() != null) {
                hostName = hostEmailCofig1.getHostName();
            }
            if (hostEmailCofig1.getEmailCc() != null) {
                cc = hostEmailCofig1.getEmailCc();
            }

        }
        if (cc != null) {
            ccMail = cc.split(",");
        }
        if (!from.isEmpty() && !pass.isEmpty()) {
            List<ApprovalLevel> userlist = appwrklist(userId, orgId, level, submoduleName);
            StringBuilder toemail = new StringBuilder();
            if (userlist.size() > 0) {
                for (ApprovalLevel userlist1 : userlist) {
                    toemail.append(userlist1.getApproverEmailId()).append(",");
                }
                to = toemail.toString().split(",");
            }

            String mailbody = "<html><body bgcolor=#FFFFFF leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>"
                    + "Dear Sir/Madam,<br><br><br>" + body
                    //                        + "<table border='1px' cellpadding='5'>"
                    //                        + "<tr><th>Item Name</th><th>Item Description</th><th>Required Before</th><th>Quantity</th><th>Location</th><th>Project Code</th><th>Item Specification</th></tr>"
                    //                        + test
                    //                        + "</table>"
                    + "</body>"
                    + "</html>";
            if (to.length > 0) {
//                cm.sendEmail(from, pass, to, subject, mailbody, null, null);
                cm.sendEmail1(from, pass, to, subject, mailbody, null, null, ccMail, hostName);
            }
        }

    }

    public List<ApprovalLevel> appwrklist(String userId, String orgId, String level, String submodName)
            throws HibernateException, SQLException {
        List<ApprovalLevel> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from ApprovalLevel where subModuleName='" + submodName + "' and approverLevel='" + level + "' and status!='Inactive'");

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
//public void uomlist(HttpServletRequest req, HttpServletResponse res, String code) throws IOException {
//        res.setContentType("text/html;charset=UTF-8");
//        PrintWriter out = res.getWriter();
//        Transaction tx = null;
//
//        Session session = getSessionFactory().openSession();
//        // SQLQuery query = null;
//        System.out.println("item code is =-="+code);
//        Query query = null;
//
//        try {
//            tx = session.beginTransaction();
//
//            query = session.createQuery("select baseUom,uom1,uom2,uom3,conversionFactor1,conversionFactor2,conversionFactor3 from ItemCreation\n"
//                    + "where itemCode = '" + code + "'");
//
//            List<Object[]> cityData = query.list();
//
//            if (!cityData.isEmpty()) {
//                for (Object[] st : cityData) {
//
////                    for (int i = 0; i < st.length; i++) {
////                        String s = st[i].toString().trim();
////                        if (s.length() > 0) {
//                    out.append(st[0] + "," + st[1] + "," + st[2] + "," + st[3] + ","
//                            + st[4] + "," + st[5] + "," + st[6] + ",");
////                        }
////                    }           
//                }
//
//            } else {
//                out.append("No Data");
//            }
//
//            tx.commit();
//
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

    public void uomlist(HttpServletRequest req, HttpServletResponse res, String code) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;

        Session session = getSessionFactory().openSession();
        // SQLQuery query = null;
        Query query = null;
        Query query1 = null;

        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("select ITEM_UOM from arete_tms.item_master where ITEM_CODE='" + code + "'");
            query1 = session.createSQLQuery("select UOM_NAME from arete_tms.uom_master");

            List<String[]> cityData = query.list();
            List<String[]> cityData1 = query1.list();
            String uom = "";
            String uom2 = "";
            String uom1 = "";
            String uom3 = "";
            String uom4 = "";
            String uom5 = "";
            List<String> list = new ArrayList();

            if (!cityData.isEmpty() && !cityData1.isEmpty()) {
                for (int j = 0; j < cityData.size(); j++) {

                    uom = cityData.get(j) + ",";

                }

                for (int i = 0; i < cityData1.size(); i++) {

                    uom1 = (cityData1.get(i)) + ",";
                    list.add(uom1);

                }

                for (String list1 : list) {

                    if (list1.equalsIgnoreCase(uom)) {

                    } else {
                        uom3 = list1;
                        uom4 = uom4 + uom3;
                    }

                }
                out.append(uom + uom4);

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

    public void uomWiseUnitPrice(HttpServletRequest req, HttpServletResponse res, String code, String suppCode, String uom) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;

        Session session = getSessionFactory().openSession();
        // SQLQuery query = null;
        Map<String, Double> itm = new HashMap();
        Query query = null;
        Double unitPrice = 0.0;
        try {
            tx = session.beginTransaction();
            if (code != null && suppCode != null) {
                query = session.createQuery("from ItemSupplier\n"
                        + "where itemCode = '" + code + "' and supplierCode = '" + suppCode + "'and status='Active' and "
                        + "(baseUom = '" + uom + "' OR uom1 = '" + uom + "' OR uom2 = '" + uom + "' OR uom3 = '" + uom + "')");

                List<ItemSupplier> uomList = query.list();

                if (!uomList.isEmpty()) {
                    for (ItemSupplier uomList1 : uomList) {
                        if (uomList1.getBaseUom() != null) {
                            itm.put(uomList1.getBaseUom(), uomList1.getPurchasePrice());
                        }

                        if (uomList1.getUom1() != null) {
                            itm.put(uomList1.getUom1(), uomList1.getUom1Price());
                        }
                        if (uomList1.getUom2() != null) {
                            itm.put(uomList1.getUom2(), uomList1.getUom2Price());
                        }
                        if (uomList1.getUom3() != null) {
                            itm.put(uomList1.getUom3(), uomList1.getUom3Price());
                        }

                    }
                    if (itm.get(uom) != null) {
                        unitPrice = itm.get(uom);
                        out.append(new DecimalFormat("0.000").format(unitPrice));
                    }

                } else {
                    out.append("");
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

    public List<BilltoLocation> billToLoc()
            throws HibernateException, SQLException {
        List<BilltoLocation> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from BilltoLocation where  status!='Inactive'");

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

    public List<SupplierQuotation> allQuotList(String userId, String orgId, String quotationNo, String recordStatus)
            throws HibernateException, SQLException {
        List<SupplierQuotation> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (quotationNo == null) {
                query = session.createSQLQuery("Select division_name,pr_no,quotation_no,quotation_date,supplier_name,supplier_address,user_id,s_no from arete_tms.supplier_quotation   where s_no in \n"
                        + "( select min(s_no) from arete_tms.supplier_quotation \n"
                        + " where (record_status='Quotation Approved' or record_status='PO Created' )group by supplier_name ) order by s_no desc");
//                    query = session.createQuery("from PurchaseRequest where userId='" + userId + "' and orgId='" + orgId + "' and status!='Inactive' and recordStatus='Need Review' ORDER BY SNo DESC");

            } else {
                query = session.createQuery("from SupplierQuotation where quotationNo='" + quotationNo + "' and status!='Inactive' and (recordStatus='Quotation Approved' or recordStatus='PO Created' )");
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

    public List<StoreMaster> storeMaster(Integer SNo) throws HibernateException {
        List<StoreMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from StoreMaster where  status!='Inactive' order by storeName");
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
    
    public List<PurchaseOrder> poListView(String sno) throws HibernateException {
        List<PurchaseOrder> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno == null) {
                query = session.createQuery("from StoreMaster where  status!='Inactive' order by storeName");
            } else {
                query = session.createQuery("from PurchaseOrder where SNo='" + sno + "' and status!='Inactive'");
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
    
    public List<PurchaseItemDescription> poItemDescListView(String poNo) throws HibernateException {
        List<PurchaseItemDescription> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (poNo == null) {
                query = session.createQuery("from StoreMaster where  status!='Inactive' order by storeName");
            } else {
                query = session.createQuery("from PurchaseItemDescription where poCode='" + poNo + "' and status!='Inactive'");
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

    public void itemSubCatList(HttpServletRequest req, HttpServletResponse res, String itemCat) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        List<ItemSubcategory> code = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            //query = session.createQuery("Select itemSubCategory from ItemSubcategory where itemCategory='" + itemCat + "'  and status!='Inactive'");
            query = session.createQuery("Select itemCategory from ItemCategory where itemCategory='" + itemCat + "'  and status!='Inactive'");
            code = query.list();
            for (Object getcode : code) {
                out.print(getcode.toString() + ",");
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

    public void unitPrice(HttpServletRequest req, HttpServletResponse res, String code, String suppCode) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;

        Session session = getSessionFactory().openSession();
        // SQLQuery query = null;
        Query query = null;

        try {
            tx = session.beginTransaction();
            if (code != null && suppCode != null) {
                query = session.createQuery("select purchasePrice from ItemSupplier\n"
                        + "where itemCode = '" + code + "' and supplierCode = '" + suppCode + "' and status='Active'");

                List<Double> cityData = query.list();

                if (!cityData.isEmpty()) {
                    for (Double st : cityData) {
                        out.append(cityData.get(0).toString());

                    }

                } else {
                    out.append("No Data");
                }
            } else {
                query = session.createQuery("select purchasePrice from ItemSupplier\n"
                        + "where itemCode = '" + code + "' and status='Active'");

                List<Double> cityData = query.list();

                if (!cityData.isEmpty()) {
                    for (Double st : cityData) {
                        out.append(cityData.get(0).toString());

                    }

                } else {
                    out.append("No Data");
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

    public void revAppSubmit(String pk, String userId, String reviewerComments, String recordStatus, String revDate)
            throws HibernateException, SQLException {

        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update PurchaseRequest set recordStatus='" + recordStatus + "',reviewerName='" + userId + "',reviewerRemarks='" + reviewerComments + "',reviewerDate='" + revDate + "'  where SNo='" + pk + "'");

            query.executeUpdate();
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

    public void recheckUpdate(String prNo, String reviewerRemarks, String recordStatus)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update PurchaseRequest set recordStatus='" + recordStatus + "',reviewerRemarks='" + reviewerRemarks + "' where prNo='" + prNo + "'");
            query.executeUpdate();
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

    public List<PurchaseOrder> poNoList(String userId, String orgId, String poNo, String recordStatus)
            throws HibernateException, SQLException {
        List<PurchaseOrder> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (poNo == null && recordStatus == null) {
                query = session.createSQLQuery("Select purchase_order_no,purchase_order_date,supplier_name,prepared_by,s_no,record_status,po_rev_no  from arete_tms.purchase_order  where s_no in ( select min(s_no) \n"
                        + "from arete_tms.purchase_order where org_id='" + orgId + "' and status!='Inactive' group by purchase_order_no ) order by s_no desc");

            } else if (recordStatus != null && recordStatus.equalsIgnoreCase("Initial")) {

                query = session.createQuery("from PurchaseOrder where purchaseOrderNo='" + poNo + "' and approvalStatus='" + recordStatus + "' and recordStatus='Approved' and status!='Inactive'");
            } else if (recordStatus != null && recordStatus.equalsIgnoreCase("PO Created")) {

                query = session.createQuery("from PurchaseOrder where purchaseOrderNo='" + poNo + "' and status!='Inactive' and (recordStatus='" + recordStatus + "' or recordStatus='PM Recheck' or recordStatus='PM approved')");
            } else if (recordStatus != null && recordStatus.equalsIgnoreCase("pendingPO")) {

                query = session.createQuery("from PurchaseOrder where purchaseOrderNo='" + poNo + "' and status!='Inactive' and recordStatus='Approved' and (approvalStatus='Initial' or approvalStatus='Partial Receipt') ");

            } else {
                query = session.createQuery("from PurchaseOrder where purchaseOrderNo='" + poNo + "' and status!='Inactive'");
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

    public List<PurchaseOrder> groupPOList(String userId, String orgId, String poNo)
            throws HibernateException, SQLException {
        List<PurchaseOrder> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("select prNo,prDate from PurchaseOrder where purchaseOrderNo='" + poNo + "' and status!='Inactive' group by prNo");//,prDate

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

    public List<StoreMaster> storeMasterdivisionwise(String storeName, String division) throws HibernateException {
        List<StoreMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from StoreMaster where storeName='" + storeName + "' and division='" + division + "' and status!='Inactive'");

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

    public List<PurchaseOrder> poPaginationList(String userId, String orgId, String SNo, String searchData, Integer iDisplayStart, Integer displayLength, String order, String recordStatus, String sCol, String listPage)
            throws HibernateException, SQLException {
        List<PurchaseOrder> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

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
                sCol = "prepared_by";
            }
            if (sCol.equals("4")) {
                sCol = "record_status";
            }
            if (SNo == null && recordStatus == null) {
                query = session.createSQLQuery("Select purchase_order_no,purchase_order_date,supplier_name,prepared_by,sno,record_status,po_rev_no,email_status,division_name,grand_total  from arete_tms.purchase_order  where sno in ( select min(sno)  \n"
                        + "from arete_tms.purchase_order where org_id='" + orgId + "' and user_id='" + userId + "' and status!='Inactive' and "
                        + "(lower(purchase_order_no) LIKE lower('%" + searchData + "%')  or lower(purchase_order_date) LIKE lower('%" + searchData + "%') or lower(user_id) LIKE lower('%" + searchData + "%') "
                        + "or lower(record_status) LIKE lower('%" + searchData + "%') or lower(supplier_name) LIKE lower('%" + searchData + "%')or lower(item_name) LIKE lower('%" + searchData + "%'))  group by purchase_order_no ) order by " + sCol + "  " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);

            } else if (listPage != null && listPage.equalsIgnoreCase("approvedPoList")) {
                query = session.createSQLQuery("Select purchase_order_no,purchase_order_date,supplier_name,prepared_by,sno,record_status,po_rev_no,email_status,division_name,grand_total  from arete_tms.purchase_order  where sno in ( select min(sno)  \n"
                        + "from arete_tms.purchase_order where org_id='" + orgId + "' and record_status='" + recordStatus + "'  and status!='Inactive' and "
                        + "(lower(purchase_order_no) LIKE lower('%" + searchData + "%')  or lower(purchase_order_date) LIKE lower('%" + searchData + "%') or lower(user_id) LIKE lower('%" + searchData + "%') "
                        + "or lower(supplier_name) LIKE lower('%" + searchData + "%') or lower(item_name) LIKE lower('%" + searchData + "%'))  group by purchase_order_no ) order by " + sCol + "  " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);

            } else if (recordStatus != null && recordStatus.equalsIgnoreCase("PendingPO")) {
                query = session.createSQLQuery("Select purchase_order_no,purchase_order_date,supplier_name,prepared_by,sno,record_status,po_rev_no,email_status,division_name,grand_total  from arete_tms.purchase_order  where sno in ( select min(sno)  \n"
                        + "from arete_tms.purchase_order where org_id='" + orgId + "'  and status!='Inactive' and record_status='Approved' and (approval_status='Initial' or  approval_status='Partial Receipt') and"
                        + "(lower(purchase_order_no) LIKE lower('%" + searchData + "%')  or lower(purchase_order_date) LIKE lower('%" + searchData + "%') or lower(user_id) LIKE lower('%" + searchData + "%') "
                        + "or lower(supplier_name) LIKE lower('%" + searchData + "%') or lower(item_name) LIKE lower('%" + searchData + "%'))  group by purchase_order_no ) order by " + sCol + "  " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);

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

    //added for dashboard issues from pavi
    public List<PurchaseOrder> poPaginationList1(String userId, String orgId, String SNo, String searchData, Integer iDisplayStart, Integer displayLength, String order, String recordStatus, String sCol, String listPage, String fromDate, String toDate)
            throws HibernateException, SQLException {
        List<PurchaseOrder> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

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
                sCol = "prepared_by";
            }
            if (sCol.equals("4")) {
                sCol = "record_status";
            }
            if (SNo == null && recordStatus == null) {
                query = session.createSQLQuery("Select purchase_order_no,purchase_order_date,supplier_name,prepared_by,sno,record_status,po_rev_no,email_status,division_name,grand_total  from arete_tms.purchase_order  where sno in ( select min(sno)  \n"
                        + "from arete_tms.purchase_order where org_id='" + orgId + "' lastmodified_date >='" + fromDate + "' and lastmodified_date <='" + toDate + "' and user_id='" + userId + "' and status!='Inactive' and "
                        + "(lower(purchase_order_no) LIKE lower('%" + searchData + "%')  or lower(purchase_order_date) LIKE lower('%" + searchData + "%') or lower(user_id) LIKE lower('%" + searchData + "%') "
                        + "or lower(record_status) LIKE lower('%" + searchData + "%') or lower(supplier_name) LIKE lower('%" + searchData + "%')or lower(item_name) LIKE lower('%" + searchData + "%'))  group by purchase_order_no ) order by " + sCol + "  " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);

            } else if (listPage != null && listPage.equalsIgnoreCase("approvedPoList")) {
                query = session.createSQLQuery("Select purchase_order_no,purchase_order_date,supplier_name,prepared_by,sno,record_status,po_rev_no,email_status,division_name,grand_total  from purchase_order  where sno in ( select min(sno)  \n"
                        + "from arete_tms.purchase_order where org_id='" + orgId + "' and record_status='" + recordStatus + "'  and status!='Inactive' and "
                        + "(lower(purchase_order_no) LIKE lower('%" + searchData + "%')  or lower(purchase_order_date) LIKE lower('%" + searchData + "%') or lower(user_id) LIKE lower('%" + searchData + "%') "
                        + "or lower(supplier_name) LIKE lower('%" + searchData + "%') or lower(item_name) LIKE lower('%" + searchData + "%'))  group by purchase_order_no ) order by " + sCol + "  " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);

            } else if (recordStatus != null && recordStatus.equalsIgnoreCase("PendingPO")) {
                query = session.createSQLQuery("Select purchase_order_no,purchase_order_date,supplier_name,prepared_by,sno,record_status,po_rev_no,email_status,division_name,grand_total  from purchase_order  where sno in ( select min(sno)  \n"
                        + "from arete_tms.purchase_order where org_id='" + orgId + "'  and status!='Inactive' and record_status='Approved' and (approval_status='Initial' or  approval_status='Partial Receipt') and"
                        + "(lower(purchase_order_no) LIKE lower('%" + searchData + "%')  or lower(purchase_order_date) LIKE lower('%" + searchData + "%') or lower(user_id) LIKE lower('%" + searchData + "%') "
                        + "or lower(supplier_name) LIKE lower('%" + searchData + "%') or lower(item_name) LIKE lower('%" + searchData + "%'))  group by purchase_order_no ) order by " + sCol + "  " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);

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

    public BigInteger poCount(String userId, String orgId, String SNo, String searchData, String order, String recordStatus, String listPage)
            throws HibernateException, SQLException {
        BigInteger datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null && recordStatus == null) {
                query = session.createSQLQuery("Select COUNT(purchase_order_no)  from arete_tms.purchase_order  where sno in ( select min(sno)  \n"
                        + "from arete_tms.purchase_order where org_id='" + orgId + "' and user_id='" + userId + "' and status!='Inactive' and "
                        + "(lower(purchase_order_no) LIKE lower('%" + searchData + "%')  or lower(purchase_order_date) LIKE lower('%" + searchData + "%') or lower(prepared_by) LIKE lower('%" + searchData + "%') "
                        + "or lower(record_status) LIKE lower('%" + searchData + "%')  or lower(supplier_name) LIKE lower('%" + searchData + "%')or lower(item_name) LIKE lower('%" + searchData + "%'))  group by purchase_order_no ) order by sno " + order + "");

            } else if (listPage != null && listPage.equalsIgnoreCase("approvedPoList")) {
                query = session.createSQLQuery("Select COUNT(purchase_order_no)  from arete_tms.purchase_order  where sno in ( select min(sno)  \n"
                        + "from arete_tms.purchase_order where org_id='" + orgId + "' and record_status='" + recordStatus + "'  and status!='Inactive' and "
                        + "(lower(purchase_order_no) LIKE lower('%" + searchData + "%')  or lower(purchase_order_date) LIKE lower('%" + searchData + "%') or lower(user_id) LIKE lower('%" + searchData + "%') "
                        + "or lower(supplier_name) LIKE lower('%" + searchData + "%')or lower(item_name) LIKE lower('%" + searchData + "%'))  group by purchase_order_no ) order by sno " + order + "");

            } else if (recordStatus != null && recordStatus.equalsIgnoreCase("PendingPO")) {
                query = session.createSQLQuery("Select COUNT(purchase_order_no)  from arete_tms.purchase_order  where sno in ( select min(sno)  \n"
                        + "from arete_tms.purchase_order where org_id='" + orgId + "' and status!='Inactive' and record_status='Approved' and (approval_status='Initial' or  approval_status='Partial Receipt') and "
                        + "(lower(purchase_order_no) LIKE lower('%" + searchData + "%')  or lower(purchase_order_date) LIKE lower('%" + searchData + "%') or lower(user_id) LIKE lower('%" + searchData + "%') "
                        + "or lower(supplier_name) LIKE lower('%" + searchData + "%')or lower(item_name) LIKE lower('%" + searchData + "%'))  group by purchase_order_no ) order by sno " + order + "");

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

    public BigInteger poCount1(String userId, String orgId, String SNo, String searchData, String order, String recordStatus, String listPage, String fromDate, String toDate)
            throws HibernateException, SQLException {
        BigInteger datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null && recordStatus == null) {
                query = session.createSQLQuery("Select COUNT(purchase_order_no)  from arete_tms.purchase_order  where sno in ( select min(sno)  \n"
                        + "from arete_tms.purchase_order where org_id='" + orgId + "' and lastmodified_date >='" + fromDate + "' and lastmodified_date <='" + toDate + "' and user_id='" + userId + "' and status!='Inactive' and "
                        + "(lower(purchase_order_no) LIKE lower('%" + searchData + "%')  or lower(purchase_order_date) LIKE lower('%" + searchData + "%') or lower(prepared_by) LIKE lower('%" + searchData + "%') "
                        + "or lower(record_status) LIKE lower('%" + searchData + "%')  or lower(supplier_name) LIKE lower('%" + searchData + "%')or lower(item_name) LIKE lower('%" + searchData + "%'))  group by purchase_order_no ) order by sno " + order + "");

            } else if (listPage != null && listPage.equalsIgnoreCase("approvedPoList")) {
                query = session.createSQLQuery("Select COUNT(purchase_order_no)  from arete_tms.purchase_order  where sno in ( select min(sno)  \n"
                        + "from arete_tms.purchase_order where org_id='" + orgId + "' and record_status='" + recordStatus + "'  and status!='Inactive' and "
                        + "(lower(purchase_order_no) LIKE lower('%" + searchData + "%')  or lower(purchase_order_date) LIKE lower('%" + searchData + "%') or lower(user_id) LIKE lower('%" + searchData + "%') "
                        + "or lower(supplier_name) LIKE lower('%" + searchData + "%')or lower(item_name) LIKE lower('%" + searchData + "%'))  group by purchase_order_no ) order by sno " + order + "");

            } else if (recordStatus != null && recordStatus.equalsIgnoreCase("PendingPO")) {
                query = session.createSQLQuery("Select COUNT(purchase_order_no)  from arete_tms.purchase_order  where sno in ( select min(sno)  \n"
                        + "from arete_tms.purchase_order where org_id='" + orgId + "' and status!='Inactive' and record_status='Approved' and (approval_status='Initial' or  approval_status='Partial Receipt') and "
                        + "(lower(purchase_order_no) LIKE lower('%" + searchData + "%')  or lower(purchase_order_date) LIKE lower('%" + searchData + "%') or lower(user_id) LIKE lower('%" + searchData + "%') "
                        + "or lower(supplier_name) LIKE lower('%" + searchData + "%')or lower(item_name) LIKE lower('%" + searchData + "%'))  group by purchase_order_no ) order by sno " + order + "");

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

    public void emailStatusUpdate(String poNo, String emailStatus) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = null;
        try {

            hql = "update PurchaseOrder set emailStatus='" + emailStatus + "' where purchaseOrderNo='" + poNo + "'";

            Query query = session.createQuery(hql);

            int row = query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void savePurchaseOrder(List<PurchaseOrder> grid, String itmSupp, String pkItemDel) throws HibernateException, SQLException {
        for (Iterator<PurchaseOrder> iterator = grid.iterator(); iterator.hasNext();) {
            PurchaseOrder test = (PurchaseOrder) iterator.next();
            savePo(test, itmSupp, pkItemDel);
        }
    }

    public void savePo(PurchaseOrder transientInstance, String itmSupp, String pkItemDel) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = null;
        Query itmquery = null, revquery = null;
        try {
            tx = session.beginTransaction();
            session.saveOrUpdate(transientInstance);

            if (itmSupp != null && itmSupp.equalsIgnoreCase("purchPriceUpdate")) {
//                itmquery = session.createQuery("update ItemSupplier set purchasePrice='" + transientInstance.getUnitPrice() + "' where supplierCode='" + transientInstance.getSupplierCode() + "' and itemCode='" + transientInstance.getItemCode() + "'");
//                itmquery.executeUpdate();

                revquery = session.createQuery("update PurchaseOrder set poRevNo='" + transientInstance.getPoRevNo() + "' where purchaseOrderNo='" + transientInstance.getPurchaseOrderNo() + "'");
                revquery.executeUpdate();

            }
            itmquery = session.createQuery("update ItemSupplier set supplierCode='" + transientInstance.getSupplierCode() + "',supplierName='" + transientInstance.getSupplierName() + "' where itemCode='" + transientInstance.getItemCode() + "' and status='Active'");
            itmquery.executeUpdate();
            if (pkItemDel != null && !pkItemDel.isEmpty()) {
                String[] stdel = pkItemDel.split(",");
                for (String pkItemDel1 : stdel) {

                    if (pkItemDel1 != null && !pkItemDel1.isEmpty()) {
                        String hql = "update PurchaseOrder set status='Inactive' where SNo=" + pkItemDel1 + "";
                        Query query = session.createQuery(hql);
                        query.executeUpdate();
                    }

                }

            }

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
    }

    public List<PurchaseOrder> poList5(String userId, String orgId, String SNo, String recordStatus)
            throws HibernateException, SQLException {
        List<PurchaseOrder> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null && recordStatus == null) {
                query = session.createSQLQuery("Select purchase_order_no,purchase_order_date,supplier_name,prepared_by,sno,record_status,po_rev_no,email_status  from arete_tms.purchase_order  where sno in ( select min(sno) \n"
                        + "from arete_tms.purchase_order where org_id='" + orgId + "' and record_status!='Approved' and record_status!='Rejected' and user_id='" + userId + "' and status!='Inactive' group by purchase_order_no ) order by sno desc");

            } else if (recordStatus != null) {
                query = session.createSQLQuery("Select purchase_order_no,purchase_order_date,supplier_name,prepared_by,sno,record_status,po_rev_no,email_status  from arete_tms.purchase_order  where sno in ( select min(sno)\n"
                        + "from arete_tms.purchase_order where org_id='" + orgId + "' and status!='Inactive' and record_status='" + recordStatus + "' group by purchase_order_no ) order by sno desc");

            } else {
                query = session.createQuery("from PurchaseOrder where SNo='" + SNo + "' and status!='Inactive'");
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

    public void pmStatusUpdateRechkRejct(String poNo, String pmRemark, String pmName, String pmDate, String recordStatus) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = null;
        try {

            hql = "update PurchaseOrder set recordStatus='" + recordStatus
                    + "',purMngRemarks='" + pmRemark + "',purMngName='" + pmName
                    + "',purMngDate='" + pmDate
                    + "' where purchaseOrderNo='" + poNo + "'";

            Query query = session.createQuery(hql);

            int row = query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void gmStatusUpdateRechkRejct(String poNo, String gmRemarks, String gmName, String gmDate, String recordStatus) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = null;
        try {

            hql = "update PurchaseOrder set recordStatus='" + recordStatus + "',gmRemarks='" + gmRemarks
                    + "',gmName='" + gmName + "',gmDate='" + gmDate
                    + "' where purchaseOrderNo='" + poNo + "'";

            Query query = session.createQuery(hql);

            int row = query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void pmStatusUpdate(String pk, String poNo, String pmRemark, String pmName, String pmDate, String recordStatus, Double qty, Double discount, Double price, Double total, Double grandtotal, String delDate,
            String uom1, Double uom1Price, String uom2, Double uom2Price, String uom3, Double uom3Price) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = null;
        try {

            hql = "update PurchaseOrder set recordStatus='" + recordStatus
                    + "',purMngRemarks='" + pmRemark + "',purMngName='" + pmName
                    + "',purMngDate='" + pmDate
                    + "' ,qty='" + qty + "',discount='" + discount
                    + "',unitPrice='" + price + "',totalValue='" + total
                    + "',grandTotal='" + grandtotal + "',requiredDate='" + delDate
                    + "' ,uom1='" + uom1 + "' ,uom1Price='" + uom1Price
                    + "' ,uom2='" + uom2 + "' ,uom2Price='" + uom2Price
                    + "' ,uom3='" + uom3 + "' ,uom3Price='" + uom3Price + "' where SNo='" + pk + "'";

            Query query = session.createQuery(hql);

            int row = query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void fmStatusUpdateRechkRejct(String poNo, String fmRemarks, String fmName, String fmDate, String recordStatus) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = null;
        try {

            hql = "update PurchaseOrder set recordStatus='" + recordStatus + "',fmRemarks='" + fmRemarks
                    + "',fmName='" + fmName + "',fmDate='" + fmDate
                    + "' where purchaseOrderNo='" + poNo + "'";

            Query query = session.createQuery(hql);

            int row = query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void fmStatusUpdate(String pk, String poNo, String fmRemarks, String fmName, String fmDate, String recordStatus, Double qty, Double discount, Double price, Double total, Double grandtotal, String delDate,
            String uom1, Double uom1Price, String uom2, Double uom2Price, String uom3, Double uom3Price) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = null;
        try {

            hql = "update PurchaseOrder set recordStatus='" + recordStatus + "',fmRemarks='" + fmRemarks
                    + "',fmName='" + fmName + "',fmDate='" + fmDate
                    + "' ,qty='" + qty + "',discount='" + discount
                    + "',unitPrice='" + price + "',totalValue='" + total
                    + "',grandTotal='" + grandtotal + "',requiredDate='" + delDate
                    + "' ,uom1='" + uom1 + "' ,uom1Price='" + uom1Price
                    + "' ,uom2='" + uom2 + "' ,uom2Price='" + uom2Price
                    + "' ,uom3='" + uom3 + "' ,uom3Price='" + uom3Price + "' where SNo='" + pk + "'";

            Query query = session.createQuery(hql);

            int row = query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void gmStatusUpdate(String pk, String poNo, String gmRemarks, String gmName, String gmDate, String recordStatus, Double qty, Double discount, Double price, Double total, Double grandtotal, String delDate,
            String uom1, Double uom1Price, String uom2, Double uom2Price, String uom3, Double uom3Price) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = null;
        try {

            hql = "update PurchaseOrder set recordStatus='" + recordStatus + "',gmRemarks='" + gmRemarks
                    + "',gmName='" + gmName + "',gmDate='" + gmDate
                    + "' ,qty='" + qty + "',discount='" + discount
                    + "',unitPrice='" + price + "',totalValue='" + total
                    + "',grandTotal='" + grandtotal + "',requiredDate='" + delDate
                    + "' ,uom1='" + uom1 + "' ,uom1Price='" + uom1Price
                    + "' ,uom2='" + uom2 + "' ,uom2Price='" + uom2Price
                    + "' ,uom3='" + uom3 + "' ,uom3Price='" + uom3Price + "' where SNo='" + pk + "'";

            Query query = session.createQuery(hql);

            int row = query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void itemWiseSup(HttpServletRequest req, HttpServletResponse res, String itemCode) throws IOException {

        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<Object[]> details = null;
        try {
            tx = session.beginTransaction();
//            query = session.createQuery("Select supplierCode,supplierName,purchasePrice from ItemSupplier where itemCode='" + itemCode + "' and status='Active'").setMaxResults(1);
//            details = query.list();
//            if (!details.isEmpty()) {
//                for (Object[] detail : details) {
//                    out.append(detail[0] + "$" + detail[1] + "$" + detail[2] + "$");
//                }
//
//            }

            query = session.createQuery("Select supplierCode,supplierName,baseUom,purchasePrice,uom1,uom1Price,uom2,uom2Price,"
                    + "uom3,uom3Price from ItemSupplier where itemCode='" + itemCode + "' and status='Active'").setMaxResults(1);
            details = query.list();
            if (!details.isEmpty()) {
                for (Object[] detail : details) {
                    out.append(detail[0] + "$" + detail[1] + "$" + detail[2] + "$" + detail[3] + "$" + detail[4] + "$" + detail[5] + "$"
                            + detail[6] + "$" + detail[7] + "$" + detail[8] + "$" + detail[9] + "$");
                }

            }
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

    }

    public void cancelPO(String sno) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update PurchaseOrder set approvalStatus='Cancelled' where SNo='" + sno + "' and approvalStatus!='Fully Receipt'";
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

    public void cancelCompletePO(String poNo) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update PurchaseOrder set recordStatus='Cancelled' where purchaseOrderNo='" + poNo + "' and approvalStatus!='Fully Receipt'";
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

    public Double chkReceivedQty(String itemCode, String orgCode, String poNo, String purcUom, String delDate) throws IOException {

        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null, query1 = null;
        List<Object[]> details = null;
        List<ItemCreation> prlist = null;
        Map<String, Double> itm = new HashMap();
        Double recivedQty = 0.0;
        try {
            tx = session.beginTransaction();
//            query = session.createQuery("SELECT SUM(i.receivingQty)\n"
//                    + "FROM ReceivingProcess i where itemCode='" + itemCode + "'and poNo='" + poNo + "'\n"
//                    + "GROUP BY i.itemCode");
//            query = session.createQuery("SELECT unit,stockQty\n"
//                    + "FROM InventoryList  where itemCode='" + itemCode + "'and storeLocationName='" + poNo + "' and status!='Inactive'");
            query = session.createQuery("SELECT receivingQty,uom FROM ReceivingProcess  where itemCode='" + itemCode + "'and poNo='" + poNo + "' and deliveryDate='" + delDate + "'");

            details = query.list();

            query1 = session.createQuery("FROM UomMaster");
            prlist = query1.list();
            for (ItemCreation prlist1 : prlist) {
                if (prlist1.getBaseUom() != null) {
                    itm.put(prlist1.getBaseUom(), 1.0);
                }
                if (prlist1.getUom1() != null) {
                    itm.put(prlist1.getUom1(), prlist1.getConversionFactor1());

                }

                if (prlist1.getUom2() != null) {
                    itm.put(prlist1.getUom2(), prlist1.getConversionFactor2());
                }
                if (prlist1.getUom3() != null) {
                    itm.put(prlist1.getUom3(), prlist1.getConversionFactor3());
                }

            }

            if (details.isEmpty()) {
                recivedQty = 0.0;

            } else {

                for (Object[] detail : details) {
//
//                    if (itm.get(detail[0].toString()) != null) {
                    recivedQty = recivedQty + ((Double.parseDouble(detail[0].toString()) / itm.get(detail[1].toString()) * itm.get(purcUom)));
//                        System.out.println("ss" + itm.get(detail[0].toString()));
//                        System.out.println("ss" + itm.get(detail[1].toString()));
//                        System.out.println("ss" + itm.get(detail[0].toString()));
//                    }

                }

            }
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return recivedQty;

    }

    public List<ItemMaster> itemcategoryList() throws HibernateException {
        List<ItemMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from ItemCategory where  status!='Inactive'");

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

    @Override
    public void globalInactive(String instanceVariable, String className) {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update " + className + " set status='Inactive' where enquiriesNo='" + instanceVariable + "'";
            Query query = session.createQuery(hql);
            query.executeUpdate();
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

    public void globalActive(String instanceVariable, String className) {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update " + className + " set status='update0' where enquiriesNo='" + instanceVariable + "'";
            Query query = session.createQuery(hql);
            query.executeUpdate();
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
    
    public void purchaseitemdesAppSave(PurchaseItemDescription dis) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(dis);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }

    }

    public void vendorSave(List<VendorDetails> grid) throws HibernateException, SQLException {

        for (Iterator<VendorDetails> iterator = grid.iterator(); iterator.hasNext();) {
            VendorDetails test = (VendorDetails) iterator.next();
            assevendorSave(test);
        }
    }

    public void assevendorSave(VendorDetails transientInstance) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(transientInstance);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    public List<VendorDetails> vendorReqList(String vendorCode, String recordStatus)
            throws HibernateException, SQLException {
        List<VendorDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (vendorCode == null) {

                //   query = session.createQuery("from SupplierMaster where status!='Inactive' ORDER BY sno DESC");
                query = session.createSQLQuery("select distinct vendor_code, supplier_name,designation,mobile_no,email_id,business_address,business_name,s_no from  arete_tms.vendor_details\n"
                        + " where status!='Inactive'");
            } else {
                query = session.createQuery("from VendorDetails where vendorCode='" + vendorCode + "' and status!='Inactive'");
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
     public List<VendorDetails> customerReqList(String vendorCode, String recordStatus)
            throws HibernateException, SQLException {
        List<VendorDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (vendorCode == null) {

                //   query = session.createQuery("from SupplierMaster where status!='Inactive' ORDER BY sno DESC");
                query = session.createSQLQuery("select distinct vendor_code, supplier_name,designation,mobile_no,email_id,business_address,business_name from  arete_tms.vendor_details\n"
                        + " where status!='Inactive'");
            } else {
                query = session.createQuery("from VendorDetails where vendorCode='" + vendorCode + "' and status!='Inactive'");
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

    public void appPurchaseItemdesSave(List<PurchaseItemDescription> grid) {
        for (Iterator<PurchaseItemDescription> iterator = grid.iterator(); iterator.hasNext();) {
            PurchaseItemDescription test = (PurchaseItemDescription) iterator.next();
            purchaseitemdesAppSave(test);
        }
    }

    public Object billlocList(Object object, Object object0) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public List<VendorDetailsGrid> vendorDetailsGridList(Integer sno, String vendorCode) {
        List<VendorDetailsGrid> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (vendorCode != null) {
                query = session.createQuery("from VendorDetailsGrid where vendorCode='" + vendorCode + "' order by sno asc");
            } else {
                query = session.createQuery("from VendorDetailsGrid order by sno asc");
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

    public void newSaveVendorDetailsGrid(List<VendorDetailsGrid> grid) {
        for (Iterator<VendorDetailsGrid> iterator = grid.iterator(); iterator.hasNext();) {
            VendorDetailsGrid test = (VendorDetailsGrid) iterator.next();
            saveVendorDetailsGrid(grid);
        }
    }
    
    public void saveVendorDetailsGrid(List<VendorDetailsGrid> gridData) {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            Iterator<VendorDetailsGrid> itr = gridData.iterator();
            while (itr.hasNext()) {
                VendorDetailsGrid next = itr.next();
                session.saveOrUpdate(next);
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
    
    @SuppressWarnings("unchecked")
    public List<VendorDetailsGrid> vendordetailsId(String userId, String designation)
            throws HibernateException, SQLException {
        List<VendorDetailsGrid> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

                query = session.createQuery("from VendorDetailsGrid where designation='" + designation + "'");
         
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
    
    @SuppressWarnings("unchecked")
    public List<VendorDetailsGrid> vendordetailsGridList(String userId, String sNo)
            throws HibernateException, SQLException {
        List<VendorDetailsGrid> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sNo == null) {

                query = session.createQuery("from VendorDetailsGrid");  //where userId='" + userId + "'
         
            } else {
                query = session.createQuery("from VendorDetailsGrid where sNo='"+sNo+"'");
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
    
    public void vendordetailsGridListSave(List<VendorDetailsGrid> grid) {
        for (Iterator<VendorDetailsGrid> iterator = grid.iterator(); iterator.hasNext();) {
            VendorDetailsGrid test = (VendorDetailsGrid) iterator.next();
            newvendordetailsGridListSave(test);
        }
    }
    
    public void newvendordetailsGridListSave(VendorDetailsGrid dis) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(dis);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }
    
    @SuppressWarnings("unchecked")
    public List<VendorDetails> vendorDetailsList(String userId, String sNo)
            throws HibernateException, SQLException {
        List<VendorDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sNo == null) {

                query = session.createQuery("from VendorDetails");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from VendorDetails where sNo='" + sNo + "'");
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
    
    public void vendorDetailsListSave(List<VendorDetails> grid) {
        for (Iterator<VendorDetails> iterator = grid.iterator(); iterator.hasNext();) {
            VendorDetails test = (VendorDetails) iterator.next();
            newvendorDetailsListSave(test);
        }
    }
    
    public void newvendorDetailsListSave(VendorDetails dis) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(dis);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }

    }
}
