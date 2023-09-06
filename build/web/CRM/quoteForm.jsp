<%-- 
    Document   : LeadConvertForm
    Created on : 14 Sep, 2016, 10:25:51 AM
    Author     : ebs-sdd27
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
        <title>Arete Iconic</title>
        <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css" integrity="sha512-gxWow8Mo6q6pLa1XH/CcH8JyiSDEtiwJV78E+D+QP0EVasFs8wKXq16G8CLD4CJ2SnonHr4Lm/yY2fSI2+cbmw==" crossorigin="anonymous" />
        
        <script>
            
            function selectAssetDetails()
            {
                myWindow = window.open("../assets/selectRentQuoteProprtyDetails.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                window.close();
            }
            
            </script>

    </head>
    <body class="nav-md">
        <jsp:include page="../login/menu.htm" />

                        <jsp:include page="../login/footer.jsp" />

        <main id="main" class="main">
            <div class="mt-3">
                <jsp:include page="../login/headerlink.htm?submodule=Rent Quote&tab=Rent Quote&pagetype=form"/>
            </div>
            <div class="pagetitle">

            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h5>Rent Quote Details</h5>
                                </div>
                                <form class="row validateForm" id="quoteForm" action="../CRM/rentQuoteFormSubmitNew.htm"  method="post" enctype="multipart/form-data">
                                    <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingOne">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
        Quotation Details
      </button>
    </h2>
    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body row">
                                             <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            <c:choose>
                                                <c:when test="${fn:length(quoteList) > 0}">
                                                    <c:forEach items="${quoteList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="" name="" value="${list.jointeeName1}" autocomplete="off">
                                                                <input type="hidden" class="form-control" readonly="" id="quotationSNo" name="quotationSNo" value="${list.quotationSNo}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="Fill" class="form-control" id="quotationNumber" name="quotationNumber" value="${orderNo}">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Quotation Number <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="quotationDate" name="quotationDate"  value="${quotationDate}">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Quotation Date <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            <c:choose>
                                                <c:when test="${fn:length(quoteList) > 0}">
                                                    <c:forEach items="${quoteList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="" name="" value="${list.jointeeName1}" autocomplete="off">
                                                                <input type="hidden" class="form-control"  id="" value="${list.jointeeName1}" onkeypress="return isNumberKey4(event)" autocomplete="off">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
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
                                                <c:when test="${fn:length(quoteList) > 0}">
                                                    <c:forEach items="${quoteList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="" name="" value="${list.jointeeName1}" autocomplete="off">
                                                                <input type="hidden" class="form-control"  id="" value="${list.jointeeName1}" onkeypress="return isNumberKey4(event)" autocomplete="off">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <select placeholder="Fill" class="form-select" id="" name="currency" >
                                                        <option>OMR</option>
                                                        <option>USD</option>
                                                        <option>EUR</option>
                                                        <option>INR</option>
                                                        <option>JPY</option>
                                                        <option>GBP</option>
                                                        <option>AUD</option>
                                                        <option>CAD</option>
                                                        <option>CHF</option>
                                                        <option>CNY</option>
                                                        <option>HKD</option>
                                                        <option>NZD</option>
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
                                                    <input type="text" placeholder="Fill" class="form-control" readonly="" id="assetCode" name="assetCode" value="" onclick="return selectAssetDetails()">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Property Code <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
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
                                                    <input class="form-control" readonly placeholder="Fill" class="form-control" id="assetName" name="assetName" value="">
                                                        
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Property Name <a class="text-danger">*</a></label>
                                        </div>
                                    
                                  
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="tenancyStartDate" name="tenancyStartDate" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Tenancy Start Date <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="tenancyEndDate" name="tenancyEndDate" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Tenancy End date <a class="text-danger">*</a></label>
                                        </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            <c:choose>
                                                <c:when test="${fn:length(quoteList) > 0}">
                                                    <c:forEach items="${quoteList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="" name="" value="${list.jointeeName1}" autocomplete="off">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="mezzanineFloor" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" class="form-control" placeholder="Fill" readonly="" id="mezzanineFloor"   name="mezzanineFloor" value="${list.jointeeName1}">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Floor <a class="text-danger">*</a></label>
                                        </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
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
                                                    <input type="text" readonly placeholder="Fill" class="form-control" id="assetType1" name="assetType1" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Unit Name/Unit No <a class="text-danger">*</a></label>
                                        </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            <c:choose>
                                                <c:when test="${fn:length(quoteList) > 0}">
                                                    <c:forEach items="${quoteList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="" name="" value="${list.jointeeName1}" onkeypress="return isNumberKey(event);">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
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
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
        Customer/Tenancy Details
      </button>
    </h2>
    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body row">
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
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
                                                    <select placeholder="Fill" class="form-select" id="customerType" name="customerType" >
                                                        <option value="Corporate">Corporate</option>
                                                        <option value="Residential">Residential</option>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Select Customer Type <a class="text-danger">*</a></label>
                                        </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="customerName" name="customerName" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Customer Name <a class="text-danger">*</a></label>
                                        </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12  mb-3 form-check">     
                                            <c:choose>
                                                <c:when test="${fn:length(quoteList) > 0}">
                                                    <c:forEach items="${quoteList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="" name="" value="${list.jointeeName1}" autocomplete="off">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="checkbox" class="form-check-input" readonly="" disabled="" id="" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="checkbox" placeholder="Fill" class="form-check-input" id="" name="" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="form-check-label">Add To Customer Master</label>
                                        </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="tenantId" name="tenantId" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Tenant Id <a class="text-danger">*</a></label>
                                        </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3 onlyCorporteField">     
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="businessName" name="businessName" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Company/Business Name <a class="text-danger">*</a></label>
                                        </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3 onlyCorporteField">     
                                            <c:choose>
                                                <c:when test="${fn:length(quoteList) > 0}">
                                                    <c:forEach items="${quoteList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="" name="businessCRNo" value="${list.jointeeName1}" autocomplete="off">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="" name="businessCRNo" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" onkeypress="isAlphaNumeric(event)" placeholder="Fill" class="form-control" id="businessCRNo" name="businessCRNo" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Business CR No <a class="text-danger">*</a></label>
                                        </div>
          
                                    <table class="table table-bordered my-3" id="basicDetailsTable">
                                        <thead>
                                        <th>Contact Person</th>
                                        <th>Registered Email ID</th>
                                        <th>Phone Number</th>
                                        <th>Action</th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <input type="text" placeholder="Fill" class="form-control" id="contactPerson" name="contactPerson" value="">
                                                </td>
                                                <td>
                                                    <input type="text" placeholder="Fill" class="form-control" id="registeredEmailID" name="registeredEmailID" value="" onblur="validateEmail(this)">
                                                </td>
                                                <td>
                                                    <input maxlength="15" type="tel" class="form-control" id="phoneNo" name="phoneNo" value="">
                                                </td>
                                                <td>
                                                    <i class="fa fa-plus text-primary" onclick="addBasicDetailsRow(event)"></i> &nbsp; <i onclick="removeBasicDetailsRow(event)" class="fa fa-times text-danger"></i>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
          <div class="row" id="residentialSection">
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="BillingAddress" name="" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Billing Address <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="PermanentAddress" name="Permanent Address" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Permanent Address <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Jointee Name1 <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Jointee Address 1 <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Jointee Name 2 <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Jointee Address 2 <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Sponsor name <a class="text-danger">*</a></label>
                                        </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
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
                                                        <option>Select Option</option>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">If working <a class="text-danger">*</a></label>
                                        </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Sponsor Address <a class="text-danger">*</a></label>
                                        </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Sponsor Email ID <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
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
                                            <label class="control-label">ID attachment <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">ID Card type <a class="text-danger">*</a></label>
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
                                        <thead>
                                            <th>S.No</th>
                                        <th style="width:100px;">Unit No <a class="text-danger">*</a></th>
                                        <th style="width:250px;">Rent Period <a class="text-danger">*</a></th>
                                        <th>Charges Quoted <a class="text-danger">*</a></th>
                                        <th>VAT (%)</th>
                                        <th>VAT Amount</th>
                                        <th>Total Amount</th>
                                        <th>Action</th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <input type="text" placeholder="" class="form-control snos" id="sno" readonly="" name="sno" value="">
                                                </td>
                                                <td>
                                                    <input type="text" placeholder="" class="form-control" id="unitNo" name="unitNo" value="">
                                                </td>
                                                <td>
                                                    <input type="search" placeholder="" class="form-control rentPeiodClass" id="rentPeiod"  name="rentPeriod" value="">
                                                </td>
                                                <td>
                                                    <input type="number" placeholder="" onkeypress="isAlphaNumeric(event)" class="form-control" id="chargesQuoted" onInput="calcTotal()" name="chargesQuoted" value="vatPercentage">
                                                </td>
                                                <td>
                                                    <input type="number" placeholder="" class="form-control" id="vatPercentage" name=" vatPercentage" onInput="calcTotal()" value="0">
                                                </td>
                                                <td>
                                                    <input type="text" placeholder="" readonly class="form-control" id="vatAmount" name=" vatAmount" value="">
                                                </td>
                                                <td>
                                                    <input type="text" placeholder="" readonly class="form-control" id="totalAmount" name="totalAmount" value="">
                                                </td>
                                                <td>
                                                    <i class="fa fa-plus text-primary" onclick="addBasicDetailsRow(event)"></i> &nbsp; <i onclick="removeBasicDetailsRow(event)" class="fa fa-times text-danger"></i>
                                                </td>
                                            </tr>
                                        </tbody>
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
                                        <thead>
                                            <th>S.No</th>
                                        <th>Service Category <a class="text-danger">*</a></th>
                                        <th>Service Name <a class="text-danger">*</a></th>
                                        <th>Charges Quoted <a class="text-danger">*</a></th>
                                        <th>VAT (%)</th>
                                        <th>VAT Amount</th>
                                        <th>Total Amount</th>
                                        <th>Action</th>
                                        </thead>
                                        <tbody>
                                           <tr>
                                                <td>
                                                    <input type="text" placeholder="" class="form-control snos" id="sno" readonly="" name=" sno" value="">
                                                </td>
                                                <td>
                                                    <input type="text" placeholder="" class="form-control" id="serviceCategory" name="serviceCategory" value="">
                                                </td>
                                                <td>
                                                    <input type="search" placeholder="" class="form-control" id="serviceName"  name="serviceName" value="">
                                                </td>
                                                <td>
                                                    <input type="number" onkeypress="isAlphaNumeric(event)" placeholder="" class="form-control" id="chargesQuoted" onInput="calcTotal()" name="chargesQuoted" value="">
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
                                    </table>
                                    
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            <c:choose>
                                                <c:when test="${fn:length(quoteList) > 0}">
                                                    <c:forEach items="${quoteList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="" name="" value="${list.jointeeName1}" onkeypress="return isNumberKey(event);">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="securityDeposit" value="" onkeypress="return isNumberKey(event);">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Security Deposit <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            <c:choose>
                                                <c:when test="${fn:length(quoteList) > 0}">
                                                    <c:forEach items="${quoteList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="" name="" value="${list.jointeeName1}" onkeypress="return isNumberKey(event);">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="advance" value="" onkeypress="return isNumberKey(event);">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Advance <a class="text-danger">*</a></label>
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
                                        <label class="control-label">Payment Terms <a class="text-danger">*</a></label>
                                            <c:choose>
                                                <c:when test="${fn:length(quoteList) > 0}">
                                                    <c:forEach items="${quoteList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="" name="" value="${list.jointeeName1}" autocomplete="off">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id=""  value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <textarea class="" rows="3" name="paymentTerms"></textarea>
                                                </c:otherwise>        
                                            </c:choose>
                                            
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group mb-3">
                                        <label class="control-label">Contract Terms <a class="text-danger">*</a></label>
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
                                                    <textarea class="" rows="3" name="contactTerms"></textarea>
                                                </c:otherwise>        
                                            </c:choose>
                                            
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group mb-3">  
                                        <label class="control-label">Add Attachment<a class="text-danger">*</a></label>
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
                                                    <input type="file" placeholder="Fill" class="form-control" id="" name="addAttachment" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            
                                        </div>
      
                                  </div>
    </div>
                                    </div>
                                 <c:if test="${action ne 'view'}">   
                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5 my-3">
                                            <input id="saveQuoteBtn" type="submit" value="Save" class="btn btn-primary">
                                            <input id="saveQuoteBtn1" type="submit" value="Save As Draft" class="btn btn-primary">
                                            <a class="btn btn-danger" href="../CRM/quoteList.htm">Cancel</a>
<!--                                            <a class="btn btn-primary" href="#">Print Preview</a>-->
                                  
                                    </div>
                                        </c:if>

                                    <c:if test="${action eq 'view'}">
                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5 my-3">
                                         <a class="btn btn-danger" href="../CRM/quoteList.htm">Cancel</a>
                                          </div>
                                         </c:if>
                                    
                                </form>
                                    
                                    
                        
                            </section>

                            </main><!-- End #main -->
                        
                        <script>
                            $("#residentialSection").hide();
                            $("#customerType").change(function(event){
                                if($("#customerType").val() == 'Residential'){
                                    $("#residentialSection").show();
                                    $(".onlyCorporteField").hide();
                                } else {
                                    $("#residentialSection").hide();
                                    $(".onlyCorporteField").show();
                                }
                            })
                            $("#customerType").change(function(event){
                                if(event.target.value == 'Residential'){
                                    $("#residentialSection").show();
                                    $(".onlyCorporteField").hide();
                                } else {
                                    $("#residentialSection").hide();
                                    $(".onlyCorporteField").show();
                                }
                            })
                            
                            $(function(){
                                $("#quotationDate, #quotationExpiry, #tenancyStartDate, #tenancyEndDate")
                                        .datepicker({
                                    format: 'dd-mm-yyyy',
                                    autoclose: true,
                                    orientation:'bottom',
                                    
                                })
                                
                                $("#rentDetailsTable .snos").each(function(index){
                                   $(this).val(index + 1)
                                })
                                $("#serviceDetailstTable .snos").each(function(index){
                                   $(this).val(index + 1)
                                })
                                
                                var tenancyStartDate = $("#tenancyStartDate").val();
                            var tenancyEndDate = $("#tenancyEndDate").val();
                            $("#rentPeiod").val(tenancyEndDate +" to "+ tenancyStartDate)
                            $("#tenancyStartDate, #tenancyEndDate").change(function() {
                                $(".rentPeiod").val(tenancyEndDate +" to "+ tenancyStartDate)
                            })
                                $(".table .fa-times:first").hide();
                            })
                            
                            
                            function addBasicDetailsRow(event){
                                var tr = $(event.target).closest('tr');
                                var clone = tr.clone();
                                clone.find(':text').val('');
                                clone.find('#chargesQuoted').val('');
                                clone.find('#vatPercentage').val('');
                                tr.after(clone)
                                $(".table .fa-times").show();
                                $(".table .fa-times:first").hide();
                                $("#rentDetailsTable .snos").each(function(index){
                                   $(this).val(index + 1)
                                })
                                $("#serviceDetailstTable .snos").each(function(index){
                                   $(this).val(index + 1)
                                })
                                
                            }
                            function removeBasicDetailsRow(event){
                                var tr = $(event.target).closest('tr');
                                
                                tr.remove();
                                
                                $("#rentDetailsTable .snos").each(function(index){
                                   $(this).val(index + 1)
                                })
                                $("#serviceDetailstTable .snos").each(function(index){
                                   $(this).val(index + 1)
                                })
                                
                            }
                            function calcTotal(){
               
                           

                           var table = document.getElementById("rentDetailsTable");
                 var row12 = table.rows[1];
//                           console.log(row12.childNodes[3].nextSibling.nextElementSibling.childNodes[0].value);
                            var arrRate = [];
                             var itemRate ;
                              var itemTotal;
                              var itemQty;
                              var itemtotal, vatpers, vatTotal, discpers, discAmount;
                              
                           // var vatarrRate = [];
                            var qtarrRate = [];
                            $("table tbody tr").each(function(){
                                itemRate = $(this).find('#chargesQuoted').val();
                                
                                vatpers = $(this).find('#vatPercentage').val();
                                
                                
                                console.log(vatpers)
                                itemTotal = Number(itemRate);
                                vatTotal = itemTotal * Number(vatpers) / 100;
                                discAmount = itemTotal * Number(discpers) / 100;
                                $(this).find('#vatAmount').val(vatTotal.toFixed(3));
                                
                                itemTotal = itemTotal+ vatTotal;
                                $(this).find('#totalAmount').val(itemTotal.toFixed(3));
                                
                            })

                        }
                    
                        $('#quotationExpiry').on('change', function () {
                            var dateFrom = $('#quotationDate').datepicker('getDate');
                var dateTo = $(this).datepicker('getDate');
                if (dateFrom >= dateTo) {
                    swal("Quotation expiry date should be greater than quotation date.");
                    $(this).val('')
                }
                        })
                          $('#tenancyEndDate').on('change', function () {
                            var dateFrom = $('#tenancyStartDate').datepicker('getDate');
                var dateTo = $(this).datepicker('getDate');
                if (dateFrom >= dateTo) {
                    swal("Tenancy end date should be greater than tenancy date.");
                    $(this).val('')
                }
                        })
                        
                        
                        
                        
                        $("#saveQuoteBtn, #saveQuoteBtn1").on('click', function(e) {
                e.preventDefault();
                var cusDetails = document.getElementById("quotationNumber").value &&
                                 document.getElementById("quotationDate").value &&
                                 document.getElementById("quotationExpiry").value
                var propDetails = document.getElementById("assetCode").value &&
                                    document.getElementById("assetName").value &&
                                    document.getElementById("tenancyStartDate").value &&
                                    document.getElementById("tenancyEndDate").value &&
                                    document.getElementById("mezzanineFloor").value &&
                                    document.getElementById("assetType1").value &&
                                    document.getElementById("baserent").value  
              var cusType = $("#customerType").val();
                var cusTypeDetails ;
                if(cusType == "Corporate") {
                      cusTypeDetails = document.getElementById("customerName").value &&
                                 document.getElementById("businessCRNo").value &&
                                 document.getElementById("tenantId").value &&
                                 document.getElementById("businessName").value;
                } else if(cusType == "Residential") {
                      cusTypeDetails = document.getElementById("customerName").value &&
                                 document.getElementById("BillingAddress").value &&
                                 document.getElementById("PermanentAddress").value ;
                }
                
             var cusTypegrid = document.getElementById("contactPerson").value &&
                                 document.getElementById("registeredEmailID").value &&
                                 document.getElementById("phoneNo").value ;
              
         var rentTypegrid = document.getElementById("unitNo").value &&
                                 document.getElementById("rentPeiod").value &&
                                 document.getElementById("chargesQuoted").value ;
                         
                   var serviceTypegrid = document.getElementById("serviceCategory").value &&
                                 document.getElementById("serviceName").value;  
                     
              
               if(cusDetails == "" || cusDetails == null) {
                    swal("Please fill the required fields in quotation details.")
                } else if(propDetails == "" || propDetails == null) {
                    swal("Please fill the required fields in property details.")
                }else if(cusType == "" || cusType == null) {
                    swal("Please select the customer type in customer details.")
                } else if(cusTypeDetails == "" || cusTypeDetails == null) {
                    swal("Please fill the required fields in customer details.")
                }  else if(cusTypegrid == "" || cusTypegrid == null) {
                    swal("Please fill the required table in customer details.")
                }  else if(rentTypegrid == "" || rentTypegrid == null) {
                    swal("Please fill the required table in rent details.")
                }  else if(serviceTypegrid == "" || serviceTypegrid == null) {
                    swal("Please fill the required table in service details.")
                }  else {
                   
                 $("#quoteForm").submit()
                }
                
                
            })
                        </script>
<script>
    $(function (){
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
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js" integrity="sha512-DNeDhsl+FWnx5B1EQzsayHMyP6Xl/Mg+vcnFPXGNjUZrW28hQaa1+A4qL9M+AiOMmkAhKAWYHh1a+t6qxthzUw==" crossorigin="anonymous"></script>
                        </body>

                        </html>
