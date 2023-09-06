/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.lowagie.text.DocumentException;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.net.URL;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.IOUtils;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFCreationHelper;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Picture;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;
import org.hibernate.HibernateException;
import org.pentaho.reporting.engine.classic.core.ClassicEngineBoot;
import org.pentaho.reporting.engine.classic.core.MasterReport;
import org.pentaho.reporting.engine.classic.core.ReportProcessingException;
import org.pentaho.reporting.engine.classic.core.modules.output.pageable.pdf.PdfReportUtil;
import org.pentaho.reporting.libraries.resourceloader.Resource;
import org.pentaho.reporting.libraries.resourceloader.ResourceException;
import org.pentaho.reporting.libraries.resourceloader.ResourceManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import tenant.classes.BuildingHistoryManagement;
import tenant.classes.FinalQuotation;
import tenant.classes.HostEmailConfig;
import tenant.classes.OrgDetails;
import tenant.classes.PurchAttach;
import tenant.classes.PurchRequisition;
import tenant.classes.PurchaseAttachments;
import tenant.classes.PurchaseItemDescription;
import tenant.classes.PurchaseOrder;
import tenant.classes.PurchaseRequest;
import tenant.classes.RequiAttach;
import tenant.classes.StandardInvoice;
import tenant.classes.StoreMaster;
import tenant.classes.SupplierEnquiry;
import tenant.classes.SupplierMaster;
import tenant.classes.SupplierQuotation;
import tenant.classes.UserRegistration;
import tenant.classes.VendorDetails;
import tenant.classes.VendorDetailsGrid;
import tenant.classes.Workflow;
import tenant.dao.ContractDAO;
import tenant.dao.MasterDAO;
import tenant.dao.PurchaseDetailsDAO;
import tenant.dao.TenantDetailsDAO;
import tenant.dao.UserDAO;

/**
 *
 * @author ebs
 */
public class PurchaseDetailsController {

    Calendar now = Calendar.getInstance();
    String mod_date = now.get(Calendar.YEAR) + "/" + (now.get(Calendar.MONTH) + 1) + "/" + now.get(Calendar.DATE);
    Date date = new Date(mod_date);
    DateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
    DateFormat formatter2 = new SimpleDateFormat("dd-MM-yyyy");
    DateFormat formatter1 = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss a");
    DateFormat formatter3 = new SimpleDateFormat("dd-MMM-yyyy");
    DateFormat formatter4 = new SimpleDateFormat("yyyy-MM-dd");
    DateFormat ddMMYYFormat = new SimpleDateFormat("dd/MM/yyyy");
    java.util.Date newdate = new java.util.Date();
    long t = newdate.getTime();
    java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(t);
    @Autowired
    private PurchaseDetailsDAO purchDAO;
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private ContractDAO contractDAO;
    @Autowired
    private TenantDetailsDAO tenantDetailsDAO;
    //private Object ddMMYYFormat;
    private Object purchaseDAO;

    //---------------------Contract Creation---------------------------------------------//
    @RequestMapping("/purchase/purchaseRequiList.htm")
    public ModelAndView purchaseRequiList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        if (fromDate != null && toDate != null) {
            if (fromDate.contains("frdate") && toDate.contains("todate")) {
                fromDate = null;
                toDate = null;
            }
        }
        if (fromDate == null || toDate == null) {
            modelMap.addAttribute("purchReqList", purchDAO.reqlist(userId, orgId, null));
        } else {
            modelMap.addAttribute("purchReqList", purchDAO.reqlist1(userId, orgId, null, fromDate, toDate));
        }

