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
import java.math.BigInteger;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import tenant.classes.GoodsReceiptNote;
import tenant.classes.Quality;
import tenant.classes.Grn;
import tenant.classes.InventoryCount;
import tenant.classes.Inventorylist;
import tenant.classes.ItemMaster;
import tenant.classes.ItemsStore;
import tenant.classes.MaterialReturn;
import tenant.classes.PurchaseOrder;
import tenant.classes.PurchaseRequest;
import tenant.classes.QualityInspection;
import tenant.classes.ReceivingProcess;
import tenant.classes.StockEntry;
import tenant.classes.StockLedger;
import tenant.classes.UserRegistration;
import tenant.dao.MasterDAO;
import tenant.dao.PurchaseDetailsDAO;
import tenant.dao.QualityDAO;
import tenant.dao.TenantDetailsDAO;
import tenant.dao.UserDAO;

/**
 *
 * @author EBS-SDD15
 */
public class QualityController {

//     date = new Date(mod_date);
    DateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
    DateFormat formatter2 = new SimpleDateFormat("dd-MM-yyyy");
    DateFormat formatter7 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    DateFormat formatter6 = new SimpleDateFormat("yyyy-MM-dd");
    DateFormat formatter1 = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss a");
    DateFormat formatter5 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    DateFormat formatter3 = new SimpleDateFormat("yyyy-MM-dd");
    DateFormat formatter4 = new SimpleDateFormat("dd/MM/yyyy");
    java.util.Date newdate = new java.util.Date();
    long t = newdate.getTime();
    java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(t);
    @Autowired
    private MasterDAO masterDAO;
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private QualityDAO qualityDAO;
    @Autowired
    private PurchaseDetailsDAO purchDAO;
    @Autowired
    private TenantDetailsDAO tenantDetailsDAO;
//---------------------Quality Start---------------------------------------------//
//**************Purchase Order List******************//

    @RequestMapping("/quality/purchaseList.htm")
    public ModelAndView purchaseList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");

        modelMap.addAttribute("poList", qualityDAO.poList(SNo));
        return new ModelAndView("../assets/purchaseList", modelMap);
    }
//**************Quality List******************//

    @RequestMapping("/quality/qualityList.htm")
    public ModelAndView qualityList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");

        modelMap.addAttribute("qaList", qualityDAO.qaList(SNo));
        modelMap.addAttribute("supp", purchDAO.list("", "SupplierMaster"));
        return new ModelAndView("../assets/qualityList", modelMap);
    }
//**************Quality Form******************//

    @RequestMapping("/quality/qualityForm.htm")
    public ModelAndView qualityForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        String poNo = request.getParameter("poNo");
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();

        String link = "../assets/qualityForm.htm";
        String tab = "Quality";
        modelMap.addAttribute("poFormList", qualityDAO.poFormList(SNo));
        modelMap.addAttribute("poFormList1", qualityDAO.poFormList1(poNo));
        modelMap.addAttribute("supp", purchDAO.list("", "SupplierMaster"));
        modelMap.addAttribute("item", purchDAO.list("", "ItemMaster"));
        modelMap.addAttribute("itemCat", purchDAO.list("", "ItemCategory"));
        modelMap.addAttribute("uom", purchDAO.list("", "UomMaster"));
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../assets/qualityForm", modelMap);
    }

    //**************Quality Form View******************//
    @RequestMapping("/quality/qualityView.htm")
    public ModelAndView qualityView(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        String qa = request.getParameter("qa");
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();

        String link = "../assets/qualityForm.htm";
        String tab = "Quality";
        // modelMap.addAttribute("poFormList", qualityDAO.poFormList(SNo));
        modelMap.addAttribute("qualityList", qualityDAO.qualityList(qa));
        modelMap.addAttribute("supp", purchDAO.list("", "SupplierMaster"));
        modelMap.addAttribute("item", purchDAO.list("", "ItemMaster"));
        modelMap.addAttribute("itemCat", purchDAO.list("", "ItemCategory"));
        modelMap.addAttribute("uom", purchDAO.list("", "UomMaster"));
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../assets/qualityView", modelMap);
    }

    //**************Quality Form Submit******************//
    @RequestMapping("/quality/qualityFormSubmit.htm")
    public ModelAndView qualityFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");
        String qa = request.getParameter("qa");
        String poNo = request.getParameter("poNo");
        String qaBy = request.getParameter("qaBy");
        String customerInvoiceNo = request.getParameter("customerInvoiceNo");
        String customerInvoiceDate = request.getParameter("customerInvoiceDate");
        String supplierName = request.getParameter("supplierName");
        String supplierAddress = request.getParameter("supplierAddress");
        String supplierCntNo = request.getParameter("supplierCntNo");
        String supplierMailId = request.getParameter("supplierMailId");
        String inventoryLocation = request.getParameter("inventoryLocation");
        String receivedQty[] = request.getParameterValues("receivedQty");
        String orderedQty[] = request.getParameterValues("orderedQty");
        String foc[] = request.getParameterValues("foc");
        String uom[] = request.getParameterValues("uom");
        String qtyAccepted[] = request.getParameterValues("qtyAccepted");
        String qtyRejected[] = request.getParameterValues("qtyRejected");
        String batchNo = request.getParameter("batchNo");
        String expiryDate[] = request.getParameterValues("expiryDate");
        String warrantyPeriod[] = request.getParameterValues("warrantyPeriod");
        String remarks = request.getParameter("remarks");
        String qaDate = request.getParameter("qaDate");
        String itemCode[] = request.getParameterValues("itemCode");
        String itemName[] = request.getParameterValues("itemName");
        String status = request.getParameter("status");
        String qualityStatus = request.getParameter("qualityStatus");
        String unitPrice[] = request.getParameterValues("unitPrice");
        String totalPrice[] = request.getParameterValues("totalPrice");

        if (qualityStatus.equals("")) {
            qualityStatus = "Approved";
        }
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());

        if (qa == null || qa == "" || "".equals(qa)) {
            ArrayList validuser = (ArrayList) qualityDAO.getQANo(poNo);
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
            qa = "Quality" + "-" + ordno;
        }
        Date customerInvoiceDate1 = null;
        if (!customerInvoiceDate.equals("")) {
            customerInvoiceDate1 = (Date) formatter.parse(customerInvoiceDate);
        }

        Date qaDate1 = null;
        if (!qaDate.equals("")) {
            qaDate1 = (Date) formatter.parse(qaDate);
        }
        if (pk == null) {
            for (int i = 0; i < itemName.length; i++) {
                Date expiryDate1 = null;
                if (!expiryDate[i].equals("") || !"".equals(expiryDate[i])) {
                    expiryDate1 = (Date) formatter.parse(expiryDate[i]);
                }
                Quality quality = new Quality(orgId, userId, qa, poNo, qaBy, customerInvoiceNo, customerInvoiceDate1, supplierName, supplierAddress, supplierCntNo, supplierMailId, inventoryLocation, receivedQty[i], foc[i], uom[i], qtyAccepted[i], qtyRejected[i], batchNo, expiryDate1, warrantyPeriod[i], remarks, qaDate1, itemCode[i], itemName[i], qualityStatus, "update0", qaDate1, unitPrice[i], totalPrice[i], "Not Returned", orderedQty[i]);
                qualityDAO.globalSave(quality);
                qualityDAO.PurchaseStatus(poNo, qualityStatus);

            }
        }
        String jsp = null;
        if (qualityStatus.equals("Approved")) {
            jsp = "approvedItems.htm";
        } else if (!qualityStatus.equals("Approved")) {
            jsp = "rejectedList.htm";

        }

        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("category", masterDAO.list(pk, "Category"));
        //return new ModelAndView(new RedirectView("../assets/qualityList.htm"), modelMap);
        return new ModelAndView(new RedirectView(jsp), modelMap);
    }

    //**************Quality Rejected List******************//
    @RequestMapping("/quality/rejectedList.htm")
    public ModelAndView rejectedList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        modelMap.addAttribute("supp", purchDAO.list("", "SupplierMaster"));
        modelMap.addAttribute("rejectedList", qualityDAO.rejectedList(SNo));
        return new ModelAndView("../assets/rejectedList", modelMap);
    }
//**************Quality Approved List******************//

    @RequestMapping("/quality/approvedItems.htm")
    public ModelAndView approvedList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");

        modelMap.addAttribute("approvedList", qualityDAO.approvedList(SNo));
        modelMap.addAttribute("supp", purchDAO.list("", "SupplierMaster"));
        return new ModelAndView("../assets/approvedItems", modelMap);
    }
//**************To Fetch Batch No.******************//

    @RequestMapping("/quality/fetchbatchNo.htm")
    public void fetchbatchNo(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String batchNo = req.getParameter("batchNo");
        qualityDAO.fetchbatchNo(req, res, batchNo);
    }
//**************To Fetch Invoice******************//

    @RequestMapping("/quality/fetchInvoice.htm")
    public void fetchInvoice(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String customerInvoiceNo = req.getParameter("customerInvoiceNo");
        qualityDAO.fetchInvoice(req, res, customerInvoiceNo);
    }

//**************GRN List******************//
    @RequestMapping("/quality/grnList.htm")
    public ModelAndView grnList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
//        modelMap.addAttribute("grnList", inventorydao.itemmovlist(null, orgId));
//        modelMap.addAttribute("supplerDetails", inventorydao.supplierDetails(null));
        modelMap.addAttribute("grnList", qualityDAO.grnList(SNo));
        modelMap.addAttribute("supp", purchDAO.list("", "SupplierMaster"));
        return new ModelAndView("../assets/grnList", modelMap);
    }
//**************GRN Form******************//

    @RequestMapping("/quality/grnForm.htm")
    public ModelAndView grnForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String poNo = request.getParameter("poNo");
        String qa = request.getParameter("qa");

        String link = "../assets/grnForm.htm";
        String tab = "GoodReceiptNote";
        modelMap.addAttribute("qualitySumTotal", qualityDAO.qualityListSumTotal(poNo));
        modelMap.addAttribute("qualityList", qualityDAO.qualityList(qa));
        modelMap.addAttribute("supp", purchDAO.list("", "SupplierMaster"));
        modelMap.addAttribute("item", purchDAO.list("", "ItemMaster"));
        modelMap.addAttribute("itemCat", purchDAO.list("", "ItemCategory"));
        modelMap.addAttribute("uom", purchDAO.list("", "UomMaster"));
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../assets/grnForm", modelMap);
    }
//**************GRN Form Submit******************//

    @RequestMapping("/quality/grnFormSubmit.htm")
    public ModelAndView grnFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");
        String poNo = request.getParameter("poNo");
        String grnDate = request.getParameter("grnDate");
        String grnNo = request.getParameter("grnNo");
        String receivedBy = request.getParameter("receivedBy");
        String customerInvoiceNo = request.getParameter("customerInvoiceNo");
        String customerInvoiceDate = request.getParameter("customerInvoiceDate");
        String supplierName = request.getParameter("supplierName");
        String supplierAddress = request.getParameter("supplierAddress");
        String supplierContactNo = request.getParameter("supplierContactNo");
        String supplierMailId = request.getParameter("supplierMailId");
        String deliveryLocation = request.getParameter("deliveryLocation");
        String inventoryLocation = request.getParameter("inventoryLocation");
        String itemCode[] = request.getParameterValues("itemCode");
        String itemName[] = request.getParameterValues("itemName");
        String creationDate = request.getParameter("creationDate");
        String orderedQty[] = request.getParameterValues("orderedQty");
        String receivedQty[] = request.getParameterValues("receivedQty");
        String batchNo = request.getParameter("batchNo");
        String foc[] = request.getParameterValues("foc");
        String uom[] = request.getParameterValues("uom");
        String manufacturer[] = request.getParameterValues("manufacturer");
        String model[] = request.getParameterValues("model");
        String expiryDate[] = request.getParameterValues("expiryDate");
        String warrantyPeriod[] = request.getParameterValues("warrantyPeriod");
        String status = request.getParameter("status");
        String grnStatus = request.getParameter("grnStatus");
        String remarks = request.getParameter("remarks");
        String attr1 = request.getParameter("attr1");
        String attr2 = request.getParameter("attr2");
        String attr3 = request.getParameter("attr3");
        String attr4 = request.getParameter("attr4");
        String attr5 = request.getParameter("attr5");
        String qtyAccepted[] = request.getParameterValues("qtyAccepted");
        String qtyRejected[] = request.getParameterValues("qtyRejected");
        String unitPrice[] = request.getParameterValues("unitPrice");
        String totalPrice[] = request.getParameterValues("totalPrice");
        String discount = request.getParameter("discount");
        String grandTotal = request.getParameter("grandTotal");

        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        List<Inventorylist> gridData1 = new ArrayList<Inventorylist>();

        if (grnNo == null || grnNo == "" || "".equals(grnNo)) {
            ArrayList validuser = (ArrayList) qualityDAO.getGrnNo(poNo);
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
            grnNo = "GRN" + "-" + ordno;
        }

        Date grnDate1 = null;
        if (!grnDate.equals("")) {
            grnDate1 = (Date) formatter.parse(grnDate);
        }

        Date custInvoiceDate1 = null;
        if (!customerInvoiceDate.equals("")) {
            custInvoiceDate1 = (Date) formatter.parse(customerInvoiceDate);
        }

        if (pk == null || pk == "" || pk.equals("")) {
            for (int i = 0; i < itemName.length; i++) {
                Date expiryDate1 = null;
                if (!expiryDate.equals("")) {
                    expiryDate1 = (Date) formatter.parse(expiryDate[i]);
                }

                Grn grn = new Grn(grnNo, orgId, userId, poNo, grnDate1, receivedBy, customerInvoiceNo, custInvoiceDate1, supplierName, supplierAddress, supplierContactNo, supplierMailId, inventoryLocation, deliveryLocation, orderedQty[i], receivedQty[i], foc[i], uom[i], manufacturer[i], model[i], expiryDate1, warrantyPeriod[i], "GRN Created", remarks, itemCode[i], itemName[i], "update0", newdate, qtyAccepted[i], qtyRejected[i], unitPrice[i], totalPrice[i], discount, grandTotal);
                qualityDAO.grnSave(grn);
                qualityDAO.updateQuality(poNo);

                String avlitemId = null;
                Double avlqty = null;
                Double qtyavl = null;
                Integer dupSno = null;
                String dupItemCategory = null;
                ArrayList dupqty = (ArrayList) qualityDAO.fetchinventlist(itemCode[i]);
                for (Iterator<Inventorylist> iter = dupqty.iterator(); iter.hasNext();) {
                    avlitemId = iter.next().getItemCode();
                }
                for (Iterator<Inventorylist> iter = dupqty.iterator(); iter.hasNext();) {
                    //       avlqty = iter.next().getTotalStock();

                    qtyavl = avlqty + Double.parseDouble(receivedQty[i]);
                }

                if (itemCode[i].equals(dupqty) || avlitemId != null) {

                    qualityDAO.updateinventory(itemCode[i], qtyavl);
                } else {
                    //        Inventorylist bi = new Inventorylist(orgId, userId, itemCode[i], itemName[i], Double.parseDouble(receivedQty[i]), uom[i], expiryDate1, batchNo, inventoryLocation, warrantyPeriod[i], attr1, attr2, attr3, attr4, attr5, "update0", newdate, today);
                    //        gridData1.add(bi);
                    qualityDAO.SaveInventory(gridData1);
                    qualityDAO.updateQuality(poNo);

                }
            }
        }

        return new ModelAndView(new RedirectView("../quality/grnList.htm"), modelMap);
    }
