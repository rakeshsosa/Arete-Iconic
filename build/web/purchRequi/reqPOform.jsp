<%-- 
    Document   : reqPOform
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



        <link href="../common/theme/css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">

        <!--<script type="text/javascript" src="../common/datepicker/datetimereq_css.js"></script>-->
        <script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>
        <!--Mouse Over It will display last 3 po list--> 
        <script type="text/javascript" src="../purchOrder/mouseOverPrevPO.js"></script>
        <link href="../purchOrder/mouseOverPrevPo.css" rel="stylesheet">
        <script src="../common/validate/Check_Digit.js" type="text/javascript"></script>
        <link rel="stylesheet" href="../common/validate/validationEngine.jquery.css" type="text/css"/>	
        <script src="../common/validate/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8">
        </script>
        <script src="../common/validate/jquery.validationEngine.js" type="text/javascript" charset="utf-8">
        </script>


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
                    <br />
                    <div class="">
                        <div class="row top_tiles">
                            <div class="">

                                <div class="col-md-6 col-sm-6 col-xs-12">

                                    <div class="x_panel">                             
                                        <jsp:include page="../login/headerlink.htm?submodule=Purchase Requisition&tab=Approved Requisition&pagetype=form"/>
                                        <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="x_title">                     
                                                    <div  style="text-align: center;text-transform:uppercase;"><h3 style="font-size:21px;">PURCHASE ORDER</h3></div>
                                                    <!--<h2>Item List</h2>-->

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
                                                    <c:forEach items="${billloclist}" var="list">
                                                        <c:set var="billtolocaddress" value="${list.address}"/>
                                                        <c:set var="divisionName" value="${list.divisionName}"/>
                                                    </c:forEach>


                                                    <form class="form-inline" id="reqQuotation" method="post" enctype="multipart/form-data" action="../purchase/reqPOformSubmit.htm"> 
                                                        <div class="x_content">
                                                            <div class="col-md-4 col-sm-12 col-xs-12 ">
<!--                                                                <div>
                                                                    <strong style="padding-right: 8px;">Division:</strong> ${division}
                                                                </div>-->
                                                                <div>
                                                                    <strong style="padding-right: 8px;">PO Type:</strong> ${potype}
                                                                </div>
                                                                <div>
                                                                    <strong style="padding-right: 8px;">Department:</strong> ${department}
                                                                </div>                                                
                                                                <div><strong style="padding-right: 8px;">Requisition No:</strong>
                                                                    <c:forEach items="${reqNoList}" var="type"> 
                                                                        ${type[0]},
                                                                    </c:forEach>                                         


                                                                    <textarea style="display: none" name="billToAddress" id="billToAddress" value="" type="text">${divisionName}&#10;${billtolocaddress}</textarea>                                                                

                                                                </div>


                                                                <div><strong style="padding-right: 8px;width: 50px">Requisition Date:</strong> 
                                                                    <c:forEach items="${reqNoList}" var="type"> 
                                                                        <fmt:formatDate pattern="dd-MMM-yyyy" value="${type[1]}"/>,
                                                                    </c:forEach> 
                                                                    <%--<fmt:formatDate pattern="dd-MMM-yyyy" value="${reqDate}" />--%>
                                                                    <input name="reqDate" type="hidden" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${reqDate}"/>" tabindex="-1"/>
                                                                    <input class="input-xlarge"id="" name="ReqDateNo" readonly="" type="hidden" value="<%= (new SimpleDateFormat("dd-MMM-yyyy")).format(new java.util.Date())%>">
                                                                </div>

                                                            </div>
                                                            <div class="col-md-offset-6">
