<%-- 
    Document   : rentInvoiceForm
    Created on : 23 Apr, 2019, 12:57:07 PM
    Author     : Lakshmi
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link href="../common/theme/css/disableSelection.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../common/validate/validationEngine.css" rel="stylesheet" type="text/css"/>
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.min.js" type="text/javascript"></script>
        <script src="../common/datepicker/jquery-ui.js" type="text/javascript"></script>
        <link href="../common/datepicker/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>
        <script src="../common/datepicker/CalendarControl.js" type="text/javascript"></script>
        <link href="../common/datepicker/StyleCalender.css" rel="stylesheet" type="text/css"/>
        <script src="../CRM/scripts/general-menu-scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/general-sales_scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/mioinvoice-menu-scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/mioinvoice-sales-scripts.js" type="text/javascript"></script>

        <script src="../master/scripts/general-attach-script.js" type="text/javascript"></script>
        <script src="../master/scripts/mioinvoice-attach-script.js" type="text/javascript"></script>
        <title>arête Assets Management</title>
    </head>


    <body class="nav-md">

        <div class="container body">


            <div class="main_container">
     Rent Already Paid for this Month           <jsp:include page="../login/menu.htm"/>
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <div class="clearfix"></div>
                        <div class="col-md-6 col-xs-12">
                            <div class="x_panel">
                                <jsp:include page="../login/headerlink.htm?submodule=Invoice Generation&tab=Rent Invoice&pagetype=form"/>

                                <div class="x_title">
                                    <h2>Rent Invoice Form</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <!--<br />-->
                                    <!--<h1>Development Is going on....!</h1>-->

                                    <form  id="rentInvoiceForm"  class="form-inline" action="../tenant/rentInvoiceFormSubmit.htm">
                                                
                                         <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Invoice Date</label>
                                           <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control validate[required]" autocomplete="off" readonly="" required="" id="invoiceDate" name="invoiceDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.invoiceDate}"/>" maxlength="20" onclick="javascript:NewCssCal('invoiceDate', 'ddMMMyyyy', '', '', '', '', '')">
                                                                
                                                                <input type="hidden" name="month" value="">
                                                                <input type="hidden" name="year" value="">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="invoiceDate" name="invoiceDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.invoiceDate}"/>">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" readonly="" placeholder="Select Date" required="" autocomplete="off" class="form-control validate[required]" id="invoiceDate" name="invoiceDate" value="" maxlength="20" onclick="javascript:NewCssCal('invoiceDate', 'ddMMMyyyy', '', '', '', '', '')">
                                                    <input type="hidden" name="month" value="">
                                                    <input type="hidden" name="year" value="">

                                                </c:otherwise>        
                                            </c:choose>

                                        </div>
                                        
                                        
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Tenant Code</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="hidden" name="pk" value="${list.SNo}">
                                                                <input type="hidden" name="invoiceNo" value="${list.invoiceNo}">
                                                                <input type="text" class="form-control validate[required]" readonly="" id="tenantCode" autocomplete="off" required="" name="tenantCode" value="${list.tenantCode}" onclick="return selectTenant();" onblur="checkAdvnce();">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="tenantCode" value="${list.tenantCode}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" class="form-control validate[required]" placeholder="Select Tenant Details" autocomplete="off" readonly id="tenantCode" required="" name="tenantCode" value="" onclick="return selectTenant();" onblur="checkAdvnce();">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Tenant Name</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" readonly="" id="tenantName" name="tenantName" maxlength="40" autocomplete="off" value="${list.tenantName}" onkeypress="return isNumberKey3(event)">
                                                                <input type="hidden" id="billCycle" name="billCycle" value="${list.billingCycle}">
