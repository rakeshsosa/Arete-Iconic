<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en"><head>
        <title>arête Assets Management</title>
        <meta charset="utf-8">
        <meta name="author" content="Sudhanshu">
        <link href="../common/theme/css/disableSelection.css" rel="stylesheet" type="text/css"/>
        <!-- Bootstrap / Font Awesome / jQuery Autocomplete Styles -->
        <link href="../porder/bootstrap.css" rel="stylesheet">
        <link href="../bill/font-awesome.css" rel="stylesheet">

        <!-- Needed Assets -->
        <!-- Custom styles for our invoice -->
        <link href="../porder/styles.css" rel="stylesheet">
        <!-- Custom jQuery UI - Used for AutoComplete Menu Styles -->
        <link href="../bill/jquery-ui-1.css" rel="stylesheet">

        <link href="../bill/print.css" media="print" rel="stylesheet">

        <script type='text/JavaScript' src='../common/scw.js'></script>


        <link rel="stylesheet" href="../common/validate/validationEngine.css" type="text/css">
        <script src="../common/validate/jquery-1.js" type="text/javascript">
        </script>
        <script src="../common/validate/jquery_002.js" type="text/javascript" charset="utf-8">
        </script>
        <script src="../common/validate/jquery.js" type="text/javascript" charset="utf-8">
        </script>
        <script type = "text/javascript" src = "../common/datepicker/datetimepicker_css.js" ></script>
        <%
            Date date = new Date();
        %>

        <script>

            $(document).ready(function (val) {
                $('#issuingqty' + val).bind("cut copy paste", function (e) {
                    e.preventDefault();
                });
            });


            function acjqty($this, val8) {

                var $itemRow = $($this).closest('tr');

                var val = $itemRow.find('#avqty').val() - $itemRow.find('#issueqty' + val8).val();
                var val1 = $itemRow.find('#pending').val();
                //alert(val1);
                var val2 = $("#total" + val8).val();
                //alert(val2);
                if (parseFloat(val) < 0) {
                    alert("Please check the Available quantity");
                    $itemRow.find('#issueqty' + val8).val("");
                    //$itemRow.find('#rejectedQty').val("N/A");
                    return false;
                }
                else if (parseFloat(val2) > parseFloat(val1)) {
                    alert("Please check the Pending quantity");
                    $itemRow.find('#issueqty' + val8).val("");
                    return false;
                }
            }

            function calTotal($this, sno)
            {
                var $itemRow = $($this).closest('tr');
                var totalStock = $('#totalStock' + sno).val();
                var reqQty = $('#reqQty' + sno).val();
                var qty = $('#issuingqty' + sno).val();
                if (qty === "0") {
                    alert("Invalid Quantity...!!")
                    $itemRow.find('#issuingqty' + sno).val("");
                    return false;
                }
                else if (parseFloat(totalStock) < parseFloat(qty)) {
                    alert("Please Check the Available Quantity...!!")
                    $itemRow.find('#issuingqty' + sno).val("");
                    return false;
                }
                else if (parseFloat(qty) > parseFloat(reqQty)) {
                    alert("Please Check the Required Quantity...!!")
                    $itemRow.find('#issuingqty' + sno).val("");
                    return false;
                }
                var Price = $('#price' + sno).val();
                if (qty !== '')
                {
                    var Qty2 = parseFloat(qty) * parseFloat(Price);
                    var invtn = parseFloat(totalStock) - parseFloat(qty);
                    $('#totalPrice' + sno).val(parseFloat(Qty2).toFixed(3));
                    $('#invent' + sno).val(parseFloat(invtn));
                }
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
    </head>
    <body class="nav-md">

        <div class="container body">


            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->

                <div class="right_col" role="main">
                    <div class="">
                        <div class="x_panel">
                            <jsp:include page="../login/headerlink.htm?submodule=Material Issue&tab=Material Approval&pagetype=form"/>
                            <div class="page-title">
                                <div class="title_left">
                                    <h4>Material Approval</h4>
                                </div>
                            </div>
                            <div class="clearfix" style="height:1px"></div>
                            <div class="x_title">  </div>
                            <form id="matissue" class="form-inline" method="post" action="../serviceReq/materialIssueSubmit1.htm" id="imForm">

                                <c:set var="j" value="0"/>
                                <c:forEach items="${RequestList}" var="list">
                                    <c:if test="${j eq 0}">
                                        <c:set var="j" value="1"/>
                                        <c:set var="serviceRequestNo" value="${list.serviceRequestNo}"/>
                                        <c:set var="serviceRequestDate" value="${list.serviceRequestDate}"/>
                                        <c:set var="serviceRequesterName" value="${list.serviceRequesterName}"/>
                                        <c:set var="tenantUniqueNo" value="${list.tenantUniqueNo}"/>
                                        <c:set var="serviceRequested" value="${list.serviceRequested}"/>
                                        <c:set var="propertyName" value="${list.propertyName}"/>
                                        <c:set var="propertyNo" value="${list.propertyNo}"/>
                                        <c:set var="completedBy" value="${list.completedBy}"/>

                                    </c:if>
                                </c:forEach>
                                <c:forEach items="${assetDetails}" var="list1">
                                    <c:set var="assetCode" value="${list1.assetCode}"/>
                                    <c:set var="assetDetails" value="${list1.assetName}"/>
                                </c:forEach>
                                <c:forEach items="${subassDetails}" var="list2">
                                    <c:set var="subAssetCode" value="${list2.subAssetCode}"/>
                                    <c:set var="subassDetails" value="${list2.subAssetName}"/>
                                </c:forEach>
                                <div class="row">
                                    <div class="col-md-4 col-sm-6 col-xs-12">
                                        <div class="input-group">

                                            <div> <h5> <strong>MI Date:</strong> <fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="<%=date%>" /></h5> 
                                                <input name="miDate" type="hidden" value="<fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss a" value="<%=date%>" />" tabindex="-1"/>
                                            </div>
                                            <div> <h5> <strong>Service Request No:</strong> ${serviceRequestNo}</h5>
                                                <input name="reqNo" value="${serviceRequestNo}" type="hidden">
                                            </div>
                                            <div> <h5> <strong>Service Request Date:</strong><fmt:formatDate pattern="dd-MMM-yyyy" value="${serviceRequestDate}" /> </h5>
                                                <input name="reqDate" value="${serviceRequestDate}" type="hidden">
                                            </div>
                                            <div> <h5><strong>Service Requester Name:</strong> ${serviceRequesterName}</h5>
                                                <input name="serviceRequesterName" value="${serviceRequesterName}" type="hidden" >
                                            </div>
                                            <div> <h5><strong>Service Requested:</strong> ${serviceRequested}</h5>
                                                <input name="serviceRequested" value="${serviceRequested}" type="hidden" >
                                            </div>
                                            <div> <h5> <strong>Completed By:</strong> <fmt:formatDate pattern="dd-MMM-yyy" value="${completedBy}"/></h5>
                                                <input name="completedBy" value="${completedBy}" type="hidden">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-6 col-xs-12" style="float:right">

                                        <div> <h5><strong>Tenant Code:</strong> ${tenantUniqueNo}</h5>
                                            <input name="tenantUniqueNo" id="tenantUniqueNo" value="${tenantUniqueNo}" type="hidden">
                                            <input name="orgCode" id="orgCode" value="${orgCode}" type="hidden">
                                        </div>

                                        <div> <h5> <strong>Property Name:</strong> ${assetDetails}</h5>
                                            <input name="propertyName" value="${assetCode}" type="hidden">
                                        </div>
                                        <div> <h5> <strong>Flat Name:</strong> ${subassDetails}</h5>
                                            <input name="propertyNo" value="${subAssetCode}" type="hidden">
                                        </div>
                                        <c:if test="${action eq 'edit'}">
                                            <c:forEach items="${materialIssue1}" var="type">
                                                <c:set var="appremarks" value="${type.remarks}"/>
                                                <c:set var="miNo" value="${type.miNo}"/>
                                                <div> <h5> <strong>Issued By:</strong> <input class="form-control" readonly name="issuedBy" value="${type.issuedBy}" type="text"><input name="miNo" value="${miNo}" type="hidden"></h5>
                                                </div>
                                                <div> <h5> <strong>Issued To:</strong> <input class="form-control" readonly name="issuedTo" value="${type.issuedTo}" type="text"></h5>
                                                </div>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${action eq 'view'}">
                                            <c:forEach items="${materialIssue1}" var="type">
                                                <c:set var="appremarks" value="${type.remarks}"/>
                                                <div> <h5> <strong>Issued By:</strong> <input class="form-control" readonly name="issuedBy" value="${type.issuedBy}" type="text"></h5>
                                                </div>
                                                <div> <h5> <strong>Issued To:</strong> <input class="form-control" readonly name="issuedTo" value="${type.issuedTo}" type="text"></h5>
                                                </div>
                                            </c:forEach>
                                        </c:if>
                                    </div>

                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <div class="clearfix"></div>
                                    <table class="table table-striped responsive-utilities jambo_table" id="membertable">
                                        <thead>
                                            <tr>
                                                <!--<th><i class="fa fa-trash fa-lg"></i></th>-->
                                                <th>Accessory Category</th>
                                                <th>Accessory Code</th>
                                                <th>Accessory Name</th>
                                                <th>UOM</th>
                                                    <c:if test="${action eq 'edit'}">
                                                    <th>Available Quantity</th>
                                                    </c:if>
                                                <th>Required Quantity</th>
                                                <th><a style="color:red;">*</a>Issuing Quantity</th>
                                                <th>Total Price</th>
                                            </tr>
                                        </thead>
                                        <c:if test="${action eq 'edit'}">
                                            <tbody id="resourcetable">
                                                <c:set var="i" value="1"/>
                                                <c:forEach items="${materialIssue}" var="list" >
                                                    <%--<c:forEach items="${RequestListve}" var="list1">--%>
                                                    <c:forEach items="${inventory}" var="type">
                                                        <c:forEach items="${itemCode}" var="mass">
                                                            <c:forEach items="${itemCate}" var="mass1">
                                                                <c:forEach items="${uom}" var="mass2">
                                                                    <c:if test="${mass.itemUom eq mass2.uomName}">
                                                                        <c:if test="${mass.itemCategory eq mass1.itemCategory}">
                                                                            <c:if test="${list.itemCode eq mass.itemCode}">
                                                                                <%--<c:if test="${list.srNo eq list1.serviceRequestNo}">--%>
                                                                                <c:if test="${list.itemCode eq type.itemCode}">
                                                                                    <tr>
                                                                                        <td style="text-align: left;">${mass1.itemCategory}<input  style="width: 100px;text-align:center;" class="form-control" readonly name="serviceCategory" id="serviceCategory" type="hidden" value="${mass1.itemCategory}"><input type="hidden" name="sno" value="${list.sno}"/></td>
                                                                                        <td class="center" style="text-align: left;">${mass.itemCode}<input  style="width: 100px;text-align:center;" class=" form-control" readonly name="itemCode" id="itemCode" type="hidden" value="${mass.itemCode}"></td>
                                                                                        <td class="center" style="text-align: left;">${mass.itemName}<input  style="width: 100px;text-align:center;" class=" form-control" readonly name="itemName" id="serviceItems" type="hidden" value="${mass.itemName}"></td>
                                                                                        <td class="center" style="text-align: left;">${mass2.uomName}<input  style="width: 100px;text-align:center;" class=" form-control" readonly name="uom" id="uom" type="hidden" value="${mass2.uomName}"></td>
                                                                                        <td class="center" style="text-align: right;">${type.stockQty}<input  style="width: 100px;text-align:center;" class=" form-control" readonly name="totalStock" id="totalStock${list.sno}" type="hidden" value="${type.stockQty}"><input type="hidden" id="totalStock" value="${type.stockQty}"></td>
                                                                                        <td class="center" style="text-align: right;"><fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.reqQty}" /><input  style="width: 100px;text-align:center;" class=" form-control" readonly name="reqQty" id="reqQty${list.sno}"type="hidden" value="${list.reqQty}"><input type="hidden" id="price${list.sno}" name="price" value="${list.priceum}"/></td>
                                                                                        <td class="center" style="text-align: right;">
                                                                                            <c:choose>
                                                                                                <c:when test="${list.qty gt type.stockQty}">
                                                                                                    <input style="width: 100px;text-align:right;background-color: rgb(246, 246, 229);" class=" form-control input-mini s" onpaste="return false" autocomplete="off" required="" name="issuingqty" id="issuingqty${list.sno}" maxlength="14" onkeypress="return check_digit(event, this, 10, 3);" onkeyup="calTotal(this,${list.sno});" type="text" value="">
                                                                                                </c:when>
                                                                                                <c:otherwise>
                                                                                                    <input style="width: 100px;text-align:right;background-color: rgb(246, 246, 229);" class=" form-control input-mini" onpaste="return false" autocomplete="off" required="" name="issuingqty" id="issuingqty${list.sno}" maxlength="14" onkeypress="return check_digit(event, this, 10, 3);" onkeyup="calTotal(this,${list.sno});" type="text" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.qty}" />">
                                                                                                </c:otherwise>
                                                                                            </c:choose>
                                                                                        </td>
                                                                                        <td class="center" style="text-align: right;"><input  style="width: 100px;text-align:right;" class=" form-control" readonly name="totalPrice" id="totalPrice${list.sno}" type="text" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.totalPrice}" />"><input type="hidden" id="invent${list.sno}" name="invent" value="${type.stockQty - list.qty}"/></td>
                                                                                    </tr>
                                                                                    <c:set var="i" value="${i+1}"/>
                                                                                </c:if>
                                                                            </c:if>  
                                                                        </c:if>  
                                                                    </c:if>  
                                                                    <%--</c:if>--%>  
                                                                </c:forEach>
                                                            </c:forEach>
                                                        </c:forEach>
                                                    </c:forEach>
                                                </c:forEach>
                                                <%--</c:forEach>--%>
                                            </tbody>
                                        </c:if>
                                        <c:if test="${action eq 'view'}">
                                            <tbody id="resourcetable">
                                                <c:set var="i" value="1"/>
                                                <c:forEach items="${materialIssue}" var="list">
                                                    <c:forEach items="${inventory}" var="type">
                                                        <c:forEach items="${itemCode}" var="mass">
                                                            <c:forEach items="${itemCate}" var="mass1">
                                                                <c:forEach items="${uom}" var="mass2">
                                                                    <c:if test="${mass.itemUom eq mass2.uomName}">
                                                                        <c:if test="${mass.itemCategory eq mass1.itemCategory}">
                                                                            <c:if test="${list.itemCode eq mass.itemCode}">
                                                                                <c:if test="${list.itemCode eq type.itemCode}">
                                                                                    <tr>
                                                                                        <td style="text-align: left;">${mass1.itemCategory}<input  style="width: 100px;text-align:center;" class="form-control" readonly name="serviceCategory" id="serviceCategory" type="hidden" value="${mass1.itemCategory}"><input type="hidden" name="sno" value="${list.sno}"/></td>
                                                                                        <td class="center" style="text-align: left;">${mass.itemCode}<input  style="width: 100px;text-align:center;" class=" form-control" readonly name="itemCode" id="itemCode" type="hidden" value="${mass.itemCode}"></td>
                                                                                        <td class="center" style="text-align: left;">${mass.itemName}<input  style="width: 100px;text-align:center;" class=" form-control" readonly name="itemName" id="serviceItems" type="hidden" value="${mass.itemName}"></td>
                                                                                        <td class="center" style="text-align: left;">${mass2.uomName}<input  style="width: 100px;text-align:center;" class=" form-control" readonly name="uom" id="uom" type="hidden" value="${mass2.uomName}"></td>
                                                                                        <td class="center" style="text-align: right;">${list.reqQty}<input  style="width: 100px;text-align:center;" class=" form-control" readonly name="totalStock" id="totalStock${list.sno}" type="hidden" value="${type.stockQty}"></td>
                                                                                        <td class="center" style="text-align: right;"><fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.qty}" /><input  style="width: 100px;text-align:center;" class=" form-control" readonly name="reqQty" id="reqQty${list.sno}"type="hidden" value="${list.qty}"></td>
                                                                                        <!--<td class="center"><input  style="width: 100px;text-align:center;background-color: rgb(246, 246, 229);" class=" form-control input-mini validate[custom[notzero]]" onpaste="return false" autocomplete="off" required="" name="issuingqty" id="issuingqty${list.sno}" onkeypress="return check_digit(event, this, 6, 0);" onkeypress="return isNumberKey(event)" onkeyup="calTotal(this,${list.sno});" type="text" value=""></td>-->
                                                                                        <td class="center" style="text-align: right;"><fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.totalPrice}" /><input  style="width: 100px;text-align:center;" class=" form-control" readonly name="totalPrice" id="totalPrice${list.sno}" type="hidden" value=""><input type="hidden" id="invent${list.sno}" name="invent" value=""/></td>
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
                                        </c:if>
                                    </table>
                                    <p>&nbsp;</p>
                                    <table id="other" class="table table-striped responsive-utilities jambo_table" style="">
                                        <thead >
                                            <tr class="headings">     
                                                <th >Role</th>
                                                <!--<th >Name</th>-->
                                                <th >Date</th>
                                                <th >Remarks</th>
                                            </tr>      
                                        </thead>        
                                        <tbody> 
                                            <c:forEach items="${materialIssue1}" var="list">
                                                <c:set var="remarks" value="${list.remarks}" /> 
                                                <c:set var="appremarks" value="${list.appremarks}" /> 
                                                <c:if test="${remarks ne null}">
                                                    <tr>
                                                        <!--<td class="center" ><b>GFC</b></td>-->
                                                        <td class="center" style="text-align: left;">AM/SM</td>
                                                        <td class="center" style="text-align: left;"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${list.lastmodifiedDate}" /></td>
                                                        <td class="center" style="text-align: left;">${remarks}</td>
                                                    </tr>
                                                </c:if>
                                                <c:if test="${appremarks ne null}">
                                                    <tr>
                                                        <!--<td class="center" ><b>GFC</b></td>-->
                                                        <td class="center" style="text-align: left;">GFC</td>
                                                        <td class="center" style="text-align: left;"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${list.lastmodifiedDate}" /></td>
                                                        <td class="center" style="text-align: left;">${appremarks}</td>
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
                                                <textarea  class="form-control" rows="1" type="text" id="appremarks" style="resize: none;" name="appremarks" maxlength="120" ></textarea> 
                                            </div>
                                    </c:if>--%>
                                    <p>&nbsp;</p>


                                    <!-- price element -->       


                                    <!--<div class="col-md-12 col-sm-12 col-xs-12">-->
                                    <br/>
                                    <br/>
                                    <c:if test="${action ne 'view'}">
                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                            <input id="saveInvoiceBtn" tabindex="6" class="btn btn-primary" name="saveInvoice" value="Approve" type="submit" onclick=" if (confirm('Do you really want to Save this record')) {
                                                        return true;
                                                    } else {
                                                        return false;
                                                    }">
                                            <a href="../serviceReq/materialIssueList1.htm" class="btn btn-danger">Cancel</a>
                                        </c:if>

                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>


                </div>

            </div>



            <!-- footer content
            -->

            <!-- /footer content -->

        </div>
        <!-- /page content -->
    </div>

</div>
</div>
<script>
    NProgress.done();
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

    $(document).ready(function () {

        jQuery("#imForm").validationEngine();
    });</script>
<script src="../inventory/general-inventory_script.js" type="text/javascript"></script>
<script src="../inventory/inventory_script.js" type="text/javascript"></script>
</body>
<script>
    NProgress.done();
</script>

</html>