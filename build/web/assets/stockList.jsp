<%-- 
    Document   : stockList
    Created on : 19 Feb, 2018, 2:24:13 PM
    Author     : ebs05
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
                                        <jsp:include page="../login/headerlink.htm?submodule=Inventory List&tab=Stock List&pagetype=list"/>

                                        <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="x_panel">
                                                    <div class="x_title">
                                                        <h2>Stock List<small></small></h2>

                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="x_content">
                                                        <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                                            <thead>
                                                                <tr class="headings">


                                                                    <th>Store</th>
                                                                    <th>Item Code</th>
                                                                    <th>Item Name</th>
                                                                    <th>Total Stock</th>
                                                                    <th>UOM</th>
                                                                    <th>Batch No</th>
                                                                    <th>Expiry Date</th>



                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                <%--     <c:forEach items="${inventorylist}" var="list">


                                                                    <tr>
                                                                        <td class="center" style="width:10%;">${list[0]}</td>
                                                                        <td class="center" style="width:10%;">${list[1]}</td>
                                                                        <td class="center" style="width:20%;">${list[2]}</td>
                                                                        <td class="center" style="width:10%;"><fmt:formatNumber pattern="#.##" maxFractionDigits="2" value="${list[3]}"/></td>
                                                                        <td class="center" style="width:10%;">${list[4]}</td>
                                                                        <td class="center" style="width:10%;">${list[5]}</td>
                                                                        <td class="center" style="width:10%;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list[6]}"/></td>


                                                                    </tr>

</c:forEach> --%>
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
                                $('#example').dataTable({
                                    oLanguage: {
                                        'sProcessing': "<p style='margin: -10px 0px 15px 20px;'>Loading data, please wait... <img width='20px'  height='20px' src='../common/theme/images/loading-gif.gif'></p>",
                                    },
                                    "sPaginationType": "full_numbers",
                                    "iDisplayLength": 10,
                                    "bProcessing": true,
                                    "bServerSide": true,
                                    "aaSorting": [[0, 'desc']],
                                    "sAjaxSource": "../quality/paginationList.htm?listPage=StockList",
                                    "aoColumnDefs": [
                                        {
                                            "aTargets": [0],
                                            "sWidth": "200px",
                                            "mRender": function (data, type, full) {
                                                return '<div style="text-align:left">' + full[0] + '</div>';
                                            }

                                        },
                                        {
                                            "aTargets": [1],
                                            "mRender": function (data, type, full) {
                                                return '<div style="text-align:left">' + full[1] + '</div>';
                                            }

                                        },
                                        {
                                            "aTargets": [2],
                                            "mRender": function (data, type, full) {
                                                return '<div style="text-align:left">' + full[2] + '</div>';
                                            }
                                        },
                                        {
                                            "aTargets": [3],
                                            "mRender": function (data, type, full) {
                                                return '<div style="text-align:right">' + full[3].toFixed(3) + '</div>';
                                            }

                                        },
                                        {
                                            "aTargets": [4],
                                            "mRender": function (data, type, full) {
                                                return '<div style="text-align:left">' + full[4] + '</div>';


                                            }

                                        },
                                        {
                                            "aTargets": [5],
                                            "mRender": function (data, type, full) {
                                                return '<div style="text-align:right">' + full[5] + '</div>';


                                            }

                                        },
                                        {
                                            "aTargets": [6],
                                            "mRender": function (data, type, full) {
                                                return '<div style="text-align:left">' + moment(full[6]).format('DD-MMM-YYYY') + '</div>';
                                            }

                                        },
                                    ],
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

