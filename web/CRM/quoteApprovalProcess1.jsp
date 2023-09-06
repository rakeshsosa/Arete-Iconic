<%-- 
    Document   : quoteApprovalProcess1
    Created on : 18 Oct, 2016, 11:58:13 AM
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
                            <jsp:include page="../login/headerlink.htm?submodule=Rent Quote&tab=Approval 2&pagetype=list"/>
                        </div>
                        <div class="pagetitle">

                        </div><!-- End Page Title -->
                        <section class="section">
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="card">

                                        <div class="card-body">
                                            <div class="card-title">
                                                <h5>Rent Quote List</h5>
                                            </div>
                                            <!-- Table with stripped rows -->

                                            <div class="table-responsive">
                                            <table class="table datatable">
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
                                                                    <th>Rent Quote Code</th>
                                                                    <th>Tenant Name </th>
                                                                    <th>Citizenship</th>
                                                                    <th>Property Name</th>
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>

                                                                <c:forEach items="${cfoApprovalList}" var="type">
                                                                    <tr>
                                                                        <td class="" style="text-align: left;">${type.tenantQuoteCode}</td>
                                                                        <td class="" style="text-align: left;">${type.tenantFirstName}</td>
                                                                        <td class="" style="text-align: left;">${type.tenantCitizenship}</td>
                                                                        <td class="" style="text-align: left;">${type.assetName}</td>




                                                                        <td class="" style="text-align: left;">

                                                                            <c:if test="${type.approver2 eq 'CFO Approved'}">     
                                                                                <a>
                                                                                    <!--billingCycle1 <i class="fa fa-check-circle-o"> class="fa fa-pencil fa-lg"-->
                                                                                    <!--                                                                                    <button class="myButton6"> 
                                                                                                                                                                            Approved  </button> -->   

                                                                                    <!--add view button here-->
                                                                                    <a href="../CRM/quoteApprovalProcessViewForm1.htm?sno=${type.sno}&tenantQuoteCode=${type.tenantQuoteCode}&ction=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;  

                                                                                </c:if>  
                                                                                <c:if test="${type.approver2 ne 'CFO Approved'}">     
                                                                                    <c:if test="${approve eq 'y'}">
                                                                                        <a class="myButton12" href="../CRM/quoteApprovalProcessForm1.htm?sno=${type.sno}&tenantQuoteCode=${type.tenantQuoteCode}&action=edit">
                                                                                            <i class="fa fa-check-circle-o">
                                                                                                Need Approval  </i>    
                                                                                        </a> 
                                                                                    </c:if>

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