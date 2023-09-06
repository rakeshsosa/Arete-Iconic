/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import tenant.classes.AssetDetails;

import tenant.classes.BillPayment;
import tenant.classes.Category;
import tenant.classes.ContractCreation;
import tenant.classes.LandLordDetails;
import tenant.classes.PortalTenantDetails;
import tenant.classes.RolePermission;
import tenant.classes.SubAssetDetails;

import tenant.classes.TenantDetails;
import tenant.classes.TenantType;

import tenant.other.classes.commonInterface;

/**
 *
 * @author ebs
 */
public class TenantPortalDAO extends HibernateDaoSupport implements commonInterface {

    //**************Tenant Details List******************//
    public List<TenantDetails> tenantDetailsList(String userId) {
        List<TenantDetails> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from TenantDetails where status!='Inactive' and tenantId='" + userId + "' and appstatus='CFO Approved'");
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

    public List<PortalTenantDetails> tenantDetailsList1(String userId) {
        List<PortalTenantDetails> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from PortalTenantDetails where status!='Inactive' and tenantId='" + userId + "'");

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

    public List<PortalTenantDetails> gfcApproved(String SNo) {
        List<PortalTenantDetails> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from PortalTenantDetails where status!='Inactive' and appstatus='Submitted'");
            } else {
                query = session.createQuery("from PortalTenantDetails where status!='Inactive' and SNo='" + SNo + "'");
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
    
    public String getTenOrgfileName(String tenantCode) throws HibernateException, SQLException {
        List<PortalTenantDetails> datalist = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        String Image = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from PortalTenantDetails where tenantCode='" + tenantCode + "'");
            datalist = query.list();
            for (PortalTenantDetails cand : datalist) {
                Image = cand.getTenOrgfileName();
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
        return Image;
    }
    
    public byte[] getTenantAttachment(String tenantCode) throws HibernateException, SQLException {
        List<PortalTenantDetails> datalist = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        byte[] Image = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from PortalTenantDetails where tenantCode='" + tenantCode + "'");
            datalist = query.list();
            for (PortalTenantDetails cand : datalist) {
                Image = cand.getTenantAttachment();
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
        return Image;
    }

//**************Fetch Tenant Dues of Service Request******************//
    public void getTenantDuesServ(HttpServletRequest req, HttpServletResponse res, String tenantCode, String receiptType, String srNo) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<BillPayment> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT group_CONCAT(convert(amount,char(8))) AS amount FROM arete_tms.bill_payment WHERE tenant_code='" + tenantCode + "' and receipt_type='" + receiptType + "' and sr_no='" + srNo + "'");
            citydata = query.list();
             if (citydata.isEmpty() || citydata.contains(null)) {
                out.append("a");
            } else {
                out.append(citydata.toString());
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

    //**************Get Permissions******************//
    public List<RolePermission> permmenu(String orgId, String roleName, String submodule, String tab) {
        List<RolePermission> list = null;
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

    //**************Tenant Type Dropdown******************//
    public List<TenantType> tenantType() throws HibernateException, SQLException {
        List<TenantType> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT TENANT_TYPE FROM arete_tms.tenant_type WHERE STATUS!='Inactive' ORDER BY TENANT_TYPE ASC");
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

    //**************Tenant Category Dropdown******************//
    public List<Category> tenantCategory() throws HibernateException, SQLException {
        List<Category> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT TENANT_CATEGORY FROM arete_tms.tenant_category WHERE STATUS!='Inactive' ORDER BY TENANT_CATEGORY ASC");
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
    
     public PortalTenantDetails gettenantAttach(Integer id) {
        Session session = getSessionFactory().openSession();
        PortalTenantDetails exp = (PortalTenantDetails) session.get(PortalTenantDetails.class, id);
        session.close();
        return exp;
    }

//**************Fetch Tenant Details******************//
    public List<TenantDetails> tenantDetails(String tenantCode) throws HibernateException, SQLException {
        List<TenantDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from TenantDetails where tenantCode='" + tenantCode + "'");
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

    public List<BillPayment> listBill() throws HibernateException, SQLException {
        List<BillPayment> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from BillPayment where extra1='PDC' and status!='Inactive'");
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
                query = session.createQuery("from " + className + " where status!='Inactive'");
            } else {
                query = session.createQuery("from " + className + " where status!='Inactive' and SNo='" + instanceVariable + "'");

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

    public List<Class> list1(String instanceVariable, String className) {
        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (instanceVariable == "" || instanceVariable == null) {
                query = session.createQuery("from " + className + " where status!='Inactive'");
            } else {
                query = session.createQuery("from " + className + " where status!='Inactive' and SNo='" + instanceVariable + "'");

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
    
    public List<LandLordDetails> landLordDetailsList(String landlordId) {
        List<LandLordDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from LandLordDetails where landlordId='" + landlordId + "'");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
    
     public List<AssetDetails> assetDetails(String assetName) {
        List<AssetDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from AssetDetails where status!='Inactive' and assetCode='" + assetName + "'");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
     
      public List<SubAssetDetails> subassDetails(String assetName, String subassDetails) {
        List<SubAssetDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from SubAssetDetails where status!='Inactive' and assetCode='" + assetName + "' and subAssetCode='" + subassDetails + "'");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
    
     public List<ContractCreation> selectContractCodee(String contractPeriod) throws HibernateException, SQLException {
        List<ContractCreation> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from ContractCreation where contractCode='" + contractPeriod + "'");
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

}
