/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.controller;

import com.google.gson.Gson;
import static com.lowagie.tools.BuildTutorial.action;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.IOUtils;
import org.dom4j.DocumentException;
import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.servlet.view.RedirectView;
import tenant.classes.AssetUtilityDetails;
import tenant.classes.BillPayment;
import tenant.classes.BookingPropertyDetails;
import tenant.classes.BookingPropertyDetails1;
import tenant.classes.BookingTenantDetails;
import tenant.classes.BookingTenantUtilityDetails;
import tenant.classes.ComUtility;
import tenant.classes.ContractAttach;
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
import tenant.classes.LandlordAttach;
import tenant.classes.TenantDetails;
import tenant.dao.ContractDAO;
import tenant.dao.MasterDAO;
import tenant.dao.TenantDetailsDAO;
import tenant.dao.UserDAO;
import tenant.classes.PenaltyDetails;
import tenant.classes.RentPosting;
import tenant.classes.UserRegistration;
import tenant.classes.InterestDetails;
import tenant.classes.Invoice;
import tenant.classes.ManageInvoice;
import tenant.classes.PettyCash;
import tenant.classes.PettyCashGrid;
import tenant.classes.PortalTenantDetails;
import tenant.classes.QuotationDetails;
import tenant.classes.QuotationDetails1;
import tenant.classes.ReceiptAttachment;
import tenant.classes.RentDetails;
import tenant.classes.RentDetails1;
import tenant.classes.RentNotificationProcedure;
import tenant.classes.ServiceDetails;
import tenant.classes.ServiceDetailsGrid;
import tenant.classes.ServiceDetailsGrid1;
import tenant.classes.StandardInvoice;
import tenant.classes.TenantProfilingDocument;
import tenant.classes.TenantProfilings;
import tenant.classes.TenantServices;
import tenant.classes.TenantServicesGrid;
import tenant.classes.TenantUtilityDetails;
import tenant.classes.TermsCondition;
import tenant.classes.TermsCondition1;
import tenant.classes.ThirdPartyTenantDetails;
import tenant.classes.pettyCashTransaction;
import tenant.classes.pettyCashTransactionGrid;
import tenant.dao.AssetDAO;
import tenant.dao.FinanceDetailsDAO;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.multipart.MultipartFile;
// Other necessary imports...

// Your class and methods...


/**
 *
 * @author vamsi
 */
@Controller
public class TenantController extends MultiActionController {

    Calendar now = Calendar.getInstance();
    String mod_date = now.get(Calendar.YEAR) + "/" + (now.get(Calendar.MONTH) + 1) + "/" + now.get(Calendar.DATE);
    Date date = new Date(mod_date);
    DateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
    DateFormat formatter2 = new SimpleDateFormat("dd-MM-yyyy");
    DateFormat formatter1 = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss a");
    DateFormat formatter3 = new SimpleDateFormat("dd-MMM-yyyy");
    
      DateFormat formatter5 = new SimpleDateFormat("yyyy-MM-dd");
    
    
    java.util.Date newdate = new java.util.Date();
    long t = newdate.getTime();
    java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(t);
    @Autowired
    private MasterDAO masterDAO;
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private AssetDAO assetDAO;
    @Autowired
    private TenantDetailsDAO tenantDetailsDAO;
    @Autowired
    private ContractDAO contractDAO;
    
    @Autowired
    private FinanceDetailsDAO financeDAO;
    
    
    @RequestMapping("/tenant/onHoldTenatList.htm")
    public ModelAndView onHoldTenatList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
       

        return new ModelAndView("../tenant/onHoldTenatList", map);
    }
    
    @RequestMapping("/tenant/onHoldTenatForm.htm")
    public ModelAndView onHoldTenatForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        
        
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../tenant/onHoldTenatForm", modelMap);
    }
    
    @RequestMapping("/taxManager/incomeTrackingList.htm")
    public ModelAndView incomeTrackingList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        
        
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../taxManager/incomeTrackingList", modelMap);
    }
    
    @RequestMapping("/taxManager/outgoingTrackingList.htm")
    public ModelAndView outgoingTrackingList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        
        
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../taxManager/outgoingTrackingList", modelMap);
    }
	
    
    @RequestMapping("/taxManager/filledTaxList.htm")
    public ModelAndView filledTaxList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        
        
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../taxManager/filledTaxList", modelMap);
    }
    
    @RequestMapping("/taxManager/taxAdjusmentsList.htm")
    public ModelAndView taxAdjusmentsList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        
        
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../taxManager/taxAdjusmentsList", modelMap);
    }
    
    @RequestMapping("/taxManager/openChequesList.htm")
    public ModelAndView openChequesList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        
        
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../taxManager/openChequesList", modelMap);
    }
    
    @RequestMapping("/taxManager/bouncedReturnedChequeList.htm")
    public ModelAndView bouncedReturnedChequeList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        
        
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../taxManager/bouncedReturnedChequeList", modelMap);
    }
    
    @RequestMapping("/taxManager/reconsiledChequesList.htm")
    public ModelAndView reconsiledChequesList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        
        
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../taxManager/reconsiledChequesList", modelMap);
    }
    
    @RequestMapping("/taxManager/paidChequesList.htm")
    public ModelAndView paidChequesList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        
        
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../taxManager/paidChequesList", modelMap);
    }
    
    @RequestMapping("/taxManager/cancelledChequesList.htm")
    public ModelAndView cancelledChequesList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        
        
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../taxManager/cancelledChequesList", modelMap);
    }
    
    @RequestMapping("/taxManager/paymentReconsilationForm.htm")
    public ModelAndView paymentReconsilationForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        
        
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../taxManager/paymentReconsilationForm", modelMap);
    }
    
    @RequestMapping("/taxManager/paymentReconsilationBouncedForm.htm")
    public ModelAndView paymentReconsilationBouncedForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        
        
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../taxManager/paymentReconsilationBouncedForm", modelMap);
    }
    
    @RequestMapping("/taxManager/bulkPostEntryList.htm")
    public ModelAndView bulkPostEntryList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        
        
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../taxManager/bulkPostEntryList", modelMap);
    }
    
    @RequestMapping("/taxManager/bulkReconsilationList.htm")
    public ModelAndView bulkReconsilationList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        
        
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../taxManager/bulkReconsilationList", modelMap);
    }
    

//---------------------Tenant Details Start---------------------------------------------//
//**************Tenant Details List******************//
    @RequestMapping("/tenant/tenantDetailsList.htm")
    public ModelAndView tenantDetailsList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
        
        String toDate = request.getParameter("toDate");
        if (fromDate != null && toDate != null) {
            if (fromDate.contains("frdate") && toDate.contains("todate")) {
                fromDate = null;
                toDate = null;
            }
        }
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Tenant Details", "Tenant Details"));
        if (fromDate == null || toDate == null) {
            map.addAttribute("contCreat", contractDAO.list("", "ContractCreation"));
            map.addAttribute("tenantDetails", tenantDetailsDAO.tenantDetailsList(sno));
        } else {
            map.addAttribute("contCreat", contractDAO.clist1("", "ContractCreation", fromDate, toDate));
            map.addAttribute("tenantDetails", tenantDetailsDAO.tenantDetailsList1(sno, fromDate, toDate));

        }
        tenantDetailsDAO.updatetenantstatus();

        return new ModelAndView("../tenant/tenantDetailsList", map);
    }
    
    @RequestMapping("/tenant/rentInvoicePDC.htm")
    public ModelAndView rentInvoicePDC(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        
        return new ModelAndView("../tenant/rentInvoicePDC", map);
    }
    
    @RequestMapping("/tenant/rentInvoiceGeneral.htm")
    public ModelAndView rentInvoiceGeneral(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        
        return new ModelAndView("../tenant/rentInvoiceGeneral", map);
    }
    
    @RequestMapping("/tenant/serviceInvoices.htm")
    public ModelAndView serviceInvoices(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        
        return new ModelAndView("../tenant/serviceInvoices", map);
    }
    
    
       @RequestMapping("/tenant/otherInvoices.htm")
    public ModelAndView otherInvoices(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        
        return new ModelAndView("../tenant/otherInvoices", map);
    }
    
          @RequestMapping("/tenant/bookedInvoices.htm")
    public ModelAndView bookedInvoices(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        
        return new ModelAndView("../tenant/bookedInvoices", map);
    }
    
    @RequestMapping("/management/utilityManagementList.htm")
    public ModelAndView utilityManagementList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        
        map.addAttribute("utilityManagementList", tenantDetailsDAO.individualUtilityList(userId, null)); 
       return new ModelAndView("../management/utilityManagementList", map);
    }
    
    // Tenant services
    @RequestMapping("/management/tenantServicesList.htm")
    public ModelAndView tenantServicesList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
//        String roleName = session.getAttribute("userRole").toString();
        String sNo = request.getParameter("pk");
//        String fromDate = request.getParameter("fromDate");
        
        map.addAttribute("tenantServicesList", tenantDetailsDAO.tenantServicesList(userId, null)); 
        return new ModelAndView("../management/tenantServicesList", map);
    }
    
     @RequestMapping("/management/tenantServicesForm.htm")
    public ModelAndView tenantServicesForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        
        String sNo = request.getParameter("pk");
        String propertyName = request.getParameter("propertyName");
        String action = request.getParameter("action");
//        List<TenantUtilityDetails> gridData = new ArrayList<TenantUtilityDetails>();

        if(sNo != null) {
            modelMap.addAttribute("tenantServicesList", tenantDetailsDAO.tenantServicesList(userId, sNo));
            modelMap.addAttribute("tenantServicesId", tenantDetailsDAO.tenantServicesId(userId, propertyName));
            modelMap.addAttribute("action", action);
        }
        
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../management/tenantServicesForm", modelMap);
    }
    
    
//    @RequestMapping(value = "/management/tenantServicesFormSubmit.htm", method = RequestMethod.POST)
//    public ModelAndView tenantServicesFormSubmit(HttpServletRequest request, HttpServletResponse response){
//         ModelMap modelMap = new ModelMap(); 
//        HttpSession session = request.getSession(true);
//        String userId = session.getAttribute("userId").toString();
////        String userId = request.getParameter("userId");
//        String sNo = request.getParameter("pk");
//        String propertyName = request.getParameter("jointeeName1");
//        String unitNameNo = request.getParameter("jointeeName2");
//        String tenantName = request.getParameter("jointeeName3");
//        String noOfServices = request.getParameter("");
//        String totalMonthlyCharges = request.getParameter("");
//        String[] serviceName = request.getParameterValues("documentName");
//        String[] fixedServiceCharges = request.getParameterValues("documentType");
//        String[] serviceChargesInterval = request.getParameterValues("documentDateOfUploadDate");
//        String[] serviceCharges = request.getParameterValues("documentExpirtyDate");
//        String[] ServiceChargeMonthlyAmount = request.getParameterValues("documentExpirtyDate");
//        String TotalMonthlyServiceCharge = request.getParameter("total");
//        String status = request.getParameter("status");
//        
//        LocalDateTime currentDateTime = LocalDateTime.now();
//        DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss a");
//        
//         List<TenantServices> gridData1 = new ArrayList<TenantServices>();
//         
//         try {
//            if (sNo == null || sNo.equals("")){
//             TenantServices it = new TenantServices(userId, propertyName, unitNameNo, tenantName, "", "", newdate, true);
//             //gridData1.add(it); 
//             
//             tenantDetailsDAO.newTenantServicesListSave(it);
//             
//             try {
//                      if(serviceName != null) {
//                          for (int i = 0; i < serviceName.length; i++) {
//                              TenantServicesGrid os=new TenantServicesGrid(userId, propertyName, serviceName[i],
//                                      fixedServiceCharges[i], serviceChargesInterval[i], serviceCharges[i], ServiceChargeMonthlyAmount[i], TotalMonthlyServiceCharge, newdate, true); //uploadFileGrid[i]
//                              tenantDetailsDAO.newTenantServicesGridListSave(os);
//                          }
//                      }
//                  } catch(Exception ex) {
//                      ex.printStackTrace();
//                  }
//             
//         }
//            else{
//             
//             TenantServices it = new TenantServices(Integer.parseInt(sNo), userId, propertyName, unitNameNo, tenantName, noOfServices, totalMonthlyCharges, newdate, true);
//             
//             tenantDetailsDAO.newTenantServicesListSave(it);
//             
//             try {
//                      if(serviceName != null) {
//                          for (int i = 0; i < serviceName.length; i++) {
//                              TenantServicesGrid os=new TenantServicesGrid(Integer.parseInt(sNo), userId, propertyName, serviceName[i],
//                                      fixedServiceCharges[i], serviceChargesInterval[i], serviceCharges[i], ServiceChargeMonthlyAmount[i], TotalMonthlyServiceCharge, newdate, true);
//                              tenantDetailsDAO.newTenantServicesGridListSave(os);
//                              
//                          }
//                      }
//                  } catch(Exception ex) {
//                      ex.printStackTrace();
//                  }
//         }
//        } catch (Exception e) {
//        }
//       
//        
//        return new ModelAndView(new RedirectView("../management/tenantServicesList.htm"), modelMap);
//    }
    
    @RequestMapping("/management/tenantServicesFormSub.htm")
    public ModelAndView tenantServicesFormSub(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap(); 
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String sNo = request.getParameter("pk");
        String propertyName = request.getParameter("jointeeName1");
        String unitNameNo = request.getParameter("jointeeName2");
        String tenantName = request.getParameter("jointeeName3");
        String noOfServices = request.getParameter("");
        String totalMonthlyCharges = request.getParameter("");
        String[] serviceName = request.getParameterValues("documentName");
        String[] fixedServiceCharges = request.getParameterValues("documentType");
        String[] serviceChargesInterval = request.getParameterValues("documentDateOfUploadDate");
        String[] serviceCharges = request.getParameterValues("documentExpirtyDate");
        String[] ServiceChargeMonthlyAmount = request.getParameterValues("documentExpirtyDate1");
        String TotalMonthlyServiceCharge = request.getParameter("total");
        String status = request.getParameter("status");
        
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        
         List<TenantServices> gridData1 = new ArrayList<TenantServices>();
         
         try {
            if (sNo == null || sNo.equals("")){
             TenantServices it = new TenantServices(userId, propertyName, unitNameNo, tenantName, "", "", today, true);
             //gridData1.add(it); 
             
             tenantDetailsDAO.newTenantServicesListSave(it);
             
             try {
                      if(serviceName != null) {
                          for (int i = 0; i < serviceName.length; i++) {
                              TenantServicesGrid os=new TenantServicesGrid(userId, propertyName, serviceName[i],
                                      fixedServiceCharges[i], serviceChargesInterval[i], serviceCharges[i], ServiceChargeMonthlyAmount[i], TotalMonthlyServiceCharge, today, true); //uploadFileGrid[i]
                              tenantDetailsDAO.newTenantServicesGridListSave(os);
                          }
                      }
                  } catch(Exception ex) {
                      ex.printStackTrace();
                  }
             
         }
            else{
             
             TenantServices it = new TenantServices(Integer.parseInt(sNo), userId, propertyName, unitNameNo, tenantName, noOfServices, totalMonthlyCharges, today, true);
             
             tenantDetailsDAO.newTenantServicesListSave(it);
             
             try {
                      if(serviceName != null) {
                          for (int i = 0; i < serviceName.length; i++) {
                              TenantServicesGrid os=new TenantServicesGrid(Integer.parseInt(sNo), userId, propertyName, serviceName[i],
                                      fixedServiceCharges[i], serviceChargesInterval[i], serviceCharges[i], ServiceChargeMonthlyAmount[i], TotalMonthlyServiceCharge, today, true);
                              tenantDetailsDAO.newTenantServicesGridListSave(os);
                              
                          }
                      }
                  } catch(Exception ex) {
                      ex.printStackTrace();
                  }
         }
        } catch (Exception e) {
        }
       
        
        return new ModelAndView(new RedirectView("../management/tenantServicesList.htm"), modelMap);
    }
    
    @RequestMapping("/management/utilityInvoiceList.htm")
    public ModelAndView utilityInvoiceList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
        map.addAttribute("tenantCommonUtilityList", tenantDetailsDAO.tenantCommonUtilityList(userId, null));
        
        return new ModelAndView("../management/utilityInvoiceList", map);
    }
    
    @RequestMapping("/management/pendingDuesList.htm")
    public ModelAndView pendingDuesList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
        
        
        return new ModelAndView("../management/pendingDuesList", map);
    }
    
    @RequestMapping("/management/processHandOverForm.htm")
    public ModelAndView processHandOverForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
        
        
        return new ModelAndView("../management/processHandOverForm", map);
    }
    
    @RequestMapping("/management/receivedDueList.htm")
    public ModelAndView receivedDueList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
        
        
        return new ModelAndView("../management/receivedDueList", map);
    }
    
    @RequestMapping("/management/generateInvoiceList.htm")
    public ModelAndView generateInvoiceList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
        
        
        return new ModelAndView("../management/generateInvoiceList", map);
    }
    
    @RequestMapping("/management/tenantProfilingList.htm")
    public ModelAndView tenantProfilingList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
//        String roleName = session.getAttribute("userRole").toString();
        String sNo = request.getParameter("pk");
//        String fromDate = request.getParameter("fromDate");
        
        map.addAttribute("tenantProfilingList", tenantDetailsDAO.tenantProfilingList(userId, null)); 
        return new ModelAndView("../management/tenantProfilingList", map);
    }
    
    @RequestMapping("/management/tenantProfilingForm.htm")
    public ModelAndView tenantProfilingForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        
        String sno = request.getParameter("pk");
        
        String action = request.getParameter("action");
