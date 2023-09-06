 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
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
import org.dom4j.DocumentException;
import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import tenant.classes.AMCJobs;
import tenant.classes.AMCMaintenance;
import tenant.classes.AMCQualityCheck;
import tenant.classes.BookingCustomerTenacyDetails;
import tenant.classes.BookingPropertyDetails;
import tenant.classes.BookingQuotationDetails;
import tenant.classes.BookingRentDetails;
import tenant.classes.BookingServiceDetails;
//import tenant.classes.BookingTermsConditions;
import tenant.classes.BuildingHistoryManagement;
import tenant.classes.Campaign;
import tenant.classes.CampaignAttachment;
import tenant.classes.Complaints;
import tenant.classes.CustomerFeedback;
import tenant.classes.CustomerTenacyDetails;
import tenant.classes.DailyWorkSheet;
import tenant.classes.FollowUp;
import tenant.classes.GMM;
import tenant.classes.Lead;
import tenant.classes.MinutesOfMeeting;
import tenant.classes.MonthlyWorkSheet;
import tenant.classes.PropertyDetails;
import tenant.classes.QuotationDetails;
import tenant.classes.RentDetails;
import tenant.classes.Rentquote;
import tenant.classes.ServiceDetails;
import tenant.classes.TenantDetails;
import tenant.classes.TermsCondition;
import tenant.classes.UserRegistration;
import tenant.classes.Vacating;
import tenant.dao.AssetDAO;
import tenant.dao.CrmDAO;
import tenant.dao.TenantDetailsDAO;
import tenant.dao.UserDAO;

//import tenant.classes.TermsCondition;
/**
 *
 * @author ebs-sdd27
 */
@Controller
public class CrmController {

    Calendar now = Calendar.getInstance();
    String mod_date = now.get(Calendar.YEAR) + "/" + (now.get(Calendar.MONTH) + 1) + "/" + now.get(Calendar.DATE);
    Date date = new Date(mod_date);

    DateFormat f = new SimpleDateFormat("dd-MM-yyyy");
    DateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
    DateFormat formatter1 = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ssa");
    DateFormat formatter3 = new SimpleDateFormat("dd-MMM-yyyy");
    //DateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
    DateFormat formatter2 = new SimpleDateFormat("MMM-dd-yyyy");
    DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

    java.util.Date newdate = new java.util.Date();
    long t = newdate.getTime();
    java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(t);

    @Autowired
    private CrmDAO crmDAO;
//    @Autowired
//    private SalesDAO salesDAO;
    @Autowired
    private AssetDAO assetDAO;
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private TenantDetailsDAO tenantDetailsDAO;

    //@Autowired
    //private AMCMaintenanceDAO amcMaintenancedao;
    @RequestMapping("/login/login.htm")
    public ModelAndView redirectToLandingPage(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("login");
    }

    @RequestMapping("/login/indexFI.htm")
    public ModelAndView redirectToLandingPageFI(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(true);
        session.invalidate();
        return new ModelAndView("login");
    }

    //-------------------------------     CAMPAIGNS    --------------------------------------------------------    
//...........................   Campaign List ............................................
    @RequestMapping("/CRM/campaignList.htm")
    public ModelAndView campaignList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        ModelMap modelMap = new ModelMap();
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        if (fromDate != null && toDate != null) {
            if (fromDate.contains("frdate") && toDate.contains("todate")) {
                fromDate = null;
                toDate = null;
            }
        }
        modelMap.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Campaign", "Campaign"));
        if (fromDate == null || toDate == null) {

            modelMap.addAttribute("campaignList", crmDAO.campaignList(userId, orgId, null));
        } else {
            modelMap.addAttribute("campaignList", crmDAO.campaignList1(userId, orgId, null,fromDate,toDate));
        }
        return new ModelAndView("campaignList", modelMap);
    }

    //...........................   Campaign Form  ............................................
    @RequestMapping("/CRM/campaignForm.htm")
    public ModelAndView campaignForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();

        String link = "../CRM/campaignForm.htm";
        String tab = "Campaign";
        modelMap.addAttribute("complaintFormData", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("complaintFormData_dropDown_category", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("mediaType", crmDAO.mediaType());

        modelMap.addAttribute("action", request.getParameter("action"));

        return new ModelAndView("campaignForm", modelMap);

    }
//...........................   Campaign Edit  ............................................

    @RequestMapping("/CRM/campaignEdit.htm")
    public ModelAndView campaignEdit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();

        String link = "../CRM/campaignForm.htm";
        String tab = "Campaign";
        modelMap.addAttribute("complaintFormData", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("complaintFormData_dropDown_category", userDAO.formDrodownMapping(link, tab));
        String campaignCode = request.getParameter("campaignCode");
        modelMap.addAttribute("attachment", crmDAO.crmAttachlist(campaignCode));
        List<Campaign> cList = new ArrayList<Campaign>();

        System.out.print("campaignCode" + campaignCode);

        if (!"".equals(campaignCode) && campaignCode != null) {
            cList = crmDAO.campaignList(userId, orgId, campaignCode);

        }

        modelMap.addAttribute("action", request.getParameter("action"));
        modelMap.addAttribute("campaignList", cList);

        return new ModelAndView("campaignEdit", modelMap);

    }

    //...........................   Campaign Edit  ............................................
    @RequestMapping("/CRM/campaignEdit1.htm")
    public ModelAndView campaignEdit1(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();

        String link = "../CRM/campaignForm.htm";
        String tab = "Campaign";
        modelMap.addAttribute("complaintFormData", userDAO.formLabelMapping(link, tab));

        String campaignCode = request.getParameter("campaignCode");
        List<Campaign> cList = new ArrayList<Campaign>();

        System.out.print("campaignCode" + campaignCode);

        if (!"".equals(campaignCode) && campaignCode != null) {
            cList = crmDAO.campaignList(userId, orgId, campaignCode);
        }

        modelMap.addAttribute("action", request.getParameter("action"));
        modelMap.addAttribute("campaignList", cList);
        modelMap.addAttribute("attachment", crmDAO.crmAttachlist(campaignCode));

        return new ModelAndView("campaignEdit1", modelMap);

    }

    //...........................   Campaign Form Submit ............................................
    @RequestMapping("/CRM/CampaignFormSubmit.htm")
    public ModelAndView compaignFormSubmit(HttpServletRequest req, HttpServletResponse res) throws ParseException, IOException, HibernateException, SQLException {

        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        ModelMap modelMap = new ModelMap();
        String pk = req.getParameter("pk");
        String sNo[] = req.getParameterValues("SNO");
        String campaignCode = req.getParameter("campaignCode");
        String campaignName = req.getParameter("campaignName");
        String campaignMedia = req.getParameter("campaignMedia");
        String campaignStatus = req.getParameter("campaignStatus");
        String remarks = req.getParameter("remarks");

        String sDate[] = req.getParameterValues("startDate");
        String eDate[] = req.getParameterValues("endDate");
        String response = req.getParameter("response");
        String eOrganizer = req.getParameter("eventOwner");

        String expectedRevenue = req.getParameter("expectedRevenue");
        String actualRevenue = req.getParameter("actualRevenue");
        String budgetedCost = req.getParameter("budgetedCost");
        String actualCost = req.getParameter("actualCost");
        String roi = req.getParameter("roi");
        String budgetRemain = req.getParameter("budgetRemain");

        String companyName[] = req.getParameterValues("enquirerCompany");
        String companyType[] = req.getParameterValues("enquirerIndustry");
        String companyDetails[] = req.getParameterValues("companyDetails");
        String companyEmail[] = req.getParameterValues("email");
        String companyPhone[] = req.getParameterValues("phone");
        String companyRemarks[] = req.getParameterValues("comremarks");

        String status[] = req.getParameterValues("status");
        String recordStatus[] = req.getParameterValues("recordStatus");
        String deleteRows = req.getParameter("deleteRows");

        String attachmentReference[] = req.getParameterValues("attachmentReference");
        //String attachSno[] = req.getParameterValues("attachSno");
        String attchSNo = req.getParameter("attchSNo");
        String delfiles = req.getParameter("tobedel");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        //String filename = "";

        Date startDate = null;
        Date endDate = null;

        for (int i = 0; i < sDate.length; i++) {
            if (!"".equals(sDate[i]) && sDate[i] != null) {
                startDate = formatter3.parse(sDate[i]);
            }
        }

        for (int i = 0; i < eDate.length; i++) {
            if (!"".equals(eDate[i]) && eDate[i] != null) {
                endDate = formatter3.parse(eDate[i]);
            }
        }

        List<Campaign> gridData = new ArrayList<Campaign>();
        // List<CampaignAttachment> gridattach = new ArrayList<CampaignAttachment>();
        if (campaignCode == null || campaignCode == "" || "".equals(campaignCode)) {
            ArrayList validuser = (ArrayList) crmDAO.getCampainNo(campaignName);
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
            campaignCode = "CAM" + "-" + ordno;
        }

        if (pk == null || pk == "" || pk.equals("")) {
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
            List<MultipartFile> multipartFiles = multipartRequest.getFiles("attachments");
            String documentNames[] = req.getParameterValues("documentname");

            final String dir = System.getProperty("user.dir");
            File f = new File(dir);
            String path = f.getParent();
            f = new File(path);
            path = f.getParent();
            f = new File(path);

            try {
                int j = 0, fileLength = 0;
                String filename;
                String filePath = "";

                List<CampaignAttachment> list = new ArrayList<CampaignAttachment>();
                for (Iterator<MultipartFile> iterator = multipartFiles.iterator(); iterator.hasNext();) {
                    MultipartFile test = (MultipartFile) iterator.next();
                    fileLength = test.getBytes().length;

                    if (fileLength > 0) {
                        CampaignAttachment bdpfFile = new CampaignAttachment();
                        bdpfFile.setFileName(test.getOriginalFilename());

                        bdpfFile.setContent(test.getBytes());

                        bdpfFile.setOrgId(orgId);
                        bdpfFile.setUserId(userId);
                        bdpfFile.setLastmodifiedDate(timestamp);
                        bdpfFile.setCampCode(campaignCode);
                        bdpfFile.setStatus("update0");

                        list.add(bdpfFile);
                    }
                    j++;
                }
                crmDAO.crmAttachSave(list);
                // assetsDAO1.saveAssetAttach(list);

            } catch (Exception e) {
                e.printStackTrace();
            }

            /*MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
             List<MultipartFile> multipartFile = multipartRequest.getFiles("attachmentReference");
             int x = 0;
             for (Iterator<MultipartFile> iterator = multipartFile.iterator(); iterator.hasNext();) {
             MultipartFile test = (MultipartFile) iterator.next();
             if (test.getBytes().length > 0) {
             CampaignAttachment attach = new CampaignAttachment(userId, orgId, campaignCode, test.getOriginalFilename(), test.getBytes(), "update0", newdate);
             gridattach.add(attach);
             x++;
             }
             }*/
            for (int i = 0; i < companyName.length; i++) {
                Campaign c = new Campaign(userId, orgId, campaignCode, campaignName, campaignMedia, campaignStatus, remarks, startDate, endDate, response, eOrganizer,
                        companyName[i], companyType[i], companyDetails[i], companyEmail[i], companyPhone[i], companyRemarks[i], expectedRevenue, actualRevenue, budgetedCost, actualCost, roi, budgetRemain, "Record Created",
                        null, null, null, null, null, newdate, "update0", newdate);
                crmDAO.globalSave(c);
                //crmDAO.campaignDocSave(gridattach);

            }
        } else {
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
            List<MultipartFile> multipartFiles = multipartRequest.getFiles("attachments");
            String documentNames[] = req.getParameterValues("documentname");

            final String dir = System.getProperty("user.dir");
            File f = new File(dir);
            String path = f.getParent();
            f = new File(path);
            path = f.getParent();
            f = new File(path);

            try {
                int j = 0, fileLength = 0;
                String filename;
                String filePath = "";

                List<CampaignAttachment> list = new ArrayList<CampaignAttachment>();
                for (Iterator<MultipartFile> iterator = multipartFiles.iterator(); iterator.hasNext();) {
                    MultipartFile test = (MultipartFile) iterator.next();
                    fileLength = test.getBytes().length;

                    if (fileLength > 0) {
                        CampaignAttachment bdpfFile = new CampaignAttachment();
                        bdpfFile.setFileName(test.getOriginalFilename());

                        bdpfFile.setContent(test.getBytes());

                        bdpfFile.setOrgId(orgId);
                        bdpfFile.setUserId(userId);
                        bdpfFile.setLastmodifiedDate(timestamp);
                        bdpfFile.setCampCode(campaignCode);
                        bdpfFile.setStatus("update0");

                        list.add(bdpfFile);
                    }
                    j++;
                }
                crmDAO.crmAttachSave(list);
                // assetsDAO1.saveAssetAttach(list);

            } catch (Exception e) {
                e.printStackTrace();
            }
            if (!delfiles.equals("")) {
                String[] totalfiles = delfiles.split(",");
                for (int m = 0; m < totalfiles.length; m++) {

                    CampaignAttachment doc = crmDAO.getattchs(Integer.parseInt(totalfiles[m]));
                    //assetsDAO1.delete(doc.getAttachName(), doc.getAssetAttach());

                    crmDAO.delattachfiles("CampaignAttachment", "SNO", Integer.parseInt(totalfiles[m]));
                }
            }
            //            for attachment
            /*String attachSno[] = req.getParameterValues("attachSno");
             String attachSnoFull[] = req.getParameterValues("attachSnoFull");
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
             crmDAO.CamAttachDelete(Integer.parseInt(nA));
             } catch (Exception e) {
             e.printStackTrace();
             }
             }
             } else {
             if (attachSno == null && attachSnoFull != null) {
             try {
             crmDAO.CamAttachDelete(Integer.parseInt(attachSnoFull[0]));
             } catch (Exception e) {
             e.printStackTrace();
             }
             }
             }

             MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
             List<MultipartFile> multipartFile = multipartRequest.getFiles("attachmentReference");
             int x = 0;
             for (Iterator<MultipartFile> iterator = multipartFile.iterator(); iterator.hasNext();) {
             MultipartFile test = (MultipartFile) iterator.next();
             if (test.getBytes().length > 0) {
             CampaignAttachment attach = new CampaignAttachment(userId, orgId, campaignCode, test.getOriginalFilename(), test.getBytes(), "update0", newdate);

             gridattach.add(attach);
             x++;
             }
             }*/

            for (int i = 0; i < companyName.length; i++) {

//                if (sNo[i] == null || "".equals(sNo[i])) {
                int k = Integer.parseInt(status[i].substring(status[i].length() - 1));
                k++;
                status[i] = "update" + k;

                Campaign c = new Campaign(Integer.parseInt(pk), userId, orgId, campaignCode, campaignName, campaignMedia, campaignStatus, remarks, startDate, endDate, response, eOrganizer,
                        companyName[i], companyType[i], companyDetails[i], companyEmail[i], companyPhone[i], companyRemarks[i], expectedRevenue, actualRevenue, budgetedCost, actualCost, roi, budgetRemain, recordStatus[i],
                        null, null, null, null, null, newdate, status[i], newdate);

                //gridData.add(c);
                crmDAO.globalSave(c);
//                crmDAO.campaignDocSave(gridattach);
//                }

            }

        }

        modelMap.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Campaign", "Campaign"));
        modelMap.addAttribute("campaignList", crmDAO.campaignList(userId, orgId, null));
        //return new ModelAndView("campaignList", modelMap);
        return new ModelAndView(new RedirectView("../CRM/campaignList.htm"), modelMap);

    }

    //...........................   Campaign Attachments  ............................................
    @RequestMapping("/CRM/campaignMultiAttachment.htm")
    public ModelAndView contractDocumentsForm(HttpServletRequest request, HttpServletResponse response
    ) {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();

        ModelMap modelMap = new ModelMap();

        String campaignCode = request.getParameter("campaignCode");

        if (!"".equals(campaignCode) || campaignCode != null) {
            modelMap.addAttribute("camAttachmentList", crmDAO.CampaignAttachmentList(campaignCode));
        }
        modelMap.addAttribute("fileSize", userDAO.fileSize());
        modelMap.addAttribute("action", request.getParameter("action"));

        // System.out.print("Action*********"+ request.getParameter("action"));
        return new ModelAndView("../CRM/campaignMultiAttachment", modelMap);

    }

    //...........................   Campaign Attachment Download  ............................................
    @RequestMapping("/CRM/camAttachDownload.htm")
    public void campaignAttachDownload(HttpServletRequest req, HttpServletResponse res) throws FileNotFoundException, IOException {
        String sno = req.getParameter("sno");

        CampaignAttachment doc = crmDAO.getCAMAttach(Integer.parseInt(sno));
        try {
            res.setHeader("Content-Disposition", "inline;filename=\"" + doc.getFileName() + "\"");
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

    //........................... Closed  Campaign List  ............................................
    @RequestMapping("/CRM/closedCampaignList.htm")
    public ModelAndView closedCampaignList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("clossedCampaignList", crmDAO.clossedCampaignList(userId, orgId));

        return new ModelAndView("closedCampaignList", modelMap);
    }

    //...........................   Lead Management Form  ............................................
    @RequestMapping("/CRM/LeadManagementFormNew1.htm")
    public ModelAndView LeadManagementFormNew1(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sNo");

        modelMap.addAttribute("campaignList", crmDAO.campaignList1(userId, orgId, Integer.parseInt(SNo)));

        String link = "../Lead/LeadManagementFormNew.htm";
        String tab = "Lead Management";
        modelMap.addAttribute("LeadFormData", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("LeadFormData_dropDown_category", userDAO.formDrodownMapping(link, tab));
        System.out.print("LeadManagementFormNew1***************");

        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));

        return new ModelAndView("LeadManagementFormNew1", modelMap);

    }

    //...........................   Lead Form Submit ............................................
    @RequestMapping("/CRM/leadFormSubmit1.htm")
    public ModelAndView leadFormSubmit1(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, IOException, MessagingException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();

        String leadCode = request.getParameter("leadCode");
        String leadName = request.getParameter("leadName");
        String leadType = request.getParameter("leadType");
        String industry = request.getParameter("industry");
        String contacts = request.getParameter("contacts");
        String leadaddressPermanent = request.getParameter("leadaddressPermanent");
        String remarks = request.getParameter("remarks");
        String leadSource = request.getParameter("leadSource");
        String others = request.getParameter("others");

        String salutation[] = request.getParameterValues("salutation");
        String firstName[] = request.getParameterValues("firstName1");
        String lastName[] = request.getParameterValues("lastName1");
        String designation[] = request.getParameterValues("designation1");
        String email[] = request.getParameterValues("email1");
        String mobile[] = request.getParameterValues("mobile1");
        String dob[] = request.getParameterValues("dob");
        String postbxno[] = request.getParameterValues("postbxno");
        String pincode[] = request.getParameterValues("pincode");
        String city[] = request.getParameterValues("city");
        String country[] = request.getParameterValues("country");
        String addressDifferent[] = request.getParameterValues("addressDifferent");
        String assetCode[] = request.getParameterValues("assetCode1");
        String assetName[] = request.getParameterValues("assetName1");
        String assetPlotCode[] = request.getParameterValues("assetPlotCode1");
        String assetPlotNo[] = request.getParameterValues("assetPlotNo1");
        String followUp[] = request.getParameterValues("followUp1");
        String folowUpHistory[] = request.getParameterValues("folowUpHistory");

        String recordStatus = "Lead Generated";

        String serialNum = request.getParameter("serialNum");

        String UploadMedicalRepName[] = request.getParameterValues("UploadMedicalRepName");
        String leaFileName = request.getParameter("leaFileName");

        String sno[] = request.getParameterValues("sno");
        String status = request.getParameter("status");
        String dt[] = request.getParameterValues("lastmodifiedDate");
        //====For Delete Row
        String deleteRows = request.getParameter("deleteRows");
        //=====
        String originalImg = null;
        Date dob1 = null;
        Date followUp1 = null;

        List<Lead> gridData = new ArrayList<Lead>();
        if (leadCode.isEmpty()) {
            ArrayList validuser = (ArrayList) crmDAO.leadCodeCheck(leadName);
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

//                termCode = "TEMS000" + "-" + ordno;
            leadCode = "LEAD" + "-" + ordno;
        }
        if (sno == null) {
            for (int i = 0; i < firstName.length; i++) {

                try {
                    if (!"".equals(dob[i]) && dob[i] != null) {
                        dob1 = (Date) formatter3.parse(dob[i]);
                    }
                } catch (NullPointerException ex) {
                    // Do something/nothing if date2 is null
                }
                try {
                    if (!"".equals(followUp[i]) && followUp[i] != null) {
                        followUp1 = (Date) formatter3.parse(followUp[i]);
                    }
                } catch (NullPointerException ex) {
                    // Do something/nothing if date2 is null
                }
//                dob1[i] = formatter3.parse(dob[i]);
//                followUp1[i] = formatter3.parse(followUp[i]);
                MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
                MultipartFile multipartFile1 = multipartRequest1.getFile("UploadMedicalRepName");
//                for (Iterator<MultipartFile> iterator = multipartFile1.iterator(); iterator.hasNext();) {
//                    MultipartFile test = (MultipartFile) iterator.next();
                leaFileName = multipartFile1.getOriginalFilename();

                Lead lm = new Lead(userId, orgId, leadCode, leadName, leadType, industry, contacts, leadaddressPermanent, remarks, salutation[i], firstName[i], lastName[i], designation[i], email[i], mobile[i], country[i], city[i], postbxno[i], pincode[i], dob1, addressDifferent[i], assetCode[i], assetName[i], assetPlotCode[i], assetPlotNo[i], followUp1, folowUpHistory[i], recordStatus, "From Campaign", multipartFile1.getBytes(), leaFileName, leadSource, others, "null", "null", "null", "update0", newdate);
                gridData.add(lm);
                crmDAO.leadsave1(gridData);
                modelMap.addAttribute("success", "true");

            }
        } else {

            for (int i = 0; i < firstName.length; i++) {

                if (sno[i] == null || sno[i].isEmpty()) {
                    try {
                        if (!"".equals(dob[i]) && dob[i] != null) {
                            dob1 = (Date) formatter3.parse(dob[i]);
                        }
                    } catch (NullPointerException ex) {
                        // Do something/nothing if date2 is null
                    }
                    try {
                        if (!"".equals(followUp[i]) && followUp[i] != null) {
                            followUp1 = (Date) formatter3.parse(followUp[i]);
                        }
                    } catch (NullPointerException ex) {
                        // Do something/nothing if date2 is null
                    }
                    MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
                    MultipartFile multipartFile1 = multipartRequest1.getFile("UploadMedicalRepName");
//                for (Iterator<MultipartFile> iterator = multipartFile1.iterator(); iterator.hasNext();) {
//                    MultipartFile test = (MultipartFile) iterator.next();
                    leaFileName = multipartFile1.getOriginalFilename();

                    Lead lm = new Lead(userId, orgId, leadCode, leadName, leadType, industry, contacts, leadaddressPermanent, remarks, salutation[i], firstName[i], lastName[i], designation[i], email[i], mobile[i], country[i], city[i], postbxno[i], pincode[i], dob1, addressDifferent[i], assetCode[i], assetName[i], assetPlotCode[i], assetPlotNo[i], followUp1, folowUpHistory[i], recordStatus, "From Campaign", multipartFile1.getBytes(), leaFileName, leadSource, others, "null", "null", "null", status, newdate);
                    gridData.add(lm);
                    crmDAO.leadsave1(gridData);
                    modelMap.addAttribute("success", "true");

                } else {
                    int k = Integer.parseInt(status.substring(status.length() - 1));
                    k++;
                    status = "Update" + k;
                    try {
                        if (!"".equals(dob[i]) && dob[i] != null) {
                            dob1 = (Date) formatter3.parse(dob[i]);
                        }
                    } catch (NullPointerException ex) {
                        // Do something/nothing if date2 is null
                    }
                    try {
                        if (!"".equals(followUp[i]) && followUp[i] != null) {
                            followUp1 = (Date) formatter3.parse(followUp[i]);
                        }
                    } catch (NullPointerException ex) {
                        // Do something/nothing if date2 is null
                    }
                    MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
                    MultipartFile multipartFile1 = multipartRequest1.getFile("UploadMedicalRepName");
//                for (Iterator<MultipartFile> iterator = multipartFile1.iterator(); iterator.hasNext();) {
//                    MultipartFile test = (MultipartFile) iterator.next();
                    leaFileName = multipartFile1.getOriginalFilename();
                    byte[] test1 = null;
                    if (leaFileName == null || leaFileName == "") {
                        leaFileName = crmDAO.getFilename(leadCode);
                        test1 = crmDAO.getContentAttach(leadCode);
                        Lead lm = new Lead(Integer.parseInt(sno[i]), userId, orgId, leadCode, leadName, leadType, industry, contacts, leadaddressPermanent, remarks, salutation[i], firstName[i], lastName[i], designation[i], email[i], mobile[i], country[i], city[i], postbxno[i], pincode[i], dob1, addressDifferent[i], assetCode[i], assetName[i], assetPlotCode[i], assetPlotNo[i], followUp1, folowUpHistory[i], recordStatus, "From Campaign", test1, leaFileName, leadSource, others, "null", "null", "null", "update0", newdate);
                        crmDAO.LeadSave(lm);
                    } else {
                        Lead lm = new Lead(Integer.parseInt(sno[i]), userId, orgId, leadCode, leadName, leadType, industry, contacts, leadaddressPermanent, remarks, salutation[i], firstName[i], lastName[i], designation[i], email[i], mobile[i], country[i], city[i], postbxno[i], pincode[i], dob1, addressDifferent[i], assetCode[i], assetName[i], assetPlotCode[i], assetPlotNo[i], followUp1, folowUpHistory[i], recordStatus, "From Campaign", multipartFile1.getBytes(), leaFileName, leadSource, others, "null", "null", "null", "update0", newdate);
                        crmDAO.LeadSave(lm);
                        modelMap.addAttribute("success", "test");

                    }

//                            }
                }
//                   
            }
            if (deleteRows.trim().length() != 0) {
                String out[] = deleteRows.split("//");
                for (int j = 0; j < out.length; j++) {
                    crmDAO.leadGridDataDelete(Integer.parseInt(out[j]));
                }
            }

        }
        //For Delete Row From Grid

        crmDAO.campaignUpdate(Integer.parseInt(serialNum));

        modelMap.addAttribute("success", "true");

        modelMap.addAttribute("campaignList", crmDAO.campaignList(userId, orgId, null));
        return new ModelAndView("campaignList", modelMap);

    }

    //...........................   Validating Mobile No.  ............................................
    @RequestMapping("/CRM/mobileCheck.htm")
    public void mobileCheck(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException {
        String phoneNo = request.getParameter("phoneNo");

        crmDAO.phoneCheck(request, response, phoneNo);
    }

    //...........................   Validating Contact No.  ............................................
    @RequestMapping("/Lead/contactCheck.htm")
    public void contactCheck(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException {
        String phoneNo = request.getParameter("phoneNo");

        crmDAO.contactCheck(request, response, phoneNo);
    }

    //...........................   Validating Email Id  ............................................
    @RequestMapping("/CRM/emailCheck.htm")
    public void emailCheck(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException {
        String emailId = request.getParameter("emailId");

        crmDAO.emailCheck(request, response, emailId);
    }

    //-------------------------------     CUSTOMER COMPLAINTS    --------------------------------------------------------    
//.................................    Complaints List    ....................................................
    @RequestMapping("/CRM/complaintList.htm")
    public ModelAndView complaintList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        modelMap.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Complaints", "Complaints"));
        //modelMap.addAttribute("complaintList", crmDAO.list(SNo, "Complaints"));
        modelMap.addAttribute("complaintList", crmDAO.list(SNo, "Complaints"));
        modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
        modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(null));
//        modelMap.addAttribute("complaintList", crmDAO.complaintList(userId, orgId, null));
        return new ModelAndView("complaintList", modelMap);
    }

    //...........................   Customer Complaint Form ............................................
    @RequestMapping("/CRM/complaintForm.htm")
    public ModelAndView complaintForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");

        if (SNo != null) {
            String complaintNo2 = request.getParameter("complaintNo");
            modelMap.addAttribute("complaintList", crmDAO.list(SNo, "Complaints"));
        }
        String link = "../CRM/complaintForm.htm";
        String tab = "Complaints";
        
        ArrayList enq = (ArrayList)crmDAO.complaintsCodeinc(userId, orgId, null, null, "1");
        
        String orderNo=null;
        String orderNo2 = null;
        String[] orderNo1 = null;
        int ordno = 1;
        if (!(enq.isEmpty())) {
            for (Iterator<Complaints> iter = enq.iterator(); iter.hasNext();) {
                orderNo = iter.next().getComplaintCode();
            }
            //orderNo1 = orderNo2.split("-");
        }
        if (orderNo != null) {
            orderNo1 = orderNo.split("-");
            ordno = Integer.parseInt(orderNo1[1]) + 1;
        }
        orderNo = "Complaint" + "-" + ordno;
        
        modelMap.addAttribute("complaintFormData", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("complaintType", assetDAO.complaintType());
        modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
        modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(null));
        modelMap.addAttribute("orderNo", orderNo);
        modelMap.addAttribute("SNo", SNo);

        modelMap.addAttribute("action", request.getParameter("action"));

        return new ModelAndView("complaintForm", modelMap);

    }
    
    @RequestMapping("/CRM/selectProperty.htm")
    public ModelAndView selectEmpList(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String userRole = session.getAttribute("userRole").toString();
        String orgId = session.getAttribute("orgId").toString();
        
        String department = req.getParameter("department");
        String designation = req.getParameter("designation");
     
//         if (!department.isEmpty()) {
             
             modelMap.addAttribute("propertDetailsList", crmDAO.gmmList(userId, orgId, null, userRole));
//         } else{
             
//             modelMap.addAttribute("propertDetailsList", crmDAO.gmmList(userId, orgId, null, userRole));
//         }
       
        
        return new ModelAndView("../CRM/SelectProperty", modelMap);
    }

    //...........................   Customer Complaint Form ............................................
    @RequestMapping("/CRM/complaintviewForm.htm")
    public ModelAndView complaintviewForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");

        if (SNo != null) {
            String complaintNo2 = request.getParameter("complaintNo");
            modelMap.addAttribute("complaintList", crmDAO.list(SNo, "Complaints"));
        }
        String link = "../CRM/complaintForm.htm";
        String tab = "Complaints";
        modelMap.addAttribute("complaintFormData", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
        modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(null));
        modelMap.addAttribute("SNo", SNo);

        modelMap.addAttribute("action", request.getParameter("action"));

        return new ModelAndView("complaintviewForm", modelMap);

    }

    //...........................   Customer Complaint Rejected View Form ............................................
    @RequestMapping("/CRM/complaintrejectviewForm.htm")
    public ModelAndView complaintrejectviewForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");

        if (SNo != null) {
            String complaintNo2 = request.getParameter("complaintNo");
            modelMap.addAttribute("complaintList", crmDAO.list(SNo, "Complaints"));
        }
        String link = "../CRM/complaintForm.htm";
        String tab = "Complaints";
        modelMap.addAttribute("complaintFormData", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
        modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(null));
        modelMap.addAttribute("SNo", SNo);

        modelMap.addAttribute("action", request.getParameter("action"));

        return new ModelAndView("complaintrejectviewForm", modelMap);

    }

    //===========================Tenant Details for Complaint===============
    @RequestMapping("/CRM/tenantDetailsForComplaint.htm")
    public ModelAndView tenantDetailsForComplaint(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("tenantDetailsForComplaint", crmDAO.tenantDetailsForCustomerFeedback());
        modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
        modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(null));
        return new ModelAndView("tenantDetailsForComplaint", modelMap);
    }

    //.............................  Customer Complaint Form Submit Method  ....................................
    @RequestMapping("/CRM/complaintFormSubmit.htm")
    public ModelAndView complaintFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, IOException, MessagingException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();

        String complaintCode = request.getParameter("complaintCode");
        String tenantName = request.getParameter("tenantName");
        String propertyName = request.getParameter("propertyName");
        String assetName1 = request.getParameter("assetName1");
        String subAssetName1 = request.getParameter("subAssetName1");
        String propertyNo = request.getParameter("propertyNo");
        String date = request.getParameter("date");
        String remarks = request.getParameter("remarks");
        String compensation = request.getParameter("compensation");

        String sno = request.getParameter("sno");
        String status = request.getParameter("status");
        String dt = request.getParameter("lastmodifiedDate");
        String complaintType = request.getParameter("complaintType");

        String recordstatus = "Complaint Created";
        List<Complaints> gridData = new ArrayList<Complaints>();
        if (complaintCode.isEmpty()) {
            ArrayList validuser = (ArrayList) crmDAO.complaintCodeCheck(tenantName);
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

            complaintCode = "COMPLT" + "-" + ordno;
        }
        if (sno == null) {

            Date Date1 = null;
            try {
                if (!"".equals(date) && date != null) {
                    Date1 = (Date) formatter3.parse(date);
                }
            } catch (NullPointerException ex) {
            }

            Complaints complt = new Complaints(userId, orgId, complaintCode, tenantName, propertyName, propertyNo, Date1, remarks, compensation, recordstatus, "null", "null", "null", "null", "null", newdate, "update0", newdate, complaintType);

            crmDAO.globalSave(complt);
            modelMap.addAttribute("success", "true");
        } else {

            int k = Integer.parseInt(status.substring(status.length() - 1));
            k++;
            status = "update" + k;
            Date Date1 = null;
            try {
                if (!"".equals(date) && date != null) {
                    Date1 = (Date) formatter3.parse(date);
                }
            } catch (NullPointerException ex) {
            }

            Complaints complt = new Complaints(Integer.parseInt(sno), userId, orgId, complaintCode, tenantName, propertyName, propertyNo, Date1, remarks, compensation, recordstatus, "null", "null", "null", "null", "null", newdate, status, newdate, complaintType);
            crmDAO.globalSave(complt);
            modelMap.addAttribute("success", "test");
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
//                List<Complaints> td = crmDAO.tdList(userId, orgId, complaintCode);
//                StringBuilder emailId = new StringBuilder(email);
//                if (td.size() > 0) {
//                    int i = 1;
//                    for (Complaints tdlist : td) {
//
//                        tenantName = tenantName;
//                        propertyName = assetName1;
//                        subAssetName1 = subAssetName1;
//                    }
//                    emailId.append(",");
//                    emailId.append(toEmail);
//                    String[] sendEmail = emailId.toString().split(",");
//                    subject = "Complaint Code: " + complaintCode;
//                    String filepath = request.getSession().getServletContext().getRealPath("common\\theme\\images\\logo1.png");
//                    mailbody = "<html><body>Dear Sir/Madam,<br/><br/><br/>You need to give an approval for Complaint. Tenant Name : " + tenantName + ", Property Name : " + propertyName + ", Flat Name : " + subAssetName1 + " " + ","
//                            + " Please Approve this Complaint. <br/><br/>If approved ignore this mail. "
//                            + "</body>"
//                            + "<br/><br/>Thanks & Regards"
//                            + "<br/>Al-Hashar Team.</html>";
//                    ByteArrayOutputStream baos = new ByteArrayOutputStream();
//                    baos.close();
//                    cm.sendEmail(userEmail, password, sendEmail, subject, mailbody, baos, fileName);
//                }
//            }
//        }
        modelMap.addAttribute("complaintList", tenantDetailsDAO.list(sno, "Complaints"));
        modelMap.addAttribute("success", "true");

        return new ModelAndView(new RedirectView("complaintList.htm"), modelMap);

    }

    //.................................  Approval Process Of Complaint List    ....................................................
    @RequestMapping("/CRM/complaintApprovalList.htm")
    public ModelAndView complaintApprovalList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        modelMap.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Complaints", "Approved Complaints"));
