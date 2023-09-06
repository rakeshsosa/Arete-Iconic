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
                jQuery("#tenantform").validationEngine();
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
            function firstToUpperCase1() {

                var str = document.getElementById("tenantLname").value;
                var a = str.charAt(0).toUpperCase() + str.substr(1);
                $("#tenantLname").val(a);
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
            function selectLandLord()
            {
                myWindow = window.open("../tenant/selectLandLord.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function selectAssetDetails()
            {
                var tenantCategory = document.getElementById("tenantCategory").value;
                myWindow = window.open("../tenant/selectAssetDetails.htm?tenantCategory=" + tenantCategory + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                document.getElementById("flatNo").value = "";
                document.getElementById("waterBillno").value = "";
                document.getElementById("electricityBillno").value = "";
            }
            function selectSubAssetDetails()
            {
                var assetCode = document.getElementById("assetCode").value;
                var tenantCategory = document.getElementById("tenantCategory").value;
                var tenantType = document.getElementById("tenantType").value;
                if ("Shared" == tenantType) {
                    myWindow = window.open("../tenant/selectRoomDetails.htm?assetCode=" + assetCode + "&tenantCategory=" + tenantCategory + "&tenantType=" + tenantType + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                } else {
                    myWindow = window.open("../tenant/selectSubAssetDetails.htm?assetCode=" + assetCode + "&tenantCategory=" + tenantCategory + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                }
            }
            function selectContractCode()
            {
                var tenantCategory = document.getElementById("tenantCategory").value;
                var flatNo = document.getElementById("subclassifiedAstno").value;
                myWindow = window.open("../tenant/selectContractCode.htm?tenantCategory=" + tenantCategory + "&flatNo=" + flatNo + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
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
                var itmTot = parseFloat(document.getElementById("itmTot").value);
                var commonitmTot = parseFloat(document.getElementById("commonitmTot").value);
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

//                else if (rentTenant < actualRent) {
//                    alert("Rent amount can not be less than actual rent i.e," + actualRent);
//                    document.getElementById("extra2").value = "";
//                    document.getElementById("totalAmount").value = "";
//                    return false;
//                } 
                else {
                    rentPMonth();
                    return true;
                }
            }

            function drentCalc() {
                // var actualRent = parseFloat(document.getElementById("actualRent").value);
                var rentTenant = parseFloat(document.getElementById("DiscountforRent").value);
                //var advanceAmount = parseFloat(document.getElementById("advanceAmount").value);
                if (rentTenant == '0') {
                    alert("Invalid Amount..");
                    document.getElementById("DiscountforRent").value = "";
                    return false;
                }
//                else if(advanceAmount == '0'){
//                    alert("Invalid Amount..");
//                    document.getElementById("advanceAmount").value="";
//                    return false;
//                }

//                else if (rentTenant < actualRent) {
//                    alert("Rent amount can not be less than actual rent i.e," + actualRent);
//                    document.getElementById("extra2").value = "";
//                    document.getElementById("totalAmount").value = "";
//                    return false;
//                } 
                else {
                    drentPMonth();
                    return true;
                }
            }

            function darentCalc() {
                // var actualRent = parseFloat(document.getElementById("actualRent").value);
                var rentTenant = parseFloat(document.getElementById("DiscountforAdvance").value);
                //var advanceAmount = parseFloat(document.getElementById("advanceAmount").value);
                if (rentTenant == '0') {
                    alert("Invalid Amount..");
                    document.getElementById("DiscountforAdvance").value = "";
                    return false;
                }
//                else if(advanceAmount == '0'){
//                    alert("Invalid Amount..");
//                    document.getElementById("advanceAmount").value="";
//                    return false;
//                }

//                else if (rentTenant < actualRent) {
//                    alert("Rent amount can not be less than actual rent i.e," + actualRent);
//                    document.getElementById("extra2").value = "";
//                    document.getElementById("totalAmount").value = "";
//                    return false;
//                } 
                else {
                    darentPMonth();
                    return true;
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
            function getAssetUtilityDetails() {
                var llId = document.getElementById("llId").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../tenant/getAssetUtilityDetails.htm',
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
                var tenantLname = document.getElementById("tenantLname").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../tenant/fetchTName.htm',
                            data: {
                                tenantFname: tenantFname,
                                tenantLname: tenantLname
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    //alert("This Record Already Exist");
                                   // document.getElementById("tenantFname").value = "";
                                    //document.getElementById("tenantLname").value = "";
                                    return true;
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
                                   // alert("This Record Already Exist");
                                    //document.getElementById("tenantCrNo").value = "";
                                    return true;
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
//                        document.getElementById("tenantMailid").value &&
                        document.getElementById("correspondenceAddress").value;
                var assetM = document.getElementById("assetName").value &&
                        document.getElementById("flatNo").value;
                var contM = document.getElementById("contractPeriod").value;
                var billM = document.getElementById("billingCycle").value &&
                        document.getElementById("advanceAmount").value &&
                        document.getElementById("extra2").value;
//                        document.getElementById("totalAmount").value;
                var advanceAmount = document.getElementById("advanceAmount").value;
                var totalAmount = document.getElementById("totalAmount").value;
//                var amcM = document.getElementById("amctenantName").value;

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
                    return false;
                }
                if (assetM == '')
                {
                    callM2();
                    alert("Please Fill Mandatory Fields in Property Details");
                    $('#assetName').focus();
                    $('#flatNo').focus();
                    return false;
                }
                if (contM == '')
                {
                    callM3();
                    alert("Please Fill Mandatory Fields in Contract Details");
                    $('#contractPeriod').focus();
                    return false;
                }
                if (billM == '' || totalAmount == '.' || totalAmount == '.')
                {
                    callM4();
                    alert("Please Fill Mandatory Fields in Billing Cycle");
                    $('#billingCycle').focus();
                    $('#advanceAmount').focus();
//                    $('#dueDate').focus();
                    $('#totalAmount').focus();
                    return false;
                }
//                if (amcM == '')
//                {
//                    callM5();
//                    alert("Please Fill Mandatory Fields in Billing Cycle");
//                    $('#amctenantName').focus();
//
//                    return false;
//                }
                else {
                    return true;
                }
            }

            function readURL2(input) {
                //$('#blah1').show();
                var imageId = input.id;
                checkImageSizefile(input, imageId);
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

//        reader.onload = function (e) {
//            $('#blah1')
//                    .attr('src', e.target.result)
//                    .width(120)
//                    .height(120);
//        };

                    reader.readAsDataURL(input.files[0]);
                }
            }


            function checkImageSizefile(obj, id1)
            {
                var size = ($("#" + id1)[0].files[0].size) / (200 * 230);
                if (parseFloat(size) > 45)
                {
                    alert("Exceeding File Size");
                    $("#" + id1).val("");
                } else {
                    Validatefile(obj, id1);
                }
            }
            function Validatefile(obj, id1)
            {
                var image = document.getElementById(id1).value;
                if (image != '') {
                    var checkimg = image.toLowerCase();
                    if (!checkimg.match(/(\.jpg|\.png|\.JPG|\.PNG|\.jpeg|\.JPEG|\.xls|\.XLS|\.xlsx|\.XLSX|\.doc|\.DOC|\.docx|\.DOCX|\.pdf|\.PDF)$/)) {
                        alert("Please select following File Extensions .jpg,.png,.jpeg,.xls,.xlsx,.doc,.docx,.pdf");
                        $("#" + id1).focus();
                        $("#" + id1).val("");
                        return false;
                    }
                }
                return true;
            }


            function browseImage(image) {
                document.getElementById(image).click();
            }

            function imageUpload(image, imageLbl) {
                var imgText = document.getElementById(image).value;
                var filename = imgText.replace(/^.*[\\\/]/, '');
                var imgTextArr = filename.split(".");
                var imgTxtFTb = imgTextArr[0];
                if (parseInt(imgTxtFTb.length) > 45) {
                    imgTxtFTb = imgTxtFTb.substring(0, 45);
                }
                document.getElementById(imageLbl).value = imgTxtFTb;
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
                $(window).scrollTop(0);
                $("#tag").toggle();
                $("#tag1").hide();
                $("#tag2").hide();
                $("#tag3").hide();
                $("#tag4").hide();
                $("#tag5").hide();
            }
            function callM1() {
                $(window).scrollTop(0);
                $("#tag").hide();
                $("#tag1").toggle();
                $("#tag2").hide();
                $("#tag3").hide();
                $("#tag4").hide();
                $("#tag5").hide();
            }
            function callM2() {
                $(window).scrollTop(0);
                $("#tag").hide();
                $("#tag1").hide();
                $("#tag2").toggle();
                $("#tag3").hide();
                $("#tag4").hide();
                $("#tag5").hide();
            }
            function callM3() {
                $(window).scrollTop(0);
                $("#tag").hide();
                $("#tag1").hide();
                $("#tag2").hide();
                $("#tag3").toggle();
                $("#tag4").hide();
                $("#tag5").hide();
            }
            function callM4() {
                $(window).scrollTop(0);
                $("#tag").hide();
                $("#tag1").hide();
                $("#tag2").hide();
                $("#tag3").hide();
                $("#tag4").toggle();
                $("#tag5").hide();
            }
//            function callM5() {
//                $(window).scrollTop(0);
//                $("#tag").hide();
//                $("#tag1").hide();
//                $("#tag2").hide();
//                $("#tag3").hide();
//                $("#tag4").hide();
//                $("#tag5").toggle();
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
            function rentPMonth() {
                var itmTot = parseFloat(document.getElementById("itmTot").value);
                var commonitmTot = parseFloat(document.getElementById("commonitmTot").value);
                var rentpMonth = parseFloat(document.getElementById("extra2").value);
                var billgCycle = document.getElementById("billingCycle").value;
                if (isNaN(rentpMonth) === false && billgCycle !== '') {
                    if (billgCycle == "Monthly") {
                        document.getElementById("totalAmount").value = (rentpMonth + itmTot + commonitmTot);
                    }
                    else if (billgCycle == "Quarterly") {
                        document.getElementById("totalAmount").value = (rentpMonth + itmTot + commonitmTot) * 3;
                    }
                    else if (billgCycle == "Half Yearly") {
                        document.getElementById("totalAmount").value = (rentpMonth + itmTot + commonitmTot) * 6;
                    }
                    else if (billgCycle == "Yearly") {
                        document.getElementById("totalAmount").value = (rentpMonth + itmTot + commonitmTot) * 12;
                    }
                } else {
                    document.getElementById("totalAmount").value = '0';
                }
            }

            function drentPMonth() {
                var totalAmount = document.getElementById("totalAmount").value;
//                var billgCycle = document.getElementById("billingCycle").value;
//                if (isNaN(rentpMonth) === false && billgCycle !== '') {
//                    if (billgCycle == "Monthly") {
//                        document.getElementById("totalAmount").value = rentpMonth;
//                    }
//                    else if (billgCycle == "Quarterly") {
//                        document.getElementById("totalAmount").value = rentpMonth * 3;
//                    }
//                    else if (billgCycle == "Half Yearly") {
//                        document.getElementById("totalAmount").value = rentpMonth * 6;
//                    }
//                    else if (billgCycle == "Yearly") {
//                        document.getElementById("totalAmount").value = rentpMonth * 12;
//                    }
//                } else {
//                    document.getElementById("totalAmount").value = '0';
//                }

                var DiscountforRent = document.getElementById("DiscountforRent").value;
                if (DiscountforRent > 0) {
                    var Discount = totalAmount * DiscountforRent;
                    var discountrent = Discount / 100;
                    document.getElementById("totalAmount").value = totalAmount - discountrent;
                }
            }

            function darentPMonth() {
                var advanceAmount = document.getElementById("advanceAmount").value;
//                var billgCycle = document.getElementById("billingCycle").value;
//                if (isNaN(rentpMonth) === false && billgCycle !== '') {
//                    if (billgCycle == "Monthly") {
//                        document.getElementById("totalAmount").value = rentpMonth;
//                    }
//                    else if (billgCycle == "Quarterly") {
//                        document.getElementById("totalAmount").value = rentpMonth * 3;
//                    }
//                    else if (billgCycle == "Half Yearly") {
//                        document.getElementById("totalAmount").value = rentpMonth * 6;
//                    }
//                    else if (billgCycle == "Yearly") {
//                        document.getElementById("totalAmount").value = rentpMonth * 12;
//                    }
//                } else {
//                    document.getElementById("totalAmount").value = '0';
//                }

                var DiscountforAdvance = document.getElementById("DiscountforAdvance").value;
                if (DiscountforAdvance > 0) {
                    var Discount = advanceAmount * DiscountforAdvance;
                    var discountrent = Discount / 100;
                    document.getElementById("advanceAmount").value = advanceAmount - discountrent;
                }
            }

            function test()
            {
                var tfname = document.getElementById("tenantFname").value;
                var tfname1 = document.getElementById("tenantFname1").value;
                var tlname = document.getElementById("tenantLname").value;
                var tlname1 = document.getElementById("tenantLname1").value;
                var tcrno = document.getElementById("tenantCrNo").value;
                var tcrno1 = document.getElementById("tenantCrNo1").value;
                var tcno = document.getElementById("tenantContactno").value;
                var tcno1 = document.getElementById("tenantContactno1").value;
                var twcno = document.getElementById("tenantWorkContactno").value;
                var twcno1 = document.getElementById("tenantWorkContactno1").value;
                var tmail = document.getElementById("tenantMailid").value;
                var tmail1 = document.getElementById("tenantMailid1").value;
                var paddrs = document.getElementById("permanentAddress").value;
                var paddrs1 = document.getElementById("permanentAddress1").value;
                var caddrs = document.getElementById("correspondenceAddress").value;
                var caddrs1 = document.getElementById("correspondenceAddress1").value;
                var pcode = document.getElementById("postalCode").value;
                var pcode1 = document.getElementById("postalCode11").value;
                var pno = document.getElementById("postboxNo").value;
                var pno1 = document.getElementById("postboxNo21").value;
                var sname = document.getElementById("sponcerName").value;
                var sname1 = document.getElementById("sponcerName1").value;
                var saddrs = document.getElementById("sponcerAddress").value;
                var saddrs1 = document.getElementById("sponcerAddress1").value;
                var cname = document.getElementById("companyName").value;
                var cname1 = document.getElementById("companyName1").value;
                var coaddrs = document.getElementById("companyAddress").value;
                var coaddrs1 = document.getElementById("companyAddress1").value;
                var pocode = document.getElementById("postalCode1").value;
                var pocode1 = document.getElementById("postalCode21").value;
                var pono = document.getElementById("postboxNo1").value;
                var pono1 = document.getElementById("postboxNo31").value;
                var jname = document.getElementById("jointeeName1").value;
                var jname1 = document.getElementById("jointeeName11").value;
                var jaddrs = document.getElementById("jointeeAddress1").value;
                var jaddrs1 = document.getElementById("jointeeAddress11").value;
                var joname = document.getElementById("jointeeName2").value;
                var joname1 = document.getElementById("jointeeName22").value;
                var joaddrs = document.getElementById("jointeeAddress2").value;
                var joaddrs1 = document.getElementById("jointeeAddress22").value;
                var rmark = document.getElementById("remarks").value;
                var rmark1 = document.getElementById("remarks1").value;
                var cridno = document.getElementById("crIdNo").value;
                var cridno1 = document.getElementById("crIdNo1").value;
                var bcycle = document.getElementById("billingCycle").value;
                var bcycle1 = document.getElementById("billingCycle1").value;
                var aamount = document.getElementById("advanceAmount").value;
                var aamount1 = document.getElementById("advanceAmount1").value;
                var extra2 = document.getElementById("extra2").value;
                var extra22 = document.getElementById("extra22").value;
                var dadv = document.getElementById("DiscountforAdvance").value;
                var dadv1 = document.getElementById("DiscountforAdvance1").value;
                var drent = document.getElementById("DiscountforRent").value;
                var drent1 = document.getElementById("DiscountforRent1").value;
                var pcent = document.getElementById("percentage").value;
                var pcent1 = document.getElementById("percentage1").value;
                var amt = document.getElementById("amcamount").value;
                var amt1 = document.getElementById("amcamount1").value;


                if (document.getElementById("tenantFname").value == "")
                {
                    alert("Enter Tenant First Name");
                    return false;
                }
                else if (document.getElementById("tenantLname").value == "")
                {
                    alert("Enter Tenant Last Name");
                    return false;
                } else if (document.getElementById("tenantCrNo").value == "")
                {
                    alert("Enter Tenant CrNo");
                    return false;
                } else if (document.getElementById("tenantContactno").value == "")
                {
                    alert("Enter Tenant Contact No");
                    return false;
                } else if (document.getElementById("correspondenceAddress").value == "")
                {
                    alert("Enter Correspondence Address");
                    return false;
                } else if (document.getElementById("advanceAmount").value == "")
                {
                    alert("Enter Advance Amount");
                    return false;
                } else if (document.getElementById("extra2").value == "")
                {
                    alert("Enter Rent Per Month");
                    return false;
                }
                else {

                    if (tfname !== tfname1 || tlname !== tlname1 || tcrno !== tcrno1 || tcno !== tcno1
                            || twcno !== twcno1 || tmail !== tmail1 || paddrs !== paddrs1
                            || caddrs !== caddrs1 || pcode !== pcode1 || pno !== pno1 | sname !== sname1 || saddrs !== saddrs1 || cname !== cname1
                            || coaddrs !== coaddrs1 || pocode !== pocode1 || pono !== pono1 || jname !== jname1 || jaddrs !== jaddrs1
                            || joname !== joname1 || joaddrs !== joaddrs1 || rmark !== rmark1 || cridno !== cridno1 || bcycle !== bcycle1
                            || aamount !== aamount1 || extra2 !== extra22 || dadv !== dadv1 || drent !== drent1 || pcent !== pcent1 || amt !== amt1) {
                        if (confirm('Do you really want to Save this updated record')) {
                            document.forms["tenantform"].submit();
                            return true;
                        } else {
                            return true;
                        }

                    } else {
                        document.forms["tenantform"].submit();
                    }
                }

            }

//            function test()
//            {
//                if (document.getElementById("tenantFname").value == "")
//                {
//                    alert("Enter Tenant First Name");
//                    return false;
//                }
//                else if (document.getElementById("tenantLname").value == "")
//                {
//                    alert("Enter Tenant Last Name");
//                    return false;
//                } else if (document.getElementById("tenantCrNo").value == "")
//                {
//                    alert("Enter Tenant CrNo");
//                    return false;
//                } else if (document.getElementById("tenantContactno").value == "")
//                {
//                    alert("Enter Tenant Contact No");
//                    return false;
//                } else if (document.getElementById("correspondenceAddress").value == "")
//                {
//                    alert("Enter Correspondence Address");
//                    return false;
//                } else if (document.getElementById("advanceAmount").value == "")
//                {
//                    alert("Enter Advance Amount");
//                    return false;
//                } else if (document.getElementById("extra2").value == "")
//                {
//                    alert("Enter Rent Per Month");
//                    return false;
//                } else {
//                    if (confirm('Do you really want to Save this updated record')) {
//                        document.forms["tenantform"].submit();
//                        return true;
//                    } else {
//                        return false;
//                    }
//
//                }
//
//            }

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
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <div class="clearfix"></div>
                        <div class="col-md-6 col-xs-12">
                            <div class="x_panel">
                                <jsp:include page="../login/headerlink.htm?submodule=Tenant Details&tab=Tenant Details&pagetype=form"/>
                                <div class="x_title">
                                    <h2>Tenant Details</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />
                                    <form class="form-inline" id="tenantform" action="../tenant/tenantContractAddSubmit.htm"  method="post" enctype="multipart/form-data">
                                        <c:choose>
                                            <c:when test="${fn:length(tenantDetails) > 0}">
                                                <c:forEach items="${tenantDetails}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
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

                                                                });</script>
                                                            </c:when>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                            </c:choose>

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
                                            <c:if test="${list[0] eq '619'}">
                                                <c:set value="${list[1]}" var="field_58"/>
                                                <c:set value="${list[2]}" var="fieldStatus_58"/>
                                                <c:set value="${list[3]}" var="mand_status_58"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '620'}">
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
                                        <c:forEach items="${fileSize}" var="list">
                                            <c:if test="${list[0] eq 'F-25'}">
                                                <input type="hidden" value="${list[1]}" id="docsize"/>
                                            </c:if>
                                        </c:forEach>
                                        <div class="box-header well" data-original-title onclick="call();" style="cursor: pointer;">
                                            <h4><b style="padding-left: 20px;">Landlord Details (First Party)</b></h4><c:if test="${fn:length(message) > 0}"><a class="successalert" style="margin-left: 250px;">${message}</a></c:if>
                                            </div> 
                                            <div class="box-content" id="tag"> 

                                            <c:if test="${fieldStatus_1 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_1 eq 'required'}">
                                                        <a style="color:red;" class="control-label-required">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_1}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(tenantDetails) > 0}">
                                                            <c:forEach items="${tenantDetails}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit' || action eq 'Recheck'}">
                                                                        <input type="text" class="form-control"  readonly="" id="llId" name="llId" value="${list.llId}">
                                                                        <input type="hidden" name="pk" value="${list.SNo}">
                                                                        <input type="hidden" id="status" name="status" value="${list.status}">
                                                                        <input type="hidden" id="creationDate" name="creationDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.creationDate}"/>">
                                                                        <input type="hidden" id="recordstatus" name="recordstatus" value="${list.recordstatus}">
                                                                        <input type="hidden" name="tenantCode" value="${list.tenantCode}">
                                                                        <input type="hidden" id="assetCode" name="assetCode" value="${list.assetName}">
                                                                        <input type="hidden" value="${action}" id="action" name="action"/>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" id="llId" readonly="" value="${list.llId}">
                                                                        <input type="hidden" id="assetCode" name="assetCode" value="${list.assetName}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="hidden" id="status"  value="">
                                                            <input type="hidden" id="recordstatus"  value="">
                                                            <input type="hidden" id="creationDate"  value="">
                                                            <input type="text" placeholder="Select Landlord" readonly class="form-control" id="llId"  value="" onclick="selectLandLord();" onblur="return getLlAttach();">
                                                            <input type="hidden" id="llSno"  value="">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
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
                                                            <input type="text" placeholder="" readonly class="form-control" id="llName"  value="">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control"  readonly="" id="llCategory" name="llCategory" value="${list.landlordCategory}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="llCategory" value="${list.landlordCategory}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly class="form-control"  id="llCategory"  value="">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control"  readonly="" id="llCrNo" name="llCrNo" maxlength="40" value="${list.crIdNo}" onkeypress="return isNumberKey3(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="llCrNo" value="${list.crIdNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly class="form-control"  id="llCrNo"  maxlength="40" value="" onkeypress="return isNumberKey3(event)">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="llContactno" name="llContactno" value="${list.landlordContactno}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="llContactno" value="${list.landlordContactno}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly class="form-control"  id="llContactno"  value="">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="llWorkContactno" name="llWorkContactno" value="${list.landlordWorkContactno}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="llWorkContactno" value="${list.landlordWorkContactno}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly class="form-control"  id="llWorkContactno"  value="">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="llMailid" name="llMailid" value="${list.landlordEmailid}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="llMailid" value="${list.landlordEmailid}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly class="form-control" id="llMailid"  value="">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>

                                            <c:if test="${action eq 'edit' || action eq 'view' || action eq 'Recheck'}">
                                                <c:if test="${fieldStatus_8 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_8 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_8}</label>
                                                        <div style="overflow: scroll;border:none;margin-left:139px;margin-top:-22px;height: 50px;width:168px">
                                                            <table><tbody>
                                                                    <c:choose>
                                                                        <c:when test="${fn:length(landlordDocuments) > 0}">
                                                                            <c:forEach items="${landlordDocuments}" var="attach">
                                                                                <c:choose>
                                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
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
                                                                    </c:choose></tbody></table></div>
                                                    </div> 
                                                </c:if>
                                            </c:if>
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
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
                                                            <select id="tenantType"  class="form-control validate[required]">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly id="tenantCategory"  name="tenantCategory" value="${list.tenantCategory}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="tenantCategory" value="${list.tenantCategory}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <!--<input type="text" placeholder="" class="form-control" id="tenantCategory" name="tenantCategory" value="">-->
                                                            <select id="tenantCategory"  class="form-control validate[required]">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="tenantId"  readonly name="tenantId" maxlength="15" value="${list.tenantId}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="tenantId" value="${list.tenantId}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" id="tenantId"  makeyprxlength="15" value="">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" id="tenantFname" name="tenantFname" readonly maxlength="50" value="${list.tenantFname}" onkeypress="return isNumberKey4(event)" onkeyup="firstToUpperCase();">
                                                                        <input type="hidden" class="form-control" id="tenantFname1" name="tenantFname1" maxlength="50" value="${list.tenantFname}" >
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="tenantFname" value="${list.tenantFname}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" id="tenantFname"  maxlength="50" value="" onkeypress="return isNumberKey4(event)" onkeyup="firstToUpperCase();">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" id="tenantLname" name="tenantLname" readonly maxlength="50" value="${list.tenantLname}" onkeypress="return isNumberKey4(event)" onchange="fetchTName();" onkeyup="firstToUpperCase1();">
                                                                        <input type="hidden" class="form-control" id="tenantLname1" name="tenantLname1" maxlength="50" value="${list.tenantLname}" >
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="tenantLname" value="${list.tenantLname}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" id="tenantLname"  maxlength="50" value="" onkeypress="return isNumberKey4(event)" onchange="fetchTName();" onkeyup="firstToUpperCase1();">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" id="tenantCitizenship" readonly name="tenantCitizenship" value="${list.tenantCitizenship}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="tenantCitizenship" value="${list.tenantCitizenship}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" id="tenantCitizenship"  value="" maxlength="50">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" id="tenantCrNo" readonly name="tenantCrNo" maxlength="10" value="${list.tenantCrNo}" onchange="fetchCrno();">
                                                                        <input type="hidden" class="form-control" id="tenantCrNo1" name="tenantCrNo1" maxlength="10" value="${list.tenantCrNo}" >
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="tenantCrNo" value="${list.tenantCrNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" id="tenantCrNo"  maxlength="10" value=""  onchange="fetchCrno();">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" id="tenantContactno" name="tenantContactno" maxlength="11" value="${list.tenantContactno}" onkeypress="return isNumberKey(event)">
                                                                        <input type="hidden" class="form-control" id="tenantContactno1" name="tenantContactno1" maxlength="11" value="${list.tenantContactno}" >
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="tenantContactno" value="${list.tenantContactno}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" id="tenantContactno"  maxlength="11" value="" onkeypress="return isNumberKey(event)">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" id="tenantWorkContactno" name="tenantWorkContactno" maxlength="11" value="${list.tenantWorkContactno}" onkeypress="return isNumberKey(event)" onchange="fetchTWcono();">
                                                                        <input type="hidden" class="form-control" id="tenantWorkContactno1" name="tenantWorkContactno1" maxlength="11" value="${list.tenantWorkContactno}" >
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="tenantWorkContactno" value="${list.tenantWorkContactno}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" id="tenantWorkContactno"  maxlength="11" value="" onkeypress="return isNumberKey(event)" onchange="fetchTWcono();">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" id="tenantMailid" name="tenantMailid" maxlength="40" value="${list.tenantMailid}" onchange="return validateEmail(event);">
                                                                        <input type="hidden" class="form-control" id="tenantMailid1" name="tenantMailid1" maxlength="40" value="${list.tenantMailid}" >
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="tenantMailid" value="${list.tenantMailid}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" id="tenantMailid"  maxlength="40" value="" onchange="return validateEmail(event);">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_20 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_20 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <label style="margin-top:5px" class="control-label">${field_20}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(tenantDetails) > 0}">
                                                            <c:forEach items="${tenantDetails}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <textarea rows="1" type="text" class="form-control" style="resize: none" id="permanentAddress" name="permanentAddress" maxlength="250" value="${list.permanentAddress}">${list.permanentAddress}</textarea>
                                                                        <input id="permanentAddress1" class="form-control"  rows="1" maxlength="300" style="resize: none" type="hidden" value="${list.permanentAddress}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <textarea rows="1" type="text" class="form-control" style="resize: none" readonly="" id="permanentAddress" value="${list.permanentAddress}">${list.permanentAddress}</textarea>
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <textarea type="text" rows="1" placeholder="" style="resize: none" class="form-control" id="permanentAddress"  maxlength="250" value=""></textarea>
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_21 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_21 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <label style="margin-top:-5px;" class="control-label">${field_21}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(tenantDetails) > 0}">
                                                            <c:forEach items="${tenantDetails}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <textarea rows="1" type="text" class="form-control" style="resize: none" id="correspondenceAddress" name="correspondenceAddress" maxlength="250" value="${list.correspondenceAddress}">${list.correspondenceAddress}</textarea>
                                                                        <input id="correspondenceAddress1" class="form-control"  rows="1" maxlength="300" style="resize: none" type="hidden" value="${list.correspondenceAddress}">

                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <textarea rows="1" type="text" class="form-control" style="resize: none" readonly="" id="correspondenceAddress" value="${list.correspondenceAddress}">${list.correspondenceAddress}</textarea>
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <textarea rows="1" type="text" placeholder="" style="resize: none" class="form-control" id="correspondenceAddress"  maxlength="250" value=""></textarea>
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" id="postalCode" name="postalCode" maxlength="3" value="${list.postalCode}" onkeypress="return isNumberKey(event)">
                                                                        <input type="hidden" class="form-control" id="postalCode11" name="postalCode11" maxlength="3" value="${list.postalCode}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="postalCode" value="${list.postalCode}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" id="postalCode"  value="" maxlength="3" onkeypress="return isNumberKey(event)">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" id="postboxNo" name="postboxNo" maxlength="4" value="${list.postboxNo}" onkeypress="return isNumberKey(event)">
                                                                        <input type="hidden" class="form-control" id="postboxNo21" name="postboxNo21" maxlength="4" value="${list.postboxNo}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="postboxNo" value="${list.postboxNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" id="postboxNo"  maxlength="4" value="" onkeypress="return isNumberKey(event)">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" id="sponcerName" name="sponcerName" maxlength="50" value="${list.sponcerName}" onkeypress="return isNumberKey4(event)">
                                                                        <input type="hidden" class="form-control" id="sponcerName1" name="sponcerName1" maxlength="50" value="${list.sponcerName}" >
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="sponcerName" value="${list.sponcerName}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" id="sponcerName"  maxlength="50" value="" onkeypress="return isNumberKey4(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if><p>&nbsp;</p>
                                            <c:if test="${fieldStatus_25 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_25 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <label style="margin-top:5px" class="control-label">${field_25}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(tenantDetails) > 0}">
                                                            <c:forEach items="${tenantDetails}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <textarea rows="1" type="text" class="form-control" placeholder="" style="resize: none" id="sponcerAddress" name="sponcerAddress" maxlength="250" value="${list.sponcerAddress}">${list.sponcerAddress}</textarea>
                                                                        <input id="sponcerAddress1" class="form-control"  rows="1" maxlength="300" style="resize: none" type="hidden" value="${list.sponcerAddress}">

                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <textarea rows="1" type="text" class="form-control" placeholder="" style="resize: none" readonly="" id="sponcerAddress" value="${list.sponcerAddress}">${list.sponcerAddress}</textarea>
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <textarea rows="1" style="resize: none" class="form-control" type="text" placeholder=""  id="sponcerAddress"  maxlength="250" value=""></textarea>
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" id="companyName" readonly name="companyName" value="${list.companyName}" maxlength="50" onkeypress="return isNumberKey4(event)">
                                                                        <input type="hidden" class="form-control" id="companyName1" name="companyName1" value="${list.companyName}" >
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="companyName" value="${list.companyName}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" id="companyName"  value="" maxlength="50" onkeypress="return isNumberKey4(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_27 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_27 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <label style="margin-top:5px;" class="control-label">${field_27}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(tenantDetails) > 0}">
                                                            <c:forEach items="${tenantDetails}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <textarea rows="1" style="resize: none" type="text" class="form-control" id="companyAddress" name="companyAddress" maxlength="250" value="${list.companyAddress}">${list.companyAddress}</textarea>
                                                                        <input id="companyAddress1" class="form-control"  rows="1" maxlength="300" style="resize: none" type="hidden" value="${list.companyAddress}">

                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <textarea rows="1" style="resize: none"type="text" class="form-control" readonly="" id="companyAddress" value="${list.companyAddress}">${list.companyAddress}</textarea>
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <textarea rows="1" style="resize: none" type="text" placeholder="" class="form-control" id="companyAddress"  maxlength="250" value=""></textarea>
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" id="postalCode1" name="postalCode1" value="${list.postalCode1}" maxlength="11" onkeypress="return isNumberKey(event)">
                                                                        <input type="hidden" class="form-control" id="postalCode21" name="postalCode21" value="${list.postalCode1}" >
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="postalCode1" value="${list.postalCode1}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" id="postalCode1"  value="" maxlength="11" onkeypress="return isNumberKey(event)">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control"  id="postboxNo1" name="postboxNo1" maxlength="35" value="${list.postboxNo1}" onchange="return validateEmail1(event);">
                                                                        <input type="hidden" class="form-control"  id="postboxNo31" name="postboxNo31" maxlength="35" value="${list.postboxNo1}" >
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="postboxNo1" value="${list.postboxNo1}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control"  id="postboxNo1"  maxlength="35" value="" onchange="return validateEmail1(event);">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" id="jointeeName1" name="jointeeName1" maxlength="50" value="${list.jointeeName1}" onkeypress="return isNumberKey4(event)">
                                                                        <input type="hidden" class="form-control" id="jointeeName11" name="jointeeName11" maxlength="50" value="${list.jointeeName1}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="jointeeName1" value="${list.jointeeName1}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" id="jointeeName1"  maxlength="50" value="" onkeypress="return isNumberKey4(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if><p>&nbsp;</p>
                                            <c:if test="${fieldStatus_31 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_31 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <label style="margin-top:5px;" class="control-label">${field_31}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(tenantDetails) > 0}">
                                                            <c:forEach items="${tenantDetails}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <textarea rows="1" style="resize: none" type="text" class="form-control" id="jointeeAddress1" name="jointeeAddress1" maxlength="250" value="${list.jointeeAddress1}">${list.jointeeAddress1}</textarea>
                                                                        <input id="jointeeAddress11" class="form-control"  rows="1" maxlength="300" style="resize: none" type="hidden" value="${list.jointeeAddress1}">

                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <textarea rows="1" style="resize: none" type="text" class="form-control" readonly="" id="jointeeAddress1" value="${list.jointeeAddress1}">${list.jointeeAddress1}</textarea>
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <textarea rows="1" style="resize: none" type="text" placeholder="" class="form-control" id="jointeeAddress1"  maxlength="250" value=""></textarea>
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" id="jointeeName2" name="jointeeName2" maxlength="50" value="${list.jointeeName2}" onkeypress="return isNumberKey4(event)">
                                                                        <input type="hidden" class="form-control" id="jointeeName22" name="jointeeName22" maxlength="50" value="${list.jointeeName2}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="jointeeName2" value="${list.jointeeName2}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" id="jointeeName2"  maxlength="50" value="" onkeypress="return isNumberKey4(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_33 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_33 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <label style="margin-top:5px;" class="control-label">${field_33}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(tenantDetails) > 0}">
                                                            <c:forEach items="${tenantDetails}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <textarea rows="1" style="resize: none" type="text" class="form-control" id="jointeeAddress2" name="jointeeAddress2" maxlength="250" value="${list.jointeeAddress2}">${list.jointeeAddress2}</textarea>
                                                                        <input id="jointeeAddress22" class="form-control"  rows="1" maxlength="300" style="resize: none" type="hidden" value="${list.jointeeAddress2}">

                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <textarea rows="1" style="resize: none" type="text" class="form-control" readonly="" id="jointeeAddress2" value="${list.jointeeAddress2}">${list.jointeeAddress2}</textarea>
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <textarea rows="1" style="resize: none" type="text" placeholder="" class="form-control" id="jointeeAddress2"  maxlength="250" value=""></textarea>
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if><p>&nbsp;</p>
                                            <c:if test="${fieldStatus_34 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_34 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <label style="margin-top:5px;" class="control-label">${field_34}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(tenantDetails) > 0}">
                                                            <c:forEach items="${tenantDetails}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <textarea rows="1" style="resize: none" type="text" class="form-control" id="remarks" name="remarks" maxlength="250" value="${list.remarks}">${list.remarks}</textarea>
                                                                        <input id="remarks1" class="form-control"  rows="1" maxlength="300" style="resize: none" type="hidden" value="${list.remarks}">

                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <textarea rows="1" style="resize: none" type="text" class="form-control" readonly="" id="remarks" value="${list.remarks}">${list.remarks}</textarea>
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <textarea rows="1" style="resize: none" type="text" placeholder="" class="form-control" id="remarks"  maxlength="250" value=""></textarea>
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_15 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_15 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <label style="" class="control-label">${field_15}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(tenantDetails) > 0}">
                                                            <c:forEach items="${tenantDetails}" var="type">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input class="file-name" style="display: none;"  id="attachment1" name="attachment1" type="file" value="" onchange="readURL2(this);
                                                                                imageUpload('attachment1', 'attname');">
                                                                        <input class="form-control" type="text" id="attname" name="attname" maxlength="50" value="${type.tenOrgfileName}"style="display: inline!important;"  placeholder="Attachment Name" data-toggle="tooltip" data-placement="right" title="Attachment">
                                                                        <input type="button" id="btnppup"  class="btn btn-primary" value="Browse..." onclick="browseImage('attachment1');" />
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
                                                            <div class="" style="border: none;background:#f7f9fa;">
                                                                <input class="input-file uniform_on" style="background:#f7f9fa;border:none;margin-left:139px; margin-top:-20px" id="tenantAttachment"  type="file" value="" name="tenantAttachment"   onchange="fileCheck(this);">
                                                            </div>
                                                            <input name="pk" type="hidden" value="">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="assetName" name="assetName" maxlength="50" value="${list.assetName}" onkeypress="return isNumberKey3(event)" onclick="selectAssetDetails();" onblur="return getAssetUtilityDetails();">
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
                                                            <input type="text" placeholder="Select Property" readonly="" class="form-control" id="assetName"  maxlength="50" value="" onkeypress="return isNumberKey3(event)" onclick="selectAssetDetails();" onblur="return getAssetUtilityDetails();">
                                                            <input type="hidden" id="assetCode"  value="">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="flatNo" name="flatNo" maxlength="50" value="${list.subAssetName}" onkeypress="return isNumberKey3(event)" onclick="selectSubAssetDetails();">
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
                                                            <input type="text" placeholder="Select Flat Name" readonly="" class="form-control" id="flatNo"  maxlength="50" value="" onkeypress="return isNumberKey3(event)" onclick="selectSubAssetDetails();">
                                                            <input type="hidden" id="subclassifiedAstno"  value="">
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
                                                                    <input type="hidden" id="roomCode" name="roomCode" value="${list.extra3}" >
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
                                            </div>
                                            <p>&nbsp;</p>
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
                                                            <input type="text" placeholder="" readonly="" class="form-control" id="buildingNo"  maxlength="50" value="" onkeypress="return isNumberKey(event)">
                                                        </c:otherwise>        
                                                    </c:choose>
                                                </div>
                                            </c:if>
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="wayNo" name="wayNo" maxlength="50" value="${list.way}" onkeypress="return isNumberKey3(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="wayNo" value="${list.way}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly="" class="form-control" id="wayNo" maxlength="50" value="" onkeypress="return isNumberKey3(event)">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="assetArea" name="assetArea" maxlength="50" value="${list.assetArea}" onkeypress="return isNumberKey3(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="assetArea" value="${list.assetArea}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly="" class="form-control" id="assetArea"  maxlength="50" value="" onkeypress="return isNumberKey3(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                                <p>&nbsp;</p>
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
                                                            <input type="text" placeholder="" readonly="" class="form-control" id="blockNo"  maxlength="50" value="" onkeypress="return isNumberKey3(event)">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="plotNo" name="plotNo" maxlength="50" value="${list.assetPlotNo}" onkeypress="return isNumberKey3(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="plotNo" value="${list.assetPlotNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly="" class="form-control" id="plotNo"  maxlength="50" value="" onkeypress="return isNumberKey3(event)">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="streetNo" name="streetNo" maxlength="50" value="${list.streetNo}" onkeypress="return isNumberKey3(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="streetNo" value="${list.streetNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly="" class="form-control" id="streetNo"  maxlength="50" value="" onkeypress="return isNumberKey3(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                                <p>&nbsp;</p>
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="assetPostalCode" name="assetPostalCode" maxlength="3" value="${list.pinCode}" onkeypress="return isNumberKey(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="assetPostalCode" value="${list.pinCode}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly="" class="form-control" id="assetPostalCode"  maxlength="3" value="" onkeypress="return isNumberKey(event)">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="assetPostboxNo" name="assetPostboxNo" maxlength="4" value="${list.poBox}" onkeypress="return isNumberKey(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="assetPostboxNo" value="${list.poBox}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly="" class="form-control" id="assetPostboxNo"  maxlength="4" value="" onkeypress="return isNumberKey(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_43 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline" type="hidden">
                                                    <c:if test="${mand_status_43 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <!--<label class="control-label" type="hidden">${field_43}</label>-->
                                                    <c:choose>
                                                        <c:when test="${fn:length(subassDetails) > 0}">
                                                            <c:forEach items="${subassDetails}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="hidden" class="form-control" readonly="" id="waterBillno" name="waterBillno" maxlength="50" value="${list.utilityNo1}" onkeypress="return isNumberKey(event)">
                                                                        <input type="hidden" id="actualRent" name="actualRent" value="${list.actualRent}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="hidden" class="form-control" readonly="" id="waterBillno" value="${list.utilityNo1}">
                                                                        <input type="hidden" id="actualRent" name="actualRent" value="${list.actualRent}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="hidden" placeholder="" readonly="" class="form-control" id="waterBillno" name="waterBillno" maxlength="50" value="" onkeypress="return isNumberKey(event)">
                                                            <input type="hidden" id="actualRent"  value="">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if><p>&nbsp;</p>
                                            <c:if test="${fieldStatus_44 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline" type="hidden">
                                                    <c:if test="${mand_status_44 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <!--<label class="control-label">${field_44}</label>-->
                                                    <c:choose>
                                                        <c:when test="${fn:length(subassDetails) > 0}">
                                                            <c:forEach items="${subassDetails}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="hidden" class="form-control" readonly="" id="electricityBillno" name="electricityBillno" maxlength="50" value="${list.utilityNo2}" onkeypress="return isNumberKey(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="hidden" class="form-control" readonly="" id="electricityBillno" value="${list.utilityNo2}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="hidden" placeholder="" readonly="" class="form-control" id="electricityBillno"  maxlength="50" value="" onkeypress="return isNumberKey(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                                <br/>
                                            <c:if test="${action eq null}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <label class="control-label"><span style="color: red"></span>Select Individual Utility</label>

                                                    <input  class="form-control" style="cursor: pointer" readonly placeholder="Click to select Utilities" style="text-transform: capitalize" autocomplete="off" id="itemName" maxlength="40"  type="text" value="" onclick="selectItem();">                                                    

                                                </div>
                                            </c:if>
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
                                                                        <th style="width:210px;"><span style="color:red"></span> Utility Name</th>
                                                                        <th style="width:210px;"><span style="color:red"></span> Utility Bill Type</th>
                                                                        <th><span style="color:red"></span> Utility Bill</th>                                                               

                                                                    </tr>
                                                                </thead>
                                                                <tbody id="resourcetable2">
                                                                    <c:if test="${action eq 'edit'}">
                                                                        <c:forEach items="${assetDetails1}" var="item">


                                                                            <tr class="item-enquiry">
                                                                                <td align="center" onclick=""> </td>
                                                                                <td><input class="form-control  right " readonly autocomplete="off" name="utility" id="utility" type="text" value="${item.utility}" style=""></td> 
                                                                                <td><input class="form-control  right " readonly autocomplete="off" name="utilityBillType" id="utilityBillType" type="text" value="${item.utilityBillType}" style=""></td>                                                                        
                                                                                <td><input class="form-control  right " readonly autocomplete="off" name="utilityBill" id="utilityBill" type="text" value="${item.utilityBill}" style=""></td>                                                                        
                                                                            </tr>

                                                                        </c:forEach>
                                                                    </c:if>
                                                                    <c:if test="${action eq 'view'}">
                                                                        <c:forEach items="${assetDetails1}" var="item">


                                                                            <tr class="item-enquiry">
                                                                                <td align="center" onclick=""> </td>
                                                                                <td><input class="form-control  right " readonly autocomplete="off" name="utility" id="utility" type="text" value="${item.utility}" style=""></td> 
                                                                                <td><input class="form-control  right " readonly autocomplete="off" name="utilityBillType" id="utilityBillType" type="text" value="${item.utilityBillType}" style=""></td>                                                                        
                                                                                <td><input class="form-control  right " readonly autocomplete="off" name="utilityBill" id="utilityBill" type="text" value="${item.utilityBill}" style=""></td>                                                                        
                                                                            </tr>

                                                                        </c:forEach>
                                                                    </c:if>
                                                                </tbody>
                                                                <script>
                                                                    var count = 0;
                                                                    function addOrderRow_test1(val2, val3, val5) {


                                                                        var valid1 = true;
                                                                        //                                                            var y = (document.getElementById('requiredByDate').value) &&
                                                                        //                                                                    (document.getElementById('itemCat').value) &&
                                                                        //                                                                    (document.getElementById('purchaseType').value) &&
                                                                        //                                                                    (document.getElementById('division').value) &&
                                                                        //                                                                    (document.getElementById('priority').value) &&
                                                                        //                                                                    (document.getElementById('requiredAtLoc').value);
                                                                        //                                                            if (y == "" || y == null) {
                                                                        //                                                                alert('Please fill out the mandatory fields');
                                                                        //                                                                valid1 = false;
                                                                        //                                                            }

                                                                        //                                                            if (valid1 == true) {
                                                                        //                                                               
                                                                        //                                                                var requisitionQty = document.getElementById('requisitionQty').value;
                                                                        //                                                                var priority = document.getElementById('priority').value;
                                                                        //                                                                var itemCat = document.getElementById('itemCat').value;
                                                                        //                                                                var requiredAtLoc2 = document.getElementById('requiredAtLoc').value;
                                                                        //                                                               var table = document.getElementById("resourcetable");
                                                                        //                                                                if (val2 != "")
                                                                        //                                                                {
                                                                        if (valid1 == true) {
                                                                            var table = document.getElementById("resourcetable2");
                                                                            //
                                                                            //                                                                    var c = val2;                                                                    
                                                                            var slNo1 = table.rows.length;
                                                                            var id1 = slNo1;
                                                                            var slNo = count;
                                                                            var tr = table.insertRow(slNo1);

                                                                            $('tr').addClass('item-enquiry');
                                                                            tr.id = 'list_tr_' + slNo;
                                                                            tr.innerHTML = '<td align="center" class="tinput"><button type="button" class="fa fa-trash-o" onclick="removeRow1('
                                                                                    + slNo + ')" ></button> </td>' +
                                                                                    '<td><input class="form-control" style="text-align:left;width:100%" type="text" readonly name="utility" value="' + val2 +
                                                                                    '"/>' + '<td><input class="form-control" style="text-align:left;width:100%" type="text" readonly name="utilityBillType" value="' + val3 +
                                                                                    '"/>' + '<td><input class="form-control" style="text-align:left;width:100%" type="text" readonly name="utilityBill" value="' + val5 +
                                                                                    '"/>';
                                                                            count++;

                                                                        }

                                                                        individualinventorysum();
                                                                    }

                                                                    function removeRow1(id) {
                                                                        //debugger;
                                                                        //alert('inside');
                                                                        var table = document.getElementById("resourcetable2");
                                                                        for (var i = 0; i < table.rows.length; i++) {
                                                                            var lr = table.rows[i];
                                                                            if (lr.id == 'list_tr_' + id) {
                                                                                table.deleteRow(i);
                                                                                individualinventorysum();
                                                                                return;
                                                                            }

                                                                        }

                                                                    }


                                                                </script>

                                                            </table>
                                                            <%--<c:if test="${action eq null}">
                                                                <div style="margin-top: 10px;">
                                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <!--<button id="addRowBtn" class="btn btn-danger" style=""><i class="glyphicon glyphicon-plus"></i>ADD</button>-->
                                                                            <a href="#" id="addEnquiryBtnX1" class="btn btn-dark" tabindex=""><i class="glyphicon glyphicon-plus"></i> Add Utility</a>

                                                                        </div>
                                                                    </div>
                                                                </div>                                        
                                                            </c:if>
                                                            <c:if test="${action eq 'edit'}">
                                                                <div style="margin-top: 10px;">
                                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <!--<button id="addRowBtn" class="btn btn-danger" style=""><i class="glyphicon glyphicon-plus"></i>ADD</button>-->
                                                                            <a href="#" id="addEnquiryBtnX1" class="btn btn-dark" tabindex=""><i class="glyphicon glyphicon-plus"></i> Add Utility</a>

                                                                        </div>
                                                                    </div>
                                                                </div>                                        
                                                            </c:if>--%>
                                                        </div>
                                                        <div class="x_title">
                                                            <label class="control-label"><strong>Total Amount : <div id="totalitemAmount" name="totalitemAmount"></div><input type="hidden" id="itmTot" name="itmTot"></strong> </label>                                                   

                                                            <div class="clearfix"></div>
                                                        </div>
                                                        <div class="clearfix"></div>

                                                    </div>

                                                </div>

                                            </fieldset>                                         


                                            <c:if test="${action eq null}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <label class="control-label"><span style="color: red"></span>Select Common Utility</label>

                                                    <input  class="form-control" style="cursor: pointer" readonly placeholder="Click to select Utilities" style="text-transform: capitalize" autocomplete="off" id="itemName" maxlength="40"  type="text" value="" onclick="selectItemCom();">                                                    

                                                </div>
                                                <p>&nbsp;</p>
                                            </c:if>
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
                                                                        <th style="width:210px;"><span style="color:red"></span> Utility Name</th>
                                                                        <th style="width:210px;"><span style="color:red"></span> Utility Bill Type</th>
                                                                        <th><span style="color:red"></span> Utility Bill</th>                                                               

                                                                    </tr>
                                                                </thead>
                                                                <tbody id="resourcetable1">
                                                                    <c:if test="${action eq 'edit'}">
                                                                        <c:forEach items="${assetDetails1}" var="item">

                                                                            <tr class="item-enquiry">
                                                                                <td align="center" onclick=""> </td>
                                                                                <td><input class="form-control  right " name="comUtility" id="comUtility" type="text" value="${item.comUtility}" readonly="" style=""></td> 
                                                                                <td><input class="form-control  right " name="comUtilityBillType" id="comUtilityBillType" type="text" value="${item.comUtilityBillType}" readonly="" style=""></td>                                                                        
                                                                                <td><input class="form-control  right " name="comutilityBill" id="comutilityBill" type="text" value="${item.comutilityBill}" readonly="" style=""></td>                                                                        
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </c:if> 
                                                                    <c:if test="${action eq 'view'}">
                                                                        <c:forEach items="${assetDetails1}" var="item">

                                                                            <tr class="item-enquiry">
                                                                                <td align="center" onclick=""> </td>
                                                                                <td><input class="form-control  right " name="comUtility" id="comUtility" type="text" value="${item.comUtility}" readonly="" style=""></td> 
                                                                                <td><input class="form-control  right " name="comUtilityBillType" id="comUtilityBillType" type="text" value="${item.comUtilityBillType}" readonly="" style=""></td>                                                                        
                                                                                <td><input class="form-control  right " name="comutilityBill" id="comutilityBill" type="text" value="${item.comutilityBill}" readonly="" style=""></td>                                                                        
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </c:if> 

                                                                </tbody>
                                                                <script>
                                                                    var count = 0;
                                                                    function addOrderRow_test2(val2, val3, val5) {

                                                                        var valid1 = true;
                                                                        //                                                            var y = (document.getElementById('requiredByDate').value) &&
                                                                        //                                                                    (document.getElementById('itemCat').value) &&
                                                                        //                                                                    (document.getElementById('purchaseType').value) &&
                                                                        //                                                                    (document.getElementById('division').value) &&
                                                                        //                                                                    (document.getElementById('priority').value) &&
                                                                        //                                                                    (document.getElementById('requiredAtLoc').value);
                                                                        //                                                            if (y == "" || y == null) {
                                                                        //                                                                alert('Please fill out the mandatory fields');
                                                                        //                                                                valid1 = false;
                                                                        //                                                            }

                                                                        //                                                            if (valid1 == true) {
                                                                        //                                                               
                                                                        //                                                                var requisitionQty = document.getElementById('requisitionQty').value;
                                                                        //                                                                var priority = document.getElementById('priority').value;
                                                                        //                                                                var itemCat = document.getElementById('itemCat').value;
                                                                        //                                                                var requiredAtLoc2 = document.getElementById('requiredAtLoc').value;
                                                                        //                                                               var table = document.getElementById("resourcetable");
                                                                        //                                                                if (val2 != "")
                                                                        //                                                                {
                                                                        if (valid1 == true) {
                                                                            var table = document.getElementById("resourcetable1");
                                                                            //
                                                                            //                                                                    var c = val2;                                                                    
                                                                            var slNo1 = table.rows.length;
                                                                            var id1 = slNo1;
                                                                            var slNo = count;
                                                                            var tr = table.insertRow(slNo1);

                                                                            $('tr').addClass('item-enquiry');

                                                                            tr.id = 'list_tr_' + slNo;
                                                                            tr.innerHTML = '<td align="center" class="tinput"><button type="button" class="fa fa-trash-o" onclick="removeRow2('
                                                                                    + slNo + ')" ></button> </td>' +
                                                                                    '<td><input class="form-control" style="text-align:left;width:100%" type="text" readonly name="comUtility" value="' + val2 +
                                                                                    '"/>' + '<td><input class="form-control" style="text-align:left;width:100%" type="text" readonly name="comUtilityBillType" value="' + val3 +
                                                                                    '"/>' + '<td><input class="form-control" style="text-align:left;width:100%" type="text" readonly name="comutilityBill" value="' + val5 +
                                                                                    '"/>';
                                                                            count++;
                                                                        }
                                                                        commoninventorysum();

                                                                    }

                                                                    function removeRow2(id) {
                                                                        var table = document.getElementById("resourcetable1");
                                                                        for (var i = 0; i < table.rows.length; i++) {
                                                                            var lr = table.rows[i];
                                                                            if (lr.id == 'list_tr_' + id) {
                                                                                table.deleteRow(i);
                                                                                commoninventorysum();
                                                                                return;
                                                                            }
                                                                        }

                                                                    }


                                                                </script>

                                                            </table>
                                                            <%--<c:if test="${action eq null}">
                                                                <div style="margin-top: 10px;">
                                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <!--<button id="addRowBtn" class="btn btn-danger" style=""><i class="glyphicon glyphicon-plus"></i>ADD</button>-->
                                                                            <a href="#" id="addEnquiryBtnX2" class="btn btn-dark" tabindex=""><i class="glyphicon glyphicon-plus"></i> Add Utility</a>

                                                                        </div>
                                                                    </div>
                                                                </div>                                        
                                                            </c:if>
                                                            <c:if test="${action eq 'edit'}">
                                                                <div style="margin-top: 10px;">
                                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                                            <!--<button id="addRowBtn" class="btn btn-danger" style=""><i class="glyphicon glyphicon-plus"></i>ADD</button>-->
                                                                            <a href="#" id="addEnquiryBtnX2" class="btn btn-dark" tabindex=""><i class="glyphicon glyphicon-plus"></i> Add Utility</a>

                                                                        </div>
                                                                    </div>
                                                                </div>                                        
                                                            </c:if> --%>                                                           



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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="contractName" name="contractName" maxlength="50" value="${list.contractCode}" onclick="selectContractCode();" onkeypress="return isNumberKey3(event)">
                                                                        <input type="hidden" id="contractPeriod" name="contractPeriod" value="${list.contractCode}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="contractName" value="${list.contractCode}">
                                                                        <input type="hidden" id="contractPeriod" name="contractPeriod" value="${list.contractCode}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="Select Contract" readonly="" class="form-control" id="contractName"  maxlength="50" value=""  onclick="selectContractCode();" onblur="return getContAttach();">
                                                            <input type="hidden" id="contSno"  value="">
                                                            <input type="hidden" id="contractPeriod"  value="">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
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
                                                            <input type="text" placeholder="" class="form-control" readonly id="startsFrom"  value="">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" placeholder="Select Date" readonly="" id="endsTo" name="endsTo" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.contEndDate}"/>">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="endsTo" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.contEndDate}"/>">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" readonly id="endsTo"  value="">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly id="contractSigningDate" name="contractSigningDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.contractSigningDate}"/>" onclick="javascript:NewCssCal('contractSigningDate', 'ddMMMyyyy', '', '', '', '', '')" onchange="dateCheckCondition();">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="contractSigningDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.contractSigningDate}"/>">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="Select Date" class="form-control" readonly id="contractSigningDate"  value="" onclick="javascript:NewCssCal('contractSigningDate', 'ddMMMyyyy', '', '', '', '', '')" onchange="dateCheckCondition();">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" id="crIdNo" name="crIdNo" value="${list.crIdNo}" maxlength="50" onkeypress="return isNumberKey3(event)">
                                                                        <input type="hidden" class="form-control" id="crIdNo1" name="crIdNo1" value="${list.crIdNo}" >
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="crIdNo" value="${list.crIdNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control"  id="crIdNo" maxlength="50" value="" onkeypress="return isNumberKey3(event)">
                                                        </c:otherwise>        
                                                    </c:choose>
                                                </div></c:if> 
                                            <c:if test="${action eq 'edit' || action eq 'view' || action eq 'Recheck'}">
                                                <c:if test="${fieldStatus_50 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_50 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_50}</label>
                                                        <div style="overflow: scroll;border:none;margin-left:139px;margin-top:-22px;height: 50px;width:168px">
                                                            <table><tbody>
                                                                    <c:choose>
                                                                        <c:when test="${fn:length(contDocument) > 0}">
                                                                            <c:forEach items="${contDocument}" var="attach">
                                                                                <c:choose>
                                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="hidden" class="form-control" name="billingCycle1" id="billingCycle1" value="${list.billingCycle}" >

                                                                        <!--<input type="text" class="form-control" readonly id="billingCycle" name="billingCycle" value="${list.billingCycle}">-->
                                                                        <select id="billingCycle" name="billingCycle" class="form-control" onchange="rentPMonth();">
                                                                            <option value="${list.billingCycle}" selected>${list.billingCycle}</option>
                                                                            <c:forEach items="${Dropdown}" var="list">
                                                                                <c:if test="${list[0] eq 'F-07'}">
                                                                                    <option>${list[1]}</option>                                     
                                                                                </c:if>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="billingCycle" value="${list.billingCycle}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <select id="billingCycle"  class="form-control" onchange="rentPMonth();">
                                                                <option value="" selected>Select your option</option>
                                                                <c:forEach items="${Dropdown}" var="list">
                                                                    <c:if test="${list[0] eq 'F-07'}">
                                                                        <option>${list[1]}</option>                                     
                                                                    </c:if>
                                                                </c:forEach>
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" id="advanceAmount" name="advanceAmount" maxlength="14" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.advanceAmount}" />" onkeypress="return check_digit(event, this, 10, 3);" onchange="rentCalc();">
                                                                        <input type="hidden" class="form-control" id="advanceAmount1" name="advanceAmount1" maxlength="14" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.advanceAmount}" />" >
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="advanceAmount" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.advanceAmount}" />">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" id="advanceAmount"  maxlength="14" value="" onkeypress="return check_digit(event, this, 10, 3);" onchange="rentCalc();">
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
                                                                <c:set var="appstatus" value="${list.appstatus}"></c:set>
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" placeholder="Select Date" class="form-control" readonly="" id="dueDate" name="dueDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.dueDate}"/>" onchange="dateCheckCondition();" onclick="javascript:NewCssCal('dueDate', 'ddMMMyyyy', '', '', '', '', '')">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="dueDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.dueDate}"/>">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="Select Date" class="form-control" readonly  id="dueDate"  value="" onclick="javascript:NewCssCal('dueDate', 'ddMMMyyyy', '', '', '', '', '')" onchange="dateCheckCondition();">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" id="extra2" name="extra2" value="${list.extra2}" maxlength="14" onkeypress="return check_digit(event, this, 10, 3);" onchange="rentCalc();">
                                                                        <input type="hidden" class="form-control" id="extra22" name="extra22" value="${list.extra2}" >
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" value="${list.extra2}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" id="extra2"  maxlength="14" value="" onkeypress="return check_digit(event, this, 10, 3);" onchange="rentCalc();">
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
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" id="totalAmount" name="totalAmount" readonly maxlength=14" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.totalAmount}" />" onkeypress="return check_digit(event, this, 10, 3);" onchange="">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="totalAmount" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.totalAmount}" />">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" id="totalAmount"  readonly maxlength="14" value="" onkeypress="return check_digit(event, this, 10, 3);" onchange="">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                                <!--                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                                                                <a style="color:red;">*</a>
                                                                                                <a style="font-size: 15px;margin-top:-21px;color:transparent;font-weight: bold;">*</a>
                                                                                                <label class="control-label">Utility Ammount</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control"  readonly="" id="utilyAmount"  maxlength="200" value="${list.remarks}" onkeypress="return isNumberKey(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="utilyAmount" value="${list.remarks}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <textarea  class="form-control"  id="utilyAmount" style="resize: none" maxlength="200" value="" type="text"></textarea>
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>-->

                                            <!--Extra buffer fields-->

                                            <c:if test="${fieldStatus_58 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_58 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <label class="control-label">${field_58}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(tenantDetails) > 0}">
                                                            <c:forEach items="${tenantDetails}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" id="DiscountforAdvance" name="DiscountforAdvance" value="${list.discountforadvance}" maxlength="50" onkeypress="return check_digit(event, this, 10, 3);" onchange="darentCalc();">
                                                                        <input type="hidden" class="form-control" id="DiscountforAdvance1" name="DiscountforAdvance1" value="${list.discountforadvance}" >
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="DiscountforAdvance" value="${list.discountforadvance}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control"  id="DiscountforAdvance" maxlength="50" value="" onkeypress="return check_digit(event, this, 10, 3);" onchange="darentCalc();">
                                                        </c:otherwise>        
                                                    </c:choose>
                                                </div></c:if>

                                                <p>&nbsp;</p>

                                            <c:if test="${fieldStatus_59 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_59 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <label class="control-label">${field_59}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(tenantDetails) > 0}">
                                                            <c:forEach items="${tenantDetails}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" id="DiscountforRent" name="DiscountforRent" value="${list.discountforrent}" maxlength="50" onkeypress="return check_digit(event, this, 10, 3);" onchange="drentCalc();">
                                                                        <input type="hidden" class="form-control" id="DiscountforRent1" name="DiscountforRent1" value="${list.discountforrent}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="DiscountforRent" value="${list.discountforrent}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control"  id="DiscountforRent" maxlength="50" value="" onkeypress="return check_digit(event, this, 10, 3);" onchange="drentCalc();">
                                                        </c:otherwise>        
                                                    </c:choose>
                                                </div></c:if>                                      
                                                <p>&nbsp;</p>                                                 
                                            </div>
                                            <div style="display:none;">
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
                                                                            <input type="text" class="form-control" readonly="" ${mand_status_61}  readonly id="amctenantName" name="amctenantName" maxlength="10" value="${list.tenantFname}${list.tenantLname}" >
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
                                                                            <input type="text" class="form-control" ${mand_status_64}  id="percentage" name="percentage" maxlength="10" value="${list.percentage}" onchange="return calpercentage();" onkeypress="return isNumberKey(event)">
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
                                                                            <input type="text" class="form-control" ${mand_status_65}  id="amcamount" name="amcamount" maxlength="10" value="${list.amcamount}" onkeypress="return isNumberKey(event)">
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
                                                </div>
                                        </c:if>
                                        <c:if test="${action eq 'view' }">

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
                                                                            <input type="text" class="form-control" ${mand_status_64}  id="percentage" name="percentage" maxlength="10" value="${list.percentage}" onchange="return calpercentage();" onkeypress="return isNumberKey(event)">
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
                                                                            <input type="text" class="form-control" ${mand_status_65}  id="amcamount" name="amcamount" maxlength="10" value="${list.amcamount}" onkeypress="return isNumberKey(event)">
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
                                                </div>
                                        </c:if>
                                        <p>&nbsp;</p>
                                            </div>


                                        <!--grid-->
                                        <!--grid-->
                                        <!--grid-->
                                        <!--grid-->
                                        <!--grid-->
                                        <!--grid-->
                                        <!--grid-->
                                        <!--grid-->
                                        <c:if test="${action ne 'view' && action ne 'edit' && action ne 'Recheck'}">
                                            <div>


                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <button type="button" class="btn btn-succ" style="" onclick="return addOrderRow_test();"><i class="fa fa-plus-circle" style="font-size: 15px"></i> ADD</button>

                                                    </div>
                                                </div>

                                                <div class="clearfix"></div>



                                                <div style="overflow: scroll;height: auto;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">

                                                    <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                        <thead>
                                                            <tr>
                                                                <th><i class="fa fa-trash fa-lg"></i></th>                                                
                                                                <th><span style="color:red">*</span> Tenant Category</th>
                                                                <th> <span style="color:red">*</span>Tenant Type</th>
                                                                <th><span style="color:red">*</span> Tenant ID</th>
                                                                <th> <span style="color:red">*</span>First Name</th>
                                                                <th> <span style="color:red">*</span>Last Name</th>
                                                                <th><span style="color:red">*</span> Tenant CR No</th>
                                                                <th><span style="color:red">*</span>Contact No</th>
                                                                <th><span style="color:red">*</span>Address</th>
                                                                <th><span style="color:red">*</span>Property Name</th>
                                                                <th><span style="color:red">*</span>Flat Name</th>
                                                                <th><span style="color:red">*</span>Room/Unit Name</th>
                                                                <th><span style="color:red">*</span>Contract Code</th>
                                                                <th><span style="color:red">*</span>Start From</th>
                                                                <th><span style="color:red">*</span>End To</th>
                                                                <!--<th><span style="color:red">*</span>Signing Date</th>-->
                                                                <th><span style="color:red">*</span>Billing Cycle</th>
                                                                <th><span style="color:red">*</span>Advance Amount</th>
                                                                <th><span style="color:red">*</span>Rent Per Month</th>
                                                            </tr>

                                                        </thead>
                                                        <tbody id="resourcetable">

                                                        </tbody>

                                                        <script>
                                                            var count = 0;
                                                            function addOrderRow_test() {
//                                                                alert("hiii");
                                                                //$("#llId").dis
                                                                //$("#llId :input").prop("disabled", true);
                                                                if (!mandTest()) {
                                                                    return false;
                                                                }


                                                                var valid1 = true;
                                                                var x = document.getElementById('llId').value &&
                                                                        document.getElementById('tenantType').value &&
                                                                        document.getElementById('tenantCategory').value &&
                                                                        document.getElementById('tenantId').value &&
                                                                        document.getElementById('tenantFname').value &&
                                                                        document.getElementById('tenantLname').value &&
                                                                        document.getElementById('tenantCrNo').value &&
                                                                        document.getElementById('tenantContactno').value &&
                                                                        document.getElementById('correspondenceAddress').value &&
                                                                        document.getElementById('assetName').value &&
                                                                        document.getElementById('flatNo').value &&
                                                                        document.getElementById('contractName').value &&
                                                                        document.getElementById('billingCycle').value &&
                                                                        document.getElementById('advanceAmount').value &&
                                                                        document.getElementById('extra2').value
                                                                if (x == "" || x == null)
                                                                {
                                                                    alert("Please Select Mandatory Fields");
                                                                    valid1 = false;
                                                                }



                                                                if (valid1 == true) {
                                                                    $('#tenantType').prop('disabled', 'disabled');
//                                                                    alert("1");
                                                                    var llId = document.getElementById('llId').value;
                                                                    var llName = document.getElementById('llCategory').value;
                                                                    var llCategory = document.getElementById('llId').value;
                                                                    var llCrNo = document.getElementById('llCrNo').value;
                                                                    var llContactno = document.getElementById('llContactno').value;
                                                                    var llWorkContactno = document.getElementById('llWorkContactno').value;
                                                                    var llMailid = document.getElementById('llMailid').value;
                                                                    var tenantType = document.getElementById('tenantType').value;
                                                                    var tenantCategory = document.getElementById('tenantCategory').value;
                                                                    var tenantId = document.getElementById('tenantId').value;
                                                                    var tenantFname = document.getElementById('tenantFname').value;
                                                                    var tenantLname = document.getElementById('tenantLname').value;
//                                                                    alert("2");
                                                                    var tenantCitizenship = document.getElementById('tenantCitizenship').value;
                                                                    var tenantCrNo = document.getElementById('tenantCrNo').value;
                                                                    var tenantContactno = document.getElementById('tenantContactno').value;
                                                                    var tenantWorkContactno = document.getElementById('tenantWorkContactno').value;
                                                                    var tenantMailid = document.getElementById('tenantMailid').value;
                                                                    var permanentAddress = document.getElementById('permanentAddress').value;
                                                                    var correspondenceAddress = document.getElementById('correspondenceAddress').value;
                                                                    var postalCode = document.getElementById('postalCode').value;
                                                                    var postboxNo = document.getElementById('postboxNo').value;
                                                                    var sponcerName = document.getElementById('sponcerName').value;
                                                                    var sponcerAddress = document.getElementById('sponcerAddress').value;
                                                                    var companyName = document.getElementById('companyName').value;
                                                                    var companyAddress = document.getElementById('companyAddress').value;
                                                                    var postalCode1 = document.getElementById('postalCode1').value;
                                                                    var postboxNo1 = document.getElementById('postboxNo1').value;
//                                                                    alert("3");
                                                                    var jointeeName1 = document.getElementById('jointeeName1').value;
                                                                    var jointeeAddress1 = document.getElementById('jointeeAddress1').value;
                                                                    var jointeeName2 = document.getElementById('jointeeName2').value;
                                                                    var jointeeAddress2 = document.getElementById('jointeeAddress2').value;
                                                                    var remarks = document.getElementById('remarks').value;
                                                                    var assetCode = document.getElementById('assetCode').value;
                                                                    var assetName = document.getElementById('assetName').value;
                                                                    var subclassifiedAstno = document.getElementById('subclassifiedAstno').value;
                                                                    var flatNo = document.getElementById('flatNo').value;
                                                                    var buildingNo = document.getElementById('buildingNo').value;
                                                                    var wayNo = document.getElementById('wayNo').value;
                                                                    var assetArea = document.getElementById('assetArea').value;
                                                                    var blockNo = document.getElementById('blockNo').value;
                                                                    var plotNo = document.getElementById('plotNo').value;
                                                                    var streetNo = document.getElementById('streetNo').value;
//                                                                    alert("4");
                                                                    var waterBillno = document.getElementById('waterBillno').value;
                                                                    var electricityBillno = document.getElementById('electricityBillno').value;
                                                                    var assetPostalCode = document.getElementById('assetPostalCode').value;
                                                                    var assetPostboxNo = document.getElementById('assetPostboxNo').value;
                                                                    var contractPeriod = document.getElementById('contractPeriod').value;
                                                                    var contractName = document.getElementById('contractName').value;
                                                                    var startsFrom = document.getElementById('startsFrom').value;
                                                                    var endsTo = document.getElementById('endsTo').value;
                                                                    var billingCycle = document.getElementById('billingCycle').value;
                                                                    var advanceAmount = document.getElementById('advanceAmount').value;
                                                                    var dueDate = document.getElementById('dueDate').value;
//                                                                    alert("5");
                                                                    var totalAmount = document.getElementById('totalAmount').value;
                                                                    var DiscountforAdvance = document.getElementById('DiscountforAdvance').value;
//                                                                    alert("5");
                                                                    var DiscountforRent = document.getElementById('DiscountforRent').value;
//                                                                    alert("55");
                                                                    var contractSigningDate = document.getElementById('contractSigningDate').value;
//                                                                    alert("555");
                                                                    var status = document.getElementById('status').value;
//                                                                     alert("5555");
//                                                                    var tenOrgfileName = document.getElementById('tenOrgfileName').value;
                                                                    var llSno = document.getElementById('llSno').value;
                                                                    var crIdNo = document.getElementById('crIdNo').value;
                                                                    var extra2 = document.getElementById('extra2').value;
//                                                                    var extra3 = document.getElementById('extra3').value;
//                                                                    var extra4 = document.getElementById('extra4').value;
//                                                                    var extra5 = document.getElementById('extra5').value;
                                                                    var recordstatus = document.getElementById('recordstatus').value;
                                                                    var creationDate = document.getElementById('creationDate').value;
                                                                    var roomCode = document.getElementById('roomCode').value;
                                                                    var roomName = document.getElementById('roomName').value;
//                                                                    alert("6");




                                                                    $('#resourcetable tr').each(function () {
                                                                        var a = $(this).find('#tenantFname').val();
                                                                        var a1 = $(this).find('#roomCode1').val();
//                                                                        alert("7");
                                                                        if (a == tenantFname) {
                                                                            alert('Tenant Name is already added!!!');
                                                                            document.getElementById('td').value = "";
                                                                            return false;
                                                                        } else if (a1 == roomCode) {
                                                                            alert('Room/Unit is already added!!!');
                                                                            document.getElementById('td').value = "";
                                                                            return false;
                                                                        } else {
                                                                            return true;
                                                                        }
                                                                    })
//                                                                    alert("8");
                                                                    var table = document.getElementById("resourcetable");
                                                                    var slNo = table.rows.length - 1;
                                                                    var slNo1 = table.rows.length;
                                                                    var id1 = slNo1;
                                                                    var tr = table.insertRow(slNo + 1);
//                                                                    alert("9");
                                                                    tr.id = 'list_tr_' + slNo;
                                                                    tr.innerHTML = '<td align="center" class="tinput"><button type="button" class="fa fa-trash fa-lg-o" onclick="removeRow('
                                                                            + slNo + ')" ></button> </td>' +
                                                                            '<td ><input class="form-control " style="text-align:left;" type="text" readonly name="tenantType" value="' + tenantType +
                                                                            '" ></td><td><input class="form-control " style="text-align:left;" type="text"readonly name="tenantCategory"  value="' + tenantCategory +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text"readonly name="tenantId" value="' + tenantId +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text"readonly id="tenantFname" name="tenantFname" value="' + tenantFname +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text"readonly name="tenantLname" value="' + tenantLname +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:right;" type="text"readonly name="tenantCrNo" value="' + tenantCrNo +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:right;" type="text"readonly name="tenantContactno" value="' + tenantContactno +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text" readonly name="correspondenceAddress" value="' + correspondenceAddress +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text" readonly name="assetName" value="' + assetName +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text" readonly name="flatNo" value="' + flatNo +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text" readonly name="roomName" value="' + roomName +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:right;" type="text" readonly name="contractName" value="' + contractName +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:right;" type="text" readonly name="startsFrom" value="' + startsFrom +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text" readonly name="endsTo" value="' + endsTo +
//                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text" readonly name="remarks" value="' + contractSigningDate +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text" readonly name="billingCycle" value="' + billingCycle +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text" readonly name="advanceAmount" value="' + advanceAmount +
                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text" readonly name="extra2" value="' + extra2 +
                                                                            '" style="border: none">' +
                                                                            '<input type="hidden" name="llId" value="' + llId + '">' +
                                                                            '<input type="hidden" name="llName" value="' + llName + '">' +
                                                                            '<input type="hidden" name="llCategory" value="' + llCategory + '">' +
                                                                            '<input type="hidden" name="llCrNo" value="' + llCrNo + '">' +
                                                                            '<input type="hidden" name="llContactno" value="' + llContactno + '">' +
                                                                            '<input type="hidden" name="llWorkContactno" value="' + llWorkContactno + '">' +
                                                                            '<input type="hidden" name="llMailid" value="' + llMailid + '">' +
                                                                            '<input type="hidden" name="tenantCitizenship" value="' + tenantCitizenship + '">' +
                                                                            '<input type="hidden" name="tenantWorkContactno" value="' + tenantWorkContactno + '">' +
                                                                            '<input type="hidden" name="tenantMailid" value="' + tenantMailid + '">' +
                                                                            '<input type="hidden" name="permanentAddress" value="' + permanentAddress + '">' +
                                                                            '<input type="hidden" name="postalCode" value="' + postalCode + '">' +
                                                                            '<input type="hidden" name="postboxNo" value="' + postboxNo + '">' +
                                                                            '<input type="hidden" name="sponcerName" value="' + sponcerName + '">' +
                                                                            '<input type="hidden" name="sponcerAddress" value="' + sponcerAddress + '">' +
                                                                            '<input type="hidden" name="companyName" value="' + companyName + '">' +
                                                                            '<input type="hidden" name="companyAddress" value="' + companyAddress + '">' +
                                                                            '<input type="hidden" name="postalCode1" value="' + postalCode1 + '">' +
                                                                            '<input type="hidden" name="postboxNo1" value="' + postboxNo1 + '">' +
                                                                            '<input type="hidden" name="jointeeName1" value="' + jointeeName1 + '">' +
                                                                            '<input type="hidden" name="jointeeAddress1" value="' + jointeeAddress1 + '">' +
                                                                            '<input type="hidden" name="jointeeName2" value="' + jointeeName2 + '">' +
                                                                            '<input type="hidden" name="jointeeAddress2" value="' + jointeeAddress2 + '">' +
                                                                            '<input type="hidden" name="remarks" value="' + remarks + '">' +
                                                                            '<input type="hidden" name="assetCode" value="' + assetCode + '">' +
//                                                                            '<input type="hidden" name="assetName" value="'+assetName+'">'+
                                                                            '<input type="hidden" name="subclassifiedAstno" value="' + subclassifiedAstno + '">' +
//                                                                            '<input type="hidden" name="flatNo" value="'+flatNo+'">'+
                                                                            '<input type="hidden" name="buildingNo" value="' + buildingNo + '">' +
                                                                            '<input type="hidden" name="wayNo" value="' + wayNo + '">' +
                                                                            '<input type="hidden" name="assetArea" value="' + assetArea + '">' +
                                                                            '<input type="hidden" name="blockNo" value="' + blockNo + '">' +
                                                                            '<input type="hidden" name="plotNo" value="' + plotNo + '">' +
                                                                            '<input type="hidden" name="streetNo" value="' + streetNo + '">' +
                                                                            '<input type="hidden" name="waterBillno" value="' + waterBillno + '">' +
                                                                            '<input type="hidden" name="electricityBillno" value="' + electricityBillno + '">' +
                                                                            '<input type="hidden" name="assetPostalCode" value="' + assetPostalCode + '">' +
                                                                            '<input type="hidden" name="assetPostboxNo" value="' + assetPostboxNo + '">' +
                                                                            '<input type="hidden" name="contractPeriod" value="' + contractPeriod + '">' +
                                                                            '<input type="hidden" name="dueDate" value="' + dueDate + '">' +
                                                                            '<input type="hidden" name="totalAmount" value="' + totalAmount + '">' +
                                                                            '<input type="hidden" name="DiscountforAdvance" value="' + DiscountforAdvance + '">' +
                                                                            '<input type="hidden" name="DiscountforRent" value="' + DiscountforRent + '">' +
                                                                            '<input type="hidden" name="contractSigningDate" value="' + contractSigningDate + '">' +
                                                                            '<input type="hidden" name="status" value="' + status + '">' +
                                                                            '<input type="hidden" name="llSno" value="' + llSno + '">' +
                                                                            '<input type="hidden" name="crIdNo" value="' + crIdNo + '">' +
                                                                            '<input type="hidden" name="recordstatus" value="' + recordstatus + '">' +
                                                                            '<input type="hidden" name="creationDate" value="' + creationDate + '">' +
                                                                            '<input type="hidden" id="roomCode1" name="roomCode" value="' + roomCode + '">' +
                                                                            '</td>';
                                                                    count++;
                                                                    document.getElementById('tenantId').value = "";
                                                                    document.getElementById('tenantFname').value = "";
                                                                    document.getElementById('tenantLname').value = "";
                                                                    document.getElementById('tenantCitizenship').value = "";
                                                                    document.getElementById('tenantCrNo').value = "";
                                                                    document.getElementById('tenantContactno').value = "";
                                                                    document.getElementById('tenantWorkContactno').value = "";
                                                                    document.getElementById('tenantMailid').value = "";
                                                                    document.getElementById('permanentAddress').value = "";
                                                                    document.getElementById('correspondenceAddress').value = "";
                                                                    document.getElementById('flatNo').value = "";
                                                                    document.getElementById('roomName').value = "";
                                                                    document.getElementById('postalCode').value = "";
                                                                    document.getElementById('postboxNo').value = "";
                                                                    document.getElementById('sponcerName').value = "";
                                                                    document.getElementById('sponcerAddress').value = "";
                                                                    document.getElementById('companyName').value = "";
                                                                    document.getElementById('companyAddress').value = "";
                                                                    document.getElementById('postalCode1').value = "";
                                                                    document.getElementById('postboxNo1').value = "";
                                                                    document.getElementById('jointeeName1').value = "";
                                                                    document.getElementById('jointeeAddress1').value = "";
                                                                    document.getElementById('jointeeName2').value = "";
                                                                    document.getElementById('jointeeAddress2').value = "";
                                                                    document.getElementById('remarks').value = "";
                                                                    document.getElementById('advanceAmount').value = "";
                                                                    document.getElementById('dueDate').value = "";
                                                                    document.getElementById('extra2').value = "";
                                                                    document.getElementById('totalAmount').value = "";
                                                                    document.getElementById('DiscountforAdvance').value = "";
                                                                    document.getElementById('DiscountforRent').value = "";
//                                                                    document.getElementById('tenantId').value = "";
                                                                    //                                                              

                                                                } else {
                                                                    return;
                                                                }

                                                                //document.getElementById('assetCode').disabled = true;
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
//                                                                    $("#subAssetName").focus();
//                                                                    $("#floor").focus();
                                                                    return false;
                                                                } else {
                                                                    return true;
                                                                }
                                                            }

                                                        </script>

                                                    </table>                        




                                                </div>
                                            </c:if>

                                            <!--grid-->
                                            <!--grid-->
                                            <!--grid-->
                                            <!--grid-->
                                            <!--grid-->
                                            <!--grid-->
                                            <!--grid-->
                                            <!--grid-->
                                            <!--grid-->
                                            <!--grid-->
                                            <!--grid-->
                                            <!--grid-->

                                            <c:if test="${action eq 'view' && appstatus eq 'CFO Approved' || appstatus eq 'Recheck'}">

                                                <table id="" class="table table-striped responsive-utilities jambo_table" style="">
                                                    <thead >
                                                        <tr class="headings">     
                                                            <th >Role</th>
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
                                                                    <td class="center" style="text-align: left;"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${list.lastmodifiedDate}" /></td>
                                                                    <td class="center" style="text-align: left;">${gfcremarks}</td>
                                                                </tr>
                                                            </c:if>
                                                            <c:if test="${cforemarks ne null}">
                                                                <tr>
                                                                    <td class="center" style="text-align: left;"><b>CFO</b></td>
                                                                    <td class="center" style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.lastmodifiedDate}" /></td>
                                                                    <td class="center" style="text-align: left;">${cforemarks}</td>
                                                                </tr>
                                                            </c:if>

                                                        </c:forEach> 
                                                    </tbody>
                                                </table> </c:if>

                                                <p>&nbsp;</p>




                                            <c:if test="${action ne 'view' && action ne 'edit' && action ne 'Recheck'}">
                                                <!--                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">-->
                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                    <button type="submit" class="btn btn-primary" style="" onclick="return checkGrid();">Save</button>
                                                    <a href="../tenant/tenantDetailsList.htm" class="btn btn-danger">Cancel</a>
                                                </div>
                                                <!--</div>--> 
                                            </c:if>
                                            <c:if test="${action eq 'edit' || action eq 'Recheck' }">

                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                                    <button type="button" class="btn btn-primary" style="" onclick="return test();">Save</button>
                                                    <a href="../tenant/tenantDetailsList.htm" class="btn btn-danger">Cancel</a>
                                                </div>

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
            window.onload = getContAttach();
            window.onload = getLlAttach();
            window.onload = getAssetUtilityDetails();
        </script>
        <script>
            $(document).ready(function () {

                $(document).on("click", "#addEnquiryBtnX1", function (e) {

                    addindividualutility();
                    e.preventDefault();
                });
                $(document).on("click", "#addEnquiryBtnX2", function (e) {

                    addcommonutility();
                    e.preventDefault();
                });

                //debugger;
                function addindividualutility() {

                    var rowCount1 = $('#enquirytable tr:visible').length;
                    var tablerow = "";
                    var addup;
                    var addup1;
                    // var addup;
                    try {
                        addup = callcategory();
                        addup1 = callcategory2();
                    } catch (error) {
                        addup;
                        addup1;
                    }
            <c:if test="${action eq null}">
                    tablerow = ['<tr class="item-enquiry">'
                                + '<td align="center" onclick=""><button type="button" id="deleteEnquiry"><i class="fa fa-trash-o"></i></button></td>'
                                + '<td>' + addup + '</td>'
                                + '<td>' + addup1 + '</td>'
                                + '<td><input class="form-control  right validate[required,custom[notzero]]" autocomplete="off" name="utilityBill" id="utilityBill" type="text" value="0" style="" onchange="individualinventorysum()"></td>'
                                + ' </tr>'].join('');
            </c:if>


                    var $utilityTable1 = $('#enquirytable');
                    var $row1 = $(tablerow);
                    $('.item-enquiry:last', $utilityTable1).after($row1);
                    var $itemRow = $(this).closest('tr');
                    $itemRow.find().focus();
                }

                function addcommonutility() {
                    debugger;
                    var rowCount1 = $('#enquirytable1 tr:visible').length;
                    var tablerow = "";
                    var addup2;
                    var addup3;
                    // var addup;
                    try {
                        addup2 = callcategory1();
                        addup3 = callcategory3();
                    } catch (error) {
                        addup2;
                        addup3;
                    }
            <c:if test="${action eq null}">
                    tablerow = ['<tr class="item-enquiry">'
                                + '<td align="center" onclick=""><button type="button" id="deleteEnquiry"><i class="fa fa-trash-o"></i></button></td>'
                                + '<td>' + addup2 + '</td>'
                                + '<td>' + addup3 + '</td>'
                                + '<td><input class="form-control  right validate[required,custom[notzero]]" autocomplete="off" name="comutilityBill" id="comutilityBill" type="text" value="0" style="" onchange="commoninventorysum()"></td>'
                                + ' </tr>'].join('');
            </c:if>

                    var $utilityTable1 = $('#enquirytable1');
                    var $row1 = $(tablerow);
                    $('.item-enquiry:last', $utilityTable1).after($row1);
                    var $itemRow = $(this).closest('tr');
                    $itemRow.find().focus();
                }

                individualinventorysum();
                commoninventorysum();
            });

            function individualinventorysum() {
                debugger;
                var sum = 0;
                $('#enquirytable').find('.item-enquiry').each(function () {
                    $(this).find("td:nth-child(" + 4 + ")").each(function (rowindex) {
                        newval = $(this).find("input").val();

                        if (isNaN(newval)) {
                            $(this).html(sum);
                        } else {
                            sum += parseFloat(newval);
                        }
                        console.log(sum);

                    });

                });
                $('#totalitemAmount').html(sum);
                $('#itmTot').val(sum);
            }

            function commoninventorysum() {
                debugger;
                var sum = 0;
                $('#enquirytable1').find('.item-enquiry').each(function () {
                    $(this).find("td:nth-child(" + 4 + ")").each(function (rowindex) {
                        newval = $(this).find("input").val();

                        if (isNaN(newval)) {
                            $(this).html(sum);
                        } else {
                            sum += parseFloat(newval);
                        }
                        console.log(sum);

                    });

                });
                $('#commontotalitemAmount').html(sum);
                $('#commonitmTot').val(sum);
            }
            function selectItem() {
                //$('#assetName').val('');
                //$('#assetName').val('');
                var y = (document.getElementById('assetCode').value);

                if (y == "" || y == null) {
                    alert('Please fill out the mandatory fields');
                    return  false;
                }
                var assetName = document.getElementById('assetCode').value;
                //alert(itemCat);

                myWindow = window.open("../tenant/selectItems.htm?assetName=" + assetName, "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                //myWindow = window.open("../purchase/selectItemMaster1.htm?supp=" + itemCat + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=99,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function selectItemCom() {
                //$('#assetName').val('');
                //$('#assetName').val('');
                var y = (document.getElementById('assetCode').value);

                if (y == "" || y == null) {
                    alert('Please fill out the mandatory fields');
                    return  false;
                }
                var assetName = document.getElementById('assetCode').value;
                //alert(itemCat);

                myWindow = window.open("../tenant/comUtilitySelect.htm?assetName=" + assetName, "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                //myWindow = window.open("../purchase/selectItemMaster1.htm?supp=" + itemCat + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=99,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }

        </script>
    </body>

</html>
