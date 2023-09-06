<%-- 
    Document   : bookingDetailsAppForm
    Created on : 19 Dec, 2018, 1:25:56 PM
    Author     : Lakshmi
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
        <link href="../common/validate/validationEngine.css" rel="stylesheet" type="text/css"/>
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.min.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.js" type="text/javascript"></script>
        <script src="../common/datepicker/datetimepicker_css.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script src="../common/theme/css/csspopup.js" type="text/javascript"></script>
        <link href="../common/theme/css/disableSelection.css" rel="stylesheet" type="text/css"/>
        <title>arête Assets Management</title>
        <script type="text/javascript">
            $(document).ready(function () {

                $("#tag").toggle();
                $("#tag1").toggle();
                $("#tag2").toggle();
                $("#tag3").toggle();
                $("#tag4").toggle();
                $("#tag5").toggle();
                $("input").on("keypress", function (e) {

                    if (e.which === 32 && !this.value.length)
                        e.preventDefault();
                });
                $("#llContactno").change(function () {
                    var phone = $('input[name="llContactno"]').val();
                    intRegex = /[0-9 -()+]+$/;
                    if ((phone.length < 8) || (!intRegex.test(phone)))
                    {
                        $('#llContactno').val('');
                        alert('Please enter a valid phone number.');
                        return false;
                    }
                });
                $("#llWorkContactno").change(function () {
                    var phone = $('input[name="llWorkContactno"]').val();
                    intRegex = /[0-9 -()+]+$/;
                    if ((phone.length < 8) || (!intRegex.test(phone)))
                    {
                        $('#llWorkContactno').val('');
                        alert('Please enter a valid phone number.');
                        return false;
                    }
                });
                $("#tenantContactno").change(function () {
                    var phone = $('input[name="tenantContactno"]').val();
                    intRegex = /[0-9 -()+]+$/;
                    if ((phone.length < 8) || (!intRegex.test(phone)))
                    {
                        $('#tenantContactno').val('');
                        alert('Please enter a valid phone number.');
                        return false;
                    }
                });
                $("#tenantWorkContactno").change(function () {
                    var phone = $('input[name="tenantWorkContactno"]').val();
                    intRegex = /[0-9 -()+]+$/;
                    if ((phone.length < 8) || (!intRegex.test(phone)))
                    {
                        $('#tenantWorkContactno').val('');
                        alert('Please enter a valid phone number.');
                        return false;
                    }
                });
                $("#postalCode1").change(function () {
                    var phone = $('input[name="postalCode1"]').val();
                    intRegex = /[0-9 -()+]+$/;
                    if ((phone.length < 8) || (!intRegex.test(phone)))
                    {
                        $('#postalCode1').val('');
                        alert('Please enter a valid phone number.');
                        return false;
                    }
                });

            });
            function selectLandLord()
            {
                myWindow = window.open("../tenant/selectLandLord.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function selectAssetDetails()
            {
                myWindow = window.open("../tenant/selectAssetDetails.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function selectSubAssetDetails()
            {
                var assetCode = document.getElementById("assetCode").value;
                myWindow = window.open("../tenant/selectSubAssetDetails.htm?assetCode=" + assetCode + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function selectContractCode()
            {
                myWindow = window.open("../tenant/selectContractCode.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
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

            function validateEmail1(sEmail) {
                var etext = document.getElementById('postboxNo1').value;
                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                if (etext.match(mailformat)) {
                    return true;
                } else {
                    alert("You have entered an invalid email address!");
                    document.getElementById('postboxNo1').value = "";
                }
            }

            function testllImage() {
                var llSno = document.getElementById("llSno").value;
                if (llSno == '') {
                    alert("No image!!!");
                    return false;
                }
                else {
                    var res = llSno.split(",");
                    for (i = 0; i < res.length; i++) {
                        alert("You have " + (res.length - i) + " files to download");
                        window.location.href = '../tenant/tenantlAttachDownload.htm?sno=' + res[i];
                    }
                }
            }
            function testContImage() {
                var contSno = document.getElementById("contSno").value;
                if (contSno == '') {
                    alert("No image!!!");
                    return false;
                } else {
                    var res = contSno.split(",");
                    for (i = 0; i < res.length; i++) {
                        alert("You have " + (res.length - i) + " files to download");
                        window.location.href = '../tenant/tenantContAttachDownload.htm?sno=' + res[i];
                    }
                }
            }
            function rentCalc() {
                var actualRent = parseFloat(document.getElementById("actualRent").value);
                var rentTenant = parseFloat(document.getElementById("extra2").value);
                var advanceAmount = parseFloat(document.getElementById("advanceAmount").value);
                if (rentTenant == '0') {
                    alert("Invalid Amount..");
                    document.getElementById("extra2").value = "";
                    return false;
                }
//                else if(advanceAmount == '0'){
//                    alert("Invalid Amount..");
//                    document.getElementById("advanceAmount").value="";
//                    return false;
//                }
                else if (rentTenant < actualRent) {
                    alert("Rent amount can not be less than actual rent i.e," + actualRent);
                    document.getElementById("extra2").value = "";
                    document.getElementById("totalAmount").value = "";
                    return false;
                } else {
                    rentPMonth();
                    return true;
                }
            }
            function rentPMonth() {
                var rentpMonth = parseFloat(document.getElementById("extra2").value);
                var billgCycle = document.getElementById("billingCycle").value;
                if (isNaN(rentpMonth) === false && billgCycle !== '') {
                    if (billgCycle == "Monthly") {
                        document.getElementById("totalAmount").value = rentpMonth;
                    }
                    else if (billgCycle == "Quarterly") {
                        document.getElementById("totalAmount").value = rentpMonth * 3;
                    }
                    else if (billgCycle == "Half Yearly") {
                        document.getElementById("totalAmount").value = rentpMonth * 6;
                    }
                    else if (billgCycle == "Yearly") {
                        document.getElementById("totalAmount").value = rentpMonth * 12;
                    }
                } else {
                    document.getElementById("totalAmount").value = '0';
                }
            }
            function dateCheckCondition() {
                var contract = document.getElementById("contractSigningDate").value;
                var dueDate = document.getElementById("dueDate").value;
                var actD = contract.split("-");
                var inA = dueDate.split("-");
                var or = new Date(actD[1] + '/' + actD[0] + '/' + actD[2]);
                var trd = new Date(inA[1] + '/' + inA[0] + '/' + inA[2]);
                if (trd < or) {
                    alert("Due Date should be greater than Contract Signing Date.");
                    document.getElementById("contractSigningDate").value = '';
                    document.getElementById("dueDate").value = '';
                }
                return false;
            }
            function getLlAttach() {
                var llId = document.getElementById("llId").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../tenant/getLlAttach.htm',
                            data: {
                                llId: llId
                            },
                            success: function (data) {
                                if (data == 'a') {
                                    document.getElementById("llSno").value = '';
                                } else {
                                    var dat = data.split("[");
                                    var dat1 = dat[1].split("]");
                                    document.getElementById("llSno").value = dat1[0];
                                }
                            }
                        });
            }
            function getContAttach() {
                var contCode = document.getElementById("contractPeriod").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../tenant/getContAttach.htm',
                            data: {
                                contCode: contCode
                            },
                            success: function (data) {
                                if (data == 'a') {
                                    document.getElementById("contSno").value = '';
                                } else {
                                    var dat = data.split("[");
                                    var dat1 = dat[1].split("]");
                                    document.getElementById("contSno").value = dat1[0];
                                }
                            }
                        });
            }
// Uniqueness
            function fetchTid() {
                var tenantId = document.getElementById("tenantId").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../tenant/fetchTid.htm',
                            data: {
                                tenantId: tenantId
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("tenantId").value = "";
                                    return false;
                                }
                            }
                        });
            }
            function fetchTName() {
                var tenantFname = document.getElementById("tenantFname").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../tenant/fetchTName.htm',
                            data: {
                                tenantFname: tenantFname
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("tenantFname").value = "";
                                    return false;
                                }
                            }
                        });
            }
            function fetchTCono() {
                var tenantContactno = document.getElementById("tenantContactno").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../tenant/fetchTCono.htm',
                            data: {
                                tenantContactno: tenantContactno
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("tenantContactno").value = "";
                                    return false;
                                }
                            }
                        });
            }
            function fetchTWcono() {
                var tenantWorkContactno = document.getElementById("tenantWorkContactno").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../tenant/fetchTWcono.htm',
                            data: {
                                tenantWorkContactno: tenantWorkContactno
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("tenantWorkContactno").value = "";
                                    return false;
                                }
                            }
                        });
            }
            function fetchCrno() {
                var tenantCrNo = document.getElementById("tenantCrNo").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../tenant/fetchCrno.htm',
                            data: {
                                tenantCrNo: tenantCrNo
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("tenantCrNo").value = "";
                                    return false;
                                }
                            }
                        });
            }
            function validateEmail() {
                var tenantMailid = document.getElementById("tenantMailid").value;
                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                if (tenantMailid.match(mailformat)) {
//                    return true;
                } else {
                    alert("You have entered an invalid email address!");
                    document.getElementById('tenantMailid').value = "";
                }
                $.ajax
                        ({
                            type: "POST",
                            url: '../tenant/fetchTEmail.htm',
                            data: {
                                tenantMailid: tenantMailid
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("tenantMailid").value = "";
                                    return false;
                                }
                            }
                        });
            }
