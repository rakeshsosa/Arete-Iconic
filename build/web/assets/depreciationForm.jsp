<%-- 
    Document   : depreciationForm
    Created on : 21 Sep, 2016, 11:35:31 AM
    Author     : Garun Mishra
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
        <title>arête Assets Management</title>     
        <script type="text/javascript">
//            jQuery(document).ready(function () {
//                $('#userform').validationEngine();
//
//                var code = {};
//                $("select[name='selectAddSubAsset'] > option").each(function () {
//                    if (code[this.text]) {
//                        $(this).remove();
//                    } else {
//                        code[this.text] = this.value;
//                    }
//                });
//
//                $("select[name='depreciationMethod'] > option").each(function () {
//                    if (code[this.text]) {
//                        $(this).remove();
//                    } else {
//                        code[this.text] = this.value;
//                    }
//                });
//            });

//            function startDatevalid($this, sno) {
//
//                NewCssCal('periodStart1' + sno, 'ddMMMyyyy', '', '', '', '', '');
//
//            }
//            function endDatevalid($this, sno) {
//
//                NewCssCal('periodEnd1' + sno, 'ddMMMyyyy', '', '', '', '', '');
//
//            }

//            function calcDerpreciation($this, sno) {
//
//                var depreciationPercent = document.getElementById('depreciationPercent1' + sno).value;
//                var valueOfAsset = document.getElementById('valueOfAsset1' + sno).value;
//                var periodStart = document.getElementById('periodStart1' + sno).value;
//                var periodEnd = document.getElementById('periodEnd1' + sno).value;
//
//                if (Date.parse(periodStart) < Date.parse(periodEnd)) {
//                    var startDateSplit = periodStart.split("-");
//                    var todayDateSplit = periodEnd.split("-");
//                    var srtDate = new Date(startDateSplit[1] + '/' + startDateSplit[0] + '/' + startDateSplit[2]);
//                    var currentDate = new Date(todayDateSplit[1] + '/' + todayDateSplit[0] + '/' + todayDateSplit[2]);
//                    var StartDateNumberOfDays = Math.ceil(srtDate.getTime() / (1000 * 3600 * 24));
//                    var EndDateNumberOfDays = Math.ceil(currentDate.getTime() / (1000 * 3600 * 24));
//
//                    var noOfDays = (EndDateNumberOfDays - StartDateNumberOfDays);
//                    noOfDays = noOfDays + 1;
//                    var noOfDaysDup = parseInt(document.getElementById('noOfDaysDup1' + sno).value);
//                    var totalNoOfDays = noOfDays + noOfDaysDup;
//                    var noOfyear = parseInt(totalNoOfDays / 365);
//                    var remainDays = totalNoOfDays % 365;
//                    var noOfMonth = parseInt(remainDays / 30);
//                    var totalPeriod = noOfyear + ' Years ' + noOfMonth + ' Months';
//
//                    var depreciationPerDay = (valueOfAsset * depreciationPercent / 100) / 365;
//                    var totalDepreciation = noOfDays * depreciationPerDay;
//                    document.getElementById('dipreciatedAmount1' + sno).value = totalDepreciation.toFixed(2);
//                    var cumulativeAmt = parseFloat(document.getElementById('dupcumulativeAmount' + sno).value);
//                    document.getElementById('cumulativeAmount1' + sno).value = (cumulativeAmt + totalDepreciation).toFixed(2);
//                    document.getElementById('timePeriod1' + sno).value = totalPeriod;
//                    document.getElementById('noOfDays1' + sno).value = totalNoOfDays;
//                    var newCurrentValueOfAsset = parseFloat(valueOfAsset - (cumulativeAmt + totalDepreciation)).toFixed(2);
//                    if (newCurrentValueOfAsset > 0) {
//                        document.getElementById('NBVAmount1' + sno).value = newCurrentValueOfAsset;
//                        return true;
//                    }
//                    else {
//                        document.getElementById('NBVAmount1' + sno).value = 0.00;
//                        return true;
//                    }
//                } else {
//                    alert("Depreciation Start Date should be less than from Depreciation End Date !!!");
//                    return false;
//                }
//            }

            function formValidateDepreciation() {
                var assetType = document.getElementById('assetType').value;
                var assetName = document.getElementById('assetName').value;
                var subAssetName = document.getElementById('subAssetName').value;
                var accessoriesName = document.getElementById('accessoriesName').value;
                var valueOfAsset = document.getElementById('valueOfAsset').value;
                var periodStart = document.getElementById('periodStart').value;
                var periodEnd = document.getElementById('periodEnd').value;
                var depreciationPercent = document.getElementById('depreciationPercent').value;
                var isVisiblesubAssetName = $('#subAssetName').is(':visible');
                var isVisibleaccessoriesName = $('#accessoriesName').is(':visible');
                // alert(isVisiblesubAssetName);
                // alert(isVisibleaccessoriesName);


                if (assetType == null || assetType == "" || assetType == "NaN") {
                    alert('Please select Property type !!!');
                    return false;
                }
                else if (assetName == null || assetName == "" || assetName == "NaN") {
                    alert('Please fill Property Name !!!');
                    return false;
                }
                else if ((subAssetName == "" || subAssetName == null) && isVisiblesubAssetName)
                {
                    alert('Please select a Falt Name!!!');
                    return false;
                }
                else if ((accessoriesName == "" || accessoriesName == null) && isVisibleaccessoriesName)
                {
                    alert('Please select a Accessory Name!!!');
                    return false;
                }
                else if (valueOfAsset === '' || valueOfAsset === null) {
                    alert('Please enter value of Property !!!');
                    return false;
                }
                else if (depreciationPercent === '' || depreciationPercent === null) {
                    alert('Please enter depreciation percentage !!!');
                    return false;
                }


                else if (periodStart === '' || periodStart === null) {
                    alert('Please Select Depreciation Start Date !!!');
                    return false;
                }
                else if (periodEnd === '' || periodEnd === null) {
                    alert('Please Select Depreciation End Date !!!');
                    return false;
                }
                else if (periodStart != null && periodStart != '' && periodEnd != null && periodEnd != '') {
                    if (Date.parse(periodStart) >= Date.parse(periodEnd)) {
                        alert("Depreciation Start Date should be less than from Depreciation End Date !!!");
                        document.getElementById('periodStart').value = '';
                        document.getElementById('periodEnd').value = '';
                        document.getElementById('timePeriod').value = '';
                        document.getElementById('NBVAmount').value = '';
                        document.getElementById('cumulativeAmount').value = '';
                        document.getElementById('dipreciatedAmount').value = '';
                        return false;
                    } else {
                        test11();
                    }
                }

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
             function isNumberKey2(evt) {
            debugger;
            var charCode = (evt.which) ? evt.which : event.keyCode;
            if (charCode == 46 && evt.srcElement.value.split('.').length > 1) {
                return false;
            }
            if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }


            function checkValues() {
                var assetType = document.getElementById('assetType').value;
                var assetName = document.getElementById('assetName').value;
                var subAssetName = document.getElementById('subAssetName').value;
                var accessoriesName = document.getElementById('accessoriesName').value;
                var valueOfAsset = document.getElementById('valueOfAsset').value;
                var periodStart = document.getElementById('periodStart').value;
                var periodEnd = document.getElementById('periodEnd').value;
                var depreciationPercent = document.getElementById('depreciationPercent').value;

                if (periodStart != null && periodStart != '' && periodEnd != null && periodEnd != '') {
                    if (Date.parse(periodStart) >= Date.parse(periodEnd)) {
                        alert("Depreciation Start Date should be less than from Depreciation End Date !!!");
                        document.getElementById('periodStart').value = '';
                        document.getElementById('periodEnd').value = '';
                        document.getElementById('timePeriod').value = '';
                        document.getElementById('NBVAmount').value = '';
                        document.getElementById('cumulativeAmount').value = '';
                        document.getElementById('dipreciatedAmount').value = '';
                        return false;
                    }
                }


                if (assetType != "" || assetType != null) {
                    if (assetType == "Accessories") {
                        if (assetName != "" && valueOfAsset != "" && periodStart != "" && periodEnd != "" && depreciationPercent != "" && subAssetName != "" && accessoriesName != "") {
//                            calcuateCurrentValueOfAsset();
                            checkAlreadyAddedRecord();
                        } else {

                            return false;
                        }
                    } else if (assetName != "" && valueOfAsset != "" && periodStart != "" && periodEnd != "" && depreciationPercent != "") {
//                        calcuateCurrentValueOfAsset();
                        checkAlreadyAddedRecord();
                    } else {

                        return false;
                    }


                } else {
                    return false;
                }

            }

            // Form content hide and show at very initially

            $(document).ready(function () {
//                $('#userform').validationEngine();
//                $("input").on("keypress", function (e) {
//
//                    if (e.which === 32 && !this.value.length)
//                        e.preventDefault();
//                });

                var subAssetCode = document.getElementById('subAssetName').value;
                var assetCode = document.getElementById('assetName').value;
                // var poName = document.getElementById('poName').value;
                if (subAssetCode === "" || subAssetCode == null) {
                    $('#assetNameDiv').show();
                    $('#subAssetNameDiv').hide();
                    $('#accessoriesNameDiv').hide();
                    $('#poNameDiv').hide();
                    $('#myGrid').hide();

                    return true;
                }
                if ((assetCode !== "" || assetCode !== null) && (subAssetCode !== "" || subAssetCode !== null)) {
                    $('#assetNameDiv').show();
                    $('#subAssetNameDiv').show();
                    $('#accessoriesNameDiv').show();
                    $('#poNameDiv').show();
                    $('#myGrid').show();
                    return true;
                }

            });

            function calcuateCurrentValueOfAsset() {
                var depreciationPercent = document.getElementById('depreciationPercent').value;
                var valueOfAsset = document.getElementById('valueOfAsset').value;
                var periodStart = document.getElementById('periodStart').value;
                var periodEnd = document.getElementById('periodEnd').value;
                var startDateSplit = periodStart.split("-");
                var todayDateSplit = periodEnd.split("-");
                var srtDate = new Date(startDateSplit[1] + '/' + startDateSplit[0] + '/' + startDateSplit[2]);
                var currentDate = new Date(todayDateSplit[1] + '/' + todayDateSplit[0] + '/' + todayDateSplit[2]);
                var StartDateNumberOfDays = Math.ceil(srtDate.getTime() / (1000 * 3600 * 24));
                var EndDateNumberOfDays = Math.ceil(currentDate.getTime() / (1000 * 3600 * 24));
                var noOfDays = (EndDateNumberOfDays - StartDateNumberOfDays);
                noOfDays = noOfDays + 1;
                var noOfDaysDup = parseInt(document.getElementById('noOfDaysDup').value);
                var totalNoOfDays = noOfDays + noOfDaysDup;
                var noOfyear = parseInt(totalNoOfDays / 365);
                var remainDays = totalNoOfDays % 365;
                var noOfMonth = parseInt(remainDays / 30.4);
                var totalPeriod = noOfyear + ' Years ' + noOfMonth + ' Months';

                var depreciationPerDay = (valueOfAsset * depreciationPercent / 100) / 365;
                var totalDepreciation = noOfDays * depreciationPerDay;
                document.getElementById('dipreciatedAmount').value = totalDepreciation.toFixed(2);

                var cumulativeAmt = parseFloat(document.getElementById('cumulativeAmount1').value);
                if (cumulativeAmt == '' || cumulativeAmt == null) {
                    cumulativeAmt = 0;
                }

                document.getElementById('cumulativeAmount').value = (cumulativeAmt + totalDepreciation).toFixed(2);
                document.getElementById('timePeriod').value = totalPeriod;
                document.getElementById('noOfDays').value = totalNoOfDays;
                var newCurrentValueOfAsset = parseFloat(valueOfAsset - (cumulativeAmt + totalDepreciation)).toFixed(2);
                if (newCurrentValueOfAsset > 0) {
                    document.getElementById('NBVAmount').value = newCurrentValueOfAsset;
                }
                else {
                    document.getElementById('NBVAmount').value = 0.00;
                }
            }

            function selectAssetType() {
                var selectAssetType = document.getElementById('assetType').value;

                if (selectAssetType === "Select your option") {
                    $('#assetNameDiv').show();
                    $('#subAssetNameDiv').hide();
                    $('#accessoriesNameDiv').hide();
                    $('#poNameDiv').hide();
                    $('#myGrid').hide();
                    document.getElementById('assetCode').value = '';
                    document.getElementById('assetName').value = '';
                    document.getElementById('subAssetCode').value = '';
                    document.getElementById('subAssetName').value = '';
                    document.getElementById('accessoryCode').value = '';
                    document.getElementById('accessoriesName').value = '';
                    document.getElementById('poNameDiv').value = '';
                    document.getElementById('periodStart').value = '';
                    document.getElementById('periodEnd').value = '';
                    document.getElementById('timePeriod').value = '';
                    document.getElementById('NBVAmount').value = '';
                    document.getElementById('cumulativeAmount').value = '';
                    document.getElementById('dipreciatedAmount').value = '';
                }
                if (selectAssetType === "Property") {
                    $('#assetNameDiv').show();
                    $('#subAssetNameDiv').hide();
                    $('#accessoriesNameDiv').hide();
                    $('#poNameDiv').hide();
                    $('#myGrid').hide();
                    document.getElementById('assetCode').value = '';
                    document.getElementById('assetName').value = '';
                    document.getElementById('subAssetCode').value = '';
                    document.getElementById('subAssetName').value = '';
                    document.getElementById('accessoryCode').value = '';
                    document.getElementById('accessoriesName').value = '';
                    document.getElementById('poNameDiv').value = '';
                    document.getElementById('periodStart').value = '';
                    document.getElementById('periodEnd').value = '';
                    document.getElementById('timePeriod').value = '';
                    document.getElementById('NBVAmount').value = '';
                    document.getElementById('cumulativeAmount').value = '';
                    document.getElementById('dipreciatedAmount').value = '';
                }

                if (selectAssetType === "Accessories") {
                    $('#assetNameDiv').show();
                    $('#subAssetNameDiv').show();
                    $('#accessoriesNameDiv').show();
                    $('#poNameDiv').show();
                    $('#myGrid').show();
                    document.getElementById('assetCode').value = '';
                    document.getElementById('assetName').value = '';
                    document.getElementById('subAssetCode').value = '';
                    document.getElementById('subAssetName').value = '';
                    document.getElementById('accessoryCode').value = '';
                    document.getElementById('accessoriesName').value = '';
                    document.getElementById('poNameDiv').value = '';
                    document.getElementById('periodStart').value = '';
                    document.getElementById('periodEnd').value = '';
                    document.getElementById('timePeriod').value = '';
                    document.getElementById('NBVAmount').value = '';
                    document.getElementById('cumulativeAmount').value = '';
                    document.getElementById('dipreciatedAmount').value = '';
                    document.getElementById('depreciationPercent').value = '20';
                    document.getElementById('poName').value = '';
                    document.getElementById('purchaseVoucherNo').value = '';
                }
            }


            /*  
             Pop List   
             */
            function SelectAssetName() {
                document.getElementById('subAssetName').value = '';
                document.getElementById('accessoriesName').value = '';
                document.getElementById('poNameDiv').value = '';
                document.getElementById('periodStart').value = '';
                document.getElementById('periodEnd').value = '';
                document.getElementById('timePeriod').value = '';
                document.getElementById('NBVAmount').value = '';
                document.getElementById('cumulativeAmount').value = '';
                document.getElementById('dipreciatedAmount').value = '';
                document.getElementById('valueOfAsset').value = '';
                document.getElementById('purchaseDate').value = '';
                document.getElementById('poName').value = '';
                document.getElementById('purchaseVoucherNo').value = '';
                var assetType = document.getElementById('assetType').value;
                if (assetType == null || assetType == '') {
                    alert("Please Select Property Type!!!!");
                    return false;
                }

                myWindow = window.open("../assetsm/selectAssetPopUp.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=99,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function SelectSubAssetName() {
                var assetName = document.getElementById('assetName').value;
                var assetCode = document.getElementById('assetCode').value;
                if (assetName === null || assetName === "") {
                    alert('Please Select Property Name');
                    return false;
                }
                document.getElementById('accessoriesName').value = '';
                document.getElementById('poNameDiv').value = '';
                document.getElementById('periodStart').value = '';
                document.getElementById('periodEnd').value = '';
                document.getElementById('timePeriod').value = '';
                document.getElementById('NBVAmount').value = '';
                document.getElementById('cumulativeAmount').value = '';
                document.getElementById('dipreciatedAmount').value = '';
                document.getElementById('valueOfAsset').value = '';
                document.getElementById('purchaseDate').value = '';
                document.getElementById('poName').value = '';
                document.getElementById('purchaseuucherNo').value = '';
                myWindow = window.open("../assetsm/selectSubAssetPopUp.htm?assetCode=" + assetCode + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=99,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function SelectAccessoriesName() {
                var assetName = document.getElementById('assetName').value;
                //                    var subAssetName = document.getElementById('subAssetName').value;
                var assetCode = document.getElementById('assetCode').value;
                var subAssetCode = document.getElementById('subAssetCode').value;
                if (assetName === null || assetName === "") {
                    alert('Please Select Property Name');
                    return false;
                }
                document.getElementById('accessoriesName').value = '';
                document.getElementById('poNameDiv').value = '';
                document.getElementById('periodStart').value = '';
                document.getElementById('periodEnd').value = '';
                document.getElementById('timePeriod').value = '';
                document.getElementById('NBVAmount').value = '';
                document.getElementById('cumulativeAmount').value = '';
                document.getElementById('dipreciatedAmount').value = '';
                document.getElementById('valueOfAsset').value = '';
                document.getElementById('purchaseDate').value = '';
                document.getElementById('poName').value = '';
                document.getElementById('purchaseVoucherNo').value = '';

                myWindow = window.open("../assetsm/SelectAccessoriesPopUp.htm?assetCode=" + assetCode + "&subAssetCode=" + subAssetCode + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=99,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function SelectPO() {

                var accessoryCode = document.getElementById('accessoryCode').value;
                if (accessoryCode === null || accessoryCode === "") {
                    alert('Please Select Accessory Name');
                    return false;
                }

                myWindow = window.open("../assetsm/selectPOPopUp.htm?accessoryCode=" + accessoryCode + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=99,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }

            //to check for integer value, decimal points and number of digits
            function checkdigit(e, obj, intsize, deczize) {
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






            //method to validate unique category
            function test11() {
                test12();
//                var flag=formValidateDepreciation();
//                if(flag==false){
//                    return false;
//                }
//                var assetCode = document.getElementById("assetCode").value;
//                var subAssetCode = document.getElementById("subAssetCode").value;
//                var accessoryCode = "";
//                //alert(assetCode);
//                $.ajax
//                        ({
//                            type: "POST",
//                            url: '../assetsm/propAvailabilty.htm',
//                            data: {
//                                assetCode: assetCode,
//                                subAssetCode: subAssetCode,
//                                accessoryCode: accessoryCode
//
//                            },
//                            success: function (data) {
//                                if ($.trim(data) == 'Already Exists.Enter another') {
//                                    alert("This Property already exist");
//
//                                    document.getElementById("assetName").value = "";
//                                    document.getElementById("subAssetName").value = "";
//                                    document.getElementById("accessoriesName").value = "";
//                                    document.getElementById('periodStart').value = '';
//                                    document.getElementById('periodEnd').value = '';
//                                    document.getElementById('timePeriod').value = '';
//                                    document.getElementById('NBVAmount').value = '';
//                                    document.getElementById('cumulativeAmount').value = '';
//                                    document.getElementById('dipreciatedAmount').value = '';
//
//                                    return false;
//                                }
//
//                                test12();
//                            }
//
//
//                        });
            }
            function test12()
            {
                $("#userform").submit();

            }



            $(document).ready(function () {
                $("#assetName").blur(function () {
                    var assetType = $('#assetType').val();
                    var assetName = $('#assetName').val();

                    if (assetType == 'Property' && (assetName != null || assetName != '')) {
                        var assetValue = $('#assetValue').val();
                        $('#valueOfAsset').val(assetValue);
                    } else {
                        $('#valueOfAsset').val('');
                    }
                });
                $('#assetType').change(function () {
                    var assetType = $('#assetType').val();
                    $('#purchaseVoucherNo').val('');
                    $('#valueOfAsset').val('');
                    $('#depreciationPercent').val('');
                    $('#periodStart').val('');
                    $('#periodEnd').val('');
                    $('#dipreciatedAmount').val('');
                    $('#cumulativeAmount').val('');
                    $('#NBVAmount').val('');
                    $('#timePeriod').val('');
                    if (assetType == 'Accessories') {
                        $('#depreciationPercent').val('20');
                    }

                });
            });

            function SelectPrice() {
                var poName = $('#poName').val();
                var accessoryCode = $('#accessoryCode').val();
                var price;
                $('#valueOfAsset').val("");
                var request_url = '../assetsm/selectAccessoriesPrice.htm?poName=' + poName + '&accessoryCode=' + accessoryCode + '';
                $.ajax({url: request_url,
                    success: function (data) {
//                            alert(data);
                        price = data;
                        if (price === "no value") {

                            $('#valueOfAsset').val("");
                        } else {

                            $('#valueOfAsset').val(price);
                        }

                    }
                    , error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("Status: " + textStatus);
                        alert("Error: " + errorThrown);
                    }
                });

            }

            function selectAssetCumulativeValue() {

                var assetType = $('#assetType').val();
                var assetCode = $('#assetCode').val();
                if (assetType !== null && assetType !== '' && assetCode !== null && assetCode !== '') {
                    if (assetType == 'Property') {
                        var cumulativeValue = 0;
                        var depreciationPercent = 0;
                        var purchaseDate = '';
                        var purchaseVoucherNo = '';
                        var values = null;
                        var request_url = '../assetsm/selectAssetCumulativeValue.htm?assetCode=' + assetCode + '';
                        $.ajax({url: request_url,
                            success: function (data) {
                                if (data === "no value") {

                                    $('#cumulativeAmount1').val('0');
                                    $('#depreciationPercent').val('');
                                    $('#purchaseVoucherNo').val('');
                                    $('#purchaseDate').val('');
                                    $('#dipreciationFirstDate').val('');
                                } else {
                                    var result = JSON.parse(data);

                                    $('#cumulativeAmount1').val(result[0]);
                                    $('#depreciationPercent').val(result[1]);
                                    $('#purchaseVoucherNo').val(result[2]);
                                    $('#noOfDaysDup').val(result[5]);
                                    var purDate = new Date(result[3]);
                                    var firstDate = new Date(result[4]);
                                    //var creationDate = new Date(result[6]);
                                    purDate = purDate.toString('dd-MMM-yyyy');
                                    firstDate = firstDate.toString('dd-MMM-yyyy');
                                    //creationDate=creationDate.toString('dd-MMM-yyyy');
                                    $('#purchaseDate').val(purDate);
                                    $('#dipreciationFirstDate').val(firstDate);
                                    //$('#created_user_dateTime').val(firstDate);
                                }

                            }
                            , error: function (XMLHttpRequest, textStatus, errorThrown) {
                                alert("Status: " + textStatus);
                                alert("Error: " + errorThrown);
                            }
                        });
                    }
                } else {
                    return false;
                }
            }
            function selectAccessoryCumulativeValue() {

                var assetType = $('#assetType').val();
                var assetCode = $('#assetCode').val();
                var subAssetCode = $('#subAssetCode').val();
                var accessoryCode = $('#accessoryCode').val();
                if (assetType !== null && assetType !== '' && assetCode !== null && assetCode !== '' && subAssetCode !== null && subAssetCode !== '' && accessoryCode !== null && accessoryCode !== '') {
                    var cumulativeValue = 0;
                    var depreciationPercent = 0;
                    var purchaseDate = '';
                    var purchaseVoucherNo = '';
                    var values = null;
                    var request_url = '../assetsm/selectAccessoryCumulativeValue.htm?assetCode=' + assetCode + '&subAssetCode=' + subAssetCode + '&accessoryCode=' + accessoryCode + '';
                    $.ajax({url: request_url,
                        success: function (data) {
                            if (data === "no value") {

                                $('#cumulativeAmount1').val('0');
                                $('#purchaseVoucherNo').val('');
                                $('#purchaseDate').val('');
                                $('#dipreciationFirstDate').val('');
                            } else {
                                var result = JSON.parse(data);

                                $('#cumulativeAmount1').val(result[0]);
                                $('#depreciationPercent').val(result[1]);
                                $('#purchaseVoucherNo').val(result[2]);
                                $('#noOfDaysDup').val(result[5]);
                                $('#poName').val(result[6]);
                                $('#valueOfAsset').val(result[7]);
                                var purDate = new Date(result[3]);
                                var firstDate = new Date(result[4]);
                                //var creationDate = new Date(result[6]);
                                purDate = purDate.toString('dd-MMM-yyyy');
                                firstDate = firstDate.toString('dd-MMM-yyyy');
                                //creationDate=creationDate.toString('dd-MMM-yyyy');
                                $('#purchaseDate').val(purDate);
                                $('#dipreciationFirstDate').val(firstDate);
                                //$('#created_user_dateTime').val(firstDate);
                            }

                        }
                        , error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                } else {
                    return false;
                }
            }
            function checkAlreadyAddedRecord() {
                var assetCode = $('#assetCode').val();
                var subAssetCode = $('#subAssetCode').val();
                var accessoryCode = $('#accessoryCode').val();
                var startDate = $('#periodStart').val();
                var endDate = $('#periodEnd').val();
                var request_url = '../assetsm/checkAlreadyAddedRecord.htm?assetCode=' + assetCode + '&subAssetCode=' + subAssetCode + '&accessoryCode=' + accessoryCode + '&startDate=' + startDate + '&endDate=' + endDate + '';
                $.ajax({url: request_url,
                    success: function (data) {
                        if (data == "Record Not Found") {
                            calcuateCurrentValueOfAsset();
                        }
                        if (data == "Record Found") {
                            alert("Record Already Added for this Period!!!!");
                        }

                    }
                });
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
                                <jsp:include page="../login/headerlink.htm?submodule=Depreciation&tab=Depreciation&pagetype=form"/>

                                <div class="x_title">
                                    <h2>Depreciation Details</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br/>


                                    <form id="userform" method="post" name="form" class="form-inline" action="../assetsm/depreciationFormSubmit.htm" >
                                        <%-- Set the Attribute  --%>

                                        <c:forEach items="${depreciation_category}" var="list">                                                       

                                            <c:if test="${list[0] eq '434'}">
                                                <c:set value="${list[1]}" var="fieldname_12"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_12"/>
                                                <c:set value="${list[3]}" var="mand_status_12"/>
                                            </c:if>  
                                            <c:if test="${list[0] eq '425'}">
                                                <c:set value="${list[1]}" var="fieldname_2"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_2"/>
                                                <c:set value="${list[3]}" var="mand_status_2"/>                                                          
                                            </c:if>
                                            <c:if test="${list[0] eq '426'}">
                                                <c:set value="${list[1]}" var="fieldname_3"/> 
                                                <c:set value="${list[2]}" var="fieldStatus_3"/>
                                                <c:set value="${list[3]}" var="mand_status_3"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '427'}">
                                                <c:set value="${list[1]}" var="fieldname_4"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_4"/>
                                                <c:set value="${list[3]}" var="mand_status_4"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '435'}">
                                                <c:set value="${list[1]}" var="fieldname_5"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_5"/>
                                                <c:set value="${list[3]}" var="mand_status_5"/>
                                            </c:if>                                                       
                                            <c:if test="${list[0] eq '428'}">
                                                <c:set value="${list[1]}" var="fieldname_6"/> 
                                                <c:set value="${list[2]}" var="fieldStatus_6"/>
                                                <c:set value="${list[3]}" var="mand_status_6"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '429'}">
                                                <c:set value="${list[1]}" var="fieldname_7"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_7"/>
                                                <c:set value="${list[3]}" var="mand_status_7"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '430'}">
                                                <c:set value="${list[1]}" var="fieldname_8"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_8"/>
                                                <c:set value="${list[3]}" var="mand_status_8"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '431'}">
                                                <c:set value="${list[1]}" var="fieldname_9"/> 
                                                <c:set value="${list[2]}" var="fieldStatus_9"/>
                                                <c:set value="${list[3]}" var="mand_status_9"/>
                                            </c:if>                                                      

                                            <c:if test="${list[0] eq '432'}">
                                                <c:set value="${list[1]}" var="fieldname_10"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_10"/>
                                                <c:set value="${list[3]}" var="mand_status_10"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '433'}">
                                                <c:set value="${list[1]}" var="fieldname_11"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_11"/>
                                                <c:set value="${list[3]}" var="mand_status_11"/>
                                            </c:if>  
                                            <c:if test="${list[0] eq '601'}">
                                                <c:set value="${list[1]}" var="fieldname_601"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_601"/>
                                                <c:set value="${list[3]}" var="mand_status_601"/>
                                            </c:if> 
                                            <c:if test="${list[0] eq '616'}">
                                                <c:set value="${list[1]}" var="fieldname_616"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_616"/>
                                                <c:set value="${list[3]}" var="mand_status_616"/>
                                            </c:if> 
                                            <c:if test="${list[0] eq '617'}">
                                                <c:set value="${list[1]}" var="fieldname_617"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_617"/>
                                                <c:set value="${list[3]}" var="mand_status_617"/>
                                            </c:if> 
                                            <c:if test="${list[0] eq '618'}">
                                                <c:set value="${list[1]}" var="fieldname_618"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_618"/>
                                                <c:set value="${list[3]}" var="mand_status_618"/>
                                            </c:if> 

                                        </c:forEach> 

                                        <c:if test="${fieldStatus_12 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_12 eq 'required'}">
                                                    <a  class="control-label" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${fieldname_12}</label>                                              

                                                <c:choose>
                                                    <c:when test="${fn:length(depreciationRecord) > 0}">
                                                        <c:forEach items="${depreciationRecord}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}"> 
                                                                    <input type="text" readonly="" class="form-control" name="assetType" value="${list.assetType}" id="assetType">  
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" readonly="" class="form-control" name="assetType" value="${list.assetType}" id="assetType">  
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <select  id="assetType"   name="assetType" required="" class="form-control" ${mand_status_12} onchange="selectAssetType();">
                                                            <option value="" disabled selected>Select your option</option>
                                                            <c:forEach items="${depreciation_dropdown_category}" var="list">
                                                                <c:if test="${list[0] eq 'F-05' && list[3] eq 'y'}">
                                                                    <option>${list[1]}</option>                                     
                                                                </c:if>
                                                            </c:forEach>  
                                                        </select> 
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>

                                        <%--Add the Asset Name, SubAsset Name, Assecesies name --%>
                                        <c:if test="${fieldStatus_2 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline" id="assetNameDiv">
                                                <c:if test="${mand_status_2 eq 'required'}">
                                                    <a  class="control-label" style="color:red;">*</a>
                                                </c:if> 
                                                <label class="control-label" for="selectError">${fieldname_2}</label>

                                                <c:choose>
                                                    <c:when test="${fn:length(depreciationRecord) > 0}">
                                                        <c:forEach items="${depreciationRecord}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" name="assetName" id="assetName" value="${list.assetName}">
                                                                    <input type="hidden" class="form-control" id="assetCode" name="assetCode" value="${list.assetCode}" >


                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" id="assetName" readonly="" value="${list.assetName}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" class="form-control" readonly="" placeholder="Select Property Name" name="assetName" id="assetName" ${mand_status_2} required="" autocomplete="off" onclick="SelectAssetName();" onblur="selectAssetCumulativeValue();">
                                                        <input type="hidden" class="form-control" id="assetCode" name="assetCode" value="${list.assetCode}" >
                                                        <input type="hidden" class="form-control" id="assetValue" name="assetValue" >

                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if> 


                                        <c:choose>
                                            <c:when test="${fn:length(depreciationRecord) > 0}">
                                                <c:forEach items="${depreciationRecord}" var="list">
                                                    <c:choose>
                                                        <c:when test="${list.assetType eq 'Accessories' && action eq 'view'}">
                                                        </c:when>
                                                        <c:otherwise>


                                                            <c:if test="${fieldStatus_617 eq 'y'}"> 
                                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                                    <c:if test="${mand_status_617 eq 'required'}">
                                                                        <a  class="control-label" style="color:red;">*</a>
                                                                    </c:if> 
                                                                    <a style="color:transparent;">*</a>
                                                                    <label class="control-label" for="selectError">${fieldname_617}</label>

                                                                    <c:choose>
                                                                        <c:when test="${fn:length(depreciationRecord) > 0}">
                                                                            <c:forEach items="${depreciationRecord}" var="list">
                                                                                <c:choose>
                                                                                    <c:when test="${action eq 'edit'}">
                                                                                        <input type="text" class="form-control" name="purchaseVoucherNo" value="" id="purchaseVoucherNo"  onkeypress="return isNumberKey(event)" >
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <input type="text" class="form-control" readonly="" value="">
                                                                                    </c:otherwise> 
                                                                                </c:choose>
                                                                            </c:forEach>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" name="purchaseVoucherNo" id="purchaseVoucherNo" autocomplete="off" required=""  onkeypress="return isNumberKey(event)">
                                                                        </c:otherwise>        
                                                                    </c:choose>
                                                                </div>
                                                            </c:if>
                                                            <br/>
                                                            <br/>
                                                            <br/>
                                                            <c:if test="${fieldStatus_616 eq 'y'}">
                                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                                    <c:if test="${mand_status_616 eq 'required'}">
                                                                        <a  class="control-label" style="color:red;">*</a>
                                                                    </c:if>
                                                                    <a style="color:transparent;">*</a>
                                                                    <label class="control-label">${fieldname_616}</label>                                          
                                                                    <c:choose>
                                                                        <c:when test="${fn:length(depreciationRecord) > 0}">
                                                                            <c:forEach items="${depreciationRecord}" var="list">
                                                                                <c:choose>
                                                                                    <c:when test="${action eq 'edit'}">
                                                                                        <c:if test="${list.assetType eq 'Property'}">
                                                                                            <input type="text" class="form-control input-xlarge" readonly="" required="" name="purchaseDate" id="purchaseDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.purchaseDate}"/>" onclick="javascript:NewCssCal('purchaseDate', 'ddMMMyyyy', '', '', '', '', 'past')">
                                                                                        </c:if>
                                                                                        <c:if test="${list.assetType eq 'Accessories'}">
                                                                                            <input type="text" class="form-control input-xlarge" readonly="" required="" name="purchaseDate" id="purchaseDate" value="" onclick="javascript:NewCssCal('purchaseDate', 'ddMMMyyyy', '', '', '', '', 'past')">
                                                                                        </c:if>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <c:if test="${list.assetType eq 'Property'}">
                                                                                            <input type="text" class="form-control" readonly="" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.purchaseDate}"/>">
                                                                                        </c:if>
                                                                                        <c:if test="${list.assetType eq 'Accessories'}">
                                                                                            <input type="text" class="form-control" readonly="" value="">
                                                                                        </c:if>
                                                                                    </c:otherwise> 
                                                                                </c:choose>
                                                                            </c:forEach>
                                                                        </c:when>
                                                                        <c:otherwise>                                                    
                                                                            <input type="text" class="form-control input-xlarge" readonly="" placeholder="Select Purchase Date" required="" name="purchaseDate" id="purchaseDate" autocomplete="off" onclick="javascript:NewCssCal('purchaseDate', 'ddMMMyyyy', '', '', '', '', 'past')">
                                                                        </c:otherwise>        
                                                                    </c:choose>

                                                                </div>
                                                            </c:if>


                                                            <c:if test="${fieldStatus_6 eq 'y'}">
                                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                                    <c:if test="${mand_status_6 eq 'required'}">
                                                                        <a  class="control-label" style="color:red;">*</a>
                                                                    </c:if> 
                                                                    <label class="control-label" for="selectError">${fieldname_6}</label>

                                                                    <c:choose>
                                                                        <c:when test="${fn:length(depreciationRecord) > 0}">
                                                                            <c:forEach items="${depreciationRecord}" var="list">
                                                                                <c:choose>
                                                                                    <c:when test="${action eq 'edit'}">
                                                                                        <c:if test="${list.assetType eq 'Property'}">

                                                                                            <input type="text" class="form-control"  name="valueOfAsset" value="${list.assetValue}" id="valueOfAsset"  onkeypress="return checkdigit(event, this, 10, 2);" onchange="checkValues();">
                                                                                        </c:if>
                                                                                        <c:if test="${list.assetType eq 'Accessories'}">

                                                                                            <input type="text" class="form-control"  name="valueOfAsset" value="" id="valueOfAsset"  onkeypress="return checkdigit(event, this, 10, 2);" onchange="checkValues();">
                                                                                        </c:if>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <c:if test="${list.assetType eq 'Property'}">
                                                                                            <input type="text" class="form-control" readonly="" value="${list.assetValue}">
                                                                                        </c:if>
                                                                                        <c:if test="${list.assetType eq 'Accessories'}">
                                                                                            <input type="text" class="form-control" readonly="" value="">
                                                                                        </c:if>
                                                                                    </c:otherwise> 
                                                                                </c:choose>
                                                                            </c:forEach>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" name="valueOfAsset" id="valueOfAsset" required="" autocomplete="off"  onkeypress="return checkdigit(event, this, 10, 2);" onchange="checkValues();">
                                                                        </c:otherwise>        
                                                                    </c:choose>
                                                                </div>
                                                            </c:if>

                                                            <c:if test="${fieldStatus_9 eq 'y'}">
                                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                                    <c:if test="${mand_status_9 eq 'required'}">
                                                                        <a  class="control-label" style="color:red;">*</a>
                                                                    </c:if>
                                                                    <label class="control-label">${fieldname_9}</label>                                          
                                                                    <c:choose>
                                                                        <c:when test="${fn:length(depreciationRecord) >0}">
                                                                            <c:forEach items="${depreciationRecord}" var="list">
                                                                                <c:choose>
                                                                                    <c:when test="${action eq 'edit'}">
                                                                                        <c:if test="${list.assetType eq 'Property'}">
                                                                                            <input type="text" class="form-control" readonly="" maxlength="3" name="depreciationPercent" value="${list.depreciationPercent}" id="depreciationPercent" onchange="checkValues();" onkeypress="return isNumberKey2(event)">
                                                                                        </c:if>
                                                                                        <c:if test="${list.assetType eq 'Accessories'}">
                                                                                            <input type="text" class="form-control"  maxlength="3" name="depreciationPercent" value="${list.depreciationPercent}" id="depreciationPercent" onchange="checkValues();" onkeypress="return isNumberKey2(event)">
                                                                                        </c:if>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <c:if test="${list.assetType eq 'Property'}">
                                                                                            <input type="text" class="form-control" readonly="" value="${list.depreciationPercent}">
                                                                                        </c:if>
                                                                                        <c:if test="${list.assetType eq 'Accessories'}">
                                                                                            <input type="text" class="form-control" readonly="" value="">
                                                                                        </c:if>
                                                                                    </c:otherwise> 
                                                                                </c:choose>
                                                                            </c:forEach>
                                                                        </c:when>
                                                                        <c:otherwise>                                                    
                                                                            <input type="text" class="form-control validate[custom[float]]" value=""  maxlength="3" name="depreciationPercent" id="depreciationPercent" autocomplete="off" required onchange="checkValues();" onkeypress="return isNumberKey2(event)">
                                                                        </c:otherwise>        
                                                                    </c:choose>

                                                                </div>
                                                            </c:if> 
                                                            <br/>
                                                            <br/> 
                                                            <br/> 
                                                            <c:if test="${fieldStatus_7 eq 'y'}">
                                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                                    <c:if test="${mand_status_7 eq 'required'}">
                                                                        <a  class="control-label-required" style="color:red;">*</a>
                                                                    </c:if>
                                                                    <label class="control-label">${fieldname_7}</label>                                          
                                                                    <c:choose>
                                                                        <c:when test="${fn:length(depreciationRecord) > 0}">
                                                                            <c:forEach items="${depreciationRecord}" var="list">
                                                                                <c:choose>
                                                                                    <c:when test="${action eq 'edit'}">
                                                                                        <c:if test="${list.assetType eq 'Property'}">
                                                                                            <input type="text" class="form-control input-xlarge" required="" readonly="" name="periodStart" id="periodStart" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.depreciationStartDate}"/>" onclick="javascript:NewCssCal('periodStart', 'ddMMMyyyy', '', '', '', '', 'past')" onchange="checkValues();">
                                                                                            <input type="hidden" required="" readonly="" name="dipreciationFirstDate" id="dipreciationFirstDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.dipreciationFirstDate}"/>">
                                                                                        </c:if>
                                                                                        <c:if test="${list.assetType eq 'Accessories'}">
                                                                                            <input type="text" class="form-control input-xlarge" required="" readonly="" name="periodStart" id="periodStart" value="" onclick="javascript:NewCssCal('periodStart', 'ddMMMyyyy', '', '', '', '', 'past')" onchange="checkValues();">
                                                                                            <input type="hidden" required="" readonly="" name="dipreciationFirstDate" id="dipreciationFirstDate" value="">
                                                                                        </c:if>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <c:if test="${list.assetType eq 'Property'}">
                                                                                            <input type="text" class="form-control" readonly="" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.depreciationStartDate}"/>">
                                                                                        </c:if>
                                                                                        <c:if test="${list.assetType eq 'Accessories'}">
                                                                                            <input type="text" class="form-control" readonly="" value="">
                                                                                        </c:if>
                                                                                    </c:otherwise> 
                                                                                </c:choose>
                                                                            </c:forEach>
                                                                        </c:when>
                                                                        <c:otherwise>                                                    
                                                                            <input type="text" class="form-control input-xlarge" readonly="" placeholder="Select Start Date" required="" name="periodStart" id="periodStart" autocomplete="off" onclick="javascript:NewCssCal('periodStart', 'ddMMMyyyy', '', '', '', '', 'past')" onchange="checkValues();">
                                                                            <input type="hidden" required="" readonly="" name="dipreciationFirstDate" id="dipreciationFirstDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.dipreciationFirstDate}"/>">
                                                                        </c:otherwise>        
                                                                    </c:choose>

                                                                </div>
                                                            </c:if>
                                                            <c:if test="${fieldStatus_5 eq 'y'}">
                                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                                    <c:if test="${mand_status_5 eq 'required'}">
                                                                        <a  class="control-label-required" style="color:red;">*</a>
                                                                    </c:if>
                                                                    <label class="control-label">${fieldname_5}</label>                                          
                                                                    <c:choose>
                                                                        <c:when test="${fn:length(depreciationRecord) > 0}">
                                                                            <c:forEach items="${depreciationRecord}" var="list">
                                                                                <c:choose>
                                                                                    <c:when test="${action eq 'edit'}">
                                                                                        <c:if test="${list.assetType eq 'Property'}">
                                                                                            <input type="text" class="form-control input-xlarge" readonly="" required="" name="periodEnd" id="periodEnd" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.depreciationEndDate}"/>"  onclick="javascript:NewCssCal('periodEnd', 'ddMMMyyyy', '', '', '', '', '')" onchange="checkValues();">
                                                                                        </c:if>
                                                                                        <c:if test="${list.assetType eq 'Accessories'}">
                                                                                            <input type="text" class="form-control input-xlarge" readonly="" required="" name="periodEnd" id="periodEnd" value=""  onclick="javascript:NewCssCal('periodEnd', 'ddMMMyyyy', '', '', '', '', '')" onchange="checkValues();">
                                                                                        </c:if>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <c:if test="${list.assetType eq 'Property'}">
                                                                                            <input type="text" class="form-control" readonly="" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.depreciationEndDate}"/>">
                                                                                        </c:if>
                                                                                        <c:if test="${list.assetType eq 'Accessories'}">
                                                                                            <input type="text" class="form-control" readonly="" value="">
                                                                                        </c:if>
                                                                                    </c:otherwise> 
                                                                                </c:choose>
                                                                            </c:forEach>
                                                                        </c:when>
                                                                        <c:otherwise>                                                    
                                                                            <input type="text" class="form-control input-xlarge" readonly="" placeholder="Select End Date" required="" name="periodEnd" id="periodEnd" autocomplete="off" onclick="javascript:NewCssCal('periodEnd', 'ddMMMyyyy', '', '', '', '', '')"  onchange="checkValues();">
                                                                        </c:otherwise>        
                                                                    </c:choose>

                                                                </div>
                                                            </c:if>

                                                            <!--                                                  <p>&nbsp;</p>-->
                                                            <c:if test="${fieldStatus_4 eq 'y'}">
                                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">                                        
                                                                    <c:if test="${mand_status_4 eq 'required'}"> 
                                                                        <a  class="control-label-required" style="color:red;">*</a>
                                                                    </c:if>
                                                                    <label class="control-label">${fieldname_4}</label>
                                                                    <c:choose>
                                                                        <c:when test="${fn:length(depreciationRecord) > 0}">
                                                                            <c:forEach items="${depreciationRecord}" var="list">
                                                                                <c:choose>
                                                                                    <c:when test="${action eq 'edit'}">
                                                                                        <c:if test="${list.assetType eq 'Property'}">
                                                                                            <input type="hidden" class="form-control" id="pk" name="pk" value="${list.SNo}" >
                                                                                            <input type="hidden" class="form-control" id="created_user_dateTime" name="created_user_dateTime" value="<fmt:formatDate value="${list.createdDate}" pattern="dd-MMM-yyyy" /> ">
                                                                                            <input type="text" class="form-control"  readonly required="" name="dipreciatedAmount" value="${list.depreciationAmount}" id="dipreciatedAmount" >
                                                                                        </c:if>
                                                                                        <c:if test="${list.assetType eq 'Accessories'}">
                                                                                            <input type="hidden" class="form-control" id="pk" name="pk" value="${list.SNo}" >
                                                                                            <input type="hidden" class="form-control" id="created_user_dateTime" name="created_user_dateTime" value="">
                                                                                            <input type="text" class="form-control"  readonly required="" name="dipreciatedAmount" value="" id="dipreciatedAmount" >
                                                                                        </c:if>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <c:if test="${list.assetType eq 'Property'}">
                                                                                            <input type="text" class="form-control" readonly="" value="${list.depreciationAmount}">
                                                                                        </c:if>
                                                                                        <c:if test="${list.assetType eq 'Accessories'}">
                                                                                            <input type="text" class="form-control" readonly="" value="">
                                                                                        </c:if>
                                                                                    </c:otherwise> 
                                                                                </c:choose>
                                                                            </c:forEach>
                                                                        </c:when>
                                                                        <c:otherwise> 
                                                                            <input type="hidden" class="form-control" id="pk" name="pk" value="${list.SNo}" >
                                                                            <input type="text" class="form-control" readonly="" required="" placeholder="Autocalculated" name="dipreciatedAmount" id="dipreciatedAmount" autocomplete="off" >
                                                                        </c:otherwise>        
                                                                    </c:choose>
                                                                </div>
                                                            </c:if>  
                                                            <br/>
                                                            <br/> 
                                                            <br/>
                                                            <c:if test="${fieldStatus_11 eq 'y'}">
                                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">                                        
                                                                    <c:if test="${mand_status_11 eq 'required'}"> 
                                                                        <a  class="control-label-required" style="color:red;">*</a>
                                                                    </c:if>
                                                                    <label class="control-label">${fieldname_11}</label>
                                                                    <c:choose>
                                                                        <c:when test="${fn:length(depreciationRecord) > 0}">
                                                                            <c:forEach items="${depreciationRecord}" var="list">
                                                                                <c:choose>
                                                                                    <c:when test="${action eq 'edit'}">
                                                                                        <c:if test="${list.assetType eq 'Property'}">
                                                                                            <input type="text" class="form-control"  readonly required="" name="cumulativeAmount" value="${list.cumulativeAmount}" id="cumulativeAmount" >
                                                                                            <input type="hidden" class="form-control" id="cumulativeAmount1" name="cumulativeAmount1" value="${list.cumulativeAmount}" >
                                                                                        </c:if>
                                                                                        <c:if test="${list.assetType eq 'Accessories'}">
                                                                                            <input type="text" class="form-control"  readonly required="" name="cumulativeAmount" value="" id="cumulativeAmount" >
                                                                                            <input type="hidden" class="form-control" id="cumulativeAmount1" name="cumulativeAmount1" value="0" >
                                                                                        </c:if>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <c:if test="${list.assetType eq 'Property'}">
                                                                                            <input type="text" class="form-control" readonly="" value="${list.cumulativeAmount}">
                                                                                        </c:if>
                                                                                        <c:if test="${list.assetType eq 'Accessories'}">
                                                                                            <input type="text" class="form-control" readonly="" value="">
                                                                                        </c:if>
                                                                                    </c:otherwise> 
                                                                                </c:choose>
                                                                            </c:forEach>
                                                                        </c:when>
                                                                        <c:otherwise> 
                                                                            <input type="text" class="form-control" readonly="" required="" placeholder="Autocalculated" name="cumulativeAmount" id="cumulativeAmount" autocomplete="off" >
                                                                            <input type="hidden" class="form-control" id="cumulativeAmount1" name="cumulativeAmount1" value="0" >
                                                                        </c:otherwise>        
                                                                    </c:choose>
                                                                </div>
                                                            </c:if>  
                                                            <c:if test="${fieldStatus_10 eq 'y'}">
                                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">                                        
                                                                    <c:if test="${mand_status_10 eq 'required'}"> 
                                                                        <a  class="control-label-required" style="color:red;">*</a>
                                                                    </c:if>
                                                                    <label class="control-label">${fieldname_10}</label>
                                                                    <c:choose>
                                                                        <c:when test="${fn:length(depreciationRecord) > 0}">
                                                                            <c:forEach items="${depreciationRecord}" var="list">
                                                                                <c:choose>
                                                                                    <c:when test="${action eq 'edit'}">
                                                                                        <c:if test="${list.assetType eq 'Property'}">
                                                                                            <input type="text" class="form-control"  readonly required="" name="NBVAmount" value="${list.NBV}" id="NBVAmount" >
                                                                                        </c:if>
                                                                                        <c:if test="${list.assetType eq 'Accessories'}">
                                                                                            <input type="text" class="form-control"  readonly required="" name="NBVAmount" value="" id="NBVAmount" >
                                                                                        </c:if>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <c:if test="${list.assetType eq 'Property'}">
                                                                                            <input type="text" class="form-control" readonly="" value="${list.NBV}">
                                                                                        </c:if>
                                                                                        <c:if test="${list.assetType eq 'Accessories'}">
                                                                                            <input type="text" class="form-control" readonly="" value="">
                                                                                        </c:if>
                                                                                    </c:otherwise> 
                                                                                </c:choose>
                                                                            </c:forEach>
                                                                        </c:when>
                                                                        <c:otherwise> 
                                                                            <input type="text" class="form-control" readonly="" required="" placeholder="Autocalculated" name="NBVAmount" id="NBVAmount" autocomplete="off" >
                                                                        </c:otherwise>        
                                                                    </c:choose>
                                                                </div>
                                                            </c:if>  

                                                            <c:if test="${fieldStatus_3 eq 'y'}">
                                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">                                        
                                                                    <c:if test="${mand_status_3 eq 'required'}"> 
                                                                        <a  class="control-label-required" style="color:red;">*</a>
                                                                    </c:if>
                                                                    <label class="control-label">${fieldname_3}</label>
                                                                    <c:choose>
                                                                        <c:when test="${fn:length(depreciationRecord) > 0}">
                                                                            <c:forEach items="${depreciationRecord}" var="list">
                                                                                <c:choose>
                                                                                    <c:when test="${action eq 'edit'}">
                                                                                        <c:if test="${list.assetType eq 'Property'}">
                                                                                            <input type="text" class="form-control"  readonly required="" name="timePeriod" value="${list.period}" id="timePeriod" >
                                                                                            <input type="hidden" class="form-control" id="noOfDays" name="noOfDays" value="${list.noOfDays}">
                                                                                            <input type="hidden" class="form-control" id="noOfDaysDup" name="noOfDaysDup" value="${list.noOfDays}">

                                                                                        </c:if>
                                                                                        <c:if test="${list.assetType eq 'Accessories'}">
                                                                                            <input type="text" class="form-control"  readonly required="" name="timePeriod" value="" id="timePeriod" >
                                                                                            <input type="hidden" class="form-control" id="noOfDays" name="noOfDays" value="">
                                                                                            <input type="hidden" class="form-control" id="noOfDaysDup" name="noOfDaysDup" value="0">
                                                                                        </c:if>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <c:if test="${list.assetType eq 'Property'}">
                                                                                            <input type="text" class="form-control" readonly="" value="${list.period}">
                                                                                        </c:if>
                                                                                    </c:otherwise> 
                                                                                </c:choose>
                                                                            </c:forEach>
                                                                        </c:when>
                                                                        <c:otherwise> 
                                                                            <input type="text" class="form-control" readonly="" required="" placeholder="Autocalculated" name="timePeriod" id="timePeriod" autocomplete="off" >
                                                                            <input type="hidden" class="form-control" id="noOfDays" name="noOfDays" value="">
                                                                            <input type="hidden" class="form-control" id="noOfDaysDup" name="noOfDaysDup" value="0">
                                                                        </c:otherwise>        
                                                                    </c:choose>
                                                                </div>
                                                            </c:if> 
                                                            <br/>
                                                            <br/> 
                                                            <br/>

                                                            <c:if test="${fieldStatus_601 eq 'y'}">
                                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline" id="accessoriesNameDiv">
                                                                    <c:if test="${mand_status_601 eq 'required'}">
                                                                        <a  class="control-label" style="color:red;">*</a>
                                                                    </c:if> 
                                                                    <label class="control-label" for="selectError">${fieldname_601}</label>

                                                                    <c:choose>
                                                                        <c:when test="${fn:length(depreciationRecord) > 0}">

                                                                            <c:forEach items="${depreciationRecord}" var="list">
                                                                                <c:choose>
                                                                                    <c:when test="${action eq 'edit'}">
                                                                                        <c:if test="${list.assetType eq 'Property'}">
                                                                                            <input type="text" class="form-control" placeholder="Select Accessories Name" ${mand_status_601} readonly="" name="accessoriesName" value="${list.accessoriesName}" id="accessoriesName" onclick="return SelectAccessoriesName();">                                                                                    
                                                                                            <input type="hidden" class="form-control" id="accessoryCode" name="accessoryCode" value="${list.accessoriesCode}" >
                                                                                        </c:if>
                                                                                        <c:if test="${list.assetType eq 'Accessories'}">
                                                                                            <input type="text" class="form-control" placeholder="Select Accessories Name" ${mand_status_601} readonly="" name="accessoriesName" value="" id="accessoriesName" onclick="return SelectAccessoriesName();" onblur="selectAccessoryCumulativeValue();">                                                                                    
                                                                                            <input type="hidden" class="form-control" id="accessoryCode" name="accessoryCode" value="" >
                                                                                        </c:if>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <c:if test="${list.assetType eq 'Property'}">
                                                                                            <input type="text" class="form-control" readonly="" name="accessoriesName" value="${list.accessoriesName}">
                                                                                        </c:if>
                                                                                        <c:if test="${list.assetType eq 'Accessories'}">
                                                                                            <input type="text" class="form-control" readonly="" name="accessoriesName" value="">
                                                                                        </c:if>
                                                                                    </c:otherwise> 
                                                                                </c:choose>
                                                                            </c:forEach>
                                                                        </c:when>
                                                                        <c:otherwise> 
                                                                            <input type="hidden" class="form-control" id="accessoryCode" name="accessoryCode" value="" >
                                                                            <input type="text" class="form-control" readonly="" placeholder="Select Accessories Name" name="accessoriesName" ${mand_status_601} id="accessoriesName" required="" autocomplete="off" onclick="return SelectAccessoriesName();" onblur="selectAccessoryCumulativeValue();">


                                                                        </c:otherwise>        
                                                                    </c:choose>
                                                                </div>
                                                            </c:if>  


                                                            <c:if test="${fieldStatus_618 eq 'y'}">
                                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline" id="poNameDiv">
                                                                    <c:if test="${mand_status_618 eq 'required'}">
                                                                        <a  class="control-label" style="color:red;">*</a>
                                                                    </c:if> 
                                                                    <a style="color:transparent;">*</a>
                                                                    <label class="control-label" for="selectError">${fieldname_618}</label>

                                                                    <c:choose>
                                                                        <c:when test="${fn:length(depreciationRecord) > 0}">
                                                                            <c:forEach items="${depreciationRecord}" var="list">
                                                                                <c:choose>
                                                                                    <c:when test="${action eq 'edit'}">

                                                                                        <input type="text" class="form-control" placeholder="Select PO" ${mand_status_618} readonly="" name="poName" value="" id="poName" onclick="return SelectPO();" onblur="SelectPrice();">                                                                                    
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <input type="text" class="form-control" readonly="" name="poName" value="" >
                                                                                    </c:otherwise> 
                                                                                </c:choose>
                                                                            </c:forEach>
                                                                        </c:when>
                                                                        <c:otherwise> 
                                                                            <input type="text" class="form-control" readonly="" placeholder="Select PO" name="poName" ${mand_status_601} id="poName" required="" autocomplete="off"  onclick="return SelectPO();" onblur="SelectPrice();">
                                                                        </c:otherwise>        
                                                                    </c:choose>
                                                                </div>
                                                            </c:if> 
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>


                                                <c:if test="${fieldStatus_617 eq 'y'}"> 
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_617 eq 'required'}">
                                                            <a  class="control-label" style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a> 
                                                        <label class="control-label" for="selectError">${fieldname_617}</label>

                                                        <c:choose>
                                                            <c:when test="${fn:length(depreciationRecord) > 0}">
                                                                <c:forEach items="${depreciationRecord}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" name="purchaseVoucherNo" value="" id="purchaseVoucherNo" onkeypress="return isNumberKey(event)" >
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" value="">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" name="purchaseVoucherNo" id="purchaseVoucherNo" autocomplete="off" required="" onkeypress="return isNumberKey(event)">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                    </div>
                                                </c:if>
                                                <br/>
                                                <br/> 
                                                <br/>
                                                <c:if test="${fieldStatus_616 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_616 eq 'required'}">
                                                            <a  class="control-label" style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label">${fieldname_616}</label>                                          
                                                        <c:choose>
                                                            <c:when test="${fn:length(depreciationRecord) > 0}">
                                                                <c:forEach items="${depreciationRecord}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <c:if test="${list.assetType eq 'Property'}">
                                                                                <input type="text" class="form-control input-xlarge" readonly="" required="" name="purchaseDate" id="purchaseDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.purchaseDate}"/>" onclick="javascript:NewCssCal('purchaseDate', 'ddMMMyyyy', '', '', '', '', 'past')">
                                                                            </c:if>
                                                                            <c:if test="${list.assetType eq 'Accessories'}">
                                                                                <input type="text" class="form-control input-xlarge" readonly="" required="" name="purchaseDate" id="purchaseDate" value="" onclick="javascript:NewCssCal('purchaseDate', 'ddMMMyyyy', '', '', '', '', 'past')">
                                                                            </c:if>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:if test="${list.assetType eq 'Property'}">
                                                                                <input type="text" class="form-control" readonly="" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.purchaseDate}"/>">
                                                                            </c:if>
                                                                            <c:if test="${list.assetType eq 'Accessories'}">
                                                                                <input type="text" class="form-control" readonly="" value="">
                                                                            </c:if>
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" class="form-control input-xlarge" readonly="" placeholder="Select Purchase Date" required="" name="purchaseDate" id="purchaseDate" autocomplete="off" onclick="javascript:NewCssCal('purchaseDate', 'ddMMMyyyy', '', '', '', '', 'past')">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div>
                                                </c:if>


                                                <c:if test="${fieldStatus_6 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_6 eq 'required'}">
                                                            <a  class="control-label" style="color:red;">*</a>
                                                        </c:if> 
                                                        <label class="control-label" for="selectError">${fieldname_6}</label>

                                                        <c:choose>
                                                            <c:when test="${fn:length(depreciationRecord) > 0}">
                                                                <c:forEach items="${depreciationRecord}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <c:if test="${list.assetType eq 'Property'}">

                                                                                <input type="text" class="form-control"  name="valueOfAsset" value="${list.assetValue}" id="valueOfAsset"  onkeypress="return checkdigit(event, this, 10, 2);" onchange="checkValues();">
                                                                            </c:if>
                                                                            <c:if test="${list.assetType eq 'Accessories'}">

                                                                                <input type="text" class="form-control"  name="valueOfAsset" value="" id="valueOfAsset"  onkeypress="return checkdigit(event, this, 10, 2);" onchange="checkValues();">
                                                                            </c:if>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:if test="${list.assetType eq 'Property'}">
                                                                                <input type="text" class="form-control" readonly="" value="${list.assetValue}">
                                                                            </c:if>
                                                                            <c:if test="${list.assetType eq 'Accessories'}">
                                                                                <input type="text" class="form-control" readonly="" value="">
                                                                            </c:if>
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" name="valueOfAsset" id="valueOfAsset" required="" autocomplete="off"  onkeypress="return checkdigit(event, this, 10, 2);" onchange="checkValues();">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                    </div>
                                                </c:if>

                                                <c:if test="${fieldStatus_9 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_9 eq 'required'}">
                                                            <a  class="control-label" style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${fieldname_9}</label>                                          
                                                        <c:choose>
                                                            <c:when test="${fn:length(depreciationRecord) >0}">
                                                                <c:forEach items="${depreciationRecord}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <c:if test="${list.assetType eq 'Property'}">
                                                                                <input type="text" class="form-control" readonly="" maxlength="3" name="depreciationPercent" value="${list.depreciationPercent}" id="depreciationPercent" onchange="checkValues();" onkeypress="return isNumberKey2(event)">
                                                                            </c:if>
                                                                            <c:if test="${list.assetType eq 'Accessories'}">
                                                                                <input type="text" class="form-control"  maxlength="3" name="depreciationPercent" value="${list.depreciationPercent}" id="depreciationPercent" onchange="checkValues();" onkeypress="return isNumberKey2(event)">
                                                                            </c:if>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:if test="${list.assetType eq 'Property'}">
                                                                                <input type="text" class="form-control" readonly="" value="${list.depreciationPercent}">
                                                                            </c:if>
                                                                            <c:if test="${list.assetType eq 'Accessories'}">
                                                                                <input type="text" class="form-control" readonly="" value="">
                                                                            </c:if>
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" class="form-control validate[custom[float]]" value=""  maxlength="3" name="depreciationPercent" id="depreciationPercent" autocomplete="off" required onchange="checkValues();" onkeypress="return isNumberKey2(event)">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div>
                                                </c:if> 
                                                <br/>
                                                <br/> 
                                                <br/> 
                                                <c:if test="${fieldStatus_7 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_7 eq 'required'}">
                                                            <a  class="control-label-required" style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${fieldname_7}</label>                                          
                                                        <c:choose>
                                                            <c:when test="${fn:length(depreciationRecord) > 0}">
                                                                <c:forEach items="${depreciationRecord}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <c:if test="${list.assetType eq 'Property'}">
                                                                                <input type="text" class="form-control input-xlarge" required="" readonly="" name="periodStart" id="periodStart" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.depreciationStartDate}"/>" onclick="javascript:NewCssCal('periodStart', 'ddMMMyyyy', '', '', '', '', 'past')" onchange="checkValues();">
                                                                                <input type="hidden" required="" readonly="" name="dipreciationFirstDate" id="dipreciationFirstDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.dipreciationFirstDate}"/>">

                                                                            </c:if>
                                                                            <c:if test="${list.assetType eq 'Accessories'}">
                                                                                <input type="text" class="form-control input-xlarge" required="" readonly="" name="periodStart" id="periodStart" value="" onclick="javascript:NewCssCal('periodStart', 'ddMMMyyyy', '', '', '', '', 'past')" onchange="checkValues();">
                                                                                <input type="hidden" required="" readonly="" name="dipreciationFirstDate" id="dipreciationFirstDate" value="">
                                                                            </c:if>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:if test="${list.assetType eq 'Property'}">
                                                                                <input type="text" class="form-control" readonly="" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.depreciationStartDate}"/>">
                                                                            </c:if>
                                                                            <c:if test="${list.assetType eq 'Accessories'}">
                                                                                <input type="text" class="form-control" readonly="" value="">
                                                                            </c:if>
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" class="form-control input-xlarge" readonly="" placeholder="Select Start Date" required="" name="periodStart" id="periodStart" autocomplete="off" onclick="javascript:NewCssCal('periodStart', 'ddMMMyyyy', '', '', '', '', 'past')" onchange="checkValues();">
                                                                <input type="hidden" required="" readonly="" name="dipreciationFirstDate" id="dipreciationFirstDate" value="">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div>
                                                </c:if>
                                                <c:if test="${fieldStatus_5 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <c:if test="${mand_status_5 eq 'required'}">
                                                            <a  class="control-label-required" style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${fieldname_5}</label>                                          
                                                        <c:choose>
                                                            <c:when test="${fn:length(depreciationRecord) > 0}">
                                                                <c:forEach items="${depreciationRecord}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <c:if test="${list.assetType eq 'Property'}">
                                                                                <input type="text" class="form-control input-xlarge" readonly="" required="" name="periodEnd" id="periodEnd" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.depreciationEndDate}"/>"  onclick="javascript:NewCssCal('periodEnd', 'ddMMMyyyy', '', '', '', '', '')" onchange="checkValues();">
                                                                            </c:if>
                                                                            <c:if test="${list.assetType eq 'Accessories'}">
                                                                                <input type="text" class="form-control input-xlarge" readonly="" required="" name="periodEnd" id="periodEnd" value=""  onclick="javascript:NewCssCal('periodEnd', 'ddMMMyyyy', '', '', '', '', '')" onchange="checkValues();">
                                                                            </c:if>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:if test="${list.assetType eq 'Property'}">
                                                                                <input type="text" class="form-control" readonly="" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.depreciationEndDate}"/>">
                                                                            </c:if>
                                                                            <c:if test="${list.assetType eq 'Accessories'}">
                                                                                <input type="text" class="form-control" readonly="" value="">
                                                                            </c:if>
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" class="form-control input-xlarge" readonly="" placeholder="Select End Date" required="" name="periodEnd" id="periodEnd" autocomplete="off" onclick="javascript:NewCssCal('periodEnd', 'ddMMMyyyy', '', '', '', '', '')"  onchange="checkValues();">
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div>
                                                </c:if>

                                                <!--                                                  <p>&nbsp;</p>-->
                                                <c:if test="${fieldStatus_4 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">                                        
                                                        <c:if test="${mand_status_4 eq 'required'}"> 
                                                            <a  class="control-label-required" style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${fieldname_4}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(depreciationRecord) > 0}">
                                                                <c:forEach items="${depreciationRecord}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <c:if test="${list.assetType eq 'Property'}">
                                                                                <input type="hidden" class="form-control" id="pk" name="pk" value="${list.SNo}" >
                                                                                <input type="text" class="form-control"  readonly required="" name="dipreciatedAmount" value="${list.depreciationAmount}" id="dipreciatedAmount" >
                                                                            </c:if>
                                                                            <c:if test="${list.assetType eq 'Accessories'}">
                                                                                <input type="hidden" class="form-control" id="pk" name="pk" value="${list.SNo}" >
                                                                                <input type="text" class="form-control"  readonly required="" name="dipreciatedAmount" value="" id="dipreciatedAmount" >
                                                                            </c:if>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:if test="${list.assetType eq 'Property'}">
                                                                                <input type="text" class="form-control" readonly="" value="${list.depreciationAmount}">
                                                                            </c:if>
                                                                            <c:if test="${list.assetType eq 'Accessories'}">
                                                                                <input type="text" class="form-control" readonly="" value="">
                                                                            </c:if>
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise> 
                                                                <input type="hidden" class="form-control" id="pk" name="pk" value="${list.SNo}" >
                                                                <input type="text" class="form-control" readonly="" required="" placeholder="Autocalculated" name="dipreciatedAmount" id="dipreciatedAmount" autocomplete="off" onkeypress="return ">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                    </div>
                                                </c:if>  
                                                <br/>
                                                <br/> 
                                                <br/>
                                                <c:if test="${fieldStatus_11 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">                                        
                                                        <c:if test="${mand_status_11 eq 'required'}"> 
                                                            <a  class="control-label-required" style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${fieldname_11}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(depreciationRecord) > 0}">
                                                                <c:forEach items="${depreciationRecord}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <c:if test="${list.assetType eq 'Property'}">
                                                                                <input type="text" class="form-control"  readonly required="" name="cumulativeAmount" value="${list.cumulativeAmount}" id="cumulativeAmount" >
                                                                                <input type="hidden" class="form-control" id="cumulativeAmount1" name="cumulativeAmount1" value="${list.cumulativeAmount}" >
                                                                            </c:if>
                                                                            <c:if test="${list.assetType eq 'Accessories'}">
                                                                                <input type="text" class="form-control"  readonly required="" name="cumulativeAmount" value="" id="cumulativeAmount" >
                                                                                <input type="hidden" class="form-control" id="cumulativeAmount1" name="cumulativeAmount1" value="0" >
                                                                            </c:if>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:if test="${list.assetType eq 'Property'}">
                                                                                <input type="text" class="form-control" readonly="" value="${list.cumulativeAmount}">
                                                                            </c:if>
                                                                            <c:if test="${list.assetType eq 'Accessories'}">
                                                                                <input type="text" class="form-control" readonly="" value="">
                                                                            </c:if>
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise> 
                                                                <input type="text" class="form-control" readonly="" required="" placeholder="Autocalculated" name="cumulativeAmount" id="cumulativeAmount" autocomplete="off" >
                                                                <input type="hidden" class="form-control" id="cumulativeAmount1" name="cumulativeAmount1" value="0" >
                                                            </c:otherwise>        
                                                        </c:choose>
                                                    </div>
                                                </c:if>  
                                                <c:if test="${fieldStatus_10 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">                                        
                                                        <c:if test="${mand_status_10 eq 'required'}"> 
                                                            <a  class="control-label-required" style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${fieldname_10}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(depreciationRecord) > 0}">
                                                                <c:forEach items="${depreciationRecord}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <c:if test="${list.assetType eq 'Property'}">
                                                                                <input type="text" class="form-control"  readonly required="" name="NBVAmount" value="${list.NBV}" id="NBVAmount" >
                                                                            </c:if>
                                                                            <c:if test="${list.assetType eq 'Accessories'}">
                                                                                <input type="text" class="form-control"  readonly required="" name="NBVAmount" value="" id="NBVAmount" >
                                                                            </c:if>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:if test="${list.assetType eq 'Property'}">
                                                                                <input type="text" class="form-control" readonly="" value="${list.NBV}">
                                                                            </c:if>
                                                                            <c:if test="${list.assetType eq 'Accessories'}">
                                                                                <input type="text" class="form-control" readonly="" value="">
                                                                            </c:if>
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise> 
                                                                <input type="text" class="form-control" readonly="" required="" placeholder="Autocalculated" name="NBVAmount" id="NBVAmount" autocomplete="off" >
                                                            </c:otherwise>        
                                                        </c:choose>
                                                    </div>
                                                </c:if>  

                                                <c:if test="${fieldStatus_3 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">                                        
                                                        <c:if test="${mand_status_3 eq 'required'}"> 
                                                            <a  class="control-label-required" style="color:red;">*</a>
                                                        </c:if>
                                                        <label class="control-label">${fieldname_3}</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(depreciationRecord) > 0}">
                                                                <c:forEach items="${depreciationRecord}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <c:if test="${list.assetType eq 'Property'}">
                                                                                <input type="text" class="form-control"  readonly required="" name="timePeriod" value="${list.period}" id="timePeriod" >
                                                                                <input type="hidden" class="form-control" id="noOfDays" name="noOfDays" value="${list.noOfDays}">
                                                                                <input type="hidden" class="form-control" id="noOfDaysDup" name="noOfDaysDup" value="${list.noOfDays}">

                                                                            </c:if>
                                                                            <c:if test="${list.assetType eq 'Accessories'}">
                                                                                <input type="text" class="form-control"  readonly required="" name="timePeriod" value="" id="timePeriod" >
                                                                                <input type="hidden" class="form-control" id="noOfDays" name="noOfDays" value="">
                                                                                <input type="hidden" class="form-control" id="noOfDaysDup" name="noOfDaysDup" value="0">
                                                                            </c:if>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:if test="${list.assetType eq 'Property'}">
                                                                                <input type="text" class="form-control" readonly="" value="${list.period}">
                                                                            </c:if>
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise> 
                                                                <input type="text" class="form-control" readonly="" required="" placeholder="Autocalculated" name="timePeriod" id="timePeriod" autocomplete="off" >
                                                                <input type="hidden" class="form-control" id="noOfDays" name="noOfDays" value="">
                                                                <input type="hidden" class="form-control" id="noOfDaysDup" name="noOfDaysDup" value="0">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                    </div>
                                                </c:if> 
                                                <br/>
                                                <br/> 
                                                <br/>
                                                <c:if test="${fieldStatus_601 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline" id="accessoriesNameDiv">
                                                        <c:if test="${mand_status_601 eq 'required'}">
                                                            <a  class="control-label" style="color:red;">*</a>
                                                        </c:if> 
                                                        <label class="control-label" for="selectError">${fieldname_601}</label>

                                                        <c:choose>
                                                            <c:when test="${fn:length(depreciationRecord) > 0}">

                                                                <c:forEach items="${depreciationRecord}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <c:if test="${list.assetType eq 'Property'}">
                                                                                <input type="text" class="form-control" placeholder="Select Accessories Name" ${mand_status_601} readonly="" name="accessoriesName" value="${list.accessoriesName}" id="accessoriesName" onclick="return SelectAccessoriesName();">                                                                                    
                                                                                <input type="hidden" class="form-control" id="accessoryCode" name="accessoryCode" value="${list.accessoriesCode}" >
                                                                            </c:if>
                                                                            <c:if test="${list.assetType eq 'Accessories'}">
                                                                                <input type="text" class="form-control" placeholder="Select Accessories Name" ${mand_status_601} readonly="" name="accessoriesName" value="" id="accessoriesName" onclick="return SelectAccessoriesName();" onblur="selectAccessoryCumulativeValue();">                                                                                    
                                                                                <input type="hidden" class="form-control" id="accessoryCode" name="accessoryCode" value="" >
                                                                            </c:if>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:if test="${list.assetType eq 'Property'}">
                                                                                <input type="text" class="form-control" readonly="" name="accessoriesName" value="${list.accessoriesName}">
                                                                            </c:if>
                                                                            <c:if test="${list.assetType eq 'Accessories'}">
                                                                                <input type="text" class="form-control" readonly="" name="accessoriesName" value="">
                                                                            </c:if>
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise> 
                                                                <input type="hidden" class="form-control" id="accessoryCode" name="accessoryCode" value="" >
                                                                <input type="text" class="form-control" readonly="" placeholder="Select Accessories Name" name="accessoriesName" ${mand_status_601} id="accessoriesName" required="" autocomplete="off" onclick="return SelectAccessoriesName();" onblur="selectAccessoryCumulativeValue();">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                    </div>
                                                </c:if>  


                                                <c:if test="${fieldStatus_618 eq 'y'}">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline" id="poNameDiv">
                                                        <c:if test="${mand_status_618 eq 'required'}">
                                                            <a  class="control-label" style="color:red;">*</a>
                                                        </c:if><a style="color:transparent;">*</a>
                                                        <label class="control-label" for="selectError">${fieldname_618}</label>

                                                        <c:choose>
                                                            <c:when test="${fn:length(depreciationRecord) > 0}">
                                                                <c:forEach items="${depreciationRecord}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">

                                                                            <input type="text" class="form-control" placeholder="Select PO" ${mand_status_618} readonly="" name="poName" value="" id="poName" onclick="return SelectPO();" onblur="SelectPrice();">                                                                                    
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" name="poName" value="" >
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise> 
                                                                <input type="text" class="form-control" readonly="" placeholder="Select PO" name="poName" ${mand_status_601} id="poName" required="" autocomplete="off"  onclick="return SelectPO();" onblur="SelectPrice();">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                    </div>
                                                </c:if> 
                                            </c:otherwise>        
                                        </c:choose>

                                        <c:if test="${fieldStatus_8 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline" id="subAssetNameDiv">
                                                <c:if test="${mand_status_8 eq 'required'}">
                                                    <a  class="control-label" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label" >${fieldname_8}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(depreciationRecord) > 0}">
                                                        <c:forEach items="${depreciationRecord}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" name="subAssetName" id="subAssetName" value="${list.subAssetName}">
                                                                    <input type="hidden" class="form-control" id="subAssetCode" name="subAssetCode" value="${list.subAssetCode}" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="subAssetName" value="${list.subAssetName}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" class="form-control" readonly="" placeholder="Select Flat Name" name="subAssetName" ${mand_status_8} id="subAssetName" required="" autocomplete="off"  onclick="SelectSubAssetName();">
                                                        <input type="hidden" class="form-control" id="assetCode" name="assetCode" value="${list.assetCode}" >
                                                        <input type="hidden" class="form-control" id="subAssetCode" name="subAssetCode" value="${list.subAssetCode}" >
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>

                                        </c:if> 

                                        <%-- Start Hide Div's --%>



                                        <%-- End Hide Div's --%>

                                        <p>&nbsp;</p>


                                        <%-- Keep Buttons here --%> 
                                        <div id="myGrid">  
                                            <c:if test="${action ne 'view'}">
                                                <div style="margin-top: 10px;">
                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                        <div class="col-md-9 col-sm-9 col-xs-12">
                                                            <a  id="addMembers" class="btn btn-dark" tabindex="" onclick="addToGrid();"><i class="glyphicon glyphicon-plus"></i> Add </a>

                                                        </div>
                                                    </div>
                                                </div>                                        
                                            </c:if>

                                            <div>    
                                                <c:if test="${action ne 'view' && action ne 'edit'}">


                                                    <div class="clearfix"></div>
                                                    <br/>
                                                    <div style="overflow: scroll;height: auto;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">
                                                        <table id="membertable" class="table table-striped responsive-utilities jambo_table">
                                                            <thead>
                                                                <tr>
                                                                    <th style=" ">Action</th>                                                           
                                                                    <th style=" "><span style="color: red">*</span>Accessories Name</th>
                                                                    <th style=" "><span style="color: red"></span>Purchase Voucher No </th>
                                                                    <th style=" "><span style="color: red"></span>Purchase Date</th>
                                                                    <th style=" "><span style="color: red">*</span>Purchase Value</th>
                                                                    <th style=" "><span style="color: red">*</span>Depreciation Start Date</th>
                                                                    <th style=" "><span style="color: red">*</span>Depreciation End Date</th>
                                                                    <th style=" "><span style="color: red">*</span>Depreciation(%) </th>
                                                                    <th style=" "><span style="color: red">*</span>Depreciation Amount</th>
                                                                    <th style=" "><span style="color: red">*</span>Cumulative Amount</th>
                                                                    <th style=" "><span style="color: red">*</span>NBV</th>
                                                                    <th style=" "><span style="color: red">*</span>Period</th>

                                                                </tr>

                                                            </thead>
                                                            <tbody id="resourcetable">

                                                            </tbody>

                                                        </table>
                                                    </div>
                                                </c:if>
                                                <c:if test="${action eq 'view'}">


                                                    <div class="clearfix"></div>
                                                    <br/>
                                                    <div style="overflow: scroll;height: auto;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">
                                                        <table id="membertable" class="table table-striped responsive-utilities jambo_table">
                                                            <thead>
                                                                <tr>
                                                                    <th style=" "><span style="color: red">*</span>Accessories Name</th>
                                                                    <th style=" "><span style="color: red"></span>Purchase Voucher No </th>
                                                                    <th style=" "><span style="color: red"></span>Purchase Date</th>
                                                                    <th style=" "><span style="color: red">*</span>Purchase Value</th>
                                                                    <th style=" "><span style="color: red">*</span>Depreciation Start Date</th>
                                                                    <th style=" "><span style="color: red">*</span>Depreciation End Date</th>
                                                                    <th style=" "><span style="color: red">*</span>Depreciation(%) </th>
                                                                    <th style=" "><span style="color: red">*</span>Depreciation Amount</th>
                                                                    <th style=" "><span style="color: red">*</span>Cumulative Amount</th>
                                                                    <th style=" "><span style="color: red">*</span>NBV</th>
                                                                    <th style=" "><span style="color: red">*</span>Period</th>

                                                                </tr>

                                                            </thead>
                                                            <tbody id="resourcetable">
                                                                <c:forEach items="${depreciationlist}" var="type">
                                                                    <tr class="item-row"> 
                                                                        <td><input type="hidden" name="sno1" id="sno1" value="${type.SNo}"/>
                                                                            <input type="hidden" name="assetCode1" id="assetCode1" value="${type.assetCode}"/>
                                                                            <input type="hidden" name="assetName1" id="assetName1" value="${type.assetName}"/>
                                                                            <input type="hidden" name="assetType1" id="assetType1" value="${type.assetType}"/>
                                                                            <input type="hidden" name="subAssetName1" id="subAssetName1" value="${type.subAssetName}"/>
                                                                            <input type="hidden" name="subAssetCode1" id="subAssetCode1" value="${type.subAssetCode}"/>
                                                                            <input type="hidden" name="accessoriesCode1" id="accessoriesCode1" value="${type.accessoriesCode}"/>
                                                                            <input type="hidden" name="depreCode1" id="depreCode1" value="${type.depreCode}"/>
                                                                            <input type="hidden" name="noOfDays1" id="noOfDays1${type.SNo}" value="${type.noOfDays}"/>
                                                                            <input type="hidden" name="noOfDaysDup1" id="noOfDaysDup1${type.SNo}" value="${type.noOfDays}"/>
                                                                            <input type="hidden" name="created_user_dateTime1" id="created_user_dateTime1" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.createdDate}"/>"/>
                                                                            <input type="hidden" name="dipreciationFirstDate1" id="dipreciationFirstDate1" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.dipreciationFirstDate}"/>"/>
                                                                            <input type="hidden" name="dupcumulativeAmount"  id="dupcumulativeAmount${type.SNo}" value="${type.cumulativeAmount}"/>
                                                                            <input type="hidden" name="poName1"  id="poName1" value="${type.poNo}"/>
                                                                            <input class="form-control" style="text-align: left;width:100%;" name="accessoriesName1" id="accessoriesName1" readonly autocomplete="off" type="text" maxlength="30" value="${type.accessoriesName}"></td>
                                                                        <td><input class="form-control" style="text-align: left;width:100%;" name="purchaseVoucherNo1" id="purchaseVoucherNo1" readonly autocomplete="off" type="text" maxlength="30" value="${type.purchaseVoucherNo}"></td>
                                                                        <td><input class="form-control" style="text-align: left;width:100%;" name="purchaseDate1" id="purchaseDate1" readonly autocomplete="off" type="text" maxlength="30" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.purchaseDate}"/>"></td>
                                                                        <td><input class="form-control" style="text-align: left;width:100%;" name="valueOfAsset1" id="valueOfAsset1${type.SNo}" readonly autocomplete="off" type="text" maxlength="30" value="${type.assetValue}"></td>
                                                                        <td><input class="form-control" style="text-align: left;width:100%;" name="periodStart1" id="periodStart1${type.SNo}" readonly  autocomplete="off" type="text" maxlength="30" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.depreciationStartDate}"/>"></td>
                                                                        <td><input class="form-control" style="text-align: left;width:100%;" name="periodEnd1" id="periodEnd1${type.SNo}" readonly  autocomplete="off" type="text" maxlength="30" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.depreciationEndDate}"/>"></td>
                                                                        <td><input class="form-control" style="text-align: left;width:100%;" name="depreciationPercent1" id="depreciationPercent1${type.SNo}" readonly autocomplete="off" type="text" maxlength="30" value="${type.depreciationPercent}"></td>
                                                                        <td><input class="form-control" style="text-align: left;width:100%;" name="dipreciatedAmount1" id="dipreciatedAmount1${type.SNo}" readonly autocomplete="off" type="text" maxlength="30" value="${type.depreciationAmount}"></td>
                                                                        <td><input class="form-control" style="text-align: left;width:100%;" name="cumulativeAmountG" id="cumulativeAmount1${type.SNo}" readonly autocomplete="off" type="text" maxlength="30" value="${type.cumulativeAmount}"></td>
                                                                        <td><input class="form-control" style="text-align: left;width:100%;" name="NBVAmount1" id="NBVAmount1${type.SNo}" readonly autocomplete="off" type="text" maxlength="30" value="${type.NBV}"></td>
                                                                        <td><input class="form-control" style="text-align: left;width:100%;" name="timePeriod1" id="timePeriod1${type.SNo}" readonly autocomplete="off" type="text" maxlength="30" value="${type.period}"></td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </c:if>
                                                <c:if test="${action eq 'edit'}">


                                                    <div class="clearfix"></div>
                                                    <br/>
                                                    <div style="overflow: scroll;height: auto;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">
                                                        <table id="membertable" class="table table-striped responsive-utilities jambo_table">
                                                            <thead>
                                                                <tr>
                                                                    <th style=" ">Action</th>                                                           
                                                                    <th style=" "><span style="color: red">*</span>Accessories Name</th>
                                                                    <th style=" "><span style="color: red"></span>Purchase Voucher No </th>
                                                                    <th style=" "><span style="color: red"></span>Purchase Date</th>
                                                                    <th style=" "><span style="color: red">*</span>Purchase Value</th>
                                                                    <th style=" "><span style="color: red">*</span>Depreciation Start Date</th>
                                                                    <th style=" "><span style="color: red">*</span>Depreciation End Date</th>
                                                                    <th style=" "><span style="color: red">*</span>Depreciation(%) </th>
                                                                    <th style=" "><span style="color: red">*</span>Depreciation Amount</th>
                                                                    <th style=" "><span style="color: red">*</span>Cumulative Amount</th>
                                                                    <th style=" "><span style="color: red">*</span>NBV</th>
                                                                    <th style=" "><span style="color: red">*</span>Period</th>

                                                                </tr>

                                                            </thead>
                                                            <tbody id="resourcetable">
                                                                <c:forEach items="${depreciationlist}" var="type">
                                                                    <tr class="item-row"> 
                                                                        <td align="center" onclick=""><button type="button" ><i class="fa fa-trash fa-lg-o"></i></button></td>    
                                                                        <td><input type="hidden" name="sno1" id="sno1" value="${type.SNo}"/>
                                                                            <input type="hidden" name="assetCode1" id="assetCode1" value="${type.assetCode}"/>
                                                                            <input type="hidden" name="assetName1" id="assetName1" value="${type.assetName}"/>
                                                                            <input type="hidden" name="assetType1" id="assetType1" value="${type.assetType}"/>
                                                                            <input type="hidden" name="subAssetName1" id="subAssetName1" value="${type.subAssetName}"/>
                                                                            <input type="hidden" name="subAssetCode1" id="subAssetCode1" value="${type.subAssetCode}"/>
                                                                            <input type="hidden" name="accessoriesCode1" id="accessoriesCode1" value="${type.accessoriesCode}"/>
                                                                            <input type="hidden" name="depreCode1" id="depreCode1" value="${type.depreCode}"/>
                                                                            <input type="hidden" name="noOfDays1" id="noOfDays1${type.SNo}" value="${type.noOfDays}"/>
                                                                            <input type="hidden" name="noOfDaysDup1" id="noOfDaysDup1${type.SNo}" value="${type.noOfDays}"/>
                                                                            <input type="hidden" name="created_user_dateTime1" id="created_user_dateTime1" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.createdDate}"/>"/>
                                                                            <input type="hidden" name="dipreciationFirstDate1" id="dipreciationFirstDate1" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.dipreciationFirstDate}"/>"/>
                                                                            <input type="hidden" name="dupcumulativeAmount"  id="dupcumulativeAmount${type.SNo}" value="${type.cumulativeAmount}"/>
                                                                            <input type="hidden" name="poName1"  id="poName1" value="${type.poNo}"/>
                                                                            <input class="form-control" style="text-align: left;width:100%;" name="accessoriesName1" id="accessoriesName1" readonly autocomplete="off" type="text" maxlength="30" value="${type.accessoriesName}"></td>
                                                                        <td><input class="form-control" style="text-align: left;width:100%;" name="purchaseVoucherNo1" id="purchaseVoucherNo1" readonly autocomplete="off" type="text" maxlength="30" value="${type.purchaseVoucherNo}"></td>
                                                                        <td><input class="form-control" style="text-align: left;width:100%;" name="purchaseDate1" id="purchaseDate1" readonly autocomplete="off" type="text" maxlength="30" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.purchaseDate}"/>"></td>
                                                                        <td><input class="form-control" style="text-align: left;width:100%;" name="valueOfAsset1" id="valueOfAsset1${type.SNo}" readonly autocomplete="off" type="text" maxlength="30" value="${type.assetValue}"></td>
                                                                        <td><input class="form-control" style="text-align: left;width:100%;" name="periodStart1" id="periodStart1${type.SNo}" readonly  autocomplete="off" type="text" maxlength="30" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.depreciationStartDate}"/>"></td>
                                                                        <td><input class="form-control" style="text-align: left;width:100%;" name="periodEnd1" id="periodEnd1${type.SNo}" readonly  autocomplete="off" type="text" maxlength="30" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.depreciationEndDate}"/>"></td>
                                                                        <td><input class="form-control" style="text-align: left;width:100%;" name="depreciationPercent1" id="depreciationPercent1${type.SNo}" readonly autocomplete="off" type="text" maxlength="30" value="${type.depreciationPercent}"></td>
                                                                        <td><input class="form-control" style="text-align: left;width:100%;" name="dipreciatedAmount1" id="dipreciatedAmount1${type.SNo}" readonly autocomplete="off" type="text" maxlength="30" value="${type.depreciationAmount}"></td>
                                                                        <td><input class="form-control" style="text-align: left;width:100%;" name="cumulativeAmountG" id="cumulativeAmount1${type.SNo}" readonly autocomplete="off" type="text" maxlength="30" value="${type.cumulativeAmount}"></td>
                                                                        <td><input class="form-control" style="text-align: left;width:100%;" name="NBVAmount1" id="NBVAmount1${type.SNo}" readonly autocomplete="off" type="text" maxlength="30" value="${type.NBV}"></td>
                                                                        <td><input class="form-control" style="text-align: left;width:100%;" name="timePeriod1" id="timePeriod1${type.SNo}" readonly autocomplete="off" type="text" maxlength="30" value="${type.period}"></td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>

                                        <p>&nbsp;</p>  


                                        <c:if test="${action ne 'view' && action ne 'edit'}">

                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                <button type="button" id="save1" class="btn btn-primary" onclick="callGrid();">Save</button>  
                                                <a href="../assetsm/depreciationList.htm"  class="btn btn-danger"  style="">Cancel</a>
                                            </div>

                                        </c:if>
                                        <c:if test="${action eq 'edit'}">
                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                <button type="submit"  class="btn btn-primary" >Save</button>  
                                                <a href="../assetsm/depreciationList.htm"  class="btn btn-danger"  style="">Cancel</a>
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
            var count = 0;
            function addToGrid() {
                var valid1 = true;
                var y =
                        (document.getElementById('assetName').value) &&
                        (document.getElementById('periodStart').value) &&
                        (document.getElementById('periodEnd').value) &&
                        (document.getElementById('dipreciatedAmount').value) &&
                        (document.getElementById('valueOfAsset').value) &&
                        (document.getElementById('cumulativeAmount').value) &&
                        (document.getElementById('assetType').value) &&
                        (document.getElementById('depreciationPercent').value) &&
                        (document.getElementById('NBVAmount').value) &&
                        (document.getElementById('accessoriesName').value) &&
                        (document.getElementById('subAssetName').value);
                if (y == "" || y == null) {
                    alert('Please fill out the mandatory fields');
                    valid1 = false;
                }

                if (valid1 === true) {
                    var assetType = document.getElementById('assetType').value;
                    var assetName = document.getElementById('assetName').value;
                    var valueOfAsset = document.getElementById('valueOfAsset').value;
                    var periodStart = document.getElementById('periodStart').value;
                    var periodEnd = document.getElementById('periodEnd').value;
                    var depreciationPercent = document.getElementById('depreciationPercent').value;
                    var accessoriesName = document.getElementById('accessoriesName').value;
                    var subAssetName = document.getElementById('subAssetName').value;
                    var cumulativeAmount = document.getElementById('cumulativeAmount').value;
                    var dipreciatedAmount = document.getElementById('dipreciatedAmount').value;
                    var NBVAmount = document.getElementById('NBVAmount').value;
                    var purchaseVoucherNo = document.getElementById('purchaseVoucherNo').value;
                    var timePeriod = document.getElementById('timePeriod').value;
                    var purchaseDate = document.getElementById('purchaseDate').value;
                    var assetCode = document.getElementById('assetCode').value;
                    var accessoryCode = document.getElementById('accessoryCode').value;
                    var subAssetCode = document.getElementById('subAssetCode').value;
                    var poName = document.getElementById('poName').value;
                    var noOfDays = document.getElementById('noOfDays').value;
                    var dipreciationFirstDate = document.getElementById('dipreciationFirstDate').value;
                    var val1 = accessoriesName;

                    $('#resourcetable tr').each(function () {
                        $(this).find('td').each(function () {
                            var a = $(this).find('#accessoriesName1').val();
                            if (a === val1) {
                                alert('Record already added to grid');
                                document.getElementById('td').value = "";
                                return false;
                            } else {
                                return true;
                            }
                        });
                    });
                    if (val1 != "")
                    {
                        var table = document.getElementById("resourcetable");
                        var slNo1 = table.rows.length;
                        var slNo = count;
                        var tr = table.insertRow(slNo1);
                        tr.id = 'list_tr_' + slNo;
                        tr.innerHTML = '<td align="center" class="tinput"><button type="button" class="fa fa-trash fa-lg-o" onclick="removeRow(' + slNo + ')" style=""></button><input type="hidden" name="sno1" id="sno1" value=""/></td>' +
                                '<td class="tinput"><input style="width: 100%; text-align:left;" class="form-control" type="hidden" readonly name="assetType1" id="assetType1" value="' + assetType + '" style="border: none"><input  type="hidden" readonly name="dipreciationFirstDate1" id="dipreciationFirstDate1" value="' + dipreciationFirstDate + '">' +
                                '<input type="hidden" class="form-control" style="text-align: left;width:100%;"  readonly required name="assetName1" id="assetName1" value="' + assetName + '"  >' +
                                '<input type="hidden" class="form-control" style="text-align: left;width:100%;"  readonly required name="subAssetName1" id="subAssetName1" value="' + subAssetName + '"  ><input type="hidden" name="created_user_dateTime1" id="created_user_dateTime1" value=""/>' +
                                '<input type="text" class="form-control" style="text-align: left;width:100%;" readonly required name="accessoriesName1" id="accessoriesName1" value="' + accessoriesName + '"  ><input name="assetCode1" id="assetCode1" type="hidden" value="' + assetCode + '"></td>' +
                                '<td class="tinput"><input type="text" class="form-control" style="text-align: left;width:100%;" readonly required name="purchaseVoucherNo1" id="purchaseVoucherNo1" value="' + purchaseVoucherNo + '"  ><input name="noOfDays1" id="noOfDays1" type="hidden" value="' + noOfDays + '"></td>' +
                                '<td class="tinput"><input type="text" class="form-control" style="text-align: left;width:100%;" readonly required name="purchaseDate1" id="purchaseDate1" value="' + purchaseDate + '"  ></td>' +
                                '<td class="tinput"><input type="text" class="form-control" style="text-align: left;width:100%;" readonly required name="valueOfAsset1" id="valueOfAsset1" value="' + valueOfAsset + '"  ><input name="accessoriesCode1" id="accessoryCode1" type="hidden" value="' + accessoryCode + '"></td>' +
                                '<td class="tinput"><input type="text" class="form-control" style="text-align: left;width:100%;" readonly required name="periodStart1" id="periodStart1" value="' + periodStart + '"  ><input name="subAssetCode1" id="subAssetCode1" type="hidden" value="' + subAssetCode + '"></td>' +
                                '<td class="tinput"><input type="text" class="form-control" style="text-align: left;width:100%;" readonly required name="periodEnd1" id="periodEnd1" value="' + periodEnd + '"  ><input name="poName1" id="poName1" type="hidden" value="' + poName + '"></td>' +
                                '<td class="tinput"><input type="text" class="form-control" style="text-align: left;width:100%;" readonly required name="depreciationPercent1" id="depreciationPercent1" value="' + depreciationPercent + '"  ></td>' +
                                '<td class="tinput"><input type="text" class="form-control" style="text-align: left;width:100%;" readonly required name="dipreciatedAmount1" id="dipreciatedAmount1" value="' + dipreciatedAmount + '"  ></td>' +
                                '<td class="tinput"><input type="text" class="form-control" style="text-align: left;width:100%;" readonly required name="cumulativeAmountG" id="cumulativeAmountG" value="' + cumulativeAmount + '"  ></td>' +
                                '<td class="tinput"><input type="text" class="form-control" style="text-align: left;width:100%;" readonly required name="NBVAmount1" id="NBVAmount1" value="' + NBVAmount + '"  ></td>' +
                                '<td class="tinput"><input type="text" class="form-control" style="text-align: left;width:100%;" readonly required name="timePeriod1" id="timePeriod1" value="' + timePeriod + '"  ></td>';
                        document.getElementById('valueOfAsset').value = '';
                        document.getElementById('periodStart').value = '';
                        document.getElementById('periodEnd').value = '';
                        document.getElementById('depreciationPercent').value = '';
                        document.getElementById('accessoriesName').value = '';
                        document.getElementById('cumulativeAmount').value = '';
                        document.getElementById('dipreciatedAmount').value = '';
                        document.getElementById('NBVAmount').value = '';
                        document.getElementById('purchaseVoucherNo').value = '';
                        document.getElementById('timePeriod').value = '';
                        document.getElementById('purchaseDate').value = '';
                        document.getElementById('accessoryCode').value = '';
                        document.getElementById('poName').value = '';
                    }

                    count++;
                    if (count > 0)
                    {
                        document.getElementById("save1").disabled = false;
                    }
                    document.getElementById('assetType').disabled = true;
                    document.getElementById('assetName').disabled = true;
                    document.getElementById('depreciationPercent').disabled = true;
                    document.getElementById('subAssetName').disabled = true;
                    document.getElementById('cumulativeAmount').disabled = true;
                    document.getElementById('dipreciatedAmount').disabled = true;
                    document.getElementById('NBVAmount').disabled = true;
                }
            }

            function removeRow(id) {
                count--;
                if (count == 0)
                {
                    document.getElementById("save1").disabled = true;
                    document.getElementById('assetType').disabled = false;
                    document.getElementById('assetName').disabled = false;
                    document.getElementById('valueOfAsset').disabled = false;
                    document.getElementById('periodStart').disabled = false;
                    document.getElementById('periodEnd').disabled = false;
                    document.getElementById('depreciationPercent').disabled = false;
                    document.getElementById('accessoriesName').disabled = false;
                    document.getElementById('subAssetName').disabled = false;
                    document.getElementById('cumulativeAmount').disabled = false;
                    document.getElementById('dipreciatedAmount').disabled = false;
                    document.getElementById('NBVAmount').disabled = false;

                }
                else {
                    document.getElementById("save1").disabled = false;
                }
                var table = document.getElementById("resourcetable");
                for (var i = 0; i < table.rows.length; i++) {
                    var lr = table.rows[i];
                    if (lr.id == 'list_tr_' + id) {
                        table.deleteRow(i);
                        return;
                    }
                }
            }

            function callGrid() {
                var assetType = document.getElementById('assetType').value;
                if (assetType == "Accessories") {
                    document.getElementById('assetType').disabled = false;
                    document.getElementById('assetName').disabled = false;
                    document.getElementById('depreciationPercent').disabled = false;
                    document.getElementById('subAssetName').disabled = false;
                    document.getElementById('cumulativeAmount').disabled = false;
                    document.getElementById('dipreciatedAmount').disabled = false;
                    document.getElementById('NBVAmount').disabled = false;
                    if (count == 0) {
                        document.getElementById("save1").disabled = true;
                        alert("Please add Records in the Grid !!!!!");
                    } else {
                        test11();
                    }
                } else {
                    formValidateDepreciation();
                }
            }
            NProgress.done();
        </script>

    </body>


</html>