//        List<TenantUtilityDetails> gridData = new ArrayList<TenantUtilityDetails>();

        if(sno != null) {
            modelMap.addAttribute("tenantProfilingList", tenantDetailsDAO.tenantProfilingList(userId, sno));
            modelMap.addAttribute("action", action);
        }
        
        modelMap.addAttribute("action", request.getParameter("action"));
           
        return new ModelAndView("../management/tenantProfilingForm", modelMap);
    }
    
    @RequestMapping("/management/tenantProfilingFormSubmit.htm")
    public ModelAndView tenantProfilingFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
    
        ModelMap modelMap = new ModelMap(); 
        HttpSession session = request.getSession(true);
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String sno = request.getParameter("pk");
        String propertyName=request.getParameter("jointeeName1");
        String unitNumber=request.getParameter("servicename");
        String customerName=request.getParameter("serviceper");
        String contractStartDate=request.getParameter("jointeeName2");
        String contractEndDate=request.getParameter("jointeeName3");
        String customerReference=request.getParameter("jointeeName4");
        String tenantName=request.getParameter("Tenantname");
        String billingDate=request.getParameter("jointeeName6");
        String renewalDate=request.getParameter("jointeeName7");
        String vacateCode=request.getParameter("jointeeName8");
        String vacateNoticeDate=request.getParameter("startDate");
        String vacateReasonType=request.getParameter("jointeeName9");
        String tenatativeVacateDate=request.getParameter("endDate");
        String vacateLetterAttachment=request.getParameter("serviceinterval");
        String doYouWantToRegister=request.getParameter("RegisterCheck");
        String TenantPhone=request.getParameter("Tenantphone");
        String TenantEmail=request.getParameter("Tenantemail");
        String TenantIdcardType=request.getParameter("Tenantcard");
        String TenantCardNum=request.getParameter("TenantcardNum");
        String Tenantaddress=request.getParameter("Tenantaddress");
        String Tenantattachment=request.getParameter("Tenantattachment");
        
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss a");
         
        Date contractStartDate1 = null;
        Date contractEndDate1 = null;
        Date billingDate1 = null;
        Date renewalDate1 = null;
        Date vacateNoticeDate1 = null;
        Date tenatativeVacateDate1 = null;
        try {
            if (contractStartDate != null || !contractStartDate.equals("")) {
                contractStartDate1 = (Date) formatter2.parse(contractStartDate);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        try {
            if (contractEndDate != null || !contractEndDate.equals("")) {
                contractEndDate1 = (Date) formatter2.parse(contractEndDate);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        try {
            if (billingDate != null || !billingDate.equals("")) {
                billingDate1 = (Date) formatter2.parse(billingDate);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        try {
            if (renewalDate != null || !renewalDate.equals("")) {
                renewalDate1 = (Date) formatter2.parse(renewalDate);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        try {
            if (vacateNoticeDate != null || !vacateNoticeDate.equals("")) {
                vacateNoticeDate1 = (Date) formatter2.parse(vacateNoticeDate);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        try {
            if (tenatativeVacateDate != null || !tenatativeVacateDate.equals("")) {
                tenatativeVacateDate1 = (Date) formatter2.parse(tenatativeVacateDate);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        //course added or not
        if(doYouWantToRegister != null) {
            if(doYouWantToRegister.equals("Yes")) {
                doYouWantToRegister = "Yes";
            } else {
                doYouWantToRegister = "No";
            }
        }
        if(doYouWantToRegister == null) {
            doYouWantToRegister = "No";
        }
        
        List<TenantProfilings> gridData1 = new ArrayList<TenantProfilings>();
         
         if (sno == null || sno.equals("")){
             TenantProfilings it = new TenantProfilings(orgId, userId, propertyName, unitNumber, customerName, contractStartDate1, contractEndDate1, customerReference, tenantName, billingDate1, renewalDate1, vacateCode, vacateNoticeDate1, vacateReasonType, tenatativeVacateDate1, vacateLetterAttachment,Boolean.parseBoolean(doYouWantToRegister), TenantPhone, TenantEmail, TenantIdcardType, TenantCardNum, Tenantaddress, Tenantattachment, newdate, Boolean.TRUE);
             gridData1.add(it);
             
             tenantDetailsDAO.tenantProfilingListSave(gridData1);
             
//             // saving document grid
//            String documentName[] = request.getParameterValues("jointeeName2");
//            String documentType[] = request.getParameterValues("jointeeName2");
//            String documentDateOfUploadDate[] = request.getParameterValues("jointeeName2");
//            String documentExpirtyDate[] = request.getParameterValues("jointeeName2");
//            String documentCategory= request.getParameter("jointeeName2");
////            String reminderDate[] = request.getParameterValues("reminderDate");
////            String reminderNote[] = request.getParameterValues("reminderNote");
//            
//            List<MultipartFile> multipartFiles = ((MultipartHttpServletRequest) request).getFiles("attachments");
//
//            final String dir = System.getProperty("user.dir");
//            File f = new File(dir);
//            String path = f.getParent();
//            f = new File(path);
//
//            try {
//                int fileLength = 0;
//
//                List<TenantProfilingDocument> list = new ArrayList<TenantProfilingDocument>();
//                
//                for(int k = 0; k < documentName.length; k++) {
//                    Date documentDateOfUploadDate1 = null;
//                    if (!"".equals(documentDateOfUploadDate[k]) && documentDateOfUploadDate[k] != null) {
//                        documentDateOfUploadDate1 = (Date) formatter2.parse(documentDateOfUploadDate[k]);
//                    }
//
//                    Date documentExpirtyDate1 = null;
//                    if (!"".equals(documentExpirtyDate[k]) && documentExpirtyDate[k] != null) {
//                        documentExpirtyDate1 = (Date) formatter2.parse(documentExpirtyDate[k]);
//                    }
//                    
//                            
//////                    Date reminderDate1 = null;
//////                    if (!"".equals(reminderDate[k]) && reminderDate[k] != null) {
//////                        reminderDate1 = (Date) formatter2.parse(reminderDate[k]);
//////                    }
//                    
//                    TenantProfilingDocument bdpfFile = new TenantProfilingDocument();
//                    
//                    
//                    
//                    try {
//                        MultipartFile test = (MultipartFile) multipartFiles.get(k);
//                        fileLength = test.getBytes().length;
//                        if(fileLength > 0) {
//                            bdpfFile.setFilename(test.getOriginalFilename());
//                            bdpfFile.setContent(test.getBytes());
//                            bdpfFile.setContentType(test.getContentType());
//                           
//                        }
//                    } catch(Exception ex) {
//                        ex.printStackTrace();
//                    }
//                    
//                    bdpfFile.setDocumentName(documentName[k]);
//                    bdpfFile.setDocumentType(documentType[k]);
//                    bdpfFile.setDocumentDateOfUploadDate(documentDateOfUploadDate1);
//                    bdpfFile.setDocumentExpirtyDate(documentExpirtyDate1);
//                    bdpfFile.setDocumentCategory(documentCategory);
//                    bdpfFile.setOrgId(orgId);
//                    bdpfFile.setUserId(userId);
//                    bdpfFile.setLastmodifiedDate(newdate);
//                    bdpfFile.setStatus("update0");
//                    bdpfFile.setAssetCode(vacateCode);
//
//                 
//                    
//                    list.add(bdpfFile);
//                  
//                }
//                tenantDetailsDAO.saveAssetAttach(list);
//            
//
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
             
         }else{
             
             TenantProfilings it = new TenantProfilings(Integer.parseInt(sno), orgId, userId, propertyName, unitNumber, customerName, contractStartDate1, contractEndDate1, customerReference, tenantName, billingDate1, renewalDate1, vacateCode, vacateNoticeDate1, vacateReasonType, tenatativeVacateDate1, vacateLetterAttachment,Boolean.parseBoolean(doYouWantToRegister), TenantPhone, TenantEmail, TenantIdcardType, TenantCardNum, Tenantaddress, Tenantattachment, newdate, Boolean.TRUE);
             
             tenantDetailsDAO.newTenantProfilingListSave(it);
             
//              // saving document grid
//            String documentName[] = request.getParameterValues("jointeeName2");
//            String documentType[] = request.getParameterValues("jointeeName2");
//            String documentDateOfUploadDate[] = request.getParameterValues("jointeeName2");
//            String documentExpirtyDate[] = request.getParameterValues("jointeeName2");
//            String documentCategory= request.getParameter("jointeeName2");
//////            String reminderDate[] = request.getParameterValues("reminderDate");
//////            String reminderNote[] = request.getParameterValues("reminderNote");
//            
//            List<MultipartFile> multipartFiles = ((MultipartHttpServletRequest) request).getFiles("attachments");
//
//            final String dir = System.getProperty("user.dir");
//            File f = new File(dir);
//            String path = f.getParent();
//            f = new File(path);
//
//            try {
//                int fileLength = 0;
//
//                List<TenantProfilingDocument> list = new ArrayList<TenantProfilingDocument>();
//                
//                for(int k = 0; k < documentName.length; k++) {
//                    Date documentDateOfUploadDate1 = null;
//                    if (!"".equals(documentDateOfUploadDate[k]) && documentDateOfUploadDate[k] != null) {
//                        documentDateOfUploadDate1 = (Date) formatter2.parse(documentDateOfUploadDate[k]);
//                    }
//
//                    Date documentExpirtyDate1 = null;
//                    if (!"".equals(documentExpirtyDate[k]) && documentExpirtyDate[k] != null) {
//                        documentExpirtyDate1 = (Date) formatter2.parse(documentExpirtyDate[k]);
//                    }
//                    
//                            
//////                    Date reminderDate1 = null;
//////                    if (!"".equals(reminderDate[k]) && reminderDate[k] != null) {
//////                        reminderDate1 = (Date) formatter2.parse(reminderDate[k]);
//////                    }
//                    
//                    TenantProfilingDocument bdpfFile = new TenantProfilingDocument();
//                    
//                    
//                    
//                    try {
//                        MultipartFile test = (MultipartFile) multipartFiles.get(k);
//                        fileLength = test.getBytes().length;
//                        if(fileLength > 0) {
//                            bdpfFile.setFilename(test.getOriginalFilename());
//                            bdpfFile.setContent(test.getBytes());
//                            bdpfFile.setContentType(test.getContentType());
//                           
//                        }
//                    } catch(Exception ex) {
//                        ex.printStackTrace();
//                    }
//                    
//                    bdpfFile.setDocumentName(documentName[k]);
//                    bdpfFile.setDocumentType(documentType[k]);
//                    bdpfFile.setDocumentDateOfUploadDate(documentDateOfUploadDate1);
//                    bdpfFile.setDocumentExpirtyDate(documentExpirtyDate1);
//                    bdpfFile.setDocumentCategory(documentCategory);
//                    bdpfFile.setOrgId(orgId);
//                    bdpfFile.setUserId(userId);
//                    bdpfFile.setLastmodifiedDate(newdate);
//                    bdpfFile.setStatus("update0");
//                    bdpfFile.setAssetCode(vacateCode);
//
//                 
//                    
//                    list.add(bdpfFile);
//                  
//                }
//                tenantDetailsDAO.saveAssetAttach(list);
//            
//
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//             
             
             
         }
        return new ModelAndView(new RedirectView("../management/tenantProfilingList.htm"), modelMap);
        
        }
//    
    
    
    
    
    @RequestMapping("/management/tenantExitList.htm")
    public ModelAndView tenantExitList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
        
        
        return new ModelAndView("../management/tenantExitList", map);
    }
    
    @RequestMapping("/management/individualUtilityForm.htm")
    public ModelAndView individualUtilityForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        
        String sNo = request.getParameter("pk");
        
        String action = request.getParameter("action");
//        List<TenantUtilityDetails> gridData = new ArrayList<TenantUtilityDetails>();

        if(sNo != null) {
            modelMap.addAttribute("utilityManagementList", tenantDetailsDAO.individualUtilityList(userId, sNo));
            modelMap.addAttribute("action", action);
        }
        
        modelMap.addAttribute("action", request.getParameter("action"));
           
        return new ModelAndView("../management/individualUtilityForm", modelMap);
    }
    
    @RequestMapping("/management/individualUtilityFormSubmit.htm")
    public ModelAndView individualUtilityFormSubmit(HttpServletRequest request, HttpServletResponse response) throws SQLException {
    
        ModelMap modelMap = new ModelMap(); 
        HttpSession session = request.getSession(true);
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String sNo = request.getParameter("pk");
        String propertyName=request.getParameter("jointeeName1");
        String unitNumber=request.getParameter("servicename");
        String tenantName=request.getParameter("serviceper");
        String utilityBillNumber=request.getParameter("jointeeName2");
        String utilityType=request.getParameter("jointeeName3");
        String billingStartDate=request.getParameter("startDate");
        String billingEndDate=request.getParameter("endDate");
        String fixChargeShare=request.getParameter("serviceinterval1");
        String additionalCharges=request.getParameter("serviceinterval2");
        String totalBillConsuption=request.getParameter("serviceinterval3");
        
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss a");
         
        Date billingStartDate1 = null;
        Date billingEndDate1 = null;
        
        try {
            if (billingStartDate != null || !billingStartDate.equals("")) {
                billingStartDate1 = (Date) formatter3.parse(billingStartDate);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        try {
            if (billingEndDate != null || !billingEndDate.equals("")) {
                billingEndDate1 = (Date) formatter3.parse(billingEndDate);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        
        List<IndividualUtilityManagement> gridData1 = new ArrayList<IndividualUtilityManagement>();
         
         if (sNo == null || sNo.equals("")){
             IndividualUtilityManagement it = new IndividualUtilityManagement(userId, propertyName, unitNumber, tenantName, utilityBillNumber, utilityType, billingStartDate1, billingEndDate1, fixChargeShare, additionalCharges, totalBillConsuption, newdate, Boolean.TRUE, "Active");
             gridData1.add(it);
             
             tenantDetailsDAO.individualUtilityListSave(gridData1);
             
         }else{
             
             IndividualUtilityManagement it = new IndividualUtilityManagement(Integer.parseInt(sNo), userId, propertyName, unitNumber, tenantName, utilityBillNumber, utilityType, billingStartDate1, billingEndDate1, fixChargeShare, additionalCharges, totalBillConsuption, newdate, Boolean.TRUE, "Active");
             
             tenantDetailsDAO.newIndividualUtilityListSave(it);
         }
        return new ModelAndView(new RedirectView("../management/utilityManagementList.htm"), modelMap);
        
        }
    
    @RequestMapping("/management/commonUtilityForm.htm")
    public ModelAndView commonUtilityForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String SNo = request.getParameter("pk");
        String userId = session.getAttribute("userId").toString();
        
        
        
        String action = request.getParameter("action");
//        List<TenantUtilityDetails> gridData = new ArrayList<TenantUtilityDetails>();

        if(SNo != null) {
            modelMap.addAttribute("tenantCommonUtilityList", tenantDetailsDAO.tenantCommonUtilityList(userId, SNo));
            modelMap.addAttribute("action", action);
        }
        
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../management/commonUtilityForm", modelMap);
    }
    
    @RequestMapping(value="/management/commonUtilityFormSubmit.htm",method=RequestMethod.POST)
    public ModelAndView commonUtilityFormSubmit(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap modelMap = new ModelMap(); 
        HttpSession session = request.getSession(true);
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String SNo = request.getParameter("pk");
        String propertyName=request.getParameter("jointeeName1");
        String totalUnits=request.getParameter("servicename");
        String billNumber=request.getParameter("serviceper");
        String billType=request.getParameter("jointeeName2");
        String utilityName=request.getParameter("jointeeName3");
        String billingStartDate=request.getParameter("startDate");
        String billingEndDate=request.getParameter("endDate");
        String consumptionComArea=request.getParameter("serviceinterval");
        String consumptionOthers=request.getParameter("serviceinterval2");
        String consumptionperTenant=request.getParameter("serviceinterval3");
        String fixChargeShare=request.getParameter("serviceinterval4");
        String totalPayTenant=request.getParameter("TotalperTenant");
        
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss a");
         
        Date billingStartDate1 = null;
        Date billingEndDate1 = null;
        
        try {
            if (billingStartDate != null || !billingStartDate.equals("")) {
                billingStartDate1 = (Date) formatter3.parse(billingStartDate);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        try {
            if (billingEndDate != null || !billingEndDate.equals("")) {
                billingEndDate1 = (Date) formatter3.parse(billingEndDate);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        Integer totalPayTenant1=null;
        try {
            if (fixChargeShare != null || !fixChargeShare.equals("") || consumptionperTenant != null || !consumptionperTenant.equals("")) {
              totalPayTenant1= (Integer.parseInt(fixChargeShare)  * Integer.parseInt(consumptionperTenant) )/100;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        
         List<ComUtility> gridData1 = new ArrayList<ComUtility>();
         
         if (SNo == null || SNo.equals("")){
             ComUtility it = new ComUtility(userId, propertyName, totalUnits, billNumber, billType, utilityName, billingStartDate1, billingEndDate1, consumptionComArea, consumptionOthers, consumptionperTenant, fixChargeShare,Integer.toString(totalPayTenant1) , newdate, Boolean.TRUE);
             gridData1.add(it);
             
             tenantDetailsDAO.tenantCommonUtilityListSave(gridData1);
             
         }else{
             
             ComUtility it = new ComUtility(Integer.parseInt(SNo), userId, propertyName, totalUnits, billNumber, billType, utilityName, billingStartDate1, billingEndDate1, consumptionComArea, consumptionOthers, consumptionperTenant, fixChargeShare,Integer.toString(totalPayTenant1),newdate, Boolean.TRUE);
             tenantDetailsDAO.newTenantCommonUtilityListSave(it);
         }
        
        return new ModelAndView(new RedirectView("../management/utilityInvoiceList.htm"), modelMap);
    }
    
    @RequestMapping("/tenant/receivableManagerBox.htm")
    public ModelAndView receivableManagerBox(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
        
        String toDate = request.getParameter("toDate");
       
        return new ModelAndView("../tenant/receivableManagerBox", map);
    }



    @RequestMapping("/tenant/receiableRentInvoiceForm.htm")
    public ModelAndView receiableRentInvoiceForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(false);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String invoiceno = request.getParameter("invoiceno");
        String themeType = request.getParameter("themeType");

        String SNo = request.getParameter("sno");

        String pkcom = request.getParameter("pkcom");

        if (SNo != null) {
           // modelMap.addAttribute("invoiceList", invoiceDAO.invoiceList(userId, orgId, SNo));
        }
        //Auto Generate Key  fro Invoice
        ArrayList enq = (ArrayList) financeDAO.invoiceCodeinc(userId, orgId, null, null, "1");
        
        String orderNo=null;
        String orderNo2 = null;
        String[] orderNo1 = null;
        int ordno = 1;
        if (!(enq.isEmpty())) {
            for (Iterator<StandardInvoice> iter = enq.iterator(); iter.hasNext();) {
                orderNo = iter.next().getInvoiceNo();
            }
            //orderNo1 = orderNo2.split("-");
        }
        if (orderNo != null) {
            orderNo1 = orderNo.split("-");
            ordno = Integer.parseInt(orderNo1[1]) + 1;
        }
        orderNo = "Invoice" + "-" + ordno;
        
        modelMap.addAttribute("orderNo", orderNo); 
//        modelMap.addAttribute("invoiceno", invoiceno);
//
//        modelMap.addAttribute("SNo", SNo);
//        modelMap.addAttribute("action", request.getParameter("action"));
//
//        modelMap.addAttribute("companyDetailList", invoiceDAO.companyDetailList(userId, orgId, pkcom));
//        modelMap.addAttribute("companySetList", invoiceDAO.companySetList(userId, orgId, SNo));
//        modelMap.addAttribute("productCategeryNameList", inventoryDAO.productCategeryNameList(userId, orgId, null));
//        modelMap.addAttribute("serviceCategoryNameList", inventoryDAO.serviceCategoryNameList(userId, orgId, null));
//        modelMap.addAttribute("productInventoryList", inventoryDAO.productInventoryList1(userId, orgId, null));
//        modelMap.addAttribute("serviceInventoryList", inventoryDAO.serviceInventoryList1(userId, orgId, null));
//        modelMap.addAttribute("locationList", invoiceDAO.locationList(userId, orgId, null));
//        modelMap.addAttribute("themelist", invoiceDAO.themeList(userId, orgId, null));
//        modelMap.addAttribute("selecteThemeValues", invoiceDAO.selecteThemeValues(userId, orgId, themeType));
//        modelMap.addAttribute("selectedUserAnswers", invoiceDAO.selectedUserAnswers(userId, orgId, themeType));
        return new ModelAndView("rentInvoiceForm", modelMap);

    }
    
    @RequestMapping("/tenant/standardInvoiceForm.htm")
    public ModelAndView standardInvoiceForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(false);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String invoiceno = request.getParameter("invoiceno");
        String themeType = request.getParameter("themeType");

        String SNo = request.getParameter("sno");

        String pkcom = request.getParameter("pkcom");

        if (SNo != null) {
           // modelMap.addAttribute("invoiceList", invoiceDAO.invoiceList(userId, orgId, SNo));
        }
        //Auto Generate Key  fro Invoice
        ArrayList enq = (ArrayList) financeDAO.invoiceCodeinc(userId, orgId, null, null, "1");
        
        String orderNo=null;
        String orderNo2 = null;
        String[] orderNo1 = null;
        int ordno = 1;
        if (!(enq.isEmpty())) {
            for (Iterator<StandardInvoice> iter = enq.iterator(); iter.hasNext();) {
                orderNo = iter.next().getInvoiceNo();
            }
            //orderNo1 = orderNo2.split("-");
        }
        if (orderNo != null) {
            orderNo1 = orderNo.split("-");
            ordno = Integer.parseInt(orderNo1[1]) + 1;
        }
        orderNo = "Invoice" + "-" + ordno;
        
        modelMap.addAttribute("orderNo", orderNo);
//        modelMap.addAttribute("invoiceno", invoiceno);
//
//        modelMap.addAttribute("SNo", SNo);
//        modelMap.addAttribute("action", request.getParameter("action"));
//
//        modelMap.addAttribute("companyDetailList", invoiceDAO.companyDetailList(userId, orgId, pkcom));
//        modelMap.addAttribute("companySetList", invoiceDAO.companySetList(userId, orgId, SNo));
//        modelMap.addAttribute("productCategeryNameList", inventoryDAO.productCategeryNameList(userId, orgId, null));
//        modelMap.addAttribute("serviceCategoryNameList", inventoryDAO.serviceCategoryNameList(userId, orgId, null));
//        modelMap.addAttribute("productInventoryList", inventoryDAO.productInventoryList1(userId, orgId, null));
//        modelMap.addAttribute("serviceInventoryList", inventoryDAO.serviceInventoryList1(userId, orgId, null));
//        modelMap.addAttribute("locationList", invoiceDAO.locationList(userId, orgId, null));
//        modelMap.addAttribute("themelist", invoiceDAO.themeList(userId, orgId, null));
//        modelMap.addAttribute("selecteThemeValues", invoiceDAO.selecteThemeValues(userId, orgId, themeType));
//        modelMap.addAttribute("selectedUserAnswers", invoiceDAO.selectedUserAnswers(userId, orgId, themeType));
        return new ModelAndView("standardInvoiceForm", modelMap);

    }

    @RequestMapping("/tenant/tenantDetailsForm.htm")
    public ModelAndView tenantDetailsForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        String landlordId = request.getParameter("llId");
        String contractPeriod = request.getParameter("contractPeriod");
        String assetName = request.getParameter("assetName");
        String assetCode = request.getParameter("assetCode");
        String page = request.getParameter("page");
        String tenantCode = request.getParameter("tenantCode");
        String contractName = request.getParameter("contractName");
        String Invoice = request.getParameter("invoiceNumber");
        String subclassifiedAstno = request.getParameter("subclassifiedAstno");
        List<TenantUtilityDetails> gridData = new ArrayList<TenantUtilityDetails>();

        if ("defaultRentPaymentList".equals(page)) {
            modelMap.addAttribute("tenantDetails", tenantDetailsDAO.tenantDetails1(tenantCode,sno));
            //newly added by lakshmi for thirdparty details
            modelMap.addAttribute("tenantDetails1", tenantDetailsDAO.thirdpartyTenantDetails(tenantCode, "ThirdPartyTenantDetails"));
            modelMap.addAttribute("landLordDetails", tenantDetailsDAO.landLordDetailsList(landlordId));
            modelMap.addAttribute("contractNamee", tenantDetailsDAO.selectContractCodee(contractName));
            modelMap.addAttribute("assetDetails", tenantDetailsDAO.assetDetails(assetCode));
            gridData.addAll(assetDAO.tenantUtilityDetailslist(assetCode, contractName));
            modelMap.addAttribute("assetDetails1", gridData);
            modelMap.addAttribute("subassDetails", tenantDetailsDAO.subassDetails(assetName, subclassifiedAstno));
            modelMap.addAttribute("landlordDocuments", masterDAO.landlordDocuments(landlordId));
            modelMap.addAttribute("contDocument", contractDAO.ContractAttachlist(contractName));
        } else if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("tenantDetails", tenantDetailsDAO.list(sno, "TenantDetails"));
            //newly added by lakshmi for thirdparty details
            modelMap.addAttribute("tenantDetails1", tenantDetailsDAO.list(sno, "ThirdPartyTenantDetails"));
            modelMap.addAttribute("landLordDetails", tenantDetailsDAO.landLordDetailsList(landlordId));
            modelMap.addAttribute("contractNamee", tenantDetailsDAO.selectContractCodee(contractPeriod));
            modelMap.addAttribute("assetDetails", tenantDetailsDAO.assetDetails(assetName));
            gridData.addAll(assetDAO.tenantUtilityDetailslist(assetName, contractPeriod));
            modelMap.addAttribute("assetDetails1", gridData);
            modelMap.addAttribute("subassDetails", tenantDetailsDAO.subassDetails(assetName, subclassifiedAstno));
            modelMap.addAttribute("landlordDocuments", masterDAO.landlordDocuments(landlordId));
            modelMap.addAttribute("contDocument", contractDAO.ContractAttachlist(contractPeriod));
        }

        String link = "../tenant/tenantDetailsForm.htm";
        String tab = "Tenant Details";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("fileSize", userDAO.fileSize());
        modelMap.addAttribute("tenantType", tenantDetailsDAO.tenantType());
        modelMap.addAttribute("tenantCategory", tenantDetailsDAO.tenantCategory());
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../tenant/tenantDetailsForm", modelMap);
    }

//**************Tenant Details Form******************//
//**************Tenant Details Submit******************//
    @RequestMapping("/tenant/tenantDetailsFormSubmit.htm")
    public ModelAndView tenantDetailsFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");
        String tenantCode = request.getParameter("tenantCode");
        String[] llId = request.getParameterValues("llId");
        String[] llName = request.getParameterValues("llName");
        String[] llCategory = request.getParameterValues("llCategory");
        String[] llCrNo = request.getParameterValues("llCrNo");
        String[] llContactno = request.getParameterValues("llContactno");
        String[] llWorkContactno = request.getParameterValues("llWorkContactno");
        String[] llMailid = request.getParameterValues("llMailid");
        String llAttachment = request.getParameter("llAttachment");
        String[] tenantType = request.getParameterValues("tenantType");
        String[] tenantCategory = request.getParameterValues("tenantCategory");
        String[] tenantId = request.getParameterValues("tenantId");
        String[] tenantFname = request.getParameterValues("tenantFname");
        String[] tenantLname = request.getParameterValues("tenantLname");
        String[] tenantCitizenship = request.getParameterValues("tenantCitizenship");
        String[] tenantCrNo = request.getParameterValues("tenantCrNo");
        String[] tenantContactno = request.getParameterValues("tenantContactno");
        String[] tenantWorkContactno = request.getParameterValues("tenantWorkContactno");
        String[] tenantMailid = request.getParameterValues("tenantMailid");
        String[] permanentAddress = request.getParameterValues("permanentAddress");
        String[] correspondenceAddress = request.getParameterValues("correspondenceAddress");
        String[] postalCode = request.getParameterValues("postalCode");
        String[] postboxNo = request.getParameterValues("postboxNo");
        String[] sponcerName = request.getParameterValues("sponcerName");
        String[] sponcerAddress = request.getParameterValues("sponcerAddress");
        String[] companyName = request.getParameterValues("companyName");
        String[] companyAddress = request.getParameterValues("companyAddress");
        String[] postalCode1 = request.getParameterValues("postalCode1");
        String[] postboxNo1 = request.getParameterValues("postboxNo1");
        String[] jointeeName1 = request.getParameterValues("jointeeName1");
        String[] jointeeAddress1 = request.getParameterValues("jointeeAddress1");
        String[] jointeeName2 = request.getParameterValues("jointeeName2");
        String[] jointeeAddress2 = request.getParameterValues("jointeeAddress2");
        String[] remarks = request.getParameterValues("remarks");
        String[] tenantAttachment = request.getParameterValues("tenantAttachment");
        String[] assetName = request.getParameterValues("assetCode");
        String[] assetName1 = request.getParameterValues("assetName");
        String[] subclassifiedAstno = request.getParameterValues("subclassifiedAstno");
        String[] flatNo = request.getParameterValues("flatNo");
        String[] buildingNo = request.getParameterValues("buildingNo");
        String[] wayNo = request.getParameterValues("wayNo");
        String[] assetArea = request.getParameterValues("assetArea");
        String[] blockNo = request.getParameterValues("blockNo");
        String[] plotNo = request.getParameterValues("plotNo");
        String[] streetNo = request.getParameterValues("streetNo");
        String[] waterBillno = request.getParameterValues("waterBillno");
        String[] electricityBillno = request.getParameterValues("electricityBillno");
        String[] assetPostalCode = request.getParameterValues("assetPostalCode");
        String[] assetPostboxNo = request.getParameterValues("assetPostboxNo");
        String[] contractPeriod = request.getParameterValues("contractPeriod");
        String[] contractName = request.getParameterValues("contractName");
        String[] startsFrom = request.getParameterValues("startsFrom");
        String[] endsTo = request.getParameterValues("endsTo");
        String contractAttachment = request.getParameter("contractAttachment");
        String[] billingCycle = request.getParameterValues("billingCycle");
        String[] advanceAmount = request.getParameterValues("advanceAmount");
        String[] dueDate = request.getParameterValues("dueDate");
        String[] totalAmount = request.getParameterValues("totalAmount");
        String[] discountforadvance = request.getParameterValues("DiscountforAdvance");
        String[] discountforrent = request.getParameterValues("DiscountforRent");
        String[] contractSigningDate = request.getParameterValues("contractSigningDate");
        String[] status = request.getParameterValues("status");
        String[] attachmentReference = request.getParameterValues("attachmentReference");
        String[] llOrgfileName = request.getParameterValues("llOrgfileName");
        String tenOrgfileName = request.getParameter("tenOrgfileName");
        String[] contOrgfileName = request.getParameterValues("contOrgfileName");
        String[] llSno = request.getParameterValues("llSno");
        String[] contSno = request.getParameterValues("contSno");
        String[] crIdNo = request.getParameterValues("crIdNo");
        String[] extra2 = request.getParameterValues("extra2");
        String extra3 = request.getParameter("extra3");
        String extra4 = request.getParameter("extra4");
        String extra5 = request.getParameter("extra5");
        String[] recordstatus = request.getParameterValues("recordstatus");
        String[] creationDate = request.getParameterValues("creationDate");
        String[] roomCode = request.getParameterValues("roomCode");
        String[] roomName = request.getParameterValues("roomName");
        String[] amctenantName = request.getParameterValues("amctenantName");
        String[] startDate = request.getParameterValues("startDate");
        String[] endDate = request.getParameterValues("endDate");
        String[] percentage = request.getParameterValues("percentage");
        String[] amcamount = request.getParameterValues("amcamount");
        String utility[] = request.getParameterValues("utility");
        String utilityBill[] = request.getParameterValues("utilityBill");
        String comUtility[] = request.getParameterValues("comUtility");
        String utilityBillType[] = request.getParameterValues("utilityBillType");
        String comUtilityBillType[] = request.getParameterValues("comUtilityBillType");
        String comutilityBill[] = request.getParameterValues("comutilityBill");
        String commontotalitemAmount = request.getParameter("commonitmTot");
        String totalitemAmount = request.getParameter("itmTot");
        String tot1 = request.getParameter("totalitemAmount");
        String tot2 = request.getParameter("commontotalitemAmount");
        String attname = request.getParameter("attname");
        String recordstatus1 = "Occupied";
        modelMap.addAttribute("action", request.getParameter("action"));
        String action = request.getParameter("action");

        //Newly added by lakshmi for Third party tenant details on 08mar2019
        String[] ttenantFname = request.getParameterValues("ttenantFname");
        String[] ttenantLname = request.getParameterValues("ttenantLname");
        String[] mobile = request.getParameterValues("mobile");
        String[] temail = request.getParameterValues("email");
        String[] nationality = request.getParameterValues("nationality");

        List<TenantUtilityDetails> gridData1 = new ArrayList<TenantUtilityDetails>();
        TenantUtilityDetails tenant1 = null;
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        for (int i = 0; i < tenantFname.length; i++) {

//            if (tenantCode == null || tenantCode == "" || "".equals(tenantCode)) {
//            ArrayList validuser = (ArrayList) tenantDetailsDAO.getTenantNo(llId[i]);
//            String orderNo2 = null;
//            String orderNo1[] = null;
//            int ordno = 1;
//            if (!(validuser.isEmpty())) {
//                for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
//                    orderNo2 = iter.next();
//                }
//                orderNo1 = orderNo2.split("-");
//            }
//            if (orderNo2 != null) {
//                ordno = Integer.parseInt(orderNo1[1]) + 1;
//            }
//            tenantCode = "TENANT" + "-" + ordno;
//        }
            Date startsFrom1 = null;
            if (null != startsFrom && !"".equals(startsFrom[i])) {
                startsFrom1 = (Date) formatter.parse(startsFrom[i]);
            }
            Date endsTo1 = null;
            if (null != endsTo && !"".equals(endsTo)) {
                endsTo1 = (Date) formatter.parse(endsTo[i]);
            }
            Date dueDate1 = null;
            if (dueDate != null && !"".equals(dueDate[i])) {
                dueDate1 = (Date) formatter.parse(dueDate[i]);
            }
            Date contractSigningDate1 = null;
            if (null != contractSigningDate[i] && !"".equals(contractSigningDate[i])) {
                contractSigningDate1 = (Date) formatter.parse(contractSigningDate[i]);
            }
            Date startDate1 = null;
            if (null != startDate && !"".equals(startDate[i])) {
                startDate1 = (Date) formatter.parse(startDate[i]);
            }
            Date endDate1 = null;
            if (null != endDate && !"".equals(endDate[i])) {
                endDate1 = (Date) formatter.parse(endDate[i]);
            }
            if (pk == null || pk == "" || pk.equals("")) {
                //=====================code for getting tenant code======================================
                ArrayList validuser = (ArrayList) tenantDetailsDAO.getTenantNo(llId[i]);
                String orderNo2 = null;
                String orderNo1[] = null;
                int ordno = 1;
                if (!(validuser.isEmpty())) {
                    for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
                        orderNo2 = iter.next();
                    }
                    orderNo1 = orderNo2.split("-");
                }
                if (orderNo2 != null) {
                    ordno = Integer.parseInt(orderNo1[1]) + 1;
                }
                tenantCode = "TENANT" + "-" + ordno;
                //=====================end code for getting tenant code======================================

                MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
                List<MultipartFile> multipartFile1 = multipartRequest1.getFiles("tenantAttachment");
                for (Iterator<MultipartFile> iterator = multipartFile1.iterator(); iterator.hasNext();) {
                    MultipartFile test = (MultipartFile) iterator.next();
                    tenOrgfileName = test.getOriginalFilename();
                    TenantDetails tenant = new TenantDetails(orgId, userId, tenantCode, llCategory[i], llName[i], llId[i], llCrNo[i], llContactno[i], llWorkContactno[i], llMailid[i], null, "", tenantType[i], tenantCategory[i], tenantFname[i], tenantLname[i], tenantCitizenship[i], tenantId[i], test.getBytes(), tenOrgfileName, tenantCrNo[i], companyAddress[i], postalCode1[i], tenantContactno[i], tenantWorkContactno[i], tenantMailid[i], permanentAddress[i], correspondenceAddress[i], postalCode[i], postboxNo[i], sponcerName[i], sponcerAddress[i], companyName[i], postboxNo1[i], jointeeName1[i], jointeeAddress1[i], jointeeName2[i], jointeeAddress2[i], remarks[i], assetName[i], assetName1[i], subclassifiedAstno[i], flatNo[i], buildingNo[i], wayNo[i], assetArea[i], blockNo[i], plotNo[i], streetNo[i], waterBillno[i], electricityBillno[i], assetPostalCode[i], assetPostboxNo[i], contractPeriod[i], contractName[i], startsFrom1, endsTo1, null, "", billingCycle[i], advanceAmount[i], dueDate1, totalAmount[i], discountforadvance[i], discountforrent[i], contractSigningDate1, "Direct Tenant", "Submitted", crIdNo[i], extra2[i], roomCode[i], roomName[i], extra5, "Update0", today, today);

                    tenantDetailsDAO.globalSave(tenant);
                    tenantDetailsDAO.updateSubasset(assetName[i], subclassifiedAstno[i], recordstatus1);
                    if (null != tenantType && "Shared".equals(tenantType[i])) {
                        tenantDetailsDAO.updateRoomStatus(roomCode[i], recordstatus1);
                    } else if (utility != null) {
                        for (int j = 0; j < utility.length; j++) {

                            tenant1 = new TenantUtilityDetails(contractPeriod[i], tenantCode, assetName[i], assetName1[i], "Update0", utility[j], utilityBill[j], comUtility[j], comutilityBill[j], utilityBillType[j], comUtilityBillType[j], totalitemAmount, commontotalitemAmount, today);

                            gridData1.add(tenant1);

                        }
                    }
                    assetDAO.tenantSave(gridData1);
                }

                int i1 = 0, fileLength = 0;
                String filename = "";
                MultipartHttpServletRequest multipartRequest11 = (MultipartHttpServletRequest) request;
                List<MultipartFile> multipartFile11 = multipartRequest11.getFiles("attachments");
                String documentNames[] = request.getParameterValues("documentname");
                for (Iterator<MultipartFile> iterator = multipartFile11.iterator(); iterator.hasNext();) {
                    MultipartFile test = (MultipartFile) iterator.next();
                    fileLength = test.getBytes().length;
                    filename = test.getOriginalFilename();

                    tenOrgfileName = test.getOriginalFilename();
                    ThirdPartyTenantDetails thirdtenantdetails = new ThirdPartyTenantDetails(orgId, userId, tenantCode, tenantId[i], tenantType[i], ttenantFname[i], ttenantLname[i], mobile[i], temail[i], nationality[i], test.getBytes(), filename, today, contractPeriod[i], contractName[i], "Submitted", "", "Update0", today);
//                    TenantDetails tenant = new TenantDetails(orgId, userId, tenantCode, llCategory[i], llName[i], llId[i], llCrNo[i], llContactno[i], llWorkContactno[i], llMailid[i], null, "", tenantType[i], tenantCategory[i], tenantFname[i], tenantLname[i], tenantCitizenship[i], tenantId[i], test.getBytes(), tenOrgfileName, tenantCrNo[i], companyAddress[i], postalCode1[i], tenantContactno[i], tenantWorkContactno[i], tenantMailid[i], permanentAddress[i], correspondenceAddress[i], postalCode[i], postboxNo[i], sponcerName[i], sponcerAddress[i], companyName[i], postboxNo1[i], jointeeName1[i], jointeeAddress1[i], jointeeName2[i], jointeeAddress2[i], remarks[i], assetName[i], assetName1[i], subclassifiedAstno[i], flatNo[i], buildingNo[i], wayNo[i], assetArea[i], blockNo[i], plotNo[i], streetNo[i], waterBillno[i], electricityBillno[i], assetPostalCode[i], assetPostboxNo[i], contractPeriod[i], contractName[i], startsFrom1, endsTo1, null, "", billingCycle[i], advanceAmount[i], dueDate1, totalAmount[i], discountforadvance[i], discountforrent[i], contractSigningDate1, "Direct Tenant", "Submitted", crIdNo[i], extra2[i], roomCode[i], roomName[i], extra5, "Update0", today, today);

                    tenantDetailsDAO.globalSave(thirdtenantdetails);

                }
            } else {
                Date creationDate1 = null;
                if (null != creationDate && !"".equals(creationDate[i])) {
                    creationDate1 = (Date) formatter.parse(creationDate[i]);
                }
                TenantDetails tenant = null;
//                byte[] Content1 = null;
//                tenOrgfileName = tenantDetailsDAO.getTenOrgfileName(tenantCode);
//                Content1 = tenantDetailsDAO.getTenantAttachment(tenantCode);
//            if (action != null && !action.isEmpty()) {
//                if (action.equalsIgnoreCase("recheck")) {
//                    String str[] = tenantCode.split("-");
//                    if (str.length > 2) {
//                        int i = Integer.parseInt(str[3]);
//                        i = i + 1;
//                        tenantCode = str[0] + "-" + str[1] + "-" + str[2] + "-" + i;
//                    } else {
//                        tenantCode = tenantCode + "-REV" + "-" + 1;
//                    }
//                }
//            }

                byte[] Content1 = null;
                String tenOrgfileName1 = tenantDetailsDAO.getTenOrgfileName11(tenantCode);
                if (tenOrgfileName1 != null) {
                    if (tenOrgfileName1.equalsIgnoreCase(attname)) {
                        Content1 = tenantDetailsDAO.getTenantAttachment11(tenantCode);
                        tenant = new TenantDetails(Integer.parseInt(pk), orgId, userId, tenantCode, llCategory[i], llName[i], llId[i], llCrNo[i], llContactno[i], llWorkContactno[i], llMailid[i], null, "", tenantType[i], tenantCategory[i], tenantFname[i], tenantLname[i], tenantCitizenship[i], tenantId[i], tenantCrNo[i], companyAddress[i], postalCode1[i], tenantContactno[i], tenantWorkContactno[i], tenantMailid[i], permanentAddress[i], correspondenceAddress[i], postalCode[i], postboxNo[i], sponcerName[i], sponcerAddress[i], companyName[i], postboxNo1[i], jointeeName1[i], jointeeAddress1[i], jointeeName2[i], jointeeAddress2[i], remarks[i], assetName[i], assetName1[i], subclassifiedAstno[i], flatNo[i], buildingNo[i], wayNo[i], assetArea[i], blockNo[i], plotNo[i], streetNo[i], assetPostalCode[i], assetPostboxNo[i], contractPeriod[i], contractName[i], startsFrom1, endsTo1, null, "", billingCycle[i], advanceAmount[i], dueDate1, totalAmount[i], discountforadvance[i], discountforrent[i], contractSigningDate1, "Direct Tenant", "Submitted", crIdNo[i], extra2[i], roomCode[i], roomName[i], extra5, "Update0", today, today);

                        tenantDetailsDAO.globalSave(tenant);
                        tenantDetailsDAO.tenantDetailsApprove122(tenantId[i], tenOrgfileName1, Content1);

                    } else {
                        MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
                        List<MultipartFile> multipartFile1 = multipartRequest1.getFiles("attachment1");
                        for (Iterator<MultipartFile> iterator = multipartFile1.iterator(); iterator.hasNext();) {
                            MultipartFile test = (MultipartFile) iterator.next();
                            tenOrgfileName = test.getOriginalFilename();
                            tenant = new TenantDetails(Integer.parseInt(pk), orgId, userId, tenantCode, llCategory[i], llName[i], llId[i], llCrNo[i], llContactno[i], llWorkContactno[i], llMailid[i], null, "", tenantType[i], tenantCategory[i], tenantFname[i], tenantLname[i], tenantCitizenship[i], tenantId[i], test.getBytes(), tenOrgfileName, tenantCrNo[i], companyAddress[i], postalCode1[i], tenantContactno[i], tenantWorkContactno[i], tenantMailid[i], permanentAddress[i], correspondenceAddress[i], postalCode[i], postboxNo[i], sponcerName[i], sponcerAddress[i], companyName[i], postboxNo1[i], jointeeName1[i], jointeeAddress1[i], jointeeName2[i], jointeeAddress2[i], remarks[i], assetName[i], assetName1[i], subclassifiedAstno[i], flatNo[i], buildingNo[i], wayNo[i], assetArea[i], blockNo[i], plotNo[i], streetNo[i], waterBillno[i], electricityBillno[i], assetPostalCode[i], assetPostboxNo[i], contractPeriod[i], contractName[i], startsFrom1, endsTo1, null, "", billingCycle[i], advanceAmount[i], dueDate1, totalAmount[i], discountforadvance[i], discountforrent[i], contractSigningDate1, recordstatus[i], "Submitted", crIdNo[i], extra2[i], roomCode[i], roomName[i], extra5, status[i], creationDate1, today, amctenantName[i], startDate1, endDate1, percentage[i], amcamount[i]);
                            tenantDetailsDAO.globalSave(tenant);
                        }
                    }
                }
                int i1 = 0, fileLength = 0;
                String filename = "";
                MultipartHttpServletRequest multipartRequest11 = (MultipartHttpServletRequest) request;
                List<MultipartFile> multipartFile11 = multipartRequest11.getFiles("attachments");
                String documentNames[] = request.getParameterValues("documentname");
                for (Iterator<MultipartFile> iterator = multipartFile11.iterator(); iterator.hasNext();) {
                    MultipartFile test = (MultipartFile) iterator.next();
                    fileLength = test.getBytes().length;
                    filename = test.getOriginalFilename();

                    tenOrgfileName = test.getOriginalFilename();
                    ThirdPartyTenantDetails thirdtenantdetails = new ThirdPartyTenantDetails(Integer.parseInt(pk), orgId, userId, tenantCode, tenantId[i], tenantType[i], ttenantFname[i], ttenantLname[i], mobile[i], temail[i], nationality[i], test.getBytes(), filename, today, contractPeriod[i], contractName[i], "Submitted", "", "Update0", today);
//                    TenantDetails tenant = new TenantDetails(orgId, userId, tenantCode, llCategory[i], llName[i], llId[i], llCrNo[i], llContactno[i], llWorkContactno[i], llMailid[i], null, "", tenantType[i], tenantCategory[i], tenantFname[i], tenantLname[i], tenantCitizenship[i], tenantId[i], test.getBytes(), tenOrgfileName, tenantCrNo[i], companyAddress[i], postalCode1[i], tenantContactno[i], tenantWorkContactno[i], tenantMailid[i], permanentAddress[i], correspondenceAddress[i], postalCode[i], postboxNo[i], sponcerName[i], sponcerAddress[i], companyName[i], postboxNo1[i], jointeeName1[i], jointeeAddress1[i], jointeeName2[i], jointeeAddress2[i], remarks[i], assetName[i], assetName1[i], subclassifiedAstno[i], flatNo[i], buildingNo[i], wayNo[i], assetArea[i], blockNo[i], plotNo[i], streetNo[i], waterBillno[i], electricityBillno[i], assetPostalCode[i], assetPostboxNo[i], contractPeriod[i], contractName[i], startsFrom1, endsTo1, null, "", billingCycle[i], advanceAmount[i], dueDate1, totalAmount[i], discountforadvance[i], discountforrent[i], contractSigningDate1, "Direct Tenant", "Submitted", crIdNo[i], extra2[i], roomCode[i], roomName[i], extra5, "Update0", today, today);

                    tenantDetailsDAO.globalSave(thirdtenantdetails);

                }

                String tenantFname1 = "";
                String tenantLname1 = "";
                String assetName2 = "";

                Common cm = new Common();
                String subject = "", tbody = "", mailbody = "", email = "", fileName = "", suppAdd = "";
                String userEmail = "excelarete@gmail.com";
                String password = "excel123";
                String toEmail = "";
                List<UserRegistration> ud = tenantDetailsDAO.udList("GFC");
                for (UserRegistration udlist : ud) {
                    userId = udlist.getUserId();
                    email = udlist.getEmail();

                    if (!userEmail.isEmpty() && !password.isEmpty() && !email.isEmpty()) {
                        List<TenantDetails> td = tenantDetailsDAO.tdList(userId, orgId, tenantCode);
                        StringBuilder emailId = new StringBuilder(email);
                        if (td.size() > 0) {
                            int j = 1;
                            for (TenantDetails tdlist : td) {

                                tenantFname1 = tdlist.getTenantFname();
                                tenantLname1 = tdlist.getTenantLname();
                                assetName2 = tdlist.getAssetName();
                            }
                            emailId.append(",");
                            emailId.append(toEmail);
                            String[] sendEmail = emailId.toString().split(",");
                            subject = "Tenant Code: " + tenantCode;
                            String filepath = request.getSession().getServletContext().getRealPath("common\\theme\\images\\logo1.png");
                            mailbody = "<html><body>Dear Sir/Madam,<br/><br/><br/>You need to give an approval for Tenant Details. Tenant Name : " + tenantFname1 + " " + tenantLname1 + ""
                                    + " Please Approve this Tenant Details. <br/><br/>If approved ignore this mail. "
                                    + "</body>"
                                    + "<br/><br/>Thanks & Regards"
                                    + "<br/>Al-Hashar Team.</html>";
                            ByteArrayOutputStream baos = new ByteArrayOutputStream();
                            baos.close();
                            cm.sendEmail(userEmail, password, sendEmail, subject, mailbody, baos, fileName);
                        }
                    }
                }

            }

        }

        modelMap.addAttribute("tenantDetails", tenantDetailsDAO.list(pk, "TenantDetails"));
        return new ModelAndView(new RedirectView("../tenant/tenantDetailsList.htm"), modelMap);
    }

    @RequestMapping("/tenant/tenantContractRenew.htm")
    public ModelAndView tenantContractRenew(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        String landlordId = request.getParameter("llId");
        String contractPeriod = request.getParameter("contractPeriod");
        String assetName = request.getParameter("assetName");
        String assetCode = request.getParameter("assetCode");

        String subclassifiedAstno = request.getParameter("subclassifiedAstno");
        List<TenantUtilityDetails> gridData = new ArrayList<TenantUtilityDetails>();

        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("tenantDetails", tenantDetailsDAO.list(sno, "TenantDetails"));
            modelMap.addAttribute("landLordDetails", tenantDetailsDAO.landLordDetailsList(landlordId));
            modelMap.addAttribute("contractNamee", tenantDetailsDAO.selectContractCodee(contractPeriod));
            modelMap.addAttribute("assetDetails", tenantDetailsDAO.assetDetails(assetName));
            gridData.addAll(assetDAO.tenantUtilityDetailslist(assetName, contractPeriod));
            modelMap.addAttribute("assetDetails1", gridData);
            modelMap.addAttribute("subassDetails", tenantDetailsDAO.subassDetails(assetName, subclassifiedAstno));
            modelMap.addAttribute("landlordDocuments", masterDAO.landlordDocuments(landlordId));
            modelMap.addAttribute("contDocument", contractDAO.ContractAttachlist(contractPeriod));
        }

        String link = "../tenant/tenantDetailsForm.htm";
        String tab = "Tenant Details";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("fileSize", userDAO.fileSize());
        modelMap.addAttribute("tenantType", tenantDetailsDAO.tenantType());
        modelMap.addAttribute("tenantCategory", tenantDetailsDAO.tenantCategory());
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../tenant/tenantContractRenew", modelMap);
    }

    @RequestMapping("/tenant/tenantContractRenewSubmit.htm")
    public ModelAndView tenantContractRenewSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");
        String tenantCode = request.getParameter("tenantCode");
        String[] llId = request.getParameterValues("llId");
        String[] llName = request.getParameterValues("llName");
        String[] llCategory = request.getParameterValues("llCategory");
        String[] llCrNo = request.getParameterValues("llCrNo");
        String[] llContactno = request.getParameterValues("llContactno");
        String[] llWorkContactno = request.getParameterValues("llWorkContactno");
        String[] llMailid = request.getParameterValues("llMailid");
        String llAttachment = request.getParameter("llAttachment");
        String[] tenantType = request.getParameterValues("tenantType");
        String[] tenantCategory = request.getParameterValues("tenantCategory");
        String[] tenantId = request.getParameterValues("tenantId");
        String[] tenantFname = request.getParameterValues("tenantFname");
        String[] tenantLname = request.getParameterValues("tenantLname");
        String[] tenantCitizenship = request.getParameterValues("tenantCitizenship");
        String[] tenantCrNo = request.getParameterValues("tenantCrNo");
        String[] tenantContactno = request.getParameterValues("tenantContactno");
        String[] tenantWorkContactno = request.getParameterValues("tenantWorkContactno");
        String[] tenantMailid = request.getParameterValues("tenantMailid");
        String[] permanentAddress = request.getParameterValues("permanentAddress");
        String[] correspondenceAddress = request.getParameterValues("correspondenceAddress");
        String[] postalCode = request.getParameterValues("postalCode");
        String[] postboxNo = request.getParameterValues("postboxNo");
        String[] sponcerName = request.getParameterValues("sponcerName");
        String[] sponcerAddress = request.getParameterValues("sponcerAddress");
        String[] companyName = request.getParameterValues("companyName");
        String[] companyAddress = request.getParameterValues("companyAddress");
        String[] postalCode1 = request.getParameterValues("postalCode1");
        String[] postboxNo1 = request.getParameterValues("postboxNo1");
        String[] jointeeName1 = request.getParameterValues("jointeeName1");
        String[] jointeeAddress1 = request.getParameterValues("jointeeAddress1");
        String[] jointeeName2 = request.getParameterValues("jointeeName2");
        String[] jointeeAddress2 = request.getParameterValues("jointeeAddress2");
        String[] remarks = request.getParameterValues("remarks");
        String[] tenantAttachment = request.getParameterValues("tenantAttachment");
        String[] assetName = request.getParameterValues("assetCode");
        String[] assetName1 = request.getParameterValues("assetName");
        String[] subclassifiedAstno = request.getParameterValues("subclassifiedAstno");
        String[] flatNo = request.getParameterValues("flatNo");
        String[] buildingNo = request.getParameterValues("buildingNo");
        String[] wayNo = request.getParameterValues("wayNo");
        String[] assetArea = request.getParameterValues("assetArea");
        String[] blockNo = request.getParameterValues("blockNo");
        String[] plotNo = request.getParameterValues("plotNo");
        String[] streetNo = request.getParameterValues("streetNo");
        String[] waterBillno = request.getParameterValues("waterBillno");
        String[] electricityBillno = request.getParameterValues("electricityBillno");
        String[] assetPostalCode = request.getParameterValues("assetPostalCode");
        String[] assetPostboxNo = request.getParameterValues("assetPostboxNo");
        String[] contractPeriod = request.getParameterValues("contractPeriod");
        String[] contractName = request.getParameterValues("contractName");
        String[] startsFrom = request.getParameterValues("startsFrom");
        String[] endsTo = request.getParameterValues("endsTo");
        String contractAttachment = request.getParameter("contractAttachment");
        String[] billingCycle = request.getParameterValues("billingCycle");
        String[] advanceAmount = request.getParameterValues("advanceAmount");
        String[] dueDate = request.getParameterValues("dueDate");
        String[] totalAmount = request.getParameterValues("totalAmount");
        String[] discountforadvance = request.getParameterValues("DiscountforAdvance");
        String[] discountforrent = request.getParameterValues("DiscountforRent");
        String[] contractSigningDate = request.getParameterValues("contractSigningDate");
        String[] status = request.getParameterValues("status");
        String[] attachmentReference = request.getParameterValues("attachmentReference");
        String[] llOrgfileName = request.getParameterValues("llOrgfileName");
        String tenOrgfileName = request.getParameter("tenOrgfileName");
        String[] contOrgfileName = request.getParameterValues("contOrgfileName");
        String[] llSno = request.getParameterValues("llSno");
        String[] contSno = request.getParameterValues("contSno");
        String[] crIdNo = request.getParameterValues("crIdNo");
        String[] extra2 = request.getParameterValues("extra2");
        String extra3 = request.getParameter("extra3");
        String extra4 = request.getParameter("extra4");
        String extra5 = request.getParameter("extra5");
        String[] recordstatus = request.getParameterValues("recordstatus");
        String[] creationDate = request.getParameterValues("creationDate");
        String[] roomCode = request.getParameterValues("roomCode");
        String[] roomName = request.getParameterValues("roomName");
        String[] amctenantName = request.getParameterValues("amctenantName");
        String[] startDate = request.getParameterValues("startDate");
        String[] endDate = request.getParameterValues("endDate");
        String[] percentage = request.getParameterValues("percentage");
        String[] amcamount = request.getParameterValues("amcamount");
        String utility[] = request.getParameterValues("utility");
        String utilityBill[] = request.getParameterValues("utilityBill");
        String comUtility[] = request.getParameterValues("comUtility");
        String utilityBillType[] = request.getParameterValues("utilityBillType");
        String comUtilityBillType[] = request.getParameterValues("comUtilityBillType");
        String comutilityBill[] = request.getParameterValues("comutilityBill");
        String commontotalitemAmount = request.getParameter("commonitmTot");
        String totalitemAmount = request.getParameter("itmTot");
        String tot1 = request.getParameter("totalitemAmount");
        String tot2 = request.getParameter("commontotalitemAmount");
        String attname = request.getParameter("attname");
        String recordstatus1 = "Occupied";
        modelMap.addAttribute("action", request.getParameter("action"));
        String action = request.getParameter("action");
        List<TenantUtilityDetails> gridData1 = new ArrayList<TenantUtilityDetails>();
        TenantUtilityDetails tenant1 = null;
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        tenantDetailsDAO.updatetenantstatus1(pk);
        for (int i = 0; i < tenantFname.length; i++) {

//            if (tenantCode == null || tenantCode == "" || "".equals(tenantCode)) {
//            ArrayList validuser = (ArrayList) tenantDetailsDAO.getTenantNo(llId[i]);
//            String orderNo2 = null;
//            String orderNo1[] = null;
//            int ordno = 1;
//            if (!(validuser.isEmpty())) {
//                for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
//                    orderNo2 = iter.next();
//                }
//                orderNo1 = orderNo2.split("-");
//            }
//            if (orderNo2 != null) {
//                ordno = Integer.parseInt(orderNo1[1]) + 1;
//            }
//            tenantCode = "TENANT" + "-" + ordno;
//        }
            Date startsFrom1 = null;
            if (null != startsFrom && !"".equals(startsFrom[i])) {
                startsFrom1 = (Date) formatter.parse(startsFrom[i]);
            }
            Date endsTo1 = null;
            if (null != endsTo && !"".equals(endsTo)) {
                endsTo1 = (Date) formatter.parse(endsTo[i]);
            }
            Date dueDate1 = null;
            if (dueDate != null && !"".equals(dueDate[i])) {
                dueDate1 = (Date) formatter.parse(dueDate[i]);
            }
            Date contractSigningDate1 = null;
            if (null != contractSigningDate && !"".equals(contractSigningDate[i])) {
                contractSigningDate1 = (Date) formatter.parse(contractSigningDate[i]);
            }
            Date startDate1 = null;
            if (null != startDate && !"".equals(startDate[i])) {
                startDate1 = (Date) formatter.parse(startDate[i]);
            }
            Date endDate1 = null;
            if (null != endDate && !"".equals(endDate[i])) {
                endDate1 = (Date) formatter.parse(endDate[i]);
            }

            //=====================code for getting tenant code======================================
            //=====================end code for getting tenant code======================================
            byte[] Content1 = null;
            String tenOrgfileName1 = tenantDetailsDAO.getTenOrgfileName11(tenantCode);
            if (tenOrgfileName1 != null) {
                if (tenOrgfileName1.equalsIgnoreCase(attname)) {
                    Content1 = tenantDetailsDAO.getTenantAttachment11(tenantCode);
                    TenantDetails tenant = new TenantDetails(orgId, userId, tenantCode, llCategory[i], llName[i], llId[i], llCrNo[i], llContactno[i], llWorkContactno[i], llMailid[i], null, "", tenantType[i], tenantCategory[i], tenantFname[i], tenantLname[i], tenantCitizenship[i], tenantId[i], Content1, tenOrgfileName1, tenantCrNo[i], companyAddress[i], postalCode1[i], tenantContactno[i], tenantWorkContactno[i], tenantMailid[i], permanentAddress[i], correspondenceAddress[i], postalCode[i], postboxNo[i], sponcerName[i], sponcerAddress[i], companyName[i], postboxNo1[i], jointeeName1[i], jointeeAddress1[i], jointeeName2[i], jointeeAddress2[i], remarks[i], assetName[i], assetName1[i], subclassifiedAstno[i], flatNo[i], buildingNo[i], wayNo[i], assetArea[i], blockNo[i], plotNo[i], streetNo[i], waterBillno[i], electricityBillno[i], assetPostalCode[i], assetPostboxNo[i], contractPeriod[i], contractName[i], startsFrom1, endsTo1, null, "", billingCycle[i], advanceAmount[i], dueDate1, totalAmount[i], discountforadvance[i], discountforrent[i], contractSigningDate1, "Direct Tenant", "Submitted", crIdNo[i], extra2[i], null, roomName[i], extra5, "Update0", today, today);

                    tenantDetailsDAO.globalSave(tenant);
                    tenantDetailsDAO.updateSubasset(assetName[i], subclassifiedAstno[i], recordstatus1);
                    if (null != tenantType && "Shared".equals(tenantType[i])) {
                        tenantDetailsDAO.updateRoomStatus(roomCode[i], recordstatus1);
                    } else if (utility != null) {

                        for (int j = 0; j < utility.length; j++) {

                            tenant1 = new TenantUtilityDetails(contractPeriod[i], tenantCode, assetName[i], assetName1[i], "Update0", utility[j], utilityBill[j], comUtility[j], comutilityBill[j], utilityBillType[j], comUtilityBillType[j], totalitemAmount, commontotalitemAmount, today);

                            gridData1.add(tenant1);

                        }
                    }
                    assetDAO.tenantSave(gridData1);
                }

            } else {

                MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
                List<MultipartFile> multipartFile1 = multipartRequest1.getFiles("attachment1");
                for (Iterator<MultipartFile> iterator = multipartFile1.iterator(); iterator.hasNext();) {
                    MultipartFile test = (MultipartFile) iterator.next();
                    tenOrgfileName = test.getOriginalFilename();
                    TenantDetails tenant = new TenantDetails(orgId, userId, tenantCode, llCategory[i], llName[i], llId[i], llCrNo[i], llContactno[i], llWorkContactno[i], llMailid[i], null, "", tenantType[i], tenantCategory[i], tenantFname[i], tenantLname[i], tenantCitizenship[i], tenantId[i], test.getBytes(), tenOrgfileName, tenantCrNo[i], companyAddress[i], postalCode1[i], tenantContactno[i], tenantWorkContactno[i], tenantMailid[i], permanentAddress[i], correspondenceAddress[i], postalCode[i], postboxNo[i], sponcerName[i], sponcerAddress[i], companyName[i], postboxNo1[i], jointeeName1[i], jointeeAddress1[i], jointeeName2[i], jointeeAddress2[i], remarks[i], assetName[i], assetName1[i], subclassifiedAstno[i], flatNo[i], buildingNo[i], wayNo[i], assetArea[i], blockNo[i], plotNo[i], streetNo[i], waterBillno[i], electricityBillno[i], assetPostalCode[i], assetPostboxNo[i], contractPeriod[i], contractName[i], startsFrom1, endsTo1, null, "", billingCycle[i], advanceAmount[i], dueDate1, totalAmount[i], discountforadvance[i], discountforrent[i], contractSigningDate1, "Direct Tenant", "Submitted", crIdNo[i], extra2[i], null, roomName[i], extra5, "Update0", today, today);
                    tenantDetailsDAO.globalSave(tenant);

                }
            }
        }
//        tenantDetailsDAO.updatetenantstatus1();
        modelMap.addAttribute("tenantDetails", tenantDetailsDAO.list(pk, "TenantDetails"));
        return new ModelAndView(new RedirectView("../tenant/tenantDetailsList.htm"), modelMap);
    }

    @RequestMapping("/tenant/tenantContractAdd.htm")
    public ModelAndView tenantContractAdd(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        String landlordId = request.getParameter("llId");
        String contractPeriod = request.getParameter("contractPeriod");
        String assetName = request.getParameter("assetName");
        String assetCode = request.getParameter("assetCode");

        String subclassifiedAstno = request.getParameter("subclassifiedAstno");
        List<TenantUtilityDetails> gridData = new ArrayList<TenantUtilityDetails>();

        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("tenantDetails", tenantDetailsDAO.list(sno, "TenantDetails"));
            modelMap.addAttribute("landLordDetails", tenantDetailsDAO.landLordDetailsList(landlordId));
            modelMap.addAttribute("contractNamee", tenantDetailsDAO.selectContractCodee(contractPeriod));
            modelMap.addAttribute("assetDetails", tenantDetailsDAO.assetDetails(assetName));
            gridData.addAll(assetDAO.tenantUtilityDetailslist(assetName, contractPeriod));
            modelMap.addAttribute("assetDetails1", gridData);
            modelMap.addAttribute("subassDetails", tenantDetailsDAO.subassDetails(assetName, subclassifiedAstno));
            modelMap.addAttribute("landlordDocuments", masterDAO.landlordDocuments(landlordId));
            modelMap.addAttribute("contDocument", contractDAO.ContractAttachlist(contractPeriod));
        }

        String link = "../tenant/tenantDetailsForm.htm";
        String tab = "Tenant Details";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("fileSize", userDAO.fileSize());
        modelMap.addAttribute("tenantType", tenantDetailsDAO.tenantType());
        modelMap.addAttribute("tenantCategory", tenantDetailsDAO.tenantCategory());
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../tenant/tenantContractAdd", modelMap);
    }

    @RequestMapping("/tenant/tenantContractAddSubmit.htm")
    public ModelAndView tenantContractAddSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");
        String tenantCode = request.getParameter("tenantCode");
        String[] llId = request.getParameterValues("llId");
        String[] llName = request.getParameterValues("llName");
        String[] llCategory = request.getParameterValues("llCategory");
        String[] llCrNo = request.getParameterValues("llCrNo");
        String[] llContactno = request.getParameterValues("llContactno");
        String[] llWorkContactno = request.getParameterValues("llWorkContactno");
        String[] llMailid = request.getParameterValues("llMailid");
        String llAttachment = request.getParameter("llAttachment");
        String[] tenantType = request.getParameterValues("tenantType");
        String[] tenantCategory = request.getParameterValues("tenantCategory");
        String[] tenantId = request.getParameterValues("tenantId");
        String[] tenantFname = request.getParameterValues("tenantFname");
        String[] tenantLname = request.getParameterValues("tenantLname");
        String[] tenantCitizenship = request.getParameterValues("tenantCitizenship");
        String[] tenantCrNo = request.getParameterValues("tenantCrNo");
        String[] tenantContactno = request.getParameterValues("tenantContactno");
        String[] tenantWorkContactno = request.getParameterValues("tenantWorkContactno");
        String[] tenantMailid = request.getParameterValues("tenantMailid");
        String[] permanentAddress = request.getParameterValues("permanentAddress");
        String[] correspondenceAddress = request.getParameterValues("correspondenceAddress");
        String[] postalCode = request.getParameterValues("postalCode");
        String[] postboxNo = request.getParameterValues("postboxNo");
        String[] sponcerName = request.getParameterValues("sponcerName");
        String[] sponcerAddress = request.getParameterValues("sponcerAddress");
        String[] companyName = request.getParameterValues("companyName");
        String[] companyAddress = request.getParameterValues("companyAddress");
        String[] postalCode1 = request.getParameterValues("postalCode1");
        String[] postboxNo1 = request.getParameterValues("postboxNo1");
        String[] jointeeName1 = request.getParameterValues("jointeeName1");
        String[] jointeeAddress1 = request.getParameterValues("jointeeAddress1");
        String[] jointeeName2 = request.getParameterValues("jointeeName2");
        String[] jointeeAddress2 = request.getParameterValues("jointeeAddress2");
        String[] remarks = request.getParameterValues("remarks");
        String[] tenantAttachment = request.getParameterValues("tenantAttachment");
        String[] assetName = request.getParameterValues("assetCode");
        String[] assetName1 = request.getParameterValues("assetName");
        String[] subclassifiedAstno = request.getParameterValues("subclassifiedAstno");
        String[] flatNo = request.getParameterValues("flatNo");
        String[] buildingNo = request.getParameterValues("buildingNo");
        String[] wayNo = request.getParameterValues("wayNo");
        String[] assetArea = request.getParameterValues("assetArea");
        String[] blockNo = request.getParameterValues("blockNo");
        String[] plotNo = request.getParameterValues("plotNo");
        String[] streetNo = request.getParameterValues("streetNo");
        String[] waterBillno = request.getParameterValues("waterBillno");
        String[] electricityBillno = request.getParameterValues("electricityBillno");
        String[] assetPostalCode = request.getParameterValues("assetPostalCode");
        String[] assetPostboxNo = request.getParameterValues("assetPostboxNo");
        String[] contractPeriod = request.getParameterValues("contractPeriod");
        String[] contractName = request.getParameterValues("contractName");
        String[] startsFrom = request.getParameterValues("startsFrom");
        String[] endsTo = request.getParameterValues("endsTo");
        String contractAttachment = request.getParameter("contractAttachment");
        String[] billingCycle = request.getParameterValues("billingCycle");
        String[] advanceAmount = request.getParameterValues("advanceAmount");
        String[] dueDate = request.getParameterValues("dueDate");
        String[] totalAmount = request.getParameterValues("totalAmount");
        String[] discountforadvance = request.getParameterValues("DiscountforAdvance");
        String[] discountforrent = request.getParameterValues("DiscountforRent");
        String[] contractSigningDate = request.getParameterValues("contractSigningDate");
        String[] status = request.getParameterValues("status");
        String[] attachmentReference = request.getParameterValues("attachmentReference");
        String[] llOrgfileName = request.getParameterValues("llOrgfileName");
        String tenOrgfileName = request.getParameter("tenOrgfileName");
        String[] contOrgfileName = request.getParameterValues("contOrgfileName");
        String[] llSno = request.getParameterValues("llSno");
        String[] contSno = request.getParameterValues("contSno");
        String[] crIdNo = request.getParameterValues("crIdNo");
        String[] extra2 = request.getParameterValues("extra2");
        String extra3 = request.getParameter("extra3");
        String extra4 = request.getParameter("extra4");
        String extra5 = request.getParameter("extra5");
        String[] recordstatus = request.getParameterValues("recordstatus");
        String[] creationDate = request.getParameterValues("creationDate");
        String[] roomCode = request.getParameterValues("roomCode");
        String[] roomName = request.getParameterValues("roomName");
        String[] amctenantName = request.getParameterValues("amctenantName");
        String[] startDate = request.getParameterValues("startDate");
        String[] endDate = request.getParameterValues("endDate");
        String[] percentage = request.getParameterValues("percentage");
        String[] amcamount = request.getParameterValues("amcamount");
        String utility[] = request.getParameterValues("utility");
        String utilityBill[] = request.getParameterValues("utilityBill");
        String comUtility[] = request.getParameterValues("comUtility");
        String utilityBillType[] = request.getParameterValues("utilityBillType");
        String comUtilityBillType[] = request.getParameterValues("comUtilityBillType");
        String comutilityBill[] = request.getParameterValues("comutilityBill");
        String commontotalitemAmount = request.getParameter("commonitmTot");
        String totalitemAmount = request.getParameter("itmTot");
        String tot1 = request.getParameter("totalitemAmount");
        String tot2 = request.getParameter("commontotalitemAmount");
        String attname = request.getParameter("attname");
        String recordstatus1 = "Occupied";
        modelMap.addAttribute("action", request.getParameter("action"));
        String action = request.getParameter("action");
        List<TenantUtilityDetails> gridData1 = new ArrayList<TenantUtilityDetails>();
        TenantUtilityDetails tenant1 = null;
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
//        tenantDetailsDAO.updatetenantstatus1(pk);
        for (int i = 0; i < tenantFname.length; i++) {

//            if (tenantCode == null || tenantCode == "" || "".equals(tenantCode)) {
//            ArrayList validuser = (ArrayList) tenantDetailsDAO.getTenantNo(llId[i]);
//            String orderNo2 = null;
//            String orderNo1[] = null;
//            int ordno = 1;
//            if (!(validuser.isEmpty())) {
//                for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
//                    orderNo2 = iter.next();
//                }
//                orderNo1 = orderNo2.split("-");
//            }
//            if (orderNo2 != null) {
//                ordno = Integer.parseInt(orderNo1[1]) + 1;
//            }
//            tenantCode = "TENANT" + "-" + ordno;
//        }
            Date startsFrom1 = null;
            if (null != startsFrom && !"".equals(startsFrom[i])) {
                startsFrom1 = (Date) formatter.parse(startsFrom[i]);
            }
            Date endsTo1 = null;
            if (null != endsTo && !"".equals(endsTo)) {
                endsTo1 = (Date) formatter.parse(endsTo[i]);
            }
            Date dueDate1 = null;
            if (dueDate != null && !"".equals(dueDate[i])) {
                dueDate1 = (Date) formatter.parse(dueDate[i]);
            }
            Date contractSigningDate1 = null;
            if (null != contractSigningDate && !"".equals(contractSigningDate[i])) {
                contractSigningDate1 = (Date) formatter.parse(contractSigningDate[i]);
            }
            Date startDate1 = null;
            if (null != startDate && !"".equals(startDate[i])) {
                startDate1 = (Date) formatter.parse(startDate[i]);
            }
            Date endDate1 = null;
            if (null != endDate && !"".equals(endDate[i])) {
                endDate1 = (Date) formatter.parse(endDate[i]);
            }

            //=====================code for getting tenant code======================================
            //=====================end code for getting tenant code======================================
            byte[] Content1 = null;
            String tenOrgfileName1 = tenantDetailsDAO.getTenOrgfileName11(tenantCode);
            if (tenOrgfileName1 != null) {
                if (tenOrgfileName1.equalsIgnoreCase(attname)) {
                    Content1 = tenantDetailsDAO.getTenantAttachment11(tenantCode);
                    TenantDetails tenant = new TenantDetails(orgId, userId, tenantCode, llCategory[i], llName[i], llId[i], llCrNo[i], llContactno[i], llWorkContactno[i], llMailid[i], null, "", tenantType[i], tenantCategory[i], tenantFname[i], tenantLname[i], tenantCitizenship[i], tenantId[i], Content1, tenOrgfileName1, tenantCrNo[i], companyAddress[i], postalCode1[i], tenantContactno[i], tenantWorkContactno[i], tenantMailid[i], permanentAddress[i], correspondenceAddress[i], postalCode[i], postboxNo[i], sponcerName[i], sponcerAddress[i], companyName[i], postboxNo1[i], jointeeName1[i], jointeeAddress1[i], jointeeName2[i], jointeeAddress2[i], remarks[i], assetName[i], assetName1[i], subclassifiedAstno[i], flatNo[i], buildingNo[i], wayNo[i], assetArea[i], blockNo[i], plotNo[i], streetNo[i], waterBillno[i], electricityBillno[i], assetPostalCode[i], assetPostboxNo[i], contractPeriod[i], contractName[i], startsFrom1, endsTo1, null, "", billingCycle[i], advanceAmount[i], dueDate1, totalAmount[i], discountforadvance[i], discountforrent[i], contractSigningDate1, "Direct Tenant", "Submitted", crIdNo[i], extra2[i], null, roomName[i], extra5, "Update0", today, today);

                    tenantDetailsDAO.globalSave(tenant);
                    tenantDetailsDAO.updateSubasset(assetName[i], subclassifiedAstno[i], recordstatus1);
                    if (null != tenantType && "Shared".equals(tenantType[i])) {
                        tenantDetailsDAO.updateRoomStatus(roomCode[i], recordstatus1);
                    } else if (utility != null) {

                        for (int j = 0; j < utility.length; j++) {

                            tenant1 = new TenantUtilityDetails(contractPeriod[i], tenantCode, assetName[i], assetName1[i], "Update0", utility[j], utilityBill[j], comUtility[j], comutilityBill[j], utilityBillType[j], comUtilityBillType[j], totalitemAmount, commontotalitemAmount, today);

                            gridData1.add(tenant1);

                        }
                    }
                    assetDAO.tenantSave(gridData1);
                }

            } else {

                MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
                List<MultipartFile> multipartFile1 = multipartRequest1.getFiles("attachment1");
                for (Iterator<MultipartFile> iterator = multipartFile1.iterator(); iterator.hasNext();) {
                    MultipartFile test = (MultipartFile) iterator.next();
                    tenOrgfileName = test.getOriginalFilename();
                    TenantDetails tenant = new TenantDetails(orgId, userId, tenantCode, llCategory[i], llName[i], llId[i], llCrNo[i], llContactno[i], llWorkContactno[i], llMailid[i], null, "", tenantType[i], tenantCategory[i], tenantFname[i], tenantLname[i], tenantCitizenship[i], tenantId[i], test.getBytes(), tenOrgfileName, tenantCrNo[i], companyAddress[i], postalCode1[i], tenantContactno[i], tenantWorkContactno[i], tenantMailid[i], permanentAddress[i], correspondenceAddress[i], postalCode[i], postboxNo[i], sponcerName[i], sponcerAddress[i], companyName[i], postboxNo1[i], jointeeName1[i], jointeeAddress1[i], jointeeName2[i], jointeeAddress2[i], remarks[i], assetName[i], assetName1[i], subclassifiedAstno[i], flatNo[i], buildingNo[i], wayNo[i], assetArea[i], blockNo[i], plotNo[i], streetNo[i], waterBillno[i], electricityBillno[i], assetPostalCode[i], assetPostboxNo[i], contractPeriod[i], contractName[i], startsFrom1, endsTo1, null, "", billingCycle[i], advanceAmount[i], dueDate1, totalAmount[i], discountforadvance[i], discountforrent[i], contractSigningDate1, "Direct Tenant", "Submitted", crIdNo[i], extra2[i], null, roomName[i], extra5, "Update0", today, today);
                    tenantDetailsDAO.globalSave(tenant);

                }
            }
        }
//        tenantDetailsDAO.updatetenantstatus1();
        modelMap.addAttribute("tenantDetails", tenantDetailsDAO.list(pk, "TenantDetails"));
        return new ModelAndView(new RedirectView("../tenant/tenantDetailsList.htm"), modelMap);
    }

//     @RequestMapping("/tenant/tenantDetailsForm.htm")
//    public ModelAndView tenantDetailsForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
//        ModelMap modelMap = new ModelMap();
//        String sno = request.getParameter("pk");
//        String landlordId = request.getParameter("llId");
//        String contractPeriod = request.getParameter("contractPeriod");
//        String assetName = request.getParameter("assetName");
//        String subclassifiedAstno = request.getParameter("subclassifiedAstno");
//        if (sno != null && !sno.isEmpty()) {
//            modelMap.addAttribute("tenantDetails", tenantDetailsDAO.list(sno, "TenantDetails"));
//            modelMap.addAttribute("landLordDetails", tenantDetailsDAO.landLordDetailsList(landlordId));
//            modelMap.addAttribute("contractNamee", tenantDetailsDAO.selectContractCodee(contractPeriod));
//            modelMap.addAttribute("assetDetails", tenantDetailsDAO.assetDetails(assetName));
//            modelMap.addAttribute("subassDetails", tenantDetailsDAO.subassDetails(assetName, subclassifiedAstno));
//            modelMap.addAttribute("landlordDocuments", masterDAO.landlordDocuments(landlordId));
//            modelMap.addAttribute("contDocument", contractDAO.ContractAttachlist(contractPeriod));
//        }
//        String link = "../tenant/tenantDetailsForm.htm";
//        String tab = "Tenant Details";
//        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
//        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
//        modelMap.addAttribute("fileSize", userDAO.fileSize());
//        modelMap.addAttribute("tenantType", tenantDetailsDAO.tenantType());
//        modelMap.addAttribute("tenantCategory", tenantDetailsDAO.tenantCategory());
//        modelMap.addAttribute("action", request.getParameter("action"));
//        return new ModelAndView("../tenant/tenantDetailsForm", modelMap);
//    }
//    @RequestMapping("/tenant/tenantDetailsFormSubmit.htm")
//    public ModelAndView tenantDetailsFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
//        HttpSession session = request.getSession();
//        ModelMap modelMap = new ModelMap();
//        String userId = session.getAttribute("userId").toString();
//        String orgId = session.getAttribute("orgId").toString();
//        String pk = request.getParameter("pk");
//        String tenantCode = request.getParameter("tenantCode");
//        String llId = request.getParameter("llId");
//        String llName = request.getParameter("llName");
//        String llCategory = request.getParameter("llCategory");
//        String llCrNo = request.getParameter("llCrNo");
//        String llContactno = request.getParameter("llContactno");
//        String llWorkContactno = request.getParameter("llWorkContactno");
//        String llMailid = request.getParameter("llMailid");
//        String llAttachment = request.getParameter("llAttachment");
//        String tenantType = request.getParameter("tenantType");
//        String tenantCategory = request.getParameter("tenantCategory");
//        String tenantId = request.getParameter("tenantId");
//        String tenantFname = request.getParameter("tenantFname");
//        String tenantLname = request.getParameter("tenantLname");
//        String tenantCitizenship = request.getParameter("tenantCitizenship");
//        String tenantCrNo = request.getParameter("tenantCrNo");
//        String tenantContactno = request.getParameter("tenantContactno");
//        String tenantWorkContactno = request.getParameter("tenantWorkContactno");
//        String tenantMailid = request.getParameter("tenantMailid");
//        String permanentAddress = request.getParameter("permanentAddress");
//        String correspondenceAddress = request.getParameter("correspondenceAddress");
//        String postalCode = request.getParameter("postalCode");
//        String postboxNo = request.getParameter("postboxNo");
//        String sponcerName = request.getParameter("sponcerName");
//        String sponcerAddress = request.getParameter("sponcerAddress");
//        String companyName = request.getParameter("companyName");
//        String companyAddress = request.getParameter("companyAddress");
//        String postalCode1 = request.getParameter("postalCode1");
//        String postboxNo1 = request.getParameter("postboxNo1");
//        String jointeeName1 = request.getParameter("jointeeName1");
//        String jointeeAddress1 = request.getParameter("jointeeAddress1");
//        String jointeeName2 = request.getParameter("jointeeName2");
//        String jointeeAddress2 = request.getParameter("jointeeAddress2");
//        String remarks = request.getParameter("remarks");
//        String tenantAttachment = request.getParameter("tenantAttachment");
//        String assetName = request.getParameter("assetCode");
//        String assetName1 = request.getParameter("assetName");
//        String subclassifiedAstno = request.getParameter("subclassifiedAstno");
//        String flatNo = request.getParameter("flatNo");
//        String buildingNo = request.getParameter("buildingNo");
//        String wayNo = request.getParameter("wayNo");
//        String assetArea = request.getParameter("assetArea");
//        String blockNo = request.getParameter("blockNo");
//        String plotNo = request.getParameter("plotNo");
//        String streetNo = request.getParameter("streetNo");
//        String waterBillno = request.getParameter("waterBillno");
//        String electricityBillno = request.getParameter("electricityBillno");
//        String assetPostalCode = request.getParameter("assetPostalCode");
//        String assetPostboxNo = request.getParameter("assetPostboxNo");
//        String contractPeriod = request.getParameter("contractPeriod");
//        String contractName = request.getParameter("contractName");
//        String startsFrom = request.getParameter("startsFrom");
//        String endsTo = request.getParameter("endsTo");
//        String contractAttachment = request.getParameter("contractAttachment");
//        String billingCycle = request.getParameter("billingCycle");
//        String advanceAmount = request.getParameter("advanceAmount");
//        String dueDate = request.getParameter("dueDate");
//        String totalAmount = request.getParameter("totalAmount");
//        String discountforadvance = request.getParameter("DiscountforAdvance");
//        String discountforrent = request.getParameter("DiscountforRent");
//        String contractSigningDate = request.getParameter("contractSigningDate");
//        String status = request.getParameter("status");
//        String attachmentReference = request.getParameter("attachmentReference");
//        String llOrgfileName = request.getParameter("llOrgfileName");
//        String tenOrgfileName = request.getParameter("tenOrgfileName");
//        String contOrgfileName = request.getParameter("contOrgfileName");
//        String llSno = request.getParameter("llSno");
//        String contSno = request.getParameter("contSno");
//        String crIdNo = request.getParameter("crIdNo");
//        String extra2 = request.getParameter("extra2");
//        String extra3 = request.getParameter("extra3");
//        String extra4 = request.getParameter("extra4");
//        String extra5 = request.getParameter("extra5");
//        String recordstatus = request.getParameter("recordstatus");
//        String creationDate = request.getParameter("creationDate");
//        String recordstatus1 = "Occupied";
//        modelMap.addAttribute("action", request.getParameter("action"));
//        String action = request.getParameter("action");
//        java.util.Date today = new java.util.Date();
//        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
//        if (tenantCode == null || tenantCode == "" || "".equals(tenantCode)) {
//            ArrayList validuser = (ArrayList) tenantDetailsDAO.getTenantNo(llId);
//            String orderNo2 = null;
//            String orderNo1[] = null;
//            int ordno = 1;
//            if (!(validuser.isEmpty())) {
//                for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
//                    orderNo2 = iter.next();
//                }
//                orderNo1 = orderNo2.split("-");
//            }
//            if (orderNo2 != null) {
//                ordno = Integer.parseInt(orderNo1[1]) + 1;
//            }
//            tenantCode = "TENANT" + "-" + ordno;
//        }
//        Date startsFrom1 = null;
//        if (!startsFrom.equals("")) {
//            startsFrom1 = (Date) formatter.parse(startsFrom);
//        }
//        Date endsTo1 = null;
//        if (!endsTo.equals("")) {
//            endsTo1 = (Date) formatter.parse(endsTo);
//        }
//        Date dueDate1 = null;
//        if (!dueDate.equals("")) {
//            dueDate1 = (Date) formatter.parse(dueDate);
//        }
//        Date contractSigningDate1 = null;
//        if (!contractSigningDate.equals("")) {
//            contractSigningDate1 = (Date) formatter.parse(contractSigningDate);
//        }
//        if (pk == null || pk == "" || pk.equals("")) {
//            MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
//            List<MultipartFile> multipartFile1 = multipartRequest1.getFiles("tenantAttachment");
//            for (Iterator<MultipartFile> iterator = multipartFile1.iterator(); iterator.hasNext();) {
//                MultipartFile test = (MultipartFile) iterator.next();
//                tenOrgfileName = test.getOriginalFilename();
//                TenantDetails tenant = new TenantDetails(orgId, userId, tenantCode, llCategory, llName, llId, llCrNo, llContactno, llWorkContactno, llMailid, null, "", tenantType, tenantCategory, tenantFname, tenantLname, tenantCitizenship, tenantId, test.getBytes(), tenOrgfileName, tenantCrNo, companyAddress, postalCode1, tenantContactno, tenantWorkContactno, tenantMailid, permanentAddress, correspondenceAddress, postalCode, postboxNo, sponcerName, sponcerAddress, companyName, postboxNo1, jointeeName1, jointeeAddress1, jointeeName2, jointeeAddress2, remarks, assetName, assetName1, subclassifiedAstno, flatNo, buildingNo, wayNo, assetArea, blockNo, plotNo, streetNo, waterBillno, electricityBillno, assetPostalCode, assetPostboxNo, contractPeriod, contractName, startsFrom1, endsTo1, null, "", billingCycle, advanceAmount, dueDate1, totalAmount, discountforadvance, discountforrent, contractSigningDate1, "Direct Tenant", "Submitted", crIdNo, extra2, extra3, extra4, extra5, "Update0", today, today);
//                tenantDetailsDAO.globalSave(tenant);
//                tenantDetailsDAO.updateSubasset(assetName, subclassifiedAstno, recordstatus1);
//            }
//        } else {
//            Date creationDate1 = null;
//            if (!creationDate.equals("")) {
//                creationDate1 = (Date) formatter.parse(creationDate);
//            }
//            TenantDetails tenant = null;
//            byte[] Content1 = null;
//            tenOrgfileName = tenantDetailsDAO.getTenOrgfileName(tenantCode);
//            Content1 = tenantDetailsDAO.getTenantAttachment(tenantCode);
////            if (action != null && !action.isEmpty()) {
////                if (action.equalsIgnoreCase("recheck")) {
////                    String str[] = tenantCode.split("-");
////                    if (str.length > 2) {
////                        int i = Integer.parseInt(str[3]);
////                        i = i + 1;
////                        tenantCode = str[0] + "-" + str[1] + "-" + str[2] + "-" + i;
////                    } else {
////                        tenantCode = tenantCode + "-REV" + "-" + 1;
////                    }
////                }
////            }
//            tenant = new TenantDetails(Integer.parseInt(pk), orgId, userId, tenantCode, llCategory, llName, llId, llCrNo, llContactno, llWorkContactno, llMailid, null, "", tenantType, tenantCategory, tenantFname, tenantLname, tenantCitizenship, tenantId, Content1, tenOrgfileName, tenantCrNo, companyAddress, postalCode1, tenantContactno, tenantWorkContactno, tenantMailid, permanentAddress, correspondenceAddress, postalCode, postboxNo, sponcerName, sponcerAddress, companyName, postboxNo1, jointeeName1, jointeeAddress1, jointeeName2, jointeeAddress2, remarks, assetName, assetName1, subclassifiedAstno, flatNo, buildingNo, wayNo, assetArea, blockNo, plotNo, streetNo, waterBillno, electricityBillno, assetPostalCode, assetPostboxNo, contractPeriod, contractName, startsFrom1, endsTo1, null, "", billingCycle, advanceAmount, dueDate1, totalAmount, discountforadvance, discountforrent, contractSigningDate1, recordstatus, "Submitted", crIdNo, extra2, extra3, extra4, extra5, status, creationDate1, today);
//            tenantDetailsDAO.globalSave(tenant);
//        }
//
//        Common cm = new Common();
//        String subject = "", tbody = "", mailbody = "", email = "", fileName = "", suppAdd = "";
//        String userEmail = "excelarete@gmail.com";
//        String password = "excel123";
//        String toEmail = "";
//        List<UserRegistration> ud = tenantDetailsDAO.udList("GFC");
//        for (UserRegistration udlist : ud) {
//            userId = udlist.getUserId();
//            email = udlist.getEmail();
//
//            if (!userEmail.isEmpty() && !password.isEmpty() && !email.isEmpty()) {
//                List<TenantDetails> td = tenantDetailsDAO.tdList(userId, orgId, tenantCode);
//                StringBuilder emailId = new StringBuilder(email);
//                if (td.size() > 0) {
//                    int i = 1;
//                    for (TenantDetails tdlist : td) {
//
//                        tenantFname = tdlist.getTenantFname();
//                        tenantLname = tdlist.getTenantLname();
//                        assetName = tdlist.getAssetName();
//                    }
//                    emailId.append(",");
//                    emailId.append(toEmail);
//                    String[] sendEmail = emailId.toString().split(",");
//                    subject = "Tenant Code: " + tenantCode;
//                    String filepath = request.getSession().getServletContext().getRealPath("common\\theme\\images\\logo1.png");
//                    mailbody = "<html><body>Dear Sir/Madam,<br/><br/><br/>You need to give an approval for Tenant Details. Tenant Name : " + tenantFname + " " + tenantLname + ""
//                            + " Please Approve this Tenant Details. <br/><br/>If approved ignore this mail. "
//                            + "</body>"
//                            + "<br/><br/>Thanks & Regards"
//                            + "<br/>Al-Hashar Team.</html>";
//                    ByteArrayOutputStream baos = new ByteArrayOutputStream();
//                    baos.close();
//                    cm.sendEmail(userEmail, password, sendEmail, subject, mailbody, baos, fileName);
//                }
//            }
//        }
//        modelMap.addAttribute("tenantDetails", tenantDetailsDAO.list(pk, "TenantDetails"));
//        return new ModelAndView(new RedirectView("../tenant/tenantDetailsList.htm"), modelMap);
//    }
//**************Select LandLord Pop-up******************//
    @RequestMapping("/tenant/selectLandLord.htm")
    public ModelAndView selectLandLord(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("selectLandLord", tenantDetailsDAO.selectLandLord());
        return new ModelAndView("selectLandLord", modelMap);
    }
//**************Select Property Pop-up******************//

    @RequestMapping("/tenant/selectAssetDetails.htm")
    public ModelAndView selectAssetDetails(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String tenantCategory = req.getParameter("tenantCategory");
        modelMap.addAttribute("selectAssetDetails", tenantDetailsDAO.selectAssetDetails(tenantCategory));
        return new ModelAndView("selectAssetDetails", modelMap);
    }

    //**************Select Property Pop-up******************//
    //////Newly added by lakshmi////////
    @RequestMapping("/tenant/selectAssetDetails1.htm")
    public ModelAndView selectAssetDetails1(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String tenantCategory = req.getParameter("tenantCategory");
        modelMap.addAttribute("selectAssetDetails", tenantDetailsDAO.selectAssetDetails(tenantCategory));
        return new ModelAndView("selectAssetDetails1", modelMap);
    }
    ///////////////////
//**************Select Flat Pop-up******************//

    @RequestMapping("/tenant/selectSubAssetDetails.htm")
    public ModelAndView selectSubAssetDetails(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String assetCode = req.getParameter("assetCode");
        String tenantCategory = req.getParameter("tenantCategory");
        modelMap.addAttribute("selectSubAssetDetails", tenantDetailsDAO.selectSubAssetDetails1(assetCode, tenantCategory));
        return new ModelAndView("selectSubAssetDetails", modelMap);
    }

    //////Newly added by lakshmi////////
    @RequestMapping("/tenant/selectSubAssetDetails12.htm")
    public ModelAndView selectSubAssetDetails12(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String assetCode = req.getParameter("assetCode");
        String tenantCategory = req.getParameter("tenantCategory");
        modelMap.addAttribute("selectSubAssetDetails", tenantDetailsDAO.selectSubAssetDetails1(assetCode, tenantCategory));
        return new ModelAndView("selectSubAssetDetails12", modelMap);
    }

    ///////////////////////////
    @RequestMapping("/tenant/selectRoomDetails.htm")
    public ModelAndView selectRoomDetails(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String assetCode = req.getParameter("assetCode");
        String tenantCategory = req.getParameter("tenantCategory");
        modelMap.addAttribute("roomDetails", tenantDetailsDAO.selectRoomDetails(assetCode, tenantCategory));
        return new ModelAndView("selectRoomDetails", modelMap);
    }

    //  to select flat details for Quote  //
    @RequestMapping("/tenant/selectSubAssetDetailsQuote.htm")
    public ModelAndView selectSubAssetDetailsQuote(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String assetCode = req.getParameter("assetCode");
        String tenantCategory = req.getParameter("tenantCategory");
        modelMap.addAttribute("selectSubAssetDetails", tenantDetailsDAO.selectSubAssetDetails1(assetCode, tenantCategory));
        return new ModelAndView("selectSubAssetDetailsQuote", modelMap);
    }
//**************Select Contract Pop-up******************//

    @RequestMapping("/tenant/selectContractCode.htm")
    public ModelAndView selectContractCode(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String tenantCategory = req.getParameter("tenantCategory");
//        String flatNo = req.getParameter("flatNo");
        String flatNo = req.getParameter("flatNo");

        modelMap.addAttribute("contractName", tenantDetailsDAO.selectContractCode(tenantCategory, flatNo));

        return new ModelAndView("selectContractCode", modelMap);
    }
//**************Select LandLord Attachment******************//

    @RequestMapping("/tenant/getLlAttach.htm")
    public void getLlAttach(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String llId = req.getParameter("llId");
        tenantDetailsDAO.getLlAttach(req, res, llId);
    }
//**************Select Contract Attachment******************//

    @RequestMapping("/tenant/getContAttach.htm")
    public void getContAttach(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String contCode = req.getParameter("contCode");
        tenantDetailsDAO.getContAttach(req, res, contCode);

    }

    @RequestMapping("/tenant/getAssetUtilityDetails.htm")
    public ModelAndView getAssetUtilityDetails(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        ModelMap modelMap = new ModelMap();
        String contCode = req.getParameter("assetName");
        List<AssetUtilityDetails> gridData = new ArrayList<AssetUtilityDetails>();
        gridData.addAll(assetDAO.AssetUtilityDetailslist(contCode));
        modelMap.addAttribute("assetDetails1", gridData);
        tenantDetailsDAO.getAssetUtilityDetails(req, res, contCode);
        return new ModelAndView("../tenant/tenantDetailsForm", modelMap);
    }
//**************Download LandLord Attachment******************//

    @RequestMapping("/tenant/tenantlAttachDownload.htm")
    public void tenantlAttachDownload(HttpServletRequest req, HttpServletResponse res) throws FileNotFoundException, IOException {
        String sno = req.getParameter("sno");
        LandlordAttach doc = tenantDetailsDAO.gettenantAttachll(Integer.parseInt(sno));
        try {
            res.setHeader("Content-Disposition", "inline;filename=\"" + doc.getFilename() + "\"");
            OutputStream out = res.getOutputStream();
            res.setContentType("application/force-download");
            byte[] buffer = doc.getContentTo();
            InputStream in1 = new ByteArrayInputStream(buffer);
            IOUtils.copy(in1, res.getOutputStream());
            out.flush();
            out.close();
            in1.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
//**************Download Tenant Attachment******************//

    @RequestMapping("/tenant/tenanttAttachDownload.htm")
    public void tenanttAttachDownload(HttpServletRequest req, HttpServletResponse res) throws FileNotFoundException, IOException {
        String sno = req.getParameter("sno");
        TenantDetails doc = tenantDetailsDAO.gettenantAttach(Integer.parseInt(sno));
        try {
            res.setHeader("Content-Disposition", "inline;filename=\"" + doc.getTenOrgfileName() + "\"");
            OutputStream out = res.getOutputStream();
            res.setContentType("application/force-download");
            byte[] buffer = doc.getTenantAttachment();
            InputStream in1 = new ByteArrayInputStream(buffer);
            IOUtils.copy(in1, res.getOutputStream());
            out.flush();
            out.close();
            in1.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
//**************Download Contract Attachment******************//

    @RequestMapping("/tenant/tenantContAttachDownload.htm")
    public void tenantContAttachDownload(HttpServletRequest req, HttpServletResponse res) throws FileNotFoundException, IOException {
        String sno = req.getParameter("sno");
        ContractAttach doc = tenantDetailsDAO.gettenantContAttach(Integer.parseInt(sno));
        try {
            res.setHeader("Content-Disposition", "inline;filename=\"" + doc.getFilename() + "\"");
            OutputStream out = res.getOutputStream();
            res.setContentType("application/force-download");
            byte[] buffer = doc.getContent();
            InputStream in1 = new ByteArrayInputStream(buffer);
            IOUtils.copy(in1, res.getOutputStream());
            out.flush();
            out.close();
            in1.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //**************Uniqueness for Tenant ID******************//
    public void fetchTid(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String tenantId = req.getParameter("tenantId");
        tenantDetailsDAO.fetchTid(req, res, tenantId);
    }

    public void fetchbookingTid(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String tenantId = req.getParameter("tenantId");
        tenantDetailsDAO.fetchbookingTid(req, res, tenantId);
    }

//**************Uniqueness for Tenant Name******************//
    public void fetchTName(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String tenantFname = req.getParameter("tenantFname");
        String tenantLname = req.getParameter("tenantLname");
        tenantDetailsDAO.fetchTName(req, res, tenantFname, tenantLname);
    }

    public void fetchBookingTName(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String tenantFname = req.getParameter("tenantFname");
        String tenantLname = req.getParameter("tenantLname");
        tenantDetailsDAO.fetchBookingTName(req, res, tenantFname, tenantLname);
    }

    public void fetchTCode(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String tenantCode = req.getParameter("tenantCode");
        //String tenantLname = req.getParameter("tenantLname");
        tenantDetailsDAO.fetchTCode(req, res, tenantCode);
    }
//**************Uniqueness for Tenant Contact No******************//

    public void fetchTCono(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String tenantContactno = req.getParameter("tenantContactno");
        tenantDetailsDAO.fetchTCono(req, res, tenantContactno);
    }
//**************Uniqueness for Tenant work contact no******************//

    public void fetchTWcono(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String tenantWorkContactno = req.getParameter("tenantWorkContactno");
        tenantDetailsDAO.fetchTWcono(req, res, tenantWorkContactno);
    }
//**************Uniqueness for Tenant Email-ID******************//

    public void fetchTEmail(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String tenantMailid = req.getParameter("tenantMailid");
        tenantDetailsDAO.fetchTEmail(req, res, tenantMailid);
    }
//**************Uniqueness for Tenant CR No******************//

    public void fetchCrno(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String tenantCrNo = req.getParameter("tenantCrNo");
        tenantDetailsDAO.fetchCrno(req, res, tenantCrNo);
    }
//**************Send Email for Tenants******************//

    @RequestMapping("/purchOrder/sendPOEmail.htm")
    public ModelAndView sendPOEmail(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, MessagingException, DocumentException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String tenantCode = req.getParameter("tC");
        String tEmail = req.getParameter("tEmail");
        StringBuilder emailId = new StringBuilder(tEmail);
        Common cm = new Common();
        String subject = "", tbody = "", mailbody = "", pdfbody = "", suppName = "", suppAdd = "";
        String userEmail = "yugandharscts@gmail.com";
        String password = "yuga@2009";
        String toEmail = "";
        String tenantFname = "", RentAmount = "", assetName = "", SubAssetName = "";
        String tenantLname = "", shiptoLoc = "", payTerms = "", delTerms = "", ponote = "", fileName = "";
        Date DueDate = null, reqDate = null;
        Double grandTotal = 0.0;
        if (!userEmail.isEmpty() && !password.isEmpty()) {
            List<TenantDetails> td = tenantDetailsDAO.tdList(userId, orgId, tenantCode);
            if (td.size() > 0) {
                int i = 1;
                String desc = "";
                for (TenantDetails tdlist : td) {
                    tbody = tbody + "<tr style='text-align:center;'><td>" + i + "</td>"
                            + "<td>" + tdlist.getTenantFname() + " " + tdlist.getTenantLname() + "</td>"
                            + "<td>" + tdlist.getTenantContactno() + "</td>"
                            + "<td>" + tdlist.getCorrespondenceAddress() + "</td>"
                            + "<td>" + tdlist.getAssetName() + "</td>"
                            + "<td>" + tdlist.getSubclassifiedAstno() + "</td>"
                            + "<td>" + tdlist.getContractPeriod() + "</td>"
                            + "<td>" + tdlist.getAdvanceAmount() + "</td>"
                            + "<td>" + tdlist.getTotalAmount() + "</td>"
                            + "<td>" + tdlist.getBillingCycle() + "</td>"
                            + "<td>" + tdlist.getDueDate() + "</td>"
                            + "</tr>";
                    tenantFname = tdlist.getTenantFname();
                    tenantLname = tdlist.getTenantLname();
                    assetName = tdlist.getAssetName();
                    SubAssetName = tdlist.getSubclassifiedAstno();
                    RentAmount = tdlist.getTotalAmount();
                    DueDate = tdlist.getDueDate();
                    i++;
                }
                emailId.append(",");
                emailId.append(toEmail);
                String[] sendEmail = emailId.toString().split(",");
                subject = "Tenant Code: " + tenantCode;
                String filepath = req.getSession().getServletContext().getRealPath("common\\theme\\images\\logo1.png");
                mailbody = "<html><body>Dear Sir/Madam,<br/><br/><br/>Your Rent/Service bill amount of " + RentAmount + "/- is Due on " + DueDate + "."
                        + " Please Pay on or before due date. <br/><br/>If paid please ignore this mail. "
                        + "                             <br/><br/><br/>"
                        + "                         <head>"
                        + "                             <title></title>"
                        + "                         </head>"
                        + "                         <body>"
                        + "                             <table style='width:100%;border:1px solid black;border-collapse: collapse;'>"
                        + "                             "
                        + "                             <tr style='text-align:center;'><td><h3>Tenant Details</h3></td></tr>"
                        + "                             </table>"
                        + "                             "
                        + "                             <table style='width:100%;border-collapse: collapse;border:1px solid black;'>"
                        + "                             <tr><td>"
                        + "                               Tenant Code: " + tenantCode
                        + "                         <br/>   "
                        + "                              Tenant Name:   "
                        + tenantFname
                        + " " + tenantLname + "                         <br/>                        "
                        + "                         "
                        + "                            </td>"
                        + "                             "
                        + "                             "
                        + "                             "
                        + "                             </tr>"
                        + "                             </table>"
                        + "                             "
                        + "                              <table border='1px' style='border:1px solid black;width:100%;'>"
                        + "                              <tr style='border-bottom:1px solid black;text-align:center;'>"
                        + "                                                         <th>SNO</th>"
                        + "                                                         <th>Tenant Name</th>"
                        + "                                                         <th>Tenant Contact No.</th>"
                        + "                                                         <th>Tenant Address</th>"
                        + "                                                         <th>Asset Name</th>                                        "
                        + "                                                         <th>SubAsset Name</th>"
                        + "                                                         <th>Contract Name</th>"
                        + "                                                         <th>Advance Amount</th>"
                        + "                                                         <th>Rent Amount</th>"
                        + "                                                         <th>Billing Cycle</th>"
                        + "                                                         <th>Due Date</th>"
                        + "                              </tr>"
                        + tbody
                        + "                              </table>"
                        + ""
                        + "                         <table style='width:100%;border-collapse: collapse;border:1px solid black;'>"
                        + "                         "
                        + "                          "
                        + "                            "
                        + "</body>"
                        + "<br/><br/><br/><br/>If you have any doubts please let us know."
                        + "<br/><br/>Thanks & Regards"
                        + "<br/>Al-Hashar Team.</html>";
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                baos.close();
                cm.sendEmail(userEmail, password, sendEmail, subject, mailbody, baos, fileName);
            }
        }
        String action = req.getParameter("action");
        String message = "Mail Sent Successfully..";
        session.setAttribute("message", message);
        return new ModelAndView(new RedirectView("tenantDetailsList.htm"), modelMap);
    }
    //**************Send sendSMS for Tenants******************//

    @RequestMapping("/tenant/sendSMS.htm")
    public ModelAndView sendSMS(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, MessagingException, DocumentException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        //String userId = session.getAttribute("userId").toString();
        //String orgId = session.getAttribute("orgId").toString();
        //String tenantCode = req.getParameter("tC");
        String mbNo = req.getParameter("tSms");
        // String mbNo="7848030646";
        StringBuilder emailId = new StringBuilder(mbNo);
        Common.schudeleSMS(mbNo, "Dear Candidate amount of Rs.");
        String action = req.getParameter("action");
        String message = "SMS Sent Successfully..";

        session.setAttribute("message", message);
        return new ModelAndView(new RedirectView("tenantDetailsList.htm"), modelMap);
    }
    //SMSSender.schudeleSMS(mbNo, "Dear Candidate amount of Rs." + amt2 + " is due dated " + payDatee2 + " ,please pay on or before due date, Center Name-" + centerIfs[0] + ", ContactNo-" + centerIfs[2], SMSSender.schudeleDate(payDatee2));

//-------------------------Tenant Approval--------------------------------------------------//
//**************Approval 1 List******************//
    @RequestMapping("/tenant/tenantDetailsAppList.htm")
    public ModelAndView tenantDetailsAppList(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Approval 1";
        String submoduleName = "Tenant Details";
        String sno = request.getParameter("pk");
        map.addAttribute("tenantDetails", tenantDetailsDAO.gfcApproved(sno));
        map.addAttribute("tenantDetails1", tenantDetailsDAO.gfcApproved1(sno));
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../tenant/tenantDetailsAppList", map);
    }
//**************Approval 1 Form******************//

    @RequestMapping("/tenant/tenantDetailsAppForm.htm")
    public ModelAndView tenantDetailsAppForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sno = request.getParameter("pk");
        String landlordId = request.getParameter("llId");
        String contractPeriod = request.getParameter("contractPeriod");
        String assetName = request.getParameter("assetName");
        String subclassifiedAstno = request.getParameter("subclassifiedAstno");
        String sno1 = request.getParameter("pk1");
        String landlordId1 = request.getParameter("llId1");
        String contractPeriod1 = request.getParameter("contractPeriod1");
        String assetName1 = request.getParameter("assetName1");
        String subclassifiedAstno1 = request.getParameter("subclassifiedAstno1");
        List<TenantUtilityDetails> gridData = new ArrayList<TenantUtilityDetails>();
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("tenantDetails", tenantDetailsDAO.list(sno, "TenantDetails"));
            modelMap.addAttribute("landLordDetails", tenantDetailsDAO.landLordDetailsList(landlordId));
            modelMap.addAttribute("contractNamee", tenantDetailsDAO.selectContractCodee(contractPeriod));
            modelMap.addAttribute("assetDetails", tenantDetailsDAO.assetDetails(assetName));
            modelMap.addAttribute("subassDetails", tenantDetailsDAO.subassDetails(assetName, subclassifiedAstno));
            gridData.addAll(assetDAO.tenantUtilityDetailslist(assetName, contractPeriod));
            modelMap.addAttribute("assetDetails1", gridData);
            modelMap.addAttribute("landlordDocuments", masterDAO.landlordDocuments(landlordId));
            modelMap.addAttribute("contDocument", contractDAO.ContractAttachlist(contractPeriod));
        }
        if (sno1 != null && !sno1.isEmpty()) {
            modelMap.addAttribute("tenantDetails", tenantDetailsDAO.list(sno1, "PortalTenantDetails"));
            modelMap.addAttribute("landLordDetails", tenantDetailsDAO.landLordDetailsList(landlordId1));
            modelMap.addAttribute("contractNamee", tenantDetailsDAO.selectContractCodee(contractPeriod1));
            modelMap.addAttribute("assetDetails", tenantDetailsDAO.assetDetails(assetName1));
            modelMap.addAttribute("subassDetails", tenantDetailsDAO.subassDetails(assetName1, subclassifiedAstno1));
            gridData.addAll(assetDAO.tenantUtilityDetailslist(assetName1, contractPeriod1));
            modelMap.addAttribute("assetDetails1", gridData);
            modelMap.addAttribute("landlordDocuments", masterDAO.landlordDocuments(landlordId1));
            modelMap.addAttribute("contDocument", contractDAO.ContractAttachlist(contractPeriod1));
        }
        String link = "../tenant/tenantDetailsForm.htm";
        String tab = "Tenant Details";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("tenantType", tenantDetailsDAO.tenantType());
        modelMap.addAttribute("tenantCategory", tenantDetailsDAO.tenantCategory());
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../tenant/tenantDetailsAppForm", modelMap);
    }
//**************Approval 1 Form Submit******************//

    @RequestMapping("/tenant/tenantDetailsAppSubmit.htm")
    public ModelAndView tenantDetailsAppSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, MessagingException, IOException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sno = request.getParameter("pk");
        String sno1 = request.getParameter("pk1");
        String tenantCode = request.getParameter("tenantCode");
        String remarks = request.getParameter("reviewerComments");
        String advanceAmount = request.getParameter("advanceAmount");
        String dueDate = request.getParameter("dueDate");
        String totalAmount = request.getParameter("totalAmount");
        String action = request.getParameter("action");
        String status = "";
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        Date dueDate1 = null;
        if (!dueDate.equals("")) {
            dueDate1 = (Date) formatter.parse(dueDate);
        }
        if (action.equalsIgnoreCase("edit1")) {
            tenantDetailsDAO.tenantDetailsApproveportal(sno1, "GFC Approved", remarks, advanceAmount, dueDate1, totalAmount);
        } else {
            tenantDetailsDAO.tenantDetailsApprove(sno, "GFC Approved", remarks, advanceAmount, dueDate1, totalAmount);
        }

        Common cm = new Common();
        String subject = "", tbody = "", mailbody = "", email = "", fileName = "", tenantFname = "", tenantLname = "", assetName = "";
        String userEmail = "excelarete@gmail.com";
        String password = "excel123";
        String toEmail = "";
        List<UserRegistration> ud = tenantDetailsDAO.udList("CFO");
        for (UserRegistration udlist : ud) {
            userId = udlist.getUserId();
            email = udlist.getEmail();

            if (!userEmail.isEmpty() && !password.isEmpty() && !email.isEmpty()) {
                List<TenantDetails> td = tenantDetailsDAO.tdList(userId, orgId, tenantCode);
                StringBuilder emailId = new StringBuilder(email);
                if (td.size() > 0) {
                    int i = 1;
                    for (TenantDetails tdlist : td) {

                        tenantFname = tdlist.getTenantFname();
                        tenantLname = tdlist.getTenantLname();
                        assetName = tdlist.getAssetName();
                    }
                    emailId.append(",");
                    emailId.append(toEmail);
                    String[] sendEmail = emailId.toString().split(",");
                    subject = "Tenant Code: " + tenantCode;
                    String filepath = request.getSession().getServletContext().getRealPath("common\\theme\\images\\logo1.png");
                    mailbody = "<html><body>Dear Sir/Madam,<br/><br/><br/>You need to give an approval for Tenant Details. Tenant Name : " + tenantFname + " " + tenantLname + ""
                            + " Please Approve this Tenant Details. <br/><br/>If approved ignore this mail. "
                            + "</body>"
                            + "<br/><br/>Thanks & Regards"
                            + "<br/>Al-Hashar Team.</html>";
                    ByteArrayOutputStream baos = new ByteArrayOutputStream();
                    baos.close();
                    cm.sendEmail(userEmail, password, sendEmail, subject, mailbody, baos, fileName);
                }
            }
        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        return new ModelAndView(new RedirectView("tenantDetailsAppList.htm"), modelMap);
    }

    //---------------------Penalty Details---------------------------------------------//
    //**************Penalty List******************//
    @RequestMapping("/tenant/penaltyDetailsList.htm")
    public ModelAndView penaltyDetailsList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Penalty";
        String submoduleName = "Penalty";
        String sno = request.getParameter("pk");
        //System.out.println("sno"+sno);
        //map.addAttribute("assetDetails", tenantDetailsDAO.list(sno, "AssetDetails"));
        map.addAttribute("penaltyDetails", tenantDetailsDAO.list1(sno, "PenaltyDetails"));
        //map.addAttribute("tenantDetails", tenantDetailsDAO.list(sno, "TenantDetails"));
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../tenant/penaltyDetailsList", map);
    }
//**************Penalty Form******************//

    @RequestMapping("/tenant/penaltyDetailsForm.htm")
    public ModelAndView penaltyDetailsForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        String tenantCode = request.getParameter("tenantCode");
        if (sno != null && !sno.isEmpty()) {
//           modelMap.addAttribute("billPayment", tenantDetailsDAO.list(sno, "BillPayment"));
            modelMap.addAttribute("penaltyDetails", masterDAO.list1(sno, "PenaltyDetails"));
            //modelMap.addAttribute("penaltyDetails", tenantDetailsDAO.penaltyDetails(tenantCode));
        }
        String link = "../tenant/penaltyDetailsForm.htm";
        String tab = "Penalty";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
//        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../tenant/penaltyDetailsForm", modelMap);
    }

    //**************Receipt Submit******************//
    @RequestMapping("/tenant/penaltyDetailsFormSubmit.htm")
    public ModelAndView penaltyDetailsFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");
        //String receiptNo = request.getParameter("receiptNo");
        //String penaltyDate1 = request.getParameter("penaltyDate");
        String penaltyFromDate = request.getParameter("penaltyFromDate");
        String penaltyToDate = request.getParameter("penaltyToDate");
        String penaltyType = request.getParameter("penaltyType");
        String tenantCode = request.getParameter("tenantCode");
        String tenantName = request.getParameter("tenantName");
        String assetNames = request.getParameter("assetNames");
        String buildingNo = request.getParameter("buildingNo");
        String blockNo = request.getParameter("blockNo");
        String streetNo = request.getParameter("streetNo");
        String plotNo = request.getParameter("plotNo");
//        String period = request.getParameter("period");
//        String period1 = request.getParameter("toDate");
//        String rentAmount = request.getParameter("rentAmount");
//        String dues = request.getParameter("dues");
//        String srNo = request.getParameter("srNo");
//        String serviceDues = request.getParameter("serviceDues");
//        String totalAmount = request.getParameter("totalAmount");
//        String modeOfPayment = request.getParameter("modeOfPayment");
//        String chequeNo = request.getParameter("chequeNo");
//        String bankName = request.getParameter("bankName");
//        String accountNo = request.getParameter("accountNo");
//        String dated = request.getParameter("dated");
//        String amount = request.getParameter("amount");
//        String otherAmount = request.getParameter("otherAmount");
//        String prepaid = request.getParameter("prepaid");
//        String prepaid1 = request.getParameter("prepaid1");
        String subassetCode = request.getParameter("subassetCode");
        String flotNo = request.getParameter("flotNo");
        String penaltyamount = request.getParameter("penaltyamount");
        String interestPer = request.getParameter("interestPer");
        String totalAmount = request.getParameter("totalAmount");
//        String serviceRequestedCost = request.getParameter("serviceRequestedCost");
//        System.out.println("vvv" + amount);
//        String status = request.getParameter("status");
//        String extra1 = request.getParameter("extra1");
//        String extra2 = request.getParameter("extra2");
//        String extra3 = request.getParameter("extra3");
//        String extra4 = request.getParameter("extra4");
//        String extra5 = request.getParameter("extra5");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
//        if (receiptNo == null || receiptNo == "" || "".equals(receiptNo)) {
//            ArrayList validuser = (ArrayList) tenantDetailsDAO.getBPNo(receiptDate);
//            String orderNo2 = null;
//            String orderNo1[] = null;
//            int ordno = 1;
//            if (!(validuser.isEmpty())) {
//                for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
//                    orderNo2 = iter.next();
//                }
//                orderNo1 = orderNo2.split("-");
//            }
//            if (orderNo2 != null) {
//                ordno = Integer.parseInt(orderNo1[1]) + 1;
//            }
//            receiptNo = "BILL" + "-" + ordno;
//        }         

        Date penaltyFromDate1 = null;
        if (!penaltyFromDate.equals("")) {
            penaltyFromDate1 = (Date) formatter.parse(penaltyFromDate);
        }
        Date penaltyToDate1 = null;
        if (!penaltyToDate.equals("")) {
            penaltyToDate1 = (Date) formatter.parse(penaltyToDate);
        }
//        Date dated1 = null;
//        if (!dated.equals("")) {
//            dated1 = (Date) formatter.parse(dated);
//        }
//        Date periodd = null;
//        if (!period.equals("")) {
//            periodd = (Date) formatter.parse(period);
//        }
//        Date period1d = null;
//        if (!period1.equals("")) {
//            period1d = (Date) formatter.parse(period1);
//        }
        if (pk == null) {
            PenaltyDetails type = new PenaltyDetails(orgId, userId, penaltyFromDate1, penaltyToDate1, penaltyType, tenantCode, tenantName, assetNames, buildingNo, blockNo, streetNo, plotNo, flotNo, subassetCode, "Update0", today, today, penaltyamount, interestPer, totalAmount);
            tenantDetailsDAO.globalSave(type);
        } else {
            PenaltyDetails type = new PenaltyDetails(Integer.parseInt(pk), orgId, userId, penaltyFromDate1, penaltyToDate1, penaltyType, tenantCode, tenantName, assetNames, buildingNo, blockNo, streetNo, plotNo, flotNo, subassetCode, "Update0", today, today, penaltyamount, interestPer, totalAmount);
            tenantDetailsDAO.globalSave(type);
        }

        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("penaltyDetails", tenantDetailsDAO.list1(pk, "PenaltyDetails"));
        return new ModelAndView(new RedirectView("../tenant/penaltyDetailsList.htm"), modelMap);
    }

    //---------------------Penalty Details---------------------------------------------//
    //**************Penalty List******************//
    @RequestMapping("/tenant/interestDetailsList.htm")
    public ModelAndView interestDetailsList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Interest";
        String submoduleName = "PenaltyAndInterest";
        String sno = request.getParameter("pk");
        //System.out.println("sno"+sno);
        //map.addAttribute("assetDetails", tenantDetailsDAO.list(sno, "AssetDetails"));
        map.addAttribute("interestDetails", tenantDetailsDAO.list2(sno, "InterestDetails"));
        //map.addAttribute("tenantDetails", tenantDetailsDAO.list(sno, "TenantDetails"));
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../tenant/interestDetailsList", map);
    }
//**************Penalty Form******************//

    @RequestMapping("/tenant/interestDetailsForm.htm")
    public ModelAndView interestDetailsForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        String tenantCode = request.getParameter("tenantCode");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("interestDetails", tenantDetailsDAO.list2(sno, "InterestDetails"));
            //  modelMap.addAttribute("penaltyDetails", masterDAO.list1(sno, "PenaltyDetails"));
            //modelMap.addAttribute("penaltyDetails", tenantDetailsDAO.penaltyDetails(tenantCode));
        }
        String link = "../tenant/interestDetailsForm.htm";
        String tab = "Interest";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
//        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../tenant/interestDetailsForm", modelMap);
    }

    //**************Receipt Submit******************//
    @RequestMapping("/tenant/interestDetailsFormSubmit.htm")
    public ModelAndView interestDetailsFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
        HttpSession session = request.getSession();
        // String userId = session.getAttribute("userId").toString();
        // String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");
        //String receiptNo = request.getParameter("receiptNo");
        String date1 = request.getParameter("period");
        String date2 = request.getParameter("toDate");
        //String penaltyType = request.getParameter("penaltyType");
        String tenantCode = request.getParameter("tenantCode");
        String tenantName = request.getParameter("tenantName");
        String assetNames = request.getParameter("assetNames");
        String buildingNo = request.getParameter("buildingNo");
        String blockNo = request.getParameter("blockNo");
        String streetNo = request.getParameter("streetNo");
        String plotNo = request.getParameter("plotNo");
//        String period = request.getParameter("period");
//        String period1 = request.getParameter("toDate");
//        String rentAmount = request.getParameter("rentAmount");
//        String dues = request.getParameter("dues");
//        String srNo = request.getParameter("srNo");
//        String serviceDues = request.getParameter("serviceDues");
//        String totalAmount = request.getParameter("totalAmount");
//        String modeOfPayment = request.getParameter("modeOfPayment");
//        String chequeNo = request.getParameter("chequeNo");
//        String bankName = request.getParameter("bankName");
//        String accountNo = request.getParameter("accountNo");
//        String dated = request.getParameter("dated");
//        String amount = request.getParameter("amount");
//        String otherAmount = request.getParameter("otherAmount");
//        String prepaid = request.getParameter("prepaid");
//        String prepaid1 = request.getParameter("prepaid1");
        String advanceAmount = request.getParameter("advanceAmount");
        String interestPer = request.getParameter("interestPer");
        String interestAmount = request.getParameter("interestAmount");
//        String serviceRequestedCost = request.getParameter("serviceRequestedCost");
//        System.out.println("vvv" + amount);
//        String status = request.getParameter("status");
//        String extra1 = request.getParameter("extra1");
//        String extra2 = request.getParameter("extra2");
//        String extra3 = request.getParameter("extra3");
//        String extra4 = request.getParameter("extra4");
//        String extra5 = request.getParameter("extra5");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
//        if (receiptNo == null || receiptNo == "" || "".equals(receiptNo)) {
//            ArrayList validuser = (ArrayList) tenantDetailsDAO.getBPNo(receiptDate);
//            String orderNo2 = null;
//            String orderNo1[] = null;
//            int ordno = 1;
//            if (!(validuser.isEmpty())) {
//                for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
//                    orderNo2 = iter.next();
//                }
//                orderNo1 = orderNo2.split("-");
//            }
//            if (orderNo2 != null) {
//                ordno = Integer.parseInt(orderNo1[1]) + 1;
//            }
//            receiptNo = "BILL" + "-" + ordno;
//        }

        Date period = null;
        if (!date1.equals("")) {
            period = (Date) formatter.parse(date1);
        }
        Date toDate = null;
        if (!date2.equals("")) {
            toDate = (Date) formatter.parse(date2);
        }
//        Date periodd = null;
//        if (!period.equals("")) {
//            periodd = (Date) formatter.parse(period);
//        }
//        Date period1d = null;
//        if (!period1.equals("")) {
//            period1d = (Date) formatter.parse(period1);
//        }
        if (pk == null || pk == "" || pk.equals("")) {
            InterestDetails type = new InterestDetails(period, toDate, tenantCode, tenantName, assetNames, buildingNo, blockNo, streetNo, plotNo, advanceAmount, interestPer, "Update0", today, today, interestAmount);
            tenantDetailsDAO.globalSave(type);
        } else {
            InterestDetails type = new InterestDetails(Integer.parseInt(pk), period, toDate, tenantCode, tenantName, assetNames, buildingNo, blockNo, streetNo, plotNo, advanceAmount, interestPer, "Update0", today, today, interestAmount);
            tenantDetailsDAO.globalSave(type);
        }

        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("interestDetails", tenantDetailsDAO.list2(pk, "InterestDetails"));
        return new ModelAndView(new RedirectView("../tenant/interestDetailsList.htm"), modelMap);
    }

    //**************Select Flat Pop-up******************//
    @RequestMapping("/tenant/subassetDetails.htm")
    public ModelAndView subassetDetails(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String status = req.getParameter("status");
        //String tenantCategory = req.getParameter("tenantCategory");
        modelMap.addAttribute("subassetDetails", tenantDetailsDAO.subassetDetails1(status));
        return new ModelAndView("subassetDetails", modelMap);
    }

    //---------------------Penalty Details---------------------------------------------//
    //**************Penalty List******************//
    @RequestMapping("/tenant/rentPostingList.htm")
    public ModelAndView rentPostingList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Rent Posting";
        String submoduleName = "Invoice Generation";
        String sno = request.getParameter("pk");
        //System.out.println("sno"+sno);
        //map.addAttribute("assetDetails", tenantDetailsDAO.list(sno, "AssetDetails"));
        map.addAttribute("RentPosting", tenantDetailsDAO.lists(sno, "RentPosting"));
        //map.addAttribute("tenantDetails", tenantDetailsDAO.list(sno, "TenantDetails"));
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../tenant/rentPostingList", map);
    }
//**************Penalty Form******************//

    @RequestMapping("/tenant/rentPostingForm.htm")
    public ModelAndView rentPostingForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        //String tenantCode = request.getParameter("tenantCode");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("RentPosting", tenantDetailsDAO.lists(sno, "RentPosting"));
            //modelMap.addAttribute("RentPosting", masterDAO.list1(sno, "RentPosting"));
            //modelMap.addAttribute("penaltyDetails", tenantDetailsDAO.penaltyDetails(tenantCode));
        }
        String link = "../tenant/rentPostingForm.htm";
        String tab = "Rent Posting";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../tenant/rentPostingForm", modelMap);
    }

    //**************Receipt Submit******************//
    @RequestMapping("/tenant/rentPostingFormSubmit.htm")
    public ModelAndView rentPostingFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");
        String assetName = request.getParameter("assetName");
        String subclassifiedAstno = request.getParameter("subclassifiedAstno");
        String buildingNo = request.getParameter("buildingNo");
        String wayNo = request.getParameter("wayNo");
        String assetArea = request.getParameter("assetArea");
        String blockNo = request.getParameter("blockNo");
        String plotNo = request.getParameter("plotNo");
        String streetNo = request.getParameter("streetNo");
        String assetPostalCode = request.getParameter("assetPostalCode");
        String assetPostboxNo = request.getParameter("assetPostboxNo");
        String waterBillno = request.getParameter("waterBillno");
        String electricityBillno = request.getParameter("electricityBillno");
        String rentpostingDate = request.getParameter("rentpostingDate");
        String rentpostingType = request.getParameter("rentpostingType");
        String landlordName = request.getParameter("landlordName");
        String mailId = request.getParameter("mailId");
        String contactNo = request.getParameter("contactNo");
        String advanceAmount = request.getParameter("advanceAmount");
        String rentAmount = request.getParameter("rentAmount");
        String status = request.getParameter("status");
        String rentpostingstatus = request.getParameter("rentpostingstatus");
        String actualRent = request.getParameter("actualRent");
        String minimumRentFixed = request.getParameter("minimumRentFixed");

        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
//        if (receiptNo == null || receiptNo == "" || "".equals(receiptNo)) {
//            ArrayList validuser = (ArrayList) tenantDetailsDAO.getBPNo(receiptDate);
//            String orderNo2 = null;
//            String orderNo1[] = null;
//            int ordno = 1;
//            if (!(validuser.isEmpty())) {
//                for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
//                    orderNo2 = iter.next();
//                }
//                orderNo1 = orderNo2.split("-");
//            }
//            if (orderNo2 != null) {
//                ordno = Integer.parseInt(orderNo1[1]) + 1;
//            }
//            receiptNo = "BILL" + "-" + ordno;
//        }
        Date rentpostingDate1 = null;
        if (!rentpostingDate.equals("")) {
            rentpostingDate1 = (Date) formatter.parse(rentpostingDate);
        }
//        Date dated1 = null;
//        if (!dated.equals("")) {
//            dated1 = (Date) formatter.parse(dated);
//        }
//        Date periodd = null;
//        if (!period.equals("")) {
//            periodd = (Date) formatter.parse(period);
//        }
//        Date period1d = null;
//        if (!period1.equals("")) {
//            period1d = (Date) formatter.parse(period1);
//        }
        if (pk == null || pk == "" || pk.equals("")) {
            RentPosting type = new RentPosting(orgId, userId, assetName, subclassifiedAstno, buildingNo, wayNo, assetArea, blockNo, plotNo, streetNo, assetPostalCode, assetPostboxNo, waterBillno, electricityBillno, rentpostingDate1, rentpostingType, landlordName, mailId, contactNo, advanceAmount, rentAmount, "Update0", rentpostingstatus, today, today, actualRent, minimumRentFixed);
            tenantDetailsDAO.globalSave(type);
        } else {
            RentPosting type = new RentPosting(Integer.parseInt(pk), orgId, userId, assetName, subclassifiedAstno, buildingNo, wayNo, assetArea, blockNo, plotNo, streetNo, assetPostalCode, assetPostboxNo, waterBillno, electricityBillno, rentpostingDate1, rentpostingType, landlordName, mailId, contactNo, advanceAmount, rentAmount, "Update0", rentpostingstatus, today, today, actualRent, minimumRentFixed);
            tenantDetailsDAO.globalSave(type);
        }

        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("RentPosting", tenantDetailsDAO.lists(pk, "RentPosting"));
        return new ModelAndView(new RedirectView("../tenant/rentPostingList.htm"), modelMap);
    }

    //Newly added by lakshmi for Invoice on 12mar2019
    @RequestMapping("/finance/rentInvoiceList1.htm")
    public ModelAndView rentInvoiceList1(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Rent Invoice";
        String submoduleName = "Invoice Generation";
        String sno = request.getParameter("pk");
        String propertyName = request.getParameter("propertyName");
        String flatNo = request.getParameter("flatNo");
        String tenantId = request.getParameter("tenantId");
        String dated = request.getParameter("dated");
        Date rentInvoiceDate1 = null;
//        if (!dated.equals("")&&dated !=null) {
//            rentInvoiceDate1 = (Date) formatter.parse(dated);
//        }
        //RentNotificationProcedure.callOracleStoredProcINParameterRentInvoice();
        //System.out.println("sno"+sno);
        //map.addAttribute("assetDetails", tenantDetailsDAO.list(sno, "AssetDetails"));
        //map.addAttribute("RentPosting", tenantDetailsDAO.lists(sno, "RentPosting"));
        //map.addAttribute("tenantDetails", tenantDetailsDAO.list(sno, "TenantDetails"));
        map.addAttribute("rentInvoicelist", tenantDetailsDAO.rentList(propertyName, flatNo, tenantId, rentInvoiceDate1));
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../finance/rentInvoiceList", map);
    }

    @RequestMapping("/finance/rentInvoiceList.htm")
    public ModelAndView rentInvoiceList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Rent Invoice";
        String submoduleName = "Invoice Generation";
        String sno = request.getParameter("pk");
        String propertyName = request.getParameter("propertyName");
        String flatNo = request.getParameter("flatNo");
        String tenantId = request.getParameter("tenantId");
        String dated = request.getParameter("dated");
        Date rentInvoiceDate1 = null;
        if (propertyName != "" && propertyName != null && dated != "" && dated != null && tenantId != "" && tenantId != null) {
            map.addAttribute("invoiceList", tenantDetailsDAO.rentList(propertyName, flatNo, tenantId, rentInvoiceDate1));
        } else {
            map.addAttribute("invoiceList", tenantDetailsDAO.invoiceList());
        }
        //RentNotificationProcedure.callOracleStoredProcINParameterRentInvoice();
        map.addAttribute("propertyNames", tenantDetailsDAO.rentList("property"));
//        map.addAttribute("flatNumbers", tenantDetailsDAO.rentList("flat"));
//        map.addAttribute("tenantId", tenantDetailsDAO.rentList("tenantId"));

        map.addAttribute("invoiceList1", tenantDetailsDAO.invoiceList1());
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../finance/rentInvoiceList", map);
    }

    @RequestMapping("/finance/rentInvoiceForm.htm")
    public ModelAndView rentInvoiceForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        System.out.println("Rent Invoice Form");
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        //String tenantCode = request.getParameter("tenantCode");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("billPayment", tenantDetailsDAO.list(sno, "BillPayment"));
            modelMap.addAttribute("tenantDetails", tenantDetailsDAO.invoiceDetails(sno));
            //modelMap.addAttribute("contractNamee", tenantDetailsDAO.selectContractCodee());
        }
        //String link = "../finance/rentInvoiceForm.htm";
        // String tab = "Rent Invoice";
        //modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        //modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        System.out.println("action" + request.getParameter("action"));

        return new ModelAndView("../finance/rentInvoiceForm", modelMap);
    }

    @RequestMapping("../tenant/rentInvoiceFormSubmit.htm")
    public ModelAndView rentInvoiceFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");
        String tenantCode = request.getParameter("tenantCode");
        String tenantName = request.getParameter("tenantName");
        String tenantId = request.getParameter("tenantId");
        String invoiceDate =request.getParameter("invoiceDate");
        String tenantCategory = request.getParameter("tenantCategory");
        String assetName = request.getParameter("assetNames");
        String assetCode = request.getParameter("assetCode");
        String subassetCode = request.getParameter("subassetCode");
        String flatNo = request.getParameter("flotNo");
        String buildingNo = request.getParameter("buildingNo");
        String blockNo = request.getParameter("blockNo");
        String streetNo = request.getParameter("streetNo");
        String plotNo = request.getParameter("plotNo");
        String rentAmount = request.getParameter("rentAmount");
        String contractName = request.getParameter("contractName");
        String contractCode = request.getParameter("contractCode");
        String billingCycle = request.getParameter("billingCycle");
        String period = request.getParameter("period");
        String period1 = request.getParameter("toDate");
        String invoiceNo = request.getParameter("invoiceNo");
        String dueDate = request.getParameter("dueDate");

        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());

        Date startsFrom = null;
        if (null != period && !"".equals(period)) {
            startsFrom = (Date) formatter.parse(period);
        }
        Date endsTo = null;
        if (null != period1 && !"".equals(period1)) {
            endsTo = (Date) formatter.parse(period1);
        }

        Date dueDate1 = null;
        if (null != dueDate && !"".equals(dueDate)) {
            dueDate1 = (Date) formatter.parse(dueDate);
        }
        
        
         Date invoiceDate1 = null;
        if (null != invoiceDate && !"".equals(invoiceDate)) {
            invoiceDate1 = (Date) formatter.parse(invoiceDate);
        }

        if (pk == null || pk == "" || pk.equals("")) {
            //=====================code for getting tenant code======================================
            ArrayList validuser = (ArrayList) tenantDetailsDAO.getInvoiceNo(tenantCode);
            String orderNo2 = null;
            String orderNo1[] = null;
            int ordno = 1;
            if (!(validuser.isEmpty())) {
                for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
                    orderNo2 = iter.next();
                }
                orderNo1 = orderNo2.split("-");
            }
           if (orderNo2 != null) {
                ordno = Integer.parseInt(orderNo1[1]) + 1;
            }
            invoiceNo = "INV" + "-" + ordno;
            //=====================end code for getting tenant code======================================
            Invoice invoice = new Invoice(tenantCode, tenantName, tenantId, billingCycle, tenantCategory, assetCode, assetName, flatNo, plotNo, buildingNo, blockNo, streetNo, subassetCode, rentAmount, contractName, startsFrom, endsTo, today, null, invoiceNo, "Invoice Generated", today, dueDate1,invoiceDate1);
            tenantDetailsDAO.globalSave(invoice);
        } else {
            Invoice invoice = new Invoice(Integer.parseInt(pk), tenantCode, tenantName, tenantId, billingCycle, tenantCategory, assetCode, assetName, flatNo, plotNo, buildingNo, blockNo, streetNo, subassetCode, rentAmount, contractName, startsFrom, endsTo, today, null, invoiceNo, "Invoice Generated", today, dueDate1,invoiceDate1);
            tenantDetailsDAO.globalSave(invoice);
        }

        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("invoiceList", tenantDetailsDAO.lists(pk, "Invoice"));
        return new ModelAndView(new RedirectView("../tenant/rentInvoiceList.htm"), modelMap);
    }

    @RequestMapping("../tenant/getFlatNo.htm")
    public void getFlatNo(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        try {

            String propertyName = request.getParameter("propertyName");
            List<String> flatNo = tenantDetailsDAO.getFlatNo(propertyName);
            String data = new Gson().toJson(flatNo);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @RequestMapping("../tenant/getTenantId.htm")
    public void getTenantId(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        try {

            String flatNo = request.getParameter("flatNo");
            List<String> tenantID = tenantDetailsDAO.getTenantId(flatNo);
            String data = new Gson().toJson(tenantID);
            response.setContentType("text/html");
            response.getWriter().write(data);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @RequestMapping("/tenant/rentInvoiceFormVoid.htm")
    public ModelAndView rentInvoiceFormVoid(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
        //ModelMap map = new ModelMap();
        String sno = request.getParameter("sno");
//        String tenantCode = request.getParameter("tenantCode");
//        String assetName = request.getParameter("propertyName");
//        String invoiceNo = request.getParameter("invoiceNo");
//        String dueDate = request.getParameter("dueDate");
        String values[];
        String row = null;
        Integer sno1;
        String tenantCode = "";
        String assetCode = "";
        String invoiceNo = "";
        Date dueDate = null;

        ArrayList validuser = (ArrayList) tenantDetailsDAO.getInvoiceDetails("SNO", sno);
        ArrayList validuser1 = (ArrayList) tenantDetailsDAO.getInvoiceDetails("invoiceNo", sno);
        ArrayList validuser2 = (ArrayList) tenantDetailsDAO.getInvoiceDetails("tenantCode", sno);
        ArrayList validuser3 = (ArrayList) tenantDetailsDAO.getInvoiceDetails("assetCode", sno);
//        ArrayList validuser4 = (ArrayList) tenantDetailsDAO.getInvoiceDetails("dueDate",sno);

        for (Iterator<Integer> iter = validuser.iterator(); iter.hasNext();) {
            sno1 = iter.next();
        }
        for (Iterator<String> iter = validuser1.iterator(); iter.hasNext();) {
            invoiceNo = iter.next();
        }
        for (Iterator<String> iter = validuser2.iterator(); iter.hasNext();) {
            tenantCode = iter.next();
        }
        for (Iterator<String> iter = validuser3.iterator(); iter.hasNext();) {
            assetCode = iter.next();
        }
//        for (Iterator<Date> iter = validuser4.iterator(); iter.hasNext();) {
//        dueDate = iter.next();
//        }
//        Date dueDate1 = null;
//        if (null != dueDate && !"".equals(dueDate)) {
//            dueDate1 = (Date) formatter.parse(dueDate);
//        }

//        values = row.split(",");
//        sno1 = values[0];
//        tenantCode = values[2];
//        assetName = values[4];
//        invoiceNo = values[1];
//        dueDate = values[3];
        tenantDetailsDAO.voideRecord(sno, tenantCode, assetCode, invoiceNo);
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("invoiceList", tenantDetailsDAO.lists(sno, "Invoice"));
        return new ModelAndView(new RedirectView("../tenant/rentInvoiceList.htm"), modelMap);
    }

    @RequestMapping("/tenant/billPaymentFormVoid.htm")
    public ModelAndView billPaymentFormVoid(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        //ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("sno");
//        String receiptNo = request.getParameter("receiptNo");
//        String tenantCode = request.getParameter("tenantCode");
//        String propertyName = request.getParameter("propertyName");
//        String receiptDate = request.getParameter("receiptDate");
//        String chequeType = request.getParameter("chequeType");
//        String invoiceNo = request.getParameter("invoiceNo");

//         String values[];
//        String row = null;
//        Integer sno1;
//        String tenantCode = "";
//        String assetCode = "";
//        String invoiceNo = "";
//        Date dueDate=null;
//
//        ArrayList validuser = (ArrayList) tenantDetailsDAO.getInvoiceDetails("SNO",sno);
//        ArrayList validuser1 = (ArrayList) tenantDetailsDAO.getInvoiceDetails("invoiceNo",sno);
//        ArrayList validuser2 = (ArrayList) tenantDetailsDAO.getInvoiceDetails("tenantCode",sno);
//        ArrayList validuser3 = (ArrayList) tenantDetailsDAO.getInvoiceDetails("assetCode",sno);
////        ArrayList validuser4 = (ArrayList) tenantDetailsDAO.getInvoiceDetails("dueDate",sno);
//        
//        for (Iterator<Integer> iter = validuser.iterator(); iter.hasNext();) {
//             sno1 = iter.next();
//        }
//        for (Iterator<String> iter = validuser1.iterator(); iter.hasNext();) {
//        invoiceNo = iter.next();
//        }
//        for (Iterator<String> iter = validuser2.iterator(); iter.hasNext();) {
//        tenantCode = iter.next();
//        }
//        for (Iterator<String> iter = validuser3.iterator(); iter.hasNext();) {
//        assetCode = iter.next();
//        }
        ArrayList billpayment = (ArrayList) tenantDetailsDAO.getBillPaymentDetails("tenantCode", sno);
        ArrayList billpayment1 = (ArrayList) tenantDetailsDAO.getBillPaymentDetails("receiptNo", sno);
        ArrayList billpayment2 = (ArrayList) tenantDetailsDAO.getBillPaymentDetails("propertyName", sno);
        //ArrayList billpayment3 = (ArrayList) tenantDetailsDAO.getBillPaymentDetails("receiptDate",sno);
        ArrayList billpayment4 = (ArrayList) tenantDetailsDAO.getBillPaymentDetails("invoiceNo", sno);

        String tenantCode = "";
        String receiptNo = "";
        String propertyName = "";
        String receiptDate = "";
        String invoiceNo = "";

        for (Iterator<String> iter = billpayment.iterator(); iter.hasNext();) {
            tenantCode = iter.next();
        }
        for (Iterator<String> iter = billpayment1.iterator(); iter.hasNext();) {
            receiptNo = iter.next();
        }
        for (Iterator<String> iter = billpayment2.iterator(); iter.hasNext();) {
            propertyName = iter.next();
        }
//        for (Iterator<String> iter = billpayment3.iterator(); iter.hasNext();) {
//        receiptDate = iter.next();
//        }
        for (Iterator<String> iter = billpayment4.iterator(); iter.hasNext();) {
            invoiceNo = iter.next();
        }

        tenantDetailsDAO.billPaymentVoideRecord(sno, tenantCode, receiptNo, propertyName, invoiceNo);
        tenantDetailsDAO.voideRecord1(sno, tenantCode, receiptNo, propertyName, invoiceNo);
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("billPayment", tenantDetailsDAO.list(sno, "BillPayment"));
        return new ModelAndView(new RedirectView("../tenant/billPaymentList.htm"), modelMap);
    }

    @RequestMapping("/tenant/selectContract.htm")
    public ModelAndView selectContract(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String tenantCategory = req.getParameter("tenantCategory");
//        String flatNo = req.getParameter("flatNo");
        String flatNo = req.getParameter("flatNo");

        modelMap.addAttribute("contractName", tenantDetailsDAO.selectContractCode(tenantCategory, flatNo));

        return new ModelAndView("../finance/selectContract", modelMap);
    }

    @RequestMapping("/tenant/tenantDetailsPopUp.htm")
    public ModelAndView tenantDetailsPopUp(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("selectTenant", tenantDetailsDAO.selectTenant());
        return new ModelAndView("../finance/tenantDetailsPopUp", modelMap);
    }
    //***********************

//**************Approval 2 List******************//
    @RequestMapping("/tenant/tenantDetailsAppList1.htm")
    public ModelAndView tenantDetailsAppList1(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Approval 2";
        String submoduleName = "Tenant Details";
        String sno = request.getParameter("pk");
        map.addAttribute("contCreat", contractDAO.list("", "ContractCreation"));
        map.addAttribute("tenantDetails", tenantDetailsDAO.cfoApproved(sno));
        map.addAttribute("tenantDetails1", tenantDetailsDAO.cfoApproved1(sno));
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../tenant/tenantDetailsAppList1", map);
    }
//**************Approval 2 Form******************//

    @RequestMapping("/tenant/tenantDetailsAppForm1.htm")
    public ModelAndView tenantDetailsAppForm1(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sno = request.getParameter("pk");
        String landlordId = request.getParameter("llId");
        String contractPeriod = request.getParameter("contractPeriod");
        String assetName = request.getParameter("assetName");
        String subclassifiedAstno = request.getParameter("subclassifiedAstno");
        String sno1 = request.getParameter("pk1");
        String landlordId1 = request.getParameter("llId1");
        String contractPeriod1 = request.getParameter("contractPeriod1");
        String assetName1 = request.getParameter("assetName1");
        String subclassifiedAstno1 = request.getParameter("subclassifiedAstno1");
        List<TenantUtilityDetails> gridData = new ArrayList<TenantUtilityDetails>();
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("tenantDetails", tenantDetailsDAO.list(sno, "TenantDetails"));
            modelMap.addAttribute("landLordDetails", tenantDetailsDAO.landLordDetailsList(landlordId));
            modelMap.addAttribute("contractNamee", tenantDetailsDAO.selectContractCodee(contractPeriod));
            modelMap.addAttribute("assetDetails", tenantDetailsDAO.assetDetails(assetName));
            modelMap.addAttribute("subassDetails", tenantDetailsDAO.subassDetails(assetName, subclassifiedAstno));
            modelMap.addAttribute("landlordDocuments", masterDAO.landlordDocuments(landlordId));
            gridData.addAll(assetDAO.tenantUtilityDetailslist(assetName, contractPeriod));
            modelMap.addAttribute("assetDetails1", gridData);
            modelMap.addAttribute("contDocument", contractDAO.ContractAttachlist(contractPeriod));
        }
        if (sno1 != null && !sno1.isEmpty()) {
            modelMap.addAttribute("tenantDetails", tenantDetailsDAO.list(sno1, "PortalTenantDetails"));
            modelMap.addAttribute("landLordDetails", tenantDetailsDAO.landLordDetailsList(landlordId1));
            modelMap.addAttribute("contractNamee", tenantDetailsDAO.selectContractCodee(contractPeriod1));
            modelMap.addAttribute("assetDetails", tenantDetailsDAO.assetDetails(assetName1));
            modelMap.addAttribute("subassDetails", tenantDetailsDAO.subassDetails(assetName1, subclassifiedAstno1));
            modelMap.addAttribute("landlordDocuments", masterDAO.landlordDocuments(landlordId1));
            gridData.addAll(assetDAO.tenantUtilityDetailslist(assetName1, contractPeriod1));
            modelMap.addAttribute("assetDetails1", gridData);
            modelMap.addAttribute("contDocument", contractDAO.ContractAttachlist(contractPeriod1));
        }
        String link = "../tenant/tenantDetailsForm.htm";
        String tab = "Tenant Details";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("tenantType", tenantDetailsDAO.tenantType());
        modelMap.addAttribute("tenantCategory", tenantDetailsDAO.tenantCategory());
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../tenant/tenantDetailsAppForm1", modelMap);
    }
//**************Approval 2 Submit******************//

    @RequestMapping("/tenant/tenantDetailsAppSubmit1.htm")
    public ModelAndView tenantDetailsAppSubmit1(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
        String sno = request.getParameter("pk");
        String sno1 = request.getParameter("pk1");
        String remarks = request.getParameter("reviewerComments");
        String advanceAmount = request.getParameter("advanceAmount");
        String dueDate = request.getParameter("dueDate");
        String totalAmount = request.getParameter("totalAmount");
        String action = request.getParameter("action");
        String tenantCode = request.getParameter("tenantCode");
        String tenantType = request.getParameter("tenantType");
        String tenantCategory = request.getParameter("tenantCategory");
        String tenantId = request.getParameter("tenantId");
        String tenantFname = request.getParameter("tenantFname");
        String tenantLname = request.getParameter("tenantLname");
        String tenantCitizenship = request.getParameter("tenantCitizenship");
        String tenantCrNo = request.getParameter("tenantCrNo");
        String tenantContactno = request.getParameter("tenantContactno");
        String tenantWorkContactno = request.getParameter("tenantWorkContactno");
        String tenantMailid = request.getParameter("tenantMailid");
        String permanentAddress = request.getParameter("permanentAddress");
        String correspondenceAddress = request.getParameter("correspondenceAddress");
        String postalCode = request.getParameter("postalCode");
        String postboxNo = request.getParameter("postboxNo");
        String sponcerName = request.getParameter("sponcerName");
        String sponcerAddress = request.getParameter("sponcerAddress");
        String companyName = request.getParameter("companyName");
        String companyAddress = request.getParameter("companyAddress");
        String postalCode1 = request.getParameter("postalCode1");
        String postboxNo1 = request.getParameter("postboxNo1");
        String jointeeName1 = request.getParameter("jointeeName1");
        String jointeeAddress1 = request.getParameter("jointeeAddress1");
        String jointeeName2 = request.getParameter("jointeeName2");
        String jointeeAddress2 = request.getParameter("jointeeAddress2");
        String remarks1 = request.getParameter("remarks");
        String tenantAttachment = request.getParameter("tenantAttachment");
        String tenOrgfileName = request.getParameter("tenOrgfileName");

        String status = "";
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        Date dueDate1 = null;
        if (!dueDate.equals("")) {
            dueDate1 = (Date) formatter.parse(dueDate);
        }

        if (action.equalsIgnoreCase("edit1")) {
            byte[] Content1 = null;
            tenOrgfileName = tenantDetailsDAO.getTenOrgfileName1(tenantCode);
            Content1 = tenantDetailsDAO.getTenantAttachment1(tenantCode);
            tenantDetailsDAO.tenantDetailsApprove11(sno1, "CFO Approved", remarks, advanceAmount, dueDate1, totalAmount);
            tenantDetailsDAO.tenantDetailsApprove12(tenantType, tenantCategory, tenantId, tenantFname, tenantLname, tenantCitizenship, tenantCrNo, tenantContactno, tenantWorkContactno, tenantMailid, permanentAddress, correspondenceAddress, postalCode, postboxNo, sponcerName, sponcerAddress, companyName, companyAddress, postalCode1, postboxNo1, jointeeName1, jointeeAddress1, jointeeName2, jointeeAddress2, remarks1, tenOrgfileName, Content1);
            //tenantDetailsDAO.tenantDetailsApprove122(tenantId, tenOrgfileName, Content1);
        } else {
            tenantDetailsDAO.tenantDetailsApprove1(sno, "CFO Approved", remarks, advanceAmount, dueDate1, totalAmount);
        }

        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        return new ModelAndView(new RedirectView("tenantDetailsAppList1.htm"), modelMap);
    }
//**************GFC Recheck Update******************//

    @RequestMapping("/tenant/reCheckSubmit.htm")
    public ModelAndView reCheckSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String sno = request.getParameter("pk");
        String tenantCode = request.getParameter("tenantCode");
        String appstatus = request.getParameter("appstatus");
        String appremarks = request.getParameter("appremarks");
        tenantDetailsDAO.tenantReject(tenantCode, appstatus, appremarks);
        return new ModelAndView(new RedirectView("../tenant/tenantDetailsList.htm"), map);
    }
//**************GFC Reject Update******************//

    @RequestMapping("/tenant/tenantReject.htm")
    public ModelAndView tenantReject(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String tenantCode = request.getParameter("tenantCode");
        String subAstno = request.getParameter("subAstno");
        String appstatus = request.getParameter("appstatus");
        String appremarks = request.getParameter("appremarks");
        tenantDetailsDAO.tenantReject(tenantCode, appstatus, appremarks);
        tenantDetailsDAO.updateSubasset1(subAstno, "Vacant");
        return new ModelAndView(new RedirectView("../tenant/tenantDetailsRejList.htm"), map);
    }

    @RequestMapping("/tenant/tenantReject11.htm")
    public ModelAndView tenantReject11(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String tenantCode = request.getParameter("tenantCode");
        String subAstno = request.getParameter("subAstno");
        String appstatus = request.getParameter("appstatus");
        String appremarks = request.getParameter("appremarks");
        tenantDetailsDAO.tenantReject11(tenantCode, appstatus, appremarks);
        return new ModelAndView(new RedirectView("../tenant/tenantDetailsRejList.htm"), map);
    }

    @RequestMapping("/tenant/tenantReject12.htm")
    public ModelAndView tenantReject12(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String tenantCode = request.getParameter("tenantCode");
        String subAstno = request.getParameter("subAstno");
        String appstatus = request.getParameter("appstatus");
        String appremarks = request.getParameter("appremarks");
        tenantDetailsDAO.tenantReject12(tenantCode, appstatus, appremarks);
        return new ModelAndView(new RedirectView("../tenant/tenantDetailsRejList.htm"), map);
    }
//**************CFO Reject Update******************//

    @RequestMapping("/tenant/tenantReject1.htm")
    public ModelAndView tenantReject1(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String tenantCode = request.getParameter("tenantCode");
        String subAstno = request.getParameter("subAstno");
        String appstatus = request.getParameter("appstatus");
        String appremarks = request.getParameter("appremarks");
        tenantDetailsDAO.tenantReject1(tenantCode, appstatus, appremarks);
        tenantDetailsDAO.updateSubasset1(subAstno, "Vacant");
        return new ModelAndView(new RedirectView("../tenant/tenantDetailsRejList.htm"), map);
    }
//**************Tenant Rejected List******************//

    @RequestMapping("/tenant/tenantDetailsRejList.htm")
    public ModelAndView tenantDetailsRejList(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Rejected Tenants";
        String submoduleName = "Tenant Details";
        String sno = request.getParameter("pk");
        map.addAttribute("tenantDetailsRej", tenantDetailsDAO.tenantDetailsRej(sno));
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../tenant/tenantDetailsRejList", map);
    }
//**************Tenant Rejected Form******************//

    @RequestMapping("/tenant/tenantDetailsRejForm.htm")
    public ModelAndView tenantDetailsRejForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sno = request.getParameter("pk");
        String landlordId = request.getParameter("llId");
        String contractPeriod = request.getParameter("contractPeriod");
        String assetName = request.getParameter("assetName");
        String subclassifiedAstno = request.getParameter("subclassifiedAstno");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("tenantDetails", tenantDetailsDAO.list(sno, "TenantDetails"));
            modelMap.addAttribute("landLordDetails", tenantDetailsDAO.landLordDetailsList(landlordId));
            modelMap.addAttribute("contractNamee", tenantDetailsDAO.selectContractCodee(contractPeriod));
            modelMap.addAttribute("assetDetails", tenantDetailsDAO.assetDetails(assetName));
            modelMap.addAttribute("subassDetails", tenantDetailsDAO.subassDetails(assetName, subclassifiedAstno));
            modelMap.addAttribute("landlordDocuments", masterDAO.landlordDocuments(landlordId));
            modelMap.addAttribute("contDocument", contractDAO.ContractAttachlist(contractPeriod));
        }
        String link = "../tenant/tenantDetailsForm.htm";
        String tab = "Tenant Details";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("tenantType", tenantDetailsDAO.tenantType());
        modelMap.addAttribute("tenantCategory", tenantDetailsDAO.tenantCategory());
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../tenant/tenantDetailsRejForm", modelMap);
    }
