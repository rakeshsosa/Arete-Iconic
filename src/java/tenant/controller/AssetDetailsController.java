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
import tenant.classes.AccessoriesTagging;
import tenant.classes.AreaManagement;
import tenant.classes.AreaManagementGrid;
import tenant.classes.AssetAttach;
import tenant.classes.AssetDetails;
import tenant.classes.AssetUtilityDetails;
import tenant.classes.BuildingHistoryManagement;
import tenant.classes.BuildingHistoryManagementGrid;
import tenant.classes.DocumentAttach;
import tenant.classes.FlatRoomDetails;
import tenant.classes.SubAssetAttach;
import tenant.classes.SubAssetDetails;
import tenant.classes.assetOwnerItem;
import tenant.dao.AssetDAO;
import tenant.dao.MasterDAO;
import tenant.dao.TenantDetailsDAO;
import tenant.dao.UserDAO;

/**
 *
 * @author ebs-sdd32
 */
@Controller
public class AssetDetailsController extends MultiActionController {

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
    private AssetDAO assetDAO;
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private TenantDetailsDAO tenantDetailsDAO;

//---------------------Property Details Start---------------------------------------------//
//**************Property Details List******************//
    @RequestMapping("/assets/assetsDetailsList.htm")
    public ModelAndView assetsDetailsList(HttpServletRequest request, HttpServletResponse response) {
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

        if (fromDate == null || toDate == null) {

            map.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
        } else {
            map.addAttribute("assetDetails", assetDAO.AssetDetailslist1(fromDate, toDate));
        }
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Property Details", "Property Details"));

        return new ModelAndView("../assets/assetsDetailsList", map);
    }
    @RequestMapping("/assets/assetDetailsDel.htm") 
    public ModelAndView assetDetailsDel(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String SNo = request.getParameter("SNo");
          String status = request.getParameter("status");
        assetDAO.assetDetailsDel(SNo, status);
       return new ModelAndView(new RedirectView("assetsDetailsList.htm"), modelMap);
    }
    
    
    @RequestMapping("/assets/propertyAreaList.htm")
    public ModelAndView propertyAreaList(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
       
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Property Area Management", "Property Area"));

        return new ModelAndView("../assets/propertyAreaList", map);
    }
    
    @RequestMapping("/assets/propertyAreaForm.htm")
    public ModelAndView propertyAreaForm(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
       
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Property Area Management", "Property Area"));

        return new ModelAndView("../assets/propertyAreaForm", map);
    }

//**************Property Details Form******************//
    @RequestMapping("/assets/assetsDetailsForm.htm")
    public ModelAndView assetsDetailsForm(HttpServletRequest request, HttpServletResponse response) {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String sno = request.getParameter("pk");
        String assetCode = request.getParameter("assetCode");
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        List<AssetUtilityDetails> gridData = new ArrayList<AssetUtilityDetails>();

        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(sno));
            modelMap.addAttribute("assetAttach", assetDAO.assetAttachView(Integer.parseInt(sno), assetCode));
            modelMap.addAttribute("assetOwnerView", assetDAO.assetOwnerView(Integer.parseInt(sno), assetCode));
            gridData.addAll(assetDAO.AssetUtilityDetailslist(assetCode));

//            for (PurchaseOrder purset1 : gridData) {
//                purset.add(purset1.getPrNo());
//            }
            modelMap.addAttribute("assetDetails1", gridData);
            // return new ModelAndView("../assets/assetsDetailsForm", modelMap);        

        }

        String link = "../assets/assetsDetailsForm.htm";
        String tab = "Property Details";

        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("propertytype", userDAO.tenantCategory());
        modelMap.addAttribute("utilityDetails", userDAO.utility());
        modelMap.addAttribute("comUtilityDetails", userDAO.comUtility());
        modelMap.addAttribute("action", request.getParameter("action"));
        //modelMap.addAttribute("utilityDetails", userDAO.utilityDetails(userId,orgId));
        return new ModelAndView("../assets/assetsDetailsForm", modelMap);
    }
    
    
     @RequestMapping("/assets/areaManagementFormSubmit.htm")
    public ModelAndView areaManagementFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sno = request.getParameter("SNo");
        String assetCode = request.getParameter("assetCode");
        String areaCode = request.getParameter("areaCode");
        String assetName = request.getParameter("assetName");
        String totalLandArea[] = request.getParameterValues("totalLandArea1");
        String builtUpArea[] = request.getParameterValues("builtUpArea1");
        String commonArea[] = request.getParameterValues("commonArea1");
        String totalRentalArea[] = request.getParameterValues("totalRentalArea1");
        String units[] = request.getParameterValues("units1");
        String floor1[] = request.getParameterValues("floor1");
         
        List<AreaManagement> gridData = new ArrayList<AreaManagement>();
        
        try {
            if (sno == null || sno.equals("")) {
                AreaManagement  am = new AreaManagement(userId, orgId, areaCode, assetCode, assetName, "", "", "", "", "Active","","", newdate);
                assetDAO.areaSave(am);
                
                try {
                    if(floor1 != null) {
                        for (int i = 0; i < floor1.length; i++) {
                           AreaManagementGrid os=new AreaManagementGrid(userId, orgId, assetCode, totalLandArea[i], builtUpArea[i], commonArea[i], totalRentalArea[i], units[i], floor1[i], newdate, "Active");
                              assetDAO.newAreaManagementGridListSave(os);
                        }
                    }
                } catch(Exception ex) {
                      ex.printStackTrace();
                  }
            }else{
                AreaManagement  am = new AreaManagement(Integer.parseInt(sno), userId, orgId, areaCode, assetCode, assetName, "", "", "", "", "Active","","", newdate);
                assetDAO.areaSave(am);
                
                try {
                    if(floor1 != null) {
                        for (int i = 0; i < floor1.length; i++) {
                           AreaManagementGrid os=new AreaManagementGrid(Integer.parseInt(sno), userId, orgId, assetCode, totalLandArea[i], builtUpArea[i], commonArea[i], totalRentalArea[i], units[i], floor1[i], newdate, "Active");
                              assetDAO.newAreaManagementGridListSave(os);
                        }
                    }
                } catch(Exception ex) {
                      ex.printStackTrace();
                  }
            }
        }catch (Exception e) {
        }
        //
