/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import tenant.classes.AdditionalDetails;
import tenant.classes.ContractAttach;
import tenant.classes.ContractCreation;
import tenant.classes.ContractInsuranceTag;
import tenant.classes.ContractUnitDetails;
import tenant.classes.CustomerUnitDetails;
import tenant.classes.InsuranceAttach;
import tenant.classes.InsuranceDetails;
import tenant.classes.InsuranceTagDetails;
import tenant.classes.LandLordUnitsDetails;
import tenant.classes.PDCheckAdditional;
import tenant.classes.ServiceAmenties;
import tenant.classes.TenantProfilings;
import tenant.classes.UnitMulipleCustomer;
import tenant.classes.UnitUtilityCategory;
import tenant.classes.UnitsContractTemplate;
import tenant.classes.UserRegistration;
import tenant.dao.AssetDAO;
import tenant.dao.ContractDAO;
import tenant.dao.MasterDAO;
import tenant.dao.TenantDetailsDAO;
import tenant.dao.UserDAO;

/**
 *
 * @author ebs
 */
@Controller
public class ContractController {

    Calendar now = Calendar.getInstance();
    String mod_date = now.get(Calendar.YEAR) + "/" + (now.get(Calendar.MONTH) + 1) + "/" + now.get(Calendar.DATE);
    Date date = new Date(mod_date);
    DateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
    DateFormat formatter2 = new SimpleDateFormat("dd-MM-yyyy");
    DateFormat formatter1 = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss a");
    DateFormat formatter3 = new SimpleDateFormat("dd-MMM-yyyy");
    DateFormat formatter4 = new SimpleDateFormat("yyyy-MM-dd");
    java.util.Date newdate = new java.util.Date();
    long t = newdate.getTime();
    java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(t);
    @Autowired
    private ContractDAO contractDAO;
    @Autowired
    private MasterDAO masterDAO;
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private TenantDetailsDAO tenantDetailsDAO;
    @Autowired
    private AssetDAO assetDAO;

