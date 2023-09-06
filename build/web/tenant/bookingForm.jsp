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
        <title>arête Assets Management</title>
        
        <script>
            
            function selectAssetDetails()
            {
                myWindow = window.open("../assets/selectBookingQuoteProprtyDetails.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                window.close();
            }
            
            </script>

    </head>
    <body class="nav-md">
        <jsp:include page="../login/menu.htm" />


        <main id="main" class="main">
            <div>
                <jsp:include page="../login/headerlink.htm?submodule=Booking Quote&tab=Rent Quote&pagetype=form"/>
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
                                <form class="row validateForm" id="quoteForm" action="../tenant/bookingManagmentList.htm"  method="post" enctype="multipart/form-data">
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
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="quotationNumber" value="QUO-1">
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="quotationDate" name="quotationDate" value="">
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
                                            <label class="control-label">Tenancy Start date <a class="text-danger">*</a></label>
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
                                                    <input type="text" class="form-control" readonly="" id="mezzanineFloor"   name="mezzanineFloor" value="${list.jointeeName1}">
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
                                                                <input type="text" class="form-control" id="" name="" value="${list.jointeeName1}" autocomplete="off">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="baserent" value="">
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
        Customer/Tenancy details
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
                                                        <option>Corporate</option>
                                                        <option>Residential</option>
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="customerName" value="">
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
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="checkbox" placeholder="Fill" class="form-check-input" id="" name="" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="form-check-label">Add to Customer Master<a class="text-danger">*</a></label>
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name=" tenantId" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Tenant ID <a class="text-danger">*</a></label>
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="businessName" value="">
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
                                                                <input type="text" class="form-control" id="" name="" value="${list.jointeeName1}" autocomplete="off">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name=" businessCrNumber" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Business CR No <a class="text-danger">*</a></label>
                                        </div>
          <hr class="my-3">
                                    
         
                                    <table class="table table-bordered my-3" id="basicDetailsTable">
                                        <thead>
                                        <th>Contact Person</th>
                                        <th>Registered email ID</th>
                                        <th>Phone No</th>
                                        <th>Action</th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="contactPerson" value="">
                                                </td>
                                                <td>
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="registeredEmailID" value="">
                                                </td>
                                                <td>
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="phoneNo" value="">
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="Billing Address" name="" value="">
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="Permanent Address" value="">
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
                                            <th>S No</th>
                                        <th>Unit No</th>
                                        <th style="width:250px;">Rent Period</th>
                                        <th>Charges quoted</th>
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
                                                    <input type="text" placeholder="" class="form-control" id="" name="unitNo" value="">
                                                </td>
                                                <td>
                                                    <input type="search" placeholder="" class="form-control rentPeiodClass" id="rentPeiod"  name="rentPeriod" value="">
                                                </td>
                                                <td>
                                                    <input type="number" placeholder="" class="form-control" id="chargesQuoted" onInput="calcTotal()" name="chargesQuoted" value="vatPercentage">
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
                                            <th>S No</th>
                                        <th>Service Category</th>
                                        <th>Service Name</th>
                                        <th>Charges quoted</th>
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
                                                    <input type="text" placeholder="" class="form-control" id="" name="serviceCategory" value="">
                                                </td>
                                                <td>
                                                    <input type="search" placeholder="" class="form-control" id=""  name="serviceName" value="">
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
                                    </table>
                                    
                                    
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="securityDeposit" value="">
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
                                                                <input type="text" class="form-control" id="" name="" value="${list.jointeeName1}" autocomplete="off">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="advance" value="">
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
                                        <label class="control-label">Contract terms <a class="text-danger">*</a></label>
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
                                        <label class="control-label">Add attachment<a class="text-danger">*</a></label>
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
                                    <div class="col-md-12 mt-3">
                                        <div class="col-md-6 mx-auto">
                                            <input type="submit" value="Save" class="btn btn-primary">
                                            <input type="submit" value="Save As Draft" class="btn btn-primary">
                                            <a class="btn btn-primary" href="#">Cancel</a>
                                            <a class="btn btn-primary" href="#">Print Preview</a>
                                        </div>
                                    </div>
                                    
                                </form>
                                    
                                    
                            </div>
                            </section>

                            </main><!-- End #main -->
                        <jsp:include page="../login/footer.jsp" />
                        
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
                                    
                                }).datepicker('update', new Date())
                                
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
                        </script>
                        </body>

                        </html>
