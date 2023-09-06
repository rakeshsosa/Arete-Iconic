/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import java.sql.SQLException;
import tenant.classes.Department;
import tenant.classes.DepartmentModule;
import tenant.classes.DepartmentRole;
import tenant.classes.OrgDetails;
import tenant.classes.OrgGroup;
import tenant.classes.RolePermission;
import tenant.classes.SuborgGroup;
import tenant.classes.UserRegistration;
import tenant.dao.UserDAO;
import java.text.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import tenant.classes.Workflow;
import tenant.dao.DashboardDAO;
import tenant.dao.TenantDetailsDAO;

import tenant.other.classes.Md5;

/**
 *
 * @author ebs-sdd16
 */
@Controller
public class UserController {

    DateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
    DateFormat formatter2 = new SimpleDateFormat("dd-MM-yyyy");
    DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

    @Autowired
    private UserDAO userDAO;
    @Autowired
    private DashboardDAO dashboarddao;
    @Autowired
    private TenantDetailsDAO tenantDetailsDAO;

    @RequestMapping("/login/login.htm")
    public ModelAndView redirectToLandingPage(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("login");
    }
//**************regarding to landing page******************//

    @RequestMapping("/login/logout.htm")
    public ModelAndView redirectToLandingPageFI(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(true);
        session.invalidate();
        return new ModelAndView("login");
    }
////**************log in and validate users******************//
//
//    @RequestMapping("/login/home.htm")
//    public ModelAndView redirectToDashBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        HttpSession session = request.getSession(true);
//        ModelMap map = new ModelMap();
//        String userId = request.getParameter("userId");
//        String password = request.getParameter("password");
//        Md5 md5 = new Md5();
//        String encrypPassword = md5.encrypt(password);
//        Integer noofuser = 0;
//        if (("".equals(userId) || "".equals(encrypPassword)) || (userId == null || password == null)) {
//            map.addAttribute("failmsg", "* Login failed please try again...");
//            return new ModelAndView("login", map);
//        } else {
//            noofuser = userDAO.checkUser(userId, encrypPassword);
//            if (noofuser > 0) {
//                session.setAttribute("userId", userId);
//                map.addAttribute("orglist", userDAO.orglist(null));
//                return new ModelAndView("selectorg", map);
//            } else {
//                map.addAttribute("failmsg", "* Login failed please try again...");
//                return new ModelAndView("login", map);
//            }
//        }
//
//    }
//**************forward to dashboard******************//     

    @RequestMapping("/login/fdashboard.htm")
    public ModelAndView ToDashBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(true);
        ModelMap map = new ModelMap();
      //   String roleName1 = session.getAttribute("userRole").toString();
        String userid = request.getParameter("userId");
        String password = request.getParameter("password");
        String frdate = request.getParameter("Frdate");
        String todate = request.getParameter("todate");
        if (frdate != null && todate != null) {
            userid = request.getParameter("userId");
            String orgCode = request.getParameter("orgCode");
        }
        Md5 md5 = new Md5();
        String encrypPassword = md5.encrypt(password);
        Integer noofuser = 0;
        if (("".equals(userid) || "".equals(encrypPassword)) || (userid == null || password == null)) {
            map.addAttribute("failmsg", "* Please Enter UserName And Password...");
            return new ModelAndView("login", map);
        } else {
            noofuser = userDAO.checkUser(userid, encrypPassword);
            Integer id = 0;
            String code = null;
            if (noofuser > 0) {
                session.setAttribute("userId", userid);
                List<OrgDetails> list = userDAO.orglist(null);
                for (OrgDetails org : list) {
                    id = org.getSno();
                    code = org.getOrgCode();

                }
                String userId = session.getAttribute("userId").toString();
                String orgCode = id + "-" + code;
                String orgCode1[] = orgCode.split("-");
                ArrayList validuser = (ArrayList) userDAO.userlist(orgCode1[0], userId);
                for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
                    session.setAttribute("userDept", iter.next().getDepartmentName());
                }
                for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
                    session.setAttribute("userDiv", iter.next().getOrgName());
                }
                for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
                    session.setAttribute("userRole", iter.next().getRoleName());
                }
                for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
                    session.setAttribute("userFName", iter.next().getUserFName());
                }
                for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
                    session.setAttribute("userLName", iter.next().getUserLName());
                }
                session.setAttribute("orgId", orgCode1[0]);
                session.setAttribute("orgCode", orgCode1[1]);
                String roleName = session.getAttribute("userRole").toString();
//                ModelMap modelMap = new ModelMap();
                map.addAttribute("orglist", userDAO.orglist(null));
                if (frdate != null && todate != null) {
                    session.setAttribute("frdate", frdate);
                    session.setAttribute("todate", todate);
                } else {
                    session.setAttribute("frdate", "frdate");
                    session.setAttribute("todate", "todate");
                }
                map.addAttribute("deptlists", userDAO.permmenu(orgCode1[0], roleName, "dept"));
                //modelMap.addAttribute("contraExp", userDAO.contralist(null));
                map.addAttribute("roleName", roleName);
                map.addAttribute("userId", userId);
                return new ModelAndView("../dashboard/managerDashboard", map);
            } else {
                map.addAttribute("failmsg", "* UserName Or Password Invalid ...");
                return new ModelAndView("login", map);
            }
        }

    }
//     @RequestMapping("/login/fdashboard.htm")
//    public ModelAndView ToDashBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        HttpSession session = request.getSession(true);
//        ModelMap map = new ModelMap();
//        String userid = request.getRemoteUser();
////        String password = request.getParameter("password");
////        Md5 md5 = new Md5();
////        String encrypPassword = md5.encrypt(password);
//        Integer noofuser = 0;
//        if ("".equals(userid) || userid == null) {
//            map.addAttribute("failmsg", "* Login failed please try again...");
//            return new ModelAndView("sample", map);
//        } else {
//            noofuser = userDAO.checkUser1(userid);
//            Integer id = 0;
//            String code = null;
//            if (noofuser > 0) {
//                session.setAttribute("userId", userid);
//                List<OrgDetails> list = userDAO.orglist(null);
//                for (OrgDetails org : list) {
//                    id = org.getSno();
//                    code = org.getOrgCode();
//
//                }
//                String userId = session.getAttribute("userId").toString();
//                String orgCode = id + "-" + code;
//                String orgCode1[] = orgCode.split("-");
//                ArrayList validuser = (ArrayList) userDAO.userlist(orgCode1[0], userId);
//                for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
//                    session.setAttribute("userDept", iter.next().getDepartmentName());
//                }
//                for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
//                    session.setAttribute("userDiv", iter.next().getOrgName());
//                }
//                for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
//                    session.setAttribute("userRole", iter.next().getRoleName());
//                }
//                for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
//                    session.setAttribute("userFName", iter.next().getUserFName());
//                }
//                for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
//                    session.setAttribute("userLName", iter.next().getUserLName());
//                }
//                session.setAttribute("orgId", orgCode1[0]);
//                session.setAttribute("orgCode", orgCode1[1]);
//                String roleName = session.getAttribute("userRole").toString();
////                ModelMap modelMap = new ModelMap();
//                map.addAttribute("orglist", userDAO.orglist(null));
//                map.addAttribute("deptlists", userDAO.permmenu(orgCode1[0], roleName, "dept"));
//                //modelMap.addAttribute("contraExp", userDAO.contralist(null));
//                map.addAttribute("userId", userId);
//                return new ModelAndView("dashboard", map);
//            } else {
//                map.addAttribute("failmsg", "* Login failed please try again...");
//                return new ModelAndView("sample", map);
//            }
//        }
//
//    }
//**************menu******************//

    @RequestMapping("/login/menu.htm")
    public ModelAndView menuPage(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(false);
        String userId = session.getAttribute("userId").toString();
        String deptName = session.getAttribute("userDept").toString();
        String userDiv = session.getAttribute("userDiv").toString();
        String roleName = session.getAttribute("userRole").toString();
        String orgCode = session.getAttribute("orgCode").toString();
        String orgId = session.getAttribute("orgId").toString();
        String userFName = session.getAttribute("userFName").toString();
        String userLName = session.getAttribute("userLName").toString();
        String userName = userFName + userLName;
        ArrayList validuser = (ArrayList) tenantDetailsDAO.gettenantCodewithlogin(userId);
        String tenantcode = null;
        if (!(validuser.isEmpty())) {
            for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
                tenantcode = iter.next();
            }
        }
