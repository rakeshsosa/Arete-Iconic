<%-- 
    Document   : insurancePropPopUp
    Created on : 9 Apr, 2019, 1:03:16 PM
    Author     : Pavitra
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

        <title>Arête Property Management</title>
         <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">

        <!-- Bootstrap core CSS -->

        <link href="../common/theme/css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">

        <link href="../common/theme/css/bootstrap.min.css" rel="stylesheet">
        <link href="../common/theme/css/popupcustom.css" rel="stylesheet">
        <script src="../common/theme/js/jquery.min.js"></script>
        <script src="../common/theme/js/nprogress.js"></script>        
        <script src="../common/theme/js/bootstrap.min.js"></script>       

        <!-- icheck -->
        <script src="../common/theme/js/icheck/icheck.min.js"></script>
    </head>

    <body>

        <script>
            // Function to get values into pop up
            function test(val1, val2, val3, val4,val5) {

                //window.opener.document.getElementById('assetCode').value = val1;
                window.opener.document.getElementById('propertyName').value = val2;
                //window.opener.document.getElementById('subAssetCode').value = val3;
                window.opener.document.getElementById('flatName').value = val4;
                window.opener.document.getElementById('floorName').value = val5;
                window.close();
            }

        </script>

        <div class="clearfix"></div>

        <div class="row">

            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">

                    <div class="x_title">
                        <h2>Property Master</h2>

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
                                        <th>Flat Code</th>
                                        <th>Flat Name</th>
                                        <th>Floor Name</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach items="${subAsset}" var="type">
                                        <tr onclick="test('${type.assetCode}', '${type.assetName}', '${type.subAssetCode}', '${type.subAssetName}', '${type.floor}');">
                                            <td class="center"style="text-align: left;width: 250px;" >${type.assetCode}</td>
                                            <td class="center"style="text-align: left;width: 250px;" >${type.assetName}</td>
                                            <td class="center"style="text-align: left;width: 250px;" >${type.subAssetCode}</td>
                                            <td class="center"style="text-align: left;width: 250px;" >${type.subAssetName}</td>
                                            <td class="center"style="text-align: left;width: 250px;" >${type.floor}</td>
                                        </tr>
                                    </c:forEach>

                                </tbody>

                            </table>
                        </form>
                    </div>
                </div>
            </div>

        </div>



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

