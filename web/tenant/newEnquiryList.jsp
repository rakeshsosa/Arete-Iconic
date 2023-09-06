<%-- 
    Document   : newEnquiryList
    Created on : 19 May, 2023, 4:23:37 PM
    Author     : dipal
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
        
        <style>
            .contarct{
                width: 21.36px;
    height: 21.6px;
            }
        </style>
    </head>


    <body class="nav-md">
        <jsp:include page="../login/menu.htm" />
        <jsp:include page="../login/footer.jsp" />

        <main id="main" class="main">
            <div class="mt-3">

                <ul class="nav nav-pills">
                      <li class="nav-item"><a class="nav-link " href="../tenant/bookingManagmentList.htm">Occupancy</a></li>
                     <li class="nav-item"><a class="nav-link active" href="../tenant/newEnquiryList.htm">Enquiries</a></li>
                     <li class="nav-item"><a class="nav-link " href="../tenant/bookingDetailsList.htm">Quotations</a></li>
                     <li class="nav-item"><a class="nav-link" href="../tenant/bookingPropertyDetailsList.htm">Bookings</a></li>
                                  </ul>
                <div class="text-end">
                    <a class="btn btn-primary btn-sm " href="../tenant/newEnquiryForm.htm"><i class="bi bi-plus"></i>Add Enquiry</a>
                </div>
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

                              
                                <div class="table-responsive">
                                    <table class="table datatable table-bordered table-hover">
                                        <p id="successMessage" style="text-align: center;padding-right: 200px; color: red;font-family:calibri,verdana,sans-serif;font-size: 17px;">${message}</p>
                                        <c:remove var="message" scope="session" /> 

                                        <c:forEach items="${permission}" var="type">
                                            <c:set var="add" value="${type.newEntry}"></c:set>
                                            <c:set var="edit" value="${type.edit}"></c:set>
                                            <c:set var="inactive" value="${type.inactive}"></c:set>
                                            <c:set var="review" value="${type.review}"></c:set>
                                            <c:set var="approve" value="${type.approve}"></c:set>
                                        </c:forEach>


                                        <thead>

                                            <tr class="headings">
                                                <th>Enquiry  ID</th>
                                                <th>Enquiry  Date</th>
                                                  <th>Property Name</th>
                                                   <th> Unit Number</th>
                                                <th>Customer Name</th>
                                                 <th>Status</th>
                                                      
                                     

                                                <!--<th>Type Sequence No</th>-->
                                                <th class=" no-link last"><span class="nobr">Action</span>
                                                </th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach items="${newEnquiryList}" var="list">
                                                <tr class="even pointer">                                                                   
                                                    <td class=" "style="text-align: left;">${list.enquiryId}</td>
                                                    <td class=" "style="text-align: left;"><fmt:formatDate pattern="dd-MM-yyyy" value="${list.enquiryDate}"/></td>

                                                     <td class=" "style="text-align: left;">${list.property}</td>
                                                      <td class=" "style="text-align: left;">${list.unit}</td>
                                                         <td class=" "style="text-align: left;">${list.coutmerName}</td>
                                                         <td class=" " style="text-align: left;">
                                                            <c:choose>
                                                                <c:when test="${list.status eq 'false'}">
                                                                    <!-- Display data when list.status is 'false' -->
                                                                    Inactive 
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <!-- Display data for other cases -->
                                                                    Active 
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>

                                                    <td class="last" style="width: 100px;text-align: left;">
                                              <!--          <p>${list.status} "test"</p>      -->
                                                        <a href="../tenant/newEnquiryForm.htm?pk=${list.sNo}&action=view" class="fa fa-eye fa-lg" title="View"></a>
                                                        <a href="../tenant/newEnquiryForm.htm?pk=${list.sNo}&action=edit" class="fa fa-pencil-square-o fa-lg" title="Edit"></a>
                                                        
                                                                     <a href="../tenant/bookingDetailsForm.htm"><img src="../common/images/contract_new.png"  class="contarct fa-lg" title="Convert To Quotation"></a>&nbsp;
                                                                     <a href="tenant/bookingManagmentForm.htm"><img src="../common/images/booking_new.png"  class="contarct fa-lg" title="Convert To Booking"></a>
<!--                                                        <a class="fa fa-exchange fa-lg" href="../tenant/bookingDetailsForm.htm" title="Convert To Quotation"></a>&nbsp;--

<!--                                                        <a class="fa fa-exchange fa-lg" href="tenant/bookingManagmentForm.htm" title="Convert To Booking"></a>&nbsp;-->
                                                        
                                                        <c:if test="${list.status eq 'true'}">
                                                                                <a href="javascript:" class="" data-placement="top" title="Inactive" data-toggle="tooltip" onclick="
                                                                                    swal({
                                                                                        text:'Do you really wish to make the selected record INACTIVE? Please confirm.',
                                                                                        buttons: ['Cancel','OK']
                                                                                    }).then(function(isConfirm){
                                                                                    if (isConfirm) {         
                                                                                        window.location.href = '../tenant/updateEnquiryStatus.htm?pk=${list.sNo}&status=${list.status}';
                                                                                    }
                                                                                    })" >
                                                                                    <i class="fa fa-trash fa-lg"></i>                                  
                                                                                </a>
                                                                            </c:if>
                                                        <c:if test="${list.status eq 'false'}">
                                                                                <a href="javascript:" class="" data-placement="top" title="Active" data-toggle="tooltip" onclick="
                                                                                    swal({
                                                                                        text:'Do you really wish to make the selected record INACTIVE? Please confirm.',
                                                                                        buttons: ['Cancel','OK']
                                                                                    }).then(function(isConfirm){
                                                                                    if (isConfirm) {         
                                                                                        window.location.href = '../tenant/updateEnquiryStatus.htm?pk=${list.sNo}&status=${list.status}';
                                                                                    }
                                                                                    })" >
                                                                                    <i class="fa fa-trash fa-lg"></i>                                  
                                                                                </a>
                                                                            </c:if>
                                                        
                                                        
<!--                                                        <c:if test="${list.status eq 'Inactive'}">

                                                            <a class="fa fa-trash fa-lg" title="Active" href="javascript:"  onClick="
                                                                    if (window.confirm('Do you really wish to make this record ACTIVE? Please confirm.'))
                                                                    {
                                                                        window.location.href = '#';
                                                                    }
                                                               " >


                                                            </a>
                                                        </c:if>
                                                        <c:if test="${list.status == 'Active' || list.status == 'Update0'}">

                                                            <a class="fa fa-trash fa-lg" title="Inactive" href="javascript:"  onClick="
                                                                    if (window.confirm('Do you really wish to make this record INACTIVE? Please confirm.'))
                                                                    {
                                                                        window.location.href = '#';
                                                                    }
                                                               " >


                                                            </a>
                                                        </c:if>  -->
                                                             <a href="#" class="fa fa-remove fa-lg" data-toggle="tooltip" data-bs-original-title="Cancel" aria-label="Cancel"> </a>
                                                    </td>
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
                                                                    onShow: function (reference) {
                                                                        setTimeout(function () {
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