//        List<RolePermission> deptlist = new ArrayList<RolePermission>();
//        List<RolePermission> deptlistOrder = new ArrayList<RolePermission>();
//        List<String> deptlist1 = new ArrayList<String>();
//        deptlist1.add("Masters");
//        deptlist1.add("User Management");
//        deptlist1.add("Property Management");
//        deptlist1.add("Asset Maintenance");
//        deptlist1.add("Contract Management");
//        deptlist1.add("Tenant Management");
//        deptlist1.add("Finance & Accounting");
//        deptlist1.add("Purchase Management");
//        deptlist1.add("Inventory Management");
//        deptlist1.add("Correspondence Management");
//        deptlist1.add("Reports");
//        deptlist = userDAO.permmenu(orgId, roleName, "dept");
//        for (String dept : deptlist1) {
//            for (Iterator<RolePermission> it = deptlist.iterator(); it.hasNext();) {
//                RolePermission dept1 = it.next();
//                if (dept.equals(dept1)) {
//                    deptlistOrder.add(dept1);
//                }
//            }
//        }
//        for (RolePermission deptorder : deptlistOrder) {
//            System.out.println("Department Name = "+deptorder.getDepartmentName());
//        }

        ModelMap map = new ModelMap();
        map.addAttribute("roleName", roleName);
        map.addAttribute("orgCode", orgCode);
        map.addAttribute("userId", userId);
        map.addAttribute("deptName", deptName);
        map.addAttribute("userDiv", userDiv);
        map.addAttribute("userFName", userFName);
        map.addAttribute("userLName", userLName);
//        map.addAttribute("deptlist", deptlistOrder);
        map.addAttribute("deptlist", userDAO.permmenu(orgId, roleName, "dept"));
        map.addAttribute("permlist", userDAO.permmenu(orgId, roleName, "menu"));
        map.addAttribute("assets", dashboarddao.AssetManagement("assets", orgId));
        map.addAttribute("accessories", dashboarddao.AssetManagement("accessories", orgId));
        map.addAttribute("tenants", dashboarddao.tenantManagementN("tenants", orgId, roleName, null));
        map.addAttribute("tenant", dashboarddao.tenantManagementN("tenant", orgId, roleName, userId));
        map.addAttribute("service", dashboarddao.tenantManagementN("service", orgId, roleName, userId));
        map.addAttribute("utility", dashboarddao.utilityManagementN("utility", orgId, roleName, tenantcode));
        map.addAttribute("vacant", dashboarddao.AssetManagement("vacant", orgId));
        map.addAttribute("pdc", dashboarddao.utilityManagementN("pdc", orgId, roleName, tenantcode));
        map.addAttribute("pdc1", dashboarddao.tenantManagementN("pdc1", orgId, roleName, userId));
        map.addAttribute("cdc", dashboarddao.utilityManagementN("cdc", orgId, roleName, tenantcode));
        map.addAttribute("cash", dashboarddao.utilityManagementN("cash", orgId, roleName, tenantcode));
        map.addAttribute("pdcDues", dashboarddao.utilityManagementN("pdcDues", orgId, roleName, tenantcode));
        map.addAttribute("cdcDues", dashboarddao.utilityManagementN("cdcDues", orgId, roleName, tenantcode));
        map.addAttribute("cashdues", dashboarddao.utilityManagementN("cashdues", orgId, roleName, tenantcode));
        map.addAttribute("contract", dashboarddao.tenantManagementN("contract", orgId, roleName, null));
        map.addAttribute("vacate", dashboarddao.tenantManagementN("vacate", orgId, roleName, null));
        map.addAttribute("poprder", dashboarddao.tenantManagementN("poprder", orgId, roleName, null));
        map.addAttribute("defaultRent", dashboarddao.defaultRentPayment());
        /*map.addAttribute("vacant", dashboarddao.AssetManagement("vacant", orgId));
         map.addAttribute("req", dashboarddao.AssetManagement("req", orgId));
         map.addAttribute("poprder", dashboarddao.AssetManagement("poprder", orgId));
         map.addAttribute("cont", dashboarddao.contract("cont", orgId));
         map.addAttribute("insurance", dashboarddao.contract("insurance", orgId));
         map.addAttribute("expcnt", dashboarddao.contract("expcnt", orgId));
         map.addAttribute("rejcnt", dashboarddao.contract("rejcnt", orgId));
         map.addAttribute("renew", dashboarddao.contract("renew", orgId));
         map.addAttribute("tobapprove", dashboarddao.contract("tobapprove", orgId));
         map.addAttribute("tenants", dashboarddao.tenantManagementN("tenants", orgId));
         map.addAttribute("service", dashboarddao.tenantManagement("service", orgId));
         map.addAttribute("mati", dashboarddao.tenantManagement("mati", orgId));
         map.addAttribute("rentdue", dashboarddao.tenantManagement("rentdue", orgId));
         map.addAttribute("servdue", dashboarddao.tenantManagement("servdue", orgId));
         map.addAttribute("advdue", dashboarddao.tenantManagement("advdue", orgId));
         map.addAttribute("tlead", dashboarddao.followUp(null, orgId));
         map.addAttribute("followup", dashboarddao.followUp("lead", orgId));
         map.addAttribute("rentquote", dashboarddao.Customer("rentquote", orgId));
         map.addAttribute("complaint", dashboarddao.Customer("complaint", orgId));
         map.addAttribute("feedback", dashboarddao.Customer("feedback", orgId));
         map.addAttribute("vacate", dashboarddao.Customer("vacate", orgId));
         map.addAttribute("campaign", dashboarddao.Customer("campaign", orgId));*/
//        SELECT t.tenant_code,t.tenant_fname,t.tenant_lname,
//t.asset_name,t.billing_cycle,t.due_date,t.total_amount,
//DATE_ADD(t.due_date, INTERVAL 5 DAY) FROM arete_tms.tenant_details t
//where DATE_ADD(t.due_date, INTERVAL 5 DAY)=curdate();
        return new ModelAndView("menu", map);
    }
