<%-- 
    Document   : receiptList
    Created on : 19 Feb, 2018, 3:57:36 PM
    Author     : ebs05
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            <jsp:include page="../login/headerlink.htm?submodule=Receipt List&tab=Receipt&pagetype=list"/>
                        </div>
                        <div class="pagetitle">

                        </div><!-- End Page Title -->
                        <section class="section">
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="card">

                                        <div class="card-body">
                                            <div class="card-title">
                                                <h5>Receipt List</h5>
                                            </div>
                                            
                                            <div class="col-md-4 mb-3">
                                                <select class="form-select" aria-label="Default select example">
                                                <option selected>All</option>
                                                <option value="Purchase Order">Purchase Order</option>
                                                <option value="Petty Cash">Petty Cash</option>
                                              </select>
                                            </div>
                                            <div class="table-responsive">
                                                        <table id="" class="table datatable">
                                                            <thead>
                                                                <tr class="headings">
                                                                    <th>Purchase Type</th>
                                                                    <th>Purchase Order No</th>
                                                                    <th>Purchase Order Date</th>
                                                                    <th>Vendor Name</th>
                                                                    <th>Delivery Location</th>
                                                                    <th>Status</th>
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td class="no-link last" style="width: 200px"><a href="../assets/receiptForm.jsp" class="fa fa-newspaper-o fa-lg" data-toggle="tooltip" title="Create GRN"></a></span></td>
                                                                </tr>
                                                               
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
                        "sAjaxSource": "../quality/paginationList.htm?listPage=receiptsList",
                        "aoColumnDefs": [
                            {
                                "aTargets": [0],
                                "sWidth": "100px",
                                "mRender": function (data, type, full) {
                                    var a1 = "";
                                    if (full[0] != null) {
                                        a1 = full[0];
                                    }
                                    return '<div style="text-align:left">' + a1 + '</div>';


                                }

                            },
                            {
                                "aTargets": [1],
                                "mRender": function (data, type, full) {
                                    return '<div style="text-align:left">' + moment(full[1]).format('DD-MMM-YYYY') + '</div>';
                                }

                            },
                            {
                                "aTargets": [2],
                                "mRender": function (data, type, full) {

                                    var a3 = "";
                                    if (full[2] != null) {
                                        a3 = full[2];
                                    }
                                    return '<div style="text-align:left">' + a3 + '</div>';

                                    //return full[2];
                                }
                            },
                            {
                                "aTargets": [3],
                                "mRender": function (data, type, full) {

                                    var a2 = "";
                                    if (full[3] != null) {
                                        a2 = full[3];
                                    }
                                    return '<div style="text-align:left">' + a2 + '</div>';

                                }
                            },
                            {
                                "aTargets": [4],
                                "mRender": function (data, type, full) {

                <c:forEach items="${poList}" var="polist">
                                    var a4 = "";
                                    if (full[4] != null) {
                                        a4 = full[4];
                                    }
                                    return '<div style="text-align:left">' + a4 + '</div>';
                                    //return   full[4];
                </c:forEach>
                                }

                            },
                            {
                                "aTargets": [5],
                                "sWidth": "150px",
                                "mRender": function (data, type, full) {
                                    var a5 = "";
                                    if (full[0] != null) {
                                        a5 = full[0];
                                    }
                                    //return a2;

                                    return '<div style="text-align:left"><a class="fa fa-files-o fa-lg" style="text-align:left" href="../quality/receiptForm1.htm?poNo=' + a5 + '" title="Create Receipt">\n\
                                                        <i class=""> </i></a></div> ';
                                }

                            },
                        ],
                    });
                });
            </script>
       
</body>

</html>