<!--                                                                <input type="hidden" id="startsFrom" name="startsFrom" value="${list.period}">
                                                                <input type="hidden" id="endsTo" name="endsTo" value="${list.period1}">-->
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="tenantName" value="${list.tenantName}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" class="form-control" placeholder="" readonly id="tenantName" name="tenantName" autocomplete="off" maxlength="40" value="" onkeypress="return isNumberKey3(event)">
                                                    <!--                                                    <input type="hidden" id="startsFrom"  value="">
                                                                                                        <input type="hidden" id="endsTo"  value="">-->
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>

                                      <p>&nbsp;</p>
                                      
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Tenant ID</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                <input type="text" class="form-control" readonly="" id="tenantId" autocomplete="off" name="tenantId" maxlength="15" value="${list.tenantId}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="tenantId" value="${list.tenantId}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" readonly="" id="tenantId" autocomplete="off" name="tenantId" makeyprxlength="15" value="">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Tenant Category</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                <input type="text" class="form-control" readonly id="tenantCategory" autocomplete="off" name="tenantCategory" value="${list.tenantCategory}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="tenantCategory" value="${list.tenantCategory}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" class="form-control" id="tenantCategory" readonly="" autocomplete="off" name="tenantCategory" value="${list.tenantCategory}">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Property Name</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" readonly="" autocomplete="off" id="assetNames" name="assetNames" value="${list.assetName}">
                                                                <input type="hidden" class="form-control" placeholder="" readonly id="assetCode" name="assetCode" value="${list.assetCode}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" name="assetNames" id="assetNames" value="${list.assetName}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" class="form-control" placeholder="" autocomplete="off" id="assetNames" name="assetNames" readonly id="assetNames" >
                                                    <input type="hidden" class="form-control" placeholder="" id="assetCode" name="assetCode" readonly id="assetCode"  >
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>

                                       <p>&nbsp;</p>
                                         <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Flat Code</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" readonly="" autocomplete="off" id="subassetCode" name="subassetCode" value="${list.subAssetCode}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="subassetCode" value="${list.subAssetCode}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" class="form-control" placeholder="" autocomplete="off" readonly name="subassetCode" id="subassetCode" value="">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Flat Name/Flat No.</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" autocomplete="off" readonly="" id="flotNo" name="flotNo" value="${list.flatNo}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="flotNo" value="${list.flatNo}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" class="form-control" placeholder="" autocomplete="off" readonly id="flotNo" name="flotNo" value="">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Building No</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" autocomplete="off" readonly="" id="buildingNo" name="buildingNo" value="${list.buildingNo}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="buildingNo" value="${list.buildingNo}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" class="form-control" placeholder="" autocomplete="off" readonly id="buildingNo" name="buildingNo" value="">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>

                                     <p>&nbsp;</p>

                                           <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label">Block No</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" autocomplete="off" readonly="" id="blockNo" name="blockNo" value="${list.blockNo}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="blockNo" value="${list.blockNo}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" class="form-control" placeholder="" autocomplete="off" readonly id="blockNo" name="blockNo"  value="">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label">Street No</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" readonly="" autocomplete="off" id="streetNo" name="streetNo" value="${list.streetNo}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" placeholder="" readonly id="streetNo" value="${list.streetNo}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" readonly  class="form-control" autocomplete="off" id="streetNo" name="streetNo" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div> 




                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Plot No</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" autocomplete="off" readonly="" id="plotNo" name="plotNo" value="${list.plotNo}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="plotNo" value="${list.plotNo}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" readonly autocomplete="off" class="form-control" id="plotNo" name="plotNo" value="">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>


                                       <p>&nbsp;</p>
                                       
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Rent Amount</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" readonly="" autocomplete="off" id="rentAmount" name="rentAmount" maxlength="15" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.rentAmount}"/>" onkeypress="return isNumberKey3(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="rentAmount" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.rentAmount}"/>">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" readonly="" autocomplete="off" id="rentAmount" name="rentAmount" value="${list.rentAmount}">
                                                    <input type="hidden" id="extra3"  value="Honoured">
                                                    <input type="hidden" id="billCycle"  value="">
                                                    <input type="hidden" id="duesforcal"  value="">
                                                    <input type="hidden" id="duesforcal1"  value="">
                                                    <input type="hidden" id="totAdvance"  value="">
                                                    <input type="hidden" id="totServ"  value="">
                                                    <input type="hidden" id="prepaid"  value="">
                                                    <input type="hidden" id="prepaid1"  value="0">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Contract Name</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                <input type="text" class="form-control validate[required]" autocomplete="off" readonly="" id="contractName" required="" name="contractName" maxlength="50" onclick="return selectContractCode();" value="${list.contractCode}">
                                                                <input type="hidden" id="contractCode" name="contractCode" value="${list.contractCode}">
                                                                <input type="hidden" id="contractPeriod"  value="">
                                                                <input type="hidden" id="contSno"  value="">
                                                    <!--<input type="hidden" id="contractPeriod"  value="">-->
                                                    <input type="hidden" placeholder="" class="form-control" readonly id="endsTo">
                                                    <input type="hidden" placeholder="" class="form-control" readonly id="startsFrom">
                                                                <!--                                                                <input type="hidden" id="startsFrom" name="startsFrom" value="">
                                                                                                                                <input type="hidden" id="endsTo" name="endsTo" value="">-->
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="contractName" value="${list.contractCode}">
                                                                <input type="hidden" id="contractCode" name="contractCode" value="${list.contractCode}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="Select Contract" readonly="" autocomplete="off" class="form-control validate[required]" required="" id="contractName" name="contractName" maxlength="50" value=""  onclick="return selectContractCode();">
                                                    <input type="hidden" id="contSno"  value="">
                                                    <input type="hidden" id="contractPeriod"  value="">
                                                    <input type="hidden" placeholder="" class="form-control" readonly id="endsTo">
                                                    <input type="hidden" placeholder="" class="form-control" readonly id="startsFrom">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>


                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Billing Cycle</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                <input type="text" class="form-control" readonly="" autocomplete="off" name="billingCycle" id="billingCycle" value="${list.billingCycle}" >

                                                                        <!--<input type="text" class="form-control" readonly id="billingCycle" name="billingCycle" value="${list.billingCycle}">-->
                                                                <%--<select id="billingCycle" name="billingCycle" class="form-control" onchange="rentPMonth();">
                                                                    <option value="${list.billingCycle}" selected>${list.billingCycle}</option>
                                                                    <c:forEach items="${Dropdown}" var="list">
                                                                        <c:if test="${list[0] eq 'F-07'}">
                                                                            <option>${list[1]}</option>                                     
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </select>--%>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="billingCycle" value="${list.billingCycle}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>  
                                                    <input type="text" class="form-control" name="billingCycle" autocomplete="off" readonly="" id="billingCycle" value="${list.billingCycle}" >
                                                    <%--<select id="billingCycle"  class="form-control" onchange="rentPMonth();">
                                                        <option value="" selected>Select your option</option>
                                                        <c:forEach items="${Dropdown}" var="list">
                                                            <c:if test="${list[0] eq 'F-07'}">
                                                                <option>${list[1]}</option>                                     
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>--%>
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>
                                        <%-- <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                 <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Contract Name</label>
                                                 <c:choose>
                                                     <c:when test="${fn:length(tenantDetails) > 0}">
                                                         <c:forEach items="${tenantDetails}" var="list">
                                                             <c:choose>
                                                                 <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                             <input type="text" class="form-control" readonly="" id="startsFrom" name="startsFrom">
                                                                             <input type="hidden" id="contSno" name="contSno" value="">
                                                                         </c:when>
                                                                         <c:otherwise>
                                                                             <input type="text" class="form-control" readonly="" id="startsFrom" >
                                                                             <input type="hidden" id="contSno" name="contSno" value="">
                                                                         </c:otherwise> 
                                                                     </c:choose>
                                                                 </c:forEach>
                                                             </c:when>
                                                             <c:otherwise>                                                    
                                                                 <input type="text" placeholder="" class="form-control" readonly id="startsFrom">
                                                             </c:otherwise>        
                                                         </c:choose>

                                                </div>
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Contract Name</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" placeholder="Select Date" readonly="" id="endsTo" name="endsTo" value="<fmt:formatDate pattern="dd-MMM-yyyy" value=""/>">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="endsTo" value="<fmt:formatDate pattern="dd-MMM-yyyy" value=""/>">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" readonly id="endsTo">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div>--%>

                                       
                                        <p>&nbsp;</p>
                                        
                                         <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>From Date</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control validate[required]" autocomplete="off" readonly="" required="" id="period" name="period" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.period}"/>" maxlength="20" onclick="javascript:NewCssCal('period', 'ddMMMyyyy', '', '', '', '', '')" onchange="checkDates1();" onblur="checkContDates();">
