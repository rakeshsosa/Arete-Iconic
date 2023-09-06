<%-- 
    Document   : securityDepositForm
    Created on : 27 Mar, 2018, 12:05:41 PM
    Author     : ebs05
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link href="../common/theme/css/disableSelection.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../common/validate/validationEngine.css" rel="stylesheet" type="text/css"/>
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.min.js" type="text/javascript"></script>
        <script src="../common/datepicker/jquery-ui.js" type="text/javascript"></script>
        <link href="../common/datepicker/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>
        <script src="../common/datepicker/CalendarControl.js" type="text/javascript"></script>
        <link href="../common/datepicker/StyleCalender.css" rel="stylesheet" type="text/css"/>
        <title>arête Assets Management</title>
        <% java.util.Date d = new java.util.Date();%> 
        <script type="text/javascript">
            $(document).ready(function () {
                var medvalue = $("#receiptType").val();
                if (medvalue == '') {
                    $("#licColumn").hide();
                    $("#licColumns").show();
                    $("#licColumns1").hide();
                    $("#licColumn2").hide();
                }
                else if (medvalue == "Service") {
                    $("#licColumn").show();
                    $("#licColumns").show();
                    $("#licColumns1").hide();
                    $("#licColumn2").hide();
                    flag = true;
                }
                else if (medvalue == "Penalty") {
                    $("#licColumn").hide();
                    $("#licColumn2").show();
                    $("#licColumns").hide();
                    $("#licColumns1").hide();
                    flag = true;
                }
                else if (medvalue == "Utility No.1" || medvalue == "Utility No.2" || medvalue == "Others" || medvalue == "Lease" || medvalue == "Security Deposit") {
                    $("#licColumn").hide();
                    $("#licColumns").hide();
                    $("#licColumns1").hide();
                    $("#licColumn2").hide();
                    flag = true;
                }
                else if (medvalue == "Rent") {
                    $("#licColumn").hide();
                    $("#licColumns").show();
                    $("#licColumns1").show();
                    $("#licColumn2").hide();
                    flag = true;
                }
                else
                {
                    flag = false;
                    $("#licColumn").hide();
                    $("#licColumns").show();
                    $("#licColumns1").hide();
                    $("#licColumn2").hide();
                }
                var medvalue1 = $("#modeOfPayment").val();
                if (medvalue1 == '') {
                    $("#licColumn1").hide();
                }
                else if (medvalue1 == "Cheque") {
                    $("#licColumn1").show();
                    flag1 = true;
                }
                else
                {
                    flag1 = false;
                    $("#licColumn1").hide();
                }
                $("input").on("keypress", function (e) {
                    if (e.which === 32 && !this.value.length)
                        e.preventDefault();
                });
                var myBackup = $('#licColumn').clone();
                var myBackup1 = $('#licColumn1').clone();
                var myBackups = $('#licColumns').clone();
                var myBackups = $('#licColumns1').clone();
                var myBackups = $('#licColumn2').clone();
                $('#myReset').on('click', function () {
                    $('#licColumn').hide();
                });
                $('#myReset').on('click', function () {
                    $('#licColumn1').hide();
                });
                $('#myReset').on('click', function () {
                    $('#licColumns').show();
                });
                $('#myReset').on('click', function () {
                    $('#licColumns1').hide();
                });
                $('#myReset').on('click', function () {
                    $('#licColumn2').hide();
                });
                $("#receiptType").change(function () {
                    var medvalue = $("#receiptType").val();
                    if (medvalue == '') {
                        $("#licColumn").hide();
                        $("#licColumns").show();
                        $("#licColumns1").hide();
                        $("#licColumn2").hide();
                    }
                    else if (medvalue == "Service") {
                        $("#licColumn").show();
                        $("#licColumns").show();
                        $("#licColumns1").hide();
                        $("#licColumn2").hide();
                        flag = true;
                    }

                    else if (medvalue == "Penalty") {
                        $("#licColumn2").show();
                        $("#licColumn").hide();
                        $("#licColumns").hide();
                        $("#licColumns1").hide();
                        flag = true;
                    }
                    else if (medvalue == "Utility No.1" || medvalue == "Utility No.2" || medvalue == "Others" || medvalue == "Lease" || medvalue == "Security Deposit") {
                        $("#licColumn").hide();
                        $("#licColumns").hide();
                        $("#licColumns1").hide();
                        $("#licColumn2").hide();
                        flag = true;
                    }
                    else if (medvalue == "Rent") {
                        $("#licColumn").hide();
                        $("#licColumns").show();
                        $("#licColumns1").show();
                        $("#licColumn2").hide();
                        flag = true;
                    }
                    else
                    {
                        flag = false;
                        $("#licColumn").hide();
                        $("#licColumns").show();
                        $("#licColumns1").hide();
                        $("#licColumn2").hide();
                    }
                });
                $("#modeOfPayment").change(function () {
                    var medvalue1 = $("#modeOfPayment").val();
                    if (medvalue1 == '') {
                        $("#licColumn1").hide();
                    }
                    else if (medvalue1 == "Cheque") {
                        $("#licColumn1").show();
                        flag1 = true;
                    }
                    else
                    {
                        flag1 = false;
                        $("#licColumn1").hide();
                    }
                });
                var code = {};
                $("select[name='extra1'] > option").each(function () {
                    if (code[this.text]) {
                        $(this).remove();
                    } else {
                        code[this.text] = this.value;
                    }
                });
                var code = {};
                $("select[name='extra3'] > option").each(function () {
                    if (code[this.text]) {
                        $(this).remove();
                    } else {
                        code[this.text] = this.value;
                    }
                });
            });

            function chkMand() {
                test();
                var due = document.getElementById("dues").value
                alert("Due Amount:" + due);
                var mand = document.getElementById("receiptType").value &&
                        document.getElementById("tenantCode").value &&
                        document.getElementById("period").value &&
                        document.getElementById("toDate").value &&
                        document.getElementById("modeOfPayment").value &&
                        document.getElementById("amount").value &&
                        document.getElementById("dated").value;

                if (mand == "") {
                    alert("Please Fill Mandatory Fields");
                    return false;
                } else {
                    test13();
                    document.forms["billform"].submit();
                    return true;
                }
            }
            function test13() {
                var pod = document.getElementById("modeOfPayment").value;
                var pod1 = document.getElementById("receiptType").value;
                if (pod === 'Cheque') {
                    var x = document.getElementById("chequeNo").value;
                    var y = document.getElementById("bankName").value;
                    var z = document.getElementById("accountNo").value;
                    var z1 = document.getElementById("extra1").value;

                    if (x == '') {
                        alert("Enter Cheque No.");
                        $("#chequeNo").focus();
                        window.opener.document.getElementById('billbutton').disabled = true;
                        return false;
                    }
                    else if (y == '') {
                        alert("Enter Bank Name");
                        $("#bankName").focus();
                        window.opener.document.getElementById('billbutton').disabled = true;
                        return false;
                    }
//                    else if (z == '') {
//                        alert("Enter Account No.");
//                        $("#accountNo").focus();
//                        window.opener.document.getElementById('billbutton').disabled = true;
//                        return false;
//                    }
                    else if (z1 == '') {
                        alert("Enter Cheque Type");
                        $("#extra1").focus();
                        window.opener.document.getElementById('billbutton').disabled = true;
                        return false;
                    }
                }
                else if (pod1 === 'Service') {
                    var a = document.getElementById("srNo").value;
                    var b = document.getElementById("serviceDues").value;

                    if (a == '') {
                        alert("Enter Service Req. No.");
                        $("#srNo").focus();
                        window.opener.document.getElementById('billbutton').disabled = true;
                        return false;
                    }
                    else if (b == '') {
                        alert("Enter Service Dues");
                        $("#serviceDues").focus();
                        window.opener.document.getElementById('billbutton').disabled = true;
                        return false;
                    }
                }
                else if (pod1 === 'Penalty') {
                    var a = document.getElementById("penaltyType").value;
                    var b = document.getElementById("penaltyamount").value;

                    if (a == '') {
                        alert("Enter Penalty Type.");
                        $("#penaltyType").focus();
                        window.opener.document.getElementById('billbutton').disabled = true;
                        return false;
                    }
                    else if (b == '') {
                        alert("Enter Penalty Amount");
                        $("#penaltyamount").focus();
                        window.opener.document.getElementById('billbutton').disabled = true;
                        return false;
                    }
                }
                else {
                    document.forms["billform"].submit();
                    return true;
                }
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
            function selectTenant()
            {
                var receiptType = document.getElementById("receiptType").value;
                if (receiptType == '') {
                    alert("Please Select Receipt Type");
                }
                else if (receiptType == 'Advance') {
                    myWindow = window.open("../tenant/selectTenantA.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                    $("#rentAmount").prop("readonly", true);
                }
                else if (receiptType == 'Rent') {
                    myWindow = window.open("../tenant/selectTenantR.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                    $("#rentAmount").prop("readonly", true);
                }
                else if (receiptType == 'Service') {
                    myWindow = window.open("../tenant/selectTenant.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                    $("#rentAmount").prop("readonly", true);
                }
                else if (receiptType == 'Penalty') {
                    myWindow = window.open("../tenant/selectTenant.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                    $("#rentAmount").prop("readonly", true);
                }
                else {
                    myWindow = window.open("../tenant/selectTenant.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                    $("#rentAmount").prop("readonly", false);
                    $("#amount").prop("readonly", true);
                }

            }
            function selectSRNo()
            {
                var tenantCode = document.getElementById("tenantCode").value;
                myWindow = window.open("../tenant/selectSRNo.htm?tenantCode=" + tenantCode + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }

            function selectPenalty()
            {
                var tenantCode = document.getElementById("tenantCode").value;
                myWindow = window.open("../tenant/selectPenalty.htm?tenantCode=" + tenantCode + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function bringAmount() {
                var tenantCode = document.getElementById("tenantCode").value;
                var srNo = document.getElementById("srNo").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../tenant/bringAmount.htm',
                            data: {
                                tenantCode: tenantCode,
                                srNo: srNo
                            },
                            success: function (data) {
                                if (data === 'a') {
                                    document.getElementById("rentAmount").value = '0';
                                } else {
                                    var dat = data.split("[");
                                    var dat1 = dat[1].split("]");
                                    document.getElementById("rentAmount").value = parseFloat(dat1[0]).toFixed(3);
                                }

                            }
                        });
            }

            function chkHistory()
            {
                var receiptType = document.getElementById("receiptType").value;
                var tenantCode = document.getElementById("tenantCode").value;
                var penaltyType = document.getElementById("penaltyType").value;
                var penaltyamount = document.getElementById("penaltyamount").value;
                var fromDate = document.getElementById("period").value;
                var toDate = document.getElementById("toDate").value;
                var srNo = document.getElementById("srNo").value;
                if (receiptType == '' || tenantCode == '' || fromDate == '') {
                    alert("Please Select Tenant Code...!");
                    return false;
                } else {
                    if (receiptType === 'Rent') {
                        $.ajax
                                ({
                                    type: "POST",
                                    url: '../tenant/getTenantDues.htm',
                                    data: {
                                        tenantCode: tenantCode,
                                        receiptType: receiptType
                                    },
                                    success: function (data) {
                                        if (data === 'a') {
                                            document.getElementById("dues").value = '0';
                                        } else {
                                            var dat = data.split("[");
                                            var dat1 = dat[1].split("]");
                                            document.getElementById("dues").value = parseFloat(dat1[0]).toFixed(3);
                                        }
                                        var rentAmount = document.getElementById("rentAmount").value;
                                        var dues = document.getElementById("dues").value;
                                        var totalAmount = (parseFloat(rentAmount) + parseFloat(dues)).toFixed(3);
                                        document.getElementById("totalAmount").value = totalAmount;
                                        document.getElementById("amount").value = totalAmount;

                                    }
                                });
                        myWindow = window.open("../tenant/selectchkHistory.htm?tenantCode=" + tenantCode + "&receiptType=" + receiptType + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
//                        checkPrepaid();

                    }
                    else if (receiptType === 'Advance') {

                        $.ajax
                                ({
                                    type: "POST",
                                    url: '../tenant/getTenantDues.htm',
                                    data: {
                                        tenantCode: tenantCode,
                                        receiptType: receiptType
                                    },
                                    success: function (data) {
                                        if (data === 'a') {
                                            document.getElementById("dues").value = '0';
                                            var rentAmount = document.getElementById("rentAmount").value;
                                            var dues = document.getElementById("dues").value;
                                            var totalAmount1 = (parseFloat(rentAmount) + parseFloat(dues)).toFixed(3);
                                            document.getElementById("totalAmount").value = totalAmount1;
                                            document.getElementById("amount").value = totalAmount1;
                                        } else {
                                            var dat = data.split("[");
                                            var dat1 = dat[1].split("]");
                                            document.getElementById("dues").value = parseFloat(dat1[0]).toFixed(3);
                                            var dues = document.getElementById("dues").value;
                                            var totalAmount1 = (parseFloat(dues)).toFixed(3);
                                            document.getElementById("totalAmount").value = totalAmount1;
                                            document.getElementById("amount").value = totalAmount1;
                                        }

                                    }
                                });

                        myWindow = window.open("../tenant/selectchkHistory.htm?tenantCode=" + tenantCode + "&receiptType=" + receiptType + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");

                    }
                    else if (receiptType === 'Service') {
                        $.ajax
                                ({
                                    type: "POST",
                                    url: '../tenant/getTenantDues.htm',
                                    data: {
                                        tenantCode: tenantCode,
                                        receiptType: receiptType
                                    },
                                    success: function (data) {
                                        if (data === 'a') {
                                            document.getElementById("dues").value = '0';
                                            var rentAmount = document.getElementById("rentAmount").value;
                                            var serviceRequestedCost = document.getElementById("serviceRequestedCost").value;
                                            var dues = document.getElementById("dues").value;
                                            var totalAmount1 = (parseFloat(rentAmount) + parseFloat(dues) + parseFloat(serviceRequestedCost)).toFixed(3);
                                            document.getElementById("totalAmount").value = totalAmount1;
                                            document.getElementById("amount").value = totalAmount1;
                                        } else {
                                            var dat = data.split("[");
                                            var dat1 = dat[1].split("]");
                                            document.getElementById("dues").value = parseFloat(dat1[0]).toFixed(3);
                                            var dues = document.getElementById("dues").value;
                                            var rentAmount = document.getElementById("rentAmount").value;
                                            var serviceRequestedCost = document.getElementById("serviceRequestedCost").value;
                                            var totalAmount1 = (parseFloat(rentAmount) + parseFloat(dues) + parseFloat(serviceRequestedCost)).toFixed(3);
                                            document.getElementById("totalAmount").value = totalAmount1;
                                            document.getElementById("amount").value = totalAmount1;
                                        }
                                    }
                                });

                        myWindow = window.open("../tenant/selectchkHistory.htm?tenantCode=" + tenantCode + "&receiptType=" + receiptType + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");

                    }

                    else if (receiptType === 'Penalty') {

                        $.ajax
                                ({
                                    type: "POST",
                                    url: '../tenant/getTenantPenalty.htm',
                                    data: {
                                        tenantCode: tenantCode,
                                        penaltyType: penaltyType,
                                        penaltyamount: penaltyamount,
                                        receiptType: receiptType,
                                    },
                                    success: function (data) {
                                        if ($.trim(data) == 'Already Exists.Enter another') {
                                            alert("Already Paid for this Penalty ");
                                            document.getElementById("penaltyType").value = "";
                                            document.getElementById("penaltyamount").value = "";
                                            document.getElementById("rentAmount").value = "";
                                            document.getElementById("amount").value = "";

                                            return false;
                                        }
                                    }
                                });

                        var totalAmount1 = document.getElementById("rentAmount").value = document.getElementById("penaltyamount").value;
                        document.getElementById("amount").value = totalAmount1;
                    }

                    else if (receiptType === 'Utility No.1') {

//                        $.ajax
//                                ({
//                                    type: "POST",
//                                    url: '../tenant/getTenantPenalty.htm',
//                                    data: {
//                                        tenantCode: tenantCode,
//                                        penaltyType: penaltyType,
//                                        penaltyamount: penaltyamount,
//                                        receiptType: receiptType,
//                                    },
//                                    success: function (data) {
//                                        if ($.trim(data) == 'Already Exists.Enter another') {
//                                            alert("Already Paid for this Penalty ");
//                                            document.getElementById("penaltyType").value = "";
//                                            document.getElementById("penaltyamount").value = "";
//                                            document.getElementById("rentAmount").value = "";
//                                            document.getElementById("amount").value = "";
//
//                                            return false;
//                                        }
//                                    }
//                                });

                        var totalAmount1 = document.getElementById("rentAmount").value;
                        document.getElementById("amount").value = totalAmount1;
                    }
                    else if (receiptType === 'Lease') {
                        document.getElementById("dues").value = '0';
                        $("#amount").prop("readonly", true);
                    }
                }
            }

//            function checkPrepaid(){
//                var receiptType = document.getElementById("receiptType").value;
//                var tenantCode = document.getElementById("tenantCode").value;
//                if (receiptType === 'Rent') {
//                        $.ajax
//                                ({
//                                    type: "POST",
//                                    url: '../tenant/checkPrepaid.htm',
//                                    data: {
//                                        tenantCode: tenantCode,
//                                        receiptType: receiptType
//                                    },
//                                    success: function (data) {
//                                        if (data === 'a') {
//                                            document.getElementById("prepaid1").value = '0';
//                                        } else {
//                                            var dat = data.split("[");
//                                            var dat1 = dat[1].split("]");
//                                            document.getElementById("prepaid1").value = dat1[0];
//                                        }
//                                        var rentAmount = document.getElementById("rentAmount").value;
//                                        var dues = document.getElementById("dues").value;
//                                        var prepaid1 = document.getElementById("prepaid1").value;alert(rentAmount);alert(dues);alert(prepaid1);
//                                        var totalAmount = ((parseFloat(rentAmount) + parseFloat(dues))- parseFloat(prepaid1));
//                                        document.getElementById("totalAmount").value = totalAmount;
//                                        document.getElementById("amount").value = totalAmount;
//
//                                    }
//                                });
//            }
//            }

            function getTenantDuesAdvt() {
                var receiptType = document.getElementById("receiptType").value;
                var tenantCode = document.getElementById("tenantCode").value;
                var rentAmount = parseFloat(document.getElementById("rentAmount").value);
                var totalAmount = document.getElementById("totalAmount").value;
                var amount = document.getElementById("amount").value;
                var srNo = document.getElementById("srNo").value;
                if (receiptType === 'Advance') {
                    $.ajax
                            ({
                                type: "POST",
                                url: '../tenant/getTenantDuesAdvt.htm',
                                data: {
                                    tenantCode: tenantCode,
                                    receiptType: receiptType
                                },
                                success: function (data) {
                                    if (data === 'a') {
                                        document.getElementById("dues").value = '0';
                                    } else {
                                        var dat = data.split("[");
                                        var dat1 = dat[1].split("]");
                                        var dat2 = dat1[0].split(",");
                                        var i, value = 0;
                                        for (i = 0; i < dat2.length; i++) {
                                            value = parseFloat(dat2[i]) + value;
                                            document.getElementById("totAdvance").value = parseFloat(value).toFixed(3);
                                            var totAdvance = document.getElementById("totAdvance").value;
                                            var dues = document.getElementById("dues").value;
                                            if (totAdvance >= rentAmount) {
                                                alert("Please Check Advance Amount ! Already Paid..");
                                                window.location.href = '../tenant/billPaymentForm.htm';
                                                return false;
                                            }
                                        }

                                    }
                                }
                            });
                }
                else if (receiptType === 'Service') {
                    if (srNo == '' || srNo == null) {
                        alert("Please Select Service Request No...!");
                        return false;
                    } else {
                        $.ajax
                                ({
                                    type: "POST",
                                    url: '../tenant/getTenantDuesServ.htm',
                                    data: {
                                        tenantCode: tenantCode,
                                        receiptType: receiptType,
                                        srNo: srNo
                                    },
                                    success: function (data) {
                                        if (data === 'a') {
                                            document.getElementById("dues").value = '0';
                                        } else {
                                            var dat = data.split("[");
                                            var dat1 = dat[1].split("]");
                                            var dat2 = dat1[0].split(",");
                                            var i, value = 0;
                                            for (i = 0; i < dat2.length; i++) {
                                                value = parseFloat(dat2[i]) + value;
                                                document.getElementById("totServ").value = parseFloat(value).toFixed(3);
                                                var totServ = document.getElementById("totServ").value;
                                                var dues = document.getElementById("dues").value;
                                                if (totServ >= rentAmount) {
                                                    alert("Please Check Service Amount ! Already Paid..");
                                                    window.location.href = '../tenant/billPaymentForm.htm';
                                                    return false;
                                                }
                                            }

                                        }
                                    }
                                });
                    }
                }
                else if (receiptType === 'Rent') {
                    $.ajax
                            ({
                                type: "POST",
                                url: '../tenant/checkPrepaid.htm',
                                data: {
                                    tenantCode: tenantCode,
                                    receiptType: receiptType
                                },
                                success: function (data) {
                                    if (data === 'a') {
                                        document.getElementById("prepaid1").value = '0';
                                    } else {
                                        var dat = data.split("[");
                                        var dat1 = dat[1].split("]");
                                        document.getElementById("prepaid1").value = parseFloat(dat1[0]);
                                    }
                                    var rentAmount = document.getElementById("rentAmount").value;
                                    var dues = document.getElementById("dues").value;
                                    var prepaid1 = document.getElementById("prepaid1").value;
//                                    var totalAmount = ((parseFloat(rentAmount) + parseFloat(dues)) - parseFloat(prepaid1)).toFixed(3);
//                                    document.getElementById("totalAmount").value = totalAmount;
//                                    document.getElementById("amount").value = totalAmount;

                                }
                            });
//                    var atLeastOneIsChecked = $('input[name="chk1"]:checked').length > 0;
//                    if (atLeastOneIsChecked == true) {
//                        
//                    }
                    if (totalAmount == '0.000' && amount == '0.000') {
                        document.getElementById("modeOfPayment").value = 'Cash';
                        document.getElementById("dated").value = '<%= (new SimpleDateFormat("dd-MMM-yyyy")).format(new java.util.Date())%>';
                        alert("This Month Rent Already Paid..!");
                        $("#billform").submit();
                        return false;
                    }
                }
            }
            function checkAdvnce() {
                var receiptType = document.getElementById("receiptType").value;
                var tenantCode = document.getElementById("tenantCode").value;
                if (receiptType === 'Lease') {
                    $.ajax
                            ({
                                type: "POST",
                                url: '../tenant/getTenantAdvnce.htm',
                                data: {
                                    receiptType: receiptType,
                                    tenantCode: tenantCode
                                },
                                success: function (data) {
                                    if ($.trim(data) === 'Already Exists.Enter another') {
                                        if (receiptType === 'Advance') {
                                            alert("Advance Already Paid for this Tenant");
                                        }
                                        else if (receiptType === 'Lease') {
                                            alert("Lease Already Paid for this Tenant");
                                        }
                                        document.getElementById("tenantCode").value = "";
                                        document.getElementById("tenantName").value = "";
                                        document.getElementById("assetName").value = "";
                                        document.getElementById("buildingNo").value = "";
                                        document.getElementById("blockNo").value = "";
                                        document.getElementById("streetNo").value = "";
                                        document.getElementById("plotNo").value = "";
                                        document.getElementById("rentAmount").value = "";
                                        return false;
                                    }
                                }
                            });
                }
            }

            function checkDates1() {
                document.getElementById("toDate").value = '';
                var receiptType = document.getElementById("receiptType").value;
                var tenantCode = document.getElementById("tenantCode").value;
                var fromDate = document.getElementById("period").value;
                var toDate = document.getElementById("toDate").value;

                var actD = fromDate.split("-");
                var inA = toDate.split("-");
                var or = new Date(actD[1] + '/' + actD[0] + '/' + actD[2]);
                var trd = new Date(inA[1] + '/' + inA[0] + '/' + inA[2]);
                if (trd < or) {
                    alert("To Date should be Greater Than From Date.");
                    document.getElementById("period").value = '';
                    document.getElementById("toDate").value = '';
                    return false;
                }
                else if (receiptType === 'Rent') {
                    var v1 = new Date(actD);
                    var actualstartdatef = v1.getDate();
                    var actualstartmonthf = v1.getMonth();
                    var actualstartmonthf1 = actualstartmonthf + 1;
                    var actuaystartf = v1.getFullYear();
                    $.ajax
                            ({
                                type: "POST",
                                url: '../tenant/previousContrtacts.htm',
                                data: {
                                    tenantCode: tenantCode,
                                    actualstartdatef: actualstartdatef,
                                    actualstartmonthf1: actualstartmonthf1,
                                    actuaystartf: actuaystartf,
                                },
                                success: function (data) {
                                    if (data === 'a') {
                                        return false;
                                    } else {
                                        var dat = data.split(",");
                                        document.getElementById("rentAmount").value = parseFloat(dat[0]);
                                        document.getElementById("billCycle").value = dat[1];
                                        return true;
                                    }
                                }

                            });

                } else if (receiptType === 'Utility No.1') {
                    var v1 = new Date(actD);
                    var actualstartdatef = v1.getDate();
                    var actualstartmonthf = v1.getMonth();
                    var actualstartmonthf1 = actualstartmonthf + 1;
                    var actuaystartf = v1.getFullYear();
                    $.ajax
                            ({
                                type: "POST",
                                url: '../tenant/previousUtility.htm',
                                data: {
                                    tenantCode: tenantCode,
                                    actualstartdatef: actualstartdatef,
                                    actualstartmonthf1: actualstartmonthf1,
                                    actuaystartf: actuaystartf,
                                },
                                success: function (data) {
                                    if (data === 'a') {
                                        alert("To Date should be Greater Than From Date.1");
                                        return false;
                                    } else {

                                        var dat = data.split(",");
                                        document.getElementById("rentAmount").value = dat[0];
                                        //document.getElementById("billCycle").value = dat[1];
                                        return true;
                                    }
                                }

                            });

                }



            }

            function checkContDates() {
                var receiptType = document.getElementById("receiptType").value;
                var tenantCode = document.getElementById("tenantCode").value;
                var billCycle = document.getElementById("billCycle").value;
                var fromDate = document.getElementById("period").value;
                var toDate = document.getElementById("toDate").value;
                var dues = parseFloat(document.getElementById("dues").value);
                var tempdate = null;
                var actD = fromDate.split("-");
                var inA = toDate.split("-");
                var or = new Date(actD[1] + '/' + actD[0] + '/' + actD[2]);
                var trd = new Date(inA[1] + '/' + inA[0] + '/' + inA[2]);
                if (billCycle === 'Monthly' && receiptType === 'Rent') {
                    tempdate = new Date(or.setMonth(or.getMonth() + 1));
                    tempdate = new Date(tempdate.setDate(tempdate.getDate() - 1));
                    document.getElementById("toDate").value = moment(tempdate).format('DD-MMM-YYYY');
                    document.getElementById('toDate').style.pointerEvents = 'none';
                    checkDates();
                }
                else if (billCycle === 'Quarterly' && receiptType === 'Rent') {
                    tempdate = new Date(or.setMonth(or.getMonth() + 3));
                    tempdate = new Date(tempdate.setDate(tempdate.getDate() - 1));
                    document.getElementById("toDate").value = moment(tempdate).format('DD-MMM-YYYY');
                    document.getElementById('toDate').style.pointerEvents = 'none';
                    checkDates();
                }
                else if (billCycle === 'Half Yearly' && receiptType === 'Rent') {
                    tempdate = new Date(or.setMonth(or.getMonth() + 6));
                    tempdate = new Date(tempdate.setDate(tempdate.getDate() - 1));
                    document.getElementById("toDate").value = moment(tempdate).format('DD-MMM-YYYY');
                    document.getElementById('toDate').style.pointerEvents = 'none';
                    checkDates();
                }
                else if (billCycle === 'Yearly' && receiptType === 'Rent') {
                    tempdate = new Date(or.setMonth(or.getMonth() + 12));
                    tempdate = new Date(tempdate.setDate(tempdate.getDate() - 1));
                    document.getElementById("toDate").value = moment(tempdate).format('DD-MMM-YYYY');
                    document.getElementById('toDate').style.pointerEvents = 'none';
                    checkDates();
                }

//                var startsFrom = document.getElementById("startsFrom").value;
//                var endsTo = document.getElementById("endsTo").value;
//                var startsFrom1 = startsFrom.split("-");
//                var endsTo1 = endsTo.split("-");
//                var startsFrom2 = new Date(startsFrom1[1] + '/' + startsFrom1[0] + '/' + startsFrom1[2]);
//                var endsTo2 = new Date(endsTo1[1] + '/' + endsTo1[0] + '/' + endsTo1[2]);
//                var diff = ((new Date(startsFrom2).getTime()) - (new Date(or).getTime())) / (1000 * 24 * 3600);
//                var diff1 = ((new Date(endsTo2).getTime()) - (new Date(or).getTime())) / (1000 * 24 * 3600);
//                var diff2 = ((new Date(startsFrom2).getTime()) - (new Date(trd).getTime())) / (1000 * 24 * 3600);
//                var diff3 = ((new Date(endsTo2).getTime()) - (new Date(trd).getTime())) / (1000 * 24 * 3600);
//                if (diff < 0 && diff1 < 0 && diff2 < 0 && diff3 < 0)
//                {
//                    alert("Start Date and End Date Should be With in Contract Period:" + startsFrom + " To " + endsTo);
//                    document.getElementById("period").value = '';
//                    document.getElementById("toDate").value = '';
//                    return false;
//                }
//                else{
//                    var v1 = new Date(startsFrom1);
//                    var actualstartdatef = v1.getDate();
//                    var actualstartmonthf = v1.getMonth();
//                    var actualstartmonthf1 = actualstartmonthf + 1;
//                    var actuaystartf = v1.getFullYear();
//                    $.ajax
//                            ({
//                                type: "POST",
//                                url: '../tenant/previousArrearsforBV.htm',
//                                data: {
//                                    tenantCode: tenantCode,
//                                    startsFrom : startsFrom,
//                                    actualstartdatef : actualstartdatef,
//                                    actualstartmonthf1 : actualstartmonthf1,
//                                    actuaystartf : actuaystartf,
//                                },
//                                success: function (data) {
//                                    if (data === 'a') {
//                                        return false;
//                                    } else {
//                                        var dat = data.split("[");
//                                        var dat1 = dat[1].split("]");
//                                        document.getElementById("dues").value = parseFloat(dat1[0])+dues;
//                                    }
//                                }
//                            });
//                }
            }

            function checkDates() {
                var receiptType = document.getElementById("receiptType").value;
                var tenantCode = document.getElementById("tenantCode").value;
                var billCycle = document.getElementById("billCycle").value;
                var fromDate = document.getElementById("period").value;
                var toDate = document.getElementById("toDate").value;
                var actD = fromDate.split("-");
                var inA = toDate.split("-");
                var or = new Date(actD[1] + '/' + actD[0] + '/' + actD[2]);
                var trd = new Date(inA[1] + '/' + inA[0] + '/' + inA[2]);
                if (actD == '' && receiptType != 'Rent') {
                    alert("Select from date...");
                    document.getElementById("period").value = '';
                    document.getElementById("toDate").value = '';
                }
                if (trd < or) {
                    alert("To Date should be Greater Than From Date");
                    document.getElementById("period").value = '';
                    document.getElementById("toDate").value = '';
                    return false;
                }
            <c:if test="${action ne 'edit'}">
                if ((billCycle === 'Monthly' || billCycle === 'Quarterly' || billCycle === 'Half Yearly' || billCycle === 'Yearly') && receiptType === 'Rent') {
                    var v1 = new Date(actD);
                    var v2 = new Date(inA);
                    var actualdatef = v1.getDate();
                    var actualdatet = v2.getDate();
                    var actualmonthf = v1.getMonth();
                    var actualmontht = v2.getMonth();
                    var actualmonthf1 = actualmonthf + 1;
                    var actualmontht1 = actualmontht + 1;
                    var actuayf = v1.getFullYear();
                    var actuayt = v2.getFullYear();
                    $.ajax
                            ({
                                type: "POST",
                                url: '../tenant/getTenantDates.htm',
                                data: {
                                    tenantCode: tenantCode,
                                    actualdatef: actualdatef,
                                    actualdatet: actualdatet,
                                    actualmonthf1: actualmonthf1,
                                    actualmontht1: actualmontht1,
                                    actuayf: actuayf,
                                    actuayt: actuayt,
                                    receiptType: receiptType,
                                },
                                success: function (data) {
                                    if ($.trim(data) == 'Already Exists.Enter another') {
                                        alert("Rent Already Paid for this Month(s) " + fromDate + " to " + toDate);
                                        document.getElementById("period").value = "";
                                        document.getElementById("toDate").value = "";
                                        return false;
                                    }
                                }
                            });
                }
                if (receiptType === 'Utility No.1') {
                    var v1 = new Date(actD);
                    var v2 = new Date(inA);
                    var actualdatef = v1.getDate();
                    var actualdatet = v2.getDate();
                    var actualmonthf = v1.getMonth();
                    var actualmontht = v2.getMonth();
                    var actualmonthf1 = actualmonthf + 1;
                    var actualmontht1 = actualmontht + 1;
                    var actuayf = v1.getFullYear();
                    var actuayt = v2.getFullYear();
                    $.ajax
                            ({
                                type: "POST",
                                url: '../tenant/getTenantDates.htm',
                                data: {
                                    tenantCode: tenantCode,
                                    actualdatef: actualdatef,
                                    actualdatet: actualdatet,
                                    actualmonthf1: actualmonthf1,
                                    actualmontht1: actualmontht1,
                                    actuayf: actuayf,
                                    actuayt: actuayt,
                                    receiptType: receiptType,
                                },
                                success: function (data) {
                                    if ($.trim(data) == 'Already Exists.Enter another') {
                                        alert(" Utility No.1 Already Paid for this Month(s) " + fromDate + " to " + toDate);
                                        document.getElementById("period").value = "";
                                        document.getElementById("toDate").value = "";
                                        return false;
                                    }
                                }
                            });
                }
            </c:if>
//                else if (billCycle === 'Quarterly' && receiptType === 'Rent') {
//                    var v1 = new Date(actD);
//                    var v2 = new Date(inA);
//                    var actualdatef = v1.getDate();
//                    var actualdatet = v2.getDate();
//                    var actualmonthf = v1.getMonth();
//                    var actualmontht = v2.getMonth();
//                    var actualmonthf1 = actualmonthf + 1;
//                    var actualmontht1 = actualmontht + 1;
//                    var actuayf = v1.getFullYear();
//                    var actuayt = v2.getFullYear();
//                    $.ajax
//                            ({
//                                type: "POST",
//                                url: '../tenant/getTenantDates.htm',
//                                data: {
//                                    tenantCode: tenantCode,
//                                    actualdatef: actualdatef,
//                                    actualdatet: actualdatet,
//                                    actualmonthf1: actualmonthf1,
//                                    actualmontht1: actualmontht1,
//                                    actuayf: actuayf,
//                                    actuayt: actuayt
//                                },
//                                success: function (data) {
//                                    if ($.trim(data) == 'Already Exists.Enter another') {
//                                        alert("Rent Already Paid for this Month " + actualmonthf1);
//                                        document.getElementById("period").value = "";
//                                        document.getElementById("toDate").value = "";
//                                        return false;
//                                    }
//                                }
//                            });
//                }

            }

            function test() {
                var receiptType = document.getElementById("receiptType").value;
                var dues = parseFloat(document.getElementById("dues").value);
                var amtPaying = parseFloat(document.getElementById("amount").value);
                var totalAmount = parseFloat(document.getElementById("totalAmount").value);
                var rentAmount = parseFloat(document.getElementById("rentAmount").value);
                if (receiptType == 'Rent') {
                    if (amtPaying == totalAmount) {
                        document.getElementById("dues").value = '0';
                    }
                    var atLeastOneIsChecked = $('input[name="chk1"]:checked').length > 0;
                    if (atLeastOneIsChecked == true) {
                        if (amtPaying <= totalAmount) {
                            alert("Please Check Paying Amount..");
                            document.getElementById("amount").value = '';
                            window.opener.document.getElementById('billbutton').disabled = true;
                            return false;
                        } else {
                            return true;
                        }
                    }
                }
                else if (receiptType == 'Service') {
                    if (amtPaying == totalAmount) {
                        document.getElementById("dues").value = '0';
                    }
                }
                else if (receiptType == 'Advance') {
                    if (amtPaying == totalAmount) {
                        document.getElementById("dues").value = '0';
                    }
                }
                else if (receiptType == 'Penalty') {
                    if (amtPaying == rentAmount) {
                        //document.getElementById("dues").value = '0';
                    }
                }
            }
            function paidAmount() {
                var amtPaying = document.getElementById("amount").value;
                var totalAmount = document.getElementById("totalAmount").value;
                var rentAmount = document.getElementById("rentAmount").value;
                var aa = document.getElementsByName('chk1');
                var atLeastOneIsChecked = $('input[name="chk1"]:checked').length > 0;
                if (atLeastOneIsChecked == true) {
                    var rentA = (parseFloat(rentAmount) * 2);
//                    if (parseFloat(amtPaying) > rentA) {
//                        alert("Pre-Paid rent for  Two Months");
//                        document.getElementById("amount").value = '';
//                        return false;
//                    } else {
                    var prepaid = (parseFloat(amtPaying) - parseFloat(totalAmount)).toFixed(3);
                    document.getElementById("prepaid").value = parseFloat(prepaid);
                    document.getElementById("dues").value = '0';
//                    }
                } else {
                    if (parseFloat(amtPaying) <= parseFloat(totalAmount)) {
                        var dues = parseFloat(document.getElementById("dues").value);
                        document.getElementById("duesforcal").value = dues;
                        var dues1 = (parseFloat(totalAmount) - parseFloat(amtPaying)).toFixed(3);
                        document.getElementById("duesforcal1").value = dues1;
                        var duesforcal = document.getElementById("duesforcal").value;
                        var duesforcal1 = document.getElementById("duesforcal1").value;
                        if (Math.sign(duesforcal) == '1') {
                            var duesp = (duesforcal + duesforcal1);
                            document.getElementById("dues").value = duesp;
                        }
                        if (Math.sign(dues) == '-1' || isNaN(dues) == true) {
                            document.getElementById("dues").value = '0';
                        } else {
                            document.getElementById("dues").value = dues1;
                        }
                        document.getElementById("prepaid").value = '0';
                    }
                    else {
                        alert("Please Check Paying Amount..!");
                        document.getElementById("dues").value = '';
                        document.getElementById("amount").value = '';
                        return false;
                    }
                }
            }
            function otherAmountcal() {
                var amtPaying = document.getElementById("amount").value;
                var totalAmount = parseFloat(document.getElementById("totalAmount").value);
                var rentAmount = parseFloat(document.getElementById("rentAmount").value);
                var dues = parseFloat(document.getElementById("dues").value);
                var otherAmount = document.getElementById("otherAmount").value;
                var receiptType = document.getElementById("receiptType").value;
                if (receiptType === 'Rent') {
                    if (otherAmount !== '' || otherAmount !== "") {
                        var otheramt = rentAmount + parseFloat(otherAmount) + dues;
                        document.getElementById("totalAmount").value = otheramt;
                        document.getElementById("amount").value = otheramt;
                    }
                    else
                    {
                        document.getElementById("totalAmount").value = rentAmount + dues;
                        document.getElementById("amount").value = rentAmount + dues;
                    }
                }
            }
            function surrogates() {
                var receiptType = document.getElementById("receiptType").value;
                var tenantCode = document.getElementById("tenantCode").value;
                var amount = document.getElementById("amount").value;
                var rentAmount = document.getElementById("rentAmount").value;
                if (receiptType == 'Lease' || receiptType == 'Utility No.1' || receiptType == 'Utility No.2' || receiptType == 'Others' || receiptType == 'Security Deposit') {
                    document.getElementById("amount").value = rentAmount;
                    return true;
                }
            }
            function clearForm() {
                document.getElementById("tenantCode").value = '';
                document.getElementById("tenantName").value = '';
                document.getElementById("assetName").value = '';
                document.getElementById("buildingNo").value = '';
                document.getElementById("subassetCode").value = '';
                document.getElementById("flotNo").value = '';
                document.getElementById("streetNo").value = '';
                document.getElementById("plotNo").value = '';
                document.getElementById("blockNo").value = '';
                document.getElementById("rentAmount").value = '';
                document.getElementById("amount").value = '';
                document.getElementById("period").value = '';
                document.getElementById("toDate").value = '';
                document.getElementById('toDate').style.pointerEvents = 'auto';
            }
            function getVal($this) {
                var amtPaying = document.getElementById("amount").value;
                var totalAmount = parseFloat(document.getElementById("totalAmount").value);
                var rentAmount = parseFloat(document.getElementById("rentAmount").value);
                if (!$($this).is(':checked'))
                {
                    document.getElementById("amount").value = '';
                    return false;
                }
                else if (amtPaying == totalAmount) {
                    $("#amount").prop("readonly", false);
                    alert("Please Check Paying Amount..!");
                    document.getElementById("amount").value = '';
                    return false;
                }

            }


            function test1()
            {
                var remark = document.getElementById("extra2").value;
                var remark1 = document.getElementById("extra22").value;

                if (remark !== remark1)
                {
                    if (confirm('Do you really want to Save this updated record')) {
                        document.forms["billform"].submit();
                        return true;
                    } else {
                        return true;
                    }

                } else {
                    document.forms["billform"].submit();
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
                                <jsp:include page="../login/headerlink.htm?submodule=Receipt&tab=Security Deposit&pagetype=form"/>
                                <div class="x_title">
                                    <h2>Security Deposit</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />
                                    <form class="form-inline" id="billform" action="../tenant/securityDepositFormSubmit.htm"  method="post" enctype="multipart/form-data">
                                        <c:choose>
                                            <c:when test="${fn:length(billPayment) > 0}">
                                                <c:forEach items="${billPayment}" var="list">
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



                                                                });
                                                            </script>
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                        </c:choose>
                                        <c:forEach items="${test}" var="list">
                                            <c:if test="${list[0] eq '720'}">
                                                <c:set value="${list[1]}" var="field_1"/>
                                                <c:set value="${list[2]}" var="fieldStatus_1"/>
                                                <c:set value="${list[3]}" var="mand_status_1"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '721'}">
                                                <c:set value="${list[1]}" var="field_2"/>
                                                <c:set value="${list[2]}" var="fieldStatus_2"/>
                                                <c:set value="${list[3]}" var="mand_status_2"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '722'}">
                                                <c:set value="${list[1]}" var="field_3"/>
                                                <c:set value="${list[2]}" var="fieldStatus_3"/>
                                                <c:set value="${list[3]}" var="mand_status_3"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '723'}">
                                                <c:set value="${list[1]}" var="field_4"/>
                                                <c:set value="${list[2]}" var="fieldStatus_4"/>
                                                <c:set value="${list[3]}" var="mand_status_4"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '724'}">
                                                <c:set value="${list[1]}" var="field_5"/>
                                                <c:set value="${list[2]}" var="fieldStatus_5"/>
                                                <c:set value="${list[3]}" var="mand_status_5"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '725'}">
                                                <c:set value="${list[1]}" var="field_6"/>
                                                <c:set value="${list[2]}" var="fieldStatus_6"/>
                                                <c:set value="${list[3]}" var="mand_status_6"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '726'}">
                                                <c:set value="${list[1]}" var="field_7"/>
                                                <c:set value="${list[2]}" var="fieldStatus_7"/>
                                                <c:set value="${list[3]}" var="mand_status_7"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '727'}">
                                                <c:set value="${list[1]}" var="field_8"/>
                                                <c:set value="${list[2]}" var="fieldStatus_8"/>
                                                <c:set value="${list[3]}" var="mand_status_8"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '728'}">
                                                <c:set value="${list[1]}" var="field_9"/>
                                                <c:set value="${list[2]}" var="fieldStatus_9"/>
                                                <c:set value="${list[3]}" var="mand_status_9"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '729'}">
                                                <c:set value="${list[1]}" var="field_10"/>
                                                <c:set value="${list[2]}" var="fieldStatus_10"/>
                                                <c:set value="${list[3]}" var="mand_status_10"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '730'}">
                                                <c:set value="${list[1]}" var="field_11"/>
                                                <c:set value="${list[2]}" var="fieldStatus_11"/>
                                                <c:set value="${list[3]}" var="mand_status_11"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '731'}">
                                                <c:set value="${list[1]}" var="field_12"/>
                                                <c:set value="${list[2]}" var="fieldStatus_12"/>
                                                <c:set value="${list[3]}" var="mand_status_12"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '732'}">
                                                <c:set value="${list[1]}" var="field_13"/>
                                                <c:set value="${list[2]}" var="fieldStatus_13"/>
                                                <c:set value="${list[3]}" var="mand_status_13"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '733'}">
                                                <c:set value="${list[1]}" var="field_14"/>
                                                <c:set value="${list[2]}" var="fieldStatus_14"/>
                                                <c:set value="${list[3]}" var="mand_status_14"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '734'}">
                                                <c:set value="${list[1]}" var="field_15"/>
                                                <c:set value="${list[2]}" var="fieldStatus_15"/>
                                                <c:set value="${list[3]}" var="mand_status_15"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '735'}">
                                                <c:set value="${list[1]}" var="field_16"/>
                                                <c:set value="${list[2]}" var="fieldStatus_16"/>
                                                <c:set value="${list[3]}" var="mand_status_16"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '736'}">
                                                <c:set value="${list[1]}" var="field_17"/>
                                                <c:set value="${list[2]}" var="fieldStatus_17"/>
                                                <c:set value="${list[3]}" var="mand_status_17"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '737'}">
                                                <c:set value="${list[1]}" var="field_18"/>
                                                <c:set value="${list[2]}" var="fieldStatus_18"/>
                                                <c:set value="${list[3]}" var="mand_status_18"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '738'}">
                                                <c:set value="${list[1]}" var="field_19"/>
                                                <c:set value="${list[2]}" var="fieldStatus_19"/>
                                                <c:set value="${list[3]}" var="mand_status_19"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '739'}">
                                                <c:set value="${list[1]}" var="field_20"/>
                                                <c:set value="${list[2]}" var="fieldStatus_20"/>
                                                <c:set value="${list[3]}" var="mand_status_20"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '740'}">
                                                <c:set value="${list[1]}" var="field_21"/>
                                                <c:set value="${list[2]}" var="fieldStatus_21"/>
                                                <c:set value="${list[3]}" var="mand_status_21"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '741'}">
                                                <c:set value="${list[1]}" var="field_22"/>
                                                <c:set value="${list[2]}" var="fieldStatus_22"/>
                                                <c:set value="${list[3]}" var="mand_status_22"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '742'}">
                                                <c:set value="${list[1]}" var="field_23"/>
                                                <c:set value="${list[2]}" var="fieldStatus_23"/>
                                                <c:set value="${list[3]}" var="mand_status_23"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '743'}">
                                                <c:set value="${list[1]}" var="field_24"/>
                                                <c:set value="${list[2]}" var="fieldStatus_24"/>
                                                <c:set value="${list[3]}" var="mand_status_24"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '744'}">
                                                <c:set value="${list[1]}" var="field_25"/>
                                                <c:set value="${list[2]}" var="fieldStatus_25"/>
                                                <c:set value="${list[3]}" var="mand_status_25"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '745'}">
                                                <c:set value="${list[1]}" var="field_26"/>
                                                <c:set value="${list[2]}" var="fieldStatus_26"/>
                                                <c:set value="${list[3]}" var="mand_status_26"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '746'}">
                                                <c:set value="${list[1]}" var="field_27"/>
                                                <c:set value="${list[2]}" var="fieldStatus_27"/>
                                                <c:set value="${list[3]}" var="mand_status_27"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '747'}">
                                                <c:set value="${list[1]}" var="field_28"/>
                                                <c:set value="${list[2]}" var="fieldStatus_28"/>
                                                <c:set value="${list[3]}" var="mand_status_28"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '748'}">
                                                <c:set value="${list[1]}" var="field_29"/>
                                                <c:set value="${list[2]}" var="fieldStatus_29"/>
                                                <c:set value="${list[3]}" var="mand_status_29"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '749'}">
                                                <c:set value="${list[1]}" var="field_30"/>
                                                <c:set value="${list[2]}" var="fieldStatus_30"/>
                                                <c:set value="${list[3]}" var="mand_status_30"/>
                                            </c:if>

                                            <c:if test="${list[0] eq '750'}">
                                                <c:set value="${list[1]}" var="field_31"/>
                                                <c:set value="${list[2]}" var="fieldStatus_31"/>
                                                <c:set value="${list[3]}" var="mand_status_31"/>
                                            </c:if>

                                            <c:if test="${list[0] eq '751'}">
                                                <c:set value="${list[1]}" var="field_32"/>
                                                <c:set value="${list[2]}" var="fieldStatus_32"/>
                                                <c:set value="${list[3]}" var="mand_status_32"/>
                                            </c:if>

                                            <c:if test="${list[0] eq '752'}">
                                                <c:set value="${list[1]}" var="field_33"/>
                                                <c:set value="${list[2]}" var="fieldStatus_33"/>
                                                <c:set value="${list[3]}" var="mand_status_33"/>
                                            </c:if>

                                        </c:forEach> 
                                        <c:if test="${fieldStatus_1 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_1 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_1}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(billPayment) > 0}">
                                                        <c:forEach items="${billPayment}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="receiptDate" name="receiptDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.receiptDate}"/>">
                                                                    <input type="hidden" name="pk" value="${list.SNo}">
                                                                    <input type="hidden" name="status" value="${list.status}">
                                                                    <input type="hidden" name="receiptNo" value="${list.receiptNo}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" id="receiptDate" readonly="" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.receiptDate}"/>">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" class="form-control" readonly id="receiptDate" name="receiptDate" value="<%= (new SimpleDateFormat("dd-MMM-yyyy")).format(new java.util.Date())%>">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_2 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_2 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_2}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(billPayment) > 0}">
                                                        <c:forEach items="${billPayment}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="receiptType" name="receiptType" value="${list.receiptType}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="receiptType" value="${list.receiptType}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <select id="receiptType" name="receiptType" class="form-control" onchange="clearForm();">
                                                            <option value="" disabled="" selected>Select your option</option>
                                                            <c:forEach items="${Dropdown}" var="list">
                                                                <c:if test="${list[0] eq 'F-08'}">
                                                                    <option>${list[1]}</option>                                     
                                                                </c:if>
                                                            </c:forEach>
                                                        </select>
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div></c:if>
                                        <c:if test="${fieldStatus_3 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_3 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_3}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(billPayment) > 0}">
                                                        <c:forEach items="${billPayment}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="tenantCode" name="tenantCode" value="${list.tenantCode}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantCode" value="${list.tenantCode}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" class="form-control" placeholder="Select Tenant Details" readonly id="tenantCode" name="tenantCode" value="" onclick="return selectTenant();" onblur="checkAdvnce();">
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
                                                    <c:when test="${fn:length(tenantDetails) > 0}">
                                                        <c:forEach items="${tenantDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="tenantName" name="tenantName" maxlength="40" value="${list.tenantFname}" onkeypress="return isNumberKey3(event)">
                                                                    <input type="hidden" id="billCycle" name="billCycle" value="${list.billingCycle}">
                                                                    <input type="hidden" id="startsFrom" name="startsFrom" value="${list.startsFrom}">
                                                                    <input type="hidden" id="endsTo" name="endsTo" value="${list.endsTo}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantName" value="${list.tenantFname}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" class="form-control" placeholder="" readonly id="tenantName" name="tenantName" maxlength="40" value="" onkeypress="return isNumberKey3(event)">
                                                        <input type="hidden" id="startsFrom" name="startsFrom" value="">
                                                        <input type="hidden" id="endsTo" name="endsTo" value="">
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
                                                    <c:when test="${fn:length(tenantDetails) > 0}">
                                                        <c:forEach items="${tenantDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="assetNames" name="assetNames" value="${list.assetNames}">
                                                                    <input type="hidden" class="form-control" placeholder="" readonly id="assetName" name="assetName" value="${list.assetName}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="assetName" value="${list.assetNames}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" class="form-control" placeholder="" readonly id="assetNames" name="assetNames" value="">
                                                        <input type="hidden" class="form-control" placeholder="" readonly id="assetName" name="assetName" value="">
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
                                                                    <input type="text" class="form-control" readonly="" id="subassetCode" name="subassetCode" value="${list.subclassifiedAstno}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="subassetCode" value="${list.subclassifiedAstno}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" class="form-control" placeholder="" readonly id="subassetCode" name="subassetCode" value="">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                            <p>&nbsp;</p>
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
                                                                    <input type="text" class="form-control" readonly="" id="flotNo" name="flotNo" value="${list.flatNo}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="flotNo" value="${list.flatNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" class="form-control" placeholder="" readonly id="flotNo" name="flotNo" value="">
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
                                                    <c:when test="${fn:length(tenantDetails) > 0}">
                                                        <c:forEach items="${tenantDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="buildingNo" name="buildingNo" value="${list.buildingNo}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="buildingNo" value="${list.buildingNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" class="form-control" placeholder="" readonly id="buildingNo" name="buildingNo" value="">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_7 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_7 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_7}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(tenantDetails) > 0}">
                                                        <c:forEach items="${tenantDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="blockNo" name="blockNo" value="${list.blockNo}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="blockNo" value="${list.blockNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" class="form-control" placeholder="" readonly id="blockNo" name="blockNo" value="">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                            <p>&nbsp;</p>
                                        <c:if test="${fieldStatus_8 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_8 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_8}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(tenantDetails) > 0}">
                                                        <c:forEach items="${tenantDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="streetNo" name="streetNo" value="${list.streetNo}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" placeholder="" readonly id="streetNo" value="${list.streetNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" readonly  class="form-control" id="streetNo" name="streetNo" value="">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div> 
                                        </c:if>


                                        <c:if test="${fieldStatus_9 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_9 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_9}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(tenantDetails) > 0}">
                                                        <c:forEach items="${tenantDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control"  readonly="" id="plotNo" name="plotNo" value="${list.plotNo}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="plotNo" value="${list.plotNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" readonly class="form-control" id="plotNo" name="plotNo" value="">
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
                                                    <c:when test="${fn:length(billPayment) > 0}">
                                                        <c:forEach items="${billPayment}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="period" name="period" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.period}"/>" maxlength="20" onclick="javascript:NewCssCal('period', 'ddMMMyyyy', '', '', '', '', '')" onchange="checkDates1();">
                                                                    <input type="hidden" name="month" value="">
                                                                    <input type="hidden" name="year" value="">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="period" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.period}"/>">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" readonly="" placeholder="Select Date" class="form-control" id="period" name="period" value="" maxlength="20" onclick="javascript:NewCssCal('period', 'ddMMMyyyy', '', '', '', '', '')" onchange="checkDates1();" onblur="checkContDates();">
                                                        <input type="hidden" name="month" value="">
                                                        <input type="hidden" name="year" value="">

                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                            <p>&nbsp;</p>
                                        <c:if test="${fieldStatus_22 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_22 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_22}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(billPayment) > 0}">
                                                        <c:forEach items="${billPayment}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="toDate" name="toDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.period1}"/>" maxlength="20" onclick="javascript:NewCssCal('toDate', 'ddMMMyyyy', '', '', '', '', '')" onchange="checkDates();">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="toDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.period1}"/>">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" readonly="" placeholder="Select Date" class="form-control" id="toDate" name="toDate" value="" maxlength="20" onclick="javascript:NewCssCal('toDate', 'ddMMMyyyy', '', '', '', '', '')" onchange="checkDates();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>

                                            <div class="" style="display: none" id="licColumn">
                                            <c:if test="${fieldStatus_13 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_13 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_13}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(billPayment) > 0}">
                                                            <c:forEach items="${billPayment}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" readonly="" id="srNo" name="srNo" maxlength="50" value="${list.srNo}" onkeypress="return isNumberKey4(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="srNo" value="${list.srNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="Select Service Request" readonly class="form-control" id="srNo" name="srNo" maxlength="50" value="" onkeypress="return isNumberKey4(event)" onclick="selectSRNo();" onchange="bringAmount();" onblur="bringAmount();">
                                                            <!--                                                            <select id="srNo" name="srNo" class="form-control validate[required]">
                                                                                                                            <option value="" disabled selected>Select your option</option>
                                                            <c:forEach items="${serviceReq}" var="type">
                                                                <option>${type}</option>
                                                            </c:forEach>
                                                        </select>-->
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
                                                        <c:when test="${fn:length(billPayment) > 0}">
                                                            <c:forEach items="${billPayment}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" readonly="" id="serviceDues" name="serviceDues" value="${list.serviceDues}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="serviceDues" value="${list.serviceDues}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly="" class="form-control" id="serviceDues" name="serviceDues" value="" maxlength="20" onkeypress="return check_digit(event, this, 10, 3);">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                                <p>&nbsp;</p>
                                            <c:if test="${fieldStatus_31 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_31 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <label class="control-label">${field_31}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(billPayment) > 0}">
                                                            <c:forEach items="${billPayment}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" readonly="" id="serviceRequestedCost" name="serviceRequestedCost" value="${list.serviceRequestedCost}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="serviceRequestedCost" value="${list.serviceRequestedCost}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly="" class="form-control" id="serviceRequestedCost" name="serviceRequestedCost" value="" maxlength="20" onkeypress="return check_digit(event, this, 10, 3);">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>

                                            </div>

                                            <div class="" style="display: none" id="licColumn2">
                                            <c:if test="${fieldStatus_32 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_32 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_32}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(billPayment) > 0}">
                                                            <c:forEach items="${billPayment}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" readonly="" id="penaltyType" name="penaltyType" maxlength="50" value="${list.penaltyType}" >
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="penaltyType" value="${list.penaltyType}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="Select Penalty Type" readonly class="form-control" id="penaltyType" name="penaltyType" maxlength="50" value="" onclick="selectPenalty();" >

                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_33 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_33 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <label class="control-label">${field_33}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(billPayment) > 0}">
                                                            <c:forEach items="${billPayment}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" readonly="" id="penaltyamount" name="penaltyamount" value="${list.penaltyamount}" onchange=" ">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="penaltyamount" value="${list.penaltyamount}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly="" class="form-control" id="penaltyamount" name="penaltyamount" value="" maxlength="20" onchange=" ">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                                <p>&nbsp;</p>

                                            </div>

                                        <c:if test="${fieldStatus_11 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_11 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_11}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(billPayment) > 0}">
                                                        <c:forEach items="${billPayment}" var="list">
                                                            <c:set var="prepaid" value="${list.prepaidAmount}"></c:set>
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="rentAmount" name="rentAmount" maxlength="15" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.rentAmount}"/>" onkeypress="return isNumberKey3(event)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="rentAmount" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.rentAmount}"/>">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" id="rentAmount" name="rentAmount" value="${list.rentAmount}">
                                                        <input type="hidden" id="billCycle" name="billCycle" value="">
                                                        <input type="hidden" id="duesforcal" name="duesforcal" value="">
                                                        <input type="hidden" id="duesforcal1" name="duesforcal1" value="">
                                                        <input type="hidden" id="totAdvance" name="totAdvance" value="">
                                                        <input type="hidden" id="totServ" name="totServ" value="">
                                                        <input type="hidden" id="prepaid" name="prepaid" value="">
                                                        <input type="hidden" id="prepaid1" name="prepaid1" value="0">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${action eq 'view' && action eq 'edit'}"></c:if>
                                        <c:if test="${action ne 'view' && action ne 'edit'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <a style="color:transparent;">*</a>
                                                <label class="control-label">Previous Payments</label>
                                                <input class="myButton3" style="color: #fff; font-weight: 200;width: 173px;margin-left: -2.5px;" value="Check History" type="button"  onclick="chkHistory();" onblur="getTenantDuesAdvt();">
                                            </div>
                                        </c:if>


                                        <div class="" style="color: transparent;margin-top: -200px;">
                                            <h2 style="color: transparent;">Payment Details</h2>
                                            <div class="clearfix" style="color: transparent;"></div>
                                        </div>
                                        <div class="" style="display: none" id="licColumns"><p>&nbsp;</p>
                                            <c:if test="${fieldStatus_12 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_12 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <label class="control-label">${field_12}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(billPayment) > 0}">
                                                            <c:forEach items="${billPayment}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" readonly="" id="dues" name="dues" maxlength="50" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.dues}"/>" onkeypress="return isNumberKey(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="dues" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.dues}"/>">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly="" class="form-control" id="dues" name="dues" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="0"/>" maxlength="14" onkeypress="return check_digit(event, this, 10, 3);">
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
                                                        <c:when test="${fn:length(billPayment) > 0}">
                                                            <c:forEach items="${billPayment}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" readonly="" id="totalAmount" name="totalAmount" maxlength="40" value="${list.totalAmount}" onkeypress="return isNumberKey(event)" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.totalAmount}"/>">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="totalAmount" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.totalAmount}"/>">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly="" class="form-control" id="totalAmount" name="totalAmount" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value=""/>" maxlength="14" onkeypress="return check_digit(event, this, 10, 3);">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            </div>
                                        <c:if test="${action eq 'view' || action eq 'edit'}">
                                            <div class="" style="display: none" id="licColumns1">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <a style="color:transparent;">*</a>
                                                    <label class="control-label">Pre-Paid Rent</label>
                                                    <input class="form-control" readonly="" type="text" id="prepaid" name="prepaid" value="${prepaid}"/>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${action ne 'view'}">
                                            <div class="" style="display: none" id="licColumns1">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <a style="color:transparent;">*</a>
                                                    <label class="control-label">Pre-Paid Rent</label>
                                                    <input type="checkbox" id="chk1" name="chk1" onclick="getVal(this);" value=""/>
                                                </div></div>
                                            </c:if>
                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>
                                        <div class="x_title">
                                            <h2>Payment Details</h2>
                                            <div class="clearfix"></div>
                                        </div>
                                        <c:if test="${fieldStatus_16 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_16 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_16}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(billPayment) > 0}">
                                                        <c:forEach items="${billPayment}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="modeOfPayment" name="modeOfPayment" maxlength="40" value="${list.modeOfPayment}" onkeypress="return isNumberKey3(event)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="modeOfPayment" value="${list.modeOfPayment}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <select id="modeOfPayment" name="modeOfPayment" class="form-control">
                                                            <option value="" disabled="" selected>Select your option</option>
                                                            <c:forEach items="${Dropdown}" var="list">
                                                                <c:if test="${list[0] eq 'F-09'}">
                                                                    <option>${list[1]}</option>                                     
                                                                </c:if>
                                                            </c:forEach>
                                                        </select>
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_21 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_21 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_21}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(billPayment) > 0}">
                                                        <c:forEach items="${billPayment}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" style="resize: none" readonly="" id="amount" name="amount" maxlength="10" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.rentAmount}"/>" onkeypress="return isNumberKey(event)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" style="resize: none" readonly="" id="amount" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value="${list.rentAmount}"/>">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" style="resize: none" class="form-control" id="amount" name="amount" maxlength="14" onkeypress="return check_digit(event, this, 10, 3);" value="<fmt:formatNumber type="number" groupingUsed="false" maxFractionDigits="3" value=""/>" onkeyup="paidAmount();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                        <c:if test="${fieldStatus_20 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_20 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_20}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(billPayment) > 0}">
                                                        <c:forEach items="${billPayment}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly style="resize: none" id="dated" name="dated" maxlength="11" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.dated}"/>" onclick="javascript:NewCssCal('dated', 'ddMMMyyyy', '', '', '', '', '')">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" style="resize: none" readonly="" id="dated" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.dated}"/>">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Select Date" readonly="" class="form-control" id="dated" name="dated" maxlength="11" value="" onclick="javascript:NewCssCal('dated', 'ddMMMyyyy', '', '', '', '', '')">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                            <p>&nbsp;</p>
                                            <div class="" style="display: none" id="licColumn1">
                                            <c:if test="${fieldStatus_23 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_23 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_23}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(billPayment) > 0}">
                                                            <c:forEach items="${billPayment}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <!--<input type="text" class="form-control" readonly="" id="extra1" name="extra1" value="">-->
                                                                        <select id="extra1" id="extra1" name="extra1" class="form-control" value="${list.extra1}">
                                                                            <option selected hidden="">${list.extra1}</option>
                                                                            <c:forEach items="${Dropdown}" var="list">
                                                                                <c:if test="${list[0] eq 'F-22'}">
                                                                                    <option>${list[1]}</option>                                     
                                                                                </c:if>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="extra1" value="${list.extra1}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <!--<input type="text" placeholder="" class="form-control" name="extra1" id="extra1">-->
                                                            <select id="extra1" name="extra1" class="form-control">
                                                                <option value="" disabled="" selected>Select your option</option>
                                                                <c:forEach items="${Dropdown}" var="list">
                                                                    <c:if test="${list[0] eq 'F-22'}">
                                                                        <option>${list[1]}</option>                                     
                                                                    </c:if>
                                                                </c:forEach>
                                                            </select>
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
                                                        <c:when test="${fn:length(billPayment) > 0}">
                                                            <c:forEach items="${billPayment}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" id="chequeNo" name="chequeNo" maxlength="8" value="${list.chequeNo}" onkeypress="return isNumberKey(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="chequeNo" value="${list.chequeNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" id="chequeNo" name="chequeNo" maxlength="8" value="" onkeypress="return isNumberKey(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_18 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_18 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_18}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(billPayment) > 0}">
                                                            <c:forEach items="${billPayment}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" id="bankName" name="bankName" maxlength="11" value="${list.bankName}" onkeypress="return isNumberKey4(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="bankName" value="${list.bankName}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" id="bankName" name="bankName" maxlength="30" value="" onkeypress="return isNumberKey4(event)">
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
                                                        <c:when test="${fn:length(billPayment) > 0}">
                                                            <c:forEach items="${billPayment}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" id="accountNo" name="accountNo" maxlength="35" value="${list.accountNo}" onkeypress="return isNumberKey(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="accountNo" value="${list.accountNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" id="accountNo" name="accountNo" maxlength="30" value="" onkeypress="return isNumberKey3(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${action eq 'edit' || action eq 'view'}">
                                                <c:if test="${fieldStatus_25 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_25 eq 'required'}">
                                                            <a style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${field_25}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(billPayment) > 0}">
                                                                <c:forEach items="${billPayment}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <!--<input type="text" class="form-control" id="extra3" name="extra3" maxlength="20" >-->
                                                                            <select id="extra3" name="extra3" class="form-control" value="${list.extra3}">
                                                                                <option selected hidden="">${list.extra3}</option>
                                                                                <c:forEach items="${Dropdown}" var="list">
                                                                                    <c:if test="${list[0] eq 'F-24'}">
                                                                                        <option>${list[1]}</option>                                     
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="extra3" value="${list.extra3}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <!--<input type="text" placeholder="" class="form-control" id="extra3" name="extra3">-->
                                                                <select id="extra3" name="extra3" class="form-control">
                                                                    <option value="" disabled="" selected>Select your option</option>
                                                                    <c:forEach items="${Dropdown}" var="list">
                                                                        <c:if test="${list[0] eq 'F-24'}">
                                                                            <option>${list[1]}</option>                                     
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </select>
                                                            </c:otherwise>        
                                                        </c:choose>
                                                    </div></c:if></c:if>
                                                </div>
                                        <c:if test="${fieldStatus_28 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_28 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_28}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(billPayment) > 0}">
                                                        <c:forEach items="${billPayment}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="otherAmount" name="otherAmount" maxlength="40" value="${list.otherAmount}" onkeypress="return isNumberKey(event)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="otherAmount" value="${list.otherAmount}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" id="otherAmount" name="otherAmount" maxlength="14" onkeypress="return check_digit(event, this, 10, 3);" value="" onchange="otherAmountcal();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                            <!--Extra buffer fields-->

                                        <c:if test="${fieldStatus_24 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_24 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if> <a style="color:transparent;">*</a>
                                                <label class="control-label">${field_24}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(billPayment) > 0}">
                                                        <c:forEach items="${billPayment}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <textarea type="text" rows="1" style="resize: none"class="form-control" id="extra2" name="extra2" value="${list.extra2}">${list.extra2}</textarea>
                                                                    <input id="extra22" class="form-control"  rows="1" maxlength="300" style="resize: none" type="hidden" value="${list.extra2}">

                                                                </c:when>
                                                                <c:otherwise>
                                                                    <textarea type="text" rows="1" style="resize: none"class="form-control" readonly="" value="${list.extra2}">${list.extra2}</textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <textarea type="text" style="resize: none" placeholder="" rows="1" class="form-control" id="extra2" name="extra2" value=""></textarea>
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div></c:if>
                                            <p>&nbsp;</p>
                                        <c:if test="${fieldStatus_26 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_26 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_26}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(billPayment) > 0}">
                                                        <c:forEach items="${billPayment}" var="list">
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
                                        <c:if test="${fieldStatus_27 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_27 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_27}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(billPayment) > 0}">
                                                        <c:forEach items="${billPayment}" var="list">
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


                                            <p>&nbsp;</p>
                                            <p>&nbsp;</p>

                                        <c:if test="${action ne 'view' && action ne 'edit' }">
                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                <button type="button" id="billbutton" class="btn btn-primary" style="" onclick="return chkMand();">Save</button>
                                                <a href="../tenant/securityDepositList.htm" class="btn btn-danger">Cancel</a>
                                            </div>
                                        </c:if>
                                        <c:if test="${action eq 'edit'  }">

                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                                <button type="button" class="btn btn-primary" style="" onclick="return test1();">Save</button>
                                                <a href="../tenant/securityDepositList.htm" class="btn btn-danger">Cancel</a>
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
        </script>
    </body>

</html>