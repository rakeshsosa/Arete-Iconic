<%-- 
    Document   : tenantCategoryList
    Created on : Mar 4, 2016, 10:42:18 AM
    Author     : Shweta s
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link href="../common/theme/css/disableSelection.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>arête Assets Management</title>

        <!-- Bootstrap core CSS -->
        <script>
//            function print(type)
//            {
//                var receiptNo = document.getElementById("receiptNo1").value;
//                //var val = val;
//                alert("receiptNo"+receiptNo);
//                //alert("val" + val);
//                var format = "PDF";
//
//                if (format != "null" && format != "") {
//                    // var start1 = receiptNo.split("-");
//                    //alert("start1" + start1);
//
//                    if (format == "PDF") {
//                        if (type == "receiptPrint")
//                        {
//                            var url = '../reports/areteReportData.htm?format=' + format + '&reportid=' + 'receiptPrint' + '&receiptNo=' + receiptNo + '';
//                            window.open(url, '_blank');
//                            window.focus();
//                        }
//                        else if (type == "chequeBoundsPrint")
//                        {
//                            var url = '../reports/areteReportData.htm?format=' + format + '&reportid=' + 'chequeBoundsPrint' + '&receiptNo=' + receiptNo + '';
//                            window.open(url, '_blank');
//                            window.focus();
//                        }
//                    }
//
//
//                }
//            }
            function voidRecord(SNo)
            {
                if (confirm('Do you really want to Void this Receipt and Invoice records?')) {
                    //alert("Hiii");
                    window.location.href ='../tenant/billPaymentFormVoid.htm?sno='+SNo+'';
                }
            }
            

        </script>

    </head>


    <body class="nav-md">
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
                                        <jsp:include page="../login/headerlink.htm?submodule=Receipt&tab=Receipt&pagetype=list"/>
                                        <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="x_panel">
                                                    <div class="x_title">
                                                        <h2>Receipt List</h2>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="x_content">
                                                        <table id="example" class="table table-striped responsive-utilities jambo_table">
                                                            <thead>

                                                                <tr class="headings">
                                                                    <th>Receipt No</th>
                                                                    <th>Receipt Date</th>
                                                                    <th>Receipt Type</th>
                                                                    <th>Property Name</th>
                                                                    <th>Tenant Code</th>
                                                                    <th>Tenant Name</th>
                                                                    <th>Mode of Payment</th>
                                                                    <th>Cheque Type</th>
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                <c:forEach items="${billPayment}" var="list">
                                                                    <%--<c:forEach items="${assetDetails}" var="type">
                                                                        <c:forEach items="${tenantDetails}" var="mode">
                                                                            <c:if test="${list.assetName eq type.assetCode}">
                                                                                <c:if test="${list.tenantCode eq mode.tenantCode}">--%>
                                                                    <c:set var="receiptNo" value="${list.receiptNo}"></c:set>
                                                                        <tr class="even pointer">                                                                   
                                                                            <td class=" " style="text-align: left;">${list.receiptNo}</td>
                                                                    <!--<input type="text" id="receiptNo" value="${list.receiptNo}"/>-->
                                                                        <td class=" " style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.receiptDate}"/></td>
                                                                        <td class=" " style="text-align: left;">${list.receiptType}</td>
                                                                        <td class=" " style="text-align: left;">${list.assetName}</td>
                                                                        <td class=" " style="text-align: left;">${list.tenantCode}</td>
                                                                        <td class=" " style="text-align: left;">${list.tenantName}</td>
                                                                        <td class=" " style="text-align: left;">${list.modeOfPayment}</td>

                                                                        <td class=" " style="text-align: left;">${list.extra1}</td>
                                                                        <td class=" last" style="width: 250px;text-align: center;">
                                                                            <a href="../tenant/billPaymentForm.htm?pk=${list.SNo}&tenantCode=${list.tenantCode}&flotNo=${list.flotNo}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;
                                                                            <%--<c:if test="${list.modeOfPayment eq 'Cheque' && (list.extra3 eq '' || list.extra3 eq null)}">--%>
                                                                            <a href="../tenant/billPaymentForm.htm?pk=${list.SNo}&tenantCode=${list.tenantCode}&flotNo=${list.flotNo}&action=edit" class="fa fa-pencil fa-lg"title="Edit" ></a>&nbsp;
                                                                            
                                                                            
                                                                             <c:if test="${list.modeOfPayment eq 'Cheque'}">
                                                                                 <a class="fa fa-print fa-lg" target="_blank" href="../reports/areteReportData.htm?format=PDF&reportid=receiptPrint&receiptNo=${list.receiptNo}" title="Print">
                                                                                <i class=""> </i></a>&nbsp;
                                                                             </c:if>
                                                                                
                                                                                <c:if test="${list.modeOfPayment eq 'Cash'}">
                                                                            <a class="fa fa-print fa-lg" target="_blank" href="../reports/areteReportData.htm?format=PDF&reportid=receiptPrint2&receiptNo=${list.receiptNo}" title="Print">
                                                                                <i class=""> </i></a>&nbsp;
                                                                             </c:if>
                                                                                
                                                                                
                                                                                <%--</c:if>--%>
<!--                                                                            <a class="fa fa-lg fa-ban" href="../tenant/billPaymentFormVoid.htm?sno=${list.SNo}&action=void&receiptNo=${list.receiptNo}&tenantCode=${list.tenantCode}&propertyName=${list.assetName}&receiptDate=${list.receiptDate}&invoiceNo=${list.invoiceNumber}"  onclick="
                                                                            
                                                                                if (confirm('Do you really want to Void this Receipt and Invoice records?')) {
                                                                                    return true;
                                                                                } else {
                                                                                    return false;
                                                                                }
                                                                            "title="Void">
                                                                            </a>&nbsp;-->
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                 <a class="fa fa-lg fa-ban" onclick="voidRecord(${list.SNo});" title="Void">
                                                                                <i class=""> </i></a>
                                                                                            &nbsp;
                                                                            <c:if test="${list.modeOfPayment eq 'Cheque'}">
                                                                                <a class="fa fa-print fa-lg" target="_blank" href="../reports/areteReportData.htm?format=PDF&reportid=chequeBoundsPrint&receiptNo=${list.receiptNo}" title="Notification for bounced cheque Print">
                                                                                    <i class=""> </i></a>
                                                                                </c:if>
                                                                                            
                                                                                
                                                                                         
                                                                        </td>
                                                                    </tr>
                                                                    <%--</c:if> 
                                                                </c:if> 
                                                            </c:forEach>
                                                        </c:forEach>--%>
                                                                </c:forEach>

                                                            </tbody>

                                                        </table>
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

            <!-- Datatables -->
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
                                                                                        'aTargets': [8]
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
