<%-- 
    Document   : supplierEnqView
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

                                                        
                                    <jsp:include page="../login/headerlink.htm?submodule=Supplier Enquiries&tab=Supplier Enquiries&pagetype=form"/>
                                     <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="x_title"> 
                                           
                                            
                                      <div  style="text-align: center;text-transform:uppercase;">  <h3 style="font-size:21px;">Enquiry for Quotation</h3></div>
                                       
                                        <!--<h2>Item List</h2>-->
                                        <div class="clearfix"></div>
 </div>
                                        
                                    <div class="x_content">
                                        <c:forEach items="${supplierEnqList}" var="type">
                                            <c:set var="ReqNo" value="${type.prNo}"/>
                                            <c:set var="reqDate" value="${type.prDate}"/>
                                            <c:set var="prCode" value="${type.projectCode}"/>
                                            <c:set var="enquiriesNo" value="${type.enquiriesNo}"/>
                                            <c:set var="enquiriesDate" value="${type.enquiriesDate}"/>
                                        </c:forEach>


                                        <div class="col-md-4 col-sm-12 col-xs-12 ">
                                            <div class="control-group"><strong>Requisition No: ${ReqNo}</strong></div>
                                            <input name="ReqNo" id="ReqNo" value="${ReqNo}" type="hidden">
                                            <div class="control-group"><strong>Requisition Date: <fmt:formatDate pattern="dd-MMM-yyyy" value="${reqDate}" /></strong>
                                                <input name="reqDate" type="hidden" value="<fmt:formatDate pattern="dd-MMM-yyyy hh:mma" value="${reqDate}"/>" tabindex="-1"/>
                                                <input class="input-xlarge"id="" name="ReqDateNo" readonly="" type="hidden" value="<%= (new SimpleDateFormat("dd-MMM-yyyy hh:mma")).format(new java.util.Date())%>">
                                            </div>
                                        </div>
                                        <div class="col-md-offset-6">
                                            <div class="control-group"><strong>Enquiry No: ${enquiriesNo}</strong></div>
                                            <div class="control-group"><strong>Enquiry Date:  <fmt:formatDate pattern="dd-MMM-yyyy" value="${enquiriesDate}" /></strong> </div>
                                        </div>

                                        <p>&nbsp;</p> 
                                        <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                            <thead>
                                                <tr class="headings">
                                                    <th>Item Name</th>
                                                    <th>Item Description</th>
                                                    <th>Quantity</th>                                           
                                                    <th>Delivery Location</th> 
                                                    <th>Supplier E-mail Id</th> 
                                                </tr>
                                            </thead>

                                            <tbody>                                     
                                                <c:forEach items="${supplierEnqList}" var="list">
                                                    <tr>
                                                        <td> ${list.itemName}</td>  
                                                        <td>${list.description}</td>  
                                                        <td style="text-align: right">${list.quantity}</td>                                            
                                                        <td>${list.deliveryLocation}</td>
                                                        <td>${list.supplierMailId}</td> 
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

                                        <div class="clearfix"></div>



                                    </div>
                                </div>
                            </div>
                        </form>

</div></div></div></div>
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
                    'iDisplayLength': 10,
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


        </script>

        <script>
            NProgress.done();
        </script>
    </body>

</html>
