/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.MediaType;
import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import tenant.classes.AssetClass;
import tenant.classes.IdGenerator;
import tenant.classes.LedgerMaster;
import tenant.classes.LedgerMasterEntity;
import tenant.classes.Liabilities;
import tenant.classes.ManageInvoice;
import tenant.classes.ReceivableInvoice;
import tenant.classes.ReceivableInvoiceEntity;
import tenant.classes.RentDetailsEntity;
import tenant.classes.RentDetailsEntity1;
import tenant.classes.ServiceDetaiilsInvoice;
import tenant.classes.StandardInvoice;
import tenant.classes.VoucherMaster;
import tenant.classes.VoucherMasterEntity;
import tenant.dao.AssetDAO;
import tenant.dao.FinanceDetailsDAO;
import tenant.other.classes.commonInterface;

/**
 *
 * @author ebs-sdd41
 */
public class FinanceController {
    
    @Autowired
    private FinanceDetailsDAO financeDetailsDAO;
    
    @Autowired
    private AssetDAO assetDAO;
    
//    @Autowired
//    RestTemplate restTemplate;
    
    DateFormat f = new SimpleDateFormat("dd-MM-yyyy");
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
    
    String hostUrl = "http://182.74.202.101:8099/finance-service-1.0";
    String invoiceURl = "/receivable";
    String ledgerUrl = "/ledger";
    String voucherUrl = "/voucher";

    
    public static String formatedTimeStamp(Date dt)
    {
		try
		{
			DateFormat df = new SimpleDateFormat("ddMMyyyyhhmmss");
			String dtStr = df.format(dt);
			
			return dtStr;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
    }
//    @Override
//    public void globalSave(Object transientInstance) {
//        
//    }
//
//    @Override
//    public List<Class> list(String instanceVariable, String className) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
//
//    @Override
//    public List<Class> list(Integer instanceVariable, String className) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
//
//    @Override
//    public void globalInactive(String instanceVariable, String className) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
//
//    @Override
//    public void globalDelete(Integer instanceVariable) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
//
//    @Override
//    public List<Class> roleperm(String orgId, String roleName, String submoduleName, String tab) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
    
    @RequestMapping("/finance/assetList.htm")
    public ModelAndView assetList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
         HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
         ModelMap modelMap = new ModelMap();

        String SNo = request.getParameter("SNo");
        
//        if(SNo != null) {
//            modelMap.addAttribute("assetList", financeDetailsDAO.assetList(userId, orgId, SNo));
//        }    
        modelMap.addAttribute("assetsList", financeDetailsDAO.assetList(userId, orgId, null));
        
        return new ModelAndView("assetsList", modelMap);
    }
    
    @RequestMapping("/finance/assetForm.htm")
    public ModelAndView assettForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(false);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String SNo = request.getParameter("SNo");
       
        if (SNo != null) {
              modelMap.addAttribute("assetList", financeDetailsDAO.assetList(userId, orgId, SNo));
        }
    
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));
        modelMap.addAttribute("recordStatus", request.getParameter("recordStatus"));
        
 
        return new ModelAndView("assetsForm", modelMap);

    }
    
    @RequestMapping("/finance/assetFormSubmit.htm")
    public ModelAndView assetFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
    
        String assetClassId  = request.getParameter("assetClassId");
        String assetClassName  = request.getParameter("assetClassName");
        String assetClassDescription  = request.getParameter("assetClassDescription");
        String status  = request.getParameter("status");
        
        String SNo = request.getParameter("SNo");
        if(status == null) {
            status = "update0";
        }
       
        List<AssetClass> gridData = new ArrayList<AssetClass>();

        if (SNo == null || SNo.equals("")) {
            AssetClass assetClass = null;
           
              assetClass = new AssetClass(userId, orgId, assetClassId, assetClassName, assetClassDescription, status, newdate, newdate);

            gridData.add(assetClass);

            
            financeDetailsDAO.assetSaveList(gridData);
            modelMap.addAttribute("success", "true");
            modelMap.addAttribute("message", "Data Saved Successfully...");

        } else {
            AssetClass assetClass = null;
                assetClass = new AssetClass(Integer.parseInt(SNo), userId, orgId, assetClassId, assetClassName, assetClassDescription, status, newdate, newdate);

            financeDetailsDAO.assetSave(assetClass);
   
            modelMap.addAttribute("success", "true");
            modelMap.addAttribute("message", "Data Updated Successfully...");
        }
        
         return new ModelAndView(new RedirectView("assetList.htm"), modelMap);
    }
    
    @RequestMapping("/finance/liabilitiesList.htm")
    public ModelAndView liabilitiesList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
         HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
         ModelMap modelMap = new ModelMap();

        String SNo = request.getParameter("SNo");
        
//        if(SNo != null) {
//            modelMap.addAttribute("assetList", financeDetailsDAO.assetList(userId, orgId, SNo));
//        }    
        modelMap.addAttribute("liabilitiesList", financeDetailsDAO.liabilitiesList(userId, orgId, null));
        
        return new ModelAndView("liabiliatiesList", modelMap);
    }
    
    @RequestMapping("/finance/liabilitiesForm.htm")
    public ModelAndView liabilitiesForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(false);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String SNo = request.getParameter("SNo");
       
        if (SNo != null) {
              modelMap.addAttribute("liabilitiesList", financeDetailsDAO.liabilitiesList(userId, orgId, SNo));
        }
    
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));
        modelMap.addAttribute("recordStatus", request.getParameter("recordStatus"));
        
        return new ModelAndView("liabiliatiesForm", modelMap);
    }
    
    @RequestMapping("/finance/liabilitiesFormSubmit.htm")
    public ModelAndView liabilitiesFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
    
        String liabilitiesClassId  = request.getParameter("liabilitiesClassId");
        String liabilitiesClassName  = request.getParameter("liabilitiesClassName");
        String liabilitiesClassDescription  = request.getParameter("liabilitiesClassDescription");
        String status  = request.getParameter("status");
        
        String SNo = request.getParameter("SNo");
        if(status == null) {
            status = "update0";
        }
       
        List<Liabilities> gridData = new ArrayList<Liabilities>();

        if (SNo == null || SNo.equals("")) {
            Liabilities liabilities = null;
           
             liabilities = new Liabilities(userId, orgId, liabilitiesClassId, liabilitiesClassName, liabilitiesClassDescription, status, newdate, newdate);

            gridData.add(liabilities);

            
            financeDetailsDAO.liabilitiesSaveList(gridData);
            modelMap.addAttribute("success", "true");
            modelMap.addAttribute("message", "Data Saved Successfully...");

        } else {
            Liabilities liabilities = null;
                liabilities = new Liabilities(Integer.parseInt(SNo), userId, orgId, liabilitiesClassId, liabilitiesClassName, liabilitiesClassDescription, 
                        status, newdate, newdate);

            financeDetailsDAO.liabilitiesSave(liabilities);
   
            modelMap.addAttribute("success", "true");
            modelMap.addAttribute("message", "Data Updated Successfully...");
        }
        
         return new ModelAndView(new RedirectView("liabilitiesList.htm"), modelMap);
    }
    
    @RequestMapping("/finance/selectPropertyListInLedger.htm")
    public ModelAndView selectRentQuoteProprtyDetails(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        
        modelMap.addAttribute("assetDetails", assetDAO.subRentQuotetDetailslist(null));
        return new ModelAndView("SelectPropertyListInLedger", modelMap);
    }
    
    @RequestMapping("/finance/ledgerList.htm")
    public ModelAndView ledgerList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
         HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
         ModelMap modelMap = new ModelMap();

        String SNo = request.getParameter("SNo");
        
        modelMap.addAttribute("ledgerList", financeDetailsDAO.ledgerList(userId, orgId, null));
        
        return new ModelAndView("ledgerList", modelMap);
    }
    
    @RequestMapping("/finance/ledgerForm.htm")
    public ModelAndView ledgerForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(false);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String SNo = request.getParameter("SNo");