//**************GRN View******************//

    @RequestMapping("/quality/grnView.htm")
    public ModelAndView grnView(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String poNo = request.getParameter("poNo");
        String grnNo = request.getParameter("grnNo");

        String link = "../assets/grnForm.htm";
        String tab = "GRN";
        modelMap.addAttribute("grnList", qualityDAO.grnList1(grnNo));
        modelMap.addAttribute("supp", purchDAO.list("", "SupplierMaster"));
        modelMap.addAttribute("item", purchDAO.list("", "ItemMaster"));
        modelMap.addAttribute("itemCat", purchDAO.list("", "ItemCategory"));
        modelMap.addAttribute("uom", purchDAO.list("", "UomMaster"));
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../assets/grnView", modelMap);
    }

    //**************Material Return List******************//
   @RequestMapping("/quality/materialReturnList.htm")
    public ModelAndView materialReturnList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        if (fromDate != null && toDate != null) {
            if (fromDate.contains("frdate") && toDate.contains("todate")) {
                fromDate = null;
                toDate = null;
            }
        }

        if (fromDate == null || toDate == null) {
            modelMap.addAttribute("materialReturnList", qualityDAO.returnList(SNo));
        } else {
            modelMap.addAttribute("materialReturnList", qualityDAO.returnList1(null, fromDate, toDate));
        }
        modelMap.addAttribute("supp", purchDAO.list("", "SupplierMaster"));
        return new ModelAndView("../assets/materialReturnList", modelMap);
    }


    //**************Material Return Form******************//
    @RequestMapping("/quality/materialReturnForm.htm")
    public ModelAndView materialReturnForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {

        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String sno = request.getParameter("pk");
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String mrNo = request.getParameter("mrNo");
        String poNo = request.getParameter("poNo");
        String link = "../assets/gmcApprovalForm.htm";
        String tab = "Material Return";
        modelMap.addAttribute("gmcApprovalList", qualityDAO.gmcApprovalList(sno, mrNo));
        modelMap.addAttribute("supp", qualityDAO.list("", "SupplierMaster"));
        modelMap.addAttribute("item", qualityDAO.list("", "ItemMaster"));
        modelMap.addAttribute("itemCat", qualityDAO.list("", "ItemCategory"));
        modelMap.addAttribute("uom", qualityDAO.list("", "UomMaster"));
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../assets/materialReturnForm", modelMap);
    }

    //**************Quality Rejected Form******************//
    @RequestMapping("/quality/rejectedForm.htm")
    public ModelAndView rejectedForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String qa = request.getParameter("materialReceiptNo");
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();

        String link = "../assets/rejectedForm.htm";
        String tab = "Quality";
        modelMap.addAttribute("rejectedList", qualityDAO.rejectedFormList(qa));
        modelMap.addAttribute("supp", qualityDAO.list("", "SupplierMaster"));
        modelMap.addAttribute("item", qualityDAO.list("", "ItemMaster"));
        modelMap.addAttribute("itemCat", qualityDAO.list("", "ItemCategory"));
        modelMap.addAttribute("uom", qualityDAO.list("", "UomMaster"));
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../assets/rejectedForm", modelMap);
    }

    //**************Quality Rejected Form Submit******************//
    @RequestMapping("/quality/rejectFormSubmit.htm")
    public ModelAndView rejectFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");
        String mrNo = request.getParameter("mrNo");
        String poNo = request.getParameter("poNo");
        String qa = request.getParameter("qa");
        String qaBy = request.getParameter("qaBy");
//        String receivedBy = request.getParameter("receivedBy");
        String customerInvoiceNo = request.getParameter("customerInvoiceNo");
        String customerInvoiceDate = request.getParameter("customerInvoiceDate");
        String supplierName = request.getParameter("supplierName");
        String supplierName11 = request.getParameter("supplierName11");
        String supplierAddress = request.getParameter("supplierAddress");
        String supplierContactNo = request.getParameter("supplierContactNo");
        String supplierMailId = request.getParameter("supplierMailId");
        String deliveryLocation = request.getParameter("deliveryLocation");
        String inventoryLocation = request.getParameter("inventoryLocation");
        String itemCode[] = request.getParameterValues("itemCode");
        String itemName[] = request.getParameterValues("itemName");
        String qty[] = request.getParameterValues("qty");
        String orderedQty[] = request.getParameterValues("orderedQty");
        String rejectQty[] = request.getParameterValues("rejectQty");
        String foc[] = request.getParameterValues("foc");
        String uom[] = request.getParameterValues("uom");
        String batchNo = request.getParameter("batchNo");
        String expiryDate[] = request.getParameterValues("expiryDate");
        String warrwntyPeriod[] = request.getParameterValues("warrwntyPeriod");
        String status = request.getParameter("status");
        String returnStatus = request.getParameter("returnStatus");
        String remarks = request.getParameter("remarks");

        String attr1 = request.getParameter("attr1");
        String attr2 = request.getParameter("attr2");
        String attr3 = request.getParameter("attr3");
        String attr4 = request.getParameter("attr4");
        String attr5 = request.getParameter("attr5");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());

        if (mrNo == null || mrNo == "" || "".equals(mrNo)) {
            Integer MR = qualityDAO.getMRNo();
            mrNo = "MR-" + (MR + 1);
        }

        Date custInvoiceDate1 = null;
        if (!customerInvoiceDate.equals("")) {
            custInvoiceDate1 = (Date) formatter.parse(customerInvoiceDate);
        }

        if (pk == null || pk == "" || pk.equals("")) {
            qualityDAO.updateReturnStatus(qa);

            for (int i = 0; i < itemName.length; i++) {
                Date expiryDate1 = null;
                if (!expiryDate[i].equals("")) {
                    expiryDate1 = (Date) formatter.parse(expiryDate[i]);
                }

                MaterialReturn materialReturn = new MaterialReturn(orgId, userId, mrNo, qa, poNo, qaBy, customerInvoiceNo, custInvoiceDate1, supplierName, supplierAddress, supplierContactNo, supplierMailId, inventoryLocation, itemName[i], itemCode[i], expiryDate1, orderedQty[i], qty[i], rejectQty[i], foc[i], uom[i], batchNo, remarks, "Material Returned", "update0", newdate);
                qualityDAO.grnSave(materialReturn);
            }
        }

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
//                StringBuilder emailId = new StringBuilder(email);
//                int i = 1;
//
//                emailId.append(",");
//                emailId.append(toEmail);
//                String[] sendEmail = emailId.toString().split(",");
//                subject = "MaterialReturn Code: " + mrNo;
//                String filepath = request.getSession().getServletContext().getRealPath("common\\theme\\images\\logo1.png");
//                mailbody = "<html><body>Dear Sir/Madam,<br/><br/><br/>You need to give an approval for MaterialReturn. MaterialReturn Code : " + mrNo + ", Purchase Order No : " + poNo + ", supplierName : " + supplierName11 + " " + ","
//                        + " Please Approve this MaterialReturn. <br/><br/>If approved ignore this mail. "
//                        + "</body>"
//                        + "<br/><br/>Thanks & Regards"
//                        + "<br/>Al-Hashar Team.</html>";
//                ByteArrayOutputStream baos = new ByteArrayOutputStream();
//                baos.close();
//                cm.sendEmail(userEmail, password, sendEmail, subject, mailbody, baos, fileName);
//
//            }
//        }
        return new ModelAndView(new RedirectView("../quality/materialReturnList.htm"), modelMap);
    }

    //**************Material Return GMC Approval List******************//
    @RequestMapping("/quality/gmcApprovalList.htm")
    public ModelAndView gmcApprovalList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        modelMap.addAttribute("gmcApprovalList", qualityDAO.gmcApprovalList2(SNo, null));
        modelMap.addAttribute("supp", purchDAO.list("", "SupplierMaster"));
        return new ModelAndView("../assets/gmcApprovalList", modelMap);
    }
//**************Material Return GMC Approval Form******************//

    @RequestMapping("/quality/gmcApprovalForm.htm")
    public ModelAndView gmcApprovalForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String sno = request.getParameter("pk");
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String mrNo = request.getParameter("mrNo");
        String poNo = request.getParameter("poNo");
        String link = "../assets/gmcApprovalForm.htm";
        String tab = "Approval 1";
        modelMap.addAttribute("gmcApprovalList", qualityDAO.gmcApprovalList(sno, mrNo));
        modelMap.addAttribute("supp", purchDAO.list("", "SupplierMaster"));
        modelMap.addAttribute("item", purchDAO.list("", "ItemMaster"));
        modelMap.addAttribute("itemCat", purchDAO.list("", "ItemCategory"));
        modelMap.addAttribute("uom", purchDAO.list("", "UomMaster"));
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../assets/gmcApprovalForm", modelMap);
    }
//**************Material Return GMC Approval Form Submit******************//

    @RequestMapping("/quality/gmcApprovalSubmit.htm")
    public ModelAndView gmcApprovalSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException, MessagingException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String mrNo = request.getParameter("mrNo");
        String supplierName11 = request.getParameter("supplierName11");
        String poNo = request.getParameter("poNo");
        String SNo = request.getParameter("sno");
        String approvalStatus1 = request.getParameter("approvalStatus1");
        String approverRemarks1 = request.getParameter("approverRemarks1");

        String pk[] = request.getParameterValues("pk");

        List<MaterialReturn> gridData = new ArrayList<MaterialReturn>();

        qualityDAO.mrApproval1(mrNo, "GFC Approved", approverRemarks1);
//        Common cm = new Common();
//        String subject = "", tbody = "", mailbody = "", email = "", fileName = "", suppAdd = "";
//        String userEmail = "excelarete@gmail.com";
//        String password = "excel123";
//        String toEmail = "";
//        List<UserRegistration> ud = tenantDetailsDAO.udList("CFO");
//        for (UserRegistration udlist : ud) {
//            userId = udlist.getUserId();
//            email = udlist.getEmail();
//
//            if (!userEmail.isEmpty() && !password.isEmpty() && !email.isEmpty()) {
//                StringBuilder emailId = new StringBuilder(email);
//                int i = 1;
//
//                emailId.append(",");
//                emailId.append(toEmail);
//                String[] sendEmail = emailId.toString().split(",");
//                subject = "MaterialReturn Code: " + mrNo;
//                String filepath = request.getSession().getServletContext().getRealPath("common\\theme\\images\\logo1.png");
//                mailbody = "<html><body>Dear Sir/Madam,<br/><br/><br/>You need to give an approval for MaterialReturn. MaterialReturn Code : " + mrNo + ", Purchase Order No : " + poNo + ", supplierName : " + supplierName11 + " " + ","
//                        + " Please Approve this MaterialReturn. <br/><br/>If approved ignore this mail. "
//                        + "</body>"
//                        + "<br/><br/>Thanks & Regards"
//                        + "<br/>Al-Hashar Team.</html>";
//                ByteArrayOutputStream baos = new ByteArrayOutputStream();
//                baos.close();
//                cm.sendEmail(userEmail, password, sendEmail, subject, mailbody, baos, fileName);
//
//            }
//        }
        return new ModelAndView(new RedirectView("../quality/gmcApprovalList.htm"), modelMap);
    }
//**************Material Return Approval 2 List******************//

    @RequestMapping("/quality/cfoApprovalList.htm")
    public ModelAndView cfoApprovalList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        modelMap.addAttribute("cfoApprovalList", qualityDAO.cfoApprovalList2(SNo, null));
        modelMap.addAttribute("supp", purchDAO.list("", "SupplierMaster"));
        return new ModelAndView("../assets/cfoApprovalList", modelMap);
    }
//**************Material Return Approval 2 Form******************//

    @RequestMapping("/quality/cfoApprovalForm.htm")
    public ModelAndView cfoApprovalForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String sno = request.getParameter("pk");
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String mrNo = request.getParameter("mrNo");
        String poNo = request.getParameter("poNo");
        String link = "../assets/cfoApprovalForm.htm";
        String tab = "Approval 1";
        modelMap.addAttribute("cfoApprovalList", qualityDAO.cfoApprovalList(sno, mrNo));
        modelMap.addAttribute("supp", purchDAO.list("", "SupplierMaster"));
        modelMap.addAttribute("item", purchDAO.list("", "ItemMaster"));
        modelMap.addAttribute("itemCat", purchDAO.list("", "ItemCategory"));
        modelMap.addAttribute("uom", purchDAO.list("", "UomMaster"));
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../assets/cfoApprovalForm", modelMap);
    }
//**************Material Return Approval 2 Form Submit******************//

    @RequestMapping("/quality/cfoApprovalSubmit.htm")
    public ModelAndView cfoApprovalSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String mrNo = request.getParameter("mrNo");
        String SNo = request.getParameter("sno");
        String approvalStatus1 = request.getParameter("approvalStatus1");
        String approverRemarks1 = request.getParameter("approverRemarks2");

        String pk[] = request.getParameterValues("pk");

        List<MaterialReturn> gridData = new ArrayList<MaterialReturn>();

        qualityDAO.mrApproval2(mrNo, "CFO Approved", approverRemarks1);
        return new ModelAndView(new RedirectView("../quality/cfoApprovalList.htm"), modelMap);
    }

