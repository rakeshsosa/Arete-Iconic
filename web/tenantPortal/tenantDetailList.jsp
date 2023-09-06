<%-- 
    Document   : tenantDetailList
    Created on : 17 May, 2018, 6:26:33 PM
    Author     : ebs
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link href="../common/theme/css/disableSelection.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../common/validate/validationEngine.css" rel="stylesheet" type="text/css"/>
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.min.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.js" type="text/javascript"></script>
        <title>arête Assets Management</title>

        <!-- Bootstrap core CSS -->
        <script>
            setTimeout(function () {
                $('#successMessage').fadeOut('fast');
            }, 5000);
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
                                        <jsp:include page="../login/headerlink.htm?submodule=Tenant Detail&tab=Tenant Detail&pagetype=list"/>
                                        <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="x_panel">
                                                    <div class="x_title">
                                                        <h2>Tenant Detail List</h2>
                                                        <div class="clearfix">
                                                            <p id="successMessage" style="text-align: center;color: blue;font-family:bold;">${message}</p>
                                                            <c:remove var="message" scope="session" /> 
                                                        </div>
                                                    </div>
                                                    <c:forEach items="${permission}" var="type">
                                                        <c:set var="add" value="${type.newEntry}"></c:set>
                                                        <c:set var="edit" value="${type.edit}"></c:set>
                                                        <c:set var="inactive" value="${type.inactive}"></c:set>
                                                        <c:set var="review" value="${type.review}"></c:set>
                                                        <c:set var="approve" value="${type.approve}"></c:set>
                                                    </c:forEach>
                                                    <div class="x_content">
                                                        <table id="example" class="table table-striped responsive-utilities jambo_table">
                                                            <thead>

                                                                <tr class="headings">
                                                                    <th>Tenant Code</th>
                                                                    <th>Tenant Name</th>
                                                                    <th>Tenant Category</th>
                                                                    <th>Tenant Mail Id</th>
                                                                    <th>Created Date</th>
                                                                    <th>Tenant Contact No</th>

                                                                    <th>Approval Status</th>
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                <c:forEach items="${tenantDetails1}" var="list">
                                                                    <c:set var="TenantCode" value="${list.tenantCode}"></c:set>
                                                                </c:forEach>
                                                                <c:if test="${TenantCode eq null || TenantCode eq ''}">
                                                                    <c:forEach items="${tenantDetails}" var="list">

                                                                        <tr class="even pointer">                                                                   
                                                                            <td class=""style="text-align: left;">${list.tenantCode}</td>
                                                                            <td class=""style="text-align: left;">${list.tenantFname} ${list.tenantLname}</td>
                                                                            <td class=" "style="text-align: left;">${list.tenantCategory}</td>
                                                                            <td class=" "style="text-align: left;">${list.tenantMailid}</td>
                                                                            <td class=" "style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.creationDate}"/></td>
                                                                            <td class=" "style="text-align: left;">${list.tenantContactno}</td>
                                                                            <td class=" "style="text-align: left;">${list.appstatus}</td>
                                                                            <td class="" style="width: 250px;text-align: center;">
                                                                                <a href="../tenantPortal/tenantDetailForm.htm?pk=${list.SNo}&llId=${list.llId}&contractPeriod=${list.contractPeriod}&assetName=${list.assetName}&subclassifiedAstno=${list.subclassifiedAstno}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;

                                                                                <a href="../tenantPortal/tenantDetailForm.htm?pk=${list.SNo}&llId=${list.llId}&contractPeriod=${list.contractPeriod}&assetName=${list.assetName}&subclassifiedAstno=${list.subclassifiedAstno}&action=edit" class="fa fa-pencil fa-lg fa-lg"title="Edit"></a>&nbsp;

                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </c:if>
                                                                <c:if test="${TenantCode ne null || TenantCode ne ''}">
                                                                    <c:forEach items="${tenantDetails1}" var="list">

                                                                        <tr class="even pointer">                                                                   
                                                                            <td class=""style="text-align: left;">${list.tenantCode}</td>
                                                                            <td class=""style="text-align: left;">${list.tenantFname} ${list.tenantLname}</td>
                                                                            <td class=" "style="text-align: left;">${list.tenantCategory}</td>
                                                                            <td class=" "style="text-align: left;">${list.tenantMailid}</td>
                                                                            <td class=" "style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.creationDate}"/></td>
                                                                            <td class=" "style="text-align: left;">${list.tenantContactno}</td>
                                                                            <td class=" "style="text-align: left;">${list.appstatus}</td>
                                                                            <td class="" style="width: 250px;text-align: center;">
                                                                                <a href="../tenantPortal/tenantDetailForm.htm?pk1=${list.SNo}&llId1=${list.llId}&contractPeriod1=${list.contractPeriod}&assetName1=${list.assetName}&subclassifiedAstno1=${list.subclassifiedAstno}&action=view1" class="fa fa-eye fa-lg"title="View"></a>&nbsp;

                                                                                <a href="../tenantPortal/tenantDetailForm.htm?pk1=${list.SNo}&llId1=${list.llId}&contractPeriod1=${list.contractPeriod}&assetName1=${list.assetName}&subclassifiedAstno1=${list.subclassifiedAstno}&action=edit1" class="fa fa-pencil fa-lg fa-lg"title="Edit"></a>&nbsp;

                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </c:if>
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
                            'aTargets': [7]
                        } //disables sorting for column one
                    ],
                    'iDisplayLength': 8,
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
    function sendEmail(tC, Mail) {
        window.location.href = "../tenant/sendPOEmail.htm?tC=" + tC + "&tEmail=" + Mail + "&action=view";
    }

    function sendSMS(tC, Sms) {
        window.location.href = "../tenant/sendSMS.htm?tC=" + tC + "&tSms=" + Sms + "&action=view";
    }

    NProgress.done();
</script>
</body>

</html>