//        ArrayList enq = (ArrayList) financeDetailsDAO.ledgerCodeInc(userId, orgId, null, null, "1");
//        
//        String orderNo=null;
//        String orderNo2 = null;
//        String[] orderNo1 = null;
//        int ordno = 1;
//        if (!(enq.isEmpty())) {
//            for (Iterator<LedgerMasterEntity> iter = enq.iterator(); iter.hasNext();) {
//                orderNo = iter.next().getLedgerNo();
//            }
//            //orderNo1 = orderNo2.split("-");
//        }
//        if (orderNo != null) {
//            orderNo1 = orderNo.split("-");
//            ordno = Integer.parseInt(orderNo1[1]) + 1;
//        }
//        orderNo = "Ledger" + "-" + ordno;
       
        if (SNo != null) {
              modelMap.addAttribute("ledgerList", financeDetailsDAO.ledgerList(userId, orgId, SNo));
        }
    
        modelMap.addAttribute("SNo", SNo);
//        modelMap.addAttribute("orderNo", orderNo);
        modelMap.addAttribute("action", request.getParameter("action"));
        modelMap.addAttribute("recordStatus", request.getParameter("recordStatus"));
         
        return new ModelAndView("ledgerForm", modelMap);
    }
    
    @RequestMapping("/finance/ledgerFormSubmit.htm")
    public ModelAndView ledgerFormSub(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
    
        String status = request.getParameter("status");
        String ledgerNo = request.getParameter("ledgerNo");
        String ledgerCode = request.getParameter("ledgerCode");
        String ledgerDescription = request.getParameter("ledgerDescription");
        String ledgerGroup = request.getParameter("ledgerGroup");
        String ledgerName = request.getParameter("ledgerName");
        String bankAccountNo = request.getParameter("bankAccountNo");
        String ledgerOpeningBalance = request.getParameter("ledgerOpeningBalance");
        String ledgerReportGroup = request.getParameter("ledgerReportGroup");
        String ledgerSubgroup = request.getParameter("ledgerSubgroup");
        String creationDate = request.getParameter("creationDate");
        String bankAccountName = request.getParameter("bankAccountName");
        String shop  = request.getParameter("shop");
        String costCenter = request.getParameter("costCenter");
        
        String ledgerMasterPk = request.getParameter("ledgerMasterPk");
        if(status == null) {
            status = "true";
        }
        Date creationDate1 = null;
//        try {
//                if (!"".equals(creationDate) &&  creationDate!= null) {
//                     creationDate1 = (Date) f.parse(creationDate);
//                }
//        } catch (NullPointerException ex) {
//        }
        
       
        List<AssetClass> gridData = new ArrayList<AssetClass>();
        Date d = new Date();
	//System.out.println("date:"+d);
	Calendar cal = Calendar.getInstance();
	cal.setTime(d);
	int month = cal.get(Calendar.MONTH);
	int year = cal.get(Calendar.YEAR);

        if (ledgerMasterPk == null || ledgerMasterPk.equals("")) {
            
            LedgerMasterEntity ledger = null;
            ledger = new LedgerMasterEntity(ledgerNo, ledgerCode, ledgerDescription, ledgerGroup, ledgerName, bankAccountNo, Double.parseDouble(ledgerOpeningBalance), 0.0, ledgerReportGroup, 
                    ledgerSubgroup, bankAccountName, shop, costCenter, creationDate1, creationDate, Boolean.parseBoolean(status), String.valueOf(month+1), String.valueOf(year));
           
            financeDetailsDAO.ledgerMasterEntitySave(ledger);
            modelMap.addAttribute("success", "true");
            modelMap.addAttribute("message", "Data Saved Successfully...");

        } else {
//            AssetClass assetClass = null;
//                assetClass = new AssetClass(Integer.parseInt(SNo), userId, orgId, assetClassId, assetClassName, assetClassDescription, status, newdate, newdate);
//
//            financeDetailsDAO.assetSave(assetClass);
   
            modelMap.addAttribute("success", "true");
            modelMap.addAttribute("message", "Data Updated Successfully...");
        }
        
         return new ModelAndView(new RedirectView("ledgerList.htm"), modelMap);
    }
    
