<%-- 
    Document   : purchaseRequiList
    Created on : 5 Oct, 2016, 4:49:44 PM
    Author     : shweta S SAkri
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
            tbody tr td{
                text-align: left !important;
            }
        </style>

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
                                        <jsp:include page="../login/headerlink.htm?submodule=Purchase Requisition&tab=Purchase Requisition&pagetype=list"/>
                                        <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="x_panel">
                                                    <div class="x_title">
                                                        <h2>Requisition List</h2>
                                                        <div class="clearfix"></div>
                                                    </div>

                                                    <div class="x_content">
                                                        <table id="example" class="jquerydatatable table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                                            <thead>
                                                                <tr class="headings"> 
                                                                    <th style="width:11%;">Requisition No</th>
                                                                    <th style="width:11%;">Requisition Date</th>
                                                                    <!--<th>Project Code</th>-->
                                                                    <!--<th>Item Code</th>-->
                                                                    <th style="width:25%;">Requestor Name</th>                                                                    
                                                                    <th style="width:16%;">Status</th>
                                                                    <th class=" no-link last" style="width:12%;"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>

                                                                <c:forEach items="${purchReqList}" var="type">
                                                                    <tr>
                                                                        <td style="text-align: left;">${type[0]}</td>
                                                                        <td style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${type[1]}"/></td>
                                                                        <td style="text-align: left;">${type[4]}</td>
                                                                        <td style="text-align: left;">${type[7]}</td>   
                                                                        <td class="  " style="text-align: left;">
                                                                            <a href="../purchase/purchRequiView.htm?reqNo=${type[0]}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;

<!--                                                                            <a class=" " href="../purchase/purchRequiView.htm?reqNo=${type[0]}&action=view" >
                                                                                <i class=" " >
                                                                                    View</i>                                            
                                                                            </a> -->
                                                                            <c:if test="${type[7] == 'Recheck' or type[7] == 'Need Review'}">
                                                                                <a  class="fa fa-pencil fa-lg" href="../purchase/purchRequiEdit.htm?reqNo=${type[0]}&action=edit" title="Edit"></a>                                                                                  

                                                                                <a class="fa  fa-times-rectangle-o fa-lg" title="Inactive"  href="../purchase/purchReqDel.htm?reqNo=${type[0]}" onclick="if (confirm('Do you really want to inactive this record?')) {
                                                                                            return true;
                                                                                        } else {
                                                                                            return false;
                                                                                        }">

                                                                                </a>
                                                                            </c:if>
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


                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>


            <script src="../common/theme/pagination/jquery.dataTables.min.js"></script>           
            <script>
//                $(document).ready(function () {
//                    $('input.tableflat').iCheck({
//                        checkboxClass: 'icheckbox_flat-green',
//                        radioClass: 'iradio_flat-green'
//                    });
//                });

//                var asInitVals = new Array();
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
                                                                                            "sAjaxSource": "../purchase/purReqPaginationList.htm?fromDate=${fromDate}&toDate=${toDate}&status=${status}",
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
                                                                                                        return moment(data).format('DD-MMM-YYYY');
                                                                                                    }

                                                                                                },
                                                                                                {
                                                                                                    "aTargets": [2],
                                                                                                    "mRender": function (data, type, full) {

                                                                                                        return full[4];
                                                                                                    }

                                                                                                },
                                                                                                {
                                                                                                    "aTargets": [3],
                                                                                                    "sWidth": "200px",
                                                                                                    "mRender": function (data, type, full) {
                                                                                                        if (full[7] == 'MI Requested' || full[7] == 'Store Reviewed')
                                                                                                        {
                                                                                                            return 'Store Reviewed';
                                                                                                        } else
                                                                                                        {
                                                                                                            return full[7];
                                                                                                        }

                                                                                                    }

                                                                                                },
                                                                                                {
                                                                                                    "aTargets": [4],
                                                                                                    "sWidth": "320px",
                                                                                                    "mRender": function (data, type, full) {


                                                                                                        if (full[8] == 'Inactive') {

                                                                                                            return '<div style="text-align: left;"><a class="fa fa-eye fa-lg" href="../purchase/purchRequiView.htm?reqNo=' + full[0] + '&action=view" title="View" > \n\
                                             </a>\n\
                                             </a> <a  class="fa fa-check-square-o fa-lg" class=""  href="../purchase/purchReqActive.htm?reqNo=' + full[0] + '" onclick="return confrm1();"title="Active">\n\
                                              </div>';

                                                                                                        } else {

                                                                                                            if (full[7] == 'Recheck' || full[7] == 'Need Review')
                                                                                                            {
                                                                                                                return '<div style="text-align: left;"><a class="fa fa-eye fa-lg" href="../purchase/purchRequiView.htm?reqNo=' + full[0] + '&action=view" title="View" > \n\
                                             </a>\n\
                                            <a style=""class="fa fa-pencil fa-lg"  href="../purchase/purchRequiEdit.htm?reqNo=' + full[0] + '&action=edit" title="edit">  \n\
                                            </a> <a  class="fa  fa-times-rectangle-o fa-lg" class=""  href="../purchase/purchReqDel.htm?reqNo=' + full[0] + '" onclick="return confrm();"title="Inactive">\n\
                                             \n\
                                             </a> <a class="fa fa-print fa-lg" target="_blank"   href="../purchase/purchRequiView.htm?reqNo=' + full[0] + '&action=print" title="Print"></a></div>';
                                                                                                            } else
                                                                                                            {
                                                                                                                return '<div style=""><a class="fa fa-eye fa-lg" href="../purchase/purchRequiView.htm?reqNo=' + full[0] + '&action=view" title="View"> \n\
                                             </a>\n\
                                            <a class="fa fa-print fa-lg" target="_blank"   href="../purchase/purchRequiView.htm?reqNo=' + full[0] + '&action=print" title="Print"></a></div>';
                                                                                                            }

                                                                                                        }


                                                                                                    },
                                                                                                },
                                                                                            ],
                                                                                        });
                                                                                    });
                                                                                    function confrm() {
                                                                                        if (confirm('Do you really want to inactive this record?')) {
                                                                                            return true;
                                                                                        } else {
                                                                                            return false;
                                                                                        }
                                                                                    }
                                                                                    function confrm1() {
                                                                                        if (confirm('Do you really want to active this record?')) {
                                                                                            return true;
                                                                                        } else {
                                                                                            return false;
                                                                                        }
                                                                                    }
            </script>

            <script>
                NProgress.done();
            </script>
    </body>

</html>
