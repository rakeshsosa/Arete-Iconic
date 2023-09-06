/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
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
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.servlet.view.RedirectView;
import tenant.classes.AMCType;

import tenant.classes.BilltoLocation;
import tenant.classes.Category;
import tenant.classes.CommonUtility;
import tenant.classes.ComplaintType;
import tenant.classes.TenantType;
import tenant.classes.ContractCategory;
import tenant.classes.ContractClassification;
import tenant.classes.DeliveryLocation;
import tenant.classes.DocumentCategory;
import tenant.classes.DocumentType;
import tenant.classes.FlatType;
import tenant.classes.IndividualUitlity;
import tenant.classes.InsuranceMaster;
import tenant.classes.ItemCategory;
import tenant.classes.ItemMaster;
import tenant.classes.ItemsStore;
import tenant.classes.LandLordDetails;
import tenant.classes.LandlordAttach;
import tenant.classes.LeadReferral;
import tenant.classes.MasterTerms;
import tenant.classes.PenaltyType;
import tenant.classes.ServiceRequestType;
import tenant.classes.StoreCategory;
import tenant.classes.StoreMaster;
import tenant.classes.StoreTypeMaster;
import tenant.classes.SupplierMaster;
import tenant.classes.UomMaster;

import tenant.dao.ContractDAO;
import tenant.dao.MasterDAO;
import tenant.dao.TenantDetailsDAO;
import tenant.dao.UserDAO;
import tenant.dao.UtilityDetailsDAO;

/**
 *
 * @author ebs
 */
@Controller
public class MasterController extends MultiActionController {

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
    private ContractDAO contractDAO;
    @Autowired
    private TenantDetailsDAO tenantDetailsDAO;
    @Autowired
    private UtilityDetailsDAO utilityDetailsDAO;

//    @Autowired
//    private AMCTypeDAO amctypedao;
//---------------------Landlord Details---------------------------------------------//
//Landlord List
    @RequestMapping("/master/landLordDetailsList.htm")
    public ModelAndView landLordDetailsList(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Landlord Details";
        String submoduleName = "Masters";
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, submoduleName, tabName));
        map.addAttribute("landLord", masterDAO.listActive(sno, "LandLordDetails"));
        return new ModelAndView("../master/landLordDetailsList", map);
    }

//Landlord Form
    @RequestMapping("/master/landLordDetailsForm.htm")
    public ModelAndView landLordDetailsForm(HttpServletRequest request, HttpServletResponse response) {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        String landlordId = request.getParameter("id");
                   
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("landLord", masterDAO.listActive1(sno, "LandLordDetails"));
            modelMap.addAttribute("landLordAttach", masterDAO.assetAttachView(Integer.parseInt(sno), landlordId));
        }
        String link = "../master/landLordDetailsForm.htm";
        String tab = "Landlord Details";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        
        Integer landlordIdOne = masterDAO.getlandlordIdCount();
        landlordIdOne = landlordIdOne + 1;
        String landlordNo = "LL-" + landlordIdOne;
        
        modelMap.addAttribute("landlordNo", landlordNo);
        return new ModelAndView("../master/landLordDetailsForm", modelMap);
    }
//Landlord documents Form

    @RequestMapping("/master/landlordDocumentsForm.htm")
    public ModelAndView landlordDocumentsForm(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String llId = request.getParameter("llId");
        String action = request.getParameter("action");
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("fileSize", userDAO.fileSize());
        modelMap.addAttribute("landlordDocuments", masterDAO.landlordDocuments(llId));
        modelMap.addAttribute("action", action);
        return new ModelAndView("../master/landlordDocumentsForm", modelMap);

    }

//Landlord Submit
    @RequestMapping("/master/landLordDetailsFormSubmit.htm")
    public ModelAndView landLordDetailsFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException, ParseException {
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");
        String landlordId = request.getParameter("landlordId");
        String landlordCategory = request.getParameter("landlordCategory");
        String landlordName = request.getParameter("landlordName");
        String landlordContactno = request.getParameter("landlordContactno");
        String landlordWorkContactno = request.getParameter("landlordWorkContactno");
        String landlordEmailid = request.getParameter("landlordEmailid");
        String crIdNo = request.getParameter("crIdNo");
        String personName1 = request.getParameter("personName1");
        String contactNumber1 = request.getParameter("contactNumber1");
        String mailId1 = request.getParameter("mailId1");
        String personName2 = request.getParameter("personName2");
        String contactNumber2 = request.getParameter("contactNumber2");
        String mailId2 = request.getParameter("mailId2");
        String status = request.getParameter("status");
        String creationDate = request.getParameter("creationDate");
        String Filename = request.getParameter("Filename");
        String attachmentReference = request.getParameter("attachmentReference");
        String delfiles = request.getParameter("tobedel");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());

        if (landlordId == null || landlordId == "" || "".equals(landlordId)) {
            String landlordId1 = request.getParameter("landlordName");

            ArrayList validuser = (ArrayList) masterDAO.LandlordCodeGen(null, landlordId1, null);
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
            landlordId = "LL" + "-" + ordno;
        }

        List<LandlordAttach> gridattach = new ArrayList<LandlordAttach>();

        if (pk == null || pk.equals("")) {

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

                List<LandlordAttach> list = new ArrayList<LandlordAttach>();
                for (Iterator<MultipartFile> iterator = multipartFiles.iterator(); iterator.hasNext();) {
                    MultipartFile test = (MultipartFile) iterator.next();
                    fileLength = test.getBytes().length;

                    if (fileLength > 0) {
                        LandlordAttach bdpfFile = new LandlordAttach();
                        bdpfFile.setFilename(test.getOriginalFilename());

                        bdpfFile.setContentTo(test.getBytes());

                        bdpfFile.setOrgId(orgId);
                        bdpfFile.setUserId(userId);
                        bdpfFile.setLastmodifiedDate(today);
                        bdpfFile.setStatus("update0");
                        bdpfFile.setLandlordId(landlordId);
                        bdpfFile.setCreationDate(today);

                        list.add(bdpfFile);
                    }
                    i++;
                }
                masterDAO.saveLandlordAttach(list);

            } catch (Exception e) {
                e.printStackTrace();
            }
//            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
//            List<MultipartFile> multipartFile = multipartRequest.getFiles("attachmentReference");
//            int x = 0;
//            for (Iterator<MultipartFile> iterator = multipartFile.iterator(); iterator.hasNext();) {
//                MultipartFile test = (MultipartFile) iterator.next();
//                if (test.getBytes().length > 0) {
//                    LandlordAttach attach = new LandlordAttach(userId, orgId, landlordId, test.getBytes(), test.getOriginalFilename(), "Update0", today, today);
//                    gridattach.add(attach);
//                    x++;
//                }
//            }
            LandLordDetails landlord = new LandLordDetails(orgId, userId, landlordId, landlordCategory, landlordName, landlordContactno, landlordWorkContactno, landlordEmailid, crIdNo, personName1, contactNumber1, mailId1, personName2, contactNumber2, mailId2, "Update0", today, today);
            masterDAO.globalSave(landlord);
            // masterDAO.docSave(gridattach);

        } else {
            Date creationDate1 = null;
            if (!creationDate.equals("")) {
                creationDate1 = (Date) formatter.parse(creationDate);
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
                int i = 0, fileLength = 0;
                String filename;
                String filePath = "";

                List<LandlordAttach> list = new ArrayList<LandlordAttach>();
                for (Iterator<MultipartFile> iterator = multipartFiles.iterator(); iterator.hasNext();) {
                    MultipartFile test = (MultipartFile) iterator.next();
                    fileLength = test.getBytes().length;

                    if (fileLength > 0) {
                        LandlordAttach bdpfFile = new LandlordAttach();
                        bdpfFile.setFilename(test.getOriginalFilename());

                        bdpfFile.setContentTo(test.getBytes());

                        bdpfFile.setOrgId(orgId);
                        bdpfFile.setUserId(userId);
                        bdpfFile.setLastmodifiedDate(today);
                        bdpfFile.setStatus("update0");
                        bdpfFile.setLandlordId(landlordId);
                        bdpfFile.setCreationDate(creationDate1);

                        list.add(bdpfFile);
                    }
                    i++;
                }
                masterDAO.saveLandlordAttach(list);

            } catch (Exception e) {
                e.printStackTrace();
            }

            if (!delfiles.equals("")) {
                String[] totalfiles = delfiles.split(",");
                for (int k = 0; k < totalfiles.length; k++) {

                    LandlordAttach doc = masterDAO.getattchs(Integer.parseInt(totalfiles[k]));
                    //assetsDAO1.delete(doc.getAttachName(), doc.getAssetAttach());

                    masterDAO.delattachfiles("LandlordAttach", "sno", Integer.parseInt(totalfiles[k]));
                }
            }

//            for attachment
//            String attachSno[] = request.getParameterValues("attachSno");
//            String attachSnoFull[] = request.getParameterValues("attachSnoFull");
//            List<String> attach1 = new ArrayList<String>();
//            List<String> attach2 = new ArrayList<String>();
//            if (attachSno != null && attachSnoFull != null) {
//                for (int at = 0; at < attachSno.length; at++) {
//                    attach1.add(attachSno[at]);
//                }
//                for (int at1 = 0; at1 < attachSnoFull.length; at1++) {
//                    attach2.add(attachSnoFull[at1]);
//                }
//                List<String> unionat = new ArrayList<String>(attach1);
//                unionat.addAll(attach2);
//                List<String> intersection = new ArrayList<String>(attach1);
//                intersection.retainAll(attach2);
//                unionat.removeAll(intersection);
//                for (String nA : unionat) {
//                    try {
//                        masterDAO.landattachmentDelete(Integer.parseInt(nA));
//                    } catch (Exception e) {
//                        e.printStackTrace();
//                    }
//                }
//            } else {
//                if (attachSno == null && attachSnoFull != null) {
//                    try {
//                        masterDAO.landattachmentDelete(Integer.parseInt(attachSnoFull[0]));
//                    } catch (Exception e) {
//                        e.printStackTrace();
//                    }
//                }
//            }
////        end
//            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
//            List<MultipartFile> multipartFile = multipartRequest.getFiles("attachmentReference");
//            for (Iterator<MultipartFile> iterator = multipartFile.iterator(); iterator.hasNext();) {
//                MultipartFile test = (MultipartFile) iterator.next();
//                if (test.getBytes().length > 0) {
//                    LandlordAttach attach = new LandlordAttach(userId, orgId, landlordId, test.getBytes(), test.getOriginalFilename(), "Update0", today, today);
//                    gridattach.add(attach);
//                }
//            }
            LandLordDetails landlord = new LandLordDetails(Integer.parseInt(pk), orgId, userId, landlordId, landlordCategory, landlordName, landlordContactno, landlordWorkContactno, landlordEmailid, crIdNo, personName1, contactNumber1, mailId1, personName2, contactNumber2, mailId2, status, creationDate1, today);
            masterDAO.globalSave(landlord);
            //masterDAO.docSave(gridattach);
        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("landLord", masterDAO.list(pk, "LandLordDetails"));
        return new ModelAndView(new RedirectView("../master/landLordDetailsList.htm"), modelMap);
    }