//    @RequestMapping("/finance/rentInvoiceList.htm")
//    public ModelAndView rentInvoiceList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
//         HttpSession session = request.getSession(true);
//        String userId = session.getAttribute("userId").toString();
//        String orgId = session.getAttribute("orgId").toString();
//         ModelMap modelMap = new ModelMap();
//
//        String SNo = request.getParameter("SNo");
//          
//        modelMap.addAttribute("rentInvoiceList", financeDetailsDAO.invoiceList(userId, orgId, null));
//        
//        return new ModelAndView("../tenant/rentInvoiceList", modelMap);
//    }
    
    @RequestMapping("/finance/rentInvoiceForm.htm")
    public ModelAndView rentInvoiceForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(false);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String SNo = request.getParameter("SNo");
       
        if (SNo != null) {
              modelMap.addAttribute("rentInvoiceList", financeDetailsDAO.invoiceList(userId, orgId, SNo));
        }
    
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));
        modelMap.addAttribute("recordStatus", request.getParameter("recordStatus"));
        
 
        return new ModelAndView("../tenant/standardInvoiceForm", modelMap);

    }
    
    @RequestMapping("/finance/standardInvoiceFormSubmit.htm")
    public ModelAndView standardInvoiceFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
    
        String invoiceNo  = request.getParameter("invoiceNo");
        String invoiceType  = request.getParameter("invoiceType");
        String description  = request.getParameter("description");
        String taxCode  = request.getParameter("taxCode");

        //TenentDetails
        String propertyName  = request.getParameter("propertyName");
        String servcieAreaDescription  = request.getParameter("servcieAreaDescription");
        String customerName  = request.getParameter("customerName");
        String dueDate  = request.getParameter("dueDate");
        String fromDate  = request.getParameter("fromDate");
        String toPeriod  = request.getParameter("toPeriod");

        //AdditionalDetails
        String bankAccountDetails  = request.getParameter("bankAccountDetails");
        String paymentTerms  = request.getParameter("paymentTerms");
        String contractTerms  = request.getParameter("contractTerms");
        String discount  = request.getParameter("discount");
        String amountPaid  = request.getParameter("amountPaid");
        String subtotal  = request.getParameter("subtotal");
        String vat  = request.getParameter("vat");
        String discountedAmount  = request.getParameter("discountedAmount");
        String totalPayableAmt  = request.getParameter("totalPayableAmt");
        String balance  = request.getParameter("balance");

        String invoice  = request.getParameter("invoice");
        String createdDate  = request.getParameter("createdDate");
        String status  = request.getParameter("status");
        
        String SNo = request.getParameter("SNo");
        
        //ServiceDetails
        String serviceCategory[]  = request.getParameterValues("serviceCategory");
        String serviceDesc[]  = request.getParameterValues("serviceDesc");
        String serviceChargeAmount[]  = request.getParameterValues("serviceChargeAmount");
        String vatPercentage[]  = request.getParameterValues("vatPercentage");
        String vatServiceDetails[]  = request.getParameterValues("vatServiceDetails");
        String totalAmount[]  = request.getParameterValues("totalAmount");
    
        String serviceDetailsPk[] = request.getParameterValues("serviceDetailsPk");
        
        String pdChequeNo = request.getParameter("pdChequeNo");
        String lpNo = request.getParameter("lpNo");
        String unitName = request.getParameter("unitName");
        String tenantName = request.getParameter("customerName");
        String frequency = request.getParameter("frequency");
        String nextIssueDate = request.getParameter("nextIssueDate");
        String invoiceRecurringType = request.getParameter("invoiceRecurringType");
        String recordStatus = request.getParameter("recordStatus");
        
        if(status == null) {
            status = "update0";
        }
        Date dueDate1 = null;
        try {
                if (!"".equals(dueDate) &&  dueDate!= null) {
                     dueDate1 = (Date) f.parse(dueDate);
                }
        } catch (NullPointerException ex) {
        }
       
        List<StandardInvoice> gridData = new ArrayList<StandardInvoice>();
        List<ServiceDetaiilsInvoice> serviceGridData = new ArrayList<ServiceDetaiilsInvoice>();

        if (SNo == null || SNo.equals("")) {

//            StandardInvoice standardInvoice = null;
//            standardInvoice = new StandardInvoice(userId, orgId, invoiceNo, invoiceType, description, taxCode, propertyName, servcieAreaDescription, customerName, 
//                    date, date, date, bankAccountDetails, paymentTerms, contractTerms, Double.parseDouble(discount), Double.parseDouble(amountPaid), Double.parseDouble(subtotal), 
//                    Double.parseDouble(vat), Double.parseDouble(discountedAmount), Double.parseDouble(totalPayableAmt), Double.parseDouble(balance), invoice, status, 
//                    newdate, sqlTimestamp);
//            
//            gridData.add(standardInvoice);
//            financeDetailsDAO.invoiceSaveList(gridData); 
  /*          ReceivableInvoiceEntity entity = null;
            entity = new ReceivableInvoiceEntity(userId, orgId, invoiceNo, "Service", invoiceType, description, taxCode, pdChequeNo, lpNo, unitName, tenantName, 
                    date, propertyName, servcieAreaDescription, customerName, date, date, false, Double.parseDouble(discount), Double.parseDouble(amountPaid), paymentTerms, 
                    contractTerms, newdate, true, frequency, 
                    newdate, "", Double.parseDouble(subtotal), Double.parseDouble(balance), Double.parseDouble(vat), Double.parseDouble(totalPayableAmt), "", bankAccountDetails);
            
            financeDetailsDAO.newInvoiceSave(entity);  */
            StandardInvoice entity = null;
            entity = new StandardInvoice(userId, orgId, invoiceNo, "Standard", invoiceType, description, taxCode, "", "", "", tenantName, 
                    dueDate1, propertyName, servcieAreaDescription, customerName, date, date, false, Double.parseDouble(discount), Double.parseDouble(amountPaid), paymentTerms, 
                    contractTerms, newdate, "active", "", 
                    newdate, "", Double.parseDouble(subtotal), Double.parseDouble(balance), Double.parseDouble(vat), Double.parseDouble(totalPayableAmt), "", bankAccountDetails, "PENDING"); //pdChequeNo, lpNo, unitName, frequency
            
            financeDetailsDAO.invoiceSave(entity);
            try {
//                for(int i = 0; i < serviceCategory.length; i++) {
////                    if(serviceDetailsPk[i] == null) {
//                            ServiceDetaiilsInvoice serviceDetails = null;
//                        serviceDetails = new ServiceDetaiilsInvoice(orgId, userId, invoiceNo, "Standard", serviceCategory[i], serviceDesc[i], Double.parseDouble(serviceChargeAmount[i]), 
//                                Double.parseDouble(vatPercentage[i]),Double.parseDouble(vatServiceDetails[i]), Double.parseDouble(totalAmount[i]), newdate, sqlTimestamp);
//
//                        financeDetailsDAO.serviceDetailsSave(serviceDetails);
////                    }
//                }
            } catch(Exception ex) {
                ex.printStackTrace();
            }
            modelMap.addAttribute("success", "true");
            modelMap.addAttribute("message", "Data Saved Successfully...");

        } else {
//            StandardInvoice standardInvoice = null;
//            standardInvoice = new StandardInvoice(Integer.parseInt(SNo), userId, orgId, invoiceNo, invoiceType, description, taxCode, propertyName, servcieAreaDescription, customerName, 
//                    date, date, date, bankAccountDetails, paymentTerms, contractTerms, Double.parseDouble(discount), Double.parseDouble(amountPaid), Double.parseDouble(subtotal), 
//                    Double.parseDouble(vat), Double.parseDouble(discountedAmount), Double.parseDouble(totalPayableAmt), Double.parseDouble(balance), invoice, status, 
//                    newdate, sqlTimestamp);
//   
//            financeDetailsDAO.invoiceSave(standardInvoice);
/*            ReceivableInvoiceEntity entity = null;
            entity = new ReceivableInvoiceEntity(Integer.parseInt(SNo), userId, orgId, invoiceNo, "Service", invoiceType, description, taxCode, pdChequeNo, lpNo, unitName, tenantName, 
                    date, propertyName, servcieAreaDescription, customerName, date, date, false, Double.parseDouble(discount), Double.parseDouble(amountPaid), paymentTerms, 
                    contractTerms, newdate, true, frequency, 
                    newdate, "", Double.parseDouble(subtotal), Double.parseDouble(balance), Double.parseDouble(vat), Double.parseDouble(totalPayableAmt), "", bankAccountDetails);
            
            financeDetailsDAO.newInvoiceSave(entity);  */
            StandardInvoice entity = null;
            entity = new StandardInvoice(Integer.parseInt(SNo), userId, orgId, invoiceNo, "Standard", invoiceType, description, taxCode, pdChequeNo, lpNo, unitName, tenantName, 
                    date, propertyName, servcieAreaDescription, customerName, date, date, false, Double.parseDouble(discount), Double.parseDouble(amountPaid), paymentTerms, 
                    contractTerms, newdate, "active", frequency, 
                    newdate, "", Double.parseDouble(subtotal), Double.parseDouble(balance), Double.parseDouble(vat), Double.parseDouble(totalPayableAmt), "", bankAccountDetails, "PENDING");
            
            financeDetailsDAO.invoiceSave(entity);
            try {
                for(int i = 0; i < serviceCategory.length; i++) {
//                    if(serviceDetailsPk[i] != null) {
                        ServiceDetaiilsInvoice serviceDetails = null;
                        serviceDetails = new ServiceDetaiilsInvoice(Integer.parseInt(serviceDetailsPk[i]),orgId, userId, invoiceNo, "Standard", serviceCategory[i], serviceDesc[i], Double.parseDouble(serviceChargeAmount[i]), 
                                Double.parseDouble(vatPercentage[i]),Double.parseDouble(vatServiceDetails[i]), Double.parseDouble(totalAmount[i]), newdate, sqlTimestamp);

                        financeDetailsDAO.serviceDetailsSave(serviceDetails);
//                    }
                }
            } catch(Exception ex) {
                ex.printStackTrace();
            }
            
            modelMap.addAttribute("success", "true");
            modelMap.addAttribute("message", "Data Updated Successfully...");
        }
        
//        if(invoiceType == "Service" || invoiceType.equals("Service")) {
//            return new ModelAndView(new RedirectView("serviceInvoicesList.htm"), modelMap);
//        }
        

