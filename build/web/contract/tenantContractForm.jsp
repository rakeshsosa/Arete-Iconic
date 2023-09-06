<%-- Document : assetDetailsForm Created on : Sep 15, 2016, 10:42:18 AM Author : Kondal Reddy N --%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <%@page contentType="text/html" pageEncoding="UTF-8" %>
                    <!DOCTYPE html>
                    <html lang="en">
                        <style>
                             @media screen and (max-width: 600px){
                            .twolinesBootomspace{
                                margin-top: 20px
                            }
                            .table-responsive{
                                overflow-x: auto;
                            }
                             }
                            </style>
                            
                        <head>
                             <title>Arete Iconic</title>
         <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css" integrity="sha512-gxWow8Mo6q6pLa1XH/CcH8JyiSDEtiwJV78E+D+QP0EVasFs8wKXq16G8CLD4CJ2SnonHr4Lm/yY2fSI2+cbmw==" crossorigin="anonymous" />
                        </head>
                    <body class="nav-md">
                        <jsp:include page="../login/menu.htm" />

                        <jsp:include page="../login/footer.jsp" />

                        <main id="main" class="main">
                            <div class="mt-3">
                                <jsp:include
                                     page="../login/headerlink.htm?submodule=Units Contracts Manager&tab=Contracts Creation&pagetype=form" />
                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h5>Contract Creation</h5>
                                </div>
                                <form class="row validateForm" id="quoteForm" action="../insurance/tenantContractFormSubmit.htm"  method="post" enctype="multipart/form-data">
                                     <div class="accordion-item">
                            <h2 class="accordion-header" id="flush-landlord-parent">
                              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-landlord" aria-expanded="false" aria-controls="flush-landlord">
                                Landlord Details
                              </button>
                            </h2>
                            <div id="flush-landlord" class="accordion-collapse collapse" aria-labelledby="flush-landlord-parent" data-bs-parent="#accordionFlushExample">
                              <div class="accordion-body row">
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            <c:choose>
                                                <c:when test="${fn:length(quoteList) > 0}">
                                                    <c:forEach items="${quoteList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" placeholder="Fill" class="form-control" placeholder="Select Landlord Name" id="landlordname" name="landlordname" >
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="Fill" readonly class="form-control" placeholder="Select Landlord Name" id="landlordname" name="landlordname" onclick="return selectAssetDetails();">
                                                    <input type="hidden" class="form-control"  id="landlordId" name="landlordId" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Select Landlord Name </label>
                                        </div>
                                  
                                
                                    </div>
                                  </div>
                                    </div> 
                                    <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
        Customer Details
      </button>
    </h2>
    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body row">
          <div class="col-md-12">
              <button type="button" class="btn btn-primary">Rent Quote Customer List</button>
               <button type="button" class="btn btn-primary">Booking Customer List</button>
                <button type="button" class="btn btn-primary">Existing Customer List</button>
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
                                                    <input type="text" onkeypress="isAlphabet(event)" required="" placeholder="Fill" class="form-control" id="customerName" name="customerName" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Customer Name <a class="text-danger">*</a></label>
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
                                                    <input type="text"  onkeypress="isAlphaNumeric(event)" id="cusReference" placeholder="Fill" class="form-control" id="customerReference" name="customerReference" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Customer Reference </label>
                                        </div>
          <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3" id="hideAgentName">  
            <input type="text" placeholder="Fill" class="form-control" value="">
              <label class="control-label">Agent Name </label>

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
                                                    <input type="text" required="" placeholder="Fill" onkeypress="isAlphaNumeric(event)"  class="form-control" id="customerRefId" name="customerRefId" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Customer Reference Id <a class="text-danger">*</a></label>
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="customerId" name="customerId" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Customer Id </label>
                                        </div>
                                  
             <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            <c:choose>
                                                <c:when test="${fn:length(quoteList) > 0}">
                                                    <c:forEach items="${quoteList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                    <select placeholder="Fill" class="form-select" id="customerType" name="" >
                                                        <option value="" disabled selected>Select an option</option>
                                                        <option value="Corporate">Corporate</option>
                                                        <option value="Residential">Residential</option>
                                                    </select>                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <select placeholder="Fill"  class="form-select" id="customerType" name="customerType">
                                                        <option value="" disabled selected>Select an option</option>
                                                        <option value="Corporate">Corporate</option>
                                                        <option value="Residential">Residential</option>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Select Customer Type</label>
                                        </div>
          <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3" id="hideCompany">     
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
                                                    <input type="text" onkeypress="isAlphabet(event)" placeholder="Fill" class="form-control" id="businessName" name="businessName" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Company / Business Name </label>
                                        </div>
          <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3" id="crNoHide">     
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
                                                    <input type="text"  onkeypress="isNumberKey(event)" placeholder="Fill" class="form-control" id="crNo" name="crNo" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Business CR No </label>
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
                                                    <input type="text"  onkeypress="isAlphabet(event)" placeholder="Fill" class="form-control" id="customerPerson" name="customerPerson" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Contact Person </label>
                                        </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            <c:choose>
                                                <c:when test="${fn:length(quoteList) > 0}">
                                                    <c:forEach items="${quoteList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="" name="" value="${list.jointeeName1}" autocomplete="off" onblur="validateEmail(this);">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}" onblur="validateEmail(this);">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="email"  placeholder="Fill" class="form-control" id="customerEmailId" name="customerEmailId" value=""onblur="validateEmail(this);">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Registered Email Id </label>
                                        </div>
                                    