//        AreaManagement  am = null;
//        
//        for (int i = 0; i < floor1.length; i++) {
//            
//            if (sno == null || sno.equals("")) {
//            
//                am = new AreaManagement(userId, orgId, areaCode, assetCode, assetName, totalLandArea[i], builtUpArea[i], commonArea[i], totalRentalArea[i], "Active",units[i],floor1[i], newdate);
//                assetDAO.areaSave(am);
//
////                assetDAO.updateStausAreaManagement(assetCode, userId);
//            
//            } else {
//                am = new AreaManagement(Integer.parseInt(sno), userId, orgId, areaCode, assetCode, assetName, totalLandArea[i], 
//                        builtUpArea[i], commonArea[i], totalRentalArea[i], "Active",units[i],floor1[i], newdate);
//                assetDAO.areaSave(am);
//            }
//            
//        }
//        if (pk == null || pk == "" || pk.equals("")) {
//            
//            am = new AreaManagement(userId, orgId, areaCode, assetCode, assetName, totalLandArea, builtUpArea, commonArea, totalRentalArea, "Active",units, newdate);
//          //  assetDAO.areaSave(am);
//        }
        
        return new ModelAndView(new RedirectView("../assets/areaManagementList.htm"), modelMap);
    }
    @RequestMapping("/assets/areaDetailsDel.htm") 
    public ModelAndView areaDetailsDel(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String SNo = request.getParameter("SNo");
          String status = request.getParameter("status");
        assetDAO.areaDetailsDel(SNo, status);
       return new ModelAndView(new RedirectView("areaManagementList.htm"), modelMap);
    }
    
    @RequestMapping("/assets/documentTrackingFormSubmit.htm")
    public ModelAndView documentTrackingFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");
        
        String assetCode[] = request.getParameterValues("assetCode1");
        String assetName[] = request.getParameterValues("assetName1");
      //  String subAssetName[] = request.getParameterValues("subAssetName1");
       // String subAssetCode[] = request.getParameterValues("subAssetCode1");
        
        String documentName[] = request.getParameterValues("docname");
        String documentType[] = request.getParameterValues("documentType");
        String doccategory[] = request.getParameterValues("doccategory");
        String documentDateOfUploadDate[] = request.getParameterValues("reminderDate");
        String documentExpirtyDate[] = request.getParameterValues("documentExpirtyDate");
        String reminderNote[] = request.getParameterValues("reminderNote");
        String reminderDate[] = request.getParameterValues("reminderDate");
        
        
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        
        
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            List<MultipartFile> multipartFiles = multipartRequest.getFiles("attachments");
         //   String documentNames[] = request.getParameterValues("documentname");
      //     String documentNames[] = request.getParameterValues("documentname");

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

                List<DocumentAttach> list = new ArrayList<DocumentAttach>();
                for (Iterator<MultipartFile> iterator = multipartFiles.iterator(); iterator.hasNext();) {
                    
                    MultipartFile test = (MultipartFile) iterator.next();
                    fileLength = test.getBytes().length;
                    
                      
                

            //        if (fileLength > 0 || fileLength < 0) {
                        
                        
                         Date documentDateOfUploadDate1 = null;
                          if (!"".equals(documentDateOfUploadDate[i]) && documentDateOfUploadDate[i] != null) {
                          documentDateOfUploadDate1 = (Date) formatter2.parse(documentDateOfUploadDate[i]);
        }
                          
                          Date documentExpirtyDate1 = null;
        if (!"".equals(documentExpirtyDate[i]) && documentExpirtyDate[i] != null) {
            documentExpirtyDate1 = (Date) formatter2.parse(documentExpirtyDate[i]);
        }
        
        Date reminderDate1 = null;
        if (!"".equals(reminderDate[i]) && reminderDate[i] != null) {
            reminderDate1 = (Date) formatter2.parse(reminderDate[i]);
        }
                        
                        
                        DocumentAttach bdpfFile = new DocumentAttach();
                        bdpfFile.setFilename(test.getOriginalFilename());

                        bdpfFile.setContent(test.getBytes());
                        bdpfFile.setContentType(test.getContentType());
                        bdpfFile.setDocumentName(documentName[i]);
                        bdpfFile.setDocumentType(documentType[i]);
                        bdpfFile.setDocumentDateOfUploadDate(documentDateOfUploadDate1);
                        bdpfFile.setDocumentExpirtyDate(documentExpirtyDate1);
                        bdpfFile.setDocumentCategory(doccategory[i]);
                        bdpfFile.setReminderNote(reminderNote[i]);
                        bdpfFile.setReminderDate(reminderDate1);
                   //     System.out.println("DocumentName:"+documentName[i]);
                        bdpfFile.setOrgId(orgId);
                        bdpfFile.setUserId(userId);
                        bdpfFile.setLastmodifiedDate(today);
                        bdpfFile.setStatus("update0");
                        bdpfFile.setAssetCode(assetCode[i]);
                        bdpfFile.setAssetName(assetName[i]);
                      //  bdpfFile.setSubAssetCode(subAssetCode[i]);
                        //bdpfFile.setSubAssetName(subAssetName[i]);

                        list.add(bdpfFile);
                    }
                  
                
                        
                    //      i++;
                          
                      
         //   }
             assetDAO.saveDocumentAttach(list);

            } catch (Exception e) {
                e.printStackTrace();
            }
       
        
        modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
        return new ModelAndView(new RedirectView("../assets/documentsTrackingList.htm"), modelMap);
    }

    //**************Property Details Submit******************//
    @RequestMapping("/assets/assetsDetailsFormSubmit.htm")
    public ModelAndView assetsDetailsFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");
        String assetCode = request.getParameter("assetCode");
        String areaCode = request.getParameter("areaCode");
        String assetName = request.getParameter("assetName");
        String assetBuilding = request.getParameter("assetBuilding");      
        String assetOwnerType[] = request.getParameterValues("assetOwnerType");      
        String assetType = request.getParameter("assetType");       
        String assetArea = request.getParameter("assetArea");
        String blockNo = request.getParameter("blockNo");
        String assetPlotNo = request.getParameter("assetPlotNo");
        String way = request.getParameter("way");
        String streetNo = request.getParameter("streetNo");
        String pinCode = request.getParameter("pinCode");
        String poBox = request.getParameter("poBox");
        String buildedArea = request.getParameter("buildedArea");      
        String wilayat = request.getParameter("wilayat");
        String city = request.getParameter("city");       
        String noOfFloors = request.getParameter("noOfFloors");
        String areaStatus = request.getParameter("areaStatus");
        
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());

        AssetDetails asset = null;
        
        if (assetCode == null || assetCode == "" || "".equals(assetCode)) {
            ArrayList validuser = (ArrayList) assetDAO.getAssetNo(assetName);
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
            assetCode = "PROPERTY" + "-" + ordno;
        }
        
        if (areaCode == null || areaCode == "" || "".equals(areaCode)) {
            ArrayList validuser1 = (ArrayList) assetDAO.getAreaCode(assetName);
            String orderNo2 = null;
            String orderNo8[] = null;
            int ordno1 = 1;
            if (!(validuser1.isEmpty())) {
                for (Iterator<String> iter = validuser1.iterator(); iter.hasNext();) {
                    orderNo2 = iter.next();
                }
                orderNo8 = orderNo2.split("-");
            }
            if (orderNo2 != null) {
                ordno1 = Integer.parseInt(orderNo8[1]) + 1;
            }
            areaCode = "Area" + "-" + ordno1;
        }
        if (pk == null || pk == "" || pk.equals("")) {
            
//              asset = new AssetDetails(null, null, null, null, null, null, null, null, null,
//                      assetBuilding, null, null, assetCode, assetName, assetOwnerType, null, assetType,
//                      null, null, null, null, null, null, null, 
//                      null, null, today, null, null, null, orgId, 
//                      null, null, null, null, null, "Update0", null, null, null, 
//                      userId, null, null, null);
              
              
                asset = new AssetDetails("" ,null, "", null, "", "", "","", assetArea, assetBuilding, 
                    "", "", assetCode, assetName, "", assetPlotNo, assetType, "", 
                    null, null, "", "", "", blockNo, buildedArea, "",
                    today, "", "", noOfFloors, orgId, "", "", pinCode, poBox, "",
                    "Update0", streetNo, "", "", userId, way, "", "",areaCode,"",wilayat,city);
              
                assetDAO.assetSave(asset);                 
                  
            int j=0,fileLengh1=0;
            fileLengh1 = assetOwnerType.length;           
            List<assetOwnerItem> list1 = new ArrayList<assetOwnerItem>();
            
            for (int i = 0; i < assetOwnerType.length; i++) {           
                if (fileLengh1 > 0) {

                    assetOwnerItem ai = new assetOwnerItem();
                    ai.setOrgId(orgId);
                    ai.setUserId(userId);
                    ai.setAssetCode(assetCode);
                    ai.setAssetOwnerType(assetOwnerType[i]);
                    System.out.println("owner:"+assetOwnerType[i]);
                    ai.setLastmodifiedDate(newdate);                
                    list1.add(ai);        
                }
                j++;         
            }
            
           assetDAO.saveAssetOwner(list1);           
          
            // saving document grid
            String documentName[] = request.getParameterValues("documentName");
            String documentType[] = request.getParameterValues("documentType");
            String documentDateOfUploadDate[] = request.getParameterValues("documentDateOfUploadDate");
            String documentExpirtyDate[] = request.getParameterValues("documentExpirtyDate");
            String documentCategory= request.getParameter("clientType");
//            String reminderDate[] = request.getParameterValues("reminderDate");
//            String reminderNote[] = request.getParameterValues("reminderNote");
            
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            List<MultipartFile> multipartFiles = multipartRequest.getFiles("attachments");

            final String dir = System.getProperty("user.dir");
            File f = new File(dir);
            String path = f.getParent();
            f = new File(path);

            try {
                int fileLength = 0;

                List<AssetAttach> list = new ArrayList<AssetAttach>();
                List<DocumentAttach> doclist = new ArrayList<DocumentAttach>();
                for(int k = 0; k < documentName.length; k++) {
                    Date documentDateOfUploadDate1 = null;
                    if (!"".equals(documentDateOfUploadDate[k]) && documentDateOfUploadDate[k] != null) {
                        documentDateOfUploadDate1 = (Date) formatter2.parse(documentDateOfUploadDate[k]);
                    }

                    Date documentExpirtyDate1 = null;
                    if (!"".equals(documentExpirtyDate[k]) && documentExpirtyDate[k] != null) {
                        documentExpirtyDate1 = (Date) formatter2.parse(documentExpirtyDate[k]);
                    }
                    
                            
//                    Date reminderDate1 = null;
//                    if (!"".equals(reminderDate[k]) && reminderDate[k] != null) {
//                        reminderDate1 = (Date) formatter2.parse(reminderDate[k]);
//                    }
                    
                    AssetAttach bdpfFile = new AssetAttach();
                    
                     DocumentAttach bdpfFile1 = new DocumentAttach();
                    
                    try {
                        MultipartFile test = (MultipartFile) multipartFiles.get(k);
                        fileLength = test.getBytes().length;
                        if(fileLength > 0) {
                            bdpfFile.setFilename(test.getOriginalFilename());
                            bdpfFile.setContent(test.getBytes());
                            bdpfFile.setContentType(test.getContentType());
                            
                            bdpfFile1.setFilename(test.getOriginalFilename());
                            bdpfFile1.setContent(test.getBytes());
                            bdpfFile1.setContentType(test.getContentType());
                        }
                    } catch(Exception ex) {
                        ex.printStackTrace();
                    }
                    
                    bdpfFile.setDocumentName(documentName[k]);
                    bdpfFile.setDocumentType(documentType[k]);
                    bdpfFile.setDocumentDateOfUploadDate(documentDateOfUploadDate1);
                    bdpfFile.setDocumentExpirtyDate(documentExpirtyDate1);
                    bdpfFile.setDocumentCategory(documentCategory);
                    bdpfFile.setOrgId(orgId);
                    bdpfFile.setUserId(userId);
                    bdpfFile.setLastmodifiedDate(today);
                    bdpfFile.setStatus("update0");
                    bdpfFile.setAssetCode(assetCode);

                        bdpfFile1.setDocumentName(documentName[k]);
                        bdpfFile1.setDocumentType(documentType[k]);
                        bdpfFile1.setDocumentDateOfUploadDate(documentDateOfUploadDate1);
                        bdpfFile1.setDocumentExpirtyDate(documentExpirtyDate1);
                        bdpfFile1.setDocumentCategory(documentCategory);
//                        bdpfFile1.setReminderNote(reminderNote[k]);
//                        bdpfFile1.setReminderDate(reminderDate1);
                   //     System.out.println("DocumentName:"+documentName[i]);
                        bdpfFile1.setOrgId(orgId);
                        bdpfFile1.setUserId(userId);
                        bdpfFile1.setLastmodifiedDate(today);
                        bdpfFile1.setStatus("update0");
                        bdpfFile1.setAssetCode(assetCode);
                        bdpfFile1.setAssetName(assetName);
                    
                    
                    list.add(bdpfFile);
                    
                    doclist.add(bdpfFile1);
                }
                assetDAO.saveAssetAttach(list);
                
                assetDAO.saveDocumentAttach(doclist);

            } catch (Exception e) {
                e.printStackTrace();
            }
            
        } else {
            
            asset = new AssetDetails(Integer.parseInt(pk), null, null, null, null, null, null, null, null,
                    assetArea, assetBuilding, null, null, assetCode, assetName, null, assetPlotNo,
                    assetType, null, null, null, null, null, null, blockNo, buildedArea,
                    null, today, null, null, noOfFloors, orgId, null, null,
                    pinCode, poBox, null, "Update0", streetNo, null, null, userId, way, null, null,areaCode,areaStatus,wilayat,city);
            
            assetDAO.assetSave(asset);
            if (assetOwnerType != null) {
            int j=0,fileLengh1=0;
            fileLengh1 = assetOwnerType.length;           
            List<assetOwnerItem> list1 = new ArrayList<assetOwnerItem>();
            
            for (int i = 0; i < assetOwnerType.length; i++) {           
                if (fileLengh1 > 0) {

                    assetOwnerItem ai = new assetOwnerItem();
                    ai.setSNo(Integer.parseInt(pk));
                    ai.setOrgId(orgId);
                    ai.setUserId(userId);
                    ai.setAssetCode(assetCode);
                    ai.setAssetOwnerType(assetOwnerType[j]);
                    System.out.println("owner:"+assetOwnerType[i]);
                    ai.setLastmodifiedDate(newdate);                
                    list1.add(ai);        
                }
                j++;         
            }
            
           assetDAO.saveAssetOwner(list1);  
            }
            String documentName[] = request.getParameterValues("documentName");
            String documentType[] = request.getParameterValues("documentType");
            String documentDateOfUploadDate[] = request.getParameterValues("documentDateOfUploadDate");
            String documentExpirtyDate[] = request.getParameterValues("documentExpirtyDate");

            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            List<MultipartFile> multipartFiles = multipartRequest.getFiles("attachments");

            final String dir = System.getProperty("user.dir");
            File f = new File(dir);
            String path = f.getParent();
            f = new File(path);

            try {
                int i = 0, fileLength = 0;

                List<AssetAttach> list = new ArrayList<AssetAttach>();
                for (Iterator<MultipartFile> iterator = multipartFiles.iterator(); iterator.hasNext();) {
                    
                    MultipartFile test = (MultipartFile) iterator.next();
                    fileLength = test.getBytes().length;

                    if (fileLength > 0) {
                        
                        
                         Date documentDateOfUploadDate1 = null;
                          if (!"".equals(documentDateOfUploadDate[i]) && documentDateOfUploadDate[i] != null) {
                          documentDateOfUploadDate1 = (Date) formatter2.parse(documentDateOfUploadDate[i]);
        }
                          
                          Date documentExpirtyDate1 = null;
        if (!"".equals(documentExpirtyDate[i]) && documentExpirtyDate[i] != null) {
            documentExpirtyDate1 = (Date) formatter2.parse(documentExpirtyDate[i]);
        }
                                            
                        AssetAttach bdpfFile = new AssetAttach();
                        bdpfFile.setFilename(test.getOriginalFilename());

                        bdpfFile.setContent(test.getBytes());
                        bdpfFile.setContentType(test.getContentType());
                        bdpfFile.setDocumentName(documentName[i]);
                        bdpfFile.setDocumentType(documentType[i]);
                        bdpfFile.setDocumentDateOfUploadDate(documentDateOfUploadDate1);
                        bdpfFile.setDocumentExpirtyDate(documentExpirtyDate1);
                        bdpfFile.setOrgId(orgId);
                        bdpfFile.setUserId(userId);
                        bdpfFile.setLastmodifiedDate(today);
                        bdpfFile.setStatus("update0");
                        bdpfFile.setAssetCode(assetCode);

                        list.add(bdpfFile);
                    }               
                        
                    i++;                  
                      
                }
                assetDAO.saveAssetAttach(list);

            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        modelMap.addAttribute("assetDetails", assetDAO.AssetDetailslist(null));
        return new ModelAndView(new RedirectView("../assets/assetsDetailsList.htm"), modelMap);
    }

    //**************Download Property Attachment******************//
    @RequestMapping("/assets/assetAttachDownload.htm")
    public void assetAttachDownload(HttpServletRequest req, HttpServletResponse res) throws FileNotFoundException, IOException {
        String sno = req.getParameter("SNo");
        AssetAttach doc = assetDAO.getAssetAttach(Integer.parseInt(sno));
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
//**************Floor Details List******************//

    @RequestMapping("/assets/subAssetsDetailsList.htm")
    public ModelAndView subAssetsDetailsList(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String status = request.getParameter("status");
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        String vacant = "Vacant";
        if (status == null || status == "" || status.equals("")) {
            status = "null";
        }
        if (fromDate != null && toDate != null) {
            if (fromDate.contains("frdate") && toDate.contains("todate")) {
                fromDate = null;
                toDate = null;
            }
        }
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Property Details", "Floor Details"));
        if (fromDate == null || toDate == null) {
            if (status.equals(vacant)) {
                map.addAttribute("subAssetDetails", assetDAO.subAssetVacateDetailslist(status));
            } else {
                map.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist(null));
            }
        } else {
            if (status.equals(vacant)) {
                map.addAttribute("subAssetDetails", assetDAO.subAssetVacateDetailslist1(status, fromDate, toDate));
            } else {
                map.addAttribute("subAssetDetails", assetDAO.subAssetVacateDetailslist1(null, fromDate, toDate));
            }
        }
        return new ModelAndView("../assets/subAssetsDetailsList", map);
    }
    
    @RequestMapping("/assets/propertyWiseSegmentList.htm")
    public ModelAndView propertyWiseSegmentList(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String status = request.getParameter("status");
        String fromDate = request.getParameter("fromDate");
        String assetName = request.getParameter("assetName");
      
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Property Segments", "Property Wise Segments"));
        
        if(assetName == null){
           map.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist(null)); 
           map.addAttribute("propertyWiseilst", assetDAO.propertyWiseilst(null));
        }
        
        if(assetName != null){
            map.addAttribute("subAssetDetails", assetDAO.subAssetDetailsUpdate(assetName)); 
             map.addAttribute("propertyWiseilst", assetDAO.propertyWiseilst(null));
        }
        
        
        map.addAttribute("propertyWiseilst", assetDAO.propertyWiseilst(null));
        
        
        return new ModelAndView("../assets/propertyWiseSegmentList", map);
    }

    @RequestMapping("/assets/subAssetsStatusDetailsList.htm")
    public ModelAndView subAssetsStatusDetailsList(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String status = request.getParameter("status");
        String propName = request.getParameter("propName");
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");

        String vacant = "Vacant";
        if (fromDate != null && toDate != null) {
            if (fromDate.contains("frdate") && toDate.contains("todate")) {
                fromDate = null;
                toDate = null;
            }
        }
        //String vacant = "Vacant";
//        if (status == null || status == "" || status.equals("")) {
//            status = "null";
//        }
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Property Details", "Floor Details"));
        if (propName != null && propName != "" && fromDate != "" && fromDate != null && toDate != "" && toDate != null) {
            if (status == null || status == "" || status.equals("")) {
                map.addAttribute("subAssetDetails", assetDAO.subAssetStatusDetailslist(null, propName, fromDate, toDate));
            } else {
                map.addAttribute("subAssetDetails", assetDAO.subAssetStatusDetailslist(status, propName, fromDate, toDate));

            }
        } else {
            if (status == null || status == "" || status.equals("")) {
                map.addAttribute("subAssetDetails", assetDAO.subAssetStatusDetailslist(null, propName, fromDate, toDate));
            } else {
                map.addAttribute("subAssetDetails", assetDAO.subAssetStatusDetailslist(status, propName, fromDate, toDate));

            }
        }
        return new ModelAndView("../assets/subAssetsDetailsList", map);
    }

