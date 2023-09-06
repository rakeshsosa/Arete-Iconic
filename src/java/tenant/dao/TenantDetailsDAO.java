/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.dao;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import tenant.classes.AssetDetails;
import tenant.classes.AssetUtilityDetails;
import tenant.classes.BillPayment;
import tenant.classes.BookingPropertyDetails;
import tenant.classes.BookingPropertyDetails1;
import tenant.classes.BookingTenantDetails;
import tenant.classes.TenantType;
import tenant.classes.Category;
import tenant.classes.ComUtility;
import tenant.classes.ContractAttach;
import tenant.classes.LandLordDetails;
import tenant.classes.ContractCreation;
import tenant.classes.CustomerTenacyDetails;
import tenant.classes.CustomerTenacyDetails1;
import tenant.classes.CustomerTenacyDetailsGrid;
import tenant.classes.CustomerTenacyDetailsGrid1;
import tenant.classes.Enqueries;
import tenant.classes.ExpenceTracking;
import tenant.classes.ExpenceTrackingGrid;
import tenant.classes.IncomeTracking;
import tenant.classes.IncomeTrackingGrid;
import tenant.classes.IndividualUtilityManagement;
import tenant.classes.Invoice;
import tenant.classes.ItemMaster;
import tenant.classes.LandlordAttach;
import tenant.classes.MaterialIssue;
import tenant.classes.PenaltyDetails;
import tenant.classes.PenaltyType;
import tenant.classes.PettyCash;
import tenant.classes.PettyCashGrid;
import tenant.classes.PortalTenantDetails;
import tenant.classes.QuotationDetails;
import tenant.classes.QuotationDetails1;
import tenant.classes.ReceiptAttachment;
import tenant.classes.RentDetails;
import tenant.classes.RentDetails1;
import tenant.classes.RentInvoice;
import tenant.classes.RentNotification;
import tenant.classes.RolePermission;
import tenant.classes.ServiceDetails;
import tenant.classes.ServiceDetailsGrid;
import tenant.classes.ServiceDetailsGrid1;
import tenant.classes.SubAssetDetails;
import tenant.classes.TenantDetails;
import tenant.classes.TenantProfilingDocument;
import tenant.classes.TenantProfilings;
import tenant.classes.TenantServices;
import tenant.classes.TenantServicesGrid;
import tenant.classes.TermsCondition;
import tenant.classes.TermsCondition1;
import tenant.classes.ThirdPartyTenantDetails;
import tenant.classes.UserRegistration;
import tenant.classes.pettyCashTransaction;
import tenant.classes.pettyCashTransactionGrid;
import tenant.other.classes.commonInterface;

/**
 *
 * @author vamsi
 */