<!--                                                                <input type="hidden" class="form-control" readonly="" name="period1" id="period1"  value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.period}"/>" maxlength="20" onclick="javascript:NewCssCal('period', 'ddMMMyyyy', '', '', '', '', '')" onchange="checkDates1();" onblur="checkContDates();">-->
                                                                <input type="hidden" name="month" value="">
                                                                <input type="hidden" name="year" value="">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="period" name="period" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.period}"/>">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" readonly="" placeholder="Select Date" required="" autocomplete="off" class="form-control validate[required]" id="period" name="period" value="" maxlength="20" onclick="javascript:NewCssCal('period', 'ddMMMyyyy', '', '', '', '', '')" onchange="checkDates1();" onkeyup="checkInvoice();" onblur="checkContDates();">
                                                    <input type="hidden" name="month" value="">
                                                    <input type="hidden" name="year" value="">

                                                </c:otherwise>        
                                            </c:choose>

                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>To Date</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control validate[required]" required="" autocomplete="off" readonly="" id="toDate" name="toDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.period1}"/>" maxlength="20" onclick="javascript:NewCssCal('toDate', 'ddMMMyyyy', '', '', '', '', '')" onchange="checkDates();">
                                                                <input type="hidden" class="form-control" readonly="" id="toDate1"  name="toDate1" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.period1}"/>" maxlength="20" onclick="javascript:NewCssCal('toDate', 'ddMMMyyyy', '', '', '', '', '')" onchange="checkDates();">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="toDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.period1}"/>">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" readonly="" placeholder="Select Date" required="" autocomplete="off" class="form-control validate[required]" id="toDate"  name="toDate" value="" maxlength="20" onclick="javascript:NewCssCal('toDate', 'ddMMMyyyy', '', '', '', '', '')" onchange="checkDates();">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Due Date</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                <input type="text" placeholder="Select Date" class="form-control validate[required]" autocomplete="off" required="" readonly="" id="dueDate" name="dueDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.dueDate}"/>" onchange="dateCheckCondition();" onclick="javascript:NewCssCal('dueDate', 'ddMMMyyyy', '', '', '', '', '')">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="dueDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.dueDate}"/>">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="Select Date" class="form-control validate[required]" autocomplete="off" readonly required="" id="dueDate" name="dueDate" value="" onclick="javascript:NewCssCal('dueDate', 'ddMMMyyyy', '', '', '', '', '')" onchange="dateCheckCondition();">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>
                                        <p>&nbsp;</p> <p>&nbsp;</p>
                                        <c:if test="${action ne 'view' && action ne 'edit'}">
                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                <button type="submit" class="btn btn-primary" onclick="return test();" style="">Generate</button>
                                                <a href="../finance/rentInvoiceList.htm" class="btn btn-danger">Cancel</a>
                                            </div> 
                                        </c:if>
                                        <c:if test="${action eq 'edit'}">
                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                <button type="submit" class="btn btn-primary" onclick="return test();" style="">Save</button>
                                                <a href="../finance/rentInvoiceList.htm" class="btn btn-danger">Cancel</a>
                                            </div> 
                                        </c:if>


                                    </form>
                                </div> 

                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <div id="custom_notifications" class="custom-notifications dsp_none">
            <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group"></ul>
            <div class="clearfix"></div>
            <div id="notif-group" class="tabbed_notifications"></div>
        </div>
        <script src="../CRM/scripts/general-menu-scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/general-sales_scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/mioinvoice-menu-scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/mioinvoice-sales-scripts.js" type="text/javascript"></script>
        <script>
            
            
            