//**************header******************//

    @RequestMapping("/login/headerlink.htm")
    public ModelAndView header(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);
        String roleName = session.getAttribute("userRole").toString();
        String orgId = session.getAttribute("orgId").toString();
        String submodule = request.getParameter("submodule");
        ModelMap map = new ModelMap();
        map.addAttribute("tab", request.getParameter("tab"));
        map.addAttribute("pagetype", request.getParameter("pagetype"));
        map.addAttribute("tablist", userDAO.permmenu(orgId, roleName, submodule));
        return new ModelAndView("../org/tabheader", map);
    }
//**************dashboard******************//

    @RequestMapping("/login/dashboard.htm")
    public ModelAndView redirectToDashBoardUP(HttpServletRequest request, HttpServletResponse response) throws ParseException {
        HttpSession session = request.getSession(false);

        String userId = session.getAttribute("userId").toString();
        //String userRole = session.getAttribute("userRole").toString();
        Date fdate = null;
        Date tdate = null;
        String fromdate = "";
        String todates = "";
        String orgCode = request.getParameter("orgCode");
        String frdate = request.getParameter("Frdate");
        String todate = request.getParameter("todate");
        //newly added by lakshmi
        //String propName = request.getParameter("propName");

        if (frdate != "frdate" && frdate != null && todate != "todate" && todate != null) {
            fdate = formatter.parse(frdate);
            tdate = formatter.parse(todate);

            fromdate = sdf.format(fdate);
            todates = sdf.format(tdate);
        }
        if (frdate != null && todate != null) {
            userId = request.getParameter("userId");
            orgCode = request.getParameter("orgCode");
        }
        String orgCode1[] = orgCode.split("-");
        ArrayList validuser = (ArrayList) userDAO.userlist(orgCode1[0], userId);
        for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
            session.setAttribute("userDept", iter.next().getDepartmentName());
        }
        for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
            session.setAttribute("userDiv", iter.next().getOrgName());
        }
        for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
            session.setAttribute("userRole", iter.next().getRoleName());
        }
        for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
            session.setAttribute("userFName", iter.next().getUserFName());
        }
        for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
            session.setAttribute("userLName", iter.next().getUserLName());
        }
        session.setAttribute("orgId", orgCode1[0]);
        session.setAttribute("orgCode", orgCode1[1]);
        String roleName = session.getAttribute("userRole").toString();
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("orglist", userDAO.orglist(null));

        if (frdate != null && todate != null) {

            session.setAttribute("frdate", fromdate);
            session.setAttribute("todate", todates);
            //newly added by lakshmi
            //session.setAttribute("propName", propName);
        } else {
            session.setAttribute("frdate", "frdate");
            session.setAttribute("todate", "todate");
            //newly added by lakshmi
            // session.setAttribute("propName", "propName");
        }
        modelMap.addAttribute("deptlists", userDAO.permmenu(orgCode1[0], roleName, "dept"));
        //modelMap.addAttribute("contraExp", userDAO.contralist(null));
        modelMap.addAttribute("roleName", roleName);
        modelMap.addAttribute("userId", userId);
        return new ModelAndView("dashboard", modelMap);

    }

    //**************dashboard******************//
//newly added by lakshmi
    @RequestMapping("/login/occupencyDashboard.htm")

    public ModelAndView occupencyDashboard(HttpServletRequest request, HttpServletResponse response) throws ParseException {
        HttpSession session = request.getSession(false);

        String userId = session.getAttribute("userId").toString();
        //String userRole = session.getAttribute("userRole").toString();
        Date fdate = null;
        Date tdate = null;
        String fromdate = "";
        String todates = "";
        String orgCode = request.getParameter("orgCode");
        String frdate = request.getParameter("Frdate");
        String todate = request.getParameter("todate");
        //newly added by lakshmi
        String propName = request.getParameter("propName");
        List<String> propNames = dashboarddao.propNames("propNames", orgCode);
        if (frdate != "frdate" && frdate != null && todate != "todate" && todate != null) {
            fdate = formatter.parse(frdate);
            tdate = formatter.parse(todate);

            fromdate = sdf.format(fdate);
            todates = sdf.format(tdate);
        }
        if (frdate != null && todate != null) {
            userId = request.getParameter("userId");
            orgCode = request.getParameter("orgCode");
        }
        String orgCode1[] = orgCode.split("-");
        ArrayList validuser = (ArrayList) userDAO.userlist(orgCode1[0], userId);
        for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
            session.setAttribute("userDept", iter.next().getDepartmentName());
        }
        for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
            session.setAttribute("userDiv", iter.next().getOrgName());
        }
        for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
            session.setAttribute("userRole", iter.next().getRoleName());
        }
        for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
            session.setAttribute("userFName", iter.next().getUserFName());
        }
        for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
            session.setAttribute("userLName", iter.next().getUserLName());
        }
        session.setAttribute("orgId", orgCode1[0]);
        session.setAttribute("orgCode", orgCode1[1]);
        String roleName = session.getAttribute("userRole").toString();
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("orglist", userDAO.orglist(null));

        if (frdate != null && todate != null & propName != null) {

            session.setAttribute("frdate", fromdate);
            session.setAttribute("todate", todates);
            //newly added by lakshmi
            session.setAttribute("propName", propName);
        } else {
            session.setAttribute("frdate", "frdate");
            session.setAttribute("todate", "todate");
            //newly added by lakshmi
            session.setAttribute("propName", "");
        }
        modelMap.addAttribute("deptlists", userDAO.permmenu(orgCode1[0], roleName, "dept"));
        //modelMap.addAttribute("contraExp", userDAO.contralist(null));
        modelMap.addAttribute("roleName", roleName);
        modelMap.addAttribute("propNames", propNames);
        modelMap.addAttribute("userId", userId);
        return new ModelAndView("occupencyDashboard", modelMap);

    }

    //-----------------------------Organisation Group-------------------------------------
//**************Organisation group form list******************//
    @RequestMapping("/login/grouplist.htm")
    public ModelAndView grouplist(HttpServletRequest request, HttpServletResponse response) {
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("grouplist", userDAO.grouplist(null));
        return new ModelAndView("../org/grouplist", modelMap);
    }
//**************Organisation group form******************//

    @RequestMapping("/login/groupform.htm")
    public ModelAndView groupform(HttpServletRequest request, HttpServletResponse response) {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("grouplist", userDAO.grouplist(Integer.parseInt(sno)));
        }
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../org/groupform", modelMap);
    }