public class TenantDetailsDAO extends HibernateDaoSupport implements commonInterface {

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
    public List<TenantDetails> tenantDetailsList(String SNo) {
        List<TenantDetails> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from TenantDetails where status!='Inactive' and (ifnull(attribute3,'')!='Renewed') and appstatus!='Rejected' order by SNo desc");
            } else {
                query = session.createQuery("from TenantDetails where status!='Inactive' and (ifnull(attribute3,'')!='Renewed')  and SNo='" + SNo + "' order by SNo desc");
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

    //newly added by lakshmi for dashboard based on from and to dates
    public List<TenantDetails> tenantDetailsList1(String SNo, String fromDate, String toDate) {
        List<TenantDetails> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from TenantDetails where status!='Inactive' and appstatus!='Rejected' and (ifnull(attribute3,'')!='Renewed') and (ifnull(vacatestatus,'')!='Vacated') and lastmodified_date >='" + fromDate + "' and lastmodified_date <='" + toDate + "' order by SNo desc");
            } else {
                query = session.createQuery("from TenantDetails where status!='Inactive' and SNo='" + SNo + "' and (ifnull(attribute3,'')!='Renewed') and (ifnull(vacatestatus,'')!='Vacated') and lastmodified_date >='" + fromDate + "' and lastmodified_date <='" + toDate + "' order by SNo desc");
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

    /////Newly added by lakshmi////////
    public List<BookingTenantDetails> bookingTenantDetailsList(String SNo) {
        List<BookingTenantDetails> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from BookingTenantDetails where status!='Inactive' and appstatus!='Rejected' order by SNo desc");
            } else {
                query = session.createQuery("from BookingTenantDetails where status!='Inactive' and SNo='" + SNo + "' order by SNo desc");
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

    ////////////////////////////////
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

    public List<BookingTenantDetails> getBookingTenantNo(String llId) {
        List<BookingTenantDetails> code = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (llId != null) {
                query = session.createSQLQuery("SELECT tenant_code FROM arete_tms.Booking_Tenant_Details where tenant_code like '%TENANT%' ORDER BY s_no ASC");
            } else {
                query = session.createQuery("from BookingTenantDetails where  status!='Inactive' ORDER BY lastmodifiedDate DESC");
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
            query = session.createQuery("from AssetDetails where status!='Inactive' and assetCode='" + assetName + "' group by '" + assetName + "'");
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

    public void updateRoomStatus(String roomCode, String recordstatus1) throws HibernateException, SQLException {
        String hql = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update FlatRoomDetails set recordStatus='" + recordstatus1 + "' where  roomCode='" + roomCode + "'");
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
            query = session.createQuery("update SubAssetDetails set recordStatus='" + recordstatus1 + "' where unit_name='" + subAssetCode + "'");
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
                query = session.createQuery("from AssetDetails where status!='Inactive' and (assetType='" + tenantCategory + "' or assetType='Both') group by assetCode");
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
//**************Flat No Pop-up******************//

    public List<Object[]> selectRoomDetails(String assetCode, String tenantCategory) throws HibernateException, SQLException {
        List<Object[]> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            // if (tenantCategory.equals("Others")) {
//                query = session.createQuery("from SubAssetDetails where assetCode='" + assetCode + "' and recordStatus!='Occupied' and status!='Inactive'");
            // } else {
            query = session.createQuery("select s.assetCode,s.subAssetCode,s.subAssetName,f.roomCode,f.roomName,f.utilityNo1,f.utilityNo2,f.actualRent  from SubAssetDetails s, FlatRoomDetails f where s.subAssetCode=f.subAssetCode and s.assetCode='" + assetCode + "' and f.recordStatus='Vacant'");
            // }
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

    public List<SubAssetDetails> subassetDetails1(String Vacant) throws HibernateException, SQLException {
        List<SubAssetDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("select ad.assetName,sad.subAssetName,ad.assetBuilding,ad.way,sad.area,ad.blockNo,ad.assetPlotNo,ad.streetNo,ad.pinCode,ad.poBox,sad.utilityNo1,sad.utilityNo2,sad.actualRent,sad.minimumRentFixed,sad.recordStatus from AssetDetails ad, SubAssetDetails sad where ad.assetCode=sad.assetCode and sad.recordStatus='" + Vacant + "'");

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
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

    public void getAssetUtilityDetails(HttpServletRequest req, HttpServletResponse res, String contCode) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<AssetUtilityDetails> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("Select * from arete_tms.asset_utility_details  where asset_code='" + contCode + "' AND STATUS!='Inactive' order by s_no;");
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

    //newly added by lakshmi for invoice
    public List<ContractCreation> selectContractCodee() throws HibernateException, SQLException {
        List<ContractCreation> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from ContractCreation");
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

    public List<Invoice> selectInvoiceNo(String sno) throws HibernateException, SQLException {
        List<Invoice> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno == null || sno == "") {
                query = session.createQuery("select invoiceNo from Invoice where status!='Inactive'");
            } else {
                query = session.createQuery("select invoiceNo from Invoice where status!='Inactive'and SNo='" + sno + "'");
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

//    ////newly added by lakshmi/////
//    
//    public List<BookingTenantDetails> bookingTdList(String userId, String orgId, String tenantCode) throws HibernateException, SQLException {
//        List<BookingTenantDetails> datalist = null;
//        Transaction tx = null;
//        Session session = getSessionFactory().openSession();
//        Query query = null;
//        try {
//            tx = session.beginTransaction();
//            query = session.createQuery("from BookingTenantDetails where tenantCode='" + tenantCode + "' and status!='Inactive'");
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
//    
//    /////////////
    public List<BookingTenantDetails> bookingTdList(String userId, String orgId, String tenantCode) throws HibernateException, SQLException {
        List<BookingTenantDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from BookingTenantDetails where tenantCode='" + tenantCode + "' and status!='Inactive'");
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

    public void fetchbookingTid(HttpServletRequest req, HttpServletResponse res, String tenantId) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<BookingTenantDetails> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM BookingTenantDetails where ((lower(tenantId) like lower('" + tenantId + "')) or (upper (tenantId) like upper ('" + tenantId + "'))) and status!='Inactive'");
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

    public void fetchBookingTName(HttpServletRequest req, HttpServletResponse res, String tenantFname, String tenantLname) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<BookingTenantDetails> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM BookingTenantDetails where ((lower(tenantFname) like lower('" + tenantFname + "')) or (upper (tenantFname) like upper ('" + tenantFname + "'))) and ((lower(tenantLname) like lower('" + tenantLname + "')) or (upper (tenantLname) like upper ('" + tenantLname + "'))) and status!='Inactive'");
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
    public void fetchTCode(HttpServletRequest req, HttpServletResponse res, String tenantCode) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<TenantDetails> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM InterestDetails where ((lower(tenantCode) like lower('" + tenantCode + "')) or (upper (tenantCode) like upper ('" + tenantCode + "')))  and status!='Inactive'");
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

    public List<PortalTenantDetails> gfcApproved1(String SNo) {
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

    /////Newly added By Lakshmi/////
    //**************Need Approval 1*****************//
    public List<BookingTenantDetails> bookinggfcApproved(String SNo) {
        List<BookingTenantDetails> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from BookingTenantDetails where status!='Inactive' and appstatus='Submitted'");
            } else {
                query = session.createQuery("from BookingTenantDetails where status!='Inactive' and SNo='" + SNo + "'");
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

    ////////////////
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

    public List<PortalTenantDetails> cfoApproved1(String SNo) {
        List<PortalTenantDetails> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from PortalTenantDetails where status!='Inactive' and (appstatus='GFC Approved' or appstatus='CFO Approved')");
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

    ////// Newly added By Lakshmi
    public List<BookingTenantDetails> bookingTenantDetailsRej(String SNo) {
        List<BookingTenantDetails> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from BookingTenantDetails where status!='Inactive' and appstatus='Rejected'");
            } else {
                query = session.createQuery("from BookingTenantDetails where status!='Inactive' and SNo='" + SNo + "'");
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

    /////////////////////
//**************Approval 1 update*****************//
    public void tenantDetailsApprove(String SNo, String status, String remarks, String advanceAmount, Date dueDate1, String totalAmount) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = null;
        try {
            hql = "update TenantDetails set appstatus='" + status + "', gfcremarks='" + remarks + "', advanceAmount='" + advanceAmount + "',totalAmount='" + totalAmount + "',lastmodifiedDate=current_timestamp() where SNo= " + SNo + "";
            Query query = session.createQuery(hql);
            int row = query.executeUpdate();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        tx.commit();
        session.close();
    }

    public void tenantDetailsApproveportal(String SNo, String status, String remarks, String advanceAmount, Date dueDate1, String totalAmount) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = null;
        try {
            hql = "update PortalTenantDetails set appstatus='" + status + "', gfcremarks='" + remarks + "', advanceAmount='" + advanceAmount + "',totalAmount='" + totalAmount + "',lastmodifiedDate=current_timestamp() where SNo= " + SNo + "";
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

    ////newly added by lakshmi
    public void bookingTenantDetailsApproveportal(String SNo, String status, String remarks, String advanceAmount, Date dueDate1, String totalAmount) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = null;
        try {
            hql = "update BookingTenantDetails set appstatus='" + status + "', appremarks='" + remarks + "',lastmodifiedDate=current_timestamp() where SNo= " + SNo + "";
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

    /////
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
        } finally {
            session.close();
        }
    }

    public void tenantDetailsApprove11(String sno, String status, String remarks, String advanceAmount, Date dueDate1, String totalAmount) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = null;
        try {
            hql = "update PortalTenantDetails set appstatus='" + status + "', cforemarks='" + remarks + "', advanceAmount='" + advanceAmount + "',totalAmount='" + totalAmount + "',lastmodifiedDate=current_timestamp() where SNo= " + sno + "";
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

    public void tenantDetailsApprove12(String tenantType, String tenantCategory, String tenantId, String tenantFname, String tenantLname, String tenantCitizenship, String tenantCrNo, String tenantContactno, String tenantWorkContactno, String tenantMailid, String permanentAddress, String correspondenceAddress, String postalCode, String postboxNo, String sponcerName, String sponcerAddress, String companyName, String companyAddress, String postalCode1, String postboxNo1, String jointeeName1, String jointeeAddress1, String jointeeName2, String jointeeAddress2, String remarks1, String tenOrgfileName, byte[] Content1) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = null;
        try {
            hql = "update TenantDetails set tenantType='" + tenantType + "', tenantCategory='" + tenantCategory + "', tenantFname='" + tenantFname + "',tenantLname='" + tenantLname + "',tenantCitizenship='" + tenantCitizenship + "',tenantCrNo='" + tenantCrNo + "',\n"
                    + "tenantContactno='" + tenantContactno + "',tenantWorkContactno='" + tenantWorkContactno + "',tenantMailid='" + tenantMailid + "',permanentAddress='" + permanentAddress + "',\n"
                    + "correspondenceAddress='" + correspondenceAddress + "',postalCode='" + postalCode + "',postboxNo='" + postboxNo + "',sponcerName='" + sponcerName + "',\n"
                    + "sponcerAddress='" + sponcerAddress + "',companyName='" + companyName + "',companyAddress='" + companyAddress + "',postalCode1='" + postalCode1 + "',\n"
                    + "postboxNo1='" + postboxNo1 + "',jointeeName1='" + jointeeName1 + "',jointeeAddress1='" + jointeeAddress1 + "',\n"
                    + "jointeeName2='" + jointeeName2 + "',jointeeAddress2='" + jointeeAddress2 + "',remarks='" + remarks1 + "',tenOrgfileName='" + tenOrgfileName + "',tenantAttachment=:byte1,lastmodifiedDate=current_timestamp() where tenantId= " + tenantId + " ";

            Query query = session.createQuery(hql);
            query.setBinary("byte1", Content1);
            query.executeUpdate();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
//    public void tenantDetailsApprove122(String tenantId, String tenOrgfileName, byte[] Content1) {
//        Session session = getSessionFactory().openSession();
//        Transaction tx = session.beginTransaction();
//        String hql = null;
//        try {
//            hql = "update TenantDetails set tenOrgfileName='" + tenOrgfileName + "',tenantAttachment=:byte1,lastmodifiedDate=current_timestamp() where tenantId= " + tenantId + " ";
//
//            Query query = session.createQuery(hql);
//            query.setBinary("byte1", Content1);
//            int row = query.executeUpdate();
//        } catch (HibernateException e) {
//            e.printStackTrace();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        tx.commit();
//        session.close();
//    }

    public void tenantDetailsApprove121(String tenantId, String tenOrgfileName, byte[] Content1) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = null;
        try {
            hql = "update PortalTenantDetails set tenOrgfileName='" + tenOrgfileName + "',tenantAttachment=:byte1,lastmodifiedDate=current_timestamp() where tenantId= " + tenantId + " ";

            Query query = session.createQuery(hql);
            query.setBinary("byte1", Content1);
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

    public void tenantDetailsApprove122(String tenantId, String tenOrgfileName, byte[] Content1) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = null;
        try {
            hql = "update TenantDetails set tenOrgfileName='" + tenOrgfileName + "',tenantAttachment=:byte1,lastmodifiedDate=current_timestamp() where tenantId= " + tenantId + " ";

            Query query = session.createQuery(hql);
            query.setBinary("byte1", Content1);
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
//**************Tenant GFC Reject update*****************//

    public void tenantReject(String tenantCode, String appstatus, String appremarks) throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update TenantDetails set appstatus='" + appstatus + "',gfcremarks='" + appremarks + "' ,lastmodifiedDate=current_timestamp() where tenantCode='" + tenantCode + "'");
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

    ///////////////Newly added by lakshmi
    public void bookingTenantReject(String tenantCode, String appstatus, String appremarks) throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update BookingTenantDetails set appstatus='" + appstatus + "',appremarks='" + appremarks + "' ,lastmodifiedDate=current_timestamp() where tenantCode='" + tenantCode + "'");
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

    ////////
    public void tenantReject11(String tenantCode, String appstatus, String appremarks) throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update PortalTenantDetails set appstatus='" + appstatus + "',gfcremarks='" + appremarks + "' ,lastmodifiedDate=current_timestamp() where tenantCode='" + tenantCode + "'");
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

    public void tenantReject12(String tenantCode, String appstatus, String appremarks) throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update PortalTenantDetails set appstatus='" + appstatus + "',gfcremarks='" + appremarks + "' ,lastmodifiedDate=current_timestamp() where tenantCode='" + tenantCode + "'");
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
            query = session.createQuery("from TenantDetails where status!='Inactive' and (ifnull(extra3,'')!='Renewed') and appstatus='CFO Approved' and (vacatestatus!='Vacated' or vacatestatus is null)");
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

    //newly added by lakshmi for invoice pop up on 30Apr2019
    public List<String> selectInvoice(String tenantCode) throws HibernateException, SQLException {
        List<String> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
//            query = session.createSQLQuery("select inv.tenant_code,inv.tenant_Name,inv.asset_name,inv.invoice_no,inv.period,inv.period1,inv.due_date \n"
//                    + "                    from invoice inv\n"
//                    + "                   join bill_payment bp \n"
//                    + "                   on bp.invoice_number!=inv.invoice_no where inv.tenant_code='" + tenantCode + "' and inv.status!='Inactive' and bp.status!='Inactive'");
            query = session.createSQLQuery("SELECT i.tenant_code,i.tenant_Name,i.asset_name,i.invoice_no,i.period,i.period1,i.due_date\n"
                    + "FROM arete_tms.invoice i\n"
                    + "WHERE NOT EXISTS (SELECT t2.invoice_number  FROM  arete_tms.bill_payment t2 WHERE i.invoice_No = t2.invoice_number and t2.status!='Inactive') and i.status!='Inactive' and i.tenant_code='" + tenantCode + "'");

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

    //**************Tenant Pop-up for Receipt*****************//    
    public List<PenaltyType> selectPenaltyType() throws HibernateException, SQLException {
        List<PenaltyType> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from PenaltyType where status!='Inactive'");
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

    //**************Landlord Pop-up for Receipt*****************//    
    public List<LandLordDetails> selectLandlordProperty() throws HibernateException, SQLException {
        List<LandLordDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        //System.out.println("assetName" + assetName);
        //System.out.println("flatno" + flatno);
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

    //**************TenantForInterest Pop-up for Receipt*****************//    
    public List<TenantDetails> selectTenantForInterest() throws HibernateException, SQLException {
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
            query = session.createSQLQuery("SELECT m.sr_no,s.service_requested,s.service_requested_cost,t.tenant_fname FROM material_issue m,tenant_details t,serivce_request s WHERE m.status!='Inactive' AND m.tenant_name=t.tenant_code and m.tenant_name='" + tenantCode + "' and m.appstatus='Approved' and m.sr_no=s.service_request_no GROUP BY m.sr_no");
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

    //**************Penalty Pop-up for Receipt*****************//    
    public List<PenaltyDetails> penaltyCal(String tenantCode) throws HibernateException, SQLException {
        List<PenaltyDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from PenaltyDetails where tenantCode='" + tenantCode + "'");
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
    public List<BillPayment> selectBillPayment(String tenantCode, String receiptType, String contractCode) throws HibernateException, SQLException {
        List<BillPayment> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from BillPayment where status!='Inactive' and tenantCode='" + tenantCode + "' and contractCode='" + contractCode + "' and receiptType='" + receiptType + "'");
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
                query = session.createSQLQuery("SELECT receipt_no FROM arete_tms.bill_payment where receipt_no like '%RECEIPT%' ORDER BY s_no ASC");
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

    public void getTenantDates(HttpServletRequest req, HttpServletResponse res, String tenantCode, String contractName, String fromDate, String toDate, String receiptType,String flotNo) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<BillPayment> citydata = null;
        try {
            tx = session.beginTransaction();
//            query = session.createSQLQuery("SELECT contractCode FROM arete_tms.bill_payment WHERE ('" + fromDate + "' <= period1) \n"
//                    + "AND ('" + toDate + "' >= period) AND tenant_code='" + tenantCode + "' AND contractCode='" + contractName + "' AND receipt_type='" + receiptType + "' and status!='Inactive'");

            query = session.createSQLQuery("select contractCode from arete_tms.bill_payment where substring(period,1,7)='" + fromDate + "' and contractCode='" + contractName + "' and \n"
                    + "receipt_type='" + receiptType + "' and tenant_code='" + tenantCode + "' and flat_no='" + flotNo + "'");

          
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

    public void getTenantInvoice(HttpServletRequest req, HttpServletResponse res, String tenantCode, String contractName, String fromDate, String toDate, String flotNo) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        //    List<Invoice> citydata = null;
        try {
            tx = session.beginTransaction();
//            query = session.createSQLQuery("SELECT contract_Code FROM arete_tms.invoice WHERE ('" + fromDate + "' <= period1) \n"
//                    + "AND ('" + toDate + "' >= period) AND tenant_code='" + tenantCode + "' and contract_Code='" + contractName + " and status!='Inactive'");

//           query = session.createSQLQuery("select contract_Code from arete_tms.invoice where period ='"+ fromDate + "'  between period1 \n"
//                    + "and tenant_code='" + tenantCode + "' and contract_Code='" + contractName + "' and status!='Inactive'");
//           
//             query = session.createSQLQuery("select contract_Code from arete_tms.invoice where period ='"+ fromDate + "' \n"
//                    + "and tenant_code='" + tenantCode + "' and flat_no='" + flotNo + "' and status!='Inactive'");
            query = session.createSQLQuery("select contract_Code from arete_tms.invoice where substring(period,1,7) ='" + fromDate + "' \n"
                    + "and tenant_code='" + tenantCode + "' and flat_no='" + flotNo + "' and status!='Inactive'");

            List<Object[]> citydata = query.list();
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

    //**************Validate Penalty******************//
    public void getTenantPenalty(HttpServletRequest req, HttpServletResponse res, String tenantCode, String penaltyType, String penaltyamount, String receiptType) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<BillPayment> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery(
                    "SELECT tenant_code FROM arete_tms.bill_payment WHERE tenant_code ='" + tenantCode + "'  AND receipt_type='" + receiptType + "' AND penalty_type='" + penaltyType + "' AND penalty_amount='" + penaltyamount + "' and status!='Inactive'");

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

    public void previousUtility(HttpServletRequest req, HttpServletResponse res, String tenantCode, String startsFrom) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        List<Object[]> citydata = null;
        Transaction tx = null;
        Query query = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT totalAmount,tenant_code FROM arete_tms.utility_details where tenant_code='" + tenantCode + "' and period='" + startsFrom + "' ");
            citydata = query.list();
            if (citydata.isEmpty() || citydata.contains(null)) {
                out.append("a");
            } else {
//                out.append(citydata.toString());
                for (Object[] st : citydata) {
                    out.append(st[0].toString());
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

    public void getTenantDues(HttpServletRequest req, HttpServletResponse res, String tenantCode, String receiptType, String contractCode) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<BillPayment> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT dues FROM arete_tms.bill_payment WHERE status!='Inactive' and tenant_code='" + tenantCode + "' and  contractCode='" + contractCode + "' and receipt_type='" + receiptType + "' ORDER BY s_no DESC LIMIT 1");
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

    public List<TenantDetails> tenantDetails(String tenantCode, String sno,String flotNo) throws HibernateException, SQLException {
        List<TenantDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from TenantDetails where tenantCode='" + tenantCode + "' and SNo='" + sno + "' and flatNo='" + flotNo + "'");
            datalist = query.list();

            if (datalist.equals(null) || datalist.isEmpty()) {
                query = session.createQuery("from TenantDetails where tenantCode='" + tenantCode + "' and flatNo='" + flotNo + "'");
                datalist = query.list();
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
        return datalist;
    }
    
    
     public List<TenantDetails> tenantDetails1(String tenantCode, String sno) throws HibernateException, SQLException {
        List<TenantDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from TenantDetails where tenantCode='" + tenantCode + "' and SNo='" + sno + "'");
            datalist = query.list();

            if (datalist.equals(null) || datalist.isEmpty()) {
                query = session.createQuery("from TenantDetails where tenantCode='" + tenantCode + "'");
                datalist = query.list();
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
        return datalist;
    }
    
    
    
    ////

    public List<TenantDetails> tenantDetails() throws HibernateException, SQLException {
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

    public List<Invoice> invoiceDetails(String sno) throws HibernateException, SQLException {
        List<Invoice> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null && sno != "") {
                query = session.createQuery("from Invoice where status!='Inactive' and SNo='" + sno + "'");
            } else {
                query = session.createQuery("from Invoice where status!='Inactive'");
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

//    public List<Invoice> defaultRentlist() throws HibernateException, SQLException {
//        List<Invoice> datalist = null;
//        Transaction tx = null;
//        Session session = getSessionFactory().openSession();
//        Query query = null;
//        try {
//            tx = session.beginTransaction();
//            {
//                query = session.createSQLQuery("SELECT * FROM arete_tms.invoice inv where datediff(curdate(),due_date)>1");
//
//            }
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
//    //////
//    //Newly added by lakshmi for default rent on 01mar2019
    public List<RentNotification> defaultRentlist() throws HibernateException, SQLException {
        List<RentNotification> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        System.out.println("today" + today);
        try {
            tx = session.beginTransaction();
            // if (tenantCategory.equals("Others")) {
//                query = session.createQuery("from SubAssetDetails where assetCode='" + assetCode + "' and recordStatus!='Occupied' and status!='Inactive'");
            // } else {
         //   query = session.createQuery("from RentNotification where notificationDate<='" + timestamp + "'");
            
            
              query = session.createQuery("from RentNotification order by tenantCode");
            // }
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
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        tx.commit();
        session.close();
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
            query = session.createQuery("from BillPayment where extra1='PDC' and status!='Inactive' order by SNo desc");
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

    // Newly added by lakshmi for dashboard based on from and to dates
    public List<BillPayment> listBill1fromtodate(String fromDate, String toDate) throws HibernateException, SQLException {
        List<BillPayment> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from BillPayment where extra1='PDC' and status!='Inactive' and lastmodifiedDate >='" + fromDate + "' and lastmodifiedDate <='" + toDate + "'");
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

    public List<BillPayment> listBill1() throws HibernateException, SQLException {
        List<BillPayment> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from BillPayment where extra1='CDC' and status!='Inactive' order by SNo desc");
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

    //Newly added by lakshmi for dashboard based on from and to dates
    public List<BillPayment> listBill11(String fromDate, String toDate) throws HibernateException, SQLException {
        List<BillPayment> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from BillPayment where extra1='CDC' and status!='Inactive' and lastmodifiedDate >='" + fromDate + "' and lastmodifiedDate <='" + toDate + "'");
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

    //newly added by lakshmi to get third party tenant details for default rent payment
    public List<Class> thirdpartyTenantDetails(String tenantCode, String className) {
        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (tenantCode == "" || tenantCode == null) {
                query = session.createQuery("from " + className + " where status!='Inactive'");
            } else {
                query = session.createQuery("from " + className + " where status!='Inactive' and tenantCode='" + tenantCode + "'");

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
    public List<Class> listFromToDates(String instanceVariable, String className, String fromDate, String toDate) {
        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (instanceVariable == "" || instanceVariable == null) {
                query = session.createQuery("from " + className + " where status!='Inactive' and lastmodifiedDate >='" + fromDate + "' and lastmodifiedDate <='" + toDate + "'");
            } else {
                query = session.createQuery("from " + className + " where status!='Inactive' and SNo='" + instanceVariable + "' and lastmodifiedDate >='" + fromDate + "' and lastmodifiedDate <='" + toDate + "'");

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
                query = session.createQuery("from " + className + " where status!='Inactive' and tenantCode='" + instanceVariable + "'");

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

    public List<Class> securityDepositList() {
        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("select * from arete_tms.bill_payment where status!='Inactive' and receipt_type='Security Deposit'");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    public List<Class> securityDepositList1(String tenantcode1) {
        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("select * from arete_tms.bill_payment where status!='Inactive' and tenant_code='" + tenantcode1 + "' and receipt_type='Security Deposit'");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

//    public List<BillPayment> securityDepositListBill() throws HibernateException, SQLException {
//        List<BillPayment> datalist = null;
//        Transaction tx = null;
//        Session session = getSessionFactory().openSession();
//        Query query = null;
//        try {
//            tx = session.beginTransaction();
//            query = session.createQuery("from BillPayment where status!='Inactive' and receiptType='Security Deposit'");
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
    public List<Class> Assetlist() {
        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("select * from arete_tms.asset_details where status!='Inactive'");

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    public List<Class> Tenantlist() {
        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("select * from arete_tms.tenant_details where status!='Inactive'");

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    public BillPayment getReceiptDetails(Integer sno) throws HibernateException, SQLException {
        BillPayment datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            datalist = (BillPayment) session.get(BillPayment.class, sno);
            //datalist = query.list();
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

    public List<AssetDetails> propertyList()
            throws HibernateException, SQLException {
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

    public List<ReceiptAttachment> receiptAttachment(String receiptNo) {
        List<ReceiptAttachment> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from ReceiptAttachment where receiptNo='" + receiptNo + "' and status!='Inactive'");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    public void receiptAttachmentDelete(Integer SNo)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
//            if (sno != null) {
            query = session.createQuery("delete from ReceiptAttachment where SNo='" + SNo + "'");
//            } else {
//                query = session.createQuery("delete from SalesCustomMenuList where bufferOne='" + orderNo + "'");
//            }();
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

    public void saveReceiptAttachment(ReceiptAttachment document) {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();

        session.save(document);
        tx.commit();
        session.close();
    }

    public List<Class> billlist(String className) {
        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from " + className + " where status!='Inactive' order by SNo desc");

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
    public List<Class> billlist1(String className, String fromDate, String toDate, String chequeType) {
        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from " + className + " where status!='Inactive'and receipt_type='" + chequeType + "' and lastmodifiedDate >='" + fromDate + "' and lastmodifiedDate <='" + toDate + "'");

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    public void getAssetCode1(HttpServletRequest req, HttpServletResponse res, String assetName1, String tenantCode) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<BillPayment> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT asset_code FROM arete_tms.tenant_details WHERE asset_name='" + assetName1 + "' and tenant_code='" + tenantCode + "'");
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

//     @Override
    public void saveReceiptGrid(List<BillPayment> receipts, List<ReceiptAttachment> receiptAttachs) {
        Session session = getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            for (BillPayment rec : receipts) {
                session.saveOrUpdate(rec);
            }
            for (ReceiptAttachment rec : receiptAttachs) {
                session.saveOrUpdate(rec);
            }
//            session.saveOrUpdate(transientInstance);
            tx.commit();
        } catch (Exception e) {
            if (null != tx) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }

    }

    public List gettenantCodewithlogin(String userid) {
        List code = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (userid != null) {
                query = session.createSQLQuery("select tenant_code from arete_tms.tenant_details where tenant_id='" + userid + "'");
            } else {
                query = session.createQuery("select tenant_code from arete_tms.tenant_details where status!='Inactive'");
            }
            code = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }

        return code;
    }

    public List<BillPayment> listBillForPDC(String tenantcode1) throws HibernateException, SQLException {
        List<BillPayment> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from BillPayment where extra1='PDC' and status!='Inactive' and tenantCode='" + tenantcode1 + "'");
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

    public List billlisttenantwise(String tenantcode1) {
        List list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from BillPayment where status!='Inactive' and tenantCode='" + tenantcode1 + "'");

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    public List<AssetUtilityDetails> itemCreaList(String assetName)
            throws HibernateException, SQLException {
        List<AssetUtilityDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from AssetUtilityDetails where  assetCode='" + assetName + "' and status!='Inactive'");//ItemCreation//itemSubCategory//ItemMaster//itemCategory
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

    public PortalTenantDetails gettenantAttach1(Integer id) {
        Session session = getSessionFactory().openSession();
        PortalTenantDetails exp = (PortalTenantDetails) session.get(PortalTenantDetails.class, id);
        session.close();
        return exp;
    }

    public String getTenOrgfileName1(String tenantCode) throws HibernateException, SQLException {
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

    public String getTenOrgfileName11(String tenantCode) throws HibernateException, SQLException {
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

    public byte[] getTenantAttachment1(String tenantCode) throws HibernateException, SQLException {
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
                System.out.println(Image);
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

    public List<BillPayment> listBillCdc(String tenantcode1) throws HibernateException, SQLException {
        List<BillPayment> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from BillPayment where extra1='CDC' and status!='Inactive' and tenantCode='" + tenantcode1 + "'");
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

    public byte[] getTenantAttachment11(String tenantCode) throws HibernateException, SQLException {
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
                System.out.println(Image);
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

    //Newly added by lakshmi for rent Invoice on 12mar2019
    public List<Invoice> rentList(String propertyName, String flatNo, String tenantId, Date rentInvoiceDate1) throws HibernateException, SQLException {
        List<Invoice> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            // if (tenantCategory.equals("Others")) {
//                query = session.createQuery("from SubAssetDetails where assetCode='" + assetCode + "' and recordStatus!='Occupied' and status!='Inactive'");
            // } else {
            //query = session.createQuery("from RentNotification");
            // }
            query = session.createQuery("from Invoice where assetName='" + propertyName + "' and flatNo='" + flatNo + "' and tenantId='" + tenantId + "' and status!='Inactive'");
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

    public List<Invoice> getInvoiceNo(String tenantCode) {
        List<Invoice> code = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (tenantCode != null) {
                query = session.createSQLQuery("SELECT invoice_no FROM arete_tms.invoice where invoice_no like '%INV%' ORDER BY s_no ASC");
            } else {
                query = session.createQuery("from Invoice where  status!='Inactive' ORDER BY lastmodifiedDate DESC");
            }
            code = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return code;
    }

    public List<Invoice> getInvoiceDetails(String column, String sno) {
        List<Invoice> code = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (column == "SNO") {
                query = session.createSQLQuery("SELECT s_no FROM arete_tms.invoice where s_no='" + sno + "'");
            } else if (column == "invoiceNo") {
                query = session.createSQLQuery("SELECT invoice_no FROM arete_tms.invoice where s_no='" + sno + "'");
            } else if (column == "tenantCode") {
                query = session.createSQLQuery("SELECT tenant_code FROM arete_tms.invoice where s_no='" + sno + "'");
            } else if (column == "assetCode") {
                query = session.createSQLQuery("SELECT asset_code FROM arete_tms.invoice where s_no='" + sno + "'");
            } else if (column == "dueDate") {
                query = session.createSQLQuery("SELECT due_date FROM arete_tms.invoice where s_no='" + sno + "'");
            }
            code = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return code;
    }

    public List<BillPayment> getBillPaymentDetails(String column, String sno) {
        List<BillPayment> code = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (column == "tenantCode") {
                query = session.createSQLQuery("SELECT tenant_code FROM arete_tms.bill_payment where s_no='" + sno + "'");
            } else if (column == "receiptNo") {
                query = session.createSQLQuery("SELECT receipt_no FROM arete_tms.bill_payment where s_no='" + sno + "'");
            } else if (column == "propertyName") {
                query = session.createSQLQuery("SELECT asset_name FROM arete_tms.bill_payment where s_no='" + sno + "'");
            } else if (column == "receiptDate") {
                query = session.createSQLQuery("SELECT receipt_date FROM arete_tms.bill_payment where s_no='" + sno + "'");
            } else if (column == "invoiceNo") {
                query = session.createSQLQuery("SELECT invoice_number FROM arete_tms.bill_payment where s_no='" + sno + "'");
            }
            code = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return code;
    }

    public List<String> getFlatNo(String propertyName) {
        List<String> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("select distinct flatNo from Invoice where status!='Inactive' and assetName='" + propertyName + "'");
            System.out.println("query" + query);
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    public List<String> getTenantId(String flatNo) {
        List<String> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("select distinct tenantId from Invoice where status!='Inactive' and flatNo='" + flatNo + "'");
            System.out.println("query" + query);
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    //newly added by lakshmi for rent invoice on 25Apr2019
    public List<Invoice> invoiceList() {
        List<Invoice> list = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from Invoice where  status!='Inactive' ORDER BY SNo ASC");

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return list;
    }

    //newly added by lakshmi for rent invoice on 25Apr2019
    public List<String> invoiceList1() {
        List<String> list = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT i.invoice_No\n"
                    + "FROM invoice i\n"
                    + "WHERE NOT EXISTS (SELECT t2.invoice_number  FROM  arete_tms.bill_payment t2 WHERE i.invoice_No = t2.invoice_number and t2.status!='Inactive') and i.status!='Inactive'");

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return list;
    }

    public List<Invoice> rentList(String propertyName) throws HibernateException, SQLException {
        List<Invoice> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (propertyName.equals("property")) {
                query = session.createQuery("select distinct assetName from Invoice where status!='Inactive'");
            } else if (propertyName.equals("flat")) {
                query = session.createQuery("select distinct flatNo from Invoice where status!='Inactive'");
            } else if (propertyName.equals("tenantId")) {
                query = session.createQuery("select distinct tenantId from Invoice where status!='Inactive'");
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

    public ThirdPartyTenantDetails getThirdTenantttach1(Integer SNo) {
        Session session = getSessionFactory().openSession();
        ThirdPartyTenantDetails exp = (ThirdPartyTenantDetails) session.get(ContractAttach.class, SNo);
        session.close();
        return exp;
    }

    //**************voiding Records****************** on 01May2019//
    public void voideRecord(String sno, String tenantCode, String assetCode, String invoiceNo) throws HibernateException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update Invoice set status='Inactive' where SNo='" + sno + "' and tenantCode='" + tenantCode + "' and assetCode='" + assetCode + "' and invoiceNo='" + invoiceNo + "'";
            Query query = session.createQuery(hql);
            query.executeUpdate();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        tx.commit();
        session.close();
    }

    public void voideRecord1(String sno, String tenantCode, String receiptNo, String propertyName, String invoiceNo) throws HibernateException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql1 = "update Invoice set status='Inactive' where tenantCode='" + tenantCode + "' and assetCode='" + propertyName + "' and invoiceNo='" + invoiceNo + "'";
            Query query1 = session.createQuery(hql1);
            query1.executeUpdate();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        tx.commit();
        session.close();
    }

    //**************voiding Records****************** on 01May2019//
    public void billPaymentVoideRecord(String sno, String tenantCode, String receiptNo, String propertyName, String invoiceNo) throws HibernateException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update BillPayment set status='Inactive' where SNo='" + sno + "' and tenantCode='" + tenantCode + "' and receiptNo='" + receiptNo + "' and assetName='" + propertyName + "'";
            Query query = session.createQuery(hql);
            query.executeUpdate();

        } catch (HibernateException e) {
            e.printStackTrace();
        }
        tx.commit();
        session.close();
    }

    public void updatetenantstatus() throws HibernateException, SQLException {
        String hql = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update TenantDetails set extra3='Renewel' where datediff(ends_to,curdate())<=30 and (extra3 is null or extra3 = ' ')");
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

    public void updatetenantstatus1(String sno) throws HibernateException, SQLException {
        String hql = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update TenantDetails set extra3='Renewed' where SNo='" + sno + "'");
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

    //Rent Invoice update actions 
    public void statusAppUpdate(String action, String remark, String userId, String sno, String appdate) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = null;
        try {
            hql = "update ServiceAccomadtion set recordStatus='" + action + "', remarks='" + remark + "',approverUser='" + userId + "',approverDate='" + appdate + "' where sno='" + sno + "'";

            Query query = session.createQuery(hql);
            int row = query.executeUpdate();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        tx.commit();
        session.close();
    }

    public void statusInvoiceUpdate(String sno, String appdate, String tenantNames) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = null;

        String sql = null;
        try {
            hql = "update RentInvoice set printedDate='" + appdate + "' where SNo='" + sno + "'";

            Query query = session.createQuery(hql);
            int row = query.executeUpdate();

//             sql = "update arete_tms.rent_invoice set printed_date='" + appdate + "' and tenant_id='" + tenantNames + "' where s_no='" + sno + "'";
//
//            Query query = session.createSQLQuery(sql);
//            int row = query.executeUpdate();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        tx.commit();
        session.close();
    }

    //Period Times of values 
    public void checkPeroid(HttpServletRequest req, HttpServletResponse res, String tenantCode, String contractCode, Date period) throws HibernateException, SQLException, IOException {

        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;

        StringBuffer result = new StringBuffer();
        Session session = getSessionFactory().openSession();

        Query query = null;
        Query query1 = null;

        try {
            tx = session.beginTransaction();
            query = session.createQuery("SELECT period FROM Invoice WHERE  tenantCode='" + tenantCode + "' and contractCode='" + contractCode + "' and period ='" + period + "'");
            //  query.setParameter("period", period);
            List<Object[]> licenseNoData = query.list();
            if (licenseNoData.isEmpty()) {

                out.append("No Data");

            } else {
                Iterator<Object[]> it = licenseNoData.iterator();
                while (it.hasNext()) {
                    Object ss = it.next();
                    out.append(ss.toString());
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
    
    @SuppressWarnings("unchecked")
    public List<TenantServices> tenantServicesList(String userId, String sNo)
            throws HibernateException, SQLException {
        List<TenantServices> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sNo == null) {

                query = session.createQuery("from TenantServices");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from TenantServices where sNo='" + sNo + "'");
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
    
    public void tenantServicesListSave(List<TenantServices> grid) {
        for (Iterator<TenantServices> iterator = grid.iterator(); iterator.hasNext();) {
            TenantServices test = (TenantServices) iterator.next();
            newTenantServicesListSave(test);
        }
    }
    
    public void newTenantServicesListSave(TenantServices dis) {
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
    public List<TenantServicesGrid> tenantServicesId(String userId, String propertyName)
            throws HibernateException, SQLException {
        List<TenantServicesGrid> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

                query = session.createQuery("from TenantServicesGrid where propertyName='" + propertyName + "'");
         
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
    public List<TenantServicesGrid> tenantServicesGridList(String userId, String sNo)
            throws HibernateException, SQLException {
        List<TenantServicesGrid> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sNo == null) {

                query = session.createQuery("from TenantServicesGrid");  //where userId='" + userId + "'
         
            } else {
                query = session.createQuery("from TenantServicesGrid where sNo='"+sNo+"'");
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
    
    public void tenantServicesGridListSave(List<TenantServicesGrid> grid) {
        for (Iterator<TenantServicesGrid> iterator = grid.iterator(); iterator.hasNext();) {
            TenantServicesGrid test = (TenantServicesGrid) iterator.next();
            newTenantServicesGridListSave(test);
        }
    }
    
    public void newTenantServicesGridListSave(TenantServicesGrid dis) {
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
    public List<TenantProfilings> tenantProfilingList(String userId, String sno)
            throws HibernateException, SQLException {
        List<TenantProfilings> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno == null) {

                query = session.createQuery("from TenantProfilings");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from TenantProfilings where sno='" + sno + "'");
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
    
    public void tenantProfilingListSave(List<TenantProfilings> grid) {
        for (Iterator<TenantProfilings> iterator = grid.iterator(); iterator.hasNext();) {
            TenantProfilings test = (TenantProfilings) iterator.next();
            newTenantProfilingListSave(test);
        }
    }
    
    public void newTenantProfilingListSave(TenantProfilings dis) {
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
    public List<BookingPropertyDetails> bookingPropertyDetailsList(String userId, String sno)
            throws HibernateException, SQLException {
        List<BookingPropertyDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno == null) {

                query = session.createQuery("from BookingPropertyDetails");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from BookingPropertyDetails where sno='" + sno + "'");
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
    
    public void bookingPropertyDetailsListSave(List<BookingPropertyDetails> grid) {
        for (Iterator<BookingPropertyDetails> iterator = grid.iterator(); iterator.hasNext();) {
            BookingPropertyDetails test = (BookingPropertyDetails) iterator.next();
            newBookingPropertyDetailsListSave(test);
        }
    }
    
    public void newBookingPropertyDetailsListSave(BookingPropertyDetails dis) {
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
    public List<QuotationDetails> quotationDetailsList(String userId, String sno)
            throws HibernateException, SQLException {
        List<QuotationDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno == null) {

                query = session.createQuery("from QuotationDetails where status='true'");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from QuotationDetails where SNo='" + sno + "' and status='true'");
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
    
    public void quotationDetailsListSave(List<QuotationDetails> grid) {
        for (Iterator<QuotationDetails> iterator = grid.iterator(); iterator.hasNext();) {
            QuotationDetails test = (QuotationDetails) iterator.next();
            newQuotationDetailsListSave(test);
        }
    }
    
    public void newQuotationDetailsListSave(QuotationDetails dis) {
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
    public List<CustomerTenacyDetails> customerTenancyDetailsList(String userId, String sno)
            throws HibernateException, SQLException {
        List<CustomerTenacyDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno == null) {

                query = session.createQuery("from CustomerTenacyDetails");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from CustomerTenacyDetails where sno='" + sno + "'");
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
    
    public void customerTenancyDetailsListSave(List<CustomerTenacyDetails> grid) {
        for (Iterator<CustomerTenacyDetails> iterator = grid.iterator(); iterator.hasNext();) {
            CustomerTenacyDetails test = (CustomerTenacyDetails) iterator.next();
            newCustomerTenancyDetailsListSave(test);
        }
    }
    
    public void newCustomerTenancyDetailsListSave(CustomerTenacyDetails dis) {
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
    public List<RentDetails> rentDetailsList(String userId, String sno)
            throws HibernateException, SQLException {
        List<RentDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno == null) {

                query = session.createQuery("from RentDetails");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from RentDetails where sno='" + sno + "'");
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
    
    public void rentDetailsListSave(List<RentDetails> grid) {
        for (Iterator<RentDetails> iterator = grid.iterator(); iterator.hasNext();) {
            RentDetails test = (RentDetails) iterator.next();
            newrentDetailsListSave(test);
        }
    }
    
    public void newrentDetailsListSave(RentDetails dis) {
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
    public List<ServiceDetails> ServiceDetailsList(String userId, String sno)
            throws HibernateException, SQLException {
        List<ServiceDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno == null) {

                query = session.createQuery("from ServiceDetails");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from ServiceDetails where sno='" + sno + "'");
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
    
    public void ServiceDetailsListSave(List<ServiceDetails> grid) {
        for (Iterator<ServiceDetails> iterator = grid.iterator(); iterator.hasNext();) {
            ServiceDetails test = (ServiceDetails) iterator.next();
            newServiceDetailsListSave(test);
        }
    }
    
    public void newServiceDetailsListSave(ServiceDetails dis) {
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
    public List<TermsCondition> TermsandConditionList(String userId, String sno)
            throws HibernateException, SQLException {
        List<TermsCondition> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno == null) {

                query = session.createQuery("from TermsCondition");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from TermsCondition where sno='" + sno + "'");
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
    
    public void TermsandConditionListSave(List<TermsCondition> grid) {
        for (Iterator<TermsCondition> iterator = grid.iterator(); iterator.hasNext();) {
            TermsCondition test = (TermsCondition) iterator.next();
            newTermsandConditionListSave(test);
        }
    }
    
    public void newTermsandConditionListSave(TermsCondition dis) {
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
    public List<ServiceDetailsGrid> ServiceDetailsGridList(String userId, String sno)
            throws HibernateException, SQLException {
        List<ServiceDetailsGrid> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno == null) {

                query = session.createQuery("from ServiceDetailsGrid");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from ServiceDetailsGrid where sno='" + sno + "'");
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
    
    public void ServiceDetailsGridListSave(List<ServiceDetailsGrid> grid) {
        for (Iterator<ServiceDetailsGrid> iterator = grid.iterator(); iterator.hasNext();) {
            ServiceDetailsGrid test = (ServiceDetailsGrid) iterator.next();
            newServiceDetailsGridListSave(test);
        }
    }
    
    public void newServiceDetailsGridListSave(ServiceDetailsGrid dis) {
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
    public List<CustomerTenacyDetailsGrid> customerTenancyDetailsGridList(String userId, String sno)
            throws HibernateException, SQLException {
        List<CustomerTenacyDetailsGrid> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno == null) {

                query = session.createQuery("from CustomerTenacyDetailsGrid");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from CustomerTenacyDetailsGrid where sno='" + sno + "'");
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
    
    public void customerTenancyDetailsGridListSave(List<CustomerTenacyDetailsGrid> grid) {
        for (Iterator<CustomerTenacyDetailsGrid> iterator = grid.iterator(); iterator.hasNext();) {
            CustomerTenacyDetailsGrid test = (CustomerTenacyDetailsGrid) iterator.next();
            newcustomerTenancyDetailsGridListSave(test);
        }
    }
    
    public void newcustomerTenancyDetailsGridListSave(CustomerTenacyDetailsGrid dis) {
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
    public List<ComUtility> tenantCommonUtilityList(String userId, String SNo)
            throws HibernateException, SQLException {
        List<ComUtility> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {

                query = session.createQuery("from ComUtility");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from ComUtility where SNo='" + SNo + "'");
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
    
    public void tenantCommonUtilityListSave(List<ComUtility> grid) {
        for (Iterator<ComUtility> iterator = grid.iterator(); iterator.hasNext();) {
            ComUtility test = (ComUtility) iterator.next();
            newTenantCommonUtilityListSave(test);
        }
    }
    
    public void newTenantCommonUtilityListSave(ComUtility dis) {
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
    public List<IndividualUtilityManagement> individualUtilityList(String userId, String sNo)
            throws HibernateException, SQLException {
        List<IndividualUtilityManagement> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sNo == null) {

                query = session.createQuery("from IndividualUtilityManagement");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from IndividualUtilityManagement where sNo='" + sNo + "'");
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
    
    public void individualUtilityListSave(List<IndividualUtilityManagement> grid) {
        for (Iterator<IndividualUtilityManagement> iterator = grid.iterator(); iterator.hasNext();) {
            IndividualUtilityManagement test = (IndividualUtilityManagement) iterator.next();
            newIndividualUtilityListSave(test);
        }
    }
    
    public void newIndividualUtilityListSave(IndividualUtilityManagement dis) {
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
    public List<PettyCash> pettyCashList(String userId, String sNo)
            throws HibernateException, SQLException {
        List<PettyCash> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sNo == null) {

                query = session.createQuery("from PettyCash");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from PettyCash where sNo='" + sNo + "'");
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
    
    public void pettyCashListSave(List<PettyCash> grid) {
        for (Iterator<PettyCash> iterator = grid.iterator(); iterator.hasNext();) {
            PettyCash test = (PettyCash) iterator.next();
            newPettyCashListSave(test);
        }
    }
    
    public void newPettyCashListSave(PettyCash dis) {
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
    public List<PettyCashGrid> PettyCashId(String userId, String walletNumber)
            throws HibernateException, SQLException {
        List<PettyCashGrid> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

                query = session.createQuery("from PettyCashGrid where walletNumber='" + walletNumber + "'");
         
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
    public List<PettyCashGrid> pettyCashGridList(String userId, String sNo)
            throws HibernateException, SQLException {
        List<PettyCashGrid> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sNo == null) {

                query = session.createQuery("from PettyCashGrid");  //where userId='" + userId + "'
         
            } else {
                query = session.createQuery("from PettyCashGrid where sNo='"+sNo+"'");
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
    
    public void pettyCashGridListSave(List<PettyCashGrid> grid) {
        for (Iterator<PettyCashGrid> iterator = grid.iterator(); iterator.hasNext();) {
            PettyCashGrid test = (PettyCashGrid) iterator.next();
            newPettyCashGridListSave(test);
        }
    }
    
    public void newPettyCashGridListSave(PettyCashGrid dis) {
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
    public List<pettyCashTransaction> pettyCashTransactionList(String userId, String sNo)
            throws HibernateException, SQLException {
        List<pettyCashTransaction> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sNo == null) {

                query = session.createQuery("from pettyCashTransaction");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from pettyCashTransaction where sNo='" + sNo + "'");
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
    
    public void pettyCashTransactionListSave(List<pettyCashTransaction> grid) {
        for (Iterator<pettyCashTransaction> iterator = grid.iterator(); iterator.hasNext();) {
            pettyCashTransaction test = (pettyCashTransaction) iterator.next();
            newPettyCashTransactionListSave(test);
        }
    }
    
    public void newPettyCashTransactionListSave(pettyCashTransaction dis) {
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
    public List<pettyCashTransactionGrid> pettyCashTransactionId(String userId, String transactionNumber)
            throws HibernateException, SQLException {
        List<pettyCashTransactionGrid> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

                query = session.createQuery("from pettyCashTransactionGrid where transactionNumber='" + transactionNumber + "'");
         
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
    public List<pettyCashTransactionGrid> pettyCashTransactionGridList(String userId, String sNo)
            throws HibernateException, SQLException {
        List<pettyCashTransactionGrid> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sNo == null) {

                query = session.createQuery("from pettyCashTransactionGrid");  //where userId='" + userId + "'
         
            } else {
                query = session.createQuery("from pettyCashTransactionGrid where sNo='"+sNo+"'");
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
    
    public void pettyCashTransactionGridListSave(List<pettyCashTransactionGrid> grid) {
        for (Iterator<pettyCashTransactionGrid> iterator = grid.iterator(); iterator.hasNext();) {
            pettyCashTransactionGrid test = (pettyCashTransactionGrid) iterator.next();
            newPettyCashTransactionGridListSave(test);
        }
    }
    
    public void newPettyCashTransactionGridListSave(pettyCashTransactionGrid dis) {
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
    public List<IncomeTracking> incomeAmountList(String userId, String sNo)
            throws HibernateException, SQLException {
        List<IncomeTracking> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sNo == null) {

                query = session.createQuery("from IncomeTracking");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from IncomeTracking where sNo='" + sNo + "'");
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
    
    public void incomeAmountListSave(List<IncomeTracking> grid) {
        for (Iterator<IncomeTracking> iterator = grid.iterator(); iterator.hasNext();) {
            IncomeTracking test = (IncomeTracking) iterator.next();
            newIncomeAmountListSave(test);
        }
    }
    
    public void newIncomeAmountListSave(IncomeTracking dis) {
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
    public List<IncomeTrackingGrid> incomeTrackingId(String userId, String property)
            throws HibernateException, SQLException {
        List<IncomeTrackingGrid> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

                query = session.createQuery("from IncomeTrackingGrid where property='" + property + "'");
         
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
    public List<IncomeTrackingGrid> incomeAmountGridList(String userId, String sNo)
            throws HibernateException, SQLException {
        List<IncomeTrackingGrid> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sNo == null) {

                query = session.createQuery("from IncomeTrackingGrid");  //where userId='" + userId + "'
         
            } else {
                query = session.createQuery("from IncomeTrackingGrid where sNo='"+sNo+"'");
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
    
    public void incomeAmountGridListSave(List<IncomeTrackingGrid> grid) {
        for (Iterator<IncomeTrackingGrid> iterator = grid.iterator(); iterator.hasNext();) {
            IncomeTrackingGrid test = (IncomeTrackingGrid) iterator.next();
            newIncomeAmountGridListSave(test);
        }
    }
    
    public void newIncomeAmountGridListSave(IncomeTrackingGrid dis) {
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
    public List<ExpenceTracking> expenceAmountList(String userId, String sNo)
            throws HibernateException, SQLException {
        List<ExpenceTracking> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sNo == null) {

                query = session.createQuery("from ExpenceTracking");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from ExpenceTracking where sNo='" + sNo + "'");
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
    
    public void expenceAmountListSave(List<ExpenceTracking> grid) {
        for (Iterator<ExpenceTracking> iterator = grid.iterator(); iterator.hasNext();) {
            ExpenceTracking test = (ExpenceTracking) iterator.next();
            newexpenceAmountListSave(test);
        }
    }
    
    public void newexpenceAmountListSave(ExpenceTracking dis) {
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
    public List<ExpenceTrackingGrid> expenceTrackingId(String userId, String property)
            throws HibernateException, SQLException {
        List<ExpenceTrackingGrid> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

                query = session.createQuery("from ExpenceTrackingGrid where property='" + property + "'");
         
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
    public List<ExpenceTrackingGrid> expenceAmountGridList(String userId, String sNo)
            throws HibernateException, SQLException {
        List<ExpenceTrackingGrid> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sNo == null) {

                query = session.createQuery("from ExpenceTrackingGrid");  //where userId='" + userId + "'
         
            } else {
                query = session.createQuery("from ExpenceTrackingGrid where sNo='"+sNo+"'");
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
    
    public void expenceAmountGridListSave(List<ExpenceTrackingGrid> grid) {
        for (Iterator<ExpenceTrackingGrid> iterator = grid.iterator(); iterator.hasNext();) {
            ExpenceTrackingGrid test = (ExpenceTrackingGrid) iterator.next();
            newexpenceAmountGridListSave(test);
        }
    }
    
    public void newexpenceAmountGridListSave(ExpenceTrackingGrid dis) {
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
    public Integer getBookingId() {
        List<Integer> list = null;
        Integer num = null;
        Transaction tx1 = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx1 = session.beginTransaction();
            query = session.createSQLQuery("select cast(count(*) as int) from arete_tms.booking_property_details1");

            list = query.list();

            if (!list.isEmpty()) {
                num = list.get(0);
            }
            tx1.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return num;
    }
    
    @SuppressWarnings("unchecked")
    public List<Enqueries> newEnquiryList(String userId, String sNo)
            throws HibernateException, SQLException {
        List<Enqueries> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sNo == null) {

                query = session.createQuery("from Enqueries");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from Enqueries where sNo='" + sNo + "'");
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
    
    public void newEnquiryListSave(List<Enqueries> grid) {
        for (Iterator<Enqueries> iterator = grid.iterator(); iterator.hasNext();) {
            Enqueries test = (Enqueries) iterator.next();
            newNewEnquiryListSave(test);
        }
    }
    
    public void newNewEnquiryListSave(Enqueries dis) {
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
    
    public Integer getEnquiryId() {
        List<Integer> list = null;
        Integer num = null;
        Transaction tx1 = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx1 = session.beginTransaction();
            query = session.createSQLQuery("select cast(count(*) as int) from arete_tms.enqueries");

            list = query.list();

            if (!list.isEmpty()) {
                num = list.get(0);
            }
            tx1.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return num;
    }
    
    @SuppressWarnings("unchecked")
    public List<String> getPropertyList() throws HibernateException, SQLException {
        List<String> datalist = null;
        String data = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select distinct asset_code from arete_tms.asset_details");

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
    public Integer getQuotationId() {
        List<Integer> list = null;
        Integer num = null;
        Transaction tx1 = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx1 = session.beginTransaction();
            query = session.createSQLQuery("select cast(count(*) as int) from arete_tms.quotation_details");

            list = query.list();

            if (!list.isEmpty()) {
                num = list.get(0);
            }
            tx1.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return num;
    }
    
    public void updateUtilityManagementStatus(String sNo,String updateStatus) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = null;
        try {
            if (updateStatus.equals("Active") || updateStatus.equals("Update0")) {
                hql = "update IndividualUtilityManagement set updateStatus='Inactive' where sNo='" + sNo + "'";
            } else {
                hql = "update IndividualUtilityManagement set updateStatus='Active' where sNo='" + sNo + "'";
            }
            Query query = session.createQuery(hql);
            int row = query.executeUpdate();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        tx.commit();
        session.close();
    }
    public List<Enqueries> selectEnquiryDetails()
            throws HibernateException, SQLException {
        List<Enqueries> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from Enqueries");

 

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
    public List<QuotationDetails> selectQuotationDetails()
            throws HibernateException, SQLException {
        List<QuotationDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT qd.s_no,qd.enquiry_id,qd.quotation_id,qd.quotation_number,qd.quotation_date,qd.quotation_expiry,\n" +
"qd.currency,ctd.customer_type,ctd.customer_name,ctd.tenant_id,ctd.business_name,ctd.business_cr_number,\n" +
"ctdg.contact_person,ctdg.registered_email_id,ctdg.phone_no,\n" +
"ctd.billing_address,ctd.permenant_address,ctd.jointee_name_1,ctd.jointee_address_1,ctd.jointee_name_2,\n" +
"ctd.jointee_address_2,ctd.sponsor_name,ctd.if_working,ctd.sponsor_address,ctd.sponsor_email,\n" +
"ctd.attachment,ctd.id_card_type,bpd.property_code,bpd.property_name,bpd.tenancy_start_date,bpd.tenancy_end_date,\n" +
"bpd.mezzanine_floor,bpd.unit_no,bpd.base_rent,sd.service_category,sd.service_name,sd.charges_quoted1,\n" +
"sd.vat_percentage1,sd.vat_amount1,sd.total_amount1,sd.security_deposit,sd.advance,\n" +
"rd.unit_no1,rd.rent_period,rd.charges_quoted,rd.vat_percentage,rd.vat_amount,rd.total_amount,tc.payment_terms,\n" +
"tc.contact_terms,tc.add_attachment\n" +
"FROM arete_tms.quotation_details qd\n" +
"JOIN arete_tms.customer_tenancy_details ctd ON qd.quotation_number = ctd.quotation_number\n" +
"JOIN arete_tms.booking_property_details bpd ON ctd.quotation_number = bpd.quotation_number\n" +
"JOIN arete_tms.service_details_grid sd ON bpd.quotation_number = sd.quotation_number\n" +
"JOIN arete_tms.rent_details rd ON sd.quotation_number = rd.quotation_number\n" +
"JOIN arete_tms.terms_condition tc ON rd.quotation_number = tc.quotation_number\n" +
"JOIN arete_tms.customer_tenancy_details_grid ctdg ON tc.quotation_number = ctdg.quotation_number\n" +
"WHERE qd.s_no = ctd.s_no");
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
    public List<BookingPropertyDetails1> bookingPropertyDetailsList1(String userId, String sno)
            throws HibernateException, SQLException {
        List<BookingPropertyDetails1> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno == null) {

                query = session.createQuery("from BookingPropertyDetails1");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from BookingPropertyDetails1 where sno='" + sno + "'");
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
    public List<QuotationDetails1> quotationDetailsList1(String userId, String sno)
            throws HibernateException, SQLException {
        List<QuotationDetails1> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno == null) {

                query = session.createQuery("from QuotationDetails1 where status='true'");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from QuotationDetails1 where SNo='" + sno + "' and status='true'");
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
    public List<CustomerTenacyDetails1> customerTenancyDetailsList1(String userId, String sno)
            throws HibernateException, SQLException {
        List<CustomerTenacyDetails1> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno == null) {

                query = session.createQuery("from CustomerTenacyDetails1");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from CustomerTenacyDetails1 where sno='" + sno + "'");
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
    public List<RentDetails1> rentDetailsList1(String userId, String sno)
            throws HibernateException, SQLException {
        List<RentDetails1> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno == null) {

                query = session.createQuery("from RentDetails1");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from RentDetails1 where sno='" + sno + "'");
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
    public List<ServiceDetailsGrid1> ServiceDetailsGridList1(String userId, String sno)
            throws HibernateException, SQLException {
        List<ServiceDetailsGrid1> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno == null) {

                query = session.createQuery("from ServiceDetailsGrid1");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from ServiceDetailsGrid1 where sno='" + sno + "'");
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
    public List<TermsCondition1> TermsandConditionList1(String userId, String sno)
            throws HibernateException, SQLException {
        List<TermsCondition1> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno == null) {

                query = session.createQuery("from TermsCondition1");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from TermsCondition1 where sno='" + sno + "'");
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
    public List<BookingPropertyDetails1> bookingPropertyDetailsList12(String userId, String sno)
            throws HibernateException, SQLException {
        List<BookingPropertyDetails1> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno == null) {

                query = session.createQuery("from BookingPropertyDetails1");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from BookingPropertyDetails1 where sno='" + sno + "'");
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
    public void bookingPropertyDetailsListSave1(List<BookingPropertyDetails1> grid) {
        for (Iterator<BookingPropertyDetails1> iterator = grid.iterator(); iterator.hasNext();) {
            BookingPropertyDetails1 test = (BookingPropertyDetails1) iterator.next();
            newBookingPropertyDetailsListSave1(test);
        }
    }
    public void newBookingPropertyDetailsListSave1(BookingPropertyDetails1 dis) {
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
    public List<QuotationDetails1> quotationDetailsList12(String userId, String sno)
            throws HibernateException, SQLException {
        List<QuotationDetails1> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno == null) {

                query = session.createQuery("from QuotationDetails1 where status='true'");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from QuotationDetails1 where SNo='" + sno + "' and status='true'");
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
    
    public void quotationDetailsListSave1(List<QuotationDetails1> grid) {
        for (Iterator<QuotationDetails1> iterator = grid.iterator(); iterator.hasNext();) {
            QuotationDetails1 test = (QuotationDetails1) iterator.next();
            newQuotationDetailsListSave1(test);
        }
    }
    
    public void newQuotationDetailsListSave1(QuotationDetails1 dis) {
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
    public List<TermsCondition1> TermsandConditionList12(String userId, String sno)
            throws HibernateException, SQLException {
        List<TermsCondition1> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno == null) {

                query = session.createQuery("from TermsCondition1");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from TermsCondition1 where sno='" + sno + "'");
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
    
    public void TermsandConditionListSave1(List<TermsCondition1> grid) {
        for (Iterator<TermsCondition1> iterator = grid.iterator(); iterator.hasNext();) {
            TermsCondition1 test = (TermsCondition1) iterator.next();
            newTermsandConditionListSave1(test);
        }
    }
    
    public void newTermsandConditionListSave1(TermsCondition1 dis) {
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
    public List<CustomerTenacyDetails1> customerTenancyDetailsList12(String userId, String sno)
            throws HibernateException, SQLException {
        List<CustomerTenacyDetails1> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno == null) {

                query = session.createQuery("from CustomerTenacyDetails1");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from CustomerTenacyDetails1 where sno='" + sno + "'");
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
    
    public void customerTenancyDetailsListSave1(List<CustomerTenacyDetails1> grid) {
        for (Iterator<CustomerTenacyDetails1> iterator = grid.iterator(); iterator.hasNext();) {
            CustomerTenacyDetails1 test = (CustomerTenacyDetails1) iterator.next();
            newCustomerTenancyDetailsListSave1(test);
        }
    }
    
    public void newCustomerTenancyDetailsListSave1(CustomerTenacyDetails1 dis) {
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
    public List<ServiceDetailsGrid1> ServiceDetailsGridList12(String userId, String sno)
            throws HibernateException, SQLException {
        List<ServiceDetailsGrid1> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno == null) {

                query = session.createQuery("from ServiceDetailsGrid1");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from ServiceDetailsGrid1 where sno='" + sno + "'");
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
    
    public void ServiceDetailsGridListSave1(List<ServiceDetailsGrid1> grid) {
        for (Iterator<ServiceDetailsGrid1> iterator = grid.iterator(); iterator.hasNext();) {
            ServiceDetailsGrid1 test = (ServiceDetailsGrid1) iterator.next();
            newServiceDetailsGridListSave1(test);
        }
    }
    
    public void newServiceDetailsGridListSave1(ServiceDetailsGrid1 dis) {
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
    public List<RentDetails1> rentDetailsList12(String userId, String sno)
            throws HibernateException, SQLException {
        List<RentDetails1> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno == null) {

                query = session.createQuery("from RentDetails1");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from RentDetails1 where sno='" + sno + "'");
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
    
    public void rentDetailsListSave1(List<RentDetails1> grid) {
        for (Iterator<RentDetails1> iterator = grid.iterator(); iterator.hasNext();) {
            RentDetails1 test = (RentDetails1) iterator.next();
            newrentDetailsListSave1(test);
        }
    }
    
    public void newrentDetailsListSave1(RentDetails1 dis) {
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
    public List<CustomerTenacyDetailsGrid1> customerTenancyDetailsGridList1(String userId, String sno)
            throws HibernateException, SQLException {
        List<CustomerTenacyDetailsGrid1> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno == null) {

                query = session.createQuery("from CustomerTenacyDetailsGrid1");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from CustomerTenacyDetailsGrid1 where sno='" + sno + "'");
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
    
    public void customerTenancyDetailsGridListSave1(List<CustomerTenacyDetailsGrid1> grid) {
        for (Iterator<CustomerTenacyDetailsGrid1> iterator = grid.iterator(); iterator.hasNext();) {
            CustomerTenacyDetailsGrid1 test = (CustomerTenacyDetailsGrid1) iterator.next();
            newcustomerTenancyDetailsGridListSave1(test);
        }
    }
    
    public void newcustomerTenancyDetailsGridListSave1(CustomerTenacyDetailsGrid1 dis) {
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
 
public Integer getQuotationNumberCount(String quotationNumber) {
    List<BigInteger> list = null;
    Integer num = null;
    Transaction tx1 = null;
    Session session = getSessionFactory().openSession();
    Query query = null;
    try {
        tx1 = session.beginTransaction();
        query = session.createSQLQuery("SELECT COUNT(quotation_number) FROM arete_tms.quotation_details WHERE quotation_number = :quotationNumber")
                .setParameter("quotationNumber", quotationNumber);

        list = query.list();

        if (!list.isEmpty()) {
            BigInteger countBigInt = list.get(0);
            num = countBigInt.intValue();
        }
        tx1.commit();
    } catch (HibernateException e) {
        e.printStackTrace();
    } finally {
        session.close();
    }
    return num;
}
@SuppressWarnings("unchecked")
    public List<QuotationDetails> quotationNumbercount(String userId)
            throws HibernateException, SQLException {
        List<QuotationDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
           
                query = session.createSQLQuery("SELECT quotation_number FROM arete_tms.quotation_details");  //where userId='" + userId + "
         
               
           
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
    public void fetchPropertyDetails(HttpServletRequest req, HttpServletResponse res, String Property)
            throws HibernateException, SQLException, IOException {

        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

                query = session.createSQLQuery("select sub_asset_code from arete_tms.sub_asset_details where asset_code='"+Property+"'");
                List<Object> cityData = query.list();  
                
                if (cityData.isEmpty()) {
                    out.append("No Data");
                } else {
                   
                    for (Object st : cityData) {
                        System.out.println(st);
                        out.append(st + "/@");
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

    @SuppressWarnings("unchecked")
    public void fetchVacantPropertyDetails(HttpServletRequest req, HttpServletResponse res, String Property,String recordStatus)
            throws HibernateException, SQLException, IOException {

        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

                query = session.createSQLQuery("select sub_asset_code from arete_tms.sub_asset_details where asset_code='"+Property+"'and record_status='"+recordStatus+"'");
                List<Object> cityData = query.list();  
                
                if (cityData.isEmpty()) {
                    out.append("No Data");
                } else {
                   
                    for (Object st : cityData) {
                        System.out.println(st);
                        out.append(st + "/@");
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
    @SuppressWarnings("unchecked")
    public void fetchBookedPropertyDetails(HttpServletRequest req, HttpServletResponse res, String Property,String recordStatus)
            throws HibernateException, SQLException, IOException {

        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

                query = session.createSQLQuery("select sub_asset_code from arete_tms.sub_asset_details where asset_code='"+Property+"'and record_status='"+recordStatus+"'");
                List<Object> cityData = query.list();  
                
                if (cityData.isEmpty()) {
                    out.append("No Data");
                } else {
                   
                    for (Object st : cityData) {
                        System.out.println(st);
                        out.append(st + "/@");
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
    
    public void updateEnquiryStatus(String status, String checklistPk) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = null;
        try {

            hql = "update Enqueries set status='"+status+"' where s_no='"+checklistPk+"'";

            Query query = session.createQuery(hql);
            int row = query.executeUpdate();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        tx.commit();
        session.close();
    }
    @SuppressWarnings("unchecked")
    public void fetchOccupiedPropertyDetails(HttpServletRequest req, HttpServletResponse res, String Property,String recordStatus)
            throws HibernateException, SQLException, IOException {

        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

                query = session.createSQLQuery("select sub_asset_code from arete_tms.sub_asset_details where asset_code='"+Property+"'and record_status='"+recordStatus+"'");
                List<Object> cityData = query.list();  
                
                if (cityData.isEmpty()) {
                    out.append("No Data");
                } else {
                   
                    for (Object st : cityData) {
                        System.out.println(st);
                        out.append(st + "/@");
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
    public void updateContractUnitDetails(String subAssetCode, String recordstatus1) throws HibernateException, SQLException {
        String hql = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update ContractUnitDetails set recordStatus='" + recordstatus1 + "' where unit_no='" + subAssetCode + "'");
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
     public void saveAssetAttach(List<TenantProfilingDocument> bdpfFile) {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            Iterator<TenantProfilingDocument> itr = bdpfFile.iterator();
            while (itr.hasNext()) {
                TenantProfilingDocument next = itr.next();
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
    public void fetchCommonUtilityDetails(HttpServletRequest req, HttpServletResponse res)
            throws HibernateException, SQLException, IOException {

        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

                query = session.createSQLQuery("select * from arete_tms.com_utility");
                List<Object> cityData = query.list();  
                
                if (cityData.isEmpty()) {
                    out.append("No Data");
                } else {
                   
                    for (Object st : cityData) {
                        System.out.println(st);
                        out.append(st + "/@");
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
    @SuppressWarnings("unchecked")
    public void fetchIndividualUtilityDetails(HttpServletRequest req, HttpServletResponse res)
            throws HibernateException, SQLException, IOException {

        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

                query = session.createSQLQuery("select * from arete_tms.individual_utility_management");
                List<Object> cityData = query.list();  
                
                if (cityData.isEmpty()) {
                    out.append("No Data");
                } else {
                   
                    for (Object st : cityData) {
                        System.out.println(st);
                        out.append(st + "/@");
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
}