<!--                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3"> 
                                         <label class="control-label">Phone No </label>
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
                                                    <input type="tel"  onkeypress="isNumberKey(event)" maxlength="11" placeholder="Fill" class="form-control" id="phoneNo" name="phoneNo" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                           
                                        </div>-->
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3"> 
                                               <div>          
                                            <label class="control-label">Phone No </label>
                                          
                                                                <input type="tel" class="form-control"  id="phoneNo" name="phoneNo" value=""  onkeypress="isNumberKey(event)" >
                                           
                                               </div>
                                        </div>
          
          <table class='table table-bordered col-md-4 table-responsive' id="multiPhoneNumberTable">
              <thead>
                   <tr>
                  <th>Contact Person </th>
                  <th>Email Id </th>
                  <th>Phone Number </th>
                  <th>Action</th>
              </tr>
              </thead>
              <tbody>
                  <tr>
                      <td><input type="text" onkeypress="isAlphabet(event)" placeholder="Fill" class="form-control" id="gridContactname" name="contactPersonName" value=""></td>
                    <td><input type="email" placeholder="Fill" class="form-control" id="emailId" name="emailId" value="" onblur="validateEmail(this);"></td>
                    <!--<td><input type="tel" maxlength="11" onkeypress="isNumberKey(event)" placeholder="Fill" class="form-control" id="phoneNumber" name="phoneNumber" value=""></td>-->
                  <td><input type="tel" onkeypress="isNumberKey(event)" placeholder="Fill" class="form-control" id="phoneNumber" name="phoneNumber" value=""></td>
                    <td><i class="fa fa-plus text-primary" onclick="addBasicDetailsRow(event)"></i> &nbsp; <i onclick="removeBasicDetailsRow(event)" class="fa fa-times text-danger"></i></td>
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="billingAddress" name="billingAddress" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Billing Address </label>
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="permanentAddress" name="permanentAddress" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Permanent Address </label>
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="jointeeName1" name="jointeeName1" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Jointee Name1 </label>
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="jointeeAddress1" name="jointeeAddress1" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Jointee Address 1</label>
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="jointeeName2" name="jointeeName2" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Jointee Name 2 </label>
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="jointeeAddress2" name="jointeeAddress2" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Jointee Address 2 </label>
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="sponsorName" name="sponsorName" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Sponsor name </label>
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
                                                    <select class="form-select" id="ifWorking" name="ifWorking">
                                                        <option>Select Option</option>
                                                        <option>Execute</option>
                                                        <option>Test</option>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">If working </label>
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="SponserAddress" name="SponserAddress" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Sponsor Address </label>
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="sponsorEmailId" name="sponsorEmailId" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Sponsor Email ID </label>
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
                                                    <input type="file" placeholder="Fill" class="form-control" id="document" name="document" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">ID attachment </label>
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
    <h2 class="accordion-header" id="flush-contract">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-contracts" aria-expanded="false" aria-controls="flush-contracts">
        Contract Details
      </button>
    </h2>
    <div id="flush-contracts" class="accordion-collapse collapse" aria-labelledby="flush-contract" data-bs-parent="#accordionFlushExample">
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="contractode" name="contractode" readonly="" value="${contractCode}">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Contract Code<a class="text-danger">*</a></label>
                                        </div>
