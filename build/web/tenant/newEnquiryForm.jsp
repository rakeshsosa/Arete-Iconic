<%-- 
    Document   : newEnquiryForm
    Created on : 17 May, 2023, 4:21:24 PM
    Author     : dipal
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css" integrity="sha256-FAOaXTpl90/K8cXmSdsskbQN3nKYulhCpPbcFzGTWKI=" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css" integrity="sha512-gxWow8Mo6q6pLa1XH/CcH8JyiSDEtiwJV78E+D+QP0EVasFs8wKXq16G8CLD4CJ2SnonHr4Lm/yY2fSI2+cbmw==" crossorigin="anonymous" />
        <title>Arete Iconic</title>
        <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
        <style>
            @media screen and (max-width: 600px) {
                .table-responsive {
                    overflow-x: auto !important;
                }
            }

            .swal-confirm-button {
                background: initial;
                background-color: #dc1111 !important;
                color: #fff;
            }

            .swal-cancel-button {
                background-color: gray !important;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../login/menu.htm" />
        <jsp:include page="../login/footer.jsp" />
        <main id="main" class="main">
            <div class="mt-3">
                <ul class="nav nav-pills">
                    <li class="nav-item"><a class="nav-link " href="../tenant/bookingManagmentList.htm">Occupancy</a></li>
                    <li class="nav-item"><a class="nav-link active" href="../tenant/newEnquiryList.jsp">Enquiries</a></li>
                    <li class="nav-item"><a class="nav-link" href="../tenant/bookingDetailsList.htm">Quotations</a></li>
                    <li class="nav-item"><a class="nav-link" href="../tenant/bookingPropertyDetailsList.htm">Bookings</a></li>
                </ul>
                <div class="text-end">
                    <a class="btn btn-primary btn-sm " href="../tenant/newEnquiryList.htm">
                        <i class="bi bi-plus"></i>Show Enquiry Records </a>
                </div>
            </div>
            <div class="pagetitle"></div>
            <!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h5>Property Details Form</h5>
                                </div>
                                <form class="row validateForm" id="userform" action="../tenant/newEnquiryFormSubmit.htm" method="post" enctype="multipart/form-data">
                                    <div class="col-md-4 form-floating mb-3">

                                        <c:choose>
                                            <c:when test="${fn:length(newEnquiryList) > 0}">
                                                <c:forEach items="${newEnquiryList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" readonly="" placeholder="Fill" class="form-control" id="enquiryId" name="enquiryId" onkeypress="return isNumberKey(event);" maxlength="40" value="${list.enquiryId}">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" readonly="" placeholder="Fill" class="form-control" id="enquiryId" name="enquiryId" onkeypress="return isNumberKey(event);" maxlength="40" value="${list.enquiryId}">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" readonly="" placeholder="Fill" class="form-control" id="enquiryId" name="enquiryId" onkeypress="return isNumberKey(event);" maxlength="40" value="${EnquiryCode}">
                                            </c:otherwise>        
                                        </c:choose>
                                        <label class="control-label">Enquiry ID
                                        </label>
                                    </div>
                                    <div class="col-md-4 form-floating mb-3">

                                        <c:choose>
                                            <c:when test="${fn:length(newEnquiryList) > 0}">
                                                <c:forEach items="${newEnquiryList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" placeholder="Fill" class="form-control" id="customerName" name="coutmer896Name" maxlength="40" value="${list.coutmerName}" required="">
                                                            <input type="hidden" readonly id="pk" name="pk" class="form-control" maxlength="500" value="${list.sNo}" required>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" placeholder="Fill" class="form-control" id="customerName" name="coutmer896Name" maxlength="40" readonly="" value="${list.coutmerName}" required="">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" placeholder="Fill" class="form-control" id="customerName" name="coutmer896Name" maxlength="40" value="" required="">
                                            </c:otherwise>        
                                        </c:choose>
                                        <label class="control-label">Customer Name<a  style="color:red;">*</a> </label>
                                    </div>
                                    <div class="col-md-4 form-floating mb-3">

                                        <c:choose>
                                            <c:when test="${fn:length(newEnquiryList) > 0}">
                                                <c:forEach items="${newEnquiryList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" placeholder="Fill" class="form-control" id="companyName" name="companyName" maxlength="60" value="${list.companyName}">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" placeholder="Fill" class="form-control" id="companyName" name="companyName" maxlength="60" readonly="" value="${list.companyName}">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" placeholder="Fill" class="form-control" id="companyName" name="companyName" maxlength="60" value="">
                                            </c:otherwise>        
                                        </c:choose>
                                        <label class="control-label">Company Name</label>
                                    </div>
                                    <div class="col-md-4 form-floating mb-3">
                                        <div class="ContactNumber">Contact Number<a  style="color:red;">*</a></div>  
                                        <c:choose>
                                            <c:when test="${fn:length(newEnquiryList) > 0}">
                                                <c:forEach items="${newEnquiryList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="tel" class="form-control" value="" id="contactNumber" name="contactNumber" maxlength="15" value="${list.contactNumber}" onkeypress="return isNumberKey(event)" required="">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="tel" class="form-control" value="" id="contactNumber" name="contactNumber" maxlength="15" readonly="" value="${list.contactNumber}" onkeypress="return isNumberKey(event)" required="">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="tel" class="form-control" value="" id="contactNumber" name="contactNumber" maxlength="15" onkeypress="return isNumberKey(event)" required="">
                                            </c:otherwise>        
                                        </c:choose>


                                    </div>

                                    <div class="col-md-4 form-floating mb-3">

                                        <c:choose>
                                            <c:when test="${fn:length(newEnquiryList) > 0}">
                                                <c:forEach items="${newEnquiryList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" class="form-control"  id="Email" name="Email" value="${list.email}" maxlength="35" onchange="return validateEmail(this);">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" class="form-control"  id="Email" name="Email" readonly="" value="${list.email}" maxlength="35" onchange="return validateEmail(this);">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" class="form-control"  id="Email" name="Email" value="" maxlength="35" onchange="return validateEmail(this);">
                                            </c:otherwise>        
                                        </c:choose>
                                        <label class="control-label">Email ID</label>
                                    </div>
                                    <div class="col-md-4 form-floating mb-3">

                                        <c:choose>
                                            <c:when test="${fn:length(newEnquiryList) > 0}">
                                                <c:forEach items="${newEnquiryList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <select class="form-select" id="Property" name="Property">
                                                                <option selected="" value="${list.property}">${list.property}</option>
                                                                <option value="Property-1">Property-1</option>
                                                                <option value="Property-2">Property-2</option>
                                                                <option value="Property-3">Property-3</option>
                                                            </select>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" class="form-control"  id="Property" name="Property" readonly="" value="${list.property}" maxlength="35">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <select class="form-select" id="Property" name="Property">
                                                    <option selected="" disabled="">Select an option</option>
                                                    <option value="Property-1">Property-1</option>
                                                    <option value="Property-2">Property-2</option>
                                                    <option value="Property-3">Property-3</option>
                                                </select>
                                            </c:otherwise>        
                                        </c:choose>
                                        <label class="control-label">Property Name</label>
                                    </div>
                                    <div class="col-md-4 form-floating mb-3">

                                        <c:choose>
                                            <c:when test="${fn:length(newEnquiryList) > 0}">
                                                <c:forEach items="${newEnquiryList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <select class="form-select" id="Unit" name="Unit">
                                                                <option selected="" value="${list.unit}">${list.unit}</option>
                                                                <option value="Unit-1">Unit-1</option>
                                                                <option value="Unit-2">Unit-2</option>
                                                                <option value="Unit-3">Unit-3</option>
                                                            </select>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" class="form-control"  id="Unit" name="Unit" readonly="" value="${list.unit}" maxlength="35">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <select class="form-select" id="Unit" name="Unit">
                                                    <option selected="" disabled="">Select an option</option>
                                                    <option value="Unit-1">Unit-1</option>
                                                    <option value="Unit-2">Unit-2</option>
                                                    <option value="Unit-3">Unit-3</option>
                                                </select>
                                            </c:otherwise>        
                                        </c:choose>
                                        <label class="control-label">Unit Number </label>
                                    </div>

                                    <div class="col-md-4 form-floating mb-3">

                                        <c:choose>
                                            <c:when test="${fn:length(newEnquiryList) > 0}">
                                                <c:forEach items="${newEnquiryList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <textarea placeholder="Fill" class="form-control" id="remarks" name="remarks" value="${list.remarks}" maxlength="250">${list.remarks}</textarea>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <textarea placeholder="Fill" class="form-control" id="remarks" name="remarks" readonly="" value="${list.remarks}" maxlength="250">${list.remarks}</textarea>
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <textarea placeholder="Fill" class="form-control" id="remarks" name="remarks" maxlength="250"></textarea>
                                            </c:otherwise>        
                                        </c:choose>
                                        <label class="control-label">Remarks</label>
                                    </div>
                                    <div class="col-md-9 col-sm-9 mt-3 col-xs-12 col-md-offset-5">
                                        
                                        <c:if test="${action eq 'view'}">
                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                                    <a href="../tenant/newEnquiryList.htm" class="btn btn-danger" >Cancel</a>
                                            </div>
                                            </c:if>
                                        <c:if test="${action ne 'view' && action ne 'edit'}">
                                        <button type="submit" class="btn btn-primary" style="">Save</button>
                                        <a href="#" class="btn btn-danger" id="cancel-button">Cancel</a>
                                        </c:if>
                                        <c:if test="${action eq 'edit'}">
                                        <button type="submit" class="btn btn-primary" style="">Save</button>
                                        <a href="#" class="btn btn-danger" id="cancel-button">Cancel</a>
                                        </c:if>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <!-- End #main -->

        <script>
            $(function () {
                var input = document.querySelector("#contactNumber");
                var myinput = window.intlTelInput(input, {
                    initialCountry: "om",
                    onlyCountries: ["om", "in", "ae"],
                    hiddenInput: "full",
                    separateDialCode: true,
                    autoHideDialCode: false,
                    utilsScript: "//cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.3/js/utils.js",
                });
                $("#contactNumber").change(function () {
                    var full_number = myinput.getNumber(intlTelInputUtils.numberFormat.E164);
                    $("#contactNumber").val(full_number);
                    if (myinput.isValidNumber() == false) {
                        $("#contactNumber").val("");
                        swal("Please enter valid mobile number");
                        return false;
                    }
                });
            });




            $(document).ready(function () {
                $('#cancel-button').click(function () {
                    Swal.fire({
                        title: 'Cancel Adding Enquiry?',
                        icon: 'warning',
                        text: 'Click “OK” to cancel adding the Enquiry. The data entered will not be saved.',
                        showCancelButton: true,
                        confirmButtonText: 'OK',
                        cancelButtonText: 'Cancel',
                        customClass: {
                            confirmButton: 'swal-confirm-button',
                            cancelButton: 'swal-cancel-button'
                        }
                    }).then((result) => {
                        if (result.isConfirmed) {
                            // Code to execute if OK button is clicked
                            // For example, you can redirect to another page
                            window.location.href = '../tenant/newEnquiryList.htm';
                        }
                    });
                });
            });



        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js" integrity="sha512-DNeDhsl+FWnx5B1EQzsayHMyP6Xl/Mg+vcnFPXGNjUZrW28hQaa1+A4qL9M+AiOMmkAhKAWYHh1a+t6qxthzUw==" crossorigin="anonymous"></script>
        <script src="../common/theme/js/custom.js"></script>




        <!-- SweetAlert -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css">


    </body>
</html>