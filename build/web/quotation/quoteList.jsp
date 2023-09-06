<%-- 
    Document   : quoteList
    Created on : 20 Oct, 2016, 3:48:30 PM
    Author     : Shweta S sAkri
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
                                        <jsp:include page="../login/headerlink.htm?submodule=Final Quotation&tab=Final Quotation&pagetype=list"/>
                                        <div class="row">


                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="x_panel">
                                                    <div class="x_title">
                                                        <h2>Final Quotation List</h2>
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

                                                                    <th>Quotation No.</th>
                                                                    <th>Quotation Date</th>
                                                                    <th>Accessory Code</th>
                                                                    <th>Accessory Name</th>
                                                                    <th class=" no-link last"><span class="nobr">Actions</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                <c:set value="0" var="duplicate"/> 
                                                                <c:forEach items="${quote}" var="list">
                                                                    <c:if test="${list.quotationNo != duplicate}">
                                                                        <tr class="even pointer">                                                                   
                                                                            <td class="center" style="text-align: left;">${list.quotationNo}</td>
                                                                            <td class="center" style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.quotationDate}"/></td>
                                                                            <td class="center" style="text-align: left;">${list.itemCode}</td>
                                                                            <c:forEach items="${itemMaster}" var="list1">
                                                                                <c:if test="${list1.itemCode eq list.itemCode}">
                                                                                    <c:set value="${list1.itemName}" var="itemName"/> 
                                                                                </c:if>
                                                                            </c:forEach>
                                                                            <td class="center" style="text-align: left;text-transform: capitalize;">${itemName}</td>
                                                                            <td class="center" style="text-align: left;">
                                                                                <a href="../purchase/quoteEditForm.htm?pk=${list.sno}&quotationNo=${list.quotationNo}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;
                                                                                <c:if test="${edit eq 'y'}">
                                                                                    <a  class="fa fa-pencil fa-lg" href="../purchase/quoteEditForm.htm?pk=${list.sno}&quotationNo=${list.quotationNo}&action=edit" title="Edit">
                                                                                         
                                                                                                                                    
                                                                                    </a>
                                                                                </c:if>
                                                                            </td>

                                                                        </tr>
                                                                    </c:if>
                                                                    <c:set value="${list.quotationNo}" var="duplicate"/>
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
<script>
    NProgress.done();
</script>
</body>

</html>

