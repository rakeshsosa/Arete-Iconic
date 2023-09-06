
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
            <div class="crmStyle"> 
                <div class="x_title">
                    <h3>Correspondence Management</h3>
                </div>

                <c:choose>
                    <c:when test="${campaign2 ne 0 || tlead2 ne 0 || rentquote2 ne 0 || complaint2 ne 0 || feedback2 ne 0 || vacate2 ne 0 }">
                        <div id="chartContainer6"style="height: 280px; width: 100%;" ></div>
                    </c:when>
                    <c:otherwise>                                                    
                        <div id="chartContainer" style="height: 280px; width: 100%;"></div>
                    </c:otherwise>        
                </c:choose>  

                <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
                <script>
                    $(document).ready(function () {

                        var chart = new CanvasJS.Chart("chartContainer6", {
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
                                        {y: ${campaign2}, label1: "Total Campaigns", link: "../CRM/campaignList.htm", legendText: "{label1}-{y}(#percent%)"},
                                        {y: ${tlead2}, label1: "Total Leads", link: "../Lead/LeadManagementListNew.htm", legendText: "{label1}-{y}(#percent%)"},
                                        {y: ${rentquote2}, label1: "Total Rent Quotes", link: "../CRM/quoteList.htm", legendText: "{label1}-{y}(#percent%)"},
                                        {y: ${complaint2}, label1: "Total Complaints", link: "../CRM/complaintList.htm", legendText: "{label1}-{y}(#percent%)"},
                                        {y: ${feedback2}, label1: "Total Customer Feedback", link: "../CRM/customerfeedbackList.htm", legendText: "{label1}-{y}(#percent%)"},
                                        {y: ${vacate2}, label1: "Total Vacated Tenants", link: "../CRM/vacatingList.htm", legendText: "{label1}-{y}(#percent%)"}
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
