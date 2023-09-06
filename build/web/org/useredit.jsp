
<%-- 
    Document   : userform
    Created on : Mar 18, 2016, 11:12:07 AM
    Author     : Sudhanshu
--%>

 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Arete Iconic</title>
        <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
    </head>


    <body class="nav-md">

                <jsp:include page="../login/menu.htm"/>
                <main id="main" class="main">
                            <div>
                                <jsp:include page="../login/headerlink.htm?submodule=User&tab=User&pagetype=form"/>
                              </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-title">
                                                </div>

                                    <form class="form-inline row" action="../login/usereditsubmit.htm" id="usereditForm">
                                        <%--<div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color:red">*</span> Organization Name</label>
                                            <c:forEach items="${userlist}" var="list">
                                                <input type="text" class="form-control  validate[required]" readonly="" value="${list.orgName}"  maxlength="60">
                                                <input type="hidden" class="form-control validate[required]" readonly="" name="pk" id="pk" value="${list.SNo}">
                                            </c:forEach>
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color:red">*</span> Department Name</label>
                                            <c:forEach items="${userlist}" var="list">
                                                <input type="text" class="form-control validate[required]" readonly="" value="${list.departmentName}"  maxlength="10">
                                            </c:forEach>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color:red">*</span> Role Name</label>
                                            <c:forEach items="${userlist}" var="list">
                                                <input type="text" class="form-control validate[required]" readonly="" value="${list.roleName}"  maxlength="50">
                                            </c:forEach>


                                        </div>
                                        <p>&nbsp;</p>--%>
                                        <div class="col-md-4 mb-3 form-floating">
                                            <c:forEach items="${userlist}" var="list">
                                                <input type="text" class="form-control validate[required]" readonly="" value="${list.userId}"  maxlength="50">
                                                <input type="hidden" class="form-control validate[required]" readonly="" name="pk" id="pk" value="${list.SNo}">
                                            </c:forEach>
                                            <label class="control-label"><span style="color:red">*</span> User Id</label>
                                        </div>
                                        <div class="col-md-4 mb-3 form-floating">
                                            
                                            <c:forEach items="${userlist}" var="list">
                                                <input type="text" class="form-control validate[required]" readonly="" value="${list.userFName}"  maxlength="60">
                                            </c:forEach>
                                            <label class="control-label"><span style="color:red">*</span> First Name</label>

                                        </div>
                                        <div class="col-md-4 mb-3 form-floating">
                                            <c:forEach items="${userlist}" var="list">
                                                <input type="text" class="form-control validate[required]" readonly="" value="${list.userLName}"  maxlength="60">
                                            </c:forEach>
                                            <label class="control-label"><span style="color:red">*</span> Last Name</label>
                                        </div>
                                        
                                        <div class="col-md-4 mb-3 form-floating">
                                            <c:forEach items="${userlist}" var="list">
                                                <input type="text" class="form-control validate[required]" readonly="" value="${password}"  maxlength="50">
                                            </c:forEach>
                                            <label class="control-label"><span style="color:red">*</span> Password</label>
                                        </div>
                                        
                                        <div class="col-md-4 mb-3 form-floating">
                                            <input type="text" placeholder="fill" class="form-control validate[required]" value="" id="password"  name="password" maxlength="50">
                                            <label class="control-label"><span style="color:red">*</span>New Password</label>
                                        </div>
                                        <div class="col-md-4 mb-32 form-floating">
                                            <input type="text" placeholder="fill" class="form-control validate[required]" id="rpassword" name="rpassword" onkeyup="check(this)" onchange="checkpassword();"  maxlength="50">
                                            <label class="control-label"><span style="color:red">*</span> Re-enter Password</label>
                                        </div>
                                        <%--<div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label">Store Name</label>
                                            <c:forEach items="${userlist}" var="list">
                                                <input type="text" class="form-control" readonly="" value="${list.storeName}"  maxlength="50">
                                            </c:forEach>


                                        </div>
                                        <p>&nbsp;</p>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label">Camp Name</label>
                                            <c:forEach items="${userlist}" var="list">
                                                <input type="text" class="form-control" readonly="" value="${list.campName}"  maxlength="50">
                                            </c:forEach>


                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label">Email</label>
                                            <c:forEach items="${userlist}" var="list">
                                                <input type="email" class="form-control" readonly="" value="${list.emailId}"  maxlength="50">
                                            </c:forEach>



                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label">Contact No</label>
                                            <c:forEach items="${userlist}" var="list">
                                                <input type="text" class="form-control" readonly="" value="${list.contactNo}"  maxlength="11">
                                            </c:forEach>


                                        </div>--%>
                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                            <button type="button" class="btn btn-primary" onclick="changePassword();">Change</button>
                                            <a href="../login/userlist.htm" class="btn btn-danger">Cancel</a>
                                        </div> 

                                    </form>
                                </div>
                                    </div>

                                </div>
                                </div>
                            </section>

                        </main>
        <div id="custom_notifications" class="custom-notifications dsp_none">
            <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group"></ul>
            <div class="clearfix"></div>
            <div id="notif-group" class="tabbed_notifications"></div>
        </div>

        <script>
            NProgress.done();
            function changePassword()
            {
                if (document.getElementById("password").value == "") {
                    alert("Please Enter Password");
                    return false;
                }
                else if (document.getElementById("rpassword").value == "") {
                    alert("Please Re-Enter Password");
                    return false;
                }
                else {                    
                    var sno = document.getElementById('pk').value;
                    var password = document.getElementById('password').value;
                    window.location.href = "../login/changePassword.htm?sno=" + sno + "&password=" + encodeURIComponent(password) + " ";
                }

            }
            function checkpassword() {
                if (document.getElementById('rpassword').value !== document.getElementById('password').value) {
                    //$('#rpassword').val("").setCustomValidity('Password Must be Matching.');
                    alert('Password Must be Matching.');
                    document.getElementById("rpassword").value = "";
                }
            }

            function isNumberKey(evt) {
                if (evt.which != 8 && evt.which != 0 && (evt.which < 48 || evt.which > 57))
                {
                    alert("Please enter numeric value..!!!");
                    return false;
                }
                return true;
            }

            $(document).ready(function () {
                jQuery("#usereditForm").validationEngine();
            });
        </script>
    </body>

</html>