//-------------------------End of Tenant Approval--------------------------------------------------//

//---------------------Bill Payment Details---------------------------------------------//
//**************Receipt List******************//
    @RequestMapping("/tenant/billPaymentList.htm")
    public ModelAndView billPaymentList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        if (fromDate != null && toDate != null) {
            if (fromDate.contains("frdate") && toDate.contains("todate")) {
                fromDate = null;
                toDate = null;
            }
        }
        String tabName = "Receipt";
        String submoduleName = "Receipt";
        String sno = request.getParameter("pk");
        String chequeType = request.getParameter("chequeType");
        if (fromDate == null || toDate == null) {
            if ("PDC".equals(chequeType)) {
                map.addAttribute("billPayment", tenantDetailsDAO.listBill());
            } else if ("CDC".equals(chequeType)) {
                map.addAttribute("billPayment", tenantDetailsDAO.listBill1());
            } else {
                map.addAttribute("billPayment", tenantDetailsDAO.billlist("BillPayment"));
            }
            map.addAttribute("assetDetails", tenantDetailsDAO.list(sno, "AssetDetails"));
            map.addAttribute("tenantDetails", tenantDetailsDAO.list(sno, "TenantDetails"));
        } else {
            if ("PDC".equals(chequeType)) {
                map.addAttribute("billPayment", tenantDetailsDAO.listBill1fromtodate(fromDate, toDate));
            } else if ("CDC".equals(chequeType)) {
                map.addAttribute("billPayment", tenantDetailsDAO.listBill11(fromDate, toDate));
            } else {
                map.addAttribute("billPayment", tenantDetailsDAO.billlist1("BillPayment", fromDate, toDate, chequeType));
            }
            map.addAttribute("assetDetails", tenantDetailsDAO.listFromToDates(sno, "AssetDetails", fromDate, toDate));
            map.addAttribute("tenantDetails", tenantDetailsDAO.listFromToDates(sno, "TenantDetails", fromDate, toDate));
        }

        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../tenant/billPaymentList", map);
    }
