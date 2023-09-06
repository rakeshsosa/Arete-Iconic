
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.js"></script>

<!--        <script src="canvasjs.min.js" type="text/javascript"></script>
        <script src="angular.min.js" type="text/javascript"></script>-->
        <title>JSP Page</title>
    </head>
    <body>
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="inventoryStyle">
                <div class="x_title ">
                    <h3>Inventory Management</h3>
                </div>

                <c:choose>
                    <c:when test="${preceipt ne '0' || inspection ne '0' || Qinspection ne '0' || tgrn ne '0' || invlist ne '0' || mreturn ne '0' }">
                        <div id="chartContainer3" style="height: 280px; width: 100%;"></div>
                    </c:when>

                    <c:otherwise>                                                    
                        <div id="chartContainer" style="height: 280px; width: 100%;"></div>
                    </c:otherwise>        
                </c:choose>      

                <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
                <script>
                    $(document).ready(function () {

                        var chart = new CanvasJS.Chart("chartContainer3", {
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
                                        {y: ${preceipt}, label1: "Pending Receipt", link: "../quality/receiptList.htm", legendText: "{label1}-{y}(#percent%)"},
                                        {y: ${inspection}, label1: "Pending Inspection", link: "../quality/qaInspectionList.htm", legendText: "{label1}-{y}(#percent%)"},
                                        {y: ${Qinspection}, label1: "Pending Quality Inspection", link: "../quality/qualityInspectionAppList.htm", legendText: "{label1}-{y}(#percent%)"},
                                        {y: ${tgrn}, label1: "Total GRN's", link: "../quality/grnList.htm", legendText: "{label1}-{y}(#percent%)"},
                                        {y: ${invlist}, label1: "Stock Quantity", link: "../quality/inventoryList.htm", legendText: "{label1}-{y}(#percent%)"},
                                        {y: ${mreturn}, label1: "Total Material Return", link: "../quality/materialReturnList.htm", legendText: "{label1}-{y}(#percent%)"}
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
