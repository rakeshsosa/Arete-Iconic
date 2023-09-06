/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.mail.MessagingException;
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
import tenant.classes.ItemMaster;
import tenant.classes.MaterialIssue;
import tenant.classes.ServiceRequest;
import tenant.classes.UserRegistration;
import tenant.dao.MasterDAO;
import tenant.dao.ServiceRequestDAO;
import tenant.dao.TenantDetailsDAO;
import tenant.dao.UserDAO;
//import org.xhtmlrenderer.pdf.ITextRenderer;
/**
 *
 * @author vamsi
 */
@Controller
public class ServiceRequestController extends MultiActionController {

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
    private UserDAO userDAO;
    @Autowired
    private TenantDetailsDAO tenantDetailsDAO;
    @Autowired
    private ServiceRequestDAO serviceRequestDAO;
//---------------------Service request list-------------------------//

     @RequestMapping("/serviceReq/serviceRequestList.htm")
    public ModelAndView serviceRequestList(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Service Request";
        String submoduleName = "Service Request";
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        String sno = request.getParameter("pk");
        if (fromDate == null || toDate == null) {
            map.addAttribute("RequestList", serviceRequestDAO.serviceList(sno, "ServiceRequest"));
        } else {
            map.addAttribute("RequestList", serviceRequestDAO.serviceList1(sno, "ServiceRequest", fromDate, toDate));
        }
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../serviceReq/serviceRequestList", map);
    }
    
    //Testing
//---------------------Service request form---------------------------//

    @RequestMapping("/serviceReq/serviceRequestForm.htm")
    public ModelAndView serviceRequestForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sno = request.getParameter("pk");
        String serviceRequestNo = request.getParameter("serviceRequestNo");
        String propertyName = request.getParameter("propertyName");
        String propertyNo = request.getParameter("propertyNo");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("RequestList", serviceRequestDAO.list(sno, "ServiceRequest"));
            modelMap.addAttribute("RequestListve", serviceRequestDAO.RequestListve(serviceRequestNo, sno));
            modelMap.addAttribute("inventory", serviceRequestDAO.inventory());
            modelMap.addAttribute("assetDetails", tenantDetailsDAO.assetDetails(propertyName));
            modelMap.addAttribute("subassDetails", tenantDetailsDAO.subassDetails(propertyName, propertyNo));
            modelMap.addAttribute("itemCode", serviceRequestDAO.itemCode());
            modelMap.addAttribute("itemCate", serviceRequestDAO.itemCate());
            modelMap.addAttribute("uom", serviceRequestDAO.uom());
        }
        String link = "../serviceReq/serviceRequestForm.htm";
        String tab = "Service Request";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../serviceReq/serviceRequestForm", modelMap);
    }
//---------------------select tenant details------------------//

    @RequestMapping("/serviceReq/selectTenant.htm")
    public ModelAndView selectTenant(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("selectTenant", serviceRequestDAO.selectTenant());
        return new ModelAndView("selectTenant", modelMap);
    }

    //---------------------select request details------------------//
    @RequestMapping("/serviceReq/selectRequest.htm")
    public ModelAndView selectRequest(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("selectRequest", serviceRequestDAO.selectRequest());
        return new ModelAndView("selectRequest", modelMap);
    }
//---------------------select item category---------------------------//

    @RequestMapping("/serviceReq/selectItCateg.htm")
    public ModelAndView selectItCateg(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("selectItCateg", serviceRequestDAO.selectItCateg());
        return new ModelAndView("selectItCateg", modelMap);
    }
//---------------------select item code---------------------------//

    @RequestMapping("/serviceReq/selectItemCode.htm")
    public ModelAndView selectItemCode(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String itemCate = req.getParameter("itemCate");
        modelMap.addAttribute("itemmaster", serviceRequestDAO.itemmaster(itemCate));
        modelMap.addAttribute("itemCate", itemCate);
        return new ModelAndView("selectItemCode", modelMap);
    }
//---------------------pagination for item popup---------------------------//

    @RequestMapping("/serviceReq/itemPaginationList.htm")
    public void itemPaginationList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("application/Json");
        PrintWriter out = res.getWriter();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String searchData = req.getParameter("sSearch");
        Integer displayLength = Integer.parseInt(req.getParameter("iDisplayLength"));
        Integer sEcho = Integer.parseInt(req.getParameter("sEcho"));
        Integer iDisplayStart = Integer.parseInt(req.getParameter("iDisplayStart"));
        List<ItemMaster> selectRawMateriallist = null;
        BigInteger selectRawMaterialListCount = null;
        String listPage = req.getParameter("listPage");
        String itemCate = req.getParameter("itemCate");
        Gson gson = new Gson();
        JsonObject jsonResponse = new JsonObject();
        if (searchData == null || searchData.isEmpty()) {
            selectRawMateriallist = serviceRequestDAO.selectRawMaterialList1(userId, orgId, null, searchData, iDisplayStart, displayLength, "desc", listPage, itemCate);
            selectRawMaterialListCount = serviceRequestDAO.selectRawMaterialListCount(userId, orgId, null, searchData, "desc", listPage, itemCate);
        } else {
            selectRawMateriallist = serviceRequestDAO.selectRawMaterialList1(userId, orgId, null, searchData, iDisplayStart, displayLength, "asc", listPage, itemCate);
            selectRawMaterialListCount = serviceRequestDAO.selectRawMaterialListCount(userId, orgId, null, searchData, "asc", listPage, itemCate);
        }
        jsonResponse.add("iDisplayLength", gson.toJsonTree(displayLength));
        jsonResponse.add("iTotalRecords", gson.toJsonTree(selectRawMaterialListCount));
        jsonResponse.add("iTotalDisplayRecords", gson.toJsonTree(selectRawMaterialListCount));
        jsonResponse.add("sEcho", gson.toJsonTree(sEcho));
        jsonResponse.add("iDisplayStart", gson.toJsonTree(iDisplayStart));
        jsonResponse.add("aaData", gson.toJsonTree(selectRawMateriallist));
        out.print(jsonResponse);
        out.flush();

    }
