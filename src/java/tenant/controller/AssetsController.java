/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.controller;

import com.google.gson.Gson;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
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
import org.springframework.web.servlet.view.RedirectView;
import tenant.classes.DepreciationRecords;
import tenant.classes.RevaluationAttach;
import tenant.classes.RevaluationOfAsset;
import tenant.classes.SplitAsset;
import tenant.classes.SplitAssetAttachment;
import tenant.classes.UserRegistration;
import tenant.dao.AssetsDAO;
import tenant.dao.MasterDAO;
import tenant.dao.PurchaseDetailsDAO;
import tenant.dao.UserDAO;

/**
 *
 * @author ebs-sdd22
 */
public class AssetsController {

    @Autowired
    private AssetsDAO assetsDAO1;
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private MasterDAO masterDAO;
    @Autowired
    private PurchaseDetailsDAO purchaseDAO;

    Calendar now = Calendar.getInstance();
    String mod_date = now.get(Calendar.YEAR) + "/" + (now.get(Calendar.MONTH) + 1) + "/" + now.get(Calendar.DATE);
    Date date = new Date(mod_date);
    DateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
    DateFormat formatter01 = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
    /*   
     
     Controller for the Asset records and List.  
     
     */

    //================= To Fetch Depreciation Details ========================
    @RequestMapping("/assetsm/depreciationList.htm")
    public ModelAndView depreciationList(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("depreciationList", assetsDAO1.depreciationList());
        return new ModelAndView("../assets/depreciationList1", modelMap);
    }

