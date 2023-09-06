<%-- 
    Document   : storeRevList
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
        <style>
            tbody tr td{
                text-align: left !important;
            }
        </style>
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
                                        <jsp:include page="../login/headerlink.htm?submodule=Purchase Requisition&tab=Store Review&pagetype=list"/>

                                        <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="x_panel">
                                                    <div class="x_title">
                                                        <h2>Requisition for Store Review</h2>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="x_content">
                                                        <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                                            <thead>
                                                                <tr class="headings">                                                    
                                                                    <th>Organisation Code</th>
                                                                    <th>Requisition No</th>
                                                                    <th>Requisition Date</th>
                                                                    <th>Requestor Name</th> 
                                                                    <th>Status</th>
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                <c:forEach items="${purchReqList}" var="type">
                                                                    <tr>  
                                                                        <td class="center" style="width:10%;text-align: left;">${orgCode}</td>
                                                                        <td class="center" style="width:10%;text-align: left;">${type[0]}</td>
                                                                        <td class="center" style="width:10%;text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${type[1]}"/></td>
                                                                        <td class="center" style="width:10%;text-align: left;">${type[4]}</td>  
                                                                        <td class="center" style="width:10%;text-align: left;">${type[7]}</td> 
                                                                        <td class="center" style="width:10%;text-align: left;">
                                                                            <a class="fa fa-check-circle-o fa-lg" title="Need Review" style="color: green;" href="../purchase/reviewInventory.htm?reqNo=${type[0]}">
                                                                                </a>
<!--                                                                            <a class="fa fa-check-circle-o fa-lg" style="color: green;"  href="../purchase/reviewInventory.htm?reqNo=${type[0]}">
                                                                                <i class="fa fa-history" >
                                                                                    Review Inventory </i>                                        
                                                                            </a>-->
                                                                        </td>                                                                       
                                                                    </tr>
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



                                        <!-- Datatables -->
                                        <!--<script src="../common/theme/js/datatables/js/jquery.dataTables.js"></script>-->
                                        <script src="../common/theme/pagination/jquery.dataTables.min.js"></script>

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
                                                    "sAjaxSource": "../purchase/storeRevPaginationList.htm",
                                                    "aoColumnDefs": [
                                                        {
                                                            "aTargets": [0],
                                                            "mRender": function (data, type, full) {
                                                                return '${orgCode}';
                                                            }

                                                        },
                                                        {
                                                            "aTargets": [1],
                                                            "mRender": function (data, type, full) {
                                                                return full[0];
                                                            }

                                                        },
                                                        {
                                                            "aTargets": [2],
                                                            "mRender": function (data, type, full) {
                                                                return moment(full[1]).format('DD-MMM-YYYY');
                                                            }
                                                        },
                                                        {
                                                            "aTargets": [3],
                                                            "sWidth": "200px",
                                                            "mRender": function (data, type, full) {
                                                                return full[4];
                                                            }

                                                        },
                                                        {
                                                            "aTargets": [4],
                                                            "sWidth": "200px",
                                                            "mRender": function (data, type, full) {
                                                                return full[7];
                                                            }

                                                        },
                                                        {
                                                            "aTargets": [5],
                                                            "sWidth": "280px",
                                                            "mRender": function (data, type, full) {

                                                                return '<a class="fa fa-history fa-lg"   href="../purchase/reviewInventory.htm?reqNo=' + full[0] + '" title="Review Inventory"></a>';

                                                            },
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
