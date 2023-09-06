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
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css" integrity="sha512-gxWow8Mo6q6pLa1XH/CcH8JyiSDEtiwJV78E+D+QP0EVasFs8wKXq16G8CLD4CJ2SnonHr4Lm/yY2fSI2+cbmw==" crossorigin="anonymous" />
                        </head>
                    <body class="nav-md">
                        <jsp:include page="../login/menu.htm" />


                        <main id="main" class="main">
                            <div>
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
                                  <c:forEach items="${unitLandLordDetailsList}" var="list">
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                           
                                        <input type="text" class="form-control" readonly=""  id="landlordname" name="landlordname" value="${list.landlordName}">
                                        <input type="hidden" readonly id="pk" name="pk" class="form-control" maxlength="500" value="${list.sno}" >                   
                                            <label class="control-label">Select Landlord Name </label>
                                        </div>
                                  </c:forEach>
                                
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
        <c:forEach items="${unitCustomerDetailsList}" var="list">
      <div class="accordion-body row">
        
                                 <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">
                                   
                                                                <input type="text" class="form-control"  id="customerName" name="customerName" value="${list.customerName}">
                                                           <input type="hidden" readonly id="pk" name="pk" class="form-control" maxlength="500" value="${list.sno}" required>                   
                                            <label class="control-label">Customer Name<a class="text-danger">*</a> </label>
                                        </div>
            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                           
                                                                <input type="text" class="form-control"  id="customerReference" name="customerReference" value="${list.customerReference} ">
                                                           
                                            <label class="control-label">Customer Reference </label>
                                        </div>
          <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3" id="hideAgentName">  
            <input type="text" placeholder="Fill" class="form-control" value="">
              <label class="control-label">Agent Name </label>

           </div>
                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" id="customerRefId" name="customerRefId" value="${list.customerRefId}" required>
                                                            
                                            <label class="control-label">Customer Reference Id<a class="text-danger">*</a></label>
                                        </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                          
                                                                <input type="text" class="form-control"  id="customerId" name="customerId" value="${list.customerId}">
                                                                                                        