//**************Floor Details Form******************//
    @RequestMapping("/assets/subAssetsDetailsForm.htm")
    public ModelAndView subAssetsDetailsForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        String subAssetCode = request.getParameter("subAssetCode");
        String assetCode = request.getParameter("assetCode");

        if (subAssetCode != null && !subAssetCode.isEmpty()) {
            modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(subAssetCode));
            modelMap.addAttribute("assetname", assetDAO.AssetName(assetCode));
            modelMap.addAttribute("assetDetails", assetDAO.selectAssetDetails());
        }
        String link = "../assets/subAssetsDetailsForm.htm";
        String tab = "Floor Details";

        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("flattypes", userDAO.tenantCategory());
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../assets/subAssetsDetailsForm", modelMap);
    }

//**************Floor Details Submit******************//
    @RequestMapping("/assets/subAssetsDetailsFormSubmit.htm")
    public ModelAndView subAssetsDetailsFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");
        String assetCode = request.getParameter("assetCode");
        String assetName = request.getParameter("assetName");
        String floor[] = request.getParameterValues("floor");
        String subAssetCode = request.getParameter("subAssetCode");
        String subAssetName[] = request.getParameterValues("subAssetName");
        String subAssetType[] = request.getParameterValues("subAssetType");
        String area[] = request.getParameterValues("area");
        String unitName[] = request.getParameterValues("unitName");
        String unitType[] = request.getParameterValues("unittype");
