<%-- 
    Document   : ContractApprove2List
    Created on : 17 Oct, 2016, 6:25:58 PM
    Author     : Shweta S Sakri
--%>

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

        <!-- Bootstrap core CSS -->
    </head>
    <body class="nav-md">
        <div class="">
            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>

                <div class="main" role="main" id="main">
                    <br />
                    <div class="mt-3">
                        <div class="row top_tiles">
                            <div class="">
                                <div class="col-md-6 col-sm-6 col-lg-12">
                                    <div class="x_panel">
                                        <jsp:include page="../login/headerlink.htm?submodule=Contract Creation&tab=Approval 2&pagetype=list"/>
                                        <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="x_panel">
                                                    <div class="x_title">
                                                        <h2>Contract Creation List</h2>
                                                        <div class="clearfix"></div>
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
                                                                    <th>Contract Code</th>
                                                                    <th>Contract No.</th>
                                                                    <th>Contract Start Date</th>
                                                                    <th>Contract End Date</th>
                                                                    <th>Contract Renewal Date</th>
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>

                                                                <c:forEach items="${contraApp1}" var="list">
                                                                    <tr class="even pointer">                                                                   
                                                                        <td style="text-align: left;">${list.contractCode}</td>
                                                                        <td style="text-align: left;">${list.contractTitle}</td>
                                                                        <td style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.contStartDate}"/></td>
                                                                        <td style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.contEndDate}"/></td>
                                                                        <td style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.contReviewDate}"/></td>
                                                                        <td style="text-align: left;">
                                                                            <c:if test="${approve eq 'y'}">
                                                                                <a class="fa fa-check-circle-o fa-lg" style="color: green;" title="Need Approval"  href="../insurance/contractApprove2Form.htm?contractCode=${list.contractCode}&contractCategoryId=${list.contractCategoryId}&contClassificationId=${list.classificationId}&action=edit">
                                                                                                                            
                                                                                </a>
                                                                            </c:if>
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
                                'aTargets': [5]
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

            <script>
                NProgress.done();
            </script>
                 <script src="../common/theme/js/custom.js"></script>
    </body>

</html>
