/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.dao;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.web.multipart.MultipartFile;
import tenant.classes.AMCType;

import tenant.classes.BilltoLocation;

import tenant.classes.TenantType;
import tenant.classes.Category;
import tenant.classes.CommonUtility;
import tenant.classes.ComplaintType;
import tenant.classes.LandLordDetails;
import tenant.classes.ContractCategory;
import tenant.classes.ContractClassification;
import tenant.classes.CurrencyRate;
import tenant.classes.DeliveryLocation;
import tenant.classes.DocumentCategory;
import tenant.classes.DocumentType;
import tenant.classes.FlatType;
import tenant.classes.IndividualUitlity;

import tenant.classes.InsuranceDetails;
import tenant.classes.InsuranceMaster;
import tenant.classes.ItemCategory;
import tenant.classes.ItemMaster;
import tenant.classes.ItemsStore;
import tenant.classes.LandlordAttach;
import tenant.classes.LeadReferral;
import tenant.classes.MasterTerms;
import tenant.classes.RolePermission;
import tenant.classes.ServiceRequestType;
import tenant.classes.StoreCategory;
import tenant.classes.StoreMaster;
import tenant.classes.StoreTypeMaster;
import tenant.classes.SupplierMaster;
import tenant.classes.UomMaster;
import tenant.other.classes.commonInterface;

/**
 *
 * @author ebs
 */
public class MasterDAO extends HibernateDaoSupport implements commonInterface {

    private static final String dir = System.getProperty("user.dir");