//        String parking[] = request.getParameterValues("parking");
//        String utilityNo1[] = request.getParameterValues("utilityNo1");
//        String utilityNo2[] = request.getParameterValues("utilityNo2");
        String valueOfSubAsset[] = request.getParameterValues("valueOfSubAsset");
        String minimumRentFixed[] = request.getParameterValues("minimumRentFixed");
        String actualRent[] = request.getParameterValues("actualRent");
        String remarks[] = request.getParameterValues("remarks");
        String recordStatus1 = request.getParameter("recordStatus1");

        String status = request.getParameter("status");
        String status1 = request.getParameter("status1");
        String attr1 = request.getParameter("attr1");
        String attr2 = request.getParameter("attr2");
        String attr3 = request.getParameter("attr3");
        String attr4 = request.getParameter("attr4");
        String attr5 = request.getParameter("attr5");
        String subAssetCode1 = null;
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());

        List<SubAssetDetails> gridData = new ArrayList<SubAssetDetails>();

        if (pk == null || pk == "" || pk.equals("")) {
            for (int i = 0; i < subAssetName.length; i++) {
                if (subAssetCode == null || subAssetCode == "" || "".equals(subAssetCode)) {
                    Integer LL = assetDAO.getSubAssetNo();
                    subAssetCode1 = "FLAT-" + (LL + 1);
                }
                //, parking[i], utilityNo1[i], utilityNo2[i]
                SubAssetDetails subAsset;
                subAsset = new SubAssetDetails(orgId, userId, assetCode, assetName, subAssetCode1, subAssetName[i], floor[i], 
                        subAssetType[i], area[i], valueOfSubAsset[i], minimumRentFixed[i], "0", remarks[i], "Active",
                        "null", "null", "null", "null", "null", today, "Vacant", "","",true);
//                    subAsset = new SubAssetDetails(orgId, userId, assetCode, assetName, subAssetCode1, subAssetName[i], floor[i], 
//                        subAssetType[i], area[i], valueOfSubAsset[i], minimumRentFixed[i], null, remarks[i], "Update0",
//                        "null", "null", "null", "null", "null", today, "Vacant",unitName[i],unitType[i]);
                gridData.add(subAsset);
                assetDAO.saveSubAssetDetails(gridData);         
            }
        } else {
            for (int i = 0; i < subAssetName.length; i++) {
                SubAssetDetails subAsset = new SubAssetDetails(Integer.parseInt(pk), orgId, userId, assetCode, 
                        assetName, subAssetCode, subAssetName[i], floor[i], subAssetType[i], area[i],  //subAssetType[i] 
                        valueOfSubAsset[i], minimumRentFixed[i], actualRent[i], remarks[i], "Active", "null", "null", "null", "null", "null", today, recordStatus1,"", "",true); //unitName[i],unitType[i]
                gridData.add(subAsset);
                assetDAO.saveSubAssetDetails(gridData);
            }

        }

        modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist(null));
        return new ModelAndView(new RedirectView("../assets/subAssetsDetailsList.htm"), modelMap);
    }

    @RequestMapping("/assets/flatDetailsList.htm")
    public ModelAndView flatDetailsList(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String status = request.getParameter("status");
        String vacant = "Vacant";
        if (status == null || status == "" || status.equals("")) {
            status = "null";
        }
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Property Details", "Flat/Unit Details"));
        //if (status.equals(vacant)) {
        map.addAttribute("flatRoomDetails", assetDAO.flatRoomDetailslist(status));
        //  } else {
        //  map.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist(null));
        //  }
        return new ModelAndView("../assets/flatDetailsList", map);
    }

    @RequestMapping("/assets/flatDetailsForm.htm")
    public ModelAndView flatDetailsForm(HttpServletRequest request, HttpServletResponse response) {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        String subAssetCode = request.getParameter("subAssetCode");
        String assetCode = request.getParameter("assetCode");

        if (subAssetCode != null && !subAssetCode.isEmpty()) {
            modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist1(subAssetCode));
            modelMap.addAttribute("assetname", assetDAO.AssetName(assetCode));
        }
        if (null != sno && !"".equals(sno)) {
            modelMap.addAttribute("flatRoomDetails", assetDAO.flatRoomDetails(Integer.parseInt(sno)));

        }
        String link = "../assets/subAssetsDetailsForm.htm";
        String tab = "Flat/Unit Details";

        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("flattypes", userDAO.tenantCategory());
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../assets/flatDetailsForm", modelMap);
    }

    @RequestMapping("/assets/flatDetailsFormSubmit.htm")
    public ModelAndView flatDetailsFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");
        String assetCode = request.getParameter("assetCode");
        String subAssetCode = request.getParameter("subAssetCode");
        String roomCode = request.getParameter("roomCode");
        String roomName[] = request.getParameterValues("roomName");
        String roomType[] = request.getParameterValues("roomType");
