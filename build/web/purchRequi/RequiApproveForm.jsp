
<%-- 
    Document   : reviewApprove
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

        <!--<link href="../common/theme/css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">-->



        <!--[if lt IE 9]>
            <script src="../assets/js/ie8-responsive-file-warning.js"></script>
            <![endif]-->

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
              <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->
    </head>


    <body class="nav-sm">

        <div class="container body">


            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <div class="clearfix"></div>
                        <form class="form-inline" id="reviewAppForm" action="../purchase/RequiApprovSubmit.htm" method="post" enctype="multipart/form-data" onsubmit="return sub();" >
                            <div class="col-md-6 col-xs-12">
                                <div class="x_panel">     
                                    <jsp:include page="../login/headerlink.htm?submodule=Purchase Requisition&tab=Need Review&pagetype=form"/>
                                    <div class="x_title">
                                        <h2>Requisition for Review</h2>
                                        <div class="clearfix"></div>
                                    </div>


                                    <c:forEach items="${purchReqList}" var="type">
                                        <c:set var="division" value="${type.division}"/>
                                        <c:set var="potype" value="${type.purchaseType}"/>
                                        <c:set var="department" value="${type.department}"/>
                                        <c:set var="ReqNo" value="${type.prNo}"/>
                                        <c:set var="reqDate" value="${type.prDate}"/>
                                        <c:set var="prCode" value="${type.projectCode}"/>
                                        <c:set var="userId" value="${type.userId}"/>
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
                                    <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                        <thead>
                                            <tr class="headings">
                                                <th style="width: 12%;">Requisition Line No</th>
                                                <th>Item SubCategory</th>
                                                <th>Item Code</th>
                                                <th>Item Name</th>
                                                <th>Item Desc</th>
                                                <th>Quantity</th>
                                                <th>Unit</th>
                                                <!--<th>Unit Price</th>-->
                                                <!--<th>Total Price</th>-->                                               
                                                <!--<th>To be Delivered At</th>-->
                                                <!--<th>Priority</th>-->
                                                <th style="width: 10%;">Available Stock</th>
                                                <th style="width: 10%;">Required Date</th>
                                                <th style="width: 10%;">

                                                    <select id="act" style="color: black;width: 90px" class="form-control" onclick="changeAction(this.value)">
                                                        <option  value="">Select</option>
                                                        <option value="rev">Review All</option>
                                                        <option value="rej">Reject All</option>
                                                        <!--<option value="hold">OnHold All</option>-->
                                                    </select>
                                                </th>
                                                 
                                            </tr>
                                        </thead>

                                        <tbody id="billtable">  
                                            <c:set var="i" value="1"/>
                                            <c:forEach items="${purchReqList}" var="list">                                                    
                                                <tr> 
                                                    <td style="width:11%;">${list.reqsno}</td>
                                                    <td style="width:15%;"> ${list.itemSubCategory}</td> 
                                                    <td style="width:11%;">
                                                        <input name="pk" id="pk" value="${list.SNo}" type="hidden">
                                                        <input id="itemCode" value="${list.itemCode}" type="hidden">
                                                        ${list.itemCode}
                                                    </td>
                                                    <td style="width:30%;"> ${list.itemName}</td>  
                                                    <td style="width:10%;">${list.description}</td>  
                                                    <td class="right" style="width:6%;">${list.quantity}</td>  
                                                    <td style="width:6%;"> ${list.unit}</td> 
                                                    <%--   <td style="width:10%;">${list.unitPrice}</td> 
   <td style="width:11%;"><fmt:formatNumber  type="number" groupingUsed="false"  maxFractionDigits="3" value="${list.totalPrice}"/></td> --%>
                                                      
                                                       <!--<td>${list.deliveryLocation}</td>--> 
                                                       <!--<td>${list.priority}</td>--> 
                                                    <td class="right" id="availStock"></td> 
                                                    <td><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.requiredDate}"/></td> 
                                                    <td style="width:10%;"> 
                                                        <input type="radio" class="case"  name="case${list.SNo}" value="Reviewed" id="rev${i}"/>Reviewed<br/>

                                                                <!--<input type="radio" class="case2" name="case${list.SNo}" value="OnHold pending" id="hold${i}"/>On Hold<br/>-->
                                                        <input type="radio" class="case3"  name="case${list.SNo}" value="Rejected" id="rej${i}"/><span style="margin-right:21px;">Reject</span><br/></td>
                                                     

                                                </tr>

                                                <c:set var="i" value="${i+1}"/>

                                            </c:forEach> 


                                        </tbody>

                                    </table>
                                    <p>&nbsp;</p>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                        <label class="control-label"><span style="color: red">*</span> Remarks</label>                                       
                                        <textarea  class="form-control validate[required]" type="text" id="reviewerComments" style="resize: none;" name="reviewerComments" maxlength="120" ></textarea> 
                                    </div>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p><p>&nbsp;</p>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12">
 
                                            <!--<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">-->                                                    
                                            <button type="submit" class="btn btn-primary" style="">Save</button>
                                            <button type="button" class="btn btn-warning" onclick="recheck('${ReqNo}', 'Recheck');">Recheck</button>
                                            <a href="../purchase/RequiApproveList.htm"><button type="button" class="btn btn-danger"  >Cancel</button></a> 

                                            <!--                                                </div>-->
                                        </div>

                                    </div>
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
                                                $(document).ready(function () {
                                                    jQuery("#reviewAppForm").validationEngine();
                                                });
                                                //                                            $(document).ready(function () {
                                                //                                                $('input.tableflat').iCheck({
                                                //                                                    checkboxClass: 'icheckbox_flat-green',
                                                //                                                    radioClass: 'iradio_flat-green'
                                                //                                                });
                                                //                                            });
                                                //
                                                //                                            var asInitVals = new Array();
                                                //                                            $(document).ready(function () {
                                                //                                                var oTable = $('#example').dataTable({
                                                //                                                    "oLanguage": {
                                                //                                                        "sSearch": "Search all columns:"
                                                //                                                    },
                                                //                                                    "aoColumnDefs": [
                                                //                                                        {
                                                //                                                            'bSortable': true,
                                                //                                                            'aTargets': [0]
                                                //                                                        } //disables sorting for column one
                                                //                                                    ],
                                                //                                                    'iDisplayLength': 12,
                                                //                                                    "sPaginationType": "full_numbers",
                                                //                                                    "dom": 'T<"clear">lfrtip',
                                                //                                                    "tableTools": {
                                                //                                                        "sSwfPath": "<?php echo base_url('assets2/js/Datatables/tools/swf/copy_csv_xls_pdf.swf'); ?>"
                                                //                                                    }
                                                //                                                });
                                                //                                                $("tfoot input").keyup(function () {
                                                //                                                    /* Filter on the column based on the index of this element's parent <th> */
                                                //                                                    oTable.fnFilter(this.value, $("tfoot th").index($(this).parent()));
                                                //                                                });
                                                //                                                $("tfoot input").each(function (i) {
                                                //                                                    asInitVals[i] = this.value;
                                                //                                                });
                                                //                                                $("tfoot input").focus(function () {
                                                //                                                    if (this.className == "search_init") {
                                                //                                                        this.className = "";
                                                //                                                        this.value = "";
                                                //                                                    }
                                                //                                                });
                                                //                                                $("tfoot input").blur(function (i) {
                                                //                                                    if (this.value == "") {
                                                //                                                        this.className = "search_init";
                                                //                                                        this.value = asInitVals[$("tfoot input").index(this)];
                                                //                                                    }
                                                //                                                });
                                                //                                            });
            </script>


            <script>

                $(function () {

                    // add multiple select / deselect functionality
                    $("#selectall").click(function () {
                        $('.case').attr('checked', this.checked);
                    });

                    // if all checkbox are selected, check the selectall checkbox
                    // and viceversa
                    $("#case").click(function () {
                        alert("inside case");
                        if ($(".case").length == $(".case:checked").length) {
                            $("#selectall").attr("checked", "checked");
                        } else {
                            $("#selectall").removeAttr("checked");
                        }

                    });
                });

                function recheck(reqNo, status)
                {
                    var remarks = $('#reviewerComments').val();
                    if (remarks == null || remarks == '') {
                        alert("Please Write Remarks..!!");
                        return  false;
                    } else {
                        window.location.href = "../purchase/RequiApprovSubmit.htm?reqNo=" + reqNo + "&reviewerRecordStatus=" + status + "&reviewerComments=" + remarks + "";


                    }


                }


                function changeAction(val) {
                    var rowCount = $('#billtable tr').length;
                    if (val != "blank") {
                        for (var i = 1; i <= rowCount; i++) {
                            document.getElementById(val + i).checked = true;
                        }
                    } else {
                        for (var i = 1; i <= rowCount; i++) {
                            document.getElementById("rev" + i).checked = false;
                            document.getElementById("rej" + i).checked = false;
                        }
                    }
                }
                function sub() {

                    if ($(":radio").is(":checked")) {
                        var x = '';
                        //var len=$(":radio").is(":checked").length;

                        var table1 = document.getElementById("billtable");
                        var tlen = table1.rows.length;
                        var len = $('input:radio:checked').length;
                        if (tlen != len) {
                            alert("Please select the radio button");
                            return false;
                        }
                    }
                    else {
                        alert("Please select the radio button");
                        return false;
                    }
                }


                NProgress.done();
            </script>
    </body>

</html>



