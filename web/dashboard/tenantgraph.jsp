
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
<!--        <script src="canvasjs.min.js" type="text/javascript"></script>-->
        <title>JSP Page</title>
    </head>
    <body>


        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="tenantStyle"> 
                <div class="x_title" >
                    <h3>Tenant Management</h3>
                </div>

                <c:choose>
                    <c:when test="${tenants ne '0' || service ne '0' || mati ne '0' || rentdue ne '0' || servdue ne '0' || advdue ne '0' }">
                        <div id="chartContainer5"style="height: 280px; width: 100%;" ></div>
                    </c:when>
                    <c:otherwise>                                                    
                        <div id="chartContainer" style="height: 280px; width: 100%;"></div>
                    </c:otherwise>        
                </c:choose>                   
                <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

                <script>
                    $(document).ready(function () {

                        var chart = new CanvasJS.Chart("chartContainer5", {
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
                                         {y: ${tenants}, label1: "No. of Tenants", link: "../tenant/tenantDetailsList.htm", legendText: "{label1}-{y}(#percent%)"},
                                         {y: ${service}, label1: "Total Services", link: "../serviceReq/serviceRequestList.htm", legendText: "{label1}-{y}(#percent%)"},
                                         {y: ${mati}, label1: "Approved Material Issue", link: "../serviceReq/materialIssueList1.htm", legendText: "{label1}-{y}(#percent%)"},
                                         {y: ${rentdue}, label1: "No. of PDC Cheques", link: "../tenant/billPaymentList.htm?chequeType=PDC", legendText: "{label1}-{y}(#percent%)"},
                                         {y: ${servdue}, label1: "Total Service Dues", link: "../tenant/billPaymentList.htm", legendText: "{label1}-{y}(#percent%)"},
                                         {y: ${advdue}, label1: "Total Advance Dues", link: "../tenant/billPaymentList.htm", legendText: "{label1}-{y}(#percent%)"}
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
