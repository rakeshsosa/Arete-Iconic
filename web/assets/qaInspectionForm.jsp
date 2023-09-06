<%-- 
    Document   : qaInspectionForm
    Created on : 22 Feb, 2018, 11:29:33 AM
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


            $(document).ready(function () {
                $('#acceptedQty').bind("cut copy paste", function (e) {
                    e.preventDefault();
                });
            });

            function mandatory()
            {
                var x = $("#acceptedQty").val() && $("#comments").val();
                if (x === '') {
                    alert("Mandatory Fields Should Not Be Empty");
                    return  false;
                }

            }
            function fill(val1, val2, val3, val4, val5) {
                document.getElementById("suppName").value = val1;
                document.getElementById("suppAddress").value = val2;
                document.getElementById("suppPhone").value = val3;
                document.getElementById("suppEmail").value = val4;
                document.getElementById("suppId").value = val5;

            }

            function isNumberKey(evt) {
                debugger;
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                    return false;
                }
                return true;
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

            function rejqty($this) {
                var $itemRow = $($this).closest('tr');
                var val2 = $itemRow.find('#acceptedQty').val();
                var val1 = $itemRow.find('#recQty').val();
                var val = $itemRow.find('#recQty').val() - $itemRow.find('#acceptedQty').val();
                if (parseInt(val) < 0) {
                    alert("Please check the Received quantity");
                    $itemRow.find('#acceptedQty').val("");
                    $itemRow.find('#rejectedQty').val("N/A");
                    return false;
                }
                isNaN(val) ? $itemRow.find('#rejectedQty').val("N/A") : $itemRow.find('#rejectedQty').val(val);

                if (val2 === "0")
                {
                    alert("Invalid Quantity...!!");
                    $itemRow.find('#acceptedQty').val("");
                    return false;
                }
                else {
                    comments.required = true;
                }
            }

            function acjqty($this) {
                var $itemRow = $($this).closest('tr');
                var val2 = $itemRow.find('#recQty').val();
                var val1 = $itemRow.find('#totalacqty').val();
                var val = $itemRow.find('#totalacqty').val() - $itemRow.find('#recQty').val();
                if (parseFloat(val) < 0) {
                    alert("Please check the pending quantity");
                    $itemRow.find('#recQty').val("");
                    $itemRow.find('#rejectedQty').val("N/A");
                    return false;
                }



            }

            //    function pandf(){alert('test');
            //        var a=$("#pandf").value;
            //        
            //    }

            jQuery(document).ready(function () {
                // binds form submission and fields to the validation engine
                jQuery("#imForm").validationEngine();

            });

            (itemQtyPriceSelectors).on('keyup', function () {
                mioInvoice.updatePrice(this);
            });

            function stockvalid() {
                var table = document.getElementById("billtable");

                for (var i = 0; i < table.rows.length; i++) {
                    var $this = table.rows[i];
                    var $itemRow = $($this).closest('tr');
                    var n1 = $itemRow.find('#acceptedQty').val();
                    var n2 = $itemRow.find('#recQty').val();
                    var n3 = n2.split(".");
                    if (+n1 > +n2) {
                        //alert(+n1);
                        //alert('qwqw' +n2);
                        alert('Accepted Quantity must be less than Received Quantity');
                        return false;
                    }


                }
                return true;
            }

            function deleteRow1(row) {
                var rowCount = $('#billtable tr').length;

                if (rowCount != 2) {
                    $(row).parents('.item-row').remove();
                    if ($(".item-row").length < 1) //$("#deleteRow").hide();
                        this.updateSalesTax();
                    this.updateTotal();
                    return true;
                } else {
                    alert('you cannot delete this row');
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


            function checkradio($this) {

                var $itemRow = $($this).closest('tr');
                var xyz = $itemRow.find('#exp');
                if ($(xyz).is(':checked')) {
                    $itemRow.find('#exp1').val('YES');
                } else {
                    $itemRow.find('#exp1').val('NO');
                }

            }

        </script>         
    </head>
    <body class="nav-md">

        <jsp:include page="../login/menu.htm" />


                        <main id="main" class="main">
                            <div>
                                <jsp:include page="../login/headerlink.htm?submodule=Receipt List&tab=QA Inspection&pagetype=form"/>
                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card p-5">
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h5>Receipt</h5>
                                                </div>


                                    <form method="post" action="../quality/qaInspectionFormSubmit.htm" id="imForm" onsubmit="return stockvalid();">


                                        <c:set var="j" value="0"/>
                                        <c:forEach items="${recordlist}" var="list">
                                            <c:if test="${j eq 0}">
                                                <c:set var="j" value="1"/>
                                                <c:set var="purchaseType" value="${list.purchaseType}"/>
                                                <c:set var="supplierCode" value="${list.supplierName}"/>
                                                <c:set var="projectCode" value="${list.projectCode}"/>
                                                <c:set var="invoiceNo" value="${list.invoiceNo}"/>
                                                <c:set var="invoiceDate" value="${list.invoiceDate}"/>
                                                <c:set var="poNo" value="${list.poNo}"/>
                                                <c:set var="shipToLocation" value="${list.deliveryLocation}"/>
                                                <c:set var="poNo" value="${list.poNo}"/>

                                            </c:if>
                                        </c:forEach>


                                        <c:forEach items="${list1}" var="type">
                                            <c:if test="${type.purchaseOrderNo eq poNo}">

                                                <c:set var="supplierName" value="${type.supplierName}"/>
                                                <c:set var="supplierAddress" value="${type.supplierAddress}"/>
                                                <c:set var="supplierEmail" value="${type.supplierEmail}"/>
                                                <c:set var="supplierCode" value="${type.supplierCode}"/>

                                            </c:if>

                                        </c:forEach>

                                        <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="row">

                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <div class="input-group">
                                                        <div>
                                                            <strong>Inspection Number:</strong>&nbsp;&nbsp;&nbsp;<div id="dynamicdiv" style="display: inline">${mrNo}</div>
                                                            <input name="insNo" value="${mrNo}" type="hidden">
                                                            <input class="form-control" id="deptName" name="deptName" readonly="" type="hidden" value="<%=session.getAttribute("userDept").toString()%>" maxlength="80">
                                                            <input class="form-control" name="orgCode" readonly="" type="hidden" value="<%=session.getAttribute("orgCode").toString()%>" maxlength="80">
                                                        </div>

                                                        <div> <strong>Inspection  Date:</strong>&nbsp;&nbsp;&nbsp;<fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="<%=date%>" />
                                                            <input name="insDate" type="hidden" value="<fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="<%=date%>" />" tabindex="-1"/>
                                                        </div>

                                                        <div> <strong>Received By/Inspected By:</strong>&nbsp;&nbsp;&nbsp; ${user}</div>
                                                        <br>
                                                        <div> <strong>Project Code:</strong>&nbsp;&nbsp;&nbsp;${projectCode}
                                                            <input name="projectCode" value="${projectCode}" type="hidden">

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12">

                                                    <!--                                        <div> <strong>Purchase Order Number:</strong>&nbsp;&nbsp;&nbsp;${purchaseorderno}
                                                                                                <input name="poNo" value="${purchaseorderno}" type="hidden">
                                                    
                                                                                            </div>-->

                                                    <div><strong>Purchase Type:</strong>&nbsp;&nbsp;&nbsp;${purchaseType}
                                                        <input name="purchaseType" value="${purchaseType}" type="hidden">

                                                    </div>


                                                    <div> <strong>Invoice Number:</strong>&nbsp; &nbsp;${invoiceNo}
                                                        <input name="doNo" value="${invoiceNo}" type="hidden">
                                                    </div>

                                                    <div> <strong>Invoice Date:</strong>&nbsp;<fmt:formatDate pattern="dd-MMM-yyyy" value="${invoiceDate}"/>
                                                        <input name="p" value="${invoiceDate}" type="hidden">

                                                    </div>
                                                </div>
                                             
                                                </div>
                                                <div class="x_content">
                                                    <div class="row">

                                                        <div class="col-md-12 mt-3">

                                                            <!-- price element -->
                                                            <div class="col-md-4 col-sm-6 col-xs-12">
                                                                <div class="pricing">

                                                                    <div class="x_content">
                                                                        <div class="">
                                                                            <div >
                                                                                <ul class="list-unstyled text-left">
                                                                                    <li><h5><strong>Supplier Details:</strong></h5></li>

                                                                                    <div id="clientName">${supplierName}</div>
                                                                                    <input name="clientName" value="" type="hidden">

                                                                                    <div id="clientAddress"style="width:300px;">${supplierAddress}</div>
                                                                                    <input name="clientAddress" value="" type="hidden">

                                                                                    <%--<div id="clientCity"style="width:300px;">${contact.cityName}, ${contact.country}</div>--%>

                                                                                    <%--<div id="clientPhone">${contact.contactNumber}</div>--%>
                                                                                    <%-- <input name="clientPhone" value="${contact.contactNumber}" type="hidden">--%>

                                                                                    <div id="clientEmail">${supplierEmail}</div>
                                                                                    <input name="suppId" id="suppId" value="${supplierName}" type="hidden">

                                                                                </ul>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div> 
                                                            <!-- price element -->



                                                            <!-- price element -->
                                                            <div class="col-md-4 col-sm-6 col-xs-12">
                                                                <div class="pricing">

                                                                    <div class="x_content">
                                                                        <div class="">
                                                                            <div class="">
                                                                                <ul class="list-unstyled text-left">
                                                                                    <li><h5><strong>Delivery Location:</strong></h5></li>

                                                                                    <div id="clientName">${shipToLocation}</div>
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

                                                                    <div class="x_content mb-3">



                                                                        <table class="table table-striped responsive-utilities jambo_table bulk_action">
                                                                            <thead>
                                                                                <tr class="headings">



                                                                                    <th class="column-title" style="width: 10%">PO Number</th>
                                                                                    <th class="column-title" style="width: 10%">Sub Category</th>
                                                                                    <th class="column-title" style="width: 15%">Item Name</th>
                                                                                    <th class="column-title" style="width: 15%">Item Desc</th>
                                                                                    <th class="column-title" style="width: 10%">Order Qty</th>
                                                                                    <th class="column-title">Received Qty </th>
                                                                                    <th class="column-title">Uom</th>
                                                                                    <th class="column-title">Exceptional Acceptance</th>
                                                                                    <th class="column-title">Accepted Qty</th>
                                                                                    <th class="column-title" >Rejected Qty</th>
                                                                                    <th class="column-title" style="width: 5%">FOC Qty</th>
                                                                                    <th class="column-title" style="width: 8%">Delivery Date</th>
                                                                                    <th class="column-title" style="width: 10%">Batch No</th>
                                                                                    <th class="column-title" style="width: 10%">Expiry Date</th>
                                                                                    <th class="column-title"  style="width: 10%">Comments</th>
                                                                                </tr>
                                                                            </thead>

                                                                            <tbody>
                                                                                <c:forEach items="${recordlist}" var="list">
                                                                                    <c:forEach items="${list1}" var="type">
                                                                                        <c:if test="${type.purchaseOrderNo eq list.poNo}">
                                                                                            <c:if test="${type.itemCode eq list.itemCode}">
                                                                                                <c:set var="pUom" value="${type.uom}"/>
                                                                                            </c:if>
                                                                                        </c:if>
                                                                                    </c:forEach>

                                                                                    <c:set value="${list.receivingQty}" var="recqty"/>
                                                                                    <c:set value="${list.batchNo}" var="batchNo"/>
                                                                                    <c:set value="${list.expiryDate}" var="expiryDate"/>


                                                                                    <tr class="even pointer">
                                                                                        <!--<td ><i id="deleteRow" class="icon-remove" onclick="deleteRow1(this);" ></i></td>-->
                                                                                        <td>${list.poNo}
                                                                                            <input name="poNo" id="poNo" value="${list.poNo}" type="hidden">
                                                                                        </td>

                                                                                        <td>${list.itemSubCategory}
                                                                                            <input name="itemSubCategory" id="itemSubCategory" value="${list.itemSubCategory}" type="hidden">
                                                                                        </td>
                                                                                        <td class=" ">${list.itemName}
                                                                                            <input name="snos" value="${list.SNo}" id="snos" type="hidden">
                                                                                            <input name="itemCode" value="${list.itemCode}" type="hidden">
                                                                                            <input name="availqty" value="" id="availqty" type="hidden">
                                                                                            <input name="itemName" value="${list.itemName}" type="hidden">

                                                                                            <input name="itemCategory" id="itemCategory" value="${list.itemCategory}" type="hidden">
                                                                                        </td>
                                                                                        <td>${list.itemDescription}
                                                                                            <input name="itemDesc" value="${list.itemDescription}" type="hidden">
                                                                                        </td>

                                                                                        <td class="right">
                                                                                            ${list.orderQuantity} ${pUom}
                                                                                            <input class="form-control right" name="discount" id="discount" value="${list.discount}" type="hidden">
                                                                                            <input class="form-control right" name="orderQty" value="${list.orderQuantity}" id="orderQty" type="hidden">
                                                                                            <input class="form-control right" name="unitPrice" value="${list.unitPrice}" id="unitPrice" type="hidden">
                                                                                            <input class="form-control right" name="divisionName" value="${list.divisionName}" id="divisionName" type="hidden">




                                                                                        </td>



                                                                                        <td class=" "><input name="recQty" style="" readonly="" value="${list.receivingQty}" onkeyup="acjqty(this);"  autocomplete="off" id="recQty" onkeypress="return check_digit(event, this, 10, 3);" class="form-control right"  tabindex="3" type="text"></td>
                                                                                        <td>
                                                                                            ${pUom}
                                                                                            <input class="form-control right" name="qtyUom" value="${pUom}" type="hidden">
                                                                                        </td>
                                                                                        <td style="padding-left:28px;">  

                                                                                            <input  name="exp" id="exp1" type="hidden" value="NO">

                                                                                            <input  name="exp1" id="exp" type="checkbox" value="YES" onclick="checkradio(this);">



                                                                                        </td>
                                                                                        <td><input name="acceptedQty" style="" onkeyup="rejqty(this);" required="" maxlength="10" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" value="${list.receivingQty}" class="form-control right" id="acceptedQty" tabindex="4" type="text"></td>
                                                                                        <td class=" "><input name="rejectedQty" style="" style="cursor: pointer" value="0"  autocomplete="off" class="form-control right" id="rejectedQty" readonly tabindex="4"  type="text" ></td>

                                                                                        <td align="right">${list.focQty}
                                                                                            <input name="focQty" id="focQty" type="hidden" value="${list.focQty}">
                                                                                        </td>
                                                                                        <td>
                                                                                            <fmt:formatDate pattern="dd-MMM-yyyy" value="${list.deliveryDate}"/> 

                                                                                            <input name="deliveryDate" id="deliveryDate" readonly class="form-control right deliveryDate" style="width: 90px;" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.deliveryDate}" />" type="hidden">

                                                                                        </td>
                                                                                        <td class=" ">
                                                                                            <input name="batchNo" value="${batchNo}" type="hidden">
                                                                                            <c:if test="${batchNo eq '' || batchNo eq null}">
                                                                                                N/A
                                                                                            </c:if>
                                                                                            <c:if test="${batchNo ne '' || batchNo ne null}">
                                                                                                ${batchNo}
                                                                                            </c:if>
                                                                                        </td>
                                                                                        <td class=" ">


                                                                                            <c:if test="${expiryDate ne null}">                                                                                  
                                                                                                <fmt:formatDate pattern="dd-MMM-yyyy" value="${expiryDate}"/>                                                                             
                                                                                                <input name="expiryDate" value="${expiryDate}" type="hidden">
                                                                                            </c:if>
                                                                                            <c:if test="${expiryDate eq null}">                                                                              
                                                                                                N/A
                                                                                                <input name="expiryDate" value="" type="hidden">
                                                                                            </c:if>



                                                                                        </td>
                                                                                        <td class="a-right a-right "><input name="comments" autocomplete="off" id="comments" maxlength="30" type="text" value="" class="form-control" ></td>

                                                                                    </tr>


                                                                                </c:forEach>




                                                                            </tbody>

                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>


                                                            <!-- price element -->       



                                                        </div>
                                                    </div>
                                                      <div class="col-md-9 col-sm-9 mt-3 col-xs-12 col-md-offset-5">


                                                        <input id="saveInvoiceBtn" tabindex="6" class="btn btn-primary" name="saveInvoice" value="Save" type="submit" onclick="if (confirm('Do you really want to Save this record')) {
                                                                    return true;
                                                                } else {
                                                                    return false;
                                                                }">
                                                        <a href="../quality/qaInspectionList.htm"><button type="button" class="btn btn-danger" style="">Cancel</button></a> 

                                                    </div>
                                                </div>
                                            </div>

                                        </div>
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
                //xy();

                $('.receivingQty').attr('disabled', true);
                $('.foc').attr('disabled', true);
                $('.batchNo').attr('disabled', true);
                $('.expDate').attr('disabled', true);

            });
            function xy(data) {
                alert(data);
                var x = '<select style="text-align:center;width:80px;" class="input-mini form-control validate[required] issueUom" autocomplete="off" maxlength="10"   type="text" onpaste="return false"  name="" id="issueUom"   value=""><option value="">Select an option</option><c:forEach items="${uomlist}" var="type1"><option value="${type1.uomName}">${type1.uomName}</option></c:forEach></select>';
                return x;
            }
