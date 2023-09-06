/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.dao;

import java.math.BigInteger;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import tenant.classes.AssetDetails;
import tenant.classes.FollowUp;
import tenant.classes.RentNotification;

/**
 *
 * @author EBS02
 */
public class DashboardDAO extends HibernateDaoSupport {

    //--------------------------CRM------------------------------   
    public List<FollowUp> followUp(String rstatus, String orgId) {
        List<FollowUp> list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if (rstatus == null) {
                list = session.createSQLQuery("select count(DISTINCT LEAD_CODE) FROM lead where STATUS!='Inactive' ").list();
            } else {
//                list = session.createSQLQuery("select count(DISTINCT LEAD_CODE) FROM FOLLOWUP_HISTORY where follow_up BETWEEN trunc(SYSDATE) AND TRUNC(SYSDATE+1)").list();
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
        return list;
    }

    public List<String> Customer(String rstatus, String orgId) {
        List<String> list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if ("rentquote".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT Tenant_QuoteCode) FROM rentquote where Record_Status!='Rejected'").list();
            } else if ("complaint".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT Complaint_Code) FROM complaints where org_Id='" + orgId + "' and Attribute4='CFO Approved'").list();
            } else if ("feedback".equals(rstatus)) {
                list = session.createSQLQuery("select count(*) FROM customer_feedback where ORG_ID='" + orgId + "'").list();
            } else if ("campaign".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT campaign_Code) FROM campaign where org_Id='" + orgId + "'").list();

            } else if ("vacate".equals(rstatus)) {
                list = session.createSQLQuery("select count(*) from vacating where org_Id='" + orgId + "'").list();
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
        return list;
    }

//    public List<FollowUp> crmCount(String rstatus, String orgId) {
//        List<FollowUp> list = null;
//        Transaction tx = null;
//        Query query = null;
//        Session session = getSessionFactory().openSession();
//        try {
//            tx = session.beginTransaction();
//            if (rstatus == null) {
//                list = session.createSQLQuery("select to_char(LASTMODIFIED_DATE, 'YYYY-MM'), COUNT(*) from lead group by to_char(LASTMODIFIED_DATE, 'YYYY-MM') order by 1").list();
//            } else {
//                list = session.createSQLQuery("select count(*) FROM FOLLOWUP_HISTORY where follow_up BETWEEN trunc(SYSDATE) AND TRUNC(SYSDATE+1)").list();
//            }
//            tx.commit();
//        } catch (HibernateException e) {
//            if (tx != null) {
//                tx.rollback();
//            }
//            e.printStackTrace();
//        } finally {
//            session.clear();
//            session.close();
//        }
//        return list;
//    }
//------------------------------------Sales Management----------------------------------    
    public List<String> tenantManagement(String rstatus, String orgId) {
        List<String> list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if ("tenants".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT tenant_id) FROM tenant_details where appstatus!='Rejected'").list();
            } else if ("service".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT service_request_no) FROM serivce_request where recordstatus!='Rejected'").list();
            } else if ("mati".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT mi_no) FROM material_issue where appstatus='Approved'").list();
            } else if ("rentdue".equals(rstatus)) {
                list = session.createSQLQuery("select count(attribute1) FROM bill_payment where attribute1='PDC'").list();
            } else if ("servdue".equals(rstatus)) {
                list = session.createSQLQuery("select sum(DISTINCT dues) FROM bill_payment where receipt_type='Service'").list();
            } else if ("advdue".equals(rstatus)) {
                list = session.createSQLQuery("select sum(DISTINCT dues) FROM bill_payment where receipt_type='Advance'").list();
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
        return list;
    }

//------------------------------------Purchase Management----------------------------------     
//    public List<String> PurchaseManagement(String rstatus, String orgId) {
//        List<String> list = null;
//        Transaction tx = null;
//        Query query = null;
//        Session session = getSessionFactory().openSession();
//        try {
//            tx = session.beginTransaction();
//            if ("nsupplier".equals(rstatus)) {
//                list = session.createSQLQuery("select count(*) FROM SUPPLIER_DETAILS where RECORD_STATUS='New' and STATUS!='Inactive' and ORG_ID='" + orgId + "'").list();
//            } else if ("asupplier".equals(rstatus)) {
//                list = session.createSQLQuery("select count(*) FROM SUPPLIER_DETAILS where RECORD_STATUS='Approved' and STATUS!='Inactive' and ORG_ID='" + orgId + "'").list();
//            } else if ("prequest".equals(rstatus)) {
//                list = session.createSQLQuery("select  COUNT(DISTINCT PR_NO) FROM PURCHASE_REQUEST where RECORD_STATUS!='Approved' and STATUS!='Inactive' and ORG_ID='" + orgId + "'").list();
//            } else if ("enquiry".equals(rstatus)) {
//                list = session.createSQLQuery("select count(DISTINCT ENQUIRIES_NO) FROM SUPPLIER_ENQUIRY where STATUS!='Inactive' and ORG_ID='" + orgId + "'").list();
//            } else if ("quote".equals(rstatus)) {
//                list = session.createSQLQuery("select count(DISTINCT SUPPLIER_NAME) FROM SUPPLIER_QUOTATION where RECORD_STATUS='Quotation Approved' and STATUS!='Inactive'").list();
//            } else if ("purchase".equals(rstatus)) {
//                list = session.createSQLQuery("select  COUNT(DISTINCT PURCHASE_ORDER_NO)FROM PURCHASE_ORDER where RECORD_STATUS='Approved' and STATUS!='Inactive' and ORG_ID='" + orgId + "'").list();
//            }
//            tx.commit();
//        } catch (HibernateException e) {
//            if (tx != null) {
//                tx.rollback();
//            }
//            e.printStackTrace();
//        } finally {
//            session.clear();
//            session.close();
//        }
//        return list;
//    }
    //------------------------------------Inventory Management----------------------------------     
