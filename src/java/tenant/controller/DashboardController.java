/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.controller;

import java.math.BigInteger;
import tenant.dao.DashboardDAO;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import tenant.classes.UserRegistration;
import tenant.dao.UserDAO;

/**
 *
 * @author EBS02
 */
@Controller
public class DashboardController {

    @Autowired
    private DashboardDAO dashboarddao;
    @Autowired
    private UserDAO userDAO;
    Date date1 = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String dt = sdf.format(date1);
    DateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
    DateFormat formatter2 = new SimpleDateFormat("dd-MM-yyyy");
    //DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

    @RequestMapping("/dashboard/tenant.htm")
    public ModelAndView tenant(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String frdate = session.getAttribute("frdate").toString();
        String todate = session.getAttribute("todate").toString();
        modelMap.addAttribute("tenants", dashboarddao.tenantManagementDas("tenants", orgId, dt, frdate, todate));
        modelMap.addAttribute("service", dashboarddao.tenantManagementDas("service", orgId, dt, frdate, todate));
        modelMap.addAttribute("mati", dashboarddao.tenantManagementDas("mati", orgId, dt, frdate, todate));
        modelMap.addAttribute("rentdue", dashboarddao.tenantManagementDas("rentdue", orgId, dt, frdate, todate));
//        modelMap.addAttribute("servdue", dashboarddao.tenantManagementDas("servdue", orgId, dt, frdate, todate));
        modelMap.addAttribute("advdue", dashboarddao.tenantManagementDas("advdue", orgId, dt, frdate, todate));
        modelMap.addAttribute("toDate", todate);
        modelMap.addAttribute("fromDate", frdate);
        return new ModelAndView("tenant", modelMap);
    }

    @RequestMapping("/dashboard/crm.htm")
    public ModelAndView crm(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String frdate = session.getAttribute("frdate").toString();
        String todate = session.getAttribute("todate").toString();
        modelMap.addAttribute("tlead", dashboarddao.followUpDas(null, orgId, dt, frdate, todate));
        //modelMap.addAttribute("followup", dashboarddao.followUpDas("lead", orgId));
        String fromDate = req.getParameter("fromDate");
        String toDate = req.getParameter("toDate");
        modelMap.addAttribute("toDate", todate);
        modelMap.addAttribute("fromDate", frdate);
        modelMap.addAttribute("rentquote", dashboarddao.CustomerDas("rentquote", orgId, dt, frdate, todate));
        modelMap.addAttribute("complaint", dashboarddao.CustomerDas("complaint", orgId, dt, frdate, todate));
        modelMap.addAttribute("feedback", dashboarddao.CustomerDas("feedback", orgId, dt, frdate, todate));
        modelMap.addAttribute("vacate", dashboarddao.CustomerDas("vacate", orgId, dt, frdate, todate));
        modelMap.addAttribute("campaign", dashboarddao.CustomerDas("campaign", orgId, dt, frdate, todate));
        modelMap.addAttribute("AMCQualityCheck", dashboarddao.CustomerDas("AMCQualityCheck", orgId, dt, frdate, todate));
        return new ModelAndView("crm", modelMap);
    }

