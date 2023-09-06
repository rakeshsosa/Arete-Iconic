<%-- 
    Document   : quoteApprovalProcess
    Created on : 17 Sep, 2016, 11:05:56 AM
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

        <title>arête Assets Management </title>
    </head>


    <body class="nav-sm">

           <jsp:include page="../login/menu.htm" />

                    <main id="main" class="main">
                        <div>
                            <jsp:include page="../login/headerlink.htm?submodule=Rent Quote&tab=Approval 1&pagetype=list"/>
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

                                                                <c:forEach items="${quoteList}" var="type">
                                                                    <tr>
                                                                        <td class="center" style="text-align: left;text-transform: capitalize;">${type.tenantQuoteCode}</td>
                                                                        <td class="center" style="text-align: left;text-transform: capitalize;">${type.tenantFirstName}</td>
                                                                        <td class="center" style="text-align: left;text-transform: capitalize;">${type.tenantCitizenship}</td>
                                                                        <td class="center" style="text-align: left;text-transform: capitalize;">${type.assetName}</td>




                                                                        <td class="center" style="text-align: center;">

                                                                            <c:if test="${type.approver1 ne 'GFC Approved' || type.approver1 eq 'Recheck' }">     
                                                                                <c:if test="${approve eq 'y'}">
                                                                                   <a href="../CRM/quoteApprovalProcessForm.htm?sno=${type.sno}&tenantQuoteCode=${type.tenantQuoteCode}&action=edit" class="fa-file-exclamation" title="Need Approval">
                                                                                       <svg aria-hidden="true" data-fa-processed="" data-prefix="fal" data-icon="file-exclamation" role="img" viewBox="0 0 384 512" class="svg-inline--fa fa-file-exclamation fa-w-12 fa-fw"><path fill="currentColor" d="M369.9 97.9L286 14C277 5 264.8-.1 252.1-.1H48C21.5 0 0 21.5 0 48v416c0 26.5 21.5 48 48 48h288c26.5 0 48-21.5 48-48V131.9c0-12.7-5.1-25-14.1-34zm-22.6 22.7c2.1 2.1 3.5 4.6 4.2 7.4H256V32.5c2.8.7 5.3 2.1 7.4 4.2l83.9 83.9zM336 480H48c-8.8 0-16-7.2-16-16V48c0-8.8 7.2-16 16-16h176v104c0 13.3 10.7 24 24 24h104v304c0 8.8-7.2 16-16 16zM180.7 192h22.6c6.9 0 12.4 5.8 12 12.7l-6.7 120c-.4 6.4-5.6 11.3-12 11.3h-9.3c-6.4 0-11.6-5-12-11.3l-6.7-120c-.3-6.9 5.2-12.7 12.1-12.7zM220 384c0 15.5-12.5 28-28 28s-28-12.5-28-28 12.5-28 28-28 28 12.5 28 28z"></path>
                                                                                </svg></a>  
                                                                                </c:if>
                                                                                <c:if test="${type.approver1 eq 'GFC Approved'}">     
                                                                                    <a>
                                                                                        <!--billingCycle1 <i class="fa fa-check-circle-o"> class="fa fa-pencil fa-lg"-->
                                                                                        <button class="myButton6"> 
                                                                                            Approved  </button>>    <!--
                                                                                          </a> -->

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






