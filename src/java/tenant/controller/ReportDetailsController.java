package tenant.controller;

//import net.sf.jasperreports.export.Exporter;
import com.itextpdf.text.BadElementException;
import tenant.classes.ConnectionPool;
//import erp.dao.MasterDAO;
import tenant.dao.RepGenerationDAO;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.jasperreports.JasperReportsCsvView;

import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JRParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
//import net.sf.jasperreports.engine.export.HtmlExporter;
//import net.sf.jasperreports.engine.export.HtmlExporter;
//import net.sf.jasperreports.engine.export.HtmlExporter;
import net.sf.jasperreports.engine.export.JRHtmlExporterParameter;
import net.sf.jasperreports.engine.util.JRLoader;
//import net.sf.jasperreports.export.SimpleExporterInput;
//import net.sf.jasperreports.export.SimpleHtmlExporterOutput;
//import net.sf.jasperreports.export.SimpleHtmlReportConfiguration;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;

//import net.sf.jasperreports.export.Exporter;
//import net.sf.jasperreports.export.HtmlExporterConfiguration;
//import net.sf.jasperreports.export.SimpleHtmlExporterConfiguration;
import net.sf.jasperreports.j2ee.servlets.ImageServlet;
import org.pentaho.reporting.engine.classic.core.MasterReport;
import org.pentaho.reporting.engine.classic.core.modules.output.table.html.HtmlReportUtil;
import tenant.dao.FinanceDetailsDAO;
//import net.sf.jasperreports.web.util.WebHtmlResourceHandler;
//import net.sf.jasperreports.engine.export.HtmlExporter;
//import net.sf.jasperreports.engine.export.JRHtmlExporterParameter;
//import net.sf.jasperreports.export.SimpleHtmlExporterOutput;
//import net.sf.jasperreports.export.SimpleHtmlReportConfiguration;
//import net.sf.jasperreports.export.SimpleExporterInput;
//import net.sf.jasperreports.export.set;

@Controller
public class ReportDetailsController extends MultiActionController {

//    private final static Logger MYLOG = LoggerFactory.getLogger(ReportGenerationController.class);
    ModelMap modelMap = new ModelMap();
    DateFormat f = new SimpleDateFormat("dd-MMM-yyyy");
    DateFormat formatter1 = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ssa");
    Calendar now = Calendar.getInstance();
    String mod_date = now.get(Calendar.YEAR) + "/" + (now.get(Calendar.MONTH) + 1) + "/" + now.get(Calendar.DATE);
    Date date = new Date(mod_date);
    Date date1;
    Date date2;
    Date date3;
    Date date4;
    String storetype;
    @Autowired
    private RepGenerationDAO repGenerationdao;
    
//    @Autowired
//    private MasterDAO masterDAO;
    
    @Autowired
    private FinanceDetailsDAO financeDetailsDAO;

