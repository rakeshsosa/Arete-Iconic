<%-- 
    Document   : comparedQuotList
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
                                        <jsp:include page="../login/headerlink.htm?submodule=Supplier Quotation&tab=Compared Quotation&pagetype=list"/>

                                        <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">

                                                <div class="x_title">
                                                    <h2>Compared Quotation</h2>

                                                    <div class="clearfix">


                                                    </div>
                                                </div>
                                                <div class="x_content">                                      
                                                    <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                                        <thead>
                                                            <tr class="headings"> 
<!--                                                                <th>Division Name</th>-->
                                                                <th>Requisition No</th>                                                    
                                                                <th>Quotation No</th>
                                                                <th>Quotation Date</th> 
                                                                <!--<th>Supplier Name</th>--> 
                                                                <th class=" no-link last"><span class="nobr">Action</span>
                                                                </th>
                                                            </tr>
                                                        </thead>

                                                        <tbody>
                                                            <c:forEach items="${quotList}" var="type">
                                                                <tr>                                                       
<!--                                                                    <td style="width:15%;">${type[0]}</td>                                                         -->
                                                                    <td style="width:11%;">${type[1]}</td>
                                                                    <td style="width:11%;">${type[2]}</td>
                                                                    <td style="width:11%;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${type[3]}"/></td>  
                                                                    <!--<td>${type[4]}</td>-->   
                                                                    <td style="width:16%;">                                                                         
                                                                        <a class="fa fa-eye fa-lg " title="View" href="../purchase/comparedQuotForm.htm?reqNo=${type[1]}&quotNo=${type[2]}&enqNo=${type[8]}&action=view">                                                                                                                   
                                                                        </a>  
                                                                        <a class="fa fa-check-circle-o fa-lg" style="color: green;" href="../purchase/comparedQuotForm.htm?reqNo=${type[1]}&quotNo=${type[2]}&enqNo=${type[8]}&action=edit" title="Approve">
                                                                            <i class="" >
                                                                             </i>                                          
                                                                        </a>  
                                                                    </td> 



                                                                    <!--                                                        <td>                                                                                                              
                                                                                                                                <a class="btn btn-primary"  target="newWindow" href="../purchReq/supplierEnqList.htm?enqNo=${type[2]}&action=view" >
                                                                                                                                    <i class="fa fa-search-plus" ></i>
                                                                                                                                    View                                            
                                                                                                                                </a>  
                                                                                                                            </td>      -->
                                                                </tr>
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
                            'bSortable': true,
                            'aTargets': [0]
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
<!-- /page content -->
</div>

</div>

<script>
    NProgress.done();
</script>
</body>

</html>
