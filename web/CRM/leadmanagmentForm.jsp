<%-- 
    Document   : leadmanagmentForm
    Created on : 4 Mar, 2016, 10:55:23 AM
    Author     : ebs-sdd05
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../common/validate/validationEngine.css" type="text/css">
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript" charset="utf-8"></script>
        <script src="../common/validate/jquery.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript" src="../common/csspopup.js"></script>
        <script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>
        <script type="text/javascript" src="../common/validate/countries.js"></script>

        <title>arête Assets Management</title>
        <script type="text/javascript">

            jQuery(document).ready(function () {

                //  $("#tag").toggle();
                $("#tag1").toggle();
                $("#tag2").toggle();
                $("#tagCampaign1").toggle();
                $("#others1").toggle();

                jQuery("#leadForm").validationEngine();

                $('#company').keyup(function () {
                    this.value = this.value.toUpperCase();
                });
                $('#mobile').bind("cut copy paste", function (e) {
                    e.preventDefault();
                });
                $('#landline').bind("cut copy paste", function (e) {
                    e.preventDefault();
                });
                $('#postbxno').bind("cut copy paste", function (e) {
                    e.preventDefault();
                });
                $('#pincode').bind("cut copy paste", function (e) {
                    e.preventDefault();
                });

            });

            function call() {
                $("#tag").toggle();
                $("#tag1").hide();
                $("#tag2").hide();
            }

            function call1() {
                $("#tag").hide();
                $("#tag1").toggle();
                $("#tag2").hide();
            }

            function call2() {
                $("#tag").hide();
                $("#tag1").hide();
                $("#tag2").toggle();
            }

            function call3() {
                $("#tag").hide();
                $("#tag1").hide();
                $("#tag2").hide();
            }

            function isNumberKey(evt)
            {
                var charCode = (evt.which) ? evt.which : event.keyCode
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                {
                    alert("Please Enter Numeric value");
                    return false;
                }
                return true;

            }

            function test12()
            {

                var x = $('#company').val() &&
                        $('#firstName').val() &&
                        $('#salutation').val() &&
                        $('#division').val() &&
                        $('#leadCode').val() &&
                        $('#leadType').val() &&
                        $('#leadSource').val() &&
                        $('#mobile').val() &&
                        $('#city').val() &&
                        $('#categoryEnq').val() &&
                        $('#nameEnquiry').val();
                var leads = $('#leadSource').val();
                var pd = $('#gender').val() &&
                        $('#nationality').val();
                var tag = $('tagCampaign').val();
                var oth = $('#others').val();

                if (x === '')
                {

                    alert("Please Fill Mandatory Fields");
                    $('#company').focus();
                    $('#firstName').focus();
                    $('#salutation').focus();
                    $('#division').focus();
                    $('#leadCode').focus();
                    $('#leadType').focus();
                    $('#leadSource').focus();
                    $('#mobile').focus();
                    $('#city').focus();
                    $('#categoryEnq').focus();
                    $('#nameEnquiry').focus();
                    return false;
                }

                if (pd === '')
                {
                    call();
                    alert("Please Fill Mandatory Fields");
                    return false;
                }
                if (leads === 'Campaign') {
                    if (tag === '') {
                        alert("Please Fill Mandatory Fields");
                        return false;

                    }
                    else {
                        document.forms["leadForm"].submit();
                    }
                }

                if (leads === 'Others') {
                    if (oth === '') {
                        alert("Please Fill Mandatory Fields");
                        return false;

                    }
                    else {
                        document.forms["leadForm"].submit();
                    }
                }

                else {
                    document.forms["leadForm"].submit();
                }

            }


            function mobileNoValidation()
            {

                var mobileNo = document.getElementById("mobile").value;
                var mob = mobileNo.length;
                if (mob < 8) {
                    alert("Enter Valid Mobile No.");
                    $('#mobile').val("");
                    return false;
                }


            }

            function landnovalidate()
            {

                var landline = document.getElementById("landline").value;
                var mob = landline.length;
                if (mob < 11) {
                    alert("Enter Valid Land Line No.!\nIt sholud not be less than 11 digits!")
                    $('#landline').val("");
                    return false;
                }


            }

            function pstbxno()
            {

                var postbxno = document.getElementById("postbxno").value;
                var mob = postbxno.length;
                if (mob < 4) {
                    alert("Enter Valid Post Box No.");
                    $('#postbxno').val("");
                    return false;
                }


            }

            function postlcde()
            {

                var pincode = document.getElementById("pincode").value;
                var mob = pincode.length;
                if (mob < 3) {
                    alert("Enter Valid Postal Code");
                    $('#pincode').val("");
                    return false;
                }


            }

            function checkImageSize()
            {
                var x = document.getElementById('attachmentName').value;
                var size = ($("#attachmentName")[0].files[0].size) / (200 * 230);
                if (parseFloat(size) > 9)
                {
                    alert("Exceeding File Size");
                    $('#attachmentName').val("");
                }
                else {
                    Validate();
                }
            }

            function Validate()
            {
                var $fin = $($this).closest('tr');
                var fl = $fin.find('#attachmentName').val();
                var fileSize = $this.files[0];
                var sizeInMb = fileSize.size / 1024;
                var sizeLimit = 1024 * 2;
                if (sizeInMb > sizeLimit) {
                    alert("File Size Exceeded(Only 2MB Allowed)");
                    $($this).val('');
                    return;
                }
                var fmt = /^.*\.(jpg|JPG|gif|GIF|png|PNG|jpeg|JPEG|xls|XLS|xlsx|XLSX|doc|DOC|pdf|PDF|docx|DOCX|ods|ODS|txt|TXT|odt|ODT)$/;
                if (!fl.match(fmt))
                {
                    alert('Invalid File');
                    $($this).val('');
                    return false;
                }

                else {
                    return true;
                }
            }

            function  emailValidate()
            {
                var emailId = document.getElementById("email").value;
                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                if (!emailId.match(mailformat))
                {
                    alert("You have entered an invalid email address!");
                    $("#email").val("");
                    return false;
                }

            }


            function checkavl(test)
            {
                if (test === 'Ms')
                {
                    var x = "Female";
                    $('#gender').val(x);
                    return false;
                }
                else if (test === 'Mr')
                {
                    var x = "Male";
                    $('#gender').val(x);
                    return false;
                }
                else if (test === 'Mrs')
                {
                    var x = "Female";
                    $('#gender').val(x);
                    return false;
                }

            }


            function checktagcmpgn(test)
            {
                if (test === 'Campaign')
                {
                    $("#tagCampaign1").show();
                    $("#others1").hide();
                    return false;
                }
                if (test === 'Others')
                {
                    $("#others1").show();
                    $("#tagCampaign1").hide();
                    return false;
                }
                else {
                    $("#tagCampaign1").hide();
                    $("#others1").hide();
                    return false;
                }

            }

            function selectcampaign()
            {
                myWindow = window.open("../CRM/selectcampaign.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }

            function selectCompanyDetails()
            {
                myWindow = window.open("../CRM/selectCompanyDetails.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }

        </script>
    </head>

    <% java.util.Date d = new java.util.Date();%>
    <body class="nav-sm">
        <div id="blanket" style="display: none;"></div>
        <div id="popUpDiv" style="display: none;"></div>
        <div class="container body">


            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">


                        <div class="clearfix"></div>
                        <form class="form-inline" id="leadForm" accept-charset="UTF-8" method="post" action="../CRM/leadmanagmentFormSubmit.htm" enctype="multipart/form-data" >
                            <div class="col-md-6 col-xs-12">
                                <div class="x_panel" >
                                    <jsp:include page="../login/headerlink.htm?submodule=Lead Management&tab=Lead Management&pagetype=form"/>
                                    <div class="x_title"   >
                                        <h2>Lead Management</h2>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <br />

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label" style="padding-right: 20px;"><a style="font-size: 18px;color:#AA0000;font-weight: bold;"></a>  Business Card </label>
                                            <div class="controls" >
                                                <c:choose>
                                                    <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                        <c:forEach items="${leadmanagmentList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <c:forEach items="${purchDocList}" var="doc">
                                                                        <c:if test="${not empty doc.fileName}">
                                                                            <a style="color: black" href="../CRM/complaintattachDownload.htm?sno=${doc.SNo}" title="Click to download">
                                                                                <i class="fa fa-file-pdf-o" style="font-size: 15px" ></i>
                                                                                ${doc.fileName}
                                                                            </a>
                                                                        </c:if> 
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>


                                                                    <c:forEach items="${purchDocList}" var="doc">

                                                                        <c:if test="${not empty doc.fileName}">
                                                                            <a style="color: black" href="../CRM/complaintattachDownload.htm?sno=${doc.SNo}" title="Click to download">
                                                                                <i class="fa fa-file-pdf-o" style="font-size: 15px" ></i>
                                                                                ${doc.fileName}
                                                                            </a>
                                                                        </c:if> 
                                                                    </c:forEach>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <!--                                                        <input class="input-xlarge validate[] " id="Image" name="Image" type="file" value="" onchange="readURL(this);">
                                                                                                                <img src="../menu/uploadimages.jpg" id="ig" src="#" width="120px;" height="120px;" style="border: 1px solid #067234;"/>
                                                                                                                <br/><br/>
                                                                                                                                                             <ul style="list-style-type:none;">-->

                                                        <button type="button"  id="addValue" value="doc" class="button5" onclick="add1();">Attachment</button>
                                                        <!--<img src="../menu/uploadimages.jpg" id="ig" src="#" width="120px;" height="120px;" style="border: 1px solid #067234;"/>-->

                                                    </c:otherwise> 
                                                </c:choose>
                                            </div>
                                        </div>  
                                        <table  id="attachTable">

                                            <tbody >

                                            </tbody>
                                            <script>


                                                }
                                            </script>
                                        </table>
                                        <p>&nbsp;</p>  <p>&nbsp;</p>  
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color:red">*</span> Division
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                    <c:forEach items="${leadmanagmentList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input name="division" id="division" class="form-control validate[required]" type="text" readonly value="${type.division}">

                                                            </c:when>
                                                            <c:otherwise>
                                                                <input name="division" class="form-control" type="text" readonly value="${type.division}">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <select id="division" name="division" class="form-control validate[required]">
                                                        <option value="" disabled selected>Select your option</option>
                                                        <option value="YYCH">YYCH</option>
                                                        <option value="TCP">TCP</option>
                                                        <option value="TLP">TLP</option>
                                                        <option value="MJF">MJF</option>
                                                        <option value="YYCH">TLOP</option>
                                                        <option value="TCP">AJHO</option>
                                                        <option value="TLP">SC</option>
                                                        <option value="MJF">AJH</option>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color:red">*</span> Company
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                    <c:forEach items="${leadmanagmentList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="company" name="company" maxlength="100" class="form-control validate[required]" autocomplete="off" value="${type.company}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="company"  name="company" readonly class="form-control" value="${type.company}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                    <input type="text" id="company" name="company" maxlength="100" value="" class="form-control validate[required]" autocomplete="off" >
                                                    <img src="../common/theme/images/select1.png" width="40" height="30" alt="" onmouseover="" style="cursor: pointer;" onclick="selectCompanyDetails();" >
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>
                                        <p>&nbsp;</p> 
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color:red">*</span> Lead Code
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                    <c:forEach items="${leadmanagmentList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="leadCode" name="leadCode" readonly class="form-control validate[required]" value="${type.leadCode}">
                                                                <input name="sno" type="hidden" value="${type.sno}">
                                                                <input name="status" type="hidden" value="${type.status}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="leadCode"  name="leadCode" readonly class="form-control" value="${type.leadCode}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" id="leadCode" name="leadCode" readonly="" class="form-control validate[required]" value="LEAD-" >
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color:red">*</span> Lead Type</label>
                                            <c:choose>
                                                <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                    <c:forEach items="${leadmanagmentList}" var="type">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input name="leadType" class="form-controlvalidate[required] " type="text" readonly value="${type.leadType}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input name="leadType" class="form-control" type="text" readonly value="${type.leadType}">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                    <select id="leadType" name="leadType" class="form-control validate[required]">
                                                        <option value="" disabled selected>Select your option</option>
                                                        <option value="VIP">VIP</option>
                                                        <option value="VVIP">VVIP</option>
                                                        <option value="Regular">Regular</option>
                                                        <option value="Walk-In">Walk-In</option>
                                                        <option value="Internal Employee">Internal Employee</option>

                                                    </select>
                                                </c:otherwise>

                                            </c:choose>

                                        </div>

                                        <p>&nbsp;</p> 
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color:red">*</span> Salutation
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                    <c:forEach items="${leadmanagmentList}" var="type">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input name="salutation" id="salutation" class="form-control validate[required]" type="text" readonly  value="${type.salutation}">

                                                            </c:when>
                                                            <c:otherwise>
                                                                <input name="salutation" id="salutation" class="form-control" type="text" readonly  value="${type.salutation}">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                    <select id="salutation" name="salutation" class="form-control validate[required]" onclick="checkavl(this.value);">
                                                        <option value="" disabled selected>Select your option</option>
                                                        <option value="Ms">Ms</option>
                                                        <option value="Mr">Mr</option>

                                                    </select>

                                                </c:otherwise>        
                                            </c:choose>

                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color:red">*</span>&nbsp;First Name
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                    <c:forEach items="${leadmanagmentList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="firstName" name="firstName" maxlength="100" class="form-control validate[required]" autocomplete="off" value="${type.firstName}" >
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="firstName"  name="firstName" class="form-control"  readonly value="${type.firstName}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" id="firstName" name="firstName" maxlength="100" value="" autocomplete="off" class="form-control validate[required]" >
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                        <p>&nbsp;</p> 
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label">&nbsp;&nbsp;Last Name
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                    <c:forEach items="${leadmanagmentList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="lastName" name="lastName" maxlength="100" class="form-control" value="${type.lastName}" autocomplete="off">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="lastName"  name="lastName" class="form-control"  readonly value="${type.lastName}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" id="lastName" name="lastName" maxlength="100" value="" class="form-control validate[contactPerson]" autocomplete="off">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label">&nbsp;&nbsp;Lead Status
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                    <c:forEach items="${leadmanagmentList}" var="type">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input name="leadStatus" class="form-control" type="text" readonly value="${type.leadStatus}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input name="leadStatus" class="form-control" type="text" readonly value="${type.leadStatus}">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                    <select id="leadStatus" name="leadStatus" class="form-control">
                                                        <option value="" disabled selected>Select your option</option>
                                                        <option value="Interested">Interested</option>
                                                        <option value="Prospect">Prospect</option>
                                                        <option value="Very Much Interested">Very Much Interested</option>
                                                        <option value="Later stage">Later stage</option>

                                                    </select>

                                                </c:otherwise>        
                                            </c:choose>

                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color:red">*</span>&nbsp;Lead Source</label>
                                            <c:choose>
                                                <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                    <c:forEach items="${leadmanagmentList}" var="type">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input name="leadSource" class="form-control validate[required]" type="text" readonly  value="${type.leadSource}">

                                                            </c:when>
                                                            <c:otherwise>
                                                                <input name="leadSource" class="form-control" type="text" readonly  value="${type.leadSource}">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                    <select id="leadSource" name="leadSource" class="form-control validate[required]" onclick="checktagcmpgn(this.value);">
                                                        <option value="" disabled selected>Select your option</option>
                                                        <option value="TV">TV</option>
                                                        <option value="Campaign">Campaign</option>
                                                        <option value="News Paper">News Paper</option>
                                                        <option value="Word Of Mouth">Word Of Mouth</option>
                                                        <option value="Personal">Personal</option>
                                                        <option value="Offline">Offline</option>
                                                        <option value="Others">Others</option>


                                                    </select>

                                                </c:otherwise>        
                                            </c:choose>

                                            <p>&nbsp;</p> 
                                            <div id="tagCampaign1" class="col-md-6 col-sm-12 col-xs-12 form-inline" style="margin-left:-9px;">
                                                <label class="control-label" ><span style="color:red">*</span> Tag Campaign</label>
                                                <c:choose>
                                                    <c:when test="${action ne 'edit'}">
                                                        <input type="text" id="tagCampaign" name="tagCampaign" value="" readonly="" placeholder="Select Campaign Details" class="form-control" onclick="selectcampaign();" >
                                                        <input type="hidden" id="campaignCode" name="campaignCode" value="" class="form-control" readonly /> 
                                                    </c:when>
                                                </c:choose>
                                            </div>

                                            <div class="col-md-6 col-sm-12 col-xs-12 form-inline" style="margin-left:-9px;">

                                                <c:forEach items="${leadmanagmentList}" var="type">

                                                    <c:choose>
                                                        <c:when test="${type.leadSource eq 'Campaign'}"> 
                                                            <label class="control-label"><span style="color:red">*</span> Tag Campaign</label>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <label class="control-label"></label>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>

                                                <c:choose>
                                                    <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                        <c:forEach items="${leadmanagmentList}" var="type">

                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <c:choose>
                                                                        <c:when test="${type.leadSource eq 'Campaign'}">
                                                                            <input type="text" id="tagCampaign" name="tagCampaign"  class="form-control" readonly value="${type.tagCampaign}"/>   
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="hidden" id="tagCampaign" name="tagCampaign"  class="form-control" readonly value="${type.tagCampaign}"/>   
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </c:when>

                                                                <c:otherwise>
                                                                    <c:choose>
                                                                        <c:when test="${type.leadSource eq 'Campaign'}">
                                                                            <input type="text" id="tagCampaign" name="tagCampaign"  class="form-control" readonly value="${type.tagCampaign}"/>   
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="hidden" id="tagCampaign" name="tagCampaign"  class="form-control" readonly value="${type.tagCampaign}"/>   
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>

                                                </c:choose>
                                            </div>


                                            <div id="others1" class="col-md-6 col-sm-12 col-xs-12 form-inline" style="margin-left:-9px;">
                                                <label class="control-label"><span style="color:red">*</span> Others</label>
                                                <c:choose>
                                                    <c:when test="${action ne 'edit'}">
                                                        <input type="text" id="others" name="others" maxlength="20" value="" class="form-control"  >
                                                    </c:when>
                                                </c:choose>
                                            </div>

                                            <div class="col-md-6 col-sm-12 col-xs-12 form-inline" style="margin-left:-9px; margin-top:-20px">

                                                <c:forEach items="${leadmanagmentList}" var="type">
                                                    <c:choose>
                                                        <c:when test="${type.leadSource eq 'Others'}"> 
                                                            <label class="control-label"><span style="color:red">*</span> Others</label>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <label class="control-label"></label>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>

                                                <c:choose>
                                                    <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                        <c:forEach items="${leadmanagmentList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <c:choose>
                                                                        <c:when test="${type.leadSource eq 'Others'}">
                                                                            <input type="text" id="others" name="others"  class="form-control" maxlength="20" readonly value="${type.others}"/>   
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="hidden" id="others" class="form-control"  maxlength="20" readonly value="${type.others}"/>   
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </c:when>

                                                                <c:otherwise>
                                                                    <c:choose>
                                                                        <c:when test="${type.leadSource eq 'Others'}">
                                                                            <input type="text" id="others" name="others"  class="form-control"  maxlength="20" readonly value="${type.others}"/>   
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="hidden" id="others" class="form-control" maxlength="20" readonly value="${type.others}"/>   
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>

                                                </c:choose>
                                            </div>

                                        </div>

                                        <p>&nbsp;</p> 


                                        <div class="x_title">
                                            <h2>Address Details</h2>

                                            <div class="clearfix"></div>
                                        </div>

                                        <p>&nbsp;</p>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label">Address
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                    <c:forEach items="${leadmanagmentList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <textarea class="form-control" style="resize: none" maxlength="100" name="address1"  id="address1" type="text" value="${type.address1}" autocomplete="off">${type.address1} </textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea class="form-control" readonly style="resize: none" type="text" value="${type.address1}">${type.address1}</textarea>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <textarea class="form-control" style="resize: none" maxlength="100" value="" name="address1" id="address1" type="text" autocomplete="off"></textarea>



                                                </c:otherwise>        
                                            </c:choose>
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label">&nbsp;&nbsp;Post Box No
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                    <c:forEach items="${leadmanagmentList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input name="postbxno" id="postbxno" maxlength="4" class="form-control" type="text" readonly value="${type.postbxno}" onkeypress="return isNumberKey(event)" autocomplete="off">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input name="postbxno" class="form-control" type="text" readonly value="${type.postbxno}">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input id="postbxno" name="postbxno" maxlength="4" class="form-control" onkeypress="return isNumberKey(event)" onchange="pstbxno();" value="" autocomplete="off">

                                                </c:otherwise>        
                                            </c:choose>
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label">&nbsp;&nbsp;Postal Code
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                    <c:forEach items="${leadmanagmentList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="pincode" name="pincode" class="form-control" maxlength="3" value="${type.pincode}" onchange="postlcde();" onkeypress="return isNumberKey(event)" autocomplete="off">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="pincode"  name="pincode" readonly class="form-control" value="${type.pincode}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" id="pincode" name="pincode" class="form-control" maxlength="3" onkeypress="return isNumberKey(event)" onchange="postlcde();" autocomplete="off">
                                                    <input name="landmark" id="landmark" class="form-control" type="hidden" value=""  >
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                        <p>&nbsp;</p> 
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color:red">*</span>&nbsp;City
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                    <c:forEach items="${leadmanagmentList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input name="city" id="city" class="form-control validate[required]" type="text" readonly value="${type.city}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input name="city" class="form-control" type="text" readonly value="${type.city}">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <select id="city" name="city" class="form-control validate[required]">
                                                        <option value="" disabled selected>Select your option</option>
                                                        <option value="Sohar">Sohar</option>
                                                        <option value="Muscat">Muscat</option>


                                                    </select>

                                                </c:otherwise>        
                                            </c:choose>
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color:red">*</span>&nbsp;Country              
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                    <c:forEach items="${leadmanagmentList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input name="country" class="form-control" type="text" readonly value="${type.country}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input name="country" class="form-control" type="text" readonly value="${type.country}">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input name="country" id="country" class="form-control"  type="text" readonly value="Oman">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>


                                        <p>&nbsp;</p> 
                                        <div class="x_title">
                                            <h2>Contact Details</h2>
                                            <div class="clearfix"></div>
                                        </div>

                                        <p>&nbsp;</p>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label">Email
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                    <c:forEach items="${leadmanagmentList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="email" name="email" maxlength="100" autocomplete="off" value="${type.email}" class="form-control validate[custom[email]]" onchange="emailValidate();">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="email"  name="email" readonly class="form-control" value="${type.email}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" id="email" name="email" maxlength="100" value="" autocomplete="off" class="form-control validate[custom[email]]" onchange="emailValidate();">
                                                </c:otherwise>
                                            </c:choose>
                                        </div>


                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label"><span style="color:red">*</span>&nbsp;Mobile No
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                    <c:forEach items="${leadmanagmentList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="mobile" name="mobile" class="form-control validate[required]" autocomplete="off" maxlength="11" value="${type.mobile}" onkeypress="return isNumberKey(event)" onchange="mobileNoValidation()">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text"   name="mobile" readonly class="form-control" value="${type.mobile}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" id="mobile" name="mobile" value="" class="form-control validate[required]" autocomplete="off" maxlength="11" onkeypress="return isNumberKey(event)" onchange="mobileNoValidation();">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label">Landline No
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                    <c:forEach items="${leadmanagmentList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="landline" name="landline" class="form-control" autocomplete="off" maxlength="11" min="8" value="${type.landline}" onkeypress="return isNumberKey(event)" onchange="landnovalidate();">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="landline"  name="landline" readonly class="form-control"  maxlength="11" min="8" value="${type.landline}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" id="landline" name="landline" class="form-control" value="" autocomplete="off" onkeypress="return isNumberKey(event)" maxlength="11" min="8" onchange="landnovalidate();">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                        <p>&nbsp;</p> 
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label">Remarks
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                    <c:forEach items="${leadmanagmentList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <textarea class="form-control" style="resize: none" maxlength="100" autocomplete="off" name="remarks1"  id="remarks1" type="text" value="${type.remarks1}" >${type.remarks1} </textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea class="form-control" style="resize: none" readonly type="text" value="${type.remarks1}">${type.remarks1}</textarea>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <textarea class="form-control" style="resize: none" maxlength="100" value="" autocomplete="off" name="remarks1" id="remarks1" type="text"></textarea>



                                                </c:otherwise>        
                                            </c:choose>
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <br/><label class="control-label">&nbsp;&nbsp;Follow Up Date
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                    <c:forEach items="${leadmanagmentList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="followUp" name="followUp" class="form-control" onmouseover="" style="cursor: pointer;" readonly="" placeholder="Select Date" value="<fmt:formatDate pattern="dd-MMM-yyyy"  value="${type.followUp}"/>" onclick="javascript:NewCssCal('followUp', 'ddMMMyyyy')"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="followUp"  name="followUp" readonly class="form-control" readonly=""  value="<fmt:formatDate pattern="dd-MMM-yyyy"  value="${type.followUp}"/>">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" id="followUp" name="followUp" readonly="" onmouseover="" style="cursor: pointer;" value="" placeholder="Select Date" class="form-control" onclick="javascript:NewCssCal('followUp', 'ddMMMyyyy')" >
                                                    <input type="hidden" value="" id="followUpHistory" name="followUpHistory" class="form-control">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>


                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label">Follow Up Remarks
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                    <c:forEach items="${leadmanagmentList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <textarea class="form-control" style="resize: none" maxlength="100" autocomplete="off" name="remarks2"  id="remarks2" type="text" value="${type.remarks2}" >${type.remarks2} </textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea class="form-control" style="resize: none" readonly type="text" value="${type.remarks2}">${type.remarks2}</textarea>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <textarea class="form-control" style="resize: none" maxlength="100" value="" autocomplete="off" name="remarks2" id="remarks2" type="text"></textarea>
                                                    <input type="hidden" id="feedbackAttachment"  name="feedbackAttachment" value="" class="form-control" >


                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                        <p>&nbsp;</p>   
                                        <p>&nbsp;</p>    

                                        <div class="x_title">
                                            <h2>Product Details</h2>

                                            <div class="clearfix"></div>
                                        </div>

                                        <div style="margin-top: 20px;overflow: scroll;height: auto;border: 1px solid gray;background:#f5f6f7;">
                                            <table  class="table table-striped responsive-utilities jambo_table" id="LeadProtable">
                                                <thead>
                                                    <tr class="item-LeadPro">      
                                                        <c:if test="${action ne 'view'}">
                                                            <th><i class="fa fa-trash fa-lg"></i></th>
                                                            </c:if>
                                                        <th style="width:12%;"><span style="color:red">*</span> Product Type</th>
                                                        <th style="width:12%;"><span style="color:red">*</span> Product Name</th>
                                                        <th style="width:12%;">Expected OBV </th>
                                                        <th style="width:12%;">Priority</th>
                                                        <th style="width:12%;">Remarks</th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <c:if test="${action eq 'edit'}">
                                                        <c:forEach items="${leadmanagmentList1}" var="list">
                                                            <tr class="item-LeadPro">
                                                                <td align="center" onclick=""><button type="button" id="deleteLeadPro"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                                <td><input style="width:200px;"  class="form-control" maxlength="100" required autocomplete="off" name="productType" id="categoryEnq" type="text" readonly value="${list.productType}" ></td>      
                                                                <td><input style="width:200px;"  class="form-control" autocomplete="off" name="productName"   id="nameEnquiry" type="text" value="${list.productName}" readonly="">
                                                                    <input style="width:200px;" class="form-control" maxlength="100" required autocomplete="off" name="codeEnquiry" id="codeEnquiry"  onkeypress="" type="hidden" value="${list.codeEnquiry}">
                                                                    <input style="width:200px;" class="form-control" readonly autocomplete="off"  name="uomEnquiry" id="uomEnquiry" type="hidden" value="${list.uomEnquiry}">
                                                                    <input style="width:200px;"  id="itemunitPrice" name="itemunitPrice" type="hidden" value="${list.itemunitPrice}">
                                                                </td>
                                                                <td><input style="width:200px;text-align: center;" class="form-control" autocomplete="off" name="expectedObv"  id="expectedObv" maxlength="15" type="text" readonly value="${list.expectedObv}"></td>
                                                                <td><input style="width:200px;" class="form-control" autocomplete="off" name="pri"  id="priority" maxlength="200" type="text" readonly value="${list.priority}"></td>
                                                                <td><input style="width:200px;" class="form-control"  autocomplete="off" maxlength="200" id="remarks" name="remarks"  type="text" readonly value="${list.remarks}"></td>
                                                            </tr>
                                                            <c:set var="i" value="${i+1}"/>
                                                        </c:forEach> 
                                                    </c:if>
                                                    <c:if test="${action eq 'view'}">
                                                        <c:forEach items="${leadmanagmentList1}" var="list">
                                                            <tr class="item-LeadPro">


                                                                <td><input style="width:200px;"  class="form-control" maxlength="100" readonly="" required autocomplete="off" name="productType" id="productType" type="text" value="${list.productType}" ></td>      


                                                                <td><input style="width:200px;"  class="form-control" autocomplete="off" name="productName" readonly  id="productName" type="text" value="${list.productName}" >
                                                                    <input style="width:200px;"  class="form-control" maxlength="100" required autocomplete="off" name="codeEnquiry" id="codeEnquiry"  onkeypress="" type="hidden" value="${list.codeEnquiry}">
                                                                    <input style="width:200px;"  class="form-control" readonly autocomplete="off"  name="uomEnquiry" id="uomEnquiry" type="hidden" value="${list.uomEnquiry}">
                                                                    <input style="width:200px;"  id="itemunitPrice" name="itemunitPrice" type="hidden" value="${list.itemunitPrice}">
                                                                </td>
                                                                <td><input style="width:200px;text-align:center;"  class="form-control" autocomplete="off" name="expectedObv" readonly id="expectedObv" maxlength="15" type="text" value="${list.expectedObv}"></td>
<!--                                                                    <td><input class="form-control" required autocomplete="off"name="productStage"   id="productStage" type="text" value="${list.productStage}"></td>
                                                                <td><input class="form-control" autocomplete="off"name="stageComments"  id="stageComments" maxlength="200" type="text" value="${list.stageComments}"></td>-->
                                                                <td><input style="width:200px;"  class="form-control" autocomplete="off"name="pri" readonly  id="priority" maxlength="200" type="text" value="${list.priority}"></td>

                                                                <td><input style="width:200px;"  class="form-control"  autocomplete="off" maxlength="200" id="remarks" readonly name="remarks"  type="text" value="${list.remarks}"></td>
                                                            </tr>
                                                            <c:set var="i" value="${i+1}"/>
                                                        </c:forEach> 
                                                    </c:if>
                                                    <c:if test="${action eq null}">
                                                        <tr class="item-LeadPro">
                                                            <td align="center" onclick=""><button type="button"  id="deleteLeadPro"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td>
                                                                <select class="form-control validate[required]" id="categoryEnq" name="productType" style="width:200px;">
                                                                    <option value=""  selected>Select Product Type</option>
                                                                    <c:forEach items="${menucategoryList}" var="menu">                                                                
                                                                        <option value="${menu.categoryName}">${menu.categoryName}</option> 
                                                                    </c:forEach>
                                                                </select>
                                                            </td>      
                                                            <td><input style="width:200px;"  class="form-control validate[required]" maxlength="100" autocomplete="off" name="productName" id="nameEnquiry" placeholder="Select Product" readonly="" onclick="selectItem(this);" type="text" value="" >

                                                                <input style="width:200px;"  class="form-control" maxlength="100" required autocomplete="off" name="codeEnquiry" id="codeEnquiry"  onkeypress="" type="hidden" value="">
                                                                <input style="width:200px;"  class="form-control" readonly autocomplete="off"  name="uomEnquiry" id="uomEnquiry" type="hidden">
                                                                <input style="width:200px;"  id="itemunitPrice" name="itemunitPrice" type="hidden" value="0.0">
                                                            </td> 

                                                            <td><input style="width:200px;text-align:center;"  class="form-control" autocomplete="off" name="expectedObv" id="expectedObv" maxlength="15" type="text" onkeypress="return isNumberKey(event);" value="0"></td>

                                                            <td>
                                                                <select style="width:200px;"  class="form-control" id="priority" name="pri" >
                                                                    <option value="" selected>Select your option</option>
                                                                    <option value="Low">Low</option>
                                                                    <option value="Medium">Medium</option>
                                                                    <option value="High">High</option>                                                              
                                                                </select>
                                                            </td>  
                                                            <td><input  style="width:200px;"  class="form-control"  autocomplete="off" maxlength="200" name="remarks" id="remarks" type="text" value=""></td>
                                                        </tr>
                                                    </c:if>




                                                </tbody>
                                            </table>
                                            <c:if test="${action ne 'view'}">
                                                <div style="margin-top: 10px;">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <!--<button id="addRowBtn" class="btn btn-danger" style=""><i class="glyphicon glyphicon-plus"></i>ADD</button>-->
                                                            <a id="addLeadProBtn"  class="btn btn-succ" tabindex=""><i class="glyphicon glyphicon-plus"></i> Add Item</a>

                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>


                                        </div>

                                        <div class="clearfix"></div>

                                        <br/>

                                        <div>
                                            <ul class="nav nav-tabs">
                                                <li onclick="call();" class="active" ><a><span style="color:#172D44;font-size:14px;">${tablist.tabName}</span>Personal Details</a></li>
                                                <li onclick="call1();" class="active" ><a><span style="color:#172D44;font-size:14px;">${tablist.tabName}</span>Business Profiles</a></li>
                                            </ul>
                                            <div id="tag" ><jsp:include page="../CRM/personalDetails.htm"></jsp:include></div>
                                            <div id="tag1"><jsp:include page="../CRM/businessProfiles.htm"></jsp:include></div>

                                            </div>
                                            <p>&nbsp;</p>
                                            <p>&nbsp;</p>

                                        <c:if test="${action ne 'view'}">

                                            <div class="form-actions" >
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <p>&nbsp;</p>
                                                        <button type="submit" class="btn btn-primary" style="" > Save </button>

                                                        <a href="../CRM/leadmanagmentList.htm"  class="btn btn-danger"  style="">Cancel</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>

                                    </div> 
                                </div>
                            </div>




                        </form>   
                        <!-- /page content -->
                    </div>
                </div>

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
            function selectItem($this) {

                var $itemRow = $($this).closest('tr');
                var rowCount = ($($this).closest("tr")[0].rowIndex);
                var cat1 = $itemRow.find('#categoryEnq').val();
                var sum = "";
                $('input#nameEnquiry').each(function (i) {
                    sum = sum + "/" + $(this).val();
                });
                if (cat1 == '') {

                    alert("Select Product Type");
                    return false;
                }
                $itemRow.attr('id', "row" + rowCount);
                var rowid1 = "row" + rowCount;
                myWindow = window.open("../CRM/selectItemsSales.htm?cat=" + cat1 + "&rowid=" + rowid1 + "&pitems=" + sum, "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");

            }


            function callcategory() {
                var x = '<select class="form-control validate[required]" id="categoryEnq" name="productType" style="width:200px;"><option value="" selected>Select Product Type</option><c:forEach items="${menucategoryList}" var="menu1"><option value="${menu1.categoryName}">${menu1.categoryName}</option></c:forEach></select>';
                return x;
            }


            function readURL(input) {
                $('#ig').show();
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#ig')
                                .attr('src', e.target.result)
                                .width(120)
                                .height(125);
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }

            function Validate()
            {
                var $fin = $($this).closest('tr');
                var fl = $fin.find('#attachmentName').val();
                var fileSize = $this.files[0];
                var sizeInMb = fileSize.size / 1024;
                var sizeLimit = 1024 * 2;
                if (sizeInMb > sizeLimit) {
                    alert("File Size Exceeded(Only 2MB Allowed)");
                    $($this).val('');
                    return;
                }
                var fmt = /(\.jpg|\.png|\.JPG|\.PNG|\.jpeg|\.JPEG)$/;
                if (!fl.match(fmt))
                {
                    alert('Invalid File');
                    $($this).val('');
                    return false;
                }

                else {
                    return true;
                }
            }

            function add1() {
                $("#attachTable").append(
                        "<tr>" +
                        "<td><img src='../common/theme/images/cross.png' style='padding-left:12px' onclick='deleteRow(this.parentNode.parentNode.rowIndex)'></td>" +
                        "<td><input style='resize: none' type='file' id='attachmentName' name='attachmentName' value=''  onchange='fileCheck(this);'/></td>" +
                        "</tr>");


            }
            function fileCheck($this)
            {
                var $fin = $($this).closest('tr');
                var fl = $fin.find('#attachmentName').val();
                var fileSize = $this.files[0];
                var sizeInMb = fileSize.size / 1024;
                var sizeLimit = 1024 * 2;
                if (sizeInMb > sizeLimit) {
                    alert("File Size Exceeded(Only 2MB Allowed)");
                    $($this).val('');
                    return;
                }
                var fmt = /(\.jpg|\.png|\.JPG|\.PNG|\.jpeg|\.JPEG)$/;
                if (!fl.match(fmt))
                {
                    alert('Invalid File');
                    $($this).val('');
                    return false;
                }

                else {
                    return true;
                }

            }


            function removeRow(id, $this) {

                var table = document.getElementById("currencytable");
                for (var i = 0; i < table.rows.length; i++) {
                    var lr = table.rows[i];

                    if (lr.id == 'list_tr_' + id) {
//                                                                var $item = $($this).closest('tr');
//                                                                var h = $item.find('#noOfPost1').val();
//                                                               var h = document.getElementById("gridtable").rows[i + 1].cells[4].innerHTML;
//                                                            //  alert(h); 
//                                                                var noposts = h.substring(76, 77);
//                                                                var totNoPost = document.getElementById('totNoPost').value;
//                                                                
//                                                                var t = parseFloat(totNoPost) - parseFloat(noposts);
                        // alert(t);

                        table.deleteRow(i);


                        return;
                    }
                }
            }


            function deleteRow(i) {


                document.getElementById('attachTable').deleteRow(i);



            }

        </script>
        <script src="crmScript.js" type="text/javascript"></script>
        <script src="general-crm_scripts.js" type="text/javascript"></script>
        <script src="mioinvoice-crm-scripts.js" type="text/javascript"></script>
    </body>

</html>
