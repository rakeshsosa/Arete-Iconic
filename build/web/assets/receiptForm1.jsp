<%-- 
    Document   : receiptForm1
    Created on : 21 Feb, 2018, 2:36:54 PM
    Author     : ebs05
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../common/validate/validationEngine.css" rel="stylesheet" type="text/css"/>
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.min.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.js" type="text/javascript"></script>
        <script src="../common/datepicker/datetimepicker_css.js" type="text/javascript"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

        <!-- Bootstrap / Font Awesome / jQuery Autocomplete Styles -->


        <script type="text/javascript" src="../common/datepicker/datetimepicker_css_3.js"></script>

        <title>arête Assets Management</title>     
        <%
            Date date = new Date();
        %>
        <script>
            function  test($this, slNo) {
                var $itemRow = $($this).closest('tr');
                var recevingQty = $itemRow.find('#recevingQty').val();
                var pending = $itemRow.find('#pending').val();
                var orderUomConversion = $itemRow.find('#orderUomConversion').val();
//                alert(orderUomConversion)
                var uom = $itemRow.find('#uom').val().split("-");
                var newQty = (recevingQty / uom[2]) * orderUomConversion;
                if (recevingQty === "0") {
                    alert("Invalid Quantity...!!");
                    $itemRow.find('#recevingQty').val('');
                    return false;
                }
                else if (parseFloat(pending) < parseFloat(newQty)) {
                    alert("Please check the pending quantity");
                    $itemRow.find('#recevingQty').val('');
                    return true;

                }

            }


            function mandatory()
            {
                var x = $("#doNo").val() && $("#doDate").val() && $("#batchNo").val() && $(".ex1").val();
                if (x === '') {
                    alert("Mandatory Fields Should Not Be Empty");
                    return  false;
                }

            }

            function clearRow() {
                var table = document.getElementById("billtable");
                var $this = table.rows[0];
                var $itemRow = $($this).closest('tr');
                $itemRow.find('#itemId').val(''); // Hidden input on form
                $itemRow.find('#itemCode').val('');
                $itemRow.find('#itemDesc').val('');
                $itemRow.find('#batchno').val('');
                $itemRow.find('#expdate').val('');
                $itemRow.find('#imQty').val('');
                $itemRow.find('#imValue').val('');
            }

            function selectfoc($this) {

                var $itemRow = $($this).closest('tr');
                var val = $itemRow.find('#nature').val();
                if (val == "FOC") {
                    $itemRow.find('#itemPrice').attr('readonly', true);
                    $itemRow.find('#itemPrice').val('0');
                    $itemRow.find('#itemDiscount').attr('readonly', true);
                    $itemRow.find('#itemDiscount').val('0');
                } else {
                    $itemRow.find('#itemPrice').attr('readonly', false);
                    $itemRow.find('#itemPrice').val('');
                    $itemRow.find('#itemDiscount').attr('readonly', false);
                    $itemRow.find('#itemDiscount').val('');
                }

                //$('#test').attr();
                //document.getElementById("hiddentr").value=$itemRow.index();

            }

            //    function pandf(){alert('test');
            //        var a=$("#pandf").value;
            //        
            //    }

            jQuery(document).ready(function () {
                // binds form submission and fields to the validation engine
                jQuery("#imForm").validationEngine();

                $('.ex2').attr('disabled', true);
                $('.ex1').attr('disabled', true);
                $('.ex3').attr('disabled', true);
                $('.foc').attr('disabled', true);
                $('.itemSubCategory').attr('disabled', true);
                $('.itemName').attr('disabled', true);
                $('.itemCode').attr('disabled', true);
                $('.itemDesc').attr('disabled', true);
                $('.itemCategory').attr('disabled', true);
                $('.discount').attr('disabled', true);
                $('.oQty').attr('disabled', true);
                $('.unitPrice').attr('disabled', true);
                $('.recdQty').attr('disabled', true);
                $('.uom').attr('disabled', true);
                $('.orderUomConversion').attr('disabled', true);


            });

            function changeAction(val) {
                if (val != "blank") {
                    for (var i = 1; i <= 50; i++) {
                        document.getElementById(val + i).checked = true;
                    }
                } else {
                    for (var i = 1; i <= 50; i++) {
                        document.getElementById("app" + i).checked = false;
                        document.getElementById("rej" + i).checked = false;
                        document.getElementById("hold" + i).checked = false;
                    }
                }
            }

            (itemQtyPriceSelectors).on('keyup', function () {
                mioInvoice.updatePrice(this);
            });


