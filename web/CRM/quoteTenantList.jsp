<%-- 
    Document   : quoteTenantList
    Created on : 17 Sep, 2016, 1:10:12 PM
    Author     : ebs-sdd27
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
                        <div>
                            <jsp:include page="../login/headerlink.htm?submodule=Rent Quote&tab=Tenant&pagetype=list"/>
                        </div>
                        <div class="pagetitle">

                        </div><!-- End Page Title -->
                        <section class="section">
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="card">

                                        <div class="card-body">
                                            <div class="card-title">
                                                <h5>Tenant List</h5>
                                            </div>
                                            <!-- Table with stripped rows -->

                                            <div class="table-responsive">
                                            <table class="table datatable">

                                                        <a  class="successalert"  style="margin-left: 250px;color: blue;font-size: 17px;">

                                                            <% String x = request.getParameter("msg");
                                                                if (x != null) {
                                                                    out.print(x);
                                                                }
                                                            %>
                                                        </a>



                                                      
                                                            <thead>
                                                                <tr class="headings">
                                                                    <th>Tenant Code</th>
                                                                    <th>Tenant Name</th>
                                                                    <th>Property Name</th>
                                                                    <th>Billing Cycle</th>
                                                                    <th>Created Date</th>
                                                                    <th>Tenant Status</th>
                                                                    <th>Approval Status</th>
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>

                                                                <%--<c:set value="0" var="tenantCode1"/>--%>  
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <%--<c:if test="${type.tenantCode!=tenantCode1}">--%>
                                                                    <tr>



                                                                        <td class=""style="text-align: left;">${list.tenantCode}</td>
                                                                        <td class=""style="text-align: left;">${list.tenantFname} ${list.tenantLname}</td>
                                                                        <td class=" "style="text-align: left;">${list.assetNames}</td>
                                                                        <td class=" "style="text-align: left;">${list.billingCycle}</td>
                                                                        <td class=" "style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.creationDate}"/></td>
                                                                        <td class=" "style="text-align: left;">
                                                                            <c:if test="${list.vacatestatus eq null || list.vacatestatus eq ''}">${list.recordstatus}</c:if>
                                                                            <c:if test="${list.vacatestatus ne null}">${list.vacatestatus}</c:if></td>
                                                                        <td class=" "style="text-align: left;">${list.appstatus}</td>



                                                                        <td class="center" style="">
                                                                            <a  href="../CRM/fromQuoteToTenantDetailsViewForm.htm?tenantCode=${list.tenantCode}&sno=${list.SNo}&action=view" class="fa fa-eye fa-lg"title="View" >
                                                                                   
                                                                            </a>

                                                                        </td>   


                                                                    </tr>
                                                                    <%--</c:if>--%>
                                                                    <%--<c:set value="${type.tenantCode}" var="tenantCode1"/>--%>

                                                                </c:forEach> 

                                                            </tbody>

                                                      </table>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </section>

                    </main><!-- End #main -->

                    <jsp:include page="../login/footer.jsp" />
</body>

</html>

