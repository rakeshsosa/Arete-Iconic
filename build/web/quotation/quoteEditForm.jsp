<%-- 
    Document   : quoteEditForm
    Created on : 22 Oct, 2016, 8:01:33 AM
    Author     : Shweta S Sakri
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
    </head>


    <body class="nav-md">

        <div class="container body">


            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <div class="clearfix"></div>
                        <form id="reqForm" class="form-inline" method="post" action="../purchase/quotationFormSubmit.htm" enctype="multipart/form-data" onsubmit="return checkGrid();">

                            <c:forEach items="${quoteLable}" var="list">                                       
                                <c:if test="${list[0] eq '582'}">
                                    <c:set value="${list[1]}" var="field_582"/>
                                    <c:set value="${list[2]}" var="fieldStatus_582"/>
                                    <c:set value="${list[3]}" var="mand_status_582"/>
                                    <c:set value="${list[4]}" var="max_length_582"/>
                                </c:if>
                                <c:if test="${list[0] eq '583'}">
                                    <c:set value="${list[1]}" var="field_583"/>
                                    <c:set value="${list[2]}" var="fieldStatus_583"/>
                                    <c:set value="${list[3]}" var="mand_status_583"/>
                                    <c:set value="${list[4]}" var="max_length_583"/>
                                </c:if>  
                                <c:if test="${list[0] eq '584'}">
                                    <c:set value="${list[1]}" var="field_584"/>
                                    <c:set value="${list[2]}" var="fieldStatus_584"/>
                                    <c:set value="${list[3]}" var="mand_status_584"/>
                                    <c:set value="${list[4]}" var="max_length_584"/>
                                </c:if> 
                            </c:forEach> 
                            <c:forEach items="${quote}" var="list">
                                <c:forEach items="${itemMaster}" var="list1">
                                    <c:if test="${list1.itemCode eq list.itemCode}">
                                        <c:set var="itemName" value="${list1.itemName}"></c:set>  
                                        <c:set var="itemDesc" value="${list1.itemDesc}"></c:set> 
                                    </c:if>
                                </c:forEach>
                                <c:forEach items="${itemCat}" var="list2">
                                    <c:if test="${list2.categoryId eq list.itemCategory}">
                                        <c:set var="itemCategory" value="${list2.itemCategory}"></c:set>  
                                        <c:set var="categoryId" value="${list2.categoryId}"></c:set>  
                                    </c:if>
                                </c:forEach>
                                <c:forEach items="${uom}" var="list3">
                                    <c:if test="${list3.uomId eq list.itemUOM}">
                                        <c:set var="uomName" value="${list3.uomName}"></c:set>  
                                        <c:set var="uomId" value="${list3.uomId}"></c:set> 
                                    </c:if>
                                </c:forEach>                              
                                <c:set var="itemCode" value="${list.itemCode}"/>                                
                                <c:set var="quotationNo" value="${list.quotationNo}"/>
                                <c:set var="status" value="${list.status}"/>
                                <c:set var="quotationDate" value="${list.quotationDate}"/>                              
                            </c:forEach>

                            <c:forEach items="${quote}" var="list">
                                <input type="hidden" value="${list.sno}" id="pk" name="pk">  
                            </c:forEach>

                            <div class="col-md-6 col-xs-12">
                                <div class="x_panel">                             
                                    <jsp:include page="../login/headerlink.htm?submodule=Final Quotation&tab=Final Quotation&pagetype=form"/>
                                    <div class="x_title">
                                        <h2>
                                            Quotation Form
                                        </h2>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">


                                        <c:if test="${fieldStatus_584 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_558 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if>                                          
                                                <label class="control-label ">${field_584}</label>                                              
                                                <input type="text"  class="form-control" ${mand_status_584} id="itemName" readonly=""  style="cursor: pointer;resize: none;"  value="${itemName}"  style="cursor: pointer;resize: none;" >
                                                <input  type="hidden" value="${itemCode}" id="itemCode" >
                                                <input  type="hidden" value="${itemDesc}" id="itemDesc">
                                                <input type="hidden" value="${itemCategory}" id="itemCategory">
                                                <input type="hidden" value="${uomName}" id="itemUom">                                        
                                                <input type="hidden" value="${categoryId}" id="categoryId">
                                                <input type="hidden" value="${uomId}" id="uomId"> 

                                            </div>

                                        </c:if>
                                        <c:if test="${fieldStatus_582 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_582 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if> 
                                                <label class="control-label" for="selectError">${field_582}</label>
                                                <input type="hidden" class="form-control"  readonly="" id="quotationNo" name="quotationNo" value="${quotationNo}">
                                                <input name="status" type="hidden" value="${status}">
                                                <input class="form-control  input-xlarge" ${mand_status_582}  id="quotationDate" readonly="" type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${quotationDate}"/>" >                                             
                                            </div>
                                        </c:if>
                                        <c:if test="${action ne 'view'}">
                                            <c:if test="${fieldStatus_583 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_558 eq 'required'}">
                                                        <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                    </c:if>                                          
                                                    <label class="control-label ">${field_583}</label>                                            
                                                    <input type="text"  class="form-control" ${mand_status_583} id="vendorName" Placeholder="Select Vendor" readonly=""  style="cursor: pointer;resize: none;" name="vendorName" value="" onclick="selectVendor();" >                                                         
                                                </div>

                                            </c:if>
                                        </c:if>
                                        <div class="clearfix"></div>
                                        <p>&nbsp;</p>                       
                                        <div class="clearfix"></div>

                                        <div style="overflow: scroll;height: auto;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">

                                            <table id="example" class="table table-striped responsive-utilities jambo_table">
                                                <thead>
                                                    <tr>
                                                        <th style=" ">Action</th>
                                                        <th style=" "><span style="color: red">*</span>Vendor Code</th>
                                                        <th style=" "><span style="color: red">*</span>Vendor Name</th>
                                                        <th style=" "><span style="color: red">*</span>Accessory Name</th>
                                                        <th style=" "><span style="color: red">*</span>Accessory Category</th>                                                                                                                       
                                                        <th style=" "><span style="color: red">*</span>Uom</th>
                                                        <th style=" "><span style="color: red">*</span>Quantity</th>
                                                        <th style=" "><span style="color: red">*</span>Price</th>
                                                        <!--                                                        <th style="color:#fff;"><span style="color: red">*</span>Discount(%)</th>                                                                                                                        -->
                                                        <th style=" "><span style="color: red">*</span>Total</th>
                                                        <th style=" "><span style="color: red">*</span>Priority</th>
                                                    </tr>
                                                </thead>
                                                <c:if test="${action eq 'view'}">
                                                    <tbody id="resourcetable">
                                                        <c:forEach items="${quote}" var="type">
                                                            <tr class="item-row"> 
                                                                <td align="center" onclick=""><button type="button" id="deleteRowcert12"><i class="fa fa-trash fa-lg-o"></i></button></td>    
                                                                <td>
                                                                    <c:forEach items="${supp}" var="list">
                                                                        <c:if test="${list.supplierCode eq type.vendorCode}">
                                                                            <c:set value="${list.supplierName}" var="supplierName"/> 
                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <input type="hidden" id="sno"  name="sno" value="${type.sno}"/>                                                            
                                                                    <input type="hidden" id="quotationDate"  name="quotationDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.quotationDate}"/>"/>
                                                                    <input class="form-control" style="text-align: left;" name="supplierCode" id="supplierCode" readonly="" autocomplete="off" type="text" maxlength="30" value="${type.vendorCode}"></td>
                                                                <td><input class="form-control" style="text-align: left;" name="supplierName" id="supplierName" readonly autocomplete="off" type="text" maxlength="30" value="${supplierName}"></td>
                                                                <td><c:forEach items="${itemMaster}" var="list2">
                                                                        <c:if test="${list2.itemCode eq type.itemCode}">
                                                                            <c:set value="${list2.itemName}" var="itemName"/> 
                                                                            <c:set value="${list2.itemCode}" var="itemCode"/> 
                                                                        </c:if>
                                                                    </c:forEach><input type="hidden" id="itemCode"  name="itemCode" value="${itemCode}"/> <input class="form-control" style="text-align: left;" name="itemName" id="itemName" readonly autocomplete="off" type="text" maxlength="30" value="${itemName}"></td>
                                                                <td><c:forEach items="${itemCat}" var="list1">
                                                                        <c:if test="${list1.categoryId eq type.itemCategory}">
                                                                            <c:set value="${list1.itemCategory}" var="itmcat"/> 
                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <input class="form-control" style="text-align: left;" name="itemCategory" id="itemCategory" readonly autocomplete="off" type="text" maxlength="30" value="${itmcat}"></td>
                                                                <td>
                                                                    <c:forEach items="${uom}" var="list2">
                                                                        <c:if test="${list2.uomId eq type.itemUOM}">
                                                                            <c:set value="${list2.uomName}" var="uomName"/> 
                                                                        </c:if>
                                                                    </c:forEach><input class="form-control" style="text-align: left;"  name="itemUom" id="itemUom" readonly autocomplete="off" type="text" min="8" maxlength="11" value="${uomName}"></td>
                                                                <td><input class="form-control" style="text-align: right;"  name="qty" id="qty" readonly autocomplete="off" type="text" min="8" maxlength="11" value="<fmt:formatNumber type="number" maxFractionDigits="5" groupingUsed="false" value="${type.qty}" />"></td>
                                                                <td><input class="form-control" style="text-align: right;" name="discount" id="discount" readonly autocomplete="off" type="hidden" maxlength="30" value="0"><input class="form-control" style="text-align: right;" name="price" id="price" readonly autocomplete="off" type="text" maxlength="30" value="<fmt:formatNumber type="number" maxFractionDigits="5" groupingUsed="false" value="${type.price}" />"></td>                                                            
                                                                <td><input class="form-control" style="text-align: right;" name="total" id="total" readonly autocomplete="off" type="text" maxlength="30" value="<fmt:formatNumber type="number" maxFractionDigits="5" groupingUsed="false" value="${type.total}" />"></td>
                                                                <td><input class="form-control" style="text-align: left;" name="priority" id="priority" readonly autocomplete="off" type="text" maxlength="30" value="${type.priority}">
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </c:if>
                                                <c:if test="${action eq 'edit'}">
                                                    <tbody id="resourcetable">
                                                        <c:set var="sno1" value="1"></c:set>
                                                        <c:forEach items="${quote}" var="type">
                                                            <tr class="item-row"> 
                                                                <td align="center" onclick=""><button type="button" id="deleteRowcert"><i class="fa fa-trash fa-lg-o"></i></button></td>    
                                                                <td> <c:forEach items="${supp}" var="list">
                                                                        <c:if test="${list.supplierCode eq type.vendorCode}">
                                                                            <c:set value="${list.supplierName}" var="supplierName"/> 
                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <input type="hidden" id="sno"  name="sno" value="${type.sno}"/>                                                          
                                                                    <input type="hidden" id="quotationDate"  name="quotationDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.quotationDate}"/>"/>
                                                                    <input class="form-control" style="text-align: left;" name="supplierCode" id="supplierCode" readonly="" autocomplete="off" type="text" maxlength="30" value="${type.vendorCode}"></td>
                                                                <td><input class="form-control" style="text-align: left;" name="supplierName" id="supplierName" readonly autocomplete="off" type="text" maxlength="30" value="${supplierName}"></td>
                                                                <td><c:forEach items="${itemMaster}" var="list2">
                                                                        <c:if test="${list2.itemCode eq type.itemCode}">
                                                                            <c:set value="${list2.itemName}" var="itemName"/> 
                                                                            <c:set value="${list2.itemCode}" var="itemCode"/> 
                                                                        </c:if>
                                                                    </c:forEach><input type="hidden" id="itemCode"  name="itemCode" value="${itemCode}"/> <input class="form-control" style="text-align: left;" name="itemName" id="itemName" readonly autocomplete="off" type="text" maxlength="30" value="${itemName}"></td>
                                                                <td><c:forEach items="${itemCat}" var="list1">
                                                                        <c:if test="${list1.categoryId eq type.itemCategory}">
                                                                            <c:set value="${list1.itemCategory}" var="itmcat"/> 
                                                                            <c:set value="${list1.categoryId}" var="categoryId"/> 
                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <input class="form-control" style="text-align: left;" name="itemCategory" id="itemCategory" readonly autocomplete="off" type="text" maxlength="30" value="${itmcat}">
                                                                    <input type="hidden" id="categoryId"  name="categoryId" value="${categoryId}"/></td>
                                                                <td><c:forEach items="${uom}" var="list2">
                                                                        <c:if test="${list2.uomId eq type.itemUOM}">
                                                                            <c:set value="${list2.uomName}" var="uomName"/> 
                                                                            <c:set value="${list2.uomId}" var="uomId"/> 
                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <input type="hidden" id="uomId"  name="uomId" value="${uomId}"/>
                                                                    <input class="form-control" style="text-align: left;"  name="itemUom" id="itemUom" readonly autocomplete="off" type="text"  maxlength="11" value="${uomName}"></td>
                                                                <td><input class="numeric form-control" style="text-align: right;"  name="qty" id="qty${sno1}"  autocomplete="off" type="text"   value="<fmt:formatNumber type="number" maxFractionDigits="5" groupingUsed="false" value="${type.qty}" />" onkeypress="return checkdigit(event, this, 10, 2)" onchange="Caltotal(this,${sno1});"></td>
                                                                <td><input class="form-control" style="text-align: right;" name="discount" id="discount${sno1}"  autocomplete="off" type="hidden" value="0"  onkeypress="return checkdigit(event, this, 2, 2)" onchange="Caltotal(this,${sno1});">
                                                                    <input class="form-control" style="text-align: right;" name="price" id="price${sno1}"  autocomplete="off" type="text"  value="<fmt:formatNumber type="number" maxFractionDigits="5" groupingUsed="false" value="${type.price}" />" onkeypress="return checkdigit(event, this, 10, 2)" onchange="Caltotal(this,${sno1});"></td>                                                              
                                                                <td><input class="form-control" style="text-align: right;" name="total" id="total${sno1}"  autocomplete="off" type="text" maxlength="30" value="<fmt:formatNumber type="number" maxFractionDigits="5" groupingUsed="false" value="${type.total}" />"></td>
                                                                <td><select class="form-control" style="text-align: left;" name="priority" id="priority"  autocomplete="off" type="text" maxlength="30" value="${type.priority}">
                                                                        <option  selected="" >${type.priority}</option>
                                                                        <option value="High">High</option>
                                                                        <option value="Medium">Medium</option>
                                                                        <option value="Low">Low</option></select>
                                                                </td>
                                                            </tr>
                                                            <c:set var="sno1" value="${sno1+1}"></c:set>
                                                        </c:forEach>
                                                    </tbody>
                                                    <script>
                                                        var table = document.getElementById("resourcetable");
                                                        var count = table.rows.length;

                                                        function addToGrid(val1, val2, val3, val4, val5) {
                                                            var valid1 = true;
                                                            var x = document.getElementById('itemName');
                                                            if (x == '')
                                                            {
                                                                alert("select Mandatory Fields");
                                                                return false;
                                                            }
                                                            if (valid1 === true) {
                                                                var quotationDate = document.getElementById('quotationDate').value;
                                                                var itemName = document.getElementById('itemName').value;
                                                                var quotationDate1 = quotationDate.split("/");
                                                                var itemName1 = itemName.split("/");
                                                                var itemCode = document.getElementById('itemCode').value;
                                                                var itemDesc = document.getElementById('itemDesc').value;
                                                                var itemCategory = document.getElementById('itemCategory').value;
                                                                var itemUom = document.getElementById('itemUom').value;
                                                                var categoryId = document.getElementById('categoryId').value;
                                                                var uomId = document.getElementById('uomId').value;
                                                                $('#resourcetable tr').each(function () {
                                                                    $(this).find('td').each(function () {
                                                                        var a = $(this).find('#supplierCode1').val();
                                                                        if (a === val1) {
                                                                            alert('Record already added to grid');
                                                                            document.getElementById('td').value = "";
                                                                            return false;
                                                                        } else {
                                                                            return true;
                                                                        }
                                                                    });
                                                                });

                                                                if (val1 != "")
                                                                {

                                                                    var table = document.getElementById("resourcetable");
                                                                    var slNo1 = table.rows.length;
                                                                    var slNo = count + 1;



                                                                    var tr = table.insertRow(slNo1);
                                                                    tr.id = 'list_tr_' + slNo;
                                                                    tr.innerHTML = '<td align="center" class="tinput"><button type="button" class="fa fa-trash fa-lg-o" onclick="removeRow(' + slNo + ')" style=""></button> </td>' +
                                                                            '<td class="tinput"><input style="width: 100%; text-align:left;" class="form-control" type="text" readonly name="supplierCode" id="supplierCode1" value="' + val1 + '" style="border: none"></td>\n\
                                                                         <td class="tinput"><input style="width: 100%; text-align:left;" class="form-control" type="text" readonly name="supplierName" id="supplierName" value="' + val2 + '" style="border: none">\n\
                                                                            <input style="width: 100%; text-align:center;" class="form-control" type="hidden" readonly name="sno" id="sno" value="" style="border: none"></td>\n\
                                                                          <input style="width: 100%; text-align:center;" class="form-control" type="hidden" readonly name="supplierAddress" id="supplierAddress" value="' + val3 + '" style="border: none">\n\
                                                                           <input style="width: 100%; text-align:center;" class="form-control" type="hidden" readonly name="supplierContNum" id="supplierContNum" value="' + val4 + '" style="border: none">\n\
                                                                            <input style="width: 100%; text-align:center;" class="form-control" type="hidden" readonly name="mailId" id="mailId" value="' + val5 + '" style="border: none"></td>\n\
                                                                            <td class="tinput"><input style="width: 100%; text-align:left;" class="form-control" type="text" readonly name="itemCode" id="itemCode" value="' + itemCode + '" style="border: none"></td>\n\
                                                                         <td class="tinput"><input style="width: 100%; text-align:left;" class="form-control" type="text" readonly name="itemCategory" id="itemCategory" value="' + itemCategory + '" style="border: none"></td>\n\
                                                                         <td class="tinput"><input style="width: 100%; text-align:left;" class="form-control" type="text" readonly name="itemUom" id="itemUom" value="' + itemUom + '" style="border: none"></td>\n\
                                                                          <input style="width: 100%; text-align:left;" class="form-control" type="hidden" readonly name="itemName" id="itemName" value="' + itemName1 + '" style="border: none">\n\
                                                                            <input style="width: 100%; text-align:center;" class="form-control" type="hidden" readonly name="itemDesc" id="itemDesc" value="' + itemDesc + '" style="border: none">\n\
                                                                                <input style="width: 100%; text-align:center;" class="form-control" type="hidden" readonly name="categoryId" id="categoryId" value="' + categoryId + '" style="border: none">\n\
                                                                                <input style="width: 100%; text-align:center;" class="form-control" type="hidden" readonly name="uomId" id="uomId" value="' + uomId + '" style="border: none">\n\
                                                                           <input style="width: 100%; text-align:center;" class="form-control" type="hidden" readonly name="quotationDate" id="quotationDate" value="' + quotationDate1 + '" style="border: none">\n\
                                                                         <td class="tinput"><input style="width: 100%; text-align:right;" class="form-control" type="text" required name="qty" id="qty' + slNo + '" maxlength="10" value="" style="border: none" onkeypress="return isNumberKey(event)" onkeyup="Caltotal(this,' + slNo + ');"></td>\n\
                                                                          <td class="tinput"><input style="width: 100%; text-align:right;" class="form-control" type="text" required name="price" id="price' + slNo + '" value="" maxlength="10" style="border: none" onkeypress="return isNumberKey(event)" onkeyup="Caltotal(this,' + slNo + ');"></td>\n\
                                                                            <td class="tinput"><input style="width: 100%; text-align:right;" class="form-control" type="text" required name="discount" id="discount' + slNo + '" value="" onkeypress="return check_digit(event, this, 2, 2);" style="border: none" onkeyup="Caltotal(this,' + slNo + ');" ></td>\n\
                                                                             <td class="tinput"><input style="width: 100%; text-align:right;" class="form-control" type="text" readonly name="total" id="total' + slNo + '" value="" style="border: none" ></td>\n\
                                                                             <td class="tinput"><select style="width: 100%; text-align:left;" class="form-control" type="text"  name="priority" id="priority" value="" style="border: none">\n\
                                                                            <option value="High">High</option>\n\
                                                                             <option value="Medium">Medium</option>\n\
                                                                                <option value="Low">Low</option> </select></td>';

                                                                }

                                                                count++;
                                                            }


                                                        }
                                                        function removeRow(id) {
                                                            count--;
                                                            var table = document.getElementById("resourcetable");
                                                            for (var i = 0; i < table.rows.length; i++) {
                                                                var lr = table.rows[i];
                                                                if (lr.id == 'list_tr_' + id) {
                                                                    table.deleteRow(i);
                                                                    return;
                                                                }
                                                            }
                                                        }


                                                    </script>

                                                    <script>

                                                        function checkdigit(e, obj, intsize, deczize) {
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
                                                        //Number Validation
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


                                                        function Caltotal($this, sno)
                                                        {
                                                            var $itemRow = $($this).closest('tr');
                                                            var qty = $itemRow.find('#qty' + sno).val();
                                                            var price = $itemRow.find('#price' + sno).val();
                                                            var discount = $('#discount' + sno).val();
                                                            if (price == '0')
                                                            {
                                                                alert("Invalid Quantity...!!");
                                                                $('#price' + sno).val('');

                                                                return false;
                                                            }
                                                            if (qty == '0')
                                                            {
                                                                alert("Invalid Quantity...!!");
                                                                $('#qty' + sno).val('');

                                                                return false;
                                                            }
                                                            if (price != '' && price != null)
                                                            {
                                                                var total = parseFloat(qty) * parseFloat(price);
                                                                var total1 = (parseFloat(qty) * parseFloat(price) * parseFloat(discount)) / 100;
                                                                var total2 = total - total1;

                                                                if (isNaN(total2) == true)
                                                                {
                                                                    $('#total' + sno).val = '0';
                                                                }
                                                                else
                                                                {
                                                                    $('#total' + sno).val(parseFloat(total2).toFixed(3));
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

                                                    </script>

                                                </table>                                                                      
                                            </div> 
                                        </c:if>
                                        <div>    

                                        </div>

                                        <br/>
                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">


                                            <c:if test="${action eq 'edit'}">
                                                <button type="submit" class="btn btn-primary" style="">Save</button>
                                                <a href="../purchase/quoteList.htm"><button type="button" class="btn btn-danger" style="">Cancel</button></a> 
                                            </c:if>


                                        </div>

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



        </script>
        <script type="text/javascript">


            var myWindow = null;
            function openWindow() {

                myWindow = window.open("../purchReq/deliveryLocPopUp.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function selectVendor() {

                myWindow = window.open("../purchase/selectVendor.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }

            function selectItem() {

                myWindow = window.open("../purchase/selectItem.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
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
    </body>

</html>
