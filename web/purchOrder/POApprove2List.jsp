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
        <title>Arete Iconic</title>
        <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">     
    </head>


    <body class="nav-sm">
        <jsp:include page="../login/menu.htm"/>
       <jsp:include page="../login/footer.jsp"/>

        <main id="main" class="main">
            <div class="mt-3">
                <jsp:include page="../login/headerlink.htm?submodule=Purchase Order&tab=Finance Manager&pagetype=list"/>
            </div>
            <div class="pagetitle">

            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">

                            <div class="card-body">
                                <p id="successMessage" style="text-align: center;color: blue;font-family:bold;">${message}</p>
                                <c:remove var="message" scope="session" /> 
                                <div class="card-title"><h5>Purchase Order</h5></div> 
                                <!-- Table with stripped rows -->
                                
                                <div class="table-responsive">
                                                        <table id="example" class="table w-100 datatable table-hover table-bordered">
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
                                                                    <td class=" last" style="width:10%;text-align: center;">
<!--                                                                        <a class="myButton" href="../purchReq/purchReqView.htm?reqNo=${type[0]}&action=view" >
                                                                        <i class="fa fa-search-plus" ></i>
                                                                        View                                            
                                                                    </a>                                                                          -->
                                                                        <a class="fa fa-check-circle-o fa-lg"  href="../purchase/POApprove2Form.htm?poNo=${type[0]}&action=edit" title="Approve" style="color: green;">
                                                                                                                 
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
                        "sAjaxSource": "../purchase/poPaginationList.htm?listPage=approvedPoList&poStatus=FMList",
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
                                    return '<div style="text-align:center;"> <a class="fa fa-check-circle-o fa-lg"  href="../purchase/POApprove2Form.htm?poNo=' + full[0] + '&action=edit" title="Approve" style="color: green;">\n\
                                            </a></div>';


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
