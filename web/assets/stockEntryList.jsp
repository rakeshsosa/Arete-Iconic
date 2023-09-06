<%-- 
    Document   : navbar
    Created on : Feb 23, 2016, 3:28:35 PM
    Author     : Lakshmi
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
                            <jsp:include page="../login/headerlink.htm?submodule=Stock Adjustment&tab=Stock Entry&pagetype=list"/>
                        </div>
                        <div class="pagetitle">

                        </div><!-- End Page Title -->
                        <section class="section">
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="card">

                                        <div class="card-body">
                                            <div class="card-title">
                                                <h5>Stock Entry List</h5>
                                            </div>
                                            <!-- Table with stripped rows -->

                                            <div class="table-responsive">
                                            <table class="table datatable">
                                                            <c:forEach items="${permission}" var="type">
                                                        <c:set var="add" value="${type.newEntry}"></c:set>
                                                        <c:set var="edit" value="${type.edit}"></c:set>
                                                        <c:set var="inactive" value="${type.inactive}"></c:set>
                                                        <c:set var="review" value="${type.review}"></c:set>
                                                        <c:set var="approve" value="${type.approve}"></c:set>
                                                    </c:forEach>
                                                            <thead>
                                                                <tr class="headings">
                                                                    <th width="14%">Stock Entry Number</th>
                                                                    <th width="10%">Item Name</th>
                                                                    <th width="6%">Item Code</th>
                                                                    <th width="6%">Unit Price</th>
                                                                    <th width="8%">Physical Qty</th>
                                                                    <th width="8%">UOM</th>
                                                                    <th width="10%">Total Price</th>
                                                                    <th class=" no-link last" width="10%"><span class="nobr">Action</span>
                                                                </tr>
                                                            </thead>

                                                            <tbody>

                                                               <c:forEach items="${stockEntrylist}" var="type">
                                                                    <tr>

                                                                        <td class="center">${type[0]}</td>
                                                                        <td class="center">${type[2]}</td>
                                                                        <td class="center">${type[1]}</td>
                                                                        <td class="center">${type[3]}</td>
                                                                        <td class="center">${type[4]}</td>
                                                                        <td class="center">${type[5]}</td>
                                                                         <td class="center">${type[6]}</td>
                                                                         <td class=" last " style="text-align: center;">

                                                                            <a href="../quality/stockEntryForm.htm?pk=${type[7]}& itemCode=${type[1]}&itemName=${type[2]}&action=view" class="fa fa-eye fa-lg"title="View"></a>
                                                                            &nbsp;
                                                                            <c:if test="${edit eq 'y'}">
                                                                                <a  class="fa fa-pencil fa-lg" href="../quality/stockEntryForm.htm?pk=${type[7]}& itemCode=${type[1]}&itemName=${type[2]}&action=edit" title="Edit"></a>
                                                                                </c:if>&nbsp;
                                                                            </td>   
<!--       
<td class="center">

                                                                            <a href="../inventory/inventoryCountForm.htm?sno=${type[8]}&action=view" class="myButton"><i class="fa fa-search-plus"> View</i></a>

                                                                        </td>  -->
                                                                    </tr>

                                                                </c:forEach> 


                                                            </tbody>

                                                        </table>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </section>

                    </main><!-- End #main -->

                    <jsp:include page="../login/footer.jsp" />


                        <!-- Datatables -->
<!--                        <script src="../common/theme/js/datatables/js/jquery.dataTables.js"></script>

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
                                    "aaSorting": [[0, 'desc']],
                                    "sAjaxSource": "../quality/stockEntrypaginationList.htm?listPage=stockEntryList",
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
                                                return '<div style="text-align:left">' + full[2] + '</div>';
                                            }

                                        },
                                        {
                                            "aTargets": [2],
                                            "sWidth": "150px",
                                            "mRender": function (data, type, full) {
                                                return '<div style="text-align:right">' + full[1] + '</div>';
                                            }
                                        },
                                        {
                                            "aTargets": [3],
                                            "sWidth": "150px",
                                            "mRender": function (data, type, full) {
                                                return '<div style="text-align:left">' +  full[3]   + '</div>';

                                            }

                                        },
                                        {
                                            "aTargets": [4],
                                            "sWidth": "250px",
                                            "mRender": function (data, type, full) {
                                                return '<div style="text-align:right">' +  full[4]  + '</div>';


                                            }

                                        },
                                        {
                                            "aTargets": [5],
                                            "sWidth": "200px",
                                            "mRender": function (data, type, full) {
                                                return '<div style="text-align:right">'  + full[5] +  '</div>';


                                            }

                                        },
                                        {
                                            "aTargets": [6],
                                            "sWidth": "300px",
                                            "mRender": function (data, type, full) {
                                                return '<div style="text-align:left">'  + full[6] +  '</div>';
                                            }

                                        },
                                    ],
                                });
                            });
                        </script>	-->



</body>

</html>