<!--                                                                <div>
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

                                                                    <input type="hidden" name="deliveryLoc" class="form-control"  readonly   value="${deliveryLocation}">
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
                                                        <!--                                                        <input name="potype" id="potype" value="Local" type="hidden">
                                                                                                                <input name="currency" id="currency" value="OMR" type="hidden">-->
                                                        <div  class="col-md-5 col-sm-12 col-xs-12 "> 
                                                            <label class="control-label"><span style="color: red">*</span> PO Type:</label>
                                                            <select  id="potype" name="potype" data-rel="chosen"   class="form-control validate[required]" onchange="changeCurrency();">
                                                                <option value="">Select PO Type</option>  
                                                                <option value="Local">Local</option> 
                                                                <option value="Import">Import</option> 
                                                            </select> 
                                                        </div> 
                                                  
                                                        <div   class="col-md-5 col-sm-12 col-xs-12 "> 
                                                            <label class="control-label"><span style="color: red">*</span> Currency:</label>
                                                            <select  id="currency" name="currency" data-rel="chosen"  class="form-control  validate[required]" onchange="selectCurrency();" >
                                                                <option value="">Select Currency</option>                                               
                                                            </select>  
                                                        </div>                                                    
                                                        <p>&nbsp;</p>
                                                        <%--<div>
                                                            <label class="control-label"><span style="color: red">*</span> Cost Center</label>
                                                            <select  id="costCenter" name="costCenter" data-rel="chosen"   class="form-control validate[required]">
                                                                <option value="">Select Cost Center</option>  
                                                                <c:forEach items="${costCenterList}" var="type">
                                                                    <option value="${type.costcenterDesc}/${type.costcenterCode}">${type.costcenterDesc}/${type.costcenterCode}</option>  
                                                                </c:forEach>
                                                            </select>   
                                                        </div>--%>
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
                                                        <c:forEach items="${supplierList}" var="suplist">

                                                            <c:if test="${suplist.itemCode eq list.itemCode}">

                                                            </c:if>
                                                        </c:forEach>
                                                        <p>&nbsp;</p>
                                                        <div style="overflow-x:scroll;">
                                                            <table id="example" class="table table-striped responsive-utilities jambo_table">
                                                                <thead>
                                                                    <tr class="headings"> 
                                                                        <th ><i class="fa fa-trash"></i></th> 
                                                                        <th style="width:5%;">Requisition Line No</th>
                                                                        <!--<th style="width:20%;">Item Sub Category</th>-->
                                                                        <th style="width:5%;">Item Code</th>
                                                                        <th style="width:5%;">Item Name</th>
                                                                        <th style="width:5%;">Item Desc</th>
                                                                        <th style="width:5%;"><span style="color: red">*</span> Quantity</th>
                                                                        <th style="width:5%;">Unit</th>
                                                                        <th ><span style="color: red">*</span> Unit Price</th>
                                                                        <th style="width:5%;">Total Amount</th>
                                                                        <th style="width:5%;"><span style="color: red">*</span> Discount(%)</th>
                                                                        <th style="width:5%;"><span style="color: red">*</span> Discount Amount</th> 
                                                                        <th style="width:10%;">Total Amount After Discount</th>   
                                                                        <th  style="">Delivery Date</th>
                                                                        <th><span style="color: red">*</span> Supplier Name</th>
                                                                        <!--<th  style="">Select Supplier</th>-->                                                                        
                                                                    </tr>
                                                                </thead>

                                                                <tbody>                                     
                                                                    <c:forEach items="${purchReqList}" var="list">

                                                                        <tr id="reqPoForm" class="poadditem">
                                                                            <td><button type="button" id="ondel" onclick="deleteRow(this);" ><i id="deleteRow" class="fa fa-trash-o"></i></button></td>
                                                                            <td>${list.reqsno}</td>
                                                                            <!--<td  style="width:20%;">${list.itemSubCategory}</td>-->
                                                                            <td>
                                                                                <input name="reqNo" id="ReqNo" value="${list.prNo}" type="hidden">
                                                                                <input type="hidden" id="SNo" name="prSno" value="${list.SNo}"/> 
                                                                                <input type="hidden" name="division" id="division" value="${list.division}">
                                                                                <input type="hidden" name="prCode" value="${list.projectCode}"/>
                                                                                <input  name="prName" type="hidden" value="${list.projectName}"> 
                                                                                <input type="hidden" id="itemCode" name="itemCode" value="${list.itemCode}"/>
                                                                                <input type="hidden" name="itemName" value="${fn:escapeXml(list.itemName)}"/>
                                                                                <input type="hidden" name="itemDesc" value="${fn:escapeXml(list.description)}"/>  
                                                                                <input name="itemCat"  type="hidden" value="${list.itemCategory}"> 
                                                                                <input name="itemsubCat"   type="hidden" value="${list.itemSubCategory}">                                                
                                                                                <input  type="hidden" name="purchaseType" id="purchaseType" value="${list.purchaseType}">
                                                                                <input type="hidden"  name="dept" value="${list.department}">   
                                                                                <input type="hidden"  name="grandTotal" value="0">  

                                                                                ${list.itemCode}
                                                                            </td>
                                                                            <td><div style="width:200px;text-align: left"><a id="prevPO" onmouseover="checkPrevPO(this, '${list.itemCode}');" style="cursor: pointer;color: #0067f9;" >${list.itemName} 
                                                                                        <table id="t01" border="1px" style="border-radius: 5px">
                                                                                            <tr id="prevhead" style="color: #172D44"></tr>
                                                                                            <tbody id="prevpolst" style="color: darkblue;"></tbody>

                                                                                        </table></a></div>

                                                                            </td>  
                                                                            <td>${list.description}</td>  
                                                                            <td ><input type="text" style="width: 90px" onpaste="return false" class=" right form-control input-mini validate[required] validate[custom[notzero],custom[float5]]" id="qty" name="qty" autocomplete="off" onkeypress="return check_digit(event, this, 10, 3);" onkeyup="updateGrandTotal();" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.purchaseQty}"/>"/>
                                                                                <%--<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.purchaseQty}"/>--%>
                                                                            </td>  

                                                                            <td><select style="text-align:left;width: 90px" name="unit" id="requisitionUom" class="form-control input-sm validate[required]" onpaste="return false" onchange="unitPrice(this, '${list.itemCode}', 'supplierCode${list.SNo}');"  tabindex="7">
                                                                                    <option value="${list.unit}">${list.unit}</option>
                                                                                </select></td>

                                                                            <td  style="">
                                                                                <%--<c:forEach items="${supplierList}" var="suplist">

                                                                                <c:if test="${suplist.itemCode eq list.itemCode}">
                                                                                    <c:set var="unitPrice" value="${suplist.purchasePrice}"/>
                                                                                    <c:set var="qty" value="${list.purchaseQty}"/>
                                                                                    <c:set var="totalPrice" value="${list.purchaseQty * unitPrice}"/>
                                                                                </c:if>