//            function acjqty($this) {
//
//                var $itemRow = $($this).closest('tr');
//
//                var val = $itemRow.find('#pending').val() - $itemRow.find('#recevingQty').val();
//                if (parseFloat(val) < 0) {
//                    alert("Please check the pending quantity");
//                    $itemRow.find('#recevingQty').val("");
//                    //$itemRow.find('#rejectedQty').val("N/A");
//                    return false;
//                }
//            }

            function isNumberKey(evt)
            {

                var charCode = (evt.which) ? evt.which : event.keyCode
                if (charCode >= 31 && (charCode < 48 || charCode > 57))
                    return false;
                return true;
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

                $(".numeric").bind("copy", function (e) {
                    return false;
                });
                $(".numeric").bind("paste", function (e) {
                    return false;
                });
                $(".numeric").bind("drop", function (e) {
                    return false;
                });
            }
        </script>         
    </head>
    <body class="nav-md">

         <jsp:include page="../login/menu.htm" />


                        <main id="main" class="main">
                            <div>
                                <jsp:include page="../login/headerlink.htm?submodule=Receipt List&tab=Receipt&pagetype=form"/>
                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h5>Receipt</h5>
                                                </div>


                                    <form class="row"method="post" action="../quality/MRSubmit.htm" id="imForm" onsubmit="return checkBoxValid(this);">

                                        <c:set var="j" value="0"/>
                                        <c:forEach items="${recordlist}" var="list">
                                            <c:if test="${j eq 0}">
                                                <c:set var="j" value="1"/>

                                                <c:set var="projectCode" value="${list.projectCode}"/>
                                                <c:set var="user" value="${list.userId}"/>
                                                <c:set var="supplierCode" value="${list.supplierCode}"/>
                                                <c:set var="poNo" value="${list.purchaseOrderNo}"/>
                                                <c:set var="purchaseType" value="${list.purchaseType}"/>
                                                <c:set var="supplierId" value="${list.supplierCode}"/>
                                                <c:set var="supplierName" value="${list.supplierName}"/>
                                                <c:set var="supplierAddress" value="${list.supplierAddress}"/>
                                                <c:set var="supplierEmail" value="${list.supplierEmail}"/>
                                                <c:set var="discount" value="${list.discount}"/>
                                                <c:set var="shipToLocation" value="${list.shipToLocation}"/>

                                            </c:if>
                                        </c:forEach>                                 


                                        <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">

                                                <div style="margin-left: -12px;" class="col-md-4 col-sm-6 col-xs-12">                                            <div class="input-group">
                                                        <div>
                                                            <strong>Receipt Number:</strong>&nbsp;&nbsp;&nbsp;<div id="dynamicdiv" style="display: inline">GRN-${ordno}</div>
                                                            <input name="recordNo" value="GRN-${ordno}" type="hidden">
                                                            <input class="form-control" id="deptName" name="deptName" readonly="" type="hidden" value="<%=session.getAttribute("userDept").toString()%>" maxlength="80">
                                                            <input class="form-control" name="orgCode" readonly="" type="hidden" value="<%=session.getAttribute("orgCode").toString()%>" maxlength="80">
                                                        </div>

                                                        <div style="padding-left:19px;"> <strong>Receipt Date:</strong>&nbsp;&nbsp;&nbsp;<fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="<%=date%>" />
                                                            <input name="mrDate" type="hidden" value="<fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="<%=date%>" />" tabindex="-1"/>
                                                        </div>

                                                        <div style="padding-left:20px;"> <strong>Received By:</strong>&nbsp;&nbsp;&nbsp; ${user}</div>
                                                        <div style="padding-left:17px;"> <strong>Project Code:</strong>&nbsp;&nbsp;&nbsp;${projectCode}
                                                            <input name="projectCode" value="${projectCode}" type="hidden">

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-sm-6 col-xs-12" style="float:right">
                                                    <div><strong>Purchase Order No:</strong>&nbsp;&nbsp;&nbsp; ${poNo}</div>
                                                    <input name="poNo" value="${poNo}" id="poNo" type="hidden">

                                                    <div style="padding-left:24px;"><strong>Purchase Type:</strong>&nbsp;&nbsp;&nbsp;&nbsp; ${purchaseType}</div>
                                                    <input  name="purchaseType" value="${purchaseType}" type="hidden">

                                                    <div class="form-inline" style="padding-left:41px;"> 
                                                        <strong><span style="color: red">*</span> Invoice No:</strong>
                                                        <input autocomplete="off" type="text"  maxlength="30" name="doNo" id="doNo" class="form-control validate[required]" tabindex="1" style="width:150px; margin-top:7px; margin-left:10px">
                                                    </div>  

                                                    <div class="form-inline"style="padding-left:26px;" > 
                                                        <strong><span style="color: red">*</span> Invoice Date:</strong>
                                                        <input type="text"  name="doDate"  id="doDate" autocomplete="off" placeholder="DD/MM/YYYY"  tabindex="2" id="doDate" class="form-control validate[required]" style="width:150px;margin-left:10px; margin-top:9px" onchange="getDate1(this)">
                                                    </div>
                                                    <br/>
                                                </div>

                                                <div class="clearfix"></div>


                                                <div class="x_content">
                                                    <div class="row">

                                                        <div class="col-md-12">

                                                            <!-- price element -->
                                                            <div style="" class="col-md-4 col-sm-6 col-xs-12">
                                                                <div class="pricing">

                                                                    <div class="x_content">
                                                                        <div class="">
                                                                            <div >
                                                                                <ul class="list-unstyled text-left">
                                                                                    <li><h5><strong>Supplier Details:</strong></h5></li>

                                                                                    <div id="clientName">${supplierName}</div>
                                                                                    <input name="clientName"  value="${supplierName}" type="hidden">

                                                                                    <div id="clientAddress"style="width:300px;">${supplierAddress}</div>
                                                                                    <input name="clientAddress" value="${supplierAddress}" type="hidden">

                                                                                    <%--<div id="clientCity"style="width:300px;">${contact.cityName}, ${contact.country}</div>--%>

                                                                                    <%--<div id="clientPhone">${contact.contactNumber}</div>--%>
                                                                                    <%-- <input name="clientPhone" value="${contact.contactNumber}" type="hidden">--%>

                                                                                    <div id="clientEmail">${supplierEmail}</div>
                                                                                    <input name="suppId" id="suppId" value="${supplierCode}" type="hidden">

                                                                                </ul>
                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>   
                                                            <!-- price element -->


                                                            <div class="col-md-4 col-sm-6 col-xs-12">
                                                                <div class="pricing">

                                                                    <div class="x_content">
                                                                        <div class="">
                                                                            <div>
                                                                                <ul class="list-unstyled text-left">
                                                                                    <li><h5><strong>Delivery Location:</strong></h5></li>

                                                                                    <div >${shipToLocation}</div>
                                                                                    <input name="shipToLocation" value="${shipToLocation}" type="hidden">



                                                                                </ul>
                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>   
                                                            <!-- price element -->

                                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                                <div class="x_panel" style="overflow:scroll">

                                                                    <div class="x_content">



                                                                        <table class="table table-striped responsive-utilities jambo_table bulk_action" id="itemsTable1">
                                                                            <thead>
                                                                                <tr class="">
                                                                                    <!--<th><i class="fa fa-trash"></i></th>-->
                                                                                    <th style="border-bottom:1px solid transparent;">

