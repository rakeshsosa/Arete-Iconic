<%-- 
    Document   : poEdit
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

        <title>arête Assets Management</title>
        <!--<link href="../common/theme/css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">-->

        <!--<script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>-->
        <script type="text/javascript" src="../purchOrder/datepicker/datetimepicker_css.js"></script>
        <!--Mouse Over It will display last 3 po list--> 
        <script type="text/javascript" src="../purchOrder/mouseOverPrevPO.js"></script>
        <link href="../purchOrder/mouseOverPrevPo.css" rel="stylesheet">
        <script src="../common/validate/Check_Digit.js" type="text/javascript"></script>
    </head>


    <body class="nav-sm">
        <%
            Date date = new Date();
        %>


        <div class="container body">


            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">

                        <form id="poeditform" class="form-inline" method="post" action="../purchase/poEditSubmit.htm" enctype="multipart/form-data">


                            <div class="x_panel">                             
                                <jsp:include page="../login/headerlink.htm?submodule=Purchase Order&tab=Purchase Order&pagetype=form"/>
                                <div class="x_title">
                                    <h2>Purchase Order</h2> 
                                    <div class="clearfix"></div>

                                </div>

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
                                    <c:set var="supname" value="${list.supplierName}"/>
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
                                    <c:set var="purMngName" value="${list.purMngName}"/>
                                    <c:set var="purMngRemarks" value="${list.purMngRemarks}"/>
                                    <c:set var="purMngDate" value="${list.purMngDate}"/>
                                    <c:set var="gmName" value="${list.gmName}"/>
                                    <c:set var="gmRemarks" value="${list.gmRemarks}"/>
                                    <c:set var="gmDate" value="${list.gmDate}"/>
                                    <c:set var="lumsumDiscount" value="${list.lumsumDiscount}"/>
                                    <c:set var="costcenterCode" value="${list.costcenterCode}"/>
                                    <c:set var="costcenterDesc" value="${list.costcenterDesc}"/>
                                    <c:set var="fmName" value="${list.fmName}"/>
                                    <c:set var="fmRemarks" value="${list.fmRemarks}"/>
                                    <c:set var="fmDate" value="${list.fmDate}"/>

                                    <script type="text/javascript">
                                        $(document).ready(function () {


                                            var nFields = document.getElementsByTagName('input');
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

                                            var textFields = document.getElementsByTagName('select')
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

                                        });</script>

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
                                                    <input type="hidden" name="poRevNo" value="${poRevNo}"/> 
                                                    <input type="hidden" name="poNo" value="${purchaseOrderNo}"/>  
                                                </c:if>
                                                <c:if test="${empty poRevNo}">
                                                    <h5> <strong>Purchase Order No:</strong> ${purchaseOrderNo}</h5> 
                                                    <input type="hidden" name="poNo" value="${purchaseOrderNo}"/>  
                                                </c:if>
                                            </div>
                                            <div> <h5> <strong>Purchase Order Date:</strong><fmt:formatDate pattern="dd-MMM-yyyy" value="${purchaseOrderDate}"/></h5> 
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
                                                <!--<input name="reqNo" type="hidden" value="${reqno}" tabindex="-1"/>-->
                                            </div>
                                            <div> <h5> <strong>Requisition Date:</strong> 
                                                    <c:forEach items="${reqNoList}" var="type"> 
                                                        <c:if test="${not empty type[1]}">
                                                            <fmt:formatDate pattern="dd-MMM-yyyy" value="${type[1]}"/>,
                                                        </c:if>
                                                    </c:forEach>                                                     
                                                </h5>                                                 
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
                                        <input type="hidden" class="form-control" name="potype1" id="potype1" value="${potype}" >

                                        <select  id="potype" name="potype" data-rel="chosen"  required="" class="form-control" onchange="changeCurrency();">
                                            <option value="${potype}">${potype}</option>  
                                            <option value="Local">Local</option> 
                                            <option value="Import">Import</option> 
                                        </select> 
                                    </div> &nbsp;

                                    <div > 
                                        <label class="control-label">Currency:</label>
                                        <input type="hidden" class="form-control" name="currency1" id="currency1" value="${currency}" >

                                        <select  id="currency" name="currency" data-rel="chosen" required="" class="form-control" onchange="selectCurrency();">                                            
                                            <option value="${currency}">${currency}</option>                                             
                                        </select>  
                                    </div>
                                    &nbsp;
                                    <%--<div>
                                        <label class="control-label"><span style="color: red">*</span> Cost Center</label>
                                        <select  id="costCenter" name="costCenter" data-rel="chosen"   class="form-control validate[required]">
                                            <option value="${costcenterDesc}/${costcenterCode}">${costcenterDesc}/${costcenterCode}</option>  
                                            <c:forEach items="${costCenterList}" var="type">
                                                <option value="${type.costcenterDesc}/${type.costcenterCode}">${type.costcenterDesc}/${type.costcenterCode}</option>                                              </c:forEach>
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


                                        <div class="col-md-4 col-sm-12 col-xs-12 ">
                                            <div class="pricing">

                                                <div class="x_content">
                                                    <div class="">
                                                        <div class="pricing_features">
                                                            <strong><div id="enduser">Bill To Location</div></strong><br/>


                                                            <ul class="list-unstyled text-left">
                                                                <textarea class="form-control" style="resize: none;width:300px;" Placeholder="Click to select Location" id="billToAddress" name="billToAddress" onclick="selectBillToLoc();" readonly="">${billToLocation}</textarea>

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

                                                                <textarea class="form-control " Placeholder="Click to select Location" style="resize: none;width:300px;" onclick="selectDeliveryLoc();" id="requiredAtLoc" name="deliveryLoc" readonly="">${deliveryLoc}</textarea>
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
                                <div class="x_content">
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                        <label class="control-label"><span style="color: red">*</span> Item Category</label>
                                        <c:choose>
                                            <c:when test="${fn:length(itemCreatList) > 0}">
                                                <c:forEach items="${itemCreatList}" var="type">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input class="form-control" readonly="" style="text-transform: capitalize" autocomplete="off" id="itemCat" name="itemCat"  maxlength="40"  type="text" value="${type.itemCategory}">                                                                                                                                 
                                                            <                                                                                                                  
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input class="form-control" readonly type="text" value="${type.itemCategory}">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>                                                    
                                                <select  id="itemCat"  data-rel="chosen" class="form-control" onchange="getItemSubCat();">
                                                    <option value="">Select an option</option>
                                                    <option value="Asset">Asset</option>
                                                    <option value="Material">Material</option>
                                                    <option value="Service">Service</option>
                                                    <%--<c:forEach items="${itemcategoryList}" var="type">
                                                        <!--<option>${type.itemCategory}</option>-->
                                                    <%--</c:forEach>--%>
                                                </select>
                                            </c:otherwise>        
                                        </c:choose>
                                    </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                        <label class="control-label"><span style="color: red">*</span> Item Name</label>
                                        <c:choose>
                                            <c:when test="${fn:length(itemCreatList) > 0}">
                                                <c:forEach items="${itemCreatList}" var="type">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input   class="form-control" required readonly="" style="text-transform: capitalize" autocomplete="off" id="itemName" name="itemName"  maxlength="40"  type="text" value="${type.itemName}"> 

                                                        </c:when>
                                                        <c:otherwise>
                                                            <input class="form-control" readonly type="text" value="${type.itemName}">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <input id="itemCode"  type="hidden" >
                                                <input id="price"  type="hidden" >
                                                <input  class="form-control" readonly placeholder="Click to select items" autocomplete="off" id="itemName" maxlength="40"  type="text" value="" onclick="selectItem();">                                                    
                                            </c:otherwise>        
                                        </c:choose>
                                    </div>
                                    <p>&nbsp;</p> <p>&nbsp;</p>
                                    <div class="x_content" style="overflow-x:  scroll;">
                                        <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                            <thead>
                                                <tr class="headings">  
                                                    <th><i class="fa fa-trash"></i></th>
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
                                                    <th style="width:15%;">Total Amount After Discount</th>     
                                                    <th style="width:8%;"><span style="color: red">*</span> Delivery Date</th>                                              
                                                </tr>
                                            </thead>

                                            <tbody>
                                            <input id="pkItemDel" name="pkItemDel" type="hidden" >
                                            <c:set var="gtotal" value="0.000"/>
                                            <c:forEach items="${poList}" var="type"> 
                                                <tr id="quotPoForm" class="poadditem">
                                                    <td><button type="button" id="ondel"  onclick="deleteRow(this);" value="${type.SNo}" ><i id="deleteRow" class="fa fa-trash-o"></i></button></td>
                                                    <td style="display: none">
                                                        <input type="hidden" name="pk" value="${type.SNo}"/>  
                                                        <input name="reqNo" type="hidden" value="${type.prNo}"/>
                                                        <input name="reqDate" type="hidden" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.prDate}"/>"/>
                                                        <input type="hidden" name="prSno" value="${type.prSno}"/>
                                                        <input type="hidden" name="quotSno" value="${type.qtSno}"/> 
                                                        <input type="hidden" name="division" id="division" value="${type.divisionName}">
                                                        <input  name="prName" type="hidden" value="${type.projectName}">
                                                        <!--<input type="hidden" id="unit"  name="unit" value="${type.uom}"/>-->                                                
                                                        <input name="itemCat"  type="hidden" value="${type.itemCategory}">                                                                                                         
                                                        <input id="itemCat2"  type="hidden" value="${type.itemCategory}">                                                                                                         
                                                        <input  type="hidden" name="purchaseType" id="purchaseType" value="${type.purchaseType}">
                                                        <input type="hidden"  name="dept" value="${type.department}"> 
                                                        <input type="hidden"  name="status" value="${type.status}"> 
                                                        <!--${type.itemCode}-->
                                                        <input class="form-control" id="itemCode" name="itemCode"  type="hidden" value="${type.itemCode}">
                                                    </td>                                             
                                                    <td style="width: 20%"><input class="form-control" readonly=""name="itemsubCat"  id="itemsubCat"  type="text" value="${type.itemSubCategory}">
                                                    </td>
                                                    <td style="width: 20%;"><a id="prevPO" onmouseover="checkPrevPO(this, '${type.itemCode}');" style="cursor: pointer;color: #0067f9" ><input class="form-control" readonly="" id="itemName" name="itemName"  type="text" value="${fn:escapeXml(type.itemName)}">
                                                            <table id="t01" border="1px" style="border-radius: 5px">
                                                                <tr id="prevhead" style="color: #172D44"></tr>
                                                                <tbody id="prevpolst" style="color: darkblue"></tbody>

                                                            </table></a>
                                                    </td>  
                                                    <td><input class="form-control" readonly="" id="itemDesc" name="itemDesc"  type="text" value="${fn:escapeXml(type.description)}"></td>                                              
                                                    <td style="width: 10%;"><input  style="width: 100px;text-align:right;" class=" form-control input-mini validate[required] validate[custom[notzero],custom[float5]]" onpaste="return false" autocomplete="off" name="qty" id="qty" onkeypress="return check_digit(event, this, 10, 3);" onkeypress="return isNumberKey(event)"  type="text" value="${type.qty}">
                                                        <input  style="width: 100px;text-align:right;" class=" form-control" onpaste="return false" autocomplete="off" name="qty1" id="qty1" type="hidden" value="${type.qty}">
                                                    </td>  
                                                    <td style="width: 10%;"><select style="width: 100px;text-align:left;" name="unit" id="requisitionUom" class="form-control input-sm validate[required]" onpaste="return false" onchange="unitPrice(this, '${type.itemCode}', '${supcode}', 'calUpdateTotal');" tabindex="7">

                                                            <option value="${type.uom}">${type.uom}</option>
                                                        </select>
                                                        <input type="hidden" class="form-control" id="requisitionUom1" value="${type.uom}" >

                                                    </td>
                                                    <td style="width: 10%;"><input style="width: 100px;text-align:right;" class="form-control  input-mini validate[required,custom[notzero],custom[float5]]" onpaste="return false"  autocomplete="off" onkeypress="return check_digit(event, this, 6, 3);" name="price" id="price" type="text" value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${type.unitPrice}"/>">
                                                        <input style="width: 100px;text-align:right;" class="form-control  input-mini validate[required,custom[notzero],custom[float5]]" onpaste="return false"  autocomplete="off" name="price1" id="price1" type="hidden" value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${type.unitPrice}"/>">
                                                    </td>
                                                    <td><input style="text-align:right;width:100px;" class="form-control  input-mini  validate[required]" type="text" readonly onpaste="return false" name="befdisc"  id="befdisc"  value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${type.qty*type.unitPrice}"/>" ></td>
                                                    <td style="width: 10%;"><input style="width: 100px;text-align:right;" class="form-control  input-mini  validate[required,custom[float5]]"  onpaste="return false" maxlength="6" autocomplete="off" id="discount1" onkeypress="return check_digit(event, this, 2, 3);" type="text" value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${type.discount}"/>" >
                                                        <input style="width: 70px;text-align:right;"  onpaste="return false" autocomplete="off" name="discount" id="discount" type="hidden" value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${type.discount}"/>">
                                                    </td>
                                                    <td><input style="text-align:right;width:100px;" class="form-control  input-mini  validate[required,custom[float5]]" type="text" onpaste="return false" autocomplete="off" name="discountPrice"  id="discountPrice" onkeypress="return check_digit(event, this, 10, 3);"  value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${(type.qty*type.unitPrice)*(type.discount/100)}"/>">
                                                        <input style="text-align:right;width:100px;" class="form-control  input-mini  validate[required,custom[float5]]" type="hidden" onpaste="return false" autocomplete="off" name="discountPrice1"  id="discountPrice1" onkeypress="return check_digit(event, this, 10, 3);"  value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${(type.qty*type.unitPrice)*(type.discount/100)}"/>">
                                                    </td>
                                                    <td> <input style="width: 100px;text-align:right;" class="form-control  input-mini validate[required]" id="total" name="total" type="text" value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${type.totalValue}"/>" readonly=""></td>
                                                    <td style="width: 12%;"><input style="width: 100px;text-align:left;" class=" form-control input-small validate[required]" name="delDate" id="delDate" placeholder="DD/MM/YYYY" autocomplete="off" id="${type.SNo}" type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${type.requiredDate}"/>"  onchange="validateDate(this.value, '${type.itemCode}', '${type.SNo}')">
                                                        <input style="width: 100px;text-align:left;" class=" form-control input-small validate[required]" name="delDate1" id="delDate1" placeholder="DD/MM/YYYY" autocomplete="off" id="${type.SNo}" type="hidden" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${type.requiredDate}"/>"  onchange="validateDate(this.value, '${type.itemCode}', '${type.SNo}')">
                                                        <input style="text-align:center;" type="hidden" name="reqDateSno" id="reqDateSno" value="${type.SNo}"/></td>
                                                        <c:set value="${totalbefdisAmt + type.qty*type.unitPrice}" var="totalbefdisAmt"/> 
                                                        <c:set value="${totaldisAmt + (type.qty*type.unitPrice)*(type.discount/100)}" var="totaldisAmt"/>     
                                                        <c:set value="${gtotal + type.totalValue}" var="totalAmt"/>
                                                        <c:set value="${gtotal + type.totalValue}" var="gtotal"/>
                                                </tr>
                                            </c:forEach> 
                                            <c:set value="${gtotal * (1-0/100)}" var="grandtotal"/> 
                                            <c:set  var="lumsumamt"  value="${totalAmt-grandtotal}"/> 

                                            </tbody>

                                        </table>
                                    </div>
                                </div>
                            </div>


                            <div class="x_panel">
                                <div class="row">
                                    <div class="col-sm-3">

                                        <label class="control-label"><span style="color: red">*</span> Payment Terms:</label>
                                        <input type="hidden" class="form-control" name="payTerms1" id="payTerms1" value="${paymentTerms}" >
                                        <select  id="payTerms" name="payTerms" data-rel="chosen" class="form-control" >
                                            <option value="${paymentTerms}">${paymentTerms}</option>
                                            <c:forEach items="${paytermslist}" var="list">
                                                <option value="${list.termName}">${list.termName}</option> 
                                            </c:forEach>
                                        </select>  




                                        <label class="control-label"><span style="color: red">*</span> Delivery Terms :</label>
                                        <input type="hidden" class="form-control" name="delTerms1" id="delTerms1" value="${deliveryTerms}" >
                                        <select  id="delTerms" name="delTerms" data-rel="chosen" class="form-control" >
                                            <option value="${deliveryTerms}">${deliveryTerms}</option>
                                            <c:forEach items="${delivtermslist}" var="list">
                                                <option value="${list.termName}">${list.termName}</option> 
                                            </c:forEach>
                                        </select>  











                                        <!--                                        <label class="control-label" style="font-size:12px;">Payment Terms</label>
                                                                                <input class="form-control  input-mini" id="payTerms" readonly="" name="payTerms" type="text" value="${paymentTerms}">
                                        
                                        
                                                                                <label class="control-label" style="font-size:12px;">Delivery Terms</label>
                                                                                <input class="form-control  input-mini" id="delTerms" readonly="" name="delTerms" type="text" value="${deliveryTerms}" >-->

                                        <label class="control-label" style="font-size:12px;">Warranty Period</label>
                                        <input class="form-control" id="warranty" name="warranty" type="text" value="${warrantyPeriod}"  maxlength="50">
                                        <input class="form-control" id="warranty1" name="warranty1" type="hidden" value="${warrantyPeriod}"  maxlength="50">

                                        <label class="control-label" style="font-size:12px;"><span style="color: red"></span> PO Note:</label>
                                        <textarea class="form-control" rows="3" style="resize: none" id="poNote" name="poNote" type="text" value="" maxlength="180">${poNote}</textarea>
                                        <input id="poNote1" class="form-control"  rows="1" maxlength="300" style="resize: none" type="hidden" value="${poNote}">


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
                                    <%--<input class="right form-control input-mini validate[custom[float5]]" maxlength="6" style="width: 70px" autocomplete="off" style="font-weight: bold" onpaste="return false" onkeypress="return check_digit(event, this, 2, 3);" id="lumsumdiscount1"  type="text" value="<fmt:formatNumber type="number" pattern="0.000" value="${lumsumDiscount}"/>" onkeyup="checkLumAmt();">
                                    <input class="right" id="lumsumdiscount" name="lumsumdiscount" autocomplete="off" type="hidden" value="${lumsumDiscount}">

                                    </div> &nbsp;
                                    <div class="col-xs-offset-8 form-inline"> 
                                        <label class="control-label" style="font-size:  12px;" >Lumsum Discount Amount:</label> 
                                        <input class="right form-control input-mini validate[custom[float5]]" onpaste="return false"  autocomplete="off" style="font-weight: bold" onkeypress="return check_digit(event, this, 10, 3);" id="lumsumamt" type="text" value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${lumsumamt}"/>" >

                                    </div>--%> &nbsp;
                                    <div class="col-md-offset-8 " > 
                                        <label class="control-label" style="font-size:  20px">Grand Total:</label>
                                        <!--<span class="btn btn-sm">INR</span>-->

                                        <input class="right form-control input-mini validate[required]" style="font-weight: bold" readonly="" id="grandTotal" name="grandTotal" type="text" value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${grandtotal}"/>">
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
                                            <tr>
                                                <td class="center" ><b>Purchase Manager</b></td>
                                                <td class="center">${purMngName}</td>
                                                <td class="center"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${purMngDate}" /></td>
                                                <td class="center">${purMngRemarks}</td>
                                            </tr>
                                            <tr>
                                                <td class="center" ><b>Finance Manager</b></td>
                                                <td class="center">${fmName}</td>
                                                <td class="center"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${fmDate}" /></td>
                                                <td class="center">${fmRemarks}</td>
                                            </tr>
                                            <tr>
                                                <td class="center" ><b>General Manager</b></td>
                                                <td class="center">${gmName}</td>
                                                <td class="center"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${gmDate}" /></td>
                                                <td class="center">${gmRemarks}</td>
                                            </tr>
                                        </tbody>
                                    </table>         

                                </div>
                                <p>&nbsp;</p>


                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                    <div class="col-md-9 col-sm-9 col-xs-12 ">
                                        <p>&nbsp;</p>
                                        <!--<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">-->
                                        <!--<button type="button" class="btn btn-success" style=""  onclick="addOrderRow_test();"><i class="fa fa-plus-circle" style="font-size: 15px"></i> Add Item</button>-->
                                        <!--                                        <button type="submit" name="commit" class="btn btn-primary" style="">Save</button>-->
                                        <button type="button" class="btn btn-primary" style="" onclick="return test();">Save</button>

                                        <a href="../purchase/poList.htm"><button type="button" class="btn btn-danger" style="">Cancel</button></a> 

                                        <!--</div>-->
                                    </div>
                                </div>
                                <br/>

                                <div class="clearfix"></div>



                            </div>
                        </form>
                    </div>
                </div>


            </div>



            <div id="custom_notifications" class="custom-notifications dsp_none">
                <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
                </ul>
                <div class="clearfix"></div>
                <div id="notif-group" class="tabbed_notifications"></div>
            </div>
            <!--<script src="../common/theme/js/datatables/js/jquery.dataTables.js"></script>-->

            <script>
                var suppCode = $('#suppId').val();
                function selectItem() {
                    var itemCat = document.getElementById('itemCat').value;
                    if (itemCat == '')
                    {
                        alert("Please select item category..!!");
                        return false;
                    }

                    myWindow = window.open("../purchase/selectItems.htm?itemCat=" + itemCat, "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
//                var suppCode = $('#supId').val();
//                if (suppCode == null || suppCode == '') {
//                    alert("Please Select Supplier..!!");
//                    return false;
//                }             
//                else
//                {
//                    var itemsubCat = document.getElementById('itemsubCat').value;
//
//                    myWindow = window.open("../purchOrder/selectSuppItemsPopUp.htm?itemSubCat=" + itemsubCat + "&suppCode=" + suppCode, "PopWindow1", "width = 1000, height = 550, menubar = no, location = no, top = 20, left = 150, scrollbars = yes, titlebar = no, toolbar = no, directories = 0");
//
//                }
                }
//                $(document).ready(function () {


                var count = 0;
                var calUpdateTotal = null;
                function addOrderRow_test(val2, val3, val4, val5) {
                    calUpdateTotal = 'calUpdateTotal';
                    var itemCat = document.getElementById('itemCat').value;
                    var $itemsTable4 = $('#example');
//                    $('#example tr').each(function () {
//                        $(this).find('td').each(function () {
//
//                            var a = $(this).find('#itemCode').val();
//
//                            var itemCode = $(this).find('#itemCode').val();
//
//
//                            if (itemCode == val2) {
//                                alert('Record already added to grid');
//                                document.getElementById('td').value = "";
//                                return false;
//                            } else {
//                                return true;
//                            }
//                        })
//                    })
                    if (val2 != "")
                    {


                        var c = val2;
                        var $row4 = '<tr class="poadditem" id="quotPoForm" ><td align="center" class="tinput"><button type="button" class="fa fa-trash-o" id="ondel" onclick="deleteRow(this)" ></button> </td>' +
                                '<td style="width: 20%"><input class="form-control" type="text" readonly name="itemsubCat" value="' + val5 + '"/></td>\n\
                                                                        <td style="width: 20%;"><a id="prevPO" onmouseover="checkPrevPO(this, ' + val2 + ');" style="cursor: pointer;color: #0067f9" ><input class="form-control"  type="text" readonly id="itemName1" name="itemName" value="' + val3.replace(/"/g, '&quot;') + '"/><table id="t01" border="1px" style="border-radius: 5px"><tr id="prevhead" style="color: #172D44"></tr><tbody id="prevpolst" style="color: darkblue"></tbody></table></td>\n\\n\
                                             <td><input class="form-control" readonly type="text" name="itemDesc" value="' + val4.replace(/"/g, '&quot;') + '" ></td>\n\
                                                                                         <td style="width: 10%;"><input  style="width: 100px;text-align:right;" class=" form-control input-mini validate[required] validate[custom[notzero],custom[float5]]" onpaste="return false" autocomplete="off"  name="qty" id="qty" onkeypress="return check_digit(event, this, 10, 3);" onkeypress="return isNumberKey(event)"  type="text" value=""></td>\n\
                                                                                         <td style="width: 10%;"><select name="unit" class="form-control validate[required]" style="width:100px;" id="requisitionUom" onchange="unitPrice(this ,' + val2 + ', ' + suppCode + ',' + calUpdateTotal + ')" class="validate[required]"><option value=""></option></select></td>' +
                                '<td style="width: 10%;"><input class="form-control validate[required,custom[notzero],custom[float5]]" style="text-align:right; width:100px" type="text"  autocomplete="off"  onkeypress="return check_digit(event, this, 6, 3);" maxlength="10" name="price" id="price" value=""></td>\
                                                                       <td><input style="text-align:right;width: 100px;" class="form-control  input-mini  validate[required]" readonly type="text" onpaste="return false"  name="befdisc" id="befdisc" onkeypress="return check_digit(event, this, 2, 2);"  value="0.000" ></td>\n\
                                                                        <td style="width: 10%;"><input style="text-align:right;width: 100px;" class="form-control  input-mini  validate[required,custom[float5]]" type="text" onpaste="return false" autocomplete="off"  id="discount1" onkeypress="return check_digit(event, this, 2, 3);"  value="0.000" >\n\
                                                        <input style="width: 70px;text-align:right;"  onpaste="return false" autocomplete="off" name="discount" id="discount" type="hidden" value="0.000"></td>\n\
                                                                        \n\<td><input style="text-align:right;width: 100px;" class="form-control  input-mini  validate[required]" type="text" onpaste="return false" name="discountPrice"  id="discountPrice" onkeypress="return check_digit(event, this, 10, 3);"  value="0.000" ></td>\n\
                                                                                    \n\<td><input style="width: 100px;text-align:right;" class="form-control  input-mini validate[required]" id="total" name="total" type="text" value="" readonly=""></td>\n\
                                                                                            <td class="tinput"><input style="width: 100px;text-align:left;" class="form-control  input-mini  validate[required]" type="text" name="delDate" placeholder="DD/MM/YYYY" autocomplete="off" id="' + count + '" value="" onchange="validateDate(this.value,' + val2 + ',' + count + ')"><input style="text-align:center;" type="hidden" name="reqDateSno" id="reqDateSno" value="' + count + '"/></td><td  style="display:none;" class="tinput"><input style="text-align;center;"  readonly type="hidden"  value=""></td>' +
                                '<td  style="display:none;" class="tinput"><input  type="hidden" name="remarks" value="" style="border: none"><input style="text-align;center;" type="hidden" name="itemCat" value="' + itemCat + '"/><input style="text-align;center;" type="hidden" name="itemCode" id="itemCode" value="' + val2 + '"/><input type="hidden" name="pk" value=""/></td></tr>';
                        count++;
                        $('.poadditem:last', $itemsTable4).after($row4);
                        $('.poadditem').each(function () {

                            var $itemRow1UF = $(this).closest('tr');
                            var itemcode = $itemRow1UF.find('#itemCode').val();
                            var requisitionUom = $itemRow1UF.find('#requisitionUom').val();
                            if (requisitionUom == '') {
                                uomdisplay($itemRow1UF, itemcode, requisitionUom);
                            }



                        });
//                        $.ajax({
//                            type: "POST",
//                            url: "../purchReq/uomlist.htm",
//                            data: {code: c},
//                            success: function (data) {
//                                //                                                                    alert(data);
//                                //                        
//                                var $itmrow = $(".poadditem:last");
//                                $itmrow.find('#requisitionUom').html('');
//
//                                var nameArray = data.split(",");
//                                var toAppend = '';
//
//                                // toAppend += '<option value="">Select an Option</option>';                                                                   
//                                //                                                                    for (var i = 0; i < nameArray.length; i++) {
//                                if (nameArray[0] != "") {
//                                    toAppend += '<option value=' + '1' + '-' + nameArray[0] + '>' + nameArray[0] + '</option>';
//                                }
//                                //                                                                    if (nameArray[1] != "" && nameArray[1] !== 'null' && nameArray[4] !== 'null' && parseFloat(nameArray[4]) !== 0) {
//                                //                                                                        toAppend += '<option value=' + nameArray[4] + '-' + nameArray[1] + '>' + nameArray[1] + '</option>';
//                                //
//                                //                                                                    }
//                                //                                                                    if (nameArray[2] != "" && nameArray[2] !== 'null' && nameArray[5] !== 'null' && parseFloat(nameArray[5]) !== 0) {
//                                //                                                                        toAppend += '<option value=' + nameArray[5] + '-' + nameArray[2] + '>' + nameArray[2] + '</option>';
//                                //                                                                    }
//                                //                                                                    if (nameArray[3] != "" && nameArray[3] !== 'null' && nameArray[6] !== 'null' && parseFloat(nameArray[6]) !== 0) {
//                                //                                                                        toAppend += '<option value=' + nameArray[6] + '-' + nameArray[3] + '>' + nameArray[3] + '</option>';
//                                //                                                                    }
//
//                                //                                                                    }
//                                $itmrow.find('#requisitionUom').append(toAppend);
//                            }
//
//                        });

                        //gridEditArrowKey();

                    }
                    //                                                                }
                }

//                });

                function selectdate(val) {

                    NewCssCal(val, 'ddMMMyyyy', '', '', '', '', 'future');
//                NewCssCal(val, 'ddMMMyyyy', 'dropdown', true, '12', '', 'future');
                    //$('#test').attr();
                    //document.getElementById("hiddentr").value=$itemRow.index();

                }

                function validateDate(reqdate, itemcd, slno) {
                    getDate(slno);
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

//                function uomdisplay(c)
//                {
//                    $.ajax({
//                        type: "POST",
//                        url: "../purchReq/uomlist.htm",
//                        data: {code: c},
//                        success: function (data) {
//                            //                                                                    alert(data);
//                            //                        
////                            var $itemRow = $("#quotPoForm tr:last").attr('#requisitionUom');
////                            alert($itemRow);
////                            $itemRow.find('#requisitionUom').html("");
//
//                            var nameArray = data.split(",");
//                            var toAppend = '';
//
//                            // toAppend += '<option value="">Select an Option</option>';                                                                   
//                            //                                                                    for (var i = 0; i < nameArray.length; i++) {
//                            if (nameArray[0] != "") {
//                                toAppend += '<option value=' + '1' + '-' + nameArray[0] + '>' + nameArray[0] + '</option>';
//                            }
//                            //                                                                    if (nameArray[1] != "" && nameArray[1] !== 'null' && nameArray[4] !== 'null' && parseFloat(nameArray[4]) !== 0) {
//                            //                                                                        toAppend += '<option value=' + nameArray[4] + '-' + nameArray[1] + '>' + nameArray[1] + '</option>';
//                            //
//                            //                                                                    }
//                            //                                                                    if (nameArray[2] != "" && nameArray[2] !== 'null' && nameArray[5] !== 'null' && parseFloat(nameArray[5]) !== 0) {
//                            //                                                                        toAppend += '<option value=' + nameArray[5] + '-' + nameArray[2] + '>' + nameArray[2] + '</option>';
//                            //                                                                    }
//                            //                                                                    if (nameArray[3] != "" && nameArray[3] !== 'null' && nameArray[6] !== 'null' && parseFloat(nameArray[6]) !== 0) {
//                            //                                                                        toAppend += '<option value=' + nameArray[6] + '-' + nameArray[3] + '>' + nameArray[3] + '</option>';
//                            //                                                                    }
//
//                            //                                                                    }
////                            $itemRow.find('#requisitionUom').append(toAppend);
//                        }
//
//                    });
//                }



                function checkGrid() {
                    var table = document.getElementById("resourcetable");
                    var slNo = table.rows.length - 1;
                    if (slNo < 0) {
                        alert("Please add data in grid");
                        return false;
                    } else {
                        return true;
                    }
                }

                function getDate(slno) {

                    var ex1 = $("#" + slno).val();
                    var ex2 = dateconvert(ex1);
                    //              
                    var exp = moment(ex2).format("YYYY-MM-DD");
                    var today = moment(Date()).format("YYYY-MM-DD");
                    var dateformat = /^(?:(?:31(\/)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/;
                    if (!ex1.match(dateformat))
                    {
                        alert("You have entered an invalid date!");
                        $("#" + slno).val('');
                        return false;
                    }
                    else if (exp < today) {

                        alert("Date already expired");
                        $("#" + slno).val('');
                    }

                }
                function dateconvert(input) {

                    var date = input.split("/");
                    var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
                    for (var j = 0; j < months.length; j++) {
                        if (date[1] == months[j]) {
                            date[1] = months.indexOf(months[j]) + 1;
                        }
                    }
                    if (date[1] < 10) {
                        date[1] = date[1];
                    }
                    var formattedDate = date[2] + "/" + date[1] + "/" + date[0];
                    return formattedDate;
                }

            </script>
            <script>

//            jQuery(document).ready(function () {
//            $('#poeditform').validationEngine();
//            //                    location.reload();
//
//            //                    var inputval1 = '#requisitionUom';
//            //                    $(document).on('keyup change',inputval1,function () {
//            //                        var gt = 0;
//            //                        var totalbefdisc = 0;
//            //                        var totaldiscAmt = 0;
//            //                        var $itemRow = $(this).closest('tr');
//            //                        var z = $itemRow.find('#qty').val();
//            //                        var zz = $itemRow.find('#price').val();
//            //                        var ccc = $itemRow.find('#discount').val();
//            //                        var lumsumdiscount = $('#lumsumdiscount').val();
//            //                        var convFact = $itemRow.find('#requisitionUom').val();
//            //                        var conVal = convFact.split("-");
//            //                        $itemRow.find('#price').val();
//            //                        var befdiscount = $itemRow.find('#qty').val() * $itemRow.find('#price').val() / parseFloat(conVal[0]);
//            //                        $itemRow.find('#befdisc').val(parseFloat(befdiscount).toFixed(3));
//            //                        var uprice = $itemRow.find('#price').val() / parseFloat(conVal[0]);
//            //
//            //                        $itemRow.find('#price').val("");
//            //
//            //                        var discount = $itemRow.find('#qty').val() * $itemRow.find('#price').val() * (1 - $itemRow.find('#discount').val() / 100) / parseFloat(conVal[0]);
//            ////                        var discountfinal = roundNumber(discount, 3);
//            //                        var disPrice = parseFloat(befdiscount).toFixed(3) - parseFloat(discount).toFixed(3);
//            //                        $itemRow.find('#discountPrice').val(parseFloat(disPrice).toFixed(3));
//            //                        isNaN(discount) ? $itemRow.find('#total').val("N/A") : $itemRow.find('#total').val(parseFloat(discount).toFixed(3));
//            //                        $('tr#quotPoForm').each(function () {
//            //                            var $itemRow = $(this).closest('tr');
//            //                            var total = $itemRow.find('#total').val();
//            //                            var tbd = $itemRow.find('#befdisc').val();
//            //                            var tda = $itemRow.find('#discountPrice').val();
//            //                            totalbefdisc = parseFloat(tbd) + parseFloat(totalbefdisc);
//            //                            totaldiscAmt = parseFloat(tda) + parseFloat(totaldiscAmt);
//            //                            gt = parseFloat(total) + parseFloat(gt);
//            //                        });
//            //                        $('#totalAmtBefDis').val(parseFloat(totalbefdisc).toFixed(3));
//            //                        $('#totalDisAmt').val(parseFloat(totaldiscAmt).toFixed(3));
//            //                        $('#totalAmt').val(parseFloat(gt).toFixed(3));
//            //                        gt = gt * (1 - lumsumdiscount / 100)
//            //                        $('#grandTotal').val(parseFloat(gt).toFixed(3));
//            //
//            //
//            //                    });
//
//            var inputval = '#qty, #discount,#price,#ondel';
//            $(document).on('keyup change click', inputval, function () {
//            var gt = 0;
//            var totalbefdisc = 0;
//            var totaldiscAmt = 0;
//            var $itemRow = $(this).closest('tr');
//            var z = $itemRow.find('#qty').val();
//            var zz = $itemRow.find('#price').val();
//            var ccc = $itemRow.find('#discount').val();
//            var lumsumdiscount = $('#lumsumdiscount').val();
//            var convFact = $itemRow.find('#requisitionUom').val();
//            var conVal = convFact.split("-");
//            var befdiscount = $itemRow.find('#qty').val() * $itemRow.find('#price').val();
//            $itemRow.find('#befdisc').val(parseFloat(befdiscount).toFixed(3));
//
//            var discount = $itemRow.find('#qty').val() * $itemRow.find('#price').val() * (1 - $itemRow.find('#discount').val() / 100);
//            //                        var discountfinal = roundNumber(discount, 3);
//            var disPrice = parseFloat(befdiscount).toFixed(3) - parseFloat(discount).toFixed(3)
//            $itemRow.find('#discountPrice').val(parseFloat(disPrice).toFixed(3));
//            isNaN(discount) ? $itemRow.find('#total').val("N/A") : $itemRow.find('#total').val(parseFloat(discount).toFixed(3));
//            $('tr#quotPoForm').each(function () {
//            var $itemRow = $(this).closest('tr');
//            var total = $itemRow.find("input[name='total']").val();
//            if (total != '' && !isNaN(total)) {
//            gt = parseFloat(total) + parseFloat(gt);
//            }
//            var tbd = $itemRow.find("input[name='befdisc']").val();
//            if (tbd != '' && !isNaN(tbd)) {
//            totalbefdisc = parseFloat(tbd) + parseFloat(totalbefdisc);
//            }
//            var tda = $itemRow.find("input[name='discountPrice']").val();
//            if (tda != '' && !isNaN(tda)) {
//            totaldiscAmt = parseFloat(tda) + parseFloat(totaldiscAmt);
//            }
//            });
//            $('#totalAmtBefDis').val(parseFloat(totalbefdisc).toFixed(3));
//            $('#totalDisAmt').val(parseFloat(totaldiscAmt).toFixed(3));
//            $('#totalAmt').val(parseFloat(gt).toFixed(3));
//            gt = gt * (1 - lumsumdiscount / 100)
//            $('#grandTotal').val(parseFloat(gt).toFixed(3));
//
//
//            });
//
//            $('#lumsumdiscount').on('keyup change', function () {
//            var gt = 0;
//            var lumsumdiscount = $('#lumsumdiscount').val();
//            $('tr#quotPoForm').each(function () {
//            var $itemRow = $(this).closest('tr');
//            var total = $itemRow.find('#total').val();
//            gt = parseFloat(total) + parseFloat(gt);
//            });
//            gt = gt * (1 - lumsumdiscount / 100);
//            $('#grandTotal').val(parseFloat(gt).toFixed(3));
//            });
//
//
//            //                $('#currency').on('change', function () {
//            //                    var gt = 0;
//            //                    $('tr#quotPoForm').each(function () {
//            //                        var $itemRow = $(this).closest('tr');
//            //                        var z = $itemRow.find('#qty').val();
//            //                        var zz = $itemRow.find('#price').val();
//            //                        var ccc = $itemRow.find('#discount').val();
//            //                        var discount = $itemRow.find('#qty').val() * $itemRow.find('#price').val() * (1 - $itemRow.find('#discount').val() / 100);
//            //                        var discountfinal = roundNumber(discount, 2);
//            //                        isNaN(discount) ? $itemRow.find('#total').val("N/A") : $itemRow.find('#total').val(discountfinal);
//            //
//            //                        var $itemRow = $(this).closest('tr');
//            //                        var total = $itemRow.find('#total').val();
//            //                        gt = parseFloat(total) + parseFloat(gt);
//            //                    });
//            //                    $('#grandTotal').val(parseFloat(gt));
//            //                });
//
//
//
//            });
            </script>

            <script>
                $(document).ready(function () {
                    // gridEditArrowKey();
                    calUpdateTotal = null;
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
                            for (var i = 0; i < nameArray.length - 1; i++) {
                                toAppend += '<option value=' + '1' + '-' + nameArray[i] + '>' + nameArray[i] + '</option>';
                            }
                            // toAppend += '<option value="">Select an Option</option>';                                                                   
                            //                                                                    for (var i = 0; i < nameArray.length; i++) {
//                            if (nameArray[0] == nameArray[1]) {
//                                if (nameArray[0] != "") {
//                                    toAppend += '<option selected value=' + '1' + '-' + nameArray[0] + '>' + nameArray[0] + '</option>';
//                                }
//                                if (nameArray[2] != "" && nameArray[2] !== 'null' && nameArray[5] !== 'null' && parseFloat(nameArray[5]) !== 0) {
//                                    toAppend += '<option value=' + '1' + '-' + nameArray[2] + '>' + nameArray[2] + '</option>';
//                                }
//                                if (nameArray[3] != "" && nameArray[3] !== 'null' && nameArray[6] !== 'null' && parseFloat(nameArray[6]) !== 0) {
//                                    toAppend += '<option value=' + '1' + '-' + nameArray[3] + '>' + nameArray[3] + '</option>';
//                                }
//                            } else {
//                                if (nameArray[0] != "") {
//                                    toAppend += '<option selected value=' + '1' + '-' + nameArray[0] + '>' + nameArray[0] + '</option>';
//                                }
//
//                                if (nameArray[1] != "" && nameArray[1] !== 'null' && nameArray[4] !== 'null' && parseFloat(nameArray[4]) !== 0) {
//                                    toAppend += '<option value=' + '1' + '-' + nameArray[1] + '>' + nameArray[1] + '</option>';
//
//                                }
//                                if (nameArray[2] != "" && nameArray[2] !== 'null' && nameArray[5] !== 'null' && parseFloat(nameArray[5]) !== 0) {
//                                    toAppend += '<option value=' + '1' + '-' + nameArray[2] + '>' + nameArray[2] + '</option>';
//                                }
//                                if (nameArray[3] != "" && nameArray[3] !== 'null' && nameArray[6] !== 'null' && parseFloat(nameArray[6]) !== 0) {
//                                    toAppend += '<option value=' + '1' + '-' + nameArray[3] + '>' + nameArray[3] + '</option>';
//                                }
//                            }


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
//                            $('#requisitionUom').append(toAppend);
                            $itemRow1UF.find('#requisitionUom option').each(function () {
                                var curUom = $itemRow1UF.find(this).val().split('-');
                                if (requisitionUom === curUom[1])
                                {
                                    $itemRow1UF.find(this).prop('selected', true);
                                }
                            });
                            unitPrice($itemRow1UF, c, suppCode, calUpdateTotal);
                        }
                    });
                }
                function unitPrice($itemRow1UF, c, suppCode, val)
                {
                    var $itemRow1UF = $($itemRow1UF).closest('tr');
                    var requisitionUom = $itemRow1UF.find('#requisitionUom').val();
                    var unit = requisitionUom.split("-");
                    var uom = unit[1];
                    if (val == 'calUpdateTotal')
                    {
                        $.ajax({
                            type: "POST",
                            url: "../purchase/uomWiseUnitPrice.htm",
                            data: {
                                code: c,
                                suppCode: suppCode,
                                uom: uom
                            },
                            success: function (data) {

                                //                                                                    alert(data);   
                                $itemRow1UF.find('#price').val(data);
                                updateGrandTotal();
                            }

                        });
                    }
                }


                function changeCurrency() {

                    var potype = $('#potype').val();
                    if (potype === 'Local')
                    {
                        $('#currency').html('<option value="OMR">OMR</option>');
                        $('#currCode').val('OMR');
                        return true;
                    } else
                    {
                        var xyz = '<option value="">Select Currency</option><c:forEach items="${currencyList}" var="list"><option value="${list.currencyCode}">${list.currencyCode}</option></c:forEach>';
                        $('#currency').html(xyz);
                    }

                }
                function selectCurrency() {
                    $('#currCode').val($('#currency').val());
                }

                function deleteRow($row) {
                    //                                                                var rowCount = $('#example tr').length;                                                               
                    var nex = $($row).closest('tr').next('tr').length;
                    var prev = $($row).closest('tr').prev('tr').length;
                    var i = $row.parentNode.parentNode.rowIndex;
                    if (nex != 0 || prev != 0) {
                        $('#pkItemDel').val($('#pkItemDel').val() + ',' + $row.value);
                        document.getElementById("example").deleteRow(i);
                        updateGrandTotal();
                        return;
                    } else {
                        alert('You can not delete this row...!!!');
                        return false;
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
                function selectDeliveryLoc() {

                    myWindow = window.open("../purchase/deliveryLocPopUp.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                }

                function selectBillToLoc() {

                    myWindow = window.open("../purchase/billToLocPopUp.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                }


            </script>

            <script>
                jQuery(document).ready(function () {

                    $('tr#quotPoForm').each(function () {
                        var $itemRow = $(this).closest('tr');
                        var itemCat = $itemRow.find("input[name='itemCat']").val();
                        if (itemCat == 'Asset')
                        {
                            $('#itemCat').html('<option value="Asset">Asset</option>');
                        }
                        if (itemCat == 'Material') {
                            $('#itemCat').html('<option value="Material">Material</option>\n\
                                                <option value="Service">Service</option>');
                        }
                        if (itemCat == 'Service') {
                            $('#itemCat').html('<option value="Service">Service</option>\n\
                                                <option value="Material">Material</option>');
                        }
                    });
                    formmodified = 0;
                    $('form *').change(function () {
                        formmodified = 1;
                    });
//                    window.onbeforeunload = confirmExit;
//                    function confirmExit() {
//                        if (formmodified == 1) {
//                            return "New information saved. Do you wish to leave the page?";
//                        }
//                    }
                    $("button[name='commit']").click(function () {
                        formmodified = 0;
                    });
                    updateGrandTotal(); // when page refresh the page it will call the function.
                    $('#poeditform').validationEngine();
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
                        var dis = $itemRow.find('#discount1').val();
                        if (parseFloat(dis) >= 100) {
                            alert("Discount(%) should be less than 100 !!!");
                            $itemRow.find('#discount').val("0.000");
                            $itemRow.find('#discount1').val("0.000");
                            $itemRow.find('#discountPrice').val("0.000");
                        }
                        priceCalcute(this);
                    });
                    /*$(document).on('input', '#lumsumdiscount1', function () {
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
                     var lumsumAmt = parseFloat(totalAmt).toFixed(3) - parseFloat(gt).toFixed(3);
                     $('#lumsumamt').val(parseFloat(lumsumAmt).toFixed(3));
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
                     $('#lumsumdiscount').val('0.000');
                     $('#lumsumdiscount1').val('0.000');
                     lumsumCalculate();
                     return false;
                     }
                     
                     else
                     {
                     var lumsumdis = (parseFloat(lumsumamt).toFixed(3) / parseFloat(gt).toFixed(3)) * 100;
                     $('#lumsumdiscount').val(lumsumdis);
                     $('#lumsumdiscount1').val(parseFloat(lumsumdis).toFixed(3));
                     lumsumCalculate();
                     }
                     
                     } else {
                     $('#lumsumdiscount1').val("0.000");
                     $('#lumsumdiscount').val('0.000');
                     lumsumCalculate();
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
                        var tda = $itemRow.find('#discountPrice').val() || 0.000;
                        totalbefdisc = parseFloat(tbd) + parseFloat(totalbefdisc);
                        totaldiscAmt = parseFloat(tda) + parseFloat(totaldiscAmt);
                        gt = parseFloat(total) + parseFloat(gt);
                    });
                    $('#totalAmtBefDis').val(parseFloat(totalbefdisc).toFixed(3));
                    $('#totalDisAmt').val(parseFloat(totaldiscAmt).toFixed(3));
                    $('#totalAmt').val(parseFloat(gt).toFixed(3));
                    gt = gt * (1); // - lumsumdiscount / 100)
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
//                    $('#lumsumdiscount').val('0.000');
                    //var lumsumdiscount = $('#lumsumdiscount').val();
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
                    gt = gt * (1); // - lumsumdiscount / 100)
                    //var lumsumAmt = parseFloat($('#totalAmt').val()).toFixed(3) - parseFloat(gt).toFixed(3);
                    //$('#lumsumamt').val(parseFloat(lumsumAmt).toFixed(3));
                    $('#grandTotal').val(parseFloat(gt).toFixed(3));
                }


                function test()
                {

                    var potype = document.getElementById("potype").value;
                    var potype1 = document.getElementById("potype1").value;
                    var curr = document.getElementById("currency1").value;
                    var curr1 = document.getElementById("currency").value;
                    var itm = document.getElementById("itemCat").value;
                    var itm1 = document.getElementById("itemCat2").value;
                    var qt = document.getElementById("qty").value;
                    var qt1 = document.getElementById("qty1").value;
                    //                    var ruom = document.getElementById("requisitionUom").value;
//                    alert(ruom);
//                    var ruom1 = document.getElementById("requisitionUom1").value;
//                    alert(ruom1);
//                    var pri = document.getElementById("uprice").value;
//                    alert(pri);
//                    var pri1 = document.getElementById("price1").value;
//                    alert(pri1);
                    var dis = document.getElementById("discount1").value;
                    var dis1 = document.getElementById("discount").value;
                    var disp = document.getElementById("discountPrice").value;
                    var disp1 = document.getElementById("discountPrice1").value;
                    var ddate = document.getElementById("delDate").value;
                    var ddate1 = document.getElementById("delDate1").value;
                    var pter = document.getElementById("payTerms").value;
                    var pter1 = document.getElementById("payTerms1").value;
                    var dter = document.getElementById("delTerms").value;
                    var dter1 = document.getElementById("delTerms1").value;
                    var war = document.getElementById("warranty").value;
                    var war1 = document.getElementById("warranty1").value;
                    var pono = document.getElementById("poNote").value;
                    var pono1 = document.getElementById("poNote1").value;

                    if (document.getElementById("itemCat").value == "")
                    {
                        alert("Enter Item Category");
                        return false;
                    } else if (document.getElementById("qty").value == "")
                    {
                        alert("Enter Quantity");
                        return false;
                    }
//                    else if (document.getElementById("price").value == "")
//                    {
//                        alert("Enter Unit Price");
//                        return false;
//                    } 
                    else if (document.getElementById("discount1").value == "")
                    {
                        alert("Enter Discount");
                        return false;
                    } else if (document.getElementById("discountPrice").value == "")
                    {
                        alert("Enter Discount Price");
                        return false;
                    } else if (document.getElementById("delDate").value == "")
                    {
                        alert("Enter Delivery Date");
                        return false;
                    }
                    else if (document.getElementById("payTerms").value == "")
                    {
                        alert("Enter Pay Terms");
                        return false;
                    }
                    else if (document.getElementById("delTerms").value == "")
                    {
                        alert("Enter Delivery Terms");
                        return false;
                    }
                    else {

                        if (potype !== potype1 || curr !== curr1 || itm !== itm1 || qt !== qt1
                                || dis !== dis1
                                || disp !== disp1 || ddate !== ddate1 || pter !== pter1
                                || dter !== dter1 || war !== war1 || pono !== pono1) {
                            if (confirm('Do you really want to Save this updated record')) {
                                document.forms["poeditform"].submit();
                                return true;
                            } else {
                                return true;
                            }

                        } else {

                            document.forms["poeditform"].submit();
                        }
                    }

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
                            $itemRow.find('#discount').val('0.000');
                            $itemRow.find('#discount1').val('0.000');
                            return false;
                        } else {
                            var dis = (parseFloat(discountPrice).toFixed(3) / parseFloat(befdisc).toFixed(3)) * 100;
                            $itemRow.find('#discount').val(parseFloat(dis));
                            $itemRow.find('#discount1').val(parseFloat(dis).toFixed(3));
                            priceCalcute($this);
                        }
                    } else {

                        $itemRow.find('#discount').val('0.000');
                        $itemRow.find('#discount1').val('0.000');
                        $itemRow.find('#totalDisAmt').val('0.000');
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
                 }
                 function checkLumAmt() {
                 var lum = $('#lumsumdiscount1').val();
                 if (parseFloat(lum) >= 100) {
                 
                 alert("Discount(%) should be less than 100 !!!");
                 $('#lumsumdiscount1').val("0.000");
                 $('#lumsumdiscount').val("0.000");
                 $('#lumsumamt').val("0.000");
                 $('#grandTotal').val($('#total').val());
                 
                 }*/

                // }
            </script>


            <script>
                NProgress.done();
            </script>
    </body>

</html>