//        modelMap.addAttribute("quoteList", crmDAO.quoteList(userId, orgId, null));
        modelMap.addAttribute("complaintList", crmDAO.list(SNo, "Complaints"));
        modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
        modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(null));
        return new ModelAndView("complaintApprovalList", modelMap);
    }

    //...........................   Customer Complaint Form ............................................
    @RequestMapping("/CRM/complaintApprovalForm.htm")
    public ModelAndView complaintApprovalForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");

        if (SNo != null) {
            String complaintNo2 = request.getParameter("complaintNo");
            modelMap.addAttribute("complaintList", crmDAO.list(SNo, "Complaints"));
        }
        String link = "../CRM/complaintForm.htm";
        String tab = "Complaints";
        modelMap.addAttribute("complaintFormData", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
        modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(null));
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("complaintApprovalForm", modelMap);

    }

    //====================Approve Complaint Form============
    @RequestMapping("/CRM/approveComplaintFormSubmit.htm")
    public ModelAndView approveComplaintFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String sno = request.getParameter("sno");
        String complaintCode = request.getParameter("complaintCode");
        String tenantName = request.getParameter("tenantName");
        String propertyName = request.getParameter("propertyName");
        String flatName = request.getParameter("propertyNo");
        String approverRemarks = request.getParameter("approverRemarks");
        crmDAO.updateComplaintDetails(complaintCode, "GFC Approved", approverRemarks);
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
                List<Complaints> td = crmDAO.tdList(userId, orgId, complaintCode);
                StringBuilder emailId = new StringBuilder(email);
                if (td.size() > 0) {
                    int i = 1;

                    emailId.append(",");
                    emailId.append(toEmail);
                    String[] sendEmail = emailId.toString().split(",");
                    subject = "Complaint Code: " + complaintCode;
                    String filepath = request.getSession().getServletContext().getRealPath("common\\theme\\images\\logo1.png");
                    mailbody = "<html><body>Dear Sir/Madam,<br/><br/><br/>You need to give an approval for Complaint. Tenant Name : " + tenantName + ", Property Name : " + propertyName + ", Flat Name : " + flatName + " " + ","
                            + " Please Approve this Complaint. <br/><br/>If approved ignore this mail. "
                            + "</body>"
                            + "<br/><br/>Thanks & Regards"
                            + "<br/>Al-Hashar Team.</html>";
                    ByteArrayOutputStream baos = new ByteArrayOutputStream();
                    baos.close();
                    cm.sendEmail(userEmail, password, sendEmail, subject, mailbody, baos, fileName);
                }
            }
        }
        return new ModelAndView(new RedirectView("../CRM/complaintApprovalList.htm"), modelMap);
    }

    //====================Approve Complaint Form============
    @RequestMapping("/CRM/rejectFormSubmit.htm")
    public ModelAndView rejectFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String sno = request.getParameter("sno");
        String complaintCode = request.getParameter("complaintCode");
        String approverRemarks = request.getParameter("reviewerComments2");
        String status = request.getParameter("reviewerRecordStatus");
        crmDAO.updateComplaintDetails(complaintCode, status, approverRemarks);

        return new ModelAndView(new RedirectView("../CRM/complaintApprovalList.htm"), modelMap);
    }

    //................................. GM Approval   Process Of Complaint List    ....................................................
    @RequestMapping("/CRM/complaintApprovalList1.htm")
    public ModelAndView complaintApprovalList1(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        modelMap.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Complaints", "Approval 2"));
        modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
        modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(null));
        modelMap.addAttribute("mdApprovalList", crmDAO.cfoApprovalList(userId, orgId, null));
//        modelMap.addAttribute("complaintList", crmDAO.list(SNo, "Complaints"));
        return new ModelAndView("complaintApprovalList1", modelMap);
    }

    //...........................   MD Approval Complaint Form ............................................
    @RequestMapping("/CRM/complaintApprovalForm1.htm")
    public ModelAndView complaintApprovalForm1(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");

        if (SNo != null) {
            String complaintNo2 = request.getParameter("complaintNo");
            modelMap.addAttribute("complaintList", crmDAO.list(SNo, "Complaints"));
        }
        String link = "../CRM/complaintForm.htm";
        String tab = "Complaints";
        modelMap.addAttribute("complaintFormData", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
        modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(null));
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("complaintApprovalForm1", modelMap);

    }

    //...........................   Customer Complaint Approval Form Submit ............................................
    @RequestMapping("/CRM/approveComplaintFormSubmit1.htm")
    public ModelAndView approveComplaintFormSubmit1(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String sno = request.getParameter("sno");
        String complaintCode = request.getParameter("complaintCode");
        String approverRemarks = request.getParameter("approverRemarks");
        crmDAO.updateComplaintDetails1(complaintCode, "CFO Approved", approverRemarks);

        return new ModelAndView(new RedirectView("../CRM/complaintApprovalList1.htm"), modelMap);
    }

    //................................. GM Approval   Process Of Complaint List    ....................................................
    @RequestMapping("/CRM/complaintRejectedList.htm")
    public ModelAndView complaintRejectedList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
        modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(null));
        modelMap.addAttribute("mdApprovalList", crmDAO.rejectedList(userId, orgId, null));
//        modelMap.addAttribute("complaintList", crmDAO.list(SNo, "Complaints"));
        return new ModelAndView("complaintRejectedList", modelMap);
    }

    //-------------------------------     CUSTOMER FEEDBACK    --------------------------------------------------------    
//.................................   Customer Feedback List    ....................................................
    @RequestMapping("/CRM/customerfeedbackList.htm")
    public ModelAndView customerfeedbackList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");

        modelMap.addAttribute("customerfeedbackList", crmDAO.list(SNo, "CustomerFeedback"));
        modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
        modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(null));
        return new ModelAndView("customerfeedbackList", modelMap);
    }

    //...........................   Customer Feedback Form ............................................
    @RequestMapping("/CRM/customerfeedbackForm.htm")
    public ModelAndView customerfeedbackForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");

        if (SNo != null) {
            modelMap.addAttribute("customerfeedbackList", crmDAO.list(SNo, "CustomerFeedback"));
        }
        String link = "../CRM/customerfeedbackForm.htm";
        String tab = "Customer Feedback";
        modelMap.addAttribute("complaintFormData", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
        modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(null));
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));

        return new ModelAndView("customerfeedbackForm", modelMap);

    }

    //===========================Tenant Details for CustomerFeedback===============
    @RequestMapping("/CRM/tenantDetailsForCustomerFeedback.htm")
    public ModelAndView tenantDetailsForCustomerFeedback(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("tenantDetailsForCustomerFeedback", crmDAO.tenantDetailsForCustomerFeedback());
        modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
        modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(null));
        return new ModelAndView("tenantDetailsForCustomerFeedback", modelMap);
    }

    //.............................  Customer Feedback Form Submit Method  ....................................
    @RequestMapping("/CRM/customerfeedbackFormSubmit.htm")
    public ModelAndView customerfeedbackFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();

        String custometFbCode = request.getParameter("custometFbCode");
        String tenantName = request.getParameter("tenantName");
        String assetName = request.getParameter("assetName");
        String assetNo = request.getParameter("assetNo");
        String feedbackDate = request.getParameter("feedbackDate");
        String workYear = request.getParameter("workYear");

        String column1 = request.getParameter("column1");
        String column2 = request.getParameter("column2");
        String column3 = request.getParameter("column3");
        String column4 = request.getParameter("column4");

        String remarks = request.getParameter("remarks");
        String sno = request.getParameter("sno");
        String status = request.getParameter("status");
        String dt[] = request.getParameterValues("lastmodifiedDate");

        String recordstatus = "Submitted";
        List<CustomerFeedback> gridData = new ArrayList<CustomerFeedback>();
        if (custometFbCode.isEmpty()) {
            ArrayList validuser = (ArrayList) crmDAO.custometFbCodeCheck(tenantName);
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

            custometFbCode = "CUSTFB" + "-" + ordno;
        }
        if (sno == null) {

            Date feedbackDate1 = null;
            try {
                if (!"".equals(feedbackDate) && feedbackDate != null) {
                    feedbackDate1 = (Date) formatter3.parse(feedbackDate);
                }
            } catch (NullPointerException ex) {
            }

            CustomerFeedback cf = new CustomerFeedback(userId, orgId, custometFbCode, tenantName, assetName, assetNo, feedbackDate1, workYear, column1, column2, column3, column4, remarks, recordstatus, "null", "null", "null", "null", "null", newdate, "update0", newdate);

            crmDAO.globalSave(cf);
            modelMap.addAttribute("success", "true");
        } else {

            int k = Integer.parseInt(status.substring(status.length() - 1));
            k++;
            status = "Update" + k;

            CustomerFeedback cf = new CustomerFeedback();
            modelMap.addAttribute("success", "test");
        }

        modelMap.addAttribute("success", "true");

        return new ModelAndView(new RedirectView("customerfeedbackList.htm"), modelMap);

    }

    //-------------------------------     VACATING   --------------------------------------------------------    