//Landlord Attachment 
    @RequestMapping("/master/landlordAttachDownload.htm")
    public void landlordAttachDownload(HttpServletRequest req, HttpServletResponse res) throws FileNotFoundException, IOException {
        String sno = req.getParameter("sno");
        LandlordAttach doc = masterDAO.getlandlordAttach(Integer.parseInt(sno));
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
// Landlord name uniquness

    public void fetchllName(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String landlordName = req.getParameter("landlordName");
        String landlordCategory = req.getParameter("landlordCategory");
        masterDAO.fetchllName(req, res, landlordName, landlordCategory);
    }
// Landlord contact number uniquness

    public void fetchllCono(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String landlordContactno = req.getParameter("landlordContactno");
        masterDAO.fetchllCono(req, res, landlordContactno);
    }
// Landlord work contact number uniquness

    public void fetchllWcono(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String landlordWorkContactno = req.getParameter("landlordWorkContactno");
        masterDAO.fetchllWcono(req, res, landlordWorkContactno);
    }
// Landlord email uniquness

    public void fetchllEmail(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String landlordEmailid = req.getParameter("landlordEmailid");
        masterDAO.fetchllEmail(req, res, landlordEmailid);
    }
// Landlord crno uniquness

    public void fetchCrno(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String crIdNo = req.getParameter("crIdNo");
        masterDAO.fetchCrno(req, res, crIdNo);
    }
// Inactivate Landlord datails

    @RequestMapping("/master/landLordDel.htm")
    public ModelAndView landLordDel(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("pk");
        masterDAO.globalInactive(sno, "LandLordDetails");
        modelMap.addAttribute("message", "Data Inactivated Successfully...");
        return new ModelAndView(new RedirectView("landLordDetailsList.htm"), modelMap);
    }

    @RequestMapping("/master/landLordActive.htm")
    public ModelAndView landLordActive(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("pk");
        masterDAO.globalActive(sno, "LandLordDetails");
        modelMap.addAttribute("message", "Data Activated Successfully...");
        return new ModelAndView(new RedirectView("landLordDetailsList.htm"), modelMap);
    }

    //---------------------Tenant Category---------------------------------------------//
//    Tenant Category List
    @RequestMapping("/master/tenantCategoryList.htm")
    public ModelAndView tenantCategoryList(HttpServletRequest request, HttpServletResponse response
    ) {
        ModelMap map = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Property/Flat/Tenant Type";
        String submoduleName = "Masters";
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, submoduleName, tabName));
        map.addAttribute("category", masterDAO.list(sno, "Category"));
        return new ModelAndView("../master/tenantCategoryList", map);
    }

//    Tenant Category Form
    @RequestMapping("/master/tenantCategoryForm.htm")
    public ModelAndView tenantCategoryForm(HttpServletRequest request, HttpServletResponse response
    ) {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("category", masterDAO.list(sno, "Category"));
        }
        String link = "../master/tenantCategoryForm.htm";
        String tab = "Property/Flat/Tenant Type";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../master/tenantCategoryForm", modelMap);
    }
//    Tenant Category Submit

    @RequestMapping("/master/tenantCategoryFormSubmit.htm")
    public ModelAndView tenantCategoryFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");
        String tenantCategory = request.getParameter("tenantCategory");
        String categoryDesc = request.getParameter("categoryDesc");
        String categorySeqNo = request.getParameter("categorySeqNo");
        String extra1 = request.getParameter("extra1");
        String extra2 = request.getParameter("extra2");
        String extra3 = request.getParameter("extra3");
        String extra4 = request.getParameter("extra4");
        String extra5 = request.getParameter("extra5");
        String status = request.getParameter("status");
        String creationDate = request.getParameter("creationDate");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        if (categorySeqNo == null || categorySeqNo == "" || "".equals(categorySeqNo)) {
            Integer TC = masterDAO.getTCNo();
            categorySeqNo = "TT" + "-" + (TC + 1);
        }
        if (pk == null) {
            Category category = new Category(userId, orgId, tenantCategory, categoryDesc, categorySeqNo, extra1, extra2, extra3, extra4, extra5, "update0", today, today);
            masterDAO.globalSave(category);
        } else {
            Date creationDate1 = null;
            if (!creationDate.equals("")) {
                creationDate1 = (Date) formatter.parse(creationDate);
            }
            Category category = new Category(Integer.parseInt(pk), userId, orgId, tenantCategory, categoryDesc, categorySeqNo, extra1, extra2, extra3, extra4, extra5, status, creationDate1, today);
            masterDAO.globalSave(category);
        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("category", masterDAO.list(pk, "Category"));
        return new ModelAndView(new RedirectView("../master/tenantCategoryList.htm"), modelMap);
    }
// tenant category uniquness

    public void fetchCategory(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String tenantCategory = req.getParameter("tenantCategory");
        masterDAO.fetchCategory(req, res, tenantCategory);
    }
// Inactivate tenant category datails

    @RequestMapping("/master/tenCategDel.htm")
    public ModelAndView tenCategDel(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("pk");
        masterDAO.globalInactive(sno, "Category");
        modelMap.addAttribute("message", "Data Inactivated Successfully...");
        return new ModelAndView(new RedirectView("tenantCategoryList.htm"), modelMap);
    }

    //---------------------Tenant Type---------------------------------------------//
//    Tenant Type List
    @RequestMapping("/master/tenantTypeList.htm")
    public ModelAndView tenantTypeList(HttpServletRequest request, HttpServletResponse response
    ) {
        ModelMap map = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Tenant Category";
        String submoduleName = "Masters";
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, submoduleName, tabName));
        map.addAttribute("type", masterDAO.list(sno, "TenantType"));
        return new ModelAndView("../master/tenantTypeList", map);
    }
//    Tenant Type List

    @RequestMapping("/master/flatTypeList.htm")
    public ModelAndView flatTypeList(HttpServletRequest request, HttpServletResponse response
    ) {
        ModelMap map = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Flat Type";
        String submoduleName = "Masters";
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, submoduleName, tabName));
        map.addAttribute("type", masterDAO.list(sno, "FlatType"));
        return new ModelAndView("../master/flatTypeList", map);
    }

    //    Tenant Type Form
    @RequestMapping("/master/tenantTypeForm.htm")
    public ModelAndView tenantTypeForm(HttpServletRequest request, HttpServletResponse response
    ) {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("type", masterDAO.list(sno, "TenantType"));
        }
        String link = "../master/tenantTypeForm.htm";
        String tab = "Tenant Category";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../master/tenantTypeForm", modelMap);
    }

    //    Tenant Type Form
    @RequestMapping("/master/flatTypeForm.htm")
    public ModelAndView flatTypeForm(HttpServletRequest request, HttpServletResponse response
    ) {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("type", masterDAO.list(sno, "TenantType"));
        }
        String link = "../master/flatTypeForm.htm";
        String tab = "Flat Type";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../master/flatTypeForm", modelMap);
    }
//    Tenant Type Submit

    @RequestMapping("/master/tenantTypeFormSubmit.htm")
    public ModelAndView tenantTypeFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");
        String tenantType = request.getParameter("tenantType");
        String typeDesc = request.getParameter("typeDesc");
        String typeSeqNo = request.getParameter("typeSeqNo");
        String extra1 = request.getParameter("extra1");
        String extra2 = request.getParameter("extra2");
        String extra3 = request.getParameter("extra3");
        String extra4 = request.getParameter("extra4");
        String extra5 = request.getParameter("extra5");
        String status = request.getParameter("status");
        String creationDate = request.getParameter("creationDate");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        if (typeSeqNo == null || typeSeqNo == "" || "".equals(typeSeqNo)) {
            Integer TT = masterDAO.getTTNo();
            typeSeqNo = "TC" + "-" + (TT + 1);
        }
        if (pk == null) {
            TenantType type = new TenantType(userId, orgId, tenantType, typeDesc, typeSeqNo, extra1, extra2, extra3, extra4, extra5, "update0", today, today);
            masterDAO.globalSave(type);
        } else {
            Date creationDate1 = null;
            if (!creationDate.equals("")) {
                creationDate1 = (Date) formatter.parse(creationDate);
            }
            TenantType type = new TenantType(Integer.parseInt(pk), userId, orgId, tenantType, typeDesc, typeSeqNo, extra1, extra2, extra3, extra4, extra5, status, creationDate1, today);
            masterDAO.globalSave(type);
        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("type", masterDAO.list(pk, "TenantType"));
        return new ModelAndView(new RedirectView("../master/tenantTypeList.htm"), modelMap);
    }

    @RequestMapping("/master/flatTypeFormSubmit.htm")
    public ModelAndView flatTypeFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");
        String flatType = request.getParameter("flatType");
        String typeDesc = request.getParameter("typeDesc");
        String typeSeqNo = request.getParameter("typeSeqNo");
        String status = request.getParameter("status");
        String creationDate = request.getParameter("creationDate");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        if (typeSeqNo == null || typeSeqNo == "" || "".equals(typeSeqNo)) {
            Integer TT = masterDAO.getFlatTypeNo();
            typeSeqNo = "FT" + "-" + (TT + 1);
        }
        if (pk == null) {
            FlatType type = new FlatType(userId, orgId, flatType, typeDesc, typeSeqNo, "update0", today, today);
            masterDAO.globalSave(type);
        } else {
            Date creationDate1 = null;
            if (!creationDate.equals("")) {
                creationDate1 = (Date) formatter.parse(creationDate);
            }
            FlatType type = new FlatType(Integer.parseInt(pk), userId, orgId, flatType, typeDesc, typeSeqNo, status, creationDate1, today);
            masterDAO.globalSave(type);
        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("type", masterDAO.list(pk, "FlatType"));
        return new ModelAndView(new RedirectView("../master/flatTypeList.htm"), modelMap);
    }
// tenant type uniquness

    public void fetchType(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String tenantType = req.getParameter("tenantType");
        masterDAO.fetchType(req, res, tenantType);
    }

    public void fetchFlatType(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String flatType = req.getParameter("flatType");
        masterDAO.fetchFlatType(req, res, flatType);
    }
// Inactivate tenant type datails

    @RequestMapping("/master/tenTypeDel.htm")
    public ModelAndView tenTypeDel(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("pk");
        masterDAO.globalInactive(sno, "TenantType");
        modelMap.addAttribute("message", "Data Inactivated Successfully...");
        return new ModelAndView(new RedirectView("tenantTypeList.htm"), modelMap);
    }
    
    
    //Contract Category List 
    @RequestMapping("/master/documenTypeList.htm")
    public ModelAndView documenTypeList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Document Type";
        String submoduleName = "Masters";
        map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
      //  map.addAttribute("categorylst", masterDAO.ContractCategorylist(null));\
        map.addAttribute("DocumentTyeList", masterDAO.DocumentTypeList(null));
        return new ModelAndView("../master/documentTypeList", map);
    }
    
    @RequestMapping("/master/documentTypeForm.htm")
    public ModelAndView documentTypeForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        String categoryId = request.getParameter("categoryId");
        String contractCategory = request.getParameter("contractCategory");
        String categoryDesc = request.getParameter("categoryDesc");
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String link = "../master/contractCategoryForm.htm";
        String tab = "Contract Category";

        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("DocumentTyeList", masterDAO.DocumentTypeList(sno));
            modelMap.addAttribute("category", userDAO.formLabelMapping(link, tab));//To Make dynamic field availability//
        }
        modelMap.addAttribute("category", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../master/documentTypeForm", modelMap);
    }
    
    //Contract Category List 
    @RequestMapping("/master/documentCategoryList.htm")
    public ModelAndView documentCategoryList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Contract Category";
        String submoduleName = "Masters";
        map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        map.addAttribute("documentCategorylist", masterDAO.DocumentCategorylist(null));
        return new ModelAndView("../master/documentCategoryList", map);
    }
    
    @RequestMapping("/master/documentCategoryForm.htm")
    public ModelAndView documentCategoryForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        String categoryId = request.getParameter("categoryId");
        String contractCategory = request.getParameter("contractCategory");
        String categoryDesc = request.getParameter("categoryDesc");
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String link = "../master/contractCategoryForm.htm";
        String tab = "Contract Category";

        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("documentCategorylist", masterDAO.DocumentCategorylist(sno));
            modelMap.addAttribute("category", userDAO.formLabelMapping(link, tab));//To Make dynamic field availability//
        }
        modelMap.addAttribute("category", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../master/documentCategoryForm", modelMap);
    }
    
    @RequestMapping("/master/documentCategoryFormSubmit.htm")
    public ModelAndView documentCategoryFormSubmit(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        String pk = request.getParameter("pk");
        String sno = request.getParameter("sno");
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String documentCategory = request.getParameter("documentCategory");
        String categoryDesc = request.getParameter("categoryDesc");
        String remarks = request.getParameter("remarks");
        
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        List<DocumentCategory> gridData = new ArrayList<DocumentCategory>();
        
        if (pk == null) {
            DocumentCategory dc = new DocumentCategory(orgId, userId, documentCategory, remarks, categoryDesc, "Active", newdate, sqlTimestamp);
            masterDAO.globalSave(dc);

        } else {
            DocumentCategory dc = new DocumentCategory(Integer.parseInt(pk),orgId, userId, documentCategory, remarks, categoryDesc, "Active", newdate, sqlTimestamp);
            masterDAO.globalSave(dc);

        }
        
        
        
         ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("documentCategorylist", masterDAO.DocumentCategorylist(null));
        return new ModelAndView(new RedirectView("../master/documentCategoryList.htm"), modelMap);
    }
    
    @RequestMapping("/master/documentTypeFormSubmit.htm")
    public ModelAndView documentTypeFormSubmit(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        String pk = request.getParameter("pk");
        String sno = request.getParameter("sno");
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String documentType = request.getParameter("documentType");
        String typeDesc = request.getParameter("typeDesc");
        String remarks = request.getParameter("remarks");
        
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        List<DocumentType> gridData = new ArrayList<DocumentType>();
        
        if (pk == null) {
            DocumentType dc = new DocumentType(orgId, userId, documentType, remarks, typeDesc, "Active", newdate, sqlTimestamp);
            masterDAO.globalSave(dc);

        } else {
            DocumentType dc = new DocumentType(Integer.parseInt(pk),orgId, userId, documentType, remarks, typeDesc, "Active", newdate, sqlTimestamp);
            masterDAO.globalSave(dc);

        }
        
        
        
         ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("categorylst", masterDAO.ContractCategorylist(null));
        return new ModelAndView(new RedirectView("../master/documenTypeList.htm"), modelMap);
    }
    

    //---------------------Contract Category---------------------------------------------//
    //Contract Category List 
    @RequestMapping("/master/contractCategoryList.htm")
    public ModelAndView contractCategoryList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Contract Category";
        String submoduleName = "Masters";
        map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        map.addAttribute("categorylst", masterDAO.ContractCategorylist(null));
        return new ModelAndView("../master/contractCategoryList", map);
    }
