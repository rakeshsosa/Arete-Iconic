<%-- 
    Document   : quotPO
    Created on : Feb 23, 2016, 3:24:29 PM
    
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
        <link href="../common/theme/css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">

        <!--<script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>-->
        <script type="text/javascript" src="../purchOrder/datepicker/datetimepicker_css.js"></script>
        <!--Mouse Over It will display last 3 po list--> 
<!--        <script type="text/javascript" src="../purchOrder/mouseOverPrevPO.js"></script>
        <link href="../purchOrder/mouseOverPrevPo.css" rel="stylesheet">-->

    </head>


    <body class="nav-sm">
        <%
            Date date = new Date();
        %>


        <div class="container body">


            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">

                        <form id="quotform" class="form-inline" method="post" action="../purchase/quotPOformSubmit.htm" enctype="multipart/form-data" onsubmit="return formValidation();">
                            <div class="col-md-6 col-xs-12">

                                <div class="x_panel">                             
                                    <jsp:include page="../login/headerlink.htm?submodule=Supplier Quotation&tab=Quotation Details&pagetype=form"/>
                                    <div class="x_title">
                                        <h2>Quotation</h2> 
                                        <div class="clearfix"></div>

                                    </div>
                                    <c:set var="m" value="0"/>
                                    <c:forEach items="${quotList}" var="list">

                                        <c:set var="prCode" value="${list.projectCode}"/>
                                        <c:set var="reqno" value="${list.prNo}"/>
                                        <c:set var="reqDate" value="${list.prDate}"/>
                                        <c:set var="enqno" value="${list.enquiriesNo}"/>
                                        <c:set var="enqdate" value="${list.enquiriesDate}"/>
                                        <c:set var="supplierEmail" value="${list.supplierEmail}"/>                                            
                                        <c:set var="quotationNo" value="${list.quotationNo}"/>
                                        <c:set var="quotationDate" value="${list.quotationDate}"/>
                                        <c:set var="deliveryLoc" value="${list.deliveryLocation}"/>
                                        <c:set var="supcode" value="${list.supplierCode}"/>
                                        <c:set var="divisionName" value="${list.divisionName}"/>
                                        <c:set var="projectName" value="${list.projectName}"/>
                                        <c:set var="department" value="${list.department}"/>
                                        <c:set var="paymentTerms" value="${list.paymentTerms}"/>
                                        <c:set var="deliveryTerms" value="${list.deliveryTerms}"/>
                                        <c:set var="supname" value="${list.supplierName}"/>
                                        <c:set var="supadd" value="${list.supplierAddress}"/>
                                        <c:set var="approverRemarks" value="${list.approverRemarks}"/>

                                    </c:forEach>
                                    <c:forEach items="${supplierList}" var="supp">
                                        <c:if test="${supp.mailId eq supplierEmail}">
                                            <%--<c:set var="supname" value="${supp.supplierName}"/>--%>
                                            <%--<c:set var="supadd" value="${supp.supplierAddress}"/>--%>
                                            <%--<c:set var="supcode" value="${supp.supplierCode}"/>--%>
                                            <c:set var="supnumber" value="${supp.contNum}"/>
                                        </c:if>
                                    </c:forEach>
                                    <div class="x_content">



                                        <div class="row">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                <div> 
                                                    <input name="poDate" type="hidden" value="<fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="<%=date%>"/>" tabindex="-1"/>
                                                    <input name="po" value="Purchase Order" type="hidden">
                                                </div>
<!--                                                <div> <h5> <strong>Project Code:</strong> ${prCode}</h5> 
                                                    <input name="prCode" type="hidden" value="${prCode}" tabindex="-1"/>                                               
                                                </div>-->
                                                <div> <h5> <strong>Quotation No:</strong> ${quotationNo}</h5> 
                                                    <input name="quotationNo" type="hidden" value="${quotationNo}" tabindex="-1"/>
                                                    <input name="quotDate" type="hidden" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${quotationDate}"/>"/>
                                                </div>
                                                <div> <h5> <strong>Requisition No:</strong> ${reqno}</h5> 
                                                    <input name="reqNo" type="hidden" value="${reqno}" tabindex="-1"/>
                                                </div>
                                                <div> <h5> <strong>Requisition Date:</strong> <fmt:formatDate pattern="dd-MMM-yyyy" value="${reqDate}"/></h5> 
                                                    <input name="reqDate" type="hidden" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${reqDate}"/>" tabindex="-1"/>
                                                </div>
                                            </div>
                                            <div class="col-md-offset-6">