//**************Organisation group form submit******************//

    @RequestMapping("/login/groupsubmit.htm")
    public ModelAndView groupSubmit(HttpServletRequest request, HttpServletResponse response) {
        String pk = request.getParameter("pk");
        String groupCode = request.getParameter("groupCode");
        String groupName = request.getParameter("groupName");
        String description = request.getParameter("description");
        String address = request.getParameter("address");
        String status = request.getParameter("status");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        if (pk == null) {
            OrgGroup group = new OrgGroup(groupCode, groupName, description, address, "update0", timestamp);
            userDAO.save(group);
        } else {
            OrgGroup group = new OrgGroup(Integer.parseInt(pk), groupCode, groupName, description, address, "update0", timestamp);
            userDAO.save(group);
        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("grouplist", userDAO.grouplist(null));
        return new ModelAndView("../org/grouplist", modelMap);
    }

    //-----------------------------Sub-Org Group-------------------------------------
//**************Sub-Organisation list******************//
    @RequestMapping("/login/subgrouplist.htm")
    public ModelAndView subgrouplist(HttpServletRequest request, HttpServletResponse response) {
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("grouplist", userDAO.grouplist(null));
        modelMap.addAttribute("subgrouplist", userDAO.subgrouplist(null));
        return new ModelAndView("../org/subgrouplist", modelMap);
    }
//**************Sub-Organisation form******************//

    @RequestMapping("/login/subgroupform.htm")
    public ModelAndView subgroupform(HttpServletRequest request, HttpServletResponse response) {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("subgrouplist", userDAO.subgrouplist(Integer.parseInt(sno)));
        }
        modelMap.addAttribute("grouplist", userDAO.grouplist(null));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../org/subgroupform", modelMap);
    }
//**************Sub-Organisation form submit******************//

    @RequestMapping("/login/subgroupsubmit.htm")
    public ModelAndView subgroupSubmit(HttpServletRequest request, HttpServletResponse response) {
        String pk = request.getParameter("pk");
        String groupCode = request.getParameter("groupCode");
        String suborgCode = request.getParameter("suborgCode");
        String subgorgName = request.getParameter("subgorgName");
        String description = request.getParameter("description");
        String address = request.getParameter("address");
        String status = request.getParameter("status");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        if (pk == null) {
            SuborgGroup sogroup = new SuborgGroup(suborgCode, subgorgName, description, address, groupCode, "update0", timestamp);
            userDAO.save(sogroup);
        } else {
            SuborgGroup sogroup = new SuborgGroup(Integer.parseInt(pk), suborgCode, subgorgName, description, address, groupCode, "update0", timestamp);
            userDAO.save(sogroup);
        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("grouplist", userDAO.grouplist(null));
        modelMap.addAttribute("subgrouplist", userDAO.subgrouplist(null));
        return new ModelAndView("../org/subgrouplist", modelMap);
    }

    //-----------------------------Organisation Details-------------------------------------
    //**************Organisation list******************//
    @RequestMapping("/login/orglist.htm")
    public ModelAndView orglist(HttpServletRequest request, HttpServletResponse response) {
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("subgrouplist", userDAO.subgrouplist(null));
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        modelMap.addAttribute("grouplist", userDAO.grouplist(null));
        return new ModelAndView("../org/orgdetailslist", modelMap);
    }
//**************Organisation form******************//

    @RequestMapping("/login/orgform.htm")
    public ModelAndView orgform(HttpServletRequest request, HttpServletResponse response) {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("orglist", userDAO.orglist(Integer.parseInt(sno)));
        }
        modelMap.addAttribute("subgrouplist", userDAO.subgrouplist(null));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../org/orgdetailsform", modelMap);
    }
//**************Organisation form submit******************//

    @RequestMapping("/login/orgsubmit.htm")
    public ModelAndView orgsubmit(HttpServletRequest request, HttpServletResponse response) throws ParseException {
        String pk = request.getParameter("pk");
        String suborgCode = request.getParameter("suborgCode");
        String orgcode = request.getParameter("orgcode");
        String orgname = request.getParameter("orgname");
        String orgCrNo = request.getParameter("orgCrNo");
        String status = request.getParameter("status");
        String orgregDate = request.getParameter("orgregDate");
        String orgType = request.getParameter("orgType");
        String orgAddress = request.getParameter("orgAddress");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String pinCode = request.getParameter("pinCode");
        String country = request.getParameter("country");
        String phoneNumber = request.getParameter("phoneNumber");
        String fax = request.getParameter("fax");
        String webSite = request.getParameter("webSite");
        String orgEmail = request.getParameter("orgEmail");
        String bankName = request.getParameter("bankName");
        String accountNumber = request.getParameter("accountNumber");
        String ifscCode = request.getParameter("ifscCode");
        String branchName = request.getParameter("branchName");
        String address = request.getParameter("address");
        String contactNumber = request.getParameter("contactNumber");
        String emailId = request.getParameter("emailId");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        Date orgregDate1 = null;
        if (!orgregDate.equals("")) {
            orgregDate1 = (Date) formatter.parse(orgregDate);
        }

        if (pk == null) {
            OrgDetails orgdetails = new OrgDetails(orgcode, orgname, orgCrNo, orgregDate1, orgType, orgAddress, city, state, pinCode, country, phoneNumber, fax, webSite, orgEmail, bankName, accountNumber, ifscCode, branchName, address, contactNumber, emailId, "", "update0", timestamp);
            userDAO.save(orgdetails);
        } else {
            OrgDetails orgdetails = new OrgDetails(Integer.parseInt(pk), orgcode, orgname, orgCrNo, orgregDate1, orgType, orgAddress, city, state, pinCode, country, phoneNumber, fax, webSite, orgEmail, bankName, accountNumber, ifscCode, branchName, address, contactNumber, emailId, "", "update0", timestamp);
            userDAO.save(orgdetails);
        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("subgrouplist", userDAO.subgrouplist(null));
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        modelMap.addAttribute("grouplist", userDAO.grouplist(null));
        return new ModelAndView("../org/orgdetailslist", modelMap);
    }

    //-----------------------------Department-------------------------------------
    //**************department list******************//
    @RequestMapping("/login/deptlist.htm")
    public ModelAndView departmentlist(HttpServletRequest request, HttpServletResponse response) {
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        modelMap.addAttribute("deptlist", userDAO.departmentlist(null));
        return new ModelAndView("../org/departmentlist", modelMap);
    }
//**************department form******************//

    @RequestMapping("/login/deptform.htm")
    public ModelAndView departmentform(HttpServletRequest request, HttpServletResponse response) {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("deptlist", userDAO.departmentlist(Integer.parseInt(sno)));
        }
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../org/departmentform", modelMap);
    }
//**************department form submit******************//

    @RequestMapping("/login/deptsubmit.htm")
    public ModelAndView departmentsubmit(HttpServletRequest request, HttpServletResponse response) {
        String pk = request.getParameter("pk");
        String orgcode = request.getParameter("orgcode");
        String deptcode = request.getParameter("deptname");
        String deptname = request.getParameter("deptname");
        String status = request.getParameter("status");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        if (pk == null) {
            Department dept = new Department(deptcode, deptname, orgcode, "update0", timestamp);
            userDAO.save(dept);
        } else {

        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        modelMap.addAttribute("deptlist", userDAO.departmentlist(null));
        return new ModelAndView("../org/departmentlist", modelMap);
    }

    //-----------------------------Department Role-------------------------------------
//**************department role list******************//
    @RequestMapping("/login/rolelist.htm")
    public ModelAndView rolelist(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        modelMap.addAttribute("deptlist", userDAO.departmentlist(null));
        modelMap.addAttribute("rolelist", userDAO.rolelist(null));
        return new ModelAndView("../org/rolelist", modelMap);
    }
//**************department role form******************//

    @RequestMapping("/login/roleform.htm")
    public ModelAndView roleform(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("rolelist", userDAO.rolelist(Integer.parseInt(sno)));
        }
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        modelMap.addAttribute("deptlist", userDAO.departmentlist(null));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../org/roleform", modelMap);
    }
