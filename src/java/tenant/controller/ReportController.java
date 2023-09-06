/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.controller;

import com.google.gson.Gson;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.pentaho.reporting.engine.classic.core.ClassicEngineBoot;
import org.pentaho.reporting.engine.classic.core.MasterReport;
import org.pentaho.reporting.engine.classic.core.modules.output.pageable.pdf.PdfReportUtil;
import org.pentaho.reporting.engine.classic.core.modules.output.table.csv.CSVReportUtil;
import org.pentaho.reporting.engine.classic.core.modules.output.table.html.HtmlReportUtil;
import org.pentaho.reporting.engine.classic.core.modules.output.table.xls.ExcelReportUtil;
import org.pentaho.reporting.libraries.resourceloader.Resource;
import org.pentaho.reporting.libraries.resourceloader.ResourceLoadingException;
import org.pentaho.reporting.libraries.resourceloader.ResourceManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import tenant.classes.RentNotificationProcedure;
import tenant.dao.ReportDAO;
import tenant.dao.TenantDetailsDAO;

/**
 *
 * @author ebs-pavankant
 */
@Controller
public class ReportController extends MultiActionController {

    private final static Logger MYLOG = LoggerFactory.getLogger(ReportController.class);

    ModelMap modelMap = new ModelMap();
    DateFormat f = new SimpleDateFormat("dd-MMM-yyyy");
    DateFormat formatter1 = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ssa");
    Calendar now = Calendar.getInstance();
    String mod_date = now.get(Calendar.YEAR) + "/" + (now.get(Calendar.MONTH) + 1) + "/" + now.get(Calendar.DATE);
    Date date = new Date(mod_date);
    Date date1;
    Date date2;
    Date date3;
    Date date4;
    @Autowired
    private ReportDAO reportDAO;
    
    @Autowired
    private TenantDetailsDAO tenantDetailsDAO;

    //below method will render view for correspondence report generation
    //
    @RequestMapping("/reports/correspondenceReport.htm")
    public ModelAndView correspondenceReport(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        //getting values for report parameters
        modelMap.addAttribute("leadlist", reportDAO.leadTypeList());
        modelMap.addAttribute("campaignNameList", reportDAO.campaignNameListFromCampaignDetails());
        modelMap.addAttribute("assetName", reportDAO.assetNameListFromLead());
        modelMap.addAttribute("tenantNameForTD", reportDAO.tenantNameListFromTenantDetails());
        modelMap.addAttribute("assetNameForTD", reportDAO.assetNameListFromTenantDetails());
        modelMap.addAttribute("leadNameList", reportDAO.leadNameList());
        modelMap.addAttribute("leadNameListFollowUP", reportDAO.leadNameListFromFollowUp());
        modelMap.addAttribute("vacatingTenantNames", reportDAO.tenantNameListFromVacating());
        modelMap.addAttribute("assetTypeList", reportDAO.assetTypeList());
        modelMap.addAttribute("propertyNamesList", reportDAO.propertyNamesList());
        modelMap.addAttribute("propertiesList", reportDAO.propertiesList());
        modelMap.addAttribute("flatsNameList", reportDAO.flatsNameList());
        modelMap.addAttribute("accessoriesNameList", reportDAO.accessoriesNameList());
        modelMap.addAttribute("penaltyAssetNameList", reportDAO.penaltyAssetNameList());
        modelMap.addAttribute("utilityTenantCodeList", reportDAO.utilityTenantCodeList());
        modelMap.addAttribute("rentPostingList", reportDAO.rentPostingList());
        modelMap.addAttribute("penaltyTenantCodeList", reportDAO.penaltyTenantCodeList());
        modelMap.addAttribute("landlordNameList", reportDAO.landlordNameList());

        return new ModelAndView("correspondenceReport", modelMap);
    }

    @RequestMapping("/reports/inventoryReport.htm")
    public ModelAndView inventoryReport(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        modelMap.addAttribute("itemList", reportDAO.itemNameList());
        modelMap.addAttribute("storeList", reportDAO.storeNameList());
        modelMap.addAttribute("supplierList", reportDAO.supplierNameList());
        //modelMap.addAttribute("codeList", reportDAO.itemcodeList());

        return new ModelAndView("inventoryReport", modelMap);
    }

    @RequestMapping("/reports/purchaseReport.htm")
    public ModelAndView purchaseReport(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        modelMap.addAttribute("suplierList", reportDAO.supplierName());
        modelMap.addAttribute("itemList", reportDAO.itemNameListP());
        modelMap.addAttribute("apStatus", reportDAO.itemNameListAP());
        modelMap.addAttribute("itemCodeList", reportDAO.itemCodeList1());
        modelMap.addAttribute("itemcateList", reportDAO.itemCategoryList1());
        modelMap.addAttribute("prStatusList", reportDAO.statusList1());
        modelMap.addAttribute("assetname1", reportDAO.PropertyName());
        modelMap.addAttribute("assetname2", reportDAO.PropertyName1());
        modelMap.addAttribute("flatsNameList1", reportDAO.flatsName1());
        modelMap.addAttribute("flatsNameList2", reportDAO.flatsName2());
//apStatus
        return new ModelAndView("purchaseReport", modelMap);
    }

    //below method will render view for tenent repors generation
    //
    @RequestMapping("/reports/tenantReport.htm")
    public ModelAndView tenantReport(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        //getting values for report parameters
        modelMap.addAttribute("tenantCodeFromTD", reportDAO.tenantCodeListFromTenantDetails());
        modelMap.addAttribute("tenantNameFromTD", reportDAO.tenantNameListFromTenantDetails());
        modelMap.addAttribute("tcode", reportDAO.tenantCodesListFromBillPayment());
        modelMap.addAttribute("assetname1", reportDAO.assetNameListFromAssetDetails());
        modelMap.addAttribute("tenantname", reportDAO.tenantNameListFromTenantDetails());
        modelMap.addAttribute("tenantNamesForService", reportDAO.tenantNameListForServiceHistory());
        modelMap.addAttribute("tenantCodesForService", reportDAO.tenantCodesListForServiceHistory());
        modelMap.addAttribute("assetNameOfPDC", reportDAO.assetNameListOfPDC());
        modelMap.addAttribute("assetNameFromTD", reportDAO.assetNameListFromTenantDetails());
        modelMap.addAttribute("tenantTypeList", reportDAO.tenantTypeList());
        modelMap.addAttribute("flatsNameList1", reportDAO.flatsName());
        modelMap.addAttribute("rentpropertylist", reportDAO.rentProperty1());
        modelMap.addAttribute("renttenantlist", reportDAO.rentTenant1());
        modelMap.addAttribute("rentflatlist", reportDAO.rentFlat1());
         modelMap.addAttribute("UserIDFromAging", reportDAO.UserIDFromAging());  
        modelMap.addAttribute("rentpropertynamelist", reportDAO.rentPropertyname1());
        modelMap.addAttribute("getLedgerNo", reportDAO.getLedgerNo());
        // modelMAp.addAttribute("tenanthistory")
        return new ModelAndView("tenantReport", modelMap);
    }

