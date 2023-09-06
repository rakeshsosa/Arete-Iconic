<%-- 
    Document   : assetDetailsList
    Created on : Sep 15, 2016, 10:42:18 AM
    Author     : Kondal Reddy N
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

        <style>
            tbody tr td,tbody tr td div{
                text-align: left !important;
            }
        </style>
    </head>

    <script>
        function Generate(val)
        {
            var format = "PDF";

            if (format != "null" && format != "")            {


                if (format == "PDF") {
                    var url = '../reports/areteReportData.htm?format=' + format + '&reportid=' + 'grnPrint ' + '&GrnNo=' + val + '';
                    window.open(url, '_blank');
                    window.focus();
                }


            }
        }
    </script>

    <body class="nav-md">
                <jsp:include page="../login/menu.htm" />

                    <main id="main" class="main">
                        <div>
                            <jsp:include page="../login/headerlink.htm?submodule=Good Receipt Note&tab=GoodReceiptNote&pagetype=list"/>
                        </div>
                        <div class="pagetitle">

                        </div><!-- End Page Title -->
                        <section class="section">
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="card">

                                        <div class="card-body">
                                            <div class="card-title">
                                                <h5>GRN List</h5>
                                            </div>
                                        
                                                        <table id="example" class="table">
                                                            <thead>
                                                                <tr class="headings">



                                                                    <th>GRN No</th>
                                                                    <th>GRN Date</th>
                                                                    <!--<th>PO No</th>-->

                                                                    <th>Vendor Name</th>
<!--                                                                    <th>Created By</th>-->
                                                                    <th>Purchase Type</th>
                                                                    <th>Actions</th>


                                                                </tr>
                                                            </thead>

                                                            <tbody>

                                                                <%--  <c:forEach items="${grnList}" var="list">
                                                                    <c:forEach items="${supplerDetails}" var="type">
                                                                        <c:if test="${list[4] eq type.supplierCode}">
                                                                            <c:set var="supplierName" value="${type.supplierName}"/>
                                                                            
                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <tr>
                                                                        <td class="center" style="width:10%;">${list[0]}</td>
                                                                        <td class="center" style="width:11%;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list[1]}"/></td>

                                                                        <td class="center"style="width:10%;">${list[2]}</td>
                                                                        <td class="center" style="width:27%;">${supplierName}</td>
                                                                        <td class="center"style="width:10%;">
                                                                           <a class="myButton15" href="../inventory/grnPrint.htm?grnNo=${list[0]}" target="newWindow">
                                                                               <i class="fa fa-print"> Print</i></a>                        


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
                "sAjaxSource": "../quality/paginationList.htm?listPage=grnList",
                "aoColumnDefs": [
                    {
                        "aTargets": [0],
                        "mRender": function (data, type, full) {
                            return full[0];

                        }

                    },
                    {
                        "aTargets": [1],
                        "mRender": function (data, type, full) {
                            return moment(full[1]).format('DD-MMM-YYYY');
                        }

                    },
//                                        {
//                                            "aTargets": [2],
//                                            "mRender": function (data, type, full) {
//                                                //return full[2];
//                                            }
//                                        },
                    {
                        "aTargets": [2],
                        "mRender": function (data, type, full) {
                            //return full[4];

                <c:forEach items="${supp}" var="type">
                            if (full[4] == '${type.supplierCode}')
                            {
                                return '${fn:escapeXml(type.supplierName)}';
                            }
                </c:forEach>
                            return '';


                        }

                    },
//                    {
//                        "aTargets": [4],
//                        
//                        "mRender": function (data, type, full) {
//                            return '';
//                        }
//
//                    },
                    {
                        "aTargets": [4],
                        "sWidth": "250px",
                        "mRender": function (data, type, full) {
                            return '<a class="fa fa-print fa-lg" data-bs-toggle="tooltip" data-bs-original-title="sdfghjk" onclick="Generate(\'' + full[0] + '\');" title="Print"> </a>\n\
                                         <a class="fa fa-plus-circle fa-lg" data-toggle="tooltip" onclick="Generate(\'' + full[0] + '\');" title="Add"></a>\n\
                                           <a class="fa fa-eye fa-lg" data-toggle="tooltip" onclick="Generate(\'' + full[0] + '\');" title="View"> </a>\n\
<a class="fa fa-envelope-open fa-lg" data-toggle="tooltip" onclick="Generate(\'' + full[0] + '\');" title="Post Entry"> </a>\n\
<a class="fa fa-money fa-lg" data-bs-toggle="tooltip" onclick="Generate(\'' + full[0] + '\');" title="Process Payment"> </a>';
                        }

                    },
                ],
            });
        });
            </script>












        </div>


        <div id="custom_notifications" class="custom-notifications dsp_none">
            <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
            </ul>
            <div class="clearfix"></div>
            <div id="notif-group" class="tabbed_notifications"></div>
        </div>
    
    </body>

</html>