//    public List<String> InventoryManagement(String rstatus, String orgId, String storeName) {
//        List<String> list = null;
//        Transaction tx = null;
//        Query query = null;
//        Session session = getSessionFactory().openSession();
//        try {
//            tx = session.beginTransaction();
//            if ("preceipt".equals(rstatus)) {
//                list = session.createSQLQuery("select count(DISTINCT PURCHASE_ORDER_NO) FROM PURCHASE_ORDER where SHIP_TO_LOCATION='" + storeName + "' and RECORD_STATUS='Approved' and APPROVAL_STATUS!='Fully Receipt' and APPROVAL_STATUS!='Cancelled MR' and STATUS!='Inactive'").list();
//            } else if ("inspection".equals(rstatus)) {
//                list = session.createSQLQuery("select count(DISTINCT RECEIPT_NO) FROM RECEIVING_PROCESS where RECORD_STATUS='Received' and STATUS!='Inactive' and DELIVERY_LOCATION='" + storeName + "'").list();
//            } else if ("prequest".equals(rstatus)) {
//                list = session.createSQLQuery("select count(DISTINCT STORE_REQUEST_NO) FROM STORE_REQUEST where STORE_LOCATION_NAME='" + storeName + "' and RECORD_STATUS='Requested' and ISSUE_STATUS!='Fully Issued' and STATUS!='Inactive'").list();
//            } else if ("tdisposal".equals(rstatus)) {
//                list = session.createSQLQuery("select count(DISTINCT DISPOSAL_NOTE_NO) FROM MATERIAL_DISPOSAL_NOTE where RECORD_STATUS='Level3 Approval' and STATUS!='Inactive' and STORE_LOCATION_NAME='" + storeName + "'").list();
//            } else if ("pissue".equals(rstatus)) {
//                list = session.createSQLQuery("select count(DISTINCT STORE_REQUEST_NO) FROM STORE_REQUEST where RECORD_STATUS='Approved' and ISSUE_STATUS!='Fully Issued' and  status!='Inactive' and STORE_LOCATION_NAME='" + storeName + "'").list();
//            } else if ("stransfer".equals(rstatus)) {
//                list = session.createSQLQuery("select count(DISTINCT TRANSFER_NOTE_NO) FROM INTER_UNIT_TRANSFER_NOTE where RECORD_STATUS='Requested' and STATUS!='Inactive' and FROM_STORE_LOCATION='" + storeName + "'").list();
//            }
//            tx.commit();
//        } catch (HibernateException e) {
//            if (tx != null) {
//                tx.rollback();
//            }
//            e.printStackTrace();
//        } finally {
//            session.clear();
//            session.close();
//        }
//        return list;
//    }
    //------------------------------------Menu Management----------------------------------     
    public List<String> AssetManagement(String rstatus, String orgId) {
        List<String> list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if ("assets".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT asset_code) FROM arete_tms.asset_details").list();
            } else if ("subassets".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT sub_asset_code) FROM arete_tms.sub_asset_details").list();
            } else if ("accessories".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT ITEM_CODE) FROM arete_tms.item_master").list();
            } else if ("vacant".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT sub_asset_code) FROM arete_tms.sub_asset_details where record_status='Vacant'").list();
            } else if ("req".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT REQUISITION_NO) FROM arete_tms.purch_requisition").list();
            } else if ("poprder".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT pr_no) FROM arete_tms.purchase_order").list();
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
        return list;
    }

    //------------------------------------HRMS----------------------------------     
    public List<String> contract(String rstatus, String orgId) {
        List<String> list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if ("cont".equals(rstatus)) {
                list = session.createSQLQuery("select count(*) FROM contract_creation where STATUS!='Inactive' and STATUS!='Expired' and ORG_ID='" + orgId + "'").list();
            } else if ("insurance".equals(rstatus)) {
                list = session.createSQLQuery("select count(*) FROM insurance_details").list();
            } else if ("expcnt".equals(rstatus)) {
                list = session.createSQLQuery("select count(*) FROM contract_creation where STATUS='Expired' and ORG_ID='" + orgId + "'").list();
            } else if ("rejcnt".equals(rstatus)) {
                list = session.createSQLQuery("select count(*) FROM contract_creation where RECORD_STATUS='REJECTED' and ORG_ID='" + orgId + "'").list();
            } else if ("renew".equals(rstatus)) {
                list = session.createSQLQuery("select count(*) FROM contract_creation where  RECORD_STATUS='CFO APPROVED' and ORG_ID='" + orgId + "'").list();
            } else if ("tobapprove".equals(rstatus)) {
                list = session.createSQLQuery("select count(*) FROM contract_creation where RECORD_STATUS='Contract Created' and STATUS!='Inactive' and ORG_ID='" + orgId + "'").list();
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
        return list;
    }

    public Object AssetManagement1(String rstatus, String orgId) {
        Object list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if ("assets".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT asset_code) FROM asset_details").uniqueResult();
            } else if ("subassets".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT sub_asset_code) FROM sub_asset_details").uniqueResult();
            } else if ("accessories".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT ITEM_CODE) FROM item_master").uniqueResult();
            } else if ("vacant".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT sub_asset_code) FROM sub_asset_details where record_status='Vacant'").uniqueResult();
            } else if ("req".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT REQUISITION_NO) FROM purch_requisition").uniqueResult();
            } else if ("poprder".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT pr_no) FROM purchase_order").uniqueResult();
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
        return list;
    }

    public Object contract1(String rstatus, String orgId) {
        Object list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if ("cont".equals(rstatus)) {
                list = session.createSQLQuery("select count(*) FROM contract_creation where STATUS!='Inactive' and STATUS!='Expired' and ORG_ID='" + orgId + "'").uniqueResult();
            } else if ("insurance".equals(rstatus)) {
                list = session.createSQLQuery("select count(*) FROM insurance_details").uniqueResult();
            } else if ("expcnt".equals(rstatus)) {
                list = session.createSQLQuery("select count(*) FROM contract_creation where STATUS='Expired' and ORG_ID='" + orgId + "'").uniqueResult();
            } else if ("rejcnt".equals(rstatus)) {
                list = session.createSQLQuery("select count(*) FROM contract_creation where RECORD_STATUS='REJECTED' and ORG_ID='" + orgId + "'").uniqueResult();
            } else if ("renew".equals(rstatus)) {
                list = session.createSQLQuery("select count(*) FROM contract_creation where  RECORD_STATUS='CFO APPROVED' and ORG_ID='" + orgId + "'").uniqueResult();
            } else if ("tobapprove".equals(rstatus)) {
                list = session.createSQLQuery("select count(*) FROM contract_creation where RECORD_STATUS='Contract Created' and STATUS!='Inactive' and ORG_ID='" + orgId + "'").uniqueResult();
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
        return list;
    }

    public Object Customer1(String rstatus, String orgId) {
        Object list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if ("rentquote".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT Tenant_QuoteCode) FROM rentquote where Record_Status!='Rejected'").uniqueResult();
            } else if ("complaint".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT Complaint_Code) FROM complaints where org_Id='" + orgId + "' and Attribute4='CFO Approved'").uniqueResult();
            } else if ("feedback".equals(rstatus)) {
                list = session.createSQLQuery("select count(*) FROM customer_feedback where ORG_ID='" + orgId + "'").uniqueResult();
            } else if ("campaign".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT campaign_Code) FROM campaign where org_Id='" + orgId + "'").uniqueResult();

            } else if ("vacate".equals(rstatus)) {
                list = session.createSQLQuery("select count(*) from vacating where org_Id='" + orgId + "'").uniqueResult();
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
        return list;
    }

    public Object tenantManagement1(String rstatus, String orgId) {
        Object list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if ("tenants".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT tenant_id) FROM tenant_details where appstatus!='Rejected'").uniqueResult();
            } else if ("service".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT service_request_no) FROM serivce_request where recordstatus!='Rejected'").uniqueResult();
            } else if ("mati".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT mi_no) FROM material_issue where appstatus='Approved'").uniqueResult();
            } else if ("rentdue".equals(rstatus)) {
                list = session.createSQLQuery("select count(attribute1) FROM bill_payment where attribute1='PDC'").uniqueResult();
            } else if ("servdue".equals(rstatus)) {
                list = session.createSQLQuery("select COALESCE(sum(DISTINCT dues),0) FROM bill_payment where receipt_type='Service'").uniqueResult();
            } else if ("advdue".equals(rstatus)) {
                list = session.createSQLQuery("select COALESCE(sum(DISTINCT dues),0) FROM bill_payment where receipt_type='Advance'").uniqueResult();
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
        return list;
    }

    public Object followUp1(String rstatus, String orgId) {
        Object list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if (rstatus == null) {
                list = session.createSQLQuery("select count(DISTINCT LEAD_CODE) FROM lead where STATUS!='Inactive' ").uniqueResult();
            } else {
//                list = session.createSQLQuery("select count(DISTINCT LEAD_CODE) FROM FOLLOWUP_HISTORY where follow_up BETWEEN trunc(SYSDATE) AND TRUNC(SYSDATE+1)").list();
                list = session.createSQLQuery("select count(DISTINCT LEAD_CODE) FROM lead where STATUS!='Inactive' ").uniqueResult();
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
        return list;
    }

    public List<String> AssetManagementN(String rstatus, String orgId) {
        List<String> list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if ("assets".equals(rstatus)) {
                query = session.createSQLQuery("select * FROM asset_details");
            } else if ("subassets".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT sub_asset_code) FROM sub_asset_details").list();
            } else if ("accessories".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT ITEM_CODE) FROM item_master").list();
            } else if ("vacant".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT sub_asset_code) FROM sub_asset_details where record_status='Vacant'").list();
            } else if ("req".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT REQUISITION_NO) FROM purch_requisition").list();
            } else if ("poprder".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT pr_no) FROM purchase_order").list();
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
        return list;
    }

    public List<String> AssetManagementN1(String rstatus, String orgId) {
        List<String> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            //if (SNo == null) {
            if ("assets".equals(rstatus)) {
                query = session.createQuery("from ItemMaster");// where  status!='Inactive' order by storeName");
            } else if ("accessories".equals(rstatus)) {
                query = session.createQuery("from ItemMaster");// where  status!='Inactive' order by storeName");                
            } else if ("vacant".equals(rstatus)) {
                query = session.createQuery("from SubAssetDetails where record_status='Vacant'");
            } else if ("req".equals(rstatus)) {
                query = session.createQuery("from  PurchaseRequest");
            } else if ("poprder".equals(rstatus)) {
                query = session.createQuery("from PurchaseOrder");
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

    public List<String> tenantManagementN(String rstatus, String orgId, String useName, String userId) {
        List<String> list = null;
        Transaction tx = null;
        Query query = null;
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        java.util.Date date = new java.util.Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String strDate = formatter.format(date);
        //Date date = new Date();
        //Date today =null;
        // today = (Date) dateFormat.parse(date);
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();

            if ("tenants".equals(rstatus)) {
                if ("admin".equals(useName)) {
                    list = session.createSQLQuery("select count(DISTINCT tenant_id) FROM arete_tms.tenant_details where appstatus='Submitted' OR appstatus='GFC Approved'").list();
                } else if ("CFO".equals(useName)) {
                    list = session.createSQLQuery("select count(DISTINCT tenant_id) FROM arete_tms.tenant_details where appstatus='GFC Approved' ").list();
                } else if ("GFC".equals(useName)) {
                    list = session.createSQLQuery("select count(DISTINCT tenant_id) FROM arete_tms.tenant_details where appstatus='Submitted' ").list();
                }
            } else if ("pdc1".equals(rstatus)) {
                if ("admin".equals(useName)) {
                    list = session.createSQLQuery("select count(DISTINCT s_no) FROM arete_tms.bill_payment where dated>='" + strDate + "'and  status!='Inactive' and attribute1='PDC'").list();
                }
            } else if ("contract".equals(rstatus)) {
                if ("admin".equals(useName)) {
                    list = session.createSQLQuery("select count(DISTINCT SNO) FROM arete_tms.contract_creation where CONT_REVIEW_DATE>='" + strDate + "'and  status!='Inactive'").list();
                }
            } else if ("vacate".equals(rstatus)) {
                if ("admin".equals(useName)) {
                    list = session.createSQLQuery("select count(*) from arete_tms.vacating where Vacating_FillDate>='" + strDate + "'and  Status!='Inactive'").list();
                }
            } else if ("poprder".equals(rstatus)) {
                if ("admin".equals(useName)) {
                    list = session.createSQLQuery("select count(DISTINCT sno) FROM arete_tms.purchase_order where record_status='PO Created' OR record_status='PM Approved'").list();
                } else if ("Purchase Manager".equals(useName)) {
                    list = session.createSQLQuery("select count(DISTINCT sno) FROM arete_tms.purchase_order where record_status='PO Created'").list();
                } else if ("Finance Manager".equals(useName)) {
                    list = session.createSQLQuery("select count(DISTINCT sno) FROM arete_tms.purchase_order where record_status='PM Approved'").list();
                }
            } else if ("tenant".equals(rstatus)) {
                if ("Tenant".equals(useName)) {
                    list = session.createSQLQuery("select count(DISTINCT tenant_id) FROM arete_tms.portal_tenant_detail where tenant_id = '" + userId + "' and appstatus='Submitted' OR appstatus='GFC Approved'").list();
                } else if ("admin".equals(useName)) {
                    list = new ArrayList<String>();
                    list.add("0");
                }
            } else if ("service".equals(rstatus)) {
                if ("Tenant".equals(useName)) {
                    list = session.createSQLQuery("select count(DISTINCT user_id) FROM arete_tms.serivce_request where user_id = '" + userId + "' and recordstatus='Service Requested' OR recordstatus='GFC Approved'").list();
                } else if ("admin".equals(useName)) {
                    list = new ArrayList<String>();
                    list.add("0");
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
        return list;
    }

    public List<String> utilityManagementN(String rstatus, String orgId, String useName, String tenantcode1) {
        List<String> list = null;
        Transaction tx = null;
        Query query = null;
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        java.util.Date date = new java.util.Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String strDate = formatter.format(date);
        //Date date = new Date();
        //Date today =null;
        // today = (Date) dateFormat.parse(date);
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();

            if ("utility".equals(rstatus)) {
                if ("Tenant".equals(useName)) {
                    list = session.createSQLQuery("select count(DISTINCT tenant_id) FROM arete_tms.portal_tenant_detail where tenant_code = '" + tenantcode1 + "' and appstatus='Submitted' OR appstatus='GFC Approved'").list();
                } else if ("admin".equals(useName)) {
                    list = new ArrayList<String>();
                    list.add("0");
                }
            } else if ("pdc".equals(rstatus)) {
                if ("Tenant".equals(useName)) {
                    list = session.createSQLQuery("SELECT  (TO_DAYS(dated)-TO_DAYS(CURDATE()) )as No_of_Day FROM arete_tms.bill_payment where  tenant_code = '" + tenantcode1 + "' and status!='Inactive' and attribute1='PDC'").list();
                } else if ("admin".equals(useName)) {
                    list = new ArrayList<String>();
                    list.add("0");
                }
            } else if ("cdc".equals(rstatus)) {
                if ("Tenant".equals(useName)) {
                    list = session.createSQLQuery("select count(DISTINCT s_no) FROM arete_tms.bill_payment where dated>='" + strDate + "' and tenant_code = '" + tenantcode1 + "' and status!='Inactive' and attribute1='CDC'").list();
                } else if ("admin".equals(useName)) {
                    list = new ArrayList<String>();
                    list.add("0");
                }
            } else if ("pdcDues".equals(rstatus)) {
                if ("Tenant".equals(useName)) {
                    list = session.createSQLQuery("select count(DISTINCT s_no) FROM arete_tms.bill_payment where dated>='" + strDate + "' and status!='Inactive' and tenant_code = '" + tenantcode1 + "' and dues != 0 and attribute1='PDC'").list();
                } else if ("admin".equals(useName)) {
                    list = new ArrayList<String>();
                    list.add("0");
                }
            } else if ("cdcDues".equals(rstatus)) {
                if ("Tenant".equals(useName)) {
                    list = session.createSQLQuery("select count(DISTINCT s_no) FROM arete_tms.bill_payment where dated>='" + strDate + "' and status!='Inactive' and tenant_code = '" + tenantcode1 + "' and dues != 0 and attribute1='CDC'").list();
                } else if ("admin".equals(useName)) {
                    list = new ArrayList<String>();
                    list.add("0");
                }
            } else if ("cashdues".equals(rstatus)) {
                if ("Tenant".equals(useName)) {
                    list = session.createSQLQuery("select count(DISTINCT s_no) FROM arete_tms.bill_payment where dated>='" + strDate + "' and tenant_code = '" + tenantcode1 + "' and status!='Inactive' and dues != 0 and mode_of_payment = 'Cash'").list();
                } else if ("admin".equals(useName)) {
                    list = new ArrayList<String>();
                    list.add("0");
                }
            } else if ("cash".equals(rstatus)) {
                if ("Tenant".equals(useName)) {
                    list = session.createSQLQuery("select count(DISTINCT s_no) FROM arete_tms.bill_payment where status!='Inactive' and dated>='" + strDate + "' and tenant_code = '" + tenantcode1 + "' and mode_of_payment = 'Cash'").list();
                } else if ("admin".equals(useName)) {
                    list = new ArrayList<String>();
                    list.add("0");
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
        return list;
    }

    public List<String> PurchaseManagement(String rstatus, String orgId) {
        List<String> list = null;
        Transaction tx = null;
        Query query = null;
        // String uid = "";
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();

            if ("nsupplier".equals(rstatus)) {
                list = session.createSQLQuery("select count(*) FROM arete_tms.supplier_master where status!='Inactive' and org_id='" + orgId + "'").list();
            } else if ("pppo".equals(rstatus)) {
                list = session.createSQLQuery("select  COUNT(DISTINCT purchase_order_no)FROM arete_tms.purchase_order where record_status!='Approved' and status!='Inactive' and org_id='" + orgId + "'").list();
            } else if ("prequest".equals(rstatus)) {
                list = session.createSQLQuery("select  COUNT(DISTINCT pr_no) FROM arete_tms.purchase_request where record_status!='Approved' and status!='Inactive' and org_id='" + orgId + "'").list();
            } else if ("enquiry".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT enquiries_no) FROM arete_tms.supplier_enquiry where record_status!='Enquiry Created' and status!='Inactive' and org_id='" + orgId + "'").list();
            } else if ("quote".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT supplier_name) FROM arete_tms.supplier_quotation where record_status='Quotation Approved' and status!='Inactive'").list();
            } else if ("purchase".equals(rstatus)) {
                list = session.createSQLQuery("select  COUNT(DISTINCT purchase_order_no)FROM arete_tms.purchase_order where record_status='Approved' and status!='Inactive' and org_id='" + orgId + "'").list();
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
        return list;
    }

    public List<String> PurchaseManagementN(String rstatus, String orgId, String userId) {
        List<String> list = null;
        Transaction tx = null;
        Query query = null;
        // String uid = "";
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();

            if ("nsupplier".equals(rstatus)) {
                list = session.createSQLQuery("select count(*) FROM arete_tms.SUPPLIER_DETAILS where RECORD_STATUS='New' and STATUS!='Inactive' and ORG_ID='" + orgId + "'").list();
            } else if ("asupplier".equals(rstatus)) {
                list = session.createSQLQuery("select count(*) FROM arete_tms.SUPPLIER_DETAILS where RECORD_STATUS='Approved' and STATUS!='Inactive' and ORG_ID='" + orgId + "'").list();
            } else if ("prequest".equals(rstatus)) {
                //list = session.createSQLQuery("select  COUNT(DISTINCT PR_NO) FROM PURCHASE_REQUEST where " + uid + " RECORD_STATUS!='Approved' and STATUS!='Inactive' and ORG_ID='" + orgId + "'").list();
            } else if ("enquiry".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT ENQUIRIES_NO) FROM arete_tms.SUPPLIER_ENQUIRY where STATUS!='Inactive' and ORG_ID='" + orgId + "'").list();
            } else if ("quote".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT SUPPLIER_NAME) FROM arete_tms.SUPPLIER_QUOTATION where RECORD_STATUS='Quotation Approved' and STATUS!='Inactive'").list();
            } else if ("purchase".equals(rstatus)) {
                list = session.createSQLQuery("select  COUNT(DISTINCT PURCHASE_ORDER_NO)FROM arete_tms.PURCHASE_ORDER where RECORD_STATUS='Approved' and STATUS!='Inactive' and ORG_ID='" + orgId + "'").list();
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
        return list;
    }

    public List<String> InventoryManagement(String rstatus, String orgId, String storeName) {
        List<String> list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if ("preceipt".equals(rstatus)) {
                list = session.createSQLQuery("SELECT COUNT(sno) FROM arete_tms.purchase_order where record_status!='PM Approved' and record_status!='FM Approved' and record_status='Approved' and approval_status='Initial' and approval_status!='Fully Receipt'").list();
            } else if ("inspection".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT receipt_no) FROM arete_tms.receiving_process where record_status='Received' and status!='Inactive' ").list();
            } else if ("Qinspection".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT material_receipt_no) FROM arete_tms.quality_inspection where record_status='Initial' and status!='Inactive'").list();
            } else if ("tgrn".equals(rstatus)) {
                list = session.createSQLQuery("select count(DISTINCT material_receipt_no) FROM arete_tms.good_receipt_note where status!='Inactive'").list();
            } else if ("invlist".equals(rstatus)) {
                list = session.createSQLQuery("select sum(stock_qty) FROM arete_tms.inventorylist where status!='Inactive' ").list();
            } else if ("mreturn".equals(rstatus)) {
                list = session.createSQLQuery("select sum(rejected_qty) FROM arete_tms.material_return where return_status='Material Returned' and status!='Inactive'").list();
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
        return list;
    }

    public List<String> AssetManagement1(String rstatus, String orgId, String dt, String frdate, String todate) {
        List<String> list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if (frdate != "frdate" && todate != "todate") {
                if ("assets".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT asset_code) FROM arete_tms.asset_details where status!='Inactive' \n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("subassets".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT sub_asset_code) FROM arete_tms.sub_asset_details where status!='Inactive' \n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("accessories".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT ITEM_CODE) FROM arete_tms.item_master where STATUS!='Inactive' \n"
                            + "and LASTMODIFIED_DATE >='" + frdate + "'\n"
                            + "and LASTMODIFIED_DATE <='" + todate + "'").list();
                } else if ("vacant".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT sub_asset_code) FROM arete_tms.sub_asset_details where record_status='Vacant'\n"
                            + "and status!='Inactive' \n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("req".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT pr_no) FROM arete_tms.purchase_request where status!='Inactive' \n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("propNames".equals(rstatus)) {
                    list = session.createSQLQuery("select DISTINCT asset_name FROM arete_tms.asset_details where status!='Inactive'\n"
                            + "and LASTMODIFIED_DATE >='" + frdate + "'\n"
                            + "and LASTMODIFIED_DATE <='" + todate + "'").list();
                } else if ("poprder".equals(rstatus)) {
                    Date fdate = null;
                    Date tdate = null;
                    String fromdate = "";
                    String todates = "";
                    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    fdate = formatter.parse(frdate);
                    tdate = formatter.parse(todate);
                    fromdate = sdf.format(fdate);
                    todates = sdf.format(tdate);
                    list = session.createSQLQuery("select count(DISTINCT purchase_order_no) FROM arete_tms.purchase_order\n"
                            + "where DATE(lastmodified_date) >='" + fromdate + "'\n"
                            + "and DATE(lastmodified_date) <='" + todates + "'").list();
                }

            } else {
                if ("assets".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT asset_code) FROM arete_tms.asset_details where status!='Inactive'").list();
                           
                } else if ("subassets".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT sub_asset_code) FROM arete_tms.sub_asset_details where status!='Inactive'").list();
                         
                } else if ("accessories".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT ITEM_CODE) FROM arete_tms.item_master where status!='Inactive'").list();
                       
                } else if ("vacant".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT sub_asset_code) FROM arete_tms.sub_asset_details where record_status='Vacant' \n"
                            + "and status!='Inactive'").list();
                } else if ("req".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT pr_no) FROM arete_tms.purchase_request where status!='Inactive'").list();
                       
                } else if ("poprder".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT purchase_order_no) FROM arete_tms.purchase_order").list();
                           
                } else if ("propNames".equals(rstatus)) {
                    list = session.createSQLQuery("select DISTINCT asset_name FROM arete_tms.asset_details").list();
                           
                }
            }

            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } catch (ParseException ex) {
            Logger.getLogger(DashboardDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            session.clear();
            session.close();
        }
        return list;
    }

    public List<String> PurchaseManagement1(String rstatus, String orgId, String dt, String frdate, String todate) {
        List<String> list = null;
        Transaction tx = null;
        Query query = null;
        // String uid = "";
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if (frdate != "frdate" && todate != "todate") {
                if ("nsupplier".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.supplier_master where status!='Inactive' and org_id='" + orgId + "' \n"
                            + "and LASTMODIFIED_DATE >='" + frdate + "'\n"
                            + "and LASTMODIFIED_DATE <='" + todate + "'").list();
                } else if ("pppo".equals(rstatus)) {
                    list = session.createSQLQuery("select  COUNT(DISTINCT purchase_order_no)FROM arete_tms.purchase_order where record_status!='Approved' \n"
                            + "and status!='Inactive' and record_status!='Rejected'and org_id='" + orgId + "' and DATE(lastmodified_date) >='" + frdate + "'\n"
                            + "and DATE(lastmodified_date) <='" + todate + "'").list();
                } else if ("prequest".equals(rstatus)) {
                    list = session.createSQLQuery("select  COUNT(DISTINCT pr_no) FROM arete_tms.purchase_request where record_status!='Approved' and record_status!='Rejected' and record_status!='PO Created' and status!='Inactive' and org_id='" + orgId + "' \n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("enquiry".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT enquiries_no) FROM arete_tms.supplier_enquiry where org_id='" + orgId + "' \n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("quote".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT supplier_name) FROM arete_tms.supplier_quotation where record_status='Quotation Approved' and status!='Inactive' \n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("purchase".equals(rstatus)) {
                    list = session.createSQLQuery("select  COUNT(DISTINCT purchase_order_no)FROM arete_tms.purchase_order where record_status='Approved'\n"
                            + "and status!='Inactive' and org_id='" + orgId + "' and DATE(lastmodified_date) >='" + frdate + "'\n"
                            + "and DATE(lastmodified_date) <='" + todate + "'").list();
                }
            } else {
                if ("nsupplier".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.supplier_master where status!='Inactive' and org_id='" + orgId + "' and status!='Inactive'").list();
                         
                } else if ("pppo".equals(rstatus)) {
                    list = session.createSQLQuery("select  COUNT(DISTINCT purchase_order_no)FROM arete_tms.purchase_order where record_status!='Approved' and record_status!='Rejected' \n"
                            + "and status!='Inactive' and org_id='" + orgId + "'").list();
                } else if ("prequest".equals(rstatus)) {
                    list = session.createSQLQuery("select  COUNT(DISTINCT pr_no) FROM arete_tms.purchase_request where record_status!='Approved' and record_status!='Rejected' and record_status!='PO Created' and org_id='" + orgId + "' and status!='Inactive'").list();
                           
                } else if ("enquiry".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT enquiries_no) FROM arete_tms.supplier_enquiry where record_status!='Enquiry Created' and status!='Inactive' \n"
                            + "and org_id='1'").list();
                } else if ("quote".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT supplier_name) FROM arete_tms.supplier_quotation where record_status='Quotation Approved' and status!='Inactive'").list();
                          
                } else if ("purchase".equals(rstatus)) {
                    list = session.createSQLQuery("select  COUNT(DISTINCT purchase_order_no)FROM arete_tms.purchase_order where record_status='Approved'\n"
                            + "and status!='Inactive' and org_id='" + orgId + "'").list();
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
        return list;
    }

    public List<String> InventoryManagement1(String rstatus, String orgId, String dt, String frdate, String todate) {
        List<String> list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if (frdate != "frdate" && todate != "todate") {
                if ("preceipt".equals(rstatus)) {
                    Date fdate = null;
                    Date tdate = null;
                    String fromdate = "";
                    String todates = "";
                    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    fdate = formatter.parse(frdate);
                    tdate = formatter.parse(todate);
                    fromdate = sdf.format(fdate);
                    todates = sdf.format(tdate);
                    list = session.createSQLQuery("SELECT COUNT(sno) FROM arete_tms.purchase_order where record_status!='PM Approved' \n"
                            + "and record_status!='FM Approved' and record_status='Approved' and approval_status='Initial' \n"
                            + "and approval_status!='Fully Receipt'\n"
                            + "and DATE(lastmodified_date) >='" + fromdate + "'\n"
                            + "and DATE(lastmodified_date) <='" + todates + "'").list();
                } else if ("inspection".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT receipt_no) FROM arete_tms.receiving_process where record_status='Received' and status!='Inactive'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("Qinspection".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT material_receipt_no) FROM arete_tms.quality_inspection where record_status='Initial' \n"
                            + "and status!='Inactive' and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("tgrn".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT material_receipt_no) FROM arete_tms.good_receipt_note where status!='Inactive'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("invlist".equals(rstatus)) {
                    list = session.createSQLQuery("select sum(stock_qty) FROM arete_tms.inventorylist where status!='Inactive'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("mreturn".equals(rstatus)) {
//                    list = session.createSQLQuery("select sum(rejected_qty) FROM material_return where return_status='Material Returned' and status!='Inactive'\n"
//                            + "and lastmodified_date >='" + frdate + "'\n"
//                            + "and lastmodified_date <='" + todate + "'").list();
                    list = session.createSQLQuery("select sum(rejected_qty) FROM arete_tms.material_return where return_status='CFO Approved' and status!='Inactive'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                }
            } else {
                if ("preceipt".equals(rstatus)) {
                    list = session.createSQLQuery("SELECT COUNT(sno) FROM arete_tms.purchase_order where record_status!='PM Approved' \n"
                            + "and record_status!='FM Approved' and record_status='Approved' and approval_status='Initial' \n"
                            + "and approval_status!='Fully Receipt'").list();
                } else if ("inspection".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT receipt_no) FROM arete_tms.receiving_process where record_status='Received' \n"
                            + "and status!='Inactive'").list();
                           
                } else if ("Qinspection".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT material_receipt_no) FROM arete_tms.quality_inspection where record_status='Initial' \n"
                            + "and status!='Inactive'").list();
                } else if ("tgrn".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT material_receipt_no) FROM arete_tms.good_receipt_note where status!='Inactive'").list();
                            
                } else if ("invlist".equals(rstatus)) {
                    list = session.createSQLQuery("select sum(stock_qty) FROM arete_tms.inventorylist where status!='Inactive'").list();
                          
                } else if ("mreturn".equals(rstatus)) {
//                    list = session.createSQLQuery("select sum(rejected_qty) FROM material_return where return_status='Material Returned' and status!='Inactive'\n"
//                            + "and DATE(lastmodified_date) ='" + dt + "'").list();
                    list = session.createSQLQuery("select sum(rejected_qty) FROM arete_tms.material_return where return_status='CFO Approved' and status!='Inactive'").list();
                        
                }
            }
            ///newly added by lakshmi for null in sum()
            if (list.toArray()[0] == null) {
                list.set(0, "0");
                //list.toArray()[0]="0";
            }

            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } catch (ParseException ex) {
            Logger.getLogger(DashboardDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            session.clear();
            session.close();
        }
        return list;
    }

    public List<String> contractDas(String rstatus, String orgId, String dt, String frdate, String todate) {
        List<String> list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if (frdate != "frdate" && todate != "todate") {
                if ("cont".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.contract_creation where STATUS!='Inactive'\n"
                            + "and ORG_ID='" + orgId + "'\n"
                            + "and LASTMODIFIED_DATE >='" + frdate + "'\n"
                            + "and LASTMODIFIED_DATE <='" + todate + "'").list();
                } else if ("insurance".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.insurance_details where LASTMODIFIED_DATE >='" + frdate + "'\n"
                            + "and LASTMODIFIED_DATE <='" + todate + "'").list();
                }  else if ("expcnt".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM  arete_tms.contract_creation c inner join tenant_details t on c.CONTRACT_CODE = t.contract_period inner join asset_details a on a.asset_code=c.PROPERTY_CODE inner join sub_asset_details s on s.sub_asset_code=c.FLAT_CODE\n"
                            + "and c.CONT_END_DATE < curdate() AND c.CONT_STATUS='Active' and t.appstatus='CFO Approved' and t.attribute3!='Renewed' and c.status!='Inactive' and c.ORG_ID='" + orgId + "'\n"
                            + "and c.LASTMODIFIED_DATE >='" + frdate + "'\n"
                            + "and c.LASTMODIFIED_DATE <='" + todate + "'").list();
