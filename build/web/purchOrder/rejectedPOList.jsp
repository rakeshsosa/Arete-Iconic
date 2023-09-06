<%-- 
    Document   : rejctedPOList
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
                <jsp:include page="../login/headerlink.htm?submodule=Purchase Order&tab=Rejected Purchase Orders&pagetype=list"/>
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
                                                        <table id="example" class="table datatable table-bordered table-hover">
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
                                                                <td style="width:13%;">${type[3]}</td>                                                                                                                                                    
                                                                <td class=" last" style="width:10%;"><!--                                                                                                                                    -->
                                                                    <a class="fa fa-eye fa-lg"title="View"  href="../purchase/rejectedPOView.htm?poNo=${type[0]}&action=edit">
                                                                                                                      
                                                                    </a>                                                                          

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
                        'aaSorting': [[1, 'desc']],
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
