<%-- 
    Document   : reqForm
    Created on : 27 Feb, 2018, 2:01:11 PM
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
            Date date1 = new Date();
        %>
        <script>

            function isNumberKey(evt)
            {

                var charCode = (evt.which) ? evt.which : event.keyCode
                if (charCode >= 31 && (charCode < 48 || charCode > 57))
                    return false;
                return true;


            }

            function openWindow() {

                myWindow = window.open("../purchReq/deliveryLocPopUp.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }


            function addCopy($this) {
                var $itemRow = $($this).closest('tr');
                var itemCode = $itemRow.find('#itemId').val();
                var itemName = $itemRow.find('#itemName').val();
                var itemDesc = $itemRow.find('#itemDesc').val();
                var itemCategory = $itemRow.find('#itemCategory').val();
                var unitPrice = $itemRow.find('#unitPrice').val();
                var itemSubCategory = $itemRow.find('#itemSubCategory').val();
                var supplierCode = $itemRow.find('#supplierCode').val();
                var requisitionQty = $itemRow.find('#requisitionQty').val();
                var requisitionUom = $itemRow.find('#requisitionUom').val();
                var reqBefore = $itemRow.find('#reqBefore').val();
                var priority = $itemRow.find('#priority').val();




                var $itemsTable4 = $('#itemsTable1');
                var $row4 = '<tr class="item-row">' +
                        '<td align="center" onclick="addCopy(this);"><i class="fa fa-plus-circle"></i></td>' +
                        '<td><input style="text-align:left;" name="itemSubCategory" value="' + itemSubCategory + '" class="form-control" tabindex="-1" id="itemSubCategory" type="text" readonly=""></td>' +
                        '<td style="text-align:left;">' + itemName + '<input name="itemId" value="' + itemCode + '" id="itemId" type="hidden">'
                        + '<input name="itemName" value="' + itemName + '" id="itemName" type="hidden">'
                        + '<input name="itemDesc" value="' + itemDesc + '" id="itemDesc" type="hidden">' +
                        '<input type="hidden" name="itemCategory" id="itemCategory" value="' + itemCategory + '">' +
                        '<td><input  name="requisitionQty" style="text-align:left;" class="form-control validate[required]" tabindex="-1" autocomplete="off" id="requisitionQty" onpaste="return false" type="text" value="" ></td>' +
                        '<td><input style="text-align:left;" name="requisitionUom" id="requisitionUom" value="' + requisitionUom + '" type="text"  readonly="" value="" class="form-control"></td>' +
                        '<td><input name="unitPrice" id="unitPrice" type="hidden" value="' + unitPrice + '"><input  placeholder="Select Date" style="text-align:left;" name="reqBefore" id="reqBefore" onclick="getDate(this);" readonly="" value="" class="form-control validate[required]"></td>' +
                        '<td align="center" onclick=""><button type="button" id="deleteRow"><i class="fa fa-trash-o"></i></button></td>' +
                        '</tr>';
                $($itemRow, $itemsTable4).after($row4);

            }

//            function selectdate($this) {
//                var $itemRow = $($this).closest('tr');
//                var date = $($itemRow).find('#reqBefore');
//                var rowCount = ($($this).closest("tr")[0].rowIndex);
//                date.attr('id', "row" + rowCount);
//                var rowid1 = "row" + rowCount;
//                NewCssCal(rowid1, 'ddMMMyyyy', '', '', '', '', 'future');
//
//            }

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
                                <jsp:include page="../login/headerlink.htm?submodule=Inventory List&tab=Re-Order Items&pagetype=form"/>

                                <div class="x_title">
                                    <h2>Receipt</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br/>


                                    <form method="post" action="../quality/ReqFormSubmit.htm" id="imForm">



                                        <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="x_content">
                                                    <div class="row">

                                                        <div class="col-md-12">
                                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                                <div class="x_content">


                                                                    <fieldset>
                                                                        <div style="float: left">
                                                                            <div class="form-inline" style="padding-left: 10px;"> 
                                                                                <strong style="padding-left: 1px;"><span style="color: red;">*</span> Requisition No:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
                                                                                <input name="reqNo" id="reqNo" readonly="" type="text" value="REQ-${requisitionNo}" class="form-control">
                                                                                <input class="form-control" readonly="" type="hidden" value="<%=session.getAttribute("orgCode").toString()%>" name="division">

                                                                            </div> 
                                                                            &nbsp; 

                                                                            <div class="form-inline" style="padding-left: 10px;"> 
                                                                                <strong style="width: 100px;"><span style="color: red">*</span> Requisition Date:&nbsp;&nbsp;</strong>
                                                                                <input type="text" readonly required="" class="form-control"name="reqDate" id="reqDate"  value="<fmt:formatDate pattern="dd-MMM-yyyy" value="<%=date1%>"/>">
                                                                            </div>
                                                                            &nbsp;
                                                                            <div class="form-inline" style="padding-left: 1px;"> 
                                                                                <c:forEach items="${store1}" var="type">
                                                                                    <c:if test="${type.storeName eq storeName}">
                                                                                        <c:set var="address" value="${type.address}"/>
                                                                                    </c:if>
                                                                                </c:forEach>

                                                                                <strong>Location/Store Name:</strong> 
                                                                                <input type="text" readonly value="${storeName}" class="form-control" name="requiredAtLoc" id="requiredAtLoc" >
                                                                                <%--<textarea name="reqLocation" id="requiredAtLoc"  type="text"  style="resize: none" class="form-control validate[required]" >${address}</textarea>--%>

                                                                            </div> 

                                                                        </div>
                                                                        <%-- <div class="form-inline" style="float: right"> 
                                                                    <strong>Store Name:</strong> ${storeName}


</div>--%>

                                                                    </fieldset>
                                                                    <p>&nbsp;</p>

                                                                    <table class="table table-striped responsive-utilities jambo_table bulk_action" id="itemsTable1">
                                                                        <thead>
                                                                            <tr>

                                                                                <th class="column-title" style="width:2%"></th>
                                                                                <th class="column-title"style="width:10%">Sub Category</th>
                                                                                <th  class="column-title"style="width:20%" >Item Name</th>
                                                                                <th  class="column-title" style="width:10%" >Quantity</th>
                                                                                <th  class="column-title" style="width:10%" >Unit</th>
                                                                                <th  class="column-title" style="width:10%">Required Date</th>
                                                                                <th class="column-title" style="width:2%"><i class="fa fa-trash"></i></th>


                                                                            </tr>
                                                                        </thead>

                                                                        <tbody>

                                                                            <c:forEach items="${reqlist}" var="type">
                                                                                <c:forEach items="${itemlist}" var="item">


                                                                                    <c:if test="${item.itemCode eq type}">
                                                                                        <c:forEach items="${ itemlist1}" var="list">
                                                                                            <c:if test="${list.status eq 'Active'}">
                                                                                                <c:set var="supplierCode" value="${list.supplierName}"/>

                                                                                                <c:set var="purchasePrice" value="${list.purchasePrice}"/>
                                                                                            </c:if>
                                                                                        </c:forEach>
                                                                                    </c:if>

                                                                                    <c:if test="${item.itemCode eq type}">

                                                                                        <tr class="item-row">
                                                                                            <td id="addItem" onclick="addCopy(this);"><i class="fa fa-plus-circle"></i></td>
                                                                                                <c:forEach items="${itemSubCategory}" var="item1">
                                                                                                    <c:if test="${item.itemCategory eq item1.itemCategory}">

                                                                                                    <td>${item1.itemCategory}
                                                                                                        <input type="hidden" name="itemId" id="itemId" value="${item.itemCode}"/>
                                                                                                        <input type="hidden" name="itemCategory" id="itemCategory" value="${item.itemCategory}"/>
                                                                                                        <input type="hidden" name="itemSubCategory" id="itemSubCategory" value="${item1.itemCategory}"/>

                                                                                                    </td>
                                                                                                </c:if>
                                                                                            </c:forEach>


                                                                                            <td class="center">
                                                                                                <input type="hidden" name="itemName" id="itemName" value="${item.itemName}"/>
                                                                                                <input type="hidden" name="itemDesc" id="itemDesc" value="${item.itemDesc}"/>

                                                                                                ${item.itemName}
                                                                                                <input type="hidden" name="supplierCode" id="supplierCode" value="${supplierCode}"/>
                                                                                            </td>
                                                                                            <%--<td>${supplierCode}</td> --%>

                                                                                            <td class="center">
                                                                                                <input class="form-control validate[required]" style="text-align:left" id="requisitionQty" autocomplete="off"   name="requisitionQty" onpaste="return false" maxlength="10"  type="text" value="" onkeypress=" return isNumberKey(event);">
                                                                                                <div id ="errors"></div>
                                                                                            </td>
                                                                                            <td class="center"><input type="hidden" name="requisitionUom"  id="requisitionUom" value="${item.itemUom}"/>${item.itemUom}
                                                                                                <input  type="hidden" name="unitPrice" id="unitPrice" value="${purchasePrice}"/>
                                                                                            </td>
                                                                                            <td class="center"><input class="form-control validate[required]" readonly name="reqBefore" style="text-align:left;" id="reqBefore" placeholder="Select Date" type="text" onclick="getDate(this);"></td>

                                                                                    <input class="priority" type="hidden" id="priority" value=""/> 

                                                                                    <input class="form-control" id="deptName" name="deptName" readonly="" type="hidden" value="<%=session.getAttribute("userDept").toString()%>" maxlength="80">
                                                                                    <%--<c:forEach items="${saftyList}" var="type1">
                                                                                       <c:if test="${type1[0] eq type}">
                                                                                           <c:set var="sqty1" value="${type1[2]}"/>
                                                                                           <input type="hidden" id="sqty" value="${sqty1}"/> 
                                                                                       </c:if>

</c:forEach>--%>

                                                                                    <%--<td class="center">
                                                                                    <select name="priority" id="priority"  class="form-control">
                                                                                        <option value="">Select</option>
                                                                                        <option>HIGH</option>
                                                                                        <option>MEDIUM</option>
                                                                                        <option>LOW</option>
                                                                                    </select>
        </td>--%>
                                                                                    <td align="center" onclick=""><button type="button" id="deleteRow"><i class="fa fa-trash-o"></i></button></td>


                                                                                    </tr>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                        </c:forEach>


                                                                        </tbody>

                                                                    </table>

                                                                </div>

                                                            </div>

                                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                                <br/>
                                                                <br/>
                                                                <input   type="text" name="remarks" id="remarks"  autocomplete="off" placeholder="Remarks" maxlength="100" style="width:450px;  height:50px"/>
                                                            </div>

                                                            <!-- price element -->       


                                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                                <hr/>

                                                                <input id="saveInvoiceBtn" tabindex="6" class="btn btn-primary" name="saveInvoice" value="Save" type="submit" onclick="if (confirm('Do you really want to Save this record')) {
                                                                            return true;
                                                                        } else {
                                                                            return false;
                                                                        }">
                                                                <a href="../inventory/reorderList.htm" class="btn btn-danger">Cancel</a> 


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

            function getDate($this) {
                var x = document.getElementById("itemsTable1").rows.length;
                var $itemRow = $($this).closest('tr');
                var rowCount = ($($this).closest("tr")[0].rowIndex);
                $itemRow.find('#reqBefore').attr('id', "reqBefore" + rowCount);
                NewCssCal('reqBefore' + rowCount, 'ddMMMyyyy', '', '', '', '', 'future');
            }

            NProgress.done();

            $(document).ready(function () {

                jQuery("#imForm").validationEngine();
            });
        </script>
        <script src="../assets/general-inventory_script.js" type="text/javascript"></script>
        <script src="../assets/inventory_script.js" type="text/javascript"></script>
    </body>


</html>
