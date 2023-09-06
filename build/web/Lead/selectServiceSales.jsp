<%-- 
    Document   : selectServiceSales
    Created on : 20 Jun, 2016, 1:21:08 PM
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

        <!-- Bootstrap core CSS -->

        <link href="../common/theme/css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">

        <link href="../common/theme/css/bootstrap.min.css" rel="stylesheet">
        <link href="../common/theme/css/popupcustom.css" rel="stylesheet">
        <script src="../common/theme/js/jquery.min.js"></script>
        <script src="../common/theme/js/nprogress.js"></script>        
        <script src="../common/theme/js/bootstrap.min.js"></script>       

        <!-- icheck -->
        <script src="../common/theme/js/icheck/icheck.min.js"></script>

        <!--[if lt IE 9]>
            <script src="../assets/js/ie8-responsive-file-warning.js"></script>
            <![endif]-->

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
              <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->
    </head>


    <body>


        <script>
            function test(val1, val2, val3, val4, val5, val6) {
                $(window.opener.document).find('#${rowid} #codeService').val(val2);
                $(window.opener.document).find('#${rowid} #nameService').val(val3);
                $(window.opener.document).find('#${rowid} #uomService').val(val5);
                $(window.opener.document).find('#${rowid} #serviceunitPrice').val(val6);
//                window.opener.serviceUpd();
                window.close();
            }

            checked = false;
            function checkAll() {
                var aa = document.getElementById('contDetForm');
                // alert('test');
                if (checked == false) {
                    checked = true;
                } else {
                    checked = false;
                }
                for (var i = 0; i < aa.elements.length; i++) {
                    aa.elements[i].checked = checked;
                }
            }

            function typelist(contDetForm) {

//                window.opener.document.getElementById('Class').value = val1;
                window.opener.document.getElementById('codeEnquiry').value = val2;
                window.opener.document.getElementById('nameEnquiry').value = val3;
//                window.opener.document.getElementById('mtid').value = val4;
                window.opener.document.getElementById('descriptionEnq').value = val5;
                window.close();
            }


        </script>

        <div class="clearfix"></div>

        <div class="row">

            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <input type="hidden" value="${rowid}" id="rowid">
                    <div class="x_title">
                        <h2>Service List</h2>

                        <div class="clearfix">

                        </div>                       
                    </div>
                    <div class="x_content">
                        <form class="form-horizontal" id="contDetForm">                            
                            <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                <thead>
                                    <tr class="headings">                                                   
                                        <th>Service Sub Category</th>       
                                        <th>Code</th>
                                        <th>Name</th>
                                        <th>Description</th>
                                        <th>Unit</th>
                                        <th>Unit Price</th>
                                    </tr>
                                </thead>

                                <tbody>                                   

                                    <c:forEach items="${serviceItemList}" var="type">
                                        <c:set var="purchasePrice" value="0"/>
                                        <c:set var="purchasePrice1" value="0"/>
                                        <c:forEach items="${rmSuppList}" var="type1">
                                            <c:if test="${type[5] eq 'Service' && type[1] eq type1.itemCode && type1.status eq 'Active'}">
                                                <c:set var="flag" value="1"/>
                                                <c:set var="purchasePrice" value="${type1.purchasePrice*type.costFactor}"/>
                                                <c:set var="purchasePrice1" value="${type1.purchasePrice}"/>
                                            </c:if>
                                        </c:forEach>

                                        <tr onclick="test('${type[0]}', '${type[1]}', '${type[2]}', '${type[3]}', '${type[4]}', '${purchasePrice1}');">                                            
                                            <td class="center" style="text-align: left;text-transform: capitalize;">${type[0]}</td>
                                            <td class="center" style="text-align: left;text-transform: capitalize;">${type[1]}</td>
                                            <td class="center" style="text-align: left;text-transform: capitalize;">${type[2]}</td>
                                            <td class="center" style="text-align: left;text-transform: capitalize;">${type[3]}</td>
                                            <td class="center" style="text-align: left;text-transform: capitalize;">${type[4]}</td>
                                            <td class="center" style="text-align: left;text-transform: capitalize;">${purchasePrice1}</td> 
                                        </tr>
                                    </c:forEach>

                                </tbody>

                            </table>
                        </form>
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
                                                            'bSortable': true,
                                                            'aTargets': [0]
                                                        } //disables sorting for column one
                                                    ],
                                                    'iDisplayLength': 12,
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