    //unique property search method
    @RequestMapping("/assetsm/propAvailabilty.htm")
    public void propAvailabilty(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException, ParseException {
        res.setContentType("text/html;charset=UTF-8");
        String assetCode = req.getParameter("assetCode");
        String subAssetCode = req.getParameter("subAssetCode");
        String accessoryCode = req.getParameter("accessoryCode");
        assetsDAO1.selectProperty(req, res, assetCode, subAssetCode, accessoryCode);
    }

    //=================  Depreciation Form ========================
    @RequestMapping("/assetsm/depreciationForm.htm")
    public ModelAndView depreciationForm(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String link = "../assets/depreciationForm.htm";
        String tab = "Depreciation";
        String sno = request.getParameter("pk");
        String depreCode = request.getParameter("depreCode");
        String assetCode = "";
        String subAssetCode = "";
        String accessoriesCode = "";
        ArrayList list1 = (ArrayList) assetsDAO1.depreciationList();
        modelMap.addAttribute("depreciationList", assetsDAO1.depreciationList()); // for intially

        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("depreciation_dropdown_category", userDAO.formDrodownMapping(link, tab));
            modelMap.addAttribute("depreciation_category", masterDAO.contraCategoryForm(link, tab));
            modelMap.addAttribute("depreciationlist", assetsDAO1.depreciationListView(depreCode));
            modelMap.addAttribute("depreciationRecord", assetsDAO1.depreciationListViewUnique(depreCode));
            modelMap.addAttribute("depreciationlistAssetName", assetsDAO1.depreciationAssetNameList(assetCode));
            modelMap.addAttribute("depreciationlistSubAssetName", assetsDAO1.depreciationListSubAssetView(subAssetCode));
            modelMap.addAttribute("depreciationlistAccessoriesName", assetsDAO1.depreciationListAccessoriesView(accessoriesCode));
        }
        modelMap.addAttribute("depreciation_dropdown_category", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("depreciation_category", masterDAO.contraCategoryForm(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../assets/depreciationForm", modelMap);
    }

    //=================  Depreciation Form Submit========================
    @RequestMapping("/assetsm/depreciationFormSubmit.htm")
    public ModelAndView depreciationFormSubmit(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        String checkType = request.getParameter("assetType");
        if ("Accessories".equals(checkType)) {
            String[] assetName = request.getParameterValues("assetName1");
            String[] purchaseVoucherNo = request.getParameterValues("purchaseVoucherNo1");
            String[] purchaseDate = request.getParameterValues("purchaseDate1");
            String[] periodStart = request.getParameterValues("periodStart1");
            String[] periodEnd = request.getParameterValues("periodEnd1");
            String[] dipreciatedAmount = request.getParameterValues("dipreciatedAmount1");
            String[] valueOfAsset = request.getParameterValues("valueOfAsset1");
            String[] cumulativeAmount = request.getParameterValues("cumulativeAmountG");
            String[] assetType = request.getParameterValues("assetType1");
            String[] depreciationPercent = request.getParameterValues("depreciationPercent1");
            String depreCode = request.getParameter("depreCode1");
            String assetCode = request.getParameter("assetCode1");
            String[] accessoriesCode = request.getParameterValues("accessoriesCode1");
            String[] subAssetCode = request.getParameterValues("subAssetCode1");
            String[] accessoryName = request.getParameterValues("accessoriesName1");
            String[] subAssetName = request.getParameterValues("subAssetName1");
            String[] period = request.getParameterValues("timePeriod1");
            String[] NBV = request.getParameterValues("NBVAmount1");
            String[] poNo = request.getParameterValues("poName1");
            String[] sno = request.getParameterValues("sno1");
            String[] noOfDays = request.getParameterValues("noOfDays1");
            String[] dipreciationFirstDate = request.getParameterValues("dipreciationFirstDate1");
            String status = "update0";
            Date today_date = new Date();
            String[] created_user_dateTime = request.getParameterValues("created_user_dateTime1");
            Timestamp today_date_and_time_updated_user = new Timestamp(today_date.getTime());
            Timestamp today_date_and_time_created_user = new Timestamp(today_date.getTime());
            Timestamp creation_date = new Timestamp(today_date.getTime());

            Date periodStart1 = null;
            Date periodEnd1 = null;
            Date dipreciationFirstDate1 = null;
            Date purchaseDate1 = null;
            String orderNo2 = null;
            String orderNo1[] = null;
            int ordno = 1;

            if (depreCode == null || "".equals(depreCode)) {
                ArrayList validUser = (ArrayList) assetsDAO1.assetCodeListByAssetCode(depreCode);

                if (!(validUser.isEmpty())) {
                    for (Iterator<DepreciationRecords> iter = validUser.iterator(); iter.hasNext();) {
                        orderNo2 = iter.next().getDepreCode();
                    }

                    orderNo1 = orderNo2.split("-");

                    if (orderNo2 != null) {
                        ordno = Integer.parseInt(orderNo1[1]);
                        depreCode = "DEPRCODE" + "-" + ordno;
                    }

                }
                if (orderNo2 != null) {
                    ordno = Integer.parseInt(orderNo1[1]) + 1;
                    depreCode = "DEPRCODE" + "-" + ordno;
                } else {
                    depreCode = "DEPRCODE" + "-" + 1;
                }
            }

            for (int i = 0; i < assetName.length; i++) {

                if (sno[i] == null || "".equals(sno[i]) || sno[i].isEmpty()) {

                    periodStart1 = formatter.parse(periodStart[i]);
                    periodEnd1 = formatter.parse(periodEnd[i]);
                    if (dipreciationFirstDate[i] == null || "".equals(dipreciationFirstDate[i])) {
                        dipreciationFirstDate1 = formatter.parse(periodStart[i]);
                    } else {
                        dipreciationFirstDate1 = formatter.parse(dipreciationFirstDate[i]);
                    }

                    if (!("".equals(purchaseDate[i]) || purchaseDate[i] == null)) {
                        purchaseDate1 = formatter.parse(purchaseDate[i]);
                    }

                    DepreciationRecords depreciationRecords = new DepreciationRecords(depreCode, assetType[i], assetName[i], valueOfAsset[i], periodStart1, status, creation_date, today_date_and_time_updated_user, subAssetCode[i], subAssetName[i], accessoriesCode[i], accessoryName[i], assetCode, period[i], NBV[i], cumulativeAmount[i], dipreciatedAmount[i], purchaseVoucherNo[i], purchaseDate1, periodEnd1, dipreciationFirstDate1, depreciationPercent[i], poNo[i], noOfDays[i]);
                    assetsDAO1.saveOrUpdate(depreciationRecords);
                } else {
                    if (!"".equals(created_user_dateTime[i])) {
                        Date parseDate = formatter.parse(created_user_dateTime[i]);
                        today_date_and_time_created_user = new Timestamp(parseDate.getTime());
                    }

                    if (!"".equals(purchaseDate[i])) {
                        purchaseDate1 = formatter.parse(purchaseDate[i]);
                    }
                    periodStart1 = formatter.parse(periodStart[i]);
                    periodEnd1 = formatter.parse(periodEnd[i]);
                    dipreciationFirstDate1 = formatter.parse(dipreciationFirstDate[i]);
                    DepreciationRecords depreciationRecords = new DepreciationRecords(Integer.parseInt(sno[i]), depreCode, assetType[i], assetName[i], valueOfAsset[i], periodStart1, status, today_date_and_time_created_user, today_date_and_time_updated_user, subAssetCode[i], subAssetName[i], accessoriesCode[i], accessoryName[i], assetCode, period[i], NBV[i], cumulativeAmount[i], dipreciatedAmount[i], purchaseVoucherNo[i], purchaseDate1, periodEnd1, dipreciationFirstDate1, depreciationPercent[i], poNo[i], noOfDays[i]);
                    assetsDAO1.saveOrUpdate(depreciationRecords);
                }

            }

        } else {
            String assetName = request.getParameter("assetName");
            String purchaseVoucherNo = request.getParameter("purchaseVoucherNo");
            String purchaseDate = request.getParameter("purchaseDate");
            String periodStart = request.getParameter("periodStart");
            String periodEnd = request.getParameter("periodEnd");
            String dipreciatedAmount = request.getParameter("dipreciatedAmount");
            String valueOfAsset = request.getParameter("valueOfAsset");
            String cumulativeAmount = request.getParameter("cumulativeAmount");
            String assetType = request.getParameter("assetType");
            String depreciationPercent = request.getParameter("depreciationPercent");
            String assetCode = request.getParameter("assetCode");
            String accessoriesCode = request.getParameter("accessoryCode");
            String subAssetCode = request.getParameter("subAssetCode");
            String accessoryName = request.getParameter("accessoriesName");
            String subAssetName = request.getParameter("subAssetName");
            String period = request.getParameter("timePeriod");
            String NBV = request.getParameter("NBVAmount");
            String poNo = request.getParameter("poName");
            String noOfDays = request.getParameter("noOfDays");
            String dipreciationFirstDate = request.getParameter("dipreciationFirstDate");

            String sno = request.getParameter("pk");

            String status = "update0";
            Date today_date = new Date();
            String created_user_dateTime = request.getParameter("created_user_dateTime");
            Timestamp today_date_and_time_updated_user = new Timestamp(today_date.getTime());
            Timestamp today_date_and_time_created_user = new Timestamp(today_date.getTime());

            Date periodStart1 = null;
            Date periodEnd1 = null;
            Date dipreciationFirstDate1 = null;
            Date purchaseDate1 = null;
            String orderNo2 = null;
            String orderNo1[] = null;
            String depreCode = null;
            int ordno = 1;
            ArrayList validUser = (ArrayList) assetsDAO1.assetCodeList(sno);

            if (!(validUser.isEmpty())) {
                for (Iterator<DepreciationRecords> iter = validUser.iterator(); iter.hasNext();) {
                    orderNo2 = iter.next().getDepreCode();
                }

                orderNo1 = orderNo2.split("-");

                if (orderNo2 != null) {
                    ordno = Integer.parseInt(orderNo1[1]);
                    depreCode = "DEPRCODE" + "-" + ordno;
                }

            }
            if (sno == null || sno.equals("")) {
                if (orderNo2 != null) {
                    ordno = Integer.parseInt(orderNo1[1]) + 1;
                    depreCode = "DEPRCODE" + "-" + ordno;
                } else {
                    depreCode = "DEPRCODE" + "-" + 1;
                }
                periodStart1 = formatter.parse(periodStart);
                periodEnd1 = formatter.parse(periodEnd);
                if (dipreciationFirstDate == null || "".equals(dipreciationFirstDate)) {
                    dipreciationFirstDate1 = formatter.parse(periodStart);
                } else {
                    dipreciationFirstDate1 = formatter.parse(dipreciationFirstDate);
                }
                if (!"".equals(purchaseDate)) {
                    purchaseDate1 = formatter.parse(purchaseDate);
                }

                DepreciationRecords depreciationRecords = new DepreciationRecords(depreCode, assetType, assetName, valueOfAsset, periodStart1, status, today_date_and_time_created_user, today_date_and_time_updated_user, subAssetCode, subAssetName, accessoriesCode, accessoryName, assetCode, period, NBV, cumulativeAmount, dipreciatedAmount, purchaseVoucherNo, purchaseDate1, periodEnd1, dipreciationFirstDate1, depreciationPercent, poNo, noOfDays);
                assetsDAO1.saveOrUpdate(depreciationRecords);

            } else {
                Date parseDate = formatter.parse(created_user_dateTime);
                today_date_and_time_created_user = new Timestamp(parseDate.getTime());
                if (!"".equals(purchaseDate)) {
                    purchaseDate1 = formatter.parse(purchaseDate);
                }
                periodStart1 = formatter.parse(periodStart);
                periodEnd1 = formatter.parse(periodEnd);
                dipreciationFirstDate1 = formatter.parse(dipreciationFirstDate);
                DepreciationRecords depreciationRecords = new DepreciationRecords(Integer.parseInt(sno), depreCode, assetType, assetName, valueOfAsset, periodStart1, status, today_date_and_time_created_user, today_date_and_time_updated_user, subAssetCode, subAssetName, accessoriesCode, accessoryName, assetCode, period, NBV, cumulativeAmount, dipreciatedAmount, purchaseVoucherNo, purchaseDate1, periodEnd1, dipreciationFirstDate1, depreciationPercent, poNo, noOfDays);
                assetsDAO1.saveOrUpdate(depreciationRecords);
            }
        }

        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("depreciationList", assetsDAO1.depreciationList());
        return new ModelAndView(new RedirectView("../assetsm/depreciationList.htm"), modelMap);
    }

    //============================Property Details Popup =============================     
    @RequestMapping("/assetsm/selectAssetPopUp.htm")
    public ModelAndView selectAssetPopUp(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        modelMap.addAttribute("selectAssetPopUp", assetsDAO1.selectAssetPopUp());
        return new ModelAndView("../assets/selectAssetPopUp", modelMap);
    }

    //============================Flat Details Popup =============================     
    @RequestMapping("/assetsm/selectSubAssetPopUp.htm")
    public ModelAndView selectSubAssetPopUp(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String assetCode = req.getParameter("assetCode");
        modelMap.addAttribute("selectSubAssetPopUp", assetsDAO1.selectSubAssetPopUp(assetCode));
        return new ModelAndView("../assets/selectSubAssetPopUp", modelMap);
    }

    //============================Accessory Details Popup =============================     
    @RequestMapping("/assetsm/SelectAccessoriesPopUp.htm")
    public ModelAndView SelectAccessoriesPopUp(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String assetCode = req.getParameter("assetCode");
        String subAssetCode = req.getParameter("subAssetCode");
        modelMap.addAttribute("itemList", masterDAO.list("", "ItemMaster"));
        modelMap.addAttribute("SelectAccessoriesPopUp", assetsDAO1.SelectAccessoriesPopUp(assetCode, subAssetCode));
        return new ModelAndView("../assets/SelectAccessoriesPopUp", modelMap);
    }

    //============================Accessory Details Popup =============================     
    @RequestMapping("/assetsm/selectPOPopUp.htm")
    public ModelAndView selectPOPopUp(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String accessoryCode = req.getParameter("accessoryCode");
        modelMap.addAttribute("accessoryCode", accessoryCode);
        modelMap.addAttribute("poList", purchaseDAO.selectPOPopUp(accessoryCode));
        return new ModelAndView("../assets/selectPOPopUp", modelMap);
    }

    //============================Accessory Details Popup =============================     
    @RequestMapping("/assetsm/selectAccessoriesPrice.htm")
    public void selectAccessoriesPrice(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String accessoryCode = req.getParameter("accessoryCode");
        String poName = req.getParameter("poName");
        List<String> accessoryPrice = purchaseDAO.getAccessoriesPrice(accessoryCode, poName);
        if (accessoryPrice.size() > 0) {

            res.getWriter().write(accessoryPrice.get(0));
        } else {
            res.getWriter().write("no value");
        }
    }

    //============================Property Cumulative Value =============================     
    @RequestMapping("/assetsm/selectAssetCumulativeValue.htm")
    public void selectAssetCumulativeValue(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String assetCode = req.getParameter("assetCode");
        List<String[]> cumulativeValue = assetsDAO1.getAssetCumulativeValue(assetCode);

        if (cumulativeValue.size() > 0) {
            String data = new Gson().toJson(cumulativeValue.get(0));
            res.getWriter().write(data);
        } else {
            res.getWriter().write("no value");
        }
    }

    //============================Accessory Cumulative Value =============================     
    @RequestMapping("/assetsm/selectAccessoryCumulativeValue.htm")
    public void selectAccessoryCumulativeValue(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String assetCode = req.getParameter("assetCode");
        String subAssetCode = req.getParameter("subAssetCode");
        String accessoryCode = req.getParameter("accessoryCode");
        List<String[]> cumulativeValue = assetsDAO1.getAccessoryCumulativeValue(assetCode, subAssetCode, accessoryCode);

        if (cumulativeValue.size() > 0) {
            String data = new Gson().toJson(cumulativeValue.get(0));
            res.getWriter().write(data);
        } else {
            res.getWriter().write("no value");
        }
    }

    @RequestMapping("/assetsm/checkAlreadyAddedRecord.htm")
    public void checkAlreadyAddedRecord(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException, ParseException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String assetCode = req.getParameter("assetCode");
        String subAssetCode = req.getParameter("subAssetCode");
        String accessoryCode = req.getParameter("accessoryCode");
        String startDate = req.getParameter("startDate");
        String endDate = req.getParameter("endDate");
        Date startDate1 = formatter.parse(startDate);
        String date = formatter01.format(startDate1);
        List<Object[]> cumulativeValue = assetsDAO1.getDepreciationsLists(assetCode, subAssetCode, accessoryCode, date);

        if (cumulativeValue.size() > 0) {
            res.getWriter().write("Record Found");
        } else {
            res.getWriter().write("Record Not Found");
        }

    }

    //==============================End===================

    /* 
     Property Split
     <<-------------------------------------   Controller for the Split of Asset. ------------------->> 
     
     */
    @RequestMapping("/assetsm/splitOfAssetList.htm")
    public ModelAndView splitOfAssetList(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("assetSplitList", assetsDAO1.assetSplitList());
        return new ModelAndView("../assets/splitOfAssetList", modelMap);
    }

    // controller comes this while click on Add New record
    @RequestMapping("/assetsm/splitOfAssetForm.htm")
    public ModelAndView splitOfAssetForm(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String link = "../assets/splitOfAssetForm.htm";
        String tab = "Property Split";
        modelMap.addAttribute("assetSplitList", assetsDAO1.assetSplitList());
        String sno = request.getParameter("pk");
        String assetCode = request.getParameter("assetCode");
        String action = request.getParameter("action");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("split_asset_category", masterDAO.contraCategoryForm(link, tab));
            modelMap.addAttribute("assetSplitlist", assetsDAO1.assetSplitListView(Integer.parseInt(sno)));
            modelMap.addAttribute("assetAttach", assetsDAO1.assetAttachView(Integer.parseInt(sno), assetCode));
            modelMap.addAttribute("attachment", assetsDAO1.attachmentList(assetCode));
        }
        modelMap.addAttribute("split_asset_category", masterDAO.contraCategoryForm(link, tab));
        modelMap.addAttribute("action", action);
        return new ModelAndView("../assets/splitOfAssetForm", modelMap);
    }

    @RequestMapping("/assetsm/splitOfAssetPopUp.htm")
    public ModelAndView splitOfAssetPopUp(HttpServletRequest req, HttpServletResponse res) throws IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = req.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        modelMap.addAttribute("assetDetailsList", assetsDAO1.assetDetailsList());
        return new ModelAndView("../assets/splitOfAssetPopUp", modelMap);
    }

    @RequestMapping("/assetsm/splitOfAssetFormSubmit.htm")
    public ModelAndView splitOfAssetFormSubmit(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        HttpSession session = request.getSession();
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String assetCode = request.getParameter("assetCode");
        String assetName = request.getParameter("assetName");
        String subAssetCode = request.getParameter("subAssetCode");
        String subAssetName = request.getParameter("subAssetName");
        String assetCurrentValue = request.getParameter("assetCurrentValue");
        String assetSplittingProportionateValue1 = request.getParameter("assetSplittingProportionateValue1");
        String purchaseValue = request.getParameter("purchaseValue");
        String assetSplittingProportionateValue2 = request.getParameter("assetSplittingProportionateValue2");
        String newAssetCode1 = request.getParameter("newAssetCode1");
        String newAssetCode2 = request.getParameter("newAssetCode2");
        String currentValueOfAsset1 = request.getParameter("currentValueOfAsset1");
        String currentValueOfAsset2 = request.getParameter("currentValueOfAsset2");
        String depreciationForAsset1 = request.getParameter("depreciationForAsset1");
        String depreciationForAsset2 = request.getParameter("depreciationForAsset2");
        String totalValueLeftoutAsset1 = request.getParameter("totalValueLeftoutAsset1");
        String totalValueLeftoutAsset2 = request.getParameter("totalValueLeftoutAsset2");
        String sno = request.getParameter("pk");
        String delfiles = request.getParameter("tobedel");
        String status = "update0";
        Date today_date = new Date();
        String created_user_dateTime = request.getParameter("created_user_dateTime");
        Timestamp today_date_updated_user = new Timestamp(today_date.getTime());
        Timestamp today_date_created_user = new Timestamp(today_date.getTime());
        String orderAsset1NewNo2 = null;
        String orderAsset1NewNo1[] = null;
        int assetNewordno1 = 1;
        String orderAsset2NewNo2 = null;
        String orderAsset2NewNo1[] = null;
        int assetNewordno2 = 1;
        ArrayList validUser = (ArrayList) assetsDAO1.assetSplitCodeList(sno);

        if (!(validUser.isEmpty())) {
            for (Iterator<SplitAsset> iter = validUser.iterator(); iter.hasNext();) {
                orderAsset1NewNo2 = iter.next().getNewAssetCode1();
            }
            for (Iterator<SplitAsset> iter = validUser.iterator(); iter.hasNext();) {
                orderAsset2NewNo2 = iter.next().getNewAssetCode2();
            }
            orderAsset1NewNo1 = orderAsset1NewNo2.split("-");
            orderAsset2NewNo1 = orderAsset2NewNo2.split("-");
            if (orderAsset1NewNo1 != null) {
                assetNewordno1 = Integer.parseInt(orderAsset1NewNo1[1]);
                assetNewordno2 = Integer.parseInt(orderAsset2NewNo1[1]);
                newAssetCode1 = "NEWASSET1" + "-" + assetNewordno1;
                newAssetCode2 = "NEWASSET2" + "-" + assetNewordno2;

            }
        }
        if (sno == null || sno.equals("")) {
            if (orderAsset1NewNo2 != null) {
                assetNewordno1 = Integer.parseInt(orderAsset1NewNo1[1]) + 1;
                newAssetCode1 = "NEWASSET1" + "-" + assetNewordno1;
            } else {
                newAssetCode1 = "NEWASSET1" + "-" + 1;
            }
            if (orderAsset2NewNo2 != null) {
                assetNewordno2 = Integer.parseInt(orderAsset2NewNo1[1]) + 1;
                newAssetCode2 = "NEWASSET2" + "-" + assetNewordno2;
            } else {
                newAssetCode2 = "NEWASSET2" + "-" + 1;
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

                List<SplitAssetAttachment> list = new ArrayList<SplitAssetAttachment>();
                for (Iterator<MultipartFile> iterator = multipartFiles.iterator(); iterator.hasNext();) {
                    MultipartFile test = (MultipartFile) iterator.next();
                    fileLength = test.getBytes().length;

                    if (fileLength > 0) {
                        SplitAssetAttachment bdpfFile = new SplitAssetAttachment();
                        bdpfFile.setAttachName(test.getOriginalFilename());

                        bdpfFile.setAssetAttach(test.getBytes());

                        bdpfFile.setOrgId(orgId);
                        bdpfFile.setUserId(userId);
                        bdpfFile.setLasttmodifiedDate(today_date);
                        bdpfFile.setStatus("update0");
                        bdpfFile.setAssetCode(assetCode);

                        list.add(bdpfFile);
                    }
                    i++;
                }
                assetsDAO1.saveAssetAttach(list);

            } catch (Exception e) {
                e.printStackTrace();
            }
            SplitAsset splitAssetRecords = new SplitAsset(assetCode, assetName, subAssetCode, subAssetName, assetSplittingProportionateValue1, assetSplittingProportionateValue2, assetCurrentValue, currentValueOfAsset1, currentValueOfAsset2, depreciationForAsset1, depreciationForAsset2, totalValueLeftoutAsset1, totalValueLeftoutAsset2, newAssetCode1, newAssetCode2, purchaseValue, status, today_date_created_user, today_date_updated_user);
            assetsDAO1.saveOrUpdate(splitAssetRecords);
        } else {

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

                List<SplitAssetAttachment> list = new ArrayList<SplitAssetAttachment>();
                for (Iterator<MultipartFile> iterator = multipartFiles.iterator(); iterator.hasNext();) {
                    MultipartFile test = (MultipartFile) iterator.next();
                    fileLength = test.getBytes().length;

                    if (fileLength > 0) {
                        SplitAssetAttachment bdpfFile = new SplitAssetAttachment();
                        bdpfFile.setAttachName(test.getOriginalFilename());

                        bdpfFile.setAssetAttach(test.getBytes());

                        bdpfFile.setOrgId(orgId);
                        bdpfFile.setUserId(userId);
                        bdpfFile.setLasttmodifiedDate(today_date);
                        bdpfFile.setStatus("update0");
                        bdpfFile.setAssetCode(assetCode);

                        list.add(bdpfFile);
                    }
                    i++;
                }
                assetsDAO1.saveAssetAttach(list);

            } catch (Exception e) {
                e.printStackTrace();
            }

            if (!delfiles.equals("")) {
                String[] totalfiles = delfiles.split(",");
                for (int k = 0; k < totalfiles.length; k++) {

                    SplitAssetAttachment doc = assetsDAO1.getattchs(Integer.parseInt(totalfiles[k]));
                    //assetsDAO1.delete(doc.getAttachName(), doc.getAssetAttach());

                    assetsDAO1.delattachfiles("SplitAssetAttachment", "SNo", Integer.parseInt(totalfiles[k]));
                }
            }

            Date parseDate = formatter.parse(created_user_dateTime);
            today_date_created_user = new Timestamp(parseDate.getTime());
            SplitAsset splitAssetRecords = new SplitAsset(Integer.parseInt(sno), assetCode, assetName, subAssetCode, subAssetName, assetSplittingProportionateValue1, assetSplittingProportionateValue2, assetCurrentValue, currentValueOfAsset1, currentValueOfAsset2, depreciationForAsset1, depreciationForAsset2, totalValueLeftoutAsset1, totalValueLeftoutAsset2, newAssetCode1, newAssetCode2, purchaseValue, status, today_date_created_user, today_date_updated_user);
            assetsDAO1.saveOrUpdate(splitAssetRecords);
        }
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("depreciationList", assetsDAO1.depreciationList());
        return new ModelAndView(new RedirectView("../assetsm/splitOfAssetList.htm"), modelMap);
    }

