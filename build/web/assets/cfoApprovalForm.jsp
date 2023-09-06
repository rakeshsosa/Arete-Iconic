<%-- 
    Document   : cfoApprovalForm
    Created on : Oct 18, 2016, 11:52:55 AM
    Author     : EBS-SDD15
--%>

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
        <script type="text/javascript">

            function mandatoryFilds() {

                if (document.getElementById("approverRemarks2").value == "") {
                    alert("Enter remarks");
                    return false;
                }
                else {

                    document.forms["rejectFormid"].submit();
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
                        <div class="clearfix"></div>
                        <div class="col-md-6 col-xs-12">
                            <div class="x_panel">
                                <jsp:include page="../login/headerlink.htm?submodule=Material Return&tab=Approval 2&pagetype=form"/>
                                <div class="x_title">
                                    <h2>Material Return Form</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />
                                    <form class="form-inline" id="rejectFormid" action="../quality/cfoApprovalSubmit.htm"  method="post" enctype="multipart/form-data">
                                        <c:forEach items="${test}" var="list">
                                            <c:if test="${list[0] eq '482'}">
                                                <c:set value="${list[1]}" var="field_1"/>
                                                <c:set value="${list[2]}" var="fieldStatus_1"/>
                                                <c:set value="${list[3]}" var="mand_status_1"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '484'}">
                                                <c:set value="${list[1]}" var="field_2"/>
                                                <c:set value="${list[2]}" var="fieldStatus_2"/>
                                                <c:set value="${list[3]}" var="mand_status_2"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '485'}">
                                                <c:set value="${list[1]}" var="field_3"/>
                                                <c:set value="${list[2]}" var="fieldStatus_3"/>
                                                <c:set value="${list[3]}" var="mand_status_3"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '486'}">
                                                <c:set value="${list[1]}" var="field_4"/>
                                                <c:set value="${list[2]}" var="fieldStatus_4"/>
                                                <c:set value="${list[3]}" var="mand_status_4"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '487'}">
                                                <c:set value="${list[1]}" var="field_5"/>
                                                <c:set value="${list[2]}" var="fieldStatus_5"/>
                                                <c:set value="${list[3]}" var="mand_status_5"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '488'}">
                                                <c:set value="${list[1]}" var="field_6"/>
                                                <c:set value="${list[2]}" var="fieldStatus_6"/>
                                                <c:set value="${list[3]}" var="mand_status_6"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '489'}">
                                                <c:set value="${list[1]}" var="field_7"/>
                                                <c:set value="${list[2]}" var="fieldStatus_7"/>
                                                <c:set value="${list[3]}" var="mand_status_7"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '490'}">
                                                <c:set value="${list[1]}" var="field_8"/>
                                                <c:set value="${list[2]}" var="fieldStatus_8"/>
                                                <c:set value="${list[3]}" var="mand_status_8"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '491'}">
                                                <c:set value="${list[1]}" var="field_9"/>
                                                <c:set value="${list[2]}" var="fieldStatus_9"/>
                                                <c:set value="${list[3]}" var="mand_status_9"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '492'}">
                                                <c:set value="${list[1]}" var="field_10"/>
                                                <c:set value="${list[2]}" var="fieldStatus_10"/>
                                                <c:set value="${list[3]}" var="mand_status_10"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '493'}">
                                                <c:set value="${list[1]}" var="field_11"/>
                                                <c:set value="${list[2]}" var="fieldStatus_11"/>
                                                <c:set value="${list[3]}" var="mand_status_11"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '494'}">
                                                <c:set value="${list[1]}" var="field_12"/>
                                                <c:set value="${list[2]}" var="fieldStatus_12"/>
                                                <c:set value="${list[3]}" var="mand_status_12"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '495'}">
                                                <c:set value="${list[1]}" var="field_13"/>
                                                <c:set value="${list[2]}" var="fieldStatus_13"/>
                                                <c:set value="${list[3]}" var="mand_status_13"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '496'}">
                                                <c:set value="${list[1]}" var="field_14"/>
                                                <c:set value="${list[2]}" var="fieldStatus_14"/>
                                                <c:set value="${list[3]}" var="mand_status_14"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '497'}">
                                                <c:set value="${list[1]}" var="field_15"/>
                                                <c:set value="${list[2]}" var="fieldStatus_15"/>
                                                <c:set value="${list[3]}" var="mand_status_15"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '498'}">
                                                <c:set value="${list[1]}" var="field_16"/>
                                                <c:set value="${list[2]}" var="fieldStatus_16"/>
                                                <c:set value="${list[3]}" var="mand_status_16"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '499'}">
                                                <c:set value="${list[1]}" var="field_17"/>
                                                <c:set value="${list[2]}" var="fieldStatus_17"/>
                                                <c:set value="${list[3]}" var="mand_status_17"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '500'}">
                                                <c:set value="${list[1]}" var="field_18"/>
                                                <c:set value="${list[2]}" var="fieldStatus_18"/>
                                                <c:set value="${list[3]}" var="mand_status_18"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '501'}">
                                                <c:set value="${list[1]}" var="field_19"/>
                                                <c:set value="${list[2]}" var="fieldStatus_19"/>
                                                <c:set value="${list[3]}" var="mand_status_19"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '502'}">
                                                <c:set value="${list[1]}" var="field_20"/>
                                                <c:set value="${list[2]}" var="fieldStatus_20"/>
                                                <c:set value="${list[3]}" var="mand_status_20"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '503'}">
                                                <c:set value="${list[1]}" var="field_21"/>
                                                <c:set value="${list[2]}" var="fieldStatus_21"/>
                                                <c:set value="${list[3]}" var="mand_status_21"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '504'}">
                                                <c:set value="${list[1]}" var="field_22"/>
                                                <c:set value="${list[2]}" var="fieldStatus_22"/>
                                                <c:set value="${list[3]}" var="mand_status_22"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '505'}">
                                                <c:set value="${list[1]}" var="field_23"/>
                                                <c:set value="${list[2]}" var="fieldStatus_21"/>
                                                <c:set value="${list[3]}" var="mand_status_21"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '506'}">
                                                <c:set value="${list[1]}" var="field_24"/>
                                                <c:set value="${list[2]}" var="fieldStatus_22"/>
                                                <c:set value="${list[3]}" var="mand_status_22"/>
                                            </c:if>


                                        </c:forEach> 

                                        <c:set var="j" value="0"/>
                                        <c:forEach items="${cfoApprovalList}" var="list">
                                            <c:if test="${j eq 0}">
                                                <c:set var="j" value="1"/>
                                                <c:forEach items="${supp}" var="type">
                                                    <c:if test="${type.supplierCode eq list.supplierName}">
                                                        <c:set var="supplierCode" value="${type.supplierCode}"/>
                                                        <c:set var="supplierName" value="${type.supplierName}"/>
                                                        <c:set var="supplierAddress" value="${type.supplierAddress}"/>
                                                        <c:set var="supplierContactNo" value="${type.supplierContNum}"/>
                                                        <c:set var="supplierMailId" value="${type.mailId}"/>
                                                    </c:if>                                   
                                                </c:forEach>
                                                <c:set var="poNo" value="${list.poNo}"/>
                                                <c:set var="mrNo" value="${list.mrNo}"/>
                                                <c:set var="customerInvoiceNo" value="${list.customerInvoiceNo}"/>
                                                <c:set var="customerInvoiceDate" value="${list.customerInvoiceDate}"/>
                                                <c:set var="batchNo" value="${list.batchNo}"/>
                                                <c:set var="qaBy" value="${list.qaBy}"/>
                                                <c:set var="qa" value="${list.qa}"/>
                                                <c:set var="inventoryLocation" value="${list.inventoryLocation}"/>

                                            </c:if>
                                        </c:forEach>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                            <div class="col-md-5  form-inline"> 
                                                <label class="control-label">  PO No:</label></div>
                                            <div class="col-md-5  form-inline"> <span id="dynamicdiv" style="display: inline">${poNo}</span>
                                                <input name="poNo" id="poNo" value="${poNo}" type="hidden">
                                                <input name="mrNo" id="mrNo" value="${mrNo}" type="hidden">
                                            </div>
                                            <div class="col-md-5  form-inline"> 
                                                <label class="control-label">  QA No:</label></div>
                                            <div class="col-md-5  form-inline"> <span id="dynamicdiv" style="display: inline">${qa}</span>
                                                <input class="form-control" name="qa" readonly="" type="hidden" value="${qa}" maxlength="80">
                                            </div>
                                            <div class="col-md-5  form-inline"> <label class="control-label">Supplier Name:</label></div> 
                                            <div class="col-md-5  form-inline"> ${supplierName}
                                                <input class="form-control" name="supplierName" readonly="" type="hidden" value="${supplierCode}" maxlength="80">
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

                                            <div class="col-md-5 col-sm-6 col-xs-6 form-inline">   
                                                <label class="control-label">Supplier Invoice No:</label></div> 
                                            <div class="col-md-5  form-inline"> ${customerInvoiceNo}
                                                <input class="form-control" name="customerInvoiceNo" readonly="" type="hidden" value="${customerInvoiceNo}" maxlength="80">
                                            </div>

                                            <p>&nbsp;</p>

                                            <div class="col-md-5  form-inline">   <label class="control-label">Supplier Invoice Date:</label></div> <div class="col-md-5 col-sm-6 col-xs-6 form-inline"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${customerInvoiceDate}" />
                                                <input name="customerInvoiceDate" type="hidden" value="${customerInvoiceDate}" tabindex="-1"/>
                                            </div>
                                            <p>&nbsp;</p>  

                                        </div>

                                        <div class="col-md-4 col-sm-6 col-xs-12" style="float:right">

                                            <div class="col-md-5  form-inline">   <label class="control-label">Batch No:</label></div> <div class="col-md-5 col-sm-6 col-xs-6 form-inline">${batchNo}
                                                <input class="form-control" name="batchNo" readonly="" type="hidden" value="${batchNo}" maxlength="80">
                                            </div>

                                            <div class="col-md-5  form-inline">   <label class="control-label">QA By:</label></div> <div class="col-md-5 col-sm-6 col-xs-6 form-inline">${qaBy}
                                                <input class="form-control" name="qaBy" readonly="" type="hidden" value="${qaBy}" maxlength="80">
                                            </div>

                                            <div class="col-md-5  form-inline">   <label class="control-label">Inventory Location:</label></div> <div class="col-md-5 col-sm-6 col-xs-6 form-inline">${inventoryLocation}
                                                <input class="form-control" name="inventoryLocation" readonly="" type="hidden" value="${inventoryLocation}" maxlength="80">
                                            </div>
                                            <p>&nbsp;</p>

                                        </div>
                                        <p>&nbsp;</p>
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <div class="x_panel" style="overflow:scroll">

                                                <div class="x_content">



                                                    <table class="table table-striped responsive-utilities jambo_table bulk_action">
                                                        <thead>
                                                            <tr class="headings">


                                                                <th class="column-title">Accessory Code</th>
                                                                <th class="column-title">Accessory Name</th>
                                                                <th class="column-title">UOM</th>
                                                                <th class="column-title">FOC</th>
                                                                <th class="column-title">Order Qty</th>
                                                                <th class="column-title">Qty Accepted</th>
                                                                <th class="column-title">Qty Returned</th>
                                                                <th class="column-title">Expiry Date</th>
                                                                <!--                                                                <th class="column-title">Warranty Period</th>-->

                                                            </tr>
                                                        </thead>

                                                        <tbody>


                                                            <c:forEach items="${cfoApprovalList}" var="list">
                                                                <c:forEach items="${item}" var="list1">
                                                                    <c:if test="${list1.itemCode eq list.itemCode}">
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
                                                                <c:set var="qty" value="${list.orderedQty}"/>
                                                                <c:set var="receivedQty" value="${list.receivedqty}"/>
                                                                <c:set var="returnedQty" value="${list.rejectQty}"/>
                                                                <c:set var="foc" value="${list.foc}"/>
                                                                <c:set var="batchNo" value="${list.batchNo}"/>
                                                                <c:set var="expiryDate" value="${list.expiryDate}"/>
                                                                <%--  <c:set var="warrwntyPeriod" value="${list.warrwntyPeriod}"/>--%>


                                                                <tr class="even pointer">

                                                                    <td>
                                                                        <input class="form-control" style="width: 100%;text-align: left;" name="itemCode" id="itemCode" value="${code}" readonly="" type="text">
                                                                    </td>
                                                                    <td>
                                                                        <input class="form-control" style="width: 100%;text-align: left;" name="itemName" id="itemName" value="${name}" readonly="" type="text">
                                                                    </td>
                                                                    <td>
                                                                        <input class="form-control" style="width: 100%;text-align: left;" name="uom" id="uom" value="${uomName}" readonly="" type="text">
                                                                    </td>
                                                                    <td>
                                                                        <input class="form-control" style="width: 100%;text-align: right;" name="foc" id="foc" value="${foc}" readonly="" type="text">
                                                                    </td>
                                                                    <td>
                                                                        <input class="form-control" style="width: 100%;text-align: right;" name="qty" id="${j}qty" value="${qty}"  type="text" readonly="">
                                                                    </td>
                                                                    <td>
                                                                        <input class="form-control" style="width: 100%;text-align: right;" name="receivedQty" id="${j}rejectQty" value="${receivedQty}" type="text" readonly="" >
                                                                    </td> 
                                                                    <td>
                                                                        <input class="form-control" style="width: 100%;text-align: right;" name="returnedQty" id="returnedQty" value="${returnedQty}" type="text" readonly="">
                                                                    </td>


                                                                    <td>
                                                                        <input class="form-control" style="width: 100%;text-align: left;" id="${j}expiryDate"  readonly="" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${expiryDate}" />" type="text" name="expiryDate">   

                                                                    </td>
                                                                    <!--                                                                    <td>
                                                                                                                                            <input class="form-control" style="width: 100%;text-align: right;" name="warrwntyPeriod" id="warrwntyPeriod" readonly="" value="${warrwntyPeriod}" type="text" onkeypress="return isNumberKey4(event)">                                                 
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
                                                    <c:set var="dupImNo" value="0"/>
                                                    <c:forEach items="${cfoApprovalList}" var="list">

                                                        <c:set var="gfcremarks" value="${list.approverRemarks1}" /> 

                                                        <c:if test="${gfcremarks ne null && gfcremarks ne ''}">
                                                            <c:if test="${dupImNo != gfcremarks}">
                                                                <tr>
                                                                    <td class="center" style="text-align: left;"><b>GFC</b></td>
                                                                    <!--<td class="center" style="text-align: left;">${list.userId}</td>-->
                                                                    <td class="center" style="text-align: left;"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${list.lastmodifiedDate}" /></td>
                                                                    <td class="center" style="text-align: left;">${gfcremarks}</td>
                                                                </tr>
                                                                <c:set value="${gfcremarks}" var="dupImNo"/>
                                                            </c:if>
                                                        </c:if>
                                                    </c:forEach>

                                                </tbody>
                                            </table>
                                        </div>
                                        <div>
                                            <c:if test="${action ne 'view'}">

                                                <!--                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                                                                            <br/>
                                                                                            <br/>
                                                                                            <input type="text" name="approverRemarks2" id="approverRemarks2" autocomplete="off" placeholder="Remarks" maxlength="100" style="width:450px;  height:50px"/>
                                                                                        </div>-->
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <a class="control-label-required" style="color:red;">*</a>

                                                    <label class="control-label" style="margin-top:-20px;">Remarks
                                                    </label>
                                                    <textarea class="form-control" rows="1" style="resize: none" maxlength="200" value="" autocomplete="off" name="approverRemarks2" id="approverRemarks2" type="text"></textarea>
                                                </div>


                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                    <input class="btn btn-primary" value="Save" type="button" onclick="mandatoryFilds();">
                                                    <a href="../quality/cfoApprovalList.htm" class="btn btn-danger">Cancel</a>
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


