/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import tenant.classes.AdditionalDetails;
import tenant.classes.ApprovalLevel;
import tenant.classes.ContractAttach;
import tenant.classes.ContractCategory;
import tenant.classes.ContractClassification;
import tenant.classes.ContractCreation;
import tenant.classes.ContractUnitDetails;
import tenant.classes.CustomerUnitDetails;
import tenant.classes.IndividualUtilityManagement;
import tenant.classes.InsuranceAttach;
import tenant.classes.InsuranceDetails;
import tenant.classes.InsuranceMaster;
import tenant.classes.InsuranceTagDetails;
import tenant.classes.LandLordUnitsDetails;
import tenant.classes.OrgDetails;
import tenant.classes.PDCheckAdditional;
import tenant.classes.ServiceAmenties;
import tenant.classes.SplitAssetAttachment;
import tenant.classes.SubAssetDetails;
import tenant.classes.UnitMulipleCustomer;
import tenant.classes.UnitUtilityCategory;
import tenant.classes.UnitsContractTemplate;
import tenant.other.classes.commonInterface;

/**
 *
 * @author ebs
 */
public class ContractDAO extends HibernateDaoSupport implements commonInterface {

    //contract Insurance No Autogenerate
    public List<InsuranceDetails> InsuranceIDlist(String recordNo, String materialCode, String appStatus) {
        List<InsuranceDetails> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (recordNo != null) {
                query = session.createQuery("from InsuranceDetails where recordNo='" + recordNo + "' and approvalStatus='" + appStatus + "' and status!='Inactive'");
            } else if (materialCode != null) {
                query = session.createSQLQuery("SELECT INSURANCE_ID FROM insurance_details where INSURANCE_ID like '%INSUR%' and STATUS!='Inactive'");

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

    public List<InsuranceAttach> InsuranceAttachlist(String insuranceId) {
        List<InsuranceAttach> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from InsuranceAttach where insuranceNo='" + insuranceId + "'");

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
    public List<InsuranceAttach> InsuranceAttachlist1(String insuranceId, String fromDate, String toDate) {
        List<InsuranceAttach> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from InsuranceAttach where insuranceNo='" + insuranceId + "' and lastmodifiedDate >='" + fromDate + "' and lastmodifiedDate <='" + toDate + "'");

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    public List<InsuranceDetails> InsuranceDetailsList1(String orgId, String code)
            throws HibernateException, SQLException {
        List<InsuranceDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (code != null) {
                query = session.createQuery("from InsuranceDetails where insuranceNo='" + code + "' and status!='Inactive'");
            } else {
                query = session.createQuery("from InsuranceDetails order by sno ASC ");
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

    public void insuranceAttachSave(InsuranceAttach document) {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();

        session.save(document);
        tx.commit();
        session.close();
    }

    public void insuranceattachmentDelete(Integer sno, String orderNo)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("delete from InsuranceAttach where sno='" + sno + "'");
            } else {
                query = session.createQuery("delete from SalesCustomMenuList where bufferOne='" + orderNo + "'");
            }
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

    public void contractattachmentDelete(Integer sno, String orderNo)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("delete from ContractAttach where sno='" + sno + "'");
            } else {
                query = session.createQuery("delete from SalesCustomMenuList where bufferOne='" + orderNo + "'");
            }
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

    public InsuranceAttach getInsuranceAttach(Integer id) {
        Session session = getSessionFactory().openSession();
        InsuranceAttach exp = (InsuranceAttach) session.get(InsuranceAttach.class, id);
        session.close();
        return exp;
    }

    public List<InsuranceDetails> insuranceList1(String userId, String orgId, String SNo, String searchData, Integer iDisplayStart, Integer displayLength, String order)
            throws HibernateException, SQLException {
        List<InsuranceDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createSQLQuery("Select INSURANCE_NO,INSURANCE_FOR,INSURANCE_COMPANY_NAME,INS_VALID_FROM,INS_VALID_TO from arete_tms.insurance_details  where SNO in ( select min(SNO)  \n"
                        + "from arete_tms.insurance_details where   STATUS!='Inactive' and (lower(INSURANCE_NO) LIKE lower('%" + searchData + "%') or lower(INSURANCE_FOR) LIKE lower('%" + searchData + "%') or lower(INSURANCE_COMPANY_NAME) LIKE lower('%" + searchData + "%') or lower(INS_VALID_FROM) LIKE lower('%" + searchData + "%')or lower(INS_VALID_TO) LIKE lower('%" + searchData + "%') ) group by INSURANCE_NO ) order by SNO " + order + "").setFirstResult(iDisplayStart).setMaxResults(displayLength);
//                query = session.createSQLQuery("Select INSURANCE_NO from insurance_details   \n"
//                        + " where STATUS!='Inactive' and( (lower(INSURANCE_NO) LIKE lower('%" + searchData + "%'))) " ).setFirstResult(iDisplayStart).setMaxResults(displayLength);
////                System.out.println("qq"+query);
            } else {
                query = session.createQuery("from InsuranceDetails where sno='" + SNo + "' and status!='Inactive'");
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

    public BigDecimal insurancelistCount(String userId, String orgId, String SNo, String searchData, Integer iDisplayStart, Integer displayLength, String order)
            throws HibernateException, SQLException {
        BigDecimal datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {

                query = session.createSQLQuery("Select count(INSURANCE_NO) from arete_tms.insurance_details  where SNO in ( select min(SNO)  \n"
                        + "from arete_tms.insurance_details where  STATUS!='Inactive' and (lower(INSURANCE_NO) LIKE lower('%" + searchData + "%')) group by INSURANCE_NO ) order by SNO " + order + "");
//                query = session.createSQLQuery("Select count(INSURANCE_NO) from insurance_details   \n"
//                        + " where STATUS!='Inactive' and ( (lower(INSURANCE_NO) LIKE lower('%" + searchData + "%'))) " );
            } else {
                query = session.createQuery("from InsuranceDetails where sno='" + SNo + "' and status!='Inactive'");
            }

            datalist = (BigDecimal) query.uniqueResult();
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

    //pop up to select insurance Company
    public List<InsuranceMaster> insurComp1()
            throws HibernateException, SQLException {
        List<InsuranceMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from InsuranceMaster");

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

    public List<InsuranceMaster> compId(String sno, String insuranceCompId)
            throws HibernateException, SQLException {
        List<InsuranceMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select i1.INSURANCE_COMPANY_NAME,i1.INSURANCE_COMPANY_ID from arete_tms.insurance_master i1 , arete_tms.insurance_details i2 \n"
                    + "where i1.INSURANCE_COMPANY_ID='" + insuranceCompId + "' and i2.SNO='" + sno + "'");

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

    //list page display Name
    public List<InsuranceMaster> insurCompName()
            throws HibernateException, SQLException {
        List<InsuranceMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select i1.INSURANCE_COMPANY_NAME \n"
                    + "FROM arete_tms.insurance_master i1,arete_tms.insurance_details i2\n"
                    + "where i1.INSURANCE_COMPANY_ID=i2.INSURANCE_COMPANY_ID");

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

    public List<InsuranceMaster> insurmast()
            throws HibernateException, SQLException {
        List<InsuranceMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from InsuranceMaster");

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

    // Contract Attach List
    public List<ContractAttach> ContractAttachlist(String contractCode) {
        List<ContractAttach> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from ContractAttach where contractCode='" + contractCode + "'");

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    public List<ContractAttach> ContractAttachlist1() {
        List<ContractAttach> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from ContractAttach");

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
//pop up to select insurance Company

    public List<InsuranceMaster> insurComp()
            throws HibernateException, SQLException {
        List<InsuranceMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from InsuranceMaster where  status!='Inactive'");

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

    //pop up to select insurance Company
    public List<InsuranceDetails> insurDetail()
            throws HibernateException, SQLException {
        List<InsuranceDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select i.INSURANCE_NO,i.INSURANCE_ID,i.INSURANCE_FOR,i.INS_VALID_FROM,\n"
                    + "i.INS_VALID_TO,m.INSURANCE_COMPANY_NAME \n"
                    + "FROM arete_tms.insurance_details i,arete_tms.insurance_master m\n"
                    + "where m.INSURANCE_COMPANY_ID=i.INSURANCE_COMPANY_ID\n"
                    + "and m.STATUS!='Inactive'");

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

    public List<SubAssetDetails> subAssetMast()
            throws HibernateException, SQLException {
        List<SubAssetDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from SubAssetDetails where status!='inactive'");

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

    public List<InsuranceMaster> insuMast()
            throws HibernateException, SQLException {
        List<InsuranceMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from InsuranceMaster where status!='inactive'");

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

    public void delInsurAttach(HttpServletRequest req, HttpServletResponse res, String bnum) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<ContractAttach> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("DELETE FROM arete_tms.insurance_attach where SNO='" + bnum + "' ");
            int x = query.executeUpdate();
//            citydata = query.list();
            if (x < 0) {
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

    ////Contract Insurance Unique method    
    public void selectInsurance(HttpServletRequest req, HttpServletResponse res, String bnum) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<ContractCategory> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select INSURANCE_NO\n"
                    + "FROM arete_tms.insurance_details\n"
                    + "where INSURANCE_NO='" + bnum + "' and STATUS!='Inactive'");
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

    ////Contract Insurance Unique method    
    public void selectInsuranceCom(HttpServletRequest req, HttpServletResponse res, String bnum) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<ContractCategory> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select INSURANCE_COMPANY_NAME\n"
                    + "FROM arete_tms.insurance_master\n"
                    + "where INSURANCE_COMPANY_ID='" + bnum + "' and STATUS!='Inactive'");
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

    //pop up to select contract Category
    public List<ContractCategory> contraCategory()
            throws HibernateException, SQLException {
        List<ContractCategory> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from ContractCategory where  status!='Inactive'");

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

    //pop up to select contract Classification
    public List<ContractClassification> contraClass()
            throws HibernateException, SQLException {
        List<ContractClassification> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from ContractClassification where  status!='Inactive'");

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

    //contract creation Autogenerate
    public List<ContractCreation> ContractCreationlist(String recordNo, String materialCode, String appStatus) {
        List<ContractCreation> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (recordNo != null) {
                query = session.createQuery("from InsuranceDetails where recordNo='" + recordNo + "' and approvalStatus='" + appStatus + "' and status!='Inactive'");
            } else if (materialCode != null) {
                query = session.createSQLQuery("SELECT CONTRACT_CODE FROM arete_tms.contract_creation where CONTRACT_CODE like '%CONT%'");

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

    // to save contract Attachment 
    public void contractAttachSave(ContractAttach document) {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();

        session.save(document);
        tx.commit();
        session.close();
    }

    public ContractAttach getContractAttach(Integer id) {
        Session session = getSessionFactory().openSession();
        ContractAttach exp = (ContractAttach) session.get(ContractAttach.class, id);
        session.close();
        return exp;
    }

    public void delContraAttach(HttpServletRequest req, HttpServletResponse res, String bnum) throws IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<ContractAttach> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("DELETE FROM arete_tms.contract_attach where SNO='" + bnum + "' ");
            int x = query.executeUpdate();
//            citydata = query.list();
            if (x < 0) {
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

    //list page display Name
    public List<InsuranceMaster> insurTagged()
            throws HibernateException, SQLException {
        List<InsuranceMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select i1.INSURANCE_ID\n"
                    + "FROM arete_tms.insurance_details i1,arete_tms.contract_creation i2\n"
                    + "where i1.INSURANCE_ID=i2.INSURANCE_TAGGED_ID;");

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

    public List<InsuranceMaster> insurTagged1(String fromDate, String toDate)
            throws HibernateException, SQLException {
        List<InsuranceMaster> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select i1.INSURANCE_ID\n"
                    + "FROM arete_tms.insurance_details i1,arete_tms.contract_creation i2\n"
                    + "where i1.INSURANCE_ID=i2.INSURANCE_TAGGED_ID and LASTMODIFIED_DATE >='" + fromDate + "' and LASTMODIFIED_DATE <='" + toDate + "';");

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

    public List<ContractCategory> categoryName(String sno, String insuranceCompId)
            throws HibernateException, SQLException {
        List<ContractCategory> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select i1.INSURANCE_COMPANY_NAME from arete_tms.insurance_master i1 , arete_tms.insurance_details i2 \n"
                    + "where i1.INSURANCE_COMP_ID='" + insuranceCompId + "' and i2.SNO='" + sno + "'");

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

    //edit method to save Category name 
    public List<ContractCategory> contCategory(String sno, String categoryId)
            throws HibernateException, SQLException {
        List<ContractCategory> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select i1.CONTRACT_CATEGORY,i1.CONTRACT_CATEGORY_ID from arete_tms.contract_category i1 , arete_tms.contract_creation i2 \n"
                    + "where i1.CONTRACT_CATEGORY_ID='" + categoryId + "' and i2.SNO='" + sno + "'");

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

    //edit method to save Classification name 
    public List<ContractClassification> contClassfName(String sno, String classId)
            throws HibernateException, SQLException {
        List<ContractClassification> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select i1.CONTRA_CLASSIFICATION,i1.CLASSIFICATION_ID from arete_tms.contract_classification i1 , arete_tms.contract_creation i2 \n"
                    + "where i1.CLASSIFICATION_ID='" + classId + "' and i2.SNO='" + sno + "'");

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

    //edit method to save Property name 
    public List<SubAssetDetails> subAssetDetails(String sno, String propertyCod, String FlatCod)
            throws HibernateException, SQLException {
        List<SubAssetDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select i1.asset_name,i1.sub_asset_name,asset_code,sub_asset_code \n"
                    + "from arete_tms.sub_asset_details i1 , arete_tms.contract_creation i2 \n"
                    + "where i1.asset_code='" + propertyCod + "' and i1.sub_asset_code='" + FlatCod + "' and i2.SNO='" + sno + "'");

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

    //edit method to get Property name in approval form
    public List<SubAssetDetails> subAssetDetails1()
            throws HibernateException, SQLException {
        List<SubAssetDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from SubAssetDetails");

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

    @Override
    public List<Class> list(String instanceVariable, String className) {
        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (instanceVariable != "") {
                query = session.createQuery("from " + className + " where  status!='Inactive' and sno='" + instanceVariable + "'");
            } else {
                query = session.createQuery("from " + className + " where status!='Inactive'");
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
    public List<Class> clist1(String instanceVariable, String className, String fromDate, String toDate) {
        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (instanceVariable != "") {
                query = session.createQuery("from " + className + " where  sno='" + instanceVariable + "' and lastmodified_date >='" + fromDate + "' and lastmodified_date <='" + toDate + "'");
            } else {
                query = session.createQuery("from " + className + " where lastmodified_date >='" + fromDate + "' and lastmodified_date <='" + toDate + "' ");
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

    ////Newly Added By Lakshmi
    public List<Class> insuranceTagginglist(String sNo, String className) {
        List<Class> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sNo != "") {
                query = session.createQuery("from " + className + " where  sno='" + sNo + "'");
            } else {
                query = session.createQuery("from " + className + " ");
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

    ///////////////
    @Override
    public List<Class> list(Integer instanceVariable, String className) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void globalDelete(Integer instanceVariable) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    //Expiry Contract List
    public List<ContractCreation> expContractList()
            throws HibernateException, SQLException {
        List<ContractCreation> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
//            query = session.createSQLQuery("select CONTRACT_CODE,CONTRACT_TITLE,CONT_START_DATE,CONT_END_DATE,CONT_REVIEW_DATE,CONTRACT_CATEGORY_ID,\n"
//                    + "CLASSIFICATION_ID,SNO,PROPERTY_CODE,FLAT_CODE\n"
//                    + "FROM arete_tms.contract_creation WHERE CONT_END_DATE < curdate() AND CONT_STATUS='Active'");
            query = session.createSQLQuery("select c.CONTRACT_CODE,c.CONTRACT_TITLE,c.CONT_START_DATE,c.CONT_END_DATE,c.CONT_REVIEW_DATE,c.CONTRACT_CATEGORY_ID,c.CLASSIFICATION_ID,c.PROPERTY_CODE,c.SNO,a.asset_name,t.tenant_fname,c.FLAT_CODE,s.sub_asset_name\n"
                    + "FROM arete_tms.contract_creation c inner join arete_tms.tenant_details t on c.CONTRACT_CODE = t.contract_period inner join arete_tms.asset_details a on a.asset_code=c.PROPERTY_CODE inner join arete_tms.sub_asset_details s on s.sub_asset_code=c.FLAT_CODE\n"
                    + "and c.CONT_END_DATE < curdate() AND c.CONT_STATUS='Active' and c.status!='Inactive' and t.appstatus='CFO Approved' and t.attribute3!='Renewed'");
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
    public List<ContractCreation> expContractList1(String fromDate, String toDate)
            throws HibernateException, SQLException {
        List<ContractCreation> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select c.CONTRACT_CODE,c.CONTRACT_TITLE,c.CONT_START_DATE,c.CONT_END_DATE,c.CONT_REVIEW_DATE,c.CONTRACT_CATEGORY_ID,c.CLASSIFICATION_ID,c.PROPERTY_CODE,c.SNO,a.asset_name,t.tenant_fname,c.FLAT_CODE,s.sub_asset_name\n"
                    + "FROM arete_tms.contract_creation c inner join arete_tms.tenant_details t on c.CONTRACT_CODE = t.contract_period inner join arete_tms.asset_details a on a.asset_code=c.PROPERTY_CODE inner join arete_tms.sub_asset_details s on s.sub_asset_code=c.FLAT_CODE\n"
                    + "and c.CONT_END_DATE < curdate() AND c.CONT_STATUS='Active' and c.status!='Inactive' and t.appstatus='CFO Approved' and t.attribute3!='Renewed' and c.LASTMODIFIED_DATE >='" + fromDate + "' and c.LASTMODIFIED_DATE <='" + toDate + "'");

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

    //Insurance No in edit form
    public List<ContractCreation> insuranceNoList(String ContCode)
            throws HibernateException, SQLException {
        List<ContractCreation> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select c1.SNO,d1.INSURANCE_NO,d1.INSURANCE_ID FROM arete_tms.insurance_details d1,arete_tms.contract_insurance_tag c1\n"
                    + "where d1.INSURANCE_ID=c1.INSURANCE_ID and c1.CONTRACT_CODE='" + ContCode + "'");

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

    //Insurance No in edit form
    public List<ContractAttach> editList(String ContractCode)
            throws HibernateException, SQLException {
        List<ContractAttach> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select c1.CLASSIFICATION_ID,c1.CONT_END_DATE,c1.CONT_REVIEW_DATE,c1.CONT_STATUS,\n"
                    + "c1.CONTRACT_CATEGORY_ID,c1.CONTRACT_TERM,\n"
                    + "c2.CONTRACT_CODE,c2.INSURANCE_ID,c3.CONTRACT_CATEGORY,c4.CONTRA_CLASSIFICATION,\n"
                    + "c1.CONT_START_DATE,c2.SNO as S_n,"
                    + "IFNULL(c5.INSURANCE_NO,\"\") AS INSURANCE_NO,c1.SNO as S_No,c1.CONTRACT_TERM as contTerm,c1.REMARKS,c1.PROPERTY_CODE,c1.FLAT_CODE,c1.CONTRACT_TITLE\n"
                    + "from\n"
                    + "arete_tms.contract_creation c1\n"
                    + "left join arete_tms.contract_insurance_tag c2\n"
                    + "on c1.CONTRACT_CODE=c2.CONTRACT_CODE\n"
                    + "left join arete_tms.contract_category c3\n"
                    + "on c1.CONTRACT_CATEGORY_ID=c3.CONTRACT_CATEGORY_ID\n"
                    + "left join arete_tms.contract_classification c4\n"
                    + "on c1.CLASSIFICATION_ID=c4.CLASSIFICATION_ID\n"
                    + "left join arete_tms.insurance_details c5\n"
                    + "on c2.INSURANCE_ID=c5.INSURANCE_ID\n"
                    + "where c1.CONTRACT_CODE='" + ContractCode + "' ");

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

    /// Contract attach Download
    public ContractAttach getcontractAttach(Integer id) {
        Session session = getSessionFactory().openSession();
        ContractAttach exp = (ContractAttach) session.get(ContractAttach.class, id);
        session.close();
        return exp;
    }

    ///contract Approval///////
    public List<ApprovalLevel> approvallevelList(String userId, String tabName, String submoduleName) {
        List<ApprovalLevel> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (userId != null) {
                query = session.createSQLQuery("select SNo,test_No,Approval_level,Approval_Role,Comments,STATUS from arete_tms.contract_approval \n"
                        + "where STATUS!='Inactive' and level_no=(select level_no from arete_tms.approval_level\n"
                        + " where status!='Inactive' and level_no < (select level_no from arete_tms.approval_level\n"
                        + " where status!='Inactive' and User_ID='" + userId + "') and TAB_NAME='" + tabName + "'\n"
                        + " and SUBMODULE_NAME='" + submoduleName + "' order by level_no DESC Limit 1)");
            } else {
                query = session.createQuery("from ApprovalLevel where status!='Inactive'");
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

    //===================Row Delete from Grid Contract =======================
    public void ContractGridDataDelete(Integer sno)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("update ContractInsuranceTag set status='Inactive' where  sno='" + sno + "' ");

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

    ////////////Update Contract////////////////////
    public void approv2Update(String contraCod, String reviewerRemarks, String recordStatus)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update ContractCreation set recordStatus='" + recordStatus + "',approvar2Remark='" + reviewerRemarks + "' where contractCode='" + contraCod + "'");
            //query = session.createQuery("UPDATE arete_tms.contract_creation set RECORD_STATUS='" + recordStatus + "',APPROVER2_REMARK='" + reviewerRemarks + "' where CONTRACT_CODE='" + contraCod + "'");

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

    public List<ContractCreation> contratCreateList(String recordStatus)
            throws HibernateException, SQLException {
        List<ContractCreation> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from ContractCreation where recordStatus='Contract Created'");

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
    public List<ContractCreation> contratCreateList1(String recordStatus, String fromDate, String toDate)
            throws HibernateException, SQLException {
        List<ContractCreation> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from ContractCreation where recordStatus='Contract Created' and lastmodifiedDate >='" + fromDate + "' and lastmodifiedDate <='" + toDate + "'");

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

    public List<ContractUnitDetails> contraList2(String userId, String orgId, String SNo, String recordStatus)
            throws HibernateException, SQLException {
        List<ContractUnitDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            
                query = session.createQuery("from ContractUnitDetails where status='Pending'");

           
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

    //to fetch requi list in Approval form
    public List<ContractCreation> contraApprovList(String userId, String orgId, String ContraCode)
            throws HibernateException, SQLException {
        List<ContractCreation> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from ContractCreation where status!='Inactive' and contractCode='" + ContraCode + "'");
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

    public List<ContractCreation> contraList3(String userId, String orgId, String SNo, String recordStatus)
            throws HibernateException, SQLException {
        List<ContractCreation> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from ContractCreation where status!='Inactive' and recordStatus='GFC APPROVED'");

            } else {
                query = session.createQuery("from PurchRequisition where sno='" + SNo + "' and status!='Inactive'");
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

    public void approv3Update(String contraCod, String reviewerRemarks, String recordStatus)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update ContractCreation set recordStatus='" + recordStatus + "',approvar3Remark='" + reviewerRemarks + "' where contractCode='" + contraCod + "'");
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

    //to fetch Contract List in Approval form
    public List<ContractCreation> ContraApprovList(String userId, String orgId, String contraCode)
            throws HibernateException, SQLException {
        List<ContractCreation> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from ContractCreation where status!='Inactive' and contractCode='" + contraCode + "'");
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

    public List<ContractCreation> contraList(String userId, String orgId, String SNo, String recordStatus)
            throws HibernateException, SQLException {
        List<ContractCreation> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            
                query = session.createQuery("from ContractUnitDetails where status='Approved'");

            

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
//newly added by lakshmi for dashboard based on from and to dates on 27mar2019

    public List<ContractCreation> contraList1(String userId, String orgId, String SNo, String recordStatus, String frdate, String todate)
            throws HibernateException, SQLException {
        List<ContractCreation> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from ContractCreation where status!='Inactive' and status!='Expired' and recordStatus='CFO APPROVED' and LASTMODIFIED_DATE >='" + frdate + "'\n"
                        + "and LASTMODIFIED_DATE <='" + todate + "'");

            } else {
                query = session.createQuery("from PurchRequisition where sno='" + SNo + "' and status!='Inactive'");
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

    public List<ContractUnitDetails> rejectContractList1(String userId, String orgId, String SNo, String recordStatus)
            throws HibernateException, SQLException {
        List<ContractUnitDetails> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            
                query = session.createQuery("from ContractUnitDetails where rejectremark!=' '");

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

    public void ContraReject1Update(String contractCode, String reviewerRemarks, String recordStatus)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update ContractCreation set recordStatus='" + recordStatus + "',approvar2Remark='" + reviewerRemarks + "' where contractCode='" + contractCode + "'");
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

    public void ContraReject2Update(String contractCode, String reviewerRemarks, String recordStatus)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update ContractCreation set recordStatus='" + recordStatus + "',approvar3Remark='" + reviewerRemarks + "' where contractCode='" + contractCode + "'");
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

    public void ContraRecheck1Update(String contractCode, String reviewerRemarks, String recordStatus)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update ContractCreation set recordStatus='" + recordStatus + "',approvar2Remark='" + reviewerRemarks + "' where contractCode='" + contractCode + "'");
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

    public void ContraRenewUpdate(String contractCode, String date, String status, String contractTitle, String contEndDate, String contStartDate)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (date == null) {
                query = session.createQuery("update ContractCreation set contReviewDate=NULL,status='Renewed',recordStatus='Contract Created',contractTitle='" + contractTitle + "',contEndDate='" + contEndDate + "',contStartDate='" + contStartDate + "' where contractCode='" + contractCode + "'");
            } else {
                query = session.createQuery("update ContractCreation set contReviewDate='" + date + "',status='Renewed',contractTitle='" + contractTitle + "',contEndDate='" + contEndDate + "',contStartDate='" + contStartDate + "' where contractCode='" + contractCode + "'");
            }
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

    // contract grid data delete in edit part
    public void insutagGridDataDelete(Integer sno)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("update ContractInsuranceTag set status='Inactive' where  sno='" + sno + "' ");

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

    // contract grid data delete in edit part
    public void contraGridDataDelete(Integer sno)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("update ContractCreation set status='Inactive' where  sno='" + sno + "' ");

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

    @Override
    public void globalInactive(String instanceVariable, String className) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    //contra attachmnt delete
    public void contraattachmentDelete(Integer sno)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
//            if (sno != null) {
            query = session.createQuery("delete from ContractAttach where sno='" + sno + "'");
//            } else {
//                query = session.createQuery("delete from SalesCustomMenuList where bufferOne='" + orderNo + "'");
//            }
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

    //Contract Attachment update
    public void contraAttachRecheckUpdate(String sno, String contCod)
            throws HibernateException, SQLException {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("update ContractAttach set contractCode='" + contCod + "' where sno='" + sno + "'");
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

    // to save Contract Attachment 
    public void contraAttachSave(ContractAttach document) {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();

        session.save(document);
        tx.commit();
        session.close();
    }

    public void contraAttachSave1(List<ContractAttach> bdpfFile) {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            Iterator<ContractAttach> itr = bdpfFile.iterator();
            while (itr.hasNext()) {
                ContractAttach next = itr.next();
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

    // to save Insurance Attachment 
   /* public void insurAttachSave(InsuranceAttach document) {
     Session session = getSessionFactory().openSession();
     Transaction tx = session.beginTransaction();

     session.save(document);
     tx.commit();
     session.close();
     }*/
    public ContractAttach getattchs1(Integer sno) {
        Session session = getSessionFactory().openSession();
        ContractAttach exp = (ContractAttach) session.get(ContractAttach.class, sno);
        session.close();
        return exp;
    }

    public InsuranceAttach getattchs(Integer sno) {
        Session session = getSessionFactory().openSession();
        InsuranceAttach exp = (InsuranceAttach) session.get(InsuranceAttach.class, sno);
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

    public void insurAttachSave(List<InsuranceAttach> bdpfFile) {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            Iterator<InsuranceAttach> itr = bdpfFile.iterator();
            while (itr.hasNext()) {
                InsuranceAttach next = itr.next();
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

    public InsuranceAttach getCAMAttach(Integer SNo) {
        Session session = getSessionFactory().openSession();
        InsuranceAttach exp = (InsuranceAttach) session.get(InsuranceAttach.class, SNo);
        session.close();
        return exp;
    }

    public ContractAttach getCAMAttach1(Integer SNo) {
        Session session = getSessionFactory().openSession();
        ContractAttach exp = (ContractAttach) session.get(ContractAttach.class, SNo);
        session.close();
        return exp;
    }

    @Override
    public List<Class> roleperm(String orgId, String roleName, String submodule, String tab) {
        List<Class> list = null;
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

    //**************Fetch Tenant Details for Email******************//
    public List<ContractCreation> tdList(String userId, String orgId, String contractCode) throws HibernateException, SQLException {
        List<ContractCreation> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from ContractCreation where contractCode='" + contractCode + "' and status!='Inactive'");
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

     /////// Newly added By Lakshmi/////////
    public void saveInsuranceTaggingDetails(InsuranceTagDetails Tagdetails) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(Tagdetails);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.clear();
            session.close();
        }

    }

    public void saveInsuranceTaggingDetails(List<InsuranceTagDetails> grid) {
        for (Iterator<InsuranceTagDetails> iterator = grid.iterator(); iterator.hasNext();) {
            InsuranceTagDetails test = (InsuranceTagDetails) iterator.next();
            saveInsuranceTaggingDetails(test);
        }
    }
    //////////////
    
    public List<SubAssetDetails> subAssetDetailslist(String sno) {
        List<SubAssetDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from SubAssetDetails where status!='Inactive' and SNo='" + sno + "'");
            } else {
                query = session.createQuery("select ad.assetCode,ad.assetName,sad.SNo,sad.subAssetCode,sad.subAssetName,sad.recordStatus from AssetDetails ad, SubAssetDetails sad where ad.assetCode=sad.assetCode");

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

    //contract creation Autogenerate
    public List<ContractCreation> getUnitContractCode(String recordNo, String materialCode, String appStatus) {
        List<ContractCreation> inventory = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (recordNo == null) {
                query = session.createSQLQuery("SELECT CONTRACT_CODE FROM arete_tms.contract_unit_details where CONTRACT_CODE like '%CONT%'");

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


    public List<LandLordUnitsDetails> unitLandLordDetailsList(String userId, String orgId, String cCode) {
        Session session = getSessionFactory().openSession();
        Transaction tx = null;
        List<LandLordUnitsDetails> cList = new ArrayList<LandLordUnitsDetails>();
        Query query = null;
        try {

            tx = session.beginTransaction();

            if (cCode == null || cCode == "") {
                query = session.createQuery("from LandLordUnitsDetails");

            } else {
                query = session.createQuery("from LandLordUnitsDetails where contractCode='"+cCode+"'");
            }

            cList = query.list();

            tx.commit();
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cList;
    }
    
    public List<CustomerUnitDetails> unitCustomerDetailsList(String userId, String orgId, String cCode) {
        Session session = getSessionFactory().openSession();
        Transaction tx = null;
        List<CustomerUnitDetails> cList = new ArrayList<CustomerUnitDetails>();
        Query query = null;
        try {

            tx = session.beginTransaction();

            if (cCode == null || cCode == "") {
                query = session.createQuery("from CustomerUnitDetails");

            } else {
                query = session.createQuery("from CustomerUnitDetails where contractCode='"+cCode+"'");
            }

            cList = query.list();

            tx.commit();
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cList;
    }
    
    public List<ContractUnitDetails> unitContractDetailsList(String userId, String orgId, String cCode) {
        Session session = getSessionFactory().openSession();
        Transaction tx = null;
        List<ContractUnitDetails> cList = new ArrayList<ContractUnitDetails>();
        Query query = null;
        try {

            tx = session.beginTransaction();

            if (cCode == null || cCode == "") {
                query = session.createQuery("from ContractUnitDetails");

            } else {
                query = session.createQuery("from ContractUnitDetails where contractode='"+cCode+"'");
            }

            cList = query.list();

            tx.commit();
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cList;
    }
    
    public List<AdditionalDetails> additionalDetailsList(String userId, String orgId, String cCode) {
        Session session = getSessionFactory().openSession();
        Transaction tx = null;
        List<AdditionalDetails> cList = new ArrayList<AdditionalDetails>();
        Query query = null;
        try {

            tx = session.beginTransaction();

            if (cCode == null || cCode == "") {
                query = session.createQuery("from AdditionalDetails");

            } else {
                query = session.createQuery("from AdditionalDetails where contractCode='"+cCode+"'");
            }

            cList = query.list();

            tx.commit();
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cList;
    }
    
    public List<ServiceAmenties> serviceAmentiesDetailsList(String userId, String orgId, String cCode) {
        Session session = getSessionFactory().openSession();
        Transaction tx = null;
        List<ServiceAmenties> cList = new ArrayList<ServiceAmenties>();
        Query query = null;
        try {

            tx = session.beginTransaction();

            if (cCode == null || cCode == "") {
                query = session.createQuery("from ServiceAmenties");

            } else {
                query = session.createQuery("from ServiceAmenties where contractCode='"+cCode+"'");
            }

            cList = query.list();

            tx.commit();
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cList;
    }
    
    public List<UnitUtilityCategory> unitUtilityCategoryDetailsList(String userId, String orgId, String cCode) {
        Session session = getSessionFactory().openSession();
        Transaction tx = null;
        List<UnitUtilityCategory> cList = new ArrayList<UnitUtilityCategory>();
        Query query = null;
        try {

            tx = session.beginTransaction();

            if (cCode == null || cCode == "") {
                query = session.createQuery("from UnitUtilityCategory");

            } else {
                query = session.createQuery("from UnitUtilityCategory where contractCode='"+cCode+"'");
            }

            cList = query.list();

            tx.commit();
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cList;
    }
    
    public List<UnitMulipleCustomer> UnitMulipleCustomerDetailsList(String userId, String orgId, String cCode) {
        Session session = getSessionFactory().openSession();
        Transaction tx = null;
        List<UnitMulipleCustomer> cList = new ArrayList<UnitMulipleCustomer>();
        Query query = null;
        try {

            tx = session.beginTransaction();

            if (cCode == null || cCode == "") {
                query = session.createQuery("from UnitMulipleCustomer");

            } else {
                query = session.createQuery("from UnitMulipleCustomer where contractCode='"+cCode+"'");
            }

            cList = query.list();

            tx.commit();
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cList;
    }
    
    public List<PDCheckAdditional> pDCheckAdditionalCustomerDetailsList(String userId, String orgId, String cCode) {
        Session session = getSessionFactory().openSession();
        Transaction tx = null;
        List<PDCheckAdditional> cList = new ArrayList<PDCheckAdditional>();
        Query query = null;
        try {

            tx = session.beginTransaction();

            if (cCode == null || cCode == "") {
                query = session.createQuery("from PDCheckAdditional");

            } else {
                query = session.createQuery("from PDCheckAdditional where contractCode='"+cCode+"'");
            }

            cList = query.list();

            tx.commit();
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cList;
    }
    
    public List<AdditionalDetails> unitContractList(String userId, String orgId, String cCode) {
        Session session = getSessionFactory().openSession();
        Transaction tx = null;
        List<AdditionalDetails> cList = new ArrayList<AdditionalDetails>();
        Query query = null;
        try {

            tx = session.beginTransaction();

            if (cCode == null || cCode == "") {
                query = session.createSQLQuery("select ad.contract_code,ad.municipal_agreement_no,ad.property_name,ad.proprty_code,\n" +
"c.contract_period,c.renewal_date,c.status,c.start_date from\n" +
"arete_tms.additional_details ad inner join  \n" +
"arete_tms.contract_unit_details c on  ad.contract_code=c.contract_code");

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
    
    @SuppressWarnings("unchecked")
    public List<UnitsContractTemplate> unitContractTemplateList(String userId, String sNo)
            throws HibernateException, SQLException {
        List<UnitsContractTemplate> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sNo == null) {

                query = session.createQuery("from UnitsContractTemplate");  //where userId='" + userId + "
         
            } else {
                query = session.createQuery("from UnitsContractTemplate where sNo='" + sNo + "'");
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
    
    public void unitContractTemplateListSave(List<UnitsContractTemplate> grid) {
        for (Iterator<UnitsContractTemplate> iterator = grid.iterator(); iterator.hasNext();) {
            UnitsContractTemplate test = (UnitsContractTemplate) iterator.next();
            newUnitContractTemplateListSave(test);
        }
    }
    
    public void newUnitContractTemplateListSave(UnitsContractTemplate dis) {
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
    public void updateApproveStatus(String subAssetCode, String recordstatus1) throws HibernateException, SQLException {
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
    public void updatecontractApprovalStatus(String contractStatus,String contractCode) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = null;
        try {

            
                hql = "update ContractUnitDetails set status='"+contractStatus+"' where contract_code='"+contractCode+"'";
           

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
    public void updatecontractRejectedRemark(String reviewerComments,String contractCode) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        String hql = null;
        try {

            
                hql = "update ContractUnitDetails set rejectremark='"+reviewerComments+"' where contract_code='"+contractCode+"'";
           

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
    public List<ContractUnitDetails> unitContractList1(String userId, String orgId) {
    Session session = getSessionFactory().openSession();
    Transaction tx = null;
    List<ContractUnitDetails> cList = new ArrayList<>();
    Query query = null;
    try {
        tx = session.beginTransaction();

        
                query = session.createQuery("from ContractUnitDetails");

            
//        query = session.createSQLQuery("select contract_code, start_date, status from arete_tms.contract_unit_details")
//                .addEntity(ContractUnitDetails.class); // Add this line to map the query result to ContractUnitDetails objects

        cList = query.list();

        tx.commit();
    } catch (Exception e) {
        if (tx != null) {
            tx.rollback();
        }
        e.printStackTrace();
    } finally {
        session.close();
    }

    return cList;
}

}
