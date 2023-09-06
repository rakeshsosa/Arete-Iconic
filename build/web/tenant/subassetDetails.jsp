<%-- 
    Document   : assetDetails
    Created on : 8 Sep, 2017, 3:59:17 PM
    Author     : ebs05
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
            function test(val1, val2, val3, val4, val5, val6, val7, val8, val9, val10, val11, val12, val13, val14) {
                window.opener.document.getElementById('assetName').value = val1;
                window.opener.document.getElementById('subclassifiedAstno').value = val2;
                window.opener.document.getElementById('buildingNo').value = val3;
                window.opener.document.getElementById('wayNo').value = val4;
                window.opener.document.getElementById('assetArea').value = val5;
                window.opener.document.getElementById('blockNo').value = val6;
                window.opener.document.getElementById('plotNo').value = val7;
                window.opener.document.getElementById('streetNo').value = val8;
                window.opener.document.getElementById('assetPostalCode').value = val9;
                window.opener.document.getElementById('assetPostboxNo').value = val10;
                window.opener.document.getElementById('waterBillno').value = val11;
                window.opener.document.getElementById('electricityBillno').value = val12;
                window.opener.document.getElementById('minimumRentFixed').value = val13;
                window.opener.document.getElementById('actualRent').value = val14;

                window.close();

            }

        </script>

        <div class="clearfix"></div>

        <div class="row">

            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <input type="hidden" value="${rowid}" id="rowid">
                    <div class="x_title">
                        <h2>Flat Details List</h2>

                        <div class="clearfix">

                        </div>                       
                    </div>
                    <div class="x_content">
                        <form class="form-horizontal" id="contDetForm">                            
                            <table id="example" class="table table-striped responsive-utilities jambo_table">
                                <thead>

                                    <tr class="headings">
                                        <th>Property Name</th>                                       
                                        <th>Flat Name / Flat_No</th>
                                        <th>Building No</th>
                                        <th>Way</th>
                                        <th>Area</th>                                       
                                        <th>Block No</th>
                                        <th>Plot No</th>
                                        <th>Street No</th>
                                        <th>Postal Code</th>
                                        <th>Post Box No</th>
                                        <th>Utility No.1</th>
                                        <th>Utility No.2</th>  
                                        <th>Status</th>
                                        </th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach items="${subassetDetails}" var="list">
                                        <tr onclick="test('${list[0]}', '${list[1]}', '${list[2]}', '${list[3]}', '${list[4]}', '${list[5]}', '${list[6]}', '${list[7]}', '${list[8]}', '${list[9]}', '${list[10]}', '${list[11]}', '${list[12]}', '${list[13]}');">                                                                   
                                            <td class=" "style="text-align: left;">${list[0]}</td>
                                            <td class=" "style="text-align: left;">${list[1]}</td>
                                            <td class=" "style="text-align: left;">${list[2]}</td>
                                            <td class=" "style="text-align: left;">${list[3]}</td>
                                            <td class=" "style="text-align: left;">${list[4]}</td>
                                            <td class=" "style="text-align: left;">${list[5]}</td>
                                            <td class=" "style="text-align: left;">${list[6]}</td>
                                            <td class=" "style="text-align: left;">${list[7]}</td>
                                            <td class=" "style="text-align: left;">${list[8]}</td>
                                            <td class=" "style="text-align: left;">${list[9]}</td>
                                            <td class=" "style="text-align: left;">${list[10]}</td>
                                            <td class=" "style="text-align: left;">${list[11]}</td>
                                            <td class=" "style="text-align: left;">${list[14]}</td>

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