//**************Receipt Form******************//

    @RequestMapping("/tenant/billPaymentForm.htm")
    public ModelAndView billPaymentForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        String tenantCode = request.getParameter("tenantCode");
        String flotNo = request.getParameter("flotNo");
        String Invoice = request.getParameter("invoiceNumber");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("billPayment", tenantDetailsDAO.list(sno, "BillPayment"));
            modelMap.addAttribute("tenantDetails", tenantDetailsDAO.tenantDetails(tenantCode,sno,flotNo));
            modelMap.addAttribute("contractNamee", tenantDetailsDAO.selectContractCodee());
            modelMap.addAttribute("invoiceNo", tenantDetailsDAO.selectInvoiceNo(sno));
        }
        String link = "../tenant/billPaymentForm.htm";
        String tab = "Receipt";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("invoiceNo", tenantDetailsDAO.selectInvoiceNo(sno));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../tenant/billPaymentForm", modelMap);
    }

    //**********Default Rent Payment List*************\\
    @RequestMapping("/tenant/defaultRentPaymentList.htm")
    public ModelAndView defaultRentPaymentList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();

        RentNotificationProcedure.callOracleStoredProcINParameter();
            String tabName = "Default Rent Payments";
        String submoduleName = "Penalty";
        String sno = request.getParameter("pk");

        map.addAttribute("defaultRentlist", tenantDetailsDAO.defaultRentlist());
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../tenant/defaultRentPaymentList", map);
    }
