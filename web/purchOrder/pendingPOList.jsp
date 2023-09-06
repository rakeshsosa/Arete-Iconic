<%-- 
    Document   : approvedPOList
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


    <body class="nav-sm" onload="sent();">
        <jsp:include page="../login/menu.htm"/>
             <jsp:include page="../login/footer.jsp"/>

        <main id="main" class="main">
            <div class="mt-3">
                <jsp:include page="../login/headerlink.htm?submodule=Purchase Order&tab=Pending Purchase Orders&pagetype=list"/>
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
                                                                    <!--                                                                    <th>Job Order No</th>-->
                                                                    <th>Purchase Order No</th>
                                                                    <th>Purchase Order Date</th>
                                                                    <th>Supplier Name</th>
                                                                    <th>Prepared By</th>   
                                                                    <th>Status</th>    
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>                                                                
                                                                <c:forEach items="${pendingpoList}" var="type">
                                                                    <tr class="even pointer">  
                                                                        <c:choose>
                                                                            <c:when test="${not empty type[6]}">
                                                                                <td>${type[6]}</td>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <td>${type[0]}</td>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                        <td class=" " style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${type[1]}"/></td>
                                                                        <td class=" " style="text-align: left;">${type[2]}</td>  
                                                                        <td class=" " style="text-align: left;">${type[3]}</td>
                                                                        <td class=" " style="text-align: left;">${type[5]}</td>
                                                                        <td class=" last" style="text-align:center;width: 300px;"> 
                                                                            <a class="fa fa-eye fa-lg" title="View" href="../purchase/approvedPOForm.htm?poNo=${type[0]}&action=view">                                                                                                                
                                                                            </a>                                                                       
                                                                            <a class="fa fa-edit fa-lg"  href="../purchase/poEditForm.htm?poNo=${type[0]}&action=edit" title="Amendment">
                                                                                <i class="" >
                                                                                </i>                                           
                                                                            </a>
                                                                            <input type="hidden" style="text-align:left;" id="${type[0]}" name="supplier" required="" class="form-control validate[required,custom[email]]" />
                                                                            <c:if test="${type[7] eq 'Resend Email'}">
                                                                                <a style="color: #FDDC54" class="fa fa-send fa-lg" onclick="openWindow('${type[0]}');" title="${type[7]}">
                                                                                    <i class="" >
                                                                                    </i>                                
                                                                                </a> 
                                                                            </c:if>
                                                                            <c:if test="${type[7] eq 'Send Email'}">
                                                                                <a class="fa fa-send fa-lg" onclick="openWindow('${type[0]}');" title="${type[7]}">
                                                                                    <i class="" >
                                                                                    </i>                                
                                                                                </a> 
                                                                            </c:if>
                                                                            <a class="fa fa-print fa-lg" target="_blank" class=""  href="../purchase/poEditForm.htm?poNo=${type[0]}&action=print" title="Print">
                                                                                <i class="" >
                                                                                </i>                                          
                                                                            </a>
                                                                            <a class="fa fa-trash fa-lg"  class=""  href="../purchase/approvedPOForm.htm?poNo=${type[0]}&action=Cancel" title="Cancel PO">
                                                                                <i class="" >
                                                                                </i>                                          
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


        <script>
            function sent() {
            <c:if test="${param.success eq true}">
                alert("Your mail has been sent successfully..!!!");
            </c:if>
            }
            function openWindow(id) {
                //            alert("Item not Available..!!");  href="../purchOrder/sendPOEmail.htm?poNo=${type[0]}&action=view"
                myWindow = window.open("../purchase/sendEmailpopup.htm?poNo=" + id + "&suppcode=sendEmail", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function sendEmail(poNo) {
                var suppEmail = $('#' + poNo).val();
                window.location.href = "../purchase/sendPOEmail.htm?poNo=" + poNo + "&suppEmail=" + suppEmail + "&action=applist";
            }
            NProgress.done();
        </script>
    </body>

</html>
