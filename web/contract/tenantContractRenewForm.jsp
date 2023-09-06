<%-- Document : assetDetailsForm Created on : Sep 15, 2016, 10:42:18 AM Author : Kondal Reddy N --%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <%@page contentType="text/html" pageEncoding="UTF-8" %>
                    <!DOCTYPE html>
                    <html lang="en">
                        
    <head>
         <title>Arête Property Management</title>
         <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">  
    </head>
                    <body class="nav-md">
                        <jsp:include page="../login/menu.htm" />


                        <main id="main" class="main">
                            <div>
                                <jsp:include
                                     page="../login/headerlink.htm?submodule=Units Contracts Manager&tab=Contracts Creation&pagetype=list" />
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
                                <form class="row validateForm" id="quoteForm" action="../CRM/rentQuoteFormSubmit.htm"  method="post" enctype="multipart/form-data">
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
                                                    <input placeholder="Fill" class="form-control" placeholder="Select Landlord Name" id="landlordname" name="landlordname" >
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input placeholder="Fill" class="form-control" placeholder="Select Landlord Name" id="landlordname" name="landlordname" >
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Select Landlord Name <a class="text-danger">*</a></label>
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
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
                                                    <input type="text" id="cusReference" placeholder="Fill" class="form-control" id="" name="" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Customer Reference <a class="text-danger">*</a></label>
                                        </div>
          <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3" id="hideAgentName">  
            <input type="text" placeholder="Fill" class="form-control" value="">
              <label class="control-label">Agent Name <a class="text-danger">*</a></label>

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
                                            <label class="control-label">Customer Reference Id</label>
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
                                            <label class="control-label">Customer Id <a class="text-danger">*</a></label>
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
                                                    <select placeholder="Fill" class="form-select" id="customerType" name="">
                                                        <option value="" disabled selected>Select an option</option>
                                                        <option value="Corporate">Corporate</option>
                                                        <option value="Residential">Residential</option>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Select Customer Type <a class="text-danger">*</a></label>
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Company / Business Name <a class="text-danger">*</a></label>
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Business CR No <a class="text-danger">*</a></label>
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
                                            <label class="control-label">Contact Person <a class="text-danger">*</a></label>
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
                                            <label class="control-label">Registered Email Id <a class="text-danger">*</a></label>
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
                                            <label class="control-label">Phone No <a class="text-danger">*</a></label>
                                        </div>
          
          <table class='table table-bordered col-md-4' id="multiPhoneNumberTable">
              <tr>
                  <th>Contact Person</th>
                  <th>Registered Email Id</th>
                  <th>Phone number</th>
                  <th>Action</th>
              </tr>
              <tr>
                  <td><input type="text" placeholder="Fill" class="form-control" id="" name="" value=""></td>
                    <td><input type="text" placeholder="Fill" class="form-control" id="" name="" value=""></td>
                      <td><input type="text" placeholder="Fill" class="form-control" id="" name="" value=""></td>
                  <td><i class="fa fa-plus text-primary" onclick="addBasicDetailsRow(event)"></i> &nbsp; <i onclick="removeBasicDetailsRow(event)" class="fa fa-times text-danger"></i></td>
              </tr>
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
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
                                            <label class="control-label">Id attachment <a class="text-danger">*</a></label>
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Contract Code<a class="text-danger">*</a></label>
                                        </div>
          <div class="col-md-4 mb-3 my-auto">    
              <label class="control-label"><input type="checkbox" checked="" disabled> Renewed Contract</label>
                                        </div>
          <div class="col-md-4 mb-3 my-auto" id="check_penalty">    
              <label class="control-label">Is Penalty Applicable ?</label>
              <label> <input type="radio" id="penalty_status" name="penalty_status" value="yes" for="yes"> Yes</label>
              <label> <input type="radio" id="penalty_status" name="penalty_status"value="no" for="no"> No</label>
                                        </div>
          <div class="col-md-4 mb-3 form-floating my-auto" id="penalty_type_hide">  
               <input type="text" class="form-control" readonly="" placeholder="Select Penalty Type" > 
              <label class="control-label">Penalty Type</label>
                                        </div>
          <div class="col-md-4 mb-3 form-floating my-auto" id="penalty_amount_hide">  
               <input type="text" class="form-control" placeholder="enter amount" > 
              <label class="control-label">Penalty Amount</label>
                                        </div>
          <div class="col-md-12">
              <button type="button" class="btn btn-primary">Choose From Contracts Templates</button>
          </div>
                 <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
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
                                                    <select placeholder="Fill" class="form-select" id="" name="" >
                                                        <option value="Commercial">Commercial</option>
                                                        <option value="Residential">Residential</option>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Contract Type <a class="text-danger">*</a></label>
                                        </div>
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
                                                    <select placeholder="Fill" class="form-select" id="" name="" >
                                                        <option value="Long Term">Long Term</option>
                                                        <option value="Short Term">Short Term</option>
                                                         <option value="Others">Others</option>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Contract Category <a class="text-danger">*</a></label>
                                        </div>
           <div class="col-md-4 mb-3 my-auto">
                               <label class="control-label">
                                <input type="checkbox" id="fitPeriod" name="fitPeriod" maxlength="98">
                               Is Fit In Period Applicable ? </label>
                            </div>
      
                 <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3" id="contractPeriodHide">     
                                            <c:choose>
                                                <c:when test="${fn:length(quoteList) > 0}">
                                                    <c:forEach items="${quoteList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                    <select placeholder="Fill" class="form-select" id="" name="" >
                                                         <option value="2 Years">2 Years</option>
                                                          <option value="1 Years">1 Years</option>
                                                        <option value="6 Months">6 Months</option>
                                                        <option value="3 Months">3 Months</option>
                                                    </select>                                                    
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <select placeholder="Fill" class="form-select" id="" name="" >
                                                         <option value="2 Years">2 Years</option>
                                                          <option value="1 Years">1 Years</option>
                                                        <option value="6 Months">6 Months</option>
                                                        <option value="3 Months">3 Months</option>
                                                       
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Contract Period <a class="text-danger">*</a></label>
                                        </div>
          <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            <c:choose>
                                                <c:when test="${fn:length(quoteList) > 0}">
                                                    <c:forEach items="${quoteList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                     <select placeholder="Fill" class="form-select" id="" name="" >
                                                        <option value="Indutrial">Indutrial</option>
                                                        <option value="Residential">Residential</option>
                                                    </select>                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <select placeholder="Fill" class="form-select" id="" name="" >
                                                        <option value="Indutrial">Industrial</option>
                                                        <option value="Residential">Residential</option>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Contract Type <a class="text-danger">*</a></label>
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
                                                    <textarea type="text" placeholder="Fill" class="form-control" id="" name="" value=""></textarea>
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Unit Description <a class="text-danger">*</a></label>
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Monthly Rental Income ( Expected ) <a class="text-danger">*</a></label>
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Expected Security Deposit <a class="text-danger">*</a></label>
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Service Charges ( in % ) <a class="text-danger">*</a></label>
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
                                                    <select placeholder="Fill" class="form-select" id="" name="" >
                                                        <option value="PDC">PDC</option>
                                                        <option value="Residential">Bank Transfer</option>
                                                          <option value="Invoice">Invoice</option>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Payment Type <a class="text-danger">*</a></label>
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
                                            <label class="control-label">VAT( in % ) <a class="text-danger">*</a></label>
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
                                            <label class="control-label">Unit Name / Number <a class="text-danger">*</a></label>
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
                                                    <input type="date" placeholder="Fill" class="form-control" id="" name="" value="">
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
                                                    <input type="date" placeholder="Fill" class="form-control" id="" name="" value="">
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
                                                    <input type="date" placeholder="Fill" class="form-control" id="" name="" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Contract Renewal Date <a class="text-danger">*</a></label>
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
                                                    <select placeholder="Fill" class="form-select" id="" name="" >
                                                        <option value="Before 3 Months">Before 3 Months</option>
                                                           <option value="Before 2 Months">Before 2 Months</option>   
                                                           <option value="Before 1 Months">Before 1 Months</option>
                                                              <option value="Before 2 Weeks">Before 2 Weeks</option>
                                                         <option value="Before 1 Week">Before 1 Week</option>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Renewal Notification<a class="text-danger">*</a></label>
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
                                            <label class="control-label">Insurance Tagged<a class="text-danger">*</a></label>
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
                                            <label class="control-label">Notice Period <a class="text-danger">*</a></label>
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
                                            <label class="control-label">Actual Rental Income Per Month <a class="text-danger">*</a></label>
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
                                            <label class="control-label">Actual Yearly Rental Income<a class="text-danger">*</a></label>
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Municipal Charges <a class="text-danger">*</a></label>
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
                                            <label class="control-label">Maintenance Charges <a class="text-danger">*</a></label>
                                        </div>
                                    
          <div class="col-md-12">
              <table class="table table-bordered mb-3" id="poCheckTable">
                  <thead>
                                    <tr><th>PD Cheque</th>
                                        <th>Date</th>
                                        <th>Action</th>
                                    </tr></thead>
                  <tbody>
                      <tr>
                          <td><input type="text"></td>
                          <td><input type="date"></td>
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
                                                    <select class="form-select">
                                                        <option value="Monthly">Monthly</option>
                                                         <option value="Quarterly">Quarterly</option>
                                                          <option value="Half-Yearly">Half-Yearly</option>
                                                        <option value="Monthly">Yearly</option>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Billing Cycle <a class="text-danger">*</a></label>
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
                                                    <input type="date" placeholder="Fill" class="form-control" id="" name="" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Billing Due date <a class="text-danger">*</a></label>
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Municipal Form No <a class="text-danger">*</a></label>
                                        </div>
                                   <div class="col-md-4 col-sm-12 col-xs-12  mb-3">     
                                            <label class="control-label">Attach Municipal Agreement <a class="text-danger">*</a></label>
                                                  <input type="file" placeholder="Fill" class="form-control" id="" name="" value="">
    
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
              <table class="table table-bordered mb-3 table-responsive" id="poCheckTable">
                  <thead>
                                    <tr><th>Service Name</th>
                                        <th>Description</th>
                                        <th>Service Charge Interval</th>
                                        <th>Fixed Service Charge</th>
                                        <th>Action</th>
                                    </tr></thead>
                  <tbody>
                      <tr>
                          <td><input type="text"></td>
                          <td><input type="text"></td>
                          <td><input type="text"></td>
                          <td><input type="text"></td>
                          <td><i class="fa fa-plus text-primary" onclick="addBasicDetailsRow(event)"></i> &nbsp; <i onclick="removeBasicDetailsRow(event)" class="fa fa-times text-danger"></i></td>
                      </tr>
                  </tbody>
              </table>
          </div>
                                    
                                   
                                 
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
                                   
                                    
          <div class="col-md-12">
              <table class="table table-bordered mb-3" id="poCheckTable">
                  <thead>
                                    <tr><th>Utility Category</th>
                                        <th>Utility Name</th>
                                        <th>Action</th>
                                    </tr></thead>
                  <tbody>
                      <tr>
                          <td><input type="text"></td>
                          <td><input type="text"></td>
                          <td><i class="fa fa-plus text-primary" onclick="addBasicDetailsRow(event)"></i> &nbsp; <i onclick="removeBasicDetailsRow(event)" class="fa fa-times text-danger"></i></td>
                      </tr>
                  </tbody>
              </table>
          </div>
                                    
                                   
                                 
      </div>
    </div>
                                    </div>
                                    
                                 
                                 
                                     <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5 mt-3">
                                            <input type="button" onclick="onSubmit(event)" value="Save" class="btn btn-primary">
                                            <input type="submit" value="Save As Draft" class="btn btn-primary">
                                            <a class="btn btn-danger" href="../insurance/tenantContractList.htm">Cancel</a>
                                           
                                        </div>
                                 
                                    
                                </form>
                                    
                                    
                            </div>   </div>   </div>   </div>
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
          <form class="validateForm" id="quoteForm" action="#"  method="post" enctype="multipart/form-data">
                <div class="col-md-12 col-sm-12 col-xs-12 form-floating mb-3">  
                  <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                  <label class="control-label">Tenant Name <a class="text-danger">*</a></label>
                </div>
              <div class="col-md-12 col-sm-12 col-xs-12 form-floating mb-3">  
                  <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                  <label class="control-label">Tenant Phone Number <a class="text-danger">*</a></label>
                </div>
              
              <div class="col-md-12 col-sm-12 col-xs-12 form-floating mb-3">  
                  <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                  <label class="control-label">Tenant Email ID <a class="text-danger">*</a></label>
                </div>
              
              <div class="col-md-12 col-sm-12 col-xs-12 form-floating mb-3">  
                  <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                  <label class="control-label">ID Card Type <a class="text-danger">*</a></label>
                </div>
              <div class="col-md-12 col-sm-12 col-xs-12 form-floating mb-3">  
                  <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                  <label class="control-label">Labour Card Number <a class="text-danger">*</a></label>
                </div>
              
              <div class="col-md-12 col-sm-12 col-xs-12 form-floating mb-3">  
                  <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                  <label class="control-label">Permanent Address <a class="text-danger">*</a></label>
                </div>
              
              <div class="col-md-12 col-sm-12 col-xs-12 form-floating mb-3">  
                  <input type="file" placeholder="Fill" class="form-control" id="" name="" value="">
                  <label class="control-label">Attachment </label>
                </div>
              
              
          </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
                        <jsp:include page="../login/footer.jsp" />
                        <script>
                           $(document).ready(function() {
               $('#check_penalty input').on('change', function() {
   var penaltyStatus = $('input[name=penalty_status]:checked').val(); 
   if(penaltyStatus == "yes") {
        $("#penalty_amount_hide").show();
        $("#penalty_type_hide").show();
   } else {
        $("#penalty_amount_hide").hide();
       $("#penalty_type_hide").hide();
   }
});
                                    $("#hideCompany").hide();
                                $("#crNoHide").hide();
                                 $("#penalty_amount_hide").hide();
                                $("#penalty_type_hide").hide();
                                  
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
                                
                                if($("#poCheckTable tr").length > 13){
                                    swal("You can not add more than 12 rows");
                                    $("#poCheckTable tr:last").remove();
                                }
                                
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
          
                        </script>
                    </body>

                    </html>