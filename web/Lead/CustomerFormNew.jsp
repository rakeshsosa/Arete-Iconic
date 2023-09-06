<%-- 
    Document   : CustomerFormNew
    Created on : 22 Jun, 2016, 3:12:34 PM
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

                $("#tag").toggle();
                $("#tag1").toggle();
                $("#tag2").toggle();
                $("#tag3").toggle();
                $("#tag4").toggle();
                jQuery("#customerForm").validationEngine();
                $("#tagCampaign1").toggle();
                $("#others1").toggle();
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
                $(document).on('input[type=text]').bind("cut copy paste", function (e) {
                    e.preventDefault();
                });

            });


            function call() {
                $("#tag").toggle();
                $("#tag1").hide();
                $("#tag2").hide();
                $("#tag3").hide();
                $("#tag4").hide();

            }

            function call1() {
                $("#tag").hide();
                $("#tag1").toggle();
                $("#tag2").hide();
                $("#tag3").hide();
                $("#tag4").hide();
            }

            function call2() {
                $("#tag").hide();
                $("#tag1").hide();
                $("#tag2").toggle();
                $("#tag3").hide();
                $("#tag4").hide();
            }

            function call3() {
                $("#tag").hide();
                $("#tag1").hide();
                $("#tag2").hide();
                $("#tag3").toggle();
                $("#tag4").hide();

            }

            function call4() {
                $("#tag").hide();
                $("#tag1").hide();
                $("#tag2").hide();
                $("#tag3").hide();
                $("#tag4").toggle();

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
            function addressvalidate(test)
            {
                var addrs = $("#addressPermanent").val();
                if (test === 'same')
                {
                    if (addrs === '') {
                        alert("Please Enter The Primary Address");
                        $('#different').prop('checked', true);
                        return false;
                    }
                    else {
                        $("#addressDifferent").val(addrs);
                        return false;
                    }
                }
                if (test === 'different')
                {
                    $("#addressDifferent").val("");
                    return false;
                }
                else {
                    $("#addressDifferent").val();
                    return false;
                }

            }

            function selectcampaign()
            {
                myWindow = window.open("../CRM/selectcampaign.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
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

            function Validate($this)
            {
                var fl = document.getElementById("UploadMedicalRepName").value;
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
            function firstToUpperCase() {

                var str = document.getElementById("firstName").value;
                var a = str.charAt(0).toUpperCase() + str.substr(1);
                $("#firstName").val(a);
            }
            function firstToUpperCase1() {

                var str = document.getElementById("lastName").value;
                var a = str.charAt(0).toUpperCase() + str.substr(1);
                $("#lastName").val(a);
            }

        </script>
    </head>

    <% java.util.Date d = new java.util.Date();%>
    <body class="nav-md">
        <div id="blanket" style="display: none;"></div>
        <div id="popUpDiv" style="display: none;"></div>
        <div class="container body">


            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">


                        <div class="clearfix"></div>
                        <form class="form-inline" id="customerForm" accept-charset="UTF-8" method="post" action="../CRM/customermanagmentFormSubmitConvert.htm" enctype="multipart/form-data" onsubmit="return checkGrid();">
                            <div class="col-md-6 col-xs-12">
                                <div class="x_panel" >
                                    <jsp:include page="../login/headerlink.htm?submodule=Lead&tab=Customer Management&pagetype=form"/>
                                    <div class="x_title"   >
                                        <h2>Customer Management</h2>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <br />

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color:red">*</span> Division
                                            </label>

                                            <c:choose>
                                                <c:when test="${fn:length(customermanagmentList) > 0}">
                                                    <c:forEach items="${customermanagmentList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input name="division" id="division" class="form-control validate[required]" type="text" readonly value="${type.division1}">
                                                                <input name="customerCode" id="customerCode" class="form-control validate[required]" type="hidden" readonly value="${type.customerCode}">

                                                            </c:when>
                                                            <c:otherwise>
                                                                <input name="division" class="form-control" type="text" readonly value="${type.division1}">
                                                                <input name="customerCode" class="form-control" type="hidden" readonly value="${type.customerCode}">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <select class="form-control validate[required]" name="division" id="division">
                                                        <option value="">Select an option</option>
                                                        <c:forEach items="${orglist}" var="org">                                                                
                                                            <option value="${org.orgCode}">${org.orgCode}</option> 
                                                        </c:forEach>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color:red">*</span> Company
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(customermanagmentList) > 0}">
                                                    <c:forEach items="${customermanagmentList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="company" name="company" maxlength="100" class="form-control validate[required]" autocomplete="off" value="${type.company}" onchange="uniqueCompany();">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="company"  name="company" readonly class="form-control" value="${type.company}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                    <input type="text" id="company" name="company" maxlength="100" value="" class="form-control validate[required]" autocomplete="off" onchange="uniqueCompany();">

                                                </c:otherwise>        
                                            </c:choose>

                                        </div>


                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color:red">*</span> Customer Type</label>
                                            <c:choose>
                                                <c:when test="${fn:length(customermanagmentList) > 0}">
                                                    <c:forEach items="${customermanagmentList}" var="type">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input name="customerType" class="form-controlvalidate[required] " type="text" readonly value="${type.customerType}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input name="customerType" class="form-control" type="text" readonly value="${type.customerType}">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                    <select id="customerType" name="customerType" class="form-control validate[required]">
                                                        <option value="" disabled selected>Select your option</option>
                                                        <option value="VIP">VIP</option>
                                                        <option value="VVIP">VVIP</option>
                                                        <option value="Regular">Regular</option>
                                                        <option value="Walk-In">Walk-In</option>
                                                        <!--<option value="Internal Employee">Internal Employee</option>-->

                                                    </select>
                                                </c:otherwise>

                                            </c:choose>

                                        </div>

                                        <p>&nbsp;</p>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label">&nbsp;&nbsp;Customer Status
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(customermanagmentList) > 0}">
                                                    <c:forEach items="${customermanagmentList}" var="type">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input name="customerStatus" class="form-control" type="text" readonly value="${type.customerStatus}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input name="customerStatus" class="form-control" type="text" readonly value="${type.customerStatus}">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                    <select id="customerStatus" name="customerStatus" class="form-control">
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
                                            <label class="control-label">&nbsp;&nbsp;Industry
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(customermanagmentList) > 0}">
                                                    <c:forEach items="${customermanagmentList}" var="type">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <select class="form-control" id="industry" name="industry" value="">
                                                                    <option value="${type.industry}" disabled selected>${type.industry}</option>
                                                                    <option>Construction</option>
                                                                    <option>Oil and Gas</option>
                                                                    <option>Hotels</option>
                                                                    <option>Airport</option>
                                                                    <option>Camps</option>
                                                                </select>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input name="industry" class="form-control" type="text" readonly value="${type.industry}">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                    <select id="industry" name="industry" class="form-control" >
                                                        <option value="" disabled selected>Select your option</option>
                                                        <option>Construction</option>
                                                        <option>Oil and Gas</option>
                                                        <option>Hotels</option>
                                                        <option>Airport</option>
                                                        <option>Camps</option>
                                                    </select>
                                                </c:otherwise>

                                            </c:choose>

                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label">&nbsp;&nbsp;Website
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(customermanagmentList) > 0}">
                                                    <c:forEach items="${customermanagmentList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="website" name="website"  autocomplete="off" maxlength="30" class="form-control" value="${type.website}"  >
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="website"  name="website" readonly class="form-control" value="${type.website}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" id="website" name="website" maxlength="30"  autocomplete="off" class="form-control" value="" >
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                        <p>&nbsp;</p>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label">&nbsp;&nbsp;Primary Address
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(customermanagmentList) > 0}">
                                                    <c:forEach items="${customermanagmentList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <textarea class="form-control" style="resize: none" maxlength="100" name="addressPermanent"  id="addressPermanent" type="text" value="${type.address1}" autocomplete="off">${type.address1} </textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea class="form-control" readonly style="resize: none" type="text" value="${type.address1}">${type.address1}</textarea>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <textarea class="form-control" style="resize: none" maxlength="100" value="" name="addressPermanent" id="addressPermanent" type="text" autocomplete="off"></textarea>



                                                </c:otherwise>        
                                            </c:choose>
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label" style="margin-top:-17px;">&nbsp;&nbsp;Comments
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(customermanagmentList) > 0}">
                                                    <c:forEach items="${customermanagmentList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <textarea type="text" id="busscomments"  name="busscomments" class="form-control" style="resize: none;" value="${type.busscomments}">${type.busscomments}</textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea type="text" id="busscomments"  name="busscomments" readonly class="form-control" style="resize: none;" value="${type.busscomments}">${type.busscomments}</textarea>
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                    <textarea class="form-control" style="resize: none" maxlength="200" value="" name="busscomments" id="busscomments" style="resize: none;" type="text"></textarea>
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color:red">*</span> Customer Source</label>
                                            <c:choose>
                                                <c:when test="${fn:length(customermanagmentList) > 0}">
                                                    <c:forEach items="${customermanagmentList}" var="type">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input name="customerSource" class="form-control validate[required]" type="text" readonly  value="${type.customerSource}">

                                                            </c:when>
                                                            <c:otherwise>
                                                                <input name="customerSource" class="form-control" type="text" readonly  value="${type.customerSource}">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                    <select id="customerSource" name="customerSource" class="form-control validate[required]" onchange="checktagcmpgn(this.value);">
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

                                                <c:forEach items="${customermanagmentList}" var="type">

                                                    <c:choose>
                                                        <c:when test="${type.customerSource eq 'Campaign'}"> 
                                                            <label class="control-label"><span style="color:red">*</span> Tag Campaign</label>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <label class="control-label"></label>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>

                                                <c:choose>
                                                    <c:when test="${fn:length(customermanagmentList) > 0}">
                                                        <c:forEach items="${customermanagmentList}" var="type">

                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <c:choose>
                                                                        <c:when test="${type.customerSource eq 'Campaign'}">
                                                                            <input type="text" id="tagCampaign" name="tagCampaign"  class="form-control" readonly value="${type.tagCampaign}"/>   
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="hidden" id="tagCampaign" name="tagCampaign"  class="form-control" readonly value="${type.tagCampaign}"/>   
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </c:when>

                                                                <c:otherwise>
                                                                    <c:choose>
                                                                        <c:when test="${type.customerSource eq 'Campaign'}">
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

                                                <c:forEach items="${customermanagmentList}" var="type">
                                                    <c:choose>
                                                        <c:when test="${type.customerSource eq 'Others'}"> 
                                                            <label class="control-label"><span style="color:red">*</span> Others</label>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <label class="control-label"></label>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>

                                                <c:choose>
                                                    <c:when test="${fn:length(customermanagmentList) > 0}">
                                                        <c:forEach items="${customermanagmentList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <c:choose>
                                                                        <c:when test="${type.customerSource eq 'Others'}">
                                                                            <input type="text" id="others" name="others"  class="form-control" maxlength="20" readonly value="${type.others}"/>   
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="hidden" id="others" class="form-control"  maxlength="20" readonly value="${type.others}"/>   
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </c:when>

                                                                <c:otherwise>
                                                                    <c:choose>
                                                                        <c:when test="${type.customerSource eq 'Others'}">
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
                                            <h2>Company Contacts</h2>

                                            <div class="clearfix"></div>
                                        </div>
                                        <p>&nbsp;</p>
                                        <c:if test="${action ne 'view'}" >
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <label class="control-label"><span style="color:red">*</span> First Name
                                                </label>
                                                <c:choose>
                                                    <c:when test="${fn:length(customermanagmentList) > 0}">
                                                        <c:forEach items="${customermanagmentList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="firstName" maxlength="100" class="form-control" autocomplete="off" value="${type.firstName}" onkeyup="firstToUpperCase();">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="firstName"  name="firstName" class="form-control"  readonly value="${type.firstName}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <select id="salutation" class="form-control" style="width: 45px;" onclick="checkavl(this.value);">
                                                            <option value="" disabled selected></option>
                                                            <option value="Ms">Ms</option>
                                                            <option value="Mr">Mr</option>

                                                        </select>
                                                        <input type="text" id="firstName" maxlength="100" value="" style="width: 121px;" autocomplete="off" class="form-control" onkeyup="firstToUpperCase();">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>

                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <label class="control-label">&nbsp;&nbsp;Last Name
                                                </label>
                                                <c:choose>
                                                    <c:when test="${fn:length(customermanagmentList) > 0}">
                                                        <c:forEach items="${customermanagmentList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="lastName"  maxlength="100" class="form-control" value="${type.lastName}" autocomplete="off" onkeyup="firstToUpperCase1();">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="lastName"  name="lastName" class="form-control"  readonly value="${type.lastName}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" id="lastName" maxlength="100" value="" class="form-control" autocomplete="off" onkeyup="firstToUpperCase1();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <label class="control-label">&nbsp;&nbsp;Designation
                                                </label>
                                                <c:choose>
                                                    <c:when test="${fn:length(customermanagmentList) > 0}">
                                                        <c:forEach items="${customermanagmentList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="designation" autocomplete="off" maxlength="20" class="form-control" value="${type.designation}"  >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="designation"  name="designation" autocomplete="off" readonly class="form-control" value="${type.designation}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" id="designation" maxlength="20" autocomplete="off" class="form-control" value=""  >
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                            <p>&nbsp;</p>
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <label class="control-label">&nbsp;&nbsp;Email
                                                </label>
                                                <c:choose>
                                                    <c:when test="${fn:length(customermanagmentList) > 0}">
                                                        <c:forEach items="${customermanagmentList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="email" maxlength="100" autocomplete="off" value="${type.email}" class="form-control validate[custom[email]]" onchange="emailValidate();">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="email"  name="email" readonly class="form-control" value="${type.email}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="email" id="email" maxlength="100" value="" autocomplete="off" class="form-control validate[custom[email]]" onchange="emailValidate();">
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>


                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <label class="control-label"><span style="color:red">*</span> Mobile No
                                                </label>
                                                <c:choose>
                                                    <c:when test="${fn:length(customermanagmentList) > 0}">
                                                        <c:forEach items="${customermanagmentList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="mobile" class="form-control" autocomplete="off" maxlength="11" value="${type.mobile}" onkeypress="return isNumberKey(event)" onchange="mobileNoValidation()">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text"   name="mobile" readonly class="form-control" value="${type.mobile}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" id="mobile" value="" class="form-control" autocomplete="off" maxlength="11" onkeypress="return isNumberKey(event)" onchange="mobileNoValidation();">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>

                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <label class="control-label">&nbsp;&nbsp;Dob
                                                </label>
                                                <c:choose>
                                                    <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                        <c:forEach items="${leadmanagmentList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="dob" onmouseover="" style="cursor: pointer;" class="form-control" value="<fmt:formatDate pattern="dd-MMM-yyyy"  value="${type.dob}"/>" onclick="javascript:NewCssCal('dob', 'ddMMMyyyy', '', '', '', '', 'past')" > 
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="dob"  name="dob" readonly class="form-control" value="<fmt:formatDate pattern="dd-MMM-yyyy"  value="${type.dob}"/>">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>

                                                        <input type="text" id="dob" onmouseover="" value="" style="cursor: pointer;" class="form-control" readonly="" placeholder="Select Date" onclick="javascript:NewCssCal('dob', 'ddMMMyyyy', '', '', '', '', 'past')" > 
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                            <p>&nbsp;</p>
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <label class="control-label">&nbsp;&nbsp;Post Box No
                                                </label>
                                                <c:choose>
                                                    <c:when test="${fn:length(customermanagmentList) > 0}">
                                                        <c:forEach items="${customermanagmentList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input id="postbxno" maxlength="4" class="form-control" type="text" readonly value="${type.postbxno}" onkeypress="return isNumberKey(event)" autocomplete="off">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input name="postbxno" class="form-control" type="text" readonly value="${type.postbxno}">
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input id="postbxno" maxlength="4" class="form-control" onkeypress="return isNumberKey(event)" onchange="pstbxno();" value="" autocomplete="off">

                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>

                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <label class="control-label">&nbsp;&nbsp;Postal Code
                                                </label>
                                                <c:choose>
                                                    <c:when test="${fn:length(customermanagmentList) > 0}">
                                                        <c:forEach items="${customermanagmentList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="pincode" class="form-control" maxlength="3" value="${type.pincode}" onchange="postlcde();" onkeypress="return isNumberKey(event)" autocomplete="off">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="pincode"  name="pincode" readonly class="form-control" value="${type.pincode}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" id="pincode" class="form-control" maxlength="3" onkeypress="return isNumberKey(event)" onchange="postlcde();" autocomplete="off">

                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>

                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <label class="control-label"><span style="color:red">*</span> City
                                                </label>
                                                <c:choose>
                                                    <c:when test="${fn:length(customermanagmentList) > 0}">
                                                        <c:forEach items="${customermanagmentList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input id="city" class="form-control" type="text" readonly value="${type.city}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input name="city" class="form-control" type="text" readonly value="${type.city}">
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <select id="city"  class="form-control">
                                                            <option value="" disabled selected>Select your option</option>
                                                            <option value="Nizwa">Nizwa</option>
                                                            <option value="Sohar">Sohar</option>
                                                            <option value="Haima">Haima</option>
                                                            <option value="Sur">Sur</option>
                                                            <option value="Ibri">Ibri</option>
                                                            <option value="Muscat">Muscat</option>
                                                            <option value="Khasab">Khasab</option>
                                                            <option value="Salalah">Salalah</option>
                                                            <option value="Buraymi">Buraymi</option>


                                                        </select>

                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                            <p>&nbsp;</p>
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <label class="control-label">&nbsp;&nbsp;Country              
                                                </label>
                                                <c:choose>
                                                    <c:when test="${fn:length(customermanagmentList) > 0}">
                                                        <c:forEach items="${customermanagmentList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input class="form-control" type="text" readonly value="${type.country}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input name="country" class="form-control" type="text" readonly value="${type.country}">
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input id="country" class="form-control"  type="text" readonly value="Oman">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>


                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <label class="control-label">&nbsp;&nbsp;Address
                                                    <span style="color: blue;font-size: 11px;">(If address is same as primary address)</span>
                                                </label>

                                                <input type="radio" id="same" name="same" value="same" onclick="addressvalidate(this.value);">Same
                                                <input type="radio" id="different" name="same" value="different" onclick="addressvalidate(this.value);" checked="">Different

                                            </div>
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <label class="control-label">
                                                </label>

                                                <textarea class="form-control" style="resize: none" maxlength="100" value="" id="addressDifferent" type="text" autocomplete="off"></textarea>

                                            </div>

                                            <div class="clearfix"></div>

                                            <p>&nbsp;</p>

                                            <c:if test="${SNo eq null}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <button type="button" class="btn btn-succ" style="" onclick="addOrderRow_test();"><i class="fa fa-plus-circle" style="font-size: 15px"></i> ADD</button>

                                                    </div>
                                                </div>

                                                <div class="clearfix"></div>



                                                <div style="overflow: scroll;height: auto;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">

                                                    <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                        <thead>
                                                            <tr>
                                                                <th><i class="fa fa-trash fa-lg"></i></th>                                                
                                                                <th><span style="color:red">*</span>First Name</th>
                                                                <th> Last Name</th>
                                                                <th> Designation</th>
                                                                <th> Email</th>
                                                                <th><span style="color:red">*</span> Mobile No</th>
                                                                <th> Dob</th>
                                                                <th> Post Box No</th>
                                                                <th> Postal Code</th>
                                                                <th><span style="color:red">*</span> City</th>
                                                                <th> Country</th>
                                                                <th> Address</th>
                                                                <th> Business Card</th>
                                                            </tr>

                                                        </thead>
                                                        <tbody id="resourcetable">

                                                        </tbody>
                                                        <script>
                                                            var count = 0;
                                                            function addOrderRow_test() {
                                                                var valid1 = true;


                                                                var x = document.getElementById('salutation').value &&
                                                                        document.getElementById('firstName').value &&
                                                                        document.getElementById('mobile').value &&
                                                                        document.getElementById('city').value;

                                                                if (x == "" || x == null)
                                                                {
                                                                    alert("Please Select Mandatory Fields");
                                                                    valid1 = false;
                                                                }



                                                                if (valid1 == true) {
                                                                    var salutation = document.getElementById('salutation').value;
                                                                    var firstName = document.getElementById('firstName').value;
                                                                    var lastName = document.getElementById('lastName').value;
                                                                    var designation = document.getElementById('designation').value;
                                                                    var email = document.getElementById('email').value;
                                                                    var mobile = document.getElementById('mobile').value;
                                                                    var dob = document.getElementById('dob').value;
                                                                    var postbxno = document.getElementById('postbxno').value;
                                                                    var pincode = document.getElementById('pincode').value;
                                                                    var city = document.getElementById('city').value;
                                                                    var country = document.getElementById('country').value;
                                                                    var addressDifferent = document.getElementById('addressDifferent').value;
                                                                    var UploadMedicalRepName = "";
                                                                    var mobile1 = mobile.split("/");
                                                                    var table = document.getElementById("resourcetable");

                                                                    for (var i = 0; i < mobile1.length; i++) {
                                                                        $('#resourcetable tr').each(function () {
                                                                            var a = $(this).find('#mobile').val();

                                                                            if (a == mobile1[i]) {
                                                                                alert('Mobile No Is Already Added');
                                                                                document.getElementById('td').value = "";
                                                                                return false;
                                                                            } else {
                                                                                return true;
                                                                            }
                                                                        })

                                                                        var slNo = table.rows.length - 1;
                                                                        var slNo1 = table.rows.length;
                                                                        var id1 = slNo1;

                                                                        var tr = table.insertRow(slNo + 1);


                                                                        tr.id = 'list_tr_' + slNo;
                                                                        tr.innerHTML = '<td align="center" class="tinput"><button type="button" class="fa fa-trash fa-lg-o" onclick="removeRow('
                                                                                + slNo + ')" ></button> </td>' +
                                                                                '<td ><input class="form-control " style="text-align:center;" type="text" readonly name="firstName" value="' + salutation + " " + firstName +
                                                                                '" ><input class="form-control" style="text-align:center;" type="hidden" readonly name="salutation" value="' + salutation +
                                                                                '" style="border: none"></td><td><input class="form-control " style="text-align:center;" type="text"readonly name="lastName" value="' + lastName +
                                                                                '" style="border: none"></td><td><input class="form-control " style="text-align:center;" type="text"readonly name="designation" value="' + designation +
                                                                                '" style="border: none"></td><td><input class="form-control " style="text-align:center;" type="text"readonly name="email" value="' + email +
                                                                                '" style="border: none"></td><td><input class="form-control " style="text-align:center;" type="text"readonly name="mobile" id="mobile" value="' + mobile1 +
                                                                                '" style="border: none"></td><td><input class="form-control " style="text-align:center;" type="text"readonly name="dob" value="' + dob +
                                                                                '" style="border: none"></td><td><input class="form-control " style="text-align:center;" type="text"readonly name="postbxno" value="' + postbxno +
                                                                                '" style="border: none"></td><td><input class="form-control " style="text-align:center;" type="text"readonly name="pincode" value="' + pincode +
                                                                                '" style="border: none"></td><td><input class="form-control " style="text-align:center;" type="text"readonly name="city" value="' + city +
                                                                                '" style="border: none"></td><td><input class="form-control " style="text-align:center;" type="text"readonly name="country" value="' + country +
                                                                                '" style="border: none"></td><td><input class="form-control " style="text-align:center;" type="text" readonly name="addressDifferent" value="' + addressDifferent +
                                                                                '" style="border: none"></td><td><input class="form-control " style="text-align:left;padding-top:0px;" type="file" onchange="Validate(this)"; id="UploadMedicalRepName" readonly name="UploadMedicalRepName' + mobile + '" value="' + UploadMedicalRepName +
                                                                                '" style="border: none"></td>';
                                                                        count++;
                                                                        document.getElementById('salutation').value = "";
                                                                        document.getElementById('firstName').value = "";
                                                                        document.getElementById('lastName').value = "";
                                                                        document.getElementById('designation').value = "";
                                                                        document.getElementById('email').value = "";
                                                                        document.getElementById('mobile').value = "";
                                                                        document.getElementById('dob').value = "";
                                                                        document.getElementById('postbxno').value = "";
                                                                        document.getElementById('pincode').value = "";
                                                                        document.getElementById('city').value = "";
                                                                        document.getElementById('addressDifferent').value = "";


                                                                    }

                                                                } else {
                                                                    return;
                                                                }
                                                            }

                                                            function removeRow(id) {
                                                                count--;
                                                                var table = document.getElementById("resourcetable");
                                                                for (var i = 0; i < table.rows.length; i++) {
                                                                    var lr = table.rows[i];
                                                                    if (lr.id == 'list_tr_' + id) {
                                                                        table.deleteRow(i);
                                                                        return;
                                                                    }
                                                                }
                                                            }
                                                            function checkGrid() {
                                                                var table = document.getElementById("resourcetable");
                                                                var slNo = table.rows.length - 1;
                                                                if (slNo < 0) {
                                                                    alert("Please add data in grid");
                                                                    $("#salutation").focus();
                                                                    $("#firstName").focus();
                                                                    return false;
                                                                } else {
                                                                    return true;
                                                                }
                                                            }

                                                            function Validate($this)
                                                            {
                                                                //  var fl = $("UploadMedicalRepName").value;

                                                                var table = document.getElementById("resourcetable");
                                                                var $itemRow = $($this).closest('tr');
                                                                var fl = $itemRow.find('#UploadMedicalRepName').val();
                                                                // var fl = $("#UploadMedicalRepName").val();

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

                                                        </script>

                                                    </table>                        



                                                </c:if>


                                            </div>
                                        </c:if>
                                        <c:if test="${action ne null}" >
                                            <div style="overflow: scroll;height: auto;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">

                                                <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                    <thead>
                                                        <tr>
                                                            <th><span style="color:red">*</span> First Name</th>
                                                            <th> Last Name</th>
                                                            <th> Designation</th>
                                                            <th> Email</th>
                                                            <th><span style="color:red">*</span> Mobile No</th>
                                                            <th> Dob</th>
                                                            <th> Post Box No</th>
                                                            <th> Postal Code</th>
                                                            <th><span style="color:red">*</span> City</th>
                                                            <th> Country</th>
                                                            <th> Address</th>
                                                            <th> Business Card</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="currencytablemed">
                                                        <c:forEach items="${customerContactDeatils}" var="type">
                                                            <tr class="item-row"> 
                                                                <td><input class="form-control" style="text-align: center;" readonly="" autocomplete="off" type="text" maxlength="30" value="${type.firstName}"></td>
                                                                <td><input class="form-control" style="text-align: center;" readonly autocomplete="off" type="text" maxlength="30" value="${type.lastName}"></td>
                                                                <td><input class="form-control" style="text-align: center;" readonly autocomplete="off" type="text" maxlength="30" value="${type.designation}"></td>
                                                                <td><input class="form-control" style="text-align: center;" readonly autocomplete="off" type="text" maxlength="30" value="${type.email}"></td>
                                                                <td><input class="form-control" style="text-align: center;" readonly autocomplete="off" type="text" maxlength="30" value="${type.mobile}"></td>
                                                                <td><input class="form-control" style="text-align: center;" readonly autocomplete="off" type="text" maxlength="30" value="<fmt:formatDate pattern="dd-MMM-yyyy"  value="${type.dob}"/>"></td>
                                                                <td><input class="form-control" style="text-align: center;" readonly autocomplete="off" type="text" maxlength="30" value="${type.postbxno}"></td>
                                                                <td><input class="form-control" style="text-align: center;" readonly autocomplete="off" type="text" maxlength="30" value="${type.pincode}"></td>
                                                                <td><input class="form-control" style="text-align: center;" readonly autocomplete="off" type="text" maxlength="30" value="${type.city}"></td>
                                                                <td><input class="form-control" style="text-align: center;" readonly autocomplete="off" type="text" maxlength="30" value="${type.country}"></td>
                                                                <td><input class="form-control" style="text-align: center;" readonly autocomplete="off" type="text" maxlength="30" value="${type.addressDIff}"></td>
                                                                <td>
                                                                    <c:forEach items="${purchDocList}" var="doc">
                                                                        <input value="${doc.mobile}" name="mobileAttach" id="mobileAttach" type="hidden" >

                                                                        <c:if test="${doc.mobile eq type.mobile}" >
                                                                            <c:if test="${not empty doc.fileName}">
                                                                                <a style="color: black" href="../CRM/complaintattachDownload.htm?sno=${doc.SNo}" title="Click to download">
                                                                                    <i class="fa fa-file-pdf-o" style="font-size: 15px" ></i>
                                                                                    ${doc.fileName} 
                                                                                    <input value="${doc.fileName}" name="fileName" id="fileName" type="hidden" >
                                                                                    <input value="${doc.content}" name="content" id="content" type="hidden" >
                                                                                </a>
                                                                            </c:if> 
                                                                        </c:if>


                                                                    </c:forEach>


                                                                </td>

                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>

                                                </table>

                                            </div>
                                        </c:if>
                                        <br/>
                                        <ul class="nav nav-tabs">
                                            <li onclick="call4();" class="active"><a >Bank Details</a></li>

                                        </ul>
                                        <div id="tag4"><jsp:include page="../CRM/customerbankdetails.htm"></jsp:include></div>
                                        </div>


                                        <p>&nbsp;</p>

                                    <c:if test="${action ne 'view'}">

                                        <div class="form-actions" >
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <p>&nbsp;</p>
                                                    <button type="submit" class="btn btn-primary" style="" > Save </button>

                                                    <a href="../Lead/CustomerListNew.htm"  class="btn btn-danger"  style=""> Cancel</a>
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
        function uniqueCompany() {
            var companyName = $("#company").val();

            $.ajax({
                type: "POST",
                url: '../Lead/getCompanyNameCustomer.htm',
                data: {
                    company: companyName,
                },
                success: function (data) {
                    if ($.trim(data) == 'Already Exists.') {
                        alert("Company Is  Already Exist");
                        $("#company").val("");
                        return false;
                    }
                }
            });
        }

    </script>
    <script src="../CRM/crmScript.js" type="text/javascript"></script>
    <script src="../CRM/general-crm_scripts.js" type="text/javascript"></script>
    <script src="../CRM/mioinvoice-crm-scripts.js" type="text/javascript"></script>
</body>

</html>
