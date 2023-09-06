<%-- 
    Document   : quoteList
    Created on : 18 Aug, 2016, 12:37:27 PM
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

        <title>Arete Iconic</title>
        <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
    </head>
    <script>
        function sendEmail(tC, Mail) {
            window.location.href = "../CRM/sendRQEmail.htm?tC=" + tC + "&tEmail=" + Mail + "&action=view";
        }
        
        function sendSMS(tC, Sms) {
            window.location.href = "../CRM/sendSMS.htm?tC=" + tC + "&tSms=" + Sms + "&action=view";
        }

        NProgress.done();
    </script>


    <body class="nav-sm">

    <jsp:include page="../login/menu.htm" />

                    <jsp:include page="../login/footer.jsp" />

                        <main id="main" class="main">
                            <div class="mt-3">
                                <jsp:include page="../login/headerlink.htm?submodule=Rent Quote&tab=Rent Quote&pagetype=list"/>
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
<!--                                                <table class="table datatable">
                                      <%--                       <c:forEach items="${permission}" var="type">
                                                        <c:set var="add" value="${type.newEntry}"></c:set>
                                                        <c:set var="edit" value="${type.edit}"></c:set>
                                                        <c:set var="inactive" value="${type.inactive}"></c:set>
                                                        <c:set var="review" value="${type.review}"></c:set>
                                                        <c:set var="approve" value="${type.approve}"></c:set>
                                                    </c:forEach>  --%>
                                                            <thead>
                                                                <tr class="headings">

                                                                    <th>Customer Code</th>
                                                                    <th>Rent Quote Code</th>
                                                                    <th>Tenant Name </th>
                                                                    <th>Citizenship</th>
                                                                    <th>Property Name</th>
                                                                    <th>Rent Quote Status</th>
                                                                    <th>Approval Status</th>
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>

                                              <%--                  <c:forEach items="${quoteList}" var="type">
                                                                    <c:forEach items="${assetDetails}" var="asset">
                                                                        <c:if test="${asset.assetCode eq type.assetCode}">
                                                                            <c:set var="assetName1" value="${asset.assetName}"/>
                                                                            <c:set var="assetCode1" value="${asset.assetCode}"/>

                                                                        </c:if> 
                                                                    </c:forEach>
                                                                    <tr>
                                                                        <td class="center" style="text-align: left;text-transform: capitalize;">${type.tenantQuoteCode}</td>
                                                                        <td class="center" style="text-align: left;text-transform: capitalize;">${type.tenantFirstName}</td>
                                                                        <td class="center" style="text-align: left;text-transform: capitalize;">${type.tenantCitizenship}</td>
                                                                        <td class="center" style="text-align: left;text-transform: capitalize;">${assetName1}</td>
                                                                        <td class="center" style="text-align: left;text-transform: capitalize;">${type.recordStatus}</td>
                                                                        <td class="center" style="text-align: left;text-transform: capitalize;">${type.approverStatus}</td>




                                                                        <td class="center" style="text-align: center;">
                                                                            <a  href="../CRM/quoteForm.htm?sno=${type.sno}&tenantQuoteCode=${type.tenantQuoteCode}&action=view"class="fa fa-eye fa-lg"title="View"  >
                                                                                                                           
                                                                            </a>
                                                                            <c:if test="${type.approverStatus ne 'Approved' && type.approverStatus ne 'recheck' }">
                                                                                <c:if test="${edit eq 'y'}">
                                                                                    <a class="fa fa-pencil fa-lg" title="Edit" href="../CRM/quoteForm.htm?sno=${type.sno}&tenantQuoteCode=${type.tenantQuoteCode}&action=edit">
                                                                                        
                                                                                    </a>
                                                                                </c:if>
                                                                            </c:if>
                                                                            <%--<c:if test="${type.approver1 eq 'Recheck'}">--%>
                                           <%--                                 <c:if test="${type.approverStatus eq 'recheck'}">
                                                                                <c:if test="${review eq 'y'}">
                                                                                    <a class="fa fa-pencil fa-lg" href="../CRM/quoteForm.htm?sno=${type.sno}&tenantQuoteCode=${type.tenantQuoteCode}&action=recheck">
                                                                                        <i class="fa fa-pencil fa-lg-square-o" >
                                                                                            Recheck  </i>    
                                                                                    </a> 
                                                                                </c:if>
                                                                            </c:if>
                                                                            <c:if test="${type.approver2 eq 'CFO Approved' && type.recordStatus eq 'RentQuote Created'}">
                                                                             == billingCycle1   ../CRM/LeadConvertForm.htm?tenantQuoteCode=${type.tenantQuoteCode}&action=convert  ==
                                                                                <a class="fa fa-refresh fa-lg" style="color: #f16689;" title="Convert To Tenant"  href="../CRM/quoteConvertForm.htm?tenantQuoteCode=${type.tenantQuoteCode}&action=edit" >
                                                                                    
                                                                                </a>
                                                                            </c:if>
                                                                            <c:if test="${type.recordStatus eq 'Tenant Created'}">
                                                                                <a class="myButton6" >
                                                                                    <i class="fa"> Converted To Tenant</i>
                                                                                </a>
                                                                            </c:if>

                                                                            <%--<a class="myButton9" href="../CRM/sendLeadEmail.htm?leadCode=${type[3]}&email=${type[6]}&action=view" >--%>
                                                                            <a style="color: #FDDC54" class="myButton11" href="../CRM/quoteList.htm?tenantQuoteCode=${type.tenantQuoteCode}&email=${type.mailId}" >
                                                                                <i class="fa fa-send" >
                                                                                    Send Email</i>
                                                                            </a>
                                                                            <a style="color:#A9D051;" class="fa fa-envelope fa-lg " onclick="sendEmail('${type.tenantQuoteCode}', '${type.mailId}');" title="Email" >
                                                                                                               
                                                                            </a> 

                                                                        </td>   


                                                                    </tr>
                                                <%--                </c:forEach>       --%>

                                                            </tbody>

                                                         </table>-->
                                                
                                <div class="table-responsive">
                                                <table class="table datatable table-hover table-bordered">
                                           <%--                  <c:forEach items="${permission}" var="type">
                                                        <c:set var="add" value="${type.newEntry}"></c:set>
                                                        <c:set var="edit" value="${type.edit}"></c:set>
                                                        <c:set var="inactive" value="${type.inactive}"></c:set>
                                                        <c:set var="review" value="${type.review}"></c:set>
                                                        <c:set var="approve" value="${type.approve}"></c:set>
                                                    </c:forEach>  --%>
                                                            <thead>
                                                                <tr class="headings">

                                                                    <!--<th>Customer Code</th>-->
                                                                    <th>Quotation No</th>
                                                                    <th>Customer Name </th>
                                                                    <th>Property Name</th>
                                                                    <th>Unit No</th>
                                                                    <th>Status</th>
                                                                    
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>

                                                                <c:forEach items="${quotationList}" var="type">
                                                       <%--             <c:forEach items="${assetDetails}" var="asset">
                                                                        <c:if test="${asset.assetCode eq type.assetCode}">
                                                                            <c:set var="assetName1" value="${asset.assetName}"/>
                                                                            <c:set var="assetCode1" value="${asset.assetCode}"/>

                                                                        </c:if> 
                                                                    </c:forEach>   --%>
                                                       <tr>
                                                                        <td class="center">${type.quotationNo}</td>
                                                                        <td class="center">${type.customerName}</td>
                                                                        <td class="center">${type.assetName}</td>
                                                                        <td class="center">${type.assetType1}</td>
                                                                        <td class="center">${type.status}</td>
