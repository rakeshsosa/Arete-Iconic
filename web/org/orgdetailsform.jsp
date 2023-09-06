
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
                       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css" integrity="sha256-FAOaXTpl90/K8cXmSdsskbQN3nKYulhCpPbcFzGTWKI=" crossorigin="anonymous" />
                       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css" integrity="sha512-gxWow8Mo6q6pLa1XH/CcH8JyiSDEtiwJV78E+D+QP0EVasFs8wKXq16G8CLD4CJ2SnonHr4Lm/yY2fSI2+cbmw==" crossorigin="anonymous" />
                    </head>


                    <body class="nav-md">
                        <jsp:include page="../login/menu.htm" />
                        <jsp:include page="../login/footer.jsp" />


                        <main id="main" class="main">
                            <div class="mt-3">
                                <jsp:include
                                    page="../login/headerlink.htm?submodule=Organisation&tab=Organisation Details&pagetype=form" />
                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h5>Organisation Details</h5>
                                                </div>
                                                <form id="userform" class="row" action="../login/orgsubmit.htm">

                                                    <c:choose>
                                                        <c:when test="${fn:length(orglist) > 0}">
                                                            <c:forEach items="${orglist}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <script type="text/javascript">
                                                                            $(document).ready(function () {
            
            
                                                                                var nFields = document.getElementsByClassName('x_panel')[0].getElementsByTagName('input');
                                                                                for (i = 0; i < nFields.length; i++)
                                                                                {
                                                                                    debugger;
                                                                                    if (!(nFields[i].readOnly)) {
                                                                                        //console.log("ss" +readOnlyAttr);
                                                                                        //$(nFields[i]).css("border-color", "red");
                                                                                        $(nFields[i]).focus(function () {
                                                                                            debugger;
                                                                                            //alert('hi');
                                                                                            $(this).css("border-color", "red");
                                                                                            //$(this).attr("style", "border-color red !important");
                                                                                        });
                                                                                    }
                                                                                }
                                                                                var textFields = document.getElementsByTagName('textarea')
                                                                                for (i = 0; i < textFields.length; i++)
                                                                                {
                                                                                    debugger;
                                                                                    if (!(textFields[i].readOnly)) {
                                                                                        //console.log("ss" +readOnlyAttr);
                                                                                        //$(textFields[i]).css("border-color", "red");
                                                                                        $(textFields[i]).focus(function () {
                                                                                            debugger;
                                                                                            //alert('hi');
                                                                                            $(this).css("border-color", "red");
                                                                                            //$(this).attr("style", "border-color red !important");
                                                                                        });
                                                                                    }
                                                                                }
            
            
            
                                                                            });
                                                                        </script>
                                                                    </c:when>
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                    </c:choose>
            
                                                    <%--<div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                        <label class="control-label">*SubGroup Name</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(orglist) > 0}">
                                                                <c:forEach items="${orglist}" var="list">
                                                                    <c:forEach items="${subgrouplist}" var="list1">
                                                                                    <c:if test="${list1.suborgCode eq list.suborgCode}">
                                                                                        <c:set var="sgname" value="${list1.suborgName}"/>
                                                                                        <c:set var="sgcode" value="${list1.suborgCode}"/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control"  readonly="" value="${sgname}">
                                                                            <input type="hidden" name="subgorgCode" value="${list.suborgCode}">
                                                                            <input type="hidden" name="pk" value="${list.sno}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" value="${sgname}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <select class="form-control" required="" name="subgorgCode">
                                                            <option></option>
                                                            <c:forEach items="${subgrouplist}" var="list">
                                                                <option value="${list.suborgCode}">${list.suborgName}</option>
                                                            </c:forEach>
                                                        </select>
                                                            </c:otherwise>        
                                                        </c:choose>
                                                        
                                                    </div>--%>
            
            
            
                                                    <div class="col-md-4 form-floating mb-3">
                                                      
                                                        <c:choose>
                                                            <c:when test="${fn:length(orglist) > 0}">
                                                                <c:forEach items="${orglist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" required="" id="orgcode" name="orgcode" value="${list.orgCode}">
                                                                            <input type="hidden" name="pk" value="${list.sno}">
                                                                        </c:when>
                                                                        <c:otherwise>
            
                                                                            <input type="text" class="form-control" readonly="" value="${list.orgCode}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="fill" class="form-control" required="" id="orgcode" name="orgcode">
                                                            </c:otherwise>        
                                                        </c:choose>
              <label class="control-label"><a style="color:red;">*</a>Organisation Code</label>
                                                    </div>
            
                                                    <div class="col-md-4 form-floating mb-3">
                                                    
                                                        <c:choose>
                                                            <c:when test="${fn:length(orglist) > 0}">
                                                                <c:forEach items="${orglist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" id="orgname" class="form-control" required="" name="orgname" value="${list.orgName}">
                                                                        </c:when>
                                                                        <c:otherwise>
            
                                                                            <input type="text" class="form-control" readonly="" value="${list.orgName}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="fill" class="form-control" required="" id="orgname" name="orgname">
                                                            </c:otherwise>        
                                                        </c:choose>
                <label class="control-label"><a style="color:red;">*</a>Organisation Name</label>
                                                    </div>         
            
                                                    <div class="col-md-4 form-floating mb-3">
                                                      
                                                        <c:choose>
                                                            <c:when test="${fn:length(orglist) > 0}">
                                                                <c:forEach items="${orglist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" id="orgCrNo" class="form-control" required="" name="orgCrNo" value="${list.orgCrNo}" onkeypress="return isNumberKey(event)">
                                                                            <input type="hidden" name="pk" value="${list.sno}">
                                                                        </c:when>
                                                                        <c:otherwise>
            
                                                                            <input type="text" class="form-control" readonly="" value="${list.orgCrNo}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="fill" class="form-control" required="" name="orgCrNo" id="orgCrNo" onkeypress="return isNumberKey(event)">
                                                            </c:otherwise>        
                                                        </c:choose>
              <label class="control-label"><a style="color:red;">*</a>Organisation Registration Number</label>
                                                    </div>
                                               
                                                    <div class="col-md-4 form-floating mb-3">
                                                       
                                                        <c:choose>
                                                            <c:when test="${fn:length(orglist) > 0}">
                                                                <c:forEach items="${orglist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input class="form-control" name="orgregDate" id="orgregDate" readonly type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.orgregDate}"/>" onclick="NewCssCal('orgregDate', 'ddMMMyyyy', '', '', '', '', '');" > 
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input class="form-control" readonly type="text"  value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.orgregDate}"/>">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" id="orgregDate" name="orgregDate" placeholder="Select Date" readonly="" type="text" onclick="NewCssCal('orgregDate', 'ddMMMyyyy', '', '', '', '', '');" >                                                    
                                                            </c:otherwise>        
                                                        </c:choose>
             <label class="control-label"><a style="color:red;">*</a>Organisation Registration Date</label>
                                                    </div>                                        
            
                                                    <div class="col-md-4 form-floating mb-3">
                                                       
                                                        <c:choose>
                                                            <c:when test="${fn:length(orglist) > 0}">
                                                                <c:forEach items="${orglist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" id="orgType" class="form-control" required="" name="orgType" value="${list.orgType}">
                                                                        </c:when>
                                                                        <c:otherwise>
            
                                                                            <input type="text" class="form-control" readonly="" value="${list.orgType}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="fill" class="form-control" required="" id="orgType" name="orgType">
                                                            </c:otherwise>        
                                                        </c:choose>
             <label class="control-label"><a style="color:red;">*</a>Organisation Type</label>
                                                    </div>
            
                                                    <div class="col-md-4 form-floating mb-3">
                                                     
                                                        <c:choose>
                                                            <c:when test="${fn:length(orglist) > 0}">
                                                                <c:forEach items="${orglist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <textarea name="orgAddress" id="orgAddress" class="form-control"  rows="1" style="resize: none">${list.orgAddress}</textarea>
                                                                            <input id="orgAddress1" class="form-control"  rows="1" maxlength="300" type="hidden" value="${list.orgAddress}">
            
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <textarea readonly="" class="form-control"  rows="1" style="resize: none">${list.orgAddress}</textarea>
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea name="orgAddress" class="form-control"  rows="1" style="resize: none"></textarea>
                                                            </c:otherwise>        
                                                        </c:choose>
                                                                   <label class="control-label col-md-3 col-sm-3"><a style="color:red;"></a>Address</label>
                                                    </div>
                                                 
                                                    <div class="col-md-4 form-floating mb-3">
                                                      
                                                        <c:choose>
                                                            <c:when test="${fn:length(orglist) > 0}">
                                                                <c:forEach items="${orglist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" id="city" class="form-control" required="" name="city" value="${list.city}">
                                                                            <input type="hidden" id="city1" class="form-control" required="" name="city1" value="${list.city}" >
                                                                        </c:when>
                                                                        <c:otherwise>
            
                                                                            <input type="text" class="form-control" readonly="" value="${list.city}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="fill" class="form-control" required="" id="city" name="city">
                                                            </c:otherwise>        
                                                        </c:choose>
              <label class="control-label"><a style="color:red;"></a>City</label>
                                                    </div>
            
                                                    <div class="col-md-4 form-floating mb-3">
                                                      
                                                        <c:choose>
                                                            <c:when test="${fn:length(orglist) > 0}">
                                                                <c:forEach items="${orglist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" id="state" class="form-control" required="" name="state" value="${list.state}">
                                                                            <input type="hidden" id="state1" class="form-control" required="" name="state1" value="${list.state}">
                                                                        </c:when>
                                                                        <c:otherwise>
            
                                                                            <input type="text" class="form-control" readonly="" value="${list.state}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="fill" class="form-control" required="" id="state" name="state">
                                                            </c:otherwise>        
                                                        </c:choose>
              <label class="control-label"><a style="color:red;"></a>State</label>
                                                    </div>
                                                    <div class="col-md-4 form-floating mb-3">
                                                      
                                                        <c:choose>
                                                            <c:when test="${fn:length(orglist) > 0}">
                                                                <c:forEach items="${orglist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" id="pinCode" class="form-control" required="" name="pinCode" value="${list.pinCode}" maxlength="6" onkeypress="return isNumberKey(event)">
                                                                            <input type="hidden" id="pinCode1" class="form-control" required="" name="pinCode1" value="${list.pinCode}" maxlength="6" >
                                                                        </c:when>
                                                                        <c:otherwise>
            
                                                                            <input type="text" class="form-control" readonly="" value="${list.pinCode}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="fill" class="form-control" required="" id="pinCode" name="pinCode" maxlength="6" onkeypress="return isNumberKey(event)">
                                                            </c:otherwise>        
                                                        </c:choose>
              <label class="control-label"><a style="color:red;"></a>Pin code</label>
                                                    </div>
                                                
                                                    <div class="col-md-4 form-floating mb-3">
                                                      
                                                        <c:choose>
                                                            <c:when test="${fn:length(orglist) > 0}">
                                                                <c:forEach items="${orglist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" id="country" class="form-control" required="" name="country" value="${list.country}">
                                                                            <input type="hidden" id="country1" class="form-control" required="" name="country1" value="${list.country}" >
                                                                        </c:when>
                                                                        <c:otherwise>
            
                                                                            <input type="text" class="form-control" readonly="" value="${list.country}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="fill" class="form-control" required="" id="country" name="country">
                                                            </c:otherwise>        
                                                        </c:choose>
              <label class="control-label"><a style="color:red;"></a>Country</label>
                                                    </div>
            
                                                    <div class="col-md-4 form-floating mb-3">
                                                           <div><span style="color:red">*</span>Contact Number</div> 
                                                      
                                                        <c:choose>
                                                            <c:when test="${fn:length(orglist) > 0}">
                                                                <c:forEach items="${orglist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="tel" id="phoneNumber" class="form-control" required="" name="phoneNumber" value="${list.phoneNumber}"  onkeypress="return isNumber(event)">
                                                                            <input type="hidden" id="phoneNumber1" class="form-control" required="" name="phoneNumber1" value="${list.phoneNumber}">
                                                                        </c:when>
                                                                        <c:otherwise>
            
                                                                            <input type="text" class="form-control" readonly="" value="${list.phoneNumber}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="tel" class="form-control" required="" id="phoneNumber" name="phoneNumber" onkeypress="return isNumber(event)">
                                                            </c:otherwise>        
                                                        </c:choose>
