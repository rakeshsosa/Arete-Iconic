<%-- 
    Document   : poView
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

        <link href="../common/theme/css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">

        <script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>
        <script>
            jQuery(document).ready(function () {

                var inputval = '#qty, #discount,#price';
                $(inputval).on('keyup', function () {
                    var gt = 0;
                    var $itemRow = $(this).closest('tr');
                    var z = $itemRow.find('#qty').val();
                    var zz = $itemRow.find('#price').val();
                    var ccc = $itemRow.find('#discount').val();
                    var discount = $itemRow.find('#qty').val() * $itemRow.find('#price').val() * (1 - $itemRow.find('#discount').val() / 100);
                    var discountfinal = roundNumber(discount, 2);
                    isNaN(discount) ? $itemRow.find('#total').val("N/A") : $itemRow.find('#total').val(discountfinal);
                    $('tr#quotPoForm').each(function () {
                        var $itemRow = $(this).closest('tr');
                        var total = $itemRow.find('#total').val();
                        gt = parseFloat(total) + parseFloat(gt);
                    });
                    $('#grandTotal').val(parseFloat(gt));
                });

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
        </script>
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
                        <div class="clearfix"></div>

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


                                <form id="quotform" class="form-inline" method="post" action="../purchOrder/poEditSubmit.htm" enctype="multipart/form-data">
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
                                        <select  id="potype" name="potype" data-rel="chosen" disabled="" required="" class="form-control validate[required]">
                                            <option value="${potype}">${potype}</option>  
                                        </select> 
                                    </div> &nbsp;

                                    <div > 
                                        <label class="control-label">Currency:</label>
                                        <select  id="currency" name="currency" data-rel="chosen" disabled=""  required="" class="form-control  validate[required]" >                                            
                                            <option value="${currency}">${currency}</option> 

                                        </select>  
                                    </div>
                                    &nbsp;
                                    <%--<div>
                                        <label class="control-label">Cost Center:</label>
                                        <select disabled id="costCenter" name="costCenter" data-rel="chosen"   class="form-control validate[required]">
                                            <option value="${costcenterDesc}/${costcenterCode}">${costcenterDesc}/${costcenterCode}</option>  
                                            <c:forEach items="${costCenterList}" var="type">
                                                <option value="${type.costcenterDesc}/${type.costcenterCode}">${type.costcenterDesc}/${type.costcenterCode}</option>  

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
                                                            <strong><div id="enduser">Bill To Location</div></strong>
                                                            <br/>
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
                            <div class="x_content">
                                <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                    <thead>
                                        <tr class="headings">  
                                            <!--<th><i class="fa fa-trash-o"></i></th>-->
                                            <!--<th>Item Code</th>-->
                                            <th>Item Sub Category</th>
                                            <th>Item Name</th>
                                            <th>Item Desc</th>                                        
                                            <th style="width:10%;">Quantity</th>
                                            <th>Unit</th>
                                            <th>Unit Price</th>
                                            <th>Total Amount</th>
                                            <th>Discount(%)</th>
                                            <th>Discount Amount</th> 
                                            <th>Total Amount After Discount</th>
                                            <th>Delivery Date</th>
                                            <th>Status</th>

                                        </tr>
                                    </thead>

                                    <tbody>
                                        <c:set var="gtotal" value="0.0"/>
                                        <c:set var="totalbefdisAmt" value="0.0"/>
                                        <c:set var="totaldisAmt" value="0.0"/>
                                        <c:forEach items="${poList}" var="type"> 
                                            <tr id="quotPoForm" >
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
                                                    <input class="form-control" id="" name="itemCode"  type="hidden" value="${type.itemCode}">
                                                </td>                                             
                                                <td>${type.itemSubCategory}
                                                    <input class="form-control" id="itemDesc" name="itemDesc"  type="hidden" value="${type.description}"></td>
                                                <td>${type.itemName}
                                                    <input class="form-control" id="itemName" name="itemName"  type="hidden" value="${type.itemName}"></td>  
                                                <td>${type.description}</td>                                              
                                                <td style="text-align: right"><input class="right form-control input-mini validate[required,custom[float5]]" readonly="" autocomplete="off" required="" name="qty" id="qty" onkeypress="return isNumberKey(event)"  type="hidden" value="${type.qty}">${type.qty}</td>  
                                                <td>${type.uom}</td>
                                                <td style="text-align: right"><input style="text-align: right" class="right form-control  input-mini validate[required,custom[float5]]" required="" autocomplete="off" readonly="" onkeypress="return check_digit(event, this, 6, 3);" name="price" id="price" type="hidden" value="${type.unitPrice}"><fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${type.unitPrice}"/></td>
                                                <td style="text-align: right"><fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${type.qty*type.unitPrice}"/></td>
                                                <td style="text-align: right"><input style="text-align: right" class="right form-control  input-mini" required="" readonly=""  autocomplete="off" name="discount" id="discount" onkeypress="return check_digit(event, this, 2, 3);" type="hidden" value="${type.discount}"><fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${type.discount}"/></td>

                                                <td style="text-align: right"><fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${(type.qty*type.unitPrice)*(type.discount/100)}"/></td>

                                                <td style="text-align: right">
                                                    <fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${type.totalValue}"/>
                                                    <input class="right form-control  input-mini" id="total" name="total" type="hidden" value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${type.totalValue}"/>" readonly=""></td>
                                                <td><input class=" form-control input-small" readonly=""  name="delDate" readonly="" id="reqBefore${type.SNo}" type="hidden" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.requiredDate}"/>" onclick="javascript:NewCssCal('reqBefore${type.SNo}', 'ddMMMyyyy', '', '', '', '', 'future')"><fmt:formatDate pattern="dd-MMM-yyyy" value="${type.requiredDate}"/></td>
                                                <td>${type.approvalStatus}</td>
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

                                    <label class="control-label" style="font-size:12px;">Payment Terms</label>
                                    <input class="form-control  input-mini" id="warranty" readonly="" name="payTerms" type="text" value="${paymentTerms}">


                                    <label class="control-label" style="font-size:12px;">Delivery Terms</label>
                                    <input class="form-control  input-mini" id="warranty" readonly="" name="delTerms" type="text" value="${deliveryTerms}" >

                                    <label class="control-label" style="font-size:12px;">Warranty Period</label>
                                    <input class="form-control  input-mini" id="warranty" readonly="" name="warranty" type="text" value="${warrantyPeriod}"  maxlength="50">

                                    <label class="control-label" style="font-size:12px;">PO Note:</label>
                                    <textarea class="form-control input-mini" readonly="" required="" rows="3" style="resize: none" id="poNote" name="poNote" type="text" value="" maxlength="180">${poNote}</textarea>

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
                                    <label class="control-label" style="font-size:  12px;" >Lumsum Discount(%):</label>
                                    <!--<span class="btn btn-sm">INR</span>-->                                   
                                    <input class="right form-control input-mini validate[custom[float5]]" readonly="" maxlength="6" style="width: 70px" autocomplete="off" style="font-weight: bold" onpaste="return false" onkeypress="return check_digit(event, this, 2, 2);" id="lumsumdiscount" name="lumsumdiscount" type="text" value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${lumsumDiscount}"/>">

                                </div> &nbsp;
                                <div class="col-xs-offset-8 form-inline"> 
                                    <label class="control-label" style="font-size:  12px;" >Lumsum Discount Amount:</label>  
                                    <input class="right form-control input-mini validate[custom[float5]]" readonly="" onpaste="return false"  autocomplete="off" style="font-weight: bold" onkeypress="return check_digit(event, this, 10, 3);" id="lumsumamt" type="text" value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${lumsumamt}"/>">

                                </div>--%> &nbsp;
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
                                    <!--<button type="submit" class="btn btn-primary" style=""><i class="fa fa-floppy-o" style="font-size: 15px"></i> SAVE</button>-->
                                    <!--<a href="../purchOrder/poList.htm"><button type="button" class="btn btn-info" style="">Back</button></a>--> 

                                    <!--</div>-->
                                </div>
                            </div>

                            <br/>

                            <!-- /page content -->

                            </form>
                            <div class="clearfix"></div>



                        </div>

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
                $(document).ready(function () {
                    $('input.tableflat').iCheck({
                        checkboxClass: 'icheckbox_flat-green', radioClass: 'iradio_flat-green'
                    });
                });
                var asInitVals = new Array();
                $(document).ready(function () {
                    var oTable = $('#example').dataTable({
                        "oLanguage": {
                            "sSearch": "Search all columns:"
                        },
                        "aoColumnDefs": [
                            {
                                'bSortable': true,
                                'aTargets': [0]
                            } //disables sorting for column one
                        ],
                        'iDisplayLength': 10, "sPaginationType": "full_numbers",
                        "dom": 'T<"clear">lfrtip',
                        "tableTools": {
                            "sSwfPath": "<?php echo base_url('assets2/js/Datatables/tools/swf/copy_csv_xls_pdf.swf'); ?>"
                        }
                    });
                    $("tfoot input").keyup(function () {
                        /* Filter on the column based on the index of this element's parent <th> */
                        oTable.fnFilter(this.value, $("tfoot th").index($(this).parent()));
                    });
                    $("tfoot input").each(function (i) {
                        asInitVals[i] = this.value;
                    });
                    $("tfoot input").focus(function () {
                        if (this.className == "search_init") {
                            this.className = "";
                            this.value = "";
                        }
                    });
                    $("tfoot input").blur(function (i) {
                        if (this.value == "") {
                            this.className = "search_init";
                            this.value = asInitVals[$("tfoot input").index(this)];
                        }
                    });
                });
            </script>

            <script>
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

                    myWindow = window.open("../purchReq/selectSuppnamePopup.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
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

    </body>

</html>
