<%-- 
    Document   : reviewInventory
    Created on : Feb 19, 2016, 5:44:26 PM
    Author     : Nataraj
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

        <title>arête Assets Management</title>
        <script src="../common/validate/Check_Digit.js" type="text/javascript"></script>


    </head>


    <body class="nav-sm" onload="stock();">

        <div class="container body">


            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <div class="clearfix"></div>
                        <form class="form-inline" id="reviwInventory" action="../purchase/storeApprovalSubmit.htm"  method="post" enctype="multipart/form-data">
                            <div class="col-md-6 col-xs-12">
                                <div class="x_panel">                             
                                    <jsp:include page="../login/headerlink.htm?submodule=Purchase Requisition&tab=Store Review&pagetype=list"/>
                                    <div class="x_title">
                                        <h2>Inventory</h2>
                                        <div class="clearfix"></div>
                                    </div>
                                    <!--<div class="x_content">-->
                                    <c:forEach items="${purchReqList}" var="type">
                                        <c:set var="division" value="${type.division}"/>
                                        <c:set var="potype" value="${type.purchaseType}"/>
                                        <c:set var="department" value="${type.department}"/>
                                        <c:set var="ReqNo" value="${type.prNo}"/>
                                        <c:set var="reqDate" value="${type.prDate}"/>
                                        <c:set var="prCode" value="${type.projectCode}"/>
                                        <c:set var="userId" value="${type.userId}"/>
                                        <c:set var="reviewerName" value="${type.reviewerName}"/>
                                        <c:set var="reviewerDate" value="${type.reviewerDate}"/>
                                        <c:set var="reviewerRemarks" value="${type.reviewerRemarks}"/>
                                        <c:set var="deliveryLocation" value="${type.deliveryLocation}"/>
                                        <c:set var="requiredDate" value="${type.requiredDate}"/>
                                        <c:set var="priority" value="${type.priority}"/>
                                        <c:set var="remarks" value="${type.remarks}"/>
                                        <c:set var="userId" value="${type.userId}"/>                                           
                                        <c:set var="lastmodifiedDate" value="${type.lastmodifiedDate}"/>
                                        <c:set var="fileName" value="${type.fileName}"/>
                                        <c:set var="SNo" value="${type.SNo}"/>
                                        <c:set var="orderType" value="${type.orderType}"/>
                                    </c:forEach>


                                    <div class="x_content">
                                        <div class="col-md-4 col-sm-12 col-xs-12 ">
