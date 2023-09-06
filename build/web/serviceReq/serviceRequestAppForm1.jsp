<%-- 
    Document   : form1
    Created on : Feb 23, 2016, 3:24:29 PM
    Author     : Sudhanshu
--%>

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
        <script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript" charset="utf-8"></script>
        <script src="../common/validate/jquery.js" type="text/javascript" charset="utf-8"></script>
        <script type = "text/javascript" src = "../common/datepicker/datetimepicker_css.js" ></script>
        <link href="../common/theme/css/disableSelection.css" rel="stylesheet" type="text/css"/>
        <link href="../common/validate/validationEngine.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script src="../common/theme/css/csspopup.js" type="text/javascript"></script>

        <title>arête Assets Management</title>
    </head>
    <script>
        jQuery(document).ready(function () {
            $('#ServiceRequest1').validationEngine();
        });
        function selectTenant() {
            myWindow = window.open("../serviceReq/selectTenant.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
        }
        function selectItem() {
            var tenant = document.getElementById("tenantUniqueNo").value;
            var itemCate = document.getElementById("serviceCategory").value;
            if (tenant == '') {
                alert("Please Select Tenant Code!..");
                return false;
            }
            else if (itemCate == '') {
                alert("Please Select Item Category!..");
                return false;
            } else {
                myWindow = window.open("../serviceReq/selectItemCode.htm?itemCate=" + itemCate + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
        }

        function isNumberKey(evt)
        {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode >= 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }
        function checkGrid() {
            var table = document.getElementById("resourcetable");
            var length = table.rows.length;
            if (length <= 0) {
                alert("Add data into the grid!");
                return false;
            }
            return true;
        }

        function acjqty($this, val8) {
            var $itemRow = $($this).closest('tr');
            var val1 = $itemRow.find('#availQty1' + val8).val();
            var val2 = $itemRow.find('#reqQty' + val8).val();
            if (val2 === "0") {
                alert("Invalid Quantity...!!");
                $itemRow.find('#reqQty' + val8).val("");
            }
            else if (parseFloat(val1) < parseFloat(val2)) {
                alert("Please check the Available quantity");
                $itemRow.find('#reqQty' + val8).val("");
                $itemRow.find('#totalPrice' + val8).val("");
                return false;
            }
        }
        function calTotals($this, sno)
        {
            var $itemRow = $($this).closest('tr');
            var qty = $('#reqQty' + sno).val();
            var unitPrice = $('#unitPrice' + sno).val();
            var marginPrice = $('#marginPrice' + sno).val();
            if (qty == '0') {
                alert("Invalid Quantity...!!");
                $itemRow.find('#reqQty' + sno).val("");
//                $itemRow.find('#unitPrice' + sno).val("");
                return false;
            }
            else if (unitPrice == '0') {
                alert("Invalid Price...!!");
//                $itemRow.find('#reqQty' + sno).val("");
                $itemRow.find('#unitPrice' + sno).val("");
                return false;
            }
            else if (qty !== '' && qty !== null && unitPrice != '' && marginPrice != '')
            {
                var Qty1 = parseFloat(unitPrice) + parseFloat(marginPrice);
                var Qty2 = parseFloat(qty) * parseFloat(Qty1);
                $('#totalPrice' + sno).val(parseFloat(Qty2).toFixed(3));
            }
        }
        function test() {
            $('#itemCode').val('');
            $('#itemName').val('');
            $('#uom').val('');
            $('#availQty').val('');
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

        function rejects(srNo, status)
        {
            var remarks = $('#appremarks').val();
            if (remarks == null || remarks == '') {
                alert("Please Write Remarks..!!");
                return  false;
            } else {
                window.location.href = "../serviceReq/serviceRequestAppFormReject1.htm?srNo=" + srNo + "&recordstatus=" + status + "&appremarks=" + remarks + "";
            }
        }
    </script>
    <% java.util.Date d = new java.util.Date();%>
    <body class="nav-md">

                              <jsp:include page="../login/menu.htm" />


                        <main id="main" class="main">
                            <div>
                                <jsp:include page="../login/headerlink.htm?submodule=Service Request&tab=Approval 2&pagetype=form"/>
                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h5>Service Request Approval 2</h5>
                                                </div>


                                    <form id="ServiceRequest1" class="form-inline row" action="../serviceReq/serviceRequestAppFormSubmiter.htm" method="post" onsubmit="return checkGrid();">
                                        <c:forEach items="${test}" var="list">
                                            <c:if test="${list[0] eq '459'}">
                                                <c:set value="${list[1]}" var="field_1"/>
                                                <c:set value="${list[2]}" var="fieldStatus_1"/>
                                                <c:set value="${list[3]}" var="mand_status_1"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '460'}">
                                                <c:set value="${list[1]}" var="field_2"/>
                                                <c:set value="${list[2]}" var="fieldStatus_2"/>
                                                <c:set value="${list[3]}" var="mand_status_2"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '461'}">
                                                <c:set value="${list[1]}" var="field_3"/>
                                                <c:set value="${list[2]}" var="fieldStatus_3"/>
                                                <c:set value="${list[3]}" var="mand_status_3"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '462'}">
                                                <c:set value="${list[1]}" var="field_4"/>
                                                <c:set value="${list[2]}" var="fieldStatus_4"/>
                                                <c:set value="${list[3]}" var="mand_status_4"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '463'}">
                                                <c:set value="${list[1]}" var="field_5"/>
                                                <c:set value="${list[2]}" var="fieldStatus_5"/>
                                                <c:set value="${list[3]}" var="mand_status_5"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '464'}">
                                                <c:set value="${list[1]}" var="field_6"/>
                                                <c:set value="${list[2]}" var="fieldStatus_6"/>
                                                <c:set value="${list[3]}" var="mand_status_6"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '465'}">
                                                <c:set value="${list[1]}" var="field_7"/>
                                                <c:set value="${list[2]}" var="fieldStatus_7"/>
                                                <c:set value="${list[3]}" var="mand_status_7"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '466'}">
                                                <c:set value="${list[1]}" var="field_8"/>
                                                <c:set value="${list[2]}" var="fieldStatus_8"/>
                                                <c:set value="${list[3]}" var="mand_status_8"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '467'}">
                                                <c:set value="${list[1]}" var="field_9"/>
                                                <c:set value="${list[2]}" var="fieldStatus_9"/>
                                                <c:set value="${list[3]}" var="mand_status_9"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '468'}">
                                                <c:set value="${list[1]}" var="field_10"/>
                                                <c:set value="${list[2]}" var="fieldStatus_10"/>
                                                <c:set value="${list[3]}" var="mand_status_10"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '469'}">
                                                <c:set value="${list[1]}" var="field_11"/>
                                                <c:set value="${list[2]}" var="fieldStatus_11"/>
                                                <c:set value="${list[3]}" var="mand_status_11"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '470'}">
                                                <c:set value="${list[1]}" var="field_12"/>
                                                <c:set value="${list[2]}" var="fieldStatus_12"/>
                                                <c:set value="${list[3]}" var="mand_status_12"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '471'}">
                                                <c:set value="${list[1]}" var="field_13"/>
                                                <c:set value="${list[2]}" var="fieldStatus_13"/>
                                                <c:set value="${list[3]}" var="mand_status_13"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '472'}">
                                                <c:set value="${list[1]}" var="field_14"/>
                                                <c:set value="${list[2]}" var="fieldStatus_14"/>
                                                <c:set value="${list[3]}" var="mand_status_14"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '473'}">
                                                <c:set value="${list[1]}" var="field_15"/>
                                                <c:set value="${list[2]}" var="fieldStatus_15"/>
                                                <c:set value="${list[3]}" var="mand_status_15"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '474'}">
                                                <c:set value="${list[1]}" var="field_16"/>
                                                <c:set value="${list[2]}" var="fieldStatus_16"/>
                                                <c:set value="${list[3]}" var="mand_status_16"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '475'}">
                                                <c:set value="${list[1]}" var="field_17"/>
                                                <c:set value="${list[2]}" var="fieldStatus_17"/>
                                                <c:set value="${list[3]}" var="mand_status_17"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '476'}">
                                                <c:set value="${list[1]}" var="field_18"/>
                                                <c:set value="${list[2]}" var="fieldStatus_18"/>
                                                <c:set value="${list[3]}" var="mand_status_18"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '477'}">
                                                <c:set value="${list[1]}" var="field_19"/>
                                                <c:set value="${list[2]}" var="fieldStatus_19"/>
                                                <c:set value="${list[3]}" var="mand_status_19"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '478'}">
                                                <c:set value="${list[1]}" var="field_20"/>
                                                <c:set value="${list[2]}" var="fieldStatus_20"/>
                                                <c:set value="${list[3]}" var="mand_status_20"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '479'}">
                                                <c:set value="${list[1]}" var="field_21"/>
                                                <c:set value="${list[2]}" var="fieldStatus_21"/>
                                                <c:set value="${list[3]}" var="mand_status_21"/>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${fieldStatus_1 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_1 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_1}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(RequestList) > 0}">
                                                        <c:forEach items="${RequestList}" var="list">
                                                            <c:set value="${list.appremarks}" var="appremarks"/>
                                                            <c:set value="${list.serviceRequestNo}" var="serviceRequestNo"/>
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control"  readonly="" id="serviceRequestDate" name="serviceRequestDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.serviceRequestDate}"/>">
                                                                    <input type="hidden" name="pk" value="${list.sno}">
                                                                    <input type="hidden" name="status" value="${list.status}">
                                                                    <input type="hidden" name="serviceRequestNo" value="${list.serviceRequestNo}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" id="serviceRequestDate" readonly="" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.serviceRequestDate}"/>">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                       
                                                        <input type="text" class="form-control" readonly id="serviceRequestDate" name="serviceRequestDate" value="<%= (new SimpleDateFormat("dd-MMM-yyyy")).format(new java.util.Date())%>">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_2 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_2 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_2}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(RequestList) > 0}">
                                                        <c:forEach items="${RequestList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control"  readonly="" id="serviceRequesterName" name="serviceRequesterName" value="${list.serviceRequesterName}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="serviceRequesterName" value="${list.serviceRequesterName}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" placeholder="" readonly="" class="form-control" id="serviceRequesterName" name="serviceRequesterName" value="${userId}">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div></c:if>
                                        <c:if test="${fieldStatus_3 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_3 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_3}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(RequestList) > 0}">
                                                        <c:forEach items="${RequestList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control"  readonly="" id="tenantUniqueNo" name="tenantUniqueNo" value="${list.tenantUniqueNo}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantUniqueNo" value="${list.tenantUniqueNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Select Tenant" readonly="" class="form-control"  id="tenantUniqueNo" name="tenantUniqueNo" value="" onclick="return selectTenant();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if><p>&nbsp;</p>
                                        <c:if test="${fieldStatus_4 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_4 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_4}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control"  readonly="" id="propertyName" name="propertyName" maxlength="40" value="${list.assetName}" onkeypress="return isNumberKey3(event)">
                                                                    <input type="hidden" id="assetCode" name="assetCode" value="${list.assetCode}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="propertyName" value="${list.assetName}">
                                                                    <input type="hidden" id="assetCode" name="assetCode" value="${list.assetCode}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" readonly="" class="form-control"  id="propertyName" name="propertyName" maxlength="40" value="" onkeypress="return isNumberKey3(event)">
                                                        <input type="hidden" id="assetCode" name="assetCode" value="">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_5 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_5 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_5}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(subassDetails) > 0}">
                                                        <c:forEach items="${subassDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="propertyNo" name="propertyNo" value="${list.subAssetName}">
                                                                    <input type="hidden" id="subassetCode" name="subassetCode" value="${list.subAssetCode}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="propertyNo" value="${list.subAssetName}">
                                                                    <input type="hidden" id="subassetCode" name="subassetCode" value="${list.subAssetCode}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" readonly=""  class="form-control"  id="propertyNo" name="propertyNo" value="">
                                                        <input type="hidden" id="subassetCode" name="subassetCode" value="">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_6 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_6 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_6}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(RequestList) > 0}">
                                                        <c:forEach items="${RequestList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="serviceRequested" name="serviceRequested" value="${list.serviceRequested}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="serviceRequested" value="${list.serviceRequested}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" id="serviceRequested" name="serviceRequested" value="">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if><p>&nbsp;</p>
                                        <c:if test="${fieldStatus_7 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_7 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_7}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(RequestList) > 0}">
                                                        <c:forEach items="${RequestList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="completedBy" name="completedBy" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.completedBy}"/>" maxlength="20">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="completedBy" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.completedBy}"/>">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" readonly="" placeholder="Please select" class="form-control" id="completedBy" name="completedBy" value="" maxlength="20" onclick="javascript:NewCssCal('completedBy', 'ddMMMyyyy', '', '', '', '', '')">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${action ne 'view' && action ne 'edit'}">
                                            <c:if test="${fieldStatus_20 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_20 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_20}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(RequestList) > 0}">
                                                            <c:forEach items="${RequestList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" readonly="" id="serviceCategory" name="serviceCategory" value="${list.serviceCategory}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="serviceCategory" value="${list.serviceCategory}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <!--<input type="text" placeholder="" class="form-control" id="serviceCategory" name="serviceCategory" value="">-->
                                                            <select id="serviceCategory" class="form-control">
                                                                <option value="" disabled selected>Select your option</option>
                                                                <c:forEach items="${serCategory}" var="type">
                                                                    <option>${type}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_8 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_8 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_8}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(RequestList) > 0}">
                                                            <c:forEach items="${RequestList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" readonly="" id="serviceItems" name="serviceItems" value="${list.serviceItems}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="serviceItems" value="${list.serviceItems}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="Please Select Item" readonly="" class="form-control" id="serviceItems" name="serviceItems" value="" onclick="return selectItem();">
                                                            <input type="hidden" id="Itemname" value=""/>
                                                            <input type="hidden" id="itemUom" value=""/>
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                                <p>&nbsp;</p>
                                        </c:if>
                                        <c:if test="${fieldStatus_9 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_9 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_9}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(RequestList) > 0}">
                                                        <c:forEach items="${RequestList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="uom" name="uom" value="${list.uom}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="uom" value="${list.uom}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" id="uom" name="uom" value="">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_10 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_10 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_10}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(RequestList) > 0}">
                                                        <c:forEach items="${RequestList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="qty" name="qty" value="${list.qty}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="qty" value="${list.qty}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" id="qty" name="qty" value="">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_11 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_11 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_11}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(RequestList) > 0}">
                                                        <c:forEach items="${RequestList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="unitPrice" name="unitPrice" value="${list.unitPrice}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="unitPrice" value="${list.unitPrice}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" id="unitPrice" name="unitPrice" value="">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if> 
                                        <c:if test="${fieldStatus_12 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_12 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_12}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(RequestList) > 0}">
                                                        <c:forEach items="${RequestList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="margin" name="margin" value="${list.margin}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="margin" value="${list.margin}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" id="margin" name="margin" value="">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_13 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_13 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_13}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(RequestList) > 0}">
                                                        <c:forEach items="${RequestList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="totalPrice" name="totalPrice" value="${list.totalPrice}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="totalPrice" value="${list.totalPrice}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" id="totalPrice" name="totalPrice" value="">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_14 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_14 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_14}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(RequestList) > 0}">
                                                        <c:forEach items="${RequestList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <textarea type="text" rows="1" class="form-control" style="resize: none" readonly="" id="remarks" name="remarks">${list.remarks}</textarea>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <textarea type="text" rows="1" class="form-control" style="resize: none" readonly="" id="remarks">${list.remarks}</textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <textarea type="text" placeholder="" rows="1" style="resize: none" rows="1" class="form-control" id="remarks" name="remarks" value=""></textarea>
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>

                                            <p>&nbsp;</p>
                                            <p>&nbsp;</p>
                                            <p>&nbsp;</p>


                                            <div class="clearfix"></div>


                                        <c:if test="${action ne 'view' && action ne 'edit'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <!--<button type="button" class="btn btn-succ" style="" onclick="addToGrid();"><i class="fa fa-plus-circle"></i>ADD</button>-->
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div style="overflow: scroll;height: auto;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">
                                                <table class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                    <thead>
                                                        <tr>
                                                            <th><i class="fa fa-trash fa-lg"></i></th>
                                                            <th>Accessory Category</th>
                                                            <th>Accessory Code</th>
                                                            <th>Accessory Name</th>
                                                            <th>UOM</th>
                                                            <th>Quantity</th>
                                                            <th><a style="color:red;">*</a>Req. Quantity</th>
                                                            <th><a style="color:red;">*</a>Unit Price</th>
                                                            <th><a style="color:red;">*</a>Margin Price</th>
                                                            <th>Total Price</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="resourcetable">

                                                    </tbody>
                                                    <script>
                                                        var count = 0;
                                                        function addToGrid(val1, val2, val3, val4) {
                                                        var valid1 = true;
                                                                var x = document.getElementById('serviceRequested').value &&
                                                                document.getElementById('completedBy').value;
                                                                if (x == '')
                                                        {
                                                        alert("select Mandatory Fields");
                                                                return false;
                                                        }
                                                        if (valid1 === true) {
                                                        var serviceCategory = document.getElementById('serviceCategory').value;
                                                                $('#resourcetable tr').each(function () {
                                                        $(this).find('td').each(function () {
                                                        var a = $(this).find('#itemCode').val();
                                                                var itmName = $(this).find('#Itemname').val();
                                                                if (a === val1) {
                                                        alert('Record already added to grid');
                                                                document.getElementById('td').value = "";
                                                                return false;
                                                        } else {
                                                        return true;
                                                        }
                                                        });
                                                        });
                                                                if (val1 != "")
                                                        {
                                                        var table = document.getElementById("resourcetable");
                                                                var slNo1 = table.rows.length;
                                                                var slNo = count;
                                                                var tr = table.insertRow(slNo1);
                                                                tr.id = 'list_tr_' + slNo;
                                                                tr.innerHTML = '<td align="center" class="tinput"><button type="button" class="fa fa-trash fa-lg-o" onclick="removeRow(' + slNo + ')" style=""></button> </td>' +
                                                                '<td class="tinput"><input style="width: 100%; text-align:center;" class="form-control" type="text" readonly name="serviceCategory" value="' + serviceCategory +
                                                                '" style="border: none"></td><td class="tinput"><input style="width: 100%; text-align:center;" class="form-control" type="text" readonly name="itemCode" id="itemCode" value="' + val1 +
                                                                '" style="border: none"></td><td class="tinput"><input style="width: 100%; text-align:center;" class="form-control" type="text" readonly name="itemName" id="itemName" value="' + val2 +
                                                                '" style="border: none"></td><td class="tinput"><input style="width: 100%; text-align:center;" class="form-control" type="text" readonly name="uom" id="uom" value="' + val3 +
                                                                '" style="border: none"></td><td class="tinput"><input style="width: 100%; text-align:center;" class="form-control" type="text" readonly name="availQty" id="availQty1' + slNo + '" value="' + val4 +
                                                                '" style="border: none"></td><td class="tinput"><input style="text-align:center;width: 100%;" height:30px; class="form-control" autocomplete="off" onpaste="return false" required type="text"  name="reqQty" id="reqQty' + slNo + '" value=""  maxlength="10" onkeyup="acjqty(this,' + slNo + ');calTotal(this,' + slNo + ');" style="border: none" onkeypress=" return isNumberKey(event);"></td>\n\
                                                                                                        <td class="tinput"><input style="text-align:center;width: 100%;" height:30px; class="form-control" autocomplete="off" onpaste="return false" required type="text"  name="unitPrice" id="unitPrice' + slNo + '" value=""  onkeyup="calTotal(this,' + slNo + ');" maxlength="10" style="border: none" onkeypress=" return isNumberKey(event);"></td>\n\
                                                            <td class="tinput"><input style="text-align:center;width: 100%;" height:30px; class="form-control" autocomplete="off" onpaste="return false" required type="text"  name="marginPrice" id="marginPrice' + slNo + '" value=""  onkeyup="calTotal(this,' + slNo + ');" maxlength="10" style="border: none" onkeypress=" return isNumberKey(event);"></td>\n\
                                                            <td class="tinput"><input style="text-align:center;width: 100%;" class="form-control" readonly type="text"  name="totalPrice" id="totalPrice' + slNo + '" value="" style="border: none"></td>';
                                                        }
                                                        count++;
                                                        }
                                                        //                                                         }
                                                        function removeRow(id) {
                                                        count--;
                                                                var table = document.getElementById("resourcetable");
                                                                for (var i = 0; i < table.rows.length; i++) {
                                                        var lr = table.rows[i];
                                                                if (lr.id == 'list_tr_' + id) {
                                                        table.deleteRow(i);
                                                                return;
                                                        }
                                                        }
                                                        }
                                                        function clearForm() {
                                                        $('#serviceCategory').val('');
                                                                $('#itemCode').val('');
                                                                $('#itemName').val('');
                                                                $('#expiryDate').val('');
                                                                $('#uom').val('');
                                                                $('#availQty').val('');
                                                                $('#reason').val('');
                                                        }

                                                    </script>

                                                </table>
                                            </div>
                                        </c:if>
                                        <c:if test="${action eq 'view' || action eq 'edit'}">
                                            <div class="clearfix"></div>
                                            <table class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                <thead>
                                                    <tr>
                                                        <!--<th><i class="fa fa-trash fa-lg"></i></th>-->
                                                        <th>Accessory Category</th>
                                                        <th>Accessory Code</th>
                                                        <th>Accessory Name</th>
                                                        <th>UOM</th>
                                                        <th>Available Quantity</th>
                                                        <th><a style="color:red;">*</a>Required Quantity</th>
                                                        <th><a style="color:red;">*</a>Unit Price</th>
                                                        <th><a style="color:red;">*</a>Margin Price</th>
                                                        <th>Total Price</th>
                                                    </tr>
                                                </thead> </c:if>
                                            <c:if test="${action eq 'view'}">
                                                <tbody id="resourcetable">
                                                    <c:set var="i" value="1"/>
                                                    <c:forEach items="${RequestListve}" var="list">
                                                        <c:forEach items="${inventory}" var="type">
                                                            <c:forEach items="${itemCode}" var="mass">
                                                                <c:forEach items="${itemCate}" var="mass1">
                                                                    <c:forEach items="${uom}" var="mass2">
                                                                        <c:if test="${mass.itemUom eq mass2.uomName}">
                                                                            <c:if test="${mass.itemCategory eq mass1.itemCategory}">
                                                                                <c:if test="${list.itemCode eq mass.itemCode}">
                                                                                    <c:if test="${list.itemCode eq type.itemCode}">
                                                                                        <tr>
                                                                                            <td class="center" style="text-align: left;">${mass1.itemCategory}</td>
                                                                                            <td class="center" style="text-align: left;">${mass.itemCode}</td>
                                                                                            <td class="center" style="text-align: left;">${mass.itemName}</td>
                                                                                            <td class="center" style="text-align: left;">${mass2.uomName}</td>
                                                                                            <td class="center" style="text-align: right;">${type.stockQty}</td>
                                                                                            <td class="center" style="text-align: right;"><fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.qty}" /></td>
                                                                                            <td class="center" style="text-align: right;"><fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.unitPrice}" /></td>
                                                                                            <td class="center" style="text-align: right;"><fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.margin}" /></td>
                                                                                            <td class="center" style="text-align: right;"><fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.totalPrice}" /></td>
                                                                                        </tr>
                                                                                        <c:set var="i" value="${i+1}"/>
                                                                                    </c:if>
                                                                                </c:if>
                                                                            </c:if>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </c:forEach>
                                                            </c:forEach>
                                                        </c:forEach>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </c:if>
                                        <c:if test="${action eq 'edit'}">
                                            <tbody id="resourcetable">
                                                <c:set var="i" value="1"/>
                                                <c:forEach items="${RequestListve}" var="list">
                                                    <c:forEach items="${inventory}" var="type">
                                                        <c:forEach items="${itemCode}" var="mass">
                                                            <c:forEach items="${itemCate}" var="mass1">
                                                                <c:forEach items="${uom}" var="mass2">
                                                                    <c:if test="${mass.itemUom eq mass2.uomName}">
                                                                        <c:if test="${mass.itemCategory eq mass1.itemCategory}">
                                                                            <c:if test="${list.itemCode eq mass.itemCode}">
                                                                                <c:if test="${list.itemCode eq type.itemCode}">
                                                                                    <tr>
                                                                                        <td class="center" style="text-align: left;">${mass1.itemCategory}<input type="hidden" name="sno" value="${list.sno}"/></td>
                                                                                        <td class="center" style="text-align: left;">${mass.itemCode}</td>
                                                                                        <td class="center" style="text-align: left;">${mass.itemName}</td>
                                                                                        <td class="center" style="text-align: left;">${mass2.uomName}</td>
                                                                                        <td class="center" style="text-align: right;">${type.stockQty}</td>                                                                    
                                                                                        <td class="center"><input  style="width: 100px;text-align:right;background-color: rgb(246, 246, 229);" class=" form-control input-mini" onpaste="return false" autocomplete="off" required="" name="reqQty" id="reqQty${list.sno}" maxlength="14" onkeypress="return check_digit(event, this, 10, 3);" onkeyup="calTotals(this,${list.sno});" type="text" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.qty}" />"></td>
                                                                                        <td class="center"><input  style="width: 100px;text-align:right;background-color: rgb(246, 246, 229);" class=" form-control input-mini" onpaste="return false" autocomplete="off" required="" name="unitPrice" id="unitPrice${list.sno}" maxlength="14" onkeypress="return check_digit(event, this, 10, 3);" onkeyup="calTotals(this,${list.sno});" type="text" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.unitPrice}" />"></td>
                                                                                        <td class="center"><input  style="width: 100px;text-align:right;background-color: rgb(246, 246, 229);" class=" form-control input-mini " onpaste="return false" autocomplete="off" required="" name="marginPrice" id="marginPrice${list.sno}" maxlength="14" onkeypress="return check_digit(event, this, 10, 3);" onkeyup="calTotals(this,${list.sno});" type="text" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.margin}" />"></td>
                                                                                        <td class="center"><input  style="width: 100px;text-align:right;" class=" form-control" readonly name="totalPrice" id="totalPrice${list.sno}" type="text" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.totalPrice}" />"></td>
                                                                                    </tr>
                                                                                    <c:set var="i" value="${i+1}"/>
                                                                                </c:if>
                                                                            </c:if>
                                                                        </c:if>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </c:forEach>
                                                        </c:forEach>
                                                    </c:forEach>
                                                </c:forEach>
                                            </tbody>
                                            </table>
                                        </c:if>
                                        <p>&nbsp;</p>
                                        <table id="" class="table table-striped responsive-utilities jambo_table" style="">
                                            <thead >
                                                <tr class="headings">     
                                                    <th >Role</th>
                                                    <!--<th >Name</th>-->
                                                    <th >Date</th>
                                                    <th >Remarks</th>
                                                </tr>      
                                            </thead>        
                                            <tbody> 
                                                <c:forEach items="${RequestList}" var="list">
                                                    <c:set var="appremarks" value="${list.appremarks}" /> 
                                                    <c:set var="appremarks1" value="${list.appremarks1}" /> 
                                                    <c:if test="${appremarks ne null}">
                                                        <tr>
                                                            <td class="center" style="text-align: left;"><b>GFC</b></td>
                                                            <!--<td class="center" style="text-align: left;">${list.userId}</td>-->
                                                            <td class="center" style="text-align: left;"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${list.lastmodifiedDate}" /></td>
                                                            <td class="center" style="text-align: left;">${appremarks}</td>
                                                        </tr>
                                                    </c:if>
                                                    <c:if test="${appremarks1 ne null}">
                                                        <tr>
                                                            <td class="center" style="text-align: left;"><b>CFO</b></td>
                                                            <!--<td class="center" style="text-align: left;">${list.userId}</td>-->
                                                            <td class="center" style="text-align: left;"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${list.lastmodifiedDate}" /></td>
                                                            <td class="center" style="text-align: left;">${appremarks1}</td>
                                                        </tr>
                                                    </c:if>

                                                </c:forEach> 
                                            </tbody>
                                        </table>
                                        <p>&nbsp;</p>
                                        <c:if test="${action ne 'view'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <a style="color:red;">*</a>
                                                <label class="control-label">Remarks</label>                                       
                                                <textarea  class="form-control" required rows="1" type="text" id="appremarks" style="resize: none;" name="appremarks" maxlength="120" ></textarea> 
                                            </div>
                                        </c:if>

                                        <%--<c:if test="${action eq 'view'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <a style="color:red;">*</a>
                                                    <label class="control-label">Remarks</label>                                       
                                                    <textarea  class="form-control" readonly="" rows="1" type="text" id="appremarks" style="resize: none;" name="appremarks" maxlength="120" >${appremarks}</textarea> 
                                                </div>
                                        </c:if>--%>
                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>
                                        <c:if test="${action ne 'view'}">
                                            <!--<div class="col-md-4 col-sm-12 col-xs-12 form-inline">-->
                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                <!--<button type="submit" class="btn btn-primary" style="">Save</button>-->
                                                <input class="btn btn-primary"  value="Approve" type="submit" onclick="if (confirm('Do you really want to Approve this record')) {
                                                            return true;
                                                            } else {
                                                            return false;
                                                            }">
                                                <button type="button" class="btn btn-warning" style="" onclick="rejects('${serviceRequestNo}', 'Rejected');">Reject</button>
                                                <a href="../serviceReq/serviceRequestAppList1.htm" class="btn btn-danger" style="">Cancel</a>
                                            </div>
                                            <!--</div>-->  
                                        </c:if>
                                    </form>
                                </div> 
 </div>
                                        </div>

                                    </div>
                                </div>
                            </section>

                        </main><!-- End #main -->
                        <jsp:include page="../login/footer.jsp" />

    </body>

</html>