<!--          <div class="col-md-12">
              <button type="button" class="btn btn-primary">Choose From Contracts Templates</button>
          </div>-->
<!--                 <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                              <c:choose>
                                              <c:when test="${fn:length(quoteList) > 0}">
                                                    <c:forEach items="${quoteList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                     <select placeholder="Fill" class="form-select" id="" name="" >
                                                        <option value="Commercial">Commercial</option>
                                                        <option value="Residential">Residential</option>
                                                    </select>                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <select placeholder="Fill" class="form-select" id="contractType" name="contractType" >
                                                        <option value="Commercial">Commercial</option>
                                                        <option value="Residential">Residential</option>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Contract Type <a class="text-danger">*</a></label>
                                        </div>-->
           <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            <c:choose>
                                                <c:when test="${fn:length(quoteList) > 0}">
                                                    <c:forEach items="${quoteList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                     <select placeholder="Fill" class="form-select" id="" name="" >
                                                        <option value="Long Term">Long Term</option>
                                                        <option value="Short Term">Short Term</option>
                                                         <option value="Others">Others</option>
                                                    </select>                                                           </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <select placeholder="Fill" class="form-select" id="contractCategory" name="contractCategory" >
                                                        <option value="Long Term">Long Term</option>
                                                        <option value="Short Term">Short Term</option>
                                                         <option value="Others">Others</option>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Contract Category </label>
                                        </div>
           <div class="col-md-4 mb-3 my-auto">
                               <label class="control-label">
                                <input type="checkbox" id="fitPeriod" name="isPeriodcheckBox" maxlength="98">
                               Is Fit-Out Period Applicable ? </label>
                            </div>
      
                 <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3" id="contractPeriodHide">     
                                            <c:choose>
                                                <c:when test="${fn:length(quoteList) > 0}">
                                                    <c:forEach items="${quoteList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                    <select placeholder="Fill" class="form-select" id="" name="" >
                                                        <option value="1 Month">1 Month</option>
                                                        <option value="2 Months">2 Months</option>
                                                         <option value="3 Months">3 Months</option>
                                                        <option value="4 Months">4 Months</option>
                                                    </select>                                                    
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <select placeholder="Fill" class="form-select" id="contractPeriod" name="contractPeriod" >
                                                        <option class="" selected="" disabled="">Select an option</option>
                                                        <option value="1 Month">1 Month</option>
                                                        <option value="2 Months">2 Months</option>
                                                         <option value="3 Months">3 Months</option>
                                                        <option value="4 Months">4 Months</option>
                                                       
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Fit Out Period </label>
                                        </div>
          <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            <c:choose>
                                                <c:when test="${fn:length(quoteList) > 0}">
                                                    <c:forEach items="${quoteList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                     <select placeholder="Fill" class="form-select" id="" name="" >
                                                        <option value="Industrial">Industrial</option>
                                                        <option value="Residential">Residential</option>
                                                    </select>                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <select placeholder="Fill" class="form-select" id="contractType" name="contractType" >
                                                        <option value="Industrial">Industrial</option>
                                                        <option value="Residential">Residential</option>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Contract Type </label>
                                        </div>
                                            
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            <c:choose>
                                                <c:when test="${fn:length(quoteList) > 0}">
                                                    <c:forEach items="${quoteList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                    <textarea type="text" placeholder="Fill" class="form-control" id="" name="" value=""></textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <textarea type="text" onkeypress="isAlphabet(event)" placeholder="Fill" class="form-control" id="unitDescription" name="unitDescription" value=""></textarea>
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Unit Description </label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            <c:choose>
                                                <c:when test="${fn:length(quoteList) > 0}">
                                                    <c:forEach items="${quoteList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="" name="" value="${list.jointeeName1}" autocomplete="off">
                                                                <input type="hidden" class="form-control"  id="jointeeName11" value="${list.jointeeName1}" onkeypress="return isNumberKey4(event)" autocomplete="off">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" readonly required placeholder="Fill" class="form-control" id="propertyName" name="propertyName" value="" onclick="return selectUnitNumber()();">
                                                    <input type="hidden" placeholder="Fill" readonly="" class="form-control" id="propertyCode" name="propertyCode" value="">
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
                                                    <input type="text" onkeypress="isNumberKey(event)" placeholder="Fill" class="form-control twolinesBootomspace" id="monthlyRentIncome" name="monthlyRentIncome" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Monthly Rental Income ( Expected ) </label>
                                        </div>
           <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            <c:choose>
                                                <c:when test="${fn:length(quoteList) > 0}">
                                                    <c:forEach items="${quoteList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="" name="" value="${list.jointeeName1}" autocomplete="off">
                                                                <input type="hidden" class="form-control"  id="jointeeName11" value="${list.jointeeName1}" onkeypress="return isNumberKey4(event)" autocomplete="off">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" onkeypress="isNumberKey(event)" placeholder="Fill" class="form-control" id="expectedSecurityDeposit" name="expectedSecurityDeposit" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Expected Security Deposit </label>
                                        </div>
           <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            <c:choose>
                                                <c:when test="${fn:length(quoteList) > 0}">
                                                    <c:forEach items="${quoteList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="" name="" value="${list.jointeeName1}" autocomplete="off">
                                                                <input type="hidden" class="form-control"  id="jointeeName11" value="${list.jointeeName1}" onkeypress="return isNumberKey4(event)" autocomplete="off">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="Fill"  onkeypress="isNumberKey(event)" class="form-control" id="serviceCharges" name="serviceCharges" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Service Charges ( in % ) </label>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            <c:choose>
                                                <c:when test="${fn:length(quoteList) > 0}">
                                                    <c:forEach items="${quoteList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                     <select placeholder="Fill" class="form-select" id="" name="" >
                                                        <option value="PDC">PDC</option>
                                                        <option value="Residential">Bank Transfer</option>
                                                          <option value="Invoice">Invoice</option>
                                                    </select>                                                       </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <select placeholder="Fill" class="form-select" id="paymentType" name="paymentType" >
                                                        <option value="PDC">PDC</option>
                                                        <option value="Residential">Bank Transfer</option>
                                                          <option value="Invoice">Invoice</option>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Payment Type </label>
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
                                                    <input type="text" placeholder="Fill"  onkeypress="isNumberKey(event)" class="form-control" id="vatPercent" name="vatPercent" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">VAT( in % ) </label>
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
                                                    <input type="text" placeholder="Fill" onkeypress="isAlphaNumeric(event)" class="form-control" id="unitNo" name="unitNo" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Unit Name / Number</label>
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
                                                    <input type="text" required placeholder="Fill" required="" class="form-control datepicker1" id="startDate" name="startDate" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Contract Start Date <a class="text-danger">*</a></label>
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
                                                    <input type="text" required placeholder="Fill" class="form-control datepicker2" id="endDate" name="endDate" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Contract End Date <a class="text-danger">*</a></label>
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
                                                    <input type="text"  placeholder="Fill" class="form-control datepicker3" id="renewalDate" name="renewalDate" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Contract Renewal Date </label>
                                        </div>
            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            <c:choose>
                                                <c:when test="${fn:length(quoteList) > 0}">
                                                    <c:forEach items="${quoteList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                     <select placeholder="Fill" class="form-select" id="" name="" >
                                                        <option value="Before 3 Months">Before 3 Months</option>
                                                           <option value="Before 2 Months">Before 2 Months</option>   
                                                           <option value="Before 1 Months">Before 1 Months</option>
                                                              <option value="Before 2 Weeks">Before 2 Weeks</option>
                                                         <option value="Before 1 Week">Before 1 Week</option>
                                                    </select>                                                   </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <select placeholder="Fill" class="form-select" id="renewalNotification" name="renewalNotification" >
                                                        <option value="Before 3 Months">Before 3 Months</option>
                                                           <option value="Before 2 Months">Before 2 Months</option>   
                                                           <option value="Before 1 Months">Before 1 Months</option>
                                                              <option value="Before 2 Weeks">Before 2 Weeks</option>
                                                         <option value="Before 1 Week">Before 1 Week</option>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Renewal Notification</label>
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
                                                    <input type="text"   placeholder="Fill" class="form-control" id="insuranceTagged" name="insuranceTagged" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Insurance Tagged</label>
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
                                                    <input type="text" placeholder="Fill"  onkeypress="isNumberKey(event)" class="form-control" id="noticePeriod" name="noticePeriod" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Notice Period </label>
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
                                                    <input type="text" placeholder="Fill"  onkeypress="isNumberKey(event)" class="form-control twolinesBootomspace" id="actualRentIncome" name="actualRentIncome" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Actual Rental Income Per Month </label>
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
                                                    <input type="text" placeholder="Fill" onkeypress="isNumberKey(event)" class="form-control" id="actualYearlyIncome" name="actualYearlyIncome" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Actual Rental Income Per Year</label>
                                        </div>
                                        </div>
                                      </div>
                                    </div>
                          
                                    <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
        Additional Details
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
                                                    <input type="text" placeholder="Fill"  onkeypress="isNumberKey(event)" class="form-control" id="municipalCharges" name="municipalCharges" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Municipal Charges </label>
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
                                                    <input type="text" placeholder="Fill"  onkeypress="isNumberKey(event)" class="form-control" id="maintenanceCharges" name="maintenanceCharges" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Maintenance Charges </label>
                                        </div>
                                    
          <div class="col-md-12 table-responsive">
              <table class="table table-bordered mb-3" id="poCheckTable">
                  <thead>
                                    <tr><th>PD Cheque</th>
                                        <th>Date </th>
                                        <th>Action</th>
                                    </tr></thead>
                  <tbody>
                      <tr>
                          <td><input id="pdChequeGrid" type="text" name="pdCheque"></td>
                          <td><input id="pdChequeDateGrid"  name="pdDate" class="datepicker5"></td>
                          <td><i class="fa fa-plus text-primary" onclick="addBasicDetailsRow(event)"></i> &nbsp; <i onclick="removeBasicDetailsRow(event)" class="fa fa-times text-danger"></i></td>
                      </tr>
                  </tbody>
              </table>
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
                                                    <select class="form-select" id="billingCycle" name="billingCycle">
                                                        <option value="Monthly">Monthly</option>
                                                         <option value="Quarterly">Quarterly</option>
                                                          <option value="Half-Yearly">Half-Yearly</option>
                                                        <option value="Monthly">Yearly</option>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Billing Cycle </label>
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
                                                    <input type="text" placeholder="Fill" class="form-control datepicker4" id="billingDueDate" name="billingDueDate" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Billing Due date </label>
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
                                                    <input type="text" required="" onkeypress="isNumberKey(event)" placeholder="Fill" class="form-control" id="municipalAgreementNo" name="municipalAgreementNo" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Municipal Agreement No <a class="text-danger">*</a></label>
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
                                                    <input type="text" placeholder="Fill"  onkeypress="isAlphaNumeric(event)" class="form-control" id="municipalFormNo" name="municipalFormNo" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Municipal Form No </label>
                                        </div>
                                   <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                
                                                                                                 
                                                    <input type="file" placeholder="Fill"  class="form-control" id="documentAttach" name="documentAttach" value="">
                                                         <label class="control-label">Attach Municipal Agreement</label>   
                                            
                                           
                                        </div>
      </div>
    </div>
                                    </div>
                                    
                                    <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingSeven">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSeven" aria-expanded="false" aria-controls="flush-collapseTwo">
        Services/Amenities
      </button>
    </h2>
    <div id="flush-collapseSeven" class="accordion-collapse collapse" aria-labelledby="flush-headingSeven" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body row">
                                   
                                    
          <div class="col-md-12">
              <div class="table-responsive">
              <table class="table table-bordered mb-3" id="poCheckTable">
                  <thead>
                                    <tr><th>Service Name </th>
                                        <th>Description</th>
                                        <th>Service Charge Interval </th>
                                        <th>Fixed Service Charge</th>
                                        <th>Action</th>
                                    </tr></thead>
                  <tbody>
                      <tr> 
                          <td><input onkeypress="isAlphabet(event)" id="serviceNameGrid" type="text" name="serviceName"></td>
                          <td><input id="serviceDesGrid" type="text" name="description"></td>
                          <td><input onkeypress="isNumberKey(event)" id="serviceChargeGrid" type="text" name="serviceCharge"></td>
                          <td><input onkeypress="isNumberKey(event)" id="fixedServChargeGrid" type="text" name="fixedServiceCharge"></td>
                          <td><i class="fa fa-plus text-primary" onclick="addBasicDetailsRow(event)"></i> &nbsp; <i onclick="removeBasicDetailsRow(event)" class="fa fa-times text-danger"></i></td>
                      </tr>
                  </tbody>
              </table>
          </div></div>
                                    
                                   
                                 
      </div>
    </div>
                                    </div>
                                    
                                    <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingSix">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSix" aria-expanded="false" aria-controls="flush-collapseTwo">
        Utilities Tagged
      </button>
    </h2>
    <div id="flush-collapseSix" class="accordion-collapse collapse" aria-labelledby="flush-headingSix" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body row">
                                   
                                    
          <div class="col-md-12 table-responsive">
              <table class="table table-bordered mb-3" id="poCheckTable">
                  <thead>
                                    <tr><th>Utility Category </th>
                                        <th>Utility Name </th>
                                        <th>Action</th>
                                    </tr></thead>
                  <tbody>
                      <tr>
                          <td><input onkeypress="isAlphabet(event)" id="utilityCatGrid" type="text" name="utilityCategory"></td>
                          <td><input onkeypress="isAlphabet(event)" id="utilityNameGrid" type="text" name="utilityName"></td>
                          <td><i class="fa fa-plus text-primary" onclick="addBasicDetailsRow(event)"></i> &nbsp; <i onclick="removeBasicDetailsRow(event)" class="fa fa-times text-danger"></i></td>
                      </tr>
                  </tbody>
              </table>
          </div>
                                    
                                   
                                 
      </div>
    </div>
                                    </div>
                                    
                                 
                                 
                                      <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5 mt-3">