//...................==========..............    Vacating List    .............===========.......................................
    @RequestMapping("/CRM/vacatingList.htm")
    public ModelAndView vacatingList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Rent Quote", "Approval 1"));
        modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
        modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(null));
        modelMap.addAttribute("vacatingList", crmDAO.vacatingList(userId, orgId, null));
        return new ModelAndView("vacatingList", modelMap);
    }

    //.................==============..........   Vacating  Form ..........==============..................................
    @RequestMapping("/CRM/vacatingForm.htm")
    public ModelAndView vacatingForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        String assetCode = request.getParameter("assetCode");
        String subAssetCode = request.getParameter("subAssetCode");

        if (SNo != null) {
            modelMap.addAttribute("vacatingList", crmDAO.vacatingList(userId, orgId, SNo));
            modelMap.addAttribute("AssetName", crmDAO.vacatingAssetName(assetCode));
            modelMap.addAttribute("SubAssetName", crmDAO.vacatingSubAssetName(subAssetCode));
        }
        String link = "../CRM/vacatingForm.htm";
        String tab = "Vacating";

        modelMap.addAttribute("vacatFormData", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));

        return new ModelAndView("vacatingForm", modelMap);

    }

    // ----------------------============ Advance Dues fetch =============-----------------------//    
    @RequestMapping("/CRM/selectAdvDues.htm")
    public void selectAdvDues(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        HttpSession session = req.getSession(true);
        String tenantCode = req.getParameter("tenantCode");
        String recieptType = req.getParameter("recieptType");
        crmDAO.selectAdvDues(req, res, tenantCode, recieptType);
    }

    // ----------------------============ Rent Dues fetch =============-----------------------//    
    @RequestMapping("/CRM/selectRentDues.htm")
    public void selectRentDues(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        HttpSession session = req.getSession(true);
        String tenantCode = req.getParameter("tenantCode");
        String recieptType = req.getParameter("recieptType");
        String contStartDate = req.getParameter("contStartDate");
        String contEndDate = req.getParameter("contEndDate");
        crmDAO.selectRentDues(req, res, tenantCode, recieptType, contStartDate, contEndDate);
    }

    // ----------------------============ Service Dues fetch =============-----------------------//
    @RequestMapping("/CRM/selectServiceDuesIssue.htm")
    public void selectServiceDuesIssue(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        HttpSession session = req.getSession(true);
        String tenantCode = req.getParameter("tenantCode");
        String recieptType = req.getParameter("recieptType");
        crmDAO.selectServiceDuesIssue(req, res, tenantCode, recieptType);
    }

    // ----------------------============ Service Dues fetch =============-----------------------//
    @RequestMapping("/CRM/selectServiceDues.htm")
    public void selectServiceDues(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        HttpSession session = req.getSession(true);
        String tenantCode = req.getParameter("tenantCode");
        String recieptType = req.getParameter("recieptType");
        crmDAO.selectServiceDues(req, res, tenantCode, recieptType);
    }

    //---------------========------------------ Tenamt Name Fetch ------=============--------- 
    @RequestMapping("/CRM/selectTenantName.htm")
    public ModelAndView selectTenantName(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("selectLandLord", crmDAO.selectTenantName());
        modelMap.addAttribute("contract", crmDAO.contract());
        return new ModelAndView("selectTenantName", modelMap);
    }

    //-------------------===========-------------- Property Name Fetch -------================-------- 
    @RequestMapping("/CRM/selectPropertyName.htm")
    public ModelAndView selectPropertyName(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("selectLandLord", crmDAO.selectPropertyName());
        return new ModelAndView("selectPropertyName", modelMap);
    }

    //................===========................ Vacating Form Submit  .............============...................
    @RequestMapping("/CRM/vacatingFormSubmit.htm")
    public ModelAndView vacatingFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();

        String vacatingCode = request.getParameter("vacatingCode");
        String tenantCode = request.getParameter("tenantCode");
        String tenantName = request.getParameter("tenantName");
        String assetCode = request.getParameter("propertyName");
        String propertyNo = request.getParameter("propertyNo");
        String subAssetCode = request.getParameter("propertyNo");
        String vfdate = request.getParameter("vfdate");
        String dateofvacate = request.getParameter("dateofvacate");
        String ceDate = request.getParameter("ceDate");
        String noticePeriod = request.getParameter("noticePeriod");
        String advToPaid = request.getParameter("advToPaid");
        String advDues = request.getParameter("advDues");
        String rentDues = request.getParameter("rentDues");
        String serviceDues = request.getParameter("serviceDues");
        String utility1 = request.getParameter("utility1");
        String utility2 = request.getParameter("utility2");
        String roomCode = request.getParameter("roomCode");
        String finalSettlementAmmount = request.getParameter("finalSettlementAmmount");
                String contractCode = request.getParameter("contractCode");

        /*   End */

        String reasonforvac = request.getParameter("reasonforvac");
        Date newdate = new Date();
        String sno = request.getParameter("sno");
        String status = request.getParameter("status");

        String recordstatus1 = "Vacant";
        String recordstatus2 = "Vacated";
        Date vfdate1 = null;
        try {
            if (!"".equals(vfdate) && vfdate != null) {
                vfdate1 = (Date) formatter3.parse(vfdate);
            }
        } catch (NullPointerException ex) {
        }
        Date ceDate1 = null;
        try {
            if (!"".equals(ceDate) && ceDate != null) {
                ceDate1 = (Date) formatter3.parse(ceDate);
            }
        } catch (NullPointerException ex) {
        }
           Date vfdate2 = null;
        try {
            if (!"".equals(dateofvacate) && dateofvacate != null) {
                vfdate2 = (Date) formatter3.parse(dateofvacate);
            }
        } catch (NullPointerException ex) {
        }
      

        List<Vacating> gridData = new ArrayList<Vacating>();
        if (vacatingCode.isEmpty()) {
            ArrayList validuser = (ArrayList) crmDAO.vacatingCodeCheck(tenantName);
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

            vacatingCode = "VACAT" + "-" + ordno;
        }
        if (sno == null) {
            Vacating cm = new Vacating(orgId, userId, vacatingCode, tenantCode, tenantName, assetCode, subAssetCode, vfdate1, ceDate1, noticePeriod, advToPaid, reasonforvac, "null", "null", "null", "null", "null", advDues, rentDues, serviceDues, utility1, utility2, finalSettlementAmmount, "update0", newdate,vfdate2);
            gridData.add(cm);
            crmDAO.vacatingsave1(gridData);
            modelMap.addAttribute("success", "true");
            crmDAO.updateSubasset(assetCode, subAssetCode, recordstatus1);
            crmDAO.updateTenant(tenantCode, recordstatus2);
            if (null != roomCode && !"".equals(roomCode)) {
                crmDAO.updateRoomStatus(roomCode, recordstatus1);
            }
           crmDAO.updateContractStatus(contractCode, "Inactive");

        } else {

            int k = Integer.parseInt(status.substring(status.length() - 1));
            k++;
            status = "Update" + k;

            Vacating cm = new Vacating(Integer.parseInt(sno), orgId, userId, vacatingCode, tenantCode, tenantName, assetCode, subAssetCode, vfdate1, ceDate1, noticePeriod, advToPaid, reasonforvac,"null", "null", "null", "null", "null", advDues, rentDues, serviceDues, utility1, utility2, finalSettlementAmmount, "update0", newdate,vfdate2);
            crmDAO.VacatingSave(cm);
            modelMap.addAttribute("success", "test");
            crmDAO.updateSubasset(assetCode, subAssetCode, recordstatus1);
        }

        modelMap.addAttribute("success", "true");

        return new ModelAndView(new RedirectView("vacatingList.htm"), modelMap);

    }

    //-------------------------------     LEAD MANAGEMENT    --------------------------------------------------------    
    //...............================............... Lead Management List ........===============............................
    @RequestMapping("/Lead/LeadManagementListNew.htm")
    public ModelAndView LeadManagementListNew(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Lead Management", "Lead Management"));
        modelMap.addAttribute("leadmanagmentListNew", crmDAO.leadmanagmentListNew(userId, orgId, null));
        return new ModelAndView("LeadManagementListNew", modelMap);
    }

    //.............=============..............   Lead Management Form ..............============..............................
    @RequestMapping("/Lead/LeadManagementFormNew.htm")
    public ModelAndView LeadManagementFormNew(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        String leadCode = request.getParameter("leadCode");
        String action = request.getParameter("action");
        if (SNo != null) {
            modelMap.addAttribute("leadmanagmentList", crmDAO.leadmanagmentListNew(userId, orgId, leadCode));
        }
        String link = "../Lead/LeadManagementFormNew.htm";
        String tab = "Lead Management";
        modelMap.addAttribute("LeadFormData", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("LeadFormData_dropDown_category", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
        modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(null));
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));

        return new ModelAndView("LeadManagementFormNew", modelMap);

    }

    //............============...............   Lead Management EDIT Form ...............=============.............................
    @RequestMapping("/Lead/LeadManagementFormEdit.htm")
    public ModelAndView LeadManagementFormEdit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        String leadCode = request.getParameter("leadCode");
        String action = request.getParameter("action");
        if (SNo != null) {
            modelMap.addAttribute("leadmanagmentList", crmDAO.leadmanagmentListNew(userId, orgId, leadCode));
            modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
            modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(null));
        }
        String link = "../Lead/LeadManagementFormNew.htm";
        String tab = "Lead Management";
        modelMap.addAttribute("LeadFormData", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("LeadFormData_dropDown_category", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));

        return new ModelAndView("LeadManagementFormEdit", modelMap);

    }

    //...................============........... Select Asset Name and Code .................=============...................
    @RequestMapping("/Lead/selectAssetNameCode.htm")
    public ModelAndView selectAssetNameCode(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();

        modelMap.addAttribute("selectAssetNameCode", crmDAO.selectAssetNameCode());
        return new ModelAndView("selectAssetNameCode", modelMap);
    }

    @RequestMapping("/Lead/selectSubAssetDetails.htm")
    public ModelAndView selectSubAssetDetails(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String assetCode = request.getParameter("assetCode");
        modelMap.addAttribute("selectSubAssetDetails", crmDAO.selectAssetPlotNoandCode(assetCode));
        return new ModelAndView("selectAssetPlotDetails", modelMap);
    }

    //........................................Lead Form Submit--------------------------------
    //...............===========..............  Lead Management Form Submit Method  .......============.............................
    @RequestMapping("/Lead/leadFormSubmit.htm")
    public ModelAndView leadFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, IOException, MessagingException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String creationFrom = request.getParameter("creationFrom");

        String leadCode = request.getParameter("leadCode");
        String leadName = request.getParameter("leadName");
        String leadType = request.getParameter("leadType");
        String industry = request.getParameter("industry");
        String contacts = request.getParameter("contacts");
        String leadaddressPermanent = request.getParameter("leadaddressPermanent");
        String remarks = request.getParameter("remarks");
        String leadSource = request.getParameter("leadSource");
        String others = request.getParameter("others");

        String salutation[] = request.getParameterValues("salutation");
        String firstName[] = request.getParameterValues("firstName2");
        String lastName[] = request.getParameterValues("lastName1");
        String designation[] = request.getParameterValues("designation1");
        String email[] = request.getParameterValues("email1");
        String mobile[] = request.getParameterValues("mobile1");
        String dob[] = request.getParameterValues("dob");
        String postbxno[] = request.getParameterValues("postbxno");
        String pincode[] = request.getParameterValues("pincode");
        String city[] = request.getParameterValues("city");
        String country[] = request.getParameterValues("country");
        String addressDifferent[] = request.getParameterValues("addressDifferent");
        String assetCode[] = request.getParameterValues("assetCode1");
        String assetName[] = request.getParameterValues("assetName1");
        String assetPlotCode[] = request.getParameterValues("assetPlotCode1");
        String assetPlotNo[] = request.getParameterValues("assetPlotNo1");
        String followUp[] = request.getParameterValues("followUp1");
        String folowUpHistory[] = request.getParameterValues("folowUpHistory");

        String recordStatus = "Lead Generated";

        String UploadMedicalRepName[] = request.getParameterValues("UploadMedicalRepName");
        String leaFileName = request.getParameter("leaFileName");

        String sno[] = request.getParameterValues("sno");
        String status = request.getParameter("status");
        String dt[] = request.getParameterValues("lastmodifiedDate");
        String deleteRows = request.getParameter("deleteRows");
        String originalImg = null;
        Date dob1 = null;
        Date followUp1 = null;

        List<Lead> gridData = new ArrayList<Lead>();
        if (leadCode.isEmpty()) {
            ArrayList validuser = (ArrayList) crmDAO.leadCodeCheck(leadName);
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

            leadCode = "LEAD" + "-" + ordno;
        }
        if (sno == null) {
            for (int i = 0; i < firstName.length; i++) {

                try {
                    if (!"".equals(dob[i]) && dob[i] != null) {
                        dob1 = (Date) formatter3.parse(dob[i]);
                    }
                } catch (NullPointerException ex) {
                    // Do something/nothing if date2 is null
                }
                try {
                    if (!"".equals(followUp[i]) && followUp[i] != null) {
                        followUp1 = (Date) formatter3.parse(followUp[i]);
                    }
                } catch (NullPointerException ex) {
                }

                MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
                MultipartFile multipartFile1 = multipartRequest1.getFile("UploadMedicalRepName");

                leaFileName = multipartFile1.getOriginalFilename();

                Lead lm = new Lead(userId, orgId, leadCode, leadName, leadType, industry, contacts, leadaddressPermanent, remarks, salutation[i], firstName[i], lastName[i], designation[i], email[i], mobile[i], country[i], city[i], postbxno[i], pincode[i], dob1, addressDifferent[i], assetCode[i], assetName[i], assetPlotCode[i], assetPlotNo[i], followUp1, folowUpHistory[i], recordStatus, "Direct", multipartFile1.getBytes(), leaFileName, leadSource, others, "null", "null", "null", "update0", newdate);
                gridData.add(lm);
                crmDAO.leadsave1(gridData);
                modelMap.addAttribute("success", "true");

            }
        } else {

            for (int i = 0; i < firstName.length; i++) {

                if (sno[i] == null || sno[i].isEmpty()) {
                    try {
                        if (!"".equals(dob[i]) && dob[i] != null) {
                            dob1 = (Date) formatter3.parse(dob[i]);
                        }
                    } catch (NullPointerException ex) {
                    }
                    try {
                        if (!"".equals(followUp[i]) && followUp[i] != null) {
                            followUp1 = (Date) formatter3.parse(followUp[i]);
                        }
                    } catch (NullPointerException ex) {
                    }
                    MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
                    MultipartFile multipartFile1 = multipartRequest1.getFile("UploadMedicalRepName");
                    leaFileName = multipartFile1.getOriginalFilename();

                    Lead lm = new Lead(userId, orgId, leadCode, leadName, leadType, industry, contacts, leadaddressPermanent, remarks, salutation[i], firstName[i], lastName[i], designation[i], email[i], mobile[i], country[i], city[i], postbxno[i], pincode[i], dob1, addressDifferent[i], assetCode[i], assetName[i], assetPlotCode[i], assetPlotNo[i], followUp1, folowUpHistory[i], recordStatus, "Direct", multipartFile1.getBytes(), leaFileName, leadSource, others, "null", "null", "null", status, newdate);
                    gridData.add(lm);
                    crmDAO.leadsave1(gridData);
                    modelMap.addAttribute("success", "true");

                } else {
                    int k = Integer.parseInt(status.substring(status.length() - 1));
                    k++;
                    status = "Update" + k;
                    try {
                        if (!"".equals(dob[i]) && dob[i] != null) {
                            dob1 = (Date) formatter3.parse(dob[i]);
                        }
                    } catch (NullPointerException ex) {
                    }
                    try {
                        if (!"".equals(followUp[i]) && followUp[i] != null) {
                            followUp1 = (Date) formatter3.parse(followUp[i]);
                        }
                    } catch (NullPointerException ex) {
                    }
                    MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
                    MultipartFile multipartFile1 = multipartRequest1.getFile("UploadMedicalRepName");
                    leaFileName = multipartFile1.getOriginalFilename();
                    byte[] test1 = null;
                    if (leaFileName == null || leaFileName == "") {
                        leaFileName = crmDAO.getFilename(leadCode);
                        test1 = crmDAO.getContentAttach(leadCode);
                        Lead lm = new Lead(Integer.parseInt(sno[i]), userId, orgId, leadCode, leadName, leadType, industry, contacts, leadaddressPermanent, remarks, salutation[i], firstName[i], lastName[i], designation[i], email[i], mobile[i], country[i], city[i], postbxno[i], pincode[i], dob1, addressDifferent[i], assetCode[i], assetName[i], assetPlotCode[i], assetPlotNo[i], followUp1, folowUpHistory[i], recordStatus, creationFrom, test1, leaFileName, leadSource, others, "null", "null", "null", "update0", newdate);
                        crmDAO.LeadSave(lm);
                    } else {
                        Lead lm = new Lead(Integer.parseInt(sno[i]), userId, orgId, leadCode, leadName, leadType, industry, contacts, leadaddressPermanent, remarks, salutation[i], firstName[i], lastName[i], designation[i], email[i], mobile[i], country[i], city[i], postbxno[i], pincode[i], dob1, addressDifferent[i], assetCode[i], assetName[i], assetPlotCode[i], assetPlotNo[i], followUp1, folowUpHistory[i], recordStatus, creationFrom, multipartFile1.getBytes(), leaFileName, leadSource, others, "null", "null", "null", "update0", newdate);
                        crmDAO.LeadSave(lm);
                        modelMap.addAttribute("success", "test");

                    }

                }

            }
            if (deleteRows.trim().length() != 0) {
                String out[] = deleteRows.split("//");
                for (int j = 0; j < out.length; j++) {
                    crmDAO.leadGridDataDelete(Integer.parseInt(out[j]));
                }
            }

        }
        modelMap.addAttribute("success", "true");
        return new ModelAndView(new RedirectView("LeadManagementListNew.htm"), modelMap);

    }

    //==============For Download===============
    @RequestMapping("/Lead/leadAttachDownload.htm")
    public void leadAttachDownload(HttpServletRequest req, HttpServletResponse res) throws FileNotFoundException, IOException {
        String sno = req.getParameter("sno");

        Lead doc = crmDAO.getLeadAttach(Integer.parseInt(sno));
        try {
            res.setHeader("Content-Disposition", "inline;filename=\"" + doc.getBusinessAttachment() + "\"");
            OutputStream out = res.getOutputStream();
            res.setContentType("application/force-download");
            byte[] buffer = doc.getBusinessAttachment();
            InputStream in1 = new ByteArrayInputStream(buffer);
            IOUtils.copy(in1, res.getOutputStream());
            out.flush();
            out.close();
            in1.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //.................==========............... Lead Name Validation.......============.........................
    @RequestMapping("/Lead/getLeadName.htm")
    public void getLeadName(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        HttpSession session = req.getSession(true);
        String leadName = req.getParameter("leadName");
        crmDAO.getLeadName(req, res, leadName);
    }

    //.................=========............. Lead Management Tenant List ..........========..........................
    @RequestMapping("/Lead/tenantList.htm")
    public ModelAndView tenantList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        modelMap.addAttribute("tenantDetails", tenantDetailsDAO.list(sno, "TenantDetails"));
        return new ModelAndView("Tenantalist", modelMap);
    }

    //..................=========.........   Lead Management eDIT Form ..............============..............................
    @RequestMapping("/Lead/LeadConvertForm.htm")
    public ModelAndView LeadConvertForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        String leadCode = request.getParameter("leadCode");
        String action = request.getParameter("action");
        if (leadCode != null) {
            modelMap.addAttribute("leadmanagmentList", crmDAO.leadmanagmentListNew(userId, orgId, leadCode));

        }
        String link = "../tenant/tenantDetailsForm.htm";
        String tab = "Tenant Details";

        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));

        modelMap.addAttribute("tenantType", crmDAO.tenantType());
        modelMap.addAttribute("tenantCategory", crmDAO.tenantCategory());
        modelMap.addAttribute("fileSize", userDAO.fileSize());
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("leadCode", leadCode);
        modelMap.addAttribute("action", request.getParameter("action"));

        return new ModelAndView("LeadConvertForm", modelMap);

    }

    //..................=========.........   Lead Covert Form Submit ..............============..............................
    @RequestMapping("/Lead/leadConvertFormSubmit.htm")
    public ModelAndView leadConvertFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String leadCode = request.getParameter("leadCode");
        String assetCode = request.getParameter("assetCode");
        String leadRecordStatus = "Tenant Created";
        String recordstatus = "From Lead";
        String subAssetrecordstatus = "Occupied";

        String pk = request.getParameter("pk");
        String tenantCode = request.getParameter("tenantCode");
        String llId = request.getParameter("llId");
        String llName = request.getParameter("llName");
        String llCategory = request.getParameter("llCategory");
        String llCrNo = request.getParameter("llCrNo");
        String llContactno = request.getParameter("llContactno");
        String llWorkContactno = request.getParameter("llWorkContactno");
        String llMailid = request.getParameter("llMailid");
        String llAttachment = request.getParameter("llAttachment");
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
        String remarks = request.getParameter("remarks");
        String tenantAttachment = request.getParameter("tenantAttachment");
        String assetName = request.getParameter("assetName");
        String subAssetCode = request.getParameter("subclassifiedAstno");
        String subclassifiedAstno = request.getParameter("flatNo");
        String buildingNo = request.getParameter("buildingNo");
        String wayNo = request.getParameter("wayNo");
        String assetArea = request.getParameter("assetArea");
        String blockNo = request.getParameter("blockNo");
        String plotNo = request.getParameter("plotNo");
        String streetNo = request.getParameter("streetNo");
        String waterBillno = request.getParameter("waterBillno");
        String electricityBillno = request.getParameter("electricityBillno");
        String assetPostalCode = request.getParameter("assetPostalCode");
        String assetPostboxNo = request.getParameter("assetPostboxNo");
        String contractPeriod = request.getParameter("contractPeriod");
        String startsFrom = request.getParameter("startsFrom");
        String endsTo = request.getParameter("endsTo");
        String contractAttachment = request.getParameter("contractAttachment");
        String billingCycle = request.getParameter("billingCycle");
        String advanceAmount = request.getParameter("advanceAmount");
        String dueDate = request.getParameter("dueDate");
        String totalAmount = request.getParameter("totalAmount");
        String contractSigningDate = request.getParameter("contractSigningDate");
        String status = request.getParameter("status");
        String attachmentReference = request.getParameter("attachmentReference");
        String llOrgfileName = request.getParameter("llOrgfileName");
        String tenOrgfileName = request.getParameter("tenOrgfileName");
        String contOrgfileName = request.getParameter("contOrgfileName");
        String extra1 = request.getParameter("extra1");
        String extra2 = request.getParameter("extra2");
        String extra3 = request.getParameter("extra3");
        String extra4 = request.getParameter("extra4");
        String extra5 = request.getParameter("extra5");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        if (tenantCode == null || tenantCode == "" || "".equals(tenantCode)) {
            ArrayList validuser = (ArrayList) tenantDetailsDAO.getTenantNo(llId);
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
        }
        Date startsFrom1 = null;
        if (!startsFrom.equals("")) {
            startsFrom1 = (Date) formatter3.parse(startsFrom);
        }

        Date endsTo1 = null;
        if (!endsTo.equals("")) {
            endsTo1 = (Date) formatter3.parse(endsTo);
        }

        Date dueDate1 = null;
        if (!dueDate.equals("")) {
            dueDate1 = (Date) formatter3.parse(dueDate);
        }
        Date contractSigningDate1 = null;
        if (!contractSigningDate.equals("")) {
            contractSigningDate1 = (Date) formatter3.parse(contractSigningDate);
        }

        if (pk == null || pk == "" || pk.equals("")) {
            MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
            List<MultipartFile> multipartFile1 = multipartRequest1.getFiles("tenantAttachment");
            for (Iterator<MultipartFile> iterator = multipartFile1.iterator(); iterator.hasNext();) {
                MultipartFile test = (MultipartFile) iterator.next();
                tenOrgfileName = test.getOriginalFilename();
                TenantDetails tenant = new TenantDetails(orgId, userId, tenantCode, llCategory, llName, llId, llCrNo, llContactno, llWorkContactno, llMailid, null, "", tenantType, tenantCategory, tenantFname, tenantLname, tenantCitizenship, tenantId, test.getBytes(), tenOrgfileName, tenantCrNo, companyAddress, postalCode1, tenantContactno, tenantWorkContactno, tenantMailid, permanentAddress, correspondenceAddress, postalCode, postboxNo, sponcerName, sponcerAddress, companyName, postboxNo1, jointeeName1, jointeeAddress1, jointeeName2, jointeeAddress2, remarks, assetCode, assetName, subAssetCode, subclassifiedAstno, buildingNo, wayNo, assetArea, blockNo, plotNo, streetNo, waterBillno, electricityBillno, assetPostalCode, assetPostboxNo, contractPeriod, startsFrom1, endsTo1, null, "", billingCycle, advanceAmount, dueDate1, totalAmount, contractSigningDate1, recordstatus, "Submitted", extra1, extra2, extra3, extra4, extra5, "Update0", today, today);
                tenantDetailsDAO.globalSave(tenant);
                crmDAO.UpdateLead(leadCode, leadRecordStatus);
                crmDAO.updateSubassetFromLead(assetCode, subAssetCode, subAssetrecordstatus);

            }

        } else {
            MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
            List<MultipartFile> multipartFile1 = multipartRequest1.getFiles("tenantAttachment");
            TenantDetails tenant = null;
            for (Iterator<MultipartFile> iterator = multipartFile1.iterator(); iterator.hasNext();) {
                MultipartFile test = (MultipartFile) iterator.next();
                tenOrgfileName = test.getOriginalFilename();
                byte[] Content1 = null;
                try {
                    if (tenOrgfileName == null || tenOrgfileName == "") {
                        tenOrgfileName = tenantDetailsDAO.getTenOrgfileName(tenantCode);
                        Content1 = tenantDetailsDAO.getTenantAttachment(tenantCode);

                        tenant = new TenantDetails(Integer.parseInt(pk), orgId, userId, tenantCode, llCategory, llName, llId, llCrNo, llContactno, llWorkContactno, llMailid, null, "", tenantType, tenantCategory, tenantFname, tenantLname, tenantCitizenship, tenantId, Content1, tenOrgfileName, tenantCrNo, companyAddress, postalCode1, tenantContactno, tenantWorkContactno, tenantMailid, permanentAddress, correspondenceAddress, postalCode, postboxNo, sponcerName, sponcerAddress, companyName, postboxNo1, jointeeName1, jointeeAddress1, jointeeName2, jointeeAddress2, remarks, assetCode, assetName, subclassifiedAstno, buildingNo, wayNo, assetArea, blockNo, plotNo, streetNo, waterBillno, electricityBillno, assetPostalCode, assetPostboxNo, contractPeriod, startsFrom1, endsTo1, null, "", billingCycle, advanceAmount, dueDate1, totalAmount, contractSigningDate1, recordstatus, "Submitted", extra1, extra2, extra3, extra4, extra5, "Update0", today);
                    } else {
                        tenant = new TenantDetails(Integer.parseInt(pk), orgId, userId, tenantCode, llCategory, llName, llId, llCrNo, llContactno, llWorkContactno, llMailid, null, "", tenantType, tenantCategory, tenantFname, tenantLname, tenantCitizenship, tenantId, test.getBytes(), tenOrgfileName, tenantCrNo, companyAddress, postalCode1, tenantContactno, tenantWorkContactno, tenantMailid, permanentAddress, correspondenceAddress, postalCode, postboxNo, sponcerName, sponcerAddress, companyName, postboxNo1, jointeeName1, jointeeAddress1, jointeeName2, jointeeAddress2, remarks, assetCode, assetName, subclassifiedAstno, buildingNo, wayNo, assetArea, blockNo, plotNo, streetNo, waterBillno, electricityBillno, assetPostalCode, assetPostboxNo, contractPeriod, startsFrom1, endsTo1, null, "", billingCycle, advanceAmount, dueDate1, totalAmount, contractSigningDate1, recordstatus, "Submitted", extra1, extra2, extra3, extra4, extra5, "Update0", today);
                    }
                    tenantDetailsDAO.globalSave(tenant);
                } catch (Exception ex) {
                }

            }
        }

        modelMap.addAttribute("tenantDetails", tenantDetailsDAO.list(pk, "TenantDetails"));
        return new ModelAndView(new RedirectView("../Lead/tenantList.htm"), modelMap);
    }

    //.............========..............Lead to  Quote Convert Form ...........========.................................
    @RequestMapping("/Lead/QuoteConvertForm.htm")
    public ModelAndView QuoteConvertForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        String leadCode = request.getParameter("leadCode");
        String action = request.getParameter("action");
        if (leadCode != null) {
            modelMap.addAttribute("leadmanagmentList", crmDAO.leadmanagmentListNew(userId, orgId, leadCode));
        }

        String link = "../CRM/quoteForm.htm";
        String tab = "Rent Quote";
        modelMap.addAttribute("quoteFormData", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("fileSize", userDAO.fileSize());
        modelMap.addAttribute("tenantType", crmDAO.tenantType());
        modelMap.addAttribute("tenantCategory", crmDAO.tenantCategory());

        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));

        return new ModelAndView("quoteConvertForm", modelMap);

    }

    //====================Rent Quote Convert Form Submition=============
    @RequestMapping("/Lead/rentQuoteConvertFormSubmit.htm")
    public ModelAndView rentQuoteConvertFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String leadCode = request.getParameter("leadCode");
        String assetCode = request.getParameter("assetCode");
        String leadRecordStatus = "RentQuote Created";
        String recordstatus = "From Lead";
        String subAssetrecordstatus = "Occupied";
        String recordstatus1 = "Occupied";

        String sno = request.getParameter("sno");
        String tenantQuoteCode = request.getParameter("tenantQuoteCode");
        String tenantType = request.getParameter("tenantType");
        String tenantCategory = request.getParameter("tenantCategory");
        String tenantFname = request.getParameter("tenantFname");
        String tenantLname = request.getParameter("tenantLname");
        String tenantCitizenship = request.getParameter("tenantCitizenship");
        String tenantId = request.getParameter("tenantId");
        String tenentpostalCode = request.getParameter("tenentpostalCode");
        String tenantpostboxNo = request.getParameter("tenantpostboxNo");

        String tenantAttachment = request.getParameter("tenantAttachment");

        String jointeeName1 = request.getParameter("jointeeName1");
        String jointeeAddress1 = request.getParameter("jointeeAddress1");
        String jointeeName2 = request.getParameter("jointeeName2");
        String jointeeAddress2 = request.getParameter("jointeeAddress2");
        String sponcerName = request.getParameter("sponcerName");
        String ifWorking = request.getParameter("ifWorking");
        String companyName = request.getParameter("companyName");
        String companyAddress = request.getParameter("companyAddress");
        String tenantCrNo = request.getParameter("tenantCrNo");
        String tenantContactno = request.getParameter("tenantContactno");
        String tenantWorkContactno = request.getParameter("tenantWorkContactno");
        String tenantMailid = request.getParameter("tenantMailid");
        String permanentAddress = request.getParameter("permanentAddress");
        String correspondenceAddress = request.getParameter("correspondenceAddress");
        String sponcerAddress = request.getParameter("sponcerAddress");
        String sopnsorpostalCode = request.getParameter("sopnsorpostalCode");
        String sponsorpostboxNo = request.getParameter("sponsorpostboxNo");
        String tenentHistory = request.getParameter("tenentHistory");
        String remarks = request.getParameter("remarks");

        String assetName = request.getParameter("assetName");
        String subclassifiedAstno = request.getParameter("flatNo");
        String subassetCode = request.getParameter("subclassifiedAstno");
        String buildingNo = request.getParameter("buildingNo");
        String waterBillno = request.getParameter("waterBillno");
        String assetArea = request.getParameter("assetArea");
        String blockNo = request.getParameter("blockNo");
        String plotNo = request.getParameter("plotNo");
        String electricityBillno = request.getParameter("electricityBillno");
        String wayNo = request.getParameter("wayNo");
        String streetNo = request.getParameter("streetNo");
        String assetPostalCode = request.getParameter("assetPostalCode");
        String assetPostboxNo = request.getParameter("assetPostboxNo");

        String contractCode = request.getParameter("contractCode");
        String contractName = request.getParameter("contractName");
        String startsFrom = request.getParameter("startsFrom");
        String endsTo = request.getParameter("endsTo");

        String contractAttachment = request.getParameter("contractAttachment");

        String minimumRentFixed = request.getParameter("minimumRentFixed");
        String actualRentFixed = request.getParameter("actualRentFixed");

        String billingCycle = request.getParameter("billingCycle");
        String dueDate = request.getParameter("dueDate");
        String billingCycle1 = request.getParameter("billingCycle1");

        String Attribute1 = request.getParameter("Attribute1");
        String Attribute2 = request.getParameter("Attribute2");
        String Attribute3 = request.getParameter("Attribute3");
        String Attribute4 = request.getParameter("Attribute4");
        String Attribute5 = request.getParameter("Attribute5");

        String tenantFilename = request.getParameter("tenantFilename");
        String contractFileName = request.getParameter("contractFileName");

        String status = request.getParameter("status");
        String lastmodifiedDate = request.getParameter("lastmodifiedDate");

        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());

        Date startsFrom1 = null;
        if (!startsFrom.equals("")) {
            startsFrom1 = (Date) formatter3.parse(startsFrom);
        }

        Date endsTo1 = null;
        if (!endsTo.equals("")) {
            endsTo1 = (Date) formatter3.parse(endsTo);
        }

        Date dueDate1 = null;
        if (!dueDate.equals("")) {
            dueDate1 = (Date) formatter3.parse(dueDate);
        }
        List<Rentquote> gridData = new ArrayList<Rentquote>();

        if (tenantQuoteCode.isEmpty()) {
            ArrayList validuser = (ArrayList) crmDAO.rentQuotecodeCkeck(tenantFname);
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

            tenantQuoteCode = "RENTQUOTE" + "-" + ordno;
        }

        if (sno == null || sno == "" || sno.equals("")) {
            MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
            List<MultipartFile> multipartFile1 = multipartRequest1.getFiles("tenantAttachment");
            for (Iterator<MultipartFile> iterator = multipartFile1.iterator(); iterator.hasNext();) {
                MultipartFile test = (MultipartFile) iterator.next();
                tenantFilename = test.getOriginalFilename();

                Rentquote rentquote = new Rentquote(userId, orgId, tenantQuoteCode, tenantType, tenantCategory, tenantFname, tenantLname, tenantCitizenship, tenantId, tenentpostalCode, tenantpostboxNo, test.getBytes(), tenantFilename, jointeeName1, jointeeAddress1, jointeeName2, jointeeAddress2, sponcerName, ifWorking, companyName, companyAddress, tenantCrNo, tenantContactno, tenantWorkContactno, tenantMailid, permanentAddress, correspondenceAddress, sponcerAddress, sopnsorpostalCode, sponsorpostboxNo, tenentHistory, remarks, assetName, assetCode, subclassifiedAstno, buildingNo, electricityBillno, wayNo, blockNo, plotNo, electricityBillno, wayNo, streetNo, assetPostalCode, plotNo, contractCode, contractName, startsFrom1, endsTo1, null, "", minimumRentFixed, actualRentFixed, billingCycle, dueDate1, "Need Approval", "From Lead", "RentQuote Created", "null", "null", "null", "null", "null", "null", "null", "null", "null", "update0", date, subassetCode);
                gridData.add(rentquote);
                crmDAO.rentQuotesave1(gridData);
                crmDAO.UpdateLead(leadCode, leadRecordStatus);
                crmDAO.updateSubassetFromLead(assetCode, subclassifiedAstno, subAssetrecordstatus);
                modelMap.addAttribute("success", "true");
            }

        } else {
            int k = Integer.parseInt(status.substring(status.length() - 1));
            k++;
            status = "update" + k;
            MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
            List<MultipartFile> multipartFile1 = multipartRequest1.getFiles("tenantAttachment");
            for (Iterator<MultipartFile> iterator = multipartFile1.iterator(); iterator.hasNext();) {
                MultipartFile test = (MultipartFile) iterator.next();
                tenantFilename = test.getOriginalFilename();
                byte[] test1 = null;
                try {
                    if (tenantFilename == null || tenantFilename == "") {
                        tenantFilename = crmDAO.qtgetFilename(tenantQuoteCode);
                        test1 = crmDAO.qtgetContentAttach(tenantQuoteCode);

                        Rentquote rentquote = new Rentquote(Integer.parseInt(sno), userId, orgId, tenantQuoteCode, tenantType, tenantCategory, tenantFname, tenantLname, tenantCitizenship, tenantId, tenentpostalCode, tenantpostboxNo, test1, tenantFilename, jointeeName1, jointeeAddress1, jointeeName2, jointeeAddress2, sponcerName, ifWorking, companyName, companyAddress, tenantCrNo, tenantContactno, tenantWorkContactno, tenantMailid, permanentAddress, correspondenceAddress, sponcerAddress, sopnsorpostalCode, sponsorpostboxNo, tenentHistory, remarks, assetName, assetCode, subclassifiedAstno, buildingNo, electricityBillno, wayNo, blockNo, plotNo, electricityBillno, wayNo, streetNo, assetPostalCode, plotNo, contractCode, contractName, startsFrom1, endsTo1, null, "", minimumRentFixed, actualRentFixed, billingCycle, dueDate1, "null", "From Lead", "RentQuote Created", "null", "null", "null", "null", "null", "null", "null", "null", "null", status, date, subassetCode);
                        crmDAO.RentQuoteSave(rentquote);

                    } else {
                        Rentquote rentquote = new Rentquote(Integer.parseInt(sno), userId, orgId, tenantQuoteCode, tenantType, tenantCategory, tenantFname, tenantLname, tenantCitizenship, tenantId, tenentpostalCode, tenantpostboxNo, test.getBytes(), tenantFilename, jointeeName1, jointeeAddress1, jointeeName2, jointeeAddress2, sponcerName, ifWorking, companyName, companyAddress, tenantCrNo, tenantContactno, tenantWorkContactno, tenantMailid, permanentAddress, correspondenceAddress, sponcerAddress, sopnsorpostalCode, sponsorpostboxNo, tenentHistory, remarks, assetName, assetCode, subclassifiedAstno, buildingNo, electricityBillno, wayNo, blockNo, plotNo, electricityBillno, wayNo, streetNo, assetPostalCode, plotNo, contractCode, contractName, startsFrom1, endsTo1, null, "", minimumRentFixed, actualRentFixed, billingCycle, dueDate1, "null", "From Lead", "RentQuote Created", "null", "null", "null", "null", "null", "null", "null", "null", "null", status, date, subassetCode);
                        crmDAO.RentQuoteSave(rentquote);

                    }

                    modelMap.addAttribute("success", "test");
                } catch (Exception ex) {
                    //  Logger.getLogger(CenterCreationController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        tenantDetailsDAO.updateSubasset(assetName, subclassifiedAstno, recordstatus1);
        return new ModelAndView(new RedirectView("../Lead/LeadManagementListNew.htm"), modelMap);
    }

//================For Fetching LandLorde==============
    @RequestMapping("/Lead/selectLandLord.htm")
    public ModelAndView selectLandLord(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("selectLandLord", crmDAO.selectLandLord());
        return new ModelAndView("selectLandLord", modelMap);
    }

    //================Tenant Details Viwe Form==============
    @RequestMapping("/Lead/tenantDetailsViewForm.htm")
    public ModelAndView tenantDetailsViewForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        String leadCode = request.getParameter("leadCode");
        String tenantCode = request.getParameter("tenantCode");
        if (SNo != null) {
            modelMap.addAttribute("tenantDetails", crmDAO.tenantDetailsList(tenantCode));
        }
        String link = "../tenant/tenantDetailsForm.htm";
        String tab = "Tenant Details";

        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));

        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));

        return new ModelAndView("tenantDetailsViewForm", modelMap);

    }

    //-------------------------------     QUOTE    --------------------------------------------------------    
