<%-- 
    Document   : purchmngForm
    Created on : Feb 23, 2016, 3:24:29 PM
    Author     : Nataraj
--%>

<%@page import="java.util.Date"%>
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
</head>


<body class="nav-md">
    <%
    Date date = new Date();
%>
        <jsp:include page="../login/menu.htm" />


        <main id="main" class="main">
            <div>
                <jsp:include page="../login/headerlink.htm?submodule=Purchase Order&tab=Purchase Manager&pagetype=form"/>
            </div>
            <div class="pagetitle">

            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h5>  Purchase Order</h5>
                                </div>
                                <form id="pomngform" class="form-inline" method="post" action="../purchase/statusUpdate.htm" enctype="multipart/form-data">


                                    <div class="x_panel">                             
                                        
        
                                        <c:set var="m" value="0"/>
                                        <c:forEach items="${poList}" var="list">
        
                                            <c:set var="prCode" value="${list.projectCode}"/>
                                            <c:set var="poRevNo" value="${list.poRevNo}"/>
                                            <c:set var="reqno" value="${list.prNo}"/>
                                            <c:set var="reqDate" value="${list.prDate}"/>                               
                                            <c:set var="supplierEmail" value="${list.supplierEmail}"/>                                            
                                            <c:set var="quotationNo" value="${list.quotationNo}"/>
                                            <c:set var="quotationDate" value="${list.quotationDate}"/>
                                            <c:set var="deliveryLoc" value="${list.shipToLocation}"/>
                                            <c:set var="billToLocation" value="${list.billToLocation}"/>
                                            <c:set var="supcode" value="${list.supplierCode}"/>
                                            <c:set var="divisionName" value="${list.divisionName}"/>
                                            <c:set var="projectName" value="${list.projectName}"/>
                                            <c:set var="department" value="${list.department}"/>
                                            <c:set var="paymentTerms" value="${list.paymentTerms}"/>
                                            <c:set var="deliveryTerms" value="${list.deliveryTerms}"/>
                                            <c:set var="supname" value="${fn:escapeXml(list.supplierName)}"/>
                                            <c:set var="supadd" value="${list.supplierAddress}"/>
                                            <c:set var="potype" value="${list.importLocal}"/>
                                            <c:set var="currency" value="${list.currency}"/>
                                            <c:set var="poNote" value="${list.poNote}"/>
                                            <c:set var="purchaseOrderNo" value="${list.purchaseOrderNo}"/>
                                            <c:set var="purchaseOrderDate" value="${list.purchaseOrderDate}"/>
                                            <c:set var="purchaseType" value="${list.purchaseType}"/>
                                            <c:set var="warrantyPeriod" value="${list.warrantyPeriod}"/>
                                            <c:set var="userId" value="${list.userId}"/>
                                            <c:set var="remarks" value="${list.remarks}"/>
                                            <c:set var="lastmodifiedDate" value="${list.lastmodifiedDate}"/>
                                            <c:set var="lumsumDiscount" value="${list.lumsumDiscount}"/>
                                            <c:set var="costcenterCode" value="${list.costcenterCode}"/>
                                            <c:set var="costcenterDesc" value="${list.costcenterDesc}"/>
        
        
                                        </c:forEach>
                                        <c:forEach items="${supplierList}" var="supp">
                                            <c:if test="${supp.emailid eq supplierEmail}">
                                                <%--<c:set var="supname" value="${supp.supplierName}"/>--%>
                                                <%--<c:set var="supadd" value="${supp.supplierAddress}"/>--%>
                                                <%--<c:set var="supcode" value="${supp.supplierCode}"/>--%>
                                                <c:set var="supnumber" value="${supp.contNum}"/>
                                            </c:if>
                                        </c:forEach>
                                        <div class="x_content">
        
        
        
                                            <div class="row">
                                                <div class="col-md-4 col-sm-12 col-xs-12">
        
        
        
                                                    <div> <c:if test="${not empty poRevNo}">
                                                            <h5> <strong>Purchase Order No:</strong> ${poRevNo}</h5> 
                                                            <input type="hidden" name="poNo" value="${purchaseOrderNo}"/>  
                                                        </c:if>
                                                        <c:if test="${empty poRevNo}">
                                                            <h5> <strong>Purchase Order No:</strong> ${purchaseOrderNo}</h5> 
                                                            <input type="hidden" name="poNo" value="${purchaseOrderNo}"/>  
                                                        </c:if>                                                 
                                                        <input type="hidden" name="action" value="PM Approved"/>  
                                                    </div>
                                                    <div> <h5> <strong>Purchase Order Date:</strong> <fmt:formatDate pattern="dd-MMM-yyyy" value="${purchaseOrderDate}"/></h5> 
                                                        <input name="poDate" type="hidden" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${purchaseOrderDate}"/>" tabindex="-1"/>
        
                                                    </div>
        <!--                                            <div> <h5> <strong>Project Code:</strong> ${prCode}</h5> 
                                                        <input name="prCode" type="hidden" value="${prCode}" tabindex="-1"/>                                               
                                                    </div>-->
                                                    <div> <h5> <strong>Quotation No:</strong> ${quotationNo}</h5> 
                                                        <input name="quotationNo" type="hidden" value="${quotationNo}" tabindex="-1"/>
                                                        <input name="quotDate" type="hidden" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${quotationDate}"/>"/>
                                                    </div>
                                                    <div> <h5> <strong>Requisition No:</strong><c:forEach items="${reqNoList}" var="type"> 
                                                                <c:if test="${not empty type[0]}">
                                                                    ${type[0]},
                                                                </c:if>
                                                            </c:forEach> </h5> 
                                                        <input name="reqNo" type="hidden" value="${reqno}" tabindex="-1"/>
                                                    </div>
                                                    <div> <h5> <strong>Requisition Date:</strong> 
                                                            <c:forEach items="${reqNoList}" var="type"> 
                                                                <c:if test="${not empty type[1]}">
                                                                    <fmt:formatDate pattern="dd-MMM-yyyy" value="${type[1]}"/>,
                                                                </c:if>
                                                            </c:forEach>                                                     
                                                        </h5> 
                                                        <input name="reqDate" type="hidden" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${reqDate}"/>" tabindex="-1"/>
                                                    </div>
                                                </div>
                                                <div class="col-md-offset-6">
        <!--                                            <div> <h5> <strong>Division Name:</strong> ${divisionName}</h5>                                
                                                    </div>-->
                                                    <div>
                                                        <h5>   <strong style="padding-right: 8px;">Purchase Type:</strong> ${purchaseType}</h5>   
                                                    </div>
                                                    <div> <h5> <strong>Department Name:</strong> ${department}</h5>                                
                                                    </div>
                                                    <div> <h5> <strong>Project Name:</strong> ${projectName}</h5> 
        
                                                    </div> 
                                                </div>
        
                                            </div>
        
                                            <div> 
                                                <label class="control-label">PO Type:</label>
                                                <select disabled id="potype" name="potype" data-rel="chosen"  required="" class="form-control validate[required]">
                                                    <option value="${potype}">${potype}</option>  
                                                    <option value="Local">Local</option> 
                                                    <option value="Import">Import</option> 
                                                </select> 
                                            </div> &nbsp;
        
                                            <div > 
                                                <label class="control-label">Currency:</label>
                                                <select disabled id="currency" name="currency" data-rel="chosen" required="" class="form-control  validate[required]" >                                            
                                                    <option value="${currency}">${currency}</option> 
                                                    <c:forEach items="${currencyList}" var="list">
                                                        <option value="${list.currencyName}">${list.currencyName}</option> 
                                                    </c:forEach>
                                                </select>  
                                            </div>
                                            &nbsp;
                                            <%--<div>
                                                <label class="control-label"><span style="color: red">*</span> Cost Center</label>
                                                <select disabled id="costCenter" name="costCenter" data-rel="chosen"   class="form-control validate[required]">
                                                    <option value="${costcenterDesc}/${costcenterCode}">${costcenterDesc}/${costcenterCode}</option>  
                                                    <c:forEach items="${costCenterList}" var="type">
                                                        <option value="${type.costcenterCode}-${type.costcenterDesc}">${type.costcenterCode}-${type.costcenterDesc}</option>  
                                                    </c:forEach>
                                                </select>                                              
        
                                            </div>--%>
        
                                            <div class="x_title"></div>
                                            <div class="row">
        
                                                <div class="col-md-4 col-sm-12 col-xs-12">
                                                    <div class="pricing">
        
                                                        <div class="x_content">
                                                            <div class="">
                                                                <div class="pricing_features">
                                                                    <strong><div id="enduser">Supplier Details </div></strong><br/>
                                                                    <ul class="list-unstyled text-left">
                                                                        <input name="supName" id="suppName" value="${supname}" type="text" readonly="" class="form-control input-sm validate[required]" placeholder="Name" style="width:300px;">
        
                                                                        <input name="supaddress" id="suppAddress" value="${supadd}" type="text" readonly=""  class="form-control input-sm" placeholder="Address" style="width:300px;">
        
                                                                        <input name="suppPhone" id="suppPhone" value="${supnumber}" type="text" readonly=""  class="form-control input-sm" placeholder="Contact Number" style="width:300px;">
        
                                                                        <input name="supEmail" id="suppEmail" value="${supplierEmail}" type="text" readonly=""  class="form-control input-sm" placeholder="Email Id" style="width:300px;">
                                                                        <input name="supplierCode" id="suppId" value="${supcode}" type="hidden">
                                                                    </ul>
                                                                </div>
                                                            </div>
        
                                                        </div>
                                                    </div>
                                                </div>
        
        
                                                <div class="col-md-4 col-sm-12 col-xs-12">
                                                    <div class="pricing">
        
                                                        <div class="x_content">
                                                            <div class="">
                                                                <div class="pricing_features">
                                                                    <strong><div id="enduser">Bill To Location</div></strong><br/>
        
        
                                                                    <ul class="list-unstyled text-left">
                                                                        <textarea class="form-control input-sm" style="resize: none;width:300px;" name="billToAddress" readonly="">${billToLocation}</textarea>
        
                                                                    </ul>
                                                                </div>
                                                            </div>
        
                                                        </div>
                                                    </div>
                                                </div>
        
        
        
                                                <div class="col-md-4 col-sm-12 col-xs-12">
                                                    <div class="pricing">
        
                                                        <div class="x_content">
                                                            <div class="">
                                                                <div class="pricing_features">
                                                                    <strong><div id="enduser">Ship To / Delivery Location </div></strong><br/>
                                                                    <ul class="list-unstyled text-left">
        
                                                                        <textarea class="form-control input-sm" style="resize: none;width:300px;" name="deliveryLoc" readonly="">${deliveryLoc}</textarea>
                                                                    </ul>
                                                                </div>
                                                            </div>
        
                                                        </div>
                                                    </div>
        
                                                </div>
                                            </div>
                                        </div>
                                    </div>
        
        
                                    <div class="x_panel"> 
                                        <div class="x_content" style="overflow-x:  scroll;">
                                            <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                                <thead>
                                                    <tr class="headings">  
                                                        <!--<th><i class="fa fa-trash-o"></i></th>-->
                                                        <!--<th>Item Code</th>-->
                                                        <th style="width:10%;">Item Sub Category</th>
                                                        <th>Item Name</th>
                                                        <th>Item Desc</th>                                        
                                                        <th style="width:6%;"><span style="color: red">*</span> Quantity</th>
                                                        <th style="width:5%;">Unit</th>
                                                        <th style="width:8%;"><span style="color: red">*</span> Unit Price</th>
                                                        <th style="width:5%;">Total Amount</th>
                                                        <th style="width:5%;"><span style="color: red">*</span> Discount(%)</th>
                                                        <th style="width:5%;"><span style="color: red">*</span> Discount Amount</th>                                                 
                                                        <th style="width:10%;">Total Amount After Discount</th>     
                                                        <th style="width:8%;"><span style="color: red">*</span> Delivery Date</th>                                              
                                                    </tr>
                                                </thead>
        
                                                <tbody>
                                                    <c:set var="gtotal" value="0.0"/>
                                                    <c:set var="totalbefdisAmt" value="0.0"/>
                                                    <c:set var="totaldisAmt" value="0.0"/>
                                                    <c:forEach items="${poList}" var="type"> 
                                                        <tr id="quotPoForm" class="poadditem">
                                                            <!--<td><button  onclick="deleteRow(this);" ><i id="deleteRow" class="fa fa-trash-o"></i></button></td>-->
                                                            <td style="display: none">
                                                                <input type="hidden" name="pk" value="${type.SNo}"/>                                                        
                                                                <input type="hidden" name="prSno" value="${type.prSno}"/>
                                                                <input type="hidden" name="quotSno" value="${type.qtSno}"/> 
                                                                <input type="hidden" name="division" id="division" value="${type.divisionName}">
                                                                <input  name="prName" type="hidden" value="${type.projectName}">
                                                                <input type="hidden" id="unit"  name="unit" value="${type.uom}"/>                                                        
                                                                <input name="itemCat"  type="hidden" value="${type.itemCategory}"> 
                                                                <input name="itemsubCat"  id="itemsubCat"  type="hidden" value="${type.itemSubCategory}">                                                
                                                                <input  type="hidden" name="purchaseType" id="purchaseType" value="${type.purchaseType}">
                                                                <input type="hidden"  name="dept" value="${type.department}"> 
                                                                <input type="hidden"  name="status" value="${type.status}"> 
                                                                <!--${type.itemCode}-->
                                                                <input class="form-control" id="itemCode" name="itemCode"  type="hidden" value="${type.itemCode}">
                                                            </td>                                             
                                                            <td>${type.itemSubCategory}
                                                                <input class="form-control" id="itemDesc" name="itemDesc"  type="hidden" value="${fn:escapeXml(type.description)}"></td>
                                                            <td><a id="prevPO"  onmouseover="checkPrevPO(this, '${type.itemCode}');" style="cursor: pointer;color: #0067f9" >${type.itemName} 
                                                                    <table id="t01" border="1px" style="border-radius: 5px">
                                                                        <tr id="prevhead" style="color: #172D44"></tr>
                                                                        <tbody id="prevpolst" style="color: darkblue"></tbody>
        
                                                                    </table></a>
                                                                <input class="form-control" id="itemName" name="itemName"  type="hidden" readonly="" value="${fn:escapeXml(type.itemName)}"></td>  
                                                            <td>${type.description}</td>                                              
                                                            <td><input style="width: 100%;text-align:right;" class=" form-control input-mini validate[required,custom[notzero],custom[float5]]"  readonly="" autocomplete="off"  name="qty" id="qty" onkeypress="return check_digit(event, this, 10, 3);"  type="text" value="${type.qty}"></td>  
                                                            <td>${type.uom}
                                                                <select style="width: 100px;text-align:center;display: none"  id="requisitionUom" class="form-control input-sm validate[required]" readonly="" onpaste="return false" onchange="calTotal(this, '${slNo}')"  tabindex="7">
                                                                    <option value="${type.uom}">${type.uom}</option>
                                                                </select>
        
                                                            </td>
                                                            <td><input style="width: 100%;text-align:right;" class="form-control  input-mini validate[required,custom[notzero],custom[float5]]" readonly="" autocomplete="off"  onkeypress="return check_digit(event, this, 6, 3);" name="price" id="price" type="text" value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${type.unitPrice}"/>"></td>
                                                            <td><input style="text-align:right;width:100px;" class="form-control  input-mini  validate[required]" type="text" readonly onpaste="return false"  id="befdisc"  value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${type.qty*type.unitPrice}"/>" ></td>
                                                            <td><input style="width: 100%;text-align:right;" class="form-control  input-mini validate[required,custom[float5]]" readonly="" maxlength="6"  autocomplete="off" id="discount1" onkeypress="return check_digit(event, this, 2, 3);" type="text" value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${type.discount}"/>"> 
                                                                <input style="width: 70px;text-align:right;" readonly="" onpaste="return false" autocomplete="off" name="discount" id="discount" type="hidden" value="${type.discount}">
                                                            </td>
                                                            <td><input style="text-align:right;width:100px;" class="form-control  input-mini  validate[required,custom[float5]]" readonly="" type="text" onpaste="return false" autocomplete="off" name="discountPrice"  id="discountPrice" onkeypress="return check_digit(event, this, 10, 3);"  value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${(type.qty*type.unitPrice)*(type.discount/100)}"/>"></td>
        
                                                            <td>
        
                                                                <input style="width: 100%;text-align:right;" class="form-control  input-mini validate[required]" readonly="" id="total" name="total" type="text" value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${type.totalValue}"/>" readonly=""></td>
                                                            <td><input style="width: 100%;" class=" form-control input-small validate[required]" readonly=""  name="delDate" readonly="" id="${type.SNo}" type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.requiredDate}"/>" onclick="javascript:NewCssCal('${type.SNo}', 'ddMMMyyyy', '', '', '', '', 'future')" onchange="validateDate(this.value, '${type.itemCode}', '${type.SNo}')">
                                                                <input style="text-align:center;" readonly="" type="hidden" name="reqDateSno" id="reqDateSno" value="${type.SNo}"/></td>
        
                                                            <c:set value="${totalbefdisAmt + type.qty*type.unitPrice}" var="totalbefdisAmt"/> 
                                                            <c:set value="${totaldisAmt + (type.qty*type.unitPrice)*(type.discount/100)}" var="totaldisAmt"/>     
                                                            <c:set value="${gtotal + type.totalValue}" var="totalAmt"/>
                                                            <c:set value="${gtotal + type.totalValue}" var="gtotal"/> 
                                                        </tr>
                                                    </c:forEach>
                                                    <c:set value="${gtotal * (1-lumsumDiscount/100)}" var="grandtotal"/> 
                                                    <c:set  var="lumsumamt"  value="${totalAmt-grandtotal}"/>
        
        
                                                </tbody>
        
                                            </table>
        
                                        </div>
                                    </div>
        
        
        
                                    <div class="x_panel">
                                        <div class="row">
                                            <div class="col-sm-3">
        
                                                <label class="control-label">Payment Terms</label>
                                                <input class="form-control  input-mini" id="warranty" readonly="" name="payTerms" type="text" value="${paymentTerms}">
        
        
                                                <label class="control-label">Delivery Terms</label>
                                                <input class="form-control  input-mini" id="warranty" readonly="" name="delTerms" type="text" value="${deliveryTerms}" >
        
                                                <label class="control-label">Warranty Period</label>
                                                <input class="form-control  input-mini" id="warranty" readonly="" name="warranty" type="text" value="${warrantyPeriod}"  maxlength="50">
        
        
        
                                                <label class="control-label">PO Note:</label>
                                                <textarea class="form-control input-mini" required="" rows="3" style="resize: none" id="poNote" readonly=""  name="poNote" type="text" value="" maxlength="180">${poNote}</textarea>
        
                                            </div>
                                            <div class="col-md-offset-8 form-inline " > 
                                                <label class="control-label" style="font-size:  12px">Total Amount Before Discount:</label>
                                                <!--<span class="btn btn-sm">INR</span>-->                                    
                                                <input class="right form-control input-mini" style="font-weight: bold" readonly="" id="totalAmtBefDis" type="text" value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${totalbefdisAmt}"/>">                                   
                                            </div> 
                                            &nbsp;
                                            <div class="col-md-offset-8 form-inline " > 
                                                <label class="control-label" style="font-size:  12px">Total Discount Amount:</label>
                                                <!--<span class="btn btn-sm">INR</span>-->                                    
                                                <input class="right form-control input-mini" style="font-weight: bold" readonly="" id="totalDisAmt" type="text" value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${totaldisAmt}"/>">                                   
                                            </div> 
                                            &nbsp;
                                            <div class="col-md-offset-8 form-inline " > 
                                                <label class="control-label" style="font-size:  12px">Total Amount:</label>
                                                <!--<span class="btn btn-sm">INR</span>-->                                    
                                                <input class="right form-control input-mini" style="font-weight: bold" readonly="" id="totalAmt" type="text" value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${totalAmt}"/>">                                   
                                            </div> 
                                            &nbsp;
                                            <%--<div class="col-xs-offset-8 form-inline"> 
                                                <label class="control-label" style="font-size:  12px;" >Lumsum Discount(%):</label>--%>
                                                <!--<span class="btn btn-sm">INR</span>-->
                                                <%--<c:if test="${empty lumsumDiscount}">--%>
                                                <%--<c:set value="0.0" var="lumsumDiscount"/>--%>
                                                <%--</c:if>--%>
                                                <%--<input class="right form-control input-mini validate[custom[float5]]" readonly="" maxlength="6" style="width: 70px" autocomplete="off" style="font-weight: bold" onpaste="return false" onkeypress="return check_digit(event, this, 2, 3);" id="lumsumdiscount1"  type="text" value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${lumsumDiscount}"/>">
                                                <input class="right" id="lumsumdiscount" name="lumsumdiscount" autocomplete="off" type="hidden" value="${lumsumDiscount}">
        
                                            </div> &nbsp;
                                            <div class="col-xs-offset-8 form-inline"> 
                                                <label class="control-label" style="font-size:  12px;" >Lumsum Discount Amount:</label> 
                                                <input class="right form-control input-mini validate[custom[float5]]" readonly="" onpaste="return false"  autocomplete="off" style="font-weight: bold" onkeypress="return check_digit(event, this, 10, 3);" id="lumsumamt" type="text" value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${lumsumamt}"/>">
        
                                            </div> --%>&nbsp;
                                            <div class="col-md-offset-8 form-inline " > 
                                                <label class="control-label" style="font-size:  18px">Grand Total:</label>
                                                <!--<span class="btn btn-sm">INR</span>-->                                        
                                                <input class="right form-control input-mini" style="font-weight: bold" readonly="" id="grandTotal" name="grandTotal" type="text" value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${grandtotal}"/>">
                                                <input type="text" id="currCode" class="form-control input-mini" style="width: 50px" readonly="" value="${currency}">
                                            </div> 
        
                                        </div> 
        
                                        <p>&nbsp;</p>
        
                                        <div class="x_title">                       
                                            <div  style="text-align: center;text-transform:uppercase;"><h3 style="font-size:21px;">Approver Details</h3></div>
        
                                            <div class="clearfix">
        
                                            </div>                       
                                        </div>
        
                                        <div class="x_content">
                                            <table id="" class="table table-striped responsive-utilities jambo_table">
                                                <thead >
                                                    <tr class="headings">     
                                                        <th >Role</th>
                                                        <th >Name</th>
                                                        <th >Date</th>
                                                        <th >Remarks</th>
                                                    </tr>      
                                                </thead>        
                                                <tbody>                                             
                                                    <tr>
                                                        <td class="center" ><b>Requestor</b></td>
                                                        <td class="center">${userId}</td>
                                                        <td class="center"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${lastmodifiedDate}" /></td>
                                                        <td class="center">${poNote}</td>
                                                    </tr>
        
                                                </tbody>
                                            </table>         
        
                                        </div>
        
                                        <label class="control-label"><span style="color: red">*</span> Remarks:</label>
                                        <textarea class="form-control input-mini validate[required]"  style="resize: none" id="remarks"   name="remarks" type="text" value="" maxlength="180"></textarea>
        
                                        <p>&nbsp;</p>
        
        
                                        <br/>
        
                                        <div class="col-md-6 col-sm-4 col-xs-4 form-group">
                                            <p>&nbsp;</p>
                                            <!--<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">-->
                                            <!--<button type="button" class="btn btn-success" style=""  onclick="addOrderRow_test();"><i class="fa fa-plus-circle" style="font-size: 15px"></i> Add Item</button>-->
                                            <button type="submit" class="btn btn-primary" style="" name="commit" onclick="if (confirm('Do you really want to approve this record')) {
                                                        return true;
                                                    } else {
                                                        return false;
                                                    }">Save</button>
        <!--                                    <a href="../purchOrder/statusUpdate.htm?action=PM Recheck&poNo=${purchaseOrderNo}"></a> 
                                            <a href="../purchOrder/statusUpdate.htm?action=PM Rejected&poNo=${purchaseOrderNo}"></a> -->
                                            <button type="button" class="btn btn-warning" style="" onclick="recheck('${purchaseOrderNo}');">Recheck</button>
                                            <button type="button" class="btn btn-danger" style="" onclick="reject('${purchaseOrderNo}');">Reject</button>
                                            <a href="../purchase/POApproveList.htm"><button type="button" class="btn btn-danger" style="">Cancel</button></a> 
        
                                            <!--</div>-->
        
        
                                        </div>
        
                                        <br/>
        
        
        
                                        <div class="clearfix"></div>
        
        
        
                                    </div>
                                </form>
                                <div id="custom_notifications" class="custom-notifications dsp_none">
                                    <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
                                    </ul>
                                    <div class="clearfix"></div>
                                    <div id="notif-group" class="tabbed_notifications"></div>
                                </div>
                                <!--        <script src="../common/theme/js/datatables/js/jquery.dataTables.js"></script>-->
                    
                                <script>
                                    $(document).ready(function () {
                                        //gridEditArrowKey();
                                        $('#pomngform').validationEngine();
                                    });
                                </script>
                                <script>
                    //                jQuery(document).ready(function () {
                    //                    var inputval = '#qty, #discount,#price';
                    //                    $(inputval).on('keyup change click', function () {
                    //                        var gt = 0;
                    //                        var totalbefdisc = 0;
                    //                        var totaldiscAmt = 0;
                    //                        var $itemRow = $(this).closest('tr');
                    //                        var z = $itemRow.find('#qty').val();
                    //                        var zz = $itemRow.find('#price').val();
                    //                        var ccc = $itemRow.find('#discount').val();
                    //                        var lumsumdiscount = $('#lumsumdiscount').val();
                    //                        var convFact = $itemRow.find('#requisitionUom').val();
                    //                        var conVal = convFact.split("-");
                    //                        var befdiscount = $itemRow.find('#qty').val() * $itemRow.find('#price').val();
                    //                        $itemRow.find('#befdisc').val(parseFloat(befdiscount).toFixed(3));
                    //
                    //                        var discount = $itemRow.find('#qty').val() * $itemRow.find('#price').val() * (1 - $itemRow.find('#discount').val() / 100);
                    ////                        var discountfinal = roundNumber(discount, 2);
                    //                        var disPrice = parseFloat(befdiscount).toFixed(3) - parseFloat(discount).toFixed(3)
                    //                        $itemRow.find('#discountPrice').val(parseFloat(disPrice).toFixed(3));
                    //                        isNaN(discount) ? $itemRow.find('#total').val("N/A") : $itemRow.find('#total').val(parseFloat(discount).toFixed(3));
                    //                        $('tr#quotPoForm').each(function () {
                    //                            var $itemRow = $(this).closest('tr');
                    //                            var total = $itemRow.find('#total').val();
                    //                            var tbd = $itemRow.find('#befdisc').val();
                    //                            var tda = $itemRow.find('#discountPrice').val();
                    //                            totalbefdisc = parseFloat(tbd) + parseFloat(totalbefdisc);
                    //                            totaldiscAmt = parseFloat(tda) + parseFloat(totaldiscAmt);
                    //                            gt = parseFloat(total) + parseFloat(gt);
                    //                        });
                    //                        $('#totalAmtBefDis').val(parseFloat(totalbefdisc).toFixed(3));
                    //                        $('#totalDisAmt').val(parseFloat(totaldiscAmt).toFixed(3));
                    //                        $('#totalAmt').val(parseFloat(gt).toFixed(3));
                    //                        gt = gt * (1 - lumsumdiscount / 100)
                    //                        $('#grandTotal').val(parseFloat(gt).toFixed(3));
                    //
                    //
                    //                    });
                    //                    var inputval = '#requisitionUom';
                    //                    $(inputval).on('keyup change', function () {
                    //                        var gt = 0;
                    //                        var totalbefdisc = 0;
                    //                        var totaldiscAmt = 0;
                    //                        var $itemRow = $(this).closest('tr');
                    //                        var z = $itemRow.find('#qty').val();
                    //                        var zz = $itemRow.find('#price').val();
                    //                        var ccc = $itemRow.find('#discount').val();
                    //                        var lumsumdiscount = $('#lumsumdiscount').val();
                    //                        var convFact = $itemRow.find('#requisitionUom').val();
                    //                        var conVal = convFact.split("-");
                    //                        var befdiscount = $itemRow.find('#qty').val() * $itemRow.find('#price').val();
                    //                        $itemRow.find('#befdisc').val(parseFloat(befdiscount).toFixed(3));
                    //
                    //                        var discount = $itemRow.find('#qty').val() * $itemRow.find('#price').val() * (1 - $itemRow.find('#discount').val() / 100);
                    ////                        var discountfinal = roundNumber(discount, 2);
                    //                        $itemRow.find('#price').val("");
                    //                        var disPrice = parseFloat(befdiscount).toFixed(3) - parseFloat(discount).toFixed(3)
                    //
                    //                        $itemRow.find('#discountPrice').val(parseFloat(disPrice).toFixed(3));
                    //                        isNaN(discount) ? $itemRow.find('#total').val("N/A") : $itemRow.find('#total').val(parseFloat(discount).toFixed(3));
                    //                        $('tr#quotPoForm').each(function () {
                    //                            var $itemRow = $(this).closest('tr');
                    //                            var total = $itemRow.find('#total').val();
                    //                            var tbd = $itemRow.find('#befdisc').val();
                    //                            var tda = $itemRow.find('#discountPrice').val();
                    //                            totalbefdisc = parseFloat(tbd) + parseFloat(totalbefdisc);
                    //                            totaldiscAmt = parseFloat(tda) + parseFloat(totaldiscAmt);
                    //                            gt = parseFloat(total) + parseFloat(gt);
                    //                        });
                    //                        $('#totalAmtBefDis').val(parseFloat(totalbefdisc).toFixed(3));
                    //                        $('#totalDisAmt').val(parseFloat(totaldiscAmt).toFixed(3));
                    //                        $('#totalAmt').val(parseFloat(gt).toFixed(3));
                    //                        gt = gt * (1 - lumsumdiscount / 100)
                    //                        $('#grandTotal').val(parseFloat(gt).toFixed(3));
                    //
                    //
                    //                    });
                    //                    $('#lumsumdiscount').on('keyup change', function () {
                    //                        var gt = 0;
                    //                        var lumsumdiscount = $('#lumsumdiscount').val();
                    //                        $('tr#quotPoForm').each(function () {
                    //                            var $itemRow = $(this).closest('tr');
                    //                            var total = $itemRow.find('#total').val();
                    //                            gt = parseFloat(total) + parseFloat(gt);
                    //                        });
                    //                        gt = gt * (1 - lumsumdiscount / 100);
                    //                        $('#grandTotal').val(parseFloat(gt).toFixed(3));
                    //                    });
                    //
                    //                    //                $('#currency').on('change', function () {
                    //                    //                    var gt = 0;
                    //                    //                    $('tr#quotPoForm').each(function () {
                    //                    //                        var $itemRow = $(this).closest('tr');
                    //                    //                        var z = $itemRow.find('#qty').val();
                    //                    //                        var zz = $itemRow.find('#price').val();
                    //                    //                        var ccc = $itemRow.find('#discount').val();
                    //                    //                        var discount = $itemRow.find('#qty').val() * $itemRow.find('#price').val() * (1 - $itemRow.find('#discount').val() / 100);
                    //                    //                        var discountfinal = roundNumber(discount, 2);
                    //                    //                        isNaN(discount) ? $itemRow.find('#total').val("N/A") : $itemRow.find('#total').val(discountfinal);
                    //                    //
                    //                    //                        var $itemRow = $(this).closest('tr');
                    //                    //                        var total = $itemRow.find('#total').val();
                    //                    //                        gt = parseFloat(total) + parseFloat(gt);
                    //                    //                    });
                    //                    //                    $('#grandTotal').val(parseFloat(gt));
                    //                    //                });
                    //
                    //
                    //
                    //                });
                                </script>
                                <script>
                                    jQuery(document).ready(function () {
                    
                                        formmodified = 0;
                                        $('form *').change(function () {
                                            formmodified = 1;
                                        });
                                        window.onbeforeunload = confirmExit;
                                        function confirmExit() {
                                            if (formmodified == 1) {
                                                return "New information not saved. Do you wish to leave the page?";
                                            }
                                        }
                                        $("button[name='commit']").click(function () {
                                            formmodified = 0;
                                        });
                    
                                        updateGrandTotal(); // when page refresh the page it will call the function
                    
                                        var inputval = '#qty, #discount,#price';
                                        $(document).on('input', inputval, function () {
                                            updateGrandTotal();
                    
                                        });
                                        $(document).on('input', '#discountPrice', function () {
                    
                                            caldiscountPrice(this);
                                        });
                                        $(document).on('input', '#discount1', function () {
                    
                                            var $itemRow = $(this).closest('tr');
                                            $itemRow.find('#discount').val(this.value);
                                            var befdiscount = $itemRow.find('#befdisc').val();
                                            var discount = $itemRow.find('#qty').val() * $itemRow.find('#price').val() * (1 - $itemRow.find('#discount').val() / 100);
                    //                                      var discountfinal = roundNumber(discount, 2);
                                            var disPrice = parseFloat(befdiscount).toFixed(3) - parseFloat(discount).toFixed(3);
                    
                                            $itemRow.find('#discountPrice').val(parseFloat(disPrice).toFixed(3));
                    
                    
                                            var dis = $itemRow.find('#discount').val();
                    
                                            if (parseFloat(dis) >= 100)
                                            {
                                                alert("Discount(%) should be less than 100 !!!");
                                                $itemRow.find('#discount').val("0.0");
                                                $itemRow.find('#discount1').val("0.0");
                                                $itemRow.find('#discountPrice').val("0.000");
                    
                    
                    
                                            }
                    
                    
                                            priceCalcute(this);
                    
                    
                                        });
                    
                                       /* $(document).on('input', '#lumsumdiscount1', function () {
                                            var gt = 0;
                                            var totalAmt = 0;
                                            $('#lumsumdiscount').val(this.value);
                                            var lumsumdiscount = $('#lumsumdiscount').val();
                    
                    
                                            $('tr#quotPoForm').each(function () {
                                                var $itemRow = $(this).closest('tr');
                                                var total = $itemRow.find('#total').val();
                                                totalAmt = parseFloat(total) + parseFloat(totalAmt);
                                            });
                                            gt = totalAmt * (1 - lumsumdiscount / 100);
                                            //var lumsumAmt = parseFloat(totalAmt).toFixed(3) - parseFloat(gt).toFixed(3);
                                            //$('#lumsumamt').val(parseFloat(lumsumAmt).toFixed(3));
                                            lumsumCalculate();
                                        });
                                        $(document).on('input', '#lumsumamt', function () {
                                            var gt = 0;
                                            var total = 0;
                                            var lumsumamt = $('#lumsumamt').val();
                                            $('tr#quotPoForm').each(function () {
                                                var $itemRow = $(this).closest('tr');
                                                total = $itemRow.find('#total').val();
                                                gt = parseFloat(total) + parseFloat(gt);
                                            });
                                            if (!isNaN(parseFloat(lumsumamt))) {
                                                if (parseFloat(lumsumamt) >= parseFloat(gt)) {
                                                    alert("Lumsum amount should be less than total amount...!!");
                                                    $('#lumsumamt').val('');
                                                    $('#lumsumdiscount').val('0.0');
                                                    $('#lumsumdiscount1').val('0.0');
                                                    lumsumCalculate();
                                                    return false;
                                                } else
                                                {
                                                    var lumsumdis = (parseFloat(lumsumamt).toFixed(3) / parseFloat(gt).toFixed(3)) * 100;
                                                    $('#lumsumdiscount').val(lumsumdis);
                                                    $('#lumsumdiscount1').val(parseFloat(lumsumdis).toFixed(3));
                                                    lumsumCalculate();
                                                }
                    
                                            }
                    
                    
                                        });*/
                    
                    //                $('#currency').on('change', function () {
                    //                    var gt = 0;
                    //                    $('tr#quotPoForm').each(function () {
                    //                        var $itemRow = $(this).closest('tr');
                    //                        var z = $itemRow.find('#qty').val();
                    //                        var zz = $itemRow.find('#price').val();
                    //                        var ccc = $itemRow.find('#discount').val();
                    //                        var discount = $itemRow.find('#qty').val() * $itemRow.find('#price').val() * (1 - $itemRow.find('#discount').val() / 100);
                    //                        var discountfinal = roundNumber(discount, 2);
                    //                        isNaN(discount) ? $itemRow.find('#total').val("N/A") : $itemRow.find('#total').val(discountfinal);
                    //
                    //                        var $itemRow = $(this).closest('tr');
                    //                        var total = $itemRow.find('#total').val();
                    //                        gt = parseFloat(total) + parseFloat(gt);
                    //                    });
                    //                    $('#grandTotal').val(parseFloat(gt));
                    //                });
                    
                    
                    
                                    });
                    
                                    function  priceCalcute($this)
                                    {
                                        var gt = 0;
                                        var totalbefdisc = 0;
                                        var totaldiscAmt = 0;
                                        var $itemRow = $($this).closest('tr');
                                        var z = $itemRow.find('#qty').val();
                                        var price = $itemRow.find('#price').val();
                                        var ccc = $itemRow.find('#discount').val();
                    
                                        //var lumsumdiscount = $('#lumsumdiscount').val();
                                        var convFact = $itemRow.find('#requisitionUom').val();
                                        var conVal = convFact.split("-");
                                        var befdiscount = $itemRow.find('#qty').val() * $itemRow.find('#price').val();
                                        $itemRow.find('#befdisc').val(parseFloat(befdiscount).toFixed(3));
                    
                                        var discount = $itemRow.find('#qty').val() * $itemRow.find('#price').val() * (1 - $itemRow.find('#discount').val() / 100);
                    //                                      var discountfinal = roundNumber(discount, 2);
                    //                var disPrice = parseFloat(befdiscount).toFixed(3) - parseFloat(discount).toFixed(3);
                    
                    //                $itemRow.find('#discountPrice').val(parseFloat(disPrice).toFixed(3));
                                        isNaN(discount) ? $itemRow.find('#total').val("N/A") : $itemRow.find('#total').val(parseFloat(discount).toFixed(3));
                                        var total = 0;
                                        $('tr#quotPoForm').each(function () {
                                            var $itemRow = $(this).closest('tr');
                                            total = $itemRow.find('#total').val();
                                            var tbd = $itemRow.find('#befdisc').val();
                                            var tda = $itemRow.find('#discountPrice').val();
                                            totalbefdisc = parseFloat(tbd) + parseFloat(totalbefdisc);
                                            totaldiscAmt = parseFloat(tda) + parseFloat(totaldiscAmt);
                                            gt = parseFloat(total) + parseFloat(gt);
                                        });
                                        $('#totalAmtBefDis').val(parseFloat(totalbefdisc).toFixed(3));
                                        $('#totalDisAmt').val(parseFloat(totaldiscAmt).toFixed(3));
                                        $('#totalAmt').val(parseFloat(gt).toFixed(3));
                                        gt = gt * (1);// - lumsumdiscount / 100)
                                        //var lumsumAmt = parseFloat($('#totalAmt').val()).toFixed(3) - parseFloat(gt).toFixed(3)
                                        //$('#lumsumamt').val(parseFloat(lumsumAmt).toFixed(3));
                                        $('#grandTotal').val(parseFloat(gt).toFixed(3));
                    
                                    }
                    
                                    function updateGrandTotal()
                                    {
                                        //When refreshing the page this method will call
                                        var gt = 0;
                                        var total = 0;
                                        var totalbefdisc = 0;
                                        var totaldiscAmt = 0;
                    //                    $('#lumsumdiscount').val('0.0');
                                        var lumsumdiscount = $('#lumsumdiscount').val();
                                        $('tr#quotPoForm').each(function () {
                                            var $itemRow = $(this).closest('tr');
                                            var befdiscount = $itemRow.find('#qty').val() * $itemRow.find('#price').val();
                                            $itemRow.find('#befdisc').val(parseFloat(befdiscount).toFixed(3));
                    
                                            var discount = $itemRow.find('#qty').val() * $itemRow.find('#price').val() * (1 - $itemRow.find('#discount').val() / 100);
                    //                                      var discountfinal = roundNumber(discount, 2);
                                            var disPrice = parseFloat(befdiscount).toFixed(3) - parseFloat(discount).toFixed(3);
                    
                                            $itemRow.find('#discountPrice').val(parseFloat(disPrice).toFixed(3));
                                            isNaN(discount) ? $itemRow.find('#total').val("N/A") : $itemRow.find('#total').val(parseFloat(discount).toFixed(3));
                    
                                            total = $itemRow.find('#total').val();
                                            var tbd = $itemRow.find('#befdisc').val();
                                            var tda = $itemRow.find('#discountPrice').val();
                                            totalbefdisc = parseFloat(tbd) + parseFloat(totalbefdisc);
                                            totaldiscAmt = parseFloat(tda) + parseFloat(totaldiscAmt);
                    
                                            gt = parseFloat(total) + parseFloat(gt);
                                        });
                                        $('#totalAmtBefDis').val(parseFloat(totalbefdisc).toFixed(3));
                                        $('#totalDisAmt').val(parseFloat(totaldiscAmt).toFixed(3));
                                        $('#totalAmt').val(parseFloat(gt).toFixed(3));
                                        gt = gt * (1);// - lumsumdiscount / 100)
                                        //var lumsumAmt = parseFloat($('#totalAmt').val()).toFixed(3) - parseFloat(gt).toFixed(3);
                                        //$('#lumsumamt').val(parseFloat(lumsumAmt).toFixed(3));
                                        $('#grandTotal').val(parseFloat(gt).toFixed(3));
                                    }
                    
                                    function caldiscountPrice($this)
                                    {
                                        var $itemRow = $($this).closest('tr');
                                        var befdisc = $itemRow.find('#befdisc').val();
                                        var discountPrice = $itemRow.find('#discountPrice').val();
                                        if (!isNaN(parseFloat(discountPrice))) {
                                            if (parseFloat(discountPrice) >= parseFloat(befdisc)) {
                                                alert("Discount amount should be less than total amount...!!");
                                                $itemRow.find('#discountPrice').val('');
                                                $itemRow.find('#discount').val('0.0');
                                                $itemRow.find('#discount1').val('0.0');
                    
                                                return false;
                                            } else {
                                                var dis = (parseFloat(discountPrice).toFixed(3) / parseFloat(befdisc).toFixed(3)) * 100;
                                                $itemRow.find('#discount').val(parseFloat(dis));
                                                $itemRow.find('#discount1').val(parseFloat(dis).toFixed(3));
                                                $itemRow.find('#totalDisAmt').val("0.000");
                                                priceCalcute($this);
                                            }
                                        } else {
                    
                                            $itemRow.find('#discount').val('0.0');
                                            $itemRow.find('#discount1').val('0.0');
                                            //  $itemRow.find('#discountPrice').val('0.000');
                    
                                            priceCalcute($this);
                                        }
                                    }
                    
                    
                                    /*function lumsumCalculate() {
                                        var gt = 0;
                                        var total = 0;
                    //                var lumsumdiscount = $('#lumsumdiscount').val();
                                        var lumsumamt = $('#lumsumamt').val();
                                        $('tr#quotPoForm').each(function () {
                                            var $itemRow = $(this).closest('tr');
                                            total = $itemRow.find('#total').val();
                                            gt = parseFloat(total) + parseFloat(gt);
                                        });
                    //                gt = gt * (1 - lumsumdiscount / 100);
                                        if (lumsumamt == '') {
                                            lumsumamt = 0;
                                        }
                                        var grandTotal = parseFloat(gt).toFixed(3) - parseFloat(lumsumamt).toFixed(3);
                                        $('#grandTotal').val(parseFloat(grandTotal).toFixed(3));
                                    }*/
                                </script>
                    
                    
                    
                                <script>
                    
                                    function validateDate(reqdate, itemcd, slno) {
                                        $('.poadditem').each(function () {
                                            var $itemRow = $(this).closest('tr');
                    
                                            var itemCode = $itemRow.find('#itemCode').val();
                                            var reqDateSno = $itemRow.find('#reqDateSno').val();
                                            if (slno != reqDateSno)
                                            {
                                                if (itemCode == itemcd) {
                                                    var requiredByDate = $itemRow.find("input[name='delDate']").val();
                                                    if (requiredByDate === reqdate) {
                                                        alert('The Item is already added to grid with same required date');
                                                        $('#' + slno).val('');
                                                        return false;
                                                    } else {
                                                        return true;
                                                    }
                    
                    
                                                }
                                            }
                    
                    
                                        });
                                    }
                    
                                    $(document).ready(function () {
                    
                                        $('tr#quotPoForm').each(function () {
                    
                                            var $itemRow1UF = $(this).closest('tr');
                    
                                            var itemcode = $itemRow1UF.find('#itemCode').val();
                                            var requisitionUom = $itemRow1UF.find('#requisitionUom').val();
                                            uomdisplay($itemRow1UF, itemcode, requisitionUom);
                    
                    
                                        });
                    
                                    });
                                    function uomdisplay($itemRow1UF, c, requisitionUom)
                                    {
                    
                    
                                        $.ajax({
                                            type: "POST",
                                            url: "../purchase/uomlist.htm",
                                            data: {code: c},
                                            success: function (data) {
                                                //                                                                    alert(data);
                                                //                        
                                                //                $('#requisitionUom').html("");
                                                var toAppend = '';
                                                var nameArray = data.split(",");
                    
                                                // toAppend += '<option value="">Select an Option</option>';                                                                   
                                                //                                                                    for (var i = 0; i < nameArray.length; i++) {
                                                if (nameArray[0] != "") {
                                                    toAppend += '<option value=' + '1' + '-' + nameArray[0] + '>' + nameArray[0] + '</option>';
                                                }
                    //                            if (nameArray[1] != "" && nameArray[1] !== 'null' && nameArray[4] !== 'null' && parseFloat(nameArray[4]) !== 0) {
                    //                                toAppend += '<option value=' + nameArray[4] + '-' + nameArray[1] + '>' + nameArray[1] + '</option>';
                    //
                    //                            }
                    //                            if (nameArray[2] != "" && nameArray[2] !== 'null' && nameArray[5] !== 'null' && parseFloat(nameArray[5]) !== 0) {
                    //                                toAppend += '<option value=' + nameArray[5] + '-' + nameArray[2] + '>' + nameArray[2] + '</option>';
                    //                            }
                    //                            if (nameArray[3] != "" && nameArray[3] !== 'null' && nameArray[6] !== 'null' && parseFloat(nameArray[6]) !== 0) {
                    //                                toAppend += '<option value=' + nameArray[6] + '-' + nameArray[3] + '>' + nameArray[3] + '</option>';
                    //                            }
                    
                                                $itemRow1UF.find('#requisitionUom').html(toAppend);
                    
                                                //                $('#requisitionUom').append(toAppend);
                                                $itemRow1UF.find('#requisitionUom option').each(function () {
                                                    var curUom = $itemRow1UF.find(this).val().split('-');
                                                    if (requisitionUom === curUom[1])
                                                    {
                                                        $itemRow1UF.find(this).prop('selected', true);
                                                    }
                                                });
                    
                                            },
                                            error: function (error) {
                    //                            alert(error);
                                            }
                    
                                        });
                    
                    
                    
                                    }
                    
                                    function recheck(poNo)
                                    {
                    
                                        var remark = document.getElementById("remarks").value;
                                        if (remark == '' || remark == null)
                                        {
                                            alert("Please provide remarks");
                                            return false;
                                        } else
                                        {
                                            if (confirm('Do you really want to recheck this record')) {
                                                formmodified = 0;
                                                window.location.href = "../purchase/statusUpdate.htm?poNo=" + poNo + "&remarks=" + remark + "&action=PM Recheck";
                    
                                            } else {
                                                return false;
                                            }
                    
                    
                                        }
                                    }
                                    function reject(poNo)
                                    {
                                        var remark = document.getElementById("remarks").value;
                                        if (remark == '' || remark == null)
                                        {
                                            alert("Please provide remarks");
                                            return false;
                                        } else {
                    
                                            if (confirm('Do you really want to reject this record')) {
                                                formmodified = 0;
                                                window.location.href = "../purchase/statusUpdate.htm?poNo=" + poNo + "&remarks=" + remark + "&action=PM Rejected";
                    
                                            } else {
                                                return false;
                                            }
                    
                    
                                        }
                                    }
                                    function deleteRow(row) {
                    
                                        var rowCount = $('#example tr').length;
                                        alert(rowCount);
                                        var i = row.parentNode.parentNode.rowIndex;
                                        if (rowCount != 2) {
                                            document.getElementById("example").deleteRow(i);
                                            return true;
                                        } else {
                                            alert('You can not delete this row...!!!');
                                            return;
                                        }
                                    }
                                    function isNumberKey1(evt) {
                                        debugger;
                                        var charCode = (evt.which) ? evt.which : event.keyCode;
                                        if (charCode == 46 && evt.srcElement.value.split('.').length > 1) {
                                            return false;
                                        }
                                        if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
                    
                                            return true;
                                        }
                                        alert("Please Enter Alphabet");
                                        return false;
                                    }
                    
                                    function isNumberKey(evt) {
                                        if (evt.which != 8 && evt.which != 0 && (evt.which < 48 || evt.which > 57))
                                        {
                                            alert("Please Enter Numeric value");
                                            return false;
                                        }
                                        return true;
                                    }
                    
                    
                                    function roundNumber(number, decimals) {
                                        //If it's not already a String
                                        var num2 = Math.floor(number * 1000) / 1000;
                                        return num2;
                                    }
                                    function openWindow() {
                    
                                        myWindow = window.open("../purchase/selectSuppnamePopup.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                                    }
                    //                function check_digit(e, obj, intsize, deczize) {
                    //                    var keycode;
                    //
                    //                    if (window.event)
                    //                        keycode = window.event.keyCode;
                    //                    else if (e) {
                    //                        keycode = e.which;
                    //                    } else {
                    //                        return true;
                    //                    }
                    //
                    //                    var fieldval = (obj.value),
                    //                            dots = fieldval.split(".").length;
                    //
                    //                    if (keycode == 46) {
                    //                        return dots <= 1;
                    //                    }
                    //                    if (keycode == 8 || keycode == 9 || keycode == 46 || keycode == 13 || keycode != 46 || keycode != 8) {
                    //                        // back space, tab, delete, enter 
                    //                        return true;
                    //                    }
                    //                    if ((keycode >= 32 && keycode <= 45) || keycode == 47 || (keycode >= 58 && keycode <= 127)) {
                    //                        return false;
                    //                    }
                    //                    if (fieldval == "0" && keycode == 48) {
                    //                        return false;
                    //                    }
                    //                    if (fieldval.indexOf(".") != -1) {
                    //                        if (keycode == 46) {
                    //                            return false;
                    //                        }
                    //                        if (event.keyCode != 8 && event.keyCode != 46)
                    //                        {
                    //                            event.preventDefault();
                    //                        }
                    //                        var splitfield = fieldval.split(".");
                    //                        if (splitfield[1].length >= deczize && keycode != 8 && keycode != 0)
                    //                            return false;
                    //                    } else if (fieldval.length >= intsize && keycode != 46) {
                    //                        return false;
                    //                    } else {
                    //                        return true;
                    //                    }
                    //                }
                    
                                </script>
                                 </div>
                                </div>
        
                            </div>
                        </div>
                    </section>
        
                </main><!-- End #main -->

        <jsp:include page="../login/footer.jsp" />
</body>

</html>