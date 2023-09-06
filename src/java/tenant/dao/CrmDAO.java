 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.dao;

import java.io.IOException;
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
import tenant.classes.*;
import tenant.other.classes.commonInterface;

/**
 *
 * @author ebs-sdd05
 */
public class CrmDAO extends HibernateDaoSupport implements commonInterface {

    public Integer checkUser(String user, String pass) {
        Integer noofuser = 0;
        List<BigInteger> totuser = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            totuser = session.createSQLQuery("SELECT count(*) FROM user_registration where USER_ID='" + user + "' and PASSWORD='" + pass + "'").list();
            String val = "" + totuser.get(0);
            noofuser = Integer.parseInt(val);
            tx.commit();
            tx = null;
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return noofuser;
    }

    //................................    Vacating  List Page         ..............................................
    public List<Vacating> vacatingList(String userId, String orgId, String SNo)
            throws HibernateException, SQLException {
        List<Vacating> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from Vacating where status!='Inactive'");

            } else {
                query = session.createQuery("from Vacating where sno='" + SNo + "' and status!='Inactive'");
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

    //................................ To Fetch Property Name         ..............................................
    public List<Vacating> vacatingAssetName(String assetCode)
            throws HibernateException, SQLException {
        List<Vacating> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from AssetDetails where assetCode='" + assetCode + "'");
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

    //................................ Query to fetch Floor Details for vacating .......................................
    public List<Vacating> vacatingSubAssetName(String subAssetCode) throws HibernateException, SQLException {
        List<Vacating> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from SubAssetDetails where subAssetCode='" + subAssetCode + "'");

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

    //======================Select Advance Dues ===============================//
    public void selectAdvDues(HttpServletRequest req, HttpServletResponse res, String tenantCode, String recieptType) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        List<BillPayment> citydata = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            if (recieptType.equals("Advance") && !tenantCode.equals("")) {
                tx = session.beginTransaction();
                query = session.createSQLQuery("SELECT dues FROM arete_tms.bill_payment WHERE tenant_code='" + tenantCode + "' and receipt_type='" + recieptType + "' ORDER BY s_no DESC LIMIT 1");
                citydata = query.list();
//                System.out.println(citydata);
                if (null == citydata || citydata.size() == 0) {
                    query = session.createSQLQuery("SELECT advance_amount FROM arete_tms.tenant_details WHERE tenant_code='" + tenantCode + "' LIMIT 1");
                    citydata = query.list();
                    out.append(citydata.toString());
                } else {
                    out.append(citydata.toString());
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

    //======================Select Rent and Service Dues ===============================//
    public void selectRentDues(HttpServletRequest req, HttpServletResponse res, String tenantCode, String recieptType, String contStartDate, String contEndDate) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        List<BillPayment> citydata = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            if (recieptType.equals("Rent") && !tenantCode.equals("")) {
                tx = session.beginTransaction();
                query = session.createSQLQuery("SELECT sum(amount) FROM arete_tms.bill_payment WHERE tenant_code='" + tenantCode + "' and receipt_type='" + recieptType + "' and period>='" + contStartDate + "' and period1<='" + contEndDate + "'");
                citydata = query.list();
                if (citydata.isEmpty() || citydata.contains(null)) {
                    out.append("a");
                } else {
                    out.append(citydata.toString());
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

    //======================Select ServiceDuesIssue ===============================//
    public void selectServiceDuesIssue(HttpServletRequest req, HttpServletResponse res, String tenantCode, String recieptType) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        List<MaterialIssue> list = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            if (!tenantCode.equals("")) {
                tx = session.beginTransaction();
                query = session.createQuery("select sum(totalPrice) from MaterialIssue where tenantName='" + tenantCode + "'");
                list = query.list();
                Iterator it = list.iterator();
                String totalServiceDues = "";
                while (it.hasNext()) {
                    totalServiceDues += it.next();
                }
                out.append(totalServiceDues);
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

    //======================Select ServiceDues ===============================//
    public void selectServiceDues(HttpServletRequest req, HttpServletResponse res, String tenantCode, String recieptType) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        List<BillPayment> list = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            if (recieptType.equals("Service")) {
                tx = session.beginTransaction();
                query = session.createQuery("select sum(amount) from BillPayment where tenantCode ='" + tenantCode + "' and receiptType = '" + recieptType + "'");
                list = query.list();
                Iterator it = list.iterator();
                String totalServiceDues = "";
                while (it.hasNext()) {
                    totalServiceDues += it.next();
                }
                out.append(totalServiceDues);
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

    //=======================Vacating Code Check================================
    public List<Vacating> vacatingCodeCheck(String campaignMediaName) {
        List<Vacating> Code = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (campaignMediaName != null) {
                query = session.createSQLQuery("SELECT Vacating_Code from arete_tms.vacating where Vacating_Code like '%VACAT%'");
            } else {
                query = session.createQuery("from Vacating where  status!='Inactive' ORDER BY lasttmodifiedDate DESC");
            }
            Code = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return Code;
    }

    //========================Vacating Form Save================================
    public void VacatingSave(Vacating dis) throws HibernateException, SQLException {
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

    //========================Vacating Form Save================================
    public void vacatingsave1(List<Vacating> grid) throws HibernateException, SQLException {
        for (Iterator<Vacating> iterator = grid.iterator(); iterator.hasNext();) {
            Vacating test = (Vacating) iterator.next();
            VacatingSave(test);
        }
    }
//=================================Vacating Flat ==========================

    public void updateSubasset(String assetCode, String subAssetCode, String recordstatus1)
            throws HibernateException, SQLException {
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

    //===================================updateTenant===========
    public void updateTenant(String tenantCode, String recordstatus2)
            throws HibernateException, SQLException {
        String hql = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update TenantDetails set vacatestatus='" + recordstatus2 + "' where  tenantCode='" + tenantCode + "'");
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

    //==================================Select Tenant===========================
    public List<TenantDetails> selectTenantName()
            throws HibernateException, SQLException {
        List<TenantDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("select td.tenantCode,td.tenantFname,td.assetName,ad.assetName,td.subclassifiedAstno,sad.subAssetName,td.endsTo,td.advanceAmount,td.waterBillno,td.electricityBillno,td.crIdNo,td.contractPeriod,td.billingCycle,td.totalAmount,td.extra3 from TenantDetails td,AssetDetails ad,SubAssetDetails sad where td.assetName=ad.assetCode and sad.subAssetCode=td.subclassifiedAstno and (td.vacatestatus!='Vacated' or td.vacatestatus is null) and td.appstatus='CFO Approved'");

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

    //==================================Select Tenant===========================
    public List<ContractCreation> contract()
            throws HibernateException, SQLException {
        List<ContractCreation> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from ContractCreation where status!='Inactive' and contStatus='Active' and recordStatus='CFO APPROVED'");

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

    //================================Select Property===========================
    public List<TenantDetails> selectPropertyName()
            throws HibernateException, SQLException {
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
    //=================================LEAD MANAGEMENT=========================

    //................................    Lead  List Page         ..............................................
    public List<Lead> leadmanagmentListNew(String userId, String orgId, String leadCode)
            throws HibernateException, SQLException {
        List<Lead> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (leadCode == null) {
                query = session.createQuery("from Lead where status!='Inactive' group by leadCode");

            } else {
                query = session.createQuery("from Lead where leadCode='" + leadCode + "' and status!='Inactive' ");
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

    //................................    Lead  View Page         ..............................................
    public List<Lead> leadmanagmentview(String leadCode)
            throws HibernateException, SQLException {
        List<Lead> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (leadCode == null) {
                query = session.createQuery("from Lead where status!='Inactive' group by leadCode");

            } else {
                query = session.createQuery("select ad.assetCode,ad.assetName,sad.subAssetCode,sad.subAssetName,ld.firstName,ld.lastName,ld.designation,ld.email,ld.mobileNo,ld.dob,ld.postBoxNo,ld.postalCode,ld.city,ld.countrt,ld.contaceAddress,ld.sno,ld.businessFilename,ld.businessAttachment,ld.folloeUpDate,ld.followUpRemarks,ld.salutation from AssetDetails ad, SubAssetDetails sad, Lead ld where ad.assetCode=ld.assetCode and ld.assetPlotCode=sad.subAssetCode and ld.leadCode='" + leadCode + "' and ld.status!='Inactive'");
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

    //=============================LEAD Code Check==============================
    public List<Lead> leadCodeCheck(String leadName) {
        List<Lead> Code = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (leadName != null) {
                query = session.createSQLQuery("SELECT Lead_Code from arete_tms.lead where Lead_Code like '%LEAD%'");
            } else {
                query = session.createQuery("from Lead where status!='Inactive' ORDER BY lasttmodifiedDate DESC");
            }
            Code = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return Code;
    }

    //=============================Select AssetName and Code====================
    public List<AssetDetails> selectAssetNameCode()
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

    //==========================Select AssetPlot No and Code====================
    public List<SubAssetDetails> selectAssetPlotNoandCode(String assetCode)
            throws HibernateException, SQLException {
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

    //=========================================Get Lead File Name===============
    public String getFilename(String landlordId)
            throws HibernateException, SQLException {
        List<Lead> datalist = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        String Image = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from Lead  where leadCode='" + landlordId + "'");

            datalist = query.list();
            for (Lead cand : datalist) {
                Image = cand.getBusinessFilename();
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
//========================= Land Lord Attachment Image name=====================

    public byte[] getContentAttach(String landlordId)
            throws HibernateException, SQLException {
        List<Lead> datalist = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        byte[] Image = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from Lead where leadCode='" + landlordId + "'");

            datalist = query.list();
            for (Lead cand : datalist) {
                Image = cand.getBusinessAttachment();
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

    //=========================CampigmMedia Save================================
    public void LeadSave(Lead dis) throws HibernateException, SQLException {
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

    //=========================CampigmMedia Save================================
    public void leadsave1(List<Lead> grid) throws HibernateException, SQLException {
        for (Iterator<Lead> iterator = grid.iterator(); iterator.hasNext();) {
            Lead test = (Lead) iterator.next();
            LeadSave(test);
        }
    }

    //===================Row Delete from Grid LEAD =======================
    public void leadGridDataDelete(Integer sno)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("update Lead set status='Inactive' where  sno='" + sno + "' ");

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

    //=====================  Lead Name Validation===============================
    public void getLeadName(HttpServletRequest req, HttpServletResponse res, String leadName) throws HibernateException, SQLException, IOException {

        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        List<Lead> ddNums = null;
        StringBuffer result = new StringBuffer();
        String s = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from Lead where leadName='" + leadName + "'");
            ddNums = query.list();

            if (ddNums.isEmpty()) {
                s = "Data Not Exist";
            } else {
                s = "Data Already Exists";
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
//=================================Tenant Type And Category=====================

    public List<TenantType> tenantType() throws HibernateException, SQLException {
        List<TenantType> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT TENANT_TYPE FROM arete_tms.tenant_type WHERE STATUS!='Inactive' ORDER BY TENANT_TYPE asc");
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
//================================= To Fetch Tenant Category Details=====================

    public List<Category> tenantCategory() throws HibernateException, SQLException {
        List<Category> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT TENANT_CATEGORY FROM arete_tms.tenant_category WHERE STATUS!='Inactive' ORDER BY TENANT_CATEGORY asc");
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

    //=============================Select Land Lord=============================
    public List<LandLordDetails> selectLandLord()
            throws HibernateException, SQLException {
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

    //=================================Update Lead==============================
    public boolean UpdateLead(String leadCode, String leadRecordStatus) throws HibernateException, SQLException {

        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        boolean val = false;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("update arete_tms.lead set Record_Status='" + leadRecordStatus + "' where Lead_Code='" + leadCode + "' ");
            int res = query.executeUpdate();
            if (res > 0) {
                val = true;
            } else {
                val = false;
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
        return val;
    }

    //==============================UPDATE SUBASSET=============================
    public void updateSubassetFromLead(String assetCode, String subAssetCode, String subAssetrecordstatus)
            throws HibernateException, SQLException {
        String hql = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update SubAssetDetails set recordStatus='" + subAssetrecordstatus + "' where  assetCode='" + assetCode + "' and subAssetCode='" + subAssetCode + "'");
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

    //---------------Tenant Deatails---------------------------//
    public List<TenantDetails> tenantDetailsList(String tenantCode) {
        List<TenantDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (tenantCode != null) {
                query = session.createQuery("from TenantDetails where status!='Inactive' and tenantCode='" + tenantCode + "'");
            } else {
                query = session.createQuery("from TenantDetails where status!='Inactive'");
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

    //===============================Rent Quote code Ckeck======================
    public List<Rentquote> rentQuotecodeCkeck(String tenantFname) {
        List<Rentquote> Code = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (tenantFname != null) {
                query = session.createSQLQuery("SELECT Tenant_QuoteCode from arete_tms.rentquote where Tenant_QuoteCode like '%RENTQUOT%'");
            } else {
                query = session.createQuery("from Rentquote where  status!='Inactive' ORDER BY lasttmodifiedDate DESC");
            }
            Code = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return Code;
    }

    ////////////////////==========Select Contract Code==========================
    public List<ContractCreation> selectContractName(String tenantCategory, String subassetCode)
            throws HibernateException, SQLException {
        List<ContractCreation> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();

        Query query = null;
        try {
            tx = session.beginTransaction();
            if (tenantCategory.equals("Others")) {

                query = session.createSQLQuery("select contract_code,contract_title,cont_start_date,cont_end_date from arete_tms.contract_creation where flat_code='" + subassetCode + "' and status!='Inactive'");
            } else {
                query = session.createSQLQuery("select contract_code,contract_title,cont_start_date,cont_end_date from arete_tms.contract_creation where flat_code='" + subassetCode + "' and status!='Inactive'");

//                query = session.createSQLQuery("SELECT  CONTRACT_CODE,CONTRACT_TITLE,\n"
//                        + "DATE_FORMAT(CONT_START_DATE, '%d-%b-%Y') AS Start_Date,\n"
//                        + "DATE_FORMAT(CONT_END_DATE, '%d-%b-%Y') AS End_Date\n"
//                        + "FROM arete_tms.contract_creation where STATUS!='Inactive' \n"
//                        + "and CONT_STATUS='Active' and RECORD_STATUS='CFO APPROVED' and FLAT_CODE='" + subassetCode + "'");
//            } else {
//                query = session.createSQLQuery("SELECT  C.CONTRACT_CODE,C.CONTRACT_TITLE,\n"
//                        + "DATE_FORMAT(C.CONT_START_DATE, '%d-%b-%Y') AS Start_Date,\n"
//                        + "DATE_FORMAT(C.CONT_END_DATE, '%d-%b-%Y') AS End_Date,D.CONTRACT_CATEGORY\n"
//                        + "FROM arete_tms.contract_creation C, arete_tms.contract_category D \n"
//                        + "where C.CONTRACT_CATEGORY_ID=D.CONTRACT_CATEGORY_ID and C.STATUS!='Inactive' \n"
//                        + "and C.CONT_STATUS='Active' and C.RECORD_STATUS='CFO APPROVED' \n"
//                        + "and FLAT_CODE='" + subassetCode + "' and (D.CONTRACT_CATEGORY='" + tenantCategory + "' or D.CONTRACT_CATEGORY='Others')");
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

    //===============================Select Property Details======================
    public List<AssetDetails> selectAssetDetails(String tenantCategory)
            throws HibernateException, SQLException {
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

    //================RentQuote Save============================================
    public void RentQuoteSave(Rentquote dis) throws HibernateException, SQLException {
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

    //================RentQuote Save============================================
    public void rentQuotesave1(List<Rentquote> grid) throws HibernateException, SQLException {
        for (Iterator<Rentquote> iterator = grid.iterator(); iterator.hasNext();) {
            Rentquote test = (Rentquote) iterator.next();
            RentQuoteSave(test);
        }
    }

    //=========================================Get Quote  File Name=============
    public String qtgetFilename(String landlordId)
            throws HibernateException, SQLException {
        List<Rentquote> datalist = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        String Image = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from Rentquote   where tenantQuoteCode='" + landlordId + "'");

            datalist = query.list();
            for (Rentquote cand : datalist) {
                Image = cand.getTenantFilename();
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
//========================= Quote Lord Attachment Image name

    public byte[] qtgetContentAttach(String landlordId)
            throws HibernateException, SQLException {
        List<Rentquote> datalist = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        byte[] Image = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from Rentquote where tenantQuoteCode='" + landlordId + "'");

            datalist = query.list();
            for (Rentquote cand : datalist) {
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

    //===========Quote Download==============
    public Rentquote getQuoteAttach(Integer id) {
        Session session = getSessionFactory().openSession();
        Rentquote exp = (Rentquote) session.get(Rentquote.class, id);
        session.close();
        return exp;
    }

    //===============================================Lead Download==============
    public Lead getLeadAttach(Integer id) {
        Session session = getSessionFactory().openSession();
        Lead exp = (Lead) session.get(Lead.class, id);
        session.close();
        return exp;
    }

    //=====================================Rent Quote List======================
    public List<Rentquote> quoteList(String userId, String orgId, String SNo)
            throws HibernateException, SQLException {
        List<Rentquote> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from Rentquote where status!='Inactive' and approverStatus!='Rejected'");

            } else {
                query = session.createQuery("from Rentquote where sno='" + SNo + "' and status!='Inactive' and approverStatus!='Rejected'");
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
    
    public List<QuotationDetails> rentQuoteCodeinc(String userId, String orgId, String orderNo, String orderStatus, String limit) {
        List<QuotationDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (limit.equals("1")) {
  
                query = session.createQuery("from QuotationDetails ORDER BY SNo");
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
    
    //added by pavithra for dashboard issue from and to date
      public List<Rentquote> quoteList1(String userId, String orgId, String SNo,String fromDate,String toDate)
            throws HibernateException, SQLException {
        List<Rentquote> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from Rentquote where status!='Inactive' and approverStatus!='Rejected' and  lastmodefiedDate >='" + fromDate + "' and lastmodefiedDate <='" + toDate + "'");

            } else {
                query = session.createQuery("from Rentquote where sno='" + SNo + "' and status!='Inactive' and approverStatus!='Rejected'");
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

    //=====================================Rent Quote List======================
    public void quoteReject(String tenantQuoteCode, String appstatus, String appremarks)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update Rentquote set approver1='null', approverStatus='" + appstatus + "',approverRemarks1='" + appremarks + "' where tenantQuoteCode='" + tenantQuoteCode + "'");
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

    //**************rentQuota Email******************//
    public List<Rentquote> trdList(String userId, String tenantQuoteCode) throws HibernateException, SQLException {
        List<Rentquote> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from Rentquote where tenantQuoteCode='" + tenantQuoteCode + "'");
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

    //===================================== Update Rent Quote======================
    public void quoteReject1(String tenantQuoteCode, String appstatus, String appremarks)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update Rentquote set approver2='null', approverStatus='" + appstatus + "',approverRemarks2='" + appremarks + "' where tenantQuoteCode='" + tenantQuoteCode + "'");
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

    //===================================== fetch the reject list ==================================== 
    public List<TenantDetails> quoteDetailsRej(String SNo) {
        List<TenantDetails> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from Rentquote where status!='Inactive' and approverStatus='Rejected'");
            } else {
                query = session.createQuery("from Rentquote where status!='Inactive' and SNo='" + SNo + "' and approverStatus='Rejected'");
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

    //==================================== fetch reject list records to view ==================================== 
    public List<Rentquote> quoteRejectedList(String userId, String orgId, String SNo, String tenantQuoteCode)
            throws HibernateException, SQLException {
        List<Rentquote> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from Rentquote where status!='Inactive' and tenantQuoteCode = '" + tenantQuoteCode + "' and approverStatus='Rejected'");

            } else {
                query = session.createQuery("from Rentquote where sno='" + SNo + "' and status!='Inactive' and tenantQuoteCode = '" + tenantQuoteCode + "' ");
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

    //=====================================Rent Quote update Recheck List======================
    public void quoteRecheck(String tenantQuoteCode, String appstatus, String appremarks)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update Rentquote set approver1='null', approverStatus='" + appstatus + "',approverRemarks1='" + appremarks + "' where tenantQuoteCode='" + tenantQuoteCode + "'");
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

    //==================================== Approve Rent Quote ==================
    public boolean updateRentQuot(String tenantQuoteCode, String appro1, String approverRemarks, String actualRentFixed) throws HibernateException, SQLException {

        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        boolean val = false;
        try {
            tx = session.beginTransaction();
//,Approver_Status='Approved'
            query = session.createSQLQuery("update arete_tms.rentquote set Approver_Remarks1='" + approverRemarks + "',Approver1='" + appro1 + "',Actual_RentFixed='" + actualRentFixed + "'  where Tenant_QuoteCode='" + tenantQuoteCode + "'");
            int res = query.executeUpdate();
            if (res > 0) {
                val = true;
            } else {
                val = false;
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
        return val;
    }
//====================================  Update RentQuote ==================================== 

    public boolean updateRentQuot1(String tenantQuoteCode, String appro1, String approverRemarks, String actualRentFixed) throws HibernateException, SQLException {

        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        boolean val = false;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("update arete_tms.rentquote set Approver_Remarks2='" + approverRemarks + "',Approver2='" + appro1 + "',Actual_RentFixed='" + actualRentFixed + "' ,Approver_Status='Approved' where Tenant_QuoteCode='" + tenantQuoteCode + "'");
            int res = query.executeUpdate();
            if (res > 0) {
                val = true;
            } else {
                val = false;
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
        return val;
    }
//=================== RentQuote Approval 2 List =====================================

    public List<Rentquote> cfoQuoteApprovalList(String userId, String orgId, String SNo)
            throws HibernateException, SQLException {
        List<Rentquote> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from Rentquote where status!='Inactive' and approver1='GFC Approved' and approverStatus!='Rejected' ");

            } else {
                query = session.createQuery("from Rentquote where sno='" + SNo + "' and status!='Inactive' and approverStatus!='Rejected' ");
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

    //==================================== Approve Rent Quote Recheck ==================
    public boolean recheckUpdateRentQuot(String tenantQuoteCode, String appro1, String approverRemarks) throws HibernateException, SQLException {

        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        boolean val = false;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("update arete_tms.rentquote set Approver_Remarks1='" + approverRemarks + "',Approver1='" + appro1 + "' ,Billing_Cycle1='Recheck' where Tenant_QuoteCode='" + tenantQuoteCode + "'");
            int res = query.executeUpdate();
            if (res > 0) {
                val = true;
            } else {
                val = false;
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
        return val;
    }

    //========================= RentQuote Update ==================================
    public boolean recheckUpdateRentQuot1(String tenantQuoteCode, String appro1, String approverRemarks) throws HibernateException, SQLException {

        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        boolean val = false;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("update arete_tms.rentquote set Approver_Remarks2='" + approverRemarks + "',Approver2='" + appro1 + "' ,Billing_Cycle1='Recheck' where Tenant_QuoteCode='" + tenantQuoteCode + "'");
            int res = query.executeUpdate();
            if (res > 0) {
                val = true;
            } else {
                val = false;
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
        return val;
    }

    //========================= RentQuote Details ==================================
    public List<Rentquote> quoteListNew(String userId, String orgId, String SNo)
            throws HibernateException, SQLException {
        List<Rentquote> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from Rentquote where status!='Inactive' group by leadCode");

            } else {
                query = session.createQuery("from Rentquote where tenantQuoteCode='" + SNo + "' and status!='Inactive' ");
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

    //=============================== RentQuote Update ====================================
    public boolean UpdateQuote(String Tenant_QuoteCode, String leadRecordStatus) throws HibernateException, SQLException {

        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        boolean val = false;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("update arete_tms.rentquote set Record_Status='" + leadRecordStatus + "' where Tenant_QuoteCode='" + Tenant_QuoteCode + "' ");
            int res = query.executeUpdate();
            if (res > 0) {
                val = true;
            } else {
                val = false;
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
        return val;
    }

    //============Rent Quote Edit Attachment=================================
    //=================================Campaign Media Type List================================
    public List<CampaignMedia> mediaType() throws HibernateException, SQLException {
        List<CampaignMedia> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT media_Name FROM arete_tms.campaign_media where STATUS!='Inactive' ORDER BY media_Name ASC");
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

    //====================CUSTOMERFEEDBACK==================tenantDetailsForCustomerFeedback
    public List<TenantDetails> tenantDetailsForCustomerFeedback()
            throws HibernateException, SQLException {
        List<TenantDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from TenantDetails where status!='Inactive' and appstatus='CFO Approved'");

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

    //=======================CustomerFb Code Check================================
    public List<CustomerFeedback> custometFbCodeCheck(String tenantName) {
        List<CustomerFeedback> Code = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (tenantName != null) {
                query = session.createSQLQuery("SELECT Customet_FB_Code from arete_tms.customer_feedback where Customet_FB_Code like '%CUSTFB%'");
            } else {
                query = session.createQuery("from CustomerFeedback where  status!='Inactive' ORDER BY lasttmodifiedDate DESC");
            }
            Code = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return Code;
    }
//============================== Global Save ===================================

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

    //=============================== Global List ==============================
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
                query = session.createQuery("from " + className + " where status!='Inactive' and sno='" + instanceVariable + "' order by sno asc");
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
//================== MOM List ======================

    public List<MinutesOfMeeting> momList() {
        List<MinutesOfMeeting> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from MinutesOfMeeting where status!='Inactive' group by momCode");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    //=========================== Compalint Details List ================================
    public List<Complaints> compalintDetailslist(String sno) {
        List<Complaints> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from SubAssetDetails where status!='Inactive' and SNo='" + sno + "'");
            } else {
                query = session.createQuery("select ad.assetCode,ad.assetName,sad.subAssetCode,sad.subAssetName,c.recordStatus,c.complaintCode,c.tenantName,c.sno from AssetDetails ad, SubAssetDetails sad, Complaints c where ad.assetCode=c.assetName and sad.subAssetCode=c.assetNo");

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

    //................................    Fetch Folloe Up history         ..............................................
    public List<Lead> fetchFolloeUpHistory(String leadCode, String assetCode, String firstName)
            throws HibernateException, SQLException {
        List<Lead> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from Lead where leadCode='" + leadCode + "' and assetCode='" + assetCode + "' and firstName='" + firstName + "' and status!='Inactive'");

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

//=================================Update Follup Date ==========================
    public void updateLeadFolloeUpDate(String leadCode, String assetCode, String contactName, Date date)
            throws HibernateException, SQLException {
        String hql = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update Lead set folloeUpDate='" + date + "' where  leadCode='" + leadCode + "' and assetCode='" + assetCode + "' and firstName='" + contactName + "'");
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
//================================= Follup History List ==========================

    public List<FollowUp> followUpHistoryList(String leadCode, String assetCode, String firstName)
            throws HibernateException, SQLException {
        List<FollowUp> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from FollowUp where leadCode='" + leadCode + "' and assetCode='" + assetCode + "' and contactName='" + firstName + "' and status!='Inactive'");

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

    //=========================+FOR MAIL=======================
    public List<Rentquote> rentQuoteview(String tenantQuoteCode, String orgId) {
        List<Rentquote> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (tenantQuoteCode != null) {
                query = session.createQuery("from Rentquote where tenantQuoteCode='" + tenantQuoteCode + "' and status!='Inactive'");
            } else {
                query = session.createQuery("from Rentquote where orgId='" + orgId + "' and status!='Inactive' ORDER BY lastmodifiedDate DESC");
            }
            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    //========================================Complaint CODE Check=================
    public List<Complaints> complaintCodeCheck(String tenantName) {
        List<Complaints> Code = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (tenantName != null) {
                query = session.createSQLQuery("SELECT Complaint_Code from arete_tms.complaints where Complaint_Code like '%COMPLT%'");
            } else {
                query = session.createQuery("from Complaints where  status!='Inactive' ORDER BY lasttmodifiedDate DESC");
            }
            Code = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return Code;
    }

    //===============================Complaint Approval Process=============
    public boolean updateComplaintDetails(String Complaint_Code, String appro1, String approverRemarks) throws HibernateException, SQLException {

        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        boolean val = false;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("update arete_tms.complaints set Attribute1='" + approverRemarks + "',Attribute2='" + appro1 + "' ,Record_Status='" + appro1 + "' where Complaint_Code='" + Complaint_Code + "'");
            int res = query.executeUpdate();
            if (res > 0) {
                val = true;
            } else {
                val = false;
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
        return val;
    }

    //=============================== Update Complaint Details =====================
    public boolean updateComplaintDetails1(String Complaint_Code, String appro1, String approverRemarks) throws HibernateException, SQLException {

        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        boolean val = false;
        try {
            tx = session.beginTransaction();

            query = session.createSQLQuery("update arete_tms.complaints set Attribute3='" + approverRemarks + "',Attribute4='" + appro1 + "' ,Record_Status='" + appro1 + "' where Complaint_Code='" + Complaint_Code + "'");
            int res = query.executeUpdate();
            if (res > 0) {
                val = true;
            } else {
                val = false;
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
        return val;
    }
    //========================= Approval 2 List ========================

    public List<Complaints> cfoApprovalList(String userId, String orgId, String SNo)
            throws HibernateException, SQLException {
        List<Complaints> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from Complaints where status!='Inactive' and recordStatus='GFC Approved'");

            } else {
                query = session.createQuery("from Complaints where sno='" + SNo + "' and status!='Inactive'");
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

    //========================= Rejected List ========================
    public List<Complaints> rejectedList(String userId, String orgId, String SNo)
            throws HibernateException, SQLException {
        List<Complaints> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from Complaints where status!='Inactive' and attribute2='REJECTED'");

            } else {
                query = session.createQuery("from Complaints where sno='" + SNo + "' and status!='Inactive'");
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
//==================================Approval process of Rentquote

    public void updateContractApprove(String sNo) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = null;
        try {

            hql = "update ContractApproval set status='Approved' where sNo= " + sNo + "";

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

    public List<OrgDetails> orglist(Integer sno) {
        List<OrgDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from OrgDetails where status!='Inactive' and sno='" + sno + "'");
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
    //=========================== Daily Work Sheet Code Check==============

    public List<DailyWorkSheet> dwscodeCkeck(String empName) {
        List<DailyWorkSheet> Code = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (empName != null) {
                query = session.createSQLQuery("SELECT DWS_Code from arete_tms.daily_work_sheet where DWS_Code like '%DWS%'");
            } else {
                query = session.createQuery("from DailyWorkSheet where  status!='Inactive' ORDER BY lasttmodifiedDate DESC");
            }
            Code = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return Code;
    }
    //=========================== Monthly Work Sheet Code Check==============

    public List<MonthlyWorkSheet> mwscodeCkeck(String empName) {
        List<MonthlyWorkSheet> Code = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (empName != null) {
                query = session.createSQLQuery("SELECT MWS_Code from arete_tms.monthly_work_sheet where MWS_Code like '%MWS%'");
            } else {
                query = session.createQuery("from MonthlyWorkSheet where  status!='Inactive' ORDER BY lasttmodifiedDate DESC");
            }
            Code = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return Code;
    }
    //=========================== Daily Work Sheet Code Check==============

    public List<MinutesOfMeeting> momCodeCheck(String createdBy) {
        List<MinutesOfMeeting> Code = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (createdBy != null) {
                query = session.createSQLQuery("SELECT MOM_Code from arete_tms.minutes_of_meeting where MOM_Code like '%MOM%'");
            } else {
                query = session.createQuery("from MinutesOfMeeting where  status!='Inactive' ORDER BY lasttmodifiedDate DESC");
            }
            Code = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return Code;
    }

    //=============================MOM View List===================
    public List<MinutesOfMeeting> momViewList(String userId, String orgId, String momCode)
            throws HibernateException, SQLException {
        List<MinutesOfMeeting> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (momCode == null) {
                query = session.createQuery("from MinutesOfMeeting where status!='Inactive' ");

            } else {
                query = session.createQuery("from MinutesOfMeeting where momCode='" + momCode + "' and status!='Inactive' ");
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

//    =============================================
    @Override
    public List<Class> list(Integer instanceVariable, String className) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void globalDelete(Integer instanceVariable) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    //============================
    //====================Lead Details For Monthly Work Sheet
    public List<Lead> leadComDeatils() {
        List<Lead> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from Lead where status!='Inactive'");

            inventory = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inventory;
    }

    //=============================Monthly WorkSheet View List===================
    public List<MonthlyWorkSheet> monthlyDetailsList(String userId, String orgId, String mwsCode)
            throws HibernateException, SQLException {
        List<MonthlyWorkSheet> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (mwsCode == null) {
                query = session.createQuery("from MonthlyWorkSheet where status!='Inactive' ");

            } else {
                query = session.createQuery("from MonthlyWorkSheet where mwsCode='" + mwsCode + "' and status!='Inactive' ");
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

    //========================CAMPAIGN CODE CHECK===========================//
    public List<Campaign> CampaignCodeCheck(String cCode) {
        List<Campaign> Code = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            if (cCode == null || cCode == "") {
                query = session.createQuery("from Campaign where status!='Inactive' and endDate > CURDATE()");
//                query = session.createQuery("select c.campaignCode,c.campaignName,c.campaignStatus,cm.mediaName,cm.mediaCode from Campaign c, CampaignMedia cm where c.campaignMediaCode=cm.mediaCode and c.endDate > CURDATE() group by c.campaignCode");
            } else {
                query = session.createQuery("from Campaign where campaignCode='" + cCode + "' and status!='Inactive'");
            }

            Code = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return Code;
    }

    //================= To generate Code for Campaign ========================
    public List<Campaign> getCampainNo(String campaignName) {
        List<Campaign> code = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (campaignName != null) {
                query = session.createSQLQuery("SELECT campaign_Code FROM arete_tms.campaign where campaign_Code like '%CAM%' ORDER BY sno ASC");
            } else {
                query = session.createQuery("from Campaign where  status!='Inactive' ORDER BY lastmodefiedDate DESC");
            }
            code = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }
        return code;
    }

    //================= Select Campaign Details ========================
    public List<Campaign> campaignList(String userId, String orgId, String cCode) {
        Session session = getSessionFactory().openSession();
        Transaction tx = null;
        List<Campaign> cList = new ArrayList<Campaign>();
        Query query = null;
        try {

            tx = session.beginTransaction();

            if (cCode == null || cCode == "") {
                query = session.createQuery("from Campaign where status!='Inactive' and endDate >= CURDATE() group by campaignCode");

            } else {
                query = session.createQuery("from Campaign where campaignCode='" + cCode + "' and status!='Inactive'");
            }

            cList = query.list();

            tx.commit();
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cList;
    }
    
    //newly added by lakshmi for dashboard based on from and to dates on 01Apr2019
    public List<Campaign> campaignList1(String userId, String orgId, String cCode,String fromDate,String toDate) {
        Session session = getSessionFactory().openSession();
        Transaction tx = null;
        List<Campaign> cList = new ArrayList<Campaign>();
        Query query = null;
        try {

            tx = session.beginTransaction();

            if (cCode == null || cCode == "") {
                query = session.createQuery("from Campaign where status!='Inactive' and  lastmodefiedDate >='" + fromDate + "' and lastmodefiedDate <='" + toDate + "' group by campaignCode");

            } else {
                query = session.createQuery("from Campaign where campaignCode='" + cCode + "' and status!='Inactive'");
            }

            cList = query.list();

            tx.commit();
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cList;
    }

    //================= Select Campaign Details ========================
    public List<Campaign> campaignList1(String userId, String orgId, int sno) {
        Session session = getSessionFactory().openSession();
        Transaction tx = null;
        List<Campaign> cList = new ArrayList<Campaign>();
        Query query = null;

        try {

            tx = session.beginTransaction();

            query = session.createQuery("from Campaign where sno='" + sno + "' and status!='Inactive'");

            cList = query.list();

            tx.commit();
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cList;
    }

    //================= Update Campaign Details ========================
    public void campaignUpdate(int sno) {
        Session session = getSessionFactory().openSession();
        Transaction tx = null;
        List<Campaign> cList = new ArrayList<Campaign>();
        Query query = null;

        try {

            tx = session.beginTransaction();

            query = session.createQuery("update Campaign set recordStatus='Lead Created' where sno='" + sno + "'");

            int row = query.executeUpdate();

            tx.commit();
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    //================= Delete Campaign Grid Data ========================
    public void CampGridDataDelete(Integer sno)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("update Campaign set status='Inactive' where  sno='" + sno + "' ");

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

    public void campaignDocSave(List<CampaignAttachment> grid) throws HibernateException, SQLException {
        for (Iterator<CampaignAttachment> iterator = grid.iterator(); iterator.hasNext();) {
            CampaignAttachment sales = (CampaignAttachment) iterator.next();
            campaignDocumentsSave(sales);
        }
    }

    //=================  Campaign Attachment Save ========================    
    public void campaignDocumentsSave(CampaignAttachment transientInstance) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(transientInstance);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();

        } finally {
            session.clear();
            session.close();
        }
    }

    //================= Select Campaign Attachments ========================
    public List<CampaignAttachment> CampaignAttachmentList(String campaignCode) {
        Session session = getSessionFactory().openSession();
        Transaction tx = null;

        List<CampaignAttachment> camList = new ArrayList<CampaignAttachment>();

        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from CampaignAttachment where campCode='" + campaignCode + "' and status!='Inactive'");
            camList = query.list();
            tx.commit();

        } catch (Exception e) {

            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }

        return camList;
    }

    //================= Get Campaign Attachment ========================
    public CampaignAttachment getCAMAttach(Integer id) {
        Session session = getSessionFactory().openSession();
        CampaignAttachment exp = (CampaignAttachment) session.get(CampaignAttachment.class, id);
        session.close();
        return exp;
    }

    //================= Closed Campaign Details ========================
    public List<Campaign> clossedCampaignList(String userId, String orgId) {
        Session session = getSessionFactory().openSession();
        Transaction tx = null;
        List<Campaign> cList = new ArrayList<Campaign>();
        Query query = null;

        try {

            tx = session.beginTransaction();

            query = session.createQuery("from Campaign where endDate < CURDATE() group by campaignCode ");

            cList = query.list();

            tx.commit();
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cList;
    }

    //================= Delete Campaign Attachments ========================
    public void CamAttachDelete(Integer sno)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("delete from CampaignAttachment where sno='" + sno + "'");

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

    //================= Validating Phone No. ========================
    public void phoneCheck(HttpServletRequest req, HttpServletResponse res, String phoneNum) throws HibernateException, SQLException, IOException {

        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        List<String> cityData = new ArrayList<String>();

        String message = "";

        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select Phone_No from arete_tms.campaign where Phone_No='" + phoneNum + "'");
            cityData = query.list();

            if (cityData.size() > 0) {
                message = "DATA AVAILABLE";
            } else {
                message = "NO DATA AVAILABLE";
            }

            out.append(message);

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

    //================= Validating Contact No. ========================
    public void contactCheck(HttpServletRequest req, HttpServletResponse res, String phoneNum) throws HibernateException, SQLException, IOException {

        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        List<String> cityData = new ArrayList<String>();

        String message = "";

        Session session = getSessionFactory().openSession();
        // SQLQuery query = null;
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select Contacts from arete_tms.lead where Contacts='" + phoneNum + "'");
            cityData = query.list();

            if (cityData.size() > 0) {
                message = "DATA AVAILABLE";
            } else {
                message = "NO DATA AVAILABLE";
            }

            out.append(message);

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

    //================= Validating Email Id. ========================
    public void emailCheck(HttpServletRequest req, HttpServletResponse res, String emailId) throws HibernateException, SQLException, IOException {

        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        List<String> cityData = new ArrayList<String>();

        String message = "";

        Session session = getSessionFactory().openSession();
        // SQLQuery query = null;
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select EmailId from arete_tms.campaign where EmailId='" + emailId + "'");
            cityData = query.list();

            if (cityData.size() > 0) {
                message = "DATA AVAILABLE";
            } else {
                message = "NO DATA AVAILABLE";
            }

            out.append(message);

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

    /*   
     Check for tenant Id and Tenant CR No Exist or not  
     : Added by Garun
     */
    // Start
    public void checkTenenatId(HttpServletRequest req, HttpServletResponse res, String tenantId) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        List<TenantDetails> list = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            query = session.createQuery("select tenantId from TenantDetails where tenantId ='" + tenantId + "'");
            list = query.list();
            Iterator it = list.iterator();
            String classExist = "";
            while (it.hasNext()) {
                classExist += it.next();
            }
            out.append(classExist);
            tx.commit();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

    }

    public void checkTenenatCRId(HttpServletRequest req, HttpServletResponse res, String tenantCrNo) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        List<TenantDetails> list = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            query = session.createQuery("select tenantCrNo from TenantDetails where tenantCrNo ='" + tenantCrNo + "'");
            list = query.list();
            Iterator it = list.iterator();
            String classExist = "";
            while (it.hasNext()) {
                classExist += it.next();
            }
            out.append(classExist);
            tx.commit();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

    }

    //================= Validatimg Campaign Name ========================
    public void checkCampaignName(HttpServletRequest req, HttpServletResponse res, String campaignName) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        List<Rentquote> list = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            query = session.createQuery("select campaignName from Campaign where campaignName ='" + campaignName + "'");
            list = query.list();
            Iterator it = list.iterator();
            String classExist = "";
            while (it.hasNext()) {
                classExist += it.next();
            }
            out.append(classExist);
            tx.commit();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

    }

    //================= Select Floor Details ========================
    public List<SubAssetDetails> selectSubAssetDetails(String assetCode, String tenantCategory) throws HibernateException, SQLException {
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

    //================= Select GFC Approved Rent Quote Details ========================
    public List<Rentquote> gfcApproved(String userId, String orgId, String SNo) {
        List<Rentquote> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from Rentquote where status!='Inactive' and approverStatus ='Need Approval' and approver1 !='GFC Approved'");
            } else {
                query = session.createQuery("from Rentquote where status!='Inactive' and SNo='" + SNo + "' and approverStatus ='Need Approval' and approver1 !='GFC Approved'");
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

    public void globalInactive(String instanceVariable, String className) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void globalDelete(String instanceVariable) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public List<Class> roleperm(String orgId, String roleName, String submoduleName, String tab) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    //**************Fetch Complaint Details for Email******************//
    public List<Complaints> tdList(String userId, String orgId, String complaintCode) throws HibernateException, SQLException {
        List<Complaints> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from Complaints where complaintCode='" + complaintCode + "' and status!='Inactive'");
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

    public List<Complaints> ApprovedList(String userId, String orgId, String SNo)
            throws HibernateException, SQLException {
        List<Complaints> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from Complaints where status!='Inactive' and recordStatus='CFO Approved'");

            } else {
                query = session.createQuery("from Complaints where sno='" + SNo + "' and status!='Inactive'");
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

    public void updateRoomStatus(String roomCode, String recordstatus1)
            throws HibernateException, SQLException {
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
    // added by pavi to update the contract table
    public void updateContractStatus(String contractCode, String status)
            throws HibernateException, SQLException {
        String hql = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update ContractCreation set status='" + status + "' where  contractCode='" + contractCode + "'");
            int row = query.executeUpdate();
            System.out.println(query);
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

    public void crmAttachSave(List<CampaignAttachment> bdpfFile) {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            Iterator<CampaignAttachment> itr = bdpfFile.iterator();
            while (itr.hasNext()) {
                CampaignAttachment next = itr.next();
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

    public CampaignAttachment getattchs(Integer sno) {
        Session session = getSessionFactory().openSession();
        CampaignAttachment exp = (CampaignAttachment) session.get(CampaignAttachment.class, sno);
        session.close();
        return exp;
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

    public List<CampaignAttachment> crmAttachlist(String contractCode) {
        List<CampaignAttachment> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from CampaignAttachment where campCode='" + contractCode + "'");

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    public CampaignAttachment getCAMAttach1(Integer SNo) {
        Session session = getSessionFactory().openSession();
        CampaignAttachment exp = (CampaignAttachment) session.get(CampaignAttachment.class, SNo);
        session.close();
        return exp;
    }
    
    
     //---------------AMCType Details--------------------------//
    public List<AMCMaintenance> amcDetailslist(String sno) {
        List<AMCMaintenance> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from AMCMaintenance where status!='Inactive' and sno='" + sno + "'");
            } else {
                query = session.createQuery("from AMCMaintenance where status!='Inactive'");
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
    

    
     //------AMC Saved End----------------------------------//
    //@Override
    public void AMCMaintenanceSave(Object transientInstance) {
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
    
    
    public List<Class> amcListActives(String instanceVariable, String className) {
        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (instanceVariable == "" || instanceVariable == null) {
                query = session.createQuery("from " + className + "");
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

    //newly added by lakshmi for dashboard based on from and to dates
    public List<Class> amcListActives1(String instanceVariable, String className, String fromDate, String toDate) {
        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (instanceVariable == "" || instanceVariable == null) {
                query = session.createQuery("from " + className + " where lastmodifiedDate >='" + fromDate + "' and lastmodifiedDate <='" + toDate + "'");
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
    
     public List<AMCMaintenance> AMCMaintenanceList(Integer SNo) throws HibernateException, SQLException {
        List<AMCMaintenance> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from AMCMaintenance where status!='Inactive'  order by SNo");
            } else {
                query = session.createQuery("from AMCMaintenance where SNo='" + SNo + "' and status!='Inactive'");
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
     
     
     
     public List<AMCQualityCheck> AMCQualityCheckList(Integer SNo) throws HibernateException, SQLException {
        List<AMCQualityCheck> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from AMCQualityCheck where status!='Inactive'  order by SNo");
            } else {
                query = session.createQuery("from AMCQualityCheck where SNo='" + SNo + "' and status!='Inactive'");
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
     
      public List<String> inUtilList(String SNo) {
        List<String> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from IndividualUitlity ");
            } else {
                query = session.createQuery("from IndividualUitlity where SNo='" + SNo + "'");
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
     
     public List<AMCJobs> AMCJobCheckList(Integer SNo) throws HibernateException, SQLException {
        List<AMCJobs> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from AMCJobs where status!='Inactive'  order by SNo");
            } else {
                query = session.createQuery("from AMCJobs where SNo='" + SNo + "' and status!='Inactive'");
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
    
//     public List<Class> listActives(String instanceVariable, String className) {
//        List<Class> list = null;
//        Transaction tx = null;
//        Session session = getSessionFactory().openSession();
//        Query query = null;
//        try {
//            tx = session.beginTransaction();
//            if (instanceVariable == "" || instanceVariable == null) {
//                query = session.createQuery("from " + className + "");
//            } else {
//                query = session.createQuery("from " + className + " where sno='" + instanceVariable + "'");
//            }
//            list = query.list();
//            tx.commit();
//        } catch (HibernateException e) {
//            e.printStackTrace();
//        } finally {
//            session.close();
//        }
//        return list;
//    }
    
     public List<String> amcMaintenances(String SNo) {
        List<String> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from AMCMaintenance ");
            } else {
                query = session.createQuery("from AMCMaintenance where SNo='" + SNo + "'");
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

    
     //this amc Quality check
    
    public List<AMCQualityCheck> AMCQualitylist(String sno) {
        List<AMCQualityCheck> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from AMCQualityCheck where status!='Inactive' and sno='" + sno + "'");
            } else {
                query = session.createQuery("from AMCQualityCheck where status!='Inactive'");
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
    

    
     //------AMC Saved End----------------------------------//
    //@Override
    public void AMCQualitySave(Object transientInstance) {
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
    
    public List<Class> amclists(String instanceVariable, String className) {
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
    public List<String> AMCformLabelMapping(String link, String tab) {
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
    public List<String> AMCformDrodownMapping(String link, String tab) {
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
    public List<RolePermission> AMCpermmenus(String orgId, String roleName, String submodule, String tab) {
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
    
    
     public List<Class> AMClistActives(String instanceVariable, String className) {
        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (instanceVariable == "" || instanceVariable == null) {
                query = session.createQuery("from " + className);
            } else {
                query = session.createQuery("from " + className + " where s_no='" + instanceVariable + "'");
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
     
     
     //this is AMC Jobs
      //this amc Quality check
    
    public List<AMCJobs> AMCJobslist(String sno) {
        List<AMCJobs> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from AMCJobs where status!='Inactive' and sno='" + sno + "'");
            } else {
                query = session.createQuery("from AMCJobs where status!='Inactive'");
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
    

    
     //------AMC Saved End----------------------------------//
    //@Override
    public void AMCJobsSave(Object transientInstance) {
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
    
    public List<Class> amcjobslists(String instanceVariable, String className) {
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
    public List<String> AMCjobsformLabelMapping(String link, String tab) {
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
    public List<String> AMCjobsformDrodownMapping(String link, String tab) {
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
    public List<RolePermission> AMCjobspermmenus(String orgId, String roleName, String submodule, String tab) {
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
    
    
     public List<Class> AMCjobslistActives(String instanceVariable, String className) {
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
     public List<AMCType> amcTypeListMarch(Integer SNo) {
        List<AMCType> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo != null) {
                query = session.createQuery("from AMCType where status!='Inactive' and SNo='" + SNo + "'");
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

    
    public List<GMM> getServiceNo(String assetName) {
        List<GMM> code = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (assetName != null) {
                query = session.createSQLQuery("SELECT asset_code FROM arete_tms.asset_details where asset_code like '%PROPERTY%' ORDER BY s_no ASC");
            } else {
                query = session.createQuery("from GMM where  status!='Inactive' ORDER BY lastmodifiedDate DESC");
            }
            code = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }

        return code;
    }
    
    public List<AMCMaintenance> getAmcNo(String assetName) {
        List<AMCMaintenance> code = null;
        Transaction tx = null;
        org.hibernate.Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (assetName != null) {
                query = session.createSQLQuery("SELECT asset_code FROM arete_tms.asset_details where asset_code like '%PROPERTY%' ORDER BY s_no ASC");
            } else {
                query = session.createQuery("from AMCMaintenance where  status!='Inactive' ORDER BY lastmodifiedDate DESC");
            }
            code = query.list();
            tx.commit();
        } catch (HibernateException e) {
        } finally {
            session.close();
        }

        return code;
    }
    
    public void gmmSave(List<GMM> grid) throws HibernateException, SQLException {

        for (Iterator<GMM> iterator = grid.iterator(); iterator.hasNext();) {

            GMM test = (GMM) iterator.next();
            assegmmSave(test);
        }
    }
    
    public void assegmmSave(GMM transientInstance) {
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
    
    public List<GMM> gmmlist(String sno) {
        List<GMM> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from GMM where status!='Inactive' and SNo='" + sno + "'");
            } else {
                query = session.createQuery("from GMM");
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
    
    public void updateStausAmcManagement(String pk,String cost,String amcStatus,String userId) {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {

            String hql = "update arete_tms.amc_maintenance  set cost='"+cost+"',ams_status='"+amcStatus+"' where  s_no='" + pk + "' and status!='Inactive'";
            Query query = session.createSQLQuery(hql);
            int row = query.executeUpdate();

        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {

        }
        tx.commit();
        session.close();
    }
    
    public void updateStausGmmManagement(String pk,String cost,String remakrs,String userId) {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {

            String hql = "update arete_tms.gmm  set actual_cost='"+cost+"',remarks='"+remakrs+"' where  s_no='" + pk + "' and status!='Inactive'";
            Query query = session.createSQLQuery(hql);
            int row = query.executeUpdate();

        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {

        }
        tx.commit();
        session.close();
    }
    
    public void quotationDetailsSave(QuotationDetails dis) {
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
    
    public void quotationDetailsListSave(List<QuotationDetails> grid) {
        for (Iterator<QuotationDetails> iterator = grid.iterator(); iterator.hasNext();) {
            QuotationDetails test = (QuotationDetails) iterator.next();
            quotationDetailsSave(test);
        }
    }
    
     public void PropertyDetailsSave(PropertyDetails dis) {
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
    
    public void PropertyDetailsListSave(List<PropertyDetails> grid) {
        for (Iterator<PropertyDetails> iterator = grid.iterator(); iterator.hasNext();) {
            PropertyDetails test = (PropertyDetails) iterator.next();
            PropertyDetailsSave(test);
        }
    }
    
     public void CustomerTenacyDetailsSave(CustomerTenacyDetails dis) {
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
    
    public void CustomerTenacyDetailsListSave(List<CustomerTenacyDetails> grid) {
        for (Iterator<CustomerTenacyDetails> iterator = grid.iterator(); iterator.hasNext();) {
          CustomerTenacyDetails test = (CustomerTenacyDetails) iterator.next();
           CustomerTenacyDetailsSave(test);
        }
    }
    
     public void RentDetailsSave(RentDetails dis) {
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
    
    public void RentDetailsListSave(List<RentDetails> grid) {
        for (Iterator<RentDetails> iterator = grid.iterator(); iterator.hasNext();) {
         RentDetails test = (RentDetails) iterator.next();
          RentDetailsSave(test);
        }
    }
    
      
     public void ServiceDetailsSave(ServiceDetails dis) {
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
    
    public void ServiceDetailsListSave(List<ServiceDetails> grid) {
        for (Iterator<ServiceDetails> iterator = grid.iterator(); iterator.hasNext();) {
       ServiceDetails test = (ServiceDetails) iterator.next();
          ServiceDetailsSave(test);
        }
    }
    
     public void TermsConditionSave(TermsCondition dis) {
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
    
    public void TermsConditionListSave(List<TermsCondition> grid) {
        for (Iterator<TermsCondition> iterator = grid.iterator(); iterator.hasNext();) {
     TermsCondition test = (TermsCondition) iterator.next();
         TermsConditionSave(test);
        }
    }

    public void RentDetailssListSave(List<RentDetails> rentList) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public List<Complaints> complaintsCodeinc(String userId, String orgId, String orderNo, String orderStatus, String limit) {
        List<Complaints> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (limit.equals("1")) {
                //  query = session.createSQLQuery("select MAX(CAST(SUBSTR(LEAD_CODE,INSTR(LEAD_CODE,'-')+1,1000) as Int)) from Lead")
                query = session.createQuery("from Complaints where  status!='Inactive'  ORDER BY sno");
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
    
        public void BookingQuotationDetailsSave(BookingQuotationDetails dis) {
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
    
    public void BookingQuotationDetailsListSave(List<BookingQuotationDetails> grid) {
        for (Iterator<BookingQuotationDetails> iterator = grid.iterator(); iterator.hasNext();) {
            BookingQuotationDetails test = (BookingQuotationDetails) iterator.next();
           BookingQuotationDetailsSave(test);
        }
    }
    
     public void BookingPropertyDetailsSave(BookingPropertyDetails dis) {
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
    
    public void BookingPropertyDetailsListSave(List<BookingPropertyDetails> grid) {
        for (Iterator<BookingPropertyDetails> iterator = grid.iterator(); iterator.hasNext();) {
            BookingPropertyDetails test = (BookingPropertyDetails) iterator.next();
            BookingPropertyDetailsSave(test);
        }
    }
    
     public void BookingCustomerTenacyDetailsSave(BookingCustomerTenacyDetails dis) {
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
    
    public void BookingCustomerTenacyDetailsListSave(List<BookingCustomerTenacyDetails> grid) {
        for (Iterator<BookingCustomerTenacyDetails> iterator = grid.iterator(); iterator.hasNext();) {
          BookingCustomerTenacyDetails test = (BookingCustomerTenacyDetails) iterator.next();
          BookingCustomerTenacyDetailsSave(test);
        }
    }
    
     public void BookingRentDetailsSave(BookingRentDetails dis) {
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
    
    public void BookingRentDetailsListSave(List<BookingRentDetails> grid) {
        for (Iterator<BookingRentDetails> iterator = grid.iterator(); iterator.hasNext();) {
         BookingRentDetails test = (BookingRentDetails) iterator.next();
          BookingRentDetailsSave(test);
        }
    }
    
      
     public void BookingServiceDetailsSave(BookingServiceDetails dis) {
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
    
    public void BookingServiceDetailsListSave(List<BookingServiceDetails> grid) {
        for (Iterator<BookingServiceDetails> iterator = grid.iterator(); iterator.hasNext();) {
       BookingServiceDetails test = (BookingServiceDetails) iterator.next();
          //ServiceDetailsSave(test);
        }
    }
    
//     public void BookingTermsConditionsSave(BookingTermsConditions dis) {
//        Session session = getSessionFactory().openSession();
//        try {
//            Transaction tx = session.beginTransaction();
//            session.saveOrUpdate(dis);
//            tx.commit();
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            session.clear();
//            session.close();
//        }
//    }
//    
//    public void BookingTermsConditionsListSave(List<BookingTermsConditions> grid) {
//        for (Iterator<BookingTermsConditions> iterator = grid.iterator(); iterator.hasNext();) {
//     BookingTermsConditions test = (BookingTermsConditions) iterator.next();
//         BookingTermsConditionsSave(test);
//        }
//    }

   
    
   
    
    public List<GMM> gmmList(String userId, String orgId, String SNo, String userRole)
            throws HibernateException, SQLException {
        List<GMM> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            if (SNo == null) {

                query = session.createQuery("from GMM where userId='" + userId + "'");
            } else {
                query = session.createSQLQuery("select asset_code, asset_name,service_req_no,service_area,service_name,unit_no from arete_tms.gmm");

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

    public List<PropertyDetails> propertyDetailsList(String userId, String orgId, String SNo)
            throws HibernateException, SQLException {
        List<PropertyDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from PropertyDetails where status='Rent Quote Created'");

            } else {
                query = session.createQuery("from PropertyDetails where sno='" + SNo + "' and status='Rent Quote Created'");
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
    
    public List<BookingQuotationDetails> quotationCodeinc(String userId, String orgId, String orderNo, String orderStatus, String limit) {
        List<BookingQuotationDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (limit.equals("1")) {
  
                query = session.createQuery("from BookingQuotationDetails ORDER BY SNo");
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
    public List<GMMGrid> gmmId(String userId, String assetCode)
            throws HibernateException, SQLException {
        List<GMMGrid> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

                query = session.createQuery("from GMMGrid where assetCode='" + assetCode + "'");
         
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
    public List<GMMGrid> gmmGridList(String userId, String SNo)
            throws HibernateException, SQLException {
        List<GMMGrid> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {

                query = session.createQuery("from GMMGrid");  //where userId='" + userId + "'
         
            } else {
                query = session.createQuery("from GMMGrid where SNo='"+SNo+"'");
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
    
    public void gmmGridListSave(List<GMMGrid> grid) {
        for (Iterator<GMMGrid> iterator = grid.iterator(); iterator.hasNext();) {
            GMMGrid test = (GMMGrid) iterator.next();
            newGmmGridListSave(test);
        }
    }
    
    public void newGmmGridListSave(GMMGrid dis) {
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

//    public void quotationDetailsListSave(List<BookingQuotationDetails> quotationList) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//
//    public void RentDetailsListSave(List<BookingRentDetails> rentList) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
//    

//    private void ServiceDetailsSave(BookingServiceDetails test) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }

//    private void BookingQuotationDetailsSave(BookingQuotationDetails test) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
}
