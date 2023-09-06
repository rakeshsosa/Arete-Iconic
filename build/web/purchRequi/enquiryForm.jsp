<%-- 
    Document   : enquiryForm
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


        <script type="text/javascript" src="../common/datepicker/datetimereq_css.js"></script>

        <!--Mouse Over It will display last 3 po list--> 
        <script type="text/javascript" src="../purchOrder/mouseOverPrevPO.js"></script>
        <link href="../purchOrder/mouseOverPrevPo.css" rel="stylesheet">
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
                        <div class="clearfix"></div>
                        <form class="form-inline" id="reqQuotation" method="post" enctype="multipart/form-data" action="../purchase/sendQuotation.htm">
                            <div class="col-md-6 col-xs-12">
                                <div class="x_panel">                             
                                    <jsp:include page="../login/headerlink.htm?submodule=Purchase Requisition&tab=Approved Requisition&pagetype=form"/>
                                    <div class="x_title">
                                        <h2>
                                            Approved Requisition
                                        </h2>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <c:forEach items="${purchReqList}" var="type">
                                            <c:set var="division" value="${type.division}"/>
                                            <c:set var="potype" value="${type.purchaseType}"/>
                                            <c:set var="department" value="${type.department}"/>
                                            <c:set var="ReqNo" value="${type.prNo}"/>
                                            <c:set var="reqDate" value="${type.prDate}"/>
                                            <c:set var="prCode" value="${type.projectCode}"/>
                                            <c:set var="userId" value="${type.userId}"/>
                                            <c:set var="reviewerName" value="${type.reviewerName}"/>
                                            <c:set var="approverName" value="${type.approverName}"/>
                                            <c:set var="approverDate" value="${type.approverDate}"/>
                                            <c:set var="approverRemarks" value="${type.approverRemarks}"/>
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
                                        </c:forEach>

                                        <div class="x_content">
                                            <div class="col-md-4 col-sm-12 col-xs-12 ">
