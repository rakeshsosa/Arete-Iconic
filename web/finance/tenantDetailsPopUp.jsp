<%-- 
    Document   : tenantDetailsPopUp
    Created on : 23 Apr, 2019, 8:19:06 PM
    Author     : Lakshmi
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link href="../common/theme/css/disableSelection.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>arête Assets Management</title>

        <!-- Bootstrap core CSS -->

        <link href="../common/theme/css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">

        <link href="../common/theme/css/bootstrap.min.css" rel="stylesheet">
        <link href="../common/theme/css/popupcustom.css" rel="stylesheet">
        <script src="../common/theme/js/jquery.min.js"></script>
        <script src="../common/theme/js/nprogress.js"></script>        
        <script src="../common/theme/js/bootstrap.min.js"></script>       

        <!-- icheck -->
        <script src="../common/theme/js/icheck/icheck.min.js"></script>

        <!--[if lt IE 9]>
            <script src="../assets/js/ie8-responsive-file-warning.js"></script>
            <![endif]-->

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
              <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->
    </head>


    <body>


        <script>
            function test(val1, val2, val3, val4, val5, val6, val7, val8, val9, val10, val11, val12, val13, val14,val15) {
                window.opener.document.getElementById('tenantCode').value = val1;
                window.opener.document.getElementById('tenantName').value = val2
                window.opener.document.getElementById('assetNames').value = val3;
//                 window.opener.document.getElementById('assetNames').value = val4;
                window.opener.document.getElementById('buildingNo').value = val5;
                window.opener.document.getElementById('blockNo').value = val6;
                window.opener.document.getElementById('streetNo').value = val7;
                window.opener.document.getElementById('plotNo').value = val8;
                window.opener.document.getElementById('rentAmount').value = val9;
                window.opener.document.getElementById('billingCycle').value = val10;
                window.opener.document.getElementById('subassetCode').value = val11;
                window.opener.document.getElementById('flotNo').value = val12;
                window.opener.document.getElementById('assetCode').value = val13;
                window.opener.document.getElementById('tenantCategory').value = val14;
                window.opener.document.getElementById('tenantId').value = val15;
                window.close();
            }

        </script>

        <div class="clearfix"></div>

        <div class="row">

            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <input type="hidden" value="${rowid}" id="rowid">
                    <div class="x_title">
                        <h2>Tenant Details List</h2>

                        <div class="clearfix">

                        </div>                       
                    </div>
                    <div class="x_content">
                        <form class="form-horizontal" id="contDetForm">                            
                            <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                <thead>
                                    <tr class="headings">                                                   
                                        <th>Tenant Code</th>       
                                        <th>Tenant Name</th>
                                        <th>Tenant ID</th>
                                        <th>Property Name</th>
                                        <th>Flat Name</th>
                                        <th>Building No</th>
                                        <th>Block No</th>
                                        <th>Street No</th>
                                        <th>Plot No</th>
                                        <th>Rent Amount</th>
                                        <th>Tenant Category</th>
                                        <th>Billing Cycle</th>                                        
                                    </tr>
                                </thead>

                                <tbody>                                   

                                    <c:forEach items="${selectTenant}" var="type">

                                        <tr onclick="test('${type.tenantCode}', '${type.tenantFname} ${type.tenantLname}', '${type.assetNames}','${type.flatNo}', '${type.buildingNo}', '${type.blockNo}', '${type.streetNo}', '${type.plotNo}', '${type.totalAmount}', '${type.billingCycle}', '${type.subclassifiedAstno}', '${type.flatNo}', '${type.assetName}','${type.tenantCategory}','${type.tenantId}');">                                            
                                            <td class="center" style="text-align: left;">${type.tenantCode}</td>
                                            <td class="center" style="text-align: left;">${type.tenantFname} ${type.tenantLname}</td>
                                            <td class="center" style="text-align: left;">${type.tenantId}</td>
                                            <td class="center" style="text-align: left;">${type.assetNames}</td>
                                                  <td class="center" style="text-align: right;">${type.flatNo}</td> 
                                            <td class="center" style="text-align: left;">${type.buildingNo}</td>
                                            <td class="center" style="text-align: left;">${type.blockNo}</td>
                                            <td class="center" style="text-align: left;">${type.streetNo}</td> 
                                            <td class="center" style="text-align: left;">${type.plotNo}</td> 
                                            <td class="center" style="text-align: right;">${type.totalAmount}</td> 
                                            <td class="center" style="text-align: right;">${type.tenantCategory}</td>
                                            <td class="center" style="text-align: right;">${type.billingCycle}</td>
                                            
                                        </tr>
                                    </c:forEach>

                                </tbody>

                            </table>
                        </form>
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
            NProgress.done();
        </script>
    </body>

</html>