    @RequestMapping("/dashboard/asset.htm")
    public ModelAndView asset(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String frdate = session.getAttribute("frdate").toString();
        String todate = session.getAttribute("todate").toString();

        modelMap.addAttribute("assets", dashboarddao.AssetManagement1("assets", orgId, dt, frdate, todate));
        modelMap.addAttribute("subassets", dashboarddao.AssetManagement1("subassets", orgId, dt, frdate, todate));
        modelMap.addAttribute("accessories", dashboarddao.AssetManagement1("accessories", orgId, dt, frdate, todate));
        modelMap.addAttribute("vacant", dashboarddao.AssetManagement1("vacant", orgId, dt, frdate, todate));
        modelMap.addAttribute("fromDate", frdate);
       modelMap.addAttribute("toDate", todate);
        return new ModelAndView("asset", modelMap);
    }

//Newly added by lakshmi
    @RequestMapping("/dashboard/occupencyStatistics.htm")
    public ModelAndView occupencyStatistics(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

//        String frdate = session.getAttribute("frdate").toString();
//        String todate = session.getAttribute("todate").toString();
//        String propName = session.getAttribute("propName").toString();
//        Date fdate = null;
//        Date tdate = null;
//        String fromdate = "";
//        String todates = "";
//        String orgCode = req.getParameter("orgCode");
//        String frdate = req.getParameter("Frdate");
//        String todate = req.getParameter("todate");
//        //newly added by lakshmi
        //String propName = req.getParameter("propName");
//        String userId = session.getAttribute("userId").toString();
//        String orgId = session.getAttribute("orgId").toString();
        

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String frdate = session.getAttribute("frdate").toString();
        String todate = session.getAttribute("todate").toString();
        String propName = session.getAttribute("propName").toString();
//        List<String> propNames = dashboarddao.propNames("propNames", orgId);
//        List<String> occupency = new ArrayList<String>();
//
//        List<BigInteger> totFlats = new ArrayList<BigInteger>();
//        List<BigInteger> totVacantFlats = new ArrayList<BigInteger>();
//        List<BigInteger> totalOccupiedFlats = new ArrayList<BigInteger>();
//        List<BigInteger> totalUnListedFlats = new ArrayList<BigInteger>();
//
//        Map<String,BigInteger> totFlats1 = new HashMap<String,BigInteger>();
//        Map<String,BigInteger> totVacantFlats1 = new HashMap<String,BigInteger>();
//        Map<String,BigInteger> totalOccupiedFlats1 = new HashMap<String,BigInteger>();
//        Map<String,BigInteger> totalUnListedFlats1 = new HashMap<String,BigInteger>();
//        String aaa = "";
//        for (String propname : propNames) {
//            totFlats = dashboarddao.propDetails("totFlats", orgId, propname);
//            for (BigInteger totFlat : totFlats) {
//                System.out.println(totFlat);
//                totFlats1.put(propname,totFlat);
//            }
//            totVacantFlats = dashboarddao.propDetails("totVacantFlats", orgId, propname);
//            for (BigInteger totVacantFlat : totVacantFlats) {
//                totVacantFlats1.put(propname,totVacantFlat);
//            }
//            totalOccupiedFlats = dashboarddao.propDetails("totalOccupiedFlats", orgId, propname);
//            for (BigInteger totalOccupiedFlat : totalOccupiedFlats) {
//                totalOccupiedFlats1.put(propname,totalOccupiedFlat);
//            }
//            totalUnListedFlats = dashboarddao.propDetails("totalUnListedFlats", orgId, propname);
//            for (BigInteger totalUnListedFlat : totalUnListedFlats) {
//                totalUnListedFlats1.put(propname,totalUnListedFlat);
//            }
//            aaa = propname + "," + totFlats + "," + totVacantFlats + "," + totalOccupiedFlats + "," + totalUnListedFlats;
//            occupency.add(aaa);
////modelMap.addAttribute("totFlats", dashboarddao.propDetails("totFlats", orgId, propname ));
//        }

//        modelMap.addAttribute("occupency", occupency);
//
//        modelMap.addAttribute("totFlats", totFlats1);
//        modelMap.addAttribute("totVacantFlats", totVacantFlats1);
//        modelMap.addAttribute("totalOccupiedFlats", totalOccupiedFlats1);
        modelMap.addAttribute("toDate", todate);
        modelMap.addAttribute("fromDate", frdate);
        modelMap.addAttribute("propName", propName);
        modelMap.addAttribute("totFlats", dashboarddao.propDetails("totFlats", propName, orgId, dt, frdate, todate));
        modelMap.addAttribute("totVacantFlats", dashboarddao.propDetails("totVacantFlats", propName, orgId, dt, frdate, todate));
        modelMap.addAttribute("totalOccupiedFlats", dashboarddao.propDetails("totalOccupiedFlats", propName, orgId, dt, frdate, todate));
        modelMap.addAttribute("totalUnListedFlats", dashboarddao.propDetails("totalUnListedFlats", propName, orgId, dt, frdate, todate));
        return new ModelAndView("occupencyStatistics", modelMap);
    }

