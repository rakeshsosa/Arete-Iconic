<%-- 
    Document   : navbar
    Created on : Feb 23, 2016, 3:28:35 PM
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



                                        <ul class="nav nav-tabs">
                                            <li class="active"><a data-toggle="tab" href="#tech2"><span style="color:black;font-family:calibri,verdana;font-size:14px;font-weight:700;">FORM 1</span></a></li>
                                            <li><a href="navbar.html"><span style="color:black;font-family:calibri,verdana;font-size:14px;font-weight:700;">FORM 2</span></a></li>
                                            <li><a data-toggle="tab" href="navbar.html"><span style="color:black;font-size:14px;">FORM 3</span></a></li>
                                            <li><a data-toggle="tab" href="navbar.html"><span style="color:black;font-size:14px;">FORM 4</span></a></li>
                                            <li><a data-toggle="tab" href="navbar.html"><span style="color:black;font-size:14px;">FORM 5</span></a></li>
                                            <li><a data-toggle="tab" href="navbar.html"><span style="color:black;font-size:14px;">FORM 6</span></a></li>
                                            <li><a data-toggle="tab" href="navbar.html"><span style="color:black;font-size:14px;">FORM 7</span></a></li>
                                            <li><a data-toggle="tab" href="navbar.html"><span style="color:black;font-family:calibri,verdana;font-size:14px;">FORM 8</span></a></li>
                                            <li><a data-toggle="tab" href="navbar.html"><span style="color:black;font-family:calibri,verdana;font-size:14px;">FORM 9</span></a></li>


                                        </ul>
                                        <BR/>

                                        <button type="button" class="btn btn-success" style="float:right;"><a href="form.html">+ ADD NEW RECORD</a></button>





                                        <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="x_panel">
                                                    <div class="x_title">
                                                        <h2>Daily active users <small>Sessions</small></h2>

                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="x_content">
                                                        <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
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
                                                                    <td class=" last"><a href="#">View</a></td>
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
