<%-- 
    Document   : purchReqEdit
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

        <!-- Bootstrap core CSS -->

        <link href="../common/theme/css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">

        <script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>

        <!--[if lt IE 9]>
            <script src="../assets/js/ie8-responsive-file-warning.js"></script>
            <![endif]-->

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
              <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->

        <script src="../common/validate/Check_Digit.js" type="text/javascript"></script>
    </head>

    <body class="nav-sm">

        <div class="container body">


            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <div class="clearfix"></div>
                        <form class="form-inline" id="contDetForm" action="../purchase/purchaseRequiFormSubmit.htm" method="post" enctype="multipart/form-data">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="x_panel">     

                                    <jsp:include page="../login/headerlink.htm?submodule=Purchase Requisition&tab=Purchase Requisition&pagetype=form"/>
                                    <div class="row">

                                        <div class="col-md-12 col-sm-12 col-xs-12">

                                            <div class="x_title">                       
                                                <div  style="text-align: center;text-transform:uppercase;"><h3 style="font-size:21px;">Requisition Form</h3></div>
                                                <h2></h2>
                                                <div class="clearfix">

                                                </div>                       
                                            </div>

                                            <!--                                    <div class="x_title">                       
                                                                                    <div  style="text-align: center;text-transform:uppercase;"><h3>Requisition Form</h3></div>
                                                                                    <h2>Item List</h2>
                                                                                    <div class="clearfix">
                                            
                                                                                    </div>                       
                                                                                </div>-->
                                            <div class="x_content">
                                                <c:forEach items="${purchReqList}" var="type">
                                                    <c:set var="division" value="${type.division}"/>
                                                    <c:set var="potype" value="${type.purchaseType}"/>
                                                    <c:set var="department" value="${type.department}"/>
                                                    <c:set var="ReqNo" value="${type.prNo}"/>
                                                    <c:set var="reqDate" value="${type.prDate}"/>
                                                    <c:set var="prCode" value="${type.projectCode}"/>
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
                                                        <%--<div>
                                                            <strong style="padding-right: 8px;">Division:</strong> ${division}
                                                        </div>--%>
                                                        <div>
                                                            <strong style="padding-right: 8px;">PO Type:</strong> ${potype}
                                                        </div>
                                                        <div>
                                                            <strong style="padding-right: 8px;">Department:</strong> ${department}
                                                        </div>
                                                        <div><strong style="padding-right: 8px;">Requisition No:</strong> ${ReqNo}
                                                            <input name="ReqNo" id="ReqNo" value="${ReqNo}" type="hidden">
                                                        </div>


                                                        <div><strong style="padding-right: 8px;width: 50px;">Requisition Date:</strong> <fmt:formatDate pattern="dd-MMM-yyyy" value="${reqDate}" />
                                                            <input name="reqDate" type="hidden" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${reqDate}"/>" tabindex="-1"/>
                                                            <input class="input-xlarge"id="" name="ReqDateNo" readonly="" type="hidden" value="<%= (new SimpleDateFormat("dd-MMM-yyyy")).format(new java.util.Date())%>">
                                                        </div>

                                                    </div>                                            
                                                    <div class="col-md-offset-6">
                                                        <div>
                                                            <label class="control-label"  style="padding-right: 8px;width:100px;" for="selectError">Required Date:</label>
                                                            <fmt:formatDate pattern="dd-MMM-yyyy" value="${requiredDate}"/>                                                    
                                                        </div>
                                                        <div>

                                                            <label class="control-label"  style="padding-right: 8px;width:60px;" for="selectError">Priority:</label>${priority}
                                                            <input type="hidden" readonly="" name="priority" id="priority" class="form-control" tabindex="7" value="${priority}"/>


                                                        </div>
                                                        <div> 

                                                            <strong style="padding-right: 8px;">Delivery Location:</strong><b style="width: 90px;font-weight: normal;">${deliveryLocation}</b>


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


                                                        <%--</c:forEach>--%> 
                                                    </tbody>
                                                </table>         
                                                <p>&nbsp;</p>
                                                <div class="x_content" style="overflow-x:  scroll;">
                                                    <table id="" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                                        <thead>
                                                            <tr class="headings">
                                                                <th>Requisition Line No</th>
                                                                <th>Item Sub Category</th>
                                                                <th>Item Code</th>
                                                                <th>Item Name</th>
                                                                <th>Item Desc</th>
                                                                <th><span style="color: red">*</span> Quantity</th>
                                                                <th><span style="color: red">*</span> Unit</th>
                                                                <!--<th>Unit Price</th>-->
                                                                <!--<th>Total Price</th>-->
                                                                <th  style="width:10%;"><span style="color: red">*</span> Required Date</th>
                                                                <!--<th>To be Delivered At</th>-->
                                                                <!--<th>Priority</th>-->
                                                                <!--<th class=" no-link last"><span class="nobr">Remarks</span>-->
                                                                </th>
                                                            </tr>
                                                        </thead>

                                                        <tbody>
                                                            <c:set var="slNo" value="0"/>
                                                            <c:forEach items="${purchList}" var="list">
                                                                <tr id="reqedit" class="poadditem">
                                                                    <td style="width:10%;">${list.reqsno}</td>
                                                                    <td style="width:18%;"> ${list.itemSubCategory}</td> 
                                                                    <td style="width:10%;"><input type="hidden" name="action" value="${action}"/>
                                                                        <input type="hidden" name="pk" value="${list.SNo}"/>
                                                                        <input type="hidden" name="subreqNo" value="${list.reqsno}"/>
                                                                        <input type="hidden" name="status" value="${list.status}"/>
                                                                        <input type="hidden" name="needReview" value="${list.needReview}"/>
                                                                        <input type="hidden" name="reviewerRecordStatus" value="${list.reviewerRecordStatus}"/>
                                                                        <input type="hidden" name="Rname" value="${list.reviewerName}"/>
                                                                        <input type="hidden" name="Aname" value="${list.approverName}"/>
                                                                        <input name="projectCode" id="projectCode" value="${prCode}" type="hidden">
                                                                        <input  name="prName" type="hidden" value="${list.projectName}"> 
                                                                        <input name="itemCat"  type="hidden" value="${list.itemCategory}"> 
                                                                        <input name="itemsubCat"   type="hidden" value="${list.itemSubCategory}"> 
                                                                        <input type="hidden" name="division" id="division" value="${list.division}">
                                                                        <input  type="hidden" name="purchaseType" id="purchaseType" value="${list.purchaseType}"> 
                                                                        <input name="itemCode" value="${list.itemCode}" id="itemCode" readonly="readonly" type="hidden">
                                                                        <input type="hidden" name="attachmentReference" value="${list.attachment}">                                                    
                                                                        <input type="hidden"  name="dept" value="${list.department}">                 
                                                                        <input type="hidden" name="fileName" value="${list.fileName}">
                                                                        <input name="recordStatus" type="hidden" value="${list.recordStatus}">                                                                                                                                      
                                                                        <input name="requiredAtLoc" class="form-control input-sm" value="${list.deliveryLocation}" id="requiredAtLoc" type="hidden" readonly>
                                                                        ${list.itemCode}
                                                                    </td>
                                                                    <td> <input style="width:100%;" name="itemName" class="form-control" value="${fn:escapeXml(list.itemName)}" id="itemName" readonly="readonly" type="text"></td>  
                                                                    <td><input name="itemDesc" value="${fn:escapeXml(list.description)}" class="form-control input-sm " readonly="" id="itemDesc"  type="text"></td>  
                                                                    <td style="width:10%;"><input class="form-control input-sm  validate[required] validate[custom[notzero],custom[float5]] right" autocomplete="off" maxlength="14" required type="text" style="width:117px;" onpaste="return false" name="requisitionQty" id="reqQty${slNo}"  onkeydown="calTotal(this, '${slNo}')" onkeyup="calTotal(this, '${slNo}')" onkeypress="return check_digit(event, this, 10, 3);"  value="${list.quantity}"/></td>  
                                                                    <td style="width:10%;"> <select name="requisitionUom" id="requisitionUom" style="width:117px;text-align:left;" class="form-control input-sm validate[required]" onchange="calTotal(this, '${slNo}')"  tabindex="7">
                                                                            <option value="${list.unit}">${list.unit}</option>
                                                                        </select>
                                                                    </td> 
                                                                    <td style="width:12%;display: none"><input type="hidden" required style="width:117px;text-align:left;" class="form-control input-sm " autocomplete="off" onkeypress="return isNumberKey(event)"  onkeyup="calTotal(this, '${slNo}')" readonly="" name="unitPrice" id="unitPrice${slNo}" value="${list.unitPrice}"></td> 

                                                                    <td style="width:12%;display: none"><input type="text" readonly style="width:200px;text-align:left;" class="form-control input-sm "  name="totalPrice" id="totalPrice${slNo}" value="${list.totalPrice}"></td> 

                                                                    <td><input type="text"  style="width:100%;" autocomplete="off" placeholder="DD/MM/YYYY" name="requiredByDate" class="form-control input-sm validate[required]"  id="${list.SNo}" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${list.requiredDate}"/>" onchange="validateDate(this.value, '${list.itemCode}', '${list.SNo}')">
                                                                        <input style="text-align:center;" type="hidden" name="reqDateSno" id="reqDateSno" value="${list.SNo}"/></td> 
                                                                    <!--<td></td>--> 
            <!--                                                            <td><select name="priority" id="priority${list.SNo}" class="form-control input-sm " tabindex="7" >
            
                                                                            <option>${list.priority}</option>
                                                                    <c:choose>
                                                                        <c:when test="${list.priority eq ''}">
                                                                            <option>HIGH</option>
                                                                            <option>MEDIUM</option>
                                                                            <option>LOW</option> </c:when>
                                                                        <c:when test="${list.priority eq 'HIGH'}">
                                                                            <option>LOW</option>
                                                                            <option>MEDIUM</option>
                                                                        </c:when>
                                                                        <c:when test="${list.priority eq 'LOW'}">
                                                                            <option>HIGH</option> 
                                                                            <option>MEDIUM</option>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <option>HIGH</option>
                                                                            <option>LOW</option>
                                                                        </c:otherwise> 
                                                                    </c:choose>
            
                                                                </select></td> -->
                                                                    <!--<td><input name="actionRemarks" value="${list.remarks}" class="form-control input-sm" id="actionRemarks" tabindex="2" type="text"></td>-->                                      

                                                                </tr>
                                                                <c:set var="slNo" value="${slNo+1}"/>
                                                            </c:forEach> 


                                                        </tbody>

                                                    </table>
                                                </div>
                                                <p>&nbsp;</p>
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <c:choose>
                                                        <c:when test="${fn:length(purchReqList) > 0}">
                                                            <c:forEach items="${purchReqList}" var="type">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <script type="text/javascript">
                                                                            $(document).ready(function () {


                                                                                var nFields = document.getElementsByClassName('x_panel')[0].getElementsByTagName('textarea');
                                                                                for (i = 0; i < nFields.length; i++)
                                                                                {
                                                                                    debugger;
                                                                                    if (!(nFields[i].readOnly)) {
                                                                                        //console.log("ss" +readOnlyAttr);
                                                                                        //$(nFields[i]).css("border-color", "red");
                                                                                        $(nFields[i]).focus(function () {
                                                                                            debugger;
                                                                                            //alert('hi');
                                                                                            $(this).css("border-color", "red");
                                                                                            //$(this).attr("style", "border-color red !important");
                                                                                        });
                                                                                    }
                                                                                }

                                                                            });
                                                                        </script>
                                                                    </c:when>
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                    </c:choose>
                                                    <label class="control-label"><span style="color: red"></span> Remarks</label>

                                                    <textarea class="form-control"  rows="2" style="resize: none;" name="actionRemarks" id="storeComment" type="text"  maxlength="100">${remarks}</textarea>
                                                    <input id="storeComment1" class="form-control"  rows="1" maxlength="300" style="resize: none" type="hidden" value="${remarks}">



                                                </div>

                                                <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>

                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <p>&nbsp;</p>
                                                    <!--<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">-->
                                                    <button type="button" class="btn btn-primary" style="" onclick="return test();">Save</button>

                                                    <!--                                                    <button type="submit" class="btn btn-primary" style="" onclick="if (confirm('Do you really want to Save this record')) {
                                                                                                                    return true;
                                                                                                                } else {
                                                                                                                    return false;
                                                                                                                }">Save</button>-->
                                                    <a href="../purchase/purchaseRequiList.htm"><button type="button" class="btn btn-danger" style="" >Cancel</button></a> 

                                                    <!--</div>-->
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


        <script>
            $(document).ready(function () {
                gridEditArrowKey();

                $('#contDetForm').validationEngine();

                $('tr#reqedit').each(function () {

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
                    url: "../purchReq/uomlist.htm",
                    data: {code: c},
                    success: function (data) {
                        //                                                                    alert(data);
                        //                        
                        //                $('#requisitionUom').html("");
                        var toAppend = '';
                        var nameArray = data.split(",");

                        // toAppend += '<option value="">Select an Option</option>';   
                        if (nameArray[0] == nameArray[1]) {
                            if (nameArray[0] != "") {
                                toAppend += '<option value=' + '1' + '-' + nameArray[0] + '>' + nameArray[0] + '</option>';
                            }
                            if (nameArray[2] != "" && nameArray[2] !== 'null' && nameArray[5] !== 'null' && parseFloat(nameArray[5]) !== 0) {
                                toAppend += '<option value=' + '1' + '-' + nameArray[2] + '>' + nameArray[2] + '</option>';
                            }
                            if (nameArray[3] != "" && nameArray[3] !== 'null' && nameArray[6] !== 'null' && parseFloat(nameArray[6]) !== 0) {
                                toAppend += '<option value=' + '1' + '-' + nameArray[3] + '>' + nameArray[3] + '</option>';
                            }
                        } else {
                            if (nameArray[0] != "") {
                                toAppend += '<option value=' + '1' + '-' + nameArray[0] + '>' + nameArray[0] + '</option>';
                            }

                            if (nameArray[1] != "" && nameArray[1] !== 'null' && nameArray[4] !== 'null' && parseFloat(nameArray[4]) !== 0) {
                                toAppend += '<option value=' + '1' + '-' + nameArray[1] + '>' + nameArray[1] + '</option>';

                            }
                            if (nameArray[2] != "" && nameArray[2] !== 'null' && nameArray[5] !== 'null' && parseFloat(nameArray[5]) !== 0) {
                                toAppend += '<option value=' + '1' + '-' + nameArray[2] + '>' + nameArray[2] + '</option>';
                            }
                            if (nameArray[3] != "" && nameArray[3] !== 'null' && nameArray[6] !== 'null' && parseFloat(nameArray[6]) !== 0) {
                                toAppend += '<option value=' + '1' + '-' + nameArray[3] + '>' + nameArray[3] + '</option>';
                            }
                        }
//        if (nameArray[0] != "") {
//                            toAppend += '<option value=' + '1' + '-' + nameArray[0] + '>' + nameArray[0] + '</option>';
//                        }
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

                        $itemRow1UF.find('#requisitionUom option').each(function () {
                            var curUom = $itemRow1UF.find(this).val().split('-');
                            if (requisitionUom === curUom[1])
                            {
                                $itemRow1UF.find(this).prop('selected', true);
                            }
                        });



                        //                $('#requisitionUom').append(toAppend);

                    },
                    error: function (error) {
//                        alert(error);
                    }

                });



            }


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


            function calTotal($this, sno)
            {
                var $itemRow1UF = $($this).closest('tr');
                var qty = $('#reqQty' + sno).val();
                var unitPrice = $('#unitPrice' + sno).val();
//                var convFact = $itemRow1UF.find('#requisitionUom').val();
//                var conVal = convFact.split("-");
//                if (qty == "0")
//                {
//                    alert("Invalid Quantity...!!");
//                    $('#reqQty' + sno).val('');
//                    $('#totalPrice' + sno).val('');
//                    return false;
//                }
                if (qty != '' && qty != null)
                {
                    var price = parseFloat(qty).toFixed(3) * parseFloat(unitPrice).toFixed(3);
                    $('#totalPrice' + sno).val(parseFloat(price).toFixed(3));
                }
            }
            function selectdate(val) {

                NewCssCal(val, 'ddMMMyyyy', '', '', '', '', 'future');
                //$('#test').attr();
                //document.getElementById("hiddentr").value=$itemRow.index();

            }

//            function check_digit(e, obj, intsize, deczize) {
//                var keycode;
//
//                if (window.event)
//                    keycode = window.event.keyCode;
//                else if (e) {
//                    keycode = e.which;
//                }
//                else {
//                    return true;
//                }
//
//                var fieldval = (obj.value),
//                        dots = fieldval.split(".").length;
//
//                if (keycode == 46) {
//                    return dots <= 1;
//                }
//                if (keycode == 8 || keycode == 9 || keycode == 46 || keycode == 13) {
//                    // back space, tab, delete, enter 
//                    return true;
//                }
//                if ((keycode >= 32 && keycode <= 45) || keycode == 47 || (keycode >= 58 && keycode <= 127)) {
//                    return false;
//                }
//                if (fieldval == "0" && keycode == 48) {
//                    return false;
//                }
//                if (fieldval.indexOf(".") != -1) {
//                    if (keycode == 46) {
//                        return false;
//                    }
//                    var splitfield = fieldval.split(".");
//                    if (splitfield[1].length >= deczize && keycode != 8 && keycode != 0)
//                        return false;
//                } else if (fieldval.length >= intsize && keycode != 46) {
//                    return false;
//                } else {
//                    return true;
//                }
//            }

//            function check_digit(e, obj, intsize, deczize) {
//                var keycode;
//
//                if (window.event)
//                    keycode = window.event.keyCode;
//                else if (e) {
//                    keycode = e.which;
//                }
//                else {
//                    return true;
//                }
//
//                var fieldval = (obj.value),
//                        dots = fieldval.split(".").length;
//
//                if (keycode == 46) {
//                    return dots <= 1;
//                }
//                if (keycode == 8 || keycode == 9 || keycode == 46 || keycode == 13 || keycode != 46 || keycode != 8) {
//                    // back space, tab, delete, enter 
//                    return true;
//                }
//                if ((keycode >= 32 && keycode <= 45) || keycode == 47 || (keycode >= 58 && keycode <= 127)) {
//                    return false;
//                }
//                if (fieldval == "0" && keycode == 48) {
//                    return false;
//                }
//                if (fieldval.indexOf(".") != -1) {
//                    if (keycode == 46) {
//                        return false;
//                    }
//                    if (event.keyCode != 8 && event.keyCode != 46)
//                    {
//                        event.preventDefault();
//                    }
//                    var splitfield = fieldval.split(".");
//                    if (splitfield[1].length >= deczize && keycode != 8 && keycode != 0)
//                        return false;
//                } else if (fieldval.length >= intsize && keycode != 46) {
//                    return false;
//                } else {
//                    return true;
//                }
//            }

            function validateDate(reqdate, itemcd, slno) {
                getDate(slno);
                $('.poadditem').each(function () {
                    var $itemRow = $(this).closest('tr');

                    var itemCode = $itemRow.find('#itemCode').val();
                    var reqDateSno = $itemRow.find('#reqDateSno').val();
                    if (slno != reqDateSno)
                    {
                        if (itemCode == itemcd) {
                            var requiredByDate = $itemRow.find("input[name='requiredByDate']").val();
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
            function getDate(slno) {

                var ex1 = $("#" + slno).val();
                var ex2 = dateconvert(ex1);
                //              
                var exp = moment(ex2).format("YYYY-MM-DD");
                var today = moment(Date()).format("YYYY-MM-DD");


                var dateformat = /^(?:(?:31(\/)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/;

                if (!ex1.match(dateformat))
                {
                    alert("You have entered an invalid date!");
                    $("#" + slno).val('');
                    return false;
                }
                else if (exp < today) {

                    alert("Date already expired");
                    $("#" + slno).val('');
                }

            }
            function dateconvert(input) {

                var date = input.split("/");
                var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
                for (var j = 0; j < months.length; j++) {
                    if (date[1] == months[j]) {
                        date[1] = months.indexOf(months[j]) + 1;
                    }
                }
                if (date[1] < 10) {
                    date[1] = date[1];
                }
                var formattedDate = date[2] + "/" + date[1] + "/" + date[0];

                return formattedDate;
            }

            function test()
            {
                var comp = document.getElementById("storeComment").value;
                var comp1 = document.getElementById("storeComment1").value;


                if (comp !== comp1) {
                    if (confirm('Do you really want to Save this updated record')) {
                        document.forms["contDetForm"].submit();
                        return true;
                    } else {
                        return true;
                    }

                } else {
                    document.forms["contDetForm"].submit();
                }


            }

        </script>

        <script>
            NProgress.done();
        </script>
    </body>

</html>