//Contract Category Form

    @RequestMapping("/master/contractCategoryForm.htm")
    public ModelAndView contractCategoryForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        String categoryId = request.getParameter("categoryId");
        String contractCategory = request.getParameter("contractCategory");
        String categoryDesc = request.getParameter("categoryDesc");
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String link = "../master/contractCategoryForm.htm";
        String tab = "Contract Category";

        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("categorylst", masterDAO.ContractCategorylist(sno));
            modelMap.addAttribute("category", userDAO.formLabelMapping(link, tab));//To Make dynamic field availability//
        }
        modelMap.addAttribute("category", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../master/contractCategoryForm", modelMap);
    }
//Contract Category Submit Method

    @RequestMapping("/master/contractCategoryFormSubmit.htm")
    public ModelAndView contractCategoryFormSubmit(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        String pk = request.getParameter("pk");
        String sno = request.getParameter("sno");
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String contractCategoryId = request.getParameter("categoryId");
        String contractCategory1 = request.getParameter("contractCategory");
        String categoryDesc = request.getParameter("categoryDesc");
        String attribute1 = request.getParameter("attribute1");
        String attribute2 = request.getParameter("attribute2");
        String attribute3 = request.getParameter("attribute3");
        String attribute4 = request.getParameter("attribute4");
        String attribute5 = request.getParameter("attribute5");
        String status = request.getParameter("status");

        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        List<ContractCategory> gridData = new ArrayList<ContractCategory>();
        if (contractCategoryId == null || contractCategoryId == "" || "".equals(contractCategoryId)) {

            ArrayList validuser = (ArrayList) masterDAO.CategoryIdlist(null, contractCategory1, null);
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
            contractCategoryId = "CC" + "-" + ordno;
        }
        if (pk == null) {
            ContractCategory contCategory = new ContractCategory(contractCategoryId, orgId, userId, contractCategory1, categoryDesc, attribute1, attribute2, attribute3, attribute4, attribute5, "update0", timestamp, timestamp);
            masterDAO.globalSave(contCategory);

        } else {
            ContractCategory contCategory = new ContractCategory(contractCategoryId, Integer.parseInt(pk), orgId, userId, contractCategory1, categoryDesc, attribute1, attribute2, attribute3, attribute4, attribute5, status, timestamp);
            masterDAO.globalSave(contCategory);

        }

        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("categorylst", masterDAO.ContractCategorylist(null));
        return new ModelAndView(new RedirectView("../master/contractCategoryList.htm"), modelMap);
    }

    //unique category search method
    @RequestMapping("/master/CategoryAvailabilty.htm")
    public void CategoryAvailabilty(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException {
        res.setContentType("text/html;charset=UTF-8");
        String contractCategory = req.getParameter("contractCategory");
        masterDAO.selectCategory(req, res, contractCategory);
    }

    @RequestMapping("/master/utilityName.htm")
    public void utilityName(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException {
        res.setContentType("text/html;charset=UTF-8");
        String comUtility = req.getParameter("comUtility");
        masterDAO.selectUtilityName(req, res, comUtility);
    }

    @RequestMapping("/master/utility.htm")
    public void utility(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException {
        res.setContentType("text/html;charset=UTF-8");
        String utility = req.getParameter("utility");
        masterDAO.selectUtility(req, res, utility);
    }

    ////Contract Category delete method  
    @RequestMapping("/master/categoryDel.htm")
    public ModelAndView categoryDel(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("pk");
        masterDAO.globalInactive(sno, "ContractCategory");
        modelMap.addAttribute("message", "Data Inactivated Successfully...");
        return new ModelAndView(new RedirectView("contractCategoryList.htm"), modelMap);
    }

    //---------------------Contract Classification---------------------------------------------//
    //Contract Classification List 
    @RequestMapping("/master/contraClassificationList.htm")
    public ModelAndView contraClassificationList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Contract Type";
        String submoduleName = "Masters";
        map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        map.addAttribute("classification", masterDAO.list("", "ContractClassification"));
        return new ModelAndView("../master/contraClassificationList", map);
    }
//Contract Classification Form

    @RequestMapping("/master/contraClassificationForm.htm")
    public ModelAndView contraClassificationForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String link = "../master/contraClassificationForm.htm";
        String tab = "Contract Type";
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("classification", masterDAO.list(sno, "ContractClassification"));
            modelMap.addAttribute("category", userDAO.formLabelMapping(link, tab));
        }
        modelMap.addAttribute("category", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../master/contraClassificationForm", modelMap);
    }
//Contract CClassification Submit Method

    @RequestMapping("/master/contraClassificationFormSubmit.htm")
    public ModelAndView contraClassificationFormSubmit(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        String pk = request.getParameter("pk");
        String sno = request.getParameter("sno");
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String classificationId = request.getParameter("classificationId");
        String contraClassification1 = request.getParameter("contraClassification");
        String contraClassficDesc = request.getParameter("contraClassficDesc");
        String status = request.getParameter("status");
        String attribute1 = request.getParameter("attribute1");
        String attribute2 = request.getParameter("attribute12");
        String attribute3 = request.getParameter("attribute3");
        String attribute4 = request.getParameter("attribute4");
        String attribute5 = request.getParameter("attribute5");

        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        List<ContractClassification> gridData = new ArrayList<ContractClassification>();
        if (classificationId.isEmpty()) {
            String contraClassification = request.getParameter("contraClassification");
            ArrayList validuser = (ArrayList) masterDAO.ClassificationIdlist(null, contraClassification, null);
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

            classificationId = "CCL" + "-" + ordno;
        }

        if (pk == null) {
            ContractClassification classification = new ContractClassification(classificationId, orgId, userId, contraClassification1, contraClassficDesc, attribute1, attribute2, attribute3, attribute4, attribute5, "update0", timestamp, timestamp);
            masterDAO.globalSave(classification);

        } else {
            ContractClassification classification = new ContractClassification(classificationId, Integer.parseInt(pk), orgId, userId, contraClassification1, contraClassficDesc, attribute1, attribute2, attribute3, attribute4, attribute5, status, timestamp);
            masterDAO.globalSave(classification);

        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("classification", masterDAO.list("", "ContractClassification"));
        return new ModelAndView(new RedirectView("../master/contraClassificationList.htm"), modelMap);
    }

    //unique Classification search method
    public void ClassificationAvailabilty(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException {
        res.setContentType("text/html;charset=UTF-8");
        String contraClassification = req.getParameter("contraClassification");
        masterDAO.selectClassification(req, res, contraClassification);
    }

    ////Contract Classification delete method  
    @RequestMapping("/master/contraTypeDel.htm")
    public ModelAndView contraTypeDel(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("pk");
        masterDAO.globalInactive(sno, "ContractClassification");
        modelMap.addAttribute("message", "Data Inactivated Successfully...");
        return new ModelAndView(new RedirectView("contraClassificationList.htm"), modelMap);
    }

    //---------------------Insurance Master---------------------------------------------//
    //Insurance Master List 
    @RequestMapping("/master/insuranceMasterList.htm")
    public ModelAndView insuranceMasterList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Insurance Master";
        String submoduleName = "Masters";
        map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        map.addAttribute("insurMastr", masterDAO.listActive("", "InsuranceMaster"));
        return new ModelAndView("../master/insuranceMasterList", map);
    }
//Insurance Mastery Form

    @RequestMapping("/master/insuranceMasterForm.htm")
    public ModelAndView insuranceMasterForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String link = "../master/insuranceMasterForm.htm";
        String tab = "Insurance Master";

        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("insurMastr", masterDAO.listActive1(sno, "InsuranceMaster"));
            modelMap.addAttribute("category", userDAO.formLabelMapping(link, tab));//To Make dynamic field availability//
        }
        modelMap.addAttribute("category", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../master/insuranceMasterForm", modelMap);
    }
//Insurance Master Submit Method

    @RequestMapping("/master/insuranceMasterFormSubmit.htm")
    public ModelAndView insuranceMasterFormSubmit(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        String pk = request.getParameter("pk");
        String sno = request.getParameter("sno");
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String insuranceCompId = request.getParameter("insuranceCompId");
        String insuranceCompanyName1 = request.getParameter("insuranceCompanyName");
        String insuranceDesc = request.getParameter("insuranceDesc");
        String status = request.getParameter("status");
        String attribute1 = request.getParameter("attribute1");
        String attribute2 = request.getParameter("attribute12");
        String attribute3 = request.getParameter("attribute3");
        String attribute4 = request.getParameter("attribute4");
        String attribute5 = request.getParameter("attribute5");

        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        List<InsuranceMaster> gridData = new ArrayList<InsuranceMaster>();
        if (insuranceCompId.isEmpty()) {
            String insuranceCompanyName = request.getParameter("insuranceCompanyName");
            ArrayList validuser = (ArrayList) masterDAO.InsuranceMasterIdlist(null, insuranceCompanyName, null);
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

            insuranceCompId = "INSCOM" + "-" + ordno;
        }

        if (pk == null) {
            InsuranceMaster insurance = new InsuranceMaster(insuranceCompId, orgId, userId, insuranceCompanyName1, insuranceDesc, attribute1, attribute2, attribute3, attribute4, attribute5, "update0", timestamp, timestamp);
            masterDAO.globalSave(insurance);

        } else {
            InsuranceMaster insurance = new InsuranceMaster(insuranceCompId, Integer.parseInt(pk), orgId, userId, insuranceCompanyName1, insuranceDesc, attribute1, attribute2, attribute3, attribute4, attribute5, status, timestamp);
            masterDAO.globalSave(insurance);

        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("insurMastr", masterDAO.list("", "InsuranceMaster"));
        return new ModelAndView(new RedirectView("../master/insuranceMasterList.htm"), modelMap);
    }

    //unique Insurance Master search method
    @RequestMapping("/master/insuranceAvailabilty.htm")
    public void insuranceAvailabilty(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException {
        res.setContentType("text/html;charset=UTF-8");
        String insuranceCompanyName = req.getParameter("insuranceCompanyName");
        masterDAO.selectInsuranceCompany(req, res, insuranceCompanyName);
    }

    @RequestMapping("/master/insuranceAvailabiltyActive.htm")
    public void insuranceAvailabiltyActive(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException {
        res.setContentType("text/html;charset=UTF-8");
        String insuranceCompanyName = req.getParameter("insuranceCompanyName");
        masterDAO.selectInsuranceCompanyActive(req, res, insuranceCompanyName);
    }

    //unique Insurance Master search method
    @RequestMapping("/master/insuranceEdit.htm.htm")
    public void insuranceEdit(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException {
        res.setContentType("text/html;charset=UTF-8");
        String sno = req.getParameter("sno");
        masterDAO.selectInsuranceDetails(req, res, sno);
    }

    ////Contract Insurance delete method  
    @RequestMapping("/master/insurDel.htm")
    public ModelAndView insurDel(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("pk");
        masterDAO.globalInactive(sno, "InsuranceMaster");
        modelMap.addAttribute("message", "Data Inactivated Successfully...");
        return new ModelAndView(new RedirectView("insuranceMasterList.htm"), modelMap);
    }

    @RequestMapping("/master/insurActive.htm")
    public ModelAndView insurActive(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("pk");
        masterDAO.globalActive(sno, "InsuranceMaster");
        modelMap.addAttribute("message", "Data Activated Successfully...");
        return new ModelAndView(new RedirectView("insuranceMasterList.htm"), modelMap);
    }

    @RequestMapping("/master/utilityDel.htm")
    public ModelAndView utilityDel(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("SNo");
        masterDAO.globalInactive1(sno, "IndividualUitlity");
        modelMap.addAttribute("message", "Data Inactivated Successfully...");
        return new ModelAndView(new RedirectView("../master/individualUtilityList.htm"), modelMap);
    }

    @RequestMapping("/master/utilityActive.htm")
    public ModelAndView utilityActive(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("SNo");
        masterDAO.globalActiveUtility(sno, "IndividualUitlity");
        modelMap.addAttribute("message", "Data Activated Successfully...");
        return new ModelAndView(new RedirectView("../master/individualUtilityList.htm"), modelMap);
    }

    @RequestMapping("/master/comUtilityDel.htm")
    public ModelAndView comUtilityDel(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("SNo");
        masterDAO.globalInactive1(sno, "CommonUtility");
        modelMap.addAttribute("message", "Data Inactivated Successfully...");
        return new ModelAndView(new RedirectView("../master/commonUtilityList.htm"), modelMap);
    }

    @RequestMapping("/master/comUtilityActive.htm")
    public ModelAndView comUtilityActive(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("SNo");
        masterDAO.globalActiveUtility(sno, "CommonUtility");
        modelMap.addAttribute("message", "Data Activated Successfully...");
        return new ModelAndView(new RedirectView("../master/commonUtilityList.htm"), modelMap);
    }

    //---------------------SUPPLIER MASTER---------------------------------------------//
    //Supplier List 
    @RequestMapping("/master/supplierList.htm")
    public ModelAndView supplierList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        if(fromDate!=null&&toDate!=null)
        if (fromDate.contains("frdate") && toDate.contains("todate")) {
            fromDate = null;
            toDate = null;
        }
        String tabName = "Supplier Master";
        String submoduleName = "Masters";
        map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        if (fromDate==null|| fromDate=="" || toDate==null || toDate=="") {
            map.addAttribute("supplier", masterDAO.listActive("", "SupplierMaster"));
        } else {
            map.addAttribute("supplier", masterDAO.listActive1("", "SupplierMaster", fromDate, toDate));
        }
        return new ModelAndView("../master/supplierList", map);
    }
//Contract Classification Form

    @RequestMapping("/master/supplierForm.htm")
    public ModelAndView supplierForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String link = "../master/supplierForm.htm";
        String tab = "Supplier Master";
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("supplier", masterDAO.listActive1(sno, "SupplierMaster"));
            modelMap.addAttribute("supp", userDAO.formLabelMapping(link, tab));
        }
        modelMap.addAttribute("supp", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../master/supplierForm", modelMap);
    }

    //Supplier Master Submit Method
    @RequestMapping("/master/supplierFormSubmit.htm")
    public ModelAndView supplierFormSubmit(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        String pk = request.getParameter("pk");
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String supplierCode = request.getParameter("supplierCode");
        String supplierName = request.getParameter("supplierName");
        String supplierAddress = request.getParameter("supplierAddress");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String pincode = request.getParameter("pincode");
        String supplierContNum = request.getParameter("supplierContNum");
        String mailId = request.getParameter("mailId");
        String supplierDesc = request.getParameter("supplierDesc");
        String bankName = request.getParameter("bankName");
        String accountNumber = request.getParameter("accountNumber");
        String ifsccode = request.getParameter("ifsccode");
        String branchname = request.getParameter("branchname");
        String address = request.getParameter("address");
        String emailid = request.getParameter("emailid");
        String contNum = request.getParameter("contNum");
        String creationDate = request.getParameter("creationDate");
        String status = request.getParameter("status");
        String paymentTerms = "Payment";
        String deliveryTerms = "Delivery";

        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        List<SupplierMaster> gridData = new ArrayList<SupplierMaster>();
        if (supplierCode.isEmpty()) {
            String supplierCode1 = request.getParameter("supplierName");
            ArrayList validuser = (ArrayList) masterDAO.SupplierCodeGen(null, supplierCode1, null);
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

            supplierCode = "SUPP" + "-" + ordno;
        }

        if (pk == null) {
            SupplierMaster supp = new SupplierMaster(orgId, userId, supplierCode, supplierName, supplierAddress, city, state, pincode, supplierContNum, mailId, supplierDesc, bankName, accountNumber, ifsccode, branchname, address, emailid, contNum, timestamp, status, timestamp, paymentTerms, deliveryTerms);
            masterDAO.globalSave(supp);

        } else {
            Date creationDate1 = null;
            if (!creationDate.equals("")) {
                creationDate1 = (Date) formatter.parse(creationDate);
            }
            SupplierMaster supp = new SupplierMaster(Integer.parseInt(sno), orgId, userId, supplierCode, supplierName, supplierAddress, city, state, pincode, supplierContNum, mailId, supplierDesc, bankName, accountNumber, ifsccode, branchname, address, emailid, contNum, creationDate1, status, timestamp, paymentTerms, deliveryTerms);
            masterDAO.globalSave(supp);

        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("supplier", masterDAO.list("", "SupplierMaster"));
        return new ModelAndView(new RedirectView("../master/supplierList.htm"), modelMap);
    }

    public void fetchllEmail1(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String mailId = req.getParameter("mailId");
        masterDAO.fetchllEmail1(req, res, mailId);
    }

    public void fetchllEmail2(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String emailid = req.getParameter("emailid");
        masterDAO.fetchllEmail2(req, res, emailid);
    }

    public void contNumFetch(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String supplierContNum = req.getParameter("supplierContNum");
        masterDAO.contNumFetch(req, res, supplierContNum);
    }

    public void accNumFetch(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String accountNumber = req.getParameter("accountNumber");
        masterDAO.accNumFetch(req, res, accountNumber);
    }

    ////Supplier delete method  
    @RequestMapping("/master/suppDel.htm")
    public ModelAndView suppDel(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("pk");
        masterDAO.globalInactive(sno, "SupplierMaster");
        modelMap.addAttribute("message", "Data Inactivated Successfully...");
        return new ModelAndView(new RedirectView("supplierList.htm"), modelMap);
    }

    @RequestMapping("/master/suppActive.htm")
    public ModelAndView suppActive(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("pk");
        masterDAO.globalActive(sno, "SupplierMaster");
        modelMap.addAttribute("message", "Data Activated Successfully...");
        return new ModelAndView(new RedirectView("supplierList.htm"), modelMap);
    }

    //---------------------Item Category--------------------------------------------//
    //Item Category List 
    @RequestMapping("/master/itemCategoryList.htm")
    public ModelAndView itemCategoryList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Accessory Category";
        String submoduleName = "Accessory Details";
        map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        map.addAttribute("item", masterDAO.listActive("", "ItemCategory"));
        return new ModelAndView("../master/itemCategoryList", map);
    }
//Item Category  Form

    @RequestMapping("/master/itemCategoryForm.htm")
    public ModelAndView itemCategoryForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String link = "../master/itemCategoryForm.htm";
        String tab = "Accessory Category";
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("item", masterDAO.listActive1(sno, "ItemCategory"));
            modelMap.addAttribute("tablink", userDAO.formLabelMapping(link, tab));
        }
        modelMap.addAttribute("tablink", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../master/itemCategoryForm", modelMap);
    }

    //Item Category Submit Method
    @RequestMapping("/master/itemCatSubmit.htm")
    public ModelAndView itemCategorySubmit(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        String pk = request.getParameter("pk");
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String categoryId = request.getParameter("categoryId");
        String itemCategory = request.getParameter("itemCategory");
        String categoryDesc = request.getParameter("categoryDesc");
        String creationDate = request.getParameter("creationDate");
        String status = request.getParameter("status");
        String attribute1 = request.getParameter("attribute1");
        String attribute2 = request.getParameter("attribute12");
        String attribute3 = request.getParameter("attribute3");
        String attribute4 = request.getParameter("attribute4");
        String attribute5 = request.getParameter("attribute5");

        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        List<ItemCategory> gridData = new ArrayList<ItemCategory>();
        if (categoryId.isEmpty()) {
            String categoryId1 = request.getParameter("categoryId");
            ArrayList validuser = (ArrayList) masterDAO.ItemCatCodeGen(null, categoryId1, null);
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

            categoryId = "ACCCAT" + "-" + ordno;
        }

        if (pk == null) {
            ItemCategory item = new ItemCategory(orgId, userId, categoryId, itemCategory, categoryDesc, creationDate, attribute1, attribute2, attribute3, attribute4, attribute5, status, timestamp);
            masterDAO.globalSave(item);

        } else {
            ItemCategory item = new ItemCategory(Integer.parseInt(sno), orgId, userId, categoryId, itemCategory, categoryDesc, attribute1, attribute2, attribute3, attribute4, attribute5, status, timestamp);
            masterDAO.globalSave(item);

        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("item", masterDAO.list("", "ItemCategory"));
        return new ModelAndView(new RedirectView("../master/itemCategoryList.htm"), modelMap);
    }

    //unique Item Category search method
    @RequestMapping("/master/itemCatAvailabilty.htm")
    public void itemCatAvailabilty(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException {
        res.setContentType("text/html;charset=UTF-8");
        String itemCategory = req.getParameter("itemCategory");
        masterDAO.selectItemCat(req, res, itemCategory);
    }

    //unique Service Request search method
    @RequestMapping("/master/serviceAvailabilty.htm")
    public void serviceAvailabilty(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException {
        res.setContentType("text/html;charset=UTF-8");
        String serviceRequest = req.getParameter("serviceRequested");
        masterDAO.selectServiceRequest(req, res, serviceRequest);
    }

    @RequestMapping("/master/penaltyAvailabilty.htm")
    public void penaltyAvailabilty(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException {
        res.setContentType("text/html;charset=UTF-8");
        String penaltyType = req.getParameter("penaltyType");
        masterDAO.selectPenaltyType(req, res, penaltyType);
    }

    ////Item Category delete method  
    @RequestMapping("/master/itemCatDel.htm")
    public ModelAndView itemCatDel(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("pk");
        masterDAO.globalInactive(sno, "ItemCategory");
        modelMap.addAttribute("message", "Data Inactivated Successfully...");
        return new ModelAndView(new RedirectView("itemCategoryList.htm"), modelMap);
    }

    @RequestMapping("/master/itemCatActive.htm")
    public ModelAndView itemCatActive(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("pk");
        masterDAO.globalActive(sno, "ItemCategory");
        modelMap.addAttribute("message", "Data Activated Successfully...");
        return new ModelAndView(new RedirectView("itemCategoryList.htm"), modelMap);
    }

    //---------------------UOM--------------------------------------------//
    //UOM- List 
    @RequestMapping("/master/uomList.htm")
    public ModelAndView uomList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "UOM Master";
        String submoduleName = "Accessory Details";
        map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        map.addAttribute("uomList", masterDAO.listActive("", "UomMaster"));
        return new ModelAndView("../master/uomList", map);
    }
//UOM-  Form

    @RequestMapping("/master/uomForm.htm")
    public ModelAndView uomForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String link = "../master/uomForm.htm";
        String tab = "UOM Master";
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("uomList", masterDAO.listActive1(sno, "UomMaster"));
            modelMap.addAttribute("tab1", userDAO.formLabelMapping(link, tab));
        }
        modelMap.addAttribute("tab1", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../master/uomForm", modelMap);
    }

    //UOM- Submit Method
    @RequestMapping("/master/uomFormSubmit.htm")
    public ModelAndView uomFormSubmit(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        String pk = request.getParameter("pk");
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String uomId = request.getParameter("uomId");
        String uomName = request.getParameter("uomName");
        String uomDesc = request.getParameter("uomDesc");
        String creationDate = request.getParameter("creationDate");
        String status = request.getParameter("status");
        String attribute1 = request.getParameter("attribute1");
        String attribute2 = request.getParameter("attribute12");
        String attribute3 = request.getParameter("attribute3");
        String attribute4 = request.getParameter("attribute4");
        String attribute5 = request.getParameter("attribute5");

        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        List<UomMaster> gridData = new ArrayList<UomMaster>();
        if (uomId.isEmpty()) {
            String uomId1 = request.getParameter("uomId");
            ArrayList validuser = (ArrayList) masterDAO.UOMCodeGen(null, uomId1, null);
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

            uomId = "UOM" + "-" + ordno;
        }

        if (pk == null) {
            UomMaster uom = new UomMaster(orgId, userId, uomId, uomName, uomDesc, creationDate, attribute1, attribute2, attribute3, attribute4, attribute5, status, timestamp);
            masterDAO.globalSave(uom);

        } else {
            UomMaster uom = new UomMaster(Integer.parseInt(sno), orgId, userId, uomId, uomName, uomDesc, attribute1, attribute2, attribute3, attribute4, attribute5, status, timestamp);
            masterDAO.globalSave(uom);

        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("uomList", masterDAO.list("", "UomMaster"));
        return new ModelAndView(new RedirectView("../master/uomList.htm"), modelMap);
    }

    //unique uomList search method
    @RequestMapping("/master/uomListAvailabilty.htm")
    public void uomListAvailabilty(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException {
        res.setContentType("text/html;charset=UTF-8");
        String uomName = req.getParameter("uomName");
        masterDAO.selectUOM(req, res, uomName);
    }

    ////UOM delete method  
    @RequestMapping("/master/uomDel.htm")
    public ModelAndView uomDel(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("pk");
        masterDAO.globalInactive(sno, "UomMaster");
        modelMap.addAttribute("message", "Data Inactivated Successfully...");
        return new ModelAndView(new RedirectView("uomList.htm"), modelMap);
    }

    @RequestMapping("/master/uomActive.htm")
    public ModelAndView uomActive(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("pk");
        masterDAO.globalActive(sno, "UomMaster");
        modelMap.addAttribute("message", "Data Inactivated Successfully...");
        return new ModelAndView(new RedirectView("uomList.htm"), modelMap);
    }

    //---------------------ITEM MASTER-------------------------------------------//
    //ITEM MASTER List 
    @RequestMapping("/master/itemMasterList.htm")
    public ModelAndView itemMasterList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        if(fromDate!=null&&toDate!=null)
        if (fromDate.contains("frdate") && toDate.contains("todate")) {
            fromDate = null;
            toDate = null;
        }
        String tabName = "Accessory Master";
        String submoduleName = "Accessory Details";
        map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        if (fromDate == "" || fromDate == null || toDate == "" || toDate == null) {
            map.addAttribute("itemList", masterDAO.listActive("", "ItemMaster"));
            map.addAttribute("itemCatList", masterDAO.itemCatjoin());
            map.addAttribute("itemUomjoin", masterDAO.itemUomjoin());
        } else {
            map.addAttribute("itemList", masterDAO.listActive1("", "ItemMaster", fromDate, toDate));
            map.addAttribute("itemCatList", masterDAO.itemCatjoin1(fromDate, toDate));
            map.addAttribute("itemUomjoin", masterDAO.itemUomjoin1(fromDate, toDate));
        }
        return new ModelAndView("../master/itemMasterList", map);
    }
//ITEM MASTER  Form

    @RequestMapping("/master/itemMasterForm.htm")
    public ModelAndView itemMasterForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String categoryId = request.getParameter("categoryId");
        String uomId = request.getParameter("uomId");
        String link = "../master/itemMasterForm.htm";
        String tab = "Accessory Master";
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("itemList", masterDAO.listActive1(sno, "ItemMaster"));
            modelMap.addAttribute("itemStore", masterDAO.listActive1(sno, "ItemsStore"));
            modelMap.addAttribute("tab1", userDAO.formLabelMapping(link, tab));
            modelMap.addAttribute("categoryId", masterDAO.catId(sno, categoryId));
            modelMap.addAttribute("uomId1", masterDAO.uomId(sno, uomId));
        }
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        modelMap.addAttribute("storeName", userDAO.storeName());
        modelMap.addAttribute("tab1", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../master/itemMasterForm", modelMap);
    }

    //ITEM MASTER- Submit Method
    @RequestMapping("/master/itemMasterFormSubmit.htm")
    public ModelAndView itemMasterFormSubmit(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
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
        if (itemCode.isEmpty()) {
            String itemCode1 = request.getParameter("itemCode");
            ArrayList validuser = (ArrayList) masterDAO.ItemCodeGen(null, itemCode1, null);
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

            itemCode = "ACCESS" + "-" + ordno;
        }

        if (pk == null) {
            ItemMaster item = new ItemMaster(orgId, userId, itemCategory, itemCode, itemName, itemDesc, itemUom, issueUom, "update0", creationDate, timestamp);
            masterDAO.globalSave(item);

        } else {
            ItemMaster item = new ItemMaster(Integer.parseInt(pk), orgId, userId, itemCategory, itemCode, itemName, itemDesc, itemUom, issueUom, "update0", timestamp);
            masterDAO.globalSave(item);

        }

//        if (itemCategory.equals("Material") || itemCategory.equals("Asset") || itemCategory.equals("Service")) {
        String division = request.getParameter("division");
        String storeName = request.getParameter("storeName");
        String safetyStock = request.getParameter("saftyStock");
        if (pk == null) {
            ItemsStore itmstore = new ItemsStore(userId, orgId, itemCode, division, storeName, safetyStock, "update0", sqlTimestamp);
            masterDAO.save(itmstore);
        } else {
            ItemsStore itmstore = new ItemsStore(Integer.parseInt(pk), userId, orgId, itemCode, division, storeName, safetyStock, "update0", sqlTimestamp);
            masterDAO.save(itmstore);

        }
//        }

        ModelMap modelMap = new ModelMap();

        modelMap.addAttribute(
                "itemList", masterDAO.list("", "ItemMaster"));
        return new ModelAndView(
                new RedirectView("../master/itemMasterList.htm"), modelMap);
    }

    //unique item search method
    public void itemListAvailabilty(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException {
        res.setContentType("text/html;charset=UTF-8");
        String itemCategory = req.getParameter("itemCategory");
        String itemName = req.getParameter("itemName");
        masterDAO.selectItem(req, res, itemCategory, itemName);
    }

    @RequestMapping("/master/itemCatPopup.htm")
    public ModelAndView itemCatPopup(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        modelMap.addAttribute("itemCat", masterDAO.list("", "ItemCategory"));
        return new ModelAndView("itemCatPopup", modelMap);
    }

    @RequestMapping("/master/uomMasterPopup.htm")
    public ModelAndView uomMasterPopup(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        modelMap.addAttribute("uomList", masterDAO.list("", "UomMaster"));
        return new ModelAndView("uomMasterPopup", modelMap);
    }

    ////Item Master delete method  
    @RequestMapping("/master/itemMastDel.htm")
    public ModelAndView itemMastDel(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("pk");
        masterDAO.globalInactive(sno, "ItemMaster");
        modelMap.addAttribute("message", "Data Inactivated Successfully...");
        return new ModelAndView(new RedirectView("itemMasterList.htm"), modelMap);
    }

    @RequestMapping("/master/itemMastActive.htm")
    public ModelAndView itemMastActive(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("pk");
        masterDAO.globalActive(sno, "ItemMaster");
        modelMap.addAttribute("message", "Data Activated Successfully...");
        return new ModelAndView(new RedirectView("itemMasterList.htm"), modelMap);
    }

    //---------------------Service Request Type--------------------------------------------//
    //Service Request Type List 
    @RequestMapping("/master/serviceRequestTypeList.htm")
    public ModelAndView serviceRequestTypeList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Service Request Type";
        String submoduleName = "Service Request Type";
        map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        map.addAttribute("item", masterDAO.listActive("", "ServiceRequestType"));
        return new ModelAndView("../master/serviceRequestTypeList", map);
    }
//Service Request Type  Form

    @RequestMapping("/master/serviceRequestTypeForm.htm")
    public ModelAndView serviceRequestTypeForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String link = "../master/serviceRequestTypeForm.htm";
        String tab = "Service Request Type";
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("item", masterDAO.listActive1(sno, "ServiceRequestType"));
            modelMap.addAttribute("tablink", userDAO.formLabelMapping(link, tab));
        }
        modelMap.addAttribute("tablink", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../master/serviceRequestTypeForm", modelMap);
    }

    //Service Request Type Submit Method
    @RequestMapping("/master/serviceRequestTypeSubmit.htm")
    public ModelAndView serviceRequestTypeSubmit(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        String pk = request.getParameter("pk");
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String requestedTypeId = request.getParameter("requestedTypeId");
        String serviceRequested = request.getParameter("serviceRequested");
        String serviceRequestedCost = request.getParameter("serviceRequestedCost");
        String creationDate = request.getParameter("creationDate");
        String status = request.getParameter("status");

        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
//        List<ItemCategory> gridData = new ArrayList<ItemCategory>();
//        if (categoryId.isEmpty()) {
//            String categoryId1 = request.getParameter("categoryId");
//            ArrayList validuser = (ArrayList) masterDAO.ItemCatCodeGen(null, categoryId1, null);
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
//            categoryId = "ACCCAT" + "-" + ordno;
//        }

        if (pk == null) {
            ServiceRequestType item = new ServiceRequestType(orgId, userId, serviceRequested, serviceRequestedCost, timestamp, "update0", timestamp);
            masterDAO.globalSave(item);

        } else {
            ServiceRequestType item = new ServiceRequestType(Integer.parseInt(sno), orgId, userId, serviceRequested, serviceRequestedCost, timestamp, "update0", timestamp);
            masterDAO.globalSave(item);

        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("item", masterDAO.list1("", "ServiceRequestType"));
        return new ModelAndView(new RedirectView("../master/serviceRequestTypeList.htm"), modelMap);
    }

    //---------------------Penalty Type--------------------------------------------//
    //Penalty Type List 
    @RequestMapping("/master/penaltyTypeList.htm")
    public ModelAndView penaltyTypeList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Penalty Type";
        String submoduleName = "Penalty Type";
        map.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        map.addAttribute("item", masterDAO.listActive("", "PenaltyType"));
        return new ModelAndView("../master/penaltyTypeList", map);
    }
//Penalty Type  Form

    @RequestMapping("/master/penaltyTypeForm.htm")
    public ModelAndView penaltyTypeForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String link = "../master/penaltyTypeForm.htm";
        String tab = "Penalty Type";
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("item", masterDAO.listActive1(sno, "PenaltyType"));
            modelMap.addAttribute("tablink", userDAO.formLabelMapping(link, tab));
        }
        modelMap.addAttribute("tablink", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../master/penaltyTypeForm", modelMap);
    }

    //Penalty Type Submit Method
    @RequestMapping("/master/penaltyTypeFormSubmit.htm")
    public ModelAndView penaltyTypeFormSubmit(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        String pk = request.getParameter("pk");
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String penaltyType = request.getParameter("penaltyType");
        String penaltyTypeDescription = request.getParameter("penaltyTypeDescription");
        String penaltyAmount = request.getParameter("penaltyAmount");
        String creationDate = request.getParameter("creationDate");
        String status = request.getParameter("status");

        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
//        List<ItemCategory> gridData = new ArrayList<ItemCategory>();
//        if (categoryId.isEmpty()) {
//            String categoryId1 = request.getParameter("categoryId");
//            ArrayList validuser = (ArrayList) masterDAO.ItemCatCodeGen(null, categoryId1, null);
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
//            categoryId = "ACCCAT" + "-" + ordno;
//        }

        if (pk == null) {
            PenaltyType item = new PenaltyType(orgId, userId, penaltyType, penaltyTypeDescription, penaltyAmount, timestamp, "update0", timestamp);
            masterDAO.globalSave(item);

        } else {
            PenaltyType item = new PenaltyType(Integer.parseInt(sno), orgId, userId, penaltyType, penaltyTypeDescription, penaltyAmount, timestamp, "update0", timestamp);
            masterDAO.globalSave(item);

        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("item", masterDAO.list2("", "PenaltyType"));
        return new ModelAndView(new RedirectView("../master/penaltyTypeList.htm"), modelMap);
    }

    //---------------------Tenant Type---------------------------------------------//
//    Tenant Type List
    @RequestMapping("/master/complaintTypeList.htm")
    public ModelAndView complaintTypeList(HttpServletRequest request, HttpServletResponse response
    ) {
        ModelMap map = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Complaint Type";
        String submoduleName = "Masters";
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, submoduleName, tabName));
        map.addAttribute("complaintType", masterDAO.listActive(sno, "ComplaintType"));
        return new ModelAndView("../master/complaintTypeList", map);
    }
    
     @RequestMapping("/master/leadReferalList.htm")
    public ModelAndView leadReferalList(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../finance/leadReferalList", map);
    }

    @RequestMapping("/master/leadFormSubmit.htm")
    public ModelAndView leadFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
    
        String subGroupName  = request.getParameter("subGroupName");
        String leadDescription  = request.getParameter("leadDescription");
        String status  = request.getParameter("status");
        
        String SNo = request.getParameter("SNo");
        if(status == null) {
            status = "update0";
        }
       
        List<LeadReferral> gridData = new ArrayList<LeadReferral>();

        if (SNo == null || SNo.equals("")) {
            LeadReferral leadReferral = null;
           
              ///assetClass = new AssetClass(userId, orgId, assetClassId, assetClassName, assetClassDescription, status, newdate, newdate);
            leadReferral = new LeadReferral(userId, orgId, subGroupName, leadDescription, status, newdate, newdate);
            gridData.add(leadReferral);

            
            masterDAO.leadSaveList(gridData);
            modelMap.addAttribute("success", "true");
            modelMap.addAttribute("message", "Data Saved Successfully...");

        } else {
            LeadReferral leadReferral = null;
            leadReferral = new LeadReferral(Integer.parseInt(SNo), userId, orgId, subGroupName, leadDescription, 
                    status, newdate, newdate);
            
            masterDAO.leadSave(leadReferral);
   
            modelMap.addAttribute("success", "true");
            modelMap.addAttribute("message", "Data Updated Successfully...");
        }
        
         return new ModelAndView(new RedirectView("leadReferalList.htm"), modelMap);
    }
   

    //    Tenant Type Form
    @RequestMapping("/master/complaintTypeForm.htm")
    public ModelAndView complaintTypeForm(HttpServletRequest request, HttpServletResponse response
    ) {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("complaintType", masterDAO.listActive1(sno, "ComplaintType"));
        }
        String link = "../master/complaintTypeForm.htm";
        String tab = "Complaint Type";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../master/complaintTypeForm", modelMap);
    }
    
     @RequestMapping("/master/leadReferalForm.htm")
    public ModelAndView leadReferalForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String sno = request.getParameter("pk");
        String fromDate = request.getParameter("fromDate");
      
        return new ModelAndView("../finance/leadReferalForm", map);
    }
   
