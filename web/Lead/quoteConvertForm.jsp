<%-- 
    Document   : quoteConvertForm
    Created on : 28 Sep, 2016, 4:45:29 PM
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
        <script src="../common/datepicker/datetimepicker_css.js" type="text/javascript"></script>
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

                        return false;
                    }
                });
                $("#tenantWorkContactno").change(function () {
                    var phone = $('input[name="tenantWorkContactno"]').val();
                    intRegex = /[0-9 -()+]+$/;
                    if ((phone.length < 8) || (!intRegex.test(phone)))
                    {
                        $('#tenantWorkContactno').val('');

                        return false;
                    }
                });
                $("#companyName").attr("readonly", true);
                $("#companyAddress").attr("readonly", true);

            });
            function selectLandLord()
            {
                myWindow = window.open("../tenant/selectLandLord.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
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
            function emailValidate() {
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
            function pstbxno()
            {

                var postbxno = document.getElementById("tenantpostboxNo").value;
                var mob = postbxno.length;
                if (mob < 4) {
                    alert("Enter Valid Post Box No.");
                    $('#tenantpostboxNo').val("");
                    return false;
                }


            }
            function pstbxno1()
            {

                var postbxno = document.getElementById("sponsorpostboxNo").value;
                var mob = postbxno.length;
                if (mob < 4) {
                    alert("Enter Valid Post Box No.");
                    $('#sponsorpostboxNo').val("");
                    return false;
                }


            }
            function pstbxno2()
            {

                var postbxno = document.getElementById("assetPostboxNo").value;
                var mob = postbxno.length;
                if (mob < 4) {
                    alert("Enter Valid Post Box No.");
                    $('#assetPostboxNo').val("");
                    return false;
                }


            }
            function postlcde()
            {

                var pincode = document.getElementById("tenentpostalCode").value;
                var mob = pincode.length;
                if (mob < 3) {
                    alert("Enter Valid Postal Code");
                    $('#tenentpostalCode').val("");
                    return false;
                }


            }
            function postlcde1()
            {

                var pincode = document.getElementById("sopnsorpostalCode").value;
                var mob = pincode.length;
                if (mob < 3) {
                    alert("Enter Valid Postal Code");
                    $('#sopnsorpostalCode').val("");
                    return false;
                }


            }
            function postlcde2()
            {

                var pincode = document.getElementById("assetPostalCode").value;
                var mob = pincode.length;
                if (mob < 3) {
                    alert("Enter Valid Postal Code");
                    $('#assetPostalCode').val("");
                    return false;
                }


            }
            function mobileNoValidation()
            {

                var mobileNo = document.getElementById("tenantContactno").value;
                var mob = mobileNo.length;
                if (mob < 8) {
                    alert("Enter Valid Mobile No.");
                    $('#tenantContactno').val("");
                    return false;
                }

            }
            function mobileNoValidation1()
            {

                var mobileNo = document.getElementById("tenantWorkContactno").value;
                var mob = mobileNo.length;
                if (mob < 8) {
                    alert("Enter Valid Mobile No.");
                    $('#tenantWorkContactno').val("");
                    return false;
                }

            }
            function compNameAndAddre()
            {
                var ifWorking = document.getElementById("ifWorking").value;
                if (ifWorking === 'Yes')
                {
                    $("#companyName").attr("readonly", false);
                    $("#companyAddress").attr("readonly", false);
                }
                if (ifWorking === 'No')
                {
                    $("#companyName").attr("readonly", true);
                    $("#companyAddress").attr("readonly", true);
                }

            }

            function selectContractName()
            {
                var tenantCategory = document.getElementById("tenantCategory").value;
                var subassetCode = document.getElementById("subclassifiedAstno").value;
                myWindow = window.open("../CRM/selectContractCode.htm?tenantCategory=" + tenantCategory + "&subassetCode=" + subassetCode + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }

            function selectAssetDetails()
            {
                var tenantCategory = document.getElementById("tenantCategory").value;
                myWindow = window.open("../CRM/selectAssetDetails.htm?tenantCategory=" + tenantCategory + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }

            function selectSubAssetDetails()
            {
                var assetCode = document.getElementById("assetCode").value;
                var tenantCategory = document.getElementById("tenantCategory").value;
                myWindow = window.open("../tenant/selectSubAssetDetails.htm?assetCode=" + assetCode + "&tenantCategory=" + tenantCategory + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
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

            function getContAttach() {
                var contCode = document.getElementById("contractCode").value;

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
            function mandTest() {
//                var llM = document.getElementById("llId").value;

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

//                var contM = document.getElementById("contractCode").value &&
//                        document.getElementById("contractName").value &&
//                        document.getElementById("minimumRentFixed").value &&
//                        document.getElementById("actualRentFixed").value;

                var billM = document.getElementById("billingCycle").value;
//                        document.getElementById("dueDate").value;

//                if (llM == '')
//                {
//                    callM();
//                    alert("Please Fill Mandatory Fields in Landlord Details");
//                    $('#llId').focus();
//                    return false;
//                }
                if (tenantM == '')
                {
                    callM();
                    alert("Please Fill Mandatory Fields in Tenant Details");
                    $('#tenantType').required();
                    $('#tenantCategory').focus();
                    $('#tenantId').focus();
                    $('#tenantFname').focus();
                    $('#tenantLname').focus();
                    $('#tenantCrNo').focus();
                    $('#tenantContactno').focus();
//                    $('#tenantMailid').focus();
                    $('#correspondenceAddress').focus();
                    return false;
                }
                if (assetM == '')
                {
                    callM1();
                    alert("Please Fill Mandatory Fields in Asset Details");
                    $('#assetName').focus();
                    $('#subclassifiedAstno').focus();
                    return false;
                }
                /*  
                 if (contM == '')
                 {
                 callM2();
                 alert("Please Fill Mandatory Fields in Contract Details");
                 $('#contractCode').focus();
                 $('#contractName').focus();
                 return false;
                 }
                 if (billM == '')
                 {
                 callM3();
                 alert("Please Fill Mandatory Fields in Billing Cycle");
                 $('#billingCycle').focus();
                 //                    $('#dueDate').focus();
                 return false;
                 }
                 
                 */
                else {
                    document.forms["rentQuoteConvertForm"].submit();
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

            function validateEmail1(sEmail) {
                var etext = document.getElementById('sponsorpostboxNo').value;
                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                if (etext.match(mailformat)) {
                    return true;
                } else {
                    alert("You have entered an invalid email address!");
                    document.getElementById('sponsorpostboxNo').value = "";

                }
            }

            function minActuRentAmtVali() {
                var advanceAmount = document.getElementById("actualRentFixed").value;
                var minimumRentFixed = document.getElementById("minimumRentFixed").value;
                if (minimumRentFixed == '') {
                    alert("Please Enter Minimun Rent First.")
                    document.getElementById("actualRentFixed").value = "";
                    return false;
                }
                else if (parseInt(advanceAmount) < parseInt(minimumRentFixed)) {
                    alert("Actual Rent Should Be Greater Then Minimum Rent.");
                    document.getElementById("actualRentFixed").value = "";
                }

            }

            function callM() {
                $("#tag").toggle();
                $("#tag1").hide();
                $("#tag2").hide();
                $("#tag3").hide();
            }
            function callM1() {
                $("#tag").hide();
                $("#tag1").toggle();
                $("#tag2").hide();
                $("#tag3").hide();
            }
            function callM2() {
                $("#tag").hide();
                $("#tag1").hide();
                $("#tag2").toggle();
                $("#tag3").hide();
            }
            function callM3() {
                $("#tag").hide();
                $("#tag1").hide();
                $("#tag2").hide();
                $("#tag3").toggle();
            }
            function callM4() {
                $("#tag").hide();
                $("#tag1").hide();
                $("#tag2").hide();
                $("#tag3").hide();
                $("#tag4").toggle();
            }

            //added by garun to check the duplicate tenant Id and Tenant CR No.
            function checkTenenatId() {
                var tenantId = document.getElementById('tenantId').value;
                //Ajax calling to check wether Tenant Id Exist or not
                $.ajax({
                    type: "POST",
                    url: '../CRM/checkTenenatId.htm',
                    data: {
                        tenantId: tenantId
                    },
                    success: function (data) {
                        if (data !== "") {
                            alert('Tenant Id is already exist');
                            document.getElementById('tenantId').value = '';
                            return false;
                        }
                    }
                });
                return true;
            }

            function checkTenenatCRId() {
                var tenantCrNo = document.getElementById('tenantCrNo').value;
                //Ajax calling to check wether Category Name Exist or not
                $.ajax({
                    type: "POST",
                    url: '../CRM/checkTenenatCRId.htm',
                    data: {
                        tenantCrNo: tenantCrNo
                    },
                    success: function (data) {
                        if (data !== "") {
                            alert('CR No. is already exist');
                            document.getElementById('tenantCrNo').value = '';
                            return false;
                        }
                    }
                });
                return true;
            }
            function fileCheck($this)
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
                        <form class="form-inline" id="rentQuoteConvertForm" action="../Lead/rentQuoteConvertFormSubmit.htm"  method="post" enctype="multipart/form-data">
                            <div class="col-md-6 col-xs-12">
                                <div class="x_panel">
                                    <jsp:include page="../login/headerlink.htm?submodule=Lead Management&tab=Lead Management&pagetype=form"/>

                                    <div class="x_title">
                                        <h2>Rent Quote Details</h2>
                                        <div class="clearfix"></div>
                                    </div>
                                    <br />

                                    <c:forEach items="${leadmanagmentList}" var="list">
                                        <c:set value="${list.leadName}" var="leadName"/>
                                        <c:set value="${list.contacts}" var="contacts"/>
                                        <c:set value="${list.leadCode}" var="leadCode"/>
                                    </c:forEach>
                                    <c:forEach items="${quoteFormData}" var="list">
                                        <c:if test="${list[0] eq '132'}">
                                            <c:set value="${list[1]}" var="field_2"/>
                                            <c:set value="${list[2]}" var="fieldStatus_2"/>
                                            <c:set value="${list[3]}" var="mand_status_2"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '133'}">
                                            <c:set value="${list[1]}" var="field_3"/>
                                            <c:set value="${list[2]}" var="fieldStatus_3"/>
                                            <c:set value="${list[3]}" var="mand_status_3"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '134'}">
                                            <c:set value="${list[1]}" var="field_4"/>
                                            <c:set value="${list[2]}" var="fieldStatus_4"/>
                                            <c:set value="${list[3]}" var="mand_status_4"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '135'}">
                                            <c:set value="${list[1]}" var="field_5"/>
                                            <c:set value="${list[2]}" var="fieldStatus_5"/>
                                            <c:set value="${list[3]}" var="mand_status_5"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '136'}">
                                            <c:set value="${list[1]}" var="field_6"/>
                                            <c:set value="${list[2]}" var="fieldStatus_6"/>
                                            <c:set value="${list[3]}" var="mand_status_6"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '137'}">
                                            <c:set value="${list[1]}" var="field_7"/>
                                            <c:set value="${list[2]}" var="fieldStatus_7"/>
                                            <c:set value="${list[3]}" var="mand_status_7"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '138'}">
                                            <c:set value="${list[1]}" var="field_8"/>
                                            <c:set value="${list[2]}" var="fieldStatus_8"/>
                                            <c:set value="${list[3]}" var="mand_status_8"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '139'}">
                                            <c:set value="${list[1]}" var="field_9"/>
                                            <c:set value="${list[2]}" var="fieldStatus_9"/>
                                            <c:set value="${list[3]}" var="mand_status_9"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '140'}">
                                            <c:set value="${list[1]}" var="field_10"/>
                                            <c:set value="${list[2]}" var="fieldStatus_10"/>
                                            <c:set value="${list[3]}" var="mand_status_10"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '141'}">
                                            <c:set value="${list[1]}" var="field_11"/>
                                            <c:set value="${list[2]}" var="fieldStatus_11"/>
                                            <c:set value="${list[3]}" var="mand_status_11"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '142'}">
                                            <c:set value="${list[1]}" var="field_12"/>
                                            <c:set value="${list[2]}" var="fieldStatus_12"/>
                                            <c:set value="${list[3]}" var="mand_status_12"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '143'}">
                                            <c:set value="${list[1]}" var="field_13"/>
                                            <c:set value="${list[2]}" var="fieldStatus_13"/>
                                            <c:set value="${list[3]}" var="mand_status_13"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '144'}">
                                            <c:set value="${list[1]}" var="field_14"/>
                                            <c:set value="${list[2]}" var="fieldStatus_14"/>
                                            <c:set value="${list[3]}" var="mand_status_14"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '145'}">
                                            <c:set value="${list[1]}" var="field_15"/>
                                            <c:set value="${list[2]}" var="fieldStatus_15"/>
                                            <c:set value="${list[3]}" var="mand_status_15"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '146'}">
                                            <c:set value="${list[1]}" var="field_16"/>
                                            <c:set value="${list[2]}" var="fieldStatus_16"/>
                                            <c:set value="${list[3]}" var="mand_status_16"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '147'}">
                                            <c:set value="${list[1]}" var="field_17"/>
                                            <c:set value="${list[2]}" var="fieldStatus_17"/>
                                            <c:set value="${list[3]}" var="mand_status_17"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '148'}">
                                            <c:set value="${list[1]}" var="field_18"/>
                                            <c:set value="${list[2]}" var="fieldStatus_18"/>
                                            <c:set value="${list[3]}" var="mand_status_18"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '149'}">
                                            <c:set value="${list[1]}" var="field_19"/>
                                            <c:set value="${list[2]}" var="fieldStatus_19"/>
                                            <c:set value="${list[3]}" var="mand_status_19"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '150'}">
                                            <c:set value="${list[1]}" var="field_20"/>
                                            <c:set value="${list[2]}" var="fieldStatus_20"/>
                                            <c:set value="${list[3]}" var="mand_status_20"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '151'}">
                                            <c:set value="${list[1]}" var="field_21"/>
                                            <c:set value="${list[2]}" var="fieldStatus_21"/>
                                            <c:set value="${list[3]}" var="mand_status_21"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '152'}">
                                            <c:set value="${list[1]}" var="field_22"/>
                                            <c:set value="${list[2]}" var="fieldStatus_22"/>
                                            <c:set value="${list[3]}" var="mand_status_22"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '153'}">
                                            <c:set value="${list[1]}" var="field_23"/>
                                            <c:set value="${list[2]}" var="fieldStatus_23"/>
                                            <c:set value="${list[3]}" var="mand_status_23"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '154'}">
                                            <c:set value="${list[1]}" var="field_24"/>
                                            <c:set value="${list[2]}" var="fieldStatus_24"/>
                                            <c:set value="${list[3]}" var="mand_status_24"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '155'}">
                                            <c:set value="${list[1]}" var="field_25"/>
                                            <c:set value="${list[2]}" var="fieldStatus_25"/>
                                            <c:set value="${list[3]}" var="mand_status_25"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '156'}">
                                            <c:set value="${list[1]}" var="field_26"/>
                                            <c:set value="${list[2]}" var="fieldStatus_26"/>
                                            <c:set value="${list[3]}" var="mand_status_26"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '157'}">
                                            <c:set value="${list[1]}" var="field_27"/>
                                            <c:set value="${list[2]}" var="fieldStatus_27"/>
                                            <c:set value="${list[3]}" var="mand_status_27"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '158'}">
                                            <c:set value="${list[1]}" var="field_28"/>
                                            <c:set value="${list[2]}" var="fieldStatus_28"/>
                                            <c:set value="${list[3]}" var="mand_status_28"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '159'}">
                                            <c:set value="${list[1]}" var="field_29"/>
                                            <c:set value="${list[2]}" var="fieldStatus_29"/>
                                            <c:set value="${list[3]}" var="mand_status_29"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '160'}">
                                            <c:set value="${list[1]}" var="field_30"/>
                                            <c:set value="${list[2]}" var="fieldStatus_30"/>
                                            <c:set value="${list[3]}" var="mand_status_30"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '161'}">
                                            <c:set value="${list[1]}" var="field_31"/>
                                            <c:set value="${list[2]}" var="fieldStatus_31"/>
                                            <c:set value="${list[3]}" var="mand_status_31"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '162'}">
                                            <c:set value="${list[1]}" var="field_32"/>
                                            <c:set value="${list[2]}" var="fieldStatus_32"/>
                                            <c:set value="${list[3]}" var="mand_status_32"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '163'}">
                                            <c:set value="${list[1]}" var="field_33"/>
                                            <c:set value="${list[2]}" var="fieldStatus_33"/>
                                            <c:set value="${list[3]}" var="mand_status_33"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '164'}">
                                            <c:set value="${list[1]}" var="field_34"/>
                                            <c:set value="${list[2]}" var="fieldStatus_34"/>
                                            <c:set value="${list[3]}" var="mand_status_34"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '165'}">
                                            <c:set value="${list[1]}" var="field_35"/>
                                            <c:set value="${list[2]}" var="fieldStatus_35"/>
                                            <c:set value="${list[3]}" var="mand_status_35"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '166'}">
                                            <c:set value="${list[1]}" var="field_36"/>
                                            <c:set value="${list[2]}" var="fieldStatus_36"/>
                                            <c:set value="${list[3]}" var="mand_status_36"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '167'}">
                                            <c:set value="${list[1]}" var="field_37"/>
                                            <c:set value="${list[2]}" var="fieldStatus_37"/>
                                            <c:set value="${list[3]}" var="mand_status_37"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '168'}">
                                            <c:set value="${list[1]}" var="field_38"/>
                                            <c:set value="${list[2]}" var="fieldStatus_38"/>
                                            <c:set value="${list[3]}" var="mand_status_38"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '169'}">
                                            <c:set value="${list[1]}" var="field_39"/>
                                            <c:set value="${list[2]}" var="fieldStatus_39"/>
                                            <c:set value="${list[3]}" var="mand_status_39"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '170'}">
                                            <c:set value="${list[1]}" var="field_40"/>
                                            <c:set value="${list[2]}" var="fieldStatus_40"/>
                                            <c:set value="${list[3]}" var="mand_status_40"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '171'}">
                                            <c:set value="${list[1]}" var="field_41"/>
                                            <c:set value="${list[2]}" var="fieldStatus_41"/>
                                            <c:set value="${list[3]}" var="mand_status_41"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '172'}">
                                            <c:set value="${list[1]}" var="field_42"/>
                                            <c:set value="${list[2]}" var="fieldStatus_42"/>
                                            <c:set value="${list[3]}" var="mand_status_42"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '173'}">
                                            <c:set value="${list[1]}" var="field_43"/>
                                            <c:set value="${list[2]}" var="fieldStatus_43"/>
                                            <c:set value="${list[3]}" var="mand_status_43"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '174'}">
                                            <c:set value="${list[1]}" var="field_44"/>
                                            <c:set value="${list[2]}" var="fieldStatus_44"/>
                                            <c:set value="${list[3]}" var="mand_status_44"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '175'}">
                                            <c:set value="${list[1]}" var="field_45"/>
                                            <c:set value="${list[2]}" var="fieldStatus_45"/>
                                            <c:set value="${list[3]}" var="mand_status_45"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '176'}">
                                            <c:set value="${list[1]}" var="field_46"/>
                                            <c:set value="${list[2]}" var="fieldStatus_46"/>
                                            <c:set value="${list[3]}" var="mand_status_46"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '177'}">
                                            <c:set value="${list[1]}" var="field_47"/>
                                            <c:set value="${list[2]}" var="fieldStatus_47"/>
                                            <c:set value="${list[3]}" var="mand_status_47"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '178'}">
                                            <c:set value="${list[1]}" var="field_48"/>
                                            <c:set value="${list[2]}" var="fieldStatus_48"/>
                                            <c:set value="${list[3]}" var="mand_status_48"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '179'}">
                                            <c:set value="${list[1]}" var="field_49"/>
                                            <c:set value="${list[2]}" var="fieldStatus_49"/>
                                            <c:set value="${list[3]}" var="mand_status_49"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '180'}">
                                            <c:set value="${list[1]}" var="field_50"/>
                                            <c:set value="${list[2]}" var="fieldStatus_50"/>
                                            <c:set value="${list[3]}" var="mand_status_50"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '181'}">
                                            <c:set value="${list[1]}" var="field_51"/>
                                            <c:set value="${list[2]}" var="fieldStatus_51"/>
                                            <c:set value="${list[3]}" var="mand_status_51"/>
                                        </c:if>
                                    </c:forEach>
                                    <c:forEach items="${fileSize}" var="list">
                                        <c:if test="${list[0] eq 'F-25'}">
                                            <input type="hidden" value="${list[1]}" id="docsize"/>
                                        </c:if>
                                    </c:forEach>

                                    <div class="box-header well" data-original-title onclick="call();" style="cursor: pointer;">
                                        <h4><b style="padding-left: 20px;">Tenant Details</b></h4><c:if test="${fn:length(message) > 0}"><a class="successalert" style="margin-left: 250px;">${message}</a></c:if>
                                        </div> 
                                        <div class="box-content" id="tag">  
                                        <c:if test="${fieldStatus_2 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_2 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_2}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_2} readonly="" id="tenantType" name="tenantType" value="${list.tenantType}">
                                                                    <input type="hidden" class="form-control"  id="sno" name="sno" value="${list.sno}">
                                                                    <input type="hidden" class="form-control"  id="tenantQuoteCode" name="tenantQuoteCode" value="${list.tenantQuoteCode}">
                                                                    <input type="hidden" class="form-control"  id="status" name="status" value="${list.status}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantType" value="${list.tenantType}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <!--<input type="text" placeholder="" class="form-control" id="tenantType" name="tenantType" value="">-->
                                                        <input type="hidden"  class="form-control" id="tenantQuoteCode" name="tenantQuoteCode" value="">

                                                        <select id="tenantType" name="tenantType" ${mand_status_2} class="form-control validate[required]">
                                                            <option value="" disabled selected>Select your option</option>
                                                            <c:forEach items="${tenantType}" var="type">
                                                                <option>${type}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_3 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_3 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_3}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_3} readonly="" id="tenantCategory" name="tenantCategory" value="${list.tenantCategory}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantCategory" value="${list.tenantCategory}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <!--<input type="text" placeholder="" class="form-control" ${mand_status_3} id="tenantCategory" name="tenantCategory" value="">-->
                                                        <select id="tenantCategory" name="tenantCategory" ${mand_status_3} class="form-control validate[required]">
                                                            <option value="" disabled selected>Select your option</option>
                                                            <c:forEach items="${tenantCategory}" var="type">
                                                                <option>${type}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_4 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_4 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_4}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_4}  id="tenantFname" name="tenantFname" value="${list.tenantFirstName}" onkeypress="return isNumberKey4(event)" autocomplete="off">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantFname" value="${list.tenantFirstName}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" style="text-transform: capitalize;" readonly="" class="form-control" ${mand_status_4} id="tenantFname" name="tenantFname" value="${leadName}" onkeypress="return isNumberKey4(event)" autocomplete="off">
                                                        <input type="hidden" name="leadCode" value="${leadCode}">
                                                        <input type="hidden" id="llSno" name="llSno" value="">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                            <p>&nbsp;</p>

                                        <c:if test="${fieldStatus_5 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_5 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_5}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_5}  id="tenantLname" name="tenantLname" value="${list.tenantLastName}" onkeypress="return isNumberKey4(event)" autocomplete="off">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantLname" value="${list.tenantLastName}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" style="text-transform: capitalize;" ${mand_status_5} id="tenantLname" name="tenantLname" value="" onkeypress="return isNumberKey4(event)" autocomplete="off">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_6 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_6 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-21px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_6}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_6} readonly="" id="tenantCitizenship" name="tenantCitizenship" value="${list.tenantCitizenship}" autocomplete="off">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantCitizenship" value="${list.tenantCitizenship}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <!--<input type="text" placeholder="" class="form-control" ${mand_status_6} id="tenantCitizenship" name="tenantCitizenship" value="">-->
                                                        <select id="tenantCitizenship" name="tenantCitizenship"  class="form-control" ${mand_status_6}>
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
                                                        </select>
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_7 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_7 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_7}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_7} readonly="" id="tenantId" name="tenantId" value="${list.tenantId}" onkeypress="return isNumberKey3(event)" autocomplete="off">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantId" value="${list.tenantId}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" ${mand_status_7} id="tenantId" name="tenantId" value="" onkeypress="return isNumberKey3(event)" autocomplete="off" onchange="return  checkTenenatId();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                            <p>&nbsp;</p>
                                        <c:if test="${fieldStatus_8 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_8 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-21px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_8}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_8}  maxlength="3" id="tenentpostalCode" name="tenentpostalCode" value="${list.tenantpostalCode}" onkeypress="return isNumberKey(event)" onchange="postlcde();" autocomplete="off">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenentpostalCode" value="${list.tenantpostalCode}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" ${mand_status_8} id="tenentpostalCode" name="tenentpostalCode" maxlength="3" value="" onkeypress="return isNumberKey(event)" onchange="postlcde();" autocomplete="off">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_9 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_9 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-21px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_9}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_9}  id="tenantpostboxNo" name="tenantpostboxNo" maxlength="4" value="${list.tenantPostBoxNo}" onkeypress="return isNumberKey(event)" onchange="pstbxno();" autocomplete="off">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantpostboxNo" value="${list.tenantPostBoxNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" ${mand_status_9} id="tenantpostboxNo" name="tenantpostboxNo" maxlength="4" value="" onkeypress="return isNumberKey(event)" onchange="pstbxno();" autocomplete="off">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>

                                        <c:if test="${fieldStatus_10 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_10 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-21px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_10}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input class=" input-file uniform_on" ${mand_status_10} id="tenantAttachment" name="tenantAttachment" type="file" value="" onchange="Validate(this)"  autocomplete="off">
                                                                    <input name="pk" type="hidden" value="${type.SNo}">
                                                                    <c:if test="${not empty list.tenantFilename}">
                                                                        <a style="color: black" href="../CRM/quoteAttachDownload.htm?sno=${list.sno}" title="Click to download">
                                                                            <i class="fa fa-file-pdf-o" style="font-size: 15px" ></i>
                                                                            ${list.tenantFilename}
                                                                            <input value="${list.tenantFilename}" name="tenantFilename" id="fileName" type="hidden" >
                                                                            <input value="${list.tenantAttachment}" name="tenantAttachment" id="content" type="hidden" >
                                                                        </a>
                                                                    </c:if> 
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <c:if test="${not empty list.tenantFilename}">
                                                                       <!--mm// ../tenant/tenanttAttachDownload.htm?sno=${type.SNo}bb-->
                                                                        <a style="color: black" href="../CRM/quoteAttachDownload.htm?sno=${list.sno}" title="Click to download">
                                                                            <i class="fa fa-file-pdf-o" style="font-size: 15px" ></i>
                                                                            ${list.tenantFilename}

                                                                        </a>
                                                                    </c:if> 
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="form-control" style="border: none">
                                                            <input class="input-file uniform_on" ${mand_status_10} id="tenantAttachment"  type="file" value="" name="tenantAttachment"  onchange="fileCheck(this);">
                                                            <!--                                                            <p style="float: left"><a href="#" id="attachmentReference" class="btn btn-upload" onclick="add1();">Attach Documents</a></p><br>
                                                                                                                        <label class="control-label" style="padding-right: 20px;">(PDF,XLS,DOC,Image)</label>-->
                                                        </div>
                                                        <input name="pk" type="hidden" value="${type.SNo}">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div> 
                                        </c:if>
                                        <p>&nbsp;</p>
                                        <c:if test="${fieldStatus_11 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_11 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-21px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_11}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_11}  id="jointeeName1" name="jointeeName1" value="${list.jointeeName1}" onkeypress="return isNumberKey4(event)" autocomplete="off">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="jointeeName1" value="${list.jointeeName1}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" ${mand_status_11} id="jointeeName1" name="jointeeName1" value="" onkeypress="return isNumberKey4(event)" autocomplete="off">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_12 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_12 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-20px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label" style="margin-top: -20px;">${field_12}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <textarea style="resize: none" rows="1" type="text" class="form-control" ${mand_status_12}  id="jointeeAddress1" name="jointeeAddress1" value="${list.jointeeAddress1}">${list.jointeeAddress1}</textarea>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <textarea style="resize: none" rows="1" type="text" class="form-control" readonly="" id="jointeeAddress1" value="${list.jointeeAddress1}">${list.jointeeAddress1}</textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <textarea style="resize: none" type="text" rows="1" placeholder="" class="form-control" ${mand_status_12} id="jointeeAddress1" name="jointeeAddress1" value=""></textarea>
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_13 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_13 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-21px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_13}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_13}  id="jointeeName2" name="jointeeName2" value="${list.jointeeName2}" onkeypress="return isNumberKey4(event)" autocomplete="off">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="jointeeName2" value="${list.jointeeName2}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" ${mand_status_13} id="jointeeName2" name="jointeeName2" value="" onkeypress="return isNumberKey4(event)" autocomplete="off">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                            <p>&nbsp;</p>

                                        <c:if test="${fieldStatus_14 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_14 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-20px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label" style="margin-top: -20px;">${field_14}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <textarea style="resize: none" rows="1" type="text" class="form-control" ${mand_status_14}  id="jointeeAddress2" name="jointeeAddress2" value="${list.jointeeAddress2}">${list.jointeeAddress2}</textarea>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <textarea style="resize: none" rows="1" type="text" class="form-control" readonly="" id="jointeeAddress2" value="${list.jointeeAddress2}">${list.jointeeAddress2}</textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <textarea style="resize: none" type="text" rows="1"  placeholder="" class="form-control" ${mand_status_14} id="jointeeAddress2" name="jointeeAddress2" value=""></textarea>
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>

                                        <c:if test="${fieldStatus_15 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_15 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-20px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_15}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_15}  id="sponcerName" name="sponcerName" value="${list.sponsorname}" onkeypress="return isNumberKey4(event)" autocomplete="off">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="sponcerName" value="${list.sponsorname}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" ${mand_status_15} id="sponcerName" name="sponcerName" value="" onkeypress="return isNumberKey4(event)" autocomplete="off">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_16 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_16 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-20px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_16}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="ifWorking" name="ifWorking" value="${list.ifWorking}" >
