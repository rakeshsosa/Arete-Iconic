<%-- 
    Document   : occupancyPropertygraph
    Created on : 2 Jan, 2019, 7:20:31 PM
    Author     : ebs-sdd41
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
                    <h3>Occupancy Chart: ${propName}</h3>
                    <input type="hidden" id="propName" name="propName" value="${propName}"/>
                </div>

                <c:choose>
                    <c:when test="${totalOccupiedFlats ne 0 || totVacantFlats ne 0 || totalUnListedFlats ne 0 }">
                        <div id="chartContainer1" style="height: 280px; width: 100%;"></div>
                    </c:when>
                    <c:otherwise>                                                    
                        <div id="chartContainer" style="height: 280px; width: 100%;"></div>
                    </c:otherwise>        
                </c:choose>      

                <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
                <script>
                    $(document).ready(function () {

                        var propName = $("#propName").val();

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
                                        {y: ${totalOccupiedFlats}, label1: "Total Occupied", link: "../assets/subAssetsStatusDetailsList.htm?propName=${propName}&fromDate=${fromDate}&toDate=${toDate}&status=Occupied", legendText: "{label1}-{y}(#percent%)"},
                                        {y: ${totVacantFlats}, label1: "Total Vacant Flats", link: "../assets/subAssetsStatusDetailsList.htm?propName=${propName}&fromDate=${fromDate}&toDate=${toDate}&status=Vacant", legendText: "{label1}-{y}(#percent%)"}
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