//    Tenant Type Submit

    @RequestMapping("/master/complaintTypeFormSubmit.htm")
    public ModelAndView complaintTypeFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");
        String complaintCode = request.getParameter("complaintCode");
        String complaintType = request.getParameter("complaintType");
        String typeDesc = request.getParameter("typeDesc");
        String status = request.getParameter("status");
        String creationDate = request.getParameter("creationDate");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());

        if (complaintCode == null || complaintCode == "" || "".equals(complaintCode)) {
            String complaintCode1 = request.getParameter("complaintType");

            ArrayList validuser = (ArrayList) masterDAO.ComplaintTypeCodeGen(complaintCode1);
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
            complaintCode = "CT" + "-" + ordno;
        }

        if (pk == null) {
            ComplaintType type = new ComplaintType(userId, orgId, complaintCode, complaintType, typeDesc, "update0", today, today);
            masterDAO.globalSave(type);
        } else {
            Date creationDate1 = null;
            if (!creationDate.equals("")) {
                creationDate1 = (Date) formatter.parse(creationDate);
            }
            ComplaintType type = new ComplaintType(Integer.parseInt(pk), userId, orgId, complaintCode, complaintType, typeDesc, status, creationDate1, today);
            masterDAO.globalSave(type);
        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("complaintType", masterDAO.list(pk, "ComplaintType"));
        return new ModelAndView(new RedirectView("../master/complaintTypeList.htm"), modelMap);
    }
