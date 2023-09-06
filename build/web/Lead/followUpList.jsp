<%-- 
    Document   : followUpList
    Created on : 29 Sep, 2016, 3:53:29 PM
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



                                        <jsp:include page="../login/headerlink.htm?submodule=Lead Management&tab=Follow Up Details"/>



                                        <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="x_panel">
                                                    <div class="x_title">
                                                        <h2>Follow Up Details</h2>

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
                                                                    <th>Lead Name</th>
                                                                    <th>Property Name </th>
                                                                    <th>Contact Name</th>
                                                                    <th>FollowUp Date</th>

                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>


                                                                <c:forEach items="${followUpList}" var="type">

                                                                    <tr>



                                                                        <td class="center" style="text-align: left;text-transform: capitalize;">${type.leadName}</td>
                                                                        <td class="center" style="text-align: left; text-transform: capitalize;">${type.assetName}</td>
                                                                        <td class="center" style="text-align: left; text-transform: capitalize;">${type.firstName}</td>
                                                                        <td class="center" style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy"  value="${type.folloeUpDate}"/></td>




                                                                        <td class="center" style="">
                                                                            <c:if test="${type.recordStatus eq 'Lead Generated'  }">
                                                                                <a class="fa fa-history fa-lg" style="color: #ff9900" title="Follow Up" href="../Lead/followUpForm.htm?leadCode=${type.leadCode}&assetCode=${type.assetCode}&contactName=${type.firstName}&leadName=${type.leadName}&assetName=${type.assetName}&contactName=${type.firstName}&folloeUpDate=${type.folloeUpDate}">
                                                                                    <i class="">
                                                                                         </i>  
                                                                                </a>
                                                                            </c:if>
                                                                            <%--mm  ../CRM/followUpForm.htm?company=${type[1]}&leadCode=${type[3]}mm--%>
                                                                            <!--<a class="myButton12" href="">-->
                                                                            <a <a class="fa fa-history fa-lg" style="color: #908c68;" title="Follow Up History" href="../Lead/followUpHistoryForm.htm?leadCode=${type.leadCode}&assetCode=${type.assetCode}&contactName=${type.firstName}">
                                                                                    <i class="">
                                                                                        </i>  
                                                                                </a>





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
