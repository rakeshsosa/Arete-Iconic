<%-- 
    Document   : assetDetailsForm
    Created on : Sep 15, 2016, 10:42:18 AM
    Author     : Kondal Reddy N
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css" integrity="sha512-gxWow8Mo6q6pLa1XH/CcH8JyiSDEtiwJV78E+D+QP0EVasFs8wKXq16G8CLD4CJ2SnonHr4Lm/yY2fSI2+cbmw==" crossorigin="anonymous" />
    </head>
       
    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>
               
       <jsp:include page="../login/footer.jsp"/>
                         
    <main id="main" class="main">
        <div class="mt-3">
        <jsp:include page="../login/headerlink.htm?submodule=Location Master&tab=Delivery Location&pagetype=form"/>
    </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
                <div class="card-title"><h5>Delivery Location</h5></div>
               
                <form class="row" method="post" action="../master/deliverylocSubmit.htm" enctype="multipart/form-data" id="delForm">
                    <c:choose>
                        <c:when test="${fn:length(dellist) > 0}">
                            <c:forEach items="${dellist}" var="list">
                                <c:choose>
                                    <c:when test="${action eq 'edit'}">
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
                                                var textFields = document.getElementsByTagName('textarea')
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
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                        </c:when>
                    </c:choose>
                    <div class="col-md-4 form-floating mb-3">                                           
                        
                        <c:choose>
                            <c:when test="${fn:length(dellist) > 0}">
                                <c:forEach items="${dellist}" var="list">

                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">
                                            <input class="form-control validate[required]" required="" autocomplete="off" readonly id="divisionName" name="divisionName" type="text" value="${list.divisionName}" maxlength="100"> 

                                            <%--                                                                <select class="form-control validate[required]" name="divisionName" id="divisionName" data-rel="chosen">
                                                                                                                <option>${list.divisionName}</option>              
                                                                                                            </select>--%>
                                        </c:when>
                                        <c:otherwise>
                                            <input class="form-control validate[required]" required="" autocomplete="off" readonly id="divisionName" name="divisionName" type="text" value="${list.divisionName}" maxlength="100"> 

                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <select class="form-select validate[required]"  id="divisionName" data-rel="chosen" name="divisionName">
                                    <option value="">Select an option</option>
                                    <c:forEach items="${orglist}" var="org">
                                        <option>${org.orgName}</option>
                                    </c:forEach>
                                </select>
                            </c:otherwise>        
                        </c:choose>
                        <label class="control-label">Division Name <span style="color: red">*</span></label>
                    </div>                                       

                    <div class="col-md-4 form-floating mb-3"> 
                        

                        <c:choose>
                            <c:when test="${fn:length(dellist) > 0}">
                                <c:forEach items="${dellist}" var="list">
                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">
                                            <input name="pk" type="hidden" value="${list.sno}">
                                            <input name="status" type="hidden" value="${list.status}">
                                            <textarea class="form-control validate[required]" rows="1" name="address" id="address" autocomplete="off" style="resize: none;" maxlength="200">${list.address}</textarea>
                                            <input id="address1" class="form-control"  rows="1" maxlength="300" type="hidden" value="${list.address}">


                                        </c:when>
                                        <c:otherwise>
                                            <textarea class="form-control" rows="1" readonly="" style="resize: none;">${list.address}</textarea>
                                        </c:otherwise> 
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <textarea class="form-control validate[required]" rows="1" name="address" placeholder="Fill" id="address" autocomplete="off" style="resize: none;" maxlength="200" onchange="uniqueAddress();">${list.address}</textarea>
                            </c:otherwise>        
                        </c:choose>
                        <label class="control-label">Address <span style="color: red">*</span></label>
                    </div>                                   

                    <div class="col-md-4 form-floating mb-3"> 
                        <div> Contact Number <span style="color: red">*</span></div>
                        <c:choose>
                            <c:when test="${fn:length(dellist) > 0}">
                                <c:forEach items="${dellist}" var="list">
                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">
                                            <input class="form-control validate[required]" name="contactNo" id="contactNo" maxlength="15" type="tel" value="${list.contactNo}" onkeypress="return isNumberKey(event)"> 
                                            <input name="contactNo1" id="contactNo1" autocomplete="off"  maxlength="11" type="hidden" pattern="[0-9]{11}" value="${list.contactNo}" > 
                                        </c:when>
                                        <c:otherwise>
                                            <input class="form-control" readonly type="text" value="${list.contactNo}">
                                        </c:otherwise> 
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <input class="form-control validate[required]" name="contactNo" id="contactNo" autocomplete="off" maxlength="15" type="tel" value="" onkeypress="return isNumberKey(event)">
                            </c:otherwise>        
                        </c:choose>
                        
                    </div>
                   

                    <div class="col-md-4 form-floating mb-3"> 
                        
                        <c:choose>
                            <c:when test="${fn:length(dellist) > 0}">
                                <c:forEach items="${dellist}" var="list">
                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">
                                            <input class="form-control" name="emailId" id="emailId" autocomplete="off" maxlength="50" type="email" value="${list.emailId}" onblur="validateEmail(this)">
                                            <input class="form-control" name="emailId1" id="emailId1" autocomplete="off" maxlength="50" type="hidden" value="${list.emailId}">
                                        </c:when>
                                        <c:otherwise>
                                            <input class="form-control" readonly="" autocomplete="off" type="email" value="${list.emailId}">
                                        </c:otherwise> 
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <input class="form-control" name="emailId" placeholder="Fill" autocomplete="off" maxlength="50" type="email" value="" onblur="validateEmail(this)">
                            </c:otherwise>        
                        </c:choose>
                        <label class="control-label">Email ID</label>
                    </div>

                    <br/>
                    <c:if test="${action ne 'view'}">
                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                            <button type="submit" class="btn btn-primary" style=""> Save</button>
                            <a href="../master/deliverylocList.htm"><button type="button" class="btn btn-danger" style="">Cancel</button></a> 
                        </div>
                
                    </c:if>
              <c:if test="${action eq 'view'  }">

                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                    <a href="../master/deliverylocList.htm" class="btn btn-danger">Cancel</a>
                </div>

            </c:if>
            <br/>

            <div class="clearfix"></div>

            <div class="clearfix"></div>                

            <!-- /page content -->

            </form>
            </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->