//..................==========...............    Quote List    .......=============.............................................
    @RequestMapping("/CRM/quoteList.htm")
    public ModelAndView quoteList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        ModelMap modelMap = new ModelMap();
          String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
//        if (fromDate != null && toDate != null) {
//            if (fromDate.contains("frdate") && toDate.contains("todate")) {
//                fromDate = null;
//                toDate = null;
//            }
//        }
//
//        if (fromDate == null || toDate == null) {
//        
//      
//        modelMap.addAttribute("quoteList", crmDAO.quoteList(userId, orgId, null));
//        modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
//        modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(null));
//        }
//        else
//        {
//             modelMap.addAttribute("quoteList", crmDAO.quoteList1(userId, orgId, null,fromDate,toDate));
//        modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist1(fromDate,toDate));
//        modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(null));
//        }
        ArrayList enq = (ArrayList) crmDAO.quotationCodeinc(userId, orgId, null, null, "1");
        
        String orderNo=null;
        String orderNo2 = null;
        String[] orderNo1 = null;
        int ordno = 1;
        if (!(enq.isEmpty())) {
            for (Iterator<QuotationDetails> iter = enq.iterator(); iter.hasNext();) {
                orderNo = iter.next().getQuotationNumber();
            }
            //orderNo1 = orderNo2.split("-");
        }
        if (orderNo != null) {
            orderNo1 = orderNo.split("-");
            ordno = Integer.parseInt(orderNo1[1]) + 1;
        }
        orderNo = "Quo" + "-" + ordno;
        
        modelMap.addAttribute("orderNo", orderNo);
    
        modelMap.addAttribute("quotationList", crmDAO.propertyDetailsList(userId, orgId, null));
        modelMap.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Rent Quote", "Rent Quote"));
        return new ModelAndView("quoteList", modelMap);
    }

    //.............========..............   Quote Form ...........========.................................
    @RequestMapping("/CRM/quoteForm.htm")
    public ModelAndView quoteForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String action = request.getParameter("action");
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        String tenantQuoteCode = request.getParameter("tenantQuoteCode");

        if (SNo != null) {
            modelMap.addAttribute("quoteList", crmDAO.quoteList(userId, orgId, SNo));
        }
//        modelMap.addAttribute("orglist", userDAO.orglist(null));

        ArrayList enq = (ArrayList) crmDAO.rentQuoteCodeinc(userId, orgId, null, null, "1");
        
        String orderNo=null;
        String orderNo2 = null;
        String[] orderNo1 = null;
        int ordno = 1;
        if (!(enq.isEmpty())) {
            for (Iterator<QuotationDetails> iter = enq.iterator(); iter.hasNext();) {
                orderNo = iter.next().getQuotationNumber();
            }
            //orderNo1 = orderNo2.split("-");
        }
        if (orderNo != null) {
            orderNo1 = orderNo.split("-");
            ordno = Integer.parseInt(orderNo1[1]) + 1;
        }
        orderNo = "Quo" + "-" + ordno;
        
        modelMap.addAttribute("orderNo", orderNo); 
        
        String link = "../CRM/quoteForm.htm";
        String tab = "Rent Quote";
        modelMap.addAttribute("quoteFormData", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
        modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(null));
        modelMap.addAttribute("quoteFormData_dropDown_Category", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("tenantType", crmDAO.tenantType());
        modelMap.addAttribute("tenantCategory", crmDAO.tenantCategory());
        modelMap.addAttribute("fileSize", userDAO.fileSize());
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));
        modelMap.addAttribute("recheck_option", request.getParameter("recheck"));

        return new ModelAndView("quoteForm", modelMap);

    }

    //--------------------------------- Contract Name Fetch --------------- 
    @RequestMapping("/CRM/selectContractCode.htm")
    public ModelAndView selectContractCode(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String tenantCategory = req.getParameter("tenantCategory");
        String subassetCode = req.getParameter("subassetCode");
        modelMap.addAttribute("contractName", crmDAO.selectContractName(tenantCategory, subassetCode));
        return new ModelAndView("selectContractCode", modelMap);
    }

    //--------------------------------- SubAsset Name Fetch --------------- 
    @RequestMapping("/CRM/selectAssetDetails.htm")
    public ModelAndView selectAssetDetails(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String tenantCategory = req.getParameter("tenantCategory");
        modelMap.addAttribute("selectAssetDetails", crmDAO.selectAssetDetails(tenantCategory));
        return new ModelAndView("selectAssetDetails", modelMap);
    }

    //====================Rent Quote Form Submition=============
    @RequestMapping("/CRM/rentQuoteFormSubmit.htm")
    public ModelAndView rentQuoteFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String sno = request.getParameter("sno");
        String tenantQuoteCode = request.getParameter("tenantQuoteCode");
        String tenantType = request.getParameter("tenantType");
        String tenantCategory = request.getParameter("tenantCategory");
        String tenantFname = request.getParameter("tenantFname");
        String tenantLname = request.getParameter("tenantLname");
        String tenantCitizenship = request.getParameter("tenantCitizenship");
        String tenantId = request.getParameter("tenantId");
        String tenentpostalCode = request.getParameter("tenentpostalCode");
        String tenantpostboxNo = request.getParameter("tenantpostboxNo");

        String tenantAttachment = request.getParameter("tenantAttachment");
          
        String jointeeName1 = request.getParameter("jointeeName1");
        String jointeeAddress1 = request.getParameter("jointeeAddress1");
        String jointeeName2 = request.getParameter("jointeeName2");
        String jointeeAddress2 = request.getParameter("jointeeAddress2");
        String sponcerName = request.getParameter("sponcerName");
        String ifWorking = request.getParameter("ifWorking");
        String companyName = request.getParameter("companyName");
        String companyAddress = request.getParameter("companyAddress");
        String tenantCrNo = request.getParameter("tenantCrNo");
        String tenantContactno = request.getParameter("tenantContactno");
        String tenantWorkContactno = request.getParameter("tenantWorkContactno");
        String tenantMailid = request.getParameter("tenantMailid");
        String permanentAddress = request.getParameter("permanentAddress");
        String correspondenceAddress = request.getParameter("correspondenceAddress");
        String sponcerAddress = request.getParameter("sponcerAddress");
        String sopnsorpostalCode = request.getParameter("sopnsorpostalCode");
        String sponsorpostboxNo = request.getParameter("sponsorpostboxNo");
        String tenentHistory = request.getParameter("tenentHistory");
        String remarks = request.getParameter("remarks");

        String assetName = request.getParameter("assetName");
        String assetCode = request.getParameter("assetCode");
        String subclassifiedAstno = request.getParameter("subclassifiedAstno");
        String subAssetCode = request.getParameter("subassetCode");

        String buildingNo = request.getParameter("buildingNo");
        String waterBillno = request.getParameter("waterBillno");
        String assetArea = request.getParameter("assetArea");
        String blockNo = request.getParameter("blockNo");
        String plotNo = request.getParameter("plotNo");
        String electricityBillno = request.getParameter("electricityBillno");
        String wayNo = request.getParameter("wayNo");
        String streetNo = request.getParameter("streetNo");
        String assetPostalCode = request.getParameter("assetPostalCode");
        String assetPostboxNo = request.getParameter("assetPostboxNo");

        String contractCode = request.getParameter("contractCode");
        String contractName = request.getParameter("contractName");
        String startsFrom = request.getParameter("startsFrom");
        String endsTo = request.getParameter("endsTo");

        String contractAttachment = request.getParameter("contractAttachment");

        String minimumRentFixed = request.getParameter("minimumRentFixed");
        String quotedRentAmount = request.getParameter("quotedRentAmount");

        String billingCycle = request.getParameter("billingCycle");
        String dueDate = request.getParameter("dueDate");
        String billingCycle1 = request.getParameter("billingCycle1");

        String Attribute1 = request.getParameter("Attribute1");
        String Attribute2 = request.getParameter("Attribute2");
        String Attribute3 = request.getParameter("Attribute3");
        String Attribute4 = request.getParameter("Attribute4");
        String Attribute5 = request.getParameter("Attribute5");
        String action = request.getParameter("action");

        String tenantFilename = request.getParameter("tenantFilename");
        String contractFileName = request.getParameter("contractFileName");

        String status = request.getParameter("status");
        String lastmodifiedDate = request.getParameter("lastmodifiedDate");
        String approvarStatus = "Need Approval";

        if (action == "edit") {
            approvarStatus = "Need Approval";
        }
        if (action == "recheck") {
            approvarStatus = "Need Approval";
        }

        String recordstatus1 = "Occupied";
        String subAssetrecordstatus = "Occupied";

        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());

        Date startsFrom1 = null;
        if (!startsFrom.equals("")) {
            startsFrom1 = (Date) formatter3.parse(startsFrom);
        }

        Date endsTo1 = null;
        if (!endsTo.equals("")) {
            endsTo1 = (Date) formatter3.parse(endsTo);
        }

        Date dueDate1 = null;
        if (!dueDate.equals("")) {
            dueDate1 = (Date) formatter3.parse(dueDate);
        }
        List<Rentquote> gridData = new ArrayList<Rentquote>();

        //Added by Garun to generate rent Quote while recheck
        if (action != null && !action.isEmpty()) {
            if (action.equalsIgnoreCase("recheck")) {
                String str[] = tenantQuoteCode.split("-");
                if (str.length > 2) {
                    int i = Integer.parseInt(str[3]);
                    i = i + 1;
                    tenantQuoteCode = str[0] + "-" + str[1] + "-" + str[2] + "-" + i;
                } else {
                    tenantQuoteCode = tenantQuoteCode + "-REV" + "-" + 1;
                }
            }
        
        }

        if (sno == null || sno == "" || sno.equals("")) {
            MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
            List<MultipartFile> multipartFile1 = multipartRequest1.getFiles("tenantAttachment");
            for (Iterator<MultipartFile> iterator = multipartFile1.iterator(); iterator.hasNext();) {
                MultipartFile test = (MultipartFile) iterator.next();
                tenantFilename = test.getOriginalFilename();

                Rentquote rentquote = new Rentquote(userId, orgId, tenantQuoteCode, tenantType, tenantCategory, tenantFname, tenantLname, tenantCitizenship, tenantId, tenentpostalCode, tenantpostboxNo, test.getBytes(), tenantFilename, jointeeName1, jointeeAddress1, jointeeName2, jointeeAddress2, sponcerName, ifWorking, companyName, companyAddress, tenantCrNo, tenantContactno, tenantWorkContactno, tenantMailid, permanentAddress, correspondenceAddress, sponcerAddress, sopnsorpostalCode, sponsorpostboxNo, tenentHistory, remarks, assetName, assetCode, subclassifiedAstno, buildingNo, electricityBillno, wayNo, blockNo, plotNo, electricityBillno, wayNo, streetNo, contractCode, plotNo, contractCode, contractName, startsFrom1, endsTo1, null, "", minimumRentFixed, quotedRentAmount, billingCycle, dueDate1, "Need Approval", "Direct", "RentQuote Created", "null", "null", "null", "null", "null", "null", "null", "null", "null", "update0", date, subAssetCode);
                gridData.add(rentquote);
                crmDAO.rentQuotesave1(gridData);
                modelMap.addAttribute("success", "true");
            }

        } else {
            int k = Integer.parseInt(status.substring(status.length() - 1));
            k++;
            status = "update" + k;
            MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
            List<MultipartFile> multipartFile1 = multipartRequest1.getFiles("tenantAttachment");
            for (Iterator<MultipartFile> iterator = multipartFile1.iterator(); iterator.hasNext();) {
                MultipartFile test = (MultipartFile) iterator.next();
                tenantFilename = test.getOriginalFilename();
                byte[] test1 = null;
                try {
                    if (tenantFilename == null || tenantFilename == "") {
                        tenantFilename = crmDAO.qtgetFilename(tenantQuoteCode);
                        test1 = crmDAO.qtgetContentAttach(tenantQuoteCode);

                        Rentquote rentquote = new Rentquote(Integer.parseInt(sno), userId, orgId, tenantQuoteCode, tenantType, tenantCategory, tenantFname, tenantLname, tenantCitizenship, tenantId, tenentpostalCode, tenantpostboxNo, test1, tenantFilename, jointeeName1, jointeeAddress1, jointeeName2, jointeeAddress2, sponcerName, ifWorking, companyName, companyAddress, tenantCrNo, contractName, tenantWorkContactno, tenantMailid, permanentAddress, correspondenceAddress, sponcerAddress, sopnsorpostalCode, sponsorpostboxNo, tenentHistory, remarks, assetName, assetCode, subclassifiedAstno, buildingNo, electricityBillno, wayNo, blockNo, plotNo, electricityBillno, wayNo, streetNo, contractCode, plotNo, contractCode, contractName, startsFrom1, endsTo1, null, "", minimumRentFixed, quotedRentAmount, billingCycle, dueDate1, approvarStatus, "Direct", "RentQuote Created", "null", "null", "null", "null", "null", "null", "null", "null", "null", status, date, subAssetCode);
                        crmDAO.RentQuoteSave(rentquote);

                    } else {
                        Rentquote rentquote = new Rentquote(Integer.parseInt(sno), userId, orgId, tenantQuoteCode, tenantType, tenantCategory, tenantFname, tenantLname, tenantCitizenship, tenantId, tenentpostalCode, tenantpostboxNo, test.getBytes(), tenantFilename, jointeeName1, jointeeAddress1, jointeeName2, jointeeAddress2, sponcerName, ifWorking, companyName, companyAddress, tenantCrNo, tenantContactno, tenantWorkContactno, tenantMailid, permanentAddress, correspondenceAddress, sponcerAddress, sopnsorpostalCode, sponsorpostboxNo, tenentHistory, remarks, assetName, assetCode, subclassifiedAstno, buildingNo, electricityBillno, wayNo, blockNo, plotNo, electricityBillno, wayNo, streetNo, contractCode, plotNo, contractCode, contractName, startsFrom1, endsTo1, null, "", minimumRentFixed, quotedRentAmount, billingCycle, dueDate1, approvarStatus, "Direct", "RentQuote Created", "null", "null", "null", "null", "null", "null", "null", "null", "null", status, date, subAssetCode);
                        crmDAO.RentQuoteSave(rentquote);

                    }

                    modelMap.addAttribute("success", "test");
                } catch (Exception ex) {
                }
            }
        }

        Common cm = new Common();
        String subject = "", tbody = "", mailbody = "", email = "", fileName = "", suppAdd = "";
        String userEmail = "yugandharscts@gmail.com";//excelarete@gmail.com
        String password = "yuga@2009";//excel123
        String toEmail = "";
        List<UserRegistration> ud = tenantDetailsDAO.udList("GFC");
        for (UserRegistration udlist : ud) {
            userId = udlist.getUserId();
            email = udlist.getEmail();

            if (!userEmail.isEmpty() && !password.isEmpty() && !email.isEmpty()) {
                StringBuilder emailId = new StringBuilder(email);

                int i = 1;

                tenantFname = tenantFname;
                tenantLname = tenantLname;

                emailId.append(",");
                emailId.append(toEmail);
                String[] sendEmail = emailId.toString().split(",");
                subject = "RentQuote Code: " + tenantQuoteCode;
                String filepath = request.getSession().getServletContext().getRealPath("common\\theme\\images\\logo1.png");
                mailbody = "<html><body>Dear Sir/Madam,<br/><br/><br/>You need to give an approval for RentQuote Details. Tenant Name : " + tenantFname + " " + tenantLname + ""
                        + " Please Approve this RentQuote Details. <br/><br/>If approved ignore this mail. "
                        + "</body>"
                        + "<br/><br/>Thanks & Regards"
                        + "<br/>Al-Hashar Team.</html>";
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                baos.close();
                cm.sendEmail(userEmail, password, sendEmail, subject, mailbody, baos, fileName);

            }
        }
        tenantDetailsDAO.updateSubasset(assetName, subclassifiedAstno, recordstatus1);
        return new ModelAndView(new RedirectView("../CRM/quoteList.htm"), modelMap);
    }

    //==============For Download===============
    @RequestMapping("/CRM/quoteAttachDownload.htm")
    public void quoteAttachDownload(HttpServletRequest req, HttpServletResponse res) throws FileNotFoundException, IOException {
        String sno = req.getParameter("sno");

        Rentquote doc = crmDAO.getQuoteAttach(Integer.parseInt(sno));
        try {
            res.setHeader("Content-Disposition", "inline;filename=\"" + doc.getTenantAttachment() + "\"");
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

    //*********tenant quotaDetails.List**********************
    @RequestMapping("/CRM/sendRQEmail.htm")
    public ModelAndView sendRQEmail(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, MessagingException, DocumentException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String tenantQuoteCode = req.getParameter("tC");
        String tEmail = req.getParameter("tEmail");//Mail,tEmail 
        StringBuilder emailId = new StringBuilder(tEmail);
        Common cm = new Common();
        String subject = "", tbody = "", mailbody = "", pdfbody = "", suppName = "", suppAdd = "";
        String userEmail = "yugandharscts@gmail.com";//excelarete@gmail.com
        String password = "yuga@2009";//excel123
        String toEmail = "";
        String tenantFname = "", RentAmount = "", assetName = "", SubAssetName = "";
        String tenantLname = "", shiptoLoc = "", payTerms = "", delTerms = "", ponote = "", fileName = "";
        Date DueDate = null, reqDate = null;
        Double grandTotal = 0.0;
        if (!userEmail.isEmpty() && !password.isEmpty()) {
            List<Rentquote> td = crmDAO.trdList(userId, tenantQuoteCode);
            if (td.size() > 0) {
                int i = 1;
                String desc = "";
                for (Rentquote trdlist : td) {
                    tbody = tbody + "<tr style='text-align:center;'><td>" + i + "</td>"
                            + "<td>" + trdlist.getTenantQuoteCode() + "</td>"
                            + "<td>" + trdlist.getUserId() + "</td>"
                            + "<td>" + trdlist.getTenantFirstName() + " " + trdlist.getTenantLastName() + "</td>"
                            + "<td>" + trdlist.getContactNo() + "</td>"
                            + "<td>" + trdlist.getTenantCategory() + "</td>"
                            + "<td>" + trdlist.getAssetName() + "</td>"
                            + "<td>" + trdlist.getBillingCycle() + "</td>"
                            + "</tr>";
                    tenantQuoteCode = trdlist.getTenantQuoteCode();
                    userId = trdlist.getUserId();

                    i++;
                }
                emailId.append(",");
                emailId.append(toEmail);
                String[] sendEmail = emailId.toString().split(",");
                subject = "Tenant Code: " + tenantQuoteCode;
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
                        + "                               Tenant Code: " + tenantQuoteCode
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
                        + "                                                         <th>Rent Quote Code</th>"
                        + "                                                         <th>User Id</th>"
                        + "                                                         <th>Tenant Name</th>"
                        + "                                                         <th>Tenant Contact No.</th>"
                        + "                                                         <th>Tenant Category</th>"
                        + "                                                         <th>Asset Name</th>                                        "
                        + "                                                         <th>Billing Cycle </th>"
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
        return new ModelAndView(new RedirectView("quoteList.htm"), modelMap);
    }

    //*********tenant quotaDetails.List**********************
    //======================For Download=====================
    @RequestMapping("/CRM/quoteContractAttachDownload.htm")
    public void quoteContractAttachDownload(HttpServletRequest req, HttpServletResponse res) throws FileNotFoundException, IOException {
        String sno = req.getParameter("sno");

        Rentquote doc = crmDAO.getQuoteAttach(Integer.parseInt(sno));
        try {
            res.setHeader("Content-Disposition", "inline;filename=\"" + doc.getContractAttachment() + "\"");
            OutputStream out = res.getOutputStream();
            res.setContentType("application/force-download");
            byte[] buffer = doc.getContractAttachment();
            InputStream in1 = new ByteArrayInputStream(buffer);
            IOUtils.copy(in1, res.getOutputStream());
            out.flush();
            out.close();
            in1.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //.................................  Reject Process  Quote List    ....................................................
    @RequestMapping("/CRM/quoteReject.htm")
    public ModelAndView quoteReject(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String tenantQuoteCode = request.getParameter("tenantQuoteCode");
        String appstatus = request.getParameter("appstatus");
        String appremarks = request.getParameter("appremarks");
        crmDAO.quoteReject(tenantQuoteCode, appstatus, appremarks);
        return new ModelAndView(new RedirectView("../CRM/quoteDetailsRejList.htm"), map);
    }

    //.................................  Recheck Process  Quote List    ....................................................
    @RequestMapping("/CRM/quoteRecheck.htm")
    public ModelAndView quoteRecheck(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String tenantQuoteCode = request.getParameter("tenantQuoteCode");
        String appstatus = request.getParameter("appstatus");
        String appremarks = request.getParameter("appremarks");
        crmDAO.quoteRecheck(tenantQuoteCode, appstatus, appremarks);
        return new ModelAndView(new RedirectView("../CRM/quoteApprovalProcess.htm"), map);
    }

    //................................. Quote Reject List    ....................................................
    @RequestMapping("/CRM/quoteReject1.htm")
    public ModelAndView quoteReject1(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String tenantQuoteCode = request.getParameter("tenantQuoteCode");
        String appstatus = request.getParameter("appstatus");
        String appremarks = request.getParameter("appremarks");
        crmDAO.quoteReject1(tenantQuoteCode, appstatus, appremarks);
        return new ModelAndView(new RedirectView("../CRM/quoteDetailsRejList.htm"), map);
    }

    //................................. Quote Reject List    ....................................................
    @RequestMapping("/CRM/quoteDetailsRejList.htm")
    public ModelAndView quoteDetailsRejList(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sno = request.getParameter("pk");
        map.addAttribute("quoteDetailsRej", crmDAO.quoteDetailsRej(sno));
        return new ModelAndView("quoteDetailsRejList", map);
    }

    //................................. Quote Reject View    ....................................................
    @RequestMapping("/CRM/qouteDetailsRejForm.htm")
    public ModelAndView tenantDetailsRejForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sno = request.getParameter("pk");
        String tenantQuoteCode = request.getParameter("tenantQuoteCode");
        if (sno != null) {
            modelMap.addAttribute("quoteList", crmDAO.quoteRejectedList(userId, orgId, sno, tenantQuoteCode));
            modelMap.addAttribute("levellist", userDAO.approvallevelList(null, null, null));
        }
        String link = "../CRM/quoteForm.htm";
        String tab = "Rent Quote";
        modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
        modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(null));
        modelMap.addAttribute("quoteFormData", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("quoteDetailsRejForm", modelMap);
    }

    //.................................  Approval Process  Quote List    ....................................................
    @RequestMapping("/CRM/quoteApprovalProcess.htm")
    public ModelAndView quoteApprovalProcess(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("levellist", userDAO.approvallevelList(null, null, null));
        modelMap.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Rent Quote", "Approval 1"));
        modelMap.addAttribute("quoteList", crmDAO.gfcApproved(userId, orgId, null));
        return new ModelAndView("quoteApprovalProcess", modelMap);
    }

    //...........................    Approval Process  Quote Form............................................
    @RequestMapping("/CRM/quoteApprovalProcessForm.htm")
    public ModelAndView quoteApprovalProcessForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        String tenantQuoteCode = request.getParameter("tenantQuoteCode");

        if (SNo != null) {
            modelMap.addAttribute("quoteList", crmDAO.quoteList(userId, orgId, SNo));
            modelMap.addAttribute("levellist", userDAO.approvallevelList(null, null, null));
        }
        String link = "../CRM/quoteForm.htm";
        String tab = "Rent Quote";
        modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
        modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(null));
        modelMap.addAttribute("quoteFormData", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));

        return new ModelAndView("quoteApprovalProcessForm", modelMap);

    }

    //====================ApproveRentQuoteSubmit=============
    @RequestMapping("/CRM/approveRentQuoteSubmit.htm")
    public ModelAndView approveRentQuoteSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String sno = request.getParameter("sno");
        String tenantQuoteCode = request.getParameter("tenantQuoteCode");
        String approverRemarks = request.getParameter("approverRemarks");
        String startsFrom = request.getParameter("startsFrom");
        String endsTo = request.getParameter("endsTo");
        String actualRentFixed = request.getParameter("actualRentFixed");
        String tenantFname1 = request.getParameter("tenantFname");
        String tenantLname1 = request.getParameter("tenantLname");
        //

        String orgName = request.getParameter("orgName");
        String testNo = request.getParameter("testNo");
        String submoduleName = request.getParameter("submoduleName");
        String tabName = request.getParameter("tabName");
        String approvalLevel = request.getParameter("approvalLevel");
        String levelNo = request.getParameter("levelNo");
        String userName = request.getParameter("userName");
        String approvalRole = request.getParameter("approvalRole");
        String Comments = request.getParameter("reviewerComments");
        String status = request.getParameter("status");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        String sNo = request.getParameter("sNo");
        if (sNo != null && !sNo.isEmpty()) {
            crmDAO.updateContractApprove(sNo);
        }
        modelMap.addAttribute("orglist", crmDAO.orglist(null));
        modelMap.addAttribute("levellist", userDAO.approvallevelList(null, null, null));
        crmDAO.updateRentQuot(tenantQuoteCode, "GFC Approved", approverRemarks, actualRentFixed);

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

                StringBuilder emailId = new StringBuilder(email);

                int i = 1;

                tenantFname = tenantFname1;
                tenantLname = tenantLname1;

                emailId.append(",");
                emailId.append(toEmail);
                String[] sendEmail = emailId.toString().split(",");
                subject = "RentQuote Code: " + tenantQuoteCode;
                String filepath = request.getSession().getServletContext().getRealPath("common\\theme\\images\\logo1.png");
                mailbody = "<html><body>Dear Sir/Madam,<br/><br/><br/>You need to give an approval for RentQuote Details. Tenant Name : " + tenantFname + " " + tenantLname + ""
                        + " Please Approve this RentQuote Details. <br/><br/>If approved ignore this mail. "
                        + "</body>"
                        + "<br/><br/>Thanks & Regards"
                        + "<br/>Al-Hashar Team.</html>";
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                baos.close();
                cm.sendEmail(userEmail, password, sendEmail, subject, mailbody, baos, fileName);

            }
        }
        return new ModelAndView(new RedirectView("../CRM/quoteApprovalProcess.htm"), modelMap);
    }

    //====================ReCheckRentQuote=============
    @RequestMapping("/CRM/recheckRentQuoteSubmit.htm")
    public ModelAndView recheckRentQuoteSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String sno = request.getParameter("sno");
        String tenantQuoteCode = request.getParameter("tenantQuoteCode");
        String approverRemarks = request.getParameter("approverRemarks");
        crmDAO.recheckUpdateRentQuot(tenantQuoteCode, "Recheck", approverRemarks);

        return new ModelAndView(new RedirectView("../CRM/quoteApprovalProcess.htm"), modelMap);
    }

    //====================ReCheck RentQuote Submit=============
    @RequestMapping("/CRM/recheckRentQuoteSubmit1.htm")
    public ModelAndView recheckRentQuoteSubmit1(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String sno = request.getParameter("sno");
        String tenantQuoteCode = request.getParameter("tenantQuoteCode");
        String approverRemarks = request.getParameter("approverRemarks");
        crmDAO.recheckUpdateRentQuot1(tenantQuoteCode, "Recheck", approverRemarks);

        return new ModelAndView(new RedirectView("../CRM/quoteApprovalProcess1.htm"), modelMap);
    }

    //.................................CFO  Approval Process  Quote List    ....................................................
    @RequestMapping("/CRM/quoteApprovalProcess1.htm")
    public ModelAndView quoteApprovalProcess1(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("levellist", userDAO.approvallevelList(null, null, null));
        modelMap.addAttribute("cfoApprovalList", crmDAO.cfoQuoteApprovalList(userId, orgId, null));
        modelMap.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Rent Quote", "Approval 2"));
        modelMap.addAttribute("quoteList", crmDAO.quoteList(userId, orgId, null));
        return new ModelAndView("quoteApprovalProcess1", modelMap);
    }

    //........................... CFO   Approval Process  Quote Form............................................
    @RequestMapping("/CRM/quoteApprovalProcessForm1.htm")
    public ModelAndView quoteApprovalProcessForm1(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        String tenantQuoteCode = request.getParameter("tenantQuoteCode");
        if (SNo != null) {
            modelMap.addAttribute("quoteList", crmDAO.quoteList(userId, orgId, SNo));
            modelMap.addAttribute("levellist", userDAO.approvallevelList(null, null, null));
        }
        String link = "../CRM/quoteForm.htm";
        String tab = "Rent Quote";
        modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
        modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(null));
        modelMap.addAttribute("quoteFormData", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));

        return new ModelAndView("quoteApprovalProcessForm1", modelMap);

    }

    //........................... CFO   Approval View  Quote Form............................................
    @RequestMapping("/CRM/quoteApprovalProcessViewForm1.htm")
    public ModelAndView quoteApprovalProcessViewForm1(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        String tenantQuoteCode = request.getParameter("tenantQuoteCode");

        if (SNo != null) {
            modelMap.addAttribute("quoteList", crmDAO.quoteList(userId, orgId, SNo));
            modelMap.addAttribute("levellist", userDAO.approvallevelList(null, null, null));
        }
        String link = "../CRM/quoteForm.htm";
        String tab = "Rent Quote";
        modelMap.addAttribute("quoteFormData", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
        modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(null));
        modelMap.addAttribute("action", request.getParameter("action"));

        return new ModelAndView("quoteApprovalProcessViewForm1", modelMap);

    }

    //==================== CFO ApproveRentQuoteSubmit=============
    @RequestMapping("/CRM/approveRentQuoteSubmit1.htm")
    public ModelAndView approveRentQuoteSubmit1(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String sno = request.getParameter("sno");
        String tenantQuoteCode = request.getParameter("tenantQuoteCode");
        String approverRemarks = request.getParameter("approverRemarks");
        String startsFrom = request.getParameter("startsFrom");
        String endsTo = request.getParameter("endsTo");
        String actualRentFixed = request.getParameter("actualRentFixed");

        crmDAO.updateRentQuot1(tenantQuoteCode, "CFO Approved", approverRemarks, actualRentFixed);

        return new ModelAndView(new RedirectView("../CRM/quoteApprovalProcess1.htm"), modelMap);
    }

    //.............................. Quote Tenant List ....................................
    @RequestMapping("/CRM/quoteTenantList.htm")
    public ModelAndView quoteTenantList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        modelMap.addAttribute("tenantDetails", tenantDetailsDAO.list(sno, "TenantDetails"));

        return new ModelAndView("quoteTenantList", modelMap);
    }

    //================Quote ConvertedTenant Details Viwe Form==============
    @RequestMapping("/CRM/quoteConvertForm.htm")
    public ModelAndView quoteConvertForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        String tenantQuoteCode = request.getParameter("tenantQuoteCode");
        String action = request.getParameter("action");
        if (tenantQuoteCode != null) {
            modelMap.addAttribute("quoteDetailsList", crmDAO.quoteListNew(userId, orgId, tenantQuoteCode));
        }
        String link = "../tenant/tenantDetailsForm.htm";
        String tab = "Tenant Details";
        modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
        modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(null));
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));

        modelMap.addAttribute("tenantType", crmDAO.tenantType());
        modelMap.addAttribute("tenantCategory", crmDAO.tenantCategory());
        modelMap.addAttribute("fileSize", userDAO.fileSize());
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("tenantQuoteCode", tenantQuoteCode);
        modelMap.addAttribute("action", request.getParameter("action"));

        return new ModelAndView("quoteConvertForm", modelMap);

    }

    //================Quote Convert Form Submit==============
    @RequestMapping("/CRM/quoteConvertFormSubmit.htm")
    public ModelAndView quoteConvertFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String tenantQuoteCode = request.getParameter("tenantQuoteCode");
        String quoteRecordStatus = "Tenant Created";
        String recordstatus = "From Quote";

        String pk = "";
        String tenantCode = request.getParameter("tenantCode");
        String llId = request.getParameter("llId");
        String llName = request.getParameter("llName");
        String llCategory = request.getParameter("llCategory");
        String llCrNo = request.getParameter("llCrNo");
        String llContactno = request.getParameter("llContactno");
        String llWorkContactno = request.getParameter("llWorkContactno");
        String llMailid = request.getParameter("llMailid");
        String llAttachment = request.getParameter("llAttachment");
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
        String remarks = request.getParameter("remarks");

        String tenantAttachment = request.getParameter("tenantAttachment");

        String assetName = request.getParameter("assetName");
        String assetCode = request.getParameter("assetCode");
        String subAssetCode = request.getParameter("subassetCode");
        String subclassifiedAstno = request.getParameter("subclassifiedAstno");
        String buildingNo = request.getParameter("buildingNo");
        String wayNo = request.getParameter("wayNo");
        String assetArea = request.getParameter("assetArea");
        String blockNo = request.getParameter("blockNo");
        String plotNo = request.getParameter("plotNo");
        String streetNo = request.getParameter("streetNo");
        String waterBillno = request.getParameter("waterBillno");
        String electricityBillno = request.getParameter("electricityBillno");
        String assetPostalCode = request.getParameter("assetPostalCode");
        String assetPostboxNo = request.getParameter("assetPostboxNo");
        String contractPeriod = request.getParameter("contractPeriod");
        String startsFrom = request.getParameter("startsFrom");
        String endsTo = request.getParameter("endsTo");

        String contractAttachment = request.getParameter("contractAttachment");

        String billingCycle = request.getParameter("billingCycle");
        String advanceAmount = request.getParameter("advanceAmount");
        String dueDate = request.getParameter("dueDate");
        String totalAmount = request.getParameter("totalAmount");
        String contractSigningDate = request.getParameter("contractSigningDate");
        String status = request.getParameter("status");
        String attachmentReference = request.getParameter("attachmentReference");
        String llOrgfileName = request.getParameter("llOrgfileName");
        String tenOrgfileName = request.getParameter("tenantFilename");
        String contOrgfileName = request.getParameter("contractFileName");
        String recordstatus1 = "Occupied";
        String extra1 = request.getParameter("extra1");
        String extra2 = request.getParameter("extra2");
        String extra3 = request.getParameter("extra3");
        String extra4 = request.getParameter("extra4");
        String extra5 = request.getParameter("extra5");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        if (tenantCode == null || tenantCode == "" || "".equals(tenantCode)) {
            ArrayList validuser = (ArrayList) tenantDetailsDAO.getTenantNo(llId);
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
        }
        Date startsFrom1 = null;
        if (!startsFrom.equals("")) {
            startsFrom1 = (Date) formatter3.parse(startsFrom);
        }

        Date endsTo1 = null;
        if (!endsTo.equals("")) {
            endsTo1 = (Date) formatter3.parse(endsTo);
        }

        Date dueDate1 = null;
        if (!dueDate.equals("")) {
            dueDate1 = (Date) formatter3.parse(dueDate);
        }
        Date contractSigningDate1 = null;
        if (!contractSigningDate.equals("")) {
            contractSigningDate1 = (Date) formatter3.parse(contractSigningDate);
        }

        if (pk == null || pk == "" || pk.equals("")) {
            MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
            List<MultipartFile> multipartFile1 = multipartRequest1.getFiles("tenantAttachment");
            for (Iterator<MultipartFile> iterator = multipartFile1.iterator(); iterator.hasNext();) {
                MultipartFile test = (MultipartFile) iterator.next();
                tenOrgfileName = test.getOriginalFilename();
                TenantDetails tenant = new TenantDetails(orgId, userId, tenantCode, llCategory, llName, llId, llCrNo, llContactno, llWorkContactno, llMailid, null, "", tenantType, tenantCategory, tenantFname, tenantLname, tenantCitizenship, tenantId, test.getBytes(), tenOrgfileName, tenantCrNo, companyAddress, postalCode1, tenantContactno, tenantWorkContactno, tenantMailid, permanentAddress, correspondenceAddress, postalCode, postboxNo, sponcerName, sponcerAddress, companyName, postboxNo1, jointeeName1, jointeeAddress1, jointeeName2, jointeeAddress2, remarks, assetCode, assetName, subAssetCode, subclassifiedAstno, buildingNo, wayNo, assetArea, blockNo, plotNo, streetNo, waterBillno, electricityBillno, assetPostalCode, assetPostboxNo, contractPeriod, startsFrom1, endsTo1, null, "", billingCycle, advanceAmount, dueDate1, totalAmount, contractSigningDate1, recordstatus, "Submitted", extra1, extra2, extra3, extra4, extra5, "Update0", today, today);

                tenantDetailsDAO.globalSave(tenant);
                tenantDetailsDAO.updateSubasset(assetCode, subAssetCode, recordstatus1);

                crmDAO.UpdateQuote(tenantQuoteCode, quoteRecordStatus);
            }
        } else {
            MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
            List<MultipartFile> multipartFile1 = multipartRequest1.getFiles("tenantAttachment");
            TenantDetails tenant = null;
            for (Iterator<MultipartFile> iterator = multipartFile1.iterator(); iterator.hasNext();) {
                MultipartFile test = (MultipartFile) iterator.next();
                tenOrgfileName = test.getOriginalFilename();
                byte[] Content1 = null;
                try {
                    if (tenOrgfileName == null || tenOrgfileName == "") {
                        tenOrgfileName = tenantDetailsDAO.getTenOrgfileName(tenantCode);
                        Content1 = tenantDetailsDAO.getTenantAttachment(tenantCode);

                        tenant = new TenantDetails(Integer.parseInt(pk), orgId, userId, tenantCode, llCategory, llName, llId, llCrNo, llContactno, llWorkContactno, llMailid, null, "", tenantType, tenantCategory, tenantFname, tenantLname, tenantCitizenship, tenantId, Content1, tenOrgfileName, tenantCrNo, companyAddress, postalCode1, tenantContactno, tenantWorkContactno, tenantMailid, permanentAddress, correspondenceAddress, postalCode, postboxNo, sponcerName, sponcerAddress, companyName, postboxNo1, jointeeName1, jointeeAddress1, jointeeName2, jointeeAddress2, remarks, assetCode, assetName, subclassifiedAstno, buildingNo, wayNo, assetArea, blockNo, plotNo, streetNo, waterBillno, electricityBillno, assetPostalCode, assetPostboxNo, contractPeriod, startsFrom1, endsTo1, null, "", billingCycle, advanceAmount, dueDate1, totalAmount, contractSigningDate1, recordstatus, "Submitted", extra1, extra2, extra3, extra4, extra5, "Update0", today);
                    } else {
                        tenant = new TenantDetails(Integer.parseInt(pk), orgId, userId, tenantCode, llCategory, llName, llId, llCrNo, llContactno, llWorkContactno, llMailid, null, "", tenantType, tenantCategory, tenantFname, tenantLname, tenantCitizenship, tenantId, test.getBytes(), tenOrgfileName, tenantCrNo, companyAddress, postalCode1, tenantContactno, tenantWorkContactno, tenantMailid, permanentAddress, correspondenceAddress, postalCode, postboxNo, sponcerName, sponcerAddress, companyName, postboxNo1, jointeeName1, jointeeAddress1, jointeeName2, jointeeAddress2, remarks, assetCode, assetName, subclassifiedAstno, buildingNo, wayNo, assetArea, blockNo, plotNo, streetNo, waterBillno, electricityBillno, assetPostalCode, assetPostboxNo, contractPeriod, startsFrom1, endsTo1, null, "", billingCycle, advanceAmount, dueDate1, totalAmount, contractSigningDate1, recordstatus, "Submitted", extra1, extra2, extra3, extra4, extra5, "Update0", today);
                    }
                    tenantDetailsDAO.globalSave(tenant);
                } catch (Exception ex) {
                }

            }
        }

        modelMap.addAttribute("tenantDetails", tenantDetailsDAO.list(pk, "TenantDetails"));
        return new ModelAndView(new RedirectView("../CRM/quoteTenantList.htm"), modelMap);
    }

    //================Quote ConvertedTenant Details Viwe Form==============
    @RequestMapping("/CRM/fromQuoteToTenantDetailsViewForm.htm")
    public ModelAndView fromQuoteToTenantDetailsViewForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        String leadCode = request.getParameter("leadCode");
        String tenantCode = request.getParameter("tenantCode");
        if (SNo != null) {
            modelMap.addAttribute("tenantDetails", crmDAO.tenantDetailsList(tenantCode));
        }
        String link = "../tenant/tenantDetailsForm.htm";
        String tab = "Tenant Details";

        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
        modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(null));
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));

        return new ModelAndView("fromQuoteToTenantDetailsViewForm", modelMap);

    }

    //================Follow Up List ==============
    @RequestMapping("/Lead/followUpList.htm")
    public ModelAndView followUpList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        modelMap.addAttribute("followUpList", crmDAO.list(SNo, "Lead"));
        return new ModelAndView("followUpList", modelMap);
    }

    //.............=============..............   FollowUp Form ..............============..............................
    @RequestMapping("/Lead/followUpForm.htm")
    public ModelAndView followUpForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        String leadCode = request.getParameter("leadCode");
        String contactName = request.getParameter("contactName");
        String assetCode = request.getParameter("assetCode");
        String action = request.getParameter("action");
        if (leadCode != null) {
            modelMap.addAttribute("fetchFolloeUpHistory", crmDAO.fetchFolloeUpHistory(leadCode, assetCode, contactName));
        }
        String link = "../Lead/followUpForm.htm";
        String tab = "Follow Up Details";
        modelMap.addAttribute("FollowUpDate", userDAO.formLabelMapping(link, tab));

        modelMap.addAttribute("SNo", SNo);

        return new ModelAndView("followUpForm", modelMap);

    }

    //................===========................ FollowUp Form Submit  .............============...................
    @RequestMapping("/Lead/followUpFormSubmit.htm")
    public ModelAndView followUpFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();

        String leadName = request.getParameter("leadName");
        String leadCode = request.getParameter("leadCode");
        String assetName = request.getParameter("assetName");
        String assetCode = request.getParameter("assetCode");
        String salesPersonName = request.getParameter("salesPersonName");
        String contactName = request.getParameter("contactName");
        String followUpDate = request.getParameter("followUpDate");
        String followUpRemarks = request.getParameter("followUpRemarks");

        String sno = request.getParameter("sno");
        String status = request.getParameter("status");

        String recordstatus1 = "Folloe Up";
        Date followUpDate1 = null;
        try {
            if (!"".equals(followUpDate) && followUpDate != null) {
                followUpDate1 = (Date) formatter3.parse(followUpDate);
            }
        } catch (NullPointerException ex) {
            ex.printStackTrace();
        }

        List<FollowUp> gridData = new ArrayList<FollowUp>();

        if (sno == null) {
            FollowUp cm = new FollowUp(orgId, userId, leadCode, leadName, assetCode, assetName, contactName, salesPersonName, followUpDate1, followUpRemarks, recordstatus1, "update0", newdate, newdate);
            gridData.add(cm);
            crmDAO.globalSave(cm);
            modelMap.addAttribute("success", "true");
            crmDAO.updateLeadFolloeUpDate(leadCode, assetCode, contactName, followUpDate1);

        } else {

            int k = Integer.parseInt(status.substring(status.length() - 1));
            k++;
            status = "Update" + k;

            FollowUp cm = new FollowUp();
            crmDAO.globalSave(cm);
            modelMap.addAttribute("success", "test");
            crmDAO.updateSubasset(leadCode, assetCode, contactName);
        }

        modelMap.addAttribute("success", "true");

        return new ModelAndView(new RedirectView("followUpList.htm"), modelMap);

    }