//**************Tenant Pop-up******************//

    @RequestMapping("/tenant/selectTenant.htm")
    public ModelAndView selectTenant(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("selectTenant", tenantDetailsDAO.selectTenant());
        return new ModelAndView("selectTenant", modelMap);
    }

    //**************Penalty Pop-up******************//
    @RequestMapping("/tenant/selectPenaltyType.htm")
    public ModelAndView selectPenaltyType(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("selectPenaltyType", tenantDetailsDAO.selectPenaltyType());
        return new ModelAndView("selectPenaltyType", modelMap);
    }

    //**************Landlord Pop-up******************//
    @RequestMapping("/tenant/selectLandlordProperty.htm")
    public ModelAndView selectLandlordProperty(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        //String assetName = req.getParameter("assetName");
        //String flatno = req.getParameter("flatno");
        modelMap.addAttribute("selectLandlordProperty", tenantDetailsDAO.selectLandlordProperty());
        return new ModelAndView("selectLandlordProperty", modelMap);
    }

    @RequestMapping("/tenant/selectTenantForInterest.htm")
    public ModelAndView selectTenantForInterest(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("selectTenantForInterest", tenantDetailsDAO.selectTenantForInterest());
        return new ModelAndView("selectTenantForInterest", modelMap);
    }
//**************Service Request Pop-up******************//

//**************Service Request Pop-up******************//
    @RequestMapping("/tenant/selectSRNo.htm")
    public ModelAndView selectSRNo(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String tenantCode = req.getParameter("tenantCode");
        modelMap.addAttribute("selectSRNo", tenantDetailsDAO.serviceReq(tenantCode));

        return new ModelAndView("selectSRNo", modelMap);
    }

    //**************Penalty Pop-up******************//
    @RequestMapping("/tenant/selectPenalty.htm")
    public ModelAndView selectPenalty(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String tenantCode = req.getParameter("tenantCode");
        modelMap.addAttribute("selectPenalty", tenantDetailsDAO.penaltyCal(tenantCode));

        return new ModelAndView("selectPenalty", modelMap);
    }

//**************Tenant Advances Pop-up******************//
    @RequestMapping("/tenant/selectTenantA.htm")
    public ModelAndView selectTenantA(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("selectTenant", tenantDetailsDAO.selectTenant());
        return new ModelAndView("selectTenantA", modelMap);
    }
//**************Tenant Rents Pop-up******************//

    @RequestMapping("/tenant/selectTenantR.htm")
    public ModelAndView selectTenantR(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("selectTenant", tenantDetailsDAO.selectTenant());
        return new ModelAndView("selectTenantR", modelMap);
    }

    @RequestMapping("/tenant/selectInvoice.htm")
    public ModelAndView selectInvoice(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {

        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String tenantCode = req.getParameter("tenantCode");

        modelMap.addAttribute("selectInvoice", tenantDetailsDAO.selectInvoice(tenantCode));
        return new ModelAndView("selectInvoice", modelMap);
    }

//**************Tenant Check History Pop-up******************//
    @RequestMapping("/tenant/selectchkHistory.htm")
    public ModelAndView selectchkHistory(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String tenantCode = req.getParameter("tenantCode");
        String receiptType = req.getParameter("receiptType");
        String contractCode = req.getParameter("contractCode");
        modelMap.addAttribute("selectchkHistory", tenantDetailsDAO.selectBillPayment(tenantCode, receiptType, contractCode));
        return new ModelAndView("selectchkHistory", modelMap);
    }
//**************Receipt Submit******************//

    @RequestMapping("/tenant/billPaymentFormSubmit.htm")
    public ModelAndView billPaymentFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");
        String receiptNo = request.getParameter("receiptNo");
        String receiptDate = request.getParameter("receiptDate");
        String[] receiptType = request.getParameterValues("receiptType");
        String[] tenantCode = request.getParameterValues("tenantCode");
        String tenantName = request.getParameter("tenantName");
        String assetName = request.getParameter("assetCode");
        String buildingNo = request.getParameter("buildingNo");
        String blockNo = request.getParameter("blockNo");
        String streetNo = request.getParameter("streetNo");
        String plotNo = request.getParameter("plotNo");
        String[] period = request.getParameterValues("period");
        String[] period1 = request.getParameterValues("toDate");
        String[] rentAmount = request.getParameterValues("rentAmount");
        String[] dues = request.getParameterValues("dues");
        String srNo = request.getParameter("srNo");
        String[] serviceDues = request.getParameterValues("serviceDues");
        String[] totalAmount = request.getParameterValues("totalAmount");
        String[] modeOfPayment = request.getParameterValues("modeOfPayment");
        String[] chequeNo = request.getParameterValues("chequeNo");
        String[] bankName = request.getParameterValues("bankName");
        String[] accountNo = request.getParameterValues("accountNo");
        String[] dated = request.getParameterValues("dated");
        String[] amount = request.getParameterValues("amount");

        System.out.println("XXXXXXXXXXXXXXXXX amount" + amount.length);
        String otherAmount = request.getParameter("otherAmount");
        String[] prepaid = request.getParameterValues("prepaid");
        String[] prepaid1 = request.getParameterValues("prepaid1");
        String subassetCode = request.getParameter("subassetCode");
        String flotNo = request.getParameter("flotNo");
        String[] serviceRequestedCost = request.getParameterValues("serviceRequestedCost");
        String[] penaltyType = request.getParameterValues("penaltyType");
        String[] penaltyamount = request.getParameterValues("penaltyamount");
        String status = request.getParameter("status");
        String[] extra1 = request.getParameterValues("extra1");
        String[] extra2 = request.getParameterValues("extra2");
        String extra3 = request.getParameter("extra3");
        String extra4 = request.getParameter("extra4");
        String extra5 = request.getParameter("extra5");
        String chequestatus = request.getParameter("chequestatus");
        String invoiceNumber = request.getParameter("invoiceNumber");
        String contractCode = request.getParameter("contractCode");

        //if(""modeOfPayment)
        ArrayList<BillPayment> receiptGrid = new ArrayList<BillPayment>();
        ArrayList<ReceiptAttachment> receiptAttachGrid = new ArrayList<ReceiptAttachment>();

        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());

        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        List<MultipartFile> multipartFile = multipartRequest.getFiles("attachmentReference");
//        if (receiptNo == null || receiptNo == "" || "".equals(receiptNo)) {
//            ArrayList validuser = (ArrayList) tenantDetailsDAO.getBPNo(receiptDate);
//            String orderNo2 = null;
//            String orderNo1[] = null;
//            int ordno = 1;
//            if (!(validuser.isEmpty())) {
//                for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
//                    orderNo2 = iter.next();
//                }
//                orderNo1 = orderNo2.split("-");
//            }
//            if (orderNo2 != null) {
//                ordno = Integer.parseInt(orderNo1[1]) + 1;
//            }
//            receiptNo = "BILL" + "-" + ordno;
//        }
        Date receiptDate1 = null;
        if (!receiptDate.equals("")) {
            receiptDate1 = (Date) formatter.parse(receiptDate);
        }

        if (pk == null || pk == "" || pk.equals("")) {

            for (int i = 0; i < tenantCode.length; i++) {

                //===========================receipt_code=========
                ArrayList validuser = (ArrayList) tenantDetailsDAO.getBPNo(receiptDate);
                String orderNo2 = null;
                String orderNo1[] = null;
                int ordno = 1;
                if (!(validuser.isEmpty())) {
                    for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
                        orderNo2 = iter.next();
                    }
                    orderNo1 = orderNo2.split("-");
                }
                if (orderNo2 != null) {
                    ordno = Integer.parseInt(orderNo1[1]) + 1 + i;
                } else {
                    ordno = ordno + i;
                }
                receiptNo = "RECEIPT" + "-" + ordno;
                //===========================cheque status=========

                if ("Cash".equals(modeOfPayment[i])) {
                    chequestatus = "verified";
                } else if ("".equals(chequestatus) || null == chequestatus) {
                    chequestatus = "unverified";
                }

                //===========================end cheque status=========
                Date dated1 = null;
                if (null != dated && !dated.equals("")) {
                    dated1 = (Date) formatter.parse(dated[i]);
                }
                Date periodd = null;
                if (null != period && !period.equals("")) {
                    periodd = (Date) formatter.parse(period[i]);
                }
                Date period1d = null;
                if (null != period1 && !period1[i].equals("")) {
                    period1d = (Date) formatter.parse(period1[i]);
                }
                if (totalAmount[i].equals(amount[i])) {
                    BillPayment type = new BillPayment(orgId, userId, receiptNo, receiptDate1, receiptType[i], tenantCode[i], tenantName, assetName, buildingNo, blockNo, streetNo, plotNo, periodd, period1d, srNo, rentAmount[i], totalAmount[i], "0.000", serviceDues[i], modeOfPayment[i], chequeNo[i], bankName[i], accountNo[i], dated1, amount[i], flotNo, subassetCode, otherAmount, prepaid[i], extra1[i], extra2[i], extra3, extra4, extra5, "Update0", today, today, serviceRequestedCost[i], penaltyType[i], penaltyamount[i], invoiceNumber, contractCode);
                    type.setChequeStatus(chequestatus);
                    receiptGrid.add(type);
                } else {
                    BillPayment type = new BillPayment(orgId, userId, receiptNo, receiptDate1, receiptType[i], tenantCode[i], tenantName, assetName, buildingNo, blockNo, streetNo, plotNo, periodd, period1d, srNo, rentAmount[i], totalAmount[i], dues[i], serviceDues[i], modeOfPayment[i], chequeNo[i], bankName[i], accountNo[i], dated1, amount[i], flotNo, subassetCode, otherAmount, prepaid[i], extra1[i], extra2[i], extra3, extra4, extra5, "Update0", today, today, serviceRequestedCost[i], penaltyType[i], penaltyamount[i], invoiceNumber, contractCode);
                    type.setChequeStatus(chequestatus);
                    receiptGrid.add(type);
                }

                try {

                    int x = 0;
//                    for (Iterator<MultipartFile> iterator = multipartFile.iterator(); iterator.hasNext();) {
                    MultipartFile test = (MultipartFile) multipartFile.get(i);
                    if (test.getBytes().length > 0) {
                        ReceiptAttachment attach = new ReceiptAttachment(orgId, userId, test.getBytes(), test.getOriginalFilename(), receiptNo, tenantCode[i], "update0", receiptDate1, today);
                        receiptAttachGrid.add(attach);
//                            tenantDetailsDAO.saveReceiptAttachment(attach);
                        x++;
                    }
//                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }

            }

//            tenantDetailsDAO.globalSave(type);
        } else {

            for (int i = 0; i < tenantCode.length; i++) {

                Date dated1 = null;
                if (null != dated && !dated.equals("")) {
                    dated1 = (Date) formatter.parse(dated[i]);
                }
                Date periodd = null;
                if (null != period && !period.equals("")) {
                    periodd = (Date) formatter.parse(period[i]);
                }
                Date period1d = null;
                if (null != period1 && !period1[i].equals("")) {
                    period1d = (Date) formatter.parse(period1[i]);
                }

                if ("Dishonoured".equals(extra3)) {
                    tenantDetailsDAO.updateBiilpayment(receiptNo, tenantCode[i]);
                } else {
                    BillPayment type = new BillPayment(Integer.parseInt(pk), orgId, userId, receiptNo, receiptDate1, receiptType[i], tenantCode[i], tenantName, assetName, buildingNo, blockNo, streetNo, plotNo, periodd, period1d, srNo, rentAmount[i], totalAmount[i], dues[i], serviceDues[i], modeOfPayment[i], chequeNo[i], bankName[i], accountNo[i], dated1, amount[i], flotNo, subassetCode, otherAmount, prepaid[i], extra1[i], extra2[i], extra3, extra4, extra5, "Update0", today, today, serviceRequestedCost[i], penaltyType[i], penaltyamount[i], invoiceNumber, contractCode);
                    type.setChequeStatus(chequestatus);
                    receiptGrid.add(type);
//                    tenantDetailsDAO.globalSave(type);
                }
            }

        }

        //            for attachment
