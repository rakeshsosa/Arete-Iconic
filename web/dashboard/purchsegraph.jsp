
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
            <div class="purchseStyle"> 
                <div class="x_title">
                    <h3>Purchase Management</h3>
                </div>

                <c:choose>
                    <c:when test="${nsupplier ne 0 || pppo ne 0 || prequest ne 0 || enquiry ne 0 || quote ne 0 || purchase ne 0 }">
                        <div id="chartContainer2"style="height: 280px; width: 100%;" ></div>
                    </c:when>
                    <c:otherwise>                                                    
                        <div id="chartContainer" style="height: 280px; width: 100%;"></div>
                    </c:otherwise>        
                </c:choose>    

                <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

                <script>
                    $(document).ready(function () {

                        var chart = new CanvasJS.Chart("chartContainer2", {
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
                                        {y: ${nsupplier}, label1: "Total Supplier", link: "../master/supplierList.htm", legendText: "{label1}-{y}(#percent%)"},
                                        {y: ${pppo}, label1: "Pending PO", link: "../purchase/poList.htm", legendText: "{label1}-{y}(#percent%)"},
                                        {y: ${prequest}, label1: "Total Pending Request", link: "../purchase/purchaseRequiList.htm", legendText: "{label1}-{y}(#percent%)"},
                                        {y: ${enquiry}, label1: "Total Enquiry", link: "../purchase/supplierEnqList.htm", legendText: "{label1}-{y}(#percent%)"},
                                        {y: ${quote}, label1: "Total Quotation", link: "../purchase/approvedQuotList.htm", legendText: "{label1}-{y}(#percent%)"},
                                        {y: ${purchase}, label1: "Total Purchase Order", link: "../purchase/approvedPOList.htm", legendText: "{label1}-{y}(#percent%)"}
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
