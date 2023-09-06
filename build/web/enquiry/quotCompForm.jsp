<%-- 
    Document   : purchReqview
    Created on : Feb 19, 2016, 5:44:26 PM
    Author     : Nataraj
--%>

<%@page import="java.util.Date"%>
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

        <!-- Bootstrap core CSS -->

        <!--<link href="../common/theme/css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">-->




        <!--[if lt IE 9]>
            <script src="../assets/js/ie8-responsive-file-warning.js"></script>
            <![endif]-->

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
              <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->
        <script src="../common/validate/Check_Digit.js" type="text/javascript"></script>
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
                        <form class="form-horizontal" id="quotcompForm" action="../purchase/quotCompFormSubmit.htm" method="post" enctype="multipart/form-data">
                            <div class="col-md-6 col-xs-12">
                                <div class="x_panel">                             
                                    <jsp:include page="../login/headerlink.htm?submodule=Supplier Quotation&tab=Compare Quotation&pagetype=form"/>
                                    <div class="x_title">
                                        <h2>
                                            Quotation Form

                                        </h2>
                                        <div class="clearfix">


                                        </div>
                                    </div>
                                    <c:forEach items="${quotList}" var="type">
                                        <c:set var="division" value="${type.divisionName}"/>
                                        <c:set var="potype" value="${type.purchaseType}"/>
                                        <c:set var="department" value="${type.department}"/>
                                        <c:set var="ReqNo" value="${type.prNo}"/>
                                        <c:set var="reqDate" value="${type.prDate}"/>
                                        <c:set var="prCode" value="${type.projectCode}"/>
                                        <c:set var="deliveryLocation" value="${type.deliveryLocation}"/>
                                        <c:set var="requiredDate" value="${type.deliveryDate}"/>
                                        <%--<c:set var="priority" value="${type.priority}"/>--%> 
                                    </c:forEach>

                                    <div class="x_content">
                                        <div class="col-md-4 col-sm-12 col-xs-12 ">
                                            <div>
                                                <strong style="padding-right: 8px;">Division:</strong> ${division}
                                            </div>
                                            <div>
                                                <strong style="padding-right: 8px;">PO Type:</strong> ${potype}
                                            </div>
                                            <div>
                                                <strong style="padding-right: 8px;">Department:</strong> ${department}
                                            </div>
                                            <div><strong style="padding-right: 8px;">Requisition No:</strong> ${ReqNo}
                                                <input name="ReqNo" id="ReqNo" value="${ReqNo}" type="hidden">
                                            </div>


                                            <div><strong style="padding-right: 8px;width: 50px">Requisition Date:</strong> <fmt:formatDate pattern="dd-MMM-yyyy" value="${reqDate}" />
                                                <input name="reqDate" type="hidden" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${reqDate}"/>" tabindex="-1"/>
                                                <input class="input-xlarge"id="" name="ReqDateNo" readonly="" type="hidden" value="<%= (new SimpleDateFormat("dd-MMM-yyyy")).format(new java.util.Date())%>">

                                            </div>

                                        </div>
                                        <div class="col-md-offset-6">
                                            <div>
                                                <strong style="padding-right: 8px;">Project Code:</strong>${prCode}
                                            </div>
                                            <div > 
                                                <!--<strong style="padding-right: 8px;">Required Date:</strong>-->
                                                <%--<fmt:formatDate pattern="dd-MMM-yyyy" value="${requiredDate}"/>--%>
                                                <input type="hidden" name="requiredByDate" class="form-control"  readonly   value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${requiredDate}"/>">

                                            </div>                                                          


                                            <div> 

                                                <strong style="padding-right: 8px;">Store Name:</strong><b style="width: 100px;font-weight: normal;">${deliveryLocation}</b>


                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 ">
                                        <strong style="padding-right: 8px;"> &nbsp;Attachment:</strong>
                                        <c:forEach items="${purchDocList}" var="doc">
                                            <c:if test="${not empty doc.fileName}">
                                                <a style="color: black" href="../purchase/requiAttachDownload.htm?sno=${doc.SNo}" title="Click to download">
                                                    <i class="fa fa-file-pdf-o" style="font-size: 15px" ></i>
                                                    ${doc.fileName}
                                                </a>
                                            </c:if> 
                                        </c:forEach>

                                    </div>

                                    <div class="x_content">                                       
                                        <p>&nbsp;</p> 

                                        <c:forEach items="${itemList}" var="type">                                               

                                            <div>
                                                <strong style="padding-right: 30px;">Item Name:</strong> <div id="dynamicdiv" style="display: inline">${type[0]}</div>


                                                <strong style="padding-right: 30px;">Item Description:</strong> <div id="dynamicdiv" style="display: inline">${type[1]}</div>
                                                <strong style="padding-right: 30px;">Delivery Date:</strong> <div id="dynamicdiv" style="display: inline"><fmt:formatDate pattern="dd-MMM-yyyy" value="${type[3]}"/></div>
                                            </div>
                                            <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                                <thead>
                                                    <tr class="headings" > 
                                                        <!--<th>Item Name</th>-->
                                                        <!--<th>Item Description</th>-->

                                                        <th>SNo</th>
                                                        <th style="width:35%;">Supplier Name</th>
                                                        <th style="width:10%;">Quotation No</th>
                                                        <!--<th>Delivery Date</th>-->
                                                        <th style="width:2%;"><span style="color: red">*</span> Quantity</th>
                                                        <!--<th>Unit</th>-->
                                                        <th style="width:7%;"><span style="color: red">*</span> Unit Price</th>
                                                        <th style="width:7%;">Total Amount</th>
                                                        <th style="width:8%;"><span style="color: red">*</span> Discount(%)</th>
                                                        <th style="width:6%;"><span style="color: red">*</span> Discount Amount</th>                                                                                                      
                                                        <th style="width:6%;">Total Amount After Discount</th>

                                                    </tr>
                                                </thead>

                                                <tbody> 
                                                    <c:set var="existItem" value="0"/>
                                                    <c:set var="SNo" value="1"/>
                                                    <c:forEach items="${quotList}" var="list">
                                                        <c:if test="${existItem ne list.itemCode}">
                                                            <c:if test="${type[2] eq list.itemCode}">
                                                                <c:if test="${type[3] eq list.deliveryDate}">
                                                                    <tr id="quotPoForm">    
                                                                        <!--<td> ${list.itemName}</td>--> 
                                                                        <!--<td>${list.description}</td>-->
                                                                        <td> ${SNo}
                                                                            <input name="pk" type="hidden" value="${list.SNo}" readonly="">
                                                                        </td>
                                                                        <td> ${list.supplierName}</td>
                                                                        <td> ${list.quotationNo}</td>
                                                                        <!--<td><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.deliveryDate}"/></td>-->  
                                                                        <td><input style="width: 70px;text-align:right;" class=" form-control input-mini validate[required] validate[custom[notzero],custom[float5]]" onpaste="return false" autocomplete="off"  name="qty" id="qty" onkeypress="return check_digit(event, this, 10, 3);"  type="text" onkeyup="validatePrice(this);" value="${list.quantity}"></td>  
                                                                        <!--<td> ${list.unit}</td>--> 
                                                                        <td><input style="width: 70px;text-align:right;" class="form-control  input-mini validate[custom[notzero],required,custom[float5]]" onpaste="return false" required="" autocomplete="off" onkeypress="return check_digit(event, this, 6, 3);" name="price" id="price" type="text" onkeyup="validatePrice(this);" value="<fmt:formatNumber type="number" groupingUsed="false" pattern="0.000" maxFractionDigits="3" value="${list.unitPrice}"/>"></td>
                                                                        <td><input style="text-align:right;width:100px;" class="form-control  input-mini  validate[required]" type="text" readonly onpaste="return false"  id="befdisc" onkeyup="validatePrice(this);" value="<fmt:formatNumber type="number" groupingUsed="false" pattern="0.000" maxFractionDigits="3"  value="${list.quantity*list.unitPrice}"/>"></td>
                                                                        <td>
                                                                            <input style="width: 87px;text-align:right;" class="form-control  input-mini validate[required,custom[float5]]]" onpaste="return false" autocomplete="off" onkeyup="validatePrice(this);" id="discount1" onkeypress="return check_digit(event, this, 2, 3);" type="text" maxlength="6" value="<fmt:formatNumber type="number" groupingUsed="false" pattern="0.000" maxFractionDigits="3" value="${list.discount}"/>">
                                                                            <input style="width: 70px;text-align:right;"  onpaste="return false" autocomplete="off" name="discount" id="discount" type="hidden" value="${list.discount}">
                                                                        </td>
                                                                        <td><input style="text-align:right;width:100px;" class="form-control  input-mini  validate[required,custom[float5]]]" type="text" onpaste="return false" onkeyup="validatePrice(this);" autocomplete="off" id="discountPrice" onkeypress="return check_digit(event, this, 10, 3);"  value="<fmt:formatNumber type="number" groupingUsed="false" pattern="0.000" maxFractionDigits="3" value="${(list.quantity*list.unitPrice)*(list.discount/100)}"/>"></td>
                                                                        <td> <input style="width: 135px;text-align:right;" class="form-control  input-mini validate[custom[notzero],required]" id="total" name="total" type="text" value="<fmt:formatNumber type="number" groupingUsed="false" pattern="0.000" maxFractionDigits="3" value="${list.totalPrice}"/>" readonly=""></td>


                                                                    </tr>
                                                                    <c:set var="SNo" value="${SNo+1}"/>
                                                                </c:if>
                                                            </c:if>                                                          

                                                        </c:if>
                                                    </c:forEach> 
                                                    <c:set var="existItem" value="${type[2]}"/>

                                                </tbody>

                                            </table>
                                        </c:forEach>
                                        <p>&nbsp;</p>

                                        <div class="col-md-4 col-sm-12 col-xs-12">
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <button type="submit" class="btn btn-primary" style="">Save</button>

                                                <a href="../purchase/quotList.htm"><button type="button" class="btn btn-danger" style="" >Cancel</button></a> 

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </form>
                    </div>

                </div>
            </div>



            <!-- Datatables -->
            <!--<script src="../common/theme/js/datatables/js/jquery.dataTables.js"></script>-->

            <script>
                $(document).ready(function () {
                    gridEditArrowKey();
                    $('#quotcompForm').validationEngine();
                });

            </script>
            <script>

                function validatePrice($this) {
                    var $itemRow = $($this).closest('tr');
                    var z = $itemRow.find('#qty').val();
                    var zz = $itemRow.find('#price').val();
                    var befdis = $itemRow.find('#befdisc').val(($itemRow.find('#qty').val() * $itemRow.find('#price').val()).toFixed(3));
                    var ccc = $itemRow.find('#discount').val();
                    var discount = $itemRow.find('#qty').val() * $itemRow.find('#price').val() * (1 - $itemRow.find('#discount').val() / 100);
                    var discountfinal = roundNumber(discount, 2);
                    isNaN(discount) ? $itemRow.find('#total').val("N/A") : $itemRow.find('#total').val(parseFloat(discountfinal).toFixed(3));
                }
                function roundNumber(number, decimals) {
                    //If it's not already a String
                    var num2 = Math.floor(number * 1000) / 1000;
                    return num2;
                }
                function isNumberKey(evt) {
                    debugger;
                    var charCode = (evt.which) ? evt.which : event.keyCode;
                    if (charCode == 46 && evt.srcElement.value.split('.').length > 1) {
                        return false;
                    }
                    if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
                        alert("please enter numeric value");
                        return false;
                    }
                    return true;
                }
                $(document).on('input', '#discount1', function () {

                    var $itemRow = $(this).closest('tr');
                    $itemRow.find('#discount').val(this.value);
                    var befdiscount = $itemRow.find('#befdisc').val();
                    var discount = $itemRow.find('#qty').val() * $itemRow.find('#price').val() * (1 - $itemRow.find('#discount').val() / 100);
//                                      var discountfinal = roundNumber(discount, 2);
                    var disPrice = parseFloat(befdiscount).toFixed(3) - parseFloat(discount).toFixed(3);

                    $itemRow.find('#discountPrice').val(parseFloat(disPrice).toFixed(3));
                    $itemRow.find('#discountPrice').val(parseFloat(disPrice).toFixed(3));
                    // isNaN(discount) ? $itemRow.find('#total').val("N/A") : $itemRow.find('#total').val(parseFloat(discount).toFixed(3));
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
                $(document).on('input', '#discountPrice', function () {

                    caldiscountPrice(this);
                });
                function caldiscountPrice($this)
                {
                    var $itemRow = $($this).closest('tr');
                    var befdisc = $itemRow.find('#befdisc').val();
                    var discountPrice = $itemRow.find('#discountPrice').val();
                    if (!isNaN(parseFloat(discountPrice))) {
                        if (parseFloat(discountPrice) >= parseFloat(befdisc)) {
                            alert("Discount amount should be less than total amount...!!");
                            $itemRow.find('#discountPrice').val('0.0');
                            $itemRow.find('#discount').val('0.0');
                            $itemRow.find('#discount1').val('0.0');
                            return false;
                        } else {
                            var dis = (parseFloat(discountPrice).toFixed(3) / parseFloat(befdisc).toFixed(3)) * 100;
                            $itemRow.find('#discount').val(parseFloat(dis));
                            $itemRow.find('#discount1').val(parseFloat(dis).toFixed(3));
                            priceCalcute($this);
                        }
                    } else {

                        $itemRow.find('#discount').val('0.0');
                        $itemRow.find('#discount1').val('0.0');
                        // $itemRow.find('#discountPrice').val('0.000');
                        priceCalcute($this);
                    }
                }
                var inputval = '#qty, #discount,#price';
                $(document).on('input', inputval, function () {
                    updateGrandTotal();

                });
                function updateGrandTotal()
                {

                    $('tr#quotPoForm').each(function () {
                        var $itemRow = $(this).closest('tr');
                        var befdiscount = $itemRow.find('#qty').val() * $itemRow.find('#price').val();
                        $itemRow.find('#befdisc').val(parseFloat(befdiscount).toFixed(3));

                        var discount = $itemRow.find('#qty').val() * $itemRow.find('#price').val() * (1 - $itemRow.find('#discount').val() / 100);
//                                      var discountfinal = roundNumber(discount, 2);
                        var disPrice = parseFloat(befdiscount).toFixed(3) - parseFloat(discount).toFixed(3);

                        $itemRow.find('#discountPrice').val(parseFloat(disPrice).toFixed(3));
//                        isNaN(discount) ? $itemRow.find('#total').val("N/A") : $itemRow.find('#total').val(parseFloat(discount).toFixed(3));

                    });

                }
                function calTotal(sno)
                {
                    var qty = $('#reqQty' + sno).val();
                    var unitPrice = $('#unitPrice' + sno).val();

                    //                if (qty == "")
                    //                {
                    //                    alert("Enter Quantity");
                    //                    return;
                    //                }
                    //                 if (unitPrice == "")
                    //                {
                    //                    alert("Enter Unit Price");
                    //                    return;
                    //                }
                    //                else
                    //                {
                    var price = qty * unitPrice
                    $('#totalPrice' + sno).val(price);
                    //                }
                }
                function selectdate(val) {

                    NewCssCal(val, 'ddMMMyyyy', '', '', '', '', 'future');
                    //$('#test').attr();
                    //document.getElementById("hiddentr").value=$itemRow.index();

                }

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


//                function check_digit(e, obj, intsize, deczize) {
//                    var keycode;
//
//                    if (window.event)
//                        keycode = window.event.keyCode;
//                    else if (e) {
//                        keycode = e.which;
//                    } else {
//                        return true;
//                    }
//
//                    var fieldval = (obj.value),
//                            dots = fieldval.split(".").length;
//
//                    if (keycode == 46) {
//                        return dots <= 1;
//                    }
//                   if (keycode == 8 || keycode == 9 || keycode == 46 || keycode == 13||keycode != 46 || keycode != 8){
//                        // back space, tab, delete, enter 
//                        return true;
//                    }
//                    if ((keycode >= 32 && keycode <= 45) || keycode == 47 || (keycode >= 58 && keycode <= 127)) {
//                        return false;
//                    }
//                    if (fieldval == "0" && keycode == 48) {
//                        return false;
//                    }
//                    if (fieldval.indexOf(".") != -1) {
//                        if (keycode == 46) {
//                            return false;
//                        }
//                       
//                        var splitfield = fieldval.split(".");
//                        if (splitfield[1].length >= deczize && keycode != 8 && keycode != 0)
//                            return false;
//                    } else if (fieldval.length >= intsize && keycode != 46) {
//                        return false;
//                    } else {
//                        return true;
//                    }
//                }

            </script>

            <script>
                NProgress.done();
            </script>
    </body>

</html>