    //---------------------Insurance Details---------------------------------------------//
    @RequestMapping("/insurance/insuranceDetailsList.htm")
    public ModelAndView insuranceDetailsList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Insurance Creation";
        String submoduleName = "Insurance Details";
        map.addAttribute("insurance", contractDAO.list("", "InsuranceDetails"));
        map.addAttribute("comName", contractDAO.insurCompName());
        map.addAttribute("insMast", contractDAO.insurmast());
        map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../insurance/insuranceDetailsList", map);
    }

    @RequestMapping("/insurance/insuranceDetailsForm.htm")
    public ModelAndView insuranceDetailsForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        String insNo = request.getParameter("insuranceNo");
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String insuranceCompId = request.getParameter("insuranceCompanyId");

        String link = "../insurance/insuranceDetailsForm.htm";
        String tab = "Insurance Creation";
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("category", userDAO.formLabelMapping(link, tab));
            modelMap.addAttribute("insurance", contractDAO.list(sno, "InsuranceDetails"));
            modelMap.addAttribute("attachment", contractDAO.InsuranceAttachlist(insNo));//sno
            modelMap.addAttribute("compId", contractDAO.compId(sno, insuranceCompId));
            modelMap.addAttribute("insurance1", contractDAO.insurComp1());
        }
        modelMap.addAttribute("action", request.getParameter("action"));
        modelMap.addAttribute("category", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("attachment", contractDAO.InsuranceAttachlist(insNo));
        modelMap.addAttribute("insurance1", contractDAO.insurComp1());
        return new ModelAndView("../insurance/insuranceDetailsForm", modelMap);
    }

    @RequestMapping("/insurance/AttachDownload.htm")
    public void AttachDownload(HttpServletRequest req, HttpServletResponse res) throws FileNotFoundException, IOException {
        String sno = req.getParameter("SNo");

        InsuranceAttach doc = contractDAO.getCAMAttach(Integer.parseInt(sno));
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

    @RequestMapping("/contract/ContractAttachDownload.htm")
    public void ContractAttachDownload(HttpServletRequest req, HttpServletResponse res) throws FileNotFoundException, IOException {
        String sno = req.getParameter("SNo");

        ContractAttach doc = contractDAO.getCAMAttach1(Integer.parseInt(sno));
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

    @RequestMapping("/insurance/insuranceDetailsFormSubmit.htm")
    public ModelAndView insuranceDetailsFormSubmit(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        String pk = request.getParameter("pk");
        String sno = request.getParameter("sno");
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String insuranceNo = request.getParameter("insuranceNo");
        String contentType = request.getParameter("contentType");
        //String contentType = request.getParameter("contentType");
        String insuranceId = request.getParameter("insuranceId");
        String insuranceFor = request.getParameter("insuranceFor");
        String insValidFrom = request.getParameter("insValidFrom");
        String insValidTo = request.getParameter("insValidTo");
        String status = request.getParameter("status");
        String remarks = request.getParameter("remarks");
        String attachmentReference = request.getParameter("attachmentReference");
        String attchSNo = request.getParameter("attchSNo");
        String insuranceCompId = request.getParameter("insuranceCompId");
        String insuranceType = request.getParameter("insuranceType");
        String attribute2 = request.getParameter("attribute12");
        String attribute3 = request.getParameter("attribute3");
        String attribute4 = request.getParameter("attribute4");
        String attribute5 = request.getParameter("attribute5");
        String insurTerm = request.getParameter("insurTerm");
        String delfiles = request.getParameter("tobedel");
        
        String insuredAmount = request.getParameter("insuredAmount");
        String premiumAmount = request.getParameter("premiumAmount");
        String frequency = request.getParameter("frequency");
        ///Newly Added By Lakshmi
        String insuranceCategory = request.getParameter("insuranceCategory");
        //////
        Date insValidFrom1 = null;
        Date insValidTo1 = null;
        if (!"".equals(insValidFrom)) {
            insValidFrom1 = (Date) formatter.parse(insValidFrom);
        }
        if (!"".equals(insValidTo)) {
            insValidTo1 = (Date) formatter.parse(insValidTo);
        }
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        List<InsuranceDetails> gridData = new ArrayList<InsuranceDetails>();
        if (insuranceId.isEmpty()) {
            String insuranceId1 = request.getParameter("insuranceId");
            ArrayList validuser = (ArrayList) contractDAO.InsuranceIDlist(null, insuranceId1, null);
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

            insuranceId = "INSUR" + "-" + ordno;
        }

        if (pk == null) {
            InsuranceDetails insuranceDetails = new InsuranceDetails(insuranceId, orgId, userId, insuranceNo, insuranceFor, insuranceCompId, insValidFrom1, insValidTo1, insurTerm, remarks, insuranceType, attribute2, attribute3, attribute4, attribute5, "update0", timestamp, timestamp, insuranceCategory, insuredAmount, premiumAmount, frequency);
            contractDAO.globalSave(insuranceDetails);
            /*MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
             List<MultipartFile> multipartFile = multipartRequest.getFiles("attachmentReference");
             int x = 0;
             for (Iterator<MultipartFile> iterator = multipartFile.iterator(); iterator.hasNext();) {
             MultipartFile test = (MultipartFile) iterator.next();
             if (test.getBytes().length > 0) {
             InsuranceAttach attach = new InsuranceAttach(orgId, userId, insuranceNo, insuranceId, test.getBytes(), test.getContentType(), test.getOriginalFilename(), "update0", timestamp, timestamp);
             //requiattach.add(attach);
             contractDAO.insurAttachSave(attach);
             x++;
             }
             }*/
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            List<MultipartFile> multipartFiles = multipartRequest.getFiles("attachments");
            String documentNames[] = request.getParameterValues("documentname");

            final String dir = System.getProperty("user.dir");
            File f = new File(dir);
            String path = f.getParent();
            f = new File(path);
            path = f.getParent();
            f = new File(path);

            try {
                int i = 0, fileLength = 0;
                String filename;
                String filePath = "";

                List<InsuranceAttach> list = new ArrayList<InsuranceAttach>();
                for (Iterator<MultipartFile> iterator = multipartFiles.iterator(); iterator.hasNext();) {
                    MultipartFile test = (MultipartFile) iterator.next();
                    fileLength = test.getBytes().length;

                    if (fileLength > 0) {
                        InsuranceAttach bdpfFile = new InsuranceAttach();
                        bdpfFile.setFilename(test.getOriginalFilename());

                        bdpfFile.setContent(test.getBytes());

                        bdpfFile.setOrgId(orgId);
                        bdpfFile.setUserId(userId);
                        bdpfFile.setLastmodifiedDate(timestamp);
                        bdpfFile.setCreationDate(timestamp);
                        bdpfFile.setStatus("update0");
                        bdpfFile.setInsuranceNo(insuranceNo);
                        bdpfFile.setInsuranceId(insuranceId);
                        bdpfFile.setContentType(contentType);

                        list.add(bdpfFile);
                    }
                    i++;
                }
                contractDAO.insurAttachSave(list);
                // assetsDAO1.saveAssetAttach(list);

            } catch (Exception e) {
                e.printStackTrace();
            }

        } else {
            InsuranceDetails insuranceDetails = new InsuranceDetails(insuranceId, Integer.parseInt(pk), orgId, userId, insuranceNo, insuranceFor, insuranceCompId, insValidFrom1, insValidTo1, insurTerm, remarks, insuranceType, attribute2, attribute3, attribute4, attribute5, status, timestamp, insuranceCategory, insuredAmount, premiumAmount, frequency);
            contractDAO.globalSave(insuranceDetails);

            //            for attachment
           /* String attachSno[] = request.getParameterValues("attachSno");
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
             contractDAO.contraattachmentDelete(Integer.parseInt(nA));
             } catch (Exception e) {
             e.printStackTrace();
             }
             }
             } else {
             if (attachSno == null && attachSnoFull != null) {
             try {
             contractDAO.contraattachmentDelete(Integer.parseInt(attachSnoFull[0]));
             } catch (Exception e) {
             e.printStackTrace();
             }
             }
             }*/
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            List<MultipartFile> multipartFiles = multipartRequest.getFiles("attachments");
            String documentNames[] = request.getParameterValues("documentname");

            final String dir = System.getProperty("user.dir");
            File f = new File(dir);
            String path = f.getParent();
            f = new File(path);
            path = f.getParent();
            f = new File(path);

            try {
                int i = 0, fileLength = 0;
                String filename;
                String filePath = "";

                List<InsuranceAttach> list = new ArrayList<InsuranceAttach>();
                for (Iterator<MultipartFile> iterator = multipartFiles.iterator(); iterator.hasNext();) {
                    MultipartFile test = (MultipartFile) iterator.next();
                    fileLength = test.getBytes().length;

                    if (fileLength > 0) {
                        InsuranceAttach bdpfFile = new InsuranceAttach();
                        bdpfFile.setFilename(test.getOriginalFilename());

                        bdpfFile.setContent(test.getBytes());

                        bdpfFile.setOrgId(orgId);
                        bdpfFile.setUserId(userId);
                        bdpfFile.setLastmodifiedDate(timestamp);
                        bdpfFile.setCreationDate(timestamp);
                        bdpfFile.setStatus("update0");
                        bdpfFile.setInsuranceNo(insuranceNo);
                        bdpfFile.setInsuranceId(insuranceId);
                        bdpfFile.setContentType(contentType);

                        list.add(bdpfFile);
                    }
                    i++;
                }
                contractDAO.insurAttachSave(list);
                // assetsDAO1.saveAssetAttach(list);

            } catch (Exception e) {
                e.printStackTrace();
            }
            if (!delfiles.equals("")) {
                String[] totalfiles = delfiles.split(",");
                for (int k = 0; k < totalfiles.length; k++) {

                    InsuranceAttach doc = contractDAO.getattchs(Integer.parseInt(totalfiles[k]));
                    //assetsDAO1.delete(doc.getAttachName(), doc.getAssetAttach());

                    contractDAO.delattachfiles("InsuranceAttach", "sno", Integer.parseInt(totalfiles[k]));
                }
            }
//        end

            /*MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
             List<MultipartFile> multipartFile = multipartRequest.getFiles("attachmentReference");
             int x = 0;
             for (Iterator<MultipartFile> iterator = multipartFile.iterator(); iterator.hasNext();) {
             MultipartFile test = (MultipartFile) iterator.next();
             if (test.getBytes().length > 0) {
             InsuranceAttach attach = new InsuranceAttach(orgId, userId, insuranceNo, insuranceId, test.getBytes(), test.getContentType(), test.getOriginalFilename(), "update0", timestamp, timestamp);
             //requiattach.add(attach);
             contractDAO.insurAttachSave(attach);
             x++;
             }
             }*/
        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("insurance", contractDAO.list("", "InsuranceDetails"));
        return new ModelAndView(new RedirectView("../insurance/insuranceDetailsList.htm"), modelMap);
    }

    //////////Newly Added By Lakshmi
    //---------------------Insurance Tagging---------------------------------------------//
    @RequestMapping("/insurance/insuranceTaggingDetailsList.htm")
    public ModelAndView insuranceTaggingDetailsList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Insurance Tagging";
        String submoduleName = "Insurance Details";
        map.addAttribute("insurancetaglist", contractDAO.insuranceTagginglist("", "InsuranceTagDetails"));
        //map.addAttribute("comName", contractDAO.insurCompName());
        map.addAttribute("insMast", contractDAO.insurmast());
        map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../insurance/insuranceTaggingDetailsList", map);
    }

    @RequestMapping("/insurance/insuranceTaggingDetailsForm.htm")
    public ModelAndView insuranceTaggingDetailsForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        String insNo = request.getParameter("insuranceNo");
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String insuranceCompId = request.getParameter("insuranceCompanyId");

        String link = "../insurance/insuranceTaggingDetailsForm.htm";
        String tab = "Insurance Tagging";
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("category", userDAO.formLabelMapping(link, tab));
            modelMap.addAttribute("insurance", contractDAO.list(sno, "InsuranceTagDetails"));
            modelMap.addAttribute("attachment", contractDAO.InsuranceAttachlist(insNo));//sno
            modelMap.addAttribute("compId", contractDAO.compId(sno, insuranceCompId));
            modelMap.addAttribute("insurance1", contractDAO.insurComp1());
        }
        modelMap.addAttribute("action", request.getParameter("action"));
        modelMap.addAttribute("category", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("attachment", contractDAO.InsuranceAttachlist(insNo));
        modelMap.addAttribute("insurance1", contractDAO.insurComp1());
        return new ModelAndView("../insurance/insuranceTaggingDetailsForm", modelMap);
    }

    @RequestMapping("/insurance/insuranceTaggingDetailsFormSubmit.htm")
    public ModelAndView insuranceTaggingDetailsFormSubmit(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        String pk = request.getParameter("pk");
        String sno = request.getParameter("sno");
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String insuranceNo = request.getParameter("insuranceNo");
        String insuranceCategory = request.getParameter("insuranceCategory");
        String insuranceId = request.getParameter("insuranceId");
        String insuranceFor = request.getParameter("insuranceFor");
        String remarks = request.getParameter("remarks");
        String insuranceCompName = request.getParameter("insuranceCompanyName");
        String insValidFrom = request.getParameter("insValidFrom");
        String insValidTo = request.getParameter("insValidTo");
        String insurTerm = request.getParameter("insurTerm");
        String assetName = request.getParameter("assetName");
        String propertyName = request.getParameter("propertyName");
        String floorName = request.getParameter("floorName");
        String flatName = request.getParameter("flatName");
        String assetPropVal = request.getParameter("assetPropVal");
        String insuranceCoverage = request.getParameter("insuranceCoverage");
        String attachments = request.getParameter("attachments");
        //String fileName = request.getParameter("fileName");
        List<InsuranceTagDetails> gridData = new ArrayList<InsuranceTagDetails>();
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultipartFile multipartFile = multipartRequest.getFile("attachments");
        String fileName = multipartFile.getOriginalFilename();

        Date insValidFrom1 = null;
        Date insValidTo1 = null;
        if (!"".equals(insValidFrom)) {
            insValidFrom1 = (Date) formatter.parse(insValidFrom);
        }
        if (!"".equals(insValidTo)) {
            insValidTo1 = (Date) formatter.parse(insValidTo);
        }

        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
//        List<InsuranceDetails> gridData = new ArrayList<InsuranceDetails>();
//        if (insuranceId.isEmpty()) {
//            String insuranceId1 = request.getParameter("insuranceId");
//            ArrayList validuser = (ArrayList) contractDAO.InsuranceIDlist(null, insuranceId1, null);
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
//
//            insuranceId = "INSUR" + "-" + ordno;
//        }

        if (pk == null) {
            InsuranceTagDetails insuranceTaggingDetails = new InsuranceTagDetails(orgId, userId, insuranceNo, insuranceCategory, insuranceFor, insuranceCompName, insValidFrom1, insValidTo1, insurTerm, assetName, propertyName, floorName, flatName, remarks, assetPropVal, insuranceCoverage, multipartFile.getBytes(), fileName, "update0", timestamp);
            gridData.add(insuranceTaggingDetails);
            contractDAO.saveInsuranceTaggingDetails(gridData);
            //contractDAO.globalSave(InsuranceTaggingDetails);

        } else {
            InsuranceTagDetails insuranceTaggingDetails = new InsuranceTagDetails(Integer.parseInt(pk), orgId, userId, insuranceNo, insuranceCategory, insuranceFor, insuranceCompName, insValidFrom1, insValidTo1, insurTerm, assetName, propertyName, floorName, flatName, remarks, assetPropVal, insuranceCoverage, multipartFile.getBytes(), fileName, "update0", timestamp);
            gridData.add(insuranceTaggingDetails);
            contractDAO.saveInsuranceTaggingDetails(gridData);
        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("insurance", contractDAO.list("", "InsuranceTagDetails"));
        return new ModelAndView(new RedirectView("../insurance/insuranceTaggingDetailsList.htm"), modelMap);
        //return new ModelAndView(new RedirectView("../insurance/insuranceTaggingDetailsList.htm"), modelMap);
    }

    ////////////////////////////
    @RequestMapping("/insurance/insuranceDetailPaginationList.htm")
    public void insuranceDetailPaginationList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
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

        List<InsuranceDetails> insurancelist = null;
        BigDecimal insurancelistCount = null;
        Gson gson = new Gson();
        JsonObject jsonResponse = new JsonObject();

        if (searchData == null || searchData.isEmpty()) {
            insurancelist = contractDAO.insuranceList1(userId, orgId, null, searchData, iDisplayStart, displayLength, "desc");
            // insurancelistCount = contractDAO.insurancelistCount(userId, orgId, null, searchData, iDisplayStart, displayLength, "desc");

        } else {
            insurancelist = contractDAO.insuranceList1(userId, orgId, null, searchData, iDisplayStart, displayLength, "asc");
            // insurancelistCount = contractDAO.insurancelistCount(userId, orgId, null, searchData, iDisplayStart, displayLength, "asc");

        }

        // ---------Json setting the value for each action like search,first,previous,last and show dropdown in front end---------
        jsonResponse.add("iDisplayLength", gson.toJsonTree(displayLength));
        jsonResponse.add("iTotalRecords", gson.toJsonTree(insurancelistCount));
        jsonResponse.add("iTotalDisplayRecords", gson.toJsonTree(insurancelistCount));
        jsonResponse.add("sEcho", gson.toJsonTree(sEcho));
        jsonResponse.add("iDisplayStart", gson.toJsonTree(iDisplayStart));
        jsonResponse.add("aaData", gson.toJsonTree(insurancelist));
        out.print(jsonResponse);
        out.flush();
//        System.out.println("jsonResponse" + jsonResponse);

    }

    @RequestMapping("/insurance/insuComNamePopUp.htm")
    public ModelAndView insuComNamePopUp(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        modelMap.addAttribute("insurance", contractDAO.insurComp());
        return new ModelAndView("insuComNamePopUp", modelMap);
    }

    @RequestMapping("/insurance/insuranceAttachDel.htm")
    public void insuranceAttachDel(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException {
        res.setContentType("text/html;charset=UTF-8");
        HttpSession session = req.getSession();
        String sno = req.getParameter("attchSNo");
        contractDAO.delInsurAttach(req, res, sno);
    }

    //unique insurance search method
    @RequestMapping("/insurance/InsuranceAvailabilty.htm")
    public void InsuranceAvailabilty(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException {
        res.setContentType("text/html;charset=UTF-8");
        String insuranceNo = req.getParameter("insuranceNo");
        contractDAO.selectInsurance(req, res, insuranceNo);
    }

    @RequestMapping("/insurance/InsuranceAvailabilty1.htm")
    public void InsuranceAvailabilty1(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException {
        res.setContentType("text/html;charset=UTF-8");
        String insuranceCompId = req.getParameter("insuranceCompId");
        contractDAO.selectInsuranceCom(req, res, insuranceCompId);
    }

    //---------------------Contract Creation---------------------------------------------//
    @RequestMapping("/insurance/contractCreationList.htm")
    public ModelAndView contractCreationList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Contract Creation";
        String submoduleName = "Contract Creation";
        String status = request.getParameter("status");
        String recordStatus = "Contract Created";
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        String insuranceNo2 = request.getParameter("insuranceNo");
        if (fromDate != null && toDate != null) {
            if (fromDate.contains("frdate") && toDate.contains("todate")) {
                fromDate = null;
                toDate = null;
            }
        }

        if (status == null || status == "" || status.equals("")) {
            status = "null";
        }
        if (fromDate == null || toDate == null) {

            if (status.equals(recordStatus)) {
                map.addAttribute("contCreat", contractDAO.contratCreateList(recordStatus));
            } else {
                map.addAttribute("contCreat", contractDAO.list("", "ContractCreation"));
            }

            map.addAttribute("insurance", contractDAO.list("", "InsuranceDetails"));
            map.addAttribute("attachment", contractDAO.InsuranceAttachlist(insuranceNo2));
            map.addAttribute("insurTag", contractDAO.insurTagged());
        } else {

            if (status.equals(recordStatus)) {
                map.addAttribute("contCreat", contractDAO.contratCreateList1(recordStatus, fromDate, toDate));
            } else {
                map.addAttribute("contCreat", contractDAO.clist1("", "ContractCreation", fromDate, toDate));
            }

            map.addAttribute("insurance", contractDAO.clist1("", "InsuranceDetails", fromDate, toDate));
            map.addAttribute("attachment", contractDAO.InsuranceAttachlist1(insuranceNo2, fromDate, toDate));
            map.addAttribute("insurTag", contractDAO.insurTagged1(fromDate, toDate));
        }
        map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../contract/contractCreationList", map);
    }

    @RequestMapping("/insurance/contractCreationForm.htm")
    public ModelAndView contractCreationForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        String contractCode = request.getParameter("contractCode");
        String categoryId = request.getParameter("contractCategoryId");
        String classificationId = request.getParameter("contClassificationId");
        String propertyCod = request.getParameter("propertyCod");
        String flatCod = request.getParameter("flatCod");

        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String link = "../insurance/contractCreationForm.htm";
        String tab = "Contract Creation";
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("category", userDAO.formLabelMapping(link, tab));
            modelMap.addAttribute("insurance", contractDAO.list(sno, "InsuranceDetails"));
            modelMap.addAttribute("attachment", contractDAO.ContractAttachlist(contractCode));
            modelMap.addAttribute("contCreat", contractDAO.list(sno, "ContractCreation"));
            modelMap.addAttribute("catId", contractDAO.contCategory(sno, categoryId));
            modelMap.addAttribute("classId", contractDAO.contClassfName(sno, classificationId));
            modelMap.addAttribute("subAssetDetail", contractDAO.subAssetDetails(sno, propertyCod, flatCod));
            modelMap.addAttribute("insuranList", contractDAO.insuranceNoList(contractCode));
            modelMap.addAttribute("contraEditList", contractDAO.editList(contractCode));

        }
        modelMap.addAttribute("insurance1", contractDAO.insurComp());
        modelMap.addAttribute("classf", contractDAO.contraClass());
        modelMap.addAttribute("contraCat", contractDAO.contraCategory());
        modelMap.addAttribute("category", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("attachment", contractDAO.ContractAttachlist(contractCode));
        modelMap.addAttribute("insurance", contractDAO.insurDetail());
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../contract/contractCreationForm", modelMap);
    }

    @RequestMapping("/insurance/contractNoEditForm.htm")
    public ModelAndView contractNoEditForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        String contractCode = request.getParameter("contractCode");
        String categoryId = request.getParameter("contractCategoryId");
        String classificationId = request.getParameter("contClassificationId");
        String propertyCod = request.getParameter("propertyCod");
        String flatCod = request.getParameter("flatCod");

        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String link = "../insurance/contractCreationForm.htm";
        String tab = "Contract Creation";
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("category", userDAO.formLabelMapping(link, tab));
            modelMap.addAttribute("insurance", contractDAO.list(sno, "InsuranceDetails"));
            modelMap.addAttribute("attachment", contractDAO.ContractAttachlist(contractCode));
            modelMap.addAttribute("contCreat", contractDAO.list(sno, "ContractCreation"));
            modelMap.addAttribute("catId", contractDAO.contCategory(sno, categoryId));
            modelMap.addAttribute("classId", contractDAO.contClassfName(sno, classificationId));
            modelMap.addAttribute("subAssetDetail", contractDAO.subAssetDetails(sno, propertyCod, flatCod));
            modelMap.addAttribute("insuranList", contractDAO.insuranceNoList(contractCode));
            modelMap.addAttribute("contraEditList", contractDAO.editList(contractCode));

        }
        modelMap.addAttribute("action", request.getParameter("action"));

        return new ModelAndView("../contract/contractNoEditForm", modelMap);
    }

    @RequestMapping("/insurance/contractCreationFormSubmit.htm")
    public ModelAndView contractCreationFormSubmit(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException, MessagingException {
        String pk = request.getParameter("pk");
        String sno1[] = request.getParameterValues("sno1");
        String sno[] = request.getParameterValues("sno");
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String contractCode = request.getParameter("contractCode");
        String contractTitle = request.getParameter("contractTitle");
        String contStartDate = request.getParameter("contStartDate");
        String contEndDate = request.getParameter("contEndDate");
        String contReviewDate = request.getParameter("contReviewDate");
        String contStatus = request.getParameter("contStatus");
        String status = request.getParameter("status");
        String remarks = request.getParameter("remarks");
        String categoryId = request.getParameter("categoryId");
        String classificationId = request.getParameter("classificationId");
        String insuranceId[] = request.getParameterValues("insuranceId");
        String contractTerm = request.getParameter("contractTerm");
        String assetCode = request.getParameter("assetCode");
        String subAssetCode = request.getParameter("subAssetCode");
        String attribute4 = request.getParameter("attribute4");
        String attribute5 = request.getParameter("attribute5");
        String insuranceTagged[] = request.getParameterValues("insuranceTagged");
        String deleteRows = request.getParameter("deleteRows");
        String deleteRows1 = request.getParameter("deleteRows1");
        String action = request.getParameter("action");
        String contentType = request.getParameter("contentType");
        String delfiles = request.getParameter("tobedel");

        Date contStartDate1 = null;
        Date contEndDate1 = null;
        Date contReviewDate1 = null;
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        List<ContractCreation> gridData = new ArrayList<ContractCreation>();
        if (contractCode.isEmpty()) {

            ArrayList validuser = (ArrayList) contractDAO.ContractCreationlist(null, contractCode, null);
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

            contractCode = "CONT" + "-" + ordno;
        }

        if (action != null && !action.isEmpty()) {
            if (action.equalsIgnoreCase("recheck")) {
                String str[] = contractCode.split("-");
                if (str.length > 2) {
                    int i = Integer.parseInt(str[3]);
                    i = i + 1;
                    contractCode = str[0] + "-" + str[1] + "-" + str[2] + "-" + i;
                } else {
                    contractCode = contractCode + "-REV" + "-" + 1;
                }
//                String attachSno1[] = request.getParameterValues("attachSno");
//                if (attachSno1 != null) {
//
//                    for (int at = 0; at < attachSno1.length; at++) {
//                        contractDAO.contraAttachRecheckUpdate(attachSno1[at], contractCode);
//                    }
//                }

            }

        }
        if (insuranceTagged.length > 1) {
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            List<MultipartFile> multipartFiles = multipartRequest.getFiles("attachments");
            String documentNames[] = request.getParameterValues("documentname");

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

                List<ContractAttach> list = new ArrayList<ContractAttach>();
                for (Iterator<MultipartFile> iterator = multipartFiles.iterator(); iterator.hasNext();) {
                    MultipartFile test = (MultipartFile) iterator.next();
                    fileLength = test.getBytes().length;

                    if (fileLength > 0) {
                        ContractAttach bdpfFile = new ContractAttach();
                        bdpfFile.setFilename(test.getOriginalFilename());

                        bdpfFile.setContent(test.getBytes());

                        bdpfFile.setOrgId(orgId);
                        bdpfFile.setUserId(userId);
                        bdpfFile.setLastmodifiedDate(timestamp);
                        bdpfFile.setCreationDate(timestamp);
                        bdpfFile.setStatus("update0");
                        bdpfFile.setContractCode(contractCode);
                        // bdpfFile.setInsuranceId(insuranceId);
                        bdpfFile.setContentType(test.getContentType());

                        list.add(bdpfFile);
                    }
                    j++;
                }
                contractDAO.contraAttachSave1(list);
                // assetsDAO1.saveAssetAttach(list);

            } catch (Exception e) {
                e.printStackTrace();
            }
            for (int i = 0; i < insuranceTagged.length - 1; i++) {
                if (!"".equals(contStartDate)) {
                    contStartDate1 = (Date) formatter.parse(contStartDate);
                }
                if (!"".equals(contEndDate)) {
                    contEndDate1 = (Date) formatter.parse(contEndDate);
                }
                if (!"".equals(contReviewDate)) {
                    contReviewDate1 = (Date) formatter.parse(contReviewDate);
                }

                if (sno1[i] != null && sno1[i] != "" && !sno1[i].isEmpty()) {

                    if (!delfiles.equals("")) {
                        String[] totalfiles = delfiles.split(",");
                        for (int m = 0; m < totalfiles.length; m++) {

                            ContractAttach doc = contractDAO.getattchs1(Integer.parseInt(totalfiles[m]));
                            //assetsDAO1.delete(doc.getAttachName(), doc.getAssetAttach());

                            contractDAO.delattachfiles("ContractAttach", "sno", Integer.parseInt(totalfiles[m]));
                        }
                    }
                    ContractCreation contractCreation = new ContractCreation(Integer.parseInt(sno1[i]), orgId, userId, contractTitle, categoryId, contStartDate1, contEndDate1, contReviewDate1, contStatus, classificationId, contractCode, remarks, contractTerm, assetCode, subAssetCode, "", "", status, "Contract Created", timestamp);
                    contractDAO.globalSave(contractCreation);
                } else {

                    ContractCreation contractCreation = new ContractCreation(contractCode, orgId, userId, contractTitle, categoryId, contStartDate1, contEndDate1, contReviewDate1, contStatus, classificationId, remarks, contractTerm, assetCode, subAssetCode, attribute4, attribute5, "update0", "Contract Created", timestamp, timestamp);
                    contractDAO.globalSave(contractCreation);

                }

                if (sno[i] != null && sno[i] != "" && !sno[i].isEmpty()) {
                    ContractInsuranceTag contractInsuranceTag = new ContractInsuranceTag(Integer.parseInt(sno[i]), orgId, userId, contractCode, insuranceId[i], "update0", timestamp, timestamp);
                    contractDAO.globalSave(contractInsuranceTag);
                } else {
                    ContractInsuranceTag contractInsuranceTag = new ContractInsuranceTag(orgId, userId, contractCode, insuranceId[i], "update0", timestamp, timestamp);
                    contractDAO.globalSave(contractInsuranceTag);
                }

            }
        } else {
            for (int k = 0; k < 1; k++) {
                if (!"".equals(contStartDate)) {
                    contStartDate1 = (Date) formatter.parse(contStartDate);
                }
                if (!"".equals(contEndDate)) {
                    contEndDate1 = (Date) formatter.parse(contEndDate);
                }
                if (!"".equals(contReviewDate)) {
                    contReviewDate1 = (Date) formatter.parse(contReviewDate);
                }

                ContractCreation contractCreation = new ContractCreation(contractCode, orgId, userId, contractTitle, categoryId, contStartDate1, contEndDate1, contReviewDate1, contStatus, classificationId, remarks, contractTerm, assetCode, subAssetCode, attribute4, attribute5, "update0", "Contract Created", timestamp, timestamp);
                contractDAO.globalSave(contractCreation);

                ContractInsuranceTag contractInsuranceTag = new ContractInsuranceTag(orgId, userId, contractCode, insuranceId[k], "update0", timestamp, timestamp);
                contractDAO.globalSave(contractInsuranceTag);
            }
        }

        if (deleteRows.trim().length() != 0) {
            String out[] = deleteRows.split("//");
            for (int j = 0; j < out.length; j++) {
                contractDAO.insutagGridDataDelete(Integer.parseInt(out[j]));
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
                List<ContractCreation> td = contractDAO.tdList(userId, orgId, contractCode);
                StringBuilder emailId = new StringBuilder(email);
                if (td.size() > 0) {
                    int i = 1;
                    for (ContractCreation tdlist : td) {

                        contraCod = tdlist.getContractCode();
                        ContractTerm = tdlist.getContractTerm();
                        propertyCod = tdlist.getPropertyCod();
                    }
                    emailId.append(",");
                    emailId.append(toEmail);
                    String[] sendEmail = emailId.toString().split(",");
                    subject = "Contract Code: " + contractCode;
                    String filepath = request.getSession().getServletContext().getRealPath("common\\theme\\images\\logo1.png");
                    mailbody = "<html><body>Dear Sir/Madam,<br/><br/><br/>You need to give an approval for Contract Details. Contract Code : " + contraCod + " for " + contractTerm + ""
                            + " Please Approve this Contract Details. <br/><br/>If approved ignore this mail. "
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
        modelMap.addAttribute("insurance", contractDAO.list("", "InsuranceDetails"));
        return new ModelAndView(new RedirectView("../insurance/contractCreationList.htm"), modelMap);
    }

    //approval form submit method
    @RequestMapping("/insurance/contractNoEditFormSubmit.htm")
    public ModelAndView contractNoEditFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException, ParseException {
        String pk = request.getParameter("pk");
        String sno1[] = request.getParameterValues("sno1");
        String sno[] = request.getParameterValues("sno");
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String contractCode = request.getParameter("contractCode");
        String contractTitle = request.getParameter("contractTitle");
        String contStartDate = request.getParameter("contStartDate");
        String contEndDate = request.getParameter("contEndDate");
        String contReviewDate = request.getParameter("contReviewDate");
        String contStatus = request.getParameter("contStatus");
        String status = request.getParameter("status");
        String remarks = request.getParameter("remarks");
        String categoryId = request.getParameter("categoryId");
        String classificationId = request.getParameter("classificationId");
        String insuranceId[] = request.getParameterValues("insuranceId");
        String contractTerm = request.getParameter("contractTerm");
        String assetCode = request.getParameter("assetCode");
        String subAssetCode = request.getParameter("subAssetCode");
        String attribute4 = request.getParameter("attribute4");
        String attribute5 = request.getParameter("attribute5");
        String insuranceTagged[] = request.getParameterValues("insuranceTagged");
        String deleteRows = request.getParameter("deleteRows");
        String deleteRows1 = request.getParameter("deleteRows1");
        String action = request.getParameter("action");

        Date contStartDate1 = null;
        Date contEndDate1 = null;
        Date contReviewDate1 = null;
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        List<ContractCreation> gridData = new ArrayList<ContractCreation>();
        if (contractCode.isEmpty()) {

            ArrayList validuser = (ArrayList) contractDAO.ContractCreationlist(null, contractCode, null);
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

            contractCode = "CONT" + "-" + ordno;
        }

        if (action != null && !action.isEmpty()) {
            if (action.equalsIgnoreCase("recheck")) {
                String str[] = contractCode.split("-");
                if (str.length > 2) {
                    int i = Integer.parseInt(str[3]);
                    i = i + 1;
                    contractCode = str[0] + "-" + str[1] + "-" + str[2] + "-" + i;
                } else {
                    contractCode = contractCode + "-REV" + "-" + 1;
                }
                String attachSno1[] = request.getParameterValues("attachSno");
                if (attachSno1 != null) {

                    for (int at = 0; at < attachSno1.length; at++) {
                        contractDAO.contraAttachRecheckUpdate(attachSno1[at], contractCode);
                    }
                }
            }

        }
        if (insuranceTagged.length > 1) {
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            List<MultipartFile> multipartFiles = multipartRequest.getFiles("attachments");
            String documentNames[] = request.getParameterValues("documentname");

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

                List<ContractAttach> list = new ArrayList<ContractAttach>();
                for (Iterator<MultipartFile> iterator = multipartFiles.iterator(); iterator.hasNext();) {
                    MultipartFile test = (MultipartFile) iterator.next();
                    fileLength = test.getBytes().length;

                    if (fileLength > 0) {
                        ContractAttach bdpfFile = new ContractAttach();
                        bdpfFile.setFilename(test.getOriginalFilename());

                        bdpfFile.setContent(test.getBytes());

                        bdpfFile.setOrgId(orgId);
                        bdpfFile.setUserId(userId);
                        bdpfFile.setLastmodifiedDate(timestamp);
                        bdpfFile.setCreationDate(timestamp);
                        bdpfFile.setStatus("update0");
                        bdpfFile.setContractCode(contractCode);
                        // bdpfFile.setInsuranceId(insuranceId);
                        bdpfFile.setContentType(test.getContentType());

                        list.add(bdpfFile);
                    }
                    j++;
                }
                contractDAO.contraAttachSave1(list);
                // assetsDAO1.saveAssetAttach(list);

            } catch (Exception e) {
                e.printStackTrace();
            }
            for (int i = 0; i < insuranceTagged.length - 1; i++) {
                if (!"".equals(contStartDate)) {
                    contStartDate1 = (Date) formatter.parse(contStartDate);
                }
                if (!"".equals(contEndDate)) {
                    contEndDate1 = (Date) formatter.parse(contEndDate);
                }
                if (!"".equals(contReviewDate)) {
                    contReviewDate1 = (Date) formatter.parse(contReviewDate);
                }

                if (sno1[i] != null && sno1[i] != "" && !sno1[i].isEmpty()) {
                    ContractCreation contractCreation = new ContractCreation(Integer.parseInt(sno1[i]), orgId, userId, contractTitle, categoryId, contStartDate1, contEndDate1, contReviewDate1, contStatus, classificationId, contractCode, remarks, contractTerm, assetCode, subAssetCode, "", "", status, "CFO EDIT", timestamp);
                    contractDAO.globalSave(contractCreation);
                } else {
                    ContractCreation contractCreation = new ContractCreation(contractCode, orgId, userId, contractTitle, categoryId, contStartDate1, contEndDate1, contReviewDate1, contStatus, classificationId, remarks, contractTerm, assetCode, subAssetCode, attribute4, attribute5, "update0", "CFO EDIT", timestamp, timestamp);
                    contractDAO.globalSave(contractCreation);

                }

                if (sno[i] != null && sno[i] != "" && !sno[i].isEmpty()) {
                    ContractInsuranceTag contractInsuranceTag = new ContractInsuranceTag(Integer.parseInt(sno[i]), orgId, userId, contractCode, insuranceId[i], "update0", timestamp, timestamp);
                    contractDAO.globalSave(contractInsuranceTag);
                } else {
                    ContractInsuranceTag contractInsuranceTag = new ContractInsuranceTag(orgId, userId, contractCode, insuranceId[i], "update0", timestamp, timestamp);
                    contractDAO.globalSave(contractInsuranceTag);
                }

            }
        } else {
            for (int k = 0; k < 1; k++) {
                if (!"".equals(contStartDate)) {
                    contStartDate1 = (Date) formatter.parse(contStartDate);
                }
                if (!"".equals(contEndDate)) {
                    contEndDate1 = (Date) formatter.parse(contEndDate);
                }
                if (!"".equals(contReviewDate)) {
                    contReviewDate1 = (Date) formatter.parse(contReviewDate);
                }
                ContractCreation contractCreation = new ContractCreation(contractCode, orgId, userId, contractTitle, categoryId, contStartDate1, contEndDate1, contReviewDate1, contStatus, classificationId, remarks, contractTerm, assetCode, subAssetCode, attribute4, attribute5, "update0", "CFO APPROVED", timestamp, timestamp);
                contractDAO.globalSave(contractCreation);

                ContractInsuranceTag contractInsuranceTag = new ContractInsuranceTag(orgId, userId, contractCode, insuranceId[k], "update0", timestamp, timestamp);
                contractDAO.globalSave(contractInsuranceTag);
            }
        }

        if (deleteRows.trim().length() != 0) {
            String out[] = deleteRows.split("//");
            for (int j = 0; j < out.length; j++) {
                contractDAO.insutagGridDataDelete(Integer.parseInt(out[j]));
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
                    contractDAO.contraattachmentDelete(Integer.parseInt(nA));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } else {
            if (attachSno == null && attachSnoFull != null) {
                try {
                    contractDAO.contraattachmentDelete(Integer.parseInt(attachSnoFull[0]));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
//        end

        /*MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
         List<MultipartFile> multipartFile = multipartRequest.getFiles("attachmentReference");
         int x = 0;
         for (Iterator<MultipartFile> iterator = multipartFile.iterator(); iterator.hasNext();) {
         MultipartFile test = (MultipartFile) iterator.next();
         if (test.getBytes().length > 0) {
         ContractAttach attach = new ContractAttach(orgId, userId, contractCode, test.getBytes(), test.getContentType(), test.getOriginalFilename(), "update0", timestamp, timestamp);
         //requiattach.add(attach);
         contractDAO.contraAttachSave(attach);
         x++;
         }
         }*/
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("insurance", contractDAO.list("", "InsuranceDetails"));
        return new ModelAndView(new RedirectView("../insurance/approvedContraList.htm"), modelMap);
    }

    @RequestMapping("/insurance/contractAttachDel.htm")
    public void contractAttachDel(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException {
        res.setContentType("text/html;charset=UTF-8");
        HttpSession session = req.getSession();
        String sno = req.getParameter("attchSNo");
        contractDAO.delContraAttach(req, res, sno);
    }

    @RequestMapping("/insurance/contractDetailPaginationList.htm")
    public void contractDetailPaginationList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
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

        List<InsuranceDetails> insurancelist = null;
        BigDecimal insurancelistCount = null;
        Gson gson = new Gson();
        JsonObject jsonResponse = new JsonObject();

        if (searchData == null || searchData.isEmpty()) {
            insurancelist = contractDAO.insuranceList1(userId, orgId, null, searchData, iDisplayStart, displayLength, "desc");
            // insurancelistCount = contractDAO.insurancelistCount(userId, orgId, null, searchData, iDisplayStart, displayLength, "desc");

        } else {
            insurancelist = contractDAO.insuranceList1(userId, orgId, null, searchData, iDisplayStart, displayLength, "asc");
            // insurancelistCount = contractDAO.insurancelistCount(userId, orgId, null, searchData, iDisplayStart, displayLength, "asc");

        }

        // ---------Json setting the value for each action like search,first,previous,last and show dropdown in front end---------
        jsonResponse.add("iDisplayLength", gson.toJsonTree(displayLength));
        jsonResponse.add("iTotalRecords", gson.toJsonTree(insurancelistCount));
        jsonResponse.add("iTotalDisplayRecords", gson.toJsonTree(insurancelistCount));
        jsonResponse.add("sEcho", gson.toJsonTree(sEcho));
        jsonResponse.add("iDisplayStart", gson.toJsonTree(iDisplayStart));
        jsonResponse.add("aaData", gson.toJsonTree(insurancelist));
        out.print(jsonResponse);
        out.flush();
//        System.out.println("jsonResponse" + jsonResponse);

    }

    @RequestMapping("/insurance/contraCategoryPopUp.htm")
    public ModelAndView contraCategoryPopUp(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        modelMap.addAttribute("contraCat", contractDAO.contraCategory());
        return new ModelAndView("../contract/contraCategoryPopUp", modelMap);
    }

    @RequestMapping("/insurance/contraClassifPopUp.htm")
    public ModelAndView contraClassifPopUp(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        modelMap.addAttribute("classf", contractDAO.contraClass());
        return new ModelAndView("../contract/contraClassifPopUp", modelMap);
    }

    @RequestMapping("/insurance/insuranTagPopUp.htm")
    public ModelAndView insuranTagPopUp(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        modelMap.addAttribute("insurance1", contractDAO.insurDetail());
        return new ModelAndView("../contract/insuranTagPopUp", modelMap);
    }

    @RequestMapping("/insurance/propTagPopUp.htm")
    public ModelAndView propTagPopUp(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        modelMap.addAttribute("subAsset", contractDAO.subAssetMast());
        return new ModelAndView("../contract/propTagPopUp", modelMap);
    }
    
    @RequestMapping("/insurance/insurancePropPopUp.htm")
    public ModelAndView insurancePropPopUp(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        modelMap.addAttribute("subAsset", contractDAO.subAssetMast());
        return new ModelAndView("../contract/insurancePropPopUp", modelMap);
    }

    //---------------------Contract Additional Attachments---------------------------------------------//
    @RequestMapping("/insurance/expiredContractList.htm")
    public ModelAndView expiredContractList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
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
            map.addAttribute("expList", contractDAO.expContractList());
        } else {
            map.addAttribute("expList", contractDAO.expContractList1(fromDate, toDate));
        }
        return new ModelAndView("../contract/expiredContractList", map);
    }


    //---------------------Contract Attchment---------------------------------------------//
    @RequestMapping("/insurance/additionalDocumentsForm.htm")
    public ModelAndView additionalDocumentsForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String contractCode = request.getParameter("contractCode");
        map.addAttribute("action", request.getParameter("action"));
        map.addAttribute("contDocument", contractDAO.ContractAttachlist(contractCode));
        map.addAttribute("fileSize", userDAO.fileSize());
        return new ModelAndView("../contract/additionalDocumentsForm", map);
    }

    @RequestMapping("/insurance/contractAttachDownload.htm")
    public void contractAttachDownload(HttpServletRequest req, HttpServletResponse res) throws FileNotFoundException, IOException {
        String sno = req.getParameter("sno");
        ContractAttach doc = contractDAO.getcontractAttach(Integer.parseInt(sno));
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

    @RequestMapping("/insurance/InsuranceAttachDocuForm.htm")
    public ModelAndView InsuranceAttachDocuForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String insuranceId = request.getParameter("insuranceId");
        map.addAttribute("action", request.getParameter("action"));
        map.addAttribute("InsurDocument", contractDAO.InsuranceAttachlist(insuranceId));
        map.addAttribute("fileSize", userDAO.fileSize());
        return new ModelAndView("../insurance/InsuranceAttachDocuForm", map);
    }

    //insurance Attach Download  
    @RequestMapping("/insurance/insuranceAttachDownload.htm")
    public void insuranceAttachDownload(HttpServletRequest req, HttpServletResponse res) throws FileNotFoundException, IOException {
        String sno = req.getParameter("sno");
        InsuranceAttach doc = contractDAO.getInsuranceAttach(Integer.parseInt(sno));
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

    ////Contract Creation delete method  
    @RequestMapping("/insurance/contraDel.htm")
    public ModelAndView contraDel(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("pk");
        String contractCode = req.getParameter("contractCode");
        masterDAO.globalInactive(sno, "ContractCreation");
        masterDAO.insTagInactive(contractCode, "ContractInsuranceTag");
        modelMap.addAttribute("message", "Data Inactivated Successfully...");
        return new ModelAndView(new RedirectView("contractCreationList.htm"), modelMap);
    }

    @RequestMapping("/insurance/contraActive.htm")
    public ModelAndView contraActive(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("pk");
        String contractCode = req.getParameter("contractCode");
        masterDAO.globalActive(sno, "ContractCreation");
        masterDAO.insTagActive(contractCode, "ContractInsuranceTag");
        modelMap.addAttribute("message", "Data Activated Successfully...");
        return new ModelAndView(new RedirectView("contractCreationList.htm"), modelMap);
    }

    /////////////contract Approval/////////////
    @RequestMapping("/insurance/contractApprovalList.htm")
    public ModelAndView contractApprovalList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Approval 1";
        String submoduleName = "Contract Creation";
        map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        map.addAttribute("contCreat", contractDAO.contraList2(userId, orgId, null, "Pending"));
        return new ModelAndView("../contract/contractApprovalList", map);
    }

    //contract approval form
    @RequestMapping("/insurance/contractApprovalForm.htm")
    public ModelAndView contractApprovalForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession();
        String contractCode = request.getParameter("contractCode");
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String link = "../insurance/contractCreationForm.htm";
        String tab = "Contract Creation";
        modelMap.addAttribute("category", userDAO.formLabelMapping(link, tab));
//        modelMap.addAttribute("approvList", contractDAO.editList(contractCode));
//        modelMap.addAttribute("contraEditList", contractDAO.editList(contractCode));
//        modelMap.addAttribute("subAssetDetail", contractDAO.subAssetDetails1());
//        modelMap.addAttribute("attachment", contractDAO.ContractAttachlist(contractCode));
        modelMap.addAttribute("unitContractDetailsList", contractDAO.unitContractDetailsList(userId, orgId, contractCode));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../contract/contractApprovalForm", modelMap);
    }

    //approval form submit method
    @RequestMapping("/insurance/contractApprovalFormSubmit.htm")
    public ModelAndView contractApprovalFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException, MessagingException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk[] = request.getParameterValues("pk");
        String status[] = request.getParameterValues("status");
        String reviewerComments = request.getParameter("reviewerComments");
        String reviewerRecordStatus = request.getParameter("reviewerRecordStatus");
        String contractCode = request.getParameter("contractTitle");
        contractDAO.updatecontractApprovalStatus("Approved",contractCode);
        //String delfiles = request.getParameter("tobedel");
//        java.util.Date today = new java.util.Date();
//        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
//        if (!reviewerRecordStatus.equals("RECHECK")) {
//            contractDAO.approv2Update(contractCode, reviewerComments, "GFC APPROVED");
//            modelMap.addAttribute("approvList", contractDAO.contraApprovList(userId, orgId, contractCode));
//        }
//        if (reviewerRecordStatus.equals("RECHECK")) {
//            contractDAO.ContraRecheck1Update(contractCode, reviewerComments, reviewerRecordStatus);
//            modelMap.addAttribute("contCreat", contractDAO.contraList2(userId, orgId, null, "Contract Created"));
//        }
//        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
//        List<MultipartFile> multipartFiles = multipartRequest.getFiles("attachments");
//        String documentNames[] = request.getParameterValues("documentname");
//
//        final String dir = System.getProperty("user.dir");
//        File f = new File(dir);
//        String path = f.getParent();
//        f = new File(path);
//        path = f.getParent();
//        f = new File(path);
//
//        try {
//            int j = 0, fileLength = 0;
//            String filename;
//            String filePath = "";
//
//            List<ContractAttach> list = new ArrayList<ContractAttach>();
//            for (Iterator<MultipartFile> iterator = multipartFiles.iterator(); iterator.hasNext();) {
//                MultipartFile test = (MultipartFile) iterator.next();
//                fileLength = test.getBytes().length;
//
//                if (fileLength > 0) {
//                    ContractAttach bdpfFile = new ContractAttach();
//                    bdpfFile.setFilename(test.getOriginalFilename());
//
//                    bdpfFile.setContent(test.getBytes());
//
//                    bdpfFile.setOrgId(orgId);
//                    bdpfFile.setUserId(userId);
//                    bdpfFile.setLastmodifiedDate(timestamp);
//                    bdpfFile.setCreationDate(timestamp);
//                    bdpfFile.setStatus("update0");
//                    bdpfFile.setContractCode(contractCode);
//                    // bdpfFile.setInsuranceId(insuranceId);
//                    bdpfFile.setContentType(test.getContentType());
//
//                    list.add(bdpfFile);
//                }
//                j++;
//            }
//            contractDAO.contraAttachSave1(list);
//            // assetsDAO1.saveAssetAttach(list);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//            if (!delfiles.equals("")) {
//                String[] totalfiles = delfiles.split(",");
//                for (int m = 0; m < totalfiles.length; m++) {
//
//                    ContractAttach doc = contractDAO.getattchs1(Integer.parseInt(totalfiles[m]));
//                    //assetsDAO1.delete(doc.getAttachName(), doc.getAssetAttach());
//
//                    contractDAO.delattachfiles("ContractAttach", "sno", Integer.parseInt(totalfiles[m]));
//                }
//            }
        /*MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
         List<MultipartFile> multipartFile1 = multipartRequest1.getFiles("attachmentReference");
         if (!multipartFile1.isEmpty()) {

         ContractAttach contractAttach = new ContractAttach();
         for (Iterator<MultipartFile> iterator = multipartFile1.iterator(); iterator.hasNext();) {
         MultipartFile test = (MultipartFile) iterator.next();
         if (test.getBytes().length > 0) {
         contractAttach.setUserId(userId);
         contractAttach.setOrgId(orgId);
         contractAttach.setContractCode(contractCode);
         contractAttach.setFilename(test.getOriginalFilename());
         contractAttach.setContentType(test.getContentType());
         contractAttach.setLastmodifiedDate(sqlTimestamp);
         contractAttach.setStatus("FileEdited");
         contractDAO.contractAttachSave(contractAttach);
         }
         }
         }*/
//        Common cm = new Common();
//        String subject = "", tbody = "", mailbody = "", email = "", fileName = "", contraCod = "", contractTerm = "", propertyCod = "";
//        String userEmail = "excelarete@gmail.com";
//        String password = "excel123";
//        String toEmail = "";
//        List<UserRegistration> ud = tenantDetailsDAO.udList("CFO");
//        for (UserRegistration udlist : ud) {
//            userId = udlist.getUserId();
//            email = udlist.getEmail();
//
//            if (!userEmail.isEmpty() && !password.isEmpty() && !email.isEmpty()) {
//                List<ContractCreation> td = contractDAO.tdList(userId, orgId, contractCode);
//                StringBuilder emailId = new StringBuilder(email);
//                if (td.size() > 0) {
//                    int i = 1;
//                    for (ContractCreation tdlist : td) {
//
//                        contraCod = tdlist.getContractCode();
//                        contractTerm = tdlist.getContractTerm();
//                        propertyCod = tdlist.getPropertyCod();
//                    }
//                    emailId.append(",");
//                    emailId.append(toEmail);
//                    String[] sendEmail = emailId.toString().split(",");
//                    subject = "Contract Code: " + contractCode;
//                    String filepath = request.getSession().getServletContext().getRealPath("common\\theme\\images\\logo1.png");
//                    mailbody = "<html><body>Dear Sir/Madam,<br/><br/><br/>You need to give an approval for Contract Details. Contract Code : " + contraCod + " for " + contractTerm + ""
//                            + " Please Approve this Contract Details. <br/><br/>If approved ignore this mail. "
//                            + "</body>"
//                            + "<br/><br/>Thanks & Regards"
//                            + "<br/>Al-Hashar Team.</html>";
//                    ByteArrayOutputStream baos = new ByteArrayOutputStream();
//                    baos.close();
//                    cm.sendEmail(userEmail, password, sendEmail, subject, mailbody, baos, fileName);
//                }
//            }
//        }
//        modelMap.addAttribute("message", "Data Saved Successfully...");
//        return new ModelAndView("../contract/contractApprovalList", modelMap);
        return new ModelAndView(new RedirectView("../insurance/contractApprovalList.htm"), modelMap);

    }

    //Approval 2 list
    @RequestMapping("/insurance/contractApprove2List.htm")
    public ModelAndView contractApprove2List(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Approval 2";
        String submoduleName = "Contract Creation";
        map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        map.addAttribute("contraApp1", contractDAO.contraList3(userId, orgId, null, "GFC APPROVED"));
        return new ModelAndView("../contract/ContractApprove2List", map);
    }

    //Approval 2 form
    @RequestMapping("/insurance/contractApprove2Form.htm")
    public ModelAndView contractApprove2Form(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession();
        String contractCode = request.getParameter("contractCode");
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String link = "../insurance/contractCreationForm.htm";
        String tab = "Contract Creation";
        modelMap.addAttribute("category", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("attachment", contractDAO.ContractAttachlist(contractCode));
        modelMap.addAttribute("approvList", contractDAO.editList(contractCode));
        modelMap.addAttribute("cont", contractDAO.list("", "ContractCreation"));
        modelMap.addAttribute("contraEditList", contractDAO.editList(contractCode));
        modelMap.addAttribute("contract", contractDAO.ContraApprovList(userId, orgId, contractCode));
        modelMap.addAttribute("subAssetDetail", contractDAO.subAssetDetails1());
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../contract/contractApprove2Form", modelMap);
    }

    //Approval 2 save method for contracts
    @RequestMapping("/insurance/contractApproval2Submit.htm")
    public ModelAndView contractApproval2Submit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk[] = request.getParameterValues("pk");
        String status[] = request.getParameterValues("status");
        String reviewerComments2 = request.getParameter("reviewerComments2");
        String contractCode = request.getParameter("contractCode");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        contractDAO.approv3Update(contractCode, reviewerComments2, "CFO APPROVED");
        modelMap.addAttribute("approvList", contractDAO.contraApprovList(userId, orgId, contractCode));
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        List<MultipartFile> multipartFiles = multipartRequest.getFiles("attachments");
        String documentNames[] = request.getParameterValues("documentname");

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

            List<ContractAttach> list = new ArrayList<ContractAttach>();
            for (Iterator<MultipartFile> iterator = multipartFiles.iterator(); iterator.hasNext();) {
                MultipartFile test = (MultipartFile) iterator.next();
                fileLength = test.getBytes().length;

                if (fileLength > 0) {
                    ContractAttach bdpfFile = new ContractAttach();
                    bdpfFile.setFilename(test.getOriginalFilename());

                    bdpfFile.setContent(test.getBytes());

                    bdpfFile.setOrgId(orgId);
                    bdpfFile.setUserId(userId);
                    bdpfFile.setLastmodifiedDate(timestamp);
                    bdpfFile.setCreationDate(timestamp);
                    bdpfFile.setStatus("update0");
                    bdpfFile.setContractCode(contractCode);
                    // bdpfFile.setInsuranceId(insuranceId);
                    bdpfFile.setContentType(test.getContentType());

                    list.add(bdpfFile);
                }
                j++;
            }
            contractDAO.contraAttachSave1(list);
            // assetsDAO1.saveAssetAttach(list);

        } catch (Exception e) {
            e.printStackTrace();
        }

        /*MultipartHttpServletRequest multipartRequest1 = (MultipartHttpServletRequest) request;
         List<MultipartFile> multipartFile1 = multipartRequest1.getFiles("attachmentReference");
         if (!multipartFile1.isEmpty()) {

         ContractAttach contractAttach = new ContractAttach();
         for (Iterator<MultipartFile> iterator = multipartFile1.iterator(); iterator.hasNext();) {
         MultipartFile test = (MultipartFile) iterator.next();
         if (test.getBytes().length > 0) {
         contractAttach.setUserId(userId);
         contractAttach.setOrgId(orgId);
         contractAttach.setContractCode(contractCode);
         contractAttach.setFilename(test.getOriginalFilename());
         contractAttach.setContentType(test.getContentType());
         contractAttach.setLastmodifiedDate(sqlTimestamp);
         contractAttach.setStatus("FileEdited");
         contractDAO.contractAttachSave(contractAttach);
         }
         }
         }*/
        modelMap.addAttribute("message", "Data Saved Successfully...");
        return new ModelAndView(new RedirectView("../insurance/contractApprove2List.htm"), modelMap);
//        return new ModelAndView("../contract/ContractApprove2List", modelMap);

    }

    //approved contract list
    @RequestMapping("/insurance/approvedContraList.htm")
    public ModelAndView approvedContraList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        if (fromDate != null && toDate != null) {
            if (fromDate.contains("frdate") && toDate.contains("todate")) {
                fromDate = null;
                toDate = null;
            }
        }
        