// tenant type uniquness

    public void fetchcomplaintType(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String complaintType = req.getParameter("complaintType");
        masterDAO.fetchcomplaintType(req, res, complaintType);
    }
// Inactivate tenant type datails

    @RequestMapping("/master/complaintTypeDel.htm")
    public ModelAndView complaintTypeDel(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("pk");
        masterDAO.globalInactive(sno, "ComplaintType");
        modelMap.addAttribute("message", "Data Inactivated Successfully...");
        return new ModelAndView(new RedirectView("complaintTypeList.htm"), modelMap);
    }

    @RequestMapping("/master/complaintTypeActive.htm")
    public ModelAndView complaintTypeActive(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("pk");
        masterDAO.globalActive(sno, "ComplaintType");
        modelMap.addAttribute("message", "Data Activated Successfully...");
        return new ModelAndView(new RedirectView("complaintTypeList.htm"), modelMap);
    }

    public void SupplierAvailabilty(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        String supplierName = req.getParameter("supplierName");
        masterDAO.SupplierAvailabilty(req, res, supplierName);
    }

    @RequestMapping("/master/storeMasterList.htm")
    public ModelAndView storeMasterList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("store1", masterDAO.storeMaster(null));
        return new ModelAndView("../storeMaster/storeMasterList", modelMap);
    }

    @RequestMapping("/master/storeMasterForm.htm")
    public ModelAndView storeMasterForm(HttpServletRequest req, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String SNo = req.getParameter("pk");
        if (SNo != null) {
            modelMap.addAttribute("storelist", masterDAO.storeMaster(Integer.parseInt(SNo)));
        }
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", req.getParameter("action"));
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        return new ModelAndView("../storeMaster/storeMasterForm", modelMap);
    }

    @RequestMapping("/master/storeSubmit.htm")
    public ModelAndView storeSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String division = request.getParameter("division").trim();
        String storeType = request.getParameter("storeType").trim();
        String storeId = request.getParameter("storeID").trim();
        String storeCategory = request.getParameter("storeCategory").trim();
        String storeName = request.getParameter("storeName").trim();
        String address = request.getParameter("address").trim();
        String sno = request.getParameter("pk");
        String status = request.getParameter("status");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        if (sno == null) {

            StoreMaster storemaster = new StoreMaster(userId, orgId, division, storeType, storeName, address, storeId, storeCategory, "update0", timestamp);

            modelMap.addAttribute("message", "Data Saved Successfully...");
            masterDAO.saveStore(storemaster);
        } else {
            int k = Integer.parseInt(status.substring(status.length() - 1));
            k++;
            status = "update" + k;
            StoreMaster storemaster = new StoreMaster(Integer.parseInt(sno), userId, orgId, division, storeType, storeName, address, storeId, storeCategory, status, timestamp);
            modelMap.addAttribute("message", "Data Updated Successfully...");
            masterDAO.saveStore(storemaster);
        }
        modelMap.addAttribute("store", masterDAO.storeMaster(null));
        return new ModelAndView(new RedirectView("storeMasterList.htm"), modelMap);
    }

 @RequestMapping("/master/selectStoreCategory.htm")
    public ModelAndView selectStoreCategory(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("storecategorylist", masterDAO.selectStoreCategory());
        return new ModelAndView("../storeMaster/selectStoreCategory", modelMap);
    }

    @RequestMapping("/master/storeCategoryList.htm")
    public ModelAndView storeCategoryList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Store Category";
        String submoduleName = "Store Master";
        modelMap.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        modelMap.addAttribute("storecategory", masterDAO.storeCategory(null));
        return new ModelAndView("../storeMaster/storeCategoryList", modelMap);
    }

    @RequestMapping("/master/storeCategoryForm.htm")
    public ModelAndView storeCategoryForm(HttpServletRequest req, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String SNo = req.getParameter("pk");
        if (SNo != null) {
            modelMap.addAttribute("storecatlist", masterDAO.storeCategory(Integer.parseInt(SNo)));
        }
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", req.getParameter("action"));
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        return new ModelAndView("../storeMaster/storeCategoryForm", modelMap);
    }

    @RequestMapping("/master/storeCategoryFormSubmit.htm")
    public ModelAndView storeCategoryFormSubmit(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        String pk = request.getParameter("pk");
        String sno = request.getParameter("sno");
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String categoryNo = request.getParameter("categoryNo");
        String storeCategory = request.getParameter("storeCategory");
        String storeDesc = request.getParameter("storeDesc");
        String attribute1 = request.getParameter("attribute1");
        String attribute2 = request.getParameter("attribute2");
        String attribute3 = request.getParameter("attribute3");
        String attribute4 = request.getParameter("attribute4");
        String attribute5 = request.getParameter("attribute5");
        String status = request.getParameter("status");

        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());

        if (pk == null) {
            StoreCategory storecategory = new StoreCategory(orgId, userId, categoryNo, storeCategory, storeDesc, attribute1, attribute2, attribute3, attribute4, attribute4, "update0", timestamp, timestamp);
            masterDAO.saveStore(storecategory);
        } else {
            StoreCategory storecategory = new StoreCategory(Integer.parseInt(pk), orgId, userId, categoryNo, storeCategory, storeDesc, attribute1, attribute2, attribute3, attribute4, attribute4, "update0", timestamp, timestamp);
            masterDAO.saveStore(storecategory);
        }

        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("storeCategory", masterDAO.storeCategory(null));
        return new ModelAndView(new RedirectView("../master/storeCategoryList.htm"), modelMap);
    }

    @RequestMapping("/master/selectStoreType.htm")
    public ModelAndView selectStoreType(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("storeTypelist", masterDAO.selectStoreType());
        return new ModelAndView("../storeMaster/selectStoreType", modelMap);
    }

    @RequestMapping("/master/storeTypeMasterList.htm")
    public ModelAndView storeTypeMasterList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Store Type Master";
        String submoduleName = "Store Master";
        modelMap.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        modelMap.addAttribute("storeTypeList", masterDAO.storeTypeMaster(null));
        return new ModelAndView("../storeMaster/storeTypeMasterList", modelMap);
    }

    @RequestMapping("/master/storeTypeMasterForm.htm")
    public ModelAndView storeTypeMasterForm(HttpServletRequest req, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String SNo = req.getParameter("pk");
        if (SNo != null) {
            modelMap.addAttribute("storeTypeData", masterDAO.storeTypeMaster(Integer.parseInt(SNo)));
        }
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", req.getParameter("action"));
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        return new ModelAndView("../storeMaster/storeTypeMasterForm", modelMap);
    }

    @RequestMapping("/master/storeTypeMasterFormSubmit.htm")
    public ModelAndView storeTypeMasterFormSubmit(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        String pk = request.getParameter("pk");
        String sno = request.getParameter("sno");
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String storeId = request.getParameter("storeTypeID");
        String storeTypeName = request.getParameter("storeType");
        String storeCategory = request.getParameter("storeCategory");
        String storeDesc = request.getParameter("storeTypeDesc");
        String attribute1 = request.getParameter("attribute1");
        String attribute2 = request.getParameter("attribute2");
        String attribute3 = request.getParameter("attribute3");
        String attribute4 = request.getParameter("attribute4");
        String attribute5 = request.getParameter("attribute5");
        String status = request.getParameter("status");

        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());

        if (pk == null) {
            StoreTypeMaster storeType = new StoreTypeMaster(orgId, userId, storeId, storeTypeName, storeCategory, storeDesc, attribute1, attribute2, attribute3, attribute4, attribute4, "update0", timestamp, timestamp);
            masterDAO.saveStore(storeType);
        } else {
            StoreTypeMaster storeType = new StoreTypeMaster(Integer.parseInt(pk), orgId, userId, storeId, storeTypeName, storeCategory, storeDesc, attribute1, attribute2, attribute3, attribute4, attribute4, "update0", timestamp, timestamp);
            masterDAO.saveStore(storeType);
        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("storeCategory", masterDAO.storeCategory(null));
        return new ModelAndView(new RedirectView("../master/storeTypeMasterList.htm"), modelMap);
    }
    @RequestMapping("/master/store.htm")
    public void store(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException {
        res.setContentType("text/html;charset=UTF-8");
        //String catCode = req.getParameter("catCode");
        String division = req.getParameter("division");
        String storeType = req.getParameter("storeType");
        // String storeName = req.getParameter("storeName");
        if (storeType.equals("Center Store")) {
            masterDAO.store(req, res, division, "Center Store");
        }
    }

    @RequestMapping("/master/storeMaster.htm")
    public void storeMaster(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException {
        res.setContentType("text/html;charset=UTF-8");
        //String catCode = req.getParameter("catCode");
        String division = req.getParameter("division");
        String storeType = req.getParameter("storeType");
        String storeName = req.getParameter("storeName");
        masterDAO.storeMast(req, res, division, storeType, storeName);

    }

    @RequestMapping("/master/deliverylocForm.htm")
    public ModelAndView deliverylocForm(HttpServletRequest req, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String SNo = req.getParameter("pk");
        if (SNo != null) {
            modelMap.addAttribute("dellist", masterDAO.dellocList(Integer.parseInt(SNo)));
        }
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("orglist", userDAO.orglistNameWise(null));
        modelMap.addAttribute("action", req.getParameter("action"));
        return new ModelAndView("deliverylocForm", modelMap);
    }

    @RequestMapping("/master/deliverylocList.htm")
    public ModelAndView deliverylocList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("dellist", masterDAO.dellocList(null));
        return new ModelAndView("deliverylocList", modelMap);
    }

    @RequestMapping("/master/individualUtilityList.htm")
    public ModelAndView individualUtilityList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String SNo = req.getParameter("SNo");
        String tabName = "Common Utilities";
        String submoduleName = "Utility Master";
        modelMap.addAttribute("inUtilList", userDAO.inUtilList(SNo));
        modelMap.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../utility/individualUtilityList", modelMap);
    }

    @RequestMapping("/master/commonUtilityList.htm")
    public ModelAndView commonUtilityList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String SNo = req.getParameter("SNo");
        String tabName = "Individual Utilities";
        String submoduleName = "Utility Master";
        modelMap.addAttribute("comUtilList", userDAO.comUtilList(SNo));
        modelMap.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../utility/commonUtilityList", modelMap);
    }
    
    @RequestMapping("/master/propertyServicesList.htm")
    public ModelAndView propertyServicesList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String SNo = req.getParameter("SNo");
        String tabName = "Individual Utilities";
        String submoduleName = "Utility Master";
       // modelMap.addAttribute("comUtilList", userDAO.comUtilList(SNo));
        modelMap.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../management/propertyServicesList", modelMap);
    }
    
    @RequestMapping("/master/propertyServicesForm.htm")
    public ModelAndView propertyServicesForm(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String SNo = req.getParameter("SNo");
        String tabName = "Individual Utilities";
        String submoduleName = "Utility Master";
        modelMap.addAttribute("comUtilList", userDAO.comUtilList(SNo));
        modelMap.addAttribute("permission", contractDAO.roleperm(orgId, roleName, submoduleName, tabName));
        return new ModelAndView("../management/propertyServicesForm", modelMap);
    }

    @RequestMapping("/master/deliverylocSubmit.htm")
    public ModelAndView deliverylocSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String divisionName = request.getParameter("divisionName").trim();
        String address = request.getParameter("address").trim();
        String contactNo = request.getParameter("contactNo");
        String emailId = request.getParameter("emailId").trim();
        String sno = request.getParameter("pk");
        String status = request.getParameter("status");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        if (sno == null) {
            DeliveryLocation delLoc = new DeliveryLocation(userId, orgId, divisionName, address, BigDecimal.valueOf(Double.parseDouble(contactNo)), emailId, "update0", timestamp);
            modelMap.addAttribute("message", "Data Saved Successfully...");
            masterDAO.save(delLoc);
        } else {
            int k = Integer.parseInt(status.substring(status.length() - 1));
            k++;
            status = "update" + k;
            DeliveryLocation delLoc = new DeliveryLocation(Integer.parseInt(sno), userId, orgId, divisionName, address, BigDecimal.valueOf(Double.parseDouble(contactNo)), emailId, status, timestamp);
            modelMap.addAttribute("message", "Data Updated Successfully...");
            masterDAO.save(delLoc);
        }
        return new ModelAndView(new RedirectView("deliverylocList.htm"), modelMap);
    }

    @RequestMapping("/master/getDelLoc.htm")
    public void getDelLoc(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        HttpSession session = req.getSession(true);
        String divisionName = req.getParameter("divisionName");
        String address = req.getParameter("address");
        masterDAO.getDelLoc(req, res, divisionName, address);
    }

    @RequestMapping("/master/billlocList.htm")
    public ModelAndView billlocList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("billloclist", masterDAO.billlocList(null));
        return new ModelAndView("billlocList", modelMap);
    }

    @RequestMapping("/master/billlocForm.htm")
    public ModelAndView billlocForm(HttpServletRequest req, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String SNo = req.getParameter("pk");
        if (SNo != null) {
            modelMap.addAttribute("billloclist", masterDAO.billlocList(Integer.parseInt(SNo)));
        }
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        modelMap.addAttribute("action", req.getParameter("action"));
        return new ModelAndView("billlocForm", modelMap);
    }

    @RequestMapping("/master/billlocSubmit.htm")
    public ModelAndView billlocSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String divisionName = request.getParameter("divisionName").trim();
        String address = request.getParameter("address").trim();
        String contactNo = request.getParameter("contactNo");
        String emailId = request.getParameter("emailId").trim();
        String sno = request.getParameter("pk");
        String status = request.getParameter("status");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        if (sno == null) {
            BilltoLocation billLoc = new BilltoLocation(userId, orgId, divisionName, address, BigDecimal.valueOf(Double.parseDouble(contactNo)), emailId, "update0", timestamp);
            modelMap.addAttribute("message", "Data Saved Successfully...");
            masterDAO.save(billLoc);
        } else {
            int k = Integer.parseInt(status.substring(status.length() - 1));
            k++;
            status = "update" + k;
            BilltoLocation billLoc = new BilltoLocation(Integer.parseInt(sno), userId, orgId, divisionName, address, BigDecimal.valueOf(Double.parseDouble(contactNo)), emailId, status, timestamp);
            modelMap.addAttribute("message", "Data Updated Successfully...");
            masterDAO.save(billLoc);
        }
        return new ModelAndView(new RedirectView("billlocList.htm"), modelMap);
    }

    @RequestMapping("/master/getBillLoc.htm")
    public void getBillLoc(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        HttpSession session = req.getSession(true);
        String divisionName = req.getParameter("divisionName");
        String address = req.getParameter("address");
        masterDAO.getBillLoc(req, res, divisionName, address);
    }

    @RequestMapping("/master/paytermList.htm")
    public ModelAndView paytermList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("termslist", masterDAO.TermsList(null, "Payment"));
        return new ModelAndView("paymentTerms", modelMap);
    }

    @RequestMapping("/master/termsForm.htm")
    public ModelAndView termsForm(HttpServletRequest req, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String SNo = req.getParameter("pk");
        if (SNo != null) {
            modelMap.addAttribute("termslist", masterDAO.TermsList(Integer.parseInt(SNo), null));
        }
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("orglist", userDAO.orglist(null));
        modelMap.addAttribute("action", req.getParameter("action"));
        modelMap.addAttribute("tab", req.getParameter("tab"));
        return new ModelAndView("TermsForm", modelMap);
    }

    @RequestMapping("/master/termsSubmit.htm")
    public ModelAndView termsSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String termType = request.getParameter("termType");
        String termCode = request.getParameter("termCode");
        String termName = request.getParameter("termName").trim();
        String termDesc = request.getParameter("termDesc").trim();
        String sno = request.getParameter("pk");
        String status = request.getParameter("status");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        if (sno == null) {
            MasterTerms mterms = new MasterTerms(termType, termCode, termName, termDesc, "update0", timestamp);
            modelMap.addAttribute("message", "Data Saved Successfully...");
            masterDAO.save(mterms);
        } else {
            int k = Integer.parseInt(status.substring(status.length() - 1));
            k++;
            status = "update" + k;
            MasterTerms mterms = new MasterTerms(Integer.parseInt(sno), termType, termCode, termName, termDesc, "update0", timestamp);
            modelMap.addAttribute("message", "Data Updated Successfully...");
            masterDAO.save(mterms);
        }
        if ("Payment".equals(termType)) {
            return new ModelAndView(new RedirectView("paytermList.htm"), modelMap);
        } else {
            return new ModelAndView(new RedirectView("deltermList.htm"), modelMap);
        }
    }

    @RequestMapping("/master/termList.htm")
    public ModelAndView termList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String type = req.getParameter("type");
        modelMap.addAttribute("termslist", masterDAO.TermsList(null, type));
        modelMap.addAttribute("id", req.getParameter("id"));
        return new ModelAndView("../supplier/selectTerms", modelMap);
    }
    
    @RequestMapping("/master/getTerms.htm")
    public void getTerms(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        HttpSession session = req.getSession(true);
        String termCode = req.getParameter("termCode");
        String termType = req.getParameter("termType");
        masterDAO.getTerms(req, res, termCode, termType);
    }

    @RequestMapping("/master/deltermList.htm")
    public ModelAndView deltermList(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("termslist", masterDAO.TermsList(null, "Delivery"));
        return new ModelAndView("deliveryTerms", modelMap);
    }

    @RequestMapping("/master/serviceRTDel.htm")
    public ModelAndView serviceRTDel(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("pk");
        masterDAO.globalInactive(sno, "ServiceRequestType");
        modelMap.addAttribute("message", "Data Inactivated Successfully...");
        return new ModelAndView(new RedirectView("serviceRequestTypeList.htm"), modelMap);
    }

    @RequestMapping("/master/serviceRTActive.htm")
    public ModelAndView serviceRTActive(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("pk");
        masterDAO.globalActive(sno, "ServiceRequestType");
        modelMap.addAttribute("message", "Data Activated Successfully...");
        return new ModelAndView(new RedirectView("serviceRequestTypeList.htm"), modelMap);
    }

    @RequestMapping("/master/penaltyTypeDel.htm")
    public ModelAndView penaltyTypeDel(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("pk");
        masterDAO.globalInactive(sno, "PenaltyType");
        modelMap.addAttribute("message", "Data Inactivated Successfully...");
        return new ModelAndView(new RedirectView("penaltyTypeList.htm"), modelMap);
    }

    @RequestMapping("/master/penaltyTypeActive.htm")
    public ModelAndView penaltyTypeActive(HttpServletRequest req, HttpServletResponse res) throws NumberFormatException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String sno = req.getParameter("pk");
        masterDAO.globalActive(sno, "PenaltyType");
        modelMap.addAttribute("message", "Data Activated Successfully...");
        return new ModelAndView(new RedirectView("penaltyTypeList.htm"), modelMap);
    }

    @RequestMapping("/master/commonUtilityForm.htm")
    public ModelAndView commonUtilityForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("SNo");
        if (SNo != null && !SNo.isEmpty()) {
            modelMap.addAttribute("comUtilList", userDAO.comUtilList(SNo));
        }

        String link = "../master/individualUtilityForm.htm";
        String tab = "Individual Utilities";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("fileSize", userDAO.fileSize());
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../utility/commonUtilityForm", modelMap);
    }

    @RequestMapping("/master/individualUtilityForm.htm")
    public ModelAndView individualUtilityForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("SNo");
        if (SNo != null && !SNo.isEmpty()) {
            modelMap.addAttribute("inUtilList", userDAO.inUtilList(SNo));
        }

        String link = "../master/individualUtilityForm.htm";
        String tab = "Individual Utilities";
        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("fileSize", userDAO.fileSize());
        modelMap.addAttribute("action", request.getParameter("action"));

        return new ModelAndView("../utility/individualUtilityForm", modelMap);
    }

    @RequestMapping("/master/individualUtilityFormSubmit.htm")
    public ModelAndView individualUtilityFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException, ParseException {
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sno = request.getParameter("SNo");
        String electricBill = request.getParameter("utility");
        String remarks = request.getParameter("remarks");
        String waterBill = request.getParameter("utilityBill");
        String utilityCode = request.getParameter("utilityCode");
        String utilityBillType = request.getParameter("utilityBillType");
        String utilityBillYear = request.getParameter("utilityBillYear");
        String status = request.getParameter("status");

        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        if (sno == null || sno.equals("")) {
            if (utilityCode == null || utilityCode.equalsIgnoreCase("Utility-")) {
                ArrayList validuser = (ArrayList) masterDAO.getUtilityCode(utilityCode);
                String orderNo2 = null;
                String orderNo1[] = null;
                int ordno = 1;
                if (!(validuser.isEmpty() || validuser == null)) {
                    for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
                        orderNo2 = iter.next();
                    }
                    orderNo1 = orderNo2.split("-");
                }
                if (orderNo2 != null) {
                    ordno = Integer.parseInt(orderNo1[1]) + 1;
                }
                utilityCode = "Utility" + "-" + ordno;
            }
            IndividualUitlity mterms = new IndividualUitlity(electricBill, remarks,waterBill, "update0", utilityCode, utilityBillType, utilityBillYear, timestamp);

            masterDAO.save(mterms);
        } else {
            IndividualUitlity mterms = new IndividualUitlity(Integer.parseInt(sno), electricBill,remarks, waterBill, "update0", utilityCode, utilityBillType, utilityBillYear, timestamp);

            masterDAO.save(mterms);
        }

        //LandLordDetails landlord = new LandLordDetails(orgId, userId,);            //masterDAO.globalSave(landlord);            
        ModelMap modelMap = new ModelMap();
        //modelMap.addAttribute("landLord", masterDAO.list(pk, "LandLordDetails"));
        //return new ModelAndView("../utility/individualUtilityList", modelMap);
        return new ModelAndView(new RedirectView("../master/individualUtilityList.htm"), modelMap);
    }

    @RequestMapping("/master/commonUtilityFormSubmit.htm")
    public ModelAndView commonUtilityFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException, ParseException {
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sno = request.getParameter("SNo");
        String basementBill = request.getParameter("comUtility");
        String remarks = request.getParameter("remarks");
        String parkingBill = request.getParameter("comutilityBill");
        String comTotalAmount = request.getParameter("comTotalAmount");
        String comUtilityCode = request.getParameter("comUtilityCode");
        String comUtilityBillType = request.getParameter("comUtilityBillType");
        String status = request.getParameter("status");

        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        if (sno == null || sno.equals("")) {
            if (comUtilityCode == null || comUtilityCode.equalsIgnoreCase("ComUtility-")) {
                ArrayList validuser = (ArrayList) masterDAO.getComUtilityCode(comUtilityCode);
                String orderNo2 = null;
                String orderNo1[] = null;
                int ordno = 1;
                if (!(validuser.isEmpty() || validuser == null)) {
                    for (Iterator<String> iter = validuser.iterator(); iter.hasNext();) {
                        orderNo2 = iter.next();
                    }
                    orderNo1 = orderNo2.split("-");
                }
                if (orderNo2 != null) {
                    ordno = Integer.parseInt(orderNo1[1]) + 1;
                }
                comUtilityCode = "ComUtility" + "-" + ordno;
            }
            CommonUtility mterms = new CommonUtility(basementBill,remarks, parkingBill, comUtilityCode, comUtilityBillType, "update0", timestamp);

            masterDAO.save(mterms);
        } else {
            CommonUtility mterms = new CommonUtility(Integer.parseInt(sno), basementBill,remarks, parkingBill, comUtilityCode, comUtilityBillType, "update0", timestamp);

            masterDAO.save(mterms);
        }

        //LandLordDetails landlord = new LandLordDetails(orgId, userId,);            //masterDAO.globalSave(landlord);            
        ModelMap modelMap = new ModelMap();
        //modelMap.addAttribute("landLord", masterDAO.list(pk, "LandLordDetails"));
        //return new ModelAndView("../utility/commonUtilityList", modelMap);
        return new ModelAndView(new RedirectView("../master/commonUtilityList.htm"), modelMap);
    }