<!--                                                                        <td class="center" style="text-align: left;text-transform: capitalize;"></td>
                                                                        <td class="center" style="text-align: left;text-transform: capitalize;"></td>
                                                                        <td class="center" style="text-align: left;text-transform: capitalize;"></td>
                                                                        <td class="center" style="text-align: left;text-transform: capitalize;"></td>
                                                                        <td class="center" style="text-align: left;text-transform: capitalize;"></td>-->
                                                                        

                                                                        <td class="center" style="text-align: center;">
                                                                            <a href="../CRM/quoteForm.htm?sno=${type.sno}&rentQuoteCode=${type.sno}&action=view"class="fa fa-eye fa-lg"title="View"  ></a>
<!--                                                                             <a href="../CRM/quoteForm.htm?sno=${type.sno}&rentQuoteCode=${type.sno}&action=edit"class="fa fa-eye fa-lg"title="Edit"  ></a>-->
                                                                             <a class="fa fa-exchange fa-lg" href="../insurance/tenantContractForm.htm" title="Convert to Tenant"></a>&nbsp;
                                                                             
                                                                             <a href="../CRM/quoteFormEdit.jsp?sno=${type.sno}&rentQuoteCode=${type.sno}&action=edit"class="fa fa-pencil-square-o fa-lg" title="Edit"></a>&nbsp;
                                                                             
<!--                                                                             <a class="fa fa-print fa-lg" title="Print"></a>&nbsp;
                                                                             
                                                                             <a class="fa fa-repeat fa-lg" data-toggle="tooltip" title="Repeat Quote"></a>&nbsp;-->

                                                                             <a class="fa fa-envelope fa-lg" title="Send Email"></a>
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
            content: '<p>Create, Search, View, Convert, Edit, Print, Repeat, and Mail the Quotation Number, Customer Name, Property Name, Unit Number, and Status. </p>\n\
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




