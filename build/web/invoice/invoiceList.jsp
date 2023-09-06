<%-- 
    Document   : invoiceList
    Created on : 16 Feb, 2018, 3:36:49 PM
    Author     : ebs05
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
        <script>
            function Generate($this)
            {
                var format = "PDF";
                var $itemRow = $($this).closest('tr');
                var dcnNo = $itemRow.find('#ABC').val();
                if (format != "null" && format != "")
                {
                    if (format == "PDF") {
                        var url = '../reports/areteReportData.htm?format=' + format + '&reportid=' + 'invoicePrint '+ '&dcnNo1=' + dcnNo + '';
                        window.open(url, '_blank');
                        window.focus();
                    }

                }
            }

        </script>
    </head>


    <body class="nav-md">

        <div class="container body">


            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>

                <div class="right_col" role="main">

                    <br />
                    <div class="">

                        <div class="row top_tiles">

                            <div class="">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="x_panel">
                                        <jsp:include page="../login/headerlink.htm?submodule=GRN&tab=Invoice Screen&pagetype=list"/>

                                        <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="x_panel">
                                                    <div class="x_title">
                                                        <h2>Invoice List<small></small></h2>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="x_content">
                                                        <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                                            <thead>
                                                                <tr class="headings">

                                                                    <th>Invoice Ref No</th>
                                                                    <th>PO No</th>
                                                                    <th>Supplier Code</th>

                                                                    <th>GRN No</th>
                                                                    <th>Document Type</th>
                                                                    <th>Document Date</th>
                                                                    <th>Action</th>
                                                                    <!--                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                                                                                        </th>-->
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                <c:forEach items="${invDetails}" var="type">
                                                                    <tr>
                                                                        <td class="center">${type[0]}
                                                                            <input id="ABC" value="${type[0]}" type="hidden">
                                                                        </td>
                                                                        <td class="center">${type[1]}</td>
                                                                        <td class="center">${type[2]}</td>
                                                                        <td class="center">${type[3]}</td>
                                                                        <td class="center">${type[4]}</td>
                                                                        <fmt:parseDate value="${type[5]}" var="parsedEmpDate" pattern="yyyy-MM-dd" />
                                                                        <td class="center"><fmt:formatDate pattern="dd-MMM-yyyy" value="${parsedEmpDate}"/></td>
                                                                        <td class="center">
                                                                            <a href="../invoice/invoiceview.htm?invrefno=${type[0]}&action=view" class="myButton"><i class="fa fa-search-plus">View</i></a>&nbsp;
                                                                            <a href="#" class="myButton15" onclick="Generate(this)"><i class="fa fa-print">Print</i></a>&nbsp;
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>

                                                        </table>
                                                    </div>
                                                </div>
                                            </div>

                                            <br />
                                            <br />
                                            <br />

                                        </div>
                                    </div>


                                </div>
                                <!-- /page content -->
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


                    </div>

                </div>
            </div>

        </div>


        <div id="custom_notifications" class="custom-notifications dsp_none">
            <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
            </ul>
            <div class="clearfix"></div>
            <div id="notif-group" class="tabbed_notifications"></div>
        </div>
        <script>             NProgress.done();
        </script>
    </body>

</html>