<script>
    $(document).ready(function () {
        $('#priceStartValidDate').datepicker({
            autoclose: true,
            format: 'dd-M-yyyy',
            orientation: "bottom left"
        });
    });

    jQuery(document).ready(function () {
        jQuery("#contDetForm").validationEngine();
        $("input").on("keypress", function (e) {
            if (e.which === 32 && !this.value.length)
                e.preventDefault();
        });
        $("textarea").on("keypress", function (e) {
            if (e.which === 32 && !this.value.length)
                e.preventDefault();
        });

    });

    function test()
    {

        var addr = document.getElementById("address").value;
        var addr1 = document.getElementById("address1").value;
        var cno = document.getElementById("contactNo").value;
        var cno1 = document.getElementById("contactNo1").value;
        var mail = document.getElementById("emailId").value;
        var mail1 = document.getElementById("emailId1").value;

        if (document.getElementById("address").value == "")
        {
            alert("Enter Address");
            return false;
        } else if (document.getElementById("contactNo").value == "")
        {
            alert("Enter Contact No");
            return false;
        }
        else {

            if (addr !== addr1 || cno !== cno1 || mail !== mail1) {
                if (confirm('Do you really want to Save this updated record')) {
                    document.forms["delForm"].submit();
                    return true;
                } else {
                    return true;
                }

            } else {
                document.forms["delForm"].submit();
            }
        }

    }

    function change(val1, val2) {
        var res = val1.substring(0, 3).toString();
        if (val1 != "") {
            document.getElementById("contactRefNo").value = res + "-" + val2.toString();
        } else {
            document.getElementById("contactRefNo").value = "";
        }
    }

    function isNumberKey(evt) {
        debugger;
        var charCode = (evt.which) ? evt.which : event.keyCode;
        if (charCode == 46 && evt.srcElement.value.split('.').length > 1) {
            return false;
        }
        if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
        return true;
    }
    function uniqueAddress() {
        var divisionName = document.getElementById("divisionName").value;
        var address = document.getElementById("address").value;
        $.ajax({
            type: "POST",
            url: '../master/getDelLoc.htm',
            data: {
                divisionName: divisionName,
                address: address,
            },
            success: function (data) {
                if ($.trim(data) == 'Already Exists.') {
                    alert("Address Already Exist");
                    document.getElementById("address").value = "";
                    return false;
                }
            }
        });
    }
</script>
<script>
    NProgress.done();


    $(document).ready(function () {
        jQuery("#delForm").validationEngine();
    });
</script>
<script>
    $(function (){
        var input = document.querySelector("#contactNo");
        var myinput = window.intlTelInput(input, {
            initialCountry: "om",
            onlyCountries: ["om", "in", "ae"],
            hiddenInput: "full",
            separateDialCode: true,
            autoHideDialCode: false,
            utilsScript: "//cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.3/js/utils.js",
        });
        $("#contactNo").change(function () {
            var full_number = myinput.getNumber(intlTelInputUtils.numberFormat.E164);
            $("#contactNo").val(full_number);
            if (myinput.isValidNumber() == false) {
                $("#contactNo").val("");
                swal("Please enter valid mobile number");
                return false;
            }
        });
    });                   
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js" integrity="sha512-DNeDhsl+FWnx5B1EQzsayHMyP6Xl/Mg+vcnFPXGNjUZrW28hQaa1+A4qL9M+AiOMmkAhKAWYHh1a+t6qxthzUw==" crossorigin="anonymous"></script>
    </body>

</html>
