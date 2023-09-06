<%-- 
    Document   : leadmanagmentList
    Created on : 4 Mar, 2016, 10:37:40 AM
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


    <body class="nav-sm">

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



                                        <jsp:include page="../login/headerlink.htm?submodule=Lead Management&tab=Lead Management&pagetype=list"/>



                                        <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="x_panel">
                                                    <div class="x_title">
                                                        <h2>Lead Management List</h2>

                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="x_content">
                                                        <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                                            <thead>
                                                                <tr class="headings">

                                                                    <th>Lead Code </th>
                                                                    <th>Lead Type </th>

                                                                    <th>Company </th>

                                                                    <th>Lead Source</th>
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>

                                                                <c:set value="0" var="leadCode1"/>  
                                                                <c:forEach items="${leadmanagmentList}" var="type">
                                                                    <c:if test="${type.leadCode!=leadCode1}">
                                                                        <tr>



                                                                            <td class="center">${type.leadCode}</td>
                                                                            <td class="center">${type.leadType}</td>
                                                                            <td class="center">${type.company}</td>

                                                                            <td class="center">${type.leadSource}</td>



                                                                            <td class="center" style="text-align: left;">
                                                                                <a  href="../CRM/leadmanagmentForm.htm?sno=${type.sno}&leadCode=${type.leadCode}&action=view"class="fa fa-eye fa-lg"title="View" >
                                                                                    <i class="fa fa-search-plus">
                                                                                        View </i>                                             
                                                                                </a>
                                                                                <a class="fa fa-pencil fa-lg" href="../CRM/leadmanagmentForm.htm?sno=${type.sno}&leadCode=${type.leadCode}&action=edit" >
                                                                                    <i class="fa fa-pencil fa-lg-square-o">
                                                                                        Edit </i>     
                                                                                </a>

<!--                                                                                <a class="myButton6" href="../CRM/customermanagmentForm.htm?leadCode=${type.leadCode}&action=Follow Up"  target="_blank">
                                                                                    <i class="icon-zoom-in icon-white"></i>  
                                                                                    Follow Up
                                                                                </a>&nbsp;-->
                                                                                <a class="myButton7" href="../CRM/FollowupHistory.htm?sno=${type.sno}&company=${type.company}&leadCode=${type.leadCode}">
                                                                                    <i class="fa fa-history">
                                                                                        Follow Up </i>  
                                                                                </a>
                                                                                <a class="myButton12" href="../CRM/followuphistForm.htm?company=${type.company}&leadCode=${type.leadCode}">
                                                                                    <i class="fa fa-history">
                                                                                        Follow Up History</i>  
                                                                                </a>
                                                                                <a class="myButton16" href="../CRM/LeadConvertForm.htm?company=${type.company}&action=convert" >
                                                                                    <i class="fa fa-refresh">
                                                                                        Convert</i>  
                                                                                </a>
                                                                                <c:if test="${type.email ne null}">
                                                                                    <a class="myButton9" href="../CRM/sendLeadEmail.htm?leadCode=${type.leadCode}&email=${type.email}&action=view" >
                                                                                        <i class="fa fa-send" >
                                                                                            Send Email</i>
                                                                                    </a>
                                                                                </c:if>

<!--                                                                                <a class="myButton6" href="../CRM/Salesenquiry.htm?leadCode=${type.leadCode}&action=enq" target="_blank" >
    <i class="icon-zoom-in icon-white"></i>  
    Enquiry
</a>-->
                                                                            </td>   


                                                                        </tr>
                                                                    </c:if>
                                                                    <c:set value="${type.leadCode}" var="leadCode1"/>

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


