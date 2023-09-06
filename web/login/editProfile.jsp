<%-- 
    Document   : editProfile
    Created on : 9 Mar, 2018, 12:23:45 PM
    Author     : ebs05
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
        <title>arête Assets Management</title>
        <style>
            .nowrap {
                white-space: nowrap;
            }

        </style>

        <script>

            function test()
            {
                if (document.getElementById("mobile").value == "")
                {
                    alert("Enter Mobile No");
                    return false;
                }
                else if (document.getElementById("email").value == "")
                {
                    alert("Enter Email Id");
                    return false;
                } else
                {
                    if (confirm('Do you really want to Save this updated record')) {
                        document.forms["userform"].submit();
                        return true;
                    } else {
                        return false;
                    }

                }

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
//            function browseFile(slno) {
//                document.getElementById('field' + slno).click();
//            }
//            function setAttachName(slno) {
//                var filenm = document.getElementById('field' + slno).value;
//                var filenmArr = filenm.split(".");
//                document.getElementById('attachname' + slno).value = filenmArr[0];
//            }
//            function browseImage(image) {
//                document.getElementById(image).click();
//            }
//            function imageUpload(image, imageLbl) {
//                var imgText = document.getElementById(image).value;
//                var filename = imgText.replace(/^.*[\\\/]/, '');
//                var imgTextArr = filename.split(".");
//                var imgTxtFTb = imgTextArr[0];
//                if (parseInt(imgTxtFTb.length) > 45) {
//                    imgTxtFTb = imgTxtFTb.substring(0, 45);
//                }
//                document.getElementById(imageLbl).value = imgTxtFTb;
//            }

        </script>

    </head>

    <body class="nav-md">
        <c:forEach items="${userlist}" var="ulist">
            <c:set var="userName" value="${ulist.userFName}${ulist.userLName}" />                
            <c:set var="userId" value="${ulist.userId}" />                
            <c:set var="mobile" value="${ulist.mobilenumber}" />                
            <c:set var="email" value="${ulist.email}" />                
            <%--            <c:set var="passportPhotoName" value="${ulist.passportPhotoName}" />                --%>
        </c:forEach>

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

                                    <form class="form-inline row" id="userform" accept-charset="UTF-8" method="post" action="../login/userProfileUpdate.htm" enctype="multipart/form-data" commandName="retilLicenseAppForm">
                                        <div id="spinner" class="spinner" style="display:none;">
                                            <img id="img-spinner" src="spinner.gif" alt="Loading"/>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color:red">*</span>Name</label>                                           
                                            <input type="text" id="userName" name="userName" class="form-control" maxlength="50" readonly="" value="${userName}">
                                            <p id="userNameError" style="color: red; font: bold; display: none; text-align: right;">Applicant name should be only Alphanumeric</p>
                                        </div>


                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color:red">*</span>User Id</label>                                           
                                            <input type="text" id="userId" name="userId" class="form-control" maxlength="50" readonly="" value="${userId}">
                                            <p id="userIdError" style="color: red; font: bold; display: none; text-align: right;">User Id should not be empty</p>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color:red">*</span>Mobile Number</label>                                            
                                            <input type="text" id="mobile" name="mobile" maxlength="10" class="form-control validate[required]" value="${mobile}" onkeypress="return checkdigit(event, this, 10, 2);">
                                            <p id="mobileError" style="color: red; font: bold; display: none; text-align: right;">Enter a valid mobile number</p>
                                        </div>
                                        <p>&nbsp;</p> 

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color:red">*</span>Email ID</label>
                                            <input type="text" id="email" name="email" class="form-control validate[required,custom[email]]"   value="${email}" maxlength="50" onchange="return validateEmail1(event);">                                               
                                            <p id="emailError" style="color: red; font: bold; display: none; text-align: right;">Enter a valid email id</p>
                                        </div>

                                        <!--                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                                                    <label class="control-label" >Upload Passport Size Photo</label>
                                                                                    <input  id="passportPhoto" name="passportPhoto" type="file" value="" onchange="readURL1(this);
                                                                                            imageUpload('passportPhoto', 'passportPhotoLbl');" style="display: none;">
                                                                                    <input style="display: inline!important;" class="form-control" type="text" id="passportPhotoLbl" name="passportPhotoLbl" maxlength="50" placeholder="Attachment Name" onkeypress="return onlyAlphabetsNums(event, this);">
                                                                                    <input type="button" id="btnppup" style="float: right;margin-left: 5px;" class="btn btn-primary" value="Browse..." onclick="browseImage('passportPhoto');" />
                                                                                </div>-->

                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>

                                        <div class="col-md-8 col-sm-8 col-xs-12 col-md-offset-5"> 
                                            <button type="button" class="btn btn-primary" style="" onclick="return test();">Save</button>

                                            <a href="../login/userProfileDetails.htm"  class="btn btn-danger" >Cancel</a>      
                                        </div>  

                                    </form>
                               </div>
                                        </div>

                                    </div>
                                </div>
                            </section>

                        </main><!-- End #main -->
                        <jsp:include page="../login/footer.jsp" />
    </body>

</html>