<!--                                                <div> <h5> <strong>Division Name:</strong> ${divisionName}</h5>                                
                                                </div>-->
                                                <div> <h5> <strong>Department Name:</strong> ${department}</h5>                                
                                                </div>
                                                <div> <h5> <strong>Project Name:</strong> ${projectName}</h5> 

                                                </div> 
                                            </div>

                                        </div>

<!--                                        <div> 
                                            <label class="control-label"><span style="color: red">*</span> PO Type:</label>
                                            <select  id="potype" name="potype" data-rel="chosen"   class="form-control validate[required]" onchange="changeCurrency();">
                                                <option value="">Select PO Type</option>  
                                                <option value="Local">Local</option> 
                                                <option value="Import">Import</option> 
                                            </select> 
                                        </div> 
                                        <p>&nbsp;</p>
                                        <div > 
                                            <label class="control-label"><span style="color: red">*</span> Currency:</label>
                                            <select  id="currency" name="currency" data-rel="chosen"  class="form-control  validate[required]" onchange="selectCurrency();" >
                                                <option value="">Select Currency</option>                                               
                                            </select>  
                                        </div>
                                        <p>&nbsp;</p>
                                        <div>
                                            <label class="control-label"><span style="color: red">*</span> Cost Center</label>
                                            <select  id="costCenter" name="costCenter" data-rel="chosen"   class="form-control validate[required]">
                                                <option value="">Select Cost Center</option>  
                                                <%--<c:forEach items="${costCenterList}" var="type">--%>
                                                    <option value="${type.costcenterCode}-${type.costcenterDesc}">${type.costcenterCode}-${type.costcenterDesc}</option>  
                                                <%--</c:forEach>--%>
                                            </select>                                              

                                        </div>-->

                                        <div class="x_title"></div>
                                        <div class="row">

                                            <div class="col-md-4 col-sm-12 col-xs-12">
                                                <div class="pricing">

                                                    <div class="x_content">
                                                        <div class="">
                                                            <div class="pricing_features">
                                                                <strong><div id="enduser">Supplier Details </div></strong><br/>
                                                                <ul class="list-unstyled text-left">
                                                                    <input name="supName" id="suppName" value="${supname}" type="text" readonly="" class="form-control input-sm validate[required]" placeholder="Name" style="width:300px;">

                                                                    <input name="supaddress" id="suppAddress" value="${supadd}" type="text" readonly=""  class="form-control input-sm" placeholder="Address" style="width:300px;">

                                                                    <input name="suppPhone" id="suppPhone" value="${supnumber}" type="text" readonly=""  class="form-control input-sm" placeholder="Contact Number" style="width:300px;">

                                                                    <input name="supEmail" id="suppEmail" value="${supplierEmail}" type="text" readonly=""  class="form-control input-sm" placeholder="Email Id" style="width:300px;">
                                                                    <input name="supplierCode" id="suppId" value="${supcode}" type="hidden">
                                                                </ul>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>


