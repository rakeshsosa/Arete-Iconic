<%-- 
    Document   : CampaignForm
    Created on : 29 Feb, 2016, 2:37:38 PM
    Author     : ebs-sdd05
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
            $(document).ready(function () {
                var compName = document.getElementById("enquirerCompany").value;
                if (document.getElementById("enquirerCompany").value == null || document.getElementById("enquirerCompany").value == "")
                {
                    $('#createLead').hide();
                }

                var sno1 = document.getElementById("sno1").value;
                var phone = $('#phone' + sno1).val();
                if (phone == null || phone == '') {
                    $('#createLead').hide();
                }


                var code = {};
                $("select[name='campaignMedia'] > option").each(function () {
                    if (code[this.text]) {
                        $(this).remove();
                    } else {
                        code[this.text] = this.value;
                    }
                });

                $("select[name='campaignStatus'] > option").each(function () {
                    if (code[this.text]) {
                        $(this).remove();
                    } else {
                        code[this.text] = this.value;
                    }
                });

            });

            function checkMand($this, sno)
            {
                var $itemRow = $($this).closest('tr');
                var phone = $('#phone' + sno).val();

                if (phone == null || phone == '') {
                    alert("Please Enter Mobile No..!!");
                    return  false;
                } else {
                    window.location.href = "../CRM/LeadManagementFormNew1.htm?sNo=" + sno + "";

                }

            }

