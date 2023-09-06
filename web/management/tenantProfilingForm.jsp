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
                <jsp:include page="../login/headerlink.htm?submodule=Tenant Profiling&tab=Tenant Profiling&pagetype=form"/>
            </div>
            <div class="pagetitle">

            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h5> Tenant Profiling</h5>
                                </div>
                                <form class="form-inline row" action="../management/tenantProfilingFormSubmit.htm">
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                        <c:choose>
                                            <c:when test="${fn:length(tenantProfilingList) > 0}">
                                                <c:forEach items="${tenantProfilingList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" class="form-control" id="jointeeName1" name="jointeeName1" value="${list.propertyName}" onclick="return selectPropertyDetails();" autocomplete="off">
                                                            <input type="hidden" class="form-control"  id="pk" name="pk" value="${list.sno}" onkeypress="return isNumberKey4(event)" autocomplete="off">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" class="form-control" readonly="" id="jointeeName1" value="${list.propertyName}">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>                                                    
                                                <input type="text" placeholder="Fill" class="form-control" id="jointeeName1" name="jointeeName1" value="" onclick="return selectPropertyDetails();">
                                            </c:otherwise>        
                                        </c:choose>
                                        <label class="control-label">  <a class="text-danger">*</a> Property Name</label>
                                    </div>



                                    <div class="col-md-4 form-floating mb-3">

                                        <c:choose>
                                            <c:when test="${fn:length(tenantProfilingList) > 0}">
                                                <c:forEach items="${tenantProfilingList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" placeholder="Org Name" id="servicename" class="form-control"  name="servicename" maxlength="98" value="${list.unitNumber}"  required onkeypress="return isNumberKey(event)">

                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" placeholder="Org Name" readonly="" id="servicename" class="form-control"  name="servicename" maxlength="98" value="${list.unitNumber}" required onkeypress="return isNumberKey(event)">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>                                                    
                                                <input type="text" placeholder="Org Name" id="servicename" class="form-control"  name="servicename" maxlength="98" required onkeypress="return isNumberKey(event)">
                                            </c:otherwise>        
                                        </c:choose>
                                        <label for="groupname"><span style="color:red">*</span> Unit Number </label>
                                    </div>
                                    <div class="col-md-4 form-floating mb-3">

                                        <c:choose>
                                            <c:when test="${fn:length(tenantProfilingList) > 0}">
                                                <c:forEach items="${tenantProfilingList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" placeholder="Org Name" id="serviceper" class="form-control"  name="serviceper" maxlength="98" value="${list.customerName}" required onkeypress="firstToUpperCase1(event);">

                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" placeholder="Org Name" readonly="" id="serviceper" class="form-control"  name="serviceper" maxlength="98" value="${list.customerName}" required onkeypress="firstToUpperCase1(event);">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>                                                    
                                                <input type="text" placeholder="Org Name" id="serviceper" class="form-control"  name="serviceper" maxlength="98" required onkeypress="firstToUpperCase1(event);">
                                            </c:otherwise>        
                                        </c:choose>
                                        <label for="groupname"><span style="color:red">*</span> Customer Name</label>
                                    </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3 pick5">     
                                        <c:choose>
                                            <c:when test="${fn:length(tenantProfilingList) > 0}">
                                                <c:forEach items="${tenantProfilingList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" class="form-control datepicker" id="jointeeName2" name="jointeeName2" value="<fmt:formatDate pattern="dd-MM-yyyy" value="${list.contractStartDate}"/>" autocomplete="off">

                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" class="form-control datepicker" readonly="" id="jointeeName2" value="<fmt:formatDate pattern="dd-MM-yyyy" value="${list.contractStartDate}"/>">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>                                                    
                                                <input type="text" placeholder="Fill" class="form-control datepicker capitalize validate[required]" id="jointeeName2" name="jointeeName2" value="">
                                            </c:otherwise>        
                                        </c:choose>
                                        <label class="control-label"> <a class="text-danger">*</a> Contract Start Date</label>
                                    </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3 pick6">     
                                        <c:choose>
                                            <c:when test="${fn:length(tenantProfilingList) > 0}">
                                                <c:forEach items="${tenantProfilingList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" class="form-control datepicker" id="jointeeName3" name="jointeeName3" value="<fmt:formatDate pattern="dd-MM-yyyy" value="${list.contractEndDate}"/>" autocomplete="off">

                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" class="form-control datepicker" readonly="" id="jointeeName3" value="<fmt:formatDate pattern="dd-MM-yyyy" value="${list.contractEndDate}"/>">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>                                                    
                                                <input type="text" placeholder="Fill" class="form-control datepicker capitalize validate[required]" id="jointeeName3" name="jointeeName3" value="">
                                            </c:otherwise>        
                                        </c:choose>
                                        <label class="control-label"> <a class="text-danger">*</a> Contract End Date</label>
                                    </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                        <c:choose>
                                            <c:when test="${fn:length(tenantProfilingList) > 0}">
                                                <c:forEach items="${tenantProfilingList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" class="form-control" id="jointeeName4" name="jointeeName4" value="${list.customerReference}" autocomplete="off">

                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" class="form-control" readonly="" id="jointeeName4" value="${list.customerReference}">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>                                                    
                                                <input type="text" placeholder="Fill" class="form-control" id="jointeeName4" name="jointeeName4" value="">
                                            </c:otherwise>        
                                        </c:choose>
                                        <label class="control-label"><a class="text-danger">*</a> Customer Reference</label>
                                    </div>
                                    <%--<div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                        <c:choose>
                                            <c:when test="${fn:length(tenantProfilingList) > 0}">
                                                <c:forEach items="${tenantProfilingList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" class="form-control" id="jointeeName5" name="jointeeName5" value="${list.tenantName}" autocomplete="off">

                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" class="form-control" readonly="" id="jointeeName5" value="${list.tenantName}">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>                                                    
                                                <input type="text" placeholder="Fill" class="form-control" id="jointeeName5" name="jointeeName5" value="">
                                            </c:otherwise>        
                                        </c:choose>
                                        <label class="control-label"> <a class="text-danger">*</a> Tenant Name </label>