<!--                                            <div class="col-md-4 col-sm-12 col-xs-12">
                                                <div class="pricing">

                                                    <div class="x_content">
                                                        <div class="">
                                                            <div class="pricing_features">
                                                                <strong><div id="enduser"><span style="color: red">*</span> Bill To Location</div></strong><br/>


                                                                <ul class="list-unstyled text-left">
                                                                    <textarea class="form-control input-sm validate[required]" style="cursor: pointer;resize: none;width:300px;" Placeholder="Click to select Location" required="" readonly="" onclick="selectBillToLoc();" id="billToAddress" name="billToAddress" readonly=""></textarea>

                                                                </ul>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>-->



                                            <div class="col-md-4 col-sm-12 col-xs-12">
                                                <div class="pricing">

                                                    <div class="x_content">
                                                        <div class="">
                                                            <div class="pricing_features">
                                                                <strong><div id="enduser">Ship To / Delivery Location </div></strong><br/>
                                                                <ul class="list-unstyled text-left">

                                                                    <textarea class="form-control input-sm" style="resize: none;width:300px;" name="deliveryLoc" readonly="">${deliveryLoc}</textarea>
                                                                </ul>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>   

                                <div class="x_panel"> 
                                    <div class="x_content">
                                        <table id="" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                            <thead>
                                                <tr class="headings">  
                                                    <!--<th><i class="fa fa-trash-o"></i></th>-->
                                                    <!--<th>Item Code</th>-->
                                                    <th style="width:100px;">Item Sub Category</th>
                                                    <th style="width:230px;">Item Name</th>
                                                    <th style="width:130px;">Item Descr</th>                                        
                                                    <th style="width:70px;"><span style="color: red">*</span> Quantity</th>
                                                    <th style="width:70px;">Unit</th>
                                                    <th style="width:70px;"><span style="color: red">*</span>Unit Price</th>
                                                    <th>Total Amount</th>
                                                    <th style="width:60px;"><span style="color: red">*</span> Discount(%)</th>
                                                    <th>Discount Amount</th>                                                                                                      
                                                    <th style="width:135px;">Total Amount After Discount</th>
                                                    <th style="width:100px;">Delivery Date</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:set var="gtotal" value="0.0"/>
                                                <c:set var="totalbefdisAmt" value="0.0"/>
                                                <c:set var="totaldisAmt" value="0.0"/>
                                                <c:forEach items="${quotList}" var="type"> 
                                                    <tr id="quotPoForm" >
                                                        <!--<td><button  onclick="deleteRow(this);" ><i id="deleteRow" class="fa fa-trash-o"></i></button></td>-->
                                                        <td style="display: none">
                                                            <input type="hidden" name="prSno" value="${type.prSno}"/>
                                                            <input type="hidden" name="quotSno" value="${type.SNo}"/> 
                                                            <input type="hidden" name="division" id="division" value="${type.divisionName}">
                                                            <input  name="prName" type="hidden" value="${type.projectName}">
                                                            <input type="hidden" id="unit"  name="unit" value="${type.unit}"/>                                                
                                                            <input name="itemCat"  type="hidden" value="${type.itemCategory}"> 
                                                            <input name="itemsubCat"  id="itemsubCat"  type="hidden" value="${type.itemSubCategory}">                                                
                                                            <input  type="hidden" name="purchaseType" id="purchaseType" value="${type.purchaseType}">
                                                            <input type="hidden"  name="dept" value="${type.department}">  
                                                            <!--${type.itemCode}-->
                                                            <input class="form-control" id="itemCode" name="itemCode"  type="hidden" value="${type.itemCode}">
                                                        </td>                                             
                                                        <td>${type.itemSubCategory}
                                                        </td>
                                                        <td>${type.itemName} 
                                                                <input class="form-control" id="itemName" name="itemName"  type="hidden" value="${fn:escapeXml(type.itemName)}"></td>  
                                                    <td>${type.description}</td>                                             
                                                        <td><input style="width: 70px;text-align:right;" readonly="" class=" form-control input-mini validate[required] validate[custom[notzero],custom[float5]]" onpaste="return false" autocomplete="off"  name="qty" id="qty" onkeypress="return check_digit(event, this, 10, 3);"  type="text" value="${type.quantity}"></td>  
                                                        <td>${type.unit}
                                                            <select style="width: 100px;text-align:center;display: none"  id="requisitionUom" class="form-control input-sm validate[required]" onpaste="return false" onchange="calTotal(this, '${slNo}')"  tabindex="7">
                                                                <option value="${type.unit}">${type.unit}</option>
                                                            </select></td>
                                                            <td><input style="width: 70px;text-align:right;" readonly="" class="form-control  input-mini validate[custom[notzero],required,custom[float5]]" onpaste="return false" required="" autocomplete="off" onkeypress="return check_digit(event, this, 6, 3);" name="price" id="price" type="text" value="${type.unitPrice}"></td>
                                                        <td><input style="text-align:right;width:100px;"  class="form-control  input-mini  validate[required]" type="text" readonly onpaste="return false"  id="befdisc"  value="<fmt:formatNumber type="number" groupingUsed="false" pattern="0.000" maxFractionDigits="3" value="${type.quantity*type.unitPrice}"/>"></td>
                                                        <td><input style="width: 100%;text-align:right;" readonly="" class="form-control  input-mini validate[required,custom[float7]]" onpaste="return false" autocomplete="off" name="discount" id="discount" onkeypress="return check_digit(event, this, 2, 2);" type="text" value="${type.discount}"></td>
                                                        <td><input style="text-align:right;width:100%;"  class="form-control  input-mini  validate[required]" type="text" readonly onpaste="return false"  id="discountPrice"  value="<fmt:formatNumber type="number" groupingUsed="false" pattern="0.000"  maxFractionDigits="3" value="${(type.quantity*type.unitPrice)*(type.discount/100)}"/>"></td>
                                                        <td><input style="width: 100%;text-align:right;" class="form-control  input-mini validate[custom[notzero],required]" id="total" name="total" type="text" value="<fmt:formatNumber type="number" groupingUsed="false" pattern="0.000" maxFractionDigits="3" value="${type.totalPrice}"/>" readonly=""></td>
                                                        <td><input style="width: 100px;text-align:left;" class=" form-control input-small" name="delDate" readonly="" id="reqBefore${type.SNo}" type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.deliveryDate}"/>"></td>



                                                        <c:set value="${totalbefdisAmt + type.quantity*type.unitPrice}" var="totalbefdisAmt"/> 
                                                        <c:set value="${totaldisAmt + (type.quantity*type.unitPrice)*(type.discount/100)}" var="totaldisAmt"/> 
                                                        <c:set value="${gtotal + type.totalPrice}" var="totalAmt"/> 

                                                        <c:set value="${gtotal + type.totalPrice}" var="gtotal"/>
                                                    </tr>
                                                </c:forEach> 


                                            </tbody>

                                        </table>
                                    </div>
                                </div>



                                <div class="x_panel">

                                    <div class="row">
                                        <div class="col-sm-3">

                                            <label class="control-label"><span style="color: red">*</span> Payment Terms:</label>
                                            <!--<input  class="form-control validate[required]"   placeholder="" style="text-transform: capitalize" autocomplete="off" id="payTerms" name="payTerms" maxlength="180"  type="text" value="">-->                                                    
                                            <select disabled id="payTerms" name="payTerms" data-rel="chosen" required="" class="form-control  validate[required]" >
                                                <option value="${paymentTerms}">${paymentTerms}</option>
                                                <%--<c:forEach items="${paytermslist}" var="list">--%>
                                                    <!--<option value="${list.termName}">${list.termName}</option>--> 
                                                <%--</c:forEach>--%>
                                            </select>  




                                            <label class="control-label"><span style="color: red">*</span> Delivery Terms :</label>
                                            <!--<input  class="form-control validate[required]"   placeholder="" style="text-transform: capitalize" autocomplete="off" id="delTerms" name="delTerms" maxlength="180"  type="text" value="">-->                                                    
                                            <select disabled id="delTerms" name="delTerms" data-rel="chosen" required="" class="form-control  validate[required]" >
                                                <option value="${deliveryTerms}">${deliveryTerms}</option>
                                                <%--<c:forEach items="${delivtermslist}" var="list">--%>
                                                    <!--<option value="${list.termName}">${list.termName}</option>--> 
                                                <%--</c:forEach>--%>
                                            </select>  