    @RequestMapping("/dashboard/selectProperty.htm")
    public ModelAndView selectProperty(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("selectProperty", dashboarddao.propertyNames());
        return new ModelAndView("selectProperty", modelMap);
    }

    @RequestMapping("/dashboard/occupencyPropertygraph.htm")
    public ModelAndView occupencyPropertygraph(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String frdate = session.getAttribute("frdate").toString();
        String todate = session.getAttribute("todate").toString();
        String propName = session.getAttribute("propName").toString();
        modelMap.addAttribute("propName", propName);
        modelMap.addAttribute("toDate", todate);
        modelMap.addAttribute("fromDate", frdate);
        //modelMap.addAttribute("propName", propName);
        modelMap.addAttribute("totFlats", dashboarddao.occupencyDasgraph("totFlats", propName, orgId, dt, frdate, todate));
        modelMap.addAttribute("totVacantFlats", dashboarddao.occupencyDasgraph("totVacantFlats", propName, orgId, dt, frdate, todate));
        modelMap.addAttribute("totalOccupiedFlats", dashboarddao.occupencyDasgraph("totalOccupiedFlats", propName, orgId, dt, frdate, todate));
        modelMap.addAttribute("totalUnListedFlats", dashboarddao.occupencyDasgraph("totalUnListedFlats", propName, orgId, dt, frdate, todate));
        return new ModelAndView("occupencyPropertygraph", modelMap);
    }

    @RequestMapping("/dashboard/contract.htm")
    public ModelAndView contract(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String frdate = session.getAttribute("frdate").toString();
        String todate = session.getAttribute("todate").toString();
        modelMap.addAttribute("toDate", todate);
        modelMap.addAttribute("fromDate", frdate);
        modelMap.addAttribute("cont", dashboarddao.contractDas("cont", orgId, dt, frdate, todate));
        modelMap.addAttribute("insurance", dashboarddao.contractDas("insurance", orgId, dt, frdate, todate));
        modelMap.addAttribute("expcnt", dashboarddao.contractDas("expcnt", orgId, dt, frdate, todate));
        modelMap.addAttribute("rejcnt", dashboarddao.contractDas("rejcnt", orgId, dt, frdate, todate));
        modelMap.addAttribute("renew", dashboarddao.contractDas("renew", orgId, dt, frdate, todate));
        modelMap.addAttribute("tobapprove", dashboarddao.contractDas("tobapprove", orgId, dt, frdate, todate));
        return new ModelAndView("contract", modelMap);
    }

    @RequestMapping("/dashboard/purchase.htm")
    public ModelAndView purchase(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String userRole = session.getAttribute("userRole").toString();
        String orgId = session.getAttribute("orgId").toString();
        String frdate = session.getAttribute("frdate").toString();
        String todate = session.getAttribute("todate").toString();

        modelMap.addAttribute("nsupplier", dashboarddao.PurchaseManagement1("nsupplier", orgId, dt, frdate, todate));
        modelMap.addAttribute("pppo", dashboarddao.PurchaseManagement1("pppo", orgId, dt, frdate, todate));
        modelMap.addAttribute("prequest", dashboarddao.PurchaseManagement1("prequest", orgId, dt, frdate, todate));
        modelMap.addAttribute("enquiry", dashboarddao.PurchaseManagement1("enquiry", orgId, dt, frdate, todate));
        modelMap.addAttribute("quote", dashboarddao.PurchaseManagement1("quote", orgId, dt, frdate, todate));
        modelMap.addAttribute("purchase", dashboarddao.PurchaseManagement1("purchase", orgId, dt, frdate, todate));
        modelMap.addAttribute("req", dashboarddao.AssetManagement1("req", orgId, dt, frdate, todate));
        modelMap.addAttribute("poprder", dashboarddao.AssetManagement1("poprder", orgId, dt, frdate, todate));
        modelMap.addAttribute("toDate", todate);
        modelMap.addAttribute("fromDate", frdate);
        return new ModelAndView("purchase", modelMap);
    }

