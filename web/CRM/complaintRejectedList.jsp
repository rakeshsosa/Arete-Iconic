<%-- 
    Document   : complaintApprovalList1
    Created on : 18 Oct, 2016, 10:42:42 AM
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


    <body class="nav-sm">

           <jsp:include page="../login/menu.htm" />


                        <main id="main" class="main">
                            <div>
                                <jsp:include page="../login/headerlink.htm?submodule=Complaints&tab=Rejected Complaints"/>
                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h5>Complaint Details</h5>
                                                </div>
                                                <div class="table-responsive">
                                                        <table id="example" class="table datatable">
                                                            <thead>
                                                                <tr class="headings">

                                                                    <!--<th>Customer Code</th>-->
                                                                    <th>Complaint No</th>
                                                                    <th>Tenant Name</th>
                                                                    <th>Property Name </th>
                                                                    <th>Flat Name / Flat No.</th>
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>

                                                                <c:forEach items="${mdApprovalList}" var="type">
                                                                    <c:forEach items="${assetDetails}" var="asset">
                                                                        <c:if test="${asset.assetCode eq type.assetName}">
                                                                            <c:set var="assetName" value="${asset.assetName}"/>

                                                                        </c:if> 
                                                                    </c:forEach>
                                                                    <c:forEach items="${subAssetDetails}" var="subasset">
                                                                        <c:if test="${subasset.subAssetCode eq type.assetNo}">
                                                                            <c:set var="subAssetName" value="${subasset.subAssetName}"/>

                                                                        </c:if> 
                                                                    </c:forEach>
                                                                    <tr>
                                                                        <td class="center" style="text-align: left;text-transform: capitalize;">${type.complaintCode}</td>
                                                                        <td class="center" style="text-align: left;text-transform: capitalize;">${type.tenantName}</td>
                                                                        <td class="center" style="text-align: left;text-transform: capitalize;">${assetName}</td>
                                                                        <td class="center" style="text-align: left;text-transform: capitalize;">${subAssetName}</td>




                                                                        <td class="center" style="">

                                                                            <c:if test="${type.attribute2 eq 'Rejected'}">    
                                                                                <a  href="../CRM/complaintrejectviewForm.htm?sno=${type.sno}&action=view" class="fa fa-eye fa-lg"title="View" >
                                                                                                                             
                                                                                </a> 

                                                                            </c:if> 



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
