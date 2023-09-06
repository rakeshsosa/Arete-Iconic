
<%-- 
    Document   : userform
    Created on : Mar 18, 2016, 11:12:07 AM
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
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Arete Iconic</title>
        <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
    </head>


    <body class="nav-sm">

                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->
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
                                    <c:forEach items="${userlist}" var="list">
                                        <c:set var="pk" value="${list.SNo}" />
                                        <c:set var="orgId" value="${list.orgId}" />
                                        <c:set var="orgName" value="${list.orgName}" />
                                        <c:set var="userId" value="${list.userId}" />
                                        <c:set var="userFName" value="${list.userFName}" />
                                        <c:set var="userLName" value="${list.userLName}" />
                                        <c:set var="departmentName" value="${list.departmentName}" />
                                        <c:set var="roleName" value="${list.roleName}" />
                                        <c:set var="emailId" value="${list.email}" />
                                        <c:set var="mobilenumber" value="${list.mobilenumber}" />
                                        <script type="text/javascript">
                                            $(document).ready(function () {


                                                var nFields = document.getElementsByClassName('x_panel')[0].getElementsByTagName('input');
                                                for (i = 0; i < nFields.length; i++)
                                                {
                                                    debugger;
                                                    if (!(nFields[i].readOnly)) {
                                                        //console.log("ss" +readOnlyAttr);
                                                        //$(nFields[i]).css("border-color", "red");
                                                        $(nFields[i]).focus(function () {
                                                            debugger;
                                                            //alert('hi');
                                                            $(this).css("border-color", "red");
                                                            //$(this).attr("style", "border-color red !important");
                                                        });
                                                    }
                                                }


                                            });
                                        </script>

                                    </c:forEach>

                                    <form class="form-inline row" action="../login/usersubmit.htm"  id="userform">
                                        <div class="col-md-4 mb-3 form-floating">
                                            <input type="text" class="form-control validate[required]" name="orgaName" id="orgaName" maxlength="98" onchange="dept(this.value)" readonly value="${orgName}">
                                            <input type="hidden" value="${pk}" name="pk">
                                            <input type="hidden" value="${password}" id="password" name="password">
                                            <c:forEach items="${orglist}" var="type">
                                                <input type="hidden" value="${type.orgName}-${type.sno}" name="orgName">
                                            </c:forEach>
                                            <label class="control-label"><span style="color:red">*</span> Organization Name</label>


                                            <%--<c:forEach items="${orglist}" var="list"><option value="${list.orgCode}-${list.sno}">${list.orgCode}</option>
                                                <c:set var="flag" value="0"/>
                                                <c:forEach items="${userlist}" var="list1">
                                                    <c:if test="${list.orgCode eq list1.orgName}">
                                                        <c:set var="flag" value="1"/>
                                                    </c:if>
                                                </c:forEach>
                                                <c:if test="${flag eq '1'}">
                                                    <option value="${list.orgCode}-${list.sno}" selected="">${list.orgCode}</option>
                                                </c:if>
                                                <c:if test="${flag eq '0'}">
                                                    <option value="${list.orgCode}-${list.sno}">${list.orgCode}</option>
                                                </c:if>

                                                </c:forEach>--%>
                                            <!--</select>-->


                                        </div>

                                        <div class="col-md-4 mb-3 form-floating">
                                            
                                            <input type="hidden" class="form-control" name="deptCode1" id="deptCode1" value="${departmentName}" >

                                            <!--<input type="text" class="form-control validate[required]" id="deptCode" name="deptCode" readonly="" value="${departmentName}" onclick="getDeptCode();" placeholder="Select Department">
                                            <input type="hidden" name="deptName" id="deptName"/>-->
                                            <select class="form-control" required="" name="deptCode" id="deptCode" onchange="roles(this.value)">
                                                <option value="${departmentName}">${departmentName}</option>
                                                <c:forEach items="${deptlist}" var="list">
                                                    <script type="text/javascript">
                                                        $(document).ready(function () {

                                                            var textFields = document.getElementsByTagName('select')
                                                            for (i = 0; i < textFields.length; i++)
                                                            {
                                                                debugger;
                                                                if (!(textFields[i].readOnly)) {
                                                                    //console.log("ss" +readOnlyAttr);
                                                                    //$(textFields[i]).css("border-color", "red");
                                                                    $(textFields[i]).focus(function () {
                                                                        debugger;
                                                                        //alert('hi');
                                                                        $(this).css("border-color", "red");
                                                                        //$(this).attr("style", "border-color red !important");
                                                                    });
                                                                }
                                                            }

                                                        });
                                                    </script>
                                                    <option>${list.departmentName}</option>                                     
                                                </c:forEach>
                                            </select>
                                            <label class="control-label"><span style="color:red">*</span> Department</label>
                                        </div>
                                        <div class="col-md-4 mb-3 form-floating">
                                            
                                            <input type="hidden" class="form-control" name="roleName1" id="roleName1" value="${roleName}" >


                                            <!--<input type="text" class="form-control validate[required]" id="roleName" name="roleName" readonly="" value="${roleName}" onclick="getRole();" placeholder="Select Role">-->
                                            <select class="form-control" required="" id="roleName" name="roleName">
                                                <option value="${roleName}">${roleName}</option>
                                            </select>
                                            <script type="text/javascript">
                                                $(document).ready(function () {

                                                    var textFields = document.getElementsByTagName('select')
                                                    for (i = 0; i < textFields.length; i++)
                                                    {
                                                        debugger;
                                                        if (!(textFields[i].readOnly)) {
                                                            //console.log("ss" +readOnlyAttr);
                                                            //$(textFields[i]).css("border-color", "red");
                                                            $(textFields[i]).focus(function () {
                                                                debugger;
                                                                //alert('hi');
                                                                $(this).css("border-color", "red");
                                                                //$(this).attr("style", "border-color red !important");
                                                            });
                                                        }
                                                    }

                                                });
                                            </script>
                                            <script>
                                                function roles(val) {
                                                    $("#roleName").empty();
                                                    var val1 = val.split("-");
                                                <c:forEach items="${rolelist}" var="list">
                                                    var comaparekey = "<c:out value="${list.departmentCode}"/>";
                                                    if (comaparekey === val1[0]) {
                                                        $("#roleName").append(new Option('${list.roleName}', '${list.roleName}'));
                                                    }
                                                </c:forEach>
                                                }
                                            </script>
                                            <label class="control-label"><span style="color:red">*</span> Role</label>
                                        </div>
                                        <div class="col-md-4 mb-3 form-floating">
                                            <input type="text" placeholder="" class="form-control validate[required]" id="userId" name="userId" value="${userId}" readonly="">
                                            <label class="control-label"><span style="color:red">*</span> User Id</label>

                                        </div>
                                        <div class="col-md-4 mb-3 form-floating">
                                            <input type="text" placeholder="" class="form-control validate[required]" id="userFName" name="userFName" value="${userFName}" required="">
                                            <input type="hidden" placeholder="" class="form-control" id="userFName1" name="userFName1" value="${userFName}" >
                                            <label class="control-label"><span style="color:red">*</span> First Name</label>
                                        </div>
                                        <div class="col-md-4 mb-3 form-floating">
                                            <input type="text" placeholder="" class="form-control validate[required]" id="userLName" name="userLName" value="${userLName}" required="">
                                            <input type="hidden" placeholder="" class="form-control" id="userLName1" name="userLName1" value="${userLName}" >
                                            <label class="control-label"><span style="color:red">*</span> Last Name</label>

                                        </div>
                                        <div class="col-md-4 mb-3 form-floating">
                                            <input type="email" name="email" id="email" required="" class="form-control" value="${emailId}" maxlength="50" onchange="return validateEmail1(event);">
                                            <input type="hidden" name="email1" id="email1" required="" class="form-control" value="${emailId}" maxlength="50" >
                                            <label class="control-label"><span style="color:red">*</span>E-mail Address </label>
                                        </div>

                                        <div class="col-md-4 mb-3 form-floating">
                                            
                                            <input type="text" name="mobilenumber" id="mobilenumber" required="" class="form-control" value="${mobilenumber}" maxlength="10" onkeypress="return checkdigit(event, this, 10, 2);">
                                            <input type="hidden" name="mobilenumber1" id="mobilenumber1" required="" class="form-control" value="${mobilenumber}" maxlength="10" >
                                            <label class="control-label"><span style="color:red">*</span>Mobile Number</label>
                                        </div>

                                        <%--<div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label">&nbsp;&nbspStore Name</label>
                                            <select class="form-control" name="storeName" >
                                                <option value="${storeName}">${storeName}</option>
                                                <c:forEach items="${storelist}" var="store">
                                                    <c:if test="${store.storeName ne storename}">
                                                        <option>${store.storeName}</option>
                                                    </c:if>
                                                    <c:set var="storename" value="${store.storeName}"/>
                                                </c:forEach>
                                            </select>


                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label">&nbsp;&nbsp;Camp Name</label>
                                            <select class="form-control" name="campName" maxlength="98">
                                                <option value="${campName}">${campName}</option>
                                                <c:forEach items="${camplist}" var="camp">
                                                    <option>${camp[0]}</option>
                                                </c:forEach>
                                            </select>


                                        </div>
                                        
                                        <p>&nbsp;</p>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label">&nbsp;&nbsp;Contact No</label>

                                            <input type="text" name="contactNo" class="form-control" value="${contactNo}" onkeypress="return isNumberKey(event)" maxlength="11" pattern=".{8,}">


                                        </div>--%>
                                        <c:if test="${userId ne 'admin'}">
                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                <button type="button" class="btn btn-primary" style="" onclick="return test();">Save</button>

                                                <a href="../login/userlist.htm" class="btn btn-danger">Cancel</a>
                                            </div> 
                                        </c:if>
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
            function validateEmail1(sEmail) {
                var etext = document.getElementById('email').value;
                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                if (etext.match(mailformat)) {
                    return true;
                } else {
                    alert("You have entered an invalid email address!");
                    document.getElementById('email').value = "";
                }
            }
            function checkpassword() {


                checkUser();


            }

            function isNumberKey(evt) {
                if (evt.which != 8 && evt.which != 0 && (evt.which < 48 || evt.which > 57))
                {
                    alert("Please enter numeric value..!!!");
                    return false;
                }
                return true;
            }

            function selectEmp() {
                myWindow = window.open("../login/empList.htm", "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }

            function getRole() {
                var deptCode = document.getElementById("deptName").value;
                myWindow = window.open("../login/getRole.htm?deptCode=" + deptCode, "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }

            function getDeptCode() {
                orgName = document.getElementById("orgName").value;
                if (orgName) {
                    document.getElementById("roleName").value = "";
                    var fld = document.getElementById('orgName');
                    var values = [];
                    for (var i = 0; i < fld.options.length; i++) {
                        if (fld.options[i].selected) {
                            values.push(fld.options[i].value);
                        }
                    }

                    myWindow = window.open("../login/getDeptCode.htm?values=" + values, "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                }
                else {
                    alert("Please Select Organization");
                }
            }
            function check155() {
                //var d=document.getElementById("orgName").value;

                var fld = document.getElementById('orgName');
                var values = [];
                for (var i = 0; i < fld.options.length; i++) {
                    if (fld.options[i].selected) {
                        values.push(fld.options[i].value);
                    }
                }

                //alert(values);
            }
            function clear1() {
                document.getElementById("deptCode").value = "";
                document.getElementById("roleName").value = "";
            }

            $(document).ready(function () {
                jQuery("#usForm").validationEngine();
//                $("#userId").change(function () {
//                    checkUser();
//                });

                var code = {};
                $("select[name='deptCode'] > option").each(function () {
                    if (code[this.text]) {
                        $(this).remove();
                    } else {
                        code[this.text] = this.value;
                    }
                });
            });
            function checkUser() {
                var userId = document.getElementById("userId").value;


                $.ajax
                        ({
                            type: "POST",
                            url: '../login/userIDAvailabilty.htm',
                            data: {
                                userId: userId


                            },
                            success: function (data) {

                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("userId").value = "";
                                    document.getElementById("usForm").reset();
                                    return false;
                                }
                                else {
                                    $("#usForm").submit();
                                }

                            }
                        });

            }

            function checkdigit(e, obj, intsize, deczize) {
                var keycode;


                if (window.event)
                    keycode = window.event.keyCode;
                else if (e) {
                    keycode = e.which;
                }
                else {
                    return true;
                }

                var fieldval = (obj.value),
                        dots = fieldval.split(".").length;
                if (keycode == 46) {
                    return dots <= 1;
                }
                if (keycode == 8 || keycode == 9 || keycode == 46 || keycode == 13) {
                    // back space, tab, delete, enter
                    return true;
                }
                if ((keycode >= 32 && keycode <= 45) || keycode == 47 || (keycode >= 58 && keycode <= 127)) {
                    return false;
                }
                if (fieldval == "0" && keycode == 48) {
                    return false;
                }
                if (fieldval.indexOf(".") != -1) {
                    if (keycode == 46) {
                        return false;
                    }
                    var splitfield = fieldval.split(".");
                    if (splitfield[1].length >= deczize && keycode != 8 && keycode != 0)
                        return false;
                } else if (fieldval.length >= intsize && keycode != 46) {
                    return false;
                } else {
                    return true;
                }
            }

            function test()
            {
                var dcode = document.getElementById("deptCode").value;
                var dcode1 = document.getElementById("deptCode1").value;
                var rname = document.getElementById("roleName").value;
                var rname1 = document.getElementById("roleName1").value;
                var ufname = document.getElementById("userFName").value;
                var ufname1 = document.getElementById("userFName1").value;
                var ulname = document.getElementById("userLName").value;
                var ulname1 = document.getElementById("userLName1").value;
                var email = document.getElementById("email").value;
                var email1 = document.getElementById("email1").value;
                var mno = document.getElementById("mobilenumber").value;
                var mno1 = document.getElementById("mobilenumber1").value;


                if (document.getElementById("deptCode").value == "")
                {
                    alert("Select Department Name");
                    return false;
                } else if (document.getElementById("roleName").value == "")
                {
                    alert("Select Role Name");
                    return false;
                } else if (document.getElementById("userFName").value == "")
                {
                    alert("Enter User FName ");
                    return false;
                } else if (document.getElementById("userLName").value == "")
                {
                    alert("Enter User LName");
                    return false;
                } else if (document.getElementById("email").value == "")
                {
                    alert("Enter Email");
                    return false;
                } else if (document.getElementById("mobilenumber").value == "")
                {
                    alert("Enter Mobile Number");
                    return false;
                }
                else {

                    if (dcode !== dcode1 || rname !== rname1 || ufname !== ufname1 || ulname !== ulname1
                            || email !== email1 || mno !== mno1) {
                        if (confirm('Do you really want to Save this updated record')) {
                            document.forms["userform"].submit();
                            return true;
                        } else {
                            return true;
                        }

                    } else {
                        document.forms["userform"].submit();
                    }
                }

            }

//            function test()
//            {
//
//                if (confirm('Do you really want to Save this updated record')) {
//                    document.forms["userform"].submit();
//                    return true;
//                } else {
//                    return false;
//                }
//
//
//
//            }
        </script>
    </body>

</html>