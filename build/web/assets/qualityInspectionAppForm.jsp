<%-- 
    Document   : qualityInspectionAppForm
    Created on : 22 Feb, 2018, 2:08:53 PM
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
            function fill(val1, val2, val3, val4, val5) {
                document.getElementById("suppName").value = val1;
                document.getElementById("suppAddress").value = val2;
                document.getElementById("suppPhone").value = val3;
                document.getElementById("suppEmail").value = val4;
                document.getElementById("suppId").value = val5;

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



            function recheck()
            {
                var appremarks = document.getElementById('remarks').value;
                //var inspectionNo = document.getElementById('inspectionNo').value;
                var materialreceiptNo = document.getElementById('recordNo').value;
                window.location.href = "../quality/recheckstatus.htm?materialreceiptNo=" + materialreceiptNo + "&appremarks=" + appremarks + " ";
                // action="../Materialreceipts/inspectappFormSubmit.htm?" ;
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
                                <jsp:include page="../login/headerlink.htm?submodule=Quality Inspection&tab=Quality Inspection&pagetype=form"/>

                                <div class="x_title">
                                    <h2>Receipt</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br/>


                                    <form method="post"  <%-- action="../inventory/inspectStatus1.htm" --%> id="imForm"  > <%-- onsubmit="return test();" --%>


                                        <c:set var="j" value="0"/>
                                        <c:forEach items="${inspectlist}" var="list">
                                            <c:if test="${j eq 0}">
                                                <c:set var="j" value="1"/>

                                                <c:set var="insDate" value="${list.materialReceiptDate}"/>
                                                <c:set var="mrNo" value="${list.materialReceiptNo}"/>
                                                <c:set var="dcNo" value="${list.invoiceNo}"/>
                                                <c:set var="dcDate" value="${list.invoiceDate}"/>
                                                <c:set var="itemCode" value="${list.itemCode}"/>
                                                <c:set var="user" value="${list.userId}"/>
                                                <c:set var="rmarks" value="${list.qaRemarks}"/>
                                                <c:set var="projectCode" value="${list.projectCode}"/>
                                                <c:set var="purchaseOrderNo" value="${list.poNo}"/>
                                                <c:set var="shipToLocation" value="${list.deliveryLocation}"/>
                                                <c:set var="lastmodifiedDate" value="${list.lastmodifiedDate}"/>


                                            </c:if>
                                        </c:forEach>

                                        <c:set var="k" value="0"/>
                                        <c:forEach items="${recordlist}" var="list1">

                                            <c:if test="${k eq 0}">
                                                <c:set var="k" value="1"/>

                                                <c:set var="orderedQty" value="${list1.qty}"/>
                                                <c:set var="ddiscount" value="${list1.qty * list1.unitPrice *(list1.discount/100)}"/>
                                                <c:set var="poNo" value="${list1.purchaseOrderNo}"/>
                                                <c:if test="${poNo eq purchaseOrderNo}">
                                                    <c:set var="supplierName" value="${list1.supplierName}"/>
                                                    <c:set var="supplierAddress" value="${list1.supplierAddress}"/>
                                                    <c:set var="supplierEmail" value="${list1.supplierEmail}"/>
                                                    <c:set var="supplierCode" value="${list1.supplierCode}"/>
                                                    <c:set var="lumsumDiscount1" value="${list1.lumsumDiscount}"/>
                                                    <%--<c:set var="pUom" value="${list1.uom}"/>--%>

                                                </c:if>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach items="${store1}" var="type">

                                            <c:if test="${type.division eq orgCode && type.storeType eq 'Center Store'}">
                                                <c:set var="storeName1" value="${type.storeName}"/>
                                            </c:if>
                                        </c:forEach>

                                        <div class="row">


                                            <div class="col-md-4 col-sm-6 col-xs-12">
                                                <div class="input-group">
                                                    <div><h5><strong>Receipt Number:</strong>&nbsp;&nbsp;&nbsp;<div id="dynamicdiv" style="display: inline">${mrNo}</h5></div>
                                                    <input name="recordNo" id="recordNo" value="${mrNo}" type="hidden">
                                                    <input class="form-control" id="deptName" name="deptName" readonly="" type="hidden" value="<%=session.getAttribute("userDept").toString()%>" maxlength="80">
                                                    <input class="form-control" name="orgCode" readonly="" type="hidden" value="${storeName1}" >
                                                    <input class="form-control" name="lastmodifiedDate" readonly="" id="lastmodifiedDate" value="<fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="${lastmodifiedDate}" />" type="hidden">

                                                    <div><h5><strong>Receipt Date:</strong>&nbsp;&nbsp;&nbsp;<fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="<%=date%>" /></h5>
                                                        <input name="insDate" type="hidden" value="<fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="<%=date%>" />" tabindex="-1"/>
                                                    </div>

                                                    <div><h5><strong>Received By:</strong>&nbsp;&nbsp;&nbsp; ${user}</h5></div>



                                                    <div><h5><strong>Inspected By:</strong>&nbsp;&nbsp;&nbsp; ${user}</h5>
                                                        <input class="form-control" name="userId" readonly="" type="hidden" value="<%=session.getAttribute("userId").toString()%>" maxlength="80">
                                                        <input class="form-control" name="user" readonly="" type="hidden" value="${user}" id="user">
                                                    </div>
                                                </div>
                                            </div>


                                            <%--    <div class="col-md-4 col-sm-6 col-xs-12" style="float:right">

                                        <div><h5><strong>Purchase Order No:</strong>&nbsp;&nbsp;&nbsp;${poNo}</h5>
                                            <input name="poNo" value="${poNo}" type="hidden">
                                        </div>

                                        <div><h5><strong>Project Code:</strong>&nbsp;&nbsp;&nbsp;${projectCode}</h5>
                                            <input name="projectCode" value="${projectCode}" type="hidden">

                                        </div>


                                        <div><h5><strong>Invoice Number:</strong>&nbsp;&nbsp;&nbsp;${dcNo}<h5>
                                                    <input name="invoiceNo" value="${dcNo}" type="hidden">
                                                    </div>

                                                    <div><h5><strong>Invoice Date:</strong>&nbsp;&nbsp;<fmt:formatDate pattern="dd-MMM-yyyy" value="${dcDate}"/></h5>
                                                        <input name="invoiceDate" value="${dcDate}" type="hidden">

                                                    </div>
                                                    <h5><strong>Lumsum Discount(%):</strong>&nbsp;&nbsp;${lumsumDiscount1}
                                                        <input class="form-control" name="lumsumdiscount" value="${lumsumDiscount1}"  type="hidden">
                                                        <div>

                                                        </div>
                                                        <div class="clearfix"></div>
                                                        </div> --%>
                                            <div class="col-md-4 col-sm-6 col-xs-12" style="float:right">
                                                <div class="">
                                                    <div>
                                                        <ul class="list-unstyled text-left">
                                                            <li><h5><strong>Supplier Details:</strong></h5></li>
                                                            <div >${supplierName}</div>
                                                            <input name="clientName" id="clientName" value="${supplierName}" type="hidden">

                                                            <div id="clientAddress"style="width:300px;">${supplierAddress}</div>
                                                            <input name="clientAddress" value="" type="hidden">

                                                            <%--<div id="clientCity"style="width:300px;">${contact.cityName}, ${contact.country}</div>--%>

                                                            <%--<div id="clientPhone">${contact.contactNumber}</div>--%>
                                                            <%-- <input name="clientPhone" value="${contact.contactNumber}" type="hidden">--%>

                                                            <div id="clientEmail">${supplierEmail}</div>
                                                            <input name="suppId" id="suppId" value="${supplierCode}" type="hidden">
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>

                                            <div class="x_content">
                                                <div class="row">

                                                    <div class="col-md-12">

                                                        <!-- price element -->
                                                        <%--        <div class="col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="pricing">

                                                        <div class="x_content"style="margin-left:-12px">
                                                            <div class="">
                                                                <div>
                                                                    <ul class="list-unstyled text-left">
                                                                        <li><h5><strong>Supplier Details:</strong></h5></li>

                                                                        <div >${supplierName}</div>
                                                                        <input name="clientName" id="clientName" value="${supplierName}" type="hidden">

                                                                        <div id="clientAddress"style="width:300px;">${supplierAddress}</div>
                                                                        <input name="clientAddress" value="" type="hidden">

                                                                        <div id="clientEmail">${supplierEmail}</div>
                                                                        <input name="suppId" id="suppId" value="${supplierCode}" type="hidden">
                                                                    </ul>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>   --%>
                                                        <!-- price element -->



                                                        <!-- price element -->
                                                        <%--<div class="col-md-4 col-sm-6 col-xs-12">
                                                            <div class="pricing">

                                                                            <div class="x_content">
                                                                                <div class="">
                                                                                    <div>
                                                                                        <ul class="list-unstyled text-left">
                                                                                            <li><h5><strong>Delivery Location:</strong></h5></li>
                                                                                            <div>${shipToLocation}</div>
                                                                                            <input name="shipToLocation" value="${shipToLocation}" type="hidden">

                                                                                        </ul>
                                                                                    </div>
                                                                                </div>

                                                                            </div>
                                                                        </div>
                                                </div> --%>  
                                                        <!-- price element -->

                                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                                            <div class="x_panel" style="overflow:scroll">

                                                                <div class="x_content">



                                                                    <table class="table table-striped responsive-utilities jambo_table bulk_action" id="resourcetable">
                                                                        <thead>
                                                                            <tr class="headings">
                                                                                <th class="column-title" style="width: 10%">PO Number</th>

                                                                                <th class="column-title" style="width: 100px;">Sub Category</th>
                                                                                <th class="column-title" style="width: 100px;">Item Name</th>
                                                                                <th class="column-title" style="width: 100px;">Item Desc</th>
                                                                                <th class="column-title" style="width: 50px;">Order Qty</th>
                                                                                <th class="column-title" style="width: 50px;">Received Qty </th>

                                                                                <th class="column-title" style="width: 50px;">Accepted Qty</th>
                                                                                <th class="column-title" style="width: 50px;">Unit Price</th>
                                                                                <th class="column-title" style="width: 50px;">Discount<br/>(%)</th>
                                                                                <th class="column-title" style="width: 50px;">Discount Amount</th>
                                                                                <th class="column-title" style="width: 50px;">Total Price</th>
                                                                                <th class="column-title" style="width: 50px;">Rejected Qty</th>
                                                                                <th class="column-title" style="width: 50px;">FOC Qty</th>
                                                                                <th class="column-title" style="width: 50px;">Delivery Date</th>
                                                                                <th class="column-title" style="width: 50px;">Batch No</th>
                                                                                <th class="column-title" style="width: 50px;">Expiry Date</th>
                                                                                <th class="column-title" style="width: 50px;">Exceptional</th>
                                                                                <th class="column-title" style="width: 50px;">Comments</th>

                                                                            </tr>
                                                                        </thead>

                                                                        <tbody>

                                                                            <c:set var="gtotal" value="0.0"/>
                                                                            <c:forEach items="${inspectlist}" var="list">
                                                                                <c:set var="batchNo" value="${list.batchNo}"/>
                                                                                <c:set var="expiryDate" value="${list.expiryDate}"/>
                                                                                <c:set var="qaAcceptedQty" value="${list.qaAcceptedQty}"/>
                                                                                <c:set var="unitPrice" value="${list.unitPrice}"/>
                                                                                <c:set var="conversionFactor2" value="0"/>
                                                                                <%--<c:set var="conversionFactor3" value="0"/>--%>
                                                                                <c:forEach items="${recordlist}" var="list1">
                                                                                    <c:if test="${list1.purchaseOrderNo eq purchaseOrderNo}">
                                                                                        <c:if test="${list1.itemCode eq list.itemCode}">
                                                                                            <c:set var="discount" value="${list1.qty * list1.unitPrice *(list1.discount/100)}"/>
                                                                                            <c:set var="discount1" value="${list1.discount}"/>
                                                                                            <c:set var="lumsumDiscount2" value="${list1.qty * list1.unitPrice *(lumsumDiscount1/100)}"/>
                                                                                            <c:set var="pUom" value="${list1.uom}"/>
                                                                                        </c:if>
                                                                                    </c:if>
                                                                                </c:forEach>



                                                                                <tr class="even pointer">

                                                                                    <td>${list.poNo}
                                                                                        <input name="poNo" id="poNo" value="${list.poNo}" type="hidden">
                                                                                    </td>

                                                                                    <td>${list.itemSubCategory}
                                                                                        <input name="itemSubCategory" id="itemSubCategory" value="${list.itemSubCategory}" type="hidden">
                                                                                    </td>
                                                                                    <td>

                                                                                        ${list.itemName}


                                                                                        <c:forEach items="${store}" var="list4">     
                                                                                            <c:if test="${list.itemCode eq list4[1]}">
                                                                                                <c:set var="saftyStock" value="${list4[0]}"/>
                                                                                            </c:if>
                                                                                        </c:forEach>
                                                                                        <c:forEach items="${uomList}" var="uomList">
                                                                                            <c:if test="${list.itemCode eq uomList[0]}">
                                                                                                <c:set var="conversionFactor3" value="${uomList[5]}"/>
                                                                                                <c:set var="finalUom" value="${uomList[2]}"/>
                                                                                                <c:if test="${list.uom eq uomList[1]}">
                                                                                                    <c:set var="conversionFactor2" value="1"/>
                                                                                                </c:if>

                                                                                                <c:if test="${list.uom eq uomList[2]}">
                                                                                                    <c:set var="conversionFactor2" value="${uomList[5]}"/>
                                                                                                </c:if>

                                                                                                <c:if test="${list.uom eq uomList[3]}">
                                                                                                    <c:set var="conversionFactor2" value="${uomList[6]}"/>
                                                                                                </c:if>

                                                                                                <c:if test="${list.uom eq uomList[4]}">
                                                                                                    <c:set var="conversionFactor2" value="${uomList[7]}"/>
                                                                                                </c:if>
                                                                                            </c:if>
                                                                                        </c:forEach>

                                                                                        <c:forEach items="${itemSupplier}" var="itemSupplier">
                                                                                            <c:if test="${list.itemCode eq itemSupplier.itemCode}">
                                                                                                <c:set var="uom1Price" value="${itemSupplier.uom1Price}"/>
                                                                                            </c:if>

                                                                                        </c:forEach>


                                                                                        <c:forEach items="${uomList}" var="uomList">
                                                                                            <c:if test="${list.itemCode eq uomList[0]}">
                                                                                                <c:set var="conversionFactor3" value="${uomList[5]}"/>
                                                                                                <c:set var="finalUom" value="${uomList[2]}"/>
                                                                                                <c:if test="${list.uom eq uomList[1]}">
                                                                                                    <c:set var="conversionFactor2" value="1"/>
                                                                                                </c:if>

                                                                                                <c:if test="${list.uom eq uomList[2]}">
                                                                                                    <c:set var="conversionFactor2" value="${uomList[5]}"/>
                                                                                                </c:if>

                                                                                                <c:if test="${list.uom eq uomList[3]}">
                                                                                                    <c:set var="conversionFactor2" value="${uomList[6]}"/>
                                                                                                </c:if>

                                                                                                <c:if test="${list.uom eq uomList[4]}">
                                                                                                    <c:set var="conversionFactor2" value="${uomList[7]}"/>
                                                                                                </c:if>
                                                                                            </c:if>

                                                                                            <c:forEach items="${itemSupplier}" var="itemSupplier">
                                                                                                <c:if test="${list.itemCode eq itemSupplier.itemCode}">
                                                                                                    <c:set var="uom1Price" value="${itemSupplier.uom1Price}"/>
                                                                                                </c:if>

                                                                                            </c:forEach>
                                                                                        </c:forEach>



                                                                                        <input type="hidden" name="itemCode" value="${list.itemCode}"/> 
                                                                                        <input type="hidden" name="itemName" value="${list.itemName}"/> 

                                                                                        <input name="divisionName" value="${list.divisionName}" type="hidden">
                                                                                        <input name="saftyStock" id="saftyStock" value="${saftyStock}" type="hidden">
                                                                                        <input name="itemCategory" id="itemCategory" value="${list.itemCategory}" type="hidden">

                                                                                    </td>
                                                                                    <td>${list.itemDescription}
                                                                                        <input type="hidden" name="itemDesc" value="${list.itemDescription}"/>
                                                                                    </td>

                                                                                    <td><fmt:formatNumber pattern="#.##" maxFractionDigits="2" value="${list.orderQuantity}"/> ${pUom}
                                                                                        <input name="orderQty" value="${list.orderQuantity}" id="orderQty" type="hidden">
                                                                                    </td>

                                                                                    <td><fmt:formatNumber pattern="#.##" maxFractionDigits="2" value="${list.receivedQty}"/> ${list.uom}
                                                                                        <input type="hidden" name="receivedQty" value="${list.receivedQty}"/> 
                                                                                    </td>


                                                                                    <td><fmt:formatNumber pattern="#.##" maxFractionDigits="2" value="${list.qaAcceptedQty}"/> ${list.uom}
                                                                                        <input type="hidden" name="imUom" value="${finalUom}"/> 

                                                                                        <input type="hidden" name="imUom1" value="${list.uom}"/> 
                                                                                        <c:set var="mplval" value="0" />
                                                                                        <c:choose>
                                                                                            <c:when test="${fn:contains(conversionFactor3,'.') || fn:contains(list.qaAcceptedQty,'.')}">
                                                                                                <c:set var="mplval" value="${list.qaAcceptedQty * conversionFactor3}" />
                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                <c:set var="mplval" value="${list.qaAcceptedQty * conversionFactor3}.00" />
                                                                                            </c:otherwise>

                                                                                        </c:choose>
                                                                                        <%--<c:if test="${conversionFactor3.matches('.')}">--%>
                                                                                        <%--<c:set var="mplval" value="${list.qaAcceptedQty * conversionFactor3}" />--%>
                                                                                        <%--</c:if>--%>
                                                                                        <%--<c:if test="!${conversionFactor3.matches('.')}">--%>
                                                                                        <%--<c:set var="mplval" value="${list.qaAcceptedQty * conversionFactor3}" />--%>
                                                                                        <%--</c:if>--%>
                                                                                        <fmt:formatNumber pattern="0.000" var="cf2" maxFractionDigits="3" value="0"/>
                                                                                        <c:choose>
                                                                                            <c:when test="${fn:contains(conversionFactor2,'.')}">
                                                                                                <fmt:formatNumber pattern="0.000" var="cf2" maxFractionDigits="3" value="${conversionFactor2}"/>
                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                <fmt:formatNumber pattern="0.000" var="cf2" maxFractionDigits="3" value="${conversionFactor2}.00"/>
                                                                                            </c:otherwise>

                                                                                        </c:choose>

                                                                                        <c:set var="divval" value="${mplval div cf2}" />

                                                                                        <input type="hidden" name="acceptedQty" value="<fmt:formatNumber pattern="0.000"  maxFractionDigits="3" value="${divval}"/>"/> 

                                                                                        <input type="hidden" name="acceptedQty1" value="${list.qaAcceptedQty}"/> 

                                                                                        <input name="orderValue" value="${(orderedQty*list.unitPrice)-discount}" id="orderValue" type="hidden">
                                                                                        <input name="projectCode" id="projectCode" value="${list.projectCode}" type="hidden">
                                                                                        <input name="purchaseType" id="purchaseType" value="${list.purchaseType}" type="hidden">
                                                                                        <input name="invoiceNo" id="invoiceNo" value="${list.invoiceNo}" type="hidden">
                                                                                        <input name="invoiceDate" id="invoiceDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.invoiceDate}"/>" type="hidden">
                                                                                        <input name="deliveryLocation" id="deliveryLocation" value="${list.deliveryLocation}" type="hidden">
                                                                                        <input name="deliveryDate" id="deliveryDate" readonly class="form-control right deliveryDate" style="width: 90px;" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.deliveryDate}" />" type="hidden">

                                                                                    </td>

                                                                                    <td align="right"><fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${list.unitPrice}"/>
                                                                                        <input  type="hidden" id="price" name="price" value="${list.unitPrice}"/>

                                                                                        <fmt:parseNumber var="unit_cf2" type="number" value="${list.unitPrice * conversionFactor2}" />
                                                                                        <fmt:parseNumber var="cf3" type="number" value="${conversionFactor3}" />

                                                                                        <input  type="hidden" id="price1" name="price1"  value="${list.unitPrice}">
                                                                                    </td>

                                                                                    <td align="right"><fmt:formatNumber pattern="0.000" value="${list.discount}"/>
                                                                                        <input type="hidden" name="discount" id="discount" value="${list.discount}"/>

                                                                                    </td>
                                                                                    <td align="right">
                                                                                        <fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${(list.qaAcceptedQty * list.unitPrice)*(list.discount/100)}" />
                                                                                        <input type="hidden" name="disamount" id="disamount" pattern="0.000" maxFractionDigits="3" value="${(list.qaAcceptedQty * list.unitPrice)*(list.discount/100)}"/>
                                                                                     </td>
                                                                                    <c:set var="afterDis" value="${(list.qaAcceptedQty*list.unitPrice)*(discount1)}"/>

                                                                                    <td align="right"><fmt:formatNumber pattern="0.000" value="${(list.qaAcceptedQty*list.unitPrice-afterDis/100)}"/>
                                                                                        <c:set var="setGrand" value="${(list.qaAcceptedQty*list.unitPrice-afterDis/100)}"/>
                                                                                        <c:set var="lumDis" value="${(((list.qaAcceptedQty*list.unitPrice)- discount))*lumsumDiscount1/100}"/>
                                                                                        <input name="imValue" class="form-control" id="imValue" type="hidden" tabindex="8" readonly value="<fmt:formatNumber pattern="0.000" value="${((list.qaAcceptedQty*list.unitPrice)- discount)-lumDis}"/>">

                                                                                    </td>


                                                                                    <td>${list.rejectedQty} ${list.uom}
                                                                                        <input name="rejectedQty" value="${list.rejectedQty}" type="hidden">

                                                                                    </td>

                                                                                    <td>${list.focQty} ${list.uom}
                                                                                        <input type="hidden" name="focQty" value="${list.focQty}"/>  
                                                                                        <input type="hidden" name="focQty1" value="${(list.focQty/conversionFactor2) * conversionFactor3 }"/>  </td>
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
                                                                                        <input name="expiryDate" value="${expiryDate}" type="hidden">

                                                                                        <c:if test="${expiryDate eq '' || expiryDate eq null}">
                                                                                            N/A
                                                                                        </c:if>
                                                                                        <c:if test="${expiryDate ne '' || expiryDate ne null}">
                                                                                            <fmt:formatDate pattern="dd-MMM-yyyy" value="${expiryDate}"/>
                                                                                        </c:if>
                                                                                    </td>




                                                                            <input name="rejectedValue" class="form-control" id="rejectedValue" type="hidden" tabindex="8" readonly value="<fmt:formatNumber pattern="0.00" value="${((list.rejectedQty*list.unitPrice)-ddiscount1)-lumsumDiscount}"/>"></div>


                                                                            <td><c:choose>
                                                                                    <c:when test="${list.exceptionalAcceptance eq 'YES'}">
                                                                                        <input type="checkbox" value="YES" checked="" disabled="">
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <input type="checkbox" value="YES" disabled="">
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </td>
                                                                            <td>
                                                                                ${list.comments}
                                                                                <input name="comments" id="comments"  autocomplete="off" value="${list.comments}" type="hidden">
                                                                            </td>

                                                                            <c:set value="${gtotal + setGrand}" var="totalAmt"/>
                                                                            <c:set value="${gtotal + setGrand}" var="gtotal"/> 
                                                                            </tr>
                                                                        </c:forEach>

                                                                        </tbody>

                                                                    </table>


                                                                </div>


                                                            </div>
                                                            <div style="float: right;" >
                                                                <table class="table table-striped responsive-utilities jambo_table bulk_action" style="width: 400px;" id="">
                                                                    <thead>
                                                                        <tr class="headings">
                                                                            <th class="column-title" style="">PO Number</th>
                                                                            <th class="column-title" style="">Amount</th>
                                                                                <%-- <th class="column-title" style="width: 140px;">Lumsum Discount(%)</th>--%>
                                                                            <th class="column-title" style="">Total</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <c:forTokens items="${totals}" delims="//" var="mySplit">
                                                                            <c:set var="dateParts" value="${fn:split(mySplit, ',')}" />
                                                                            <tr>
                                                                                <td>${dateParts[0]}</td>
                                                                                <td style="text-align: right;"><fmt:formatNumber pattern="0.000" value="${dateParts[1]}"/></td>
                                                                                <%-- <td style="text-align: right; width: 115px;"><fmt:formatNumber pattern="0.000" value="${dateParts[2]}"/>
                                                                                     <input type="hidden" name="lumsumDis" value="${dateParts[2]}"></td>--%>
                                                                                <td style="text-align: right;"><fmt:formatNumber pattern="0.000" value="${dateParts[1] - (dateParts[1] * dateParts[2]/100)}"/></td>
                                                                            </tr>
                                                                        </c:forTokens>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                            <div class="col-md-offset-8 form-inline " > 
                                                                <label class="control-label" style="font-size:  12px">Total Amount:</label>
                                                                <!--<span class="btn btn-sm">INR</span>-->                                    
                                                                <input class="right form-control input-mini" style="font-weight: bold" readonly="" id="totalAmt" type="text" value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${totalAmount}"/>">                                   
                                                            </div> 
                                                            <!--                                                                &nbsp;
                                                                                                                            <div class="col-md-offset-8 form-inline " > 
                                                                                                                                <label class="control-label" style="font-size:  12px">LumSum Discount(%) :</label>
                                                                                                                                <span class="btn btn-sm">INR</span>                                    
                                                                                                                                <input class="right form-control input-mini" style="font-weight: bold" readonly="" name="lumsumdiscount"  type="text" value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${lumsumDiscount1}"/>">                                   
                                                                                                                            </div>  
                                                            
                                                                                                                            &nbsp;
                                                                                                                            <div class="col-md-offset-8 form-inline " > 
                                                                                                                                <label class="control-label" style="font-size:  12px">LumSum Discount Amount:</label>
                                                                                                                                <span class="btn btn-sm">INR</span>                                    
                                                                                                                                <input class="right form-control input-mini" style="font-weight: bold" readonly="" id="totalDisAmt" type="text" value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${totalAmt *(lumsumDiscount1/100)}"/>">                                   
                                                                                                                            </div>   
                                                            
                                                                                                                            &nbsp;
                                                                                                                            <div class="col-md-offset-8 form-inline " > 
                                                                                                                                <label class="control-label" style="font-size:  18px">Grand Total:</label>
                                                                                                                                <span class="btn btn-sm">INR</span>
                                                            <c:set value="${gtotal * (1-lumsumDiscount1/100)}" var="grandtotal"/> 
                                                            <input class="right form-control input-mini" style="font-weight: bold" readonly="" id="grandTotal" name="grandTotal" type="text" value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${grandtotal}"/>">
                                                            <input type="text" id="currCode" class="form-control input-mini" style="width: 50px" readonly="" value="${currency}">
                                                        </div> -->
                                                        </div>



                                                        <!-- price element --> 
                                                        <c:if test="${action ne 'view'}">

                                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                                <br/>
                                                                <br/>
                                                                <input   type="text" name="remarks" id="remarks"  autocomplete="off" placeholder="Remarks" maxlength="100" style="width:450px;  height:50px"/>
                                                            </div>


                                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                                <br/>
                                                                <br/>


                                                                <input id="saveInvoiceBtn" class="btn btn-primary" name="saveInvoice" value="Approve" type="button"  onclick="test();" onmouseover="grnDuplicate();">

                                                                <button type="button" class="btn btn-warning" onclick="recheck();">Recheck</button>

<!--                                                    <a href="../inventory/rejectedmatinspctn.htm?recordNo=${mrNo}&recordStatus=Rejected"><input id="saveInvoiceBtn" class="btn btn-danger"  name="saveInvoice" value="Reject" type="button" onclick="if (confirm('Do you really want to Reject this record')) {
                                                                return true;
                                                            } else {
                                                                return false;
                                                            }"></a>-->

                                                               <a href="../quality/inspectlistcancle.htm" class="btn btn-danger" style="">Cancel</button></a>  

                                                            </div>
                                                        </c:if>
                                                    </div>
                                                </div>
                                                <c:if test="${action ne 'form'}">
                                                    <a href="../quality/inspectlistcancle.htm" class="btn btn-danger" style="">Cancel</button></a> 
                                                </c:if>
                                            </div>
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

            function  grnDuplicate() {
                var recordNo = $('#recordNo').val();
                var user = $('#user').val();
                var lastmodifiedDate = $('#lastmodifiedDate').val();
                $.ajax
                        ({
                            type: "POST",
                            url: '../quality/grnDuplicate.htm',
                            data: {
                                recordNo: recordNo
                            },
                            success: function (data)
                            {
                                var c = data.split(",");
                                var x = moment(c[2]).format('DD-MMM-YY h:mm:ss a');
                                if ($.trim(c[0]) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    return false;
                                }

                            }
                        });

            }


            function test() {
                //                                                            var x = validateQtyInLocation();

                if (confirm('Do you really want to Save this record')) {

                    $('#imForm').attr('action', "../quality/qualityInspectionAppFormSubmit.htm?");
                    $('#imForm').submit();
                } else {
                    return false;
                }

            }
            NProgress.done();
        </script>
        <script src="../assets/general-inventory_script.js" type="text/javascript"></script>
        <script src="../assets/inventory_script.js" type="text/javascript"></script>
    </body>


</html>