//        String parking[] = request.getParameterValues("parking");
//        String utilityNo1[] = request.getParameterValues("utilityNo1");
//        String utilityNo2[] = request.getParameterValues("utilityNo2");
        String minimumRentFixed[] = request.getParameterValues("minimumRentFixed");
        String actualRent[] = request.getParameterValues("actualRent");
        String remarks[] = request.getParameterValues("remarks");
        String recordStatus = request.getParameter("recordStatus");

        String status = request.getParameter("status");
        if (null == status || "".equals(status)) {
            status = "update0";
        }
        String roomCode1 = null;
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());

        List<FlatRoomDetails> gridData = new ArrayList<FlatRoomDetails>();

        if (pk == null || pk == "" || pk.equals("")) {
            for (int i = 0; i < roomName.length; i++) {
                if (roomCode == null || roomCode == "" || "".equals(roomCode)) {
                    Integer LL = assetDAO.getRoomCode();
                    roomCode1 = "UNIT-" + (LL + 1 + i);
                }
                //parking[i], utilityNo1[i], utilityNo2[i],
                FlatRoomDetails room = new FlatRoomDetails(orgId, userId, roomCode1, roomName[i], assetCode, subAssetCode, actualRent[i], minimumRentFixed[i], remarks[i], status, today, recordStatus);
                room.setRoomType(roomType[i]);
                gridData.add(room);
            }
        } else {
            for (int i = 0; i < roomName.length; i++) {
                FlatRoomDetails room = new FlatRoomDetails(Integer.parseInt(pk), orgId, userId, roomCode, roomName[i], assetCode, subAssetCode, actualRent[i], minimumRentFixed[i], remarks[i], status, today, recordStatus);
                room.setRoomType(roomType[i]);
                gridData.add(room);
            }

        }

        assetDAO.saveFlatRoomDetails(gridData);

        modelMap.addAttribute("subAssetDetails", assetDAO.subAssetDetailslist(null));
        return new ModelAndView(new RedirectView("../assets/flatDetailsList.htm"), modelMap);
    }
//**************Select Property Pop-up******************//

    @RequestMapping("/assets/selectAssetDetails.htm")
    public ModelAndView selectAssetDetails(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("assetDetails", assetDAO.selectAssetDetails());
        return new ModelAndView("selectAssetDetails", modelMap);
    }
    
    @RequestMapping("/assets/selectRentQuoteProprtyDetails.htm")
    public ModelAndView selectRentQuoteProprtyDetails(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        
        modelMap.addAttribute("assetDetails", assetDAO.subRentQuotetDetailslist(null));
        return new ModelAndView("selectRentQuoteProprtyDetails", modelMap);
    }
    
    @RequestMapping("/assets/selectAreaCode.htm")
    public ModelAndView selectAreaCode(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("assetDetails", assetDAO.selectAssetAreaDetails());
        return new ModelAndView("selectAreaCode", modelMap);
    }
    
    @RequestMapping("/assets/selectUnitNumbers.htm")
    public ModelAndView selectUnitNumbers(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
      //  modelMap.addAttribute("assetDetails", assetDAO.selectAssetAreaDetails());
        String assetCode = req.getParameter("assetCode");
        
        modelMap.addAttribute("subAssetDetails", assetDAO.selectUnitNumberslist(assetCode));
        return new ModelAndView("selectUnitNumbers", modelMap);
    }
    
    @RequestMapping("/assets/selectgmmUnitNumbers.htm")
    public ModelAndView selectgmmUnitNumbers(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
      //  modelMap.addAttribute("assetDetails", assetDAO.selectAssetAreaDetails());
        
        modelMap.addAttribute("subAssetDetails", assetDAO.selectUnitNumbersDetailslist(null));
        return new ModelAndView("selectgmmUnitNumbers", modelMap);
    }
    
    @RequestMapping("/assets/selectUtilityPropertyCode.htm")
    public ModelAndView selectUtilityPropertyCode(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("assetDetails", assetDAO.selectAssetDetails());
        return new ModelAndView("selectUtilityPropertyCode", modelMap);
    }

    @RequestMapping("/assets/selectStoreName.htm")
    public ModelAndView selectStoreName(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("storeName", assetDAO.selectStoreName());
        return new ModelAndView("selectStoreName", modelMap);
    }

    @RequestMapping("/assets/selectPropertyDetails.htm")
    public ModelAndView selectPropertyDetails(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("assetDetails", assetDAO.selectAssetDetails());
        return new ModelAndView("selectPropertyDetails", modelMap);
    }

    @RequestMapping("/assets/selectSubAssetDetails1.htm")
    public ModelAndView selectSubAssetDetails1(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String assetCode = req.getParameter("assetCode");
        modelMap.addAttribute("subAssetDetails", assetDAO.selectSubAssetDetails(assetCode));
        return new ModelAndView("selectSubAssetDetails1", modelMap);
    }

//**************Select Floor Pop-up******************//
    @RequestMapping("/assets/selectSubAssetDetails.htm")
    public ModelAndView selectSubAssetDetails(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String assetCode = req.getParameter("assetCode");
        modelMap.addAttribute("subAssetDetails", assetDAO.selectSubAssetDetails(assetCode));
        return new ModelAndView("selectSubAssetDetails", modelMap);
    }
//**************Select Property for Accessory Tagging Pop-up******************//

    @RequestMapping("/assets/selectAccAssetDetails.htm")
    public ModelAndView selectAccAssetDetails(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("assetDetails", assetDAO.selectAssetDetails());
        return new ModelAndView("selectAccAssetDetails", modelMap);
    }
//**************Accessory Tagging Details List******************//

    @RequestMapping("/assets/accessoriesDetailsList.htm")
    public ModelAndView accessoriesDetailsList(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Property Details", "Accessories Tagging"));
        map.addAttribute("accessoriesList", assetDAO.accessoriesDetailsList(null));
        return new ModelAndView("../assets/accessoriesDetailsList", map);
    }
