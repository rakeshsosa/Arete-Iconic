/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.servlet.view.RedirectView;
import tenant.classes.UtilityDetails;
import tenant.dao.ContractDAO;
import tenant.dao.MasterDAO;
import tenant.dao.TenantDetailsDAO;
import tenant.dao.UtilityDetailsDAO;
import tenant.dao.UserDAO;
import tenant.dao.ServiceRequestDAO;

/**
 *
 * @author vamsi
 */
@Controller
public class UtilityDetailsController extends MultiActionController {

    Calendar now = Calendar.getInstance();
    String mod_date = now.get(Calendar.YEAR) + "/" + (now.get(Calendar.MONTH) + 1) + "/" + now.get(Calendar.DATE);
    Date date = new Date(mod_date);
    DateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
    DateFormat formatter2 = new SimpleDateFormat("dd-MM-yyyy");
    DateFormat formatter1 = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss a");
    DateFormat formatter3 = new SimpleDateFormat("dd-MMM-yyyy");
    java.util.Date newdate = new java.util.Date();
    long t = newdate.getTime();
    java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(t);
    @Autowired
    private MasterDAO masterDAO;
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private TenantDetailsDAO tenantDetailsDAO;
    @Autowired
    private ContractDAO contractDAO;
    @Autowired
    private UtilityDetailsDAO utilityDetailsDAO;
    @Autowired
    private ServiceRequestDAO serviceRequestDAO;
//---------------------Tenant Details Start---------------------------------------------//
    //**************Utility Details List******************//

    @RequestMapping("/utility/utilityDetailsList.htm")
    public ModelAndView utilityDetailsList(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);

        String SNo = request.getParameter("SNo");

        map.addAttribute("utilityDetails", utilityDetailsDAO.utilityDetailsList(SNo));

        return new ModelAndView("../utility/utilityDetailsList", map);
    }
    //**************Utility Details Form******************//

    @RequestMapping("/utility/utilityDetailsForm.htm")
    public ModelAndView utilityDetailsForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("SNo");
        String tenantCode = request.getParameter("tenantCode");
//        String landlordId = request.getParameter("llId");
//        String contractPeriod = request.getParameter("contractPeriod");
//        String assetName = request.getParameter("assetName");
//        String subclassifiedAstno = request.getParameter("subclassifiedAstno");
        if (SNo != null && !SNo.isEmpty()) {
            modelMap.addAttribute("utilityDetails", utilityDetailsDAO.list(SNo, "UtilityDetails"));
            // for()
            modelMap.addAttribute("tenantDetails", tenantDetailsDAO.list(tenantCode, "TenantDetails"));
            // modelMap.addAttribute("landLordDetails", tenantDetailsDAO.landLordDetailsList(landlordId));
            //modelMap.addAttribute("contractNamee", tenantDetailsDAO.selectContractCodee(contractPeriod));
            //modelMap.addAttribute("assetDetails", tenantDetailsDAO.assetDetails(assetName));
            //modelMap.addAttribute("subassDetails", tenantDetailsDAO.subassDetails(assetName, subclassifiedAstno));
            //modelMap.addAttribute("landlordDocuments", masterDAO.landlordDocuments(landlordId));
            //modelMap.addAttribute("contDocument", contractDAO.ContractAttachlist(contractPeriod));
        }
        String link = "../utility/utilityDetailsForm.htm";
        String tab = "utility Details";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("fileSize", userDAO.fileSize());
        modelMap.addAttribute("tenantType", tenantDetailsDAO.tenantType());
        modelMap.addAttribute("tenantCategory", tenantDetailsDAO.tenantCategory());
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../utility/utilityDetailsForm", modelMap);
    }

    @RequestMapping("/tenant/selectUtility.htm")
    public ModelAndView selectUtility(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("selectUtility", utilityDetailsDAO.selectUtility());
        return new ModelAndView("selectUtility", modelMap);
    }

    //**************Utility Details Form Submit******************//
    @RequestMapping("/utility/utilityDetailsFormSubmit.htm")
    public ModelAndView utilityDetailsFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String pk = request.getParameter("pk");
        String tenantType = request.getParameter("tenantType");
        String tenantCategory = request.getParameter("tenantCategory");
        String tenantCode = request.getParameter("tenantCode");
        String tenantFname = request.getParameter("tenantFname");
        String tenantLname = request.getParameter("tenantLname");

        String tenantContactno = request.getParameter("tenantContactno");
        String electricBill = request.getParameter("electricBill");

        String waterBill = request.getParameter("waterBill");
        String parkingBill = request.getParameter("parkingBill");
        String maintainceBill = request.getParameter("maintainceBill");
        String totalAmount = request.getParameter("totalAmount");
        String electricityBillno = request.getParameter("electricityBillno");
        String waterBillno = request.getParameter("waterBillno");
        String prviousEBReding = request.getParameter("prviousEBReding");
        String prviousWBReding = request.getParameter("prviousWBReding");
        String currentEBReding = request.getParameter("currentEBReding");
        String currentWBReding = request.getParameter("currentWBReding");
        String totalEBUnints = request.getParameter("totalEBUnints");
        String totalWBUnints = request.getParameter("totalWBUnints");
        // java.util.Date period = request.getD
        String periodd = request.getParameter("period");
        String periodd2 = request.getParameter("toDate");
        Date period = null;
        //if (!period.equals("")) {
        period = (Date) formatter.parse(periodd);
        // }
        Date toDate = null;
        //if (!periodd2.equals("")) {
        toDate = (Date) formatter.parse(periodd2);
        // }
        String status = request.getParameter("status");

        String recordstatus = request.getParameter("recordstatus");
        String creationDate = request.getParameter("creationDate");
        String recordstatus1 = "Occupied";
        modelMap.addAttribute("action", request.getParameter("action"));
        String action = request.getParameter("action");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        UtilityDetails tenant = null;
        tenant = new UtilityDetails(tenantCategory, tenantFname, tenantLname, tenantType, tenantCode, tenantContactno, electricBill, waterBill, parkingBill, maintainceBill, totalAmount, electricityBillno, waterBillno, prviousEBReding, prviousWBReding, currentEBReding, currentWBReding, totalEBUnints, totalWBUnints, period, toDate, today, today, "Update0");
        utilityDetailsDAO.globalSave(tenant);
        modelMap.addAttribute("utilityDetails", utilityDetailsDAO.list(pk, "UtilityDetails"));
        return new ModelAndView(new RedirectView("../utility/utilityDetailsList.htm"), modelMap);
    }

    //**************Utility getUtilityDates.htm******************//
    @RequestMapping("/utility/getUtilityDates.htm")
    public void getUtilityDates(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        HttpSession session = req.getSession(true);
        res.setContentType("text/html;charset=UTF-8");
        String tenantCode = req.getParameter("tenantCode");
        String datef = req.getParameter("actualdatef");
        String datet = req.getParameter("actualdatet");
        String monthf = req.getParameter("actualmonthf1");
        String montht = req.getParameter("actualmontht1");
        String yearf = req.getParameter("actuayf");
        String yeart = req.getParameter("actuayt");
        // String receiptType = req.getParameter("receiptType");
        if (datef.length() == 1) {
            datef = "0" + datef;
        }
        if (datet.length() == 1) {
            datet = "0" + datet;
        }
        if (monthf.length() == 1) {
            monthf = "0" + monthf;
        }
        if (montht.length() == 1) {
            montht = "0" + montht;
        }
        String finalDate1 = yearf + "-" + monthf + "-" + datef;
        String finalDate2 = yeart + "-" + montht + "-" + datet;
        utilityDetailsDAO.getUtilityDates(req, res, tenantCode, finalDate1, finalDate2);
    }