</div> --%>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3 pick4">     
                                        <c:choose>
                                            <c:when test="${fn:length(tenantProfilingList) > 0}">
                                                <c:forEach items="${tenantProfilingList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" class="form-control datepicker" id="jointeeName6" name="jointeeName6" value="<fmt:formatDate pattern="dd-MM-yyyy" value="${list.billingDate}"/>" autocomplete="off">

                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" class="form-control datepicker" readonly="" id="jointeeName6"  value="<fmt:formatDate pattern="dd-MM-yyyy" value="${list.billingDate}"/>">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>                                                    
                                                <input type="text" placeholder="Fill" class="form-control datepicker capitalize validate[required]" id="jointeeName6" name="jointeeName6" value="">
                                            </c:otherwise>        
                                        </c:choose>
                                        <label class="control-label"> <a class="text-danger">*</a> Billing Date </label>
                                    </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3 pick7">     
                                        <c:choose>
                                            <c:when test="${fn:length(tenantProfilingList) > 0}">
                                                <c:forEach items="${tenantProfilingList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" class="form-control" id="jointeeName7" name="jointeeName7"  value="<fmt:formatDate pattern="dd-MM-yyyy" value="${list.renewalDate}"/>" autocomplete="off">

                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" class="form-control" readonly="" id="jointeeName7" value="<fmt:formatDate pattern="dd-MM-yyyy" value="${list.renewalDate}"/>">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>                                                    
                                                <input type="text" placeholder="Fill" class="form-control datepicker capitalize validate[required]" id="jointeeName7" name="jointeeName7" value="">
                                            </c:otherwise>        
                                        </c:choose>
                                        <label class="control-label">  <a class="text-danger">*</a> Renewal Date</label>
                                    </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                        <c:choose>
                                            <c:when test="${fn:length(tenantProfilingList) > 0}">
                                                <c:forEach items="${tenantProfilingList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" class="form-control" id="jointeeName8" name="jointeeName8" value="${list.vacateCode}" autocomplete="off">

                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" class="form-control" readonly="" id="jointeeName8" value="${list.vacateCode}">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>                                                    
                                                <input type="text" placeholder="Fill" class="form-control" id="jointeeName8" name="jointeeName8" value="">
                                            </c:otherwise>        
                                        </c:choose>
                                        <label class="control-label"><a class="text-danger">*</a> Vacate Code </label>
                                    </div>


                                    <div class="col-md-4 form-floating mb-3 pick2">

                                        <c:choose>
                                            <c:when test="${fn:length(tenantProfilingList) > 0}">
                                                <c:forEach items="${tenantProfilingList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text"  required  id="startDate" name="startDate"  class="form-control datepicker capitalize validate[required]"  placeholder="Fill"  value="<fmt:formatDate pattern="dd-MM-yyyy" value="${list.vacateNoticeDate}"/>" />

                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text"  required  id="startDate" name="startDate" readonly="" class="form-control datepicker capitalize validate[required]" placeholder="Fill" value="<fmt:formatDate pattern="dd-MM-yyyy" value="${list.vacateNoticeDate}"/>" /> 
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>                                                    
                                                <input type="text"  required  id="startDate" name="startDate"  class="form-control datepicker capitalize validate[required]" placeholder="Fill" value=""  />
                                            </c:otherwise>        
                                        </c:choose>
                                        <label class="control-label"><span style="color:red">*</span>Vacate Notice Date</label>          
                                    </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                        <c:choose>
                                            <c:when test="${fn:length(tenantProfilingList) > 0}">
                                                <c:forEach items="${tenantProfilingList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <select placeholder="Fill" class="form-select" id="jointeeName9" name="jointeeName9" >
                                                                <option value="${list.vacateReasonType}" selected>${list.vacateReasonType}</option>
                                                                <option value="Moving to another city">Moving to another city</option>
                                                                <option value="change of job location">change of job location</option>
                                                                <option value="Unable/failure to pay rent">Unable/failure to pay rent</option>
                                                                <option value=" Maintenance / other"> Maintenance / other</option>
                                                                <option value="Violations of contract">Violations of contract</option>
                                                                <option value="Others">Others</option>
                                                            </select>                                                            </c:when>
                                                        <c:otherwise>
                                                            <input type="text" class="form-control" readonly="" id="jointeeName9" value="${list.vacateReasonType}">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>                                                    
                                                <select placeholder="Fill" class="form-select" id="jointeeName9" name="jointeeName9" >
                                                    <option value="Moving to another city">Moving to another city</option>
                                                    <option value="change of job location">change of job location</option>
                                                    <option value="Unable/failure to pay rent">Unable/failure to pay rent</option>
                                                    <option value=" Maintenance / other"> Maintenance / other</option>
                                                    <option value="Violations of contract">Violations of contract</option>
                                                    <option value="Others">Others</option>
                                                </select>
                                            </c:otherwise>       
                                        </c:choose>
                                        <label class="control-label"> <a class="text-danger">*</a> Vacate Reason Type</label>
                                    </div>

                                    <div class="col-md-4 form-floating mb-3 pick3">

                                        <c:choose>
                                            <c:when test="${fn:length(tenantProfilingList) > 0}">
                                                <c:forEach items="${tenantProfilingList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" required id="endDate" name="endDate"  class="form-control datepicker validate[required]" placeholder="Fill" value="<fmt:formatDate pattern="dd-MM-yyyy" value="${list.tenatativeVacateDate}"/>" >

                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" required id="endDate" name="endDate" readonly="" class="form-control datepicker validate[required]" placeholder="Fill"  value="<fmt:formatDate pattern="dd-MM-yyyy" value="${list.tenatativeVacateDate}"/>" >
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>                                                    
                                                <input type="text" required id="endDate" name="endDate"  class="form-control datepicker validate[required]" placeholder="Fill">
                                            </c:otherwise>        
                                        </c:choose>
                                        <label class="control-label"><span style="color:red">*</span>Tentative Vacate Date</label>     
                                    </div>
                                    <c:if test="${action eq 'view'}">
                                    <div class="col-md-4 mb-3">
                                        <!--<label for="groupname"><span style="color:red">*</span> Add Vacate Notice/Letter/Other Communication</label>-->
                                        <c:forEach items="${tenantProfilingList}" var="list">
                                        <input type="text" placeholder="Org Name" id="serviceinterval" class="form-control"  name="serviceinterval" maxlength="98" readonly="" onkeypress="firstToUpperCase1(event);" value="${list.vacateLetterAttachment}">
                                        </c:forEach>

                                    </div>
                                    </c:if>
                                    <c:if test="${action ne 'view' && action ne 'edit'}">
                                        <div class="col-md-4 mb-3">
                                        <label for="groupname"><span style="color:red">*</span> Add Vacate Notice/Letter/Other Communication</label>
                                        <input type="file" placeholder="Org Name" id="serviceinterval" class="form-control"  name="serviceinterval" maxlength="98"  onkeypress="firstToUpperCase1(event);">

                                    </div>
                                    </c:if>
                                    <c:if test="${action eq 'edit'}">
                                        <div class="col-md-4 mb-3">
                                        <label for="groupname"><span style="color:red">*</span> Add Vacate Notice/Letter/Other Communication</label>
                                        <input type="file" placeholder="Org Name" id="serviceinterval" class="form-control"  name="serviceinterval" maxlength="98"  onkeypress="firstToUpperCase1(event);">

                                    </div>
                                    </c:if>
                                    <div class="col-lg-4 col-md-3 mb-2 mt-4">
                                        <label>
                                            <input maxlength="25" type="checkbox" style="font-size:13px;" value="No" name="RegisterCheck" id="RegisterCheck">
                                            <b>Do you want to Register a tenant?</b>
                                        </label>
                                    </div>




                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3" style="display:none;" id="Tenantnamediv">  

                                        <c:choose>
                                            <c:when test="${fn:length(tenantProfilingList) > 0}">
                                                <c:forEach items="${tenantProfilingList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" placeholder="Fill" class="form-control"  value="${list.tenantName}" id="Tenantname" name="Tenantname">

                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" placeholder="Fill" class="form-control" readonly="" value="${list.tenantName}" id="Tenantname" name="Tenantname">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>                                                    
                                                <input type="text" placeholder="Fill" class="form-control"  value="" id="Tenantname" name="Tenantname">
                                            </c:otherwise>        
                                        </c:choose>
                                        <label class="control-label">Tenant Name <a class="text-danger">*</a></label>
                                    </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3" style="display:none;" id="Tenantphonediv">  
 <div class="ContactNumber">Tenant Phone Number <a  style="color:red;">*</a></div>  
                                        <c:choose>
                                            <c:when test="${fn:length(tenantProfilingList) > 0}">
                                                <c:forEach items="${tenantProfilingList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="tel"  class="form-control" maxlength="15"   value="${list.tenantPhone}" id="Tenantphone" name="Tenantphone" onkeypress="return isNumberKey(event)">

                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="tel" maxlength="15"  class="form-control" readonly="" value="${list.tenantPhone}" id="Tenantphone" name="Tenantphone" onkeypress="return isNumberKey(event)">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>                                                    
                                                <input type="text"  class="form-control" maxlength="15"  value="" id="Tenantphone" name="Tenantphone" onkeypress="return isNumberKey(event)">
                                            </c:otherwise>        
                                        </c:choose>
                                       
                                    </div>

                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3" style="display:none;" id="Tenantemaildiv">  

                                        <c:choose>
                                            <c:when test="${fn:length(tenantProfilingList) > 0}">
                                                <c:forEach items="${tenantProfilingList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" placeholder="Fill" class="form-control"  value="${list.tenantEmail}" id="Tenantemail" name="Tenantemail" onblur="validateEmail(this);">

                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" placeholder="Fill" class="form-control" readonly="" value="${list.tenantEmail}" id="Tenantemail" name="Tenantemail" onblur="validateEmail(this);">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>                                                    
                                                <input type="text" placeholder="Fill" class="form-control"  value="" id="Tenantemail" name="Tenantemail" onblur="validateEmail(this);">
                                            </c:otherwise>        
                                        </c:choose>
                                        <label class="control-label">Tenant Email Id </label>
                                    </div>

                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3" style="display:none;" id="Tenantcarddiv" >  

                                        <c:choose>
                                            <c:when test="${fn:length(tenantProfilingList) > 0}">
                                                <c:forEach items="${tenantProfilingList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <select class="form-control" id="Tenantcard" name="Tenantcard">
                                                                    <option value="${list.tenantIdcardType}" selected>${list.tenantIdcardType}</option>
                                                                    <option value="Resident Card">Resident Card</option>
                                                                    <option value="Passport">Passport</option>
                                                                    <option value="Driving License">Driving License</option>
                                                                    <option value="Others">Others</option>
                                                            </select>

                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" placeholder="Fill" class="form-control" readonly="" value="${list.tenantIdcardType}" id="Tenantcard" name="Tenantcard">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>                                                    
                                                <select class="form-control" id="Tenantcard" name="Tenantcard">
                                                        <option value="Resident Card">Resident Card</option>
                                                        <option value="Passport">Passport</option>
                                                        <option value="Driving License">Driving License</option>
                                                        <option value="Others">Others</option>
                                                </select>
                                            </c:otherwise>        
                                        </c:choose>
                                        <label class="control-label">Id Card Type <a class="text-danger">*</a></label>
                                    </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3"style="display:none;" id="TenantcardNumdiv" >  

                                        <c:choose>
                                            <c:when test="${fn:length(tenantProfilingList) > 0}">
                                                <c:forEach items="${tenantProfilingList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" placeholder="Fill" class="form-control"  value="${list.tenantCardNum}" id="TenantcardNum" name="TenantcardNum">

                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" placeholder="Fill" class="form-control" readonly="" value="${list.tenantCardNum}" id="TenantcardNum" name="TenantcardNum">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>                                                    
                                                <input type="text" placeholder="Fill" class="form-control"  value="" id="TenantcardNum" name="TenantcardNum">
                                            </c:otherwise>        
                                        </c:choose>
                                        <label class="control-label">Labour Card Number <a class="text-danger">*</a></label>
                                    </div>

                                    <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3" style="display:none;" id="Tenantaddressdiv" >  

                                        <c:choose>
                                            <c:when test="${fn:length(tenantProfilingList) > 0}">
                                                <c:forEach items="${tenantProfilingList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" placeholder="Fill" class="form-control"  value="${list.tenantaddress}" id="Tenantaddress" name="Tenantaddress">

                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" placeholder="Fill" class="form-control" readonly="" value="${list.tenantaddress}" id="Tenantaddress" name="Tenantaddress">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>                                                    
                                                <input type="text" placeholder="Fill" class="form-control"  value="" id="Tenantaddress" name="Tenantaddress">
                                            </c:otherwise>        
                                        </c:choose>
                                       <label class="control-label">Tenant Address</label>
                                    </div>

                                    <div class="col-md-4 col-sm-12 col-xs-12 mb-3" style="display:none;" id="Tenantattachmentdiv" >  
                                        <label class="control-label">Attachment </label>
                                        <input type="file" placeholder="Fill" class="form-control"  value="" id="Tenantattachment" name="Tenantattachment">
                                    </div>


                                    <c:if test="${action ne 'view'}">
                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">

                                            <button type="submit" class="btn btn-primary" style="">Save</button>
                                            <a href="../management/tenantProfilingList.htm" class="btn btn-danger">Cancel</a>

                                        </div> 

                                    </c:if>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </section>

        </main><!-- End #main -->

        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha256-bqVeqGdJ7h/lYPq6xrPv/YGzMEb6dNxlfiTUHSgRCp8=" crossorigin="anonymous"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js" integrity="sha512-DNeDhsl+FWnx5B1EQzsayHMyP6Xl/Mg+vcnFPXGNjUZrW28hQaa1+A4qL9M+AiOMmkAhKAWYHh1a+t6qxthzUw==" crossorigin="anonymous"></script>
        <script src="../common/theme/js/custom.js"></script>





        <script>
                                            $(function () {
                                                var today = new Date();
                                                $('#startDate').datepicker({
                                                    format: 'dd-mm-yyyy',
                                                    autoclose: true,
                                                    startDate: today,
                                                    todayHighlight: true,
                                                    container: '.pick2'
                                                });
                                            });

        </script>



        <script>
            $(function () {
                var today = new Date();
                $('#endDate').datepicker({
                    format: 'dd-mm-yyyy',
                    autoclose: true,
                    startDate: today,
                    todayHighlight: true,
                    container: '.pick3'
                });
            });

        </script>


        <script>
            $("#RegisterCheck").change(function (event) {
                if (document.querySelector("#RegisterCheck").checked == true) {
                    $("#RegisterCheck").val('Yes');
                    $("#Tenantnamediv").show();
                    $("#Tenantphonediv").show();
                    $("#Tenantemaildiv").show();
                    $("#Tenantcarddiv").show();
                    $("#TenantcardNumdiv").show();
                    $("#Tenantaddressdiv").show();
                    $("#Tenantattachmentdiv").show();

                } else {
                    $("#RegisterCheck").val('No');
                    $("#Tenantnamediv").hide();
                    $("#Tenantphonediv").hide();
                    $("#Tenantemaildiv").hide();
                    $("#Tenantcarddiv").hide();
                    $("#TenantcardNumdiv").hide();
                    $("#Tenantaddressdiv").hide();
                    $("#Tenantattachmentdiv").hide();

                }
            });
        </script>
        <script>

            $(function () {
                var today = new Date();
                $('#jointeeName6').datepicker({
                    format: 'dd-mm-yyyy',
                    autoclose: true,
                    startDate: today,
                    todayHighlight: true,
                    container: '.pick4'
                });
            });

        </script>


        <script>
            $(function () {
                var today = new Date();
                $('#jointeeName2').datepicker({
                    format: 'dd-mm-yyyy',
                    autoclose: true,
                    startDate: today,
                    todayHighlight: true,
                    container: '.pick5'
                });
            });

        </script>

        <script>
            $(function () {
                var today = new Date();
                $('#jointeeName3').datepicker({
                    format: 'dd-mm-yyyy',
                    autoclose: true,
                    startDate: today,
                    todayHighlight: true,
                    container: '.pick6'
                });
            });

        </script>

        <script>
            $(function () {
                var today = new Date();
                $('#jointeeName7').datepicker({
                    format: 'dd-mm-yyyy',
                    autoclose: true,
                    startDate: today,
                    todayHighlight: true,
                    container: '.pick7'
                });
            });


            $(function () {
                var input = document.querySelector("#Tenantphone");
                var myinput = window.intlTelInput(input, {
                    initialCountry: "om",
                    onlyCountries: ["om", "in", "ae"],
                    hiddenInput: "full",
                    separateDialCode: true,
                    autoHideDialCode: false,
                    utilsScript: "//cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.3/js/utils.js",
                });
                $("#Tenantphone").change(function () {
                    var full_number = myinput.getNumber(intlTelInputUtils.numberFormat.E164);
                    $("#Tenantphone").val(full_number);
                    if (myinput.isValidNumber() == false) {
                        $("#Tenantphone").val("");
                        swal("Please enter valid mobile number");
                        return false;
                    }
                });
            });
        </script>



        <script>

            //                $(document).ready(function () {
            //                    $('#startDate').datepicker({
            //                format: 'dd-mm-yyyy',
            ////                startDate: '0m +0m',
            //                  startDate: today,
            //                autoclose: true,
            //                todayHighlight: true,
            //                container: '.pick2'
            //            }).datepicker('update',new Date())
            //            
            //            
            //               $('#endDate').datepicker({
            //                format: 'dd-mm-yyyy',
            //            startDate: today,
            //                autoclose: true,
            //                todayHighlight: true,
            //                container: '.pick3'
            //            }).datepicker('update',new Date())
            //            
            //             $('#jointeeName6').datepicker({
            //                format: 'dd-mm-yyyy',
            //                startDate: today,
            //                autoclose: true,
            //                todayHighlight: true,
            //                container: '.pick4'
            //            }).datepicker('update',new Date())
            //            
            ////             $('#jointeeName2').datepicker({
            ////                format: 'dd-mm-yyyy',
            ////                startDate: today,
            ////                autoclose: true,
            ////                todayHighlight: true,
            ////                container: '.pick5'
            ////            }).datepicker('update',new Date())
            //         $(function () {
            //                var today = new Date();
            //                $('#jointeeName2').datepicker({
            //                    format: 'dd-mm-yyyy',
            //                    autoclose: true,
            //                    startDate: today,
            //                    todayHighlight: true,
            //                    container: '.pick5'
            //                });
            //            });
            //       
            //            $(function () {
            //                var today = new Date();
            //                $('#jointeeName3').datepicker({
            //                    format: 'dd-mm-yyyy',
            //                    autoclose: true,
            //                     startDate: today,
            //                    todayHighlight: true,
            //                    container: '.pick6'
            //                });
            //            });
            //
            //
            ////             $('#jointeeName3').datepicker({
            ////                format: 'dd-mm-yyyy',
            ////                startDate: today,
            ////                autoclose: true,
            ////                todayHighlight: true,
            ////                container: '.pick6'
            ////            }).datepicker('update',new Date())
            //            
            //             $('#jointeeName7').datepicker({
            //                format: 'dd-mm-yyyy',
            //               startDate: today,
            //                autoclose: true,
            //                todayHighlight: true,
            //                container: '.pick7'
            //            }).datepicker('update',new Date())
            //            
            //            
            //            
            //            
            //    })
        </script>
    </body>

</html>