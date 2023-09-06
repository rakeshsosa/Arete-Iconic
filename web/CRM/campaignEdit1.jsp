<%-- 
    Document   : campaignEdit1
    Created on : 19 Oct, 2016, 6:40:41 PM
    Author     : ebs-sdd14
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="en">
    <% java.util.Date d = new java.util.Date();%>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../common/validate/validationEngine.css" type="text/css">
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript" charset="utf-8"></script>
        <script src="../common/validate/jquery.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript" src="../common/csspopup.js"></script>
        <script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>
        <link href="../common/theme/css/disableSelection.css" rel="stylesheet" type="text/css"/>
        <title>arête Assets Management</title>
        <script type="text/javascript">

            function check_digit(e, obj, intsize, deczize) {
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

                var charCode = (evt.which) ? evt.which : event.keyCode
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                {
                    alert("Please Enter Numeric value");
                    return false;
                }


                return true;

            }

            function calculation() {
                var a = 0;
                var x = document.getElementById("expectedRevenue").value;
                var y = document.getElementById("budgetedCost").value;
                var z = Math.abs(x - y);
                if (y != 0)
                {
                    a = Math.ceil((z / y) * 100);

                }
                $("#roi").val(a);

            }


            function mobileNoValidation(com)
            {
                var $itemRow = $(com).closest('tr');
                var phoneNo = $itemRow.find("#phone").val();
                var mob = phoneNo.length;
                if (mob < 8) {
                    alert("Enter Valid Mobile No.");
                    $itemRow.find("#phone").val('');
//                    $("#phone").val("");
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

            function Validate($this)
            {
                var fl = document.getElementById("attachmentName").value;
                var fileSize = $this.files[0];
                var sizeInMb = fileSize.size / 1024;
                var sizeLimit = 1024 * 2;
                if (sizeInMb > sizeLimit) {
                    alert("File Size Exceeded(Only 2MB Allowed)");
                    $($this).val('');
                    return;
                }
                var fmt = /^.*\.(jpg|JPG|gif|GIF|png|PNG|jpeg|JPEG|xls|XLS|xlsx|XLSX|doc|DOC|docx|DOCX|pdf|PDF)$/;
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

            function calcDob() {
                var campaignStatus = document.getElementById("campaignStatus").value;
                var startDate = document.getElementById("startDate").value;
                var todayDate = document.getElementById("todayDate").value;
                var endDate = document.getElementById("endDate").value;

                if (startDate === '')
                {
                    alert("Please Select The Start Date");
                    $("#endDate").val("");
                    return false;
                }

                var start1 = startDate.split("-");
                var end1 = endDate.split("-");

                var srtDate = new Date(start1[1] + '/' + start1[0] + '/' + start1[2]);
                var enDate = new Date(end1[1] + '/' + end1[0] + '/' + end1[2]);

                var timeDiff = enDate.getTime() - srtDate.getTime();

                var diffDate = Math.ceil(timeDiff / (1000 * 3600 * 24));
                $("#totaldays1").val(diffDate);

                if (diffDate < 0) {
                    alert("Invalid Date Range!\nStart Date cannot be after End Date!")
                    $("#endDate").val("");
                    return false;
                }
                var todayDate1 = todayDate.split("-");
                var endDate1 = endDate.split("-");

                var finaltodayDate = new Date(todayDate1[1] + '/' + todayDate1[0] + '/' + todayDate1[2]);
                var finalendDate = new Date(endDate1[1] + '/' + endDate1[0] + '/' + endDate1[2]);

                var timeDiff = (finaltodayDate.getTime() - finalendDate.getTime());

                var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
                $("#totaldays").val(diffDays);

                if (campaignStatus === 'Completed')
                {
                    var endDate = document.getElementById("endDate").value;
                    var todayDate = document.getElementById("todayDate").value;

                    var start1 = endDate.split("-");
                    var end1 = todayDate.split("-");

                    var srtDate = new Date(start1[1] + '/' + start1[0] + '/' + start1[2]);
                    var enDate = new Date(end1[1] + '/' + end1[0] + '/' + end1[2]);

                    var timeDiff = srtDate.getTime() - enDate.getTime();

                    var diffDate = Math.ceil(timeDiff / (1000 * 3600 * 24));

                    if (diffDate > 0) {
                        alert("Invalid Date Range!\nYou Can't Select The Future Date!")
                        $("#endDate").val("");
                        return false;
                    }
                }

            }

            function calstartdt() {

                var startDate = document.getElementById("startDate").value;

                var todayDate = document.getElementById("todayDate").value;
                var endDate = document.getElementById("endDate").value;

                var start1 = startDate.split("-");
                var end1 = endDate.split("-");

                var srtDate = new Date(start1[1] + '/' + start1[0] + '/' + start1[2]);
                var enDate = new Date(end1[1] + '/' + end1[0] + '/' + end1[2]);

                var timeDiff = srtDate.getTime() - enDate.getTime();

                var diffDate = Math.ceil(timeDiff / (1000 * 3600 * 24));


                if (diffDate > 0) {
                    alert("Invalid Date Range!\nStart Date cannot be after End Date!")
                    $("#endDate").val("");
                    $("#startDate").val("");
                    return false;
                }


                var campaignStatus = document.getElementById("campaignStatus").value;

                if (campaignStatus === 'Planned')
                {
                    var startDate = document.getElementById("startDate").value;
                    var todayDate = document.getElementById("todayDate").value;

                    var start1 = startDate.split("-");
                    var end1 = todayDate.split("-");

                    var srtDate = new Date(start1[1] + '/' + start1[0] + '/' + start1[2]);
                    var enDate = new Date(end1[1] + '/' + end1[0] + '/' + end1[2]);

                    var timeDiff = srtDate.getTime() - enDate.getTime();

                    var diffDate = Math.ceil(timeDiff / (1000 * 3600 * 24));

                    if (diffDate <= 0) {
                        alert("Invalid Date Range!\nYou Can't Select The Previous Date/Today Date!")
                        $("#startDate").val("");
                        return false;
                    }
                }

                if (campaignStatus === 'Active')
                {
                    var startDate = document.getElementById("startDate").value;
                    var todayDate = document.getElementById("todayDate").value;

                    var start1 = startDate.split("-");
                    var end1 = todayDate.split("-");

                    var srtDate = new Date(start1[1] + '/' + start1[0] + '/' + start1[2]);
                    var enDate = new Date(end1[1] + '/' + end1[0] + '/' + end1[2]);

                    var timeDiff = srtDate.getTime() - enDate.getTime();

                    var diffDate = Math.ceil(timeDiff / (1000 * 3600 * 24));

                    if (diffDate < 0) {
                        alert("Invalid Date Range!\nYou Can't Select The Previous Date!")
                        $("#startDate").val("");
                        return false;
                    }
                }
                if (campaignStatus === 'Completed')
                {
                    var startDate = document.getElementById("startDate").value;
                    var todayDate = document.getElementById("todayDate").value;

                    var start1 = startDate.split("-");
                    var end1 = todayDate.split("-");

                    var srtDate = new Date(start1[1] + '/' + start1[0] + '/' + start1[2]);
                    var enDate = new Date(end1[1] + '/' + end1[0] + '/' + end1[2]);

                    var timeDiff = srtDate.getTime() - enDate.getTime();

                    var diffDate = Math.ceil(timeDiff / (1000 * 3600 * 24));

                    if (diffDate > 0) {
                        alert("Invalid Date Range!\nYou Can't Select The Future Date!")
                        $("#startDate").val("");
                        return false;
                    }
                }
                else {
                    return false;
                }

            }

            function checkavl(test)
            {

                if (test === 'Planned')
                {
                    $("#members").hide();
                    $("#startDate").val("");
                    $("#endDate").val("");
                    $("#response").val("");
                    document.getElementById("response").disabled = true;
                    return false;
                }
                if (test === 'Completed')
                {
                    $("#startDate").val("");
                    $("#endDate").val("");
                    $("#members").hide();
                    $("#members").toggle();
                    $("#response").val("");
                    document.getElementById("response").disabled = false;
                    return false;
                }

                if (test === 'Active')
                {
                    $("#startDate").val("");
                    $("#endDate").val("");
                    $("#members").hide();
                    $("#members").toggle();
                    $("#response").val("");
                    document.getElementById("response").disabled = false;
                    return false;
                }

                if (test === '')
                {
                    $("#members").hide();
                    $("#startDate").val("");
                    $("#endDate").val("");
                    $("#response").val("");
                    return false;
                }

                else
                {

                }

            }

            function chkcmpmedia(test)
            {

                if (test === 'Others')
                {
                    $("#othr").toggle();
                    return false;
                }

                else
                {
                    $("#othr").hide();
                    return false;
                }

            }

            function selectemployeedetails()
            {
                var division = document.getElementById("division").value;


                if (division === '')
                {
                    alert("Please Select Division");
                    return false;
                }
                else {

                    myWindow = window.open("../CRM/selectEventOrganizer.htm?division=" + division, "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                }

            }

            function firstToUpperCase() {

                var str = document.getElementById("campaignName").value;
                var a = str.charAt(0).toUpperCase() + str.substr(1);
                $("#campaignName").val(a);
            }
            function add1() {


                $("#attachTable").append(
                        "<tr>" +
                        "<td><img src='../common/images/cross.png' style='padding-left:12px' onclick='deleteRow(this.parentNode.parentNode.rowIndex)'></td>" +
                        "<td><input style='resize: none' type='file' id='attachmentName' name='attachmentName' value='' required='required' onchange='Validate(this);'/></td>" +
                        "</tr>");

            }
            function deleteRow(i) {

                document.getElementById('attachTable').deleteRow(i);

            }




            $(document).on('click', '#deleteRowcert', function () {

                var $itemRow = $(this).closest('tr');
                var discount = $itemRow.find('#leadSno').val();

                var s = $('#deleteRows').val();
                if (s == "") {
                    document.getElementById("deleteRows").value = discount;
                } else {
                    $('#deleteRows').val(s + '//' + discount);
                }

                deleteRowedu(this);
            });


            function deleteRowedu(row) {
                var rowCount = $('#resourcetable tr').length;

                if (rowCount > 1) {

                    $(row).parents('.item-members').remove();
                    return true;
                }
                else {
                    alert("You cannot delete this row");
                }
                return false;
            }



        </script>
    </head>


    <body class="nav-sm">

        <div class="container body">


            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->

                <div class="right_col" role="main">
                    <div class="">
                        <div class="clearfix"></div>
                        <div class="col-md-6 col-xs-12 form -inline">
                            <div class="x_panel">
                                <jsp:include page="../login/headerlink.htm?submodule=Campaign&tab=Closed Campaign&pagetype=form"/>
                                <div class="x_title">
                                    <h2>Campaign Details</h2>

                                    </li>

                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br/>

                                    <c:forEach items="${complaintFormData}" var="list">
                                        <c:if test="${list[0] eq 538}">
                                            <c:set value="${list[1]}" var="field_1"/>
                                            <c:set value="${list[2]}" var="fieldStatus_1"/>
                                            <c:set value="${list[3]}" var="mand_status_1"/>                                            
                                        </c:if>

                                        <c:if test="${list[0] eq 539}">
                                            <c:set value="${list[1]}" var="field_2"/>
                                            <c:set value="${list[2]}" var="fieldStatus_2"/>
                                            <c:set value="${list[3]}" var="mand_status_2"/>
                                        </c:if>

                                        <c:if test="${list[0] eq 540}">
                                            <c:set value="${list[1]}" var="field_3"/>
                                            <c:set value="${list[2]}" var="fieldStatus_3"/>
                                            <c:set value="${list[3]}" var="mand_status_3"/>
                                        </c:if>


                                        <c:if test="${list[0] eq 541}">
                                            <c:set value="${list[1]}" var="field_4"/>
                                            <c:set value="${list[2]}" var="fieldStatus_4"/>
                                            <c:set value="${list[3]}" var="mand_status_4"/>
                                        </c:if>


                                        <c:if test="${list[0] eq 542}">
                                            <c:set value="${list[1]}" var="field_5"/>
                                            <c:set value="${list[2]}" var="fieldStatus_5"/>
                                            <c:set value="${list[3]}" var="mand_status_5"/>
                                        </c:if>

                                        <c:if test="${list[0] eq 543}">
                                            <c:set value="${list[1]}" var="field_6"/>
                                            <c:set value="${list[2]}" var="fieldStatus_6"/>
                                            <c:set value="${list[3]}" var="mand_status_6"/>
                                        </c:if>

                                        <c:if test="${list[0] eq 544}">
                                            <c:set value="${list[1]}" var="field_7"/>
                                            <c:set value="${list[2]}" var="fieldStatus_7"/>
                                            <c:set value="${list[3]}" var="mand_status_7"/>
                                        </c:if>

                                        <c:if test="${list[0] eq 545}">
                                            <c:set value="${list[1]}" var="field_8"/>
                                            <c:set value="${list[2]}" var="fieldStatus_8"/>
                                            <c:set value="${list[3]}" var="mand_status_8"/>
                                        </c:if>

                                        <c:if test="${list[0] eq 548}">
                                            <c:set value="${list[1]}" var="field_9"/>
                                            <c:set value="${list[2]}" var="fieldStatus_9"/>
                                            <c:set value="${list[3]}" var="mand_status_9"/>
                                        </c:if>

                                        <c:if test="${list[0] eq 549}">
                                            <c:set value="${list[1]}" var="field_10"/>
                                            <c:set value="${list[2]}" var="fieldStatus_10"/>
                                            <c:set value="${list[3]}" var="mand_status_10"/>
                                        </c:if>

                                        <c:if test="${list[0] eq 550}">
                                            <c:set value="${list[1]}" var="field_11"/>
                                            <c:set value="${list[2]}" var="fieldStatus_11"/>
                                            <c:set value="${list[3]}" var="mand_status_11"/>
                                        </c:if>

                                        <c:if test="${list[0] eq 551}">
                                            <c:set value="${list[1]}" var="field_12"/>
                                            <c:set value="${list[2]}" var="fieldStatus_12"/>
                                            <c:set value="${list[3]}" var="mand_status_12"/>
                                        </c:if>

                                        <c:if test="${list[0] eq 552}">
                                            <c:set value="${list[1]}" var="field_13"/>
                                            <c:set value="${list[2]}" var="fieldStatus_13"/>
                                            <c:set value="${list[3]}" var="mand_status_13"/>
                                        </c:if>

                                        <c:if test="${list[0] eq 553}">
                                            <c:set value="${list[1]}" var="field_14"/>
                                            <c:set value="${list[2]}" var="fieldStatus_14"/>
                                            <c:set value="${list[3]}" var="mand_status_14"/>
                                        </c:if>

                                    </c:forEach>


                                    <c:if test="${fn:length(campaignList) > 0}">
                                        <c:set var="v" value="0"/>
                                        <c:forEach items="${campaignList}" var="type">
                                            <c:if test="${v eq 0}">
                                                <c:set var="campaignCode" value="${type.campaignCode}"/>
                                                <c:set var="campaignName" value="${type.campaignName}"/>
                                                <c:set var="campaignMedia" value="${type.campaignMedia}"/>
                                                <c:set var="campaignStatus" value="${type.campaignStatus}"/>
                                                <c:set var="campaignRemarks" value="${type.campaignRemarks}"/>
                                                <c:set var="eventOrganiser" value="${type.eventOrganiser}"/>
                                                <c:set var="startDate" value="${type.startDate}"/>
                                                <c:set var="endDate" value="${type.endDate}"/>
                                                <c:set var="response" value="${type.response}"/>

                                                <c:set var="expectedRevenue" value="${type.expectedRevenue}"/>
                                                <c:set var="actualRevenue" value="${type.actualRevenue}"/>
                                                <c:set var="budgetedCost" value="${type.budgetedCost}"/>
                                                <c:set var="actualCost" value="${type.actualCost}"/>
                                                <c:set var="roi" value="${type.roi}"/>
                                                <c:set var="budgeteRemaining" value="${type.budgeteRemaining}"/>
                                            </c:if>
                                            <c:set var="v" value="1"/>
                                        </c:forEach>
                                    </c:if>




                                    <form class="form-inline" id="CampaignForm" accept-charset="UTF-8" method="post" action="../CRM/CampaignFormSubmit.htm" enctype="multipart/form-data" >

                                        <c:if test="${fieldStatus_1 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_1 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_1}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(campaignList) > 0}">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input name="campaignName" id="campaignName" readonly="" ${mand_status_1} type="text" maxlength="30" class="form-control" value="${campaignName}" >
                                                                <input type="hidden" id="campaignCode"  name="campaignCode" readonly class="form-control" value="${campaignCode}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="campaignName"  name="campaignName" readonly class="form-control" value="${campaignName}">
                                                                <input type="hidden" id="campaignCode"  name="campaignCode" readonly class="form-control" value="${campaignCode}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input name="campaignName" id="campaignName"  maxlength="30" ${mand_status_1} type="text" class="form-control validate[required]" autocomplete="off" onkeyup="firstToUpperCase();" value=""> 
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                        </c:if>




                                        <c:if test="${fieldStatus_2 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_2 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_2}</label>

                                                <c:choose>
                                                    <c:when test="${fn:length(campaignList) > 0}">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="campaignMedia" name="campaignMedia" ${mand_status_2} class="form-control validate[required]"  readonly value="${campaignMedia}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="campaignMedia"  name="campaignMedia" readonly class="form-control" value="${campaignMedia}">
                                                            </c:otherwise> 
                                                        </c:choose>


                                                    </c:when>
                                                    <c:otherwise>
                                                        <select class="form-control validate[required]" id="campaignMedia" name="campaignMedia" value="" onchange="chkcmpmedia(this.value);">
                                                            <option value="" disabled selected>Select your option</option>

                                                            <c:forEach items="${mediaType}" var="type">
                                                                <option>${type}</option>
                                                            </c:forEach>
                                                        </select>

                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                        </c:if>



                                        <c:if test="${fieldStatus_3 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_3 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_3}</label>


                                                <c:choose>
                                                    <c:when test="${fn:length(campaignList) > 0}">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="campaignStatus" name="campaignStatus" ${mand_status_3} class="form-control validate[required]"  readonly value="${campaignStatus}">


                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="campaignStatus"  name="campaignStatus" readonly class="form-control" value="${campaignStatus}">
                                                            </c:otherwise> 
                                                        </c:choose>


                                                    </c:when>
                                                    <c:otherwise>
                                                        <select class="form-control validate[required]" id="campaignStatus" name="campaignStatus" value="" onchange="checkavl(this.value);">
                                                            <option value="" disabled selected>Select your option</option>
                                                            <option value="Planned">Planned</option>
                                                            <option value="Active">Active</option>
                                                            <option value="Completed">Completed</option>
                                                        </select>


                                                    </c:otherwise>        
                                                </c:choose>



                                            </div>
                                        </c:if>

                                        <p>&nbsp;</p>


                                        <c:if test="${fieldStatus_4 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_4 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_4}</label>

                                                <c:choose>
                                                    <c:when test="${fn:length(campaignList) > 0}">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <textarea class="form-control" rows="1" style="resize: none" maxlength="200" autocomplete="off" value="" readonly="" name="remarks" id="remarks" type="text">${campaignRemarks}</textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea class="form-control" rows="1" style="resize: none" maxlength="200" autocomplete="off" value="" readonly="" name="remarks" id="remarks" type="text">${campaignRemarks}</textarea>                                                                </c:otherwise> 
                                                        </c:choose>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <textarea class="form-control" rows="1" style="resize: none" maxlength="200" autocomplete="off" value="" name="remarks" id="remarks" type="text"></textarea>

                                                    </c:otherwise>        
                                                </c:choose>



                                            </div>
                                        </c:if>

                                        <p>&nbsp;</p> 
                                        <p>&nbsp;</p> 

                                        <div class="x_title">
                                            <h2>Campaign Planning</h2>

                                            <div class="clearfix"></div>
                                        </div>


                                        <p>&nbsp;</p>
                                        <div class="x_content">


                                            <c:if test="${fieldStatus_5 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_5 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_5}</label>

                                                    <c:choose>
                                                        <c:when test="${fn:length(campaignList) > 0}">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="startDate" name="startDate" readonly placeholder="Select Date" class="form-control validate[required]"  onmouseover="" style="cursor: pointer;" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${startDate}"/>" > 
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="startDate" name="startDate" readonly placeholder="Select Date" class="form-control validate[required]"  value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${startDate}"/>" >  
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" id="startDate" name="startDate" readonly placeholder="Select Date" class="form-control validate[required]"  onmouseover="" style="cursor: pointer;" onclick="javascript:NewCssCal('startDate', 'ddMMMyyyy')" >
                                                        </c:otherwise>        
                                                    </c:choose>



                                                </div>

                                            </c:if>

                                            <c:if test="${fieldStatus_6 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_6 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_6}</label>

                                                    <c:choose>
                                                        <c:when test="${fn:length(campaignList) > 0}">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="endDate" name="endDate" readonly placeholder="Select Date" class="form-control validate[required]"  onmouseover="" style="cursor: pointer;" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${endDate}"/>">

                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="endDate" name="endDate" readonly placeholder="Select Date" class="form-control validate[required]"   value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${endDate}"/>">                     
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" id="endDate" name="endDate" readonly placeholder="Select Date" class="form-control validate[required]"  onmouseover="" style="cursor: pointer;" onclick="javascript:NewCssCal('endDate', 'ddMMMyyyy')" >
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div>

                                            </c:if>


                                            <c:if test="${fieldStatus_7 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_7 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_7}</label>

                                                    <c:choose>
                                                        <c:when test="${fn:length(campaignList) > 0}">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="response" name="response" readonly class="form-control validate[required]"  value="${response}">                     
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="response" name="response" readonly class="form-control validate[required]"  value="${response}">                     
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <select class="form-control" id="response" name="response" value="" >
                                                                <option value="" disabled selected>Select your option</option>
                                                                <option value="Excellent">Excellent</option>
                                                                <option value="Good">Good</option>
                                                                <option value="Average">Average</option>
                                                                <option value="Bad">Bad</option>
                                                            </select>


                                                        </c:otherwise>        
                                                    </c:choose>



                                                </div>
                                            </c:if>


                                            <p>&nbsp;</p>


                                            <c:if test="${fieldStatus_8 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_8 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_8}</label>

                                                    <c:choose>
                                                        <c:when test="${fn:length(campaignList) > 0}">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="eventOwner" name="eventOwner" maxlength="60" autocomplete="off" class="form-control validate[required]" readonly="" value="${eventOrganiser}">

                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="eventOwner" name="eventOwner" readonly class="form-control validate[required]"  value="${eventOrganiser}">                     
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" id="eventOwner" name="eventOwner" maxlength="60" autocomplete="off" class="form-control validate[required]" >
                                                        </c:otherwise>        
                                                    </c:choose>
                                                </div>
                                            </c:if>

                                            <p>&nbsp;</p> 
                                            <p>&nbsp;</p> 



                                            <div id="members12" >
                                                <div class="x_panel">
                                                    <ul class="nav nav-tabs">
                                                        <li  class="active"><a>Members Attended</a></li>
                                                    </ul>

                                                    <div style="margin-top: 20px;overflow: scroll;height: auto;border: 1px solid gray;background:#f5f6f7;" >
                                                        <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                            <thead>
                                                                <tr>                                
                                                                    <th><i class="fa fa-trash fa-lg"></i></th>                                                
                                                                    <th>Company Name</th>
                                                                    <th>Company Type</th>
                                                                    <th>Company Details </th>
                                                                    <th>Email</th>
                                                                    <th>Phone No</th>
                                                                    <th>Remarks</th>

                                                                    <c:if test="${action eq 'edit'}">
                                                                        <th>Create Lead</th>
                                                                        </c:if>



                                                                </tr>
                                                            </thead>
                                                            <tbody id="resourcetable">


                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <c:forEach items="${campaignList}" var="type">
                                                                            <tr class="item-members">
                                                                                <!-- <td align="center" onclick=""><button type="button" id="deleteMembers"><i class="fa fa-trash fa-lg-o"></i></button></td>-->
                                                                                <td align="center" onclick=""><button type="button" id="deleteRowcert"><i class="fa fa-trash fa-lg-o"><input type="hidden" id="leadSno"  name="leadSno" value="${type.sno}"/></i></button></td>

                                                                                <td><input class="form-control" maxlength="120" autocomplete="off" name="enquirerCompany" id="enquirerCompany" type="text"  value="${type.companyName}">
                                                                                    <input type="hidden" name="SNO" value="${type.sno}">
                                                                                    <input type="hidden" name="status" value="${type.status}">
                                                                                    <input type="hidden" name="recordStatus" value="${type.recordStatus}">
                                                                                    <input type="hidden" id="deleteRows" name="deleteRows" value="">
                                                                                </td>
                                                                                <td>
                                                                                    <select class="form-control" id="enquirerIndustry" name="enquirerIndustry" >
                                                                                        <option value="${type.companyType}" selected>${type.companyType}</option>
                                                                                        <option value="Construction">Construction</option>
                                                                                        <option value="Hospital">Hospital</option>
                                                                                        <option value="Hotels">Hotels</option>
                                                                                        <option value="Oil and Gas">Oil and Gas</option>
                                                                                        <option value="Camps">Camps</option>
                                                                                        <option value="Airways">Airways</option>
                                                                                        <option value="Others">Others</option>
                                                                                    </select>
                                                                                </td>   
                                                                                <td><input class="form-control"  autocomplete="off"  name="companyDetails" id="companyDetails" type="text"  maxlength="200" value="${type.companyDetails}"></td>
                                                                                <td><input class="form-control"  autocomplete="off"  name="email" id="email" type="email"  maxlength="100" value="${type.emailId}" ></td>
                                                                                <td><input class="form-control" style="text-align: right;"   autocomplete="off" maxlength="12" min="8"  name="phone" id="phone" onkeypress="return check_digit(event, this, 11, 3);" onchange="mobileNoValidation(this);" type="text" value="${type.phoneNo}"></td> 
                                                                                <td><input class="form-control" autocomplete="off"  name="comremarks" id="comremarks" type="test" maxlength="50" value="${type.remarks}"></td>

                                                                                <c:if test="${action eq 'edit'}">
                                                                                    <td>
                                                                                        <c:choose>
                                                                                            <c:when test="${type.recordStatus eq 'Lead Created'}">
                                                                                                <a class="fa fa-pencil fa-lg" href="#" title="Lead Created"></a>

                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                <a class="fa fa-pencil fa-lg" href="../CRM/LeadManagementFormNew1.htm?sNo=${type.sno}" title="Create Lead"> </a>
                                                                                            </c:otherwise>
                                                                                        </c:choose>

                                                                                    </td>
                                                                                </c:if>

                                                                            </tr>
                                                                        </c:forEach>

                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <c:forEach items="${campaignList}" var="type">
                                                                            <tr class="item-members">
                                                                                <td align="center" onclick=""><button type="button" id="deleteMembers1"><i class="fa fa-trash fa-lg-o"></i></button></td>

                                                                                <td><input class="form-control" readonly="" maxlength="120" autocomplete="off" name="enquirerCompany" id="enquirerCompany" type="text"  value="${type.companyName}">
                                                                                </td>
                                                                                <td>
                                                                                    <input class="form-control" readonly="" id="enquirerIndustry" name="enquirerIndustry" value="${type.companyType}">

                                                                                </td>   
                                                                                <td><input class="form-control" readonly="" autocomplete="off"  name="companyDetails" id="companyDetails" type="text"  maxlength="200" value="${type.companyDetails}"></td>
                                                                                <td><input class="form-control" readonly="" autocomplete="off"  name="email" id="email" type="email"  maxlength="100" value="${type.emailId}" ></td>
                                                                                <td><input class="form-control" style="text-align: right;" readonly=""  autocomplete="off" maxlength="12" min="8"  name="phone" id="phone" onkeypress="return check_digit(event, this, 11, 3);" onchange="mobileNoValidation(this);" type="text" value="${type.phoneNo}"></td> 
                                                                                <td><input class="form-control" readonly="" autocomplete="off"  name="comremarks" id="comremarks" type="test" maxlength="50" value="${type.remarks}"></td>

                                                                            </tr>
                                                                        </c:forEach>

                                                                    </c:otherwise>
                                                                </c:choose>



                                                            </tbody>

                                                        </table>
                                                        <c:if test="${action eq 'edit'}">
                                                            <div style="margin-top: 10px;">
                                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                                        <a  id="addMembers" class="btn btn-dark" tabindex=""><i class="glyphicon glyphicon-plus"></i> Add </a>

                                                                    </div>
                                                                </div>
                                                            </div>                                        
                                                        </c:if>

                                                    </div>



                                                </div>
                                            </div>









                                        </div>
                                        <p>&nbsp;</p> 



                                        <div class="x_title">
                                            <h2>Financial</h2>

                                            <div class="clearfix"></div>
                                        </div>


                                        <p>&nbsp;</p>


                                        <c:if test="${fieldStatus_9 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_9 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_9}</label>

                                                <c:choose>
                                                    <c:when test="${fn:length(campaignList) > 0}">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" style="text-align: right" id="expectedRevenue" name="expectedRevenue" readonly="" autocomplete="off" class="form-control" maxlength="10" value="${expectedRevenue}" >

                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" style="text-align: right" id="expectedRevenue" name="expectedRevenue" readonly="" autocomplete="off" class="form-control" maxlength="10" value="${expectedRevenue}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" id="expectedRevenue" name="expectedRevenue" autocomplete="off" class="form-control" maxlength="10" onkeypress="return isNumberKey(event)" value="0" onkeyup="calculation();">

                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>

                                        </c:if>

                                        <c:if test="${fieldStatus_10 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_10 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_10}</label>

                                                <c:choose>
                                                    <c:when test="${fn:length(campaignList) > 0}">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" style="text-align: right" id="actualRevenue" name="actualRevenue" autocomplete="off" class="form-control" maxlength="10" readonly="" value="${actualRevenue}" >

                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" style="text-align: right" id="actualRevenue" name="actualRevenue" autocomplete="off" class="form-control" maxlength="10" readonly="" value="${actualRevenue}" >
                                                            </c:otherwise> 
                                                        </c:choose>


                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" id="actualRevenue" name="actualRevenue" autocomplete="off" class="form-control" maxlength="10"  onkeypress="return isNumberKey(event)" value="0" >

                                                    </c:otherwise>        
                                                </c:choose>


                                            </div>

                                        </c:if>

                                        <c:if test="${fieldStatus_11 eq 'y'}">


                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_11 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_11}</label>

                                                <c:choose>
                                                    <c:when test="${fn:length(campaignList) > 0}">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" style="text-align: right" id="budgetedCost" name="budgetedCost" readonly="" autocomplete="off" class="form-control" maxlength="10" value="${budgetedCost}">

                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" style="text-align: right" id="budgetedCost" name="budgetedCost" readonly="" autocomplete="off" class="form-control" maxlength="10" value="${budgetedCost}">
                                                            </c:otherwise> 
                                                        </c:choose>


                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" id="budgetedCost" name="budgetedCost" autocomplete="off" class="form-control" maxlength="10" onkeypress="return isNumberKey(event)" value="0" onkeyup="calculation();">

                                                    </c:otherwise>        
                                                </c:choose>


                                            </div>
                                        </c:if>



                                        <p>&nbsp;</p>


                                        <c:if test="${fieldStatus_12 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_12 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_12}</label>

                                                <c:choose>
                                                    <c:when test="${fn:length(campaignList) > 0}">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" style="text-align: right" id="actualCost" name="actualCost" autocomplete="off" class="form-control" maxlength="10" readonly="" onkeypress="return isNumberKey(event)" value="${actualCost}" >
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" style="text-align: right" id="actualCost" name="actualCost" autocomplete="off" class="form-control" maxlength="10" readonly="" onkeypress="return isNumberKey(event)" value="${actualCost}" >
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" id="actualCost" name="actualCost" autocomplete="off" class="form-control" maxlength="10"  onkeypress="return isNumberKey(event)" value="0" >
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>


                                        <c:if test="${fieldStatus_13 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_13 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_13}</label>

                                                <c:choose>
                                                    <c:when test="${fn:length(campaignList) > 0}">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" style="text-align: right" id="roi" readonly="" name="roi" autocomplete="off" class="form-control" maxlength="10" onkeypress="return isNumberKey(event)" value="${roi}">%
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" style="text-align: right" id="roi" readonly="" name="roi" autocomplete="off" class="form-control" maxlength="10" onkeypress="return isNumberKey(event)" value="${roi}">%
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" id="roi"  name="roi" autocomplete="off" class="form-control" maxlength="10" onkeypress="return isNumberKey(event)" value="0">%

                                                    </c:otherwise>        
                                                </c:choose>


                                            </div>
                                        </c:if>


                                        <c:if test="${fieldStatus_14 eq 'y'}">

                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_14 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_14}</label>

                                                <c:choose>
                                                    <c:when test="${fn:length(campaignList) > 0}">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" style="text-align: right" id="budgetRemain" name="budgetRemain" autocomplete="off" readonly="" class="form-control" maxlength="10" onkeypress="return isNumberKey(event)" value="${budgeteRemaining}">

                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" style="text-align: right" id="budgetRemain" name="budgetRemain" autocomplete="off" readonly="" class="form-control" maxlength="10" onkeypress="return isNumberKey(event)" value="${budgeteRemaining}">
                                                            </c:otherwise> 
                                                        </c:choose>


                                                    </c:when>
                                                    <c:otherwise>

                                                    </c:otherwise>        
                                                </c:choose>


                                            </div>
                                        </c:if>

                                        <p>&nbsp;</p>

                                        <p>&nbsp;</p>
                                        <div class="col-md-12 col-sm-12">                                 
                                                <label class="control-label" ><span style="color:transparent"></span>Attachment(s)</label>
                                                <input type="hidden" name="count" value="1" />
                                            
                                                <c:forEach items="${attachment}" var="list">
                                                                    <div>
                                                                        <div id="field" class="col-md-12 col-sm-12">

                                                                            <a href="../CRM/crmAttachDownload.htm?SNo=${list.sno}"  >
                                                                                <input type="text" id="imgtxt" name="imgtxt" readonly="" class="form-control capitalize " value="${list.fileName}" > 
                                                                            </a><br><br/>
                                                                        </div>
                                                                    </div>
                                                                </c:forEach>     
                                            
                                        </div>

                                        <p>&nbsp;</p>
                                        <div class="clearfix"></div>
                                </div> 


                                <p>&nbsp;</p>

                                <c:if test="${action ne 'view'}">
                                    <div class="form-actions" >
                                        <!--<div class="col-md-4 col-sm-12 col-xs-12 form-group">-->
                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                            <button type="submit" class="btn btn-primary"> Save </button>
                                            <a href="../CRM/campaignList.htm"  class="btn btn-danger">Cancel</a>
                                            <!--</div>-->
                                        </div>
                                    </div>
                                </c:if>

                                </form>

                            </div>
                        </div>
                    </div>



                    <br/>


                    <div class="clearfix"></div>

                    <div class="clearfix"></div>                

                    <!-- /page content -->

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
            $(document).ready(function () {
                $("#CampaignForm").validationEngine();
                $("#othr").toggle();
                $("#members").toggle();
                $("#SponsorBtn").toggle();
                $(document).on('keyup', '#enquirerCompany', function () {
                    this.value = this.value.toUpperCase();
                });
                $('#phone').bind("cut copy paste", function (e) {
                    e.preventDefault();
                });
                $('#expectedRevenue').bind("cut copy paste", function (e) {
                    e.preventDefault();
                });
                $('#actualRevenue').bind("cut copy paste", function (e) {
                    e.preventDefault();
                });
                $('#budgetedCost').bind("cut copy paste", function (e) {
                    e.preventDefault();
                });
                $('#actualCost').bind("cut copy paste", function (e) {
                    e.preventDefault();
                });
                $('#roi').bind("cut copy paste", function (e) {
                    e.preventDefault();
                });
                $('#budgetRemain').bind("cut copy paste", function (e) {
                    e.preventDefault();
                });
                $("#addSponsorButton").click(function () {
                    sponsorShow();
                });

                $("#removeSponsor").click(function () {
                    sponsorHide();
                });
            });

            function uniqueCompany(com) {
                var $itemRow = $(com).closest('tr');
                var companyName = $itemRow.find("#enquirerCompany").val();
                $.ajax({
                    type: "POST",
                    url: '../Lead/getCompanyName.htm',
                    data: {
                        company: companyName,
                    },
                    success: function (data) {
                        if ($.trim(data) == 'Already Exists.') {
                            alert("Company Is  Already Exist");
//                            document.getElementById("enquirerCompany").value = "";
                            $(com).val("");
                            return false;
                        }
                    }
                });
            }

            function sponsorShow() {
                $("#s_butt_id").hide();
                $("#SponsorBtn").show();

            }
            function sponsorHide() {
                $("#SponsorBtn").hide();
                $("#s_butt_id").show();

            }

            function selectsponsordates($this) {
                var $itemRow = $($this).closest('tr');
                var row_index = $($this).closest("tr")[0].rowIndex;
                $this.id = 'sponsoredDate' + row_index;
                NewCssCal('sponsoredDate' + row_index, 'ddMMMyyyy', '', '', '', '', '');
            }

            NProgress.done();



        </script>
        <script src="crmScript.js" type="text/javascript"></script>
        <script src="../sales/salesScript/salesScript.js" type="text/javascript"></script>       
        <script src="scripts/general-sales_scripts.js" type="text/javascript"></script>
        <script src="scripts/mioinvoice-menu-scripts.js" type="text/javascript"></script>
        <script src="scripts/mioinvoice-sales-scripts.js" type="text/javascript"></script>
        <script src="general-crm_scripts.js" type="text/javascript"></script>
        <script src="mioinvoice-crm-scripts.js" type="text/javascript"></script>
    </body>

</html>
