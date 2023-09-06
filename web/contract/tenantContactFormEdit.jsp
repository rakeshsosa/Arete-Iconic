<%-- Document : assetDetailsForm Created on : Sep 15, 2016, 10:42:18 AM Author : Kondal Reddy N --%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <%@page contentType="text/html" pageEncoding="UTF-8" %>
                    <!DOCTYPE html>
                    <html lang="en">

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
                                Landlord details
                              </button>
                            </h2>
                            <div id="flush-landlord" class="accordion-collapse collapse" aria-labelledby="flush-landlord-parent" data-bs-parent="#accordionFlushExample">
                              <div class="accordion-body row">
                                  <c:forEach items="${unitLandLordDetailsList}" var="list">
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                           
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.landlordName}">
                                                           
                                            <label class="control-label">Select Landlord Name <a class="text-danger">*</a></label>
                                        </div>
                                  </c:forEach>
                                
                                    </div>
                                  </div>
                                    </div> 
                                    <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
        Customer details
      </button>
    </h2>
    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
        <c:forEach items="${unitCustomerDetailsList}" var="list">
      <div class="accordion-body row">
        
                                 <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">
                                   
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.customerName}">
                                                           
                                            <label class="control-label">Customer Name <a class="text-danger">*</a></label>
                                        </div>
            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                           
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.customerReference}">
                                                           
                                            <label class="control-label">Customer Reference <a class="text-danger">*</a></label>
                                        </div>
          <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3" id="hideAgentName">  
            <input type="text" placeholder="Fill" class="form-control" value="">
              <label class="control-label">Agent Name <a class="text-danger">*</a></label>

           </div>
                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.customerRefId}">
                                                            
                                            <label class="control-label">Customer Reference ID</label>
                                        </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                          
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.customerId}">
                                                                                                        
                                                    <input type="text" placeholder="Fill" class="form-control" id="customerId" name="customerId" value="">
                                               
                                            <label class="control-label">Customer ID <a class="text-danger">*</a></label>
                                        </div>
                                  
             <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                           
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.customerType}">
                                                           
                                            <label class="control-label">Select Customer Type <a class="text-danger">*</a></label>
                                        </div>
          <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3" id="hideCompany">     
                                          
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.businessName}">
                                                           
                                            <label class="control-label">Company / Business Name <a class="text-danger">*</a></label>
                                        </div>
          <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3" id="crNoHide">     
                                           
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.crNo}">
                                                         
                                            <label class="control-label">Business CR No <a class="text-danger">*</a></label>
                                        </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.customerPerson}">
                                                           
                                            <label class="control-label">Contact Person <a class="text-danger">*</a></label>
                                        </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.customerEmailId}">
                                                         
                                            <label class="control-label">Registered email ID <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                          
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.phoneNo}">
                                                            
                                            <label class="control-label">Phone No <a class="text-danger">*</a></label>
                                        </div>
        </c:forEach>
          <table class='table table-bordered col-md-4' id="multiPhoneNumberTable">
              <tr>
                  <th>Contact Person</th>
                  <th>Email ID</th>
                  <th>Phone number</th>
                  <th>Action</th>
              </tr>
              <tr>
                  <c:forEach items="${UnitMulipleCustomerDetailsList}" var="list">
                  <td><input type="text" placeholder="Fill" class="form-control" id="" name="contactPersonName" value="${list.contactPersonName}"></td>
                    <td><input type="text" placeholder="Fill" class="form-control" id="emailId" name="emailId" value="${list.emailId}"></td>
                      <td><input type="text" placeholder="Fill" class="form-control" id="phoneNumber" name="phoneNumber" value="${list.phoneNumber}"></td>
                  <td><i class="fa fa-plus text-primary" onclick="addBasicDetailsRow(event)"></i> &nbsp; <i onclick="removeBasicDetailsRow(event)" class="fa fa-times text-danger"></i></td>
                  </c:forEach>
              </tr>
          </table>
              
          
          
                                    
          <div class="row" id="residentialSection">
              <c:forEach items="${unitCustomerDetailsList}" var="list">
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.billingAddress}">
                                                           
                                            <label class="control-label">Billing Address <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.permanentAddress}">
                                                            
                                            <label class="control-label">Permanent Address <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName1}">
                                                           
                                            <label class="control-label">Jointee Name1 <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeAddress1}">
                                                            
                                            <label class="control-label">Jointee Address 1 <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeName2}">
                                                            
                                            <label class="control-label">Jointee Name 2 <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.jointeeAddress2}">
                                                            
                                            <label class="control-label">Jointee Address 2 <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                                                                       
                                                    <input type="text" placeholder="Fill" class="form-control" id="sponsorName" name="sponsorName" value="${list.sponsorName}">
                                               
                                            <label class="control-label">Sponsor name <a class="text-danger">*</a></label>
                                        </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.sponserAddress}">
                                                            
                                            <label class="control-label">Sponsor Address <a class="text-danger">*</a></label>
                                        </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.sponsorEmailId}">
                                                      
                                            <label class="control-label">Sponsor Email ID <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.document}">
                                                            
                                            <label class="control-label">ID attachment <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.idCardType}">
                                                            
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
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.contractode}">
                                                            
                                            <label class="control-label">Contract Code<a class="text-danger">*</a></label>
                                        </div>