//**************department role form submit******************//

    @RequestMapping("/login/rolesubmit.htm")
    public ModelAndView rolesubmit(HttpServletRequest request, HttpServletResponse response) {
        String pk = request.getParameter("pk");
        String deptCode = request.getParameter("deptCode");
        String rolecode = request.getParameter("rolecode");
        String rolename = request.getParameter("rolename");
        String description = request.getParameter("description");
        String status = request.getParameter("status");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        if (pk == null) {
            DepartmentRole role = new DepartmentRole(rolecode, rolename, description, deptCode, "update0", timestamp);
            userDAO.save(role);
        } else {

        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        modelMap.addAttribute("deptlist", userDAO.departmentlist(null));
        modelMap.addAttribute("rolelist", userDAO.rolelist(null));
        return new ModelAndView("../org/rolelist", modelMap);
    }

    //-----------------------------Department Module-------------------------------------
    //**************department module list******************//
    @RequestMapping("/login/modulelist.htm")
    public ModelAndView modulelist(HttpServletRequest request, HttpServletResponse response) {
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        modelMap.addAttribute("modulelist", userDAO.modulelist("1"));
        return new ModelAndView("../org/modulelist", modelMap);
    }
//**************department module form******************//

    @RequestMapping("/login/moduleform.htm")
    public ModelAndView moduleform(HttpServletRequest request, HttpServletResponse response) {
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("modulelist", userDAO.modulelist("1"));
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        modelMap.addAttribute("deptlist", userDAO.departmentlist(null));
        modelMap.addAttribute("rolelist", userDAO.rolelist(null));
        return new ModelAndView("../org/moduleform", modelMap);
    }
//**************department module form submit******************//

    @RequestMapping("/login/modulesubmit.htm")
    public ModelAndView modulesubmit(HttpServletRequest request, HttpServletResponse response) {
        String pk = request.getParameter("pk");
        String departmentCode = request.getParameter("departmentCode");
        String dept[] = departmentCode.split("-");
        String orgCode = request.getParameter("orgCode");
        String orgCode1[] = orgCode.split("-");
        String submoduleName = request.getParameter("submoduleName");
        String tabName = request.getParameter("tabName");
        String listLink = request.getParameter("listLink");
        String formLink = request.getParameter("formLink");
        String status = request.getParameter("status");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        if (pk == null) {
            DepartmentModule mod = new DepartmentModule(dept[0], orgCode1[0], dept[1], submoduleName, tabName, listLink, formLink, "update0", timestamp);
            userDAO.save(mod);
        } else {

        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        modelMap.addAttribute("modulelist", userDAO.modulelist("1"));
        return new ModelAndView("../org/modulelist", modelMap);
    }

    //-----------------------------Role Permission-------------------------------------
    //**************role permission list******************//
    @RequestMapping("/login/permissionlist.htm")
    public ModelAndView permissionlist(HttpServletRequest request, HttpServletResponse response) {
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        modelMap.addAttribute("permlist", userDAO.permlist("1", null));
        return new ModelAndView("../org/permissionlist", modelMap);
    }
//**************role permission form******************//

    @RequestMapping("/login/permissionform.htm")
    public ModelAndView permissionform(HttpServletRequest request, HttpServletResponse response) {
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("modulelist", userDAO.modulelist("1"));
        modelMap.addAttribute("modulelist1", userDAO.modulelist1("1"));
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        modelMap.addAttribute("deptlist", userDAO.departmentlist(null));
        modelMap.addAttribute("rolelist", userDAO.rolelist(null));
        return new ModelAndView("../org/rolepermission", modelMap);
    }
//**************role permission edit form******************//

    @RequestMapping("/login/permissionedit.htm")
    public ModelAndView permissionedit(HttpServletRequest request, HttpServletResponse response) {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = request.getParameter("roleName");
        modelMap.addAttribute("modulelist", userDAO.modulelist("1"));
        modelMap.addAttribute("modulelist1", userDAO.modulelist1("1"));
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        modelMap.addAttribute("deptlist", userDAO.departmentlist(null));
        modelMap.addAttribute("rolelist", userDAO.rolelist(null));
        modelMap.addAttribute("permlist", userDAO.permlist("1", roleName));
        modelMap.addAttribute("userId", userId);
        return new ModelAndView("../org/permissionedit", modelMap);
    }
//**************role permission form submit******************//

    @RequestMapping("/login/permissionsubmit.htm")
    public ModelAndView permissionsubmit(HttpServletRequest request, HttpServletResponse response) {
        String pk = request.getParameter("pk");
        String orgCode = request.getParameter("orgCode");
        String orgCode1[] = orgCode.split("-");
        String departmentCode = request.getParameter("departmentCode");
        String dept[] = departmentCode.split("-");
        String roleName = request.getParameter("roleName");
        String tabName[] = request.getParameterValues("tabName");
        String tab[];
        String status = request.getParameter("status");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        List<RolePermission> gridData = new ArrayList<RolePermission>();
        //System.out.println(tabName.length+"tablength");
        for (int m = 0; m < tabName.length; m++) {
            tab = tabName[m].split("%");
            String Add = request.getParameter("Add" + tab[2]);
            String Edit = request.getParameter("Edit" + tab[2]);
            String Delete = request.getParameter("Delete" + tab[2]);
            String Review = request.getParameter("Review" + tab[2]);
            String Approve = request.getParameter("Approve" + tab[2]);
            if (Add == null || "".equals(Add)) {
                Add = "n";
            }
            if (Edit == null || "".equals(Edit)) {
                Edit = "n";
            }
            if (Delete == null || "".equals(Delete)) {
                Delete = "n";
            }
            if (Review == null || "".equals(Review)) {
                Review = "n";
            }
            if (Approve == null || "".equals(Approve)) {
                Approve = "n";
            }
            RolePermission perm = new RolePermission(orgCode1[0], tab[0], roleName, tab[1], tab[2], Add, Edit, Delete, Approve, Review, "update0", timestamp, tab[3]);
            gridData.add(perm);
        }
        userDAO.delPerm(roleName);
        userDAO.saveRole(gridData);
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        modelMap.addAttribute("permlist", userDAO.permlist("1", null));
        return new ModelAndView("../org/permissionlist", modelMap);
    }

    //-----------------------------User Registration-------------------------------------
    //**************user details list******************//
    @RequestMapping("/login/userlist.htm")
    public ModelAndView userlist(HttpServletRequest request, HttpServletResponse response) {
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("userlist", userDAO.userlist("1", null));
        return new ModelAndView("../org/userlist", modelMap);
    }
//**************user details form******************//

    @RequestMapping("/login/userform.htm")
    public ModelAndView userform(HttpServletRequest request, HttpServletResponse response) {
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        modelMap.addAttribute("deptlist", userDAO.departmentlist(null));
        modelMap.addAttribute("rolelist", userDAO.rolelist(null));
        return new ModelAndView("../org/userform", modelMap);
    }
//**************user details form submit******************//

    @RequestMapping("/login/userformEdit.htm")
    public ModelAndView userformEdit(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sno = request.getParameter("pk");
        String orgName = request.getParameter("orgName");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("orglist", userDAO.orglist(null));
            modelMap.addAttribute("deptlist", userDAO.departmentlist1(orgName));
            modelMap.addAttribute("rolelist", userDAO.rolelist(null));
            modelMap.addAttribute("userlist", userDAO.userlist1(Integer.parseInt(sno)));
            ArrayList validuser = (ArrayList) userDAO.getPassword(sno);
            String paswd = null;
            if (validuser != null) {
                for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
                    paswd = iter.next().getPassword();
                }
            }
            Md5 td = new Md5();
            String password = td.decrypt(paswd);
            modelMap.addAttribute("password", password);
        }

        return new ModelAndView("../org/userformEdit", modelMap);
    }
