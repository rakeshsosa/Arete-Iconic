<%-- 
    Document   : selectSupplier1
    Created on : 23 Oct, 2016, 1:27:14 PM
   Author     : Shweta S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            function test(val1, val2, val3, val4, val5) {
                window.opener.document.getElementById('supplierCode').value = val1;
                window.opener.document.getElementById('supplierName').value = val2;
                window.opener.document.getElementById('supplierAddress').value = val3;
                window.opener.document.getElementById('supplierContactNo').value = val4;
                window.opener.document.getElementById('supplierMailId').value = val5;
                window.close();
            }

        </script>

        <div class="clearfix"></div>

        <div class="row">

            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">

                    <div class="x_title">
                        <h2>Supplier List</h2>

                        <div class="clearfix">

                        </div>                       
                    </div>
                    <div class="x_content">
                        <form class="form-horizontal" id="contDetForm">                            
                            <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                <thead>
                                    <tr class="headings"> 
                                        <th>Supplier Code</th>
                                        <th>Supplier Name</th>                                       
                                        <th>Supplier Contact NO.</th>
                                        <th>Supplier Mail Id</th>
                                        <th>Priority</th>
                                        <th>Item Code</th>
                                        <!--                                        <th>Quantity</th>
                                                                                <th>Price</th>-->
                                        <!--                                        <th>Discount</th>
                                                                                <th>Total</th>-->
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach items="${suppList}" var="type">

                                        <tr onclick="test('${type[0]}', '${type[2]}', '${type[3]}', '${type[1]}', '${type[4]}');">
                                            <td class="center" style="text-align: left;width: 250px;">${type[0]}</td>
                                            <td class="center" style="text-align: left;width: 250px;">${type[2]}</td>                                           
                                            <td class="center" style="text-align: left;width: 250px;">${type[1]}</td>
                                            <td class="center" style="text-align: left;width: 250px;">${type[4]}</td>
                                            <td class="center" style="text-align: left;width: 250px;">${type[6]}</td>
                                            <td class="center" style="text-align: left;width: 250px;">${type[7]}</td>
 <!--                                           <td class="center" style="text-align: left;width: 250px;"><fmt:formatNumber type="number" maxFractionDigits="5" groupingUsed="false" value="${type[8]}" /></td>
                                            <td class="center" style="text-align: left;width: 250px;"><fmt:formatNumber type="number" maxFractionDigits="5" groupingUsed="false" value="${type[9]}" /></td>-->
 <!--                                           <td class="center" style="text-align: left;width: 250px;">${type[10]}</td>
                                            <td class="center" style="text-align: left;width: 250px;"><fmt:formatNumber type="number" maxFractionDigits="5" groupingUsed="false" value="${type[11]}" /></td>-->
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
                                                    "aaSorting": [],
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