    @RequestMapping("/jasperReport/hrmsReport.htm")
    public ModelAndView hrmsReport(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, IOException, BadElementException {

        HttpSession session = request.getSession();
        //request.setCharacterEncoding("UTF-8");
//        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //  request.setContentType("text/html;charset=UTF-8"); 

        String userId = session.getAttribute("userId").toString();
        String orgId = session.getAttribute("orgId").toString();
        ModelMap modelMap = new ModelMap();

        //modelMap.addAttribute("areaList", repGenerationdao.areaList());
        
//        modelMap.addAttribute("areaList", masterDAO.areaList(userId, orgId, null));
       // modelMap.addAttribute("blockList", repGenerationdao.blockList());
        modelMap.addAttribute("reconsileStatus", repGenerationdao.reconsileStatus());
        // Customer  restriction
        modelMap.addAttribute("billRestrictionStatus", repGenerationdao.billRestrictionStatus());
        // Mobile bill restriction
        modelMap.addAttribute("MobilebillRestrictionStatus", repGenerationdao.MobilebillRestrictionStatus());
        // Customer registered Mobile opted or not opted and pending Mobile opted or not opted
        modelMap.addAttribute("CustomerRegIsMobileopted", repGenerationdao.CustomerRegIsMobileopted());
        // ReconsileStatus
        modelMap.addAttribute("ReconsileStatus", repGenerationdao.ReconsileStatus());
         // ReconsileStatus
        modelMap.addAttribute("PaymentMode", repGenerationdao.PaymentMode());

        String reportName = request.getParameter("reportid");
        String reportFormat = request.getParameter("format");
        String visaType = request.getParameter("visadiv");
        String department = request.getParameter("departmentdiv1");

        return new ModelAndView("hrmsReport", modelMap);
    }

    public void yycReportData(HttpServletRequest request, HttpServletResponse response) throws HibernateException, SQLException, ParseException, UnsupportedEncodingException {

        HttpSession session = request.getSession();
 
        DateFormat f1 = new SimpleDateFormat("dd-MMM-yy");

        request.setCharacterEncoding("Windows-1256");
        String reportFormat = request.getParameter("format");
        String reportName = request.getParameter("reportid");
        String report = request.getParameter("name");

       String agingUserId = request.getParameter("agingUserIdFromUser");
        String ledgerFrom = request.getParameter("ledgerFrom");
       String ledgerTo = request.getParameter("ledgerTo");
       String ledegrNo = request.getParameter("ledegrNo");
       String ledgerUser = request.getParameter("userId");
       
        String userId = session.getAttribute("userId").toString();
        String ledgerNo = request.getParameter("");
        String fromDate = request.getParameter("");
        String toDate = request.getParameter("");
        HashMap reportParams = new HashMap();
        
        String reportPath = null;

        Connection conn = null;

        JRExporter exporter = new JRXlsExporter();

        exporter.setParameter(JRExporterParameter.CHARACTER_ENCODING, "UTF-8");
        String FileName = "Reports";

        ServletContext context = request.getServletContext();
      //  String imagePath = context.getRealPath("/jasper/alsad-logo3.png");
               if (reportName.equals("AgingReport")) {
                    reportParams.put("agingUserId", agingUserId);
               } else if (report != null & reportName.equals("LedgerReport")) {
                    reportParams.put("ledegrNo", ledegrNo);
       reportParams.put("userId", ledgerUser);
       reportParams.put("ledgerFrom", ledgerFrom);
       reportParams.put("ledgerTo", ledgerTo);
               }
     
       
        
  
        try {
            conn = ConnectionPool.getDataSource().getConnection();

            JasperReport jasperReport = getCompiledFile(reportName, request);

          if (report != null & reportName.equals("AgingReport")) {
              try {
                  financeDetailsDAO.fetchAgingReportDetails(request, response, agingUserId);
              } catch(Exception ex) {
                  ex.printStackTrace();
              }
                if (reportFormat.equalsIgnoreCase("PDF")) {
                    generateReportPDF(reportName, response, reportParams, jasperReport, conn);
                } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                    generateReportExcel(reportName, response, reportParams, jasperReport, conn);

                } else if (reportFormat.equalsIgnoreCase("CSV")) {
                    reportPath = "file:" + request.getSession().getServletContext().getRealPath("/reportfiles/campaignStatusWise.prpt");

                } else if (reportFormat.equalsIgnoreCase("HTML")) {
                    reportParams.put(JRParameter.IS_IGNORE_PAGINATION, true);
                    JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, reportParams, conn);
                    //generateReportHtml(jasperPrint, request, response); // For HTML report
                }
            }   else if (report != null & reportName.equals("LedgerReport")) {
                           
             financeDetailsDAO.fetchLedgerReportDetails(request, response, ledgerUser, ledegrNo, ledgerFrom, ledgerTo);
               
               
               
                if (reportFormat.equalsIgnoreCase("PDF")) {
                    generateReportPDF(reportName, response, reportParams, jasperReport, conn);
                } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                    generateReportExcel(reportName, response, reportParams, jasperReport, conn);

                } else if (reportFormat.equalsIgnoreCase("CSV")) {
                    reportPath = "file:" + request.getSession().getServletContext().getRealPath("/reportfiles/campaignStatusWise.prpt");

                } else if (reportFormat.equalsIgnoreCase("HTML")) {
                    reportParams.put(JRParameter.IS_IGNORE_PAGINATION, true);
                    JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, reportParams, conn);
                    //generateReportHtml(jasperPrint, request, response); // For HTML report
                }
            }
            else if (report != null & reportName.equals("ProfitAndLoss")) {
               if (reportFormat.equalsIgnoreCase("PDF")) {
                    generateReportPDF(reportName, response, reportParams, jasperReport, conn);
                } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                    generateReportExcel(reportName, response, reportParams, jasperReport, conn);

                } else if (reportFormat.equalsIgnoreCase("CSV")) {
                    reportPath = "file:" + request.getSession().getServletContext().getRealPath("/reportfiles/campaignStatusWise.prpt");

                } else if (reportFormat.equalsIgnoreCase("HTML")) {
                    reportParams.put(JRParameter.IS_IGNORE_PAGINATION, true);
                    JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, reportParams, conn);
                    //generateReportHtml(jasperPrint, request, response); // For HTML report
                }
            } 
             else if (report != null & reportName.equals("BalanceSheet")) {
               if (reportFormat.equalsIgnoreCase("PDF")) {
                    generateReportPDF(reportName, response, reportParams, jasperReport, conn);
                } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                    generateReportExcel(reportName, response, reportParams, jasperReport, conn);

                } else if (reportFormat.equalsIgnoreCase("CSV")) {
                    reportPath = "file:" + request.getSession().getServletContext().getRealPath("/reportfiles/campaignStatusWise.prpt");

                } else if (reportFormat.equalsIgnoreCase("HTML")) {
                    reportParams.put(JRParameter.IS_IGNORE_PAGINATION, true);
                    JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, reportParams, conn);
                    //generateReportHtml(jasperPrint, request, response); // For HTML report
                }
            }
             else if (report != null & reportName.equals("CashFlow")) {
               if (reportFormat.equalsIgnoreCase("PDF")) {
                    generateReportPDF(reportName, response, reportParams, jasperReport, conn);
                } else if (reportFormat.equalsIgnoreCase("EXCEL")) {
                    generateReportExcel(reportName, response, reportParams, jasperReport, conn);

                } else if (reportFormat.equalsIgnoreCase("CSV")) {
                    reportPath = "file:" + request.getSession().getServletContext().getRealPath("/reportfiles/campaignStatusWise.prpt");

                } else if (reportFormat.equalsIgnoreCase("HTML")) {
                    reportParams.put(JRParameter.IS_IGNORE_PAGINATION, true);
                    JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, reportParams, conn);
                    //generateReportHtml(jasperPrint, request, response); // For HTML report
                }
            }
                
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(ReportDetailsController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            conn.close();
        }

    }

    private void generateReportPDF(String reportName, HttpServletResponse resp, Map parameters, JasperReport jasperReport, Connection conn) throws JRException, NamingException, SQLException, IOException {
        byte[] bytes = null;
        bytes = JasperRunManager.runReportToPdf(jasperReport, parameters, conn);
        resp.reset();
        resp.resetBuffer();
        resp.setContentType("application/pdf");
        resp.setHeader("cache-control", "no-cache");
        resp.setHeader("Content-disposition", "attachment;filename=\"" + reportName + ".pdf" + "\"");
        resp.setContentLength(bytes.length);
        ServletOutputStream ouputStream = resp.getOutputStream();
        ouputStream.write(bytes, 0, bytes.length);
        ouputStream.flush();
        ouputStream.close();
    }

    private static JasperReport getCompiledFile(String fileName, HttpServletRequest request) throws JRException {
        //  System.out.println("path " + request.getSession().getServletContext().getRealPath("/jasper/" + fileName + ".jasper"));
        File reportFile = new File(request.getSession().getServletContext().getRealPath("/jasper/" + fileName + ".jasper"));

        if (!reportFile.exists()) {
            JasperCompileManager.compileReportToFile(request.getSession().getServletContext().getRealPath("/jasper/" + fileName + ".jrxml"), request.getSession().getServletContext().getRealPath("/jasper/" + fileName + ".jrxml"));
        }
        //JRLoader.loadObject( reportFile.getAbsolutePath())
//JasperReport jasperReport = (JasperReport)JRLoader.loadObject(reportFile);
         JasperReport jasperReport =(JasperReport)JRLoader.loadObjectFromFile(reportFile.getPath());
       // JasperReport jasperReport = (JasperReport) JRLoader.loadObject(reportFile.getPath());

        return jasperReport;

    }

    private void generateReportExcel(String reportName, HttpServletResponse resp, Map parameters, JasperReport jasperReport, Connection conn) throws JRException, NamingException, SQLException, IOException {
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, conn);
        byte[] bytes = null;
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        JRXlsExporter exporterXls = new JRXlsExporter();
        ServletOutputStream ouputStream = resp.getOutputStream();
        exporterXls.setParameter(JRXlsExporterParameter.JASPER_PRINT, jasperPrint);
        //exporterXls.setParameters(parameters);
        exporterXls.setParameter(JRXlsExporterParameter.OUTPUT_STREAM, output);
        exporterXls.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET, Boolean.TRUE);
        exporterXls.setParameter(JRXlsExporterParameter.IS_DETECT_CELL_TYPE, Boolean.TRUE);
        exporterXls.exportReport();
        resp.reset();
        resp.resetBuffer();
        resp.setContentType("application/excel");
        resp.setHeader("cache-control", "no-cache");
        resp.setHeader("Content-disposition", "attachment;filename=\"" + reportName + " " + new Date() + ".xls" + "\"");
        ouputStream.write(output.toByteArray(), 0, output.toByteArray().length);
        ouputStream.flush();
        ouputStream.close();

    }


}
