<%-- 
    Document   : quoteConvertForm
    Created on : 17 Sep, 2016, 3:23:43 PM
    Author     : ebs-sdd27
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
        <script src="../common/datepicker/datetimepicker_css_2.js" type="text/javascript"></script>
        <link href="../common/theme/css/disableSelection.css" rel="stylesheet" type="text/css"/>
        <title>arête Assets Management</title>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#tag").toggle();
                $("#tag1").toggle();
                $("#tag2").toggle();
                $("#tag3").toggle();
                $("#tag4").toggle();
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
            });
            function selectLandLord()
            {
                myWindow = window.open("../Lead/selectLandLord.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
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
            function validateEmail(sEmail) {
                var etext = document.getElementById('tenantMailid').value;
                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                if (etext.match(mailformat)) {
                    return true;
                } else {
                    alert("You have entered an invalid email address!");
                    document.getElementById('tenantMailid').value = "";

                }
            }
            function selectContractCode()
            {
                myWindow = window.open("../tenant/selectContractCode.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
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

            function testllImage() {
                var llSno = document.getElementById("llSno").value;
                if (llSno == '') {
                    alert("No image!!!");
                    return false;
                }
                else {
                    window.location.href = '../tenant/tenantlAttachDownload.htm?sno=' + llSno;
                }
            }

            function rentAmtVali() {
                var advanceAmount = document.getElementById("advanceAmount").value;
                var totalAmount = document.getElementById("totalAmount").value;
                if (advanceAmount == '') {
                    alert("Please Enter Advance Amount First.")
                    document.getElementById("totalAmount").value = "";
                    return false;
                }
                else if (parseInt(totalAmount) < parseInt(advanceAmount)) {
                    alert("Rent Amount Should Be Greater Then Advance Amount.");
                    document.getElementById("totalAmount").value = "";
                }

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

            function postlcde1()
            {

                var mobileNo = document.getElementById("postalCode1").value;
                var mob = mobileNo.length;
                if (mob < 8) {
                    alert("Enter Valid Mobile No.");
                    $('#postalCode1').val("");
                    return false;
                }

            }
            function mandTest() {
                var llM = document.getElementById("llId").value;

                var tenantM = document.getElementById("tenantType").value &&
                        document.getElementById("tenantCategory").value &&
                        document.getElementById("tenantId").value &&
                        document.getElementById("tenantFname").value &&
                        document.getElementById("tenantLname").value &&
                        document.getElementById("tenantCrNo").value &&
                        document.getElementById("tenantContactno").value &&
//                        document.getElementById("tenantMailid").value &&
                        document.getElementById("correspondenceAddress").value;

                var assetM = document.getElementById("assetName").value &&
                        document.getElementById("subclassifiedAstno").value;

                var contM = document.getElementById("contractPeriod").value;

                var billM = document.getElementById("billingCycle").value &&
//                        document.getElementById("advanceAmount").value &&
                        document.getElementById("advanceAmount").value;
//                        document.getElementById("totalAmount").value;
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
                    alert("Please Fill Mandatory Fields in Property Details");
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
//                    $('#advanceAmount').focus();
//                    $('#dueDate').focus();
//                    $('#totalAmount').focus();
                    return false;
                }
                else {
                    document.forms["quoteConvertForm"].submit();
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
            function callM() {
                $("#tag").toggle();
                $("#tag1").hide();
                $("#tag2").hide();
                $("#tag3").hide();
                $("#tag4").hide();
            }
            function callM1() {
                $("#tag").hide();
                $("#tag1").toggle();
                $("#tag2").hide();
                $("#tag3").hide();
                $("#tag4").hide();
            }
            function callM2() {
                $("#tag").hide();
                $("#tag1").hide();
                $("#tag2").toggle();
                $("#tag3").hide();
                $("#tag4").hide();
            }
            function callM3() {
                $("#tag").hide();
                $("#tag1").hide();
                $("#tag2").hide();
                $("#tag3").toggle();
                $("#tag4").hide();
            }
            function callM4() {
                $("#tag").hide();
                $("#tag1").hide();
                $("#tag2").hide();
                $("#tag3").hide();
                $("#tag4").toggle();
            }



            // Added by garun to to fect the contract code

            function selectContractName()
            {
                var tenantCategory = document.getElementById("tenantCategory").value;
                var subassetCode = document.getElementById("subassetCode").value;
                myWindow = window.open("../CRM/selectContractCode.htm?tenantCategory=" + tenantCategory + "&subassetCode=" + subassetCode + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }


        </script>
        <script>
            function checkfile($this)
            {
                var docsize = document.getElementById("docsize").value;
                var $fin = $($this).closest('tr');
                var fl = $fin.find('#attachmentReference').val();
                var fileSize = $this.files[0];
                var sizeInMb = fileSize.size / 1024;
                var sizeLimit = 1024 * docsize;
                if (sizeInMb > sizeLimit) {
                    alert("File Size Exceeded (Only " + docsize + " MB Allowed)");
                    $($this).val('');
                    return;
                }
                var fmt = /^.*\.(jpg|JPG|gif|GIF|png|PNG|jpeg|JPEG|xls|XLS|xlsx|XLSX|doc|DOC|pdf|PDF|docx|DOCX|zip|ZIP)$/;
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
    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <div class="clearfix"></div>
                        <div class="col-md-6 col-xs-12">
                            <div class="x_panel">
                                <jsp:include page="../login/headerlink.htm?submodule=Rent Quote&tab=Tenant&pagetype=form"/>
                                <div class="x_title">
                                    <h2>Tenant Details</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />
                                    <form class="form-inline" id="quoteConvertForm" action="../CRM/quoteConvertFormSubmit.htm"  method="post" enctype="multipart/form-data">
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
                                        </c:forEach>
                                        <c:forEach items="${fileSize}" var="list">
                                            <c:if test="${list[0] eq 'F-25'}">
                                                <input type="hidden" value="${list[1]}" id="docsize"/>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach items="${quoteDetailsList}" var="list">                                           
                                            <c:forEach items="${assetDetails}" var="asset">
                                                <c:if test="${asset.assetCode eq list.assetCode}">
                                                    <c:set var="assetName1" value="${asset.assetName}"/>
                                                    <c:set var="assetCode1" value="${asset.assetCode}"/>

                                                </c:if> 
                                            </c:forEach>
                                            <c:forEach items="${subAssetDetails}" var="subasset">
                                                <c:if test="${subasset.subAssetCode eq list.subAssetCode}">
                                                    <c:set var="subAssetName1" value="${subasset.subAssetName}"/>
                                                    <c:set var="subAssetCode1" value="${subasset.subAssetCode}"/>

                                                </c:if> 
                                            </c:forEach>
                                        </c:forEach>
                                        <div class="box-header well" data-original-title onclick="call();" style="cursor: pointer;">
                                            <h4><b style="padding-left: 20px;">Landlord Details (First Party)</b></h4><c:if test="${fn:length(message) > 0}"><a class="successalert" style="margin-left: 250px;">${message}</a></c:if>
                                            </div> 
                                            <div class="box-content" id="tag">  
                                            <c:if test="${fieldStatus_1 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_1 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_1}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(tenantDetails) > 0}">
                                                            <c:forEach items="${tenantDetails}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_1} readonly="" id="llId" name="llId" value="${list.llId}">
                                                                        <input type="hidden" name="pk" value="${list.SNo}">
                                                                        <input type="hidden" name="status" value="${list.status}">
                                                                        <input type="hidden" name="tenantCode" value="${list.tenantCode}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" id="llId" readonly="" value="${list.llId}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="Click to Select Land Lord" readonly class="form-control" ${mand_status_1} id="llId" name="llId" value="" onclick="selectLandLord();">

                                                            <input type="hidden" name="tenantQuoteCode" value="${tenantQuoteCode}">
                                                            <input type="hidden" id="llSno" name="llSno" value="">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_2 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_2 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_2}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(tenantDetails) > 0}">
                                                            <c:forEach items="${tenantDetails}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_2} readonly="" id="llName" name="llName" value="${list.llName}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="llName" value="${list.llName}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" placeholder="" readonly class="form-control" ${mand_status_2} id="llName" name="llName" value="">
                                                        </c:otherwise>        
                                                    </c:choose>
                                                </div></c:if>
                                            <c:if test="${fieldStatus_3 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_3 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_3}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(tenantDetails) > 0}">
                                                            <c:forEach items="${tenantDetails}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_3} readonly="" id="llCategory" name="llCategory" value="${list.llCategory}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="llCategory" value="${list.llCategory}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly class="form-control" ${mand_status_3} id="llCategory" name="llCategory" value="">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if><p>&nbsp;</p>
                                            <c:if test="${fieldStatus_4 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_4 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_4}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(tenantDetails) > 0}">
                                                            <c:forEach items="${tenantDetails}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_4} readonly="" id="llCrNo" name="llCrNo" maxlength="40" value="${list.llCrNo}" onkeypress="return isNumberKey3(event)" autocomplete="off">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="llCrNo" value="${list.llCrNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text"  class="form-control" ${mand_status_4} id="llCrNo" name="llCrNo" maxlength="40" value="" readonly="" placeholder="" onkeypress="return isNumberKey3(event)" autocomplete="off">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_5 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_5 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_5}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(tenantDetails) > 0}">
                                                            <c:forEach items="${tenantDetails}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_5} readonly="" id="llContactno" name="llContactno" value="${list.llContactno}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="llContactno" value="${list.llContactno}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly class="form-control" ${mand_status_5} id="llContactno" name="llContactno" value="">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_6 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_6 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_6}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(tenantDetails) > 0}">
                                                            <c:forEach items="${tenantDetails}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_6} readonly="" id="llWorkContactno" name="llWorkContactno" value="${list.llWorkContactno}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="llWorkContactno" value="${list.llWorkContactno}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly class="form-control" ${mand_status_6} id="llWorkContactno" name="llWorkContactno" value="">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if><p>&nbsp;</p>
                                            <c:if test="${fieldStatus_7 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_7 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_7}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(tenantDetails) > 0}">
                                                            <c:forEach items="${tenantDetails}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_7} readonly="" id="llMailid" name="llMailid" value="${list.llMailid}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="llMailid" value="${list.llMailid}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly class="form-control" ${mand_status_7} id="llMailid" name="llMailid" value="">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${action ne 'edit' || action eq 'view' }">

                                                <c:if test="${fieldStatus_8 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_8 eq 'required'}">
                                                            <a class="control-label-required" style="color:red;">*</a>
                                                        </c:if>
                                                        <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                        <label class="control-label">${field_8}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                                <c:forEach items="${tenantDetails}" var="type">
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
                                                                            <img src="../common/theme/images/images.png" height="30px" width="30px" onclick="testllImage();">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <img src="../common/theme/images/images.png" height="30px" width="30px" onclick="testllImage();">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                    </div> 
                                                </c:if></c:if>
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
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_9}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_9} readonly="" id="tenantType" name="tenantType" value="${list.tenantType}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="tenantType" value="${list.tenantType}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <!--<input type="text" placeholder="" class="form-control" id="tenantType" name="tenantType" value="">-->
                                                            <select id="tenantType" name="tenantType" ${mand_status_9} class="form-control validate[required]">
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
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_10}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" readonly="" id="tenantCategory" name="tenantCategory" value="${list.tenantCategory}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="tenantCategory" value="${list.tenantCategory}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <!--<input type="text" placeholder="" class="form-control" ${mand_status_10} id="tenantCategory" name="tenantCategory" value="">-->
                                                            <select id="tenantCategory" name="tenantCategory" ${mand_status_10} class="form-control validate[required]">
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
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_11}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" autocomplete="off" readonly="" id="tenantId" name="tenantId" maxlength="15" value="${list.tenantId}" onkeypress="return isNumberKey3(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="tenantId" value="${list.tenantId}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" autocomplete="off" id="tenantId" name="tenantId" maxlength="15" value="${list.tenantId}" onkeypress="return isNumberKey3(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if><p>&nbsp;</p>
                                            <c:if test="${fieldStatus_12 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_12 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_12}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_12} readonly="" id="tenantFname" name="tenantFname" maxlength="50" value="${list.tenantFirstName}" onkeypress="return isNumberKey4(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="tenantFname" value="${list.tenantFirstName}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" ${mand_status_12} id="tenantFname" name="tenantFname" maxlength="50" value="list.tenantFirstName" onkeypress="return isNumberKey4(event)">
                                                            <input type="hidden" name="tenantQuoteCode" value="${list.tenantQuoteCode}">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_13 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_13 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_13}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_13} readonly="" id="tenantLname" name="tenantLname" maxlength="50" value="${list.tenantLastName}" onkeypress="return isNumberKey4(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="tenantLname" value="${list.tenantLastName}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" ${mand_status_13} id="tenantLname" name="tenantLname" maxlength="50" value="" onkeypress="return isNumberKey4(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_14 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_14 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_14}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_14} readonly="" id="tenantCitizenship" name="tenantCitizenship" value="${list.tenantCitizenship}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="tenantCitizenship" value="${list.tenantCitizenship}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <!--<input type="text" placeholder="" class="form-control" ${mand_status_14} id="tenantCitizenship" name="tenantCitizenship" value="">-->
                                                            <select id="tenantCitizenship" name="tenantCitizenship"  class="form-control" ${mand_status_14} value="list.tenantCitizenship">
                                                                <option value="list.tenantCitizenship" selected>Select your option</option>
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

                                                </div></c:if><p>&nbsp;</p>

                                            <c:if test="${fieldStatus_16 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_16 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_16}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_16} readonly="" id="tenantCrNo" name="tenantCrNo" maxlength="40" value="${list.crno}" onkeypress="return isNumberKey3(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="tenantCrNo" value="${list.crno}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" ${mand_status_16} id="tenantCrNo" name="tenantCrNo" maxlength="40" value="${list.crno}" onkeypress="return isNumberKey3(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_17 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_17 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_17}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_17} readonly="" id="tenantContactno" name="tenantContactno" maxlength="11" value="${list.contactNo}" onkeypress="return isNumberKey(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="tenantContactno" value="${list.contactNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" ${mand_status_17} id="tenantContactno" name="tenantContactno" maxlength="11" value="" onkeypress="return isNumberKey(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_18 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_18 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_18}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_18}  id="tenantWorkContactno" name="tenantWorkContactno" maxlength="11" value="${list.tenantWorkContactNo}" onkeypress="return isNumberKey(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="tenantWorkContactno" value="${list.tenantWorkContactNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" ${mand_status_18} id="tenantWorkContactno" name="tenantWorkContactno" maxlength="11" value="${list.tenantWorkContactNo}" onkeypress="return isNumberKey(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if><p>&nbsp;</p>
                                            <c:if test="${fieldStatus_19 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_19 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <label class="control-label">${field_19}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_19} readonly="" id="tenantMailid" name="tenantMailid" maxlength="35" value="${list.mailId}" onchange="return validateEmail(event);">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="tenantMailid" value="${list.mailId}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" ${mand_status_19} id="tenantMailid" name="tenantMailid" maxlength="35" value="${list.mailId}" onchange="return validateEmail(event);">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_20 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_20 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label" style="margin-top: -20px;">${field_20}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <textarea type="text" rows="1" class="form-control" style="resize: none" ${mand_status_20}  id="permanentAddress" name="permanentAddress" maxlength="250" value="${list.permanentAddress}">${list.permanentAddress}</textarea>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <textarea type="text" rows="1" class="form-control" style="resize: none" readonly="" id="permanentAddress" value="${list.permanentAddress}">${list.permanentAddress}</textarea>
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <textarea type="text" placeholder="" rows="1" style="resize: none" class="form-control" ${mand_status_20} id="permanentAddress" name="permanentAddress" maxlength="250" value=""></textarea>
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_21 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_21 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label" style="margin-top: 10px;">${field_21}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <textarea type="text" class="form-control" rows="1" style="resize: none" ${mand_status_21} readonly="" id="correspondenceAddress" name="correspondenceAddress" maxlength="250" value="${list.correspondingAddress}">${list.correspondingAddress}</textarea>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <textarea type="text" class="form-control" rows="1" style="resize: none" readonly="" id="correspondenceAddress" value="${list.correspondingAddress}">${list.correspondingAddress}</textarea>
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <textarea type="text" placeholder="" rows="1" style="resize: none" class="form-control" ${mand_status_21} id="correspondenceAddress" name="correspondenceAddress" maxlength="250" value=""></textarea>
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if><p>&nbsp;</p>
                                            <c:if test="${fieldStatus_22 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_22 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_22}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_22}  id="postalCode" name="postalCode" maxlength="3" value="${list.tenantpostalCode}" onkeypress="return isNumberKey(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="postalCode" value="${list.tenantpostalCode}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" ${mand_status_22} id="postalCode" name="postalCode" value="" maxlength="3" onkeypress="return isNumberKey(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_23 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_23 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_23}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_23}  id="postboxNo" name="postboxNo" maxlength="4" value="${list.tenantPostBoxNo}" onkeypress="return isNumberKey(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="postboxNo" value="${list.tenantPostBoxNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" ${mand_status_23} id="postboxNo" name="postboxNo" maxlength="4" value="" onkeypress="return isNumberKey(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_24 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_24 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_24}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_24}  id="sponcerName" name="sponcerName" maxlength="50" value="${list.sponsorname}" onkeypress="return isNumberKey4(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="sponcerName" value="${list.sponsorname}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" ${mand_status_24} id="sponcerName" name="sponcerName" maxlength="50" value="" onkeypress="return isNumberKey4(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if><p>&nbsp;</p>
                                            <c:if test="${fieldStatus_25 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_25 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label" style="margin-top: -20px;">${field_25}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <textarea type="text" rows="1" class="form-control" placeholder="" style="resize: none" ${mand_status_25}  id="sponcerAddress" name="sponcerAddress" maxlength="250" value="${list.sponsorAddress}">${list.sponsorAddress}</textarea>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <textarea type="text" rows="1" class="form-control" placeholder="" style="resize: none" readonly="" id="sponcerAddress" value="${list.sponsorAddress}">${list.sponsorAddress}</textarea>
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <textarea style="resize: none" rows="1" class="form-control" type="text" placeholder=""  ${mand_status_25} id="sponcerAddress" name="sponcerAddress" maxlength="250" value=""></textarea>
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_26 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_26 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_26}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_26}  id="companyName" name="companyName" value="${list.companyName}" maxlength="50" onkeypress="return isNumberKey4(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="companyName" value="${list.companyName}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" ${mand_status_26} id="companyName" name="companyName" value="" maxlength="50" onkeypress="return isNumberKey4(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_27 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_27 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label"  style="margin-top: -20px;">${field_27}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <textarea style="resize: none" rows="1" type="text" class="form-control" ${mand_status_27} id="companyAddress" name="companyAddress" maxlength="250" value="${list.companyAddress}">${list.companyAddress}</textarea>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <textarea style="resize: none"type="text" rows="1" class="form-control" readonly="" id="companyAddress" value="${list.companyAddress}">${list.companyAddress}</textarea>
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <textarea style="resize: none" type="text" rows="1" placeholder="" class="form-control" ${mand_status_27} id="companyAddress" name="companyAddress" maxlength="250" value=""></textarea>
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if><p>&nbsp;</p>
                                            <c:if test="${fieldStatus_28 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_28 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_28}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_28}  id="postalCode1" name="postalCode1" value="${list.sponsorPostalCode}"  onkeypress="return isNumberKey(event)" maxlength="10" onchange="postlcde1();">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="postalCode1" value="${list.sponsorPostalCode}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" ${mand_status_28} id="postalCode1" name="postalCode1" value=""  onkeypress="return isNumberKey(event)" maxlength="10" onchange="postlcde1();">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_29 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_29 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_29}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_29}  id="postboxNo1" name="postboxNo1" value="${list.sponsorPostBoxNo}"   maxlength="40" value=""  onchange="return validateEmail1(event);">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="postboxNo1" value="${list.sponsorPostBoxNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" ${mand_status_29} id="postboxNo1" name="postboxNo1" maxlength="4" value="" onkeypress="return isNumberKey(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_30 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_30 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_30}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_30}  id="jointeeName1" name="jointeeName1" maxlength="50" value="${list.jointeeName1}" onkeypress="return isNumberKey4(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="jointeeName1" value="${list.jointeeName1}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" ${mand_status_30} id="jointeeName1" name="jointeeName1" maxlength="50" value="" onkeypress="return isNumberKey4(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if><p>&nbsp;</p>
                                            <c:if test="${fieldStatus_31 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_31 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label" style="margin-top: -20px;">${field_31}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <textarea style="resize: none" rows="1" type="text" class="form-control" ${mand_status_31}  id="jointeeAddress1" name="jointeeAddress1" maxlength="250" value="${list.jointeeAddress1}">${list.jointeeAddress1}</textarea>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <textarea style="resize: none" rows="1" type="text" class="form-control" readonly="" id="jointeeAddress1" value="${list.jointeeAddress1}">${list.jointeeAddress1}</textarea>
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <textarea style="resize: none" rows="1" type="text" placeholder="" class="form-control" ${mand_status_31} id="jointeeAddress1" name="jointeeAddress1" maxlength="250" value=""></textarea>
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_32 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_32 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_32}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_32}  id="jointeeName2" name="jointeeName2" maxlength="50" value="${list.jointeeName2}" onkeypress="return isNumberKey4(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="jointeeName2" value="${list.jointeeName2}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" ${mand_status_32} id="jointeeName2" name="jointeeName2" maxlength="50" value="" onkeypress="return isNumberKey4(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_33 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_33 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label" style="margin-top: -20px;">${field_33}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <textarea style="resize: none" rows="1" type="text" class="form-control" ${mand_status_33}  id="jointeeAddress2" name="jointeeAddress2" maxlength="250" value="${list.jointeeAddress2}">${list.jointeeAddress2}</textarea>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <textarea style="resize: none" rows="1" type="text" class="form-control" readonly="" id="jointeeAddress2" value="${list.jointeeAddress2}">${list.jointeeAddress2}</textarea>
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <textarea style="resize: none" type="text" rows="1" placeholder="" class="form-control" ${mand_status_33} id="jointeeAddress2" name="jointeeAddress2" maxlength="250" value=""></textarea>
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if><p>&nbsp;</p>
                                            <c:if test="${fieldStatus_34 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_34 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label"  style="margin-top: -20px;">${field_34}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <textarea style="resize: none" rows="1" type="text" class="form-control" ${mand_status_34}  id="remarks" name="remarks" maxlength="250" value="${list.remarks}">${list.remarks}</textarea>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <textarea style="resize: none" type="text" rows="1" class="form-control" readonly="" id="remarks" value="${list.remarks}">${list.remarks}</textarea>
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <textarea style="resize: none" type="text" placeholder="" rows="1" class="form-control" ${mand_status_34} id="remarks" name="remarks" maxlength="250" value=""></textarea>
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_15 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_15 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_15}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="type">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input class=" input-file uniform_on" ${mand_status_15} id="tenantAttachment" name="tenantAttachment" type="file" onchange="checkfile(this);">
                                                                        <input name="pk" type="hidden" value="${type.sno}">
                                                                        <c:if test="${not empty type.tenantFilename}">
                                                                            <a style="color: black" href="../CRM/quoteAttachDownload.htm?sno=${list.sno}" title="Click to download">
                                                                                <i class="fa fa-file-pdf-o" style="font-size: 15px" ></i>
                                                                                ${type.tenantFilename}
                                                                                <input value="${type.tenantFilename}" name="tenantFilename" id="fileName" type="hidden" >
                                                                                <input value="${type.tenantAttachment}" name="tenantAttachment" id="content" type="hidden" >
                                                                            </a>
                                                                        </c:if> 
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <c:if test="${not empty type.assetName}">
                                                                            <a style="color: black" href="../tenant/tenanttAttachDownload.htm?sno=${type.sno}" title="Click to download">
                                                                                <i class="fa fa-file-pdf-o" style="font-size: 15px" ></i>
                                                                                ${type.assetName}
                                                                            </a>
                                                                        </c:if> 
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="form-control" style="border: none">
                                                                <input class="input-file uniform_on" ${mand_status_15} id="attachmentReference"  type="file" value="" name="tenantAttachment"   onchange="checkfile(this);">
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
                                            <p>&nbsp;</p>
                                        </div>
                                        <div class="box-header well" data-original-title onclick="call2();" style="cursor: pointer;">
                                            <h4><b style="padding-left: 20px;">Property Details</b></h4><c:if test="${fn:length(message) > 0}"><a class="successalert" style="margin-left: 250px;">${message}</a></c:if>
                                            </div> 
                                            <div class="box-content" id="tag2"> 
                                            <c:if test="${fieldStatus_35 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_35 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_35}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_35} readonly="" id="assetName" name="assetName" maxlength="50" value="${assetName1}" onkeypress="return isNumberKey3(event)">
                                                                        <input type="hidden" id="assetCode" name="assetCode" value="${list.assetCode}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="assetName" value="${assetName1}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" ${mand_status_35} id="assetName" name="assetName" maxlength="50" value="" onkeypress="return isNumberKey3(event)">
                                                            <input type="hidden" id="assetCode" name="assetCode" value="">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_36 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_36 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_36}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_36} readonly="" id="subclassifiedAstno" name="subclassifiedAstno" maxlength="50" value="${subAssetName1}" onkeypress="return isNumberKey3(event)">
                                                                        <input type="hidden" id="subassetCode" name="subassetCode" value="${list.subAssetCode}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="subclassifiedAstno" value="${subAssetName1}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" ${mand_status_36} id="subclassifiedAstno" name="subclassifiedAstno" maxlength="50" readonly="" value="" onkeypress="return isNumberKey3(event)">
                                                            <input type="hidden" id="actualRent" name="actualRent" value="">
                                                            <input type="hidden" id="subassetCode" name="subassetCode" value="">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_37 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_37 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_37}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_37} readonly="" id="buildingNo" name="buildingNo" maxlength="50" value="${list.buildingNo}" onkeypress="return isNumberKey(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="buildingNo" value="${list.buildingNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" ${mand_status_37} id="buildingNo" name="buildingNo" maxlength="50" value="" onkeypress="return isNumberKey(event)">
                                                        </c:otherwise>        
                                                    </c:choose>
                                                </div></c:if>
                                                <p>&nbsp;</p>
                                            <c:if test="${fieldStatus_38 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_38 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_38}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_38} readonly="" id="wayNo" name="wayNo" maxlength="50" value="${list.way}" onkeypress="return isNumberKey3(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="wayNo" value="${list.way}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" ${mand_status_38} id="wayNo" name="wayNo" maxlength="50" value="" onkeypress="return isNumberKey3(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_39 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_39 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_39}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_39} readonly="" id="assetArea" name="assetArea" maxlength="50" value="${list.area}" onkeypress="return isNumberKey3(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="assetArea" value="${list.area}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" ${mand_status_39} id="assetArea" name="assetArea" maxlength="50" value="" onkeypress="return isNumberKey3(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_40 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_40 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_40}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_40} readonly="" id="blockNo" name="blockNo" maxlength="50" value="${list.blockNo}" onkeypress="return isNumberKey3(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="blockNo" value="${list.blockNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" ${mand_status_40} id="blockNo" name="blockNo" maxlength="50" value="" onkeypress="return isNumberKey3(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if><p>&nbsp;</p>
                                            <c:if test="${fieldStatus_41 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_41 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_41}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_41} readonly="" id="plotNo" name="plotNo" maxlength="50" value="${list.plotNo}" onkeypress="return isNumberKey3(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="plotNo" value="${list.plotNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" ${mand_status_41} id="plotNo" name="plotNo" maxlength="50" value="" onkeypress="return isNumberKey3(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_42 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_42 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_42}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_42} readonly="" id="streetNo" name="streetNo" maxlength="50" value="${list.streetNo}" onkeypress="return isNumberKey3(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="streetNo" value="${list.streetNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" ${mand_status_42} id="streetNo" name="streetNo" maxlength="50" value="" onkeypress="return isNumberKey3(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_43 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_43 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_43}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_43} readonly="" id="waterBillno" name="waterBillno" maxlength="50" value="${list.waterUtilityBillNo}" onkeypress="return isNumberKey(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="waterBillno" value="${list.waterUtilityBillNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" ${mand_status_43} id="waterBillno" name="waterBillno" maxlength="50" value="" onkeypress="return isNumberKey(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if><p>&nbsp;</p>
                                            <c:if test="${fieldStatus_44 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_44 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>                                                    
                                                    <label class="control-label">${field_44}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_44} readonly="" id="electricityBillno" name="electricityBillno" maxlength="50" value="${list.electricBillNo}" onkeypress="return isNumberKey(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="electricityBillno" value="${list.electricBillNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" ${mand_status_44} id="electricityBillno" name="electricityBillno" maxlength="50" value="" onkeypress="return isNumberKey(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_45 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_45 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_45}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_45} readonly="" id="assetPostalCode" name="assetPostalCode" maxlength="3" value="${list.postalCode}" onkeypress="return isNumberKey(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="assetPostalCode" value="${list.postalCode}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" ${mand_status_45} id="assetPostalCode" name="assetPostalCode" maxlength="3" value="" onkeypress="return isNumberKey(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_46 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_46 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_46}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_46} readonly="" id="assetPostboxNo" name="assetPostboxNo" maxlength="4" value="${list.postBoxNo}" onkeypress="return isNumberKey(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="assetPostboxNo" value="${list.postBoxNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" ${mand_status_46} id="assetPostboxNo" name="assetPostboxNo" maxlength="4" value="" onkeypress="return isNumberKey(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if><p>&nbsp;</p>
                                            </div>
                                            <div class="box-header well" data-original-title onclick="call3();" style="cursor: pointer;">
                                                <h4><b style="padding-left: 20px;">Contract Details</b></h4><c:if test="${fn:length(message) > 0}"><a class="successalert" style="margin-left: 250px;">${message}</a></c:if>
                                            </div> 
                                            <div class="box-content" id="tag3"> 
                                            <c:if test="${fieldStatus_47 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_47 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_47}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" placeholder="Select Contract Code" ${mand_status_47} readonly="" id="contractPeriod" name="contractPeriod" maxlength="50" onkeypress="return isNumberKey3(event)" onclick="selectContractName();">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="contractPeriod" value="${list.contractCode}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" ${mand_status_47} id="contractPeriod" name="contractPeriod" maxlength="50" value="" onkeypress="return isNumberKey3(event)" onclick="selectContractName();">
                                                            <input type="hidden" id="contSno" name="contSno" value="">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_48 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_48 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_48}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_48} readonly="" id="startsFrom" name="startsFrom" placeholder="Select Date" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.startsFrom}"/>">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="startsFrom" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.startsFrom}"/>">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="Select Date" class="form-control" ${mand_status_48} readonly id="startsFrom" name="startsFrom" value="" onclick="javascript:NewCssCal('startsFrom', 'ddMMMyyyy', '', '', '', '', '')">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_49 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_49 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if> 
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>

                                                    <label class="control-label">${field_49}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" placeholder="Select Date" ${mand_status_49} readonly="" id="endsTo" name="endsTo" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.endTo}"/>">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="endsTo" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.endTo}"/>">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="Select Date" class="form-control" ${mand_status_49} readonly id="endsTo" name="endsTo" value="" onclick="javascript:NewCssCal('endsTo', 'ddMMMyyyy', '', '', '', '', '')">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if><p>&nbsp;</p>
                                            <c:if test="${fieldStatus_55 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_55 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top: -20px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_55}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_55} readonly="" id="contractSigningDate" name="contractSigningDate" placeholder="Select Date" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.endTo}"/>" onclick="javascript:NewCssCal('contractSigningDate', 'ddMMMyyyy', '', '', '', '', '')">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="contractSigningDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.endTo}"/>">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="Select Date" class="form-control" ${mand_status_55} readonly id="contractSigningDate" name="contractSigningDate" value="" onclick="javascript:NewCssCal('contractSigningDate', 'ddMMMyyyy', '', '', '', '', '')">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>

                                            <c:if test="${action eq 'edit' || action eq 'view' }">
                                                <c:if test="${fieldStatus_50 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_50 eq 'required'}">
                                                            <a class="control-label-required" style="color:red;">*</a>
                                                        </c:if><a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                        <label class="control-label">${field_50}</label>
                                                        <table style="border:none;margin-left:139px;margin-top:-22px;"><tbody>
                                                                <c:choose>
                                                                    <c:when test="${fn:length(contDocument) > 0}">
                                                                        <c:forEach items="${contDocument}" var="attach">
                                                                            <c:choose>
                                                                                <c:when test="${action eq 'edit'}">
                                                                                    <tr><td><c:if test="${not empty attach.content}">
                                                                                                <a href="../insurance/contractAttachDownload.htm?sno=${attach.sno}&contractCode=${attach.contractCode}" class="fa fa-file-pdf-o" style="color: #000">${attach.filename}
                                                                                                    <span title="${attach.filename}"></span></a>
                                                                                                </c:if>
                                                                                                <c:if test="${empty attach.content}">N/A</c:if> 
                                                                                            </td></tr>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                    <tr><td><c:if test="${not empty attach.content}">
                                                                                                <a href="../insurance/contractAttachDownload.htm?sno=${attach.sno}&contractCode=${attach.contractCode}" class="fa fa-file-pdf-o" style="color: #000">${attach.filename}
                                                                                                    <span title="${attach.filename}"></span></a>
                                                                                                </c:if>
                                                                                                <c:if test="${empty attach.content}">N/A</c:if> 
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
                                                </c:if>
                                            </c:if>
                                            <p>&nbsp;</p>
                                            <p>&nbsp;</p>
                                        </div>
                                        <div class="box-header well" data-original-title onclick="call4();" style="cursor: pointer;">
                                            <h4><b style="padding-left: 20px;">Billing Cycle</b></h4><c:if test="${fn:length(message) > 0}"><a class="successalert" style="margin-left: 250px;">${message}</a></c:if>
                                            </div> 
                                            <div class="box-content" id="tag4"> 
                                            <c:if test="${fieldStatus_51 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_51 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_51}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <!--<input type="text" class="form-control" ${mand_status_51} readonly="" id="billingCycle" name="billingCycle" value="${list.billingCycle}">-->
                                                                        <select id="billingCycle" name="billingCycle" ${mand_status_51} class="form-control" onchange="rentPMonth();">
                                                                            <option value="" selected>Select your option</option>
                                                                            <option value="Monthly">Monthly</option>
                                                                            <option value="Quarterly">Quarterly</option>
                                                                            <option value="Half Yearly">Half Yearly</option>
                                                                            <option value="Yearly">Yearly</option>
                                                                        </select>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="billingCycle" value="${list.billingCycle}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <!--<input type="text" placeholder="" class="form-control" ${mand_status_51} id="billingCycle" name="billingCycle" value="" Monthly, quarterly, Half yearly, yearly>-->
                                                            <select id="billingCycle" name="billingCycle" ${mand_status_51} class="form-control" onchange="rentPMonth();">
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
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_52}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" ${mand_status_52}  id="advanceAmount" name="advanceAmount" maxlength="10" value="${list.minimumRentFixed}" onkeypress="return isNumberKey(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="advanceAmount" value="${list.minimumRentFixed}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" ${mand_status_52} id="advanceAmount" name="advanceAmount" maxlength="10" value="" onkeypress="return isNumberKey(event)" >
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_53 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_53 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <label class="control-label">${field_53}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" placeholder="Select Date" class="form-control" readonly="" id="dueDate" name="dueDate"  placeholder="Select Date" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.dueDate}"/>"  onclick="javascript:NewCssCal('dueDate', 'ddMMMyyyy', '', '', '', '', 'past')" onchange="">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="dueDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.dueDate}"/>">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="Select Date" class="form-control" readonly  id="dueDate" name="dueDate" value="" onclick="javascript:NewCssCal('dueDate', 'ddMMMyyyy', '', '', '', '', 'past')" onchange="dateCheckCondition();">
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
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" id="extra2" name="extra2" value="" maxlength="14" onkeypress="return check_digit(event, this, 10, 3);" onchange="rentPMonth();">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" value="${list.extra2}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" id="extra2" name="extra2" maxlength="14" value="" onkeypress="return check_digit(event, this, 10, 3);" onchange="rentPMonth();">
                                                        </c:otherwise>        
                                                    </c:choose>
                                                </div></c:if>
                                            <c:if test="${fieldStatus_54 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_54 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <label class="control-label">${field_54}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteDetailsList) > 0}">
                                                            <c:forEach items="${quoteDetailsList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" readonly id="totalAmount" name="totalAmount" maxlength=10" value="" onkeypress="return isNumberKey(event)" onchange="rentCalc();">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="totalAmount" value="${list.actualRentFixed}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly class="form-control" id="totalAmount" name="totalAmount" maxlength="10" value="" onkeypress="return isNumberKey(event)" onchange="rentCalc();">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                                <p>&nbsp;</p>
                                            </div>


                                            <p>&nbsp;</p>
                                             
                                            
                                        <c:if test="${action ne 'view'}">
                                            <!--<div class="col-md-4 col-sm-12 col-xs-12 form-inline">-->
                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                <!--<button type="submit" class="btn btn-primary" style="">Save</button>-->
                                                <button type="button" class="btn btn-primary" style="" onclick="return mandTest();">Convert To Tenant</button>
                                                <a href="../CRM/quoteList.htm" class="btn btn-danger">Cancel</a>
                                                <!--<a href="../CRM/quoteList.htm" class="btn btn-danger">CANCEL</a>-->
                                            </div>
                                            <!--</div>--> 
                                        </c:if>
                                    </form>
                                </div> 

                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <div id="custom_notifications" class="custom-notifications dsp_none">
            <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group"></ul>
            <div class="clearfix"></div>
            <div id="notif-group" class="tabbed_notifications"></div>
        </div>

        <script>
            NProgress.done();
        </script>
    </body>

</html>
