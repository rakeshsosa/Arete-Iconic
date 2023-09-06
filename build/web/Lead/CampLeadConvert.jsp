<%-- 
    Document   : CampLeadConvert
    Created on : 27 Jun, 2016, 6:56:05 PM
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

                jQuery("#leadForm").validationEngine();
                $("#tagCampaign1").toggle();
                $("#others1").toggle();
//                $("#companycontact").toggle();
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
                        <form class="form-inline" id="leadForm" accept-charset="UTF-8" method="post" action="../Lead/leadFormSubmit.htm" enctype="multipart/form-data" onsubmit="return checkGrid();">
                            <div class="col-md-6 col-xs-12">
                                <div class="x_panel" >
                                    <jsp:include page="../login/headerlink.htm?submodule=Lead&tab=Lead Management&pagetype=form"/>
                                    <div class="x_title"   >
                                        <h2>Lead Management</h2>
                                        <div class="clearfix"></div>
                                    </div>
                                    <c:set var="i" value="0"/>
                                    <c:forEach items="${CampaignList}" var="list">

                                        <c:set var="i" value="1"/>

                                        <c:set var="company" value="${list.enquirerCompany}"/>

                                        <c:set var="campaignCode" value="${list.campaignCode}"/>
                                        <c:set var="division" value="${list.division}"/>

                                        <c:set var="campaignName" value="${list.campaignName}"/>
                                        <c:set var="enquirerIndustry" value="${list.enquirerIndustry}"/>

                                        <c:set var="sno" value="${list.sno}"/>

                                    </c:forEach>
                                    <div class="x_content">
                                        <br />

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color:red">*</span> Division
                                            </label>

                                            <c:choose>
                                                <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                    <c:forEach items="${leadmanagmentList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input name="sno" type="hidden" value="${type.sno}">
                                                                <input name="status" type="hidden" value="${type.status}">
                                                                <input name="division" id="division" class="form-control validate[required]" type="text" readonly value="${type.division}">
                                                                <input name="leadCode" id="leadCode" class="form-control validate[required]" type="hidden" readonly value="${type.leadCode}">

                                                            </c:when>
                                                            <c:otherwise>
                                                                <input name="division" class="form-control" type="text" readonly value="${type.division}">
                                                                <input name="leadCode" class="form-control" type="hidden" readonly value="${type.leadCode}">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input name="division" class="form-control" type="text" readonly value="${division}">
                                                    <input name="SNo" id="SNo" class="form-control" type="hidden" readonly value="${SNo}">
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

                                                    <input name="company" id="company" class="form-control" type="text" readonly value="${company}">

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
                                                        <!--<option value="Internal Employee">Internal Employee</option>-->

                                                    </select>
                                                </c:otherwise>

                                            </c:choose>

                                        </div>

                                        <p>&nbsp;</p>
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
                                            <label class="control-label">&nbsp;&nbsp;Industry
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                    <c:forEach items="${leadmanagmentList}" var="type">

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
                                                    <input name="industry" id="industry" class="form-control" type="text" readonly value="${enquirerIndustry}">
                                                </c:otherwise>

                                            </c:choose>

                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label">&nbsp;&nbsp;Website
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                    <c:forEach items="${leadmanagmentList}" var="type">
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
                                                <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                    <c:forEach items="${leadmanagmentList}" var="type">
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
                                                <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                    <c:forEach items="${leadmanagmentList}" var="type">
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
                                            <label class="control-label"><span style="color:red">*</span> Lead Source</label>
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
                                                    <input name="leadSource" id="leadSource" class="form-control " type="text" readonly  value="Campaign">

                                                </c:otherwise>        
                                            </c:choose>

                                            <p>&nbsp;</p> 
                                            <div  class="col-md-6 col-sm-12 col-xs-12 form-inline" style="margin-left:-9px;">
                                                <label class="control-label">&nbsp;&nbsp;Tag Campaign</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                        <c:forEach items="${leadmanagmentList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="tagCampaign" name="tagCampaign"  class="form-control"  value="${type.tagCampaign}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="tagCampaign" name="tagCampaign"  class="form-control" readonly value="${type.tagCampaign}"/>                                                   
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" id="tagCampaign" name="tagCampaign" readonly=""  class="form-control" value="${campaignName}" >
                                                        <input type="hidden" id="campaignCode" name="campaignCode"  class="form-control" readonly /> 
                                                    </c:otherwise>        
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
                                                    <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                        <c:forEach items="${leadmanagmentList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <select id="salutation" class="form-control" style="width: 45px;" onclick="checkavl(this.value);">
                                                                        <option value="" disabled selected></option>
                                                                        <option value="Ms">Ms</option>
                                                                        <option value="Mr">Mr</option>

                                                                    </select>
                                                                    <input type="text" id="firstName" maxlength="100" style="width: 121px;" class="form-control" autocomplete="off" value="${type.firstName}" onkeyup="firstToUpperCase();">
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
                                                    <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                        <c:forEach items="${leadmanagmentList}" var="type">
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
                                                        <input type="text" id="lastName" maxlength="100" value="" class="form-control validate[contactPerson]" autocomplete="off" onkeyup="firstToUpperCase1();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <label class="control-label">&nbsp;&nbsp;Designation
                                                </label>
                                                <c:choose>
                                                    <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                        <c:forEach items="${leadmanagmentList}" var="type">
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
                                                    <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                        <c:forEach items="${leadmanagmentList}" var="type">
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
                                                    <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                        <c:forEach items="${leadmanagmentList}" var="type">
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
                                                <label class="control-label"> Dob
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
                                                    <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                        <c:forEach items="${leadmanagmentList}" var="type">
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
                                                    <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                        <c:forEach items="${leadmanagmentList}" var="type">
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
                                                    <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                        <c:forEach items="${leadmanagmentList}" var="type">
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
                                                    <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                        <c:forEach items="${leadmanagmentList}" var="type">
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
                                            <!--                            <div class="x_panel">
                                                                            <div class="x_content">-->

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
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:left;padding-top:0px;" type="file" onclick="Validate1(this)"; id="UploadMedicalRepName" readonly name="UploadMedicalRepName' + mobile + '" value="' + UploadMedicalRepName +
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

                                                    </script>

                                                </table>                        






                                            </div>
                                        </c:if>
                                        <c:if test="${action eq 'view'}" >
                                            <div style="overflow: scroll;height: auto;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">

                                                <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                    <thead>
                                                        <tr>
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
                                                    <tbody id="currencytablemed">
                                                        <c:forEach items="${leadContactDeatils}" var="type">
                                                            <tr class="item-row"> 
                                                                <td><input class="form-control" readonly style="text-align: center;" name="firstName" id="firstName" readonly="" autocomplete="off" type="text" maxlength="30" value="${type.firstName}"></td>
                                                                <td><input class="form-control" readonly style="text-align: center;" name="lastName" id="lastName" readonly autocomplete="off" type="text" maxlength="30" value="${type.lastName}"></td>
                                                                <td><input class="form-control" readonly style="text-align: center;" name="designation" id="designation" readonly autocomplete="off" type="text" maxlength="30" value="${type.designation}"></td>
                                                                <td><input class="form-control" readonly style="text-align: center;" name="email" id="email" readonly autocomplete="off" type="text" maxlength="30" value="${type.email}"></td>
                                                                <td><input class="form-control" readonly style="text-align: center;"  name="mobile" id="mobile" readonly autocomplete="off" type="text" maxlength="30" value="${type.mobile}"></td>
                                                                <td><input id="dob" readonly="" onmouseover="" name="dob" style="cursor: pointer;width:200px;text-align: center;" class="form-control" value="<fmt:formatDate pattern="dd-MMM-yyyy"  value="${type.dob}"/>" ></td> 
                                                                <td><input class="form-control" readonly style="text-align: center;" name="postbxno" id="postbxno" readonly autocomplete="off" type="text" maxlength="30" value="${type.postbxno}"></td>
                                                                <td><input class="form-control" readonly style="text-align: center;" name="pincode" id="pincode" readonly autocomplete="off" type="text" maxlength="30" value="${type.pincode}"></td>
                                                                <td><input class="form-control" readonly style="text-align: center;" name="city" id="city" readonly autocomplete="off" type="text" maxlength="30" value="${type.city}"></td>
                                                                <td><input class="form-control" readonly style="text-align: center;" name="country" id="country" readonly autocomplete="off" type="text" maxlength="30" value="${type.country}"></td>
                                                                <td><input class="form-control" readonly style="text-align: center;" name="addressDifferent" id="addressDifferent" readonly autocomplete="off" type="text" maxlength="30" value="${type.addressDIff}"></td>
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


                                        <p>&nbsp;</p>

                                        <c:if test="${action eq null}" >
                                            <div class="x_title">
                                                <h2>Follow Up Details</h2>

                                                <div class="clearfix"></div>
                                            </div>
                                            <p>&nbsp;</p>
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <br/><label class="control-label">&nbsp;&nbsp;Follow Up Date
                                                </label>
                                                <input type="text" id="followUp" name="followUp" readonly="" onmouseover="" style="cursor: pointer;" value="" placeholder="Select The Date" class="form-control" onclick="javascript:NewCssCal('followUp', 'ddMMMyyyy')" >
                                            </div>


                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                <label class="control-label">Follow Up Remarks
                                                </label>
                                                <textarea class="form-control" style="resize: none" maxlength="100" value="" autocomplete="off" name="remarks2" id="remarks2" type="text"></textarea>
                                            </div>
                                            <p>&nbsp;</p>
                                            <p>&nbsp;</p>

                                            <p>&nbsp;</p>
                                            <p>&nbsp;</p>
                                        </c:if>
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
                                                        <th style="width:12%;"></span> Product Type</th>
                                                        <th style="width:12%;"></span> Product Name</th>
                                                        <th style="width:12%;">Expected OBV </th>
                                                        <th style="width:12%;">Priority</th>
                                                        <th style="width:12%;">Remarks</th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <c:if test="${action eq 'edit'}">
                                                        <c:forEach items="${leadProductDeatils}" var="list">
                                                            <tr class="item-LeadPro">
                                                                <td align="center" onclick=""><button type="button" id="deleteLeadPro"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                                <td><input style="width:200px;"  class="form-control" maxlength="100" required autocomplete="off" name="productType" id="categoryEnq" type="text" readonly value="${list.productType}" ></td>      
                                                                <td><input style="width:200px;"  class="form-control" autocomplete="off" name="productName"   id="nameEnquiry" type="text" value="${list.productName}" readonly="">
                                                                    <input style="width:200px;" class="form-control" maxlength="100" required autocomplete="off" name="codeEnquiry" id="codeEnquiry"  onkeypress="" type="hidden" value="${list.codeEnquiry}">
                                                                    <input style="width:200px;" class="form-control" readonly autocomplete="off"  name="uomEnquiry" id="uomEnquiry" type="hidden" value="${list.uomEnquiry}">
                                                                    <input style="width:200px;"  id="itemunitPrice" name="itemunitPrice" type="hidden" value="${list.itemunitPrice}">
                                                                </td>
                                                                <td><input style="width:200px;text-align: center;" class="form-control" autocomplete="off" name="expectedObv"  id="expectedObv" maxlength="15" type="text" readonly value="${list.expectedObv}"></td>
                                                                <td><input style="width:200px;" class="form-control" autocomplete="off" name="pri"  id="priority" maxlength="200" type="text" readonly value="${list.priorty}"></td>
                                                                <td><input style="width:200px;" class="form-control"  autocomplete="off" maxlength="200" id="remarks" name="remarks"  type="text" readonly value="${list.remarks}"></td>
                                                            </tr>
                                                            <c:set var="i" value="${i+1}"/>
                                                        </c:forEach> 
                                                    </c:if>
                                                    <c:if test="${action eq 'view'}">
                                                        <c:forEach items="${leadProductDeatils}" var="list">
                                                            <tr class="item-LeadPro">


                                                                <td><input style="width:200px;"  class="form-control" maxlength="100" readonly="" required autocomplete="off" name="productType" id="productType" type="text" value="${list.productType}" ></td>      


                                                                <td><input style="width:200px;"  class="form-control" autocomplete="off" name="productName" readonly  id="productName" type="text" value="${list.productName}" >
                                                                    <input style="width:200px;"  class="form-control" maxlength="100" required autocomplete="off" name="codeEnquiry" id="codeEnquiry"  onkeypress="" type="hidden" value="${list.codeEnquiry}">
                                                                    <input style="width:200px;"  class="form-control" readonly autocomplete="off"  name="uomEnquiry" id="uomEnquiry" type="hidden" value="${list.uomEnquiry}">
                                                                    <input style="width:200px;"  id="itemunitPrice" name="itemunitPrice" type="hidden" value="${list.itemunitPrice}">
                                                                </td>
                                                                <td><input style="width:200px;text-align:center;"  class="form-control" autocomplete="off" name="expectedObv" readonly id="expectedObv" maxlength="15" type="text" value="${list.expectedObv}"></td>
                                                                <td><input style="width:200px;"  class="form-control" autocomplete="off"name="pri" readonly  id="priority" maxlength="200" type="text" value="${list.priorty}"></td>
                                                                <td><input style="width:200px;"  class="form-control"  autocomplete="off" maxlength="200" id="remarks" readonly name="remarks"  type="text" value="${list.remarks}"></td>
                                                            </tr>
                                                            <c:set var="i" value="${i+1}"/>
                                                        </c:forEach> 
                                                    </c:if>
                                                    <c:if test="${action eq null}">
                                                        <tr class="item-LeadPro">
                                                            <td align="center" onclick=""><button type="button"  id="deleteLeadPro"><i class="fa fa-trash fa-lg-o"></i></button></td>

                                                            <td>
                                                                <select class="form-control" id="categoryEnq" name="productType" style="width:200px;">
                                                                    <option value=""  selected>Select Product Type</option>
                                                                    <c:forEach items="${menucategoryList}" var="menu">                                                                
                                                                        <option value="${menu.categoryName}">${menu.categoryName}</option> 
                                                                    </c:forEach>
                                                                </select>
                                                            </td>      
                                                            <td><input style="width:200px;"  class="form-control" maxlength="100" autocomplete="off" name="productName" id="nameEnquiry" placeholder="Select Product" readonly="" onclick="selectItem(this);" type="text" value="" >

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
                                                            <a id="addLeadProBtn"  class="btn btn-succ" tabindex=""><i class="glyphicon glyphicon-plus"></i> Add Products</a>

                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>


                                        </div>

                                        <div class="clearfix"></div>

                                        <br/>
                                        <div class="x_title">
                                            <h2>Service Details</h2>

                                            <div class="clearfix"></div>
                                        </div>
                                        <div style="margin-top: 20px;overflow: scroll;height: auto;border: 1px solid gray;background:#f5f6f7;">
                                            <table  class="table table-striped responsive-utilities jambo_table" id="serviceenquirytable">
                                                <thead>
                                                    <tr>                                
                                                        <c:if test="${action ne 'view'}">
                                                            <th><i class="fa fa-trash fa-lg"></i></th>
                                                            </c:if>
                                                        <th style="width:12%;"></span> Type</th>                                            
                                                        <th style="width:12%;"></span> Name</th>
                                                        <th style="width:12%;">Expected OBV</th>                                    
                                                        <th style="width:12%;">Priority</th>
                                                        <th style="width:12%;">Remarks</th>

                                                    </tr>
                                                </thead>
                                                <tbody >

                                                    <c:if test="${action eq null}">                                               
                                                        <tr class="service-enquiry">

                                                            <td align="center" onclick=""><button type="button"  id="deleteService"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td>
                                                                <select style="width:200px;" class="form-control" id="categoryService" name="categoryService">
                                                                    <option value="">Select Service Type</option>
                                                                    <c:forEach items="${itemsubcategList}" var="service">
                                                                        <option>${service.itemSubCategory}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </td>                                            
                                                            <td><input class="form-control" style="width:200px;" maxlength="100" readonly placeholder="Select Service Name" required autocomplete="off" name="nameService" id="nameService" onclick="selectService(this);" type="text" value="" >
                                                                <input class="form-control" maxlength="100" readonly  autocomplete="off" name="codeService" id="codeService"  onkeypress="" type="hidden" value="">                                                  
                                                                <input class="form-control"  readonly autocomplete="off"  name="uomService" id="uomService" type="hidden" >
                                                                <input class="form-control" name="serviceunitPrice" readonly id="serviceunitPrice" type="hidden" ></td>
                                                            <td><input style="width:200px;text-align:center;"  class="form-control" autocomplete="off" name="expectedObvService" id="expectedObvService" maxlength="15" type="text" onkeypress="return isNumberKey(event);" value="0"></td>
                                                            <td> <select style="width:200px;"  class="form-control" id="priService" name="priService" >
                                                                    <option value="" selected>Select your option</option>
                                                                    <option value="Low">Low</option>
                                                                    <option value="Medium">Medium</option>
                                                                    <option value="High">High</option>                                                              
                                                                </select></td>


                                                            <td><input class="form-control"  style="width:200px;" autocomplete="off" name="remarksenqService"  maxlength="300" id="remarksenqService" type="text" value=""></td>
                                                        </tr>
                                                    </c:if>
                                                    <c:if test="${action eq 'edit'}">
                                                        <c:forEach items="${leadServiceDeatils}" var="list">
                                                            <tr class="service-enquiry">

                                                                <td align="center" onclick=""><button type="button"  id="deleteService"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                                <td><input style="width:200px;"  class="form-control" maxlength="100" readonly="" required autocomplete="off"  type="text" value="${list.serviceType}" ></td>      


                                                                <td><input style="width:200px;"  class="form-control" autocomplete="off" name="productName" readonly type="text" value="${list.serviceName}" >
                                                                    <input style="width:200px;"  class="form-control" maxlength="100" required autocomplete="off"  onkeypress="" type="hidden" value="${list.codeService}">
                                                                    <input style="width:200px;"  class="form-control" readonly autocomplete="off" type="hidden" value="${list.uomService}">
                                                                    <input style="width:200px;"   class="form-control" type="hidden" value="${list.serviceunitPrice}">
                                                                </td>
                                                                <td><input style="width:200px;text-align:center;"  class="form-control" autocomplete="off" readonly maxlength="15" type="text" value="${list.expectedObv}"></td>
                                                                <td><input style="width:200px;"  class="form-control" autocomplete="off" readonly maxlength="200" type="text" value="${list.priorty}"></td>
                                                                <td><input style="width:200px;"  class="form-control"  autocomplete="off" maxlength="200" readonly type="text" value="${list.remarks}"></td>
                                                            </tr>
                                                            <c:set var="i" value="${i+1}"/>
                                                        </c:forEach> 
                                                    </c:if>  

                                                    <c:if test="${action eq 'view'}">
                                                        <c:forEach items="${leadServiceDeatils}" var="list">
                                                            <tr class="item-LeadPro">


                                                                <td><input style="width:200px;"  class="form-control" maxlength="100" readonly="" required autocomplete="off"  type="text" value="${list.serviceType}" ></td>      


                                                                <td><input style="width:200px;"  class="form-control" autocomplete="off" name="productName" readonly type="text" value="${list.serviceName}" >
                                                                    <input style="width:200px;"  class="form-control" maxlength="100" required autocomplete="off"  onkeypress="" type="hidden" value="${list.codeService}">
                                                                    <input style="width:200px;"  class="form-control" readonly autocomplete="off" type="hidden" value="${list.uomService}">
                                                                    <input style="width:200px;"   class="form-control" type="hidden" value="${list.serviceunitPrice}">
                                                                </td>
                                                                <td><input style="width:200px;text-align:center;"  class="form-control" autocomplete="off" readonly maxlength="15" type="text" value="${list.expectedObv}"></td>
                                                                <td><input style="width:200px;"  class="form-control" autocomplete="off" readonly maxlength="200" type="text" value="${list.priorty}"></td>
                                                                <td><input style="width:200px;"  class="form-control"  autocomplete="off" maxlength="200" readonly type="text" value="${list.remarks}"></td>
                                                            </tr>
                                                            <c:set var="i" value="${i+1}"/>
                                                        </c:forEach> 
                                                    </c:if>
                                                </tbody>

                                            </table>
                                            <c:if test="${action ne 'view'}">
                                                <div style="margin-top: 10px;">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                        <div class="col-md-9 col-sm-9 col-xs-12">

                                                            <a  id="addServiceBtn" class="btn btn-succ" tabindex=""><i class="glyphicon glyphicon-plus"></i> Add Service</a>

                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                        <div class="clearfix"></div>

                                    </div>

                                </div>
                                <c:if test="${action ne 'view'}">

                                    <div class="form-actions" >
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <p>&nbsp;</p>
                                                <button type="submit" class="btn btn-primary" style="" > Save </button>

                                                <a href="../Lead/LeadManagementListNew.htm"  class="btn btn-danger"  style="">Cancel</a>
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

    function selectService($this) {

        var $itemRow = $($this).closest('tr');
        var rowCount = ($($this).closest("tr")[0].rowIndex);
        var cat1 = $itemRow.find('#categoryService').val();
        var sum = "";
        $('input#nameService').each(function (i) {
            sum = sum + "/" + $(this).val();
        });
        if (cat1 == '') {

            alert("Select Service Type");
            return false;
        }
        $itemRow.attr('id', "row" + rowCount);
        var rowid1 = "row" + rowCount;
        myWindow = window.open("../Lead/selectServiceSales.htm?cat=" + cat1 + "&rowid=" + rowid1 + "&pitems=" + sum, "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
    }
    function callcategory() {
        var x = '<select class="form-control" id="categoryEnq" name="productType" style="width:200px;"><option value="" selected>Select Product Type</option><c:forEach items="${menucategoryList}" var="menu1"><option value="${menu1.categoryName}">${menu1.categoryName}</option></c:forEach></select>';
        return x;
    }
    function callservice() {
        var s = '<select class="form-control" id="categoryService" name="categoryService" style="width:200px;"><option value="">Select Service Type</option><c:forEach items="${itemsubcategList}" var="service"><option>${service.itemSubCategory}</option></c:forEach></select>';
        return s;
    }
    function uniqueCompany() {
        var companyName = document.getElementById("company").value;
        $.ajax({
            type: "POST",
            url: '../Lead/getCompanyName.htm',
            data: {
                company: companyName,
            },
            success: function (data) {
                if ($.trim(data) == 'Already Exists.') {
                    alert("Company Is  Already Exist");
                    document.getElementById("company").value = "";
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