</c:forEach> --%>
                                                                            <!--<input style="width: 100px;text-align:left;"  type="text" onpaste="return false" autocomplete="off" required="" class="form-control validate[custom[notzero]] validate[required]" onkeypress="return check_digit(event, this, 6, 3);" id="price" name="price" value="${unitPrice}">-->  
                                                                                <input style="width: 90px"  type="text" onpaste="return false" autocomplete="off" class="right form-control validate[custom[notzero]] validate[required,custom[float5]]" onkeypress="return check_digit(event, this, 6, 3);" onkeyup="updateGrandTotal();"  id="price" name="price" value=""> 
                                                                            </td> 
                                                                            <td><input style="text-align:right;width:100px;" class="form-control  input-mini  validate[required]" type="text" readonly onpaste="return false" name="befdisc"  id="befdisc"  value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000"  value="${type.qty*type.unitPrice}"/>" ></td>
                                                                            <!--                                                                            <td>
                                                                                                                                                            <input style="text-align:right;width:50px;" autocomplete="off" class="form-control  input-mini  validate[required,custom[float7]]" type="text" onpaste="return false"  id="discount"  name="discount" onkeypress="return check_digit(event, this, 2, 2);"   value="0.0" >
                                                                                                                                                        </td>-->
                                                                            <td style="width: 10%;"><input style="width: 100px;text-align:right;" class="form-control  input-mini  validate[required,custom[float5]]"  onpaste="return false" autocomplete="off" id="discount1" onkeypress="return check_digit(event, this, 2, 3);" type="text"  value="0.0" maxlength="6">
                                                                                <input style="width: 70px;text-align:right;"  onpaste="return false" autocomplete="off" name="discount" id="discount" type="hidden" value="">
                                                                            </td>
                                                                            <td><input style="text-align:right;width:100px;" class="form-control  input-mini  validate[required,custom[float5]]" type="text" onpaste="return false" autocomplete="off" name="discountPrice"  id="discountPrice" onkeypress="return check_digit(event, this, 10, 3);"  value="<fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${(type.qty*type.unitPrice)*(type.discount/100)}"/>" ></td>
                                                                            <td><input style="width: 90px"  type="text" class="form-control right validate[required]" readonly="" id="total"  name="total" value="">  
                                                                            </td> 
                                                                            <td  style=""><input type="text" style="width: 90px" class="form-control validate[required]"  readonly="" name="delDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.requiredDate}"/>" id="${list.SNo}" onclick="selectdate('${list.SNo}')" onchange="validateDate(this.value, '${list.itemCode}', '${list.SNo}')"/>
                                                                                <input style="text-align:center;" type="hidden" name="reqDateSno" id="reqDateSno" value="${list.SNo}"/></td> 
            <!--                                                                    <td>${list.deliveryLocation}</td>                                             -->

                                                                            <td style="text-align:left;">
                                                                                <div style="width:200px">
                                                                                    <input type="hidden" id="supplier${list.SNo}" name="supEmail" required="" value="" class="form-control" />
                                                                                    <input type="hidden" id="supplierCode${list.SNo}" name="supplierCode" value="" />
                                                                                    <input type="text" readonly="" class="form-control validate[required]" id="supplierName${list.SNo}" name="supName" value="" >
                                                                                    <input type="hidden" id="supaddress" name="supaddress"  />
                                                                                    <input type="hidden" id="payTerms" name="payTerms"  />
                                                                                    <input type="hidden" id="delTerms" name="delTerms"  />
                                                                                    <%--<c:forEach items="${supplierList}" var="suplist">

                                                                                <c:if test="${suplist.itemCode eq list.itemCode}">
                                                                                    <input type="hidden" id="supplier${list.SNo}" name="supEmail" required="" value="" class="form-control" />
                                                                                    <input type="hidden" id="supplierCode${list.SNo}" name="supplierCode" value="${suplist.supplierCode}" />
                                                                                    <input type="text" readonly="" class="form-control" id="supplierName${list.SNo}" name="supName" value="${suplist.supplierName}" />
                                                                                    <input type="hidden" id="supaddress" name="supaddress"  />
                                                                                    <input type="hidden" id="payTerms" name="payTerms"  />
                                                                                    <input type="hidden" id="delTerms" name="delTerms"  />
                                                                                </c:if>