    @RequestMapping("/dashboard/inventory.htm")
    public ModelAndView inventory(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String frdate = session.getAttribute("frdate").toString();
        String todate = session.getAttribute("todate").toString();
        String storeName = "hgajajja";//session.getAttribute("storeName").toString();
        modelMap.addAttribute("preceipt", dashboarddao.InventoryManagement1("preceipt", orgId, dt, frdate, todate));
        modelMap.addAttribute("inspection", dashboarddao.InventoryManagement1("inspection", orgId, dt, frdate, todate));
        modelMap.addAttribute("Qinspection", dashboarddao.InventoryManagement1("Qinspection", orgId, dt, frdate, todate));
        modelMap.addAttribute("tgrn", dashboarddao.InventoryManagement1("tgrn", orgId, dt, frdate, todate));
        modelMap.addAttribute("invlist", dashboarddao.InventoryManagement1("invlist", orgId, dt, frdate, todate));
        modelMap.addAttribute("mreturn", dashboarddao.InventoryManagement1("mreturn", orgId, dt, frdate, todate));
        return new ModelAndView("inventory", modelMap);
    }

    @RequestMapping("/dashboard/AMCmanagement.htm")
    public ModelAndView AMCmanagement(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String frdate = session.getAttribute("frdate").toString();
        String todate = session.getAttribute("todate").toString();
        String storeName = "hgajajja";//session.getAttribute("storeName").toString();
        modelMap.addAttribute("preceipt", dashboarddao.InventoryManagement1("preceipt", orgId, dt, frdate, todate));
        modelMap.addAttribute("inspection", dashboarddao.InventoryManagement1("inspection", orgId, dt, frdate, todate));
        modelMap.addAttribute("Qinspection", dashboarddao.InventoryManagement1("Qinspection", orgId, dt, frdate, todate));
        modelMap.addAttribute("tgrn", dashboarddao.InventoryManagement1("tgrn", orgId, dt, frdate, todate));
        modelMap.addAttribute("invlist", dashboarddao.InventoryManagement1("invlist", orgId, dt, frdate, todate));
        modelMap.addAttribute("mreturn", dashboarddao.InventoryManagement1("mreturn", orgId, dt, frdate, todate));
        return new ModelAndView("AMCManagement", modelMap);
    }

    @RequestMapping("/dashboard/amcQualityCheck.htm")
    public ModelAndView amcQualityCheck(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String frdate = session.getAttribute("frdate").toString();
        String todate = session.getAttribute("todate").toString();
        String storeName = "hgajajja";//session.getAttribute("storeName").toString();
        modelMap.addAttribute("preceipt", dashboarddao.InventoryManagement1("preceipt", orgId, dt, frdate, todate));
        modelMap.addAttribute("inspection", dashboarddao.InventoryManagement1("inspection", orgId, dt, frdate, todate));
        modelMap.addAttribute("Qinspection", dashboarddao.InventoryManagement1("Qinspection", orgId, dt, frdate, todate));
        modelMap.addAttribute("tgrn", dashboarddao.InventoryManagement1("tgrn", orgId, dt, frdate, todate));
        modelMap.addAttribute("invlist", dashboarddao.InventoryManagement1("invlist", orgId, dt, frdate, todate));
        modelMap.addAttribute("mreturn", dashboarddao.InventoryManagement1("mreturn", orgId, dt, frdate, todate));
        return new ModelAndView("amcQualityCheck", modelMap);
    }

    @RequestMapping("/dashboard/tenantgraph.htm")
    public ModelAndView tenantgraph(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String frdate = session.getAttribute("frdate").toString();
        String todate = session.getAttribute("todate").toString();
        modelMap.addAttribute("tenants", dashboarddao.tenantManagement1Dasgraph("tenants", orgId, dt, frdate, todate));
        modelMap.addAttribute("service", dashboarddao.tenantManagement1Dasgraph("service", orgId, dt, frdate, todate));
        modelMap.addAttribute("mati", dashboarddao.tenantManagement1Dasgraph("mati", orgId, dt, frdate, todate));
        modelMap.addAttribute("rentdue", dashboarddao.tenantManagement1Dasgraph("rentdue", orgId, dt, frdate, todate));
        modelMap.addAttribute("servdue", dashboarddao.tenantManagement1Dasgraph("servdue", orgId, dt, frdate, todate));
        modelMap.addAttribute("advdue", dashboarddao.tenantManagement1Dasgraph("advdue", orgId, dt, frdate, todate));
        modelMap.addAttribute("toDate", todate);
        modelMap.addAttribute("fromDate", frdate);
        return new ModelAndView("tenantgraph", modelMap);
    }