//                            session.createSQLQuery("select count(*) FROM contract_creation where STATUS='Expired' and ORG_ID='" + orgId + "'\n"
                    //                            + "and LASTMODIFIED_DATE >='" + frdate + "'\n"
                    //                            + "and LASTMODIFIED_DATE <='" + todate + "'").list();CONT_END_DATE < curdate() AND CONT_STATUS='Active'
                } else if ("rejcnt".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.contract_creation where RECORD_STATUS='REJECTED' and ORG_ID='" + orgId + "'\n"
                            + "and LASTMODIFIED_DATE >='" + frdate + "'\n"
                            + "and LASTMODIFIED_DATE <='" + todate + "'").list();
                } else if ("renew".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.contract_creation where  RECORD_STATUS='CFO APPROVED' and ORG_ID='" + orgId + "' and STATUS!='Inactive' and STATUS!='Expired'\n"
                            + "and LASTMODIFIED_DATE >='" + frdate + "'\n"
                            + "and LASTMODIFIED_DATE <='" + todate + "'").list();
                } else if ("tobapprove".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.contract_creation where RECORD_STATUS='Contract Created' and STATUS!='Inactive' \n"
                            + "and ORG_ID='" + orgId + "' and LASTMODIFIED_DATE >='" + frdate + "'\n"
                            + "and LASTMODIFIED_DATE <='" + todate + "'").list();
                }
            } else {
                if ("cont".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.contract_creation where STATUS!='Inactive' \n"
                            + "and ORG_ID='" + orgId + "'").list();
                } else if ("insurance".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.insurance_details").list();
                } else if ("expcnt".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*)\n"
                            + "FROM arete_tms.contract_creation c inner join arete_tms.tenant_details t on c.CONTRACT_CODE = t.contract_period inner join asset_details a on a.asset_code=c.PROPERTY_CODE inner join sub_asset_details s on s.sub_asset_code=c.FLAT_CODE\n"
                            + "and c.CONT_END_DATE < curdate() AND c.CONT_STATUS='Active' and t.appstatus='CFO Approved' and t.attribute3!='Renewed' and c.status!='Inactive' and c.ORG_ID='" + orgId + "'").list();
                            
                } else if ("rejcnt".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.contract_creation where RECORD_STATUS='REJECTED' and ORG_ID='" + orgId + "'").list();
                         
                } else if ("renew".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.contract_creation where  RECORD_STATUS='CFO APPROVED' and ORG_ID='" + orgId + "' and STATUS!='Inactive' and STATUS!='Expired'").list();
                       
                } else if ("tobapprove".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.contract_creation where RECORD_STATUS='Contract Created' and STATUS!='Inactive' \n"
                            + "and ORG_ID='" + orgId + "'").list();
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
        return list;
    }

     public List<String> tenantManagementDas(String rstatus, String orgId, String dt, String frdate, String todate) {
        List<String> list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if (frdate != "frdate" && todate != "todate") {
                if ("tenants".equals(rstatus)) {
                    list = session.createSQLQuery("select count(tenant_id) FROM arete_tms.tenant_details where  (ifnull(vacatestatus,'')!='Vacated') and status!='Inactive' and appstatus!='Rejected'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("service".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT service_request_no) FROM arete_tms.serivce_request where recordstatus!='Rejected'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("mati".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT mi_no) FROM arete_tms.arete_tms.material_issue where \n"
                            +"Status!='Inactive' and appstatus='Approved'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
//                    list = session.createSQLQuery("select count(b.attribute1) FROM arete_tms.bill_payment b,arete_tms.asset_details a, arete_tms.tenant_details t where \n"
//                            + "b.asset_name=a.asset_code\n"
//                            + "and b.tenant_code=t.tenant_code\n" 
//                            +"and b.Status!='Inactive' and  b.attribute1='PDC'\n"
//                            + "and b.lastmodified_date >='" + frdate + "'\n"
//                            + "and b.lastmodified_date <='" + todate + "'").list();
                } else if ("rentdue".equals(rstatus)) {
                    list = session.createSQLQuery("select count(attribute1) FROM arete_tms.bill_payment where status!='Inactive' and attribute1='PDC'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("servdue".equals(rstatus)) {
                    list = session.createSQLQuery("select sum(dues) FROM arete_tms.bill_payment where receipt_type='Service'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("advdue".equals(rstatus)) {
                    list = session.createSQLQuery("select sum(dues) FROM arete_tms.bill_payment where receipt_type='Advance'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                }
            } else {
                if ("tenants".equals(rstatus)) {
                    list = session.createSQLQuery("select count(tenant_id) FROM arete_tms.tenant_details where appstatus!='Rejected'").list();
                            
                } else if ("service".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT service_request_no) FROM arete_tms.serivce_request where recordstatus!='Rejected'").list();
                            
                } else if ("mati".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT mi_no) FROM arete_tms.material_issue where appstatus='Approved' and Status!='Inactive'").list();
                          
                } else if ("rentdue".equals(rstatus)) {
                    list = session.createSQLQuery("select count(attribute1) FROM arete_tms.bill_payment where status!='Inactive' and attribute1='PDC'").list();
                         
                } else if ("servdue".equals(rstatus)) {
                    list = session.createSQLQuery("select sum(dues) FROM arete_tms.bill_payment where receipt_type='Service'").list();
                   
                } else if ("advdue".equals(rstatus)) {
                    list = session.createSQLQuery("select sum(dues) FROM arete_tms.bill_payment where receipt_type='Advance'").list();
                      
                }
            }

//            pdc change for date 
            // list = session.createSQLQuery("select count(attribute1) FROM bill_payment  where status!='Inactive' and  attribute1='PDC'\n"
//                            + "and lastmodified_date >='" + frdate + "'\n"
//                            + "and lastmodified_date <='" + todate + "'").list();
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
        return list;
    }

    public List<FollowUp> followUpDas(String rstatus, String orgId, String dt, String frdate, String todate) {
        List<FollowUp> list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if (frdate != "frdate" && todate != "todate") {
                if (rstatus == null) {
                    list = session.createSQLQuery("select count(DISTINCT LEAD_CODE) FROM arete_tms.lead where STATUS!='Inactive'\n"
                            + "and Lastmodefied_Date >='" + frdate + "'\n"
                            + "and Lastmodefied_Date <='" + todate + "'").list();
                } else {
//                list = session.createSQLQuery("select count(DISTINCT LEAD_CODE) FROM FOLLOWUP_HISTORY where follow_up BETWEEN trunc(SYSDATE) AND TRUNC(SYSDATE+1)").list();
                }
            } else {
                if (rstatus == null) {
                    list = session.createSQLQuery("select count(DISTINCT LEAD_CODE) FROM arete_tms.lead where STATUS!='Inactive'\n"
                            + "and DATE(Lastmodefied_Date) ='" + dt + "'\n"
                            + " ").list();
                } else {
//                list = session.createSQLQuery("select count(DISTINCT LEAD_CODE) FROM FOLLOWUP_HISTORY where follow_up BETWEEN trunc(SYSDATE) AND TRUNC(SYSDATE+1)").list();
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
        return list;
    }

    public List<String> CustomerDas(String rstatus, String orgId, String dt, String frdate, String todate) {
        List<String> list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if (frdate != "frdate" && todate != "todate") {
                if ("rentquote".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT Tenant_QuoteCode) FROM arete_tms.rentquote where status!='Inactive' and  Approver_Status!='Rejected'\n"
                            + "and Lastmodefied_Date >='" + frdate + "'\n"
                            + "and Lastmodefied_Date <='" + todate + "'").list();
                } else if ("complaint".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT Complaint_Code) FROM arete_tms.complaints where org_Id='" + orgId + "' and Attribute4='CFO Approved'\n"
                            + "and Lastmodefied_Date >='" + frdate + "'\n"
                            + "and Lastmodefied_Date <='" + todate + "'").list();
                } else if ("feedback".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.customer_feedback where ORG_ID='" + orgId + "' \n"
                            + "and Lastmodefied_Date >='" + frdate + "'\n"
                            + "and Lastmodefied_Date <='" + todate + "'").list();
                } else if ("campaign".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT campaign_Code) FROM arete_tms.campaign where org_Id='" + orgId + "'\n"
                            + "and Lastmodefied_Date >='" + frdate + "'\n"
                            + "and Lastmodefied_Date <='" + todate + "'").list();

                } else if ("vacate".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) from arete_tms.vacating where org_Id='" + orgId + "'\n"
                            + "and Lastmodefied_Date >='" + frdate + "'\n"
                            + "and Lastmodefied_Date <='" + todate + "'").list();
                }else if ("AMCQualityCheck".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) from arete_tms.amc_maintenance where org_Id='" + orgId + "'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                }
            } else {
                if ("rentquote".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT Tenant_QuoteCode) FROM arete_tms.rentquote where Record_Status!='Rejected'").list();
               
                } else if ("complaint".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT Complaint_Code) FROM arete_tms.complaints where org_Id='" + orgId + "' and Attribute4='CFO Approved'").list();
                     
                } else if ("feedback".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.customer_feedback where ORG_ID='" + orgId + "'").list();
                          
                } else if ("campaign".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT campaign_Code) FROM arete_tms.campaign where org_Id='" + orgId + "'").list();
                     

                } else if ("vacate".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) from arete_tms.vacating where org_Id='" + orgId + "'").list();
                           
                }else if ("AMCQualityCheck".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) from arete_tms.amc_maintenance where org_Id='" + orgId + "'").list();
                       
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
        return list;
    }

    public List<String> tenantManagement1Dasgraph(String rstatus, String orgId, String dt, String frdate, String todate) {
        List<String> list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if (frdate != "frdate" && todate != "todate") {
                if ("tenants".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT tenant_id) FROM arete_tms.tenant_details where appstatus!='Rejected'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("service".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT service_request_no) FROM arete_tms.serivce_request where recordstatus!='Rejected'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("mati".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT mi_no) FROM arete_tms.material_issue where appstatus='Approved'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("rentdue".equals(rstatus)) {
                    list = session.createSQLQuery("select count(attribute1) FROM arete_tms.bill_payment where attribute1='PDC'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("servdue".equals(rstatus)) {
                    list = session.createSQLQuery("select sum(DISTINCT dues) FROM arete_tms.bill_payment where receipt_type='Service'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("advdue".equals(rstatus)) {
                    list = session.createSQLQuery("select sum(DISTINCT dues) FROM bill_payment where receipt_type='Advance'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                }
            } else {
                if ("tenants".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT tenant_id) FROM arete_tms.tenant_details where appstatus!='Rejected'\n"
                            + "and DATE(lastmodified_date) ='" + dt + "'").list();
                } else if ("service".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT service_request_no) FROM arete_tms.serivce_request where recordstatus!='Rejected'\n"
                            + "and DATE(lastmodified_date) ='" + dt + "'").list();
                } else if ("mati".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT mi_no) FROM arete_tms.material_issue where appstatus='Approved'\n"
                            + "and DATE(lastmodified_date) ='" + dt + "'").list();
                } else if ("rentdue".equals(rstatus)) {
                    list = session.createSQLQuery("select count(attribute1) FROM arete_tms.bill_payment where attribute1='PDC'\n"
                            + "and DATE(lastmodified_date) ='" + dt + "'").list();
                } else if ("servdue".equals(rstatus)) {
                    list = session.createSQLQuery("select sum(DISTINCT dues) FROM arete_tms.bill_payment where receipt_type='Service'\n"
                            + "and DATE(lastmodified_date) ='" + dt + "'").list();
                } else if ("advdue".equals(rstatus)) {
                    list = session.createSQLQuery("select sum(DISTINCT dues) FROM arete_tms.bill_payment where receipt_type='Advance'\n"
                            + "and DATE(lastmodified_date) ='" + dt + "'").list();
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
        return list;
    }

    public Object followUpDasgraph(String rstatus, String orgId, String dt, String frdate, String todate) {
        Object list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if (frdate != "frdate" && todate != "todate") {
                if (rstatus == null) {
                    list = session.createSQLQuery("select count(DISTINCT LEAD_CODE) FROM arete_tms.lead where STATUS!='Inactive'\n"
                            + "and Lastmodefied_Date >='" + frdate + "'\n"
                            + "and Lastmodefied_Date <='" + todate + "'").uniqueResult();
                } else {
//                list = session.createSQLQuery("select count(DISTINCT LEAD_CODE) FROM FOLLOWUP_HISTORY where follow_up BETWEEN trunc(SYSDATE) AND TRUNC(SYSDATE+1)").list();
                }
            } else {
                if (rstatus == null) {
                    list = session.createSQLQuery("select count(DISTINCT LEAD_CODE) FROM arete_tms.lead where STATUS!='Inactive'\n"
                            + "and DATE(Lastmodefied_Date) ='" + dt + "'\n"
                            + " ").uniqueResult();
                } else {
//                list = session.createSQLQuery("select count(DISTINCT LEAD_CODE) FROM FOLLOWUP_HISTORY where follow_up BETWEEN trunc(SYSDATE) AND TRUNC(SYSDATE+1)").list();
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
        return list;
    }

    public Object CustomerDasgraph(String rstatus, String orgId, String dt, String frdate, String todate) {
        Object list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if (frdate != "frdate" && todate != "todate") {
                if ("rentquote".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT Tenant_QuoteCode) FROM arete_tms.rentquote where Record_Status!='Rejected'\n"
                            + "and Lastmodefied_Date >='" + frdate + "'\n"
                            + "and Lastmodefied_Date <='" + todate + "'").uniqueResult();
                } else if ("complaint".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT Complaint_Code) FROM arete_tms.complaints where org_Id='" + orgId + "' and Attribute4='CFO Approved'\n"
                            + "and Lastmodefied_Date >='" + frdate + "'\n"
                            + "and Lastmodefied_Date <='" + todate + "'").uniqueResult();
                } else if ("feedback".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.customer_feedback where ORG_ID='" + orgId + "' \n"
                            + "and Lastmodefied_Date >='" + frdate + "'\n"
                            + "and Lastmodefied_Date <='" + todate + "'").uniqueResult();
                } else if ("campaign".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT campaign_Code) FROM arete_tms.campaign where org_Id='" + orgId + "'\n"
                            + "and Lastmodefied_Date >='" + frdate + "'\n"
                            + "and Lastmodefied_Date <='" + todate + "'").uniqueResult();

                } else if ("vacate".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) from arete_tms.vacating where org_Id='" + orgId + "'\n"
                            + "and Lastmodefied_Date >='" + frdate + "'\n"
                            + "and Lastmodefied_Date <='" + todate + "'").uniqueResult();
                }
            } else {
                if ("rentquote".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT Tenant_QuoteCode) FROM arete_tms.rentquote where Record_Status!='Rejected'\n"
                            + "and DATE(Lastmodefied_Date) ='" + dt + "'").uniqueResult();
                } else if ("complaint".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT Complaint_Code) FROM arete_tms.complaints where org_Id='" + orgId + "' and Attribute4='CFO Approved'\n"
                            + "and DATE(Lastmodefied_Date) ='" + dt + "'").uniqueResult();
                } else if ("feedback".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.customer_feedback where ORG_ID='" + orgId + "' \n"
                            + "and DATE(Lastmodefied_Date) ='" + dt + "'").uniqueResult();
                } else if ("campaign".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT campaign_Code) FROM arete_tms.campaign where org_Id='" + orgId + "'\n"
                            + "and DATE(Lastmodefied_Date) ='" + dt + "'").uniqueResult();

                } else if ("vacate".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) from arete_tms.vacating where org_Id='" + orgId + "'\n"
                            + "and DATE(Lastmodefied_Date) ='" + dt + "'").uniqueResult();
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
        return list;
    }

    public Object PurchaseManagementDasgraph(String rstatus, String orgId, String dt, String frdate, String todate) {
        Object list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if (frdate != "frdate" && todate != "todate") {
                if ("nsupplier".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.supplier_master where status!='Inactive' and org_id='" + orgId + "' \n"
                            + "and LASTMODIFIED_DATE >='" + frdate + "'\n"
                            + "and LASTMODIFIED_DATE <='" + todate + "'").uniqueResult();
                } else if ("pppo".equals(rstatus)) {
                    list = session.createSQLQuery("select  COUNT(DISTINCT arete_tms.purchase_order_no)FROM purchase_order where record_status!='Approved' \n"
                            + "and status!='Inactive' and org_id='" + orgId + "' and DATE(lastmodified_date) >='" + frdate + "'\n"
                            + "and DATE(lastmodified_date) <='" + todate + "'").uniqueResult();
                } else if ("prequest".equals(rstatus)) {
                    list = session.createSQLQuery("select  COUNT(DISTINCT pr_no) FROM arete_tms.purchase_request where record_status!='Approved' and status!='Inactive' and org_id='" + orgId + "' \n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").uniqueResult();
                } else if ("enquiry".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT enquiries_no) FROM arete_tms.supplier_enquiry where record_status!='Enquiry Created' \n"
                            + "and status!='Inactive' and org_id='" + orgId + "' \n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").uniqueResult();
                } else if ("quote".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT supplier_name) FROM arete_tms.supplier_quotation where record_status='Quotation Approved' and status!='Inactive' \n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").uniqueResult();
                } else if ("purchase".equals(rstatus)) {
                    list = session.createSQLQuery("select  COUNT(DISTINCT purchase_order_no)FROM arete_tms.purchase_order where record_status='Approved'\n"
                            + "and status!='Inactive' and org_id='" + orgId + "' and DATE(lastmodified_date) >='" + frdate + "'\n"
                            + "and DATE(lastmodified_date) <='" + todate + "'").uniqueResult();
                }
            } else {
                if ("nsupplier".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.supplier_master where status!='Inactive' and org_id='" + orgId + "' and status!='Inactive' \n"
                            + "and LASTMODIFIED_DATE ='" + dt + "'").uniqueResult();
                } else if ("pppo".equals(rstatus)) {
                    list = session.createSQLQuery("select  COUNT(DISTINCT purchase_order_no)FROM arete_tms.purchase_order where record_status!='Approved' \n"
                            + "and status!='Inactive' and org_id='" + orgId + "' and DATE(lastmodified_date) ='" + dt + "'").uniqueResult();
                } else if ("prequest".equals(rstatus)) {
                    list = session.createSQLQuery("select  COUNT(DISTINCT pr_no) FROM arete_tms.purchase_request where record_status!='Approved' and org_id='" + orgId + "' and status!='Inactive' \n"
                            + "and lastmodified_date ='" + dt + "'").uniqueResult();
                } else if ("enquiry".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT enquiries_no) FROM arete_tms.supplier_enquiry where record_status!='Enquiry Created' and status!='Inactive' \n"
                            + "and org_id='1' and lastmodified_date ='" + dt + "'").uniqueResult();
                } else if ("quote".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT supplier_name) FROM arete_tms.supplier_quotation where record_status='Quotation Approved' and status!='Inactive' \n"
                            + "and lastmodified_date ='" + dt + "'").uniqueResult();
                } else if ("purchase".equals(rstatus)) {
                    list = session.createSQLQuery("select  COUNT(DISTINCT purchase_order_no)FROM arete_tms.purchase_order where record_status='Approved'\n"
                            + "and status!='Inactive' and org_id='" + orgId + "' and DATE(lastmodified_date) ='" + dt + "'").uniqueResult();
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
        return list;
    }

    public List<String> InventoryManagementDasgraph(String rstatus, String orgId, String dt, String frdate, String todate) {
        List<String> list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if (frdate != "frdate" && todate != "todate") {
                if ("preceipt".equals(rstatus)) {
                    Date fdate = null;
                    Date tdate = null;
                    String fromdate = "";
                    String todates = "";
                    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    fdate = formatter.parse(frdate);
                    tdate = formatter.parse(todate);
                    fromdate = sdf.format(fdate);
                    todates = sdf.format(tdate);
                    list = session.createSQLQuery("SELECT COUNT(sno) FROM arete_tms.purchase_order where record_status!='PM Approved' \n"
                            + "and record_status!='FM Approved' and record_status='Approved' and approval_status='Initial' \n"
                            + "and approval_status!='Fully Receipt'\n"
                            + "and DATE(lastmodified_date) >='" + fromdate + "'\n"
                            + "and DATE(lastmodified_date) <='" + todates + "'").list();
                } else if ("inspection".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT receipt_no) FROM arete_tms.receiving_process where record_status='Received' and status!='Inactive'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("Qinspection".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT material_receipt_no) FROM arete_tms.quality_inspection where record_status='Initial' \n"
                            + "and status!='Inactive' and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("tgrn".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT material_receipt_no) FROM arete_tms.good_receipt_note where status!='Inactive'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("invlist".equals(rstatus)) {
                    list = session.createSQLQuery("select sum(stock_qty) FROM arete_tms.inventorylist where status!='Inactive'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("mreturn".equals(rstatus)) {
                    list = session.createSQLQuery("select sum(rejected_qty) FROM arete_tms.material_return where return_status='Material Returned' and status!='Inactive'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                }
            } else {
                if ("preceipt".equals(rstatus)) {
                    list = session.createSQLQuery("SELECT COUNT(sno) FROM arete_tms.purchase_order where record_status!='PM Approved' \n"
                            + "and record_status!='FM Approved' and record_status='Approved' and approval_status='Initial' \n"
                            + "and approval_status!='Fully Receipt' and DATE(lastmodified_date) ='" + dt + "'").list();
                } else if ("inspection".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT receipt_no) FROM arete_tms.receiving_process where record_status='Received' \n"
                            + "and status!='Inactive'\n"
                            + "and DATE(lastmodified_date) ='" + dt + "'").list();
                } else if ("Qinspection".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT material_receipt_no) FROM arete_tms.quality_inspection where record_status='Initial' \n"
                            + "and status!='Inactive' and DATE(lastmodified_date) ='" + dt + "'").list();
                } else if ("tgrn".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT material_receipt_no) FROM arete_tms.good_receipt_note where status!='Inactive'\n"
                            + "and DATE(lastmodified_date) ='" + dt + "'").list();
                } else if ("invlist".equals(rstatus)) {
                    list = session.createSQLQuery("select sum(stock_qty) FROM arete_tms.inventorylist where status!='Inactive'\n"
                            + "and DATE(lastmodified_date) ='" + dt + "'").list();
                } else if ("mreturn".equals(rstatus)) {
                    list = session.createSQLQuery("select sum(rejected_qty) FROM arete_tms.material_return where return_status='Material Returned' and status!='Inactive'\n"
                            + "and DATE(lastmodified_date) ='" + dt + "'").list();
                }
            }

            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } catch (ParseException ex) {
            Logger.getLogger(DashboardDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            session.clear();
            session.close();
        }
        return list;
    }

    public Object AssetManagementDasgraph(String rstatus, String orgId, String dt, String frdate, String todate) {
        Object list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if (frdate != "frdate" && todate != "todate") {
                if ("assets".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT asset_code) FROM arete_tms.asset_details where status!='Inactive' \n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").uniqueResult();
                } else if ("subassets".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT sub_asset_code) FROM arete_tms.sub_asset_details where status!='Inactive' \n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").uniqueResult();
                } else if ("accessories".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT ITEM_CODE) FROM arete_tms.item_master where STATUS!='Inactive' \n"
                            + "and LASTMODIFIED_DATE >='" + frdate + "'\n"
                            + "and LASTMODIFIED_DATE <='" + todate + "'").uniqueResult();
                } else if ("vacant".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT sub_asset_code) FROM arete_tms.sub_asset_details where record_status='Vacant'\n"
                            + "and status!='Inactive' \n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").uniqueResult();
                } else if ("req".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT REQUISITION_NO) FROM arete_tms.purch_requisition where status!='Inactive' \n"
                            + "and LASTMODIFIED_DATE >='" + frdate + "'\n"
                            + "and LASTMODIFIED_DATE <='" + todate + "'").uniqueResult();
                } else if ("poprder".equals(rstatus)) {
                    Date fdate = null;
                    Date tdate = null;
                    String fromdate = "";
                    String todates = "";
                    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    fdate = formatter.parse(frdate);
                    tdate = formatter.parse(todate);
                    fromdate = sdf.format(fdate);
                    todates = sdf.format(tdate);
                    list = session.createSQLQuery("select count(DISTINCT purchase_order_no) FROM arete_tms.purchase_order\n"
                            + "where DATE(lastmodified_date) >='" + fromdate + "'\n"
                            + "and DATE(lastmodified_date) <='" + todates + "'").uniqueResult();
                }

            } else {
                if ("assets".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT asset_code) FROM arete_tms.asset_details where status!='Inactive' \n"
                            + "and DATE(lastmodified_date) ='" + dt + "'").uniqueResult();
                } else if ("subassets".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT sub_asset_code) FROM arete_tms.sub_asset_details where status!='Inactive' \n"
                            + "and DATE(lastmodified_date) ='" + dt + "'").uniqueResult();
                } else if ("accessories".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT ITEM_CODE) FROM arete_tms.item_master where status!='Inactive' \n"
                            + "and DATE(LASTMODIFIED_DATE) ='" + dt + "'").uniqueResult();
                } else if ("vacant".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT sub_asset_code) FROM arete_tms.sub_asset_details where record_status='Vacant' \n"
                            + "and status!='Inactive' and DATE(lastmodified_date) ='" + dt + "'").uniqueResult();
                } else if ("req".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT REQUISITION_NO) FROM arete_tms.purch_requisition where status!='Inactive' \n"
                            + "and DATE(LASTMODIFIED_DATE) ='" + dt + "'").uniqueResult();
                } else if ("poprder".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT purchase_order_no) FROM arete_tms.purchase_order\n"
                            + "where DATE(lastmodified_date) ='" + dt + "'").uniqueResult();
                }
            }

            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } catch (ParseException ex) {
            Logger.getLogger(DashboardDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            session.clear();
            session.close();
        }
        return list;
    }

    public Object occupencyDasgraph(String rstatus, String propName, String orgId, String dt, String frdate, String todate) {
        Object list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if (frdate != "frdate" && todate != "todate") {

                if ("totFlats".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT sub_asset_code) FROM arete_tms.sub_asset_details where status!='Inactive' \n"
                            + "and asset_name='" + propName + "'"
                            + "and lastmodified_date >='" + frdate + "' \n"
                            + "and lastmodified_date <='" + todate + "'").uniqueResult();

                } else if ("totVacantFlats".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT sub_asset_code) FROM arete_tms.sub_asset_details where record_status='Vacant' \n"
                            + "and status!='Inactive'and asset_name='" + propName + "'"
                            + "and lastmodified_date >='" + frdate + "' \n"
                            + "and lastmodified_date <='" + todate + "'").uniqueResult();
                } else if ("totalOccupiedFlats".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT sub_asset_code) FROM arete_tms.sub_asset_details where status!='Inactive' \n"
                            + "and record_status='Occupied'and asset_name='" + propName + "'"
                            + "and lastmodified_date >='" + frdate + "' \n"
                            + "and lastmodified_date <='" + todate + "'").uniqueResult();
                } else if ("totalUnListedFlats".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM asset_details\n"
                            + "where status ='Inactive'"
                            + "and lastmodified_date >='" + frdate + "' \n"
                            + "and lastmodified_date <='" + todate + "'").uniqueResult();
                }

            } else {
                if ("totFlats".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT sub_asset_code) FROM arete_tms.sub_asset_details where status!='Inactive' \n"
                            + "and asset_name='" + propName + "'").uniqueResult();

                } else if ("totVacantFlats".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT sub_asset_code) FROM arete_tms.sub_asset_details where record_status='Vacant' \n"
                            + "and status!='Inactive'and asset_name='" + propName + "'").uniqueResult();
                } else if ("totalOccupiedFlats".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT sub_asset_code) FROM arete_tms.sub_asset_details where status!='Inactive' \n"
                            + "and record_status='Occupied'and asset_name='" + propName + "'").uniqueResult();
                } else if ("totalUnListedFlats".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.asset_details\n"
                            + "where status ='Inactive'").uniqueResult();
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
        return list;
    }

    public Object contractDasgraph(String rstatus, String orgId, String dt, String frdate, String todate) {
        Object list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if (frdate != "frdate" && todate != "todate") {
                if ("cont".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.contract_creation where STATUS!='Inactive' and STATUS!='Expired' \n"
                            + "and ORG_ID='" + orgId + "'\n"
                            + "and LASTMODIFIED_DATE >='" + frdate + "'\n"
                            + "and LASTMODIFIED_DATE <='" + todate + "'").uniqueResult();
                } else if ("insurance".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.insurance_details where LASTMODIFIED_DATE >='" + frdate + "'\n"
                            + "and LASTMODIFIED_DATE <='" + todate + "'").uniqueResult();
                } else if ("expcnt".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.contract_creation where STATUS='Expired' and ORG_ID='" + orgId + "'\n"
                            + "and LASTMODIFIED_DATE >='" + frdate + "'\n"
                            + "and LASTMODIFIED_DATE <='" + todate + "'").uniqueResult();
                } else if ("rejcnt".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.contract_creation where RECORD_STATUS='REJECTED' and ORG_ID='" + orgId + "'\n"
                            + "and LASTMODIFIED_DATE >='" + frdate + "'\n"
                            + "and LASTMODIFIED_DATE <='" + todate + "'").uniqueResult();
                } else if ("renew".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.contract_creation where  RECORD_STATUS='CFO APPROVED' and ORG_ID='" + orgId + "'\n"
                            + "and LASTMODIFIED_DATE >='" + frdate + "'\n"
                            + "and LASTMODIFIED_DATE <='" + todate + "'").uniqueResult();
                } else if ("tobapprove".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.contract_creation where RECORD_STATUS='Contract Created' and STATUS!='Inactive' \n"
                            + "and ORG_ID='" + orgId + "' and LASTMODIFIED_DATE >='" + frdate + "'\n"
                            + "and LASTMODIFIED_DATE <='" + todate + "'").uniqueResult();
                }
            } else {
                if ("cont".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.contract_creation where STATUS!='Inactive' and STATUS!='Expired' \n"
                            + "and ORG_ID='" + orgId + "' and DATE(LASTMODIFIED_DATE) ='" + dt + "'").uniqueResult();
                } else if ("insurance".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.insurance_details where DATE(LASTMODIFIED_DATE) ='" + dt + "'").uniqueResult();
                } else if ("expcnt".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.contract_creation where STATUS='Expired' and ORG_ID='" + orgId + "'\n"
                            + "and DATE(LASTMODIFIED_DATE) ='" + dt + "'").uniqueResult();
                } else if ("rejcnt".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.contract_creation where RECORD_STATUS='REJECTED' and ORG_ID='" + orgId + "'\n"
                            + "and DATE(LASTMODIFIED_DATE) ='" + dt + "'").uniqueResult();
                } else if ("renew".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.contract_creation where  RECORD_STATUS='CFO APPROVED' and ORG_ID='" + orgId + "'\n"
                            + "and DATE(LASTMODIFIED_DATE) ='" + dt + "'").uniqueResult();
                } else if ("tobapprove".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.contract_creation where RECORD_STATUS='Contract Created' and STATUS!='Inactive' \n"
                            + "and ORG_ID='" + orgId + "' and DATE(LASTMODIFIED_DATE) ='" + dt + "'").uniqueResult();
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
        return list;
    }

    public List<String> tenantManagementDas1(String rstatus, String userId2, String orgId, String dt, String frdate, String todate) {
        List<String> list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();

        try {
            tx = session.beginTransaction();
            if (frdate != "frdate" && todate != "todate") {
                if ("tenant".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT tenant_id) FROM arete_tms.portal_tenant_detail where user_id='" + userId2 + "' and appstatus!='CFO Approved' \n"
                            + "and lastmodified_date >='" + frdate + "' \n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("service".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT service_request_no) FROM arete_tms.serivce_request where user_id='" + userId2 + "' and recordstatus!='Rejected'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("mati".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT mi_no) FROM arete_tms.material_issue where appstatus='Approved'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("rentdue".equals(rstatus)) {
                    list = session.createSQLQuery("select count(attribute1) FROM arete_tms.bill_payment where user_id='" + userId2 + "' and attribute1='PDC'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("servdue".equals(rstatus)) {
                    list = session.createSQLQuery("select sum(DISTINCT dues) FROM arete_tms.bill_payment where user_id='" + userId2 + "' and receipt_type='Service'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("advdue".equals(rstatus)) {
                    list = session.createSQLQuery("select sum(DISTINCT dues) FROM arete_tms.bill_payment where user_id='" + userId2 + "' and receipt_type='Advance'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                }
            } else {
                if ("tenant".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT tenant_id) FROM arete_tms.portal_tenant_detail where user_id='" + userId2 + "' and appstatus!='CFO Approved' \n"
                            + "and DATE(lastmodified_date) ='" + dt + "'").list();
                } else if ("service".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT service_request_no) FROM arete_tms.serivce_request where user_id='" + userId2 + "' and recordstatus!='Rejected'\n"
                            + "and DATE(lastmodified_date) ='" + dt + "'").list();
                } else if ("mati".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT mi_no) FROM arete_tms.material_issue where appstatus='Approved'\n"
                            + "and DATE(lastmodified_date) ='" + dt + "'").list();
                } else if ("rentdue".equals(rstatus)) {
                    list = session.createSQLQuery("select count(attribute1) FROM arete_tms.bill_payment where user_id='" + userId2 + "' and attribute1='PDC'\n"
                            + "and DATE(lastmodified_date) ='" + dt + "'").list();
                } else if ("servdue".equals(rstatus)) {
                    list = session.createSQLQuery("select sum(DISTINCT dues) FROM arete_tms.bill_payment where user_id='" + userId2 + "' and receipt_type='Service'\n"
                            + "and DATE(lastmodified_date) ='" + dt + "'").list();
                } else if ("advdue".equals(rstatus)) {
                    list = session.createSQLQuery("select sum(DISTINCT dues) FROM arete_tms.bill_payment where user_id='" + userId2 + "' and receipt_type='Advance'\n"
                            + "and DATE(lastmodified_date) ='" + dt + "'").list();
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
        return list;
    }

    public Object tenantManagementDasgraph1(String rstatus, String userId2, String orgId, String dt, String frdate, String todate) {
        Object list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if (frdate != "frdate" && todate != "todate") {
                if ("tenant".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT tenant_id) FROM arete_tms.portal_tenant_detail where user_id='" + userId2 + "' and appstatus!='CFO Approved' \n"
                            + "and lastmodified_date >='" + frdate + "' \n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("service".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT service_request_no) FROM arete_tms.serivce_request where user_id='" + userId2 + "' and recordstatus!='Rejected'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("mati".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT mi_no) FROM arete_tms.material_issue where appstatus='Approved'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("rentdue".equals(rstatus)) {
                    list = session.createSQLQuery("select count(attribute1) FROM arete_tms.bill_payment where attribute1='PDC'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("servdue".equals(rstatus)) {
                    list = session.createSQLQuery("select sum(DISTINCT dues) FROM arete_tms.bill_payment where user_id='" + userId2 + "' and receipt_type='Service'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("advdue".equals(rstatus)) {
                    list = session.createSQLQuery("select sum(DISTINCT dues) FROM arete_tms.bill_payment where receipt_type='Advance'\n"
                            + "and lastmodified_date >='" + frdate + "'\n"
                            + "and lastmodified_date <='" + todate + "'").list();
                }
            } else {
                if ("tenant".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT tenant_id) FROM arete_tms.portal_tenant_detail where user_id='" + userId2 + "' and appstatus!='CFO Approved' \n"
                            + "and DATE(lastmodified_date) ='" + dt + "'").list();
                } else if ("service".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT service_request_no) FROM arete_tms.serivce_request where user_id='" + userId2 + "' and recordstatus!='Rejected'\n"
                            + "and DATE(lastmodified_date) ='" + dt + "'").list();
                } else if ("mati".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT mi_no) FROM arete_tms.material_issue where appstatus='Approved'\n"
                            + "and DATE(lastmodified_date) ='" + dt + "'").list();
                } else if ("rentdue".equals(rstatus)) {
                    list = session.createSQLQuery("select count(attribute1) FROM arete_tms.bill_payment where attribute1='PDC'\n"
                            + "and DATE(lastmodified_date) ='" + dt + "'").list();
                } else if ("servdue".equals(rstatus)) {
                    list = session.createSQLQuery("select sum(DISTINCT dues) FROM arete_tms.bill_payment where user_id='" + userId2 + "' and receipt_type='Service'\n"
                            + "and DATE(lastmodified_date) ='" + dt + "'").list();
                } else if ("advdue".equals(rstatus)) {
                    list = session.createSQLQuery("select sum(DISTINCT dues) FROM arete_tms.bill_payment where receipt_type='Advance'\n"
                            + "and DATE(lastmodified_date) ='" + dt + "'").list();
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
        return list;
    }

    ////newly added by lakshmi
    public List<String> propNames(String rstatus, String orgId) {
        List<String> list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if ("propNames".equals(rstatus)) {
                list = session.createSQLQuery("select DISTINCT asset_name FROM arete_tms.asset_details where status!='Inactive'\n").list();
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
        return list;
    }

    public List<String> propDetails(String rstatus, String propName, String orgId, String dt, String frdate, String todate) {

        List<String> list = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            if (frdate != "frdate" && todate != "todate") {
                if ("totFlats".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT sub_asset_code) FROM arete_tms.sub_asset_details where status!='Inactive' \n"
                            + "and asset_name='" + propName + "'"
                            + "and lastmodified_date >='" + frdate + "' \n"
                            + "and lastmodified_date <='" + todate + "'").list();

                } else if ("totVacantFlats".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT sub_asset_code) FROM arete_tms.sub_asset_details where record_status='Vacant' \n"
                            + "and status!='Inactive'and asset_name='" + propName + "'"
                            + "and lastmodified_date >='" + frdate + "' \n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("totalOccupiedFlats".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT sub_asset_code) FROM arete_tms.sub_asset_details where status!='Inactive' \n"
                            + "and record_status='Occupied'and asset_name='" + propName + "'"
                            + "and lastmodified_date >='" + frdate + "' \n"
                            + "and lastmodified_date <='" + todate + "'").list();
                } else if ("totalUnListedFlats".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.asset_details\n"
                            + "where status ='Inactive'"
                            + "and lastmodified_date >='" + frdate + "' \n"
                            + "and lastmodified_date <='" + todate + "'").list();
                }
            } else {
                if ("totFlats".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT sub_asset_code) FROM arete_tms.sub_asset_details where status!='Inactive' \n"
                            + "and asset_name='" + propName + "'").list();

                } else if ("totVacantFlats".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT sub_asset_code) FROM arete_tms.sub_asset_details where record_status='Vacant' \n"
                            + "and status!='Inactive'and asset_name='" + propName + "'").list();
                } else if ("totalOccupiedFlats".equals(rstatus)) {
                    list = session.createSQLQuery("select count(DISTINCT sub_asset_code) FROM arete_tms.sub_asset_details where status!='Inactive' \n"
                            + "and record_status='Occupied'and asset_name='" + propName + "'").list();
                } else if ("totalUnListedFlats".equals(rstatus)) {
                    list = session.createSQLQuery("select count(*) FROM arete_tms.asset_details\n"
                            + "where status ='Inactive'").list();
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
        return list;
    }

    public List<AssetDetails> propertyNames() throws HibernateException, SQLException {
        List<AssetDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from AssetDetails where status!='Inactive'");

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
    
    //newly added by lakshmi for default rent payments
    public List<RentNotification> defaultRentPayment() throws HibernateException, SQLException {
        List<RentNotification> datalist = null;
        Transaction tx = null;
        Query query = null;
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            
                query = session.createQuery("select count(*) FROM RentNotification where notificationDate<='"+timestamp+"'");
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

}
