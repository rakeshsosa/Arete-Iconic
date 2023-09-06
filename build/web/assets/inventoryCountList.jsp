<%-- 
    Document   : navbar
    Created on : Feb 23, 2016, 3:28:35 PM
    Author     : Sudhanshu
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

           <jsp:include page="../login/menu.htm" />

                    <main id="main" class="main">
                        <div>
                            <jsp:include page="../login/headerlink.htm?submodule=Stock Adjustment&tab=Stock Adjustment&pagetype=list"/>
                        </div>
                        <div class="pagetitle">

                        </div><!-- End Page Title -->
                        <section class="section">
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="card">

                                        <div class="card-body">
                                            <div class="card-title">
                                                <h5>Stock Adjustment List</h5>
                                            </div>
                                                 <div class="col-md-4 mb-3 form-floating">
                                                <select class="form-select" id="" name="">
                                                    <option>Select an option</option>
                                                </select>
                                                    <label class="control-label">Store Name</label>
                                            </div>
                                            
                                                        <table id="example" class="table">
                                                            <thead>
                                                                <tr class="headings">

                                                                    <th width="8%">Store Name</th>
                                                                    <th width="10%">Item Name</th>
<!--                                                                    <th width="6%">Batch No</th>
                                                                    <th width="8%">Expiry Date</th>-->
                                                                    <th width="6%">Available Stock</th>
                                                                    <th width="8%">Physical Qty</th>
                                                                    <th width="14%">Physical Count Date</th>
                                                                    <th width="10%">Variance Qty</th>
                                                                    <th width="9%">Base UOM</th>
                                                                    <th width="15%">Actions</th>


                                                                </tr>
                                                            </thead>

                                                            <tbody>

                                                                <%--   <c:forEach items="${inventrylist}" var="type">
                                                                    
                                                                    <tr>

                                                                        <td class="center">${type[0]}</td>
                                                                        <td class="center">${type[1]}</td>
                                                                        <td class="center">${type[2]}</td>
                                                                        <td class="center"><fmt:formatDate pattern="dd-MMM-yyyy" value="${type[3]}"/></td>
                                                                        <td class="center"><fmt:formatNumber pattern="#.##" maxFractionDigits="2" value="${type[4]}"/></td>
                                                                        <td class="center">${type[5]}</td>
                                                                        <td class="center"><fmt:formatDate pattern="dd-MMM-yyyy" value="${type[6]}"/></td>
                                                                        <td class="center">${type[9]}</td>
                                                                        <td class="center">${type[7]}</td>

                                                                        <td class="center">

                                                                            <a href="../inventory/inventoryCountForm.htm?sno=${type[8]}&action=view" class="myButton"><i class="fa fa-search-plus"> View</i></a>

                                                                        </td>   


                                                                    </tr>
                                                                    
</c:forEach> --%>


                                                            </tbody>

                                                        </table>
                                       
                                                    </div>
                                    </div>

                                </div>
                            </div>
                        </section>

                    </main><!-- End #main -->

                    <jsp:include page="../login/footer.jsp" />


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
                                    "sAjaxSource": "../quality/paginationList.htm?listPage=inventoryCountList",
                                    "aoColumnDefs": [
                                        {
                                            "aTargets": [0],
                                            "sWidth": "350px",
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
//                                        {
//                                            "aTargets": [2],
//                                            "sWidth": "150px",
//                                            "mRender": function (data, type, full) {
//                                                return '<div style="text-align:right">' + full[2] + '</div>';
//                                            }
//                                        },
//                                        {
//                                            "aTargets": [3],
//                                            "sWidth": "150px",
//                                            "mRender": function (data, type, full) {
//                                                return '<div style="text-align:left">' + moment(full[6]).format('DD-MMM-YYYY') + '</div>';
//
//                                            }
//
//                                        },
                                        {
                                            "aTargets": [2],
                                            "sWidth": "250px",
                                            "mRender": function (data, type, full) {
                                                return '<div style="text-align:right">' + parseFloat(full[4]).toFixed(3) + '</div>';


                                            }

                                        },
                                        {
                                            "aTargets": [3],
                                            "sWidth": "200px",
                                            "mRender": function (data, type, full) {
                                                return '<div style="text-align:right">' + parseFloat(full[5]).toFixed(3) + '</div>';


                                            }

                                        },
                                        {
                                            "aTargets": [4],
                                            "sWidth": "300px",
                                            "mRender": function (data, type, full) {
                                                return '<div style="text-align:left">' + moment(full[6]).format('DD-MMM-YYYY') + '</div>';
                                            }

                                        },
                                        {
                                            "aTargets": [5],
                                            "mRender": function (data, type, full) {
                                                return '<div style="text-align:right">' + parseFloat(full[9]).toFixed(3) + '</div>';


                                            }

                                        },
                                        {
                                            "aTargets": [6],
                                            "sWidth": "150px",
                                            "mRender": function (data, type, full) {
                                                return '<div style="text-align:left">' + full[7] + '</div>';
                                            }
                                        },
                                        {
                                            "aTargets": [7],
                                            "sWidth": "150px",
                                            "mRender": function (data, type, full) {
                                                return '<div style="text-align:left"><a style="text-align:left" href="../quality/inventoryCountForm.htm?sno=' + full[8] + '&action=view" class="fa fa-eye fa-lg" title="View"></a></div>';
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