<!--                                            <label class="control-label">Payment Terms</label>
                                            <input class="form-control  input-mini" id="payTerms" readonly="" name="payTerms" type="text" value="${paymentTerms}">


                                            <label class="control-label">Delivery Terms</label>
                                            <input class="form-control  input-mini" id="delTerms" readonly="" name="delTerms" type="text" value="${deliveryTerms}" >-->

                                            <label class="control-label">Warranty Period</label>
                                            <input class="form-control  input-mini" readonly="" id="warranty" name="warranty" type="text" maxlength="50" value="" >


<!--                                            <label class="control-label">PO Note:</label>
                                            <textarea class="form-control input-mini"   style="resize: none" id="poNote" name="poNote" type="text" value="" maxlength="120"></textarea>-->


                                        </div>

                                        <div class="col-md-offset-8 form-inline " > 
                                            <label class="control-label" style="font-size:  12px">Total Amount Before Discount:</label>
                                            <!--<span class="btn btn-sm">INR</span>-->                                    
                                            <input class="right form-control input-mini" style="font-weight: bold" readonly="" id="totalAmtBefDis" type="text" value="<fmt:formatNumber type="number" groupingUsed="false" pattern="0.000" maxFractionDigits="3" value="${totalbefdisAmt}"/>">                                   
                                        </div> 
                                        &nbsp;
                                        <div class="col-md-offset-8 form-inline " > 
                                            <label class="control-label" style="font-size:  12px">Total Discount Amount:</label>
                                            <!--<span class="btn btn-sm">INR</span>-->                                    
                                            <input class="right form-control input-mini" style="font-weight: bold" readonly="" id="totalDisAmt" type="text" value="<fmt:formatNumber type="number" groupingUsed="false" pattern="0.000" maxFractionDigits="3" value="${totaldisAmt}"/>">                                   
                                        </div> 
                                        &nbsp;
                                        <div class="col-md-offset-8 form-inline " > 
                                            <label class="control-label" style="font-size:  12px">Total Amount:</label>
                                            <!--<span class="btn btn-sm">INR</span>-->                                    
                                            <input class="right form-control input-mini" style="font-weight: bold" readonly="" id="totalAmt" type="text" value="<fmt:formatNumber type="number" groupingUsed="false" pattern="0.000" maxFractionDigits="3" value="${totalAmt}"/>">                                   
                                        </div> 
                                        &nbsp;
