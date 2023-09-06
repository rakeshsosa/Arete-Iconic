<%-- 
    Document   : tenant1
    Created on : 21 May, 2018, 5:36:26 PM
    Author     : ebs-sdd10
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
            <div class="x_title">
                <h3>Tenant Management</h3>
            </div>


            <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                <div class="left"></div>
                <a href="../serviceReq/serviceRequestList1.htm" style="color: #000">
                    <div class="right">
                        <span class="count_top"><i class="fa fa-clock-o"></i> Total Services</span>
                        <div class="count purple">${service[0]}</div>
                        <span class="count_bottom"></span>
                    </div>
                </a>
            </div>


            <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                <div class="left"></div>
                <a href="../tenant/billPaymentList1.htm" style="color: #000">
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
                    <a href="../tenantPortal/tenantDetailList.htm" style="color: #000">
                        <div class="right">
                            <span class="count_top"><i class="fa fa-user"></i> Pending Approval</span>
                            <div class="count purple">${tenant[0]}</div>
                        <span class="count_bottom"></span>
                    </div>
                </a>
            </div>
<!--            <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                <div class="left"></div>
                <a href="../tenant/billPaymentList1.htm?chequeType=PDC" style="color: #000">
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
                    <a href="../tenant/billPaymentList1.htm" style="color: #000">
                        <div class="right">
                            <span class="count_top"><i class="fa fa-user"></i> Total Advance Dues</span>
                        <c:if test="${advdue[0] eq null}"><div class="count green">0</div></c:if>
                        <c:if test="${advdue[0] ne null}">
                            <div class="count green"><fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${advdue[0]}" /></div></c:if>
                            <span class="count_bottom"></span>
                        </div>
                    </a>
                </div>-->
            </div>
            <p>&nbsp</p> 
            <p>&nbsp</p> 
            <p>&nbsp</p> 
            <p>&nbsp</p> 
            <div class="sortable row-fluid">
                <div class="box" style="width: 1000px;height: 200px;float: right; background-color:#c7e4e6">
                    <div class="box-header well" data-original-title style="background-color: #64C7CC;height: 53px;">
                        <h2>Notice</h2>
                    </div>

                    <div class="box-content">
                        <marquee class="marquee_code" direction="up" behavior="scroll"  onmouseover="this.stop();" onmouseout="this.start();" scrollamount="2">
                            <ul>
                                <li>Cleaning of pool and maintenance within the contract period can help new pool owners ensure of how to keep water clean. </li>
                                <li>A plumbing maintenance agreement should clarify the basics of what facilities are to be maintained and how payment will work for any subsequent maintenance.</li>
                                <li>White wash maintenance used to maintain the longevity of the interior and exterior of a wood project and used for stain resistant.</li>
                                <li>Property maintenance managers are responsible for keeping commercial and residential buildings cleaned and maintained.</li>
                                <li>Property maintenance includes program such as Building Inspections,carpentry,Concrete Finishing,Construction Site Management,Power Transmission installers,Electrician Facilities Management,House Painting and Wallpaper,Metal Building Assembly,Pipe Fitting and Well Drilling.</li>
                            </ul>
                        </marquee>
                    </div>
                    <!--</a>-->
                    <!--                <a   class="well span3 top-block advcls" style="height: 200px;">
                                        <div class="divcol">Salary</div>
                                        <hr class="hrmod1">
                                        <marquee class="marquee_code" direction="up" behavior="scroll" onmouseover="this.stop();" onmouseout="this.start();" scrollamount="4">
                    
                                            <ul>
                                                <li>Notification regarding reservation of vacancies to Hyderbad Karnataka Region. </li>
                                                <li>List of empanelled vendors for Networking.</li>
                                                <li>Signing of MOU between KEONICS and NEC Japan.</li>
                                                <li>Proud Moments of KEONICS :Presenting Dividend Cheque to Honorable Chief Minister of Karnataka for the year 2014-15.</li>
                                                <li>Inviting Franchisee for High end Trg & ESDC Trg.</li>
                                                <li>Proposed construction of Keonics Bhavan.</li>
                                                <li>Honorable speaker inaugurates computer program.</li>
                                                <li>Chief Minister's Rathna Award received by KEONICS for Excellent performance for the year 2013-14 . </li>
                                            </ul>
                                            <hr class="hrmod">
                                        </marquee>
                    
                                    </a>-->

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

        <!--</div>-->
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