//==========================FollowUp History Form===============

    @RequestMapping("/Lead/followUpHistoryForm.htm")
    public ModelAndView followUpHistoryForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        String leadCode = request.getParameter("leadCode");
        String contactName = request.getParameter("contactName");
        String assetCode = request.getParameter("assetCode");
        String action = request.getParameter("action");
        if (leadCode != null) {
            modelMap.addAttribute("followUpHistoryList", crmDAO.followUpHistoryList(leadCode, assetCode, contactName));
        }
        String link = "../Lead/followUpForm.htm";
        String tab = "Follow Up Details";
        modelMap.addAttribute("FollowUpDate", userDAO.formLabelMapping(link, tab));

        modelMap.addAttribute("SNo", SNo);

        return new ModelAndView("followUpHistoryForm", modelMap);

    }
//     // ................................... EMAIL .........................................

    @RequestMapping("/CRM/sendRentQuoteEmail.htm")
    public ModelAndView sendRentQuoteEmail(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, MessagingException, DocumentException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String tenantQuoteCode = req.getParameter("tenantQuoteCode");
        String rqEmail = req.getParameter("email");
        StringBuilder emailId = new StringBuilder(rqEmail);
        Common cm = new Common();
        String subject = "", tbody = "", tbody1 = "", lastname = "", mailbody = "",
                leadsource = "", email = "", contact = "";
        String userEmail = "excelarete@gmail.com";
        String password = "excel123";
        String toEmail = "";
        String TenantName = "", AssetName = "", SubAssetName = "",
                company = "";
        if (!userEmail.isEmpty() && !password.isEmpty()) {

            List<Rentquote> rentQuote = crmDAO.rentQuoteview(tenantQuoteCode, orgId);
            if (rentQuote.size() > 0) {
                int i = 1;

                for (Rentquote rentQuoteList : rentQuote) {
                    tbody = tbody + "<tr style='text-align:center;'><td>" + i + "</td>"
                            + "<td>" + rentQuoteList.getTenantFirstName() + "</td>"
                            + "<td>" + rentQuoteList.getContactNo() + "</td>"
                            + "<td>" + rentQuoteList.getAssetName() + "</td>"
                            + "<td>" + rentQuoteList.getSubClassifiedAssetName() + "</td>"
                            + "<td>" + rentQuoteList.getContractName() + "</td>"
                            + "</tr>";

                    TenantName = rentQuoteList.getTenantFirstName();

                    AssetName = rentQuoteList.getAssetName();

                    SubAssetName = rentQuoteList.getSubClassifiedAssetName();

                    i++;

                }

                emailId.append(",");
                emailId.append(toEmail);
                String[] sendEmail = emailId.toString().split(",");
                subject = "Tenant Code: " + tenantQuoteCode;

                mailbody = "<html><body>Dear Sir/Madam,<br/><br/><br/>Please find attached RENTQUOTE Details.RENTQUOTE NO: " + tenantQuoteCode + " ."
                        + "                         	<br/><br/><br/>"
                        + "                         <head>"
                        + "                             <title></title>"
                        + "                         </head>"
                        + "                         <body>"
                        + "                             <table style='width:100%;border:1px solid black;border-collapse: collapse;'>"
                        + "                         	"
                        + "                         	<tr style='text-align:center;'><td><h3>RENTQUOTE GENERATION</h3></td></tr>"
                        + "                         	</table>"
                        + "                         	"
                        + "                         	<table style='width:100%;border-collapse: collapse;border:1px solid black;'>"
                        + "                         	<tr><td>"
                        + "                               RENTQUOTE NO: " + tenantQuoteCode
                        + "                         <br/> <br/> <br/>	"
                        + "                         	<td> Tenant Name:   "
                        + TenantName
                        + "                          <br/>                        "
                        + "                         "
                        + "                                                         Asset Name: "
                        + AssetName
                        + "                         <br/>"
                        + "                                                         SubAsset Name: "
                        + SubAssetName
                        + "                         <br/> <br/> <br/>   </td>"
                        + "                         	"
                        + "                         <br/> <br/> <br/>	"
                        + "                         	"
                        + "                         	</tr>"
                        + "                         	</table>"
                        + "                         <table style='width:100%;border-collapse: collapse;border:1px solid black;'>"
                        + "<tr style='text-align:left;' ><th>Product Details</th> </tr> "
                        + "                         	</tr>"
                        + "                             </table>"
                        + "                         	"
                        + "                         	 <table border='1px' style='border:1px solid black;width:100%;'>"
                        + "                         	 <tr style='border-bottom:1px solid black;text-align:center;'>"
                        + "                                                         <th>SNO</th>"
                        + "                                                         <th>Tenant</th>"
                        + "                                                         <th>Tenant Contact No.</th>"
                        + "                                                         <th>Asset Name</th>                                        "
                        + "                                                         <th>SubAsset Name</th>"
                        + "                                                         <th>Contract Name</th>"
                        + "                         	 </tr>"
                        + tbody
                        + "                         	 </table>"
                        + ""
                        + "                         <table style='width:100%;border-collapse: collapse;border:1px solid black;'>"
                        + "                         "
                        + "                          "
                        + "                            "
                        + "</body>"
                        + "<br/><br/><br/><br/>If you have any doubts please let us know.</html>";
                cm.sendEmail(userEmail, password, sendEmail, subject, mailbody, null, null);

            }
            modelMap.addAttribute("msg", "Email Sent");
        }

        modelMap.addAttribute("action", req.getParameter("action"));
        return new ModelAndView(new RedirectView("../CRM/quoteList.htm"), modelMap);
    }

    //-------------------------------     MOM   --------------------------------------------------------    
