
<%-- Document : assetDetailsForm Created on : Sep 15, 2016, 10:42:18 AM Author : Kondal Reddy N --%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <%@page contentType="text/html" pageEncoding="UTF-8" %>
                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                        <!-- Meta, title, CSS, favicons, etc. -->
                        <meta charset="utf-8">
                        <meta http-equiv="X-UA-Compatible" content="IE=edge">
                        <meta name="viewport" content="width=device-width, initial-scale=1">

          <title>Arete Iconic</title>
                     <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">                        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
                        <script type="text/javascript" src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
                         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css" integrity="sha256-FAOaXTpl90/K8cXmSdsskbQN3nKYulhCpPbcFzGTWKI=" crossorigin="anonymous" />
                       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css" integrity="sha512-gxWow8Mo6q6pLa1XH/CcH8JyiSDEtiwJV78E+D+QP0EVasFs8wKXq16G8CLD4CJ2SnonHr4Lm/yY2fSI2+cbmw==" crossorigin="anonymous" />
                    </head>
                    <script>
                        function uniqueUserid() {
                            var userId = document.getElementById("userId").value;
                            $.ajax
                                    ({
                                        type: "POST",
                                        url: '../login/uniqueUserid.htm',
                                        data: {
                                            userId: userId
                                        },
                                        success: function (data) {
                                            if ($.trim(data) == 'Already Exists.Enter another') {
                                                alert("This Record Already Exist");
                                                document.getElementById("userId").value = "";
                                                return false;
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
                        function isNumberKey(evt)
                        {
                            var charCode = (evt.which) ? evt.which : event.keyCode;
                            if (charCode > 31 && (charCode < 48 || charCode > 57))
                            {
            //                    alert("Please Enter Numeric value");
                                return false;
                            }
                            return true;
                        }
                        function isNumberKey3(evt) {
                            debugger;
                            var charCode = (evt.which) ? evt.which : event.keyCode;
                            if (charCode > 32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122))
                            {
            //                    alert("Please Enter Only Alphanumerics");
                                return false;
                            }
                            return true;
                        }
                    </script>

                    <body class="nav-md">
                        <jsp:include page="../login/menu.htm" />

                        <jsp:include page="../login/footer.jsp" />

                        <main id="main" class="main">
                            <div class="mt-3">
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
                                                    <h5>User Registration</h5>
                                                </div>
                                                <form class="row" action="../login/usersubmit.htm">
                                                    <div class="col-md-4 form-floating mb-3">
                                                        <select class="form-control" required="" onchange="department(this.value)" name="orgName">
                                                            <option value="" disabled selected>Select your option</option>
                                                            <c:forEach items="${orglist}" var="list">
                                                                <option value="${list.orgCode}-${list.sno}">${list.orgName}</option>
                                                            </c:forEach>
                                                        </select>
                                                         <label class="control-label"><span style="color:red">*</span>Organisation Name</label>
                                                    </div>
            
                                                    <div class="col-md-4 form-floating mb-3">
                                                       <select class="form-control" required="" name="deptCode" id="deptCode" onchange="role(this.value)">
                                                            <option value="" disabled selected>Select your option</option>
                                                        </select>
                                                        <script>
                                                            function department(val) {
                                                                $("#deptCode").empty();
                                                                $("#deptCode").append(new Option(''));
                                                                var val1 = val.split("-");
                                                                
                                                            <c:forEach items="${deptlist}" var="list">
                                                                var comaparekey = "<c:out value="${list.orgCode}"/>";
                                                                if (comaparekey === val1[0]) {
                                                                    
                                                                    $("#deptCode").append(new Option('${list.departmentCode}', '${list.departmentCode}-${list.departmentName}'));
                                                                         }
                                                            </c:forEach>
                                                                        }
                                                        </script>
                                                          <label class="control-label"><span style="color:red">*</span>Department Name</label>
                                                    </div>
                                                    <div class="col-md-4 form-floating mb-3">
                                                       <select class="form-control" required="" id="roleName" name="roleName">
                                                            <option value="" disabled selected>Select your option</option>
                                                        </select>
                                                        <script>
                                                            function role(val) {
                                                              
                                                                
                                                                $("#roleName").empty();
                                                                $("#roleName").append(new Option(''));
                                                                var val1 = val.split("-");
                                                            <c:forEach items="${rolelist}" var="list">
                                                                   
                                                                var comaparekey = "<c:out value="${list.departmentCode}"/>";
                                                                comaparekey=comaparekey.replace("Finance &amp; Accounting","Finance & Accounting")
                                                              
                                                                if (comaparekey === val1[0]) {
                                                                   //alert("val1[0]"+val1[0]);
                                                                    $("#roleName").append(new Option('${list.roleName}', '${list.roleName}'));
                                                                }
                                                            </c:forEach>
                                                            }
                                                        </script>
                                                         <label class="control-label"><span style="color:red">*</span>Role Name</label>
                                                    </div>
                                                 
                                                    <div class="col-md-4 form-floating mb-3">
                                                       <input type="text" placeholder="fill" class="form-control" required="" name="userId" id="userId" onchange="uniqueUserid();">
                                                      <label class="control-label"><span style="color:red">*</span>User Id</label>
                                                    </div>
                                                    <div class="col-md-4 form-floating mb-3">
                                                       <input type="text" placeholder="fill" class="form-control" required="" name="userFName" onkeypress="return isNumberKey3(event)">
                                                     <label class="control-label"><span style="color:red">*</span>First Name</label>
                                                        
                                                    </div>
                                                    <div class="col-md-4 form-floating mb-3">
                                                        <input type="text" placeholder="fill" class="form-control" required="" name="userLName" onkeypress="return isNumberKey3(event)">
                                                                                                           <label class="control-label"><span style="color:red">*</span>Last Name</label>
                                                                     </div>
                                                  
                                                    <div class="col-md-4 form-floating mb-3">
                                                        <input type="email" placeholder="fill" class="form-control" required="" name="email" id="email" maxlength="100"  autocomplete="off"  onblur="validateEmail(this);">
                                                  <label class="control-label"><span style="color:red">*</span>E-mail Address</label>
                                                    </div>
            
                                                    <div class="col-md-4 form-floating mb-3">
                                                         <div><span style="color:red">*</span>Mobile Number</div>
                                                        <input type="tel"  class="form-control" required="" name="mobilenumber" id="mobilenumber" onkeypress="return isNumber(event)">                                                       
                                                    </div>
                                                    <div class="col-md-4 form-floating mb-3">
                                                        <input type="text" placeholder="fill" class="form-control" required="" name="password" id="password">
                                                    <label class="control-label"><span style="color:red">*</span>Password</label>
                                                       
                                                    </div>
                                                  
                                                    <div class="col-md-4 form-floating mb-3">
                                                      <input type="text" placeholder="fill" class="form-control" required="" name="rpassword" id="rpassword" onchange="checkpassword();">
                                                      <label class="control-label"><span style="color:red">*</span>Re-enter Password</label>
                                                    </div>
            
                                                   <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
                                                        <button type="submit" class="btn btn-primary" style="">Save</button>
                                                        <a href="../login/userlist.htm" class="btn btn-danger">Cancel</a>
                                                    </div>
            
                                                </form>
                                        </div>
                                    </div>

                                </div>
                                </div>
                            </section>

                        </main><!-- End #main -->

                        <script>
                            NProgress.done();
                            function checkpassword() {
                                if (document.getElementById('rpassword').value !== document.getElementById('password').value) {
                                    //$('#rpassword').val("").setCustomValidity('Password Must be Matching.');
                                    alert('Password Must be Matching.');
                                    document.getElementById("rpassword").value = "";
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
                        </script>
                                                <script>
    $(function (){
        var input = document.querySelector("#mobilenumber");
        var myinput = window.intlTelInput(input, {
            initialCountry: "om",
            onlyCountries: ["om", "in", "ae"],
            hiddenInput: "full",
            separateDialCode: true,
            autoHideDialCode: false,
            utilsScript: "//cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.3/js/utils.js",
        });
        $("#mobilenumber").change(function () {
            var full_number = myinput.getNumber(intlTelInputUtils.numberFormat.E164);
            $("#mobilenumber").val(full_number);
            if (myinput.isValidNumber() == false) {
                $("#mobilenumber").val("");
                swal("Please enter valid mobile number");
                return false;
            }
        });
    });   
</script>
<script src="../common/theme/js/custom.js"></script>
                           <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js" integrity="sha512-DNeDhsl+FWnx5B1EQzsayHMyP6Xl/Mg+vcnFPXGNjUZrW28hQaa1+A4qL9M+AiOMmkAhKAWYHh1a+t6qxthzUw==" crossorigin="anonymous"></script>

                    </body>

                    </html>