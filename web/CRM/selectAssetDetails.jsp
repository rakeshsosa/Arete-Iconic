<%-- 
    Document   : selectServiceSales
    Created on : 20 Jun, 2016, 1:21:08 PM
    Author     : ebs-sdd05
--%>

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
            function test(val1, val2, val3, val4, val5, val6, val7, val8, val9, val10) {
                window.opener.document.getElementById('assetCode').value = val1;
                window.opener.document.getElementById('assetName').value = val2;
                window.opener.document.getElementById('buildingNo').value = val3;
                window.opener.document.getElementById('assetArea').value = val4;
                window.opener.document.getElementById('blockNo').value = val5;
                window.opener.document.getElementById('plotNo').value = val6;
                window.opener.document.getElementById('wayNo').value = val7;
                window.opener.document.getElementById('streetNo').value = val8;
                window.opener.document.getElementById('assetPostalCode').value = val9;
                window.opener.document.getElementById('assetPostboxNo').value = val10;

                window.opener.document.getElementById('subClassifiedAssetName').value = "";
                window.opener.document.getElementById('waterBillno').value = "";
                window.opener.document.getElementById('electricityBillno').value = "";
                window.close();
            }

        </script>

        <div class="clearfix"></div>

        <div class="row">

            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <input type="hidden" value="${rowid}" id="rowid">
                    <div class="x_title">
                        <h2>Property Details List</h2>

                        <div class="clearfix">

                        </div>                       
                    </div>
                    <div class="x_content">
                        <form class="form-horizontal" id="contDetForm">                            
                            <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                <thead>
                                    <tr class="headings">                                                   
                                        <th>Property Code</th>       
                                        <th>Property Name</th>
                                        <th>Building</th>
                                        <th>Property Area</th>
                                        <th>Block No</th>
                                        <th>Plot No</th>
                                        <th>Way</th>

                                        <th>Street No</th>
                                        <th>Postal Code</th>
                                        <th>Post Box No</th>
                                    </tr>
                                </thead>

                                <tbody>                                   

                                    <c:forEach items="${selectAssetDetails}" var="type">

                                        <tr onclick="test('${type.assetCode}', '${type.assetName}', '${type.assetBuilding}', '${type.assetArea}', '${type.blockNo}', '${type.assetPlotNo}', '${type.way}', '${type.streetNo}', '${type.pinCode}', '${type.poBox}');">                                            
                                            <td class="center" style="text-align: left;text-transform: capitalize;">${type.assetCode}</td>
                                            <td class="center" style="text-align: left;text-transform: capitalize;">${type.assetName}</td>
                                            <td class="center" style="text-align: left;text-transform: capitalize;">${type.assetBuilding}</td>
                                            <td class="center" style="text-align: left;text-transform: capitalize;">${type.assetArea}</td>
                                            <td class="center" style="text-align: left;text-transform: capitalize;">${type.blockNo}</td>
                                            <td class="center" style="text-align: left;text-transform: capitalize;">${type.assetPlotNo}</td> 
                                            <td class="center" style="text-align: left;text-transform: capitalize;">${type.way}</td>

                                            <td class="center" style="text-align: left;text-transform: capitalize;">${type.streetNo}</td> 
                                            <td class="center" style="text-align: left;text-transform: capitalize;">${type.pinCode}</td> 
                                            <td class="center" style="text-align: left;text-transform: capitalize;">${type.poBox}</td> 
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
            NProgress.done();
        </script>
    </body>

</html>