return new ModelAndView(new RedirectView("otherInvoicesList.htm"), modelMap);
    }
    
    @RequestMapping("/finance/rentInvoicesPDCList.htm")
    public ModelAndView rentInvoicesPDCList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
         HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
         ModelMap modelMap = new ModelMap();

        String SNo = request.getParameter("SNo");
          
        modelMap.addAttribute("rentInvoiceGeneralList", financeDetailsDAO.rentInvoiceGeneralList(userId, orgId, null));
        
        return new ModelAndView("../tenant/rentInvoicePDC", modelMap);
    }
    
    @RequestMapping("/finance/rentInvoicesGeneralList.htm")
    public ModelAndView rentInvoicesGeneralList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
         HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
         ModelMap modelMap = new ModelMap();

        String SNo = request.getParameter("SNo");
          
        modelMap.addAttribute("rentInvoiceGeneralList", financeDetailsDAO.rentInvoiceGeneralList(userId, orgId, null));
        
        return new ModelAndView("../tenant/rentInvoiceGeneral", modelMap);
    }
    
    @RequestMapping("/finance/serviceInvoicesList.htm")
    public ModelAndView serviceInvoicesList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
         HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
         ModelMap modelMap = new ModelMap();

        String SNo = request.getParameter("SNo");
          
        modelMap.addAttribute("serviceInvoicesList", financeDetailsDAO.invoiceList(userId, orgId, null));
        
        return new ModelAndView("../tenant/serviceInvoices", modelMap);
    }
    
    @RequestMapping("/finance/otherInvoicesList.htm")
    public ModelAndView otherInvoicesList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
         HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
         ModelMap modelMap = new ModelMap();

        String SNo = request.getParameter("SNo");
          
        modelMap.addAttribute("otherInvoicesList", financeDetailsDAO.otherInvoicesList(userId, orgId, null));
        
        return new ModelAndView("../tenant/otherInvoices", modelMap);
    }
    
    @RequestMapping("/finance/selectPropertyDetailsInInvoice.htm")
    public ModelAndView selectPropertyDetailsInInvoice(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        
        modelMap.addAttribute("assetDetails", assetDAO.subRentQuotetDetailslist(null));
        return new ModelAndView("SelectPropertyDetailsInInvoice", modelMap);
    }
    
    @RequestMapping("/finance/selectPropertyDetailsInRentInvoice.htm")
    public ModelAndView selectPropertyDetailsInRentInvoice(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        
        modelMap.addAttribute("assetDetails", assetDAO.subRentQuotetDetailslist(null));
        return new ModelAndView("SelectPropertyDetailsInRentInvoice", modelMap);
    }
    
    @RequestMapping("/finance/rentInvoiceFormSubmit.htm")
    public ModelAndView rentInvoiceFormSub(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
    
        String invoiceNo  = request.getParameter("invoiceNo");
        String invoiceType  = request.getParameter("invoiceType");
        String description  = request.getParameter("description");
        String taxCode  = request.getParameter("taxCode");

        //TenentDetails
        String propertyName  = request.getParameter("propertyName");
        String servcieAreaDescription  = request.getParameter("servcieAreaDescription");
        String customerName  = request.getParameter("customerName");
        String dueDate  = request.getParameter("dueDate");
        String fromDate  = request.getParameter("fromDate");
        String toPeriod  = request.getParameter("toPeriod");

        //AdditionalDetails
        String bankAccountDetails  = request.getParameter("bankAccountDetails");
        String paymentTerms  = request.getParameter("paymentTerms");
        String contractTerms  = request.getParameter("contractTerms");
        String discount  = request.getParameter("discount");
        String amountPaid  = request.getParameter("amountPaid");
        String subtotal  = request.getParameter("subtotal");
        String vat  = request.getParameter("vat");
        String discountedAmount  = request.getParameter("discountedAmount");
        String totalPayableAmt  = request.getParameter("totalPayableAmt");
        String balance  = request.getParameter("balance");

        String invoice  = request.getParameter("invoice");
        String createdDate  = request.getParameter("createdDate");
        String status  = request.getParameter("status");
        
        String SNo = request.getParameter("SNo");
        
        //ServiceDetails
        String serviceCategory[]  = request.getParameterValues("serviceCategory");
        String serviceDesc[]  = request.getParameterValues("status");
        String serviceChargeAmount[]  = request.getParameterValues("status");
        String vatPercentage[]  = request.getParameterValues("status");
        String vatServiceDetails[]  = request.getParameterValues("status");
        String totalAmount[]  = request.getParameterValues("status");
    
        String serviceDetailsPk[] = request.getParameterValues("serviceDetailsPk");
        
        String pdChequeNo = request.getParameter("bookID");
        String lpNo = request.getParameter("lpNo");
        String unitName = request.getParameter("unitName");
        String tenantName = request.getParameter("customerName");
        String frequency = request.getParameter("frequency");
        String nextIssueDate = request.getParameter("groupName");
        String invoiceRecurringType = request.getParameter("invoiceRecurringType");
        String recordStatus = request.getParameter("recordStatus");
        
        //RentDetails

        String rentDesc[] = request.getParameterValues("rentDesc");
        String rentAmt[] = request.getParameterValues("rentAmt");
        String vatPercentageInRentEntity[] = request.getParameterValues("vatPercentageInRentEntity");
        String vatAmt[] = request.getParameterValues("itemvattotal");
        String totalAmt[] = request.getParameterValues("totalAmt");
    
        String rentDetailsPk[] = request.getParameterValues("rentDetailsPk");
        
        if(status == null) {
            status = "update0";
        }
        Date dueDate1 = null;
        try {
                if (!"".equals(dueDate) &&  dueDate!= null) {
                     dueDate1 = (Date) f.parse(dueDate);
                }
        } catch (NullPointerException ex) {
        }
        Date fromDate1 = null;
        try {
                if (!"".equals(fromDate) &&  fromDate!= null) {
                     dueDate1 = (Date) f.parse(fromDate);
                }
        } catch (NullPointerException ex) {
        }
        Date toPeriod1 = null;
        try {
                if (!"".equals(toPeriod) &&  toPeriod!= null) {
                     dueDate1 = (Date) f.parse(toPeriod);
                }
        } catch (NullPointerException ex) {
        }
        Date nextIssueDate1 = null;
        try {
                if (!"".equals(nextIssueDate) &&  nextIssueDate!= null) {
                     dueDate1 = (Date) f.parse(nextIssueDate);
                }
        } catch (NullPointerException ex) {
        }
       
        List<StandardInvoice> gridData = new ArrayList<StandardInvoice>();
        List<RentDetailsEntity1> serviceGridData = new ArrayList<RentDetailsEntity1>();

        if (SNo == null || SNo.equals("")) {

 /*           ReceivableInvoiceEntity entity = null;
            entity = new ReceivableInvoiceEntity(userId, orgId, invoiceNo, "Rent", invoiceType, description, taxCode, pdChequeNo, lpNo, unitName, tenantName, 
                    date, propertyName, servcieAreaDescription, customerName, date, date, false, Double.parseDouble(discount), Double.parseDouble(amountPaid), paymentTerms, 
                    contractTerms, newdate, true, frequency, 
                    newdate, "", Double.parseDouble(subtotal), Double.parseDouble(balance), Double.parseDouble(vat), Double.parseDouble(totalPayableAmt), "", bankAccountDetails);
            
            financeDetailsDAO.newInvoiceSave(entity);  */
            StandardInvoice entity = null;
            entity = new StandardInvoice(userId, orgId, invoiceNo, "Rent", invoiceType, description, taxCode, pdChequeNo, lpNo, unitName, tenantName, 
                    dueDate1, propertyName, servcieAreaDescription, customerName, fromDate1, toPeriod1, false, Double.parseDouble(discount), Double.parseDouble(amountPaid), paymentTerms, 
                    contractTerms, newdate, "active", frequency, 
                    nextIssueDate1, "", Double.parseDouble(subtotal), Double.parseDouble(balance), Double.parseDouble(vat), Double.parseDouble(totalPayableAmt), "", bankAccountDetails, "PENDING");
            
            financeDetailsDAO.invoiceSave(entity);
            
            try {
                for(int i = 0; i < rentDesc.length; i++) {
//                    if(serviceDetailsPk[i] == null) {
//                            ServiceDetaiilsInvoice serviceDetails = null;
//                        serviceDetails = new ServiceDetaiilsInvoice(orgId, userId, invoiceNo, "Service", serviceCategory[i], serviceDesc[i], Double.parseDouble(serviceChargeAmount[i]), 
//                                Double.parseDouble(vatPercentage[i]),Double.parseDouble(vatServiceDetails[i]), Double.parseDouble(totalAmount[i]), newdate, sqlTimestamp);
//
//                        financeDetailsDAO.serviceDetailsSave(serviceDetails);
                        RentDetailsEntity1 rentEntity = null;
                        rentEntity = new RentDetailsEntity1("", rentDesc[i], Double.parseDouble(rentAmt[i]), Double.parseDouble("0"), Double.parseDouble(vatAmt[i]), 
                                Double.parseDouble(totalAmt[i]), newdate, true, invoiceNo, "Rent");  //vatPercentage[i]
                        
                        financeDetailsDAO.rentDetailsEntitySave(rentEntity);
//                    }
                } 
            } catch(Exception ex) {
                ex.printStackTrace();
            }
            modelMap.addAttribute("success", "true");
            modelMap.addAttribute("message", "Data Saved Successfully...");

        } else {

 /*           ReceivableInvoiceEntity entity = null;
            entity = new ReceivableInvoiceEntity(Integer.parseInt(SNo), userId, orgId, invoiceNo, "Rent", invoiceType, description, taxCode, pdChequeNo, lpNo, unitName, tenantName, 
                    date, propertyName, servcieAreaDescription, customerName, date, date, false, Double.parseDouble(discount), Double.parseDouble(amountPaid), paymentTerms, 
                    contractTerms, newdate, true, frequency, 
                    newdate, "", Double.parseDouble(subtotal), Double.parseDouble(balance), Double.parseDouble(vat), Double.parseDouble(totalPayableAmt), "", bankAccountDetails);
            
            financeDetailsDAO.newInvoiceSave(entity);  */
            StandardInvoice entity = null;
            entity = new StandardInvoice(Integer.parseInt(SNo), userId, orgId, invoiceNo, "Rent", invoiceType, description, taxCode, pdChequeNo, lpNo, unitName, tenantName, 
                    dueDate1, propertyName, "", customerName, date, date, false, Double.parseDouble(discount), Double.parseDouble(amountPaid), paymentTerms, 
                    contractTerms, newdate, "active", frequency, 
                    newdate, "", Double.parseDouble(subtotal), Double.parseDouble(balance), Double.parseDouble("0"), Double.parseDouble(totalPayableAmt), "", bankAccountDetails, "PENDING");
            
            financeDetailsDAO.invoiceSave(entity);
            try {
                for(int i = 0; i < rentDesc.length; i++) {
//                    if(serviceDetailsPk[i] != null) {
//                        ServiceDetaiilsInvoice serviceDetails = null;
//                        serviceDetails = new ServiceDetaiilsInvoice(Integer.parseInt(serviceDetailsPk[i]),orgId, userId, invoiceNo, "Service", serviceCategory[i], serviceDesc[i], Double.parseDouble(serviceChargeAmount[i]), 
//                                Double.parseDouble(vatPercentage[i]),Double.parseDouble(vatServiceDetails[i]), Double.parseDouble(totalAmount[i]), newdate, sqlTimestamp);
//
//                        financeDetailsDAO.serviceDetailsSave(serviceDetails);
//                    }
                      RentDetailsEntity1 rentEntity = null;
                        rentEntity = new RentDetailsEntity1(Integer.parseInt(rentDetailsPk[i]),"", rentDesc[i], Double.parseDouble(rentAmt[i]), Double.parseDouble(vatPercentage[i]), Double.parseDouble(vatAmt[i]), 
                                Double.parseDouble(totalAmt[i]), newdate, true, invoiceNo, "Rent");
                        
                        financeDetailsDAO.rentDetailsEntitySave(rentEntity);
                }
            } catch(Exception ex) {
                ex.printStackTrace();
            }
            
            modelMap.addAttribute("success", "true");
            modelMap.addAttribute("message", "Data Updated Successfully...");
        }
        
         return new ModelAndView(new RedirectView("rentInvoicesPDCList.htm"), modelMap);
    }
    
    //@RequestMapping("/finance/rentInvoiceFormSubmit.htm")
    public ModelAndView rentInvoiceFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
    
        String invoiceNo  = request.getParameter("invoiceNo");
        String invoiceType  = request.getParameter("invoiceType");
        String description  = request.getParameter("description");
        String taxCode  = request.getParameter("taxCode");

        //TenentDetails
        String propertyName  = request.getParameter("propertyName");
        String servcieAreaDescription  = request.getParameter("servcieAreaDescription");
        String customerName  = request.getParameter("customerName");
        String dueDate  = request.getParameter("dueDate");
        String fromDate  = request.getParameter("fromDate");
        String toPeriod  = request.getParameter("toPeriod");

        //AdditionalDetails
        String bankAccountDetails  = request.getParameter("bankAccountDetails");
        String paymentTerms  = request.getParameter("paymentTerms");
        String contractTerms  = request.getParameter("contractTerms");
        String discount  = request.getParameter("discount");
        String amountPaid  = request.getParameter("amountPaid");
        String subtotal  = request.getParameter("subtotal");
        String vat  = request.getParameter("vat");
        String discountedAmount  = request.getParameter("discountedAmount");
        String totalPayableAmt  = request.getParameter("totalPayableAmt");
        String balance  = request.getParameter("balance");

        String invoice  = request.getParameter("invoice");
        String createdDate  = request.getParameter("createdDate");
        String status  = request.getParameter("status");
        
        String SNo = request.getParameter("SNo");
        
        //ServiceDetails
        String serviceCategory[]  = request.getParameterValues("serviceCategory");
        String serviceDesc[]  = request.getParameterValues("status");
        String serviceChargeAmount[]  = request.getParameterValues("status");
        String vatPercentage[]  = request.getParameterValues("status");
        String vatServiceDetails[]  = request.getParameterValues("status");
        String totalAmount[]  = request.getParameterValues("status");
    
        String serviceDetailsPk[] = request.getParameterValues("serviceDetailsPk");
        
        String pdChequeNo = request.getParameter("pdChequeNo");
        String lpNo = request.getParameter("lpNo");
        String unitName = request.getParameter("unitName");
        String tenantName = request.getParameter("customerName");
        String frequency = request.getParameter("frequency");
        String nextIssueDate = request.getParameter("nextIssueDate");
        String invoiceRecurringType = request.getParameter("invoiceRecurringType");
        String recordStatus = request.getParameter("recordStatus");
        
        //RentDetails

        String rentDesc[] = request.getParameterValues("rentDesc");
        String rentAmt[] = request.getParameterValues("rentAmt");
        String vatPercentageInRentEntity[] = request.getParameterValues("vatPercentageInRentEntity");
        String vatAmt[] = request.getParameterValues("vatAmt");
        String totalAmt[] = request.getParameterValues("totalAmt");
    
        String rentDetailsPk[] = request.getParameterValues("rentDetailsPk");
        
        if(status == null) {
            status = "update0";
        }
        Date dueDate1 = null;
        try {
                if (!"".equals(dueDate) &&  dueDate!= null) {
                     dueDate1 = (Date) f.parse(dueDate);
                }
        } catch (NullPointerException ex) {
        }
        Date fromDate1 = null;
        try {
                if (!"".equals(fromDate) &&  fromDate!= null) {
                     dueDate1 = (Date) f.parse(fromDate);
                }
        } catch (NullPointerException ex) {
        }
        Date toPeriod1 = null;
        try {
                if (!"".equals(toPeriod) &&  toPeriod!= null) {
                     dueDate1 = (Date) f.parse(toPeriod);
                }
        } catch (NullPointerException ex) {
        }
        Date nextIssueDate1 = null;
        try {
                if (!"".equals(nextIssueDate) &&  nextIssueDate!= null) {
                     dueDate1 = (Date) f.parse(nextIssueDate);
                }
        } catch (NullPointerException ex) {
        }
       
        List<ServiceDetaiilsInvoice> serviceGridData = new ArrayList<ServiceDetaiilsInvoice>();

        if (SNo == null || SNo.equals("")) {

 /*           ReceivableInvoiceEntity entity = null;
            entity = new ReceivableInvoiceEntity(userId, orgId, invoiceNo, "Rent", invoiceType, description, taxCode, pdChequeNo, lpNo, unitName, tenantName, 
                    date, propertyName, servcieAreaDescription, customerName, date, date, false, Double.parseDouble(discount), Double.parseDouble(amountPaid), paymentTerms, 
                    contractTerms, newdate, true, frequency, 
                    newdate, "", Double.parseDouble(subtotal), Double.parseDouble(balance), Double.parseDouble(vat), Double.parseDouble(totalPayableAmt), "", bankAccountDetails);
              */
            ReceivableInvoice invoice1 = null;
            if( invoice == "Standard" || invoice.equals("Standard")) {
                invoice1 = new ReceivableInvoice(invoiceNo, invoiceType, "Standard", description, taxCode, pdChequeNo, lpNo, unitName, tenantName, dueDate1, propertyName, 
                    servcieAreaDescription, unitName, fromDate1, date, false, Double.parseDouble(discount), Double.parseDouble(amountPaid), paymentTerms, contractTerms, null, null, "PENDING", "SAVE");
            } else {
                invoice1 = new ReceivableInvoice(invoiceNo, invoiceType, "Rent", description, taxCode, pdChequeNo, lpNo, unitName, tenantName, dueDate1, propertyName, 
                    servcieAreaDescription, unitName, fromDate1, date, false, Double.parseDouble(discount), Double.parseDouble(amountPaid), paymentTerms, contractTerms, null, null, "PENDING", 
                        "SAVE");
            }     
            
            HttpHeaders headers = new HttpHeaders();
            //headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
            //headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
            HttpEntity<ReceivableInvoice> entity = new HttpEntity<>(invoice1, headers);
            String url = hostUrl + invoiceURl + "/invoice/save";
            try {
              //  restTemplate.exchange(url, HttpMethod.POST, entity, String.class).getBody();
            } catch(Exception ex) {
                ex.printStackTrace();
            }
            
//            try {
//                for(int i = 0; i < rentDesc.length; i++) {
////                    if(serviceDetailsPk[i] == null) {
////                            ServiceDetaiilsInvoice serviceDetails = null;
////                        serviceDetails = new ServiceDetaiilsInvoice(orgId, userId, invoiceNo, "Service", serviceCategory[i], serviceDesc[i], Double.parseDouble(serviceChargeAmount[i]), 
////                                Double.parseDouble(vatPercentage[i]),Double.parseDouble(vatServiceDetails[i]), Double.parseDouble(totalAmount[i]), newdate, sqlTimestamp);
////
////                        financeDetailsDAO.serviceDetailsSave(serviceDetails);
//                        RentDetailsEntity rentEntity = null;
//                        rentEntity = new RentDetailsEntity("", rentDesc[i], Double.parseDouble(rentAmt[i]), Double.parseDouble("0"), Double.parseDouble(vatAmt[i]), 
//                                Double.parseDouble(totalAmt[i]), newdate, true, invoiceNo, "Rent");  //vatPercentage[i]
//                        
//                        financeDetailsDAO.rentDetailsEntitySave(rentEntity);
////                    }
//                }
//            } catch(Exception ex) {
//                ex.printStackTrace();
//            }
            modelMap.addAttribute("success", "true");
            modelMap.addAttribute("message", "Data Saved Successfully...");

        } 
        
         return new ModelAndView(new RedirectView("rentInvoicesPDCList.htm"), modelMap);
    }
    
    //RentPosting
    @RequestMapping("/finance/rentPosting.htm")
    public ModelAndView rentPosting(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        
        String SNo = req.getParameter("SNo");
        
        financeDetailsDAO.updateInvoiceStatus(userId, "Booked Invoice", SNo);
        return new ModelAndView(new RedirectView("bookedInvoicesList.htm"), modelMap);
    }
    
    //@RequestMapping("/finance/ledgerFormSubmit.htm")
    public ModelAndView ledgerFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
    
        String status = request.getParameter("status");
        String ledgerNo = request.getParameter("ledgerNo");
        String ledgerCode = request.getParameter("ledgerCode");
        String ledgerDescription = request.getParameter("ledgerDescription");
        String ledgerGroup = request.getParameter("ledgerGroup");
        String ledgerName = request.getParameter("ledgerName");
        String bankAccountNo = request.getParameter("bankAccountNo");
        String ledgerOpeningBalance = request.getParameter("ledgerOpeningBalance");
        String ledgerReportGroup = request.getParameter("ledgerReportGroup");
        String ledgerSubgroup = request.getParameter("ledgerSubgroup");
        String creationDate = request.getParameter("creationDate");
        String bankAccountName = request.getParameter("bankAccountName");
        String shop  = request.getParameter("shop");
        String costCenter = request.getParameter("costCenter");
        
        String ledgerMasterPk = request.getParameter("ledgerMasterPk");
        if(status == null) {
            status = "true";
        }
        Date creationDate1 = null;