//             function  checkInvoice(){
//                  var tenantCode = document.getElementById("tenantCode").value;
//                  var fromDate = document.getElementById("period").value;
//                  var toDate = document.getElementById("toDate").value;
//                  var contractName = document.getElementById("contractName").value;
//                  
//                  
//                                                   var actD = fromDate.split("-");
//                                                        var inA = toDate.split("-");
//                                                        var or = new Date(actD[1] + '/' + actD[0] + '/' + actD[2]);
//                                                        var trd = new Date(inA[1] + '/' + inA[0] + '/' + inA[2]);
//                                                        
//                                                        
//                                                         var v1 = new Date(actD);
//                                                            var v2 = new Date(inA);
//                                                            var actualdatef = v1.getDate();
//                                                            var actualdatet = v2.getDate();
//                                                            var actualmonthf = v1.getMonth();
//                                                            var actualmontht = v2.getMonth();
//                                                            var actualmonthf1 = actualmonthf + 1;
//                                                            var actualmontht1 = actualmontht + 1;
//                                                            var actuayf = v1.getFullYear();
//                                                            var actuayt = v2.getFullYear();
//                                                        
//                                                
//                                                        
//                                                          $.ajax
//                                                                    ({
//                                                                        type: "POST",
//                                                                        url: '../tenant/getTenantInvoice.htm',
//                                                                        data: {
//                                                                            tenantCode: tenantCode,
//                                                                            contractName: contractName,
//                                                                            actualdatef: actualdatef,
//                                                                            actualdatet: actualdatet,
//                                                                            actualmonthf1: actualmonthf1,
//                                                                            actualmontht1: actualmontht1,
//                                                                            actuayf: actuayf,
//                                                                            actuayt: actuayt,
//                                                                           // receiptType: receiptType,
//                                                                        },
//                                                                        success: function (data) {
//                                                                            if ($.trim(data) == 'Already Exists.Enter another') {
//                                                                                alert("Invoice is Created for this Month(s) " + fromDate + " to " + toDate);
//                                                                                document.getElementById("period").value = "";
//                                                                              document.getElementById("toDate").value = "";
//                                                                                return false;
//                                                                            }
//                                                                        }
//                                                                    });
//                                                                
//                                                        
//                                                                      }
            
                                                    function checkDates1() {
                                                        document.getElementById("toDate").value = '';
                                                        var receiptType = "Rent";
                                                        var tenantCode = document.getElementById("tenantCode").value;
                                                        var fromDate = document.getElementById("period").value;
                                                        var toDate = document.getElementById("toDate").value;
                                                        var contractName = document.getElementById("contractName").value;
                                                        
                                                          var flotNo = document.getElementById("flotNo").value;
                                                       // alert("Contract Name:"+contractName);
                                                        

                                                        //var contfrom = document.getElementById("startsFrom").value;
                                                        //var contend = document.getElementById("endsTo").value;

                                                        //var contfrom1 = contfrom.split("-");
                                                        // contend1 = contend.split("-");
                                                        var actD = fromDate.split("-");
                                                        var inA = toDate.split("-");
                                                        var or = new Date(actD[1] + '/' + actD[0] + '/' + actD[2]);
                                                        var trd = new Date(inA[1] + '/' + inA[0] + '/' + inA[2]);
                                                        
                                                        
                                                         var v1 = new Date(actD);
                                                            var v2 = new Date(inA);
                                                            var actualdatef = v1.getDate();
                                                            var actualdatet = v2.getDate();
                                                            var actualmonthf = v1.getMonth();
                                                            var actualmontht = v2.getMonth();
                                                            var actualmonthf1 = actualmonthf + 1;
                                                            var actualmontht1 = actualmontht + 1;
                                                            var actuayf = v1.getFullYear();
                                                            var actuayt = v2.getFullYear();
                                                        
                                                
                                                        
                                                          
                                                          var contfrom = document.getElementById("startsFrom").value;
                                                        var contend = document.getElementById("endsTo").value;        
                                                         var contfromdate = Date.parse(contfrom);
                                                        var contenddate = Date.parse(contend);
                                                        var fromDate1 = Date.parse(fromDate);
//                                                        alert("fromDate1"+fromDate1);
//                                                        alert("contfromdate"+contfromdate);
//                                                         alert("contenddate"+contenddate);
                                                      
                                                                
                                                        

                                                        //var contfrom2 = new Date(contfrom1[1] + '/' + contfrom1[0] + '/' + contfrom1[2]);
                                                        //var contend2 = new Date(contend1[1] + '/' + contend1[0] + '/' + contend1[2]);

//                                                        if (or >= contfrom2 && or < contend2) {
//                                                            alert("Date should be in contract period");
//                                                            document.getElementById("period").value = '';
//                                                            document.getElementById("toDate").value = '';
//                                                            document.getElementById("dueDate").value = '';
//                                                            return false;
//                                                        }
                                                            
//                                                         if(fromDate == fromDate){
//                                                             
//                                                            var v1 = new Date(actD);
//                                                            var v2 = new Date(inA);
//                                                            var actualdatef = v1.getDate();
//                                                            var actualdatet = v2.getDate();
//                                                            var actualmonthf = v1.getMonth();
//                                                            var actualmontht = v2.getMonth();
//                                                            var actualmonthf1 = actualmonthf + 1;
//                                                            var actualmontht1 = actualmontht + 1;
//                                                            var actuayf = v1.getFullYear();
//                                                            var actuayt = v2.getFullYear();
//                                                             
//                                                             
//                                                             
//                                                             $.ajax({
//                                                               
//                                                               type: "POST",
//                                                               url: '../tenant/checkPeroid.htm',
//                                                               
//                                                               data: {
//                                                                 tenantCode: tenantCode,
//                                                                 fromDate:fromDate,
//                                                                 contractName:contractName,
//                                                                 
//                                                                      },
//                                                                success: function (data) {
//                                                                if (data !== "No Data")
//                                                                {
//
//                                                   alert("This Period is already exists in the system. Please enter a new valid Peroid!!!");
//                                                            $('#period').val("");
//                                                            $('#period').focus();
//
//                                //                                   
//                            } else {
//
//                            }
//
//
//                        },
//                        error: function (error) {
//                            //                                alert("error");
//                        }
//                                                             });
//                                                         }

                                                        if (trd < or) {
                                                            alert("To Date should be Greater Than From Date.");
                                                            document.getElementById("period").value = '';
                                                            document.getElementById("toDate").value = '';
                                                            return false;
                                                        }
                                                        else if (receiptType === 'Rent') {
                                                            var v1 = new Date(actD);
                                                            var actualstartdatef = v1.getDate();
                                                            var actualstartmonthf = v1.getMonth();
                                                            var actualstartmonthf1 = actualstartmonthf + 1;
                                                            var actuaystartf = v1.getFullYear();
                                                            $.ajax
                                                                    ({
                                                                        type: "POST",
                                                                        url: '../tenant/previousContrtacts.htm',
                                                                        data: {
                                                                            tenantCode: tenantCode,
                                                                            actualstartdatef: actualstartdatef,
                                                                            actualstartmonthf1: actualstartmonthf1,
                                                                            actuaystartf: actuaystartf,
                                                                        },
                                                                        success: function (data) {
                                                                            if (data === 'a') {
                                                                                return false;
                                                                            } else {
                                                                                var dat = data.split(",");
                                                                                document.getElementById("rentAmount").value = parseFloat(dat[0]);
                                                                                document.getElementById("billCycle").value = dat[1];
                                                                                return true;
                                                                            }
                                                                        }

                                                                    });

                                                        } else if (receiptType === 'Utility No.1') {
                                                            var v1 = new Date(actD);
                                                            var actualstartdatef = v1.getDate();
                                                            var actualstartmonthf = v1.getMonth();
                                                            var actualstartmonthf1 = actualstartmonthf + 1;
                                                            var actuaystartf = v1.getFullYear();
                                                            $.ajax
                                                                    ({
                                                                        type: "POST",
                                                                        url: '../tenant/previousUtility.htm',
                                                                        data: {
                                                                            tenantCode: tenantCode,
                                                                            actualstartdatef: actualstartdatef,
                                                                            actualstartmonthf1: actualstartmonthf1,
                                                                            actuaystartf: actuaystartf,
                                                                        },
                                                                        success: function (data) {
                                                                            if (data === 'a') {
                                                                                alert("To Date should be Greater Than From Date.1");
                                                                                return false;
                                                                            } else {

                                                                                var dat = data.split(",");
                                                                                document.getElementById("rentAmount").value = dat[0];
                                                                                //document.getElementById("billCycle").value = dat[1];
                                                                                return true;
                                                                            }
                                                                        }

                                                                    });

                                                        }



                                                    }

                                                    function checkContDates() {
                                                        //alert("fromdate");
                                                        var receiptType = "Rent";
                                                        var tenantCode = document.getElementById("tenantCode").value;
                                                        var billCycle = "Monthly";
                                                        var fromDate = document.getElementById("period").value;
                                                        //alert("fromDate" + fromDate);
                                                        var toDate = document.getElementById("toDate").value;
                                                        var contfrom = document.getElementById("startsFrom").value;
                                                        var contend = document.getElementById("endsTo").value;
                                                        var contractName = document.getElementById("contractName").value;
                                                         var flotNo = document.getElementById("flotNo").value;
                                                        //alert("contfrom" + contfrom);
                                                        //alert("contend" + contend);
                                                        //var contfrom1 = contfrom.split("-");
                                                        //var contend1 = contend.split("-");
                                                        //var contfrom2 = new Date(contfrom1[1] + '/' + contfrom1[0] + '/' + contfrom1[2]);
                                                        //var contend2 = new Date(contend1[1] + '/' + contend1[0] + '/' + contend1[2]);
                                                        var tempdate = null;
                                                        var tempdate1 = null;
                                                        var actD = fromDate.split("-");
                                                        //alert("toDate" + toDate);
                                                        var inA = toDate.split("-");
                                                        //alert("toDate1111" + toDate);
                                                        var or = new Date(actD[1] + '/' + actD[0] + '/' + actD[2]);
                                                        var or1 = new Date(actD[1] + '/' + actD[0] + '/' + actD[2]);
                                                        var trd = new Date(inA[1] + '/' + inA[0] + '/' + inA[2]);
                                                        //alert("or" + or);
                                                        //alert("contfrom2" + contfrom2);
                                                        //checkcontractdate();
//                                                        if (or >= contfrom2 && or < contend2) {
//                                                            
//                                                            alert("Date should be in contract period");
//                                                            document.getElementById("period").value = '';
//                                                            document.getElementById("toDate").value = '';
//                                                            document.getElementById("dueDate").value = '';
//                                                            return false;
//                                                        }
                                                            
                                                            
                                                            
                                                              var v1 = new Date(actD);
                                                            var v2 = new Date(inA);
                                                            var actualdatef = v1.getDate();
                                                            var actualdatet = v2.getDate();
                                                            var actualmonthf = v1.getMonth();
                                                            var actualmontht = v2.getMonth();
                                                            var actualmonthf1 = actualmonthf + 1;
                                                            var actualmontht1 = actualmontht + 1;
                                                            var actuayf = v1.getFullYear();
                                                            var actuayt = v2.getFullYear();
                                                            
                                                            
                                                            $.ajax
                                                                    ({
                                                                        type: "POST",
                                                                        url: '../tenant/getTenantInvoice.htm',
                                                                        data: {
                                                                            tenantCode: tenantCode,
                                                                            contractName: contractName,
                                                                            actualdatef: actualdatef,
                                                                            actualdatet: actualdatet,
                                                                            actualmonthf1: actualmonthf1,
                                                                            actualmontht1: actualmontht1,
                                                                            actuayf: actuayf,
                                                                            actuayt: actuayt,
                                                                            receiptType: receiptType,
                                                                            flotNo: flotNo,
                                                                        },
                                                                        success: function (data) {
                                                                            if ($.trim(data) == 'Already Exists.Enter another') {
                                                                                
                                                                                
                                                                                
                                                                                alert("Invoice is Created for this Month(s) " + fromDate + " to " + toDate);
                                                                                
                                                                                 document.getElementById("period").value = "";
                                                                              //  document.getElementById("toDate").value = "";
                                                                               document.getElementById("toDate").value = "";
                                                                              document.getElementById("dueDate").value = "";
                                                                               
                                                                                return false;
                                                                               // window.close();
                                                                            }
                                                                        }
                                                                    });
                                                            
                                                         var contfrom = document.getElementById("startsFrom").value;
                                                        var contend = document.getElementById("endsTo").value;        
                                                         var contfromdate = Date.parse(contfrom);
                                                        var contenddate = Date.parse(contend);
                                                        var fromDate1 = Date.parse(fromDate);

                                                        if (contractName == "")
                                                        {
                                                            alert("Please Select Contract Name First");
                                                            return false;
                                                        }
                                                      
                                                        if (fromDate1 < contfromdate || fromDate1 > contenddate) {                                                           
                                                            alert("Date should be in contract   period");
                                                            
                                                            document.getElementById("period").value = "";
                                                            document.getElementById("toDate").value = "";
                                                            document.getElementById("dueDate").value = "";
                                                          //  return true;
                                                            return false;
                                                          //  window.closed(0);
                                                           // window.clearTimeout(2000);
                                                           
                                                          
                                                        }


//                                                          if(fromDate1 > contenddate){
//                                                               alert("Date should be in contract more date  period");
//                                                              document.getElementById("period").value = "";
//                                                            document.getElementById("toDate").value = "";
//                                                            document.getElementById("dueDate").value = "";
//                                                            return false; 
//                                                          }
//                                                          else if(fromDate1 < contfromdate){
//                                                               alert("Date should be in contract contract less  period");
//                                                              document.getElementById("period").value = "";
//                                                            document.getElementById("toDate").value = "";
//                                                            document.getElementById("dueDate").value = "";
//                                                            return false; 
//                                                          }
                                                        if (billCycle === 'Monthly' && receiptType === 'Rent') {
                                                            //alert("fromdate");
                                                            tempdate = new Date(or.setMonth(or.getMonth() + 1));
                                                          //  alert("temdate:"+tempdate);
                                                            tempdate = new Date(tempdate.setDate(tempdate.getDate() - 1));
                                                         //   alert("temdate next:"+tempdate);
                                                            //tempdate1=new Date(or1.setMonth(or1.getMonth()));
                                                            tempdate1 = new Date(or1.setDate(or1.getDate() + 4));
                                                            //alert("tempdate1"+tempdate1);
                                                            document.getElementById("toDate").value = moment(tempdate).format('DD-MMM-YYYY');
                                                          //  document.getElementById('toDate').style.pointerEvents = 'none';
                                                            document.getElementById("dueDate").value = moment(tempdate1).format('DD-MMM-YYYY');
                                                            document.getElementById('dueDate').style.pointerEvents = 'none';
                                                            checkDates();
                                                        }
                                                        else if (billCycle === 'Quarterly' && receiptType === 'Rent') {
                                                            tempdate = new Date(or.setMonth(or.getMonth() + 3));
                                                            tempdate = new Date(tempdate.setDate(tempdate.getDate() - 1));
                                                            document.getElementById("toDate").value = moment(tempdate).format('DD-MMM-YYYY');
                                                            document.getElementById('toDate').style.pointerEvents = 'none';
                                                            checkDates();
                                                        }
                                                        else if (billCycle === 'Half Yearly' && receiptType === 'Rent') {
                                                            tempdate = new Date(or.setMonth(or.getMonth() + 6));
                                                            tempdate = new Date(tempdate.setDate(tempdate.getDate() - 1));
                                                            document.getElementById("toDate").value = moment(tempdate).format('DD-MMM-YYYY');
                                                            document.getElementById('toDate').style.pointerEvents = 'none';
                                                            checkDates();
                                                        }
                                                        else if (billCycle === 'Yearly' && receiptType === 'Rent') {
                                                            tempdate = new Date(or.setMonth(or.getMonth() + 12));
                                                            tempdate = new Date(tempdate.setDate(tempdate.getDate() - 1));
                                                            document.getElementById("toDate").value = moment(tempdate).format('DD-MMM-YYYY');
                                                            document.getElementById('toDate').style.pointerEvents = 'none';
                                                            checkDates();
                                                        }
                                                    }

                                                    function checkDates() {
//                                                        alert("hi");
                                                        var receiptType = "Rent";
                                                        var tenantCode = document.getElementById("tenantCode").value;
                                                        var contractName = document.getElementById("contractName").value;
                                                        var billCycle = "Monthly";
                                                        var fromDate = document.getElementById("period").value;
                                                        var toDate = document.getElementById("toDate").value;
                                                        var flotNo = document.getElementById("flotNo").value;
                                                        var actD = fromDate.split("-");
                                                        var inA = toDate.split("-");
//                                                         alert("hello");
                                                        var or = new Date(actD[1] + '/' + actD[0] + '/' + actD[2]);
                                                        var trd = new Date(inA[1] + '/' + inA[0] + '/' + inA[2]);
                                                        var dueDate=document.getElementById("dueDate").value;
                                                        var dueDate1=new Date(dueDate);
//                                                        alert("dueformat"+dueDate1);
//                                                        alert("DueDate"+dueDate);
                                                        if (actD == '' && receiptType != 'Rent') {
                                                            alert("Select from date...");
                                                            document.getElementById("period").value = '';
                                                            document.getElementById("toDate").value = '';
                                                        }
                                                        if (trd < or) {
                                                            alert("To Date should be Greater Than From Date");
                                                            document.getElementById("period").value = '';
                                                            document.getElementById("toDate").value = '';
                                                            return false;
                                                        }
//                                                        var v1 = new Date(actD);
//                                                            var v2 = new Date(inA);
//                                                            var actualdatef = v1.getDate();
//                                                            var actualdatet = v2.getDate();
//                                                            var actualmonthf = v1.getMonth();
//                                                            var actualmontht = v2.getMonth();
//                                                            var actualmonthf1 = actualmonthf + 1;
//                                                            var actualmontht1 = actualmontht + 1;
//                                                            var actuayf = v1.getFullYear();
//                                                            var actuayt = v2.getFullYear();
//                                                            //alert("actualf"+actuayf);
//                                                             $.ajax
//                                                                    ({
//                                                                        type: "POST",
//                                                                        url: '../tenant/getTenantInvoice.htm',
//                                                                        data: {
//                                                                            tenantCode: tenantCode,
//                                                                            contractName: contractName,
//                                                                            actualdatef: actualdatef,
//                                                                            actualdatet: actualdatet,
//                                                                            actualmonthf1: actualmonthf1,
//                                                                            actualmontht1: actualmontht1,
//                                                                            actuayf: actuayf,
//                                                                            actuayt: actuayt,
//                                                                            receiptType: receiptType,
//                                                                        },
//                                                                        success: function (data) {
//                                                                            if ($.trim(data) == 'Already Exists.Enter another') {
//                                                                                alert("Invoice is Created for this Month(s) " + fromDate + " to " + toDate);
//                                                                                document.getElementById("period").value = "";
//                                                                                document.getElementById("toDate").value = "";
//                                                                                return false;
//                                                                            }
//                                                                        }
//                                                                    });
//                                                                   
                                                            
                                                       
                                                       
                                                        

            <c:if test="${action ne 'edit'}">
                                                        //alert("Hiiii");
                                                        if ((billCycle === 'Monthly' || billCycle === 'Quarterly' || billCycle === 'Half Yearly' || billCycle === 'Yearly') && receiptType === 'Rent') {
                                                            var v1 = new Date(actD);
                                                            var v2 = new Date(inA);
//                                                            alert("hello")
                                                            var actualdatef = v1.getDate();
                                                            var actualdatet = v2.getDate();
                                                            var actualmonthf = v1.getMonth();
                                                            var actualmontht = v2.getMonth();
                                                            var actualmonthf1 = actualmonthf + 1;
                                                            var actualmontht1 = actualmontht + 1;
                                                            var actuayf = v1.getFullYear();
                                                            var actuayt = v2.getFullYear();
                                                            $.ajax
                                                                    ({
                                                                        type: "POST",
                                                                        url: '../tenant/getTenantDates.htm',
                                                                        data: {
                                                                            tenantCode: tenantCode,
                                                                            contractName: contractName,
                                                                            actualdatef: actualdatef,
                                                                            actualdatet: actualdatet,
                                                                            actualmonthf1: actualmonthf1,
                                                                            actualmontht1: actualmontht1,
                                                                            actuayf: actuayf,
                                                                            actuayt: actuayt,
                                                                            receiptType: receiptType,
                                                                            flotNo:flotNo,
                                                                        },
                                                                        success: function (data) {
                                                                            if ($.trim(data) == 'Already Exists.Enter another') {
                                                                                alert("Rent Already Paid for this Month(s) " + fromDate + " to " + toDate);
                                                                                document.getElementById("period").value = "";
                                                                                document.getElementById("toDate").value = "";
                                                                                return false;
                                                                            }
                                                                        }
                                                                    });
                                                                   
                                                            
  
                                                                    
                                                        }
                                                        
                                                        
                                                    
                                                            

            </c:if>

                                                    }
                                                    
                                                    
                                                   
                                                   
                                                     
                                                            
                                                    

                                                    function selectTenant()
                                                    {
                                                        //alert("select tenant");
                                                        myWindow = window.open("../tenant/tenantDetailsPopUp.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                                                        window.close();
                                                        document.getElementById("contractName").value = "";
                                                        document.getElementById("contractCode").value = "";
                                                    }
                                                    function selectContractCode()
                                                    {
                                                        var tenantCategory = document.getElementById("tenantCategory").value;
                                                        //alert("select tenant");
                                                        var flatNo = document.getElementById("subassetCode").value;
                                                        //alert("select tenant");
                                                        myWindow = window.open("../tenant/selectContract.htm?tenantCategory=" + tenantCategory + "&flatNo=" + flatNo + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                                                        window.close();
//
//                                                            myWindow = window.open("../tenant/selectContract.htm?tenantCategory=" + tenantCategory + "&flatNo=" + flatNo + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
//                                                            window.close();

                                                    }
//                                                    function checkcontractdate()
//                                                    {
//                                                    var contfrom = document.getElementById("startsFrom").value;
//                                                            var contend = document.getElementById("endsTo").value;
//                                                            var from = document.getElementById("period").value;
//                                                            var to = document.getElementById("toDate").value;
//                                                            alert("contfrom" + contfrom);
//                                                            alert("from" + from);
//                                                            var actD = contfrom.split("-");
//                                                            var inA = contend.split("-");
//                                                            var actD1 = from.split("-");
//                                                            var inA1 = to.split("-");
//                                                            var or = new Date(actD[1] + '/' + actD[0] + '/' + actD[2]);
//                                                            var trd = new Date(inA[1] + '/' + inA[0] + '/' + inA[2]);
//                                                            var or1 = new Date(actD1[1] + '/' + actD1[0] + '/' + actD1[2]);
//                                                            var trd1 = new Date(inA1[1] + '/' + inA1[0] + '/' + inA1[2]);
//                                                            alert("or" + or);
//                                                            alert("or1" + or1);
//                                                            alert("trd" + trd);
//                                                            if (or1 >= or && or1 < trd) {
//                                                    alert("To Date should be less than contract end date");
//                                                            document.getElementById("period").value = '';
//                                                            document.getElementById("toDate").value = '';
//                                                            return false;
//                                                    }
//
//                                                    }


                                                    function test()
                                                    {
                                                        if (document.getElementById("tenantCode").value == "")
                                                        {
                                                            alert("Please select Tenant Code");
                                                            return false;
                                                        }
                                                        else if (document.getElementById("contractName").value == "")
                                                        {
                                                            alert("Please select Contract Name");
                                                            return false;
                                                        } else if (document.getElementById("period").value == "")
                                                        {
                                                            alert("Please select From Date");
                                                            return false;
                                                        }
                                                        else {
                                                            document.forms["rentInvoiceForm"].submit();
                                                        }
                                                    }


        </script>
        <script>
            NProgress.done();


        </script>
    </body>

</html>