<!--              <label class="control-label"><a style="color:red;">*</a>Contact Number</label>-->
                                                    </div>
                                                    <div class="col-md-4 form-floating mb-3">
                                                     
                                                        <c:choose>
                                                            <c:when test="${fn:length(orglist) > 0}">
                                                                <c:forEach items="${orglist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" id="fax" class="form-control" required="" name="fax" value="${list.fax}" maxlength="11" onkeypress="return isNumber(event)">
                                                                            <input type="hidden" id="fax1" class="form-control" required="" name="fax1" value="${list.fax}" maxlength="11" >
                                                                        </c:when>
                                                                        <c:otherwise>
            
                                                                            <input type="text" class="form-control" readonly="" value="${list.fax}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="fill" class="form-control" required="" id="fax" name="fax" maxlength="11" >
                                                            </c:otherwise>        
                                                        </c:choose>
               <label class="control-label"><a style="color:red;">*</a>Fax</label>
                                                    </div>
                                                 
                                                    <div class="col-md-4 form-floating mb-3">
                                                     
                                                        <c:choose>
                                                            <c:when test="${fn:length(orglist) > 0}">
                                                                <c:forEach items="${orglist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" id="orgEmail" class="form-control" required="" name="orgEmail" value="${list.orgEmail}" onchange="return validateEmail(event);">
                                                                            <input type="hidden" id="orgEmail1" class="form-control" required="" name="orgEmail1" value="${list.orgEmail}" >
                                                                        </c:when>
                                                                        <c:otherwise>
            
                                                                            <input type="text" class="form-control" readonly="" value="${list.orgEmail}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="fill" class="form-control" required="" id="orgEmail" name="orgEmail" onchange="return validateEmail(event);">
                                                            </c:otherwise>        
                                                        </c:choose>
               <label class="control-label"><a style="color:red;">*</a>Email</label>
                                                    </div>
            
                                                    <div class="col-md-4 form-floating mb-3">
                                                      
                                                        <c:choose>
                                                            <c:when test="${fn:length(orglist) > 0}">
                                                                <c:forEach items="${orglist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" id="webSite" class="form-control" required="" name="webSite" value="${list.webSite}">
                                                                            <input type="hidden" id="webSite1" class="form-control" required="" name="webSite1" value="${list.webSite}">
                                                                        </c:when>
                                                                        <c:otherwise>
            
                                                                            <input type="text" class="form-control" readonly="" value="${list.webSite}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="fill" class="form-control" required="" id="webSite" name="webSite">
                                                            </c:otherwise>        
                                                        </c:choose>
              <label class="control-label"><a style="color:red;">*</a>Web site</label>
                                                    </div>
                                                    <div class="col-md-4 form-floating mb-3">
                                                    
                                                        <c:choose>
                                                            <c:when test="${fn:length(orglist) > 0}">
                                                                <c:forEach items="${orglist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" id="bankName" class="form-control" required="" name="bankName" value="${list.bankName}">
                                                                            <input type="hidden" id="bankName1" class="form-control" required="" name="bankName1" value="${list.bankName}" >
                                                                        </c:when>
                                                                        <c:otherwise>
            
                                                                            <input type="text" class="form-control" readonly="" value="${list.bankName}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="fill" class="form-control" required="" id="bankName" name="bankName">
                                                            </c:otherwise>        
                                                        </c:choose>
                <label class="control-label"><a style="color:red;">*</a>Bank Name</label>
                                                    </div>                                         
                                                    
                                                    <div class="col-md-4 form-floating mb-3">
                                                      
                                                        <c:choose>
                                                            <c:when test="${fn:length(orglist) > 0}">
                                                                <c:forEach items="${orglist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" id="accountNumber" class="form-control" required="" name="accountNumber" value="${list.accountNumber}" onkeypress="return isNumberKey(event)">
                                                                            <input type="hidden" id="accountNumber1" class="form-control" required="" name="accountNumber1" value="${list.accountNumber}" >
                                                                        </c:when>
                                                                        <c:otherwise>
            
                                                                            <input type="text" class="form-control" readonly="" value="${list.accountNumber}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="fill" class="form-control" required="" id="accountNumber" name="accountNumber" onkeypress="return isNumberKey(event)">
                                                            </c:otherwise>        
                                                        </c:choose>
              <label class="control-label"><a style="color:red;">*</a>Account Number</label>
                                                    </div>
                                                    <div class="col-md-4 form-floating mb-3">
                                                       
                                                        <c:choose>
                                                            <c:when test="${fn:length(orglist) > 0}">
                                                                <c:forEach items="${orglist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" id="ifscCode" class="form-control" required="" name="ifscCode" value="${list.ifscCode}" onchange="return ValidateIfscCode(event);" maxlength="11">
                                                                            <input type="hidden" id="ifscCode1" class="form-control" required="" name="ifscCode1" value="${list.ifscCode}" maxlength="11">
                                                                        </c:when>
                                                                        <c:otherwise>
            
                                                                            <input type="text" class="form-control" readonly="" value="${list.ifscCode}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="fill" class="form-control" required="" id="ifscCode" name="ifscCode" onchange="return ValidateIfscCode(event);" maxlength="11">
                                                            </c:otherwise>        
                                                        </c:choose>
             <label class="control-label"><a style="color:red;">*</a>IFSC Code</label>
                                                    </div>
                                                    <div class="col-md-4 form-floating mb-3">
                                                      
                                                        <c:choose>
                                                            <c:when test="${fn:length(orglist) > 0}">
                                                                <c:forEach items="${orglist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" id="branchName" class="form-control" required="" name="branchName" value="${list.branchName}">
                                                                            <input type="hidden" id="branchName1" class="form-control" required="" name="branchName1" value="${list.branchName}" >
                                                                        </c:when>
                                                                        <c:otherwise>
            
                                                                            <input type="text" class="form-control" readonly="" value="${list.branchName}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="fill" class="form-control" required="" id="branchName" name="branchName">
                                                            </c:otherwise>        
                                                        </c:choose>
              <label class="control-label"><a style="color:red;">*</a>Branch Name</label>
                                                    </div>
                                                  
                                                    <div class="col-md-4 form-floating mb-3">
                                                    
                                                        <c:choose>
                                                            <c:when test="${fn:length(orglist) > 0}">
                                                                <c:forEach items="${orglist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <textarea name="address" id="address" class="form-control"  rows="1" style="resize: none">${list.address}</textarea>
                                                                            <input id="address1" class="form-control"  rows="1" maxlength="300" type="hidden" value="${list.address}">
            
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <textarea readonly="" class="form-control"  rows="1" style="resize: none">${list.address}</textarea>
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea name="address" class="form-control"  rows="1" style="resize: none"></textarea>
                                                            </c:otherwise>        
                                                        </c:choose>
                                                       <label class="control-label col-md-3 col-sm-3">Address</label>
                                                    </div>
                                                    <div class="col-md-4 form-floating mb-3">
                                                        <div><span style="color:red">*</span>Bank Contact Number</div> 
                                                        <c:choose>
                                                            <c:when test="${fn:length(orglist) > 0}">
                                                                <c:forEach items="${orglist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="tel" id="contactNumber" class="form-control" required="" name="contactNumber" value="${list.contactNumber}"  onkeypress="return isNumber(event)">
                                                                            <input type="hidden" id="contactNumber1" class="form-control" required="" name="contactNumber1" value="${list.contactNumber}"  >
                                                                        </c:when>
                                                                        <c:otherwise>
            
                                                                            <input type="text" class="form-control" readonly="" value="${list.contactNumber}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="tel"  class="form-control" required="" id="contactNumber" name="contactNumber" onkeypress="return isNumber(event)">
                                                            </c:otherwise>        
                                                        </c:choose>
            
                                                    </div>
                                                    <div class="col-md-4 form-floating mb-3">
                                                      
                                                        <c:choose>
                                                            <c:when test="${fn:length(orglist) > 0}">
                                                                <c:forEach items="${orglist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" id="emailId" class="form-control" required="" name="emailId" value="${list.emailId}" onblur="return validateEmail(event);">
                                                                            <input type="hidden" id="emailId1" class="form-control" required="" name="emailId1" value="${list.emailId}">
                                                                        </c:when>
                                                                        <c:otherwise>
            
                                                                            <input type="text" class="form-control" readonly="" value="${list.emailId}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="fill" class="form-control" required="" id="emailId" name="emailId" onblur="return validateEmail(event);">
                                                            </c:otherwise>        
                                                        </c:choose>
              <label class="control-label"><a style="color:red;">*</a>Email ID</label>
                                                    </div>
                                                
                                                    
            
                                                    <c:if test="${action ne 'view'  }">
            
                                                      <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
                                                            <button type="button" class="btn btn-primary" style="" onclick="return test();">Save</button>
                                                            <a href="../login/orglist.htm" class="btn btn-danger">Cancel</a>
                                                        </div>
            
                                                    </c:if>
                                                    <c:if test="${action eq 'view'  }">
            
                                                      <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
                                                            <a href="../login/orglist.htm" class="btn btn-danger">Cancel</a>
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

                            ///to select datapicker
                            function selectdate(val) {
                
                                NewCssCal(val, 'ddMMMyyyy', 'dropdown', true, '12', '', 'future');
                                //$('#test').attr();
                                //document.getElementById("hiddentr").value=$itemRow.index();
                
                            }
                           
                
                        
                
                        function ValidateIfscCode() {
                
                                var ifsc = document.getElementById('ifscCode').value;
                                var ifscformat = /^([A-Z]){4}([0]){1}([A-Z0-9]){6}?$/;
                                if (!ifsc.match(ifscformat))
                                {
                                    alert("You have entered an invalid IFSC Code.!");
                                    document.getElementById("ifscCode").value = '';
                                    return false;
                                }
                            }
                
                
                            function test12()
                            {
                                if (document.getElementById("orgcode").value == "")
                                {
                                    alert("Enter Org Code");
                                    return false;
                                }
                                else if (document.getElementById("orgname").value == "")
                                {
                                    alert("Enter Org Name");
                                    return false;
                                } else if (document.getElementById("orgCrNo").value == "")
                                {
                                    alert("Enter Org Registration Number");
                                    return false;
                                } else if (document.getElementById("orgregDate").value == "")
                                {
                                    alert("Enter Org Registration Date");
                                    return false;
                                } else if (document.getElementById("orgType").value == "")
                                {
                                    alert("Enter Org Type");
                                    return false;
                                } else if (document.getElementById("phoneNumber").value == "")
                                {
                                    alert("Enter Phone Number");
                                    return false;
                                } else if (document.getElementById("fax").value == "")
                                {
                                    alert("Enter Fax No");
                                    return false;
                                } else if (document.getElementById("orgEmail").value == "")
                                {
                                    alert("Enter Org Email Id");
                                    return false;
                                } else if (document.getElementById("webSite").value == "")
                                {
                                    alert("Enter Web Site");
                                    return false;
                                } else if (document.getElementById("bankName").value == "")
                                {
                                    alert("Enter Bank Name");
                                    return false;
                                } else if (document.getElementById("accountNumber").value == "")
                                {
                                    alert("Enter Account Number");
                                    return false;
                                } else if (document.getElementById("ifscCode").value == "")
                                {
                                    alert("Enter Ifsc Code");
                                    return false;
                                }
                                else if (document.getElementById("branchName").value == "")
                                {
                                    alert("Enter Branch Name");
                                    return false;
                                }
                                else if (document.getElementById("contactNumber").value == "")
                                {
                                    alert("Enter Bank Contact Number");
                                    return false;
                                }
                                else if (document.getElementById("emailId").value == "")
                                {
                                    alert("Enter Bank Email Id");
                                    return false;
                                }
                                else {
                
                                    document.forms["userform"].submit();
                                }
                
                            }
                
                            function test()
                            {
                                var orgaddr = document.getElementById("orgAddress").value;
                                var orgaddr1 = document.getElementById("orgAddress1").value;
                                var city = document.getElementById("city").value;
                                var city1 = document.getElementById("city1").value;
                                var state = document.getElementById("state").value;
                                var state1 = document.getElementById("state1").value;
                                var pcode = document.getElementById("pinCode").value;
                                var pcode1 = document.getElementById("pinCode1").value;
                                var country = document.getElementById("country").value;
                                var country1 = document.getElementById("country1").value;
                                var pno = document.getElementById("phoneNumber").value;
                                var pno1 = document.getElementById("phoneNumber1").value;
                                var fax = document.getElementById("fax").value;
                                var fax1 = document.getElementById("fax1").value;
                                var orgmail = document.getElementById("orgEmail").value;
                                var orgmail1 = document.getElementById("orgEmail1").value;
                                var website = document.getElementById("webSite").value;
                                var website1 = document.getElementById("webSite1").value;
                                var bname = document.getElementById("bankName").value;
                                var bname1 = document.getElementById("bankName1").value;
                                var acno = document.getElementById("accountNumber").value;
                                var acno1 = document.getElementById("accountNumber1").value;
                                var ifsc = document.getElementById("ifscCode").value;
                                var ifsc1 = document.getElementById("ifscCode1").value;
                                var branchname = document.getElementById("branchName").value;
                                var branchname1 = document.getElementById("branchName1").value;
                                var addr = document.getElementById("address").value;
                                var addr1 = document.getElementById("address1").value;
                                var cno = document.getElementById("contactNumber").value;
                                var cno1 = document.getElementById("contactNumber1").value;
                                var email = document.getElementById("emailId").value;
                                var email1 = document.getElementById("emailId1").value;
                
                                if (document.getElementById("orgcode").value == "")
                                {
                                    alert("Enter Org Code");
                                    return false;
                                }
                                else if (document.getElementById("orgname").value == "")
                                {
                                    alert("Enter Org Name");
                                    return false;
                                } else if (document.getElementById("orgCrNo").value == "")
                                {
                                    alert("Enter Org Registration Number");
                                    return false;
                                } else if (document.getElementById("orgregDate").value == "")
                                {
                                    alert("Enter Org Registration Date");
                                    return false;
                                } else if (document.getElementById("orgType").value == "")
                                {
                                    alert("Enter Org Type");
                                    return false;
                                } else if (document.getElementById("phoneNumber").value == "")
                                {
                                    alert("Enter Phone Number");
                                    return false;
                                } else if (document.getElementById("fax").value == "")
                                {
                                    alert("Enter Fax No");
                                    return false;
                                } else if (document.getElementById("orgEmail").value == "")
                                {
                                    alert("Enter Org Email Id");
                                    return false;
                                } else if (document.getElementById("webSite").value == "")
                                {
                                    alert("Enter Web Site");
                                    return false;
                                } else if (document.getElementById("bankName").value == "")
                                {
                                    alert("Enter Bank Name");
                                    return false;
                                } else if (document.getElementById("accountNumber").value == "")
                                {
                                    alert("Enter Account Number");
                                    return false;
                                } else if (document.getElementById("ifscCode").value == "")
                                {
                                    alert("Enter Ifsc Code");
                                    return false;
                                }
                                else if (document.getElementById("branchName").value == "")
                                {
                                    alert("Enter Branch Name");
                                    return false;
                                }
                                else if (document.getElementById("contactNumber").value == "")
                                {
                                    alert("Enter Bank Contact Number");
                                    return false;
                                }
                                else if (document.getElementById("emailId").value == "")
                                {
                                    alert("Enter Bank Email Id");
                                    return false;
                                }
                                else {
                
                                    if (orgaddr !== orgaddr1 || city !== city1 || state !== state1 || pcode !== pcode1 || country !== country1 || pno !== pno1
                                            || fax !== fax1 || orgmail !== orgmail1 || website !== website1 || bname !== bname1 || acno !== acno1 || ifsc !== ifsc1
                                            || branchname !== branchname1 || addr !== addr1 || cno !== cno1 || email !== email1) {
                                        if (confirm('Do you really want to Save this updated record')) {
                                            document.forms["userform"].submit();
                                            return true;
                                        } else {
                                            return true;
                                        }
                
                                    } else {
                                        document.forms["userform"].submit();
                                    }
                                }
                
                            }
                
                
                //            function test()
                //            {
                //
                //                if (document.getElementById("orgcode").value == "")
                //                {
                //                    alert("Enter Org Code");
                //                    return false;
                //                }
                //                else if (document.getElementById("orgname").value == "")
                //                {
                //                    alert("Enter Org Name");
                //                    return false;
                //                } else if (document.getElementById("orgCrNo").value == "")
                //                {
                //                    alert("Enter Org Registration Number");
                //                    return false;
                //                } else if (document.getElementById("orgregDate").value == "")
                //                {
                //                    alert("Enter Org Registration Date");
                //                    return false;
                //                } else if (document.getElementById("orgType").value == "")
                //                {
                //                    alert("Enter Org Type");
                //                    return false;
                //                } else if (document.getElementById("phoneNumber").value == "")
                //                {
                //                    alert("Enter Phone Number");
                //                    return false;
                //                } else if (document.getElementById("fax").value == "")
                //                {
                //                    alert("Enter Fax No");
                //                    return false;
                //                } else if (document.getElementById("orgEmail").value == "")
                //                {
                //                    alert("Enter Org Email Id");
                //                    return false;
                //                } else if (document.getElementById("webSite").value == "")
                //                {
                //                    alert("Enter Web Site");
                //                    return false;
                //                } else if (document.getElementById("bankName").value == "")
                //                {
                //                    alert("Enter Bank Name");
                //                    return false;
                //                } else if (document.getElementById("accountNumber").value == "")
                //                {
                //                    alert("Enter Account Number");
                //                    return false;
                //                } else if (document.getElementById("ifscCode").value == "")
                //                {
                //                    alert("Enter Ifsc Code");
                //                    return false;
                //                }
                //                else if (document.getElementById("branchName").value == "")
                //                {
                //                    alert("Enter Branch Name");
                //                    return false;
                //                }
                //                else if (document.getElementById("contactNumber").value == "")
                //                {
                //                    alert("Enter Bank Contact Number");
                //                    return false;
                //                }
                //                else if (document.getElementById("emailId").value == "")
                //                {
                //                    alert("Enter Bank Email Id");
                //                    return false;
                //                }
                //                else {
                //                    if (confirm('Do you really want to Save this updated record')) {
                //                        document.forms["userform"].submit();
                //                        return true;
                //                    } else {
                //                        return false;
                //                    }
                //                }
                //
                //            }
                            NProgress.done();
                        </script>
                        <script>
    $(function (){
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
    <script>
    $(function (){
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
</script>
                         <script src="../common/theme/js/custom.js"></script>
                           <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js" integrity="sha512-DNeDhsl+FWnx5B1EQzsayHMyP6Xl/Mg+vcnFPXGNjUZrW28hQaa1+A4qL9M+AiOMmkAhKAWYHh1a+t6qxthzUw==" crossorigin="anonymous"></script>

                    </body>

                    </html>