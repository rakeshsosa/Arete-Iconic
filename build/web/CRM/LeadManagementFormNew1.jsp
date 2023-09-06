<%-- 
    Document   : LeadManagementFormNew
    Created on : 17 Jun, 2016, 2:53:14 PM
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
                $("#others").hide();
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
                $(document).on('input[type=text]').bind("cut copy paste", function (e) {
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
                var addrs = $("#leadaddressPermanent").val();
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
            function contactNoValidation()
            {

                var contactNo = document.getElementById("contactNo").value;
                var mob = contactNo.length;
                if (mob < 8) {
                    alert("Enter Valid Contact No.");
                    $('#contactNo').val("");
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

            function firstToUpperCase() {

                var str = document.getElementById("firstName2").value;
                var a = str.charAt(0).toUpperCase() + str.substr(1);
                $("#firstName2").val(a);
            }
            function firstToUpperCase1() {

                var str = document.getElementById("lastName2").value;
                var a = str.charAt(0).toUpperCase() + str.substr(1);
                $("#lastName2").val(a);
            }
            function firstToUpperCase2() {

                var str = document.getElementById("designation").value;
                var a = str.charAt(0).toUpperCase() + str.substr(1);
                $("#designation").val(a);
            }
            function firstToUpperCase3() {

                var str = document.getElementById("leadName").value;
                var a = str.charAt(0).toUpperCase() + str.substr(1);
                $("#leadName").val(a);
            }

            function selectAssetNameCode()
            {
                myWindow = window.open("../Lead/selectAssetNameCode.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }

//             function selectAssetPlotDetails()
//            {
//                var a=document.getElementById("assetCode").value;
//                myWindow = window.open("../Lead/selectAssetPlotDetails.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
//            }

            function selectAssetPlotDetails()
            {
                var assetCode = document.getElementById("assetCode").value;
                myWindow = window.open("../Lead/selectSubAssetDetails.htm?assetCode=" + assetCode + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
//             function leadTypeFirstName()
//            {
//                var leadType = document.getElementById("leadType").value;
//                if (leadType === 'VIP')
//                {
//                    $("#contacts").attr("readonly", false);
//                    $("#salutation").attr("readonly", false);
//                    $("#firstName").attr("readonly", false);
//                    $("#lastName").attr("readonly", false);
//                }
//                if (leadType === 'VVIP')
//                {
//                    $("#contacts").attr("readonly", true);
//                    $("#salutation").attr("readonly", true);
//                    $("#firstName").attr("readonly", true);
//                    $("#lastName").attr("readonly", true);
//                }
//
//            }
            function leadTypeFirstName()
            {
                var leadType = document.getElementById("leadType").value;
                if (leadType === 'Individual')
                {
                    $("#contacts").hide();
                    $("#salutation").hide();
                    $("#firstName").hide();
                    $("#lastName").hide();
                }
                if (leadType === 'Corporate')
                {
                    $("#contacts").show();
                    $("#salutation").show();
                    $("#firstName").show();
                    $("#lastName").show();
                }

            }
            function checkSource(test)
            {
//                if (test === 'Campaign')
//                {
//                    $("#tagCampaign1").show();
//                    $("#others1").hide();
//                    return false;
//                }
                if (test === 'Others')
                {
                    $("#others").show();

                    return false;
                }
                else {

                    $("#others").hide();
                    return false;
                }

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
                        <form class="form-inline" id="leadForm" accept-charset="UTF-8" method="post" action="../CRM/leadFormSubmit1.htm" enctype="multipart/form-data" onsubmit="return checkGrid();">



                            <div class="col-md-6 col-xs-12">
                                <div class="x_panel" >
                                    <jsp:include page="../login/headerlink.htm?submodule=Campaign&tab=Campaign&pagetype=form"/>
                                    <div class="x_title"   >
                                        <h2>Lead Management</h2>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <br />

                                        <c:forEach items="${LeadFormData}" var="list">
                                            <c:if test="${list[0] eq '108'}">
                                                <c:set value="${list[1]}" var="name1"/>
                                                <c:set value="${list[2]}" var="status1"/>
                                                <c:set value="${list[3]}" var="mand_status_1"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '109'}">
                                                <c:set value="${list[1]}" var="name2"/>
                                                <c:set value="${list[2]}" var="status2"/>
                                                <c:set value="${list[3]}" var="mand_status_2"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '110'}">
                                                <c:set value="${list[1]}" var="name3"/>
                                                <c:set value="${list[2]}" var="status3"/>
                                                <c:set value="${list[3]}" var="mand_status_3"/>

                                            </c:if>
                                            <c:if test="${list[0] eq '111'}">
                                                <c:set value="${list[1]}" var="name4"/>
                                                <c:set value="${list[2]}" var="status4"/>
                                                <c:set value="${list[3]}" var="mand_status_4"/>

                                            </c:if>
                                            <c:if test="${list[0] eq '112'}">
                                                <c:set value="${list[1]}" var="name5"/>
                                                <c:set value="${list[2]}" var="status5"/>
                                                <c:set value="${list[3]}" var="mand_status_5"/>

                                            </c:if>
                                            <c:if test="${list[0] eq '113'}">
                                                <c:set value="${list[1]}" var="name6"/>
                                                <c:set value="${list[2]}" var="status6"/>
                                                <c:set value="${list[3]}" var="mand_status_6"/>

                                            </c:if>
                                            <c:if test="${list[0] eq '114'}">
                                                <c:set value="${list[1]}" var="name7"/>
                                                <c:set value="${list[2]}" var="status7"/>
                                                <c:set value="${list[3]}" var="mand_status_7"/>

                                            </c:if>
                                            <c:if test="${list[0] eq '115'}">
                                                <c:set value="${list[1]}" var="name8"/>
                                                <c:set value="${list[2]}" var="status8"/>
                                                <c:set value="${list[3]}" var="mand_status_8"/>

                                            </c:if>
                                            <c:if test="${list[0] eq '116'}">
                                                <c:set value="${list[1]}" var="name9"/>
                                                <c:set value="${list[2]}" var="status9"/>
                                                <c:set value="${list[3]}" var="mand_status_9"/>

                                            </c:if>
                                            <c:if test="${list[0] eq '117'}">
                                                <c:set value="${list[1]}" var="name10"/>
                                                <c:set value="${list[2]}" var="status10"/>
                                                <c:set value="${list[3]}" var="mand_status_10"/>

                                            </c:if>
                                            <c:if test="${list[0] eq '118'}">
                                                <c:set value="${list[1]}" var="name11"/>
                                                <c:set value="${list[2]}" var="status11"/>
                                                <c:set value="${list[3]}" var="mand_status_11"/>

                                            </c:if>
                                            <c:if test="${list[0] eq '119'}">
                                                <c:set value="${list[1]}" var="name12"/>
                                                <c:set value="${list[2]}" var="status12"/>
                                                <c:set value="${list[3]}" var="mand_status_12"/>

                                            </c:if>
                                            <c:if test="${list[0] eq '120'}">
                                                <c:set value="${list[1]}" var="name13"/>
                                                <c:set value="${list[2]}" var="status13"/>
                                                <c:set value="${list[3]}" var="mand_status_13"/>

                                            </c:if>
                                            <c:if test="${list[0] eq '121'}">
                                                <c:set value="${list[1]}" var="name14"/>
                                                <c:set value="${list[2]}" var="status14"/>
                                                <c:set value="${list[3]}" var="mand_status_14"/>

                                            </c:if>
                                            <c:if test="${list[0] eq '122'}">
                                                <c:set value="${list[1]}" var="name15"/>
                                                <c:set value="${list[2]}" var="status15"/>
                                                <c:set value="${list[3]}" var="mand_status_15"/>

                                            </c:if>
                                            <c:if test="${list[0] eq '123'}">
                                                <c:set value="${list[1]}" var="name16"/>
                                                <c:set value="${list[2]}" var="status16"/>
                                                <c:set value="${list[3]}" var="mand_status_16"/>

                                            </c:if>
                                            <c:if test="${list[0] eq '124'}">
                                                <c:set value="${list[1]}" var="name17"/>
                                                <c:set value="${list[2]}" var="status17"/>
                                                <c:set value="${list[3]}" var="mand_status_17"/>

                                            </c:if>
                                            <c:if test="${list[0] eq '125'}">
                                                <c:set value="${list[1]}" var="name18"/>
                                                <c:set value="${list[2]}" var="status18"/>
                                                <c:set value="${list[3]}" var="mand_status_18"/>

                                            </c:if>
                                            <c:if test="${list[0] eq '126'}">
                                                <c:set value="${list[1]}" var="name19"/>
                                                <c:set value="${list[2]}" var="status19"/>
                                                <c:set value="${list[3]}" var="mand_status_19"/>

                                            </c:if>
                                            <c:if test="${list[0] eq '127'}">
                                                <c:set value="${list[1]}" var="name20"/>
                                                <c:set value="${list[2]}" var="status20"/>
                                                <c:set value="${list[3]}" var="mand_status_20"/>

                                            </c:if>
                                            <c:if test="${list[0] eq '128'}">
                                                <c:set value="${list[1]}" var="name21"/>
                                                <c:set value="${list[2]}" var="status21"/>
                                                <c:set value="${list[3]}" var="mand_status_21"/>

                                            </c:if>
                                            <c:if test="${list[0] eq '129'}">
                                                <c:set value="${list[1]}" var="name22"/>
                                                <c:set value="${list[2]}" var="status22"/>
                                                <c:set value="${list[3]}" var="mand_status_22"/>

                                            </c:if>
                                            <c:if test="${list[0] eq '130'}">
                                                <c:set value="${list[1]}" var="name23"/>
                                                <c:set value="${list[2]}" var="status23"/>
                                                <c:set value="${list[3]}" var="mand_status_23"/>

                                            </c:if>
                                            <c:if test="${list[0] eq '131'}">
                                                <c:set value="${list[1]}" var="name24"/>
                                                <c:set value="${list[2]}" var="status24"/>
                                                <c:set value="${list[3]}" var="mand_status_24"/>

                                            </c:if>
                                            <c:if test="${list[0] eq '512'}">
                                                <c:set value="${list[1]}" var="name512"/>
                                                <c:set value="${list[2]}" var="status512"/>
                                                <c:set value="${list[3]}" var="mand_status_512"/>

                                            </c:if>
                                            <c:if test="${list[0] eq '513'}">
                                                <c:set value="${list[1]}" var="name513"/>
                                                <c:set value="${list[2]}" var="status513"/>
                                                <c:set value="${list[3]}" var="mand_status_513"/>

                                            </c:if>

                                        </c:forEach>



                                        <c:forEach items="${campaignList}" var="type">
                                            <c:set var="companyName" value="${type.companyName}"/>
                                            <c:set var="companyType" value="${type.companyType}"/>
                                            <c:set var="companyDetails" value="${type.companyDetails}"/>
                                            <c:set var="emailId" value="${type.emailId}"/>
                                            <c:set var="phoneNo" value="${type.phoneNo}"/>

                                        </c:forEach>

                                        <c:if test="${status3 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_3 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if>
                                                <label class="control-label">${name3}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                        <c:forEach items="${leadmanagmentList}" var="type" end="0">

                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input name="leadType" id="leadType" class="form-controlvalidate[required] " type="text" readonly value="${type.leadType}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input name="leadType" id="leadType" class="form-control" type="text" readonly value="${type.leadType}">
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>

                                                        <select id="leadType" name="leadType" class="form-control validate[required]" onchange="leadTypeFirstName(this.value);">
                                                            <option value="" disabled selected>Select your option</option>
                                                            <option value="Corporate">Corporate</option>
                                                            <option value="Individual">Individual</option>
                                                            <!--                                                            <option value="VIP">VIP</option>
                                                                                                                        <option value="VVIP">VVIP</option>
                                                                                                                        <option value="Regular">Regular</option>
                                                                                                                        <option value="Walk-In">Walk-In</option>-->
                                                            <!--<option value="Internal Employee">Internal Employee</option>-->

                                                        </select>
                                                    </c:otherwise>

                                                </c:choose>

                                            </div>
                                        </c:if>

                                        <c:if test="${status2 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_2 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if>
                                                <label class="control-label">${name2}
                                                </label>
                                                <c:choose>
                                                    <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                        <c:forEach items="${leadmanagmentList}" var="type" end="0">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="leadName" name="leadName" maxlength="100" class="form-control " ${mand_status_2} autocomplete="off" value="${type.leadName}">
                                                                    <input name="sno" type="hidden" value="${type.sno}">
                                                                    <input name="status" type="hidden" value="${type.status}">
                                                                    <input name="leadCode" type="hidden" value="${type.leadCode}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="leadName"  name="leadName" readonly class="form-control" value="${type.leadName}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input name="leadCode" type="hidden" value="">
                                                        <input name="serialNum" type="hidden" value="${SNo}">
                                                        <input type="text" id="leadName" name="leadName" maxlength="100" value="${companyName}" readonly="" class="form-control " ${mand_status_2} autocomplete="off" onchange="uniqueLeadName();" onkeypress="return isNumberKey4(event)" onkeyup="firstToUpperCase3();">

                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                        </c:if>


                                        <c:if test="${status4 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_4 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if>
                                                <label class="control-label">${name4}
                                                </label>
                                                <c:choose>
                                                    <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                        <c:forEach items="${leadmanagmentList}" var="type" end="0">

                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <select class="form-control" id="industry" name="industry" value="">
                                                                        <option value="${type.industry}" disabled selected>${type.leadIndustry}</option>
                                                                        <option>Airport</option>
                                                                        <option>Camps</option>
                                                                        <option>Construction</option>
                                                                        <option>Hotels</option>
                                                                        <option>Oil and Gas</option>
                                                                    </select>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input name="industry" class="form-control" type="text" readonly value="${type.leadIndustry}">
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>

                                                        <select id="industry" name="industry" class="form-control" ${mand_status_3} >
                                                            <option value="" disabled selected>Select your option</option>
                                                            <option>Airport</option>
                                                            <option>Camps</option>
                                                            <option>Construction</option>
                                                            <option>Hotels</option>
                                                            <option>Oil and Gas</option>



                                                        </select>
                                                    </c:otherwise>

                                                </c:choose>

                                            </div>
                                        </c:if>

                                        <p>&nbsp;</p>


                                        <c:if test="${status5 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline" id="contacts">
                                                <c:if test="${mand_status_5 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if>
                                                <!--<a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>-->
                                                <label class="control-label">${name5}
                                                </label>
                                                <c:choose>
                                                    <c:when test="${fn:length(leadmanagmentList) > 0}" >
                                                        <c:forEach items="${leadmanagmentList}" var="type" end="0">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="contactNo" name="contacts"  autocomplete="off" maxlength="30" class="form-control" value="${type.contacts}"  >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="contactNo"  name="contacts" readonly class="form-control" value="${type.contacts}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" id="contactNo" name="contacts" maxlength="11"  autocomplete="off" class="form-control" value="" onkeypress="return isNumberKey(event)" onchange="contactNoValidation();" >
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>

                                        <c:if test="${status6 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_6 eq 'required'}">

                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-21px;color:transparent;font-weight: bold;">*</a>
                                                <label style="margin-top:-21px;" class="control-label">${name6}
                                                </label>
                                                <c:choose>
                                                    <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                        <c:forEach items="${leadmanagmentList}" var="type" end="0">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <textarea rows="1" class="form-control" style="resize: none" maxlength="100" name="leadaddressPermanent"  id="leadaddressPermanent" type="text" value="${type.leadAddress}" autocomplete="off">${type.leadAddress} </textarea>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <textarea class="form-control" rows="1" readonly style="resize: none" type="text" value="${type.leadAddress}">${type.leadAddress}</textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <textarea rows="1" class="form-control" style="resize: none" maxlength="100" value="" name="leadaddressPermanent"  id="leadaddressPermanent" type="text" autocomplete="off"></textarea>



                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>

                                        <c:if test="${status7 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_7 eq 'required'}">

                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-21px;color:transparent;font-weight: bold;">*</a>
                                                <label style="margin-top:-21px;" class="control-label">${name7}
                                                </label>
                                                <c:choose>
                                                    <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                        <c:forEach items="${leadmanagmentList}" var="type" end="0">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <textarea rows="1" type="text" id="remarks"  name="remarks" class="form-control" style="resize: none;" value="${type.remarks}">${type.remarks}</textarea>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <textarea rows="1" type="text" id="remarks"  name="remarks" readonly class="form-control" style="resize: none;" value="${type.remarks}">${type.remarks}</textarea>
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>

                                                        <textarea rows="1" class="form-control" style="resize: none" maxlength="200" value="" id="remarks"  name="remarks" style="resize: none;" type="text"></textarea>
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <c:if test="${status512 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_512 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if>
                                                <!--<a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>-->
                                                <label  class="control-label">${name512}
                                                </label>
                                                <c:choose>
                                                    <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                        <c:forEach items="${leadmanagmentList}" var="type">

                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input name="leadSource" class="form-control validate[required]" type="text" readonly  value="${type.leadSource}">

                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input name="leadSource" class="form-control" type="text" readonly  value="${type.attribute1}" onload="checkOthers()">
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <select id="leadSource" name="leadSource" class="form-control validate[required]" onchange="checkSource(this.value);" ${mand_status_512} >
                                                            <option value="" disabled selected>Select your option</option>
                                                            <c:forEach items="${LeadFormData_dropDown_category}" var="list">
                                                                <c:if test="${list[0] eq 'F-16'}">
                                                                    <option>${list[1]}</option>                                     
                                                                </c:if>
                                                            </c:forEach>

                                                        </select>
<!--                                                        <select id="leadSource" name="leadSource" class="form-control validate[required]" onchange="checkSource(this.value);" ${mand_status_3}>
                                                            <option value="" disabled selected>Select your option</option>
                                                            <option value="Campaign">Campaign</option>
                                                            <option value="News Paper">News Paper</option>
                                                            <option value="Personal">Personal</option>
                                                            <option value="Offline">Offline</option>
                                                            <option value="Others">Others</option>
                                                            <option value="TV">TV</option>


                                                        </select>-->

                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <c:if test="${status513 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline" id="others">
                                                <c:if test="${mand_status_513 eq 'required'}">
                                                    <!--<a style="font-size: 15px;color:red;font-weight: bold;">*</a>-->
                                                </c:if>
                                                <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label  class="control-label">${name513}
                                                </label>
                                                <c:choose>
                                                    <c:when test="${action ne 'edit'}">
                                                        <input type="text" id="others" name="others" maxlength="20" value="" class="form-control "   >
                                                    </c:when>
                                                    <c:when test="${action eq 'view'}">
                                                        <input type="text" id="others" name="others" maxlength="20" value="${type.attribute1}" class="form-control "   >
                                                    </c:when>

                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <!--                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline" id="others">
                                        <c:if test="${mand_status_513 eq 'required'}">
                                            <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                        </c:if>
                                        <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                        <label  class="control-label">${name513}
                                        </label>
                                        <c:forEach items="${leadmanagmentList}" var="type">
                                            <c:choose>
                                                
                                                    
                                                <c:when test="${action eq 'view'}">
                                                    <input type="text" id="others" name="others" readonly="" maxlength="20" value="${type.attribute2}" class="form-control "   >
                                                </c:when>
                                                    
                                                    
                                            </c:choose>
                                        </c:forEach>
                           </div>-->
                                        <p>&nbsp;</p> 
                                        <p>&nbsp;</p> 



                                        <div class="x_title">
                                            <h2>Contacts</h2>

                                            <div class="clearfix"></div>
                                        </div>
                                        <p>&nbsp;</p>
                                        <c:if test="${action ne 'view'}" >
                                            <c:if test="${status8 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline" id="firstName">
                                                    <c:if test="${mand_status_8 eq 'required'}">
                                                        <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${name8}
                                                    </label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                            <c:forEach items="${leadmanagmentList}" var="type">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <select id="salutation" class="form-control" style="width: 48px;" onclick="checkavl(this.value);">
                                                                            <option value="" disabled selected></option>
                                                                            <option value="Ms">Ms</option>
                                                                            <option value="Mr">Mr</option>

                                                                        </select>
                                                                        <input type="text" id="firstName2" name="firstName" maxlength="100" style="width: 121px;" class="form-control" ${mand_status_8} autocomplete="off" value="${type.firstName}" onkeyup="firstToUpperCase();">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" id="firstName2"  name="firstName" class="form-control"  readonly value="${type.firstName}">
                                                                    </c:otherwise> 
                                                                </c:choose>

                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <select id="salutation" class="form-control" style="width: 48px;" onclick="checkavl(this.value);">
                                                                <option value="" disabled selected></option>
                                                                <option value="Ms">Ms</option>
                                                                <option value="Mr">Mr</option>

                                                            </select>
                                                            <input type="text" id="firstName2"  name="firstName" maxlength="100" value="" style="width: 121px;" autocomplete="off" class="form-control"  onkeyup="firstToUpperCase();" onkeypress="return isNumberKey4(event)">
                                                        </c:otherwise>        
                                                    </c:choose>
                                                </div>
                                            </c:if>


                                            <c:if test="${status9 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline" id="lastName">
                                                    <c:if test="${mand_status_9 eq 'required'}">
                                                        <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${name9}
                                                    </label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                            <c:forEach items="${leadmanagmentList}" var="type">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" id="lastName" name="lastName"  maxlength="100" class="form-control" value="${type.lastName}" autocomplete="off" onkeyup="firstToUpperCase1();">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" id="lastName" name="lastName"  class="form-control"  readonly value="${type.lastName}">
                                                                    </c:otherwise> 
                                                                </c:choose>

                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" id="lastName2" name="lastName"  maxlength="100" value="" class="form-control validate[contactPerson]" autocomplete="off" onkeyup="firstToUpperCase1();" onkeypress="return isNumberKey4(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div>
                                            </c:if>
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <label class="control-label">
                                                </label>
                                                <input type="hidden" >
                                            </div>
                                            <p>&nbsp;</p>
                                            <c:if test="${status10 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_10 eq 'required'}">
                                                        <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${name10}
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
                                                            <input type="text" id="designation" name="designation" maxlength="20" autocomplete="off" class="form-control" value="" onkeypress="return isNumberKey4(event)" onkeyup="firstToUpperCase2();" >
                                                        </c:otherwise>        
                                                    </c:choose>
                                                </div>
                                            </c:if>
                                            <!--</br>-->
                                            <c:if test="${status11 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_11 eq 'required'}">
                                                        <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${name11}
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
                                                            <input type="email" id="email" name="email" maxlength="100" readonly="" value="${emailId}" autocomplete="off" class="form-control validate[custom[email]]" onchange="emailValidate();">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </c:if>

                                            <c:if test="${status12 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_12 eq 'required'}">
                                                        <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${name12}
                                                    </label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                            <c:forEach items="${leadmanagmentList}" var="type">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" id="mobile" class="form-control" ${mand_status_12} autocomplete="off" maxlength="11" value="${type.mobile}" onkeypress="return isNumberKey(event)" onchange="mobileNoValidation()">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text"   name="mobile" readonly class="form-control" value="${type.mobile}">
                                                                    </c:otherwise> 
                                                                </c:choose>

                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" id="mobile" name="mobile" readonly="" value="${phoneNo}" class="form-control" autocomplete="off" maxlength="11" onkeypress="return isNumberKey(event)" onchange="mobileNoValidation();">
                                                        </c:otherwise>        
                                                    </c:choose>
                                                </div>
                                            </c:if>
                                            <p>&nbsp;</p>
                                            <c:if test="${status13 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_13 eq 'required'}">
                                                        <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${name13}
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
                                            </c:if>
                                            <c:if test="${status14 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_14 eq 'required'}">
                                                        <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${name14}
                                                    </label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                            <c:forEach items="${leadmanagmentList}" var="type">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input id="city" class="form-control" ${mand_status_13} type="text" readonly value="${type.city}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input name="city" class="form-control" type="text" readonly value="${type.city}">
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <select id="city"  class="form-control" ${mand_status_13} name="city">
                                                                <option value="" disabled selected>Select your option</option>
                                                                <c:forEach items="${LeadFormData_dropDown_category}" var="list">
                                                                    <c:if test="${list[0] eq 'F-13'}">
                                                                        <option>${list[1]}</option>                                     
                                                                    </c:if>
                                                                </c:forEach>

                                                            </select>
<!--                                                            <select id="city"  class="form-control" ${mand_status_13}>
                                                                <option value="" disabled selected>Select your option</option>
                                                                <option value="Buraymi">Buraymi</option>
                                                                <option value="Haima">Haima</option>
                                                                <option value="Ibri">Ibri</option>
                                                                <option value="Khasab">Khasab</option>
                                                                <option value="Muscat">Muscat</option>
                                                                <option value="Nizwa">Nizwa</option>
                                                                <option value="Salalah">Salalah</option>
                                                                <option value="Sohar">Sohar</option>
                                                                <option value="Sur">Sur</option>

                                                            </select>-->

                                                        </c:otherwise>        
                                                    </c:choose>
                                                </div>
                                            </c:if>

                                            <c:if test="${status15 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_15 eq 'required'}">
                                                        <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${name15}
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
                                            </c:if>
                                            <p>&nbsp;</p>
                                            <c:if test="${status16 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_16 eq 'required'}">
                                                        <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${name16}
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
                                            </c:if>


                                            <c:if test="${status17 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_17 eq 'required'}">
                                                        <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${name17}
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
                                            </c:if>

                                            <c:if test="${status18 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_18 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${name18}

                                                        <p style="color: blue;font-size: 9px;">(If address is same as Lead Address)</p>
                                                        <label >
                                                            <input type="radio" id="same" name="same" value="same" onclick="addressvalidate(this.value);">Same
                                                            <input type="radio" id="different" name="same" value="different" onclick="addressvalidate(this.value);" checked="">Different
                                                        </label>
                                                    </label>

                                                    <!--                                                    <input type="radio" id="same" name="same" value="same" onclick="addressvalidate(this.value);">Same
                                                                                                        <input type="radio" id="different" name="same" value="different" onclick="addressvalidate(this.value);" checked="">Different-->
                                                    <textarea class="form-control" style="margin-top:-38px" rows="1" style="resize: none;text-transform: capitalize;" maxlength="100" value="" id="addressDifferent" type="text" autocomplete="off"></textarea>

                                                </div>
                                            </c:if>
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">
                                                </label>

                                                <!--<textarea class="form-control" rows="1" style="resize: none" maxlength="100" value="" id="addressDifferent" type="text" autocomplete="off"></textarea>-->
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>


                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>
                                        <div class="x_title">
                                            <h2>Enquiry Details</h2>

                                            <div class="clearfix"></div>
                                        </div>
                                        <c:if test="${status19 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_19 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${name19}
                                                </label>
                                                <c:choose>
                                                    <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                        <c:forEach items="${leadmanagmentList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="assetCode" name="assetCode" class="form-control" maxlength="3" value="${type.pincode}"  autocomplete="off" onclick="selectAssetNameCode();">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="assetCode" name="assetCode" readonly class="form-control" value="${type.pincode}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" id="assetCode" name="assetCode" class="form-control" maxlength="30" placeholder="Select Property Code" readonly=""  autocomplete="off" onclick="selectAssetNameCode();">

                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <c:if test="${status20 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_20 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${name20}
                                                </label>
                                                <c:choose>
                                                    <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                        <c:forEach items="${leadmanagmentList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="assetName" name="assetName" class="form-control" maxlength="30" value="${type.pincode}"   autocomplete="off">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="assetName" name="assetName" readonly class="form-control" value="${type.pincode}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" id="assetName" name="assetName" class="form-control" maxlength="30" placeholder="" readonly=""  autocomplete="off">

                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>

                                        <c:if test="${status21 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_21 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${name21}
                                                </label>
                                                <c:choose>
                                                    <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                        <c:forEach items="${leadmanagmentList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="assetPlotCode" name="assetPlotCode" class="form-control" maxlength="30" value="${type.pincode}"  autocomplete="off">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="assetPlotCode" name="assetPlotCode" readonly class="form-control" value="${type.pincode}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" id="assetPlotCode" name="assetPlotCode" class="form-control" maxlength="30" placeholder="Select Flat Code" readonly="" autocomplete="off" onclick="selectAssetPlotDetails();" >

                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>



                                        <p>&nbsp;</p>

                                        <c:if test="${status22 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_22 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${name22}
                                                </label>
                                                <!--                                                <input type="text" id="assetPlotNo" name="assetPlotNo" class="form-control" maxlength="30" readonly="" placeholder="" autocomplete="off">-->
                                                <input type="text" id="subAssetName" name="subAssetName" class="form-control" maxlength="30" readonly="" placeholder="" autocomplete="off">
                                            </div>
                                        </c:if>

                                        <c:if test="${status23 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_23 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${name23}
                                                </label>
                                                <input type="text" id="followUp" name="followUp" readonly="" onmouseover="" style="cursor: pointer;" value="" placeholder="Select Date" class="form-control" onclick="javascript:NewCssCal('followUp', 'ddMMMyyyy')" >
                                            </div>
                                        </c:if>



                                        <c:if test="${status24 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_24 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-20px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label" style="margin-top:-20px;">${name24}
                                                </label>
                                                <textarea class="form-control" rows="1" style="resize: none" maxlength="100" value="" autocomplete="off" name="followUpRemarks" id="followUpRemarks" type="text"></textarea>
                                            </div>
                                        </c:if>

                                        <p>&nbsp;</p>


                                        <c:if test="${sno eq null}">
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
                                                            <th><span style="color:red">*</span> First Name</th>
                                                            <th> Last Name</th>
                                                            <th> Designation</th>
                                                            <th> Email</th>
                                                            <th><span style="color:red">*</span> Mobile No</th>
                                                            <th> DOB</th>
                                                            <th> Post Box No</th>
                                                            <th> Postal Code</th>
                                                            <th><span style="color:red">*</span> City</th>
                                                            <th> Country</th>
                                                            <th> Address</th>
                                                            <th> Business Card</th>
                                                            <th>Property Code</th>
                                                            <th>Property name</th>
                                                            <th>Flat Code</th>
                                                            <th>Flat Name / Flat No.</th>
                                                            <th> Follow Up Date</th>
                                                            <th> Follow Up Remarks</th>
                                                        </tr>

                                                    </thead>
                                                    <tbody id="resourcetable">

                                                    </tbody>
                                                    <script>
                                                        var count = 0;
                                                        function addOrderRow_test() {
                                                            var valid1 = true;
                                                            var leadType1 = document.getElementById('leadType').value;
                                                            if (leadType1 === "" || leadType1 === null) {
                                                                alert("Please Select Lead Type");
                                                                return false;
                                                            }
                                                            var x = document.getElementById('salutation').value &&
                                                                    document.getElementById('firstName2').value &&
                                                                    document.getElementById('mobile').value &&
                                                                    document.getElementById('city').value;

                                                            var y = document.getElementById('mobile').value &&
                                                                    document.getElementById('city').value;

                                                            var z = document.getElementById('leadType').value;
                                                            if (z == 'Corporate') {
                                                                var fn = document.getElementById('firstName').value;
                                                                if (x === "" || x === null)
                                                                {
                                                                    alert("Please Select Mandatory Fields");
                                                                    valid1 = false;
                                                                }
                                                            } else
                                                            {
                                                                if (y === "" || y == null)
                                                                {
                                                                    alert("Please Select Mandatory Fields");
                                                                    valid1 = false;
                                                                }

                                                            }


                                                            if (valid1 == true) {
                                                                var salutation = document.getElementById('salutation').value;
                                                                var firstName = document.getElementById('firstName2').value;
                                                                var lastName = document.getElementById('lastName2').value;
                                                                var designation = document.getElementById('designation').value;
                                                                var email = document.getElementById('email').value;
                                                                var mobile = document.getElementById('mobile').value;
                                                                var dob = document.getElementById('dob').value;
                                                                var postbxno = document.getElementById('postbxno').value;
                                                                var pincode = document.getElementById('pincode').value;
                                                                var city = document.getElementById('city').value;
                                                                var country = document.getElementById('country').value;
                                                                var addressDifferent = document.getElementById('addressDifferent').value;
                                                                var assetCode1 = document.getElementById('assetCode').value;
                                                                var assetName1 = document.getElementById('assetName').value;
                                                                var assetPlotCode1 = document.getElementById('assetPlotCode').value;
                                                                var assetPlotNo1 = document.getElementById('subAssetName').value;
                                                                var followUp1 = document.getElementById('followUp').value;
                                                                var remarks2 = document.getElementById('followUpRemarks').value;
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
                                                                            '<td ><input class="form-control " style="text-align:left;" type="text" readonly name="firstName1" value="' + salutation + " " + firstName +
                                                                            '" ><input class="form-control" style="text-align:center;" type="hidden" readonly name="salutation" value="' + salutation +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text"readonly name="lastName1" value="' + lastName +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text"readonly name="designation1" value="' + designation +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text"readonly name="email1" value="' + email +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:right;" type="text"readonly name="mobile1" id="mobile" value="' + mobile1 +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text"readonly name="dob" value="' + dob +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:right;" type="text"readonly name="postbxno" value="' + postbxno +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:right;" type="text"readonly name="pincode" value="' + pincode +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text"readonly name="city" value="' + city +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text"readonly name="country" value="' + country +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text" readonly name="addressDifferent" value="' + addressDifferent +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:left;padding-top:0px;" type="file" onchange="Validate(this)"; id="UploadMedicalRepName" readonly name="UploadMedicalRepName" value="' + UploadMedicalRepName +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text" readonly name="assetCode1" value="' + assetCode1 +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text" readonly name="assetName1" value="' + assetName1 +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text" readonly name="assetPlotCode1" value="' + assetPlotCode1 +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text" readonly name="assetPlotNo1" value="' + assetPlotNo1 +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text" readonly name="followUp1" value="' + followUp1 +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text" readonly name="folowUpHistory" value="' + remarks2 +
                                                                            '" style="border: none"></td>';
                                                                    count++;
                                                                    document.getElementById('salutation').value = "";
                                                                    document.getElementById('firstName2').value = "";
                                                                    document.getElementById('lastName2').value = "";
                                                                    document.getElementById('designation').value = "";
                                                                    document.getElementById('email').value = "";
                                                                    document.getElementById('mobile').value = "";
                                                                    document.getElementById('dob').value = "";
                                                                    document.getElementById('postbxno').value = "";
                                                                    document.getElementById('pincode').value = "";
                                                                    document.getElementById('city').value = "";
                                                                    document.getElementById('addressDifferent').value = "";
                                                                    document.getElementById('followUp').value = "";
                                                                    document.getElementById('followUpRemarks').value = "";
                                                                    document.getElementById('assetCode').value = "";
                                                                    document.getElementById('assetName').value = "";
                                                                    document.getElementById('assetPlotCode').value = "";
                                                                    document.getElementById('assetPlotNo').value = "";

                                                                }

                                                            } else {
                                                                return;
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
                                                            var leadType = document.getElementById("leadType").value;
                                                            var contacts1 = document.getElementById("contactNo").value;
                                                            if (leadType == "Corporate") {
                                                                if (document.getElementById("contactNo").value == null || document.getElementById("contactNo").value == "")
                                                                {
                                                                    alert("Please enter Contact No for Lead");
                                                                    return false;
                                                                } else {
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

                                                            }
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



                                            </c:if>


                                        </div>
                                    </c:if>
                                    <c:if test="${action eq 'view'}" >
                                        <div style="overflow: scroll;height: auto;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">

                                            <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                <thead>
                                                    <tr>
                                                        <th><i class="fa fa-trash fa-lg"></i></th>                                                
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
                                                        <th>Property Code</th>
                                                        <th>Property name</th>
                                                        <th>Flat Code</th>
                                                        <th>Flat Name / Flat No.</th>
                                                        <th> Follow Up Date</th>
                                                        <th> Follow Up Remarks</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="currencytablemed">
                                                    <c:forEach items="${leadmanagmentList}" var="type">
                                                        <tr class="item-row"> 
                                                            <td><i class="fa fa-trash fa-lg"></i></td>
                                                            <td><input class="form-control" style="text-align: center;" name="firstName" id="firstName" readonly="" autocomplete="off" type="text" maxlength="30" value="${type.firstName}"></td>
                                                            <td><input class="form-control" style="text-align: center;" name="lastName" id="lastName" readonly autocomplete="off" type="text" maxlength="30" value="${type.lastName}"></td>
                                                            <td><input class="form-control" style="text-align: center;" name="designation" id="designation" readonly autocomplete="off" type="text" maxlength="30" value="${type.designation}"></td>
                                                            <td><input class="form-control" style="text-align: center;" name="email" id="email" readonly autocomplete="off" type="text" maxlength="100" value="${type.email}"></td>
                                                            <td><input class="form-control" style="text-align: center;"  name="mobile" id="mobile" readonly autocomplete="off" type="text" min="8" maxlength="11" value="${type.mobileNo}"></td>
                                                            <td><input id="dob" readonly="" onmouseover="" name="dob" style="cursor: pointer;width:200px;text-align: center;" class="form-control" value="<fmt:formatDate pattern="dd-MMM-yyyy"  value="${type.dob}"/>" ></td> 
                                                            <td><input class="form-control" style="text-align: center;" name="postbxno" id="postbxno" readonly autocomplete="off" type="text" maxlength="30" value="${type.postBoxNo}"></td>
                                                            <td><input class="form-control" style="text-align: center;" name="pincode" id="pincode" readonly autocomplete="off" type="text" maxlength="30" value="${type.postalCode}"></td>
                                                            <td><input class="form-control" style="text-align: center;" name="city" id="city" readonly autocomplete="off" type="text" maxlength="30" value="${type.city}"></td>
                                                            <td><input class="form-control" style="text-align: center;" name="country" id="country" readonly autocomplete="off" type="text" maxlength="30" value="${type.countrt}"></td>
                                                            <td><input class="form-control" style="text-align: center;" name="addressDifferent" id="addressDifferent" readonly autocomplete="off" type="text" maxlength="30" value="${type.contaceAddress}"></td>
                                                            <td>
                                                                <c:forEach items="${leadmanagmentList}" var="doc">
                                                                    <%--<input value="${doc.mobile}" name="mobileAttach" id="mobileAttach" type="hidden" >--%>

                                                                    <c:if test="${not empty doc.businessFilename}">
                                                                        <a style="color: black" href="../Lead/leadAttachDownload.htm?sno=${doc.sno}" title="Click to download">
                                                                            <i class="fa fa-file-pdf-o" style="font-size: 15px" ></i>
                                                                            ${doc.businessFilename} 
                                                                            <input value="${doc.businessFilename}" name="leaFileName" id="fileName" type="hidden" >
                                                                            <input value="${doc.businessAttachment}" name="UploadMedicalRepName" id="content" type="hidden" >
                                                                        </a>
                                                                    </c:if> 


                                                                </c:forEach>


                                                            </td>
                                                            <td><input id="dob" readonly="" onmouseover="" name="assetCode" style="cursor: pointer;width:200px;text-align: center;" class="form-control"   value="${type.assetCode}" ></td> 
                                                            <td><input class="form-control" style="text-align: center;" name="assetName" id="postbxno" readonly autocomplete="off" type="text" maxlength="30" value="${type.assetName}"></td>
                                                            <td><input class="form-control" style="text-align: center;" name="assetPlotCode" id="pincode" readonly autocomplete="off" type="text" maxlength="30" value="${type.assetPlotCode}"></td>
                                                            <td><input class="form-control" style="text-align: center;" name="assetPlotNo" id="city" readonly autocomplete="off" type="text" maxlength="30" value="${type.assetPlotNo}"></td>
                                                            <td><input class="form-control" style="text-align: center;" name="folloeUpDate" id="country" readonly autocomplete="off" type="text" maxlength="30" value="<fmt:formatDate pattern="dd-MMM-yyyy"  value="${type.folloeUpDate}"/>" ></td>
                                                            <td><input class="form-control" style="text-align: center;" name="followUpRemarks" id="addressDifferent" readonly autocomplete="off" type="text" maxlength="30" value="${type.followUpRemarks}"></td>

                                                        </tr>
                                                    </c:forEach>
                                                </tbody>

                                            </table>

                                        </div>
                                    </c:if>
                                    <br/>





                                </div>
                                <c:if test="${action ne 'view'}">

                                    <div class="form-actions" >
                                        <!--<div class="col-md-4 col-sm-12 col-xs-12 form-group">-->
                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">

                                            <button type="submit" class="btn btn-primary" style="" > Save </button>

                                            <a href="../Lead/LeadManagementListNew.htm"  class="btn btn-danger"  style="">Cancel</a>
                                        </div>
                                        <!--</div>-->
                                    </div>
                                </c:if>

                            </div>


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

            alert("Select Asset Name");
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
        var x = '<select class="form-control" id="categoryEnq" name="productType" style="width:200px;"><option value="" selected>Select Asset Name</option><c:forEach items="${menucategoryList}" var="menu1"><option value="${menu1.categoryName}">${menu1.categoryName}</option></c:forEach></select>';
        return x;
    }
    function callservice() {
        var s = '<select class="form-control" id="categoryService" name="categoryService" style="width:200px;"><option value="">Select Service Type</option><c:forEach items="${itemsubcategList}" var="service"><option>${service.itemSubCategory}</option></c:forEach></select>';
        return s;
    }
    function uniqueLeadName() {
        var leadName = document.getElementById("leadName").value;
        $.ajax({
            type: "POST",
            url: '../Lead/getLeadName.htm',
            data: {
                leadName: leadName,
            },
            success: function (data) {
                if ($.trim(data) == 'Data Already Exists') {
                    alert("Lead Name Is  Already Exist");
                    document.getElementById("leadName").value = "";
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