//**************Accessory Tagging Details Form******************//

    @RequestMapping("/assets/accessoriesDetailsForm.htm")
    public ModelAndView accessoriesDetailsForm(HttpServletRequest request, HttpServletResponse response) {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        String subAssetCode = request.getParameter("subAssetCode");
        String assetCode = request.getParameter("assetCode");

        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("accessoryDetails3", assetDAO.AccessoryDetailslist(subAssetCode));
            modelMap.addAttribute("accessoryDetails", assetDAO.AccessoryDetailslist2(subAssetCode));
            modelMap.addAttribute("accessoryDetails1", assetDAO.AccessoryDetailslist3(subAssetCode));
            modelMap.addAttribute("accessoryDetails2", assetDAO.AccessoryDetailslist1(assetCode));
            modelMap.addAttribute("accessoryAttach", assetDAO.assetAttachView1(Integer.parseInt(sno), assetCode, subAssetCode));
        }
        String link = "../assets/accessoriesDetailsForm.htm";
        String tab = "Accessories Tagging";

        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../assets/accessoriesDetailsForm", modelMap);
    }
//**************Accessory Tagging Form Edit ******************//

    @RequestMapping("/assets/accessoriesDetailsFormEdit.htm")
    public ModelAndView accessoriesDetailsFormEdit(HttpServletRequest request, HttpServletResponse response) {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        String subAssetCode = request.getParameter("subAssetCode");
        String assetCode = request.getParameter("assetCode");

        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("accessoryDetails3", assetDAO.AccessoryDetailslist(subAssetCode));
            modelMap.addAttribute("accessoryDetails", assetDAO.AccessoryDetailslist2(subAssetCode));
            modelMap.addAttribute("accessoryDetails1", assetDAO.AccessoryDetailslist3(subAssetCode));
            modelMap.addAttribute("accessoryDetails2", assetDAO.AccessoryDetailslist1(assetCode));
            modelMap.addAttribute("accessoryAttach", assetDAO.assetAttachView1(Integer.parseInt(sno), assetCode, subAssetCode));
        }
        String link = "../assets/accessoriesDetailsForm.htm";
        String tab = "Accessories Tagging";

        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../assets/accessoriesDetailsFormEdit", modelMap);
    }
//**************Accessory Tagging Form SUbmit ******************//

    @RequestMapping("/assets/accessoriesDetailsFormSubmit.htm")
    public ModelAndView accessoriesDetailsFormSubmit(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        String pk = request.getParameter("pk");
        String sno = request.getParameter("sno");
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String assetCode = request.getParameter("assetCode1");
        String assetName = request.getParameter("assetName");
        String subAssetCode = request.getParameter("subAssetCode1");
        String subAssetName = request.getParameter("subAssetName");
        String accessoryCode[] = request.getParameterValues("accessoryCode1");
        String accessoryName[] = request.getParameterValues("accessoryName1");
        String accessoryCategory[] = request.getParameterValues("accessoryCategory1");
        String quantity[] = request.getParameterValues("quantity1");
        String accessoryCode2[] = request.getParameterValues("accessoryCode2");
        String accessoryName2[] = request.getParameterValues("accessoryName2");
        String accessoryCategory2[] = request.getParameterValues("accessoryCategory2");
        String status = request.getParameter("status");
        String remarks[] = request.getParameterValues("remarks1");
        String remarks2[] = request.getParameterValues("remarks2");
        String quantity2[] = request.getParameterValues("quantity2");
        String Filename = request.getParameter("Filename");
        String attachmentReference = request.getParameter("attachmentReference");
        String attchSNo = request.getParameter("attchSNo");
        String sSavesnoedu = request.getParameter("sSavesnoedu");
        String delfiles = request.getParameter("tobedel");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        List<AccessoriesTagging> gridData = new ArrayList<AccessoriesTagging>();
        List<SubAssetAttach> gridattach = new ArrayList<SubAssetAttach>();

        if (pk == null || pk == "" || pk.equals("")) {

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

                List<SubAssetAttach> list = new ArrayList<SubAssetAttach>();
                for (Iterator<MultipartFile> iterator = multipartFiles.iterator(); iterator.hasNext();) {
                    MultipartFile test = (MultipartFile) iterator.next();
                    fileLength = test.getBytes().length;

                    if (fileLength > 0) {
                        SubAssetAttach bdpfFile = new SubAssetAttach();
                        bdpfFile.setFilename(test.getOriginalFilename());

                        bdpfFile.setContent(test.getBytes());
                        bdpfFile.setContentType(test.getContentType());

                        bdpfFile.setOrgId(orgId);
                        bdpfFile.setUserId(userId);
                        bdpfFile.setLastmodifiedDate(today);
                        bdpfFile.setStatus("update0");
                        bdpfFile.setAssetCode(assetCode);
                        bdpfFile.setSubAssetCode(subAssetCode);

                        list.add(bdpfFile);
                    }
                    i++;
                }
                assetDAO.subAssetDocumentsSave(list);

            } catch (Exception e) {
                e.printStackTrace();
            }

            for (int i = 0; i < accessoryCode.length; i++) {
                AccessoriesTagging accessoryTag = new AccessoriesTagging(assetCode, assetName, subAssetCode, subAssetName, accessoryCode[i], accessoryName[i], accessoryCategory[i], today, "update0", today, orgId, userId, remarks[i], quantity[i]);
                gridData.add(accessoryTag);
                assetDAO.saveAccessoryDetails(gridData);
            }
            //assetDAO.docSave(gridattach);
        } else {
            //            for attachment
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

                List<SubAssetAttach> list = new ArrayList<SubAssetAttach>();
                for (Iterator<MultipartFile> iterator = multipartFiles.iterator(); iterator.hasNext();) {
                    MultipartFile test = (MultipartFile) iterator.next();
                    fileLength = test.getBytes().length;

                    if (fileLength > 0) {
                        SubAssetAttach bdpfFile = new SubAssetAttach();
                        bdpfFile.setFilename(test.getOriginalFilename());

                        bdpfFile.setContent(test.getBytes());
                        bdpfFile.setContentType(test.getContentType());

                        bdpfFile.setOrgId(orgId);
                        bdpfFile.setUserId(userId);
                        bdpfFile.setLastmodifiedDate(today);
                        bdpfFile.setStatus("update0");
                        bdpfFile.setAssetCode(assetCode);
                        bdpfFile.setSubAssetCode(subAssetCode);

                        list.add(bdpfFile);
                    }
                    i++;
                }
                assetDAO.subAssetDocumentsSave(list);

            } catch (Exception e) {
                e.printStackTrace();
            }

            if (!delfiles.equals("")) {
                String[] totalfiles = delfiles.split(",");
                for (int k = 0; k < totalfiles.length; k++) {

                    SubAssetAttach doc = assetDAO.getattchs1(Integer.parseInt(totalfiles[k]));
                    //assetsDAO1.delete(doc.getAttachName(), doc.getAssetAttach());

                    assetDAO.delattachfiles1("SubAssetAttach", "SNo", Integer.parseInt(totalfiles[k]));
                }
            }
            //System.out.println(sSavesnoedu.trim().length());
            if (sSavesnoedu.trim().length() != 0) {
                String out[] = sSavesnoedu.split("//");
                for (int j = 0; j < out.length; j++) {
                    assetDAO.accessoryGridDataDelete(Integer.parseInt(out[j]));
                }
            }

            for (int i = 0; i < accessoryCode.length; i++) {
                AccessoriesTagging accessoryTag = new AccessoriesTagging(Integer.parseInt(pk), assetCode, assetName, subAssetCode, subAssetName, accessoryCode[i], accessoryName[i], accessoryCategory[i], today, "update0", today, orgId, userId, remarks[i], quantity[i]);
                gridData.add(accessoryTag);
                assetDAO.saveAccessoryDetails(gridData);
            }
            if (accessoryCode2 != null) {
                for (int i = 0; i < accessoryCode2.length; i++) {
                    AccessoriesTagging accessoryTag = new AccessoriesTagging(assetCode, assetName, subAssetCode, subAssetName, accessoryCode2[i], accessoryName2[i], accessoryCategory2[i], today, "update0", today, orgId, userId, remarks2[i], quantity2[i]);
                    gridData.add(accessoryTag);
                    assetDAO.saveAccessoryDetails(gridData);
                }
            }
            //assetDAO.docSave(gridattach);

        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("accessoriesList", assetDAO.accessoriesDetailsList(null));
        return new ModelAndView(new RedirectView("../assets/accessoriesDetailsList.htm"), modelMap);
    }