//---------------------service request form submit---------------------------//

    @RequestMapping("/serviceReq/serviceRequestFormSubmit.htm")
    public ModelAndView serviceRequestFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");
        String serviceRequestNo = request.getParameter("serviceRequestNo");
        String serviceRequestDate = request.getParameter("serviceRequestDate");
        String serviceRequesterName = request.getParameter("serviceRequesterName");
        String tenantUniqueNo = request.getParameter("tenantUniqueNo");
        String propertyName = request.getParameter("assetCode");
        String propertyNo = request.getParameter("subassetCode");
        String serviceRequested = request.getParameter("serviceRequested");
        String serviceRequestedCost = request.getParameter("serviceRequestedCost");
        String completedBy = request.getParameter("completedBy");
        String remarks = request.getParameter("remarks");
        String serviceCategory[] = request.getParameterValues("serviceCategory");
        String itemCode[] = request.getParameterValues("itemCode");
        String itemName[] = request.getParameterValues("itemName");
        String uom[] = request.getParameterValues("uom");
        String availQty[] = request.getParameterValues("availQty");
        String reqQty[] = request.getParameterValues("reqQty");
        String unitPrice[] = request.getParameterValues("unitPrice");
        String marginPrice[] = request.getParameterValues("marginPrice");
        String totalPrice[] = request.getParameterValues("totalPrice");
        String extra1 = request.getParameter("extra1");
        String extra2 = request.getParameter("extra2");
        String extra3 = request.getParameter("extra3");
        String extra4 = request.getParameter("extra4");
        String extra5 = request.getParameter("extra5");
        String sno[] = request.getParameterValues("sno");
        String status = request.getParameter("status");
        String totalAmount = request.getParameter("totalAmount");
        String creationDate = request.getParameter("creationDate");
        String sSavesnoedu = request.getParameter("sSavesnoedu");
        String eSno = request.getParameter("eSno");
        modelMap.addAttribute("action", request.getParameter("action"));
        String action = request.getParameter("action");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        List<ServiceRequest> gridData = new ArrayList<ServiceRequest>();
        if (serviceRequestNo == null || serviceRequestNo == "" || "".equals(serviceRequestNo)) {
            ArrayList validuser = (ArrayList) serviceRequestDAO.getSRNo(serviceRequestDate);
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
            serviceRequestNo = "SR" + "-" + ordno;
        }
        Date serviceRequestDate1 = null;
        if (!serviceRequestDate.equals("")) {
            serviceRequestDate1 = (Date) formatter.parse(serviceRequestDate);
        }
        Date completedBy1 = null;
        if (!completedBy.equals("")) {
            completedBy1 = (Date) formatter.parse(completedBy);
        }
        if (pk == null || pk == "" || pk.equals("")) {
            for (int i = 0; i < itemCode.length; i++) {
                ServiceRequest sr = new ServiceRequest(orgId, userId, serviceRequestNo, serviceRequestDate1, serviceRequesterName, tenantUniqueNo, serviceRequested, serviceRequestedCost, propertyName, propertyNo, completedBy1, serviceCategory[i], itemCode[i], itemName[i], uom[i], reqQty[i], unitPrice[i], marginPrice[i], totalPrice[i], totalAmount, remarks, "Service Requested", extra1, extra2, extra3, extra4, extra5, "update0", today, today);
                gridData.add(sr);
                serviceRequestDAO.servicesave(gridData);
            }
        } else {
            if (action != null && !action.isEmpty()) {
                if (action.equalsIgnoreCase("recheck")) {
                    String str[] = serviceRequestNo.split("-");
                    if (str.length > 2) {
                        int j = Integer.parseInt(str[3]);
                        j = j + 1;
                        serviceRequestNo = str[0] + "-" + str[1] + "-" + str[2] + "-" + j;
                    } else {
                        serviceRequestNo = serviceRequestNo + "-REV" + "-" + 1;
                    }
                }
            }
            for (int i = 0; i < itemCode.length; i++) {
                if (sSavesnoedu.trim().length() != 0) {
                    String out[] = sSavesnoedu.split("//");
                    for (int j = 0; j < out.length; j++) {
                        serviceRequestDAO.srGridDataDelete(Integer.parseInt(out[j]));
                    }
                }
                if (eSno != null) {
                    try {
                        ServiceRequest sr = new ServiceRequest(Integer.parseInt(sno[i]), orgId, userId, serviceRequestNo, serviceRequestDate1, serviceRequesterName, tenantUniqueNo, serviceRequested, serviceRequestedCost, propertyName, propertyNo, completedBy1, serviceCategory[i], itemCode[i], itemName[i], uom[i], reqQty[i], unitPrice[i], marginPrice[i], totalPrice[i], totalAmount, remarks, "Service Requested", extra1, extra2, extra3, extra4, extra5, status, today);
                        gridData.add(sr);
                        serviceRequestDAO.servicesave(gridData);
                    } catch (NullPointerException nl) {
                    } catch (ArrayIndexOutOfBoundsException ar) {
                        ServiceRequest sr = new ServiceRequest(orgId, userId, serviceRequestNo, serviceRequestDate1, serviceRequesterName, tenantUniqueNo, serviceRequested, serviceRequestedCost, propertyName, propertyNo, completedBy1, serviceCategory[i], itemCode[i], itemName[i], uom[i], reqQty[i], unitPrice[i], marginPrice[i], totalPrice[i], totalAmount, remarks, "Service Requested", extra1, extra2, extra3, extra4, extra5, "update0", today, today);
                        gridData.add(sr);
                        serviceRequestDAO.servicesave(gridData);
                    }
                } else {
                    ServiceRequest sr = new ServiceRequest(orgId, userId, serviceRequestNo, serviceRequestDate1, serviceRequesterName, tenantUniqueNo, serviceRequested, serviceRequestedCost, propertyName, propertyNo, completedBy1, serviceCategory[i], itemCode[i], itemName[i], uom[i], reqQty[i], unitPrice[i], marginPrice[i], totalPrice[i], totalAmount, remarks, "Service Requested", extra1, extra2, extra3, extra4, extra5, "update0", today, today);
                    gridData.add(sr);
                    serviceRequestDAO.servicesave(gridData);
                }
            }
        }
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
                List<ServiceRequest> td = serviceRequestDAO.tdList(userId, orgId, serviceRequestNo);
                StringBuilder emailId = new StringBuilder(email);
                if (td.size() > 0) {
                    int i = 1;
                    for (ServiceRequest tdlist : td) {

                        serviceRequestNo = tdlist.getServiceRequestNo();
                        tenantUniqueNo = tdlist.getTenantUniqueNo();
                        serviceRequested = tdlist.getServiceRequested();
                    }
                    emailId.append(",");
                    emailId.append(toEmail);
                    String[] sendEmail = emailId.toString().split(",");
                    subject = "Service Request: " + serviceRequestNo;
                    String filepath = request.getSession().getServletContext().getRealPath("common\\theme\\images\\logo1.png");
                    mailbody = "<html><body>Dear Sir/Madam,<br/><br/><br/>You need to give an approval for Service Request. Service Request No : " + serviceRequestNo + ", services requested for " + serviceRequested + ""
                            + " and Service requested by " + tenantUniqueNo + ". Please Approve this Tenant Details. <br/><br/>If approved ignore this mail. "
                            + "</body>"
                            + "<br/><br/>Thanks & Regards"
                            + "<br/>Al-Hashar Team.</html>";
                    ByteArrayOutputStream baos = new ByteArrayOutputStream();
                    baos.close();
                    cm.sendEmail(userEmail, password, sendEmail, subject, mailbody, baos, fileName);
                }
            }
        }
        modelMap.addAttribute("RequestList", serviceRequestDAO.list(pk, "ServiceRequest"));
        return new ModelAndView(new RedirectView("../serviceReq/serviceRequestList.htm"), modelMap);
    }