//    //**************Inventory List******************//
//    @RequestMapping("/quality/inventoryList.htm")
//    public ModelAndView inventoryList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
//        HttpSession session = request.getSession(true);
//        String userId = session.getAttribute("userId").toString();
//        String orgId = session.getAttribute("orgId").toString();
//        ModelMap modelMap = new ModelMap();
//        String SNo = request.getParameter("sno");
//        modelMap.addAttribute("inventoryList", qualityDAO.inventoryList(SNo));
//        return new ModelAndView("../assets/inventoryList", modelMap);
//    }
    @RequestMapping("/quality/inventoryList.htm")
    public ModelAndView inventoryList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        modelMap.addAttribute("inventorylist", qualityDAO.inventlist5(null, null));
        //modelMap.addAttribute("itmlist", inventorydao.inventlist1(userId, orgId));
        return new ModelAndView("../assets/inventoryList", modelMap);

    }

    @RequestMapping("/quality/paginationList.htm")
    public void paginationList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("application/Json");
        PrintWriter out = res.getWriter();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
//        Object storeName1 = session.getAttribute("storeName");
//        String storeName = null;
//        if (storeName1 != null) {
//            storeName = storeName1.toString();
//            System.out.println("storeName"+storeName);
//        }

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

        List<Inventorylist> list = null;
        BigInteger listCount = null;
        Gson gson = new Gson();
        JsonObject jsonResponse = new JsonObject();

        String listPage = req.getParameter("listPage");
        String recordStatus = "";
        if (listPage.equalsIgnoreCase("mrList")) {
            recordStatus = "Received";
        }

        if (searchData == null || searchData.isEmpty()) {
            list = qualityDAO.paginationList(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, listPage, recordStatus, sCol);
            listCount = qualityDAO.paginationCount(userId, orgId, null, searchData, sdir, listPage, recordStatus, sCol);

        } else {
            list = qualityDAO.paginationList(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, listPage, recordStatus, sCol);
            listCount = qualityDAO.paginationCount(userId, orgId, null, searchData, sdir, listPage, recordStatus, sCol);

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

    //**************Inventory Count List******************//
    @RequestMapping("/quality/inventoryCountList.htm")
    public ModelAndView inventoryCountList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
//        modelMap.addAttribute("itemlist", inventorydao.itemlist1(userId, orgId));
//        modelMap.addAttribute("inventrylist", inventorydao.inventoryCountList(orgId, null));
        return new ModelAndView("../assets/inventoryCountList", modelMap);
    }
//************** Select Inventory Count Details******************//

    @RequestMapping("/quality/selectInventoryCount.htm")
    public ModelAndView selectInventoryCount(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String prcode = req.getParameter("prcode");
        modelMap.addAttribute("prcode", prcode);
        //modelMap.addAttribute("projectlist", qualityDAO.inventoryList2());
        modelMap.addAttribute("inventrycountlist", qualityDAO.inventoryCount1(prcode));

        return new ModelAndView("../assets/itemCodePopUp", modelMap);
    }
//**************  Inventory Count Form******************//

    @RequestMapping("/quality/inventoryCountForm.htm")
    public ModelAndView inventoryCountForm(HttpServletRequest req, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String SNo = req.getParameter("sno");
        String division = session.getAttribute("userDiv").toString();

        if (SNo != null) {

            modelMap.addAttribute("inventrylist", qualityDAO.inventoryCountList(orgId, SNo));
            //modelMap.addAttribute("emplist", contactdao.empList(orgId, null));
        }
        modelMap.addAttribute("SNo", SNo);
        //modelMap.addAttribute("itemlist", inventorydao.itemlist1(userId, orgId));
        modelMap.addAttribute("projectlist", qualityDAO.inventoryList2());
        modelMap.addAttribute("action", req.getParameter("action"));

        modelMap.addAttribute("store1", qualityDAO.storeMasterdivisionwise(division));

        modelMap.addAttribute("batchinventrylist", qualityDAO.inventoryList1(orgId));
        modelMap.addAttribute("item", qualityDAO.item());
        return new ModelAndView("../assets/inventoryCountForm", modelMap);
    }

    //************** To get Batch No.******************//
    @RequestMapping("/quality/getBatchNo.htm")
    public void getBatchNo(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String itemCode = req.getParameter("itemCode");
        String fromLocation = req.getParameter("fromLocation");
        qualityDAO.batchList(req, res, itemCode, fromLocation);

    }

    //**************  Inventory Count Form Submit******************//
    @RequestMapping("/quality/inventoryCountFormSubmit.htm")
    public ModelAndView inventoryCountFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
        DateFormat fx = new SimpleDateFormat("dd-MMM-yyyy");
        DateFormat formatterX = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ssa");
        Calendar now1 = Calendar.getInstance();
        //String mod_date1 = now.get(Calendar.YEAR) + "/" + (now.get(Calendar.MONTH) + 1) + "/" + now.get(Calendar.DATE);
        // Date date1 = now.getTime();
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        //String itemId[] = request.getParameterValues("itemId");
        String itemCode[] = request.getParameterValues("itemCode");
        String projectCode = request.getParameter("storeLocation");
        String itemName[] = request.getParameterValues("itemName");
        String batchNo[] = request.getParameterValues("batchNo");
        String expiryDate = request.getParameter("expiryDate");
        String uom[] = request.getParameterValues("uom");
        String availQty[] = request.getParameterValues("availQty");
        String phyQty[] = request.getParameterValues("phyQty");
        String phyQtyDate = request.getParameter("phyQtyDate");
        String user = request.getParameter("user");
        String division = request.getParameter("division");
        String subCategory[] = request.getParameterValues("subCategory");
        //String pk = request.getParameter("pk");
        //BigDecimal sno1 = new BigDecimal(pk);
        String unitPrice[] = request.getParameterValues("unitPrice");
        String varianceQty[] = request.getParameterValues("varianceQty");

        String status = request.getParameter("status");

        List<InventoryCount> gridData = new ArrayList<InventoryCount>();
        List<Inventorylist> gridData1 = new ArrayList<Inventorylist>();
        List<StockLedger> gridData2 = new ArrayList<StockLedger>();
        Date phyQtyDate1 = null;
        Date expiryDate1 = null;

//        if (pk == null) {
        for (int i = 0; i < itemCode.length; i++) {

            if (phyQty[i] == "") {
                phyQty[i] = "0.00";

            }
            Double unitPrice1 = 0.0;
            if (!"".equals(unitPrice[i]) && unitPrice != null) {
                unitPrice1 = Double.parseDouble(unitPrice[i]);
            }
            phyQtyDate1 = (Date) formatter.parse(phyQtyDate);
            expiryDate1 = (Date) formatter.parse(expiryDate);
            String batchNo1[] = batchNo[i].split("/");

            InventoryCount inventoryCount = new InventoryCount(userId, orgId, projectCode, itemCode[i], itemName[i], batchNo1[0],
                    expiryDate1, uom[i], Double.parseDouble(availQty[i]), Double.parseDouble(phyQty[i]), phyQtyDate1,
                    userId, "update0", sqlTimestamp, Double.parseDouble(varianceQty[i]), "Requested", unitPrice1);

            gridData.add(inventoryCount);

            qualityDAO.updateinventory1(projectCode, itemCode[i], batchNo1[0], Double.parseDouble(phyQty[i]));
            qualityDAO.save1(gridData);

//            Double nquan = 0.0;
//            Double nquan1 = 0.0;
//            Double uquan = 0.0;
//            Double uquan1 = 0.0;
//
//            Double remainstock = (Double.parseDouble(phyQty[i]));
//            Double value = ((remainstock) * (Double.parseDouble(unitPrice[i])));
//            inventorydao.updateinventory2(projectCode, remainstock, itemCode[i], value, nquan1, uquan1, batchNo1[0], formatter.format(expiryDate1));
//
//            String avlitemId2 = null;
//            Double avlqty2 = null;
//            Double amount2 = null;
//            Double totalValue = Double.parseDouble(varianceQty[i]) * (Double.parseDouble(unitPrice[i]));
//            ArrayList dupqty2 = (ArrayList) storeDAO.fetchStockLedger(itemCode[i], projectCode);
//
//            if (dupqty2 != null) {
//                for (Iterator<StockLedger> iter = dupqty2.iterator(); iter.hasNext();) {
//                    avlitemId2 = iter.next().getItemCode();
//                }
//                for (Iterator<StockLedger> iter = dupqty2.iterator(); iter.hasNext();) {
//                    avlqty2 = iter.next().getBalanceQty();
//                }
//                for (Iterator<StockLedger> iter = dupqty2.iterator(); iter.hasNext();) {
//                    amount2 = iter.next().getBalnaceAmount();
//                }
//                if (avlqty2 == null) {
//                    avlqty2 = 0.0;
//                }
//
//                if (itemCode[i].equals(dupqty2) || avlitemId2 != null) {
//                    if (Double.parseDouble(availQty[i]) < Double.parseDouble(phyQty[i])) {
//
//                        Double invtqty = avlqty2 + Double.parseDouble(varianceQty[i]);
//                        Double totalValue1 = (invtqty * (Double.parseDouble(unitPrice[i])));
//
//                        StockLedger stockLedger = new StockLedger(userId, orgId, division, projectCode, subCategory[i], itemCode[i], itemName[i],
//                                phyQtyDate1, "SA", "SA", Double.parseDouble(varianceQty[i]), Double.parseDouble(unitPrice[i]), totalValue1, "", 0.0, 0.0,
//                                0.0, invtqty, totalValue / invtqty, totalValue, "Receipts", uom[i]);
//                        gridData2.add(stockLedger);
//                        inventorydao.saveStock(gridData2);
//                    } else {
//
//                        Double invtqty = avlqty2 + Double.parseDouble(varianceQty[i]);
//
//                        Double issueAmount = (Double.parseDouble(varianceQty[i]) * Double.parseDouble(unitPrice[i]));
//
//                        StockLedger stockLedger = new StockLedger(userId, orgId, division, projectCode, "", itemCode[i], itemName[i],
//                                phyQtyDate1, "SA", "", 0.0, 0.0, 0.0, "SA", Double.parseDouble(varianceQty[i]), Double.parseDouble(unitPrice[i]),
//                                issueAmount, invtqty, totalValue / invtqty, totalValue, "Issues", uom[i]);
//                        gridData2.add(stockLedger);
//                        inventorydao.saveStock(gridData2);
//
//                    }
//                }
//
//            }
        }
        modelMap.addAttribute("inventrylist", qualityDAO.inventoryCountList(orgId, null));
        modelMap.addAttribute("itemlist", qualityDAO.itemlist1(userId, orgId));
        modelMap.addAttribute("message", "Data Saved Successfully...");
        return new ModelAndView(new RedirectView("../quality/inventoryCountList.htm"), modelMap);
    }

//    @RequestMapping("/quality/reOrderList.htm")
//    public ModelAndView reOrderList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
//        ModelMap modelMap = new ModelMap();
//        HttpSession session = req.getSession(true);
//        String userId = session.getAttribute("userId").toString();
//        String orgId = session.getAttribute("orgId").toString();
//        modelMap.addAttribute("inventorylist", qualityDAO.reOrderList(null, null));
//        //modelMap.addAttribute("itmlist", inventorydao.inventlist1(userId, orgId));
//        return new ModelAndView("../assets/reOrderList", modelMap);
//
//    }
    @RequestMapping("/quality/reOrderList.htm")
    public ModelAndView reOrderList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
//        String storeName = req.getParameter("storeName");
//
//        modelMap.addAttribute("storeName1", storeName);
        modelMap.addAttribute("store1", qualityDAO.storeMasterdivisionwise(null));
        return new ModelAndView("../assets/reOrderList", modelMap);

    }

