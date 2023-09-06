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
        <link href="../common/theme/fonts/css/font-awesome.min.css" rel="stylesheet">
        <link href="../common/theme/css/bootstrap.min.css" rel="stylesheet">
        <link href="../common/theme/css/popupcustom.css" rel="stylesheet">
        <script src="../common/theme/js/jquery.min.js"></script>
        <script src="../common/theme/js/nprogress.js"></script>        
        <script src="../common/theme/js/bootstrap.min.js"></script>       

        <!-- icheck -->
        <script src="../common/theme/js/icheck/icheck.min.js"></script>
        <script type="text/javascript" src="../common/datepicker/datetimereq_css.js"></script>

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


                <!-- top navigation -->

                <!-- /top navigation -->

                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">

                        <div class="clearfix"></div>

                        <div class="row">

                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <ul class="nav nav-tabs">                                        
                                        <li><a  href="../purchReq/purReqList.htm"><span style="color:black;font-family:verdana;font-size:14px;font-weight:700;">New Requisition</span></a></li>
                                        <li><a href="../purchReq/reviewList.htm"><span style="color:black;font-family:verdana;font-size:14px;font-weight:700;">Need Review</span></a></li>
                                        <li><a href="../purchReq/storeRevList.htm"><span style="color:black;font-family:verdana;font-size:14px;font-weight:700;">Store Review</span></a></li>
                                        <li class="active"><a href="../purchReq/appreovedReqList.htm"><span style="color:black;font-family:verdana;font-size:14px;font-weight:700;">Approved Requisition</span></a></li>
                                    </ul>
                                    <BR/>

                                    <div class="x_title">                       
                                        <div  style="text-align: center;text-transform:uppercase;"><h3>Approved Requisition</h3></div>
                                        <h2>Item List</h2>
                                        <div class="clearfix">

                                        </div>                       
                                    </div>
                                    <div class="x_content">
                                        <c:forEach items="${purchReqList}" var="type">
                                            <c:set var="ReqNo" value="${type.prNo}"/>
                                            <c:set var="reqDate" value="${type.prDate}"/>
                                            <c:set var="prCode" value="${type.projectCode}"/>
                                            <c:set var="userId" value="${type.userId}"/>
                                            <c:set var="deliveryLocation" value="${type.deliveryLocation}"/>
                                            <c:set var="reviewerName" value="${type.reviewerName}"/>
                                            <c:set var="reviewerDate" value="${type.reviewerDate}"/>
                                            <c:set var="reviewerRemarks" value="${type.reviewerRemarks}"/>
                                            <c:set var="approverName" value="${type.approverName}"/>
                                            <c:set var="approverDate" value="${type.approverDate}"/>
                                            <c:set var="approverRemarks" value="${type.approverRemarks}"/>
                                            <c:set var="requiredDate" value="${type.requiredDate}"/>
                                            <c:set var="priority" value="${type.priority}"/>
                                            <c:set var="remarks" value="${type.remarks}"/>                                          
                                            <c:set var="lastmodifiedDate" value="${type.lastmodifiedDate}"/>
                                        </c:forEach>
                                        <form class="form-horizontal" id="reqQuotation" method="post" enctype="multipart/form-data">

                                            <div class="col-md-4 col-sm-12 col-xs-12 ">
                                                <div><strong><label style="padding-right: 10px;">Requisition No:</label></strong> <div id="dynamicdiv" style="display: inline">${ReqNo}</div>
                                                    <input name="ReqNo" id="ReqNo" value="${ReqNo}" type="hidden">

                                                </div>

                                                <div>  <strong><label style="padding-right: 10px;">Requisition Date:</label></strong> <fmt:formatDate pattern="dd-MMM-yyyy" value="${reqDate}" />
                                                    <input name="reqDate" type="hidden" value="<fmt:formatDate pattern="dd-MMM-yyyy hh:mma" value="${reqDate}"/>" tabindex="-1"/>
                                                    <input class="input-xlarge"id="" name="ReqDateNo" readonly="" type="hidden" value="<%= (new SimpleDateFormat("dd-MMM-yyyy hh:mma")).format(new java.util.Date())%>">
                                                </div>
                                                <div> <strong><label style="padding-right: 10px;">Project Code:</label></strong> ${prCode}</div>
                                            </div> 
                                            <!--                            <div class="col-md-4 text-right">
                                                                            <div><label style="padding-right: 10px;">Requested By: </label> ${userId}</div>
                                            <c:if test="${reviewerName ne ''}">
                                                <div><label style="padding-right: 10px;">Reviewed By: </label> ${reviewerName}</div> 
                                            </c:if>
                                            <div><label style="padding-right: 10px;">Approved By: </label> ${approverName}</div> 
                                        </div>-->
                                            <p>&nbsp;</p> <p>&nbsp;</p>  <p>&nbsp;</p>
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group"> 

                                                <label class="control-label" ><a >*</a>To Be Delivered At</label>
                                                <input name="requiredAtLoc" class="form-control" value="${deliveryLocation}" id="requiredAtLoc" type="text" readonly>

                                            </div>
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group"> 
                                                <label class="control-label" for="selectError"><a >*</a>Required Before</label>

                                                <input type="text" name="requiredByDate" class="form-control"  readonly   value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${requiredDate}"/>">

                                            </div>
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group"> 
                                                <label class="control-label" for="selectError">* Priority</label>

                                                <input type="text" class="form-control"  readonly   value="${priority}">

                                            </div>

                                            <p>&nbsp;</p>
                                            <div class="x_title">                       
                                                <div  style="text-align: center;text-transform:uppercase;"><h3>Approver Details</h3></div>

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
                                                    <tr>
                                                        <td class="center" ><b>Store Reviewer</b></td>
                                                        <td class="center">${approverName}</td>
                                                        <td class="center"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${approverDate}" /></td>
                                                        <td class="center">${approverRemarks}</td>
                                                    </tr>


                                                    <%--</c:forEach>--%> 
                                                </tbody>
                                            </table>


                                            <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                                <thead>
                                                    <tr class="headings"> 
                                                        <th style="width: 1%"></th>                                      
                                                        <th>Item Code</th>
                                                        <th>Item Name</th>
                                                        <th>Item Description</th>
                                                        <th>Quantity</th>
                                                        <th>Unit</th>
                                                        <th>Unit Price</th>
                                                        <th>Total Price</th>
                                                        <!--<th>Required Before</th>-->
                                                        <!--<th>To be Delivered At</th>-->
                                                        <!--<th>Priority</th>-->                                            
                                                        <!--<th class=" no-link last"><span class="nobr"> Remarks(Reviewer)</span>-->
                                                        <!--<th>Remarks(Store)</th>-->

                                                    </tr>
                                                </thead>

                                                <tbody>                                     
                                                    <c:forEach items="${purchReqList}" var="list">
                                                        <tr>
                                                            <td><input type="checkbox" id="chk1" name="selectedvalues" value="${list.SNo}"/></td>
                                                            <td>                                                
                                                                ${list.itemCode}
                                                            </td>
                                                            <td> ${list.itemName}</td>  
                                                            <td>${list.description}</td>  
                                                            <td>${list.quantity}</td>  
                                                            <td> ${list.unit}</td> 
                                                            <td>${list.unitPrice}</td> 
                                                            <td>${list.totalPrice} </td> 
                                                            <!--<td><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.requiredDate}"/></td>--> 
                                                            <!--<td>${list.deliveryLocation}</td>--> 
                                                            <!--<td>${list.priority}</td>--> 
                                                            <!--<td>${list.reviewerRemarks}</td>-->      
                                                            <!--<td>${list.approverRemarks}</td>-->
                                                        </tr>

                                                    </c:forEach> 


                                                </tbody>

                                            </table>
                                            <p>&nbsp;</p>

                                            <div class="col-md-4 col-sm-12 col-xs-12">



                                                <!--<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">-->
                                                <!--
                                                                                        <button type="submit" class="btn btn-primary" style="" onclick="if (confirm('Do you really want to Save this record')) {
                                                                                                    return true;
                                                                                                } else {
                                                                                                    return false;
                                                                                                }"><i class="fa fa-floppy-o" style="font-size: 15px"></i> SAVE</button>-->

                                                <input class="btn btn-success" value="Add To Enquiry" onclick="selectedvalue('Enquiry Required');" type="button" >                                        
                                                <input class="btn btn-success" value="Create PO" onclick="selectedvalue('Create PO');" type="button" >
                                                <a href="../purchReq/appreovedReqList.htm"><button type="button" class="btn btn-danger" style="" >CANCEL</button></a> 
                                            </div>

                                            <!--</div>-->
                                            <!--</div>-->
                                        </form>
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
                                                    $(document).ready(function () {
                                                        $('input.tableflat').iCheck({
                                                            checkboxClass: 'icheckbox_flat-green',
                                                            radioClass: 'iradio_flat-green'
                                                        });
                                                    });

                                                    var asInitVals = new Array();
                                                    $(document).ready(function () {
                                                        var oTable = $('#example').dataTable({
                                                            "oLanguage": {
                                                                "sSearch": "Search all columns:"
                                                            },
                                                            "aoColumnDefs": [
                                                                {
                                                                    'bSortable': true,
                                                                    'aTargets': [0]
                                                                } //disables sorting for column one
                                                            ],
                                                            'iDisplayLength': 12,
                                                            "sPaginationType": "full_numbers",
                                                            "dom": 'T<"clear">lfrtip',
                                                            "tableTools": {
                                                                "sSwfPath": "<?php echo base_url('assets2/js/Datatables/tools/swf/copy_csv_xls_pdf.swf'); ?>"
                                                            }
                                                        });
                                                        $("tfoot input").keyup(function () {
                                                            /* Filter on the column based on the index of this element's parent <th> */
                                                            oTable.fnFilter(this.value, $("tfoot th").index($(this).parent()));
                                                        });
                                                        $("tfoot input").each(function (i) {
                                                            asInitVals[i] = this.value;
                                                        });
                                                        $("tfoot input").focus(function () {
                                                            if (this.className == "search_init") {
                                                                this.className = "";
                                                                this.value = "";
                                                            }
                                                        });
                                                        $("tfoot input").blur(function (i) {
                                                            if (this.value == "") {
                                                                this.className = "search_init";
                                                                this.value = asInitVals[$("tfoot input").index(this)];
                                                            }
                                                        });
                                                    });
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
            function openWindow(val) {
                alert("Item not Available..!!");
                //                myWindow = window.open("../Globalrequisition/inventory.htm?item=" + encodeURIComponent(val) + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }

            function selectedvalue(val)
            {
                var x = $('#chk1:checked').length;

                if (parseInt(x) != 0)
                {
                    $('#reqQuotation').attr('action', "../purchReq/reqQuotApp.htm?status=" + val + "");
                    $('#reqQuotation').submit();

                } else {
                    alert("Please Select item..!!");
                }


            }


        </script>

        <script>
            NProgress.done();
        </script>
    </body>

</html>