//---------------------service request recheck submit---------------------------//

    @RequestMapping("/serviceReq/srreCheckSubmit.htm")
    public ModelAndView srreCheckSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String srNo = request.getParameter("srNo");
        String recordstatus = request.getParameter("recordstatus");
        String appremarks = request.getParameter("appremarks");
        serviceRequestDAO.serviceRequestReject(srNo, recordstatus, appremarks);
        return new ModelAndView(new RedirectView("../serviceReq/serviceRequestList.htm"), map);
    }
//---------------------service request gfc rejected submit---------------------------//

    @RequestMapping("/serviceReq/serviceRequestAppFormReject.htm")
    public ModelAndView serviceRequestAppFormReject(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String srNo = request.getParameter("srNo");
        String recordstatus = request.getParameter("recordstatus");
        String appremarks = request.getParameter("appremarks");
        serviceRequestDAO.serviceRequestReject(srNo, recordstatus, appremarks);
        return new ModelAndView(new RedirectView("../serviceReq/serviceRejList.htm"), map);
    }
//---------------------service request cfo rejected submit---------------------------//

    @RequestMapping("/serviceReq/serviceRequestAppFormReject1.htm")
    public ModelAndView serviceRequestAppFormReject1(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String srNo = request.getParameter("srNo");
        String recordstatus = request.getParameter("recordstatus");
        String appremarks = request.getParameter("appremarks");
        serviceRequestDAO.serviceRequestReject1(srNo, recordstatus, appremarks);
        return new ModelAndView(new RedirectView("../serviceReq/serviceRejList.htm"), map);
    }
//---------------------service request rejected list---------------------------//

    @RequestMapping("/serviceReq/serviceRejList.htm")
    public ModelAndView serviceRejList(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Rejected Service";
        String submoduleName = "Service Request";
        String sno = request.getParameter("pk");
        map.addAttribute("serviceRejList", serviceRequestDAO.serviceRejList(sno, null));
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../serviceReq/serviceRejList", map);
    }
//---------------------service request rejected form---------------------------//

    @RequestMapping("/serviceReq/serviceRejForm.htm")
    public ModelAndView serviceRejForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sno = request.getParameter("pk");
        String serviceRequestNo = request.getParameter("serviceRequestNo");
        String propertyName = request.getParameter("propertyName");
        String propertyNo = request.getParameter("propertyNo");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("RequestList", serviceRequestDAO.list(sno, "ServiceRequest"));
            modelMap.addAttribute("RequestListve", serviceRequestDAO.RequestListve(serviceRequestNo, sno));
            modelMap.addAttribute("inventory", serviceRequestDAO.inventory());
            modelMap.addAttribute("assetDetails", tenantDetailsDAO.assetDetails(propertyName));
            modelMap.addAttribute("subassDetails", tenantDetailsDAO.subassDetails(propertyName, propertyNo));
            modelMap.addAttribute("itemCode", serviceRequestDAO.itemCode());
            modelMap.addAttribute("itemCate", serviceRequestDAO.itemCate());
            modelMap.addAttribute("uom", serviceRequestDAO.uom());
        }
        String link = "../serviceReq/serviceRequestForm.htm";
        String tab = "Service Request";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../serviceReq/serviceRejForm", modelMap);
    }