<!--                                                                    <select class="form-control " id="ifWorking" name="ifWorking" value="${list.ifWorking}" onchange="checkavl(this.value);">
                                                                        <option value="${list.ifWorking}"  selected>Select Option</option>
                                                                        <option value="Yes">Yes</option>
                                                                        <option value="No">No</option>
                                                                    </select>-->
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="ifWorking" value="${list.ifWorking}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <select class="form-control " id="ifWorking" name="ifWorking" value="" onchange="compNameAndAddre(this.value);"  >
                                                            <option value="" disabled selected>Select Option</option>
                                                            <option value="Yes">Yes</option>
                                                            <option value="No">No</option>
                                                        </select>
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>

                                            <p>&nbsp;</p>

                                        <c:if test="${fieldStatus_17 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_17 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-20px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_17}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_17}  id="companyName" name="companyName" value="${list.companyName}" onkeypress="return isNumberKey4(event)" autocomplete="off">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="companyName" value="${list.companyName}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" ${mand_status_17} id="companyName" name="companyName" value="" onkeypress="return isNumberKey4(event)" autocomplete="off">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_18 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_18 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-20px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label" style="margin-top: -20px;">${field_18}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <textarea style="resize: none" rows="1" type="text" class="form-control" ${mand_status_18}  id="companyAddress" name="companyAddress" value="${list.companyAddress}">${list.companyAddress}</textarea>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <textarea style="resize: none" rows="1" type="text" class="form-control" readonly="" id="companyAddress" value="${list.companyAddress}">${list.companyAddress}</textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <textarea style="resize: none" rows="1" type="text" placeholder="" class="form-control" ${mand_status_18} id="companyAddress" name="companyAddress" value=""></textarea>
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_19 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_19 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_19}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_19}  id="tenantCrNo" name="tenantCrNo" value="${list.crno}" onkeypress="return isNumberKey3(event)" autocomplete="off" onchange="return checkTenenatCRId();">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantCrNo" value="${list.crno}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" ${mand_status_19} id="tenantCrNo" name="tenantCrNo" value="" onkeypress="return isNumberKey3(event)" autocomplete="off" onchange="return checkTenenatCRId();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                            <p>&nbsp;</p>

                                        <c:if test="${fieldStatus_20 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_20 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_20}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_20}  id="tenantContactno" name="tenantContactno" maxlength="11" value="${list.contactNo}" onkeypress="return isNumberKey(event)" onchange="mobileNoValidation()" autocomplete="off">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantContactno" value="${list.contactNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder=""  class="form-control" ${mand_status_20} id="tenantContactno" name="tenantContactno" value="${contacts}" maxlength="11" onkeypress="return isNumberKey(event)" onchange="mobileNoValidation()" autocomplete="off">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_21 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_21 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-20px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_21}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_21}  id="tenantWorkContactno" name="tenantWorkContactno" maxlength="11" value="${list.tenantWorkContactNo}" onkeypress="return isNumberKey(event)" onchange="mobileNoValidation1()" autocomplete="off">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantWorkContactno" value="${list.tenantWorkContactNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" ${mand_status_21} id="tenantWorkContactno" name="tenantWorkContactno" value="" maxlength="11" onkeypress="return isNumberKey(event)" onchange="mobileNoValidation1()" autocomplete="off">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_22 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_22 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_22}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_22}  id="tenantMailid" name="tenantMailid" value="${list.mailId}" max="60" onchange="emailValidate();" autocomplete="off">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantMailid" value="${list.mailId}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" ${mand_status_22} id="tenantMailid" name="tenantMailid" value="" max="60"  onchange="emailValidate();" autocomplete="off">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                            <p>&nbsp;</p>

                                        <c:if test="${fieldStatus_23 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_23 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-20px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label" style="margin-top: -20px;">${field_23}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <textarea type="text" class="form-control" rows="1" style="resize: none" ${mand_status_23}  id="permanentAddress" name="permanentAddress" value="${list.permanentAddress}">${list.permanentAddress}</textarea>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <textarea type="text" class="form-control" rows="1" style="resize: none" readonly="" id="permanentAddress" value="${list.permanentAddress}">${list.permanentAddress}</textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <textarea type="text" placeholder="" rows="1" style="resize: none" class="form-control" ${mand_status_23} id="permanentAddress" name="permanentAddress" value=""></textarea>
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_24 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_24 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label" style="margin-top: 10px;">${field_24}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <textarea type="text" rows="1" class="form-control" style="resize: none" ${mand_status_24}  id="correspondenceAddress" name="correspondenceAddress" value="${list.correspondingAddress}">${list.correspondingAddress}</textarea>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <textarea type="text" rows="1" class="form-control" style="resize: none" readonly="" id="correspondenceAddress" value="${list.correspondingAddress}">${list.correspondingAddress}</textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <textarea type="text" placeholder="" rows="1" style="resize: none" class="form-control" ${mand_status_24} id="correspondenceAddress" name="correspondenceAddress" value=""></textarea>
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_25 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_25 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-20px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label" style="margin-top: -20px;">${field_25}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <textarea type="text" rows="1" class="form-control" placeholder="" style="resize: none" ${mand_status_25}  id="sponcerAddress" name="sponcerAddress" value="${list.sponsorAddress}">${list.sponsorAddress}</textarea>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <textarea type="text" rows="1" class="form-control" placeholder="" style="resize: none" readonly="" id="sponcerAddress" value="${list.sponsorAddress}">${list.sponsorAddress}</textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <textarea style="resize: none" rows="1" class="form-control" type="text" placeholder=""  ${mand_status_25} id="sponcerAddress" name="sponcerAddress" value=""></textarea>
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                            <p>&nbsp;</p>

                                        <c:if test="${fieldStatus_26 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_26 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-20px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_26}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_26}  id="sopnsorpostalCode" maxlength="10" name="sopnsorpostalCode" value="${list.sponsorPostalCode}" onkeypress="return isNumberKey(event)" onchange="postlcde1();" autocomplete="off">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="sopnsorpostalCode" maxlength="3" value="${list.sponsorPostalCode}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" ${mand_status_26} id="sopnsorpostalCode"  name="sopnsorpostalCode" value="" onkeypress="return isNumberKey(event)" maxlength="10" onchange="postlcde1();" autocomplete="off">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_27 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_27 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-20px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_27}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_27}  id="sponsorpostboxNo" name="sponsorpostboxNo" maxlength="4" value="${list.sponsorPostBoxNo}" maxlength="40" value=""  onchange="return validateEmail1(event);" autocomplete="off">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="sponsorpostboxNo" value="${list.sponsorPostBoxNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" ${mand_status_27} id="sponsorpostboxNo" name="sponsorpostboxNo" maxlength="40" value=""  onchange="return validateEmail1(event);" autocomplete="off">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_28 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_28 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-20px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_28}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <textarea style="resize: none" rows="1" type="text" class="form-control" ${mand_status_28}  id="tenentHistory" name="tenentHistory" value="${list.tenantHistory}">${list.tenantHistory}</textarea>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <textarea style="resize: none" rows="1" type="text" class="form-control" readonly="" id="tenentHistory" value="${list.tenantHistory}">${list.tenantHistory}</textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <textarea style="resize: none" type="text" rows="1" placeholder="" class="form-control" ${mand_status_28} id="tenentHistory" name="tenentHistory" value=""></textarea>
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>


                                            <p>&nbsp;</p>


                                        <c:if test="${fieldStatus_29 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_29 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-20px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label" style="margin-top: -20px;">${field_29}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <textarea style="resize: none" rows="1" type="text" class="form-control" ${mand_status_29}  id="remarks" name="remarks" value="${list.remarks}">${list.remarks}</textarea>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <textarea style="resize: none" rows="1" type="text" class="form-control" readonly="" id="remarks" value="${list.remarks}">${list.remarks}</textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <textarea style="resize: none" rows="1" type="text" placeholder="" class="form-control" ${mand_status_29} id="remarks" name="remarks" value=""></textarea>
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>

                                            <p>&nbsp;</p>
                                            <p>&nbsp;</p>
                                        </div>
                                        <div class="box-header well" data-original-title onclick="call1();" style="cursor: pointer;">
                                            <h4><b style="padding-left: 20px;">Property Details</b></h4><c:if test="${fn:length(message) > 0}"><a class="successalert" style="margin-left: 250px;">${message}</a></c:if>
                                        </div> 
                                        <div class="box-content" id="tag1"> 
                                        <c:if test="${fieldStatus_30 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_30 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_30}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_30} readonly="" id="assetName" name="assetName" value="${list.assetName}" onkeypress="return isNumberKey3(event)" autocomplete="off">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="assetName" value="${list.assetName}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Select Property Name" class="form-control" ${mand_status_30} readonly="" id="assetName" name="assetName" value="" onkeypress="return isNumberKey3(event)" onclick="selectAssetDetails();" autocomplete="off">
                                                        <input type="hidden" id="assetCode" name="assetCode" value="">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_31 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_31 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_31}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_31} readonly="" id="subclassifiedAstno" name="subclassifiedAstno" value="${list.subClassifiedAssetName}" onkeypress="return isNumberKey3(event)" autocomplete="off">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="subclassifiedAstno" value="${list.subClassifiedAssetName}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Select Flat Name" class="form-control" ${mand_status_31} id="flatNo" readonly="" name="flatNo" value="" onkeypress="return isNumberKey3(event)" onclick="selectSubAssetDetails();" autocomplete="off">
                                                        <input type="hidden" id="subclassifiedAstno" name="subclassifiedAstno" value="">
                                                        <input type="hidden" id="actualRent" name="actualRent" value="">
                                                        <input type="hidden" id="totalAmount" name="totalAmount" value="">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_32 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_32 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-20px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_32}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_32} readonly="" id="buildingNo" name="buildingNo" value="${list.buildingNo}" onkeypress="return isNumberKey(event)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="buildingNo" value="${list.buildingNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" ${mand_status_32} id="buildingNo" readonly="" name="buildingNo" value="" onkeypress="return isNumberKey(event)">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div></c:if>
                                            <p>&nbsp;</p>
                                        <c:if test="${fieldStatus_33 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_33 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-20px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_33}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_33} readonly="" id="waterBillno" name="waterBillno" value="${list.waterUtilityBillNo}" onkeypress="return isNumberKey(event)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="waterBillno" value="${list.waterUtilityBillNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" ${mand_status_33} id="waterBillno" readonly="" name="waterBillno" value="" onkeypress="return isNumberKey(event)">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_34 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_34 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-20px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_34}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_34} readonly="" id="assetArea" name="assetArea" value="${list.area}" onkeypress="return isNumberKey3(event)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="assetArea" value="${list.area}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" ${mand_status_34} readonly="" id="assetArea" name="assetArea" value="" onkeypress="return isNumberKey3(event)">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_35 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_35 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-20px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_35}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_35} readonly="" id="blockNo" name="blockNo" value="${list.blockNo}" onkeypress="return isNumberKey3(event)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="blockNo" value="${list.blockNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" readonly="" class="form-control" ${mand_status_35} id="blockNo" name="blockNo" value="" onkeypress="return isNumberKey3(event)">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                            <p>&nbsp;</p>
                                        <c:if test="${fieldStatus_36 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_36 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-20px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_36}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_36} readonly="" id="plotNo" name="plotNo" value="${list.plotNo}" onkeypress="return isNumberKey3(event)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="plotNo" value="${list.plotNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" readonly="" class="form-control" ${mand_status_36} id="plotNo" name="plotNo" value="" onkeypress="return isNumberKey3(event)">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_37 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_37 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-20px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_37}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_37} readonly="" id="electricityBillno" name="electricityBillno" value="${list.electricBillNo}" onkeypress="return isNumberKey(event)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="electricityBillno" value="${list.electricBillNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" readonly="" class="form-control" ${mand_status_37} id="electricityBillno" name="electricityBillno" value="" onkeypress="return isNumberKey(event)">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_38 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_38 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-20px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_38}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_38} readonly="" id="wayNo" name="wayNo" value="${list.way}" onkeypress="return isNumberKey3(event)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="wayNo" value="${list.way}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" readonly="" class="form-control" ${mand_status_38} id="wayNo" name="wayNo" value="" onkeypress="return isNumberKey3(event)">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>

                                            <p>&nbsp;</p>
                                        <c:if test="${fieldStatus_39 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_39 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-20px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_39}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_39} readonly="" id="streetNo" name="streetNo" value="${list.streetNo}" onkeypress="return isNumberKey3(event)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="streetNo" value="${list.streetNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" readonly="" class="form-control" ${mand_status_39} id="streetNo" name="streetNo" value="" onkeypress="return isNumberKey3(event)">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>

                                        <c:if test="${fieldStatus_41 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_41 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-20px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_41}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_41} readonly="" id="assetPostalCode" name="assetPostalCode" maxlength="3" value="${list.postalCode}" onkeypress="return isNumberKey(event)" onchange="postlcde2();">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="assetPostalCode" value="${list.postalCode}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" readonly="" class="form-control" ${mand_status_41} id="assetPostalCode" name="assetPostalCode" maxlength="3" value="" onkeypress="return isNumberKey(event)" onchange="postlcde2();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_42 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_42 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;margin-top:-20px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_42}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_42} readonly="" id="assetPostboxNo" name="assetPostboxNo" maxlength="4" value="${list.postBoxNo}" onkeypress="return isNumberKey(event)" onchange="pstbxno2();">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="assetPostboxNo" value="${list.postBoxNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" readonly="" class="form-control" ${mand_status_42} id="assetPostboxNo" readonly="" name="assetPostboxNo" value="" maxlength="4" onkeypress="return isNumberKey(event)" onchange="pstbxno2();">
                                                        <input type="hidden" name="extra2" id="extra2" value="">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                            <p>&nbsp;</p>
                                            <p>&nbsp;</p>
                                        </div>
                                        <div class="box-header well" data-original-title onclick="call2();" style="cursor: pointer;display: none;">
                                            <h4><b style="padding-left: 20px;">Contract Details</b></h4><c:if test="${fn:length(message) > 0}"><a class="successalert" style="margin-left: 250px;">${message}</a></c:if>
                                        </div> 
                                        <div class="box-content" id="tag2"> 
                                        <c:if test="${fieldStatus_43 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_43 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_43}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_43} readonly="" id="contractCode" name="contractCode" value="${list.contractCode}" onclick="selectContractName();" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="contractCode" value="${list.contractCode}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text"  class="form-control" ${mand_status_43} id="contractCode" name="contractCode" required=""  value="" readonly="" placeholder="Select Contract Code" onclick="selectContractName();" onblur="return getContAttach();">
                                                        <input type="hidden" id="contSno" name="contSno" value="">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_44 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_44 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_44}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_44} readonly="" id="contractName" name="contractName" value="${list.contractName}" onkeypress="return isNumberKey3(event)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="contractName" value="${list.contractName}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Contract Name" class="form-control" ${mand_status_44} id="contractName" readonly=""  name="contractName" value=""  onkeypress="return isNumberKey3(event)">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_45 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_45 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_45}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_45} readonly="" id="startsFrom" name="startsFrom" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.startsFrom}"/>">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="startsFrom" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.startsFrom}"/>">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Select Date" class="form-control" ${mand_status_45} readonly id="startsFrom" name="startsFrom" value="" onclick="javascript:NewCssCal('startsFrom', 'ddMMMyyyy', '', '', '', '', '')">
                                                    </c:otherwise>        
                                                </c:choose>
                                                <p>&nbsp;</p>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_46 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_46 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_46}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" placeholder="Select Date" ${mand_status_46} readonly="" id="endsTo" name="endsTo" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.endTo}"/>">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="endsTo" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.endTo}"/>">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Select Date" class="form-control" ${mand_status_46} readonly id="endsTo" name="endsTo" value="" onclick="javascript:NewCssCal('endsTo', 'ddMMMyyyy', '', '', '', '', '')">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>


                                        <c:if test="${fieldStatus_47 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_47 eq 'required'}">
                                                    <a  style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_47}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
    <!--                                                            mm    <input class=" input-file uniform_on" ${mand_status_47} id="contractAttachment" name="contractAttachment" type="file" >
                                                                    <input name="pk" type="hidden" value="${type.SNo}">
                                                                    <c:if test="${not empty list.contractFileName}">
                                                                        <a style="color: black" href="../CRM/quoteContractAttachDownload.htm?sno=${list.sno}" title="Click to download">
                                                                            <i class="fa fa-file-pdf-o" style="font-size: 15px" ></i>
                                                                        ${list.contractFileName}
                                                                        <input value="${list.contractFileName}" name="contractFileName" id="fileName" type="hidden" >
                                                                        <input value="${list.contractAttachment}" name="contractAttachment" id="content" type="hidden" >
                                                                    </a>
                                                                    </c:if> mm-->
                                                                    <img src="../common/theme/images/images.png" height="30px" width="30px" onclick="testContImage();">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <!--                                                               mm <c:if test="${not empty list.contractFileName}">
                                                                                                                                        mm../tenant/tenantcAttachDownload.htm?sno=${type.SNo}mm
                                                                                                                                        <a style="color: black" href="../CRM/quoteContractAttachDownload.htm?sno=${list.sno}" title="Click to download">
                                                                                                                                            <i class="fa fa-file-pdf-o" style="font-size: 15px" ></i>
                                                                        ${list.contractFileName}
                                                                    </a>
                                                                    </c:if> mm-->
                                                                    <img src="../common/theme/images/images.png" height="30px" width="30px" onclick="testContImage();">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <!--                                                                                                        <div class="form-control" style="border: none">
                                                                                                                                                                    <input class="input-file uniform_on" ${mand_status_47} id="contractAttachment"  type="file" value="" name="contractAttachment"  onchange="Validate(this)">
                                                                                                                                                                    </div>
                                                                                                                                                                <input name="pk" type="hidden" value="${list.SNo}">-->
                                                        <img src="../common/theme/images/images.png" height="30px" width="30px" onclick="testContImage();">
                                                        <input class="input-file uniform_on" ${mand_status_47} id="contractAttachment"  type="hidden" value="" name="contractAttachment"  onchange="Validate(this)">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div> 
                                        </c:if>
                                        <c:if test="${fieldStatus_48 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_48 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_48}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_48} readonly="" id="minimumRentFixed" name="minimumRentFixed" value="${list.minimumRentFixed}" onkeypress="return isNumberKey(event)" autocomplete="off">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="minimumRentFixed" value="${list.minimumRentFixed}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" ${mand_status_48} required id="minimumRentFixed" name="minimumRentFixed" value="" onkeypress="return isNumberKey(event)" autocomplete="off">
                                                    </c:otherwise>        
                                                </c:choose>
                                                <p>&nbsp;</p>
                                            </div></c:if>
                                        <c:if test="${fieldStatus_49 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_49 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_49}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_49} readonly="" id="actualRentFixed" name="actualRentFixed" value="${list.actualRentFixed}" onkeypress="return isNumberKey(event)" autocomplete="off" onchange="minActuRentAmtVali();">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="actualRentFixed" value="${list.actualRentFixed}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" ${mand_status_49} required id="actualRentFixed" name="actualRentFixed" value="" onkeypress="return isNumberKey(event)" autocomplete="off" onchange="minActuRentAmtVali();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                            <p>&nbsp;</p>
                                            <p>&nbsp;</p>
                                        </div>
                                        <div class="box-header well" data-original-title onclick="call3();" style="cursor: pointer;display: none;">
                                            <h4><b style="padding-left: 20px;">Billing Cycle</b></h4><c:if test="${fn:length(message) > 0}"><a class="successalert" style="margin-left: 250px;">${message}</a></c:if>
                                        </div> 
                                        <div class="box-content" id="tag3"> 
                                        <c:if test="${fieldStatus_50 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_50 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a class="control-label-required" style="color:red;">*</a>
                                                <label class="control-label">${field_50}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_50} readonly="" id="billingCycle" name="billingCycle" value="${list.billingCycle}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="billingCycle" value="${list.billingCycle}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <!--<input type="text" placeholder="" class="form-control" ${mand_status_50} id="billingCycle" name="billingCycle" value="" Monthly, quarterly, Half yearly, yearly>-->
                                                        <select id="billingCycle" name="billingCycle" ${mand_status_45} class="form-control">
                                                            <option value="" selected>Select your option</option>
                                                            <option value="Monthly">Monthly</option>
                                                            <option value="Quarterly">Quarterly</option>
                                                            <option value="Half Yearly">Half Yearly</option>
                                                            <option value="Yearly">Yearly</option>
                                                        </select>
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_51 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_51 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a class="control-label-required" style="color:transparent;">*</a>
                                                <label class="control-label">${field_51}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(quoteList) > 0}">
                                                        <c:forEach items="${quoteList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" placeholder="Select Date" class="form-control" ${mand_status_51} readonly="" id="dueDate" name="dueDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.dueDate}"/>">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="dueDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.dueDate}"/>">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Select Date" class="form-control" ${mand_status_51} readonly  id="dueDate" name="dueDate" value="" onclick="javascript:NewCssCal('dueDate', 'ddMMMyyyy', '', '', '', '', '')">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if></div>
                                        <p>&nbsp;</p>

                                        
                                        
                                    <c:if test="${action ne 'view'}">
                                        <!--<div class="col-md-4 col-sm-12 col-xs-12 form-group">-->
                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                            <button type="button" class="btn btn-primary" style="" onclick="return mandTest();">Save</button>
                                            <a href="../Lead/LeadManagementListNew.htm"  class="btn btn-danger"  style="">Cancel</a>
                                        </div>
                                        <!--</div>--> 
                                    </c:if>


                                </div>

                            </div>
                        </form>
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
            window.onload = getContAttach();
            window.onload = getLlAttach();
        </script>
    </body>

</html>
