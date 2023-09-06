
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

        <!--        <script src="../dashboard/gstatic/loader.js" type="text/javascript"></script>-->
        <script src="../dashboard/Chart.min.js" type="text/javascript"></script>
        <script src="../dashboard/jquery-3.1.1.min.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <div class="x_title">
                <h3>Property Management</h3><hr>
            </div>
            <!--            <hr align="left" width="25%" style="color:black">-->
                    
          <div class="row">

            <!-- Sales Card -->
            <div class="col-xxl-4 col-md-3">
                <a href="../assets/assetsDetailsList.htm?fromDate=${fromDate}&toDate=${toDate}" style="color: #000">
                    <div class="card info-card sales-card">
                      <div class="card-body">
                        <h5 class="card-title">Total Properties</h5>

                        <div class="d-flex align-items-center">
                          <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                            <i class="bi bi-building"></i>
                          </div>
                          <div class="ps-3">
                            <h6>${assets[0]}</h6>
                          </div>
                        </div>
                      </div>
                    </div>
                    </a>
            </div><!-- End Sales Card -->

            <div class="col-xxl-4 col-md-3">
                <a href="../assets/subAssetsDetailsList.htm?fromDate=${fromDate}&toDate=${toDate}" style="color: #000">
                    <div class="card info-card sales-card">
                      <div class="card-body">
                        <h5 class="card-title">Total Flats</h5>

                        <div class="d-flex align-items-center">
                          <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                            <i class="bi bi-building"></i>
                          </div>
                          <div class="ps-3">
                            <h6>${subassets[0]}</h6>
                          </div>
                        </div>
                      </div>
                    </div>
                    </a>
            </div>
                          
            <div class="col-xxl-4 col-md-3">
                <a href="../master/itemMasterList.htm?fromDate=${fromDate}&toDate=${toDate}" style="color: #000">
                    <div class="card info-card sales-card">
                      <div class="card-body">
                        <h5 class="card-title">Total Accessories</h5>

                        <div class="d-flex align-items-center">
                          <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                            <i class="bi bi-building"></i>
                          </div>
                          <div class="ps-3">
                            <h6>${accessories[0]}</h6>
                          </div>
                        </div>
                      </div>
                    </div>
                    </a>
            </div>
                          
            <div class="col-xxl-4 col-md-3">
                <a href="../assets/subAssetsDetailsList.htm?fromDate=${fromDate}&toDate=${toDate}" style="color: #000">
                    <div class="card info-card sales-card">
                      <div class="card-body">
                        <h5 class="card-title">Total Vacant Flats</h5>

                        <div class="d-flex align-items-center">
                          <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                            <i class="bi bi-building"></i>
                          </div>
                          <div class="ps-3">
                            <h6>${vacant[0]}</h6>
                          </div>
                        </div>
                      </div>
                    </div>
                    </a>
            </div>              
                          
                          
          </div>
            <div class="row tile_count">
                
                
<!--                <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                    <div class="left"></div>
                    <a href="../purchase/purchaseRequiList.htm" style="color: #000">
                        <div class="right">
                            <span class="count_top"><i class="fa fa-user"></i> Total Requisitions</span>
                            <div class="count purple">${req[0]}</div>
                            <span class="count_bottom"></span>
                        </div>
                    </a>
                </div>
                <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                    <div class="left"></div>
                    <a href="../purchase/poList.htm" style="color: #000">
                        <div class="right">
                            <span class="count_top"><i class="fa fa-user"></i> Total Purchase Orders</span>
                            <div class="count green">${poprder[0]}</div>
                            <span class="count_bottom"></span>
                        </div>
                    </a>
                </div>-->

            </div>
            <!--             <div id="donutchart1" style="height: 280px; width: 80%;padding-top:0px;padding-bottom:0px;font-family:calibri,verdana"></div>  
                        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
                      <script src="loader.js" type="text/javascript"></script>
            <script src="gstatic/loader.js" type="text/javascript"></script>
                        <script type="text/javascript">
                            google.charts.load("current", {packages: ["corechart"]});
                            google.charts.setOnLoadCallback(drawChart);
                            function drawChart() {
                                var data = google.visualization.arrayToDataTable([
                                    ['Task', 'link', 'Hours per Day'],
                                    ["Total_Properties--{${(assets[0])/100}}", '../assets/assetsDetailsList.htm',${assets[0]}],
                                    ['Total Flats', '../assets/subAssetsDetailsList.htm',${subassets[0]}],
                                    ['Total Accessories', '../master/itemMasterList.htm',${accessories[0]}],
                                    ['Total Vacant_Flats', '../assets/subAssetsDetailsList.htm?status=Vacant', ${vacant[0]}],
                                    ['Total Requisitions', '../purchase/purchaseRequiList.htm',${req[0]}],
                                    ["Total_Purchase_Orders", '../purchase/poList.htm',${poprder[0]}]
                                ]);
                                var view = new google.visualization.DataView(data);
                                view.setColumns([0, 2]);
            
                                var options = {
            //                        title: 'Property Management',
                                    pieHole: 0.5,
                         g:{width:300,height:25},           
            rect:{width:300,height:25},
            text:{width:300,height:25}
              
                                };
            
            
                                var chart = new google.visualization.PieChart(document.getElementById('donutchart1'));
                                chart.draw(view, options);
                                var selectHandler = function (e) {
                                    window.location = data.getValue(chart.getSelection()[0]['row'], 1);
                                }
            
                                // Add our selection handler.
                                google.visualization.events.addListener(chart, 'select', selectHandler);
                            }
            
                        </script>      -->

        </div>
    </body>
</html>
