<%-- 
    Document   : dashboard
    Created on : Feb 15, 2016, 3:20:00 PM
    Author     : Sudhanshu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>arête Assets Management</title>

    </head>


    <body class="nav-md">

       <jsp:include page="../login/menu.htm" />


                        <main id="main" class="main">


                <section class="section">
                    <c:forEach items="${roleName}" var="user">
                        <c:if test="${user eq 'admin'}">
                            <c:forEach items="${deptlists}" var="dept">
                                <c:if test="${dept eq 'Property Management'}">
                                    <jsp:include page="../dashboard/asset.htm"/>
                                </c:if>
                                <c:if test="${dept eq 'Contract Management'}">
                                    <jsp:include page="../dashboard/contract.htm"/>
                                </c:if>
                                <c:if test="${dept eq 'Tenant Management'}">
                                    <jsp:include page="../dashboard/tenant.htm"/>
                                </c:if>
                                <c:if test="${dept eq 'Correspondence Management'}">
                                    <jsp:include page="../dashboard/crm.htm"/>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </c:forEach>

                    <c:forEach items="${roleName}" var="user">
                        <c:if test="${user eq 'Tenant'}">
                            <c:forEach items="${deptlists}" var="dept">
                                <c:if test="${dept eq 'Property Management'}">
                                    <jsp:include page="../dashboard/asset.htm"/>
                                </c:if>
                                <c:if test="${dept eq 'Contract Management'}">
                                    <jsp:include page="../dashboard/contract.htm"/>
                                </c:if>
                                <c:if test="${dept eq 'Tenant Management'}">
                                    <jsp:include page="../dashboard/tenant1.htm"/>
                                </c:if>
                                <c:if test="${dept eq 'Correspondence Management'}">
                                    <jsp:include page="../dashboard/crm.htm"/>
                                </c:if>

                            </c:forEach>
                        </c:if>
                    </c:forEach>

                    <!-- top tiles -->

                    <!-- /top tiles -->




                    <!-- footer content -->


                    <!-- /footer content -->
                </section>
                <!-- /page content -->

            </main><!-- End #main -->

                    <jsp:include page="../login/footer.jsp" />

        <!--        <div id="custom_notifications" class="custom-notifications dsp_none">
                    <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
                    </ul>
                    <div class="clearfix"></div>
                    <div id="notif-group" class="tabbed_notifications"></div>
                </div>-->

        <!--<div class="loginfooter col-xl-12 col-lg-12 col-sm-12" style="height: 57px;margin:0px">
                            <div ><p style="color:#ffffff;text-align:center;margin:20px">Copyright ©. All Rights Reserved. Excel Business Solutions™</p></div>
                        </div>-->

        <script>
            NProgress.done();
        </script>
        <!-- /datepicker -->
        <!-- /footer content -->
    </body>

</html>

