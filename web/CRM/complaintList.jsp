<%-- 
    Document   : complaintList
    Created on : 10 Mar, 2016, 3:10:11 PM
    Author     : ebs-sdd05
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

        <title>Arete Iconic</title>
         <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
    </head>


    <body class="nav-sm">
    <jsp:include page="../login/menu.htm" />
                    <jsp:include page="../login/footer.jsp" />

                    <main id="main" class="main">
                        <div class="mt-3">
                            <jsp:include page="../login/headerlink.htm?submodule=Complaints&tab=Complaints&pagetype=list"/>
                        </div>
                        <div class="pagetitle">

                        </div><!-- End Page Title -->
                        <section class="section">
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="card">

                                        <div class="card-body">
                                            <div class="card-title">
                                                <h5>Complaint Detail List</h5>
                                            </div>
                                            <!-- Table with stripped rows -->

                                            <div class="table-responsive">
                                            <table class="table datatable table-hover table-bordered">
                                                            <c:forEach items="${permission}" var="type">
                                                        <c:set var="add" value="${type.newEntry}"></c:set>
                                                        <c:set var="edit" value="${type.edit}"></c:set>
                                                        <c:set var="inactive" value="${type.inactive}"></c:set>
                                                        <c:set var="review" value="${type.review}"></c:set>
                                                        <c:set var="approve" value="${type.approve}"></c:set>
                                                    </c:forEach>
                                                            <thead>
                                                                <tr class="headings">

                                                                    <!--<th>Customer Code</th>-->
                                                                    <th>Complaint Number</th>
                                                                    <th>Property Name </th>
                                                                    <th>Tenant Name</th>
                                                                    <th>Unit Number</th>
                                                                    <th>Priority</th>
                                                                    <th style="width: 150px;">Status </th>
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>

                                                                <c:forEach items="${complaintList}" var="type">
                                                                    <c:forEach items="${assetDetails}" var="asset">
                                                                        <c:if test="${asset.assetCode eq type.assetName}">
                                                                            <c:set var="assetName1" value="${asset.assetName}"/>
                                                                            <c:set var="assetCode" value="${asset.assetName}"/>

                                                                        </c:if> 
                                                                    </c:forEach>
                                                                    <c:forEach items="${subAssetDetails}" var="subasset">
                                                                        <c:if test="${subasset.subAssetCode eq type.assetNo}">
                                                                            <c:set var="subAssetName1" value="${subasset.subAssetName}"/>
                                                                            <c:set var="subAssetCode" value="${subasset.subAssetName}"/>

                                                                        </c:if> 
                                                                    </c:forEach>
                                                                    <tr>
                                                                        <td class="center" style="text-align: left;">${type.complaintCode}</td>
                                                                        <td class="center" style="text-align: left;text-transform: capitalize;">${asset.assetName1}</td>
                                                                        <td class="center" style="text-align: left;text-transform: capitalize;">${type.tenantName}</td>
                                                                        <td class="center" style="text-align: left;text-transform: capitalize;">${subasset.subAssetName1}</td>
                                                                        <td class="center" style="text-align: left;text-transform: capitalize;"></td>
                                                                        <td class="center" style="text-align: left;text-transform: capitalize;">${type.recordStatus}</td>




                                                                        <td class="center" style="">
                                                                            <a  href="../CRM/complaintForm.htm?sno=${type.sno}&action=view" class="fa fa-eye fa-lg"title="View">

                                                                            </a>
                                                                            <a  href="../CRM/complaintResolutionForm.jsp" class="fa fa-pencil fa-lg"title="Resolution">

                                                                            </a>
                                                                            <c:if test="${type.recordStatus eq 'Complaint Created'}" > 
                                                                                <c:if test="${edit eq 'y'}">
                                                                                    <a class="fa fa-pencil-square-o fa-lg" href="../CRM/complaintForm.htm?sno=${type.sno}&action=edit" title="Edit">

                                                                                    </a> 
                                                                                </c:if>
                                                                            </c:if>
                                                                            
                                                                            <%--                                                                                <a class="myButton7" href="../CRM/complaintFormApproval.htm?sno=${type.sno}&complaintNo=${type.complaintNo}&action=edit">
                                                                                                                                                                <i class="glyphicon glyphicon-unchecked">
                                                                                                                                                                    Pending  </i>    
                                                                                                                                                            </a>   --%>


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

                     <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
        <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
        <script type="text/javascript">
        tippy('#information', {
            content: '<p>Create, Search, View, Edit and Resolute the Complaint Number, Proerty Name, Tenant Name, Unit Number, Priority and Status. </p>\n\
             ',
            allowHTML: true,
            hideOnClick: true,
            trigger: 'click',
            onShow: function(reference){
		setTimeout(function() {
			reference.hide();
                         reference.reference.blur(); // for a second touch opening, lose focus
		}, 30000);
                    }
        });
        </script>
</body>

</html>



