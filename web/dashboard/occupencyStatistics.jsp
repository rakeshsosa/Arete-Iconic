<%-- 
    Document   : occupancyStatistics
    Created on : 31 Dec, 2018, 6:20:31 PM
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

        <!--        <script src="../dashboard/gstatic/loader.js" type="text/javascript"></script>-->
        <script src="../dashboard/Chart.min.js" type="text/javascript"></script>
        <script src="../dashboard/jquery-3.1.1.min.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
<!--        <div class="x_title">
            <h3>Occupancy Statistics</h3>
        </div>-->
        <div>

            <!--            <hr align="left" width="25%" style="color:black">-->
           <%--<c:forEach items="${propName}" var="type">
                <c:set value="${type}" var="propName"/>
           </c:forEach>--%>
                <div class="x_title">
                    <h3>Occupancy Statistics: ${propName}</h3>
                    <input type="hidden" id="propName" name="propName" value="${propName}"/>
                </div>
                <div class="row tile_count">

                    <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                        <input type="hidden" name="propName" id="propName" value="${propName}"/>
                        <div class="left"></div>
                        <a href="../assets/subAssetsStatusDetailsList.htm?propName=${propName}&fromDate=${fromDate}&toDate=${toDate}&status=" style="color: #000">
                            <div class="right">
                                <span class="count_top"><i class="fa fa-clock-o"></i> Total Flats</span>
                                <%--<c:forEach var="map" items="${totFlats}">
                                    <c:if test="${map.key == propName}">--%>
                                            <div class="count purple">${totFlats[0]}</div>
                                            <span class="count_bottom"></span>
                                    <%--</c:if>
                                </c:forEach>--%>

                            </div>
                        </a>
                    </div>

                    <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                        <div class="left"></div>
                        <a href="../assets/subAssetsStatusDetailsList.htm?propName=${propName}&fromDate=${fromDate}&toDate=${toDate}&status=Vacant" style="color: #000">
                            <div class="right">
                                <span class="count_top"><i class="fa fa-user"></i> Total Vacant Flats</span>
                                <%--<c:forEach var="map" items="${totVacantFlats}">
                                    <c:if test="${map.key == propName}">--%>
                                            <div class="count blue">${totVacantFlats[0]}</div>
                                            <span class="count_bottom"></span>
                                    <%--</c:if>
                                </c:forEach>--%>

                            </div>
                        </a>
                    </div>
                    <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                        <div class="left"></div>
                        <a href="../assets/subAssetsStatusDetailsList.htm?propName=${propName}&fromDate=${fromDate}&toDate=${toDate}&status=Occupied" style="color: #000">
                            <div class="right">
                                <span class="count_top"><i class="fa fa-user"></i> Total Occupied Flats</span>
                                <%--<c:forEach var="map" items="${totalOccupiedFlats}">
                                    <c:if test="${map.key == propName}">--%>
                                            <div class="count green">${totalOccupiedFlats[0]}</div>
                                            <span class="count_bottom"></span>
                                    <%--</c:if>
                                </c:forEach>--%>


                            </div>
                        </a>
                    </div>
<!--                    <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                        <div class="left"></div>
                        <a href="../assets/subAssetsStatusDetailsList.htm?status=Inactive" style="color: #000">
                            <div class="right">
                                <span class="count_top"><i class="fa fa-user"></i> Total Un-listed Flats</span>
                                <%--<c:forEach var="map" items="${totalUnListedFlats}">
                                    <c:if test="${map.key == propName}">
                                            <div class="count purple">${totalUnListedFlats[0]}</div>
                                            <span class="count_bottom"></span>--%>
                                    <%--</c:if>
                                </c:forEach>--%>

                            </div>
                        </a>
                    </div>-->


                </div>
            <%--</c:forEach>--%>


        </div>
    </body>
</html>
