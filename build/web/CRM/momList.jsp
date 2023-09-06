<%-- 
    Document   : MOMList
    Created on : 24 May, 2016, 3:33:03 PM
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
                                        <jsp:include page="../login/headerlink.htm?submodule=Minutes Of Meeting&tab=Minutes Of Meeting&pagetype=list"/>




                                        <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="x_panel">
                                                    <div class="x_title">
                                                        <h2>Minutes Of Meeting List</h2>

                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="x_content">
                                                        <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                                            <thead>
                                                                <tr class="headings">

                                                                    <th>MOM No </th>
                                                                    <th>MOM Date </th>
                                                                    <th>Created By </th>
                                                                    <th>Agenda</th>
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>

                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                <%--<c:set value="0" var="duplicate"/>--%>  

                                                                <c:forEach items="${momList}" var="type">
                                                                    <%--<c:if test="${type.momCode != duplicate}">--%>

                                                                    <tr class="even pointer">
                                                                        <td class="center" style="text-align: left;">${type.momCode} </td>
                                                                        <td class="center" style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${type.date}"/> </td>
                                                                        <td class="center" style="text-align: left;">${type.createdBy} </td>
                                                                        <td class="center" style="text-align: left;">${type.agenda} </td>

                                                                        <td class="center" style="">
                                                                            <a  href="../CRM/momViewForm.htm?momCode=${type.momCode}&action=view" class="fa fa-eye fa-lg"title="View" >
                                                                                                                        
                                                                            </a>

                                                                        </td>   

                                                                    </tr>
                                                                    <%--<c:set value="${type.momCode}" var="duplicate"/>--%>
                                                                    <%--</c:if>--%>

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
            aaSorting: [[0, 'desc']],
            "oLanguage": {
                "sSearch": "Search all columns:"
            },
            "aoColumnDefs": [
                {
                    'bSortable': false,
                    'aTargets': [4]
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

