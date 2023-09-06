<%-- 
    Document   : purchGenmngList
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>arête Assets Management</title>

        <!-- Bootstrap core CSS -->

        <link href="../common/theme/css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">



        <!--[if lt IE 9]>
            <script src="../assets/js/ie8-responsive-file-warning.js"></script>
            <![endif]-->

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
              <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->
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
                                        <jsp:include page="../login/headerlink.htm?submodule=Purchase Order&tab=General Manager&pagetype=list"/>

                                        <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="x_panel">
                                                    <div class="x_title">
                                                        <h2>Purchase Order</h2>
                                                        <div class="clearfix"></div>
                                                    </div>

                                                    <div class="x_content">
                                                        <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                                            <thead>
                                                                <tr class="headings">                                                    

                                                                    <th>Purchase Order No</th>
                                                                    <th>Purchase Order Date</th>
                                                                    <th>Supplier Name</th>
                                                                    <th>Prepared By</th>                                                                   
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                <c:forEach items="${poList}" var="type">
                                                                <c:choose>
                                                                        <c:when test="${not empty type[6]}">
                                                                        <td style="width:12%;">${type[6]}</td>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <td style="width:12%;">${type[0]}</td>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <td style="width:12%;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${type[1]}"/></td>
                                                                <td style="width:17%;">${type[2]}</td>  
                                                                <td style="width:12%;">${type[3]}</td>                                                                                                                                                    
                                                                    <td class=" last" style="width:10%;">
<!--                                                                        <a class="myButton" href="../purchReq/purchReqView.htm?reqNo=${type[0]}&action=view" >
                                                                        <i class="fa fa-search-plus" ></i>
                                                                        View                                            
                                                                    </a>                                                                          -->
                                                                    <a class="myButton10"  href="../purchase/POApprove3Form.htm?poNo=${type[0]}&action=edit">
                                                                        <i class="fa fa-check-circle-o" >
                                                                        Approve  </i>                                           
                                                                    </a>
<!--                                                                    <a class="myButton2" class=""  href="../purchOrder/poEdit.htm?poNo=${type[0]}"onclick="if (confirm('Do you really want to delete this record?')) {
                                                                                return true;
                                                                            } else {
                                                                                return false;
                                                                            }">
                                                                        <i class="fa fa-trash-o" ></i>
                                                                        Delete                                            
                                                                    </a>-->

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
            </section>

        </main><!-- End #main -->


            <!-- Datatables -->
            <!--<script src="../common/theme/js/datatables/js/jquery.dataTables.js"></script>-->

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
                        "sAjaxSource": "../purchase/poPaginationList.htm?listPage=approvedPoList&poStatus=GMList",
                        "aoColumnDefs": [
                            {
                                "aTargets": [0],
                                "sWidth": "150px",
                                "mRender": function (data, type, full) {
                                    var pono;
                                    if (full[6] == null)
                                    {
                                        pono = full[0];
                                    } else
                                    {
                                        pono = full[6];
                                    }
                                    return pono;
                                }

                            },
                            {
                                "aTargets": [1],
                                "sWidth": "150px",
                                "mRender": function (data, type, full) {
                                    return moment(full[1]).format('DD-MMM-YYYY');
                                }

                            },
                            {
                                "aTargets": [2],
                                "sWidth": "250px",
                                "mRender": function (data, type, full) {
                                    return full[2];
                                }
                            },
                            {
                                "aTargets": [3],
                                "sWidth": "150px",
                                "mRender": function (data, type, full) {
                                    return full[3];
                                }

                            },
                            {
                                "aTargets": [4],
                                "sWidth": "100px",
                                "mRender": function (data, type, full) {
                                    return '<div style="text-align:left;"> <a class="myButton10"  href="../purchase/POApprove3Form.htm?poNo=' + full[0] + '&action=edit">\n\
                                            <i class="fa fa-check-circle-o" > Approve  </i>  </a></div>';


                                }

                            },
                        ],
                    });
                });
            </script>

        </div>        

    </div>
    <!-- /page content -->
</div>

</div>

<script>
    NProgress.done();
</script>
</body>

</html>
