<%-- 
    Document   : purchReqview
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


        <script type="text/javascript" src="../common/datepicker/datetimereq_css.js"></script>


    </head>



    <body class="nav-sm">
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
                                        <jsp:include page="../login/headerlink.htm?submodule=Purchase Requisition&tab=Rejected Requisition&pagetype=form"/>
                                        <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="x_title">                                       
                                                    <div  style="text-align: center;text-transform:uppercase;"><h3 style="font-size:21px;">Rejected Requisition</h3></div>
                                                    <!--<h2>Item List</h2>-->
                                                    <div class="clearfix">

                                                    </div>                       
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

                                                    <form class="form-horizontal" id="contDetForm" action="../purchReq/purReqFormSubmit.htm" method="post" enctype="multipart/form-data">
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
                                                                <div><strong style="padding-right: 8px;">Requisition No:</strong> ${ReqNo}
                                                                    <input name="ReqNo" id="ReqNo" value="${ReqNo}" type="hidden">
                                                                </div>


                                                                <div><strong style="padding-right: 8px;width: 50px">Requisition Date:</strong> <fmt:formatDate pattern="dd-MMM-yyyy" value="${reqDate}" />
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
                                                                <tr>
                                                                    <td class="center" ><b>Reviewer</b></td>
                                                                    <td class="center">${reviewerName}</td>
                                                                    <td class="center"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${reviewerDate}" /></td>
                                                                    <td class="center">${reviewerRemarks}</td>
                                                                </tr>
<!--                                                                <tr>
                                                                    <td class="center" ><b>Store Reviewer</b></td>
                                                                    <td class="center">${approverName}</td>
                                                                    <td class="center"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${approverDate}" /></td>
                                                                    <td class="center">${approverRemarks}</td>
                                                                </tr>-->

                                                                <%--</c:forEach>--%> 
                                                            </tbody>
                                                        </table>
                                                        <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                                            <thead>
                                                                <tr class="headings">
                                                                    <th>Requisition Line No</th>
                                                                    <th>Item Sub Category</th>
                                                                    <th>Item Code</th>
                                                                    <th>Item Name</th>  
                                                                    <th>Item Desc</th>
                                                                    <th>Quantity</th>                                                    
                                                                    <!--<th>Unit Price</th>-->
                                                                    <!--<th>Total Price</th>-->  
                                                                    <th>Unit</th>
                                                                    <th>Status</th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>                                     
                                                                <c:forEach items="${purchReqList}" var="list">
                                                                    <tr>
                                                                        <td>${list.reqsno}</td>
                                                                        <td>${list.itemSubCategory}</td>
                                                                        <td>
                                                                            ${list.itemCode}
                                                                        </td>
                                                                        <td> ${list.itemName}</td>
                                                                        <td>${list.description}</td>
                                                                        <td style="text-align: right">${list.quantity}</td> 
                                                                        <!--<td>${list.unitPrice}</td>--> 
                                                                        <!--<td><fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.totalPrice}"/></td>--> 
                                                                        <td>${list.unit}</td>
                                                                        <td>${list.recordStatus}</td>

                                                                    </tr>

                                                                </c:forEach> 


                                                            </tbody>

                                                        </table>
                                                        <p>&nbsp;</p>

                                                        <div class="col-md-4 col-sm-12 col-xs-12">
                                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">

                                                                <!--<a href="../purchReq/purReqList.htm"><button type="button" class="btn btn-danger" style="" onclick="window.close();">Back</button></a>--> 

                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

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
//            $(document).ready(function () {
//                $('input.tableflat').iCheck({
//                    checkboxClass: 'icheckbox_flat-green',
//                    radioClass: 'iradio_flat-green'
//                });
//            });
//
//            var asInitVals = new Array();
//            $(document).ready(function () {
//                var oTable = $('#example').dataTable({
//                    "oLanguage": {
//                        "sSearch": "Search all columns:"
//                    },
//                    "aoColumnDefs": [
//                        {
//                            'bSortable': true,
//                            'aTargets': [0]
//                        } //disables sorting for column one
//                    ],
//                    'iDisplayLength': 10,
//                    "sPaginationType": "full_numbers",
//                    "dom": 'T<"clear">lfrtip',
//                    "tableTools": {
//                        "sSwfPath": "<?php echo base_url('assets2/js/Datatables/tools/swf/copy_csv_xls_pdf.swf'); ?>"
//                    }
//                });
//                $("tfoot input").keyup(function () {
//                    /* Filter on the column based on the index of this element's parent <th> */
//                    oTable.fnFilter(this.value, $("tfoot th").index($(this).parent()));
//                });
//                $("tfoot input").each(function (i) {
//                    asInitVals[i] = this.value;
//                });
//                $("tfoot input").focus(function () {
//                    if (this.className == "search_init") {
//                        this.className = "";
//                        this.value = "";
//                    }
//                });
//                $("tfoot input").blur(function (i) {
//                    if (this.value == "") {
//                        this.className = "search_init";
//                        this.value = asInitVals[$("tfoot input").index(this)];
//                    }
//                });
//            });
        </script>
        <script>
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


        </script>

        <script>
            NProgress.done();
        </script>
    </body>

</html>
