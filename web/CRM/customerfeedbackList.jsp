<%-- 
    Document   : customerfeedbackList
    Created on : 9 Mar, 2016, 5:10:47 PM
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


                                        <jsp:include page="../login/headerlink.htm?submodule=Customer Feedback&tab=Customer Feedback&pagetype=list"/>


                                        <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="x_panel">
                                                    <div class="x_title">
                                                        <h2>Customer Feedback List</h2>

                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="x_content">
                                                        <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                                            <thead>
                                                                <tr class="headings">
                                                                    <th>Customer FeedBack No</th>
                                                                    <th>Tenant Name </th>
                                                                    <th>Property Name </th>
                                                                    <th>Flat Name / Flat No.</th>
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>


                                                                <c:forEach items="${customerfeedbackList}" var="type">
                                                                    <c:forEach items="${assetDetails}" var="asset">
                                                                        <c:if test="${asset.assetCode eq type.assetName}">
                                                                            <c:set var="assetName" value="${asset.assetName}"/>

                                                                        </c:if> 
                                                                    </c:forEach>
                                                                    <c:forEach items="${subAssetDetails}" var="subasset">
                                                                        <c:if test="${subasset.subAssetCode eq type.assetNo}">
                                                                            <c:set var="subAssetName" value="${subasset.subAssetName}"/>

                                                                        </c:if> 
                                                                    </c:forEach>

                                                                    <c:forEach items="${customerfeedbackList}" var="type1">
                                                                        <c:if test="${type.sno eq type1.sno}">
                                                                            <c:set value="0" var="j"/>
                                                                            <c:if test="${type1.propertyAllocation eq 'Extremely Dissatisfied' }">
                                                                                <c:set value="${j+1}" var="j"/>
                                                                            </c:if>
                                                                            <c:if test="${type1.service eq 'Extremely Dissatisfied' }">
                                                                                <c:set value="${j+1}" var="j"/>
                                                                            </c:if>
                                                                            <c:if test="${type1.utilitiesManagement eq 'Extremely Dissatisfied' }">
                                                                                <c:set value="${j+1}" var="j"/>
                                                                            </c:if>
                                                                            <c:if test="${type1.support eq 'Extremely Dissatisfied' }">
                                                                                <c:set value="${j+1}" var="j"/>
                                                                            </c:if>

                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <tr>
                                                                        <td class="center" style="text-align: left;">${type.custometFbCode}</td>
                                                                        <td class="center" style="text-align: left;">${type.tenantName}</td>
                                                                        <td class="center" style="text-align: left;">${assetName}</td>

                                                                        <td class="center" style="text-align: left;">${subAssetName}</td>



                                                                        <td class="center" style="">
                                                                            <a  href="../CRM/customerfeedbackForm.htm?sno=${type.sno} &action=view" class="fa fa-eye fa-lg"title="View" >
                                                                                                                            
                                                                            </a>
<!--                                                                            <a class="btn btn-primary btn-round" href="../CRM/customerfeedbackForm.htm?sno=${type.sno}&action=edit"  target="newWindow">
                                                                            <i class="icon-zoom-in icon-white"></i>  
                                                                            Edit                                            
                                                                        </a>              -->
                                                                            <c:if test="${j gt '2' }">
                                                                                <%--                                                                                <a class="myButton6" href="../CRM/complaintForm.htm?customerName=${type.customerName}&salesOrderNo=${type.salesOrderNo}&customerCode=${type.customerCode}&division=${type.division}" >
                                                                                                                                                                    <i class="fa fa-warning">
                                                                                                                                                                    Complaints </i>                                          
                                                                                                                                                                </a>--%>
                                                                            </c:if>
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