//**************user details submit******************//

    @RequestMapping("/login/usersubmit.htm")
    public ModelAndView usersubmit(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String pk = request.getParameter("pk");
        String orgName = request.getParameter("orgName");
        String orgCode1[] = orgName.split("-");
        String deptCode = request.getParameter("deptCode");
        String dept[] = deptCode.split("-");
        String roleName = request.getParameter("roleName");
        String userId = request.getParameter("userId");
        String userFName = request.getParameter("userFName");
        String userLName = request.getParameter("userLName");
        String password = request.getParameter("password");
        String passwordExpiry = request.getParameter("passwordExpiry");
        String status = request.getParameter("status");
        String email = request.getParameter("email");
        String mobilenumber = request.getParameter("mobilenumber");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        Md5 md5 = new Md5();
        String usrpassword = md5.encrypt(password);
        if (pk == null || pk == "" || pk.equals("")) {
            UserRegistration user = new UserRegistration(Integer.parseInt(orgCode1[1]), orgCode1[0], dept[1], roleName, userId, userFName,
                    userLName, usrpassword, "update0", email, timestamp, mobilenumber);
            userDAO.save(user);
        } else {
            UserRegistration user = new UserRegistration(Integer.parseInt(pk), Integer.parseInt(orgCode1[1]), orgCode1[0], deptCode,
                    roleName, userId, userFName, userLName, usrpassword, "update0", email, timestamp, mobilenumber);
            userDAO.save(user);
        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("userlist", userDAO.userlist("1", null));
        return new ModelAndView(new RedirectView("../login/userlist.htm"), modelMap);
    }
//**************user details edit******************//

    @RequestMapping("/login/useredit.htm")
    public ModelAndView useredit(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        modelMap.addAttribute("deptlist", userDAO.departmentlist(null));
        modelMap.addAttribute("rolelist", userDAO.rolelist(null));
        String sno = request.getParameter("pk");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("userlist", userDAO.userlist1(Integer.parseInt(sno)));
            ArrayList validuser = (ArrayList) userDAO.getPassword(sno);
            String paswd = null;
            if (validuser != null) {
                for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
                    paswd = iter.next().getPassword();
                }
            }
            Md5 td = new Md5();
            String password = td.decrypt(paswd);
            modelMap.addAttribute("password", password);
        }

        return new ModelAndView("../org/useredit", modelMap);
    }
//**************change user password******************//

    @RequestMapping("/login/changePassword.htm")
    public ModelAndView changePassword(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = req.getSession();
        String sno = req.getParameter("sno");
        String password = req.getParameter("password");
        Md5 td = new Md5();
        String pwd = td.encrypt(password);
        ModelMap modelMap = new ModelMap();
        userDAO.changePassword(sno, pwd);
        modelMap.addAttribute("userlist", userDAO.userlist("1", null));
        return new ModelAndView("../org/userlist", modelMap);
    }