//    
//    //this AMC Type List
//     @RequestMapping("/master/amcTypeList.htm")
//    public ModelAndView amcTypeList(HttpServletRequest request, HttpServletResponse response) {
//
//         ModelMap modelMap = new ModelMap();
//        HttpSession session = request.getSession();
//        String orgId = session.getAttribute("orgId").toString();
//        String userId = session.getAttribute("userId").toString();
//        String roleName = session.getAttribute("userRole").toString();
//        String tabName = "AMC Maintenance";
//        String submoduleName = "AMC Maintenance";
//        modelMap.addAttribute("amcTypePermission", masterDAO.permmenus(orgId, roleName, submoduleName, tabName));
//        //modelMap.addAttribute("amcTypeList", masterDAO.lists("", "AMCType"));
//       modelMap.addAttribute("amcTypeList", masterDAO.listActives("", "AMCType"));
//        return new ModelAndView("../master/amcTypeList", modelMap);
//    }
//    //AMC type Form
//    @RequestMapping("/master/amcTypeForm.htm")
//    public ModelAndView amcTypeForm(HttpServletRequest request, HttpServletResponse response) {
//
//     ModelMap modelMap = new ModelMap();
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
//        return new ModelAndView("../master/amcTypeForm", modelMap);
//    }
////    AMC Submit
//    @RequestMapping("/master/amcTypeFormSubmit.htm")
//    public ModelAndView amcTypeFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
//        HttpSession session = request.getSession();
//        String amcType = request.getParameter("amcType");
//        String schedule = request.getParameter("schedule");
//        String vendor = request.getParameter("vendor");
//        String cost = request.getParameter("cost");
//        String amcDescription = request.getParameter("amcDescription");
//        String status = request.getParameter("status");
//        String userId = session.getAttribute("userId").toString();
//        String orgId = session.getAttribute("orgId").toString();
//        String annualCost = request.getParameter("annualCost");
//        
//        
//        String pk = request.getParameter("pk");
//
//        java.util.Date today = new java.util.Date();
//        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
////        if (amcType == null || amcType == "" || "".equals(amcType)) {
////            
////           // Integer TC = amctypedao.getTCNo();
////           // amcType = "TT" + "-" + (TC + 1);
////        }
//        if (amcType == null || amcType == "" || "".equals(amcType)) {
//           // Integer TT = amctypedao.getTCNos();
//           // amcType = "FT" + "-" + (TT + 1);
//        }
//        if (pk == null) {
//
//            AMCType amcTypes = new AMCType(amcType, schedule, vendor, cost, amcDescription, "update0", orgId, userId,annualCost);
//            masterDAO.amcTypeSave(amcTypes);
//        } else {
//
//            AMCType amctypes = new AMCType(Integer.parseInt(pk), amcType, schedule, vendor, cost, amcDescription, status, orgId, userId,annualCost);
//            masterDAO.amcTypeSave(amctypes);
//        }
//        ModelMap modelMap = new ModelMap();
//        //modelMap.addAttribute("category", amctypedao.list(pk, "Category"));
//        return new ModelAndView(new RedirectView("../master/amcTypeList.htm"), modelMap);
//    }

    //this AMC Type List
    @RequestMapping("/master/amcTypeList.htm")
    public ModelAndView amcTypeList(HttpServletRequest request, HttpServletResponse response) {

        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "AMC Type";
        String submoduleName = "AMC Maintenance";
        modelMap.addAttribute("amcTypePermission", masterDAO.permmenus(orgId, roleName, submoduleName, tabName));
        //modelMap.addAttribute("amcTypeList", masterDAO.lists("", "AMCType"));
        modelMap.addAttribute("amcTypeList", masterDAO.listActives("", "AMCType"));
        return new ModelAndView("../master/amcTypeList", modelMap);
    }

    //AMC type Form
    @RequestMapping("/master/amcTypeForm.htm")
    public ModelAndView amcTypeForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {

        // ModelMap modelMap = new ModelMap();
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String SNo = request.getParameter("pk");
        if (SNo != null) {
            modelMap.addAttribute("amcTypeList", masterDAO.amcTypesList(Integer.parseInt(SNo)));
        }
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("orglist", userDAO.orglistNameWise(null));
        modelMap.addAttribute("action", request.getParameter("action"));
        // return new ModelAndView("deliverylocForm", modelMap);
        // String sno = request.getParameter("pk");
        //  HttpSession session = request.getSession();
        //  String orgId = session.getAttribute("orgId").toString();
        //String link = "../master/amcTypeForm.htm";
        // String tab = "AMC Maintenance";
        //  if (sno != null && !sno.isEmpty()) {
        //     modelMap.addAttribute("amcTypeList", masterDAO.lists(sno, "AMCType"));
        //     modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        // }
        // modelMap.addAttribute("amcTypeList", userDAO.formLabelMapping(link, tab));
        //.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        //modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../master/amcTypeForm", modelMap);
    }
