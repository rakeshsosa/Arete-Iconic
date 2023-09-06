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
        <script>
            $(document).ready(function () {
                $("#userform").validationEngine();
                $("input").on("keypress", function (e) {
    
                    if (e.which === 32 && !this.value.length)
                        e.preventDefault();
                });
                $("#supplierContNum").change(function () {
                    var phone = $('input[name="supplierContNum"]').val();
                    intRegex = /[0-9 -()+]+$/;
                    if ((phone.length < 8) || (!intRegex.test(phone)))
                    {
                        $('#supplierContNum').val('');
                        alert('Please enter a valid phone number.');
                        return false;
                    }
                });
            });
            function isNumberKey(evt) {
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                {
    //                    alert("Please Enter Numeric value");
                    return false;
                }
                return true;
            }
           
            function isNumberKey4(evt) {
                debugger;
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if (charCode > 32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122))
                {
    //                    alert("Please Enter Only Alphabets");
                    return false;
                }
                return true;
            }
             function isNumberKey3(evt) {
                debugger;
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if (charCode > 32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122) && charCode > 31 && (charCode < 48 || charCode > 57))
                {
    //                    alert("Please Enter Only Alphanumerics");
                    return false;
                }
                return true;
            }
    
    
            function validateEmail() {
                var mailId = document.getElementById("mailId").value;
                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                if (mailId.match(mailformat)) {
    //                    return true;
                } else {
                    alert("You have entered an invalid email address!");
                    document.getElementById('mailId').value = "";
                }
                $.ajax
                        ({
                            type: "POST",
                            url: '../master/fetchllEmail1.htm',
                            data: {
                                mailId: mailId
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("mailId").value = "";
                                    return false;
                                }
                            }
                        });
            }
    
            function validateEmail1() {
                var emailid = document.getElementById("emailid").value;
                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                if (emailid.match(mailformat)) {
    //                    return true;
                } else {
                    alert("You have entered an invalid email address!");
                    document.getElementById('emailid').value = "";
                }
    //            $.ajax
    //                    ({
    //                        type: "POST",
    //                        url: '../master/fetchllEmail2.htm',
    //                        data: {
    //                            emailid: emailid
    //                        },
    //                        success: function (data) {
    //                            if ($.trim(data) == 'Already Exists.Enter another') {
    //                                alert("Bank email already exist");
    //                                document.getElementById("emailid").value = "";
    //                                return false;
    //                            }
    //                        }
    //                    });
            }
    
    
            function validatePhone() {
                var supplierContNum = document.getElementById("supplierContNum").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../master/contNumFetch.htm',
                            data: {
                                supplierContNum: supplierContNum
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("supplierContNum").value = "";
                                    return false;
                                }
                            }
                        });
            }
    
    
    
            function validateAcc() {
                var accountNumber = document.getElementById("accountNumber").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../master/accNumFetch.htm',
                            data: {
                                accountNumber: accountNumber
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("accountNumber").value = "";
                                    return false;
                                }
                            }
                        });
            }
    
    
    
    
    
            //method to validate unique category
    
            function validateSupNam() {
                var supplierName = document.getElementById("supplierName").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../master/SupplierAvailabilty.htm',
                            data: {
                                supplierName: supplierName
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("supplierName").value = "";
                                    return false;
                                }
                            }
                        });
            }
    
    
            //method to validate Mandatory and submit form       
            function test12() {
    
                if (document.getElementById("supplierName").value == "") {
                    alert("Enter Supplier Name");
                    return false;
                } else if (document.getElementById("supplierAddress").value == "") {
                    alert("Enter Supplier Address");
                    return false;
                } else if (document.getElementById("supplierContNum").value == "") {
                    alert("Enter Supplier Contact Number");
                    return false;
                } else if (document.getElementById("mailId").value == "")
                {
                    alert("Enter Supplier Email Id");
                    return false;
                } else if (document.getElementById("bankName").value == "")
                {
                    alert("Enter Bank Name");
                    return false;
                } else if (document.getElementById("accountNumber").value == "")
                {
                    alert("Enter Account Number");
                    return false;
                } else if (document.getElementById("bankName").value == "")
                {
                    alert("Enter Bank Name");
                    return false;
                }
    //            else if (document.getElementById("ifsccode").value == "")
    //            {
    //                alert("Enter Ifsc Code");
    //                return false;
    //            } 
                else if (document.getElementById("branchname").value == "")
                {
                    alert("Enter Branch Name");
                    return false;
                } else if (document.getElementById("address").value == "")
                {
                    alert("Enter Bank Address");
                    return false;
                } else if (document.getElementById("emailid").value == "")
                {
                    alert("Enter Bank Email Id");
                    return false;
                }
                else if (document.getElementById("contNum").value == "")
                {
                    alert("Enter Bank Contact Number");
                    return false;
                }
                else {
    
                    document.forms["supplierform"].submit();
                }
    
            }
    
            function ValidateIfscCode() {
    
                var ifsc = document.getElementById('ifsccode').value;
                var ifscformat = /^([A-Z]){4}([0]){1}([A-Z0-9]){6}?$/;
                if (!ifsc.match(ifscformat))
                {
                    alert("You have entered an invalid IFSC Code.!");
                    document.getElementById("ifsccode").value = '';
                    return false;
                }
            }
    
            function test()
            {
                var sname = document.getElementById("supplierName").value;
                var sname1 = document.getElementById("supplierName1").value;
                var saddr = document.getElementById("supplierAddress").value;
                var saddr1 = document.getElementById("supplierAddress1").value;
                var city = document.getElementById("city").value;
                var city1 = document.getElementById("city1").value;
                var state = document.getElementById("state").value;
                var state1 = document.getElementById("state1").value;
                var pcode = document.getElementById("pincode").value;
                var pcode1 = document.getElementById("pincode1").value;
                var scono = document.getElementById("supplierContNum").value;
                var scono1 = document.getElementById("supplierContNum1").value;
                var mail = document.getElementById("mailId").value;
                var mail1 = document.getElementById("mailId1").value;
                var desc = document.getElementById("supplierDesc").value;
                var desc1 = document.getElementById("supplierDesc1").value;
                var bname = document.getElementById("bankName").value;
                var bname1 = document.getElementById("bankName1").value;
                var ano = document.getElementById("accountNumber").value;
                var ano1 = document.getElementById("accountNumber1").value;
                var ifsc = document.getElementById("ifsccode").value;
                var ifsc1 = document.getElementById("ifsccode1").value;
                var brname = document.getElementById("branchname").value;
                var brname1 = document.getElementById("branchname1").value;
                var addr = document.getElementById("address").value;
                var addr1 = document.getElementById("address1").value;
                var email = document.getElementById("emailid").value;
                var email1 = document.getElementById("emailid1").value;
                var conno = document.getElementById("contNum").value;
                var conno1 = document.getElementById("contNum1").value;
    
    
                if (document.getElementById("supplierName").value == "") {
                    alert("Enter Supplier Name");
                    return false;
                } else if (document.getElementById("supplierAddress").value == "") {
                    alert("Enter Supplier Address");
                    return false;
                } else if (document.getElementById("supplierContNum").value == "") {
                    alert("Enter Supplier Contact Number");
                    return false;
                } else if (document.getElementById("mailId").value == "")
                {
                    alert("Enter Supplier Email Id");
                    return false;
                } else if (document.getElementById("bankName").value == "")
                {
                    alert("Enter Bank Name");
                    return false;
                } else if (document.getElementById("accountNumber").value == "")
                {
                    alert("Enter Account Number");
                    return false;
                } else if (document.getElementById("bankName").value == "")
                {
                    alert("Enter Bank Name");
                    return false;
                }
    //            else if (document.getElementById("ifsccode").value == "")
    //            {
    //                alert("Enter Ifsc Code");
    //                return false;
    //            } 
                else if (document.getElementById("branchname").value == "")
                {
                    alert("Enter Branch Name");
                    return false;
                } else if (document.getElementById("address").value == "")
                {
                    alert("Enter Bank Address");
                    return false;
                } else if (document.getElementById("emailid").value == "")
                {
                    alert("Enter Bank Email Id");
                    return false;
                }
                else if (document.getElementById("contNum").value == "")
                {
                    alert("Enter Bank Contact Number");
                    return false;
                }
                else {
    
                    if (sname !== sname1 || saddr !== saddr1 || city !== city1 || state !== state1 ||
                            pcode !== pcode1 || scono !== scono1 || mail !== mail1 ||
                            desc !== desc1 || bname !== bname1 ||
                            ano !== ano1 || ifsc !== ifsc1 || brname !== brname1 ||
                            addr !== addr1 || email !== email1 || conno !== conno1) {
                        if (confirm('Do you really want to Save this updated record')) {
                            document.forms["supplierform"].submit();
                            return true;
                        } else {
                            return true;
                        }
    
                    } else {
                        document.forms["supplierform"].submit();
                    }
                }
    
            }
    //
    //        function test() {
    //
    //            if (document.getElementById("supplierName").value == "") {
    //                alert("Enter Supplier Name");
    //                return false;
    //            } else if (document.getElementById("supplierAddress").value == "") {
    //                alert("Enter Supplier Address");
    //                return false;
    //            } else if (document.getElementById("supplierContNum").value == "") {
    //                alert("Enter Supplier Contact Number");
    //                return false;
    //            } else if (document.getElementById("mailId").value == "")
    //            {
    //                alert("Enter Supplier Email Id");
    //                return false;
    //            } else if (document.getElementById("bankName").value == "")
    //            {
    //                alert("Enter Bank Name");
    //                return false;
    //            } else if (document.getElementById("accountNumber").value == "")
    //            {
    //                alert("Enter Account Number");
    //                return false;
    //            } else if (document.getElementById("bankName").value == "")
    //            {
    //                alert("Enter Bank Name");
    //                return false;
    //            }
    ////            else if (document.getElementById("ifsccode").value == "")
    ////            {
    ////                alert("Enter Ifsc Code");
    ////                return false;
    ////            } 
    //            else if (document.getElementById("branchname").value == "")
    //            {
    //                alert("Enter Branch Name");
    //                return false;
    //            } else if (document.getElementById("address").value == "")
    //            {
    //                alert("Enter Bank Address");
    //                return false;
    //            } else if (document.getElementById("emailid").value == "")
    //            {
    //                alert("Enter Bank Email Id");
    //                return false;
    //            }
    //            else if (document.getElementById("contNum").value == "")
    //            {
    //                alert("Enter Bank Contact Number");
    //                return false;
    //            }
    //            else {
    //                if (confirm('Do you really want to Save this updated record')) {
    //                    document.forms["supplierform"].submit();
    //                    return true;
    //                } else {
    //                    return false;
    //                }
    //            }
    //
    //        }
    
        </script>
    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>
            <jsp:include page="../login/footer.jsp"/>
   
                                
    <main id="main" class="main">
        <div class="mt-3">
        <jsp:include page="../login/headerlink.htm?submodule=Masters&tab=Vendor Master&pagetype=form"/>
    </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
                <div class="card-title"><h5>Supplier Master Details</h5></div>
                
                <form id="supplierform" method="post" class="row" action="../master/supplierFormSubmit.htm" >
                    <c:choose>
                        <c:when test="${fn:length(supplier) > 0}">
                            <c:forEach items="${supplier}" var="list">
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
                    <c:forEach items="${supp}" var="list">                                       

                        <c:if test="${list[0] eq '412'}">
                            <c:set value="${list[1]}" var="field_412"/>
                            <c:set value="${list[2]}" var="fieldStatus_412"/>
                            <c:set value="${list[3]}" var="mand_status_412"/>
                            <c:set value="${list[4]}" var="max_length_412"/>
                        </c:if>
                        <c:if test="${list[0] eq '413'}">
                            <c:set value="${list[1]}" var="field_413"/>
                            <c:set value="${list[2]}" var="fieldStatus_413"/>
                            <c:set value="${list[3]}" var="mand_status_413"/>
                            <c:set value="${list[4]}" var="max_length_413"/>
                        </c:if>
                        <c:if test="${list[0] eq '414'}">
                            <c:set value="${list[1]}" var="field_414"/>
                            <c:set value="${list[2]}" var="fieldStatus_414"/>
                            <c:set value="${list[3]}" var="mand_status_414"/>
                            <c:set value="${list[4]}" var="max_length_414"/>
                        </c:if>
                        <c:if test="${list[0] eq '415'}">
                            <c:set value="${list[1]}" var="field_415"/>
                            <c:set value="${list[2]}" var="fieldStatus_415"/>
                            <c:set value="${list[3]}" var="mand_status_415"/>
                            <c:set value="${list[4]}" var="max_length_415"/>
                        </c:if>
                        <c:if test="${list[0] eq '416'}">
                            <c:set value="${list[1]}" var="field_416"/>
                            <c:set value="${list[2]}" var="fieldStatus_416"/>
                            <c:set value="${list[3]}" var="mand_status_416"/>
                            <c:set value="${list[4]}" var="max_length_416"/>
                        </c:if>
                        <c:if test="${list[0] eq '417'}">
                            <c:set value="${list[1]}" var="field_417"/>
                            <c:set value="${list[2]}" var="fieldStatus_417"/>
                            <c:set value="${list[3]}" var="mand_status_417"/>
                            <c:set value="${list[4]}" var="max_length_417"/>
                        </c:if>
                        <c:if test="${list[0] eq '418'}">
                            <c:set value="${list[1]}" var="field_418"/>
                            <c:set value="${list[2]}" var="fieldStatus_418"/>
                            <c:set value="${list[3]}" var="mand_status_418"/>
                            <c:set value="${list[4]}" var="max_length_418"/>
                        </c:if>
                        <c:if test="${list[0] eq '708'}">
                            <c:set value="${list[1]}" var="field_708"/>
                            <c:set value="${list[2]}" var="fieldStatus_708"/>
                            <c:set value="${list[3]}" var="mand_status_708"/>
                            <c:set value="${list[4]}" var="max_length_708"/>
                        </c:if>
                        <c:if test="${list[0] eq '709'}">
                            <c:set value="${list[1]}" var="field_709"/>
                            <c:set value="${list[2]}" var="fieldStatus_709"/>
                            <c:set value="${list[3]}" var="mand_status_709"/>
                            <c:set value="${list[4]}" var="max_length_709"/>
                        </c:if>
                        <c:if test="${list[0] eq '710'}">
                            <c:set value="${list[1]}" var="field_710"/>
                            <c:set value="${list[2]}" var="fieldStatus_710"/>
                            <c:set value="${list[3]}" var="mand_status_710"/>
                            <c:set value="${list[4]}" var="max_length_710"/>
                        </c:if>
                        <c:if test="${list[0] eq '711'}">
                            <c:set value="${list[1]}" var="field_711"/>
                            <c:set value="${list[2]}" var="fieldStatus_711"/>
                            <c:set value="${list[3]}" var="mand_status_711"/>
                            <c:set value="${list[4]}" var="max_length_711"/>
                        </c:if>
                        <c:if test="${list[0] eq '712'}">
                            <c:set value="${list[1]}" var="field_712"/>
                            <c:set value="${list[2]}" var="fieldStatus_712"/>
                            <c:set value="${list[3]}" var="mand_status_712"/>
                            <c:set value="${list[4]}" var="max_length_712"/>
                        </c:if>
                        <c:if test="${list[0] eq '713'}">
                            <c:set value="${list[1]}" var="field_713"/>
                            <c:set value="${list[2]}" var="fieldStatus_713"/>
                            <c:set value="${list[3]}" var="mand_status_713"/>
                            <c:set value="${list[4]}" var="max_length_713"/>
                        </c:if>
                        <c:if test="${list[0] eq '714'}">
                            <c:set value="${list[1]}" var="field_714"/>
                            <c:set value="${list[2]}" var="fieldStatus_714"/>
                            <c:set value="${list[3]}" var="mand_status_714"/>
                            <c:set value="${list[4]}" var="max_length_714"/>
                        </c:if>
                        <c:if test="${list[0] eq '715'}">
                            <c:set value="${list[1]}" var="field_715"/>
                            <c:set value="${list[2]}" var="fieldStatus_715"/>
                            <c:set value="${list[3]}" var="mand_status_715"/>
                            <c:set value="${list[4]}" var="max_length_715"/>
                        </c:if>

                    </c:forEach> 
                    <c:if test="${fieldStatus_412 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                            
                            <c:choose>
                                <c:when test="${fn:length(supplier) > 0}">
                                    <c:forEach items="${supplier}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input type="text" class="form-control" ${mand_status_412} maxlength="${max_length_412}" name="supplierName" id="supplierName" value="${list.supplierName}" onchange="validateSupNam(event)press="return isNumberKey4(event)">
                                                <input type="hidden" class="form-control" ${mand_status_412} maxlength="${max_length_412}" name="supplierName1" id="supplierName1" value="${list.supplierName}" >
                                                <input name="pk" type="hidden" value="${list.sno}">
                                                <input name="status" type="hidden" value="${list.status}">
                                                <input type="hidden" placeholder="Fill" class="form-control"  name="supplierCode" id="supplierCode" value="${list.supplierCode}">
                                                <input type="hidden" name="creationDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.creationDate}"/>">

                                            </c:when>
                                            <c:otherwise>

                                                <input type="text" class="form-control" ${mand_status_412}  readonly="" name="supplierName" value="${list.supplierName}" onkeypress="return isNumberKey4(event)">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>                                                    
                                    <input type="text" placeholder="Fill" class="form-control text-capitalize"  ${mand_status_412} maxlength="${max_length_412}" name="supplierName" id="supplierName" value="" onchange="validateSupNam(event)" onkeypress="return isAlphabet(event)">
                                    <input type="hidden" placeholder="Fill" class=""  name="supplierCode" id="supplierCode" value="">
                                    <input name="status" type="hidden" value="">
                                </c:otherwise>        
                            </c:choose>
                            <label style="" class="control-label">${field_412}
                            <c:if test="${mand_status_412 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if>
                            </label>
                        </div>
                    </c:if>
                    
                    <c:if test="${fieldStatus_413 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                            
                            <c:choose>
                                <c:when test="${fn:length(supplier) > 0}">
                                    <c:forEach items="${supplier}" var="type">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <textarea class="form-control" name="supplierAddress" id="supplierAddress" maxlength="${max_length_413}" autocomplete="off" style="resize: none;" ${mand_status_413}  rows="1">${type.supplierAddress}</textarea>
                                                <input id="supplierAddress1" class="form-control"  rows="1" maxlength="300" style="resize: none" type="hidden" value="${type.supplierAddress}">

                                            </c:when>
                                            <c:otherwise>
                                                <textarea class="form-control" style="resize: none; " rows="1" readonly>${type.supplierAddress}</textarea>
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <textarea class="form-control" name="supplierAddress" placeholder="Fill" maxlength="${max_length_413}" autocomplete="off" style="resize: none;" id="supplierAddress" ${mand_status_413}  rows="1"></textarea>
                                </c:otherwise>        
                            </c:choose>      
                            <label style="" class="control-label">${field_413}
                            <c:if test="${mand_status_413 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if>
                            </label>												
                        </div>
                    </c:if>
                    
                    <c:if test="${fieldStatus_708 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">

                            <c:choose>
                                <c:when test="${fn:length(supplier) > 0}">
                                    <c:forEach items="${supplier}" var="type">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input class="form-control" name="city" id="city" maxlength="${max_length_708}" type="text" value="${type.city}" onkeypress="return isNumberKey4(event)"> 
                                                <input class="form-control" name="city1" id="city1" maxlength="${max_length_708}" type="hidden" value="${type.city}" > 
                                            </c:when>
                                            <c:otherwise>
                                                <input class="form-control" readonly type="text" value="${type.city}">
                                            </c:otherwise> 
                                        </c:choose>

                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <input class="form-control" placeholder="Fill" name="city" maxlength="${max_length_708}" type="text"  value="" onkeypress="return isNumberKey4(event)">
                                </c:otherwise>        
                            </c:choose>
                            <label style="" class="control-label">${field_708}
                            <c:if test="${mand_status_708 eq 'required'}">
                                <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                            </c:if>
                            </label>												
                        </div>
                    </c:if>
                    
                    <c:if test="${fieldStatus_709 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">

                            <c:choose>
                                <c:when test="${fn:length(supplier) > 0}">
                                    <c:forEach items="${supplier}" var="type">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input class="form-control" name="state" id="state" maxlength="${max_length_709}" type="text" value="${type.state}" onkeypress="return isNumberKey4(event)"> 
                                                <input class="form-control" name="state1" id="state1" maxlength="${max_length_709}" type="hidden" value="${type.state}" > 
                                            </c:when>
                                            <c:otherwise>
                                                <input class="form-control" readonly type="text" value="${type.state}">
                                            </c:otherwise> 
                                        </c:choose>

                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <input class="form-control" placeholder="Fill" name="state" maxlength="${max_length_709}" type="text"  value="" onkeypress="return isNumberKey4(event)">
                                </c:otherwise>        
                            </c:choose>   
                            <label style=""  class="control-label">${field_709}
                            <c:if test="${mand_status_709 eq 'required'}">
                                <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                            </c:if>
                            </label>												
                        </div>
                    </c:if>
                    
                    <c:if test="${fieldStatus_710 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">

                            <c:choose>
                                <c:when test="${fn:length(supplier) > 0}">
                                    <c:forEach items="${supplier}" var="type">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input class="form-control" name="pincode" id="pincode" type="text" value="${type.pincode}" maxlength="6" onkeypress="return isNumberKey(event)"> 
                                                <input class="form-control" name="pincode1" id="pincode1" type="hidden" value="${type.pincode}" maxlength="6" > 
                                            </c:when>
                                            <c:otherwise>
                                                <input class="form-control" readonly type="text" value="${type.pincode}">
                                            </c:otherwise> 
                                        </c:choose>

                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <input class="form-control" name="pincode" placeholder="Fill" type="text"  value="" maxlength="30" onkeypress="return isNumberKey(event)">
                                </c:otherwise>        
                            </c:choose> 
                            <label style=""  class="control-label">${field_710 }
                            <c:if test="${mand_status_710  eq 'required'}">
                                <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                            </c:if>
                            </label>												
                        </div>
                    </c:if>
                    
                    <c:if test="${fieldStatus_417 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                            <div>${field_417}
                            <c:if test="${mand_status_417 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if>
                            </div>
                            <c:choose>
                                <c:when test="${fn:length(supplier) > 0}">
                                    <c:forEach items="${supplier}" var="type">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input class="form-control" required="" name="supplierContNum" id="supplierContNum" type="tel" value="${type.supplierContNum}" onkeypress="return isNumberKey(event)" maxlength="15"> 
                                                <input class="form-control" required="" name="supplierContNum1" id="supplierContNum1" autocomplete="off" type="hidden" value="${type.supplierContNum}" minlength="8" > 
                                            </c:when>
                                            <c:otherwise>
                                                <input class="form-control" readonly type="text" value="${type.supplierContNum}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <input class="form-control" required="" name="supplierContNum" autocomplete="off" id="supplierContNum" onkeypress="return isNumberKey(event)" type="tel" value="" maxlength="15">
                                </c:otherwise>        
                            </c:choose>
                             												
                        </div>
                    </c:if>
               

                    <c:if test="${fieldStatus_418 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                            
                            <c:choose>
                                <c:when test="${fn:length(supplier) > 0}">
                                    <c:forEach items="${supplier}" var="type">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input class="form-control validate[custom[mailId]]" name="mailId" id="mailId" required="" autocomplete="off" maxlength="${max_length_418}" type="text" value="${type.mailId}" onchange="return validateEmail(event);"> 
                                                <input class="form-control validate[custom[mailId]]" name="mailId1" id="mailId1" required="" autocomplete="off" maxlength="${max_length_418}" type="hidden" value="${type.mailId}" > 
                                            </c:when>
                                            <c:otherwise>
                                                <input class="form-control" readonly type="email" value="${type.mailId}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <input class="form-control validate[custom[mailId]]" placeholder="Fill" maxlength="${max_length_418}" required="" autocomplete="off" name="mailId" id="mailId" type="text" value="" onchange="return validateEmail(event);">
                                </c:otherwise>        
                            </c:choose> 
                            <label style=""  class="control-label">Email ID
                            <c:if test="${mand_status_418 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if>
                            </label>												
                        </div>
                    </c:if>

                    <c:if test="${fieldStatus_416 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                            
                            <c:choose>
                                <c:when test="${fn:length(supplier) > 0}">
                                    <c:forEach items="${supplier}" var="type">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <textarea class="form-control" name="supplierDesc" id="supplierDesc" maxlength="${max_length_416}" autocomplete="off" style="resize: none;"  rows="1">${type.supplierDesc}</textarea>
                                                <input id="supplierDesc1" class="form-control"  rows="1" maxlength="300" style="resize: none" type="hidden" value="${type.supplierDesc}">

                                            </c:when>
                                            <c:otherwise>
                                                <textarea class="form-control" style="resize: none; " maxlength="${max_length_416}" readonly rows="1">${type.supplierDesc}</textarea>
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <textarea class="form-control" name="supplierDesc" placeholder="Fill" maxlength="${max_length_416}" autocomplete="off" style="resize: none;" id="supplierDesc"  rows="1"></textarea>
                                </c:otherwise>        
                            </c:choose>     
                            <label class="control-label">${field_416}
                            <c:if test="${mand_status_416 eq 'required'}">
                                <a style="color:transparent;">*</a>
                            </c:if>
                            </label>												
                        </div>
                    </c:if>

                    <c:if test="${fieldStatus_414 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                           
                            <c:choose>
                                <c:when test="${fn:length(supplier) > 0}">
                                    <c:forEach items="${supplier}" var="type">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input class="form-control" name="bankName" id="bankName" maxlength="${max_length_414}" type="text" value="${type.bankName}" onkeypress="return isNumberKey4(event)"> 
                                                <input class="form-control" name="bankName1" id="bankName1" maxlength="${max_length_414}" type="hidden" value="${type.bankName}" > 
                                            </c:when>
                                            <c:otherwise>
                                                <input class="form-control" readonly type="text" value="${type.bankName}">
                                            </c:otherwise> 
                                        </c:choose>

                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <input class="form-control" name="bankName" id="bankName" placeholder="Fill" maxlength="${max_length_414}" type="text"  value="" onkeypress="return isNumberKey4(event)">
                                </c:otherwise>        
                            </c:choose>      
                            <label style=""  class="control-label">${field_414}
                            <c:if test="${mand_status_414 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if>
                            </label>												
                        </div>
                    </c:if>
                    

                    <c:if test="${fieldStatus_415 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                           
                            <c:choose>
                                <c:when test="${fn:length(supplier) > 0}">
                                    <c:forEach items="${supplier}" var="type">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input class="form-control" name="accountNumber" id="accountNumber" maxlength="${max_length_415}" type="text" value="${type.accountNumber}" onkeypress="return isNumberKey(event)" onchange="return validateAcc(event);"> 
                                                <input class="form-control" name="accountNumber1" id="accountNumber1" maxlength="${max_length_415}" type="hidden" value="${type.accountNumber}"> 
                                            </c:when>
                                            <c:otherwise>
                                                <input class="form-control" readonly type="text" value="${type.accountNumber}">
                                            </c:otherwise> 
                                        </c:choose>

                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <input class="form-control" name="accountNumber" id="accountNumber" placeholder="Fill" maxlength="${max_length_415}" type="text" value="" onkeypress="return isNumberKey(event)" onchange="return validateAcc(event);">
                                </c:otherwise>        
                            </c:choose>  
                            <label style=""  class="control-label">${field_415}
                            <c:if test="${mand_status_415 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if>
                            </label>												
                        </div>
                    </c:if>

                    <c:if test="${fieldStatus_711 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                           
                            <c:choose>
                                <c:when test="${fn:length(supplier) > 0}">
                                    <c:forEach items="${supplier}" var="type">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input class="form-control" name="ifsccode" id="ifsccode" type="text" value="${type.ifsccode}" onchange="return ValidateIfscCode(event);" maxlength="11" onkeypress="return isNumberKey3(event)"> 
                                                <input class="form-control" name="ifsccode1" id="ifsccode1" type="hidden" value="${type.ifsccode}" > 
                                            </c:when>
                                            <c:otherwise>
                                                <input class="form-control" readonly type="text" value="${type.ifsccode}">
                                            </c:otherwise> 
                                        </c:choose>

                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <input class="form-control" id="ifsccode" name="ifsccode" type="text"  value="" placeholder="Fill" onchange="return ValidateIfscCode(event);" maxlength="11" onkeypress="return isNumberKey3(event)">
                                </c:otherwise>        
                            </c:choose>  
                            <label class="control-label">${field_711}
                            <c:if test="${mand_status_711 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if>
                            </label>												
                        </div>
                    </c:if>

                    <c:if test="${fieldStatus_712 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                            
                            <c:choose>
                                <c:when test="${fn:length(supplier) > 0}">
                                    <c:forEach items="${supplier}" var="type">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input class="form-control" name="branchname" id="branchname" maxlength="${max_length_712}" type="text" value="${type.branchname}" onkeypress="return isNumberKey4(event)"> 
                                                <input class="form-control" name="branchname1" id="branchname1" maxlength="${max_length_712}" type="hidden" value="${type.branchname}" > 
                                            </c:when>
                                            <c:otherwise>
                                                <input class="form-control" readonly type="text" value="${type.branchname}">
                                            </c:otherwise> 
                                        </c:choose>

                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <input class="form-control" name="branchname" id="branchname" placeholder="Fill" maxlength="${max_length_712}" type="text"  value="" onkeypress="return isNumberKey4(event)">
                                </c:otherwise>        
                            </c:choose>   
                            <label style=""  class="control-label">${field_712}
                            <c:if test="${mand_status_712 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if>
                            </label>												
                        </div>
                    </c:if>
                   

                    <c:if test="${fieldStatus_713 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                            
                            <c:choose>
                                <c:when test="${fn:length(supplier) > 0}">
                                    <c:forEach items="${supplier}" var="type">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <textarea class="form-control" name="address" id="address" maxlength="${max_length_713}" autocomplete="off" style="resize: none;" ${mand_status_413}  rows="1">${type.address}</textarea>
                                                <input id="address1" class="form-control"  rows="1" maxlength="300" style="resize: none" type="hidden" value="${type.address}">

                                            </c:when>
                                            <c:otherwise>
                                                <textarea class="form-control" style="resize: none; " rows="1" readonly>${type.address}</textarea>
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <textarea class="form-control" name="address" id="address" maxlength="${max_length_713}" placeholder="Fill" autocomplete="off" style="resize: none;" id="supplierAddress" ${mand_status_413}  rows="1"></textarea>
                                </c:otherwise>        
                            </c:choose>    
                            <label style="" class="control-label">${field_713}
                            <c:if test="${mand_status_713 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if>
                            </label>												
                        </div>
                    </c:if>

                    <c:if test="${fieldStatus_714 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                            
                            <c:choose>
                                <c:when test="${fn:length(supplier) > 0}">
                                    <c:forEach items="${supplier}" var="type">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input class="form-control validate[custom[mailId]]" name="emailid" id="emailid" required="" autocomplete="off" maxlength="${max_length_714}" type="text" value="${type.emailid}" onchange="return validateEmail(event);" > 
                                                <input class="form-control validate[custom[mailId]]" name="emailid1" id="emailid1" required="" autocomplete="off" maxlength="${max_length_714}" type="hidden" value="${type.emailid}" > 
                                            </c:when>
                                            <c:otherwise>
                                                <input class="form-control" readonly type="emailid" value="${type.emailid}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <input class="form-control validate[custom[mailId]]" maxlength="${max_length_714}" required="" placeholder="Fill" autocomplete="off" name="emailid" id="emailid" type="text" value="" onchange="return validateEmail(event);" >
                                </c:otherwise>        
                            </c:choose> 
                            <label style=""  class="control-label">${field_714}
                            <c:if test="${mand_status_714 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if>
                            </label>												
                        </div>
                    </c:if>
                    
                    <c:if test="${fieldStatus_715 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                            <div>${field_715}
                            <c:if test="${mand_status_715 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if>
                            </div>
                            <c:choose>
                                <c:when test="${fn:length(supplier) > 0}">
                                    <c:forEach items="${supplier}" var="type">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input class="form-control" required="" name="contNum" id="contNum" autocomplete="off" type="tel" value="${type.contNum}" onkeypress="return isNumberKey(event)" maxlength="15"> 
                                                <input class="form-control" required="" name="contNum1" id="contNum1" autocomplete="off" type="hidden" value="${type.contNum}" minlength="8" > 
                                            </c:when>
                                            <c:otherwise>
                                                <input class="form-control" readonly type="text" value="${type.contNum}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <input class="form-control" required="" name="contNum" autocomplete="off" id="contNum" onkeypress="return isNumberKey(event)" type="tel" value="" maxlength="15">
                                </c:otherwise>        
                            </c:choose>   
                            												
                        </div>
                    </c:if>                                        


                    <c:if test="${action ne 'view'}">

                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                            <button type="button" class="btn btn-primary" style="" onclick="return test12();">Save</button>
                            <a href="../master/supplierList.htm" class="btn btn-danger">Cancel</a>
                        </div>
                    </c:if>
                    <c:if test="${action eq 'view'}">

                        <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
                            <a href="../master/supplierList.htm" class="btn btn-danger">Cancel</a>
                        </div>

                    </c:if>

                </form>
            </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->
