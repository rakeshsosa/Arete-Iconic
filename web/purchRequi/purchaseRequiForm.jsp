
<%-- 
    Document   : purchReqForm
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
        <script src="../common/validate/Check_Digit.js" type="text/javascript"></script>
    </head>


    <body class="nav-sm">

        <div class="container body">


            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <div class="clearfix"></div>
                        <form id="requiForm" class="form-inline" method="post" action="../purchase/purchaseRequiFormSubmit.htm" enctype="multipart/form-data" onsubmit="return checkGrid();">
                            <div class="col-md-6 col-xs-12">
                                <div class="x_panel">                             
                                    <jsp:include page="../login/headerlink.htm?submodule=Purchase Requisition&tab=Purchase Requisition&pagetype=form"/>
                                    <div class="x_title">
                                        <h2>Requisition </h2>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <br />


                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color: red">*</span> Property Name</label>

                                            <c:choose>
                                                <c:when test="${fn:length(itemCreatList) > 0}">
                                                    <c:forEach items="${itemCreatList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control  input-xlarge validate[required]" name="assetCategory" id="assetCategory" data-rel="chosen"  value="${type.assetCategory}"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control  input-xlarge" readonly type="text" value="${type.assetCategory}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" placeholder="Select Property" class="form-control  input-xlarge validate[required]"  id="assetCategory"   readonly="" onclick="SelectAsset();"> 
                                                    <input type="hidden"  class="form-control" readonly=""   id="assetCode" name="assetCode" value="">                                                    
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color: red">*</span> Flat Name / Flat No.</label>

                                            <c:choose>
                                                <c:when test="${fn:length(itemCreatList) > 0}">
                                                    <c:forEach items="${itemCreatList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control  input-xlarge validate[required]" name="subAssetCategory" id="subAssetCategory" data-rel="chosen"  value="${type.subAssetCategory}"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control  input-xlarge" readonly type="text" value="${type.subAssetCategory}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" placeholder="" class="form-control  input-xlarge validate[required]"  id="subAssetCategory" readonly="">
                                                    <input type="hidden"  class="form-control" readonly=""   id="subAssetCode" name="subAssetCode"  value="">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                        <%--<div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color: red">*</span> Division</label>

                                            <c:choose>
                                                <c:when test="${fn:length(itemCreatList) > 0}">
                                                    <c:forEach items="${itemCreatList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control  input-xlarge validate[required]" name="division" id="division" data-rel="chosen"  value="${type.division}"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control  input-xlarge" readonly type="text" value="${type.division}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control  input-xlarge validate[required]" readonly="" type="text" value="${orgCode}" name="division" id="division"  placeholder="Select Project">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>--%>

                                        <%--<div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"> <span style="color: red">*</span>  Purchase Type</label>

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
                                                    <select  name="purchaseType"  id="purchaseType" data-rel="chosen" class="form-control validate[required]">
                                                        <!--<option value="">Select an option</option>--> 
                                                        <!--<option value="Assets">Assets</option>--> 
                                                        <option value="General">General</option>
                                                    </select>
                                                    <!--<input class="form-control  input-xlarge validate[required]" required=""  type="text" value="" name="purchaseType" id="purchaseType"  placeholder="Select Project">-->
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>--%>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label" for="selectError"> <span style="color: red">*</span>  Requisition No</label>

                                            <c:choose>
                                                <c:when test="${fn:length(itemCreatList) > 0}">
                                                    <c:forEach items="${itemCreatList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control  input-xlarge validate[required]" readonly name="ReqNo" id="ReqNo" type="text" value="${type.requisitionNo}" > 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control  input-xlarge validate[required]" readonly type="text" value="${type.requisitionNo}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control  input-xlarge validate[required]" readonly value="REQ-"  id="ReqNo" name="ReqNo" type="text">
                                                    <input class="form-control  input-xlarge" id="recordStatus" name="recordStatus" type="hidden" value="Need Review">
                                                    <input class="form-control  input-xlarge" id="" name="action" type="hidden" value="">

                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                        <p>&nbsp;</p>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color: red">*</span>  Requisition Date</label>

                                            <c:choose>
                                                <c:when test="${fn:length(itemCreatList) > 0}">
                                                    <c:forEach items="${itemCreatList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control  input-xlarge" name="reqDate" readonly type="text" value="${type.requisitionDate}" onclick="scwShow(this, event);" > 
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
                                                    <input class="form-control  input-xlarge"id="reqDate" name="reqDate" readonly="" type="text" value="<%= (new SimpleDateFormat("dd-MMM-yyyy")).format(new java.util.Date())%>">
                                                    <input class="form-control  input-xlarge"id="" name="ReqDateNo" readonly="" type="hidden" value="<%= (new SimpleDateFormat("dd-MMM-yyyy")).format(new java.util.Date())%>">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>

                                        <%--<div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label">&nbsp;&nbsp;Project Code</label>

                                            <c:choose>
                                                <c:when test="${fn:length(itemCreatList) > 0}">
                                                    <c:forEach items="${itemCreatList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control  input-xlarge" name="projectCode" id="projectCode" data-rel="chosen"  value="${type.projectCode}" maxlength="10"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control  input-xlarge" readonly type="text" value="${type.projectCode}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control  input-xlarge " autocomplete="off"  type="text" value="" id="projectCode"   maxlength="10">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label" >&nbsp;&nbsp; Project Name</label>

                                            <c:choose>
                                                <c:when test="${fn:length(itemCreatList) > 0}">
                                                    <input class="form-control  input-xlarge" id="prName" name="prName" type="text" value="${prName}" maxlength="20"> 
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control  input-xlarge" name="prName" id="prName" type="text" value="" maxlength="20">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>--%>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color: red">*</span>  Department</label>                          
                                            <c:choose>
                                                <c:when test="${fn:length(itemCreatList) > 0}">
                                                    <c:forEach items="${itemCreatList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <textarea type="text" id="itemDesc" required name="dept" class="form-control" style="resize: none" maxlength="50">${type.department}</textarea>

                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea type="text" readonly="" id="dept"  name="dept" class="form-control" style="resize: none" maxlength="50">${type.department}</textarea>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control  input-xlarge" readonly id="dept" name="dept" type="text" value="${userDept}">

                                                </c:otherwise>        
                                            </c:choose> 
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label" ><span style="color: red">*</span> Store Name</label>
                                            <c:choose>
                                                <c:when test="${fn:length(itemCreatList) > 0}">
                                                    <c:forEach items="${itemCreatList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <textarea   class="form-control" rows="1" style="resize: none;" name="requiredAtLoc" readonly=""  onclick="openWindow();" >${type.requiredAtLoc}</textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea  class="form-control" rows="1" style="resize: none;" readonly>${type.requiredAtLoc}</textarea>

                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <!--<div id="noneditable">-->
                                                    <!--<textarea class="form-control  input-xlarge validate[required]"  Placeholder="Click to select store name" style="resize: none;" readonly="" name="requiredAtLoc" id="requiredAtLoc" type="text" value="" onclick="openWindow();" ></textarea>-->
                                                    <!--</div>-->
                                                    <!--                                                    <div id="editable" style="display: none;">
                                                                                                            <textarea class="form-control"   rows="1" style="resize: none;" id="requiredAtLoc1" type="text" value=""></textarea>
                                                    
                                                                                                        </div>                                                           -->

                                                    <select class="form-control  input-xlarge validate[required]"  id="requiredAtLoc" name="requiredAtLoc" >                                                                       
                                                        <c:if test="${empty storeName}">
                                                            <option value="">Select an option</option>
                                                            <c:forEach items="${store}" var="list">
                                                                <option  value="${list.storeName}">${list.storeName}</option>

                                                            </c:forEach>
                                                        </c:if>  
                                                        <c:if test="${not empty storeName}">


                                                            <option selected="" value="${storeName}">${storeName}</option>

                                                        </c:if>
                                                        <%--<option value="BPL">BPL</option>
                                                        <option value="EVERY DAY">EVERY DAY</option>--%>
                                                    </select>
                                                </c:otherwise>         
                                            </c:choose>
                                        </div>
                                        <p>&nbsp;</p>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label" for="selectError"><span style="color: red">*</span> Priority</label>

                                            <c:choose>
                                                <c:when test="${fn:length(itemCreatList) > 0}">
                                                    <select class="form-control"  name="priority" data-rel="chosen">
                                                        <c:forEach items="${itemCreatList}" var="type">
                                                            <option>${type.priority}</option>
                                                        </c:forEach>
                                                        <option>HIGH</option>
                                                        <option>MEDIUM</option>
                                                        <option>LOW</option>
                                                    </select>
                                                </c:when>
                                                <c:otherwise>
                                                    <select name="priority" id="priority" data-rel="chosen" class="form-control  input-xlarge validate[required]">
                                                        <!--<option>${type.priority}</option>-->
                                                        <option>HIGH</option>
                                                        <option>MEDIUM</option>
                                                        <option>LOW</option>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color: red">*</span>  Item Category</label>
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
                                                    <select  id="itemCat" data-rel="chosen" class="form-control validate[required]">
                                                        <option value="">Select an option</option>    

                                                        <c:forEach items="${itemcategoryList}" var="type">
                                                            <option  value="${type.itemCategory}">${type.itemCategory}</option>
                                                        </c:forEach>
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
                                                                <input   class="form-control " required readonly="" style="text-transform: capitalize" autocomplete="off" id="itemName" name="itemName"  maxlength="40"  type="text" value="${type.itemName}"> 

                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" readonly type="text" value="${type.itemName}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input id="itemCode"  type="hidden" >
                                                    <input  class="form-control" style="cursor: pointer" readonly placeholder="Click to select items" style="text-transform: capitalize" autocomplete="off" id="itemName" maxlength="40"  type="text" value="" onclick="selectItem();">                                                    
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                        <p>&nbsp;</p>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline" style="display: none">
                                            <label class="control-label" style="margin-top:-17px;"> Item Description</label>                          
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
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline" >
                                            <label class="control-label"> Action/Remarks</label>
                                            <c:choose>
                                                <c:when test="${fn:length(itemCreatList) > 0}">
                                                    <c:forEach items="${itemCreatList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <textarea class="form-control " rows="2" style="resize: none;" name="actionRemarks" maxlength="120">${type.actionRemarks}</textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea  class="form-control " rows="2" style="resize: none;" readonly>${type.actionRemarks}</textarea>
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <textarea class="form-control "  rows="2" style="resize: none;" name="actionRemarks" id="actionRemarks" type="text" value="" maxlength="120"></textarea>

                                                </c:otherwise>         
                                            </c:choose>  
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline" style="margin-top:0px;border:none;">
                                            <label class="control-label" >  Attachment</label>
                                            <c:choose>
                                                <c:when test="${fn:length(itemCreatList) > 0}">
                                                    <c:forEach items="${itemCreatList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input style="" class=" input-file uniform_on" name="attachmentReference" type="file" value="${type.attachmentReference}">
                                                                <input style="border:none;" type="hidden" name="attachmentReference" value="${type.attachmentReference}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input style="border:none;" class=" input-xlarge" readonly type="text" value="${type.attachmentReference}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <div  class="" style=" border:none;">
                                                        <input style="border:none;margin-left:128px; margin-top:-22px;font-size: 13px;" class="input-file uniform_on" id="attachmentReference"  type="file" value="" name="attachmentReference"  onchange="Validate(this)">
                                                    </div>
                                                    <input style="" class=" input-xlarge"  id="requisitionQty" type="hidden" min="0" max="999" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>                                      




                                        <div class="clearfix"></div>

                                        <p>&nbsp;</p>
                                        <!--                            <div class="x_panel">
                                                                        <div class="x_content">-->
                                        <c:if test="${SNo eq null}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <!--<button type="button" class="btn btn-succ" style="" onclick="addOrderRow_test();"><i class="fa fa-plus-circle" style="font-size: 15px"></i> ADD</button>-->

                                                </div>
                                            </div>

                                            <div class="clearfix"></div>



                                            <div style="overflow: scroll;height: auto;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">

                                                <table id="example" class="table table-striped responsive-utilities">
                                                    <thead>
                                                        <tr>
                                                            <th style="background:#425567;color:#fff;width:4%;"><i class="fa fa-trash"></i></th>
                                                            <th style="background:#425567;color:#fff;width:11%;text-align:center;">Item Sub Category</th>
                                                            <th style="background:#425567;color:#fff;text-align:center;">Item Name</th>
                                                            <th style="background:#425567;color:#fff;text-align:center;">Item Desc</th>
                                                            <th style="background:#425567;color:#fff;width:6%;text-align:center;"><span style="color: red">*</span> Quantity</th>
                                                            <th style="background:#425567;color:#fff;width:5%;text-align:center;"><span style="color: red">*</span> Unit</th>
                                                            <!--<th style="background:#425567;color:#fff;width:10%;text-align:center;">Unit Price</th>-->
                                                            <!--<th style="background:#425567;color:#fff;width:14%;text-align:center;">Total Price</th>-->

                                                            <!--                                                                                                                        <th style="background:#425567;color:#fff;">Delivered At</th>
                                                                                                                                                                                    <th style="background:#425567;color:#fff;">Priority</th>                                                            
                                                                                                                                                                                    <th style="background:#425567;color:#fff;">Remarks</th>-->
                                                            <th style="background:#425567;color:#fff;width:11%;text-align:center;">Available Stock</th>
                                                            <th style="background:#425567;color:#fff;width:12%;"><span style="color: red">*</span> Required Date</th>
                                                        </tr>

                                                    </thead>
                                                    <tbody id="resourcetable">

                                                    </tbody>
                                                    <script>
                                                        var count = 0;
                                                        function addOrderRow_test(val2, val3, val4, val5) {
                                                            //                                                            var requiredAtLoc = document.getElementById('requiredAtLoc').value;
                                                            //                                                            var requiredAtLoc1 = 'requiredAtLoc';
                                                            //                                                            if (requiredAtLoc == "") {
                                                            //                                                                requiredAtLoc = document.getElementById('requiredAtLoc1').value;
                                                            //                                                                var requiredAtLoc1 = 'requiredAtLoc1';
                                                            //                                                            }
                                                            var valid1 = true;
//                                                            var y = (document.getElementById('requiredByDate').value) &&
//                                                                    (document.getElementById('itemCat').value) &&
//                                                                    (document.getElementById('purchaseType').value) &&
//                                                                    (document.getElementById('division').value) &&
//                                                                    (document.getElementById('priority').value) &&
//                                                                    (document.getElementById('requiredAtLoc').value);
//                                                            if (y == "" || y == null) {
//                                                                alert('Please fill out the mandatory fields');
//                                                                valid1 = false;
//                                                            }

                                                            if (valid1 == true) {
                                                                //                                                                var reqfor = document.getElementById('reqfor').value;
                                                                //var projectCode = document.getElementById('projectCode').value;
//                                                                var itemCode = document.getElementById('itemCode').value;
//                                                                var itemName = document.getElementById('itemName').value;
//                                                                var itemDesc = document.getElementById('itemDesc').value;
                                                                var requisitionQty = document.getElementById('requisitionQty').value;
//                                                                var requiredByDate = document.getElementById('requiredByDate').value;
                                                                var priority = document.getElementById('priority').value;
//                                                                var actionRemarks = document.getElementById('actionRemarks').value;
                                                                var itemCat = document.getElementById('itemCat').value;
//                                                                var itemsubCat = document.getElementById('itemsubCat').value;
                                                                //                                                                var mtid = document.getElementById('mtid').value;
                                                                var requiredAtLoc2 = document.getElementById('requiredAtLoc').value;
//                                                                var itemCode1 = itemCode.split("$");
//                                                                var itemName1 = itemName.split("$");
//                                                                var itemDesc1 = itemDesc.split("$");
//                                                                var itemsubCat1 = itemsubCat.split("$");
                                                                //                                                                var itemCat1 = itemCat.split("/");
                                                                //                                                                var itemsubCat1 = itemsubCat.split("/");
                                                                //                                                                var mtid1 = mtid.split("/");
                                                                //                                                                var vehicle = document.getElementById('vehicle').value;

                                                                var table = document.getElementById("resourcetable");

//                                                                for (var i = 0; i < val2.length; i++) {
//                                                                $('#resourcetable tr').each(function () {
//                                                                    $(this).find('td').each(function () {
//                                                                        var a = $(this).find('#itemCode12').val();
//                                                                        var itmName = $(this).find('#itemName1').val();
//                                                                        var itemCode = $(this).find('#itemCode12').val();
//
//                                                                        if (itemCode == val2) {
//                                                                            alert('Record already added to grid');
//                                                                            document.getElementById('td').value = "";
//                                                                            return false;
//                                                                        } else {
//                                                                            return true;
//                                                                        }
//                                                                    })
//                                                                })
                                                                if (val2 != "")
                                                                {

                                                                    var c = val2;
                                                                    //                                                                      / / alert(c);
//                                                                        var slNo = table.rows.length - 1;
                                                                    var slNo1 = table.rows.length;
                                                                    var id1 = slNo1;
                                                                    var slNo = count;
                                                                    var tr = table.insertRow(slNo1);


                                                                    tr.id = 'list_tr_' + slNo;
                                                                    tr.innerHTML = '<td align="center" class="tinput"><button type="button" class="fa fa-trash-o" onclick="removeRow('
                                                                            + slNo + ')" ></button> </td>' +
                                                                            '<td><input class="form-control" style="text-align:left;width:100%" type="text" readonly name="itemsubCat" value="' + val5 +
                                                                            '"/></td><td><input class="form-control" style="width:100%" type="text" readonly id="itemName1" name="itemName" value="' + val3.replace(/"/g, '&quot;') + '"/></td>\n\
                                                                                     <td><input class="form-control" style="width:100%" readonly type="text" name="itemDesc" value="' + val4.replace(/"/g, '&quot;') + '" ></td>\n\
                                                                                <td><input  style="width:100%;" class="right input-mini form-control validate[required] validate[custom[notzero],custom[float5]]" autocomplete="off" maxlength="14"   type="text" onpaste="return false"  name="requisitionQty" id="reqQty' + slNo + '" onkeydown="calTotal(' + slNo + ');" onkeyup="calTotal(' + slNo + ');" onkeypress="return check_digit(event, this, 10, 3);"  value="' + requisitionQty +
                                                                            '" ></td><td><select  name="requisitionUom" style="width:100%;font-size: 15px;padding: 4px 0px;" id="requisitionUom' + slNo + '" onchange="calTotal(' + slNo + ');" required class="validate[required]">' +
                                                                            '' +
                                                                            '</select></td>' +
                                                                            '<td  style="display:none;" ><input class="form-control" style="text-align:left;" type="hidden" required autocomplete="off"  onkeypress="return isNumberKey(event)" readonly onkeydown="calTotal(' + slNo + ')" name="unitPrice" id="unitPrice' + slNo + '"></td>\n\
                                                                                <td  style="display:none;" ><input class="form-control" style="text-align:left;" type="hidden" readonly name="totalPrice" id="totalPrice' + slNo + '" ></td>\n\
                                                                                <td style="display:none;" class="tinput"><input readonly type="hidden" value="' + requiredAtLoc2 +
                                                                            '"></td><td class="tinput" style="display:none;"><select required name="priority" id="priority' + slNo + '">' +
                                                                            '<option>' + priority + '</option>' +
                                                                            '<option>HIGH</option>' +
                                                                            '<option>MEDIUM</option>' +
                                                                            '<option>LOW</option>' +
                                                                            '</select></td>' +
                                                                            '<td class="right" id="availStock' + slNo + '"></td>' +
                                                                            '<td><input style="text-align:left;width:100%" autocomplete="off" class="form-control validate[required]" placeholder="DD/MM/YYYY" type="text" name="requiredByDate" id=' + slNo + ' onchange="validateDate(this.value,' + val2 + ',' + slNo + ')"  value=""><input style="text-align:center;" type="hidden" name="reqDateSno" id="reqDateSno" value="' + slNo + '"/></td>' +
                                                                            '<td  style="display:none;" class="tinput"><input type="hidden" name="itemCat" value="' + itemCat +
                                                                            '"/><input tstyle="text-align:left;" type="hidden" name="itemCode" id="itemCode12" value="' + val2 + '"/></td>';


                                                                    uomdisplay(c, slNo);
                                                                    unitPrice(c, slNo);
                                                                    totalStock(c, requiredAtLoc2, slNo);

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

                                                                    //gridEditArrowKey();
                                                                }
                                                                count++;
//                                                                }
//                                                                $('#itemName').val('');
//                                                                $('#itemDesc').val('');
                                                            } else {
                                                                return;
                                                            }
                                                        }

                                                        function removeRow(id) {
                                                            var table = document.getElementById("resourcetable");
                                                            for (var i = 0; i < table.rows.length; i++) {
                                                                var lr = table.rows[i];
                                                                if (lr.id == 'list_tr_' + id) {
                                                                    table.deleteRow(i);
                                                                    return;
                                                                }
                                                            }
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

                                                        function uomdisplay(c, slNo)
                                                        {
                                                            $.ajax({
                                                                type: "POST",
                                                                url: "../purchase/uomlist.htm",
                                                                data: {code: c},
                                                                success: function (data) {
                                                                    // alert(data);
                                                                    //                        
                                                                    $('#requisitionUom' + slNo).html("");

                                                                    var nameArray = data.split(",");
                                                                    var toAppend = '';
                                                                    for (var i = 0; i < nameArray.length-1; i++) {
                                                                        toAppend += '<option value=' + '1' + '-' + nameArray[i] + '>' + nameArray[i] + '</option>';
                                                                    }
                                                                    // toAppend += '<option value="">Select an Option</option>';                                                                   
//                                                                    for (var i = 0; i < nameArray.length; i++) {
//                                                                    if (nameArray[0] == nameArray[1]) {
//                                                                        if (nameArray[0] != "") {
//                                                                            toAppend += '<option selected value=' + '1' + '-' + nameArray[0] + '>' + nameArray[0] + '</option>';
//                                                                        }
//                                                                        if (nameArray[2] != "" && nameArray[2] !== 'null' && nameArray[5] !== 'null' && parseFloat(nameArray[5]) !== 0) {
//                                                                            toAppend += '<option value=' + '1' + '-' + nameArray[2] + '>' + nameArray[2] + '</option>';
//                                                                        }
//                                                                        if (nameArray[3] != "" && nameArray[3] !== 'null' && nameArray[6] !== 'null' && parseFloat(nameArray[6]) !== 0) {
//                                                                            toAppend += '<option value=' + '1' + '-' + nameArray[3] + '>' + nameArray[3] + '</option>';
//                                                                        }
//                                                                    } else {
//                                                                        if (nameArray[0] != "") {
//                                                                            toAppend += '<option selected value=' + '1' + '-' + nameArray[0] + '>' + nameArray[0] + '</option>';
//                                                                        }
//
//                                                                        if (nameArray[1] != "" && nameArray[1] !== 'null' && nameArray[4] !== 'null' && parseFloat(nameArray[4]) !== 0) {
//                                                                            toAppend += '<option value=' + '1' + '-' + nameArray[1] + '>' + nameArray[1] + '</option>';
//
//                                                                        }
//                                                                        if (nameArray[2] != "" && nameArray[2] !== 'null' && nameArray[5] !== 'null' && parseFloat(nameArray[5]) !== 0) {
//                                                                            toAppend += '<option value=' + '1' + '-' + nameArray[2] + '>' + nameArray[2] + '</option>';
//                                                                        }
//                                                                        if (nameArray[3] != "" && nameArray[3] !== 'null' && nameArray[6] !== 'null' && parseFloat(nameArray[6]) !== 0) {
//                                                                            toAppend += '<option value=' + '1' + '-' + nameArray[3] + '>' + nameArray[3] + '</option>';
//                                                                        }
//                                                                    }
//                                                                    if (nameArray[1] != "" && nameArray[1] !== 'null' && nameArray[4] !== 'null' && parseFloat(nameArray[4]) !== 0) {
//                                                                        toAppend += '<option value=' + nameArray[4] + '-' + nameArray[1] + '>' + nameArray[1] + '</option>';
//
//                                                                    }
//                                                                    if (nameArray[2] != "" && nameArray[2] !== 'null' && nameArray[5] !== 'null' && parseFloat(nameArray[5]) !== 0) {
//                                                                        toAppend += '<option value=' + nameArray[5] + '-' + nameArray[2] + '>' + nameArray[2] + '</option>';
//                                                                    }
//                                                                    if (nameArray[3] != "" && nameArray[3] !== 'null' && nameArray[6] !== 'null' && parseFloat(nameArray[6]) !== 0) {
//                                                                        toAppend += '<option value=' + nameArray[6] + '-' + nameArray[3] + '>' + nameArray[3] + '</option>';
//                                                                    }

//                                                                    }
                                                                    $('#requisitionUom' + slNo).append(toAppend);
                                                                },
                                                                error: function (error) {
//                                                                    alert(error);
                                                                }

                                                            });
                                                        }

                                                        function totalStock(itemCode, storeName, slNo) {

                                                            $.ajax
                                                                    ({
                                                                        type: "POST",
                                                                        url: '../purchase/chkInvenStock.htm',
                                                                        data: {
                                                                            itemCode: itemCode,
                                                                            storeName: storeName
                                                                        },
                                                                        success: function (data) {
                                                                            $('#availStock' + slNo).html(data);
                                                                        }
                                                                    });

                                                        }

                                                        function unitPrice(c, slNo)
                                                        {
                                                            $.ajax({
                                                                type: "POST",
                                                                url: "../purchase/unitPrice.htm",
                                                                data: {code: c},
                                                                success: function (data) {
                                                                    //                                                                    alert(data);   
                                                                    if (isNaN(parseFloat(data))) {
                                                                        $('#unitPrice' + slNo).val(parseFloat(0));
                                                                    } else {
                                                                        $('#unitPrice' + slNo).val(parseFloat(data));
                                                                    }


                                                                },
                                                                error: function (error) {
//                                                                    alert(error);
                                                                }

                                                            });
                                                        }

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

                                                        function validateDate(reqdate, itemcd, slno) {
                                                            getDate(slno);
                                                            $('#resourcetable tr').each(function () {
                                                                var $itemRow = $(this).closest('tr');

                                                                var itemCode = $(this).find('#itemCode12').val();
                                                                var reqDateSno = $(this).find('#reqDateSno').val();
                                                                if (slno != reqDateSno)
                                                                {
                                                                    if (itemCode == itemcd) {
                                                                        var requiredByDate = $itemRow.find("input[name='requiredByDate']").val();
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

                                                </table>                        



                                            </c:if>


                                        </div>

                                            <p>&nbsp;</p>
                                        <c:if test="${action ne 'view'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 col-md-offset-5 form-group">
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    
                                                    <button type="submit" class="btn btn-primary" style="">Save</button>
                                                    <a href="../purchase/purchaseRequiList.htm"><button type="button" class="btn btn-danger" style="">Cancel</button></a> 

                                                </div>
                                            </div>
                                        </c:if>
                                        <!--                                </div>
                                        
                                                                    </div>-->
                                        <br/>




                                    </div> 
                                </div>
                            </div>
                        </form>


                    </div>


                </div>

            </div>
        </div>

        <!--        <div id="custom_notifications" class="custom-notifications dsp_none">
                    <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
                    </ul>
                    <div class="clearfix"></div>
                    <div id="notif-group" class="tabbed_notifications"></div>
                </div>-->
        <script>

            $(document).ready(function () {
                $('#priceStartValidDate').datepicker({
                    autoclose: true,
                    format: 'dd-M-yyyy',
                    orientation: "bottom left"
                });
                jQuery("#requiForm").validationEngine();
            });
            function  getItemSubCat() {
                $('#itemName').val('');
                $('#itemDesc').val('');

                var itemCat = document.getElementById("itemCat").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../purchase/getItemSubCat.htm',
                            data: {
                                itemCat: itemCat
                            },
                            success: function (data) {
                                displayitmSubCat(data);
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
                        if (nameArray[i] != '') {
                            toAppend += '<option>' + nameArray[i] + '</option>';
                        }

                    }
                    $('#itemsubCat').append(toAppend);

                }
                else {
//                    alert("error");
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

            function calTotal(sno)
            {
                var qty = $('#reqQty' + sno).val();
                var unitPrice = $('#unitPrice' + sno).val();
                var convFact = $('#requisitionUom' + sno).val();
                var conVal = convFact.split("-");
//                if (qty == "0")
//                {
//                    alert("Invalid quantity...!!");
//                    $('#reqQty' + sno).val('');
//                    $('#totalPrice' + sno).val('');
//                    return false;
//                }
                if (qty != '' && qty != null)
                {
                    var price = parseFloat(qty).toFixed(3) * parseFloat(unitPrice).toFixed(3);
                    $('#totalPrice' + sno).val(parseFloat(price).toFixed(3));
                }
            }

        </script>
        <script type="text/javascript">
            function Validate($this)
            {
                var fl = document.getElementById("attachmentReference").value;
                var fileSize = $this.files[0];
                var sizeInMb = fileSize.size / 1024;
                var sizeLimit = 1024 * 2;
                if (sizeInMb > sizeLimit) {
                    alert("File size exceeded(Only 2MB allowed)");
                    $($this).val('');
                    return;
                }
                var fmt = /^.*\.(jpg|JPG|gif|GIF|png|PNG|jpeg|JPEG|xls|XLS|xlsx|XLSX|doc|DOC|docx|DOCX|pdf|PDF)$/;
                if (!fl.match(fmt))
                {
                    alert('Invalid file');
                    $($this).val('');
                    return false;
                }

                else {
                    return true;
                }

            }
            function clearItem()
            {
                $('#itemName').val('');
                $('#itemDesc').val('');
            }

            var myWindow = null;
            function openWindow() {

                myWindow = window.open("../purchase/deliveryLocPopUp.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function parent_disable() {
                if (myWindow && !myWindow.closed)
                    myWindow.focus();
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
//              Old method we cant edit the before decimal number..
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
//                if (keycode == 8 || keycode == 9 || keycode == 46 || keycode == 13) {
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
//                    var splitfield = fieldval.split(".");
//                    if (splitfield[1].length >= deczize && keycode != 8 && keycode != 0)
//                        return false;
//                } else if (fieldval.length >= intsize && keycode != 46) {
//                    return false;
//                } else {
//                    return true;
//                }
//            }

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
                $('#itemName').val('');
                var y = (document.getElementById('itemCat').value) &&
                        //(document.getElementById('purchaseType').value) &&
                                //(document.getElementById('division').value) &&
                                        (document.getElementById('priority').value) &&
                                        (document.getElementById('requiredAtLoc').value);
//                (document.getElementById('requiredByDate').value) &&
                                if (y == "" || y == null) {
                                    alert('Please fill out the mandatory fields');
                                    return  false;
                                }
                                var itemCat = document.getElementById('itemCat').value;
                                //alert(itemCat);

                                myWindow = window.open("../purchase/selectItems.htm?itemCat=" + itemCat, "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                                //myWindow = window.open("../purchase/selectItemMaster1.htm?supp=" + itemCat + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=99,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                            }
                            function SelectAsset() {

                                myWindow = window.open("../purchase/selectAssetAndSubAsset.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=99,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                            }


        </script>
        <script>
                            NProgress.done();
        </script>
    </body>

</html>


