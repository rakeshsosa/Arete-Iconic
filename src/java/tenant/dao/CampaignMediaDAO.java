/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.dao;

import java.io.IOException;
import java.io.PrintWriter;
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
import tenant.classes.CampaignMedia;
import tenant.other.classes.commonInterface;

/**
 * CAMPMEDIA
 *
 * @author ebs-sdd27
 */
public class CampaignMediaDAO extends HibernateDaoSupport implements commonInterface {

    //================CampigmMedia Save================================
    public void CampaignSave(CampaignMedia dis) throws HibernateException, SQLException {
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

    public void campaignsave1(List<CampaignMedia> grid) throws HibernateException, SQLException {
        for (Iterator<CampaignMedia> iterator = grid.iterator(); iterator.hasNext();) {
            CampaignMedia test = (CampaignMedia) iterator.next();
            CampaignSave(test);
        }
    }

    //================CampigmMedia Code Check================================
    public List<CampaignMedia> campaignMediaCodelist(String campaignMediaName) {
        List<CampaignMedia> Code = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (campaignMediaName != null) {
                query = session.createSQLQuery("SELECT media_Code from arete_tms.campaign_media where media_Code like '%CAMPMEDIA%'");
            } else {
                query = session.createQuery("from CampaignMedia where  status!='Inactive' ORDER BY lasttmodifiedDate DESC");
            }
            Code = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return Code;
    }

    //=================  Campaign Media Validation==============
    public void mediaNameAvaliablity(HttpServletRequest req, HttpServletResponse res, String mediaName) throws HibernateException, SQLException, IOException {

        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        List<CampaignMedia> ddNums = null;
        StringBuffer result = new StringBuffer();
        String s = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from CampaignMedia where mediaName='" + mediaName + "'");
            ddNums = query.list();

            if (ddNums.isEmpty()) {
                s = "Data Not Exist";
                //System.out.println(s);
            } else {
                s = "Data Already Exists";
                // System.out.println(s);
            }
            out.append(s);

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

    //=============Campaign Media List==============
//    public List<CampaignMedia> campaignMediaList(String userId, String orgId, String SNo) throws HibernateException, SQLException {
//
//        List<CampaignMedia> datalist = null;
//        Transaction tx = null;
//        Session session = getSessionFactory().openSession();
//        Query query = null;
//        try {
//            tx = session.beginTransaction();
//            if (SNo == null) {
//                query = session.createQuery("from CampaignMedia where status!='Inactive'");
//
//            } else {
//                query = session.createQuery("from CampaignMedia where sno='" + SNo + "' and status!='Inactive'");
//            }
//
//            datalist = query.list();
//            tx.commit();
//        } catch (HibernateException e) {
//            if (tx != null) {
//                tx.rollback();
//            }
//            e.printStackTrace();
//        } finally {
//            session.close();
//        }
//        return datalist;
//    }
//    CampaignMedia
    @Override
    public void globalSave(Object transientInstance) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Class> list(String instanceVariable, String className) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        List<Class> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (instanceVariable.equals("")) {
                query = session.createQuery("from " + className + " where status!='Inactive'");

            } else {
                query = session.createQuery("from " + className + " where sno='" + instanceVariable + "' and status!='Inactive'");
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