//---------------------service request Approval 1 list---------------------------//

    @RequestMapping("/serviceReq/serviceRequestAppList.htm")
    public ModelAndView serviceRequestAppList(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Approval 1";
        String submoduleName = "Service Request";
        String sno = request.getParameter("pk");
        map.addAttribute("RequestList", serviceRequestDAO.Requestapp(sno, null));
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../serviceReq/serviceRequestAppList", map);
    }
//---------------------service request Approval 1 form---------------------------//

    @RequestMapping("/serviceReq/serviceRequestAppForm.htm")
    public ModelAndView serviceRequestAppForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sno = request.getParameter("pk");
        String serviceRequestNo = request.getParameter("serviceRequestNo");
        String propertyName = request.getParameter("propertyName");
        String propertyNo = request.getParameter("propertyNo");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("RequestList", serviceRequestDAO.list(sno, "ServiceRequest"));
            modelMap.addAttribute("RequestListve", serviceRequestDAO.RequestListve(serviceRequestNo, sno));
            modelMap.addAttribute("inventory", serviceRequestDAO.inventory());
            modelMap.addAttribute("assetDetails", tenantDetailsDAO.assetDetails(propertyName));
            modelMap.addAttribute("subassDetails", tenantDetailsDAO.subassDetails(propertyName, propertyNo));
            modelMap.addAttribute("itemCode", serviceRequestDAO.itemCode());
            modelMap.addAttribute("itemCate", serviceRequestDAO.itemCate());
            modelMap.addAttribute("uom", serviceRequestDAO.uom());
        }
        String link = "../serviceReq/serviceRequestForm.htm";
        String tab = "Service Request";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../serviceReq/serviceRequestAppForm", modelMap);
    }
//---------------------service request Approval 1 submit---------------------------//

    @RequestMapping("/serviceReq/serviceRequestAppFormSubmit.htm")
    public ModelAndView serviceRequestAppFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException, MessagingException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String serviceRequestNo = request.getParameter("serviceRequestNo");
        String tenantUniqueNo = request.getParameter("tenantUniqueNo");
        String serviceRequested = request.getParameter("serviceRequested");
        String sno[] = request.getParameterValues("sno");
        String pk1 = request.getParameter("pk");
        String reqQty[] = request.getParameterValues("reqQty");
        String unitPrice[] = request.getParameterValues("unitPrice");
        String marginPrice[] = request.getParameterValues("marginPrice");
        String totalPrice[] = request.getParameterValues("totalPrice");
        String remarks = request.getParameter("appremarks");
        String recordStatus = "GFC Approved";
        List<ServiceRequest> gridData = new ArrayList<ServiceRequest>();
        for (int i = 0; i < sno.length; i++) {
            BigDecimal pk = new BigDecimal(sno[i]);
            serviceRequestDAO.updateServiceRequest(pk, recordStatus, reqQty[i], unitPrice[i], marginPrice[i], totalPrice[i], remarks);
        }
        Common cm = new Common();
        String subject = "", tbody = "", mailbody = "", email = "", fileName = "", suppAdd = "";
        String userEmail = "excelarete@gmail.com";
        String password = "excel123";
        String toEmail = "";
        List<UserRegistration> ud = tenantDetailsDAO.udList("CFO");
        for (UserRegistration udlist : ud) {
            userId = udlist.getUserId();
            email = udlist.getEmail();

            if (!userEmail.isEmpty() && !password.isEmpty() && !email.isEmpty()) {
                List<ServiceRequest> td = serviceRequestDAO.tdList(userId, orgId, serviceRequestNo);
                StringBuilder emailId = new StringBuilder(email);
                if (td.size() > 0) {
                    int i = 1;
                    for (ServiceRequest tdlist : td) {

                        serviceRequestNo = tdlist.getServiceRequestNo();
                        tenantUniqueNo = tdlist.getTenantUniqueNo();
                        serviceRequested = tdlist.getServiceRequested();
                    }
                    emailId.append(",");
                    emailId.append(toEmail);
                    String[] sendEmail = emailId.toString().split(",");
                    subject = "Service Request: " + serviceRequestNo;
                    String filepath = request.getSession().getServletContext().getRealPath("common\\theme\\images\\logo1.png");
                    mailbody = "<html><body>Dear Sir/Madam,<br/><br/><br/>You need to give an approval for Service Request. Service Request No : " + serviceRequestNo + ", services requested for " + serviceRequested + ""
                            + " and Service requested by " + tenantUniqueNo + ". Please Approve this Tenant Details. <br/><br/>If approved ignore this mail. "
                            + "</body>"
                            + "<br/><br/>Thanks & Regards"
                            + "<br/>Al-Hashar Team.</html>";
                    ByteArrayOutputStream baos = new ByteArrayOutputStream();
                    baos.close();
                    cm.sendEmail(userEmail, password, sendEmail, subject, mailbody, baos, fileName);
                }
            }
        }
        modelMap.addAttribute("RequestList", serviceRequestDAO.list(pk1, "ServiceRequest"));
        return new ModelAndView(new RedirectView("../serviceReq/serviceRequestAppList.htm"), modelMap);
    }