<!--                                                                                        <input type="checkbox" id="selectall" onclick="checkAll();"/>-->

                                                                                    </th>

                                                                                    <th class="column-title" style="border-bottom:1px solid transparent; width: 250px;">Sub Category</th>
                                                                                    <th class="column-title" style="border-bottom:1px solid transparent; width: 300px;">Item Name</th>
                                                                                    <th class="column-title" style="border-bottom:1px solid transparent; width: 480px;">Item Desc</th>
                                                                                    <th class="column-title" style="border-bottom:1px solid transparent; width: 100px;">Order Qty</th>
                                                                                    <th class="column-title" style="border-bottom:1px solid transparent; width: 200px;">Ordered Price</th>
                                                                                    <th class="column-title" style="border-bottom:1px solid transparent; ">Uom</th>
                                                                                    <th class="column-title" style="border-bottom:1px solid transparent; width: 180px;">Unit Price</th>
                                                                                    <th class="column-title" style="border-bottom:1px solid transparent;">Delivery Date</th>
                                                                                    <th colspan="2" class="column-title" style="">Quantity </th>


                                                                                    <th class="column-title" style="border-bottom:1px solid transparent;width: 200px;"><span style="color: red">*</span> Batch No</th>
                                                                                    <th class="column-title" style="border-bottom:1px solid transparent; width: 230px;"><span style="color: red">*</span> Expiry Date</th>
                                                                                    <th class="column-title" style="border-bottom:1px solid transparent;">Action</th>

                                                                                </tr>
                                                                                <tr class="" style="border:1px solid transparent;">
                                                                                    <!--<th><i class="fa fa-trash"></i></th>-->
                                                                                    <th style="">


                                                                                    </th>

                                                                                    <th style=""></th>
                                                                                    <th style=""></th>
                                                                                    <th style=""></th>
                                                                                    <th style=""></th>
                                                                                    <th style=""></th>
                                                                                    <th style=""></th>
                                                                                    <th style=""></th>
                                                                                    <th style=""></th>
                                                                                    <th style="width:6%;">Receiving</th>
                                                                                    <th style="width:6%;">FOC</th>
                                                                                    <th style=""></th>
                                                                                    <th style=""><span style=""></span> </th>
                                                                                    <th style=""><span style=""></span> </th>


                                                                                </tr>
                                                                            </thead>

                                                                            <tbody>


                                                                                <c:forEach items="${recordlist}" var="list">                                                                            
                                                                                    <c:set var="ordUom" value="${list.uom}"/>
                                                                                    <c:if test="${list.approvalStatus ne 'Fully Receipt'}">
                                                                                        <c:set var="finalrecieved" value="0"/>
                                                                                        <c:set var="finalrecieved1" value="0"/>
                                                                                        <c:set var="finalrecieved2" value="0"/>
                                                                                        <c:set var="aQty" value="0"/>
                                                                                        <c:set var="FOC" value="0"/>
                                                                                        <c:set var="redQty" value="0"/> 
                                                                                        <c:set var="oqty" value="${list.qty}"/>
                                                                                        <c:set var="discount" value="${list.discount}"/>
                                                                                        <c:set var="trec" value="0"/>

                                                                                        <c:forEach items="${mrlist}" var="recievedlist">
                                                                                            <c:forEach items="${uomList}" var="uomList">
                                                                                                <c:if test="${list.itemCode eq recievedlist.itemCode}">
                                                                                                    <c:if test="${list.requiredDate eq recievedlist.deliveryDate}">

                                                                                                        <c:if test="${recievedlist.itemCode eq uomList[0]}">


                                                                                                            <c:if test="${recievedlist.uom  eq uomList[1]}">
                                                                                                                <c:set var="recUomConv" value="1" />
                                                                                                            </c:if>
                                                                                                            <c:if test="${recievedlist.uom  eq uomList[2]}">
                                                                                                                <c:set var="recUomConv" value="${uomList[5]}" />
                                                                                                            </c:if>
                                                                                                            <c:if test="${recievedlist.uom  eq uomList[3]}">
                                                                                                                <c:set var="recUomConv" value="${uomList[6]}" />
                                                                                                            </c:if>
                                                                                                            <c:if test="${recievedlist.uom  eq uomList[4]}">
                                                                                                                <c:set var="recUomConv" value="${uomList[7]}" />
                                                                                                            </c:if>

                                                                                                            <c:if test="${ordUom  eq uomList[1]}">
                                                                                                                <c:set var="orderUomConv" value="1" />
                                                                                                            </c:if>
                                                                                                            <c:if test="${ordUom  eq uomList[2]}">
                                                                                                                <c:set var="orderUomConv" value="${uomList[5]}" />
                                                                                                            </c:if>
                                                                                                            <c:if test="${ordUom  eq uomList[3]}">
                                                                                                                <c:set var="orderUomConv" value="${uomList[6]}" />
                                                                                                            </c:if>
                                                                                                            <c:if test="${ordUom eq uomList[4]}">
                                                                                                                <c:set var="orderUomConv" value="${uomList[7]}" />
                                                                                                            </c:if>
                                                                                                            <c:set var="trecqty" value="${(recievedlist.receivingQty/recUomConv)*orderUomConv}"/>

                                                                                                            <c:set var="trec" value="${trec+trecqty}" />

                                                                                                            <%--<c:if test="${recievedlist.uom eq uomList[1] && uomList[1] eq uomList[2]}">--%>
                                                                                                            <%--<c:if test="${uomList[1] eq uomList[2]}">--%>
                                                                                                            <%--<c:set var="finalrecieved1" value="${(finalrecieved1+recievedlist.receivingQty)/1}"/>--%>
                                                                                                            <%--<c:set var="finalrecieved2" value="${(finalrecieved2+recievedlist.receivingQty)}"/>--%>
                                                                                                            <%--</c:if>--%>
                                                                                                            <%--</c:if>--%>
                                                                                                            <%--<c:if test="${recievedlist.uom eq uomList[2] && uomList[1] ne uomList[2]}">--%>
                                                                                                            <%--<fmt:parseNumber var="i" type="number" value="${uomList[5]}" />--%>
                                                                                                            <%--<c:set var="finalrecieved1" value="${(finalrecieved1+recievedlist.receivingQty)/i}"/>--%>
                                                                                                            <%--<c:set var="finalrecieved2" value="${(finalrecieved2+recievedlist.receivingQty)}"/>--%>
                                                                                                            <%--</c:if>--%>
                                                                                                            <%--</c:if>--%>

                                                                                                            <%--<c:if test="${recievedlist.uom eq uomList[2]  && uomList[1] ne uomList[2]}">--%>
                                                                                                            <%--<fmt:parseNumber var="i" type="number" value="${uomList[5]}" />--%>
                                                                                                            <%--<c:set var="finalrecieved1" value="${(finalrecieved1+recievedlist.receivingQty)/i}"/>--%>
                                                                                                            <%--<c:set var="finalrecieved2" value="${(finalrecieved2+recievedlist.receivingQty)}"/>--%>
                                                                                                            <%--</c:if>--%>
                                                                                                            <%--</c:if>--%>

                                                                                                            <%--<c:if test="${recievedlist.uom eq uomList[3]}">--%>
                                                                                                            <%--<fmt:parseNumber var="i" type="number" value="${uomList[6]}" />--%>

                                                                                                            <%--<c:set var="finalrecieved1" value="${(finalrecieved1+recievedlist.receivingQty)/i}"/>--%>
                                                                                                            <%--<c:set var="finalrecieved2" value="${(finalrecieved2+recievedlist.receivingQty)}"/>--%>
                                                                                                            <%--</c:if>--%>

                                                                                                            <%--<c:if test="${recievedlist.uom eq uomList[4]}">--%>
                                                                                                            <%--<fmt:parseNumber var="i" type="number" value="${uomList[7]}" />--%>
                                                                                                            <%--<c:set var="finalrecieved1" value="${(finalrecieved1+recievedlist.receivingQty)/i}"/>--%>
                                                                                                            <%--<c:set var="finalrecieved2" value="${(finalrecieved2+recievedlist.receivingQty)}"/>--%>
                                                                                                            <%--</c:if>--%>

                                                                                                            <%--<c:set var="finalrecieved1" value="${finalrecieved1+((recievedlist.receivingQty)/uo)}"/>--%>
                                                                                                            <c:set var="recUom" value="${recievedlist.uom}"/>
                                                                                                        </c:if>
                                                                                                    </c:if>
                                                                                                </c:if>
                                                                                            </c:forEach>

                                                                                        </c:forEach>
                                                                                        <c:forEach items="${itemlist}" var="itemlist">
                                                                                            <c:if test="${list.itemCode eq itemlist.itemCode}">
                                                                                                <c:forEach items="${itemstore}" var="itemstore">
                                                                                                    <c:if test="${itemlist.itemCode eq itemstore.itemCode}">

                                                                                                        <c:if test="${orgId eq itemstore.orgId}">
                                                                                                            <c:if test="${orgCode eq itemstore.division}">

                                                                                                            </c:if>
                                                                                                        </c:if>
                                                                                                    </c:if>
                                                                                                </c:forEach>
                                                                                            </c:if>
                                                                                        </c:forEach>


                                                                                        <tr class="item-row">

                                                                                            <c:forEach items="${uomList}" var="uomList">
                                                                                                <c:forEach items="${itemSupplier1}" var="itemSupplier1">
                                                                                                    <c:if test="${list.itemCode eq itemSupplier1[0]}">
                                                                                                        <c:set var="itemSupp" value="${itemSupplier1[5]}"/>
                                                                                                    </c:if>

                                                                                                </c:forEach>
                                                                                            </c:forEach>

                                                                                            <!--<td align="center" onclick=""><button type="button" id="deleteRow"><i class="fa fa-trash-o"></i></button></td>-->
                                                                                            <td>


                                                                                                <input type="checkbox" id="selectedvalues"   name="snos" value="${list.SNo}:${list.itemCode}" onclick="getVal(this,${list.SNo});"/>

                                                                                                <c:set var="str" value="${str},${list.itemCode}"/>
                                                                                                <input type="hidden" id="abc1"  name="abc1" value="${list.itemCode}" >
                                                                                                <input type="hidden" id="abc"  name="abc" value="${str}" >

                                                                                            </td>
                                                                                            <td>
                                                                                                <input name="itemSubCategory" class="form-control validate[required] itemSubCategory" readonly="" style="text-align:left;width:250px;" id="itemSubCategory" value="${list.itemSubCategory}" type="text">
                                                                                                <input id="itemSupp" type="hidden" value="${itemSupp}">
                                                                                                <input name="supplierCode1" id="supplierCode1" value="${supplierCode}" type="hidden">
                                                                                                <input id="supplierName" value="${supplierName}" type="hidden">
                                                                                            </td>

                                                                                            <td>
                                                                                                <%--<input name="snos" style="text-align:left;" value="${list.SNo}" id="snos" type="hidden">--%>
                                                                                                <input type="text" name="itemName" readonly id="itemName" class="form-control validate[required] itemName " style="text-align:left;width: 300px;" value="${list.itemName}"/> 

                                                                                                <input type="hidden" name="itemCode"  class="form-control itemCode" id="itemCode" value="${list.itemCode}"/> 


                                                                                                <input name="itemCategory" id="itemCategory" class="form-control itemCategory" value="${list.itemCategory}" type="hidden">

                                                                                                <input name="discount" id="discount" value="${list.discount}" class="form-control discount" type="hidden">
                                                                                            </td>

                                                                                            <td>
                                                                                                <input type="text" readonly="" name="itemDesc" id="itemDesc" class="form-control itemDesc" style="text-align:left;width: 110px;" value="${list.description}"/>

                                                                                            </td>



                                                                                            <td class="right"><input  type="text" class="form-control right validate[required] oQty" readonly name="oQty"  id="oQty" style="width: 70px;" value="${oqty}"/>${list.uom} [Pending: <fmt:formatNumber pattern="#.###" maxFractionDigits="3" value="${list.qty-trec}"/> ${list.uom}]

                                                                                                <input type="hidden" id="orderUom" value="${list.uom}">

                                                                                                <input type="hidden" style="" id="pending" value="${list.qty-trec}">
                                                                                            </td>

                                                                                            <td class="right"><input  type="text" class="form-control right validate[required] oPrice" readonly   style="width: 60px;" value="<fmt:formatNumber pattern="0.000" value="${list.unitPrice}"/>"/>

                                                                                            </td>

                                                                                            <td>
                                                                                                <%-- <c:forEach items="${uomList}" var="uomList">
                                                                                                <%--<c:forEach items="${itemSupplier}" var="itemSupplier">

                                                                                                <%--<c:if test="${uomList[0] eq itemSupplier.itemCode}">
                                                                                                <c:if test="${supplierCode eq list.supplierCode}">
                                                                                                    <c:if test="${list.itemCode eq uomList[0]}">
                                                                                                        <c:if test="${list.uom eq uomList[1]}">
                                                                                                            <c:set var="orderUomConv" value="1" />
                                                                                                        </c:if>
                                                                                                        <c:if test="${list.uom eq uomList[2]}">
                                                                                                            <c:set var="orderUomConv" value="${uomList[5]}" />
                                                                                                        </c:if>
                                                                                                        <c:if test="${list.uom eq uomList[3]}">
                                                                                                            <c:set var="orderUomConv" value="${uomList[6]}" />
                                                                                                        </c:if>
                                                                                                        <c:if test="${list.uom eq uomList[4]}">
                                                                                                            <c:set var="orderUomConv" value="${uomList[7]}" />
                                                                                                        </c:if>
                                                                                                        <c:set var="pUom" value="${uomList[1]}" />
                                                                                                        <c:set var="uom1" value="${uomList[2]}" />
                                                                                                        <c:set var="uom2" value="${uomList[3]}" />
                                                                                                        <c:set var="uom3" value="${uomList[4]}" />
                                                                                                        <c:set var="purchasePrice" value="${list.unitPrice}" />
                                                                                                        <c:set var="uom1Price" value="${list.uom1Price}" />
                                                                                                        <c:set var="uom2Price" value="${list.uom2Price}" />
                                                                                                        <c:set var="uom3Price" value="${list.uom3Price}" />

                                                                                                            <c:if test="${pUom ne uom1}">
                                                                                                                <c:if test="${ordUom eq pUom}">
                                                                                                                    <c:set var="uom1" value="${pUom}-${purchasePrice}-1:${uom1}-${uom1Price}-${uomList[5]}:${uom2}-${uom2Price}-${uomList[6]}:${uom3}-${uom3Price}-${uomList[7]}:"/>
                                                                                                                </c:if>

                                                                                                                <c:if test="${ordUom eq uom1}">
                                                                                                                    <c:set var="uom1" value="${uom1}-${uom1Price}-${uomList[5]}:${uom2}-${uom2Price}-${uomList[6]}:${uom3}-${uom3Price}-${uomList[7]}:"/>
                                                                                                                </c:if>

                                                                                                                <c:if test="${ordUom eq uom2}">
                                                                                                                    <c:set var="uom1" value="${uom2}-${uom2Price}-${uomList[6]}:${uom3}-${uom3Price}-${uomList[7]}:"/>
                                                                                                                </c:if>

                                                                                                                <c:if test="${ordUom eq uom3}">
                                                                                                                    <c:set var="uom1" value="${uom3}-${uom3Price}-${uomList[7]}:"/>
                                                                                                                </c:if>
                                                                                                            </c:if>

                                                                                                            <c:if test="${pUom eq uom1}">
                                                                                                                <c:if test="${ordUom eq uom1}">
                                                                                                                    <c:set var="uom1" value="${uom1}-${uom1Price}-${uomList[5]}:${uom2}-${uom2Price}-${uomList[6]}:${uom3}-${uom3Price}-${uomList[7]}:"/>
                                                                                                                </c:if>

                                                                                                                <c:if test="${ordUom eq uom2}">
                                                                                                                    <c:set var="uom1" value="${uom2}-${uom2Price}-${uomList[6]}:${uom3}-${uom3Price}-${uomList[7]}:"/>
                                                                                                                </c:if>

                                                                                                                <c:if test="${ordUom eq uom3}">
                                                                                                                    <c:set var="uom1" value="${uom3}-${uom3Price}-${uomList[7]}:"/>
                                                                                                                </c:if>
                                                                                                            </c:if>

                                                                                                <%--<c:if test="${pUom ne uom1}">--%>
                                                                                                <%--<c:set var="uom1" value="${pUom}-${purchasePrice}-1:${uom1}-${uom1Price}-${uomList[5]}:${uom2}-${uom2Price}-${uomList[6]}:${uom3}-${uom3Price}-${uomList[7]}:"/>--%>
                                                                                                <%--</c:if>--%>
                                                                                                <%--<c:if test="${pUom eq uom1}">--%>
                                                                                                <%--<c:set var="uom1" value="${uom1}-${uom1Price}-${uomList[5]}:${uom2}-${uom2Price}-${uomList[6]}:${uom3}-${uom3Price}-${uomList[7]}:"/>--%>
                                                                                                <%--</c:if>
                                                                                            </c:if>
                                                                                        </c:if>
                                                                                                <%--</c:if> 
                                                                                                <%--</c:forEach> 
                                                                                            </c:forEach>--%>
                                                                                                <input type="hidden" name="orderUomConversion" id="orderUomConversion" class="form-control orderUomConversion" value="0">
                                                                                                <input type="text" class="form-control" readonly="" name="uom" id="uom" style="width: 80px;" value="${list.uom}">




                                                                                            </td>
                                                                                            <td>
                                                                                                <input name="unitPrice" id="unitPrice${list.SNo}" readonly class="form-control right unitPrice" style="width: 60px;" value="<fmt:formatNumber pattern="0.000" value="${list.unitPrice}"/>" type="text">
                                                                                                <input  type="hidden" class="form-control oPrice" id="OunitPrice${list.SNo}"    value="${list.unitPrice}"/>
                                                                                            </td>

                                                                                            <td>
                                                                                                <input name="deliveryDate" id="deliveryDate" readonly class="form-control right deliveryDate" style="width: 90px;" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.requiredDate}" />" type="text">
                                                                                            </td>

                                                                                            <%-- <td>
                                                                                                 <c:if test="${aQty eq 0}">

                                                                                                    <input name="recdQty" style="" readonly id="recdQty" class="form-control recdQty" value="<fmt:formatNumber pattern="#.##" maxFractionDigits="2" value="${trec}"/>" type="text" onkeypress="return check_digit(event, this, 5, 3);"> 
                                                                                                </c:if>
                                                                                                <c:if test="${aQty gt 0}">
                                                                                                    ${trec}
                                                                                                    <input name="recdQty" style="" id="recdQty" readonly class="form-control recdQty" value="<fmt:formatNumber pattern="#.##" maxFractionDigits="2" value="0.00"/>" type="text"  > 
                                                                                                </c:if>
                                                                                            </td>
                                                                                            <td>
                                                                                                <c:if test="${trec eq 0}">
                                                                                                    <input  style="text-align:left;width: 60px;"  readonly="" value=""   autocomplete="off"   class="form-control"   type="text">
                                                                                                </c:if>
                                                                                                <c:if test="${trec gt 0}">
                                                                                                    <input  style="text-align:left;width: 60px;"  readonly="" value="${recUom}"   autocomplete="off"   class="form-control"   type="text">
                                                                                                </c:if>
                                                                                            </td>--%>
                                                                                            <td><input type="text" style="" class="form-control right validate[required] ex3" onpaste="return false" id="recevingQty"  maxlength="10" value="<fmt:formatNumber pattern="#.##" maxFractionDigits="2" value="${list.qty }" />"  onkeyup="test(this,${list.SNo})"  autocomplete="off" name="recevingQty" oninput="changeUnitPrice(this, '${list.itemCode}', '${list.SNo}', '${supplierCode}')"   onkeypress="return check_digit(event, this, 5, 3);">
                                                                                                <input name="today" class="form-control" value="<%= (new SimpleDateFormat("dd/MM/yyyy")).format(new java.util.Date())%>" id="today"  type="hidden">

                                                                                            </td>
                                                                                            <td>
                                                                                                <c:if test="${FOC eq 0}">

                                                                                                    <input style="width: 60px;" autocomplete="off" name="foc" onpaste="return false" id="foc" class="form-control right validate[required] foc" value="<fmt:formatNumber pattern="#.##" maxFractionDigits="2" value="${FOC}"/>" type="text" onkeypress="return check_digit(event, this, 5, 3);"> 
                                                                                                </c:if>
                                                                                                <c:if test="${FOC gt 0}">

                                                                                                    <input style="width: 60px;" autocomplete="off" name="foc" id="foc" class="form-control right validate[required]" value="<fmt:formatNumber pattern="#.##" maxFractionDigits="2" value="${FOC}"/>" type="text"  > 
                                                                                                </c:if>
                                                                                            </td>


                                                                                            <c:set var="ex2" value="${list.SNo}"/>

                                                                                            <td class=" ">

                                                                                                <input style="text-align:left;width:60px;" name="batchNo"  autocomplete="off"  value="" class="form-control validate[required]  ex2" id="bno"  type="text">


                                                                                            </td>
                                                                                            <c:set var="ex1" value="${list.SNo}"/>
                                                                                            <td class=" ">


                                                                                                <input style="text-align:left;width: 90px;" name="expDate" autocomplete="off"    value="" class="form-control validate[required] ex1" id="ex1" type="text" placeholder="DD/MM/YYYY"  onchange="getDate(this)">

                                                                                            </td>

                                                                                            <td style="width:10%;text-align:left;"><a href = "../quality/cancelMR.htm?sno=${list.SNo}&purchaseorderno=${list.purchaseOrderNo}" onclick="if (confirm('Do you really want to cancel this record?')) {
                                                                                                        return true;
                                                                                                    } else {
                                                                                                        return false;
                                                                                                    }"><button type="button" class="myButton2" style="text-align:left;width:100px;"><i class="fa fa-times-circle"> Receipt Cancel</i></button></a></td>


                                                                                        </tr>
                                                                                    </c:if>
                                                                                </c:forEach>

                                                                            </tbody>

                                                                        </table>
                                                                        <%--<div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                                                                <!--<button id="addRow" class="btn btn-danger" style=""><i class="glyphicon glyphicon-plus"></i>ADD</button>-->
                                                                                <a href="#" id="addRow" class="btn btn-success" tabindex=""><i class="glyphicon glyphicon-plus"></i> Add FOC Item</a>

                                                                    </div>
