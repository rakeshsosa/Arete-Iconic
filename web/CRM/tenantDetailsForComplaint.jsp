<%-- 
    Document   : tenantDetailsForComplaint
    Created on : 3 Oct, 2016, 11:10:15 AM
    Author     : ebs-sdd27
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




        <div class="clearfix"></div>

        <div class="row">

            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">

                    <div class="x_title">
                        <h2>Tenant </h2> 
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
                                        <th>Property Name</th>
                                        <th>Flat Name / Flat No.</th>

                                    </tr>
                                </thead>

                                <tbody>

                                    <c:forEach items="${tenantDetailsForComplaint}" var="type">
                                        <c:forEach items="${assetDetails}" var="asset">
                                            <c:if test="${asset.assetCode eq type.assetName}">
                                                <c:set var="assetName1" value="${asset.assetName}"/>

                                            </c:if> 
                                        </c:forEach>
                                        <c:forEach items="${subAssetDetails}" var="asset1">
                                            <c:if test="${asset1.subAssetCode eq type.subclassifiedAstno}">
                                                <c:set var="subAssetName1" value="${asset1.subAssetName}"/>

                                            </c:if> 
                                        </c:forEach>

                                        <tr onclick="window.opener.document.getElementById('tenantName').value = '${type.tenantFname}';

                                                window.opener.document.getElementById('propertyName').value = '${type.assetName}';
                                                window.opener.document.getElementById('propertyNo').value = '${type.subclassifiedAstno}';
                                                window.opener.document.getElementById('assetName1').value = '${assetName1}';
                                                window.opener.document.getElementById('subAssetName1').value = '${subAssetName1}';



                                                window.close();">

                                            <td class="center" style="text-align: left;text-transform: capitalize;">${type.tenantCode}</td>
                                            <td class="center" style="text-align: left;text-transform: capitalize;">${type.tenantFname}</td>
                                            <td class="center" style="text-align: left;text-transform: capitalize;">${assetName1}</td>
                                            <td class="center" style="text-align: left;text-transform: capitalize;">${subAssetName1}</td>



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
                                                            'bSortable': false,
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