//        if (fromDate == null || toDate == null) {
            map.addAttribute("contCreat", contractDAO.contraList(userId, orgId, null, "Approved"));
            System.out.println("List="+contractDAO.contraList(userId, orgId, null, "Approved"));
//        } else {
//            map.addAttribute("contCreat", contractDAO.contraList1(userId, orgId, null, "Approved",fromDate,toDate));
//        }
        
        return new ModelAndView("../contract/approvedContraList", map);
    }

    //rejected contract list
    @RequestMapping("/insurance/rejectedContractList.htm")
    public ModelAndView rejectedContractList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        map.addAttribute("contCreat", contractDAO.rejectContractList1(userId, orgId, null, "REJECTED"));
        return new ModelAndView("../contract/rejectedContractList", map);
    }

    //rejected contract view page
    @RequestMapping("/insurance/rejectedContractView.htm")
    public ModelAndView rejectedContractView(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession();
        String contractCode = request.getParameter("contractCode");
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String link = "../insurance/contractCreationForm.htm";
        String tab = "Contract Creation";

        modelMap.addAttribute("category", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("contraEditList", contractDAO.editList(contractCode));
        modelMap.addAttribute("approvList", contractDAO.editList(contractCode));
        modelMap.addAttribute("contract", contractDAO.contraApprovList(userId, orgId, contractCode));
        modelMap.addAttribute("cont", contractDAO.list("", "ContractCreation"));
        modelMap.addAttribute("attachment", contractDAO.ContractAttachlist(contractCode));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../contract/rejectedContractView", modelMap);
    }

    //approved contracts view page
    @RequestMapping("/insurance/acceptedContractView.htm")
    public ModelAndView acceptedContractView(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession();
        String contractCode = request.getParameter("contractCode");
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();

        String link = "../insurance/contractCreationForm.htm";
        String tab = "Contract Creation";

        modelMap.addAttribute("category", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("contraEditList", contractDAO.editList(contractCode));
        modelMap.addAttribute("approvList", contractDAO.editList(contractCode));
        modelMap.addAttribute("contract", contractDAO.contraApprovList(userId, orgId, contractCode));
        modelMap.addAttribute("subAssetDetail", contractDAO.subAssetDetails1());
        modelMap.addAttribute("attachment", contractDAO.ContractAttachlist(contractCode));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../contract/acceptedContractView", modelMap);
    }

    //save method for rejected contracts
    @RequestMapping("/insurance/rejectedContraSubmit.htm")
    public ModelAndView rejectedContraSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String contractCode = request.getParameter("contractCode");
        String reviewerRecordStatus = request.getParameter("reviewerRecordStatus");
        String reviewerComments = request.getParameter("reviewerComments");
        String reviewerComments2 = request.getParameter("reviewerComments2");
//        if (reviewerComments != null) {
//            contractDAO.ContraReject1Update(contractCode, reviewerComments, reviewerRecordStatus);
//        }
//        if (reviewerComments2 != null) {
//            contractDAO.ContraReject2Update(contractCode, reviewerComments2, reviewerRecordStatus);
//        }
         contractDAO.updatecontractRejectedRemark(reviewerComments,contractCode);
         contractDAO.updatecontractApprovalStatus("Rejected",contractCode);
        map.addAttribute("contCreat", contractDAO.rejectContractList1(userId, orgId, null, "REJECTED"));
        return new ModelAndView(new RedirectView("../insurance/rejectedContractList.htm"), map);
//        return new ModelAndView("../contract/rejectedContractList", map);
    }

    //save method for rechecked contracts
    @RequestMapping("/insurance/recheckContraSubmit.htm")
    public ModelAndView recheckContraSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String contractCode = request.getParameter("contractCode");
        String reviewerRecordStatus = request.getParameter("reviewerRecordStatus");
        String reviewerComments = request.getParameter("reviewerComments");
        contractDAO.ContraRecheck1Update(contractCode, reviewerComments, reviewerRecordStatus);
        map.addAttribute("contCreat", contractDAO.contraList2(userId, orgId, null, "Contract Created"));
//        return new ModelAndView("../contract/contractApprovalList", map);
        return new ModelAndView(new RedirectView("../insurance/contractApprovalList.htm"), map);
    }

    //Renewal of contracts
    @RequestMapping("/insurance/contractRenew.htm")
    public ModelAndView contractRenew(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        String contractCode = request.getParameter("contractCode");
        String categoryId = request.getParameter("contractCategoryId");
        String classificationId = request.getParameter("contClassificationId");
        String propertyCod = request.getParameter("propertyCod");
        String flatCod = request.getParameter("flatCod");

        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String link = "../insurance/contractCreationForm.htm";
        String tab = "Contract Creation";
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("category", userDAO.formLabelMapping(link, tab));
            modelMap.addAttribute("insurance", contractDAO.list(sno, "InsuranceDetails"));
            modelMap.addAttribute("attachment", contractDAO.ContractAttachlist(contractCode));
            modelMap.addAttribute("contCreat", contractDAO.list(sno, "ContractCreation"));
            modelMap.addAttribute("catId", contractDAO.contCategory(sno, categoryId));
            modelMap.addAttribute("classId", contractDAO.contClassfName(sno, classificationId));
            modelMap.addAttribute("insuranList", contractDAO.insuranceNoList(contractCode));
            modelMap.addAttribute("contraEditList", contractDAO.editList(contractCode));
            modelMap.addAttribute("subAssetDetail", contractDAO.subAssetDetails(sno, propertyCod, flatCod));

        }
        modelMap.addAttribute("insurance1", contractDAO.insurComp());
        modelMap.addAttribute("classf", contractDAO.contraClass());
        modelMap.addAttribute("contraCat", contractDAO.contraCategory());
        modelMap.addAttribute("category", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("attachment", contractDAO.ContractAttachlist(contractCode));
        modelMap.addAttribute("insurance", contractDAO.insurDetail());

        modelMap.addAttribute("action", request.getParameter("action"));

        return new ModelAndView("../contract/contractRenew", modelMap);
    }

    //Save method for Renewed Contracts 
    @RequestMapping("/insurance/contractRenewSubmit.htm")
    public ModelAndView contractRenewSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, IOException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String contractCode = request.getParameter("contractCode");
        String contReviewDate = request.getParameter("contReviewDate");
        String contStartDate = request.getParameter("contStartDate");
        String contEndDate = request.getParameter("contEndDate");
        String contractTitle = request.getParameter("contractTitle");
        String deleteRows = request.getParameter("deleteRows");
        String deleteRows1 = request.getParameter("deleteRows1");
        String delfiles = request.getParameter("tobedel");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date contReviewDate1 = null;
        Date contEndDate1 = null;
        Date contStartDate1 = null;
        if (!"".equals(contReviewDate) && null != contReviewDate) {
            contReviewDate1 = (Date) formatter.parse(contReviewDate);
        }
        if (!"".equals(contEndDate)) {
            contEndDate1 = (Date) formatter.parse(contEndDate);
        }
        if (!"".equals(contStartDate)) {
            contStartDate1 = (Date) formatter.parse(contStartDate);
        }
        String contReviewDate2 = null;
        if (!"".equals(contReviewDate1) && null != contReviewDate1) {
            contReviewDate2 = format.format(contReviewDate1);
        }

        String contEndDate2 = format.format(contEndDate1);
        String contStartDate2 = format.format(contStartDate1);
        String status = request.getParameter("Renewed");
        contractDAO.ContraRenewUpdate(contractCode, contReviewDate2, status, contractTitle, contEndDate2, contStartDate2);
        map.addAttribute("contCreat", contractDAO.contraList2(userId, orgId, null, "Contract Created"));
        map.addAttribute("expList", contractDAO.expContractList());

        if (deleteRows.trim().length() != 0) {
            String out[] = deleteRows.split("//");
            for (int j = 0; j < out.length; j++) {
                contractDAO.insutagGridDataDelete(Integer.parseInt(out[j]));
            }
        }
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        List<MultipartFile> multipartFiles = multipartRequest.getFiles("attachments");
        String documentNames[] = request.getParameterValues("documentname");

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

            List<ContractAttach> list = new ArrayList<ContractAttach>();
            for (Iterator<MultipartFile> iterator = multipartFiles.iterator(); iterator.hasNext();) {
                MultipartFile test = (MultipartFile) iterator.next();
                fileLength = test.getBytes().length;

                if (fileLength > 0) {
                    ContractAttach bdpfFile = new ContractAttach();
                    bdpfFile.setFilename(test.getOriginalFilename());

                    bdpfFile.setContent(test.getBytes());

                    bdpfFile.setOrgId(orgId);
                    bdpfFile.setUserId(userId);
                    bdpfFile.setLastmodifiedDate(timestamp);
                    bdpfFile.setCreationDate(timestamp);
                    bdpfFile.setStatus("update0");
                    bdpfFile.setContractCode(contractCode);
                    // bdpfFile.setInsuranceId(insuranceId);
                    bdpfFile.setContentType(test.getContentType());

                    list.add(bdpfFile);
                }
                j++;
            }
            contractDAO.contraAttachSave1(list);
            // assetsDAO1.saveAssetAttach(list);

        } catch (Exception e) {
            e.printStackTrace();
        }
        if (!delfiles.equals("")) {
            String[] totalfiles = delfiles.split(",");
            for (int m = 0; m < totalfiles.length; m++) {

                ContractAttach doc = contractDAO.getattchs1(Integer.parseInt(totalfiles[m]));
                //assetsDAO1.delete(doc.getAttachName(), doc.getAssetAttach());

                contractDAO.delattachfiles("ContractAttach", "sno", Integer.parseInt(totalfiles[m]));
            }
        }
        //            for attachment
        /*String attachSno[] = request.getParameterValues("attachSno");
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
         contractDAO.contraattachmentDelete(Integer.parseInt(nA));
         } catch (Exception e) {
         e.printStackTrace();
         }
         }
         } else {
         if (attachSno == null && attachSnoFull != null) {
         try {
         contractDAO.contraattachmentDelete(Integer.parseInt(attachSnoFull[0]));
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
         ContractAttach attach = new ContractAttach(orgId, userId, contractCode, test.getBytes(), test.getContentType(), test.getOriginalFilename(), "update0", timestamp, timestamp);
         //requiattach.add(attach);
         contractDAO.contraAttachSave(attach);
         x++;
         }
         }*/