<!--                                            <input type="button" onclick="onSubmit(event)" value="Save" class="btn btn-primary">-->
<input type="button" id="savecontract" value="Save" class="btn btn-primary">
                                            <a class="btn btn-danger" href="../insurance/tenantContractList.htm">Cancel</a>
                                           
                                        </div>
                                    </div>
                                    
                                </form>
                                    
                                    
                            </div>
                            </section>

                        </main><!-- End #main -->
                        <!-- Modal -->
                        
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Register Tenant</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <form class="validateForm" id="quoteForm" action="../insurance/tenantContractFormSubmit.htm"  method="post" enctype="multipart/form-data">
                <div class="col-md-12 col-sm-12 col-xs-12 form-floating mb-3">  
                  <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                  <label class="control-label">Tenant Name </label>
                </div>
              <div class="col-md-12 col-sm-12 col-xs-12 form-floating mb-3">  
                  <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                  <label class="control-label">Tenant Phone Number </label>
                </div>
              
              <div class="col-md-12 col-sm-12 col-xs-12 form-floating mb-3">  
                  <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                  <label class="control-label">Tenant Email ID </label>
                </div>
              
              <div class="col-md-12 col-sm-12 col-xs-12 form-floating mb-3">  
                  <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                  <label class="control-label">ID Card Type </label>
                </div>
              <div class="col-md-12 col-sm-12 col-xs-12 form-floating mb-3">  
                  <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                  <label class="control-label">Labour Card Number </label>
                </div>
              
              <div class="col-md-12 col-sm-12 col-xs-12 form-floating mb-3">  
                  <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                  <label class="control-label">Permanent Address </label>
                </div>
              
              <div class="col-md-12 col-sm-12 col-xs-12 form-floating mb-3">  
                  <input type="file" placeholder="Fill" class="form-control" id="" name="" value="">
                  <label class="control-label">Attachment </label>
                </div>
              
              
          </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
                        <script>
                           $(document).ready(function() {
                                    $("#hideCompany").hide();
                                $("#crNoHide").hide();
                                
                                  $("#hideAgentName").hide()
                                $("#contractPeriodHide").hide()
                           })
                            $("#residentialSection").hide();
                            $("#multiPhoneNumberTable").show();
                            $("#customerType").change(function(event){
                                if(event.target.value == 'Residential'){
                                    $("#residentialSection").show();
                                    $("#multiPhoneNumberTable").hide();
                                      $("#hideCompany").hide();
                                $("#crNoHide").hide();
                                } else {
                                    $("#residentialSection").hide();
                                    $("#multiPhoneNumberTable").show();
                                    $("#hideCompany").show();
                                $("#crNoHide").show();
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
                                tr.after(clone)
                                $(".table .fa-times").show();
                                $(".table .fa-times:first").hide();
                                $("#rentDetailsTable .snos").each(function(index){
                                   $(this).val(index + 1)
                                })
                                $("#serviceDetailstTable .snos").each(function(index){
                                   $(this).val(index + 1)
                                })
                                
//                                if($("#poCheckTable tr").length > 13){
//                                    swal("You can not add more than 12 rows");
//                                    $("#poCheckTable tr:last").remove();
//                                }
                                
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
                        function onSubmit(event){
                            swal({
                                    title: "Is the Second Party Customer and the tenant same?",
                                    icon: "warning",
                                    buttons: true,
                                    dangerMode: false,
                                    buttons: ["No", "Yes"],
                                  })
                                  .then((willDelete) => {
                                    if (willDelete) {
                                      swal("Your record has been saved", {
                                        icon: "success",
                                      });
                                    } else {
                                      swal({
                                    title: "Do you wish to add the tenant details?",
                                    icon: "warning",
                                    buttons: true,
                                    dangerMode: false,
                                    buttons: ["Later", "Now"],
                                  })
                                  .then((willDelete) => {
                                    if (willDelete) {
                                      var myModal = new bootstrap.Modal(document.getElementById("exampleModal"), {});
                                        
                                          myModal.show();
                                        
                                                                            } else {
                                      swal("Your record has been saved", {
                                        icon: "success",
                                      });
                                    }
                                  });
                                    }
                                  });
                        }
                        
                            $("#fitPeriod").on('click' , function (e) {
                    if ($(this).prop('checked')==true){ 
                    $("#contractPeriodHide").show()
                    } else {
                     $("#contractPeriodHide").hide()
                    }
          })
          
                      $("#cusReference").on('change' , function (e) {
                    if (e.target.value == "Agency"){ 
                    $("#hideAgentName").show()
                    } else {
                        
                     $("#hideAgentName").hide()
                    }
          })
          
          
          
           function selectAssetDetails()
            {
                myWindow = window.open("../insurance/selectlandLord.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                //window.close();
            }
            
            function selectUnitNumber()
            {
                myWindow = window.open("../insurance/selectUnitNumber.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                //window.close();
            }
            
            
            $("#savecontract").on('click', function(e) {
                e.preventDefault();
                debugger
                var cusDetails = document.getElementById("customerName").value &&
                                 document.getElementById("cusReference").value &&
                                 document.getElementById("customerRefId").value &&
                                 document.getElementById("customerId").value
                             
                var cusType = $("#customerType").val();
                var cusTypeDetails ;
                if(cusType == "Corporate") {
                      cusTypeDetails = document.getElementById("businessName").value &&
                                 document.getElementById("crNo").value &&
                                 document.getElementById("customerPerson").value &&
                                 document.getElementById("customerEmailId").value &&
                                 document.getElementById("phoneNo").value
                } else if(cusType == "Residential") {
                      cusTypeDetails = document.getElementById("billingAddress").value &&
                                 document.getElementById("permanentAddress").value &&
                                 document.getElementById("customerPerson").value &&
                                 document.getElementById("customerEmailId").value &&
                                 document.getElementById("phoneNo").value
                }
                
//                var cusTypegrid = $("#gridContactname").val();
                
                var conDetails = document.getElementById('unitDescription').value &&
                                 document.getElementById('propertyName').value &&
                                 document.getElementById('monthlyRentIncome').value &&
                                 document.getElementById('expectedSecurityDeposit').value &&
                                 document.getElementById('serviceCharges').value &&
                                 document.getElementById('vatPercent').value &&
                                 document.getElementById('unitNo').value &&
                                 document.getElementById('startDate').value &&
                                 document.getElementById('endDate').value &&
                                 document.getElementById('renewalDate').value &&
                                 document.getElementById('insuranceTagged').value &&
                                 document.getElementById('noticePeriod').value &&
                                 document.getElementById('actualRentIncome').value &&
                                 document.getElementById('actualYearlyIncome').value ;
                               
                var addDetails = document.getElementById("municipalCharges").value &&
                                  document.getElementById("maintenanceCharges").value &&
                                  document.getElementById("billingDueDate").value &&
                                  document.getElementById("municipalAgreementNo").value &&
                                  document.getElementById("municipalFormNo").value ;
                          
                var adddetaGrid = document.getElementById("pdChequeGrid").value &&
                                   document.getElementById("pdChequeDateGrid").value
                                 
                var serGrid = document.getElementById("serviceNameGrid").value &&
                              document.getElementById("serviceDesGrid").value &&
                             document.getElementById("serviceChargeGrid").value &&
                              document.getElementById("fixedServChargeGrid").value
                           
                var utliGrid = document.getElementById("utilityCatGrid").value &&
                                   document.getElementById("utilityNameGrid").value
                if($("#landlordname").val() == "" || $("#landlordname").val() == null) {
                    swal("Please fill the required fields in landload details.")
                } else if(cusDetails == "" || cusDetails == null) {
                    swal("Please fill the required fields in customer details.")
                }else if(cusType == "" || cusType == null) {
                    swal("Please select the customer type in customer details.")
                } else if(cusTypeDetails == "" || cusTypeDetails == null) {
                    swal("Please fill the required fields in customer details.")
                }  else if(conDetails == "") {
                     swal("Please fill required fields in contract details.")
                 } else if(addDetails == "") {
                     swal("Please fill the required fields in additional details.")
                 } else if(adddetaGrid == "") {
                     swal("Please fill the table fields in additional details.")
                 } else if($("#documentAttach").val() == "") {
                     swal("Please fill the attachment field in additional details.")
                 } else if(serGrid == "") {
                     swal("Please fill the table fields in service/amenities.")
                 } else if(utliGrid == "") {
                     swal("Please fill the table fields in utility tagged.")
                 } else {
                      swal({
                                    title: "Is the Second Party Customer and the tenant same?",
                                    icon: "warning",
                                    buttons: true,
                                    dangerMode: false,
                                    buttons: ["No", "Yes"],
                                  })
                                  .then((willDelete) => {
                                    if (willDelete) {
//                                      swal("Your record has been saved", {
//                                        icon: "success",
//                                      });
$("#quoteForm").submit()
                                    } else {
                                      swal({
                                    title: "Do you wish to add the tenant details?",
                                    icon: "warning",
                                    buttons: true,
                                    dangerMode: false,
                                    buttons: ["Later", "Now"],
                                  })
                                  .then((willDelete) => {
                                    if (willDelete) {
                                      var myModal = new bootstrap.Modal(document.getElementById("exampleModal"), {});
                                        
                                          myModal.show();
                                        
                                                                            } else {
                                                                                $("#quoteForm").submit()
//                                      swal("Your record has been saved", {
//                                        icon: "success",
//                                      });
                                    }
                                  });
                                    }
                                  });
                   
                }
                
                
            })
                        </script>
        <script>
            $('.datepicker1').datepicker({
                format: 'dd-M-yyyy',
                autoclose: true,
                orientation:'bottom',
                todayHighlight: true,
            }).datepicker('update',new Date())
            
            
               $('.datepicker2').datepicker({
                format: 'dd-M-yyyy',
                autoclose: true,
                orientation:'bottom',
                todayHighlight: true,
            }).datepicker('update',new Date())
            
            $('.datepicker3').datepicker({
                format: 'dd-M-yyyy',
                autoclose: true,
                orientation:'bottom',
                todayHighlight: true,
            }).datepicker('update',new Date())
            
            $('.datepicker4').datepicker({
                format: 'dd-M-yyyy',
                autoclose: true,
                orientation:'bottom',
                todayHighlight: true,
            }).datepicker('update',new Date())
             $('.datepicker5').datepicker({
                format: 'dd-M-yyyy',
                autoclose: true,
                orientation:'bottom',
                todayHighlight: true,
            }).datepicker('update',new Date())
            
            
            
          
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


 $(function () {
                var input = document.querySelector("#phoneNumber");
                var myinput = window.intlTelInput(input, {
                    initialCountry: "om",
                    onlyCountries: ["om", "in", "ae"],
                    hiddenInput: "full",
                    separateDialCode: true,
                    autoHideDialCode: false,
                    utilsScript: "//cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.3/js/utils.js",
                });
                $("#phoneNumber").change(function () {
                    var full_number = myinput.getNumber(intlTelInputUtils.numberFormat.E164);
                    $("#phoneNumber").val(full_number);
                    if (myinput.isValidNumber() == false) {
                        $("#phoneNumber").val("");
                        swal("Please enter valid mobile number");
                        return false;
                    }
                });
            });
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha256-bqVeqGdJ7h/lYPq6xrPv/YGzMEb6dNxlfiTUHSgRCp8=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js" integrity="sha512-DNeDhsl+FWnx5B1EQzsayHMyP6Xl/Mg+vcnFPXGNjUZrW28hQaa1+A4qL9M+AiOMmkAhKAWYHh1a+t6qxthzUw==" crossorigin="anonymous"></script>
<!--    <script src="../common/theme/js/custom.js"></script>-->
                    </body>

                    </html>