</c:forEach> --%>
                                                                                    <i title="Select Supplier" style="cursor: pointer;color: darkblue;" class="fa fa-pencil-square-o fa-lg" aria-hidden="true" onclick="openWindow(this, '${list.itemCode}', 'supplier${list.SNo}', 'supplierCode${list.SNo}', 'supplierName${list.SNo}');"></i>
                                                                                </div>
                                                                            </td>
                                                                        <!--<td  style=""><input style="" type="button"  value="Click To Select" onclick="openWindow(this, '${list.itemCode}', 'supplier${list.SNo}', 'supplierCode${list.SNo}', 'supplierName${list.SNo}');" ></td>-->
                                                                        </tr>

                                                                    </c:forEach> 


                                                                </tbody>

                                                            </table>
                                                        </div>
                                                        <br/>
                                                        <div class="col-md-offset-7 " > 
                                                            <label class="control-label" style="font-size:  20px">Grand Total:</label>
                                                            <!--<span class="btn btn-sm">INR</span>-->                                                            
                                                            <input class="right form-control input-mini validate[required]" style="font-weight: bold" readonly="" id="grandTotal"  type="text" value="">
                                                            <!--<input type="text" id="currCode" class="form-control input-mini" style="width: 50px" readonly="" value="OMR">-->
                                                            <input type="text" id="currCode" class="form-control input-mini" style="width: 50px" readonly="" value="${currency}">
                                                        </div> 
                                                        <p>&nbsp;</p>  

                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                <p>&nbsp;</p>


                                                                <!--<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">-->
                                                                <!--
                                                                                                        <button type="submit" class="btn btn-primary" style="" onclick="if (confirm('Do you really want to Save this record')) {
                                                                                                                    return true;
                                                                                                                } else {
                                                                                                                    return false;
                                                                                                                }"><i class="fa fa-floppy-o" style="font-size: 15px"></i> SAVE</button>-->

                                                                <button class="btn btn-primary" type="submit" name="commit">Save</button>
                                                                <a href="../purchase/approvedRequiList.htm"><button type="button" class="btn btn-danger" style="" >Cancel</button></a> 
                                                            </div>

                                                            <!--</div>-->
                                                        </div>
                                                    </form>
                                                </div>

                                            </div>

                                        </div>


                                    </div>

                                </div>


                            </div>

                        </div>




                        <!-- Datatables -->
                        <script src="../common/theme/js/datatables/js/jquery.dataTables.js"></script>


                        <script>
                                                                                        $(window).load(function () {
                                                                                            calconv();
                                                                                            $('#example > tbody  > tr').each(function () {
                                                                                                var $itemRow = $(this).closest('tr');
                                                                                                var itemCode = $itemRow.find('#itemCode').val();
                                                                                                var SNo = $itemRow.find('#SNo').val();
                                                                                                var qty = $itemRow.find('#qty').val();
                                                                                                $.ajax
                                                                                                        ({
                                                                                                            type: "POST",
                                                                                                            url: '../purchase/itemWiseSup.htm',
//                                                                                                            async: false,
                                                                                                            data: {
                                                                                                                itemCode: itemCode
                                                                                                            },
                                                                                                            success: function (data) {
                                                                                                                var list = data.split("$");
                                                                                                                $itemRow.find('#supplierCode' + SNo).val(list[0]);
                                                                                                                $itemRow.find('#supplierName' + SNo).val(list[1]);
                                                                                                                var baseuom = list[2];
                                                                                                                var purcPrice = list[3];
                                                                                                                var uom1 = list[4];
                                                                                                                var uom1Price = list[5];
                                                                                                                var uom2 = list[6];
                                                                                                                var uom2Price = list[7];
                                                                                                                var uom3 = list[8];
                                                                                                                var uom3Price = list[9];

                                                                                                                var unitPrice = 0.0;
//                                                                                                                var purchasePrice = parseFloat(list[2]).toFixed(3);
//                                                                                                                if (isNaN(purchasePrice)) {
//                                                                                                                    purchasePrice = 0.0;
//
//                                                                                                                }
//                                                                                                                $itemRow.find('#price').val(purchasePrice);
                                                                                                                var convFact = $itemRow.find('#requisitionUom').val();
                                                                                                                var conVal = convFact.split("-");

                                                                                                                var uom = conVal[1];
                                                                                                                if (uom == baseuom) {
                                                                                                                    unitPrice = purcPrice;
                                                                                                                }
                                                                                                                if (uom == uom1) {
                                                                                                                    unitPrice = uom1Price;
                                                                                                                }
                                                                                                                if (uom == uom2) {
                                                                                                                    unitPrice = uom2Price;
                                                                                                                }
                                                                                                                if (uom == uom3) {
                                                                                                                    unitPrice = uom3Price;
                                                                                                                }
                                                                                                                $itemRow.find('#price').val(unitPrice);


                                                                                                                var discount = $itemRow.find('#qty').val() * $itemRow.find('#price').val() * (1 - $itemRow.find('#discount').val() / 100);
                                                                                                                var discountfinal = roundNumber(discount, 2);
                                                                                                                if (isNaN(discountfinal)) {
                                                                                                                    discountfinal = 0.0;

                                                                                                                }
                                                                                                                $itemRow.find('#total').val(parseFloat(discountfinal).toFixed(3));
                                                                                                                $itemRow.find('#befdisc').val(parseFloat(discountfinal).toFixed(3));


                                                                                                                //                                                                                                                var totalPrice = parseFloat(qty).toFixed(3) * purchasePrice;
                                                                                                                //                                                                                                                isNaN(qty) ? $itemRow.find('#total').val("N/A") : $itemRow.find('#total').val(parseFloat(totalPrice).toFixed(3));


//                                                                                                                calGrandTotal();
                                                                                                                var gt = 0;
                                                                                                                $('#example > tbody  > tr').each(function () {
                                                                                                                    var $itemRow = $(this).closest('tr');
                                                                                                                    var total = $itemRow.find("#total").val();
                                                                                                                    if (total != '') {
                                                                                                                        gt = parseFloat(total) + parseFloat(gt);
                                                                                                                    }

                                                                                                                });
                                                                                                                $('#grandTotal').val(parseFloat(gt).toFixed(3));
                                                                                                            }
                                                                                                        });

                                                                                            });
//                                                                                            calGrandTotal();
                                                                                        });