//        return new ModelAndView("../contract/expiredContractList", map);
        return new ModelAndView(new RedirectView("../insurance/expiredContractList.htm"), map);
    }

    @RequestMapping("/insurance/unitContractTemplateList.htm")
    public ModelAndView unitContractTemplateList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Contract Creation";
        String submoduleName = "Contract Creation";
        String status = request.getParameter("status");
        String recordStatus = "Contract Created";
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        String insuranceNo2 = request.getParameter("insuranceNo");
        String sNo = request.getParameter("pk");
        
        map.addAttribute("unitContractTemplateList", contractDAO.unitContractTemplateList(userId, null)); 

        return new ModelAndView("../contract/unitsContractTemplate", map);
    }
    
    @RequestMapping("/insurance/unitsContractTemplateForm.htm")
    public ModelAndView unitsContractTemplateForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Contract Creation";
        String submoduleName = "Contract Creation";
        String status = request.getParameter("status");
        String recordStatus = "Contract Created";
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        String insuranceNo2 = request.getParameter("insuranceNo");

        String sNo = request.getParameter("pk");
        
        String action = request.getParameter("action");

        if(sNo != null) {
            map.addAttribute("unitContractTemplateList", contractDAO.unitContractTemplateList(userId, sNo)); 
            map.addAttribute("action", action);
        }
        
        map.addAttribute("action", request.getParameter("action"));
         
        return new ModelAndView("../contract/unitsContractTemplateForm", map);
    }
    
    @RequestMapping("/insurance/unitsContractTemplateFormSubmit.htm")
    public ModelAndView unitsContractTemplateFormSubmit(HttpServletRequest request, HttpServletResponse response) throws SQLException {
    
        ModelMap modelMap = new ModelMap(); 
        HttpSession session = request.getSession(true);
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String sNo = request.getParameter("pk");
        String contractCategory=request.getParameter("assetType");
        String contractType=request.getParameter("assetType2");
        String contractPeriod=request.getParameter("assetType3");
        String unitType=request.getParameter("assetType4");
        String unitDescription=request.getParameter("assetType5");
        String propertyName=request.getParameter("jointeeName1");
        String monthlyRentIncome=request.getParameter("propertyName");
        String expectedSecurityDeposit=request.getParameter("propertyName2");
        String serviceCharges=request.getParameter("propertyName3");
        String paymentType=request.getParameter("assetType6");
        String vat=request.getParameter("propertyName4");
        String isFitOutApplicable=request.getParameter("propertyName5");
        String fitOutPeriod=request.getParameter("fillOutPeriod");
        
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss a");
        
        List<UnitsContractTemplate> gridData1 = new ArrayList<UnitsContractTemplate>();
         
         if (sNo == null || sNo.equals("")){
             UnitsContractTemplate it = new UnitsContractTemplate(userId, contractCategory, contractType, contractPeriod, unitType, unitDescription, propertyName, monthlyRentIncome, expectedSecurityDeposit, serviceCharges, paymentType, vat, Boolean.FALSE, fitOutPeriod, newdate, Boolean.TRUE);
             gridData1.add(it);
             
             contractDAO.unitContractTemplateListSave(gridData1);
             
         }else{
             
             UnitsContractTemplate it = new UnitsContractTemplate(Integer.parseInt(sNo), userId, contractCategory, contractType, contractPeriod, unitType, unitDescription, propertyName, monthlyRentIncome, expectedSecurityDeposit, serviceCharges, paymentType, vat, Boolean.FALSE, fitOutPeriod, newdate, Boolean.TRUE);
             
             contractDAO.newUnitContractTemplateListSave(it);
         }
        return new ModelAndView(new RedirectView("unitContractTemplateList.htm"), modelMap);
        
        }
    
    @RequestMapping("/insurance/selectPropertyName.htm")
    public ModelAndView selectPropertyName(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("assetDetails", assetDAO.selectAssetDetails());
        return new ModelAndView("../management/selectPropertyName", modelMap);
    }
    
    @RequestMapping("/insurance/tenantContractList.htm")
    public ModelAndView tenantContractList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Contract Creation";
        String submoduleName = "Contract Creation";
        //String status = request.getParameter("status");
        String recordStatus = "Contract Created";
        String fromDate = request.getParameter("startDate");
        String toDate = request.getParameter("toDate");
        String insuranceNo2 = request.getParameter("insuranceNo");
        String unitNo = request.getParameter("unitNo");
        
        List<String> startDateValues = new ArrayList<>();

     //Iterate over the unitContractList and extract the startDate values
   List<ContractUnitDetails> unitContractList1 = contractDAO.unitContractList1(userId, orgId);
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
    for (ContractUnitDetails unitContract : unitContractList1) {
        Date startDate = unitContract.getStartDate();
        Date endDate = unitContract.getEndDate();
        String RenewalNotification = unitContract.getRenewalNotification();
        if (startDate != null) {
            String Unitno = unitContract.getUnitNo();
            String status = unitContract.getStatus();
            LocalDate today = LocalDate.now();
            LocalDate startDateLocalDate = startDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

            if (today.isEqual(startDateLocalDate) && status.equals("Approved")) {
                tenantDetailsDAO.updateSubasset1(Unitno, "Occupied");
                //tenantDetailsDAO.updateContractUnitDetails(Unitno, "Occupied");
            }

            String startDateValue = dateFormat.format(startDate);
            startDateValues.add(startDateValue);
        }
        if (endDate != null) {
            if ("Before 3 Months".equals(RenewalNotification)) {
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(endDate);
                calendar.add(Calendar.MONTH, -3); // Subtract 3 months from the endDate
                Date approxRenewalDate = calendar.getTime();
                LocalDate today = LocalDate.now();
                LocalDate sapproxRenewalLocalDate = approxRenewalDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

            if (today.isEqual(sapproxRenewalLocalDate)) {
                //tenantDetailsDAO.updateSubasset1(Unitno, "Occupied");
                //send notification to bell icon
                //tenantDetailsDAO.updateContractUnitDetails(Unitno, "Occupied");
            }
                
            }
            
        }
    }

              map.addAttribute("unitContractList", contractDAO.unitContractList(userId, orgId, null));
              
        return new ModelAndView("../contract/tenantContractList", map);
    }
    
    @RequestMapping("/insurance/tenantContractForm.htm")
    public ModelAndView tenantContractForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String pk = request.getParameter("pk");
        
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Contract Creation";
        String submoduleName = "Contract Creation";
        String status = request.getParameter("status");
        String recordStatus = "Contract Created";
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        String insuranceNo2 = request.getParameter("insuranceNo");
        
        String contractCode = request.getParameter("contractCode");
        
        
        if (contractCode == null) {

            ArrayList validuser = (ArrayList) contractDAO.getUnitContractCode(null, contractCode, null);
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

            contractCode = "CONT" + "-" + ordno;
        }
        
        map.addAttribute("contractCode", contractCode);
        map.addAttribute("landLord", masterDAO.listActive1(pk, "LandLordDetails"));
               //map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../contract/tenantContractForm", map);
    }
    
    @RequestMapping("/insurance/landlordContractsList.htm")
    public ModelAndView landlordContractsList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Contract Creation";
        String submoduleName = "Contract Creation";
        String status = request.getParameter("status");
        String recordStatus = "Contract Created";
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        String insuranceNo2 = request.getParameter("insuranceNo");
               //map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../contract/landlordContractsList", map);
    }
    
    @RequestMapping("/insurance/landlordContractsForm.htm")
    public ModelAndView landlordContractsForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Contract Creation";
        String submoduleName = "Contract Creation";
        String status = request.getParameter("status");
        String recordStatus = "Contract Created";
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        String insuranceNo2 = request.getParameter("insuranceNo");
               //map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../contract/landlordContractsForm", map);
    }
    
    @RequestMapping("/insurance/selectlandLord.htm")
    public ModelAndView selectAccAssetDetails(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("pk");
        modelMap.addAttribute("landLord", masterDAO.listActive(sno, "LandLordDetails"));
        return new ModelAndView("selectlandLord", modelMap);
    }
    
    @RequestMapping("/insurance/selectUnitNumber.htm")
    public ModelAndView selectUnitNumber(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("pk");
        modelMap.addAttribute("subAssetDetails", contractDAO.subAssetDetailslist(null));
        return new ModelAndView("selectUnitNumber", modelMap);
    }
    
    @RequestMapping("/insurance/tenantContractFormSubmit.htm")
    public ModelAndView tenantContractFormSubmit(HttpServletRequest req, HttpServletResponse res) throws ParseException, IOException, HibernateException, SQLException {

        HttpSession session = req.getSession(true);

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        ModelMap modelMap = new ModelMap();
        String pk = req.getParameter("pk");
        
        
        String contractode = req.getParameter("contractode");
        String propertyName = req.getParameter("propertyName");
        String propertyCode = req.getParameter("propertyCode");
        String unitNo = req.getParameter("unitNo");
        
        //LandLord Details
        String landlordname = req.getParameter("landlordName");
        String landlordId = req.getParameter("landlordId");
        
        //Customer Details
        String customerName = req.getParameter("customerName");
        String customerReference = req.getParameter("customerReference");
        String customerRefId = req.getParameter("customerRefId");
        String businessName = req.getParameter("businessName");
        String crNo = req.getParameter("crNo");
        String customerId = req.getParameter("customerId");
        String customerType = req.getParameter("customerType");
        String customerPerson = req.getParameter("customerPerson");
        String customerEmailId = req.getParameter("customerEmailId");
        String phoneNo = req.getParameter("phoneNo");
        
        String contactPersonName[] = req.getParameterValues("contactPersonName");
        String emailId[] = req.getParameterValues("emailId");
        String phoneNumber[] = req.getParameterValues("phoneNumber");
        
        
        
        String billingAddress = req.getParameter("billingAddress");
        String permanentAddress = req.getParameter("permanentAddress");
        String jointeeName1 = req.getParameter("jointeeName1");
        String jointeeAddress1 = req.getParameter("jointeeAddress1");
        String jointeeName2 = req.getParameter("jointeeName2");
        String jointeeAddress2 = req.getParameter("jointeeAddress2");
        String sponsorName = req.getParameter("sponsorName");
        String ifWorking = req.getParameter("ifWorking");
        String SponserAddress = req.getParameter("SponserAddress");
        String sponsorEmailId = req.getParameter("sponsorEmailId");
        String document = req.getParameter("document");
        String idCardType = req.getParameter("idCardType");
        
        
        String contractType = req.getParameter("contractType");
        String contractCategory = req.getParameter("contractCategory");
        String isPeriodcheckBox = req.getParameter("isPeriodcheckBox");
        String contractPeriod = req.getParameter("contractPeriod");
        String unitDescription = req.getParameter("unitDescription");
        String monthlyRentIncome = req.getParameter("monthlyRentIncome");
        String expectedSecurityDeposit = req.getParameter("expectedSecurityDeposit");
        String serviceCharges = req.getParameter("serviceCharges");
        String paymentType = req.getParameter("paymentType");
        String vatPercent = req.getParameter("vatPercent");
        
        String startDate = req.getParameter("startDate");
        String endDate = req.getParameter("endDate");
        String renewalDate = req.getParameter("renewalDate");
        String renewalNotification = req.getParameter("renewalNotification");
        String insuranceTagged = req.getParameter("insuranceTagged");
        String noticePeriod = req.getParameter("noticePeriod");
        String actualRentIncome = req.getParameter("actualRentIncome");
        String actualYearlyIncome = req.getParameter("actualYearlyIncome");
        
        
        
        String municipalCharges = req.getParameter("municipalCharges");
        String maintenanceCharges = req.getParameter("maintenanceCharges");
        
        String pdCheque[] = req.getParameterValues("pdCheque");
        String pdDate[] = req.getParameterValues("pdDate");
        
        String billingCycle = req.getParameter("billingCycle");
        String billingDueDate = req.getParameter("billingDueDate");
        String municipalAgreementNo = req.getParameter("municipalAgreementNo");
        String municipalFormNo = req.getParameter("municipalFormNo");
        String documentAttach = req.getParameter("documentAttach");
        
        String serviceName[] = req.getParameterValues("serviceName");
        String description[] = req.getParameterValues("description");
        String serviceCharge[] = req.getParameterValues("serviceCharge");
        String fixedServiceCharge[] = req.getParameterValues("fixedServiceCharge");
        
        String utilityCategory[] = req.getParameterValues("utilityCategory");
        String utilityName[] = req.getParameterValues("utilityName");
        
        
        //LD
        if (pk == null || pk.equals("")){
        LandLordUnitsDetails lordUnitsDetails = new LandLordUnitsDetails(orgId, userId, landlordId, landlordname, propertyCode, propertyName,
                contractode, unitNo, "Active", newdate, newdate);
       contractDAO.globalSave(lordUnitsDetails);
        }else{
                LandLordUnitsDetails lordUnitsDetails = new LandLordUnitsDetails(Integer.parseInt(pk) ,orgId, userId, landlordId, landlordname, propertyCode, propertyName,
                contractode, unitNo, "Active", newdate, newdate);
       contractDAO.globalSave(lordUnitsDetails);
                }
        //CD
         if (pk == null || pk.equals("")){
        if(customerType.equals("Corporate")){
  
            CustomerUnitDetails cud = new CustomerUnitDetails(orgId, userId, customerName, customerReference, customerRefId, customerId,
                    customerType, businessName, crNo, customerPerson, customerEmailId, phoneNo, unitNo, contractode, propertyName, 
                    propertyCode, "Active", newdate, newdate);
           contractDAO.globalSave(cud);
            
            
            
        }else{
        
            //  String originalImg=null;
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
        MultipartFile multipartFile = multipartRequest.getFile("document");
        //System.out.println(multipartFile.getSize() + "multipartFile");
        String fileName = "";
        // image type of file processing...
        //System.err.println("-------------------------------------------");
        if (multipartFile.getSize() > 0) {
            try {
                InputStream inputStream = null;
                OutputStream outputStream = null;
                inputStream = multipartFile.getInputStream();
                fileName = req.getRealPath("") + File.pathSeparator + "reportfiles" + File.pathSeparator + multipartFile.getOriginalFilename();
                //System.out.println("FIleName:"+fileName);
                outputStream = new java.io.FileOutputStream(fileName);
                document = multipartFile.getOriginalFilename();
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
            
            
            CustomerUnitDetails cud = new CustomerUnitDetails(orgId, userId, customerName, customerReference, customerRefId, customerId, customerType,
                    customerPerson, customerEmailId, phoneNo, unitNo, contractode, propertyName, propertyCode, billingAddress, permanentAddress, 
                    jointeeName1, jointeeName2, jointeeAddress1, jointeeAddress2, sponsorName, ifWorking, SponserAddress, sponsorEmailId, document,
                    idCardType, "Active", newdate, newdate);
            contractDAO.globalSave(cud);
            
            
            
        }
         }else{
             if(customerType.equals("Corporate")){
  
            CustomerUnitDetails cud = new CustomerUnitDetails(Integer.parseInt(pk), orgId, userId, customerName, customerReference, customerRefId, customerId,
                    customerType, businessName, crNo, customerPerson, customerEmailId, phoneNo, unitNo, contractode, propertyName, 
                    propertyCode, "Active", newdate, newdate);
           contractDAO.globalSave(cud);
            
            
            
        }else{
        
            //  String originalImg=null;
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
        MultipartFile multipartFile = multipartRequest.getFile("document");
        //System.out.println(multipartFile.getSize() + "multipartFile");
        String fileName = "";
        // image type of file processing...
        //System.err.println("-------------------------------------------");
        if (multipartFile.getSize() > 0) {
            try {
                InputStream inputStream = null;
                OutputStream outputStream = null;
                inputStream = multipartFile.getInputStream();
                fileName = req.getRealPath("") + File.pathSeparator + "reportfiles" + File.pathSeparator + multipartFile.getOriginalFilename();
                //System.out.println("FIleName:"+fileName);
                outputStream = new java.io.FileOutputStream(fileName);
                document = multipartFile.getOriginalFilename();
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
            
            
            CustomerUnitDetails cud = new CustomerUnitDetails(Integer.parseInt(pk), orgId, userId, customerName, customerReference, customerRefId, customerId, customerType,
                    customerPerson, customerEmailId, phoneNo, unitNo, contractode, propertyName, propertyCode, billingAddress, permanentAddress, 
                    jointeeName1, jointeeName2, jointeeAddress1, jointeeAddress2, sponsorName, ifWorking, SponserAddress, sponsorEmailId, document,
                    idCardType, "Active", newdate, newdate);
            contractDAO.globalSave(cud);
            
            
            
        }
         }
        
         //Multiple Customer Details
       if (pk == null || pk.equals("")){
            for (int i = 0; i < contactPersonName.length; i++) {
            UnitMulipleCustomer umc = new UnitMulipleCustomer(orgId, userId, customerType, contactPersonName[i], emailId[i], phoneNumber[i], contractode, unitNo,
                    "Active", newdate, newdate);
           contractDAO.globalSave(umc);
                    
                    }
       }else{
           for (int i = 0; i < contactPersonName.length; i++) {
            UnitMulipleCustomer umc = new UnitMulipleCustomer(Integer.parseInt(pk), orgId, userId, customerType, contactPersonName[i], emailId[i], phoneNumber[i], contractode, unitNo,
                    "Active", newdate, newdate);
            
               System.out.println("umc"+umc);
           contractDAO.globalSave(umc);
                    
                    }
       }

        //CD
    
        if(monthlyRentIncome == null || vatPercent==""){
            monthlyRentIncome ="0";
        }
        
        if(expectedSecurityDeposit == null || vatPercent==""){
            expectedSecurityDeposit ="0";
        }
        
        if(serviceCharges == null || vatPercent==""){
            serviceCharges ="0";
        }
        
        if(vatPercent == null || vatPercent==""){
            vatPercent ="0.0";
        }
        
        Date startDate1 = null;
        try {
            if(startDate != null || !startDate.equals("")) {
                startDate1 = formatter3.parse(startDate);
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        }
        Date endDate1 = null;
        try {
            if(endDate != null || !endDate.equals("")) {
                endDate1 = formatter3.parse(endDate);
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        }
        Date renewalDate1 = null;
        try {
            if(renewalDate != null || !renewalDate.equals("")) {
                renewalDate1 = formatter3.parse(renewalDate);
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        }
        
        
        if (pk == null || pk.equals("")){
        ContractUnitDetails contractUnitDetails = new ContractUnitDetails(orgId, userId, contractode, contractType, contractCategory,
                isPeriodcheckBox, contractPeriod, unitDescription, propertyName, propertyCode, Integer.parseInt(monthlyRentIncome), Integer.parseInt(expectedSecurityDeposit),
                Integer.parseInt(serviceCharges), paymentType, Double.parseDouble(vatPercent), unitNo, startDate1,
                endDate1, renewalDate1, renewalNotification, insuranceTagged, 
                noticePeriod, actualRentIncome, actualYearlyIncome, "Pending", newdate, "",newdate);
        
        contractDAO.globalSave(contractUnitDetails);
        }else{
            ContractUnitDetails contractUnitDetails = new ContractUnitDetails(Integer.parseInt(pk) ,orgId, userId, contractode, contractType, contractCategory,
                isPeriodcheckBox, contractPeriod, unitDescription, propertyName, propertyCode, Integer.parseInt(monthlyRentIncome), Integer.parseInt(expectedSecurityDeposit),
                Integer.parseInt(serviceCharges), paymentType, Double.parseDouble(vatPercent), unitNo, startDate1,
                endDate1, renewalDate1, renewalNotification, insuranceTagged, 
                noticePeriod, actualRentIncome, actualYearlyIncome, "Pending", newdate, "",newdate);
        
        contractDAO.globalSave(contractUnitDetails);
        }
        //AD
      
        
             //  String originalImg=null;
//        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
//        MultipartFile multipartFile = multipartRequest.getFile("documentAttach");
//        //System.out.println(multipartFile.getSize() + "multipartFile");
//        String fileName = "";
//        // image type of file processing...
//        //System.err.println("-------------------------------------------");
//        if (multipartFile.getSize() > 0) {
//            try {
//                InputStream inputStream = null;
//                OutputStream outputStream = null;
//                inputStream = multipartFile.getInputStream();
//                fileName = req.getRealPath("") + File.pathSeparator + "reportfiles" + File.pathSeparator + multipartFile.getOriginalFilename();
//                //System.out.println("FIleName:"+fileName);
//                outputStream = new java.io.FileOutputStream(fileName);
//                documentAttach = multipartFile.getOriginalFilename();
//                int readBytes = 0;
//                byte[] buffer = new byte[10000000];
//                while ((readBytes = inputStream.read(buffer, 0, 10000000)) != -1) {
//                    outputStream.write(buffer, 0, readBytes);
//                }
//                outputStream.close();
//                inputStream.close();
//
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
         Date billingDueDate1=null;
         try{
             if(billingDueDate != null || !billingDueDate.equals("")) {
                 billingDueDate1 = formatter3.parse(billingDueDate);
             }
         }catch(Exception ex){
             ex.printStackTrace();         
         }
         
         Date pdDate1[]=null;
         for (int i = 0; i < pdDate.length; i++) {
         try{
             if(pdDate != null || !pdDate.equals("")) {
                 pdDate1[i] = formatter3.parse(pdDate[i]);
             }
         }catch(Exception ex){
             ex.printStackTrace();         
         }
         }
            
         
         if (pk == null || pk.equals("")){
        AdditionalDetails ad = new AdditionalDetails(orgId, userId, Integer.parseInt(municipalCharges), Integer.parseInt(maintenanceCharges), billingCycle,
                billingDueDate1, Integer.parseInt(municipalAgreementNo), 
                municipalFormNo, "", contractode, propertyName, propertyCode, unitNo, "Active", newdate, newdate);
        contractDAO.globalSave(ad);
         }
         else{
             AdditionalDetails ad = new AdditionalDetails(Integer.parseInt(pk) ,orgId, userId, Integer.parseInt(municipalCharges), Integer.parseInt(maintenanceCharges), billingCycle,
                billingDueDate1, Integer.parseInt(municipalAgreementNo), 
                municipalFormNo, "", contractode, propertyName, propertyCode, unitNo, "Active", newdate, newdate);
        contractDAO.globalSave(ad);
         }
        
        //pd Cheque
        if (pk == null || pk.equals("")){
         for (int i = 0; i < pdCheque.length; i++) {
         
             PDCheckAdditional pdca = new PDCheckAdditional(orgId, userId, pdCheque[i], newdate, contractode, unitNo, "Active", newdate, newdate);
             contractDAO.globalSave(pdca);
         }
        }else{
            for (int i = 0; i < pdCheque.length; i++) {
         
             PDCheckAdditional pdca = new PDCheckAdditional(Integer.parseInt(pk),orgId, userId, pdCheque[i], formatter4.parse(pdDate[i]), contractode, unitNo, "Active", newdate, newdate);
             contractDAO.globalSave(pdca);
        }
        }
         //S/A
       if (pk == null || pk.equals("")){
             for (int i = 0; i < serviceName.length; i++) {
         
         ServiceAmenties sa = new ServiceAmenties(orgId, userId, serviceName[i], description[i], Double.parseDouble(serviceCharge[i]),
                 Double.parseDouble(fixedServiceCharge[i]), 
                 contractode,  unitNo, "Active", newdate, newdate);
         
        contractDAO.globalSave(sa);
                 
                 }
       }else{
           for (int i = 0; i < serviceName.length; i++) {
         
         ServiceAmenties sa = new ServiceAmenties(Integer.parseInt(pk),orgId, userId, serviceName[i], description[i], Double.parseDouble(serviceCharge[i]),
                 Double.parseDouble(fixedServiceCharge[i]), 
                 contractode,  unitNo, "Active", newdate, newdate);
         
        contractDAO.globalSave(sa);
                 
                 }
       }
             
             //UT
          
             if (pk == null || pk.equals("")){
                for (int i = 0; i < utilityCategory.length; i++) {
             UnitUtilityCategory uuc = new UnitUtilityCategory(orgId, userId, utilityCategory[i], utilityName[i], contractode, unitNo, propertyName,
                     propertyCode, "Active", newdate, newdate);
              contractDAO.globalSave(uuc);
                     
                     }
             }else{
                  for (int i = 0; i < utilityCategory.length; i++) {
             UnitUtilityCategory uuc = new UnitUtilityCategory(Integer.parseInt(pk),orgId, userId, utilityCategory[i], utilityName[i], contractode, unitNo, propertyName,
                     propertyCode, "Active", newdate, newdate);
              contractDAO.globalSave(uuc);
                     
                     }
             }
        
        
        return new ModelAndView(new RedirectView("../insurance/tenantContractList.htm"), modelMap);
        
    }

    @RequestMapping("/insurance/tenantContractFormView.htm")
    public ModelAndView tenantContractFormView(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Contract Creation";
        String submoduleName = "Contract Creation";
        String status = request.getParameter("status");
        String recordStatus = "Contract Created";
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        String insuranceNo2 = request.getParameter("insuranceNo");
        
        String contractCode = request.getParameter("contractCode");
        
        
        if (contractCode != null) {

             map.addAttribute("unitLandLordDetailsList", contractDAO.unitLandLordDetailsList(userId, orgId, contractCode));
             map.addAttribute("unitCustomerDetailsList", contractDAO.unitCustomerDetailsList(userId, orgId, contractCode));
             map.addAttribute("unitContractDetailsList", contractDAO.unitContractDetailsList(userId, orgId, contractCode));
             map.addAttribute("additionalDetailsList", contractDAO.additionalDetailsList(userId, orgId, contractCode));
             map.addAttribute("serviceAmentiesDetailsList", contractDAO.serviceAmentiesDetailsList(userId, orgId, contractCode));
             map.addAttribute("unitUtilityCategoryDetailsList", contractDAO.unitUtilityCategoryDetailsList(userId, orgId, contractCode));
             map.addAttribute("UnitMulipleCustomerDetailsList", contractDAO.UnitMulipleCustomerDetailsList(userId, orgId, contractCode));
             map.addAttribute("pDCheckAdditionalCustomerDetailsList", contractDAO.pDCheckAdditionalCustomerDetailsList(userId, orgId, contractCode));
             
        }
        
        map.addAttribute("contractCode", contractCode);
        
               //map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../contract/tenantContractFormView", map);
    }

    @RequestMapping("/insurance/tenantContractFormEdit.htm")
    public ModelAndView tenantContractFormEdit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Contract Creation";
        String submoduleName = "Contract Creation";
        String status = request.getParameter("status");
        String recordStatus = "Contract Created";
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        String insuranceNo2 = request.getParameter("insuranceNo");
        
        String contractCode = request.getParameter("contractCode");
        
        
        if (contractCode != null) {

             map.addAttribute("unitLandLordDetailsList", contractDAO.unitLandLordDetailsList(userId, orgId, contractCode));
             map.addAttribute("unitCustomerDetailsList", contractDAO.unitCustomerDetailsList(userId, orgId, contractCode));
             map.addAttribute("unitContractDetailsList", contractDAO.unitContractDetailsList(userId, orgId, contractCode));
             map.addAttribute("additionalDetailsList", contractDAO.additionalDetailsList(userId, orgId, contractCode));
             map.addAttribute("serviceAmentiesDetailsList", contractDAO.serviceAmentiesDetailsList(userId, orgId, contractCode));
             map.addAttribute("unitUtilityCategoryDetailsList", contractDAO.unitUtilityCategoryDetailsList(userId, orgId, contractCode));
             map.addAttribute("UnitMulipleCustomerDetailsList", contractDAO.UnitMulipleCustomerDetailsList(userId, orgId, contractCode));
             map.addAttribute("pDCheckAdditionalCustomerDetailsList", contractDAO.pDCheckAdditionalCustomerDetailsList(userId, orgId, contractCode));
             
        }
        
        map.addAttribute("contractCode", contractCode);
        
               //map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../contract/tenantContractFormEdit", map);
    }
@RequestMapping("/insurance/tenantContractRenewForm.htm")
    public ModelAndView tenantContractRenewForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Contract Creation";
        String submoduleName = "Contract Creation";
        String status = request.getParameter("status");
        String recordStatus = "Contract Created";
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        String insuranceNo2 = request.getParameter("insuranceNo");
        
        String contractCode = request.getParameter("contractCode");
        
        
        if (contractCode != null) {

             map.addAttribute("unitLandLordDetailsList", contractDAO.unitLandLordDetailsList(userId, orgId, contractCode));
             map.addAttribute("unitCustomerDetailsList", contractDAO.unitCustomerDetailsList(userId, orgId, contractCode));
             map.addAttribute("unitContractDetailsList", contractDAO.unitContractDetailsList(userId, orgId, contractCode));
             map.addAttribute("additionalDetailsList", contractDAO.additionalDetailsList(userId, orgId, contractCode));
             map.addAttribute("serviceAmentiesDetailsList", contractDAO.serviceAmentiesDetailsList(userId, orgId, contractCode));
             map.addAttribute("unitUtilityCategoryDetailsList", contractDAO.unitUtilityCategoryDetailsList(userId, orgId, contractCode));
             map.addAttribute("UnitMulipleCustomerDetailsList", contractDAO.UnitMulipleCustomerDetailsList(userId, orgId, contractCode));
             map.addAttribute("pDCheckAdditionalCustomerDetailsList", contractDAO.pDCheckAdditionalCustomerDetailsList(userId, orgId, contractCode));
             
        }
        
        map.addAttribute("contractCode", contractCode);
        
               //map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../contract/tenantContractRenewForm", map);
    }
//    @RequestMapping("/sales/updatecontractApprovalStatus.htm")
//    public ModelAndView updatecontractApprovalStatus(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
//        ModelMap modelMap = new ModelMap();
//        HttpSession session = request.getSession(false);
//        String contractCode = request.getParameter("contractCode");
//       
//        String reason = request.getParameter("reason");
//        
//
//        
//            contractDAO.updatecontractApprovalStatus("Approved",contractCode);
//        
//        return new ModelAndView("../contract/tenantContractList", modelMap);
//    }
}
