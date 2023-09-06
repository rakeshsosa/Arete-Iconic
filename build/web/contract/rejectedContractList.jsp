<%-- Document : assetDetailsList Created on : Sep 15, 2016, 10:42:18 AM Author : Kondal Reddy N --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
        <!-- Bootstrap core CSS -->


    </head>


    <body class="nav-md">
        <jsp:include page="../login/menu.htm" />
        <jsp:include page="../login/footer.jsp" />

        <main id="main" class="main">
            <div class="mt-3">
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>
                <ul class="nav nav-pills">
                    <li class="nav-item">
                        <a class="nav-link " href="../insurance/contractCreationList.htm">Contract Creation</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link  " href="../insurance/contractApprovalList.htm">Pending Approval</a>
                    </li>
                    <!--                                        <li class="nav-item">
                                                              <a class="nav-link" href="../insurance/contractApprove2List.htm">Approval 2</a>
                                                            </li>-->
                    <li class="nav-item">
                        <a class="nav-link " href="../insurance/approvedContraList.htm">Approved Contract List</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="../insurance/rejectedContractList.htm">Rejected Contract List</a>
                    </li>
<!--                    <li class="nav-item">
                        <a class="nav-link" href="../insurance/expiredContractList.htm">Expired Contracts</a>
                    </li>-->
                </ul>
                <br>
                
            </div>
        </div>
        <div class="pagetitle">

        </div><!-- End Page Title -->
        <section class="section">
            <div class="row">
                <div class="col-lg-12">

                    <div class="card">

                        <div class="card-body">
                            <div class="card-title">
                                <!--                                                <h5>Units Contract Template List</h5>-->
                            </div>
                            <!-- Table with stripped rows -->

                            <div class="table-responsive">
                                <table class="table datatable table-hover table-bordered">
                                   <thead>

                                                                <tr class="headings">
                                                                    <th>Contract Code</th>
                                                                    <th>Contract Reject Remark</th>
                                                                    <th>Contract Start Date</th>
                                                                    <th>Contract End Date</th>
                                                                    <th>Contract Renewal Date</th>
                                                                    <th>Contract Status</th>
<!--                                                                    <th class=" no-link last"><span class="nobr">Action</span>-->
                                                                    </th>
                                                                </tr>
                                                            </thead>


                                    <tbody>

                                                                <c:forEach items="${contCreat}" var="list">
                                                                    <tr class="even pointer">                                                                   
                                                                        <td style="text-align: left;">${list.contractode}</td>
                                                                        <td style="text-align: left;">${list.rejectRemark}</td>
                                                                        <td style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.startDate}"/></td>
                                                                        <td style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.endDate}"/></td>
                                                                        <td style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.renewalDate}"/></td>
                                                                        <td style="text-align: left;">${list.status}</td>
<!--                                                                        <td style="">
                                                                            <a href="../insurance/rejectedContractView.htm?contractCode=${list.contractode}" class="fa fa-eye fa-lg"title="View"></a>&nbsp; 
                                                                        </td>-->
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

    <!--                     <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
            <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha256-bqVeqGdJ7h/lYPq6xrPv/YGzMEb6dNxlfiTUHSgRCp8=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css">
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
    <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
    <script type="text/javascript">
        tippy('#information', {
            content: '<p>Create, Search, View, Edit, Approve and Renew the Contract Code, Municipal Agreement Number, Property Name & Number, Contract Period, Renewal Date, and Approval Status. </p>\n\
         ',
            allowHTML: true,
            hideOnClick: true,
            trigger: 'click',
            onShow: function (reference) {
                setTimeout(function () {
                    reference.hide();
                    reference.reference.blur(); // for a second touch opening, lose focus
                }, 30000);
            }
        });
    </script>

     <script src="../common/theme/js/datatables/js/jquery.dataTables.js"></script>

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
                                'bSortable': false,
                                'aTargets': [5]
                            } //disables sorting for column one
                        ],
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
            <script>
                NProgress.done();
            </script>
      
        

</body>

</html>