//---------------------service request Approval 2 list---------------------------//

    @RequestMapping("/serviceReq/serviceRequestAppList1.htm")
    public ModelAndView serviceRequestAppList1(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Approval 2";
        String submoduleName = "Service Request";
        String sno = request.getParameter("pk");
        map.addAttribute("RequestList", serviceRequestDAO.Requestapp1(sno, null));
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../serviceReq/serviceRequestAppList1", map);
    }
//---------------------service request Approval 2 form---------------------------//

    @RequestMapping("/serviceReq/serviceRequestAppForm1.htm")
    public ModelAndView serviceRequestAppForm1(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sno = request.getParameter("pk");
        String serviceRequestNo = request.getParameter("serviceRequestNo");
        String propertyName = request.getParameter("propertyName");
        String propertyNo = request.getParameter("propertyNo");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("RequestList", serviceRequestDAO.list(sno, "ServiceRequest"));
            modelMap.addAttribute("RequestListve", serviceRequestDAO.RequestListve(serviceRequestNo, sno));
            modelMap.addAttribute("inventory", serviceRequestDAO.inventory());
            modelMap.addAttribute("assetDetails", tenantDetailsDAO.assetDetails(propertyName));
            modelMap.addAttribute("subassDetails", tenantDetailsDAO.subassDetails(propertyName, propertyNo));
            modelMap.addAttribute("itemCode", serviceRequestDAO.itemCode());
            modelMap.addAttribute("itemCate", serviceRequestDAO.itemCate());
            modelMap.addAttribute("uom", serviceRequestDAO.uom());
        }
        String link = "../serviceReq/serviceRequestForm.htm";
        String tab = "Service Request";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../serviceReq/serviceRequestAppForm1", modelMap);
    }
//---------------------service request Approval 2 submit---------------------------//

    @RequestMapping("/serviceReq/serviceRequestAppFormSubmiter.htm")
    public ModelAndView serviceRequestAppFormSubmiter(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String serviceRequestNo = request.getParameter("serviceRequestNo");
        String sno[] = request.getParameterValues("sno");
        String pk1 = request.getParameter("pk");
        String reqQty[] = request.getParameterValues("reqQty");
        String unitPrice[] = request.getParameterValues("unitPrice");
        String marginPrice[] = request.getParameterValues("marginPrice");
        String totalPrice[] = request.getParameterValues("totalPrice");
        String remarks = request.getParameter("appremarks");
        String recordStatus = "CFO Approved";
        List<ServiceRequest> gridData = new ArrayList<ServiceRequest>();
        for (int i = 0; i < sno.length; i++) {
            BigDecimal pk = new BigDecimal(sno[i]);
            serviceRequestDAO.updateServiceRequest1(pk, recordStatus, reqQty[i], unitPrice[i], marginPrice[i], totalPrice[i], remarks);
        }
        modelMap.addAttribute("RequestList", serviceRequestDAO.list(pk1, "ServiceRequest"));
        return new ModelAndView(new RedirectView("../serviceReq/serviceRequestAppList1.htm"), modelMap);
    }

//     *************************Material Issue Start**********************
//---------------------material issue list---------------------------//
    @RequestMapping("/serviceReq/materialIssueList.htm")
    public ModelAndView materialIssueList(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Material Issue";
        String submoduleName = "Material Issue";
        String sno = request.getParameter("pk");
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, submoduleName, tabName));
        map.addAttribute("RequestList", serviceRequestDAO.RequestMapp(sno, null));
        map.addAttribute("MIList", serviceRequestDAO.MIList(null));
        return new ModelAndView("../serviceReq/materialIssueList", map);
    }
//---------------------material issue form---------------------------//

    @RequestMapping("/serviceReq/materialIssueForm.htm")
    public ModelAndView materialIssueForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sno = request.getParameter("pk");
        String serviceRequestNo = request.getParameter("serviceRequestNo");
        String propertyName = request.getParameter("propertyName");
        String propertyNo = request.getParameter("propertyNo");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("RequestList", serviceRequestDAO.list(sno, "ServiceRequest"));
            modelMap.addAttribute("RequestListve", serviceRequestDAO.RequestListve(serviceRequestNo, sno));
            modelMap.addAttribute("inventory", serviceRequestDAO.inventory());
            modelMap.addAttribute("materialIssue", serviceRequestDAO.materialIssue(serviceRequestNo));
            modelMap.addAttribute("materialIssue1", serviceRequestDAO.materialIssue1(serviceRequestNo));
            modelMap.addAttribute("assetDetails", tenantDetailsDAO.assetDetails(propertyName));
            modelMap.addAttribute("subassDetails", tenantDetailsDAO.subassDetails(propertyName, propertyNo));
            modelMap.addAttribute("itemCode", serviceRequestDAO.itemCode());
            modelMap.addAttribute("itemCate", serviceRequestDAO.itemCate());
            modelMap.addAttribute("uom", serviceRequestDAO.uom());
        }
        String link = "../serviceReq/materialIssueForm.htm";
        String tab = "Material Issue";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../serviceReq/materialIssueForm", modelMap);
    }
