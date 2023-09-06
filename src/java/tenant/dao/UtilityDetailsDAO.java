/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;
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
import tenant.classes.TenantType;
import tenant.classes.Category;
import tenant.classes.ContractAttach;
import tenant.classes.LandLordDetails;
import tenant.classes.ContractCreation;
import tenant.classes.LandlordAttach;
import tenant.classes.MaterialIssue;
import tenant.classes.RolePermission;
import tenant.classes.SubAssetDetails;
import tenant.classes.TenantDetails;
import tenant.classes.UtilityDetails;
import tenant.classes.UserRegistration;
import tenant.other.classes.commonInterface;

/**
 *
 * @author vamsi
 */
public class UtilityDetailsDAO extends HibernateDaoSupport implements commonInterface {

    //---------------Tenant Details---------------------------//
//    public List<UtilityAndMaintaince> utilityAndMaintainceList(String SNo) {
//        List<UtilityAndMaintaince> conts = null;
//        Transaction tx = null;
//        Session session = getSessionFactory().openSession();
//        Query query = null;
//        try {
//            tx = session.beginTransaction();
//            if (SNo == null) {
//                query = session.createQuery("from UtilityDetails where status!='Inactive' and appstatus!='Rejected'");
//            } else {
//                query = session.createQuery("from UtilityDetails where status!='Inactive' and SNo='" + SNo + "'");
//            }
//            conts = query.list();
//            tx.commit();
//        } catch (HibernateException e) {
//            if (tx != null) {
//                tx.rollback();
//            }
//            e.printStackTrace();
//        } finally {
//            session.close();
//        }
//        return conts;
//    }
    //**************Tenant Details List******************//
    public List<UtilityDetails> utilityDetailsList(String SNo) {
        List<UtilityDetails> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from UtilityDetails");
            } else {
                query = session.createQuery("from UtilityDetails ");
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

    //**************select utility ******************//
    public List<TenantDetails> selectUtility() throws HibernateException, SQLException {
        List<TenantDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from TenantDetails where status!='Inactive'");
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

    //**************utility list******************// 
    @Override
    public List<Class> list(String instanceVariable, String className) {
        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (instanceVariable == "" || instanceVariable == null) {
                query = session.createQuery("from " + className + " ");
            } else {
                query = session.createQuery("from " + className + " where SNo='" + instanceVariable + "'");
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

//**************Tenant Details Auto gen Code******************//
    public List<TenantDetails> getTenantNo(String llId) {
        List<TenantDetails> code = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (llId != null) {
                query = session.createSQLQuery("SELECT tenant_code FROM arete_tms.tenant_details where tenant_code like '%TENANT%' ORDER BY s_no ASC");
            } else {
                query = session.createQuery("from TenantDetails where  status!='Inactive' ORDER BY lastmodifiedDate DESC");
            }
            code = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return code;
    }
//**************Tenant Details Revision(Recheck) Auto gen Code******************//

    public List<TenantDetails> autoGenNo(String tenantCode, String max) throws HibernateException, SQLException {
        List<TenantDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (max.equals("0")) {
                query = session.createQuery("from TenantDetails where tenantCode='" + tenantCode + "' and status!='Inactive'");
            }
            if (max.equals("2")) {
                query = session.createQuery("select tenantCode from TenantDetails where tenantCode='" + tenantCode + "' and status!='Inactive'");
            } else {
                query = session.createSQLQuery("select MAX(CAST(SUBSTR(tenant_code,INSTR(tenant_code,'-')+1,1000) as Int)) from arete_tms.tenant_details");
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
//**************Fetch Landlord******************//

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
//**************Fetch Property******************//

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
//**************Fetch Flat******************//

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
//**************Update Selected Flat No******************//

    public void updateSubasset(String assetCode, String subAssetCode, String recordstatus1) throws HibernateException, SQLException {
        String hql = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update SubAssetDetails set recordStatus='" + recordstatus1 + "' where  assetCode='" + assetCode + "' and subAssetCode='" + subAssetCode + "'");
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
//**************Update Selected Flat No******************//

    public void updateSubasset1(String subAssetCode, String recordstatus1) throws HibernateException, SQLException {
        String hql = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update SubAssetDetails set recordStatus='" + recordstatus1 + "' where subAssetCode='" + subAssetCode + "'");
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
//**************Landlord Pop-up******************//

    public List<LandLordDetails> selectLandLord() throws HibernateException, SQLException {
        List<LandLordDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from LandLordDetails where status!='Inactive'");
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
//**************Property Pop-up******************//

    public List<AssetDetails> selectAssetDetails(String tenantCategory) throws HibernateException, SQLException {
        List<AssetDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (tenantCategory.equals("Others")) {
                query = session.createQuery("from AssetDetails where status!='Inactive'");
            } else {
                query = session.createQuery("from AssetDetails where status!='Inactive' and (assetType='" + tenantCategory + "' or assetType='Both')");
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
//**************Flat No Pop-up******************//

    public List<SubAssetDetails> selectSubAssetDetails1(String assetCode, String tenantCategory) throws HibernateException, SQLException {
        List<SubAssetDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (tenantCategory.equals("Others")) {
                query = session.createQuery("from SubAssetDetails where assetCode='" + assetCode + "' and recordStatus!='Occupied' and status!='Inactive'");
            } else {
                query = session.createQuery("from SubAssetDetails where assetCode='" + assetCode + "' and recordStatus!='Occupied' and status!='Inactive' and (subAssetType='" + tenantCategory + "' or subAssetType='Both')");
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

    public List<SubAssetDetails> selectSubAssetDetails(String assetCode) throws HibernateException, SQLException {
        List<SubAssetDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from SubAssetDetails where assetCode='" + assetCode + "' and recordStatus!='Occupied' and status!='Inactive'");
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
//**************Landlord Attachments******************//

    public void getLlAttach(HttpServletRequest req, HttpServletResponse res, String llId) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<LandlordAttach> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT group_CONCAT(convert(SNO,char(8))) AS SNO FROM arete_tms.landlord_attach WHERE LANDLORD_ID='" + llId + "' AND STATUS!='Inactive';");
            citydata = query.list();
            if (citydata.contains(null)) {
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
//**************Contract Attachments******************//

    public void getContAttach(HttpServletRequest req, HttpServletResponse res, String contCode) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<ContractAttach> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT group_CONCAT(convert(SNO,char(8))) AS SNO FROM arete_tms.contract_attach WHERE CONTRACT_CODE='" + contCode + "' AND STATUS!='Inactive';");
            citydata = query.list();
            if (citydata.contains(null)) {
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
//**************Contract Pop-up******************//

    public List<ContractCreation> selectContractCode(String tenantCategory, String flatNo) throws HibernateException, SQLException {
        List<ContractCreation> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (tenantCategory.equals("Others")) {
                query = session.createSQLQuery("SELECT  CONTRACT_CODE,CONTRACT_TITLE,\n"
                        + "DATE_FORMAT(CONT_START_DATE, '%d-%b-%Y') AS Start_Date,\n"
                        + "DATE_FORMAT(CONT_END_DATE, '%d-%b-%Y') AS End_Date\n"
                        + "FROM arete_tms.contract_creation where STATUS!='Inactive' \n"
                        + "and CONT_STATUS='Active' and RECORD_STATUS='CFO APPROVED' and FLAT_CODE='" + flatNo + "'");
            } else {
                query = session.createSQLQuery("SELECT  C.CONTRACT_CODE,C.CONTRACT_TITLE,\n"
                        + "DATE_FORMAT(C.CONT_START_DATE, '%d-%b-%Y') AS Start_Date,\n"
                        + "DATE_FORMAT(C.CONT_END_DATE, '%d-%b-%Y') AS End_Date,D.CONTRACT_CATEGORY\n"
                        + "FROM arete_tms.contract_creation C, arete_tms.contract_category D \n"
                        + "where C.CONTRACT_CATEGORY_ID=D.CONTRACT_CATEGORY_ID and C.STATUS!='Inactive' \n"
                        + "and C.CONT_STATUS='Active' and C.RECORD_STATUS='CFO APPROVED' \n"
                        + "and C.FLAT_CODE='" + flatNo + "' and (D.CONTRACT_CATEGORY='" + tenantCategory + "' or D.CONTRACT_CATEGORY='Others')");
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
//**************Fetch Contract Details******************//

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
//**************Download Landlord Attachment******************//

    public LandlordAttach gettenantAttachll(Integer id) {
        Session session = getSessionFactory().openSession();
        LandlordAttach exp = (LandlordAttach) session.get(LandlordAttach.class, id);
        session.close();
        return exp;
    }
//**************Download Tenant Attachment******************//

    public TenantDetails gettenantAttach(Integer id) {
        Session session = getSessionFactory().openSession();
        TenantDetails exp = (TenantDetails) session.get(TenantDetails.class, id);
        session.close();
        return exp;
    }
//**************Download Contract Attachment******************//

    public ContractAttach gettenantContAttach(Integer id) {
        Session session = getSessionFactory().openSession();
        ContractAttach exp = (ContractAttach) session.get(ContractAttach.class, id);
        session.close();
        return exp;
    }
//**************Get original tenant file name for edit******************//

    public String getTenOrgfileName(String tenantCode) throws HibernateException, SQLException {
        List<TenantDetails> datalist = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        String Image = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from TenantDetails where tenantCode='" + tenantCode + "'");
            datalist = query.list();
            for (TenantDetails cand : datalist) {
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
//**************Get original tenant Attachment for edit******************//

    public byte[] getTenantAttachment(String tenantCode) throws HibernateException, SQLException {
        List<TenantDetails> datalist = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        byte[] Image = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from TenantDetails where tenantCode='" + tenantCode + "'");
            datalist = query.list();
            for (TenantDetails cand : datalist) {
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
//**************Fetch Tenant Details for Email******************//

    public List<TenantDetails> tdList(String userId, String orgId, String tenantCode) throws HibernateException, SQLException {
        List<TenantDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from TenantDetails where tenantCode='" + tenantCode + "' and status!='Inactive'");
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
//**************User Details for Email******************//

    public List<UserRegistration> udList(String userId) throws HibernateException, SQLException {
        List<UserRegistration> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from UserRegistration where roleName='" + userId + "' and status!='Inactive'");
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

//**************Uniqueness for Tenant ID******************//
    public void fetchTid(HttpServletRequest req, HttpServletResponse res, String tenantId) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<TenantDetails> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM TenantDetails where ((lower(tenantId) like lower('" + tenantId + "')) or (upper (tenantId) like upper ('" + tenantId + "'))) and status!='Inactive'");
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
//**************Uniqueness for Tenant Name******************//

    public void fetchTName(HttpServletRequest req, HttpServletResponse res, String tenantFname, String tenantLname) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<TenantDetails> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM TenantDetails where ((lower(tenantFname) like lower('" + tenantFname + "')) or (upper (tenantFname) like upper ('" + tenantFname + "'))) and ((lower(tenantLname) like lower('" + tenantLname + "')) or (upper (tenantLname) like upper ('" + tenantLname + "'))) and status!='Inactive'");
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

//**************Uniqueness for Tenant Contact No******************//
    public void fetchTCono(HttpServletRequest req, HttpServletResponse res, String tenantContactno) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<TenantDetails> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM TenantDetails where ((lower(tenantContactno) like lower('" + tenantContactno + "')) or (upper (tenantContactno) like upper ('" + tenantContactno + "'))) and status!='Inactive'");
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
//**************Uniqueness for Tenant Work Contact No******************//

    public void fetchTWcono(HttpServletRequest req, HttpServletResponse res, String tenantWorkContactno) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<TenantDetails> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM TenantDetails where ((lower(tenantWorkContactno) like lower('" + tenantWorkContactno + "')) or (upper (tenantWorkContactno) like upper ('" + tenantWorkContactno + "'))) and status!='Inactive'");
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
//**************Uniqueness for Tenant Email******************//

    public void fetchTEmail(HttpServletRequest req, HttpServletResponse res, String tenantMailid) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<TenantDetails> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM TenantDetails where ((lower(tenantMailid) like lower('" + tenantMailid + "')) or (upper (tenantMailid) like upper ('" + tenantMailid + "'))) and status!='Inactive'");
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
//**************Uniqueness for Tenant CR No.******************//

    public void fetchCrno(HttpServletRequest req, HttpServletResponse res, String tenantCrNo) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<TenantDetails> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM TenantDetails where ((lower(tenantCrNo) like lower('" + tenantCrNo + "')) or (upper (tenantCrNo) like upper ('" + tenantCrNo + "'))) and status!='Inactive'");
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
//**************Need Approval 1*****************//

    public List<TenantDetails> gfcApproved(String SNo) {
        List<TenantDetails> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from TenantDetails where status!='Inactive' and appstatus='Submitted'");
            } else {
                query = session.createQuery("from TenantDetails where status!='Inactive' and SNo='" + SNo + "'");
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
//**************Need Approval 2*****************//

    public List<TenantDetails> cfoApproved(String SNo) {
        List<TenantDetails> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from TenantDetails where status!='Inactive' and (appstatus='GFC Approved' or appstatus='CFO Approved')");
            } else {
                query = session.createQuery("from TenantDetails where status!='Inactive' and SNo='" + SNo + "'");
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
//**************Rejected List*****************//

    public List<TenantDetails> tenantDetailsRej(String SNo) {
        List<TenantDetails> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from TenantDetails where status!='Inactive' and appstatus='Rejected'");
            } else {
                query = session.createQuery("from TenantDetails where status!='Inactive' and SNo='" + SNo + "'");
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
//**************Approval 1 update*****************//

    public void tenantDetailsApprove(String SNo, String status, String remarks, String advanceAmount, Date dueDate1, String totalAmount) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = null;
        try {
            hql = "update TenantDetails set appstatus='" + status + "', gfcremarks='" + remarks + "', advanceAmount='" + advanceAmount + "',totalAmount='" + totalAmount + "',lastmodifiedDate=current_timestamp() where SNo= " + SNo + "";
            Query query = session.createQuery(hql);
            int row = query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            session.close();
        }
    }
//**************CFO  Approval update*****************//

    public void tenantDetailsApprove1(String sno, String status, String remarks, String advanceAmount, Date dueDate1, String totalAmount) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = null;
        try {
            hql = "update TenantDetails set appstatus='" + status + "', cforemarks='" + remarks + "', advanceAmount='" + advanceAmount + "',totalAmount='" + totalAmount + "',lastmodifiedDate=current_timestamp() where SNo= " + sno + "";
            Query query = session.createQuery(hql);
            int row = query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            session.close();
        }
    }
//**************Tenant GFC Reject update*****************//

    public void tenantReject(String tenantCode, String appstatus, String appremarks) throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update TenantDetails set appstatus='" + appstatus + "',gfcremarks='" + appremarks + "' where tenantCode='" + tenantCode + "'");
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
//**************Tenant CFO Reject update*****************//

    public void tenantReject1(String tenantCode, String appstatus, String appremarks) throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update TenantDetails set appstatus='" + appstatus + "',cforemarks='" + appremarks + "' where tenantCode='" + tenantCode + "'");
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

    //------------------Bill Payment----------------------//
//**************Tenant Pop-up for Receipt*****************//    
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
//**************Service Request Pop-up for Receipt*****************//    

    public List<MaterialIssue> serviceReq(String tenantCode) throws HibernateException, SQLException {
        List<MaterialIssue> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT m.sr_no,s.service_requested,t.tenant_fname FROM material_issue m,tenant_details t,serivce_request s WHERE m.status!='Inactive' AND m.tenant_name=t.tenant_code and m.tenant_name='" + tenantCode + "' and m.appstatus='Approved' GROUP BY m.sr_no");
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
//**************Tenant Check History Pop-up******************//

    public List<BillPayment> selectBillPayment(String tenantCode, String receiptType) throws HibernateException, SQLException {
        List<BillPayment> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from BillPayment where status!='Inactive' and tenantCode='" + tenantCode + "' and receiptType='" + receiptType + "'");
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
//**************Receipt Auto gen*****************//

    public List<BillPayment> getBPNo(String receiptDate) {
        List<BillPayment> code = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (receiptDate != null) {
                query = session.createSQLQuery("SELECT receipt_no FROM arete_tms.bill_payment where receipt_no like '%BILL%' ORDER BY s_no ASC");
            } else {
                query = session.createQuery("from BillPayment where  status!='Inactive' ORDER BY lastmodifiedDate DESC");
            }
            code = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }

        return code;
    }
//**************Validate Dates******************//

    public void getTenantDates(HttpServletRequest req, HttpServletResponse res, String tenantCode, String fromDate, String toDate, String receiptType) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<BillPayment> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT tenant_code FROM arete_tms.bill_payment WHERE ('" + fromDate + "' <= period1) \n"
                    + "AND ('" + toDate + "' >= period) AND tenant_code='" + tenantCode + "' AND receipt_type='" + receiptType + "' and status!='Inactive'");
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

    public void previousContrtacts(HttpServletRequest req, HttpServletResponse res, String tenantCode, String startsFrom) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        List<Object[]> citydata = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT total_amount,billing_cycle FROM arete_tms.tenant_details_log where tenant_code='" + tenantCode + "' \n"
                    + "and '" + startsFrom + "'>=starts_from and '" + startsFrom + "'<=ends_to and appstatus='CFO Approved' limit 1;");
            citydata = query.list();
            if (citydata.isEmpty() || citydata.contains(null)) {
                out.append("a");
            } else {
//                out.append(citydata.toString());
                for (Object[] st : citydata) {
                    out.append(st[0].toString() + "," + st[1].toString());
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

    public String previousArrearsforBV(String tenantCode, String startsFrom) throws HibernateException, SQLException, IOException {
        List citydata = null;
        Transaction tx = null;
        Query query = null;
        String arrearsAmount = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT arete_tms.previousArrears('" + tenantCode + "','" + startsFrom + "')");
            citydata = query.list();

            tx.commit();
            arrearsAmount = citydata.get(0).toString();
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
        return arrearsAmount;
    }

    public String previousPrepaidforBV(String tenantCode, String startsFrom) throws HibernateException, SQLException, IOException {
        List citydata = null;
        Transaction tx = null;
        Query query = null;
        String prepaidAmount = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT arete_tms.previousPrepaid('" + tenantCode + "','" + startsFrom + "')");
            citydata = query.list();

            tx.commit();
            prepaidAmount = citydata.get(0).toString();
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
        return prepaidAmount;
    }
//**************Fetch Tenant Dues of Advances******************//

    public void getTenantAdvnce(HttpServletRequest req, HttpServletResponse res, String tenantCode, String receiptType) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<BillPayment> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM BillPayment where tenantCode='" + tenantCode + "' and receiptType='" + receiptType + "' and status!='Inactive'");
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
//**************Fetch Service Request Total Amount******************//

    public void bringAmount(HttpServletRequest req, HttpServletResponse res, String tenantCode, String srNo) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<BillPayment> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select sum(total_price) from arete_tms.material_issue where sr_no='" + srNo + "'");
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
//**************Fetch Tenant Dues******************//

    public void getTenantDues(HttpServletRequest req, HttpServletResponse res, String tenantCode, String receiptType) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<BillPayment> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT dues FROM arete_tms.bill_payment WHERE tenant_code='" + tenantCode + "' and receipt_type='" + receiptType + "' ORDER BY s_no DESC LIMIT 1");
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
//**************Fetch Tenant Prepaid Rent Amount******************//

    public void checkPrepaid(HttpServletRequest req, HttpServletResponse res, String tenantCode, String receiptType) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<BillPayment> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT prepaid_amount FROM arete_tms.bill_payment WHERE tenant_code='" + tenantCode + "' and receipt_type='" + receiptType + "' ORDER BY s_no DESC LIMIT 1");
            citydata = query.list();
            if (citydata.isEmpty() || citydata.contains(null) || citydata.contains("")) {
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
//**************Fetch Tenant Dues of Advances******************//

    public void getTenantDuesAdvt(HttpServletRequest req, HttpServletResponse res, String tenantCode, String receiptType) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<BillPayment> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT group_CONCAT(convert(amount,char(8))) AS amount FROM arete_tms.bill_payment WHERE tenant_code='" + tenantCode + "' and receipt_type='" + receiptType + "'");
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

    //**************Inactivate Dishounered cheque******************//
    public void updateBiilpayment(String receiptNo, String tenantCode) throws HibernateException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update BillPayment set status='Inactive' where receiptNo='" + receiptNo + "' and tenantCode='" + tenantCode + "'";
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

    //**************Validate Dates******************//
    public void getUtilityDates(HttpServletRequest req, HttpServletResponse res, String tenantCode, String fromDate, String toDate) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<UtilityDetails> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT tenant_code FROM arete_tms.utility_details WHERE ('" + fromDate + "' <= toDate) \n"
                    + "AND ('" + toDate + "' >= period) AND tenant_code='" + tenantCode + "' and status!='Inactive'");
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

//**************Global interface method for fetch list values******************//
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

    //**************Tenant Renew Update******************//
    public void updateRenewTenant(String tenantCode, java.sql.Date endsTo, String billingCycle, String advanceAmount, String rentPerMnth, String totalAmount) throws HibernateException, SQLException {
        String hql = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update TenantDetails set endsTo='" + endsTo + "',billingCycle='" + billingCycle + "',advanceAmount='" + advanceAmount + "',extra2='" + rentPerMnth + "',extra3"
                    + "='Renewed',totalAmount='" + totalAmount + "' where  tenantCode='" + tenantCode + "'");
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
}