//**************previousArrearsforBV******************//

    @RequestMapping("/tenant/previousContrtacts.htm")
    public void previousContrtacts(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException {
        HttpSession session = req.getSession(true);
        res.setContentType("text/html;charset=UTF-8");
        String tenantCode = req.getParameter("tenantCode");
        String actualstartdatef = req.getParameter("actualstartdatef");
        String actualstartmonthf1 = req.getParameter("actualstartmonthf1");
        String actuaystartf = req.getParameter("actuaystartf");

        if (actualstartdatef.length() == 1) {
            actualstartdatef = "0" + actualstartdatef;
        }
        if (actualstartmonthf1.length() == 1) {
            actualstartmonthf1 = "0" + actualstartmonthf1;
        }
        String finalDate1 = actuaystartf + "-" + actualstartmonthf1 + "-" + actualstartdatef;
        tenantDetailsDAO.previousContrtacts(req, res, tenantCode, finalDate1);
    }

    @RequestMapping("/tenant/previousArrearsforBV.htm")
    public void previousArrearsforBV(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException {
        HttpSession session = req.getSession(true);
        res.setContentType("text/html;charset=UTF-8");
        String tenantCode = req.getParameter("tenantCode");
        String actualstartdatef = req.getParameter("actualstartdatef");
        String actualstartmonthf1 = req.getParameter("actualstartmonthf1");
        String actuaystartf = req.getParameter("actuaystartf");

        if (actualstartdatef.length() == 1) {
            actualstartdatef = "0" + actualstartdatef;
        }
        if (actualstartmonthf1.length() == 1) {
            actualstartmonthf1 = "0" + actualstartmonthf1;
        }
        String finalDate1 = actuaystartf + "-" + actualstartmonthf1 + "-" + actualstartdatef;
        //tenantDetailsDAO.previousArrearsforBV(req, res, tenantCode, finalDate1);
        String arrears = tenantDetailsDAO.previousArrearsforBV(tenantCode, finalDate1);
        String prepaid = tenantDetailsDAO.previousPrepaidforBV(tenantCode, finalDate1);

        PrintWriter out = res.getWriter();

        if (arrears == null || prepaid == null) {
            out.append("a");
        } else {
            out.append(arrears + "," + prepaid);
        }

    }

//----------------------------End of Receipt-------------------//
}