//---------------------material issue form submit---------------------------//

    @RequestMapping("/serviceReq/materialIssueSubmit.htm")
    public ModelAndView materialIssueSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");
        String miNo = request.getParameter("miNo");
        String miDate = request.getParameter("miDate");
        String srNo = request.getParameter("reqNo");
        String tenantName = request.getParameter("tenantUniqueNo");
        String assetName = request.getParameter("propertyName");
        String subAssetname = request.getParameter("propertyNo");
        String issuedBy = request.getParameter("issuedBy");
        String issuedTo = request.getParameter("issuedTo");
        String serviceCategory[] = request.getParameterValues("serviceCategory");
        String itemCode[] = request.getParameterValues("itemCode");
        String itemName[] = request.getParameterValues("itemName");
        String uom[] = request.getParameterValues("uom");
        String reqQty[] = request.getParameterValues("issuingqty");
        String reqQty1[] = request.getParameterValues("reqQty");
        String priceum[] = request.getParameterValues("price");
        String totalPrice[] = request.getParameterValues("totalPrice");
        String invent[] = request.getParameterValues("invent");
        String extra1 = request.getParameter("extra1");
        String extra2 = request.getParameter("extra2");
        String extra3 = request.getParameter("extra3");
        String extra4 = request.getParameter("extra4");
        String extra5 = request.getParameter("extra5");
        String resordstatus = "Issue Requested";
        String remarks = request.getParameter("appremarks");
        String status = request.getParameter("status");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        List<MaterialIssue> gridData = new ArrayList<MaterialIssue>();
        if (miNo == null || miNo == "" || "".equals(miNo)) {
            ArrayList validuser = (ArrayList) serviceRequestDAO.getMINo(miDate);
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
            miNo = "MI" + "-" + ordno;
        }
        Date miDate1 = null;
        if (!miDate.equals("")) {
            miDate1 = (Date) formatter.parse(miDate);
        }
        for (int i = 0; i < itemCode.length; i++) {
            if (pk == null || pk == "" || pk.equals("")) {
                MaterialIssue mi = new MaterialIssue(orgId, userId, miNo, miDate1, assetName, subAssetname, tenantName, issuedBy, issuedTo, srNo, serviceCategory[i], itemCode[i], itemName[i], uom[i], reqQty1[i], reqQty[i], priceum[i], totalPrice[i], resordstatus, remarks, extra1, extra2, extra3, extra4, extra5, "update0", today, today);
                gridData.add(mi);
                serviceRequestDAO.matissuesave(gridData);
                serviceRequestDAO.updateSReq(srNo, itemCode[i], resordstatus);
            }
        }
        modelMap.addAttribute("RequestList", serviceRequestDAO.Requestapp(pk, null));
        return new ModelAndView(new RedirectView("../serviceReq/materialIssueList.htm"), modelMap);
    }
//---------------------material issue approval list---------------------------//

   @RequestMapping("/serviceReq/materialIssueList1.htm")
    public ModelAndView materialIssueList1(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Material Approval";
        String submoduleName = "Material Issue";
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        if (fromDate != null && toDate != null) {
            if (fromDate.contains("frdate") && toDate.contains("todate")) {
                fromDate = null;
                toDate = null;
            }
        }

        if (fromDate == null || toDate == null) {
            map.addAttribute("MIList", serviceRequestDAO.MIList(null));
        } else {
            map.addAttribute("MIList", serviceRequestDAO.MIList1(null, fromDate, toDate));
        }
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, submoduleName, tabName));
        map.addAttribute("RequestList", serviceRequestDAO.RequestMapp(sno, null));
        return new ModelAndView("../serviceReq/materialIssueList1", map);
    }
//---------------------material issue approval form---------------------------//

    @RequestMapping("/serviceReq/materialIssueForm1.htm")
    public ModelAndView materialIssueForm1(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sno = request.getParameter("pk");
        String serviceRequestNo = request.getParameter("serviceRequestNo");
        String propertyName = request.getParameter("assetName");
        String propertyNo = request.getParameter("subAssetname");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("RequestList", serviceRequestDAO.RequestList(serviceRequestNo, null));
            modelMap.addAttribute("RequestListve", serviceRequestDAO.RequestListve(serviceRequestNo, sno));
            modelMap.addAttribute("inventory", serviceRequestDAO.inventory());
            modelMap.addAttribute("materialIssue", serviceRequestDAO.materialIssue(serviceRequestNo));
            modelMap.addAttribute("materialIssue1", serviceRequestDAO.materialIssue1(serviceRequestNo));
            modelMap.addAttribute("assetDetails", tenantDetailsDAO.assetDetails(propertyName));
            modelMap.addAttribute("subassDetails", tenantDetailsDAO.subassDetails(propertyName, propertyNo));
            modelMap.addAttribute("itemCode", serviceRequestDAO.itemCode());
            modelMap.addAttribute("itemCate", serviceRequestDAO.itemCate());
            modelMap.addAttribute("uom", serviceRequestDAO.uom());
        }
        String link = "../serviceReq/materialIssueForm.htm";
        String tab = "Material Issue";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../serviceReq/materialIssueForm1", modelMap);
    }
