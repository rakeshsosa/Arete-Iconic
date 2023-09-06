<%-- 
    Document   : qaInspectionList
    Created on : 22 Feb, 2018, 10:23:10 AM
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
                            <jsp:include page="../login/headerlink.htm?submodule=Receipt List&tab=QA Inspection&pagetype=list"/>
                        </div>
                        <div class="pagetitle">

                        </div><!-- End Page Title -->
                        <section class="section">
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="card">

                                        <div class="card-body">
                                            <div class="card-title">
                                                <h5>QA Inspection List</h5>
                                            </div>
                                            <div class="table-responsive">
                                                        <table id="example" class="table">
                                                            <thead>
                                                                <tr class="headings">


                                                                    <th>Receipt No</th>
                                                                    <th>Receipt Date</th>
                                                                    <!--<th>PO No</th>-->
                                                                    <th>Received By</th>
                                                                    <th>Supplier Name</th>

                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>

                                                                <%--     <c:forEach items="${matlist}" var="type"> 


                                                                    <c:forEach items="${supplerDetails}" var="sup">

                                                                        <c:if test="${type[4] eq sup.supplierCode}">

                                                                            <c:set var="supName" value="${sup.supplierName}"/>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <tr>

                                                                        <td class="center" style="width:10%;">${type[0]}</td>
                                                                        <td class="center" style="width:11%;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${type[1]}"/></td>
                                                                        <td lass="center" style="width:10%;">${type[2]}</td>
                                                                        <td lass="center" style="width:13%;">${type[3]}</td>
                                                                        <td class="center" style="width:20%;">${supName}</td>
                                                                <%--<td class="center">
                                                                    <c:forEach items="${poList}" var="polist">
                                                                        ${polist.approvalStatus} 
                                                                    </c:forEach>
</td>
                                                                <td class="center" style="width:12%;">
                                                                    <a class="myButton7" href="../inventory/InspectionForm.htm?mrNo=${type[0]}&poNo=${type[2]}">
                                                                        <i class="fa fa-search"> Create Inspection</i></a> 

                                                                        </td>
                                                                    </tr>  

                                                                </c:forEach> --%>
                                                            </tbody>
                                                        </table>

                                                       
                                            </div>
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
                        "sAjaxSource": "../quality/paginationList.htm?listPage=mrList",
                        "aoColumnDefs": [
                            {
                                "aTargets": [0],
                                "sWidth": "100px",
                                "mRender": function (data, type, full) {
                                    return '<div style="text-align:left">' + full[0] + '</div>';
                                }

                            },
                            {
                                "aTargets": [1],
                                "mRender": function (data, type, full) {
                                    return '<div style="text-align:left">' + moment(full[1]).format('DD-MMM-YYYY') + '</div>';
                                }

                            },
//                                        {
//                                            "aTargets": [2],
//                                            "mRender": function (data, type, full) {
//                                                return full[2];
//                                            }
//                                        },
                            {
                                "aTargets": [2],
                                "mRender": function (data, type, full) {
                                    return '<div style="text-align:left">' + full[3] + '</div>';
                                }
                            },
                            {
                                "aTargets": [3],
                                "mRender": function (data, type, full) {

                <c:forEach items="${supplerDetails}" var="type">
                                    if (full[4] == '${type.supplierCode}')
                                    {
                                        return '<div style="text-align:left">' + '${fn:escapeXml(type.supplierName)}' + '</div>';
                                    }
                </c:forEach>
                                    return '';
                                }

                            },
                            {
                                "aTargets": [4],
                                "sWidth": "200px",
                                "mRender": function (data, type, full) {
                                    return '<div style="text-align:left"><a class="fa fa-search fa-lg" style="text-align:left" href="../quality/qaInspectionForm.htm?mrNo=' + full[0] + '&poNo=' + full[2] + '" title="Create Inspection"> \n\
                                                        </a> </div> ';
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
                        </section>

                    </main><!-- End #main -->

                    <jsp:include page="../login/footer.jsp" />
<script>
    NProgress.done();
</script>
</body>

</html>