//    @RequestMapping("/quality/paginationReOrderList.htm")
//    public void paginationReOrderList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
//        res.setContentType("application/Json");
//        PrintWriter out = res.getWriter();
//        HttpSession session = req.getSession(true);
//        String userId = session.getAttribute("userId").toString();
//        String orgId = session.getAttribute("orgId").toString();
////        Object storeName1 = session.getAttribute("storeName");
////        String storeName = null;
////        if (storeName1 != null) {
////            storeName = storeName1.toString();
////            System.out.println("storeName"+storeName);
////        }
//
//        // ---------Json getting the value for each action like search,first,previous,last and show dropdown in front end---------
//        String searchData = req.getParameter("sSearch");
//        Integer displayLength = Integer.parseInt(req.getParameter("iDisplayLength"));
//        Integer sEcho = Integer.parseInt(req.getParameter("sEcho"));
//        Integer iDisplayStart = Integer.parseInt(req.getParameter("iDisplayStart"));
//        String sCol = req.getParameter("iSortCol_0");
//        String sdir = req.getParameter("sSortDir_0");
//        String sdir1 = req.getParameter("sColumns");
//        String sdir2 = req.getParameter("more_data");
//        String sTitle = req.getParameter("iSortTitle_1");
//        List<Inventorylist> list = null;
//        BigInteger listCount = null;
//        Gson gson = new Gson();
//        JsonObject jsonResponse = new JsonObject();
//
//        String listPage = req.getParameter("listPage");
//        String recordStatus = "";
//        if (listPage.equalsIgnoreCase("mrList")) {
//            recordStatus = "Received";
//        }
//
//        if (searchData == null || searchData.isEmpty()) {
//            list = qualityDAO.paginationReOrderList(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, listPage, recordStatus, sCol);
//            listCount = qualityDAO.paginationReOrderCount(userId, orgId, null, searchData, sdir, listPage, recordStatus, sCol);
//
//        } else {
//            list = qualityDAO.paginationReOrderList(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, listPage, recordStatus, sCol);
//            listCount = qualityDAO.paginationReOrderCount(userId, orgId, null, searchData, sdir, listPage, recordStatus, sCol);
//
//        }
//
//        // ---------Json setting the value for each action like search,first,previous,last and show dropdown in front end---------
//        jsonResponse.add("iDisplayLength", gson.toJsonTree(displayLength));
//        jsonResponse.add("iTotalRecords", gson.toJsonTree(listCount));
//        jsonResponse.add("iTotalDisplayRecords", gson.toJsonTree(listCount));
//        jsonResponse.add("sEcho", gson.toJsonTree(sEcho));
//        jsonResponse.add("iDisplayStart", gson.toJsonTree(iDisplayStart));
//        jsonResponse.add("aaData", gson.toJsonTree(list));
//        out.print(jsonResponse);
//        out.flush();
//
//    }
//    
//    
    //************** Select Stock Entry Details******************//
    ///Newly Added By Lakshmi
    @RequestMapping("/quality/stockEntryList.htm")
    public ModelAndView stockEntryList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String prcode = req.getParameter("prcode");
        modelMap.addAttribute("prcode", prcode);
        //modelMap.addAttribute("projectlist", qualityDAO.inventoryList2());
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Stock Entry";
        String submoduleName = "Stock Adjustment";
        modelMap.addAttribute("stockEntrylist", qualityDAO.StockEntryList());
        modelMap.addAttribute("permission", qualityDAO.roleperm(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../assets/stockEntryList", modelMap);
    }
//**************  Inventory Count Form******************//
///Newly Added By Lakshmi

    @RequestMapping("/quality/stockEntryForm.htm")
    public ModelAndView stockEntryForm(HttpServletRequest req, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String SNo = req.getParameter("pk");
        String division = session.getAttribute("userDiv").toString();

        if (SNo != null) {

            modelMap.addAttribute("stocklist", qualityDAO.totalStockEntryList(orgId, SNo));
            //modelMap.addAttribute("emplist", contactdao.empList(orgId, null));
        }
        modelMap.addAttribute("SNo", SNo);
        //modelMap.addAttribute("itemlist", inventorydao.itemlist1(userId, orgId));
        modelMap.addAttribute("projectlist", qualityDAO.inventoryList2());
        modelMap.addAttribute("action", req.getParameter("action"));

        modelMap.addAttribute("store1", qualityDAO.storeMasterdivisionwise(division));

        modelMap.addAttribute("batchinventrylist", qualityDAO.inventoryList1(orgId));
        modelMap.addAttribute("item", qualityDAO.item());
        return new ModelAndView("../assets/stockEntryForm", modelMap);
    }
///Newly Added By Lakshmi

    @RequestMapping("/quality/stockEntryFormSubmit.htm")
    public ModelAndView stockEntryFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, IOException {
        DateFormat fx = new SimpleDateFormat("dd-MMM-yyyy");
        System.out.println("Hi stockEntryFormSubmit................");

        DateFormat formatterX = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ssa");
        Calendar now1 = Calendar.getInstance();
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        //String itemDesc[] = request.getParameterValues("itemDesc");
        String projectCode = request.getParameter("storeLocation");
        //String projectCode = request.getParameter("storeLocation");
        String itemCode[] = request.getParameterValues("itemCode");
        //String itemCode = request.getParameter("itemCode");
        String itemName[] = request.getParameterValues("itemName");
        //String itemName = request.getParameter("itemName");
        String itemDesc = request.getParameter("itemDesc");
        String phyQty[] = request.getParameterValues("phyQty");
        //String phyQty = request.getParameter("phyQty");
        String expiryDate = request.getParameter("expiryDate");
        //String expiryDate = request.getParameter("expiryDate");
        //String uom = request.getParameter("uom");
        String uom[] = request.getParameterValues("uom");
        String date = request.getParameter("date");
        String unitPrice[] = request.getParameterValues("unitPrice");
        //String unitPrice = request.getParameter("unitPrice");
        String totalPrice = request.getParameter("totalPrice");
        String stockEntryNo = request.getParameter("stockEntryNo");
        String remarks = request.getParameter("remarks");
        //String user = request.getParameter("user");
        String user = request.getParameter("user");
        String status = request.getParameter("status");
        List<StockEntry> gridData = new ArrayList<StockEntry>();
        //List<Inventorylist> gridData1 = new ArrayList<Inventorylist>();
        //List<StockLedger> gridData2 = new ArrayList<StockLedger>();
        String pk = request.getParameter("sno");
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultipartFile multipartFile = multipartRequest.getFile("attachmentReference");
        String fileName = multipartFile.getOriginalFilename();

        Date Date1 = null;
        Date expiryDate1 = null;
if (!"".equals(date) && date != null) {
                    Date1 = (Date) formatter.parse(date);
                }
                if (!"".equals(expiryDate) && expiryDate != null) {
                    expiryDate1 = (Date) formatter.parse(expiryDate);
                }
        if (pk == null) {
//        for (int i = 0; i < itemCode.length; i++) {
            for (int i = 0; i < itemCode.length; i++) {

                if (phyQty[i] == "") {
                    phyQty[i] = "0.00";

                }
                Double unitPrice1 = 0.0;
                if (!"".equals(unitPrice[i]) && unitPrice[i] != null) {
                    unitPrice1 = Double.parseDouble(unitPrice[i]);
                }

                
                // Date1 = (Date) formatter.parse(date);
                //expiryDate1 = (Date) formatter2.parse(expiryDate);
                StockEntry stockEntry = new StockEntry(userId, orgId, projectCode, itemCode[i], itemName[i],itemDesc, Double.parseDouble(phyQty[i]), expiryDate1, uom[i], Date1, Double.parseDouble(unitPrice[i]), Double.parseDouble(totalPrice), Integer.parseInt(stockEntryNo), user, "update0", sqlTimestamp, fileName, multipartFile.getBytes(),remarks);

                gridData.add(stockEntry);
                qualityDAO.saveStockEntry(gridData);
            }
        } else {
            StockEntry stockEntry = new StockEntry(Integer.parseInt(pk), userId, orgId, projectCode, itemCode[0], itemName[0],itemDesc, Double.parseDouble(phyQty[0]), expiryDate1, uom[0], Date1, Double.parseDouble(unitPrice[0]), Double.parseDouble(totalPrice), Integer.parseInt(stockEntryNo), user, "update0", sqlTimestamp, fileName, multipartFile.getBytes(),remarks);

            gridData.add(stockEntry);
            qualityDAO.saveStockEntry(gridData);

        }


//        if (pk == null) {



        modelMap.addAttribute("Stocklist", qualityDAO.totalStockEntryList(orgId, null));
        // modelMap.addAttribute("itemlist", qualityDAO.itemlist1(userId, orgId));
        modelMap.addAttribute("message", "Data Saved Successfully...");
        return new ModelAndView(new RedirectView("../quality/stockEntryList.htm"), modelMap);
    }
    /////

    @RequestMapping("/quality/paginationReOrderList.htm")
    public void paginationReOrderList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("application/Json");
        PrintWriter out = res.getWriter();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String storeName = req.getParameter("storeName");

        // ---------Json getting the value for each action like search,first,previous,last and show dropdown in front end---------
        String searchData = req.getParameter("sSearch");
        Integer displayLength = Integer.parseInt(req.getParameter("iDisplayLength"));
        Integer sEcho = Integer.parseInt(req.getParameter("sEcho"));
        Integer iDisplayStart = Integer.parseInt(req.getParameter("iDisplayStart"));

        List<Inventorylist> list = null;
        Integer listCount = null;
        Gson gson = new Gson();
        JsonObject jsonResponse = new JsonObject();
        String sCol = req.getParameter("iSortCol_0");
        String sdir = req.getParameter("sSortDir_0");
        String sdir1 = req.getParameter("sColumns");
        String sdir2 = req.getParameter("more_data");
        String sTitle = req.getParameter("iSortTitle_1");

        if (searchData == null || searchData.isEmpty()) {

            if (storeName != null && !storeName.isEmpty()) {
                list = qualityDAO.reorderpaginationList(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, "saftyList1", storeName, sCol);
                listCount = qualityDAO.reorderpaginationCount(userId, orgId, null, searchData, sdir, "saftyList1", storeName, sCol);

            } else {
                list = qualityDAO.reorderpaginationList(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, "saftyList", storeName, sCol);
                listCount = qualityDAO.reorderpaginationCount(userId, orgId, null, searchData, sdir, "saftyList", storeName, sCol);

            }
        } else if (storeName != null && !storeName.isEmpty()) {
            list = qualityDAO.reorderpaginationList(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, "saftyList1", storeName, sCol);
            listCount = qualityDAO.reorderpaginationCount(userId, orgId, null, searchData, sdir, "saftyList1", storeName, sCol);

        } else {
            list = qualityDAO.reorderpaginationList(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, "saftyList", storeName, sCol);
            listCount = qualityDAO.reorderpaginationCount(userId, orgId, null, searchData, sdir, "saftyList", storeName, sCol);

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

    // ............................  STOCK LIST  .......................................
    @RequestMapping("/quality/stockList.htm")
    public ModelAndView stockList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        modelMap.addAttribute("inventorylist", qualityDAO.inventlist5(null, null));
//        modelMap.addAttribute("inventrylist", qualityDAO.inventoryCountList(orgId, null));
        return new ModelAndView("../assets/stockList", modelMap);

    }

    @RequestMapping("/quality/receiptList.htm")
    public ModelAndView receiptList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        modelMap.addAttribute("poList", qualityDAO.poCount());
//        modelMap.addAttribute("matlist", inventorydao.polist1(null, orgId));
        return new ModelAndView("../assets/receiptList", modelMap);
    }

    @RequestMapping("/quality/receiptForm.htm")
    public ModelAndView receiptForm(HttpServletRequest req, HttpServletResponse res) throws SQLException {
        //String recordNo = req.getParameter("poNo");
        HttpSession session = req.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        ArrayList validuser = (ArrayList) qualityDAO.mrlist(null, orgId, "1", null);
        Integer orderNo = null;
        int ordno = 1;
        if (!validuser.isEmpty()) {
            for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
                if (iter.next() != null) {
                    Iterator<String> iter2 = validuser.iterator();
                    iter2.hasNext();
                    orderNo = Integer.parseInt(String.valueOf(iter2.next()));
                }
            }
        }
        if (orderNo != null) {
            ordno = orderNo + 1;
        }

        modelMap.addAttribute("ordno", ordno);
        modelMap.addAttribute("uomlist", qualityDAO.uomList1(userId, orgId));
        //  modelMap.addAttribute("itemSupplier", storeDAO.itemSupplier());
        modelMap.addAttribute("userId", userId);
        return new ModelAndView("../assets/receiptForm", modelMap);
    }

    @RequestMapping("/quality/fetchSupplier.htm")
    public ModelAndView fetchSupplier(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        //        String itemCode = req.getParameter("itemCode");
//        String recevingQty = req.getParameter("recevingQty");

        modelMap.addAttribute("supplier", qualityDAO.fetchSupplier());
        return new ModelAndView("../assets/selectSupplier", modelMap);
    }

    @RequestMapping("/quality/fetchPoNo.htm")
    public ModelAndView fetchPoNo(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String supplierId = req.getParameter("supplierId");

        modelMap.addAttribute("prcode", qualityDAO.fetchPoNo(supplierId));
        return new ModelAndView("../assets/selectPO", modelMap);
    }

    @RequestMapping("/quality/fetchPODetails.htm")
    public void fetchPODetails(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException {
        res.setContentType("text/html;charset=UTF-8");
        String poNo = req.getParameter("poNo");

        qualityDAO.fetchPODetails(req, res, poNo);

    }

    @RequestMapping("/quality/cancelrecept.htm")
    public void cancelrecept(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {

        res.setContentType("text/html;charset=UTF-8");
        String sno = req.getParameter("sno");

        qualityDAO.cancelrecept(req, res, sno);
    }

    @RequestMapping("/quality/uomNew.htm")
    public void uomNew(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {

        res.setContentType("text/html;charset=UTF-8");
        String poNo = req.getParameter("poNo");
        String itemCode = req.getParameter("itemCode");

        qualityDAO.uomNew(req, res, poNo, itemCode);

    }

    @RequestMapping("/quality/itemSupplier.htm")
    public void itemSupplier(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {

        res.setContentType("text/html;charset=UTF-8");

        String itemCode = req.getParameter("itemCode");
        String supplerCode = req.getParameter("suppCode");

        qualityDAO.itmsupplier(req, res, itemCode, supplerCode);

    }

    @RequestMapping("/quality/fetchreceivedQty1.htm")
    public void fetchreceivedQty1(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException {
        res.setContentType("text/html;charset=UTF-8");
        HttpSession session = req.getSession(true);
        String poNo = req.getParameter("poNo");
        String itemCode = req.getParameter("itemCode");
        String supplierCode = req.getParameter("supplierCode");
        String orgId = session.getAttribute("orgId").toString();
        String orgCode = session.getAttribute("orgCode").toString();

        qualityDAO.fetchreceivedQty1(req, res, poNo, itemCode, orgId, orgCode, supplierCode);

    }

    @RequestMapping("/quality/MRSubmit1.htm")
    public ModelAndView MRSubmit1(HttpServletRequest req, HttpServletResponse res) throws HibernateException, ParseException, SQLException {

        HttpSession session = req.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String mrNo = req.getParameter("recordNo");
        String mrDate = req.getParameter("mrDate");
        String deptName = req.getParameter("deptName");
        String orgCode = req.getParameter("orgCode");
        String recievedBy = req.getParameter("recievedBy");
        String poNo[] = req.getParameterValues("poNo");
        String projectCode[] = req.getParameterValues("projectCode");
        String itemCode[] = req.getParameterValues("itemCode");
        String invoiceNo[] = req.getParameterValues("invoiceNo");
        String invoiceDate[] = req.getParameterValues("invoiceDate");
        String purchaseType[] = req.getParameterValues("purchaseType");
        String supplierCode[] = req.getParameterValues("supplierCode");
        String supplierName[] = req.getParameterValues("supplierName");
        String shipToLocation[] = req.getParameterValues("shipToLocation");
        String itemSubCategory[] = req.getParameterValues("itemSubCategory");
        String itemName[] = req.getParameterValues("itemName");
        String orderQty[] = req.getParameterValues("orderQty");
        String unitPrice[] = req.getParameterValues("unitPrice");
        String receivedQty[] = req.getParameterValues("receivedQty");
        String recevingQty[] = req.getParameterValues("recevingQty");
        String orderUomConversion[] = req.getParameterValues("orderUomConversion");
        String revingUom[] = req.getParameterValues("revingUom");

        String foc[] = req.getParameterValues("foc");
        //String uom[] = req.getParameterValues("uom");
        String batchNo[] = req.getParameterValues("batchNo");
        String expDate[] = req.getParameterValues("expDate");

        String itemDesc[] = req.getParameterValues("itemDesc");
        String discount[] = req.getParameterValues("discount");
        String itemCategory[] = req.getParameterValues("itemCat");
        String deliveryDate[] = req.getParameterValues("deliveryDate");

        Double foc1 = 0.0;

        String psno[] = req.getParameterValues("snos");

        String rstatus = "";
        ModelMap modelMap = new ModelMap();
        List<ReceivingProcess> mreceipt = new ArrayList<ReceivingProcess>();
        ArrayList validuser = (ArrayList) qualityDAO.mrlist(null, orgId, "1", null);
        Integer orderNo = null;
        int ordno = 1;
        if (!validuser.isEmpty()) {
            for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
                if (iter.next() != null) {
                    Iterator<String> iter2 = validuser.iterator();
                    iter2.hasNext();
                    orderNo = Integer.parseInt(String.valueOf(iter2.next()));

                }
            }
        }
        if (orderNo != null) {
            ordno = orderNo + 1;
        }
        mrNo = "GRN-" + ordno;

        for (int i = 0; i < poNo.length; i++) {

            String revingUom1[] = revingUom[i].split("-");

            Date oreqDate3 = formatter.parse(mrDate);

            //Double x = (Double.parseDouble(recevingQty[i]) + Double.parseDouble(receivedQty[i]));
            Double x = ((Double.parseDouble(recevingQty[i]) / Double.parseDouble(revingUom1[2]) * Double.parseDouble(orderUomConversion[i])) + Double.parseDouble(receivedQty[i]));
            Double y = Double.parseDouble(orderQty[i]);
            Date oreqDate2 = null;

            if ("N/A".equals(batchNo[i])) {
                batchNo[i] = "";
            }
            if (!"N/A".equals(expDate[i])) {
                oreqDate2 = (Date) formatter4.parse(expDate[i]);
            }
            Date oreqDate1 = formatter4.parse(invoiceDate[i]);
            if (foc[i] != null) {
                foc1 = Double.parseDouble(foc[i]);
            }
            Date deliveryDate1 = (Date) formatter.parse(deliveryDate[i]);

            ReceivingProcess receivingProcess = new ReceivingProcess(userId, orgId, orgCode, purchaseType[i], mrNo, oreqDate3,
                    poNo[i], projectCode[i], deptName, userId, supplierCode[i], shipToLocation[i], invoiceNo[i], oreqDate1, itemCategory[i], itemSubCategory[i], itemName[i],
                    itemDesc[i], Double.parseDouble(orderQty[i]), Double.parseDouble(unitPrice[i]),
                    Double.parseDouble(receivedQty[i]), Double.parseDouble(recevingQty[i]), revingUom1[0], batchNo[i], oreqDate2, "update0",
                    sqlTimestamp, "Received", itemCode[i], Double.parseDouble(discount[i]), foc1, deliveryDate1);

            mreceipt.add(receivingProcess);
            if (y > x) {
                rstatus = "Partial Receipt";
            } else if (Double.parseDouble(recevingQty[i]) == 0) {
                rstatus = "Pending";
            } else {
                rstatus = "Fully Receipt";
            }
            Integer sno1 = Integer.valueOf(psno[i]);
            qualityDAO.receiptStatus(poNo[i], itemCode[i], rstatus, sno1);
        }
        qualityDAO.SaveMR(mreceipt);

        modelMap.addAttribute("recordlist", qualityDAO.mrlist(mrNo, orgId, "0", "Received"));
        modelMap.addAttribute("itemlist", qualityDAO.itemlist1(userId, orgId));
        modelMap.addAttribute("supplerDetails", qualityDAO.supplierDetails(null));
        modelMap.addAttribute("poList", qualityDAO.polist(null, orgId, null, "Approved", "Cancelled MR"));
        modelMap.addAttribute("matlist", qualityDAO.mrlistApproved(null, orgId, "Received", null));
        return new ModelAndView("../assets/receiptList", modelMap);
    }

    @RequestMapping("/quality/receiptForm1.htm")
    public ModelAndView receiptForm1(HttpServletRequest req, HttpServletResponse res) throws SQLException {
        String recordNo = req.getParameter("poNo");
        HttpSession session = req.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        ArrayList validuser = (ArrayList) qualityDAO.mrlist(null, orgId, "1", null);
        Integer orderNo = null;
        int ordno = 1;
        if (!validuser.isEmpty()) {
            for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
                if (iter.next() != null) {
                    Iterator<String> iter2 = validuser.iterator();
                    iter2.hasNext();
                    orderNo = Integer.parseInt(String.valueOf(iter2.next()));

                }
            }
        }
        if (orderNo != null) {
            ordno = orderNo + 1;
        }
        modelMap.addAttribute("recordlist", qualityDAO.polist(recordNo, orgId, null, "Approved", "Cancelled MR"));
        modelMap.addAttribute("recordNo", recordNo);
//        modelMap.addAttribute("GEN", "GEN");
//        modelMap.addAttribute("expDate", "31/12/2029");
        modelMap.addAttribute("itemlist", qualityDAO.itemlist1(userId, null));
//        modelMap.addAttribute("supplerDetails", qualityDAO.supplierDetails(null));
        modelMap.addAttribute("ordno", ordno);
        modelMap.addAttribute("mrlist", qualityDAO.mrlist2(recordNo, orgId));
        modelMap.addAttribute("uomCode", qualityDAO.listUom(orgId));
        modelMap.addAttribute("itemstore", qualityDAO.itemlist3(userId, orgId));
//        modelMap.addAttribute("itemSupplier", qualityDAO.itemSupplier1());
//        modelMap.addAttribute("itemSupplier1", qualityDAO.itemSupplierNew(recordNo));
        modelMap.addAttribute("uomList", qualityDAO.uomNew(recordNo));
        return new ModelAndView("../assets/receiptForm1", modelMap);
    }

    @RequestMapping("/quality/MRSubmit.htm")
    public ModelAndView MRSubmit(HttpServletRequest req, HttpServletResponse res) throws HibernateException, ParseException, SQLException {
        String recordNo = req.getParameter("recordNo");
        HttpSession session = req.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String mrNo = req.getParameter("recordNo");
        String mrDate = req.getParameter("mrDate");
        String poNo = req.getParameter("poNo");
        String projectCode = req.getParameter("projectCode");
        String itemCode[] = req.getParameterValues("itemCode");
        String doNo = req.getParameter("doNo");
        String doDate = req.getParameter("doDate");
        String deptName = req.getParameter("deptName");
        String orgCode = req.getParameter("orgCode");
        Date oreqDate1 = formatter4.parse(doDate);
        String oQty[] = req.getParameterValues("oQty");

        String recQty[] = req.getParameterValues("recevingQty");
        String orderUomConversion[] = req.getParameterValues("orderUomConversion");
        String uom1 = req.getParameter("uom");
        String purchaseType = req.getParameter("purchaseType");
        String suppId = req.getParameter("suppId");
        String itemName[] = req.getParameterValues("itemName");
        String itemDesc[] = req.getParameterValues("itemDesc");
        String unitPrice[] = req.getParameterValues("unitPrice");
        String batchNo[] = req.getParameterValues("batchNo");
        String expDate[] = req.getParameterValues("expDate");
        String foc[] = req.getParameterValues("foc");
        String deliveryDate[] = req.getParameterValues("deliveryDate");
//        System.out.print(deliveryDate[i].length());
        Double foc1 = 0.0;

        Date oreqDate3 = formatter.parse(mrDate);
        String psno[] = req.getParameterValues("snos");
        //String uom1=null;
        List<String> list = new ArrayList();
        for (int i = 0; i < psno.length; ++i) {
            list.add(psno[i]);

        }

        String discount[] = req.getParameterValues("discount");
        String itemSubCategory[] = req.getParameterValues("itemSubCategory");
        String itemCategory[] = req.getParameterValues("itemCategory");
        String shipToLocation = req.getParameter("shipToLocation");
        String rstatus = "";
        ModelMap modelMap = new ModelMap();
        List<ReceivingProcess> mreceipt = new ArrayList<ReceivingProcess>();
        java.util.Date newdate = new java.util.Date();
        long t = newdate.getTime();
        java.sql.Timestamp sqlTimestamp1 = new java.sql.Timestamp(t);
        ArrayList validuser = (ArrayList) qualityDAO.mrlist(null, orgId, "1", null);
        Integer orderNo = null;
        int ordno = 1;
        if (!validuser.isEmpty()) {
            for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
                if (iter.next() != null) {
                    Iterator<String> iter2 = validuser.iterator();
                    iter2.hasNext();
                    orderNo = Integer.valueOf(String.valueOf(iter2.next()));

                }
            }
        }
        if (orderNo != null) {
            ordno = orderNo + 1;
        }
        mrNo = "GRN-" + ordno;
        String[] temp;
        String tempSno, tempItemCode, tempItemName, tempDesc, tempCategory, tempSubCategory, tempDiscount, tempOrderQty,
                tempUom, tempUnitPrice, tempReceivedQty, tempReceivingQty, etmpFoc;
        for (int i = 0; i < psno.length; i++) {
            temp = psno[i].split(":");
            tempSno = temp[0];
            tempItemCode = temp[1];
//            String uom1[] = uom[i].split("-");
//            String orderUomConversion1 = orderUomConversion[i];
//            tempItemName=temp[2];
//            tempDesc=temp[3];
//            tempCategory=temp[4];
//            tempSubCategory=temp[5];
//            tempDiscount=temp[6];
//            tempOrderQty=temp[7];
//            tempUom=temp[8];
//            tempUnitPrice=temp[9];
//            tempReceivedQty=temp[10];
//            tempReceivingQty=temp[11];
//            etmpFoc=temp[12];
            Double x = (Double.parseDouble(recQty[i]));
            Double y = Double.parseDouble(oQty[i]);
            Date oreqDate2 = null;
            Date deliveryDate1 = null;
            if (!"".equals(expDate[i]) && expDate[i] != null) {
                oreqDate2 = (Date) formatter4.parse(expDate[i]);
            }
            if (!"".equals(deliveryDate[i]) && deliveryDate[i] != null) {
                deliveryDate1 = (Date) formatter.parse(deliveryDate[i]);
            }
            if (foc != null) {
                foc1 = Double.parseDouble(foc[i]);
            }

            ReceivingProcess receivingProcess = new ReceivingProcess(userId, orgId, orgCode, purchaseType, mrNo, oreqDate3,
                    poNo, projectCode, deptName, userId, suppId, shipToLocation, doNo, oreqDate1, itemCategory[i], itemSubCategory[i], itemName[i],
                    itemDesc[i], Double.parseDouble(oQty[i]), Double.parseDouble(unitPrice[i]),
                    Double.parseDouble("0"), Double.parseDouble(recQty[i]), uom1, batchNo[i], oreqDate2, "update0",
                    sqlTimestamp1, "Received", tempItemCode, Double.parseDouble(discount[i]), foc1, deliveryDate1);

            mreceipt.add(receivingProcess);
            if (y > x) {
                rstatus = "Partial Receipt";
            } else if (Double.parseDouble(recQty[i]) == 0) {
                rstatus = "Pending";
            } else {
                rstatus = "Fully Receipt";
            }
            Integer sno1 = Integer.valueOf(temp[0]);
            qualityDAO.receiptStatus(poNo, tempItemCode, rstatus, sno1);
        }
        qualityDAO.SaveMR(mreceipt);

        modelMap.addAttribute("recordlist", qualityDAO.mrlist(mrNo, orgId, "0", "Received"));
        modelMap.addAttribute("itemlist", qualityDAO.itemlist1(userId, orgId));
        modelMap.addAttribute("supplerDetails", qualityDAO.supplierDetails(null));
        // modelMap.addAttribute("company", userdao.contMasterList(userId, orgId, null));
        modelMap.addAttribute("poList", qualityDAO.polist(null, orgId, null, "Approved", "Cancelled MR"));
        // modelMap.addAttribute("matlist", inventorydao.mrlistApproved(null, orgId, "Inspected"));
        modelMap.addAttribute("matlist", qualityDAO.mrlistApproved(null, orgId, "Received", null));
        return new ModelAndView("../assets/receiptList", modelMap);
    }

    @RequestMapping("/quality/qaInspectionList.htm")
    public ModelAndView qaInspectionList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        HttpSession session = req.getSession();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
//        modelMap.addAttribute("poList", inventorydao.poStatus());
//        modelMap.addAttribute("matlist", inventorydao.mrlistApproved(null, orgId, "Received"));
        modelMap.addAttribute("supplerDetails", qualityDAO.supplierDetails(null));

        return new ModelAndView("../assets/qaInspectionList", modelMap);
    }

    //---------------------------Material Inspection-----------------//
    @RequestMapping("/quality/qaInspectionForm.htm")
    public ModelAndView qaInspectionForm(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        String poNo = req.getParameter("poNo");
        String mrNo = req.getParameter("mrNo");
        //String purchaseOrderNo = req.getParameter("purchaseOrderNo");
        String sno = req.getParameter("sno");
        HttpSession session = req.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        ArrayList validuser = (ArrayList) qualityDAO.inspectList(null, orgId, "1", null);
        String orderNo = null;
        String orderNo1[] = null;
        int ordno = 1;
        if (!validuser.isEmpty()) {
            for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
                orderNo = iter.next();
            }
            orderNo1 = orderNo.split("-");
        }

        if (orderNo != null) {
            ordno = Integer.parseInt(orderNo1[1]) + 1;
        }
        modelMap.addAttribute("recordlist", qualityDAO.mrlistApproved(mrNo, orgId, null, poNo));
        modelMap.addAttribute("purchaseorderno", poNo);
        modelMap.addAttribute("mrNo", mrNo);
        modelMap.addAttribute("ordno", ordno);
        modelMap.addAttribute("user", userId);

        modelMap.addAttribute("list1", qualityDAO.polist(poNo, orgId, null, "Approved", "Cancelled MR"));
        modelMap.addAttribute("inspecttotallist1", qualityDAO.inspecttotallist1());
        modelMap.addAttribute("accQty", qualityDAO.qty(userId, sno));
        modelMap.addAttribute("itemlist", qualityDAO.itemlist1(userId, orgId));
        modelMap.addAttribute("recievedlist", qualityDAO.mrlist1(mrNo, orgId));
        modelMap.addAttribute("supplerDetails", qualityDAO.supplierDetails(null));
        return new ModelAndView("../assets/qaInspectionForm", modelMap);
    }

    @RequestMapping("/quality/qaInspectionFormSubmit.htm")
    public ModelAndView qaInspectionFormSubmit(HttpServletRequest req, HttpServletResponse res) throws SQLException, ParseException {
        String mrNo = req.getParameter("insNo");
        String insDate = req.getParameter("insDate");
        //String purchaseType = req.getParameter("purchaseType");
        String projectCode = req.getParameter("projectCode");
        // String poNo = req.getParameter("poNo");

        String poNo[] = req.getParameterValues("poNo");
        String doNo = req.getParameter("doNo");
        String doDate = req.getParameter("p");
        String receivedBy = req.getParameter("receivedBy");
        //String divisionName[] = req.getParameterValues("divisionName");
        String purchaseType = req.getParameter("purchaseType");

        String itemId[] = req.getParameterValues("itemId");
        String totalacqty[] = req.getParameterValues("totalacqty");
        String totalcapacity[] = req.getParameterValues("totalcapacity");
        String itemCode[] = req.getParameterValues("itemCode");
        String itemDesc[] = req.getParameterValues("itemDesc");
        String itemName[] = req.getParameterValues("itemName");
        String supplierCode = req.getParameter("suppId");
        String recQty[] = req.getParameterValues("recQty");
        String acceptedQty[] = req.getParameterValues("acceptedQty");
        String rejectedQty[] = req.getParameterValues("rejectedQty");
        String orderQty[] = req.getParameterValues("orderQty");
        String discount[] = req.getParameterValues("discount");
        String qtyUom[] = req.getParameterValues("qtyUom");
        String comments[] = req.getParameterValues("comments");
        String psno = req.getParameter("snos");
        Integer sno1 = Integer.valueOf(psno);
        String batchNo[] = req.getParameterValues("batchNo");
        String expiryDate[] = req.getParameterValues("expiryDate");
        String unitprice[] = req.getParameterValues("unitPrice");
        String itemSubCategory[] = req.getParameterValues("itemSubCategory");
        String itemCategory[] = req.getParameterValues("itemCategory");

        //Date oreqDate3 = (Date) formatter2.parse(doDate);
        //String supplierName = req.getParameter("")
        String remarks = req.getParameter("remarks");
        String exp[] = req.getParameterValues("exp");
        String deptName = req.getParameter("deptName");
        String orgCode = req.getParameter("orgCode");
        String shipToLocation = req.getParameter("shipToLocation");
        String exp1 = null;

        HttpSession session = req.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String rstatus = "";
        String foc[] = req.getParameterValues("focQty");
        String deliveryDate[] = req.getParameterValues("deliveryDate");
        Double foc1 = 0.0;
        Date expiryDate1 = null;
        Date oreqDate2 = null;
        List<QualityInspection> gridData = new ArrayList<QualityInspection>();
        qualityDAO.delete(mrNo);

        for (int i = 0; i < itemCode.length; i++) {
            if (exp != null) {
                exp1 = exp[i];

            }

            try {
                expiryDate1 = formatter5.parse(expiryDate[i]);
                oreqDate2 = formatter7.parse(doDate);
            } catch (Exception e) {
                expiryDate1 = null;
            }

            Date oreqDate1 = (Date) formatter.parse(insDate);
            if (foc != null) {
                foc1 = Double.parseDouble(foc[i]);
            }
            Double rejQty = null;
            if (!rejectedQty[i].equals("")) {
                rejQty = Double.parseDouble(rejectedQty[i]);
            }
            Date deliveryDate1 = null;

            if (!"".equals(deliveryDate[i]) && deliveryDate[i] != null) {
                deliveryDate1 = (Date) formatter.parse(deliveryDate[i]);
            }

            QualityInspection qualityInspection = new QualityInspection("", exp1, mrNo, "", itemCategory[i], itemSubCategory[i],
                    supplierCode, shipToLocation, purchaseType, userId, batchNo[i], expiryDate1, orgId, userId, projectCode, mrNo, oreqDate1, poNo[i],
                    doNo, oreqDate2, itemCode[i], itemDesc[i], Double.parseDouble(recQty[i]), Double.parseDouble(acceptedQty[i]),
                    rejQty, qtyUom[i], comments[i], remarks, "update0", sqlTimestamp, "Initial",
                    orgCode, itemName[i], Double.parseDouble(orderQty[i]), Double.parseDouble(unitprice[i]),
                    Double.parseDouble(discount[i]), deptName, foc1, deliveryDate1);
            gridData.add(qualityInspection);
            qualityDAO.saveInspection(gridData);
            qualityDAO.mrStatus(mrNo, itemCode[i], "Inspected");

        }

        ModelMap modelMap = new ModelMap();
        // modelMap.addAttribute("recordlist", inventorydao.polist(poNo[], orgId, null, "Approved", "Cancelled MR"));
        modelMap.addAttribute("recordNo", mrNo);
        modelMap.addAttribute("inspectlist", qualityDAO.inspectlist(mrNo, orgId, "0", "Initial"));
        modelMap.addAttribute("poNo", poNo);
        modelMap.addAttribute("mrlist", qualityDAO.mrlist(mrNo, orgId, "0", null));

        modelMap.addAttribute("success", "true");
        return new ModelAndView("../assets/qaInspectionList", modelMap);

    }

    @RequestMapping("/quality/qualityInspectionAppList.htm")
    public ModelAndView qualityInspectionAppList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {

        HttpSession session = req.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        Object storeName1 = session.getAttribute("storeName");
        String storeName = null;
        if (storeName1 != null) {
            storeName = storeName1.toString();
        }
        ModelMap modelMap = new ModelMap();

        modelMap.addAttribute("polist", qualityDAO.polist(null, orgId, null, "Approved", "Cancelled MR"));
//        modelMap.addAttribute("contRef", purchasedao.contRef(null));
        modelMap.addAttribute("itemlist", qualityDAO.itemlist1(userId, orgId));
        modelMap.addAttribute("inspectlist", qualityDAO.inspectlist1(null, orgId, "0", "Initial", storeName));
        modelMap.addAttribute("rowFetch", qualityDAO.rowmrreceiptcountFetch(req, res));
        return new ModelAndView("../assets/qualityInspectionAppList", modelMap);
    }
    
    //newly added by lakshmi for cancle button 
    @RequestMapping("/quality/inspectlistcancle.htm")
    public ModelAndView inspectlistcancle(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {

        HttpSession session = req.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        Object storeName1 = session.getAttribute("storeName");
        String storeName = null;
        if (storeName1 != null) {
            storeName = storeName1.toString();
        }
        ModelMap modelMap = new ModelMap();

        
        modelMap.addAttribute("polist", qualityDAO.polist(null, orgId, null, "Approved", "Cancelled MR"));
//        modelMap.addAttribute("contRef", purchasedao.contRef(null));
        modelMap.addAttribute("itemlist", qualityDAO.itemlist1(userId, orgId));
        modelMap.addAttribute("inspectlist", qualityDAO.inspectlist1(null, orgId, "0", "Initial", storeName));
        modelMap.addAttribute("rowFetch", qualityDAO.rowmrreceiptcountFetch(req, res));
        return new ModelAndView("../assets/qualityInspectionAppList", modelMap);
    }

    @RequestMapping("/quality/qualityInspectionAppForm.htm")
    public ModelAndView qualityInspectionAppForm(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        String recordNo = req.getParameter("recordNo");
        String poNo = req.getParameter("poNo");
        String mrNo = req.getParameter("mrNo");
        String action = req.getParameter("action");
        HttpSession session = req.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String orgCode = session.getAttribute("orgCode").toString();
        String suppId = req.getParameter("suppId");
//        Object storeName1 = session.getAttribute("storeName");
//        String storeName = null;
//        if (storeName1 != null) {
//            storeName = storeName1.toString();
//        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("recordlist", qualityDAO.polist(poNo, orgId, null, "Approved", "Cancelled MR"));
        modelMap.addAttribute("recordNo", recordNo);
        if (action.equals("view")) {
            modelMap.addAttribute("inspectlist", qualityDAO.inspectlist(mrNo, orgId, "0", "Approved"));

        } else {
            modelMap.addAttribute("inspectlist", qualityDAO.inspectlist(mrNo, orgId, "0", "Initial"));
        }

        List<QualityInspection> qiList = qualityDAO.inspectlist(mrNo, orgId, "0", "Initial");
        LinkedHashSet<String> set = new LinkedHashSet<String>();
        List<String> li = new LinkedList<String>();
        for (Iterator<QualityInspection> iterator = qiList.iterator(); iterator.hasNext();) {
            QualityInspection test = (QualityInspection) iterator.next();
            set.add(test.getPoNo());
        }

        Double totalPrice = 0.0;
        Double lumsum = 0.0;
        Double total = 0.0;
        Double tamount = 0.0;
        Double tlumsum = 0.0;
        Double totalAmount = 0.0;
        for (int i = 0; i < set.size(); i++) {

            totalPrice = 0.0;
            lumsum = 0.0;
            total = 0.0;

            Object s = null;
            for (int j = 0; j < qiList.size(); j++) {
                QualityInspection qi = qiList.get(j);
                totalPrice = qi.getQaAcceptedQty() * qi.getUnitPrice() - (qi.getQaAcceptedQty() * qi.getUnitPrice() * qi.getDiscount()) / 100;
                s = set.toArray()[i];
                if (s.equals(qi.getPoNo())) {
                    List<PurchaseOrder> poList = qualityDAO.polist(s.toString(), orgId, null, "Approved", "Cancelled MR");
                    PurchaseOrder po = poList.get(0);
                    lumsum = po.getLumsumDiscount();
                    if (lumsum == null) {
                        lumsum = 0.0;
                    }
                    total += totalPrice;
                }

            }
            //******* Logic to get TotalAmount and total Lunsum discount***********          
            tamount += total;
            tlumsum += tamount * (lumsum / 100);
            //*********************************************************************           
            li.add(s.toString());
            li.add(total.toString());
            li.add(lumsum.toString());
            li.add("//");

            totalAmount += total - (total * (lumsum / 100));
        }
        //********* Logic to display TotalAmount*******************************       
        //totalAmount = tamount - tlumsum;
        //*********************************************************************        
        String l1 = li.toString().replace("[", "").replace("]", "");

        modelMap.addAttribute("totals", l1);

        modelMap.addAttribute("poNo", poNo);
        modelMap.addAttribute("totalAmount", totalAmount);
        modelMap.addAttribute("store1", qualityDAO.storeMaster(null));
        modelMap.addAttribute("mrlist", qualityDAO.mrlist(mrNo, orgId, "0", null));
        modelMap.addAttribute("itemlist", qualityDAO.itemlist1(userId, orgId));
        modelMap.addAttribute("store", qualityDAO.itemlist2(orgCode, mrNo));
        modelMap.addAttribute("uomList", qualityDAO.uomNew3(mrNo));
        modelMap.addAttribute("itemSupplier", qualityDAO.itemSupplier(suppId));
        modelMap.addAttribute("action", action);
        modelMap.addAttribute("supplerDetails", qualityDAO.supplierDetails(null));
        return new ModelAndView("../assets/qualityInspectionAppForm", modelMap);
    }

    @RequestMapping("/quality/qualityInspectionAppFormSubmit.htm")
    public ModelAndView qualityInspectionAppFormSubmit(HttpServletRequest req, HttpServletResponse res) throws SQLException, ParseException {
        String recordNo = req.getParameter("recordNo");
        String insDate = req.getParameter("insDate");
        String poNo[] = req.getParameterValues("poNo");
        //String mrNo = req.getParameter("mrNo");
        String comments = req.getParameter("comments");
        String projectCode[] = req.getParameterValues("projectCode");
        //String itemId[] = req.getParameterValues("itemId");
        String itemCode[] = req.getParameterValues("itemCode");
        String itemName[] = req.getParameterValues("itemName");
        String itemDesc[] = req.getParameterValues("itemDesc");
        String imUom[] = req.getParameterValues("imUom");
        String imUom1[] = req.getParameterValues("imUom1");
        String imValue[] = req.getParameterValues("imValue");
        String discount[] = req.getParameterValues("discount");
        String imQty[] = req.getParameterValues("acceptedQty");
        String imQty1[] = req.getParameterValues("acceptedQty1");
        String batchNo[] = req.getParameterValues("batchNo");
        String expDate[] = req.getParameterValues("expiryDate");
        String invoiceNo[] = req.getParameterValues("invoiceNo");
        String invoiceDate[] = req.getParameterValues("invoiceDate");
        String divisionName = req.getParameter("divisionName");
        String orderQty[] = req.getParameterValues("orderQty");
        String price[] = req.getParameterValues("price");
        String price1[] = req.getParameterValues("price1");
        String orderValue[] = req.getParameterValues("orderValue");
        String rejQty[] = req.getParameterValues("rejectedQty");
        String rejectedValue[] = req.getParameterValues("rejectedValue");
        String saftyStock = req.getParameter("saftyStock");
        String supplierCode = req.getParameter("suppId");
        String deptName = req.getParameter("deptName");
        String orgCode = req.getParameter("orgCode");
        String clientName = req.getParameter("clientName");
        String itemSubCategory[] = req.getParameterValues("itemSubCategory");
        String itemCategory[] = req.getParameterValues("itemCategory");
        HttpSession session = req.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String purchaseType[] = req.getParameterValues("purchaseType");
        String remarks = req.getParameter("remarks");
        String focQty[] = req.getParameterValues("focQty");
        String focQty2[] = req.getParameterValues("focQty");
        String receivedQty[] = req.getParameterValues("receivedQty");
        String shipToLocation = req.getParameter("shipToLocation");
        String disamount[] = req.getParameterValues("disamount");

        String deliveryLocation[] = req.getParameterValues("deliveryLocation");

        String issueUom[] = req.getParameterValues("issueUom");

        String lumsumDis[] = req.getParameterValues("lumsumDis");
        String deliveryDate[] = req.getParameterValues("deliveryDate");
        ModelMap modelMap = new ModelMap();
        Date insDate1 = null;
        Date expDate1 = null;
        Date invoiceDate1 = null;
        Date deliveryDate1 = null;
        insDate1 = (Date) formatter1.parse(insDate);

        List<GoodsReceiptNote> gridData = new ArrayList<GoodsReceiptNote>();
        List<Inventorylist> gridData1 = new ArrayList<Inventorylist>();
        List<StockLedger> gridData2 = new ArrayList<StockLedger>();

        int m = 1;

        for (int i = 0; i < itemCode.length; i++) {
            //expDate1 = formatter2.parse(expDate[i]);

            Double discount1 = 0.0;
            if (!"".equals(discount) && discount != null) {
                discount1 = Double.parseDouble(discount[i]);
            }

            Double safeStock = 0.0;
            if (!"".equals(saftyStock)) {
                safeStock = Double.parseDouble(saftyStock);
            }
            Double disamount1 = 0.0;
            if (!"".equals(disamount)) {
                disamount1 = Double.parseDouble(disamount[i]);
            }

            invoiceDate1 = formatter.parse(invoiceDate[i]);

            if (!"".equals(expDate[i]) && expDate[i] != null) {
                expDate1 = (Date) formatter6.parse(expDate[i]);
            }

            if (!"".equals(deliveryDate[i]) && deliveryDate[i] != null) {
                deliveryDate1 = (Date) formatter.parse(deliveryDate[i]);
            }
            Double focQty1 = 0.0;
            focQty1 = ((Double.parseDouble(focQty[i])));

//            DateFormat formatter6 = new SimpleDateFormat("dd-MMM-yy hh:mm:ss a");
//            java.util.Date newdate = new java.util.Date();
//            long t = newdate.getTime();
//            java.sql.Timestamp sqlTimestamp1 = new java.sql.Timestamp(t);
//            String sqlTimestamp2 = formatter1.format(sqlTimestamp1);
            qualityDAO.inspectStatus(recordNo, "Approved", remarks, userId);
            GoodsReceiptNote goodsReceiptNote = new GoodsReceiptNote(recordNo, insDate1, orgCode, purchaseType[i],
                    recordNo, insDate1, poNo[i], projectCode[i], deptName, userId, userId, supplierCode, deliveryLocation[i],
                    invoiceNo[i], invoiceDate1, itemCategory[i], itemSubCategory[i], itemName[i], itemDesc[i],
                    imUom1[i],
                    Double.parseDouble(orderQty[i]),
                    Double.parseDouble(price[i]),
                    Double.parseDouble(orderValue[i]), Double.parseDouble(imQty1[i]),
                    Double.parseDouble(imValue[i]), Double.parseDouble(rejQty[i]),
                    Double.parseDouble(rejectedValue[i]), comments, remarks, "update0", sqlTimestamp,
                    userId, orgId, batchNo[i], expDate1, discount1, focQty1, Double.parseDouble(receivedQty[i]),
                    "", itemCode[i], disamount1, deliveryDate1);

            gridData.add(goodsReceiptNote);

            if (!itemCategory[i].equals("Service")) {
                if (!"".equals(batchNo[i])) {
                    ArrayList dupbatch = (ArrayList) qualityDAO.inventlist(itemCode[i], orgCode, batchNo[i], formatter.format(expDate1));
                    String Id = null;
                    Double quan = 0.0;
                    Double nquan = 0.0;

                    if (dupbatch != null) {
                        for (Iterator<Inventorylist> iter = dupbatch.iterator(); iter.hasNext();) {
                            quan = iter.next().getStockQty();
                        }
                        for (Iterator<Inventorylist> iter = dupbatch.iterator(); iter.hasNext();) {
                            Id = iter.next().getItemCode();
                        }
                        for (Iterator<Inventorylist> iter = dupbatch.iterator(); iter.hasNext();) {
                            nquan = iter.next().getTotalValue();
                        }

                    }

                    Double qty = 0.0, totalWeihtedPrice = 0.0, avgPrice = 0.0, newQty = 0.0, newPrice = 0.0, currentTotalQty = 0.0, currentTotalValue = 0.0, finalValue = 0.0;

                    List<Object[]> dupbatch2 = qualityDAO.itemsStorePrice(itemCode[i], orgId, orgCode);

                    for (int j = 0; j < itemCode.length; j++) {

                        if (itemCode[i].equals(itemCode[j])) {
                            if (dupbatch2.size() <= 0) {
                                qty = qty + Double.parseDouble(imQty1[j]);
                                //weightedPrice = weightedPrice + Double.parseDouble(price1[j]);
                                totalWeihtedPrice = (Double.parseDouble(imQty1[j]) * Double.parseDouble(price1[j])) + totalWeihtedPrice;
                                avgPrice = totalWeihtedPrice / qty;

                            } else {
//                                qty = qty + Double.parseDouble(imQty[j]);
//                                //weightedPrice = weightedPrice + Double.parseDouble(price1[j]);
//                                totalWeihtedPrice = (Double.parseDouble(imQty[j]) * Double.parseDouble(price1[j])) + totalWeihtedPrice;
//                                avgPrice = totalWeihtedPrice / qty;
                                for (Object[] su : dupbatch2) {
                                    currentTotalQty = Double.parseDouble(su[1].toString());
                                    currentTotalValue = Double.parseDouble(su[0].toString());
                                }

//                                 currentTotalValue= (newQty * newPrice);
//                                 currentTotalQty = newQty;
//                                 finalValue = currentTotalValue / currentTotalQty;
                                qty = currentTotalQty + Double.parseDouble(imQty1[j]);
                                totalWeihtedPrice = (Double.parseDouble(imQty1[j]) * Double.parseDouble(price1[j])) + currentTotalValue;
                                avgPrice = totalWeihtedPrice / qty;
                            }

                        }
                    }
//                    qualityDAO.updateWeightedAvgPrice(avgPrice, itemCode[i], orgCode, orgId);

                    Double a = ((Double.parseDouble(imQty1[i])) + Double.parseDouble(focQty2[i]));
                    Double totalValue = a * (Double.parseDouble(price1[i]));
                    if (itemCode[i].equals(Id) || Id != null) {

                        qualityDAO.updateinventory(itemCode[i], quan + a, nquan + totalValue, orgCode, batchNo[i], formatter.format(expDate1));
                    } else {

                        Inventorylist inventoryList = new Inventorylist(Double.parseDouble(price1[i]), userId, orgId,
                                orgCode, itemSubCategory[i], itemCode[i], itemName[i], itemDesc[i],
                                imUom1[i], a, batchNo[i], expDate1, "", "update0", sqlTimestamp, projectCode[i],
                                safeStock, totalValue, supplierCode, clientName,
                                "", "", poNo[i], recordNo);

                        gridData1.add(inventoryList);
                        //inventorydao.updateInventoryStatus(itemCode[i], lyr1, lyr2, lyr3, lyr4, lyr5, "Inactive", storageId[i]);

                        //to update in storage capacity table  
                        qualityDAO.saveInventory(gridData1);

                    }

                    String avlitemId2 = null;
                    Double avlqty2 = null;
                    Double amount2 = null;
                    ArrayList dupqty2 = (ArrayList) qualityDAO.fetchStockLedger(itemCode[i], orgCode);

                    if (dupqty2 != null) {
                        for (Iterator<StockLedger> iter = dupqty2.iterator(); iter.hasNext();) {
                            avlitemId2 = iter.next().getItemCode();
                        }
                        for (Iterator<StockLedger> iter = dupqty2.iterator(); iter.hasNext();) {
                            avlqty2 = iter.next().getBalanceQty();
                        }
                        for (Iterator<StockLedger> iter = dupqty2.iterator(); iter.hasNext();) {
                            amount2 = iter.next().getBalnaceAmount();
                        }
                        if (avlqty2 == null) {
                            avlqty2 = 0.0;
                        }
                        Double invtqty = avlqty2 + a;
                        Double totalValue1 = (invtqty * (Double.parseDouble(price[i])));

                        StockLedger stockLedger = new StockLedger(userId, orgId, divisionName, orgCode, itemSubCategory[i], itemCode[i], itemName[i],
                                insDate1, recordNo, recordNo, a, Double.parseDouble(price[i]), totalValue1, "", 0.0, 0.0,
                                0.0, invtqty, totalValue / invtqty, totalValue, "Receipts", imUom[i]);
                        gridData2.add(stockLedger);
                        qualityDAO.saveStock(gridData2);

                    }

                }
            }

        }

        qualityDAO.saveGRN(gridData);

        //modelMap.addAttribute("recordlist", inventorydao.polist(poNo, orgId, null, "Approved", "Cancelled MR"));
        modelMap.addAttribute("recordNo", recordNo);
        modelMap.addAttribute("inspectlist", qualityDAO.inspectlist(recordNo, orgId, "0", null));
        modelMap.addAttribute("poNo", poNo);
        modelMap.addAttribute("itemlist", qualityDAO.itemlist1(userId, orgId));
        modelMap.addAttribute("supplerDetails", qualityDAO.supplierDetails(null));
        modelMap.addAttribute("success", "true");
        modelMap.addAttribute("inspectlist", qualityDAO.inspectlist1(orgId, "Approved", "Accepted"));
        return new ModelAndView("../assets/qualityInspectionAppList", modelMap);

    }

    @RequestMapping("/quality/grnDuplicate.htm")
    //----------------------GRN Duplicate--------------
    public void grnDuplicate(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException {
        res.setContentType("text/html;charset=UTF-8");
        HttpSession session = req.getSession(true);
        //String catCode = req.getParameter("catCode");
        String userId = session.getAttribute("userId").toString();
        String recordNo = req.getParameter("recordNo");
        qualityDAO.grnAvail(req, res, recordNo, userId);

    }

    @RequestMapping("/quality/rejectedQaInspectionList.htm")
    public ModelAndView rejectedQaInspectionList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {

        String recordNo = req.getParameter("recordNo");
        String poNo = req.getParameter("poNo");
        HttpSession session = req.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
//        Object storeName1 = session.getAttribute("storeName");
//        String storeName = null;
//        if (storeName1 != null) {
//            storeName = storeName1.toString();
//        }
        ModelMap modelMap = new ModelMap();

        modelMap.addAttribute("polist", qualityDAO.polist(null, orgId, null, "Approved", null));

        modelMap.addAttribute("itemlist", qualityDAO.itemlist1(userId, orgId));
        modelMap.addAttribute("inspectlist", qualityDAO.inspectrejectlist(orgId, "Approved", "Rejected"));
        modelMap.addAttribute("rowFetch", qualityDAO.rowmrreceiptcountFetch(req, res));

        return new ModelAndView("../assets/rejectedQaInspectionList", modelMap);
    }

    @RequestMapping("/quality/recheckstatus.htm")
    public ModelAndView recheckstatus(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, ParseException {

        HttpSession session = req.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        //String inspectionNo = req.getParameter("inspectionNo");
        String appremarks = req.getParameter("appremarks");
        String materialreceiptNo = req.getParameter("materialreceiptNo");
        String itemId[] = req.getParameterValues("itemCode");
        ModelMap modelMap = new ModelMap();
        qualityDAO.recheckMrStatus(materialreceiptNo, "Received");
        qualityDAO.recheckInsStatus(materialreceiptNo, appremarks, "Recheck");
        modelMap.addAttribute("supplerDetails", qualityDAO.supplierDetails(null));
        modelMap.addAttribute("matlist", qualityDAO.mrlistApproved(null, orgId, "Received", null));
        return new ModelAndView("../assets/qaInspectionList", modelMap);
    }

    @RequestMapping("/quality/reorderpaginationList.htm")
    public void reorderpaginationList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("application/Json");
        PrintWriter out = res.getWriter();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String storeName = req.getParameter("storeName");

        // ---------Json getting the value for each action like search,first,previous,last and show dropdown in front end---------
        String searchData = req.getParameter("sSearch");
        Integer displayLength = Integer.parseInt(req.getParameter("iDisplayLength"));
        Integer sEcho = Integer.parseInt(req.getParameter("sEcho"));
        Integer iDisplayStart = Integer.parseInt(req.getParameter("iDisplayStart"));

        List<Inventorylist> list = null;
        Integer listCount = null;
        Gson gson = new Gson();
        JsonObject jsonResponse = new JsonObject();
        String sCol = req.getParameter("iSortCol_0");
        String sdir = req.getParameter("sSortDir_0");
        String sdir1 = req.getParameter("sColumns");
        String sdir2 = req.getParameter("more_data");
        String sTitle = req.getParameter("iSortTitle_1");

        if (searchData == null || searchData.isEmpty()) {

            if (storeName != null && !storeName.isEmpty()) {
                list = qualityDAO.reorderpaginationList(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, "saftyList1", storeName, sCol);
                listCount = qualityDAO.reorderpaginationCount(userId, orgId, null, searchData, sdir, "saftyList1", storeName, sCol);

            } else {
                list = qualityDAO.reorderpaginationList(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, "saftyList", storeName, sCol);
                listCount = qualityDAO.reorderpaginationCount(userId, orgId, null, searchData, sdir, "saftyList", storeName, sCol);

            }
        } else if (storeName != null && !storeName.isEmpty()) {
            list = qualityDAO.reorderpaginationList(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, "saftyList1", storeName, sCol);
            listCount = qualityDAO.reorderpaginationCount(userId, orgId, null, searchData, sdir, "saftyList1", storeName, sCol);

        } else {
            list = qualityDAO.reorderpaginationList(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, "saftyList", storeName, sCol);
            listCount = qualityDAO.reorderpaginationCount(userId, orgId, null, searchData, sdir, "saftyList", storeName, sCol);

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

    @RequestMapping("/quality/itemCreatFormEdit.htm")
    public ModelAndView itemCreatFormEdit(HttpServletRequest req, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String itemCode = req.getParameter("itemCode");
        String link = "../assets/itemCreatFormEdit.htm";
        String tab = "Re-Order Items";
        modelMap.addAttribute("itemList", masterDAO.list5(itemCode, "ItemMaster"));
        modelMap.addAttribute("itemStore", masterDAO.list5(itemCode, "ItemsStore"));

        modelMap.addAttribute("tab1", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", req.getParameter("action"));

//        ModelMap modelMap = new ModelMap();
//        HttpSession session = req.getSession(true);
//        String userId = session.getAttribute("userId").toString();
//        String orgId = session.getAttribute("orgId").toString();
//        String sno = req.getParameter("pk");
//        String itemCode = req.getParameter("itemCode");
//        String snoitem = req.getParameter("snoitem");
//        if (sno != null && !sno.isEmpty()) {
//            modelMap.addAttribute("itemCreatList", qualityDAO.itemCreaList(sno));
//
//        }
//        modelMap.addAttribute("storelist", qualityDAO.itemStore(itemCode));
//        modelMap.addAttribute("supplierlist", qualityDAO.itemSupplier(itemCode));
//        modelMap.addAttribute("uomlist", qualityDAO.uomList1(userId, orgId));
//        modelMap.addAttribute("uomlist1", qualityDAO.uomList1(userId, orgId));
//        modelMap.addAttribute("sno", sno);
//        modelMap.addAttribute("snoitem", snoitem);
//        modelMap.addAttribute("itemCode", itemCode);
//        modelMap.addAttribute("action", req.getParameter("action"));
//        modelMap.addAttribute("orglist", userDAO.orglist(null));
//        modelMap.addAttribute("maincategoryList", qualityDAO.itemcategList(null));
////        modelMap.addAttribute("subcatList", qualityDAO.itemsubcategList(null));
//        modelMap.addAttribute("itemCreatListEdit", qualityDAO.itemCreaListEdit(itemCode));
        return new ModelAndView("../assets/itemCreatFormEdit", modelMap);
    }

    //--------------------------Re- Order----------------------
    @RequestMapping("/quality/reqForm.htm")
    public ModelAndView reqForm(HttpServletRequest req, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String Sqty[] = req.getParameterValues("sqty");
        String SelectedValues[] = req.getParameterValues("selectedvalues");

        List<String> list = new ArrayList();
        for (int i = 0; i < SelectedValues.length; ++i) {

            list.add(SelectedValues[i]);
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

        modelMap.addAttribute("requisitionNo", reqno);
        modelMap.addAttribute("reqlist", list);
        modelMap.addAttribute("itemlist", qualityDAO.itemlist1(userId, orgId));
        modelMap.addAttribute("itemSubCategory", qualityDAO.itemSubCategory(userId, orgId));
        modelMap.addAttribute("itemlist1", qualityDAO.itemlist4(userId, orgId));
        modelMap.addAttribute("saftyList", qualityDAO.saftyList());
        //modelMap.addAttribute("inventlist1", storeDAO.batchinventList1(userId, orgId));
        modelMap.addAttribute("action", req.getParameter("action"));
        modelMap.addAttribute("inventlist1", qualityDAO.batchinventList1(userId, orgId, null));
        modelMap.addAttribute("store1", qualityDAO.storeMaster(null));
        return new ModelAndView("../assets/reqForm", modelMap);

    }

    @RequestMapping("/quality/ReqFormSubmit.htm")
    public ModelAndView ReqFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, IOException {
        java.util.Date newdate = new java.util.Date();
        long t = newdate.getTime();
        java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(t);
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        DateFormat datetime = new SimpleDateFormat("dd-MMM-yyyy");
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
//        String projectCode[] = request.getParameterValues("projectCode");
//        String subrequisitionNo = request.getParameter("subrequisitionNo");
        String reqNo = request.getParameter("reqNo");
        String requitionDate = request.getParameter("reqDate");

        String itemsubCat[] = request.getParameterValues("itemSubCategory");
        String itemCat[] = request.getParameterValues("itemCategory");
        String itemCode[] = request.getParameterValues("itemId");
        String itemName[] = request.getParameterValues("itemName");
        String itemDesc[] = request.getParameterValues("itemDesc");
        String requisitionQty[] = request.getParameterValues("requisitionQty");
        String requisitionUom[] = request.getParameterValues("requisitionUom");
        String requiredByDate[] = request.getParameterValues("reqBefore");
        String requiredAtLoc = request.getParameter("requiredAtLoc");
        String priority[] = request.getParameterValues("priority");

        String department = request.getParameter("deptName");

        String pk[] = request.getParameterValues("pk");
        String unitPrice[] = request.getParameterValues("unitPrice");

        String division = request.getParameter("division");
        String remarks = request.getParameter("remarks");

        List<PurchaseRequest> gridData = new ArrayList<PurchaseRequest>();
        ArrayList validuser = (ArrayList) purchDAO.autoGenNo(null, "1");
        String quotnoFinal = null;
        String quotNo = null;
        int sno = 1;
        String reqsno = null;

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

        for (int i = 0; i < itemCode.length; i++) {
            reqsno = reqNo + "-" + sno;

            Date reqDate = new Date();

            try {
                if (!"".equals(requitionDate) && requitionDate != null) {
                    reqDate = (Date) formatter.parse(requitionDate);
                }

            } catch (NullPointerException ex) {
            }

            Date rDate = null;
            try {
                if (!"".equals(requiredByDate[i]) && requiredByDate[i] != null) {
                    rDate = (Date) formatter.parse(requiredByDate[i]);
                }
            } catch (NullPointerException ex) {
            }// Do something/nothing if date2 is null

            Double totalPrice = ((Double.parseDouble(requisitionQty[i])) * (Double.parseDouble(unitPrice[i])));
            if ("".equals(unitPrice[i]) || unitPrice[i] == null) {
                unitPrice[i] = "0.0";
            }
            if ("".equals(totalPrice) || totalPrice == null) {
                totalPrice = 0.0;
            }

            PurchaseRequest pr = new PurchaseRequest(userId, orgId, division, "", reqNo, reqDate, "",
                    "", department, requiredAtLoc, itemCat[i], itemsubCat[i], itemName[i], itemDesc[i], rDate, "",
                    Double.parseDouble(requisitionQty[i]), requisitionUom[i], Double.parseDouble(unitPrice[i]), totalPrice,
                    "Reviewed", "update0", sqlTimestamp, itemCode[i], reqsno, remarks, "Reorder");

            gridData.add(pr);
            sno++;
        }
        purchDAO.savedetaillist(gridData);

        modelMap.addAttribute("message", "Data Saved Successfully...");
        modelMap.addAttribute("success", "true");
        return new ModelAndView("../purchRequi/purchaseRequiList", modelMap);

    }

    @RequestMapping("/purchReq/deliveryLocPopUp.htm")
    public ModelAndView deliveryLocPopUp(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
//        modelMap.addAttribute("deliveryLocList", purchreqdao.deliveryLoc());
        modelMap.addAttribute("deliveryLocList", qualityDAO.storeMaster(null));
        return new ModelAndView("../assets/deliveryLocPopUp", modelMap);

    }

    @RequestMapping("/quality/selectInventoryCountPagination.htm")
    public void selectInventoryCountPagination(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("application/Json");
        PrintWriter out = res.getWriter();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        // ---------Json getting the value for each action like search,first,previous,last and show dropdown in front end---------
        String searchData = req.getParameter("sSearch");
        String sCol = req.getParameter("iSortCol_0");
        String sdir = req.getParameter("sSortDir_0");
        String sdir1 = req.getParameter("sColumns");
        String sdir2 = req.getParameter("more_data");
        String sTitle = req.getParameter("iSortTitle_1");

        String prcode = req.getParameter("storeName");

        Integer displayLength = Integer.parseInt(req.getParameter("iDisplayLength"));
        String idcheck = req.getParameter("idcheck");
        String userR = null;
        Integer sEcho = Integer.parseInt(req.getParameter("sEcho"));
        Integer iDisplayStart = Integer.parseInt(req.getParameter("iDisplayStart"));

        List<Inventorylist> reqlist = null;
        BigInteger reqlistCount = null;
        Gson gson = new Gson();
        JsonObject jsonResponse = new JsonObject();
        if (searchData == null || searchData.isEmpty()) {
            reqlist = qualityDAO.inventryCountPagination(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, idcheck, userR, sCol, prcode);
            reqlistCount = qualityDAO.inventryCntPaginationCount(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, idcheck, userR, sCol, prcode);

        } else {
            reqlist = qualityDAO.inventryCountPagination(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, idcheck, userR, sCol, prcode);
            reqlistCount = qualityDAO.inventryCntPaginationCount(userId, orgId, null, searchData, iDisplayStart, displayLength, sdir, idcheck, userR, sCol, prcode);

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
//        System.out.println("jsonResponse" + jsonResponse);

    }

    @RequestMapping("/quality/cancelMR.htm")
    public ModelAndView cancelMR(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String purchaseorderno = req.getParameter("purchaseorderno");

        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sno = req.getParameter("sno");
        String sno1[] = sno.split(",");
        for (int i = 0; i < sno1.length; i++) {
            qualityDAO.matdetailDel1(sno1[i]);
        }
        String SNo = req.getParameter("sno");
        ArrayList validuser = (ArrayList) qualityDAO.mrlist(null, orgId, "1", null);
        Integer orderNo = null;
        int ordno = 1;
        if (!validuser.isEmpty()) {
            for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
                if (iter.next() != null) {
                    Iterator<String> iter2 = validuser.iterator();
                    iter2.hasNext();
                    orderNo = Integer.parseInt(String.valueOf(iter2.next()));

                }
            }
        }
        if (orderNo != null) {
            ordno = orderNo + 1;
        }

        modelMap.addAttribute("ordno", ordno);
        if (SNo != null) {
            modelMap.addAttribute("materialreceiptslist", qualityDAO.polist1(null, orgId));
        }

        List<PurchaseOrder> plist = qualityDAO.polist1(purchaseorderno, orgId);

        if (plist.size() > 0) {

            modelMap.addAttribute("recordlist", plist);
//            System.out.println("" + plist.size());
            modelMap.addAttribute("purchaseorderno", purchaseorderno);
            modelMap.addAttribute("itemstore", qualityDAO.itemlist3(userId, orgId));
            modelMap.addAttribute("itemlist", qualityDAO.itemlist1(userId, null));
            modelMap.addAttribute("itemSupplier", qualityDAO.itemSupplier1());
            modelMap.addAttribute("itemSupplier1", qualityDAO.itemSupplierNew(purchaseorderno));
            modelMap.addAttribute("uomList", qualityDAO.uomNew(purchaseorderno));
//            modelMap.addAttribute("GEN", "GEN");
//            modelMap.addAttribute("expDate", "31/12/2029");

            return new ModelAndView(new RedirectView("receiptForm1.htm?poNo=" + purchaseorderno), modelMap);
        } else {
            modelMap.addAttribute("poList", qualityDAO.poCount());
            modelMap.addAttribute("matlist", qualityDAO.polist1(null, orgId));
            modelMap.addAttribute("itemlist", qualityDAO.itemlist1(userId, null));
            modelMap.addAttribute("itemstore", qualityDAO.itemlist3(userId, orgId));
            modelMap.addAttribute("itemSupplier", qualityDAO.itemSupplier1());
            modelMap.addAttribute("itemSupplier1", qualityDAO.itemSupplierNew(purchaseorderno));
            modelMap.addAttribute("uomList", qualityDAO.uomNew(purchaseorderno));
//            modelMap.addAttribute("GEN", "GEN");
//            modelMap.addAttribute("expDate", "31/12/2029");
            return new ModelAndView("../assets/receiptList", modelMap);

        }

    }

    @RequestMapping("/quality/itemCreatFormSubmit.htm")
    public ModelAndView itemCreatFormSubmit(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        String pk = request.getParameter("pk");

        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String categoryId = request.getParameter("categoryId");
        String itemCategory = request.getParameter("itemCategory");

        String itemCode = request.getParameter("itemCode");
        String itemName = request.getParameter("itemName");
        String itemDesc = request.getParameter("itemDesc");
        String itemUom = request.getParameter("itemUom");
        String issueUom = request.getParameter("issueUom");
        String creationDate = request.getParameter("creationDate");
        String status = request.getParameter("status");

        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        List<ItemMaster> gridData = new ArrayList<ItemMaster>();

        String division = request.getParameter("division");
        String storeName = request.getParameter("storeName");
        String safetyStock = request.getParameter("saftyStock");

        qualityDAO.updateItmstore(itemCode, storeName, safetyStock);

//        }
        ModelMap modelMap = new ModelMap();

        modelMap.addAttribute(
                "itemList", masterDAO.list("", "ItemMaster"));
        return new ModelAndView(
                new RedirectView("../master/itemMasterList.htm"), modelMap);
    }
    
    @RequestMapping("/quality/inventoryAllocationList.htm")
    public ModelAndView inventoryAllocationList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {

        HttpSession session = req.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        Object storeName1 = session.getAttribute("storeName");
        String storeName = null;
        if (storeName1 != null) {
            storeName = storeName1.toString();
        }
        ModelMap modelMap = new ModelMap();

//        modelMap.addAttribute("polist", qualityDAO.polist(null, orgId, null, "Approved", "Cancelled MR"));
////        modelMap.addAttribute("contRef", purchasedao.contRef(null));
//        modelMap.addAttribute("itemlist", qualityDAO.itemlist1(userId, orgId));
//        modelMap.addAttribute("inspectlist", qualityDAO.inspectlist1(null, orgId, "0", "Initial", storeName));
//        modelMap.addAttribute("rowFetch", qualityDAO.rowmrreceiptcountFetch(req, res));
        return new ModelAndView("../assets/inventoryAllocationList", modelMap);
    }
    
    @RequestMapping("/quality/inventoryAllocationForm.htm")
    public ModelAndView inventoryAllocationForm(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {

        HttpSession session = req.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        Object storeName1 = session.getAttribute("storeName");
        String storeName = null;
        if (storeName1 != null) {
            storeName = storeName1.toString();
        }
        ModelMap modelMap = new ModelMap();

//        modelMap.addAttribute("polist", qualityDAO.polist(null, orgId, null, "Approved", "Cancelled MR"));
////        modelMap.addAttribute("contRef", purchasedao.contRef(null));
//        modelMap.addAttribute("itemlist", qualityDAO.itemlist1(userId, orgId));
//        modelMap.addAttribute("inspectlist", qualityDAO.inspectlist1(null, orgId, "0", "Initial", storeName));
//        modelMap.addAttribute("rowFetch", qualityDAO.rowmrreceiptcountFetch(req, res));
         return new ModelAndView("../assets/inventoryAllocationForm", modelMap);
    }
}
