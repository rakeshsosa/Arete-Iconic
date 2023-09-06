<%-- 
    Document   : materialReturnList
    Created on : Oct 7, 2016, 11:34:51 AM
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
                            <jsp:include page="../login/headerlink.htm?submodule=Material Return&tab=Material Return&pagetype=list"/>
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
                                                                     <th>Purchase Type</th>
                                                                    <th>Purchase Order No / Wallet Number</th>
                                                                    <th>Purchase Order Date</th>
                                                                    <th>Vendor Name</th>
                                                                    <th>No. of items</th>
                                                                    <th>Quantity</th>
                                                                    <th>Delivery Location</th>
                                                                    <th>Action</th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>

                                                                <tr>
                                                                     <td>${list.mrNo}</td>
                                                                        <td>${list.mrNo}</td>
                                                                        <td>${list.poNo}</td>
                                                                        <td>${supplierName}</td>
                                                                        <td>${list.returnStatus}</td>
                                                                        <td></td>
                                                                        <td></td>
                                                                        <td>
                                                                            
                                                                                <a href="../quality/materialReturnForm.htm" data-toggle="tooltip" class="fa fa-undo fa-lg"title="Return Material">
                                                                                    </a> 

                                                                            
                                                                            



                                                                        </td>
                                                                    </tr>
                                                                <c:forEach items="${materialReturnList}" var="list">

                                                                    <c:forEach items="${supp}" var="type">
                                                                        <c:if test="${type.supplierCode eq list.supplierName}">
                                                                            <c:set var="supplierName" value="${type.supplierName}"/>
                                                                        </c:if>                                   
                                                                    </c:forEach>

<!--                                                                    <tr>
                                                                        <td class="center" style="width:10%;text-align: left;">${list.mrNo}</td>
                                                                        <td class="center" style="width:10%;text-align: left;">${list.poNo}</td>
                                                                        <td class="center" style="width:23%;text-align: left;">${supplierName}</td>
                                                                        <td class="center" style="width:23%;text-align: left;">${list.returnStatus}</td>
                                                                        <td class="center" style="width:23%;text-align: left;"></td>
                                                                        <td class="center" style="width:23%;text-align: left;"></td>
                                                                        <td class="center" style="width:13%;text-align: center;">
                                                                            <c:if test="${list.returnStatus eq 'Material Returned' || list.returnStatus eq 'GFC Approved' || list.returnStatus eq 'CFO Approved'}">
                                                                                <a href="../quality/materialReturnForm.htm?pk=${list.sno}&poNo=${list.poNo}&mrNo=${list.mrNo}&action=view"class="fa fa-eye fa-lg"title="View">
                                                                                    </a> 

                                                                            </c:if>
                                                                            



                                                                        </td>
                                                                    </tr>-->


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


