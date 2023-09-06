/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tenant.controller;

import java.io.IOException;
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
import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import tenant.classes.CampaignMedia;
import tenant.dao.CampaignMediaDAO;
import tenant.dao.UserDAO;

/**
 *
 * @author ebs-sdd27
 */
public class CampaignMediaController {

    Calendar now = Calendar.getInstance();
    String mod_date = now.get(Calendar.YEAR) + "/" + (now.get(Calendar.MONTH) + 1) + "/" + now.get(Calendar.DATE);
    Date date = new Date(mod_date);

    DateFormat f = new SimpleDateFormat("dd-MM-yyyy");
    DateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
    DateFormat formatter1 = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ssa");
    DateFormat formatter3 = new SimpleDateFormat("dd-MMM-yyyy");
    java.util.Date newdate = new java.util.Date();
    long t = newdate.getTime();
    java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(t);

    @Autowired
    private CampaignMediaDAO cmDAO;

    @Autowired
    private UserDAO userDAO;

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

    //-------------------------------     CAMPAIGNS  MASTER   --------------------------------------------------------    
//...........................   Campaign List ............................................
    @RequestMapping("/MediaMaster/campaignMediaList.htm")
    public ModelAndView campaignMediaList(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");
        modelMap.addAttribute("campaignMediaList", cmDAO.list("", "CampaignMedia"));
        return new ModelAndView("campaignMediaList", modelMap);
    }
//...........................   Campaign Form ............................................

    @RequestMapping("/MediaMaster/campaignMediaForm.htm")
    public ModelAndView campaignMediaForm(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException {

        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();
        String SNo = request.getParameter("sno");

        if (SNo != null) {
            modelMap.addAttribute("campaignMediaList", cmDAO.list(SNo, "CampaignMedia"));
        }
        String link = "../MediaMaster/campaignMediaForm.htm";
        String tab = "Campaign Media";

        modelMap.addAttribute("test", userDAO.formLabelMapping(link, tab));
        modelMap.addAttribute("SNo", SNo);
        modelMap.addAttribute("action", request.getParameter("action"));

        return new ModelAndView("campaignMediaForm", modelMap);
    }

    //...........................   Campaign Submit ............................................
    @RequestMapping("/MediaMaster/campaignMediaSubmit.htm")
    public ModelAndView campaignMediaSubmit(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException {
        HttpSession session = request.getSession(true);
        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();

        String campaignMediaCode = request.getParameter("mediaCode");
        String campaignMediaName = request.getParameter("campaignMediaName");
        String campaignMediaDesc = request.getParameter("campaignMediaDesc");

        String sno = request.getParameter("sno");
        String status = request.getParameter("status");

        List<CampaignMedia> gridData = new ArrayList<CampaignMedia>();
        if (campaignMediaCode.isEmpty()) {
            ArrayList validuser = (ArrayList) cmDAO.campaignMediaCodelist(campaignMediaName);
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

            campaignMediaCode = "CAMPMEDIA" + "-" + ordno;
        }
        if (sno == null) {
            CampaignMedia cm = new CampaignMedia(campaignMediaCode, "update0", date, userId, campaignMediaName, orgId, campaignMediaDesc);
            gridData.add(cm);
            cmDAO.campaignsave1(gridData);
            modelMap.addAttribute("success", "true");

        } else {

            int k = Integer.parseInt(status.substring(status.length() - 1));
            k++;
            status = "Update" + k;

            CampaignMedia cm = new CampaignMedia(Integer.parseInt(sno), campaignMediaCode, status, date, userId, campaignMediaName, orgId, campaignMediaDesc);
            cmDAO.CampaignSave(cm);
            modelMap.addAttribute("success", "test");
        }

        modelMap.addAttribute("success", "true");

        return new ModelAndView(new RedirectView("campaignMediaList.htm"), modelMap);

    }

    //============================   Campaign Media Validation==================
    @RequestMapping("/MediaMaster/mediaNameValidation.htm")
    public void mediaNameValidation(HttpServletRequest req, HttpServletResponse res) throws HibernateException, SQLException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        HttpSession session = req.getSession(true);
        String campaignMediaName = req.getParameter("campMediaName");
        cmDAO.mediaNameAvaliablity(req, res, campaignMediaName);
    }

}