<!--                                                <div>
                                                    <strong style="padding-right: 8px;">Division:</strong> ${division}
                                                </div>-->
                                                <div>
                                                    <strong style="padding-right: 8px;">PO Type:</strong> ${potype}
                                                </div>
                                                <div>
                                                    <strong style="padding-right: 8px;">Department:</strong> ${department}
                                                </div>
                                                <div>
                                                    <strong style="padding-right: 8px;">Enquiry Date:</strong>
                                                    <fmt:formatDate pattern="dd-MMM-yyyy" value="<%=date%>" />
                                                    <input name="enqDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="<%=date%>" />" type="hidden">
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
<!--                                                <div>
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
                                            </div>
                                        </div>                                 

                                        <p>&nbsp;</p>
                                        <div class="col-md-4 col-sm-12 col-xs-12 ">
                                            <strong style="padding-right: 8px;">Attachment:</strong>
                                            <c:forEach items="${purchDocList}" var="doc">
                                                <c:if test="${not empty doc.fileName}">
                                                    <a style="color: black" href="../purchase/requiAttachDownload.htm?sno=${doc.SNo}" title="Click to download">
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
                                                <%--<c:forEach items="${purchReqList}" var="list">--%>
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
                                                <tr>
                                                    <td class="center" ><b>Store Reviewer</b></td>
                                                    <td class="center">${approverName}</td>
                                                    <td class="center"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${approverDate}" /></td>
                                                    <td class="center">${approverRemarks}</td>
                                                </tr>

                                                <%--</c:forEach>--%> 
                                            </tbody>
                                        </table>


                                        <p>&nbsp;</p> 
                                        <div style="overflow-x:scroll;">
                                        <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll">
                                            <thead>
                                                <tr class="headings"> 
                                                    <th style="width: 1%"><i class="fa fa-trash"></i></th>
                                                    <th>Requisition Line No</th>
                                                    <th>Item Sub Category</th>
                                                    <th>Item Code</th>
                                                    <th>Item Name</th>
                                                    <th>Item Desc</th>
                                                    <th>Quantity</th>
                                                    <th>Unit</th>                                                    
                                                    <!--<th style="width:50px;">Unit Price</th>-->
                                                    <!--<th>Total Price</th>-->
                                                    <th>Delivery Date</th>
                                                    <!--<th>To be Delivered At</th>-->                                                                                 

                                                    <th>Item Specification</th>
                                                    <th>Supplier E-mail</th>
                                                    <th>Select Supplier</th>
                                                </tr>
                                            </thead>

                                            <tbody>                                     
                                                <c:forEach items="${purchReqList}" var="list">
                                                    <tr>
                                                        <td><button type="button"  onclick="deleteRow(this);" ><i id="deleteRow" class="fa fa-trash-o"></i></button></td>
                                                        <td>${list.reqsno}</td>
                                                        <td>${list.itemSubCategory}</td>
                                                        <td>
                                                            <input type="hidden" name="pk" value="${list.SNo}"/> 
                                                            <input type="hidden" name="division" id="division" value="${list.division}">
                                                            <input type="hidden" name="projectCode" value="${list.projectCode}"/>
                                                            <input  name="prName" type="hidden" value="${list.projectName}"> 
                                                            <input type="hidden" name="itemCode" value="${list.itemCode}"/>
                                                            <input type="hidden" name="itemName" value="${fn:escapeXml(list.itemName)}"/>
                                                            <input type="hidden" name="itemDesc" value="${fn:escapeXml(list.description)}"/>
                                                            <input type="hidden" name="qty" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.purchaseQty}"/>"/>
                                                            <input type="hidden" name="unit" value="${list.unit}"/>                                                
                                                            <input name="itemCat"  type="hidden" value="${list.itemCategory}"> 
                                                            <input name="itemsubCat"   type="hidden" value="${list.itemSubCategory}">                                                
                                                            <input  type="hidden" name="purchaseType" id="purchaseType" value="${list.purchaseType}">
                                                            <input type="hidden"  name="dept" value="${list.department}">  
                                                            <input type="hidden" name="deliveryDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.requiredDate}" />"/>
                                                            <input type="hidden" name="loc" value="${list.deliveryLocation}"/>
                                                            ${list.itemCode}
                                                        </td>
                                                        <td> <a id="prevPO" onmouseover="checkPrevPO(this, '${list.itemCode}');" style="cursor: pointer;color: #0067f9" >${list.itemName} 
                                                                <table id="t01" border="1px" style="border-radius: 5px">
                                                                    <tr id="prevhead" style="color: #172D44"></tr>
                                                                    <tbody id="prevpolst" style="color: darkblue"></tbody>

                                                                </table></a></td>  
                                                        <td>${list.description}</td>  
                                                        <td class="right"><fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.purchaseQty}"/></td>                                                        
                                                        <td> ${list.unit}</td> 
                                                        <%--   <td>${list.unitPrice}</td> 
   <td><fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.totalPrice}"/></td> --%>
                                                        <td><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.requiredDate}"/></td> 
                                                        <!--<td>${list.deliveryLocation}</td>-->                                             

                                                        <td><input type="text" name="matSpec" class="form-control" style="text-align:left;width:100px;" maxlength="100"></td>
                                                        <td>
                                                            <input type="text" readonly="" style="text-align:left;" id="supplier${list.SNo}" name="supplier"  class="form-control validate[required]" />
                                                            <!--<input type="text" id="supplierCode${list.SNo}" name="supplierCode"  />-->
                                                            <!--<input type="text" id="supplierName${list.SNo}" name="supplierName"  />-->
                                                        </td>
                                                        <td><input type="button"  name="Material" value="Click To Select" onclick="openWindow('supplier${list.SNo}', 'supplierCode${list.SNo}', 'supplierName${list.SNo}');"></td>
                                                    </tr>

                                                </c:forEach> 


                                            </tbody>

                                        </table>
                                        </div>
                                    
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <div class="col-md-6 col-sm-9 col-xs-12">
                                                <p>&nbsp;</p>

                                                <!--<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">-->
                                                <!--
                                                                                        <button type="submit" class="btn btn-primary" style="" onclick="if (confirm('Do you really want to Save this record')) {
                                                                                                    return true;
                                                                                                } else {
                                                                                                    return false;
                                                                                                }"><i class="fa fa-floppy-o" style="font-size: 15px"></i> SAVE</button>-->

                                                <button class="btn btn-primary" type="submit" ><i class="fa fa-send-o"></i> Send Enquiry</button>
                                                <a href="../purchase/approvedRequiList.htm"><button type="button" class="btn btn-danger" style="" >Cancel</button></a> 
                                            </div>

                                            <!--</div>-->

                                        </div>


                                    </div>

                                </div>
                            </div>



                        </form>                                                                    

                    </div>

                </div>

            </div>
        </div>




        <!-- Datatables -->
        <script src="../common/theme/js/datatables/js/jquery.dataTables.js"></script>


        <script>
                                                            $(document).ready(function () {
                                                                //gridEditArrowKey();
                                                                $('#reqQuotation').validationEngine();
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
                                                            function openWindow(id, suppcode, suppname) {
                                                                //            alert("Item not Available..!!");
                                                                myWindow = window.open("../purchase/selectSuppPopup.htm?id=" + id + "&suppcode=" + suppcode + "&suppname=" + suppname + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                                                            }

                                                            function selectedvalue(val)
                                                            {
                                                                var x = $('#chk1:checked').length;

                                                                if (parseInt(x) != 0)
                                                                {
                                                                    $('#reqQuotation').attr('action', "../purchase/reqQuotApp.htm?status=" + val + "");
                                                                    $('#reqQuotation').submit();

                                                                } else {
                                                                    alert("Please Select item..!!");
                                                                }


                                                            }
                                                            function deleteRow($row) {

//                                                                var rowCount = $('#example tr').length;                                                               
                                                                var nex = $($row).closest('tr').next('tr').length;
                                                                var prev = $($row).closest('tr').prev('tr').length;
                                                                var i = $row.parentNode.parentNode.rowIndex;
                                                                if (nex != 0 || prev != 0) {
                                                                    document.getElementById("example").deleteRow(i);
                                                                    return;
                                                                } else {
                                                                    alert('You can not delete this row...!!!');
                                                                    return false;
                                                                }

                                                            }

        </script>

        <script>
            NProgress.done();
        </script>
    </body>

</html>
