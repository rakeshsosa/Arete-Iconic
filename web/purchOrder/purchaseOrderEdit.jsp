<%-- 
    Document   : poForm
    Created on : Feb 23, 2016, 3:24:29 PM
    Author     : Nataraj
--%>

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
        <script type="text/javascript" src="../purchOrder/mouseOverPrevPO.js"></script>
        <link href="../purchOrder/mouseOverPrevPo.css" rel="stylesheet">
        <script src="../common/validate/Check_Digit.js" type="text/javascript"></script>
    </head>


    <body class="nav-sm">

         
        <jsp:include page="../login/menu.htm" />


        <main id="main" class="main">
            <div>
                <jsp:include page="../login/headerlink.htm?submodule=Purchase Order&tab=Purchase Order&pagetype=form"/>
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
                        <form id="poForm" class="form-inline" method="post" action="../purchase/directPOFormSubmit.htm" enctype="multipart/form-data" onsubmit="return checkGrid();">
                            <div  class="row">



                                      
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">
                                           

                                            <c:choose>
                                                <c:when test="${fn:length(itemCreatList) > 0}">
                                                    <c:forEach items="${itemCreatList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control  input-xlarge validate[required]" readonly name="poNo" id="poNo" type="text" value="${type.requisitionNo}" > 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control  input-xlarge validate[required]" readonly type="text" value="${type.requisitionNo}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control  input-xlarge validate[required]" readonly value="${poNo}"  id="poNo" name="poNo" type="text">
                                                    <input class="form-control  input-xlarge" id="recordStatus" name="recordStatus" type="hidden" value="Need Review">
                                                    <input class="form-control  input-xlarge" id="" name="action" type="hidden" value="">

                                                </c:otherwise>        
                                            </c:choose>
                                                     <label class="control-label" for="selectError"><span style="color: red">*</span> PO No</label>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating">
                                             

                                            <c:choose>
                                                <c:when test="${fn:length(itemCreatList) > 0}">
                                                    <c:forEach items="${itemCreatList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control  input-xlarge validate[required]" name="purchaseType" id="purchaseType" data-rel="chosen"  value="${type.purchaseType}"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control  input-xlarge" readonly type="text" value="${type.purchaseType}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <select  name="purchaseType" id="purchaseType" data-rel="chosen" class="form-control validate[required]">
                                                        <!--<option value="">Select Options</option>--> 
                                                        <!--<option value="Assets">Assets</option>--> 
                                                        <option value="General">General</option>
                                                    </select>
                                                    <!--<input class="form-control  input-xlarge validate[required]" required=""  type="text" value="" name="purchaseType" id="purchaseType"  placeholder="Select Project">-->
                                                </c:otherwise>        
                                            </c:choose>
                                                    <label class="control-label"><span style="color: red">*</span> Purchase Type</label>
                                        </div>


                                <div class="col-md-12 col-sm-12 col-xs-12 row my-5 ">
                                    <div class="col-md-4 card card-body">
                                                     
                                                      <div class="d-flex mb-3 align-items-center">
                                                          <label class="col-md-6">Vendor Details </label>
                                                        <div class="col-md-6"><button class="btn btn-primary btn-sm"> Select Customer</button></div></div>

                                                        <div class="form-floating mb-3">
                                                                <input type="text" placeholder="Fill" class="form-control text-capitalize" id="customCompanyName" name="supplierName"
                                                                       placeholder="Enter Company Name" maxlength="50">
                                                                <label class="control-label" for="name">Name</label>
                                                        </div>

                                                        
                                                        <div class="form-floating mb-3">
                                                                <input type="text" placeholder="Fill" class="form-control text-capitalize" id="customCompanyName" name="supplierAddress"
                                                                       placeholder="Enter Company Name" maxlength="50">
                                                                <label class="control-label" for="name">Address</label>
                                                        </div>
                                        <div class="form-floating mb-3">
                                                                <input type="text" placeholder="Fill" class="form-control text-capitalize" id="customCompanyName" name="supplierContactNumber"
                                                                       placeholder="Enter Company Name" maxlength="50">
                                                                <label class="control-label" for="name">Contact Number</label>
                                                        </div>
                                        <div class="form-floating mb-3">
                                                                <input type="text" placeholder="Fill" class="form-control text-capitalize" id="customCompanyName" name="supplierEmail"
                                                                       placeholder="Enter Company Name" maxlength="50">
                                                                <label class="control-label" for="name">Email</label>
                                                        </div>
                                        
                                                    </div>
                                    
                                    <div class="col-md-4 ">
                                        <div class="card card-body">
                                                      <div class="d-flex mb-3 align-items-center">
                                                          <label class="col-md-6">Contact Person Details</label>
                                                        <div class="col-md-6"><button class="btn btn-primary btn-sm">Select Person</button></div></div>

                                                        <div class="form-floating mb-3">
                                                                <input type="text" placeholder="Fill" class="form-control text-capitalize" id="customCompanyName" name="contactPersonName"
                                                                       placeholder="Enter Company Name" maxlength="50">
                                                                <label class="control-label" for="name">Name</label>
                                                        </div>

                                                        
                                                        <div class="form-floating mb-3">
                                                                <input type="text" placeholder="Fill" class="form-control text-capitalize" id="customCompanyName" name="contactAddress"
                                                                       placeholder="Enter Company Name" maxlength="50">
                                                                <label class="control-label" for="name">Address</label>
                                                        </div>
                                        <div class="form-floating mb-3">
                                                                <input type="text" placeholder="Fill" class="form-control text-capitalize" id="customCompanyName" name="contactNumber"
                                                                       placeholder="Enter Company Name" maxlength="50">
                                                                <label class="control-label" for="name">Contact Number</label>
                                                        </div>
                                        <div class="form-floating mb-3">
                                                                <input type="text" placeholder="Fill" class="form-control text-capitalize" id="customCompanyName" name="contactEmail"
                                                                       placeholder="Enter Company Name" maxlength="50">
                                                                <label class="control-label" for="name">Email</label>
                                                        </div>
                                        </div>
                                                    </div>
                                    
                                    
                                    <div class="col-md-4 card card-body">
                                                     
                                                      <div class="d-flex mb-3 align-items-center">
                                                          <label class="col-md-6">Delivery Location</label>
                                                        <div class="col-md-6"><button class="btn btn-primary btn-sm">Select Location</button></div></div>

                                                        <div class="form-floating mb-3">
                                                                <input type="text" placeholder="Fill" class="form-control text-capitalize" id="customCompanyName" name="deliveryName"
                                                                       placeholder="Enter Company Name" maxlength="50">
                                                                <label class="control-label" for="name">Name</label>
                                                        </div>

                                                        
                                                        <div class="form-floating mb-3">
                                                                <input type="text" placeholder="Fill" class="form-control text-capitalize" id="customCompanyName" name="deliveryAddress"
                                                                       placeholder="Enter Company Name" maxlength="50">
                                                                <label class="control-label" for="name">Address</label>
                                                        </div>
                                        <div class="form-floating mb-3">
                                                                <input type="text" placeholder="Fill" class="form-control text-capitalize" id="customCompanyName" name="deliveryContact"
                                                                       placeholder="Enter Company Name" maxlength="50">
                                                                <label class="control-label" for="name">Contact Number</label>
                                                        </div>
                                        <div class="form-floating mb-3">
                                                                <input type="text" placeholder="Fill" class="form-control text-capitalize" id="customCompanyName" name="deliveryEmail"
                                                                       placeholder="Enter Company Name" maxlength="50">
                                                                <label class="control-label" for="name">Email</label>
                                                        </div>
                                        
                                                    </div>
                                </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating">
                                           

                                            <c:choose>
                                                <c:when test="${fn:length(itemCreatList) > 0}">
                                                    <c:forEach items="${itemCreatList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control  input-xlarge" name="poDate" readonly type="text" value="${type.requisitionDate}" onclick="scwShow(this, event);" > 
                                                                <input name="pk" type="hidden" value="${type.SNo}">
                                                                <input name="status" type="hidden" value="${type.status}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control  input-xlarge" readonly type="text" value="${type.requisitionDate}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control  input-xlarge" id="reqDate" name="poDate" readonly="" type="text" value="<%= (new SimpleDateFormat("dd-MMM-yyyy")).format(new java.util.Date())%>">
                                                    <input class="form-control  input-xlarge" id="" name="ReqDateNo" readonly="" type="hidden" value="<%= (new SimpleDateFormat("dd-MMM-yyyy")).format(new java.util.Date())%>">
                                                </c:otherwise>        
                                            </c:choose>
                                                     <label class="control-label"><span style="color: red">*</span> Expected Delivery Date</label>
                                        </div>                                        

                                       
                                        
                                      

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating">
                                            
                                            <!--<input  class="form-control validate[required]"   placeholder="" style="text-transform: capitalize" autocomplete="off" id="payTerms" name="payTerms" maxlength="180"  type="text" value="">-->                                                    
                                            <select  id="payTerms" name="payTerms" data-rel="chosen"  class="form-select  validate[required]" >
                                                <option value="">Select an option</option>
                                                <c:forEach items="${paytermslist}" var="list">
                                                    <option value="${list.termName}">${list.termName}</option> 
                                                </c:forEach>
                                            </select>  
                                            <label class="control-label"><span style="color: red">*</span> Payment Terms</label>
                                        </div>
                                        
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating">
                                           
                                            <!--<input  class="form-control validate[required]"   placeholder="" style="text-transform: capitalize" autocomplete="off" id="delTerms" name="delTerms" maxlength="180"  type="text" value="">-->                                                    
                                            <select  id="delTerms" name="delTerms" data-rel="chosen"  class="form-select  validate[required]" >
                                                <option value="">Select an option</option>
                                                <c:forEach items="${delivtermslist}" var="list">
                                                    <option value="${list.termName}">${list.termName}</option> 
                                                </c:forEach>
                                            </select>  
                                             <label class="control-label"><span style="color: red">*</span> Delivery Terms</label>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating">
                                            
                                            <c:choose>
                                                <c:when test="${fn:length(itemCreatList) > 0}">
                                                    <c:forEach items="${itemCreatList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <textarea class="form-control " rows="2" style="resize: none;" name="remarks">${type.actionRemarks}</textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea  class="form-control " rows="1" style="resize: none;" readonly>${type.actionRemarks}</textarea>
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <textarea class="form-control " placeholder="terms"   style="resize: none;" name="warrentyTerms" id="remarks" type="text" value="" maxlength="200"></textarea>

                                                </c:otherwise>         
                                            </c:choose>  
                                                    <label class="control-label" >&nbsp;&nbsp;Warranty Terms</label>
                                        </div>
                            </div>
                            