</div>--%>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <!-- price element -->       

                                                            <p>&nbsp;</p>

                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                                    <br/>
                                                                    <input id="saveInvoiceBtn" class="btn btn-primary" name="saveInvoice" value="Save" type="submit" onmouseover="grnDuplicate();">

                                                                    <a href="../inventory/materialReceiptsList.htm" class="btn btn-danger">Cancel</a> 
                                                                </div>
                                                            </div>
                                                        </div>


                                                    </div>
                                                </div>
                                            </div>
                                        </div>



                                        <!-- footer content -->

                                        <!-- /footer content -->
                                    </form>

                                </div>
                                        </div>

                                    </div>
                                </div>
                            </section>

                        </main><!-- End #main -->
                        <jsp:include page="../login/footer.jsp" />
        <script>
            //            $('#selectedvalues').on('click', function () {
            //                var checked = $('#selectedvalues').is(':checked');
            //                
            //                var x = $(this).val();
            //                if (checked === true)
            //                {
            //                    alert(x);
            //                    $('#' + x).attr('disabled', false);
            //                    $('#ex1' + x).attr('disabled', false);
            //                }
            //                else {
            //                    $('#' + x).attr('disabled', true);
            //                    $('#ex1' + x).attr('disabled', true);
            //                }
            //
            //            });



            $(document).ready(function () {

                jQuery("#imForm").validationEngine();
            });

            checked = false;
            function checkAll() {
                var aa = document.getElementById('imForm');
//                alert(aa);
                //for validation of supplier
                var itemSubCategory = document.getElementsByName('itemSubCategory');
                var itemCode = document.getElementsByName('itemCode');
                var itemName = document.getElementsByName('itemName');
                var itemDesc = document.getElementsByName('itemDesc');
                var itemCategory = document.getElementsByName('itemCategory');
                var discount = document.getElementsByName('discount');
                var oQty = document.getElementsByName('oQty1');
                var unitPrice = document.getElementsByName('unitPrice');
                // var recdQty = document.getElementsByName('recdQty');
                var batchNo = document.getElementsByName('batchNo');
                var expDate = document.getElementsByName('expDate');
                var foc = document.getElementsByName('foc');
                var uom = document.getElementsByName('uom');
                var abc = document.getElementsByName('abc');
                
                var abc1 = document.getElementsByName('abc1');
                var recevingQty = document.getElementsByName('recevingQty');
                var supplierName = document.getElementById('supplierName').value;
                // var orderUomConversion1 = document.getElementsByName('orderUomConversion');
                l = abc.length;

                for (i = 0; i < l; i++) {
                    alert(oQty[i].value);
                    var t = 0;
                    var a = abc[i].value;
                    var itemCode1 = itemCode[i].value;
                    var recevingQty1 = recevingQty[i].value;
                    for (j = 0; j < abc1.length; j++) {

                        if (itemCode1 === abc1[j].value) {
                            t = 1;
                        }


                    }

                    if (t === 0) {
                        itemSubCategory[i].removeAttribute("disabled");
                        itemCode[i].removeAttribute("disabled");
                        itemName[i].removeAttribute("disabled");
                        itemDesc[i].removeAttribute("disabled");
                        itemCategory[i].removeAttribute("disabled");
                        discount[i].removeAttribute("disabled");
                        oQty[i].removeAttribute("disabled");
                        unitPrice[i].removeAttribute("disabled");
                        //  recdQty[i].removeAttribute("disabled");
                        batchNo[i].removeAttribute("disabled");
                        expDate[i].removeAttribute("disabled");
                        foc[i].removeAttribute("disabled");
                        recevingQty[i].removeAttribute("disabled");
                        uom[i].removeAttribute("disabled");
                        // orderUomConversion1[i].removeAttribute("disabled");


                    }
                }
                if (checked === false) {
//                    if (a !== '') {
//                        alert(supplierName + " is not tagged to " + a + ". Please tag to proceed.");
//                    }
//                    alert("1");
                    $('.uom').prop('disabled', false);
                    $('.ex2').prop('disabled', false);
                    $('.ex1').prop('disabled', false);
                    $('.ex3').prop('disabled', false);
                    $('.foc').prop('disabled', false);
                    
                    checked = true;
                } else {
//                    alert(2);
                    checked = false;
                    $(".ex2").attr('disabled', true);
                    $(".ex1").attr('disabled', true);
                    $(".ex3").attr('disabled', true);
                    $(".foc").attr('disabled', true);
                    $('.itemSubCategory').attr('disabled', true);
                    $('.itemName').attr('disabled', true);
                    $('.itemCode').attr('disabled', true);
                    $('.itemDesc').attr('disabled', true);
                    $('.itemCategory').attr('disabled', true);
                    $('.discount').attr('disabled', true);
                    $('.oQty').attr('disabled', true);
                    $('.unitPrice').attr('disabled', true);
                    $('.recdQty').attr('disabled', true);
                    $(".ex1").val('');
                    $(".ex2").val('');
                    $('.uom').prop('disabled', true);
                    $('.orderUomConversion').attr('disabled', true);
                }

                //

                // alert('test');
//                if (checked === false) {
//                    alert(supplierName + " is not tagged to " + a + ". Please tag to proceed.");
//                    checked = true;
//                    $(".ex2").attr('disabled', false);
//                    $(".ex1").attr('disabled', false);
//                    $(".ex3").attr('disabled', false);
//                    $(".foc").attr('disabled', false);
//                    $('.itemSubCategory').attr('disabled', false);
//                    $('.itemName').attr('disabled', false);
//                    $('.itemCode').attr('disabled', false);
//                    $('.itemDesc').attr('disabled', false);
//                    $('.itemCategory').attr('disabled', false);
//                    $('.discount').attr('disabled', false);
//                    $('.oQty').attr('disabled', false);
//                    $('.unitPrice').attr('disabled', false);
//                    $('.recdQty').attr('disabled', false);
//                    $('.uom').prop('disabled', false);
//                } else {
//                    checked = false;
//                    $(".ex2").attr('disabled', true);
//                    $(".ex1").attr('disabled', true);
//                    $(".ex3").attr('disabled', true);
//                    $(".foc").attr('disabled', true);
//                    $('.itemSubCategory').attr('disabled', true);
//                    $('.itemName').attr('disabled', true);
//                    $('.itemCode').attr('disabled', true);
//                    $('.itemDesc').attr('disabled', true);
//                    $('.itemCategory').attr('disabled', true);
//                    $('.discount').attr('disabled', true);
//                    $('.oQty').attr('disabled', true);
//                    $('.unitPrice').attr('disabled', true);
//                    $('.recdQty').attr('disabled', true);
//                    $(".ex1").val('');
//                    $(".ex2").val('');
//                    $('.uom').prop('disabled', true);
//                }
                for (var i = 0; i < aa.elements.length; i++) {
                    alert(aa.elements[i].checked);
                    aa.elements[i].checked = checked;
                }

            }

