<%-- 
    Document   : approvallevellist
    Created on : June 2, 2016, 2:47:25 PM
    Author     : Deepesh
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
        <link rel="shortcut icon" type="image/png" href="../common/theme/images/al-hasar.png" />
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
                                        <jsp:include page="../login/headerlink.htm?submodule=User Role&tab=Test&pagetype=list"/>




                                        <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="x_panel">
                                                    <div class="x_title">
                                                        <h2>Test List</h2>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="x_content">
                                                        <table id="example" class="table table-striped responsive-utilities jambo_table">
                                                            <thead>

                                                                <tr class="headings">
                                                                    <th>Test No</th>
                                                                    <th>Approval Level</th>
                                                                    <th>Approval Role</th>
                                                                    <th>Comments</th> 
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>


                                                                <c:forEach items="${levellist}" var="list">
                                                                    <c:if test="${list[5] ne 'Approved'}"> 
                                                                        <tr class="even pointer">

                                                                            <td class=" ">${list[1]}</td>
                                                                            <td class=" ">${list[2]}</td>
                                                                            <td class=" ">${list[3]}</td>
                                                                            <td class=" ">${list[4]}</td>

                                                                            <td class=" last"> 
        <!--                                                                        <a style="text-align: left;" class="fa fa-trash fa-lg" title="Inactive"  href="../login/levelDel.htm?sNo='${list[0]}'" onclick="return confrm();">
                                                   </a>-->
                                                                                <a href="../login/testform.htm?sNo='${list[0]}'&action=edit" class="fa fa-pencil fa-lg">Approve</a>&nbsp;
                                                                            </td>
                                                                        </tr>
                                                                    </c:if>
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
