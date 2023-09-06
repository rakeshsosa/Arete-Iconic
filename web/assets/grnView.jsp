<%-- 
    Document   : assetDetailsForm
    Created on : Sep 15, 2016, 10:42:18 AM
    Author     : Kondal Reddy N
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
            $(document).ready(function () {
                $("input").on("keypress", function (e) {

                    if (e.which === 32 && !this.value.length)
                        e.preventDefault();
                });

            });

            // function  to autocalculate the Grand Total
            function sumOfTotalCalculate() {

                var grandTotalHidden = document.getElementById('grandTotalHidden').value;
                var discount = document.getElementById('discount').value;
                var grandTotal = document.getElementById('grandTotal').value;
                if (discount > 100) {
                    alert('Discount can not be more than 100');
                    document.getElementById('discount').value = '';

                    return false;
                }
                var discountValue = (grandTotalHidden * discount) / 100;
                var newGrandTotal = (grandTotalHidden - discountValue).toFixed(2);

                document.getElementById('grandTotal').value = newGrandTotal;
                return false;

            }



            // Added by Garun to check the Received date should be greater that Invoice date.     
            function RecievedDatevalidate() {
                var receiveDate = document.getElementById('grnDate').value;
                var customerInvoiceDate = document.getElementById('customerInvoiceDate').value;
                var receiveDateSplit = receiveDate.split("-");
                var customerInvoiceDateSplit = customerInvoiceDate.split("-");
                var recDate = new Date(receiveDateSplit[1] + '/' + receiveDateSplit[0] + '/' + receiveDateSplit[2]);
                var invoiceDate = new Date(customerInvoiceDateSplit[1] + '/' + customerInvoiceDateSplit[0] + '/' + customerInvoiceDateSplit[2]);
                var recDateNumberOfDays = Math.ceil(recDate.getTime() / (1000 * 3600 * 24));
                var invoiceDateNumberOfDays = Math.ceil(invoiceDate.getTime() / (1000 * 3600 * 24));
                if (invoiceDateNumberOfDays > recDateNumberOfDays) {
                    //                         alert('Receive Date should not be greater than Customer Invoice date');
                    alert('Receive Date should be greater than Invoice date');
                    document.getElementById('grnDate').value = '';
                    return false;
                }
                return true;
            }


            function isNumberKey3(evt) {
                debugger;
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if (charCode > 32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122) && charCode > 31 && (charCode < 48 || charCode > 57))
                {
                    //                    alert("Please Enter Only Alphanumerics");
                    return false;
                }
                return true;
            }
            function isNumberKey(evt)
            {
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                {
                    //                    alert("Please Enter Numeric value");
                    return false;
                }
                return true;
            }
            function isNumberKey4(evt) {
                debugger;
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if (charCode > 32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122))
                {
                    //                    alert("Please Enter Only Alphabets");
                    return false;
                }
                return true;
            }
            function mandatoryFields() {
                var x = document.getElementById("grnDate").value;

                //                var x = document.getElementById("grnDate").value &&
                //                        document.getElementById("grnDate").value &&
                //                        document.getElementById("inventoryLocation").value;

                if (x == '')
                {

                    alert("Please Fill Mandatory Fields .");
                    $('#grnDate').focus();
                    window.opener.document.getElementById('saveInvoiceBtn').disabled = true;
                    return false;
                }

                else {
                    document.forms["grnForm"].submit();
                }

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
                                <jsp:include page="../login/headerlink.htm?submodule=GRN&tab=GRN&pagetype=form"/>
                                <div class="x_title">
                                    <h2>GRN Details</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />
                                    <form class="form-inline" id="grnForm" action="../quality/grnFormSubmit.htm"  method="post" enctype="multipart/form-data">
                                        <c:forEach items="${test}" var="list">
                                            <c:if test="${list[0] eq '309'}">
                                                <c:set value="${list[1]}" var="field_1"/>
                                                <c:set value="${list[2]}" var="fieldStatus_1"/>
                                                <c:set value="${list[3]}" var="mand_status_1"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '310'}">
                                                <c:set value="${list[1]}" var="field_2"/>
                                                <c:set value="${list[2]}" var="fieldStatus_2"/>
                                                <c:set value="${list[3]}" var="mand_status_2"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '311'}">
                                                <c:set value="${list[1]}" var="field_3"/>
                                                <c:set value="${list[2]}" var="fieldStatus_3"/>
                                                <c:set value="${list[3]}" var="mand_status_3"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '312'}">
                                                <c:set value="${list[1]}" var="field_4"/>
                                                <c:set value="${list[2]}" var="fieldStatus_4"/>
                                                <c:set value="${list[3]}" var="mand_status_4"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '313'}">
                                                <c:set value="${list[1]}" var="field_5"/>
                                                <c:set value="${list[2]}" var="fieldStatus_5"/>
                                                <c:set value="${list[3]}" var="mand_status_5"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '314'}">
                                                <c:set value="${list[1]}" var="field_6"/>
                                                <c:set value="${list[2]}" var="fieldStatus_6"/>
                                                <c:set value="${list[3]}" var="mand_status_6"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '315'}">
                                                <c:set value="${list[1]}" var="field_7"/>
                                                <c:set value="${list[2]}" var="fieldStatus_7"/>
                                                <c:set value="${list[3]}" var="mand_status_7"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '316'}">
                                                <c:set value="${list[1]}" var="field_8"/>
                                                <c:set value="${list[2]}" var="fieldStatus_8"/>
                                                <c:set value="${list[3]}" var="mand_status_8"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '317'}">
                                                <c:set value="${list[1]}" var="field_9"/>
                                                <c:set value="${list[2]}" var="fieldStatus_9"/>
                                                <c:set value="${list[3]}" var="mand_status_9"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '318'}">
                                                <c:set value="${list[1]}" var="field_10"/>
                                                <c:set value="${list[2]}" var="fieldStatus_10"/>
                                                <c:set value="${list[3]}" var="mand_status_10"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '319'}">
                                                <c:set value="${list[1]}" var="field_11"/>
                                                <c:set value="${list[2]}" var="fieldStatus_11"/>
                                                <c:set value="${list[3]}" var="mand_status_11"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '321'}">
                                                <c:set value="${list[1]}" var="field_12"/>
                                                <c:set value="${list[2]}" var="fieldStatus_12"/>
                                                <c:set value="${list[3]}" var="mand_status_12"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '322'}">
                                                <c:set value="${list[1]}" var="field_13"/>
                                                <c:set value="${list[2]}" var="fieldStatus_13"/>
                                                <c:set value="${list[3]}" var="mand_status_13"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '323'}">
                                                <c:set value="${list[1]}" var="field_14"/>
                                                <c:set value="${list[2]}" var="fieldStatus_14"/>
                                                <c:set value="${list[3]}" var="mand_status_14"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '324'}">
                                                <c:set value="${list[1]}" var="field_15"/>
                                                <c:set value="${list[2]}" var="fieldStatus_15"/>
                                                <c:set value="${list[3]}" var="mand_status_15"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '326'}">
                                                <c:set value="${list[1]}" var="field_16"/>
                                                <c:set value="${list[2]}" var="fieldStatus_16"/>
                                                <c:set value="${list[3]}" var="mand_status_16"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '327'}">
                                                <c:set value="${list[1]}" var="field_17"/>
                                                <c:set value="${list[2]}" var="fieldStatus_17"/>
                                                <c:set value="${list[3]}" var="mand_status_17"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '328'}">
                                                <c:set value="${list[1]}" var="field_18"/>
                                                <c:set value="${list[2]}" var="fieldStatus_18"/>
                                                <c:set value="${list[3]}" var="mand_status_18"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '329'}">
                                                <c:set value="${list[1]}" var="field_19"/>
                                                <c:set value="${list[2]}" var="fieldStatus_19"/>
                                                <c:set value="${list[3]}" var="mand_status_19"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '330'}">
                                                <c:set value="${list[1]}" var="field_20"/>
                                                <c:set value="${list[2]}" var="fieldStatus_20"/>
                                                <c:set value="${list[3]}" var="mand_status_20"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '335'}">
                                                <c:set value="${list[1]}" var="field_22"/>
                                                <c:set value="${list[2]}" var="fieldStatus_22"/>
                                                <c:set value="${list[3]}" var="mand_status_22"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '336'}">
                                                <c:set value="${list[1]}" var="field_23"/>
                                                <c:set value="${list[2]}" var="fieldStatus_23"/>
                                                <c:set value="${list[3]}" var="mand_status_23"/>
                                            </c:if>

                                            <c:if test="${list[0] eq '337'}">
                                                <c:set value="${list[1]}" var="field_24"/>
                                                <c:set value="${list[2]}" var="fieldStatus_24"/>
                                                <c:set value="${list[3]}" var="mand_status_24"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '338'}">
                                                <c:set value="${list[1]}" var="field_25"/>
                                                <c:set value="${list[2]}" var="fieldStatus_25"/>
                                                <c:set value="${list[3]}" var="mand_status_25"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '339'}">
                                                <c:set value="${list[1]}" var="field_26"/>
                                                <c:set value="${list[2]}" var="fieldStatus_26"/>
                                                <c:set value="${list[3]}" var="mand_status_26"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '331'}">
                                                <c:set value="${list[1]}" var="field_27"/>
                                                <c:set value="${list[2]}" var="fieldStatus_27"/>
                                                <c:set value="${list[3]}" var="mand_status_27"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '332'}">
                                                <c:set value="${list[1]}" var="field_28"/>
                                                <c:set value="${list[2]}" var="fieldStatus_28"/>
                                                <c:set value="${list[3]}" var="mand_status_28"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '333'}">
                                                <c:set value="${list[1]}" var="field_29"/>
                                                <c:set value="${list[2]}" var="fieldStatus_29"/>
                                                <c:set value="${list[3]}" var="mand_status_29"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '334'}">
                                                <c:set value="${list[1]}" var="field_30"/>
                                                <c:set value="${list[2]}" var="fieldStatus_30"/>
                                                <c:set value="${list[3]}" var="mand_status_30"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '335'}">
                                                <c:set value="${list[1]}" var="field_31"/>
                                                <c:set value="${list[2]}" var="fieldStatus_31"/>
                                                <c:set value="${list[3]}" var="mand_status_31"/>
                                            </c:if>
                                            <%-- Added by Garun for Discount and Grand Total --%>
                                            <c:if test="${list[0] eq '599'}">
                                                <c:set value="${list[1]}" var="field_32"/>
                                                <c:set value="${list[2]}" var="fieldStatus_32"/>
                                                <c:set value="${list[3]}" var="mand_status_32"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '600'}">
                                                <c:set value="${list[1]}" var="field_33"/>
                                                <c:set value="${list[2]}" var="fieldStatus_33"/>
                                                <c:set value="${list[3]}" var="mand_status_33"/>
                                            </c:if>


                                        </c:forEach> 

                                        <c:set var="j" value="0"/>
                                        <c:forEach items="${grnList}" var="list">
                                            <c:if test="${j eq 0}">
                                                <c:set var="j" value="1"/>
                                                <c:forEach items="${supp}" var="type">
                                                    <c:if test="${type.supplierCode eq list.supplierName}">
                                                        <c:set var="supplierCode" value="${type.supplierCode}"/>
                                                        <c:set var="supplierName" value="${type.supplierName}"/>
                                                        <c:set var="supplierAddress" value="${type.supplierAddress}"/>
                                                        <c:set var="supplierContactNo" value="${type.supplierContNum}"/>
                                                        <c:set var="supplierMailId" value="${type.mailId}"/>
                                                    </c:if>                                   
                                                </c:forEach>
                                                <c:set var="poNo" value="${list.poNo}"/>
                                                <c:set var="customerInvoiceNo" value="${list.customerInvoiceNo}"/>
                                                <c:set var="customerInvoiceDate" value="${list.customerInvoiceDate}"/>
                                                <c:set var="grnDate" value="${list.grnDate}"/>
                                                <c:set var="discount" value="${list.discount}"/>
                                                <c:set var="grandTotal" value="${list.grandTotal}"/>

                                            </c:if>
                                        </c:forEach>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

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
                                            <div class="col-md-5 col-sm-6 col-xs-6 form-inline">   
                                                <label class="control-label">Supplier Invoice No:</label></div> 
                                            <div class="col-md-5  form-inline"> ${customerInvoiceNo}
                                                <input class="form-control" name="customerInvoiceNo" readonly="" type="hidden" value="${customerInvoiceNo}" maxlength="80">
                                            </div>

                                            <p>&nbsp;</p>  
                                            <div class="col-md-5  form-inline">   <label class="control-label">Supplier Invoice Date:</label></div> <div class="col-md-5 col-sm-6 col-xs-6 form-inline"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${customerInvoiceDate}" />
                                                <input name="customerInvoiceDate" id="customerInvoiceDate"type="hidden" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${customerInvoiceDate}" />" tabindex="-1"/>
                                            </div>
                                            <p>&nbsp;</p>  

                                        </div>

                                        <div class="col-md-4 col-sm-6 col-xs-12" style="float:right">



                                            <c:if test="${fieldStatus_2 eq 'y'}">
                                                <div class="col-md-6 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_2 eq 'required'}">
                                                        <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_2}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(accessoryDetails) > 0}">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" readonly="" ${mand_status_2} class="form-control" id="receivedBy" name="receivedBy" value="${receivedBy}" maxlength="20" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="receivedBy" value="${receivedBy}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" readonly=""  ${mand_status_2} class="form-control" id="grnDate" name="grnDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${grnDate}" />" maxlength="20" >
                                                        </c:otherwise>        
                                                    </c:choose>
                                                </div>
                                            </c:if>

                                            <c:if test="${fieldStatus_31 eq 'y'}">
                                                <div class="col-md-6 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_31 eq 'required'}">
                                                        <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_31}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(accessoryDetails) > 0}">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" readonly="" ${mand_status_2} class="form-control" id="receivedBy" name="receivedBy" value="${receivedBy}" maxlength="20" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="receivedBy" value="${receivedBy}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" readonly="" placeholder="Select Date" ${mand_status_31} class="form-control" id="creationDate" name="creationDate" value="" maxlength="20" onclick="javascript:NewCssCal('creationDate', 'ddMMMyyyy', '', '', '', '', '')">
                                                        </c:otherwise>        
                                                    </c:choose>
                                                </div>
                                            </c:if>  
                                            <p>&nbsp;</p>
                                            <c:if test="${fieldStatus_32 eq 'y'}">
                                                <div class="col-md-6 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_32 ne 'required'}">
                                                        <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_32}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(accessoryDetails) > 0}">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text"  ${mand_status_32} class="form-control" id="discount" name="discount" value="" maxlength="20"  onchange="sumOfTotalCalculate();">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="discount" value="${receivedBy}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" ${mand_status_32} class="form-control" readonly="" autocomplete="off" id="discount" name="discount" value="${discount}" maxlength="20" >
                                                        </c:otherwise>        
                                                    </c:choose>
                                                </div>
                                            </c:if>
                                            <p>&nbsp;</p>
                                            <c:if test="${fieldStatus_33 eq 'y'}">
                                                <div class="col-md-6 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_33 eq 'required'}">
                                                        <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_33}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(qualitySumTotal) > 0}">
                                                            <c:forEach items="${qualitySumTotal}" var="list">
                                                                <c:choose> 
                                                                    <c:when test="${action eq 'edit'}"> 
                                                                        <input type="text" ${mand_status_33} class="form-control" id="grandTotal" name="grandTotal" value="${qualitySumTotal[0]}" maxlength="20" >
                                                                        <input type="hidden"  ${mand_status_33} class="form-control" id="grandTotalHidden" name="grandTotalHidden" value="${qualitySumTotal[0]}">
                                                                        <input type="hidden"  ${mand_status_33}  autocomplete="off" class="form-control" id="grandTotal1" name="grandTotal1" value="${qualitySumTotal[0]}" maxlength="20" >
                                                                    </c:when>
                                                                    <c:otherwise>     
                                                                        <input type="hidden"  ${mand_status_33}  autocomplete="off" class="form-control" id="grandTotal1" name="grandTotal1" value="${qualitySumTotal[0]}" maxlength="20" >
                                                                        <input type="text" class="form-control" readonly="" id="grandTotal" value="${qualitySumTotal[0]}" name="grandTotal">
                                                                        <input type="hidden" ${mand_status_33} class="form-control" id="grandTotalHidden" name="grandTotalHidden" value="${qualitySumTotal[0]}"  >
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>

                                                        </c:when>
                                                        <c:otherwise>                                                                          
                                                            <input type="text"  ${mand_status_33}  autocomplete="off" class="form-control" id="grandTotal" readonly="" name="grandTotal" value="${grandTotal}" maxlength="20" >
                                                        </c:otherwise>        
                                                    </c:choose>
                                                </div>
                                            </c:if>


                                            <div class="clearfix"></div>
                                        </div>


                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <div class="x_panel" style="overflow:scroll">

                                                <div class="x_content">



                                                    <table class="table table-striped responsive-utilities jambo_table bulk_action">
                                                        <thead>
                                                            <tr class="headings">


                                                                <th class="column-title">Accessory Code</th>
                                                                <th class="column-title">Accessory Name</th>
                                                                <th class="column-title">UOM</th>
                                                                <th class="column-title">FOC</th>
                                                                <th class="column-title">Ordered Qty</th>
                                                                <th class="column-title">Received Qty</th>
                                                                <th class="column-title">Qty Accepted</th>
                                                                <th class="column-title">Qty Rejected</th>
                                                                <th class="column-title">Unit Price</th>
                                                                <th class="column-title">Total</th>                                                                    
                                                                <th class="column-title">Expiry Date</th>
                                                                <th class="column-title">Manufacturer</th>
                                                                <th class="column-title">Model</th>
                                                                <th class="column-title">Warranty Period</th>
                                                                <!--                                                        <th class="column-title">Remarks</th>-->

                                                            </tr>
                                                        </thead>

                                                        <tbody>


                                                            <c:forEach items="${grnList}" var="list">

                                                                <c:forEach items="${item}" var="type">
                                                                    <c:if test="${list.itemCode eq type.itemCode}">
                                                                        <c:set var="code" value="${type.itemCode}"></c:set>
                                                                        <c:set var="name" value="${type.itemName}"></c:set>
                                                                        <c:set var="itmDesc" value="${type.itemDesc}"></c:set>
                                                                        <c:forEach items="${itemCat}" var="cat">
                                                                            <c:if test="${cat.categoryId eq type.itemCategory}">
                                                                                <c:set var="itmCat" value="${cat.itemCategory}"></c:set>  
                                                                            </c:if>
                                                                        </c:forEach>                                                                                                                                                           
                                                                        <c:set var="itmCod" value="${type.itemCode}"></c:set>
                                                                        <c:forEach items="${uom}" var="uom">
                                                                            <c:if test="${uom.uomId eq type.itemUom}">
                                                                                <c:set var="uomName" value="${uom.uomName}"></c:set> 
                                                                            </c:if>
                                                                        </c:forEach>

                                                                    </c:if>
                                                                </c:forEach>

                                                                <c:set var="foc" value="${list.foc }"/>
                                                                <c:set var="ordered" value="${list.orderedQty}"/>                                                                      
                                                                <c:set var="receivedQty1" value="${list.receivedQty}"/>
                                                                <c:set var="qtyAccepted" value="${list.qtyAcc}"/>
                                                                <c:set var="qtyRejected" value="${list.qtyRej}"/>
                                                                <c:set var="unitPrice" value="${list.unitPrice}"/>
                                                                <c:set var="totalPrice" value="${list.totalValue}"/>
                                                                <c:set var="expiryDate" value="${list.expiryDate}"/>
                                                                <c:set var="warrantyPeriod" value="${list.warrantyPeriod}"/>
                                                                <c:set var="manufacturer" value="${list.manufacturer}"/>
                                                                <c:set var="model" value="${list.model}"/>



                                                                <tr class="even pointer">


                                                                    <td>
                                                                        <input class="form-control" style="width: 100%; text-align: left;" readonly="" name="itemCode" id="itemCode" value="${code}" type="text">
                                                                    </td>
                                                                    <td>
                                                                        <input class="form-control" style="width: 100%; text-align: left;" readonly="" name="itemName" id="itemName" value="${name}" type="text">
                                                                    </td>
                                                                    <td>
                                                                        <input class="form-control" style="width: 100%; text-align: left;" readonly="" name="uom" id="uom" value="${uomName}" type="text">
                                                                    </td>
                                                                    <td>
                                                                        <input class="form-control" style="width: 100%; text-align: right;" readonly="" name="foc" id="foc" value="${foc}" type="text">
                                                                    </td>

                                                                    <td>
                                                                        <input class="form-control" style="width: 100%; text-align: right;" readonly="" name="orderedQty" id="orderedQty" value="${ordered} " type="text">
                                                                    </td>

                                                                    <td>
                                                                        <input class="form-control" style="width: 100%; text-align: right;" readonly="" name="receivedQty" id="receivedQty" value="${receivedQty1}" type="text">
                                                                    </td>

                                                                    <td>
                                                                        <input class="form-control" style="width: 100%; text-align: right;" readonly="" name="qtyAccepted" id="qtyAccepted" value="${qtyAccepted}" type="text">
                                                                    </td>
                                                                    <td>
                                                                        <input class="form-control" style="width: 100%; text-align: right;" readonly="" name="qtyRejected" id="qtyRejected" value="${qtyRejected}" type="text">
                                                                    </td>

                                                                    <td>
                                                                        <input class="form-control" style="width: 100%; text-align: right;" readonly="" name="unitPrice" id="unitPrice" value="${unitPrice} " type="text">
                                                                    </td>

                                                                    <td>
                                                                        <input class="form-control" style="width: 100%; text-align: right;" readonly="" name="totalPrice" id="totalPrice" value="<fmt:formatNumber pattern="#.###" value="${totalPrice}"/>" type="text">
                                                                    </td>

                                                                    <td>
                                                                        <input class="form-control" style="width: 100%; text-align: left;" readonly="" name="expiryDate" type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${expiryDate}" />" tabindex="-1"/>
                                                                    </td>
                                                                    <td>
                                                                        <input class="form-control" style="width: 100%; text-align: left;" readonly name="manufacturer" id="manufacturer" maxlength="60" value="${manufacturer}" type="text">
                                                                    </td>
                                                                    <td>
                                                                        <input class="form-control" style="width: 100%; text-align: left;" readonly name="model" id="model" maxlength="60" value="${model}" type="text">
                                                                    </td>
                                                                    <td>
                                                                        <input class="form-control" style="width: 100%; text-align: right;" readonly="" name="warrantyPeriod" id="warrantyPeriod" value="${warrantyPeriod}" type="text">
                                                                    </td>
                                                                </tr>

                                                            </c:forEach>

                                                        </tbody>

                                                    </table>
                                                </div>
                                            </div>
                                        </div>

                                        <br>

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