//            function leadStatus(){
//                if (document.getElementById("enquirerCompany").value == null || document.getElementById("enquirerCompany").value == "")
//                {
//                    $('#createLead').hide();
//                }else{
//                $('#createLead').show();
//            }
//            }
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
                var index = $(com).closest("tr").index();

                var phoneNo = $itemRow.find("#phone").val();
                var mob = phoneNo.length;
                if (mob < 8) {
                    alert("Enter Valid Mobile No.");
                    $itemRow.find("#phone").val('');
                    return false;
                } else {

                    $.ajax({
                        type: "POST",
                        url: "../CRM/mobileCheck.htm",
                        data: {phoneNo: phoneNo},
                        success: function (data) {
                            // alert(data);
                            if (data == 'DATA AVAILABLE')
                            {
                                alert("Mobile Number is already Exit");
                                $itemRow.find("#phone").val('');
                            } else {
                                var table = document.getElementById("membertable");

                                $('#membertable tr').each(function () {

                                    var index1 = $(this).closest("tr").index();

                                    if (index != index1)
                                    {
                                        var a = $(this).find('#phone').val();
                                        if (a == phoneNo) {
                                            alert('Mobile No Is Already Added');
                                            $itemRow.find("#phone").val('');
                                            return false;
                                        } else {
                                            return true;
                                        }
                                    }


                                })
                            }

                        },
                        error: function (error) {
                            alert(error);
                        }

                    });


                }
            }

            function  emailValidate(com)
            {

                var $itemRow = $(com).closest('tr');
                var index = $(com).closest("tr").index();
                var emailId = $itemRow.find("#email").val();



                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

                if (!emailId.match(mailformat))
                {
                    alert("You have entered an invalid email address!");
                    $itemRow.find("#email").val('');
                    return false;
                }

                else {

                    $.ajax({
                        type: "POST",
                        url: "../CRM/emailCheck.htm",
                        data: {emailId: emailId},
                        success: function (data) {
                            // alert(data);
                            if (data == 'DATA AVAILABLE')
                            {
                                alert("emailId is already Exit");
                                $itemRow.find("#email").val('');
                            } else {
                                var table = document.getElementById("membertable");

                                $('#membertable tr').each(function () {

                                    var index1 = $(this).closest("tr").index();

                                    if (index != index1)
                                    {
                                        var a = $(this).find('#email').val();
                                        if (a == emailId) {
                                            alert('emailId Is Already Added');
                                            $itemRow.find("#email").val('');
                                            return false;
                                        } else {
                                            return true;
                                        }
                                    }


                                })
                            }

                        },
                        error: function (error) {
                            alert(error);
                        }

                    });


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

            function selectCampaignDetails()
            {
                myWindow = window.open("../CRM/selectCampaignDetails.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }

        </script>
        <script>
            function validDropdown($this) {
                //alert("hi");
                $("select[id=" + $this + "+enquirerIndustry'] > option").each(function () {
                    if (code[this.text]) {
                        $(this).remove();
                    } else {
                        code[this.text] = this.value;
                    }
                });
            }

            function test()
            {
                var cmedia = document.getElementById("campaignMedia").value;
                var cmedia1 = document.getElementById("campaignMedia1").value;
                var cstatus = document.getElementById("campaignStatus").value;
                var cstatus1 = document.getElementById("campaignStatus1").value;
                var remark = document.getElementById("remarks").value;
                var remark1 = document.getElementById("remarks1").value;
                var res = document.getElementById("response").value;
                var res1 = document.getElementById("response1").value;
                var eowner = document.getElementById("eventOwner").value;
                var eowner1 = document.getElementById("eventOwner1").value;
                var ecom = document.getElementById("enquirerCompany").value;
                var ecom1 = document.getElementById("enquirerCompany1").value;
                var eins = document.getElementById("enquirerIndustry").value;
                var eins1 = document.getElementById("enquirerIndustry1").value;
                var cdet = document.getElementById("companyDetails").value;
                var cdet1 = document.getElementById("companyDetails1").value;
                var emailid = document.getElementById("email").value;
                var emailid1 = document.getElementById("email1").value;
                var pno = document.getElementById("phone12").value;
                var pno1 = document.getElementById("phone13").value;
                var cremarks = document.getElementById("comremarks").value;
                var cremarks1 = document.getElementById("comremarks1").value;
                if (document.getElementById("campaignMedia").value == "")
                {
                    alert("Select Campaign Media");
                    return false;
                } else if (document.getElementById("campaignStatus").value == "")
                {
                    alert("Select Campaign Status");
                    return false;
                } else if (document.getElementById("eventOwner").value == "")
                {
                    alert("Enter Event Organizer");
                    return false;
                }
                else {

                    if (cmedia !== cmedia1 || cstatus !== cstatus1 || remark !== remark1
                            || res !== res1 || eowner !== eowner1
                            || ecom !== ecom1 || eins !== eins1
                            || cdet !== cdet1 || emailid !== emailid1
                            || pno !== pno1 || cremarks !== cremarks1) {
                        if (confirm('Do you really want to Save this updated record')) {
                            document.forms["CampaignForm"].submit();
                            return true;
                        } else {
                            return true;
                        }

                    } else {

                        document.forms["CampaignForm"].submit();
                    }
                }

            }

//            function test()
//            {
//
//                if (confirm('Do you really want to Save this updated record')) {
//                    document.forms["CampaignForm"].submit();
//                    return true;
//                } else {
//                    return false;
//                }
//
//
//
//            }
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
                                <jsp:include page="../login/headerlink.htm?submodule=Campaign&tab=Campaign&pagetype=form"/>
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
                                                <c:set var="sno" value="${type.sno}"/>
                                            </c:if>
                                            <c:set var="v" value="1"/>
                                        </c:forEach>                                        
                                    </c:if>

                                    <form class="form-inline" id="CampaignForm" accept-charset="UTF-8" method="post" action="../CRM/CampaignFormSubmit.htm" enctype="multipart/form-data" >
                                        <c:choose>
                                            <c:when test="${fn:length(campaignList) > 0}">
                                                <c:forEach items="${campaignList}" var="list">
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
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                        </c:choose>

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
                                                                <input type="hidden" name="pk" value="${sno}">

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
                                                                <select class="form-control" id="campaignMedia" ${mand_status_2} name="campaignMedia" value="${campaignMedia}">
                                                                    <option>${campaignMedia}</option> 
                                                                    <c:forEach items="${complaintFormData_dropDown_category}" var="list">
                                                                        <c:if test="${list[0] eq 'F-23'}">
                                                                            <option>${list[1]}</option>                                     
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </select>
                                                                <input type="hidden" class="form-control" ${mand_status_2}  name="campaignMedia1" id="campaignMedia1" value="${campaignMedia}" >

<!--                                                                    <input type="text" id="campaignMedia" name="campaignMedia" ${mand_status_2} class="form-control validate[required]"  readonly value="${campaignMedia}">-->
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
                                                                <!--<input type="text" id="campaignStatus" name="campaignStatus" ${mand_status_3} class="form-control validate[required]"  readonly value="${campaignStatus}">-->
                                                                <select class="form-control" id="campaignStatus" ${mand_status_3} name="campaignStatus" value="${campaignStatus}">
                                                                    <option>${campaignStatus}</option>
                                                                    <c:forEach items="${complaintFormData_dropDown_category}" var="list">
                                                                        <c:if test="${list[0] eq 'F-17'}">
                                                                            <option>${list[1]}</option>                                     
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </select>
                                                                <input type="hidden" class="form-control" ${mand_status_3}  name="campaignStatus1" id="campaignStatus1" value="${campaignStatus}" >

                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="campaignStatus"  name="campaignStatus" readonly class="form-control" value="${campaignStatus}">
                                                            </c:otherwise> 
                                                        </c:choose>


                                                    </c:when>
                                                    <c:otherwise>
                                                        <select class="form-control validate[required]" id="campaignStatus" name="campaignStatus" value="" onchange="checkavl(this.value);">
                                                            <c:forEach items="${complaintFormData_dropDown_category}" var="list">
                                                                <c:if test="${list[0] eq 'F-17'}">
                                                                    <option>${list[1]}</option>                                     
                                                                </c:if>
                                                            </c:forEach>
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
                                                                <textarea class="form-control" rows="1" style="resize: none" maxlength="200" autocomplete="off" value=""  name="remarks" id="remarks" type="text">${campaignRemarks}</textarea>
                                                                <input id="remarks1" class="form-control"  rows="1" maxlength="300" style="resize: none" type="hidden" value="${campaignRemarks}">

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
                                                                    <input type="text" id="startDate" name="startDate" readonly placeholder="Select Date" class="form-control validate[required]"  value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${startDate}"/>">                                                                </c:otherwise> 

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
                                                                    <input type="text" id="endDate" name="endDate" readonly placeholder="Select Date" class="form-control validate[required]"  value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${endDate}"/>">                     
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
                                                                    <!--<input type="text" id="response" name="response" readonly class="form-control"  value="${response}">-->                     

                                                                    <select class="form-control" id="response" ${mand_status_7} name="response" value="${response}">
                                                                        <c:forEach items="${complaintFormData_dropDown_category}" var="list">
                                                                            <c:if test="${list[0] eq 'F-18'}">
                                                                                <option>${list[1]}</option>                                     
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </select>
                                                                    <input type="hidden" class="form-control" ${mand_status_7}  name="response1" id="response1" value="${response}" >

                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="response" name="response" readonly class="form-control validate[required]"  value="${response}">                     
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <select class="form-control" id="response" ${mand_status_7}name="response" value="" >
                                                                <option value="" disabled selected>Select your option</option>
                                                                <c:forEach items="${complaintFormData_dropDown_category}" var="list">
                                                                    <c:if test="${list[0] eq 'F-18'}">
                                                                        <option>${list[1]}</option>                                     
                                                                    </c:if>
                                                                </c:forEach>
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
                                                                    <input type="text" id="eventOwner" name="eventOwner" maxlength="60" autocomplete="off" class="form-control validate[required]" value="${eventOrganiser}">
                                                                    <input type="hidden" id="eventOwner1" name="eventOwner1" maxlength="60" autocomplete="off" value="${eventOrganiser}">

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
                                                                    <th class="center"><i class="fa fa-trash fa-lg"></i></th>                                                
                                                                    <th class="center">Company Name</th>
                                                                    <th class="center">Company Type</th>
                                                                    <th class="center">Company Details </th>
                                                                    <th class="center">Email</th>
                                                                    <th class="center">Phone No</th>
                                                                    <th class="center">Remarks</th>

                                                                    <c:if test="${action eq 'edit'}">
                                                                        <th class="center">Create Lead</th>

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
                                                                                    <input class="form-control" id="enquirerCompany1" type="hidden" value="${type.companyName}">
                                                                                    <input type="hidden" name="SNO" value="${type.sno}">
                                                                                    <input type="hidden" name="status" value="${type.status}">
                                                                                    <input type="hidden" name="recordStatus" value="${type.recordStatus}">
                                                                                    <input type="hidden" id="deleteRows" name="deleteRows" value="">
                                                                                </td>
                                                                                <td>
                                                                                    <select class="form-control" id="enquirerIndustry" name="enquirerIndustry" onclick="return validDropdown(this);">
                                                                                        <option value="${type.companyType}" selected="">${type.companyType}</option>
                                                                                        <option value="Construction">Construction</option>
                                                                                        <option value="Hospital">Hospital</option>
                                                                                        <option value="Hotels">Hotels</option>
                                                                                        <option value="Oil and Gas">Oil and Gas</option>
                                                                                        <option value="Camps">Camps</option>
                                                                                        <option value="Airways">Airways</option>
                                                                                        <option value="Others">Others</option>
                                                                                    </select>
                                                                                    <input type="hidden" id="enquirerIndustry1" value="${type.companyType}">

                                                                                </td>   
                                                                                <td><input class="form-control"  autocomplete="off"  name="companyDetails" id="companyDetails" type="text"  maxlength="200" value="${type.companyDetails}">
                                                                                    <input class="form-control" id="companyDetails1" type="hidden" value="${type.companyDetails}">
                                                                                </td>
                                                                                <td><input class="form-control"  autocomplete="off"  name="email" id="email" type="email"  maxlength="100" value="${type.emailId}" onchange="emailValidate(this);">
                                                                                    <input class="form-control"  autocomplete="off"  name="email1" id="email1" type="hidden"  maxlength="100" value="${type.emailId}">
                                                                                    <input type="hidden" id="sno1" value="${type.sno}"></td>
                                                                                <td><input class="form-control" style="text-align: right;"  autocomplete="off" maxlength="12" min="8" id="phone12"  name="phone" id="phone${type.sno}" onkeypress="return check_digit(event, this, 11, 3);" onchange="mobileNoValidation(this);" type="text" value="${type.phoneNo}">
                                                                                    <input class="form-control" style="text-align: right;"  autocomplete="off" id="phone13" type="hidden" value="${type.phoneNo}">

                                                                                </td> 
                                                                                <td><input class="form-control" autocomplete="off"  name="comremarks" id="comremarks" type="test" maxlength="50" value="${type.remarks}">
                                                                                    <input class="form-control" autocomplete="off"  name="comremarks1" id="comremarks1" type="hidden" maxlength="50" value="${type.remarks}">
                                                                                </td>

                                                                                <c:if test="${action eq 'edit'}">
                                                                                    <td>
                                                                                        <c:choose>
                                                                                            <c:when test="${type.recordStatus eq 'Lead Created'}">
                                                                                                <a class="fa fa-pencil fa-lg" href="#"><i class="fa fa-pencil fa-lg-square-o"> Lead Created</i> </a>

                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                <button type="button" id="createLead" style="" onclick="checkMand(this, '${type.sno}');"><i class="fa fa-pencil fa-lg-square-o"> Create Lead </i></button>
<!--                                                                                                <a class="fa fa-pencil fa-lg" id="createLead" href="../CRM/LeadManagementFormNew1.htm?sNo=${type.sno}"><i class="fa fa-pencil fa-lg-square-o"> Create Lead </i> </a>-->
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
                                                <c:choose>
                                                    <c:when test="${fn:length(campaignList) > 0}">
                                                        <c:forEach items="${campaignList}" var="list">

                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">   
                                                                    <c:set var="i" value="1"/> 
                                                                    <c:forEach items="${attachment}" var="list1">


                                                                        <div class="removeattach" id="del${i}">
                                                                            <div id="field" class="col-md-12 col-sm-12">
                                                                                <button type="button" style="display: inline!important;" id="r1${i}" class="btn btn-danger r1">-</button>
                                                                                <a href="../CRM/crmAttachDownload.htm?SNo=${list1.sno}"  >
                                                                                    <input type="text" id="imgtxt" name="imgtxt" readonly="" class="form-control capitalize" value="${list1.fileName}" > <span> </span>
                                                                                </a>                                                                        
                                                                                <input type="hidden" id="attsno${i}" name="attsno" value="${list1.sno}">
                                                                            </div>
                                                                        </div>

                                                                    </c:forEach>
                                                                    <c:set var="i" value="${i+1}"/>
                                                                    <input type="hidden" id="tobedel" name="tobedel" value="">
                                                                    <input type="hidden" name="count" value="1" />
                                                                    <div >
                                                                        <div id="adiv1"  class="col-md-4 col-sm-12 ">
                                                                            <button type="button" style="display: inline!important;opacity: 0.65;cursor: not-allowed;" id="1remove" class="btn btn-danger remove-me1">-</button>
                                                                            <input style="display: inline!important;" class="form-control" type="text" id="attachname1" name="documentname"  class="form-control" maxlength="20" value="" placeholder="Attachment Name" >
                                                                            <!--<input style="display: inline!important;" id="field1" name="attachments" type="file" value="" onchange="readURL1(this);">-->
                                                                            <input style="display: none;" id="field1" class="filecls" name="attachments" type="file"  value="" onchange="readURL1(this);
                                                                                setAttachName(1);"> 
                                                                            <input type="button" id="btnb1" class="btn btn-primary" value="Browse..." onclick="browseFile(1);" />
                                                                            <!--<span id="error7" style="color: red; font: bold; display: none; text-align: right;margin-left: 160px;">Please enter Atleast One Attachment....</span>-->

                                                                        </div>
                                                                        <button style="display: inline!important;color: white;font-weight: bold;" id="b1" class="btn add-more" type="button">+</button>
                                                                        <span class="nowrap">(Click press + to add another attachment)</span>
                                                                    </div> 


                                                                </c:when>
                                                                <c:otherwise>
                                                                    <c:forEach items="${attachment}" var="list">
                                                                        <div>
                                                                            <div id="field" class="col-md-12 col-sm-12">

                                                                                <a href="../CRM/crmAttachDownload.htm?SNo=${list.sno}"  >
                                                                                    <input type="text" id="imgtxt" name="imgtxt" readonly="" class="form-control capitalize " value="${list.fileName}" > 
                                                                                </a><br><br/>
                                                                            </div>
                                                                        </div>
                                                                    </c:forEach>

                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise> 
                                                        <div >
                                                            <div id="adiv1"  class="col-md-4 col-sm-12 ">
                                                                <button type="button" style="display: inline!important;opacity: 0.65;cursor: not-allowed;" id="1remove" class="btn btn-danger remove-me1">-</button>
                                                                <input style="display: inline!important;" class="form-control" type="text" id="attachname1" name="documentname"  class="form-control" maxlength="20" value="" placeholder="Attachment Name" >
                                                                <!--<input style="display: inline!important;" id="field1" name="attachments" type="file" value="" onchange="readURL1(this);">-->
                                                                <input style="display: none;" id="field1" class="filecls" name="attachments" type="file"  value="" onchange="readURL1(this);
                                                                    setAttachName(1);"> 
                                                                <input type="button" id="btnb1" class="btn btn-primary" value="Browse..." onclick="browseFile(1);" />
                                                                <!--<span id="error7" style="color: red; font: bold; display: none; text-align: right;margin-left: 160px;">Please enter Atleast One Attachment....</span>-->

                                                            </div>
                                                            <button style="display: inline!important;color: white;font-weight: bold;" id="b1" class="btn add-more" type="button">+</button>
                                                            <span class="nowrap">(Click press + to add another attachment)</span>
                                                        </div>                                                
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>

                                            <p>&nbsp;</p>
                                            <div class="clearfix"></div>
                                        </div> 


                                        <p>&nbsp;</p>

                                        <c:if test="${action ne 'view'}">
                                            <div class="form-actions" >
                                                <!--<div class="col-md-4 col-sm-12 col-xs-12 form-group">-->
                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                    <button type="button" class="btn btn-primary" style="" onclick="return test();">Save</button>

                                                    <!--                                                    <button type="submit" class="btn btn-primary"> Save </button>-->
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
                function readURL1(input) {
                    $('#blah1').show();
                    var imageId = input.id;
                    checkImageSize1(input, imageId);
                    if (input.files && input.files[0]) {
                        var reader = new FileReader();

                        reader.onload = function (e) {
                            $('#blah1')
                                    .attr('src', e.target.result)
                                    .width(120)
                                    .height(120);
                        };

                        reader.readAsDataURL(input.files[0]);
                    }
                }


                function checkImageSize1(obj, id1)
                {
                    var size = ($("#" + id1)[0].files[0].size) / (200 * 230);
                    if (parseFloat(size) > 45)
                    {
                        alert("Exceeding File Size");
                        $("#" + id1).val("");
                    } else {
                        Validate(obj, id1);
                    }
                }

                function Validate(obj, id1)
                {
                    var image = document.getElementById(id1).value;
                    if (image != '') {
                        var checkimg = image.toLowerCase();
                        if (!checkimg.match(/(\.jpg|\.png|\.JPG|\.PNG|\.jpeg|\.JPEG)$/)) {
                            alert("Please enter Image File Extensions .jpg,.png,.jpeg");
                            $("#" + id1).focus();
                            $("#" + id1).val("");
                            return false;
                        }
                    }
                    return true;
                }

                function browseFile(slno) {
                    document.getElementById('field' + slno).click();
                }
                function setAttachName(slno) {
                    var filenm = document.getElementById('field' + slno).value;
                    var filenmArr = filenm.split(".");
                    document.getElementById('attachname' + slno).value = filenmArr[0];
                }

                function browseImage(image) {
                    document.getElementById(image).click();
                }
                function imageUpload(image, imageLbl) {
                    var imgText = document.getElementById(image).value;
                    var imgTextArr = imgText.split(".");
                    document.getElementById(imageLbl).value = imgTextArr[0];
                }

                var next = 1;
                $(document).on("click", ".add-more", function (e) {
                    e.preventDefault();
                    var addto = "#adiv" + next;
                    next = next + 1;
                    var newIn = '<div id="adiv' + (next) + '" class="col-md-4 col-sm-12 "><button type="button" style="display: inline!important;" id="remove' + (next) + '" class="btn btn-danger remove-me">-</button><input style="display: inline!important;margin-left: 5px;margin-right: 3px;" class="form-control capitalize  validate[required]" id="attachname' + next + '" name="documentname" type="text" placeholder="Attachment Name" required=""><input style="display: none;"  id="field' + next + '" class="filecls" name="attachments" type="file" onchange="readURL1(this);setAttachName(\'' + next + '\');" ><input type="button" id="btnb' + next + '" class="btn btn-primary" value="Browse..." onclick="browseFile(\'' + next + '\');" /><p id="field' + next + 'Error" style="color: red; font: bold; display: none; text-align: right;">Upload your valid attachment</p></div>';
                    var newInput = $(newIn);
                    $(addto).after(newInput);
//                $("#field" + next).attr('data-source', $(addto).attr('data-source'));
                    $("#count").val(next);

                });

                $(document).on("click", '.remove-me', function (e) {
                    var rmvId = '' + this.id;
                    var fieldNum = rmvId.substring(6);
                    var fieldID = "#field" + (fieldNum);
                    var nameFieldID = "#attachname" + (fieldNum);
                    var btnb = "#btnb" + (fieldNum);
                    var errpgh = "#field" + (fieldNum) + "Error";
                    var adiv = "#adiv" + (fieldNum);
                    $(this).remove();
                    $(fieldID).remove();
                    $(nameFieldID).remove();
                    $(btnb).remove();
                    $(errpgh).remove();
                    $(adiv).remove();
                    next = next - 1;
                });

                $(document).on("click", '.r1', function (e) {
                    var rmvId = '' + this.id;

                    var num = rmvId.substring(2);

                    var divid = "#del" + (num);
                    var sno1 = "#attsno" + (num);

                    var a = $(sno1).val();
                    var b = $("#tobedel").val();

                    var c = a + "," + b;

                    document.getElementById("tobedel").value = c;

                    $(divid).remove();
                });
            </script>
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
            <script src="scripts/general-attach-script.js" type="text/javascript"></script>
            <script src="scripts/mioinvoice-attach-script.js" type="text/javascript"></script>
    </body>

</html>