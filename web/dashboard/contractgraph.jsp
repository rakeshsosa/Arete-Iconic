 
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
<!--        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.js"></script>-->
<!--        <script src="canvasjs.min.js" type="text/javascript"></script>-->
        <title>JSP Page</title>
    </head>
    <body>

        <div class=" col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="contractStyle">  
                <div class="x_title ">
                    <h3>Contract Management</h3>
                </div>

                <c:choose>
                    <c:when test="${cont ne 0 || insurance ne 0 || expcnt ne 0 || rejcnt ne 0 || renew ne 0 || tobapprove ne 0 }">
                        <div id="chartContainer4" style="height: 280px; width:100%;" ></div>
                    </c:when>
                    <c:otherwise>                                                    
                        <div id="chartContainer" style="height: 280px; width: 100%;"></div>
                    </c:otherwise>        
                </c:choose>     

                <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
                <script>
                    $(document).ready(function () {

                        var chart = new CanvasJS.Chart("chartContainer4", {
                            animationEnabled: true,
                            title: {
                                //	text: "Email Categories",
                                horizontalAlign: "left",
                                //                                    showDataLabels: true,
                                //                                    legend: { show:true, location: 'e' }
                            },
                            legend: {
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
                                        {y: ${cont}, label1: "Total Contracts", link: "../insurance/contractCreationList.htm", legendText: "Total Contracts-{y}(#percent%)"},
                                        {y: ${insurance}, label1: "Total Insurances", link: "../insurance/insuranceDetailsList.htm", legendText: "{label1}-{y}(#percent%)"},
                                        {y: ${expcnt}, label1: "Expired Contracts", link: "../insurance/expiredContractList.htm", legendText: "{label1}-{y}(#percent%)"},
                                        {y: ${rejcnt}, label1: "Rejected Contracts", link: "../insurance/rejectedContractList.htm", legendText: "{label1}-{y}(#percent%)"},
                                        {y: ${renew}, label1: "Approved Contracts", link: "../insurance/approvedContraList.htm", legendText: "{label1}-{y}(#percent%)"},
                                        {y: ${tobapprove}, label1: "Contracts To Be Approved", link: "../insurance/contractCreationList.htm?status=Contract Created", legendText: "{label1}-{y}(#percent%)"}
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