//                                                                                        jQuery(document).ready(function () {
//
//                                                                                            $(document).on('keyup change', "#requisitionUom", function () {
//                                                                                                var $itemRow = $(this).closest('tr');
//                                                                                                var z = $itemRow.find('#qty').val();
//                                                                                                var zz = $itemRow.find('#price').val();
//                                                                                                var ccc = $itemRow.find('#discount').val();
//                                                                                                var convFact = $itemRow.find('#requisitionUom').val();
//                                                                                                var conVal = convFact.split("-");
//                                                                                                var discount = $itemRow.find('#qty').val() * $itemRow.find('#price').val() * (1 - $itemRow.find('#discount').val() / 100);
//                                                                                                var discountfinal = roundNumber(discount, 2);
//                                                                                                var uprice = $itemRow.find('#price').val();
//
//                                                                                                $itemRow.find('#price').val("");
//
//                                                                                                isNaN(discount) ? $itemRow.find('#total').val("N/A") : $itemRow.find('#total').val(parseFloat(discountfinal).toFixed(3));
//                                                                                                calGrandTotal();
//                                                                                            });
//                                                                                            var inputval = '#qty, #discount,#price, #ondel';
//                                                                                            $(inputval).on('keyup change click', function () {
//                                                                                                var $itemRow = $(this).closest('tr');
//                                                                                                var z = $itemRow.find('#qty').val();
//                                                                                                var zz = $itemRow.find('#price').val();
//                                                                                                var ccc = $itemRow.find('#discount').val();
//                                                                                                var convFact = $itemRow.find('#requisitionUom').val();
//                                                                                                var conVal = convFact.split("-");
//                                                                                                var discount = $itemRow.find('#qty').val() * $itemRow.find('#price').val() * (1 - $itemRow.find('#discount').val() / 100);
//                                                                                                var discountfinal = roundNumber(discount, 2);
//                                                                                                isNaN(discount) ? $itemRow.find('#total').val("N/A") : $itemRow.find('#total').val(parseFloat(discountfinal).toFixed(3));
//                                                                                                calGrandTotal();
//                                                                                            });
//                                                                                        });
                                                                                        function calGrandTotal() {
                                                                                            var gt = 0;
                                                                                            $('#example > tbody  > tr').each(function () {
                                                                                                var $itemRow = $(this).closest('tr');
                                                                                                var total = $itemRow.find("#total").val();
                                                                                                if (total != '') {
                                                                                                    gt = parseFloat(total) + parseFloat(gt);
                                                                                                }

                                                                                            });
                                                                                            $('#grandTotal').val(parseFloat(gt).toFixed(3));
                                                                                        }

                                                                                        function calconv() {

                                                                                            $('#example > tbody  > tr').each(function () {

                                                                                                var $itemRow1UF = $(this).closest('tr');

                                                                                                var itemcode = $itemRow1UF.find('#itemCode').val();
                                                                                                var requisitionUom = $itemRow1UF.find('#requisitionUom').val();
                                                                                                uomdisplay($itemRow1UF, itemcode, requisitionUom);


                                                                                            });

                                                                                        }
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

                                                                                                    for (var i = 0; i < nameArray.length - 1; i++) {
                                                                                                        toAppend += '<option value=' + '1' + '-' + nameArray[i] + '>' + nameArray[i] + '</option>';
                                                                                                    }

                                                                                                    // toAppend += '<option value="">Select an Option</option>';                                                                   
                                                                                                    //                                                                    for (var i = 0; i < nameArray.length; i++) {

