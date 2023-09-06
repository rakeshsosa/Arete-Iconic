<%-- 
    Document   : qualityInspectionAppList
    Created on : 22 Feb, 2018, 2:08:33 PM
    Author     : ebs05
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>arête Assets Management</title>
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
                                        <jsp:include page="../login/headerlink.htm?submodule=Quality Inspection&tab=Quality Inspection&pagetype=list"/>
                                        <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="x_panel">
                                                    <div class="x_title">
                                                        <h2>Quality Inspection List<small></small></h2>

                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="x_content">
                                                        <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                                            <thead>
                                                                <tr class="headings">
                                                                    <th>Receipt No</th>
                                                                    <th>Receipt Date</th>
                                                                    <!--<th>PO No</th>-->
                                                                    <th>Inspected By</th>
                                                                    <th>Supplier Name</th>
                                                                    <th>Status</th>


                                                                </tr>
                                                            </thead>

                                                            <tbody>


                                                                <%--<c:forEach items="${inspectlist}" var="list">
                                                                     
                                                                   

                                                                    <tr>
                                                                        <td class="center" style="width:10%;">${list[0]}</td>
                                                                        <td class="center" style="width:11%;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list[1]}"/></td>
                                                                        <td class="center" style="width:10%;">${list[2]}</td>
                                                                        <td class="center" style="width:14%;">${list[3]}</td>
                                                                        <td class="center" style="width:23%;">${list[4]}</td>

                                                                        <td class="center" style="width:13%;">
                                                                            <a class="myButton10" href="../inventory/inspectApprove.htm?poNo=${list[2]}&mrNo=${list[0]}&action=form">
                                                                                <i class="fa fa-check-circle-o"> Approve</i></a> 

                                                                        </td>
                                                                    </tr>
                                                                    
                                                                     
</c:forEach>--%>
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

                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <!-- Datatables -->
            <script src="../common/theme/js/datatables/js/jquery.dataTables.js"></script>

            <script>
//                            $(document).ready(function () {
//                                $('input.tableflat').iCheck({
//                                    checkboxClass: 'icheckbox_flat-green',
//                                    radioClass: 'iradio_flat-green'
//                                });
//                            });
//
//                            var asInitVals = new Array();
//                            $(document).ready(function () {
//                                var oTable = $('#example').dataTable({
//                                    "oLanguage": {
//                                        "sSearch": "Search all columns:"
//                                    },
//                                    "aoColumnDefs": [
//                                        {
//                                            'bSortable': false,
//                                            'aTargets': [0]
//                                        } //disables sorting for column one
//                                    ],
//                                    'iDisplayLength': 10,
//                                    "sPaginationType": "full_numbers",
//                                    "dom": 'T<"clear">lfrtip',
//                                    "tableTools": {
//                                        "sSwfPath": "<?php echo base_url('assets2/js/Datatables/tools/swf/copy_csv_xls_pdf.swf'); ?>"
//                                    }
//                                });
//                                $("tfoot input").keyup(function () {
//                                    /* Filter on the column based on the index of this element's parent <th> */
//                                    oTable.fnFilter(this.value, $("tfoot th").index($(this).parent()));
//                                });
//                                $("tfoot input").each(function (i) {
//                                    asInitVals[i] = this.value;
//                                });
//                                $("tfoot input").focus(function () {
//                                    if (this.className == "search_init") {
//                                        this.className = "";
//                                        this.value = "";
//                                    }
//                                });
//                                $("tfoot input").blur(function (i) {
//                                    if (this.value == "") {
//                                        this.className = "search_init";
//                                        this.value = asInitVals[$("tfoot input").index(this)];
//                                    }
//                                });
//                            });
                $(document).ready(function () {
                    $('#example').dataTable({
                        oLanguage: {
                            'sProcessing': "<p style='margin: -10px 0px 15px 20px;'>Loading data, please wait... <img width='20px'  height='20px' src='../common/theme/images/loading-gif.gif'></p>",
                        },
                        "sPaginationType": "full_numbers",
                        "iDisplayLength": 10,
                        "bProcessing": true,
                        "bServerSide": true,
                        "aaSorting": [[0, 'desc']],
                        "sAjaxSource": "../quality/paginationList.htm?listPage=inspectList",
                        "aoColumnDefs": [
                            {
                                "aTargets": [0],
                                "sWidth": "100px",
                                "mRender": function (data, type, full) {
                                    var a1 = "";
                                    if (full[0] != null) {
                                        a1 = full[0];
                                    }
                                    return "<div style='text-align: left'>" + a1 + '</div>';


                                }

                            },
                            {
                                "aTargets": [1],
                                "sWidth": "200px",
                                "mRender": function (data, type, full) {
                                    return "<div style='text-align: left'>" + moment(full[1]).format('DD-MMM-YYYY') + '</div>';
                                }

                            },
//                                        {
//                                            "aTargets": [2],
//                                            "sWidth": "200px",
//                                            "mRender": function (data, type, full) {
//
//                                                var a3 = "";
//                                                if (full[2] != null) {
//                                                    a3 = full[2];
//                                                }
//                                                return a3;
//
//                                                //return full[2];
//                                            }
//                                        },
                            {
                                "aTargets": [2],
                                "sWidth": "200px",
                                "mRender": function (data, type, full) {

                                    var a2 = "";
                                    if (full[3] != null) {
                                        a2 = full[3];
                                    }
                                    return "<div style='text-align: left'>" + a2 + '</div>';

                                }
                            },
                            {
                                "aTargets": [3],
                                "sWidth": "200px",
                                "mRender": function (data, type, full) {

                                    var a2 = "";
                                    if (full[4] != null) {
                                        a2 = full[4];
                                    }
                                    return "<div style='text-align: left'>" + a2 + '</div>';

                                }
                            },
                            {
                                "aTargets": [4],
                                "sWidth": "200px",
                                "mRender": function (data, type, full) {
                                    var action = "<div style='text-align: left'>";
                                    var a5 = "";
                                    if (full[0] != null) {
                                        a5 = full[0];
                                    }


                                    action = action + '\n\<a class="fa fa-check-circle-o fa-lg" title="Approve" href="../quality/qualityInspectionAppForm.htm?poNo=' + full[2] + '&mrNo=' + a5 + '&suppId=' + full[4] + '&action=form "> \n\
                                                                                   \n\
                                                                               </div>';
                                    return action;

//                            return '<input type="hidden" style="text-align:center;" value="' + a5 + '" id="xyz"><a class="myButton10" href="../storeRequest/storeRequestView.htm?stNo=' + a5 + '&action=view">\n\
//                                                        <i class="fa fa-search-plus"> View</i></a>\n\
//                                                                            <a class="myButton15" onclick="Generate(this);"> \n\
//                                                                                <i class="fa fa-print"> Print</i>    \n\
//                                                                            </a> ';
                                }

                            },
                        ],
                    });
                });
            </script>
        </div>
    </div>
</div>
</div>
</div>
</div>
<!-- /page content -->
</div>


</div>

<div id="custom_notifications" class="custom-notifications dsp_none">
    <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
    </ul>
    <div class="clearfix"></div>
    <div id="notif-group" class="tabbed_notifications"></div>
</div>
<script>
    NProgress.done();
</script>
</body>

</html>