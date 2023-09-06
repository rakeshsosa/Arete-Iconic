<%-- 
    Document   : Tenantalist
    Created on : 12 Sep, 2016, 11:00:26 AM
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



                                        <jsp:include page="../login/headerlink.htm?submodule=Lead Management&tab=Tenant&pagetype=list"/>



                                        <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="x_panel">
                                                    <div class="x_title">
                                                        <h2>Tenant List</h2>

                                                        <a  class="successalert"  style="margin-left: 250px;color: blue;font-size: 17px;">

                                                            <% String x = request.getParameter("msg");
                                                                if (x != null) {
                                                                    out.print(x);
                                                                }
                                                            %>
                                                        </a>



                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="x_content">
                                                        <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                                            <thead>
                                                                <tr class="headings">
                                                                    <th>Tenant Code</th>
                                                                    <th>Tenant Name</th>
                                                                    <th>Property Name</th>
                                                                    <th>Billing Cycle</th>
                                                                    <th>Created Date</th>
                                                                    <th>Tenant Status</th>
                                                                    <th>Approval Status</th>
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>

                                                                <%--<c:set value="0" var="tenantCode1"/>--%>  
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <%--<c:if test="${type.tenantCode!=tenantCode1}">--%>
                                                                    <tr>

                                                                        <td class=""style="text-align: left;">${list.tenantCode}</td>
                                                                        <td class=""style="text-align: left;">${list.tenantFname} ${list.tenantLname}</td>
                                                                        <td class=" "style="text-align: left;">${list.assetNames}</td>
                                                                        <td class=" "style="text-align: left;">${list.billingCycle}</td>
                                                                        <td class=" "style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.creationDate}"/></td>
                                                                        <td class=" "style="text-align: left;">
                                                                            <c:if test="${list.vacatestatus eq null || list.vacatestatus eq ''}">${list.recordstatus}</c:if>
                                                                            <c:if test="${list.vacatestatus ne null}">${list.vacatestatus}</c:if></td>
                                                                        <td class=" "style="text-align: left;">${list.appstatus}</td>

                                                                        <td class="center" style="">
                                                                            <a  href="../Lead/tenantDetailsViewForm.htm?tenantCode=${list.tenantCode}&sno=${list.SNo}&action=view"class="fa fa-eye fa-lg"title="View" >

                                                                                                                          
                                                                            </a>

                                                                        </td>   


                                                                    </tr>
                                                                    <%--</c:if>--%>
                                                                    <%--<c:set value="${type.tenantCode}" var="tenantCode1"/>--%>

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
                        <script src="../common/theme/pagination/jquery.dataTables.min.js"></script>           









                    </div>

                </div>
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
                    'bSortable': false,
                    'aTargets': [7]
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