//                                                                                                    if (nameArray[0] == nameArray[1]) {
//                                                                                                        if (nameArray[0] != "") {
//                                                                                                            toAppend += '<option value=' + '1' + '-' + nameArray[0] + '>' + nameArray[0] + '</option>';
//                                                                                                        }
//                                                                                                        if (nameArray[2] != "" && nameArray[2] !== 'null' && nameArray[5] !== 'null' && parseFloat(nameArray[5]) !== 0) {
//                                                                                                            toAppend += '<option value=' + '1' + '-' + nameArray[2] + '>' + nameArray[2] + '</option>';
//                                                                                                        }
//                                                                                                        if (nameArray[3] != "" && nameArray[3] !== 'null' && nameArray[6] !== 'null' && parseFloat(nameArray[6]) !== 0) {
//                                                                                                            toAppend += '<option value=' + '1' + '-' + nameArray[3] + '>' + nameArray[3] + '</option>';
//                                                                                                        }
//                                                                                                    } else {
//                                                                                                        if (nameArray[0] != "") {
//                                                                                                            toAppend += '<option value=' + '1' + '-' + nameArray[0] + '>' + nameArray[0] + '</option>';
//                                                                                                        }
//
//                                                                                                        if (nameArray[1] != "" && nameArray[1] !== 'null' && nameArray[4] !== 'null' && parseFloat(nameArray[4]) !== 0) {
//                                                                                                            toAppend += '<option value=' + '1' + '-' + nameArray[1] + '>' + nameArray[1] + '</option>';
//
//                                                                                                        }
//                                                                                                        if (nameArray[2] != "" && nameArray[2] !== 'null' && nameArray[5] !== 'null' && parseFloat(nameArray[5]) !== 0) {
//                                                                                                            toAppend += '<option value=' + '1' + '-' + nameArray[2] + '>' + nameArray[2] + '</option>';
//                                                                                                        }
//                                                                                                        if (nameArray[3] != "" && nameArray[3] !== 'null' && nameArray[6] !== 'null' && parseFloat(nameArray[6]) !== 0) {
//                                                                                                            toAppend += '<option value=' + '1' + '-' + nameArray[3] + '>' + nameArray[3] + '</option>';
//                                                                                                        }
//                                                                                                    }
////        if (nameArray[0] != "") {
//                                                                                                        toAppend += '<option value=' + '1' + '-' + nameArray[0] + '>' + nameArray[0] + '</option>';
//                                                                                                    }
//                                                                                                    if (nameArray[1] != "" && nameArray[1] !== 'null' && nameArray[4] !== 'null' && parseFloat(nameArray[4]) !== 0) {
//                                                                                                        toAppend += '<option value=' + nameArray[4] + '-' + nameArray[1] + '>' + nameArray[1] + '</option>';
//
//                                                                                                    }
//                                                                                                    if (nameArray[2] != "" && nameArray[2] !== 'null' && nameArray[5] !== 'null' && parseFloat(nameArray[5]) !== 0) {
//                                                                                                        toAppend += '<option value=' + nameArray[5] + '-' + nameArray[2] + '>' + nameArray[2] + '</option>';
//                                                                                                    }
//                                                                                                    if (nameArray[3] != "" && nameArray[3] !== 'null' && nameArray[6] !== 'null' && parseFloat(nameArray[6]) !== 0) {
//                                                                                                        toAppend += '<option value=' + nameArray[6] + '-' + nameArray[3] + '>' + nameArray[3] + '</option>';
//                                                                                                    }

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
                                                                                                    //                                                                                            alert(error);
                                                                                                }

                                                                                            });



                                                                                        }


                                                                                        function unitPrice($this, c, suppCd)
                                                                                        {
                                                                                            var $itemRow = $($this).closest('tr');
                                                                                            var requisitionUom = $itemRow.find('#requisitionUom').val();
                                                                                            var suppCode = $itemRow.find('#' + suppCd).val();
                                                                                            var unit = requisitionUom.split("-");
                                                                                            var uom = unit[1];
                                                                                            $.ajax({
                                                                                                type: "POST",
                                                                                                url: "../purchase/uomWiseUnitPrice.htm",
                                                                                                data: {
                                                                                                    code: c,
                                                                                                    suppCode: suppCode,
                                                                                                    uom: uom
                                                                                                },
                                                                                                success: function (data) {

                                                                                                    //                                                                    alert(data);   
                                                                                                    $itemRow.find('#price').val(data);
                                                                                                    updateGrandTotal();

                                                                                                }

                                                                                            });
                                                                                        }

                                                                                        function roundNumber(number, decimals) {
                                                                                            //If it's not already a String
                                                                                            var num2 = Math.floor(number * 1000) / 1000;
                                                                                            return num2;
                                                                                        }
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
                                                                                        function openWindow($this, itemCode, id, suppcode, suppname) {
                                                                                            var $itemRow = $($this).closest('tr');
                                                                                            var rowCount = ($($this).closest("tr")[0].rowIndex);
                                                                                            $itemRow.attr('id', "row" + rowCount);
                                                                                            var rowid1 = "row" + rowCount;
                                                                                            myWindow = window.open("../purchase/itemWiseSuppPopUp.htm?&rowid=" + rowid1 + "&action=reqPOform&itemCode=" + itemCode + "&id=" + id + "&suppcode=" + suppcode + "&suppname=" + suppname + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
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
                                                                                                calGrandTotal();
                                                                                                return;
                                                                                            } else {
                                                                                                alert('You can not delete this row...!!!');
                                                                                                return false;
                                                                                            }

                                                                                        }