//.................................    MOM List    ....................................................
    @RequestMapping("/CRM/momList.htm")
    public ModelAndView momList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        modelMap.addAttribute("momList", crmDAO.momList());

        return new ModelAndView("momList", modelMap);
    }

    //...........................   Daily Work Sheet  Form ............................................
    @RequestMapping("/CRM/momForm.htm")
    public ModelAndView momForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");

        if (SNo != null) {
            modelMap.addAttribute("momList", crmDAO.list(SNo, "MinutesOfMeeting"));
        }
        String link = "../CRM/momForm.htm";
        String tab = "Minutes Of Meeting";
        modelMap.addAttribute("momdata", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));

        return new ModelAndView("momForm", modelMap);

    }

    //.............................  MOM Form Submit Method (convert) ....................................
    @RequestMapping("/CRM/MOMFormSubmit.htm")
    public ModelAndView MOMFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, IOException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();

        String momCode = request.getParameter("momCode");

        String createdBy = request.getParameter("createdBy");
        String momdate = request.getParameter("momdate");
        String meetingTime = request.getParameter("meetingTime");
        String agenda = request.getParameter("agenda");
        String discussion = request.getParameter("discussion");
        String meetingOutPut = request.getParameter("meetingOutPut");

        String Members[] = request.getParameterValues("Members");
        String Designation[] = request.getParameterValues("Designation");

        String closedBy = request.getParameter("closedBy");
        String status = request.getParameter("status");
        String sno = request.getParameter("sno");
        String dt[] = request.getParameterValues("lastmodifiedDate");
        String recordStatus = "FromMOM";

        List<MinutesOfMeeting> gridData = new ArrayList<MinutesOfMeeting>();
        Date momdate1 = null;
        try {
            if (!"".equals(momdate) && momdate != null) {
                momdate1 = (Date) formatter3.parse(momdate);
            }
        } catch (NullPointerException ex) {
            ex.printStackTrace();
        }

        if (momCode.isEmpty()) {
            ArrayList validuser = (ArrayList) crmDAO.momCodeCheck(createdBy);
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

            momCode = "MOM" + "-" + ordno;
        }

        if (sno == null) {

            for (int i = 0; i < Members.length; i++) {

                MinutesOfMeeting mom = new MinutesOfMeeting(orgId, userId, momCode, createdBy, momdate1, meetingTime, agenda, discussion, meetingOutPut, Members[i], Designation[i], closedBy, "null", "null", "null", "null", "null", newdate, recordStatus, "update0", newdate);
                crmDAO.globalSave(mom);

            }

        } else {

        }

        modelMap.addAttribute("success", "true");

        return new ModelAndView(new RedirectView("../CRM/momList.htm"), modelMap);
    }

    //...........................   Daily Work Sheet  Form ............................................
    @RequestMapping("/CRM/momViewForm.htm")
    public ModelAndView momViewForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        String momCode = request.getParameter("momCode");

        if (momCode != null) {
            modelMap.addAttribute("momViewList", crmDAO.momViewList(userId, orgId, momCode));
            modelMap.addAttribute("momList", crmDAO.list(SNo, "MinuteOfMeeting"));
        }
        String link = "../CRM/momForm.htm";
        String tab = "Minutes Of Meeting";
        modelMap.addAttribute("momdata", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));

        return new ModelAndView("momViewForm", modelMap);

    }

    //-------------------------------     Daily Work Sheet   --------------------------------------------------------    
//.................................    Daily worksheet List    ....................................................
    @RequestMapping("/CRM/dailyWorkSheet.htm")
    public ModelAndView dailyWorkSheet(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");

        modelMap.addAttribute("dailyWorkSheet", crmDAO.list(SNo, "DailyWorkSheet"));
        return new ModelAndView("dailyWorkSheet", modelMap);
    }

    //...........................   Daily Work Sheet  Form ............................................
    @RequestMapping("/CRM/dailyWorkSheetForm.htm")
    public ModelAndView dailyWorkSheetForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");

        if (SNo != null) {
            modelMap.addAttribute("dailyWorkSheet", crmDAO.list(SNo, "DailyWorkSheet"));
        }
        String link = "../CRM/dailyWorkSheetForm.htm";
        String tab = "Daily Worksheet";

        modelMap.addAttribute("dailyWorkSheetData_dropDown_category", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("dailyWorkSheetData", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));

        return new ModelAndView("dailyWorkSheetForm", modelMap);

    }

    //.............................  Daily Worksheet Form Submit Method  ....................................
    @RequestMapping("/CRM/dailyWorkshtFormSubmit.htm")
    public ModelAndView dailyWorkshtFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();

        String dwsCode = request.getParameter("dwsCode");
        String empName = request.getParameter("empName");
        String empCode = request.getParameter("empCode");
        String Date = request.getParameter("sheetDate");
        String leadname = request.getParameter("leadName");
        String timeIn = request.getParameter("timeIn");
        String timeOut = request.getParameter("timeOut");
        String followUp = request.getParameter("followUp");
        String followUpHistory = request.getParameter("followUpHistory");
        String stage = request.getParameter("stage");
        String remarks = request.getParameter("remarks");
        String description = request.getParameter("description");
        String sno = request.getParameter("sno");
        String status = request.getParameter("status");
        String dt[] = request.getParameterValues("lastmodifiedDate");
        String creationDate = request.getParameter("creationDate");
        String recordStatus = "WorkSheet";
        List<DailyWorkSheet> gridData = new ArrayList<DailyWorkSheet>();
        Date Date1 = null;
        try {
            if (!"".equals(Date) && Date != null) {
                Date1 = (Date) formatter3.parse(Date);
            }
        } catch (NullPointerException ex) {
            ex.printStackTrace();
        }
        Date creationDate1 = null;
        try {
            if (!"".equals(creationDate) && creationDate != null) {
                creationDate1 = (Date) formatter3.parse(creationDate);
            }
        } catch (NullPointerException ex) {
            ex.printStackTrace();
        }

        Date followUp1 = null;
        try {
            if (!"".equals(followUp) && followUp != null) {
                followUp1 = (Date) formatter3.parse(followUp);
            }
        } catch (NullPointerException ex) {
            ex.printStackTrace();
        }
        if (dwsCode.isEmpty()) {
            ArrayList validuser = (ArrayList) crmDAO.dwscodeCkeck(empName);
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

            dwsCode = "DWS" + "-" + ordno;
        }
        if (sno == null) {

            DailyWorkSheet dws = new DailyWorkSheet(orgId, userId, dwsCode, empName, empCode, Date1, leadname, timeIn, timeOut, followUp1, followUpHistory, stage, remarks, "null", "null", "null", "null", "null", date, recordStatus, "update0", date);
            crmDAO.globalSave(dws);

        } else {
            int k = Integer.parseInt(status.substring(status.length() - 1));
            k++;
            status = "update" + k;
            DailyWorkSheet dws = new DailyWorkSheet(Integer.parseInt(sno), orgId, userId, dwsCode, empName, empCode, Date1, leadname, timeIn, timeOut, followUp1, followUpHistory, stage, remarks, "null", "null", "null", "null", "null", date, recordStatus, "update0", date);
            crmDAO.globalSave(dws);

        }

        modelMap.addAttribute("success", "true");
        return new ModelAndView(new RedirectView("dailyWorkSheet.htm"), modelMap);

    }

    //-------------------------------     Monthly Work Sheet   --------------------------------------------------------    
//.................................    Monthly worksheet List    ....................................................
    @RequestMapping("/CRM/monthlyWorkSheet.htm")
    public ModelAndView monthlyWorkSheet(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        modelMap.addAttribute("monthlyWorkSheet", crmDAO.list(SNo, "MonthlyWorkSheet"));

        return new ModelAndView("monthlyWorkSheet", modelMap);
    }

    //...........................   Monthly Work Sheet  Form ............................................
    @RequestMapping("/CRM/monthlyWorkSheetForm.htm")
    public ModelAndView monthlyWorkSheetForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        String mwsCode = request.getParameter("mwsCode");

        if (SNo != null) {
            modelMap.addAttribute("monthlyWorkSheetListData", crmDAO.monthlyDetailsList(userId, orgId, mwsCode));
            modelMap.addAttribute("monthlyWorkSheetList", crmDAO.list(SNo, "MonthlyWorkSheet"));
        }
        String link = "../CRM/monthlyWorkSheetForm.htm";
        String tab = "Monthly Worksheet";
        modelMap.addAttribute("monthlyWorkSheet", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));

        return new ModelAndView("monthlyWorkSheetForm", modelMap);

    }

    //--------------------------------- Popup to select Lead details --------------- 
    @RequestMapping("/CRM/selectLeadDetails.htm")
    public ModelAndView selectLeadDetails(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String id2 = req.getParameter("x");
        String[] xxt = id2.split("'");
        String followUp = xxt[1].concat("followUpMM");
        modelMap.addAttribute("id2", id2);
        modelMap.addAttribute("followUp", followUp);
        //  modelMap.addAttribute("leadmanagmentList", crmDAO.leadmanagmentList(userId, orgId, null));
        modelMap.addAttribute("leadmanagmentList", crmDAO.leadComDeatils());
        return new ModelAndView("selectLeadDetails", modelMap);
    }

    //................................  Lead Details Monthly ..........................
    @RequestMapping("/CRM/selectLeaddetailsMM.htm")
    public ModelAndView selectLeaddetailsMM(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        // String group=req.getParameter("group");
        String rowid = req.getParameter("rowid");
        String category = req.getParameter("cat");

        modelMap.addAttribute("rowid", rowid);
        modelMap.addAttribute("LeadList", crmDAO.leadComDeatils());
        return new ModelAndView("selectLeaddetailsMM", modelMap);
    }

    //.............................  Daily Worksheet Form Submit Method  ....................................
    @RequestMapping("/CRM/monthlyworkshtFormSubmit.htm")
    public ModelAndView monthlyworkshtFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String recordStatus = "Created";

        String mwsCode = request.getParameter("mwsCode");
        String empName = request.getParameter("empName");
        String empCode = request.getParameter("empCode");
        String year = request.getParameter("workYear");
        String month = request.getParameter("workMonth");

        String workDate[] = request.getParameterValues("workDate");
        String leadName[] = request.getParameterValues("leadName");
        String source[] = request.getParameterValues("source");
        String remarks[] = request.getParameterValues("remarks");
        String followUp[] = request.getParameterValues("followUp");
        String workWith[] = request.getParameterValues("workWith");

        String sno = request.getParameter("sno");
        String status = request.getParameter("status");
        String dt[] = request.getParameterValues("lastmodifiedDate");
        List<MonthlyWorkSheet> gridData = new ArrayList<MonthlyWorkSheet>();
        Date workDate1 = null;

        if (mwsCode.isEmpty()) {
            ArrayList validuser = (ArrayList) crmDAO.mwscodeCkeck(empName);
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

            mwsCode = "MWS" + "-" + ordno;
        }

        if (sno == null) {
            for (int i = 0; i < leadName.length; i++) {

                MonthlyWorkSheet dws = new MonthlyWorkSheet(orgId, userId, mwsCode, empName, empCode, year, month, workDate[i], leadName[i], source[i], remarks[i], followUp[i], workWith[i], "null", "null", "null", "null", "null", newdate, recordStatus, "update0", newdate);
                crmDAO.globalSave(dws);
            }

        } else {
            int k = Integer.parseInt(status.substring(status.length() - 1));
            k++;
            status = "update" + k;
            MonthlyWorkSheet cmp = new MonthlyWorkSheet();
            crmDAO.globalSave(gridData);

        }

        modelMap.addAttribute("success", "true");
        return new ModelAndView(new RedirectView("monthlyWorkSheet.htm"), modelMap);

    }

    /*   
     Check for tenant Id and Tenant CR No Exist or not  
     : Added by Garun
     */
    // Start
    @RequestMapping("/CRM/checkTenenatId.htm")
    public void checkTenenatId(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        HttpSession session = req.getSession(true);
        String tenantId = req.getParameter("tenantId");
        crmDAO.checkTenenatId(req, res, tenantId);
    }

    @RequestMapping("/CRM/checkTenenatCRId.htm")
    public void checkTenenatCRId(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        HttpSession session = req.getSession(true);
        String tenantCrNo = req.getParameter("tenantCrNo");
        crmDAO.checkTenenatCRId(req, res, tenantCrNo);
    }

    @RequestMapping("/CRM/checkCampaignName.htm")
    public void checkCampaignName(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        HttpSession session = req.getSession(true);
        String campaignName = req.getParameter("campaignName");
        crmDAO.checkCampaignName(req, res, campaignName);
    }
    //End

    /* 
     to select subasset details  -added by Garun  
     Reason: Change in /tenant/selectSubAssVocateetDetails.htm can be affect on tenant Details
    
     */
    @RequestMapping("/CRM/selectSubAssetDetailsQuote.htm")
    public ModelAndView selectSubAssetDetailsQuote(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String assetCode = req.getParameter("assetCode");
        String tenantCategory = req.getParameter("tenantCategory");
        modelMap.addAttribute("selectSubAssetDetails", crmDAO.selectSubAssetDetails(assetCode, tenantCategory));
        return new ModelAndView("selectSubAssetDetailsQuote", modelMap);
    }

    @RequestMapping("/CRM/complaintApprovedList.htm")
    public ModelAndView complaintApprovedList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        modelMap.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Complaints", "Approval 2"));
        modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
        modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(null));
        modelMap.addAttribute("mdApprovalList", crmDAO.ApprovedList(userId, orgId, null));
//        modelMap.addAttribute("complaintList", crmDAO.list(SNo, "Complaints"));
        return new ModelAndView("complaintApprovedList", modelMap);
    }

    @RequestMapping("/CRM/complaintApprovedForm.htm")
    public ModelAndView complaintApprovedForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");

        if (SNo != null) {
            String complaintNo2 = request.getParameter("complaintNo");
            modelMap.addAttribute("complaintList", crmDAO.list(SNo, "Complaints"));
        }
        String link = "../CRM/complaintApprovedForm.htm";
        String tab = "Approved Complaints";
        modelMap.addAttribute("complaintFormData", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
        modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(null));
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("complaintApprovedForm", modelMap);

    }

    @RequestMapping("/CRM/crmAttachDownload.htm")
    public void crmAttachDownload(HttpServletRequest req, HttpServletResponse res) throws FileNotFoundException, IOException {
        String sno = req.getParameter("SNo");

        CampaignAttachment doc = crmDAO.getCAMAttach1(Integer.parseInt(sno));
        try {
            res.setHeader("Content-Disposition", "inline;filename=\"" + doc.getFileName() + "\"");
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

    //AMC 

    @RequestMapping("/AMC/AMCMaintenanceList.htm")
    public ModelAndView AMCMaintenanceList(HttpServletRequest request, HttpServletResponse response) {

     // ModelMap modelMap = new ModelMap();
        //  HttpSession session = request.getSession(true);
        //String orgId = session.getAttribute("orgId").toString();
        // String userId = session.getAttribute("userId").toString();
        // String roleName = session.getAttribute("userRole").toString();
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String SNo = request.getParameter("SNo");
        String tabName = "AMC Management";
        String submoduleName = "AMC Management";
        modelMap.addAttribute("amcTypePermission", crmDAO.permmenus(orgId, roleName, submoduleName, tabName));
        //modelMap.addAttribute("amcTypeList", masterDAO.lists("", "AMCType"));
        modelMap.addAttribute("AMCMaintenanceList", crmDAO.amcListActives("", "AMCMaintenance"));

      //  modelMap.addAttribute("AMCMaintenanceList", crmDAO.amcMaintenances(SNo));
        //  modelMap.addAttribute("permission", crmDAO.permmenus(orgId, roleName, submoduleName, tabName));
        // modelMap.addAttribute("permission", crmDAO.permmenus(orgId, roleName, submoduleName, tabName));
        //modelMap.addAttribute("amcTypeList", masterDAO.lists("", "AMCType"));
        //  modelMap.addAttribute("AMCMaintenanceList", crmDAO.listActives("", "AMCMaintenance"));
        // modelMap.addAttribute("AMCMaintenanceList", crmDAO.dellocList(SNo));
        return new ModelAndView("../AMC/AMCMaintenanceList", modelMap);
    }

    //AMC type Form

    @RequestMapping("/AMC/AMCMaintenanceForm.htm")
    public ModelAndView AMCMaintenanceForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String SNo = request.getParameter("pk");
        
        String propName = request.getParameter("propName");
        String orderNo = null;
        
        if (propName == null || propName == "" || "".equals(propName)) {
            ArrayList validuser = (ArrayList) crmDAO.getAmcNo(propName);
            String orderNo2 = null;
            String orderNo1[] = null;
            int ordno = 1;
            if (!(validuser.isEmpty())) {
                for (Iterator<AMCMaintenance> iter = validuser.iterator(); iter.hasNext();) {
                    orderNo = iter.next().getAmcId();
                }
                
                 //orderNo1 = orderNo2.split("-"); 
                
            }
           if (orderNo != null) {
               
                orderNo1 = orderNo.split("-");
            ordno = Integer.parseInt(orderNo1[1]) + 1;
        }
        orderNo = "AMC" + "-" + ordno;
       }
//        String orderNo2 = null;
//        String[] orderNo1 = null;
//        int ordno = 1;
//        if (!(validuser.isEmpty())) {
//            for (Iterator<AMCMaintenance> iter = validuser.iterator(); iter.hasNext();) {
//                orderNo = iter.next().getAmcId();
//            }
//            //orderNo1 = orderNo2.split("-");
//        }
//        if (orderNo != null) {
//            orderNo1 = orderNo.split("-");
//            ordno = Integer.parseInt(orderNo1[1]) + 1;
//        }
//        orderNo = "AMC" + "-" + ordno;
//        }
		
            modelMap.addAttribute("amcId",orderNo);
        
        if (SNo != null) {
            modelMap.addAttribute("AMCMaintenanceList", crmDAO.AMCMaintenanceList(Integer.parseInt(SNo)));
        }
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("orglist", userDAO.orglistNameWise(null));
        modelMap.addAttribute("amcorglist", crmDAO.amcTypeListMarch(null));
        modelMap.addAttribute("action", request.getParameter("action"));
       
        
        
        
        return new ModelAndView("../AMC/AMCMaintenanceForm", modelMap);
    }

    //newly created by lakshmi for AMC Quality Check
    @RequestMapping("/AMC/AMCMaintenanceFormEdit.htm")
    public ModelAndView AMCMaintenanceFormEdit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String SNo = request.getParameter("pk");
        if (SNo != null) {
            modelMap.addAttribute("AMCMaintenanceList", crmDAO.AMCMaintenanceList(Integer.parseInt(SNo)));
        }
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("orglist", userDAO.orglistNameWise(null));
        modelMap.addAttribute("amcorglist", crmDAO.amcTypeListMarch(null));
        modelMap.addAttribute("action", request.getParameter("action"));
       // ModelMap modelMap = new ModelMap();
        //String sno = request.getParameter("pk");
        // HttpSession session = request.getSession();
        //String orgId = session.getAttribute("orgId").toString();
        //String link = "../master/amcTypeForm.htm";
        // String tab = "AMC Maintenance";
        //  if (sno != null && !sno.isEmpty()) {
        //     modelMap.addAttribute("amcTypeList", masterDAO.lists(sno, "AMCType"));
        //     modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        // }
        // modelMap.addAttribute("amcTypeList", userDAO.formLabelMapping(link, tab));
        //.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        //modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../AMC/AMCMaintenanceFormEdit", modelMap);
    }
//    AMC Submit

    @RequestMapping("/AMC/AMCMaintenanceFormSubmit.htm")
    public ModelAndView AMCMaintenanceFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
        HttpSession session = request.getSession();
        
        String assetCode = request.getParameter("assetCode");
        String assetName = request.getParameter("assetName");
        String amcId = request.getParameter("amcId");
        String amcType = request.getParameter("amcType");
        String serviceArea = request.getParameter("serviceArea");
        String unitNo = request.getParameter("unitNo");
        String utilityArea = request.getParameter("utilityArea");
        String chooseUnit = request.getParameter("chooseUnit");
        String serviceName = request.getParameter("serviceName");
        String serviceDesc = request.getParameter("serviceDesc");
        String schedule = request.getParameter("schedule");
        String dueDate = request.getParameter("dueDate");
        String amcDate = request.getParameter("amcDate");
        String priority = request.getParameter("priority");
        String responsibility = request.getParameter("responsibility");
        String approvedCost = request.getParameter("approvedCost");
        String contactPerson = request.getParameter("contactPerson");
        String amsStatus = request.getParameter("amsStatus");
        String status = request.getParameter("status");
        
        String actualCost = request.getParameter("actualCost");
        
        String docAttachment  = request.getParameter("docAttachment");
        
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultipartFile multipartFile = multipartRequest.getFile("xlfile");
        String fileName = "";
        if (multipartFile.getSize() > 0) {
            try {
                InputStream inputStream = null;
                OutputStream outputStream = null;
                inputStream = multipartFile.getInputStream();
                fileName = request.getRealPath("") + File.separator + "reportfiles" + File.separator + multipartFile.getOriginalFilename();
                outputStream = new FileOutputStream(fileName);
                docAttachment = multipartFile.getOriginalFilename();
                int readBytes = 0;
                byte[] buffer = new byte[10000000];
                while ((readBytes = inputStream.read(buffer, 0, 10000000)) != -1) {
                    outputStream.write(buffer, 0, readBytes);
                }
                outputStream.close();
                inputStream.close();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        
//        String propertyName = request.getParameter("propName");
//        String unit = request.getParameter("unit");
//        
//        
//        String vendor = request.getParameter("vendor");
//        String cost = request.getParameter("cost");
//        String assignedTo = request.getParameter("assignedTo");
//        
//        
//        String workDescription = request.getParameter("workDescription");
//        
//        
//        String qiFeedBack = request.getParameter("qifeedback");
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        Date dueDate1 = null;
//        if (null != dueDate && !"".equals(dueDate)) {
//            dueDate1 = (Date) formatter2.parse(dueDate); 
//        }
        
         Date amcDate1 = null;
//        if (null != amcDate && !"".equals(amcDate)) {
//            amcDate1 = (Date) formatter2.parse(amcDate);
//        }

        if (pk == null) {
        
            
            AMCMaintenance aMCMaintenance = new AMCMaintenance(assetCode, assetName, amcId, amcType, serviceArea, unitNo, utilityArea, chooseUnit, 
                    serviceName, serviceDesc,schedule,newdate,newdate,priority,responsibility,approvedCost,null,contactPerson,"Pending",
                    docAttachment,"update0",today,orgId, userId);
            //AMCMaintenance aMCMaintenance = new AMCMaintenance(amcType, propertyName, unit, schedule, vendor, cost, assignedTo, priority, 
            //   dueDate1, workDescription, contactPerson, amsStatus, today,"update0", orgId, userId);

            // AMCType amcTypes = new AMCType(amcType, schedule, vendor, cost, amcDescription, "update0", orgId, userId);
           crmDAO.AMCMaintenanceSave(aMCMaintenance);
        } else {
//            AMCMaintenance aMCMaintenance = new AMCMaintenance(Integer.parseInt(pk), assetCode, assetName, amcId, amcType, serviceArea, unitNo, utilityArea, chooseUnit, 
//                    serviceName, serviceDesc,schedule,dueDate1,amcDate1,priority,responsibility,approvedCost,null,contactPerson,amsStatus,
//                    docAttachment,"update0",today,orgId, userId);
//
//            // AMCType amctypes = new AMCType(Integer.parseInt(pk), amcType, schedule, vendor, cost, amcDescription, status, orgId, userId);
//            crmDAO.AMCMaintenanceSave(aMCMaintenance);

                crmDAO.updateStausAmcManagement(pk, actualCost, amsStatus, userId);
        }
        ModelMap modelMap = new ModelMap();

        //modelMap.addAttribute("category", amctypedao.list(pk, "Category"));
        return new ModelAndView(new RedirectView("../AMC/AMCMaintenanceList.htm"), modelMap);

    }

    //Newly added by lakshmi for AMC Quality check 
    @RequestMapping("/AMC/AMCMaintenanceFormEditSubmit.htm")
    public ModelAndView AMCMaintenanceFormEditSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
        HttpSession session = request.getSession();
        String amcType = request.getParameter("amcType");
        String propertyName = request.getParameter("propName");
        String unit = request.getParameter("unit");
        String schedule = request.getParameter("schedule");
        String vendor = request.getParameter("vendor");
        String cost = request.getParameter("cost");
        String assignedTo = request.getParameter("assignedTo");
        String priority = request.getParameter("priority");
        String dueDate = request.getParameter("dueDate");
        String workDescription = request.getParameter("workDescription");
        String contactPerson = request.getParameter("contactPerson");
        String amsStatus = request.getParameter("amsStatus");
        String status = request.getParameter("status");
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");
        String qiFeedBack = request.getParameter("qifeedback");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        Date dueDate1 = null;
        if (null != dueDate && !"".equals(dueDate)) {
            dueDate1 = (Date) formatter2.parse(dueDate);
        }

        if (pk == null) {
           // AMCMaintenance aMCMaintenance = new AMCMaintenance(amcType, propertyName, unit, schedule, vendor, cost, assignedTo, priority, dueDate1, "update0", orgId, userId, workDescription, contactPerson, amsStatus, qiFeedBack, today);
            //AMCMaintenance aMCMaintenance = new AMCMaintenance(amcType, propertyName, unit, schedule, vendor, cost, assignedTo, priority, 
            //   dueDate1, workDescription, contactPerson, amsStatus, today,"update0", orgId, userId);

            // AMCType amcTypes = new AMCType(amcType, schedule, vendor, cost, amcDescription, "update0", orgId, userId);
        //    crmDAO.AMCMaintenanceSave(aMCMaintenance);
        } else {
          //  AMCMaintenance aMCMaintenance = new AMCMaintenance(Integer.parseInt(pk), amcType, propertyName, unit, schedule, vendor, cost, assignedTo, priority,
             //       dueDate1, "update0", orgId, userId, workDescription, contactPerson, amsStatus, qiFeedBack, today);

            // AMCType amctypes = new AMCType(Integer.parseInt(pk), amcType, schedule, vendor, cost, amcDescription, status, orgId, userId);
          //  crmDAO.AMCMaintenanceSave(aMCMaintenance);
        }
        ModelMap modelMap = new ModelMap();

        //modelMap.addAttribute("category", amctypedao.list(pk, "Category"));
        return new ModelAndView(new RedirectView("../AMC/AMCQualityCheckList.htm"), modelMap);

    }

    //this is AMC Maintenance
    //AMC 
    @RequestMapping("/AMC/AMCQualityCheckList.htm")
    public ModelAndView AMCQualityCheckList(HttpServletRequest request, HttpServletResponse response) {

        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String SNo = request.getParameter("SNo");
        String tabName = "AMC Management";
        String submoduleName = "AMC Management";
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        if (fromDate != null && toDate != null) {
            if (fromDate.contains("frdate") && toDate.contains("todate")) {
                fromDate = null;
                toDate = null;
            }
        }

        if (fromDate == null || toDate == null) {

            //modelMap.addAttribute("amcTypeList", masterDAO.lists("", "AMCType"));
            modelMap.addAttribute("AMCMaintenanceList", crmDAO.amcListActives("", "AMCMaintenance"));
        } else {
            modelMap.addAttribute("AMCMaintenanceList", crmDAO.amcListActives1("", "AMCMaintenance",fromDate,toDate));
        }

//        ModelMap modelMap = new ModelMap();
//        HttpSession session = request.getSession();
//        String orgId = session.getAttribute("orgId").toString();
//        String userId = session.getAttribute("userId").toString();
//        
//        String roleName = session.getAttribute("userRole").toString();
//        String tabName = "AMC QualityCheck";
//        String submoduleName = "AMC Management";
//        modelMap.addAttribute("AMCpermission", crmDAO.AMCpermmenus(orgId, roleName, submoduleName, tabName));
//        //modelMap.addAttribute("amcTypeList", masterDAO.lists("", "AMCType"));
//       modelMap.addAttribute("AMCQualityCheckLists", crmDAO.AMClistActives("", "AMCQualityCheck"));
        modelMap.addAttribute("amcTypePermission", crmDAO.permmenus(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../AMC/AMCQualityCheckList", modelMap);
    }

    //AMC type Form

    @RequestMapping("/AMC/AMCQualityCheckForm.htm")
    public ModelAndView AMCQualityCheckForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {

//        ModelMap modelMap = new ModelMap();
//        String sno = request.getParameter("pk");
//        HttpSession session = request.getSession();
//        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String SNo = request.getParameter("pk");
        if (SNo != null) {
            modelMap.addAttribute("AMCQualityCheckLists", crmDAO.AMCQualityCheckList(Integer.parseInt(SNo)));
        }
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("orglist", userDAO.orglistNameWise(null));
        modelMap.addAttribute("amcorglist", crmDAO.amcTypeListMarch(null));
        modelMap.addAttribute("action", request.getParameter("action"));
        //String link = "../master/amcTypeForm.htm";
        // String tab = "AMC Maintenance";
        //  if (sno != null && !sno.isEmpty()) {
        //     modelMap.addAttribute("amcTypeList", masterDAO.lists(sno, "AMCType"));
        //     modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        // }
        // modelMap.addAttribute("amcTypeList", userDAO.formLabelMapping(link, tab));
        //.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        //modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../AMC/AMCQualityCheckForm", modelMap);
    }
//    AMC Submit

    @RequestMapping("/AMC/AMCQualityCheckFormSubmit.htm")
    public ModelAndView AMCQualityCheckFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
        HttpSession session = request.getSession();
        String amcType = request.getParameter("amcType");
        String propertyName = request.getParameter("propName");
        String unit = request.getParameter("unit");
        String invoiceNo = request.getParameter("invoiceNo");
        String vendor = request.getParameter("vendor");
        String cost = request.getParameter("cost");
        String assignedTo = request.getParameter("assignedTo");
        String priority = request.getParameter("priority");
        String dueDate = request.getParameter("dueDate");
        String workDescription = request.getParameter("workDescription");
        String qifeedback = request.getParameter("qifeedback");
        String amsStatus = request.getParameter("amsStatus");
        String status = request.getParameter("status");
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");

        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());

        Date dueDate1 = null;
        if (null != dueDate && !"".equals(dueDate)) {
            dueDate1 = (Date) formatter2.parse(dueDate);
        }

        if (pk == null) {
            AMCQualityCheck aMCqualityCheck = new AMCQualityCheck(amcType, propertyName, unit, invoiceNo, vendor, cost, assignedTo, priority, dueDate1, "update0", orgId, userId, workDescription, qifeedback, amsStatus);
            //AMCMaintenance aMCMaintenance = new AMCMaintenance(amcType, propertyName, unit, schedule, vendor, cost, assignedTo, priority, 
            //   dueDate1, workDescription, contactPerson, amsStatus, today,"update0", orgId, userId);

            // AMCType amcTypes = new AMCType(amcType, schedule, vendor, cost, amcDescription, "update0", orgId, userId);
            crmDAO.AMCQualitySave(aMCqualityCheck);
        } else {
            AMCQualityCheck aMCqualityCheck = new AMCQualityCheck(Integer.parseInt(pk), amcType, propertyName, unit, invoiceNo, vendor, cost, assignedTo, priority,
                    dueDate1, "update0", orgId, userId, workDescription, qifeedback, amsStatus);

            // AMCType amctypes = new AMCType(Integer.parseInt(pk), amcType, schedule, vendor, cost, amcDescription, status, orgId, userId);
            crmDAO.AMCQualitySave(aMCqualityCheck);
        }
        ModelMap modelMap = new ModelMap();

        //modelMap.addAttribute("category", amctypedao.list(pk, "Category"));
        return new ModelAndView(new RedirectView("../AMC/AMCQualityCheckList.htm"), modelMap);

    }