<!--          <div class="col-md-12">
              <button type="button" class="btn btn-primary">Choose From Contracts Templates</button>
          </div>-->
                 <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                           
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.contractType}">
                                                          
                                            <label class="control-label">Contract Type <a class="text-danger">*</a></label>
                                        </div>
           <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.contractCategory}">
                                                            
                                            <label class="control-label">Contract Category <a class="text-danger">*</a></label>
                                        </div>
           <div class="col-md-4 mb-3 my-auto">
                               <label class="control-label">
                                <input type="checkbox" id="fitPeriod" name="isPeriodcheckBox" maxlength="98">
                               Is Fit In Period Applicable ? </label>
                            </div>
      
                 <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3" id="contractPeriodHide">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.contractPeriod}">
                                                            
                                            <label class="control-label">Contract Period <a class="text-danger">*</a></label>
                                        </div>
          <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.contractType}">
                                                            
                                            <label class="control-label">Contract Type <a class="text-danger">*</a></label>
                                        </div>
                                            
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.unitDescription}">
                                                            
                                            <label class="control-label">Unit Description <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.propertyName}">
                                                            
                                            <label class="control-label">Property Name <a class="text-danger">*</a></label>
                                        </div>
                                    
                                <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.monthlyRentIncome}">
                                                            
                                            <label class="control-label">Monthly Rental Income ( Expected ) <a class="text-danger">*</a></label>
                                        </div>
           <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.expectedSecurityDeposit}">
                                                              
                                            <label class="control-label">Expected Security Deposit <a class="text-danger">*</a></label>
                                        </div>
           <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.serviceCharges}">
                                                            
                                            <label class="control-label">Service Charges ( in % ) <a class="text-danger">*</a></label>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.paymentType}">
                                                            
                                            <label class="control-label">Payment Type <a class="text-danger">*</a></label>
                                        </div>
        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.vatPercent}">
                                                            
                                            <label class="control-label">VAT( in % ) <a class="text-danger">*</a></label>
                                        </div>
                  <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.unitNo}">
                                                            
                                            <label class="control-label">Unit Name / Number <a class="text-danger">*</a></label>
                                        </div>
                  <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.startDate}">
                                                            
                                            <label class="control-label">Contract Start Date <a class="text-danger">*</a></label>
                                        </div>
                  <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.endDate}">
                                                            
                                            <label class="control-label">Contract End Date <a class="text-danger">*</a></label>
                                        </div>
                  <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.renewalDate}">
                                                            
                                            <label class="control-label">Contract Renewal Date <a class="text-danger">*</a></label>
                                        </div>
            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.renewalNotification}">
                                                            
                                            <label class="control-label">Renewal Notification<a class="text-danger">*</a></label>
                                        </div>
                  <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.insuranceTagged}">
                                                            
                                            <label class="control-label">Insurance Tagged<a class="text-danger">*</a></label>
                                        </div>
                  <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.noticePeriod}">
                                                            
                                            <label class="control-label">Notice Period <a class="text-danger">*</a></label>
                                        </div>
                  <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.actualRentIncome}">
                                                            
                                            <label class="control-label">Actual Rental Income Per Month <a class="text-danger">*</a></label>
                                        </div>
                  <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.actualYearlyIncome}">
                                                            
                                            <label class="control-label">Actual Yearly Rental Income<a class="text-danger">*</a></label>
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
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.municipalCharges}">
                                                            
                                            <label class="control-label">Municipal Charges <a class="text-danger">*</a></label>
                                        </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" id="" name="" value="${list.maintenanceCharges}" autocomplete="off">
                                                            
                                            <label class="control-label">Maintenance Charges <a class="text-danger">*</a></label>
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
                          
                              <td><input type="text" name="pdCheque" value="${list.pdCheque}"></td>
                              <td><input type="date" name="pdDate" value="${list.pdDate}"></td>
                          <td><i class="fa fa-plus text-primary" onclick="addBasicDetailsRow(event)"></i> &nbsp; <i onclick="removeBasicDetailsRow(event)" class="fa fa-times text-danger"></i></td>
                          
                      </tr>
                      </c:forEach>
                  </tbody>
              </table>
          </div>
                                    <c:forEach items="${additionalDetailsList}" var="list">
                                   
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                           
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.billingCycle}">
                                                            
                                            <label class="control-label">Billing Cycle <a class="text-danger">*</a></label>
                                        </div>
           <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.billingDueDate}">
                                                            
                                            <label class="control-label">Billing Due date <a class="text-danger">*</a></label>
                                        </div>
                                    
                                  
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.municipalAgreementNo}">
                                                            
                                            <label class="control-label">Municipal Agreement No <a class="text-danger">*</a></label>
                                        </div>
          <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                                <input type="text" class="form-control" readonly="" id="" value="${list.municipalFormNo}">
                                                            
                                            <label class="control-label">Municipal Form No <a class="text-danger">*</a></label>
                                        </div>
                                   <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            
                                                
                                                                                                    
                                                    <input type="file" placeholder="Fill" class="form-control" id="documentAttach" name="documentAttach" value="">
                                                        
                                            
                                            <label class="control-label">Attach Municipal Agreement <a class="text-danger">*</a></label>
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
                          <td><input type="text" name="serviceName" value="${list.serviceName}"></td>
                          <td><input type="text" name="description" value="${list.description}"></td>
                          <td><input type="text" name="serviceCharge" value="${list.serviceCharge}"></td>
                          <td><input type="text" name="fixedServiceCharge" value="${list.fixedServiceCharge}"></td>
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
                          <td><input type="text" name="utilityCategory" value="${list.utilityCategory}"></td>
                          <td><input type="text" name="utilityName" value="${list.utilityName}"></td>
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
<!--                                            <input type="submit" value="Save" class="btn btn-primary">-->
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
                        </script>
                    </body>

                    </html>