<!--                                            <div>
                                                <strong style="padding-right: 8px;">Division:</strong> ${division}
                                            </div>-->
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
<!--                                            <div>
                                                <strong style="padding-right: 8px;">Project Code:</strong>${prCode}
                                            </div>-->
                                            <div > 
                                                <strong style="padding-right: 8px;">Required Date:</strong>
                                                <fmt:formatDate pattern="dd-MMM-yyyy" value="${requiredDate}"/>
                                                <input type="hidden" name="requiredByDate" class="form-control"  readonly   value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${requiredDate}"/>">

                                            </div>                                                           

                                            <div> 
                                                <strong style="padding-right: 8px;">Priority:</strong>${priority}

                                                <input type="hidden" class="form-control"  readonly   value="${priority}">

                                            </div>
                                            <div> 

                                                <strong style="padding-right: 8px;">Store Name:</strong><b style="width: 100px;font-weight: normal;">${deliveryLocation}</b>


                                            </div>
                                            <c:if test="${orderType eq 'Reorder'}">
                                                <div> 

                                                    <strong style="padding-right: 8px;">Order Type:</strong><b style="width: 100px;font-weight: normal;">${orderType}</b>


                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                    <p>&nbsp;</p>
                                    <div class="col-md-4 col-sm-12 col-xs-12 ">
                                        <strong style="padding-right: 8px;">Attachment:</strong>
                                        <c:forEach items="${purchDocList}" var="doc">
                                            <c:if test="${not empty doc.fileName}">
                                                <a style="color: black" href="../purchReq/docDownload.htm?sno=${doc.SNo}" title="Click to download">
                                                    <i class="fa fa-file-pdf-o" style="font-size: 15px" ></i>
                                                    ${doc.fileName}
                                                </a>
                                            </c:if> 
                                        </c:forEach>

                                    </div>
                                    <p>&nbsp;</p>
                                    <div class="x_title">                       
                                        <div  style="text-align: center;text-transform:uppercase;"><h3 style="font-size:21px;">Approver Details</h3></div>

                                        <div class="clearfix">

                                        </div>                       
                                    </div>
                                    <table id="" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                        <thead >
                                            <tr class="headings">     
                                                <th >Role</th>
                                                <th >Name</th>
                                                <th >Date</th>
                                                <th >Remarks</th>
                                            </tr>      
                                        </thead>        
                                        <tbody>                                          
                                            <tr>
                                                <td class="center" ><b>Requestor</b></td>
                                                <td class="center">${userId}</td>
                                                <td class="center"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${lastmodifiedDate}" /></td>
                                                <td class="center">${remarks}</td>
                                            </tr>
                                            <c:if test="${not empty reviewerName}">
                                                <tr>
                                                    <td class="center" ><b>Reviewer</b></td>
                                                    <td class="center">${reviewerName}</td>
                                                    <td class="center"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${reviewerDate}" /></td>
                                                    <td class="center">${reviewerRemarks}</td>
                                                </tr>
                                            </c:if>

                                        </tbody>
                                    </table>
                                            <div style="overflow-x:scroll;">
                                    <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                        <thead>
                                            <tr class="headings">                                                  
                                                <th style="width: 10%;">Requisition Line No</th>
                                                <th style="width: 10%;">Item Sub Category</th>
                                                <th style="width: 10%;">Item Code</th>                                                
                                                <th style="width: 30%;">Item Name</th>
                                                <th>Item Desc</th>
                                                <th style="width: 10%;">Required Qty</th>
                                                <th>MI Qty</th>
                                                <th>Purchase Qty</th>
                                                <th>Unit</th>
                                                <!--<th>Unit Price</th>-->
                                                <!--<th>Total Price</th>-->                                                
                                                <th style="width: 10%;">Available Stock</th>
                                                <th style="width: 10%;">Required Date</th>
                                                <th style="width: 10%;">Inventory</th>
                                                </th>
                                            </tr>
                                        </thead>

                                        <tbody>                                     
                                            <c:forEach items="${purchReqList}" var="list">
                                                <tr>                                                   
                                                    <td>${list.reqsno}</td>
                                                    <td>${list.itemSubCategory}</td>
                                                    <td>
                                                        <input name="pk" id="pk" value="${list.SNo}" type="hidden">
                                                        <input id="itemCode" value="${list.itemCode}" type="hidden">
                                                        ${list.itemCode}
                                                    </td>

                                                    <td> ${list.itemName}</td>    
                                                    <td style="width:10%;">${list.description}</td>
                                                    <td><input type="text" autocomplete="off" name="qty" id="qty" style="width: 100%;" class="right form-control validate[required,custom[notzero]] validate[custom[float5]]" onkeypress="return check_digit(event, this, 10, 3);" value="<fmt:formatNumber  type="number" groupingUsed="false"  maxFractionDigits="3" value="${list.quantity}"/>" onkeyup="changeQty(this);"></td>
                                                    <td><input class="right form-control validate[required] validate[custom[float5]]" readonly="" onkeypress="return check_digit(event, this, 10, 3);" onpaste="return false"  name="issueqty" id="issueqty" value="0" type="text" style="width: 50px;"></td>
                                                    <td><input class="right form-control" onkeypress="return check_digit(event, this, 10, 3);" onpaste="return false" readonly="" name="purchqty" id="purchqty" value="<fmt:formatNumber  type="number" groupingUsed="false"  maxFractionDigits="3" value="${list.quantity}"/>" type="text" style="width: 100px;"></td>
                                                    <td> ${list.unit}</td> 
                                                    <%--<td>${list.unitPrice}</td> 
