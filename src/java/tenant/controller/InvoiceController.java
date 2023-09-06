/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.controller;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

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
import tenant.classes.GoodsReceiptNote;
import tenant.classes.InvoiceDetails;

import tenant.dao.InvoiceDAO;

/**
 *
 * @author ebs05
 */
@Controller
public class InvoiceController extends MultiActionController {

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
    private InvoiceDAO invoiceDAO;

    @RequestMapping("/invoice/invoiceList.htm")
    public ModelAndView invoiceList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        List<InvoiceDetails> invDetails = invoiceDAO.getInvoiceDetailsForList(orgId);
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("invDetails", invDetails);
        return new ModelAndView("../invoice/invoiceList", modelMap);

    }

    @RequestMapping("/invoice/invoiceForm.htm")
    public ModelAndView invoiceForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        ModelMap modelMap = new ModelMap();
        List<String> supplierDetails = invoiceDAO.getSupplierDetails(orgId);
        modelMap.addAttribute("supplierDetails", supplierDetails);
        return new ModelAndView("../invoice/invoiceForm", modelMap);

    }

    @RequestMapping("/invoice/getGRNDetailsBySupNoAndPONo.htm")
    public void getGRNDetailsBySupNoAndPONo(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String supplierNo = request.getParameter("supplierNo");
        String pono = request.getParameter("pono");
        String[] ponoArr = pono.split("_");
        String qVal = null;
        for (int i = 0; i < ponoArr.length; i++) {
            if (qVal == null) {
                qVal = "g.po_no='" + ponoArr[i] + "'";
            } else {
                qVal = qVal + " or " + "g.po_no='" + ponoArr[i] + "'";
            }
        }

        ModelMap map = new ModelMap();
        invoiceDAO.getGRNDetailsBySupNoAndPONoFromDB(response, orgId, supplierNo, qVal);
    }

    @RequestMapping("/invoice/getGRNDetailsBySupNoAndGRN.htm")
    public void getGRNDetailsBySupNoAndGRN(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String supplierNo = request.getParameter("supplierNo");
        String grn = request.getParameter("grn");
        String grnArr[] = grn.split("_");

        String qVal = null;
        for (int i = 0; i < grnArr.length; i++) {
            if (qVal == null) {
                qVal = "g.good_receipt_no='" + grnArr[i] + "'";
            } else {
                qVal = qVal + " or " + "g.good_receipt_no='" + grnArr[i] + "'";
            }
        }

        ModelMap map = new ModelMap();
        invoiceDAO.getGRNDetailsBySupNoAndGRNFromDB(response, orgId, supplierNo, qVal);
    }

    @RequestMapping("/invoice/getPONo.htm")
    public void getPONo(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String supplierNo = request.getParameter("supplierNo");

        ModelMap map = new ModelMap();
        invoiceDAO.getPONo(response, orgId, supplierNo);
    }

    @RequestMapping("/invoice/getGRNNo.htm")
    public void getGRNNo(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String supplierNo = request.getParameter("supplierNo");

        ModelMap map = new ModelMap();
        invoiceDAO.getGRNNo(response, orgId, supplierNo);
    }

    @RequestMapping("/invoice/getItemDetailsByPO.htm")
    public ModelAndView getItemDetailsByPO(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String pono = request.getParameter("pono");
        String grnno = request.getParameter("grnno");
        String no = request.getParameter("no");
        List<GoodsReceiptNote> grnList = invoiceDAO.getGrnDetails2(orgId, pono, grnno);
        List<GoodsReceiptNote> grnList2 = new ArrayList<GoodsReceiptNote>();
        Iterator<GoodsReceiptNote> it2 = grnList.iterator();
        while (it2.hasNext()) {
            GoodsReceiptNote nextGRN1 = it2.next();
            Double rQtyVal = nextGRN1.getReceivingQty();
            String invoicedQty = invoiceDAO.getGeneratedReceiveForQty(orgId, nextGRN1.getSupplierName(), pono, nextGRN1.getItemName());
            Double rQtyVal1 = 0.0;
            if (invoicedQty == null || invoicedQty == "" || "null".equals(invoicedQty)) {
                rQtyVal1 = rQtyVal;
            } else {
                rQtyVal1 = rQtyVal - Double.parseDouble(invoicedQty);
            }
            nextGRN1.setReceivingQty(rQtyVal1);
            grnList2.add(nextGRN1);

        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("no", no);
        modelMap.addAttribute("grndetails", grnList2);
        modelMap.addAttribute("currency", invoiceDAO.getCurrencyByPO(orgId, pono));
        return new ModelAndView("../invoice/showpodetails", modelMap);

    }

    @RequestMapping("/invoice/getItemDetailsByPOWithGRN.htm")
    public ModelAndView getItemDetailsByPOWithGRN(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String pono = request.getParameter("pono");
        String no = request.getParameter("no");
        String grnno = request.getParameter("grnno");
        String grnNoValForQryArr[] = grnno.split("_");
        String grnNoValForQry = null;
        for (int i = 0; i < grnNoValForQryArr.length; i++) {
            if (grnNoValForQry == null || grnNoValForQry == "") {
                grnNoValForQry = "'" + grnNoValForQryArr[i] + "'";
            } else {
                grnNoValForQry = grnNoValForQry + "," + "'" + grnNoValForQryArr[i] + "'";
            }
        }
        List<GoodsReceiptNote> grnList = invoiceDAO.getGrnDetailsByGRNNo(orgId, pono, grnNoValForQry);
//        List<GoodsReceiptNote> grnList1=new ArrayList<>();
        List<GoodsReceiptNote> grnList2 = new ArrayList<GoodsReceiptNote>();
        Iterator<GoodsReceiptNote> it2 = grnList.iterator();
        while (it2.hasNext()) {
            GoodsReceiptNote nextGRN1 = it2.next();
            String invoicedQty = invoiceDAO.getGeneratedReceiveForQty1(orgId, nextGRN1.getSupplierName(), pono, nextGRN1.getItemName(), nextGRN1.getGoodReceiptNo());
            Double rQtyVal = nextGRN1.getReceivingQty();
            Double rQtyVal1 = 0.0;
            if (invoicedQty == null || invoicedQty == "" || "null".equals(invoicedQty)) {
                rQtyVal1 = rQtyVal;
            } else {
                rQtyVal1 = rQtyVal - Double.parseDouble(invoicedQty);
            }
            nextGRN1.setReceivingQty(rQtyVal1);
            grnList2.add(nextGRN1);

        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("no", no);
        modelMap.addAttribute("grndetails", grnList2);
        modelMap.addAttribute("currency", invoiceDAO.getCurrencyByPO(orgId, pono));
        return new ModelAndView("../invoice/showpodetailswithgrn", modelMap);

    }

    @RequestMapping("/invoice/saveInvoiceDetails.htm")
    public ModelAndView saveInvoiceDetails(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String stype = request.getParameter("stype");
        String selectpo[] = request.getParameterValues("selectpo");
        Calendar cal = Calendar.getInstance();
        String invNo = "" + cal.get(Calendar.YEAR) + "" + cal.get(Calendar.MONTH) + "" + cal.get(Calendar.DAY_OF_MONTH) + "" + cal.get(Calendar.HOUR_OF_DAY) + "" + cal.get(Calendar.MINUTE) + "" + cal.get(Calendar.SECOND) + "" + cal.get(Calendar.MILLISECOND);
        for (int i = 0; i < selectpo.length; i++) {
            String supplierName = request.getParameter("supplierName");
            String hpono = request.getParameter("hpono" + selectpo[i]);
            String doctype = request.getParameter("doctype" + selectpo[i]);
//            String docRef=request.getParameter("docRef"+selectpo[i]);
            String unitp = request.getParameter("unitp" + selectpo[i]);
            String grnq = request.getParameter("grnq" + selectpo[i]);
            String grno = request.getParameter("grno" + selectpo[i]);
            invoiceDAO.saveInvoiceDetails(orgId, supplierName, hpono, doctype, unitp, grnq, stype, grno, invNo);
        }

        ModelMap modelMap = new ModelMap();
        return new ModelAndView("../invoice/invoiceList", modelMap);

    }

    @RequestMapping("/invoice/invoiceview.htm")
    public ModelAndView invoiceview(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String invrefno = request.getParameter("invrefno");
        List<InvoiceDetails> invDetails = invoiceDAO.getInvoiceDetailsByInvRefNo(orgId, invrefno);
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("action", request.getParameter("action"));
        modelMap.addAttribute("invDetails", invDetails);
        modelMap.addAttribute("currency", invoiceDAO.getCurrencyByInvNo(orgId, invrefno));
        modelMap.addAttribute("distinctdetails", invoiceDAO.getInvoiceDetailsDistinct(orgId, invrefno));
        return new ModelAndView("../invoice/invoiceview", modelMap);

    }
}
