/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.dao;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import tenant.classes.Inventorylist;
import tenant.classes.ItemCategory;
import tenant.classes.ItemMaster;
import tenant.classes.MaterialIssue;
import tenant.classes.ServiceRequest;
import tenant.classes.ServiceRequestType;
import tenant.classes.TenantDetails;
import tenant.classes.UomMaster;
import tenant.other.classes.commonInterface;

/**
 *
 * @author vamsi
 */
public class ServiceRequestDAO extends HibernateDaoSupport implements commonInterface {

    //---------------Service request details list---------------------------//
    public List<ServiceRequest> serviceList(String SNo, String serviceRequestNo) {
        List<ServiceRequest> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from ServiceRequest where status!='Inactive' and recordstatus!='Rejected' group by serviceRequestNo");
            } else {
                query = session.createQuery("from ServiceRequest where status!='Inactive' and serviceRequestNo='" + serviceRequestNo + "'");
            }
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
    // add by pavi for dashboard problem from and to date
     public List<ServiceRequest> serviceList1(String SNo, String serviceRequestNo,String fromDate,String toDate) {
        List<ServiceRequest> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from ServiceRequest where status!='Inactive' and recordstatus!='Rejected'and lastmodifiedDate >='" + fromDate + "' and lastmodifiedDate <='" + toDate + "' group by serviceRequestNo");
            } else {
                query = session.createQuery("from ServiceRequest where status!='Inactive' and serviceRequestNo='" + serviceRequestNo + "'");
            }
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
//---------------Service request auto generation code---------------------------//

    public List<ServiceRequest> getSRNo(String serviceRequestDate) {
        List<ServiceRequest> code = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (serviceRequestDate != null) {
                query = session.createSQLQuery("SELECT service_request_no FROM arete_tms.serivce_request where service_request_no like '%SR%' ORDER BY sno ASC");
            } else {
                query = session.createQuery("from ServiceRequest where  status!='Inactive' ORDER BY lasttmodifiedDate DESC");
            }
            code = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return code;
    }
//---------------Service request grid submit---------------------------//

