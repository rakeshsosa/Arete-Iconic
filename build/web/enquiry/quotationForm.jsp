<%-- 
    Document   : quotationForm
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
        <!--<script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>-->
        <script type="text/javascript" src="../purchOrder/datepicker/datetimepicker_css.js"></script>
        <script src="../common/validate/Check_Digit.js" type="text/javascript"></script>


        <link rel="stylesheet" href="../common/validate/validationEngine.jquery.css" type="text/css"/>	
        <script src="../common/validate/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8">
        </script>
        <script src="../common/validate/jquery.validationEngine.js" type="text/javascript" charset="utf-8">
        </script>
    </head>


    <body class="nav-sm">
        <% Date date = new Date();%>

        <div class="container body">


            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <div class="clearfix"></div>
                        <form id="quotform" class="form-inline" method="post" action="../purchase/quotSubmit.htm" enctype="multipart/form-data" onsubmit="return checkQuotno();">
                            <div class="col-md-6 col-xs-12">
                                <div class="x_panel">                             
                                    <jsp:include page="../login/headerlink.htm?submodule=Supplier Quotation&tab=Supplier Quotation&pagetype=form"/>
                                    <div class="x_title">
                                        <h2>
                                            Quotation
                                        </h2>
                                        <div class="clearfix">


                                        </div>
                                    </div>

                                    <c:set var="m" value="0"/>
                                    <c:forEach items="${supplierEnqList}" var="list">
                                        <%--<c:if test="${m eq 0}">--%>
                                        <c:if test="${list.supplierMailId ne ''}">
                                            <c:set var="m" value="1"/>
                                            <c:set var="prCode" value="${list.projectCode}"/>
                                            <c:set var="reqno" value="${list.prNo}"/>
                                            <c:set var="reqDate" value="${list.prDate}"/>
                                            <c:set var="enqno" value="${list.enquiriesNo}"/>
                                            <c:set var="enqdate" value="${list.enquiriesDate}"/>
                                            <c:set var="supplierMailId" value="${list.supplierMailId}"/>                                            
                                            <c:set var="deliveryLoc" value="${list.deliveryLocation}"/>
                                        </c:if>
                                        <%--</c:if>--%>
                                    </c:forEach>

                                    <c:forEach items="${supplierList}" var="supp">
                                        <c:if test="${supp.mailId eq supplierMailId}">
                                            <c:set var="supname" value="${fn:escapeXml(supp.supplierName)}"/>
                                            <c:set var="supadd" value="${supp.supplierAddress}"/>
                                            <c:set var="supcode" value="${supp.supplierCode}"/>
                                            <c:set var="payTerms" value="${supp.paymentTerms}"/>
                                            <c:set var="delTerms" value="${supp.deliveryTerms}"/>
                                        </c:if>
                                    </c:forEach>
                                    <!--<div class="x_content">-->
                                    <br />


