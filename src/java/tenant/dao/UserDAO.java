/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.dao;

import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import java.io.IOException;
import java.io.PrintWriter;
import tenant.classes.Department;
import tenant.classes.DepartmentModule;
import tenant.classes.DepartmentRole;
import tenant.classes.OrgDetails;
import tenant.classes.OrgGroup;
import tenant.classes.RolePermission;
import tenant.classes.SuborgGroup;
import tenant.classes.UserRegistration;
import java.math.BigInteger;
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
import tenant.classes.ApprovalLevel;
import tenant.classes.Category;
import tenant.classes.IndividualUitlity;
import tenant.classes.StoreMaster;
import tenant.classes.Workflow;


/**
 *
 * @author IT SUPPORT
 */
public class UserDAO extends HibernateDaoSupport{
    
    public Integer checkUser(String user, String pass) {
        Integer noofuser = 0;
        List<BigInteger> totuser = null;
         Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            totuser = session.createSQLQuery("SELECT count(*) FROM arete_tms.user_registration where USER_ID='" + user + "' and PASSWORD='" + pass + "' and STATUS!='Inactive'").list();
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

    public Integer checkUser1(String user) {
        Integer noofuser = 0;
        List<BigInteger> totuser = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            totuser = session.createSQLQuery("SELECT count(*) FROM user_registration where USER_ID='" + user + "' and STATUS!='Inactive'").list();
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

    //-------------------------------Organisation Group--------------------------------------------------------	
    public List<OrgGroup> grouplist(Integer sno) {
        List<OrgGroup> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from OrgGroup where status!='Inactive' and sno='" + sno + "'");
            } else {
                query = session.createQuery("from OrgGroup where status!='Inactive'");
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

    public void save(OrgGroup transientInstance) {
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

    //-------------------------------Sub Organisation Group--------------------------------------------------------	
    public List<SuborgGroup> subgrouplist(Integer sno) {
        List<SuborgGroup> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from SuborgGroup where status!='Inactive' and sno='" + sno + "'");
            } else {
                query = session.createQuery("from SuborgGroup where status!='Inactive'");
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

    public void save(SuborgGroup transientInstance) {
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

    //-------------------------------Organisation Details--------------------------------------------------------	
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

    public void save(OrgDetails transientInstance) {
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

    //-------------------------------Department--------------------------------------------------------	
    public List<Department> departmentlist(Integer sno) {
        List<Department> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from Department where status!='Inactive' and sno='" + sno + "' order by sno asc");
            } else {
                query = session.createQuery("from Department where status!='Inactive'  order by sno asc");
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

    public List<Department> departmentlist1(String orgId) {
        List<Department> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from Department where status!='Inactive' and orgCode='" + orgId + "' order by sno asc");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    public void save(Department transientInstance) {
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

    //-------------------------------Department Role--------------------------------------------------------	
    public List<DepartmentRole> rolelist(Integer sno) {
        List<DepartmentRole> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from DepartmentRole where status!='Inactive' and sno='" + sno + "' order by sno asc");
            } else {
                query = session.createQuery("from DepartmentRole where status!='Inactive' order by sno desc");
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

    public void save(DepartmentRole transientInstance) {
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

    //-------------------------------Department Module--------------------------------------------------------	
    public List<DepartmentModule> modulelist(String orgCode) {
        List<DepartmentModule> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from DepartmentModule where status!='Inactive' and orgCode='" + orgCode + "' order by sno asc");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    public List<DepartmentModule> modulelist1(String orgCode) {
        List<DepartmentModule> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
//            query = session.createQuery("select distinct departmentCode,submoduleName,sno from DepartmentModule where status!='Inactive' and orgCode='"+orgCode+"' order by sno asc");
            query = session.createSQLQuery("select DEPARTMENT_CODE,SUBMODULE_NAME,SNO from arete_tms.department_module \n"
                    + "where SNO in\n"
                    + "( select min(SNO) from arete_tms.department_module where ORG_CODE='1' group by\n"
                    + "SUBMODULE_NAME ) order by SNO;");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    public void save(DepartmentModule transientInstance) {
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

    //-------------------------------Role Permission--------------------------------------------------------
    public List<RolePermission> permlist(String orgId, String roleName) {
        List<RolePermission> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (roleName == null) {
                query = session.createQuery("select orgId,roleName from RolePermission where status!='Inactive' and orgId='" + orgId + "' group by orgId,roleName ");
            } else {
                query = session.createQuery("from RolePermission where status!='Inactive' and orgId='" + orgId + "' and roleName='" + roleName + "' ");
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

    public List<RolePermission> permmenu(String orgId, String roleName, String arr) {
        List<RolePermission> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if ("dept".equals(arr)) {
              //  query = session.createSQLQuery("select DEPARTMENT_NAME from arete_tms.role_permission  where ROLE_NAME='" + roleName + "' and ORG_ID='" + orgId + "' and STATUS!='Inactive' group by DEPARTMENT_NAME  order by SNO");
                
                query = session.createSQLQuery("select DEPARTMENT_NAME from arete_tms.ROLE_PERMISSION where \n"
                        + "org_id='" + orgId + "' and sno in(select min(sno) from arete_tms.role_permission where\n"
                        + "ROLE_NAME='" + roleName + "' and status!='Inactive'\n"
                        + "group by DEPARTMENT_NAME) order by sno asc");
            } else if ("menu".equals(arr)) {
//                query = session.createSQLQuery(" select * from arete_tms.role_permission   where ROLE_NAME='" + roleName + "' and ORG_ID='" + orgId + "' and STATUS!='Inactive' group by SUBMODULE_NAME order by SNO");
                  query = session.createSQLQuery("select * from arete_tms.ROLE_PERMISSION where \n"
                        + "org_id='"+orgId+"' and sno in(select min(sno) from arete_tms.role_permission where \n"
                        + "lower(ROLE_NAME)=lower('"+roleName+"') and status!='Inactive' \n"
                        + "group by SUBMODULE_NAME) order by sno asc");
            } else {
                query = session.createQuery("from RolePermission where status!='Inactive' and orgId='" + orgId + "' and roleName='" + roleName + "' and submoduleName='" + arr + "' order by SNO");
            }
             list = query.list();
             tx.commit();

        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        System.out.println("List:"+list);
        return list;
    }

    public void save(RolePermission transientInstance) {
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

    public void saveRole(List<RolePermission> grid) {
        for (Iterator<RolePermission> iterator = grid.iterator(); iterator.hasNext();) {
            RolePermission test = (RolePermission) iterator.next();
            save(test);
        }
    }

    public void delPerm(String roleName) {
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = session.beginTransaction();
            session.createQuery("delete from RolePermission where roleName='" + roleName + "'").executeUpdate();
            tx.commit();
            tx = null;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    //-------------------------------User Registration--------------------------------------------------------
    public List<UserRegistration> userlist(String orgId, String userId) {
        List<UserRegistration> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (userId == null) {
                query = session.createQuery("from UserRegistration where status!='Inactive'");
            } else {
                query = session.createQuery("from UserRegistration where status!='Inactive' and orgId='" + orgId + "' and userId='" + userId + "'");
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

    public void save(UserRegistration transientInstance) {
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

    public List<UserRegistration> userlist1(Integer SNo) {
        List<UserRegistration> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from UserRegistration where SNo='" + SNo + "'");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    public List<UserRegistration> getPassword(String sno) throws HibernateException, SQLException {
        List<UserRegistration> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from UserRegistration where SNo='" + sno + "' and status!='Inactive'");
            } else {
                query = session.createQuery("from UserRegistration order by sno ASC ");
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

    public void changePassword(String sno, String password) {
        String hql = null;
        Session session = getSessionFactory().openSession();
        try {
            Transaction tx = null;
            Query query = null;

            tx = session.beginTransaction();

            hql = "update UserRegistration set password='" + password + "' where SNo='" + sno + "'";

            query = session.createQuery(hql);
            int row = query.executeUpdate();

            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

    }

    public void userDel(Integer sno) throws HibernateException, SQLException {
        Session session = getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            String hql = "update UserRegistration set status='Inactive' where SNo='" + sno + "'";
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

    public List<String> getFlatTypes() {
        List<String> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from FlatType where status!='Inactive'");

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
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

    public List<String> comUtilList(String SNo) {
        List<String> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (SNo == null) {
                query = session.createQuery("from CommonUtility ");
            } else {
                query = session.createQuery("from CommonUtility where SNo='" + SNo + "' ");
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

    public List<String> fileSize() {
        List<String> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT FIELD_CODE,Max_Length FROM arete_tms.form_field_values where FIELD_CODE='F-25'");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    //**************Uniqueness for Userid******************//
    public void uniqueUserid(HttpServletRequest req, HttpServletResponse res, String userId) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        List<UserRegistration> citydata = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("FROM UserRegistration where ((lower(userId) like lower('" + userId + "')) or (upper (userId) like upper ('" + userId + "'))) and status!='Inactive'");
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

    //------Approval process of Rentquote End----------------------------------//
    public List<ApprovalLevel> approvallevelList(String userId, String tabName, String submoduleName) {
        List<ApprovalLevel> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (userId != null) {
                query = session.createSQLQuery("select SNo,test_No,Approval_level,Approval_Role,Comments,STATUS from arete_tms.Rentquote_APPROVAL \n"
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

    public List<Workflow> workflowGrouplist(String orgId, String userId, String txn) {
        List<Workflow> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            if (txn != null) {
                query = session.createQuery("from Workflow where status!='Inactive' and txn='" + txn + "'");
            } else {
                query = session.createSQLQuery("select submodule_name, tab_name, txn from arete_tms.work_flow where status!='Inactive'   group by submodule_name,tab_name,txn");
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

    public List<RolePermission> submodulelist(String orgCode) {
        List<RolePermission> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("select submoduleName from RolePermission where status!='Inactive'  group by submoduleName order by submoduleName asc ");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    public List<Object> list(String userId, String orgId, String sno, String className) throws HibernateException {
        List<Object> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno == null) {
                if (className == "FormNo82Grid") {
                    query = session.createQuery("from " + className + " where recordStatus!='created' ORDER BY sno DESC");
                } else if (className == "FormNo83Grid") {
                    query = session.createQuery("from " + className + " where recordStatus!='Form 84 Created' ORDER BY sno DESC");
                } else {
                    query = session.createQuery("from " + className + " where status!='Inactive' ORDER BY sno DESC");
                }
            } else {
                query = session.createQuery("from " + className + " where sno='" + sno + "' and status!='Inactive'");
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

    public void delWrkTxn(String roleName, String orgId, String txn) {
        Session session = getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.createQuery("delete from Workflow where txn='" + txn + "'").executeUpdate();
            tx.commit();
            tx = null;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public Integer gettaxNo() {
        List<Workflow> list = null;
        Integer lasttxno = 1;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from Workflow where status!='Inactive' order by txn desc");

            list = query.list();
            if (list.size() > 0) {
                for (Workflow list1 : list) {
                    lasttxno = list1.getTxn();
                    lasttxno = lasttxno + 1;
                    break;
                }
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
        return lasttxno;
    }

    public void saveWkflw(List<Workflow> wkList) {
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        try {
            tx = session.beginTransaction();
            for (Workflow wk : wkList) {
                session.saveOrUpdate(wk);
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

    public void gettab(HttpServletRequest req, HttpServletResponse res, String submodname) throws HibernateException, SQLException, IOException {
        List<String> datalist = null;
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("select TAB_NAME from arete_tms.role_permission where STATUS!='Inactive' and lower(SUBMODULE_NAME)=lower('" + submodname + "')  group by TAB_NAME order by TAB_NAME asc ");
             datalist = query.list();
             if (datalist.isEmpty() || datalist.contains(null) || datalist.contains("")) {
                out.append("");
            } else {
                List<String> itr = query.list();

                for (String st : itr) {

                    String s = st.toString().trim();

                    out.append(s.trim() + "$$");

                }
//                out.append(datalist.toString());
            }
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("exception");
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void getuser(HttpServletRequest req, HttpServletResponse res, String roleName) throws HibernateException, SQLException, IOException {
        List<Object[]> datalist = null;
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
//            if (district != null && district.equalsIgnoreCase("All")) {
//                query = session.createSQLQuery("select USER_NAME,USER_ID from exciseautomation.USER_REGISTRATION where STATUS!='Inactive' and lower(ROLE_NAME)= lower('" + roleName + "') and (lower(DISTRICT)!=lower('" + district + "') or lower(DISTRICT)=lower('All')) order by USER_NAME asc ");
//            } else {
//                query = session.createSQLQuery("select USER_NAME,USER_ID from exciseautomation.USER_REGISTRATION where STATUS!='Inactive' and lower(ROLE_NAME)= lower('" + roleName + "') and (lower(DISTRICT)=lower('" + district + "') or lower(DISTRICT)=lower('All')) order by USER_NAME asc ");
//            }
            query = session.createSQLQuery("select USER_FIRST_NAME,USER_LAST_NAME,USER_ID from arete_tms.user_registration where STATUS!='Inactive' "
                    + "and lower(ROLE_NAME)= lower('" + roleName + "') order by USER_FIRST_NAME asc ");

            datalist = query.list();

            if (datalist.isEmpty() || datalist.contains(null) || datalist.contains("")) {
                out.append("");
            } else {
                List<Object[]> itr = query.list();

                if (!itr.isEmpty()) {
                    for (Object[] st : itr) {

//                    for (int i = 0; i < st.length; i++) {
//                        String s = st[i].toString().trim();
//                        if (s.length() > 0) {
                        out.append(st[0] + "$$" + st[1] + "$$" + st[2] + "##");
//                        }
//                    }           
                    }

//                for (Object st : itr) {
//
//                    String s = st.toString().trim();
//
//                    out.append(s.trim() + "$$");
                }
//                out.append(datalist.toString());
            }
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("exception");
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public List<UserRegistration> userlist2(String userId) {
        List<UserRegistration> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("from UserRegistration where userId='" + userId + "'");
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    public List<OrgDetails> orglistNameWise(Integer sno) {
        List<OrgDetails> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (sno != null) {
                query = session.createQuery("from OrgDetails where status!='Inactive' and sno='" + sno + "'");
            } else {
                query = session.createQuery("from OrgDetails where status!='Inactive' order by UPPER(orgName) ASC");
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

    public List<UserRegistration> userReglist(String orgId, String userId) {
        List<UserRegistration> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            if (orgId != null && userId != null) {
                query = session.createQuery("from UserRegistration where status!='Inactive' and userId='" + userId + "' and orgId='" + orgId + "' order by SNo asc");
            } else {
                query = session.createQuery("from UserRegistration where status!='Inactive' order by SNo desc");
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

    //-------------------------------Store Details--------------------------------------------------------	
    public List<StoreMaster> storeName() {
        List<StoreMaster> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();

            query = session.createQuery("from StoreMaster where status!='Inactive'");

            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }

    public List<IndividualUitlity> utilityDetails(String userId, String orgId) {
        List<IndividualUitlity> conts = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createQuery("select utility from Product");
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

    public List<String> tenantCategory() {
        List<String> datalist = null;
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

    public List<String> utility() {
        List<String> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT utility_Code FROM arete_tms.individual_utility WHERE STATUS!='Inactive' ORDER BY s_no ASC");
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

    public List<String> comUtility() {
        List<String> datalist = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            query = session.createSQLQuery("SELECT comUtility_code FROM arete_tms.common_comutility WHERE STATUS!='Inactive' ORDER BY s_no ASC");
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
    
   // Newly added by Lalshmi for escalation Notification on 22Apr2019
    public List<RolePermission> submodulelist() {
        List<RolePermission> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            
                query = session.createQuery("select distinct submoduleName from RolePermission where status!='Inactive'");
            
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
    
    public List<String> getTabName(String subModuleName) {
        List<String> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            
                query = session.createSQLQuery("SELECT DISTINCT TAB_NAME from arete_tms.role_permission where SUBMODULE_NAME='"+subModuleName+"' and STATUS!='Inactive'");
            System.out.println("query"+query);
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
    
    public List<String> getRoleName(String subModuleName,String tabName) {
        List<String> list = null;
        Transaction tx = null;
        Session session = getSessionFactory().openSession();
        Query query = null;
        try {
            tx = session.beginTransaction();
            
                query = session.createSQLQuery("SELECT DISTINCT ROLE_NAME from arete_tms.role_permission where SUBMODULE_NAME='"+subModuleName+"' and TAB_NAME='"+tabName+"' and STATUS!='Inactive'");
            
            list = query.list();
            tx.commit();
        } catch (HibernateException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
    

}
