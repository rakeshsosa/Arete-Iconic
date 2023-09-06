<%-- 
    Document   : dashboard
    Created on : Feb 15, 2016, 3:20:00 PM
    Author     : Sudhanshu
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="dashboard.css" rel="stylesheet" type="text/css"/>
        <title>arête Assets Management</title>

    </head>
    <script src="canvasjs.min.js" type="text/javascript"></script>

    

        <div class="container body">


            <div class="main_container">


                <jsp:include page="../login/menu.htm"/>

                <!-- page content -->
                <div class="right_col" role="main">
                    <c:forEach items="${deptlist}" var="dept">

                        <c:if test="${dept eq 'CRM'}" >
                            <jsp:include page="../dashboard/crm.htm"/>
                        </c:if>
                        <c:if test="${dept eq 'Sales Management'}">
                            <jsp:include page="../dashboard/sales.htm"/>
                        </c:if>
                        <c:if test="${dept eq 'Purchase Management'}">
                            <jsp:include page="../dashboard/purchase.htm"/>
                        </c:if>
                        <c:if test="${dept eq 'Inventory Management'}">
                            <jsp:include page="../dashboard/inventory.htm"/>
                        </c:if>
                        <c:if test="${dept eq 'Menu Engineering'}">
                            <jsp:include page="../dashboard/menu.htm"/>
                        </c:if>
                        <c:if test="${dept eq 'HRMS'}">
                            <jsp:include page="../dashboard/hrms.htm"/>
                        </c:if>
                    </c:forEach>


                    <!-- top tiles -->

                    <!-- /top tiles -->




                    <!-- footer content -->


                    <!-- /footer content -->
                </div>
                <!-- /page content -->

            </div>

        </div>



        <div id="custom_notifications" class="custom-notifications dsp_none">
            <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
            </ul>
            <div class="clearfix"></div>
            <div id="notif-group" class="tabbed_notifications"></div>
        </div>









        <script>
            NProgress.done();
        </script>
<!--        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>-->
        <!-- /datepicker -->
        <!-- /footer content -->
    

</html>

