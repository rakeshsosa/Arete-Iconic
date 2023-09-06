<%-- 
    Document   : qualityForm
    Created on : Oct 6, 2016, 11:25:33 AM
    Author     : EBS-SDD15
--%>

<%@page import="java.util.Date"%>
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
        <title>arête Assets Management</title>

        <%
            Date date = new Date();
        %>
        <script type="text/javascript">
            jQuery(document).ready(function () {
                $('#quality').validationEngine();
            });
            function calcQty($this) {
//                var curId = obj.id;
//                var val = curId.charAt(0);
//                var qty1 = parseFloat(document.getElementById(val + "qty").value);
//                var accQty = parseFloat(document.getElementById(val + "qtyAccepted").value);
//                var rejQty = parseFloat(qty1 - accQty);
//                document.getElementById(val + "qtyRejected").value = rejQty;
                var $itemRow = $($this).closest('tr');
                var qty1 = $($itemRow).find('#receivedQty').val();
                var qtyAccepted = $($itemRow).find('#qtyAccepted').val();
                var rejQty = parseFloat(qty1) - parseFloat(qtyAccepted);
                $itemRow.find('#qtyRejected').val(parseFloat(rejQty));
            }

            function isNumberKey1(evt) {
                ;
                if (evt.which != 8 && evt.which != 0 && (evt.which < 48 || evt.which > 57))
                {
                    alert("Please Enter Numeric value");
                    return false;
                }
                return true;
            }

            function isNumberKey4(evt) {
                debugger;
                var charCode = (evt.which) ? evt.which : event.keyCode;

                if (charCode > 32 && (charCode < 48 || charCode > 57) && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122))
                {
                    alert("Special Characters are not allowed");
                    return false;

                    return true;

                }

            }

            function qryVal($this) {

//                var curId1 = obj1.id;
//                var val1 = curId1.charAt(0);
//                var qty1 = parseFloat(document.getElementById(val1 + "qty").value);
//                var accQty = parseFloat(document.getElementById(val1 + "qtyAccepted").value);
//                var recQty = parseFloat(document.getElementById(val1 + "receivedQty").value);
//                if (accQty == '0') {
//                    alert("Invalid Quantity...!");
//                    document.getElementById(val1 + "qtyRejected").value = '';
//                    document.getElementById(val1 + "qtyAccepted").value = '';
//                    return false;
//                } else if (qty1 < accQty) {
//                    document.getElementById(val1 + "qtyAccepted").value = '';
//                    document.getElementById(val1 + "qtyRejected").value = '';
//                    alert("Accepted Quantity Should Be Lessthan Order Quantity");
//                    return false;
//                } else if (recQty < accQty)
//                {
//                    document.getElementById(val1 + "qtyAccepted").value = '';
//                    document.getElementById(val1 + "qtyRejected").value = '';
//                    document.getElementById(val1 + "receivedQty").value = '';
//                    alert("Accepted Quantity Should Be Lessthan Received Quantity");
//                    return false;
//                }
                var $itemRow = $($this).closest('tr');

                var qty1 = $($itemRow).find('#qty').val();
                var recQty = $($itemRow).find('#receivedQty').val();
                var qtyAccepted = $($itemRow).find('#qtyAccepted').val();
                if (qtyAccepted < '0') {
                    alert("Invalid Quantity...!");
                    $itemRow.find('#qtyRejected').val("");
                    $itemRow.find('#qtyAccepted').val("");
                    return false;
                } else if (parseFloat(qty1) < parseFloat(qtyAccepted)) {
                    $itemRow.find('#qtyRejected').val("");
                    $itemRow.find('#qtyAccepted').val("");
                    alert("Accepted Quantity Should Be Lessthan Order Quantity");
                    return false;
                } else if (parseFloat(recQty) < parseFloat(qtyAccepted))
                {
                    $itemRow.find('#qtyRejected').val("");
                    $itemRow.find('#qtyAccepted').val("");
                    $itemRow.find('#receivedQty').val("");
                    alert("Accepted Quantity Should Be Lessthan Received Quantity");
                    return false;
                }

                calcQty($this);
            }
            function valRecQty($this) {

                var $itemRow = $($this).closest('tr');
                //$itemRow.find('#receivedQty').val("");
                // var availQty1 = $($itemRow).find('#qtyAccepted').val();
                // var curId1 = obj1.id;
                // var val1 = curId1.charAt(0);
//                var qty1 = parseFloat(document.getElementById(val1 + "qty").value);
//                var recQty = parseFloat(document.getElementById(val1 + "receivedQty").value);
//                var qtyAccepted = parseFloat(document.getElementById(val1 + "qtyAccepted").value);
                var qty1 = $($itemRow).find('#qty').val();
                var recQty = $($itemRow).find('#receivedQty').val();
                var qtyAccepted = $($itemRow).find('#qtyAccepted').val();

                if (recQty < '0') {
                    alert("Invalid Quantity...!");
                    $itemRow.find('#qtyRejected').val("");
                    $itemRow.find('#qtyAccepted').val("");
                    $itemRow.find('#receivedQty').val("");
                    return false;
                }
                else {
                    if (parseFloat(qty1) < parseFloat(recQty)) {
                        $itemRow.find('#qtyRejected').val("");
                        $itemRow.find('#qtyAccepted').val("");
                        $itemRow.find('#receivedQty').val("");
                        alert("Received Quantity Should Be Lessthan Order Quantity");
                        return false;
                    } else {
                        if (parseFloat(recQty) < parseFloat(qtyAccepted))
                        {
                            $itemRow.find('#qtyRejected').val("");
                            $itemRow.find('#qtyAccepted').val("");
                            $itemRow.find('#receivedQty').val("");
                            alert("Accepted Quantity Should Be Lessthan Received Quantity");
                            return false;
                        }
                    }
                }
//                if (recQty == '0') {
//                    alert("Invalid Quantity...!");
//                    document.getElementById(val1 + "qtyRejected").value = '';
//                    document.getElementById(val1 + "qtyAccepted").value = '';
//                    document.getElementById(val1 + "receivedQty").value = '';
//                    return false;
//                }
//                else {
//                    if (qty1 < recQty) {
//                        document.getElementById(val1 + "qtyAccepted").value = '';
//                        document.getElementById(val1 + "qtyRejected").value = '';
//                        document.getElementById(val1 + "receivedQty").value = '';
//                        alert("Received Quantity Should Be Lessthan Order Quantity");
//                        return false;
//                    } else {
//                        if (recQty < qtyAccepted)
//                        {
//                            document.getElementById(val1 + "qtyAccepted").value = '';
//                            document.getElementById(val1 + "qtyRejected").value = '';
//                            document.getElementById(val1 + "receivedQty").value = '';
//                            alert("Accepted Quantity Should Be Lessthan Received Quantity");
//                            return false;
//                        }
//                    }
//                }
            }
            function validateExpiryDate($this, sno) {
//                var curId1 = obj1.id;
//                var val1 = curId1.charAt(0);
//                var expireDate = document.getElementById(val1 + "expiryDate").value;
//                if (expireDate == '') {
//                    alert("Please enter Expiry Date");
//                    document.getElementById(val1 + "warrantyPeriod").value = "";
//                }
                var $itemRow = $($this).closest('tr');
                var expireDate = $($itemRow).find('#expiryDate' + sno).val();
                if (expireDate == '') {
                    alert("Please enter Expiry Date");
                    $itemRow.find('#warrantyPeriod' + sno).val("");
                }
            }

            function datevalid($this, sno) {

                NewCssCal('expiryDate' + sno, 'ddMMMyyyy', '', '', '', '', 'future');

            }

            function mandatoryFilds(b)
            {

                var x = document.getElementById("batchNo").value &&
                        document.getElementById("customerInvoiceNo").value &&
//                        document.getElementById("qtyAccepted").value &&
                        document.getElementById("inventoryLocation").value;

                if (x == '')
                {

                    alert("Please Fill Mandatory Fields .");
                    $('#batchNo').focus();
                    $('#customerInvoiceNo').focus();
                    $('#inventoryLocation').focus();

                    return false;
                }

                else {
                    b.disabled = true;
                    b.value = 'Submitting';
                    b.form.submit();
                    return true;
//                    document.forms["quality"].submit();
                }
            }
            function fetchbatchNo() {
                var batchNo = document.getElementById("batchNo").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../quality/fetchbatchNo.htm',
                            data: {
                                batchNo: batchNo
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("batchNo").value = "";
                                    return false;
                                }
                            }
                        });
            }
            function fetchInvoice() {
                var customerInvoiceNo = document.getElementById("customerInvoiceNo").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../quality/fetchInvoice.htm',
                            data: {
                                customerInvoiceNo: customerInvoiceNo
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("customerInvoiceNo").value = "";
                                    return false;
                                }
                            }
                        });
            }

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

        </script>


    </head>


    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <div class="clearfix"></div>
                        <div class="col-md-6 col-xs-12">
                            <div class="x_panel">
                                <jsp:include page="../login/headerlink.htm?submodule=Quality&tab=Quality&pagetype=form"/>
                                <div class="x_title">
                                    <h2>Quality Form</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />
                                    <form class="form-inline" id="quality" action="../quality/qualityFormSubmit.htm"  method="post" enctype="multipart/form-data">
                                        <c:forEach items="${test}" var="list">
                                            <c:if test="${list[0] eq '381'}">
                                                <c:set value="${list[1]}" var="field_1"/>
                                                <c:set value="${list[2]}" var="fieldStatus_1"/>
                                                <c:set value="${list[3]}" var="mand_status_1"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '382'}">
                                                <c:set value="${list[1]}" var="field_2"/>
                                                <c:set value="${list[2]}" var="fieldStatus_2"/>
                                                <c:set value="${list[3]}" var="mand_status_2"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '383'}">
                                                <c:set value="${list[1]}" var="field_3"/>
                                                <c:set value="${list[2]}" var="fieldStatus_3"/>
                                                <c:set value="${list[3]}" var="mand_status_3"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '384'}">
                                                <c:set value="${list[1]}" var="field_4"/>
                                                <c:set value="${list[2]}" var="fieldStatus_4"/>
                                                <c:set value="${list[3]}" var="mand_status_4"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '385'}">
                                                <c:set value="${list[1]}" var="field_5"/>
                                                <c:set value="${list[2]}" var="fieldStatus_5"/>
                                                <c:set value="${list[3]}" var="mand_status_5"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '386'}">
                                                <c:set value="${list[1]}" var="field_6"/>
                                                <c:set value="${list[2]}" var="fieldStatus_6"/>
                                                <c:set value="${list[3]}" var="mand_status_6"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '387'}">
                                                <c:set value="${list[1]}" var="field_7"/>
                                                <c:set value="${list[2]}" var="fieldStatus_7"/>
                                                <c:set value="${list[3]}" var="mand_status_7"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '388'}">
                                                <c:set value="${list[1]}" var="field_8"/>
                                                <c:set value="${list[2]}" var="fieldStatus_8"/>
                                                <c:set value="${list[3]}" var="mand_status_8"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '389'}">
                                                <c:set value="${list[1]}" var="field_9"/>
                                                <c:set value="${list[2]}" var="fieldStatus_9"/>
                                                <c:set value="${list[3]}" var="mand_status_9"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '390'}">
                                                <c:set value="${list[1]}" var="field_10"/>
                                                <c:set value="${list[2]}" var="fieldStatus_10"/>
                                                <c:set value="${list[3]}" var="mand_status_10"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '391'}">
                                                <c:set value="${list[1]}" var="field_11"/>
                                                <c:set value="${list[2]}" var="fieldStatus_11"/>
                                                <c:set value="${list[3]}" var="mand_status_11"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '392'}">
                                                <c:set value="${list[1]}" var="field_12"/>
                                                <c:set value="${list[2]}" var="fieldStatus_12"/>
                                                <c:set value="${list[3]}" var="mand_status_12"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '393'}">
                                                <c:set value="${list[1]}" var="field_13"/>
                                                <c:set value="${list[2]}" var="fieldStatus_13"/>
                                                <c:set value="${list[3]}" var="mand_status_13"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '394'}">
                                                <c:set value="${list[1]}" var="field_14"/>
                                                <c:set value="${list[2]}" var="fieldStatus_14"/>
                                                <c:set value="${list[3]}" var="mand_status_14"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '395'}">
                                                <c:set value="${list[1]}" var="field_15"/>
                                                <c:set value="${list[2]}" var="fieldStatus_15"/>
                                                <c:set value="${list[3]}" var="mand_status_15"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '396'}">
                                                <c:set value="${list[1]}" var="field_16"/>
                                                <c:set value="${list[2]}" var="fieldStatus_16"/>
                                                <c:set value="${list[3]}" var="mand_status_16"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '397'}">
                                                <c:set value="${list[1]}" var="field_17"/>
                                                <c:set value="${list[2]}" var="fieldStatus_17"/>
                                                <c:set value="${list[3]}" var="mand_status_17"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '398'}">
                                                <c:set value="${list[1]}" var="field_18"/>
                                                <c:set value="${list[2]}" var="fieldStatus_18"/>
                                                <c:set value="${list[3]}" var="mand_status_18"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '399'}">
                                                <c:set value="${list[1]}" var="field_19"/>
                                                <c:set value="${list[2]}" var="fieldStatus_19"/>
                                                <c:set value="${list[3]}" var="mand_status_19"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '400'}">
                                                <c:set value="${list[1]}" var="field_20"/>
                                                <c:set value="${list[2]}" var="fieldStatus_20"/>
                                                <c:set value="${list[3]}" var="mand_status_20"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '401'}">
                                                <c:set value="${list[1]}" var="field_21"/>
                                                <c:set value="${list[2]}" var="fieldStatus_21"/>
                                                <c:set value="${list[3]}" var="mand_status_21"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '402'}">
                                                <c:set value="${list[1]}" var="field_22"/>
                                                <c:set value="${list[2]}" var="fieldStatus_22"/>
                                                <c:set value="${list[3]}" var="mand_status_22"/>
                                            </c:if>


                                        </c:forEach> 

                                        <c:set var="j" value="0"/>
                                        <c:forEach items="${poFormList1}" var="list">
                                            <c:forEach items="${supp}" var="type">
                                                <c:if test="${type.supplierCode eq list.supplierName}">
                                                    <c:set var="supplierCode" value="${type.supplierCode}"/>
                                                    <c:set var="supplierName" value="${type.supplierName}"/>
                                                    <c:set var="supplierAddress" value="${type.supplierAddress}"/>
                                                    <c:set var="supplierContactNo" value="${type.supplierContNum}"/>
                                                    <c:set var="supplierMailId" value="${type.mailId}"/>
                                                </c:if>                                   
                                            </c:forEach>
                                            <c:if test="${j eq 0}">
                                                <c:set var="j" value="1"/>

                                                <c:set var="poNo" value="${list.poNo}"/>
                                                <c:set var="user" value="${list.userId}"/>
                                            </c:if>
                                        </c:forEach>




                                        <div class="col-md-4  form-inline">
                                            <!--                                        <div class="input-group">-->
                                            <div class="col-md-5  form-inline"> 
                                                <label class="control-label">  PO No:</label></div>
                                            <div class="col-md-5  form-inline"> <span id="dynamicdiv" style="display: inline">${poNo}</span>
                                                <input name="poNo" id="poNo" value="${poNo}" type="hidden">
                                                <input name="qualityStatus" id="qualityStatus" value="" type="hidden">
                                            </div>
                                            <p>&nbsp;</p>  
                                            <div class="col-md-5  form-inline"> <label class="control-label">Supplier Name:</label></div> 
                                            <div class="col-md-5  form-inline"> ${supplierName}
                                                <input class="form-control" name="supplierName" readonly="" type="hidden" value="${supplierCode}" maxlength="80">
                                            </div>
                                            <p>&nbsp;</p>   

                                            <div class="col-md-5  form-inline"> 
                                                <label class="control-label">Supplier Address:</label> </div>  
                                            <div class="col-md-5  form-inline"> ${supplierAddress}
                                                <input class="form-control" name="supplierAddress" readonly="" type="hidden" value="${supplierAddress}" maxlength="80">
                                            </div>
                                            <p>&nbsp;</p>   <p>&nbsp;</p>  



                                            <div class="col-md-5  form-inline">  <label class="control-label">Supplier Contact No:</label></div> 
                                            <div class="col-md-5  form-inline"> ${supplierContactNo}
                                                <input class="form-control" name="supplierCntNo" readonly="" type="hidden" value="${supplierContactNo}" maxlength="80">

                                            </div>

                                            <p>&nbsp;</p>  
                                            <div class="col-md-5 col-sm-6 col-xs-6 form-inline">   
                                                <label class="control-label">Supplier Email Id:</label></div> 
                                            <div class="col-md-5  form-inline"> ${supplierMailId}
                                                <input class="form-control" name="supplierMailId" readonly="" type="hidden" value="${supplierMailId}" maxlength="80">
                                            </div>


                                            <p>&nbsp;</p>  
                                            <div class="col-md-5  form-inline">   <label class="control-label">Supplier Invoice Date:</label></div> <div class="col-md-5 col-sm-6 col-xs-6 form-inline"> <fmt:formatDate pattern="dd-MMM-yyyy" value="<%=date%>" />
                                                <input name="customerInvoiceDate" type="hidden" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="<%=date%>" />" tabindex="-1"/>
                                            </div>
                                            <p>&nbsp;</p>  
                                            <div class="col-md-5 form-inline"> <label class="control-label">QA Date:</label></div> <div class="col-md-5 col-sm-6 col-xs-6 form-inline"> <fmt:formatDate pattern="dd-MMM-yyyy" value="<%=date%>" />
                                                <input name="qaDate" type="hidden" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="<%=date%>" />" tabindex="-1"/>
                                            </div>
                                        </div>


                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>

                                        <div class="col-md-4 col-sm-6 col-xs-6" style="float:right">

                                            <c:if test="${fieldStatus_19 eq 'y'}">
                                                <div class="form-inline">
                                                    <c:if test="${mand_status_19 eq 'required'}">
                                                        <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                    </c:if>
                                                    <label class="control-label" style="">${field_19}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(accessoryDetails) > 0}">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_19} readonly="" id="batchNo" name="batchNo" value="${batchNo}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="batchNo" value="${batchNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" placeholder=""  class="form-control" ${mand_status_19} id="batchNo" name="batchNo" maxlength="40" value="" onchange="fetchbatchNo();">
                                                        </c:otherwise>        
                                                    </c:choose>
                                                </div>
                                            </c:if>
                                            <p>&nbsp;</p>

                                            <c:if test="${fieldStatus_2 eq 'y'}">
                                                <div class="form-inline">
                                                    <c:if test="${mand_status_2 eq 'required'}">
                                                        <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_2}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(accessoryDetails) > 0}">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_2} readonly="" id="qaBy" name="qaBy" value="${qaBy}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="qaBy" value="${qaBy}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" placeholder=""  class="form-control" ${mand_status_2} id="qaBy" name="qaBy" maxlength="60" value="${user}" readonly="" >
                                                        </c:otherwise>        
                                                    </c:choose>
                                                </div>
                                            </c:if>
                                            <p>&nbsp;</p>
                                            <c:if test="${fieldStatus_3 eq 'y'}">
                                                <div class="form-inline">
                                                    <c:if test="${mand_status_3 eq 'required'}">
                                                        <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_3}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(accessoryDetails) > 0}">
                                                            <c:choose>
                                                                <c:when test="${fn:length(accessoryDetails) > 0}">
                                                                    <input type="text" class="form-control" readonly="" id="customerInvoiceNo" name="customerInvoiceNo" value="${customerInvoiceNo}">
                                                                </c:when>
                                                                <c:otherwise>                                                    
                                                                    <input type="text" placeholder="" class="form-control" ${mand_status_3} id="customerInvoiceNo" readonly="" name="customerInvoiceNo"  maxlength="60" value="" >
                                                                </c:otherwise>        
                                                            </c:choose>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" placeholder=""  class="form-control" ${mand_status_3} id="customerInvoiceNo" name="customerInvoiceNo" maxlength="60" value="" onchange="fetchInvoice();">
                                                        </c:otherwise>        
                                                    </c:choose>
                                                </div>
                                            </c:if>
                                            <p>&nbsp;</p>
                                            <c:if test="${fieldStatus_9 eq 'y'}">
                                                <div class="form-inline">
                                                    <c:if test="${mand_status_9 eq 'required'}">
                                                        <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_9}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(accessoryDetails) > 0}">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_9} readonly="" id="inventoryLocation" name="inventoryLocation" value="${inventoryLocation}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="inventoryLocation" value="${inventoryLocation}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" placeholder=""  class="form-control" ${mand_status_9} id="inventoryLocation" name="inventoryLocation" maxlength="40" value="" >
                                                        </c:otherwise>        
                                                    </c:choose>
                                                </div>
                                            </c:if>
                                            <p>&nbsp;</p>

                                            <div class="clearfix"></div>
                                        </div>

                                        <p>&nbsp;</p>
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <div class="x_panel" style="overflow:scroll">

                                                <div class="x_content">



                                                    <table class="table table-striped responsive-utilities jambo_table bulk_action" id="">
                                                        <thead>
                                                            <tr class="headings">


                                                                <th class="column-title">Accessory Code</th>
                                                                <th class="column-title">Accessory Name</th>
                                                                <th class="column-title">UOM</th>
                                                                <th class="column-title" style="display: none;"><a style="color:red;">*</a>Unit Price</th>
                                                                <th class="column-title" style="display: none;"><a style="color:red;">*</a>Total Price</th>
                                                                <th class="column-title">Order Qty</th>
                                                                <th class="column-title"><a style="color:red;">*</a>Received Qty</th>
                                                                <th class="column-title"><a style="color:red;">*</a>Qty Accepted</th>
                                                                <th class="column-title">Qty Rejected</th>
                                                                <!--    <th class="column-title">Batch No</th>-->
                                                                <th class="column-title"><a style="color:red;">*</a>FOC</th>
                                                                <th class="column-title"><a style="color:red;">*</a>Expiry Date</th>
                                                                <th class="column-title"><a style="color:red;">*</a>Warranty Period</th>

                                                            </tr>
                                                        </thead>

                                                        <tbody>


                                                            <c:forEach items="${poFormList1}" var="type">
                                                                <c:forEach items="${item}" var="list">
                                                                    <c:if test="${list.itemCode eq type.itemCode}">
                                                                        <c:set var="code" value="${list.itemCode}"></c:set>
                                                                        <c:set var="name" value="${list.itemName}"></c:set>
                                                                        <c:set var="itmDesc" value="${list.itemDesc}"></c:set>
                                                                        <c:forEach items="${itemCat}" var="cat">
                                                                            <c:if test="${cat.categoryId eq list.itemCategory}">
                                                                                <c:set var="itmCat" value="${cat.itemCategory}"></c:set>  
                                                                            </c:if>
                                                                        </c:forEach>                                                                                                                                                           
                                                                        <c:set var="itmCod" value="${list.itemCode}"></c:set>
                                                                        <c:forEach items="${uom}" var="uom">
                                                                            <c:if test="${uom.uomId eq list.itemUom}">
                                                                                <c:set var="uomName" value="${uom.uomName}"></c:set> 
                                                                            </c:if>
                                                                        </c:forEach>

                                                                    </c:if>
                                                                </c:forEach>

                                                                <c:set var="j" value="${j+1}"/>
                                                                <c:set var="qty" value="${type.qty}"/>
                                                                <c:set var="price" value="${type.price}"/>
                                                                <c:set var="totalPrice" value="${type.totalPrice}"/>  

                                                                <tr class="even pointer">

                                                                    <td>
                                                                        <input class="form-control " style="text-align: left;" readonly="" name="itemCode" id="itemCode" value="${code}" type="text">
                                                                    </td>
                                                                    <td>
                                                                        <input class="form-control " style="text-align: left;" readonly="" name="itemName" id="itemName" value="${name}" type="text">
                                                                    </td>
                                                                    <td>
                                                                        <input class="form-control " style="text-align: left;" readonly="" name="uom" id="uom" value="${uomName}" type="text">
                                                                    </td>
                                                                    <td style="display: none;">${price}
                                                                        <input class="form-control " style="text-align: left;" name="unitPrice" id="unitPrice" value="${price}" type="hidden">
                                                                    </td>
                                                                    <td style="display: none;" >${totalPrice}
                                                                        <input class="form-control " style="text-align: left;" name="totalPrice" id="totalPrice" value="<fmt:formatNumber pattern="#.###" value="${totalPrice}"/>" type="hidden">
                                                                    </td>

                                                                    <td >
                                                                        <input class="form-control " style="text-align: right;" readonly="" name="orderedQty" id="qty" value="${qty}" type="text">
                                                                    </td>
                                                                    <td >
                                                                        <input class="form-control " style="text-align: right;" required name="receivedQty" id="receivedQty" value="" onkeypress="return checkdigit(event, this, 10, 0);" onchange="return valRecQty(this);" type="text">
                                                                    </td>
                                                                    <td>
                                                                        <input class="form-control " style="text-align: right;" required name="qtyAccepted" id="qtyAccepted" value="" type="text" onkeypress="return checkdigit(event, this, 10, 0);" onchange="return qryVal(this);">
                                                                    </td>
                                                                    <td>
                                                                        <input class="form-control " style="text-align: right;" required name="qtyRejected" id="qtyRejected" value="" type="" readonly="">
                                                                    </td>
                                                                    <!--                                                            <td>
                                                                                                                                    <input style="width: 100%;" name="batchNo" id="batchNo" value="" type="">
                                                                                                                                </td>-->
                                                                    <td>
                                                                        <input class="form-control " style="text-align: right;" required name="foc" id="foc" value="" type="text" onkeypress="return checkdigit(event, this, 10, 2);">
                                                                    </td>

                                                                    <td>
                                                                        <input class="form-control validate[required]" required style="text-align: left;" id="expiryDate${type.sno}" placeholder="Select Date" readonly="" type="text" name="expiryDate" onclick="return datevalid(this,${type.sno});">   

                                                                    </td>
                                                                    <td>
                                                                        <input class="form-control " style="text-align: right;" name="warrantyPeriod" required id="warrantyPeriod${type.sno}" value="" type="" oninput="return validateExpiryDate(this,${type.sno});" onkeypress="return checkdigit(event, this, 3, 0);">                                                 
                                                                    </td>
                                                                </tr>

                                                            </c:forEach>

                                                        </tbody>

                                                    </table>
                                                </div>
                                            </div>
                                        </div>

                                        <br>
                                        <div>
                                            <c:if test="${action ne 'view'}">


                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                                    <label class="control-label" style="margin-top:-20px;">Remarks
                                                    </label>
                                                    <textarea class="form-control" rows="1" style="resize: none" maxlength="200" value="" autocomplete="off" placeholder="" name="remarks" id="remarks" type="text"></textarea>
                                                </div>

                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                    <input id="saveInvoiceBtn" class="btn btn-primary" name="saveInvoice" value="Save" type="submit" onclick="mandatoryFilds(this);">
                                                    <a href="../quality/qualityList.htm" class="btn btn-danger">Cancel</a>
                                                </div>

                                            </c:if>
                                        </div>
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

        <script>
            NProgress.done();
        </script>
        <script src="../CRM/scripts/general-menu-scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/general-sales_scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/mioinvoice-menu-scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/mioinvoice-sales-scripts.js" type="text/javascript"></script>
    </body>

</html>
