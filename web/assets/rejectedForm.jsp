<%-- 
    Document   : rejectedForm
    Created on : Oct 14, 2016, 11:18:52 AM
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
            function calcQty(obj) {
                var curId = obj.id;
                var val = curId.charAt(0);
                var qty1 = parseFloat(document.getElementById(val + "qty").value);
                var accQty = parseFloat(document.getElementById(val + "qtyAccepted").value);
                var rejQty = parseFloat(qty1 - accQty);
                document.getElementById(val + "qtyRejected").value = rejQty;
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


            function qryVal(obj1) {

                var curId1 = obj1.id;
                var val1 = curId1.charAt(0);
                var qty1 = parseFloat(document.getElementById(val1 + "qty").value);
                var returnedQty = parseFloat(document.getElementById(val1 + "returnedQty").value);
                if (qty1 < returnedQty) {
                    document.getElementById(val1 + "returnedQty").value = '';
                    alert("Returned Quantity Should Be Lessthan Quantity Received");
                    return false;
                }
            }

            function rejected()
            {
                var poNo = document.getElementById('poNo').value;
//                var itemCode = document.getElementById('itemCode').value;

                window.location.href = "../assets/rejectedCheck.htm?poNo=" + poNo + "";
                // action="../Materialreceipts/inspectappFormSubmit.htm?" ;
            }
            
            function mandatoryFilds() {

                if (document.getElementById("remarks").value == "") {
                alert("Enter remarks");
                    return false;
                }  
                else {

                    document.forms["rejectFormid"].submit();
                }

                }
                //            function mandatoryFilds()
                    //            {
//
            //                var x = document.getElementById("remarks").value;
//
            //                if (x == '')
            //                {
//
                //                    alert("Please Fill Mandatory Fields .");
                //                    $('#remarks').focus();
//
                //                    return false;
                    //                }
//
//                else {
                //                    document.forms["rejectFormid"].submit();
                //                }
//            }
            function isNumberKey(evt)
            {
                var charCode = (evt.which) ? evt.which : event.keyCode
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                {
                    alert("Please Enter Numeric value");
                    return false;
                }
                return true;
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
                                <jsp:include page="../login/headerlink.htm?submodule=Quality Inspection&tab=Rejected Material&pagetype=form"/>
                                <div class="x_title">
                                    <h2>Rejected Form</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />
                                    <form class="form-inline" id="rejectFormid" action="../quality/rejectFormSubmit.htm"  method="post" enctype="multipart/form-data">
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
                                        <c:forEach items="${rejectedList}" var="list">
                                            <c:if test="${j eq 0}">
                                                <c:set var="j" value="1"/>
                                                <c:forEach items="${supp}" var="type">
                                                    <c:if test="${type.supplierName eq list[36]}">
                                                        <c:set var="supplierCode" value="${type.supplierCode}"/>
                                                        <c:set var="supplierName" value="${type.supplierName}"/>
                                                        <c:set var="supplierAddress" value="${type.supplierAddress}"/>
                                                        <c:set var="supplierContactNo" value="${type.supplierContNum}"/>
                                                        <c:set var="supplierMailId" value="${type.mailId}"/>
                                                    </c:if>                                   
                                                </c:forEach>
                                                <c:set var="poNo" value="${list[25]}"/>
                                                <c:set var="qa" value="${list[22]}"/>
                                                <c:set var="user" value="${list[39]}"/>
                                                <c:set var="batchNo" value="${list[1]}"/>
                                                <c:set var="customerInvoiceNo" value="${list[14]}"/>
                                                <c:set var="inventoryLocation" value="${list[4]}"/>
                                                <c:set var="customerInvoiceDate" value="${list[13]}"/>
                                            </c:if>
                                        </c:forEach>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                            <div class="col-md-5  form-inline"> 
                                                <label class="control-label">  PO No:</label></div>
                                            <div class="col-md-5  form-inline"> <span id="dynamicdiv" style="display: inline">${poNo}</span>
                                                <input name="poNo" id="poNo" value="${poNo}" type="hidden">
                                            </div>
                                            <div class="col-md-5  form-inline"> 
                                                <label class="control-label">  MR No:</label></div>
                                            <div class="col-md-5  form-inline"> <span id="dynamicdiv" style="display: inline">${qa}</span>
                                                <input class="form-control" name="qa" readonly="" type="hidden" value="${qa}" maxlength="80">
                                            </div>
                                            <div class="col-md-5  form-inline"> <label class="control-label">Supplier Name:</label></div> 
                                            <div class="col-md-5  form-inline"> ${supplierName}
                                                <input class="form-control" name="supplierName" readonly="" type="hidden" value="${supplierCode}" maxlength="80">
                                                <input class="form-control" name="supplierName11" readonly="" type="hidden" value="${supplierName}" maxlength="80">
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
                                                <input class="form-control" name="supplierContactNo" readonly="" type="hidden" value="${supplierContactNo}" maxlength="80">

                                            </div>
                                            <p>&nbsp;</p>

                                            <div class="col-md-5 col-sm-6 col-xs-6 form-inline">   
                                                <label class="control-label">Supplier Email Id:</label></div> 
                                            <div class="col-md-5  form-inline"> ${supplierMailId}
                                                <input class="form-control" name="supplierMailId" readonly="" type="hidden" value="${supplierMailId}" maxlength="80">
                                            </div>

                                            <p>&nbsp;</p>

                                            <div class="col-md-5  form-inline">   <label class="control-label">Supplier Invoice Date:</label></div> <div class="col-md-5 col-sm-6 col-xs-6 form-inline"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${customerInvoiceDate}" />
                                                <input name="customerInvoiceDate" id="customerInvoiceDate"type="hidden" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${customerInvoiceDate}" />" tabindex="-1"/>
                                            </div>
                                            <p>&nbsp;</p>  

                                        </div>
                                        <div class="col-md-4 col-sm-6 col-xs-12" style="float:right">

                                            <div class="col-md-5  form-inline">   <label class="control-label">Batch No:</label></div> <div class="col-md-5 col-sm-6 col-xs-6 form-inline">${batchNo}
                                                <input class="form-control" name="batchNo" readonly="" type="hidden" value="${batchNo}" maxlength="80">
                                            </div>

                                            <div class="col-md-5  form-inline">   <label class="control-label">QA By:</label></div> <div class="col-md-5 col-sm-6 col-xs-6 form-inline">${user}
                                                <input class="form-control" name="qaBy" readonly="" type="hidden" value="${user}" maxlength="80">
                                            </div>

                                            <div class="col-md-5  form-inline">   <label class="control-label">Supplier Invoice No:</label></div> <div class="col-md-5 col-sm-6 col-xs-6 form-inline">${customerInvoiceNo}
                                                <input class="form-control" name="customerInvoiceNo" readonly="" type="hidden" value="${customerInvoiceNo}" maxlength="80">
                                            </div>
                                            <p>&nbsp;</p>

                                            <div class="col-md-5  form-inline">   <label class="control-label">Inventory Location:</label></div> <div class="col-md-5 col-sm-6 col-xs-6 form-inline">${inventoryLocation}
                                                <input class="form-control" name="inventoryLocation" readonly="" type="hidden" value="${inventoryLocation}" maxlength="80">
                                            </div>
                                            <p>&nbsp;</p>

                                        </div>


                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <div class="x_panel" style="overflow:scroll">

                                                <div class="x_content">



                                                    <table class="table table-striped responsive-utilities jambo_table bulk_action" id="">
                                                        <thead>
                                                            <tr class="headings">


                                                                <th class="column-title">Accessory Code</th>
                                                                <th class="column-title">Accessory Name</th>
                                                                <th class="column-title">UOM</th>
                                                                <th class="column-title">Order Qty</th>
                                                                <th class="column-title">Accepted Qty</th>
                                                                <th class="column-title">Qty Rejected</th>
                                                                <th class="column-title">FOC</th>
                                                                <th class="column-title">Expiry Date</th>
                                                                <!--                                                                <th class="column-title">Warranty Period</th>-->

                                                            </tr>
                                                        </thead>

                                                        <tbody>


                                                            <c:forEach items="${rejectedList}" var="list">

                                                                <c:forEach items="${item}" var="list1">
                                                                    <c:if test="${list1.itemCode eq list[16]}">
                                                                        <c:set var="code" value="${list1.itemCode}"></c:set>
                                                                        <c:set var="name" value="${list1.itemName}"></c:set>
                                                                        <c:set var="itmDesc" value="${list1.itemDesc}"></c:set>
                                                                        <c:forEach items="${itemCat}" var="cat">
                                                                            <c:if test="${cat.categoryId eq list1.itemCategory}">
                                                                                <c:set var="itmCat" value="${cat.itemCategory}"></c:set>  
                                                                            </c:if>
                                                                        </c:forEach>                                                                                                                                                           
                                                                        <c:set var="itmCod" value="${list1.itemCode}"></c:set>
                                                                        <c:forEach items="${uom}" var="uom">
                                                                            <c:if test="${uom.uomName eq list1.itemUom}">
                                                                                <c:set var="uomName" value="${uom.uomName}"></c:set> 
                                                                            </c:if>
                                                                        </c:forEach>

                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:set var="j" value="${j+1}"/>
                                                                <c:set var="qaAcceptedQty" value="${list[28]}"/> 
                                                                <c:set var="ordered" value="${list[23]}"/> 
                                                                <c:set var="qtyRejected" value="${list[33]}"/>
                                                                <c:set var="foc" value="${list[10]}"/>
                                                                <c:set var="expiryDate" value="${list[9]}"/>
                                                                <%--   <c:set var="warrantyPeriod" value="${list.warrantyPeriod}"/>--%>


                                                                <tr class="even pointer">

                                                                    <td>
                                                                        <input class="form-control" style="width: 100%;text-align: left;" readonly="" name="itemCode" id="itemCode" value="${code}" type="text">
                                                                    </td>
                                                                    <td>
                                                                        <input class="form-control" style="width: 100%;text-align: left;" readonly="" name="itemName" id="itemName" value="${name}" type="text">
                                                                    </td>
                                                                    <td>
                                                                        <input class="form-control" style="width: 100%;text-align: left;" readonly="" name="uom" id="uom" value="${uomName}" type="text">
                                                                    </td>
                                                                    <td>
                                                                        <input class="form-control" style="width: 100%; text-align: right;" readonly="" name="orderedQty" id="orderedQty" value="${ordered} " type="text">
                                                                    </td>
                                                                    <td>
                                                                        <input class="form-control" style="width: 100%;text-align: right;" readonly="" name="qty" id="${j}qty" value="${qaAcceptedQty}" type="text">
                                                                    </td>
                                                                    <td>
                                                                        <input class="form-control"  style="width: 100%;text-align: right;"  name="rejectQty" id="${j}rejectQty" value="${qtyRejected}" type="text" onkeypress="return isNumberKey1(event)" readonly="" >
                                                                    </td> 
                                                                    <!--                                                            <td>
                                                                                                                                    <input style="width: 100%;" name="batchNo" id="batchNo" value="" type="">
                                                                                                                                </td>-->
                                                                    <td>
                                                                        <input class="form-control" style="width: 100%;text-align: right;" readonly="" name="foc" id="foc" value="${foc}" type="text">
                                                                    </td>

                                                                    <td>
                                                                        <input class="form-control" style="width: 100%;text-align: left;" id="${j}expiryDate"  readonly="" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${expiryDate}" />" type="text" name="expiryDate">   

                                                                    </td>
                                                                    <!--                                                                    <td>
                                                                                                                                            <input class="form-control" style="width: 100%;text-align: right;" name="warrwntyPeriod" id="warrwntyPeriod" readonly="" value="${warrantyPeriod}" type="" onkeypress="return checkdigit(event, this, 3, 0);">                                                 
                                                                                                                                        </td>-->
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
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                    <label class="control-label" style="margin-top:-20px;">Remarks
                                                    </label>
                                                    <textarea class="form-control" rows="1" style="resize: none" maxlength="200" value="" autocomplete="off" name="remarks" id="remarks" type="text"></textarea>
                                                </div>

                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                    <input id="saveInvoiceBtn" class="btn btn-primary" name="saveInvoice" value="Save" type="button" onclick="mandatoryFilds();">

                                                    <a href="../quality/rejectedList.htm" class="btn btn-danger">Cancel</a>
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