<!--                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color: red">*</span> Item Category</label>
                                            <c:choose>
                                                <c:when test="${fn:length(itemCreatList) > 0}">
                                                    <c:forEach items="${itemCreatList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input   class="form-control validate[required]" required readonly="" style="text-transform: capitalize" autocomplete="off" id="itemCat" name="itemCat"  maxlength="40"  type="text" value="${type.itemCategory}">                                                                                                                                 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" readonly type="text" value="${type.itemCategory}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <select  id="itemCat"  data-rel="chosen" class="form-control validate[required]" onchange="getItemSubCat();">
                                                    <option value="" selected disabled="">Select your option</option>
                                                                        <c:forEach items="${itemcategoryList}" var="list">                                                                
                                                                            <option value="${list.itemCategory}">${list.itemCategory}</option> 
                                                                        </c:forEach>
                                                        <option value="">Select an option</option>
                                                        <option value="Asset">Asset</option>
                                                        <option value="Material">Material</option>
                                                        <option value="Service">Service</option>
                                                        <%--<c:forEach items="${itemcategoryList}" var="type">
                                                            <option>${type.itemCategory}</option>
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
                                        </div>-->

<!--                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline" style="display: none">
                                            <label class="control-label"><span style="color: red">*</span> Item Description</label>                          
                                            <c:choose>
                                                <c:when test="${fn:length(itemCreatList) > 0}">
                                                    <c:forEach items="${itemCreatList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <textarea type="text" id="itemDesc" required name="itemDesc" class="form-control" style="resize: none" maxlength="100">${type.itemDesc}</textarea>

                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea type="text" readonly="" id="itemDesc"  name="itemDesc" class="form-control" style="resize: none" maxlength="100">${type.itemDesc}</textarea>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <textarea type="text" placeholder="" readonly="" id="itemDesc" class="form-control" style="resize: none"></textarea>

                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                        <p>&nbsp;</p>-->
                                        <!--                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                                                    <label class="control-label">Cost Center</label>
                                                                                    <select  id="costCenter" name="costCenter" data-rel="chosen"   class="form-control validate[required]">
                                                                                        <option value="">Select Cost Center</option>  
                                        <c:forEach items="${costCenterList}" var="type">
                                            <option value="${type.costcenterDesc}/${type.costcenterCode}">${type.costcenterDesc}/${type.costcenterCode}</option>  
                                        </c:forEach>
                                    </select>   
                                </div>                                       -->

                                        <div class="clearfix"></div>
                                                             
                                        <c:if test="${SNo eq null}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                     
                                                    <!--<button type="button" class="btn btn-succ" style="" onclick="addOrderRow_test();"><i class="fa fa-plus-circle" style="font-size: 15px"></i> ADD</button>-->

                                                </div>
                                            </div>

                                            <div class="clearfix"></div>



                                            <!--<div style="overflow:  scroll;height: auto;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">-->
                                            <div class="card" style="background-color:white;">
            
            <div id="productDetails">
                <div class="card-body">
                                        
                                    <div class="my-1" >
                                        <input type="button" class="btn btn-primary ml-3" value="Product">
                                        <div class="col-lg-12 invoice-body-list">
                                             <div style="margin-top: 20px;" class="table-responsive">
                                            <table class="table" id="myTable" style="border: 1px solid black;width:auto;overflow:scroll;width:1300px">
                                                <thead class="thead">
                                                    <tr class="">

                                                        <th class="invoice-detail-margin"style="width:10%">&nbsp;</th>
                                                        <th class="invoice-detail-sno"style="width:12%">S.No</th>
                                                        <!--                                            <th class="invoice-detail-itemtype">Product/Service</th>-->

                                                        <th class="invoice-detail-category " style="width:25%">Item</th>
                                                        
                                                        <th class="invoice-detail-summary " style="width:25%">Description</th>
                                                        <th class="invoice-detail-summary " style="width:25%">UOM</th>
                                                        <th class="invoice-detail-rate " style="width:25%">Selling Price</th>
                                                        <th class="invoice-detail-vat "style="width:16%">VAT(%)</th>
                                                        <th class="invoice-detail-vat "style="width:16%">Discount(%)</th>
                                                        <th class="invoice-detail-quantity "style="width:16%">Qty</th>
                                                        <th class="invoice-detail-vattotal " style="width:16%">VAT Amount</th>
                                                        <th class="invoice-detail-vattotal " style="width:16%">Discount Amount</th>
                                                        <th class="invoice-detail-total "style="width:16%">Amount</th>
                                                        
                                                        
                                                    </tr> 
                                                </thead>
                                                <tbody class="invoice-items" id="commontbody">
                                                    <tr class="item-row item-row-1 with-tax" id='myRow'>
                                                        <td class="item-row-actions">
                                                            
                                                            <input type="hidden" class="form-control" id="sno" name="sno"
                                                                   value="" >

                                                        </td>
                                                        <td>
                                                            <input type="text" style="width: auto;text-align: center;" class="form-control" autocomplete="off" id="slNo" name="slNo"
                                                                   value="1" size="1" readonly>
                                                            <input type="hidden" style="width: auto;text-align: center;" class="form-control" id="itemtype" name="itemtype" value="Product">
                                                        </td>
                                                <td>
                                                    <input type="text" placeholder="Item Name" class="form-control" id="category0" name="productCategory" maxlength="100" required>
                                                </td>
                                                
                                                <td style="width: 150px">
                                                    <input type="text" class="form-control" placeholder="Enter Product Name" autocomplete="off" id="itemdesc" name="itemdesc"
                                                           value="" style="display: none;" disabled="true">
                                                    <span class="item-row-description">
                                                        <input class="item-description-input form-control" maxlength="100" placeholder="Item Description" name="itemdetails" id="itemdetails" >
                                                    </span>
                                                </td>
                                                <td>
                                                    <input type="text" placeholder="UOM" class="form-control" id="uomType" name="uomType" maxlength="100" required>
                                                    <input type="hidden" id="prodservicetimespan" name="servicetimespan" value="">
                                                </td>
                                                <td><input style="width: 70px;" type="text" class="form-control itemrate" placeholder="0.00" autocomplete="off" id="itemrate0" name="itemrate" onkeypress="return isNumber(event)" onInput="calcTotal();calculateTotal(event)" 
                                                           value="0.00" maxlength="10">
                                                </td>
                                                <td><input style="width: 60px;" type="text" class="form-control vatpersAmt" placeholder="0" autocomplete="off" id="vatAmount" name="vatAmount" onInput="calcTotal()" onkeyup="return isNumberWithDot(event)"
                                                           value="0"  size="3" maxlength="6"></td>
                                                <td><input style="width: 60px;" type="text" class="form-control discperAmount" placeholder="0" autocomplete="off" id="itemDiscount" name="itemDiscount" onInput="calcTotal()" onkeyup="return isNumberWithDot(event)"
                                                           value="0"  size="3" maxlength="6"></td>
                                                <td><input style="width: 50px;" type="text" class="form-control itemQty" autocomplete="off" placeholder="0" value="1" id="itemqty" name="itemqty" onInput="calcTotal();calculateTotal(event)" onkeypress="return isNumber(event)"
                                                           size="3" maxlength="5">
                                                    <input type="hidden" class="form-control" value="0" name="stock" id="stock">
                                                </td>
                                                <td class=""><div class="d-flex"><span class="currency"></span><span><input style="width:60px;" type="text" size="10" readonly class="border-0" style="user-select: none;outline: none;"  value="0.00" name="itemvattotal" id="itemvattotal"></span></div></td>
                                                <td class=""><div class="d-flex"><span class="currency"></span><span><input style="width:60px;" type="text" size="10" readonly class="border-0" style="user-select: none;outline: none;"  value="0.00" name="itemdisctotal" id="itemdisctotal"></span></div></td>
                                                <td class=""><div class="d-flex"><span class="currency"></span><span><input style="width:60px;" type="text" size="10" readonly class="border-0" style="user-select: none;outline: none;"  value="0.00" name="itemtotal" id="itemtotal"></span></div></td>
                                               
                                                </tr>

                                                </tbody>

                                            </table>