<!--                                                    <input type="text" placeholder="Fill" class="form-control" id="customerId" name="customerId" value="">-->
                                               
                                            <label class="control-label">Customer Id </label>
                                        </div>
                                  
             <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                           
                                                                <input type="text" class="form-control" id="customerType" name="customerType" value="${list.customerType}">
                                                           
                                            <label class="control-label">Select Customer Type</label>
                                        </div>
          <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3" id="hideCompany">     
                                          
                                                                <input type="text" class="form-control" id="" value="${list.businessName}">
                                                           
                                            <label class="control-label">Company / Business Name </label>
                                        </div>
          <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3" id="crNoHide">     
                                           
                                                                <input type="text" class="form-control" id="" value="${list.crNo}">
                                                         
                                            <label class="control-label">Business CR No </label>
                                        </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control"  id="customerPerson" name="customerPerson" value="${list.customerPerson}">
                                                           
                                            <label class="control-label">Contact Person </label>
                                        </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control"  id="customerEmailId" name="customerEmailId" value="${list.customerEmailId}" onblur="validateEmail(this);">
                                                         
                                            <label class="control-label">Registered Email Id </label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3"> 
                                               <div>          
                                            <label class="control-label">Phone No </label>
                                          
                                                                <input type="tel" class="form-control"  id="phoneNo" name="phoneNo" value="${list.phoneNo}"  onkeypress="isNumberKey(event)" >
                                           
                                               </div>
                                        </div>
        </c:forEach>
          <table class='table table-bordered col-md-4' id="multiPhoneNumberTable">
              <tr>
                  <th>Contact Person</th>
                  <th>Email Id</th>
                  <th>Phone Number</th>
                  <th>Action</th>
              </tr>
              <tr>
                  <c:forEach items="${UnitMulipleCustomerDetailsList}" var="list">
                      <td class="item-row-actions d-none">
                                <input type="hidden" class="form-control-plaintext" id="pk" name="pk"
                                      value="${list.sno}" pattern=".*">
                                                                            </td>
                  <td><input type="text" placeholder="Fill" class="form-control" id="" name="contactPersonName" value="${list.contactPersonName}"></td>
                    <td><input type="text" placeholder="Fill" class="form-control" id="emailId" name="emailId" value="${list.emailId}" onblur="validateEmail(this);"></td>
                      <td><input type="tel" onkeypress="isNumberKey(event)" placeholder="Fill" class="form-control" id="phoneNumber" name="phoneNumber" value="${list.phoneNumber}"></td>
                  <td><i class="fa fa-plus text-primary" onclick="addBasicDetailsRow(event)"></i> &nbsp; <i onclick="removeBasicDetailsRow(event)" class="fa fa-times text-danger"></i></td>
                  </c:forEach>
              </tr>
          </table>
              
          
          
                                    
          <div class="row" id="residentialSection">
              <c:forEach items="${unitCustomerDetailsList}" var="list">
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" id="" value="${list.billingAddress}">
                                                           
                                            <label class="control-label">Billing Address <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" id="" value="${list.permanentAddress}">
                                                            
                                            <label class="control-label">Permanent Address <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" id="" value="${list.jointeeName1}">
                                                           
                                            <label class="control-label">Jointee Name1 <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" id="" value="${list.jointeeAddress1}">
                                                            
                                            <label class="control-label">Jointee Address 1 <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" id="" value="${list.jointeeName2}">
                                                            
                                            <label class="control-label">Jointee Name 2 <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" id="" value="${list.jointeeAddress2}">
                                                            
                                            <label class="control-label">Jointee Address 2 <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                                                                       
                                                    <input type="text" placeholder="Fill" class="form-control" id="sponsorName" name="sponsorName" value="${list.sponsorName}">
                                               
                                            <label class="control-label">Sponsor name <a class="text-danger">*</a></label>
                                        </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" id="" value="${list.sponserAddress}">
                                                            
                                            <label class="control-label">Sponsor Address <a class="text-danger">*</a></label>
                                        </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" id="" value="${list.sponsorEmailId}">
                                                      
                                            <label class="control-label">Sponsor Email ID <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" id="" value="${list.document}">
                                                            
                                            <label class="control-label">ID attachment <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control"  id="" value="${list.idCardType}">
                                                            
                                            <label class="control-label">ID Card type <a class="text-danger">*</a></label>
                                        </div>
              </c:forEach>
              </div>
      </div>
    </div> </div>
                                 
                                      <div class="accordion-item">
    <h2 class="accordion-header" id="flush-contract">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-contracts" aria-expanded="false" aria-controls="flush-contracts">
        Contract Details
      </button>
    </h2>
    <div id="flush-contracts" class="accordion-collapse collapse" aria-labelledby="flush-contract" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body row">
          <c:forEach items="${unitContractDetailsList}" var="list">
            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control"  id="contractode" name="contractode" value="${list.contractode}">
                                                           <input type="text" readonly id="pk" name="pk" class="form-control" maxlength="500" value="${list.sno}" required>  
                                            <label class="control-label">Contract Code</label>
                                        </div>
