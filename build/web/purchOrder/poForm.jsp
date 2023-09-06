<%-- 
    Document   : poForm
    Created on : 15 Oct, 2016, 3:40:03 PM
    Author     : Shweta S Sakri
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>arête Assets Management</title>

        <!--<script type="text/javascript" src="../common/datepicker/datetimereq_css.js"></script>-->

        <script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>
    </head>
    <script>
        <%

            Date date = new Date();

        %>
    </script>


    <body class="nav-md">

        <div class="container body">


            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <div class="clearfix"></div>
                        <form id="reqForm" class="form-inline" method="post" action="../purchase/purchaseOrderSubmit.htm" enctype="multipart/form-data" onsubmit="return checkGrid();">

                            <c:forEach items="${purchase}" var="list">                                       
                                <c:if test="${list[0] eq '554'}">
                                    <c:set value="${list[1]}" var="field_554"/>
                                    <c:set value="${list[2]}" var="fieldStatus_554"/>
                                    <c:set value="${list[3]}" var="mand_status_554"/>
                                    <c:set value="${list[4]}" var="max_length_554"/>
                                </c:if>
                                <c:if test="${list[0] eq '555'}">
                                    <c:set value="${list[1]}" var="field_555"/>
                                    <c:set value="${list[2]}" var="fieldStatus_555"/>
                                    <c:set value="${list[3]}" var="mand_status_555"/>
                                    <c:set value="${list[4]}" var="max_length_555"/>
                                </c:if>
                                <c:if test="${list[0] eq '556'}">
                                    <c:set value="${list[1]}" var="field_556"/>
                                    <c:set value="${list[2]}" var="fieldStatus_556"/>
                                    <c:set value="${list[3]}" var="mand_status_556"/>
                                    <c:set value="${list[4]}" var="max_length_556"/>
                                </c:if>
                                <c:if test="${list[0] eq '557'}">
                                    <c:set value="${list[1]}" var="field_557"/>
                                    <c:set value="${list[2]}" var="fieldStatus_557"/>
                                    <c:set value="${list[3]}" var="mand_status_557"/>
                                    <c:set value="${list[4]}" var="max_length_557"/>
                                </c:if>
                                <c:if test="${list[0] eq '558'}">
                                    <c:set value="${list[1]}" var="field_558"/>
                                    <c:set value="${list[2]}" var="fieldStatus_558"/>
                                    <c:set value="${list[3]}" var="mand_status_558"/>
                                    <c:set value="${list[4]}" var="max_length_558"/>
                                </c:if>
                                <c:if test="${list[0] eq '560'}">
                                    <c:set value="${list[1]}" var="field_560"/>
                                    <c:set value="${list[2]}" var="fieldStatus_560"/>
                                    <c:set value="${list[3]}" var="mand_status_560"/>
                                    <c:set value="${list[4]}" var="max_length_560"/>
                                </c:if>
                                <c:if test="${list[0] eq '561'}">
                                    <c:set value="${list[1]}" var="field_561"/>
                                    <c:set value="${list[2]}" var="fieldStatus_561"/>
                                    <c:set value="${list[3]}" var="mand_status_561"/>
                                    <c:set value="${list[4]}" var="max_length_561"/>
                                </c:if>
                                <c:if test="${list[0] eq '562'}">
                                    <c:set value="${list[1]}" var="field_562"/>
                                    <c:set value="${list[2]}" var="fieldStatus_562"/>
                                    <c:set value="${list[3]}" var="mand_status_562"/>
                                    <c:set value="${list[4]}" var="max_length_562"/>
                                </c:if>
                                <c:if test="${list[0] eq '563'}">
                                    <c:set value="${list[1]}" var="field_563"/>
                                    <c:set value="${list[2]}" var="fieldStatus_563"/>
                                    <c:set value="${list[3]}" var="mand_status_563"/>
                                    <c:set value="${list[4]}" var="max_length_563"/>
                                </c:if>
                                <c:if test="${list[0] eq '564'}">
                                    <c:set value="${list[1]}" var="field_564"/>
                                    <c:set value="${list[2]}" var="fieldStatus_564"/>
                                    <c:set value="${list[3]}" var="mand_status_564"/>
                                    <c:set value="${list[4]}" var="max_length_564"/>
                                </c:if>
                                <c:if test="${list[0] eq '565'}">
                                    <c:set value="${list[1]}" var="field_565"/>
                                    <c:set value="${list[2]}" var="fieldStatus_565"/>
                                    <c:set value="${list[3]}" var="mand_status_565"/>
                                    <c:set value="${list[4]}" var="max_length_565"/>
                                </c:if>
                                <c:if test="${list[0] eq '566'}">
                                    <c:set value="${list[1]}" var="field_566"/>
                                    <c:set value="${list[2]}" var="fieldStatus_566"/>
                                    <c:set value="${list[3]}" var="mand_status_566"/>
                                    <c:set value="${list[4]}" var="max_length_566"/>
                                </c:if>
                                <c:if test="${list[0] eq '567'}">
                                    <c:set value="${list[1]}" var="field_567"/>
                                    <c:set value="${list[2]}" var="fieldStatus_567"/>
                                    <c:set value="${list[3]}" var="mand_status_567"/>
                                    <c:set value="${list[4]}" var="max_length_567"/>
                                </c:if>
                                <c:if test="${list[0] eq '570'}">
                                    <c:set value="${list[1]}" var="field_570"/>
                                    <c:set value="${list[2]}" var="fieldStatus_570"/>
                                    <c:set value="${list[3]}" var="mand_status_570"/>
                                    <c:set value="${list[4]}" var="max_length_570"/>
                                </c:if>
                                <c:if test="${list[0] eq '571'}">
                                    <c:set value="${list[1]}" var="field_571"/>
                                    <c:set value="${list[2]}" var="fieldStatus_571"/>
                                    <c:set value="${list[3]}" var="mand_status_571"/>
                                    <c:set value="${list[4]}" var="max_length_571"/>
                                </c:if>
                                <c:if test="${list[0] eq '572'}">
                                    <c:set value="${list[1]}" var="field_572"/>
                                    <c:set value="${list[2]}" var="fieldStatus_572"/>
                                    <c:set value="${list[3]}" var="mand_status_572"/>
                                    <c:set value="${list[4]}" var="max_length_572"/>
                                </c:if>

                                <c:if test="${list[0] eq '573'}">
                                    <c:set value="${list[1]}" var="field_573"/>
                                    <c:set value="${list[2]}" var="fieldStatus_573"/>
                                    <c:set value="${list[3]}" var="mand_status_573"/>
                                    <c:set value="${list[4]}" var="max_length_573"/>
                                </c:if>
                                <c:if test="${list[0] eq '574'}">
                                    <c:set value="${list[1]}" var="field_574"/>
                                    <c:set value="${list[2]}" var="fieldStatus_574"/>
                                    <c:set value="${list[3]}" var="mand_status_574"/>
                                    <c:set value="${list[4]}" var="max_length_574"/>
                                </c:if>
                                <c:if test="${list[0] eq '575'}">
                                    <c:set value="${list[1]}" var="field_575"/>
                                    <c:set value="${list[2]}" var="fieldStatus_575"/>
                                    <c:set value="${list[3]}" var="mand_status_575"/>
                                    <c:set value="${list[4]}" var="max_length_575"/>
                                </c:if>
                                <c:if test="${list[0] eq '576'}">
                                    <c:set value="${list[1]}" var="field_576"/>
                                    <c:set value="${list[2]}" var="fieldStatus_576"/>
                                    <c:set value="${list[3]}" var="mand_status_576"/>
                                    <c:set value="${list[4]}" var="max_length_576"/>
                                </c:if>
                                <c:if test="${list[0] eq '577'}">
                                    <c:set value="${list[1]}" var="field_577"/>
                                    <c:set value="${list[2]}" var="fieldStatus_577"/>
                                    <c:set value="${list[3]}" var="mand_status_577"/>
                                    <c:set value="${list[4]}" var="max_length_577"/>
                                </c:if>
                                <c:if test="${list[0] eq '578'}">
                                    <c:set value="${list[1]}" var="field_578"/>
                                    <c:set value="${list[2]}" var="fieldStatus_578"/>
                                    <c:set value="${list[3]}" var="mand_status_578"/>
                                    <c:set value="${list[4]}" var="max_length_578"/>
                                </c:if>
                                <c:if test="${list[0] eq '579'}">
                                    <c:set value="${list[1]}" var="field_579"/>
                                    <c:set value="${list[2]}" var="fieldStatus_579"/>
                                    <c:set value="${list[3]}" var="mand_status_579"/>
                                    <c:set value="${list[4]}" var="max_length_579"/>
                                </c:if>
                                <c:if test="${list[0] eq '580'}">
                                    <c:set value="${list[1]}" var="field_580"/>
                                    <c:set value="${list[2]}" var="fieldStatus_580"/>
                                    <c:set value="${list[3]}" var="mand_status_580"/>
                                    <c:set value="${list[4]}" var="max_length_580"/>
                                </c:if>
                                <c:if test="${list[0] eq '585'}">
                                    <c:set value="${list[1]}" var="field_585"/>
                                    <c:set value="${list[2]}" var="fieldStatus_585"/>
                                    <c:set value="${list[3]}" var="mand_status_585"/>
                                    <c:set value="${list[4]}" var="max_length_585"/>
                                </c:if>
                                <c:if test="${list[0] eq '603'}">
                                    <c:set value="${list[1]}" var="field_603"/>
                                    <c:set value="${list[2]}" var="fieldStatus_603"/>
                                    <c:set value="${list[3]}" var="mand_status_603"/>
                                    <c:set value="${list[4]}" var="max_length_603"/>
                                </c:if>

                            </c:forEach> 


                            <c:forEach items="${approvList}" var="type">                    
                                <c:set var="requisitionNo" value="${type.requisitionNo}"/>
                                <c:set var="requiOnDate" value="${type.requiOnDate}"/>
                                <c:set var="assetCategory" value="${type.assetCategory}"/>                                           
                                <c:set var="paymentTerms" value="${type.paymentTerms}"/>
                                <c:set var="remarks" value="${type.remarks}"/>                              
                                <c:set var="deliveryLocation" value="${type.deliveryLocation}"/>
                                <c:set var="remarks" value="${type.remarks}"/>
                            </c:forEach>
                            <div class="col-md-6 col-xs-12">
                                <div class="x_panel">                             
                                    <jsp:include page="../login/headerlink.htm?submodule=Purchase Order&tab=Purchase Order&pagetype=form"/>
                                    <div class="x_title">
                                        <h2>
                                            Purchase Order
                                        </h2>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <c:if test="${fieldStatus_554 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_554 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if> 
                                                <label class="control-label" for="selectError">${field_554}</label>

                                                <c:choose>
                                                    <c:when test="${fn:length(purchList) > 0}">
                                                        <c:forEach items="${purchList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="hidden" class="form-control"  readonly="" id="requisitionNo" name="requisitionNo" value="${requisitionNo}">
                                                                    <input type="hidden" class="form-control"  readonly="" id="poNo" name="poNo" value="${list.poNo}">
                                                                    <input name="status" type="hidden" value="${type.status}">
                                                                    <input class="form-control  input-xlarge" ${mand_status_554} name="reqDate" id="reqDate" readonly="" type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.reqDate}"/>" > 
                                                                </c:when>
                                                                <c:otherwise>

                                                                    <input type="hidden" class="form-control"  readonly="" id="poNo"  value="${list.poNo}">
                                                                    <input class="form-control  input-xlarge" ${mand_status_554} readonly type="text" value="${requiOnDate}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="hidden"  class="form-control" readonly=""  placeholder="PO-" name="poNo" id="poNo" value="">
                                                        <input name="status" type="hidden" value="">
                                                        <input name="subAssetCode" type="hidden" value="">
                                                        <input name="assetCode" type="hidden" value="">
                                                        <input type="hidden" class="form-control"  readonly="" id="requisitionNo" name="requisitionNo" value="${requisitionNo}">
                                                        <input name="action" type="hidden" value="">
                                                        <input class="form-control  input-xlarge" ${mand_status_554} id="reqDate" name="reqDate" readonly="" type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${requiOnDate}"/>">                                                    
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>

                                        <c:if test="${fieldStatus_555 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_555 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if> 
                                                <label class="control-label" for="selectError">${field_555}</label>

                                                <c:choose>
                                                    <c:when test="${fn:length(purchList) > 0}">
                                                        <c:forEach items="${purchList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">

                                                                    <input class="form-control  input-xlarge" ${mand_status_555} name="poDate" id="poDate" readonly="" type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.poDate}"/>"  onclick="NewCssCal('poDate', 'ddMMMyyyy', '', '', '', '', 'future');" > 
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input class="form-control  input-xlarge" ${mand_status_555} readonly type="text" value="">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input class="form-control  input-xlarge" ${mand_status_555} id="poDate" name="poDate" placeholder="Select Date" readonly="" type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="<%=date%>"/>">                                                    
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>


                                        <c:if test="${fieldStatus_565 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_565 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if> 
                                                <label class="control-label" for="selectError">${field_565}</label>

                                                <c:choose>
                                                    <c:when test="${fn:length(purchList) > 0}">
                                                        <c:forEach items="${purchList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">

                                                                    <input class="form-control  input-xlarge" ${mand_status_565} name="requiredDate" id="requiredDate" readonly="" type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.requiredDate}"/>"  onclick="NewCssCal('requiredDate', 'ddMMMyyyy', '', '', '', '', 'future');" > 
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input class="form-control  input-xlarge" ${mand_status_565} readonly type="text" value="">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input class="form-control  input-xlarge" ${mand_status_565} id="requiredDate" name="requiredDate" placeholder="Select Date" readonly="" type="text"  onclick="NewCssCal('requiredDate', 'ddMMMyyyy', '', '', '', '', 'future');">                                                    
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <p>&nbsp;</p>
                                        <c:if test="${fieldStatus_556 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_556 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if> 
                                                <label class="control-label" for="selectError">${field_556}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(purchList) > 0}">
                                                        <c:forEach items="${purchList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">                                                                    
                                                                    <textarea   class="form-control" rows="1" ${mand_status_556} maxlength="${max_length_556}" style="resize: none;" name="deliveryLoc">${type.deliveryLoc}</textarea>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <textarea  class="form-control" rows="1" ${mand_status_556} maxlength="${max_length_556}" style="resize: none;" readonly>${deliveryLocation}</textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <textarea class="form-control  input-xlarge" rows="1" ${mand_status_556} maxlength="${max_length_556}"   style="resize: none;" readonly=""  id="deliveryLoc" name="deliveryLoc" type="text" value="" >${deliveryLocation}</textarea>                                                  
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_603 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_603 eq 'required'}">
                                                    <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                </c:if> 
                                                <label class="control-label" for="selectError">${field_603}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(purchList) > 0}">
                                                        <c:forEach items="${purchList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">                                                                    
                                                                    <textarea   class="form-control" rows="1" ${mand_status_603} maxlength="${max_length_603}" style="resize: none;" name="remarks">${remarks}</textarea>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <textarea  class="form-control" rows="1" ${mand_status_603} maxlength="${max_length_603}" style="resize: none;" readonly>${remarks}</textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <textarea class="form-control  input-xlarge" rows="1" ${mand_status_603} maxlength="${max_length_603}"   style="resize: none;" readonly=""  id="remarks" name="remarks" type="text" value="" >${remarks}</textarea>                                                  
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_557 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_557 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if> 
                                                <label class="control-label" for="selectError">${field_557}</label>

                                                <c:choose>
                                                    <c:when test="${fn:length(purchList) > 0}">
                                                        <c:forEach items="${purchList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">                                                                    
                                                                    <textarea   class="form-control" rows="1" style="resize: none;" maxlength="300" name="billToLoc">${type.billToLoc}</textarea>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <textarea  class="form-control" rows="1" style="resize: none;" readonly></textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <textarea class="form-control  input-xlarge" rows="1" required   style="resize: none;" maxlength="300"  id="billToLoc" name="billToLoc" type="text" value="" ></textarea>                                                  
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <p>&nbsp;</p>
                                        <c:if test="${fieldStatus_585 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_585 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>   
                                                </c:if>                                          
                                                <label class="control-label ">${field_585}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(contCreat) > 0}">
                                                        <c:forEach items="${contCreat}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <!--                                                                    <label class="control-label" ></label>-->
                                                                    <select  name="SuppType" id="SuppType"    ${mand_status_585} class="form-control validate[required]" >
                                                                        <option selected="" disabled="">${list.contStatus}</option>
                                                                        <option value="Final Quotation">Final Quotation</option> 
                                                                        <option value="Supplier Master">Supplier Master</option> 
                                                                    </select> 

                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" ${mand_status_585} readonly="" name="SuppType" value="${list.SuppType}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <select  id="SuppType"   ${mand_status_585}   required="" class="form-control validate[required]">
                                                            <option value="" disabled selected>Select your option</option>
                                                            <option value="Final Quotation">Final Quotation</option> 
                                                            <option value="Supplier Master">Supplier Master</option> 
                                                        </select> 
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if> 

                                        <c:if test="${fieldStatus_558 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_558 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if>                                          
                                                <label class="control-label ">${field_558}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(purchList) > 0}">
                                                        <c:forEach items="${purchList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text"  class="form-control" ${mand_status_558} id="supplierName"  readonly="" onclick="selectCompany();" style="cursor: pointer;resize: none;" name="supplierName" value="">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text"  class="form-control" ${mand_status_558} id="supplierName"  readonly=""  style="cursor: pointer;resize: none;" name="supplierName" value="">

                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text"  class="form-control" ${mand_status_558} id="supplierName" required="" Placeholder="Select Supplier" readonly="" onclick="selectSupplier();" style="cursor: pointer;resize: none;" name="supplierName">
                                                        <input id="supplierCode" name="supplierCode" type="hidden">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>

                                        </c:if>


                                        <c:if test="${fieldStatus_560 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_560 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if> 
                                                <label class="control-label" for="selectError">${field_560}</label>

                                                <c:choose>
                                                    <c:when test="${fn:length(purchList) > 0}">
                                                        <c:forEach items="${purchList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">                                                                    
                                                                    <textarea   class="form-control" rows="1"   style="resize: none;" name="supplierAddress">${type.supplierAddress}</textarea>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <textarea  class="form-control" rows="1" style="resize: none;" readonly></textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <textarea class="form-control  input-xlarge" rows="1"  placeholder=""  style="resize: none;" readonly=""  id="supplierAddress" name="supplierAddress" type="text" value="" ></textarea>                                                  
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <p>&nbsp;</p>
                                        <c:if test="${fieldStatus_561 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_561 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if>                                          
                                                <label class="control-label ">${field_561}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(purchList) > 0}">
                                                        <c:forEach items="${purchList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text"  class="form-control" ${mand_status_561} id="supplierContactNo"  readonly=""  style="cursor: pointer;resize: none;" name="supplierContactNo" value="${list.supplierContactNo}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text"  class="form-control" ${mand_status_561} id="supplierContactNo"  readonly=""  style="cursor: pointer;resize: none;" name="supplierContactNo" value="">

                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text"  class="form-control" ${mand_status_561} id="supplierContactNo" placeholder="" readonly=""  style="cursor: pointer;resize: none;" name="supplierContactNo">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>

                                        </c:if>

                                        <c:if test="${fieldStatus_562 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_561 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if>                                          
                                                <label class="control-label ">${field_562}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(purchList) > 0}">
                                                        <c:forEach items="${purchList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text"  class="form-control" ${mand_status_561} id="supplierMailId"  readonly=""  style="cursor: pointer;resize: none;" name="supplierMailId" value="${list.supplierMailId}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text"  class="form-control" ${mand_status_561} id="supplierMailId"  readonly=""  style="cursor: pointer;resize: none;" name="supplierMailId" value="">

                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text"  class="form-control" ${mand_status_561} id="supplierMailId" placeholder="" readonly=""  style="cursor: pointer;resize: none;" name="supplierMailId">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>

                                        </c:if>

                                        <c:if test="${fieldStatus_578 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_578 eq 'required'}">
                                                    <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                </c:if>                                          
                                                <label class="control-label ">${field_578}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(purchList) > 0}">
                                                        <c:forEach items="${purchList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text"  class="form-control"  id="paymentTerms"  readonly="" maxlength="100" name="paymentTerms" value="${list.paymentTerms}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text"  class="form-control"  id="paymentTerms"  readonly=""  name="paymentTerms" value="">

                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text"  class="form-control"  id="paymentTerms" maxlength="100"  name="paymentTerms">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>

                                        </c:if>
                                        <p>&nbsp;</p>
                                        <c:if test="${fieldStatus_579 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_579 eq 'required'}">
                                                    <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                </c:if>                                          
                                                <label class="control-label ">${field_579}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(purchList) > 0}">
                                                        <c:forEach items="${purchList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text"  class="form-control"  id="delvryTerms"  readonly="" maxlength="100" name="delvryTerms" value="${list.delvryTerms}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text"  class="form-control"  id="delvryTerms"  readonly=""   name="delvryTerms" value="">

                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text"  class="form-control"  id="delvryTerms" maxlength="100" name="delvryTerms">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>

                                        </c:if>

                                        <c:if test="${fieldStatus_580 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_580 eq 'required'}">
                                                    <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                </c:if>                                          
                                                <label class="control-label ">${field_580}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(purchList) > 0}">
                                                        <c:forEach items="${purchList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">

                                                                    <textarea name="remarks" class="form-control"  rows="1" style="resize: none">${list.remarks}</textarea>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <textarea readonly="" class="form-control"  name="remarks" rows="1" style="resize: none"></textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <textarea name="remarks" class="form-control"  rows="1" style="resize: none"></textarea>
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>

                                        </c:if>

                                        <div class="clearfix"></div>
                                        <p>&nbsp;</p>                                  
                                        <c:if test="${SNo eq null}">
                                            <div class="clearfix"></div>
                                            <div style="overflow: scroll;height: auto;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">

                                                <table id="example" class="table table-striped responsive-utilities jambo_table">
                                                    <thead>
                                                        <tr>
                                                            <th style=" ">Action</th>
                                                            <th style=" "><span style="color: red">*</span>Accessory Category</th>                                                            
                                                            <th style=" "><span style="color: red">*</span>Accessory Name</th>
                                                            <th style=" "><span style="color: red">*</span>Quantity</th>
                                                            <th style=" "><span style="color: red">*</span>Uom</th>                                                            
                                                            <th style=" "><span style="color: red">*</span>Unit Price</th>
                                                            <th style=" "><span style="color: red">*</span>Total Price</th>
                                                        </tr>

                                                    </thead>

                                                    <tbody id="resourcetable">

                                                        <c:forEach items="${approvList}" var="type">                                                          
                                                            <tr class="item-row"> 
                                                                <td align="center" onclick=""><button type="button" id=""><i class="fa fa-trash fa-lg-o"></i></button></td> 
                                                                <td><c:forEach items="${itemCod}" var="list">
                                                                        <c:if test="${list.itemCode eq type.itemCode}">
                                                                            <c:set var="itmNam" value="${list.itemName}"></c:set>
                                                                            <c:set var="itmDesc" value="${list.itemDesc}"></c:set>
                                                                            <c:set var="itmCod" value="${list.itemCode}"></c:set>

                                                                            <c:forEach items="${itemCat}" var="list1">
                                                                                <c:if test="${list1.categoryId eq list.itemCategory}">
                                                                                    <c:set var="itmCat" value="${list1.itemCategory}"></c:set>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                            <c:forEach items="${uom}" var="list2">
                                                                                <c:if test="${list2.uomId eq list.itemUom}">
                                                                                    <c:set var="itmUom" value="${list2.uomName}"></c:set>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <input class="form-control" style="text-align: left;" name="itemCategory" id="itemCategory" readonly autocomplete="off" type="text" maxlength="30" value="${itmCat}"></td>
                                                                <td><input type="hidden" id="sno"  name="sno" value=""/>
                                                                    <input type="hidden" id="itemCode"  name="itemCode" value="${itmCod}"/>
                                                                    <input type="hidden" id="itemDesc"  name="itemDesc" value="${itmDesc}"/>
                                                                    <input class="form-control" style="text-align: left;" name="itemName" id="itemName" readonly="" autocomplete="off" type="text" maxlength="30" value="${itmNam}"></td>
                                                                <td><input class="form-control" style="text-align: right;"  name="qty" id="qty${type.sno}" readonly autocomplete="off" type="text" maxlength="30" value="${type.quantity}" ></td>
                                                                <td><input class="form-control" style="text-align: left;" name="uom" id="uom" readonly autocomplete="off" type="text" maxlength="30" value="${itmUom}"></td>
                                                                <td><input class="form-control" style="text-align: right;" required="" name="price" id="price${type.sno}"  autocomplete="off" type="text" min="8" maxlength="11" value="" onchange="Caltotal(this,${type.sno});" onkeypress="return check_digit(event, this, 10, 2);"> 
                                                                <td><input class="form-control" style="text-align: right;"  name="totalPrice" id="totalPrice${type.sno}" readonly="" autocomplete="off" type="text" value=""> 
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>


                                                    <script>
                                                        function uom(id) {
                                                            var uom1;
                                                            var uom2;
                                                            var priority = document.getElementById('priority').value;
                                                            if (priority == 'LOW') {
                                                                uom1 = 'MEDIUM';
                                                                uom2 = 'HIGH';
                                                            } else if (priority == 'MEDIUM') {
                                                                uom1 = 'LOW';
                                                                uom2 = 'HIGH';
                                                            } else {
                                                                uom1 = 'LOW';
                                                                uom2 = 'MEDIUM';
                                                            }
                                                            ('#' + id + '').val($(('#' + id + '')).append(new Option(uom1, uom1), new Option(uom2, uom2)));

                                                        }

                                                        function uomdisplay(c, slNo)
                                                        {
                                                            $.ajax({
                                                                type: "POST",
                                                                url: "../purchReq/uomlist.htm",
                                                                data: {code: c},
                                                                success: function (data) {
//                                                                    alert(data);
                                                                    //                        
                                                                    $('#requisitionUom' + slNo).html("");

                                                                    var nameArray = data.split(",");
                                                                    var toAppend = '';

                                                                    // toAppend += '<option value="">Select an Option</option>';                                                                   
//                                                                    for (var i = 0; i < nameArray.length; i++) {
                                                                    if (nameArray[0] != "") {
                                                                        toAppend += '<option value=' + '1' + '-' + nameArray[0] + '>' + nameArray[0] + '</option>';
                                                                    }
                                                                    if (nameArray[1] != "" && nameArray[1] !== 'null') {
                                                                        toAppend += '<option value=' + nameArray[4] + '-' + nameArray[1] + '>' + nameArray[1] + '</option>';

                                                                    }
                                                                    if (nameArray[2] != "" && nameArray[2] !== 'null') {
                                                                        toAppend += '<option value=' + nameArray[5] + '-' + nameArray[2] + '>' + nameArray[2] + '</option>';
                                                                    }
                                                                    if (nameArray[3] != "" && nameArray[3] !== 'null') {
                                                                        toAppend += '<option value=' + nameArray[6] + '-' + nameArray[3] + '>' + nameArray[3] + '</option>';
                                                                    }

//                                                                    }
                                                                    $('#requisitionUom' + slNo).append(toAppend);
                                                                },
                                                                error: function (error) {
                                                                    alert(error);
                                                                }

                                                            });
                                                        }

                                                        function unitPrice(c, slNo, suppCode)
                                                        {
                                                            $.ajax({
                                                                type: "POST",
                                                                url: "../purchReq/unitPrice.htm",
                                                                data: {
                                                                    code: c,
                                                                    suppCode: suppCode
                                                                },
                                                                success: function (data) {
                                                                    //                                                                    alert(data);   
                                                                    $('#unitPrice' + slNo).val(parseFloat(data));

                                                                },
                                                                error: function (error) {
                                                                    alert(error);
                                                                }

                                                            });
                                                        }


                                                        function checkGrid() {
                                                            //alert("kjjk");
                                                            var table = document.getElementById("resourcetable");
                                                            var slNo = table.rows.length - 1;
                                                            if (slNo < 0) {
                                                                alert("Please add data in grid");
                                                                return false;
                                                            } else {

                                                                var x = document.getElementById('poDate').value &&
                                                                        document.getElementById('requiredDate').value &&
                                                                        document.getElementById('deliveryLoc').value &&
                                                                        document.getElementById('billToLoc').value &&
                                                                        document.getElementById('supplierName').value &&
                                                                        document.getElementById('supplierAddress').value &&
                                                                        document.getElementById('supplierContactNo').value &&
                                                                        document.getElementById('supplierMailId').value &&
                                                                        document.getElementById('price').value &&
                                                                        document.getElementById('SuppType').value;

                                                                if (x)
                                                                {
                                                                    return true;
                                                                } else {
                                                                    alert("Please Enter mandatory fields");
                                                                    return false;
                                                                }
                                                            }
                                                        }


                                                    </script>
                                                </table>                        
                                            </c:if>
                                        </div>
                                        <br/>
                                        <div class="x_panel">
                                            <ul class="nav nav-tabs" >                           
                                                <li class="active"><a href="#">Additional Documents</a></li>
                                            </ul>
                                            <div id="tag3"><jsp:include page="../purchase/additionalDocumentsForm.htm?requisitionNo=${requisitionNo}"></jsp:include></div>
                                            </div>
                                            <p>&nbsp;</p>
                                            <table id="" class="table table-striped responsive-utilities jambo_table" style="">
                                                <thead >
                                                    <tr class="headings">     
                                                        <th >Role</th>
                                                        <!--                                                    <th >Name</th>-->
                                                        <th >Date</th>
                                                        <th >Remarks</th>
                                                    </tr>      
                                                </thead>        
                                                <tbody> 
                                                <c:forEach items="${approvList}" var="list">
                                                    <c:set var="approvar1Remark" value="${list.approvar1Remark}"/>
                                                    <c:set var="approvar2Remark" value="${list.approvar2Remark}"/>
                                                    <c:set var="approvar3Remark" value="${list.approvar3Remark}"/> 
                                                    <c:set var="userId" value="${list.userId}"/> 
                                                    <c:set var="lastmodifiedDate" value="${list.lastmodifiedDate}"/> 
                                                </c:forEach> 
                                                <c:if test="${approvar1Remark ne null}">
                                                    <tr>
                                                        <td class="center" style="text-align: left;"><b>Account Manager</b></td>

                                                        <td class="center" style="text-align: left;"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${lastmodifiedDate}" /></td>
                                                        <td class="center" style="text-align: left;">${approvar1Remark}</td>
                                                    </tr>
                                                </c:if>
                                                <c:if test="${approvar2Remark ne null}">
                                                    <tr>
                                                        <td class="center" style="text-align: left;"><b>GFC</b></td>

                                                        <td class="center" style="text-align: left;"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${lastmodifiedDate}" /></td>
                                                        <td class="center" style="text-align: left;">${approvar2Remark}</td>
                                                    </tr>
                                                </c:if>
                                                <c:if test="${approvar3Remark ne null}">
                                                    <tr>
                                                        <td class="center" style="text-align: left;"><b>CFO</b></td>

                                                        <td class="center" style="text-align: left;"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${lastmodifiedDate}" /></td>
                                                        <td class="center" style="text-align: left;">${approvar3Remark}</td>
                                                    </tr>
                                                </c:if>

                                            </tbody>
                                        </table>
                                        <c:if test="${action ne 'view'}">

                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">

                                                <button type="submit" class="btn btn-primary" style="" >Save</button>
                                                <a href="../purchase/poList.htm"><button type="button" class="btn btn-danger" style="">Cancel</button></a> 

                                            </div>

                                        </c:if>

                                        <br/>

                                    </div> 
                                </div>
                            </div>
                        </form>
                    </div>


                </div>

            </div>
        </div>

        <script>
            $(document).ready(function () {
            });
            function  getItemSubCat() {

                var itemCat = document.getElementById("itemCat").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../itemmaster/getItemSubCat.htm',
                            data: {
                                itemCat: itemCat
                            },
                            success: function (data) {
                                //alert(data);
                                displayitmSubCat(data);
                                $('#itemsubCat').val(data);
                            }
                        });

            }


            function displayitmSubCat(data)
            {
                if (data != null)
                {

                    $('#itemsubCat').html("");

                    var nameArray = data.split(",");
                    var toAppend = '';

                    toAppend += '<option value="">Select an Option</option>';
                    for (var i = 0; i < nameArray.length; i++) {
                        toAppend += '<option>' + nameArray[i] + '</option>';
                    }
                    $('#itemsubCat').append(toAppend);

                }
                else {
                    alert("error");
                }

            }

            function isNumberKey(evt) {
                debugger;
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if (charCode == 46 && evt.srcElement.value.split('.').length > 1) {
                    return false;
                }
                if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
                    return false;
                return true;
            }

            var grandTotal = 0.0;
            function calTotal(sno)
            {
                var qty = $('#qty' + sno).val();
                var unitPrice = $('#unitPrice' + sno).val();
                var convFact = $('#requisitionUom' + sno).val();
                var conVal = convFact.split("-");
                if (qty == "0")
                {
                    alert("Invalid Quantity...!!");
                    $('#qty' + sno).val('');
                    $('#totalPrice' + sno).val('');
                    return false;

                }
                if (qty != '' && qty != null)
                {
                    var price = parseFloat(qty) * parseFloat(unitPrice) / parseFloat(conVal[0]);
                    $('#totalPrice' + sno).val(parseFloat(price).toFixed(3));
                }

            }

        </script>
        <script type="text/javascript">


            var myWindow = null;
            function openWindow() {

                myWindow = window.open("../purchReq/deliveryLocPopUp.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function selectSupplier() {
                var a = document.getElementById("SuppType").value;
                //alert(a);

                if (a == 'Supplier Master')
                {

                    myWindow = window.open("../purchase/selectSupplier.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");

                }
                else if (a == 'Final Quotation')
                {
                    myWindow = window.open("../purchase/selectSupplier1.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                }
                else if (a == '')
                {
                    alert("Please Select Supplier From");
                    return false;
                }

            }



            function parent_disable() {
                if (myWindow && !myWindow.closed)
                    myWindow.focus();
            }


            jQuery(document).ready(function () {
                //jQuery("#schDetForm").validationEngine();
            });

            function selectdate(val) {

                NewCssCal(val, 'ddMMMyyyy', 'dropdown', true, '12', '', 'future');
                //$('#test').attr();
                //document.getElementById("hiddentr").value=$itemRow.index();

            }

            function test() {
                var table = document.getElementById("resourcetable");
                var slNo = table.rows.length - 1;
                if (slNo < 0) {
                    alert("Please add data in grid");
                    return false;
                } else {
                    return true;
                }
                //alert(slNo);
            }

            function Caltotal($this, sno)
            {

                // alert("hjgh");
                var $itemRow = $($this).closest('tr');
                var qty = $itemRow.find('#qty' + sno).val();
                //alert(qty);
                var price = $itemRow.find('#price' + sno).val();
                //alert(price);
                // var convFact = $('#requisitionUom' + sno).val();
                // var conVal = convFact.split("-");
                if (price == '0')
                {
                    alert("Invalid Price...!!");
                    $('#price' + sno).val('');
                    return false;

                }
                if (price != '' && price != null)
                {
                    var total = parseFloat(qty) * parseFloat(price);
                    if (isNaN(total) == true)
                    {
                        $('#total' + sno).val = '0';
                    }
                    else
                    {
                        $('#totalPrice' + sno).val(parseFloat(total).toFixed(3));
                    }

                }
            }

            function myFunction1(val) {

                var div3 = document.getElementById('editable2');
                var div4 = document.getElementById('noneditable2');
                if (val == 'yes') {
                    $("#editable2 :input").attr("disabled", false);
                    $("#noneditable2 :input").attr("disabled", true);
                    div4.style.display = "none";
                    div3.style.display = "block";
                    return false;

                }

            }

            function myFunction2(val) {
                var div5 = document.getElementById('editable2');
                var div6 = document.getElementById('noneditable2');
                if (val == 'No') {
                    $("#editable2 :input").attr("disabled", true);
                    $("#noneditable2 :input").attr("disabled", false);
                    div5.style.display = "none";
                    div6.style.display = "block";
                    return false;

                }

            }

            function check_digit(e, obj, intsize, deczize) {
                var keycode;

                if (window.event)
                    keycode = window.event.keyCode;
                else if (e) {
                    keycode = e.which;
                }
                else {
                    return true;
                }

                var fieldval = (obj.value),
                        dots = fieldval.split(".").length;

                if (keycode == 46) {
                    return dots <= 1;
                }
                if (keycode == 8 || keycode == 9 || keycode == 46 || keycode == 13) {
                    // back space, tab, delete, enter 
                    return true;
                }
                if ((keycode >= 32 && keycode <= 45) || keycode == 47 || (keycode >= 58 && keycode <= 127)) {
                    return false;
                }
                if (fieldval == "0" && keycode == 48) {
                    return false;
                }
                if (fieldval.indexOf(".") != -1) {
                    if (keycode == 46) {
                        return false;
                    }
                    var splitfield = fieldval.split(".");
                    if (splitfield[1].length >= deczize && keycode != 8 && keycode != 0)
                        return false;
                } else if (fieldval.length >= intsize && keycode != 46) {
                    return false;
                } else {
                    return true;
                }
            }

        </script>
        <script>
            NProgress.done();
        </script>

        <script src="../CRM/scripts/general-attach-script.js" type="text/javascript"></script>
        <script src="../CRM/scripts/mioinvoice-attach-script.js" type="text/javascript"></script>

    </body>

</html>