//    AMC Submit

    @RequestMapping("/master/amcTypeFormSubmit.htm")
    public ModelAndView amcTypeFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
        HttpSession session = request.getSession();
        String amcType = request.getParameter("amcType");
        String schedule = request.getParameter("schedule");
        String vendor = request.getParameter("vendor");
        String cost = request.getParameter("cost");
        String amcDescription = request.getParameter("amcDescription");
        String status = request.getParameter("status");
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String annualCost = request.getParameter("annualCost");

        String pk = request.getParameter("pk");

        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
//        if (amcType == null || amcType == "" || "".equals(amcType)) {
//            
//           // Integer TC = amctypedao.getTCNo();
//           // amcType = "TT" + "-" + (TC + 1);
//        }
        if (amcType == null || amcType == "" || "".equals(amcType)) {
            // Integer TT = amctypedao.getTCNos();
            // amcType = "FT" + "-" + (TT + 1);
        }
        if (pk == null) {

            AMCType amcTypes = new AMCType(amcType, schedule, vendor, cost, amcDescription, "update0", orgId, userId, annualCost);
            masterDAO.amcTypeSave(amcTypes);
        } else {

            AMCType amctypes = new AMCType(Integer.parseInt(pk), amcType, schedule, vendor, cost, amcDescription, status, orgId, userId, annualCost);
            masterDAO.amcTypeSave(amctypes);
        }
        ModelMap modelMap = new ModelMap();
        //modelMap.addAttribute("category", amctypedao.list(pk, "Category"));
        return new ModelAndView(new RedirectView("../master/amcTypeList.htm"), modelMap);
    }

}