//            checked = false;
//            function checkAll($this) {
////                var $itemRow = $($this).closest('tr');
//
//                $('.item-row').each(function () {
//
//                    var $itemRow = $(this).closest('tr');
//                    var itemSupp = $itemRow.find('#itemSupp').val();
//                    var supplierName = $itemRow.find('#supplierName').val();
//                    var itemName = $itemRow.find('#itemName').val();
//                    var itemCode = $itemRow.find('#itemCode').val();
//                    var supplierCode1 = $itemRow.find('#supplierCode1').val();
//
//
//
//
//
//                    if (itemSupp === supplierCode1) {
//                        if (checked === false) {
//                            checked = true;
//                            $itemRow.find(".ex2").attr('disabled', false);
//                            $itemRow.find(".ex1").attr('disabled', false);
//                            $itemRow.find(".ex3").attr('disabled', false);
//                            $itemRow.find(".foc").attr('disabled', false);
//                            $itemRow.find('.itemSubCategory').attr('disabled', false);
//                            $itemRow.find('.itemName').attr('disabled', false);
//                            $itemRow.find('.itemCode').attr('disabled', false);
//                            $itemRow.find('.itemDesc').attr('disabled', false);
//                            $itemRow.find('.itemCategory').attr('disabled', false);
//                            $itemRow.find('.discount').attr('disabled', false);
//                            $itemRow.find('.oQty').attr('disabled', false);
//                            $itemRow.find('.unitPrice').attr('disabled', false);
//                            $itemRow.find('.recdQty').attr('disabled', false);
//                            $itemRow.find('.uom').attr('disabled', false);
//
//                        } else {
//                            checked = false;
//                            $itemRow.find(".ex2").attr('disabled', true);
//                            $itemRow.find(".ex1").attr('disabled', true);
//                            $itemRow.find(".ex3").attr('disabled', true);
//                            $itemRow.find(".foc").attr('disabled', true);
//                            $itemRow.find('.itemSubCategory').attr('disabled', true);
//                            $itemRow.find('.itemName').attr('disabled', true);
//                            $itemRow.find('.itemCode').attr('disabled', true);
//                            $itemRow.find('.itemDesc').attr('disabled', true);
//                            $itemRow.find('.itemCategory').attr('disabled', true);
//                            $itemRow.find('.discount').attr('disabled', true);
//                            $itemRow.find('.oQty').attr('disabled', true);
//                            $itemRow.find('.unitPrice').attr('disabled', true);
//                            $itemRow.find('.recdQty').attr('disabled', true);
//                            $itemRow.find('.uom').attr('disabled', true);
//                            //                    $(".ex1").val('');
//                            //                    $(".ex2").val('');
//                        }
//                    }
//                    else {
//
//                        $.ajax
//                                ({
//                                    type: "POST",
//                                    url: '../inventory/supplierValidation.htm',
//                                    data: {
//                                        itemCode: itemCode,
//                                        itemSupp: itemSupp
//                                    },
//                                    success: function (data)
//                                    {
//                                        alert(data)
////                                var c = data.split(",");
//                                        if (data == 'Not Available') {
//                                            alert(supplierName + " is not tagged to " + itemCode + ". Please tag to proceed.");
//                                            return false;
//                                        }
//
//                                    }
//                                });
//
//                        checked = false;
//
//
//
//
//                        $itemRow.find('#selectedvalues').prop('checked', true);
//                        $itemRow.find(".ex2").attr('disabled', true);
//                        $itemRow.find(".ex1").attr('disabled', true);
//                        $itemRow.find(".ex3").attr('disabled', true);
//                        $itemRow.find(".foc").attr('disabled', true);
//                        $itemRow.find('.itemSubCategory').attr('disabled', true);
//                        $itemRow.find('.itemName').attr('disabled', true);
//                        $itemRow.find('.itemCode').attr('disabled', true);
//                        $itemRow.find('.itemDesc').attr('disabled', true);
//                        $itemRow.find('.itemCategory').attr('disabled', true);
//                        $itemRow.find('.discount').attr('disabled', true);
//                        $itemRow.find('.oQty').attr('disabled', true);
//                        $itemRow.find('.unitPrice').attr('disabled', true);
//                        $itemRow.find('.recdQty').attr('disabled', true);
//                        $itemRow.find('.uom').attr('disabled', true);
//
//
//                    }
//
//                });
//
//
//
//
//
//
//                var aa = document.getElementById('imForm');
//                // alert('test');
//
//                for (var i = 0; i < aa.elements.length; i++) {
//                    aa.elements[i].checked = checked;
//                }
//
//
//            }

            function checkBoxValid(val)
            {
                if (document.getElementById("doNo").value == "")
                {
                    alert("Enter Invoice Number");
                    return false;
                }
                else if (document.getElementById("doDate").value == "")
                {
                    alert("Enter Invoice Date");
                    return false;
                }
                else if ($("#selectedvalues:checked").length === 0) {
                    alert("Please select checkbox...!!")
                    return false;

                }
//                else if (document.getElementById("batchNo").value == "")
//                {
//                    alert("Enter Batch No");
//                    return false;
//                }
//                else if (document.getElementById("expDate").value == "")
//                {
//                    alert("Enter Exp Date");
//                    return false;
//                } 
                else
                {
                    if (confirm('Do you really want to Save this record')) {
                        return true;
                    } else {
                        return false;
                    }
                    return true;
                }

            }

            function getVal($this, slNo) {

                var x = document.getElementById("itemsTable1").rows.length;
                var $itemRow = $($this).closest('tr');
                var itemSupp = $itemRow.find('#itemSupp').val();
                var supplierName = $itemRow.find('#supplierName').val();
                var itemName = $itemRow.find('#itemName').val();
                var supplierCode1 = $itemRow.find('#supplierCode1').val();
                // alert(itemSupp);
                //alert(supplierCode1);

                if ($itemRow.find('#selectedvalues').is(':checked'))
                {
                    $itemRow.find('#bno').prop('disabled', false);
                    $itemRow.find('#ex1').prop('disabled', false);
                    $itemRow.find('#recevingQty').prop('disabled', false);
                    $itemRow.find('#foc').prop('disabled', false);
                    $itemRow.find('#itemName').prop('disabled', false);
                    $itemRow.find('#itemCode').prop('disabled', false);
                    $itemRow.find('#itemSubCategory').prop('disabled', false);
                    $itemRow.find('#itemDesc').prop('disabled', false);
                    $itemRow.find('#itemCategory').prop('disabled', false);
                    $itemRow.find('#discount').prop('disabled', false);
                    $itemRow.find('#oQty').prop('disabled', false);
                    $itemRow.find('#unitPrice' + slNo).prop('disabled', false);
                    $itemRow.find('#recdQty').prop('disabled', false);
                    $itemRow.find('#uom').prop('disabled', false);
                    $itemRow.find('#orderUomConversion').prop('disabled', false);
                }
                else
                {

                    $itemRow.find('#bno').prop('disabled', true);
                    $itemRow.find('#ex1').prop('disabled', true);
                    $itemRow.find('#recevingQty').prop('disabled', true);
                    $itemRow.find('#foc').prop('disabled', true);
                    $itemRow.find('#itemName').prop('disabled', true);
                    $itemRow.find('#itemCode').prop('disabled', true);
                    $itemRow.find('#itemSubCategory').prop('disabled', true);
                    $itemRow.find('#itemDesc').prop('disabled', true);
                    $itemRow.find('#itemCategory').prop('disabled', true);
                    $itemRow.find('#discount').prop('disabled', true);
                    $itemRow.find('#oQty').prop('disabled', true);
                    $itemRow.find('#unitPrice' + slNo).prop('disabled', true);
                    $itemRow.find('#recdQty').prop('disabled', true);
                    $itemRow.find('#uom').prop('disabled', true);
                    $itemRow.find('#orderUomConversion').prop('disabled', true);
                }
//                } else {
//                    // alert(supplierName + " is not tagged to " + itemName + ". Please tag to proceed.");
//                    $itemRow.find('#bno').prop('disabled', false);
//                    $itemRow.find('#ex1').prop('disabled', false);
//                    $itemRow.find('#recevingQty').prop('disabled', false);
//                    $itemRow.find('#foc').prop('disabled', false);
//                    $itemRow.find('#itemName').prop('disabled', true);
//                    $itemRow.find('#itemCode').prop('disabled', true);
//                    $itemRow.find('#itemSubCategory').prop('disabled', true);
//                    $itemRow.find('#itemDesc').prop('disabled', true);
//                    $itemRow.find('#itemCategory').prop('disabled', true);
//                    $itemRow.find('#discount').prop('disabled', true);
//                    $itemRow.find('#oQty').prop('disabled', true);
//                    $itemRow.find('#unitPrice' + slNo).prop('disabled', true);
//                    $itemRow.find('#recdQty').prop('disabled', true);
//                    $itemRow.find('#uom').prop('disabled', false);
//                    $itemRow.find('#orderUomConversion').prop('disabled', true);
//                }

            }

            function getDate($this) {

                var x = document.getElementById("itemsTable1").rows.length;
                var $itemRow = $($this).closest('tr');
                var ex1 = $itemRow.find("#ex1").val();
                var ex2 = dateconvert(ex1);
                //              
                var exp = moment(ex2).format("YYYY-MM-DD");
                var today = moment(Date()).format("YYYY-MM-DD");


                var dateformat = /^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/;

                if (!ex1.match(dateformat))
                {
                    alert("You have entered an invalid date!");
                    $itemRow.find("#ex1").val("");
                    return false;
                }
                else if (exp < today) {

                    alert("Date already expired");
                    $itemRow.find("#ex1").val("");
                }

            }


            function getDate1() {

                var doDate = document.getElementById('doDate').value;
                var ex2 = dateconvert(doDate);
                //              
                var exp = moment(ex2).format("YYYY-MM-DD");
                var today = moment(Date()).format("YYYY-MM-DD");
                //               var today = document.getElementById("today").value;
                var dateformat = /^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/;

                if (!doDate.match(dateformat))
                {
                    alert("You have entered an invalid date!");
                    $('#doDate').val("");
                    return false;
                }

                else if (exp > today) {

                    alert("Please enter proper invoice date");
                    $('#doDate').val("");
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

//            function  grnDuplicate() {
//                var recordNo = $('#poNo').val();
//                var deliveryDate = $('#deliveryDate').val();
//
//                $.ajax
//                        ({
//                            type: "POST",
//                            url: '../inventory/receiptDuplicate.htm',
//                            data: {
//                                recordNo: recordNo,
//                                deliveryDate: deliveryDate
//                            },
//                            success: function (data)
//                            {
//                                //                            alert(data)
//                                var c = data.split(",");
//                                var x = moment(c[2]).format('DD-MMM-YY h:mm:ss a');
//                                //                            alert(c[3])
//                                if ($.trim(c[0]) == 'Already Exists.Enter another') {
//                                    alert("PO Received by" + " " + c[1] + " " + "At" + " " + x + " ");
//                                    return false;
//                                }
//
//                            }
//                        });
//
//            }


            function changeUnitPrice($this, c, slNo, suppCode)
            {
                //alert(c)

                var $itemRow = $($this).closest('tr');
                var requisitionUom = $itemRow.find('#uom option:selected').val();
                var unitPrice = $itemRow.find('#OunitPrice' + slNo).val();
                var unit = requisitionUom.split("-");
                var uom = unit[0];
                var uomConver = unit[2];
                //                alert(uomConver);
                var ordUom = $itemRow.find('#orderUom').val();
                //            $itemRow.find('#orderUomConversion').val(uomConver);

                //                alert(ordUom)
                var ordUomConver = "";
                $itemRow.find('#uom option').each(function () {

                    var curUom = $itemRow.find(this).val().split('-');
                    if (ordUom === curUom[0])
                    {

                        ordUomConver = curUom[2];
                        $itemRow.find('#orderUomConversion').val(ordUomConver);
                    }

                });
                //                alert(ordUomConver);
                $.ajax({
                    type: "POST",
                    url: "../inventory/uomWiseUnitPrice.htm",
                    data: {
                        code: c,
                        suppCode: suppCode,
                        uom: uom
                    },
                    success: function (data) {

                        if (ordUom === uom)
                        {
                            $('#unitPrice' + slNo).val(unitPrice);
                        }
                        else {
                            $('#unitPrice' + slNo).val(data);
                        }

                    }

                });



            }
            NProgress.done();


        </script>
        <script src="../assets/general-inventory_script.js" type="text/javascript"></script>
        <script src="../assets/inventory_script.js" type="text/javascript"></script>
    </body>


</html>