    //---------------Land Lord master---------------------------//
//Land Lord Code Autogenerate
    public List<LandLordDetails> LandlordCodeGen(String recordNo, String landlordId, String appStatus) {
        List<LandLordDetails> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (recordNo != null) {
                query = session.createQuery("from ContractCategory where recordNo='" + recordNo + "' and approvalStatus='" + appStatus + "' and status!='Inactive'");
            } else if (landlordId != null) {
                query = session.createSQLQuery("SELECT landlord_id FROM arete_tms.land_lord_details where landlord_id like '%LL%' ");

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
// Landlord Attachment Download

    public LandlordAttach getlandlordAttach(Integer id) {
        Session session = getSessionFactory().openSession();
        LandlordAttach exp = (LandlordAttach) session.get(LandlordAttach.class, id);
        session.close();
        return exp;
    }
// Landlord Attachment 

    public List<LandlordAttach> landlordDocuments(String landlordId) {
        List<LandlordAttach> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from LandlordAttach where landlordId='" + landlordId + "' and status!='Inactive'");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
// Landlord details inactivate 

    public void landattachmentDelete(Integer sno)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("delete from LandlordAttach where sno='" + sno + "'");
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
// Landlord Attachment submit

    public void landDocumentsSave(LandlordAttach transientInstance) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.save(transientInstance);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();

        } finally {
            session.clear();
            session.close();
        }
    }
// Landlord Attachment submit

    public void docSave(List<LandlordAttach> grid) throws HibernateException, SQLException {
        for (Iterator<LandlordAttach> iterator = grid.iterator(); iterator.hasNext();) {
            LandlordAttach sales = (LandlordAttach) iterator.next();
            landDocumentsSave(sales);
        }
    }

    public void saveLandlordAttach(List<LandlordAttach> bdpfFile) {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            Iterator<LandlordAttach> itr = bdpfFile.iterator();
            while (itr.hasNext()) {
                LandlordAttach next = itr.next();
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

// Landlord name uniquness
    public void fetchllName(HttpServletRequest req, HttpServletResponse res, String landlordName, String landlordCategory) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<LandLordDetails> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM LandLordDetails where ((lower(landlordName) like lower('" + landlordName + "')) or (upper (landlordName) like upper ('" + landlordName + "'))) and ((lower(landlordCategory) like lower('" + landlordCategory + "')) or (upper (landlordCategory) like upper ('" + landlordCategory + "'))) ");
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
// Landlord contact number uniquness

    public void fetchllCono(HttpServletRequest req, HttpServletResponse res, String landlordContactno) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<LandLordDetails> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM LandLordDetails where ((lower(landlordContactno) like lower('" + landlordContactno + "')) or (upper (landlordContactno) like upper ('" + landlordContactno + "'))) ");
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
// Landlord work contact number uniquness

    public void fetchllWcono(HttpServletRequest req, HttpServletResponse res, String landlordWorkContactno) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<LandLordDetails> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM LandLordDetails where ((lower(landlordWorkContactno) like lower('" + landlordWorkContactno + "')) or (upper (landlordWorkContactno) like upper ('" + landlordWorkContactno + "'))) ");
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
// Landlord email uniquness

    public void fetchllEmail(HttpServletRequest req, HttpServletResponse res, String landlordEmailid) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<LandLordDetails> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM LandLordDetails where ((lower(landlordEmailid) like lower('" + landlordEmailid + "')) or (upper (landlordEmailid) like upper ('" + landlordEmailid + "'))) ");
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
// Landlord crno uniquness

    public void fetchCrno(HttpServletRequest req, HttpServletResponse res, String crIdNo) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<LandLordDetails> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM LandLordDetails where ((lower(crIdNo) like lower('" + crIdNo + "')) or (upper (crIdNo) like upper ('" + crIdNo + "'))) ");
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
    //---------------Tenant Category master---------------------------//
// Tenant Category Autogeneration

    public Integer getTCNo() throws HibernateException, SQLException {
        List<Category> datalist = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        Integer tsno = null;
        try {
            query = session.createQuery("from Category order by sno DESC");
            query.setMaxResults(1);
            datalist = query.list();
            if (datalist.size() == 0) {
                tsno = 0;
            } else {
                Category tc = datalist.get(0);
                tsno = tc.getSno();
            }
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tsno;
    }
// tenant category uniquness

    public void fetchCategory(HttpServletRequest req, HttpServletResponse res, String tenantCategory) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<Category> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM Category where ((lower(tenantCategory) like lower('" + tenantCategory + "')) or (upper (tenantCategory) like upper ('" + tenantCategory + "'))) and status!='Inactive'");
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

    //---------------Tenant Type master---------------------------//
//   Tenant Type Autogeneration
    public Integer getTTNo() throws HibernateException, SQLException {
        List<TenantType> datalist = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        Integer tsno = null;
        try {

            query = session.createQuery("from TenantType order by sno DESC");
            query.setMaxResults(1);
            datalist = query.list();
            if (datalist.size() == 0) {
                tsno = 0;
            } else {
                TenantType tc = datalist.get(0);
                tsno = tc.getSno();
            }
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tsno;
    }

    public Integer getFlatTypeNo() throws HibernateException, SQLException {
        List<FlatType> datalist = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        Integer tsno = null;
        try {

            query = session.createQuery("from FlatType order by sno DESC");
            query.setMaxResults(1);
            datalist = query.list();
            if (datalist.size() == 0) {
                tsno = 0;
            } else {
                FlatType tc = datalist.get(0);
                tsno = tc.getSno();
            }
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return tsno;
    }
// tenant type uniquness

    public void fetchType(HttpServletRequest req, HttpServletResponse res, String tenantType) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<TenantType> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM TenantType where ((lower(tenantType) like lower('" + tenantType + "')) or (upper (tenantType) like upper ('" + tenantType + "'))) and status!='Inactive'");
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

    public void fetchFlatType(HttpServletRequest req, HttpServletResponse res, String flatType) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<TenantType> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM FlatType where ((lower(flatType) like lower('" + flatType + "')) or (upper (flatType) like upper ('" + flatType + "'))) and status!='Inactive'");
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

    //---------------Insurance Details--------------------------//
    public List<InsuranceDetails> InsuranceDetailslist(String sno) {
        List<InsuranceDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from InsuranceDetails where status!='Inactive' and sno='" + sno + "'");
            } else {
                query = session.createQuery("from InsuranceDetails where status!='Inactive'");
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

    public void InsuranceDetailsSave(InsuranceDetails transientInstance) {
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

    ////InsuranceMaster Unique method    
    public void selectInsuranceCompany(HttpServletRequest req, HttpServletResponse res, String bnum) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<InsuranceMaster> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select INSURANCE_COMPANY_NAME\n"
                    + "FROM arete_tms.insurance_master\n"
                    + "where INSURANCE_COMPANY_NAME='" + bnum + "' and STATUS!='Inactive'");
            citydata = query.list();
            if (citydata.isEmpty()) {
                out.append("Available");

            } else {
                out.append("Already Exists.Enter another");
            }
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    public void selectInsuranceCompanyActive(HttpServletRequest req, HttpServletResponse res, String bnum) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<InsuranceMaster> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select INSURANCE_COMPANY_NAME\n"
                    + "FROM arete_tms.insurance_master\n"
                    + "where INSURANCE_COMPANY_NAME='" + bnum + "'");
            citydata = query.list();
            if (citydata.isEmpty()) {
                out.append("Available");

            } else {
                out.append("Already Exists.Enter another");
            }
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    ////InsuranceMaster Unique method    
    public void selectInsuranceDetails(HttpServletRequest req, HttpServletResponse res, String sno) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<InsuranceMaster> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select *\n"
                    + "FROM arete_tms.insurance_master\n"
                    + "where SNO='" + sno + "' and STATUS!='Inactive'");
            citydata = query.list();
            if (citydata.isEmpty()) {
                out.append("Available");

            } else {
                out.append("Already Exists.Enter another");
            }
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    //---------------Contract Category--------------------------//
    public List<ContractCategory> ContractCategorylist(String sno) {
        List<ContractCategory> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from ContractCategory where status!='Inactive' and sno='" + sno + "'");
            } else {
                query = session.createQuery("from ContractCategory where status!='Inactive'");
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
    
    public List<DocumentCategory> DocumentCategorylist(String sno) {
        List<DocumentCategory> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from DocumentCategory where status!='Inactive' and sno='" + sno + "'");
            } else {
                query = session.createQuery("from DocumentCategory where status!='Inactive'");
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
    
    public List<DocumentType> DocumentTypeList(String sno) {
        List<DocumentType> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from DocumentType where status!='Inactive' and sno='" + sno + "'");
            } else {
                query = session.createQuery("from DocumentType where status!='Inactive'");
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

    //contract Category Id Autogenerate
    public List<ContractCategory> CategoryIdlist(String recordNo, String materialCode, String appStatus) {
        List<ContractCategory> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (recordNo != null) {
                query = session.createQuery("from ContractCategory where recordNo='" + recordNo + "' and approvalStatus='" + appStatus + "' and status!='Inactive'");
            } else if (materialCode != null) {
                query = session.createSQLQuery("SELECT CONTRACT_CATEGORY_ID FROM arete_tms.contract_category where CONTRACT_CATEGORY_ID like '%CC%' and STATUS!='Inactive'");

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

    ////Contract Category Unique method    
    public void selectCategory(HttpServletRequest req, HttpServletResponse res, String bnum) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<ContractCategory> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select CONTRACT_CATEGORY\n"
                    + "FROM arete_tms.contract_category\n"
                    + "where CONTRACT_CATEGORY='" + bnum + "' and STATUS!='Inactive'");
            citydata = query.list();
            if (citydata.isEmpty()) {
                out.append("Available");

            } else {
                out.append("Already Exists.Enter another");
            }
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    public void selectUtilityName(HttpServletRequest req, HttpServletResponse res, String bnum) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<CommonUtility> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select comUtility\n"
                    + "FROM arete_tms.common_comutility\n"
                    + "where comUtility='" + bnum + "' and STATUS!='Inactive'");
            citydata = query.list();
            if (citydata.isEmpty()) {
                out.append("Available");

            } else {
                out.append("Already Exists.Enter another");
            }
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    public void selectUtility(HttpServletRequest req, HttpServletResponse res, String bnum) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<CommonUtility> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select utility\n"
                    + "FROM arete_tms.individual_utility\n"
                    + "where utility='" + bnum + "' and STATUS!='Inactive'");
            citydata = query.list();
            if (citydata.isEmpty()) {
                out.append("Available");

            } else {
                out.append("Already Exists.Enter another");
            }
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    ////Contract Category delete 
    public void categoryDel(String sno) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update ContractCategory set status='Inactive' where sno=" + sno + "";
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

    //---------------Contract Classification--------------------------//
    public List<ContractClassification> ContractClassificationlist(String sno) {
        List<ContractClassification> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from ContractClassification where status!='Inactive' and sno='" + sno + "'");
            } else {
                query = session.createQuery("from ContractClassification where status!='Inactive'");
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

    //contract Classification Id Autogenerate
    public List<ContractClassification> ClassificationIdlist(String recordNo, String materialCode, String appStatus) {
        List<ContractClassification> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (recordNo != null) {
                query = session.createQuery("from ContractClassification where recordNo='" + recordNo + "' and approvalStatus='" + appStatus + "' and status!='Inactive'");
            } else if (materialCode != null) {
                query = session.createSQLQuery("SELECT CLASSIFICATION_ID FROM arete_tms.contract_classification where CLASSIFICATION_ID \n"
                        + "like '%CCL%' and STATUS!='Inactive'");

            } else {
                query = session.createQuery("from ContractClassification where  reviewStatus='" + appStatus + "' and status!='Inactive' ORDER BY lastmodifiedDate DESC");
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

    ////Contract Classification Unique method    
    public void selectClassification(HttpServletRequest req, HttpServletResponse res, String bnum) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<ContractCategory> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select CONTRA_CLASSIFICATION\n"
                    + "FROM arete_tms.contract_classification\n"
                    + "where CONTRA_CLASSIFICATION='" + bnum + "' and STATUS!='Inactive'");
            citydata = query.list();
            if (citydata.isEmpty()) {
                out.append("Available");

            } else {
                out.append("Already Exists.Enter another");
            }
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    //InsuranceMaster Id Autogenerate
    public List<InsuranceMaster> InsuranceMasterIdlist(String recordNo, String materialCode, String appStatus) {
        List<InsuranceMaster> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (recordNo != null) {
                query = session.createQuery("from InsuranceMaster where recordNo='" + recordNo + "' and approvalStatus='" + appStatus + "' and status!='Inactive'");
            } else if (materialCode != null) {
                query = session.createSQLQuery("SELECT INSURANCE_COMPANY_ID FROM arete_tms.insurance_master where INSURANCE_COMPANY_ID like '%INSCOM%' ");

            } else {
                query = session.createQuery("from InsuranceMaster where  reviewStatus='" + appStatus + "' and status!='Inactive' ORDER BY lastmodifiedDate DESC");
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

    //--------For Dynamic Label and Field Activation ---------//
    //------Function Starts----------------------------------//
    public List<String> contraCategoryForm(String link, String tab) {
        List<String> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("SELECT SNO,Field_Name,Field_Status,Is_Required FROM arete_tms.form_label_mapping where Jsp_Page='" + link + "' and TAB_NAME='" + tab + "'");

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    //------Function End----------------------------------//
    @Override
    public void globalSave(Object transientInstance) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
    
    

    @Override
    public void globalDelete(Integer instanceVariable) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    //list page display Item Cat in Item master
    public List<ItemCategory> itemCatjoin()
            throws HibernateException, SQLException {
        List<ItemCategory> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select i1.ITEM_CATEGORY,i1.CATEGORY_ID\n"
                    + "FROM arete_tms.item_category i1,arete_tms.item_master i2\n"
                    + "where i2.ITEM_CATEGORY=i1.ITEM_CATEGORY");

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

    //newly added by lakshmi based on from and to dates
     public List<ItemCategory> itemCatjoin1(String fromDate,String toDate)
            throws HibernateException, SQLException {
        List<ItemCategory> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select i1.ITEM_CATEGORY,i1.CATEGORY_ID\n"
                    + "FROM arete_tms.item_category i1,arete_tms.item_master i2\n"
                    + "where i2.ITEM_CATEGORY=i1.ITEM_CATEGORY and i1.STATUS!='Inactive' and i1.LASTMODIFIED_DATE >='" + fromDate + "' and i1.LASTMODIFIED_DATE <='" + toDate + "'");

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

    //list page display Item UOM in Item master 
    public List<UomMaster> itemUomjoin()
            throws HibernateException, SQLException {
        List<UomMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select i1.UOM_NAME,i1.UOM_ID\n"
                    + "FROM arete_tms.uom_master i1,arete_tms.item_master i2\n"
                    + "where i1.UOM_NAME=i2.ITEM_UOM");

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
    public List<UomMaster> itemUomjoin1(String fromDate,String toDate)
            throws HibernateException, SQLException {
        List<UomMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select i1.UOM_NAME,i1.UOM_ID\n"
                    + "FROM arete_tms.uom_master i1,arete_tms.item_master i2\n"
                    + "where i1.UOM_NAME=i2.ITEM_UOM and i1.STATUS!='Inactive' and i1.LASTMODIFIED_DATE >='" + fromDate + "' and i1.LASTMODIFIED_DATE <='" + toDate + "'");

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

    //to fetch item cat id in item master form
    public List<ItemCategory> catId(String sno, String catId)
            throws HibernateException, SQLException {
        List<ItemCategory> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select i1.ITEM_CATEGORY,i1.CATEGORY_ID \n"
                    + "from arete_tms.item_category i1 , arete_tms.item_master i2 \n"
                    + "where i1.CATEGORY_ID='" + catId + "' and i2.SNO='" + sno + "'");

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

    //to fetch item uom id in item master form
    public List<UomMaster> uomId(String sno, String uomId)
            throws HibernateException, SQLException {
        List<UomMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select i1.UOM_NAME,i1.UOM_ID\n"
                    + "FROM arete_tms.uom_master i1,arete_tms.item_master i2\n"
                    + "where i1.UOM_ID='" + uomId + "' and i2.SNO='" + sno + "'");

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

    public List<Class> listActive1(String instanceVariable, String className) {
        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (instanceVariable == "" || instanceVariable == null) {
                query = session.createQuery("from " + className + " ");
            } else {
                query = session.createQuery("from " + className + " where sno='" + instanceVariable + "'");
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

    public List<Class> listActive(String instanceVariable, String className) {
        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (instanceVariable == "" || instanceVariable == null) {
                query = session.createQuery("from " + className + "");
            } else {
                query = session.createQuery("from " + className + " where sno='" + instanceVariable + "'");
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
    //newly added by lakshmi for dashboard based on from and to dates
    public List<Class> listActive1(String instanceVariable, String className,String fromDate,String toDate) {
        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (instanceVariable == "" || instanceVariable == null) {
                query = session.createQuery("from " + className + " where status!='Inactive' and lastmodifiedDate >='" + fromDate + "' and lastmodifiedDate <='" + toDate + "'");
            } else {
                query = session.createQuery("from " + className + " where status!='Inactive' and sno='" + instanceVariable + "' and lastmodifiedDate >='" + fromDate + "' and lastmodifiedDate <='" + toDate + "'");
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

    public List<Class> list5(String instanceVariable, String className) {
        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (instanceVariable == "" || instanceVariable == null) {
                query = session.createQuery("from " + className + " where status!='Inactive'");
            } else {
                query = session.createQuery("from " + className + " where status!='Inactive' and itemCode='" + instanceVariable + "'");
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

    public List<Class> list2(String instanceVariable, String className) {
        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (instanceVariable == "" || instanceVariable == null) {
                query = session.createQuery("from " + className + " where status!='Inactive'");
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

    //Supplier Code Autogenerate
    public List<SupplierMaster> SupplierCodeGen(String recordNo, String materialCode, String appStatus) {
        List<SupplierMaster> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (recordNo != null) {
                query = session.createQuery("from InsuranceMaster where recordNo='" + recordNo + "' and approvalStatus='" + appStatus + "' and status!='Inactive'");
            } else if (materialCode != null) {
                query = session.createSQLQuery("SELECT SUPPLIER_CODE FROM arete_tms.supplier_master where SUPPLIER_CODE like '%SUPP%' ");

            } else {
                query = session.createQuery("from InsuranceMaster where  reviewStatus='" + appStatus + "' and status!='Inactive' ORDER BY lastmodifiedDate DESC");
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

    public void fetchllEmail1(HttpServletRequest req, HttpServletResponse res, String mailId) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<SupplierMaster> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM SupplierMaster where ((lower(mailId) like lower('" + mailId + "')) or (upper (mailId) like upper ('" + mailId + "')))");
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

    public void fetchllEmail2(HttpServletRequest req, HttpServletResponse res, String emailid) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<SupplierMaster> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM SupplierMaster where ((lower(emailid) like lower('" + emailid + "')) or (upper (emailid) like upper ('" + emailid + "')))");
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

    public void accNumFetch(HttpServletRequest req, HttpServletResponse res, String accountNumber) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<LandLordDetails> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM SupplierMaster where ((lower(accountNumber) like lower('" + accountNumber + "')) or (upper (accountNumber) like upper ('" + accountNumber + "')))");
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

    public void contNumFetch(HttpServletRequest req, HttpServletResponse res, String supplierContNum) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<LandLordDetails> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM SupplierMaster where ((lower(supplierContNum) like lower('" + supplierContNum + "')) or (upper (supplierContNum) like upper ('" + supplierContNum + "')))");
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

    //Item Category Autogenerate
    public List<ItemCategory> ItemCatCodeGen(String recordNo, String materialCode, String appStatus) {
        List<ItemCategory> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (recordNo != null) {
                query = session.createQuery("from InsuranceMaster where recordNo='" + recordNo + "' and approvalStatus='" + appStatus + "' and status!='Inactive'");
            } else if (materialCode != null) {
                query = session.createSQLQuery("SELECT CATEGORY_ID FROM arete_tms.item_category where CATEGORY_ID like '%ACCCAT%' ");

            } else {
                query = session.createQuery("from InsuranceMaster where  reviewStatus='" + appStatus + "' and status!='Inactive' ORDER BY lastmodifiedDate DESC");
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

    ////Item Category Unique method    
    public void selectItemCat(HttpServletRequest req, HttpServletResponse res, String bnum) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<ContractCategory> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select ITEM_CATEGORY\n"
                    + "FROM arete_tms.item_category\n"
                    + "where ITEM_CATEGORY='" + bnum + "'");
            citydata = query.list();
            if (citydata.isEmpty()) {
                out.append("Available");

            } else {
                out.append("Already Exists.Enter another");
            }
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    ////Service Request Unique method    
    public void selectServiceRequest(HttpServletRequest req, HttpServletResponse res, String bnum) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<ServiceRequestType> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select SERVICE_REQUESTED\n"
                    + "FROM arete_tms.service_request_type\n"
                    + "where SERVICE_REQUESTED='" + bnum + "'");
            citydata = query.list();
            if (citydata.isEmpty()) {
                out.append("Available");

            } else {
                out.append("Already Exists.Enter another");
            }
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    public void selectPenaltyType(HttpServletRequest req, HttpServletResponse res, String bnum) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<ServiceRequestType> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select penalty_type\n"
                    + "FROM arete_tms.penalty_type\n"
                    + "where penalty_type='" + bnum + "'");
            citydata = query.list();
            if (citydata.isEmpty()) {
                out.append("Available");

            } else {
                out.append("Already Exists.Enter another");
            }
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    //UOM Autogenerate
    public List<UomMaster> UOMCodeGen(String recordNo, String materialCode, String appStatus) {
        List<UomMaster> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (recordNo != null) {
                query = session.createQuery("from InsuranceMaster where recordNo='" + recordNo + "' and approvalStatus='" + appStatus + "' and status!='Inactive'");
            } else if (materialCode != null) {
                query = session.createSQLQuery("SELECT UOM_ID FROM arete_tms.uom_master where UOM_ID like '%UOM%' ");

            } else {
                query = session.createQuery("from InsuranceMaster where  reviewStatus='" + appStatus + "' and status!='Inactive' ORDER BY lastmodifiedDate DESC");
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

    ////UOM Unique method    
    public void selectUOM(HttpServletRequest req, HttpServletResponse res, String bnum) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<ContractCategory> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select UOM_NAME\n"
                    + "FROM arete_tms.uom_master\n"
                    + "where UOM_NAME='" + bnum + "'");
            citydata = query.list();
            if (citydata.isEmpty()) {
                out.append("Available");

            } else {
                out.append("Already Exists.Enter another");
            }
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    //Item Autogenerate
    public List<ItemMaster> ItemCodeGen(String recordNo, String materialCode, String appStatus) {
        List<ItemMaster> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (recordNo != null) {
                query = session.createQuery("from InsuranceMaster where recordNo='" + recordNo + "' and approvalStatus='" + appStatus + "' and status!='Inactive'");
            } else if (materialCode != null) {
                query = session.createSQLQuery("SELECT ITEM_CODE FROM arete_tms.item_master where ITEM_CODE like '%ACCESS%' ");

            } else {
                query = session.createQuery("from InsuranceMaster where  reviewStatus='" + appStatus + "' and status!='Inactive' ORDER BY lastmodifiedDate DESC");
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

    ////Item Unique method    
    public void selectItem(HttpServletRequest req, HttpServletResponse res, String itemCategory, String bnum) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<ContractCategory> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select ITEM_NAME\n"
                    + "FROM arete_tms.item_master\n"
                    + "where ITEM_NAME='" + bnum + "' and ITEM_CATEGORY='" + itemCategory + "' ");
            citydata = query.list();
            if (citydata.isEmpty()) {
                out.append("Available");

            } else {
                out.append("Already Exists.Enter another");
            }
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    @Override
    public List<Class> list(Integer instanceVariable, String className) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void globalInactive(String instanceVariable, String className) {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update " + className + " set status='Inactive' where sno=" + instanceVariable + "";
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
            String hql = "update " + className + " set status='update0' where sno=" + instanceVariable + "";
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

    public void globalInactive1(String instanceVariable, String className) {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update " + className + " set status='Inactive' where SNo=" + instanceVariable + "";
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

    public void globalActiveUtility(String instanceVariable, String className) {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update " + className + " set status='update0' where SNo=" + instanceVariable + "";
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

    public void insTagInactive(String instanceVariable, String className) {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update " + className + " set status='Inactive' where contractCode='" + instanceVariable + "'";
            Query query = session.createQuery(hql);
            //int x = query.execute
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

    public void insTagActive(String instanceVariable, String className) {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update " + className + " set status='update0' where contractCode='" + instanceVariable + "'";
            Query query = session.createQuery(hql);
            //int x = query.execute
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

    //Complaint Type Code Autogenerate
    public List<ComplaintType> ComplaintTypeCodeGen(String complaintCode1) {
        List<ComplaintType> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (complaintCode1 != null) {
                query = session.createSQLQuery("SELECT complaint_code FROM arete_tms.complaint_type where complaint_code like '%CT%' ");

            }
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }

        return inventory;
    }

    // complaint type uniquness
    public void fetchcomplaintType(HttpServletRequest req, HttpServletResponse res, String complaintType) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<ComplaintType> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM ComplaintType where ((lower(complaintType) like lower('" + complaintType + "')) or (upper (complaintType) like upper ('" + complaintType + "'))) ");
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

    // Supplier uniquness
    public void SupplierAvailabilty(HttpServletRequest req, HttpServletResponse res, String supplierName) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<SupplierMaster> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select SUPPLIER_NAME FROM arete_tms.supplier_master \n"
                    + "where SUPPLIER_NAME ='" + supplierName + "'");
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

    @Override
    public List<Class> roleperm(String orgId, String roleName, String submoduleName, String tab) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
      public List<StoreCategory> storeCategory(Integer SNo) throws HibernateException {
        List<StoreCategory> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from StoreCategory");
            } else {
                query = session.createQuery("from StoreCategory where sno='" + SNo + "'");
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
     public List<StoreTypeMaster> storeTypeMaster(Integer SNo) throws HibernateException {
        List<StoreTypeMaster> storedata = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createSQLQuery("select s_no,Store_TypeId,Store_TypeName,Store_TypeCategory from arete_tms.store_TypeMaster");
            } else {
                query = session.createSQLQuery("select  s_no,Store_TypeId,Store_TypeName,Store_TypeCategory,Store_TypeDesc from arete_tms.store_TypeMaster where s_no='" + SNo + "'");
            }
            storedata = query.list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return storedata;
    }

     public List<StoreCategory> selectStoreCategory() throws HibernateException {
        List<StoreCategory> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from StoreCategory");

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
 public List<StoreTypeMaster> selectStoreType() throws HibernateException {
        List<StoreTypeMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("select  s_no,Store_TypeId,Store_TypeName,Store_TypeCategory,Store_TypeDesc from arete_tms.store_TypeMaster");

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
 public void saveStore(StoreCategory StoreCategory) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(StoreCategory);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }

    }
       public void saveStore(StoreTypeMaster StoreTypeMaster) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(StoreTypeMaster);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }

    }
    public void saveStore(StoreMaster storeMaster) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(storeMaster);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }

    }

    public void store(HttpServletRequest req, HttpServletResponse res, String division, String storeType) throws HibernateException, SQLException, IOException {

        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<StoreMaster> Name = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM StoreMaster where division='" + division + "' and storeType='" + storeType + "'");
            Name = query.list();
            if (Name.isEmpty()) {
                out.append("Available");

            } else {
                out.append("Already Exists.");
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

    public void storeMast(HttpServletRequest req, HttpServletResponse res, String division, String storeType, String storeName) throws HibernateException, SQLException, IOException {

        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<StoreMaster> Name = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM StoreMaster where division='" + division + "' and storeType='" + storeType + "' and storeName='" + storeName + "'");
            Name = query.list();
            if (Name.isEmpty()) {
                out.append("Available");

            } else {
                out.append("Already Exists.");
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

    public List<DeliveryLocation> dellocList(Integer SNo) throws HibernateException, SQLException {
        List<DeliveryLocation> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from DeliveryLocation where status!='Inactive'  order by sno");
            } else {
                query = session.createQuery("from DeliveryLocation where sno='" + SNo + "' and status!='Inactive'");
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

    public void save(DeliveryLocation delLoc) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(delLoc);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    public void getDelLoc(HttpServletRequest req, HttpServletResponse res, String divisionName, String address) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        List<CurrencyRate> code = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("Select address from DeliveryLocation where divisionName='" + divisionName + "' and address='" + address + "' and status!='Inactive'");
            code = query.list();
            if (code.isEmpty()) {
                out.append("Available");
            } else {
                out.append("Already Exists.");
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

    public void save(BilltoLocation billLoc) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(billLoc);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }
    }

    public void getBillLoc(HttpServletRequest req, HttpServletResponse res, String divisionName, String address) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        List<CurrencyRate> code = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("Select address from BilltoLocation where divisionName='" + divisionName + "' and address='" + address + "' and status!='Inactive'");
            code = query.list();
            if (code.isEmpty()) {
                out.append("Available");
            } else {
                out.append("Already Exists.");
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

    public void save(Object transientInstance) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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

    public void getTerms(HttpServletRequest req, HttpServletResponse res, String termCode, String termType) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        List<MasterTerms> code = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("Select termCode from MasterTerms where termCode='" + termCode + "' and termType='" + termType + "' and status!='Inactive'");
            code = query.list();
            if (code.isEmpty()) {
                out.append("Available");
            } else {
                out.append("Already Exists.");
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

    public List<IndividualUitlity> getUtilityCode(String utilityCode) {
        List<IndividualUitlity> code = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("SELECT utility_code FROM arete_tms.individual_utility where utility_code like '%Utility%' ORDER BY s_no ASC");

            code = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }

        return code;
    }

    public List<CommonUtility> getComUtilityCode(String comUtilityCode) {
        List<CommonUtility> code = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("SELECT comUtility_code FROM arete_tms.common_comutility where comUtility_code like '%ComUtility%' ORDER BY s_no ASC");

            code = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }

        return code;
    }

    public void savePayDocument(LandlordAttach document) {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        session.save(document);
        tx.commit();
        session.close();
    }

    public List<LandlordAttach> attachmentList(String landlordId) {
        List<LandlordAttach> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (landlordId != null) {
                query = session.createQuery("from LandlordAttach where landlordId='" + landlordId + "'  ");
            } else {
                query = session.createQuery("from LandlordAttach");
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

    public LandlordAttach getCAMAttach(Integer sno) {
        Session session = getSessionFactory().openSession();
        LandlordAttach exp = (LandlordAttach) session.get(LandlordAttach.class, sno);
        session.close();
        return exp;
    }

    public static Map<String, String> fileUpload(MultipartFile multipartFile1, String userId) {
        Map<String, String> fileDetails = new HashMap<String, String>();
        String s = null;
        byte[] document = null;
        String documentName = null;
        File f = new File(dir);
        String path = f.getParent();
        f = new File(path);
        path = f.getParent();
        f = new File(path);

        String extName = null;
        try {
            if (multipartFile1 != null) {
                document = multipartFile1.getBytes();
                documentName = multipartFile1.getOriginalFilename();

                if (documentName.lastIndexOf(".") != -1 && documentName.lastIndexOf(".") != 0) {

                    System.out.println(documentName);
                    extName = documentName.substring(documentName.lastIndexOf(".") + 1);
                    System.out.println("EXTENSION : " + extName);

                }

                int n = (int) (100000 * (Math.random() + Math.random()));
                documentName = Integer.toString(n);

                s = userId + "_" + documentName + "." + extName;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        File folder = new File(f.getPath() + File.separator + "AMS_Attachments");
        boolean b = false;
        String filePath = "";
        try {
            if (!folder.exists()) {
                b = folder.mkdir();
                filePath = folder + File.separator + s;
                File dest = new File(filePath);
                multipartFile1.transferTo(dest);
            } else {
                filePath = folder + File.separator + s;
                File dest = new File(filePath);
                multipartFile1.transferTo(dest);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        fileDetails.put("path", filePath);
        fileDetails.put("newname", s);
        fileDetails.put("oldname", documentName);
        return fileDetails;
    }

    public void saveAssetAttach(List<LandlordAttach> bdpfFile) {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            Iterator<LandlordAttach> itr = bdpfFile.iterator();
            while (itr.hasNext()) {
                LandlordAttach next = itr.next();
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

    public List<LandlordAttach> assetAttachView(Integer sno, String landlordId) {
        List<LandlordAttach> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from LandlordAttach where landlordId='" + landlordId + "' order by sno asc");
            } else {
                query = session.createQuery("from LandlordAttach order by sno asc");
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

    public LandlordAttach getattchs(Integer sno) {
        Session session = getSessionFactory().openSession();
        LandlordAttach exp = (LandlordAttach) session.get(LandlordAttach.class, sno);
        session.close();
        return exp;
    }

    public static void delete(String fileName, String filePath) {

        System.out.println("Delete path" + filePath);

        File file = new File(filePath);
        file.delete();
    }

    public void delattachfiles(String classname, String columnname, Integer columnvalue) {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("delete from " + classname + "  where " + columnname + "='" + columnvalue + "'");
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
    
    
    
    
    //---------------AMCType Details--------------------------//
    public List<AMCType> amcDetailslist(String sno) {
        List<AMCType> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from AMCType where status!='Inactive' and sno='" + sno + "'");
            } else {
                query = session.createQuery("from AMCType where status!='Inactive'");
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
    
//     public Integer getTCNos() throws HibernateException, SQLException {
//        List<AMCType> datalist = null;
//        Session session = getSessionFactory().openSession();
//        Query query = null;
//        Integer tsno = null;
//        try {
//            query = session.createQuery("from AMCType order by sno DESC");
//            query.setMaxResults(1);
//            datalist = query.list();
//            if (datalist.size() == 0) {
//                tsno = 0;
//            } else {
//                AMCType tc = datalist.get(0);
//                tsno = tc.getSNo();
//            }
//        } catch (HibernateException e) {
//            e.printStackTrace();
//        } finally {
//            session.close();
//        }
//        return tsno;
//    }
    
     //------AMC Saved End----------------------------------//
    //@Override
    public void amcTypeSave(Object transientInstance) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
    
    public List<Class> lists(String instanceVariable, String className) {
        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (instanceVariable == "" || instanceVariable == null) {
                query = session.createQuery("from " + className + " where status!='Inactive'");
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
    //--------For Dynamic Label and Field Activation ---------//
    //------Function Starts----------------------------------//
    public List<String> formLabelMapping(String link, String tab) {
        List<String> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("SELECT SNO,Field_Name,Field_Status,Is_Required,Max_Length FROM arete_tms.form_label_mapping where Jsp_Page='" + link + "' and TAB_NAME='" + tab + "'");

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
    public List<String> formDrodownMapping(String link, String tab) {
        List<String> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("SELECT FIELD_CODE,Dropdown_Value,Field_Name,Field_Status FROM arete_tms.form_field_values where Jsp_Page='" + link + "' and TAB_NAME='" + tab + "'");

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
    //**************Get Permissions******************//
    public List<RolePermission> permmenus(String orgId, String roleName, String submodule, String tab) {
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
    
    
     public List<Class> listActives(String instanceVariable, String className) {
        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (instanceVariable == "" || instanceVariable == null) {
                query = session.createQuery("from " + className + "");
            } else {
                query = session.createQuery("from " + className + " where sno='" + instanceVariable + "'");
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
      public List<AMCType> amcTypesList(Integer SNo) throws HibernateException, SQLException {
        List<AMCType> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from AMCType where status!='Inactive'  order by SNo");
            } else {
                query = session.createQuery("from AMCType where SNo='" + SNo + "' and status!='Inactive'");
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

    public void leadSave(LeadReferral dis) {
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
    
    public void leadSaveList(List<LeadReferral> grid) {
        for (Iterator<LeadReferral> iterator = grid.iterator(); iterator.hasNext();) {
            LeadReferral test = (LeadReferral) iterator.next();
            leadSave(test);
        }
    }
      
    public List<String> DocumentTypeDescriptionList() {
        List<String> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct category_desc from arete_tms.document_category");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
    
    
     public List<String> fetchDocuments() {
        List<String> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select * from arete_tms.document_category");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
     
     public Integer getlandlordIdCount() {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        List<Object> datalist =  null;
        Integer num = null;
        Query query = null;
        
        try {
            tx = session.beginTransaction();
            
            query = session.createSQLQuery("select cast(count(*) as int) from arete_tms.land_lord_details;");
        
            datalist = query.list();

            if(datalist.size() > 0) {
                num = (Integer) datalist.get(0);
            }
            
            tx.commit();
        } catch(HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        
        return num;
    }
     
}
