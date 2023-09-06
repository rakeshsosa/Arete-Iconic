<%-- 
    Document   : assetCategoryList
    Created on : 29 Sep, 2016, 2:19:10 PM
    Author     : Garun Mishra
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
                                        <jsp:include page="../login/headerlink.htm?submodule=Asset Details&tab=Asset Category&pagetype=list"/>
                                        <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="x_panel">
                                                    <div class="x_title">
                                                        <h2>Assets Category List</h2>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="x_content">
                                                        <table id="example" class="table table-striped responsive-utilities jambo_table">
                                                            <thead>

                                                                <tr class="headings">                                                                   
                                                                    <th>Asset Category ID</th>  
                                                                    <th>Asset Category Type</th>  
                                                                    <th>Asset Category Description</th>    
                                                                    <th class="no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                <c:forEach items="${assetCategorylist}" var="list">

                                                                    <tr class="even pointer">                                                                    
                                                                        <td class="" style="text-align: left;text-transform: capitalize;" >${list.assetCategoryId}</td>
                                                                        <td class="" style="text-align: left;text-transform: capitalize;">${list.assetCategoryName}</td>                                                                   
                                                                        <td class="" style="text-align: left;text-transform: capitalize;">${list.assetCategoryDescription}</td>                                                                    
                                                                        <td class="" style="text-align: center;">
                                                                            <a href="../assetsm/assetCategoryForm.htm?pk=${list.SNo}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;
                                                                            <a href="../assetsm/assetCategoryForm.htm?pk=${list.SNo}&action=edit" class="fa fa-pencil fa-lg"title="Edit"></a>&nbsp;
                                                                            <a class="fa fa-trash fa-lg" title="Inactive"  href="../assetsm/assetCatDel.htm?pk=${list.SNo}"onclick="if (confirm('Do you really want to Inactive this record?')) {
                                                                                        return true;
                                                                                    } else {
                                                                                        return false;
                                                                                    }">
                                                                                                                         
                                                                            </a>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>

                                                            </tbody>

                                                        </table>
                                                    </div>
                                                </div>
                                            </div>

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
                                                                                                'bSortable': false,
                                                                                                'aTargets': [3]
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