<!--                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                        <label class="control-label" for="selectError">&nbsp;&nbsp;Project Code</label>

                                        <input class="form-control" id="projectCode" name="projectCode" readonly type="text" value="${prCode}">

                                    </div>                                      -->

                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                        <label class="control-label" for="selectError">&nbsp;&nbsp; Requisition No</label>

                                        <input class="form-control validate[required]" id="reqNo" name="reqNo" readonly type="text" value="${reqno}">
                                        <input name="reqDate" type="hidden" value="<fmt:formatDate pattern="dd-MMM-yyyy hh:mma" value="${reqDate}"/>" tabindex="-1"/>
                                        <input id="reqNo" name="reqNo" type="hidden" value="${reqno}">
                                    </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                        <label class="control-label" for="selectError" >&nbsp;&nbsp; Enquiry No</label>

                                        <input class="form-control validate[required]" id="enqNo" name="enqNo" readonly type="text" value="${enqno}">
                                        <input id="enqDate" name="enqDate" type="hidden" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${enqdate}" />">

                                    </div>

                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                        <label class="control-label" ><span style="color: red">*</span> Supplier Name</label>

                                        <input class="form-control validate[required]" id="supName" name="supName" readonly type="text" value="${supname}" placeholder="Select supplier" onclick="openWindow();">
                                        <input id="supName1" name="supplier" type="hidden" value="">
                                        <input id="supEmail" name="supEmail" type="hidden" value="${supplierMailId}">
                                        <input id="supId" name="supplierCode" type="hidden" value="${supcode}">

                                    </div>
                                        <p>&nbsp;</p>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                        <label class="control-label" for="selectError" style="margin-top:-36px;" >&nbsp;&nbsp;Supplier Address</label>

                                        <textarea readonly id="supaddress" placeholder="Auto map" name="supaddress" class="form-control"  style="resize: none;">${supadd}</textarea>

                                    </div>



                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                        <label class="control-label" for="selectError"><span style="color: red">*</span> Quotation No</label>

                                        <input class="form-control validate[required]" autocomplete="off"  id="quoNo" name="quoNo"  type="text" value="" onchange="checkQuotno();" maxlength="15">

                                    </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                        <label class="control-label" >&nbsp;&nbsp;Quotation Date</label>

                                        <input class="form-control validate[required]" id="quoDate" name="quoDate" readonly type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="<%=date%>" />" onclick="NewCssCal('quoDate', 'ddMMMyyyy', '', '', '', '', '');">

                                    </div>
                                        <p>&nbsp;</p>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                        <label class="control-label" for=""><span style="color: red">*</span> Payment Terms</label>

                                        <!--<input class="form-control" id="payTerms" name="payTerms"  type="text" value="${payTerms}" maxlength="80">-->
                                        <select  id="payTerms" name="payTerms" data-rel="chosen"  class="form-control  validate[required]" >
                                            <option value="" disabled="" selected>Select your option</option>
                                             <c:forEach items="${paytermslist}" var="list">
                                                <option value="${list.termName}">${list.termName}</option> 
                                            </c:forEach>
                                        </select>  

                                    </div>                                       
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                        <label class="control-label" ><span style="color: red">*</span> Delivery Terms</label>
                                         <!--<input class="form-control" id="delTerms" name="delTerms"  type="text" value="${delTerms}"  maxlength="80">-->
                                        <select  id="delTerms" name="delTerms" data-rel="chosen"  class="form-control  validate[required]" >
                                            <option value="" disabled="" selected>Select your option</option>

                                            <c:forEach items="${delivtermslist}" var="list">
                                                <option value="${list.termName}">${list.termName}</option> 
                                            </c:forEach>
                                        </select>  

                                        <input class="form-control" id="" name="deliveryLoc"  type="hidden" value="${deliveryLoc}">

                                    </div>
                                    
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                        <label class="control-label">&nbsp;&nbsp;Special<br/>&nbsp; Specification</label>

                                        <textarea name="specialSpec"  style="resize: none;" class="form-control" rows="1" placeholder="" id="specialSpec" maxlength="120"></textarea>

                                    </div>
                                        <p>&nbsp;</p>

                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                        <label class="control-label" >&nbsp;&nbsp;&nbsp;Attachment</label>
                                        <div  class="" style=" border:none;background:#f7f9fa;">
                                            <input class=" input-file uniform_on" style="background:#f7f9fa;border:none;margin-left:128px; margin-top:-22px;font-size: 14px;"  id="quotfile" type="file" value="" name="quotfile" onchange="Validate(this)">
                                        </div>
                                    </div>       
                                    <p>&nbsp;</p>
                                    <div class="clearfix">
                                        <p>&nbsp;</p>
                                        <div style="overflow: scroll;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">
                                            <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                                <thead>
                                                    <tr class="headings">  
                                                        <th><i class="fa fa-trash"></i></th>
                                                        <th style="width:150px;">Item<br/> SubCategory</th>
                                                        <th>Item Code</th>
                                                        <th style="width:500px;">Item Name</th>
                                                        <th style="width:200px;">Item Desc</th>

                                                        <th>Quantity</th>
                                                        <th>Unit</th>
                                                        <th style=""><span style="color: red">*</span> Unit Price</th>
                                                        <th style="">Total Amount</th>
                                                        <!--                                                        <th style="width:90px;"><span style="color: red">*</span> Discount(%)</th>
                                                                                                                <th style="width:90px;"><span style="color: red">*</span> Unit Price</th>
                                                                                                                <th>Total Price</th>-->
                                                        <th style=""><span style="color: red">*</span> Discount<br/>(%)</th>
                                                        <th style=""><span style="color: red">*</span> Discount Amount</th>                                                 
                                                        <th style="">Total Amount After Discount</th>    
                                                        <th style=""><span style="color: red">*</span> Delivery<br/> Date</th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <c:forEach items="${supplierEnqList}" var="type"> 
                                                        <tr id="quotPoForm" class="poadditem">
                                                            <td><button type="button" onclick="deleteRow(this);" ><i id="deleteRow" class="fa fa-trash-o"></i></button></td>
                                                            <td style="width:150px;">${type.itemSubCategory}</td>
                                                            <td>
                                                                <input type="hidden" name="prSno" value="${type.prSno}"/>
                                                                <input type="hidden" name="enqSno" value="${type.SNo}"/> 
                                                                <input type="hidden" name="division" id="division" value="${type.divisionName}">
                                                                <input  name="prName" type="hidden" value="${type.projectName}">
                                                                <input type="hidden" name="unit" value="${type.unit}"/>                                                
                                                                <input name="itemCat"  type="hidden" value="${type.itemCategory}"> 
                                                                <input name="itemsubCat"   type="hidden" value="${type.itemSubCategory}">                                                
                                                                <input  type="hidden" name="purchaseType" id="purchaseType" value="${type.purchaseType}">
                                                                <input type="hidden"  name="dept" value="${type.department}"> 
                                                                <input class="form-control" id="" readonly="" name="itemDesc"  type="hidden" value="${fn:escapeXml(type.description)}">
                                                                ${type.itemCode}
                                                                <input class="form-control" id="itemCode" name="itemCode"  type="hidden" value="${type.itemCode}">
                                                            </td> 
                                                            <td style="width: 500px">${type.itemName}
                                                                <input class="form-control" id="" name="itemName"  type="hidden" value="${fn:escapeXml(type.itemName)}"></td>  

                                                            <td style="width:200px;">${type.description}</td>

                                                            <td class="right">${type.quantity}
                                                                <input class="form-control  input-mini validate[required,notzero,custom[float5]]" onpaste="return false" required="" name="qty" id="qty" onkeypress="return check_digit(event, this, 10, 3);"  type="hidden" readonly="" value="${type.quantity}"></td>                                           
                                                            <td>${type.unit}</td>
                                                            <td><input style="width: 80px;" class="right form-control  input-mini validate[required,custom[notzero],custom[float5]]" onpaste="return false"  autocomplete="off" onkeypress="return check_digit(event, this, 6, 3);" name="price" id="price" type="text" value=""></td>
                                                            <td><input style="text-align:right;width:55px;" class="form-control  input-mini  validate[required]" type="text" readonly onpaste="return false" name="befdisc"  id="befdisc"  value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${qty*unitPrice}"/>" ></td>
                                                            <td style=""><input style="width: 75px;text-align:right;" class="form-control  input-mini  validate[required,custom[float5]]"  onpaste="return false" autocomplete="off" id="discount1" onkeypress="return check_digit(event, this, 2, 3);" type="text"  value="0.000"maxlength="6">
                                                                <input style="width: 60px;text-align:right;"  onpaste="return false" autocomplete="off" name="discount" id="discount" type="hidden" value="">
                                                            </td>
                                                            <td><input style="text-align:right;width:60px;" class="form-control  input-mini  validate[required,custom[float5]]" type="text" onpaste="return false" autocomplete="off" name="discountPrice"  id="discountPrice" onkeypress="return check_digit(event, this, 10, 3);"  value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value=""/>"></td>
                                                            <!--                                                            <td><input style="width: 80px;" class="right form-control  input-mini validate[required]" onpaste="return false"  autocomplete="off" name="discount" id="discount" onkeypress="return check_digit(event, this, 2, 2);" type="text" value="0.0"></td>-->
                                                            <td style=""><input style="width:60px;" class="right form-control  input-mini" id="total" name="total" type="text" value="" readonly=""></td>
                                                            <td><input style="width: 85px;text-align:left;" class=" form-control input-small validate[required]" name="delDate" readonly="" id="${type.SNo}" type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.requiredDate}"/>" onclick="javascript:NewCssCal('${type.SNo}', 'ddMMMyyyy', '', '', '', '', 'future')" onchange="validateDate(this.value, '${type.itemCode}', '${type.SNo}')">
                                                                <input style="text-align:center;" type="hidden" name="reqDateSno" id="reqDateSno" value="${type.SNo}"/></td>

                                                        </tr>
                                                    </c:forEach> 


                                                </tbody>

                                            </table>
                                        </div>
                                    </div>                                          



                                    <br/>
                                    <c:if test="${action ne 'view'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12">
                                            <div class="col-md-9 col-sm-9 col-xs-12">

                                                <button type="submit" class="btn btn-primary" style="" name="commit" onmouseover="checkQuotno();">Save</button>
                                                <a href="../purchase/enquiredList.htm"><button type="button" class="btn btn-danger" style="">Cancel</button></a> 

                                            </div>
                                        </div>
                                    </c:if>
                                    <br/>









                                    <div class="clearfix"></div>

                                    <div class="clearfix"></div>                

                                    <!-- /page content -->


                                    <!--</div>--> 
                                </div>
                            </div>
                        </form>
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
        <script>
            $(document).ready(function () {
//                gridEditArrowKey();
                $('#quotform').validationEngine();
                // alert("Dd");
            });

            function Validate($this)
            {
                var fl = document.getElementById("quotfile").value;
                var fileSize = $this.files[0];
                var sizeInMb = fileSize.size / 1024;
                var sizeLimit = 1024 * 2;
                if (sizeInMb > sizeLimit) {
                    alert("File Size Exceeded(Only 2MB Allowed)");
                    $($this).val('');
                    return;
                }
                var fmt = /^.*\.(jpg|JPG|gif|GIF|png|PNG|jpeg|JPEG|xls|XLS|xlsx|XLSX|doc|DOC|docx|DOCX|pdf|PDF)$/;
                if (!fl.match(fmt))
                {
                    alert('Invalid File');
                    $($this).val('');
                    return false;
                } else {
                    return true;
                }

            }
            function deleteRow(row) {

                var rowCount = $('#example tr').length;
                var i = row.parentNode.parentNode.rowIndex;
                if (rowCount != 2) {
                    document.getElementById("example").deleteRow(i);
                    return true;
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

//            jQuery(document).ready(function () {
//                var inputval = '#qty, #discount,#price';
//                $(inputval).on('keyup click', function () {
//                    var quotNo = $('#quoNo').val();
//                    if (quotNo === '')
//                    {
//                        alert("Please enter quotation number..!!");
//                        $('#quoNo').focus();
//                        return false;
//                    }
//                    var $itemRow = $(this).closest('tr');
//                    var z = $itemRow.find('#qty').val();
//                    var zz = $itemRow.find('#price').val();
//                    var ccc = $itemRow.find('#discount').val();
//                    var discount = $itemRow.find('#qty').val() * $itemRow.find('#price').val() * (1 - $itemRow.find('#discount').val() / 100);
//                    var discountfinal = roundNumber(discount, 2);
//                    isNaN(discount) ? $itemRow.find('#total').val("N/A") : $itemRow.find('#total').val(parseFloat(discountfinal).toFixed(3));
//                });
//            });
            function roundNumber(number, decimals) {
                //If it's not already a String
                var num2 = Math.floor(number * 1000) / 1000;
                return num2;
            }
            function openWindow() {

                myWindow = window.open("../purchase/selectSuppnamePopup.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
//            function check_digit(e, obj, intsize, deczize) {
//
//                var keycode;
//
//                if (window.event)
//                    keycode = window.event.keyCode;
//
//                else if (e) {
//                    keycode = e.which;
//                } else {
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
//
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
//
//                    var splitfield = fieldval.split(".");
//                    if (splitfield[1].length >= deczize && keycode != 8 && keycode != 0)
//                        return false;
//                } else if (fieldval.length >= intsize && keycode != 46) {
//                    return false;
//                } else {
//                    return true;
//                }
//            }

            function checkQuotno()
            {
                var quotNo = $('#quoNo').val();
                $.ajax
                        ({
                            type: "POST",
                            url: '../purchase/chkQuotno.htm',
                            data: {
                                quotNo: quotNo
                            },
                            success: function (data) {
                                if ($.trim(data) === 'Already Exists.Enter another')
                                {
                                    alert("This Record Already Exist");
                                    $('#quoNo').val('');
                                    $('#quoNo').focus();
                                    return false;
                                }
                            }
                        });
            }
            function terms(payTerms, delTerms) {
                $('#payTerms').append('<option selected value="' + payTerms + '">' + payTerms + '</option>');
                $('#delTerms').append('<option selected value="' + delTerms + '">' + delTerms + '</option>');
            }

            function validateDate(reqdate, itemcd, slno) {
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

        </script>

        <script>
            jQuery(document).ready(function () {

                formmodified = 0;
                $('form *').change(function () {
                    formmodified = 1;
                });
                window.onbeforeunload = confirmExit;
                function confirmExit() {
                    if (formmodified == 1) {
                        return "New information not saved. Do you wish to leave the page?";
                    }
                }
                $("button[name='commit']").click(function () {
                    formmodified = 0;
                });

                updateGrandTotal(); // when page refresh the page it will call the function.
                $('#quotform').validationEngine();
                var inputval = '#qty, #discount,#price';
                $(document).on('input', inputval, function () {
                    var quotNo = $('#quoNo').val();
                    if (quotNo === '')
                    {
                        $(this).val('');
                        alert("Please enter quotation number..!!");
                        $('#quoNo').focus();
                        return false;
                    }
                    updateGrandTotal();

                });
                $(document).on('input', '#discountPrice', function () {
                    var quotNo = $('#quoNo').val();
                    if (quotNo === '')
                    {
                        $(this).val('');
                        alert("Please enter quotation number..!!");
                        $('#quoNo').focus();
                        return false;
                    }
                    caldiscountPrice(this);
                });
                $(document).on('input', '#discount1', function () {
                    var quotNo = $('#quoNo').val();
                    if (quotNo === '')
                    {
                        $(this).val('');
                        alert("Please enter quotation number..!!");
                        $('#quoNo').focus();
                        return false;
                    }

                    var $itemRow = $(this).closest('tr');
                    $itemRow.find('#discount').val(this.value);
                    var befdiscount = $itemRow.find('#befdisc').val();
                    var discount = $itemRow.find('#qty').val() * $itemRow.find('#price').val() * (1 - $itemRow.find('#discount').val() / 100);
//                                      var discountfinal = roundNumber(discount, 2);
                    var disPrice = parseFloat(befdiscount).toFixed(3) - parseFloat(discount).toFixed(3);

                    $itemRow.find('#discountPrice').val(parseFloat(disPrice).toFixed(3));
                    var dis = $itemRow.find('#discount').val();

                    if (parseFloat(dis) >= 100)
                    {
                        alert("Discount(%) should be less than 100 !!!");
                        $itemRow.find('#discount').val("0.0");
                        $itemRow.find('#discount1').val("0.0");
                        $itemRow.find('#discountPrice').val("0.000");
                    }



                    priceCalcute(this);


                });

                $(document).on('input', '#lumsumdiscount1', function () {
                    var gt = 0;
                    var totalAmt = 0;
                    $('#lumsumdiscount').val(this.value);
                    var lumsumdiscount = $('#lumsumdiscount').val();


                    $('tr#quotPoForm').each(function () {
                        var $itemRow = $(this).closest('tr');
                        var total = $itemRow.find('#total').val();
                        alert(total);
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
                            $('#lumsumdiscount').val('0.0');
                            $('#lumsumdiscount1').val('0.0');
                            lumsumCalculate();
                            return false;
                        } else
                        {
                            var lumsumdis = (parseFloat(lumsumamt).toFixed(3) / parseFloat(gt).toFixed(3)) * 100;
                            $('#lumsumdiscount').val(lumsumdis);
                            $('#lumsumdiscount1').val(parseFloat(lumsumdis).toFixed(3));
                            lumsumCalculate();
                        }

                    }


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

            function  priceCalcute($this)
            {
                var gt = 0;
                var totalbefdisc = 0;
                var totaldiscAmt = 0;
                var $itemRow = $($this).closest('tr');
                var z = $itemRow.find('#qty').val();
                var price = $itemRow.find('#price').val();
                var ccc = $itemRow.find('#discount').val();

//                    var lumsumdiscount = $('#lumsumdiscount').val();
//                    var convFact = $itemRow.find('#requisitionUom').val();
//                    var conVal = convFact.split("-");
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
                    var tda = $itemRow.find('#discountPrice').val();
                    totalbefdisc = parseFloat(tbd) + parseFloat(totalbefdisc);
                    totaldiscAmt = parseFloat(tda) + parseFloat(totaldiscAmt);
                    gt = parseFloat(total) + parseFloat(gt);
                });
                $('#totalAmtBefDis').val(parseFloat(totalbefdisc).toFixed(3));
                $('#totalDisAmt').val(parseFloat(totaldiscAmt).toFixed(3));
                $('#totalAmt').val(parseFloat(gt).toFixed(3));
//                    gt = gt * (1 - lumsumdiscount / 100)
//                    var lumsumAmt = parseFloat($('#totalAmt').val()).toFixed(3) - parseFloat(gt).toFixed(3)
//                    $('#lumsumamt').val(parseFloat(lumsumAmt).toFixed(3));
//                    $('#grandTotal').val(parseFloat(gt).toFixed(3));

            }

            function updateGrandTotal()
            {
                //When refreshing the page this method will call
                var gt = 0;
                var total = 0;
                var totalbefdisc = 0;
                var totaldiscAmt = 0;
//                    $('#lumsumdiscount').val('0.0');
//                    var lumsumdiscount = $('#lumsumdiscount').val();
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
//                    gt = gt * (1 - lumsumdiscount / 100)
//                    var lumsumAmt = parseFloat($('#totalAmt').val()).toFixed(3) - parseFloat(gt).toFixed(3);
//                    $('#lumsumamt').val(parseFloat(lumsumAmt).toFixed(3));
//                    $('#grandTotal').val(parseFloat(gt).toFixed(3));
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
                        $itemRow.find('#discount').val('0.0');
                        $itemRow.find('#discount1').val('0.0');
                        return false;
                    } else {
                        var dis = (parseFloat(discountPrice).toFixed(3) / parseFloat(befdisc).toFixed(3)) * 100;
                        $itemRow.find('#discount').val(parseFloat(dis));
                        $itemRow.find('#discount1').val(parseFloat(dis).toFixed(3));
                        priceCalcute($this);
                    }
                }
                else {

                    $itemRow.find('#discount').val('0.0');
                    $itemRow.find('#discount1').val('0.0');
                    // $itemRow.find('#discountPrice').val('0.000');
                    priceCalcute($this);
                }
            }


            function lumsumCalculate() {
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
        </script>

        <script>
            NProgress.done();
        </script>
    </body>

</html>
