<%-- 
    Document   : bookingDetailsList
    Created on : 10 Dec, 2018, 4:09:14 PM
    Author     : Lakshmi
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link href="../common/theme/css/disableSelection.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../common/validate/validationEngine.css" rel="stylesheet" type="text/css"/>
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.min.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.js" type="text/javascript"></script>
        <title>Arete Iconic</title>
<link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
        <!-- Bootstrap core CSS -->
        <script>
            setTimeout(function () {
                $('#successMessage').fadeOut('fast');
            }, 5000);
        </script>

    </head>


    <body class="nav-md">
           <jsp:include page="../login/menu.htm" />
                    <jsp:include page="../login/footer.jsp" />

                    <main id="main" class="main">
                        <div class="mt-3">
                             <ul class="nav nav-pills">
                   <li class="nav-item"><a class="nav-link " href="../tenant/bookingManagmentList.htm">Occupancy</a></li>
                   <li class="nav-item"><a class="nav-link " href="../tenant/newEnquiryList.htm">Enquiries</a></li>
                    <li class="nav-item"><a class="nav-link active" href="../tenant/bookingDetailsList.htm">Quotations</a></li>
<!--                    <li class="nav-item"><a class="nav-link active" href="../tenant/bookingDetailsForm.htm">Bookings</a></li>-->
                     <li class="nav-item"><a class="nav-link " href="../tenant/bookingPropertyDetailsList.htm">Bookings</a></li>
                </ul>
                                  <div class="text-end">
                    <a class="btn btn-primary btn-sm " href="../tenant/bookingDetailsForm.htm">
                        <i class="bi bi-plus"></i>Add Quotation </a>
                </div>
                            <%--<jsp:include page="../login/headerlink.htm?submodule=Booking Management&tab=Booking Records&pagetype=list"/>--%>
                        </div>
                        <div class="pagetitle">

                        </div><!-- End Page Title -->
                        <section class="section">
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="card">

                                        <div class="card-body">
                                            <div class="card-title">
<!--                                                <h5>Booking Details List</h5>-->
                                            </div>
                                                        <div class="clearfix">
                                                            <p id="successMessage" style="text-align: center;color: blue;font-family:bold;">${message}</p>
                                                            <c:remove var="message" scope="session" /> 
                                                        </div>
                                                    
                                                    <%--<c:forEach items="${permission}" var="type">
                                                        <c:set var="add" value="${type.newEntry}"></c:set>
                                                        <c:set var="edit" value="${type.edit}"></c:set>
                                                        <c:set var="inactive" value="${type.inactive}"></c:set>
                                                        <c:set var="review" value="${type.review}"></c:set>
                                                        <c:set var="approve" value="${type.approve}"></c:set>
                                                    </c:forEach>--%>
                                                        <div class="table-responsive">
                                                    <table class="table datatable table-hover table-bordered">
                                                            <thead>

                                                                <tr class="headings">
                                                                    <th>Quotation Id</th>
                                                                    <th>Enquire Id</th>
                                                                    <th>Property Name</th>
<!--                                                                    <th>Billing Cycle</th>-->
                                                                    <th> Date of Quotation</th>
<!--                                                                    <th>Created By</th>
                                                                    <th>Approval Status</th>-->
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                <c:forEach items="${quotationDetailsList}" var="list">
                                                                    
                                                                    <tr class="even pointer">                                                                   
                                                                        <td class=""style="text-align: left;">${list.quotationId}</td>
                                                                        <td class=""style="text-align: left;">${list.enquiryId}</td>
                                                                        <td class=" "style="text-align: left;">${list.propertyName}</td>
                                                                        <td class=" "style="text-align: left;"><fmt:formatDate pattern="dd-MM-yyyy" value="${list.quotationDate}"/></td>
<!--                                                                        <td class=" "style="text-align: left;"></td>-->
<!--                                                                        <td class=" "style="text-align: left;"></td>-->
<!--                                                                        <td class=" "style="text-align: left;">
                                                                            
                                                                        <td class=" "style="text-align: left;"></td>-->
                                                                        <td class="" style="text-align: center;">
                                                                            <a href="../tenant/bookingDetailsForm.htm?pk=${list.SNo}&assetName=${list.propertyName}&quotationId=${list.quotationId}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;
                                                                            <a href="../tenant/bookingDetailsForm.htm?pk=${list.SNo}&&assetName=${list.propertyName}&quotationId=${list.quotationId}&action=edit" class="fa fa-pencil fa-lg fa-lg"title="Edit"></a>&nbsp;
<!--                                                                            <a href="#" class="fa fa-thumbs-up fa-lg"title="Approval"></a>&nbsp;-->
                                                                            <%--<c:if test="${list.appstatus ne 'Approved'}">
                                                                                <c:if test="${list.appstatus ne 'Recheck'}">
                                                                                    <c:if test="${edit eq 'y'}">--%>
                                                                                        
                                                                                   <%-- </c:if> </c:if>
                                                                                
                                                                            </c:if> --%>
                                                                                        
                                                                                        <!--<a href="#" class="fa fa-pencil-square-o fa-lg" title="" data-toggle="tooltip" data-bs-original-title="Edit" aria-label="Edit"></a>-->
<!--                                                                                         <a class="fa fa-exchange fa-lg" href="#" title="Convert to Tenant"></a>&nbsp;-->
                                                                            <%--<c:if test="${list.appstatus eq 'Approved' }">
                                                                                <a class="fa fa-envelope fa-lg" title="Send Email" onclick="sendEmail('${list.tenantCode}', '${list.tenantMailid}');" >
                                                                                </a>
                                                                            </c:if>
                                                                            <c:if test="${list.appstatus eq 'Approved' }">
                                                                                <a class="fa fa-comment fa-lg" title="Send SMS" onclick="sendSMS('${list.tenantCode}', '${list.tenantContactno}');" >
                                                                                                               
                                                                                </a> 
                                                                            </c:if>--%>
                                                                            
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
            content: '<p>Create, Search, View, Approve, Email and SMS the Tennat Code, Name, Property Name, Billing Cycle, Created Date, Created By, and Approve Status. </p>\n\
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
<script>
    function sendEmail(tC, Mail) {
        alert(tC);
        alert(Mail);
        window.location.href = "../tenant/sendBookingEmail.htm?tC=" + tC + "&tEmail=" + Mail + "&action=view";
    }
    
    function sendSMS(tC, Sms) {
         alert(tC);
        alert(Sms);
        window.location.href = "../tenant/bookingSendSMS.htm?tC=" + tC + "&tSms=" + Sms + "&action=view";
    }

    NProgress.done();
</script>
</body>

</html>
