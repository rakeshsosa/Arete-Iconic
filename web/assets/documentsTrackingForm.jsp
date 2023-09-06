<%-- 
    Document   : assetDetailsForm
    Created on : Sep 15, 2016, 10:42:18 AM
    Author     : Kondal Reddy N
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
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css" integrity="sha256-FAOaXTpl90/K8cXmSdsskbQN3nKYulhCpPbcFzGTWKI=" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css" integrity="sha512-gxWow8Mo6q6pLa1XH/CcH8JyiSDEtiwJV78E+D+QP0EVasFs8wKXq16G8CLD4CJ2SnonHr4Lm/yY2fSI2+cbmw==" crossorigin="anonymous" />
        
        <link href="../common/validate/validationEngine.css" rel="stylesheet" type="text/css"/>
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.min.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.js" type="text/javascript"></script>
        <script src="../common/datepicker/datetimepicker_css.js" type="text/javascript"></script>
             <title>Arete Iconic</title>
                     <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">        <script type="text/javascript">
            $(document).ready(function () {
                $("#noOfFloors").on("keypress keyup", function () {
                    if ($(this).val() == '0') {
                        $(this).val('');
                    }
                });
                $("input").on("keypress", function (e) {

                    if (e.which === 32 && !this.value.length)
                        e.preventDefault();
                });


                var code = {};
                $("select[name='assetType'] > option").each(function () {
                    if (code[this.text]) {
                        $(this).remove();
                    } else {
                        code[this.text] = this.value;
                    }
                });

              //  var basement = document.getElementById("basement1").value;
               // var parking = document.getElementById("parking1").value;
               // var mezzanineFloor = document.getElementById("mezzanineFloor1").value;
              // var swimmingPool = document.getElementById("swimmingPool1").value;
              //  var pentHouse = document.getElementById("pentHouse1").value;


//                if (basement == 'Y') {
//                    document.getElementById("basement").checked = true;
//                } else {
//                    document.getElementById("basement").checked = false;
//                }
//                if (parking == 'Y') {
//                    document.getElementById("parking").checked = true;
//                } else {
//                    document.getElementById("parking").checked = false;
//                }
//                if (mezzanineFloor == 'Y') {
//                    document.getElementById("mezzanineFloor").checked = true;
//                } else {
//                    document.getElementById("mezzanineFloor").checked = false;
//                }
//                if (swimmingPool == 'Y') {
//                    document.getElementById("swimmingPool").checked = true;
//                } else {
//                    document.getElementById("swimmingPool").checked = false;
//                }
//                if (pentHouse == 'Y') {
//                    document.getElementById("pentHouse").checked = true;
//                } else {
//                    document.getElementById("pentHouse").checked = false;
//                }

            });

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

            function calcRoi() {
                var totalAssetValue = document.getElementById('totalAssetValue').value;
                var minimumRentGen = document.getElementById('minimumRentGen').value;
                var perct = parseFloat((minimumRentGen / totalAssetValue) * 100);
                if (document.getElementById("totalAssetValue").value == null || document.getElementById("totalAssetValue").value == "")
                {
                    document.getElementById("roi").value = "";
                } else {
                    if (document.getElementById("minimumRentGen").value == null || document.getElementById("minimumRentGen").value == "")
                    {
                        document.getElementById("roi").value = "";
                    }
                    else {
                        if (parseInt(totalAssetValue) < parseInt(minimumRentGen)) {
                            alert("Total Property Value should be greaterthan Minimum Rent Generation");
                            document.getElementById("roi").value = "";
//                            document.getElementById('minimumRentGen').value = "";
                            return false;
                        } else {
                            document.getElementById("roi").value = Math.round(perct);
                        }
                    }
                }
            }

            function calpercentage() {
                var totalAssetValue = document.getElementById('totalAssetValue').value;
                var percentage = document.getElementById('percentage').value;
                var perct = parseFloat((totalAssetValue / 100) * percentage);

                document.getElementById("amcamount").value = Math.round(perct);

            }

            function minRentGen() {
                var assetCode = document.getElementById("assetCode").value;

                $.ajax
                        ({
                            type: "POST",
                            url: '../assets/minimumRentGen.htm',
                            data: {
                                assetCode: assetCode,
                            },
                            success: function (data) {
                                if (data === 'a') {
                                    document.getElementById("minimumRentGen").value = '0';
                                } else {
                                    var dat = data.split("[");
                                    var dat1 = dat[1].split("]");
                                    document.getElementById("minimumRentGen").value = parseFloat(dat1[0]);
                                }
                                calcRoi();
                            }

                        });

            }

            function selectAssetOwnerDetails()
            {
                myWindow = window.open("../assets/selectAssetOwnerDetails.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function selectAssetCategoryDetails()
            {
                myWindow = window.open("../assets/selectAssetCategoryDetails.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function selectAssetClassDetails()
            {
                myWindow = window.open("../assets/selectAssetClassDetails.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
             function selectStoreName()
            {
                myWindow = window.open("../assets/selectStoreName.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function validateFloors() {
                var noOfFloors = document.getElementById("noOfFloors").value;
                if (parseInt(noOfFloors) > 15) {
                    alert("Maximum 15 Floors are allowed for One Property.!");
                    document.getElementById("noOfFloors").value = "";
                    return false;
                }
            }
            function checkMand() {
                var x = document.getElementById("assetCategory").value &&
                        document.getElementById("assetOwnerType").value &&
                        document.getElementById("assetClass").value;
                if (x == '') {
                    alert("Please enter Mandatory Fields");
                    return false;

                } else {
                    return true;
                }

            }

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
            function validation()
            {
                if (document.getElementById("nextRevDate").value == null || document.getElementById("nextRevDate").value == "")
                {
                    alert("Please Select revaluation date");
                    $("#nextRevDate").focus();
                    return false;
                }
            }

            function test()
            {
                var aname = document.getElementById("assetName").value;
                var aname1 = document.getElementById("assetName1").value;
                var abul = document.getElementById("assetBuilding").value;
                var abul1 = document.getElementById("assetBuilding1").value;
                var aarea = document.getElementById("assetArea").value;
                var aarea1 = document.getElementById("assetArea1").value;
                var bno = document.getElementById("blockNo").value;
                var bno1 = document.getElementById("blockNo1").value;
                var apno = document.getElementById("assetPlotNo").value;
                var apno1 = document.getElementById("assetPlotNo1").value;
                var way = document.getElementById("way").value;
                var way1 = document.getElementById("way1").value;
                var sno = document.getElementById("streetNo").value;
                var sno1 = document.getElementById("streetNo1").value;
                var pcode = document.getElementById("pinCode").value;
                var pcode1 = document.getElementById("pinCode1").value;
                var pbox = document.getElementById("poBox").value;
                var pbox1 = document.getElementById("poBox1").value;
                var aotype = document.getElementById("assetOwnerType").value;
                var aotype1 = document.getElementById("assetOwnerType1").value;
                var atype = document.getElementById("assetType").value;
                var atype1 = document.getElementById("assetType1").value;
                var carea = document.getElementById("classificationArea").value;
                var carea1 = document.getElementById("classificationArea1").value;
                //                var acate = document.getElementById("assetCategory").value;
                //                var acate1 = document.getElementById("assetCategory1").value;
                //                var acla = document.getElementById("assetClass").value;
                //                var acla1 = document.getElementById("assetClass1").value;
                var barea = document.getElementById("buildedArea").value;
                var barea1 = document.getElementById("buildedArea1").value;
                var noflr = document.getElementById("noOfFloors").value;
                var noflr1 = document.getElementById("noOfFloors1").value;
                var tassetv = document.getElementById("totalAssetValue").value;
                var tassetv1 = document.getElementById("totalAssetValue1").value;
                //                var minrent = document.getElementById("minimumRentGen").value;
                //                var minrent1 = document.getElementById("minimumRentGen1").value;
                //                var roi = document.getElementById("roi").value;
                //                var roi1 = document.getElementById("roi1").value;
                var pcent = document.getElementById("percentage").value;
                var pcent1 = document.getElementById("percentage1").value;
                var amt = document.getElementById("amcamount").value;
                var amt1 = document.getElementById("amcamount1").value;
                var cname = document.getElementById("ccname").value;
                var cname1 = document.getElementById("ccname1").value;
                var bdate = document.getElementById("bcDate").value;
                var bdate1 = document.getElementById("bcDate1").value;
                var snam = document.getElementById("sname").value;
                var snam1 = document.getElementById("sname1").value;
                var scon = document.getElementById("scontact").value;
                var scon1 = document.getElementById("scontact1").value;
                var smail = document.getElementById("semail").value;
                var smail1 = document.getElementById("semail1").value;
                var saddr = document.getElementById("saddress").value;
                var saddr1 = document.getElementById("saddress1").value;

                if (document.getElementById("assetName").value == "")
                {
                    alert("Enter Property Name");
                    return false;
                } else if (document.getElementById("assetBuilding").value == "")
                {
                    alert("Enter  Property Building No");
                    return false;
                } else if (document.getElementById("assetArea").value == "")
                {
                    alert("Enter Area (SQM)");
                    return false;
                } else if (document.getElementById("assetPlotNo").value == "")
                {
                    alert("Enter Property Plot No");
                    return false;
                } else if (document.getElementById("way").value == "")
                {
                    alert("Enter Way");
                    return false;
                } else if (document.getElementById("pinCode").value == "")
                {
                    alert("Enter Postal Code");
                    return false;
                } else if (document.getElementById("poBox").value == "")
                {
                    alert("Enter P.O.Box");
                    return false;
                } else if (document.getElementById("assetOwnerType").value == "")
                {
                    alert("Enter Property Owner Name");
                    return false;
                } else if (document.getElementById("assetType").value == "")
                {
                    alert("Enter Property Type");
                    return false;
                } else if (document.getElementById("classificationArea").value == "")
                {
                    alert("Enter Land Use");
                    return false;
                } else if (document.getElementById("noOfFloors").value == "")
                {
                    alert("Enter No Of Floors");
                    return false;
                } else if (document.getElementById("totalAssetValue").value == "")
                {
                    alert("Enter Total Property Value (OMR)");
                    return false;
                }
                else {

                    if (aname !== aname1 || abul !== abul1 || aarea !== aarea1 || bno !== bno1 || apno !== apno1
                            || way !== way1 || sno !== sno1 || pcode !== pcode1 || pbox !== pbox1 || aotype !== aotype1
                            || atype !== atype1 || carea !== carea1 || barea !== barea1
                            || noflr !== noflr1 || tassetv !== tassetv1 || pcent !== pcent1 || amt !== amt1
                            || cname !== cname1 || bdate !== bdate1 || snam !== snam1 || scon !== scon1 || smail !== smail1
                            || saddr !== saddr1) {
                        if (confirm('Do you really want to Save this updated record')) {
                            document.forms["userform"].submit();
                            return true;
                        } else {
                            return true;
                        }

                    } else {
                        document.forms["userform"].submit();
                    }
                }

            }
            function NewCssCal11(pCtrl, pFormat, pScroller, pShowTime, pTimeMode, pShowSeconds, pEnableDateMode)
            {
                // get current date and time

                dtToday = new Date();
                Cal = new Calendar(dtToday);
                if (pShowTime !== undefined)
                {
                    if (pShowTime) {
                        Cal.ShowTime = true;
                    }
                    else {
                        Cal.ShowTime = false;
                    }

                    if (pTimeMode)
                    {
                        pTimeMode = parseInt(pTimeMode, 10);
                    }
                    if (pTimeMode === 12 || pTimeMode === 24) {
                        TimeMode = pTimeMode;
                    }
                    else
                    {
                        TimeMode = 24;
                    }

                    if (pShowSeconds !== undefined)
                    {
                        if (pShowSeconds)
                        {
                            Cal.ShowSeconds = true;
                        }
                        else
                        {
                            Cal.ShowSeconds = false;
                        }
                    }
                    else
                    {
                        Cal.ShowSeconds = false;
                    }

                }

                if (pCtrl !== undefined)
                {
                    Cal.Ctrl = pCtrl;
                }

                if (pFormat !== undefined && pFormat !== "")
                {
                    Cal.Format = pFormat.toUpperCase();
                }
                else
                {
                    Cal.Format = "MMDDYYYY";
                }

                if (pScroller !== undefined && pScroller !== "")
                {
                    if (pScroller.toUpperCase() === "ARROW")
                    {
                        Cal.Scroller = "ARROW";
                    }
                    else
                    {
                        Cal.Scroller = "DROPDOWN";
                    }
                }

                if (pEnableDateMode !== undefined && (pEnableDateMode === "future" || pEnableDateMode === "past")) {
                    Cal.EnableDateMode = pEnableDateMode;
                }

                exDateTime = document.getElementById(pCtrl).value; //Existing Date Time value in textbox.
                if (exDateTime)
                { //Parse existing Date String
                    var Sp1 = exDateTime.indexOf(DateSeparator, 0), //Index of Date Separator 1
                            Sp2 = exDateTime.indexOf(DateSeparator, parseInt(Sp1, 10) + 1), //Index of Date Separator 2
                            tSp1, //Index of Time Separator 1
                            tSp2, //Index of Time Separator 2
                            strMonth,
                            strDate,
                            strYear,
                            intMonth,
                            YearPattern,
                            strHour,
                            strMinute,
                            strSecond,
                            winHeight,
                            offset = parseInt(Cal.Format.toUpperCase().lastIndexOf("M"), 10) - parseInt(Cal.Format.toUpperCase().indexOf("M"), 10) - 1,
                            strAMPM = "";
                    //parse month

                    if (Cal.Format.toUpperCase() === "DDMMYYYY" || Cal.Format.toUpperCase() === "DDMMMYYYY") {
                        if (DateSeparator === "") {
                            strMonth = exDateTime.substring(2, 4 + offset);
                            strDate = exDateTime.substring(0, 2);
                            strYear = exDateTime.substring(4 + offset, 8 + offset);
                        }
                        else
                        {
                            if (exDateTime.indexOf("D*") !== -1)
                            {   //DTG
                                strMonth = exDateTime.substring(8, 11);
                                strDate = exDateTime.substring(0, 2);
                                strYear = "20" + exDateTime.substring(11, 13);  //Hack, nur für Jahreszahlen ab 2000
                            }
                            else
                            {
                                strMonth = exDateTime.substring(Sp1 + 1, Sp2);
                                strDate = exDateTime.substring(0, Sp1);
                                strYear = exDateTime.substring(Sp2 + 1, Sp2 + 5);
                            }
                        }
                    }

                    else if (Cal.Format.toUpperCase() === "MMDDYYYY" || Cal.Format.toUpperCase() === "MMMDDYYYY") {
                        if (DateSeparator === "") {
                            strMonth = exDateTime.substring(0, 2 + offset);
                            strDate = exDateTime.substring(2 + offset, 4 + offset);
                            strYear = exDateTime.substring(4 + offset, 8 + offset);
                        }
                        else {
                            strMonth = exDateTime.substring(0, Sp1);
                            strDate = exDateTime.substring(Sp1 + 1, Sp2);
                            strYear = exDateTime.substring(Sp2 + 1, Sp2 + 5);
                        }
                    }
                    else if (Cal.Format.toUpperCase() === "YYYYMMDD" || Cal.Format.toUpperCase() === "YYYYMMMDD")
                    {
                        if (DateSeparator === "") {
                            strMonth = exDateTime.substring(4, 6 + offset);
                            strDate = exDateTime.substring(6 + offset, 8 + offset);
                            strYear = exDateTime.substring(0, 4);
                        }
                        else {
                            strMonth = exDateTime.substring(Sp1 + 1, Sp2);
                            strDate = exDateTime.substring(Sp2 + 1, Sp2 + 3);
                            strYear = exDateTime.substring(0, Sp1);
                        }
                    }
                    else if (Cal.Format.toUpperCase() === "YYMMDD" || Cal.Format.toUpperCase() === "YYMMMDD")
                    {
                        if (DateSeparator === "")
                        {
                            strMonth = exDateTime.substring(2, 4 + offset);
                            strDate = exDateTime.substring(4 + offset, 6 + offset);
                            strYear = exDateTime.substring(0, 2);
                        }
                        else
                        {
                            strMonth = exDateTime.substring(Sp1 + 1, Sp2);
                            strDate = exDateTime.substring(Sp2 + 1, Sp2 + 3);
                            strYear = exDateTime.substring(0, Sp1);
                        }
                    }

                    if (isNaN(strMonth)) {
                        intMonth = Cal.GetMonthIndex(strMonth);
                    }
                    else {
                        intMonth = parseInt(strMonth, 10) - 1;
                    }
                    if ((parseInt(intMonth, 10) >= 0) && (parseInt(intMonth, 10) < 12)) {
                        Cal.Month = intMonth;
                    }
                    //end parse month

                    //parse year
                    YearPattern = /^\d{4}$/;
                    if (YearPattern.test(strYear)) {
                        if ((parseInt(strYear, 10) >= StartYear) && (parseInt(strYear, 10) <= (dtToday.getFullYear() + EndYear)))
                            Cal.Year = parseInt(strYear, 10);
                    }
                    //end parse year 
                    //parse Date
                    if ((parseInt(strDate, 10) <= Cal.GetMonDays()) && (parseInt(strDate, 10) >= 1)) {
                        Cal.Date = strDate;
                    }
                    //end parse Date

                    //parse time

                    if (Cal.ShowTime === true)
                    {
                        //parse AM or PM
                        if (TimeMode === 12)
                        {
                            strAMPM = exDateTime.substring(exDateTime.length - 2, exDateTime.length);
                            Cal.AMorPM = strAMPM;
                        }

                        tSp1 = exDateTime.indexOf(":", 0);
                        tSp2 = exDateTime.indexOf(":", (parseInt(tSp1, 10) + 1));
                        if (tSp1 > 0)
                        {
                            strHour = exDateTime.substring(tSp1, tSp1 - 2);
                            Cal.SetHour(strHour);

                            strMinute = exDateTime.substring(tSp1 + 1, tSp1 + 3);
                            Cal.SetMinute(strMinute);

                            strSecond = exDateTime.substring(tSp2 + 1, tSp2 + 3);
                            Cal.SetSecond(strSecond);

                        }
                        else if (exDateTime.indexOf("D*") !== -1)
                        {   //DTG
                            strHour = exDateTime.substring(2, 4);
                            Cal.SetHour(strHour);
                            strMinute = exDateTime.substring(4, 6);
                            Cal.SetMinute(strMinute);

                        }
                    }

                }
                selDate = new Date(Cal.Year, Cal.Month, Cal.Date);//version 1.7

                RenderCssCal(true);

                window.setTimeout(checkContDates, 8000);

            }
            function myFunction() {
                var checkBox = document.getElementById("myCheck");
                var text = document.getElementById("text");
                if (checkBox.checked == true) {
                    text.style.display = "block";
                } else {
                    text.style.display = "none";
                }
            }
            function callcategory() {
                var x = '<select style="width:210px;" class="form-control validate[required] req" id="utility" name="utility"><option value="">Select Utility Name</option><c:forEach items="${utilityDetails}" var="utility"><option value="${utility}">${utility}</option></c:forEach></select>';
                return x;
            }
            function callcategory2() {
                var x = '<select style="width:210px;" class="form-control validate[required] req" id="utility" name="utilityBillType"><option value="">Select Utility Bill Type</option><option value="Monthly">Monthly</option><option value="Quarterly">Quarterly</option><option value="Yearly">Yearly</option></select>';
                return x;
            }
            function callcategory1() {
                var x = '<select style="width:210px;" class="form-control validate[required] req" id="comUtility" name="comUtility"><option value="">Select Utility Name</option><c:forEach items="${comUtilityDetails}" var="comUtility"><option value="${comUtility}">${comUtility}</option></c:forEach></select>';
                return x;
            }
            function callcategory3() {
                var x = '<select style="width:210px;" class="form-control validate[required] req" id="comUtilityBillType" name="comUtilityBillType"><option value="">Select Utility Bill Type</option><option value="Monthly">Monthly</option><option value="Quarterly">Quarterly</option><option value="Yearly">Yearly</option></select>';
                return x;
            }
            function validateEmail() {
                var mailId = document.getElementById("semail").value;
                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                if (mailId.match(mailformat)) {
//                    return true;
                } else {
                    alert("You have entered an invalid email address!");
                    document.getElementById('semail').value = "";
                }
//            $.ajax
//                    ({
//                        type: "POST",
//                        url: '../assets/fetchllEmail1.htm',
//                        data: {
//                            mailId: mailId
//                        },
//                        success: function (data) {
//                            if ($.trim(data) == 'Already Exists.Enter another') {
//                                alert("Supplier email already exist");
//                                document.getElementById("mailId").value = "";
//                                return false;
//                            }
//                        }
//                    });
            }

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

//            var next = 1;
//            $(document).on("click", ".add-more", function (e) {
//                e.preventDefault();
//                var addto = "#adiv" + next;
//                next = next + 1;
//                var newIn = '<div  id="adiv' + (next) + '" class="col-md-6 mt-2 col-sm-12 "><div class="d-flex"><button type="button" style="display: inline!important;" id="remove' + (next) + '" class="btn btn-danger remove-me">-</button><input style="display: inline!important;margin-left: 5px;margin-right: 3px;" class="form-control capitalize  validate[required]" id="attachname' + next + '" name="documentname" type="text" placeholder="Attachment Name" required=""><input style="display: none;"  id="field' + next + '" class="filecls form-control" name="attachments" type="file" onchange="readURL1(this);setAttachName(\'' + next + '\');" ><input type="button" id="btnb' + next + '" class="btn btn-primary" value="Browse..." onclick="browseFile(\'' + next + '\');" /><p id="field' + next + 'Error" style="color: red; font: bold; display: none; text-align: right;">Upload your valid attachment</p></div></div>';
//                var newInput = $(newIn);
//                $(addto).after(newInput);
////                $("#field" + next).attr('data-source', $(addto).attr('data-source'));
//                $("#count").val(next);
//
//            });
//
//            $(document).on("click", '.remove-me', function (e) {
//                var rmvId = '' + this.id;
//                var fieldNum = rmvId.substring(6);
//                var fieldID = "#field" + (fieldNum);
//                var nameFieldID = "#attachname" + (fieldNum);
//                var btnb = "#btnb" + (fieldNum);
//                var errpgh = "#field" + (fieldNum) + "Error";
//                var adiv = "#adiv" + (fieldNum);
//                $(this).remove();
//                $(fieldID).remove();
//                $(nameFieldID).remove();
//                $(btnb).remove();
//                $(errpgh).remove();
//                $(adiv).remove();
//                next = next - 1;
//            });

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
//            function getLifespanbldg()
//            {
//                debugger;
//                var years = document.getElementById("lifeSpanOfBld").value;
//                alert(years);
//                var d = new Date();
//                var year = d.getFullYear();
//                alert(year);
//                var month = d.getMonth();
//                alert(month);
//                var day = d.getDate();
//                alert(day);
//                var c = new Date(year + years, month, day)
//                alert(c);
//// => Tue Oct 11 2016 00:00:00 GMT-0700 (PDT)
//
////                var christmas2000 = new Date(2000, 12, 25);
////                christmas2000.setFullYear(christmas2000.getFullYear() + years); // using year: next 5 years
////                christmas2000.setFullYear(christmas2000.getMonth() + 24); // using months: next 24 months
////                christmas2000.setFullYear(christmas2000.getDay() + 365); // using days: next 365 months
//
//                document.getElementById("nextRevDate").value = c;
//            }

            function getLifespanbldg() {
                //var tt = document.getElementById('txtDate').value;

                var years = document.getElementById("lifeSpanOfBld").value;
                //alert(years);
                var date = new Date();
                var newdate = new Date(date);
                //alert(newdate);
                var i;
                var newYears = 0;
                var newmon = newdate.getMonth();
                //alert("month" + newmon);
                var newy = newdate.getFullYear();
                for (i = 0; i < years; i++) {

                    var newy = newy + 1;
                    //alert("newy==" + newy);
                    //alert(newy % 4);
                    if (newy % 4 == 0)
                    {
                        //alert("i-years"+(years-i));
                        if (newmon <= 2 && (years-i)==1)
                        {
                            newYears = newYears + 365;
                            //alert("365 in 366==" + newYears);
                        }
                        else
                        {
                            newYears = newYears + 366;
                            //alert("366==" + newYears);
                        }
                    }
                    else
                    {
                        newYears = newYears + 365;
                        //alert("365==" + newYears);
                    }
                }

                var month_names = ["Jan", "Feb", "Mar",
                    "Apr", "May", "Jun",
                    "Jul", "Aug", "Sep",
                    "Oct", "Nov", "Dec"];

                //alert(newYears);
                //alert(newdate.getDate());

                newdate.setDate(newdate.getDate() + newYears);
                //newdate.setDate(newdate.getFullYear() + years);
                //alert("new date for 365"+newdate.getDate() + newYears);
                var dd = newdate.getDate();
                //alert(dd);
                var mm = newdate.getMonth() + 1;
               // alert(mm);
                var y = newdate.getFullYear();
                //alert(y);
                var someFormattedDate = dd + '-' + month_names[mm - 1] + '-' + y;
                //var c = new Date(year + years, month, day)


                //alert(someFormattedDate);
                document.getElementById('nextRevDate').value = someFormattedDate;

            }
            
            
             function selectAccAssetDetails()
                            {
                                
                                myWindow = window.open("../assets/selectAccAssetDetails.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                            }
                            
                             function selectSubAssetDetails()
                            {
                                var assetCode = document.getElementById("assetCode").value;
                
                                myWindow = window.open("../assets/selectSubAssetDetails.htm?assetCode=" + assetCode + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                            }
                           


            </script>


        </head>
        <body class="nav-md">
        <% java.util.Date d = new java.util.Date();%>
       
                <jsp:include page="../login/menu.htm"/>
               
                 <jsp:include page="../login/footer.jsp"/>
               
                                   <main id="main" class="main">
                                       <div class="mt-3">
           <jsp:include page="../login/headerlink.htm?submodule=Property Document&tab=Property Document&pagetype=form" />
       </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
                <div class="card-title"><h5>Property Documents</h5></div>
                                    <form class="row" id="userform" action="../assets/documentTrackingFormSubmit.htm"  method="post" enctype="multipart/form-data" onsubmit="return testRows();">

                                        <c:choose>
                                            <c:when test="${fn:length(documentAttach) > 0}">
                                                <c:forEach items="${documentAttach}" var="list">
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
                                                                                debugger;                                                                                 //alert('hi');
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
                                                            
                                                            <div class="col-md-4 form-floating mb-3">
                                                
                                                    
                                               
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(documentAttach) > 0}">
                                                        <c:forEach items="${documentAttach}" var="list">
                                                            <%--<c:set value="${list.assetCode}" var="assetCode"/>--%>
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text"  class="form-control" ${mand_status_1}  id="assetCode" name="assetCode" maxlength="40" readonly="" value="${list.assetCode}" onkeypress="return isNumberKey3(event)">
                                                                    
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" placeholder="Fill" class="form-control"  id="assetCode" name="assetCode" maxlength="40" value="${list.assetCode}" readonly=""  onclick="return selectAccAssetDetails();">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Fill" class="form-control"  id="assetCode" name="assetCode" maxlength="40" value="${assetCode}"   onclick="return selectAccAssetDetails();">
                                                    </c:otherwise>        
                                                </c:choose>
                                                  <label class="control-label">Property Code <a  style="color:red;"></a></label>      
                                            </div>
                                                            
                                                             
                                        


                                                <div class="col-md-4 form-floating mb-3">
                                                
                                                    
                                               
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(documentAttach) > 0}">
                                                        <c:forEach items="${documentAttach}" var="list">
                                                            <%--<c:set value="${list.assetCode}" var="assetCode"/>--%>
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" readonly class="form-control" ${mand_status_1}  id="assetName" name="assetName" maxlength="40" value="${list.assetName}" onkeypress="return isNumberKey3(event)">
                                                                    <input type="hidden" class="form-control" ${mand_status_1}  id="assetName1" name="assetName1" maxlength="40" value="${list.assetName}" >
                                                                    <input type="hidden" name="pk" value="${list.SNo}">
                                                                    <input type="hidden" name="status" value="${list.status}">
                                                                    <input type="hidden" id="assetCode" name="assetCode" value="${list.assetCode}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" id="assetName" readonly="" value="${list.assetName}">
                                                                    <input type="hidden" id="assetCode" name="assetCode" value="${list.assetCode}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Fill" class="form-control" ${mand_status_1} id="assetName" name="assetName" maxlength="40" value="" onkeypress="return isNumberKey3(event)" >
                                                    </c:otherwise>        
                                                </c:choose>
                                                  <label class="control-label">Property Name <a  style="color:red;">*</a></label>      
                                            </div>
                                        
<!--                                        <div class="col-md-4 form-floating mb-3">
                                                
                                                    
                                               
                                                
                                             <%--   <c:choose>
                                                    <c:when test="${fn:length(documentAttach) > 0}">
                                                        <c:forEach items="${documentAttach}" var="list">
                                                            <%--<c:set value="${list.assetCode}" var="assetCode"/>--%>
                                                            <%--<c:choose>
                                                                <c:when test="${action eq 'edit'}">--%>
                                                                    <input type="text" class="form-control"   id="subAssetName" name="subAssetName" maxlength="40" value="${list.subAssetName}" onkeypress="return isNumberKey3(event)">
                                                                    
                                                                <%--</c:when>--%>
                                                                <%--<c:otherwise>--%>
                                                                    <input type="text" class="form-control" id="subAssetName" readonly="" value="${list.subAssetName}">
                                                                   
                                                                <%--</c:otherwise>--%> 
                                                            <%--</c:choose>--%>
                                                        <%--</c:forEach>--%>
                                                    <%--</c:when>--%>
                                                    <%--<c:otherwise>--%>                                                    
                                                        <input type="text" placeholder="Fill" class="form-control" ${mand_status_1} id="subAssetName" name="subAssetName" maxlength="40" value=""   onclick="return selectSubAssetDetails();">
                                                        <input type="hidden" placeholder="Select Flat Code" class="form-control"  id="subAssetCode" readonly="" name="subAssetCode"  maxlength="40" value="" >
                                                    <%--</c:otherwise>--%>        
                                                <%--</c:choose>--%>
                                                  <label class="control-label">Flat Name/Flat No. <a  style="color:red;">*</a></label>      
                                            </div>-->
                                                            
                                            <div class="col-md-4 form-floating mb-3">
                                                
                                                    
                                               
                                                
                                                <%-- <c:choose>
                                                    <c:when test="${fn:length(documentAttach) > 0}">
                                                        <c:forEach items="${documentAttach}" var="list">
                                                            <%--<c:set value="${list.assetCode}" var="assetCode"/>
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control"   id="reminderNote" name="reminderNote" maxlength="40" value="${list.reminderNote}" onkeypress="return isNumberKey3(event)">
                                                                    
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" id="reminderNote"  value="${list.reminderNote}">
                                                                   
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Fill" class="form-control" id="reminderNote"  maxlength="40" value=""  >
                                                        
                                                    </c:otherwise>        
</c:choose> --%>
                                                  <input type="text" placeholder="Fill" class="form-control" id="reminderNote"  maxlength="40" value=""  >      
                                                  <label class="control-label">Reminder Note <a  style="color:red;">*</a></label>      
                                            </div>

                                            <div class="col-md-4 form-floating mb-3 pick2">
                                                
                                                    
                                               
                                                
                                                <%--   <c:choose>
                                                    <c:when test="${fn:length(documentAttach) > 0}">
                                                        <c:forEach items="${documentAttach}" var="list">
                                                            <%--<c:set value="${list.assetCode}" var="assetCode"/>
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" placeholder="Org Name" id="reminderDate" value="${type.reminderDate}" class="form-control datepicker2"  name="reminderDate" maxlength="98" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" placeholder="Org Name" id="reminderDate" value="${type.reminderDate}" readonly class="form-control datepicker2"  name="reminderDate" maxlength="98" >
                                                                   
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                       <input type="text" placeholder="Org Name" id="reminderDate" class="form-control datepicker2" maxlength="98" >
                                                    </c:otherwise>        
                                                </c:choose>--%>
                                                   <input type="text" placeholder="Org Name" id="reminderDate" class="form-control datepicker2" maxlength="98" >     
                                                  <label for="reminderDate"><span style="color:red">*</span> Reminder Date</label>
                                            </div>

                                            
                                           
<!--                                                    <div class="col-md-4 form-floating mb-3">
                                                        <input type="text" placeholder="Org Name" id="cusname" class="form-control"  name="groupName" maxlength="98" required onkeypress="firstToUpperCase1(event);">
                                                        <label for="groupname">Name</label>
                                                    </div>
                                                    <div class="col-md-4 form-floating mt-3">
                                                        <input type="tel" name="mobno" placeholder="" id="mobno" class="form-control" maxlength="15"></textarea>
                                                        <div>Contact Number</div>
                                                    </div>
                                            <div class="col-md-4 form-floating mb-3">
                                                        <input type="text" placeholder="Org Name" id="custype" class="form-control"  name="groupName" maxlength="98" required onkeypress="firstToUpperCase1(event);">
                                                        <label for="groupname">Customer Type</label>
                                                    </div>
                                               <div class="col-md-4 form-floating mb-3">
                                                        <input type="email" placeholder="Email" id="emailId" class="form-control"  name="emailId" maxlength="98" required     onblur="validateEmail(this);">
                                                        <label for="emailId">Email ID</label>
                                                    </div>-->
                                                       <div class="col-md-4 form-floating mb-3">
                                                        <input type="text" placeholder="Org Name" id="docname" class="form-control"  name="groupName" maxlength="98"  value="${list.assetName}" onkeypress="firstToUpperCase1(event);">
                                                        <label for="groupname"><span style="color:red">*</span> Document Name</label>
                                                    </div>
                                               <div class="col-md-4 form-floating mb-3">
                                                   <input type="text" class="form-control" name="clientType" placeholder="Category" id="doccategory" maxlength="98">
<!--                                                                    <select class="form-select" name="clientType" placeholder="Category" id="doccategory" maxlength="98" >
                                                                        <option value="" selected="selected" disabled>Select An Option</option>
                                                                        <option value="IT & Services">IT & Services</option>
                                                                        <option value="Manufacturing">Manufacturing</option>
                                                                        <option value="E-Commerce">E-Commerce</option>
                                                                    </select>-->
                                                        <label for="clientType"><span style="color:red">*</span> Document Category</label>
                                                    </div>
                                                 <div class="col-md-4 form-floating mb-3">
<!--                                                                    <select class="form-select" name="clientType" placeholder="Category" id="doctype" maxlength="98" >
                                                                        <option value="" selected="selected" disabled>Select An Option</option>
                                                                        <option value="IT & Services">IT & Services</option>
                                                                        <option value="Manufacturing">Manufacturing</option>
                                                                        <option value="E-Commerce">E-Commerce</option>
                                                                    </select>-->
<input type="text" class="form-control" name="clientType" placeholder="Category" id="doctype" maxlength="98" >
<!-- <select class="form-control" name=''>
                                                            <c:forEach items="${documentType}" var="doc">
                                                                <option>${doc}</option>
                                                            </c:forEach>
                                                        </select>-->
                                                        <label for="clientType"><span style="color:red">*</span> Document Type</label>
                                                       
                                                    </div>
                                                    <div class="col-md-4 form-floating mb-3 pick1">
                                                        <input type="text" placeholder="Org Name" id="docexpiry" class="form-control datepicker1"  name="groupName" maxlength="98"  onkeypress="firstToUpperCase1(event);">
                                                        <label for="groupname"><span style="color:red">*</span> Document Expiry</label>
                                                    </div>
                                                        <c:if test="${action ne 'view'}">
                                             <div class="col-lg-12 mt-3 mb-2">
                                                       <button type="button" class="btn btn-primary" style="" onclick="addOrderRow_test(event);"><i class="fa fa-plus-circle"></i> ADD</button>

                                                   </div>
                                                       </c:if>
                                                    <div class="clearfix"></div>
                                                    <c:if test="${action eq null}">
                                                        <div class="table-responsive">
                                                    <table style="width: 130%" class="table table-bordered" id="membertable">
                                                    <thead>
                                                        <tr>
                                                           
                                                            <th class="theader" style="">S.no</th>
                                                            <th>Property Name</th>
                                                            <th>Reminder Note</th>
                                                            <th class="theader" style="">Reminder Date</th>
                                                            <th class="theader" style="">Document Name</th>
                                                            <th class="theader" style="">Document Category</th>
                                                            <th class="theader" style="">Document Type</th>
                                                               <th class="theader" style="">Document Expiry</th>
                                                                <th class="theader" style="">Upload File</th>
                                                              <th class="theader" style="">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="resourcetable">
                                                        
                                                    </tbody>               
                                                  <script>
                                                            var count = 0;
                                                            function addOrderRow_test(e) {
                                                                
                                                                var valid1 = true;
                                                              var docname = document.getElementById('docname').value ;
                                                              var doctype = document.getElementById('doctype').value ;
                                                             var docexpiry = document.getElementById('docexpiry').value;
                                                                var assetName = document.getElementById('assetName').value;reminderNote
                                                                  var reminderNote = document.getElementById('reminderNote').value;
                                                                  var reminderDate = document.getElementById('reminderDate').value;
                                                                  var doccategory = document.getElementById('doccategory').value;
                                                                    
                                                                    var assetCode = document.getElementById('assetCode').value;
                                                              var today = moment(new Date).format('DD-MM-YYYY');
                                                              var x = document.getElementById('docname').value &&
                                                                      document.getElementById('doctype').value &&
                                                                      document.getElementById('docexpiry').value;
                                                                if (x === "" || x === null) {
                                                                    swal("Please Fill the Required Fields");
                                                                    valid1 = false;
                                                                } 

//                                                                $('#resourcetable tr').each(function () {
//                                                                        var a = $(this).find('#expno').val();
//                                                                        if (a === expno) {
//                                                                            
//                                                                            e.preventDefault();
//                                                                            swal('Selected record already exists in grid.');
//                                                                            valid1 = false;
//                                                                            return false;                                                                        
//                                                                        } else {
//                                                                            return true;
//                                                                        }
//                                                                    });

                                                                if (valid1 === true) {
                                                                    var table = document.getElementById("resourcetable");
                                                                   var slNo = table.rows.length - 1;
                                                                  
                                                                    var slNo1 = table.rows.length;
                                                                
                                                                   var rowlen = slNo1 +1 ;
                                                                    var tr = table.insertRow(slNo + 1);
                                                                    tr.id = 'list_tr_' + slNo;

                                                    tr.innerHTML = '<td><input type="text" readonly class="form-control" name="userName" id="userid" value="' +rowlen  +
                                                    '" > </td>  <td><input type="hidden" readonly class="form-control" name="assetCode1" value="'+assetCode+'"><input type="text" readonly class="form-control" name="assetName1" id="userid" value="' + assetName +
                                                    '" > </td> <td><input type="text" readonly  class="form-control" name="reminderNote"  id=""  value="' + reminderNote +
                                                    '"> </td>  <td><input type="text" readonly  class="form-control" name="reminderDate"  id=""  value="' + reminderDate +
                                                    '"> </td>  <td><input type="text" readonly  class="form-control" name="docname"  id=""  value="' + docname +
                                                    '"> </td>  <td><input type="text" readonly  class="form-control" name="doccategory"  id=""  value="' + doccategory +
                                                    '"> </td>  <td><input type="text" readonly  class="form-control" name="documentType"  id=""  value="' + doctype +
                                                    '"> </td>  <td><input type="text" readonly  class="form-control" name="documentExpirtyDate"  id="ctDesc"  value="' + docexpiry +
                                                    '"> </td> <td><input type="file"  class="form-control" name="attachments" id="userid" > </td> <td align="center" class="tinput" style="vertical-align: middle;"><a href="javascript:" class="btn btn-light border" onclick="removeRow12('
                                                    + slNo + ')"><i class="fa fa-trash-o text-danger"></i> </a></td>';
//                                                    document.getElementById('expensename').value = '';
//                                                    document.getElementById('expenseamount').value = '';
                                    
                                                                    count++;
                                                                  document.getElementById('docname').value  = '';
                                                              document.getElementById('doctype').value  = '';
                                                             document.getElementById('docexpiry').value = '';
                                                              document.getElementById('assetName').value = '';
                                                             document.getElementById('reminderNote').value = '';
                                                             document.getElementById('reminderDate').value = '';
                                                             document.getElementById('doccategory').value = '';
                                                                    
                                                                document.getElementById('assetCode').value = '';
                                                                } else {
                                                                    return;
                                                                }
                                                            }

                                                            function removeRow12(id) {    
                                                                 
                                                                count--;
                                                                var table = document.getElementById("resourcetable");
                                                                for (var i = 0; i < table.rows.length; i++) {
                                                                    var lr = table.rows[i];
                                                                    if (lr.id == 'list_tr_' + id) {
                                                                        table.deleteRow(i);
                                                                        if (table.rows.length == 0) {
                                                                            $('#uomName').prop('readonly', false);
                                                                        }
                                                                        return;
                                                                    }
                                                                }
                                                           }
                                                             function checkGrid(e) {
                                                                var table = document.getElementById("resourcetable");
                                                                var slNo = table.rows.length - 1;
                                                                if (slNo < 0) {
                                                                    swal("Please add Data in grid");
                                                                    $("#todayProd1").focus();
                                                                    $("#storage1").focus();
                                                                      e.preventDefault();
                                                                    return false;
                                                                } else {
                                                                    return true;
                                                                }
                                                            }                                               
                                                        </script>
                                                    </table>                                                  
                                                </div> 
                                                    
                                           </c:if>
                                                    
                                                    <c:if test="${action eq 'edit'}">
                                                        <div class="table-responsive">
                                                    <table style="width: 130%" class="table table-bordered" id="membertable">
                                                    <thead>
                                                        <tr>
                                                           
                                                            <!--<th class="theader" style="">S.no</th>-->
                                                            <th>Property Name</th>
                                                            <th>Reminder Note</th>
                                                            <th class="theader" style="">Reminder Date</th>
                                                            <th class="theader" style="">Document Name</th>
                                                            <th class="theader" style="">Document Category</th>
                                                            <th class="theader" style="">Document Type</th>
                                                               <th class="theader" style="">Document Expiry</th>
                                                                <th class="theader" style="">Upload File</th>
                                                              <th class="theader" style="">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="resourcetable">
                                                        <c:forEach items="${documentAttach}" var="list">
                                                        <tr>
                                                                        <td class=" "style="text-align: left;">${list.assetName}</td>
                                                                        <td class=" "style="text-align: left;">${list.reminderNote}</td>
                                                                        <td class=" "style="text-align: left;"><fmt:formatDate pattern="dd-MM-yyyy" value="${list.reminderDate}"/></td>
                                                                        <td class=" "style="text-align: left;">${list.documentName}</td>
                                                                        <td class=" "style="text-align: left;">${list.documentCategory}</td>
                                                                        <td class=" "style="text-align: left;">${list.documentType}</td>
                                                                        <td class=" "style="text-align: left;"><fmt:formatDate pattern="dd-MM-yyyy" value="${list.documentExpirtyDate}"/></td>
                                                                        <td class=" "style="text-align: left;">${list.filename}</td>
                                                                      <td class=" "style="text-align: left;">  <a class="btn btn-outline-primary btn-sm ms-1 border-0 mt-1" data-toggle="tooltip" data-placement="top" title="Download" href="#" target="_blank"> <i class="fa fa-download fa-2x"></i></a></td>
                                                        </tr>
                                                        </c:forEach>
                                                    </tbody>               
                                                  <script>
                                                            var count = 0;
                                                            function addOrderRow_test(e) {
                                                                
                                                                var valid1 = true;
                                                              var docname = document.getElementById('docname').value ;
                                                              var doctype = document.getElementById('doctype').value ;
                                                             var docexpiry = document.getElementById('docexpiry').value;
                                                                var assetName = document.getElementById('assetName').value;reminderNote
                                                                  var reminderNote = document.getElementById('reminderNote').value;
                                                                  var reminderDate = document.getElementById('reminderDate').value;
                                                                  var doccategory = document.getElementById('doccategory').value;
                                                                    
                                                                    var assetCode = document.getElementById('assetCode').value;
                                                              var today = moment(new Date).format('DD-MM-YYYY');
                                                              var x = document.getElementById('docname').value &&
                                                                      document.getElementById('doctype').value &&
                                                                      document.getElementById('docexpiry').value;
                                                                if (x === "" || x === null) {
                                                                    swal("Please Fill the Required Fields");
                                                                    valid1 = false;
                                                                } 

//                                                                $('#resourcetable tr').each(function () {
//                                                                        var a = $(this).find('#expno').val();
//                                                                        if (a === expno) {
//                                                                            
//                                                                            e.preventDefault();
//                                                                            swal('Selected record already exists in grid.');
//                                                                            valid1 = false;
//                                                                            return false;                                                                        
//                                                                        } else {
//                                                                            return true;
//                                                                        }
//                                                                    });

                                                                if (valid1 === true) {
                                                                    var table = document.getElementById("resourcetable");
                                                                   var slNo = table.rows.length - 1;
                                                                  
                                                                    var slNo1 = table.rows.length;
                                                                
                                                                   var rowlen = slNo1 +1 ;
                                                                    var tr = table.insertRow(slNo + 1);
                                                                    tr.id = 'list_tr_' + slNo;

                                                    tr.innerHTML = '<td><input type="text" readonly class="form-control" name="userName" id="userid" value="' +rowlen  +
                                                    '" > </td>  <td><input type="hidden" readonly class="form-control" name="assetCode1" value="'+assetCode+'"><input type="text" readonly class="form-control" name="assetName1" id="userid" value="' + assetName +
                                                    '" > </td> <td><input type="text" readonly  class="form-control" name="reminderNote"  id=""  value="' + reminderNote +
                                                    '"> </td>  <td><input type="text" readonly  class="form-control" name="reminderDate"  id=""  value="' + reminderDate +
                                                    '"> </td>  <td><input type="text" readonly  class="form-control" name="docname"  id=""  value="' + docname +
                                                    '"> </td>  <td><input type="text" readonly  class="form-control" name="doccategory"  id=""  value="' + doccategory +
                                                    '"> </td>  <td><input type="text" readonly  class="form-control" name="documentType"  id=""  value="' + doctype +
                                                    '"> </td>  <td><input type="text" readonly  class="form-control" name="documentExpirtyDate"  id="ctDesc"  value="' + docexpiry +
                                                    '"> </td> <td><input type="file"  class="form-control" name="attachments" id="userid" > </td> <td align="center" class="tinput" style="vertical-align: middle;"><a href="javascript:" class="btn btn-light border" onclick="removeRow12('
                                                    + slNo + ')"><i class="fa fa-trash-o text-danger"></i> </a></td>';
//                                                    document.getElementById('expensename').value = '';
//                                                    document.getElementById('expenseamount').value = '';
                                    
                                                                    count++;
                                                                  document.getElementById('docname').value  = '';
                                                              document.getElementById('doctype').value  = '';
                                                             document.getElementById('docexpiry').value = '';
                                                              document.getElementById('assetName').value = '';
                                                             document.getElementById('reminderNote').value = '';
                                                             document.getElementById('reminderDate').value = '';
                                                             document.getElementById('doccategory').value = '';
                                                                    
                                                                document.getElementById('assetCode').value = '';
                                                                } else {
                                                                    return;
                                                                }
                                                            }

                                                            function removeRow12(id) {    
                                                                 
                                                                count--;
                                                                var table = document.getElementById("resourcetable");
                                                                for (var i = 0; i < table.rows.length; i++) {
                                                                    var lr = table.rows[i];
                                                                    if (lr.id == 'list_tr_' + id) {
                                                                        table.deleteRow(i);
                                                                        if (table.rows.length == 0) {
                                                                            $('#uomName').prop('readonly', false);
                                                                        }
                                                                        return;
                                                                    }
                                                                }
                                                           }
                                                             function checkGrid(e) {
                                                                var table = document.getElementById("resourcetable");
                                                                var slNo = table.rows.length - 1;
                                                                if (slNo < 0) {
                                                                    swal("Please add Data in grid");
                                                                    $("#todayProd1").focus();
                                                                    $("#storage1").focus();
                                                                      e.preventDefault();
                                                                    return false;
                                                                } else {
                                                                    return true;
                                                                }
                                                            }                                               
                                                        </script>
                                                    </table>                                                  
                                                </div> 
                                                    
                                           </c:if>
                                            
                                            <c:if test="${action eq 'view'}">
                                                  <div class="mt-3 col-lg-12" style="height: auto;width: 100%;border: 1px solid grey;overflow-x: scroll">

                                                    <table style="width: 130%" class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                    <thead>
                                                         <tr>
                                                           
                                                            <!--<th class="theader" style="">S.no</th>-->
                                                            <th>Property Name</th>
                                                            <th>Reminder Note</th>
                                                            <th class="theader" style="">Reminder Date</th>
                                                            <th class="theader" style="">Document Name</th>
                                                            <th class="theader" style="">Document Category</th>
                                                            <th class="theader" style="">Document Type</th>
                                                               <th class="theader" style="">Document Expiry</th>
                                                                <th class="theader" style="">Upload File</th>
                                                             <th class="theader" style="">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="resourcetable">
                                                        <c:forEach items="${documentAttach}" var="list">
                                                        <tr>
                                                                        <td class=" "style="text-align: left;">${list.assetName}</td>
                                                                        <td class=" "style="text-align: left;">${list.reminderNote}</td>
                                                                        <td class=" "style="text-align: left;"><fmt:formatDate pattern="dd-MM-yyyy" value="${list.reminderDate}"/></td>
                                                                        <td class=" "style="text-align: left;">${list.documentName}</td>
                                                                        <td class=" "style="text-align: left;">${list.documentCategory}</td>
                                                                        <td class=" "style="text-align: left;">${list.documentType}</td>
                                                                        <td class=" "style="text-align: left;"><fmt:formatDate pattern="dd-MM-yyyy" value="${list.documentExpirtyDate}"/></td>
                                                                        <td class=" "style="text-align: left;">${list.filename}</td>
                                                                      <td class=" "style="text-align: left;">  <a class="btn btn-outline-primary btn-sm ms-1 border-0 mt-1" data-toggle="tooltip" data-placement="top" title="Download" href="#" target="_blank"> <i class="fa fa-download fa-2x"></i></a></td>
                                                        </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                    </table>
                                                  </div>
                                            </c:if>
                                            
                                            
                                        <c:if test="${action ne 'view' && action ne 'edit'}">
                                            <div class="col-md-9 col-sm-9 mt-3 col-xs-12 col-md-offset-5">
                                                <button type="submit" class="btn btn-primary">Save</button>
                                                <a href="../assets/documentsTrackingList.htm" class="btn btn-danger">Cancel</a>
                                            </div>
                                        </c:if>

                                        <c:if test="${action eq 'edit'}">

                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                                <button type="submit" class="btn btn-primary" style="">Save</button>
                                                <a href="../assets/documentsTrackingList.htm" class="btn btn-danger">Cancel</a>
                                            </div>

                                        </c:if>
                                    </form>
                                </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->
        <script>
            //window.onload = minRentGen();
        </script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha256-bqVeqGdJ7h/lYPq6xrPv/YGzMEb6dNxlfiTUHSgRCp8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js" integrity="sha512-DNeDhsl+FWnx5B1EQzsayHMyP6Xl/Mg+vcnFPXGNjUZrW28hQaa1+A4qL9M+AiOMmkAhKAWYHh1a+t6qxthzUw==" crossorigin="anonymous"></script>
 
        <script>
            function testRows(event){
//                event.preventDefault();
                if($("table tbody tr").length < 1){
                    alert("Please add atleast one grid")
                    return false;
                } else {
                    return true;
                }
            }
               var next = 1;
            $(document).on("click", ".add-more", function (e) { 
                                                             
                e.preventDefault();
                var addto = "#adiv" + next;
                next = next + 1;
                var newIn = '<div id="adiv' + (next) + '" class="col-md-4 form-floating mb-3"> <div class="input-group mb-3"><div class="input-group-prepend"></div><input style="display: inline!important;" class="form-control capitalize  validate[required]" id="attachname' + next + '" name="assetOwnerType" type="text" placeholder="Property Owner Name" required=""><div class="input-group-append"><button type="button" style="display: inline!important;" id="remove' + (next) + '" class="btn ml-2 btn-danger remove-me">-</button></div></div></div>';
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
             $('.datepicker1').datepicker({
                    format: 'dd-mm-yyyy',
                    startDate: '0m +0m',
                    autoclose: true,
                    todayHighlight: true,
                   
                    container: '.pick1'
                }).datepicker('update', new Date());
                
                $('.datepicker2').datepicker({
                    format: 'dd-mm-yyyy',
                    startDate: '0m +0m',
                    autoclose: true,
                    todayHighlight: true,
                   
                    container: '.pick2'
                }).datepicker('update', new Date());
              $(function(){
          var phone_number = window.intlTelInput(document.querySelector("#mobno"), {
          initialCountry: "om",
          separateDialCode: true,
          autoHideDialCode: false,
          onlyCountries:["om", "in", "ae"],
          hiddenInput: "full",
          utilsScript: "//cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.3/js/utils.js"
        });
        $("#mobno").change(function(){
                            
                        var full_number = phone_number.getNumber(intlTelInputUtils.numberFormat.E164);
                          $("#mobno").val(full_number);
                          
                          console.log(full_number)
                            //console.log(phone_number.isValidNumber());
                            if(phone_number.isValidNumber() == false){
                                $("#mobno").val("");
                                swal("Please Enter Valid Mobile Number & Country Code!");
                                return false;
                            } 
                            
                            })
    });
            $(document).ready(function () {

                //individualinventorysum();

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
                                + '<td style="text-align: left;" align="center" onclick=""><button type="button" id="deleteEnquiry"><i class="fa fa-trash-o"></i></button></td>'
                                + '<td>' + addup + '</td>'
                                + '<td>' + addup1 + '</td>'
                                + '<td style="text-align: left;"><input class="form-control  right validate[required,custom[notzero]]" autocomplete="off" name="utilityBill" id="utilityBill" type="text" value="0" style="" onchange="individualinventorysum()" onkeypress="return isNumberKey(event)"></td>'
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
                                + '<td style="text-align: left;" align="center" onclick=""><button type="button" id="deleteEnquiry1"><i class="fa fa-trash-o"></i></button></td>'
                                + '<td>' + addup2 + '</td>'
                                + '<td>' + addup3 + '</td>'
                                + '<td style="text-align: left;"><input class="form-control  right validate[required,custom[notzero]]" autocomplete="off" name="comutilityBill" id="comutilityBill" type="text" value="0" style="" onchange="commoninventorysum()" onkeypress="return isNumberKey(event)"></td>'
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
                //debugger;
                //alert('sum');
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
//                debugger;
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

            $(document).on('click', '#deleteEnquiry', function () {
                //mioInvoice.deleteRow4(this);
                var rowCount2 = $('#enquirytable tr:visible').length;
                //alert(rowCount2);
                if (rowCount2 != 2) {
                    //alert('inside');
                    $(this).parents('.item-enquiry').remove();
                    $("tr.item-enquiry").each(function () {
                        var $itemRow = $(this).closest('tr');
                        var rowCount2 = ($(this).closest("tr")[0].rowIndex);
                        $itemRow.attr('id', "row" + rowCount2);


                    });
                    individualinventorysum();
                } else {
                    alert('You cannot delete this row');
                }



            });

            $(document).on('click', '#deleteEnquiry1', function () {
                //mioInvoice.deleteRow4(this);
                var rowCount2 = $('#enquirytable1 tr:visible').length;
                //alert(rowCount2);
                if (rowCount2 != 2) {
                    //alert('inside');
                    $(this).parents('.item-enquiry').remove();
                    $("tr.item-enquiry").each(function () {
                        var $itemRow = $(this).closest('tr');
                        var rowCount2 = ($(this).closest("tr")[0].rowIndex);
                        $itemRow.attr('id', "row" + rowCount2);


                    });
                    commoninventorysum();
                } else {
                    alert('You cannot delete this row');
                }



            });

        </script>

        
        


    </body>

</html>

