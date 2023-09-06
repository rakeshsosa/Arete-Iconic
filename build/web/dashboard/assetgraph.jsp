 
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
<!--        <script src="canvasjs.min.js" type="text/javascript"></script>
        <script src="angular.min.js" type="text/javascript"></script>-->
        <title>JSP Page</title>
    </head>
    <body>
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="assetStyle">
                <div class="x_title ">
                    <h3>Property Management</h3>
                </div>

                <c:choose>
                    <c:when test="${assets ne 0 || subassets ne 0 || accessories ne 0 || vacant ne 0 || req ne 0 || poprder ne 0 }">
                        <div id="chartContainer1" style="height: 280px; width: 100%;"></div>
                    </c:when>
                    <c:otherwise>                                                    
                        <div id="chartContainer" style="height: 280px; width: 100%;"></div>
                    </c:otherwise>        
                </c:choose>      

<!--                <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>-->
                <script>
                    $(document).ready(function () {

                        var chart = new CanvasJS.Chart("chartContainer1", {
                            animationEnabled: true,
                            title: {
                                //	text: "Email Categories",
                                horizontalAlign: "left"
                            }, legend: {
                                verticalAlign: "center",
                                horizontalAlign: "right"
                            },
                            data: [{
                                    type: "doughnut",
                                    //                                        startAngle: 60,
                                    //innerRadius: 60,
                                    showInLegend: true,
                                    toolTipContent: "{label1}-{y}(#percent%)",
                                    dataPoints: [
                                        {y: ${assets}, label1: "Total Properties", link: "../assets/assetsDetailsList.htm", legendText: "{label1}-{y}(#percent%)"},
                                        {y: ${subassets}, label1: "Total Flats", link: "../assets/subAssetsDetailsList.htm", legendText: "{label1}-{y}(#percent%)"},
                                        {y: ${accessories}, label1: "Total Accessories", link: "../master/itemMasterList.htm", legendText: "{label1}-{y}(#percent%)"},
                                        {y: ${vacant}, label1: "Total Vacant Flats", link: "../assets/subAssetsDetailsList.htm?status=Vacant", legendText: "{label1}-{y}(#percent%)"},
                                        {y: ${req}, label1: "Total Requisitions", link: "../purchase/purchaseRequiList.htm", legendText: "{label1}-{y}(#percent%)"},
                                        {y: ${poprder}, label1: "Total Purchase Orders", link: "../purchase/poList.htm", legendText: "{label1}-{y}(#percent%)"}
                                    ]
                                }]
                        });
                        chart.options.data[0].click = function (e) {
                            var dataSeries = e.dataSeries;
                            var dataPoint = e.dataPoint;
                            var dataPointIndex = e.dataPointIndex;

                            if (!dataPoint.exploded)
                                window.location.assign(dataPoint.link);

                            for (var i = 0; i < dataSeries.dataPoints.length; i++) {
                                if (i === dataPointIndex) {
                                    continue;
                                }

                                dataSeries.dataPoints[i].exploded = false;
                            }
                        };
                        chart.render();

                    });
                </script>
                <script>
                    NProgress.done();
                </script>

            </div>
        </div>

    </body>
</html>