<script>
    $(function (){
        var input = document.querySelector("#supplierContNum");
        var myinput = window.intlTelInput(input, {
            initialCountry: "om",
            onlyCountries: ["om", "in", "ae"],
            hiddenInput: "full",
            separateDialCode: true,
            autoHideDialCode: false,
            utilsScript: "//cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.3/js/utils.js",
        });
        $("#supplierContNum").change(function () {
            var full_number = myinput.getNumber(intlTelInputUtils.numberFormat.E164);
            $("#supplierContNum").val(full_number);
            if (myinput.isValidNumber() == false) {
                $("#supplierContNum").val("");
                swal("Please enter valid mobile number");
                return false;
            }
        });
    });                   
</script>
<script>
    $(function (){
        var input = document.querySelector("#contNum");
        var myinput = window.intlTelInput(input, {
            initialCountry: "om",
            onlyCountries: ["om", "in", "ae"],
            hiddenInput: "full",
            separateDialCode: true,
            autoHideDialCode: false,
            utilsScript: "//cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.3/js/utils.js",
        });
        $("#contNum").change(function () {
            var full_number = myinput.getNumber(intlTelInputUtils.numberFormat.E164);
            $("#contNum").val(full_number);
            if (myinput.isValidNumber() == false) {
                $("#contNum").val("");
                swal("Please enter valid mobile number");
                return false;
            }
        });
    });                   
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js" integrity="sha512-DNeDhsl+FWnx5B1EQzsayHMyP6Xl/Mg+vcnFPXGNjUZrW28hQaa1+A4qL9M+AiOMmkAhKAWYHh1a+t6qxthzUw==" crossorigin="anonymous"></script>

    </body>

</html>
