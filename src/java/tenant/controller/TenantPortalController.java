/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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
import org.apache.commons.io.IOUtils;

import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.servlet.view.RedirectView;
import tenant.classes.AssetUtilityDetails;
import tenant.classes.PortalTenantDetails;
import tenant.classes.TenantDetails;
import tenant.classes.TenantUtilityDetails;
import tenant.classes.UserRegistration;
import tenant.dao.AssetDAO;

import tenant.dao.ContractDAO;
import tenant.dao.MasterDAO;
import tenant.dao.TenantDetailsDAO;
import tenant.dao.TenantPortalDAO;
import tenant.dao.UserDAO;

/**
 *
 * @author ebs
 */
public class TenantPortalController extends MultiActionController {

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
    private TenantPortalDAO tenantPortalDAO;
    @Autowired
    private TenantDetailsDAO tenantDetailsDAO;
    @Autowired
    private ContractDAO contractDAO;
    @Autowired
    private AssetDAO assetDAO;

//---------------------Tenant Details Start---------------------------------------------//
//**************Tenant Details List******************//
    @RequestMapping("/tenantPortal/tenantDetailList.htm")
    public ModelAndView tenantDetailList(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk1");
        map.addAttribute("tenantDetails", tenantPortalDAO.tenantDetailsList(userId));
        map.addAttribute("tenantDetails1", tenantPortalDAO.tenantDetailsList1(userId));
        map.addAttribute("permission", tenantPortalDAO.permmenu(orgId, roleName, "Tenant Details", "Tenant Details"));
        return new ModelAndView("../tenantPortal/tenantDetailList", map);
    }