<!--                                            <tr class="item-row item-row-n">
                                                <td class="item-row-actions" colspan="6"><button id="invoice-item-add"
                                                                                                 title="Add Item" class="btn btn-light border my-2" onClick="addRow(event)"><i
                                                            class="fas fa-plus"></i>Add Product</button></td>
                                            </tr>-->
    <div style="margin-top: 10px;">
                                                    <div class="">
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
<button id="invoice-item-add" title="Add Item" class="btn btn-primary border my-2" onClick="addRow(event)"><i
                                                            class="fa fa-plus"></i> Add Product</button>
                                                        </div>
                                                    </div>
                                                </div>
                                        </div>   </div>
                                    </div>

                                </div>  
                                </div>
                                </div>
                                        </c:if>
                                        <br/>
                                        <hr >
                                    <div class="row">
                                        <div class="col-lg-7"></div>
                                        <div class="col-lg-5 float-right invoice-totals">
                                            <div class="row">
                                                <div class="col text-right">Subtotal</div>
                                                <div class="col text-right">
                                                    <span class="currency"></span>
                                                    <input type="text" readonly class="border-0" style="user-select: none;outline: none;" size="10" value="0.00" name="subTotal" id="subTotalInput">
                                                    <span class="currency-right"></span>
                                                </div>
                                            </div>
                                            <div class="row tax-summary-container">
                                                <div class="taxlabel text-right col">Additional Tax (0%)</div>
                                                <div class="col text-right">
                                                    <!--                                            <input>-->