//        String attachSno[] = request.getParameterValues("attachSno");
//        String attachSnoFull[] = request.getParameterValues("attachSnoFull");
//        List<String> attach1 = new ArrayList<String>();
//        List<String> attach2 = new ArrayList<String>();
//        if (attachSno != null && attachSnoFull != null) {
//            for (int at = 0; at < attachSno.length; at++) {
//                attach1.add(attachSno[at]);
//            }
//            for (int at1 = 0; at1 < attachSnoFull.length; at1++) {
//                attach2.add(attachSnoFull[at1]);
//            }
//            List<String> unionat = new ArrayList<String>(attach1);
//            unionat.addAll(attach2);
//            List<String> intersection = new ArrayList<String>(attach1);
//            intersection.retainAll(attach2);
//            unionat.removeAll(intersection);
//            for (String nA : unionat) {
//                try {
//                    tenantDetailsDAO.receiptAttachmentDelete(Integer.parseInt(nA));
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//            }
//        } else {
//            if (attachSno == null && attachSnoFull != null) {
//                try {
//                    tenantDetailsDAO.receiptAttachmentDelete(Integer.parseInt(attachSnoFull[0]));
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//            }
//        }
        tenantDetailsDAO.saveReceiptGrid(receiptGrid, receiptAttachGrid);

        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("billPayment", tenantDetailsDAO.list(pk, "BillPayment"));
        return new ModelAndView(new RedirectView("../tenant/billPaymentList.htm"), modelMap);
    }
//**************Validate Dates******************//

    @RequestMapping("/tenant/getTenantDates.htm")
    public void getTenantDates(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        HttpSession session = req.getSession(true);
        res.setContentType("text/html;charset=UTF-8");
        String tenantCode = req.getParameter("tenantCode");
        String contractName = req.getParameter("contractName");
        String datef = req.getParameter("actualdatef");
        String datet = req.getParameter("actualdatet");
        String monthf = req.getParameter("actualmonthf1");
        String montht = req.getParameter("actualmontht1");
        String yearf = req.getParameter("actuayf");
        String yeart = req.getParameter("actuayt");
        String receiptType = req.getParameter("receiptType");
        String flotNo =req.getParameter("flotNo");
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
        String finalDate1 = yearf + "-" + monthf;
        String finalDate2 = yeart + "-" + montht + "-" + datet;
        tenantDetailsDAO.getTenantDates(req, res, tenantCode, contractName, finalDate1, finalDate2, receiptType,flotNo);
    }

    @RequestMapping("/tenant/getTenantInvoice.htm")
    public void getTenantInvoice(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        HttpSession session = req.getSession(true);
        res.setContentType("text/html;charset=UTF-8");
        String tenantCode = req.getParameter("tenantCode");
        String contractName = req.getParameter("contractName");
        String datef = req.getParameter("actualdatef");
        String datet = req.getParameter("actualdatet");
        String monthf = req.getParameter("actualmonthf1");
        String montht = req.getParameter("actualmontht1");
        String yearf = req.getParameter("actuayf");
        String yeart = req.getParameter("actuayt");
        String receiptType = req.getParameter("receiptType");
        String flotNo =req.getParameter("flotNo");
        
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
//        String finalDate1 = yearf + "-" + monthf + "-" + datef;
//        String finalDate2 = yeart + "-" + montht + "-" + datet;
        
         String finalDate1 = yearf + "-" + monthf;
        String finalDate2 = yeart + "-" + montht;
        
        
        tenantDetailsDAO.getTenantInvoice(req, res, tenantCode, contractName, finalDate1, finalDate2,flotNo);
    }

    //**************Validate Penalty******************//
    @RequestMapping("/tenant/getTenantPenalty.htm")
    public void getTenantPenalty(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        HttpSession session = req.getSession(true);
        res.setContentType("text/html;charset=UTF-8");
        String tenantCode = req.getParameter("tenantCode");
        String penaltyType = req.getParameter("penaltyType");
        String penaltyamount = req.getParameter("penaltyamount");
        String receiptType = req.getParameter("receiptType");

        tenantDetailsDAO.getTenantPenalty(req, res, tenantCode, penaltyType, penaltyamount, receiptType);
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

    @RequestMapping("/tenant/previousUtility.htm")
    public void previousUtility(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException {
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
        tenantDetailsDAO.previousUtility(req, res, tenantCode, finalDate1);
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

//**************Fetch Service Request Total Amount******************//
    @RequestMapping("/tenant/bringAmount.htm")
    public void bringAmount(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        HttpSession session = req.getSession(true);
        res.setContentType("text/html;charset=UTF-8");
        String tenantCode = req.getParameter("tenantCode");
        String srNo = req.getParameter("srNo");
        tenantDetailsDAO.bringAmount(req, res, tenantCode, srNo);
    }
//**************Fetch Tenant Dues******************//

    @RequestMapping("/tenant/getTenantDues.htm")
    public void getTenantDues(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        HttpSession session = req.getSession(true);
        res.setContentType("text/html;charset=UTF-8");
        String tenantCode = req.getParameter("tenantCode");
        String receiptType = req.getParameter("receiptType");
        String contractCode = req.getParameter("contractCode");
        tenantDetailsDAO.getTenantDues(req, res, tenantCode, receiptType, contractCode);
    }
//**************Fetch Tenant Dues of Advances******************//

    @RequestMapping("/tenant/getTenantDuesAdvt.htm")
    public void getTenantDuesAdvt(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        HttpSession session = req.getSession(true);
        res.setContentType("text/html;charset=UTF-8");
        String tenantCode = req.getParameter("tenantCode");
        String receiptType = req.getParameter("receiptType");
        tenantDetailsDAO.getTenantDuesAdvt(req, res, tenantCode, receiptType);
    }
//**************Fetch Tenant Dues of Service Request******************//

    @RequestMapping("/tenant/getTenantDuesServ.htm")
    public void getTenantDuesServ(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        HttpSession session = req.getSession(true);
        res.setContentType("text/html;charset=UTF-8");
        String tenantCode = req.getParameter("tenantCode");
        String receiptType = req.getParameter("receiptType");
        String srNo = req.getParameter("srNo");
        tenantDetailsDAO.getTenantDuesServ(req, res, tenantCode, receiptType, srNo);
    }
//**************Fetch Tenant Advance Amount******************//

    @RequestMapping("/tenant/getTenantAdvnce.htm")
    public void getTenantAdvnce(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        HttpSession session = req.getSession(true);
        String receiptType = req.getParameter("receiptType");
        String tenantCode = req.getParameter("tenantCode");
        tenantDetailsDAO.getTenantAdvnce(req, res, tenantCode, receiptType);
    }
//**************Fetch Tenant Prepaid Rent Amount******************//

    @RequestMapping("/tenant/checkPrepaid.htm")
    public void checkPrepaid(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        HttpSession session = req.getSession(true);
        String receiptType = req.getParameter("receiptType");
        String tenantCode = req.getParameter("tenantCode");
        tenantDetailsDAO.checkPrepaid(req, res, tenantCode, receiptType);
    }
//----------------------------End of Receipt-------------------//

    @RequestMapping("/tenant/receiptAttachmentForm.htm")
    public ModelAndView receiptAttachmentForm(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String receiptNo = request.getParameter("receiptNo");
        String action = request.getParameter("action");
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("fileSize", userDAO.fileSize());
        modelMap.addAttribute("receiptDocuments", tenantDetailsDAO.receiptAttachment(receiptNo));
        modelMap.addAttribute("action", action);
        return new ModelAndView("../tenant/receiptAttachmentForm", modelMap);

    }

    @RequestMapping("/tenant/securityDepositList.htm")
    public ModelAndView securityDepositList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Security Deposit";
        String submoduleName = "Receipt";
        map.addAttribute("billPayment", tenantDetailsDAO.securityDepositList());

        map.addAttribute("assetDetails", tenantDetailsDAO.Assetlist());
        map.addAttribute("tenantDetails", tenantDetailsDAO.Tenantlist());
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../tenant/securityDepositList", map);
    }

    @RequestMapping("/tenant/securityDepositForm.htm")
    public ModelAndView securityDepositForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        String tenantCode = request.getParameter("tenantCode");
        String Invoice = request.getParameter("invoiceNumber");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("billPayment", tenantDetailsDAO.list(sno, "BillPayment"));
            modelMap.addAttribute("tenantDetails", tenantDetailsDAO.tenantDetails1(tenantCode,sno));
        }
        String link = "../tenant/securityDepositForm.htm";
        String tab = "Security Deposit";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../tenant/securityDepositForm", modelMap);
    }

    @RequestMapping("/tenant/securityDepositFormSubmit.htm")
    public ModelAndView securityDepositFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");
        String receiptNo = request.getParameter("receiptNo");
        String receiptDate = request.getParameter("receiptDate");
        String receiptType = request.getParameter("receiptType");
        String tenantCode = request.getParameter("tenantCode");
        String tenantName = request.getParameter("tenantName");
        String assetName = request.getParameter("assetName");
        String buildingNo = request.getParameter("buildingNo");
        String blockNo = request.getParameter("blockNo");
        String streetNo = request.getParameter("streetNo");
        String plotNo = request.getParameter("plotNo");
        String period = request.getParameter("period");
        String period1 = request.getParameter("toDate");
        String rentAmount = request.getParameter("rentAmount");
        String dues = request.getParameter("dues");
        String srNo = request.getParameter("srNo");
        String serviceDues = request.getParameter("serviceDues");
        String totalAmount = request.getParameter("totalAmount");
        String modeOfPayment = request.getParameter("modeOfPayment");
        String chequeNo = request.getParameter("chequeNo");
        String bankName = request.getParameter("bankName");
        String accountNo = request.getParameter("accountNo");
        String dated = request.getParameter("dated");
        String amount = request.getParameter("amount");
        String otherAmount = request.getParameter("otherAmount");
        String prepaid = request.getParameter("prepaid");
        String prepaid1 = request.getParameter("prepaid1");
        String subassetCode = request.getParameter("subassetCode");
        String flotNo = request.getParameter("flotNo");
        String serviceRequestedCost = request.getParameter("serviceRequestedCost");
        String penaltyType = request.getParameter("penaltyType");
        String penaltyamount = request.getParameter("penaltyamount");
        String status = request.getParameter("status");
        String extra1 = request.getParameter("extra1");
        String extra2 = request.getParameter("extra2");
        String extra3 = request.getParameter("extra3");
        String extra4 = request.getParameter("extra4");
        String extra5 = request.getParameter("extra5");
        String invoiceNumber = request.getParameter("invoiceNumber");
        String contractCode = request.getParameter("contractCode");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        if (receiptNo == null || receiptNo == "" || "".equals(receiptNo)) {
            ArrayList validuser = (ArrayList) tenantDetailsDAO.getBPNo(receiptDate);
            String orderNo2 = null;
            String orderNo1[] = null;
            int ordno = 1;
            if (!(validuser.isEmpty())) {
                for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
                    orderNo2 = iter.next();
                }
                orderNo1 = orderNo2.split("-");
            }
            if (orderNo2 != null) {
                ordno = Integer.parseInt(orderNo1[1]) + 1;
            }
            receiptNo = "BILL" + "-" + ordno;
        }
        Date receiptDate1 = null;
        if (!receiptDate.equals("")) {
            receiptDate1 = (Date) formatter.parse(receiptDate);
        }
        Date dated1 = null;
        if (!dated.equals("")) {
            dated1 = (Date) formatter.parse(dated);
        }
        Date periodd = null;
        if (!period.equals("")) {
            periodd = (Date) formatter.parse(period);
        }
        Date period1d = null;
        if (!period1.equals("")) {
            period1d = (Date) formatter.parse(period1);
        }
        if (pk == null || pk == "" || pk.equals("")) {
        } else {
            if ("Dishonoured".equals(extra3)) {
                tenantDetailsDAO.updateBiilpayment(receiptNo, tenantCode);
            } else {
                BillPayment type = new BillPayment(Integer.parseInt(pk), orgId, userId, receiptNo, receiptDate1, receiptType, tenantCode, tenantName, assetName, buildingNo, blockNo, streetNo, plotNo, periodd, period1d, srNo, rentAmount, totalAmount, dues, serviceDues, modeOfPayment, chequeNo, bankName, accountNo, dated1, amount, flotNo, subassetCode, otherAmount, prepaid, extra1, extra2, extra3, extra4, extra5, "Update0", today, today, serviceRequestedCost, penaltyType, penaltyamount, invoiceNumber, contractCode);
                tenantDetailsDAO.globalSave(type);
            }
        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("billPayment", tenantDetailsDAO.list(pk, "BillPayment"));
        return new ModelAndView(new RedirectView("../tenant/securityDepositList.htm"), modelMap);

    }

    @RequestMapping("/tenant/printSecurityDeposit.htm")
    public ModelAndView printSecurityDeposit(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String pk = req.getParameter("pk");
        String tenantCode = req.getParameter("tenantCode");
        modelMap.addAttribute("receiptDetails", tenantDetailsDAO.getReceiptDetails(Integer.parseInt(pk)));
        modelMap.addAttribute("propertyList", tenantDetailsDAO.propertyList());
        return new ModelAndView("../tenant/printSecurityDeposit", modelMap);
    }

    @RequestMapping("/tenant/getAssetCode.htm")
    public void getAssetCode(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        HttpSession session = req.getSession(true);
        res.setContentType("text/html;charset=UTF-8");
        String assetName1 = req.getParameter("assetName1");
        String tenantCode = req.getParameter("tenantCode");
        tenantDetailsDAO.getAssetCode1(req, res, assetName1, tenantCode);
    }

    //**********for service request  due dashboard***********
    @RequestMapping("/tenant/billPaymentList1.htm")
    public ModelAndView billPaymentList1(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Receipt";
        String submoduleName = "Receipt";
        String sno = request.getParameter("pk");
        String chequeType = request.getParameter("chequeType");

        ArrayList validuser = (ArrayList) tenantDetailsDAO.gettenantCodewithlogin(userId);
        String tenantcode = null;
        if (!(validuser.isEmpty())) {
            for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
                tenantcode = iter.next();
            }
        }

        if ("PDC".equals(chequeType)) {
            map.addAttribute("billPayment", tenantDetailsDAO.listBillForPDC(tenantcode));
        } else if ("CDC".equals(chequeType)) {
            map.addAttribute("billPayment", tenantDetailsDAO.listBillCdc(tenantcode));
        } else {
            map.addAttribute("billPayment", tenantDetailsDAO.billlisttenantwise(tenantcode));
        }

        map.addAttribute("assetDetails", tenantDetailsDAO.list(sno, "AssetDetails"));
        map.addAttribute("tenantDetails", tenantDetailsDAO.list(sno, "TenantDetails"));
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../tenant/billPaymentList", map);
    }

    @RequestMapping("/tenant/selectItems.htm")
    public ModelAndView selectItems(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String assetName = req.getParameter("assetName");
        modelMap.addAttribute("tenantUtilityDetails", tenantDetailsDAO.itemCreaList(assetName));
        modelMap.addAttribute("assetCode", assetName);
        return new ModelAndView("../tenant/selectItems", modelMap);
    }

    @RequestMapping("/tenant/comUtilitySelect.htm")
    public ModelAndView comUtilitySelect(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String assetName = req.getParameter("assetName");
        modelMap.addAttribute("tenantUtilityDetails", tenantDetailsDAO.itemCreaList(assetName));
        modelMap.addAttribute("assetCode", assetName);
        return new ModelAndView("../tenant/comUtilitySelect", modelMap);
    }

    @RequestMapping("/tenant/tenanttAttachDownload1.htm")
    public void tenanttAttachDownload1(HttpServletRequest req, HttpServletResponse res) throws FileNotFoundException, IOException {
        String sno = req.getParameter("sno");
        PortalTenantDetails doc = tenantDetailsDAO.gettenantAttach1(Integer.parseInt(sno));
        try {
            res.setHeader("Content-Disposition", "inline;filename=\"" + doc.getTenOrgfileName() + "\"");
            OutputStream out = res.getOutputStream();
            res.setContentType("application/force-download");
            byte[] buffer = doc.getTenantAttachment();
            InputStream in1 = new ByteArrayInputStream(buffer);
            IOUtils.copy(in1, res.getOutputStream());
            out.flush();
            out.close();
            in1.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/tenant/securityDepositList1.htm")
    public ModelAndView securityDepositList1(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Security Deposit";
        String submoduleName = "Receipt";
        ArrayList validuser = (ArrayList) tenantDetailsDAO.gettenantCodewithlogin(userId);
        String tenantcode = null;
        if (!(validuser.isEmpty())) {
            for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
                tenantcode = iter.next();
            }
        }
        map.addAttribute("billPayment", tenantDetailsDAO.securityDepositList1(tenantcode));

        map.addAttribute("assetDetails", tenantDetailsDAO.Assetlist());
        map.addAttribute("tenantDetails", tenantDetailsDAO.Tenantlist());
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../tenant/securityDepositList", map);
    }

    ///////Newly added by lakshmi/////////
    //**************Tenant Details List******************//
    
    @RequestMapping("/tenant/bookingManagmentList.htm")
    public ModelAndView bookingManagmentList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        map.addAttribute("contCreat", contractDAO.list("", "ContractCreation"));
        map.addAttribute("propertyList", tenantDetailsDAO.getPropertyList());
        map.addAttribute("tenantDetails", tenantDetailsDAO.bookingTenantDetailsList(sno));
       
        
        return new ModelAndView("../tenant/bookingManagmentList", map);
    }
    
    @RequestMapping("/tenant/bookingPropertyDetailsList.htm")
    public ModelAndView bookingPropertyDetailsList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sNo = request.getParameter("pk");
       
            map.addAttribute("bookingPropertyDetailsList1", tenantDetailsDAO.bookingPropertyDetailsList1(userId, sNo));
            map.addAttribute("quotationDetailsList1", tenantDetailsDAO.quotationDetailsList1(userId, sNo)); 
            map.addAttribute("customerTenancyDetailsList1", tenantDetailsDAO.customerTenancyDetailsList1(userId, sNo)); 
            map.addAttribute("rentDetailsList1", tenantDetailsDAO.rentDetailsList1(userId, sNo)); 
            map.addAttribute("ServiceDetailsGridList1", tenantDetailsDAO.ServiceDetailsGridList1(userId, sNo));
            map.addAttribute("TermsandConditionList1", tenantDetailsDAO.TermsandConditionList1(userId, sNo)); 
        return new ModelAndView("../tenant/bookingManagmentRecordList", map);
    }
    
    @RequestMapping("/tenant/bookingManagmentForm.htm")
    public ModelAndView bookingManagmentForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String sno = request.getParameter("pk");
        String userId = session.getAttribute("userId").toString();
        String landlordId = request.getParameter("llId");
        String contractPeriod = request.getParameter("contractPeriod");
        //String assetName1 = request.getParameter("assetName");
        String assetName = request.getParameter("assetCode");
        String tenantcode = request.getParameter("tenantCode");
        String subclassifiedAstno = request.getParameter("subclassifiedAstno");
        List<BookingTenantUtilityDetails> gridData = new ArrayList<BookingTenantUtilityDetails>();

        String action = request.getParameter("action");
        
        if(sno != null) {
            modelMap.addAttribute("bookingPropertyDetailsList1", tenantDetailsDAO.bookingPropertyDetailsList1(userId, sno));
            modelMap.addAttribute("quotationDetailsList1", tenantDetailsDAO.quotationDetailsList1(userId, sno)); 
            modelMap.addAttribute("customerTenancyDetailsList1", tenantDetailsDAO.customerTenancyDetailsList1(userId, sno)); 
             modelMap.addAttribute("customerTenancyDetailsGridList1", tenantDetailsDAO.customerTenancyDetailsGridList1(userId, sno)); 
            modelMap.addAttribute("rentDetailsList1", tenantDetailsDAO.rentDetailsList1(userId, sno)); 
            modelMap.addAttribute("ServiceDetailsGridList1", tenantDetailsDAO.ServiceDetailsGridList1(userId, sno));
            modelMap.addAttribute("TermsandConditionList1", tenantDetailsDAO.TermsandConditionList1(userId, sno)); 
            modelMap.addAttribute("action", action);
        }
        Integer bookingIdCount = tenantDetailsDAO.getBookingId();
        
        bookingIdCount = bookingIdCount + 1;
        
        String prebookingIdCount = "";
        
        if(bookingIdCount < 9) {
            prebookingIdCount = "00000";
        } else if(bookingIdCount > 9 && bookingIdCount < 99) {
            prebookingIdCount = "0000";
        } else if(bookingIdCount > 100) {
            prebookingIdCount = "000";
        }
        String bookingCode = "BK-ID-" + prebookingIdCount + bookingIdCount;
        
        modelMap.addAttribute("bookingCode", bookingCode);
        modelMap.addAttribute("action", request.getParameter("action"));
        
        String link = "../tenant/bookingDetailsForm.htm";
        String tab = "Booking Details";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("fileSize", userDAO.fileSize());
        modelMap.addAttribute("tenantType", tenantDetailsDAO.tenantType());
        modelMap.addAttribute("tenantCategory", tenantDetailsDAO.tenantCategory());
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../tenant/bookingManagmentForm", modelMap);
    }
     
    @RequestMapping("/tenant/bookingManagmentFormSubmit.htm")
    public ModelAndView bookingManagmentFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sno = request.getParameter("pk");
        
        //Booking property details 4648-4900
        String bookingId1 = request.getParameter("bookID");
        String bookingRef1 = request.getParameter("clientType"); 
        String bookingDate1 = request.getParameter("groupName");
        
        //Quotation Details
        String  quotationId1 = request.getParameter("quotationId") ;
         String  quotationNumber1 = request.getParameter("quotationNumber") ; 
         String quotationDate1 = request.getParameter("quotationDate") ;
         String quotationExpiry1 = request.getParameter("quotationExpiry") ;
         String currency1 = request.getParameter("currency") ;
         
         //Booking property details
          String tenancyStartDate1 = request.getParameter("tenancyStartDate") ;
          String tenancyEndDate1 = request.getParameter("tenancyEndDate") ;
          String mezzanineFloor1 = request.getParameter("floor") ;
          String baserent1 = request.getParameter("baserent") ;
          String propertyCode1 = request.getParameter("assetCode") ;
          String propertyName1 = request.getParameter("assetName") ;
          String unitNo1 = request.getParameter("unitNumNo") ;
          
          //Customer Tenancy details
           String customerType1 = request.getParameter("customerType") ;
           String customerName1 = request.getParameter("customerName");
           String tenantId1 = request.getParameter("tenantId");
           String businessName1 = request.getParameter("businessName");
           String businessCrNumber1 = request.getParameter("businessCrNumber");
           String contactPerson1[] = request.getParameterValues("contactPerson");
           String registeredEmailID1[] = request.getParameterValues("registeredEmailID");
           String phoneNo1[] = request.getParameterValues("phoneNo");
           String billingAddress1 = request.getParameter("billingAddress");
           String permenamtAddress1 = request.getParameter("permenamtAddress");
           String jointeeName11 = request.getParameter("jointeeName1");
           String jointeeAddress11 = request.getParameter("jointeeAddress1");
           String jointeeName21 = request.getParameter("jointeeName2");
           String jointeeAddress21 = request.getParameter("jointeeAddress2");
           String sponsorName11 = request.getParameter("sponsorName");
           String ifWorking1 = request.getParameter("ifWorking");
           String sponsorAddress1 = request.getParameter("sponsorAddress");
           String sponsorEmail1 = request.getParameter("sponsorEmail");
           String attachment1 = request.getParameter("attachment");
           String idCardType1 = request.getParameter("idCardType");
           
           //Rent Details
           String unitNo121[] = request.getParameterValues("unitNo1") ;
           String rentPeriod21[] = request.getParameterValues("rentPeriod");
           String chargesQuoted21[] = request.getParameterValues("chargesQuoted");
           String vatPercentage21[] = request.getParameterValues("vatPercentage");
           String vatAmount21[] = request.getParameterValues("vatAmount");
           String totalAmount21[] = request.getParameterValues("totalAmount");

           //Service Details
            String serviceCategory1[] = request.getParameterValues("serviceCategory"); ;
            String serviceName1[] = request.getParameterValues("serviceName"); ;
            String chargesQuoted11[] = request.getParameterValues("chargesQuoted1"); ;
            String vatPercentage11[] =  request.getParameterValues("vatPercentage1");
            String vatAmount11[] = request.getParameterValues("vatAmount1") ;
            String totalAmount11[] = request.getParameterValues("totalAmount1") ;
            String securityDeposit1 = request.getParameter("securityDeposit");
            String advance1 = request.getParameter("advance");
            
            //Terms and Condition Details
             String paymentTerms1 = request.getParameter("paymentTerms"); 
             String contactTerms1 = request.getParameter("contactTerms"); 
             String addAttachment1 = request.getParameter(""); 
             
             
             //Booking property details
            LocalDateTime currentDateTime = LocalDateTime.now();
            DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss a");
         
            Date bookingDate11 = null;
            try {
            if (bookingDate1 != null || !bookingDate1.equals("")) {
                bookingDate11 = (Date) formatter2.parse(bookingDate1);
            }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            
             Date quotationDate11 = null;
            try {
            if (quotationDate1 != null || !quotationDate1.equals("")) {
                quotationDate11 = (Date) formatter2.parse(quotationDate1);
            }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            Date quotationExpiry11 = null;
            try {
            if (quotationExpiry1 != null || !quotationExpiry1.equals("")) {
                quotationExpiry11 = (Date) formatter2.parse(quotationExpiry1);
            }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            
            List<BookingPropertyDetails1> gridData1 = new ArrayList<BookingPropertyDetails1>();
           // List<QuotationDetails> gridData2 = new ArrayList<QuotationDetails>();
           // List<TermsCondition> gridData4 = new ArrayList<TermsCondition>();
            if (sno == null || sno.equals("")){
             
                BookingPropertyDetails1 it = new BookingPropertyDetails1(orgId, userId, bookingId1, bookingRef1, bookingDate11, quotationDate1, advance1, advance1, newdate, newdate, mezzanineFloor1, customerType1, baserent1, propertyCode1, propertyName1, unitNo1, "Booked", bookingDate11, customerName1);
              //  QuotationDetails qt = new QuotationDetails(orgId, userId, quotationNumber, quotationDate1, quotationExpiry1, currency, Boolean.TRUE, newdate);
                
             //   TermsCondition tc = new TermsCondition(paymentTerms, contactTerms, addAttachment,  orgId, userId, quotationDate, bookingId, Boolean.TRUE, newdate);
                gridData1.add(it);
               // gridData2.add(qt);
             //   gridData4.add(tc);
             
             tenantDetailsDAO.bookingPropertyDetailsListSave1(gridData1);
             tenantDetailsDAO.updateSubasset1(unitNo1, "Booked");
          //   tenantDetailsDAO.quotationDetailsListSave(gridData2);
            // tenantDetailsDAO.TermsandConditionListSave(gridData4);
             
         }else{
             
             BookingPropertyDetails1 it = new BookingPropertyDetails1(Integer.parseInt(sno), orgId, userId, bookingId1, bookingRef1, bookingDate11, quotationDate1, advance1, advance1, newdate, newdate, mezzanineFloor1, customerType1, baserent1, propertyCode1, propertyName1, unitNo1, "Booked", bookingDate11, customerName1);
          //   QuotationDetails qt = new QuotationDetails(Integer.parseInt(sno), orgId, userId, quotationNumber, quotationDate1, quotationExpiry1, currency, Boolean.TRUE, newdate);
           //  TermsCondition tc = new TermsCondition(Integer.parseInt(sno), paymentTerms, contactTerms, addAttachment, orgId, userId, quotationDate, bookingId, Boolean.TRUE, newdate);
          //   tenantDetailsDAO.newQuotationDetailsListSave(qt);
             tenantDetailsDAO.newBookingPropertyDetailsListSave1(it);
             tenantDetailsDAO.updateSubasset1(unitNo1, "Booked");
           //  tenantDetailsDAO.newTermsandConditionListSave(tc);
         }
            
            List<QuotationDetails1> gridData2 = new ArrayList<QuotationDetails1>();
            if (sno == null || sno.equals("")){
             
                QuotationDetails1 qt = new QuotationDetails1(orgId, userId, quotationId1, tenantId1, propertyName1, quotationNumber1, quotationDate11, quotationExpiry11, currency1, Boolean.TRUE, newdate);
                
                gridData2.add(qt);
             
             tenantDetailsDAO.quotationDetailsListSave1(gridData2);
             
         }else{
             
             QuotationDetails1 qt = new QuotationDetails1(Integer.parseInt(sno), orgId, userId, quotationId1,"","",quotationNumber1, quotationDate11, quotationExpiry11, currency1, Boolean.TRUE, newdate);
             tenantDetailsDAO.newQuotationDetailsListSave1(qt);
         }
         
            List<TermsCondition1> gridData4 = new ArrayList<TermsCondition1>();
            if (sno == null || sno.equals("")){
             
                TermsCondition1 tc = new TermsCondition1(paymentTerms1, contactTerms1, addAttachment1,  orgId, userId, quotationNumber1, bookingId1, Boolean.TRUE, newdate);
                
                gridData4.add(tc);
             
             tenantDetailsDAO.TermsandConditionListSave1(gridData4);
             
         }else{
             
            TermsCondition1 tc = new TermsCondition1(Integer.parseInt(sno), paymentTerms1, contactTerms1, addAttachment1, orgId, userId, quotationNumber1, bookingId1, Boolean.TRUE, newdate);
          
             tenantDetailsDAO.newTermsandConditionListSave1(tc);
         }
            
         List<CustomerTenacyDetails1> gridData3 = new ArrayList<CustomerTenacyDetails1>();
         
         try {
            if (sno == null || sno.equals("")){
             CustomerTenacyDetails1 ct = new CustomerTenacyDetails1(orgId, userId, quotationDate1, customerType1, customerName1, tenantId1, businessName1, businessCrNumber1, contactTerms1, sponsorEmail1, unitNo1, billingAddress1, permenamtAddress1, jointeeName11, jointeeAddress11, jointeeName21, jointeeAddress21, sponsorName11, ifWorking1, sponsorAddress1, sponsorEmail1, attachment1, idCardType1, Boolean.TRUE, newdate);
             //gridData1.add(it); 
             
             tenantDetailsDAO.newCustomerTenancyDetailsListSave1(ct);
             
             try {
                      if(contactPerson1 != null) {
                          for (int i = 0; i < contactPerson1.length; i++) {
                              CustomerTenacyDetailsGrid1 os=new CustomerTenacyDetailsGrid1(orgId, userId, "", "", "", "", "", "",contactPerson1[i] ,registeredEmailID1[i] ,phoneNo1[i] , Boolean.TRUE, newdate);
                              tenantDetailsDAO.newcustomerTenancyDetailsGridListSave1(os);
                          }
                      }
                  } catch(Exception ex) {
                      ex.printStackTrace();
                  }
             
         }
            else{
             
             CustomerTenacyDetails1 ct = new CustomerTenacyDetails1(Integer.SIZE, orgId, userId, quotationDate1, customerType1, customerName1, tenantId1, businessName1, businessCrNumber1, contactTerms1, sponsorEmail1, unitNo1, billingAddress1, permenamtAddress1, jointeeName11, jointeeAddress11, jointeeName21, jointeeAddress21, sponsorName11, ifWorking1, sponsorAddress1, sponsorEmail1, attachment1, idCardType1, Boolean.TRUE, newdate);
             
             tenantDetailsDAO.newCustomerTenancyDetailsListSave1(ct);
             
             try {
                      if(contactPerson1 != null) {
                          for (int i = 0; i < contactPerson1.length; i++) {
                              CustomerTenacyDetailsGrid1 os=new CustomerTenacyDetailsGrid1(Integer.parseInt(sno),orgId, userId, "", "", "", "", "", "",contactPerson1[i] ,registeredEmailID1[i] ,phoneNo1[i] , Boolean.TRUE, newdate);
                              tenantDetailsDAO.newcustomerTenancyDetailsGridListSave1(os);
                              
                          }
                      }
                  } catch(Exception ex) {
                      ex.printStackTrace();
                  }
         }
        } catch (Exception e) {
        }
         try {
             if (sno == null || sno.equals("")){
                try {
                      if(contactPerson1 != null) {
                          for (int i = 0; i < contactPerson1.length; i++) {
                              RentDetails1 rd = new RentDetails1(orgId, userId, quotationNumber1, unitNo121[i], rentPeriod21[i], Double.parseDouble(chargesQuoted21[i]), Double.parseDouble(vatPercentage21[i]), Double.parseDouble(vatAmount21[i]), Double.parseDouble(totalAmount21[i]), Boolean.TRUE, newdate);
                              
                              tenantDetailsDAO.newrentDetailsListSave1(rd);
                              
                          }
                      }
                  } catch(Exception ex) {
                      ex.printStackTrace();
                  }
             }
             else{
               try {
                      if(contactPerson1 != null) {
                          for (int i = 0; i < contactPerson1.length; i++) {
                              RentDetails1 rd = new RentDetails1(Integer.parseInt(sno), orgId, userId, quotationNumber1, unitNo121[i], rentPeriod21[i], Double.parseDouble(chargesQuoted21[i]), Double.parseDouble(vatPercentage21[i]), Double.parseDouble(vatAmount21[i]), Double.parseDouble(totalAmount21[i]), Boolean.TRUE, newdate);
                              tenantDetailsDAO.newrentDetailsListSave1(rd);
                          }
                      }
                  } catch(Exception ex) {
                      ex.printStackTrace();
                  }  
             }
         
         }catch(Exception e){
         
         }
         
      //   List<ServiceDetailsGrid> gridData1 = new ArrayList<ServiceDetailsGrid>();
         
         try {
            for(int i=0; i<serviceCategory1.length; i++){
             if (sno == null || sno.equals("")){
             ServiceDetailsGrid1 sd = new ServiceDetailsGrid1(orgId, userId, bookingId1, "", serviceCategory1[i], serviceName1[i], Double.parseDouble(chargesQuoted11[i]), Double.parseDouble(vatPercentage11[i]), Double.parseDouble(vatAmount11[i]), Double.parseDouble(totalAmount11[i]), securityDeposit1, advance1, Boolean.TRUE, newdate);
                              tenantDetailsDAO.newServiceDetailsGridListSave1(sd);
         }else{
             
              ServiceDetailsGrid1 sd = new ServiceDetailsGrid1(Integer.parseInt(sno),orgId, userId, bookingId1, "", serviceCategory1[i], serviceName1[i], Double.parseDouble(chargesQuoted11[i]), Double.parseDouble(vatPercentage11[i]), Double.parseDouble(vatAmount11[i]), Double.parseDouble(totalAmount11[i]), securityDeposit1, advance1, Boolean.TRUE, newdate);
                              tenantDetailsDAO.newServiceDetailsGridListSave1(sd);
            }
         }
        } catch (Exception e) {
        }
         
         
//         try {
//            if (sno == null || sno.equals("")){
//             ServiceDetails st = new ServiceDetails(orgId, userId, "", "", "", Double.parseDouble(""), Double.parseDouble(""), Double.parseDouble(""), Double.parseDouble(""), securityDeposit, advance, Boolean.TRUE, newdate);
//             //gridData1.add(it); 
//             
//             tenantDetailsDAO.newServiceDetailsListSave(st);
//             
//             try {
//                 
//                      if(serviceCategory != null) {
//                          for (int i = 0; i < serviceCategory.length; i++) {
//                              ServiceDetailsGrid sd = new ServiceDetailsGrid(orgId, userId, "", serviceCategory[i], serviceName[i], Double.parseDouble(chargesQuoted1[i]), Double.parseDouble(vatPercentage1[i]), Double.parseDouble(vatAmount1[i]), Double.parseDouble(totalAmount1[i]), securityDeposit, advance, Boolean.TRUE, newdate);
//                              tenantDetailsDAO.newServiceDetailsGridListSave(sd);
//                          }
//                      }
//                  } catch(Exception ex) {
//                      ex.printStackTrace();
//                  }
//             
//         }
//            else{
//             
//             ServiceDetails st = new ServiceDetails(Integer.parseInt(sno),orgId, userId, "", "", "", Double.parseDouble(""), Double.parseDouble(""), Double.parseDouble(""), Double.parseDouble(""), securityDeposit, advance, Boolean.TRUE, newdate);
//             
//             tenantDetailsDAO.newServiceDetailsListSave(st);
//             
//             try {
//                      if(contactPerson != null) {
//                          for (int i = 0; i < contactPerson.length; i++) {
//                              ServiceDetailsGrid sd = new ServiceDetailsGrid(Integer.parseInt(sno),orgId, userId, "", serviceCategory[i], serviceName[i], Double.parseDouble(chargesQuoted1[i]), Double.parseDouble(vatPercentage1[i]), Double.parseDouble(vatAmount1[i]), Double.parseDouble(totalAmount1[i]), securityDeposit, advance, Boolean.TRUE, newdate);
//                              tenantDetailsDAO.newServiceDetailsGridListSave(sd);
//                              
//                          }
//                      }
//                  } catch(Exception ex) {
//                      ex.printStackTrace();
//                  }
//         }
//        } catch (Exception e) {
//        }
//         
//         
        
        return new ModelAndView(new RedirectView("../tenant/bookingPropertyDetailsList.htm"), modelMap);
                 
    }
    
    
    
    @RequestMapping("/tenant/bookingDetailsList.htm")
    public ModelAndView bookingDetailsList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        map.addAttribute("contCreat", contractDAO.list("", "ContractCreation"));
        map.addAttribute("tenantDetails", tenantDetailsDAO.bookingTenantDetailsList(sno));
        map.addAttribute("quotationDetailsList", tenantDetailsDAO.quotationDetailsList(userId, sno));
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Booking Details", "Booking Details"));
        return new ModelAndView("../tenant/bookingDetailsList", map);
    }
    
    

    @RequestMapping("/tenant/bookingDetailsForm.htm")
    public ModelAndView bookingDetailsForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String landlordId = request.getParameter("llId");
        String contractPeriod = request.getParameter("contractPeriod");
        //String assetName1 = request.getParameter("assetName");
        String assetName = request.getParameter("assetName");
        String tenantcode = request.getParameter("tenantCode");
        String subclassifiedAstno = request.getParameter("subclassifiedAstno");
        String  quotationNumber = request.getParameter("quotationNumber") ; 
        
        
        List<BookingTenantDetails> gridData = new ArrayList<BookingTenantDetails>();
        List<BookingTenantUtilityDetails> gridData1 = new ArrayList<BookingTenantUtilityDetails>();
        if (sno != null && !sno.isEmpty()) {
//            modelMap.addAttribute("bookingtenantDetails", tenantDetailsDAO.list(sno, "BookingTenantDetails"));
//            modelMap.addAttribute("landLordDetails", tenantDetailsDAO.landLordDetailsList(landlordId));
//            //modelMap.addAttribute("contractNamee", tenantDetailsDAO.selectContractCodee(contractPeriod));
//            modelMap.addAttribute("assetDetails", tenantDetailsDAO.assetDetails(assetName));
//            gridData.addAll(assetDAO.bookingTenantDetailslist(assetName, tenantcode));
//            //gridData1.addAll(assetDAO.bookingTenantUtilityDetailslist1(assetName, tenantcode));
//            
//            modelMap.addAttribute("assetDetails1", gridData);
//            //modelMap.addAttribute("utlitiesTaggingList", gridData1);
//            modelMap.addAttribute("subassDetails", tenantDetailsDAO.subassDetails(assetName, subclassifiedAstno));
//            modelMap.addAttribute("landlordDocuments", masterDAO.landlordDocuments(landlordId));
//            modelMap.addAttribute("utlitiesTaggingList", assetDAO.utlitiesTaggingList("",userId,sno));
            modelMap.addAttribute("quotationDetailsList", tenantDetailsDAO.quotationDetailsList(userId, sno));
            modelMap.addAttribute("bookingPropertyDetailsList", tenantDetailsDAO.bookingPropertyDetailsList(userId, sno));
            modelMap.addAttribute("customerTenancyDetailsList", tenantDetailsDAO.customerTenancyDetailsList(userId, sno)); 
            modelMap.addAttribute("customerTenancyDetailsGridList", tenantDetailsDAO.customerTenancyDetailsGridList(userId, sno)); 
            modelMap.addAttribute("rentDetailsList", tenantDetailsDAO.rentDetailsList(userId, sno)); 
            modelMap.addAttribute("ServiceDetailsList", tenantDetailsDAO.ServiceDetailsGridList(userId, sno));
            modelMap.addAttribute("TermsandConditionList", tenantDetailsDAO.TermsandConditionList(userId, sno)); 
//            modelMap.addAttribute("action", action);
            // modelMap.addAttribute("contDocument", contractDAO.ContractAttachlist(contractPeriod));
        }
        //String  quotationNumber = request.getParameter("quotationNumber") ;
         
        modelMap.addAttribute("quotationNumbercount", tenantDetailsDAO.quotationNumbercount(userId));
        Integer quotationIdCount = tenantDetailsDAO.getQuotationId();
        
        quotationIdCount = quotationIdCount + 1;
        
        String prequotationIdCount = "";
        
        
        if(quotationIdCount < 9) {
            prequotationIdCount = "00000";
        } else if(quotationIdCount > 9 && quotationIdCount < 99) {
            prequotationIdCount = "0000";
        } else if(quotationIdCount > 100) {
            prequotationIdCount = "000";
        }
        String quotationCode = "QT-ID-" + prequotationIdCount + quotationIdCount;
        
        modelMap.addAttribute("quotationCode", quotationCode);
        
        String QuotationNumberCount = (String) session.getAttribute("QuotationNumberCount");
        
        //Integer QuotationNumberCount = tenantDetailsDAO.getQuotationNumberCount(quotationNumber);
        modelMap.addAttribute("QuotationNumberCount", QuotationNumberCount);
        
        String link = "../tenant/bookingDetailsForm.htm";
        String tab = "Booking Details";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("fileSize", userDAO.fileSize());
        modelMap.addAttribute("tenantType", tenantDetailsDAO.tenantType());
        modelMap.addAttribute("tenantCategory", tenantDetailsDAO.tenantCategory());
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../tenant/bookingDetailsForm", modelMap);
    }

    //**************Tenant Details Submit******************//
    //**************Tenant Details Submit******************//
    @RequestMapping("/tenant/bookingDetailsFormSubmit.htm")
    public ModelAndView bookingDetailsFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sno = request.getParameter("pk");
        
        //Booking property details 4648-4900
        String bookingId = request.getParameter("bookID");
        String bookingRef = request.getParameter("clientType"); 
        String bookingDate = request.getParameter("groupName");
        
        //Quotation Details
		String quotationId = request.getParameter("quotationId");
                String enquiryId = request.getParameter("enquiryId");