    /* 
     
     <<-------------------------------------   Controller for the Revaluation Of Asset. ------------------->> 
     
     */
    @RequestMapping("/assetsm/revaluationOfAsseList.htm")
    public ModelAndView revaluationOfAsseList(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("revaluationOfAsseList", assetsDAO1.revaluationOfAssetList());
        return new ModelAndView("../assets/revaluationOfAsseList", modelMap);
    }

    // controller comes this while click on Add New record
    @RequestMapping("/assetsm/revaluationOfAssetForm.htm")
    public ModelAndView revaluationOfAssetForm(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String link = "../assets/revaluationOfAssetForm.htm";
        String tab = "Property Revaluation";
        modelMap.addAttribute("revaluation_dropdown_category", userDAO.formDrodownMapping(link, tab));
        modelMap.addAttribute("revaluationOfAsseList", assetsDAO1.revaluationOfAssetList());
        String sno = request.getParameter("pk");
        String assetCode = request.getParameter("assetCode");
        String revaluationNo = request.getParameter("revaluationNo");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("revaluation_dropdown_category", userDAO.formDrodownMapping(link, tab));
            modelMap.addAttribute("revaluation_of_asset_category", masterDAO.contraCategoryForm(link, tab));
            modelMap.addAttribute("revaluationOfAsselist", assetsDAO1.revaluationOfAsseListView(Integer.parseInt(sno)));
            modelMap.addAttribute("revaluationAttach", assetsDAO1.revalAttachView(Integer.parseInt(sno), assetCode, revaluationNo));

        }
        modelMap.addAttribute("revaluation_of_asset_category", masterDAO.contraCategoryForm(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../assets/revaluationOfAssetForm", modelMap);
    }
// controller comes this while click on Save

    @RequestMapping("/assetsm/revaluationOfAssetFormubmit.htm")
    public ModelAndView revaluationOfAssetFormubmit(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String assetCode = request.getParameter("assetCode");
        String selectAddSubAsset = request.getParameter("selectAddSubAsset");
        String assetName = request.getParameter("assetName");
        String revaluationNo = request.getParameter("revaluationNo");
        String subAssetCode = request.getParameter("subAssetCode");
        String subAssetName = request.getParameter("subAssetName");
        String currentValueOfAsset = request.getParameter("currentValueOfAsset");
        String addSubValueOfAsset = request.getParameter("addSubValueOfAsset");
        String newDepreciation = request.getParameter("newDepreciation");
        String newLifeSpan = request.getParameter("newLifeSpan");
        String previousValueLeftOut = request.getParameter("previousValueLeftOut");
        String revaluedLeftOut = request.getParameter("revaluedLeftOut");
        String startDateStringFormat = request.getParameter("startDate");
        String reason = request.getParameter("reason");
        String recordStatus = request.getParameter("recordStatus");
        String Filename = request.getParameter("Filename");
        String attachmentReference = request.getParameter("attachmentReference");
        String sno = request.getParameter("pk");
        String action = request.getParameter("action");
        String delfiles = request.getParameter("tobedel");
        Date startDate = formatter.parse(startDateStringFormat);
        String status = "update0";
        Date today_date = new Date();
        String created_user_dateTime = request.getParameter("created_user_dateTime");
        Timestamp today_date_updated_user = new Timestamp(today_date.getTime());
        Timestamp today_date_created_user = new Timestamp(today_date.getTime());
        List<RevaluationAttach> gridattach = new ArrayList<RevaluationAttach>();

        if (revaluationNo == null || revaluationNo == "" || "".equals(revaluationNo)) {

            ArrayList validuser = (ArrayList) assetsDAO1.PurchReqAutoGen(revaluationNo);
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

            revaluationNo = "REV" + "-" + ordno;
        }
        if (action != null && !action.isEmpty()) {
            if (action.equalsIgnoreCase("recheck")) {
                String str[] = revaluationNo.split("-");
                if (str.length > 2) {
                    int i = Integer.parseInt(str[3]);
                    i = i + 1;
                    revaluationNo = str[0] + "-" + str[1] + "-" + str[2] + "-" + i;
                } else {
                    revaluationNo = revaluationNo + "-REV" + "-" + 1;
                }

                String attachsno1[] = request.getParameterValues("attachSno");
                //String attachSno2 = request.getParameter("attachSno");
                if (attachsno1 != null) {

                    for (int at = 0; at < attachsno1.length; at++) {
                        assetsDAO1.prAttachRecheckUpdate(attachsno1[at], revaluationNo);
                    }
                }
            }

        }

        if (sno == null || sno.equals("")) {

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

                List<RevaluationAttach> list = new ArrayList<RevaluationAttach>();
                for (Iterator<MultipartFile> iterator = multipartFiles.iterator(); iterator.hasNext();) {
                    MultipartFile test = (MultipartFile) iterator.next();
                    fileLength = test.getBytes().length;

                    if (fileLength > 0) {
                        RevaluationAttach bdpfFile = new RevaluationAttach();
                        bdpfFile.setFilename(test.getOriginalFilename());

                        bdpfFile.setContent(test.getBytes());
                        bdpfFile.setContentType(test.getContentType());

                        bdpfFile.setOrgId(orgId);
                        bdpfFile.setUserId(userId);
                        bdpfFile.setLastmodifiedDate(today_date_updated_user);
                        bdpfFile.setStatus("update0");
                        bdpfFile.setAssetCode(assetCode);
                        bdpfFile.setRevaluationNo(revaluationNo);

                        list.add(bdpfFile);
                    }
                    i++;
                }
                assetsDAO1.saveRevalAttach(list);

            } catch (Exception e) {
                e.printStackTrace();
            }

//            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
//            List<MultipartFile> multipartFile = multipartRequest.getFiles("attachmentReference");
//            int x = 0;
//            for (Iterator<MultipartFile> iterator = multipartFile.iterator(); iterator.hasNext();) {
//                MultipartFile test = (MultipartFile) iterator.next();
//                if (test.getBytes().length > 0) {
//                    RevaluationAttach attach = new RevaluationAttach(test.getBytes(), test.getContentType(), assetCode, test.getOriginalFilename(), today_date, orgId, "Update0", userId, revaluationNo);
//                    gridattach.add(attach);
//                    x++;
//                }
//            }
            RevaluationOfAsset revaluationOfAssetRecords = new RevaluationOfAsset(assetCode, assetName, subAssetCode, subAssetName, selectAddSubAsset, addSubValueOfAsset, startDate, currentValueOfAsset, newDepreciation, newLifeSpan, previousValueLeftOut, revaluedLeftOut, status, today_date_created_user, today_date_updated_user, reason, "Request Generated", revaluationNo);
            assetsDAO1.saveOrUpdate(revaluationOfAssetRecords);
            //assetsDAO1.revaluationDocSave(gridattach);

        } else {

            Date parseDate = formatter.parse(created_user_dateTime);
            today_date_created_user = new Timestamp(parseDate.getTime());

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

                List<RevaluationAttach> list = new ArrayList<RevaluationAttach>();
                for (Iterator<MultipartFile> iterator = multipartFiles.iterator(); iterator.hasNext();) {
                    MultipartFile test = (MultipartFile) iterator.next();
                    fileLength = test.getBytes().length;

                    if (fileLength > 0) {
                        RevaluationAttach bdpfFile = new RevaluationAttach();
                        bdpfFile.setFilename(test.getOriginalFilename());

                        bdpfFile.setContent(test.getBytes());
                        bdpfFile.setContentType(test.getContentType());

                        bdpfFile.setOrgId(orgId);
                        bdpfFile.setUserId(userId);
                        bdpfFile.setLastmodifiedDate(today_date_created_user);
                        bdpfFile.setStatus("update0");
                        bdpfFile.setAssetCode(assetCode);
                        bdpfFile.setRevaluationNo(revaluationNo);
                        list.add(bdpfFile);
                    }
                    i++;
                }
                assetsDAO1.saveRevalAttach(list);

            } catch (Exception e) {
                e.printStackTrace();
            }

            if (!delfiles.equals("")) {
                String[] totalfiles = delfiles.split(",");
                for (int k = 0; k < totalfiles.length; k++) {

                    RevaluationAttach doc = assetsDAO1.getattchs1(Integer.parseInt(totalfiles[k]));
                    //assetsDAO1.delete(doc.getAttachName(), doc.getAssetAttach());

                    assetsDAO1.delattachfiles("RevaluationAttach", "SNo", Integer.parseInt(totalfiles[k]));
                }
            }

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
//                        assetsDAO1.revaluationattachmentDelete(Integer.parseInt(nA));
//                    } catch (Exception e) {
//                        e.printStackTrace();
//                    }
//                }
//            } else {
//                if (attachSno == null && attachSnoFull != null) {
//                    try {
//                        assetsDAO1.revaluationattachmentDelete(Integer.parseInt(attachSnoFull[0]));
//                    } catch (Exception e) {
//                        e.printStackTrace();
//                    }
//                }
//            }
//
//            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
//            List<MultipartFile> multipartFile = multipartRequest.getFiles("attachmentReference");
//            int x = 0;
//            for (Iterator<MultipartFile> iterator = multipartFile.iterator(); iterator.hasNext();) {
//                MultipartFile test = (MultipartFile) iterator.next();
//                if (test.getBytes().length > 0) {
//                    RevaluationAttach attach = new RevaluationAttach(test.getBytes(), test.getContentType(), assetCode, test.getOriginalFilename(), today_date, orgId, "Update0", userId, revaluationNo);
//                    gridattach.add(attach);
//                    x++;
//                }
//            }
            RevaluationOfAsset revaluationOfAssetRecords = new RevaluationOfAsset(Integer.parseInt(sno), assetCode, assetName, subAssetCode, subAssetName, selectAddSubAsset, addSubValueOfAsset, startDate, currentValueOfAsset, newDepreciation, newLifeSpan, previousValueLeftOut, revaluedLeftOut, status, today_date_created_user, today_date_updated_user, reason, "Request Generated", revaluationNo);
            assetsDAO1.saveOrUpdate(revaluationOfAssetRecords);
            //assetsDAO1.revaluationDocSave(gridattach);

        }
        modelMap.addAttribute("revaluationOfAsseList", assetsDAO1.revaluationOfAssetList());
        return new ModelAndView(new RedirectView("../assetsm/revaluationOfAsseList.htm"), modelMap);
    }

    //**************Select Property Details Attachment******************//
    @RequestMapping("/assetsm/revaluationDocumentsForm.htm")
    public ModelAndView revaluationDocumentsForm(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String assetCode = request.getParameter("assetCode");
        String action = request.getParameter("action");
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("fileSize", userDAO.fileSize());
        modelMap.addAttribute("revaluationDocuments", assetsDAO1.revaluationDocuments(assetCode));
        modelMap.addAttribute("action", action);
        return new ModelAndView("../assets/revaluationDocumentsForm", modelMap);

    }

    //**************Download Property Attachment******************//
    @RequestMapping("/assetsm/revaluationAttachDownload.htm")
    public void revaluationAttachDownload(HttpServletRequest req, HttpServletResponse res) throws FileNotFoundException, IOException {
        String sno = req.getParameter("sno");

        RevaluationAttach doc = assetsDAO1.getRevaluationAttach(Integer.parseInt(sno));
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

    @RequestMapping("/assetsm/assetsRevalApproval1List.htm")
    public ModelAndView assetsRevalApproval1List(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Approval 1";
        String submoduleName = "Property Revaluation";
        map.addAttribute("permission", assetsDAO1.roleperm(orgId, roleName, submoduleName, tabName));
        map.addAttribute("revaluationOfAsseList", assetsDAO1.requiList1(userId, orgId, null, "Request Generated"));
        return new ModelAndView("../assets/assetsRevalApproval1List", map);
    }

    @RequestMapping("/assetsm/assetsRevalApproval1Form.htm")
    public ModelAndView assetsRevalApproval1Form(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {

        String SNo = request.getParameter("SNo");

        ModelMap modelMap = new ModelMap();
        String link = "../assets/revaluationOfAssetForm.htm";
        String tab = "Property Revaluation";
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sno = request.getParameter("SNo");
        String assetCode = request.getParameter("assetCode");
        String revaluationNo = request.getParameter("revaluationNo");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("revaluationOfAsselist", assetsDAO1.list(sno, "RevaluationOfAsset"));
            modelMap.addAttribute("revaluationAttach", assetsDAO1.revalAttachView(Integer.parseInt(sno), assetCode, revaluationNo));

        }

        modelMap.addAttribute("revaluation_of_asset_category", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../assets/assetsRevalApproval1Form", modelMap);
    }

    @RequestMapping("/assetsm/assetsRevalApproval1Submit.htm")
    public ModelAndView assetsRevalApproval1Submit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException, MessagingException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk[] = request.getParameterValues("pk");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        String assetCode = request.getParameter("assetCode");
        String status[] = request.getParameterValues("status");
        String reviewerComments1 = request.getParameter("reviewerComments1");
        String reviewerRecordStatus = request.getParameter("reviewerRecordStatus");
        String revaluationNo = request.getParameter("revaluationNo");
        assetsDAO1.approvUpdate1(revaluationNo, reviewerComments1, "APPROVED 1");
        //        modelMap.addAttribute("approvList", assetsDAO1.requiApprovList1(userId, orgId, revaluationNo));
//        modelMap.addAttribute("purchRequi", assetsDAO1.requiList(userId, orgId, null, "Request Generated"));
        List<RevaluationAttach> gridattach = new ArrayList<RevaluationAttach>();

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
                    assetsDAO1.revaluationattachmentDelete(Integer.parseInt(nA));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } else {
            if (attachSno == null && attachSnoFull != null) {
                try {
                    assetsDAO1.revaluationattachmentDelete(Integer.parseInt(attachSnoFull[0]));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        List<MultipartFile> multipartFile = multipartRequest.getFiles("attachmentReference");
        int x = 0;
        for (Iterator<MultipartFile> iterator = multipartFile.iterator(); iterator.hasNext();) {
            MultipartFile test = (MultipartFile) iterator.next();
            if (test.getBytes().length > 0) {
                RevaluationAttach attach = new RevaluationAttach(test.getBytes(), test.getContentType(), assetCode, test.getOriginalFilename(), today, orgId, "Update0", userId, revaluationNo);
                gridattach.add(attach);
                x++;
            }
        }

        Common cm = new Common();
        String subject = "", tbody = "", mailbody = "", email = "", fileName = "", tenantFname = "", tenantLname = "", assetName = "";
        String userEmail = "excelarete@gmail.com";
        String password = "excel123";
        String toEmail = "";
        List<UserRegistration> ud = assetsDAO1.udList("GFC");
        for (UserRegistration udlist : ud) {
            userId = udlist.getUserId();
            email = udlist.getEmail();

            if (!userEmail.isEmpty() && !password.isEmpty() && !email.isEmpty()) {
                List<RevaluationOfAsset> td = assetsDAO1.tdList(userId, orgId, revaluationNo);
                StringBuilder emailId = new StringBuilder(email);
                if (td.size() > 0) {
                    int i = 1;
                    for (RevaluationOfAsset tdlist : td) {

                        revaluationNo = tdlist.getRevaluationNo();
                    }
                    emailId.append(",");
                    emailId.append(toEmail);
                    String[] sendEmail = emailId.toString().split(",");
                    subject = "Tenant Code: " + revaluationNo;
                    String filepath = request.getSession().getServletContext().getRealPath("common\\theme\\images\\logo1.png");
                    mailbody = "<html><body>Dear Sir/Madam,<br/><br/><br/>You need to give an approval for Requisition Details. Requisition No : " + revaluationNo + " "
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
        //return new ModelAndView(new RedirectView("../assets/assetsRevalApproval1List.htm"), modelMap);
        return new ModelAndView("../assets/assetsRevalApproval1List", modelMap);

    }

    @RequestMapping("/assetsm/assetsRevalApproval2List.htm")
    public ModelAndView assetsRevalApproval2List(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Approval 2";
        String submoduleName = "Property Revaluation";
        map.addAttribute("permission", assetsDAO1.roleperm(orgId, roleName, submoduleName, tabName));
        map.addAttribute("revaluationOfAsseList", assetsDAO1.requiList2(userId, orgId, null, "APPROVED 1"));
        return new ModelAndView("../assets/assetsRevalApproval2List", map);
    }

    @RequestMapping("/assetsm/assetsRevalApproval2Form.htm")
    public ModelAndView assetsRevalApproval2Form(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {

        String SNo = request.getParameter("SNo");

        ModelMap modelMap = new ModelMap();
        String link = "../assets/revaluationOfAssetForm.htm";
        String tab = "Property Revaluation";
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sno = request.getParameter("SNo");
        String assetCode = request.getParameter("assetCode");
        String revaluationNo = request.getParameter("revaluationNo");

        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("revaluationOfAsselist", assetsDAO1.list(sno, "RevaluationOfAsset"));
            modelMap.addAttribute("revaluationAttach", assetsDAO1.revalAttachView(Integer.parseInt(sno), assetCode, revaluationNo));

            modelMap.addAttribute("approvList", assetsDAO1.requiApprovList(userId, orgId, sno));

        }

        modelMap.addAttribute("revaluation_of_asset_category", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../assets/assetsRevalApproval2Form", modelMap);
    }

    @RequestMapping("/assetsm/assetsRevalApproval2Submit.htm")
    public ModelAndView assetsRevalApproval2Submit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException, MessagingException {
        ModelMap modelMap = new ModelMap();
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String pk[] = request.getParameterValues("pk");
        java.util.Date today = new java.util.Date();
        java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
        String assetCode = request.getParameter("assetCode");
        String status[] = request.getParameterValues("status");
        String reviewerComments2 = request.getParameter("reviewerComments2");
        String reviewerRecordStatus = request.getParameter("reviewerRecordStatus");
        String revaluationNo = request.getParameter("revaluationNo");
        assetsDAO1.approvUpdate(revaluationNo, reviewerComments2, "APPROVED 2");
//        modelMap.addAttribute("approvList", assetsDAO1.requiApprovList1(userId, orgId, revaluationNo));
//        modelMap.addAttribute("purchRequi", assetsDAO1.requiList(userId, orgId, null, "Request Generated"));
        List<RevaluationAttach> gridattach = new ArrayList<RevaluationAttach>();

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
                    assetsDAO1.revaluationattachmentDelete(Integer.parseInt(nA));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } else {
            if (attachSno == null && attachSnoFull != null) {
                try {
                    assetsDAO1.revaluationattachmentDelete(Integer.parseInt(attachSnoFull[0]));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        List<MultipartFile> multipartFile = multipartRequest.getFiles("attachmentReference");
        int x = 0;
        for (Iterator<MultipartFile> iterator = multipartFile.iterator(); iterator.hasNext();) {
            MultipartFile test = (MultipartFile) iterator.next();
            if (test.getBytes().length > 0) {
                RevaluationAttach attach = new RevaluationAttach(test.getBytes(), test.getContentType(), assetCode, test.getOriginalFilename(), today, orgId, "Update0", userId, revaluationNo);
                gridattach.add(attach);
                x++;
            }
        }

        Common cm = new Common();
        String subject = "", tbody = "", mailbody = "", email = "", fileName = "", tenantFname = "", tenantLname = "", assetName = "";
        String userEmail = "excelarete@gmail.com";
        String password = "excel123";
        String toEmail = "";
        List<UserRegistration> ud = assetsDAO1.udList("CFO");
        for (UserRegistration udlist : ud) {
            userId = udlist.getUserId();
            email = udlist.getEmail();

            if (!userEmail.isEmpty() && !password.isEmpty() && !email.isEmpty()) {
                List<RevaluationOfAsset> td = assetsDAO1.tdList(userId, orgId, revaluationNo);
                StringBuilder emailId = new StringBuilder(email);
                if (td.size() > 0) {
                    int i = 1;
                    for (RevaluationOfAsset tdlist : td) {

                        revaluationNo = tdlist.getRevaluationNo();
                    }
                    emailId.append(",");
                    emailId.append(toEmail);
                    String[] sendEmail = emailId.toString().split(",");
                    subject = "Tenant Code: " + revaluationNo;
                    String filepath = request.getSession().getServletContext().getRealPath("common\\theme\\images\\logo1.png");
                    mailbody = "<html><body>Dear Sir/Madam,<br/><br/><br/>You need to give an approval for Requisition Details. Requisition No : " + revaluationNo + " "
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
        // return new ModelAndView(new RedirectView("../assets/assetsRevalApproval2List.htm"), modelMap);
        return new ModelAndView("../assets/assetsRevalApproval2List", modelMap);

    }

    @RequestMapping("/assetsm/assetsRevalApprovedList.htm")
    public ModelAndView assetsRevalApprovedList(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        modelMap.addAttribute("revaluationOfAsseList", assetsDAO1.revaluationOfAssetList2());
        return new ModelAndView("../assets/assetsRevalApprovedList", modelMap);
    }

    @RequestMapping("/assetsm/assetsRevalApprovedForm.htm")
    public ModelAndView assetsRevalApprovedForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {

        String SNo = request.getParameter("SNo");

        ModelMap modelMap = new ModelMap();
        String link = "../assets/revaluationOfAssetForm.htm";
        String tab = "Property Revaluation";
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        String sno = request.getParameter("SNo");
        String assetCode = request.getParameter("assetCode");
        String revaluationNo = request.getParameter("revaluationNo");
        if (sno != null && !sno.isEmpty()) {
            modelMap.addAttribute("revaluationOfAsselist", assetsDAO1.list(sno, "RevaluationOfAsset"));
            modelMap.addAttribute("revaluationAttach", assetsDAO1.revalAttachView(Integer.parseInt(sno), assetCode, revaluationNo));

            modelMap.addAttribute("approvList", assetsDAO1.requiApprovList(userId, orgId, sno));

        }

        modelMap.addAttribute("revaluation_of_asset_category", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../assets/assetsRevalApprovedForm", modelMap);
    }

    @RequestMapping("/assetsm/assetsRevalrejectedList.htm")
    public ModelAndView assetsRevalrejectedList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String roleName = session.getAttribute("userRole").toString();
        String tabName = "Rejected Requisition";
        String submoduleName = "Purchase Requisition";
        map.addAttribute("permission", assetsDAO1.roleperm(orgId, roleName, submoduleName, tabName));
        map.addAttribute("revaluationOfAsseList", assetsDAO1.rejectRequiList1(userId, orgId, null, "REJECTED"));
        return new ModelAndView("../assets/assetsRevalrejectedList", map);
    }

    @RequestMapping("/assetsm/assetsRevalrejectedForm.htm")
    public ModelAndView assetsRevalrejectedForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        ModelMap modelMap = new ModelMap();
        String sno = request.getParameter("pk");
        HttpSession session = request.getSession();
        String SNo = request.getParameter("SNo");
        String assetCode = request.getParameter("assetCode");
        String revaluationNo = request.getParameter("revaluationNo");
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String link = "../assets/revaluationOfAssetForm.htm";
        String tab = "Property Revaluation";
        modelMap.addAttribute("revaluation_of_asset_category", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("revaluationOfAsselist", assetsDAO1.requiApprovList(userId, orgId, SNo));
        modelMap.addAttribute("revaluationAttach", assetsDAO1.revalAttachView(Integer.parseInt(SNo), assetCode, revaluationNo));

        modelMap.addAttribute("action", request.getParameter("action"));
        return new ModelAndView("../assets/assetsRevalrejectedForm", modelMap);
    }

    @RequestMapping("/assetsm/assetsRevalrejectedSubmit.htm")
    public ModelAndView assetsRevalrejectedSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, IOException {
        ModelMap map = new ModelMap();
        HttpSession session = request.getSession();
        String orgId = session.getAttribute("orgId").toString();
        String userId = session.getAttribute("userId").toString();
        String SNo = request.getParameter("SNo");
        String reviewerRecordStatus = request.getParameter("reviewerRecordStatus");
        String reviewerComments1 = request.getParameter("reviewerComments1");
        String reviewerComments2 = request.getParameter("reviewerComments2");

        if (reviewerComments1 != null) {
            assetsDAO1.reject1Update(SNo, reviewerComments1, reviewerRecordStatus);
        } else if (reviewerComments2 != null) {
            assetsDAO1.reject2Update(SNo, reviewerComments2, reviewerRecordStatus);
        }
        map.addAttribute("revaluationOfAsseList", assetsDAO1.rejectRequiList1(userId, orgId, null, "REJECTED"));
        return new ModelAndView("../assets/assetsRevalrejectedList", map);
    }

    @RequestMapping("/assetsm/AttachDownload.htm")
    public void AttachDownload(HttpServletRequest req, HttpServletResponse res) throws FileNotFoundException, IOException {
        String SNo = req.getParameter("SNo");

        SplitAssetAttachment doc = assetsDAO1.getCAMAttach(Integer.parseInt(SNo));
        try {
            res.setHeader("Content-Disposition", "inline;filename=\"" + doc.getAttachName() + "\"");
            OutputStream out = res.getOutputStream();
            res.setContentType("application/force-download");
            byte[] buffer = doc.getAssetAttach();
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
