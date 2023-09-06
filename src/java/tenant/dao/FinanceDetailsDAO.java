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
import tenant.classes.AssetClass;
import tenant.classes.LedgerMasterEntity;
import tenant.classes.Liabilities;
import tenant.classes.ManageInvoice;
import tenant.classes.ReceivableInvoiceEntity;
import tenant.classes.RentDetailsEntity;
import tenant.classes.RentDetailsEntity1;
import tenant.classes.RentInvoice;
import tenant.classes.ServiceDetaiilsInvoice;
import tenant.classes.ServiceDetails;
import tenant.classes.StandardInvoice;
import tenant.classes.VoucherMasterEntity;

/**
 *
 * @author ebs-sdd41
 */
public class FinanceDetailsDAO extends HibernateDaoSupport {
    
    @SuppressWarnings("unchecked")
    public List<AssetClass> assetList(String userId, String orgId, String SNo)
            throws HibernateException, SQLException {
        List<AssetClass> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {

                if ((userId.equalsIgnoreCase("Admin"))) {
                    query = session.createQuery("from AssetClass where userId='" + userId + "'");
                } else {
                    query = session.createQuery("from AssetClass where userId='" + userId + "'");

                }

            } else {
                query = session.createQuery("from AssetClass where SNo='" + SNo + "'");
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
    
    public void assetSave(AssetClass dis) {
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
    
    public void assetSaveList(List<AssetClass> grid) {
        for (Iterator<AssetClass> iterator = grid.iterator(); iterator.hasNext();) {
            AssetClass test = (AssetClass) iterator.next();
            assetSave(test);
        }
    }
    
    @SuppressWarnings("unchecked")
    public List<Liabilities> liabilitiesList(String userId, String orgId, String SNo)
            throws HibernateException, SQLException {
        List<Liabilities> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {

                if ((userId.equalsIgnoreCase("Admin"))) {
                    query = session.createQuery("from Liabilities where userId='" + userId + "'");
                } else {
                    query = session.createQuery("from Liabilities where userId='" + userId + "'");

                }

            } else {
                query = session.createQuery("from Liabilities where SNo='" + SNo + "'");
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
    
    public void liabilitiesSave(Liabilities dis) {
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
    
    public void liabilitiesSaveList(List<Liabilities> grid) {
        for (Iterator<Liabilities> iterator = grid.iterator(); iterator.hasNext();) {
            Liabilities test = (Liabilities) iterator.next();
            liabilitiesSave(test);
        }
    }
    
    public void invoiceSave(StandardInvoice dis) { 
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
    
    public void invoiceSaveList(List<StandardInvoice> grid) {
        for (Iterator<StandardInvoice> iterator = grid.iterator(); iterator.hasNext();) {
            StandardInvoice test = (StandardInvoice) iterator.next();
            invoiceSave(test);
        }
    }
    
    public void serviceDetailsSave(ServiceDetaiilsInvoice dis) {
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
    
    public void serviceDetailsSaveList(List<ServiceDetaiilsInvoice> grid) {
        for (Iterator<ServiceDetaiilsInvoice> iterator = grid.iterator(); iterator.hasNext();) {
            ServiceDetaiilsInvoice test = (ServiceDetaiilsInvoice) iterator.next();
            serviceDetailsSave(test);
        }
    }
    
    @SuppressWarnings("unchecked")
    public List<StandardInvoice> invoiceList(String userId, String orgId, String SNo)
            throws HibernateException, SQLException {
        List<StandardInvoice> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {

                if ((userId.equalsIgnoreCase("Admin"))) {
                    query = session.createQuery("from StandardInvoice where userId='" + userId + "' and invoiceName='Standard' and invoiceType='Service' and recordStatus=''");
                } else {
                    query = session.createQuery("from StandardInvoice where userId='" + userId + "'  and invoiceName='Standard' and invoiceType='Service' and recordStatus=''");

                }

            } else {
                query = session.createQuery("from StandardInvoice where SNo='" + SNo + "'");
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
    
    @SuppressWarnings("unchecked")
    public List<StandardInvoice> rentInvoiceGeneralList(String userId, String orgId, String SNo)
            throws HibernateException, SQLException {
        List<StandardInvoice> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {

                if ((userId.equalsIgnoreCase("Admin"))) {
                    query = session.createQuery("from StandardInvoice where userId='" + userId + "' and invoiceName='Rent' and recordStatus=''");
                } else {
                    query = session.createQuery("from StandardInvoice where userId='" + userId + "' and invoiceName='Rent' and recordStatus=''");

                }

            } else {
                query = session.createQuery("from StandardInvoice where SNo='" + SNo + "' and invoiceName='Rent'");
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
    
    @SuppressWarnings("unchecked")
    public List<StandardInvoice> otherInvoicesList(String userId, String orgId, String SNo)
            throws HibernateException, SQLException {
        List<StandardInvoice> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {

                if ((userId.equalsIgnoreCase("Admin"))) {
                    query = session.createQuery("from StandardInvoice where userId='" + userId + "'  and invoiceName='Standard' and invoiceType!='Service' and recordStatus=''");
                } else {
                    query = session.createQuery("from StandardInvoice where userId='" + userId + "' and invoiceName='Standard' and invoiceType!='Service' and recordStatus=''");

                }

            } else {
                query = session.createQuery("from StandardInvoice where SNo='" + SNo + "' and invoiceName='Standard' and invoiceType!='Service'");
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
    
    public List<StandardInvoice> invoiceCodeinc(String userId, String orgId, String orderNo, String orderStatus, String limit) {
        List<StandardInvoice> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (limit.equals("1")) {
  
                query = session.createQuery("from StandardInvoice ORDER BY SNo");
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
    
    public void newInvoiceSave(ReceivableInvoiceEntity dis) {
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
    
    public void newInvoiceSaveList(List<ReceivableInvoiceEntity> grid) {
        for (Iterator<ReceivableInvoiceEntity> iterator = grid.iterator(); iterator.hasNext();) {
            ReceivableInvoiceEntity test = (ReceivableInvoiceEntity) iterator.next();
            newInvoiceSave(test);
        }
    }
    
    public void rentDetailsEntitySave(RentDetailsEntity1 dis) {
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
    
    public void rentDetailsEntitySaveList(List<RentDetailsEntity1> grid) {
        for (Iterator<RentDetailsEntity1> iterator = grid.iterator(); iterator.hasNext();) {
            RentDetailsEntity1 test = (RentDetailsEntity1) iterator.next();
            rentDetailsEntitySave(test);
        }
    }
    
    public void updateInvoiceStatus(String userId, String status, String Sno) {
        String hql = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("update arete_tms.standard_invoice set record_status='"+status+"' where sno='"+Sno+"'");
            int row = query.executeUpdate();
            // System.out.println(query);
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
    
    @SuppressWarnings("unchecked")
    public List<StandardInvoice> transactionInvoicesList(String userId, String recordStatus, String SNo)
            throws HibernateException, SQLException {
        List<StandardInvoice> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {

                if ((userId.equalsIgnoreCase("Admin"))) {
                    query = session.createQuery("from StandardInvoice where userId='" + userId + "'  and recordStatus='"+recordStatus+"'");
                } else {
                    query = session.createQuery("from StandardInvoice where userId='" + userId + "' and recordStatus='"+recordStatus+"'");

                }

            } else {
                query = session.createQuery("from StandardInvoice where SNo='" + SNo + "' and recordStatus='"+recordStatus+"'");
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
    
    public void manageInvoiceSave(ManageInvoice dis) {
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
    
    public void manageInvoiceSaveList(List<ManageInvoice> grid) {
        for (Iterator<ManageInvoice> iterator = grid.iterator(); iterator.hasNext();) {
            ManageInvoice test = (ManageInvoice) iterator.next();
            manageInvoiceSave(test);
        }
    }
    
    public void ledgerMasterEntitySave(LedgerMasterEntity dis) {
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
    
    public void ledgerMasterEntitySaveList(List<LedgerMasterEntity> grid) {
        for (Iterator<LedgerMasterEntity> iterator = grid.iterator(); iterator.hasNext();) {
            LedgerMasterEntity test = (LedgerMasterEntity) iterator.next();
            ledgerMasterEntitySave(test);
        }
    }
    
    public List<LedgerMasterEntity> ledgerCodeInc(String userId, String orgId, String orderNo, String orderStatus, String limit) {
        List<LedgerMasterEntity> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (limit.equals("1")) {
  
                query = session.createQuery("from LedgerMasterEntity ORDER BY ledgerMasterPk");
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
    
    @SuppressWarnings("unchecked")
    public List<LedgerMasterEntity> ledgerList(String userId, String orgId, String SNo)
            throws HibernateException, SQLException {
        List<LedgerMasterEntity> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {

                if ((userId.equalsIgnoreCase("Admin"))) {
                    query = session.createQuery("from LedgerMasterEntity");
                } else {
                    query = session.createQuery("from LedgerMasterEntity");

                }

            } else {
                query = session.createQuery("from LedgerMasterEntity where ledgerMasterPk='" + SNo + "'");
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
    
    @SuppressWarnings("unchecked")
    public List<StandardInvoice> agingInvoicesList(String userId, String SNo)
            throws HibernateException, SQLException {
        List<StandardInvoice> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {

                if ((userId.equalsIgnoreCase("Admin"))) {
                    query = session.createQuery("from StandardInvoice where userId='" + userId + "' and cast(due_date as date)<= cast(current_timestamp as date) and amountPaid=0");
                } else {
                    query = session.createQuery("from StandardInvoice where userId='" + userId + "' and cast(due_date as date)<= cast(current_timestamp as date) and amountPaid=0");
                }

            } else {
                query = session.createQuery("from StandardInvoice where SNo='" + SNo + "'");
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
    
    public void updatePaymentStatus(String userId, String paymentType, String transactionRefNo, String paymentDate, String amountPaid, String Sno) {
        String hql = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("update arete_tms.standard_invoice set payment_type='"+paymentType+"', transaction_ref_no='"+transactionRefNo+"', "
                    + " amt_paid='"+amountPaid+"' where sno='"+Sno+"'");  //payment_date='"+paymentDate+"',
            int row = query.executeUpdate();
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
    
    public void invoiceProcessingStatus(String userId, String invoiceProcessingStatus, String Sno) {
        String hql = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("update arete_tms.standard_invoice set processing_status='"+invoiceProcessingStatus+"' where sno='"+Sno+"'");  //payment_date='"+paymentDate+"',
            int row = query.executeUpdate();
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
    
    public void voucherMasterEntitySave(VoucherMasterEntity dis) {
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
    
    public void voucherMasterEntitySaveList(List<VoucherMasterEntity> grid) {
        for (Iterator<VoucherMasterEntity> iterator = grid.iterator(); iterator.hasNext();) {
            VoucherMasterEntity test = (VoucherMasterEntity) iterator.next();
            voucherMasterEntitySave(test);
        }
    }
    
    public List<VoucherMasterEntity> voucherCodeInc(String userId, String orgId, String orderNo, String orderStatus, String limit) {
        List<VoucherMasterEntity> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (limit.equals("1")) {
  
                query = session.createQuery("from VoucherMasterEntity ORDER BY voucherPk");
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
    
    public void ledgerVoucherProcessingStatus(String userId, String voucherProcessingStatus, String Sno) {
        String hql = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("update arete_tms.standard_invoice set ledger_voucher_status='"+voucherProcessingStatus+"' where sno='"+Sno+"'");  //payment_date='"+paymentDate+"',
            int row = query.executeUpdate();
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
    
    public void insertQueryForLedgerReport(String QueryInsert) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = null;
        try {

            hql = QueryInsert;

            Query query = session.createSQLQuery(hql);
            int row = query.executeUpdate();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        tx.commit();
        session.close();
    }
    
    public void fetchLedgerReportDetails(HttpServletRequest req, HttpServletResponse res, String userId, String ledgerNo, String fromDate,
            String toDate) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;

        StringBuffer result = new StringBuffer();
        Session session = getSessionFactory().openSession();

        try {
//            tx = session.beginTransaction();
            String query;
            query = "select 1 from arete_tms.report_subledgerreport('"+userId+"', '"+ledgerNo+"', '"+fromDate+"', '"+toDate+"');";
            insertQueryForLedgerReport(query);
        } catch(Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public void fetchAgingReportDetails(HttpServletRequest req, HttpServletResponse res, String userId) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;

        StringBuffer result = new StringBuffer();
        Session session = getSessionFactory().openSession();

        try {
//            tx = session.beginTransaction();
            String query;
            query = "select 1 from arete_tms.report_agingreport('"+userId+"');";
            insertQueryForLedgerReport(query);
        } catch(Exception ex) {
            ex.printStackTrace();
        }
    }
    
    @SuppressWarnings("unchecked")
    public List<VoucherMasterEntity> voucherList(String userId, String orgId, String SNo)
            throws HibernateException, SQLException {
        List<VoucherMasterEntity> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {

                if ((userId.equalsIgnoreCase("Admin"))) {
                    query = session.createQuery("from VoucherMasterEntity");
                } else {
                    query = session.createQuery("from VoucherMasterEntity");
                }
            } else {
                query = session.createQuery("from VoucherMasterEntity where voucherPk='" + SNo + "'");
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
}
