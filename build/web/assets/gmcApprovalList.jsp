<%-- 
    Document   : rejectedList
    Created on : Oct 14, 2016, 10:39:52 AM
    Author     : EBS-SDD15
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                            <jsp:include page="../login/headerlink.htm?submodule=Material Return&tab=Approval 1&pagetype=list"/>
                        </div>
                        <div class="pagetitle">

                        </div><!-- End Page Title -->
                        <section class="section">
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="card">

                                        <div class="card-body">
                                            <div class="card-title">
                                                <h5>Material Return List</h5>
                                            </div>
                                            <!-- Table with stripped rows -->

                                            <div class="table-responsive">
                                            <table class="table datatable">
                                                            <thead>
                                                                <tr class="headings">
                                                                    <th>MR No</th>
                                                                    <th>PO No</th>
                                                                    <th>Supplier Name</th>
                                                                    <th>Status</th>
                                                                    <th>Action</th>


                                                                </tr>
                                                            </thead>

                                                            <tbody>


                                                                <c:forEach items="${gmcApprovalList}" var="list">
                                                                    <c:forEach items="${supp}" var="type">
                                                                        <c:if test="${type.supplierCode eq list.supplierName}">
                                                                            <c:set var="supplierName" value="${type.supplierName}"/>
                                                                        </c:if>                                   
                                                                    </c:forEach>
                                                                    <tr>
                                                                        <td class="center" style="width:10%;text-align: left;">${list.mrNo}</td>
                                                                        <td class="center" style="width:10%;text-align: left;">${list.poNo}</td>
                                                                        <td class="center" style="width:23%;text-align: left;">${supplierName}</td>
                                                                        <td class="center" style="width:23%;text-align: left;">${list.returnStatus}</td>

                                                                        <td class="center" style="width:13%;text-align: center;">
                                                                            <a class="fa fa-check-circle-o fa-lg" title="Approval 1" style="color: green;" href="../quality/gmcApprovalForm.htm?pk=${list.sno}&poNo=${list.poNo}&mrNo=${list.mrNo}&action=form">
                                                                                </a> 

                                                                        </td>
                                                                    </tr>


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