//**************delete users******************//

    @RequestMapping("/login/userDel.htm")
    public ModelAndView userDel(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sno = request.getParameter("sno");
        userDAO.userDel(Integer.parseInt(sno));
        modelMap.addAttribute("userlist", userDAO.userlist("1", null));
        return new ModelAndView("../org/userlist", modelMap);

    }

    //**************Uniqueness for Userid******************//
    @RequestMapping("/login/uniqueUserid.htm")
    public void uniqueUserid(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String userId = req.getParameter("userId");
        userDAO.uniqueUserid(req, res, userId);
    }

    //----------------Testing Dynamic Label In Test Form---------------------//
    @RequestMapping("/login/testform.htm")
    public ModelAndView testform(HttpServletRequest request, HttpServletResponse response) {
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        modelMap.addAttribute("userlist", userDAO.userlist("1", null));
        String sNo = request.getParameter("sNo");
        String link = "../login/testform.htm";
        String tab = "Test";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));//To Make dynamic field availability//
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../org/testform", modelMap);
    }

    //------------Test Form END---------------------------------------//
    @RequestMapping("/login/testlist.htm")
    public ModelAndView testlist(HttpServletRequest request, HttpServletResponse response) {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(false);
        String userId = session.getAttribute("userId").toString();
        String tabName = "Test";
        String submoduleName = "User Role";
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        return new ModelAndView("../org/testlist", modelMap);
    }
    //------------Test List END---------------------------------------//

    //**************workflow form ******************//
    @RequestMapping("/login/workflowList.htm")
    public ModelAndView workflowList(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        modelMap.addAttribute("wrklist", userDAO.workflowGrouplist(orgId, userId, null));
        return new ModelAndView("../org/workflowList", modelMap);
    }

    //**************workflow list ******************//
    @RequestMapping("/login/workflowForm.htm")
    public ModelAndView workflowForm(HttpServletRequest request, HttpServletResponse response) {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String orgId = session.getAttribute("orgId").toString();
        modelMap.addAttribute("submodulelist", userDAO.submodulelist(orgId));
        modelMap.addAttribute("roleMastlist", userDAO.list(null, orgId, null, "DepartmentRole"));
//        modelMap.addAttribute("districtList", scmServiceIMPL.list(null, orgId, null, "DistrictMaster"));
        String sno = request.getParameter("pk");
//        modelMap.addAttribute("userlist", userDAO.userlist(null, null));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../org/workflowForm", modelMap);
    }

    //**************workflow form submit******************//
    @RequestMapping("/login/workflowSubmit.htm")
    public ModelAndView workflowSubmit(HttpServletRequest request, HttpServletResponse response) {

        java.util.Date newdate = new java.util.Date();
        long t = newdate.getTime();
        java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(t);
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);

        String createdId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sno[] = request.getParameterValues("SNo");

        String submodulename[] = request.getParameterValues("submodulename");
        String tabname[] = request.getParameterValues("tabname");
        String Role[] = request.getParameterValues("Role");
        String userName[] = request.getParameterValues("user");
        String level[] = request.getParameterValues("level");
        String userId[] = request.getParameterValues("userId");

        String tarNo = request.getParameter("txno");

        List<Workflow> wrklist = new ArrayList<Workflow>();

        userDAO.delWrkTxn(null, null, tarNo);

        Integer txno = userDAO.gettaxNo();
        for (int i = 0; i < level.length; i++) {
            Workflow wrk = new Workflow();
//            if (sno[i] == null || sno[i].equals("")) {

            wrk.setOrgId(orgId);
            wrk.setUserId(userId[i]);
            wrk.setSubmodulename(submodulename[i]);
            wrk.setTabname(tabname[i]);
            wrk.setRole(Role[i]);
            wrk.setLevel(level[i]);
            wrk.setCreatedId(createdId);
            wrk.setCreationDate(sqlTimestamp);
            wrk.setLastmodifiedDate(sqlTimestamp);
            wrk.setStatus("update0");
            wrk.setTxn(txno);

            wrklist.add(wrk);

//            }
//            else {
//                wrk = userDAO.getWorkflowbySno(Integer.parseInt(sno[i]));
//                String ustatus = wrk.getStatus();
//                int k = Integer.parseInt(wrk.getStatus().substring(ustatus.length() - 1));
//                k++;
//                ustatus = "update" + k;
//                wrk.setSno(Integer.parseInt(sno[i]));
//                wrk.setOrgId(orgId);
//                wrk.setUserId(userId[i]);
//                wrk.setSubmodulename(submodulename[i]);
//                wrk.setTabname(tabname[i]);
//                wrk.setRole(Role[i]);
//                wrk.setDistrictCode(districtCode[i]);
//                wrk.setDistrictName(districtName[i]);
//                wrk.setLevel(level[i]);
//                wrk.setCreatedId(createdId);
//                wrk.setCreationDate(sqlTimestamp);
//                wrk.setLastmodifiedDate(sqlTimestamp);
//                wrk.setStatus(ustatus);
//                wrk.setTxn(txno);
//
//                wrklist.add(wrk);
//            }
        }
        userDAO.saveWkflw(wrklist);

        return new ModelAndView(new RedirectView("../login/workflowList.htm"), modelMap);
    }

    //**************workflow form edit******************//
    @RequestMapping("/login/workflowEdit.htm")
    public ModelAndView workflowEdit(HttpServletRequest request, HttpServletResponse response) {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String orgId = session.getAttribute("orgId").toString();
        modelMap.addAttribute("submodulelist", userDAO.submodulelist(orgId));
        modelMap.addAttribute("roleMastlist", userDAO.list(null, orgId, null, "DepartmentRole"));
//        modelMap.addAttribute("districtList", scmServiceIMPL.list(null, orgId, null, "DistrictMaster"));
        String sno = request.getParameter("pk");
        String txn = request.getParameter("txn");
        modelMap.addAttribute("wrklist", userDAO.workflowGrouplist(null, null, txn));

        modelMap.addAttribute("userlist", userDAO.userlist(null, null));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../org/workflowEdit", modelMap);
    }

    //**************workflow form edit******************//
    @RequestMapping("/login/workflowView.htm")
    public ModelAndView workflowView(HttpServletRequest request, HttpServletResponse response) {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String orgId = session.getAttribute("orgId").toString();
        modelMap.addAttribute("submodulelist", userDAO.submodulelist(orgId));
        modelMap.addAttribute("roleMastlist", userDAO.list(null, orgId, null, "DepartmentRole"));
//        modelMap.addAttribute("districtList", scmServiceIMPL.list(null, orgId, null, "DistrictMaster"));
        String sno = request.getParameter("pk");
        String txn = request.getParameter("txn");
        modelMap.addAttribute("wrklist", userDAO.workflowGrouplist(null, null, txn));

        modelMap.addAttribute("userlist", userDAO.userlist(null, null));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../org/workflowView", modelMap);
    }

    @RequestMapping("/login/gettab.htm")
    public void gettab(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        HttpSession session = req.getSession(true);
//        String fyear = req.getParameter("fyear");
        String submodname = req.getParameter("submodname");
        userDAO.gettab(req, res, submodname);
    }

    @RequestMapping("/login/getuser.htm")
    public void getuser(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        HttpSession session = req.getSession(true);
        String roleName = req.getParameter("roleName");
        userDAO.getuser(req, res, roleName);
    }

    //**************dashboard******************//
    @RequestMapping("/login/dashboardgraph.htm")
    public ModelAndView redirectToDashBoardgraphUP(HttpServletRequest request, HttpServletResponse response) throws ParseException {
        HttpSession session = request.getSession(false);
        Date fdate = null;
        Date tdate = null;
        String fromdate = "";
        String todates = "";
        String userId = session.getAttribute("userId").toString();
        String orgCode = request.getParameter("orgCode");
        String frdate = request.getParameter("Frdate");
        String todate = request.getParameter("todate");
        if (frdate != "frdate" && frdate != null && todate != "todate" && todate != null) {
            fdate = formatter.parse(frdate);
            tdate = formatter.parse(todate);

            fromdate = sdf.format(fdate);
            todates = sdf.format(tdate);
        }
        if (frdate != null && todate != null) {
            userId = request.getParameter("userId");
            orgCode = request.getParameter("orgCode");
        }
        String orgCode1[] = orgCode.split("-");
        ArrayList validuser = (ArrayList) userDAO.userlist(orgCode1[0], userId);
        for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
            session.setAttribute("userDept", iter.next().getDepartmentName());
        }
        for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
            session.setAttribute("userDiv", iter.next().getOrgName());
        }
        for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
            session.setAttribute("userRole", iter.next().getRoleName());
        }
        for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
            session.setAttribute("userFName", iter.next().getUserFName());
        }
        for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
            session.setAttribute("userLName", iter.next().getUserLName());
        }
        session.setAttribute("orgId", orgCode1[0]);
        session.setAttribute("orgCode", orgCode1[1]);
        String roleName = session.getAttribute("userRole").toString();
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        if (frdate != null && todate != null) {

            session.setAttribute("frdate", fromdate);
            session.setAttribute("todate", todates);
        } else {
            session.setAttribute("frdate", "frdate");
            session.setAttribute("todate", "todate");
        }

        modelMap.addAttribute("deptlists", userDAO.permmenu(orgCode1[0], roleName, "dept"));
        //modelMap.addAttribute("contraExp", userDAO.contralist(null));
        modelMap.addAttribute("toDate", todate);
        modelMap.addAttribute("fromDate", frdate);
        modelMap.addAttribute("userId", userId);
        modelMap.addAttribute("roleName", roleName);
        return new ModelAndView("dashboardgraph", modelMap);

    }

    ///newly added by lakshmi
    //**************dashboard******************//
    @RequestMapping("/login/occupencyDashboardgraph.htm")
    public ModelAndView occupencyDashboardgraph(HttpServletRequest request, HttpServletResponse response) throws ParseException {
        HttpSession session = request.getSession(false);
        Date fdate = null;
        Date tdate = null;
        String fromdate = "";
        String todates = "";
        String userId = session.getAttribute("userId").toString();
        String orgCode = request.getParameter("orgCode");
        String frdate = request.getParameter("Frdate");
        String todate = request.getParameter("todate");
        String propName = request.getParameter("propName");
        List<String> propNames = dashboarddao.propNames("propNames", orgCode);
        if (frdate != "frdate" && frdate != null && todate != "todate" && todate != null) {
            fdate = formatter.parse(frdate);
            tdate = formatter.parse(todate);

            fromdate = sdf.format(fdate);
            todates = sdf.format(tdate);
        }
        if (frdate != null && todate != null) {
            userId = request.getParameter("userId");
            orgCode = request.getParameter("orgCode");
        }
        String orgCode1[] = orgCode.split("-");
        ArrayList validuser = (ArrayList) userDAO.userlist(orgCode1[0], userId);
        for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
            session.setAttribute("userDept", iter.next().getDepartmentName());
        }
        for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
            session.setAttribute("userDiv", iter.next().getOrgName());
        }
        for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
            session.setAttribute("userRole", iter.next().getRoleName());
        }
        for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
            session.setAttribute("userFName", iter.next().getUserFName());
        }
        for (Iterator<UserRegistration> iter = validuser.iterator(); iter.hasNext();) {
            session.setAttribute("userLName", iter.next().getUserLName());
        }
        session.setAttribute("orgId", orgCode1[0]);
        session.setAttribute("orgCode", orgCode1[1]);
        String roleName = session.getAttribute("userRole").toString();
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        if (frdate != null && todate != null) {

            session.setAttribute("frdate", fromdate);
            session.setAttribute("todate", todates);
            session.setAttribute("propName", propName);
        } else {
            session.setAttribute("frdate", "frdate");
            session.setAttribute("todate", "todate");
            session.setAttribute("propName", "");
        }

        modelMap.addAttribute("deptlists", userDAO.permmenu(orgCode1[0], roleName, "dept"));
        //modelMap.addAttribute("contraExp", userDAO.contralist(null));
        modelMap.addAttribute("userId", userId);
        modelMap.addAttribute("propNames", propNames);
        modelMap.addAttribute("roleName", roleName);
        modelMap.addAttribute("frdate", frdate);
        modelMap.addAttribute("todate", todate);
        modelMap.addAttribute("propName", propName);
        return new ModelAndView("occupencyDashboardgraph", modelMap);

    }

    @RequestMapping("/login/faq.htm")
    public ModelAndView redirectToFaq(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);
        String userId = session.getAttribute("userId").toString();
        String orgCode = request.getParameter("orgCode");
        ModelMap modelMap = new ModelMap();
        return new ModelAndView("FAQ", modelMap);

    }

    @RequestMapping("/login/help.htm")
    public ModelAndView redirectToHelp(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);
        String userId = session.getAttribute("userId").toString();
        String orgCode = request.getParameter("orgCode");
        ModelMap modelMap = new ModelMap();
        return new ModelAndView("help", modelMap);

    }

    @RequestMapping("/login/userProfileDetails.htm")
    public ModelAndView userProfileDetails(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);
        String userId = session.getAttribute("userId").toString();
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("userlist", userDAO.userlist2(userId));
        return new ModelAndView("../login/profile", modelMap);

    }

    @RequestMapping("/login/menu1.htm")
    public ModelAndView menu1(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);
        String userId = session.getAttribute("userId").toString();
        String deptName = session.getAttribute("userDept").toString();
        String userDiv = session.getAttribute("userDiv").toString();
        String roleName = session.getAttribute("userRole").toString();
        String orgCode = session.getAttribute("orgCode").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap map = new ModelMap();
        map.addAttribute("roleName", roleName);
        map.addAttribute("orgCode", orgCode);
        map.addAttribute("userId", userId);
        map.addAttribute("deptName", deptName);
        map.addAttribute("userDiv", userDiv);
        map.addAttribute("deptlist", userDAO.permmenu(orgId, roleName, "dept"));
        map.addAttribute("permlist", userDAO.permmenu(orgId, roleName, "menu"));
        return new ModelAndView("menu1", map);
    }

    @RequestMapping("/login/userProfileEdit.htm")
    public ModelAndView userProfileEdit(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(false);
        String userId = session.getAttribute("userId").toString();
        modelMap.addAttribute("userlist", userDAO.userlist2(userId));
        modelMap.addAttribute("userId", userId);
        return new ModelAndView("../login/editProfile", modelMap);
    }

    @RequestMapping("/login/userProfileUpdate.htm")
    public ModelAndView userProfileUpdate(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        java.util.Date today = new java.util.Date();
        String mobile = req.getParameter("mobile");
        String email = req.getParameter("email");

        List<UserRegistration> urList = userDAO.userReglist(orgId, userId);
        UserRegistration userRegistration = urList.get(0);
        if (email != null || !("".equals(email))) {
            userRegistration.setEmail(email.trim());
        }
        userRegistration.setLastmodifiedDate(new java.sql.Timestamp(today.getTime()));
        if (mobile != null || !("".equals(mobile))) {
            userRegistration.setMobilenumber(mobile.trim());
        }
        userRegistration.setStatus("update0");

        userDAO.save(userRegistration);

//        modelMap.addAttribute("success", "User Profile update success for User Id <span style='color:blue;font-weight:bold'>" + userId + "</span>.");
        return new ModelAndView(new RedirectView("../login/userProfileDetails.htm"), modelMap);

    }

    @RequestMapping("/login/headerlink1.htm")
    public ModelAndView header1(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);
        String roleName = session.getAttribute("userRole").toString();
        String orgId = session.getAttribute("orgId").toString();
        String submodule = request.getParameter("submodule");
        ModelMap map = new ModelMap();
        map.addAttribute("tab", request.getParameter("tab"));
        map.addAttribute("pagetype", request.getParameter("pagetype"));
        map.addAttribute("tablist", userDAO.permmenu(orgId, roleName, submodule));
        return new ModelAndView("../org/tabheader1", map);
    }
    
    //Newly added by lakshmi escalatios and notifications for Alsulaimi 16Apr2019
    
    //**************escalatios and notifications list******************//
    @RequestMapping("/login/escalationsAndNotifList.htm")
    public ModelAndView escalationsAndNotifList(HttpServletRequest request, HttpServletResponse response) {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        modelMap.addAttribute("subgrouplist", userDAO.subgrouplist(null));
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        modelMap.addAttribute("grouplist", userDAO.grouplist(null));
        String tabName = "Escalations And Notifications";
        String submoduleName = "Escalations And Notifications";
        modelMap.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../org/escalationsAndNotifList", modelMap);
    }