//this is a amc jobs
    //AMC 

    @RequestMapping("/AMC/AMCJobsList.htm")
    public ModelAndView AMCJobsList(HttpServletRequest request, HttpServletResponse response) {

        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();

        String roleName = session.getAttribute("userRole").toString();
        String tabName = "AMC Jobs";
        String submoduleName = "AMC Management";
        modelMap.addAttribute("AMCjobspermission", crmDAO.AMCjobspermmenus(orgId, roleName, submoduleName, tabName));
        //modelMap.addAttribute("amcTypeList", masterDAO.lists("", "AMCType"));
        modelMap.addAttribute("AMCJobsList", crmDAO.AMCjobslistActives("", "AMCJobs"));
        return new ModelAndView("../AMC/AMCJobsList", modelMap);
    }

    //AMC type Form

    @RequestMapping("/AMC/AMCJobsForm.htm")
    public ModelAndView AMCJobsForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {

//        ModelMap modelMap = new ModelMap();
//        String sno = request.getParameter("pk");
//        HttpSession session = request.getSession();
//        String orgId = session.getAttribute("orgId").toString();
        //String link = "../master/amcTypeForm.htm";
        // String tab = "AMC Maintenance";
        //  if (sno != null && !sno.isEmpty()) {
        //     modelMap.addAttribute("amcTypeList", masterDAO.lists(sno, "AMCType"));
        //     modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        // }
        // modelMap.addAttribute("amcTypeList", userDAO.formLabelMapping(link, tab));
        //.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        //modelMap.addAttribute("action", request.getParameter("action"));
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String SNo = request.getParameter("pk");
        if (SNo != null) {
            modelMap.addAttribute("AMCJobsList", crmDAO.AMCJobCheckList(Integer.parseInt(SNo)));
        }
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("orglist", userDAO.orglistNameWise(null));
        modelMap.addAttribute("amcorglist", crmDAO.amcTypeListMarch(null));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../AMC/AMCJobsForm", modelMap);
    }
//    AMC Submit

    @RequestMapping("/AMC/AMCJobsFormSubmit.htm")
    public ModelAndView AMCJobsFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
        HttpSession session = request.getSession();
        String amcType = request.getParameter("amcType");
        String propertyName = request.getParameter("propName");
        String unit = request.getParameter("unit");
        String invoiceNo = request.getParameter("invoiceNo");
        String vendor = request.getParameter("vendor");
        String cost = request.getParameter("cost");
        String assignedTo = request.getParameter("assignedTo");
        String priority = request.getParameter("priority");
        String dueDate = request.getParameter("dueDate");
        String nextAmcDate = request.getParameter("nextAmcDate");
        String workDescription = request.getParameter("workDescription");
        String contactPerson = request.getParameter("contactPerson");
        String amsStatus = request.getParameter("amsStatus");
        String status = request.getParameter("status");
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");

        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());

        Date dueDate1 = null;
        Date nextAmcDate1 = null;
        if (null != dueDate && !"".equals(dueDate)) {
            dueDate1 = (Date) formatter2.parse(dueDate);
        }
        if (null != nextAmcDate && !"".equals(nextAmcDate)) {
            nextAmcDate1 = (Date) formatter2.parse(nextAmcDate);
        }
        

        if (pk == null) {
            AMCJobs aMAMCJobs = new AMCJobs(amcType, propertyName, unit, invoiceNo, vendor, cost, assignedTo, priority, dueDate1, "update0", orgId, userId, workDescription, contactPerson, amsStatus,nextAmcDate1,today);
            //AMCMaintenance aMCMaintenance = new AMCMaintenance(amcType, propertyName, unit, schedule, vendor, cost, assignedTo, priority, 
            //   dueDate1, workDescription, contactPerson, amsStatus, today,"update0", orgId, userId);

            // AMCType amcTypes = new AMCType(amcType, schedule, vendor, cost, amcDescription, "update0", orgId, userId);
            crmDAO.AMCJobsSave(aMAMCJobs);
        } else {
            AMCJobs aMAMCJobs = new AMCJobs(Integer.parseInt(pk), amcType, propertyName, unit, invoiceNo, vendor, cost, assignedTo, priority,
                    dueDate1, "update0", orgId, userId, workDescription, contactPerson, amsStatus,nextAmcDate1,today);

            // AMCType amctypes = new AMCType(Integer.parseInt(pk), amcType, schedule, vendor, cost, amcDescription, status, orgId, userId);
            crmDAO.AMCJobsSave(aMAMCJobs);
        }
        ModelMap modelMap = new ModelMap();

        //modelMap.addAttribute("category", amctypedao.list(pk, "Category"));
        return new ModelAndView(new RedirectView("../AMC/AMCJobsList.htm"), modelMap);

    }


//    //AMC 
//     @RequestMapping("/AMC/AMCMaintenanceList.htm")
//    public ModelAndView AMCMaintenanceList(HttpServletRequest request, HttpServletResponse response) {
//
//        ModelMap modelMap = new ModelMap();
//        HttpSession session = request.getSession();
//        String orgId = session.getAttribute("orgId").toString();
//        String userId = session.getAttribute("userId").toString();
//        String roleName = session.getAttribute("userRole").toString();
//        String tabName = "AMC Management";
//        String submoduleName = "AMC Management";
//        modelMap.addAttribute("permission", crmDAO.permmenus(orgId, roleName, submoduleName, tabName));
//        //modelMap.addAttribute("amcTypeList", masterDAO.lists("", "AMCType"));
//       modelMap.addAttribute("AMCMaintenanceList", crmDAO.listActives("", "AMCMaintenance"));
//        return new ModelAndView("../AMC/AMCMaintenanceList", modelMap);
//    }
//    //AMC type Form
//    @RequestMapping("/AMC/AMCMaintenanceForm.htm")
//    public ModelAndView AMCMaintenanceForm(HttpServletRequest request, HttpServletResponse response) {
//        ModelMap modelMap = new ModelMap();
//        String sno = request.getParameter("pk");
//        HttpSession session = request.getSession();
//        String orgId = session.getAttribute("orgId").toString();
//        //String link = "../master/amcTypeForm.htm";
//       // String tab = "AMC Maintenance";
//      //  if (sno != null && !sno.isEmpty()) {
//       //     modelMap.addAttribute("amcTypeList", masterDAO.lists(sno, "AMCType"));
//       //     modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
//       // }
//      // modelMap.addAttribute("amcTypeList", userDAO.formLabelMapping(link, tab));
//        //.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
//        //modelMap.addAttribute("action", request.getParameter("action"));
//        return new ModelAndView("../AMC/AMCMaintenanceForm", modelMap);
//    }
////    AMC Submit
//    @RequestMapping("/AMC/AMCMaintenanceFormSubmit.htm")
//    public ModelAndView AMCMaintenanceFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
//        HttpSession session = request.getSession();
//        String amcType = request.getParameter("amcType");
//        String propertyName = request.getParameter("propertyName");
//        String unit = request.getParameter("unit");
//        String schedule = request.getParameter("schedule");
//        String vendor = request.getParameter("vendor");
//        String cost = request.getParameter("cost");
//        String assignedTo = request.getParameter("assignedTo");
//        String priority = request.getParameter("priority");
//        String dueDate = request.getParameter("dueDate");
//        String workDescription = request.getParameter("workDescription");
//        String contactPerson = request.getParameter("contactPerson");
//        String amsStatus = request.getParameter("amsStatus");
//        String status = request.getParameter("status");
//        String userId = session.getAttribute("userId").toString();
//        String orgId = session.getAttribute("orgId").toString();
//        String pk = request.getParameter("pk");
//        java.util.Date today = new java.util.Date();
//        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
//            Date dueDate1 = null;
//            if (null != dueDate && !"".equals(dueDate)) {
//                dueDate1 = (Date) formatter2.parse(dueDate);
//            }
//
//        if (pk == null) {
//            AMCMaintenance aMCMaintenance = new AMCMaintenance(amcType, propertyName, unit, schedule, vendor, cost, assignedTo, priority, dueDate1, "update0", orgId, userId, workDescription, contactPerson, amsStatus);
//            //AMCMaintenance aMCMaintenance = new AMCMaintenance(amcType, propertyName, unit, schedule, vendor, cost, assignedTo, priority, 
//                 //   dueDate1, workDescription, contactPerson, amsStatus, today,"update0", orgId, userId);
//
//           // AMCType amcTypes = new AMCType(amcType, schedule, vendor, cost, amcDescription, "update0", orgId, userId);
//           crmDAO.AMCMaintenanceSave(aMCMaintenance);
//        } else {
//            AMCMaintenance aMCMaintenance = new AMCMaintenance(Integer.parseInt(pk), amcType, propertyName, unit, schedule, vendor, cost, assignedTo, priority, 
//                    dueDate1, "update0", orgId, userId, workDescription, contactPerson, amsStatus);
//            
//
//           // AMCType amctypes = new AMCType(Integer.parseInt(pk), amcType, schedule, vendor, cost, amcDescription, status, orgId, userId);
//            crmDAO.AMCMaintenanceSave(aMCMaintenance);
//        }
//        ModelMap modelMap = new ModelMap();
//        
//        //modelMap.addAttribute("category", amctypedao.list(pk, "Category"));
//        return new ModelAndView(new RedirectView("../AMC/AMCMaintenanceList.htm"), modelMap);
//        
//    }
//    
//    
//    //this is AMC Maintenance
//    
//    //AMC 
//     @RequestMapping("/AMC/AMCQualityCheckList.htm")
//    public ModelAndView AMCQualityCheckList(HttpServletRequest request, HttpServletResponse response) {
//
//        ModelMap modelMap = new ModelMap();
//        HttpSession session = request.getSession();
//        String orgId = session.getAttribute("orgId").toString();
//        String userId = session.getAttribute("userId").toString();
//        
//        String roleName = session.getAttribute("userRole").toString();
//        String tabName = "AMC QualityCheck";
//        String submoduleName = "AMC Management";
//        modelMap.addAttribute("AMCpermission", crmDAO.AMCpermmenus(orgId, roleName, submoduleName, tabName));
//        //modelMap.addAttribute("amcTypeList", masterDAO.lists("", "AMCType"));
//       modelMap.addAttribute("AMCQualityCheckLists", crmDAO.AMClistActives("", "AMCQualityCheck"));
//        return new ModelAndView("../AMC/AMCQualityCheckList", modelMap);
//    }
//    //AMC type Form
//    @RequestMapping("/AMC/AMCQualityCheckForm.htm")
//    public ModelAndView AMCQualityCheckForm(HttpServletRequest request, HttpServletResponse response) {
//
//        ModelMap modelMap = new ModelMap();
//        String sno = request.getParameter("pk");
//        HttpSession session = request.getSession();
//        String orgId = session.getAttribute("orgId").toString();
//        //String link = "../master/amcTypeForm.htm";
//       // String tab = "AMC Maintenance";
//      //  if (sno != null && !sno.isEmpty()) {
//       //     modelMap.addAttribute("amcTypeList", masterDAO.lists(sno, "AMCType"));
//       //     modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
//       // }
//      // modelMap.addAttribute("amcTypeList", userDAO.formLabelMapping(link, tab));
//        //.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
//        //modelMap.addAttribute("action", request.getParameter("action"));
//        return new ModelAndView("../AMC/AMCQualityCheckForm", modelMap);
//    }
////    AMC Submit
//    @RequestMapping("/AMC/AMCQualityCheckFormSubmit.htm")
//    public ModelAndView AMCQualityCheckFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
//        HttpSession session = request.getSession();
//        String amcType = request.getParameter("amcType");
//        String propertyName = request.getParameter("propertyName");
//        String unit = request.getParameter("unit");
//        String invoiceNo = request.getParameter("invoiceNo");
//        String vendor = request.getParameter("vendor");
//        String cost = request.getParameter("cost");
//        String assignedTo = request.getParameter("assignedTo");
//        String priority = request.getParameter("priority");
//        String dueDate = request.getParameter("dueDate");
//        String workDescription = request.getParameter("workDescription");
//        String qifeedback = request.getParameter("qifeedback");
//        String amsStatus = request.getParameter("amsStatus");
//        String status = request.getParameter("status");
//        String userId = session.getAttribute("userId").toString();
//        String orgId = session.getAttribute("orgId").toString();
//        String pk = request.getParameter("pk");
//
//        java.util.Date today = new java.util.Date();
//        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
//
//         Date dueDate1 = null;
//            if (null != dueDate && !"".equals(dueDate)) {
//                dueDate1 = (Date) formatter2.parse(dueDate);
//            }
//
//        if (pk == null) {
//            AMCQualityCheck aMCqualityCheck = new AMCQualityCheck(amcType, propertyName, unit, invoiceNo, vendor, cost, assignedTo, priority, dueDate1, "update0", orgId, userId, workDescription, qifeedback, amsStatus);
//            //AMCMaintenance aMCMaintenance = new AMCMaintenance(amcType, propertyName, unit, schedule, vendor, cost, assignedTo, priority, 
//                 //   dueDate1, workDescription, contactPerson, amsStatus, today,"update0", orgId, userId);
//
//           // AMCType amcTypes = new AMCType(amcType, schedule, vendor, cost, amcDescription, "update0", orgId, userId);
//           crmDAO.AMCQualitySave(aMCqualityCheck);
//        } else {
//            AMCQualityCheck aMCqualityCheck = new AMCQualityCheck(Integer.parseInt(pk), amcType, propertyName, unit, invoiceNo, vendor, cost, assignedTo, priority, 
//                    dueDate1, "update0", orgId, userId, workDescription, qifeedback, amsStatus);
//            
//
//           // AMCType amctypes = new AMCType(Integer.parseInt(pk), amcType, schedule, vendor, cost, amcDescription, status, orgId, userId);
//            crmDAO.AMCQualitySave(aMCqualityCheck);
//        }
//        ModelMap modelMap = new ModelMap();
//        
//        //modelMap.addAttribute("category", amctypedao.list(pk, "Category"));
//        return new ModelAndView(new RedirectView("../AMC/AMCQualityCheckList.htm"), modelMap);
//        
//    }
////this is a amc jobs
//    //AMC 
//     @RequestMapping("/AMC/AMCJobsList.htm")
//    public ModelAndView AMCJobsList(HttpServletRequest request, HttpServletResponse response) {
//
//        ModelMap modelMap = new ModelMap();
//        HttpSession session = request.getSession();
//        String orgId = session.getAttribute("orgId").toString();
//        String userId = session.getAttribute("userId").toString();
//        
//        String roleName = session.getAttribute("userRole").toString();
//        String tabName = "AMC Jobs";
//        String submoduleName = "AMC Management";
//        modelMap.addAttribute("AMCjobspermission", crmDAO.AMCjobspermmenus(orgId, roleName, submoduleName, tabName));
//        //modelMap.addAttribute("amcTypeList", masterDAO.lists("", "AMCType"));
//       modelMap.addAttribute("AMCJobsList", crmDAO.AMCjobslistActives("", "AMCJobs"));
//       return new ModelAndView("../AMC/AMCJobsList", modelMap);
//    }
//    //AMC type Form
//    @RequestMapping("/AMC/AMCJobsForm.htm")
//    public ModelAndView AMCJobsForm(HttpServletRequest request, HttpServletResponse response) {
//
//        ModelMap modelMap = new ModelMap();
//        String sno = request.getParameter("pk");
//        HttpSession session = request.getSession();
//        String orgId = session.getAttribute("orgId").toString();
//        //String link = "../master/amcTypeForm.htm";
//       // String tab = "AMC Maintenance";
//      //  if (sno != null && !sno.isEmpty()) {
//       //     modelMap.addAttribute("amcTypeList", masterDAO.lists(sno, "AMCType"));
//       //     modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
//       // }
//      // modelMap.addAttribute("amcTypeList", userDAO.formLabelMapping(link, tab));
//        //.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
//        //modelMap.addAttribute("action", request.getParameter("action"));
//        return new ModelAndView("../AMC/AMCJobsForm", modelMap);
//    }
////    AMC Submit
//    @RequestMapping("/AMC/AMCJobsFormSubmit.htm")
//    public ModelAndView AMCJobsFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
//        HttpSession session = request.getSession();
//        String amcType = request.getParameter("amcType");
//        String propertyName = request.getParameter("propertyName");
//        String unit = request.getParameter("unit");
//        String invoiceNo = request.getParameter("invoiceNo");
//        String vendor = request.getParameter("vendor");
//        String cost = request.getParameter("cost");
//        String assignedTo = request.getParameter("assignedTo");
//        String priority = request.getParameter("priority");
//        String dueDate = request.getParameter("dueDate");
//        String workDescription = request.getParameter("workDescription");
//        String contactPerson = request.getParameter("contactPerson");
//        String amsStatus = request.getParameter("amsStatus");
//        String status = request.getParameter("status");
//        String userId = session.getAttribute("userId").toString();
//        String orgId = session.getAttribute("orgId").toString();
//        String pk = request.getParameter("pk");
//
//        java.util.Date today = new java.util.Date();
//        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
//
//         Date dueDate1 = null;
//            if (null != dueDate && !"".equals(dueDate)) {
//                dueDate1 = (Date) formatter2.parse(dueDate);
//            }
//
//        if (pk == null) {
//            AMCJobs aMAMCJobs = new AMCJobs(amcType, propertyName, unit, invoiceNo, vendor, cost, assignedTo, priority, dueDate1, "update0", orgId, userId, workDescription, contactPerson, amsStatus);
//            //AMCMaintenance aMCMaintenance = new AMCMaintenance(amcType, propertyName, unit, schedule, vendor, cost, assignedTo, priority, 
//                 //   dueDate1, workDescription, contactPerson, amsStatus, today,"update0", orgId, userId);
//
//           // AMCType amcTypes = new AMCType(amcType, schedule, vendor, cost, amcDescription, "update0", orgId, userId);
//           crmDAO.AMCJobsSave(aMAMCJobs);
//        } else {
//            AMCJobs aMAMCJobs = new AMCJobs(Integer.parseInt(pk), amcType, propertyName, unit, invoiceNo, vendor, cost, assignedTo, priority, 
//                    dueDate1, "update0", orgId, userId, workDescription, contactPerson, amsStatus);
//            
//
//           // AMCType amctypes = new AMCType(Integer.parseInt(pk), amcType, schedule, vendor, cost, amcDescription, status, orgId, userId);
//            crmDAO.AMCJobsSave(aMAMCJobs);
//        }
//        ModelMap modelMap = new ModelMap();
//        
//        //modelMap.addAttribute("category", amctypedao.list(pk, "Category"));
//        return new ModelAndView(new RedirectView("../AMC/AMCJobsList.htm"), modelMap);
//        
//    }}

         @RequestMapping("/AMC/generalMaintenanceMgmtList.htm")
    public ModelAndView generalMaintenanceMgmtList(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String status = request.getParameter("status");
        String propName = request.getParameter("propName");
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");

       
      //  map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Building History Management", "Building History Management"));
      
      map.addAttribute("gmmlist", crmDAO.gmmlist(null));
        
        return new ModelAndView("../AMC/generalMaintenanceMgmtList", map);
    }
    
    @RequestMapping("/AMC/generalMaintenanceMgmtForm.htm")
    public ModelAndView generalMaintenanceMgmtForm(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String status = request.getParameter("status");
        String propName = request.getParameter("propName");
        String fromDate = request.getParameter("fromDate");
        String pk = request.getParameter("pk");
        
        String orderNo=null;
        if (propName == null || propName == "" || "".equals(propName)) {
            ArrayList validuser = (ArrayList) crmDAO.getServiceNo(propName);
 /*           String orderNo2 = null;
            String orderNo1[] = null;
            int ordno = 1;
            if (!(validuser.isEmpty())) {
                for (Iterator<GMM> iter = validuser.iterator(); iter.hasNext();) {
                    orderNo2 = iter.next().getServiceReqNo();
                }
                
                 orderNo1 = orderNo2.split("-");
                
            }
            if (orderNo2 != null) {
                
                ordno = Integer.parseInt(orderNo1[1]) + 1;
            }
            propName = "SR" + "-" + ordno;  */
            
        String orderNo2 = null;
        String[] orderNo1 = null;
        int ordno = 1;
        if (!(validuser.isEmpty())) {
            for (Iterator<GMM> iter = validuser.iterator(); iter.hasNext();) {
                orderNo = iter.next().getServiceReqNo();
            }
            //orderNo1 = orderNo2.split("-");
        }
        if (orderNo != null) {
            orderNo1 = orderNo.split("-");
            ordno = Integer.parseInt(orderNo1[1]) + 1;
        }
        orderNo = "SR" + "-" + ordno;
        }
		
                        map.addAttribute("srCode",orderNo);

            if(pk !=null){
            
            map.addAttribute("gmmlist", crmDAO.gmmlist(pk));
            
            }
       
            map.addAttribute("action", request.getParameter("action"));
            
      //  map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Building History Management", "Building History Management"));
        
        return new ModelAndView("../AMC/generalMaintenanceMgmtForm", map);
    }
    @RequestMapping("/AMC/generalMaintenanceMgmtEdit.htm")
    public ModelAndView generalMaintenanceMgmtEdit(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String status = request.getParameter("status");
        String propName = request.getParameter("propName");
        String fromDate = request.getParameter("fromDate");
        String pk = request.getParameter("pk");
        System.out.println("pk:"+pk);
           if(pk !=null){
            
            map.addAttribute("gmmlist", crmDAO.gmmlist(pk));
            
            }
       
            map.addAttribute("action", request.getParameter("action"));
            
      //  map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Building History Management", "Building History Management"));
        
        return new ModelAndView("../AMC/generalformmaintenanceEdit", map);
    }
    @RequestMapping("/AMC/gmmapprove.htm")
    public ModelAndView generalMaintenanceMgmtApprove(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String status = request.getParameter("status");
        String propName = request.getParameter("propName");
        String fromDate = request.getParameter("fromDate");
        String pk = request.getParameter("pk");
        System.out.println("pk:"+pk);
           if(pk !=null){
            
            map.addAttribute("gmmlist", crmDAO.gmmlist(pk));
            
            }
       
            map.addAttribute("action", request.getParameter("action"));
            
      //  map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Building History Management", "Building History Management"));
        
        return new ModelAndView("../AMC/gmmapprove", map);
    }
     @RequestMapping("/AMC/generalMaintenanceMgmtView.htm")
    public ModelAndView generalMaintenanceMgmtView(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String status = request.getParameter("status");
        String propName = request.getParameter("propName");
        String fromDate = request.getParameter("fromDate");
        String pk = request.getParameter("pk");
           if(pk !=null){
            
            map.addAttribute("gmmlist", crmDAO.gmmlist(pk));
            
            }
       
            map.addAttribute("action", request.getParameter("action"));
            
      //  map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Building History Management", "Building History Management"));
        
        return new ModelAndView("../AMC/generalmaintenanceformView", map);
    }
    
    @RequestMapping("/AMC/amcJobTrackingList.htm")
    public ModelAndView amcJobTrackingList(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String status = request.getParameter("status");
        String propName = request.getParameter("propName");
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");

       
      //  map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Building History Management", "Building History Management"));
        
        return new ModelAndView("../AMC/amcJobTrackingList", map);
    }
    
    @RequestMapping("/AMC/amcJobPendingJobsList.htm")
    public ModelAndView amcJobTrackingForm(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String status = request.getParameter("status");
        String propName = request.getParameter("propName");
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");

       
      //  map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Building History Management", "Building History Management"));
      
      map.addAttribute("AMCMaintenanceList", crmDAO.amcListActives("", "AMCMaintenance"));
        
        return new ModelAndView("../AMC/amcJobPendingJobsList", map);
    }
    
    @RequestMapping("/AMC/amcJobClosedJobsList.htm")
    public ModelAndView amcJobClosedJobsList(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String status = request.getParameter("status");
        String propName = request.getParameter("propName");
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");

       
      //  map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Building History Management", "Building History Management"));
      
      map.addAttribute("AMCMaintenanceList", crmDAO.amcListActives("", "AMCMaintenance"));
        
        return new ModelAndView("../AMC/amcJobClosedJobsList", map);
    }
    
    @RequestMapping("/AMC/amcJobOnholdJobsList.htm")
    public ModelAndView amcJobOnholdJobsList(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String status = request.getParameter("status");
        String propName = request.getParameter("propName");
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");

       
      //  map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Building History Management", "Building History Management"));
      
      map.addAttribute("AMCMaintenanceList", crmDAO.amcListActives("", "AMCMaintenance"));
        
        return new ModelAndView("../AMC/amcJobOnholdJobsList", map);
    }
    
    @RequestMapping("/AMC/amcJobCanceledJobsList.htm")
    public ModelAndView amcJobCanceledJobsList(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String status = request.getParameter("status");
        String propName = request.getParameter("propName");
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");

       
      //  map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Building History Management", "Building History Management"));
      
      map.addAttribute("AMCMaintenanceList", crmDAO.amcListActives("", "AMCMaintenance"));
        
        return new ModelAndView("../AMC/amcJobCanceledJobsList", map);
    }
    
    @RequestMapping("/CRM/noticeAndRemainder.htm")
    public ModelAndView noticeAndRemainder(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        ModelMap modelMap = new ModelMap();
          String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        
        return new ModelAndView("noticeAndRemainder", modelMap);
    }
    
    @RequestMapping("/CRM/commissionCalculation.htm")
    public ModelAndView commissionCalculation(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        ModelMap modelMap = new ModelMap();
          String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        
        return new ModelAndView("commissionCalculation", modelMap);
    }

    
     @RequestMapping("/AMC/gmmFormSubmit.htm")
    public ModelAndView gmmFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("SNo");
        String assetCode = request.getParameter("assetCode");
        String assetName = request.getParameter("assetName");
        String serviceNo = request.getParameter("serviceNo");
        String serviceReqDate = request.getParameter("serviceReqDate");
        String serviceArea = request.getParameter("serviceArea");
        String unitNo = request.getParameter("unitNo");
        String serviceName = request.getParameter("serviceName");
        String serviceDesc = request.getParameter("serviceDesc");
        String approvedBudget = request.getParameter("approvedBudget");
        String deadLine = request.getParameter("deadLine");
        String actualCost = request.getParameter("actualCost");
        String remarks = request.getParameter("remarks");
        
        
        
        Date p3Date = null;
        Date p4Date = null;
        if (!"".equals(serviceReqDate) && serviceReqDate != null) {
            p3Date = (Date) f.parse(serviceReqDate);
        }
        ///newly added by lakshmi///
        if (!"".equals(deadLine) && deadLine != null) {
            p4Date = (Date) f.parse(deadLine);
        }
        
        List<GMM> gridData = new ArrayList<GMM>();
 
        if(pk == null){
            GMM gm = null;
            gm = new GMM(orgId, userId, assetCode, assetName, serviceNo, p3Date, serviceArea, unitNo, serviceName, serviceDesc, approvedBudget, p4Date,
                    actualCost, remarks, "Active", newdate);
            
            crmDAO.gmmSave(gridData);
            crmDAO.assegmmSave(gm);
        }else{
            
            
            crmDAO.updateStausGmmManagement(pk, actualCost, remarks, userId);
        }
        
        return new ModelAndView(new RedirectView("../AMC/generalMaintenanceMgmtList.htm"), modelMap);
    }
    
     @RequestMapping("/AMC/updateStausAmcManagement.htm")
    public ModelAndView updateStausAmcManagement(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("SNo");
        String assetCode = request.getParameter("assetCode");
        String assetName = request.getParameter("assetName");
        String serviceNo = request.getParameter("serviceNo");
        
        return new ModelAndView(new RedirectView("../AMC/AMCMaintenanceList.htm"), modelMap);
    }
    