<!--                                        <div class="col-xs-offset-8 form-inline"> 
                                            <label class="control-label" style="font-size:  12px;" >Lumsum Discount(%):</label>
                                            <span class="btn btn-sm">INR</span>                                           
                                            <input class="right form-control input-mini validate[custom[float7]]" readonly="" onpaste="return false" maxlength="5" style="width: 70px" autocomplete="off" style="font-weight: bold" onkeypress="return check_digit(event, this, 2, 2);" id="lumsumdiscount" name="lumsumdiscount" type="text" value="0.0">

                                        </div> &nbsp;-->
                                        <div class="col-md-offset-8 " > 
                                            <label class="control-label" style="font-size:  18px">Grand Total:</label>
                                            <!--<span class="btn btn-sm">INR</span>-->
                                            <input class="right form-control input-mini" style="font-weight: bold" readonly="" id="grandTotal" name="grandTotal" type="text" value="<fmt:formatNumber type="number" groupingUsed="false" pattern="0.000" maxFractionDigits="3" value="${gtotal}"/>">
                                            <!--<input type="text" id="currCode" class="form-control input-mini" style="width: 50px" readonly="" value="">-->
                                        </div>                                         

                                    </div> 
                                    <div style="word-wrap: break-word; width: 1050px;" > 
                                        <label class=""  style="font-size:  13px">Remarks:</label> ${approverRemarks}

                                    </div> 
                                    <div class="clearfix"></div>
                                    <!--                                    <br/>-->

                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                        <div class="col-md-9 col-sm-9 col-xs-12">

                                            <p>&nbsp;</p>

                                            <!--<button type="submit" class="btn btn-primary" style="">Save</button>-->
                                            <!--<a href="../purchReq/approvedQuotList.htm"><button type="button" class="btn btn-danger" style="">Cancel</button></a>--> 

                                            <!--</div>-->
                                        </div>
                                    </div>

                                </div>
                                <div class="clearfix"></div>

                                <div class="clearfix"></div>                
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
        <script src="../common/theme/js/datatables/js/jquery.dataTables.js"></script>

        <script>
                                                $(document).ready(function () {
                                                    $('#quotform').validationEngine();
                                                });


                                                var asInitVals = new Array();
                                                $(document).ready(function () {
                                                    var oTable = $('#example').dataTable({
                                                        "oLanguage": {
                                                            "sSearch": "Search all columns:"
                                                        },
                                                        "aoColumnDefs": [
                                                            {
                                                                'bSortable': true,
                                                                'aTargets': [0]
                                                            } //disables sorting for column one
                                                        ],
                                                        'iDisplayLength': 10,
                                                        "sPaginationType": "full_numbers",
                                                        "dom": 'T<"clear">lfrtip',
                                                        "tableTools": {
                                                            "sSwfPath": "<?php echo base_url('assets2/js/Datatables/tools/swf/copy_csv_xls_pdf.swf'); ?>"
                                                        }
                                                    });
                                                    $("tfoot input").keyup(function () {
                                                        /* Filter on the column based on the index of this element's parent <th> */
                                                        oTable.fnFilter(this.value, $("tfoot th").index($(this).parent()));
                                                    });
                                                    $("tfoot input").each(function (i) {
                                                        asInitVals[i] = this.value;
                                                    });
                                                    $("tfoot input").focus(function () {
                                                        if (this.className == "search_init") {
                                                            this.className = "";
                                                            this.value = "";
                                                        }
                                                    });
                                                    $("tfoot input").blur(function (i) {
                                                        if (this.value == "") {
                                                            this.className = "search_init";
                                                            this.value = asInitVals[$("tfoot input").index(this)];
                                                        }
                                                    });
                                                });
        </script>
        <script>
            jQuery(document).ready(function () {

                var inputval = '#qty, #discount,#price';
                $(inputval).on('keyup click', function () {
                    var gt = 0;
                    var totalbefdisc = 0;
                    var totaldiscAmt = 0;
                    var $itemRow = $(this).closest('tr');
                    var z = $itemRow.find('#qty').val();
                    var zz = $itemRow.find('#price').val();
                    var ccc = $itemRow.find('#discount').val();
                    var lumsumdiscount = $('#lumsumdiscount').val();
                    var convFact = $itemRow.find('#requisitionUom').val();
                    var conVal = convFact.split("-");
                    var befdiscount = $itemRow.find('#qty').val() * $itemRow.find('#price').val();
                    $itemRow.find('#befdisc').val(parseFloat(befdiscount).toFixed(3));

                    var discount = $itemRow.find('#qty').val() * $itemRow.find('#price').val() * (1 - $itemRow.find('#discount').val() / 100);
//                                      var discountfinal = roundNumber(discount, 2);
                    var disPrice = parseFloat(befdiscount).toFixed(3) - parseFloat(discount).toFixed(3);

                    $itemRow.find('#discountPrice').val(parseFloat(disPrice).toFixed(3));
                    isNaN(discount) ? $itemRow.find('#total').val("N/A") : $itemRow.find('#total').val(parseFloat(discount).toFixed(3));
                    $('tr#quotPoForm').each(function () {
                        var $itemRow = $(this).closest('tr');
                        var total = $itemRow.find('#total').val();
                        var tbd = $itemRow.find('#befdisc').val();
                        var tda = $itemRow.find('#discountPrice').val();
                        totalbefdisc = parseFloat(tbd) + parseFloat(totalbefdisc);
                        totaldiscAmt = parseFloat(tda) + parseFloat(totaldiscAmt);
                        gt = parseFloat(total) + parseFloat(gt);
                    });
                    $('#totalAmtBefDis').val(parseFloat(totalbefdisc).toFixed(3));
                    $('#totalDisAmt').val(parseFloat(totaldiscAmt).toFixed(3));
                    $('#totalAmt').val(parseFloat(gt).toFixed(3));
                    gt = gt * (1 - lumsumdiscount / 100)
                    $('#grandTotal').val(parseFloat(gt).toFixed(3));

                });
                $('#lumsumdiscount').on('keyup change', function () {
                    var gt = 0;
                    var lumsumdiscount = $('#lumsumdiscount').val();
                    $('tr#quotPoForm').each(function () {
                        var $itemRow = $(this).closest('tr');
                        var total = $itemRow.find('#total').val();
                        gt = parseFloat(total) + parseFloat(gt);
                    });
                    gt = gt * (1 - lumsumdiscount / 100);
                    $('#grandTotal').val(parseFloat(gt).toFixed(3));
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
        </script>

        <script>
            $(document).ready(function () {

                $('tr#quotPoForm').each(function () {

                    var $itemRow1UF = $(this).closest('tr');

                    var itemcode = $itemRow1UF.find('#itemCode').val();
                    var requisitionUom = $itemRow1UF.find('#requisitionUom').val();
                    uomdisplay($itemRow1UF, itemcode, requisitionUom);


                });

            });
            function uomdisplay($itemRow1UF, c, requisitionUom)
            {


                $.ajax({
                    type: "POST",
                    url: "../purchase/uomlist.htm",
                    data: {code: c},
                    success: function (data) {
                        //                                                                    alert(data);
                        //                        
                        //                $('#requisitionUom').html("");
                        var toAppend = '';
                        var nameArray = data.split(",");

                        // toAppend += '<option value="">Select an Option</option>';                                                                   
                        //                                                                    for (var i = 0; i < nameArray.length; i++) {
                        if (nameArray[0] != "") {
                            toAppend += '<option value=' + '1' + '-' + nameArray[0] + '>' + nameArray[0] + '</option>';
                        }
//                        if (nameArray[1] != "" && nameArray[1] !== 'null' && nameArray[4] !== 'null' && parseFloat(nameArray[4]) !== 0) {
//                            toAppend += '<option value=' + nameArray[4] + '-' + nameArray[1] + '>' + nameArray[1] + '</option>';
//
//                        }
//                        if (nameArray[2] != "" && nameArray[2] !== 'null' && nameArray[5] !== 'null' && parseFloat(nameArray[5]) !== 0) {
//                            toAppend += '<option value=' + nameArray[5] + '-' + nameArray[2] + '>' + nameArray[2] + '</option>';
//                        }
//                        if (nameArray[3] != "" && nameArray[3] !== 'null' && nameArray[6] !== 'null' && parseFloat(nameArray[6]) !== 0) {
//                            toAppend += '<option value=' + nameArray[6] + '-' + nameArray[3] + '>' + nameArray[3] + '</option>';
//                        }

                        $itemRow1UF.find('#requisitionUom').html(toAppend);

                        //                $('#requisitionUom').append(toAppend);
                        $itemRow1UF.find('#requisitionUom option').each(function () {
                            var curUom = $itemRow1UF.find(this).val().split('-');
                            if (requisitionUom === curUom[1])
                            {
                                $itemRow1UF.find(this).prop('selected', true);
                            }
                        });

                    },
                    error: function (error) {
                        //                            alert(error);
                    }

                });



            }

            function changeCurrency() {

                var potype = $('#potype').val();
                if (potype === 'Local')
                {
                    $('#currency').html('<option value="OMR">OMR</option>');
                    $('#currCode').val('OMR');
                    return true;
                } else
                {
                    var xyz = '<option value="">Select Currency</option><c:forEach items="${currencyList}" var="list"><option value="${list.currencyCode}">${list.currencyCode}</option></c:forEach>';
                    $('#currency').html(xyz);
                }

            }
            function selectCurrency() {
                $('#currCode').val($('#currency').val());
            }

            function formValidation() {
//                var x = $('#billToAddress').val();
//                if (x == null || x == '')
//                {
//                    alert("Select Bill To Location");
//                    return false;
//                }
//                else {
//                    return true;
//                }
            }

            function selectBillToLoc() {

                myWindow = window.open("../purchase/billToLocPopUp.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
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


            function roundNumber(number, decimals) {
                //If it's not already a String
                var num2 = Math.floor(number * 1000) / 1000;
                return num2;
            }
            function openWindow() {

                myWindow = window.open("../purchase/selectSuppnamePopup.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
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