    @RequestMapping("/tenantPortal/tenantDetailForm.htm")
    public ModelAndView tenantDetailForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        String pk1 = request.getParameter("pk1");
        String landlordId = request.getParameter("llId");
        String landlordId1 = request.getParameter("llId1");
        String contractPeriod = request.getParameter("contractPeriod");
        String contractPeriod1 = request.getParameter("contractPeriod1");
        String assetName = request.getParameter("assetName");
        String assetName1 = request.getParameter("assetName1");
        String subclassifiedAstno = request.getParameter("subclassifiedAstno");
        String subclassifiedAstno1 = request.getParameter("subclassifiedAstno1");
        List<TenantUtilityDetails> gridData = new ArrayList<TenantUtilityDetails>();
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("tenantDetails", tenantPortalDAO.list(sno, "TenantDetails"));
            modelMap.addAttribute("landLordDetails", tenantPortalDAO.landLordDetailsList(landlordId));
            modelMap.addAttribute("contractNamee", tenantPortalDAO.selectContractCodee(contractPeriod));
            modelMap.addAttribute("assetDetails", tenantPortalDAO.assetDetails(assetName));
            modelMap.addAttribute("subassDetails", tenantPortalDAO.subassDetails(assetName, subclassifiedAstno));
            modelMap.addAttribute("landlordDocuments", masterDAO.landlordDocuments(landlordId));
            modelMap.addAttribute("contDocument", contractDAO.ContractAttachlist(contractPeriod));
            gridData.addAll(assetDAO.tenantUtilityDetailslist(assetName, contractPeriod));
            modelMap.addAttribute("assetDetails1", gridData);
        }
        if (pk1 != null && !pk1.isEmpty()) {
            modelMap.addAttribute("tenantDetails", tenantPortalDAO.list1(pk1, "PortalTenantDetails"));
            modelMap.addAttribute("landLordDetails", tenantPortalDAO.landLordDetailsList(landlordId1));
            modelMap.addAttribute("contractNamee", tenantPortalDAO.selectContractCodee(contractPeriod1));
            modelMap.addAttribute("assetDetails", tenantPortalDAO.assetDetails(assetName1));
            modelMap.addAttribute("subassDetails", tenantPortalDAO.subassDetails(assetName1, subclassifiedAstno1));
            modelMap.addAttribute("landlordDocuments", masterDAO.landlordDocuments(landlordId1));
            modelMap.addAttribute("contDocument", contractDAO.ContractAttachlist(contractPeriod1));
            gridData.addAll(assetDAO.tenantUtilityDetailslist(assetName1, contractPeriod1));
            modelMap.addAttribute("assetDetails1", gridData);
        }
        String link = "../tenantPortal/tenantDetailForm.htm";
        String tab = "Tenant Detail";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("fileSize", userDAO.fileSize());
        modelMap.addAttribute("tenantType", tenantPortalDAO.tenantType());
        modelMap.addAttribute("tenantCategory", tenantPortalDAO.tenantCategory());
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../tenantPortal/tenantDetailForm", modelMap);
    }

    @RequestMapping("/tenantPortal/tenantDetailFormSubmit.htm")
    public ModelAndView tenantDetailFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");
        String pk1 = request.getParameter("pk1");
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
        //String[] waterBillno = request.getParameterValues("waterBillno");
        //String[] electricityBillno = request.getParameterValues("electricityBillno");
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
        String recordstatus1 = "Occupied";
        modelMap.addAttribute("action", request.getParameter("action"));
        String action = request.getParameter("action");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        for (int i = 0; i < tenantFname.length; i++) {

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
            if (pk1 == null || pk1 == "" || pk1.equals("")) {
                byte[] Content1 = null;
                String tenOrgfileName1 = tenantDetailsDAO.getTenOrgfileName11(tenantCode);
                if (tenOrgfileName1.equalsIgnoreCase(tenOrgfileName)) {
                    Content1 = tenantDetailsDAO.getTenantAttachment11(tenantCode);
                    PortalTenantDetails tenant = new PortalTenantDetails(orgId, userId, tenantCode, llCategory[i], llName[i], llId[i], llCrNo[i], llContactno[i], llWorkContactno[i], llMailid[i], null, "", tenantType[i], tenantCategory[i], tenantFname[i], tenantLname[i], tenantCitizenship[i], tenantId[i], tenantCrNo[i], companyAddress[i], postalCode1[i], tenantContactno[i], tenantWorkContactno[i], tenantMailid[i], permanentAddress[i], correspondenceAddress[i], postalCode[i], postboxNo[i], sponcerName[i], sponcerAddress[i], companyName[i], postboxNo1[i], jointeeName1[i], jointeeAddress1[i], jointeeName2[i], jointeeAddress2[i], remarks[i], assetName[i], assetName1[i], subclassifiedAstno[i], flatNo[i], buildingNo[i], wayNo[i], assetArea[i], blockNo[i], plotNo[i], streetNo[i], assetPostalCode[i], assetPostboxNo[i], contractPeriod[i], contractName[i], startsFrom1, endsTo1, null, "", billingCycle[i], advanceAmount[i], dueDate1, totalAmount[i], discountforadvance[i], discountforrent[i], contractSigningDate1, "Direct Tenant", "Submitted", crIdNo[i], extra2[i], roomCode[i], roomName[i], extra5, "Update0", today, today);

                    tenantPortalDAO.globalSave(tenant);
                    tenantDetailsDAO.tenantDetailsApprove121(tenantId[i], tenOrgfileName, Content1);

                } else {

                    MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
                    List<MultipartFile> multipartFile1 = multipartRequest1.getFiles("attachment1");
                    for (Iterator<MultipartFile> iterator = multipartFile1.iterator(); iterator.hasNext();) {
                        MultipartFile test = (MultipartFile) iterator.next();
                        tenOrgfileName = test.getOriginalFilename();
                        PortalTenantDetails tenant = new PortalTenantDetails(orgId, userId, tenantCode, llCategory[i], llName[i], llId[i], llCrNo[i], llContactno[i], llWorkContactno[i], llMailid[i], null, "", tenantType[i], tenantCategory[i], tenantFname[i], tenantLname[i], tenantCitizenship[i], tenantId[i], Content1, tenOrgfileName, tenantCrNo[i], companyAddress[i], postalCode1[i], tenantContactno[i], tenantWorkContactno[i], tenantMailid[i], permanentAddress[i], correspondenceAddress[i], postalCode[i], postboxNo[i], sponcerName[i], sponcerAddress[i], companyName[i], postboxNo1[i], jointeeName1[i], jointeeAddress1[i], jointeeName2[i], jointeeAddress2[i], remarks[i], assetName[i], assetName1[i], subclassifiedAstno[i], flatNo[i], buildingNo[i], wayNo[i], assetArea[i], blockNo[i], plotNo[i], streetNo[i], assetPostalCode[i], assetPostboxNo[i], contractPeriod[i], contractName[i], startsFrom1, endsTo1, null, "", billingCycle[i], advanceAmount[i], dueDate1, totalAmount[i], discountforadvance[i], discountforrent[i], contractSigningDate1, "Direct Tenant", "Submitted", crIdNo[i], extra2[i], roomCode[i], roomName[i], extra5, "Update0", today, today);

                        tenantPortalDAO.globalSave(tenant);
                    }
                }
            } else {
                Date creationDate1 = null;
                if (null != creationDate && !"".equals(creationDate[i])) {
                    creationDate1 = (Date) formatter.parse(creationDate[i]);
                }

                PortalTenantDetails tenant = null;
                MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
                List<MultipartFile> multipartFile1 = multipartRequest1.getFiles("attachment1");
                for (Iterator<MultipartFile> iterator = multipartFile1.iterator(); iterator.hasNext();) {
                    MultipartFile test = (MultipartFile) iterator.next();
                    tenOrgfileName = test.getOriginalFilename();
                    tenant = new PortalTenantDetails(Integer.parseInt(pk1), orgId, userId, tenantCode, llCategory[i], llName[i], llId[i], llCrNo[i], llContactno[i], llWorkContactno[i], llMailid[i], null, "", tenantType[i], tenantCategory[i], tenantFname[i], tenantLname[i], tenantCitizenship[i], tenantId[i], test.getBytes(), tenOrgfileName, tenantCrNo[i], companyAddress[i], postalCode1[i], tenantContactno[i], tenantWorkContactno[i], tenantMailid[i], permanentAddress[i], correspondenceAddress[i], postalCode[i], postboxNo[i], sponcerName[i], sponcerAddress[i], companyName[i], postboxNo1[i], jointeeName1[i], jointeeAddress1[i], jointeeName2[i], jointeeAddress2[i], remarks[i], assetName[i], assetName1[i], subclassifiedAstno[i], flatNo[i], buildingNo[i], wayNo[i], assetArea[i], blockNo[i], plotNo[i], streetNo[i], assetPostalCode[i], assetPostboxNo[i], contractPeriod[i], contractName[i], startsFrom1, endsTo1, null, "", billingCycle[i], advanceAmount[i], dueDate1, totalAmount[i], discountforadvance[i], discountforrent[i], contractSigningDate1, recordstatus[i], "Submitted", crIdNo[i], extra2[i], roomCode[i], roomName[i], extra5, status[i], creationDate1, today, amctenantName[i], startDate1, endDate1, percentage[i], amcamount[i]);
                    tenantPortalDAO.globalSave(tenant);
                }
            }
        }

        modelMap.addAttribute("tenantDetails", tenantPortalDAO.list(pk, "TenantDetails"));
        return new ModelAndView(new RedirectView("../tenantPortal/tenantDetailList.htm"), modelMap);
    }

    @RequestMapping("/tenantPortal/tenantDetailAppList.htm")
    public ModelAndView tenantDetailAppList(HttpServletRequest request, HttpServletResponse response
    ) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Approval 1";
        String submoduleName = "Tenant Portal";
        String sno = request.getParameter("pk");
        map.addAttribute("tenantDetails", tenantPortalDAO.gfcApproved(sno));
        map.addAttribute("permission", tenantPortalDAO.permmenu(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../tenantPortal/tenantDetailAppList", map);
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
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("tenantDetails", tenantPortalDAO.list(sno, "TenantDetails"));
        }
        String link = "../tenant/tenantDetailsForm.htm";
        String tab = "Tenant Details";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("tenantType", tenantPortalDAO.tenantType());
        modelMap.addAttribute("tenantCategory", tenantPortalDAO.tenantCategory());
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
        String tenantCode = request.getParameter("tenantCode");
        String remarks = request.getParameter("reviewerComments");
        String advanceAmount = request.getParameter("advanceAmount");
        String dueDate = request.getParameter("dueDate");
        String totalAmount = request.getParameter("totalAmount");
        String status = "";
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        Date dueDate1 = null;
        if (!dueDate.equals("")) {
            dueDate1 = (Date) formatter.parse(dueDate);
        }
        //tenantPortalDAO.tenantDetailsApprove(sno, "GFC Approved", remarks, advanceAmount, dueDate1, totalAmount);

        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        return new ModelAndView(new RedirectView("tenantDetailsAppList.htm"), modelMap);
    }

    @RequestMapping("/tenantPortal/tenanttAttachDownload.htm")
    public void tenanttAttachDownload(HttpServletRequest req, HttpServletResponse res) throws FileNotFoundException, IOException {
        String sno = req.getParameter("sno");
        PortalTenantDetails doc = tenantPortalDAO.gettenantAttach(Integer.parseInt(sno));
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

}