//            var toAppend;
//            function showDropdown(data) {
//
//
//            <%--    <c:forTokens items="${data}" delims=":" var="mySplit">
                    <c:set var="dateParts" value="${fn:split(mySplit, '-')}" />
                    <c:if test="${dateParts[0] ne null && dateParts[1] ne null && dateParts[2] ne null}">
                    '<option value="${dateParts[0]}-${dateParts[1]}-${dateParts[2]}">${dateParts[0]}</option>'
                    </c:if>
                </c:forTokens>'</select>';  --%>//
//                toAppend = '';
//                //toAppend = '<select style="text-align:center;width:80px;" class="input-mini form-control validate[required]" autocomplete="off" maxlength="10"   type="text" onpaste="return false"  name="" id="issueUom">'       
//                if (data != null)
//                {
//
//                    var nameArray = data.split(":");
//
//
//                    toAppend += '<option value="">Select an Option</option>';
//                    for (var i = 0; i < nameArray.length; i++) {
//                        var dateParts = nameArray[i].split("-");
//                        if (dateParts[0] != '' || dateParts[0] != null)
//                            toAppend += '<option  value="' + dateParts[0] + '-' + dateParts[1] + '-' + dateParts[2] + '">' + dateParts[0] + '</option>';
//                    }
//
//                    return toAppend;
//                    //$('.issueUom').append(toAppend);
//
//                }
//
//            }

            checked = false;
            function checkAll() {

                var aa = document.getElementById('imForm');

//                if (checked === false) {
//                    checked = true;
//                    $(".receivingQty").attr('disabled', false);
//                    $(".foc").attr('disabled', false);
//                    $(".batchNo").attr('disabled', false);
//                    $('.expDate').attr('disabled', false);
//
//                } else {
//                    checked = false;
//                    $(".receivingQty").attr('disabled', true);
//                    $(".foc").attr('disabled', true);
//                    $(".batchNo").attr('disabled', true);
//                    $('.expDate').attr('disabled', true);
//
//                }
//                for (var i = 0; i < aa.elements.length; i++) {
//                    aa.elements[i].checked = checked;
//                     getVal(aa.elements[i]);
//                   }

                $('.addPo').each(function () {
                    var $itemRow = $(this).closest('tr');
                    var suppStatus = $itemRow.find('#suppStatus').val();

                    if ($('#selectall').is(':checked')) {
                        $itemRow.find('.selValue').prop('checked', true);
                    } else
                    {
                        $itemRow.find('.selValue').prop('checked', false);
                    }


                    getVal(this, suppStatus);
                });

            }

            function checkBoxValid(val)
            {
//                if ($("#selectedvalues:checked").length === 0) {
//                    alert("Please select checkbox...!!")
//                    return false;
//                } else
//                {
                var tab1 = document.getElementById("resourcetable2");
                var tab1len = tab1.rows.length;

                if (tab1len === 0) {
                    alert("Please add data into grid");
                    return false;
                }

                else if (confirm('Do you really want to Save this record')) {
                    return true;
                } else {
                    return false;
                }
//                    return true;
//                }

            }

            function getVal($this, suppstatus) {
//                alert(suppstatus);
                var x = document.getElementById("itemsTable1").rows.length;
                var $itemRow = $($this).closest('tr');

                var supplier = document.getElementById('supplierName').value;
                var supStatus = $itemRow.find('#suppStatus').val();
                var item = $itemRow.find('#itemCode').val();
//                alert(supStatus+"    "+item);
//                if(supStatus  !== 'Active'){
//                    alert(supplier+" is not tagged to "+ item+" Please tag to proceed.");
//                    return false;
//                }else{

                if (suppstatus == 'Active') {

//                    alert("ascy");
                    if ($itemRow.find('#selectedvalues').is(':checked'))
                    {
                        fetchRecUOM($this);

                        $itemRow.find('#receivingQty').prop('disabled', false);
                        $itemRow.find('#foc').prop('disabled', false);
                        $itemRow.find('#revingUom').prop('disabled', false);

                        var man = $itemRow.find('#madetory').val();
                        if (man == "Yes") {
                            $itemRow.find('#batchNo').prop('disabled', false);
                            $itemRow.find('#expDate').prop('disabled', false);
                        }

                    } else {

                        $itemRow.find('#revingUom').empty();

                        $itemRow.find('#receivingQty').prop('disabled', true);
                        $itemRow.find('#foc').prop('disabled', true);
                        $itemRow.find('#revingUom').prop('disabled', true);
                        $itemRow.find('#batchNo').prop('disabled', true);
                        $itemRow.find('#expDate').prop('disabled', true);

                    }

                } else {
                    alert(supplier + " is not tagged to " + item + " Please tag to proceed.");
                    return false;
                }

            }

            function getDate($this) {

                var x = document.getElementById("itemsTable1").rows.length;
                var $itemRow = $($this).closest('tr');
                var ex1 = $itemRow.find("#expDate").val();
                var ex2 = dateconvert(ex1);
//              
                var exp = moment(ex2).format("YYYY-MM-DD");
                var today = moment(Date()).format("YYYY-MM-DD");


                var dateformat = /^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/;

                if (!ex1.match(dateformat))
                {
                    alert("You have entered an invalid date!");
                    $itemRow.find("#expDate").val("");
                    return false;
                }
                else if (exp < today) {

                    alert("Date already expired");
                    $itemRow.find("#expDate").val("");
                }

            }

            NProgress.done();


        </script>
        <script src="../assets/general-inventory_script.js" type="text/javascript"></script>
        <script src="../assets/inventory_script.js" type="text/javascript"></script>
    </body>


</html>
