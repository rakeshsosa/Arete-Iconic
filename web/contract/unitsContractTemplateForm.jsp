<%-- Document : assetDetailsForm Created on : Sep 15, 2016, 10:42:18 AM Author : Kondal Reddy N --%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <%@page contentType="text/html" pageEncoding="UTF-8" %>
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
                    </head>

    <script>
        function selectPropertyDetails()
        {
            myWindow = window.open("../insurance/selectPropertyName.htm", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            window.close();
        }

    </script>
                    <body class="nav-md">
                        <jsp:include page="../login/menu.htm" />
                        <jsp:include page="../login/footer.jsp" />


                        <main id="main" class="main">
                            <div class="mt-3">
                                <jsp:include page="../login/headerlink.htm?submodule=Units Contracts Manager&tab=Units Contract Template&pagetype=form"/>
                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h5>Department Roles</h5>
                                                </div>
                                                <form class="form-inline row" action="../insurance/unitsContractTemplateFormSubmit.htm">
                                                  <div class="col-md-4 form-floating mb-3">
                                                        
                                                     <c:choose>
                                                <c:when test="${fn:length(unitContractTemplateList) > 0}">
                                                    <c:forEach items="${unitContractTemplateList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                    <select id="assetType" placeholder="Fill" name="assetType" required="" class="form-select validate[required]">
                                                            <option value="${list.contractCategory}" selected="">${list.contractCategory}</option>
                                                                <option value="Commercial">Commercial</option> 
                                                                <option value="Residential">Residential</option> 
                                                        </select>                                                            
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="assetType" value="${list.contractCategory}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <select id="assetType" placeholder="Fill" name="assetType" required="" class="form-select validate[required]">
                                                            <option value="" disabled="" selected="">Select your option</option>
                                                                <option value="Commercial">Commercial</option> 
                                                                <option value="Residential">Residential</option> 
                                                        </select> 
                                                </c:otherwise>       
                                            </c:choose>
                                                      <label class="control-label">Contract Category 
                                                    <a style="color:red;">*</a> </label>
                                                     </div>
                                                    <div class="col-md-4 form-floating mb-3">
                                                        
                                                    <c:choose>
                                                <c:when test="${fn:length(unitContractTemplateList) > 0}">
                                                    <c:forEach items="${unitContractTemplateList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                    <select id="assetType2" placeholder="Fill" name="assetType2" required="" class="form-select validate[required]">
                                                            <option value="${list.contractType}" selected="">${list.contractType}</option>
                                                                <option value="Long Term Contract">Long Term Contract</option>
                                                                 <option value="Short Term Contract">Short Term Contract</option>
                                                                <option value="Others">Others</option> 
                                                        </select>                                                           
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="assetType2" value="${list.contractType}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <select id="assetType2" placeholder="Fill" name="assetType2" required="" class="form-select validate[required]">
                                                            <option value="" disabled="" selected="">Select your option</option>
                                                                <option value="Long Term Contract">Long Term Contract</option>
                                                                 <option value="Short Term Contract">Short Term Contract</option>
                                                                <option value="Others">Others</option> 
                                                        </select>  
                                                </c:otherwise>       
                                            </c:choose>
                                                        <label class="control-label">Contract Type 
                                                    <a style="color:red;">*</a> </label>
                                                     </div>
                                                       <div class="col-md-4 form-floating mb-3">
                                                        
                                                     <c:choose>
                                                <c:when test="${fn:length(unitContractTemplateList) > 0}">
                                                    <c:forEach items="${unitContractTemplateList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                    <select id="assetType3" placeholder="Fill" name="assetType3" required="" class="form-select validate[required]">
                                                            <option value="${list.contractPeriod}"  selected="">${list.contractPeriod}</option>
                                                                <option value="2 years">2 years</option>
                                                                  <option value="2 years">1 years</option>
                                                                    <option value="6 Months">6 Months</option>
                                                                <option value="3 Months">3 Months</option>
                                                        </select>                                                           
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="assetType3" value="${list.contractPeriod}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>  
                                                    <select id="assetType3" placeholder="Fill" name="assetType3" required="" class="form-select validate[required]">
                                                            <option value="" disabled=""  selected="">Select your option</option>
                                                                <option value="2 years">2 years</option>
                                                                  <option value="2 years">1 years</option>
                                                                    <option value="6 Months">6 Months</option>
                                                                <option value="3 Months">3 Months</option>
                                                        </select> 
                                                     
                                                </c:otherwise>       
                                            </c:choose>
                                                           <label class="control-label">Contract Period 
                                                    <a style="color:red;">*</a> </label>
                                                     </div>
                                                      <div class="col-md-4 form-floating mb-3">
                                                        
                                                    <c:choose>
                                                <c:when test="${fn:length(unitContractTemplateList) > 0}">
                                                    <c:forEach items="${unitContractTemplateList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                    <select id="assetType4" placeholder="Fill" name="assetType4" required="" class="form-select validate[required]">
                                                            <option value="${list.unitType}" selected="">${list.unitType}</option>
                                                                <option value="Industrial">Industrial</option>
                                                                  <option value="Residential">Residential</option>
                                                        </select>                                                           
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="assetType4" value="${list.unitType}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>  
                                                    <select id="assetType4" placeholder="Fill" name="assetType4" required="" class="form-select validate[required]">
                                                            <option value="" disabled="" selected="">Select your option</option>
                                                                <option value="Industrial">Industrial</option>
                                                                  <option value="Residential">Residential</option>
                                                        </select> 
                                                </c:otherwise>       
                                            </c:choose>
                                                          <label class="control-label">Unit Type 
                                                    <a style="color:red;">*</a> </label>
                                                     </div>
                                                    <div class="col-md-4 form-floating mb-3">
                                                        
                                                        <c:choose>
                                                <c:when test="${fn:length(unitContractTemplateList) > 0}">
                                                    <c:forEach items="${unitContractTemplateList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="assetType5" name="assetType5" required="" value="${list.unitDescription}" placeholder="Fill" class="form-control validate[required]">
                                                                <input type="hidden" readonly id="pk" name="pk" class="form-control" maxlength="500" value="${list.sNo}" required>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="assetType5" name="assetType5" required="" value="${list.unitDescription}" readonly="" placeholder="Fill" class="form-control validate[required]">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" id="assetType5" name="assetType5" required="" placeholder="Fill" class="form-control validate[required]">
                                                </c:otherwise>        
                                            </c:choose>
                                                     <label class="control-label">Unit Description 
                                                    <a style="color:red;">*</a> </label>
                                                     </div>
                                                    <div class="col-md-4 form-floating mb-3">
                                              
                                              <c:choose>
                                                <c:when test="${fn:length(unitContractTemplateList) > 0}">
                                                    <c:forEach items="${unitContractTemplateList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control  input-xlarge" placeholder="Fill" id="jointeeName1" name="jointeeName1" value="${list.propertyName}" readonly="" type="text"  onclick="return selectPropertyDetails();">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control  input-xlarge" placeholder="Fill" id="jointeeName1" name="jointeeName1" value="${list.propertyName}" readonly="" type="text"  onclick="return selectPropertyDetails();">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                   <input class="form-control  input-xlarge" placeholder="Fill" id="jointeeName1" name="jointeeName1" readonly="" type="text"  onclick="return selectPropertyDetails();">
                                                </c:otherwise>        
                                            </c:choose>  
                                              <label class="control-label">Property Name<span style="color: red">*</span></label>
                                                  <input type="hidden" name="assetCode" id="assetCode" value="">
                                                 </div>
                                                    <div class="col-md-4 form-floating mb-3">
                                              
                                              <c:choose>
                                                <c:when test="${fn:length(unitContractTemplateList) > 0}">
                                                    <c:forEach items="${unitContractTemplateList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control  input-xlarge" placeholder="Fill" id="propertyName" name="propertyName" value="${list.monthlyRentIncome}" type="text" onclick="SelectProperty();" onkeypress="return isNumberKey(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control  input-xlarge" placeholder="Fill" id="propertyName" name="propertyName" value="${list.monthlyRentIncome}" readonly="" type="text" onclick="SelectProperty();" onkeypress="return isNumberKey(event)">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                   <input class="form-control  input-xlarge" placeholder="Fill" id="propertyName" name="propertyName" type="text" onclick="SelectProperty();" onkeypress="return isNumberKey(event)">
                                                </c:otherwise>        
                                            </c:choose>   
                                              <label class="control-label">Monthly Rental Income ( Expected ) <span style="color: red">*</span></label>
                                                 </div>
                                                    <div class="col-md-4 form-floating mb-3">
                                              
                                              <c:choose>
                                                <c:when test="${fn:length(unitContractTemplateList) > 0}">
                                                    <c:forEach items="${unitContractTemplateList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control  input-xlarge" placeholder="Fill" id="propertyName2" name="propertyName2" value="${list.expectedSecurityDeposit}" type="text" onclick="SelectProperty();" onkeypress="return isNumberKey(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control  input-xlarge" placeholder="Fill" id="propertyName2" name="propertyName2" value="${list.expectedSecurityDeposit}" readonly="" type="text" onclick="SelectProperty();" onkeypress="return isNumberKey(event)">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                   <input class="form-control  input-xlarge" placeholder="Fill" id="propertyName2" name="propertyName2" type="text" onclick="SelectProperty();" onkeypress="return isNumberKey(event)">
                                                </c:otherwise>        
                                            </c:choose>   
                                              <label class="control-label">Expected Security Deposit <span style="color: red">*</span></label>
                                                 </div>
                                                    <div class="col-md-4 form-floating mb-3">
                                              
                                              <c:choose>
                                                <c:when test="${fn:length(unitContractTemplateList) > 0}">
                                                    <c:forEach items="${unitContractTemplateList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control  input-xlarge" placeholder="Fill" id="propertyName3" name="propertyName3" value="${list.serviceCharges}" type="text" onclick="SelectProperty();"onkeypress="return isNumberKey(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control  input-xlarge" placeholder="Fill" id="propertyName3" name="propertyName3" value="${list.serviceCharges}" readonly="" type="text" onclick="SelectProperty();"onkeypress="return isNumberKey(event)">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                   <input class="form-control  input-xlarge" placeholder="Fill" id="propertyName3" name="propertyName3" type="text" onclick="SelectProperty();"onkeypress="return isNumberKey(event)">
                                                </c:otherwise>        
                                            </c:choose>  
                                              <label class="control-label">Service Charges in ( % ) <span style="color: red">*</span></label>
                                                 </div>
                                                 
                                                     <div class="col-md-4 form-floating mb-3">
                                                        
                                                    <c:choose>
                                                <c:when test="${fn:length(unitContractTemplateList) > 0}">
                                                    <c:forEach items="${unitContractTemplateList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                    <select id="assetType6" name="assetType6" required="" class="form-select validate[required]">
                                                            <option value="${list.paymentType}" selected="">${list.paymentType}</option>
                                                                <option value="PDC">PDC</option>
                                                                  <option value="Bank Transfer">Bank Transfer</option>
                                                                    <option value="Invoice">Invoice</option>
                                                        </select>                                                           
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="assetType6" value="${list.paymentType}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>  
                                                    <select id="assetType6" name="assetType6" required="" class="form-select validate[required]">
                                                            <option value="" disabled="" selected="">Select your option</option>
                                                                <option value="PDC">PDC</option>
                                                                  <option value="Bank Transfer">Bank Transfer</option>
                                                                    <option value="Invoice">Invoice</option>
                                                        </select> 
                                                </c:otherwise>       
                                            </c:choose>
                                                         <label class="control-label">Payment Type 
                                                    <a style="color:red;">*</a> </label>
                                                     </div>
                                                       <div class="col-md-4 form-floating mb-3">
                                              
                                              <c:choose>
                                                <c:when test="${fn:length(unitContractTemplateList) > 0}">
                                                    <c:forEach items="${unitContractTemplateList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control input-xlarge" placeholder="Fill" id="propertyName4" name="propertyName4" value="${list.vat}" type="text" onclick="SelectProperty();" onkeypress="return isNumberKey(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control input-xlarge" placeholder="Fill" id="propertyName4" name="propertyName4" value="${list.vat}" type="text" readonly="" onclick="SelectProperty();" onkeypress="return isNumberKey(event)">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                   <input class="form-control input-xlarge" placeholder="Fill" id="propertyName4" name="propertyName4" type="text" onclick="SelectProperty();" onkeypress="return isNumberKey(event)">
                                                </c:otherwise>        
                                            </c:choose>  
                                              <label class="control-label">VAT in ( % ) <span style="color: red">*</span></label>
                                                 </div>
                                                    
                                           <div class="col-md-4 form-floating mb-3">
                                               
                                                    <input class="form-check" id="propertyName5" name="propertyName5" type="checkbox" onclick="checkBoxSelect(event)">
                                               
                                              <label class="control-label">Is Fit-out period applicable? <span style="color: red">*</span></label>
                                           </div>
                                                    
                                            <div class="col-md-4 form-floating mb-3" id="fillOutPeriodContainer">
                                               
                                                
                                               <c:choose>
                                                <c:when test="${fn:length(unitContractTemplateList) > 0}">
                                                    <c:forEach items="${unitContractTemplateList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                    <select class="form-select" name="fillOutPeriod" id="fillOutPeriod">
                                                        <option value="${list.fitOutPeriod}" selected="">${list.fitOutPeriod}</option>
                                                    <option>1 month</option>
                                                    <option>2 months</option>
                                                    <option>3 months</option>
                                                    <option>4 months</option>
                                                </select>                                                          
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="assetType6" value="${list.fitOutPeriod}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>  
                                                    <select class="form-select" name="fillOutPeriod" id="fillOutPeriod">
                                                        <option value="" disabled="" selected="">Select your option</option>
                                                    <option>1 month</option>
                                                    <option>2 months</option>
                                                    <option>3 months</option>
                                                    <option>4 months</option>
                                                </select>
                                                </c:otherwise>       
                                            </c:choose>
                                              <label class="control-label">Fit-out period <span style="color: red">*</span></label>
                                           </div>        
                                                    
                                                    <c:if test="${action ne 'view'}">
                                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
            
                                                            <button type="submit" class="btn btn-primary" style="">Save</button>
                                                            <a href="../insurance/unitContractTemplateList.htm" class="btn btn-danger">Cancel</a>
            
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
                            $("#fillOutPeriodContainer").hide();
                            
                            function checkBoxSelect(event){
                                        if(event.target.checked){
                                            $("#fillOutPeriodContainer").show();
                                        } else {
                                            $("#fillOutPeriodContainer").hide();
                                        }
                                    }

                        </script>
                    </body>

                    </html>