<!--          <div class="col-md-12">
              <button type="button" class="btn btn-primary">Choose From Contracts Templates</button>
          </div>-->
                 <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                           
                                                                <input type="text" class="form-control" id="contractType" name="contractType" value="${list.contractType}">
                                                          
                                            <label class="control-label">Contract Type </label>
                                        </div>
           <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control"id="contractCategory" name="contractCategory" value="${list.contractCategory}">
                                                            
                                            <label class="control-label">Contract Category </label>
                                        </div>
           <div class="col-md-4 mb-3 my-auto">
                               <label class="control-label">
                                <input type="checkbox" id="fitPeriod" name="isPeriodcheckBox" maxlength="98">
                               Is Fit In Period Applicable ? </label>
                            </div>
      
                 <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3" id="contractPeriodHide">     
                                            
                                                                <input type="text" class="form-control"  id="contractPeriod" name="contractPeriod" value="${list.contractPeriod}">
                                                            
                                            <label class="control-label">Contract Period </label>
                                        </div>
          <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" id="contractType" name="contractType" value="${list.contractType}">
                                                            
                                            <label class="control-label">Contract Type </label>
                                        </div>
                                            
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" id="unitDescription" name="unitDescription" value="${list.unitDescription}">
                                                            
                                            <label class="control-label">Unit Description </label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" id="propertyName" name="propertyName" value="${list.propertyName}">
                                                            
                                            <label class="control-label">Property Name <a class="text-danger">*</a></label>
                                        </div>
                                    
                                <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control"  id="monthlyRentIncome" name="monthlyRentIncome" value="${list.monthlyRentIncome}">
                                                            
                                            <label class="control-label">Monthly Rental Income ( Expected ) </label>
                                        </div>
           <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" id="expectedSecurityDeposit" name="expectedSecurityDeposit" value="${list.expectedSecurityDeposit}">
                                                              
                                            <label class="control-label">Expected Security Deposit </label>
                                        </div>
           <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control"  id="serviceCharges" name="serviceCharges" value="${list.serviceCharges}">
                                                            
                                            <label class="control-label">Service Charges ( in % ) </label>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" id="paymentType" name="paymentType" value="${list.paymentType}">
                                                            
                                            <label class="control-label">Payment Type </label>
                                        </div>
        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" id="vatPercent" name="vatPercent" value="${list.vatPercent}">
                                                            
                                            <label class="control-label">VAT( in % ) </label>
                                        </div>
                  <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control"  id="unitNo" name="unitNo" value="${list.unitNo}">
                                                            
                                            <label class="control-label">Unit Name / Number </label>
                                        </div>
                  <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control datepicker1" id="startDate" name="startDate" value="" >
                                                            
                                            <label class="control-label">Contract Start Date <a class="text-danger">*</a></label>
                                        </div>
                  <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control datepicker2" id="endDate" name="endDate" value="">
                                                            
                                            <label class="control-label">Contract End Date <a class="text-danger">*</a></label>
                                        </div>
                  <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control datepicker3" id="renewalDate" name="renewalDate" value="">
                                                            
                                            <label class="control-label">Contract Renewal Date </label>
                                        </div>
            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control"  id="renewalNotification" name="renewalNotification" value="${list.renewalNotification}">
                                                            
                                            <label class="control-label">Renewal Notification</label>
                                        </div>
                  <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" id="insuranceTagged" name="insuranceTagged" value="${list.insuranceTagged}">
                                                            
                                            <label class="control-label">Insurance Tagged</label>
                                        </div>
                  <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" id="noticePeriod" name="noticePeriod" value="${list.noticePeriod}">
                                                            
                                            <label class="control-label">Notice Period </label>
                                        </div>
                  <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" id="actualRentIncome" name="actualRentIncome" value="${list.actualRentIncome}">
                                                            
                                            <label class="control-label">Actual Rental Income Per Month</label>
                                        </div>
                  <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" id="actualYearlyIncome" name="actualYearlyIncome" value="${list.actualYearlyIncome}">
                                                            
                                            <label class="control-label">Actual Yearly Rental Income</label>
                                        </div>
          </c:forEach>
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
          <c:forEach items="${additionalDetailsList}" var="list">
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" id="municipalCharges" name="municipalCharges" value="${list.municipalCharges}">
                                                            <input type="hidden" readonly id="pk" name="pk" class="form-control" maxlength="500" value="${list.sno}" >
                                            <label class="control-label">Municipal Charges </label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control"  id="maintenanceCharges" name="maintenanceCharges" value="${list.maintenanceCharges}" autocomplete="off">
                                                            
                                            <label class="control-label">Maintenance Charges </label>
                                        </div>
          </c:forEach>
                                    
          <div class="col-md-12">
              <table class="table table-bordered mb-3" id="poCheckTable">
                  <thead>
                                    <tr><th>PD Cheque</th>
                                        <th>Date</th>
                                        <th>Action</th>
                                    </tr></thead>
                  <tbody>
                      <c:forEach items="${pDCheckAdditionalCustomerDetailsList}" var="list">
                      <tr>
                          <td class="item-row-actions d-none">
                                <input type="hidden" class="form-control-plaintext" id="pk" name="pk"
                                      value="${list.sno}" pattern=".*">
                                                                            </td>
                              <td><input type="text"  name="pdCheque" value="${list.pdCheque}"></td>
                              <td><input type="date"  name="pdDate" value="" class="datepicker5"></td>
                          <td><i class="fa fa-plus text-primary" onclick="addBasicDetailsRow(event)"></i> &nbsp; <i onclick="removeBasicDetailsRow(event)" class="fa fa-times text-danger"></i></td>
                          
                      </tr>
                      </c:forEach>
                  </tbody>
              </table>
          </div>
                                    <c:forEach items="${additionalDetailsList}" var="list">
                                   
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                           
                                                                <input type="text" class="form-control"  id="billingCycle" name="billingCycle" value="${list.billingCycle}">
                                                            
                                            <label class="control-label">Billing Cycle</label>
                                        </div>
           <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
               <input type="text" class="form-control datepicker4" id="billingDueDate" name="billingDueDate" value="">
                                                            
                                            <label class="control-label">Billing Due date </label>
                                        </div>
                                    
                                  
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control"  id="municipalAgreementNo" name="municipalAgreementNo" value="${list.municipalAgreementNo}">
                                                            
                                            <label class="control-label">Municipal Agreement No <a class="text-danger">*</a></label>
                                        </div>
          <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control"  id="municipalFormNo" name="municipalFormNo" value="${list.municipalFormNo}">
                                                            
                                            <label class="control-label">Municipal Form No</label>
                                        </div>
                                   <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                
                                                                                                    
                                                    <input type="file" placeholder="Fill" class="form-control" disabled id="documentAttach" name="documentAttach" value="">
                                                        
                                            
                                            <label class="control-label">Attach Municipal Agreement </label>
                                        </div>
                                    </c:forEach>
          
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
                      <c:forEach items="${serviceAmentiesDetailsList}" var="list">
                      <tr>
                          <td class="item-row-actions d-none">
                                <input type="hidden" class="form-control-plaintext" id="pk" name="pk"
                                      value="${list.sno}" pattern=".*">
                                                                            </td>
                          <td><input type="text" name="serviceName"  value="${list.serviceName}"></td>
                          <td><input type="text" name="description"  value="${list.description}"></td>
                          <td><input type="text" name="serviceCharge"  value="${list.serviceCharge}"></td>
                          <td><input type="text" name="fixedServiceCharge"  value="${list.fixedServiceCharge}"></td>
                          <td><i class="fa fa-plus text-primary" onclick="addBasicDetailsRow(event)"></i> &nbsp; <i onclick="removeBasicDetailsRow(event)" class="fa fa-times text-danger"></i></td>
                      </tr>
                      </c:forEach>
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
                      <c:forEach items="${unitUtilityCategoryDetailsList}" var="list">
                      <tr>
                          <td class="item-row-actions d-none">
                                <input type="hidden" class="form-control-plaintext" id="pk" name="pk"
                                      value="${list.sno}" pattern=".*">
                                                                            </td>
                          <td><input type="text" name="utilityCategory"  value="${list.utilityCategory}"></td>
                          <td><input type="text" name="utilityName"  value="${list.utilityName}"></td>
                          <td><i class="fa fa-plus text-primary" onclick="addBasicDetailsRow(event)"></i> &nbsp; <i onclick="removeBasicDetailsRow(event)" class="fa fa-times text-danger"></i></td>
                      </tr>
                      </c:forEach>
                  </tbody>
              </table>
          </div>
                                    
                                   
                                 
      </div>
    </div>
                                    </div>
                                    
                                 
                                 
                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5 mt-3">
<!--                                            <input type="button" onclick="onSubmit(event)" value="Save" class="btn btn-primary">-->
                                            <input type="submit" value="Save" class="btn btn-primary">
                                            <a class="btn btn-danger" href="../insurance/tenantContractList.htm">Cancel</a>
                                           
                                        </div>
                                 
                                    
                                </form>
                                    
                                       </div>
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
                  <label class="control-label">Tenant Phone Number</label>
                </div>
              
              <div class="col-md-12 col-sm-12 col-xs-12 form-floating mb-3">  
                  <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                  <label class="control-label">Tenant Email ID</label>
                </div>
              
              <div class="col-md-12 col-sm-12 col-xs-12 form-floating mb-3">  
                  <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                  <label class="control-label">ID Card Type</label>
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
                        <jsp:include page="../login/footer.jsp" />
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
                    </body>

                    </html>