    public void servicesave1(ServiceRequest dis) throws HibernateException, SQLException {
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
//---------------Service request grid submit---------------------------//

    public void servicesave(List<ServiceRequest> grid) throws HibernateException, SQLException {
        for (Iterator<ServiceRequest> iterator = grid.iterator(); iterator.hasNext();) {
            ServiceRequest test = (ServiceRequest) iterator.next();
            servicesave1(test);
        }
    }

    //**************Fetch Tenant Details for Email******************//
    public List<ServiceRequest> tdList(String userId, String orgId, String serviceRequestNo) throws HibernateException, SQLException {
        List<ServiceRequest> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from ServiceRequest where serviceRequestNo='" + serviceRequestNo + "' and status!='Inactive'");
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
//---------------------select tenant details------------------//    

    public List<TenantDetails> selectTenant() throws HibernateException, SQLException {
        List<TenantDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from TenantDetails where status!='Inactive' and appstatus='CFO Approved' and (vacatestatus!='Vacated' or vacatestatus is null)");
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

    //---------------------select request details------------------//    
    public List<ServiceRequestType> selectRequest() throws HibernateException, SQLException {
        List<ServiceRequestType> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from ServiceRequestType");
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

//********************Delete grid data from service request**********//
    public void srGridDataDelete(Integer sno) throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("delete from ServiceRequest where sno='" + sno + "'");
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
//---------------------select item category---------------------------//

    public List<ItemCategory> selectItCateg() throws HibernateException, SQLException {
        List<ItemCategory> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from ItemCategory where status!='Inactive'");
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
//---------------------select item code---------------------------//

    public List<ItemMaster> itemmaster(String itemCate) {
        List<ItemMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct i.ITEM_CODE,i.ITEM_NAME,u.UOM_NAME,l.stock_qty,i.STATUS\n"
                    + " from item_master i, inventorylist l, uom_master u\n"
                    + "where i.ITEM_CODE=l.item_code and i.ITEM_CATEGORY= '" + itemCate + "'and i.ITEM_UOM=u.UOM_NAME and l.stock_qty!='0' and i.STATUS!='Inactive'");
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
//---------------------service request gfc rejected list---------------------------//

    public void serviceRequestReject(String srNo, String recordstatus, String appremarks) throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update ServiceRequest set recordstatus='" + recordstatus + "',appremarks='" + appremarks + "' where serviceRequestNo='" + srNo + "'");
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
//---------------------service request cfo rejected  list---------------------------//

    public void serviceRequestReject1(String srNo, String recordstatus, String appremarks) throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update ServiceRequest set recordstatus='" + recordstatus + "',appremarks1='" + appremarks + "' where serviceRequestNo='" + srNo + "'");
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
//---------------------pagination for item popup---------------------------//

    public List<ItemMaster> selectRawMaterialList1(String userId, String orgId, String SNo, String searchData, Integer iDisplayStart, Integer displayLength, String order, String listPage, String subCategory) throws HibernateException, SQLException {
        List<ItemMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (listPage.equalsIgnoreCase("selectItems")) {
                if (!subCategory.equalsIgnoreCase("All")) {
                    query = session.createSQLQuery("select distinct i.ITEM_CODE,i.ITEM_NAME,i.ITEM_UOM,l.total_stock,i.STATUS\n"
                            + " from item_master i, inventorylist l\n"
                            + "where i.ITEM_CODE=l.item_code and i.ITEM_CATEGORY= '" + subCategory + "' and l.total_stock!='0' and i.STATUS!='Inactive' \n"
                            + " and (lower(i.ITEM_CODE) LIKE lower('%" + searchData + "%')  or lower(i.ITEM_NAME) LIKE lower('%" + searchData + "%') or lower(i.ITEM_UOM) LIKE lower('%" + searchData + "%') or lower(l.total_stock) LIKE lower('%" + searchData + "%') ) ").setFirstResult(iDisplayStart).setMaxResults(displayLength);
                } else {
                    query = session.createSQLQuery("select distinct i.ITEM_CODE,i.ITEM_NAME,i.ITEM_UOM,l.total_stock,i.STATUS\n"
                            + " from item_master i, inventorylist l\n"
                            + "where i.ITEM_CODE=l.item_code and and l.total_stock!='0' STATUS!='Inactive' \n"
                            + " and (lower(ITEM_CODE) LIKE lower('%" + searchData + "%')  or lower(ITEM_NAME) LIKE lower('%" + searchData + "%') or lower(ITEM_UOM) LIKE lower('%" + searchData + "%') or lower(l.total_stock) LIKE lower('%" + searchData + "%')) ").setFirstResult(iDisplayStart).setMaxResults(displayLength);
                }
            } else {
                query = session.createQuery("from ItemMaster where sno='" + SNo + "' and status!='Inactive'");
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
//---------------------pagination for item popup---------------------------//

    public BigInteger selectRawMaterialListCount(String userId, String orgId, String SNo, String searchData, String order, String listPage, String subCategory) throws HibernateException, SQLException {
        BigInteger datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (listPage.equalsIgnoreCase("selectItems")) {
                if (!subCategory.equalsIgnoreCase("All")) {
                    query = session.createSQLQuery("select count(i.ITEM_CODE) \n"
                            + "from item_master i, inventorylist l\n"
                            + "where i.ITEM_CODE=l.item_code and i.ITEM_CATEGORY= '" + subCategory + "' and l.total_stock!='0' and i.STATUS!='Inactive'");
                } else {
                    query = session.createSQLQuery("select count(ITEM_CODE) \n"
                            + "from item_master\n"
                            + "where  STATUS!='Inactive' and (lower(ITEM_CODE) LIKE lower('%" + searchData + "%')  or  lower(ITEM_NAME) LIKE lower('%" + searchData + "%') or lower(ITEM_UOM) LIKE lower('%" + searchData + "%'))");
                }
            } else {
                query = session.createQuery("from ItemMaster where sno='" + SNo + "' and status!='Inactive'");
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
//**********************Service request details*****************//

    public List<ServiceRequest> RequestListve(String serviceRequestNo, String SNo) {
        List<ServiceRequest> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from ServiceRequest where status!='Inactive' ORDER BY SNo DESC");
            } else {
                query = session.createQuery("from ServiceRequest where status!='Inactive' and serviceRequestNo='" + serviceRequestNo + "'");
            }
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
//**********************Service request details*****************//

    public List<ServiceRequest> RequestList(String serviceRequestNo, String SNo) {
        List<ServiceRequest> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from ServiceRequest where status!='Inactive' ORDER BY SNo DESC");
            } else {
                query = session.createQuery("from ServiceRequest where status!='Inactive' and serviceRequestNo='" + serviceRequestNo + "'");
            }
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
//---------------------service request Approval 1 list---------------------------//

    public List<ServiceRequest> Requestapp(String SNo, String serviceRequestNo) {
        List<ServiceRequest> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from ServiceRequest where status!='Inactive' and (recordstatus='Service Requested') group by serviceRequestNo");
            } else {
                query = session.createQuery("from ServiceRequest where status!='Inactive' and serviceRequestNo='" + serviceRequestNo + "'");
            }
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
//---------------------service request rejected list---------------------------//

    public List<ServiceRequest> serviceRejList(String SNo, String serviceRequestNo) {
        List<ServiceRequest> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from ServiceRequest where status!='Inactive' and recordstatus='Rejected' group by serviceRequestNo");
            } else {
                query = session.createQuery("from ServiceRequest where status!='Inactive' and serviceRequestNo='" + serviceRequestNo + "'");
            }
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
//---------------------material issue list---------------------------//

    public List<ServiceRequest> RequestMapp(String SNo, String serviceRequestNo) {
        List<ServiceRequest> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from ServiceRequest where status!='Inactive' and issueStatus='CFO Approved' group by serviceRequestNo");
            } else {
                query = session.createQuery("from ServiceRequest where status!='Inactive' and serviceRequestNo='" + serviceRequestNo + "'");
            }
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
//---------------------material issue approval list---------------------------//

    public List<ServiceRequest> Requestapp1(String SNo, String serviceRequestNo) {
        List<ServiceRequest> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from ServiceRequest where status!='Inactive' and (recordstatus='GFC Approved' or recordstatus='CFO Approved') group by serviceRequestNo");
            } else {
                query = session.createQuery("from ServiceRequest where status!='Inactive' and serviceRequestNo='" + serviceRequestNo + "'");
            }
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
//---------------------inventory list---------------------------//

    public List<Inventorylist> inventory() {
        List<Inventorylist> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from Inventorylist where status!='Inactive' group by itemCode");
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
//---------------------item details for material issue form ---------------------------//

    public List<ItemMaster> itemCode() throws HibernateException, SQLException {
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
//---------------------item category details for material issue form ---------------------------//

    public List<ItemCategory> itemCate() throws HibernateException, SQLException {
        List<ItemCategory> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from ItemCategory");
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
//---------------------uom details for material issue form ---------------------------//

    public List<UomMaster> uom() throws HibernateException, SQLException {
        List<UomMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from UomMaster");
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
//---------------------material issue details for Approval 1 ---------------------------//

    public List<MaterialIssue> materialIssue(String serviceRequestNo) {
        List<MaterialIssue> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from MaterialIssue where status!='Inactive' and srNo='" + serviceRequestNo + "'");
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
//---------------------material issue details for Approval 1 ---------------------------//

    public List<MaterialIssue> materialIssue1(String serviceRequestNo) {
        List<MaterialIssue> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from MaterialIssue where status!='Inactive' and srNo='" + serviceRequestNo + "' group by miNo");
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
//---------------------service request Approval 1 submit---------------------------//

    public void updateServiceRequest(BigDecimal pk, String recorstatus, String reqQty, String unitPrice, String marginPrice, String totalPrice, String remarks) throws HibernateException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = ("update ServiceRequest set  recordstatus='" + recorstatus + "',qty='" + reqQty + "', unitPrice='" + unitPrice + "' ,margin='" + marginPrice + "' ,totalPrice='" + totalPrice + "', appremarks='" + remarks + "',lastmodifiedDate=current_timestamp() where sno='" + pk + "'");
            Query query = session.createQuery(hql);
            query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
//---------------------service request Approval 2 submit---------------------------//

    public void updateServiceRequest1(BigDecimal pk, String recorstatus, String reqQty, String unitPrice, String marginPrice, String totalPrice, String remarks) throws HibernateException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = ("update ServiceRequest set  recordstatus='" + recorstatus + "',qty='" + reqQty + "', unitPrice='" + unitPrice + "' ,margin='" + marginPrice + "' ,totalPrice='" + totalPrice + "', appremarks1='" + remarks + "', issueStatus='" + recorstatus + "',lastmodifiedDate=current_timestamp() where sno='" + pk + "'");
            Query query = session.createQuery(hql);
            query.executeUpdate();
             tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }finally {
            session.close();
        }
    }
//---------------------material issue approval submit---------------------------//

    public void updateMAterialIssue(String recorstatus, String appstatus, String remarks, String serviceRequestNo, String issuingqty, BigDecimal pk) throws HibernateException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update MaterialIssue set appstatus='" + appstatus + "', appremarks='" + remarks + "',recordstatus='" + recorstatus + "',qty='" + issuingqty + "',lastmodifiedDate=current_timestamp() where sno='" + pk + "'";
            Query query = session.createQuery(hql);
            query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }finally {
            session.close();
        }
    }
//---------------------material issue partial approval submit---------------------------//

    public void updateMAterialPartIssue(String recorstatus, String miNo) throws HibernateException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update MaterialIssue set recordstatus='" + recorstatus + "' where miNo='" + miNo + "'";
            Query query = session.createQuery(hql);
            query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    //------Material Issue Start----------------------------------//
//---------------------material issue list---------------------------//
    public List<MaterialIssue> MIList(String SNo) {
        List<MaterialIssue> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from MaterialIssue where status!='Inactive' group by srNo");
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
    
     //Newly added by lakshmi for dashboard based on from and to dates
    public List<MaterialIssue> MIList1(String SNo,String fromDate,String toDate) {
        List<MaterialIssue> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from MaterialIssue where status!='Inactive' and appstatus='Approved' and lastmodifiedDate >='" + fromDate + "' and lastmodifiedDate <='" + toDate + "' group by srNo");
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
//---------------------material issue auto generation number---------------------------//

    public List<MaterialIssue> getMINo(String miDate) {
        List<MaterialIssue> code = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (miDate != null) {
                query = session.createSQLQuery("SELECT mi_no FROM arete_tms.material_issue where mi_no like '%MI%' ORDER BY sno ASC");
            } else {
                query = session.createQuery("from MaterialIssue where  status!='Inactive' ORDER BY lasttmodifiedDate DESC");
            }
            code = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return code;
    }
//---------------------material issue grid data submit---------------------------//

    public void matissuesave1(MaterialIssue dis) throws HibernateException, SQLException {
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
//---------------------material issue grid data submit---------------------------//

    public void matissuesave(List<MaterialIssue> grid) throws HibernateException, SQLException {
        for (Iterator<MaterialIssue> iterator = grid.iterator(); iterator.hasNext();) {
            MaterialIssue test = (MaterialIssue) iterator.next();
            matissuesave1(test);
        }
    }
//---------------------inventory updation for approved issued materials---------------------------//

    public void updateInventory(String itemCode, String invent) throws HibernateException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = ("update Inventorylist set  stockQty='" + invent + "' where itemCode='" + itemCode + "'");
            Query query = session.createQuery(hql);
            query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }finally {
            session.clear();
            session.close();
        }
    }
//---------------------update service request record status when material issue submit---------------------------//

    public void updateSReq(String srNo, String itemCode, String resordstatus) throws HibernateException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = ("update ServiceRequest set  issueStatus='" + resordstatus + "' where itemCode='" + itemCode + "' and serviceRequestNo='" + srNo + "'");
            Query query = session.createQuery(hql);
            query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        }finally {
            session.clear();
            session.close();
        }
    }
    //------Material Issue End----------------------------------//

    //    Universal Methods
    //**************Global interface method for saving details******************//
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
//**************Global interface method for fetch list values******************//

    @Override
    public List<Class> list(String instanceVariable, String className) {
        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (instanceVariable == "" || instanceVariable == null) {
                query = session.createQuery("from " + className + " where status!='Inactive' and  group by serviceRequestNo");
            } else {
                query = session.createQuery("from " + className + " where status!='Inactive' and sno='" + instanceVariable + "'");
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

    @Override
    public List<Class> list(Integer instanceVariable, String className) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void globalDelete(Integer instanceVariable) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void globalInactive(String instanceVariable, String className) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Class> roleperm(String orgId, String roleName, String submoduleName, String tab) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    //***********service Request for tenant portal**************
    public List<TenantDetails> selectTenant1(String userid) throws HibernateException, SQLException {
        List<TenantDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from TenantDetails where status!='Inactive' and appstatus='CFO Approved' and (vacatestatus!='Vacated' or vacatestatus is null) and tenantId='" + userid + "'");
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

    public List<ServiceRequest> serviceList1(String SNo, String userId1, String serviceRequestNo) {
        List<ServiceRequest> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from ServiceRequest where userId='" + userId1 + "' and status!='Inactive' and recordstatus!='Rejected' group by serviceRequestNo");
            } else {
                query = session.createQuery("from ServiceRequest where userId='" + userId1 + "' and status!='Inactive' and serviceRequestNo='" + serviceRequestNo + "'");
            }
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

}