//                String propertyName = request.getParameter("assetName");
         String  quotationNumber = request.getParameter("quotationNumber") ; 
         String quotationDate = request.getParameter("quotationDate") ;
         String quotationExpiry = request.getParameter("quotationExpiry") ;
         String currency = request.getParameter("currency") ;
         
         //Booking property details
          String tenancyStartDate = request.getParameter("tenancyStartDate") ;
          String tenancyEndDate = request.getParameter("tenancyEndDate") ;
          String mezzanineFloor = request.getParameter("floor") ;
          String baserent = request.getParameter("baserent") ;
          String propertyCode = request.getParameter("assetCode") ;
          String propertyName = request.getParameter("assetName") ;
          String unitNo = request.getParameter("") ;
          
          //Customer Tenancy details
           String customerType = request.getParameter("customerType") ;
           String customerName = request.getParameter("customerName");
           String tenantId = request.getParameter("tenantId");
           String businessName = request.getParameter("businessName");
           String businessCrNumber = request.getParameter("businessCrNumber");
           String contactPerson[] = request.getParameterValues("contactPerson");
           String registeredEmailID[] = request.getParameterValues("registeredEmailID");
           String phoneNo[] = request.getParameterValues("phoneNo");
           String billingAddress = request.getParameter("billingAddress");
           String permenamtAddress = request.getParameter("permenamtAddress");
           String jointeeName1 = request.getParameter("jointeeName1");
           String jointeeAddress1 = request.getParameter("jointeeAddress1");
           String jointeeName2 = request.getParameter("jointeeName2");
           String jointeeAddress2 = request.getParameter("jointeeAddress2");
           String sponsorName = request.getParameter("sponsorName");
           String ifWorking = request.getParameter("ifWorking");
           String sponsorAddress = request.getParameter("sponsorAddress");
           String sponsorEmail = request.getParameter("sponsorEmail");
           String attachment = request.getParameter("attachment");
           String idCardType = request.getParameter("idCardType");
           
           //Rent Details
           String unitNo1[] = request.getParameterValues("unitNo1") ;
           String rentPeriod[] = request.getParameterValues("rentPeriod");
           String chargesQuoted[] = request.getParameterValues("chargesQuoted");
           String vatPercentage[] = request.getParameterValues("vatPercentage");
           String vatAmount[] = request.getParameterValues("vatAmount");
           String totalAmount[] = request.getParameterValues("totalAmount");

           //Service Details
            String serviceCategory[] = request.getParameterValues("serviceCategory"); ;
            String serviceName[] = request.getParameterValues("serviceName"); ;
            String chargesQuoted1[] = request.getParameterValues("chargesQuoted1"); ;
            String vatPercentage1[] =  request.getParameterValues("vatPercentage1");
            String vatAmount1[] = request.getParameterValues("vatAmount1") ;
            String totalAmount1[] = request.getParameterValues("totalAmount1") ;
            String securityDeposit = request.getParameter("securityDeposit");
            String advance = request.getParameter("advance");
            
            //Terms and Condition Details
             String paymentTerms = request.getParameter("paymentTerms"); 
             String contactTerms = request.getParameter("contactTerms"); 
             String addAttachment = request.getParameter(""); 
             
             Integer QuotationNumberCount = tenantDetailsDAO.getQuotationNumberCount(quotationNumber);
             session.setAttribute("QuotationNumberCount", QuotationNumberCount);
            //Booking property details
            LocalDateTime currentDateTime = LocalDateTime.now();
            DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss a");
//         
//            Date bookingDate1 = null;
//            try {
//            if (bookingDate != null || !bookingDate.equals("")) {
//                bookingDate1 = (Date) formatter2.parse(bookingDate);
//            }
//            } catch (Exception ex) {
//                ex.printStackTrace();
//            }
            
             Date quotationDate1 = null;
            try {
            if (quotationDate != null || !quotationDate.equals("")) {
                quotationDate1 = (Date) formatter2.parse(quotationDate);
            }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            Date quotationExpiry1 = null;
            try {
            if (quotationExpiry != null || !quotationExpiry.equals("")) {
                quotationExpiry1 = (Date) formatter2.parse(quotationExpiry);
            }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            
            List<BookingPropertyDetails> gridData1 = new ArrayList<BookingPropertyDetails>();
           // List<QuotationDetails> gridData2 = new ArrayList<QuotationDetails>();
           // List<TermsCondition> gridData4 = new ArrayList<TermsCondition>();
            if (sno == null || sno.equals("")){
             
                BookingPropertyDetails it = new BookingPropertyDetails(orgId, userId, bookingId, bookingRef, newdate, quotationNumber, advance, advance, newdate, newdate, mezzanineFloor, customerType, baserent, propertyCode, propertyName, unitNo, unitNo, newdate, customerName);
              //  QuotationDetails qt = new QuotationDetails(orgId, userId,quotationId, quotationNumber, quotationDate1, quotationExpiry1, currency, Boolean.TRUE, newdate);
                
             //   TermsCondition tc = new TermsCondition(paymentTerms, contactTerms, addAttachment,  orgId, userId, quotationDate, bookingId, Boolean.TRUE, newdate);
                gridData1.add(it);
               // gridData2.add(qt);
             //   gridData4.add(tc);
             
             tenantDetailsDAO.bookingPropertyDetailsListSave(gridData1);
          //   tenantDetailsDAO.quotationDetailsListSave(gridData2);
            // tenantDetailsDAO.TermsandConditionListSave(gridData4);
             
         }else{
             
             BookingPropertyDetails it = new BookingPropertyDetails(Integer.parseInt(sno), orgId, userId, bookingId, bookingRef, newdate, quotationNumber, advance, advance, newdate, newdate, mezzanineFloor, customerType, baserent, propertyCode, propertyName, unitNo, unitNo, newdate, customerName);
          //   QuotationDetails qt = new QuotationDetails(Integer.parseInt(sno), orgId, userId,quotationId, quotationNumber, quotationDate1, quotationExpiry1, currency, Boolean.TRUE, newdate);
           //  TermsCondition tc = new TermsCondition(Integer.parseInt(sno), paymentTerms, contactTerms, addAttachment, orgId, userId, quotationDate, bookingId, Boolean.TRUE, newdate);
          //   tenantDetailsDAO.newQuotationDetailsListSave(qt);
             tenantDetailsDAO.newBookingPropertyDetailsListSave(it);
           //  tenantDetailsDAO.newTermsandConditionListSave(tc);
         }
            
            List<QuotationDetails> gridData2 = new ArrayList<QuotationDetails>();
            if (sno == null || sno.equals("")){
      
                if(QuotationNumberCount == 0)
                {
                    QuotationDetails qt = new QuotationDetails(orgId, userId, quotationId,enquiryId,propertyName,quotationNumber, quotationDate1, quotationExpiry1, currency, Boolean.TRUE, newdate);
                
                    gridData2.add(qt);
             
                    tenantDetailsDAO.quotationDetailsListSave(gridData2);
                }

         }else{
               
                if(QuotationNumberCount == 0)
                {
                    QuotationDetails qt = new QuotationDetails(Integer.parseInt(sno), orgId, userId, quotationId,enquiryId,propertyName,quotationNumber, quotationDate1, quotationExpiry1, currency, Boolean.TRUE, newdate);
                    tenantDetailsDAO.newQuotationDetailsListSave(qt);
                }
                
         }
         
            List<TermsCondition> gridData4 = new ArrayList<TermsCondition>();
            if (sno == null || sno.equals("")){
             
                TermsCondition tc = new TermsCondition(paymentTerms, contactTerms, addAttachment,  orgId, userId, quotationNumber, bookingId, Boolean.TRUE, newdate);
                
                gridData4.add(tc);
             
             tenantDetailsDAO.TermsandConditionListSave(gridData4);
             
         }else{
             
            TermsCondition tc = new TermsCondition(Integer.parseInt(sno), paymentTerms, contactTerms, addAttachment, orgId, userId, quotationNumber, bookingId, Boolean.TRUE, newdate);
          
             tenantDetailsDAO.newTermsandConditionListSave(tc);
         }
            
         List<CustomerTenacyDetails> gridData3 = new ArrayList<CustomerTenacyDetails>();
         
         try {
            if (sno == null || sno.equals("")){
             CustomerTenacyDetails ct = new CustomerTenacyDetails(orgId, userId, customerType, customerName, tenantId, businessName, businessCrNumber, "", "", "", billingAddress, permenamtAddress, jointeeName1,jointeeAddress1, jointeeName2, jointeeAddress2,
                     sponsorName, ifWorking, sponsorAddress, sponsorEmail, "", idCardType,Boolean.TRUE, newdate, quotationNumber);
             //gridData1.add(it); 
             
             tenantDetailsDAO.newCustomerTenancyDetailsListSave(ct);
             
             try {
                      if(contactPerson != null) {
                          for (int i = 0; i < contactPerson.length; i++) {
                              CustomerTenacyDetailsGrid os=new CustomerTenacyDetailsGrid(orgId, userId, customerType, customerName, tenantId, businessName, businessCrNumber, contactPerson[i], registeredEmailID[i], phoneNo[i], Boolean.TRUE, newdate, quotationNumber); //uploadFileGrid[i]
                              tenantDetailsDAO.newcustomerTenancyDetailsGridListSave(os);
                          }
                      }
                  } catch(Exception ex) {
                      ex.printStackTrace();
                  }
             
         }
            else{
             
             CustomerTenacyDetails ct = new CustomerTenacyDetails(Integer.parseInt(sno),orgId, userId, customerType, customerName, tenantId, businessName, businessCrNumber, "", "", "",billingAddress, permenamtAddress, jointeeName1,jointeeAddress1, jointeeName2, jointeeAddress2,
                     sponsorName, ifWorking, sponsorAddress, sponsorEmail, "", idCardType,Boolean.TRUE, newdate, quotationNumber);
             
             tenantDetailsDAO.newCustomerTenancyDetailsListSave(ct);
             
             try {
                      if(contactPerson != null) {
                          for (int i = 0; i < contactPerson.length; i++) {
                              CustomerTenacyDetailsGrid os=new CustomerTenacyDetailsGrid(Integer.parseInt(sno),orgId, userId, customerType, customerName, tenantId, businessName, businessCrNumber, contactPerson[i], registeredEmailID[i], phoneNo[i], Boolean.TRUE, newdate, quotationNumber); //uploadFileGrid[i]
                              tenantDetailsDAO.newcustomerTenancyDetailsGridListSave(os);
                              
                          }
                      }
                  } catch(Exception ex) {
                      ex.printStackTrace();
                  }
         }
        } catch (Exception e) {
        }
         try {
             if (sno == null || sno.equals("")){
                try {
                      if(contactPerson != null) {
                          for (int i = 0; i < contactPerson.length; i++) {
                              RentDetails rd = new RentDetails(orgId, userId, unitNo1[i], rentPeriod[i], Double.parseDouble(chargesQuoted[i]), Double.parseDouble(vatPercentage[i]), Double.parseDouble(vatAmount[i]), Double.parseDouble(totalAmount[i]), Boolean.TRUE, newdate, quotationNumber);
                              
                              tenantDetailsDAO.newrentDetailsListSave(rd);
                              
                          }
                      }
                  } catch(Exception ex) {
                      ex.printStackTrace();
                  }
             }
             else{
               try {
                      if(contactPerson != null) {
                          for (int i = 0; i < contactPerson.length; i++) {
                              RentDetails rd = new RentDetails(Integer.parseInt(sno), orgId, userId, unitNo1[i], rentPeriod[i], Double.parseDouble(chargesQuoted[i]), Double.parseDouble(vatPercentage[i]), Double.parseDouble(vatAmount[i]), Double.parseDouble(totalAmount[i]), Boolean.TRUE, newdate, quotationNumber);
                              tenantDetailsDAO.newrentDetailsListSave(rd);
                          }
                      }
                  } catch(Exception ex) {
                      ex.printStackTrace();
                  }  
             }
         
         }catch(Exception e){
         
         }
         
      //   List<ServiceDetailsGrid> gridData1 = new ArrayList<ServiceDetailsGrid>();
         
         try {
            for(int i=0; i<serviceCategory.length; i++){
             if (sno == null || sno.equals("")){
             ServiceDetailsGrid sd = new ServiceDetailsGrid(orgId, userId, bookingId, quotationNumber, serviceCategory[i], serviceName[i], Double.parseDouble(chargesQuoted1[i]), Double.parseDouble(vatPercentage1[i]), Double.parseDouble(vatAmount1[i]), Double.parseDouble(totalAmount1[i]), securityDeposit, advance, Boolean.TRUE, newdate);
                              tenantDetailsDAO.newServiceDetailsGridListSave(sd);
         }else{
             
              ServiceDetailsGrid sd = new ServiceDetailsGrid(Integer.parseInt(sno),orgId, userId, bookingId, quotationNumber, serviceCategory[i], serviceName[i], Double.parseDouble(chargesQuoted1[i]), Double.parseDouble(vatPercentage1[i]), Double.parseDouble(vatAmount1[i]), Double.parseDouble(totalAmount1[i]), securityDeposit, advance, Boolean.TRUE, newdate);
                              tenantDetailsDAO.newServiceDetailsGridListSave(sd);
            }
         }
        } catch (Exception e) {
        }
         
         
//         try {
//            if (sno == null || sno.equals("")){
//             ServiceDetails st = new ServiceDetails(orgId, userId, "", "", "", Double.parseDouble(""), Double.parseDouble(""), Double.parseDouble(""), Double.parseDouble(""), securityDeposit, advance, Boolean.TRUE, newdate);
//             //gridData1.add(it); 
//             
//             tenantDetailsDAO.newServiceDetailsListSave(st);
//             
//             try {
//                 
//                      if(serviceCategory != null) {
//                          for (int i = 0; i < serviceCategory.length; i++) {
//                              ServiceDetailsGrid sd = new ServiceDetailsGrid(orgId, userId, "", serviceCategory[i], serviceName[i], Double.parseDouble(chargesQuoted1[i]), Double.parseDouble(vatPercentage1[i]), Double.parseDouble(vatAmount1[i]), Double.parseDouble(totalAmount1[i]), securityDeposit, advance, Boolean.TRUE, newdate);
//                              tenantDetailsDAO.newServiceDetailsGridListSave(sd);
//                          }
//                      }
//                  } catch(Exception ex) {
//                      ex.printStackTrace();
//                  }
//             
//         }
//            else{
//             
//             ServiceDetails st = new ServiceDetails(Integer.parseInt(sno),orgId, userId, "", "", "", Double.parseDouble(""), Double.parseDouble(""), Double.parseDouble(""), Double.parseDouble(""), securityDeposit, advance, Boolean.TRUE, newdate);
//             
//             tenantDetailsDAO.newServiceDetailsListSave(st);
//             
//             try {
//                      if(contactPerson != null) {
//                          for (int i = 0; i < contactPerson.length; i++) {
//                              ServiceDetailsGrid sd = new ServiceDetailsGrid(Integer.parseInt(sno),orgId, userId, "", serviceCategory[i], serviceName[i], Double.parseDouble(chargesQuoted1[i]), Double.parseDouble(vatPercentage1[i]), Double.parseDouble(vatAmount1[i]), Double.parseDouble(totalAmount1[i]), securityDeposit, advance, Boolean.TRUE, newdate);
//                              tenantDetailsDAO.newServiceDetailsGridListSave(sd);
//                              
//                          }
//                      }
//                  } catch(Exception ex) {
//                      ex.printStackTrace();
//                  }
//         }
//        } catch (Exception e) {
//        }
//         
//         
        
        return new ModelAndView(new RedirectView("../tenant/bookingDetailsList.htm"), modelMap);
                 
    }
//    @RequestMapping("/tenant/bookingDetailsFormSubmit.htm")
//    public ModelAndView bookingDetailsFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
//        HttpSession session = request.getSession();
//        ModelMap modelMap = new ModelMap();
//        String userId = session.getAttribute("userId").toString();
//        String orgId = session.getAttribute("orgId").toString();
//        String pk = request.getParameter("pk");
//        String tenantCode = request.getParameter("tenantCode");
//        String tenantType = request.getParameter("tenantType");
//        String tenantCategory = request.getParameter("tenantCategory");
//        String tenantId = request.getParameter("tenantId");
//        String tenantFname = request.getParameter("tenantFname");
//        String roomName = request.getParameter("roomName");
//        String roomCode = request.getParameter("roomCode");
//
//        String tenantLname = request.getParameter("tenantLname");
//        String tenantCrNo = request.getParameter("tenantCrNo");
//        String tenantContactno = request.getParameter("tenantContactno");
//        String tenantMailid = request.getParameter("tenantMailid");
//        String permanentAddress = request.getParameter("permanentAddress");
//        String assetCode = request.getParameter("assetCode");
//        String assetName = request.getParameter("assetName");
//
//        String subclassifiedAstno = request.getParameter("subclassifiedAstno");
//        String flatNo = request.getParameter("flatNo");
//        String buildingNo = request.getParameter("buildingNo");
//        String assetArea = request.getParameter("assetArea");
//        String blockNo = request.getParameter("blockNo");
//        String plotNo = request.getParameter("plotNo");
//        String utility[] = request.getParameterValues("utility");
////        String utilityBill[] = request.getParameterValues("utilityBill");
////        String comUtility[] = request.getParameterValues("comUtility");
////        String utilityBillType[] = request.getParameterValues("utilityBillType");
////        String comUtilityBillType[] = request.getParameterValues("comUtilityBillType");
////        String comutilityBill[] = request.getParameterValues("comutilityBill");
////        String commontotalitemAmount = request.getParameter("commonitmTot");
////        String totalitemAmount = request.getParameter("itmTot");
////        String tot1 = request.getParameter("totalitemAmount");
////        String tot2 = request.getParameter("commontotalitemAmount");
////        String attname = request.getParameter("attname");
//          String appremarks = request.getParameter("appremarks");
//        
//        //individual utility table -1
//        String utiltyNumbers[] = request.getParameterValues("utiltyNumbers");    //table1-meter number
//        String unitsNumbers[] = request.getParameterValues("unitsNumbers");  //table1-select units
//        String utilityindividual[] = request.getParameterValues("utilityindividual");    //table1-utilityname
//        String utilityCodeindividual[] = request.getParameterValues("utilityCodeindividual");    //table1-utilitycode
//        String utilityCategoryindividual[] = request.getParameterValues("utilityCategoryindividual");   //table1-utilitycategory
//        
//        //common utility table -2
//        String utilityCategory[] = request.getParameterValues("utilityCategory");   //table2-utilitycategory
//        String utilityCode[] = request.getParameterValues("utilityCode");   //table2-utilitycode
//        //String utility[] = request.getParameterValues("utility");       //table2-utilityname
//        String utiltyNumbers1[] = request.getParameterValues("utiltyNumbers1");    //table1-meter number
//        String unitsNumbers1[] = request.getParameterValues("unitsNumbers1");  //table1-select units
//        
//        String recordstatus1 = "Occupied";
//        modelMap.addAttribute("action", request.getParameter("action"));
//        String action = request.getParameter("action");
//        List<BookingTenantUtilityDetails> gridData12 = new ArrayList<BookingTenantUtilityDetails>();
//        TenantUtilityDetails tenant1 = null;
//        java.util.Date today = new java.util.Date();
//        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
//
//        if (pk == null || pk == "" || pk.equals("")) {
//            //=====================code for getting tenant code======================================
//            ArrayList validuser = (ArrayList) tenantDetailsDAO.getBookingTenantNo(tenantId);
//            String orderNo2 = null;
//            String orderNo1[] = null;
//            int ordno = 1;
//            if (!(validuser.isEmpty())) {
//                for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
//                    orderNo2 = iter.next();
//                }
//                orderNo1 = orderNo2.split("-");
//            }
//            if (orderNo2 != null) {
//                ordno = Integer.parseInt(orderNo1[1]) + 1;
//            }
//            tenantCode = "TENANT" + "-" + ordno;
//            //=====================end code for getting tenant code======================================
//
//            BookingTenantDetails bookingtenant = new BookingTenantDetails(orgId, userId, tenantCode, tenantCategory, tenantType, tenantId, tenantFname, tenantLname, tenantMailid, tenantCrNo, tenantContactno, permanentAddress, "", assetName, "", flatNo, "", roomName, buildingNo, blockNo, plotNo, "Submitted", "", "Update0", today, today);    //assetCode,subclassifiedAstno,roomCode,appremarks
//
//            tenantDetailsDAO.globalSave(bookingtenant);
//
//            for (int j = 0; j < utilityCategoryindividual.length; j++) {
//
//                BookingTenantUtilityDetails bookingtenant1 = new BookingTenantUtilityDetails("", assetName, tenantCode, "", utiltyNumbers[j], unitsNumbers[j], utilityindividual[j], utilityCodeindividual[j], utilityCategoryindividual[j], utilityCategory[j], "", utiltyNumbers1[j], unitsNumbers1[j], newdate, Boolean.TRUE);   //utility[j],utilityCode[j]
//
//                gridData12.add(bookingtenant1);
//
//            }
//            assetDAO.bookingTenantSave(gridData12);
//
//        } else {
//
//            BookingTenantDetails bookingTenant = null;
////                byte[] Content1 = null;
////                tenOrgfileName = tenantDetailsDAO.getTenOrgfileName(tenantCode);
////                Content1 = tenantDetailsDAO.getTenantAttachment(tenantCode);
////            if (action != null && !action.isEmpty()) {
////                if (action.equalsIgnoreCase("recheck")) {
////                    String str[] = tenantCode.split("-");
////                    if (str.length > 2) {
////                        int i = Integer.parseInt(str[3]);
////                        i = i + 1;
////                        tenantCode = str[0] + "-" + str[1] + "-" + str[2] + "-" + i;
////                    } else {
////                        tenantCode = tenantCode + "-REV" + "-" + 1;
////                    }
////                }
////            }
//
//            bookingTenant = new BookingTenantDetails(Integer.parseInt(pk), orgId, userId, tenantCode, tenantCategory, tenantType, tenantId, tenantFname, tenantLname, tenantMailid, tenantCrNo, tenantContactno, permanentAddress, assetCode, assetName, subclassifiedAstno, flatNo, roomCode, roomName, buildingNo, blockNo, plotNo, "Submitted", appremarks, "Update0", today, today);
//
//            tenantDetailsDAO.globalSave(bookingTenant);
//            
//            for (int j = 0; j < utilityCategoryindividual.length; j++) {
//
//                BookingTenantUtilityDetails bookingtenant1 = new BookingTenantUtilityDetails(Integer.parseInt(pk),"", assetName, tenantCode, utility[j], utiltyNumbers[j], unitsNumbers[j], utilityindividual[j], utilityCodeindividual[j], utilityCategoryindividual[j], utilityCategory[j], utilityCode[j], utiltyNumbers1[j], unitsNumbers1[j], newdate, Boolean.TRUE);
//                        gridData12.add(bookingtenant1);
//
//            }
//            assetDAO.bookingTenantSave(gridData12);
//
//        }
//
//        String tenantFname1 = "";
//        String tenantLname1 = "";
//        String assetName2 = "";
//
//        Common cm = new Common();
//        String subject = "", tbody = "", mailbody = "", email = "", fileName = "", suppAdd = "";
//        String userEmail = "excelarete@gmail.com";
//        String password = "excel123";
//        String toEmail = "";
//        List<UserRegistration> ud = tenantDetailsDAO.udList("GFC");
//        for (UserRegistration udlist : ud) {
//            userId = udlist.getUserId();
//            email = udlist.getEmail();
//
//            if (!userEmail.isEmpty() && !password.isEmpty() && !email.isEmpty()) {
//                List<BookingTenantDetails> td = tenantDetailsDAO.bookingTdList(userId, orgId, tenantCode);
//                StringBuilder emailId = new StringBuilder(email);
//                if (td.size() > 0) {
//                    int j = 1;
//                    for (BookingTenantDetails tdlist : td) {
//
//                        tenantFname1 = tdlist.getTenantFname();
//                        tenantLname1 = tdlist.getTenantLname();
//                        assetName2 = tdlist.getAssetName();
//                    }
//                    emailId.append(",");
//                    emailId.append(toEmail);
//                    String[] sendEmail = emailId.toString().split(",");
//                    subject = "Tenant Code: " + tenantCode;
//                    String filepath = request.getSession().getServletContext().getRealPath("common\\theme\\images\\logo1.png");
//                    mailbody = "<html><body>Dear Sir/Madam,<br/><br/><br/>You need to give an approval for Booking Tenant Details. Tenant Name : " + tenantFname1 + " " + tenantLname1 + ""
//                            + " Please Approve this Booking Tenant Details. <br/><br/>If approved ignore this mail. "
//                            + "</body>"
//                            + "<br/><br/>Thanks & Regards"
//                            + "<br/>Al-Hashar Team.</html>";
//                    ByteArrayOutputStream baos = new ByteArrayOutputStream();
//                    baos.close();
//                    cm.sendEmail(userEmail, password, sendEmail, subject, mailbody, baos, fileName);
//                }
//            }
//        }
//
//        modelMap.addAttribute("tenantDetails", tenantDetailsDAO.list(pk, "BookingTenantDetails"));
//        return new ModelAndView(new RedirectView("../tenant/bookingDetailsList.htm"), modelMap);
//    }
    @RequestMapping("/tenant/bookingDetailsAppList.htm")
    public ModelAndView bookingDetailsAppList(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Approval";
        String submoduleName = "Booking Details";
        String sno = request.getParameter("pk");
        map.addAttribute("tenantDetails", tenantDetailsDAO.bookinggfcApproved(sno));
        map.addAttribute("tenantDetails1", tenantDetailsDAO.gfcApproved1(sno));
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../tenant/bookingDetailsAppList", map);
    }

    //**************Booking Rejected List******************//
    @RequestMapping("/tenant/bookingDetailsRejList.htm")
    public ModelAndView bookingDetailsRejList(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Rejected";
        String submoduleName = "Booking Details";
        String sno = request.getParameter("pk");
        map.addAttribute("tenantDetailsRej", tenantDetailsDAO.bookingTenantDetailsRej(sno));
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../tenant/bookingDetailsRejList", map);
    }

//**************Approval 1 Form Submit******************//
    @RequestMapping("/tenant/bookingDetailsAppSubmit.htm")
    public ModelAndView bookingDetailsAppSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, MessagingException, IOException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sno = request.getParameter("pk");
        String sno1 = request.getParameter("pk1");
        String tenantCode = request.getParameter("tenantCode");
        String remarks = request.getParameter("reviewerComments");
        String advanceAmount = request.getParameter("advanceAmount");
        //String dueDate = request.getParameter("dueDate");
        String totalAmount = request.getParameter("totalAmount");
        String action = request.getParameter("action");
        String status = "";
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        Date dueDate1 = null;
//        if (!dueDate.equals("")) {
//            dueDate1 = (Date) formatter.parse(dueDate);
//        }
//        if (action.equalsIgnoreCase("edit")) {
        //tenantDetailsDAO.tenantDetailsApproveportal(sno1, "Approved", remarks, advanceAmount, dueDate1, totalAmount);
//        } else {
        tenantDetailsDAO.bookingTenantDetailsApproveportal(sno, "Approved", remarks, advanceAmount, dueDate1, totalAmount);
//        }

        Common cm = new Common();
        String subject = "", tbody = "", mailbody = "", email = "", fileName = "", tenantFname = "", tenantLname = "", assetName = "";
        String userEmail = "excelarete@gmail.com";
        String password = "excel123";
        String toEmail = "";
        List<UserRegistration> ud = tenantDetailsDAO.udList("CFO");
        for (UserRegistration udlist : ud) {
            userId = udlist.getUserId();
            email = udlist.getEmail();

            if (!userEmail.isEmpty() && !password.isEmpty() && !email.isEmpty()) {
                List<BookingTenantDetails> td = tenantDetailsDAO.bookingTdList(userId, orgId, tenantCode);
                StringBuilder emailId = new StringBuilder(email);
                if (td.size() > 0) {
                    int i = 1;
                    for (BookingTenantDetails tdlist : td) {

                        tenantFname = tdlist.getTenantFname();
                        tenantLname = tdlist.getTenantLname();
                        assetName = tdlist.getAssetName();
                    }
                    emailId.append(",");
                    emailId.append(toEmail);
                    String[] sendEmail = emailId.toString().split(",");
                    subject = "Tenant Code: " + tenantCode;
                    String filepath = request.getSession().getServletContext().getRealPath("common\\theme\\images\\logo1.png");
                    mailbody = "<html><body>Dear Sir/Madam,<br/><br/><br/>You need to give an approval for Tenant Details. Tenant Name : " + tenantFname + " " + tenantLname + ""
                            + " Please Approve this Tenant Details. <br/><br/>If approved ignore this mail. "
                            + "</body>"
                            + "<br/><br/>Thanks & Regards"
                            + "<br/>Al-Hashar Team.</html>";
                    ByteArrayOutputStream baos = new ByteArrayOutputStream();
                    baos.close();
                    cm.sendEmail(userEmail, password, sendEmail, subject, mailbody, baos, fileName);
                }
            }
        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        return new ModelAndView(new RedirectView("bookingDetailsAppList.htm"), modelMap);
    }

    @RequestMapping("/tenant/bookingTenantReject.htm")
    public ModelAndView bookingTenantReject(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String tenantCode = request.getParameter("tenantCode");
        String subAstno = request.getParameter("subAstno");
        String appstatus = request.getParameter("appstatus");
        String appremarks = request.getParameter("appremarks");
        tenantDetailsDAO.bookingTenantReject(tenantCode, appstatus, appremarks);
        tenantDetailsDAO.updateSubasset1(subAstno, "Vacant");
        return new ModelAndView(new RedirectView("../tenant/bookingDetailsRejList.htm"), map);
    }

    @RequestMapping("/tenant/bookingDetailsAppForm.htm")
    public ModelAndView bookingDetailsAppForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sno = request.getParameter("pk");
//        String landlordId = request.getParameter("llId");
//        String contractPeriod = request.getParameter("contractPeriod");
        //String assetCode = request.getParameter("assetCode");
        String assetName = request.getParameter("assetCode");

        String subclassifiedAstno = request.getParameter("subclassifiedAstno");
        String sno1 = request.getParameter("pk1");
        String tenantcode = request.getParameter("tenantCode");
//        String contractPeriod1 = request.getParameter("contractPeriod1");
        String assetName1 = request.getParameter("assetName");
        String subclassifiedAstno1 = request.getParameter("subclassifiedAstno1");
        List<BookingTenantUtilityDetails> gridData = new ArrayList<BookingTenantUtilityDetails>();
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("BookingTenantDetails", tenantDetailsDAO.list(sno, "BookingTenantDetails"));
//            modelMap.addAttribute("landLordDetails", tenantDetailsDAO.landLordDetailsList(landlordId));
//            modelMap.addAttribute("contractNamee", tenantDetailsDAO.selectContractCodee(contractPeriod));
            modelMap.addAttribute("assetDetails", tenantDetailsDAO.assetDetails(assetName));
            gridData.addAll(assetDAO.bookingTenantUtilityDetailslist(assetName, tenantcode));
            modelMap.addAttribute("assetDetails1", gridData);
            modelMap.addAttribute("subassDetails", tenantDetailsDAO.subassDetails(assetName, subclassifiedAstno));
//            modelMap.addAttribute("landlordDocuments", masterDAO.landlordDocuments(landlordId));
//            modelMap.addAttribute("contDocument", contractDAO.ContractAttachlist(contractPeriod));
        }
        if (sno1 != null && !sno1.isEmpty()) {
            modelMap.addAttribute("BookingTenantDetails", tenantDetailsDAO.list(sno1, "BookingTenantDetails"));
//            modelMap.addAttribute("landLordDetails", tenantDetailsDAO.landLordDetailsList(landlordId1));
//            modelMap.addAttribute("contractNamee", tenantDetailsDAO.selectContractCodee(contractPeriod1));
            modelMap.addAttribute("assetDetails", tenantDetailsDAO.assetDetails(assetName));
            gridData.addAll(assetDAO.bookingTenantUtilityDetailslist(assetName, tenantcode));
            modelMap.addAttribute("assetDetails1", gridData);
            modelMap.addAttribute("subassDetails", tenantDetailsDAO.subassDetails(assetName, subclassifiedAstno));
            modelMap.addAttribute("assetDetails1", gridData);
//            modelMap.addAttribute("landlordDocuments", masterDAO.landlordDocuments(landlordId1));
//            modelMap.addAttribute("contDocument", contractDAO.ContractAttachlist(contractPeriod1));
        }
        String link = "../tenant/bookingDetailsForm.htm";
        String tab = "Booking Details";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("tenantType", tenantDetailsDAO.tenantType());
        modelMap.addAttribute("tenantCategory", tenantDetailsDAO.tenantCategory());
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../tenant/bookingDetailsAppForm", modelMap);
    }

    @RequestMapping("/tenant/bookingDetailsRejForm.htm")
    public ModelAndView bookingDetailsRejForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sno = request.getParameter("pk");