//        try {
//                if (!"".equals(creationDate) &&  creationDate!= null) {
//                     creationDate1 = (Date) f.parse(creationDate);
//                }
//        } catch (NullPointerException ex) {
//        }
        
       
        if (ledgerMasterPk == null || ledgerMasterPk.equals("")) {
            
            LedgerMaster ledger = null;
            ledger = new LedgerMaster(ledgerNo, ledgerCode, ledgerDescription, ledgerGroup, ledgerName, bankAccountNo, 0.0, 0.0, ledgerReportGroup, ledgerSubgroup);
            HttpHeaders headers = new HttpHeaders();
            //headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
            HttpEntity<LedgerMaster> entity = new HttpEntity<>(ledger, headers);
            String url = hostUrl + ledgerUrl + "/save";
            try {
               // restTemplate.exchange(url, HttpMethod.POST, entity, String.class).getBody();
            } catch(Exception ex) {
                ex.printStackTrace();
            }
           
            modelMap.addAttribute("success", "true");
            modelMap.addAttribute("message", "Data Saved Successfully...");

        }
        
         return new ModelAndView(new RedirectView("ledgerList.htm"), modelMap);
    }
    
    //ProcessInvoice
    @RequestMapping("/finance/processInvoice.htm")
    public ModelAndView processInvoice(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        
        String SNo = req.getParameter("SNo");
        
        financeDetailsDAO.updateInvoiceStatus(userId, "Processed Invoice", SNo);
        return new ModelAndView(new RedirectView("processedInvoicesList.htm"), modelMap);
    }
    
    //CancelInvoice
    @RequestMapping("/finance/cancelInvoice.htm")
    public ModelAndView cancelInvoice(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        
        String SNo = req.getParameter("SNo");
        
        financeDetailsDAO.updateInvoiceStatus(userId, "Cancelled Invoice", SNo);
        return new ModelAndView(new RedirectView("cancelledInvoicesList.htm"), modelMap);
    }
    
    //BookedInvoicesList
    @RequestMapping("/finance/bookedInvoicesList.htm")
    public ModelAndView bookedInvoicesList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
         HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
         ModelMap modelMap = new ModelMap();

        String SNo = request.getParameter("SNo");
          
        modelMap.addAttribute("bookedInvoicesList", financeDetailsDAO.transactionInvoicesList(userId, "Booked Invoice", null));
        
        return new ModelAndView("../tenant/bookedInvoices", modelMap);
    }
       
    //ProcessInvoiceList
    @RequestMapping("/finance/processedInvoicesList.htm")
    public ModelAndView processedInvoicesList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
         HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
         ModelMap modelMap = new ModelMap();

        String SNo = request.getParameter("SNo");
          
        modelMap.addAttribute("processedInvoicesList", financeDetailsDAO.transactionInvoicesList(userId, "Processed Invoice", null));
        
        return new ModelAndView("../tenant/processedInvoiceList", modelMap);
    }
    
    //CancelledInvoices
    @RequestMapping("/finance/cancelledInvoicesList.htm")
    public ModelAndView cancelledInvoicesList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
         HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
         ModelMap modelMap = new ModelMap();

        String SNo = request.getParameter("SNo");
          
        modelMap.addAttribute("cancelledInvoicesList", financeDetailsDAO.transactionInvoicesList(userId, "Cancelled Invoice", null));
        
        return new ModelAndView("../tenant/cancelledInvoices", modelMap);
    }
    
    //AgingInvoices
    @RequestMapping("/finance/agingInvoicesList.htm")
    public ModelAndView agingInvoicesList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
         HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
         ModelMap modelMap = new ModelMap();

        String SNo = request.getParameter("SNo");
          
        modelMap.addAttribute("agingInvoicesList", financeDetailsDAO.agingInvoicesList(userId, null));
        
        return new ModelAndView("../tenant/agingInvoices", modelMap);
    }
    
    @RequestMapping("/finance/bulkConfirmPosting.htm")
    public ModelAndView bulkConfirmPosting(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
         HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
         ModelMap modelMap = new ModelMap();

        String SNo = request.getParameter("SNo");
        String selectedvalues[] = request.getParameterValues("selectedvalues");
          
        //modelMap.addAttribute("cancelledInvoicesList", financeDetailsDAO.transactionInvoicesList(userId, "Cancelled Invoice", null));
//        String [] result=selectedvalues.split("-");
        
        for(int i = 0; i < selectedvalues.length; i++) {
            System.out.println("result:"+selectedvalues[i]);
            financeDetailsDAO.updateInvoiceStatus(userId, "Booked Invoice", selectedvalues[i]);
        }
        
        return new ModelAndView(new RedirectView("bookedInvoicesList.htm"), modelMap);
    }
    
    @RequestMapping("/finance/processedInvoiceForm.htm")
    public ModelAndView processedInvoiceForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(false);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String SNo = request.getParameter("SNo");
       
        if (SNo != null) {
              modelMap.addAttribute("invoiceList", financeDetailsDAO.invoiceList(userId, orgId, SNo));
        }
    
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));
        modelMap.addAttribute("recordStatus", request.getParameter("recordStatus"));
        
        return new ModelAndView("../tenant/processedInvoiceForm", modelMap);
    }
    
    @RequestMapping("/finance/processedInvoiceFormSubmit.htm")
    public ModelAndView processedInvoiceFormSubmit(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        
        String SNo = req.getParameter("SNo");
        String paymentType = req.getParameter("paymentType");
        String transactionRefNo = req.getParameter("transactionRefNo");
        String paymentDate = req.getParameter("paymentDate");
        String amountPaid = req.getParameter("amountPaid");
        
        financeDetailsDAO.updatePaymentStatus(userId, paymentType, transactionRefNo, paymentDate, amountPaid, SNo);
        financeDetailsDAO.invoiceProcessingStatus(userId, "PROCESSED", SNo);
        return new ModelAndView(new RedirectView("processedInvoicesList.htm"), modelMap);
    }
    
    @RequestMapping("/finance/voucherInvoiceForm.htm")
    public ModelAndView voucherInvoiceForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(false);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String SNo = request.getParameter("SNo");
        
