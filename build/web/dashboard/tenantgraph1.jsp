<%-- 
    Document   : tenantgraph1
    Created on : 25 May, 2018, 12:51:54 PM
    Author     : ebs
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
<!--        <script src="canvasjs.min.js" type="text/javascript"></script>-->
        <title>JSP Page</title>
    </head>
    <body>


        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="tenantStyle"> 
                <div class="x_title" >
                    <h3>Tenant Management</h3>
                </div>

                <div id="chartContainer7"style="height: 280px; width: 100%;" ></div>

                <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

                <script>
                    $(document).ready(function () {

                        var chart = new CanvasJS.Chart("chartContainer7", {
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
                                    toolTipContent: "<b>{label1}:</b> {y} (#percent%)",
                                    dataPoints: [
                                        {y: ${tenant}, label1: "Pending Approval", link: "../tenantPortal/tenantDetailList.htm", legendText: "{label1}-{y}(#percent%)"},
                                        {y: ${service}, label1: "Total Services", link: "../serviceReq/serviceRequestList1.htm", legendText: "{label1}-{y}(#percent%)"},
                                        {y: ${servdue}, label1: "Total Service Dues", link: "../tenant/billPaymentList1.htm", legendText: "{label1}-{y}(#percent%)"},
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