//**************escalatios and notifications form******************//

    @RequestMapping("/login/escalationsAndNotifForm.htm")
    public ModelAndView escalationsAndNotifForm(HttpServletRequest request, HttpServletResponse response) {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("orglist", userDAO.orglist(Integer.parseInt(sno)));
        }
        modelMap.addAttribute("submodulelist", userDAO.submodulelist());
        
        modelMap.addAttribute("subgrouplist", userDAO.subgrouplist(null));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../org/escalationsAndNotifForm", modelMap);
    }
    
    @RequestMapping("/login/escalationsAndNotifFormSubmit.htm")
    public ModelAndView escalationsAndNotifFormSubmit(HttpServletRequest request, HttpServletResponse response) {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        modelMap.addAttribute("subgrouplist", userDAO.subgrouplist(null));
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        modelMap.addAttribute("grouplist", userDAO.grouplist(null));
        
        return new ModelAndView("../org/escalationsAndNotifList", modelMap);
    }
    
    @RequestMapping("/login/getTabName.htm")
    public void getTabName(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        try {

            String subModuleName = request.getParameter("subModuleName");
            List<String> tabNames = userDAO.getTabName(subModuleName);
            String data = new Gson().toJson(tabNames);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    @RequestMapping("/login/getRoleName.htm")
    public void getRoleName(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        try {

            String subModuleName = request.getParameter("subModuleName");
            String tabName = request.getParameter("tabName");
            List<String> roleName = userDAO.getRoleName(subModuleName,tabName);
            String data = new Gson().toJson(roleName);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    
    
    //////////////////////////////////////
}