//        ArrayList enq = (ArrayList) financeDetailsDAO.voucherCodeInc(userId, orgId, null, null, "1");
//        
//        String orderNo=null;
//        String orderNo2 = null;
//        String[] orderNo1 = null;
//        int ordno = 1;
//        if (!(enq.isEmpty())) {
//            for (Iterator<VoucherMasterEntity> iter = enq.iterator(); iter.hasNext();) {
//                orderNo = iter.next().getVoucherId();
//            }
//            //orderNo1 = orderNo2.split("-");
//        }
//        if (orderNo != null) {
//            orderNo1 = orderNo.split("-");
//            ordno = Integer.parseInt(orderNo1[1]) + 1;
//        }
//        orderNo = "Voucher" + "-" + ordno;
//    
//        modelMap.addAttribute("orderNo", orderNo);
        if (SNo != null) {
              modelMap.addAttribute("invoiceList", financeDetailsDAO.invoiceList(userId, orgId, SNo));
        }
    
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));
        modelMap.addAttribute("recordStatus", request.getParameter("recordStatus"));
        
        return new ModelAndView("voucherForm", modelMap);
    }
    
    @RequestMapping("/finance/SelectLedgerInVoucherForm.htm")
    public ModelAndView SelectLedgerInVoucherForm(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        
        modelMap.addAttribute("ledgerDetails", financeDetailsDAO.ledgerList(userId, orgId, null));
        return new ModelAndView("SelectLedgerInVoucherForm", modelMap);
    }
    
    @RequestMapping("/finance/voucherFormSubmit.htm")
    public ModelAndView voucherFormSubmit(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        
        String voucherPk = req.getParameter("SNo");
        String voucherId = req.getParameter("voucherId");
        String invoiceId = req.getParameter("invoiceId");
        String ledgerNo = req.getParameter("ledgerNo");
        String typeOfVoucher = req.getParameter("typeOfVoucher");
        String voucherAccountStatus = req.getParameter("voucherAccountStatus");
        String voucherNarration = req.getParameter("voucherNarration");
        String voucherRemarks = req.getParameter("voucherRemarks");
        String creationDate = req.getParameter("creationDate");
        String activeStatus = req.getParameter("activeStatus");
        String cdate = req.getParameter("creationDate");
        String transationRefNumber = req.getParameter("transationRefNumber");
        String voucherAmt = req.getParameter("voucherAmt");
        String voucherAmtType = req.getParameter("voucherAmtType");
        String makeRecurring = req.getParameter("makeRecurring");
        String drcrType = req.getParameter("drcrType");

        String SNo = req.getParameter("SNo");
        
        if(SNo != null) {
            VoucherMasterEntity voucher = null;
            String generatedVoucherId;
            Double amountNew = Double.parseDouble(voucherAmt);
            if(drcrType.toLowerCase() == "dr" || drcrType.equalsIgnoreCase("dr")) {
                amountNew = amountNew * -1;
            }
            
            if(voucherAmtType == "PDC" || voucherAmtType.equals("PDC")) {
                if(makeRecurring == "Yes" || makeRecurring.equals("Yes")) {
                    for(int i = 0; i < 12; i++) {
                        Random rnd = new Random(System.currentTimeMillis());
			String trackid = String.valueOf(Math.abs(rnd.nextInt()));
                        generatedVoucherId = IdGenerator.gerenateId(ledgerNo, formatedTimeStamp(new Date()));
                        voucher = new VoucherMasterEntity(trackid, invoiceId, ledgerNo, typeOfVoucher, voucherAccountStatus, voucherNarration, voucherRemarks, new Date(), true, cdate, 
                        transationRefNumber, amountNew, voucherAmtType.toLowerCase(), makeRecurring, drcrType.toLowerCase());
                        financeDetailsDAO.voucherMasterEntitySave(voucher);
                        financeDetailsDAO.ledgerVoucherProcessingStatus(userId, "PROCESSED", SNo);
                    }
                } else {
                    Random rnd = new Random(System.currentTimeMillis());
                    String trackid = String.valueOf(Math.abs(rnd.nextInt()));
                    generatedVoucherId = IdGenerator.gerenateId(ledgerNo, formatedTimeStamp(new Date()));
                    voucher = new VoucherMasterEntity(trackid, invoiceId, ledgerNo, typeOfVoucher, voucherAccountStatus, voucherNarration, voucherRemarks, new Date(), true, cdate, 
                        transationRefNumber, amountNew, voucherAmtType.toLowerCase(), makeRecurring, drcrType.toLowerCase());
                    financeDetailsDAO.voucherMasterEntitySave(voucher);
                    financeDetailsDAO.ledgerVoucherProcessingStatus(userId, "PROCESSED", SNo);
                }
            } else {
                Random rnd = new Random(System.currentTimeMillis());
		String trackid = String.valueOf(Math.abs(rnd.nextInt()));
                generatedVoucherId = IdGenerator.gerenateId(ledgerNo, formatedTimeStamp(new Date()));
                voucher = new VoucherMasterEntity(trackid, invoiceId, ledgerNo, typeOfVoucher, voucherAccountStatus, voucherNarration, voucherRemarks, new Date(), true, cdate, 
                    transationRefNumber, amountNew, voucherAmtType.toLowerCase(), makeRecurring, drcrType.toLowerCase());
                financeDetailsDAO.voucherMasterEntitySave(voucher);
                financeDetailsDAO.ledgerVoucherProcessingStatus(userId, "PROCESSED", SNo);
            }
            
        }
     //   return new ModelAndView(new RedirectView("processedInvoicesList.htm"), modelMap);
        return new ModelAndView(new RedirectView("voucherList.htm"), modelMap);
    }
    
    @RequestMapping("/finance/rentInvoiceFormView.htm")
    public ModelAndView rentInvoiceFormView(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(false);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String SNo = request.getParameter("SNo");
        
        ArrayList enq = (ArrayList) financeDetailsDAO.voucherCodeInc(userId, orgId, null, null, "1");
        
        if (SNo != null) {
              modelMap.addAttribute("invoiceList", financeDetailsDAO.invoiceList(userId, orgId, SNo));
        }
    
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));
        modelMap.addAttribute("recordStatus", request.getParameter("recordStatus"));
        
        return new ModelAndView("../tenant/rentInvoiceFormView", modelMap);
    }
            
    @RequestMapping("/finance/rentInvoiceFormEdit.htm")
    public ModelAndView rentInvoiceFormEdit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(false);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String SNo = request.getParameter("SNo");
        
        ArrayList enq = (ArrayList) financeDetailsDAO.voucherCodeInc(userId, orgId, null, null, "1");
        
        if (SNo != null) {
              modelMap.addAttribute("invoiceList", financeDetailsDAO.invoiceList(userId, orgId, SNo));
        }
    
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));
        modelMap.addAttribute("recordStatus", request.getParameter("recordStatus"));
        
        return new ModelAndView("../tenant/rentInvoiceFormEdit", modelMap);
    }
    
    @RequestMapping("/finance/standardInvoiceFormView.htm")
    public ModelAndView standardInvoiceFormView(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(false);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String SNo = request.getParameter("SNo");
        
        ArrayList enq = (ArrayList) financeDetailsDAO.voucherCodeInc(userId, orgId, null, null, "1");
        
        if (SNo != null) {
              modelMap.addAttribute("invoiceList", financeDetailsDAO.invoiceList(userId, orgId, SNo));
        }
    
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));
        modelMap.addAttribute("recordStatus", request.getParameter("recordStatus"));
        
        return new ModelAndView("../tenant/standardInvoiceFormView", modelMap);
    }
    
    @RequestMapping("/finance/standardInvoiceFormEdit.htm")
    public ModelAndView standardInvoiceFormEdit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(false);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String SNo = request.getParameter("SNo");
        
        ArrayList enq = (ArrayList) financeDetailsDAO.voucherCodeInc(userId, orgId, null, null, "1");
        
        if (SNo != null) {
              modelMap.addAttribute("invoiceList", financeDetailsDAO.invoiceList(userId, orgId, SNo));
        }
    
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));
        modelMap.addAttribute("recordStatus", request.getParameter("recordStatus"));
        
        return new ModelAndView("../tenant/standardInvoiceFormEdit", modelMap);
    }
    
    @RequestMapping("/finance/ledgerFormView.htm")
    public ModelAndView ledgerFormView(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(false);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String SNo = request.getParameter("SNo");
        
        if (SNo != null) {
              modelMap.addAttribute("ledgerList", financeDetailsDAO.ledgerList(userId, orgId, SNo));
        }
    
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));
        modelMap.addAttribute("recordStatus", request.getParameter("recordStatus"));
        
        return new ModelAndView("ledgerFormView", modelMap);
    }
    
    @RequestMapping("/finance/ledgerFormEdit.htm")
    public ModelAndView ledgerFormEdit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(false);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String SNo = request.getParameter("SNo");
        
        if (SNo != null) {
              modelMap.addAttribute("ledgerList", financeDetailsDAO.ledgerList(userId, orgId, SNo));
        }
    
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));
        modelMap.addAttribute("recordStatus", request.getParameter("recordStatus"));
        
        return new ModelAndView("ledgerFormEdit", modelMap);
    }
    
    @RequestMapping("/finance/voucherList.htm")
    public ModelAndView voucherList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
         HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
         ModelMap modelMap = new ModelMap();

        String SNo = request.getParameter("SNo");
          
        modelMap.addAttribute("dfhfhfh", financeDetailsDAO.voucherList(userId, orgId, null));
        return new ModelAndView("testVocuher", modelMap);
    }
    
    //@RequestMapping("/finance/voucherFormSubmit.htm")
    public ModelAndView voucherFormSubmit1(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        
        String voucherPk = req.getParameter("SNo");
        String voucherId = req.getParameter("voucherId");
        String invoiceId = req.getParameter("invoiceId");
        String ledgerNo = req.getParameter("ledgerNo");
        String typeOfVoucher = req.getParameter("typeOfVoucher");
        String voucherAccountStatus = req.getParameter("voucherAccountStatus");
        String voucherNarration = req.getParameter("voucherNarration");
        String voucherRemarks = req.getParameter("voucherRemarks");
        String creationDate = req.getParameter("creationDate");
        String activeStatus = req.getParameter("activeStatus");
        String cdate = req.getParameter("creationDate");
        String transationRefNumber = req.getParameter("transationRefNumber");
        String voucherAmt = req.getParameter("voucherAmt");
        String voucherAmtType = req.getParameter("voucherAmtType");
        //String makeRecurring = req.getParameter("makeRecurring");
        
        String SNo = req.getParameter("SNo");
        
        if(SNo != null) {
            VoucherMaster voucher = null;
//            voucher = new VoucherMaster(voucherId, invoiceId, ledgerNo, Double.parseDouble(voucherAmt), voucherAmtType, typeOfVoucher, voucherAccountStatus, 
//                    voucherNarration, voucherRemarks, newdate, true);
               voucher = new VoucherMaster(voucherId, invoiceId, ledgerNo, Double.parseDouble(voucherAmt), voucherAmtType, typeOfVoucher, voucherAccountStatus, voucherNarration, voucherRemarks);
            
            HttpHeaders headers = new HttpHeaders();
            //headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
            HttpEntity<VoucherMaster> entity = new HttpEntity<>(voucher, headers);
            String url = hostUrl + voucherUrl + "/save";
            try {
              //  restTemplate.exchange(url, HttpMethod.POST, entity, String.class).getBody();
            } catch(Exception ex) {
                ex.printStackTrace();
            }
        }
        return new ModelAndView(new RedirectView("voucherList.htm"), modelMap);
    }
} 