//
            function mandTest() {
                var llM = document.getElementById("llId").value;

                var tenantM = document.getElementById("tenantType").value &&
                        document.getElementById("tenantCategory").value &&
                        document.getElementById("tenantId").value &&
                        document.getElementById("tenantFname").value &&
                        document.getElementById("tenantLname").value &&
                        document.getElementById("tenantCrNo").value &&
                        document.getElementById("tenantContactno").value &&
                        document.getElementById("tenantMailid").value &&
                        document.getElementById("correspondenceAddress").value;

                var assetM = document.getElementById("assetName").value &&
                        document.getElementById("subclassifiedAstno").value;

                var contM = document.getElementById("contractPeriod").value;

                var billM = document.getElementById("billingCycle").value &&
                        document.getElementById("advanceAmount").value &&
                        document.getElementById("dueDate").value &&
                        document.getElementById("totalAmount").value;

                if (llM == '')
                {
                    callM();
                    alert("Please Fill Mandatory Fields in Landlord Details");
                    $('#llId').focus();
                    return false;
                }
                if (tenantM == '')
                {
                    callM1();
                    alert("Please Fill Mandatory Fields in Tenant Details");
                    $('#tenantType').required();
                    $('#tenantCategory').focus();
                    $('#tenantId').focus();
                    $('#tenantFname').focus();
                    $('#tenantLname').focus();
                    $('#tenantCrNo').focus();
                    $('#tenantContactno').focus();
                    $('#tenantMailid').focus();
                    $('#correspondenceAddress').focus();
                    return false;
                }
                if (assetM == '')
                {
                    callM2();
                    alert("Please Fill Mandatory Fields in Asset Details");
                    $('#assetName').focus();
                    $('#subclassifiedAstno').focus();
                    return false;
                }
                if (contM == '')
                {
                    callM3();
                    alert("Please Fill Mandatory Fields in Contract Details");
                    $('#contractPeriod').focus();
                    return false;
                }
                if (billM == '')
                {
                    callM4();
                    alert("Please Fill Mandatory Fields in Billing Cycle");
                    $('#billingCycle').focus();
                    $('#advanceAmount').focus();
                    $('#dueDate').focus();
                    $('#totalAmount').focus();
                    return false;
                }
                else {
                    document.forms["tenantform"].submit();
                }
            }
        </script>
        <script>
            function call() {
                $("#tag").toggle();
            }

            function call1() {
                $("#tag1").toggle();
            }
            function call2() {
                $("#tag2").toggle();
            }
            function call3() {

                $("#tag3").toggle();
            }
            function call4() {

                $("#tag4").toggle();
            }
            function call5() {

                $("#tag5").toggle();
            }
            function callM() {
                $("#tag").toggle();
                $("#tag1").hide();
                $("#tag2").hide();
                $("#tag3").hide();
                $("#tag4").hide();
                $("#tag5").hide();
            }
            function callM1() {
                $("#tag").hide();
                $("#tag1").toggle();
                $("#tag2").hide();
                $("#tag3").hide();
                $("#tag4").hide();
                $("#tag5").hide();
            }
            function callM2() {
                $("#tag").hide();
                $("#tag1").hide();
                $("#tag2").toggle();
                $("#tag3").hide();
                $("#tag4").hide();
                $("#tag5").hide();
            }
            function callM3() {
                $("#tag").hide();
                $("#tag1").hide();
                $("#tag2").hide();
                $("#tag3").toggle();
                $("#tag4").hide();
                $("#tag5").hide();
            }
            function callM4() {
                $("#tag").hide();
                $("#tag1").hide();
                $("#tag2").hide();
                $("#tag3").hide();
                $("#tag4").toggle();
                $("#tag5").toggle();
            }
            function recheck(tenantCode, status)
            {
                var remarks = $('#reviewerComments').val();
                if (remarks == null || remarks == '') {
                    alert("Please Write Remarks..!!");
                    return  false;
                } else {
                    window.location.href = "../tenant/reCheckSubmit.htm?tenantCode=" + tenantCode + "&appstatus=" + status + "&appremarks=" + remarks + "";
                }
            }
            function reject(tenantCode, status, subAstno)
            {
                var remarks = $('#reviewerComments').val();
                if (remarks == null || remarks == '') {
                    alert("Please Write Remarks..!!");
                    return  false;
                } else {
                    window.location.href = "../tenant/bookingTenantReject.htm?tenantCode=" + tenantCode + "&appstatus=" + status + "&appremarks=" + remarks + "&subAstno=" + subAstno + "";
                }
            }
            function reject1(tenantCode, status, subAstno)
            {
                var remarks = $('#reviewerComments').val();
                if (remarks == null || remarks == '') {
                    alert("Please Write Remarks..!!");
                    return  false;
                } else {
                    window.location.href = "../tenant/tenantReject11.htm?tenantCode=" + tenantCode + "&appstatus=" + status + "&appremarks=" + remarks + "&subAstno=" + subAstno + "";
                }
            }
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

            function calpercentage() {
                var totalAmount = document.getElementById('totalAmount').value;
                var percentage = document.getElementById('percentage').value;
                var perct = parseFloat((totalAmount / 100) * percentage);

                document.getElementById("amcamount").value = Math.round(perct);

            }
        </script>
    </head>
    <body class="nav-md">
        <div id="blanket" style="display: none;"></div>
        <div id="popUpDiv" style="display: none;"></div>
            <jsp:include page="../login/menu.htm" />


                        <main id="main" class="main">
                            <div>
                                <jsp:include page="../login/headerlink.htm?submodule=Booking Details&tab=Booking Details&pagetype=form"/>
                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h5>Booking Details Approval Form</h5>
                                                </div>
                                    <form class="form-inline row" id="tenantform" action="../tenant/bookingDetailsAppSubmit.htm"  method="post" enctype="multipart/form-data">
                                        <c:if test="${action eq 'edit'}">
                                            <c:forEach items="${levellist}" var="list">
                                                <c:if test="${list.userId eq userId}">
                                                    <c:if test="${list.submoduleName eq 'Booking Details'}">
                                                        <c:if test="${list.tabName eq 'Approval'}">
                                                            <c:set value="${list.approvalLevel}" var="approvalLevel"/>
                                                            <c:set value="${list.userName}" var="userName"/>
                                                            <c:set value="${list.approvalRole}" var="approvalRole"/>
                                                            <c:set value="${list.orgName}" var="orgName"/>
                                                            <c:set value="${list.levelNo}" var="levelNo"/>
                                                        </c:if> 
                                                    </c:if> 
                                                </c:if> 
                                            </c:forEach>
                                            <input type="hidden"  class="form-control"  name="userId" value="${userId}"> 
                                            <input type="hidden"  class="form-control"  name="orgName" value="${orgName}"> 
                                            <input type="hidden"  class="form-control"  name="userName" value="${userName}"> 
                                            <input type="hidden"  class="form-control"  name="approvalRole" value="${approvalRole}"> 
                                            <input type="hidden"  class="form-control"  name="approvalLevel" value="${approvalLevel}">
                                            <input type="hidden"  class="form-control"  name="levelNo" value="${levelNo}">
                                            <input type="hidden"  class="form-control"  name="submoduleName" value="Booking Details"> 
                                            <input type="hidden"  class="form-control"  name="tabName" value="Approval"> 
                                        </c:if>
                                        

                                        <c:if test="${action eq 'edit'}">
                                            
                                                

                                            <div class="box-header well" data-original-title onclick="call1();" style="cursor: pointer;">
                                                <h4><b style="padding-left: 20px;">Tenant Details (Second Party)</b></h4><c:if test="${fn:length(message) > 0}"><a class="successalert" style="margin-left: 250px;">${message}</a></c:if>
                                                </div> 
                                                <div class="box-content" id="tag1"> 

                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <label class="control-label"><span style="color: red">*</span>Tenant Type</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(BookingTenantDetails) > 0}">
                                                        <c:forEach items="${BookingTenantDetails}" var="list">
                                                            <c:set var="tenantCode" value="${list.tenantCode}"></c:set>
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control"  readonly id="tenantType" name="tenantType" value="${list.tenantType}">
                                                                <input type="hidden" name="pk1" value="${list.SNo}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantType" value="${list.tenantType}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <!--<input type="text" placeholder="" class="form-control" id="tenantType" name="tenantType" value="">-->
                                                        <select id="tenantType" name="tenantType" class="form-control validate[required]">
                                                            <option value="" disabled selected>Select your option</option>
                                                            <c:forEach items="${tenantType}" var="type">
                                                                <option>${type}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                                    
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <label class="control-label"><span style="color: red">*</span>Tenant Category</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(BookingTenantDetails) > 0}">
                                                        <c:forEach items="${BookingTenantDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input name="pk" type="hidden" id="pk" value="${list.SNo}">
                                                                    <input type="text" class="form-control" readonly id="tenantCategory" name="tenantCategory" value="${list.tenantCategory}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantCategory" value="${list.tenantCategory}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <!--<input type="text" placeholder="" class="form-control" id="tenantCategory" name="tenantCategory" value="">-->
                                                        <select id="tenantCategory" name="tenantCategory" class="form-control validate[required]">
                                                            <option value="" disabled selected>Select your option</option>
                                                            <c:forEach items="${tenantCategory}" var="type">
                                                                <option>${type}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <label class="control-label"><span style="color: red">*</span>Tenant Id</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(BookingTenantDetails) > 0}">
                                                        <c:forEach items="${BookingTenantDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control" readonly="" id="tenantId" name="tenantId" maxlength="15" value="${list.tenantId}" onkeypress="return isNumberKey3(event)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantId" value="${list.tenantId}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" id="tenantId" name="tenantId" maxlength="15" value="" onkeypress="return isNumberKey3(event)" onchange="fetchTid();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div><p>&nbsp;</p>
                                            
                                                
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <label class="control-label"><span style="color: red">*</span>Tenant First Name</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(BookingTenantDetails) > 0}">
                                                        <c:forEach items="${BookingTenantDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control" readonly="" id="tenantFname" name="tenantFname" maxlength="50" value="${list.tenantFname}" onkeypress="return isNumberKey4(event)" onkeyup="firstToUpperCase();">
                                                                    <input type="hidden" class="form-control" id="tenantFname1" name="tenantFname1" maxlength="50" value="${list.tenantFname}" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantFname" value="${list.tenantFname}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" id="tenantFname" name="tenantFname" maxlength="50" value="" onkeypress="return isNumberKey4(event)" onkeyup="firstToUpperCase();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>

                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <label class="control-label"><span style="color: red">*</span>Tenant Last Name</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(BookingTenantDetails) > 0}">
                                                        <c:forEach items="${BookingTenantDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control" readonly="" id="tenantLname" name="tenantLname" maxlength="50" value="${list.tenantLname}" onkeypress="return isNumberKey4(event)" onchange="fetchTName();" onkeyup="firstToUpperCase1();">
                                                                    <input type="hidden" class="form-control" id="tenantLname1" name="tenantLname1" maxlength="50" value="${list.tenantLname}" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantLname" value="${list.tenantLname}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" id="tenantLname" name="tenantLname" maxlength="50" value="" onkeypress="return isNumberKey4(event)" onchange="fetchTName();" onkeyup="firstToUpperCase1();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>

                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <label class="control-label"><span style="color: red">*</span>Tenant Mail ID</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(BookingTenantDetails) > 0}">
                                                        <c:forEach items="${BookingTenantDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control" id="tenantMailid" readonly="" name="tenantMailid" maxlength="40" value="${list.tenantMailid}" onchange="return validateEmail(event);">
                                                                    <input type="hidden" class="form-control" id="tenantMailid1" name="tenantMailid1" maxlength="40" value="${list.tenantMailid}" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantMailid" value="${list.tenantMailid}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" id="tenantMailid" name="tenantMailid" maxlength="40" value="" onchange="return validateEmail(event);">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                            <p>&nbsp;</p>

                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <label class="control-label"><span style="color: red">*</span>Tenant CR No.</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(BookingTenantDetails) > 0}">
                                                        <c:forEach items="${BookingTenantDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control" id="tenantCrNo" readonly="" name="tenantCrNo" maxlength="15" value="${list.tenantCrNo}" onkeypress="return isNumberKey3(event)" onchange="fetchCrno();">
                                                                    <input type="hidden" class="form-control" id="tenantCrNo1" name="tenantCrNo1" maxlength="15" value="${list.tenantCrNo}" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantCrNo" value="${list.tenantCrNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" id="tenantCrNo" name="tenantCrNo" maxlength="15" value="" onkeypress="return isNumberKey3(event)" onchange="fetchCrno();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <label class="control-label"><span style="color: red">*</span>Tenant Contact No.</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(BookingTenantDetails) > 0}">
                                                        <c:forEach items="${BookingTenantDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control" id="tenantContactno" readonly="" name="tenantContactno" maxlength="11" value="${list.tenantContactno}" onkeypress="return isNumberKey(event)" onchange="fetchTCono();">
                                                                    <input type="hidden" class="form-control" id="tenantContactno1" name="tenantContactno1" maxlength="11" value="${list.tenantContactno}" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantContactno" value="${list.tenantContactno}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" id="tenantContactno" name="tenantContactno" maxlength="11" value="" onkeypress="return isNumberKey(event)" onchange="fetchTCono();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>

                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <label class="control-label"><span style="color: red">*</span>Permanent Address</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(BookingTenantDetails) > 0}">
                                                        <c:forEach items="${BookingTenantDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input name="pk" type="hidden" value="${list.SNo}">
                                                                    <textarea rows="1" type="text" class="form-control" readonly="" style="resize: none" id="permanentAddress" name="permanentAddress" maxlength="250" value="${list.permanentAddress}">${list.permanentAddress}</textarea>
                                                                    <input id="permanentAddress1" class="form-control"  rows="1" maxlength="300" style="resize: none" type="hidden" value="${list.permanentAddress}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <textarea rows="1" type="text" class="form-control" style="resize: none" readonly="" id="permanentAddress"  value="${list.permanentAddress}">${list.permanentAddress}</textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <textarea type="text" rows="1" placeholder="" style="resize: none" class="form-control" id="permanentAddress" name="permanentAddress" maxlength="250" value=""></textarea>
                                                    <input type="hidden" name="pk1" value="${list.SNo}">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                            <p>&nbsp;</p>
                                        </div>
                                                
                                                
                                                

                                            <div class="box-header well" data-original-title onclick="call2();" style="cursor: pointer;">
                                                <h4><b style="padding-left: 20px;">Property Details</b></h4><c:if test="${fn:length(message) > 0}"><a class="successalert" style="margin-left: 250px;">${message}</a></c:if>
                                                </div> 
                                                <div class="box-content" id="tag2"> 

                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <label class="control-label"><span style="color: red">*</span>Property Name</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control" readonly="" id="assetName" name="assetName" maxlength="50" value="${list.assetName}" onkeypress="return isNumberKey3(event)">
                                                                    <input type="hidden" id="assetCode" name="assetCode" value="${list.assetCode}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="assetName" value="${list.assetName}">
                                                                    <input type="hidden" id="assetCode" name="assetCode" value="${list.assetCode}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Select Property" readonly="" class="form-control" name="assetName" id="assetName"  maxlength="50" value="" onkeypress="return isNumberKey3(event)" onclick="selectAssetDetails1();" onblur="return getAssetUtilityDetails();">
                                                        <input type="hidden" id="assetCode"  value="">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>

                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <label class="control-label"><span style="color: red">*</span>Building No.</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control" readonly="" id="buildingNo" name="buildingNo" maxlength="50" value="${list.assetBuilding}" onkeypress="return isNumberKey(event)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="buildingNo" value="${list.assetBuilding}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" readonly="" class="form-control" id="buildingNo" name="buildingNo" maxlength="50" value="" onkeypress="return isNumberKey(event)">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>


                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <label class="control-label"><span style="color: red">*</span>Block No.</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control" readonly="" id="blockNo" name="blockNo" maxlength="50" value="${list.blockNo}" onkeypress="return isNumberKey3(event)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="blockNo" value="${list.blockNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" readonly="" class="form-control" id="blockNo" name="blockNo" maxlength="50" value="" onkeypress="return isNumberKey3(event)">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                            <p>&nbsp;</p>

                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <label class="control-label"><span style="color: red">*</span>Plot No.</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control" readonly="" id="plotNo" name="plotNo" maxlength="50" value="${list.assetPlotNo}" onkeypress="return isNumberKey3(event)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="plotNo" name="plotNo" value="${list.assetPlotNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" readonly="" class="form-control" id="plotNo" name="plotNo" maxlength="50" value="" onkeypress="return isNumberKey3(event)">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <label class="control-label"><span style="color: red">*</span>Flat Name/Flat No.</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(subassDetails) > 0}">
                                                        <c:forEach items="${subassDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control" readonly="" id="flatNo" name="flatNo" maxlength="50" value="${list.subAssetName}" onkeypress="return isNumberKey3(event)">
                                                                    <input type="hidden" id="subclassifiedAstno" name="subclassifiedAstno" value="${list.subAssetCode}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="subclassifiedAstno" value="${list.subAssetName}">
                                                                    <input type="hidden" id="subclassifiedAstno" name="subclassifiedAstno" value="${list.subAssetCode}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Select Flat Name" readonly="" class="form-control" id="flatNo" name="flatNo" maxlength="50" value="" onkeypress="return isNumberKey3(event)" onclick="selectSubAssetDetails();">
                                                        <input type="hidden" id="subclassifiedAstno" name="subclassifiedAstno" value="">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>

                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <a style="color:transparent;">*</a><label class="control-label">Room/Unit Name</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(BookingTenantDetails) > 0}">
                                                        <c:forEach items="${BookingTenantDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                    <input type="text" class="form-control" readonly="" id="roomName" name="roomName" maxlength="50" value="${list.roomName}">
                                                                    <input type="hidden" id="roomCode" name="roomCode" value="${list.roomCode}" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="roomName" value="${list.roomName}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" readonly="" class="form-control" id="roomName" name="roomName" maxlength="50" value="">
                                                        <input type="hidden" id="roomCode" value="" >
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                            <p>&nbsp;</p>
                                                
                                                <fieldset>

                                                <div id="menuDiv">

                                                    <div class="x_panel">                                

                                                        <ul class="nav nav-tabs">
                                                            <li  class="active"><a href="#">Individual Utility Details</a></li>


                                                        </ul><br/>


                                                        <div style="margin-top: 20px;overflow: scroll;height: auto;border: 1px solid gray;background:#f5f6f7;" >
                                                            <table  class="table table-striped responsive-utilities jambo_table" id="enquirytable">
                                                                <thead>
                                                                    <tr>                                
                                                                        <th><i class="fa fa-trash"></i></th>                                                
                                                                        <th style="width:210px;"><span style="color:red">*</span> Utility Name</th>
                                                                        <th style="width:210px;"><span style="color:red">*</span> Utility Bill Type</th>
                                                                        <th><span style="color:red">*</span> Utility Bill</th>                                                               

                                                                    </tr>
                                                                </thead>
                                                                <tbody id="resourcetable2">
                                                                    <c:if test="${action eq 'edit'}">
                                                                        <c:forEach items="${assetDetails1}" var="item">


                                                                            <tr class="item-enquiry">
                                                                                <td align="center" onclick=""> </td>
                                                                                <td><input class="form-control  right validate[required,custom[notzero]]" readonly autocomplete="off" name="utility" id="utility" type="text" value="${item.utility}" style=""></td> 
                                                                                <td><input class="form-control  right validate[required,custom[notzero]]" readonly autocomplete="off" name="utilityBillType" id="utilityBillType" type="text" value="${item.utilityBillType}" style=""></td>                                                                        
                                                                                <td><input class="form-control  right validate[required,custom[notzero]]" readonly autocomplete="off" name="utilityBill" id="utilityBill" type="text" value="${item.utilityBill}" style=""></td>                                                                        
                                                                            </tr>

                                                                        </c:forEach>
                                                                    </c:if>
                                                                    <c:if test="${action eq 'view'}">
                                                                        <c:forEach items="${assetDetails1}" var="item">


                                                                            <tr class="item-enquiry">
                                                                                <td align="center" onclick=""> </td>
                                                                                <td><input class="form-control  right validate[required,custom[notzero]]" readonly autocomplete="off" name="utility" id="utility" type="text" value="${item.utility}" style=""></td> 
                                                                                <td><input class="form-control  right validate[required,custom[notzero]]" readonly autocomplete="off" name="utilityBillType" id="utilityBillType" type="text" value="${item.utilityBillType}" style=""></td>                                                                        
                                                                                <td><input class="form-control  right validate[required,custom[notzero]]" readonly autocomplete="off" name="utilityBill" id="utilityBill" type="text" value="${item.utilityBill}" style=""></td>                                                                        
                                                                            </tr>

                                                                        </c:forEach>
                                                                    </c:if>
                                                                </tbody>
                                                                

                                                            </table>
                                                            
                                                        </div>
                                                        <div class="x_title">
                                                            <label class="control-label"><strong>Total Amount : <div id="totalitemAmount" name="totalitemAmount"></div><input type="hidden" id="itmTot" name="itmTot"></strong> </label>                                                   

                                                            <div class="clearfix"></div>
                                                        </div>
                                                        <div class="clearfix"></div>

                                                    </div>

                                                </div>

                                            </fieldset>  
                                                <p>&nbsp;</p>
                                            
                                            <div class="clearfix"></div>
                                            <fieldset>

                                                <div id="menuDiv">

                                                    <div class="x_panel">                                

                                                        <ul class="nav nav-tabs">
                                                            <li  class="active"><a href="#">Common Utility Details</a></li>


                                                        </ul>


                                                        <div style="margin-top: 20px;overflow: scroll;height: auto;border: 1px solid gray;background:#f5f6f7;" >
                                                            <table  class="table table-striped responsive-utilities jambo_table" id="enquirytable1">
                                                                <thead>
                                                                    <tr>                                
                                                                        <th><i class="fa fa-trash"></i></th>                                                
                                                                        <th style="width:210px;"><span style="color:red">*</span> Utility Name</th>
                                                                        <th style="width:210px;"><span style="color:red">*</span> Utility Bill Type</th>
                                                                        <th><span style="color:red">*</span> Utility Bill</th>                                                               

                                                                    </tr>
                                                                </thead>
                                                                <tbody id="resourcetable1">
                                                                    <c:if test="${action eq 'edit'}">
                                                                        <c:forEach items="${assetDetails1}" var="item">

                                                                            <tr class="item-enquiry">
                                                                                <td align="center" onclick=""> </td>
                                                                                <td><input class="form-control  right validate[required,custom[notzero]]" name="comUtility" id="comUtility" type="text" value="${item.comUtility}" readonly="" style=""></td> 
                                                                                <td><input class="form-control  right validate[required,custom[notzero]]" name="comUtilityBillType" id="comUtilityBillType" type="text" value="${item.comUtilityBillType}" readonly="" style=""></td>                                                                        
                                                                                <td><input class="form-control  right validate[required,custom[notzero]]" name="comutilityBill" id="comutilityBill" type="text" value="${item.comutilityBill}" readonly="" style=""></td>                                                                        
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </c:if> 
                                                                    <c:if test="${action eq 'view'}">
                                                                        <c:forEach items="${assetDetails1}" var="item">

                                                                            <tr class="item-enquiry">
                                                                                <td align="center" onclick=""> </td>
                                                                                <td><input class="form-control  right validate[required,custom[notzero]]" name="comUtility" id="comUtility" type="text" value="${item.comUtility}" readonly="" style=""></td> 
                                                                                <td><input class="form-control  right validate[required,custom[notzero]]" name="comUtilityBillType" id="comUtilityBillType" type="text" value="${item.comUtilityBillType}" readonly="" style=""></td>                                                                        
                                                                                <td><input class="form-control  right validate[required,custom[notzero]]" name="comutilityBill" id="comutilityBill" type="text" value="${item.comutilityBill}" readonly="" style=""></td>                                                                        
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </c:if> 

                                                                </tbody>                                                                

                                                            </table>                                                       



                                                        </div>
                                                        
                                                        <div class="x_title">
                                                            <label class="control-label"><strong>Total Amount : <div id="commontotalitemAmount" name="commontotalitemAmount"></div><input type="hidden" id="commonitmTot" name="commonitmTot"></strong> </label>                                                   

                                                            <div class="clearfix"></div>
                                                        </div>
                                                        <div class="clearfix"></div>

                                                    </div>

                                                </div>

                                            </fieldset>
                                            </div>
                                            <p>&nbsp;</p> 
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <a style="color:red;">*</a>
                                                <label class="control-label">Remarks</label>                                       
                                                <textarea  class="form-control" required="" rows="1" type="text" id="reviewerComments" style="resize: none;" name="reviewerComments" maxlength="120" ></textarea> 
                                            </div>
                                            <p>&nbsp;</p>

                                            <c:if test="${action eq 'edit'}">
                                                <!--                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">-->
                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                    <button type="submit" class="btn btn-primary" style="">Approve</button>
                                                    <!--<button type="button" class="btn btn-dark" onclick="recheck('${tenantCode}', 'Recheck');">Recheck</button>-->
                                                    <button type="button" class="btn btn-warning" style="" onclick="reject('${tenantCode}', 'Rejected', '${subAstno}');">Reject</button>
                                                    <a href="../tenant/bookingDetailsAppList.htm" class="btn btn-danger">Cancel</a>
                                                </div>
                                                <!--</div>--> 
                                            </c:if>
                                        </c:if>
                                        

                                    </form>
                               </div>
                                        </div>

                                    </div>
                                </div>
                            </section>

                        </main><!-- End #main -->
                        <jsp:include page="../login/footer.jsp" />

        <script>
            NProgress.done();
            window.onload = getContAttach();
            window.onload = getLlAttach();
        </script>
    </body>

</html>
