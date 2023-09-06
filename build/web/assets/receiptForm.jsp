<%-- 
    Document   : receiptForm
    Created on : 19 Feb, 2018, 5:02:05 PM
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

//                $('.receivingQty').attr('disabled', true);
//                $('.ex1').attr('disabled', true);
//                $('.ex3').attr('disabled', true);
//                $('.foc').attr('disabled', true);
//                $('.itemSubCategory').attr('disabled', true);
//                $('.itemName').attr('disabled', true);
//                $('.itemCode').attr('disabled', true);
//                $('.itemDesc').attr('disabled', true);
//                $('.itemCategory').attr('disabled', true);
//                $('.discount').attr('disabled', true);
//                $('.oQty').attr('disabled', true);
//                $('.unitPrice').attr('disabled', true);
//                $('.recdQty').attr('disabled', true);


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


//            function selectLocation(obj) {
//
//                var $itemrow = obj.closest('tr');
//                //alert($($itemrow).find("#itemCode").val());
//                var itemCode = $($itemrow).find("#itemCode").val();
//                var recevingQty = $($itemrow).find('#recevingQty').val();
//
//                if (recevingQty) {
//                    myWindow = window.open("../materialtype/selectLocation.htm?itemCode=" + itemCode + "&recevingQty=" + recevingQty + "", "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
//                } else {
//                    alert("Please enter receving Quantity");
//                    return false;
//                }
//            }
//

            function  fetchPoNo() {

                var supplierId = document.getElementById('supplierCode').value;
                if (supplierId) {
                    myWindow = window.open("../quality/fetchPoNo.htm?supplierId=" + supplierId + "", "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");

                } else {
                    alert("Please select Supplier");
                }

            }

            //fetch supplier from PO
            function  fetchSupplier() {
                var supp = document.getElementById('supplierCode').value;
                //alert(supp);
                if (supp) {
                    return false;
                } else {
                    myWindow = window.open("../quality/fetchSupplier.htm?", "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");

                }

            }

            function fetchPODetails() {
//                alert("run1");
                var tab1 = document.getElementById("resourcetable1");
//                alert(tab1);
                var tab1len = tab1.rows.length;

                if (tab1len > 0) {
//                    alert("run2");
                    alert("Please transfer data into another grid");
                    return false;
                }


                var flag = 1;
                var poNo = document.getElementById("poNo").value;

                $('#resourcetable2 tr').each(function () {
//                    alert("run3");
                    $(this).find('td').each(function () {
                        var po = $(this).find('#pono2').val();
                        //var itmcode = $(this).find('#itmCode2').val();

                        if (po == poNo) {

                            flag = 0;
                        }
                    });
                });
                if (flag == 1) {
//                    alert("run4");


                    var invoiceNo = document.getElementById('invoiceNo').value;
                    var invoiceDate = document.getElementById('invoiceDate').value;
                    var supplierName = document.getElementById('supplierName').value;
                    var projectCode = document.getElementById('projectCode').value;

                    if (!(invoiceNo && invoiceDate && poNo && supplierName)) {
                        alert("Please Fill mandatory Filds");
                        return false;
                    }



                    $.ajax({
                        type: "POST",
                        url: '../quality/fetchPODetails.htm',
                        data: {
                            poNo: poNo

                        },
                        success: function (data) {
//                            alert("run5");

                            if (data !== "No Data")
                            {
                                fetchPODetails1(data);

                            } else
                            {

                                alert("no data");

                            }
                        },
                        error: function (error) {
//                            alert(error);
                        }

                    });
                }
                else {
                    alert("Already Added into the grid");
                    return false;
                }


            }

            function fetchPODetails1(data)
            {

                var nameArray;

                var subCat;
                var itemCode;
                var itemname;
                var qty;
                var unitPrice;
                var uom;
                var snos;
                var itemCat;
                var itemDesc;
                var discount;
                var posno;
                var reqDate;

                if (data != null)
                {

                    var rows = data.split("//");
                    var rownos = rows.length - 1;
                    while (rownos > 0) {
                        nameArray = rows[rownos - 1].split(",,");


                        subCat = nameArray[0];
                        itemCode = nameArray[1];
                        itemname = nameArray[2];
                        qty = nameArray[3];
                        unitPrice = nameArray[4];
                        uom = nameArray[5];
                        snos = nameArray[6];
                        itemCat = nameArray[7];
                        itemDesc = nameArray[8];
                        if (itemDesc == 'null') {
                            itemDesc = '';
                        }
                        discount = nameArray[9];
                        reqDate = moment(nameArray[10]).format("DD-MMM-YYYY");

                        addOrderRow_test(subCat, itemCode, itemname, qty, unitPrice, uom, snos, itemCat, itemDesc, discount, reqDate);
                        rownos--;

                        if (rownos === 0) {
                            //alert(rownos);
//                            document.getElementById('projectCode').value = "";
//                            document.getElementById('invoiceNo').value = "";
//                            document.getElementById('invoiceDate').value = "";
//                            document.getElementById('purchaseType').value = "";
//                            document.getElementById('shipToLocation').value = "";
//                            document.getElementById('supplierName').value = "";
//                            document.getElementById('supplierCode').value = "";
                            document.getElementById('poNo').value = "";
                        }
                    }
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


            function getDate1() {

                var doDate = document.getElementById('invoiceDate').value;
                var ex2 = dateconvert(doDate);
//              
                var exp = moment(ex2).format("YYYY-MM-DD");
                var today = moment(Date()).format("YYYY-MM-DD");
//               var today = document.getElementById("today").value;
                var dateformat = /^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/;

                if (!doDate.match(dateformat))
                {
                    alert("You have entered an invalid date!");
                    $('#invoiceDate').val("");
                    return false;
                }

                else if (exp > today) {

                    alert("Please enter proper invoice date");
                    $('#invoiceDate').val("");
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
    </head>
    <body class="nav-md">

        
 <jsp:include page="../login/menu.htm"/>
               
                                
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
                <div class="card-title"><h5>Receipt</h5></div>

                                    <form id="userform" method="post" enctype="multipart/form-data" name="form" class="form-inline" action="../quality/MRSubmit1.htm" onsubmit="return formValidate();">


                                        <div class="row">

                                          

                                                <div  class="col-md-4 col-sm-6 col-xs-12">
                                                    <div class="input-group">
                                                        <div>
                                                            <strong>Receipt Number:</strong>&nbsp;&nbsp;&nbsp;<div id="dynamicdiv" style="display: inline">GRN-${ordno}</div>
                                                            <input name="recordNo" value="GRN-${ordno}" type="hidden">
                                                            <input class="form-control" id="deptName" name="deptName" readonly="" type="hidden" value="<%=session.getAttribute("userDept").toString()%>" maxlength="80">
                                                            <input class="form-control" name="orgCode" readonly="" type="hidden" value="<%=session.getAttribute("orgCode").toString()%>" maxlength="80">
                                                        </div>

                                                        <div > <strong>Receipt Date:</strong>&nbsp;&nbsp;<fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="<%=date%>" />
                                                            <input name="mrDate" type="hidden" value="<fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="<%=date%>" />" tabindex="-1"/>
                                                        </div>

                                                        <div ><strong>Received By:</strong>&nbsp;&nbsp;&nbsp; ${userId}
                                                            <input  name="recievedBy" id="recievedBy" value="" type="hidden"></div>




                                                    </div>
                                                    <!--                                                    <div class="row">-->
                                                </div>
                                        </div>
                                                            <div class='row mt-3'>
                                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                                        <div class="col-md-12 mb-3" style=" " >
                                                            <lable class="control-label"><span style="color: red">*</span><b> Supplier Name:</b></lable>
                                                            <input autocomplete="off" type="text"  maxlength="200" readonly="" name="" id="supplierName" class="form-control validate[]" tabindex="1"  placeholder="Select Supplier" onclick="fetchSupplier();" >
                                                            <input  name="" id="supplierCode" value="" type="hidden">
                                                        </div>

                                                         <div class="col-md-12 mb-3" style=" " >
                                                            <lable class="control-label"><span style="color: red"></span><b> Project Code:</b></lable>
                                                            <input autocomplete="off" type="text"  maxlength="30" name="" id="projectCode" class="form-control validate[]" tabindex="1">
                                                        </div>

                                                         <div class="col-md-12 mb-3" style=" " >
                                                            <lable class="control-label"><span style="color: red"></span><b> Delivery Location:</b></lable>
                                                            <input autocomplete="off" type="text"  maxlength="30" readonly="" name="" id="shipToLocation" class="form-control validate[]" tabindex="1" >
                                                        </div>
                                                    </div>
                                               
                                                <div class="col-md-6 col-sm-6 col-xs-6">
                                                   <div class="col-md-12 mb-3" style=" " >
                                                        <lable style=" "><span style="color: red">*</span><b> Invoice No:</b></lable>
                                                        <input autocomplete="off" type="text"  maxlength="30" name="" id="invoiceNo" class="form-control validate[]" tabindex="1" >
                                                    </div>  

              <div class="col-md-12 mb-3" style=" " >
                                                        <lable style=" "> <span style="color: red">*</span><b> Invoice Date:</b></lable>
                                                        <input type="text"  name=""  placeholder="DD/MM/YYYY"   tabindex="2" id="invoiceDate" class="form-control validate[]" onchange="getDate1(this)" <%--onclick="NewCssCal('invoiceDate', 'ddMMMyyyy', '', '', '', '', 'past');"--%> >
                                                    </div>

                                                    <div class="col-md-12 mb-3" style=" " >
                                                        <lable style=" "> <span style="color: red">*</span><b> Purchase Order No:</b></lable>
                                                        <input autocomplete="off" type="text"  maxlength="30" readonly="" name="" id="poNo" class="form-control validate[]" tabindex="1" placeholder="Select PO" onclick="fetchPoNo();">
                                                    </div>



                                                    <div class="col-md-12 mb-3" style=" " >
                                                        <lable style=" "><span style="color: red"></span><b> Purchase Type:</b></lable>
                                                        <input autocomplete="off" type="text"  maxlength="30" readonly="" name="" id="purchaseType" class="form-control validate[]" tabindex="1" >
                                                    </div>


                                                 
                                                </div>
 </div>
                                                <div class="clearfix"></div>


                                                <div class="x_content">
                                                    <div class="row">

                                                        <div class="col-md-12">

                                                            <!-- price element -->

                                                            <!-- price element -->

                                                            <!-- price element -->

                                                            <br/><br/>

                                                            <div>                                            
<!--                                                                <div style="float:left;" id="s_butt_id1"><span  id="" value="" data-text-original=""  class="btn btn-primary" tabindex="" onclick="fetchPODetails();">Fetch PO Details</span></div>-->
                                                            </div>

                                                            <div class="col-md-12 col-sm-12 col-xs-12" >
                                                                <div class="x_panel" style="overflow-x:scroll">





                                                                    <table class="table table-bordered bulk_action" id="itemsTable1">
                                                                        <thead>
                                                                            <tr class="">


                                                                                <th style="color:#fff;width:4%;border-bottom:1px solid transparent;background:#425567;color:#fff;background:#425567;color:#fff;"><i class="fa fa-trash"></i></th>
                                                                                <th style="border-bottom:1px solid transparent;background:#425567;color:#fff;background:#425567;color:#fff;"><input type="checkbox" id="selectall" onclick="checkAll();"/></th>
                                                                                <th class="column-title" style="width: 100px;border-bottom:1px solid transparent;background:#425567;color:#fff;background:#425567;color:#fff;">PO No</th>
                                                                                <th class="column-title" style="width: 100px;border-bottom:1px solid transparent;background:#425567;color:#fff;background:#425567;color:#fff;">purchase Type</th>
                                                                                <th class="column-title" style="width: 120px;border-bottom:1px solid transparent;background:#425567;color:#fff;background:#425567;color:#fff;">Invoice No</th>
                                                                                <th class="column-title" style="width: 100px;border-bottom:1px solid transparent;background:#425567;color:#fff;background:#425567;color:#fff;">Invoice Date</th>
                                                                                <th class="column-title" style="width: 250px;border-bottom:1px solid transparent;background:#425567;color:#fff;background:#425567;color:#fff;">Supplier Name</th>
                                                                                <th class="column-title" style="width: 100px;border-bottom:1px solid transparent;background:#425567;color:#fff;background:#425567;color:#fff;">Delivery Location</th>
                                                                                <th class="column-title" style="width: 100px;border-bottom:1px solid transparent;background:#425567;color:#fff;background:#425567;color:#fff;">Delivery Date</th>
                                                                                <th class="column-title" style="width: 100px;border-bottom:1px solid transparent;background:#425567;color:#fff;background:#425567;color:#fff;">Sub Category</th>
                                                                                <th class="column-title" style="width: 100px;border-bottom:1px solid transparent;background:#425567;color:#fff;background:#425567;color:#fff;">Item Code</th>
                                                                                <th class="column-title" style="width: 150px;border-bottom:1px solid transparent;background:#425567;color:#fff;background:#425567;color:#fff;">Item Name</th>
                                                                                <th class="column-title" style="width: 150px;border-bottom:1px solid transparent;background:#425567;color:#fff;background:#425567;color:#fff;">Item Desc</th>
                                                                                <th class="column-title" style="width: 50px;border-bottom:1px solid transparent;background:#425567;color:#fff;background:#425567;color:#fff;">Order Qty</th>
                                                                                <th class="column-title" style="width: 50px;border-bottom:1px solid transparent;background:#425567;color:#fff;background:#425567;color:#fff;">Ordered Price</th>
                                                                                <th class="column-title" style="width: 50px;border-bottom:1px solid transparent;background:#425567;color:#fff;background:#425567;color:#fff;"><span style="color: red">*</span>UOM</th>
                                                                                <th  colspan="4" class="column-title" style="background:#425567;color:#fff;">Quantity </th>

                                                                                <th class="column-title" style="width: 100px;border-bottom:1px solid transparent;background:#425567;color:#fff;background:#425567;color:#fff;"><span style="color: red">*</span>Batch No</th>
                                                                                <th class="column-title" style=" width: 106px;border-bottom:1px solid transparent;background:#425567;color:#fff;background:#425567;color:#fff;"><span style="color: red">*</span>Expiry Date </th>
                                                                                <th class="column-title" style="border-bottom:1px solid transparent;background:#425567;color:#fff;background:#425567;color:#fff;">Action </th>

                                                                            </tr>
                                                                            <tr class="">


                                                                                <th style="color:#fff;width:4%;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th style="width: 100px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th style="width: 100px;border:1px solid black;background:#425567;color:#fff;"></th>

                                                                                <th  style="width: 100px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th  style="width: 120px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th style="width: 100px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th  style="width: 250px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th  style="width: 100px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th  style="width: 100px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th  style="width: 100px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th  style="width: 100px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th  style="width: 150px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th  style="width: 150px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th  style="width: 50px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th  style="width: 50px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th  style="width: 50px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th  style="border:1px solid black;background:#425567;color:#fff;">Received</th>
                                                                                <th  style="border:1px solid black;background:#425567;color:#fff;">UOM</th>
                                                                                <th  style="border:1px solid black;background:#425567;color:#fff;"><span style="color: red">*</span>Receiving </th>
                                                                                <th  style="border:1px solid black;background:#425567;color:#fff;">FOC</th>

                                                                                <th  style="width: 70px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th style="width: 100px;border:1px solid black;background:#425567;color:#fff;"><span style="color: red"></span></th>
                                                                                <th  style=" width: 106px;border:1px solid black;background:#425567;color:#fff;"><span style="color: red"></span>
                                                                                    <!--                                                                        <th  style="border:1px solid black;background:#425567;color:#fff;"> </th>-->

                                                                            </tr>
                                                                        </thead>

                                                                        <tbody id="resourcetable1">



                                                                        </tbody>
                                                                        <script>
                                                                            var count1 = 0;
                                                                            function addOrderRow_test(subCat, itemCode, itemname, qty, unitPrice, uom, snos, itemCat, itemDesc, discount, deliveryDate) {


                                                                                var invoiceNo = document.getElementById('invoiceNo').value;
                                                                                var invoiceDate = document.getElementById('invoiceDate').value;
                                                                                var purchaseType = document.getElementById('purchaseType').value;
                                                                                var deliveryLoc = document.getElementById('shipToLocation').value;
                                                                                var supplierName = document.getElementById('supplierName').value;
                                                                                var supplierCode = document.getElementById('supplierCode').value;
                                                                                var poNo = document.getElementById('poNo').value;
                                                                                var projectCode = document.getElementById('projectCode').value;
                                                                                var receved = 0;
                                                                                var madetory;
                                                                                var batchNo = "";
                                                                                var expDate = "";
                                                                                var xyz;
                                                                                var orderUomConv;
                                                                                var receivedUom;
                                                                                var recUomConv;
                                                                                var orderUomConv;
                                                                                var trec = '0';
                                                                                var suppStatus;


                                                                                $.ajax({
                                                                                    type: "POST",
                                                                                    async: "false",
                                                                                    url: '../quality/fetchreceivedQty1.htm',
                                                                                    data: {
                                                                                        poNo: poNo, itemCode: itemCode, supplierCode: supplierCode
                                                                                    },
                                                                                    success: function (data) {
                                                                                        //                                                                                        alert(data);
                                                                                        var datas = data.split(",");
                                                                                        madetory = datas[1];
                                                                                        receved = parseFloat(datas[0]);
                                                                                        receivedUom = datas[2];
                                                                                        suppStatus = datas[3];
                                                                                        //alert(receved);
                                                                                        if (madetory === "Default") {
                                                                                            batchNo = "GEN";
                                                                                            expDate = "31/12/2029";
                                                                                        }

                                                                                        if (receivedUom != '')
                                                                                        {
                                                                                            $.ajax({
                                                                                                type: "POST",
                                                                                                async: "false",
                                                                                                url: '../quality/uomNew.htm',
                                                                                                data: {
                                                                                                    poNo: poNo, itemCode: itemCode
                                                                                                },
                                                                                                success: function (uomList) {
                                                                                                    //                                                                                                    alert(uomList);
                                                                                                    var uomLists = uomList.split(",,");

                                                                                                    if (receivedUom == uomLists[1]) {
                                                                                                        recUomConv = '1';
                                                                                                    }
                                                                                                    if (receivedUom == uomLists[2]) {
                                                                                                        recUomConv = uomLists[5];
                                                                                                    }
                                                                                                    if (receivedUom == uomLists[3]) {
                                                                                                        recUomConv = uomLists[6];
                                                                                                    }
                                                                                                    if (receivedUom == uomLists[4]) {
                                                                                                        recUomConv = uomLists[7];
                                                                                                    }


                                                                                                    if (uom == uomLists[1]) {
                                                                                                        orderUomConv = '1';
                                                                                                    }
                                                                                                    if (uom == uomLists[2]) {
                                                                                                        orderUomConv = uomLists[5];
                                                                                                    }
                                                                                                    if (uom == uomLists[3]) {
                                                                                                        orderUomConv = uomLists[6];
                                                                                                    }
                                                                                                    if (uom == uomLists[4]) {
                                                                                                        orderUomConv = uomLists[7];
                                                                                                    }
                                                                                                    //alert(receved + "/" + recUomConv + "*" + orderUomConv);
                                                                                                    trec = (receved / recUomConv) * orderUomConv;  //qty - trec
                                                                                                    //alert(trec);
                                                                                                }
                                                                                            });
                                                                                        }
                                                                                    }
                                                                                });

                                                                                var table1 = document.getElementById("resourcetable1");

                                                                                var slNo1 = table1.rows.length;
                                                                                var id1 = slNo1;
                                                                                var slNo = count1;
                                                                                var tr1 = table1.insertRow(slNo1);
                                                                                //$('#revingUom'+slNo1).html(xyz);
                                                                                //alert(qty);
                                                                                setTimeout(function () {
                                                                                    tr1.className = 'addPo';
                                                                                    tr1.id = 'list_tr_' + slNo;
                                                                                    tr1.innerHTML = '<td align="center" class="tinput"><button type="button" class="fa fa-trash-o" onclick="removeRow1(' + slNo + ')" ></button> </td><td><input type="checkbox" id="selectedvalues" class="selValue"  name="snos" value="" onclick="getVal(this,\'' + suppStatus + '\');"/></td>' +
                                                                                            '<td><input class="form-control poNo" style="text-align:left;width:90px;" type="text" readonly id="poNo1" value="' + poNo +
                                                                                            '"/></td><td><input class="form-control purchaseType" style="text-align:left;width:100px" type="text" readonly id="purType" value="' + purchaseType +
                                                                                            '"/></td><td><input class="form-control invoiceNo" style="text-align:left;width:100px" type="text" readonly id="invoiceNo" value="' + invoiceNo +
                                                                                            '"/></td><td><input class="form-control invoiceDate" style="text-align:left;width:100px" type="text" readonly id="invoiceDate" value="' + invoiceDate +
                                                                                            '"/></td><td><input class="form-control supplierName" style="text-align:left;width:240px" type="text" readonly id="supplierName" value="' + supplierName +
                                                                                            '"/></td><td><input class="form-control deliveryLoc" style="text-align:left;width:120px" type="text" readonly id="deliveryLoc" value="' + deliveryLoc +
                                                                                            '"/></td><td><input class="form-control deliveryDate" style="text-align:left;width:120px" type="text" readonly id="deliveryDate" value="' + deliveryDate +
                                                                                            '"/></td><td><input class="form-control itemsubCat" style="text-align:left;width:100px" type="text" readonly id="itemsubCat" value="' + subCat +
                                                                                            '"/></td><td><input class="form-control itemCode" style="text-align:left;width:100px" type="text" readonly id="itemCode" value="' + itemCode +
                                                                                            '"/></td><td><input class="form-control itemName" style="text-align:left;width:210px" type="text" readonly id="itemName" name="" value="' + itemname + '"/></td>\n\
                                                                                    <td><input class="form-control itemDesc" style="text-align:left;width:210px" type="text" readonly id="itemDesc" name="" value="' + itemDesc + '"/></td>\n\
                                                                                    <td><input style="text-align:right;width:70px;" class="input-mini form-control validate[] validate[custom[notzero],custom[float2]] orderQty" autocomplete="off" maxlength="10"   type="text" onpaste="return false" readonly name="" id="orderQty"  onkeypress="return check_digit(event, this, 10, 3);"  value="' + qty + '" >' + uom + '[Pending: <fmt:formatNumber pattern="#.###" maxFractionDigits="3" value='' />' + (qty - trec) + ' ' + uom + ']</td>\n\
                                                                                    <td><input style="text-align:right;width:70px;" class="input-mini form-control validate[] validate[custom[notzero],custom[float2]] unitPrice" autocomplete="off" maxlength="10"   type="text"   name="" id="unitPrice" readonly value="' + unitPrice + '" ></td>\n\
                                                                                    <td><select style="text-align:center;width:80px;" class="input-mini form-control validate[] revingUom" autocomplete="off" maxlength="10"   type="text" onpaste="return false" disabled name="" id="revingUom" onclick="fetchRecUOM1(this);" onchange="changeUnitPrice(this);"></select></td>\n\
                                                                                    <td><input style="text-align:right;width:70px;" class="input-mini form-control validate[] validate[custom[notzero],custom[float2]] receivedQty" autocomplete="off" maxlength="10"   type="text" onpaste="return false"  name="" readonly id="receivedQty"  onkeypress="return check_digit(event, this, 10, 3);"  value="' + trec + '" ></td>\n\
                                                                                    <td><input style="text-align:left;width:80px;" class="input-mini form-control validate[] uom" autocomplete="off" maxlength="10"   type="text" onpaste="return false" readonly name="" id="uom"   value="' + uom + '" ></td>\n\
                                                                                    <td><input style="text-align:right;width:70px;" class="input-mini form-control receivingQty" disabled autocomplete="off" maxlength="10"   type="text" onpaste="return false"  name="" id="receivingQty"  onkeypress="return check_digit(event, this, 10, 3);"  value="' + (qty - trec) + '" onkeyup="test(this);" onkeypress="return isNumberKey(event);" ></td>\n\
                                                                                    <td><input style="text-align:right;width:70px;" class="input-mini form-control validate[required] foc" disabled autocomplete="off" maxlength="10"   type="text" onpaste="return false"  name="" id="foc"   value="0" onkeypress="return check_digit(event, this, 2, 3);"></td>\n\
                                                                                    <td><input style="text-align:left;width:80px;" class="input-mini form-control validate[] batchNo" disabled autocomplete="off" maxlength="10"   type="text" onpaste="return false"  name="" id="batchNo"   value="' + batchNo + '" ></td>\n\
                                                                                    <td><input style="text-align:left;width:100px;" class="input-mini form-control validate[] expDate" disabled autocomplete="off" maxlength="10"   type="text"   name="" id="expDate"  placeholder="DD/MM/YYYY" value="' + expDate + '" onchange="getDate(this)"></td>\n\
                                                                                        <input style="text-align:center;" class="input-mini form-control validate[] supplierCode" autocomplete="off" maxlength="10"   type="hidden" onpaste="return false"  name="" id="supplierCode"   value="' + supplierCode + '" >\n\
                                                                                        <input style="text-align:center;" class="input-mini form-control validate[] projectCode" autocomplete="off" maxlength="10"   type="hidden" onpaste="return false"  name="" id="projectCode"   value="' + projectCode + '" >\n\
                                                                                        <input style="text-align:center;" class="input-mini form-control validate[] snos" autocomplete="off" maxlength="10"   type="hidden" onpaste="return false"  name="" id="snos"   value="' + snos + '" >\n\
                                                                                        <input style="text-align:center;" class="input-mini form-control validate[] itemCat" autocomplete="off" maxlength="10"   type="hidden" onpaste="return false"  name="" id="itemCat"   value="' + itemCat + '" >\n\
                                                                                        <input style="text-align:center;" class="input-mini form-control validate[] discount" autocomplete="off" maxlength="10"   type="hidden" onpaste="return false"  name="" id="discount"   value="' + discount + '" ><input class="madetory"  type="hidden"   name="" id="madetory"   value="' + madetory + '" ><input class="orderUomConversion"  type="hidden"   name="" id="orderUomConversion"   value="" ><input class=""  type="hidden"   name="" id="suppStatus"   value="' + suppStatus + '" >\n\
                                                                                        <td><button type="button" class="myButton2" style="text-align:center;width:134px;" onclick="cancelrecept(\'' + snos + '\',\'' + slNo + '\')"><i class="fa fa-times-circle"> Receipt Cancel</i></button></td>';

                                                                                    //<a href = "../inventory/cancelMR.htm?sno=' + snos + '&purchaseorderno=' + poNo + '" onclick="if(confirm("Do you really want to cancel this record?")){return true;}else{return false;}"><button type="button" class="myButton2" style="text-align:center;width:134px;"><i class="fa fa-times-circle"> Receipt Cancel</i></button></a>\n\
                                                                                    count1++;
                                                                                    //<td>'+xyz+'</td>\n\
                                                                                    //<td><input style="text-align:center;width:70px;" class="input-mini form-control validate[required] buff1" autocomplete="off" maxlength="10"   type="text" onpaste="return false"  name="" id="buf1"   value="" ></td>\n\
                                                                                    //<td><input style="text-align:center;width:70px;" class="input-mini form-control validate[required] buff2" autocomplete="off" maxlength="10"   type="text" onpaste="return false"  name="" id="buf2"   value="" ></td>\n\
                                                                                    //<td><input style="text-align:center;width:70px;" class="input-mini form-control validate[required] box" autocomplete="off" maxlength="10"   type="text" onpaste="return false"  name="" id="box"   value="" onkeypress="return check_digit(event, this, 2, 3);"></td>\n\
                                                                                    //<td><input style="text-align:center;width:70px;" class="input-mini form-control validate[required] puq" autocomplete="off" maxlength="10"   type="text" onpaste="return false"  name="" id="puq"   value="" onkeypress="return check_digit(event, this, 3, 3);"></td>\n\
                                                                                }, 300);

                                                                            }

                                                                            function cancelrecept(sno, snodet) {
                                                                                //alert(sno+"  "+snodet);

                                                                                if (confirm("Do you really want to cancel this record?")) {
                                                                                    //return true;

                                                                                    $.ajax({
                                                                                        type: "POST",
                                                                                        url: "../quality/cancelrecept.htm",
                                                                                        data: {sno: sno},
                                                                                        success: function (data) {
                                                                                            var table = document.getElementById("resourcetable1");
                                                                                            for (var i = 0; i < table.rows.length; i++) {
                                                                                                var lr = table.rows[i];
                                                                                                if (lr.id == 'list_tr_' + snodet) {
                                                                                                    table.deleteRow(i);
                                                                                                    return;
                                                                                                }
                                                                                            }
                                                                                        },
                                                                                        error: function (error) {
                                                                                            //alert(error);
                                                                                        }

                                                                                    });

                                                                                } else {
                                                                                    return false;
                                                                                }
                                                                            }


                                                                            function removeRow1(id) {
                                                                                var table = document.getElementById("resourcetable1");
                                                                                for (var i = 0; i < table.rows.length; i++) {
                                                                                    var lr = table.rows[i];
                                                                                    if (lr.id == 'list_tr_' + id) {
                                                                                        table.deleteRow(i);
                                                                                        return;
                                                                                    }
                                                                                }
                                                                            }

                                                                            function fetchUom() {

                                                                                //var storageId = obj;
                                                                                $.ajax({
                                                                                    type: "POST",
                                                                                    url: "../materialtype/fetchUom.htm",
                                                                                    data: {},
                                                                                    success: function (data) {
                                                                                        displayUoms(data);
                                                                                    },
                                                                                    error: function (error) {
                                                                                        alert(error);
                                                                                    }

                                                                                });
                                                                            }

                                                                            function displayUoms(data)
                                                                            {


                                                                                if (data != null)
                                                                                {

                                                                                    //$('#issueUom').html("");

                                                                                    var nameArray = data.split(",");
                                                                                    var toAppend = '';

                                                                                    toAppend += '<option value="">Select an Option</option>';
                                                                                    for (var i = 0; i < nameArray.length; i++) {
                                                                                        if (nameArray[i] != '' || nameArray[i] != null)
                                                                                            toAppend += '<option>' + nameArray[i] + '</option>';
                                                                                    }
                                                                                    $('.issueUom').append(toAppend);

                                                                                }
                                                                                else {
                                                                                    alert("error");
                                                                                }

                                                                            }

                                                                            function fetchRecUOM($this) {
                                                                                //                                                                                alert("run");

                                                                                var $itemRow = $($this).closest('tr');
                                                                                var poNo = $itemRow.find('#poNo1').val();
                                                                                var itemCode = $itemRow.find('#itemCode').val();
                                                                                var supplierCode = $itemRow.find('#supplierCode').val();
                                                                                var uom = $itemRow.find('#uom').val();
                                                                                var orderUomConv;
                                                                                //                                                                                alert(uom);
                                                                                //$itemRow.find('#revingUom').empty();

                                                                                $.ajax({
                                                                                    type: "POST",
                                                                                    async: "false",
                                                                                    url: '../quality/uomNew.htm',
                                                                                    data: {
                                                                                        poNo: poNo, itemCode: itemCode
                                                                                    },
                                                                                    success: function (uomList) {
                                                                                        //                                                                                        alert(uomList);

                                                                                        $.ajax({
                                                                                            type: "POST",
                                                                                            async: "false",
                                                                                            url: '../quality/itemSupplier.htm',
                                                                                            data: {
                                                                                                itemCode: itemCode, suppCode: supplierCode
                                                                                            },
                                                                                            success: function (itemSupp) {
                                                                                                //                                                                                                alert(itemSupp);
                                                                                                var itemSupps = itemSupp.split(",,");
                                                                                                var purPrice = itemSupps[2];
                                                                                                var uom1Price = itemSupps[3];
                                                                                                var uom2Price = itemSupps[4];
                                                                                                var uom3Price = itemSupps[5];

                                                                                                var uomLists = uomList.split(",,");

                                                                                                if (itemCode == uomLists[0]) {
                                                                                                    //                                                                                                    alert("uomLists" + uomLists[1]);
                                                                                                    if (uom == uomLists[1]) {
                                                                                                        orderUomConv = '1';
                                                                                                    }
                                                                                                    if (uom == uomLists[2]) {
                                                                                                        orderUomConv = uomLists[5];
                                                                                                    }
                                                                                                    if (uom == uomLists[3]) {
                                                                                                        orderUomConv = uomLists[6];
                                                                                                    }
                                                                                                    if (uom == uomLists[4]) {
                                                                                                        orderUomConv = uomLists[7];
                                                                                                    }
                                                                                                    //                                                                                                    alert("orderUomConv" + orderUomConv);

                                                                                                    $itemRow.find('#orderUomConversion').val(orderUomConv);

                                                                                                    var pUom = uomLists[1];
                                                                                                    var uom1 = uomLists[2];
                                                                                                    var uom2 = uomLists[3];
                                                                                                    var uom3 = uomLists[4];
                                                                                                    //alert(pUom + " " + uom1);
                                                                                                    var uom1Dropdown = '';
                                                                                                    if (pUom == uom1)
                                                                                                    {
                                                                                                        uom1Dropdown = uom1 + "-" + uom1Price + "-" + uomLists[5] + ":" + uom2 + "-" + uom2Price + "-" + uomLists[6] + ":" + uom3 + "-" + uom3Price + "-" + uomLists[7] + ":";
                                                                                                    }
                                                                                                    else if (pUom != uom1) {
                                                                                                        uom1Dropdown = pUom + "-" + purPrice + "-1:" + uom1 + "-" + uom1Price + "-" + uomLists[5] + ":" + uom2 + "-" + uom2Price + "-" + uomLists[6] + ":" + uom3 + "-" + uom3Price + "-" + uomLists[7] + ":";
                                                                                                    }
                                                                                                    //alert(uom1Dropdown);
                                                                                                    if (uom1Dropdown != null)
                                                                                                    {
                                                                                                        //$itemRow.find('#revingUom').html("");
                                                                                                        var toAppend = '';
                                                                                                        //$itemRow.find('#revingUom').empty();

                                                                                                        var nameArray = uom1Dropdown.split(":");
                                                                                                        var j = 0;
                                                                                                        toAppend += '<option value="">Select an Option</option>';
                                                                                                        for (var i = 0; i < nameArray.length; i++) {

                                                                                                            var dateParts = nameArray[j].split("-");

                                                                                                            if (dateParts[0] !== "") {
                                                                                                                if (dateParts[0] !== "null") {

                                                                                                                    toAppend += '<option  value="' + dateParts[0] + '-' + dateParts[1] + '-' + dateParts[2] + '">' + dateParts[0] + '</option>';
                                                                                                                    j++;
                                                                                                                }
                                                                                                            }
                                                                                                        }


                                                                                                        $itemRow.find('#revingUom').append(toAppend);

                                                                                                    }

                                                                                                }
                                                                                            }
                                                                                        });
                                                                                    }
                                                                                });
                                                                            }

                                                                            function  test($this) {
                                                                                var $itemRow = $($this).closest('tr');
                                                                                var recevingQty = $itemRow.find('#receivingQty').val();
                                                                                var pending = $itemRow.find('#orderQty').val() - $itemRow.find('#receivedQty').val();

                                                                                var orderUomConversion = $itemRow.find('#orderUomConversion').val();
                                                                                //                                                                                alert(orderUomConversion);
                                                                                var revingUom = $itemRow.find('#revingUom').val().split("-");
                                                                                var newQty = (recevingQty / revingUom[2]) * orderUomConversion;

                                                                                if (recevingQty === "0") {
                                                                                    alert("Invalid Quantity...!!");
                                                                                    $itemRow.find('#receivingQty').val('');
                                                                                    return false;
                                                                                }
                                                                                //else if (parseFloat(pending) < parseFloat(recevingQty)) {
                                                                                else if (parseFloat(pending) < parseFloat(newQty)) {
                                                                                    alert("Please check the pending quantity : Pending is " + pending);
                                                                                    $itemRow.find('#receivingQty').val('');
                                                                                    return true;

                                                                                }

                                                                            }

                                                                            function changeUnitPrice($this)
                                                                            {

                                                                                var $itemRow = $($this).closest('tr');
                                                                                $itemRow.find('#receivingQty').val('');
                                                                                var requisitionUom = $itemRow.find('#revingUom option:selected').val();
                                                                                var c = $itemRow.find('#itemCode').val();
                                                                                var suppCode = document.getElementById("supplierCode").value;
                                                                                //alert(requisitionUom);
                                                                                var unit = requisitionUom.split("-");
                                                                                var uom = unit[0];
                                                                                var uomConver = unit[2];
                                                                                //alert(uomConver);
                                                                                var ordUom = $itemRow.find('#uom').val();
                                                                                //            $itemRow.find('#orderUomConversion').val(uomConver);

                                                                                //alert(ordUom)
                                                                                var ordUomConver = "";
                                                                                $itemRow.find('#revingUom option').each(function () {

                                                                                    var curUom = $itemRow.find(this).val().split('-');
                                                                                    if (ordUom === curUom[0])
                                                                                    {
                                                                                        //alert(curUom[2]);
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
                                                                                        //alert(data)  
                                                                                        //$('#unitPrice' + slNo).val(data);
                                                                                        $itemRow.find('#unitPrice').val(data);

                                                                                    }

                                                                                });



                                                                            }


                                                                        </script>



                                                                    </table>


                                                                </div>
                                                            </div>


                                                           

<!--                                                            <div>                                            
                                                                <div style="float:left;" id="s_butt_id1"><span  id="" value="" data-text-original=""  class="btn btn-primary" tabindex="" onclick="addToGrid();">Add to Grid</span></div>
                                                            </div>



                                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                                <div class="x_panel" style="overflow-x:scroll">


                                                                    <table class="table table-striped responsive-utilities jambo_table bulk_action" id="itemsTable2">
                                                                        <thead>
                                                                            <tr class="">

                                                                                <th style="color:#fff;width:4%;border-bottom:1px solid transparent;background:#425567;color:#fff;"><i class="fa fa-trash"></i></th>
                                                                                <th class="column-title" style="width: 100px;border-bottom:1px solid transparent;background:#425567;color:#fff;">PO No</th>
                                                                                <th class="column-title" style="width: 100px;border-bottom:1px solid transparent;background:#425567;color:#fff;">purchase Type</th>
                                                                                <th class="column-title" style="width: 100px;border-bottom:1px solid transparent;background:#425567;color:#fff;">Invoice No</th>
                                                                                <th class="column-title" style="width: 100px;border-bottom:1px solid transparent;background:#425567;color:#fff;">Invoice Date</th>
                                                                                <th class="column-title" style="width: 100px;border-bottom:1px solid transparent;background:#425567;color:#fff;">Supplier Name</th>
                                                                                <th class="column-title" style="width: 100px;border-bottom:1px solid transparent;background:#425567;color:#fff;">Delivery Location</th>
                                                                                <th class="column-title" style="width: 100px;border-bottom:1px solid transparent;background:#425567;color:#fff;">Delivery Date</th>
                                                                                <th class="column-title" style="width: 100px;border-bottom:1px solid transparent;background:#425567;color:#fff;">Sub Category</th>
                                                                                <th class="column-title" style="width: 100px;border-bottom:1px solid transparent;background:#425567;color:#fff;">Item Code</th>
                                                                                <th class="column-title" style="width: 100px;border-bottom:1px solid transparent;background:#425567;color:#fff;">Item Name</th>
                                                                                <th class="column-title" style="width: 100px;border-bottom:1px solid transparent;background:#425567;color:#fff;">Item Desc</th>
                                                                                <th class="column-title" style="width: 100px;border-bottom:1px solid transparent;background:#425567;color:#fff;">Order Qty</th>
                                                                                <th class="column-title" style="width: 100px;border-bottom:1px solid transparent;background:#425567;color:#fff;">Ordered Price</th>
                                                                                <th class="column-title" style="width: 100px;border-bottom:1px solid transparent;background:#425567;color:#fff;">UOM</th>
                                                                                <th  colspan="4" class="column-title" style="background:#425567;color:#fff;">Quantity </th>

                                                                                <th class="column-title" style="width: 100px;border-bottom:1px solid transparent;background:#425567;color:#fff;">Batch No</th>
                                                                                <th class="column-title" style="width: 100px;border-bottom:1px solid transparent;background:#425567;color:#fff;">Expiry Date </th>

                                                                            </tr>
                                                                            <tr class="">


                                                                                <th style="color:#fff;width:4%;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th style="width: 100px;border:1px solid black;background:#425567;color:#fff;"></th>


                                                                                <th  style="width: 100px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th  style="width: 120px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th style="width: 100px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th  style="width: 250px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th  style="width: 100px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th  style="width: 100px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th  style="width: 150px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th  style="width: 100px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th  style="width: 100px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th  style="width: 150px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th  style="width: 50px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th  style="width: 50px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th  style="width: 50px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th  style="border:1px solid black;background:#425567;color:#fff;">Received</th>
                                                                                <th  style="border:1px solid black;background:#425567;color:#fff;">UOM</th>
                                                                                <th  style="border:1px solid black;background:#425567;color:#fff;">Receiving </th>
                                                                                <th  style="border:1px solid black;background:#425567;color:#fff;">FOC</th>

                                                                                <th  style="width: 70px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                <th style="width: 100px;border:1px solid black;background:#425567;color:#fff;"></th>
                                                                                                                                                        <th  style=" width: 106px;border:1px solid black;background:#425567;color:#fff;"></th>


                                                                            </tr>
                                                                        </thead>

                                                                        <tbody id="resourcetable2">



                                                                        </tbody>
                                                                        <script>
                                                                            var count2 = 0;

                                                                            function addToGrid() {
                                                                                var temp = 1;
                                                                                if ($("#selectedvalues:checked").length === 0) {
                                                                                    alert("Please select checkbox...!!")
                                                                                    return false;
                                                                                }
                                                                                else {
                                                                                    $("#selectedvalues:checked").each(function () {
                                                                                        var $itemRow1 = $(this).closest("tr");

                                                                                        if ($($itemRow1).find("#foc").val() == "") {
                                                                                            $($itemRow1).find("#foc").focus();
                                                                                            temp = 0;
                                                                                            return false;
                                                                                        }

                                                                                        if ($($itemRow1).find("#revingUom").val() == "") {
                                                                                            $($itemRow1).find("#revingUom").focus();
                                                                                            temp = 0;
                                                                                            return false;
                                                                                        }
                                                                                        if ($($itemRow1).find("#receivingQty").val() == "") {
                                                                                            $($itemRow1).find("#receivingQty").focus();
                                                                                            temp = 0;
                                                                                            return false;
                                                                                        }

                                                                                        if ($($itemRow1).find("#madetory").val() == "Yes") {

                                                                                            if ($($itemRow1).find("#batchNo").val() == "") {
                                                                                                $($itemRow1).find("#batchNo").focus();
                                                                                                temp = 0;
                                                                                                return false;
                                                                                            }

                                                                                            if ($($itemRow1).find("#expDate").val() == "") {
                                                                                                $($itemRow1).find("#expDate").focus();
                                                                                                temp = 0;
                                                                                                return false;
                                                                                            }

                                                                                        }


                                                                                    });

                                                                                }
                                                                                if (temp == 0) {
                                                                                    alert("Please fill mandatory Fields");
                                                                                    return false;
                                                                                }

                                                                                var table1 = document.getElementById("resourcetable1");
                                                                                var tbl1rowlen = table1.rows.length;

                                                                                var cpoNoArr = [];
                                                                                var cpurchaseTypeArr = [];
                                                                                var cinvoiceNoArr = [];
                                                                                var cinvoiceDateArr = [];
                                                                                var csupplierNameArr = [];
                                                                                var cdeliveryLocArr = [];
                                                                                var citemsubCatArr = [];
                                                                                var citemCodeArr = [];
                                                                                var citemNameArr = [];
                                                                                var corderQtyArr = [];
                                                                                var cunitPriceArr = [];
                                                                                var creceivedQtyArr = [];
                                                                                var creceivingQtyArr = [];
                                                                                //var cissueUomArr = [];
                                                                                //                                                                        var cboxArr = [];
                                                                                //                                                                        var cpuqArr = [];
                                                                                //                                                                        var cbuff1Arr = [];
                                                                                //                                                                        var cbuff2Arr = [];
                                                                                var cfocArr = [];
                                                                                var cuomArr = [];
                                                                                var cbatchNoArr = [];
                                                                                var cexpDateArr = [];
                                                                                var csupplierCodeArr = [];
                                                                                var cprojectCodeArr = [];
                                                                                var csnosArr = [];
                                                                                var citemCatArr = [];
                                                                                var citemDescArr = [];
                                                                                var cdiscountArr = [];
                                                                                var cdeliveryDateArr = [];
                                                                                var creceivingUomArr = [];
                                                                                var corderUomConversionArr = [];


                                                                                $(".poNo").each(function () {
                                                                                    var $itemRow = $(this).closest('tr');
                                                                                    if ($itemRow.find("#selectedvalues").prop('checked') == true) {
                                                                                        cpoNoArr.push($(this).val());
                                                                                    }

                                                                                });

                                                                                $(".purchaseType").each(function () {
                                                                                    var $itemRow = $(this).closest('tr');
                                                                                    if ($itemRow.find("#selectedvalues").prop('checked') == true) {
                                                                                        cpurchaseTypeArr.push($(this).val());
                                                                                    }

                                                                                });
                                                                                $(".invoiceNo").each(function () {
                                                                                    var $itemRow = $(this).closest('tr');
                                                                                    if ($itemRow.find("#selectedvalues").prop('checked') == true) {
                                                                                        cinvoiceNoArr.push($(this).val());
                                                                                    }

                                                                                });
                                                                                $(".invoiceDate").each(function () {
                                                                                    var $itemRow = $(this).closest('tr');
                                                                                    if ($itemRow.find("#selectedvalues").prop('checked') == true) {
                                                                                        cinvoiceDateArr.push($(this).val());
                                                                                    }

                                                                                });
                                                                                $(".supplierName").each(function () {
                                                                                    var $itemRow = $(this).closest('tr');
                                                                                    if ($itemRow.find("#selectedvalues").prop('checked') == true) {
                                                                                        csupplierNameArr.push($(this).val());
                                                                                    }

                                                                                });
                                                                                $(".deliveryLoc").each(function () {
                                                                                    var $itemRow = $(this).closest('tr');
                                                                                    if ($itemRow.find("#selectedvalues").prop('checked') == true) {
                                                                                        cdeliveryLocArr.push($(this).val());
                                                                                    }

                                                                                });
                                                                                $(".itemsubCat").each(function () {
                                                                                    var $itemRow = $(this).closest('tr');
                                                                                    if ($itemRow.find("#selectedvalues").prop('checked') == true) {
                                                                                        citemsubCatArr.push($(this).val());
                                                                                    }

                                                                                });
                                                                                $(".itemCode").each(function () {
                                                                                    var $itemRow = $(this).closest('tr');
                                                                                    if ($itemRow.find("#selectedvalues").prop('checked') == true) {
                                                                                        citemCodeArr.push($(this).val());
                                                                                    }

                                                                                });
                                                                                $(".itemName").each(function () {
                                                                                    var $itemRow = $(this).closest('tr');
                                                                                    if ($itemRow.find("#selectedvalues").prop('checked') == true) {
                                                                                        citemNameArr.push($(this).val());
                                                                                    }

                                                                                });
                                                                                $(".orderQty").each(function () {
                                                                                    var $itemRow = $(this).closest('tr');
                                                                                    if ($itemRow.find("#selectedvalues").prop('checked') == true) {
                                                                                        corderQtyArr.push($(this).val());
                                                                                    }

                                                                                });
                                                                                $(".unitPrice").each(function () {
                                                                                    var $itemRow = $(this).closest('tr');
                                                                                    if ($itemRow.find("#selectedvalues").prop('checked') == true) {
                                                                                        cunitPriceArr.push($(this).val());
                                                                                    }

                                                                                });
                                                                                $(".receivedQty").each(function () {
                                                                                    var $itemRow = $(this).closest('tr');
                                                                                    if ($itemRow.find("#selectedvalues").prop('checked') == true) {
                                                                                        creceivedQtyArr.push($(this).val());
                                                                                    }

                                                                                });
                                                                                $(".receivingQty").each(function () {
                                                                                    var $itemRow = $(this).closest('tr');
                                                                                    if ($itemRow.find("#selectedvalues").prop('checked') == true) {
                                                                                        creceivingQtyArr.push($(this).val());
                                                                                    }

                                                                                });
                                                                                //                                                                       
                                                                                $(".foc").each(function () {
                                                                                    var $itemRow = $(this).closest('tr');
                                                                                    if ($itemRow.find("#selectedvalues").prop('checked') == true) {
                                                                                        cfocArr.push($(this).val());
                                                                                    }

                                                                                });
                                                                                $(".uom").each(function () {
                                                                                    var $itemRow = $(this).closest('tr');
                                                                                    if ($itemRow.find("#selectedvalues").prop('checked') == true) {
                                                                                        cuomArr.push($(this).val());
                                                                                    }

                                                                                });
                                                                                $(".batchNo").each(function () {
                                                                                    var $itemRow = $(this).closest('tr');
                                                                                    if ($itemRow.find("#selectedvalues").prop('checked') == true) {
                                                                                        if (($(this).val()) === "") {
                                                                                            cbatchNoArr.push("N/A");
                                                                                        } else {
                                                                                            cbatchNoArr.push($(this).val());
                                                                                        }
                                                                                    }

                                                                                });
                                                                                $(".expDate").each(function () {
                                                                                    var $itemRow = $(this).closest('tr');
                                                                                    //alert($itemRow);
                                                                                    if ($itemRow.find("#selectedvalues").prop('checked') == true) {
                                                                                        if (($(this).val()) === "") {
                                                                                            cexpDateArr.push("N/A");
                                                                                        } else {
                                                                                            cexpDateArr.push($(this).val());
                                                                                        }
                                                                                    }

                                                                                });
                                                                                $(".supplierCode").each(function () {
                                                                                    var $itemRow = $(this).closest('tr');
                                                                                    if ($itemRow.find("#selectedvalues").prop('checked') == true) {
                                                                                        csupplierCodeArr.push($(this).val());
                                                                                    }

                                                                                });
                                                                                $(".projectCode").each(function () {
                                                                                    var $itemRow = $(this).closest('tr');
                                                                                    if ($itemRow.find("#selectedvalues").prop('checked') == true) {
                                                                                        cprojectCodeArr.push($(this).val());
                                                                                    }

                                                                                });
                                                                                $(".snos").each(function () {
                                                                                    var $itemRow = $(this).closest('tr');
                                                                                    if ($itemRow.find("#selectedvalues").prop('checked') == true) {
                                                                                        csnosArr.push($(this).val());
                                                                                    }

                                                                                });
                                                                                $(".itemCat").each(function () {
                                                                                    var $itemRow = $(this).closest('tr');
                                                                                    if ($itemRow.find("#selectedvalues").prop('checked') == true) {
                                                                                        citemCatArr.push($(this).val());
                                                                                    }

                                                                                });
                                                                                $(".itemDesc").each(function () {
                                                                                    var $itemRow = $(this).closest('tr');
                                                                                    if ($itemRow.find("#selectedvalues").prop('checked') == true) {
                                                                                        citemDescArr.push($(this).val());
                                                                                    }

                                                                                });
                                                                                $(".discount").each(function () {
                                                                                    var $itemRow = $(this).closest('tr');
                                                                                    if ($itemRow.find("#selectedvalues").prop('checked') == true) {
                                                                                        cdiscountArr.push($(this).val());
                                                                                    }

                                                                                });
                                                                                $(".deliveryDate").each(function () {
                                                                                    var $itemRow = $(this).closest('tr');
                                                                                    if ($itemRow.find("#selectedvalues").prop('checked') == true) {
                                                                                        cdeliveryDateArr.push($(this).val());
                                                                                    }

                                                                                });
                                                                                $(".revingUom").each(function () {
                                                                                    var $itemRow = $(this).closest('tr');
                                                                                    if ($itemRow.find("#selectedvalues").prop('checked') == true) {
                                                                                        creceivingUomArr.push($(this).val());
                                                                                    }

                                                                                });
                                                                                $(".orderUomConversion").each(function () {
                                                                                    var $itemRow = $(this).closest('tr');
                                                                                    if ($itemRow.find("#selectedvalues").prop('checked') == true) {
                                                                                        corderUomConversionArr.push($(this).val());
                                                                                    }

                                                                                });


                                                                                var table2 = document.getElementById("resourcetable2");
                                                                                //
                                                                                var table2rowlen = table2.rows.length;
                                                                                var i;
                                                                                var len = $("#selectedvalues:checked").length;
                                                                                //(parseInt(table2rowlen) + parseInt(tbl1rowlen))
                                                                                for (var j = 0, i = parseInt(table2rowlen); i < (parseInt(table2rowlen) + parseInt(len)); i++, j++) {

                                                                                    var tr2 = table2.insertRow(i.length);

                                                                                    var slNo2 = count2;
                                                                                    tr2.id = 'list_tr_' + i;
                                                                                    tr2.innerHTML = '<td align="center" class="tinput"><button type="button" class="fa fa-trash-o" onclick="removeRow2(' + slNo2 + ')" ></button> \n\
                                                                                                </td><td><input class="form-control " style="text-align:left;width:100px" type="text" readonly id="pono2" name="poNo" value="' + cpoNoArr[j] +
                                                                                            '"/></td><td><input class="form-control " style="text-align:left;width:100px" type="text" readonly name="purchaseType" value="' + cpurchaseTypeArr[j] +
                                                                                            '"/></td><td><input class="form-control " style="text-align:left;width:100px" type="text" readonly name="invoiceNo" value="' + cinvoiceNoArr[j] +
                                                                                            '"/></td><td><input class="form-control " style="text-align:left;width:100px" type="text" readonly name="invoiceDate" value="' + cinvoiceDateArr[j] +
                                                                                            '"/></td><td><input class="form-control " style="text-align:left;width:200px" type="text" readonly name="supplierName" value="' + csupplierNameArr[j] +
                                                                                            '"/></td><td><input class="form-control " style="text-align:left;width:150px" type="text" readonly name="shipToLocation" value="' + cdeliveryLocArr[j] +
                                                                                            '"/></td><td><input class="form-control " style="text-align:left;width:150px" type="text" readonly name="deliveryDate" value="' + cdeliveryDateArr[j] +
                                                                                            '"/></td><td><input class="form-control " style="text-align:left;width:150px" type="text" readonly name="itemSubCategory" value="' + citemsubCatArr[j] +
                                                                                            '"/></td><td><input class="form-control " style="text-align:left;width:100px" type="text" readonly id="itmCode2" name="itemCode" value="' + citemCodeArr[j] +
                                                                                            '"/></td><td><input class="form-control " style="text-align:left;width:210px" type="text" readonly id="" name="itemName" value="' + citemNameArr[j] +
                                                                                            '"/></td><td><input class="form-control " style="text-align:left;width:210px" type="text" readonly id="" name="itemDesc" value="' + citemDescArr[j] +
                                                                                            '"/></td><td><input style="text-align:right;width:70px;" class="input-mini form-control  type="text" readonly name="orderQty" id=""   value="' + corderQtyArr[j] +
                                                                                            '" ></td><td><input style="text-align:right;width:70px;" class="input-mini form-control  type="text" readonly name="unitPrice" id=""   value="' + cunitPriceArr[j] +
                                                                                            '" ></td><td><input style="text-align:center;width:80px;" class="input-mini form-control validate[required]" autocomplete="off" maxlength="10"   type="text"  name="revingUom" id="" readonly value="' + creceivingUomArr[j] + '" /></td><td><input style="text-align:right;width:70px;" class="input-mini form-control" type="text"  name="receivedQty" readonly id=""  value="' + creceivedQtyArr[j] +
                                                                                            '" ></td><td><input style="text-align:left;width:80px;" class="input-mini form-control" type="text" readonly  name="uom" id=""   value="' + cuomArr[j] + '" ></td><td><input style="text-align:right;width:70px;" class="input-mini form-control" type="text"  readonly name="recevingQty" id=""  value="' + creceivingQtyArr[j] +
                                                                                            '" ></td><td><input style="text-align:right;width:70px;" class="input-mini form-control" type="text"  readonly name="foc" id=""   value="' + cfocArr[j] +
                                                                                            '" ></td>\n\
                                                                                            <td><input style="text-align:left;width:100px;" class="input-mini form-control" type="text" readonly  name="batchNo" id=""   value="' + cbatchNoArr[j] + '" ></td>\n\
                                                                                            <td><input style="text-align:left;width:100px;" class="input-mini form-control" type="text"  readonly name="expDate" id=""   value="' + cexpDateArr[j] + '" ></td>\n\
                                                                                                <input style="text-align:center;" class="input-mini form-control"   type="hidden"   name="supplierCode" id=""   value="' + csupplierCodeArr[j] +
                                                                                            '" ><input style="" class="input-mini form-control"   type="hidden"   name="projectCode" id=""   value="' + cprojectCodeArr[j] +
                                                                                            '" ><input style="" class="input-mini form-control"   type="hidden"   name="snos" id=""   value="' + csnosArr[j] +
                                                                                            '" ><input style="" class="input-mini form-control"   type="hidden"   name="itemCat" id=""   value="' + citemCatArr[j] +
                                                                                            '" ><input style="" class="input-mini form-control"   type="hidden"   name="discount" id=""   value="' + cdiscountArr[j] +
                                                                                            '"><input style="" class="input-mini form-control"   type="hidden"   name="orderUomConversion" id=""   value="' + corderUomConversionArr[j] +
                                                                                            '" >';
                                                                                    count2++;
                                                                                }

                                                                                table1.innerHTML = "";
                                                                                $("#selectall").prop('checked', false);

                                                                            }
                                                                            function removeRow2(id) {
                                                                                var table = document.getElementById("resourcetable2");
                                                                                for (var i = 0; i < table.rows.length; i++) {
                                                                                    var lr = table.rows[i];
                                                                                    if (lr.id == 'list_tr_' + id) {
                                                                                        table.deleteRow(i);
                                                                                        return;
                                                                                    }
                                                                                }
                                                                            }

                                                                        </script>



                                                                    </table>


                                                                </div>
                                                            </div>-->

                                                            <!-- price element -->       

                                                           

                                                             <div class="col-md-9 col-sm-9 mt-3 col-xs-12 col-md-offset-5">
                                                               
                                                                   
                                                                    <input id="saveInvoiceBtn" class="btn btn-primary" name="saveInvoice" value="Save" type="submit">

                                                                    <a href="../quality/receiptList.htm" class="btn btn-danger">Cancel</a> 
                                                            
                                                            </div>
                                                        </div>


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
        <script>
            //window.onload = minRentGen();
        </script>
<jsp:include page="../login/footer.jsp"/>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha256-bqVeqGdJ7h/lYPq6xrPv/YGzMEb6dNxlfiTUHSgRCp8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js" integrity="sha512-DNeDhsl+FWnx5B1EQzsayHMyP6Xl/Mg+vcnFPXGNjUZrW28hQaa1+A4qL9M+AiOMmkAhKAWYHh1a+t6qxthzUw==" crossorigin="anonymous"></script>
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

