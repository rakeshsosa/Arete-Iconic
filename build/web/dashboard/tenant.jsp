

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
        <link href="../dashboard/dashboardstyle.css" rel="stylesheet" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <div class="x_title mt-3">
                <h3><b>Tenant Management</b></h3>
            </div>

            <div class="row tile_count">
                <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                    <div class="left"></div>
                    <a href="../tenant/tenantDetailsList.htm?fromDate=${fromDate}&toDate=${toDate}" style="color: #000">
                        <div class="right">
                            <span class="count_top"><i class="fa fa-user"></i> No. of Tenants</span>
                            <div class="count blue" style="margin-top:55px;">${tenants[0]}</div>
                            <span class="count_bottom"></span>
                        </div>
                    </a>
                </div>
                <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                    <div class="left"></div>
                    <a href="../serviceReq/serviceRequestList.htm?fromDate=${fromDate}&toDate=${toDate}" style="color: #000">
                        <div class="right">
                            <span class="count_top"><i class="fa fa-clock-o"></i> Total Services</span>
                            <div class="count purple" style="margin-top:55px;">${service[0]}</div>
                            <span class="count_bottom"></span>
                        </div>
                    </a>
                </div>
                <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                    <div class="left"></div>
                    <a href="../serviceReq/materialIssueList1.htm?fromDate=${fromDate}&toDate=${toDate}" style="color: #000">
                        <div class="right">
                            <span class="count_top"><i class="fa fa-user"></i> Approved Material Issue</span>
                            <div class="count green">${mati[0]}</div>
                            <span class="count_bottom"></span>

                        </div>
                    </a>
                </div>
                <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                    <div class="left"></div>
                    <a href="../tenant/billPaymentList.htm?fromDate=${fromDate}&toDate=${toDate}&chequeType=PDC" style="color: #000">
                        <div class="right">
                            <span class="count_top"><i class="fa fa-user"></i> No. of PDC Cheques </span>
                            <c:if test="${rentdue[0] eq null}"><div class="count blue">0</div></c:if>
                            <c:if test="${rentdue[0] ne null}">
                                <div class="count blue"><fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${rentdue[0]}" /></div></c:if>
                                <span class="count_bottom"></span>
                            </div>
                        </a>
                    </div>
                    <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                        <div class="left"></div>
                        <a href="../tenant/billPaymentList.htm?fromDate=${fromDate}&toDate=${toDate}&chequeType=Service" style="color: #000">
                            <div class="right">
                                <span class="count_top"><i class="fa fa-user"></i> Total Service Dues</span>
                            <c:if test="${servdue[0] eq null}"><div class="count purple">0</div></c:if>
                            <c:if test="${servdue[0] ne null}">
                                <div class="count purple"><fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${servdue[0]}" /></div></c:if>
                                <span class="count_bottom"></span>
                            </div>
                        </a>
                    </div>
                    <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                        <div class="left"></div>
                        <a href="../tenant/billPaymentList.htm?fromDate=${fromDate}&toDate=${toDate}&chequeType=Advance" style="color: #000">
                            <div class="right">
                                <span class="count_top"><i class="fa fa-user"></i> Total Advance Dues</span>
                            <c:if test="${advdue[0] eq null}"><div class="count green">0</div></c:if>
                            <c:if test="${advdue[0] ne null}">
                                <div class="count green"><fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${advdue[0]}" /></div></c:if>
                                <span class="count_bottom"></span>
                            </div>
                        </a>
                    </div>

                </div>
                <!--             <canvas id="pie" class="chart chart-pie"
                  chart-data="data" chart-labels="labels" chart-options="options">
                </canvas> -->
                <!--            <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>-->
                <!--<div id="donutchart3" style="height: 280px; width: 80%;padding-top:0px;padding-bottom:0px">      
                            <script type="text/javascript">
                                google.charts.load("current", {packages: ["corechart"]});
                                google.charts.setOnLoadCallback(drawChart);
                                function drawChart() {
                                    var data = google.visualization.arrayToDataTable([
                                        ['Task', 'link', 'Hours per Day'],
                                        ['No. of Tenants', '../tenant/tenantDetailsList.htm',${tenants[0]}],
                                        ['Total Services', '../serviceReq/serviceRequestList.htm',${service[0]}],
                                        ['Approved Material Issue', '../serviceReq/materialIssueList1.htm',${mati[0]}],
                                        ['No. of PDC Cheques', '../tenant/billPaymentList.htm?chequeType=PDC',${rentdue[0] ne null}],
                                        ['Total Service Dues', '../tenant/billPaymentList.htm',${servdue[0] ne null}],
                                        ['Total Advance Dues', '../tenant/billPaymentList.htm',${advdue[0] ne null}]
                                    ]);
                                    var view = new google.visualization.DataView(data);
                                    view.setColumns([0, 2]);
                
                                    var options = {
                //                        title: 'Tenant Management',
                                        pieHole: 0.5,
                                    };
                
                                    var chart = new google.visualization.PieChart(document.getElementById('donutchart3'));
                                    chart.draw(view, options);
                                    var selectHandler = function (e) {
                                        window.location = data.getValue(chart.getSelection()[0]['row'], 1);
                                    }
                
                                    // Add our selection handler.
                                    google.visualization.events.addListener(chart, 'select', selectHandler);
                                }
                
                        </script>      -->

        </div>

        <!--        <script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>-->
    </body>
</html>
