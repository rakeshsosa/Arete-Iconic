<%-- 
    Document   : table
    Created on : Feb 19, 2016, 5:44:26 PM
    Author     : Sudhanshu
--%>

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


    <body class="nav-md">

        <div class="container body">


            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>


                <!-- top navigation -->

                <!-- /top navigation -->

                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">

                        <div class="clearfix"></div>

                        <div class="row">

                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Invoice List</h2>

                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <table id="example" class="table table-striped responsive-utilities jambo_table">
                                            <thead>
                                                <tr class="headings">
                                                    <th>
                                                        <input type="checkbox" class="tableflat">
                                                    </th>
                                                    <th>Invoice </th>
                                                    <th>Invoice Date </th>
                                                    <th>Order </th>
                                                    <th>Bill to Name </th>
                                                    <th>Status </th>
                                                    <th>Amount </th>
                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                    </th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <tr class="even pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000040</td>
                                                    <td class=" ">May 23, 2014 11:47:56 PM </td>
                                                    <td class=" ">121000210 <i class="success fa fa-long-arrow-up"></i>
                                                    </td>
                                                    <td class=" ">John Blank L</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$7.45</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="odd pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000039</td>
                                                    <td class=" ">May 23, 2014 11:30:12 PM</td>
                                                    <td class=" ">121000208 <i class="success fa fa-long-arrow-up"></i>
                                                    </td>
                                                    <td class=" ">John Blank L</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$741.20</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="even pointer selected">
                                                    <td class="a-center ">
                                                        <input type="checkbox" checked class="tableflat">
                                                    </td>
                                                    <td class=" ">121000038</td>
                                                    <td class=" ">May 24, 2014 10:55:33 PM</td>
                                                    <td class=" ">121000203 <i class="success fa fa-long-arrow-up"></i>
                                                    </td>
                                                    <td class=" ">Mike Smith</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$432.26</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="odd pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000037</td>
                                                    <td class=" ">May 24, 2014 10:52:44 PM</td>
                                                    <td class=" ">121000204</td>
                                                    <td class=" ">Mike Smith</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$333.21</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="even pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000040</td>
                                                    <td class=" ">May 24, 2014 11:47:56 PM </td>
                                                    <td class=" ">121000210</td>
                                                    <td class=" ">John Blank L</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$7.45</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="odd pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000039</td>
                                                    <td class=" ">May 26, 2014 11:30:12 PM</td>
                                                    <td class=" ">121000208 <i class="error fa fa-long-arrow-down"></i>
                                                    </td>
                                                    <td class=" ">John Blank L</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$741.20</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="even pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000038</td>
                                                    <td class=" ">May 26, 2014 10:55:33 PM</td>
                                                    <td class=" ">121000203</td>
                                                    <td class=" ">Mike Smith</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$432.26</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="odd pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000037</td>
                                                    <td class=" ">May 26, 2014 10:52:44 PM</td>
                                                    <td class=" ">121000204</td>
                                                    <td class=" ">Mike Smith</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$333.21</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>

                                                <tr class="even pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000040</td>
                                                    <td class=" ">May 27, 2014 11:47:56 PM </td>
                                                    <td class=" ">121000210</td>
                                                    <td class=" ">John Blank L</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$7.45</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="odd pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000039</td>
                                                    <td class=" ">May 28, 2014 11:30:12 PM</td>
                                                    <td class=" ">121000208</td>
                                                    <td class=" ">John Blank L</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$741.20</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="even pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000040</td>
                                                    <td class=" ">May 23, 2014 11:47:56 PM </td>
                                                    <td class=" ">121000210 <i class="success fa fa-long-arrow-up"></i>
                                                    </td>
                                                    <td class=" ">John Blank L</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$7.45</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="odd pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000039</td>
                                                    <td class=" ">May 23, 2014 11:30:12 PM</td>
                                                    <td class=" ">121000208 <i class="success fa fa-long-arrow-up"></i>
                                                    </td>
                                                    <td class=" ">John Blank L</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$741.20</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="even pointer selected">
                                                    <td class="a-center ">
                                                        <input type="checkbox" checked class="tableflat">
                                                    </td>
                                                    <td class=" ">121000038</td>
                                                    <td class=" ">May 24, 2014 10:55:33 PM</td>
                                                    <td class=" ">121000203 <i class="success fa fa-long-arrow-up"></i>
                                                    </td>
                                                    <td class=" ">Mike Smith</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$432.26</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="odd pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000037</td>
                                                    <td class=" ">May 24, 2014 10:52:44 PM</td>
                                                    <td class=" ">121000204</td>
                                                    <td class=" ">Mike Smith</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$333.21</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="even pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000040</td>
                                                    <td class=" ">May 24, 2014 11:47:56 PM </td>
                                                    <td class=" ">121000210</td>
                                                    <td class=" ">John Blank L</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$7.45</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="odd pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000039</td>
                                                    <td class=" ">May 26, 2014 11:30:12 PM</td>
                                                    <td class=" ">121000208 <i class="error fa fa-long-arrow-down"></i>
                                                    </td>
                                                    <td class=" ">John Blank L</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$741.20</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="even pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000038</td>
                                                    <td class=" ">May 26, 2014 10:55:33 PM</td>
                                                    <td class=" ">121000203</td>
                                                    <td class=" ">Mike Smith</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$432.26</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="odd pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000037</td>
                                                    <td class=" ">May 26, 2014 10:52:44 PM</td>
                                                    <td class=" ">121000204</td>
                                                    <td class=" ">Mike Smith</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$333.21</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>

                                                <tr class="even pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000040</td>
                                                    <td class=" ">May 27, 2014 11:47:56 PM </td>
                                                    <td class=" ">121000210</td>
                                                    <td class=" ">John Blank L</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$7.45</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="odd pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000039</td>
                                                    <td class=" ">May 28, 2014 11:30:12 PM</td>
                                                    <td class=" ">121000208</td>
                                                    <td class=" ">John Blank L</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$741.20</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="even pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000040</td>
                                                    <td class=" ">May 23, 2014 11:47:56 PM </td>
                                                    <td class=" ">121000210 <i class="success fa fa-long-arrow-up"></i>
                                                    </td>
                                                    <td class=" ">John Blank L</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$7.45</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="odd pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000039</td>
                                                    <td class=" ">May 23, 2014 11:30:12 PM</td>
                                                    <td class=" ">121000208 <i class="success fa fa-long-arrow-up"></i>
                                                    </td>
                                                    <td class=" ">John Blank L</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$741.20</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="even pointer selected">
                                                    <td class="a-center ">
                                                        <input type="checkbox" checked class="tableflat">
                                                    </td>
                                                    <td class=" ">121000038</td>
                                                    <td class=" ">May 24, 2014 10:55:33 PM</td>
                                                    <td class=" ">121000203 <i class="success fa fa-long-arrow-up"></i>
                                                    </td>
                                                    <td class=" ">Mike Smith</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$432.26</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="odd pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000037</td>
                                                    <td class=" ">May 24, 2014 10:52:44 PM</td>
                                                    <td class=" ">121000204</td>
                                                    <td class=" ">Mike Smith</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$333.21</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="even pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000040</td>
                                                    <td class=" ">May 24, 2014 11:47:56 PM </td>
                                                    <td class=" ">121000210</td>
                                                    <td class=" ">John Blank L</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$7.45</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="odd pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000039</td>
                                                    <td class=" ">May 26, 2014 11:30:12 PM</td>
                                                    <td class=" ">121000208 <i class="error fa fa-long-arrow-down"></i>
                                                    </td>
                                                    <td class=" ">John Blank L</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$741.20</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="even pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000038</td>
                                                    <td class=" ">May 26, 2014 10:55:33 PM</td>
                                                    <td class=" ">121000203</td>
                                                    <td class=" ">Mike Smith</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$432.26</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="odd pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000037</td>
                                                    <td class=" ">May 26, 2014 10:52:44 PM</td>
                                                    <td class=" ">121000204</td>
                                                    <td class=" ">Mike Smith</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$333.21</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>

                                                <tr class="even pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000040</td>
                                                    <td class=" ">May 27, 2014 11:47:56 PM </td>
                                                    <td class=" ">121000210</td>
                                                    <td class=" ">John Blank L</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$7.45</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="odd pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000039</td>
                                                    <td class=" ">May 28, 2014 11:30:12 PM</td>
                                                    <td class=" ">121000208</td>
                                                    <td class=" ">John Blank L</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$741.20</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="even pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000040</td>
                                                    <td class=" ">May 23, 2014 11:47:56 PM </td>
                                                    <td class=" ">121000210 <i class="success fa fa-long-arrow-up"></i>
                                                    </td>
                                                    <td class=" ">John Blank L</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$7.45</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="odd pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000039</td>
                                                    <td class=" ">May 23, 2014 11:30:12 PM</td>
                                                    <td class=" ">121000208 <i class="success fa fa-long-arrow-up"></i>
                                                    </td>
                                                    <td class=" ">John Blank L</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$741.20</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="even pointer selected">
                                                    <td class="a-center ">
                                                        <input type="checkbox" checked class="tableflat">
                                                    </td>
                                                    <td class=" ">121000038</td>
                                                    <td class=" ">May 24, 2014 10:55:33 PM</td>
                                                    <td class=" ">121000203 <i class="success fa fa-long-arrow-up"></i>
                                                    </td>
                                                    <td class=" ">Mike Smith</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$432.26</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="odd pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000037</td>
                                                    <td class=" ">May 24, 2014 10:52:44 PM</td>
                                                    <td class=" ">121000204</td>
                                                    <td class=" ">Mike Smith</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$333.21</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="even pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000040</td>
                                                    <td class=" ">May 24, 2014 11:47:56 PM </td>
                                                    <td class=" ">121000210</td>
                                                    <td class=" ">John Blank L</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$7.45</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="odd pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000039</td>
                                                    <td class=" ">May 26, 2014 11:30:12 PM</td>
                                                    <td class=" ">121000208 <i class="error fa fa-long-arrow-down"></i>
                                                    </td>
                                                    <td class=" ">John Blank L</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$741.20</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="even pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000038</td>
                                                    <td class=" ">May 26, 2014 10:55:33 PM</td>
                                                    <td class=" ">121000203</td>
                                                    <td class=" ">Mike Smith</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$432.26</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="odd pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000037</td>
                                                    <td class=" ">May 26, 2014 10:52:44 PM</td>
                                                    <td class=" ">121000204</td>
                                                    <td class=" ">Mike Smith</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$333.21</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>

                                                <tr class="even pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000040</td>
                                                    <td class=" ">May 27, 2014 11:47:56 PM </td>
                                                    <td class=" ">121000210</td>
                                                    <td class=" ">John Blank L</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$7.45</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
                                                <tr class="odd pointer">
                                                    <td class="a-center ">
                                                        <input type="checkbox" class="tableflat">
                                                    </td>
                                                    <td class=" ">121000039</td>
                                                    <td class=" ">May 28, 2014 11:30:12 PM</td>
                                                    <td class=" ">121000208</td>
                                                    <td class=" ">John Blank L</td>
                                                    <td class=" ">Paid</td>
                                                    <td class="a-right a-right ">$741.20</td>
                                                    <td class=" last"><a href="#">View</a>
                                                    </td>
                                                </tr>
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
                    <!-- footer content -->
                    <footer>
                        <div class="">
                            <p class="pull-right">
                                <span class="lead"> <i class="fa fa-paw"></i> Al Jarwani</span>
                            </p>
                        </div>
                        <div class="clearfix"></div>
                    </footer>
                    <!-- /footer content -->

                </div>
                <!-- /page content -->
            </div>

        </div>

        <script>
            NProgress.done();
        </script>
    </body>

</html>