//**************Download Floor Details Attachment from Accessory Tagging******************//

    @RequestMapping("/assets/subAssetAttachDownload.htm")
    public void subAssetAttachDownload(HttpServletRequest req, HttpServletResponse res) throws FileNotFoundException, IOException {
        String sno = req.getParameter("SNo");
        SubAssetAttach doc = assetDAO.getSubAssetAttach(Integer.parseInt(sno));
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
//**************Select Floor Details Attachment from Accessory Tagging******************//

    @RequestMapping("/assets/subAssetsDocumentsForm.htm")
    public ModelAndView subAssetsDocumentsForm(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String subAssetCode = request.getParameter("subAssetCode");
        String action = request.getParameter("action");
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("fileSize", userDAO.fileSize());
        modelMap.addAttribute("subAssetDocuments", assetDAO.subAssetDocuments(subAssetCode));
        modelMap.addAttribute("action", action);
        return new ModelAndView("../assets/subAssetsDocumentsForm", modelMap);

    }

    //**************Select Accessories******************//
    @RequestMapping("/assets/selectAccessoryDetails.htm")
    public ModelAndView selectAccessoryDetails(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        modelMap.addAttribute("accDetails", assetDAO.selectAccessoryDetails());
        return new ModelAndView("selectAccessoryDetails", modelMap);
    }
//**************Select Property Details Attachment******************//

    @RequestMapping("/assets/assetsDocumentsForm.htm")
    public ModelAndView assetsDocumentsForm(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String assetCode = request.getParameter("assetCode");
        String action = request.getParameter("action");
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("fileSize", userDAO.fileSize());
        modelMap.addAttribute("assetDocuments", assetDAO.assetDocuments(assetCode));
        modelMap.addAttribute("action", action);
        return new ModelAndView("../assets/assetsDocumentsForm", modelMap);

    }
//**************Checking Duplicate of Accessories******************//

    @RequestMapping("/assets/accessories.htm")
    public void accessories(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {

        HttpSession session = req.getSession(true);
        res.setContentType("text/html;charset=UTF-8");
        String accessoryCode = req.getParameter("accessoryCode");
        String subAssetCode = req.getParameter("subAssetCode");
        assetDAO.accessoriesCheckn(req, res, accessoryCode, subAssetCode);
        System.out.print(res);
    }
//**************Checking Duplicate of Floor Name******************//

    @RequestMapping("/assets/subAssetType.htm")
    public void subAssetType(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {

        HttpSession session = req.getSession(true);
        res.setContentType("text/html;charset=UTF-8");
        String subAssetName = req.getParameter("subAssetName");
        String assetCode = req.getParameter("assetCode");
        assetDAO.subAssetNameCheckn(req, res, subAssetName, assetCode);
        System.out.print(res);
    }

//**************For MIn rent Generation******************//
    @RequestMapping("/assets/minimumRentGen.htm")
    public void minimumRentGen(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        HttpSession session = req.getSession(true);
        res.setContentType("text/html;charset=UTF-8");
        String assetCode = req.getParameter("assetCode");
        assetDAO.minRentGen(req, res, assetCode);
    }
    
    
    @RequestMapping("/assets/utlitiesTaggingList.htm")
    public ModelAndView utlitiesTaggingList(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String status = request.getParameter("status");
        String propName = request.getParameter("propName");
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");

       
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Property Segment", "Property Segment"));
        map.addAttribute("utlitiesTaggingList", assetDAO.utlitiesTaggingList(null,userId, null));
        
        return new ModelAndView("../assets/utlitiesTaggingList", map);
    }

//**************Floor Details Form******************//
    @RequestMapping("/assets/utlitiesTaggingForm.htm")
    public ModelAndView utlitiesTaggingForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        String subAssetCode = request.getParameter("subAssetCode");
        String assetCode = request.getParameter("assetCode");
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        

       
//        String link = "../assets/subAssetsDetailsForm.htm";
//        String tab = "Floor Details";
//
//        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
//        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
//        modelMap.addAttribute("flattypes", userDAO.tenantCategory());

        if (sno != null && !sno.isEmpty()) {

        modelMap.addAttribute("utlitiesTaggingList", assetDAO.utlitiesTaggingList(assetCode,userId,sno));
        }

        modelMap.addAttribute("subAssetDetails", assetDAO.selectUnitNumberslist(assetCode));
        modelMap.addAttribute("utilityDetails", userDAO.utility());
        modelMap.addAttribute("comUtilityDetails", userDAO.comUtility());
    
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../assets/utlitiesTaggingForm", modelMap);
    }
    
    @RequestMapping("/assets/documentsTrackingList.htm")
    public ModelAndView documentsTrackingList(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String status = request.getParameter("status");
        String propName = request.getParameter("propName");
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");

        
       
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Documents Tracking", "Documents Tracking"));
        
        map.addAttribute("documentAttach", assetDAO.documentAttachView(null, userId));
        
        return new ModelAndView("../assets/documentsTrackingList", map);
    }
    
    @RequestMapping("/assets/documentsTrackingForm.htm")
    public ModelAndView documentsTrackingForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String subAssetCode = request.getParameter("subAssetCode");
        String assetCode = request.getParameter("assetCode");

       
//        String link = "../assets/subAssetsDetailsForm.htm";
//        String tab = "Floor Details";
//
//        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
//        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
//        modelMap.addAttribute("flattypes", userDAO.tenantCategory());
        if(sno != null) {
            
            modelMap.addAttribute("documentAttach", assetDAO.documentAttachView(sno, assetCode));
            
//            List<DocumentAttach> ll = assetDAO.documentAttachView(null, userId);
//            System.out.println("document type "+ll.get(0).getDocumentType());
//            modelMap.addAttribute("documentAttach", ll);
        }
        
        modelMap.addAttribute("documentType",masterDAO.DocumentTypeDescriptionList());
        modelMap.addAttribute("assetDetails",masterDAO.fetchDocuments());
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../assets/documentsTrackingForm", modelMap);
    }
    
    @RequestMapping("/assets/buildingHistoryManagementList.htm")
    public ModelAndView buildingHistoryManagementList(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String status = request.getParameter("status");
        String propName = request.getParameter("propName");
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");

       
        map.addAttribute("permission", tenantDetailsDAO.permmenu(orgId, roleName, "Building History Management", "Building History Management"));
        
        map.addAttribute("buildingHistorylist",assetDAO.buildingHistorylist(null));
        
        return new ModelAndView("../assets/buildingHistoryManagementList", map);
    }
    
    @RequestMapping("/assets/buildingHistoryManagementForm.htm")
    public ModelAndView buildingHistoryManagementForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
       
  
        
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        String subAssetCode = request.getParameter("subAssetCode");
        String assetCode = request.getParameter("assetCode");
        String action = request.getParameter("action");
        if(sno !=null){
        
         modelMap.addAttribute("buildingHistorylist",assetDAO.buildingHistorylist(sno));
         modelMap.addAttribute("BuildingHistoryManagementGridId", assetDAO.BuildingHistoryManagementGridId(sno, assetCode));
          modelMap.addAttribute("action", action);
         
        }
       
//        String link = "../assets/subAssetsDetailsForm.htm";
//        String tab = "Floor Details";
//
//        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
//        modelMap.addAttribute("Dropdown", userDAO.formDrodownMapping(link, tab));
//        modelMap.addAttribute("flattypes", userDAO.tenantCategory());
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../assets/buildingHistoryManagementForm", modelMap);
    }
    
   @RequestMapping("/assets/areaManagementList.htm")
    public ModelAndView areaManagementList(HttpServletRequest request, HttpServletResponse response) {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
       
        map.addAttribute("AreaManagementlist", assetDAO.AreaManagementlist(null));
        
        
        
        return new ModelAndView("../assets/areaManagementList", map);
    }
    
    @RequestMapping("/assets/areaManagementForm.htm")
    public ModelAndView areaManagementForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String roleName = session.getAttribute("userRole").toString();
        
        String sno = request.getParameter("SNo");
        String assetCode = request.getParameter("assetCode");
        String areaCode = request.getParameter("areaCode");
        
         if (sno != null && !sno.isEmpty()) {
     
        map.addAttribute("AreaManagementlist", assetDAO.AreaManagementlist(sno));
        map.addAttribute("areaManagementId", assetDAO.areaManagementId(userId, assetCode));
         }
         