        /* ModelMap map = new ModelMap();
         HttpSession session = request.getSession();
         String orgId = session.getAttribute("orgId").toString();
         String userId = session.getAttribute("userId").toString();
         String roleName = session.getAttribute("userRole").toString();
         String tabName = "Purchase Requisition";
         String submoduleName = "Purchase Requisition";
         map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
         map.addAttribute("purchRequi", purchDAO.reqlist("", "PurchRequisition"));
         map.addAttribute("assetList", purchDAO.list("", "AssetDetails"));
         map.addAttribute("subassetList", purchDAO.list("", "SubAssetDetails"));*/
        modelMap.addAttribute("fromDate", fromDate);
        modelMap.addAttribute("toDate", toDate);
        return new ModelAndView("../purchRequi/purchaseRequiList", modelMap);
    }

    @RequestMapping("/purchase/totpurchaseRequiList.htm")
    public ModelAndView totpurchaseRequiList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        String status = request.getParameter("status");

        if (fromDate != null && toDate != null) {
            if (fromDate.contains("frdate") && toDate.contains("todate")) {
                fromDate = null;
                toDate = null;
            }
        }
        if (fromDate == null || toDate == null) {
            modelMap.addAttribute("purchReqList", purchDAO.totreqlist(userId, orgId, null));
        } else {
            modelMap.addAttribute("purchReqList", purchDAO.totreqlist1(userId, orgId, null, fromDate, toDate));
        }

        /* ModelMap map = new ModelMap();
         HttpSession session = request.getSession();
         String orgId = session.getAttribute("orgId").toString();
         String userId = session.getAttribute("userId").toString();
         String roleName = session.getAttribute("userRole").toString();
         String tabName = "Purchase Requisition";
         String submoduleName = "Purchase Requisition";
         map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
         map.addAttribute("purchRequi", purchDAO.reqlist("", "PurchRequisition"));
         map.addAttribute("assetList", purchDAO.list("", "AssetDetails"));
         map.addAttribute("subassetList", purchDAO.list("", "SubAssetDetails"));*/
        modelMap.addAttribute("status", status);
        modelMap.addAttribute("fromDate", fromDate);
        modelMap.addAttribute("toDate", toDate);
        return new ModelAndView("../purchRequi/purchaseRequiList", modelMap);
    }

    @RequestMapping("/purchase/purchaseRequiForm.htm")
    public ModelAndView purchaseRequiForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {

        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String userDiv = session.getAttribute("userDiv").toString();

        String SNo = request.getParameter("sno");
        if (SNo != null || !"null".equals(SNo)) {
//            modelMap.addAttribute("matDetailsLst", purchreqdao.reqlist(userId, orgId, SNo));
        }
        ArrayList validuser = (ArrayList) purchDAO.autoGenNo(null, "1");
        String quotnoFinal = null;
        String quotNo = null;
        int reqno = 1;
        if (!validuser.isEmpty()) {
            for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
                if (iter.next() != null) {
                    Iterator<String> iter2 = validuser.iterator();
                    iter2.hasNext();
                    quotnoFinal = String.valueOf(iter2.next());
                }
            }
            quotNo = quotnoFinal;
        }
        if (quotNo != null) {
            reqno = Integer.parseInt(quotNo) + 1;
        }
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("requisitionNo", reqno);
        modelMap.addAttribute("action", request.getParameter("action"));
        modelMap.addAttribute("store", purchDAO.storeMasterdivisionwise(userDiv));
        modelMap.addAttribute("itemcategoryList", purchDAO.itemcategoryList());
        return new ModelAndView("../purchRequi/purchaseRequiForm", modelMap);
    }

    // Purchase Requi View Form
    @RequestMapping("/purchase/purchRequiView.htm")
    public ModelAndView purchRequiView(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        /*ModelMap modelMap = new ModelMap();
         String requisitionNo = request.getParameter("requisitionNo");
         HttpSession session = request.getSession();
         String orgId = session.getAttribute("orgId").toString();
         String assetCode = request.getParameter("assetCode");
         String subAssetCode = request.getParameter("subAssetCode");
         String link = "../purchase/purchaseRequiForm.htm";
         String tab = "Purchase Requisition";
         modelMap.addAttribute("purchase", userDAO.formLabelMapping(link, tab));
         modelMap.addAttribute("purchRequi", purchDAO.Viewlist(requisitionNo, "PurchRequisition"));
         modelMap.addAttribute("assetCode", purchDAO.assetCod(null, assetCode));
         modelMap.addAttribute("subAssetCode", purchDAO.subassetCod(null, subAssetCode));
         modelMap.addAttribute("itemCod", purchDAO.itemCod(null, null));
         modelMap.addAttribute("action", request.getParameter("action"));*/
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String requisitionNo = request.getParameter("reqNo");
        String action = request.getParameter("action");
        modelMap.addAttribute("purchReqList", purchDAO.autoGenNo(requisitionNo, "0"));
        modelMap.addAttribute("purchDocList", purchDAO.purchDocList(requisitionNo));
        if (action != null && action.equalsIgnoreCase("print")) {
            modelMap.addAttribute("subgrouplist", userDAO.subgrouplist(null));
            return new ModelAndView("../purchRequi/prPrint", modelMap);
        }

        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../purchRequi/purchRequiView", modelMap);
    }

    // Purchase Requi Edit Form
    @RequestMapping("/purchase/purchRequiEdit.htm")
    public ModelAndView purchRequiEdit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {

        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String requisitionNo = request.getParameter("reqNo");
        modelMap.addAttribute("purchReqList", purchDAO.autoGenNo(requisitionNo, "0"));
        modelMap.addAttribute("purchDocList", purchDAO.purchDocList(requisitionNo));
        modelMap.addAttribute("purchList", purchDAO.purchList(requisitionNo));
        modelMap.addAttribute("uomCode", purchDAO.uom());
        modelMap.addAttribute("action", request.getParameter("action"));
        /*ModelMap modelMap = new ModelMap();
         String sno = request.getParameter("pk");
         String requisitionNo = request.getParameter("requisitionNo");
         String assetCode = request.getParameter("assetCode");
         String subAssetCode = request.getParameter("subAssetCode");
         String action = request.getParameter("action");
         HttpSession session = request.getSession();
         String orgId = session.getAttribute("orgId").toString();
         String link = "../purchase/purchaseRequiForm.htm";
         String tab = "Purchase Requisition";
         modelMap.addAttribute("purchase", userDAO.formLabelMapping(link, tab));
         modelMap.addAttribute("purchRequi", purchDAO.Viewlist(requisitionNo, "PurchRequisition"));
         modelMap.addAttribute("assetCode", purchDAO.assetCod(null, assetCode));
         modelMap.addAttribute("subAssetCode", purchDAO.subassetCod(null, subAssetCode));
         modelMap.addAttribute("itemCod", purchDAO.itemCod(null, null));

         modelMap.addAttribute("action", request.getParameter("action"));*/
        return new ModelAndView("../purchRequi/purchRequiEdit", modelMap);
    }

    @RequestMapping("/purchase/purchaseRequiFormSubmit.htm")
    public ModelAndView purchaseRequiFormSubmit(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        java.util.Date newdate = new java.util.Date();
        long t = newdate.getTime();
        java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(t);
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String projectCode = request.getParameter("projectCode");
        //projectCode="project";
        String subreqNo[] = request.getParameterValues("subreqNo");
        String reqNo = request.getParameter("ReqNo");
        String requitionDate = request.getParameter("reqDate");
        String requitioncurrDate = request.getParameter("ReqDateNo");
        String reviewerName = request.getParameter("Rname");
        String approverName = request.getParameter("Aname");
        String itemsubCat[] = request.getParameterValues("itemsubCat");
        String itemCat[] = request.getParameterValues("itemCat");
        String itemCode[] = request.getParameterValues("itemCode");
        String itemName[] = request.getParameterValues("itemName");
        String itemDesc[] = request.getParameterValues("itemDesc");
        String requisitionQty[] = request.getParameterValues("requisitionQty");
        String requisitionUom[] = request.getParameterValues("requisitionUom");
        String requiredByDate[] = request.getParameterValues("requiredByDate");
        String requiredAtLoc[] = request.getParameterValues("requiredAtLoc");
        String priority[] = request.getParameterValues("priority");
        String actionRemarks[] = request.getParameterValues("actionRemarks");
        String purchaseType = request.getParameter("purchaseType");
        purchaseType = "General";
        String department = request.getParameter("dept");
        String recordStatus = request.getParameter("recordStatus");
        String attachmentReference = request.getParameter("attachmentReference1");
        String needReview = "Yes";//request.getParameter("needReview");
        String pk[] = request.getParameterValues("pk");
        String unitPrice[] = request.getParameterValues("unitPrice");
        String totalPrice[] = request.getParameterValues("totalPrice");
        String prName = request.getParameter("prName");
        String assetCode = request.getParameter("assetCode");
        String subAssetCode = request.getParameter("subAssetCode");

        String status = request.getParameter("status");
        String division = request.getParameter("division");
        String action = request.getParameter("action");

        List<PurchaseRequest> gridData = new ArrayList<PurchaseRequest>();
        String originalImg = null;
        ArrayList validuser = (ArrayList) purchDAO.autoGenNo(null, "1");
        String quotnoFinal = null;
        String quotNo = null;
        int sno = 1;
        String reqsno = null;
        if (!action.equals("edit")) {
            int num = 1;
            if (!validuser.isEmpty()) {
                for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
                    if (iter.next() != null) {
                        Iterator<String> iter2 = validuser.iterator();
                        iter2.hasNext();
                        quotnoFinal = String.valueOf(iter2.next());
                    }
                }
                quotNo = quotnoFinal;
            }
            if (quotNo != null) {
                num = Integer.parseInt(quotNo) + 1;

            }
            reqNo = "REQ-" + num;
        }

        if (pk == null) {
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            MultipartFile multipartFile = multipartRequest.getFile("attachmentReference");
            String fileName = multipartFile.getOriginalFilename();
            PurchaseAttachments pa = new PurchaseAttachments(userId, orgId, reqNo, fileName, multipartFile.getBytes(), newdate, "upadte0", sqlTimestamp);

            for (int i = 0; i < itemCode.length; i++) {
                reqsno = reqNo + "-" + sno;

                Date reqDate = new Date();
                Date iDateOne = new Date();
                try {
                    if (!"".equals(requitionDate) && requitionDate != null) {
                        reqDate = (Date) formatter.parse(requitionDate);
                    }
                    if (!"".equals(requitioncurrDate) && requitioncurrDate != null) {
                        iDateOne = (Date) formatter.parse(requitioncurrDate);
                    }
                } catch (NullPointerException ex) {
                }

                Date rDate = null;
                try {
                    if (!"".equals(requiredByDate[i]) && requiredByDate[i] != null) {
                        Date date = ddMMYYFormat.parse(requiredByDate[i]);
                        requiredByDate[i] = formatter.format(date);
                        rDate = (Date) formatter.parse(requiredByDate[i]);
                    }
                } catch (NullPointerException ex) {
                }// Do something/nothing if date2 is null

                if (needReview.equalsIgnoreCase("No")) {
                    reviewerName = "";
                    recordStatus = "Reviewed";
                } else {
                    recordStatus = "Need Review";
                }
                if (needReview.equalsIgnoreCase("No") && (itemCat[i].equalsIgnoreCase("Service") || itemCat[i].equalsIgnoreCase("Asset"))) {
                    recordStatus = "Store Reviewed";
                }
                if ("".equals(unitPrice[i]) || unitPrice[i] == null) {
                    unitPrice[i] = "0.0";
                }
                if ("".equals(totalPrice[i]) || totalPrice[i] == null) {
                    totalPrice[i] = "0.0";//0.0";
                }
//totalPrice[i] = "1.0";
                String[] uom = requisitionUom[i].split("-");
                String reqUom = null;
                if (!uom[1].isEmpty() && uom[1] != null) {//uom[1]
                    reqUom = uom[1];
                }

                PurchaseRequest pr = new PurchaseRequest(userId, orgId, division, assetCode, subAssetCode, purchaseType, reqNo, reqDate, projectCode,
                        prName, department, requiredAtLoc[0].trim(), itemCat[i].trim(), itemsubCat[i].trim(), itemCode[i], itemName[i].trim(), itemDesc[i].trim(), rDate,
                        priority[i], Double.parseDouble(requisitionQty[i]), reqUom, Double.parseDouble(unitPrice[i]),
                        Double.parseDouble(totalPrice[i]), actionRemarks[0], needReview, reviewerName,
                        multipartFile.getBytes(), fileName, recordStatus, "update0", sqlTimestamp, reqsno, Double.parseDouble(requisitionQty[i]));

                gridData.add(pr);
                sno++;
            }
            purchDAO.savedetaillist(gridData);
            if (!fileName.isEmpty()) {
                purchDAO.saveAttch(pa);
            }
        } else {
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            MultipartFile multipartFile = multipartRequest.getFile("attachmentReference");
            String fileName = request.getParameter("fileName");
            for (int i = 0; i < pk.length; i++) {

                Date rDate = null;
                Date iDateOne = null;
                try {
                    if (!"".equals(requiredByDate[i]) && requiredByDate[i] != null) {
                        Date date = ddMMYYFormat.parse(requiredByDate[i]);
                        requiredByDate[i] = formatter.format(date);
                        rDate = (Date) formatter.parse(requiredByDate[i]);
                    }
                    if (!"".equals(requitioncurrDate) && requitioncurrDate != null) {
                        iDateOne = (Date) formatter.parse(requitioncurrDate);
                    }
                } catch (NullPointerException ex) {
                }// Do something/nothing if date2 is null

                int k = Integer.parseInt(status.substring(status.length() - 1));
                k++;
                status = "update" + k;
                String[] uom = requisitionUom[i].split("-");
                String reqUom = null;
                if (!uom[0].isEmpty() && uom[0] != null) {//uom[1]
                    reqUom = uom[0];
                }

                PurchaseRequest pr = new PurchaseRequest(Integer.parseInt(pk[i]), userId, orgId, division, purchaseType, reqNo, iDateOne, projectCode,
                        prName, department, requiredAtLoc[0].trim(), itemCat[i].trim(), itemsubCat[i].trim(), itemCode[i], itemName[i].trim(), itemDesc[i].trim(), rDate,
                        priority[0], Double.parseDouble(requisitionQty[i]), reqUom, Double.parseDouble(unitPrice[i]),
                        Double.parseDouble(totalPrice[i]), actionRemarks[0], needReview, reviewerName,
                        "Need Review", status, sqlTimestamp, subreqNo[i], Double.parseDouble(requisitionQty[i]));
                gridData.add(pr);
            }
        }
        purchDAO.savedetaillist(gridData);
        modelMap.addAttribute("message", "Data Saved Successfully...");
        modelMap.addAttribute("success", "true");
        return new ModelAndView(new RedirectView("../purchase/purchaseRequiList.htm"), modelMap);
    }

    /// Asset Pop UP
    @RequestMapping("/purchase/selectAssetAndSubAsset.htm")
    public ModelAndView selectAssetAndSubAsset(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        modelMap.addAttribute("asset", purchDAO.list2(null, null));
        return new ModelAndView("../purchRequi/selectAssetAndSubAsset", modelMap);
    }

    /// Item Master Pop UP
    @RequestMapping("/purchase/selectItemMaster.htm")
    public ModelAndView selectItemMaster(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        modelMap.addAttribute("itemMaster", purchDAO.list("", "ItemMaster"));
        modelMap.addAttribute("uom", purchDAO.list("", "UomMaster"));
        modelMap.addAttribute("cat", purchDAO.list("", "ItemCategory"));
        return new ModelAndView("../purchRequi/selectItemMaster", modelMap);
    }

    //---------------------Requisition Attchment---------------------------------------------//
    @RequestMapping("/purchase/additionalDocumentsForm.htm")
    public ModelAndView additionalDocumentsForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String requisitionNo = request.getParameter("requisitionNo");
        map.addAttribute("action", request.getParameter("action"));
        map.addAttribute("requiDocument", purchDAO.RequiAttachlist(requisitionNo));
        map.addAttribute("fileSize", userDAO.fileSize());
        return new ModelAndView("../purchRequi/additionalDocumentsForm", map);
    }

    @RequestMapping("/purchase/requiAttachDownload.htm")
    public void requiAttachDownload(HttpServletRequest req, HttpServletResponse res) throws FileNotFoundException, IOException {
        String docId = req.getParameter("sno");
        PurchaseAttachments doc = purchDAO.get(Integer.parseInt(docId));
        try {
            res.setHeader("Content-Disposition", "inline;filename=\"" + doc.getFileName() + "\"");
            OutputStream out = res.getOutputStream();
            //res.setContentType(doc.getContentType());
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
        /*String sno = req.getParameter("sno");
         RequiAttach doc = purchDAO.getRequiAttach(Integer.parseInt(sno));
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
         }*/
    }

    @RequestMapping("/purchase/RequiApproveForm.htm")
    public ModelAndView RequiApproveForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {

        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String requisitionNo = request.getParameter("reqNo");
        modelMap.addAttribute("purchReqList", purchDAO.autoGenNo(requisitionNo, "0"));
        modelMap.addAttribute("purchDocList", purchDAO.purchDocList(requisitionNo));
        /*ModelMap modelMap = new ModelMap();
         String sno = request.getParameter("pk");
         HttpSession session = request.getSession();
         String requisitionNo = request.getParameter("requisitionNo");
         String orgId = session.getAttribute("orgId").toString();
         String userId = session.getAttribute("userId").toString();
         String link = "../purchase/purchaseRequiForm.htm";
         String tab = "Purchase Requisition";
         modelMap.addAttribute("purchase", userDAO.formLabelMapping(link, tab));
         modelMap.addAttribute("approvList", purchDAO.requiApprovList(userId, orgId, requisitionNo));
         modelMap.addAttribute("assetCode", purchDAO.list("", "AssetDetails"));
         modelMap.addAttribute("subAssetCode", purchDAO.list("", "SubAssetDetails"));
         modelMap.addAttribute("itemCod", purchDAO.itemCod(null, null));
         modelMap.addAttribute("action", request.getParameter("action"));*/
        return new ModelAndView("../purchRequi/RequiApproveForm", modelMap);
    }

    @RequestMapping("/purchase/approvedRequiView.htm")
    public ModelAndView approvedRequiView(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession();
        String requisitionNo = request.getParameter("requisitionNo");
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String link = "../purchase/purchaseRequiForm.htm";
        String tab = "Purchase Requisition";
        modelMap.addAttribute("purchase", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("approvList", purchDAO.requiApprovList(userId, orgId, requisitionNo));
        modelMap.addAttribute("assetCode", purchDAO.list("", "AssetDetails"));
        modelMap.addAttribute("subAssetCode", purchDAO.list("", "SubAssetDetails"));
        modelMap.addAttribute("itemCod", purchDAO.itemCod(null, null));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../purchRequi/approvedRequiView", modelMap);
    }

    @RequestMapping("/purchase/RequiApproveList.htm")
    public ModelAndView RequiApproveList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {

        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        modelMap.addAttribute("purchReqList", purchDAO.reviewList(userId, orgId, null));

        /*ModelMap map = new ModelMap();
         HttpSession session = request.getSession();
         String orgId = session.getAttribute("orgId").toString();
         String userId = session.getAttribute("userId").toString();
         String roleName = session.getAttribute("userRole").toString();
         String tabName = "Account Manager Approval";
         String submoduleName = "Purchase Requisition";
         map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
         map.addAttribute("purchRequi", purchDAO.requiList(userId, orgId, null, "Request Generated"));*/
        return new ModelAndView("../purchRequi/RequiApproveList", modelMap);
    }

    @RequestMapping("/purchase/RequiApprovSubmit.htm")
    public ModelAndView RequiApprovSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException, MessagingException {
        java.util.Date today = new java.util.Date();

        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk[] = request.getParameterValues("pk");
        String status[] = request.getParameterValues("status");
        String reviewerComments = request.getParameter("reviewerComments");
//        String needReview = request.getParameter("needReview");
        String reviewerRecordStatus = request.getParameter("reviewerRecordStatus");
        //String recordStatus[]=request.getParameterValues("recordStatus");
        String requisitionNo = request.getParameter("reqNo");
        if (requisitionNo == null) {
            for (int i = 0; i < pk.length; i++) {
                String recordStatus = request.getParameter("case" + pk[i]);
                purchDAO.revAppSubmit(pk[i], userId, reviewerComments, recordStatus, formatter4.format(today));

            }
        } else {
            purchDAO.recheckUpdate(requisitionNo, reviewerComments, reviewerRecordStatus);
        }
        modelMap.addAttribute("purchReqList", purchDAO.reviewList(userId, orgId, null));
        modelMap.addAttribute("message", "Data Saved Successfully...");
        return new ModelAndView(new RedirectView("RequiApproveList.htm"), modelMap);//RequiApproveList.htm
//        return new ModelAndView("../purchRequi/RequiApproveList", modelMap);

    }

    @RequestMapping("/purchase/RequiApprove2List.htm")
    public ModelAndView RequiApprove2List(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        modelMap.addAttribute("purchReqList", purchDAO.storeRevList(userId, orgId, null));
        /*ModelMap map = new ModelMap();
         HttpSession session = request.getSession();
         String orgId = session.getAttribute("orgId").toString();
         String userId = session.getAttribute("userId").toString();
         String roleName = session.getAttribute("userRole").toString();
         String tabName = "Approval 1";
         String submoduleName = "Purchase Requisition";
         map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
         map.addAttribute("purchRequi", purchDAO.requiList1(userId, orgId, null, "AM APPROVED"));*/
        return new ModelAndView("../purchRequi/RequiApprove2List", modelMap);
    }

    @RequestMapping("/purchase/RequiApprove2Form.htm")
    public ModelAndView RequiApprove2Form(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession();
        String requisitionNo = request.getParameter("requisitionNo");
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String link = "../purchase/purchaseRequiForm.htm";
        String tab = "Purchase Requisition";

        modelMap.addAttribute("purchase", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("approvList", purchDAO.requiApprovList(userId, orgId, requisitionNo));
        modelMap.addAttribute("assetCode", purchDAO.list("", "AssetDetails"));
        modelMap.addAttribute("subAssetCode", purchDAO.list("", "SubAssetDetails"));
        modelMap.addAttribute("itemCod", purchDAO.itemCod(null, null));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../purchRequi/RequiApprove2Form", modelMap);
    }

    @RequestMapping("/purchase/RequiApprov2Submit.htm")
    public ModelAndView RequiApprov2Submit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException, MessagingException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk[] = request.getParameterValues("pk");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        String status[] = request.getParameterValues("status");
        String reviewerComments2 = request.getParameter("reviewerComments2");
        String reviewerRecordStatus = request.getParameter("reviewerRecordStatus");
        String requisitionNo = request.getParameter("requisitionNo");
        if (!reviewerRecordStatus.equals("RECHECK")) {
            purchDAO.approv2Update(requisitionNo, reviewerComments2, "GFC APPROVED");
            modelMap.addAttribute("approvList", purchDAO.requiApprovList(userId, orgId, requisitionNo));
            modelMap.addAttribute("purchRequi", purchDAO.requiList1(userId, orgId, null, "AM APPROVED"));
        }
        if (reviewerRecordStatus.equalsIgnoreCase("RECHECK")) {
            purchDAO.recheck1Update(requisitionNo, reviewerComments2, reviewerRecordStatus);

            modelMap.addAttribute("purchRequi", purchDAO.requiList1(userId, orgId, null, "AM APPROVED"));
        }
        //            for attachment
        String attachSno[] = request.getParameterValues("attachSno");
        String attachSnoFull[] = request.getParameterValues("attachSnoFull");
        List<String> attach1 = new ArrayList<String>();
        List<String> attach2 = new ArrayList<String>();
        if (attachSno != null && attachSnoFull != null) {
            for (int at = 0; at < attachSno.length; at++) {
                attach1.add(attachSno[at]);
            }
            for (int at1 = 0; at1 < attachSnoFull.length; at1++) {
                attach2.add(attachSnoFull[at1]);
            }
            List<String> unionat = new ArrayList<String>(attach1);
            unionat.addAll(attach2);
            List<String> intersection = new ArrayList<String>(attach1);
            intersection.retainAll(attach2);
            unionat.removeAll(intersection);
            for (String nA : unionat) {
                try {
                    purchDAO.requiattachmentDelete(Integer.parseInt(nA));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } else {
            if (attachSno == null && attachSnoFull != null) {
                try {
                    purchDAO.requiattachmentDelete(Integer.parseInt(attachSnoFull[0]));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
//        end

        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        List<MultipartFile> multipartFile = multipartRequest.getFiles("attachmentReference");
        int x = 0;
        for (Iterator<MultipartFile> iterator = multipartFile.iterator(); iterator.hasNext();) {
            MultipartFile test = (MultipartFile) iterator.next();
            if (test.getBytes().length > 0) {
                RequiAttach attach = new RequiAttach(test.getBytes(), test.getContentType(), timestamp, test.getOriginalFilename(), timestamp, orgId, "update0", userId, requisitionNo);
                //requiattach.add(attach);

                purchDAO.requiAttachSave(attach);
                x++;
            }
        }

        Common cm = new Common();
        String subject = "", tbody = "", mailbody = "", email = "", fileName = "", contraCod = "", ContractTerm = "", propertyCod = "";
        String userEmail = "excelarete@gmail.com";
        String password = "excel123";
        String toEmail = "";
        List<UserRegistration> ud = tenantDetailsDAO.udList("CFO");
        for (UserRegistration udlist : ud) {
            userId = udlist.getUserId();
            email = udlist.getEmail();

            if (!userEmail.isEmpty() && !password.isEmpty() && !email.isEmpty()) {
                List<PurchRequisition> td = purchDAO.tdList(userId, orgId, requisitionNo);
                StringBuilder emailId = new StringBuilder(email);
                if (td.size() > 0) {
                    int i = 1;
                    for (PurchRequisition tdlist : td) {

                        requisitionNo = tdlist.getRequisitionNo();

                    }
                    emailId.append(",");
                    emailId.append(toEmail);
                    String[] sendEmail = emailId.toString().split(",");
                    subject = "Requisition No: " + requisitionNo;
                    String filepath = request.getSession().getServletContext().getRealPath("common\\theme\\images\\logo1.png");
                    mailbody = "<html><body>Dear Sir/Madam,<br/><br/><br/>You need to give an approval for Requisition Details. Requisition No : " + requisitionNo + " "
                            + " Please Approve this Requisition Details. <br/><br/>If approved ignore this mail. "
                            + "</body>"
                            + "<br/><br/>Thanks & Regards"
                            + "<br/>Al-Hashar Team.</html>";
                    ByteArrayOutputStream baos = new ByteArrayOutputStream();
                    baos.close();
                    cm.sendEmail(userEmail, password, sendEmail, subject, mailbody, baos, fileName);
                }
            }
        }
        modelMap.addAttribute("message", "Data Saved Successfully...");
        return new ModelAndView(new RedirectView("../purchase/RequiApprove2List.htm"), modelMap);
//        return new ModelAndView("../purchRequi/RequiApprove2List", modelMap);

    }

    @RequestMapping("/purchase/RequiApprove3List.htm")
    public ModelAndView RequiApprove3List(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Approval 2";
        String submoduleName = "Purchase Requisition";
        map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        map.addAttribute("purchRequi", purchDAO.requiList2(userId, orgId, null, "GFC APPROVED"));
        return new ModelAndView("../purchRequi/RequiApprove3List", map);
    }

    @RequestMapping("/purchase/RequiApprove3Form.htm")
    public ModelAndView RequiApprove3Form(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession();
        String requisitionNo = request.getParameter("requisitionNo");
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String link = "../purchase/purchaseRequiForm.htm";
        String tab = "Purchase Requisition";

        modelMap.addAttribute("purchase", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("approvList", purchDAO.requiApprovList(userId, orgId, requisitionNo));
        modelMap.addAttribute("assetCode", purchDAO.list("", "AssetDetails"));
        modelMap.addAttribute("subAssetCode", purchDAO.list("", "SubAssetDetails"));
        modelMap.addAttribute("itemCod", purchDAO.itemCod(null, null));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../purchRequi/RequiApprove3Form", modelMap);
    }

    @RequestMapping("/purchase/RequiApprov3Submit.htm")
    public ModelAndView RequiApprov3Submit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk[] = request.getParameterValues("pk");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        String status[] = request.getParameterValues("status");
        String reviewerComments3 = request.getParameter("reviewerComments3");
        String reviewerRecordStatus = request.getParameter("reviewerRecordStatus");
        String requisitionNo = request.getParameter("requisitionNo");
        purchDAO.approv3Update(requisitionNo, reviewerComments3, "CFO APPROVED");
        modelMap.addAttribute("approvList", purchDAO.requiApprovList(userId, orgId, requisitionNo));
        modelMap.addAttribute("purchRequi", purchDAO.requiList2(userId, orgId, null, "GFC APPROVED"));
        //            for attachment
        String attachSno[] = request.getParameterValues("attachSno");
        String attachSnoFull[] = request.getParameterValues("attachSnoFull");
        List<String> attach1 = new ArrayList<String>();
        List<String> attach2 = new ArrayList<String>();
        if (attachSno != null && attachSnoFull != null) {
            for (int at = 0; at < attachSno.length; at++) {
                attach1.add(attachSno[at]);
            }
            for (int at1 = 0; at1 < attachSnoFull.length; at1++) {
                attach2.add(attachSnoFull[at1]);
            }
            List<String> unionat = new ArrayList<String>(attach1);
            unionat.addAll(attach2);
            List<String> intersection = new ArrayList<String>(attach1);
            intersection.retainAll(attach2);
            unionat.removeAll(intersection);
            for (String nA : unionat) {
                try {
                    purchDAO.requiattachmentDelete(Integer.parseInt(nA));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } else {
            if (attachSno == null && attachSnoFull != null) {
                try {
                    purchDAO.requiattachmentDelete(Integer.parseInt(attachSnoFull[0]));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
//        end

        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        List<MultipartFile> multipartFile = multipartRequest.getFiles("attachmentReference");
        int x = 0;
        for (Iterator<MultipartFile> iterator = multipartFile.iterator(); iterator.hasNext();) {
            MultipartFile test = (MultipartFile) iterator.next();
            if (test.getBytes().length > 0) {
                RequiAttach attach = new RequiAttach(test.getBytes(), test.getContentType(), timestamp, test.getOriginalFilename(), timestamp, orgId, "update0", userId, requisitionNo);
                //requiattach.add(attach);

                purchDAO.requiAttachSave(attach);
                x++;
            }
        }

        modelMap.addAttribute("message", "Data Saved Successfully...");
        return new ModelAndView(new RedirectView("../purchase/RequiApprove3List.htm"), modelMap);
//        return new ModelAndView("../purchRequi/RequiApprove3List", modelMap);

    }

    @RequestMapping("/purchase/approvedRequiList.htm")
    public ModelAndView approvedRequiList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        modelMap.addAttribute("purchReqList", purchDAO.appreovedReqList(userId, orgId, null));
        /*ModelMap map = new ModelMap();
         HttpSession session = request.getSession();
         String orgId = session.getAttribute("orgId").toString();
         String userId = session.getAttribute("userId").toString();
         String roleName = session.getAttribute("userRole").toString();
         String tabName = "Approved Requisition";
         String submoduleName = "Purchase Requisition";
         map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
         map.addAttribute("purchRequi", purchDAO.requiList3(userId, orgId, null, "CFO APPROVED"));*/
        return new ModelAndView("../purchRequi/approvedRequiList", modelMap);
    }

    @RequestMapping("/purchase/rejectedRequiList.htm")
    public ModelAndView rejectedRequiList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String reqNo = request.getParameter("reqNo");

        if (reqNo == null) {
            modelMap.addAttribute("purchReqList", purchDAO.rejectedReqList(userId, orgId, null));
            return new ModelAndView("../purchRequi/rejectedRequiList", modelMap);
        } else {
            modelMap.addAttribute("purchReqList", purchDAO.rejectedReqList(userId, orgId, reqNo));
            modelMap.addAttribute("purchDocList", purchDAO.purchDocList(reqNo));
            return new ModelAndView("../purchRequi/rejectedRequiView", modelMap);
        }
        /* ModelMap map = new ModelMap();
         HttpSession session = request.getSession();
         String orgId = session.getAttribute("orgId").toString();
         String userId = session.getAttribute("userId").toString();
         String roleName = session.getAttribute("userRole").toString();
         String tabName = "Rejected Requisition";
         String submoduleName = "Purchase Requisition";
         map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
         map.addAttribute("purchRequi", purchDAO.rejectRequiList1(userId, orgId, null, "REJECTED"));*/
        // return new ModelAndView("../purchRequi/rejectedRequiList", modelMap);
    }

    @RequestMapping("/purchase/rejectedRequiView.htm")
    public ModelAndView rejectedRequiView(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession();
        String requisitionNo = request.getParameter("requisitionNo");
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String link = "../purchase/purchaseRequiForm.htm";
        String tab = "Purchase Requisition";
        modelMap.addAttribute("purchase", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("approvList", purchDAO.requiApprovList(userId, orgId, requisitionNo));
        modelMap.addAttribute("assetCode", purchDAO.list("", "AssetDetails"));
        modelMap.addAttribute("subAssetCode", purchDAO.list("", "SubAssetDetails"));
        modelMap.addAttribute("itemCod", purchDAO.itemCod(null, null));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../purchRequi/rejectedRequiView", modelMap);
    }
//reject pr

    @RequestMapping("/purchase/rejectedRequiSubmit.htm")
    public ModelAndView rejectedRequiSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String requisitionNo = request.getParameter("reqNo");
        String reviewerRecordStatus = request.getParameter("reviewerRecordStatus");
        String reviewerComments1 = request.getParameter("reviewerComments1");
        String reviewerComments2 = request.getParameter("reviewerComments2");
        String reviewerComments3 = request.getParameter("reviewerComments3");
        if (reviewerComments1 != null) {
            purchDAO.reject1Update(requisitionNo, reviewerComments1, reviewerRecordStatus);
        } else if (reviewerComments2 != null) {
            purchDAO.reject2Update(requisitionNo, reviewerComments2, reviewerRecordStatus);
        } else if (reviewerComments3 != null) {
            purchDAO.reject3Update(requisitionNo, reviewerComments3, reviewerRecordStatus);
        }
        map.addAttribute("purchRequi", purchDAO.rejectRequiList1(userId, orgId, null, "REJECTED"));
        return new ModelAndView(new RedirectView("../purchase/rejectedRequiList.htm"), map);
//        return new ModelAndView("../purchRequi/rejectedRequiList", map);
    }

    @RequestMapping("/purchase/recheckRequiSubmit.htm")
    public ModelAndView recheckRequiSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String requisitionNo = request.getParameter("reqNo");
        String reviewerRecordStatus = request.getParameter("reviewerRecordStatus");
        String reviewerComments2 = request.getParameter("reviewerComments2");
        purchDAO.recheck1Update(requisitionNo, reviewerComments2, reviewerRecordStatus);

        map.addAttribute("purchRequi", purchDAO.requiList1(userId, orgId, null, "AM APPROVED"));
        return new ModelAndView(new RedirectView("../purchase/RequiApprove2List.htm"), map);
//        return new ModelAndView("../purchRequi/RequiApprove2List", map);
    }

    //--------------------------------Purchase Order-------------------------------------------//
    //po form
    @RequestMapping("/purchase/poForm.htm")
    public ModelAndView poForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession();
        String requisitionNo = request.getParameter("requisitionNo");
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String link = "../purchase/poForm.htm";
        String tab = "Purchase Order";
        if (requisitionNo != null && !requisitionNo.isEmpty()) {
            modelMap.addAttribute("purchase", userDAO.formLabelMapping(link, tab));
            modelMap.addAttribute("purchList", purchDAO.list(sno, "PurchaseOrder"));
            modelMap.addAttribute("approvList", purchDAO.requiApprovList(userId, orgId, requisitionNo));
            modelMap.addAttribute("assetCode", purchDAO.list("", "AssetDetails"));
            modelMap.addAttribute("subAssetCode", purchDAO.list("", "SubAssetDetails"));
            modelMap.addAttribute("itemCod", purchDAO.itemCod(null, null));
            modelMap.addAttribute("itemCat", purchDAO.list("", "ItemCategory"));
            modelMap.addAttribute("uom", purchDAO.list("", "UomMaster"));
        }
        modelMap.addAttribute("purchase", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("approvList", purchDAO.requiApprovList(userId, orgId, requisitionNo));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../purchOrder/poForm", modelMap);
    }

    //direct po form
    @RequestMapping("/purchase/directPOForm.htm")
    public ModelAndView directPOForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String userDiv = session.getAttribute("userDiv").toString();
        int year = Calendar.getInstance().get(Calendar.YEAR);

        String SNo = request.getParameter("sno");
        ArrayList validuser = (ArrayList) purchDAO.poCodeinc(userId, orgId, null, null, "1");
        String orderNoFinal = null;
        String poNo = null;
        String joNo = null;
        String pono1[] = null;
        int num = 1;
        if (!validuser.isEmpty()) {
//            for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
//                if (iter.next() != null) {
//                    Iterator<String> iter2 = validuser.iterator();
//                    iter2.hasNext();
//                    orderNoFinal = String.valueOf(iter2.next());
//                }             
//            }
              for (Iterator<PurchaseOrder> iter = validuser.iterator(); iter.hasNext();) {
                    orderNoFinal = iter.next().getPurchaseOrderNo();
              }
          //  poNo = orderNoFinal;
        }
        if (orderNoFinal != null) {
            pono1 = orderNoFinal.split("-");
            num = Integer.parseInt(pono1[1]) + 1;
        }
//        if (poNo != null) {
//            num = Integer.parseInt(poNo) + 1;
//        }
//        poNo = "PO" + year + "-" + num;
        poNo = "PO" + year + "-" + num;
        joNo = "JO" + year + "-" + num;
        modelMap.addAttribute("poNo", poNo);
        modelMap.addAttribute("joNo", joNo);
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));

        //need to check modelMap.addAttribute("itemcategoryList", itemDao.itemcategoryList(userId, orgId, null));
        modelMap.addAttribute("poList", purchDAO.poNoList(userId, orgId, poNo, null));
        modelMap.addAttribute("supplierList", purchDAO.supplierReqList(null, "Approved"));
        modelMap.addAttribute("currencyList", purchDAO.currencyList(null));
        modelMap.addAttribute("store", purchDAO.storeMasterdivisionwise(userDiv));
        modelMap.addAttribute("costCenterList", purchDAO.costCenterList(null));
        modelMap.addAttribute("paytermslist", purchDAO.TermsList(null, "Payment"));
        modelMap.addAttribute("delivtermslist", purchDAO.TermsList(null, "Delivery"));
        modelMap.addAttribute("itemcategoryList", purchDAO.itemcategoryList());
        /*ModelMap modelMap = new ModelMap();
         String sno = request.getParameter("pk");
         HttpSession session = request.getSession();
         String requisitionNo = request.getParameter("requisitionNo");
         String orgId = session.getAttribute("orgId").toString();
         String userId = session.getAttribute("userId").toString();
         String link = "../purchase/poForm.htm";
         String tab = "Purchase Order";
         if (requisitionNo != null && !requisitionNo.isEmpty()) {
         modelMap.addAttribute("purchase", userDAO.formLabelMapping(link, tab));
         modelMap.addAttribute("purchList", purchDAO.list(sno, "PurchaseOrder"));
         modelMap.addAttribute("approvList", purchDAO.requiApprovList(userId, orgId, requisitionNo));
         }
         modelMap.addAttribute("purchase", userDAO.formLabelMapping(link, tab));
         modelMap.addAttribute("approvList", purchDAO.requiApprovList(userId, orgId, requisitionNo));

         modelMap.addAttribute("action", request.getParameter("action"));*/
        return new ModelAndView("../purchOrder/directPOForm", modelMap);
    }

    //po View form
    @RequestMapping("/purchase/directPOView.htm")
    public ModelAndView directPOView(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession();
        String poNo = request.getParameter("poNo");
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String link = "../purchase/poForm.htm";
        String tab = "Purchase Order";
        modelMap.addAttribute("purchase", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("approvList", purchDAO.list1(poNo, "PurchaseOrder"));
        modelMap.addAttribute("supp", purchDAO.list("", "SupplierMaster"));
        modelMap.addAttribute("asset", purchDAO.list("", "AssetDetails"));
        modelMap.addAttribute("subasset", purchDAO.list("", "SubAssetDetails"));
        modelMap.addAttribute("itemCat", purchDAO.list("", "ItemCategory"));
        modelMap.addAttribute("uom", purchDAO.list("", "UomMaster"));
        modelMap.addAttribute("item", purchDAO.list("", "ItemMaster"));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../purchOrder/directPOView", modelMap);
    }
    
    @RequestMapping("/purchase/purchaseOrderView.htm")
    public ModelAndView purchaseOrderView(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession();
        String poNo = request.getParameter("poNo");
        
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        
        modelMap.addAttribute("poListView", purchDAO.poListView(sno));
        
        modelMap.addAttribute("poItemDescListView", purchDAO.poItemDescListView(poNo));
        
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../purchOrder/purchaseOrderView", modelMap);
    }

    // Purchase Requi Edit Form
    @RequestMapping("/purchase/poEditForm.htm")
    public ModelAndView poEditForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String poNo = request.getParameter("poNo");
        String storeName = null, storeAddress = null, divisionName = null;

        String action = request.getParameter("action");
        List<PurchaseOrder> gridData = new ArrayList<PurchaseOrder>();
        List<PurchaseOrder> groupPOlsit = new ArrayList<PurchaseOrder>();
        List<StoreMaster> storeList = new ArrayList<StoreMaster>();
//        Set<String> purset = new HashSet<String>();

        groupPOlsit.addAll(purchDAO.groupPOList(userId, orgId, poNo));
        modelMap.addAttribute("reqNoList", groupPOlsit);
        modelMap.addAttribute("supplierList", purchDAO.supplierReqList(null, "Approved"));
        modelMap.addAttribute("currencyList", purchDAO.currencyList(null));
        if (action != null && action.equalsIgnoreCase("View")) {
            gridData.addAll(purchDAO.poNoList(userId, orgId, poNo, null));

//            for (PurchaseOrder purset1 : gridData) {
//                purset.add(purset1.getPrNo());
//            }
            modelMap.addAttribute("poList", gridData);
            return new ModelAndView("../purchOrder/poViewForm", modelMap);
        }
        if (action != null && action.equalsIgnoreCase("print")) {

            gridData.addAll(purchDAO.poNoList(userId, orgId, poNo, null));

            for (PurchaseOrder purset1 : gridData) {
                storeName = purset1.getShipToLocation();
                divisionName = purset1.getDivisionName();
                break;
            }
            storeList = purchDAO.storeMasterdivisionwise(storeName, divisionName);
            for (StoreMaster store : storeList) {
                if (store.getAddress() != null) {
                    storeAddress = store.getAddress();
                }
                break;
            }
            modelMap.addAttribute("storeAddress", storeAddress);
//            modelMap.addAttribute("reqNoList", purset);
            modelMap.addAttribute("subgrouplist", userDAO.subgrouplist(null));
            modelMap.addAttribute("poList", gridData);
            return new ModelAndView("../purchOrder/printPO", modelMap);
        }
        gridData.addAll(purchDAO.poNoList(userId, orgId, poNo, "PO Created"));
//        for (PurchaseOrder purset1 : gridData) {
//            purset.add(purset1.getPrNo());
//        }
//        modelMap.addAttribute("reqNoList", purset);
        modelMap.addAttribute("costCenterList", purchDAO.costCenterList(null));
        modelMap.addAttribute("poList", gridData);
        modelMap.addAttribute("paytermslist", purchDAO.TermsList(null, "Payment"));
        modelMap.addAttribute("delivtermslist", purchDAO.TermsList(null, "Delivery"));
        /*ModelMap modelMap = new ModelMap();
         String sno = request.getParameter("pk");
         String poNo = request.getParameter("poNo");
         HttpSession session = request.getSession();
         String orgId = session.getAttribute("orgId").toString();
         String requisitionNo = request.getParameter("requisitionNo");
         String userId = session.getAttribute("userId").toString();
         String link = "../purchase/poForm.htm";
         String tab = "Purchase Order";
         modelMap.addAttribute("purchase", userDAO.formLabelMapping(link, tab));
         modelMap.addAttribute("approvList", purchDAO.list1(poNo, "PurchaseOrder"));
         modelMap.addAttribute("approvList1", purchDAO.requiApprovList(userId, orgId, requisitionNo));
         modelMap.addAttribute("supp", purchDAO.list("", "SupplierMaster"));
         modelMap.addAttribute("item", purchDAO.list("", "ItemMaster"));
         modelMap.addAttribute("itemCat", purchDAO.list("", "ItemCategory"));
         modelMap.addAttribute("uom", purchDAO.list("", "UomMaster"));
         modelMap.addAttribute("action", request.getParameter("action"));*/
        return new ModelAndView("../purchOrder/poEditForm", modelMap);
    }

    @RequestMapping("/purchase/additionalDocumentsForm1.htm")
    public ModelAndView additionalDocumentsForm1(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String poNo = request.getParameter("poNo");
        map.addAttribute("action", request.getParameter("action"));
        map.addAttribute("requiDocument", purchDAO.PurchAttachlist(poNo));
        map.addAttribute("fileSize", userDAO.fileSize());
        return new ModelAndView("../purchOrder/additionalDocumentsForm1", map);
    }

    //po View form
    @RequestMapping("/purchase/poViewForm.htm")
    public ModelAndView poViewForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession();
        String poNo = request.getParameter("poNo");
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String link = "../purchase/poForm.htm";
        String tab = "Purchase Order";
        modelMap.addAttribute("purchase", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("approvList", purchDAO.list1(poNo, "PurchaseOrder"));
        modelMap.addAttribute("supp", purchDAO.list("", "SupplierMaster"));
        modelMap.addAttribute("item", purchDAO.list("", "ItemMaster"));
        modelMap.addAttribute("itemCat", purchDAO.list("", "ItemCategory"));
        modelMap.addAttribute("uom", purchDAO.list("", "UomMaster"));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../purchOrder/poViewForm", modelMap);
    }

    // Purchase Requi Edit Form
    @RequestMapping("/purchase/directPOEdit.htm")
    public ModelAndView directPOEdit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        String poNo = request.getParameter("poNo");
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String link = "../purchase/poForm.htm";
        String tab = "Purchase Order";
        modelMap.addAttribute("purchase", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("approvList", purchDAO.list1(poNo, "PurchaseOrder"));
        modelMap.addAttribute("supp", purchDAO.list("", "SupplierMaster"));
        modelMap.addAttribute("asset", purchDAO.list("", "AssetDetails"));
        modelMap.addAttribute("subasset", purchDAO.list("", "SubAssetDetails"));
        modelMap.addAttribute("itemCat", purchDAO.list("", "ItemCategory"));
        modelMap.addAttribute("uom", purchDAO.list("", "UomMaster"));
        modelMap.addAttribute("item", purchDAO.list("", "ItemMaster"));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../purchOrder/directPOEdit", modelMap);
    }

    @RequestMapping("/purchase/selectSupplier.htm")
    public ModelAndView selectSupplier(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        modelMap.addAttribute("suppList", purchDAO.list("", "SupplierMaster"));
        return new ModelAndView("../purchOrder/selectSupplier", modelMap);
    }

    @RequestMapping("/purchase/selectSupplier1.htm")
    public ModelAndView selectSupplier1(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        modelMap.addAttribute("suppList", purchDAO.suppQuot());
        return new ModelAndView("../purchOrder/selectSupplier1", modelMap);
    }

    /*@RequestMapping("/purchase/purchaseOrderSubmit.htm")
     public ModelAndView purchaseOrderSubmit(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException, MessagingException {
     String pk = request.getParameter("pk");
     String sno[] = request.getParameterValues("sno");
     HttpSession session = request.getSession();
     String userId = session.getAttribute("userId").toString();
     String orgId = session.getAttribute("orgId").toString();
     String poNo = request.getParameter("poNo");
     String requisitionNo = request.getParameter("requisitionNo");
     String reqDate = request.getParameter("reqDate");
     String poDate = request.getParameter("poDate");
     String requiredDate = request.getParameter("requiredDate");
     String deliveryLoc = request.getParameter("deliveryLoc");
     String billToLoc = request.getParameter("billToLoc");
     String supplierCode = request.getParameter("supplierCode");
     String paymentTerms = request.getParameter("paymentTerms");
     String delvryTerms = request.getParameter("delvryTerms");
     String status = request.getParameter("status");
     String itemCode[] = request.getParameterValues("itemCode");
     String qty[] = request.getParameterValues("qty");
     String price[] = request.getParameterValues("price");
     String totalPrice[] = request.getParameterValues("totalPrice");
     String recordStatus = request.getParameter("recordStatus");
     String assetCode = request.getParameter("assetCode");
     String remarks = request.getParameter("remarks");
     String subAssetCode = request.getParameter("subAssetCode");
     String SuppType = request.getParameter("SuppType");
     String attribute1 = request.getParameter("attribute1");
     String attribute2 = request.getParameter("attribute2");
     String attribute3 = request.getParameter("attribute3");
     String attribute4 = request.getParameter("attribute4");
     String attribute5 = request.getParameter("attribute5");
     String lastmodifiedDate = request.getParameter("lastmodifiedDate");
     String action = request.getParameter("action");
     String deleteRows = request.getParameter("deleteRows");
     Date reqDate1 = null;
     Date poDate1 = null;
     Date requiredDate1 = null;

     java.util.Date today = new java.util.Date();
     java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
     List<PurchaseOrder> gridData = new ArrayList<PurchaseOrder>();

     if (poNo.isEmpty()) {

     ArrayList validuser = (ArrayList) purchDAO.POAutoGen(null, poNo, null);
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

     poNo = "PO" + "-" + ordno;
     }

     if (action != null && !action.isEmpty()) {
     if (action.equalsIgnoreCase("recheck")) {
     String str[] = poNo.split("-");
     if (str.length > 2) {
     int i = Integer.parseInt(str[3]);
     i = i + 1;
     poNo = str[0] + "-" + str[1] + "-" + str[2] + "-" + i;
     } else {
     poNo = poNo + "-REV" + "-" + 1;
     }

     String attachSno1[] = request.getParameterValues("attachSno");
     //String attachSno2 = request.getParameter("attachSno");
     if (attachSno1 != null) {

     for (int at = 0; at < attachSno1.length; at++) {
     purchDAO.poAttachRecheckUpdate(attachSno1[at], poNo);
     }
     }
     }

     }

     if (!"".equals(poDate)) {
     poDate1 = (Date) formatter.parse(poDate);
     }
     if (!"".equals(requiredDate)) {
     requiredDate1 = (Date) formatter.parse(requiredDate);
     }

     for (int i = 0; i < itemCode.length; i++) {

     if (!"".equals(sno[i])) {

     System.out.println("inside method      ************************");
     if (requisitionNo == null) {

     if (deleteRows.trim().length() != 0) {
     String out[] = deleteRows.split("//");
     for (int j = 0; j < out.length; j++) {
     purchDAO.PoGridDataDelete(Integer.parseInt(out[j]));
     }
     }
     PurchaseOrder directPO = new PurchaseOrder(Integer.parseInt(sno[i]), orgId, userId, poNo, poDate1, requiredDate1, deliveryLoc, billToLoc, SuppType, supplierCode, paymentTerms, delvryTerms, itemCode[i], qty[i], price[i], totalPrice[i], remarks, "PO Generated", status, attribute1, assetCode, subAssetCode, timestamp);
     purchDAO.globalSave(directPO);

     } else {
     PurchaseOrder polist = new PurchaseOrder(Integer.parseInt(sno[i]), orgId, userId, poNo, reqDate1, poDate1, requisitionNo, requiredDate1, deliveryLoc, billToLoc, SuppType, supplierCode, paymentTerms, delvryTerms, itemCode[i], qty[i], price[i], totalPrice[i], remarks, "PO Generated", "update0", timestamp);
     purchDAO.globalSave(polist);
     }
     purchDAO.PRUpdate(requisitionNo, recordStatus);

     } else {
     if (requisitionNo == null) {
     PurchaseOrder directPO = new PurchaseOrder(orgId, userId, poNo, poDate1, requiredDate1, deliveryLoc, billToLoc, SuppType, supplierCode, paymentTerms, delvryTerms, itemCode[i], qty[i], price[i], totalPrice[i], remarks, "PO Generated", "update0", attribute1, assetCode, subAssetCode, timestamp, timestamp);
     purchDAO.globalSave(directPO);

     } else {
     PurchaseOrder poList = new PurchaseOrder(orgId, userId, poNo, requisitionNo, reqDate1, poDate1, requiredDate1, deliveryLoc, billToLoc, SuppType, supplierCode, paymentTerms, delvryTerms, itemCode[i], qty[i], price[i], totalPrice[i], remarks, "PO Generated", "update0", timestamp);
     purchDAO.globalSave(poList);
     }
     purchDAO.PRUpdate(requisitionNo, recordStatus);

     }

     }

     if (action == "" || action == null || "".equals(action) || action.isEmpty()) {
     List<RequiAttach> attach = purchDAO.RequiAttachlist(requisitionNo);

     Iterator iter = attach.iterator();

     while (iter.hasNext()) {
     RequiAttach r = (RequiAttach) iter.next();

     PurchAttach p = new PurchAttach(r.getContent(), r.getContentType(), poNo,
     timestamp, r.getFilename(), timestamp,
     orgId, status, userId);

     purchDAO.poAttachSave(p);
     }

     }
     //            for attachment
     String attachSno[] = request.getParameterValues("attachSno");
     String attachSnoFull[] = request.getParameterValues("attachSnoFull");
     List<String> attach1 = new ArrayList<String>();
     List<String> attach2 = new ArrayList<String>();
     if (attachSno != null && attachSnoFull != null) {
     for (int at = 0; at < attachSno.length; at++) {
     attach1.add(attachSno[at]);
     }
     for (int at1 = 0; at1 < attachSnoFull.length; at1++) {
     attach2.add(attachSnoFull[at1]);
     }
     List<String> unionat = new ArrayList<String>(attach1);
     unionat.addAll(attach2);
     List<String> intersection = new ArrayList<String>(attach1);
     intersection.retainAll(attach2);
     unionat.removeAll(intersection);
     for (String nA : unionat) {
     try {
     purchDAO.requiattachmentDelete(Integer.parseInt(nA));
     } catch (Exception e) {
     e.printStackTrace();
     }
     }
     } else {
     if (attachSno == null && attachSnoFull != null) {
     try {
     purchDAO.requiattachmentDelete(Integer.parseInt(attachSnoFull[0]));
     } catch (Exception e) {
     e.printStackTrace();
     }
     }
     }
     //        end

     MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
     List<MultipartFile> multipartFile = multipartRequest.getFiles("attachmentReference");
     int x = 0;
     for (Iterator<MultipartFile> iterator = multipartFile.iterator(); iterator.hasNext();) {
     MultipartFile test = (MultipartFile) iterator.next();
     if (test.getBytes().length > 0) {
     PurchAttach attach5 = new PurchAttach(test.getBytes(), test.getContentType(), poNo, timestamp, test.getOriginalFilename(), timestamp, orgId, "update0", userId);
     //requiattach.add(attach);

     purchDAO.POAttachSave(attach5);
     x++;
     }
     }

     ModelMap modelMap = new ModelMap();
     return new ModelAndView(new RedirectView("../purchase/poList.htm"), modelMap);
     }*/
    @RequestMapping("/purchase/poList.htm")
    public ModelAndView poList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        if (fromDate != null && toDate != null) {
            if (fromDate.contains("frdate") && toDate.contains("todate")) {
                fromDate = null;
                toDate = null;
            }
        }
        if (fromDate == null || fromDate == "" || toDate == null || toDate == "") {
            modelMap.addAttribute("poList", purchDAO.poList4(userId, orgId, null, null));
        } else {
            modelMap.addAttribute("poList", purchDAO.poList41(userId, orgId, null, null, fromDate, toDate));
        }
        //return new ModelAndView("poList", modelMap);
        /*ModelMap map = new ModelMap();
         HttpSession session = request.getSession();
         String orgId = session.getAttribute("orgId").toString();
         String userId = session.getAttribute("userId").toString();
         String roleName = session.getAttribute("userRole").toString();
         String tabName = "Purchase Order";
         String submoduleName = "Purchase Order";
         map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
         map.addAttribute("purchOrder", purchDAO.polist("", "PurchaseOrder"));
         map.addAttribute("supp", purchDAO.list("", "SupplierMaster"));*/
        return new ModelAndView("../purchOrder/poList", modelMap);
    }

    @RequestMapping("/purchase/POApproveForm.htm")
    public ModelAndView POApproveForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String poNo = request.getParameter("poNo");
        List<PurchaseOrder> gridData = new ArrayList<PurchaseOrder>();
        List<PurchaseOrder> groupPOlsit = new ArrayList<PurchaseOrder>();
//        Set<String> purset = new HashSet<String>();

        groupPOlsit.addAll(purchDAO.groupPOList(userId, orgId, poNo));

        gridData.addAll(purchDAO.poNoList(userId, orgId, poNo, "PO Created"));
//        for (PurchaseOrder purset1 : gridData) {
//            purset.add(purset1.getPrNo());
//        }
//        modelMap.addAttribute("reqNoList", purset);
        modelMap.addAttribute("reqNoList", groupPOlsit);
        modelMap.addAttribute("poList", gridData);
        modelMap.addAttribute("supplierList", purchDAO.supplierReqList(null, "Approved"));
        modelMap.addAttribute("currencyList", purchDAO.currencyList(null));
        /*ModelMap modelMap = new ModelMap();
         String sno = request.getParameter("pk");
         HttpSession session = request.getSession();
         String poNo = request.getParameter("poNo");
         String orgId = session.getAttribute("orgId").toString();
         String userId = session.getAttribute("userId").toString();
         String link = "../purchase/poForm.htm";
         String tab = "Purchase Order";
         modelMap.addAttribute("purchase", userDAO.formLabelMapping(link, tab));
         modelMap.addAttribute("approvList", purchDAO.POApprovList(userId, orgId, poNo));
         modelMap.addAttribute("supp", purchDAO.list("", "SupplierMaster"));
         modelMap.addAttribute("item", purchDAO.list("", "ItemMaster"));
         modelMap.addAttribute("itemCat", purchDAO.list("", "ItemCategory"));
         modelMap.addAttribute("uom", purchDAO.list("", "UomMaster"));
         modelMap.addAttribute("action", request.getParameter("action"));*/
        return new ModelAndView("../purchOrder/POApproveForm", modelMap);
    }

    @RequestMapping("/purchase/POApproveList.htm")
    public ModelAndView POApproveList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {

        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        modelMap.addAttribute("poList", purchDAO.poList4(userId, orgId, null, "PO Created"));
        /*ModelMap map = new ModelMap();
         HttpSession session = request.getSession();
         String orgId = session.getAttribute("orgId").toString();
         String userId = session.getAttribute("userId").toString();
         String roleName = session.getAttribute("userRole").toString();
         String tabName = "Account Manager Approval";
         String submoduleName = "Purchase Order";
         map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
         map.addAttribute("purchOrder", purchDAO.poList(userId, orgId, null, "PO Generated"));*/
        return new ModelAndView("../purchOrder/POApproveList", modelMap);
    }

    /*@RequestMapping("/purchase/POApprovSubmit.htm")
     public ModelAndView POApprovSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException, MessagingException {
     ModelMap modelMap = new ModelMap();
     HttpSession session = request.getSession(true);
     String userId = session.getAttribute("userId").toString();
     String orgId = session.getAttribute("orgId").toString();
     String pk[] = request.getParameterValues("pk");
     String status[] = request.getParameterValues("status");
     String reviewerComments1 = request.getParameter("reviewerComments1");
     String reviewerRecordStatus = request.getParameter("reviewerRecordStatus");
     String poNo = request.getParameter("poNo");
     purchDAO.poApprovUpdate(poNo, reviewerComments1, "AM APPROVED");
     java.util.Date today = new java.util.Date();
     java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());

     //            for attachment
     String attachSno[] = request.getParameterValues("attachSno");
     String attachSnoFull[] = request.getParameterValues("attachSnoFull");
     List<String> attach1 = new ArrayList<String>();
     List<String> attach2 = new ArrayList<String>();
     if (attachSno != null && attachSnoFull != null) {
     for (int at = 0; at < attachSno.length; at++) {
     attach1.add(attachSno[at]);
     }
     for (int at1 = 0; at1 < attachSnoFull.length; at1++) {
     attach2.add(attachSnoFull[at1]);
     }
     List<String> unionat = new ArrayList<String>(attach1);
     unionat.addAll(attach2);
     List<String> intersection = new ArrayList<String>(attach1);
     intersection.retainAll(attach2);
     unionat.removeAll(intersection);
     for (String nA : unionat) {
     try {
     purchDAO.requiattachmentDelete(Integer.parseInt(nA));
     } catch (Exception e) {
     e.printStackTrace();
     }
     }
     } else {
     if (attachSno == null && attachSnoFull != null) {
     try {
     purchDAO.requiattachmentDelete(Integer.parseInt(attachSnoFull[0]));
     } catch (Exception e) {
     e.printStackTrace();
     }
     }
     }
     //        end

     MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
     List<MultipartFile> multipartFile = multipartRequest.getFiles("attachmentReference");
     int x = 0;
     for (Iterator<MultipartFile> iterator = multipartFile.iterator(); iterator.hasNext();) {
     MultipartFile test = (MultipartFile) iterator.next();
     if (test.getBytes().length > 0) {
     PurchAttach attach = new PurchAttach(test.getBytes(), test.getContentType(), poNo, timestamp, test.getOriginalFilename(), timestamp, orgId, "update0", userId);
     //requiattach.add(attach);

     purchDAO.POAttachSave(attach);
     x++;
     }
     }
     Common cm = new Common();
     String subject = "", tbody = "", mailbody = "", email = "", fileName = "", contraCod = "", ContractTerm = "", propertyCod = "";
     String userEmail = "excelarete@gmail.com";
     String password = "excel123";
     String toEmail = "";
     List<UserRegistration> ud = tenantDetailsDAO.udList("GFC");
     for (UserRegistration udlist : ud) {
     userId = udlist.getUserId();
     email = udlist.getEmail();

     if (!userEmail.isEmpty() && !password.isEmpty() && !email.isEmpty()) {
     List<PurchaseOrder> td = purchDAO.tdList1(userId, orgId, poNo);
     StringBuilder emailId = new StringBuilder(email);
     if (td.size() > 0) {
     int i = 1;
     for (PurchaseOrder tdlist : td) {

     poNo = tdlist.getPoNo();

     }
     emailId.append(",");
     emailId.append(toEmail);
     String[] sendEmail = emailId.toString().split(",");
     subject = "Purchase Order No: " + poNo;
     String filepath = request.getSession().getServletContext().getRealPath("common\\theme\\images\\logo1.png");
     mailbody = "<html><body>Dear Sir/Madam,<br/><br/><br/>You need to give an approval for Purchase Details. Purchase Order No : " + poNo + " "
     + " Please Approve this Purchase Details. <br/><br/>If approved ignore this mail. "
     + "</body>"
     + "<br/><br/>Thanks & Regards"
     + "<br/>Al-Hashar Team.</html>";
     ByteArrayOutputStream baos = new ByteArrayOutputStream();
     baos.close();
     cm.sendEmail(userEmail, password, sendEmail, subject, mailbody, baos, fileName);
     }
     }
     }
     modelMap.addAttribute("approvList", purchDAO.POApprovList(userId, orgId, poNo));
     modelMap.addAttribute("purchOrder", purchDAO.poList(userId, orgId, null, "PO Generated"));
     modelMap.addAttribute("message", "Data Saved Successfully...");
     return new ModelAndView(new RedirectView("../purchase/POApproveList.htm"), modelMap);
     //        return new ModelAndView("../purchOrder/POApproveList", modelMap);

     }*/
    @RequestMapping("/purchase/POApprove2List.htm")
    public ModelAndView POApprove2List(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        modelMap.addAttribute("poList", purchDAO.poList4(userId, orgId, null, "PM Approved"));
        /*ModelMap map = new ModelMap();
         HttpSession session = request.getSession();
         String orgId = session.getAttribute("orgId").toString();
         String userId = session.getAttribute("userId").toString();
         String roleName = session.getAttribute("userRole").toString();
         String tabName = "Approval 1";
         String submoduleName = "Purchase Order";
         map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
         map.addAttribute("purchOrder", purchDAO.poList1(userId, orgId, null, "AM APPROVED"));*/
        return new ModelAndView("../purchOrder/POApprove2List", modelMap);
    }

    @RequestMapping("/purchase/POApprove2Form.htm")
    public ModelAndView POApprove2Form(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String poNo = request.getParameter("poNo");

        List<PurchaseOrder> gridData = new ArrayList<PurchaseOrder>();

        List<PurchaseOrder> groupPOlsit = new ArrayList<PurchaseOrder>();
//        Set<String> purset = new HashSet<String>();

        groupPOlsit.addAll(purchDAO.groupPOList(userId, orgId, poNo));
        gridData.addAll(purchDAO.poNoList(userId, orgId, poNo, "PM Approved"));
//        for (PurchaseOrder purset1 : gridData) {
//            purset.add(purset1.getPrNo());
//        }
//        modelMap.addAttribute("reqNoList", purset);

        modelMap.addAttribute("reqNoList", groupPOlsit);
        modelMap.addAttribute("poList", gridData);
        modelMap.addAttribute("supplierList", purchDAO.supplierReqList(null, "Approved"));
        modelMap.addAttribute("currencyList", purchDAO.currencyList(null));
        /*ModelMap modelMap = new ModelMap();
         String sno = request.getParameter("pk");
         HttpSession session = request.getSession();
         String poNo = request.getParameter("poNo");
         String orgId = session.getAttribute("orgId").toString();
         String userId = session.getAttribute("userId").toString();
         String link = "../purchase/poForm.htm";
         String tab = "Purchase Order";
         modelMap.addAttribute("purchase", userDAO.formLabelMapping(link, tab));
         modelMap.addAttribute("approvList", purchDAO.poApprovList(userId, orgId, poNo));
         modelMap.addAttribute("supp", purchDAO.list("", "SupplierMaster"));
         modelMap.addAttribute("item", purchDAO.list("", "ItemMaster"));
         modelMap.addAttribute("itemCat", purchDAO.list("", "ItemCategory"));
         modelMap.addAttribute("uom", purchDAO.list("", "UomMaster"));
         modelMap.addAttribute("action", request.getParameter("action"));*/
        return new ModelAndView("../purchOrder/POApprove2Form", modelMap);
    }

    /*@RequestMapping("/purchase/POApprov2Submit.htm")
     public ModelAndView POApprov2Submit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException, MessagingException {
     ModelMap modelMap = new ModelMap();
     HttpSession session = request.getSession(true);
     String userId = session.getAttribute("userId").toString();
     String orgId = session.getAttribute("orgId").toString();
     String pk[] = request.getParameterValues("pk");
     String status[] = request.getParameterValues("status");
     java.util.Date today = new java.util.Date();
     java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
     String reviewerComments2 = request.getParameter("reviewerComments2");
     String reviewerRecordStatus = request.getParameter("reviewerRecordStatus");
     String poNo = request.getParameter("poNo");
     if (!reviewerRecordStatus.equals("RECHECK")) {
     purchDAO.poApprov2Update(poNo, reviewerComments2, "GFC APPROVED");
     modelMap.addAttribute("approvList", purchDAO.requiApprovList(userId, orgId, poNo));

     }
     if (reviewerRecordStatus.equalsIgnoreCase("RECHECK")) {
     purchDAO.poRecheck2Update(poNo, reviewerComments2, reviewerRecordStatus);

     }
     //for attachment
     String attachSno[] = request.getParameterValues("attachSno");
     String attachSnoFull[] = request.getParameterValues("attachSnoFull");
     List<String> attach1 = new ArrayList<String>();
     List<String> attach2 = new ArrayList<String>();
     if (attachSno != null && attachSnoFull != null) {
     for (int at = 0; at < attachSno.length; at++) {
     attach1.add(attachSno[at]);
     }
     for (int at1 = 0; at1 < attachSnoFull.length; at1++) {
     attach2.add(attachSnoFull[at1]);
     }
     List<String> unionat = new ArrayList<String>(attach1);
     unionat.addAll(attach2);
     List<String> intersection = new ArrayList<String>(attach1);
     intersection.retainAll(attach2);
     unionat.removeAll(intersection);
     for (String nA : unionat) {
     try {
     purchDAO.requiattachmentDelete(Integer.parseInt(nA));
     } catch (Exception e) {
     e.printStackTrace();
     }
     }
     } else {
     if (attachSno == null && attachSnoFull != null) {
     try {
     purchDAO.requiattachmentDelete(Integer.parseInt(attachSnoFull[0]));
     } catch (Exception e) {
     e.printStackTrace();
     }
     }
     }
     //        end

     MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
     List<MultipartFile> multipartFile = multipartRequest.getFiles("attachmentReference");
     int x = 0;
     for (Iterator<MultipartFile> iterator = multipartFile.iterator(); iterator.hasNext();) {
     MultipartFile test = (MultipartFile) iterator.next();
     if (test.getBytes().length > 0) {
     PurchAttach attach = new PurchAttach(test.getBytes(), test.getContentType(), poNo, timestamp, test.getOriginalFilename(), timestamp, orgId, "update0", userId);
     //requiattach.add(attach);

     purchDAO.POAttachSave(attach);
     x++;
     }
     }
     Common cm = new Common();
     String subject = "", tbody = "", mailbody = "", email = "", fileName = "", contraCod = "", ContractTerm = "", propertyCod = "";
     String userEmail = "excelarete@gmail.com";
     String password = "excel123";
     String toEmail = "";
     List<UserRegistration> ud = tenantDetailsDAO.udList("CFO");
     for (UserRegistration udlist : ud) {
     userId = udlist.getUserId();
     email = udlist.getEmail();

     if (!userEmail.isEmpty() && !password.isEmpty() && !email.isEmpty()) {
     List<PurchaseOrder> td = purchDAO.tdList1(userId, orgId, poNo);
     StringBuilder emailId = new StringBuilder(email);
     if (td.size() > 0) {
     int i = 1;
     for (PurchaseOrder tdlist : td) {

     poNo = tdlist.getPoNo();

     }
     emailId.append(",");
     emailId.append(toEmail);
     String[] sendEmail = emailId.toString().split(",");
     subject = "Purchase Order No: " + poNo;
     String filepath = request.getSession().getServletContext().getRealPath("common\\theme\\images\\logo1.png");
     mailbody = "<html><body>Dear Sir/Madam,<br/><br/><br/>You need to give an approval for Purchase Details. Purchase Order No : " + poNo + " "
     + " Please Approve this Purchase Details. <br/><br/>If approved ignore this mail. "
     + "</body>"
     + "<br/><br/>Thanks & Regards"
     + "<br/>Al-Hashar Team.</html>";
     ByteArrayOutputStream baos = new ByteArrayOutputStream();
     baos.close();
     cm.sendEmail(userEmail, password, sendEmail, subject, mailbody, baos, fileName);
     }
     }
     }
     modelMap.addAttribute("purchOrder", purchDAO.poList1(userId, orgId, null, "AM APPROVED"));
     modelMap.addAttribute("message", "Data Saved Successfully...");
     return new ModelAndView(new RedirectView("../purchase/POApprove2List.htm"), modelMap);

     }*/
    @RequestMapping("/purchase/POApprove3List.htm")
    public ModelAndView POApprove3List(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        modelMap.addAttribute("poList", purchDAO.poList4(userId, orgId, null, "FM Approved"));

        //return new ModelAndView("purchGenmngList", modelMap);
        /*ModelMap map = new ModelMap();
         HttpSession session = request.getSession();
         String orgId = session.getAttribute("orgId").toString();
         String userId = session.getAttribute("userId").toString();
         String roleName = session.getAttribute("userRole").toString();
         String tabName = "Approval 2";
         String submoduleName = "Purchase Order";
         map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
         map.addAttribute("purchOrder", purchDAO.poList2(userId, orgId, null, "GFC APPROVED"));*/
        return new ModelAndView("../purchOrder/POApprove3List", modelMap);
    }

    @RequestMapping("/purchase/POApprove3Form.htm")
    public ModelAndView POApprove3Form(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String poNo = request.getParameter("poNo");

        List<PurchaseOrder> gridData = new ArrayList<PurchaseOrder>();

        List<PurchaseOrder> groupPOlsit = new ArrayList<PurchaseOrder>();
//        Set<String> purset = new HashSet<String>();

        groupPOlsit.addAll(purchDAO.groupPOList(userId, orgId, poNo));
        gridData.addAll(purchDAO.poNoList(userId, orgId, poNo, "FM Approved"));
//        for (PurchaseOrder purset1 : gridData) {
//            purset.add(purset1.getPrNo());
//        }
//        modelMap.addAttribute("reqNoList", purset);

        modelMap.addAttribute("reqNoList", groupPOlsit);
        modelMap.addAttribute("poList", gridData);
        modelMap.addAttribute("supplierList", purchDAO.supplierReqList(null, "Approved"));
        modelMap.addAttribute("currencyList", purchDAO.currencyList(null));
        /*ModelMap modelMap = new ModelMap();
         String sno = request.getParameter("pk");
         HttpSession session = request.getSession();
         String poNo = request.getParameter("poNo");
         String orgId = session.getAttribute("orgId").toString();
         String userId = session.getAttribute("userId").toString();
         String link = "../purchase/poForm.htm";
         String tab = "Purchase Order";
         modelMap.addAttribute("purchase", userDAO.formLabelMapping(link, tab));
         modelMap.addAttribute("approvList", purchDAO.POApprovList(userId, orgId, poNo));
         modelMap.addAttribute("supp", purchDAO.list("", "SupplierMaster"));
         modelMap.addAttribute("item", purchDAO.list("", "ItemMaster"));
         modelMap.addAttribute("itemCat", purchDAO.list("", "ItemCategory"));
         modelMap.addAttribute("uom", purchDAO.list("", "UomMaster"));
         modelMap.addAttribute("action", request.getParameter("action"));*/
        return new ModelAndView("../purchOrder/POApprove3Form", modelMap);
    }

    @RequestMapping("/purchase/POApprov3Submit.htm")
    public ModelAndView POApprov3Submit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk[] = request.getParameterValues("pk");
        String status[] = request.getParameterValues("status");
        String reviewerComments3 = request.getParameter("reviewerComments3");
        String reviewerRecordStatus = request.getParameter("reviewerRecordStatus");
        String poNo = request.getParameter("poNo");
        purchDAO.POapprov3Update(poNo, reviewerComments3, "CFO APPROVED");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());

        //            for attachment
        String attachSno[] = request.getParameterValues("attachSno");
        String attachSnoFull[] = request.getParameterValues("attachSnoFull");
        List<String> attach1 = new ArrayList<String>();
        List<String> attach2 = new ArrayList<String>();
        if (attachSno != null && attachSnoFull != null) {
            for (int at = 0; at < attachSno.length; at++) {
                attach1.add(attachSno[at]);
            }
            for (int at1 = 0; at1 < attachSnoFull.length; at1++) {
                attach2.add(attachSnoFull[at1]);
            }
            List<String> unionat = new ArrayList<String>(attach1);
            unionat.addAll(attach2);
            List<String> intersection = new ArrayList<String>(attach1);
            intersection.retainAll(attach2);
            unionat.removeAll(intersection);
            for (String nA : unionat) {
                try {
                    purchDAO.requiattachmentDelete(Integer.parseInt(nA));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } else {
            if (attachSno == null && attachSnoFull != null) {
                try {
                    purchDAO.requiattachmentDelete(Integer.parseInt(attachSnoFull[0]));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
//        end

        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        List<MultipartFile> multipartFile = multipartRequest.getFiles("attachmentReference");
        int x = 0;
        for (Iterator<MultipartFile> iterator = multipartFile.iterator(); iterator.hasNext();) {
            MultipartFile test = (MultipartFile) iterator.next();
            if (test.getBytes().length > 0) {
                PurchAttach attach = new PurchAttach(test.getBytes(), test.getContentType(), poNo, timestamp, test.getOriginalFilename(), timestamp, orgId, "update0", userId);
                //requiattach.add(attach);

                purchDAO.POAttachSave(attach);
                x++;
            }
        }

        modelMap.addAttribute("approvList", purchDAO.POApprovList(userId, orgId, poNo));
        modelMap.addAttribute("purchOrder", purchDAO.poList2(userId, orgId, null, "GFC APPROVED"));
        modelMap.addAttribute("message", "Data Saved Successfully...");
        return new ModelAndView(new RedirectView("../purchase/POApprove3List.htm"), modelMap);

    }

    @RequestMapping("/purchase/approvedPOList.htm")
    public ModelAndView approvedPOList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        if (fromDate != null && toDate != null) {
            if (fromDate.contains("frdate") && toDate.contains("todate")) {
                fromDate = null;
                toDate = null;
            }
        }
        if (fromDate == null || toDate == null) {

        }
        //modelMap.addAttribute("poList", purchDAO.poList4(userId, orgId, null, "Approved"));//PM Recheck//Approved
        /*ModelMap map = new ModelMap();
         HttpSession session = request.getSession();
         String orgId = session.getAttribute("orgId").toString();
         String userId = session.getAttribute("userId").toString();
         String roleName = session.getAttribute("userRole").toString();
         String tabName = "Approved Purchase Order";
         String submoduleName = "Purchase Order";
         map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
         map.addAttribute("purchOrder", purchDAO.poList3(userId, orgId, null, "CFO APPROVED"));*/
        return new ModelAndView("../purchOrder/approvedPOList", modelMap);
    }

    @RequestMapping("/purchase/rejectedPOList.htm")
    public ModelAndView rejectedPOList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        modelMap.addAttribute("poList", purchDAO.poList4(userId, orgId, null, "Rejected"));
        /*ModelMap map = new ModelMap();
         HttpSession session = request.getSession();
         String orgId = session.getAttribute("orgId").toString();
         String userId = session.getAttribute("userId").toString();
         map.addAttribute("purchOrder", purchDAO.rejectPOList1(userId, orgId, null, "REJECTED"));*/
        return new ModelAndView("../purchOrder/rejectedPOList", modelMap);
    }

    @RequestMapping("/purchase/rejectedPOView.htm")
    public ModelAndView rejectedPOView(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String poNo = request.getParameter("poNo");

        List<PurchaseOrder> gridData = new ArrayList<PurchaseOrder>();
        List<PurchaseOrder> groupPOlsit = new ArrayList<PurchaseOrder>();
//        Set<String> purset = new HashSet<String>();

        groupPOlsit.addAll(purchDAO.groupPOList(userId, orgId, poNo));
        modelMap.addAttribute("reqNoList", groupPOlsit);
        gridData.addAll(purchDAO.poNoList(userId, orgId, poNo, "Rejected"));
//        for (PurchaseOrder purset1 : gridData) {
//            purset.add(purset1.getPrNo());
//        }
//        modelMap.addAttribute("reqNoList", purset);

        modelMap.addAttribute("poList", gridData);
        modelMap.addAttribute("supplierList", purchDAO.supplierReqList(null, "Approved"));
        modelMap.addAttribute("currencyList", purchDAO.currencyList(null));
        /*ModelMap modelMap = new ModelMap();
         String sno = request.getParameter("pk");
         HttpSession session = request.getSession();
         String poNo = request.getParameter("poNo");
         String orgId = session.getAttribute("orgId").toString();
         String userId = session.getAttribute("userId").toString();
         String link = "../purchase/poForm.htm";
         String tab = "Purchase Order";
         modelMap.addAttribute("purchase", userDAO.formLabelMapping(link, tab));
         modelMap.addAttribute("approvList", purchDAO.POApprovList(userId, orgId, poNo));
         modelMap.addAttribute("supp", purchDAO.list("", "SupplierMaster"));
         modelMap.addAttribute("item", purchDAO.list("", "ItemMaster"));
         modelMap.addAttribute("itemCat", purchDAO.list("", "ItemCategory"));
         modelMap.addAttribute("uom", purchDAO.list("", "UomMaster"));
         modelMap.addAttribute("action", request.getParameter("action"));*/
        return new ModelAndView("../purchOrder/rejectedPOView", modelMap);
    }

    @RequestMapping("/purchase/rejectedPOSubmit.htm")
    public ModelAndView rejectedPOSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String poNo = request.getParameter("poNo");
        String reviewerRecordStatus = request.getParameter("reviewerRecordStatus");
        String reviewerComments1 = request.getParameter("reviewerComments1");
        String reviewerComments2 = request.getParameter("reviewerComments2");
        String reviewerComments3 = request.getParameter("reviewerComments3");
        if (reviewerComments1 != null) {
            purchDAO.poReject1Update(poNo, reviewerComments1, reviewerRecordStatus);
        } else if (reviewerComments2 != null) {
            purchDAO.poReject2Update(poNo, reviewerComments2, reviewerRecordStatus);
        } else if (reviewerComments3 != null) {
            purchDAO.poReject3Update(poNo, reviewerComments3, reviewerRecordStatus);
        }
        map.addAttribute("purchOrder", purchDAO.rejectPOList1(userId, orgId, null, "REJECTED"));
        return new ModelAndView(new RedirectView("../purchase/rejectedPOList.htm"), map);
//        return new ModelAndView("../purchOrder/rejectedPOList", map);
    }

    @RequestMapping("/purchase/recheckPOSubmit.htm")
    public ModelAndView recheckPOSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String poNo = request.getParameter("poNo");
        String reviewerRecordStatus = request.getParameter("reviewerRecordStatus");
        String reviewerComments2 = request.getParameter("reviewerComments2");
        purchDAO.poRecheck2Update(poNo, reviewerComments2, reviewerRecordStatus);
        map.addAttribute("purchOrder", purchDAO.poList1(userId, orgId, null, "AM APPROVED"));
        return new ModelAndView(new RedirectView("../purchase/POApprove2List.htm"), map);
//        return new ModelAndView("../purchOrder/POApprove2List", map);
    }

    //--------------------------Quotation--------------------------------------------//-
    @RequestMapping("/purchase/quoteList.htm")
    public ModelAndView quoteList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Final Quotation";
        String submoduleName = "Final Quotation";
        map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        map.addAttribute("quote", purchDAO.list("", "FinalQuotation"));
        map.addAttribute("itemMaster", purchDAO.list("", "ItemMaster"));
        return new ModelAndView("../quotation/quoteList", map);
    }

    @RequestMapping("/purchase/quoteForm.htm")
    public ModelAndView quoteForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String link = "../purchase/quoteForm.htm";
        String tab = "Final Quotation";
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("quoteLable", userDAO.formLabelMapping(link, tab));
            modelMap.addAttribute("quote", purchDAO.list(sno, "FinalQuotation"));
        }
        modelMap.addAttribute("quoteLable", userDAO.formLabelMapping(link, tab));
        //modelMap.addAttribute("quote", purchDAO.list("", "FinalQuotation"));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../quotation/quoteForm", modelMap);
    }

    @RequestMapping("/purchase/quoteEditForm.htm")
    public ModelAndView quoteEditForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        String quotationNo = request.getParameter("quotationNo");
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String link = "../purchase/quoteForm.htm";
        String tab = "Final Quotation";
        modelMap.addAttribute("quoteLable", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("quote1", purchDAO.list(sno, "FinalQuotation"));
        modelMap.addAttribute("quote", purchDAO.quote(quotationNo, "FinalQuotation"));
        modelMap.addAttribute("itemMaster", purchDAO.list("", "ItemMaster"));
        modelMap.addAttribute("itemCat", purchDAO.list("", "ItemCategory"));
        modelMap.addAttribute("uom", purchDAO.list("", "UomMaster"));
        modelMap.addAttribute("supp", purchDAO.list("", "SupplierMaster"));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../quotation/quoteEditForm", modelMap);
    }

    @RequestMapping("/purchase/selectVendor.htm")
    public ModelAndView selectVendor(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        modelMap.addAttribute("suppList", purchDAO.list("", "SupplierMaster"));
        return new ModelAndView("../quotation/selectVendor", modelMap);
    }

    @RequestMapping("/purchase/selectItem.htm")
    public ModelAndView selectItem(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        modelMap.addAttribute("itemMaster", purchDAO.list("", "ItemMaster"));
        modelMap.addAttribute("uom", purchDAO.list("", "UomMaster"));
        modelMap.addAttribute("cat", purchDAO.list("", "ItemCategory"));
        return new ModelAndView("../quotation/selectItem", modelMap);
    }

    @RequestMapping("/purchase/quotationFormSubmit.htm")
    public ModelAndView quotationFormSubmit(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        String pk = request.getParameter("pk");
        String sno[] = request.getParameterValues("sno");
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String quotationNo = request.getParameter("quotationNo");
        String quotationDate = request.getParameter("quotationDate");
        String vendorCode[] = request.getParameterValues("supplierCode");
        String categoryId[] = request.getParameterValues("categoryId");
        String itemCode[] = request.getParameterValues("itemCode");
        String uomId[] = request.getParameterValues("uomId");
        String qty[] = request.getParameterValues("qty");
        String price[] = request.getParameterValues("price");
        String discount[] = request.getParameterValues("discount");
        String priority[] = request.getParameterValues("priority");
        String total[] = request.getParameterValues("total");
        String status = request.getParameter("status");
        String attribute1 = request.getParameter("attribute1");
        String attribute2 = request.getParameter("attribute2");
        String attribute3 = request.getParameter("attribute3");
        String attribute4 = request.getParameter("attribute4");
        String attribute5 = request.getParameter("attribute5");
        String lastmodifiedDate = request.getParameter("lastmodifiedDate");
        Date quotationDate1 = null;
        Date requiredDate1 = null;

        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        List<FinalQuotation> gridData = new ArrayList<FinalQuotation>();
        if (quotationNo.isEmpty()) {

            ArrayList validuser = (ArrayList) purchDAO.QuoteReqAutoGen(null, quotationNo, null);
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

            quotationNo = "QUOT" + "-" + ordno;
        }

        if (!"".equals(quotationDate)) {
            quotationDate1 = (Date) formatter.parse(quotationDate);
        }
        for (int i = 0; i < vendorCode.length; i++) {

            if (sno[i] == null || "".equals(sno[i])) {
                FinalQuotation finalQuot = new FinalQuotation(orgId, userId, quotationNo, quotationDate1, vendorCode[i], categoryId[i], itemCode[i], uomId[i], Double.parseDouble(qty[i]), Double.parseDouble(price[i]), discount[i], Double.parseDouble(total[i]), priority[i], timestamp, "update0", timestamp);
                purchDAO.globalSave(finalQuot);
            } else {
                FinalQuotation finalQuot = new FinalQuotation(Integer.parseInt(sno[i]), orgId, userId, quotationNo, quotationDate1, vendorCode[i], categoryId[i], itemCode[i], uomId[i], Double.parseDouble(qty[i]), Double.parseDouble(price[i]), discount[i], Double.parseDouble(total[i]), priority[i], status, timestamp);
                purchDAO.globalSave(finalQuot);
            }
        }

        ModelMap modelMap = new ModelMap();
        return new ModelAndView(new RedirectView("../purchase/quoteList.htm"), modelMap);
    }

    /// Item Master Pop UP
    @RequestMapping("/purchase/selectItemMaster1.htm")
    public ModelAndView selectItemMaster1(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String supp = req.getParameter("supp");
        //         String supp = req.getParameter("supplierCode");
        modelMap.addAttribute("itemMaster", purchDAO.list("", "ItemMaster"));
        modelMap.addAttribute("uom", purchDAO.list("", "UomMaster"));
        modelMap.addAttribute("cat", purchDAO.list("", "ItemCategory"));
        modelMap.addAttribute("qutation", purchDAO.finalquotelist(supp));
        //  modelMap.addAttribute("quo", purchDAO.list("", " FinalQuotation "));

        return new ModelAndView("../purchOrder/selectItemMaster1", modelMap);
    }

    @RequestMapping("/purchase/printPO.htm")
    public ModelAndView printPO(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String poNo = req.getParameter("poNo");
//         String supp = req.getParameter("supplierCode");
        modelMap.addAttribute("poList", purchDAO.getPOList(poNo));
        modelMap.addAttribute("accessoryList", purchDAO.getAccessoryList());
        modelMap.addAttribute("flatList", purchDAO.flatList());
//        modelMap.addAttribute("uom", purchDAO.list("", "UomMaster"));
//        modelMap.addAttribute("cat", purchDAO.list("", "ItemCategory"));
//         modelMap.addAttribute("qutation", purchDAO.finalquotelist(supp));
        //  modelMap.addAttribute("quo", purchDAO.list("", " FinalQuotation "));

        return new ModelAndView("../purchOrder/printPO", modelMap);
    }

    @RequestMapping("/purchase/deliveryLocPopUp.htm")
    public ModelAndView deliveryLocPopUp(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
//        modelMap.addAttribute("deliveryLocList", purchreqdao.deliveryLoc());
        modelMap.addAttribute("deliveryLocList", purchDAO.storeMaster(null));
        return new ModelAndView("../purchRequi/deliveryLocPopUp", modelMap);
    }

    @RequestMapping("/purchase/getItemSubCat.htm")
    public void getItemSubCat(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        HttpSession session = req.getSession(true);
        String itemCat = req.getParameter("itemCat").trim();
        purchDAO.itemSubCatList(req, res, itemCat);
    }

    @RequestMapping("/purchase/unitPrice.htm")
    public void unitPrice(HttpServletRequest req, HttpServletResponse res) throws IOException {
        HttpSession session = req.getSession(true);
        String code = req.getParameter("code");
        String suppCode = req.getParameter("suppCode");
        purchDAO.unitPrice(req, res, code, suppCode);
    }

    @RequestMapping("/purchase/selectItems.htm")
    public ModelAndView selectItems(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String itemCat = req.getParameter("itemCat");
        modelMap.addAttribute("itemList", purchDAO.itemCreaList(itemCat));
        modelMap.addAttribute("itemCat", itemCat);
        return new ModelAndView("../purchRequi/selectItems", modelMap);
    }

    @RequestMapping("/purchase/paginationList.htm")
    public void paginationList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("application/Json");
        PrintWriter out = res.getWriter();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        // ---------Json getting the value for each action like search,first,previous,last and show dropdown in front end---------
        String searchData = req.getParameter("sSearch");
        Integer displayLength = Integer.parseInt(req.getParameter("iDisplayLength"));
        Integer sEcho = Integer.parseInt(req.getParameter("sEcho"));
        Integer iDisplayStart = Integer.parseInt(req.getParameter("iDisplayStart"));

        List<PurchaseRequest> list = null;
        BigInteger listCount = null;
        Gson gson = new Gson();
        JsonObject jsonResponse = new JsonObject();

        String listPage = req.getParameter("listPage");
        String itemCat = req.getParameter("itemCat");

        if (searchData == null || searchData.isEmpty()) {
            list = purchDAO.paginationList(userId, orgId, null, searchData, iDisplayStart, displayLength, "desc", listPage, itemCat);
            listCount = purchDAO.paginationCount(userId, orgId, null, searchData, "desc", listPage, itemCat);

        } else {
            list = purchDAO.paginationList(userId, orgId, null, searchData, iDisplayStart, displayLength, "asc", listPage, itemCat);
            listCount = purchDAO.paginationCount(userId, orgId, null, searchData, "asc", listPage, itemCat);

        }

        // ---------Json setting the value for each action like search,first,previous,last and show dropdown in front end---------
        jsonResponse.add("iDisplayLength", gson.toJsonTree(displayLength));
        jsonResponse.add("iTotalRecords", gson.toJsonTree(listCount));
        jsonResponse.add("iTotalDisplayRecords", gson.toJsonTree(listCount));
        jsonResponse.add("sEcho", gson.toJsonTree(sEcho));
        jsonResponse.add("iDisplayStart", gson.toJsonTree(iDisplayStart));
        jsonResponse.add("aaData", gson.toJsonTree(list));
        out.print(jsonResponse);
        out.flush();
        /*res.setContentType("application/Json");
         PrintWriter out = res.getWriter();
         HttpSession session = req.getSession(true);
         String userId = session.getAttribute("userId").toString();
         String orgId = session.getAttribute("orgId").toString();
         String userRole = session.getAttribute("userRole").toString();

         // ---------Json getting the value for each action like search,first,previous,last and show dropdown in front end---------
         String searchData = req.getParameter("sSearch");
         Integer displayLength = Integer.parseInt(req.getParameter("iDisplayLength"));
         Integer sEcho = Integer.parseInt(req.getParameter("sEcho"));
         Integer iDisplayStart = Integer.parseInt(req.getParameter("iDisplayStart"));

         String sCol = req.getParameter("iSortCol_0");
         String sdir = req.getParameter("sSortDir_0");
         String sdir1 = req.getParameter("sColumns");
         String sdir2 = req.getParameter("more_data");
         String sTitle = req.getParameter("iSortTitle_1");

         List<PurchaseRequest> reqlist = null;
         BigInteger reqlistCount = null;
         Gson gson = new Gson();
         JsonObject jsonResponse = new JsonObject();
         if (searchData == null || searchData.isEmpty()) {
         reqlist = purchDAO.reqlist1(userRole, userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, sCol);//paginationList//reqlist1
         reqlistCount = purchDAO.reqlistCount(userRole, userId, orgId, null, searchData, "desc");

         } else {
         reqlist = purchDAO.reqlist1(userRole, userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, sCol);//reqlist1
         reqlistCount = purchDAO.reqlistCount(userRole, userId, orgId, null, searchData, "asc");

         }

         // ---------Json setting the value for each action like search,first,previous,last and show dropdown in front end---------
         jsonResponse.add("iDisplayLength", gson.toJsonTree(displayLength));
         jsonResponse.add("iTotalRecords", gson.toJsonTree(reqlistCount));
         jsonResponse.add("iTotalDisplayRecords", gson.toJsonTree(reqlistCount));
         jsonResponse.add("sEcho", gson.toJsonTree(sEcho));
         jsonResponse.add("iDisplayStart", gson.toJsonTree(iDisplayStart));
         jsonResponse.add("aaData", gson.toJsonTree(reqlist));
         out.print(jsonResponse);
         out.flush();*/
        /*res.setContentType("application/Json");
         PrintWriter out = res.getWriter();
         HttpSession session = req.getSession(true);
         String userId = session.getAttribute("userId").toString();
         String orgId = session.getAttribute("orgId").toString();

         // ---------Json getting the value for each action like search,first,previous,last and show dropdown in front end---------
         String searchData = req.getParameter("sSearch");
         Integer displayLength = Integer.parseInt(req.getParameter("iDisplayLength"));
         Integer sEcho = Integer.parseInt(req.getParameter("sEcho"));
         Integer iDisplayStart = Integer.parseInt(req.getParameter("iDisplayStart"));

         List<PurchaseRequest> list = null;
         BigInteger listCount = null;
         Gson gson = new Gson();
         JsonObject jsonResponse = new JsonObject();

         String listPage = req.getParameter("listPage");
         String itemCat = req.getParameter("itemCat");

         if (searchData == null || searchData.isEmpty()) {
         list = purchDAO.paginationList(userId, orgId, null, searchData, iDisplayStart, displayLength, "desc", listPage, itemCat);
         listCount = purchDAO.paginationCount(userId, orgId, null, searchData, "desc", listPage, itemCat);

         } else {
         list = purchDAO.paginationList(userId, orgId, null, searchData, iDisplayStart, displayLength, "asc", listPage, itemCat);
         listCount = purchDAO.paginationCount(userId, orgId, null, searchData, "asc", listPage, itemCat);

         }

         // ---------Json setting the value for each action like search,first,previous,last and show dropdown in front end---------
         jsonResponse.add("iDisplayLength", gson.toJsonTree(displayLength));
         jsonResponse.add("iTotalRecords", gson.toJsonTree(listCount));
         jsonResponse.add("iTotalDisplayRecords", gson.toJsonTree(listCount));
         jsonResponse.add("sEcho", gson.toJsonTree(sEcho));
         jsonResponse.add("iDisplayStart", gson.toJsonTree(iDisplayStart));
         jsonResponse.add("aaData", gson.toJsonTree(list));
         out.print(jsonResponse);
         out.flush();*/

    }

    @RequestMapping("/purchase/purReqPaginationList.htm")
    public void purReqPaginationList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("application/Json");
        PrintWriter out = res.getWriter();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String userRole = session.getAttribute("userRole").toString();
        String fromDate = req.getParameter("fromDate");
        String toDate = req.getParameter("toDate");
        String status = req.getParameter("status");

        if (fromDate != null && toDate != null) {
            if (fromDate.contains("frdate") && toDate.contains("todate")) {
                fromDate = null;
                toDate = null;
            }
        }

        // ---------Json getting the value for each action like search,first,previous,last and show dropdown in front end---------
        String searchData = req.getParameter("sSearch");
        String iDisplayLength = req.getParameter("iDisplayLength");
        String sEcho = req.getParameter("sEcho");
        String iDisplayStart = req.getParameter("iDisplayStart");

        Integer secho = 0;
        Integer displayStart = 0;
        Integer displayLength = 0;
        if (iDisplayLength != "" && iDisplayLength != null) {
            displayLength = Integer.parseInt(iDisplayLength);
        } else {
            displayLength = 10;
        }
        if (sEcho != "" && sEcho != null) {
            secho = Integer.parseInt(sEcho);
        } else {
            secho = 1;
        }
        if (iDisplayStart != "" && iDisplayStart != null) {
            displayStart = Integer.parseInt(iDisplayStart);
        } else {
            displayStart = 0;
        }
        if (searchData == null || searchData == "") {
            searchData = "";
        }

        String sCol = req.getParameter("iSortCol_0");
        if (sEcho == "" || sEcho == null) {
            sCol = "0";
        }
        String sdir = req.getParameter("sSortDir_0");
        if (sdir == "" || sdir == null) {
            sdir = "desc";
        }
        String sdir1 = req.getParameter("sColumns");
        String sdir2 = req.getParameter("more_data");
        String sTitle = req.getParameter("iSortTitle_1");

        List<PurchaseRequest> reqlist = null;
        BigInteger reqlistCount = null;
        Gson gson = new Gson();
        JsonObject jsonResponse = new JsonObject();
        if (status == "" || status == null) {
            if (fromDate == null || toDate == null || fromDate == "" || toDate == "") {
                if (searchData == null || searchData.isEmpty()) {
                    reqlist = purchDAO.reqlist1(userRole, userId, orgId, null, searchData, displayStart, displayLength, sdir, sCol);
                    reqlistCount = purchDAO.reqlistCount(userRole, userId, orgId, null, searchData, "desc");

                } else {
                    reqlist = purchDAO.reqlist1(userRole, userId, orgId, null, searchData, displayStart, displayLength, sdir, sCol);
                    reqlistCount = purchDAO.reqlistCount(userRole, userId, orgId, null, searchData, "asc");

                }
            } else {
                if (searchData == null || searchData.isEmpty()) {
                    reqlist = purchDAO.reqlist12(userRole, userId, orgId, null, searchData, displayStart, displayLength, sdir, sCol, fromDate, toDate);
                    reqlistCount = purchDAO.reqlistCount1(userRole, userId, orgId, null, searchData, "desc", fromDate, toDate);

                } else {
                    reqlist = purchDAO.reqlist12(userRole, userId, orgId, null, searchData, displayStart, displayLength, sdir, sCol, fromDate, toDate);
                    reqlistCount = purchDAO.reqlistCount1(userRole, userId, orgId, null, searchData, "asc", fromDate, toDate);

                }
            }
        } else {
            if (fromDate == null || toDate == null || fromDate == "" || toDate == "") {
                if (searchData == null || searchData.isEmpty()) {
                    reqlist = purchDAO.reqlist1(userRole, userId, orgId, null, searchData, displayStart, displayLength, sdir, sCol);
                    reqlistCount = purchDAO.reqlistCount(userRole, userId, orgId, null, searchData, "desc");

                } else {
                    reqlist = purchDAO.reqlist1(userRole, userId, orgId, null, searchData, displayStart, displayLength, sdir, sCol);
                    reqlistCount = purchDAO.reqlistCount(userRole, userId, orgId, null, searchData, "asc");

                }
            } else {
                if (searchData == null || searchData.isEmpty()) {
                    reqlist = purchDAO.reqlist121(userRole, userId, orgId, null, searchData, displayStart, displayLength, sdir, sCol, fromDate, toDate);
                    reqlistCount = purchDAO.reqlistCount12(userRole, userId, orgId, null, searchData, "desc", fromDate, toDate);

                } else {
                    reqlist = purchDAO.reqlist121(userRole, userId, orgId, null, searchData, displayStart, displayLength, sdir, sCol, fromDate, toDate);
                    reqlistCount = purchDAO.reqlistCount12(userRole, userId, orgId, null, searchData, "asc", fromDate, toDate);

                }
            }
        }

        // ---------Json setting the value for each action like search,first,previous,last and show dropdown in front end---------
        jsonResponse.add("iDisplayLength", gson.toJsonTree(displayLength));
        jsonResponse.add("iTotalRecords", gson.toJsonTree(reqlistCount));
        jsonResponse.add("iTotalDisplayRecords", gson.toJsonTree(reqlistCount));
        jsonResponse.add("sEcho", gson.toJsonTree(secho));
        jsonResponse.add("iDisplayStart", gson.toJsonTree(displayStart));
        jsonResponse.add("aaData", gson.toJsonTree(reqlist));
        out.print(jsonResponse);
        out.flush();

    }

    @RequestMapping("/purchase/reviewPaginationList.htm")
    public void reviewPaginationList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("application/Json");
        PrintWriter out = res.getWriter();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        // ---------Json getting the value for each action like search,first,previous,last and show dropdown in front end---------
        String searchData = req.getParameter("sSearch");
        Integer displayLength = Integer.parseInt(req.getParameter("iDisplayLength"));
        Integer sEcho = Integer.parseInt(req.getParameter("sEcho"));
        Integer iDisplayStart = Integer.parseInt(req.getParameter("iDisplayStart"));

        String sCol = req.getParameter("iSortCol_0");
        String sdir = req.getParameter("sSortDir_0");
        String sdir1 = req.getParameter("sColumns");
        String sdir2 = req.getParameter("more_data");
        String sTitle = req.getParameter("iSortTitle_1");

        List<PurchaseRequest> reqlist = null;
        BigInteger reqlistCount = null;
        Gson gson = new Gson();
        JsonObject jsonResponse = new JsonObject();
        if (searchData == null || searchData.isEmpty()) {
            reqlist = purchDAO.reviewPaginationList(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, sCol);
            reqlistCount = purchDAO.reviewPaginationCount(userId, orgId, null, searchData, "desc");

        } else {
            reqlist = purchDAO.reviewPaginationList(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, sCol);
            reqlistCount = purchDAO.reviewPaginationCount(userId, orgId, null, searchData, "asc");

        }

        // ---------Json setting the value for each action like search,first,previous,last and show dropdown in front end---------
        jsonResponse.add("iDisplayLength", gson.toJsonTree(displayLength));
        jsonResponse.add("iTotalRecords", gson.toJsonTree(reqlistCount));
        jsonResponse.add("iTotalDisplayRecords", gson.toJsonTree(reqlistCount));
        jsonResponse.add("sEcho", gson.toJsonTree(sEcho));
        jsonResponse.add("iDisplayStart", gson.toJsonTree(iDisplayStart));
        jsonResponse.add("aaData", gson.toJsonTree(reqlist));
        out.print(jsonResponse);
        out.flush();

    }

    @RequestMapping("/purchase/purchReqDel.htm")
    public ModelAndView purchReqDel(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String reqNo = req.getParameter("reqNo");

        purchDAO.purchReqDel(reqNo);
        modelMap.addAttribute("message", "Data Inactive Successfully...");
        modelMap.addAttribute("purchReqList", purchDAO.reqlist(userId, orgId, null));
        return new ModelAndView("../purchRequi/purchaseRequiList", modelMap);
    }

    @RequestMapping("/purchase/purchReqActive.htm")
    public ModelAndView purchReqActive(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String reqNo = req.getParameter("reqNo");

        purchDAO.purchReqActive(reqNo);
        modelMap.addAttribute("message", "Data Active Successfully...");
        modelMap.addAttribute("purchReqList", purchDAO.reqlist(userId, orgId, null));
        return new ModelAndView("../purchRequi/purchaseRequiList", modelMap);
    }

    @RequestMapping("/purchase/reviewInventory.htm")
    public ModelAndView reviewInventory(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String requisitionNo = req.getParameter("reqNo");
        List<PurchaseRequest> purchReqList = purchDAO.reviewInventory(requisitionNo);

        if (purchReqList.size() > 0) {
            modelMap.addAttribute("action", req.getParameter("action"));
            modelMap.addAttribute("purchReqList", purchReqList);
            modelMap.addAttribute("purchDocList", purchDAO.purchDocList(requisitionNo));
            return new ModelAndView("../purchRequi/reviewInventory", modelMap);
        } else {
            return new ModelAndView("../purchRequi/RequiApprove2List", modelMap);
        }

    }

    @RequestMapping("/purchase/storeRevPaginationList.htm")
    public void storeRevPaginationList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("application/Json");
        PrintWriter out = res.getWriter();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        // ---------Json getting the value for each action like search,first,previous,last and show dropdown in front end---------
        String searchData = req.getParameter("sSearch");
        Integer displayLength = Integer.parseInt(req.getParameter("iDisplayLength"));
        Integer sEcho = Integer.parseInt(req.getParameter("sEcho"));
        Integer iDisplayStart = Integer.parseInt(req.getParameter("iDisplayStart"));

        String sCol = req.getParameter("iSortCol_0");
        String sdir = req.getParameter("sSortDir_0");
        String sdir1 = req.getParameter("sColumns");
        String sdir2 = req.getParameter("more_data");
        String sTitle = req.getParameter("iSortTitle_1");

        List<PurchaseRequest> reqlist = null;
        BigInteger reqlistCount = null;
        Gson gson = new Gson();
        JsonObject jsonResponse = new JsonObject();
        if (searchData == null || searchData.isEmpty()) {
            reqlist = purchDAO.storeRevPaginationList(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, sCol);
            reqlistCount = purchDAO.storeRevPaginationCount(userId, orgId, null, searchData, "desc");

        } else {
            reqlist = purchDAO.storeRevPaginationList(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, sCol);
            reqlistCount = purchDAO.storeRevPaginationCount(userId, orgId, null, searchData, "asc");

        }

        // ---------Json setting the value for each action like search,first,previous,last and show dropdown in front end---------
        jsonResponse.add("iDisplayLength", gson.toJsonTree(displayLength));
        jsonResponse.add("iTotalRecords", gson.toJsonTree(reqlistCount));
        jsonResponse.add("iTotalDisplayRecords", gson.toJsonTree(reqlistCount));
        jsonResponse.add("sEcho", gson.toJsonTree(sEcho));
        jsonResponse.add("iDisplayStart", gson.toJsonTree(iDisplayStart));
        jsonResponse.add("aaData", gson.toJsonTree(reqlist));
        out.print(jsonResponse);
        out.flush();

    }

    @RequestMapping("/purchase/storeApprovalSubmit.htm")
    public ModelAndView storeApprovalSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        java.util.Date today = new java.util.Date();
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk[] = request.getParameterValues("pk");
        String selectedvalues[] = request.getParameterValues("selectedvalues");
        String qty[] = request.getParameterValues("qty");
        String issueqty[] = request.getParameterValues("issueqty");
        String purchqty[] = request.getParameterValues("purchqty");
        String status = request.getParameter("status");
        String appoverComments[] = request.getParameterValues("appoverComments");
        String approverName[] = request.getParameterValues("roleName");
        String requisitionNo = request.getParameter("reqNo");