    /*
     below methods will receive AJAX request and send parameter for Tetant Details Report
     */
    @RequestMapping("/reports/getTenantName.htm")
    public void getTenantName(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        try {

            String tenantCode = request.getParameter("tenantCode");
            String assetName = request.getParameter("assetName");
            List<String> tenantnames = reportDAO.getTenantNameByTenantCodeFromTenantDetails(tenantCode, assetName);
            String data = new Gson().toJson(tenantnames);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /*
     below methods will receive AJAX request and send parameter for Service Details Report
     */
    @RequestMapping("/reports/getServiceTenantCode.htm")
    public void getServiceTenantCode(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {
        try {

            String assetName = request.getParameter("assetName");
            List<String> tenantCodes = reportDAO.getTenantCodeByServiceAssetName(assetName);
            String data = new Gson().toJson(tenantCodes);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @RequestMapping("/reports/getTenantDetailsCode.htm")
    public void getTenantDetailsCode(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {
        try {

            String assetName = request.getParameter("assetName");
            List<String> tenantCodes = reportDAO.getTenantCodeByTenantDetailsAssetName(assetName);
            String data = new Gson().toJson(tenantCodes);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @RequestMapping("/reports/getAmountDuesTenantName.htm")
    public void getAmountDuesTenantName(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {
        try {

            String assetName = request.getParameter("assetName");
            List<String> tenantCodes = reportDAO.getTenantNameByAmountDuesAssetName(assetName);
            String data = new Gson().toJson(tenantCodes);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /*
     below methods will receive AJAX request and send parameter for Service Details Report
     */
    @RequestMapping("/reports/getServiceTenantName.htm")
    public void getServiceTenantName(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        try {

            String tenantCode = request.getParameter("tenantCode");
            String assetName = request.getParameter("assetName");
            List<String> tenantNames = reportDAO.getTenantNameByServiceTenantCode(tenantCode, assetName);
            String data = new Gson().toJson(tenantNames);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /*
     below methods will receive AJAX request and send parameter for Service Details Report
     */
    @RequestMapping("/reports/getServiceAssetTenantName.htm")
    public void getServiceAssetTenantName(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        try {

            String assetName = request.getParameter("assetName");
            List<String> tenantNames = reportDAO.getTenantNameByServiceAssetName(assetName);
            String data = new Gson().toJson(tenantNames);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @RequestMapping("/reports/getTenantDetailsName.htm")
    public void getTenantDetailsName(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        try {

            String assetName = request.getParameter("assetName");
            List<String> tenantNames = reportDAO.getTenantNameByTenantDetailsAssetName(assetName);
            String data = new Gson().toJson(tenantNames);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /*
     below methods will receive AJAX request and send parameter for Dues History Report
     */
    @RequestMapping("/reports/getDuesTenantCode.htm")
    public void getDuesTenantCode(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        try {

            String assetName = request.getParameter("assetName");
            List<String> tenantCodes = reportDAO.getTenantCodeByDuesAssetName(assetName);
            String data = new Gson().toJson(tenantCodes);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /*
     below methods will receive AJAX request and send parameter for Dues History Report
     */
    @RequestMapping("/reports/getDuesTenantName.htm")
    public void getDuesTenantName(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        try {

            String tenantCode = request.getParameter("tenantCode");
            String assetName = request.getParameter("assetName");
            List<String> tenantNames = reportDAO.getTenantNameByDuesTenantCode(tenantCode, assetName);
            String data = new Gson().toJson(tenantNames);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    //made by pavi
    @RequestMapping("/reports/getSubassetFlatName.htm")
    public void getSubassetFlatName(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        try {
            //String tenantName = request.getParameter("tenantName");
            String assetName = request.getParameter("assetName");
            List<String> flatNames = reportDAO.getSubassetFlatNames(assetName);
            String data = new Gson().toJson(flatNames);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    //made by pavi
    @RequestMapping("/reports/getFlatName.htm")
    public void getFlatName(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        try {

            String assetName = request.getParameter("assetName");
            List<String> flatNames = reportDAO.getFlatNames(assetName);
            String data = new Gson().toJson(flatNames);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @RequestMapping("/reports/getRentTenant.htm")
    public void getRentTenant(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        try {
            //String tenantName = request.getParameter("tenantName");
            String assetName = request.getParameter("assetName");
            List<String> tenantNames = reportDAO.getRentTenantNames(assetName);
            String data = new Gson().toJson(tenantNames);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    //made by pavi
    @RequestMapping("/reports/getFlatName.htm")
    public void getRentFlatName(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        try {

            String assetName = request.getParameter("assetName");
            List<String> flatNames = reportDAO.getRentFlatNames(assetName);
            String data = new Gson().toJson(flatNames);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    //made by pavi
    @RequestMapping("/reports/getReqFlatName.htm")
    public void getReqFlatName(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        try {

            String assetName = request.getParameter("assetName");
            List<String> flatNames = reportDAO.getReqFlatNames(assetName);
            String data = new Gson().toJson(flatNames);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @RequestMapping("/reports/getRentFlatName1.htm")
    public void getRentFlatName1(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        try {

            String assetName = request.getParameter("assetName");
            List<String> flatNames = reportDAO.getRentFlatNames1(assetName);
            String data = new Gson().toJson(flatNames);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @RequestMapping("/reports/getDepreciationAccessoryName.htm")
    public void getDepreciationAccessoryName(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        try {

            String flatName = request.getParameter("flatName");
            String assetName = request.getParameter("assetName");
            List<String> accessoryNames = reportDAO.getDepreciationAccessoryName(flatName, assetName);
            String data = new Gson().toJson(accessoryNames);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }


    /*
     below methods will receive AJAX request and send parameter for Dues History Report
     */
    @RequestMapping("/reports/getDuesAssetTenantName.htm")
    public void getDuesAssetTenantName(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        try {

            String assetName = request.getParameter("assetName");
            List<String> tenantNames = reportDAO.getTenantNameByDuesAssetName(assetName);
            String data = new Gson().toJson(tenantNames);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /*
     below methods will receive AJAX request and send parameter for Advance History Report
     */
    @RequestMapping("/reports/getAdvanceTenantName.htm")
    public void getAdvanceTenantName(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        try {

            String assetName = request.getParameter("assetName");
            List<String> tenantNames = reportDAO.getTenantNameByAdvanceAssetName(assetName);
            String data = new Gson().toJson(tenantNames);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /*
     below methods will receive AJAX request and send parameter for Penalty Details Report
     */
    @RequestMapping("/reports/getPenaltyTenantCode.htm")
    public void getPenaltyTenantCode(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        try {

            String assetName = request.getParameter("assetName");
            List<String> tenantCodes = reportDAO.getTenantCodeByPenaltyAssetName(assetName);
            String data = new Gson().toJson(tenantCodes);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /*
     below methods will receive AJAX request and send parameter for Penalty Details Report
     */
    @RequestMapping("/reports/getLandLordName.htm")
    public void getLandLordName(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        try {

            String rentpostingType = request.getParameter("rentpostingType");
            List<String> landlordName = reportDAO.getLandLordNameByRentPosting(rentpostingType);
            String data = new Gson().toJson(landlordName);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /*
     below methods will receive AJAX request and send parameter for Rent Paid History Report
     */
    @RequestMapping("/reports/getRentTenantName.htm")
    public void getRentTenantName(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        try {

            String assetName = request.getParameter("assetName");
            List<String> tenantNames = reportDAO.getTenantNameByRentAssetName(assetName);
            String data = new Gson().toJson(tenantNames);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /*
     below methods will receive AJAX request and send parameter for Followup details Report
     */
    @RequestMapping("/reports/getFollowUpLeadName.htm")
    public void getFollowUpLeadName(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        try {

            String leadType = request.getParameter("leadType");
            List<String> leadNames = reportDAO.getLeadNameByFollowUpLeadType(leadType);
            String data = new Gson().toJson(leadNames);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /*
     below methods will receive AJAX request and send parameter for Lead details Report
     */
    @RequestMapping("/reports/getLeadDetailsLeadName.htm")
    public void getLeadDetailsLeadName(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        try {

            String leadType = request.getParameter("leadType");
            List<String> leadNames = reportDAO.getLeadNameByLeadDetailsLeadType(leadType);
            String data = new Gson().toJson(leadNames);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /*
     below methods will receive AJAX request and send parameter for Vacating Tenant details Report
     */
    @RequestMapping("/reports/getVacateTenantName.htm")
    public void getVacateTenantName(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        try {

            String assetName = request.getParameter("assetName");
            List<String> tenantNames = reportDAO.getVacateTenantName(assetName);
            String data = new Gson().toJson(tenantNames);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @RequestMapping("/reports/getDepreciationFlatName.htm")
    public void getDepreciationFlatName(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        try {

            String assetName = request.getParameter("assetName");
            List<String> flatNames = reportDAO.getDepreciationFlatNames(assetName);
            String data = new Gson().toJson(flatNames);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @RequestMapping("/reports/getDepreciationAssetAccessoryName.htm")
    public void getDepreciationAssetAccessoryName(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        try {

            String assetName = request.getParameter("assetName");
            List<String> flatNames = reportDAO.getDepreciationAssetAccessoryName(assetName);
            String data = new Gson().toJson(flatNames);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @RequestMapping("/reports/getRenewalTenantName.htm")
    public void getRenewalTenantName(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        try {

            String assetName = request.getParameter("assetName");
            List<String> tenantNames = reportDAO.getRenewalTenantNameByAssetName(assetName);
            String data = new Gson().toJson(tenantNames);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /*
     below method will receive request for generating report
     */
    @RequestMapping("/reports/areteReportData.htm")
    public void areteReportData(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {
        try {

            //getting parameter
            DateFormat f1 = new SimpleDateFormat("dd-MMM-yy");
            String FileName = "Reports";
            //DateFormat f2 = new SimpleDateFormat("dd-MMM-yy hh:mm:ss");
            request.setCharacterEncoding("UTF-8");
            String reportFormat = request.getParameter("format");
            String report = request.getParameter("reportid");
            String leadType = request.getParameter("leadt");
            String leadName = request.getParameter("leadName");
            String assetName = request.getParameter("assetn");
            String tenantCode = request.getParameter("tanantc");
            String campaignName = request.getParameter("campaignName");
            String tenantNameForTD = request.getParameter("tanantNameTD");
            String assetNameForTD = request.getParameter("assetNameTD");
            String grnNo = request.getParameter("grnNo");
            String tenantNameService = request.getParameter("tenantNameService");
            String tenantCodeService = request.getParameter("tenantCodeService");
            String assetNameService = request.getParameter("assetNameService");
            String tenantNameDues = request.getParameter("tenantNameDues");
            String tenantCodeDues = request.getParameter("tenantCodeDues");
            String assetNameDues = request.getParameter("assetNameDues");
            String assetNameAdvance = request.getParameter("assetNameAdvance");
            String tenantNameAdvance = request.getParameter("tenantNameAdvance");
            String assetNameRent = request.getParameter("assetNameRent");
            String tenantNameRent = request.getParameter("tenantNameRent");

            String leadNameFollowUp = request.getParameter("leadNameFollowUp");
            String leadTypeFollowUp = request.getParameter("leadTypeFollowUp");
            String vacatingTenantName = request.getParameter("vacatingTenantName");
            String assetNamePDC = request.getParameter("assetNamePDC");
            String tenantNameRenewal = request.getParameter("tenantNameRenewal");
            
            String assetNameRenewal = request.getParameter("assetNameRenewal");
            String amountDuesAssetName = request.getParameter("amountDuesAssetName");
            String depreAssetType = request.getParameter("depreAssetType");
            String depreAssetName = request.getParameter("depreAssetName");
            String depreFlatName = request.getParameter("depreFlatName");
            String depreAccessoryName = request.getParameter("depreAccessoryName");
            String amountDuesTenantName = request.getParameter("amountDuesTenantName");
            String vacatedFlatAssetName = request.getParameter("vacatedFlatAssetName");
            String penaltyAssetName = request.getParameter("penaltyAssetName");
            String utilityTenantCode = request.getParameter("utilityTenantCode");
            String rentPosting = request.getParameter("rentPosting");
            String penaltyTenantCode = request.getParameter("penaltyTenantCode");
            String landlordName = request.getParameter("landlordName");
            String complaintAssetName = request.getParameter("complaintAssetName");
            String dcnNo = request.getParameter("dcnNo1");
            String GrnNo = request.getParameter("GrnNo");
            String itemName = request.getParameter("itemn");
            String storeName = request.getParameter("storen");
            String itemCode = request.getParameter("coden");
            String supName = request.getParameter("supn");
            String apstatus = request.getParameter("apstatus");
            String prItemCode = request.getParameter("itemcodediv");
            String prItemCategory = request.getParameter("itemcat");
            String prStatus = request.getParameter("prstatusdiv");
            String prFilter = request.getParameter("filter");
            String rentSNo = request.getParameter("SNo");
            String invoice = request.getParameter("invoice");
             String tenantId = request.getParameter("tenantId");
            String propertyname = request.getParameter("propertyname");
            String flatname = request.getParameter("flatname");
            String propertynamereq = request.getParameter("propertynamereq");
            String flatnamereq = request.getParameter("flatnamereq");
            String receiptNo = request.getParameter("receiptNo");
            String rentproperty = request.getParameter("rentproperty");
            String rentflat = request.getParameter("rentflat");
            String renttenant = request.getParameter("renttenant");

            //String assetName_TD = request.getParameter("assetName_TD");
            //String billCycle = request.getParameter("billCycle");
            String fromdate = request.getParameter("fromdate");
            String todate = request.getParameter("todate");
            String supplier = request.getParameter("supplier");

            if ("".equals(fromdate) || " ".equals(fromdate) || fromdate == null || "Select Date".equals(fromdate)) {
                date1 = null;
            }

            if ("".equals(todate) || " ".equals(todate) || todate == null || "Select Date".equals(todate)) {
                date2 = null;
            } else {
                date1 = f1.parse(fromdate);
                date2 = f1.parse(todate);
            }
//            fromdate=fromdate+" 00:00:00";
//            todate=todate+" 00:00:00";
//             if ("".equals(fromdate) || " ".equals(fromdate) || fromdate == null || "Select Date".equals(fromdate)) {
//                date3 = null;
//            }
//            if ("".equals(todate) || " ".equals(todate) || todate == null || "Select Date".equals(todate)) {
//                date4 = null;
//            } else {
//                date3 = f2.parse(fromdate);
//                date4 = f2.parse(todate);
//            }
//            System.out.println("date3 :" + date3);
//            System.out.println("date4 :" + date4);
//            System.out.println("date1 :" + date1);
//            System.out.println("date2 :" + date2);

            String reportleadType = null;
            String reportleadName = null;
            String reportassetName = null;
            String reporttenantCode = null;
            String reporttenantName = null;
            String reportCampaignName = null;
            String reportTenantType = null;
            String reportFlatName = null;
            String reportAccessoryName = null;
            String propertyName = null;
            String reportTenantCode = null;
            String reportRentPosting = null;
            String reportPenaltyTenantCode = null;
            String reportlandlordName = null;
            String reportInvoiceNo = null;
            String reportGrnNo = null;
            // String reportTenantNameTD = null;
            // String reportAssetNameTD = null;
            // String reportGrn_No = null;
            Date reportFromdate = null;
            Date reportTodate = null;
//            Date reportFromdate1 = null;
//            Date reportTodate1 = null;

            //selecting perticular report and generating path
            String reportPath = null;
            String reportitemName = null;
            String reportsupName = null;
            String reportapstatus = null;

            String reportallItemName = null;
            String reportstoreName = null;
            String reportstockstoreName = null;
            String reportitemCode = null;
            String reportItem11 = null;
            String reportStatus = null;
            String reportsupplier = null;
            String reportSNo = null;
            int reportSNo1 = 0;
            String reportReceiptNo = null;

            if (report != null) {

                if (report.equalsIgnoreCase("serviceHistory")) {
                    reporttenantCode = tenantCodeService;
                    reporttenantName = tenantNameService;
                    reportassetName = assetNameService;
                    reportFromdate = date1;
                    reportTodate = date2;
                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/serviceHistory.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/serviceHistory.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/serviceHistory.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/serviceHistory.prpt");
                    }
                }
                if (report.equalsIgnoreCase("tenantDetails")) {
                    reporttenantName = tenantNameForTD;
                    reportassetName = assetNameForTD;
                    reporttenantCode = tenantCode;
                    reportFromdate = date1;
                    reportTodate = date2;
                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/tenantDetails.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/tenantDetails.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/tenantDetails.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/tenantDetails.prpt");
                    }
                }
                if (report.equalsIgnoreCase("rentPaidHistory")) {
                    reportassetName = assetNameRent;
                    reporttenantName = tenantNameRent;
                    reportFromdate = date1;
                    reportTodate = date2;
                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/rentPaidHistory.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/rentPaidHistory.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/rentPaidHistory.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/rentPaidHistory.prpt");
                    }
                }

                if (report.equalsIgnoreCase("CampaignDetails")) {
                    reportCampaignName = campaignName;
                    reportFromdate = date1;
                    reportTodate = date2;
                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/CampaignDetails.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/CampaignDetails.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/CampaignDetails.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/CampaignDetails.prpt");
                    }
                }
                if (report.equalsIgnoreCase("VacateDetails")) {
                    reporttenantName = vacatingTenantName;
                    reportassetName = assetNameForTD;

                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/VacateDetails.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/VacateDetails.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/VacateDetails.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/VacateDetails.prpt");
                    }
                }
                if (report.equalsIgnoreCase("vacatedFlatDetails")) {
                    reportassetName = vacatedFlatAssetName;

                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/vacatedFlatDetails.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/vacatedFlatDetails.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/vacatedFlatDetails.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/vacatedFlatDetails.prpt");
                    }
                }
                if (report.equalsIgnoreCase("advancesHistory")) {
                    reporttenantName = tenantNameAdvance;
                    reportassetName = assetNameAdvance;
                    reportFromdate = date1;
                    reportTodate = date2;
                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/advancesHistory.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/advancesHistory.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/advancesHistory.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/advancesHistory.prpt");
                    }
                }
                if (report.equalsIgnoreCase("duesHistory")) {
                    reporttenantCode = tenantCodeDues;
                    reporttenantName = tenantNameDues;
                    reportassetName = assetNameDues;
                    reportFromdate = date1;
                    reportTodate = date2;
                    if (reportFormat.equalsIgnoreCase("PDF")) {
                         reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/duesHistory.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/duesHistory.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/duesHistory.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/duesHistory.prpt");
                    }
                }
                if (report.equalsIgnoreCase("leadDetails")) {
                    reportleadType = leadType;
                    reportassetName = assetName;
                    reportleadName = leadName;
                    reportFromdate = date1;
                    reportTodate = date2;
                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/leadDetails.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/leadDetails.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/leadDetails.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/leadDetails.prpt");
                    }
                }
                if (report.equalsIgnoreCase("followUpDetails")) {
                    reportleadType = leadTypeFollowUp;
                    reportleadName = leadNameFollowUp;
                    reportFromdate = date1;
                    reportTodate = date2;
                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/followUpDetails.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/followUpDetails.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/followUpDetails.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/followUpDetails.prpt");
                    }
                }
                if (report.equalsIgnoreCase("grnReport")) {
                    // = grnNo;
                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/grnReport.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/grnReport.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/grnReport.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/grnReport.prpt");
                    }
                }
                if (report.equalsIgnoreCase("amountDuesHistory")) {
                    reportassetName = amountDuesAssetName;
                    reporttenantName = amountDuesTenantName;
                    reportFromdate = date1;
                    reportTodate = date2;

                    // if(billCycle.equals("Monthly")){
                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/amountDuesHistory.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/amountDuesHistory.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/amountDuesHistory.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/amountDuesHistory.prpt");
                    }
                    //}
//                    if(billCycle.equals("Quarterly")){
//                        if (reportFormat.equalsIgnoreCase("PDF")) {
//                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/amountDuesQuarterly.prpt");
//                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
//                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/amountDuesQuarterly.prpt");
//                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
//                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/amountDuesQuarterly.prpt");
//                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
//                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/amountDuesQuarterly.prpt");
//                    }
//                    }
//                    if(billCycle.equals("Half Yearly")){
//                        if (reportFormat.equalsIgnoreCase("PDF")) {
//                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/amountDuesHalfYearly.prpt");
//                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
//                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/amountDuesHalfYearly.prpt");
//                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
//                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/amountDuesHalfYearly.prpt");
//                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
//                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/amountDuesHalfYearly.prpt");
//                    }
//                    }
//                    if(billCycle.equals("Yearly")){
//                        if (reportFormat.equalsIgnoreCase("PDF")) {
//                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/amountDuesYearly.prpt");
//                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
//                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/amountDuesYearly.prpt");
//                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
//                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/amountDuesYearly.prpt");
//                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
//                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/amountDuesYearly.prpt");
//                    }
//                    }

                }
                if (report.equalsIgnoreCase("PDCDetails")) {
                    reportassetName = assetNamePDC;
                    reportFromdate = date1;
                    reportTodate = date2;

                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/PDCDetailsReport.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/PDCDetailsReport.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/PDCDetailsReport.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/PDCDetailsReport.prpt");
                    }
                }
                if (report.equalsIgnoreCase("penaltyReport")) {
                    propertyName = penaltyAssetName;
                    reportPenaltyTenantCode = penaltyTenantCode;
                    reportFromdate = date1;
                    reportTodate = date2;
                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/penaltyReport.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/penaltyReport.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/penaltyReport.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/penaltyReport.prpt");
                    }
                }
                //made by pavi
                if (report.equalsIgnoreCase("TenantHistory")) {
                    reportFromdate = date1;
                    reportTodate = date2;
                    reporttenantName = tenantNameForTD;
                    reportassetName = assetNameForTD;
                    reportFlatName = depreFlatName;

                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/TenantHistory.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/TenantHistory.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/TenantHistory.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/TenantHistory.prpt");
                    }
                }
                if (report.equalsIgnoreCase("rentanalysis")) {
                    reportFromdate = date1;
                    reportTodate = date2;
                    reporttenantName = renttenant;
                    reportassetName = rentproperty;

                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/rentanalysis.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/rentanalysis.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/rentanalysis.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/rentanalysis.prpt");
                    }
                }
                if (report.equalsIgnoreCase("detailedreport")) {
                    reporttenantName = renttenant;
                    reportassetName = rentproperty;

                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/propertytenant.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/propertytenant.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/propertytenant.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/propertytenant.prpt");
                    }
                }
                if (report.equalsIgnoreCase("propertytenantflat")) {
                    reporttenantName = renttenant;
                    reportassetName = rentproperty;
                    reportFlatName = rentflat;

                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/propertyflattenant.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/propertyflattenant.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/propertyflattenant.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/propertyflattenant.prpt");
                    }
                }
                if (report.equalsIgnoreCase("utilityReport")) {
                    reportTenantCode = utilityTenantCode;
                    reportFromdate = date1;
                    reportTodate = date2;

                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/UtilityDetailsReport.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/UtilityDetailsReport.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/UtilityDetailsReport.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/UtilityDetailsReport.prpt");
                    }
                }
                if (report.equalsIgnoreCase("rentPostingReport")) {
                    reportRentPosting = rentPosting;
                    reportlandlordName = landlordName;
                    reportFromdate = date1;
                    reportTodate = date2;
                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/rentPostingReport.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/rentPostingReport.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/rentPostingReport.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/rentPostingReport.prpt");
                    }
                }

                if (report.equalsIgnoreCase("agreementRenewalDetails")) {
                    reportassetName = assetNameRenewal;
                    reporttenantName = tenantNameRenewal;
                    reportFromdate = date1;
                    reportTodate = date2;

                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/tenantAgreementRenewalReport.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/tenantAgreementRenewalReport.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/tenantAgreementRenewalReport.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/tenantAgreementRenewalReport.prpt");
                    }
                }
                if (report.equalsIgnoreCase("complaintReport")) {
                    reportassetName = complaintAssetName;
                    reportFromdate = date1;
                    reportTodate = date2;
                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/complaintReport.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/complaintReport.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/complaintReport.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/complaintReport.prpt");
                    }
                }
                if (report.equalsIgnoreCase("depreciationDetails")) {
                    if ("Property".equals(depreAssetType)) {
                        reportassetName = depreAssetName;
                        reportFromdate = date1;
                        reportTodate = date2;
                        if (reportFormat.equalsIgnoreCase("PDF")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/FixedAssetAndDepreciationReport.prpt");
                        } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/FixedAssetAndDepreciationReport.prpt");
                        } else if (reportFormat.equalsIgnoreCase("HTML")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/FixedAssetAndDepreciationReport.prpt");
                        } else if (reportFormat.equalsIgnoreCase("CSV")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/FixedAssetAndDepreciationReport.prpt");
                        }
                    }
                    if ("Accessories".equals(depreAssetType)) {
                        reportassetName = depreAssetName;
                        reportFlatName = depreFlatName;
                        reportFromdate = date1;
                        reportTodate = date2;
                        reportAccessoryName = depreAccessoryName;
                        if (reportFormat.equalsIgnoreCase("PDF")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/FixedAccessoryAndDepreciationReport.prpt");
                        } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/FixedAccessoryAndDepreciationReport.prpt");
                        } else if (reportFormat.equalsIgnoreCase("HTML")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/FixedAccessoryAndDepreciationReport.prpt");
                        } else if (reportFormat.equalsIgnoreCase("CSV")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/FixedAccessoryAndDepreciationReport.prpt");
                        }
                    }

                }

                if (dcnNo != null) {
                    reportInvoiceNo = dcnNo;
                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/invoicePrint.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/invoicePrint.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/invoicePrint.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/invoicePrint.prpt");
                    }
                }

                if (GrnNo != null) {
                    reportGrnNo = GrnNo;

                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/grnPrint.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/grnPrint.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/grnPrint.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/grnPrint.prpt");
                    }
                }

                if (report.equalsIgnoreCase("grnDetails")) {
                    if (itemName.equalsIgnoreCase("All")) {
                        reportallItemName = itemName;
                        reportFromdate = date1;
                        reportTodate = date2;
                        if (reportFormat.equalsIgnoreCase("PDF")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/allitemwiseGRN.prpt");
                        } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/allitemwiseGRN.prpt");
                        } else if (reportFormat.equalsIgnoreCase("HTML")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/allitemwiseGRN.prpt");
                        } else if (reportFormat.equalsIgnoreCase("CSV")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/allitemwiseGRN.prpt");
                        }
                    } else {
                        reportitemName = itemName;
                        reportFromdate = date1;
                        reportTodate = date2;
                        if (reportFormat.equalsIgnoreCase("PDF")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/itemwiseGRN.prpt");
                        } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/itemwiseGRN.prpt");
                        } else if (reportFormat.equalsIgnoreCase("HTML")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/itemwiseGRN.prpt");
                        } else if (reportFormat.equalsIgnoreCase("CSV")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/itemwiseGRN.prpt");
                        }
                    }

                }
                if (report.equalsIgnoreCase("materialReturn")) {
                    reportsupplier = supplier;
                    reportFromdate = date1;
                    reportTodate = date2;
                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/supplierwiseMR.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/supplierwiseMR.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/supplierwiseMR.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/supplierwiseMR.prpt");
                    }

                }

                if (report.equalsIgnoreCase("itemSummary")) {
                    reportstoreName = storeName;
                    reportFromdate = date1;
                    reportTodate = date2;
                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/sumTotalstockReport.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/sumTotalstockReport.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/sumTotalstockReport.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/sumTotalstockReport.prpt");
                    }
                }

                if (report.equalsIgnoreCase("stockReport")) {
                    reportstockstoreName = storeName;
                    reportFromdate = date1;
                    reportTodate = date2;

                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/stockReport.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/stockReport.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/stockReport.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/stockReport.prpt");
                    }
                }

                if (report.equalsIgnoreCase("stockadjustment")) {
                    if (itemName.equalsIgnoreCase("All")) {
                        reportallItemName = itemName;
                        reportstockstoreName = storeName;
                        reportFromdate = date1;
                        reportTodate = date2;

                        if (reportFormat.equalsIgnoreCase("PDF")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/FullStockAdjustment.prpt");
                        } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/FullStockAdjustment.prpt");
                        } else if (reportFormat.equalsIgnoreCase("HTML")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/FullStockAdjustment.prpt");
                        } else if (reportFormat.equalsIgnoreCase("CSV")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/FullStockAdjustment.prpt");
                        }
                    } else {
                        reportallItemName = itemName;
                        reportstockstoreName = storeName;
                        reportFromdate = date1;
                        reportTodate = date2;

                        if (reportFormat.equalsIgnoreCase("PDF")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/ItemWiseStockAdjustment.prpt");
                        } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/ItemWiseStockAdjustment.prpt");
                        } else if (reportFormat.equalsIgnoreCase("HTML")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/ItemWiseStockAdjustment.prpt");
                        } else if (reportFormat.equalsIgnoreCase("CSV")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/ItemWiseStockAdjustment.prpt");
                        }
                        
                    }
                }
                if (report.equalsIgnoreCase("TenantDemo")) {

                    reporttenantName = tenantNameForTD;
                    reportassetName = assetNameForTD;

                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/TenantDemo.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/TenantDemo.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/TenantDemo.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/TenantDemo.prpt");
                    }
                }
                if (report.equalsIgnoreCase("supplierDetails")) {
                    reportsupName = supName;
                    reportassetName = propertyname;
                    reportFlatName = flatname;
                    reportFromdate = date1;
                    reportTodate = date2;
                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/supWisePurchOrder.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/supWisePurchOrder.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/supWisePurchOrder.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/supWisePurchOrder.prpt");
                    }
                }
                if (report.equalsIgnoreCase("itemwisedata")) {
                    reportitemName = itemName;
                    reportassetName = propertyname;
                    reportFlatName = flatname;
                    reportFromdate = date1;
                    reportTodate = date2;
                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/itemwisedata.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/itemwisedata.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/itemwisedata.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/itemwisedata.prpt");
                    }
                }
                if (report.equalsIgnoreCase("Approvalstatusdetails")) {
                    reportapstatus = apstatus;
                    reportassetName = propertyname;
                    reportFlatName = flatname;
                    reportFromdate = date1;
                    reportTodate = date2;
                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/Approvalstatusdetails.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/Approvalstatusdetails.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/Approvalstatusdetails.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/Approvalstatusdetails.prpt");
                    }
                }
                if (report.equalsIgnoreCase("datewisepurchaseddata")) {
                    reportFromdate = date1;
                    reportTodate = date2;
                    reportassetName = propertyname;
                    reportFlatName = flatname;

                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/datewisepurchaseddata.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/datewisepurchaseddata.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/datewisepurchaseddata.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/datewisepurchaseddata.prpt");
                    }
                }

                //NEWLY ADDED BY LAKSHMI FOR NOTIFICATION ON 01MAR2019
                if (report.equalsIgnoreCase("defaultRentPaymentPrint")) {
                    FileName = "NotificationLetter";
                    reportSNo = rentSNo;
                    RentNotificationProcedure.callOracleStoredProcINParameter();
                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/NotificationLetter.prpt");
                    }
//                    else if (reportFormat.equalsIgnoreCase("EXCEL")) {
//                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("//prptFiles//NotificationLetter.prpt");
//                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
//                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("//prptFiles//NotificationLetter.prpt");
//                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
//                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("//prptFiles//NotificationLetter.prpt");
//                    }

                }

                //NEWLY ADDED BY LAKSHMI FOR Rent Invoice ON 16Apr2019
                if (report.equalsIgnoreCase("rentInvoicePrint")) {
                    FileName = FileName.replace(FileName, "rentInvoicePrint");
                    System.out.println("SNo" + reportSNo1);
                    reportSNo1 = Integer.parseInt(rentSNo);
                    System.out.println("Before Procedure call");
                    System.out.println("SNo=" + reportSNo1);
                    RentNotificationProcedure.callOracleStoredProcINParameterRentInvoice1(reportSNo1);
                    System.out.println("Procedure call done with parameter");
                    
//                       @RequestMapping("/service/statusUpdate.htm")
//    public ModelAndView statusUpdate(HttpServletRequest req, HttpServletResponse response) throws HibernateException, SQLException {
//        ModelMap modelMap = new ModelMap();
//        HttpSession session = req.getSession(true);
//        String userId = session.getAttribute("userId").toString();
//        String remarks = req.getParameter("remarks");
//        String action = req.getParameter("action");
//        String SNo = req.getParameter("sno");
//        java.util.Date newdate = new java.util.Date();
//        String appdate = formatter.format(newdate);
//        serviceRequestDAO.statusAppUpdate(action, remarks, userId, SNo, appdate);
//        return new ModelAndView(new RedirectView("requestAccomodationList.htm"), modelMap);statusInvoiceUpdate
//    }
                    
                    tenantDetailsDAO.statusInvoiceUpdate(rentSNo,invoice,tenantId);
                    
                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/rentInvoice.prpt");
                    }
//                    else if (reportFormat.equalsIgnoreCase("EXCEL")) {
//                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("//prptFiles//NotificationLetter.prpt");
//                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
//                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("//prptFiles//NotificationLetter.prpt");
//                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
//                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("//prptFiles//NotificationLetter.prpt");
//                    }

                }

                //NEWLY ADDED BY LAKSHMI FOR Rent Receipt ON 19Apr2019
                if (report.equalsIgnoreCase("receiptPrint")) {
                    FileName = "receiptPrint";
                    FileName = FileName.replace(FileName, "receiptPrint");
                    reportReceiptNo = receiptNo;
                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/receiptPrint.prpt");
                  }
//                    else if (reportFormat.equalsIgnoreCase("EXCEL")) {
//                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("//prptFiles//NotificationLetter.prpt");
//                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
//                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("//prptFiles//NotificationLetter.prpt");
//                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
//                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("//prptFiles//NotificationLetter.prpt");
//                    }

                }
                
                  if (report.equalsIgnoreCase("receiptPrint2")) {
                    FileName = "receiptPrint2";
                    FileName = FileName.replace(FileName, "receiptPrint2");
                    reportReceiptNo = receiptNo;
                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/receiptPrint2.prpt");
                    }
//                    else if (reportFormat.equalsIgnoreCase("EXCEL")) {
//                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("//prptFiles//NotificationLetter.prpt");
//                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
//                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("//prptFiles//NotificationLetter.prpt");
//                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
//                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("//prptFiles//NotificationLetter.prpt");
//                    }

                }
                
                
                //NEWLY ADDED BY LAKSHMI FOR cheque bounds print ON 02Mar2019
                if (report.equalsIgnoreCase("chequeBoundsPrint")) {
                    FileName = "chequeBoundsPrint";
                    FileName = FileName.replace(FileName, "chequeBoundsPrint");
                    reportReceiptNo = receiptNo;
                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/chequeBoundsPrint.prpt");
                    }
//                    else if (reportFormat.equalsIgnoreCase("EXCEL")) {
//                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("//prptFiles//NotificationLetter.prpt");
//                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
//                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("//prptFiles//NotificationLetter.prpt");
//                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
//                        reportPath = "file:" + request.getSession().getServletContext().getRealPath("//prptFiles//NotificationLetter.prpt");
//                    }

                }

                // ---------------           ----------------------------------------------
                if (report.equalsIgnoreCase("PurchaseRequest")) {
                    reportFromdate = date1;
                    reportTodate = date2;
                    reportassetName = propertynamereq;
                    reportFlatName = flatnamereq;
                    if (prFilter.equalsIgnoreCase("itemcode")) {
                        reportitemCode = prItemCode;
                        reportFromdate = date1;
                        reportTodate = date2;
                        if (reportFormat.equalsIgnoreCase("PDF")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/AllPurchaseRequestItemCode.prpt");
                        } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/AllPurchaseRequestItemCode.prpt");
                        } else if (reportFormat.equalsIgnoreCase("HTML")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/AllPurchaseRequestItemCode.prpt");
                        } else if (reportFormat.equalsIgnoreCase("CSV")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/AllPurchaseRequestItemCode.prpt");
                        }
                    } else if (prFilter.equalsIgnoreCase("itemcatagory")) {
                        reportItem11 = prItemCategory;
                        if (reportFormat.equalsIgnoreCase("PDF")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/PurchaseRequestCategory.prpt");
                        } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/PurchaseRequestCategory.prpt");
                        } else if (reportFormat.equalsIgnoreCase("HTML")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/PurchaseRequestCategory.prpt");
                        } else if (reportFormat.equalsIgnoreCase("CSV")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/PurchaseRequestCategory.prpt");
                        }
                    } else if (prFilter.equalsIgnoreCase("prstatus")) {
                        reportStatus = apstatus;
                        reportFromdate = date1;
                        reportTodate = date2;
                        if (reportFormat.equalsIgnoreCase("PDF")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/PurchaseRequestStatusWise.prpt");
                        } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/PurchaseRequestStatusWise.prpt");
                        } else if (reportFormat.equalsIgnoreCase("HTML")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/PurchaseRequestStatusWise.prpt");
                        } else if (reportFormat.equalsIgnoreCase("CSV")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/PurchaseRequestStatusWise.prpt");
                        }
                    } else if (prFilter.equalsIgnoreCase("prapproval")) {
                        reportFromdate = date1;
                        reportTodate = date2;
                        if (reportFormat.equalsIgnoreCase("PDF")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/PurchaseRequestApproveDateWise.prpt");
                        } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/PurchaseRequestApproveDateWise.prpt");
                        } else if (reportFormat.equalsIgnoreCase("HTML")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/PurchaseRequestApproveDateWise.prpt");
                        } else if (reportFormat.equalsIgnoreCase("CSV")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/PurchaseRequestApproveDateWise.prpt");
                        }
                    } else if (prFilter.equalsIgnoreCase("prdate")) {
                        reportFromdate = date1;
                        reportTodate = date2;
                        if (reportFormat.equalsIgnoreCase("PDF")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/PurchaseRequestRequiredDateWise.prpt");
                        } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/PurchaseRequestRequiredDateWise.prpt");
                        } else if (reportFormat.equalsIgnoreCase("HTML")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/PurchaseRequestRequiredDateWise.prpt");
                        } else if (reportFormat.equalsIgnoreCase("CSV")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/PurchaseRequestRequiredDateWise.prpt");
                        }
                    } else if (prFilter.equalsIgnoreCase("pdate")) {
                        reportFromdate = date1;
                        reportTodate = date2;
                        if (reportFormat.equalsIgnoreCase("PDF")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/PurchaseRequestDateWise.prpt");
                        } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/PurchaseRequestDateWise.prpt");
                        } else if (reportFormat.equalsIgnoreCase("HTML")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/PurchaseRequestDateWise.prpt");
                        } else if (reportFormat.equalsIgnoreCase("CSV")) {
                            reportPath = "file:" + request.getSession().getServletContext().getRealPath("/prptFiles/PurchaseRequestDateWise.prpt");
                        }
                    }

                    //PurchaseRequestStatusWise
                }

                //  ---------------------------------------------------------------------------
            }

            // setting report parameters apstatus
            HashMap reportParams = new HashMap();

            reportParams.put("date1", reportFromdate);
            reportParams.put("date2", reportTodate);
            reportParams.put("startDate", reportFromdate);
            reportParams.put("endDate", reportTodate);
            reportParams.put("tenant_Code", reporttenantCode);
            reportParams.put("l_LeadType", reportleadType);
            reportParams.put("l_LeadName", reportleadName);
            reportParams.put("l_AssetName", reportassetName);
            reportParams.put("asset_Name", reportassetName);
            reportParams.put("tenant_Name", reporttenantName);
            reportParams.put("Tenant_Type", reportTenantType);
            reportParams.put("campaignName", reportCampaignName);
            reportParams.put("sub_Asset_Name", reportFlatName);
            reportParams.put("accessories_Name", reportAccessoryName);
            reportParams.put("propertyName", propertyName);
            reportParams.put("tenantCode", reportTenantCode);
            reportParams.put("rentpostingType", reportRentPosting);
            reportParams.put("penaltyTenantCode", reportPenaltyTenantCode);
            reportParams.put("landlordName", reportlandlordName);
            reportParams.put("grnNo", grnNo);
            reportParams.put("InvoiceNo", reportInvoiceNo);
            reportParams.put("GrnNo", reportGrnNo);
            reportParams.put("itemmn", reportitemName);
            reportParams.put("item", reportitemName);
            reportParams.put("supllier", reportsupName);
            reportParams.put("campaign_status", reportapstatus);
            reportParams.put("itemnn", reportItem11);
            reportParams.put("Item", reportitemCode);
            reportParams.put("pr_status", reportStatus);
            reportParams.put("allitem", reportallItemName);
            reportParams.put("strr", reportstoreName);
            reportParams.put("storeName", reportstockstoreName);
            reportParams.put("fromdate", reportFromdate);
            reportParams.put("todate", reportTodate);
            reportParams.put("supplier", reportsupplier);
            reportParams.put("SNo", reportSNo);
            reportParams.put("SNo1", reportSNo1);
            reportParams.put("receiptNo", reportReceiptNo);

            //calling method for generating report apstatus
            areteshowReport(response, reportPath, reportFormat, FileName, reportParams);
        } catch (ResourceLoadingException ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /*
     below method will generate report
     */
    public void areteshowReport(HttpServletResponse response, String reportPath, String reportFormat, String FileName, HashMap reportParams) throws ResourceLoadingException {
        try {
            MYLOG.info(" ReportLoader loadReport() method ############### START");
            Format formatter = new SimpleDateFormat("dd-MM-yyyy");//hh:mm:ssa
            //Format formatter = new SimpleDateFormat("dd-MM-yyyy hh:mm:ssa");//hh:mm:ssa
            ClassicEngineBoot.getInstance().start();
            ResourceManager manager = new ResourceManager();
            manager.registerDefaults();
            Resource res = manager.createDirectly(new URL(reportPath), MasterReport.class);
            MasterReport report = (MasterReport) res.getResource();
            for (Object key : reportParams.keySet()) {
                report.getParameterValues().put(key.toString(), reportParams.get(key));
            }
            if (reportFormat.equalsIgnoreCase("PDF")) {
                response.setContentType("application/pdf");
                response.setHeader("cache-control", "no-cache");
                response.setHeader("Content-disposition", "attachment;filename=\"" + FileName + "" + formatter.format(new Date()) + ".pdf" + "\"");
                PdfReportUtil.createPDF(report, response.getOutputStream());
            } else if (reportFormat.equalsIgnoreCase("HTML")) {
                response.setContentType("text/html");
                response.setHeader("cache-control", "no-cache");
                response.setHeader("Content-disposition", "attachment;filename=\"" + FileName + "" + formatter.format(new Date()) + ".html" + "\"");
                HtmlReportUtil.createStreamHTML(report, response.getOutputStream());
            } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                response.setContentType("application/excel");
                response.setHeader("cache-control", "no-cache");
                response.setHeader("Content-disposition", "attachment;filename=\"" + FileName + "" + formatter.format(new Date()) + ".xls" + "\"");
                ExcelReportUtil.createXLS(report, response.getOutputStream());
            } else if (reportFormat.equalsIgnoreCase("CSV")) {
                response.setContentType("text/csv");
                response.setHeader("cache-control", "no-cache");
                response.setHeader("Content-disposition", "attachment;filename=\"" + FileName + "" + formatter.format(new Date()) + ".csv" + "\"");
                CSVReportUtil.createCSV(report, response.getOutputStream(), "UTF-8");

            }
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Print error" + e.getMessage());
            MYLOG.error(" ReportLoader loadReport() method ############### ERROR " + e.getMessage());
        }
        MYLOG.info(" ReportLoader loadReport() method ############### END");
    }

}