    @RequestMapping("/dashboard/crmgraph.htm")
    public ModelAndView crmgraph(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String frdate = session.getAttribute("frdate").toString();
        String todate = session.getAttribute("todate").toString();
        modelMap.addAttribute("tlead2", dashboarddao.followUpDasgraph(null, orgId, dt, frdate, todate));
//        modelMap.addAttribute("followup", dashboarddao.followUp1("lead", orgId));
        modelMap.addAttribute("rentquote2", dashboarddao.CustomerDasgraph("rentquote", orgId, dt, frdate, todate));
        modelMap.addAttribute("complaint2", dashboarddao.CustomerDasgraph("complaint", orgId, dt, frdate, todate));
        modelMap.addAttribute("feedback2", dashboarddao.CustomerDasgraph("feedback", orgId, dt, frdate, todate));
        modelMap.addAttribute("vacate2", dashboarddao.CustomerDasgraph("vacate", orgId, dt, frdate, todate));
        modelMap.addAttribute("campaign2", dashboarddao.CustomerDasgraph("campaign", orgId, dt, frdate, todate));
        return new ModelAndView("crmgraph", modelMap);
    }

    @RequestMapping("/dashboard/purchsegraph.htm")
    public ModelAndView purchsegraph(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String frdate = session.getAttribute("frdate").toString();
        String todate = session.getAttribute("todate").toString();
        modelMap.addAttribute("nsupplier", dashboarddao.PurchaseManagementDasgraph("nsupplier", orgId, dt, frdate, todate));
        modelMap.addAttribute("pppo", dashboarddao.PurchaseManagementDasgraph("pppo", orgId, dt, frdate, todate));
        modelMap.addAttribute("prequest", dashboarddao.PurchaseManagementDasgraph("prequest", orgId, dt, frdate, todate));
        modelMap.addAttribute("enquiry", dashboarddao.PurchaseManagementDasgraph("enquiry", orgId, dt, frdate, todate));
        modelMap.addAttribute("quote", dashboarddao.PurchaseManagementDasgraph("quote", orgId, dt, frdate, todate));
        modelMap.addAttribute("purchase", dashboarddao.PurchaseManagementDasgraph("purchase", orgId, dt, frdate, todate));
        return new ModelAndView("purchsegraph", modelMap);
    }

    @RequestMapping("/dashboard/inventorygrph.htm")
    public ModelAndView inventorygrph(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String frdate = session.getAttribute("frdate").toString();
        String todate = session.getAttribute("todate").toString();
        String storeName = "hgajajja";//session.getAttribute("storeName").toString();
        modelMap.addAttribute("preceipt", dashboarddao.InventoryManagementDasgraph("preceipt", orgId, dt, frdate, todate));
        modelMap.addAttribute("inspection", dashboarddao.InventoryManagementDasgraph("inspection", orgId, dt, frdate, todate));
        modelMap.addAttribute("Qinspection", dashboarddao.InventoryManagementDasgraph("Qinspection", orgId, dt, frdate, todate));
        modelMap.addAttribute("tgrn", dashboarddao.InventoryManagementDasgraph("tgrn", orgId, dt, frdate, todate));
        modelMap.addAttribute("invlist", dashboarddao.InventoryManagementDasgraph("invlist", orgId, dt, frdate, todate));
        modelMap.addAttribute("mreturn", dashboarddao.InventoryManagementDasgraph("mreturn", orgId, dt, frdate, todate));
        return new ModelAndView("inventorygrph", modelMap);
    }