<td><fmt:formatNumber  type="number" groupingUsed="false"  maxFractionDigits="3" value="${list.totalPrice}"/></td>  --%>                                                   
                                                    <td class="right" id="availStock"></td> 
                                                    <td><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.requiredDate}"/></td>
                                                    <td><i class="fa  fa-info-circle fa-lg" type="button" onclick="openWindow('${list.itemCode}')" title="Check"></i></td>

                                                </tr>

                                            </c:forEach> 


                                        </tbody>

                                    </table>
                                            </div>
                                    <p>&nbsp;</p>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                        <label class="control-label"><span style="color: red">*</span> Remarks</label>

                                        <textarea class="form-control validate[required]" rows="2" style="resize: none;" name="storeComment" id="storeComment" type="text" value="" maxlength="120"></textarea>


                                    </div>

                                    <p>&nbsp;</p> <p>&nbsp;</p> <p>&nbsp;</p>

                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                            <p>&nbsp;</p>
                                            <!--<input class="btn btn-primary" value="No Stock" onclick="selectedvalue('Store Reviewed');" type="button" >-->                                        
                                            <!--<input class="btn btn-dark" value="Add To Material Issues" onclick="selectedvalue('MI Requested');" type="button" >-->
                                            <button type="submit" class="btn btn-primary" style="" onclick="if (confirm('Do you really want to Save this record')) {
                                                        return true;
                                                    } else {

                                                        return false;

                                                    }">Save</button>
                                            <a href="../purchase/RequiApprove2List.htm"><button type="button" class="btn btn-danger" style="" >Cancel</button></a> 

                                        </div>

                                    </div>
                                    <!--</div>-->
                                </div>

                            </div>
                        </form>

                    </div>

                </div>
            </div>



            <!-- Datatables -->
            <script src="../common/theme/js/datatables/js/jquery.dataTables.js"></script>


            <script>
                                                var storeName = '${deliveryLocation}';
                                                $(window).load(function () {
                                                    $('#example > tbody  > tr').each(function () {
                                                        var $itemRow = $(this).closest('tr');
                                                        var itemCode = $itemRow.find('#itemCode').val();
                                                        $.ajax
                                                                ({
                                                                    type: "POST",
                                                                    url: '../purchase/chkInvenStock.htm',
                                                                    data: {
                                                                        itemCode: itemCode,
                                                                        storeName: storeName
                                                                    },
                                                                    success: function (data) {
                                                                        $itemRow.find('#availStock').html(data);
                                                                    }
                                                                });
                                                    });
                                                });
                                                function changeQty($this)
                                                {
                                                    var $itemRow = $($this).closest('tr');
                                                    var qty = $itemRow.find('#qty').val()
                                                    $itemRow.find('#purchqty').val(qty);
                                                }

                                                $(document).ready(function () {
                                                    //gridEditArrowKey();
                                                    $('#reviwInventory').validationEngine();

                                                    var chageQty = '#qty';
                                                    $(chageQty).on('keyup', function () {
                                                        var $itemRow = $(this).closest('tr');
                                                        var qty = $itemRow.find('#qty').val()
                                                        $itemRow.find('#purchqty').val(qty);
                                                    });


                                                    var inputval = '#issueqty, #purchqty';
                                                    $(inputval).on('keyup', function () {
                                                        var purchqty = 0;
                                                        var issueqty = 0;
                                                        var $itemRow = $(this).closest('tr');
                                                        var qty = $itemRow.find('#qty').val();
                                                        var itemCode = $itemRow.find('#itemCode').val();
                                                        issueqty = $itemRow.find('#issueqty').val();
                                                        if (issueqty !== '' && issueqty !== '0')
                                                        {

                                                            $.ajax
                                                                    ({
                                                                        type: "POST",
                                                                        url: '../purchase/chkInvenStock.htm',
                                                                        data: {
                                                                            itemCode: itemCode
                                                                        },
                                                                        success: function (data) {
                                                                            if (parseFloat(issueqty) > parseFloat(data)) {
                                                                                alert("Stock is not Available Please Check Inventory..!!");
                                                                                $itemRow.find('#issueqty').val('0');
                                                                                $itemRow.find('#purchqty').val(parseFloat(qty).toFixed(3));
                                                                                return false;
                                                                            }
                                                                        }
                                                                    });
                                                        }




                                                        if (parseFloat(qty).toFixed(3) < parseFloat(issueqty).toFixed(3))
                                                        {
                                                            alert("MI Quantity should be smaller than Required Quantity..!!");
                                                            $itemRow.find('#issueqty').val('0');
                                                            $itemRow.find('#purchqty').val(parseFloat(qty).toFixed(3));
                                                            return false;
                                                        }
                                                        else {
                                                            $itemRow.find('#purchqty').val(parseFloat(qty).toFixed(3));

                                                            purchqty = parseFloat(qty).toFixed(3) - parseFloat(issueqty).toFixed(3);

                                                        }
                                                        (isNaN(purchqty)) ? 0 : $itemRow.find('#purchqty').val(parseFloat(purchqty).toFixed(3));

                                                    });




                                                });
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


                                                function selectdate(val) {
                                                    NewCssCal(val, 'ddMMMyyyy', '', '', '', '', 'future');
                                                    //$('#test').attr();
                                                    //document.getElementById("hiddentr").value=$itemRow.index();

                                                }
                                                function openWindow(val) {
                                                    myWindow = window.open("../purchase/inventoryPopUp.htm?itemcode=" + encodeURIComponent(val) + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                                                }
                                                function selectedvalue(val)
                                                {
                                                    var x = $('#chk1:checked').length;
                                                    var storeComment = $('#storeComment').val();
                                                    if (parseInt(x) != 0)
                                                    {
                                                        if (storeComment == null || storeComment == '')
                                                        {
                                                            alert("Please Write Remarks..!!");
                                                            return false;
                                                        }
                                                        else {
                                                            $('#reviwInventory').attr('action', "../purchase/storeApprovalSubmit.htm?status=" + val + "");
                                                            $('#reviwInventory').submit();
                                                        }

                                                    } else {
                                                        alert("Please Select item..!!");
                                                    }


                                                }

//        function check_digit(e, obj, intsize, deczize) {
//            var keycode;
//            if (window.event)
//                keycode = window.event.keyCode;
//            else if (e) {
//                keycode = e.which;
//            }
//            else {
//                return true;
//            }
//
//            var fieldval = (obj.value),
//                    dots = fieldval.split(".").length;
//            if (keycode == 46) {
//                return dots <= 1;
//            }
//            if (keycode == 8 || keycode == 9 || keycode == 46 || keycode == 13) {
//                // back space, tab, delete, enter 
//                return true;
//            }
//            if ((keycode >= 32 && keycode <= 45) || keycode == 47 || (keycode >= 58 && keycode <= 127)) {
//                return false;
//            }
//            if (fieldval == "0" && keycode == 48) {
//                return false;
//            }
//            if (fieldval.indexOf(".") != -1) {
//                if (keycode == 46) {
//                    return false;
//                }
//                var splitfield = fieldval.split(".");
//                if (splitfield[1].length >= deczize && keycode != 8 && keycode != 0)
//                    return false;
//            } else if (fieldval.length >= intsize && keycode != 46) {
//                return false;
//            } else {
//                return true;
//            }
//        }

            </script>

            <script>
                NProgress.done();
            </script>
    </body>

</html>
