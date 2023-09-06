<%-- 
    Document   : bookingManagementDetails
    Created on : 24 Jan, 2022, 1:33:29 PM
    Author     : buvan
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css" integrity="sha256-FAOaXTpl90/K8cXmSdsskbQN3nKYulhCpPbcFzGTWKI=" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css" integrity="sha512-gxWow8Mo6q6pLa1XH/CcH8JyiSDEtiwJV78E+D+QP0EVasFs8wKXq16G8CLD4CJ2SnonHr4Lm/yY2fSI2+cbmw==" crossorigin="anonymous" />
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.20/dist/sweetalert2.min.css">
        <link href="../common/validate/validationEngine.css" rel="stylesheet" type="text/css"/>
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.min.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.js" type="text/javascript"></script>
        <script src="../common/datepicker/datetimepicker_css.js" type="text/javascript"></script>
        <title>Arete Iconic</title>
        <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">

        <style>

            *{
                margin: 0;
                padding: 0;
            }
            body{
                color: #333333;
            }
            .numberDiv{
                height: 120px;/*
                width: 170px;*/
                justify-content: center;
                align-items: center;
                display: flex;
                color: #ffffff;
                font-size: 20px;
                text-align: center;
                font-family:Verdana, Geneva, Tahoma, sans-serif;
                margin-bottom: 0;
                border: 2px solid black;
            }
            #boxesContainer{
                display: grid;
                grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr;
            }

            #Occupied{
                background-color: #198754;
                cursor: pointer;
            }
            #Vacant{
                background-color: #dc3545; 
                cursor: pointer;
            }
            #Booked{
                background-color: #ffc107; 
                cursor: pointer;
            }
            .redClass{
                background-color: #dc3545;
            }
            .greenClass{
                background-color: #198754;
            }
            .yellowClass{
                background-color: #ffc107;
            }

            /* without horizontal scrollbar for mobiles*/
            @media only screen and (max-width: 720px){

                .numberDiv {
                    width: auto;
                }
                section{
                    flex-direction: column;
                    width: 100%;
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
        <script>
            function selectAccAssetDetails()
            {

                myWindow = window.open("../assets/selectAccAssetDetails.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }

            function SelectEnquiryDetailsForm()
            {

                myWindow = window.open("../tenant/selectEnquiryDetails.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function SelectEnquiryDetailsForm2()
            {

                myWindow = window.open("../tenant/selectEnquiryDetails.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
        </script>
    </head>

    <body class="nav-md">
        <% java.util.Date d = new java.util.Date();%>

        <jsp:include page="../login/menu.htm"/>

        <jsp:include page="../login/footer.jsp"/>

        <main id="main" class="main">
            <div class="mt-3">
                <ul class="nav nav-pills">
                    <!--             <li class="nav-item"><a class="nav-link active" href="../tenant/bookingManagmentList.htm">Booking Management</a></li>
                                  <li class="nav-item"><a class="nav-link" href="../tenant/bookingDetailsList.htm">Booking Records</a></li>-->

                    <li class="nav-item"><a class="nav-link " href="../tenant/bookingManagmentList.htm">Occupancy</a></li>
                    <li class="nav-item"><a class="nav-link " href="../tenant/newEnquiryList.jsp">Enquiries</a></li>
                    <li class="nav-item"><a class="nav-link active" href="../tenant/bookingDetailsList.htm">Quotations</a></li>
                    <li class="nav-item"><a class="nav-link " href="../tenant/bookingPropertyDetailsList.htm">Bookings</a></li>
                </ul>
                <div class="text-end">
                    <a class="btn btn-primary btn-sm " href="../tenant/bookingDetailsList.htm"><i class="bi bi-eye "></i> Show Booking Records</a>
                </div>
            </div>
            <div class="pagetitle">

            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">
                            <div class="card-body">
                                <div class="card-title"><h5>Booking Details Form</h5></div>
                                <!--                                <form class="row validateForm" id="userform" action="../assets/assetsDetailsFormSubmit.htm"  method="post" enctype="multipart/form-data" onsubmit="return checkMand();">-->

                                <form class="row" id="userform" action="../tenant/bookingDetailsFormSubmit.htm"  method="post" enctype="multipart/form-data" onsubmit="return checkMand();">


                                    <div class="row">
                                        <!--                                        <div class="col-md-4 form-floating mb-3">
                                                                                    
                                        <c:choose>
                                            <c:when test="${fn:length(quotationDetailsList) > 0}">
                                                <c:forEach items="${quotationDetailsList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" readonly="" placeholder="Fill" class="form-control" id="quotationId" name="quotationId" onkeypress="return isNumberKey(event);" maxlength="40" value="${list.quotationId}">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" readonly="" placeholder="Fill" class="form-control" id="quotationId" name="quotationId" onkeypress="return isNumberKey(event);" maxlength="40" value="${list.quotationId}">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" readonly="" placeholder="Fill" class="form-control" id="quotationId" name="quotationId" onkeypress="return isNumberKey(event);" maxlength="40" value="${quotationCode}">
                                            </c:otherwise>        
                                        </c:choose>
                                            <label class="control-label">Quotation ID </label>
                                        </div>
                                        <div class="col-md-4  form-floating mb-3">
                                            
                                        <c:choose>
                                            <c:when test="${fn:length(quotationDetailsList) > 0}">
                                                <c:forEach items="${quotationDetailsList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" readonly="" placeholder="Fill" class="form-control" id="enquiryId1" name="enquiryId1" onkeypress="return isNumberKey(event);" maxlength="40" value="${list.enquiryId}">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" readonly="" placeholder="Fill" class="form-control" id="enquiryId1" name="enquiryId1" onkeypress="return isNumberKey(event);" maxlength="40" value="${list.enquiryId}" >
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" readonly="" placeholder="Fill" class="form-control" id="enquiryId" name="enquiryId1" onkeypress="return isNumberKey(event);" maxlength="40" value=""  onclick="return SelectEnquiryDetailsForm();">
                                            </c:otherwise>        
                                        </c:choose>
                                            <label class="control-label">Enquiry ID </label>
                                        </div>-->

                                        <div id="rentQuoteDetailsContainer">
                                            <div class="accordion-item">
                                                <h2 class="accordion-header" id="flush-headingOne">
                                                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                                        Quotation Details
                                                    </button>
                                                </h2>
                                                <div id="flush-collapseOne" class="accordion-collapse collapse show" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                                                    <div class="accordion-body row">
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">
                                                            <c:choose>
                                                                <c:when test="${fn:length(quotationDetailsList) > 0}">
                                                                    <c:forEach items="${quotationDetailsList}" var="list">
                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
                                                                                <input type="text" readonly="" placeholder="Fill" class="form-control" id="quotationId" name="quotationId" onkeypress="return isNumberKey(event);" maxlength="40" value="${list.quotationId}">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input type="text" readonly="" placeholder="Fill" class="form-control" id="quotationId" name="quotationId" onkeypress="return isNumberKey(event);" maxlength="40" value="${list.quotationId}">
                                                                            </c:otherwise> 
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" readonly="" placeholder="Fill" class="form-control" id="quotationId" name="quotationId" onkeypress="return isNumberKey(event);" maxlength="40" value="${quotationCode}">
                                                                </c:otherwise>        
                                                            </c:choose>
                                                            <label class="control-label">Quotation ID
                                                            </label>
                                                        </div>
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">
                                                            <c:choose>
                                                                <c:when test="${fn:length(quotationDetailsList) > 0}">
                                                                    <c:forEach items="${quotationDetailsList}" var="list">
                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
                                                                                <input type="text" readonly="" placeholder="Fill" class="form-control" id="enquiryId" name="enquiryId" onkeypress="return isNumberKey(event);" maxlength="40" value="${list.enquiryId}">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input type="text" readonly="" placeholder="Fill" class="form-control" id="enquiryId" name="enquiryId" onkeypress="return isNumberKey(event);" maxlength="40" value="${list.enquiryId}" >
                                                                            </c:otherwise> 
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" readonly="" placeholder="Fill" class="form-control" id="enquiryId" name="enquiryId" onkeypress="return isNumberKey(event);" maxlength="40" value=""  onclick="return SelectEnquiryDetailsForm2();">
                                                                </c:otherwise>        
                                                            </c:choose>
                                                            <label class="control-label">Enquiry ID </label>
                                                            </label>
                                                        </div>
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                                            <c:choose>
                                                                <c:when test="${fn:length(quotationDetailsList) > 0}">
                                                                    <c:forEach items="${quotationDetailsList}" var="list">
                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
                                                                                <input type="text" class="form-control" id="quotationNumber" name="quotationNumber" value="${list.quotationNumber}" autocomplete="off">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input type="text" class="form-control" readonly="" id="quotationNumber" name="quotationNumber" value="${list.quotationNumber}">
                                                                            </c:otherwise> 
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>                                                    
                                                                    <input type="text" placeholder="Fill" class="form-control" id="quotationNumber" name="quotationNumber" value="" oninput="handleInputChange(event)">
                                                                    <input type="text" placeholder="Fill" class="form-control" id="quotationNumber1" name="quotationNumber1" value="${quotationNumbercount}" style="display:none">
                                                                </c:otherwise>        
                                                            </c:choose>
                                                            <label class="control-label">Quotation Number <a class="text-danger">*</a></label>
                                                        </div>

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                                            <c:choose>
                                                                <c:when test="${fn:length(quotationDetailsList) > 0}">
                                                                    <c:forEach items="${quotationDetailsList}" var="list">
                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
                                                                                <input type="text" class="form-control"  placeholder="Fill" id="" name="quotationDate" value="<fmt:formatDate pattern="dd-MM-yyyy" value="${list.quotationDate}"/>" autocomplete="off">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input type="text" placeholder="Fill" class="form-control" readonly="" id="" name="quotationDate" value="<fmt:formatDate pattern="dd-MM-yyyy" value="${list.quotationDate}"/>">
                                                                            </c:otherwise> 
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>                                                    
                                                                    <input type="text" placeholder="Fill" class="form-control" id="quotationDate" name="quotationDate" value="">
                                                                </c:otherwise>        
                                                            </c:choose>
                                                            <label class="control-label">Quotation Date <a class="text-danger">*</a></label>
                                                        </div>

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                                            <c:choose>
                                                                <c:when test="${fn:length(quotationDetailsList) > 0}">
                                                                    <c:forEach items="${quotationDetailsList}" var="list">
                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
                                                                                <input type="text" class="form-control" id="" name="quotationExpiry" value="<fmt:formatDate pattern="dd-MM-yyyy" value="${list.quotationExpiry}"/>" autocomplete="off">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input type="text" class="form-control" readonly="" id="" name="quotationExpiry" value="<fmt:formatDate pattern="dd-MM-yyyy" value="${list.quotationExpiry}"/>">
                                                                            </c:otherwise> 
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>                                                    
                                                                    <input type="text" placeholder="Fill" class="form-control" id="quotationExpiry" name="quotationExpiry" value="">
                                                                </c:otherwise>        
                                                            </c:choose>
                                                            <label class="control-label">Quotation Expiry <a class="text-danger">*</a></label>
                                                        </div>

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                                            <c:choose>
                                                                <c:when test="${fn:length(quotationDetailsList) > 0}">
                                                                    <c:forEach items="${quotationDetailsList}" var="list">
                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
                                                                                <select placeholder="Fill" class="form-select" id="" name="currency" >
                                                                                    <option value="${list.currency}" selected="">${list.currency}</option>
                                                                                    <option>INR</option>
                                                                                    <option>USD</option>
                                                                                    <option>OMR</option>
                                                                                </select>   
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input type="text" class="form-control" readonly="" id="" name="currency" value="${list.currency}">
                                                                            </c:otherwise> 
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>                                                    
                                                                    <select placeholder="Fill" class="form-select" id="" name="currency" >
                                                                        <option selected="" disabled="">Select an option</option>
                                                                        <option>INR</option>
                                                                        <option>USD</option>
                                                                         <option>OMR</option>
                                                                    </select>
                                                                </c:otherwise>        
                                                            </c:choose>
                                                            <label class="control-label">Currency <a class="text-danger">*</a></label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!--                                    <h5 class="text-center">Property Details</h5>-->
                                            <div class="accordion-item">
                                                <h2 class="accordion-header" id="flush-headingTwo">
                                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                                                        Property Details
                                                    </button>
                                                </h2>
                                                <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                                                    <div class="accordion-body row">
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                                            <c:choose>
                                                                <c:when test="${fn:length(bookingPropertyDetailsList) > 0}">
                                                                    <c:forEach items="${bookingPropertyDetailsList}" var="list">
                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
                                                                                <input type="text" class="form-control" readonly="" id="assetCode" name="assetCode" value="${list.propertyCode}" autocomplete="off"  onclick="return selectAccAssetDetails();">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input type="text" class="form-control" readonly="" id="assetCode" value="${list.propertyCode}" name="assetCode"  onclick="return selectAccAssetDetails();">
                                                                            </c:otherwise> 
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>                                                    
                                                                    <input type="text" placeholder="Fill" class="form-control" id="assetCode" name="assetCode" value=""  onclick="return selectAccAssetDetails();">
                                                                </c:otherwise>        
                                                            </c:choose>
                                                            <label class="control-label">Property Code  <a class="text-danger">*</a></label>
                                                        </div>

                                                        <!--                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                                        <c:choose>
                                                            <c:when test="${fn:length(quoteList) > 0}">
                                                                <c:forEach items="${quoteList}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" id="" name="" value="${list.jointeeName1}" autocomplete="off">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <select class="form-select" placeholder="Fill" class="form-control" id="" name="" value="">
                                                                    <option>Choose</option>
                                                                </select>
                                                            </c:otherwise>        
                                                        </c:choose>
                                                        <label class="control-label">Property Name <a class="text-danger">*</a></label>
                                                    </div>-->

                                                        <div class="col-md-4 form-floating mb-3">




                                                            <c:choose>
                                                                <c:when test="${fn:length(bookingPropertyDetailsList) > 0}">
                                                                    <c:forEach items="${bookingPropertyDetailsList}" var="list">
                                                                        <%--<c:set value="${list.assetCode}" var="assetCode"/>--%>
                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
                                                                                <input type="text" readonly class="form-control" ${mand_status_1}  id="assetName" name="assetName" maxlength="40" value="${list.propertyName}" onkeypress="return isNumberKey3(event)">
                                                                                <input type="hidden" class="form-control" ${mand_status_1}  id="assetName1" name="assetName1" maxlength="40" value="${list.assetName}" >
                                                                                <input type="hidden" name="pk" value="${list.sno}">
                                                                                <input type="hidden" name="status" value="${list.status}">
                                                                                <input type="hidden" id="assetCode" name="assetCode" value="${list.assetCode}">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input type="text" class="form-control" id="assetName" readonly="" value="${list.propertyName}">
                                                                                <input type="hidden" id="assetCode" name="assetCode" value="${list.assetCode}">
                                                                            </c:otherwise> 
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>                                                    
                                                                    <input type="text" placeholder="Fill" class="form-control" ${mand_status_1} id="assetName" name="assetName" maxlength="40" value="" onkeypress="return isNumberKey3(event)" >
                                                                </c:otherwise>        
                                                            </c:choose>
                                                            <label class="control-label">Property Name <a  style="color:red;">*</a></label>      
                                                        </div>

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                                            <c:choose>
                                                                <c:when test="${fn:length(bookingPropertyDetailsList) > 0}">
                                                                    <c:forEach items="${bookingPropertyDetailsList}" var="list">
                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
                                                                                <input type="text" class="form-control" id="tenancyStartDate" name="tenancyStartDate" value="${list.tenancyStartDate}" autocomplete="off">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input type="text" class="form-control" readonly="" id="tenancyStartDate" name="tenancyStartDate" value="${list.tenancyStartDate}">
                                                                            </c:otherwise> 
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>                                                    
                                                                    <input type="text" placeholder="Fill" class="form-control" id="tenancyStartDate" name="tenancyStartDate" value="">
                                                                </c:otherwise>        
                                                            </c:choose>
                                                            <label class="control-label">Tenancy Start Date <a class="text-danger">*</a></label>
                                                        </div>

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                                            <c:choose>
                                                                <c:when test="${fn:length(bookingPropertyDetailsList) > 0}">
                                                                    <c:forEach items="${bookingPropertyDetailsList}" var="list">
                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
                                                                                <input type="text" class="form-control" id="tenancyEndDate" name="tenancyEndDate" value="${list.tenancyEndDate}" autocomplete="off">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input type="text" class="form-control" readonly="" id="tenancyEndDate" name="tenancyEndDate"  value="${list.tenancyEndDate}">
                                                                            </c:otherwise> 
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>                                                    
                                                                    <input type="text" placeholder="Fill" class="form-control" id="tenancyEndDate" name="tenancyEndDate" value="">
                                                                </c:otherwise>        
                                                            </c:choose>
                                                            <label class="control-label">Tenancy End Date <a class="text-danger">*</a></label>
                                                        </div>
                                                        <!--                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                                        <c:choose>
                                                            <c:when test="${fn:length(quoteList) > 0}">
                                                                <c:forEach items="${quoteList}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" id="" name="" value="${list.jointeeName1}" autocomplete="off">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <select class="form-select">
                                                                    <option>Choose</option>
                                                                </select>
                                                            </c:otherwise>        
                                                        </c:choose>
                                                        <label class="control-label">Floor <a class="text-danger">*</a></label>
                                                    </div>-->
                                                        <div class="col-md-4 form-floating mb-3">
                                                            <!--                                                        <input type="text" placeholder="Fill" class="form-control" required id="floor"  maxlength="40" value="" onkeypress="return isNumberKey3(event)">-->



                                                            <c:choose>
                                                                <c:when test="${fn:length(bookingPropertyDetailsList) > 0}">
                                                                    <c:forEach items="${bookingPropertyDetailsList}" var="list">
                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
                                                                                <select id="floor" name="floor" required="" class="form-control">
                                                                                    <option value="${list.mezzanineFloor}" selected >${list.mezzanineFloor}</option>
                                                                                    <option value="Basement 1">Basement 1</option>
                                                                                    <option value="Basement 2">Basement 2</option>
                                                                                    <option value="Mezzanine Floor">Mezzanine Floor</option></select>
                                                                                <input type="hidden" id="noOfFloors" value="" onfocus="return changeFloor();">
                                                                                <input type="hidden" id="mezzanineFloor" value="Y" onfocus="return changeFloor();">
                                                                                <input type="hidden" id="basement" value="Y" onfocus="return changeFloor();">
                                                                                <input type="hidden" id="subCode1" value="">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input type="text" class="form-control" readonly="" id="floor" name="floor"  value="${list.mezzanineFloor}">
                                                                            </c:otherwise> 
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>                                                    
                                                                    <select id="floor" name="floor" required="" class="form-control">
                                                                        <option selected disabled>please Select Option</option>
                                                                        <option value="Basement 1">Basement 1</option>
                                                                        <option value="Basement 2">Basement 2</option>
                                                                        <option value="Mezzanine Floor">Mezzanine Floor</option></select>
                                                                    <input type="hidden" id="noOfFloors" value="" onfocus="return changeFloor();">
                                                                    <input type="hidden" id="mezzanineFloor" value="Y" onfocus="return changeFloor();">
                                                                    <input type="hidden" id="basement" value="Y" onfocus="return changeFloor();">
                                                                    <input type="hidden" id="subCode1" value="">
                                                                </c:otherwise>        
                                                            </c:choose>
                                                            <label class="control-label">Floor

                                                                <a style="color:red;">*</a>

                                                            </label>

                                                        </div>
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                                            <c:choose>
                                                                <c:when test="${fn:length(bookingPropertyDetailsList) > 0}">
                                                                    <c:forEach items="${bookingPropertyDetailsList}" var="list">
                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
                                                                                <input type="text" class="form-control" id="" name="" value="${list.unitNo}" autocomplete="off">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input type="text" class="form-control" readonly="" id="" value="${list.unitNo}">
                                                                            </c:otherwise> 
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>                                                    
                                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                                                                </c:otherwise>        
                                                            </c:choose>
                                                            <label class="control-label">Unit Name/Unit No <a class="text-danger">*</a></label>
                                                        </div>
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                                            <c:choose>
                                                                <c:when test="${fn:length(bookingPropertyDetailsList) > 0}">
                                                                    <c:forEach items="${bookingPropertyDetailsList}" var="list">
                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
                                                                                <input type="text" class="form-control" id="baserent" name="baserent" value="${list.baserent}" onkeypress="return isNumberKey(event);">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input type="text" class="form-control" readonly="" id="baserent" name="baserent" value="${list.baserent}">
                                                                            </c:otherwise> 
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>                                                    
                                                                    <input type="text" placeholder="Fill" class="form-control" id="baserent" name="baserent" value="" onkeypress="return isNumberKey(event);">
                                                                </c:otherwise>        
                                                            </c:choose>
                                                            <label class="control-label">Base Rent <a class="text-danger">*</a></label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="accordion-item">
                                                <h2 class="accordion-header" id="flush-headingThree">
                                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="true" aria-controls="flush-collapseThree">
                                                        Customer/Tenancy details
                                                    </button>
                                                </h2>
                                                <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample" style="">
                                                    <div class="accordion-body row">
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                                            <c:choose>
                                                                <c:when test="${fn:length(customerTenancyDetailsList) > 0}">
                                                                    <c:forEach items="${customerTenancyDetailsList}" var="list">
                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">


                                                                                <select placeholder="Fill" class="form-select" id="customerType" name="customerType">
                                                                                    <option>${list.customerType}</option>
                                                                                    <c:forEach items="${customerType}" var="list">
                                                                                        <option>${list}</option>                                     
                                                                                    </c:forEach>

                                                                                </select> 
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input type="text" class="form-control" readonly="" id="customerType" value="${list.customerType}">
                                                                            </c:otherwise> 
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>                                                    
                                                                    <select placeholder="Fill" class="form-select" id="customerType" name="customerType">
                                                                        <option>Corporate</option>
                                                                        <option>Residential</option>
                                                                    </select> 
                                                                </c:otherwise>        
                                                            </c:choose>            


                                                            <label class="control-label">Select Customer Type <a class="text-danger">*</a></label>
                                                        </div>
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                                            <c:choose>
                                                                <c:when test="${fn:length(customerTenancyDetailsList) > 0}">
                                                                    <c:forEach items="${customerTenancyDetailsList}" var="list">
                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
                                                                                <input type="text" placeholder="Fill" class="form-control" id="customerName" name="customerName" value="${list.customerName}">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input type="text" placeholder="Fill" class="form-control" id="customerName" name="customerName" readonly="" value="${list.customerName}">
                                                                            </c:otherwise> 
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" placeholder="Fill" class="form-control" id="customerName" name="customerName" value="">
                                                                </c:otherwise>        
                                                            </c:choose>    

                                                            <label class="control-label">Customer Name <a class="text-danger">*</a></label>
                                                        </div>
                                                        <!--                                                        <div class="col-md-4 col-sm-12 col-xs-12 mb-3 form-check py-3">     
                                                                                                                    
                                                                                                                        
                                                                                                                                                                            
                                                                                                                            <input type="checkbox" placeholder="Fill" class="form-check-input" id="" name="" value="">
                                                                                                                                
                                                                                                                    
                                                                                                                    <label class="form-check-label">Add to Customer Master<a class="text-danger">*</a></label>
                                                                                                                </div>-->
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     


                                                            <c:choose>
                                                                <c:when test="${fn:length(customerTenancyDetailsList) > 0}">
                                                                    <c:forEach items="${customerTenancyDetailsList}" var="list">
                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
                                                                                <input type="text" placeholder="Fill" class="form-control" id="tenantId" name="tenantId"  value="${list.tenantId}">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input type="text" placeholder="Fill" class="form-control" id="tenantId" name="tenantId" readonly="" value="${list.tenantId}">
                                                                            </c:otherwise> 
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" placeholder="Fill" class="form-control" id="tenantId" name="tenantId" value="">
                                                                </c:otherwise>        
                                                            </c:choose>    

                                                            <label class="control-label">Tenant Id <a class="text-danger">*</a></label>
                                                        </div>
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3 onlyCorporteField">     

                                                            <c:choose>
                                                                <c:when test="${fn:length(customerTenancyDetailsList) > 0}">
                                                                    <c:forEach items="${customerTenancyDetailsList}" var="list">
                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
                                                                                <input type="text" placeholder="Fill" class="form-control" id="businessName" name="businessName"  value="${list.businessName}">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input type="text" placeholder="Fill" class="form-control" id="businessName" name="businessName" readonly="" value="${list.businessName}">
                                                                            </c:otherwise> 
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" placeholder="Fill" class="form-control" id="businessName" name="businessName" value="">
                                                                </c:otherwise>        
                                                            </c:choose>           

                                                            <label class="control-label">Company/Business Name <a class="text-danger">*</a></label>
                                                        </div>
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3 onlyCorporteField">     

                                                            <c:choose>
                                                                <c:when test="${fn:length(customerTenancyDetailsList) > 0}">
                                                                    <c:forEach items="${customerTenancyDetailsList}" var="list">
                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
                                                                                <input type="text" placeholder="Fill" class="form-control" id="businessCrNumber" name="businessCrNumber" value="${list.businessCrNumber}"  onkeypress="return isAlphaNumeric(event);">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input type="text" placeholder="Fill" class="form-control" id="businessCrNumber" name="businessCrNumber" value="${list.businessCrNumber}" readonly="" onkeypress="return isAlphaNumeric(event);">
                                                                            </c:otherwise> 
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" placeholder="Fill" class="form-control" id="businessCrNumber" name="businessCrNumber" value="" onkeypress="return isAlphaNumeric(event);">
                                                                </c:otherwise>        
                                                            </c:choose> 

                                                            <label class="control-label">Business CR No <a class="text-danger">*</a></label>
                                                        </div>

                                                        <table class="table table-bordered my-3" id="basicDetailsTable">
                                                            <c:if test="${action eq null}">
                                                                <thead>
                                                                    <tr><th>Contact Person</th>
                                                                        <th>Registered Email ID</th>
                                                                        <th>Phone Number</th>
                                                                        <th>Action</th>
                                                                    </tr></thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <input type="text" placeholder="Fill" class="form-control" id="contactPerson" name="contactPerson" value="">
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" placeholder="Fill" class="form-control" id="registeredEmailID" name="registeredEmailID" value="" onblur="validateEmail(this);">
                                                                        </td>
                                                                        <td>
                                                                            <input type="tel" maxlength="15" class="form-control" id="phoneNo" name="phoneNo" value="">
                                                                        </td>
                                                                        <td>
                                                                            <i class="fa fa-plus text-primary" onclick="addBasicDetailsRow(event)"></i> &nbsp; <i onclick="removeBasicDetailsRow(event)" class="fa fa-times text-danger"></i>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </c:if>

                                                            <c:if test="${action eq 'view'}">
                                                                <thead>
                                                                    <tr><th>Contact Person</th>
                                                                        <th>Registered Email ID</th>
                                                                        <th>Phone Number</th>
                                                                        <!--<th>Action</th>-->
                                                                    </tr></thead>
                                                                <tbody>
                                                                    <c:if test="${action eq 'view'}">
                                                                        <c:forEach items="${customerTenancyDetailsGridList}" var="list">
                                                                            <tr>
                                                                                <td>
                                                                                    <input type="text" placeholder="Fill" class="form-control" id="contactPerson" name="contactPerson" readonly="" value="${list.contactPerson}">
                                                                                </td>
                                                                                <td>
                                                                                    <input type="text" placeholder="Fill" class="form-control" id="registeredEmailID" name="registeredEmailID" readonly="" value="${list.registeredEmailID}" onblur="validateEmail(this);">
                                                                                </td>
                                                                                <td>
                                                                                    <input type="tel" maxlength="15" class="form-control" id="phoneNo" name="phoneNo" readonly="" value="${list.phoneNo}">
                                                                                </td>
                                                                                <!--                                                                        <td>
                                                                                                                                                            <i class="fa fa-plus text-primary" onclick="addBasicDetailsRow(event)"></i> &nbsp; <i onclick="removeBasicDetailsRow(event)" class="fa fa-times text-danger"></i>
                                                                                                                                                        </td>-->
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </c:if>
                                                                </tbody>
                                                            </c:if> 
                                                            <c:if test="${action eq 'edit'}">
                                                                <thead>
                                                                    <tr><th>Contact Person</th>
                                                                        <th>Registered Email ID</th>
                                                                        <th>Phone Number</th>
                                                                        <th>Action</th>
                                                                    </tr></thead>
                                                                <tbody>
                                                                    <c:if test="${action eq 'edit'}">
                                                                        <c:forEach items="${customerTenancyDetailsGridList}" var="list">
                                                                            <tr>
                                                                                <td>
                                                                                    <input type="text" placeholder="Fill" class="form-control" id="contactPerson" name="contactPerson"  value="${list.contactPerson}">
                                                                                </td>
                                                                                <td>
                                                                                    <input type="text" placeholder="Fill" class="form-control" id="registeredEmailID" name="registeredEmailID"  value="${list.registeredEmailID}" onblur="validateEmail(this);">
                                                                                </td>
                                                                                <td>
                                                                                    <input type="tel" maxlength="15" class="form-control" id="phoneNo" name="phoneNo"  value="${list.phoneNo}">
                                                                                </td>
                                                                                <td>
                                                                                    <i class="fa fa-plus text-primary" onclick="addBasicDetailsRow(event)"></i> &nbsp; <i onclick="removeBasicDetailsRow(event)" class="fa fa-times text-danger"></i>
                                                                                </td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </c:if>
                                                                </tbody>
                                                            </c:if>    
                                                        </table>
                                                        <div class="row" id="residentialSection">
                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     

                                                                <c:choose>
                                                                    <c:when test="${fn:length(customerTenancyDetailsList) > 0}">
                                                                        <c:forEach items="${customerTenancyDetailsList}" var="list">
                                                                            <c:choose>
                                                                                <c:when test="${action eq 'edit'}">
                                                                                    <input type="text" placeholder="Fill" class="form-control" id="billingAddress" name="billingAddress"  value="${list.billingAddress}">
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <input type="text" placeholder="Fill" class="form-control" id="billingAddress" name="billingAddress" readonly="" value="${list.billingAddress}">
                                                                                </c:otherwise> 
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" placeholder="Fill" class="form-control" id="billingAddress" name="billingAddress" value="">
                                                                    </c:otherwise>        
                                                                </c:choose>           

                                                                <label class="control-label">Billing Address </label>
                                                            </div>

                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     

                                                                <c:choose>
                                                                    <c:when test="${fn:length(customerTenancyDetailsList) > 0}">
                                                                        <c:forEach items="${customerTenancyDetailsList}" var="list">
                                                                            <c:choose>
                                                                                <c:when test="${action eq 'edit'}">
                                                                                    <input type="text" placeholder="Fill" class="form-control" id="permenamtAddress" name="permenamtAddress"  value="${list.permenamtAddress}">
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <input type="text" placeholder="Fill" class="form-control" id="permenamtAddress" name="permenamtAddress" readonly="" value="${list.permenamtAddress}">
                                                                                </c:otherwise> 
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" placeholder="Fill" class="form-control" id="permenamtAddress" name="permenamtAddress" value="">
                                                                    </c:otherwise>        
                                                                </c:choose>          

                                                                <label class="control-label">Permanent Address </label>
                                                            </div>

                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     

                                                                <c:choose>
                                                                    <c:when test="${fn:length(customerTenancyDetailsList) > 0}">
                                                                        <c:forEach items="${customerTenancyDetailsList}" var="list">
                                                                            <c:choose>
                                                                                <c:when test="${action eq 'edit'}">
                                                                                    <input type="text" placeholder="Fill" class="form-control" id="jointeeName1" name="jointeeName1"  value="${list.jointeeName1}">
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <input type="text" placeholder="Fill" class="form-control" id="jointeeName1" name="jointeeName1" readonly="" value="${list.jointeeName1}">
                                                                                </c:otherwise> 
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" placeholder="Fill" class="form-control" id="jointeeName1" name="jointeeName1" value="">
                                                                    </c:otherwise>        
                                                                </c:choose>          

                                                                <label class="control-label">Jointee Name1 </label>
                                                            </div>

                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     

                                                                <c:choose>
                                                                    <c:when test="${fn:length(customerTenancyDetailsList) > 0}">
                                                                        <c:forEach items="${customerTenancyDetailsList}" var="list">
                                                                            <c:choose>
                                                                                <c:when test="${action eq 'edit'}">
                                                                                    <input type="text" placeholder="Fill" class="form-control" id="jointeeAddress1" name="jointeeAddress1"  value="${list.jointeeAddress1}">
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <input type="text" placeholder="Fill" class="form-control" id="jointeeAddress1" name="jointeeAddress1" readonly="" value="${list.jointeeAddress1}">
                                                                                </c:otherwise> 
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" placeholder="Fill" class="form-control" id="jointeeAddress1" name="jointeeAddress1" value="">
                                                                    </c:otherwise>        
                                                                </c:choose>             

                                                                <label class="control-label">Jointee Address 1 </label>
                                                            </div>

                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     

                                                                <c:choose>
                                                                    <c:when test="${fn:length(customerTenancyDetailsList) > 0}">
                                                                        <c:forEach items="${customerTenancyDetailsList}" var="list">
                                                                            <c:choose>
                                                                                <c:when test="${action eq 'edit'}">
                                                                                    <input type="text" placeholder="Fill" class="form-control" id="jointeeName2" name="jointeeName2"  value="${list.jointeeName2}">
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <input type="text" placeholder="Fill" class="form-control" id="jointeeName2" name="jointeeName2" readonly="" value="${list.jointeeName2}">
                                                                                </c:otherwise> 
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" placeholder="Fill" class="form-control" id="jointeeName2" name="jointeeName2" value="">
                                                                    </c:otherwise>        
                                                                </c:choose>              

                                                                <label class="control-label">Jointee Name 2 </label>
                                                            </div>

                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     

                                                                <c:choose>
                                                                    <c:when test="${fn:length(customerTenancyDetailsList) > 0}">
                                                                        <c:forEach items="${customerTenancyDetailsList}" var="list">
                                                                            <c:choose>
                                                                                <c:when test="${action eq 'edit'}">
                                                                                    <input type="text" placeholder="Fill" class="form-control" id="jointeeAddress2" name="jointeeAddress2"  value="${list.jointeeAddress2}">
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <input type="text" placeholder="Fill" class="form-control" id="jointeeAddress2" name="jointeeAddress2" readonly="" value="${list.jointeeAddress2}">
                                                                                </c:otherwise> 
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" placeholder="Fill" class="form-control" id="jointeeAddress2" name="jointeeAddress2" value="">
                                                                    </c:otherwise>        
                                                                </c:choose>            

                                                                <label class="control-label">Jointee Address 2 </label>
                                                            </div>

                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     

                                                                <c:choose>
                                                                    <c:when test="${fn:length(customerTenancyDetailsList) > 0}">
                                                                        <c:forEach items="${customerTenancyDetailsList}" var="list">
                                                                            <c:choose>
                                                                                <c:when test="${action eq 'edit'}">
                                                                                    <input type="text" placeholder="Fill" class="form-control" id="sponsorName" name="sponsorName"  value="${list.sponsorName}">
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <input type="text" placeholder="Fill" class="form-control" id="sponsorName" name="sponsorName" readonly="" value="${list.sponsorName}">
                                                                                </c:otherwise> 
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" placeholder="Fill" class="form-control" id="sponsorName" name="sponsorName" value="">
                                                                    </c:otherwise>        
                                                                </c:choose>            

                                                                <label class="control-label">Sponsor name </label>
                                                            </div>
                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                                                <c:choose>
                                                                    <c:when test="${fn:length(customerTenancyDetailsList) > 0}">
                                                                        <c:forEach items="${customerTenancyDetailsList}" var="list">
                                                                            <c:choose>
                                                                                <c:when test="${action eq 'edit'}">


                                                                                    <select placeholder="Fill" class="form-select" id="customerType" name="customerType">
                                                                                        <option>${list.ifWorking}</option>
                                                                                        <c:forEach items="${ifWorking}" var="list">
                                                                                            <option>${list}</option>                                     
                                                                                        </c:forEach>

                                                                                    </select> 
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <input type="text" class="form-control" readonly="" id="ifWorking" value="${list.ifWorking}">
                                                                                </c:otherwise> 
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:when>
                                                                    <c:otherwise>                                                    
                                                                        <select class="form-select" id="ifWorking" name="ifWorking">
                                                                            <option>Select Option</option>
                                                                            <option>Working</option>
                                                                        </select>
                                                                    </c:otherwise>        
                                                                </c:choose>    

                                                                <label class="control-label">If working </label>
                                                            </div>
                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     

                                                                <c:choose>
                                                                    <c:when test="${fn:length(customerTenancyDetailsList) > 0}">
                                                                        <c:forEach items="${customerTenancyDetailsList}" var="list">
                                                                            <c:choose>
                                                                                <c:when test="${action eq 'edit'}">
                                                                                    <input type="text" placeholder="Fill" class="form-control" id="sponsorAddress" name="sponsorAddress"  value="${list.sponsorAddress}">
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <input type="text" placeholder="Fill" class="form-control" id="sponsorAddress" name="sponsorAddress" readonly="" value="${list.sponsorAddress}">
                                                                                </c:otherwise> 
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" placeholder="Fill" class="form-control" id="sponsorAddress" name="sponsorAddress" value="">
                                                                    </c:otherwise>        
                                                                </c:choose>            

                                                                <label class="control-label">Sponsor Address </label>
                                                            </div>
                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     

                                                                <c:choose>
                                                                    <c:when test="${fn:length(customerTenancyDetailsList) > 0}">
                                                                        <c:forEach items="${customerTenancyDetailsList}" var="list">
                                                                            <c:choose>
                                                                                <c:when test="${action eq 'edit'}">
                                                                                    <input type="text" placeholder="Fill" class="form-control" id="sponsorEmail" name="sponsorEmail"  value="${list.sponsorEmail}"onblur="validateEmail(this);">
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <input type="text" placeholder="Fill" class="form-control" id="sponsorEmail" name="sponsorEmail" readonly="" value="${list.sponsorEmail}" onblur="validateEmail(this);">
                                                                                </c:otherwise> 
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" placeholder="Fill" class="form-control" id="sponsorEmail" name="sponsorEmail" value="" onblur="validateEmail(this);">
                                                                    </c:otherwise>        
                                                                </c:choose>        

                                                                <label class="control-label">Sponsor Email ID </label>
                                                            </div>



                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                                                <label class="control-label">Id attachment <input type="file" placeholder="Fill" class="form-control" id="attachment" name="attachment" value=""></label>
                                                            </div>

                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     

                                                                <c:choose>
                                                                    <c:when test="${fn:length(customerTenancyDetailsList) > 0}">
                                                                        <c:forEach items="${customerTenancyDetailsList}" var="list">
                                                                            <c:choose>
                                                                                <c:when test="${action eq 'edit'}">
                                                                                    <input type="text" placeholder="Fill" class="form-control" id="idCardType" name="idCardType"  value="${list.idCardType}">
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <input type="text" placeholder="Fill" class="form-control" id="idCardType" name="idCardType" readonly="" value="${list.idCardType}">
                                                                                </c:otherwise> 
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" placeholder="Fill" class="form-control" id="idCardType" name="idCardType" value="">
                                                                    </c:otherwise>        
                                                                </c:choose>             

                                                                <label class="control-label">ID Card type </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="accordion-item">
                                                <h2 class="accordion-header" id="flush-headingFour">
                                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
                                                        Rent Details
                                                    </button>
                                                </h2>
                                                <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
                                                    <div class="accordion-body">
                                                        <table class="table table-bordered mb-3" id="rentDetailsTable">
                                                            <c:if test="${action eq null}">
                                                                <thead>
                                                                <th>S.No</th>
                                                                <th>Unit No</th>
                                                                <th style="width:250px;">Rent Period</th>
                                                                <th>Charges Quoted</th>
                                                                <th>VAT (%)</th>
                                                                <th>VAT Amount</th>
                                                                <th>Total Amount</th>
                                                                <th>Action</th>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <input type="text" placeholder="" class="form-control snos" id="sno" readonly="" name="" value="">
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" placeholder="" class="form-control" id="" name="unitNo1" value="">
                                                                        </td>
                                                                        <td>
                                                                            <input type="search" placeholder="" class="form-control rentPeiodClass" id="rentPeiod" readonly name="rentPeriod" value="">
                                                                        </td>
                                                                        <td>
                                                                            <input type="number" placeholder="" class="form-control" id="chargesQuoted" onInput="calcTotal()" name="chargesQuoted" value="">
                                                                        </td>
                                                                        <td>
                                                                            <input type="number" placeholder="" class="form-control" id="vatPercentage" name="vatPercentage" onInput="calcTotal()" value="0">
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" placeholder="" readonly class="form-control" id="vatAmount" name="vatAmount" value="">
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" placeholder="" readonly class="form-control" id="totalAmount" name="totalAmount" value="">
                                                                        </td>
                                                                        <td>
                                                                            <i class="fa fa-plus text-primary" onclick="addBasicDetailsRow(event)"></i> &nbsp; <i onclick="removeBasicDetailsRow(event)" class="fa fa-times text-danger"></i>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </c:if>
                                                            <c:if test="${action eq 'view'}">
                                                                <thead>
                                                                <th>S.No</th>
                                                                <th>Unit No</th>
                                                                <th style="width:250px;">Rent Period</th>
                                                                <th>Charges Quoted</th>
                                                                <th>VAT (%)</th>
                                                                <th>VAT Amount</th>
                                                                <th>Total Amount</th>
                                                                <!--<th>Action</th>-->
                                                                </thead>
                                                                <tbody>
                                                                    <c:if test="${action eq 'view'}">
                                                                        <c:forEach items="${rentDetailsList}" var="list">
                                                                            <tr>
                                                                                <td>
                                                                                    <input type="text" placeholder="" class="form-control snos" id="sno" readonly="" name="" value="${list.sno}">
                                                                                </td>
                                                                                <td>
                                                                                    <input type="text" placeholder="" class="form-control" id="" name="unitNo1" readonly="" value="${list.unitNo1}">
                                                                                </td>
                                                                                <td>
                                                                                    <input type="search" placeholder="" class="form-control rentPeiodClass" id="rentPeiod" readonly name="rentPeriod" value="${list.rentPeriod}">
                                                                                </td>
                                                                                <td>
                                                                                    <input type="number" placeholder="" class="form-control" id="chargesQuoted" onInput="calcTotal()" name="chargesQuoted" readonly="" value="${list.chargesQuoted}">
                                                                                </td>
                                                                                <td>
                                                                                    <input type="number" placeholder="" class="form-control" id="vatPercentage" name="vatPercentage" onInput="calcTotal()" readonly="" value="${list.vatPercentage}">
                                                                                </td>
                                                                                <td>
                                                                                    <input type="text" placeholder="" readonly class="form-control" id="vatAmount" name="vatAmount" value="${list.vatAmount}">
                                                                                </td>
                                                                                <td>
                                                                                    <input type="text" placeholder="" readonly class="form-control" id="totalAmount" name="totalAmount" value="${list.totalAmount}">
                                                                                </td>
                                                                                <!--                                                                                <td>
                                                                                                                                                                    <i class="fa fa-plus text-primary" onclick="addBasicDetailsRow(event)"></i> &nbsp; <i onclick="removeBasicDetailsRow(event)" class="fa fa-times text-danger"></i>
                                                                                                                                                                </td>-->
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </c:if>
                                                                </tbody>
                                                            </c:if> 
                                                            <c:if test="${action eq 'edit'}">
                                                                <thead>
                                                                <th>S.No</th>
                                                                <th>Unit No</th>
                                                                <th style="width:250px;">Rent Period</th>
                                                                <th>Charges Quoted</th>
                                                                <th>VAT (%)</th>
                                                                <th>VAT Amount</th>
                                                                <th>Total Amount</th>
                                                                <th>Action</th>
                                                                </thead>
                                                                <tbody>
                                                                    <c:if test="${action eq 'edit'}">
                                                                        <c:forEach items="${rentDetailsList}" var="list">
                                                                            <tr>
                                                                                <td>
                                                                                    <input type="text" placeholder="" class="form-control snos" id="sno" readonly="" name="" value="${list.sno}">
                                                                                </td>
                                                                                <td>
                                                                                    <input type="text" placeholder="" class="form-control" id="" name="unitNo1" value="${list.unitNo1}">
                                                                                </td>
                                                                                <td>
                                                                                    <input type="search" placeholder="" class="form-control rentPeiodClass" id="rentPeiod" readonly name="rentPeriod" value="${list.rentPeriod}">
                                                                                </td>
                                                                                <td>
                                                                                    <input type="number" placeholder="" class="form-control" id="chargesQuoted" onInput="calcTotal()" name="chargesQuoted" value="${list.chargesQuoted}">
                                                                                </td>
                                                                                <td>
                                                                                    <input type="number" placeholder="" class="form-control" id="vatPercentage" name="vatPercentage" onInput="calcTotal()" value="${list.vatPercentage}">
                                                                                </td>
                                                                                <td>
                                                                                    <input type="text" placeholder="" readonly class="form-control" id="vatAmount" name="vatAmount" value="${list.vatAmount}">
                                                                                </td>
                                                                                <td>
                                                                                    <input type="text" placeholder="" readonly class="form-control" id="totalAmount" name="totalAmount" value="${list.totalAmount}">
                                                                                </td>
                                                                                <td>
                                                                                    <i class="fa fa-plus text-primary" onclick="addBasicDetailsRow(event)"></i> &nbsp; <i onclick="removeBasicDetailsRow(event)" class="fa fa-times text-danger"></i>
                                                                                </td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </c:if>
                                                                </tbody>
                                                            </c:if>    
                                                        </table>

                                                    </div>
                                                </div>
                                            </div>

                                            <div class="accordion-item">
                                                <h2 class="accordion-header" id="flush-headingFive">
                                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">
                                                        Service Details
                                                    </button>
                                                </h2>
                                                <div id="flush-collapseFive" class="accordion-collapse collapse" aria-labelledby="flush-headingFive" data-bs-parent="#accordionFlushExample">
                                                    <div class="accordion-body row">
                                                        <table class="table table-bordered mb-3" id="serviceDetailstTable">
                                                            <c:if test="${action eq null}">
                                                                <thead>
                                                                <th>S.No</th>
                                                                <th>Service Category</th>
                                                                <th>Service Name</th>
                                                                <th>Charges Quoted</th>
                                                                <th>VAT (%)</th>
                                                                <th>VAT Amount</th>
                                                                <th>Total Amount</th>
                                                                <th>Action</th>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <input type="text" placeholder="" class="form-control snos" id="sno" readonly="" name="" value="">
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" placeholder="" class="form-control" id="" name="serviceCategory" value="">
                                                                        </td>
                                                                        <td>
                                                                            <input type="search" placeholder="" class="form-control" id=""  name="serviceName" value="">
                                                                        </td>
                                                                        <td>
                                                                            <input type="number" placeholder="" class="form-control" id="chargesQuoted" onInput="calcTotal()" name="chargesQuoted1" value="">
                                                                        </td>
                                                                        <td>
                                                                            <input type="number" placeholder="" class="form-control" id="vatPercentage" name="vatPercentage1" onInput="calcTotal()" value="0">
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" placeholder="" readonly class="form-control" id="vatAmount" name="vatAmount1" value="">
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" placeholder="" readonly class="form-control" id="totalAmount" name="totalAmount1" value="">
                                                                        </td>
                                                                        <td>
                                                                            <i class="fa fa-plus text-primary" onclick="addBasicDetailsRow(event)"></i> &nbsp; <i onclick="removeBasicDetailsRow(event)" class="fa fa-times text-danger"></i>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </c:if>
                                                            <c:if test="${action eq 'view'}">
                                                                <thead>
                                                                <th>S.No</th>
                                                                <th>Service Category</th>
                                                                <th>Service Name</th>
                                                                <th>Charges Quoted</th>
                                                                <th>VAT (%)</th>
                                                                <th>VAT Amount</th>
                                                                <th>Total Amount</th>
                                                                <!--<th>Action</th>-->
                                                                </thead>
                                                                <tbody>
                                                                    <c:if test="${action eq 'view'}">
                                                                        <c:forEach items="${ServiceDetailsList}" var="list">
                                                                            <tr>
                                                                                <td>
                                                                                    <input type="text" placeholder="" class="form-control snos" id="sno" readonly="" name="" value="${list.sno}">
                                                                                </td>
                                                                                <td>
                                                                                    <input type="text" placeholder="" class="form-control" id="" name="serviceCategory" readonly="" value="${list.serviceCategory}">
                                                                                </td>
                                                                                <td>
                                                                                    <input type="search" placeholder="" class="form-control" id=""  name="serviceName" readonly="" value="${list.serviceName}">
                                                                                </td>
                                                                                <td>
                                                                                    <input type="number" placeholder="" class="form-control" id="chargesQuoted" onInput="calcTotal()" readonly="" name="chargesQuoted1" value="${list.chargesQuoted1}">
                                                                                </td>
                                                                                <td>
                                                                                    <input type="number" placeholder="" class="form-control" id="vatPercentage" name="vatPercentage1" readonly="" onInput="calcTotal()" value="${list.vatPercentage1}">
                                                                                </td>
                                                                                <td>
                                                                                    <input type="text" placeholder="" readonly class="form-control" id="vatAmount" name="vatAmount1" value="${list.vatAmount1}">
                                                                                </td>
                                                                                <td>
                                                                                    <input type="text" placeholder="" readonly class="form-control" id="totalAmount" name="totalAmount1" value="${list.totalAmount1}">
                                                                                </td>
                                                                                <!--                                                                                <td>
                                                                                                                                                                    <i class="fa fa-plus text-primary" onclick="addBasicDetailsRow(event)"></i> &nbsp; <i onclick="removeBasicDetailsRow(event)" class="fa fa-times text-danger"></i>
                                                                                                                                                                </td>-->
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </c:if>
                                                                </tbody>
                                                            </c:if> 
                                                            <c:if test="${action eq 'edit'}">
                                                                <thead>
                                                                <th>S.No</th>
                                                                <th>Service Category</th>
                                                                <th>Service Name</th>
                                                                <th>Charges Quoted</th>
                                                                <th>VAT (%)</th>
                                                                <th>VAT Amount</th>
                                                                <th>Total Amount</th>
                                                                <th>Action</th>
                                                                </thead>
                                                                <tbody>
                                                                    <c:if test="${action eq 'edit'}">
                                                                        <c:forEach items="${ServiceDetailsList}" var="list">
                                                                            <tr>
                                                                                <td>
                                                                                    <input type="text" placeholder="" class="form-control snos" id="sno" readonly="" name="" value="${list.sno}">
                                                                                </td>
                                                                                <td>
                                                                                    <input type="text" placeholder="" class="form-control" id="" name="serviceCategory" value="${list.serviceCategory}">
                                                                                </td>
                                                                                <td>
                                                                                    <input type="search" placeholder="" class="form-control" id=""  name="serviceName" value="${list.serviceName}">
                                                                                </td>
                                                                                <td>
                                                                                    <input type="number" placeholder="" class="form-control" id="chargesQuoted" onInput="calcTotal()" name="chargesQuoted1" value="${list.chargesQuoted1}">
                                                                                </td>
                                                                                <td>
                                                                                    <input type="number" placeholder="" class="form-control" id="vatPercentage" name="vatPercentage1" onInput="calcTotal()" value="${list.vatPercentage1}">
                                                                                </td>
                                                                                <td>
                                                                                    <input type="text" placeholder="" readonly class="form-control" id="vatAmount" name="vatAmount1" value="${list.vatAmount1}">
                                                                                </td>
                                                                                <td>
                                                                                    <input type="text" placeholder="" readonly class="form-control" id="totalAmount" name="totalAmount1" value="${list.totalAmount1}">
                                                                                </td>
                                                                                <td>
                                                                                    <i class="fa fa-plus text-primary" onclick="addBasicDetailsRow(event)"></i> &nbsp; <i onclick="removeBasicDetailsRow(event)" class="fa fa-times text-danger"></i>
                                                                                </td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </c:if>
                                                                </tbody>
                                                            </c:if>    
                                                        </table>


                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                                            <c:choose>
                                                                <c:when test="${fn:length(ServiceDetailsList) > 0}">
                                                                    <c:forEach items="${ServiceDetailsList}" var="list">
                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
                                                                                <input type="text" class="form-control" id="securityDeposit" name="securityDeposit" value="${list.securityDeposit}" onkeypress="return isNumberKey(event);">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input type="text" class="form-control" readonly="" id="securityDeposit" name="securityDeposit" value="${list.securityDeposit}">
                                                                            </c:otherwise> 
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>                                                    
                                                                    <input type="text" placeholder="Fill" class="form-control" id="securityDeposit" name="securityDeposit" value="" onkeypress="return isNumberKey(event);">
                                                                </c:otherwise>        
                                                            </c:choose>
                                                            <label class="control-label">Security Deposit </label>
                                                        </div>

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                                            <c:choose>
                                                                <c:when test="${fn:length(ServiceDetailsList) > 0}">
                                                                    <c:forEach items="${ServiceDetailsList}" var="list">
                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
                                                                                <input type="text" class="form-control" id="advance" name="advance" value="${list.advance}" onkeypress="return isNumberKey(event);">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input type="text" class="form-control" readonly="" id="advance" name="advance" value="${list.advance}">
                                                                            </c:otherwise> 
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>                                                    
                                                                    <input type="text" placeholder="Fill" class="form-control" id="advance" name="advance" value="" onkeypress="return isNumberKey(event);">
                                                                </c:otherwise>        
                                                            </c:choose>
                                                            <label class="control-label">Advance</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="accordion-item">
                                                <h2 class="accordion-header" id="flush-headingSix">
                                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSix" aria-expanded="false" aria-controls="flush-collapseSix">
                                                        Terms and Conditions
                                                    </button>
                                                </h2>
                                                <div id="flush-collapseSix" class="accordion-collapse collapse" aria-labelledby="flush-headingSix" data-bs-parent="#accordionFlushExample">
                                                    <div class="accordion-body row">
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group mb-3">  
                                                            <label class="control-label">Payment Terms </label>
                                                            <c:choose>
                                                                <c:when test="${fn:length(TermsandConditionList) > 0}">
                                                                    <c:forEach items="${TermsandConditionList}" var="list">
                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
                                                                                <input type="text" class="form-control" id="paymentTerms" name="paymentTerms" value="${list.paymentTerms}" autocomplete="off">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input type="text" class="form-control" readonly="" id="paymentTerms" name="paymentTerms" value="${list.paymentTerms}">
                                                                            </c:otherwise> 
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>                                                    
                                                                    <input type="text" class="form-control" id="paymentTerms" name="paymentTerms" value="" autocomplete="off">
                                                                </c:otherwise>        
                                                            </c:choose>

                                                        </div>

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group mb-3">
                                                            <label class="control-label">Contract Terms</label>
                                                            <c:choose>
                                                                <c:when test="${fn:length(TermsandConditionList) > 0}">
                                                                    <c:forEach items="${TermsandConditionList}" var="list">
                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
                                                                                <input type="text" class="form-control" id="contactTerms" name="contactTerms" value="${list.contactTerms}" autocomplete="off">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input type="text" class="form-control" readonly="" id="contactTerms" name="contactTerms" value="${list.contactTerms}">
                                                                            </c:otherwise> 
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>                                                    
                                                                    <input type="text" class="form-control" id="contactTerms" name="contactTerms" value="" autocomplete="off">
                                                                </c:otherwise>        
                                                            </c:choose>

                                                        </div>

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group mb-3">  
                                                            <label class="control-label">Add Attachment</label>
                                                            <c:choose>
                                                                <c:when test="${fn:length(quoteList) > 0}">
                                                                    <c:forEach items="${quoteList}" var="list">
                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
                                                                                <input type="text" class="form-control" id="" name="" value="${list.jointeeName1}" autocomplete="off">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
                                                                            </c:otherwise> 
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>                                                    
                                                                    <input type="file" placeholder="Fill" class="form-control" id="" name="" value="">
                                                                </c:otherwise>        
                                                            </c:choose>

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <!--                                    <div class="col-md-12 mt-3">
                                                                                    <div class="col-md-6 mx-auto">
                                                                                        <input type="submit" value="Save" class="btn btn-primary">
                                                                                        <input type="submit" value="Save As Draft" class="btn btn-primary">
                                                                                        <a class="btn btn-primary" href="#">Cancel</a>
                                                   
                                            <a class="btn btn-primary" href="#">Print Preview</a>
                                                                                    </div>
                                                                                </div>-->

                                        </div>
                                    </div> 

                                    <c:if test="${action eq 'view'}">
                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                                     <a href="../tenant/bookingDetailsList.htm" class="btn btn-danger">Cancel</a>
                                            </div>
                                            </c:if>

                                    <c:if test="${action ne 'view' && action ne 'edit'}">
                                        <div class="col-md-9 col-sm-9 mt-3 col-xs-12 col-md-offset-5">
                                            <button type="submit" class="btn btn-primary" style="" id="ok-button">Save</button>
                                            <a href="#" class="btn btn-danger" id="cancel-button">Cancel</a>
                                        </div>
                                    </c:if>

                                    <c:if test="${action eq 'edit'}">

                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                            <button type="submit" class="btn btn-primary" style="">Save</button>
                                            <a href="#" class="btn btn-danger" id="cancel-button">Cancel</a>
                                        </div>

                                    </c:if>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </section>

        </main><!-- End #main -->
        <script>
          function handleInputChange(e) {
  console.log("handleInputChange called");
  
  var quotationNumber = document.getElementById('quotationNumber').value;
  var quotationNumbercountList = document.getElementById('quotationNumber1').value;
  
  console.log("quotationNumber:", quotationNumber);
  console.log("quotationNumbercountList:", quotationNumbercountList);
  
  // Convert the string value to an array
  quotationNumbercountList = JSON.parse(quotationNumbercountList);
  
  // Check if quotationNumber exists in quotationNumbercountList
  var found = false;
  for (var i = 0; i < quotationNumbercountList.length; i++) {
    if (quotationNumber === quotationNumbercountList[i].toString()) {
      found = true;
      break;
    }
  }
  
  if (found) {
    alert("The quotation number exists in the list!");
    document.getElementById('quotationNumber').value = "";
  } 
}


        </script>
        <script>
            //window.onload = minRentGen();
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha256-bqVeqGdJ7h/lYPq6xrPv/YGzMEb6dNxlfiTUHSgRCp8=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js" integrity="sha512-DNeDhsl+FWnx5B1EQzsayHMyP6Xl/Mg+vcnFPXGNjUZrW28hQaa1+A4qL9M+AiOMmkAhKAWYHh1a+t6qxthzUw==" crossorigin="anonymous"></script>
        <script>
            $('.datepicker1').datepicker({
                format: 'dd-mm-yyyy',
                startDate: '0m +0m',
                autoclose: true,
                todayHighlight: true,
                orientation: 'bottom',

                //  container: '.pick1'
            }).datepicker('update', new Date());

        </script>
        <script>
//            $("#residentialSection").hide();
            $("#customerType").change(function (event) {
                if ($("#customerType").val() == 'Residential') {
                    $("#residentialSection").show();
                    $(".onlyCorporteField").hide();
                } else {
                    $("#residentialSection").hide();
                    $(".onlyCorporteField").show();
                }
            })
            $("#customerType").change(function (event) {
                if (event.target.value == 'Residential') {
                    $("#residentialSection").show();
                    $(".onlyCorporteField").hide();
                } else {
                    $("#residentialSection").hide();
                    $(".onlyCorporteField").show();
                }
            })
            $(function () {
                $("#quotationDate, #quotationExpiry, #tenancyStartDate, #tenancyEndDate")
                        .datepicker({
                            format: 'dd-mm-yyyy',
                            autoclose: true,
                            orientation: 'bottom',

                        }).datepicker('update', new Date())

                $("#rentDetailsTable .snos").each(function (index) {
                    $(this).val(index + 1)
                })
                $("#serviceDetailstTable .snos").each(function (index) {
                    $(this).val(index + 1)
                })

                var tenancyStartDate = $("#tenancyStartDate").val();
                var tenancyEndDate = $("#tenancyEndDate").val();
                $("#rentPeiod").val(tenancyEndDate + " to " + tenancyStartDate)
                $("#tenancyStartDate, #tenancyEndDate").change(function () {
                    $(".rentPeiod").val(tenancyEndDate + " to " + tenancyStartDate)
                })
                $(".table .fa-times:first").hide();
            })


            function addBasicDetailsRow(event) {
                var tr = $(event.target).closest('tr');
                var clone = tr.clone();
                clone.find(':text').val('');
                tr.after(clone)
                $(".table .fa-times").show();
                $(".table .fa-times:first").hide();
                $("#rentDetailsTable .snos").each(function (index) {
                    $(this).val(index + 1)
                })
                $("#serviceDetailstTable .snos").each(function (index) {
                    $(this).val(index + 1)
                })

            }
            function removeBasicDetailsRow(event) {
                var tr = $(event.target).closest('tr');

                tr.remove();

                $("#rentDetailsTable .snos").each(function (index) {
                    $(this).val(index + 1)
                })
                $("#serviceDetailstTable .snos").each(function (index) {
                    $(this).val(index + 1)
                })

            }
            function calcTotal() {



                var table = document.getElementById("rentDetailsTable");
                var row12 = table.rows[1];
                //                           console.log(row12.childNodes[3].nextSibling.nextElementSibling.childNodes[0].value);
                var arrRate = [];
                var itemRate;
                var itemTotal;
                var itemQty;
                var itemtotal, vatpers, vatTotal, discpers, discAmount;

                // var vatarrRate = [];
                var qtarrRate = [];
                $("table tbody tr").each(function () {
                    itemRate = $(this).find('#chargesQuoted').val();

                    vatpers = $(this).find('#vatPercentage').val();


                    console.log(vatpers)
                    itemTotal = Number(itemRate);
                    vatTotal = itemTotal * Number(vatpers) / 100;
                    discAmount = itemTotal * Number(discpers) / 100;
                    $(this).find('#vatAmount').val(vatTotal.toFixed(3));

                    itemTotal = itemTotal + vatTotal;
                    $(this).find('#totalAmount').val(itemTotal.toFixed(3));

                })

            }
        </script>
        <script>
            $(function () {
                var input = document.querySelector("#phoneNo");
                var myinput = window.intlTelInput(input, {
                    initialCountry: "om",
                    onlyCountries: ["om", "in", "ae"],
                    hiddenInput: "full",
                    separateDialCode: true,
                    autoHideDialCode: false,
                    utilsScript: "//cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.3/js/utils.js",
                });
                $("#phoneNo").change(function () {
                    var full_number = myinput.getNumber(intlTelInputUtils.numberFormat.E164);
                    $("#phoneNo").val(full_number);
                    if (myinput.isValidNumber() == false) {
                        $("#phoneNo").val("");
                        swal("Please enter valid mobile number");
                        return false;
                    }
                });
            });


//            $(document).ready(function () {
//                $('#cancel-button').click(function () {
//                    Swal.fire({
//                        title: 'Not to save Enquiry details',
//                        icon: 'warning',
//                        text: 'Click "OK" to cancel saving the Enquiry,the data entered  not be saved  ?',
//                        showCancelButton: true,
//                        confirmButtonText: 'OK',
//                        cancelButtonText: 'Cancel',
//                        customClass: {
//                            confirmButton: 'swal-confirm-button',
//                            cancelButton: 'swal-cancel-button'
//                        }
//                    }).then((result) => {
//                        if (result.isConfirmed) {
//                            // Code to execute if OK button is clicked
//                            // For example, you can redirect to another page
//                            window.location.href = '../tenant/bookingDetailsList.htm';
//                        }
//                    });
//                });
//            });

            $(document).ready(function () {
                $('#cancel-button').click(function () {
                    if (confirm('Not to save Enquiry details. Are you sure you want to cancel saving the Enquiry?')) {
                        // Code to execute if OK button is clicked
                        // For example, you can redirect to another page
                        window.location.href = '../tenant/bookingDetailsList.htm';
                    }
                });
            });

        </script>

        <!--       <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.js"></script>
               <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css">-->

        <script src="../common/theme/js/custom.js"></script>












    </body>

</html>