//        String storeUser = request.getParameter("storeUser");
        // String recordStatus[]=request.getParameterValues("recordStatus");
        String storeComment = request.getParameter("storeComment");
        Double issuQty = null, purchQty = null, quantity = null;
        for (int i = 0; i < pk.length; i++) {

            if (!issueqty[i].isEmpty() && issueqty[i] != null) {
                issuQty = Double.parseDouble(issueqty[i]);
            }
            if (!purchqty[i].isEmpty() && purchqty[i] != null) {
                purchQty = Double.parseDouble(purchqty[i]);
            }
            if (!qty[i].isEmpty() && qty[i] != null) {
                quantity = Double.parseDouble(qty[i]);
            }

            if (issuQty != 0 && issuQty != null) {
                status = "MI Requested";
            } else {
                status = "Store Reviewed";
            }

            purchDAO.updateStoreApprove(Integer.parseInt(pk[i]), status, userId, storeComment, formatter4.format(today), quantity, issuQty, purchQty);

        }
        modelMap.addAttribute("purchReqList", purchDAO.storeRevList(userId, orgId, null));
//        return new ModelAndView("../purchReq/reviewInventory.htm?reqNo=" + requisitionNo, modelMap);
        return new ModelAndView(new RedirectView("reviewInventory.htm"), modelMap);
    }

    @RequestMapping("/purchase/inventoryPopUp.htm")
    public ModelAndView inventoryPopUp(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String orgCode = session.getAttribute("orgCode").toString();

        String itemcode = req.getParameter("itemcode");
        modelMap.addAttribute("inventorylist", purchDAO.inventoryList(itemcode, orgCode));
        return new ModelAndView("../purchRequi/inventoryPopUp", modelMap);
    }

    @RequestMapping("/purchase/chkInvenStock.htm")
    public void chkInvenStock(HttpServletRequest req, HttpServletResponse res) throws IOException {
        HttpSession session = req.getSession(true);
        String orgCode = session.getAttribute("orgCode").toString();
        String itemCode = req.getParameter("itemCode");
        String storeName = req.getParameter("storeName");
        purchDAO.chkInvenStock(req, res, itemCode, orgCode, storeName);
    }

    @RequestMapping("/purchase/appreovedReqPaginationList.htm")
    public void appreovedReqPaginationList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("application/Json");
        PrintWriter out = res.getWriter();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        // ---------Json getting the value for each action like search,first,previous,last and show dropdown in front end---------
        String searchData = req.getParameter("sSearch");
        Integer displayLength = Integer.parseInt(req.getParameter("iDisplayLength"));
        Integer sEcho = Integer.parseInt(req.getParameter("sEcho"));
        Integer iDisplayStart = Integer.parseInt(req.getParameter("iDisplayStart"));

        String sCol = req.getParameter("iSortCol_0");
        String sdir = req.getParameter("sSortDir_0");
        String sdir1 = req.getParameter("sColumns");
        String sdir2 = req.getParameter("more_data");
        String sTitle = req.getParameter("iSortTitle_1");

        List<PurchaseRequest> reqlist = null;
        BigInteger reqlistCount = null;
        Gson gson = new Gson();
        JsonObject jsonResponse = new JsonObject();
        if (searchData == null || searchData.isEmpty()) {
            reqlist = purchDAO.appreovedReqPaginationList(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, sCol);
            reqlistCount = purchDAO.appreovedReqPaginationCount(userId, orgId, null, searchData, "desc");

        } else {
            reqlist = purchDAO.appreovedReqPaginationList(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, sCol);
            reqlistCount = purchDAO.appreovedReqPaginationCount(userId, orgId, null, searchData, "asc");

        }

        // ---------Json setting the value for each action like search,first,previous,last and show dropdown in front end---------
        jsonResponse.add("iDisplayLength", gson.toJsonTree(displayLength));
        jsonResponse.add("iTotalRecords", gson.toJsonTree(reqlistCount));
        jsonResponse.add("iTotalDisplayRecords", gson.toJsonTree(reqlistCount));
        jsonResponse.add("sEcho", gson.toJsonTree(sEcho));
        jsonResponse.add("iDisplayStart", gson.toJsonTree(iDisplayStart));
        jsonResponse.add("aaData", gson.toJsonTree(reqlist));
        out.print(jsonResponse);
        out.flush();

    }

    @RequestMapping("/purchase/enquiryForm.htm")
    public ModelAndView enquiryForm(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String requisitionNo = req.getParameter("reqNo");
        modelMap.addAttribute("purchReqList", purchDAO.enquiryForm(requisitionNo));
        modelMap.addAttribute("purchDocList", purchDAO.purchDocList(requisitionNo));
        modelMap.addAttribute("action", req.getParameter("action"));
        return new ModelAndView("../purchRequi/enquiryForm", modelMap);
    }

    @RequestMapping("/purchase/selectSuppPopup.htm")
    public ModelAndView selectSuppPopup(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String requisitionNo = req.getParameter("reqNo");
        modelMap.addAttribute("supplierList", purchDAO.supplierReqList(null, "Approved"));
        modelMap.addAttribute("action", req.getParameter("action"));
        modelMap.addAttribute("id", req.getParameter("id"));
        modelMap.addAttribute("suppcode", req.getParameter("suppcode"));
        modelMap.addAttribute("suppname", req.getParameter("suppname"));
        return new ModelAndView("../purchRequi/selectSuppPopup", modelMap);
    }

    @RequestMapping("/purchase/reqQuotApp.htm")
    public ModelAndView reqQuotApp(HttpServletRequest req, HttpServletResponse res) throws SQLException {
        String reqNo = req.getParameter("reqno");
        HttpSession session = req.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String selectedvalues[] = req.getParameterValues("selectedvalues");
        String status = req.getParameter("status");
        if (status != null && selectedvalues.length > 0) {
            for (int i = 0; i < selectedvalues.length; i++) {

                purchDAO.reqQuotApp(Integer.parseInt(selectedvalues[i]), status);
            }
        }
        return new ModelAndView("../purchRequi/reqQuotation", modelMap);
    }

    @RequestMapping("/purchase/reqQuotation.htm")
    public ModelAndView reqQuotation(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String requisitionNo = req.getParameter("reqNo");
        modelMap.addAttribute("purchReqList", purchDAO.reqQuotation(requisitionNo));
        modelMap.addAttribute("purchDocList", purchDAO.purchDocList(requisitionNo));
        modelMap.addAttribute("action", req.getParameter("action"));
        return new ModelAndView("../purchRequi/reqQuotation", modelMap);
    }

    @RequestMapping("/purchase/sendQuotation.htm")
    public ModelAndView sendQuotation(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, ParseException {
        java.util.Date newdate = new java.util.Date();
        long t = newdate.getTime();
        java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(t);
        HttpSession session1 = req.getSession();

        String userId = session1.getAttribute("userId").toString();
        String orgId = session1.getAttribute("orgId").toString();
        String orgCode = session1.getAttribute("orgCode").toString();
        String supplier[] = req.getParameterValues("supplier");
        String projectCode[] = req.getParameterValues("projectCode");
        String projectName[] = req.getParameterValues("prName");
        String reqNo = req.getParameter("ReqNo");
        String requitionDate = req.getParameter("reqDate");
        String itemsubCat[] = req.getParameterValues("itemsubCat");
        String itemCat[] = req.getParameterValues("itemCat");
        String itemCode[] = req.getParameterValues("itemCode");
        String itemName[] = req.getParameterValues("itemName");
        String itemDesc[] = req.getParameterValues("itemDesc");
        String unit[] = req.getParameterValues("unit");
        String purchaseType = req.getParameter("purchaseType");
        String department = req.getParameter("dept");
        String division = req.getParameter("division");
        String matSpec[] = req.getParameterValues("matSpec");
        String qty[] = req.getParameterValues("qty");
        String loc[] = req.getParameterValues("loc");
        String pk[] = req.getParameterValues("pk");
        String deliveryDate[] = req.getParameterValues("deliveryDate");
        String enqDate = req.getParameter("enqDate");
//        String reqDate = req.getParameter("reqDate");
        String status[] = req.getParameterValues("status");
        Date enqDate1 = (Date) formatter.parse(enqDate);
        Date reqDate1 = (Date) formatter.parse(requitionDate);
        String mainsup = "";
//        String from = "excelajh123@gmail.com";
//        String pass = "excel123";
        String from = "";
        String pass = "";
        String hostName = null, cc = null;
        String ccMail[] = null;
        String moudleName = "Supplier Enquiry";

        List<HostEmailConfig> hostEmailCofig = purchDAO.hostEmailCofig(userId, orgId, moudleName);
        for (HostEmailConfig hostEmailCofig1 : hostEmailCofig) {
            if (hostEmailCofig1.getEmailFrom() != null) {
                from = hostEmailCofig1.getEmailFrom();
            }
            if (hostEmailCofig1.getPasswordFrom() != null) {
                pass = hostEmailCofig1.getPasswordFrom();
            }
            if (hostEmailCofig1.getHostName() != null) {
                hostName = hostEmailCofig1.getHostName();
            }
            if (hostEmailCofig1.getEmailCc() != null) {
                cc = hostEmailCofig1.getEmailCc();
            }

        }
        if (cc != null) {
            ccMail = cc.split(",");
        }

        ArrayList validuser = (ArrayList) purchDAO.enquiryAutoGenNo(null, "1");
        String orderNoFinal = null;
        String orderNo = null;
        String enqno = null;
        int num = 1;
        if (!validuser.isEmpty()) {
            for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
                if (iter.next() != null) {
                    Iterator<String> iter2 = validuser.iterator();
                    iter2.hasNext();
                    orderNoFinal = String.valueOf(iter2.next());
                }
            }
            orderNo = orderNoFinal;
        }
        if (orderNo != null) {
            num = Integer.parseInt(orderNo) + 1;

        }
        enqno = "ENQ-" + num;
        List<OrgDetails> orgdetail = purchDAO.orgCode(orgCode);
        String orgAddress = null;
        for (OrgDetails orgAdd : orgdetail) {
            orgAddress = orgAdd.getOrgAddress();

        }

//        ArrayList validuser1 = (ArrayList) userdao.profilelist(userId, orgId);
//        for (Iterator<Userpersonnelidmap> iter = validuser1.iterator(); iter.hasNext();) {
//            email = iter.next().getEmailId();
//        }
//        for (Iterator<Userpersonnelidmap> iter = validuser1.iterator(); iter.hasNext();) {
//            pass = iter.next().getPassword();
//        }
        for (int i = 0; i < supplier.length; i++) {
            String supplier1[] = supplier[i].split(",");
            for (int k = 0; k < supplier1.length; k++) {
                if (!mainsup.matches("(.*)" + supplier1[k] + "(.*)")) {
                    mainsup = mainsup + supplier1[k] + ",";
                }
            }
        }
        Common cm = new Common();

        String supplier1[] = mainsup.split(",");
        if (!from.isEmpty() && !pass.isEmpty()) {

            for (int k = 0; k < supplier1.length; k++) {
                String emailId = supplier1[k];
                String user = "";
//            ArrayList validuser = (ArrayList) requisitiondao.contDetailList(emailId);
//            for (Iterator<Contactdetails> iter = validuser.iterator(); iter.hasNext();) {
//                user = iter.next().getContactName();
//            }

                String[] to = {emailId}; // added this line

                try {

                    String subject = "Request For Quotation for the Enquiry " + enqno;

                    String test = "";
                    String temp = "false";
                    HSSFWorkbook xlsFile = new HSSFWorkbook(); // create a workbook        
                    Sheet sheet1 = xlsFile.createSheet("Sheet #1");
                    sheet1.autoSizeColumn(10000);
                    CellStyle style = xlsFile.createCellStyle();//Create style
                    Font font = xlsFile.createFont();//Create font
                    font.setBoldweight(Font.BOLDWEIGHT_BOLD);//Make font bold
                    style.setFont(font);//set it to bold
                    Row row = null;
                    row = sheet1.createRow(0); // create a new row in your sheet
                    sheet1.addMergedRegion(new CellRangeAddress(
                            0, //first row (0-based)
                            3, //last row (0-based)
                            2, //first column (0-based)
                            6 //last column (0-based)
                    )); // add cells to the row

                    String filepath = req.getServletContext().getRealPath("/common/theme/images/Torque-Logo.jpg");
                    InputStream inputStream = new FileInputStream(filepath);
                    byte[] imageBytes = IOUtils.toByteArray(inputStream);

                    int pictureureIdx = xlsFile.addPicture(imageBytes, xlsFile.PICTURE_TYPE_PNG);

                    inputStream.close();
                    HSSFCreationHelper helper = xlsFile.getCreationHelper();

                    HSSFPatriarch patriarch = (HSSFPatriarch) sheet1.createDrawingPatriarch();

                    HSSFClientAnchor anchor = helper.createClientAnchor();

                    //HSSFClientAnchor object mainly sets the excel cell location where 
                    //the image needs to be inserted
                    //(col1, row1, x1, y1, col2, row2, x2, y2)   
//                    anchor.setCol1(0);
//                    anchor.setRow1(0);
                    anchor.setDx1(2);
                    anchor.setDy1(2);
                    Picture pict = patriarch.createPicture(anchor, pictureureIdx);

                    pict.resize();

                    row.createCell(2).setCellValue(orgAddress);
                    row.getCell(2).setCellStyle(style);

                    row = sheet1.createRow(5);
                    row.createCell(0).setCellValue("Enq No");
                    row.getCell(0).setCellStyle(style);

                    row.createCell(1).setCellValue(enqno); // add cells to the row
//                    row.getCell(1).setCellStyle(style);

                    row.createCell(2).setCellValue("Delivery Location");
                    row.getCell(2).setCellStyle(style);
                    row.createCell(3).setCellValue(loc[0]); // add cells to the row
//                    row.getCell(3).setCellStyle(style);

                    row = sheet1.createRow(6);

                    row.createCell(0).setCellValue("Enq Date");
                    row.getCell(0).setCellStyle(style);
                    row.createCell(1).setCellValue(enqDate);
//                    row.getCell(1).setCellStyle(style);

                    row = sheet1.createRow(9); // create a new row in your sheet

                    int r = 10;//this is for item header row

                    row.createCell(0).setCellValue("Item Name"); // add cells to the row   

                    row.createCell(1).setCellValue("Item Description");

                    row.createCell(2).setCellValue("Delivery Date");

                    row.createCell(3).setCellValue("Quantity");

                    row.createCell(4).setCellValue("Location");

                    row.createCell(5).setCellValue("Item Specification");
                    row.createCell(6).setCellValue("Price");
                    row.getCell(0).setCellStyle(style);
                    row.getCell(1).setCellStyle(style);
                    row.getCell(2).setCellStyle(style);
                    row.getCell(3).setCellStyle(style);
                    row.getCell(4).setCellStyle(style);
                    row.getCell(5).setCellStyle(style);
                    row.getCell(6).setCellStyle(style);
                    for (int i = 0; i < supplier.length; i++) {

                        if (supplier[i].matches("(.*)" + supplier1[k] + "(.*)")) {
                            temp = "true";
                        }
                        if (temp.equals("true")) {
                            test = test + "<tr><td>" + itemName[i] + "</td>"
                                    + "<td>" + itemDesc[i] + "</td>"
                                    + "<td>" + deliveryDate[i] + "</td>"
                                    + "<td>" + qty[i] + "</td>"
                                    + "<td>" + loc[i] + "</td>"
                                    + "<td>" + projectCode[i] + "</td>"
                                    + "<td>" + matSpec[i] + "</td>"
                                    + "</tr>";
                            temp = "false";

                            row = sheet1.createRow(r); // create a new row in your sheet for item details
                            row.createCell(0).setCellValue(itemName[i]); // add cells to the row
                            row.createCell(1).setCellValue(itemDesc[i]);
                            row.createCell(2).setCellValue(deliveryDate[i]);
                            row.createCell(3).setCellValue(qty[i]);
                            row.createCell(4).setCellValue(loc[i]);
                            row.createCell(5).setCellValue(matSpec[i]);
                            sheet1.autoSizeColumn(i);
                            r++;
                        }
                    }
                    String body = "<html><body bgcolor=#FFFFFF leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>"
                            + "Dear Sir/Madam,<br><br><br> Please find the attachment and Send me the Quotation for the following Item(s):"
                            //                        + "<table border='1px' cellpadding='5'>"
                            //                        + "<tr><th>Item Name</th><th>Item Description</th><th>Required Before</th><th>Quantity</th><th>Location</th><th>Project Code</th><th>Item Specification</th></tr>"
                            //                        + test
                            //                        + "</table>"
                            + "</body>"
                            + "</html>";
                    ByteArrayOutputStream bos = new ByteArrayOutputStream();
                    xlsFile.write(bos); // write excel data to a byte array
                    bos.close();
                    String fileName = "Quotation for the Enquiry " + enqno + ".xls";
//                    cm.sendEmail(from, pass, to, subject, body, bos, fileName);
                    if (!from.isEmpty() && !pass.isEmpty()) {
                        cm.sendEmail1(from, pass, to, subject, body, bos, fileName, ccMail, hostName);
                    }

                } catch (Exception e) {
                }

            }

        }

        List<SupplierEnquiry> gridData = new ArrayList<SupplierEnquiry>();
//        String enqNo = req.getParameter("enqNo");

        for (int i = 0; i < itemName.length; i++) {
            String supplier2[] = supplier[i].split(",");
            Date deliveryDate1 = null;
            try {
                if (!"".equals(deliveryDate[i]) && deliveryDate[i] != null) {
                    deliveryDate1 = (Date) formatter.parse(deliveryDate[i]);
                }
            } catch (NullPointerException ex) {
                // Do something/nothing if date2 is null
            }

            for (int k = 0; k < supplier2.length; k++) {
                SupplierEnquiry supp = new SupplierEnquiry(userId, orgId, enqno, enqDate1, division, projectCode[i], projectName[i], department,
                        reqNo, Integer.parseInt(pk[i]), reqDate1, purchaseType, itemCat[i], itemsubCat[i], itemCode[i], itemName[i], itemDesc[i],
                        matSpec[i], unit[i], Double.parseDouble(qty[i]), "", deliveryDate1, loc[i], supplier2[k], "Enquiry Created", "update0", sqlTimestamp);
                gridData.add(supp);
            }

        }
        purchDAO.SaveEnqQuotation(gridData);

        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("message", "Mail has been Sent Successfully.");
        modelMap.addAttribute("purchReqList", purchDAO.createEnquiryList(userId, orgId, null));
        return new ModelAndView(new RedirectView("approvedRequiList.htm"), modelMap);

    }

    @RequestMapping("/purchase/reqPOform.htm")
    public ModelAndView reqPOform(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String reqNo = req.getParameter("reqNo").trim();
        String[] reqNoSplit = reqNo.split("@@");
        List<PurchaseRequest> gridData = new ArrayList<PurchaseRequest>();
        List<PurchaseRequest> reqList = new ArrayList<PurchaseRequest>();
        List<PurchaseAttachments> docList = new ArrayList<PurchaseAttachments>();
        Set<String> purset = new HashSet<String>();
        for (int i = 0; i < reqNoSplit.length; i++) {
            reqList.addAll(purchDAO.groupReqList(userId, orgId, reqNoSplit[i]));
            gridData.addAll(purchDAO.appreovedReqList(userId, orgId, reqNoSplit[i]));
            docList.addAll(purchDAO.purchDocList(reqNoSplit[i]));
        }
//        for (PurchaseRequest purset1 : gridData) {
//            purset.add(purset1.getPrNo());
//            purset.add(purset1.getPrDate().toString());
//        }
        modelMap.addAttribute("reqNoList", reqList);
        modelMap.addAttribute("billloclist", purchDAO.billlocList(null));
//        modelMap.addAttribute("purchReqList", purchreqdao.appreovedReqList(userId, orgId, reqNo));
        modelMap.addAttribute("purchReqList", gridData);
        modelMap.addAttribute("supplierList", purchDAO.ItemWiseSupplier(orgId, "Active", null));
//        modelMap.addAttribute("purchDocList", purchreqdao.purchDocList(reqNo));
        modelMap.addAttribute("purchDocList", docList);
        modelMap.addAttribute("currencyList", purchDAO.currencyList(null));
        modelMap.addAttribute("costCenterList", purchDAO.costCenterList(null));
        return new ModelAndView("../purchRequi/reqPOform", modelMap);

    }

    @RequestMapping("/purchase/reqPOformSubmit.htm")
    public ModelAndView reqPOformSubmit(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException {
        java.util.Date newdate = new java.util.Date();
        long t = newdate.getTime();
        java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(t);
        int year = Calendar.getInstance().get(Calendar.YEAR);

        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        DecimalFormat df = new DecimalFormat("#.000");

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String projectCode = req.getParameter("prCode");
        String projectName[] = req.getParameterValues("prName");
        String reqNo[] = req.getParameterValues("reqNo");
        String requitionDate = req.getParameter("reqDate");
        String itemsubCat[] = req.getParameterValues("itemsubCat");
        String itemCat[] = req.getParameterValues("itemCat");
        String itemCode[] = req.getParameterValues("itemCode");
        String itemName[] = req.getParameterValues("itemName");
        String itemDesc[] = req.getParameterValues("itemDesc");
        String unit = req.getParameter("unit");
        String purchaseType = req.getParameter("purchaseType");
        String department = req.getParameter("dept");
        String division = req.getParameter("division");
        String qty[] = req.getParameterValues("qty");
        String delDate[] = req.getParameterValues("delDate");
        String deliveryLoc = req.getParameter("deliveryLoc");
        String discount[] = req.getParameterValues("discount");
        String price[] = req.getParameterValues("price");
        String total[] = req.getParameterValues("total");
        String gt = req.getParameter("grandTotal");
        String payTerms = req.getParameter("payTerms");
        String delTerms = req.getParameter("delTerms");

        //String status[]=req.getParameterValues("status");
        String supName[] = req.getParameterValues("supName");
        String supaddress[] = req.getParameterValues("supaddress");
        String supplierCode[] = req.getParameterValues("supplierCode");
        String supEmail[] = req.getParameterValues("supEmail");

        String potype = req.getParameter("potype");
        String currency = req.getParameter("currency");

        String billToAddress = req.getParameter("billToAddress");
        String prsno[] = req.getParameterValues("prSno");

        String costCenter = req.getParameter("costCenter");
        costCenter = "unsigned/0000";
        String cost[] = costCenter.split("/");
        String costCenterCode = cost[1];
        String costCenterdesc = cost[0];

        Date reqDate = (Date) formatter.parse(requitionDate);

        Map<String, String> suppmap = new HashMap<String, String>();

        List<PurchaseOrder> gridData = new ArrayList<PurchaseOrder>();
        Double grandTotal = 0.0;
        if (!"".equals(gt) && gt != null) {
            grandTotal = Double.parseDouble(gt);
        }

        ArrayList validuser = (ArrayList) purchDAO.purchOrderAutoGenNo(null, "1");
        String orderNoFinal = null;
        String poNo = null;
        int num = 1;
        if (!validuser.isEmpty()) {
            for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
                if (iter.next() != null) {
                    Iterator<String> iter2 = validuser.iterator();
                    iter2.hasNext();
                    orderNoFinal = String.valueOf(iter2.next());
                }
            }
            poNo = orderNoFinal;
        }
        if (poNo != null) {
            num = Integer.parseInt(poNo) + 1;
        }
        poNo = "PO" + year + "-" + num;

        for (int i = 0; i < itemName.length; i++) {
            poNo = "PO" + year + "-" + num;
            if (suppmap.containsKey(supName[i])) {
                poNo = suppmap.get(supName[i]);
            } else {
                num++;
            }
            suppmap.put(supName[i], poNo);

            List<SupplierMaster> supList = purchDAO.supplierCodeWiseList(orgId, supplierCode[i]);

            for (SupplierMaster supdetail : supList) {
                supaddress[i] = supdetail.getSupplierAddress().trim();
                supEmail[i] = supdetail.getEmailid().trim();
                payTerms = supdetail.getPaymentTerms();
                delTerms = supdetail.getDeliveryTerms();
            }
            Date deliveryDate1 = null;
            try {
                if (!"".equals(delDate) && delDate != null) {
                    deliveryDate1 = (Date) formatter.parse(delDate[i]);
                }
            } catch (NullPointerException ex) {
                // Do something/nothing if date2 is null
            }
            Double discount1 = 0.0, price1 = 0.0, totalprice = 0.0;

            if (!"".equals(discount[i]) && discount[i] != null) {
                discount1 = Double.parseDouble(discount[i]);
            }
            if (!"".equals(price[i]) && price[i] != null) {
                price1 = Double.parseDouble(price[i]);
            }
            if (!"".equals(total[i]) && total[i] != null) {
                totalprice = Double.parseDouble(total[i]);
            }

            String[] uom = unit.split("-");
            String reqUom = null;
            if (!uom[1].isEmpty() && uom[1] != null) {//uom[1]
                reqUom = uom[1];
            }

            List<Object> unit_Price = purchDAO.unitPriceCalc(itemCode[i], reqUom, price1);
            String uom1 = null, uom2 = null, uom3 = null;
            Double uom1Price = 0.0, uom2Price = 0.0, uom3Price = 0.0;

            for (int j = 0; j < unit_Price.size(); j++) {
                try {
                    uom1 = unit_Price.get(0).toString();
                    uom1Price = Double.parseDouble(df.format(unit_Price.get(1)));

                } catch (Exception e) {
                    uom1 = null;
                    uom1Price = 0.0;
                }

                try {
                    uom2 = unit_Price.get(2).toString();
                    uom2Price = Double.parseDouble(df.format(unit_Price.get(3)));

                } catch (Exception e) {
                    uom2 = null;
                    uom2Price = 0.0;
                }

                try {
                    uom3 = unit_Price.get(4).toString();
                    uom3Price = Double.parseDouble(df.format(unit_Price.get(5)));
                } catch (Exception e) {
                    uom3 = null;
                    uom3Price = 0.0;
                }
            }

//            PurchaseOrder po = new PurchaseOrder(userId, orgId, division, department, purchaseType, projectCode, projectName[i], poNo, newdate, reqNo[i], reqDate, userId,
//                    potype, currency, billToAddress, deliveryLoc, itemCat[i], itemsubCat[i], itemCode[i], itemName[i], itemDesc[i], reqUom, Double.parseDouble(qty[i]),
//                    price1, discount1, totalprice, grandTotal, deliveryDate1, payTerms, delTerms, "PO Created", supplierCode[i], supName[i], supaddress[i], supEmail[i],
//                    Integer.parseInt(prsno[i]), "update0", sqlTimestamp, costCenterCode, costCenterdesc, uom1, uom1Price, uom2, uom2Price, uom3, uom3Price);
//            gridData.add(po);

        }
        purchDAO.savePurchaseOrder(gridData, "reqPO");

        modelMap.addAttribute("purchReqList", purchDAO.appreovedReqList(userId, orgId, null));
//        return new ModelAndView("appreovedReqList", modelMap);
        return new ModelAndView(new RedirectView("approvedRequiList.htm"), modelMap);

    }

    @RequestMapping("/purchase/itemWiseSuppPopUp.htm")
    public ModelAndView itemWiseSuppPopUp(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String requisitionNo = req.getParameter("reqNo");
        String itemCode = req.getParameter("itemCode");
//        modelMap.addAttribute("itemWiseSuppList", purchreqdao.ItemWiseSupplier(orgId, "All", itemCode));
        modelMap.addAttribute("supplierList", purchDAO.supplierReqList(null, "Approved"));
        modelMap.addAttribute("action", req.getParameter("action"));
        modelMap.addAttribute("id", req.getParameter("id"));
        modelMap.addAttribute("itemCode", itemCode);
        modelMap.addAttribute("suppcode", req.getParameter("suppcode"));
        modelMap.addAttribute("suppname", req.getParameter("suppname"));
        modelMap.addAttribute("rowid", req.getParameter("rowid"));

        return new ModelAndView("../purchRequi/itemWiseSuppPopUp", modelMap);
    }
    /*@RequestMapping("/purchase/purchRequiView.htm")
     public ModelAndView purchReqView(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
     ModelMap modelMap = new ModelMap();
     HttpSession session = req.getSession(true);
     String userId = session.getAttribute("userId").toString();
     String orgId = session.getAttribute("orgId").toString();

     String requisitionNo = req.getParameter("reqNo");
     String action = req.getParameter("action");
     modelMap.addAttribute("purchReqList", purchDAO.autoGenNo(requisitionNo, "0"));
     modelMap.addAttribute("purchDocList", purchDAO.purchDocList(requisitionNo));
     if (action != null && action.equalsIgnoreCase("print")) {
     modelMap.addAttribute("subgrouplist", purchDAO.subgrouplist(null));
     return new ModelAndView("prPrint", modelMap);
     }

     modelMap.addAttribute("action", req.getParameter("action"));
     return new ModelAndView("../purchase/purchRequiView", modelMap);
     }*/
    /*@RequestMapping("/purchase/rejectedReqList.htm")
     public ModelAndView rejectedReqList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
     ModelMap modelMap = new ModelMap();
     HttpSession session = req.getSession(true);

     String userId = session.getAttribute("userId").toString();
     String orgId = session.getAttribute("orgId").toString();
     String reqNo = req.getParameter("reqNo");

     if (reqNo == null) {
     modelMap.addAttribute("purchReqList", purchDAO.rejectedReqList(userId, orgId, null));
     return new ModelAndView("rejectedReqList", modelMap);
     } else {
     modelMap.addAttribute("purchReqList", purchDAO.rejectedReqList(userId, orgId, reqNo));
     modelMap.addAttribute("purchDocList", purchDAO.purchDocList(reqNo));
     return new ModelAndView("../purchRequi/rejectedRequiView", modelMap);
     }
     }*/

    @RequestMapping("/purchase/supplierEnqList.htm")
    public ModelAndView supplierEnqList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String enqNo = req.getParameter("enqNo");
        String action = req.getParameter("action");
        String fromDate = req.getParameter("fromDate");
        String toDate = req.getParameter("toDate");
        if (fromDate != null && toDate != null) {
            if (fromDate.contains("frdate") && toDate.contains("todate")) {
                fromDate = null;
                toDate = null;
            }
        }

        if (fromDate == null || toDate == null) {
            if (action != null && action.equalsIgnoreCase("view")) {
                modelMap.addAttribute("supplierEnqList", purchDAO.supplierEnquiryList(userId, orgId, enqNo, null, null));
                return new ModelAndView("../supplier/supplierEnqView", modelMap);
            } else {
                modelMap.addAttribute("supplierEnqList", purchDAO.supplierEnquiryList(userId, orgId, null, null, null));
                modelMap.addAttribute("supplierList", purchDAO.supplierReqList(null, "Approved"));
                return new ModelAndView("../supplier/supplierEnqList", modelMap);
            }
        } else {
            if (action != null && action.equalsIgnoreCase("view")) {
                modelMap.addAttribute("supplierEnqList", purchDAO.supplierEnquiryList1(userId, orgId, enqNo, null, null, fromDate, toDate));
                return new ModelAndView("../supplier/supplierEnqView", modelMap);
            } else {
                modelMap.addAttribute("supplierEnqList", purchDAO.supplierEnquiryList1(userId, orgId, null, null, null, fromDate, toDate));
                modelMap.addAttribute("supplierList", purchDAO.supplierReqList1(null, "Approved", fromDate, toDate));
                return new ModelAndView("../supplier/supplierEnqList", modelMap);
            }
        }
    }

    @RequestMapping("/purchase/enquiredList.htm")
    public ModelAndView enquiredList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        modelMap.addAttribute("supplierEnqList", purchDAO.supplierEnquiryList(userId, orgId, null, null, "Enquiry Created"));
        modelMap.addAttribute("supplierList", purchDAO.supplierReqList(null, "Approved"));
        return new ModelAndView("../enquiry/enquiredList", modelMap);

    }

    @RequestMapping("/purchase/quotDelete.htm")
    public ModelAndView quotDelete(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String enqNo = req.getParameter("enqNo");
        String suppEmid = req.getParameter("suppEmid");
        purchDAO.globalInactive(enqNo, "SupplierEnquiry");
        modelMap.addAttribute("message", "Data Inactivated Successfully...");
        return new ModelAndView(new RedirectView("enquiredList.htm"), modelMap);
    }

    @RequestMapping("/purchase/quotActive.htm")
    public ModelAndView quotActive(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String enqNo = req.getParameter("enqNo");
        String suppEmid = req.getParameter("suppEmid");
        purchDAO.globalActive(enqNo, "SupplierEnquiry");
        modelMap.addAttribute("message", "Data Activated Successfully...");
        return new ModelAndView(new RedirectView("enquiredList.htm"), modelMap);
    }

    @RequestMapping("/purchase/quotationForm.htm")
    public ModelAndView quotationForm(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String enqNo = req.getParameter("enqNo");
        String suppEmid = req.getParameter("suppEmid");
        modelMap.addAttribute("supplierEnqList", purchDAO.supplierEnquiryList(userId, orgId, enqNo, suppEmid, "Enquiry Created"));
        modelMap.addAttribute("supplierList", purchDAO.supplierReqList(null, "Approved"));
        modelMap.addAttribute("paytermslist", purchDAO.TermsList(null, "Payment"));
        modelMap.addAttribute("delivtermslist", purchDAO.TermsList(null, "Delivery"));
        return new ModelAndView("../enquiry/quotationForm", modelMap);

    }

    @RequestMapping("/purchase/selectSuppnamePopup.htm")
    public ModelAndView selectSuppnamePopup(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String requisitionNo = req.getParameter("reqNo");
        modelMap.addAttribute("supplierList", purchDAO.supplierReqList(null, "Approved"));
        modelMap.addAttribute("action", req.getParameter("action"));
        return new ModelAndView("../enquiry/selectSuppnamePopup", modelMap);
    }

    @RequestMapping("/purchase/quotSubmit.htm")
    public ModelAndView quotSubmit(HttpServletRequest req, HttpServletResponse res) throws ParseException, SQLException, IOException {
        java.util.Date newdate = new java.util.Date();
        long t = newdate.getTime();
        java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(t);
        HttpSession session = req.getSession();

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();

        String projectCode = req.getParameter("projectCode");
        String projectName[] = req.getParameterValues("prName");
        String reqNo = req.getParameter("reqNo");
        String requitionDate = req.getParameter("reqDate");
        String itemsubCat[] = req.getParameterValues("itemsubCat");
        String itemCat[] = req.getParameterValues("itemCat");
        String itemCode[] = req.getParameterValues("itemCode");
        String itemName[] = req.getParameterValues("itemName");
        String itemDesc[] = req.getParameterValues("itemDesc");
        String unit[] = req.getParameterValues("unit");
        String purchaseType = req.getParameter("purchaseType");
        String department = req.getParameter("dept");
        String division = req.getParameter("division");
        String enqNo = req.getParameter("enqNo");
        String enqDate = req.getParameter("enqDate");
        String quoNo = req.getParameter("quoNo");
        String quoDate = req.getParameter("quoDate");
        String qty[] = req.getParameterValues("qty");
        String prsno[] = req.getParameterValues("prSno");
        String enqSno[] = req.getParameterValues("enqSno");
        String delDate[] = req.getParameterValues("delDate");
        String deliveryLoc = req.getParameter("deliveryLoc");
        String discount[] = req.getParameterValues("discount");
        String price[] = req.getParameterValues("price");
        String total[] = req.getParameterValues("total");
        String specialSpec = req.getParameter("specialSpec");
        String payTerms = req.getParameter("payTerms");
        String delTerms = req.getParameter("delTerms");

        //String status[]=req.getParameterValues("status");
        String supName = req.getParameter("supName");
        String supaddress = req.getParameter("supaddress");
        String supplierCode = req.getParameter("supplierCode");
        String supEmail = req.getParameter("supEmail");
        Date reqDate1 = (Date) formatter.parse(requitionDate);

        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
        MultipartFile multipartFile = multipartRequest.getFile("quotfile");
        String fileName = multipartFile.getOriginalFilename();
        PurchaseAttachments pa = new PurchaseAttachments(userId, orgId, enqNo, fileName, multipartFile.getBytes(), newdate, "upadte0", sqlTimestamp);

        List<SupplierQuotation> gridData = new ArrayList<SupplierQuotation>();
        for (int i = 0; i < itemCode.length; i++) {
            Date deliveryDate1 = null;
            try {
                if (!"".equals(delDate[i]) && delDate[i] != null) {
                    deliveryDate1 = (Date) formatter.parse(delDate[i]);
                }
            } catch (NullPointerException ex) {
                // Do something/nothing if date2 is null
            }
            Double discount1 = 0.0, price1 = 0.0, totalprice = 0.0;
            if (!"".equals(discount[i]) && discount[i] != null) {
                discount1 = Double.parseDouble(discount[i]);
            }
            if (!"".equals(price[i]) && price[i] != null) {
                price1 = Double.parseDouble(price[i]);
            }
            if (!"".equals(total[i]) && total[i] != null) {
                totalprice = Double.parseDouble(total[i]);
            }
            Date enqDate1 = (Date) formatter.parse(enqDate);
            Date quoDate1 = (Date) formatter.parse(quoDate);

            SupplierQuotation supquot = new SupplierQuotation(userId, orgId, enqNo, enqDate1, division,
                    department, projectCode, projectName[i], reqNo, reqDate1, purchaseType,
                    supplierCode, supName, supEmail, supaddress, quoNo, quoDate1, payTerms,
                    delTerms, specialSpec, itemCat[i], itemsubCat[i], itemCode[i], itemName[i], itemDesc[i],
                    unit[i], Double.parseDouble(qty[i]), deliveryLoc, deliveryDate1, discount1,
                    price1, totalprice, Integer.parseInt(prsno[i]), Integer.parseInt(enqSno[i]), "update0",
                    sqlTimestamp, "Quotation Created");

            gridData.add(supquot);

        }
        purchDAO.saveQuotation(gridData);
        if (!fileName.isEmpty()) {
            purchDAO.saveAttch(pa);
        }

        modelMap.addAttribute("supplierEnqList", purchDAO.supplierEnquiryList(userId, orgId, null, null, "Enquiry Created"));
        modelMap.addAttribute("supplierList", purchDAO.supplierReqList(null, "Approved"));
        return new ModelAndView(new RedirectView("../purchase/enquiredList.htm"), modelMap);
    }

    @RequestMapping("/purchase/chkQuotno.htm")
    public void chkQuotno(HttpServletRequest req, HttpServletResponse res) throws IOException {
        HttpSession session = req.getSession(true);
        String quotationNo = req.getParameter("quotNo").trim();
        purchDAO.chkQuotno(req, res, quotationNo);
    }

    @RequestMapping("/purchase/quotList.htm")
    public ModelAndView quotList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        modelMap.addAttribute("quotList", purchDAO.quotList(userId, orgId, null, "Quotation Created"));
        modelMap.addAttribute("supplierList", purchDAO.supplierReqList(null, "Approved"));
        return new ModelAndView("../enquiry/quotList", modelMap);

    }

    @RequestMapping("/purchase/checkEnterQuot.htm")
    public void checkEnterQuot(HttpServletRequest req, HttpServletResponse res) throws IOException {
        HttpSession session = req.getSession(true);
        String enquiriesNo = req.getParameter("enquiriesNo");
        purchDAO.checkEnterQuot(req, res, enquiriesNo);
    }

    @RequestMapping("/purchase/quotCompForm.htm")
    public ModelAndView quotCompForm(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String reqNo = req.getParameter("reqNo");
        String quotNo = req.getParameter("quotNo");
        String action = req.getParameter("action");
        String enqNo = req.getParameter("enqNo");
        modelMap.addAttribute("purchDocList", purchDAO.purchDocList(enqNo));
        if (action != null && action.equalsIgnoreCase("view")) {
            modelMap.addAttribute("quotList", purchDAO.quotCompList(userId, orgId, reqNo, "Quotation Created", enqNo));
            modelMap.addAttribute("itemList", purchDAO.quotItemCompList(userId, orgId, reqNo, "Quotation Created", enqNo));
            modelMap.addAttribute("supplierList", purchDAO.supplierReqList(null, "Approved"));
            return new ModelAndView("../enquiry/quotCompView", modelMap);
        }

        modelMap.addAttribute("quotList", purchDAO.quotCompList(userId, orgId, reqNo, "Quotation Created", enqNo));
        modelMap.addAttribute("itemList", purchDAO.quotItemCompList(userId, orgId, reqNo, "Quotation Created", enqNo));
        modelMap.addAttribute("supplierList", purchDAO.supplierReqList(null, "Approved"));
        return new ModelAndView("../enquiry/quotCompForm", modelMap);

    }

    @RequestMapping("/purchase/quotCompFormSubmit.htm")
    public ModelAndView quotCompFormSubmit(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String reqNo = req.getParameter("reqNo");
        String qty[] = req.getParameterValues("qty");
        String unitPrice[] = req.getParameterValues("price");
        String discount[] = req.getParameterValues("discount");
        String total[] = req.getParameterValues("total");
        String pk[] = req.getParameterValues("pk");
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        for (int i = 0; i < pk.length; i++) {

            purchDAO.updateQuotDetails(pk[i], Double.parseDouble(qty[i]), Double.parseDouble(unitPrice[i]), Double.parseDouble(discount[i]), Double.parseDouble(total[i]), "Quotation Compared");

        }

        modelMap.addAttribute("quotList", purchDAO.quotList(userId, orgId, null, "Quotation Created"));
        modelMap.addAttribute("supplierList", purchDAO.supplierReqList(null, "Approved"));
        return new ModelAndView("../enquiry/quotList", modelMap);

    }

    @RequestMapping("/purchase/comparedQuotList.htm")
    public ModelAndView comparedQuotList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        modelMap.addAttribute("quotList", purchDAO.quotList(userId, orgId, null, "Quotation Compared"));
        modelMap.addAttribute("supplierList", purchDAO.supplierReqList(null, "Approved"));
        return new ModelAndView("../enquiry/comparedQuotList", modelMap);

    }

    @RequestMapping("/purchase/comparedQuotForm.htm")
    public ModelAndView comparedQuotForm(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String reqNo = req.getParameter("reqNo");
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String recStatus = req.getParameter("recStatus");
        String action = req.getParameter("action");
        String quotNo = req.getParameter("quotNo");
        String enqNo = req.getParameter("enqNo");
        modelMap.addAttribute("purchDocList", purchDAO.purchDocList(enqNo));
        if (recStatus != null && !recStatus.isEmpty()) {
            purchDAO.updateQuotStatus(reqNo, recStatus);
            return new ModelAndView("../enquiry/comparedQuotList", modelMap);
        }
        if (action != null) {
            if (action.equalsIgnoreCase("Approve")) {
                purchDAO.updateQuotStatus(reqNo, recStatus);
                return new ModelAndView("../enquiry/comparedQuotList", modelMap);
            }
        }
        modelMap.addAttribute("action", action);
        modelMap.addAttribute("quotList", purchDAO.quotCompList(userId, orgId, reqNo, "Quotation Compared", enqNo));
        modelMap.addAttribute("itemList", purchDAO.quotItemCompList(userId, orgId, reqNo, "Quotation Compared", enqNo));
        modelMap.addAttribute("groupSupList", purchDAO.groupSupList(userId, orgId, reqNo, "Quotation Compared"));
        modelMap.addAttribute("supplierList", purchDAO.supplierReqList(null, "Approved"));
        return new ModelAndView("../enquiry/comparedQuotForm", modelMap);

    }

    @RequestMapping("/purchase/quotApprove.htm")
    public ModelAndView quotApprove(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        java.util.Date newdate = new java.util.Date();
        long t = newdate.getTime();
        java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(t);
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String reqNo = req.getParameter("reqNo");
        String checkedradioPk[] = req.getParameterValues("checkedradio");
        String remarks = req.getParameter("remarks");

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        for (int i = 0; i < checkedradioPk.length; i++) {

            String qty = req.getParameter("qty" + checkedradioPk[i]);
            String uprice = req.getParameter("price" + checkedradioPk[i]);
            String disc = req.getParameter("discount" + checkedradioPk[i]);
            String total = req.getParameter("total" + checkedradioPk[i]);
            Double quantity = 0.0;
            if (!"".equals(qty) && qty != null) {
                quantity = Double.parseDouble(qty);
            }
            Double unitprice = 0.0;
            if (!"".equals(uprice) && uprice != null) {
                unitprice = Double.parseDouble(uprice);
            }
            Double discount = 0.0;
            if (!"".equals(disc) && disc != null) {
                discount = Double.parseDouble(disc);
            }
            Double totalPrice = 0.0;
            if (!"".equals(total) && total != null) {
                totalPrice = Double.parseDouble(total);
            }
            purchDAO.updateQuotApprover(userId, remarks, formatter4.format(sqlTimestamp), checkedradioPk[i], quantity, unitprice, discount, totalPrice,
                    "Quotation Approved", reqNo);
        }

        modelMap.addAttribute("quotList", purchDAO.quotList(userId, orgId, null, "Quotation Compared"));
        modelMap.addAttribute("supplierList", purchDAO.supplierReqList(null, "Approved"));
        return new ModelAndView("../enquiry/comparedQuotList", modelMap);

    }

    @RequestMapping("/purchase/approvedQuotList.htm")
    public ModelAndView approvedQuotList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String fromDate = req.getParameter("fromDate");
        String toDate = req.getParameter("toDate");
        if (fromDate != null && toDate != null) {
            if (fromDate.contains("frdate") && toDate.contains("todate")) {
                fromDate = null;
                toDate = null;
            }
        }

        if (fromDate == null || toDate == null) {

            modelMap.addAttribute("quotList", purchDAO.approvedQuotList(userId, orgId, null, "Quotation Approved"));
            modelMap.addAttribute("supplierList", purchDAO.supplierReqList(null, "Approved"));
        } else {
            modelMap.addAttribute("quotList", purchDAO.approvedQuotList1(userId, orgId, null, "Quotation Approved", fromDate, toDate));
            modelMap.addAttribute("supplierList", purchDAO.supplierReqList1(null, "Approved", fromDate, toDate));
        }
        return new ModelAndView("../enquiry/approvedQuotList", modelMap);

    }

    @RequestMapping("/purchase/quotPOform.htm")
    public ModelAndView quotPOform(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String quotNo = req.getParameter("quotNo");

        modelMap.addAttribute("quotList", purchDAO.approvedQuotList(userId, orgId, quotNo, "Quotation Approved"));
        modelMap.addAttribute("supplierList", purchDAO.supplierReqList(null, "Approved"));
        modelMap.addAttribute("currencyList", purchDAO.currencyList(null));
        modelMap.addAttribute("costCenterList", purchDAO.costCenterList(null));
        modelMap.addAttribute("paytermslist", purchDAO.TermsList(null, "Payment"));
        modelMap.addAttribute("delivtermslist", purchDAO.TermsList(null, "Delivery"));
        return new ModelAndView("../enquiry/quotPOform", modelMap);

    }

    @RequestMapping("/purchase/quotPOformSubmit.htm")
    public ModelAndView quotPOformSubmit(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException, MessagingException {
        java.util.Date newdate = new java.util.Date();
        long t = newdate.getTime();
        java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(t);
        int year = Calendar.getInstance().get(Calendar.YEAR);
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        DecimalFormat df = new DecimalFormat("#.000");

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String projectCode = req.getParameter("prCode");
        String projectName[] = req.getParameterValues("prName");
        String reqNo = req.getParameter("reqNo");
        String requitionDate = req.getParameter("reqDate");
        String itemsubCat[] = req.getParameterValues("itemsubCat");
        String itemCat[] = req.getParameterValues("itemCat");
        String itemCode[] = req.getParameterValues("itemCode");
        String itemName[] = req.getParameterValues("itemName");
        String itemDesc[] = req.getParameterValues("itemDesc");
        String unit[] = req.getParameterValues("unit");
        String purchaseType = req.getParameter("purchaseType");
        String department = req.getParameter("dept");
        String division = req.getParameter("division");
        String enqNo = req.getParameter("enqNo");
        String enqDate = req.getParameter("enqDate");
        String quoNo = req.getParameter("quoNo");
        String quoDate = req.getParameter("quoDate");
        String qty[] = req.getParameterValues("qty");
        String prsno[] = req.getParameterValues("prSno");
        String enqSno[] = req.getParameterValues("enqSno");
        String delDate[] = req.getParameterValues("delDate");
        String deliveryLoc = req.getParameter("deliveryLoc").trim();
        String discount[] = req.getParameterValues("discount");
        String price[] = req.getParameterValues("price");
        String total[] = req.getParameterValues("total");
        String gt = req.getParameter("grandTotal");
        String payTerms = req.getParameter("payTerms");
        String delTerms = req.getParameter("delTerms");

        //String status[]=req.getParameterValues("status");
        String supName = req.getParameter("supName");
        String supaddress = req.getParameter("supaddress").trim();
        String supplierCode = req.getParameter("supplierCode");
        String supEmail = req.getParameter("supEmail");

        String potype = req.getParameter("potype");
        String currency = req.getParameter("currency");

        String loc[] = req.getParameterValues("loc");
        String quotSno[] = req.getParameterValues("quotSno");

        String quotNo = req.getParameter("quotationNo");
        String billToAddress = req.getParameter("billToAddress").trim();
        String poNote = req.getParameter("poNote");
        String quotationDate = req.getParameter("quotDate");
        String warranty[] = req.getParameterValues("warranty");
        String status[] = req.getParameterValues("status");
        String remarks = req.getParameter("remarks");
        String lumDis = req.getParameter("lumsumdiscount");
        lumDis = "0";
        String costCenter = req.getParameter("costCenter");
        costCenter = "unsigned/0000";
        String cost[] = costCenter.split("/");
        String costCenterCode = cost[1];
        String costCenterdesc = cost[0];

        Date reqDate = (Date) formatter.parse(requitionDate);
        Date quotDate = (Date) formatter.parse(quotationDate);
        ArrayList validuser = (ArrayList) purchDAO.purchOrderAutoGenNo(null, "1");
        String orderNoFinal = null;
        String poNo = null;
        int num = 1;
        if (!validuser.isEmpty()) {
            for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
                if (iter.next() != null) {
                    Iterator<String> iter2 = validuser.iterator();
                    iter2.hasNext();
                    orderNoFinal = String.valueOf(iter2.next());
                }
            }
            poNo = orderNoFinal;
        }
        if (poNo != null) {
            num = Integer.parseInt(poNo) + 1;
        }
        poNo = "PO" + year + "-" + num;

        List<PurchaseOrder> gridData = new ArrayList<PurchaseOrder>();
        Double grandTotal = 0.0, lumsumdiscount = 0.0;
        if (!"".equals(gt) && gt != null) {
            grandTotal = Double.parseDouble(gt);
        }
        if (!"".equals(lumDis) && lumDis != null) {
            lumsumdiscount = Double.parseDouble(lumDis);
        }
        for (int i = 0; i < itemName.length; i++) {
            Date deliveryDate1 = null;
            try {
                if (!"".equals(delDate[i]) && delDate[i] != null) {
                    deliveryDate1 = (Date) formatter.parse(delDate[i]);
                }
            } catch (NullPointerException ex) {
                // Do something/nothing if date2 is null
            }
            Double discount1 = 0.0, price1 = 0.0, totalprice = 0.0;

            if (!"".equals(discount[i]) && discount[i] != null) {
                discount1 = Double.parseDouble(discount[i]);
            }
            if (!"".equals(price[i]) && price[i] != null) {
                price1 = Double.parseDouble(price[i]);
            }
            if (!"".equals(total[i]) && total[i] != null) {
                totalprice = Double.parseDouble(total[i]);
                grandTotal = grandTotal + totalprice;
            }

            String[] uom = unit[i].split("-");
            String reqUom = null;
            if (!uom[1].isEmpty() && uom[1] != null) {//uom[1]
                reqUom = uom[1];
            }

            List<Object> unit_Price = purchDAO.unitPriceCalc(itemCode[i], reqUom, price1);
            String uom1 = null, uom2 = null, uom3 = null;
            Double uom1Price = 0.0, uom2Price = 0.0, uom3Price = 0.0;

            for (int j = 0; j < unit_Price.size(); j++) {
                try {
                    uom1 = unit_Price.get(0).toString();
                    uom1Price = Double.parseDouble(df.format(unit_Price.get(1)));

                } catch (Exception e) {
                    uom1 = null;
                    uom1Price = 0.0;
                }

                try {
                    uom2 = unit_Price.get(2).toString();
                    uom2Price = Double.parseDouble(df.format(unit_Price.get(3)));

                } catch (Exception e) {
                    uom2 = null;
                    uom2Price = 0.0;
                }

                try {
                    uom3 = unit_Price.get(4).toString();
                    uom3Price = Double.parseDouble(df.format(unit_Price.get(5)));
                } catch (Exception e) {
                    uom3 = null;
                    uom3Price = 0.0;
                }
            }
//poNo="PO-6";// temprovary no we have to delete
//            PurchaseOrder po = new PurchaseOrder(userId, orgId, division, department, purchaseType, projectCode, projectName[i], poNo, newdate, reqNo, reqDate, userId,
//                    quotNo, quotDate, potype, currency, billToAddress, deliveryLoc, itemCat[i], itemsubCat[i], itemCode[i], itemName[i], itemDesc[i].trim(), reqUom, Double.parseDouble(qty[i]),
//                    price1, discount1, totalprice, grandTotal, deliveryDate1, warranty[0], payTerms, delTerms, poNote, "PO Created", supplierCode, supName, supaddress, supEmail,
//                    Integer.parseInt(prsno[i]), Integer.parseInt(quotSno[i]), remarks, "update0", sqlTimestamp, lumsumdiscount, costCenterCode, costCenterdesc, uom1, uom1Price, uom2, uom2Price, uom3, uom3Price);
//            gridData.add(po);
        }
        purchDAO.savePurchaseOrder(gridData, null);

        String subject = "Purchase order created for approval PO.NO :" + poNo;
        String mailbody = " Please find the Purchase Order No : " + poNo + " and approve.";
        purchDAO.approverEmail(userId, orgId, subject, mailbody, "Level-1", "Purchase Order");

        modelMap.addAttribute("quotList", purchDAO.approvedQuotList(userId, orgId, quotNo, "Quotation Approved"));
        modelMap.addAttribute("supplierList", purchDAO.supplierReqList(null, "Approved"));
        modelMap.addAttribute("currencyList", purchDAO.currencyList(null));
        modelMap.addAttribute("message", "Data Saved Successfully...");
        return new ModelAndView(new RedirectView("approvedQuotList.htm"), modelMap);

    }

    @RequestMapping("/purchase/uomlist.htm")
    public void uomlist(HttpServletRequest req, HttpServletResponse res) throws IOException {
        HttpSession session = req.getSession(true);
        String code = req.getParameter("code");
        purchDAO.uomlist(req, res, code);
    }

    @RequestMapping("/purchase/uomWiseUnitPrice.htm")
    public void uomWiseUnitPrice(HttpServletRequest req, HttpServletResponse res) throws IOException {
        HttpSession session = req.getSession(true);
        String code = req.getParameter("code");
        String suppCode = req.getParameter("suppCode");
        String uom = req.getParameter("uom");
        purchDAO.uomWiseUnitPrice(req, res, code, suppCode, uom);
    }

    @RequestMapping("/purchase/billToLocPopUp.htm")
    public ModelAndView billToLocPopUp(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        modelMap.addAttribute("billToLocList", purchDAO.billToLoc());
        return new ModelAndView("../purchRequi/billToLocPopUp", modelMap);
    }

    @RequestMapping("/purchase/allQuotList.htm")
    public ModelAndView allQuotList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        modelMap.addAttribute("quotList", purchDAO.allQuotList(userId, orgId, null, "Quotation Approved"));
        modelMap.addAttribute("supplierList", purchDAO.supplierReqList(null, "Approved"));
        return new ModelAndView("../enquiry/allQuotList", modelMap);

    }

    @RequestMapping("/purchase/allQuotForm.htm")
    public ModelAndView allQuotForm(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String quotNo = req.getParameter("quotNo");

        modelMap.addAttribute("quotList", purchDAO.allQuotList(userId, orgId, quotNo, null));
        modelMap.addAttribute("supplierList", purchDAO.supplierReqList(null, "Approved"));
        modelMap.addAttribute("currencyList", purchDAO.currencyList(null));
        modelMap.addAttribute("costCenterList", purchDAO.costCenterList(null));
        modelMap.addAttribute("paytermslist", purchDAO.TermsList(null, "Payment"));
        modelMap.addAttribute("delivtermslist", purchDAO.TermsList(null, "Delivery"));
        return new ModelAndView("../enquiry/allQuotForm", modelMap);

    }

    @RequestMapping("/purchase/poPaginationList.htm")
    public void poPaginationList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("application/Json");
        PrintWriter out = res.getWriter();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        // ---------Json getting the value for each action like search,first,previous,last and show dropdown in front end---------
        String searchData = req.getParameter("sSearch");
        Integer displayLength = Integer.parseInt(req.getParameter("iDisplayLength"));
        Integer sEcho = Integer.parseInt(req.getParameter("sEcho"));
        Integer iDisplayStart = Integer.parseInt(req.getParameter("iDisplayStart"));

        List<PurchaseOrder> list = null;
        BigInteger listCount = null;
        Gson gson = new Gson();
        JsonObject jsonResponse = new JsonObject();

        String listPage = req.getParameter("listPage");
        String poStatus = req.getParameter("poStatus");

        String sCol = req.getParameter("iSortCol_0");
        String sdir = req.getParameter("sSortDir_0");
        String sdir1 = req.getParameter("sColumns");
        String sdir2 = req.getParameter("more_data");
        String sTitle = req.getParameter("iSortTitle_1");
            String fromDate = req.getParameter("fromDate");
        String toDate = req.getParameter("toDate");

        if (listPage.equalsIgnoreCase("poList")) {
            if (fromDate == null || toDate == null||fromDate == "" || toDate == "") {
                if (searchData == null || searchData.isEmpty()) {
                    list = purchDAO.poPaginationList(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, null, sCol, listPage);
                    listCount = purchDAO.poCount(userId, orgId, null, searchData, sdir, null, listPage);
                } else {
                    list = purchDAO.poPaginationList(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, null, sCol, listPage);
                    listCount = purchDAO.poCount(userId, orgId, null, searchData, sdir, null, listPage);
                }
            } else{
                if (searchData == null || searchData.isEmpty()) {
                    list = purchDAO.poPaginationList1(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, null, sCol, listPage, fromDate, toDate);
                    listCount = purchDAO.poCount1(userId, orgId, null, searchData, sdir, null, listPage, fromDate, toDate);
                } else {
                    list = purchDAO.poPaginationList1(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, null, sCol, listPage, fromDate, toDate);
                    listCount = purchDAO.poCount1(userId, orgId, null, searchData, sdir, null, listPage, fromDate, toDate);
                }
            }

        }
        if (listPage.equalsIgnoreCase("approvedPoList")) {

            if (poStatus != null && poStatus.equalsIgnoreCase("PMList")) {
                poStatus = "PO Created";
            }
            if (poStatus != null && poStatus.equalsIgnoreCase("FMList")) {
                poStatus = "PM Approved";
            }
            if (poStatus != null && poStatus.equalsIgnoreCase("GMList")) {
                poStatus = "FM Approved";
            }
            if (poStatus != null && poStatus.equalsIgnoreCase("AllList")) {
                poStatus = "Approved";
            }

            if (searchData == null || searchData.isEmpty()) {
                list = purchDAO.poPaginationList(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, poStatus, sCol, listPage);
                listCount = purchDAO.poCount(userId, orgId, null, searchData, sdir, poStatus, listPage);

            } else {
                list = purchDAO.poPaginationList(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, poStatus, sCol, listPage);
                listCount = purchDAO.poCount(userId, orgId, null, searchData, sdir, poStatus, listPage);

            }
        }
        if (listPage.equalsIgnoreCase("pendingPoList")) {
            if (searchData == null || searchData.isEmpty()) {
                list = purchDAO.poPaginationList(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, "PendingPO", sCol, listPage);
                listCount = purchDAO.poCount(userId, orgId, null, searchData, sdir, "PendingPO", listPage);

            } else {
                list = purchDAO.poPaginationList(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, "PendingPO", sCol, listPage);
                listCount = purchDAO.poCount(userId, orgId, null, searchData, sdir, "PendingPO", listPage);

            }
        }

        // ---------Json setting the value for each action like search,first,previous,last and show dropdown in front end---------
        jsonResponse.add("iDisplayLength", gson.toJsonTree(displayLength));
        jsonResponse.add("iTotalRecords", gson.toJsonTree(listCount));
        jsonResponse.add("iTotalDisplayRecords", gson.toJsonTree(listCount));
        jsonResponse.add("sEcho", gson.toJsonTree(sEcho));
        jsonResponse.add("iDisplayStart", gson.toJsonTree(iDisplayStart));
        jsonResponse.add("aaData", gson.toJsonTree(list));
        out.print(jsonResponse);
        out.flush();

    }

    @RequestMapping("/purchase/sendEmailpopup.htm")
    public ModelAndView sendEmailpopup(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String poNo = req.getParameter("poNo");

        String requisitionNo = req.getParameter("reqNo");
        modelMap.addAttribute("poList", purchDAO.poNoList(userId, orgId, poNo, null));
        modelMap.addAttribute("action", req.getParameter("action"));
        modelMap.addAttribute("id", req.getParameter("poNo"));
        modelMap.addAttribute("suppcode", req.getParameter("suppcode"));
        modelMap.addAttribute("suppname", req.getParameter("suppname"));
        return new ModelAndView("../purchOrder/sendEmailpopup", modelMap);
    }

    @RequestMapping("/purchase/sendPOEmail.htm")
    public ModelAndView sendPOEmail(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, MessagingException, DocumentException, ReportProcessingException, ResourceException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String poNo = req.getParameter("poNo");
        String suppEmails = req.getParameter("suppEmail");
        StringBuilder emailId = new StringBuilder(suppEmails);

        Common cm = new Common();
        String subject = "", tbody = "", mailbody = "", pdfbody = "", suppName = "", suppAdd = "";
        String userEmail = "excelajh123@gmail.com";
        String password = "excel123";
        String supptoEmail = "";
        String reqNo = "", divisonName = "", purchType = "", preparedBy = "";
        String billtoLoc = "", shiptoLoc = "", payTerms = "", delTerms = "", ponote = "", fileName = "";
        Date poDate = null, reqDate = null;
        Double grandTotal = 0.0;
        String from = "";
        String pass = "";
        String hostName = null, cc = null;
        String ccMail[] = null;
        String sendToMail[];
        String moudleName = "Purchase Order";

        List<HostEmailConfig> hostEmailCofig = purchDAO.hostEmailCofig(userId, orgId, moudleName);
        for (HostEmailConfig hostEmailCofig1 : hostEmailCofig) {
            if (hostEmailCofig1.getEmailFrom() != null) {
                from = hostEmailCofig1.getEmailFrom();
            }
            if (hostEmailCofig1.getPasswordFrom() != null) {
                pass = hostEmailCofig1.getPasswordFrom();
            }
            if (hostEmailCofig1.getHostName() != null) {
                hostName = hostEmailCofig1.getHostName();
            }
            if (hostEmailCofig1.getEmailCc() != null) {
                cc = hostEmailCofig1.getEmailCc();
            }

        }
        if (cc != null) {
            emailId.append(",");
            emailId.append(cc);
            ccMail = emailId.toString().split(",");
        }

//        if (!userEmail.isEmpty() && !password.isEmpty()) {
        if (!from.isEmpty() && !pass.isEmpty()) {

            List<PurchaseOrder> po = purchDAO.poNoList(userId, orgId, poNo, null);
            if (po.size() > 0) {
//                int i = 1;
//                String desc = "";
                for (PurchaseOrder polist : po) {
//                    if (polist.getDescription() != null) {
//                        desc = polist.getDescription().replace("&", "and");
//                    }
//                    tbody = tbody + "<tr style='text-align:center;'><td>" + i + "</td>"
//                            //                            + "<td>" + polist.getItemSubCategory() + "</td>"
//                            + "<td>" + polist.getItemName().replace("&", "and") + "</td>"
//                            + "<td>" + desc + "</td>"
//                            + "<td>" + polist.getQty() + "</td>"
//                            + "<td>" + polist.getUom() + "</td>"
//                            + "<td>" + polist.getDiscount() + "</td>"
//                            + "<td>" + polist.getUnitPrice() + "</td>"
//                            + "<td>" + polist.getRequiredDate() + "</td>"
//                            + "<td>" + polist.getTotalValue() + "</td>"
//                            + "</tr>";

//                    poDate = polist.getPurchaseOrderDate();
//                    if (polist.getPoNote() != null) {
//                        ponote = polist.getPoNote().replace("&", "and");
//                    }
//                    if (polist.getPrNo() != null) {
//                        reqNo = polist.getPrNo();
//                    }
//                    if (polist.getPrDate() != null) {
//                        reqDate = polist.getPrDate();
//                    }
//
//                    divisonName = polist.getDivisionName();
//
//                    if (polist.getPurchaseType() != null) {
//                        purchType = polist.getPurchaseType();
//                    }
//
//                    preparedBy = polist.getUserId();
//                    suppAdd = polist.getSupplierAddress();
//
//                    if (polist.getBillToLocation() != null) {
//                        billtoLoc = polist.getBillToLocation();
//                    }
//                    if (polist.getShipToLocation() != null) {
//                        shiptoLoc = polist.getShipToLocation();
//                    }
//                    grandTotal = grandTotal + polist.getTotalValue();
//                    if (polist.getPaymentTerms() != null) {
//                        payTerms = polist.getPaymentTerms().replace("&", "and");
//                    }
//
//                    if (polist.getDeliveryTerms() != null) {
//                        delTerms = polist.getDeliveryTerms().replace("&", "and");
//                    }
                    suppName = polist.getSupplierName();
                    supptoEmail = polist.getSupplierEmail();
                    break;
//                    i++;
                }
//                emailId.append(",");
//                emailId.append(supptoEmail);
//                String[] sendEmail = emailId.toString().split(",");
                sendToMail = supptoEmail.split(",");

                subject = "Purchase Order NO: " + poNo + " -" + suppName;
                fileName = "PO NO: " + poNo + "_" + suppName + ".pdf";

//---------------------------- PO PDF report integration-------------------------------------------------------- 
                mailbody = "<html><body>Dear Sir/Madam,<br/><br/><br/>Please find attached PO No: " + poNo + "  and kindly arrange shipment as mentioned in PO."
                        + "<br/><br/><br/><br/>If you have any doubts please let us know.</body></html>";

                String reportPath = null, reportFormat = "PDF";
                if ((poNo != null)) {
                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        reportPath = "file:" + req.getSession().getServletContext().getRealPath("reportfiles//POPrint.prpt");
                    } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                        reportPath = "file:" + req.getSession().getServletContext().getRealPath("reportfiles//POPrint.prpt");
                    } else if (reportFormat.equalsIgnoreCase("HTML")) {
                        reportPath = "file:" + req.getSession().getServletContext().getRealPath("reportfiles//POPrint.prpt");
                    } else if (reportFormat.equalsIgnoreCase("CSV")) {
                        reportPath = "file:" + req.getSession().getServletContext().getRealPath("reportfiles//POPrint.prpt");
                    }
                }
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                HashMap reportParams = new HashMap();
                reportParams.put("poNo", poNo);
                if (reportPath != null) {
                    ClassicEngineBoot.getInstance().start();
                    ResourceManager manager = new ResourceManager();
                    manager.registerDefaults();
                    Resource resource = manager.createDirectly(new URL(reportPath), MasterReport.class);
                    MasterReport report = (MasterReport) resource.getResource();
                    for (Object key : reportParams.keySet()) {
                        report.getParameterValues().put(key.toString(), reportParams.get(key));
                    }
                    if (reportFormat.equalsIgnoreCase("PDF")) {
                        try {
                            PdfReportUtil.createPDF(report, baos);

//                            cm.sendEmail(userEmail, password, sendEmail, subject, mailbody, baos, fileName);
                            cm.sendEmail1(from, pass, sendToMail, subject, mailbody, baos, fileName, ccMail, hostName);
                            purchDAO.emailStatusUpdate(poNo, "Resend Email");

                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                    }

                }

//------------------------------- OLD Code for sending po email as pdf---------------------------------------------------------------------
//                String filepath = req.getSession().getServletContext().getRealPath("common/theme/images/Torque-Logo.jpg");
//                mailbody = "<html><body>Dear Sir/Madam,<br/><br/><br/>Please find attached PO No: " + poNo + "  and kindly arrange shipment as mentioned in PO."
//                        + "<br/><br/><br/><br/>If you have any doubts please let us know.</body></html>";
//                pdfbody = "                <html>"
//                        + "                         <head>"
//                        + "                             <title></title>"
//                        + "                         </head>"
//                        + "                         <body>"
//                        + "<div style='text-align:center;margin-left: auto;margin-right: auto;display: block;'></div>"
//                        + "                             <table style='width:100%;border:1px solid black;border-collapse: collapse;'>"
//                        + "                         	"
//                        + "                         	<tr><td><img style='height: 60px;width: 120px' src='" + filepath + "' /></td>"
//                        + "<td><h3>PURCHASE ORDER</h3></td></tr>"
//                        + "                         	</table>"
//                        + "                         <table style='width:100%;border-collapse: collapse;border:1px solid black;'>"
//                        + "    <tr><td>   To, <br/> "
//                        + suppName.replace("&", "and") + " <br/>	"
//                        + suppAdd.replace("&", "and") + " <br/>	"
//                        + toEmail + ""
//                        + "                    </td>  <br/>     	"
//                        + "                       </tr>  	"
//                        + "                         	</table>"
//                        + "                         	<table style='width:100%;border-collapse: collapse;border:1px solid black;'>"
//                        + "     <tr> <td></td>    </tr>              	<tr><td>"
//                        + "                               PO No: " + poNo
//                        + "                         <br/>	"
//                        + "                               PO Date: " + poDate
//                        + "                         	<br/>	"
//                        + "                               Requisition No: "
//                        + reqNo
//                        + "                         <br/>"
//                        + "                               Requisition Date:  "
//                        + reqDate
//                        + "                         	"
//                        + "                         	</td>"
//                        + "                         	"
//                        + "                         	<td> Division Name:   "
//                        + divisonName.replace("&", "and")
//                        + "                          <br/>                        "
//                        + "                         "
//                        + "                                                         Purchase Type: "
//                        + purchType
//                        + "                         <br/>"
//                        + "                                                         Prepared By: "
//                        + preparedBy
//                        + "                          </td>"
//                        + "                         	</tr>"
//                        + "                         	</table> "
//                        + "                         <table style='width:100%;border-collapse: collapse;border:1px solid black;'>"
//                        + "  <tr>  "
//                        + " <td style='padding-top:10px;padding-bottom:20px;'>    Bill To:  <br/>  <div style='word-wrap: break-word; width: 180px;'>                "
//                        + billtoLoc.replace("&", "and") + " </div>  </td>	  "
//                        + "<td style='padding-top:20px;padding-bottom:20px;'>  Ship To:  <br/>  <div style='word-wrap: break-word; width: 180px;'>              	 "
//                        + shiptoLoc.replace("&", "and") + "  </div> <br/>	  </td>"
//                        + "                         	"
//                        + "                         	</tr>"
//                        + "<tr> <td> </td>    </tr>                              </table>"
//                        + "                         	"
//                        + "                         	 <table border='1px' style='border:1px solid black;width:100%;font-size:10px;'>"
//                        + "                       	 <tr style='border-bottom:1px solid black;text-align:center;'>"
//                        + "                         	<th>S no.</th>"
//                        //                        + "                                                         <th>Sub Category</th>"
//                        + "                                                         <th>Item Name</th>"
//                        + "                                                         <th>Description</th>                                        "
//                        + "                                                         <th>Quantity</th>"
//                        + "                                                         <th>Unit</th>"
//                        + "                                                         <th>Discount(%)</th>"
//                        + "                                                         <th>Price</th>"
//                        + "                                                         <th>Delivery Date</th>"
//                        + "                                                         <th>Total Price</th>"
//                        + "                         	 </tr>"
//                        + tbody
//                        + "                         	 </table>"
//                        + "                         	<table style='width:100%;border:1px solid black;'>"
//                        + ""
//                        + "                         	<tr>"
//                        + "     <div style='float:right;padding-right:20px;'>                    	"
//                        + "                         	<td>Total value:  " + new DecimalFormat("#.###").format(grandTotal)
//                        + "                         </td></div>"
//                        + "                         	"
//                        + "                         	</tr>"
//                        + "                             </table>		"
//                        + "                         		                      "
//                        + "                         "
//                        + "                          <table style='width:100%;border:1px solid black;'>"
//                        + "<br/>                          <tr>"
//                        + "                                                         <td>Special terms and Conditions:-  <br/>"
//                        + "                                                             1.Payment Terms: " + payTerms
//                        + "                         <br/>"
//                        + "                                                             2.Delivery Terms:  " + delTerms
//                        + "                         <br/></td>"
//                        + "                                                     </tr>"
//                        + "                         	</table>          "
//                        + ""
//                        + " <table style='width:100%;border:1px solid black;'>"
//                        + "				<tr> "
//                        + "				<td style='float:right;padding-right:300px'>Signature:   </td>                                                     \n"
//                        + "				</tr>   "
//                        + "				</table>               "
//                        + "                          <table style='width:100%;border:1px solid black;'>"
//                        + "                          <tr>"
//                        + "                                                         <td>PO Note: " + ponote + "  </td>"
//                        + "                                                     </tr>"
//                        + "                         	</table>                         "
//                        + "                         "
//                        + "                          "
//                        + "                            "
//                        + "                         </body>"
//                        + "                         </html>";
//
//                //            cm.sendEmail(userEmail, password, toEmail, subject, body);
////                OutputStream output = new FileOutputStream("output-text.pdf");
//                ByteArrayOutputStream baos = new ByteArrayOutputStream();
//                ITextRenderer renderer = new ITextRenderer();
//                renderer.setDocumentFromString(pdfbody);
//                renderer.layout();
//                renderer.createPDF(baos, true);
//                baos.close();
//                System.out.println("" + pdfbody);
//                cm.sendEmail(userEmail, password, sendEmail, subject, mailbody, baos, fileName);
//                poDAO.emailStatusUpdate(poNo, "Resend Email");
//                ---------------------------------------------------------------
            }
        }
        String action = req.getParameter("action");
        if (!action.isEmpty() && action.equalsIgnoreCase("applist")) {
            return new ModelAndView(new RedirectView("approvedPOList.htm"), modelMap);
        }

        return new ModelAndView(new RedirectView("poList.htm"), modelMap);
    }

    @RequestMapping("/purchase/poEditSubmit.htm")
    public ModelAndView poEditSubmit(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException {
        java.util.Date newdate = new java.util.Date();
        long t = newdate.getTime();
        java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(t);
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        DecimalFormat df = new DecimalFormat("#.000");
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String projectCode = req.getParameter("prCode");
        String projectName = req.getParameter("prName");
        String reqNo[] = req.getParameterValues("reqNo");
        String requitionDate[] = req.getParameterValues("reqDate");
        String itemsubCat[] = req.getParameterValues("itemsubCat");
        String itemCat[] = req.getParameterValues("itemCat");
        String itemCode[] = req.getParameterValues("itemCode");
        String itemName[] = req.getParameterValues("itemName");
        String itemDesc[] = req.getParameterValues("itemDesc");
        String unit[] = req.getParameterValues("unit");
        String purchaseType = req.getParameter("purchaseType");
        String department = req.getParameter("dept");
        String division = req.getParameter("division");
        String enqNo = req.getParameter("enqNo");
        String enqDate = req.getParameter("enqDate");
        String quoNo = req.getParameter("quoNo");
        String quoDate = req.getParameter("quoDate");
        String qty[] = req.getParameterValues("qty");
        String prsno[] = req.getParameterValues("prSno");
        String enqSno[] = req.getParameterValues("enqSno");
        String delDate[] = req.getParameterValues("delDate");
        String deliveryLoc = req.getParameter("deliveryLoc");
        String discount[] = req.getParameterValues("discount");
        String price[] = req.getParameterValues("price");
        String total[] = req.getParameterValues("total");
        String gt = req.getParameter("grandTotal");
        String payTerms = req.getParameter("payTerms");
        String delTerms = req.getParameter("delTerms");

        //String status[]=req.getParameterValues("status");
        String supName = req.getParameter("supName");
        String supaddress = req.getParameter("supaddress");
        String supplierCode = req.getParameter("supplierCode");
        String supEmail = req.getParameter("supEmail");

        String potype = req.getParameter("potype");
        String currency = req.getParameter("currency");
        String quotSno[] = req.getParameterValues("quotSno");

        String quotNo = req.getParameter("quotationNo");
        String billToAddress = req.getParameter("billToAddress");
        String poNote = req.getParameter("poNote");
        String poNo = req.getParameter("poNo");
        String poDate = req.getParameter("poDate");
        String quotationDate = req.getParameter("quotDate");
        String warranty[] = req.getParameterValues("warranty");
        String status[] = req.getParameterValues("status");
        String pk[] = req.getParameterValues("pk");
        String remarks = req.getParameter("remarks");
        String lumDis = req.getParameter("lumsumdiscount");

        String action = req.getParameter("action");
        String porevNo = req.getParameter("poRevNo");
        String costCenter = req.getParameter("costCenter");
        costCenter = "unsigned/0000";
        String cost[] = costCenter.split("/");
        String costCenterCode = cost[1];
        String costCenterdesc = cost[0];
        String pkItemDel = req.getParameter("pkItemDel");

        String orderNoFinal = null;
//        String porevNo = null;
        if (action != null && action.equalsIgnoreCase("poAmendment")) {

            ArrayList validuser = (ArrayList) purchDAO.purchOrderAutoGenNo(poNo, "2");

            int num = 1;
            if (!validuser.isEmpty()) {
                for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
                    if (iter.next() != null) {
                        Iterator<String> iter2 = validuser.iterator();
                        iter2.hasNext();
                        orderNoFinal = String.valueOf(iter2.next());
                    }
                }

                if (orderNoFinal != null) {
                    String retval[] = orderNoFinal.split("-");
                    orderNoFinal = retval[3];

                }
                porevNo = orderNoFinal;
            }
            if (porevNo != null) {

                num = Integer.parseInt(porevNo) + 1;
            }
            porevNo = poNo + "-REV-" + num;
        }

        Date quotDate = null;
        Date poDate1 = null;

        if (!"".equals(quotationDate) && quotationDate != null) {
            quotDate = (Date) formatter.parse(quotationDate);
        }
        if (!"".equals(poDate) && poDate != null) {
            poDate1 = (Date) formatter.parse(poDate);
        }

        List<PurchaseOrder> gridData = new ArrayList<PurchaseOrder>();
        Double grandTotal = 0.0, lumsumdiscount = 0.0;
        if (!"".equals(gt) && gt != null) {
            grandTotal = Double.parseDouble(gt);
        }
        if (!"".equals(lumDis) && lumDis != null) {
            lumsumdiscount = Double.parseDouble(lumDis);
        }
        String itmSupp = null;
        for (int i = 0; i < itemName.length; i++) {
            Date deliveryDate1 = null;
            try {
                if (!"".equals(delDate[i]) && delDate[i] != null) {
                    Date delDate1 = ddMMYYFormat.parse(delDate[i]);
                    delDate[i] = formatter.format(delDate1);
                    deliveryDate1 = (Date) formatter.parse(delDate[i]);
                }
            } catch (NullPointerException ex) {
                // Do something/nothing if date2 is null
            }
            Double discount1 = 0.0, price1 = 0.0, totalprice = 0.0;

            if (!"".equals(discount[i]) && discount[i] != null) {
                discount1 = Double.parseDouble(discount[i]);
            }
            if (!"".equals(price[i]) && price[i] != null) {
                price1 = Double.parseDouble(price[i]);
            }
            if (!"".equals(total[i]) && total[i] != null) {
                totalprice = Double.parseDouble(total[i]);
            }
            Integer prsno1 = 0, quotSno1 = 0;
            Date reqDate = null;
            if (!pk[i].isEmpty()) {
                if (!"".equals(prsno[i]) && prsno[i] != null) {
                    prsno1 = Integer.parseInt(prsno[i]);
                }
                if (!"".equals(quotSno[i]) && quotSno[i] != null) {
                    quotSno1 = Integer.parseInt(quotSno[i]);
                }
                if (!"".equals(requitionDate[i]) && requitionDate[i] != null) {
                    reqDate = (Date) formatter.parse(requitionDate[i]);
                }

                int k = Integer.parseInt(status[i].substring(status[i].length() - 1));
                k++;
                status[i] = "update" + k;
            }

            String[] uom = unit[i].split("-");
            String reqUom = null;
            if (!uom[1].isEmpty() && uom[1] != null) {//uom[1]
                reqUom = uom[1];
            }

            List<Object> unit_Price = purchDAO.unitPriceCalc(itemCode[i], reqUom, price1);
            String uom1 = null, uom2 = null, uom3 = null;
            Double uom1Price = 0.0, uom2Price = 0.0, uom3Price = 0.0;

            for (int j = 0; j < unit_Price.size(); j++) {
                try {
                    uom1 = unit_Price.get(0).toString();
                    uom1Price = Double.parseDouble(df.format(unit_Price.get(1)));

                } catch (Exception e) {
                    uom1 = null;
                    uom1Price = 0.0;
                }

                try {
                    uom2 = unit_Price.get(2).toString();
                    uom2Price = Double.parseDouble(df.format(unit_Price.get(3)));

                } catch (Exception e) {
                    uom2 = null;
                    uom2Price = 0.0;
                }

                try {
                    uom3 = unit_Price.get(4).toString();
                    uom3Price = Double.parseDouble(df.format(unit_Price.get(5)));
                } catch (Exception e) {
                    uom3 = null;
                    uom3Price = 0.0;
                }
            }

            if (action != null && action.equalsIgnoreCase("poAmendment")) {
//                PurchaseOrder po = new PurchaseOrder(Integer.parseInt(pk[i]), userId, orgId, division, department, purchaseType, projectCode, projectName, poNo, poDate1, reqNo[i], reqDate, userId,
//                        quotNo, quotDate, potype, currency, billToAddress, deliveryLoc, itemCat[i], itemsubCat[i], itemCode[i], itemName[i], itemDesc[i], reqUom, Double.parseDouble(qty[i]),
//                        price1, discount1, totalprice, grandTotal, deliveryDate1, warranty[0], payTerms, delTerms, poNote, "PO Created", supplierCode, supName, supaddress, supEmail,
//                        prsno1, quotSno1, remarks, status[i], sqlTimestamp, porevNo, lumsumdiscount, costCenterCode, costCenterdesc, uom1, uom1Price, uom2, uom2Price, uom3, uom3Price);
//                gridData.add(po);
//                itmSupp = "purchPriceUpdate";

            } else {

                if ("".equals(pk[i])) {
//                    PurchaseOrder po = new PurchaseOrder(userId, orgId, division, department, purchaseType, projectCode, projectName, poNo, poDate1, null, null, userId,
//                            quotNo, quotDate, potype, currency, billToAddress, deliveryLoc, itemCat[i], itemsubCat[i], itemCode[i], itemName[i], itemDesc[i], reqUom, Double.parseDouble(qty[i]),
//                            price1, discount1, totalprice, grandTotal, deliveryDate1, warranty[0], payTerms, delTerms, poNote, "PO Created", supplierCode, supName, supaddress, supEmail,
//                            prsno1, quotSno1, remarks, "update0", sqlTimestamp, porevNo, lumsumdiscount, costCenterCode, costCenterdesc, uom1, uom1Price, uom2, uom2Price, uom3, uom3Price);
//                    gridData.add(po);

                } else {
//                    PurchaseOrder po = new PurchaseOrder(Integer.parseInt(pk[i]), userId, orgId, division, department, purchaseType, projectCode, projectName, poNo, poDate1, reqNo[i], reqDate, userId,
//                            quotNo, quotDate, potype, currency, billToAddress, deliveryLoc, itemCat[i], itemsubCat[i], itemCode[i], itemName[i], itemDesc[i], reqUom, Double.parseDouble(qty[i]),
//                            price1, discount1, totalprice, grandTotal, deliveryDate1, warranty[0], payTerms, delTerms, poNote, "PO Created", supplierCode, supName, supaddress, supEmail,
//                            prsno1, quotSno1, remarks, status[i], sqlTimestamp, porevNo, lumsumdiscount, costCenterCode, costCenterdesc, uom1, uom1Price, uom2, uom2Price, uom3, uom3Price);
//                    gridData.add(po);

                }

            }

        }
        purchDAO.savePurchaseOrder(gridData, itmSupp, pkItemDel);

        if (action != null && action.equalsIgnoreCase("poAmendment")) {

            return new ModelAndView(new RedirectView("approvedPOList.htm"), modelMap);
        } else {
            modelMap.addAttribute("poList", purchDAO.poList(userId, orgId, null, null));
            modelMap.addAttribute("message", "Data Saved Successfully...");
            return new ModelAndView(new RedirectView("poList.htm"), modelMap);
        }

    }

    @RequestMapping("/purchase/statusUpdate.htm")
    public ModelAndView statusUpdate(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException, MessagingException {
        java.util.Date newdate = new java.util.Date();
        long t = newdate.getTime();
        java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(t);
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String poNo = req.getParameter("poNo");
        String action = req.getParameter("action");
        String remark = req.getParameter("remarks");

        String pk[] = req.getParameterValues("pk");
        String delDate[] = req.getParameterValues("delDate");
        String qty[] = req.getParameterValues("qty");
        String discount[] = req.getParameterValues("discount");
        String price[] = req.getParameterValues("price");
        String total[] = req.getParameterValues("total");
        String gt = req.getParameter("grandTotal");
        String itemCode[] = req.getParameterValues("itemCode");
        String unit[] = req.getParameterValues("unit");
        DecimalFormat df = new DecimalFormat("#.000");

        String itemCat[] = req.getParameterValues("itemCat");

        String page = null;

        String subject = "Purchase order created for approval PO.NO :" + poNo;
        String mailbody = " Please find the Purchase Order No : " + poNo + " and approve.";
        String level = null, submodule = null;

        if (action.equalsIgnoreCase("PM Recheck")) {
            purchDAO.pmStatusUpdateRechkRejct(poNo, remark, userId, formatter4.format(newdate), "PM Recheck");
            page = "POApproveList.htm";
        }
        if (action.equals("PM Rejected")) {
            purchDAO.pmStatusUpdateRechkRejct(poNo, remark, userId, formatter4.format(newdate), "Rejected");
            page = "POApproveList.htm";
        }
        if (action.equals("GM Rejected")) {
            purchDAO.gmStatusUpdateRechkRejct(poNo, remark, userId, formatter4.format(newdate), "Rejected");
            page = "POApprove3List.htm";
        }
        if (action.equals("FM Rejected")) {
            purchDAO.fmStatusUpdateRechkRejct(poNo, remark, userId, formatter4.format(newdate), "Rejected");
            page = "POApprove2List.htm";
        }
        if (action.equals("FM Recheck")) {
            purchDAO.fmStatusUpdateRechkRejct(poNo, remark, userId, formatter4.format(newdate), "PO Created");
            page = "POApprove2List.htm";
        }

        Double grandTotal = 0.0;
        String recordStatus = "", poStatus = "";

        if (!"".equals(gt) && gt != null) {
            grandTotal = Double.parseDouble(gt);

            //Grand Total more than 5000 it should go to General MNG List
//            if (grandTotal > 5000) {
//                recordStatus = "PM Approved";
//            } else {
//                recordStatus = "Approved";
//            }
        }

        if (pk != null) {

            for (int i = 0; i < pk.length; i++) {

                Double discount1 = 0.0, price1 = 0.0, totalprice = 0.0, qty1 = 0.0;
                Date deliveryDate1 = null;

                if (!"".equals(qty[i]) && qty[i] != null) {
                    qty1 = Double.parseDouble(qty[i]);
                }
                if (!"".equals(delDate[i]) && delDate[i] != null) {
                    deliveryDate1 = (Date) formatter.parse(delDate[i]);
                }

                if (!"".equals(discount[i]) && discount[i] != null) {
                    discount1 = Double.parseDouble(discount[i]);
                }
                if (!"".equals(price[i]) && price[i] != null) {
                    price1 = Double.parseDouble(price[i]);
                }
                if (!"".equals(total[i]) && total[i] != null) {
                    totalprice = Double.parseDouble(total[i]);
                }

                List<Object> unit_Price = purchDAO.unitPriceCalc(itemCode[i], unit[i], price1);
                String uom1 = null, uom2 = null, uom3 = null;
                Double uom1Price = 0.0, uom2Price = 0.0, uom3Price = 0.0;

                for (int j = 0; j < unit_Price.size(); j++) {
                    try {
                        uom1 = unit_Price.get(0).toString();
                        uom1Price = Double.parseDouble(df.format(unit_Price.get(1)));

                    } catch (Exception e) {
                        uom1 = null;
                        uom1Price = 0.0;
                    }

                    try {
                        uom2 = unit_Price.get(2).toString();
                        uom2Price = Double.parseDouble(df.format(unit_Price.get(3)));

                    } catch (Exception e) {
                        uom2 = null;
                        uom2Price = 0.0;
                    }

                    try {
                        uom3 = unit_Price.get(4).toString();
                        uom3Price = Double.parseDouble(df.format(unit_Price.get(5)));
                    } catch (Exception e) {
                        uom3 = null;
                        uom3Price = 0.0;
                    }
                }

                if (action.equalsIgnoreCase("PM Recheck")) {
                    purchDAO.pmStatusUpdate(pk[i], poNo, remark, userId, formatter4.format(newdate), "PM Recheck",
                            qty1, discount1, price1, totalprice, Double.parseDouble(gt), formatter4.format(deliveryDate1),
                            uom1, uom1Price, uom2, uom2Price, uom3, uom3Price);
                    page = "POApproveList.htm";
                }

                if (action.equals("PM Approved")) {
                    purchDAO.pmStatusUpdate(pk[i], poNo, remark, userId, formatter4.format(newdate), "PM Approved",
                            qty1, discount1, price1, totalprice, Double.parseDouble(gt), formatter4.format(deliveryDate1),
                            uom1, uom1Price, uom2, uom2Price, uom3, uom3Price);
                    level = "Level-2";
                    submodule = "Purchase Order";
                    page = "POApproveList.htm";
                }

                if (action.equals("PM Rejected")) {
                    purchDAO.pmStatusUpdate(pk[i], poNo, remark, userId, formatter4.format(newdate), "Rejected",
                            qty1, discount1, price1, totalprice, Double.parseDouble(gt), formatter4.format(deliveryDate1),
                            uom1, uom1Price, uom2, uom2Price, uom3, uom3Price);
                    page = "POApproveList.htm";
                }
                if (action.equals("FM Approved")) {

                    purchDAO.fmStatusUpdate(pk[i], poNo, remark, userId, formatter4.format(newdate), "Approved",
                            qty1, discount1, price1, totalprice, Double.parseDouble(gt), formatter4.format(deliveryDate1),
                            uom1, uom1Price, uom2, uom2Price, uom3, uom3Price);
                    level = "Level-3";
                    submodule = "Purchase Order";
                    page = "POApprove2List.htm";
                }

                if (action.equals("FM Rejected")) {
                    purchDAO.fmStatusUpdate(pk[i], poNo, remark, userId, formatter4.format(newdate), "Rejected",
                            qty1, discount1, price1, totalprice, Double.parseDouble(gt), formatter4.format(deliveryDate1),
                            uom1, uom1Price, uom2, uom2Price, uom3, uom3Price);
                    page = "POApprove2List.htm";
                }

                if (action.equals("GM Approved")) {
                    purchDAO.gmStatusUpdate(pk[i], poNo, remark, userId, formatter4.format(newdate), "Approved",
                            qty1, discount1, price1, totalprice, Double.parseDouble(gt), formatter4.format(deliveryDate1),
                            uom1, uom1Price, uom2, uom2Price, uom3, uom3Price);
                    level = "Level-4";
                    submodule = "Purchase Order";
                    page = "POApprove3List.htm";
                }

                if (action.equals("GM Rejected")) {
                    purchDAO.gmStatusUpdate(pk[i], poNo, remark, userId, formatter4.format(newdate), "Rejected",
                            qty1, discount1, price1, totalprice, Double.parseDouble(gt), formatter4.format(deliveryDate1),
                            uom1, uom1Price, uom2, uom2Price, uom3, uom3Price);
                    page = "POApprove3List.htm";
                }
            }
            if (level != null && !level.isEmpty()) {
                purchDAO.approverEmail(userId, orgId, subject, mailbody, level, submodule);
            }

        }

        return new ModelAndView(new RedirectView(page), modelMap);
    }

    @RequestMapping("/purchase/directPOFormSubmit.htm")
    public ModelAndView directPOFormSubmit(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException, MessagingException {
        java.util.Date newdate = new java.util.Date();
        long t = newdate.getTime();
        java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(t);
        int year = Calendar.getInstance().get(Calendar.YEAR);
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        DecimalFormat df = new DecimalFormat("#.000");

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        
        String purchaseType = req.getParameter("purchaseType");
        
        String supplierName = req.getParameter("supplierName");
        String supplierAddress = req.getParameter("supplierAddress");
        String supplierEmail = req.getParameter("supplierEmail");
        String supplierContactNumber = req.getParameter("supplierContactNumber");
        String supplierCode = req.getParameter("supplierCode");
        
        
        String contactPersonName = req.getParameter("contactPersonName");
        String contactAddress = req.getParameter("contactAddress");
        String contactNumber = req.getParameter("contactNumber");
        String contactEmail = req.getParameter("contactEmail");
        String contactCode = req.getParameter("contactCode");
        
        String deliveryName = req.getParameter("deliveryName");
        String deliveryAddress = req.getParameter("deliveryAddress");
        String deliveryContact = req.getParameter("deliveryContact");
        String deliveryEmail = req.getParameter("deliveryEmail");
        String deliveryCode = req.getParameter("deliveryCode");
        
        String payTerms = req.getParameter("payTerms");
        String delTerms = req.getParameter("delTerms");
        String warrentyTerms = req.getParameter("warrentyTerms");
        
        String poDate = req.getParameter("poDate");
       Date poDate1 = (Date) formatter.parse(poDate);
        String SNo = req.getParameter("pk");
       String poNo = req.getParameter("poNo");
       
       String[] sno = req.getParameterValues("sno");
       String productCategory[] = req.getParameterValues("productCategory");
       String[] itemdetails = req.getParameterValues("itemdetails");
       String[] uomType = req.getParameterValues("uomType");
       String[] itemrate = req.getParameterValues("itemrate");//double
       String[] vatAmount = req.getParameterValues("vatAmount");
       String[] Discount = req.getParameterValues("itemDiscount");//double
       String[] itemqty = req.getParameterValues("itemqty");
       String[] itemvattotal = req.getParameterValues("itemvattotal");
       String[] itemdisctotal = req.getParameterValues("itemdisctotal");
       String[] itemtotal = req.getParameterValues("itemtotal");
       String subTotal = req.getParameter("subTotal");
       String taxpercent = req.getParameter("taxpercent");
       String total = req.getParameter("total");
       
 
        
        
//        String projectCode = req.getParameter("prCode");
//        String projectName = req.getParameter("prName");
//        String itemsubCat[] = req.getParameterValues("itemsubCat");
//        String itemCat[] = req.getParameterValues("itemCat");
//        String itemCode[] = req.getParameterValues("itemCode");
//        String itemName[] = req.getParameterValues("itemName");
//        String itemDesc[] = req.getParameterValues("itemDesc");
//        String unit[] = req.getParameterValues("unit");
//        
//        purchaseType = "General";
//        String department = req.getParameter("dept");
//        String division = req.getParameter("division");
//        String qty[] = req.getParameterValues("qty");
//        String delDate[] = req.getParameterValues("requiredByDate");
//        String deliveryLoc = req.getParameter("deliveryLoc").trim();
//        String discount[] = req.getParameterValues("discount");
//        String price[] = req.getParameterValues("price");
//        String total[] = req.getParameterValues("total");
//        String gt = req.getParameter("grandTotal");
//        
//        //String status[]=req.getParameterValues("status");
//        String supName = req.getParameter("supName");
//        String supaddress = req.getParameter("supaddress").trim();
//      //  String supplierCode = req.getParameter("supplierCode");
//        String supEmail = req.getParameter("supEmail");
//
//        String potype = req.getParameter("potype");
//        String currency = req.getParameter("currency");
//        String billToAddress = req.getParameter("billToAddress").trim();
////        String poNote = req.getParameter("poNote");
//        String poNo = req.getParameter("poNo");
//     //   
//        String assetCode = req.getParameter("assetCode");
//        String subAssetCode = req.getParameter("subAssetCode");
//
////        String warranty[] = req.getParameterValues("warranty");
//        String status[] = req.getParameterValues("status");
//        String pk[] = req.getParameterValues("pk");
//        String remarks = req.getParameter("remarks");
//        String lumDis = req.getParameter("lumsumdiscount");
//        lumDis = "0";
//        String costCenter = req.getParameter("costCenter");
//        costCenter = "unsigned/0000";
//        String cost[] = costCenter.split("/");
//        String costCenterCode = cost[1];
//        String costCenterdesc = cost[0];
//
//        
//        String poNote = null;
//        String warranty = null;
        ArrayList validuser = (ArrayList) purchDAO.poCodeinc(userId, orgId, null, null, "1");
        String orderNoFinal = null;
      //  String poNo = null;
        String joNo = null;
        String pono1[] = null;
        int num = 1;
        if (!validuser.isEmpty()) {
//            for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
//                if (iter.next() != null) {
//                    Iterator<String> iter2 = validuser.iterator();
//                    iter2.hasNext();
//                    orderNoFinal = String.valueOf(iter2.next());
//                }             
//            }
              for (Iterator<PurchaseOrder> iter = validuser.iterator(); iter.hasNext();) {
                    orderNoFinal = iter.next().getPurchaseOrderNo();
              }
          //  poNo = orderNoFinal;
        }
        if (orderNoFinal != null) {
            pono1 = orderNoFinal.split("-");
            num = Integer.parseInt(pono1[1]) + 1;
        }
        poNo = "PO" + year + "-" + num;
        
        List<PurchaseOrder> gridData = new ArrayList<PurchaseOrder>();
        List<PurchaseItemDescription> gridData1 = new ArrayList<PurchaseItemDescription>();
    
        try {
            if (SNo == null || SNo.equals("")){
        PurchaseOrder po = new PurchaseOrder(userId, orgId, poNo, purchaseType, supplierName, supplierAddress, supplierEmail,
                supplierContactNumber, "", contactPersonName, contactAddress, contactNumber, contactEmail, "", deliveryName,
                deliveryAddress, deliveryContact, deliveryEmail, "", payTerms, delTerms, warrentyTerms, poDate1, "Purchase Order Created", 
                "Active", sqlTimestamp); //supplierCode, contactCode, deliveryCode
        gridData.add(po);
        
         purchDAO.savePurchaseOrder(gridData, null, null);
         
         
         try {
              if(productCategory != null) {
                for (int i = 0; i < productCategory.length; i++) {

         
         PurchaseItemDescription id = new PurchaseItemDescription(userId, orgId, poNo, itemdetails[i], productCategory[i], Double.parseDouble(itemrate[i]),
                 Double.parseDouble(vatAmount[i]), Double.parseDouble(itemqty[i]), 
                 Double.parseDouble(itemtotal[i]), Double.parseDouble(subTotal), Double.parseDouble(taxpercent), Double.parseDouble(total), "update0",
                 "Purchase Order Created", sqlTimestamp, Double.parseDouble(itemvattotal[i]), uomType[i], Double.parseDouble(Discount[i]),
                 Double.parseDouble(itemdisctotal[i]));
         gridData1.add(id);
         
         purchDAO.appPurchaseItemdesSave(gridData1);
                }
              }
                } catch(Exception ex) {
                      ex.printStackTrace();
                  }
              
                 }else{
                            
              }               
                           
        
        
       } catch (Exception e) {
        }
         
         
         
         
         
         
//        division = "JO" + year + "-" + num;
//
//        
//        Double grandTotal = 0.0, lumsumdiscount = 0.0;
//        if (!"".equals(gt) && gt != null) {
//            grandTotal = Double.parseDouble(gt);
//        }
//        if (!"".equals(lumDis) && lumDis != null) {
//            lumsumdiscount = Double.parseDouble(lumDis);
//        }

        //List<SupplierMaster> supList = purchDAO.supplierCodeWiseList(orgId, supplierCode);

//        for (SupplierMaster supdetail : supList) {
//            payTerms = supdetail.getPaymentTerms();
//            delTerms = supdetail.getDeliveryTerms();
//        }

//        for (int i = 0; i < itemName.length; i++) {
//            Date deliveryDate1 = null;
//            try {
//                if (!"".equals(delDate[i]) && delDate[i] != null) {
//                    Date delDate1 = ddMMYYFormat.parse(delDate[i]);
//                    delDate[i] = formatter.format(delDate1);
//                    deliveryDate1 = (Date) formatter.parse(delDate[i]);
//                }
//            } catch (NullPointerException ex) {
//                // Do something/nothing if date2 is null
//            }
//            Double discount1 = 0.0, price1 = 0.0, totalprice = 0.0;
//
//            if (!"".equals(discount[i]) && discount[i] != null) {
//                discount1 = Double.parseDouble(discount[i]);
//            }
//            if (!"".equals(price[i]) && price[i] != null) {
//                price1 = Double.parseDouble(price[i]);
//            }
//            if (!"".equals(total[i]) && total[i] != null) {
//                totalprice = Double.parseDouble(total[i]);
//            }
//            String[] uom = unit[i].split("-");
//            String reqUom = null;
//            if (!uom[1].isEmpty() && uom[1] != null) {
//                reqUom = uom[1];
//            }
//
//            List<Object> unit_Price = purchDAO.unitPriceCalc(itemCode[i], reqUom, price1);
//            String uom1 = null, uom2 = null, uom3 = null;
//            Double uom1Price = 0.0, uom2Price = 0.0, uom3Price = 0.0;
//
//            for (int j = 0; j < unit_Price.size(); j++) {
//                try {
//                    uom1 = unit_Price.get(0).toString();
//                    uom1Price = Double.parseDouble(df.format(unit_Price.get(1)));
//
//                } catch (Exception e) {
//                    uom1 = null;
//                    uom1Price = 0.0;
//                }
//
//                try {
//                    uom2 = unit_Price.get(2).toString();
//                    uom2Price = Double.parseDouble(df.format(unit_Price.get(3)));
//
//                } catch (Exception e) {
//                    uom2 = null;
//                    uom2Price = 0.0;
//                }
//
//                try {
//                    uom3 = unit_Price.get(4).toString();
//                    uom3Price = Double.parseDouble(df.format(unit_Price.get(5)));
//                } catch (Exception e) {
//                    uom3 = null;
//                    uom3Price = 0.0;
//                }
//            }

//            PurchaseOrder po = new PurchaseOrder(userId, orgId, division, assetCode, subAssetCode, department, purchaseType, projectCode, projectName, poNo, poDate1, userId,
//                    potype, currency, billToAddress, deliveryLoc, itemCat[i], itemsubCat[i], itemCode[i], itemName[i], itemDesc[i], reqUom, Double.parseDouble(qty[i]),
//                    price1, discount1, totalprice, grandTotal, deliveryDate1, warranty, payTerms, delTerms, remarks, "PO Created", supplierCode, supName, supaddress, supEmail,
//                    remarks, "update0", sqlTimestamp, lumsumdiscount, costCenterCode, costCenterdesc, uom1, uom1Price, uom2, uom2Price, uom3, uom3Price);
//            gridData.add(po);
      //  }
       

        String subject = "Purchase order created for approval PO.NO :" + poNo;
        String mailbody = " Please find the Purchase Order No : " + poNo + " and approve.";
        purchDAO.approverEmail(userId, orgId, subject, mailbody, "Level-1", "Purchase Order");

        modelMap.addAttribute("poList", purchDAO.poList(userId, orgId, null, null));
        modelMap.addAttribute("message", "Data Saved Successfully...");
//        return new ModelAndView("poList", modelMap);
        return new ModelAndView(new RedirectView("poList.htm"), modelMap);
    }

    @RequestMapping("/purchase/pendingPOList.htm")
    public ModelAndView pendingPOList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String fromDate = req.getParameter("fromDate");
        String toDate = req.getParameter("toDate");
        if (fromDate != null && toDate != null) {
            if (fromDate.contains("frdate") && toDate.contains("todate")) {
                fromDate = null;
                toDate = null;
            }
        }
        if (fromDate == null || fromDate == "" || toDate == null || toDate == "") {
            modelMap.addAttribute("pendingpoList", purchDAO.pendingPoList(userId, orgId, null, "Approved"));
        } else {
            modelMap.addAttribute("pendingpoList", purchDAO.poList41(userId, orgId, null, "Approved", fromDate, toDate));
            //modelMap.addAttribute("poList", purchDAO.poList41(userId, orgId, null, null, fromDate, toDate));
        }

        return new ModelAndView("../purchOrder/pendingPOList", modelMap);
    }

    @RequestMapping("/purchase/approvedPOForm.htm")
    public ModelAndView approvedPOForm(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String poNo = req.getParameter("poNo");
        String action = req.getParameter("action");

        List<PurchaseOrder> gridData = new ArrayList<PurchaseOrder>();
        List<PurchaseOrder> groupPOlsit = new ArrayList<PurchaseOrder>();
//        Set<String> purset = new HashSet<String>();

        String recordstatus = "";
        if (action.equalsIgnoreCase("Cancel")) {
            recordstatus = "Initial";
        } else {
            recordstatus = "Approved";
        }
        gridData.addAll(purchDAO.poNoList(userId, orgId, poNo, recordstatus));
        groupPOlsit.addAll(purchDAO.groupPOList(userId, orgId, poNo));
//        for (PurchaseOrder purset1 : gridData) {
//            purset.add(purset1.getPrNo());
//        }
//        modelMap.addAttribute("reqNoList", purset);
        modelMap.addAttribute("reqNoList", groupPOlsit);
        modelMap.addAttribute("poList", gridData);
        modelMap.addAttribute("supplierList", purchDAO.supplierReqList(null, "Approved"));
        modelMap.addAttribute("currencyList", purchDAO.currencyList(null));
        modelMap.addAttribute("action", action);

        return new ModelAndView("../purchOrder/approvedPOForm", modelMap);
    }

    @RequestMapping("/purchase/poAmendment.htm")
    public ModelAndView poAmendment(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String poNo = req.getParameter("poNo");
        List<PurchaseOrder> gridData = new ArrayList<PurchaseOrder>();
        List<PurchaseOrder> groupPOlsit = new ArrayList<PurchaseOrder>();
//        Set<String> purset = new HashSet<String>();

        groupPOlsit.addAll(purchDAO.groupPOList(userId, orgId, poNo));
        modelMap.addAttribute("reqNoList", groupPOlsit);

        ArrayList validuser = (ArrayList) purchDAO.purchOrderAutoGenNo(poNo, "2");
        String orderNoFinal = null;
        String porevNo = null;
        int num = 1;
        if (!validuser.isEmpty()) {
            for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
                if (iter.next() != null) {
                    Iterator<String> iter2 = validuser.iterator();
                    iter2.hasNext();
                    orderNoFinal = String.valueOf(iter2.next());
                }
            }

            if (orderNoFinal != null) {
                String retval[] = orderNoFinal.split("-");
                orderNoFinal = retval[3];

            }
            porevNo = orderNoFinal;

        }
        if (porevNo != null) {

            num = Integer.parseInt(porevNo) + 1;
        }
        porevNo = poNo + "-REV-" + num;
        modelMap.addAttribute("porevNo", porevNo);

        gridData.addAll(purchDAO.poNoList(userId, orgId, poNo, "Initial"));
//        for (PurchaseOrder purset1 : gridData) {
//            purset.add(purset1.getPrNo());
//        }
//        modelMap.addAttribute("reqNoList", purset);
        modelMap.addAttribute("poList", gridData);
        modelMap.addAttribute("supplierList", purchDAO.supplierReqList(null, "Approved"));
        modelMap.addAttribute("currencyList", purchDAO.currencyList(null));
        modelMap.addAttribute("costCenterList", purchDAO.costCenterList(null));
        modelMap.addAttribute("paytermslist", purchDAO.TermsList(null, "Payment"));
        modelMap.addAttribute("delivtermslist", purchDAO.TermsList(null, "Delivery"));

        return new ModelAndView("../purchOrder/poAmendment", modelMap);
    }

    @RequestMapping("/purchase/itemWiseSup.htm")
    public void itemWiseSup(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String requisitionNo = req.getParameter("reqNo");
        String itemCode = req.getParameter("itemCode");
        purchDAO.itemWiseSup(req, res, itemCode);
    }

    @RequestMapping("/purchase/cancelPO.htm")
    public ModelAndView cancelPO(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String[] sno = req.getParameterValues("cancelPk");
        String poNo = req.getParameter("poNo");

        for (int i = 0; i < sno.length; i++) {
            purchDAO.cancelPO(sno[i]);

        }
        List<PurchaseOrder> polist = purchDAO.poNoList(userId, orgId, poNo, null);
        Integer posize = polist.size();
        int i = 0;
        for (PurchaseOrder polist1 : polist) {
            if (polist1.getApprovalStatus().toString().equalsIgnoreCase("Cancelled")) {
                i++;
            }
        }
        if (posize == i) {
            purchDAO.cancelCompletePO(poNo);
        }
        modelMap.addAttribute("message", "PO Cancelled Successfully...");
        return new ModelAndView(new RedirectView("approvedPOList.htm"), modelMap);
    }

    @RequestMapping("/purchase/pendingPOForm.htm")
    public ModelAndView pendingPOForm(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String poNo = req.getParameter("poNo");
        modelMap.addAttribute("poList", purchDAO.poNoList(userId, orgId, poNo, "pendingPO"));
        return new ModelAndView("../purchOrder/pendingPOForm", modelMap);
    }

    @RequestMapping("/purchase/sendPendingPOEmail.htm")
    public ModelAndView sendPendingPOEmail(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, MessagingException, DocumentException, ParseException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String poNo = req.getParameter("poNo");

        Common cm = new Common();
        String subject = "", tbody = "", mailbody = "", suppName = "";
        String userEmail = "excelajh123@gmail.com";
        String password = "excel123";
        String toEmail[] = new String[10];

        DecimalFormat df = new DecimalFormat("#.000");

        String from = "";
        String pass = "";
        String hostName = null, cc = null;
        String ccMail[] = null;
        String sendToMail[];
        String moudleName = "Purchase Order";

        List<HostEmailConfig> hostEmailCofig = purchDAO.hostEmailCofig(userId, orgId, moudleName);
        for (HostEmailConfig hostEmailCofig1 : hostEmailCofig) {
            if (hostEmailCofig1.getEmailFrom() != null) {
                from = hostEmailCofig1.getEmailFrom();
            }
            if (hostEmailCofig1.getPasswordFrom() != null) {
                pass = hostEmailCofig1.getPasswordFrom();
            }
            if (hostEmailCofig1.getHostName() != null) {
                hostName = hostEmailCofig1.getHostName();
            }
            if (hostEmailCofig1.getEmailCc() != null) {
                cc = hostEmailCofig1.getEmailCc();
            }

        }
        if (cc != null) {
            ccMail = cc.split(",");
        }

//        if (!userEmail.isEmpty() && !password.isEmpty()) {
        if (!from.isEmpty() && !pass.isEmpty()) {
            List<PurchaseOrder> po = purchDAO.poNoList(userId, orgId, poNo, "pendingPO");
            if (po.size() > 0) {
                int i = 1;
                String desc = "";
                for (PurchaseOrder polist : po) {
                    Double recQty = 0.0;
                    Double ordQty = 0.0;
                    Double pendQty = 0.0;
                    String deldate;

                    String purcUom;
                    if (polist.getDescription() != null) {
                        desc = polist.getDescription();
                    }
                    ordQty = polist.getQty();
                    deldate = formatter.format(polist.getRequiredDate());
                    purcUom = polist.getUom();
                    recQty = purchDAO.chkReceivedQty(polist.getItemCode(), orgId, poNo, purcUom, deldate);

                    pendQty = ordQty - recQty;

                    tbody = tbody + "<tr style='font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#aabcfe;color:#669;background-color:#D2E4FC;vertical-align:top'>"
                            + "<td>" + i + "</td>"
                            //                            + "<td>" + polist.getItemSubCategory() + "</td>"
                            + "<td>" + polist.getItemName() + "</td>"
                            + "<td>" + desc + "</td>"
                            + "<td style='text-align: right;'>" + ordQty + "</td>"
                            + "<td>" + polist.getUom() + "</td>"
                            + "<td style='text-align: right;'>" + df.format(recQty) + "</td>"
                            + "<td style='text-align: right;'>" + df.format(pendQty) + "</td>"
                            //                            + "<td>" + polist.getDiscount() + "</td>"
                            //                            + "<td>" + polist.getUnitPrice() + "</td>"
                            + "<td>" + formatter.format(polist.getRequiredDate()) + "</td>"
                            //                            + "<td>" + polist.getTotalValue() + "</td>"
                            + "</tr>";
                    suppName = polist.getSupplierName();
                    toEmail[0] = polist.getSupplierEmail();

                    i++;

                }
                subject = "Purchase Order NO: " + poNo + " -" + suppName;
                mailbody = "<html>"
                        + "<body>Dear Sir/Madam,<br/><br/><br/>Please find below items and kindly arrange the shipment."
                        + "<br/><br/>"
                        + "<table border='1px' cellpadding='3' style='border-width:1px;border-collapse:collapse;border-spacing:0;border-color:#aabcfe'>"
                        + "<tr style='font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#aabcfe;color:#039;background-color:#b9c9fe;text-align:center;vertical-align:top'>"
                        + "<th>Sl.No</th><th>Item Name</th><th>Item Description</th><th>Ordered Quantity</th><th>Unit</th><th>Received Quantity</th><th>Pending Quantity</th><th>Required Date</th></tr>"
                        + tbody
                        + "</table>"
                        + "<br/><br/>If you have any doubts please let us know.</body></html>";
//                cm.sendEmail(userEmail, password, toEmail, subject, mailbody, null, null);
                cm.sendEmail1(from, pass, toEmail, subject, mailbody, null, null, ccMail, hostName);
                modelMap.addAttribute("success", "true");
//                poDAO.emailStatusUpdate(poNo, "Resend Email");

            }
        }
        return new ModelAndView(new RedirectView("pendingPOList.htm"), modelMap);
    }
    
     @RequestMapping("/purchase/supplierDetailsList.htm")
    public ModelAndView supplierDetailsList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String vendorCode = req.getParameter("vendorCode");
        String suppEmid = req.getParameter("suppEmid");
        
        modelMap.addAttribute("vendorReqList",purchDAO.vendorReqList(null, null));
        
        return new ModelAndView("../supplier/supplierDetailsList", modelMap);

    }
    
    @RequestMapping("/purchase/supplierDetailsForm.htm")
    public ModelAndView supplierDetailsForm(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String enqNo = req.getParameter("enqNo");
        String suppEmid = req.getParameter("suppEmid");
        String sno = req.getParameter("sno");
        
        String designation = req.getParameter("designation");
        
        if(sno != null) {
             modelMap.addAttribute("vendorReqList",purchDAO.vendorReqList(sno, null));
             modelMap.addAttribute("incomeAmountList", purchDAO.vendorDetailsList(userId, sno));
             modelMap.addAttribute("incomeTrackingId", purchDAO.vendordetailsId(userId, designation));
        }
        
       
         return new ModelAndView("../supplier/supplierDetailsForm", modelMap);

    }
    
    @RequestMapping("/purchase/supplierDetailsView.htm")
    public ModelAndView supplierDetailsView(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String enqNo = req.getParameter("enqNo");
        String suppEmid = req.getParameter("suppEmid");
        String sno = req.getParameter("sno");
        if(sno != null) {
             modelMap.addAttribute("vendorReqList",purchDAO.vendorReqList(sno, null));
        }
        
       
         return new ModelAndView("../supplier/supplierDetailsView", modelMap);

    }
    
    @RequestMapping("/purchase/supplierDetailsFormSubmit.htm")
    public ModelAndView supplierDetailsFormSubmit(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String sno = req.getParameter("sNo");
        String supplierCode = req.getParameter("supplierCode");
        String businessType = req.getParameter("businessType");
         String businessName = req.getParameter("businessName");
         String address = req.getParameter("address");
         String physicalAddress = req.getParameter("physicalAddress");
         String postalCode = req.getParameter("postalCode");
         String regNo = req.getParameter("regNo");
         String vatNo = req.getParameter("vatNo");
         String taxNo = req.getParameter("taxNo");
         String altmobile = req.getParameter("altmobile");
         
         String supplierName1[] = req.getParameterValues("supplierName1");
         String designation1[] = req.getParameterValues("designation1");
         String mobile1[] = req.getParameterValues("mobile1");
         String email1[] = req.getParameterValues("email1");
         String pk[] = req.getParameterValues("pk1");
         
         String status = req.getParameter("status");
         
       
         
         List<VendorDetails> gridData1 = new ArrayList<VendorDetails>();
         
         try {
            if (sno == null || sno.equals("")){
             VendorDetails vd = new VendorDetails(orgId, userId, supplierCode, businessType, businessName, postalCode, address, physicalAddress, regNo, vatNo, taxNo, "", "", "", "", "", "", newdate);
             
             //gridData1.add(it); 
             
             purchDAO.newvendorDetailsListSave(vd);
             
             try {
                      if(supplierName1 != null) {
                          for (int i = 0; i < supplierName1.length; i++) {
                              
                              VendorDetailsGrid vdg = new VendorDetailsGrid(orgId, userId, supplierCode, supplierName1[i], designation1[i], mobile1[i], "", email1[i], newdate, status);
                              
                              purchDAO.newvendordetailsGridListSave(vdg);
                          }
                      }
                  } catch(Exception ex) {
                      ex.printStackTrace();
                  }
             
         }
            else{
             
             VendorDetails vd = new VendorDetails(Integer.parseInt(sno) ,orgId, userId, supplierCode, businessType, businessName, postalCode, address, physicalAddress, regNo, vatNo, taxNo, "", "", "", "", "", "", newdate);
             
             purchDAO.newvendorDetailsListSave(vd);
             
             try {
                      if(supplierName1 != null) {
                          for (int i = 0; i < supplierName1.length; i++) {
                              
                              VendorDetailsGrid vdg = new VendorDetailsGrid(Integer.parseInt(sno) ,orgId, userId, supplierCode, supplierName1[i], designation1[i], mobile1[i], "", email1[i], newdate, status);
                              
                              purchDAO.newvendordetailsGridListSave(vdg);
                          }
                      }
                  } catch(Exception ex) {
                      ex.printStackTrace();
                  }
         }
        } catch (Exception e) {
        }

      
       
        return new ModelAndView(new RedirectView("supplierDetailsList.htm"), modelMap);

    }
    
    @RequestMapping("/purchase/selectPropertyListInLedger.htm")
    public ModelAndView selectRentQuoteProprtyDetails(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        
        modelMap.addAttribute("assetDetails", purchDAO.vendorReqList(null, null));
        return new ModelAndView("../purchOrder/SelectVendorDetails", modelMap);
    }
    @RequestMapping("/purchase/selectVendorDetails.htm")
    public ModelAndView selectRentQuoteProprtyDetails1(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        
        modelMap.addAttribute("assetDetails", purchDAO.vendorReqList(null, null));
        return new ModelAndView("../purchOrder/SelectCustomerDetails", modelMap);
    }
    
    @RequestMapping("/purchase/SelectDeliveryLocation.htm")
    public ModelAndView billlocList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("billloclist", purchDAO.billlocList(null));
        return new ModelAndView("../purchOrder/SelectDeliveryLocation", modelMap);
    }
}