//---------------------material issue approval form submit---------------------------//

    @RequestMapping("/serviceReq/materialIssueSubmit1.htm")
    public ModelAndView materialIssueSubmit1(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String serviceRequestNo = request.getParameter("reqNo");
        String miNo = request.getParameter("miNo");
        String sno[] = request.getParameterValues("sno");
        String pk1 = request.getParameter("pk");
        String itemCode[] = request.getParameterValues("itemCode");
        String invent[] = request.getParameterValues("invent");
        String unitPrice[] = request.getParameterValues("unitPrice");
        String marginPrice[] = request.getParameterValues("marginPrice");
        String totalPrice[] = request.getParameterValues("totalPrice");
        String issuingqty[] = request.getParameterValues("issuingqty");
        String reqQty[] = request.getParameterValues("reqQty");
        String remarks = request.getParameter("appremarks");
        String appstatus = "Approved";
        Double issue = 0.0;
        Double req = 0.0;
        List<MaterialIssue> gridData = new ArrayList<MaterialIssue>();
        for (int i = 0; i < sno.length; i++) {
            issue = issue + Double.parseDouble(issuingqty[i]);
            req = req + Double.parseDouble(reqQty[i]);
            BigDecimal pk = new BigDecimal(sno[i]);
            if (issue < req) {
                serviceRequestDAO.updateMAterialIssue("Partially Issued", appstatus, remarks, miNo, issuingqty[i], pk);
            } else {
                serviceRequestDAO.updateMAterialIssue("Issued", appstatus, remarks, miNo, issuingqty[i], pk);
            }
            serviceRequestDAO.updateInventory(itemCode[i], invent[i]);
        }
        if (issue < req) {
            serviceRequestDAO.updateMAterialPartIssue("Partially Issued", miNo);
        } else {
            serviceRequestDAO.updateMAterialPartIssue("Partially Issued", miNo);
        }
        modelMap.addAttribute("RequestList", serviceRequestDAO.Requestapp(pk1, null));
        return new ModelAndView(new RedirectView("../serviceReq/materialIssueList1.htm"), modelMap);
    }
