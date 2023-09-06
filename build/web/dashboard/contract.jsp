<%-- 
    Document   : contractgraph
    Created on : 19 Jan, 2018, 3:21:02 PM
    Author     : ebs05
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--        <script src="../common/Chart.js" type="text/javascript"></script>-->
        <!--        <script src="../common/angular-chart.js" type="text/javascript"></script>
                <script src="../common/angular-chart.min.js" type="text/javascript"></script>-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../dashboard/dashboardstyle.css" rel="stylesheet" type="text/css">
        <script src="canvasjs.min.js" type="text/javascript"></script>

        <title>JSP Page</title>
    </head>
    <body >
        <div>
            <div class="x_title mt-3">
                <h3><b>Contract Management</b></h3>
            </div>
            <!--                        <hr align="left" width="25%" style="color:black">-->

            <div class="row tile_count">
                <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                    <div class="left"></div>
                    <a href="../insurance/contractCreationList.htm?fromDate=${fromDate}&toDate=${toDate}" style="color: #000">
                        <div class="right">
                            <span class="count_top"><i class="fa fa-user"></i> Total Contracts</span>
                            <div class="count blue" style="margin-top:55px;">${cont[0]}</div>
                            <span class="count_bottom"></span>
                        </div>
                    </a>
                </div>
                <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                    <div class="left"></div>
                    <a href="../insurance/insuranceDetailsList.htm" style="color: #000">
                        <div class="right">
                            <span class="count_top"><i class="fa fa-clock-o"></i> Total Insurances</span>
                            <div class="count purple" style="margin-top:55px;">${insurance[0]}</div>
                            <span class="count_bottom"></span>
                        </div>
                    </a>
                </div>
                <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                    <div class="left"></div>
                    <a href="../insurance/expiredContractList.htm?fromDate=${fromDate}&toDate=${toDate}" style="color: #000">
                        <div class="right">
                            <span class="count_top"><i class="fa fa-user"></i> Expired Contracts</span>
                            <div class="count green">${expcnt[0]}</div>
                            <span class="count_bottom"></span>

                        </div>
                    </a>
                </div>
                <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                    <div class="left"></div>
                    <a href="../insurance/rejectedContractList.htm" style="color: #000">
                        <div class="right">
                            <span class="count_top"><i class="fa fa-user"></i> Rejected Contracts</span>
                            <div class="count blue">${rejcnt[0]}</div>
                            <span class="count_bottom"></span>
                        </div>
                    </a>
                </div>
                <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                    <div class="left"></div>
                    <a href="../insurance/approvedContraList.htm?fromDate=${fromDate}&toDate=${toDate}" style="color: #000">
                        <div class="right">
                            <span class="count_top"><i class="fa fa-user"></i> Approved Contracts</span>
                            <div class="count purple">${renew[0]}</div>
                            <span class="count_bottom"></span>
                        </div>
                    </a>
                </div>
                <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                    <div class="left"></div>
                    <a href="../insurance/contractCreationList.htm?fromDate=${fromDate}&toDate=${toDate}&status=Contract Created" style="color: #000">
                        <div class="right">
                            <span class="count_top"><i class="fa fa-user"></i> Contracts To Be Approved</span>
                            <div class="count green">${tobapprove[0]}</div>
                            <span class="count_bottom"></span>
                        </div>
                    </a>
                </div>

            </div>

            <!--            <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>-->
            <!--            <div id="donutchart2" style="height: 280px; width: 80%;padding-top:0px;padding-bottom:0px;"></div>
                        <script type="text/javascript">
                            google.charts.load("current", {packages: ["corechart"]});
                            google.charts.setOnLoadCallback(drawChart);
                            function drawChart() {
                                var data = google.visualization.arrayToDataTable([
                                    ['Task', 'link', 'number'],
                                    ['Total Contracts', '../insurance/contractCreationList.htm',${cont[0]}],
                                    ['Total Insurances', '../insurance/insuranceDetailsList.htm',${insurance[0]}],
                                    ['Expired Contracts', '../insurance/expiredContractList.htm', ${expcnt[0]}],
                                    ['Rejected Contracts', '../insurance/rejectedContractList.htm',${rejcnt[0]}],
                                    ['Approved Contracts', '../insurance/approvedContraList.htm',${renew[0]}],
                                    ['Contracts To Be Approved', '../insurance/contractCreationList.htm?status=Contract Created',${tobapprove[0]}]
                                ]);
                                var view = new google.visualization.DataView(data);
                                view.setColumns([0, 2]);
            
                                var options = {
            //                        title: 'Contract Management',
                                    pieHole: 0.5
            
                                };
            
                                var chart = new google.visualization.PieChart(document.getElementById('donutchart2'));
                                chart.draw(view, options);
                                var selectHandler = function (e) {
                                    window.location = data.getValue(chart.getSelection()[0]['row'], 1);
                                };
            
                                // Add our selection handler.
                                google.visualization.events.addListener(chart, 'select', selectHandler);
                            }
            
                        </script>      -->

        </div>

        <!--            <script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>-->

    </body>
</html>

