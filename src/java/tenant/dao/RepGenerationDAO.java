
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

public class RepGenerationDAO extends HibernateDaoSupport {
   
      public List<String> areaList() throws HibernateException, SQLException {
        List<String> datalist15 = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct area_name from arete_invoice.wmms_customer_registration order by area_name");
            System.out.println(query);
            datalist15 = query.list();
            tx.commit();
        } catch (HibernateException e) {

            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist15;
    }
      
      
      
      public List<String> blockList() throws HibernateException, SQLException {
        List<String> datalist15 = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct block from arete_invoice.wmms_customer_registration order by block");
            System.out.println(query);
            datalist15 = query.list();
            tx.commit();
        } catch (HibernateException e) {

            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist15;
    }
      
      
      public List<String> reconsileStatus() throws HibernateException, SQLException {
        List<String> datalist15 = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery(" select distinct reconsile_status from arete_invoice.wmms_customer_payment order by reconsile_status");
            System.out.println(query);
            datalist15 = query.list();
            tx.commit();
        } catch (HibernateException e) {

            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist15;
    }
      
      
       public List<String> billRestrictionStatus() throws HibernateException, SQLException {
        List<String> datalist15 = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct record_status from arete_invoice.wmms_customer_registration order by record_status");
            System.out.println(query);
            datalist15 = query.list();
            tx.commit();
        } catch (HibernateException e) {

            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist15;
    }
       
       
    public List<String> MobilebillRestrictionStatus() throws HibernateException, SQLException {
        List<String> datalist15 = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct mobile_status from arete_invoice.wmms_customer_registration order by mobile_status");
            System.out.println(query);
            datalist15 = query.list();
            tx.commit();
        } catch (HibernateException e) {

            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist15;
    }   
    
    
    
    public List<String> CustomerRegIsMobileopted() throws HibernateException, SQLException {
        List<String> datalist15 = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct is_mobile_opted from arete_invoice.wmms_customer_registration order by is_mobile_opted");
            System.out.println(query);
            datalist15 = query.list();
            tx.commit();
        } catch (HibernateException e) {

            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist15;
    }   
    
    
    public List<String> ReconsileStatus() throws HibernateException, SQLException {
        List<String> datalist15 = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct reconsile_status from  arete_invoice.wmms_customer_payment order by reconsile_status");
            System.out.println(query);
            datalist15 = query.list();
            tx.commit();
        } catch (HibernateException e) {

            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist15;
    } 
    
    
    
     public List<String> PaymentMode() throws HibernateException, SQLException {
        List<String> datalist15 = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
           // query = session.createSQLQuery("select distinct payment_mode from  arete_invoice.wmms_customer_payment order by payment_mode");
            
            query = session.createSQLQuery("select distinct payment_mode from  arete_invoice.wmms_customer_payment where payment_mode !='Cash/Card Payment Reverted' order by payment_mode");
            System.out.println(query);
            datalist15 = query.list();
            tx.commit();
        } catch (HibernateException e) {

            e.printStackTrace();
        } finally {
            session.close();
        }
        return datalist15;
    } 
    
    
  
   
}