//          if (areaCode != null && !areaCode.isEmpty()) {
//     
//        map.addAttribute("AreaManagementlist", assetDAO.AreaCodelist(areaCode));
//        
//         }
        
        map.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../assets/areaManagementForm", map);
    }
    
     @RequestMapping("/assets/utlitiesTaggingFormSubmit.htm")
    public ModelAndView utlitiesTaggingFormSubmit(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        String pk = request.getParameter("pk");
        String sno = request.getParameter("pk");
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String assetCode = request.getParameter("assetCode");
        String assetName = request.getParameter("assetName");
        String utilityCategory[] = request.getParameterValues("utilityCategory");
        String unitName = request.getParameter("unitName");
        
        String utilityCode[] = request.getParameterValues("utilityCode");
        String utility[] = request.getParameterValues("utility");
        String comUtility[] = request.getParameterValues("comUtility");
        String comUtilityCode[] = request.getParameterValues("comUtilityCode");
        
        String unitsNumbers[] = request.getParameterValues("unitsNumbers");
        String utiltyNumbers[] = request.getParameterValues("utiltyNumbers");
        
        List<AssetUtilityDetails> gridData1 = new ArrayList<AssetUtilityDetails>();
        
        AssetUtilityDetails asset1 = null;
                
//                public AssetUtilityDetails(String assetCode,String assetName,String status,String utilityCategory,String utilityCode,String utility,
//                        String unitNumbers,String utilityNumbers,Date lastmodifiedDate) {
                for (int i = 0; i < utility.length; i++) {
             
                if (sno == null || sno.equals("")){
         
             if(unitsNumbers[i] == null){
                 unitsNumbers[i] ="";
             }
             
             
                asset1 = new AssetUtilityDetails(assetCode, assetName, "Update0",utilityCategory[i],utilityCode[i],utility[i], unitsNumbers[i],utiltyNumbers[i],sqlTimestamp);

                gridData1.add(asset1);
              assetDAO.assetSave(gridData1);

            }
                else{
                    asset1 = new AssetUtilityDetails(Integer.parseInt(sno), assetCode, assetName, "Update0", utilityCategory[i], utilityCode[i],utility[i], unitsNumbers[i],utiltyNumbers[i],sqlTimestamp);
                    
                    gridData1.add(asset1);
              assetDAO.assetSave(gridData1);
                    }
        
                }
        
        
        return new ModelAndView(new RedirectView("../assets/utlitiesTaggingList.htm"), map);
        
    }
    @RequestMapping("/assets/utilityDetailsDel.htm") 
    public ModelAndView utilityDetailsDel(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String SNo = request.getParameter("SNo");
          String status = request.getParameter("status");
        assetDAO.utilityDetailsDel(SNo, status);
       return new ModelAndView(new RedirectView("utlitiesTaggingList.htm"), modelMap);
    }
    
    @RequestMapping("/assets/fetchRentalUtilityName.htm")
    public void fetchRentalUtilityName(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String utilityCode= req.getParameter("utilityCode");
        
        String utilityCategory= req.getParameter("utilityCategory");

        assetDAO.fetchRentalUtilityName(req, res, utilityCode,utilityCategory);
    }
    
    @RequestMapping("/assets/fetchComUtilityName.htm")
    public void fetchComUtilityName(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();

        String comUtility= req.getParameter("comUtility");

        assetDAO.fetchComUtilityName(req, res, comUtility);
    }
    
    @RequestMapping("/assets/buildingFormSubmit.htm")
    public ModelAndView buildingFormSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, Exception {
        HttpSession session = request.getSession();
        ModelMap modelMap = new ModelMap();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk = request.getParameter("pk");
       
        
        String ccname = request.getParameter("ccname");
        String bcDate = request.getParameter("bcDate");
       
        String LifeSpanOfBld = request.getParameter("lifeSpanOfBld");
        String NextRevDate = request.getParameter("nextRevDate");

       
        String sname[] = request.getParameterValues("sname");
        String scontact[] = request.getParameterValues("scontact");
        String semail[] = request.getParameterValues("semail");
      
        String saddress[] = request.getParameterValues("saddress");
        
        String assetCode = request.getParameter("assetCode");
         String assetName = request.getParameter("assetName");
         
          Date p3Date = null;
        Date p4Date = null;
        if (!"".equals(bcDate) && bcDate != null) {
            p3Date = (Date) formatter2.parse(bcDate);
        }
        ///newly added by lakshmi///
        if (!"".equals(NextRevDate) && NextRevDate != null) {
            p4Date = (Date) formatter2.parse(NextRevDate);
        }
       
        
        List<BuildingHistoryManagement> gridData = new ArrayList<BuildingHistoryManagement>();
        try {
                if (pk == null || pk.equals("")){
            
                    BuildingHistoryManagement bhm = new BuildingHistoryManagement(orgId, userId, assetCode, assetName, ccname, p3Date, LifeSpanOfBld, p4Date, "",
                    "", "", "", "Active", sqlTimestamp);        
//            public BuildingHistoryManagement(String orgId, String userId, String assetCode, String assetName, String ccname, Date bcDate,
//            String lifeSpanOfBld, Date nextRevDate, String sname, String scontact, String semail, String saddress, String status,
//            Date lastmodifiedDate)
            assetDAO.buildingSave(gridData);
            assetDAO.asseBuildingSave(bhm);
            try {
                if(sname != null) {
                              for (int i = 0; i < sname.length; i++) {
                                BuildingHistoryManagementGrid bg = new BuildingHistoryManagementGrid(orgId, userId, assetCode, sname[i], scontact[i], semail[i], saddress[i], Boolean.TRUE, newdate);
                                assetDAO.newBuildingHistoryManagementGridListSave(bg);
                            }
                        }
                } catch(Exception ex) {
                      ex.printStackTrace();
                  }
        }else{
            
           BuildingHistoryManagement bhm =null;
            
//            public BuildingHistoryManagement(String orgId, String userId, String assetCode, String assetName, String ccname, Date bcDate,
//            String lifeSpanOfBld, Date nextRevDate, String sname, String scontact, String semail, String saddress, String status,
//            Date lastmodifiedDate)
            
            bhm= new BuildingHistoryManagement(Integer.parseInt(pk),orgId, userId, assetCode, assetName, ccname, p3Date, LifeSpanOfBld, p4Date, "",
                    "", "", "", "Active", sqlTimestamp);
           
            assetDAO.asseBuildingSave(bhm);  
            try {
                if(sname != null) {
                              for (int i = 0; i < sname.length; i++) {
                                BuildingHistoryManagementGrid bg = new BuildingHistoryManagementGrid(Integer.parseInt(pk),orgId, userId, assetCode, sname[i], scontact[i], semail[i], saddress[i], Boolean.TRUE, newdate);
                                assetDAO.newBuildingHistoryManagementGridListSave(bg);
                            }
                        }
                } catch(Exception ex) {
                      ex.printStackTrace();
                  }
            
        }
        }catch(Exception e)
        {
            
        }
        
         return new ModelAndView(new RedirectView("../assets/buildingHistoryManagementList.htm"), modelMap);
     
        
    }
    
    @RequestMapping("/assets/updateSubAssetDetailStatus.htm")
    public ModelAndView updateSubAssetDetailStatus(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String SNo = request.getParameter("SNo");
          String status = request.getParameter("status");
        assetDAO.updateSubAssetDetailStatus(SNo, status);
        return new ModelAndView(new RedirectView("subAssetsDetailsList.htm"), modelMap);
    }
    
}