    @RequestMapping("/dashboard/assetgraph.htm")
    public ModelAndView assetgraph(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String frdate = session.getAttribute("frdate").toString();
        String todate = session.getAttribute("todate").toString();
        modelMap.addAttribute("assets", dashboarddao.AssetManagementDasgraph("assets", orgId, dt, frdate, todate));
        modelMap.addAttribute("subassets", dashboarddao.AssetManagementDasgraph("subassets", orgId, dt, frdate, todate));
        modelMap.addAttribute("accessories", dashboarddao.AssetManagementDasgraph("accessories", orgId, dt, frdate, todate));
        modelMap.addAttribute("vacant", dashboarddao.AssetManagementDasgraph("vacant", orgId, dt, frdate, todate));
        modelMap.addAttribute("req", dashboarddao.AssetManagementDasgraph("req", orgId, dt, frdate, todate));
        modelMap.addAttribute("poprder", dashboarddao.AssetManagementDasgraph("poprder", orgId, dt, frdate, todate));
        return new ModelAndView("assetgraph", modelMap);
    }

    @RequestMapping("/dashboard/contractgraph.htm")
    public ModelAndView contractgraph(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String frdate = session.getAttribute("frdate").toString();
        String todate = session.getAttribute("todate").toString();
        modelMap.addAttribute("cont", dashboarddao.contractDasgraph("cont", orgId, dt, frdate, todate));
        modelMap.addAttribute("insurance", dashboarddao.contractDasgraph("insurance", orgId, dt, frdate, todate));
        modelMap.addAttribute("expcnt", dashboarddao.contractDasgraph("expcnt", orgId, dt, frdate, todate));
        modelMap.addAttribute("rejcnt", dashboarddao.contractDasgraph("rejcnt", orgId, dt, frdate, todate));
        modelMap.addAttribute("renew", dashboarddao.contractDasgraph("renew", orgId, dt, frdate, todate));
        modelMap.addAttribute("tobapprove", dashboarddao.contractDasgraph("tobapprove", orgId, dt, frdate, todate));
        return new ModelAndView("contractgraph", modelMap);
    }

    @RequestMapping("/dashboard/notifications.htm")
    public ModelAndView redirectToDashBoardUP(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);

