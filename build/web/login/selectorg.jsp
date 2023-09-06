
<%-- 
    Document   : selectorg
    Created on : Mar 22, 2016, 12:06:51 PM
    Author     : Sudhanshu
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>arête Assets Management</title>
        <link href="../common/theme/css/bootstrap.min.css" rel="stylesheet">

        <link href="../common/theme/fonts/css/font-awesome.min.css" rel="stylesheet">
        <link href="../common/theme/css/animate.min.css" rel="stylesheet">

        <!-- Custom styling plus plugins -->
        <link href="../common/theme/css/customCopy.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="../common/theme/css/maps/jquery-jvectormap-2.0.1.css" />
        <link href="../common/theme/css/icheck/flat/green.css" rel="stylesheet" />
        <link href="../common/theme/css/floatexamples.css" rel="stylesheet" type="text/css" />

        <script src="../common/theme/js/jquery.min.js"></script>
        <script src="../common/theme/js/nprogress.js"></script>
        <script>
            NProgress.start();
        </script>
        <style>
            img.hoverImages {
                margin:20px 0px 11px 4px;
                padding:40px;
                outline:2px solid #DDD;
                border:#a1a1a1;	
                float:left;
                -webkit-transition: margin 0.5s ease-out;
                -moz-transition: margin 0.5s ease-out;
                -o-transition: margin 0.5s ease-out;
            }

            img.hoverImages:hover {
                cursor:pointer;
                margin-top: 5px;
            }
            .hvr-grow{
                vertical-align: middle;
                transform: translateZ(0px);
                box-shadow: 0px 0px 1px transparent;
                backface-visibility: hidden;
                transition-duration: 0.3s;
                transition-property: transform;
            }
            .hvr-grow:hover, .hvr-grow:focus, .hvr-grow:active {
                transform: scale(1.1);
            }
            .part1 {
                background: transparent url("../images/silde-bg.png") repeat scroll 0% 0%;
                height: 168px;
                margin-top: 30px;
                border: 2px solid #1D82F5;
                margin-left:20px;
                width: 257px;
            }
            .part1 h3 {
                font-size: 14px;
                text-transform: uppercase;
                text-align: center;
                color: #3E3E3E;
                margin-top: 10px !important;
                font-weight: 500;
            }
            .bottam-part {
                width: 100%;
                height: auto;
                background: #656565 none repeat scroll 0% 0%;
                font-size: 13px;
                text-align: center;
                color: #FFF;
                padding: 7px 0px 6px;
            }
            .icon1 {
                width: 80%;
                height: auto;
                text-align: center;
                margin: 0px auto;
                padding: 10px 0px 20px;
                border-bottom: thin solid #1D82F5 ;
            }
            .icon2 {
                width: 80%;
                height: auto;
                text-align: center;
                margin: 0px auto;
                padding: 27px 0px 20px;
                border-bottom: thin solid #1D82F5 ;
            }
            .icon3 {
                width: 80%;
                height: auto;
                text-align: center;
                margin: 0px auto;
                padding: 22px 0px 20px;
                border-bottom: thin solid #1D82F5 ;
            }
            .icon4 {
                width: 80%;
                height: auto;
                text-align: center;
                margin: 0px auto;
                padding: 34px 0px 20px;
                border-bottom: thin solid #1D82F5 ;
            }

            .icon5 {
                width: 80%;
                height: auto;
                text-align: center;
                margin: 0px auto;
                padding: 35px 0px 26px;
                border-bottom: thin solid #1D82F5 ;
            }
            .bottam-part {
                width: 100%;
                height: auto;
                background: #2D8D64 none repeat scroll 0% 0%;
                font-size: 13px;
                text-align: center;
                color: #FFF;
                padding: 7px 0px 6px;
                font-family:calibri,verdana;
            }


        </style>
        <script>
            function forward() {
                var orgCode = document.getElementById("orgCode").value;
                window.location.href = '../login/fdashboard.htm?orgCode=' + orgCode + '';
//                window.location.href = '../login/fdashboardgraph.htm?orgCode=' + orgCode + '';
            }
        </script>
    </head>


    <body class="nav-md" onchange="setTimeout(forward(), 1);">

        <div class="top_nav">

            <div class="nav_menu">
                <nav class="" role="navigation">

                    <ul class="nav navbar-nav navbar-right">
                        <li class="">
                            <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                <img src="images/img.jpg" alt="">Welcome ${userId}
                                <span class=" fa fa-angle-down"></span>
                            </a>
                            <ul class="dropdown-menu dropdown-usermenu animated fadeInDown pull-right">
                                <li><a href="../login/logout.htm"><i class="fa fa-sign-out pull-right"></i> Log Out</a>
                                </li>
                            </ul>
                        </li>


                    </ul>
                </nav>
            </div>







            <div class="container" style="padding-top:120px;">
                <c:forEach items="${orglist}" var="list">
                    <a href="../login/fdashboard.htm?orgCode=${list.sno}-${list.orgCode}">

                        <div class="col-sm-6 col-md-3">
                            <div class="part1 hvr-grow">
                                <!--                                <div class="icon1"><img width="67" src="../common/theme/images/al_hasar.png"></div>-->
                                <h2 style="text-align: center">${list.orgCode}</h2><input type="hidden" value="${list.sno}-${list.orgCode}" id="orgCode">
                                <div class="bottam-part">${list.orgName}</div>

                            </div>
                        </div>
                    </a>
                </c:forEach> 
            </div>


        </div>                 
