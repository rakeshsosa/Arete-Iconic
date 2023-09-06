<%-- 
    Document   : LeadManagementListNew
    Created on : 17 Jun, 2016, 2:52:18 PM
    Author     : ebs-sdd05
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



                                        <jsp:include page="../login/headerlink.htm?submodule=Lead Management&tab=Lead Management&pagetype=list"/>



                                        <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="x_panel">
                                                    <div class="x_title">
                                                        <h2>Lead Management List</h2>

                                                        <a  class="successalert"  style="margin-left: 250px;color: blue;font-size: 17px;">

                                                            <% String x = request.getParameter("msg");
                                                                if (x != null) {
                                                                    out.print(x);
                                                                }
                                                            %>
                                                        </a>



                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <c:forEach items="${permission}" var="type">
                                                        <c:set var="add" value="${type.newEntry}"></c:set>
                                                        <c:set var="edit" value="${type.edit}"></c:set>
                                                        <c:set var="inactive" value="${type.inactive}"></c:set>
                                                        <c:set var="review" value="${type.review}"></c:set>
                                                        <c:set var="approve" value="${type.approve}"></c:set>
                                                    </c:forEach>
                                                    <div class="x_content">
                                                        <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                                            <thead>
                                                                <tr class="headings">
                                                                    <th>Lead Code</th>
                                                                    <th>Lead Name </th>
                                                                    <th>Lead Type </th>
                                                                    <th>Lead Record Status </th>

                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>

                                                                <c:set value="0" var="duplicate"/>  
                                                                <c:forEach items="${leadmanagmentListNew}" var="type">
                                                                    <c:if test="${type.leadCode != duplicate}">
                                                                        <tr>



                                                                            <td class="center" style="text-align: left;">${type.leadCode}</td>
                                                                            <td class="center" style="text-align: left;">${type.leadName}</td>
                                                                            <td class="center" style="text-align: left;">${type.leadType}</td>
                                                                            <td class="center" style="text-align: left;">${type.creationFrom}</td>




                                                                            <td class="center" style="">
                                                                                <a  href="../Lead/LeadManagementFormNew.htm?leadCode=${type.leadCode}&sno=${type.sno}&action=view" class="fa fa-eye fa-lg"title="View">

                                                                                </a>
                                                                                <c:if test="${type.recordStatus eq 'Lead Generated'}">
                                                                                    <c:if test="${edit eq 'y'}">
                                                                                        <a class="fa fa-pencil fa-lg" href="../Lead/LeadManagementFormEdit.htm?leadCode=${type.leadCode}&sno=${type.sno}&creationFrom=${type.creationFrom}&action=edit" title="Edit">

                                                                                        </a>
                                                                                    </c:if>
                                                                                </c:if>


                                                                                <c:if test="${type.recordStatus eq 'Lead Generated'}">
                                                                                    <a class="fa fa-refresh fa-lg" style="color: #f16689;"  href="../Lead/LeadConvertForm.htm?leadCode=${type.leadCode}&action=convert" title="Convert To Tenant">
                                                                                        <i class=""></i>  
                                                                                    </a>
                                                                                </c:if>
                                                                                <c:if test="${type.recordStatus eq 'Tenant Created'}">
                                                                                    <!--<a class="myButton6" >
                                                                                        <i class="fa"> Converted To Tenant</i>
                                                                                    </a>-->
                                                                                </c:if>

                                                                                <%-- <c:if test="${type.recordStatus eq 'Lead Generated' || type.recordStatus eq 'RentQuote Generated' }">--%>
                                                                                <c:if test="${type.recordStatus eq 'Lead Generated'  }">
                                                                                    <a class="fa fa-refresh fa-lg" style="color: #1b55e9;" href="../Lead/QuoteConvertForm.htm?leadCode=${type.leadCode}" title="Convert To RentQuote">
                                                                                        <i class=""></i>  
                                                                                    </a>
                                                                                </c:if>
                                                                                <c:if test="${type.recordStatus eq 'RentQuote Created' }">
                                                                                    <!--<a class="myButton6" >
                                                                                        <i class="fa"> Converted To RentQuote</i>
                                                                                    </a>-->
                                                                                </c:if>

                                                                                <%--<a class="myButton9" href="../CRM/sendLeadEmail.htm?leadCode=${type[3]}&email=${type[6]}&action=view" >--%>
                                                                                <!--                                                                                  <a class="myButton9" href="../CRM/sendLeadEmail.htm" >
                                                                                                                                                                       <i class="fa fa-send" >
                                                                                                                                                                           Send Email</i>
                                                                                                                                                                   </a>-->
                                                                                <!--                                                                                <a style="color: #FDDC54" class="myButton11" onclick="sendEmail('${list.tenantCode}','${list.tenantMailid}');" >
                                                                                                                                                            <i class="fa fa-send" >
                                                                                                                                                                Send Email  </i>                                
                                                                                                                                                        </a> -->


                                                                            </td>   


                                                                        </tr>
                                                                        <c:set value="${type.leadCode}" var="duplicate"/>
                                                                    </c:if>


                                                                </c:forEach> 

                                                            </tbody>

                                                        </table>
                                                    </div>
                                                </div>
                                            </div>

                                            <br />
                                            <br />
                                            <br />

                                        </div>
                                    </div>


                                </div>
                                <!-- /page content -->
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
                                            'aTargets': [4]
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