<!--                                                    <input name="incsummary" id="incsummary" type="text" readonly class="border-0 incsummary" style="user-select: none;outline: none;" size="2" value="">-->
                                                    <span class="currency"></span>
                                                    <input type="text" readonly class="border-0" style="user-select: none;outline: none;" size="10" value="0.00" name="taxpercent" id="taxpercent">
                                                    <span class="currency-right"></span>
                                                </div>
                                            </div>
                                            <div class="row vat-summary-container d-none">
                                                <div class="vatlabel text-right col">VAT</div>
                                                <div class="col text-right">
                                                    <!--                                            <input>-->
                                                    <input name="vatsummary" id="vatsummary" type="text" readonly class="border-0 vatsummary" style="user-select: none;outline: none;" size="2" value="">
                                                    <span class="currency"></span>
                                                    <input type="text" readonly class="border-0" style="user-select: none;outline: none;" size="10" value="0.00" name="vatpertotl" id="vatpertotl">
                                                    <span class="currency-right"></span>
                                                </div>
                                            </div>
                                           
                                            <div class="row disc-summary-container d-none">
                                                <div class="disclabel text-right col" dir="rtl">Discount (0)</div>
                                                <div class="text-right col">
                                                    <span class="minus-summary">-</span>
                                                    <span class="currency"></span>
                                                    <input type="text" readonly class="border-0" style="user-select: none;outline: none;" size="10" value="0.00" name="discpercent" id="discpercent">
                                                    <span class="currency-right"></span>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col text-right">Total</div>
                                                <div class="col text-right">
                                                    <span class="currency"></span>
                                                    <input type="text" readonly class="border-0" style="user-select: none;outline: none;" size="10" value="0.00" name="total" id="total">
                                                    <span class="currency-right"></span>
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                        <br/>
                                        <c:if test="${action ne 'view'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 col-md-offset-5 form-group">
                                                <div class="col-md-9 col-sm-9 col-xs-12 ">
                                                    <p>&nbsp;</p>
                                                    <button type="submit" class="btn btn-primary" style="">Save</button>
                                                    <a href="../purchase/poList.htm"><button type="button" class="btn btn-danger" style="">Cancel</button></a> 

                                                </div>
                                            </div>
                                        </c:if>

                                        <br/>
 
                        </form>
                    </div>
                        </div>

                    </div>
                </div>
            </section>

        </main><!-- End #main -->
        <jsp:include page="../login/footer.jsp" />

        <script>
         
            $(document).ready(function () {
                $('#grandTotal').val('');
                $('#totalAmt').val('');
                $('#totalAmtBefDis').val('');
                $('#totalDisAmt').val('');
            });
            function  getItemSubCat() {

                var itemCat = document.getElementById("itemCat").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../purchase/getItemSubCat.htm',
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


            /* $(document).on('input', '#lumsumdiscount1', function () {
             var gt = 0;
             var totalAmt = 0;
             $('#lumsumdiscount').val(this.value);
             var lumsumdiscount = $('#lumsumdiscount').val();
             
             if (isNaN(parseFloat(lumsumdiscount)))
             {
             return false;
             }
             $('#resourcetable tr').each(function () {
             var $itemRow = $(this).closest('tr');
             var total = $itemRow.find("input[name='total']").val();
             if (!isNaN(parseFloat(total)))
             {
             totalAmt = parseFloat(total) + parseFloat(totalAmt);
             }
             
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
             if (isNaN(parseFloat(lumsumamt)))
             {
             return false;
             }
             $('#resourcetable tr').each(function () {
             var $itemRow = $(this).closest('tr');
             total = $itemRow.find("input[name='total']").val();
             if (!isNaN(parseFloat(total)))
             {
             gt = parseFloat(total) + parseFloat(gt);
             }
             
             });
             if (!isNaN(parseFloat(lumsumamt))) {
             if (parseFloat(lumsumamt) >= parseFloat(gt)) {
             alert("Lumsum amount should be less than total amount...!!");
             $('#lumsumamt').val('0.000');
             $('#lumsumdiscount').val('0.000');
             $('#lumsumdiscount1').val('0.000');
             lumsumCalculate();
             return false;
             } else
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
             
             
             });
             
             function lumsumCalculate() {
             var gt = 0;
             var total = 0;
             //                var lumsumdiscount = $('#lumsumdiscount').val();
             var lumsumamt = $('#lumsumamt').val();
             $('#resourcetable tr').each(function () {
             var $itemRow = $(this).closest('tr');
             total = $itemRow.find("input[name='total']").val();
             if (!isNaN(parseFloat(total)))
             {
             gt = parseFloat(total) + parseFloat(gt);
             }
             
             });
             //                gt = gt * (1 - lumsumdiscount / 100);
             if (lumsumamt == '') {
             lumsumamt = 0;
             }
             var grandTotal = parseFloat(gt).toFixed(3) - parseFloat(lumsumamt).toFixed(3);
             $('#grandTotal').val(parseFloat(grandTotal).toFixed(3));
             }*/
            function caldiscountPrice(sno) {
                var qty = $('#qty' + sno).val();
                var unitPrice = $('#unitPrice' + sno).val();
                var convFact = $('#requisitionUom' + sno).val();
                var discount = $('#discount1' + sno).val();
                $('#discount' + sno).val(discount);
                var conVal = convFact.split("-");
                if (discount == '') {
                    discount = 0.000;
                }
                if (isNaN(parseFloat(qty)) || isNaN(parseFloat(unitPrice)) || isNaN(parseFloat(discount)))
                {
                    return false;
                }
                if (qty != '' && unitPrice != '')
                {
                    var price = parseFloat(qty).toFixed(3) * parseFloat(unitPrice).toFixed(3) * (1 - parseFloat(discount) / 100);
                    var befDisprice = parseFloat(qty).toFixed(3) * parseFloat(unitPrice).toFixed(3);
                    var price1 = parseFloat(unitPrice).toFixed(3);
                    $('#befdisc' + sno).val(parseFloat(befDisprice).toFixed(3));
                    $('#totalPrice' + sno).val(parseFloat(price).toFixed(3));
                    if (discount !== 0.000) {
                        var disPrice = (parseFloat(befDisprice).toFixed(3) - parseFloat(price).toFixed(3));
                        $('#discountPrice' + sno).val(parseFloat(disPrice).toFixed(3));
                    }
                    calTotal(sno);
                }
                if (discount == '')
                {
                    $('#discountPrice' + sno).val("0.000");
                    $('#totalDisAmt').val("0.000");
                    $('#totalPrice' + sno).val($('#befdisc' + sno).val());
                }


                if (parseFloat(discount) >= 100) {
                    alert("Discount(%) should be less than 100 !!!");
                    $('#discount' + sno).val("0.000");
                    $('#discount1' + sno).val("0.000");
                    $('#discountPrice' + sno).val("0.000");
                    $('#totalPrice' + sno).val($('#befdisc' + sno).val());
                    calTotal(sno);

                }

            }
            function caldiscount(sno) {
                var befdisc = $('#befdisc' + sno).val();
                var discountPrice = $('#discountPrice' + sno).val();
                if (discountPrice == '') {
                    discountPrice = 0.000;
                }
                if (isNaN(parseFloat(befdisc)) || isNaN(parseFloat(discountPrice)))
                {
                    return false;
                }
                if (parseFloat(discountPrice) >= parseFloat(befdisc)) {
                    alert("Discount amount should be less than total amount...!!");
                    $('#discountPrice' + sno).val('');
                    $('#discount' + sno).val('0.000');
                    $('#discount1' + sno).val('0.000');
                    calTotal(sno);
                    return false;
                }
                if (discountPrice !== 0.000) {
                    var dis = (parseFloat(discountPrice).toFixed(3) / parseFloat($('#befdisc' + sno).val()).toFixed(3)) * 100;
                    $('#discount' + sno).val(parseFloat(dis));
                    $('#discount1' + sno).val(parseFloat(dis).toFixed(3));
                }
                else {
                    $('#discount' + sno).val('0.000');
                    $('#discount1' + sno).val('0.000');
                    $('#totalDisAmt').val('0.000');
                }
                calTotal(sno);
            }


            function calTotal(sno)
            {
                var gt = 0.000;
                var totalbefdisc = 0.000;
                var totaldiscAmt = 0.000;
                var qty = $('#qty' + sno).val();
                var unitPrice = $('#unitPrice' + sno).val() || 0.000;
                var convFact = $('#requisitionUom' + sno).val();
                var discount = $('#discount' + sno).val();
                var conVal = convFact.split("-");
//                if (qty == "0")
//                {
//                    alert("Invalid Quantity...!!");
//                    $('#qty' + sno).val('');
//                    $('#totalPrice' + sno).val('');
//                    return false;
//
//                }
                if (discount == '') {
                    discount = 0.000;
                }
                if (isNaN(parseFloat(qty)) || isNaN(parseFloat(unitPrice)) || isNaN(parseFloat(discount)))
                {
                    return false;
                }
                if (qty != '' && unitPrice != '')
                {
                    var price = parseFloat(qty).toFixed(3) * parseFloat(unitPrice).toFixed(3) * (1 - parseFloat(discount) / 100);
                    var befDisprice = parseFloat(qty).toFixed(3) * parseFloat(unitPrice).toFixed(3);
                    var price1 = parseFloat(unitPrice).toFixed(3);
                    $('#befdisc' + sno).val(parseFloat(befDisprice).toFixed(3));
                    $('#totalPrice' + sno).val(parseFloat(price).toFixed(3));
//                    if (discount !== 0.000) {
//                        var disPrice = (parseFloat(befDisprice).toFixed(3) - parseFloat(price).toFixed(3));
//                        $('#discountPrice' + sno).val(parseFloat(disPrice).toFixed(3));
//                    }
                }

                // var lumsumdiscount = $('#lumsumdiscount').val();
                $('#resourcetable tr').each(function () {
                    var $itemRow = $(this).closest('tr');
                    var total = $itemRow.find("input[name='total']").val();
                    if (total != '' && !isNaN(total)) {
                        gt = parseFloat(total) + parseFloat(gt);
                    }
                    var tbd = $itemRow.find("input[name='befdisc']").val();
                    if (tbd != '' && !isNaN(tbd)) {
                        totalbefdisc = parseFloat(tbd) + parseFloat(totalbefdisc);
                    }
                    var tda = $itemRow.find("input[name='discountPrice']").val();
                    if (tda != '' && !isNaN(tda)) {
                        totaldiscAmt = parseFloat(tda) + parseFloat(totaldiscAmt);
                    }


                });
                $('#totalAmtBefDis').val(parseFloat(totalbefdisc).toFixed(3));
                $('#totalDisAmt').val(parseFloat(totaldiscAmt).toFixed(3));
                $('#totalAmt').val(parseFloat(gt).toFixed(3));
                gt = gt * (1);// - lumsumdiscount / 100)
                //var lumsumAmt = parseFloat($('#totalAmt').val()).toFixed(3) - parseFloat(gt).toFixed(3)
                //$('#lumsumamt').val(parseFloat(lumsumAmt).toFixed(3));
                $('#grandTotal').val(parseFloat(gt).toFixed(3));
            }

            function calGrandTotal() {
                var gt = 0;
                var totalbefdisc = 0;
                var totaldiscAmt = 0;
                //var lumsumdiscount = $('#lumsumdiscount').val();
                $('#resourcetable tr').each(function () {
                    var $itemRow = $(this).closest('tr');
                    var total = $itemRow.find("input[name='total']").val();
                    if (total != '' && !isNaN(total)) {
                        gt = parseFloat(total) + parseFloat(gt);
                    }
                    var tbd = $itemRow.find("input[name='befdisc']").val();
                    if (tbd != '' && !isNaN(tbd)) {
                        totalbefdisc = parseFloat(tbd) + parseFloat(totalbefdisc);
                    }
                    var tda = $itemRow.find("input[name='discountPrice']").val();
                    if (tda != '' && !isNaN(tda)) {
                        totaldiscAmt = parseFloat(tda) + parseFloat(totaldiscAmt);
                    }

                });
                $('#totalAmtBefDis').val(parseFloat(totalbefdisc).toFixed(3));
                $('#totalDisAmt').val(parseFloat(totaldiscAmt).toFixed(3));
                $('#totalAmt').val(parseFloat(gt).toFixed(3));
                gt = gt * (1);// - lumsumdiscount / 100)
                //var lumsumAmt = parseFloat($('#totalAmt').val()).toFixed(3) - parseFloat(gt).toFixed(3)
                //$('#lumsumamt').val(parseFloat(lumsumAmt).toFixed(3));
                $('#grandTotal').val(parseFloat(gt).toFixed(3));
            }

            function updateGrandTotal(sno)
            {
                var gt = 0.000;
                var totalbefdisc = 0.000;
                var totaldiscAmt = 0.000;
                var qty = $('#qty' + sno).val();
                var unitPrice = $('#unitPrice' + sno).val() || 0;
                var convFact = $('#requisitionUom' + sno).val();
                var discount = $('#discount' + sno).val();
                var conVal = convFact.split("-");
//                if (qty == "0")
//                {
//                    alert("Invalid Quantity...!!");
//                    $('#qty' + sno).val('');
//                    $('#totalPrice' + sno).val('');
//                    return false;
//
//                }
                if (discount == '') {
                    discount = 0.000;
                }
                if (isNaN(parseFloat(qty)) || isNaN(parseFloat(unitPrice)) || isNaN(parseFloat(discount)))
                {
                    return false;
                }
                if (qty != '' && unitPrice != '')
                {
                    var price = parseFloat(qty).toFixed(3) * parseFloat(unitPrice).toFixed(3) * (1 - parseFloat(discount) / 100);
                    var befDisprice = parseFloat(qty).toFixed(3) * parseFloat(unitPrice).toFixed(3);
                    var price1 = parseFloat(unitPrice).toFixed(3);
                    $('#befdisc' + sno).val(parseFloat(befDisprice).toFixed(3));
                    $('#totalPrice' + sno).val(parseFloat(price).toFixed(3));
                    if (parseFloat(discount) != 0.000) {
                        var disPrice = (parseFloat(befDisprice).toFixed(3) - parseFloat(price).toFixed(3));
                        $('#discountPrice' + sno).val(parseFloat(disPrice).toFixed(3));
                    }
                } else
                {
                    $('#befdisc' + sno).val("0.000");
                    $('#totalPrice' + sno).val("0.000");
                }

                //var lumsumdiscount = $('#lumsumdiscount').val();
                $('#resourcetable tr').each(function () {
                    var $itemRow = $(this).closest('tr');
                    var total = $itemRow.find("input[name='total']").val();
                    if (total != '' && !isNaN(total)) {
                        gt = parseFloat(total) + parseFloat(gt);
                    }
                    var tbd = $itemRow.find("input[name='befdisc']").val();
                    if (tbd != '' && !isNaN(tbd)) {
                        totalbefdisc = parseFloat(tbd) + parseFloat(totalbefdisc);
                    }
                    var tda = $itemRow.find("input[name='discountPrice']").val();
                    if (tda != '' && !isNaN(tda)) {
                        totaldiscAmt = parseFloat(tda) + parseFloat(totaldiscAmt);
                    }


                });
                $('#totalAmtBefDis').val(parseFloat(totalbefdisc).toFixed(3));
                $('#totalDisAmt').val(parseFloat(totaldiscAmt).toFixed(3));
                $('#totalAmt').val(parseFloat(gt).toFixed(3));
                gt = gt * (1);// - lumsumdiscount / 100)
                //var lumsumAmt = parseFloat($('#totalAmt').val()).toFixed(3) - parseFloat(gt).toFixed(3);
                //$('#lumsumamt').val(parseFloat(lumsumAmt).toFixed(3));
                $('#grandTotal').val(parseFloat(gt).toFixed(3));
            }


//            function calTotal(sno)
//            {
//                var gt = 0.000;
//                var totalbefdisc = 0.000;
//                var totaldiscAmt = 0.000;
//                var qty = $('#qty' + sno).val();
//                var unitPrice = $('#unitPrice' + sno).val();
//                var convFact = $('#requisitionUom' + sno).val();
//                var discount = $('#discount' + sno).val();
//                var conVal = convFact.split("-");
////                if (qty == "0")
////                {
////                    alert("Invalid Quantity...!!");
////                    $('#qty' + sno).val('');
////                    $('#totalPrice' + sno).val('');
////                    return false;
////
////                }  
//                if (discount == '') {
//                    discount = 0.000;
//                }
//                if (qty != '' && unitPrice != '') {
//
//                    var price = parseFloat(qty).toFixed(3) * parseFloat(unitPrice).toFixed(3) * (1 - parseFloat(discount).toFixed(2) / 100);
//                    var befDisprice = parseFloat(qty).toFixed(3) * parseFloat(unitPrice).toFixed(3);
//                    $('#befdisc' + sno).val(parseFloat(befDisprice).toFixed(3));
//                    $('#totalPrice' + sno).val(parseFloat(price).toFixed(3));
//                    if (discount !== 0.000) {
//                        var disPrice = (parseFloat(befDisprice).toFixed(3) - parseFloat(price).toFixed(3));
//                        $('#discountPrice' + sno).val(parseFloat(disPrice).toFixed(3));
//                    }
//                }
//
//                var lumsumdiscount = $('#lumsumdiscount').val();
//                $('#resourcetable tr').each(function () {
//                    var $itemRow = $(this).closest('tr');
//                    var total = $itemRow.find("input[name='total']").val();
//                    if (total != '' && !isNaN(total)) {
//                        gt = parseFloat(total) + parseFloat(gt);
//                    }
//                    var tbd = $itemRow.find("input[name='befdisc']").val();
//                    if (tbd != '' && !isNaN(tbd)) {
//                        totalbefdisc = parseFloat(tbd) + parseFloat(totalbefdisc);
//                    }
//                    var tda = $itemRow.find("input[name='discountPrice']").val();
//                    if (tda != '' && !isNaN(tda)) {
//                        totaldiscAmt = parseFloat(tda) + parseFloat(totaldiscAmt);
//                    }
//
//
//                });
//                $('#totalAmtBefDis').val(parseFloat(totalbefdisc).toFixed(3));
//                $('#totalDisAmt').val(parseFloat(totaldiscAmt).toFixed(3));
//                $('#totalAmt').val(parseFloat(gt).toFixed(3));
//                gt = gt * (1 - lumsumdiscount / 100)
//                $('#grandTotal').val(parseFloat(gt).toFixed(3));
//            }
//
//            function calGrandTotal() {
//                var gt = 0;
//                var totalbefdisc = 0;
//                var totaldiscAmt = 0;
//                var lumsumdiscount = $('#lumsumdiscount').val();
//                $('#resourcetable tr').each(function () {
//                    var $itemRow = $(this).closest('tr');
//                    var total = $itemRow.find("input[name='total']").val();
//                    if (total != '' && !isNaN(total)) {
//                        gt = parseFloat(total) + parseFloat(gt);
//                    }
//                    var tbd = $itemRow.find("input[name='befdisc']").val();
//                    if (tbd != '' && !isNaN(tbd)) {
//                        totalbefdisc = parseFloat(tbd) + parseFloat(totalbefdisc);
//                    }
//                    var tda = $itemRow.find("input[name='discountPrice']").val();
//                    if (tda != '' && !isNaN(tda)) {
//                        totaldiscAmt = parseFloat(tda) + parseFloat(totaldiscAmt);
//                    }
//
//                });
//                $('#totalAmtBefDis').val(parseFloat(totalbefdisc).toFixed(3));
//                $('#totalDisAmt').val(parseFloat(totaldiscAmt).toFixed(3));
//                $('#totalAmt').val(parseFloat(gt).toFixed(3));
//                gt = gt * (1 - lumsumdiscount / 100)
//                $('#grandTotal').val(parseFloat(gt).toFixed(3));
//            }

//            function calTotal(sno)
//            {
//                var qty = $('#reqQty' + sno).val();
//                var unitPrice = $('#unitPrice' + sno).val();
//                var convFact = $('#requisitionUom' + sno).val();
//                if (qty == "0")
//                {
//                    alert("Invalid Quantity...!!");
//                    $('#reqQty' + sno).val('');
//                    $('#totalPrice' + sno).val('');
//                    return false;
//                }
//                if (qty != '' && qty != null)
//                {
//                    var price = parseFloat(convFact) * parseFloat(qty) * parseFloat(unitPrice);
//                    $('#totalPrice' + sno).val(parseFloat(price).toFixed(3));
//                }
//            }

        </script>
        <script type="text/javascript">


            var myWindow = null;
            function openWindow() {

                myWindow = window.open("../purchase/deliveryLocPopUp.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function selectBillToLoc() {

                myWindow = window.open("../purchase/billToLocPopUp.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }

            function parent_disable() {
                if (myWindow && !myWindow.closed)
                    myWindow.focus();
            }

            function openWin() {
                //  var myWindow =window.open("../warehouse/selectwarehouse.htm","blank","toolbar=yes, scrollbars=yes, resizable=yes, top=500, left=500,width=700,height=500");
                var type = document.getElementById('prfor').value;
                if (type) {
                    myWindow = window.open("../Globalrequisition/selectprojectlocation.htm?pc=" + type + "", "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                    //popup('popUpDiv','../Globalrequisition/selectprojectlocation.htm?pc='+encodeURIComponent(y[0])+'')    
                } else {
                    alert("Please Select Required For");
                }
            }

            function myFunction(val) {
                var y = val.split('/');
                // document.getElementById("projectCode").value=y[0];
                //document.getElementById("prName").value = y[1];
                document.getElementById("prDesc").value = y[2];
                var div1 = document.getElementById('editable');
                var div2 = document.getElementById('noneditable');
                if (val != 'Central Store') {
                    $("#editable :input").attr("disabled", true);
                    $("#noneditable :input").attr("disabled", false);
                    div1.style.display = "none";
                    div2.style.display = "block";
                    return false;
                } else {
                    $("#editable :input").attr("disabled", false);
                    $("#noneditable :input").attr("disabled", true);
                    div2.style.display = "none";
                    div1.style.display = "block";
                    return false;
                }


            }
            jQuery(document).ready(function () {
                jQuery("#poForm").validationEngine();
            });
            function selectdate(val) {

                NewCssCal(val, 'ddMMMyyyy', '', '', '', '', 'future');
//                NewCssCal(val, 'ddMMMyyyy', 'dropdown', true, '12', '', 'future');
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

            function selectItem() {
                $('#itemDesc').val('');
                var y = (document.getElementById('itemCat').value) &&
                        //(document.getElementById('purchaseType').value) &&
                                (document.getElementById('division').value) &&
                                (document.getElementById('requiredAtLoc').value) &&
                                (document.getElementById('supId').value) &&
                                (document.getElementById('supName').value);
//                (document.getElementById('requiredByDate').value) &&
                        if (y == "" || y == null) {
                            alert('Please fill out the mandatory fields');
                            return  false;
                        }
                        var itemCat = document.getElementById('itemCat').value;
                        myWindow = window.open("../purchase/selectItems.htm?itemCat=" + itemCat, "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
//                var suppCode = $('#supId').val();
//                if (suppCode == null || suppCode == '') {
//                    alert("Please Select Vendor..!!");
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
                    function selectVendor() {
                        $('#itemName').val('');
                        $('#itemCode').val('');
                        $('#price').val('');
                        $('#itemDesc').val('');
                        $("#resourcetable").empty();
                        myWindow = window.open("../purchase/selectSuppnamePopup.htm?", "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                    }

//            function check_digit(e, obj, intsize, deczize) {
//                var keycode;
//
//                if (window.event)
//                    keycode = window.event.keyCode;
//                else if (e) {
//                    keycode = e.which;
//                }
//                else {
//                    return true;
//                }
//
//                var fieldval = (obj.value),
//                        dots = fieldval.split(".").length;
//
//                if (keycode == 46) {
//                    return dots <= 1;
//                }
//                if (keycode == 8 || keycode == 9 || keycode == 46 || keycode == 13 || keycode != 46 || keycode != 8) {
//                    // back space, tab, delete, enter 
//                    return true;
//                }
//                if ((keycode >= 32 && keycode <= 45) || keycode == 47 || (keycode >= 58 && keycode <= 127)) {
//                    return false;
//                }
//                if (fieldval == "0" && keycode == 48) {
//                    return false;
//                }
//                if (fieldval.indexOf(".") != -1) {
//                    if (keycode == 46) {
//                        return false;
//                    }
//                    if (event.keyCode != 8 && event.keyCode != 46)
//                    {
//                        event.preventDefault();
//                    }
//                    var splitfield = fieldval.split(".");
//                    if (splitfield[1].length >= deczize && keycode != 8 && keycode != 0)
//                        return false;
//                } else if (fieldval.length >= intsize && keycode != 46) {
//                    return false;
//                } else {
//                    return true;
//                }
//            }


                    function terms(payTerms, delTerms) {
                        $('#payTerms').append('<option selected value="' + payTerms + '">' + payTerms + '</option>');
                        $('#delTerms').append('<option selected value="' + delTerms + '">' + delTerms + '</option>');
                    }
                    function checkLumAmt() {
                        var lum = $('#lumsumdiscount1').val();
                        if (parseFloat(lum) >= 100) {

                            alert("Discount(%) should be less than 100 !!!");
                            $('#lumsumdiscount1').val("0.000");
                            $('#lumsumdiscount').val("0.000");
                            $('#lumsumamt').val("0.000");
                            $('#grandTotal').val($('#totalAmt').val());

                        }

                    }
                    function SelectAsset() {

                        myWindow = window.open("../purchase/selectAssetAndSubAsset.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=99,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                    }

        </script>
        <script src="../purchOrder/directPO.js">
            
        </script>
                    NProgress.done();
        </script>
    </body>

</html>