<!--<div class="fixed-footer" style="z-index: 11;">-->
            <div class="loginfooter" style="text-align:center; ">
                <div ><p style="color:#ffffff;text-align:center;margin:10px">Copyright ©. All Rights Reserved. Excel Business Solutions™</p></div>

            </div> 
<!--        </div>  -->
        <script src="../common/theme/js/bootstrap.min.js"></script>

        <!-- gauge js -->
        <script type="text/javascript" src="../common/theme/js/gauge/gauge.min.js"></script>
        <script type="text/javascript" src="../common/theme/js/gauge/gauge_demo.js"></script>
        <!-- chart js -->
        <script src="../common/theme/js/chartjs/chart.min.js"></script>
        <!-- bootstrap progress js -->
        <script src="../common/theme/js/progressbar/bootstrap-progressbar.min.js"></script>
        <script src="../common/theme/js/nicescroll/jquery.nicescroll.min.js"></script>
        <!-- icheck -->
        <script src="../common/theme/js/icheck/icheck.min.js"></script>
        <!-- daterangepicker -->
        <script type="text/javascript" src="../common/theme/js/moment.min.js"></script>
        <script type="text/javascript" src="../common/theme/js/datepicker/daterangepicker.js"></script>

        <script src="../common/theme/js/custom.js"></script>

        <!-- flot js -->
        <!--[if lte IE 8]><script type="text/javascript" src="../common/theme/js/excanvas.min.js"></script><![endif]-->
        <script type="text/javascript" src="../common/theme/js/flot/jquery.flot.js"></script>
        <script type="text/javascript" src="../common/theme/js/flot/jquery.flot.pie.js"></script>
        <script type="text/javascript" src="../common/theme/js/flot/jquery.flot.orderBars.js"></script>
        <script type="text/javascript" src="../common/theme/js/flot/jquery.flot.time.min.js"></script>
        <script type="text/javascript" src="../common/theme/js/flot/date.js"></script>
        <script type="text/javascript" src="../common/theme/js/flot/jquery.flot.spline.js"></script>
        <script type="text/javascript" src="../common/theme/js/flot/jquery.flot.stack.js"></script>
        <script type="text/javascript" src="../common/theme/js/flot/curvedLines.js"></script>
        <script type="text/javascript" src="../common/theme/js/flot/jquery.flot.resize.js"></script>

        <script type="text/javascript" src="../common/theme/js/maps/jquery-jvectormap-2.0.1.min.js"></script>
        <script type="text/javascript" src="../common/theme/js/maps/gdp-data.js"></script>
        <script type="text/javascript" src="../common/theme/js/maps/jquery-jvectormap-world-mill-en.js"></script>
        <script type="text/javascript" src="../common/theme/js/maps/jquery-jvectormap-us-aea-en.js"></script>                         

    </body>

</html>