//    @RequestMapping("/CRM/rentQuoteFormSubmitNew.htm")
//    public ModelAndView rentQuoteFormSubmitNew(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, UnsupportedEncodingException, ParseException {       
//        ModelMap modelMap = new ModelMap();
//        HttpSession session = request.getSession(true);
//        
//        request.setCharacterEncoding("UTF-8");
//        response.setCharacterEncoding("UTF-8");
//        String userId = session.getAttribute("userId").toString();
//        String orgId = session.getAttribute("orgId").toString();
//        
//        //Quotation Details
//        String quotationSNo = request.getParameter("quotationSNo");
//        String quotationNo = request.getParameter("quotationNumber");
//        String quotationDate = request.getParameter("quotationDate");
//        String quotationExpiry = request.getParameter("quotationExpiry");
//        String currency = request.getParameter("currency");
//        
//        //Property Details
//        String propertySNo = request.getParameter("propertySNo");
//        String propertyCode = request.getParameter("assetCode");
//        String propertyName = request.getParameter("assetName");
//        String tenancyStartDate = request.getParameter("tenancyStartDate");
//        String tenancyEndDate = request.getParameter("tenancyEndDate");
//        String floor = request.getParameter("mezzanineFloor");
//        String unitName = request.getParameter("assetType1");
//        String baseRent = request.getParameter("baserent");
//
//        //Customer/Tenancy Details
//        String customerSNo = request.getParameter("customerSNo");
//        String customerType = request.getParameter("customerType");
//        String customerName = request.getParameter("customerName");
//        String tenantId = request.getParameter("tenantId");
//        String businessName = request.getParameter("businessName");
//        String businessCRNo = request.getParameter("businessCRNo");
//        String contactPerson[] = request.getParameterValues("contactPerson");
//        String emailId[] = request.getParameterValues("registeredEmailID");
//        String PhoneNo[] = request.getParameterValues("phoneNo");
//        
//        //Rent Details
//        String rentSNo[] = request.getParameterValues("rentSNo");
//        String unitNo[] = request.getParameterValues("unitNo");
//        String rentPeriod[] = request.getParameterValues("rentPeriod");
//        String chargesQuoted[] = request.getParameterValues("chargesQuoted");
//        String vatPerc[] = request.getParameterValues("vatPerc");
//        String vatAmount[] = request.getParameterValues("vatAmount");
//        String totalAmount[] = request.getParameterValues("totalAmount");
//        
//        //Service Details
//        String serviceSNo[] = request.getParameterValues("serviceSNo");
//        String serviceCatg[] = request.getParameterValues("serviceCategory");
//        String serviceName[] = request.getParameterValues("serviceName");
//        String serviceChargesQuoted[] = request.getParameterValues("serviceChargesQuoted");
//        String serviceVatPerc[] = request.getParameterValues("serviceVatPerc");
//        String serviceVatAmount[] = request.getParameterValues("serviceVatAmount");
//        String serviceTotalAmount[] = request.getParameterValues("serviceTotalAmount");
//        String securityDeposit = request.getParameter("securityDeposit");
//        String advance = request.getParameter("advance");
//        
//        //Terms & Condition
//        String termsSNo = request.getParameter("termsSNo");
//        String paymentTerms = request.getParameter("paymentTerms");
//        String contractTerms = request.getParameter( "contactTerms");           
//         Date quotationExpiry1  = null;
//
//        String originalImg = null;
//        
//        List<QuotationDetails> quotationList = new ArrayList<QuotationDetails>();
//        
//        Date quotationDate1  = null;
//            try {
//                if (!"".equals(quotationDate) && quotationDate != null) {
//                    quotationDate1 = (Date) f.parse(quotationDate);
//                }
//            } catch (NullPointerException ex) {
//            }
//
//            
//            try {
//                if (!"".equals(quotationExpiry) && quotationExpiry != null) {
//                    quotationExpiry1 = (Date) f.parse(quotationExpiry);
//                }
//            } catch (NullPointerException ex) {
//            }
//            
//  
//        if(quotationSNo == null || quotationSNo == "") {
//            QuotationDetails quotationDetails = null;
//            quotationDetails = new QuotationDetails(orgId, userId, quotationNo, quotationDate1, quotationExpiry1, currency, "Rent Quote Created", sqlTimestamp);
//
//            crmDAO.quotationDetailsSave(quotationDetails);
//        } else {
//                
//                
//        }
//                 
//        List<PropertyDetails> propertyList = new ArrayList<PropertyDetails>();
//        Date  tenancyStartDate1 = null;
//            try {
//                if (!"".equals( tenancyStartDate) &&  tenancyStartDate!= null) {
//                     tenancyStartDate1= (Date) f.parse( tenancyStartDate);
//                }
//            } catch (NullPointerException ex) {
//            }
//
//            Date  tenancyEndDate1  = null;
//            try {
//                if (!"".equals( tenancyEndDate) &&  tenancyEndDate != null) {
//                    tenancyEndDate1 = (Date) f.parse( tenancyEndDate);
//                }
//            } catch (NullPointerException ex) {
//            }
//            
//       if(propertySNo == null || propertySNo == "") {
//            PropertyDetails propertyDetails = null;
//            propertyDetails = new PropertyDetails(orgId, userId, propertyCode, propertyName, tenancyStartDate1, tenancyEndDate1, floor, unitName, baseRent, 
//                    "Rent Quote Created", sqlTimestamp, quotationNo, customerName);
//                
//            crmDAO.PropertyDetailsSave(propertyDetails);
//        }
//            
//        List<CustomerTenacyDetails> customerList = new ArrayList<CustomerTenacyDetails>();
//        for(int i = 0; i < contactPerson.length; i++) {
//            if(customerSNo == null || customerSNo == "") {
//            CustomerTenacyDetails customerTenacyDetails = null;
//            customerTenacyDetails = new CustomerTenacyDetails(orgId, userId, customerType, customerName, tenantId, 
//                    businessName, businessCRNo, contactPerson[i], emailId[i], PhoneNo[i], "Rent Quote Created", sqlTimestamp, quotationNo);
//         
//            crmDAO.CustomerTenacyDetailsSave(customerTenacyDetails);
//                       
//        } else {
//            CustomerTenacyDetails customerTenacyDetails = null;
//            customerTenacyDetails = new CustomerTenacyDetails(Integer.parseInt(customerSNo),orgId, userId, customerType, customerName, tenantId, 
//                    businessName, businessCRNo, contactPerson[i], emailId[i], PhoneNo[i], "Rent Quote Created", sqlTimestamp, quotationNo);         
//          crmDAO.CustomerTenacyDetailsSave(customerTenacyDetails);
//            
//         }
//        }
//        
//        List<RentDetails> rentList = new ArrayList<RentDetails>();
//        try {
//            for(int i = 0; i < unitNo.length; i++) {
//                if(!"".equals(rentSNo[i]) || rentSNo[i] != null) {
//                    RentDetails rentDetails = null;
//                    rentDetails = new RentDetails(Integer.parseInt(rentSNo[i]), orgId, userId, unitNo[i], rentPeriod[i], Double.parseDouble(chargesQuoted[i]), 
//                            Double.parseDouble(vatPerc[i]), Double.parseDouble(vatAmount[i]), Double.parseDouble(totalAmount[i]), "Rent Quote Created", sqlTimestamp, quotationNo);
//    
//                    crmDAO.RentDetailsSave(rentDetails);
//                } else {
//                    
////                    if("".equals(vatPerc[i])) {
//                        vatPerc[i] = "0";
////                    }
////                    if(vatAmount[i] == null) {
//                        vatAmount[i] = "0";
////                    }
////                    if(totalAmount[i] == null) {
//                        totalAmount[i] = "0";
////                    }
//                    RentDetails rentDetails = null;
//                    rentDetails = new RentDetails(orgId, userId, unitNo[i], rentPeriod[i], Double.parseDouble(chargesQuoted[i]), Double.parseDouble(vatPerc[i]), Double.parseDouble("0"), 
//                            Double.parseDouble("0"), "Rent Quote Created", sqlTimestamp, quotationNo);
//        
//                    crmDAO.RentDetailsSave(rentDetails);
//                }
//            }
//        } catch(Exception ex) {
//            ex.printStackTrace();
//        }
//        
//        List<ServiceDetails> serviceList = new ArrayList<ServiceDetails>();
//        try {
//                for(int i = 0; i < serviceCatg.length; i++) {
//                    if(!"".equals(serviceSNo[i]) || serviceSNo[i] == null) {
//                        ServiceDetails serviceDetails = null;
//
//
//                    } else {                     
////                    serviceDetails = new ServiceDetails(Integer.parseInt([i]), orgId, userId, serviceCatg[i], serviceName[i],  Double.parseDouble(chargesQuoted[i]), 
////                            Double.parseDouble(vatPerc[i]), Double.parseDouble(vatAmount[i]), Double.parseDouble(totalAmount[i]), securityDeposit, 
////                            advance, "update0", sqlTimestamp);
//              //    crmDAO.ServiceDetailsListSave(serviceList); 
//                          ServiceDetails serviceDetails = null;
//                    serviceDetails = new ServiceDetails(orgId, userId, serviceCatg[i], serviceName[i], Double.parseDouble(chargesQuoted[i]), Double.parseDouble(vatPerc[i]), 
//                            Double.parseDouble("0"), Double.parseDouble("0"), securityDeposit, advance, "Rent Quote Created", sqlTimestamp, quotationNo);
//       
//                    crmDAO.ServiceDetailsSave(serviceDetails);
//                 }
//            }
//        } catch(Exception ex) {
//            ex.printStackTrace();
//        }
//        
//        List<TermsCondition> termsList = new ArrayList<TermsCondition>();
//        if(termsSNo == null) {
//            MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
//            List<MultipartFile> multipartFile1 = multipartRequest1.getFiles("");
//            
//            TermsCondition termsCondition = null;
//            for (Iterator<MultipartFile> iterator = multipartFile1.iterator(); iterator.hasNext();) {
//                MultipartFile test = (MultipartFile) iterator.next();
//                originalImg = test.getOriginalFilename();
//                
//                try {
//                    if(termsSNo == null) {
//                        termsCondition = new TermsCondition(Integer.parseInt(sNo), paymentTerms, contractTerms, advance, orgId, userId, quotationNo, orgId, Boolean.TRUE, tenancyEndDate1);
//        //(paymentTerms, contractTerms, originalImg, test.getBytes(), orgId, userId);
//                    }
//                } catch(Exception ex) {
//                    ex.printStackTrace();
//                }
//            }
//                         
//         //   crmDAO.TermsConditionListSave(termsList);
//            
//        } else {
//            MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
//            List<MultipartFile> multipartFile1 = multipartRequest1.getFiles("");
//            
//            TermsCondition termsCondition = null;
//            for (Iterator<MultipartFile> iterator = multipartFile1.iterator(); iterator.hasNext();) {
//                MultipartFile test = (MultipartFile) iterator.next();
//                originalImg = test.getOriginalFilename();
//                
//                try {
//                   // termsCondition = new TermsCondition(Integer.parseInt(serviceSNo), paymentTerms, contractTerms, originalImg, test.getBytes(), orgId, userId);
//                } catch(Exception ex) {
//                    ex.printStackTrace();
//                }
//            }
//          ///    crmDAO.TermsConditionListSave(termsList);
//        }
//        
//        modelMap.addAttribute("success", "true");
//        modelMap.addAttribute("message", "Data Updated Successfully...");
//        return new ModelAndView(new RedirectView("quoteList.htm"), modelMap);
//    }
   
    @RequestMapping("/CRM/amcCostMasterFormSubmit.htm")
    public ModelAndView bookingQuoteFormSubmitNew(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, UnsupportedEncodingException, ParseException {       
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        
        //Quotation Details
        String bookingId = request.getParameter("");
        String bookingRef = request.getParameter(""); 
        String bookingDate = request.getParameter("");
        String quotationSNo = request.getParameter("quotationSNo");
        String quotationNo = request.getParameter("quotationNumber");
        String quotationDate = request.getParameter("quotationDate");
        String quotationExpiry = request.getParameter("quotationExpiry");
        String currency = request.getParameter("currency");
        
        //Property Details
        String propertySNo = request.getParameter("propertySNo");
        String propertyCode = request.getParameter("assetCode");
        String propertyName = request.getParameter("assetName");
        String tenancyStartDate = request.getParameter("tenancyStartDate");
        String tenancyEndDate = request.getParameter("tenancyEndDate");
        String floor = request.getParameter("mezzanineFloor");
        String unitName = request.getParameter("assetType1");
        String baseRent = request.getParameter("baserent");

        //Customer/Tenancy Details
        String customerSNo = request.getParameter("customerSNo");
        String customerType = request.getParameter("customerType");
        String customerName = request.getParameter("customerName");
        String tenantId = request.getParameter("tenantId");
        String businessName = request.getParameter("businessName");
        String businessCRNo = request.getParameter("businessCRNo");
        String contactPerson[] = request.getParameterValues("contactPerson");
        String emailId[] = request.getParameterValues("registeredEmailID");
        String PhoneNo[] = request.getParameterValues("phoneNo");
        
        //Rent Details
        String rentSNo[] = request.getParameterValues("rentSNo");
        String unitNo[] = request.getParameterValues("unitNo");
        String rentPeriod[] = request.getParameterValues("rentPeriod");
        String chargesQuoted[] = request.getParameterValues("chargesQuoted");
        String vatPerc[] = request.getParameterValues("vatPerc");
        String vatAmount[] = request.getParameterValues("vatAmount");
        String totalAmount[] = request.getParameterValues("totalAmount");
        
        //Service Details
        String serviceSNo[] = request.getParameterValues("serviceSNo");
        String serviceCatg[] = request.getParameterValues("serviceCategory");
        String serviceName[] = request.getParameterValues("serviceName");
        String serviceChargesQuoted[] = request.getParameterValues("serviceChargesQuoted");
        String serviceVatPerc[] = request.getParameterValues("serviceVatPerc");
        String serviceVatAmount[] = request.getParameterValues("serviceVatAmount");
        String serviceTotalAmount[] = request.getParameterValues("serviceTotalAmount");
        String securityDeposit = request.getParameter("securityDeposit");
        String advance = request.getParameter("advance");
        
        //Terms & Condition
        String termsSNo = request.getParameter("termsSNo");
        String paymentTerms = request.getParameter("paymentTerms");
        String contractTerms = request.getParameter( "contactTerms");  
        String status = request.getParameter("status");
        
         Date quotationExpiry1  = null;

        String originalImg = null;
        
        List<BookingQuotationDetails> quotationList = new ArrayList<BookingQuotationDetails>();
        
        Date quotationDate1  = null;
        Date bookingDate1  = null;
        try {
                if (!"".equals(bookingDate) && bookingDate != null) {
                    bookingDate1 = (Date) f.parse(bookingDate);
                }
        } catch (NullPointerException ex) {
        }
            try {
                if (!"".equals(quotationDate) && quotationDate != null) {
                    quotationDate1 = (Date) f.parse(quotationDate);
                }
            } catch (NullPointerException ex) {
            }

            
            try {
                if (!"".equals(quotationExpiry) && quotationExpiry != null) {
                    quotationExpiry1 = (Date) f.parse(quotationExpiry);
                }
            } catch (NullPointerException ex) {
            }
            
  
        if(quotationSNo == null || quotationSNo == "") {
            BookingQuotationDetails quotationDetails = null;
            quotationDetails = new BookingQuotationDetails(orgId, userId, bookingId, bookingRef, bookingDate1, quotationNo, quotationDate1, quotationExpiry1, currency, 
                    "Booking Quote Created", sqlTimestamp);

            crmDAO.BookingQuotationDetailsSave(quotationDetails);
        } else {
                
                
        }
                 
        List<BookingPropertyDetails> propertyList = new ArrayList<BookingPropertyDetails>();
        Date  tenancyStartDate1 = null;
            try {
                if (!"".equals( tenancyStartDate) &&  tenancyStartDate!= null) {
                     tenancyStartDate1= (Date) f.parse( tenancyStartDate);
                }
            } catch (NullPointerException ex) {
            }

            Date  tenancyEndDate1  = null;
            try {
                if (!"".equals( tenancyEndDate) &&  tenancyEndDate != null) {
                    tenancyEndDate1 = (Date) f.parse( tenancyEndDate);
                }
            } catch (NullPointerException ex) {
            }
            
       if(propertySNo == null || propertySNo == "") {
           
            BookingPropertyDetails propertyDetails = null;
            propertyDetails = new BookingPropertyDetails(orgId, userId, bookingId, bookingRef, bookingDate1, quotationNo,"","",tenancyStartDate1,tenancyEndDate1, floor,"", baseRent, propertyCode, propertyName, unitName, "Booking Quote Created", sqlTimestamp, customerName);

            crmDAO.BookingPropertyDetailsSave(propertyDetails);
        }
            
        List<BookingCustomerTenacyDetails> customerList = new ArrayList<BookingCustomerTenacyDetails>();
        for(int i = 0; i < contactPerson.length; i++) {
            if(customerSNo == null || customerSNo == "") {
            BookingCustomerTenacyDetails customerTenacyDetails = null;
            customerTenacyDetails = new BookingCustomerTenacyDetails(orgId, userId, bookingId, quotationNo, customerType, customerName, tenantId, 
                    businessName, businessCRNo, contactPerson[i], emailId[i], PhoneNo[i], "Booking Quote Created", sqlTimestamp);
         
            crmDAO.BookingCustomerTenacyDetailsSave(customerTenacyDetails);
                       
        } else {
            BookingCustomerTenacyDetails customerTenacyDetails = null;
            customerTenacyDetails = new BookingCustomerTenacyDetails(Integer.parseInt(customerSNo),orgId, userId, bookingId, quotationNo, customerType, customerName, tenantId, 
                    businessName, businessCRNo, contactPerson[i], emailId[i], PhoneNo[i], "Booking Quote Created", sqlTimestamp);    
          crmDAO.BookingCustomerTenacyDetailsSave(customerTenacyDetails);
            
         }
        }
        
        List<BookingRentDetails> rentList = new ArrayList<BookingRentDetails>();
        try {
            for(int i = 0; i < unitNo.length; i++) {
//                if(!"".equals(rentSNo[i]) || rentSNo[i] != null) {
//                    RentDetails rentDetails = null;
//                    rentDetails = new RentDetails(Integer.parseInt(rentSNo[i]), orgId, userId, unitNo[i], rentPeriod[i], Double.parseDouble(chargesQuoted[i]), 
//                            Double.parseDouble(vatPerc[i]), Double.parseDouble(vatAmount[i]), Double.parseDouble(totalAmount[i]), "Rent Quote Created", sqlTimestamp, quotationNo);
//    
//                    crmDAO.RentDetailsSave(rentDetails);
//                } else {
                    
//                    if("".equals(vatPerc[i])) {
//                        vatPerc[i] = "0";
//                    }
//                    if(vatAmount[i] == null) {
//                        vatAmount[i] = "0";
//                    }
//                    if(totalAmount[i] == null) {
//                        totalAmount[i] = "0";
//                    }
                    BookingRentDetails rentDetails = null;
                    rentDetails = new BookingRentDetails(orgId, userId, bookingId, quotationNo, unitNo[i], rentPeriod[i], Double.parseDouble(chargesQuoted[i]), Double.parseDouble(vatPerc[i]), Double.parseDouble("0"), 
                            Double.parseDouble("0"), "Booking Quote Created", sqlTimestamp);
        
                    crmDAO.BookingRentDetailsSave(rentDetails);
//                }
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        }
        
        List<BookingServiceDetails> serviceList = new ArrayList<BookingServiceDetails>();
        try {
                for(int i = 0; i < serviceCatg.length; i++) {
//                    if(!"".equals(serviceSNo[i]) || serviceSNo[i] == null) {
//                        ServiceDetails serviceDetails = null;
//
//
//                    } else {                     
//                    serviceDetails = new ServiceDetails(Integer.parseInt([i]), orgId, userId, serviceCatg[i], serviceName[i],  Double.parseDouble(chargesQuoted[i]), 
//                            Double.parseDouble(vatPerc[i]), Double.parseDouble(vatAmount[i]), Double.parseDouble(totalAmount[i]), securityDeposit, 
//                            advance, "update0", sqlTimestamp);
              //    crmDAO.ServiceDetailsListSave(serviceList); 
                          BookingServiceDetails serviceDetails = null;
                    serviceDetails = new BookingServiceDetails(orgId, userId, bookingId, quotationNo, serviceCatg[i], serviceName[i], Double.parseDouble(chargesQuoted[i]), Double.parseDouble(vatPerc[i]), 
                            Double.parseDouble("0"), Double.parseDouble("0"), securityDeposit, advance, "Booking Quote Created", sqlTimestamp);
       
                    crmDAO.BookingServiceDetailsSave(serviceDetails);
//                 }
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        }
        
        List<TermsCondition> termsList = new ArrayList<TermsCondition>();
        if(termsSNo == null) {
            MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
            List<MultipartFile> multipartFile1 = multipartRequest1.getFiles("");
            
            TermsCondition termsCondition = null;
            for (Iterator<MultipartFile> iterator = multipartFile1.iterator(); iterator.hasNext();) {
                MultipartFile test = (MultipartFile) iterator.next();
                originalImg = test.getOriginalFilename();
                
                try {
                    if(termsSNo == null) {
                        termsCondition = new TermsCondition(paymentTerms, contractTerms, advance, orgId, userId, quotationNo, bookingId, Boolean.TRUE, sqlTimestamp);
        //(paymentTerms, contractTerms, originalImg, test.getBytes(), orgId, userId);
                    }
                } catch(Exception ex) {
                    ex.printStackTrace();
                }
            }
                         
         //   crmDAO.TermsConditionListSave(termsList);
            
        } else {
            MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
            List<MultipartFile> multipartFile1 = multipartRequest1.getFiles("");
            
            TermsCondition termsCondition = null;
            for (Iterator<MultipartFile> iterator = multipartFile1.iterator(); iterator.hasNext();) {
                MultipartFile test = (MultipartFile) iterator.next();
                originalImg = test.getOriginalFilename();
                
                try {
                   // termsCondition = new TermsCondition(Integer.parseInt(serviceSNo), paymentTerms, contractTerms, originalImg, test.getBytes(), orgId, userId);
                } catch(Exception ex) {
                    ex.printStackTrace();
                }
            }
          ///    crmDAO.TermsConditionListSave(termsList);
        }
        
        modelMap.addAttribute("success", "true");
        modelMap.addAttribute("message", "Data Updated Successfully...");
        return new ModelAndView(new RedirectView("quoteList.htm"), modelMap);
    }
   
    
}


    