        String userId = session.getAttribute("userId").toString();
        String orgCode = request.getParameter("orgCode");
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
        modelMap.addAttribute("deptlists", userDAO.permmenu(orgCode1[0], roleName, "dept"));
        //modelMap.addAttribute("contraExp", userDAO.contralist(null));
        modelMap.addAttribute("roleName", roleName);
        modelMap.addAttribute("userId", userId);
        return new ModelAndView("notifications", modelMap);

    }
    /*@RequestMapping("/dashboard/notifications.htm")
     public ModelAndView notifications(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
     ModelMap modelMap = new ModelMap();
     HttpSession session = req.getSession(true);
     String userId = session.getAttribute("userId").toString();
     String orgId = session.getAttribute("orgId").toString();
     modelMap.addAttribute("assets", dashboarddao.AssetManagement("assets", orgId));
     modelMap.addAttribute("subassets", dashboarddao.AssetManagement("subassets", orgId));
     modelMap.addAttribute("accessories", dashboarddao.AssetManagement("accessories", orgId));
     modelMap.addAttribute("accessories1", dashboarddao.AssetManagementN1("accessories", orgId));
     modelMap.addAttribute("vacant1", dashboarddao.AssetManagementN1("vacant", orgId));
     modelMap.addAttribute("req1", dashboarddao.AssetManagementN1("req", orgId));
     modelMap.addAttribute("poprder1", dashboarddao.AssetManagementN1("poprder", orgId));
     modelMap.addAttribute("vacant", dashboarddao.AssetManagement("vacant", orgId));
     modelMap.addAttribute("req", dashboarddao.AssetManagement("req", orgId));
     modelMap.addAttribute("poprder", dashboarddao.AssetManagement("poprder", orgId));
     modelMap.addAttribute("cont", dashboarddao.contract("cont", orgId));
     modelMap.addAttribute("insurance", dashboarddao.contract("insurance", orgId));
     modelMap.addAttribute("expcnt", dashboarddao.contract("expcnt", orgId));
     modelMap.addAttribute("rejcnt", dashboarddao.contract("rejcnt", orgId));
     modelMap.addAttribute("renew", dashboarddao.contract("renew", orgId));
     modelMap.addAttribute("tobapprove", dashboarddao.contract("tobapprove", orgId));
     //return new ModelAndView("contract", modelMap);//expcnt
     modelMap.addAttribute("tenants", dashboarddao.tenantManagementN("tenants", orgId));
     modelMap.addAttribute("service", dashboarddao.tenantManagement("service", orgId));
     modelMap.addAttribute("mati", dashboarddao.tenantManagement("mati", orgId));
     modelMap.addAttribute("rentdue", dashboarddao.tenantManagement("rentdue", orgId));
     modelMap.addAttribute("servdue", dashboarddao.tenantManagement("servdue", orgId));
     modelMap.addAttribute("advdue", dashboarddao.tenantManagement("advdue", orgId));
     //return new ModelAndView("tenant", modelMap);
     modelMap.addAttribute("tlead", dashboarddao.followUp(null, orgId));
     modelMap.addAttribute("followup", dashboarddao.followUp("lead", orgId));
     modelMap.addAttribute("rentquote", dashboarddao.Customer("rentquote", orgId));
     modelMap.addAttribute("complaint", dashboarddao.Customer("complaint", orgId));
     modelMap.addAttribute("feedback", dashboarddao.Customer("feedback", orgId));
     modelMap.addAttribute("vacate", dashboarddao.Customer("vacate", orgId));
     modelMap.addAttribute("campaign", dashboarddao.Customer("campaign", orgId));
     //return new ModelAndView("crm", modelMap);
        
     return new ModelAndView("notifications", modelMap);
     }*/

    @RequestMapping("/dashboard/tenant1.htm")
    public ModelAndView tenant1(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String frdate = session.getAttribute("frdate").toString();
        String todate = session.getAttribute("todate").toString();

        modelMap.addAttribute("service", dashboarddao.tenantManagementDas1("service", userId, orgId, dt, frdate, todate));
        modelMap.addAttribute("servdue", dashboarddao.tenantManagementDas1("servdue", userId, orgId, dt, frdate, todate));
        modelMap.addAttribute("tenant", dashboarddao.tenantManagementDas1("tenant", userId, orgId, dt, frdate, todate));
//        modelMap.addAttribute("rentdue", dashboarddao.tenantManagementDas1("rentdue", userId, orgId, dt, frdate, todate));
//        modelMap.addAttribute("advdue", dashboarddao.tenantManagementDas1("advdue", userId, orgId, dt, frdate, todate));

        return new ModelAndView("tenant1", modelMap);
    }

    @RequestMapping("/dashboard/tenantgraph1.htm")
    public ModelAndView tenantgraph1(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String frdate = session.getAttribute("frdate").toString();
        String todate = session.getAttribute("todate").toString();
        Object service1 = dashboarddao.tenantManagementDasgraph1("service", userId, orgId, dt, frdate, todate);
        Object servdue1 = dashboarddao.tenantManagementDasgraph1("servdue", userId, orgId, dt, frdate, todate);
        Object tenant1 = dashboarddao.tenantManagementDasgraph1("tenant", userId, orgId, dt, frdate, todate);
        String service = service1.toString();
        String servdue = servdue1.toString();
        String tenant = tenant1.toString();

        if (service.equals("[0]") && servdue.equals("[null]") && tenant.equals("[0]")) {

            modelMap.addAttribute("service", service);
            modelMap.addAttribute("servdue", servdue);
            modelMap.addAttribute("tenant", tenant);

            return new ModelAndView("tenantgraph2", modelMap);

        } else {

            modelMap.addAttribute("service", service);
            modelMap.addAttribute("servdue", servdue);
            modelMap.addAttribute("tenant", tenant);

            return new ModelAndView("tenantgraph1", modelMap);
        }

    }
}