//     *************************Material Issue End**********************

    //******************Service Request For Tenant Portal*****************   
    @RequestMapping("/serviceReq/serviceRequestForm1.htm")
    public ModelAndView serviceRequestForm1(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sno = request.getParameter("pk");
        String serviceRequestNo = request.getParameter("serviceRequestNo");
        String propertyName = request.getParameter("propertyName");
        String propertyNo = request.getParameter("propertyNo");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("RequestList", serviceRequestDAO.list(sno, "ServiceRequest"));
            modelMap.addAttribute("RequestListve", serviceRequestDAO.RequestListve(serviceRequestNo, sno));
            modelMap.addAttribute("inventory", serviceRequestDAO.inventory());
            modelMap.addAttribute("assetDetails", tenantDetailsDAO.assetDetails(propertyName));
            modelMap.addAttribute("subassDetails", tenantDetailsDAO.subassDetails(propertyName, propertyNo));
            modelMap.addAttribute("itemCode", serviceRequestDAO.itemCode());
            modelMap.addAttribute("itemCate", serviceRequestDAO.itemCate());
            modelMap.addAttribute("uom", serviceRequestDAO.uom());
        }
        String link = "../serviceReq/serviceRequestForm1.htm";
        String tab = "Service Request";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../serviceReq/serviceRequestForm1", modelMap);
    }

    @RequestMapping("/serviceReq/selectTenantForServiceRequest.htm")
    public ModelAndView selectTenantForServiceRequest(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();

        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        modelMap.addAttribute("selectTenant", serviceRequestDAO.selectTenant1(userId));
        return new ModelAndView("selectTenantForServiceRequest", modelMap);
    }

    @RequestMapping("/serviceReq/serviceRequestFormSubmit1.htm")
    public ModelAndView serviceRequestFormSubmit1(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");
        String serviceRequestNo = request.getParameter("serviceRequestNo");
        String serviceRequestDate = request.getParameter("serviceRequestDate");
        String serviceRequesterName = request.getParameter("serviceRequesterName");
        String tenantUniqueNo = request.getParameter("tenantUniqueNo");
        String propertyName = request.getParameter("assetCode");
        String propertyNo = request.getParameter("subassetCode");
        String serviceRequested = request.getParameter("serviceRequested");
        String serviceRequestedCost = request.getParameter("serviceRequestedCost");
        String completedBy = request.getParameter("completedBy");
        String remarks = request.getParameter("remarks");
        String serviceCategory[] = request.getParameterValues("serviceCategory");
        String itemCode[] = request.getParameterValues("itemCode");
        String itemName[] = request.getParameterValues("itemName");
        String uom[] = request.getParameterValues("uom");
        String availQty[] = request.getParameterValues("availQty");
        String reqQty[] = request.getParameterValues("reqQty");
        String unitPrice[] = request.getParameterValues("unitPrice");
        String marginPrice[] = request.getParameterValues("marginPrice");
        String totalPrice[] = request.getParameterValues("totalPrice");
        String extra1 = request.getParameter("extra1");
        String extra2 = request.getParameter("extra2");
        String extra3 = request.getParameter("extra3");
        String extra4 = request.getParameter("extra4");
        String extra5 = request.getParameter("extra5");
        String sno[] = request.getParameterValues("sno");
        String status = request.getParameter("status");
        String totalAmount = request.getParameter("totalAmount");
        String creationDate = request.getParameter("creationDate");
        String sSavesnoedu = request.getParameter("sSavesnoedu");
        String eSno = request.getParameter("eSno");
        modelMap.addAttribute("action", request.getParameter("action"));
        String action = request.getParameter("action");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        List<ServiceRequest> gridData = new ArrayList<ServiceRequest>();
        if (serviceRequestNo == null || serviceRequestNo == "" || "".equals(serviceRequestNo)) {
            ArrayList validuser = (ArrayList) serviceRequestDAO.getSRNo(serviceRequestDate);
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
            serviceRequestNo = "SR" + "-" + ordno;
        }
        Date serviceRequestDate1 = null;
        if (!serviceRequestDate.equals("")) {
            serviceRequestDate1 = (Date) formatter.parse(serviceRequestDate);
        }
        Date completedBy1 = null;
        if (!completedBy.equals("")) {
            completedBy1 = (Date) formatter.parse(completedBy);
        }
        if (pk == null || pk == "" || pk.equals("")) {
            for (int i = 0; i < itemCode.length; i++) {
                ServiceRequest sr = new ServiceRequest(orgId, userId, serviceRequestNo, serviceRequestDate1, serviceRequesterName, tenantUniqueNo, serviceRequested, serviceRequestedCost, propertyName, propertyNo, completedBy1, serviceCategory[i], itemCode[i], itemName[i], uom[i], reqQty[i], unitPrice[i], marginPrice[i], totalPrice[i], totalAmount, remarks, "Service Requested", extra1, extra2, extra3, extra4, extra5, "update0", today, today);
                gridData.add(sr);
                serviceRequestDAO.servicesave(gridData);
            }
        } else {
            if (action != null && !action.isEmpty()) {
                if (action.equalsIgnoreCase("recheck")) {
                    String str[] = serviceRequestNo.split("-");
                    if (str.length > 2) {
                        int j = Integer.parseInt(str[3]);
                        j = j + 1;
                        serviceRequestNo = str[0] + "-" + str[1] + "-" + str[2] + "-" + j;
                    } else {
                        serviceRequestNo = serviceRequestNo + "-REV" + "-" + 1;
                    }
                }
            }
            for (int i = 0; i < itemCode.length; i++) {
                System.out.println(sSavesnoedu.trim().length());
                if (sSavesnoedu.trim().length() != 0) {
                    String out[] = sSavesnoedu.split("//");
                    for (int j = 0; j < out.length; j++) {
                        serviceRequestDAO.srGridDataDelete(Integer.parseInt(out[j]));
                    }
                }
                if (eSno != null) {
                    try {
                        ServiceRequest sr = new ServiceRequest(Integer.parseInt(sno[i]), orgId, userId, serviceRequestNo, serviceRequestDate1, serviceRequesterName, tenantUniqueNo, serviceRequested, serviceRequestedCost, propertyName, propertyNo, completedBy1, serviceCategory[i], itemCode[i], itemName[i], uom[i], reqQty[i], unitPrice[i], marginPrice[i], totalPrice[i], totalAmount, remarks, "Service Requested", extra1, extra2, extra3, extra4, extra5, status, today);
                        gridData.add(sr);
                        serviceRequestDAO.servicesave(gridData);
                    } catch (NullPointerException nl) {
                    } catch (ArrayIndexOutOfBoundsException ar) {
                        ServiceRequest sr = new ServiceRequest(orgId, userId, serviceRequestNo, serviceRequestDate1, serviceRequesterName, tenantUniqueNo, serviceRequested, serviceRequestedCost, propertyName, propertyNo, completedBy1, serviceCategory[i], itemCode[i], itemName[i], uom[i], reqQty[i], unitPrice[i], marginPrice[i], totalPrice[i], totalAmount, remarks, "Service Requested", extra1, extra2, extra3, extra4, extra5, "update0", today, today);
                        gridData.add(sr);
                        serviceRequestDAO.servicesave(gridData);
                    }
                } else {
                    ServiceRequest sr = new ServiceRequest(orgId, userId, serviceRequestNo, serviceRequestDate1, serviceRequesterName, tenantUniqueNo, serviceRequested, serviceRequestedCost, propertyName, propertyNo, completedBy1, serviceCategory[i], itemCode[i], itemName[i], uom[i], reqQty[i], unitPrice[i], marginPrice[i], totalPrice[i], totalAmount, remarks, "Service Requested", extra1, extra2, extra3, extra4, extra5, "update0", today, today);
                    gridData.add(sr);
                    serviceRequestDAO.servicesave(gridData);
                }
            }
        }
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
                List<ServiceRequest> td = serviceRequestDAO.tdList(userId, orgId, serviceRequestNo);
                StringBuilder emailId = new StringBuilder(email);
                if (td.size() > 0) {
                    int i = 1;
                    for (ServiceRequest tdlist : td) {

                        serviceRequestNo = tdlist.getServiceRequestNo();
                        tenantUniqueNo = tdlist.getTenantUniqueNo();
                        serviceRequested = tdlist.getServiceRequested();
                    }
                    emailId.append(",");
                    emailId.append(toEmail);
                    String[] sendEmail = emailId.toString().split(",");
                    subject = "Service Request: " + serviceRequestNo;
                    String filepath = request.getSession().getServletContext().getRealPath("common\\theme\\images\\logo1.png");
                    mailbody = "<html><body>Dear Sir/Madam,<br/><br/><br/>You need to give an approval for Service Request. Service Request No : " + serviceRequestNo + ", services requested for " + serviceRequested + ""
                            + " and Service requested by " + tenantUniqueNo + ". Please Approve this Tenant Details. <br/><br/>If approved ignore this mail. "
                            + "</body>"
                            + "<br/><br/>Thanks & Regards"
                            + "<br/>Al-Hashar Team.</html>";
                    ByteArrayOutputStream baos = new ByteArrayOutputStream();
                    baos.close();
                    cm.sendEmail(userEmail, password, sendEmail, subject, mailbody, baos, fileName);
                }
            }
        }
        modelMap.addAttribute("RequestList", serviceRequestDAO.list(pk, "ServiceRequest"));
        return new ModelAndView("../login/dashboard", modelMap);
    }

    @RequestMapping("/serviceReq/serviceRequestList1.htm")
    public ModelAndView serviceRequestList1(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Service Request";
        String submoduleName = "Service Request";
        String sno = request.getParameter("pk");
        map.addAttribute("RequestList", serviceRequestDAO.serviceList1(sno, userId, "ServiceRequest"));
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../serviceReq/serviceRequestList", map);
    }
}