//        String landlordId = request.getParameter("llId");
//        String contractPeriod = request.getParameter("contractPeriod");
        //String assetCode = request.getParameter("assetCode");
        String assetName = request.getParameter("assetCode");

        String subclassifiedAstno = request.getParameter("subclassifiedAstno");
        String sno1 = request.getParameter("pk1");
        String tenantcode = request.getParameter("tenantCode");
//        String contractPeriod1 = request.getParameter("contractPeriod1");
        String assetName1 = request.getParameter("assetName");
        String subclassifiedAstno1 = request.getParameter("subclassifiedAstno1");
        List<BookingTenantUtilityDetails> gridData = new ArrayList<BookingTenantUtilityDetails>();
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("BookingTenantDetails", tenantDetailsDAO.list(sno, "BookingTenantDetails"));
//            modelMap.addAttribute("landLordDetails", tenantDetailsDAO.landLordDetailsList(landlordId));
//            modelMap.addAttribute("contractNamee", tenantDetailsDAO.selectContractCodee(contractPeriod));
            modelMap.addAttribute("assetDetails", tenantDetailsDAO.assetDetails(assetName));
            gridData.addAll(assetDAO.bookingTenantUtilityDetailslist(assetName, tenantcode));
            modelMap.addAttribute("assetDetails1", gridData);
            modelMap.addAttribute("subassDetails", tenantDetailsDAO.subassDetails(assetName, subclassifiedAstno));
//            modelMap.addAttribute("landlordDocuments", masterDAO.landlordDocuments(landlordId));
//            modelMap.addAttribute("contDocument", contractDAO.ContractAttachlist(contractPeriod));
        }
        if (sno1 != null && !sno1.isEmpty()) {
            modelMap.addAttribute("BookingTenantDetails", tenantDetailsDAO.list(sno1, "BookingTenantDetails"));
//            modelMap.addAttribute("landLordDetails", tenantDetailsDAO.landLordDetailsList(landlordId1));
//            modelMap.addAttribute("contractNamee", tenantDetailsDAO.selectContractCodee(contractPeriod1));
            modelMap.addAttribute("assetDetails", tenantDetailsDAO.assetDetails(assetName));
            gridData.addAll(assetDAO.bookingTenantUtilityDetailslist(assetName, tenantcode));
            modelMap.addAttribute("assetDetails1", gridData);
            modelMap.addAttribute("subassDetails", tenantDetailsDAO.subassDetails(assetName, subclassifiedAstno));
            modelMap.addAttribute("assetDetails1", gridData);
//            modelMap.addAttribute("landlordDocuments", masterDAO.landlordDocuments(landlordId1));
//            modelMap.addAttribute("contDocument", contractDAO.ContractAttachlist(contractPeriod1));
        }
        String link = "../tenant/bookingDetailsForm.htm";
        String tab = "Booking Details";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("tenantType", tenantDetailsDAO.tenantType());
        modelMap.addAttribute("tenantCategory", tenantDetailsDAO.tenantCategory());
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../tenant/bookingDetailsRejForm", modelMap);
    }

    @RequestMapping("/tenant/sendBookingEmail.htm")
    public ModelAndView sendBookingEmail(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, MessagingException, DocumentException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String tenantCode = req.getParameter("tC");
        String tEmail = req.getParameter("tEmail");
        StringBuilder emailId = new StringBuilder(tEmail);
        Common cm = new Common();
        String subject = "", tbody = "", mailbody = "", pdfbody = "", suppName = "", suppAdd = "";
        String userEmail = "yugandharscts@gmail.com";
        String password = "yuga@2009";
        String toEmail = "";
        String tenantFname = "", RentAmount = "", assetName = "", SubAssetName = "";
        String tenantLname = "", shiptoLoc = "", payTerms = "", delTerms = "", ponote = "", fileName = "";
        Date DueDate = null, reqDate = null;
        Double grandTotal = 0.0;
        if (!userEmail.isEmpty() && !password.isEmpty()) {
            List<BookingTenantDetails> td = tenantDetailsDAO.bookingTdList(userId, orgId, tenantCode);
            if (td.size() > 0) {
                int i = 1;
                String desc = "";
                for (BookingTenantDetails tdlist : td) {
                    tbody = tbody + "<tr style='text-align:center;'><td>" + i + "</td>"
                            + "<td>" + tdlist.getTenantFname() + " " + tdlist.getTenantLname() + "</td>"
                            + "<td>" + tdlist.getTenantContactno() + "</td>"
                            + "<td>" + tdlist.getAssetName() + "</td>"
                            + "<td>" + tdlist.getSubclassifiedAstno() + "</td>"
                            + "</tr>";
                    tenantFname = tdlist.getTenantFname();
                    tenantLname = tdlist.getTenantLname();
                    assetName = tdlist.getAssetName();
                    SubAssetName = tdlist.getSubclassifiedAstno();
                    i++;
                }
                emailId.append(",");
                emailId.append(toEmail);
                String[] sendEmail = emailId.toString().split(",");
                subject = "Tenant Code: " + tenantCode;
                String filepath = req.getSession().getServletContext().getRealPath("common\\theme\\images\\logo1.png");
                mailbody = "<html><body>Dear Sir/Madam,<br/><br/><br/>Your Rent/Service bill amount of " + RentAmount + "/- is Due on " + DueDate + "."
                        + " Please Pay on or before due date. <br/><br/>If paid please ignore this mail. "
                        + "                             <br/><br/><br/>"
                        + "                         <head>"
                        + "                             <title></title>"
                        + "                         </head>"
                        + "                         <body>"
                        + "                             <table style='width:100%;border:1px solid black;border-collapse: collapse;'>"
                        + "                             "
                        + "                             <tr style='text-align:center;'><td><h3>Tenant Details</h3></td></tr>"
                        + "                             </table>"
                        + "                             "
                        + "                             <table style='width:100%;border-collapse: collapse;border:1px solid black;'>"
                        + "                             <tr><td>"
                        + "                               Tenant Code: " + tenantCode
                        + "                         <br/>   "
                        + "                              Tenant Name:   "
                        + tenantFname
                        + " " + tenantLname + "                         <br/>                        "
                        + "                         "
                        + "                            </td>"
                        + "                             "
                        + "                             "
                        + "                             "
                        + "                             </tr>"
                        + "                             </table>"
                        + "                             "
                        + "                              <table border='1px' style='border:1px solid black;width:100%;'>"
                        + "                              <tr style='border-bottom:1px solid black;text-align:center;'>"
                        + "                                                         <th>SNO</th>"
                        + "                                                         <th>Tenant Name</th>"
                        + "                                                         <th>Tenant Contact No.</th>"
                        + "                                                         <th>Tenant Address</th>"
                        + "                                                         <th>Asset Name</th>                                        "
                        + "                                                         <th>SubAsset Name</th>"
                        + "                              </tr>"
                        + tbody
                        + "                              </table>"
                        + ""
                        + "                         <table style='width:100%;border-collapse: collapse;border:1px solid black;'>"
                        + "                         "
                        + "                          "
                        + "                            "
                        + "</body>"
                        + "<br/><br/><br/><br/>If you have any doubts please let us know."
                        + "<br/><br/>Thanks & Regards"
                        + "<br/>Al-Hashar Team.</html>";
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                baos.close();
                cm.sendEmail(userEmail, password, sendEmail, subject, mailbody, baos, fileName);
            }
        }
        String action = req.getParameter("action");
        String message = "Mail Sent Successfully..";
        session.setAttribute("message", message);
        return new ModelAndView(new RedirectView("bookingDetailsList.htm"), modelMap);
    }

    @RequestMapping("/tenant/bookingSendSMS.htm")
    public ModelAndView bookingSendSMS(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, MessagingException, DocumentException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        //String userId = session.getAttribute("userId").toString();
        //String orgId = session.getAttribute("orgId").toString();
        //String tenantCode = req.getParameter("tC");
        String mbNo = req.getParameter("tSms");
        // String mbNo="7848030646";
        StringBuilder emailId = new StringBuilder(mbNo);
        Common.schudeleSMS(mbNo, "Dear Candidate amount of Rs.");
        String action = req.getParameter("action");
        String message = "SMS Sent Successfully..";

        session.setAttribute("message", message);
        return new ModelAndView(new RedirectView("bookingDetailsList.htm"), modelMap);
    }

    ////////////////////////////////
    @RequestMapping("/tenant/tenantAttachDownload.htm")
    public void tenantAttachDownload(HttpServletRequest req, HttpServletResponse res) throws FileNotFoundException, IOException {
        String sno = req.getParameter("SNo");

        ThirdPartyTenantDetails doc = tenantDetailsDAO.getThirdTenantttach1(Integer.parseInt(sno));
        try {
            res.setHeader("Content-Disposition", "inline;filename=\"" + doc.getTenfileName() + "\"");
            OutputStream out = res.getOutputStream();
            res.setContentType("application/force-download");
            byte[] buffer = doc.getTenantAttachment();
            InputStream in1 = new ByteArrayInputStream(buffer);
            IOUtils.copy(in1, res.getOutputStream());
            out.flush();
            out.close();
            in1.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    
    //Period Of Invoice Number 
    
     @RequestMapping("/tenant/checkPeroid.htm")
    public void checkPeroid(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException {
        res.setContentType("text/html;charset=UTF-8");
        String tenantCode = req.getParameter("tenantCode");
        String contractCode = req.getParameter("contractName");
         String period = req.getParameter("fromDate"); 
         
          String datef = req.getParameter("actualdatef");
        String datet = req.getParameter("actualdatet");
        String monthf = req.getParameter("actualmonthf1");
        String montht = req.getParameter("actualmontht1");
        String yearf = req.getParameter("actuayf");
        String yeart = req.getParameter("actuayt");
        String receiptType = req.getParameter("receiptType");
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
         
         
           Date period1 = null;
        if (null != period && !"".equals(period)) {
            period1 = (Date) formatter2.parse(period);
        }
         
        tenantDetailsDAO.checkPeroid(req, res, tenantCode,contractCode,period1);
    }
    
    @RequestMapping("/tenant/rentTrackingList.htm")
    public ModelAndView rentTrackingList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../tenant/rentTrackingList", map);
    }
    
    @RequestMapping("/tenant/tenantPortalMgmtList.htm")
    public ModelAndView tenantPortalMgmtList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../tenant/tenantPortalMgmtList", map);
    }
    
    @RequestMapping("/tenant/tenantPortalMgmtForm.htm")
    public ModelAndView tenantPortalMgmtForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../tenant/tenantPortalMgmtForm", map);
    }
    
    @RequestMapping("/tenant/receivablesList.htm")
    public ModelAndView receivablesList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
       // return new ModelAndView("../tenant/receivablesList", map);
        return new ModelAndView("../tenant/receivableManagerBox", map);
    }
    
    @RequestMapping("/tenant/receivablesForm.htm")
    public ModelAndView receivablesForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../tenant/receivablesForm", map);
    }
    
    @RequestMapping("/tenant/pettyCashList.htm")
    public ModelAndView pettyCashList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sNo = request.getParameter("pk");
      
        map.addAttribute("pettyCashList", tenantDetailsDAO.pettyCashList(userId, null));
        
        return new ModelAndView("../tenant/pettyCashList", map);
    }
    
    @RequestMapping("/tenant/pettyCashForm.htm")
    public ModelAndView pettyCashForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sNo = request.getParameter("pk");
        String walletNumber = request.getParameter("walletNumber");
        String action = request.getParameter("action");
        
        if(sNo != null) {
            map.addAttribute("pettyCashList", tenantDetailsDAO.pettyCashList(userId, sNo));
            map.addAttribute("PettyCashId", tenantDetailsDAO.PettyCashId(userId, walletNumber));
            map.addAttribute("action", action);
        }
        map.addAttribute("action", request.getParameter("action"));

      
        return new ModelAndView("../tenant/pettyCashForm", map);
    }
    
    @RequestMapping("/tenant/pettyCashFormSubmit.htm")
    public ModelAndView pettyCashFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap(); 
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String sNo = request.getParameter("pk");
        String walletNumber = request.getParameter("walletNumber");
        String walletName = request.getParameter("walletName");
        String custodianName = request.getParameter("custodianName");
        String description = request.getParameter("description");
        String walletLimit = request.getParameter("walletLimit");
        String currency = request.getParameter("currency");
        String openBalance = request.getParameter("openBalance");
        String propertyName = request.getParameter("propertyName");
        String remarks = request.getParameter("remarks");
        String[] walletNumberGrid = request.getParameterValues("walletNumberGrid");
        String[] depositDateGrid = request.getParameterValues("depositDateGrid");
        String[] depositAmountGrid = request.getParameterValues("depositAmountGrid");
        String[] trfNumberGrid = request.getParameterValues("trfNumberGrid");
        String[] paymentTypeGrid = request.getParameterValues("paymentTypeGrid");
        String status = request.getParameter("status");
        
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        
         List<PettyCash> gridData1 = new ArrayList<PettyCash>();
         
         try {
            if (sNo == null || sNo.equals("")){
             PettyCash it = new PettyCash(userId, walletNumber, walletName, custodianName, description, walletLimit, currency, openBalance, propertyName, remarks, newdate, true);
             //gridData1.add(it); 
             
             tenantDetailsDAO.newPettyCashListSave(it);
             
             try {
                      if(walletNumberGrid != null) {
                          for (int i = 0; i < walletNumberGrid.length; i++) {
                              PettyCashGrid os=new PettyCashGrid(userId, walletNumber, walletNumberGrid[i], newdate, depositAmountGrid[i], trfNumberGrid[i], paymentTypeGrid[i], newdate, true);
                              tenantDetailsDAO.newPettyCashGridListSave(os);
                          }
                      }
                  } catch(Exception ex) {
                      ex.printStackTrace();
                  }
             
         }
            else{
             
             PettyCash it = new PettyCash(Integer.parseInt(sNo), userId, walletNumber, walletName, custodianName, description, walletLimit, currency, openBalance, propertyName, remarks, newdate, true);
             
             tenantDetailsDAO.newPettyCashListSave(it);
             
             try {
                      if(walletNumberGrid != null) {
                          for (int i = 0; i < walletNumberGrid.length; i++) {
                              PettyCashGrid os=new PettyCashGrid(Integer.parseInt(sNo), userId, walletNumber, walletNumberGrid[i], newdate, depositAmountGrid[i], trfNumberGrid[i], paymentTypeGrid[i], newdate, true);
                              tenantDetailsDAO.newPettyCashGridListSave(os);
                              
                          }
                      }
                  } catch(Exception ex) {
                      ex.printStackTrace();
                  }
         }
        } catch (Exception e) {
        }
       
        
        return new ModelAndView(new RedirectView("../tenant/pettyCashList.htm"), modelMap);
    }
    
    
      @RequestMapping("/tenant/pettyCashTransactionList.htm")
    public ModelAndView pettyCashTransactionList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        
        map.addAttribute("pettyCashTransactionList", tenantDetailsDAO.pettyCashTransactionList(userId, null));

      
        return new ModelAndView("../tenant/pettyCashTransactionList", map);
    }
    
    @RequestMapping("/tenant/pettyCashTransactionForm.htm")
    public ModelAndView pettyCashTransactionForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sNo = request.getParameter("pk");
        String transactionNumber = request.getParameter("transactionNumber");
        String action = request.getParameter("action");
        
        if(sNo != null) {
            map.addAttribute("pettyCashTransactionList", tenantDetailsDAO.pettyCashTransactionList(userId, sNo));
            map.addAttribute("pettyCashTransactionId", tenantDetailsDAO.pettyCashTransactionId(userId, transactionNumber));
            map.addAttribute("action", action);
        }
        map.addAttribute("action", request.getParameter("action"));

        return new ModelAndView("../tenant/pettyCashTransactionForm", map);
    }
    
    @RequestMapping("/tenant/pettyCashTransactionFormSubmit.htm")
    public ModelAndView pettyCashTransactionFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap(); 
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String sNo = request.getParameter("pk");
        String transactionNumber = request.getParameter("transactionNumber");
        String walletNumber = request.getParameter("walletNumber");
        String walletName = request.getParameter("walletName");
        String openBalance = request.getParameter("openBalance");
        String closingBal = request.getParameter("closingBal");
        String remarks = request.getParameter("remarks");
        String[] toDate = request.getParameterValues("toDate");
        String[] narration = request.getParameterValues("narration");
        String[] amount = request.getParameterValues("amount");
        String[] trfNumber = request.getParameterValues("trfNumber");
        String[] billRefNumber = request.getParameterValues("billRefNumber");
        String[] propertyUnit = request.getParameterValues("propertyUnit");
        String status = request.getParameter("status");
        
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        
         List<pettyCashTransaction> gridData1 = new ArrayList<pettyCashTransaction>();
         
         try {
            if (sNo == null || sNo.equals("")){
             pettyCashTransaction it = new pettyCashTransaction(userId, transactionNumber, walletNumber, walletName, openBalance, closingBal, remarks, newdate, true);
             //gridData1.add(it); 
             
             tenantDetailsDAO.newPettyCashTransactionListSave(it);
             
             try {
                      if(narration != null) {
                          for (int i = 0; i < narration.length; i++) {
                              pettyCashTransactionGrid os=new pettyCashTransactionGrid(userId, transactionNumber, today, narration[i], amount[i], trfNumber[i], billRefNumber[i], propertyUnit[i], newdate, true);
                              tenantDetailsDAO.newPettyCashTransactionGridListSave(os);
                          }
                      }
                  } catch(Exception ex) {
                      ex.printStackTrace();
                  }
             
         }
            else{
             
             pettyCashTransaction it = new pettyCashTransaction(Integer.parseInt(sNo), userId, transactionNumber, walletNumber, walletName, openBalance, closingBal, remarks, newdate, true);
             
             tenantDetailsDAO.newPettyCashTransactionListSave(it);
             
             try {
                      if(narration != null) {
                          for (int i = 0; i < narration.length; i++) {
                              pettyCashTransactionGrid os=new pettyCashTransactionGrid(Integer.parseInt(sNo), userId, transactionNumber, today, narration[i], amount[i], trfNumber[i], billRefNumber[i], propertyUnit[i], newdate, true);
                              tenantDetailsDAO.newPettyCashTransactionGridListSave(os);
                              
                          }
                      }
                  } catch(Exception ex) {
                      ex.printStackTrace();
                  }
         }
        } catch (Exception e) {
        }
       
        
        return new ModelAndView(new RedirectView("../tenant/pettyCashTransactionList.htm"), modelMap);
    }
    
    @RequestMapping("/tenant/incomeAmountList.htm")
    public ModelAndView incomeAmountList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        
        map.addAttribute("incomeAmountList", tenantDetailsDAO.incomeAmountList(userId, null));

      
        return new ModelAndView("../tenant/incomeAmountList", map);
    }
    
    @RequestMapping("/tenant/AddincomeForm.htm")
    public ModelAndView AddincomeForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sNo = request.getParameter("pk");
        String property = request.getParameter("property");
        String action = request.getParameter("action");
        
        if(sNo != null) {
            map.addAttribute("incomeAmountList", tenantDetailsDAO.incomeAmountList(userId, sNo));
            map.addAttribute("incomeTrackingId", tenantDetailsDAO.incomeTrackingId(userId, property));
            map.addAttribute("action", action);
        }
        map.addAttribute("action", request.getParameter("action"));

        return new ModelAndView("../tenant/Addincome", map);
    }
    
    @RequestMapping("/tenant/AddincomeFormSubmit.htm")
    public ModelAndView AddincomeFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap(); 
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String sNo = request.getParameter("pk");
        String fromDate = request.getParameter("startDate");
        String toDate = request.getParameter("endDate");
        String property = request.getParameter("Property");
        String unit = request.getParameter("Unit");
        String[] incomeType = request.getParameterValues("submodulename");
        String[] customerName = request.getParameterValues("tabname");
        String[] propertyName = request.getParameterValues("Role");
        String[] totalPayble = request.getParameterValues("user");
        String status = request.getParameter("status");
        
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        
         List<IncomeTracking> gridData1 = new ArrayList<IncomeTracking>();
         
         try {
            if (sNo == null || sNo.equals("")){
             IncomeTracking it = new IncomeTracking(userId, date, today, property, unit, newdate, true);
             //gridData1.add(it); 
             
             tenantDetailsDAO.newIncomeAmountListSave(it);
             
             try {
                      if(incomeType != null) {
                          for (int i = 0; i < incomeType.length; i++) {
                              IncomeTrackingGrid os=new IncomeTrackingGrid(userId, property, incomeType[i], customerName[i], propertyName[i], totalPayble[i], newdate, true);
                              tenantDetailsDAO.newIncomeAmountGridListSave(os);
                          }
                      }
                  } catch(Exception ex) {
                      ex.printStackTrace();
                  }
             
         }
            else{
             
             IncomeTracking it = new IncomeTracking(userId, date, today, property, unit, newdate, true);
             
             tenantDetailsDAO.newIncomeAmountListSave(it);
             
             try {
                      if(incomeType != null) {
                          for (int i = 0; i < incomeType.length; i++) {
                              IncomeTrackingGrid os=new IncomeTrackingGrid(Integer.parseInt(sNo), userId, property, incomeType[i], customerName[i], propertyName[i], totalPayble[i], newdate, true);
                              tenantDetailsDAO.newIncomeAmountGridListSave(os);
                              
                          }
                      }
                  } catch(Exception ex) {
                      ex.printStackTrace();
                  }
         }
        } catch (Exception e) {
        }
       
        
        return new ModelAndView(new RedirectView("../tenant/incomeAmountList.htm"), modelMap);
    }
    
    @RequestMapping("/tenant/expenseAmountList.htm")
    public ModelAndView expenseAmountList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        
        map.addAttribute("expenseAmountList", tenantDetailsDAO.expenceAmountList(userId, null));

      
        return new ModelAndView("../tenant/expenseAmountList", map);
    }
    
    @RequestMapping("/tenant/AddexpenceForm.htm")
    public ModelAndView AddexpenceForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sNo = request.getParameter("pk");
        String property = request.getParameter("property");
        String action = request.getParameter("action");
        
        if(sNo != null) {
            map.addAttribute("expenceAmountList", tenantDetailsDAO.expenceAmountList(userId, sNo));
            map.addAttribute("expenceTrackingId", tenantDetailsDAO.expenceTrackingId(userId, property));
            map.addAttribute("action", action);
        }
        map.addAttribute("action", request.getParameter("action"));

        return new ModelAndView("../tenant/Addexpense", map);
    }
    
    @RequestMapping("/tenant/AddexpenceFormSubmit.htm")
    public ModelAndView AddexpenceFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap(); 
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String sNo = request.getParameter("pk");
        String fromDate = request.getParameter("startDate");
        String toDate = request.getParameter("endDate");
        String property = request.getParameter("Property");
        String unit = request.getParameter("Unit");
        String expenceType = request.getParameter("Expensetype");
        String[] vendor = request.getParameterValues("Vendor");
        String[] paymentType = request.getParameterValues("Paymenttype");
        String[] amount = request.getParameterValues("Amount");
        String[] totalPayble = request.getParameterValues("TotalPayable");
        String status = request.getParameter("status");
        
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        
        Date fromDate1 = null;
        try {
                if (fromDate != null || !fromDate.equals("")) {
                    fromDate1 = (Date) formatter2.parse(fromDate);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        Date toDate1 = null;
        try {
                if (toDate != null || !toDate.equals("")) {
                    toDate1 = (Date) formatter2.parse(toDate);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        List<ExpenceTracking> gridData1 = new ArrayList<ExpenceTracking>();
         
         try {
            if (sNo == null || sNo.equals("")){
             ExpenceTracking it = new ExpenceTracking(userId, fromDate1, toDate1, property, expenceType,unit, newdate, Boolean.TRUE);
             //gridData1.add(it); 
             
             tenantDetailsDAO.newexpenceAmountListSave(it);
             
             try {
                      if(vendor != null) {
                          for (int i = 0; i < vendor.length; i++) {
                              ExpenceTrackingGrid os=new ExpenceTrackingGrid(userId, property, "", vendor[i], paymentType[i], amount[i], totalPayble[i], newdate, Boolean.TRUE);
                              tenantDetailsDAO.newexpenceAmountGridListSave(os);
                          }
                      }
                  } catch(Exception ex) {
                      ex.printStackTrace();
                  }
             
         }
            else{
             
             ExpenceTracking it = new ExpenceTracking(Integer.parseInt(sNo),userId, fromDate1, toDate1, property, expenceType,unit, newdate, Boolean.TRUE);
             
             tenantDetailsDAO.newexpenceAmountListSave(it);
             
             try {
                      if(vendor != null) {
                          for (int i = 0; i < vendor.length; i++) {
                              ExpenceTrackingGrid os=new ExpenceTrackingGrid(Integer.parseInt(sNo), userId, property, "", vendor[i], paymentType[i], amount[i], totalPayble[i], newdate, Boolean.TRUE);
                              tenantDetailsDAO.newexpenceAmountGridListSave(os);
                              
                          }
                      }
                  } catch(Exception ex) {
                      ex.printStackTrace();
                  }
         }
        } catch (Exception e) {
        }
       
        
        return new ModelAndView(new RedirectView("../tenant/expenseAmountList.htm"), modelMap);
    }
    
    @RequestMapping("/tenant/chequeList.htm")
    public ModelAndView chequeList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../tenant/chequeList", map);
    }
    
    @RequestMapping("/tenant/chequeForm.htm")
    public ModelAndView ChequeForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../tenant/chequeForm", map);
    }
    @RequestMapping("/tenant/ExpenseTypeSettingsListt.htm")
    public ModelAndView ExpenseTypeSettingsList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../expensesManager/ExpenseTypeSettingsList", map);
    }
     
    @RequestMapping("/tenant/expensesList.htm")
    public ModelAndView expensesList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../expensesManager/expenseManagerBox", map);
    

    }
    @RequestMapping("/tenant/bookedExpensesTracking.htm")
    public ModelAndView bookedExpensesTracking(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../expensesManager/bookedExpensesTracking", map);
    

    }
   
     
         @RequestMapping("/tenant/expensesForm.htm")
    public ModelAndView expensesForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../expensesManager/expensesForm", map);
    }
   
    @RequestMapping("/tenant/ExpenseCategorySettingsList.htm")
    public ModelAndView ExpenseCategorySettingsList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../expensesManager/ExpenseCategorySettingsList", map);
    }
    @RequestMapping("/tenant/paidExpensesTracking.htm")
    public ModelAndView paidExpensesTracking(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../expensesManager/paidExpensesTracking", map);
    }
    @RequestMapping("/tenant/IncomePeriodSettingsList.htm")
    public ModelAndView IncomePeriodSettingsList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../expensesManager/IncomePeriodSettingsList", map);
    }
    @RequestMapping("/tenant/voucherList.htm")
    public ModelAndView voucherList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../finance/voucherList", map);
    }
    @RequestMapping("/finance/voucherForm.htm")
    public ModelAndView voucherForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../finance/voucherForm", map);
    }
     @RequestMapping("/tenant/bookedInvoicesList.htm")
    public ModelAndView bookedInvoicesList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../tenant/bookedInvoices", map);
    }
     @RequestMapping("/tenant/processedInvoiceList.htm")
    public ModelAndView processedInvoiceList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../tenant/processedInvoiceList", map);
    }
    
    @RequestMapping("/tenant/agingInvoices.htm")
    public ModelAndView agingInvoices(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../tenant/agingInvoices", map);
    }
    @RequestMapping("/tenant/cancelledInvoices.htm")
    public ModelAndView cancelledInvoices(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../tenant/cancelledInvoices", map);
    }
    
    
    
    @RequestMapping("/tenant/ExpenseCategorySettingsForm.htm")
    public ModelAndView ExpenseCategorySettingsForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../expensesManager/ExpenseCategorySettingsForm", map);
    }
    @RequestMapping("/tenant/IncomePeriodSettings.htm")
    public ModelAndView IncomePeriodSettings(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../expensesManager/IncomePeriodSettings", map);
    }
    @RequestMapping("/tenant/IncomeMethodSettings.htm")
    public ModelAndView IncomeMethodSettings(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../expensesManager/IncomeMethodSettings", map);
    }
    
     @RequestMapping("/tenant/IncomeMethodSettingsList.htm")
    public ModelAndView IncomeMethodSettingsList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../expensesManager/IncomeMethodSettingsList", map);
    }
     @RequestMapping("/tenant/bookedExpenses.htm")
    public ModelAndView bookedExpenses(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../expensesManager/bookedExpenses", map);
    }
    @RequestMapping("/tenant/ExpenseTypeSettingsForm.htm")
    public ModelAndView ExpenseTypeSettingsForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../expensesManager/ExpenseTypeSettingsForm", map);
    }
    @RequestMapping("/tenant/createNewExpenseForm.htm")
    public ModelAndView createNewExpenseForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../expensesManager/createNewExpenseForm", map);
    }
    
    
    
    @RequestMapping("/tenant/taxList.htm")
    public ModelAndView taxList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../tenant/taxList", map);
    }
    
    @RequestMapping("/tenant/taxForm.htm")
    public ModelAndView taxForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../tenant/taxForm", map);
    }
    
    @RequestMapping("/tenant/rentPostingTrackingList.htm")
    public ModelAndView rentPostingTrackingList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../tenant/rentPostingTrackingList", map);
    }
    
    @RequestMapping("/tenant/rentPostingTrackingForm.htm")
    public ModelAndView rentPostingTrackingForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../tenant/rentPostingTrackingForm", map);
    }
    
    @RequestMapping("/tenant/incomeExpenseList.htm")
    public ModelAndView incomeExpenseList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../tenant/incomeExpenseList", map);
    }
    
    @RequestMapping("/tenant/incomeExpenseForm.htm")
    public ModelAndView incomeExpenseForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../tenant/incomeExpenseForm", map);
    }
    
    @RequestMapping("/tenant/serviceChargeList.htm")
    public ModelAndView serviceChargeList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../tenant/serviceChargeList", map);
    }
    
    @RequestMapping("/tenant/serviceChargeForm.htm")
    public ModelAndView serviceChargeForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../tenant/serviceChargeForm", map);
    }
    
    @RequestMapping("/tenant/selectPropertyName.htm")
    public ModelAndView selectPropertyName(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("assetDetails", assetDAO.selectAssetDetails());
        return new ModelAndView("selectPropertyName", modelMap);
    }
    
    @RequestMapping("/tenant/selectPropertyUnitDetails.htm")
    public ModelAndView selectPropertyUnitDetails(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("assetDetails", assetDAO.selectAssetDetails());
        return new ModelAndView("../assets/selectPropertyUnitDetails", modelMap);
    }
    
    @RequestMapping("/tenant/newEnquiryList.htm")
    public ModelAndView newEnquiryList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
//        String roleName = session.getAttribute("userRole").toString();
        String sNo = request.getParameter("pk");
//        String fromDate = request.getParameter("fromDate");
        
        map.addAttribute("newEnquiryList", tenantDetailsDAO.newEnquiryList(userId, null)); 
        return new ModelAndView("../tenant/newEnquiryList", map);
    }
    
    @RequestMapping("/tenant/newEnquiryForm.htm")
    public ModelAndView newEnquiryForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        
        String sno = request.getParameter("pk");
        String action = request.getParameter("action");
        if(sno != null) {
            modelMap.addAttribute("newEnquiryList", tenantDetailsDAO.newEnquiryList(userId, sno));
            modelMap.addAttribute("action", action);
        }
        
        Integer bookingIdCount = tenantDetailsDAO.getEnquiryId();
        bookingIdCount = bookingIdCount + 1;
        String prebookingIdCount = "";
        if(bookingIdCount < 9) {
            prebookingIdCount = "00000";
        } else if(bookingIdCount > 9 && bookingIdCount < 99) {
            prebookingIdCount = "0000";
        } else if(bookingIdCount > 100) {
            prebookingIdCount = "000";
        }
        String EnquiryCode = "EN-ID-" + prebookingIdCount + bookingIdCount;
        
        modelMap.addAttribute("EnquiryCode", EnquiryCode);
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../tenant/newEnquiryForm", modelMap);
    }
    
    @RequestMapping("/tenant/newEnquiryFormSubmit.htm")
    public ModelAndView newEnquiryFormSubmit(HttpServletRequest request, HttpServletResponse response) throws SQLException {
    
        ModelMap modelMap = new ModelMap(); 
        HttpSession session = request.getSession(true);
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String sno = request.getParameter("pk");
        String enquiryId=request.getParameter("enquiryId");
        String coutmerName=request.getParameter("coutmer896Name");
        String companyName=request.getParameter("companyName");
        String contactNumber=request.getParameter("contactNumber");
        String enquiryDate=request.getParameter("");
        String email=request.getParameter("Email");
        String property=request.getParameter("Property");
        String unit=request.getParameter("Unit");
        String remarks=request.getParameter("remarks");
        
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss a");
         
//        Date contractStartDate1 = null;
//        try {
//            if (contractStartDate != null || !contractStartDate.equals("")) {
//                contractStartDate1 = (Date) formatter2.parse(contractStartDate);
//            }
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
        
        List<Enqueries> gridData1 = new ArrayList<Enqueries>();
         
         if (sno == null || sno.equals("")){
             Enqueries it = new Enqueries(userId, enquiryId, coutmerName, companyName, contactNumber, newdate, email, property, unit, remarks, newdate, true);
             gridData1.add(it);
             
             tenantDetailsDAO.newEnquiryListSave(gridData1);
             
         }else{
             
             Enqueries it = new Enqueries(Integer.parseInt(sno), userId, enquiryId, coutmerName, companyName, contactNumber, newdate, email, property, unit, remarks, newdate, true);
             
             tenantDetailsDAO.newNewEnquiryListSave(it);
         }
        return new ModelAndView(new RedirectView("../tenant/newEnquiryList.htm"), modelMap);
        
        }
    
    @RequestMapping("/management/updateUtilityManagementStatus.htm")
    public ModelAndView updateUtilityManagementStatus(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String SNo = request.getParameter("SNo");
          String updateStatus = request.getParameter("updateStatus");
        tenantDetailsDAO.updateUtilityManagementStatus(SNo, updateStatus);
        return new ModelAndView(new RedirectView("utilityManagementList.htm"), modelMap);
    }
    @RequestMapping("/tenant/selectEnquiryDetails.htm")
    public ModelAndView selectEnquiryDetails(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("enquiryId", tenantDetailsDAO.selectEnquiryDetails());
        return new ModelAndView("../assets/SelectEnquiryDetailsForm", modelMap);
    }
    @RequestMapping("/tenant/selectQuotationDetails.htm")
    public ModelAndView selectQuotationDetails(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("selectQuotationDetails", tenantDetailsDAO.selectQuotationDetails());
        return new ModelAndView("../assets/selectBookingDetailsForm", modelMap);
    }
    @RequestMapping("/tenant/fetchPropertyDetails.htm")
    public void fetchPropertyDetails(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        
        String Property = request.getParameter("budgetCategory");
        tenantDetailsDAO.fetchPropertyDetails(request, response, Property);
        //System.out.println(tenantDetailsDAO.fetchPropertyDetails(request, response, Property));
    }
    @RequestMapping("/tenant/fetchVacantPropertyDetails.htm")
    public void fetchVacantPropertyDetails(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        
        String Property = request.getParameter("budgetCategory");
        String recordStatus = "Vacant";
        tenantDetailsDAO.fetchVacantPropertyDetails(request, response, Property,recordStatus);
        //System.out.println(tenantDetailsDAO.fetchPropertyDetails(request, response, Property));
    }
    @RequestMapping("/tenant/fetchBookedPropertyDetails.htm")
    public void fetchBookedPropertyDetails(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        
        String Property = request.getParameter("budgetCategory");
        String recordStatus = "Booked";
        tenantDetailsDAO.fetchBookedPropertyDetails(request, response, Property,recordStatus);
        //System.out.println(tenantDetailsDAO.fetchPropertyDetails(request, response, Property));
    }
    @RequestMapping("/tenant/fetchOccupiedPropertyDetails.htm")
    public void fetchOccupiedPropertyDetails(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        
        String Property = request.getParameter("budgetCategory");
        String recordStatus = "Occupied";
        tenantDetailsDAO.fetchOccupiedPropertyDetails(request, response, Property,recordStatus);
        //System.out.println(tenantDetailsDAO.fetchPropertyDetails(request, response, Property));
    }
    
     @RequestMapping("/tenant/updateEnquiryStatus.htm")
    public ModelAndView updateEnquiryStatus(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(false);
    

        String checklistPk = request.getParameter("pk");
        String status = request.getParameter("status");

        if (status.equals("true")) {
            tenantDetailsDAO.updateEnquiryStatus("False", checklistPk);
        } else if (status.equals("false")) {
            tenantDetailsDAO.updateEnquiryStatus("True", checklistPk);
        }
        return new ModelAndView(new RedirectView("newEnquiryList.htm"), modelMap);
        //return new ModelAndView("../tenant/newEnquiryList", modelMap);
    }
    @RequestMapping("/management/fetchCommonUtilityDetails.htm")
    public void fetchCommonUtilityDetails(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        
        
        
        tenantDetailsDAO.fetchCommonUtilityDetails(request, response);
        //System.out.println(tenantDetailsDAO.fetchPropertyDetails(request, response, Property));
    }
    @RequestMapping("/management/fetchIndividualUtilityDetails.htm")
    public void fetchIndividualUtilityDetails(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        
        
        
        tenantDetailsDAO.fetchIndividualUtilityDetails(request, response);
        //System.out.println(tenantDetailsDAO.fetchPropertyDetails(request, response, Property));
    }
}

