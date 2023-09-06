<%-- 
    Document   : profile
    Created on : Feb 27, 2018, 10:36:23 AM
    Author     : EBS
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>
        <title>Arete Iconic</title>
        <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
        <style>
            .nowrap {
                white-space: nowrap;
            }
            .fixed-footer{
                width: 100%;
                position: fixed;        
                background: #333;
                padding: 10px 0;
                color: #fff;
            }

            .fixed-footer{
                bottom: 0;
            }
        </style>
    </head>

    <body class="nav-md">

        <jsp:include page="../login/menu.htm" />


                        <main id="main" class="main">

                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h5>Profile of ${userId}</h5>
                                                </div>
                                <div class="x_content">
                                    <c:set var="urslno" value="0"/>
                                    <br>
                                    <div class="col-md-5 col-sm-12 col-xs-12 form-inline">
                                        <!--<label class="control-label">Email Id : </label>-->
                                        <img src="../common/theme/images/admin2.png" class="img-responsive" alt="No Image" style="width: 218px; height: 220px; margin: 0px auto;"> 
                                        <c:forEach items="${userlist}" var="ulist">                                            
                                            <c:set var="urslno" value="${ulist.SNo}"/>
                                            <br>
                                            <br>
                                            <label class="control-label">Name : </label>
                                            <span>${ulist.userFName}${ulist.userLName}</span>                                             
                                            <br>
                                            <br>

                                        </c:forEach>
                                    </div>
                                    <div class="col-md-5 col-sm-12 col-xs-12 form-inline">
                                        <c:forEach items="${userlist}" var="ulist">
                                            <label class="control-label">Organisation : </label>
                                            <span>${ulist.orgName}</span>
                                            <br>
                                            <br>
                                            <label class="control-label">User ID : </label>
                                            <span>${ulist.userId}</span>
                                            <br>
                                            <br>
                                            <label class="control-label">Mobile No : </label>
                                            <span>${ulist.mobilenumber}</span>
                                            <br>
                                            <br>
                                            <label class="control-label">Email ID : </label>
                                            <span>${ulist.email}</span>
                                            <br>
                                            <br>                                             
                                            <label class="control-label">Role : </label>
                                            <span>${ulist.roleName}</span>

                                            <br>
                                            <br>
                                            <label class="control-label">Department : </label>
                                            <span>${ulist.departmentName}</span>

                                            <br>
                                            <br>
                                        </c:forEach>
                                    </div>


                                    <div class="col-md-8 col-sm-8 col-xs-12 col-md-offset-4"> 
                                        <p>&nbsp;</p>
                                        <a href="../login/userProfileEdit.htm"  class="btn btn-primary" ><i class="fa fa-user">Update Profile</i></a>
                                    </div>
                                </div>
                           </div>
                                        </div>

                                    </div>
                                </div>
                            </section>

                        </main><!-- End #main -->
                        <jsp:include page="../login/footer.jsp" />
    </body>

</html>