//                                                                                        function check_digit(e, obj, intsize, deczize) {
//                                                                                            var keycode;
//
//                                                                                            if (window.event)
//                                                                                                keycode = window.event.keyCode;
//                                                                                            else if (e) {
//                                                                                                keycode = e.which;
//                                                                                            }
//                                                                                            else {
//                                                                                                return true;
//                                                                                            }
//
//                                                                                            var fieldval = (obj.value),
//                                                                                                    dots = fieldval.split(".").length;
//
//                                                                                            if (keycode == 46) {
//                                                                                                return dots <= 1;
//                                                                                            }
//                                                                                            if (keycode == 8 || keycode == 9 || keycode == 46 || keycode == 13 || keycode != 46 || keycode != 8) {
//                                                                                                // back space, tab, delete, enter 
//                                                                                                return true;
//                                                                                            }
//                                                                                            if ((keycode >= 32 && keycode <= 45) || keycode == 47 || (keycode >= 58 && keycode <= 127)) {
//                                                                                                return false;
//                                                                                            }
//                                                                                            if (fieldval == "0" && keycode == 48) {
//                                                                                                return false;
//                                                                                            }
//                                                                                            if (fieldval.indexOf(".") != -1) {
//                                                                                                if (keycode == 46) {
//                                                                                                    return false;
//                                                                                                }
//                                                                                                if (event.keyCode != 8 && event.keyCode != 46)
//                                                                                                {
//                                                                                                    event.preventDefault();
//                                                                                                }
//                                                                                                var splitfield = fieldval.split(".");
//                                                                                                if (splitfield[1].length >= deczize && keycode != 8 && keycode != 0)
//                                                                                                    return false;
//                                                                                            } else if (fieldval.length >= intsize && keycode != 46) {
//                                                                                                return false;
//                                                                                            } else {
//                                                                                                return true;
//                                                                                            }
//                                                                                        }

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
                            $(document).ready(function () {
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
                                $('#poeditform').validationEngine();
                                var inputval = '#qty, #discount, #price';
                                $(document).on('input', inputval, function () {
                                    updateGrandTotal();

                                });
                                $(document).on('input', '#discountPrice', function () {

                                    caldiscountPrice(this);
                                });
                                $(document).on('input', '#discount1', function () {

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


                                    $('tr.poadditem').each(function () {
                                        var $itemRow = $(this).closest('tr');
                                        var total = $itemRow.find('#total').val();

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
                                    $('tr.poadditem').each(function () {
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
                                var convFact = $itemRow.find('#requisitionUom').val();
                                var conVal = convFact.split("-");
                                var befdiscount = $itemRow.find('#qty').val() * $itemRow.find('#price').val();

                                $itemRow.find('#befdisc').val(parseFloat(befdiscount).toFixed(3));


                                var discount = $itemRow.find('#qty').val() * $itemRow.find('#price').val() * (1 - $itemRow.find('#discount').val() / 100);

                                //                                      var discountfinal = roundNumber(discount, 2);
                                //                var disPrice = parseFloat(befdiscount).toFixed(3) - parseFloat(discount).toFixed(3);

                                //                $itemRow.find('#discountPrice').val(parseFloat(disPrice).toFixed(3));
                                isNaN(discount) ? $itemRow.find('#total').val("N/A") : $itemRow.find('#total').val(parseFloat(discount).toFixed(3));
                                var total = 0;
                                $('tr.poadditem').each(function () {
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
                                calGrandTotal();
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
                                $('tr.poadditem').each(function () {
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
                                calGrandTotal();
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
                                } else {

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
                                $('tr.poadditem').each(function () {
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
