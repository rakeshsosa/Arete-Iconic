<%-- 
    Document   : SelecetItem
    Created on : Feb 19, 2016, 5:44:26 PM
    Author     : Nataraj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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


    </head>


    <body>


        <script>
            function test(val1, val2, val3, val4, val5) {
//alert(val5)
                window.opener.document.getElementById('itemCode').value = val1;
                window.opener.document.getElementById('itemName').value = val2;
                window.opener.document.getElementById('itemDesc').value = val3;
                window.opener.document.getElementById('uom').value = val4;
                window.opener.document.getElementById('batchNo').value = val5;
                window.close();

            }

        </script>
        <div class="clearfix"></div>
        <div class="row">

            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">

                    <div class="x_title">
                        <h2>Item List</h2>

                        <div class="clearfix">

                        </div>                       
                    </div>
                    <div class="x_content">
                        <form class="form-horizontal" id="contDetForm">




                            <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                <thead>
                                    <tr class="headings"> 
                                        <th>Item Code</th>
                                        <th>Item Name</th>
                                        <th>Item Description</th>
                                        <th>Uom</th>
                                        <th>Batch NO</th>
                                    </tr>
                                </thead>


                                <c:forEach items="${inventrycountlist}" var="type">

                                    <tr onclick="test('${type[0]}', '${type[1]}', '${type[2]}', '${type[6]}','${type[7]}');">
                                        <td class="center" style="text-align: left;">${type[0]}</td>
                                        <td class="center" style="text-align: left;">${type[1]}</td>
                                        <td class="center" style="text-align: left;">${type[2]}</td>
                                        <td class="center" style="text-align: left;">${type[6]}</td>  
                                        <td class="center" style="text-align: left;">${type[7]}</td>  

                                    </tr>
                                </c:forEach>


                            </table>



                            <%--     <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                     <thead>
                                         <tr class="headings">  
                                             <th>Item Code</th>
                                             <th>Item Name</th>
                                             <th>Item Description</th>
                                             <th>Uom</th> 

                                        <!--                                                                  <th>Spec Drawing No</th>-->
                                        <!--<th class=" no-link last"><span class="nobr">Action</span>-->

                                    </tr>
                                </thead>

                                <tbody>


                                </tbody>

                            </table>--%>
                        </form>
                    </div>
                </div>
            </div>

        </div>

        <input type="hidden" id="storeName" value="${prcode}">

        <!-- Datatables -->
        <script src="../common/theme/js/datatables/js/jquery.dataTables.js"></script>

        <%--  <script>


                                        $(document).ready(function () {
                                            var storeName = $('#storeName').val()
//                alert(storeName);
                                            paginationlist(storeName);
                                        });
                                        function paginationlist(storeName) {


                                            $('#example').dataTable({
                                                oLanguage: {
                                                    'sProcessing': "<p style='margin: -10px 0px 15px 20px;'>Loading data, please wait... <img width='20px'  height='20px' src='../common/theme/images/loading-gif.gif'></p>",
                                                },
                                                "sPaginationType": "full_numbers",
                                                "iDisplayLength": 10,
                                                "bProcessing": true,
                                                "bServerSide": true,
                                                "aaSorting": [[0, 'desc']],
                                                "sAjaxSource": "../quality/selectInventoryCountPagination.htm?storeName=" + storeName,
                                                "aoColumnDefs": [
                                                    {
                                                        "aTargets": [0],
                                                        "bSortable": true,
                                                        "mRender": function (data, type, full) {
                                                            return full[0];
                                                        }

                                                    },
                                                    {
                                                        "aTargets": [1],
                                                        "sWidth": "200px",
                                                        "mRender": function (data, type, full) {
                                                            return full[1];
                                                        }

                                                    },
                                                    {
                                                        "aTargets": [2],
                                                        "mRender": function (data, type, full) {
                                                            return full[2];
                                                        }

                                                    },
                                                    {
                                                        "aTargets": [0],
                                                        "mRender": function (data, type, full) {
                                                            return full[0];
                                                        }
                                                    },
                                                ],
                                            });
                                            $('.jambo_table tbody').on('click', 'tr', function () {

                                                var itemCode = $(this).children('td').eq(0).text();
                                                var itemName = $(this).children('td').eq(1).text();
                                                var itemDesc = $(this).children('td').eq(2).text();
                                                var uom = $(this).children('td').eq(6).text();
                                                window.opener.document.getElementById('itemCode').value = itemCode;
                                                window.opener.document.getElementById('itemName').value = itemName;
                                                window.opener.document.getElementById('itemDesc').value = itemDesc;
                                                window.opener.document.getElementById('uom').value = uom;
                                                window.close();
                                            });
                                        }

        </script>--%>

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

        <!--         Datatables 
             <script src="../common/theme/pagination/jquery.dataTables.min.js"></script> 
                <script>
                                                        $(document).ready(function () {
        
        
                                                            $('#example').dataTable({
                                                                oLanguage: {
                                                                    'sProcessing': "<p style='margin: -10px 0px 15px 20px;'>Loading data, please wait... <img width='20px'  height='20px' src='../common/theme/images/loading-gif.gif'></p>",
                                                                },
                                                                
                                                                "sPaginationType": "full_numbers",
                                                                "iDisplayLength": 10,
                                                                "bProcessing": true,
                                                                "bServerSide": true,
                                                                "sAjaxSource": "../serviceReq/itemPaginationList.htm?listPage=selectItems&itemCate=" + '${itemCate}',
                                                                "aoColumnDefs": [
                                                                    {
                                                                        'bSortable': false,
                                                                        "aTargets": [0],
                                                                        "mRender": function (data, type, full) {
                                                                            return '<input type="checkbox" class="checkbox11"  id="chk1"  value="' + full[0] + '$$' + full[1].replace(/"/g, '&quot;') + '$$' + full[2] + '$$' + full[3] +'" name="chk1" onclick="getVal(this);">';
                                                                        },
                                                                    },
                                                                    {
                                                                        "aTargets": [1],
                                                                        "mRender": function (data, type, full) {
                                                                            return full[0];
                                                                        }
        
                                                                    },
                                                                    {
                                                                        "aTargets": [2],
                                                                        "mRender": function (data, type, full) {
                                                                            return full[1];
                                                                        }
        
                                                                    },
                                                                    {
                                                                        "aTargets": [3],
                                                                        "mRender": function (data, type, full) {
                                                                            return full[2];
                                                                        }
        
                                                                    },
                                                                    {
                                                                        "aTargets": [4],
                                                                        "mRender": function (data, type, full) {
                                                                            return full[3];
                                                                        }
        
                                                                    },
                                                                ],
                                                            });
        
        
                                                    }
                                                    );
                </script>-->
        <script>
            NProgress.done();
        </script>
    </body>

</html>