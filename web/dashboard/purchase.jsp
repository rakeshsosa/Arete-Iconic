
<%-- 
    Document   : crm
    Created on : Jul 13, 2016, 6:51:23 PM
    Author     : EBS02
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>-->
        <!--<script src="gstatic/loader.js" type="text/javascript"></script>-->
        <link href="../dashboard/dashboardstyle.css" rel="stylesheet" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <div class="x_title mt-3">
                <h3><b>Purchase Management</b></h3>   
            </div>

            <div class="row tile_count">
                <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                    <div class="left"></div>
                    <a href="../master/supplierList.htm?fromDate=${fromDate}&toDate=${toDate}" style="color: #000">
                        <div class="right">
                            <span class="count_top"><i class="fa fa-user"></i> Total Supplier</span>
                            <div class="count blue" style="margin-top:55px;">${nsupplier[0]}</div>
                            <span class="count_bottom"></span>
                        </div>
                    </a>
                </div>
                <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                    <div class="left"></div>
                    <a href="../purchase/pendingPOList.htm?fromDate=${fromDate}&toDate=${toDate}" style="color: #000">
                        <div class="right">
                            <span class="count_top"><i class="fa fa-clock-o"></i> Pending PO</span>
                            <div class="count purple" style="margin-top:55px;">${pppo[0]}</div>
                            <span class="count_bottom"></span>
                        </div>
                    </a>
                </div>
                <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                    <div class="left"></div>
                    <a href="../purchase/purchaseRequiList.htm?fromDate=${fromDate}&toDate=${toDate}" style="color: #000">
                        <div class="right">
                            <span class="count_top"><i class="fa fa-user"></i> Total Pending Request</span>
                            <div class="count green">${prequest[0]}</div>
                            <span class="count_bottom"></span>

                        </div>
                    </a>
                </div>
                <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                    <div class="left"></div>
                    <a href="../purchase/supplierEnqList.htm?fromDate=${fromDate}&toDate=${toDate}" style="color: #000">
                        <div class="right">
                            <span class="count_top"><i class="fa fa-user"></i> Total Enquiry</span>
                            <div class="count blue" style="margin-top:55px;">${enquiry[0]}</div>
                            <span class="count_bottom"></span>
                        </div>
                    </a>
                </div>
                <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                    <div class="left"></div>
                    <a href="../purchase/approvedQuotList.htm?fromDate=${fromDate}&toDate=${toDate}" style="color: #000">
                        <div class="right">
                            <span class="count_top"><i class="fa fa-user"></i> Total Quotation</span>
                            <div class="count purple" style="margin-top:55px;">${quote[0]}</div>
                            <span class="count_bottom"></span>
                        </div>
                    </a>
                </div>
                            <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                    <div class="left"></div>
                    <a href="../purchase/totpurchaseRequiList.htm?fromDate=${fromDate}&toDate=${toDate}&status=total" style="color: #000">
                        <div class="right">
                            <span class="count_top"><i class="fa fa-user"></i> Total Requisitions</span>
                            <div class="count purple">${req[0]}</div>
                            <span class="count_bottom"></span>
                        </div>
                    </a>
                </div>
                <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                    <div class="left"></div>
                    <a href="../purchase/poList.htm?fromDate=${fromDate}&toDate=${toDate}" style="color: #000">
                        <div class="right">
                            <span class="count_top"><i class="fa fa-user"></i> Total Purchase Orders</span>
                            <div class="count green">${poprder[0]}</div>
                            <span class="count_bottom"></span>
                        </div>
                    </a>
                </div>

                <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                    <div class="left"></div>
                    <a href="../purchase/approvedPOList.htm?fromDate=${fromDate}&toDate=${toDate}" style="color: #000">
                        <div class="right">
                            <span class="count_top"><i class="fa fa-user"></i> Total Approved Purchase Order</span>
                            <div class="count green">${purchase[0]}</div>
                            <span class="count_bottom"></span>
                        </div>
                    </a>
                </div>
                            

            </div>
            <!-- <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>-->
            <!--<div id="donutchart4" style="height: 280px; width: 80%;padding-top:0px;padding-bottom:0px"></div>
                <script type="text/javascript">
                  google.charts.load("current", {packages:["corechart"]});
                  google.charts.setOnLoadCallback(drawChart);
                  function drawChart() {
                    var data = google.visualization.arrayToDataTable([
                      ['Task','link','number'],
                      ['Total Campaigns','../CRM/campaignList.htm',${campaign[0]}],
                      ['Total Leads','../Lead/LeadManagementListNew.htm',${tlead[0]}],
                      ['Total Rent Quotes','../CRM/quoteList.htm',${rentquote[0]}],
                      ['Total Complaints','../CRM/complaintList.htm',${complaint[0]}],
                      ['Total Customer Feedback','../CRM/customerfeedbackList.htm',${feedback[0]}],
                      ['Total Vacated Tenants','../CRM/vacatingList.htm',${vacate[0]}]
                    ]);
                    var view = new google.visualization.DataView(data);
                    view.setColumns([0, 2]);
            
                    var options = {
            //          title: 'Correspondence Management',
                      pieHole: 0.5,
                    };
            
                    var chart = new google.visualization.PieChart(document.getElementById('donutchart4'));
                    chart.draw(view, options);
                     var selectHandler = function(e) {
                     window.location = data.getValue(chart.getSelection()[0]['row'], 1 );
                    }
            
                    // Add our selection handler.
                    google.visualization.events.addListener(chart, 'select', selectHandler);
                  }
                  
                </script>      -->

        </div>
    </body>
</html>
