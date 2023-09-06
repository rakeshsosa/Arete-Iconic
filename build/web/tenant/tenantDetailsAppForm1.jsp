<%-- 
    Document   : tenantCategoryForm
    Created on : Mar 4, 2016, 10:42:01 AM
    Author     : Shweta s
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
                    document.getElementById("totalAmount").value = "";
                    document.getElementById("extra2").value = "";
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
            window.location.href = "../tenant/revApproveSubmit.htm?tenantCode=" + tenantCode + "&reviewerRecordStatus=" + status + "&reviewerComments=" + remarks + "";
            }
            }
            function reject(tenantCode, status, subAstno)
            {
            var remarks = $('#reviewerComments').val();
                    if (remarks == null || remarks == '') {
            alert("Please Write Remarks..!!");
                    return  false;
            } else {
            window.location.href = "../tenant/tenantReject1.htm?tenantCode=" + tenantCode + "&appstatus=" + status + "&appremarks=" + remarks + "&subAstno=" + subAstno + "";
            }
            }
            function reject1(tenantCode, status, subAstno)
            {
            var remarks = $('#reviewerComments').val();
                    if (remarks == null || remarks == '') {
            alert("Please Write Remarks..!!");
                    return  false;
            } else {
            window.location.href = "../tenant/tenantReject12.htm?tenantCode=" + tenantCode + "&appstatus=" + status + "&appremarks=" + remarks + "&subAstno=" + subAstno + "";
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
            if (fieldval.indexOf(".") != - 1) {
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
        </script>
    </head>
    <body class="nav-md">
        <div id="blanket" style="display: none;"></div>
        <div id="popUpDiv" style="display: none;"></div>
                                <jsp:include page="../login/menu.htm" />


                        <main id="main" class="main">
                            <div>
                                <jsp:include page="../login/headerlink.htm?submodule=Tenant Details&tab=Approval 2&pagetype=form"/>
                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h5>Tenant Details Approval 2</h5>
                                                </div>
                                    <form class="form-inline row" id="tenantform" action="../tenant/tenantDetailsAppSubmit1.htm"  method="post" enctype="multipart/form-data">
                                        <c:if test="${action eq 'edit'}">
                                            <c:forEach items="${levellist}" var="list">
                                                <c:if test="${list.userId eq userId}">
                                                    <c:if test="${list.submoduleName eq 'Tenant Details'}">
                                                        <c:if test="${list.tabName eq 'Tenant Approval'}">
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
                                            <input type="hidden"  class="form-control"  name="submoduleName" value="Tenant Details"> 
                                            <input type="hidden"  class="form-control"  name="tabName" value="Tenant Approval"> 
                                        </c:if>
                                        <c:forEach items="${test}" var="list">
                                            <c:if test="${list[0] eq '39'}">
                                                <c:set value="${list[1]}" var="field_1"/>
                                                <c:set value="${list[2]}" var="fieldStatus_1"/>
                                                <c:set value="${list[3]}" var="mand_status_1"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '40'}">
                                                <c:set value="${list[1]}" var="field_2"/>
                                                <c:set value="${list[2]}" var="fieldStatus_2"/>
                                                <c:set value="${list[3]}" var="mand_status_2"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '41'}">
                                                <c:set value="${list[1]}" var="field_3"/>
                                                <c:set value="${list[2]}" var="fieldStatus_3"/>
                                                <c:set value="${list[3]}" var="mand_status_3"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '42'}">
                                                <c:set value="${list[1]}" var="field_4"/>
                                                <c:set value="${list[2]}" var="fieldStatus_4"/>
                                                <c:set value="${list[3]}" var="mand_status_4"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '43'}">
                                                <c:set value="${list[1]}" var="field_5"/>
                                                <c:set value="${list[2]}" var="fieldStatus_5"/>
                                                <c:set value="${list[3]}" var="mand_status_5"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '44'}">
                                                <c:set value="${list[1]}" var="field_6"/>
                                                <c:set value="${list[2]}" var="fieldStatus_6"/>
                                                <c:set value="${list[3]}" var="mand_status_6"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '45'}">
                                                <c:set value="${list[1]}" var="field_7"/>
                                                <c:set value="${list[2]}" var="fieldStatus_7"/>
                                                <c:set value="${list[3]}" var="mand_status_7"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '46'}">
                                                <c:set value="${list[1]}" var="field_8"/>
                                                <c:set value="${list[2]}" var="fieldStatus_8"/>
                                                <c:set value="${list[3]}" var="mand_status_8"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '47'}">
                                                <c:set value="${list[1]}" var="field_9"/>
                                                <c:set value="${list[2]}" var="fieldStatus_9"/>
                                                <c:set value="${list[3]}" var="mand_status_9"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '48'}">
                                                <c:set value="${list[1]}" var="field_10"/>
                                                <c:set value="${list[2]}" var="fieldStatus_10"/>
                                                <c:set value="${list[3]}" var="mand_status_10"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '49'}">
                                                <c:set value="${list[1]}" var="field_11"/>
                                                <c:set value="${list[2]}" var="fieldStatus_11"/>
                                                <c:set value="${list[3]}" var="mand_status_11"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '50'}">
                                                <c:set value="${list[1]}" var="field_12"/>
                                                <c:set value="${list[2]}" var="fieldStatus_12"/>
                                                <c:set value="${list[3]}" var="mand_status_12"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '51'}">
                                                <c:set value="${list[1]}" var="field_13"/>
                                                <c:set value="${list[2]}" var="fieldStatus_13"/>
                                                <c:set value="${list[3]}" var="mand_status_13"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '52'}">
                                                <c:set value="${list[1]}" var="field_14"/>
                                                <c:set value="${list[2]}" var="fieldStatus_14"/>
                                                <c:set value="${list[3]}" var="mand_status_14"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '53'}">
                                                <c:set value="${list[1]}" var="field_15"/>
                                                <c:set value="${list[2]}" var="fieldStatus_15"/>
                                                <c:set value="${list[3]}" var="mand_status_15"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '54'}">
                                                <c:set value="${list[1]}" var="field_16"/>
                                                <c:set value="${list[2]}" var="fieldStatus_16"/>
                                                <c:set value="${list[3]}" var="mand_status_16"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '55'}">
                                                <c:set value="${list[1]}" var="field_17"/>
                                                <c:set value="${list[2]}" var="fieldStatus_17"/>
                                                <c:set value="${list[3]}" var="mand_status_17"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '56'}">
                                                <c:set value="${list[1]}" var="field_18"/>
                                                <c:set value="${list[2]}" var="fieldStatus_18"/>
                                                <c:set value="${list[3]}" var="mand_status_18"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '57'}">
                                                <c:set value="${list[1]}" var="field_19"/>
                                                <c:set value="${list[2]}" var="fieldStatus_19"/>
                                                <c:set value="${list[3]}" var="mand_status_19"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '58'}">
                                                <c:set value="${list[1]}" var="field_20"/>
                                                <c:set value="${list[2]}" var="fieldStatus_20"/>
                                                <c:set value="${list[3]}" var="mand_status_20"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '59'}">
                                                <c:set value="${list[1]}" var="field_21"/>
                                                <c:set value="${list[2]}" var="fieldStatus_21"/>
                                                <c:set value="${list[3]}" var="mand_status_21"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '60'}">
                                                <c:set value="${list[1]}" var="field_22"/>
                                                <c:set value="${list[2]}" var="fieldStatus_22"/>
                                                <c:set value="${list[3]}" var="mand_status_22"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '61'}">
                                                <c:set value="${list[1]}" var="field_23"/>
                                                <c:set value="${list[2]}" var="fieldStatus_23"/>
                                                <c:set value="${list[3]}" var="mand_status_23"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '62'}">
                                                <c:set value="${list[1]}" var="field_24"/>
                                                <c:set value="${list[2]}" var="fieldStatus_24"/>
                                                <c:set value="${list[3]}" var="mand_status_24"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '93'}">
                                                <c:set value="${list[1]}" var="field_25"/>
                                                <c:set value="${list[2]}" var="fieldStatus_25"/>
                                                <c:set value="${list[3]}" var="mand_status_25"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '63'}">
                                                <c:set value="${list[1]}" var="field_26"/>
                                                <c:set value="${list[2]}" var="fieldStatus_26"/>
                                                <c:set value="${list[3]}" var="mand_status_26"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '64'}">
                                                <c:set value="${list[1]}" var="field_27"/>
                                                <c:set value="${list[2]}" var="fieldStatus_27"/>
                                                <c:set value="${list[3]}" var="mand_status_27"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '65'}">
                                                <c:set value="${list[1]}" var="field_28"/>
                                                <c:set value="${list[2]}" var="fieldStatus_28"/>
                                                <c:set value="${list[3]}" var="mand_status_28"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '66'}">
                                                <c:set value="${list[1]}" var="field_29"/>
                                                <c:set value="${list[2]}" var="fieldStatus_29"/>
                                                <c:set value="${list[3]}" var="mand_status_29"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '67'}">
                                                <c:set value="${list[1]}" var="field_30"/>
                                                <c:set value="${list[2]}" var="fieldStatus_30"/>
                                                <c:set value="${list[3]}" var="mand_status_30"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '68'}">
                                                <c:set value="${list[1]}" var="field_31"/>
                                                <c:set value="${list[2]}" var="fieldStatus_31"/>
                                                <c:set value="${list[3]}" var="mand_status_31"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '69'}">
                                                <c:set value="${list[1]}" var="field_32"/>
                                                <c:set value="${list[2]}" var="fieldStatus_32"/>
                                                <c:set value="${list[3]}" var="mand_status_32"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '70'}">
                                                <c:set value="${list[1]}" var="field_33"/>
                                                <c:set value="${list[2]}" var="fieldStatus_33"/>
                                                <c:set value="${list[3]}" var="mand_status_33"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '71'}">
                                                <c:set value="${list[1]}" var="field_34"/>
                                                <c:set value="${list[2]}" var="fieldStatus_34"/>
                                                <c:set value="${list[3]}" var="mand_status_34"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '72'}">
                                                <c:set value="${list[1]}" var="field_35"/>
                                                <c:set value="${list[2]}" var="fieldStatus_35"/>
                                                <c:set value="${list[3]}" var="mand_status_35"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '73'}">
                                                <c:set value="${list[1]}" var="field_36"/>
                                                <c:set value="${list[2]}" var="fieldStatus_36"/>
                                                <c:set value="${list[3]}" var="mand_status_36"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '74'}">
                                                <c:set value="${list[1]}" var="field_37"/>
                                                <c:set value="${list[2]}" var="fieldStatus_37"/>
                                                <c:set value="${list[3]}" var="mand_status_37"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '75'}">
                                                <c:set value="${list[1]}" var="field_38"/>
                                                <c:set value="${list[2]}" var="fieldStatus_38"/>
                                                <c:set value="${list[3]}" var="mand_status_38"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '76'}">
                                                <c:set value="${list[1]}" var="field_39"/>
                                                <c:set value="${list[2]}" var="fieldStatus_39"/>
                                                <c:set value="${list[3]}" var="mand_status_39"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '77'}">
                                                <c:set value="${list[1]}" var="field_40"/>
                                                <c:set value="${list[2]}" var="fieldStatus_40"/>
                                                <c:set value="${list[3]}" var="mand_status_40"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '78'}">
                                                <c:set value="${list[1]}" var="field_41"/>
                                                <c:set value="${list[2]}" var="fieldStatus_41"/>
                                                <c:set value="${list[3]}" var="mand_status_41"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '79'}">
                                                <c:set value="${list[1]}" var="field_42"/>
                                                <c:set value="${list[2]}" var="fieldStatus_42"/>
                                                <c:set value="${list[3]}" var="mand_status_42"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '80'}">
                                                <c:set value="${list[1]}" var="field_43"/>
                                                <c:set value="${list[2]}" var="fieldStatus_43"/>
                                                <c:set value="${list[3]}" var="mand_status_43"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '81'}">
                                                <c:set value="${list[1]}" var="field_44"/>
                                                <c:set value="${list[2]}" var="fieldStatus_44"/>
                                                <c:set value="${list[3]}" var="mand_status_44"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '82'}">
                                                <c:set value="${list[1]}" var="field_45"/>
                                                <c:set value="${list[2]}" var="fieldStatus_45"/>
                                                <c:set value="${list[3]}" var="mand_status_45"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '83'}">
                                                <c:set value="${list[1]}" var="field_46"/>
                                                <c:set value="${list[2]}" var="fieldStatus_46"/>
                                                <c:set value="${list[3]}" var="mand_status_46"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '84'}">
                                                <c:set value="${list[1]}" var="field_47"/>
                                                <c:set value="${list[2]}" var="fieldStatus_47"/>
                                                <c:set value="${list[3]}" var="mand_status_47"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '85'}">
                                                <c:set value="${list[1]}" var="field_48"/>
                                                <c:set value="${list[2]}" var="fieldStatus_48"/>
                                                <c:set value="${list[3]}" var="mand_status_48"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '86'}">
                                                <c:set value="${list[1]}" var="field_49"/>
                                                <c:set value="${list[2]}" var="fieldStatus_49"/>
                                                <c:set value="${list[3]}" var="mand_status_49"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '87'}">
                                                <c:set value="${list[1]}" var="field_50"/>
                                                <c:set value="${list[2]}" var="fieldStatus_50"/>
                                                <c:set value="${list[3]}" var="mand_status_50"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '88'}">
                                                <c:set value="${list[1]}" var="field_51"/>
                                                <c:set value="${list[2]}" var="fieldStatus_51"/>
                                                <c:set value="${list[3]}" var="mand_status_51"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '89'}">
                                                <c:set value="${list[1]}" var="field_52"/>
                                                <c:set value="${list[2]}" var="fieldStatus_52"/>
                                                <c:set value="${list[3]}" var="mand_status_52"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '90'}">
                                                <c:set value="${list[1]}" var="field_53"/>
                                                <c:set value="${list[2]}" var="fieldStatus_53"/>
                                                <c:set value="${list[3]}" var="mand_status_53"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '91'}">
                                                <c:set value="${list[1]}" var="field_54"/>
                                                <c:set value="${list[2]}" var="fieldStatus_54"/>
                                                <c:set value="${list[3]}" var="mand_status_54"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '92'}">
                                                <c:set value="${list[1]}" var="field_55"/>
                                                <c:set value="${list[2]}" var="fieldStatus_55"/>
                                                <c:set value="${list[3]}" var="mand_status_55"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '268'}">
                                                <c:set value="${list[1]}" var="field_56"/>
                                                <c:set value="${list[2]}" var="fieldStatus_56"/>
                                                <c:set value="${list[3]}" var="mand_status_56"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '269'}">
                                                <c:set value="${list[1]}" var="field_57"/>
                                                <c:set value="${list[2]}" var="fieldStatus_57"/>
                                                <c:set value="${list[3]}" var="mand_status_57"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '270'}">
                                                <c:set value="${list[1]}" var="field_58"/>
                                                <c:set value="${list[2]}" var="fieldStatus_58"/>
                                                <c:set value="${list[3]}" var="mand_status_58"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '271'}">
                                                <c:set value="${list[1]}" var="field_59"/>
                                                <c:set value="${list[2]}" var="fieldStatus_59"/>
                                                <c:set value="${list[3]}" var="mand_status_59"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '272'}">
                                                <c:set value="${list[1]}" var="field_60"/>
                                                <c:set value="${list[2]}" var="fieldStatus_60"/>
                                                <c:set value="${list[3]}" var="mand_status_60"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '759'}">
                                                <c:set value="${list[1]}" var="field_61"/>
                                                <c:set value="${list[2]}" var="fieldStatus_61"/>
                                                <c:set value="${list[3]}" var="mand_status_61"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '760'}">
                                                <c:set value="${list[1]}" var="field_62"/>
                                                <c:set value="${list[2]}" var="fieldStatus_62"/>
                                                <c:set value="${list[3]}" var="mand_status_62"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '761'}">
                                                <c:set value="${list[1]}" var="field_63"/>
                                                <c:set value="${list[2]}" var="fieldStatus_63"/>
                                                <c:set value="${list[3]}" var="mand_status_63"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '762'}">
                                                <c:set value="${list[1]}" var="field_64"/>
                                                <c:set value="${list[2]}" var="fieldStatus_64"/>
                                                <c:set value="${list[3]}" var="mand_status_64"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '763'}">
                                                <c:set value="${list[1]}" var="field_65"/>
                                                <c:set value="${list[2]}" var="fieldStatus_65"/>
                                                <c:set value="${list[3]}" var="mand_status_65"/>
                                            </c:if>
                                        </c:forEach>

                                        <c:if test="${action eq 'edit' || action eq 'view'}">
                                            <div class="box-header well" data-original-title onclick="call();" style="cursor: pointer;">
                                                <h4><b style="padding-left: 20px;">Landlord Details (First Party)</b></h4><c:if test="${fn:length(message) > 0}"><a class="successalert" style="margin-left: 250px;">${message}</a></c:if>
                                                </div> 
                                                <div class="box-content" id="tag"> 

                                                <c:if test="${fieldStatus_1 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_1 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_1}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:set var="tenantCode" value="${list.tenantCode}"></c:set>
                                                                    <c:set var="subAstno" value="${list.subclassifiedAstno}"></c:set>
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control"  readonly="" id="llId" name="llId" value="${list.llId}">
                                                                            <input type="hidden" name="pk" value="${list.SNo}">
                                                                            <input type="hidden" name="status" value="${list.status}">
                                                                            <input type="hidden" name="tenantCode" value="${list.tenantCode}">
                                                                            <input type="hidden" id="assetCode" name="assetCode" value="${list.assetName}">
                                                                            <input type="hidden" name="action" value="${action}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" id="llId" readonly="" value="${list.llId}">
                                                                            <input type="hidden" id="assetCode" name="assetCode" value="${list.assetName}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="Select Landlord" readonly class="form-control" id="llId" name="llId" value="" onclick="selectLandLord();" onblur="return getLlAttach();">
                                                                <input type="hidden" id="llSno" name="llSno" value="">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_2 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_2 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_2}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(landLordDetails) > 0}">
                                                                <c:forEach items="${landLordDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control"  readonly="" id="llName" name="llName" value="${list.landlordName}">
                                                                            <input type="hidden" id="llSno" name="llSno" value="">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="llName" value="${list.landlordName}">
                                                                            <input type="hidden" id="llSno" name="llSno" value="">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" placeholder="" readonly class="form-control" id="llName" name="llName" value="">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                    </div></c:if>
                                                <c:if test="${fieldStatus_3 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_3 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_3}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(landLordDetails) > 0}">
                                                                <c:forEach items="${landLordDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control"  readonly="" id="llCategory" name="llCategory" value="${list.landlordCategory}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="llCategory" value="${list.landlordCategory}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" readonly class="form-control"  id="llCategory" name="llCategory" value="">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_4 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_4 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_4}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(landLordDetails) > 0}">
                                                                <c:forEach items="${landLordDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control"  readonly="" id="llCrNo" name="llCrNo" maxlength="40" value="${list.crIdNo}" onkeypress="return isNumberKey3(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="llCrNo" value="${list.crIdNo}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" readonly class="form-control"  id="llCrNo" name="llCrNo" maxlength="40" value="" onkeypress="return isNumberKey3(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_5 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_5 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_5}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(landLordDetails) > 0}">
                                                                <c:forEach items="${landLordDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly="" id="llContactno" name="llContactno" value="${list.landlordContactno}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="llContactno" value="${list.landlordContactno}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" readonly class="form-control"  id="llContactno" name="llContactno" value="">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_6 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_6 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_6}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(landLordDetails) > 0}">
                                                                <c:forEach items="${landLordDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly="" id="llWorkContactno" name="llWorkContactno" value="${list.landlordWorkContactno}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="llWorkContactno" value="${list.landlordWorkContactno}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" readonly class="form-control"  id="llWorkContactno" name="llWorkContactno" value="">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_7 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_7 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_7}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(landLordDetails) > 0}">
                                                                <c:forEach items="${landLordDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly="" id="llMailid" name="llMailid" value="${list.landlordEmailid}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="llMailid" value="${list.landlordEmailid}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" readonly class="form-control" id="llMailid" name="llMailid" value="">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>

                                                <c:if test="${action eq 'edit' || action eq 'view' }">
                                                    <c:if test="${fieldStatus_8 eq 'y'}">
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                            <c:if test="${mand_status_8 eq 'required'}">
                                                                <a style="color:red;">*</a>
                                                            </c:if><a style="color:transparent;">*</a>
                                                            <label class="control-label">${field_8}</label>
                                                            <div style="overflow: scroll;border:none;margin-left:139px;margin-top:-22px;height: 150px;width:168px">
                                                                <table><tbody>
                                                                        <c:choose>
                                                                            <c:when test="${fn:length(landlordDocuments) > 0}">
                                                                                <c:forEach items="${landlordDocuments}" var="attach">
                                                                                    <c:choose>
                                                                                        <c:when test="${action eq 'edit'}">
                                                                                            <tr><td>
                                                                                                    <c:if test="${not empty attach.filename}">
                                                                                                        <a   href="../master/landlordAttachDownload.htm?sno=${attach.sno}" class="fa fa-file-pdf-o" style="color: #000">${attach.filename}
                                                                                                            <span title="${attach.filename}"></span><br/></a>
                                                                                                        </c:if>
                                                                                                        <c:if test="${empty attach.filename}">N/A</c:if></td></tr>
                                                                                                </c:when>
                                                                                                <c:otherwise>
                                                                                            <tr><td>
                                                                                                    <c:if test="${not empty attach.filename}">
                                                                                                        <a   href="../master/landlordAttachDownload.htm?sno=${attach.sno}" class="fa fa-file-pdf-o" style="color: #000">${attach.filename}
                                                                                                            <span title="${attach.filename}"></span></a>
                                                                                                        </c:if>
                                                                                                        <c:if test="${empty attach.filename}">N/A</c:if>  </td></tr>
                                                                                                </c:otherwise> 
                                                                                            </c:choose>
                                                                                        </c:forEach>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <c:if test="${empty attach.filename}">Not Available</c:if>
                                                                            </c:otherwise>        
                                                                        </c:choose></tbody></table>
                                                            </div> 
                                                        </div> 
                                                    </c:if>
                                                </c:if>

                                                <p>&nbsp;</p>
                                                <p>&nbsp;</p>
                                                <p>&nbsp;</p>
                                            </div>

                                            <div class="box-header well" data-original-title onclick="call1();" style="cursor: pointer;">
                                                <h4><b style="padding-left: 20px;">Tenant Details (Second Party)</b></h4><c:if test="${fn:length(message) > 0}"><a class="successalert" style="margin-left: 250px;">${message}</a></c:if>
                                                </div> 
                                                <div class="box-content" id="tag1"> 

                                                <c:if test="${fieldStatus_9 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_9 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_9}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control"  readonly id="tenantType" name="tenantType" value="${list.tenantType}">
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

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_10 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_10 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_10}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
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

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_11 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_11 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_11}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
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

                                                    </div></c:if><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_12 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_12 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_12}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly id="tenantFname" name="tenantFname" maxlength="50" value="${list.tenantFname}" onkeypress="return isNumberKey4(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="tenantFname" value="${list.tenantFname}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="tenantFname" name="tenantFname" maxlength="50" value="" onkeypress="return isNumberKey4(event)" onchange="fetchTName();">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_13 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_13 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_13}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly id="tenantLname" name="tenantLname" maxlength="50" value="${list.tenantLname}" onkeypress="return isNumberKey4(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="tenantLname" value="${list.tenantLname}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="tenantLname" name="tenantLname" maxlength="50" value="" onkeypress="return isNumberKey4(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_14 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_14 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_14}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly="" id="tenantCitizenship" name="tenantCitizenship" value="${list.tenantCitizenship}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="tenantCitizenship" value="${list.tenantCitizenship}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="tenantCitizenship" name="tenantCitizenship" value="" maxlength="50">
                                                                <!--                                                            <select id="tenantCitizenship" name="tenantCitizenship"  class="form-control" >
                                                                                                                                <option value="" selected>Select your option</option>
                                                                                                                                <option value="Nizwa">Nizwa</option>
                                                                                                                                <option value="Sohar">Sohar</option>
                                                                                                                                <option value="Haima">Haima</option>
                                                                                                                                <option value="Sur">Sur</option>
                                                                                                                                <option value="Ibri">Ibri</option>
                                                                                                                                <option value="Muscat">Muscat</option>
                                                                                                                                <option value="Khasab">Khasab</option>
                                                                                                                                <option value="Salalah">Salalah</option>
                                                                                                                                <option value="Buraymi">Buraymi</option>
                                                                                                                            </select>-->
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if><p>&nbsp;</p>

                                                <c:if test="${fieldStatus_16 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_16 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_16}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly id="tenantCrNo" name="tenantCrNo" maxlength="40" value="${list.tenantCrNo}" onkeypress="return isNumberKey3(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="tenantCrNo" value="${list.tenantCrNo}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="tenantCrNo" name="tenantCrNo" maxlength="40" value="" onkeypress="return isNumberKey3(event)" onchange="fetchCrno();">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_17 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_17 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_17}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly id="tenantContactno" name="tenantContactno" maxlength="11" value="${list.tenantContactno}" onkeypress="return isNumberKey(event)">
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

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_18 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_18 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_18}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly id="tenantWorkContactno" name="tenantWorkContactno" maxlength="11" value="${list.tenantWorkContactno}" onkeypress="return isNumberKey(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="tenantWorkContactno" value="${list.tenantWorkContactno}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="tenantWorkContactno" name="tenantWorkContactno" maxlength="11" value="" onkeypress="return isNumberKey(event)" onchange="fetchTWcono();">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_19 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_19 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_19}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly id="tenantMailid" name="tenantMailid" maxlength="35" value="${list.tenantMailid}" onchange="return validateEmail(event);">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="tenantMailid" value="${list.tenantMailid}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="tenantMailid" name="tenantMailid" maxlength="35" value="" onchange="return validateEmail(event);">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_20 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_20 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label style="margin-top:-18px;" class="control-label">${field_20}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <textarea rows="1" type="text" class="form-control" readonly style="resize: none" id="permanentAddress" name="permanentAddress" maxlength="250" value="${list.permanentAddress}">${list.permanentAddress}</textarea>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <textarea rows="1" type="text" class="form-control" style="resize: none" readonly="" id="permanentAddress" value="${list.permanentAddress}">${list.permanentAddress}</textarea>
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <textarea type="text" rows="1" placeholder="" style="resize: none" class="form-control" id="permanentAddress" name="permanentAddress" maxlength="250" value=""></textarea>
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_21 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_21 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label style="margin-top:-5px;" class="control-label">${field_21}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <textarea rows="1" type="text" class="form-control" readonly style="resize: none" id="correspondenceAddress" name="correspondenceAddress" maxlength="250" value="${list.correspondenceAddress}">${list.correspondenceAddress}</textarea>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <textarea rows="1" type="text" class="form-control" style="resize: none" readonly="" id="correspondenceAddress" value="${list.correspondenceAddress}">${list.correspondenceAddress}</textarea>
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <textarea rows="1" type="text" placeholder="" style="resize: none" class="form-control" id="correspondenceAddress" name="correspondenceAddress" maxlength="250" value=""></textarea>
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_22 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_22 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_22}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly id="postalCode" name="postalCode" maxlength="3" value="${list.postalCode}" onkeypress="return isNumberKey(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="postalCode" value="${list.postalCode}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="postalCode" name="postalCode" value="" maxlength="3" onkeypress="return isNumberKey(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_23 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_23 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_23}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly id="postboxNo" name="postboxNo" maxlength="4" value="${list.postboxNo}" onkeypress="return isNumberKey(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="postboxNo" value="${list.postboxNo}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="postboxNo" name="postboxNo" maxlength="4" value="" onkeypress="return isNumberKey(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_24 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_24 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_24}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly id="sponcerName" name="sponcerName" maxlength="50" value="${list.sponcerName}" onkeypress="return isNumberKey4(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="sponcerName" value="${list.sponcerName}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="sponcerName" name="sponcerName" maxlength="50" value="" onkeypress="return isNumberKey4(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_25 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_25 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label style="margin-top:-18px;" class="control-label">${field_25}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <textarea rows="1" type="text" class="form-control" readonly placeholder="" style="resize: none" id="sponcerAddress" name="sponcerAddress" maxlength="250" value="${list.sponcerAddress}">${list.sponcerAddress}</textarea>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <textarea rows="1" type="text" class="form-control" placeholder="" style="resize: none" readonly="" id="sponcerAddress" value="${list.sponcerAddress}">${list.sponcerAddress}</textarea>
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <textarea rows="1" style="resize: none" class="form-control" type="text" placeholder=""  id="sponcerAddress" name="sponcerAddress" maxlength="250" value=""></textarea>
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_26 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_26 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_26}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly id="companyName" name="companyName" value="${list.companyName}" maxlength="50" onkeypress="return isNumberKey4(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="companyName" value="${list.companyName}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="companyName" name="companyName" value="" maxlength="50" onkeypress="return isNumberKey4(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_27 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_27 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label style="margin-top:-18px;" class="control-label">${field_27}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <textarea rows="1" style="resize: none" readonly type="text" class="form-control" id="companyAddress" name="companyAddress" maxlength="250" value="${list.companyAddress}">${list.companyAddress}</textarea>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <textarea rows="1" style="resize: none"type="text" class="form-control" readonly="" id="companyAddress" value="${list.companyAddress}">${list.companyAddress}</textarea>
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <textarea rows="1" style="resize: none" type="text" placeholder="" class="form-control" id="companyAddress" name="companyAddress" maxlength="250" value=""></textarea>
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_28 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_28 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_28}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly id="postalCode1" name="postalCode1" value="${list.postalCode1}" maxlength="11" onkeypress="return isNumberKey(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="postalCode1" value="${list.postalCode1}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="postalCode1" name="postalCode1" value="" maxlength="11" onkeypress="return isNumberKey(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_29 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_29 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_29}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly id="postboxNo1" name="postboxNo1" maxlength="35" value="${list.postboxNo1}" onchange="return validateEmail1(event);">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="postboxNo1" value="${list.postboxNo1}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control"  id="postboxNo1" name="postboxNo1" maxlength="35" value="" onchange="return validateEmail1(event);">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_30 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_30 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_30}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly id="jointeeName1" name="jointeeName1" maxlength="50" value="${list.jointeeName1}" onkeypress="return isNumberKey4(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="jointeeName1" value="${list.jointeeName1}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="jointeeName1" name="jointeeName1" maxlength="50" value="" onkeypress="return isNumberKey4(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_31 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_31 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label style="margin-top:-18px;" class="control-label">${field_31}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <textarea rows="1" style="resize: none" readonly type="text" class="form-control" id="jointeeAddress1" name="jointeeAddress1" maxlength="250" value="${list.jointeeAddress1}">${list.jointeeAddress1}</textarea>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <textarea rows="1" style="resize: none" type="text" class="form-control" readonly="" id="jointeeAddress1" value="${list.jointeeAddress1}">${list.jointeeAddress1}</textarea>
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <textarea rows="1" style="resize: none" type="text" placeholder="" class="form-control" id="jointeeAddress1" name="jointeeAddress1" maxlength="250" value=""></textarea>
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_32 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_32 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_32}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly id="jointeeName2" name="jointeeName2" maxlength="50" value="${list.jointeeName2}" onkeypress="return isNumberKey4(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="jointeeName2" value="${list.jointeeName2}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="jointeeName2" name="jointeeName2" maxlength="50" value="" onkeypress="return isNumberKey4(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_33 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_33 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label style="margin-top:-18px;" class="control-label">${field_33}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <textarea rows="1" style="resize: none" readonly type="text" class="form-control" id="jointeeAddress2" name="jointeeAddress2" maxlength="250" value="${list.jointeeAddress2}">${list.jointeeAddress2}</textarea>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <textarea rows="1" style="resize: none" type="text" class="form-control" readonly="" id="jointeeAddress2" value="${list.jointeeAddress2}">${list.jointeeAddress2}</textarea>
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <textarea rows="1" style="resize: none" type="text" placeholder="" class="form-control" id="jointeeAddress2" name="jointeeAddress2" maxlength="250" value=""></textarea>
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_34 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_34 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label style="margin-top:-18px;" class="control-label">${field_34}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <textarea rows="1" style="resize: none" readonly type="text" class="form-control" id="remarks" name="remarks" maxlength="250" value="${list.remarks}">${list.remarks}</textarea>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <textarea rows="1" style="resize: none" type="text" class="form-control" readonly="" id="remarks" value="${list.remarks}">${list.remarks}</textarea>
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <textarea rows="1" style="resize: none" type="text" placeholder="" class="form-control" id="remarks" name="remarks" maxlength="250" value=""></textarea>
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_15 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_15 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_15}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="type">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <!--<input class=" input-file uniform_on" id="tenantAttachment" name="tenantAttachment" type="file" >-->
                                                                            <input name="pk" type="hidden" value="${type.SNo}">
                                                                            <c:if test="${not empty type.tenOrgfileName}">
                                                                                <a style="color: black" href="../tenant/tenanttAttachDownload.htm?sno=${type.SNo}" title="Click to download">
                                                                                    <i class="fa fa-file-pdf-o" style="background:#f7f9fa;border:none;margin-left:4px;margin-top:-22px;"></i>
                                                                                    ${type.tenOrgfileName}
                                                                                </a>
                                                                            </c:if> 
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:if test="${not empty type.tenOrgfileName}">
                                                                                <a style="color: black" href="../tenant/tenanttAttachDownload.htm?sno=${type.SNo}" title="Click to download">
                                                                                    <i class="fa fa-file-pdf-o" style="font-size: 15px" ></i>
                                                                                    ${type.tenOrgfileName}
                                                                                </a>
                                                                            </c:if> 
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="form-control" style="border: none">
                                                                    <input class="input-file uniform_on" id="tenantAttachment"  type="file" value="" name="tenantAttachment"  onchange="Validate(this)">
                                                                    <!--                                                            <p style="float: left"><a href="#" id="attachmentReference" class="btn btn-upload" onclick="add1();">Attach Documents</a></p><br>
                                                                                                                                <label class="control-label" style="padding-right: 20px;">(PDF,XLS,DOC,Image)</label>-->
                                                                </div>
                                                                <input name="pk" type="hidden" value="${type.SNo}">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                    </div> 
                                                </c:if>

                                                <p>&nbsp;</p>
                                                <p>&nbsp;</p>
                                            </div>

                                            <div class="box-header well" data-original-title onclick="call2();" style="cursor: pointer;">
                                                <h4><b style="padding-left: 20px;">Property Details</b></h4><c:if test="${fn:length(message) > 0}"><a class="successalert" style="margin-left: 250px;">${message}</a></c:if>
                                                </div> 
                                                <div class="box-content" id="tag2"> 

                                                <c:if test="${fieldStatus_35 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_35 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_35}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(assetDetails) > 0}">
                                                                <c:forEach items="${assetDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
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
                                                                <input type="text" placeholder="Select Property" readonly="" class="form-control" id="assetName" name="assetName" maxlength="50" value="" onkeypress="return isNumberKey3(event)" onclick="selectAssetDetails();">
                                                                <input type="hidden" id="assetCode" name="assetCode" value="">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                    </div></c:if>
                                                <c:if test="${fieldStatus_36 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_36 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_36}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(subassDetails) > 0}">
                                                                <c:forEach items="${subassDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
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

                                                    </div></c:if>
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                                        <!--<a style="color:red;">*</a>-->
                                                        <a style="color:transparent;">*</a>
                                                        <label class="control-label">Room/Unit Name</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(tenantDetails) > 0}">
                                                            <c:forEach items="${tenantDetails}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="roomName" name="roomName" maxlength="50" value="${list.extra4}">
                                                                        <input type="hidden" id="roomCode" value="${list.extra3}" >
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="roomName" value="${list.extra4}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly="" class="form-control" id="roomName"  maxlength="50" value="">
                                                            <input type="hidden" id="roomCode" value="" >
                                                        </c:otherwise>        
                                                    </c:choose>
                                                </div><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_37 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_37 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_37}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(assetDetails) > 0}">
                                                                <c:forEach items="${assetDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
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
                                                    </div></c:if>

                                                <c:if test="${fieldStatus_38 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_38 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_38}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(assetDetails) > 0}">
                                                                <c:forEach items="${assetDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly="" id="wayNo" name="wayNo" maxlength="50" value="${list.way}" onkeypress="return isNumberKey3(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="wayNo" value="${list.way}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" readonly="" class="form-control" id="wayNo" name="wayNo" maxlength="50" value="" onkeypress="return isNumberKey3(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_39 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_39 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_39}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(assetDetails) > 0}">
                                                                <c:forEach items="${assetDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly="" id="assetArea" name="assetArea" maxlength="50" value="${list.assetArea}" onkeypress="return isNumberKey3(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="assetArea" value="${list.assetArea}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" readonly="" class="form-control" id="assetArea" name="assetArea" maxlength="50" value="" onkeypress="return isNumberKey3(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_40 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_40 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_40}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(assetDetails) > 0}">
                                                                <c:forEach items="${assetDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
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

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_41 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_41 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_41}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(assetDetails) > 0}">
                                                                <c:forEach items="${assetDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly="" id="plotNo" name="plotNo" maxlength="50" value="${list.assetPlotNo}" onkeypress="return isNumberKey3(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="plotNo" value="${list.assetPlotNo}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" readonly="" class="form-control" id="plotNo" name="plotNo" maxlength="50" value="" onkeypress="return isNumberKey3(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_42 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_42 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_42}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(assetDetails) > 0}">
                                                                <c:forEach items="${assetDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly="" id="streetNo" name="streetNo" maxlength="50" value="${list.streetNo}" onkeypress="return isNumberKey3(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="streetNo" value="${list.streetNo}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" readonly="" class="form-control" id="streetNo" name="streetNo" maxlength="50" value="" onkeypress="return isNumberKey3(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_45 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_45 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_45}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(assetDetails) > 0}">
                                                                <c:forEach items="${assetDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly="" id="assetPostalCode" name="assetPostalCode" maxlength="3" value="${list.pinCode}" onkeypress="return isNumberKey(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="assetPostalCode" value="${list.pinCode}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" readonly="" class="form-control" id="assetPostalCode" name="assetPostalCode" maxlength="3" value="" onkeypress="return isNumberKey(event)">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                    </div></c:if>
                                                <c:if test="${fieldStatus_46 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_46 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_46}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(assetDetails) > 0}">
                                                                <c:forEach items="${assetDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly="" id="assetPostboxNo" name="assetPostboxNo" maxlength="4" value="${list.poBox}" onkeypress="return isNumberKey(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="assetPostboxNo" value="${list.poBox}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" readonly="" class="form-control" id="assetPostboxNo" name="assetPostboxNo" maxlength="4" value="" onkeypress="return isNumberKey(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <%--<c:if test="${fieldStatus_43 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_43 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_43}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(subassDetails) > 0}">
                                                                <c:forEach items="${subassDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly="" id="waterBillno" name="waterBillno" maxlength="50" value="${list.utilityNo1}" onkeypress="return isNumberKey(event)">
                                                                            <input type="hidden" id="actualRent" name="actualRent" value="${list.actualRent}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="waterBillno" value="${list.utilityNo1}">
                                                                            <input type="hidden" id="actualRent" name="actualRent" value="${list.actualRent}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" readonly="" class="form-control" id="waterBillno" name="waterBillno" maxlength="50" value="" onkeypress="return isNumberKey(event)">
                                                                <input type="hidden" id="actualRent" name="actualRent" value="">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_44 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_44 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_44}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(subassDetails) > 0}">
                                                                <c:forEach items="${subassDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly="" id="electricityBillno" name="electricityBillno" maxlength="50" value="${list.utilityNo2}" onkeypress="return isNumberKey(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="electricityBillno" value="${list.utilityNo2}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" readonly="" class="form-control" id="electricityBillno" name="electricityBillno" maxlength="50" value="" onkeypress="return isNumberKey(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>--%>
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
                                            <div class="box-header well" data-original-title onclick="call3();" style="cursor: pointer;">
                                                <h4><b style="padding-left: 20px;">Contract Period</b></h4><c:if test="${fn:length(message) > 0}"><a class="successalert" style="margin-left: 250px;">${message}</a></c:if>
                                                </div> 
                                                <div class="box-content" id="tag3"> 
                                                <c:if test="${fieldStatus_47 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_47 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_47}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(contractNamee) > 0}">
                                                                <c:forEach items="${contractNamee}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly="" id="contractName" name="contractName" maxlength="50" value="${list.contractTitle}" onkeypress="return isNumberKey3(event)">
                                                                            <input type="hidden" id="contractPeriod" name="contractPeriod" value="${list.contractCode}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="contractName" value="${list.contractTitle}">
                                                                            <input type="hidden" id="contractPeriod" name="contractPeriod" value="${list.contractCode}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="Select Contract" readonly="" class="form-control" id="contractName" name="contractName" maxlength="50" value=""  onclick="selectContractCode();" onblur="return getContAttach();">
                                                                <input type="hidden" id="contSno" name="contSno" value="">
                                                                <input type="hidden" id="contractPeriod" name="contractPeriod" value="">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_48 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_48 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_48}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(contractNamee) > 0}">
                                                                <c:forEach items="${contractNamee}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly="" id="startsFrom" name="startsFrom" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.contStartDate}"/>">
                                                                            <input type="hidden" id="contSno" name="contSno" value="">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="startsFrom" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.contStartDate}"/>">
                                                                            <input type="hidden" id="contSno" name="contSno" value="">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="Select Date" class="form-control" readonly id="startsFrom" name="startsFrom" value="">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_49 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_49 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_49}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(contractNamee) > 0}">
                                                                <c:forEach items="${contractNamee}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" placeholder="Select Date" readonly="" id="endsTo" name="endsTo" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.contEndDate}"/>">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="endsTo" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.contEndDate}"/>">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="Select Date" class="form-control" readonly id="endsTo" name="endsTo" value="">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_55 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_55 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_55}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly="" id="contractSigningDate" name="contractSigningDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.contractSigningDate}"/>" onchange="dateCheckCondition();">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="contractSigningDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.contractSigningDate}"/>">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="Select Date" class="form-control" readonly id="contractSigningDate" name="contractSigningDate" value="" onclick="javascript:NewCssCal('contractSigningDate', 'ddMMMyyyy', '', '', '', '', '')" onchange="dateCheckCondition();">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_56 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_56 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_56}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly="" id="crIdNo" name="crIdNo" value="${list.crIdNo}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="crIdNo" value="${list.crIdNo}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" name="crIdNo" id="crIdNo">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                    </div></c:if> 
                                                <c:if test="${action eq 'edit' || action eq 'view' }">
                                                    <c:if test="${fieldStatus_50 eq 'y'}">
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                            <c:if test="${mand_status_50 eq 'required'}">
                                                                <a style="color:red;">*</a>
                                                            </c:if><a style="color:transparent;">*</a>
                                                            <label class="control-label">${field_50}</label>
                                                            <div style="overflow: scroll;border:none;margin-left:139px;margin-top:-22px;height: 150px;width:168px">
                                                                <table><tbody>
                                                                        <c:choose>
                                                                            <c:when test="${fn:length(contDocument) > 0}">
                                                                                <c:forEach items="${contDocument}" var="attach">
                                                                                    <c:choose>
                                                                                        <c:when test="${action eq 'edit'}">
                                                                                            <tr><td><c:if test="${not empty attach.filename}">
                                                                                                        <a href="../insurance/contractAttachDownload.htm?sno=${attach.sno}&contractCode=${attach.contractCode}" class="fa fa-file-pdf-o" style="color: #000">${attach.filename}
                                                                                                            <span title="${attach.filename}"></span></a>
                                                                                                        </c:if>
                                                                                                        <c:if test="${empty attach.filename}">N/A</c:if> 
                                                                                                    </td></tr>

                                                                                        </c:when>
                                                                                        <c:otherwise>
                                                                                            <tr><td><c:if test="${not empty attach.filename}">
                                                                                                        <a href="../insurance/contractAttachDownload.htm?sno=${attach.sno}&contractCode=${attach.contractCode}" class="fa fa-file-pdf-o" style="color: #000">${attach.filename}
                                                                                                            <span title="${attach.filename}"></span></a>
                                                                                                        </c:if>
                                                                                                        <c:if test="${empty attach.filename}">N/A</c:if> 
                                                                                                    </td></tr>

                                                                                        </c:otherwise> 
                                                                                    </c:choose>
                                                                                </c:forEach>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <c:if test="${empty attach.filename}">Not Available</c:if>                                                   
                                                                            </c:otherwise>   
                                                                        </c:choose></tbody></table>
                                                            </div> 
                                                        </div> 
                                                    </c:if>
                                                </c:if>
                                                <p>&nbsp;</p>

                                            </div>

                                            <div class="box-header well" data-original-title onclick="call4();" style="cursor: pointer;">
                                                <h4><b style="padding-left: 20px;">Billing Cycle Details</b></h4><c:if test="${fn:length(message) > 0}"><a class="successalert" style="margin-left: 250px;">${message}</a></c:if>
                                                </div> 
                                                <div class="box-content" id="tag4"> 
                                                <c:if test="${fieldStatus_51 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_51 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_51}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text"  readonly class="form-control" id="billingCycle" name="billingCycle" value="${list.billingCycle}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="billingCycle" value="${list.billingCycle}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <!--<input type="text" placeholder="" class="form-control" id="billingCycle" name="billingCycle" value="" Monthly, quarterly, Half yearly, yearly>-->
                                                                <select id="billingCycle" name="billingCycle" class="form-control">
                                                                    <option value="" selected>Select your option</option>
                                                                    <option value="Monthly">Monthly</option>
                                                                    <option value="Quarterly">Quarterly</option>
                                                                    <option value="Half Yearly">Half Yearly</option>
                                                                    <option value="Yearly">Yearly</option>
                                                                </select>
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_52 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_52 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_52}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" id="advanceAmount" name="advanceAmount" maxlength="14" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.advanceAmount}" />" onkeypress="return check_digit(event, this, 10, 3);">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="advanceAmount" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.advanceAmount}" />">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="advanceAmount" name="advanceAmount" maxlength="14" value="" onkeypress="return check_digit(event, this, 10, 3);">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_53 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_53 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_53}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" placeholder="Select Date" class="form-control" readonly="" id="dueDate" name="dueDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.dueDate}"/>"  onclick="javascript:NewCssCal('dueDate', 'ddMMMyyyy', '', '', '', '', '')" onchange="dateCheckCondition();">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="dueDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.dueDate}"/>">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="Select Date" class="form-control" readonly  id="dueDate" name="dueDate" value="" onclick="javascript:NewCssCal('dueDate', 'ddMMMyyyy', '', '', '', '', '')" onchange="dateCheckCondition();">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_57 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_57 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_57}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" id="extra2" name="extra2" maxlength=14" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.extra2}" />" onkeypress="return check_digit(event, this, 10, 3);" onchange="rentCalc();">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" value="${list.extra2}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="extra2" name="extra2">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                    </div></c:if>
                                                <c:if test="${fieldStatus_54 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_54 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_54}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" id="totalAmount" readonly=""  name="totalAmount" maxlength=14" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.totalAmount}" />" onkeypress="return check_digit(event, this, 10, 3);" onchange="rentCalc();">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="totalAmount" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.totalAmount}" />">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="totalAmount" name="totalAmount" maxlength="14" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value=""/>" onkeypress="return check_digit(event, this, 10, 3);" onchange="rentCalc();">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>

                                                    <!--Extra buffer fields-->

                                                    <p>&nbsp;</p>
                                                <c:if test="${fieldStatus_58 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_58 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_58}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly="" id="extra3" name="extra3" value="${list.extra3}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="extra3" value="${list.extra3}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="extra3" name="extra3">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                    </div></c:if>
                                                <c:if test="${fieldStatus_59 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_59 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_59}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly="" id="extra4" name="extra4" value="${list.extra4}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="extra4" value="${list.extra4}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="extra4"  name="extra4">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                    </div></c:if>
                                                <c:if test="${fieldStatus_60 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_60 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_60}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly="" id="extra5"  name="extra5" value="${list.extra5}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="extra5" value="${list.extra5}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="extra5" name="extra5">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                    </div></c:if>
                                                </div>
                                                <div style="display:none">
                                                <c:if test="${action eq 'edit' || action eq 'Recheck' }">

                                                    <div class="box-header well" data-original-title onclick="call5();" style="cursor: pointer;">
                                                        <h4><b style="padding-left: 20px;">Annual Maintenance Contract</b></h4><c:if test="${fn:length(message) > 0}"><a class="successalert" style="margin-left: 250px;">${message}</a></c:if>
                                                        </div> 
                                                        <div class="box-content" id="tag5"> 
                                                        <c:if test="${fieldStatus_61 eq 'y'}">
                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                                <c:if test="${mand_status_61 eq 'required'}">
                                                                    <a style="color:red;">*</a>
                                                                </c:if><a style="color:transparent;">*</a>
                                                                <label class="control-label">${field_61}</label>
                                                                <c:choose>
                                                                    <c:when test="${fn:length(tenantDetails) > 0}">
                                                                        <c:forEach items="${tenantDetails}" var="list">
                                                                            <c:choose>
                                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                                    <input type="text" class="form-control" readonly="" ${mand_status_61}  id="amctenantName" name="amctenantName" maxlength="10" value="${list.tenantFname}${list.tenantLname}" >
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <input type="text" class="form-control" readonly="" id="amctenantName" value="${list.tenantFname}${list.tenantLname}">
                                                                                </c:otherwise> 
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:when>
                                                                    <c:otherwise>                                                    
                                                                        <input type="text" placeholder="" readonly class="form-control" ${mand_status_61} id="amctenantName" name="amctenantName" maxlength="10" value="" >
                                                                    </c:otherwise>        
                                                                </c:choose>

                                                            </div></c:if>
                                                        <c:if test="${fieldStatus_62 eq 'y'}">
                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                                <c:if test="${mand_status_62 eq 'required'}">
                                                                    <a style="color:red;">*</a>
                                                                </c:if><a style="color:transparent;">*</a>
                                                                <label class="control-label">${field_62}</label>
                                                                <c:choose>
                                                                    <c:when test="${fn:length(tenantDetails) > 0}">
                                                                        <c:forEach items="${tenantDetails}" var="list">
                                                                            <c:choose>
                                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                                    <input type="text" class="form-control" placeholder="Select Date" readonly="" ${mand_status_62}  id="startDate" name="startDate" maxlength="10" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.startDate}"/>" onclick="javascript:NewCssCal('startDate', 'ddMMMyyyy', '', '', '', '', '')" >
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <input type="text" class="form-control" readonly="" id="startDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.startDate}"/>">
                                                                                </c:otherwise> 
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:when>
                                                                    <c:otherwise>                                                    
                                                                        <input type="text" placeholder="" readonly class="form-control" ${mand_status_62} id="startDate" name="startDate" maxlength="10" value="" onclick="javascript:NewCssCal('dueDate', 'ddMMMyyyy', '', '', '', '', '')">
                                                                    </c:otherwise>        
                                                                </c:choose>

                                                            </div></c:if>
                                                        <c:if test="${fieldStatus_63 eq 'y'}">
                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                                <c:if test="${mand_status_63 eq 'required'}">
                                                                    <a style="color:red;">*</a>
                                                                </c:if><a style="color:transparent;">*</a>
                                                                <label class="control-label">${field_63}</label>
                                                                <c:choose>
                                                                    <c:when test="${fn:length(tenantDetails) > 0}">
                                                                        <c:forEach items="${tenantDetails}" var="list">
                                                                            <c:choose>
                                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                                    <input type="text" class="form-control" placeholder="Select Date" readonly="" ${mand_status_63}  id="endDate" name="endDate" maxlength="10" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.endDate}"/>" onclick="javascript:NewCssCal('endDate', 'ddMMMyyyy', '', '', '', '', '')" >
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <input type="text" class="form-control" readonly="" id="endDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.endDate}"/>">
                                                                                </c:otherwise> 
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:when>
                                                                    <c:otherwise>                                                    
                                                                        <input type="text" placeholder="" readonly class="form-control" ${mand_status_63} id="endDate" name="endDate" maxlength="10" value="" onclick="javascript:NewCssCal('dueDate', 'ddMMMyyyy', '', '', '', '', '')">
                                                                    </c:otherwise>        
                                                                </c:choose>

                                                            </div></c:if>
                                                            <p>&nbsp;</p>

                                                        <c:if test="${fieldStatus_64 eq 'y'}">
                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                                <c:if test="${mand_status_64 eq 'required'}">
                                                                    <a style="color:red;">*</a>
                                                                </c:if><a style="color:transparent;">*</a>
                                                                <label class="control-label">${field_64}</label>
                                                                <c:choose>
                                                                    <c:when test="${fn:length(tenantDetails) > 0}">
                                                                        <c:forEach items="${tenantDetails}" var="list">
                                                                            <c:choose>
                                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                                    <input type="text" class="form-control" readonly="" ${mand_status_64}  id="percentage" name="percentage" maxlength="10" value="${list.percentage}" onchange="return calpercentage();" onkeypress="return isNumberKey(event)">
                                                                                    <input type="hidden" class="form-control" ${mand_status_64}  id="percentage1" name="percentage1" maxlength="10" value="${list.percentage}" >
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <input type="text" class="form-control" readonly="" id="percentage" value="${list.percentage}">
                                                                                </c:otherwise> 
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:when>
                                                                    <c:otherwise>                                                    
                                                                        <input type="text" placeholder="" readonly class="form-control" ${mand_status_64} id="percentage" name="percentage" maxlength="10" value=" " onkeypress="return isNumberKey(event)">
                                                                    </c:otherwise>        
                                                                </c:choose>
                                                            </div></c:if>                                      
                                                        <c:if test="${fieldStatus_65 eq 'y'}">
                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                                <c:if test="${mand_status_65 eq 'required'}">
                                                                    <a style="color:red;">*</a>
                                                                </c:if><a style="color:transparent;">*</a>
                                                                <label class="control-label">${field_65}</label>
                                                                <c:choose>
                                                                    <c:when test="${fn:length(tenantDetails) > 0}">
                                                                        <c:forEach items="${tenantDetails}" var="list">
                                                                            <c:choose>
                                                                                <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                                    <input type="text" class="form-control" readonly="" ${mand_status_65}  id="amcamount" name="amcamount" maxlength="10" value="${list.amcamount}" onkeypress="return isNumberKey(event)">
                                                                                    <input type="hidden" class="form-control" ${mand_status_65}  id="amcamount1" name="amcamount1" maxlength="10" value="${list.amcamount}" >
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <input type="text" class="form-control" readonly="" id="amcamount" value="${list.amcamount}">
                                                                                </c:otherwise> 
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:when>
                                                                    <c:otherwise>                                                    
                                                                        <input type="text" placeholder="" readonly class="form-control" ${mand_status_65} id="amcamount" name="amcamount" maxlength="10" value="" onkeypress="return isNumberKey(event)">
                                                                    </c:otherwise>        
                                                                </c:choose>
                                                            </div></c:if>   
                                                            <p>&nbsp;</p>
                                                        </div>                                                    

                                                </c:if>
                                            </div>
                                            <p>&nbsp;</p>
                                            <table id="" class="table table-striped responsive-utilities jambo_table" style="">
                                                <thead >
                                                    <tr class="headings">     
                                                        <th >Role</th>
                                                        <!--<th >Name</th>-->
                                                        <th >Date</th>
                                                        <th >Remarks</th>
                                                    </tr>      
                                                </thead>        
                                                <tbody> 
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:set var="cforemarks" value="${list.cforemarks}" /> 
                                                        <c:set var="gfcremarks" value="${list.gfcremarks}" /> 
                                                        <c:if test="${gfcremarks ne null}">
                                                            <tr>
                                                                <td class="center" style="text-align: left;"><b>GFC</b></td>
                                                                <!--<td class="center" style="text-align: left;">${list.userId}</td>-->
                                                                <td class="center" style="text-align: left;"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${list.lastmodifiedDate}" /></td>
                                                                <td class="center" style="text-align: left;">${gfcremarks}</td>
                                                            </tr>
                                                        </c:if>
                                                        <c:if test="${cforemarks ne null}">
                                                            <tr>
                                                                <td class="center" style="text-align: left;"><b>CFO</b></td>
                                                                <!--<td class="center" style="text-align: left;">${list.userId}</td>-->
                                                                <td class="center" style="text-align: left;"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${list.lastmodifiedDate}" /></td>
                                                                <td class="center" style="text-align: left;">${cforemarks}</td>
                                                            </tr>
                                                        </c:if>

                                                    </c:forEach> 
                                                </tbody>
                                            </table>         
                                            <p>&nbsp;</p>
                                            <c:if test="${action eq 'edit'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <a style="color:red;">*</a>
                                                    <label class="control-label">Remarks</label>                                       
                                                    <textarea  class="form-control" required="" rows="1" type="text" id="reviewerComments" style="resize: none;" name="reviewerComments" maxlength="120" ></textarea> 
                                                </div></c:if>
                                                <p>&nbsp;</p>

                                            <c:if test="${action ne 'view'}">
                                                <!--                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">-->
                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                    <button type="submit" class="btn btn-primary" style="">Approve</button>
                                                    <button type="button" class="btn btn-warning" style="" onclick="reject('${tenantCode}', 'Rejected', '${subAstno}');">Reject</button>
                                                    <!--<button type="button" class="btn btn-warning" onclick="recheck('${tenantCode}', 'Recheck');">Recheck</button>-->
                                                    <a href="../tenant/tenantDetailsAppList1.htm" class="btn btn-danger">Cancel</a>
                                                </div>
                                                <!--</div>--> 
                                            </c:if>
                                        </c:if>

                                        <c:if test="${action eq 'edit1' || action eq 'view1'}">


                                            <div class="box-header well" data-original-title onclick="call();" style="cursor: pointer;">
                                                <h4><b style="padding-left: 20px;">Landlord Details (First Party)</b></h4><c:if test="${fn:length(message) > 0}"><a class="successalert" style="margin-left: 250px;">${message}</a></c:if>
                                                </div> 
                                                <div class="box-content" id="tag"> 

                                                <c:if test="${fieldStatus_1 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_1 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_1}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:set var="tenantCode" value="${list.tenantCode}"></c:set>
                                                                    <c:set var="subAstno" value="${list.subclassifiedAstno}"></c:set>
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control"  readonly="" id="llId" name="llId" value="${list.llId}">
                                                                            <input type="hidden" name="pk1" value="${list.SNo}">
                                                                            <input type="hidden" name="action" value="${action}">
                                                                            <input type="hidden" name="status" value="${list.status}">
                                                                            <input type="hidden" name="tenantCode" value="${list.tenantCode}">
                                                                            <input type="hidden" id="assetCode" name="assetCode" value="${list.assetName}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" id="llId" readonly="" value="${list.llId}">
                                                                            <input type="hidden" id="assetCode" name="assetCode" value="${list.assetName}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="Select Landlord" readonly class="form-control" id="llId" name="llId" value="" onclick="selectLandLord();" onblur="return getLlAttach();">
                                                                <input type="hidden" id="llSno" name="llSno" value="">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_2 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_2 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_2}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(landLordDetails) > 0}">
                                                                <c:forEach items="${landLordDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control"  readonly="" id="llName" name="llName" value="${list.landlordName}">
                                                                            <input type="hidden" id="llSno" name="llSno" value="">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="llName" value="${list.landlordName}">
                                                                            <input type="hidden" id="llSno" name="llSno" value="">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" placeholder="" readonly class="form-control" id="llName" name="llName" value="">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                    </div></c:if>
                                                <c:if test="${fieldStatus_3 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_3 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_3}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(landLordDetails) > 0}">
                                                                <c:forEach items="${landLordDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control"  readonly="" id="llCategory" name="llCategory" value="${list.landlordCategory}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="llCategory" value="${list.landlordCategory}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" readonly class="form-control"  id="llCategory" name="llCategory" value="">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_4 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_4 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_4}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(landLordDetails) > 0}">
                                                                <c:forEach items="${landLordDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control"  readonly="" id="llCrNo" name="llCrNo" maxlength="40" value="${list.crIdNo}" onkeypress="return isNumberKey3(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="llCrNo" value="${list.crIdNo}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" readonly class="form-control"  id="llCrNo" name="llCrNo" maxlength="40" value="" onkeypress="return isNumberKey3(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_5 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_5 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_5}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(landLordDetails) > 0}">
                                                                <c:forEach items="${landLordDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly="" id="llContactno" name="llContactno" value="${list.landlordContactno}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="llContactno" value="${list.landlordContactno}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" readonly class="form-control"  id="llContactno" name="llContactno" value="">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_6 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_6 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_6}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(landLordDetails) > 0}">
                                                                <c:forEach items="${landLordDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly="" id="llWorkContactno" name="llWorkContactno" value="${list.landlordWorkContactno}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="llWorkContactno" value="${list.landlordWorkContactno}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" readonly class="form-control"  id="llWorkContactno" name="llWorkContactno" value="">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_7 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_7 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_7}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(landLordDetails) > 0}">
                                                                <c:forEach items="${landLordDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly="" id="llMailid" name="llMailid" value="${list.landlordEmailid}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="llMailid" value="${list.landlordEmailid}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" readonly class="form-control" id="llMailid" name="llMailid" value="">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>

                                                <c:if test="${action eq 'edit1' || action eq 'view1' }">
                                                    <c:if test="${fieldStatus_8 eq 'y'}">
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                            <c:if test="${mand_status_8 eq 'required'}">
                                                                <a style="color:red;">*</a>
                                                            </c:if><a style="color:transparent;">*</a>
                                                            <label class="control-label">${field_8}</label>
                                                            <div style="overflow: scroll;border:none;margin-left:139px;margin-top:-22px;height: 150px;width:168px">
                                                                <table><tbody>
                                                                        <c:choose>
                                                                            <c:when test="${fn:length(landlordDocuments) > 0}">
                                                                                <c:forEach items="${landlordDocuments}" var="attach">
                                                                                    <c:choose>
                                                                                        <c:when test="${action eq 'edit1'}">
                                                                                            <tr><td>
                                                                                                    <c:if test="${not empty attach.filename}">
                                                                                                        <a   href="../master/landlordAttachDownload.htm?sno=${attach.sno}" class="fa fa-file-pdf-o" style="color: #000">${attach.filename}
                                                                                                            <span title="${attach.filename}"></span><br/></a>
                                                                                                        </c:if>
                                                                                                        <c:if test="${empty attach.filename}">N/A</c:if></td></tr>
                                                                                                </c:when>
                                                                                                <c:otherwise>
                                                                                            <tr><td>
                                                                                                    <c:if test="${not empty attach.filename}">
                                                                                                        <a   href="../master/landlordAttachDownload.htm?sno=${attach.sno}" class="fa fa-file-pdf-o" style="color: #000">${attach.filename}
                                                                                                            <span title="${attach.filename}"></span></a>
                                                                                                        </c:if>
                                                                                                        <c:if test="${empty attach.filename}">N/A</c:if>  </td></tr>
                                                                                                </c:otherwise> 
                                                                                            </c:choose>
                                                                                        </c:forEach>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <c:if test="${empty attach.filename}">Not Available</c:if>
                                                                            </c:otherwise>        
                                                                        </c:choose></tbody></table>
                                                            </div> 
                                                        </div> 
                                                    </c:if>
                                                </c:if>

                                                <p>&nbsp;</p>
                                                <p>&nbsp;</p>
                                                <p>&nbsp;</p>
                                            </div>

                                            <div class="box-header well" data-original-title onclick="call1();" style="cursor: pointer;">
                                                <h4><b style="padding-left: 20px;">Tenant Details (Second Party)</b></h4><c:if test="${fn:length(message) > 0}"><a class="successalert" style="margin-left: 250px;">${message}</a></c:if>
                                                </div> 
                                                <div class="box-content" id="tag1"> 

                                                <c:if test="${fieldStatus_9 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_9 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_9}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control"  readonly id="tenantType" name="tenantType" value="${list.tenantType}">
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

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_10 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_10 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_10}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
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

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_11 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_11 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_11}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
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

                                                    </div></c:if><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_12 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_12 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_12}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly id="tenantFname" name="tenantFname" maxlength="50" value="${list.tenantFname}" onkeypress="return isNumberKey4(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="tenantFname" value="${list.tenantFname}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="tenantFname" name="tenantFname" maxlength="50" value="" onkeypress="return isNumberKey4(event)" onchange="fetchTName();">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_13 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_13 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_13}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly id="tenantLname" name="tenantLname" maxlength="50" value="${list.tenantLname}" onkeypress="return isNumberKey4(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="tenantLname" value="${list.tenantLname}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="tenantLname" name="tenantLname" maxlength="50" value="" onkeypress="return isNumberKey4(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_14 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_14 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_14}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly="" id="tenantCitizenship" name="tenantCitizenship" value="${list.tenantCitizenship}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="tenantCitizenship" value="${list.tenantCitizenship}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="tenantCitizenship" name="tenantCitizenship" value="" maxlength="50">
                                                                <!--                                                            <select id="tenantCitizenship" name="tenantCitizenship"  class="form-control" >
                                                                                                                                <option value="" selected>Select your option</option>
                                                                                                                                <option value="Nizwa">Nizwa</option>
                                                                                                                                <option value="Sohar">Sohar</option>
                                                                                                                                <option value="Haima">Haima</option>
                                                                                                                                <option value="Sur">Sur</option>
                                                                                                                                <option value="Ibri">Ibri</option>
                                                                                                                                <option value="Muscat">Muscat</option>
                                                                                                                                <option value="Khasab">Khasab</option>
                                                                                                                                <option value="Salalah">Salalah</option>
                                                                                                                                <option value="Buraymi">Buraymi</option>
                                                                                                                            </select>-->
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if><p>&nbsp;</p>

                                                <c:if test="${fieldStatus_16 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_16 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_16}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly id="tenantCrNo" name="tenantCrNo" maxlength="40" value="${list.tenantCrNo}" onkeypress="return isNumberKey3(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="tenantCrNo" value="${list.tenantCrNo}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="tenantCrNo" name="tenantCrNo" maxlength="40" value="" onkeypress="return isNumberKey3(event)" onchange="fetchCrno();">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_17 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_17 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_17}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly id="tenantContactno" name="tenantContactno" maxlength="11" value="${list.tenantContactno}" onkeypress="return isNumberKey(event)">
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

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_18 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_18 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_18}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly id="tenantWorkContactno" name="tenantWorkContactno" maxlength="11" value="${list.tenantWorkContactno}" onkeypress="return isNumberKey(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="tenantWorkContactno" value="${list.tenantWorkContactno}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="tenantWorkContactno" name="tenantWorkContactno" maxlength="11" value="" onkeypress="return isNumberKey(event)" onchange="fetchTWcono();">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_19 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_19 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_19}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly id="tenantMailid" name="tenantMailid" maxlength="35" value="${list.tenantMailid}" onchange="return validateEmail(event);">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="tenantMailid" value="${list.tenantMailid}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="tenantMailid" name="tenantMailid" maxlength="35" value="" onchange="return validateEmail(event);">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_20 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_20 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label style="margin-top:-18px;" class="control-label">${field_20}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <textarea rows="1" type="text" class="form-control" readonly style="resize: none" id="permanentAddress" name="permanentAddress" maxlength="250" value="${list.permanentAddress}">${list.permanentAddress}</textarea>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <textarea rows="1" type="text" class="form-control" style="resize: none" readonly="" id="permanentAddress" value="${list.permanentAddress}">${list.permanentAddress}</textarea>
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <textarea type="text" rows="1" placeholder="" style="resize: none" class="form-control" id="permanentAddress" name="permanentAddress" maxlength="250" value=""></textarea>
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_21 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_21 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label style="margin-top:-5px;" class="control-label">${field_21}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <textarea rows="1" type="text" class="form-control" readonly style="resize: none" id="correspondenceAddress" name="correspondenceAddress" maxlength="250" value="${list.correspondenceAddress}">${list.correspondenceAddress}</textarea>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <textarea rows="1" type="text" class="form-control" style="resize: none" readonly="" id="correspondenceAddress" value="${list.correspondenceAddress}">${list.correspondenceAddress}</textarea>
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <textarea rows="1" type="text" placeholder="" style="resize: none" class="form-control" id="correspondenceAddress" name="correspondenceAddress" maxlength="250" value=""></textarea>
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_22 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_22 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_22}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly id="postalCode" name="postalCode" maxlength="3" value="${list.postalCode}" onkeypress="return isNumberKey(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="postalCode" value="${list.postalCode}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="postalCode" name="postalCode" value="" maxlength="3" onkeypress="return isNumberKey(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_23 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_23 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_23}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly id="postboxNo" name="postboxNo" maxlength="4" value="${list.postboxNo}" onkeypress="return isNumberKey(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="postboxNo" value="${list.postboxNo}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="postboxNo" name="postboxNo" maxlength="4" value="" onkeypress="return isNumberKey(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_24 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_24 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_24}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly id="sponcerName" name="sponcerName" maxlength="50" value="${list.sponcerName}" onkeypress="return isNumberKey4(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="sponcerName" value="${list.sponcerName}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="sponcerName" name="sponcerName" maxlength="50" value="" onkeypress="return isNumberKey4(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_25 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_25 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label style="margin-top:-18px;" class="control-label">${field_25}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <textarea rows="1" type="text" class="form-control" readonly placeholder="" style="resize: none" id="sponcerAddress" name="sponcerAddress" maxlength="250" value="${list.sponcerAddress}">${list.sponcerAddress}</textarea>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <textarea rows="1" type="text" class="form-control" placeholder="" style="resize: none" readonly="" id="sponcerAddress" value="${list.sponcerAddress}">${list.sponcerAddress}</textarea>
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <textarea rows="1" style="resize: none" class="form-control" type="text" placeholder=""  id="sponcerAddress" name="sponcerAddress" maxlength="250" value=""></textarea>
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_26 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_26 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_26}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly id="companyName" name="companyName" value="${list.companyName}" maxlength="50" onkeypress="return isNumberKey4(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="companyName" value="${list.companyName}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="companyName" name="companyName" value="" maxlength="50" onkeypress="return isNumberKey4(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_27 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_27 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label style="margin-top:-18px;" class="control-label">${field_27}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <textarea rows="1" style="resize: none" readonly type="text" class="form-control" id="companyAddress" name="companyAddress" maxlength="250" value="${list.companyAddress}">${list.companyAddress}</textarea>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <textarea rows="1" style="resize: none"type="text" class="form-control" readonly="" id="companyAddress" value="${list.companyAddress}">${list.companyAddress}</textarea>
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <textarea rows="1" style="resize: none" type="text" placeholder="" class="form-control" id="companyAddress" name="companyAddress" maxlength="250" value=""></textarea>
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_28 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_28 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_28}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly id="postalCode1" name="postalCode1" value="${list.postalCode1}" maxlength="11" onkeypress="return isNumberKey(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="postalCode1" value="${list.postalCode1}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="postalCode1" name="postalCode1" value="" maxlength="11" onkeypress="return isNumberKey(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_29 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_29 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_29}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly id="postboxNo1" name="postboxNo1" maxlength="35" value="${list.postboxNo1}" onchange="return validateEmail1(event);">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="postboxNo1" value="${list.postboxNo1}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control"  id="postboxNo1" name="postboxNo1" maxlength="35" value="" onchange="return validateEmail1(event);">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_30 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_30 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_30}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly id="jointeeName1" name="jointeeName1" maxlength="50" value="${list.jointeeName1}" onkeypress="return isNumberKey4(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="jointeeName1" value="${list.jointeeName1}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="jointeeName1" name="jointeeName1" maxlength="50" value="" onkeypress="return isNumberKey4(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_31 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_31 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label style="margin-top:-18px;" class="control-label">${field_31}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <textarea rows="1" style="resize: none" readonly type="text" class="form-control" id="jointeeAddress1" name="jointeeAddress1" maxlength="250" value="${list.jointeeAddress1}">${list.jointeeAddress1}</textarea>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <textarea rows="1" style="resize: none" type="text" class="form-control" readonly="" id="jointeeAddress1" value="${list.jointeeAddress1}">${list.jointeeAddress1}</textarea>
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <textarea rows="1" style="resize: none" type="text" placeholder="" class="form-control" id="jointeeAddress1" name="jointeeAddress1" maxlength="250" value=""></textarea>
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_32 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_32 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_32}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly id="jointeeName2" name="jointeeName2" maxlength="50" value="${list.jointeeName2}" onkeypress="return isNumberKey4(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="jointeeName2" value="${list.jointeeName2}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="jointeeName2" name="jointeeName2" maxlength="50" value="" onkeypress="return isNumberKey4(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_33 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_33 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label style="margin-top:-18px;" class="control-label">${field_33}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <textarea rows="1" style="resize: none" readonly type="text" class="form-control" id="jointeeAddress2" name="jointeeAddress2" maxlength="250" value="${list.jointeeAddress2}">${list.jointeeAddress2}</textarea>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <textarea rows="1" style="resize: none" type="text" class="form-control" readonly="" id="jointeeAddress2" value="${list.jointeeAddress2}">${list.jointeeAddress2}</textarea>
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <textarea rows="1" style="resize: none" type="text" placeholder="" class="form-control" id="jointeeAddress2" name="jointeeAddress2" maxlength="250" value=""></textarea>
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_34 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_34 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label style="margin-top:-18px;" class="control-label">${field_34}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <textarea rows="1" style="resize: none" readonly type="text" class="form-control" id="remarks" name="remarks" maxlength="250" value="${list.remarks}">${list.remarks}</textarea>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <textarea rows="1" style="resize: none" type="text" class="form-control" readonly="" id="remarks" value="${list.remarks}">${list.remarks}</textarea>
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <textarea rows="1" style="resize: none" type="text" placeholder="" class="form-control" id="remarks" name="remarks" maxlength="250" value=""></textarea>
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_15 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_15 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_15}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="type">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <!--<input class=" input-file uniform_on" id="tenantAttachment" name="tenantAttachment" type="file" >-->
                                                                            <input name="pk" type="hidden" value="${type.SNo}">
                                                                            <input name="tenantAttachment" type="hidden" value="${type.tenantAttachment}">

                                                                            <c:if test="${not empty type.tenOrgfileName}">
                                                                                <a style="color: black" href="../tenant/tenanttAttachDownload1.htm?sno=${type.SNo}" title="Click to download">
                                                                                    <i class="fa fa-file-pdf-o" style="background:#f7f9fa;border:none;margin-left:4px;margin-top:-22px;"></i>
                                                                                    ${type.tenOrgfileName}
                                                                                </a>
                                                                            </c:if> 
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:if test="${not empty type.tenOrgfileName}">
                                                                                <a style="color: black" href="../tenant/tenanttAttachDownload1.htm?sno=${type.SNo}" title="Click to download">
                                                                                    <i class="fa fa-file-pdf-o" style="font-size: 15px" ></i>
                                                                                    ${type.tenOrgfileName}
                                                                                </a>
                                                                            </c:if> 
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="form-control" style="border: none">
                                                                    <input class="input-file uniform_on" id="tenantAttachment"  type="file" value="" name="tenantAttachment"  onchange="Validate(this)">
                                                                    <!--                                                            <p style="float: left"><a href="#" id="attachmentReference" class="btn btn-upload" onclick="add1();">Attach Documents</a></p><br>
                                                                                                                                <label class="control-label" style="padding-right: 20px;">(PDF,XLS,DOC,Image)</label>-->
                                                                </div>
                                                                <input name="pk" type="hidden" value="${type.SNo}">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                    </div> 
                                                </c:if>

                                                <p>&nbsp;</p>
                                                <p>&nbsp;</p>
                                            </div>

                                            <div class="box-header well" data-original-title onclick="call2();" style="cursor: pointer;">
                                                <h4><b style="padding-left: 20px;">Property Details</b></h4><c:if test="${fn:length(message) > 0}"><a class="successalert" style="margin-left: 250px;">${message}</a></c:if>
                                                </div> 
                                                <div class="box-content" id="tag2"> 

                                                <c:if test="${fieldStatus_35 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_35 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_35}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(assetDetails) > 0}">
                                                                <c:forEach items="${assetDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
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
                                                                <input type="text" placeholder="Select Property" readonly="" class="form-control" id="assetName" name="assetName" maxlength="50" value="" onkeypress="r
                                                                                    eturn
                                                                                    isNumberKey3(event)" onclick="selectAssetDetails();">
                                                                <input type="hidden" id="assetCode" name="assetCode" value="">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                    </div></c:if>
                                                <c:if test="${fieldStatus_36 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_36 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_36}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(subassDetails) > 0}">
                                                                <c:forEach items="${subassDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
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
                                                                <input type="text" placeholder="Select Flat Name" readonly="" class="form-control" id="flatNo" name="flatNo" maxlength="50" value="" onkeypress="retu
                                                                                    rn
                                                                                    isNumberKey3(event)" onclick="selectSubAssetDetails();">
                                                                <input type="hidden" id="subclassifiedAstno" name="subclassifiedAstno" value="">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                                        <!--<a style="color:red;">*</a>-->
                                                        <a style="color:transparent;">*</a>
                                                        <label class="control-label">Room/Unit Name</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(tenantDetails) > 0}">
                                                            <c:forEach items="${tenantDetails}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit1'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="roomName" name="roomName" maxlength="50" value="${list.extra4}">
                                                                        <input type="hidden" id="roomCode" value="${list.extra3}" >
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="roomName" value="${list.extra4}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly="" class="form-control" id="roomName"  maxlength="50" value="">
                                                            <input type="hidden" id="roomCode" value="" >
                                                        </c:otherwise>        
                                                    </c:choose>
                                                </div><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_37 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_37 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_37}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(assetDetails) > 0}">
                                                                <c:forEach items="${assetDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
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
                                                    </div></c:if>

                                                <c:if test="${fieldStatus_38 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_38 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_38}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(assetDetails) > 0}">
                                                                <c:forEach items="${assetDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly="" id="wayNo" name="wayNo" maxlength="50" value="${list.way}" onkeypress="return isNumberKey3(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="wayNo" value="${list.way}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" readonly="" class="form-control" id="wayNo" name="wayNo" maxlength="50" value="" onkeypress="return isNumberKey3(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_39 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_39 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_39}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(assetDetails) > 0}">
                                                                <c:forEach items="${assetDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly="" id="assetArea" name="assetArea" maxlength="50" value="${list.assetArea}" onkeypress="return isNumberKey3(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="assetArea" value="${list.assetArea}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" readonly="" class="form-control" id="assetArea" name="assetArea" maxlength="50" value="" onkeypress="return isNumberKey3(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_40 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_40 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_40}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(assetDetails) > 0}">
                                                                <c:forEach items="${assetDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
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

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_41 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_41 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_41}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(assetDetails) > 0}">
                                                                <c:forEach items="${assetDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly="" id="plotNo" name="plotNo" maxlength="50" value="${list.assetPlotNo}" onkeypress="return isNumberKey3(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="plotNo" value="${list.assetPlotNo}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" readonly="" class="form-control" id="plotNo" name="plotNo" maxlength="50" value="" onkeypress="return isNumberKey3(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_42 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_42 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_42}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(assetDetails) > 0}">
                                                                <c:forEach items="${assetDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly="" id="streetNo" name="streetNo" maxlength="50" value="${list.streetNo}" onkeypress="return isNumberKey3(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="streetNo" value="${list.streetNo}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" readonly="" class="form-control" id="streetNo" name="streetNo" maxlength="50" value="" onkeypress="return isNumberKey3(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_45 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_45 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_45}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(assetDetails) > 0}">
                                                                <c:forEach items="${assetDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly="" id="assetPostalCode" name="assetPostalCode" maxlength="3" value="${list.pinCode}" onkeypress="return isNumberKey(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="assetPostalCode" value="${list.pinCode}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" readonly="" class="form-control" id="assetPostalCode" name="assetPostalCode" maxlength="3" value="" onkeypress="return isNumberKey(event)">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                    </div></c:if>
                                                <c:if test="${fieldStatus_46 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_46 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_46}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(assetDetails) > 0}">
                                                                <c:forEach items="${assetDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly="" id="assetPostboxNo" name="assetPostboxNo" maxlength="4" value="${list.poBox}" onkeypress="return isNumberKey(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="assetPostboxNo" value="${list.poBox}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" readonly="" class="form-control" id="assetPostboxNo" name="assetPostboxNo" maxlength="4" value="" onkeypress="return isNumberKey(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <%--<c:if test="${fieldStatus_43 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_43 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_43}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(subassDetails) > 0}">
                                                                <c:forEach items="${subassDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly="" id="waterBillno" name="waterBillno" maxlength="50" value="${list.utilityNo1}" onkeypress="return isNumberKey(event)">
                                                                            <input type="hidden" id="actualRent" name="actualRent" value="${list.actualRent}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="waterBillno" value="${list.utilityNo1}">
                                                                            <input type="hidden" id="actualRent" name="actualRent" value="${list.actualRent}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" readonly="" class="form-control" id="waterBillno" name="waterBillno" maxlength="50" value="" onkeypress="return isNumberKey(event)">
                                                                <input type="hidden" id="actualRent" name="actualRent" value="">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_44 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_44 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_44}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(subassDetails) > 0}">
                                                                <c:forEach items="${subassDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly="" id="electricityBillno" name="electricityBillno" maxlength="50" value="${list.utilityNo2}" onkeypress="return isNumberKey(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="electricityBillno" value="${list.utilityNo2}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" readonly="" class="form-control" id="electricityBillno" name="electricityBillno" maxlength="50" value="" onkeypress="return isNumberKey(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>--%>

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
                                                                        <c:if test="${action eq 'edit1'}">
                                                                            <c:forEach items="${assetDetails1}" var="item">


                                                                                <tr class="item-enquiry">
                                                                                    <td align="center" onclick=""> </td>
                                                                                    <td><input class="form-control  right validate[required,custom[notzero]]" readonly autocomplete="off" name="utility" id="utility" type="text" value="${item.utility}" style=""></td> 
                                                                                    <td><input class="form-control  right validate[required,custom[notzero]]" readonly autocomplete="off" name="utilityBillType" id="utilityBillType" type="text" value="${item.utilityBillType}" style=""></td>                                                                        
                                                                                    <td><input class="form-control  right validate[required,custom[notzero]]" readonly autocomplete="off" name="utilityBill" id="utilityBill" type="text" value="${item.utilityBill}" style=""></td>                                                                        
                                                                                </tr>

                                                                            </c:forEach>
                                                                        </c:if>
                                                                        <c:if test="${action eq 'view1'}">
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
                                                                        <c:if test="${action eq 'edit1'}">
                                                                            <c:forEach items="${assetDetails1}" var="item">

                                                                                <tr class="item-enquiry">
                                                                                    <td align="center" onclick=""> </td>
                                                                                    <td><input class="form-control  right validate[required,custom[notzero]]" name="comUtility" id="comUtility" type="text" value="${item.comUtility}" readonly="" style=""></td> 
                                                                                    <td><input class="form-control  right validate[required,custom[notzero]]" name="comUtilityBillType" id="comUtilityBillType" type="text" value="${item.comUtilityBillType}" readonly="" style=""></td>                                                                        
                                                                                    <td><input class="form-control  right validate[required,custom[notzero]]" name="comutilityBill" id="comutilityBill" type="text" value="${item.comutilityBill}" readonly="" style=""></td>                                                                        
                                                                                </tr>
                                                                            </c:forEach>
                                                                        </c:if> 
                                                                        <c:if test="${action eq 'view1'}">
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
                                            <div class="box-header well" data-original-title onclick="call3();" style="cursor: pointer;">
                                                <h4><b style="padding-left: 20px;">Contract Period</b></h4><c:if test="${fn:length(message) > 0}"><a class="successalert" style="margin-left: 250px;">${message}</a></c:if>
                                                </div> 
                                                <div class="box-content" id="tag3"> 
                                                <c:if test="${fieldStatus_47 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_47 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_47}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(contractNamee) > 0}">
                                                                <c:forEach items="${contractNamee}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly="" id="contractName" name="contractName" maxlength="50" value="${list.contractTitle}" onkeypress="return isNumberKey3(event)">
                                                                            <input type="hidden" id="contractPeriod" name="contractPeriod" value="${list.contractCode}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="contractName" value="${list.contractTitle}">
                                                                            <input type="hidden" id="contractPeriod" name="contractPeriod" value="${list.contractCode}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="Select Contract" readonly="" class="form-control" id="contractName" name="contractName" maxlength="50" value=""  onclick="selectContractCode();" onblur="return getContAttach();">
                                                                <input type="hidden" id="contSno" name="contSno" value="">
                                                                <input type="hidden" id="contractPeriod" name="contractPeriod" value="">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_48 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_48 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_48}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(contractNamee) > 0}">
                                                                <c:forEach items="${contractNamee}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly="" id="startsFrom" name="startsFrom" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.contStartDate}"/>">
                                                                            <input type="hidden" id="contSno" name="contSno" value="">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="startsFrom" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.contStartDate}"/>">
                                                                            <input type="hidden" id="contSno" name="contSno" value="">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="Select Date" class="form-control" readonly id="startsFrom" name="startsFrom" value="">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_49 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_49 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_49}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(contractNamee) > 0}">
                                                                <c:forEach items="${contractNamee}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" placeholder="Select Date" readonly="" id="endsTo" name="endsTo" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.contEndDate}"/>">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="endsTo" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.contEndDate}"/>">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="Select Date" class="form-control" readonly id="endsTo" name="endsTo" value="">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_55 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_55 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_55}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly="" id="contractSigningDate" name="contractSigningDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.contractSigningDate}"/>" onchange="dateCheckCondition();">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="contractSigningDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.contractSigningDate}"/>">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="Select Date" class="form-control" readonly id="contractSigningDate" name="contractSigningDate" value="" onclick="javascript:NewCssCal('contractSigningDate', 'ddMMMyy
                                                                                    yy', '', '', '', '', '')" onchange="dateCheckCondition();">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_56 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_56 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_56}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly="" id="crIdNo" name="crIdNo" value="${list.crIdNo}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="crIdNo" value="${list.crIdNo}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" name="crIdNo" id="crIdNo">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                    </div></c:if> 
                                                <c:if test="${action eq 'edit1' || action eq 'view1' }">
                                                    <c:if test="${fieldStatus_50 eq 'y'}">
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                            <c:if test="${mand_status_50 eq 'required'}">
                                                                <a style="color:red;">*</a>
                                                            </c:if><a style="color:transparent;">*</a>
                                                            <label class="control-label">${field_50}</label>
                                                            <div style="overflow: scroll;border:none;margin-left:139px;margin-top:-22px;height: 150px;width:168px">
                                                                <table><tbody>
                                                                        <c:choose>
                                                                            <c:when test="${fn:length(contDocument) > 0}">
                                                                                <c:forEach items="${contDocument}" var="attach">
                                                                                    <c:choose>
                                                                                        <c:when test="${action eq 'edit1'}">
                                                                                            <tr><td><c:if test="${not empty attach.filename}">
                                                                                                        <a href="../insurance/contractAttachDownload.htm?sno=${attach.sno}&contractCode=${attach.contractCode}" class="fa fa-file-pdf-o" style="color: #000">${attach.filename}
                                                                                                            <span title="${attach.filename}"></span></a>
                                                                                                        </c:if>
                                                                                                        <c:if test="${empty attach.filename}">N/A</c:if> 
                                                                                                    </td></tr>

                                                                                        </c:when>
                                                                                        <c:otherwise>
                                                                                            <tr><td><c:if test="${not empty attach.filename}">
                                                                                                        <a href="../insurance/contractAttachDownload.htm?sno=${attach.sno}&contractCode=${attach.contractCode}" class="fa fa-file-pdf-o" style="color: #000">${attach.filename}
                                                                                                            <span title="${attach.filename}"></span></a>
                                                                                                        </c:if>
                                                                                                        <c:if test="${empty attach.filename}">N/A</c:if> 
                                                                                                    </td></tr>

                                                                                        </c:otherwise> 
                                                                                    </c:choose>
                                                                                </c:forEach>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <c:if test="${empty attach.filename}">Not Available</c:if>                                                   
                                                                            </c:otherwise>   
                                                                        </c:choose></tbody></table>
                                                            </div> 
                                                        </div> 
                                                    </c:if>
                                                </c:if>
                                                <p>&nbsp;</p>

                                            </div>

                                            <div class="box-header well" data-original-title onclick="call4();" style="cursor: pointer;">
                                                <h4><b style="padding-left: 20px;">Billing Cycle Details</b></h4><c:if test="${fn:length(message) > 0}"><a class="successalert" style="margin-left: 250px;">${message}</a></c:if>
                                                </div> 
                                                <div class="box-content" id="tag4"> 
                                                <c:if test="${fieldStatus_51 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_51 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_51}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text"  readonly class="form-control" id="billingCycle" name="billingCycle" value="${list.billingCycle}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="billingCycle" value="${list.billingCycle}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <!--<input type="text" placeholder="" class="form-control" id="billingCycle" name="billingCycle" value="" Monthly, quarterly, Half yearly, yearly>-->
                                                                <select id="billingCycle" name="billingCycle" class="form-control">
                                                                    <option value="" selected>Select your option</option>
                                                                    <option value="Monthly">Monthly</option>
                                                                    <option value="Quarterly">Quarterly</option>
                                                                    <option value="Half Yearly">Half Yearly</option>
                                                                    <option value="Yearly">Yearly</option>
                                                                </select>
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_52 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_52 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_52}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" id="advanceAmount" name="advanceAmount" maxlength="14" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.advanceAmount}" />" onkeypress="return check_digit(event, this, 10, 3);">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="advanceAmount" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.advanceAmount}" />">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="advanceAmount" name="advanceAmount" maxlength="14" value="" onkeypress="return check_digit(event, this, 10, 3);">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>
                                                <c:if test="${fieldStatus_53 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_53 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_53}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" placeholder="Select Date" class="form-control" readonly="" id="dueDate" name="dueDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.dueDate}"/>"  onclick="javascript:NewCssCal('dueDate', 'ddMMMyy
                                                                                                        yy', '', '', '', '', '')" onchange="dateCheckCondition();">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="dueDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.dueDate}"/>">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="Select Date" class="form-control" readonly  id="dueDate" name="dueDate" value="" onclick="javascript:NewCssCal('dueDate', 'ddMMMyy
                                                                                                    yy', '', '', '', '', '')" onchange="dateCheckCondition();">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if><p>&nbsp;</p>
                                                <c:if test="${fieldStatus_57 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_57 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_57}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" id="extra2" name="extra2" maxlength=14" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.extra2}" />" onkeypress="retur
                                                                                                                        n
                                                                                                                        check_digit(event, this, 10, 3);" onchange="rentCalc();">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" value="${list.extra2}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="extra2" name="extra2">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                    </div></c:if>
                                                <c:if test="${fieldStatus_54 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_54 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_54}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" id="totalAmount" readonly=""  name="totalAmount" maxlength=14" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.totalAmount}" />" onkeypress="retur
                                                                                                                        n
                                                                                                                        check_digit(event, this, 10, 3);" onchange="rentCalc();">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="totalAmount" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.totalAmount}" />">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="totalAmount" name="totalAmount" maxlength="14" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value=""/>" onkeypress="retur
                                                                                                            n
                                                                                                            check_digit(event, this, 10, 3);" onchange="rentCalc();">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div></c:if>

                                                    <!--Extra buffer fields-->

                                                    <p>&nbsp;</p>
                                                <c:if test="${fieldStatus_58 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_58 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_58}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly="" id="extra3" name="extra3" value="${list.extra3}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="extra3" value="${list.extra3}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="extra3" name="extra3">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                    </div></c:if>
                                                <c:if test="${fieldStatus_59 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_59 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_59}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly="" id="extra4" name="extra4" value="${list.extra4}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="extra4" value="${list.extra4}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="extra4"  name="extra4">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                    </div></c:if>
                                                <c:if test="${fieldStatus_60 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_60 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${field_60}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit1'}">
                                                                            <input type="text" class="form-control" readonly="" id="extra5"  name="extra5" value="${list.extra5}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="extra5" value="${list.extra5}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" id="extra5" name="extra5">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                    </div></c:if>
                                                </div>
                                                <div style="display:none">
                                                <c:if test="${action eq 'edit1' || action eq 'Recheck1' }">

                                                    <div class="box-header well" data-original-title onclick="call5();" style="cursor: pointer;">
                                                        <h4><b style="padding-left: 20px;">Annual Maintenance Contract</b></h4><c:if test="${fn:length(message) > 0}"><a class="successalert" style="margin-left: 250px;">${message}</a></c:if>
                                                        </div> 
                                                        <div class="box-content" id="tag5"> 
                                                        <c:if test="${fieldStatus_61 eq 'y'}">
                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                                <c:if test="${mand_status_61 eq 'required'}">
                                                                    <a style="color:red;">*</a>
                                                                </c:if><a style="color:transparent;">*</a>
                                                                <label class="control-label">${field_61}</label>
                                                                <c:choose>
                                                                    <c:when test="${fn:length(tenantDetails) > 0}">
                                                                        <c:forEach items="${tenantDetails}" var="list">
                                                                            <c:choose>
                                                                                <c:when test="${action eq 'edit1'|| action eq 'Recheck1'}">
                                                                                    <input type="text" class="form-control" readonly="" ${mand_status_61}  id="amctenantName" name="amctenantName" maxlength="10" value="${list.tenantFname}${list.tenantLname}" >
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <input type="text" class="form-control" readonly="" id="amctenantName" value="${list.tenantFname}${list.tenantLname}">
                                                                                </c:otherwise> 
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:when>
                                                                    <c:otherwise>                                                    
                                                                        <input type="text" placeholder="" readonly class="form-control" ${mand_status_61} id="amctenantName" name="amctenantName" maxlength="10" value="" >
                                                                    </c:otherwise>        
                                                                </c:choose>

                                                            </div></c:if>
                                                        <c:if test="${fieldStatus_62 eq 'y'}">
                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                                <c:if test="${mand_status_62 eq 'required'}">
                                                                    <a style="color:red;">*</a>
                                                                </c:if><a style="color:transparent;">*</a>
                                                                <label class="control-label">${field_62}</label>
                                                                <c:choose>
                                                                    <c:when test="${fn:length(tenantDetails) > 0}">
                                                                        <c:forEach items="${tenantDetails}" var="list">
                                                                            <c:choose>
                                                                                <c:when test="${action eq 'edit1'|| action eq 'Recheck1'}">
                                                                                    <input type="text" class="form-control" placeholder="Select Date" readonly="" ${mand_status_62}  id="startDate" name="startDate" maxlength="10" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.startDate}"/>" onclick="javascript:NewCssCal('startDate', 'ddMMMyyyy', '', '', '', '', '')" >
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <input type="text" class="form-control" readonly="" id="startDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.startDate}"/>">
                                                                                </c:otherwise> 
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:when>
                                                                    <c:otherwise>                                                    
                                                                        <input type="text" placeholder="" readonly class="form-control" ${mand_status_62} id="startDate" name="startDate" maxlength="10" value="" onclick="javascript:NewCssCal('dueDate', 'ddMMMyyyy', '', '', '', '', '')">
                                                                    </c:otherwise>        
                                                                </c:choose>

                                                            </div></c:if>
                                                        <c:if test="${fieldStatus_63 eq 'y'}">
                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                                <c:if test="${mand_status_63 eq 'required'}">
                                                                    <a style="color:red;">*</a>
                                                                </c:if><a style="color:transparent;">*</a>
                                                                <label class="control-label">${field_63}</label>
                                                                <c:choose>
                                                                    <c:when test="${fn:length(tenantDetails) > 0}">
                                                                        <c:forEach items="${tenantDetails}" var="list">
                                                                            <c:choose>
                                                                                <c:when test="${action eq 'edit1'|| action eq 'Recheck1'}">
                                                                                    <input type="text" class="form-control" placeholder="Select Date" readonly="" ${mand_status_63}  id="endDate" name="endDate" maxlength="10" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.endDate}"/>" onclick="javascript:NewCssCal('endDate', 'ddMMMyyyy', '', '', '', '', '')" >
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <input type="text" class="form-control" readonly="" id="endDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.endDate}"/>">
                                                                                </c:otherwise> 
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:when>
                                                                    <c:otherwise>                                                    
                                                                        <input type="text" placeholder="" readonly class="form-control" ${mand_status_63} id="endDate" name="endDate" maxlength="10" value="" onclick="javascript:NewCssCal('dueDate', 'ddMMMyyyy', '', '', '', '', '')">
                                                                    </c:otherwise>        
                                                                </c:choose>

                                                            </div></c:if>
                                                            <p>&nbsp;</p>

                                                        <c:if test="${fieldStatus_64 eq 'y'}">
                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                                <c:if test="${mand_status_64 eq 'required'}">
                                                                    <a style="color:red;">*</a>
                                                                </c:if><a style="color:transparent;">*</a>
                                                                <label class="control-label">${field_64}</label>
                                                                <c:choose>
                                                                    <c:when test="${fn:length(tenantDetails) > 0}">
                                                                        <c:forEach items="${tenantDetails}" var="list">
                                                                            <c:choose>
                                                                                <c:when test="${action eq 'edit1'|| action eq 'Recheck1'}">
                                                                                    <input type="text" class="form-control" readonly="" ${mand_status_64}  id="percentage" name="percentage" maxlength="10" value="${list.percentage}" onchange="return calpercentage();" onkeypress="return isNumberKey(event)">
                                                                                    <input type="hidden" class="form-control" ${mand_status_64}  id="percentage1" name="percentage1" maxlength="10" value="${list.percentage}" >
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <input type="text" class="form-control" readonly="" id="percentage" value="${list.percentage}">
                                                                                </c:otherwise> 
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:when>
                                                                    <c:otherwise>                                                    
                                                                        <input type="text" placeholder="" readonly class="form-control" ${mand_status_64} id="percentage" name="percentage" maxlength="10" value=" " onkeypress="return isNumberKey(event)">
                                                                    </c:otherwise>        
                                                                </c:choose>
                                                            </div></c:if>                                      
                                                        <c:if test="${fieldStatus_65 eq 'y'}">
                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                                <c:if test="${mand_status_65 eq 'required'}">
                                                                    <a style="color:red;">*</a>
                                                                </c:if><a style="color:transparent;">*</a>
                                                                <label class="control-label">${field_65}</label>
                                                                <c:choose>
                                                                    <c:when test="${fn:length(tenantDetails) > 0}">
                                                                        <c:forEach items="${tenantDetails}" var="list">
                                                                            <c:choose>
                                                                                <c:when test="${action eq 'edit1'|| action eq 'Recheck1'}">
                                                                                    <input type="text" class="form-control" readonly="" ${mand_status_65}  id="amcamount" name="amcamount" maxlength="10" value="${list.amcamount}" onkeypress="return isNumberKey(event)">
                                                                                    <input type="hidden" class="form-control" ${mand_status_65}  id="amcamount1" name="amcamount1" maxlength="10" value="${list.amcamount}" >
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <input type="text" class="form-control" readonly="" id="amcamount" value="${list.amcamount}">
                                                                                </c:otherwise> 
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    </c:when>
                                                                    <c:otherwise>                                                    
                                                                        <input type="text" placeholder="" readonly class="form-control" ${mand_status_65} id="amcamount" name="amcamount" maxlength="10" value="" onkeypress="return isNumberKey(event)">
                                                                    </c:otherwise>        
                                                                </c:choose>
                                                            </div></c:if>   
                                                            <p>&nbsp;</p>
                                                        </div>                                                 
                                                </c:if> 
                                            </div>
                                            <p>&nbsp;</p>
                                            <table id="" class="table table-striped responsive-utilities jambo_table" style="">
                                                <thead >
                                                    <tr class="headings">     
                                                        <th >Role</th>
                                                        <!--<th >Name</th>-->
                                                        <th >Date</th>
                                                        <th >Remarks</th>
                                                    </tr>      
                                                </thead>        
                                                <tbody> 
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:set var="cforemarks" value="${list.cforemarks}" /> 
                                                        <c:set var="gfcremarks" value="${list.gfcremarks}" /> 
                                                        <c:if test="${gfcremarks ne null}">
                                                            <tr>
                                                                <td class="center" style="text-align: left;"><b>GFC</b></td>
                                                                <!--<td class="center" style="text-align: left;">${list.userId}</td>-->
                                                                <td class="center" style="text-align: left;"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${list.lastmodifiedDate}" /></td>
                                                                <td class="center" style="text-align: left;">${gfcremarks}</td>
                                                            </tr>
                                                        </c:if>
                                                        <c:if test="${cforemarks ne null}">
                                                            <tr>
                                                                <td class="center" style="text-align: left;"><b>CFO</b></td>
                                                                <!--<td class="center" style="text-align: left;">${list.userId}</td>-->
                                                                <td class="center" style="text-align: left;"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${list.lastmodifiedDate}" /></td>
                                                                <td class="center" style="text-align: left;">${cforemarks}</td>
                                                            </tr>
                                                        </c:if>

                                                    </c:forEach> 
                                                </tbody>
                                            </table>         
                                            <p>&nbsp;</p>
                                            <c:if test="${action eq 'edit1'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <a style="color:red;">*</a>
                                                    <label class="control-label">Remarks</label>                                       
                                                    <textarea  class="form-control" required="" rows="1" type="text" id="reviewerComments" style="resize: none;" name="reviewerComments" maxlength="120" ></textarea> 
                                                </div></c:if>
                                                <p>&nbsp;</p>

                                            <c:if test="${action ne 'view1'}">
                                                <!--                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">-->
                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                    <button type="submit" class="btn btn-primary" style="">Approve</button>
                                                    <button type="button" class="btn btn-warning" style="" onclick="reject1('${tenantCode}', 'Rejected', '${subAstno}');">Reject</button>
                                                    <!--<button type="button" class="btn btn-warning" onclick="recheck('${tenantCode}', 'Recheck');">Recheck</button>-->
                                                    <a href="../tenant/tenantDetailsAppList1.htm" class="btn btn-danger">Cancel</a>
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
