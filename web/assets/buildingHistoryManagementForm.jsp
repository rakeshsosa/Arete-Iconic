<%-- Document : buildingHistorylistForm Created on : Sep 15, 2016, 10:42:18 AM Author : Kondal Reddy N --%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <%@page contentType="text/html" pageEncoding="UTF-8" %>
                    <!DOCTYPE html>
                    <html lang="en">
                                     <title>Arete Iconic</title>
                     <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
                       <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
              <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css" />
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css" integrity="sha256-FAOaXTpl90/K8cXmSdsskbQN3nKYulhCpPbcFzGTWKI=" crossorigin="anonymous" />
<link href="../common/validate/validationEngine.css" rel="stylesheet" type="text/css"/>
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.min.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.js" type="text/javascript"></script>
        <script src="../common/datepicker/datetimepicker_css.js" type="text/javascript"></script>     
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
         <script type="text/javascript">
            $(document).ready(function () {
                $("#text").hide()
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
                var assetCode = document.getElementById("assetCode").value;
                var aname = document.getElementById("assetName").value;
//                var aname1 = document.getElementById("assetName1").value;
//                var abul = document.getElementById("assetBuilding").value;
//                var abul1 = document.getElementById("assetBuilding1").value;
                var aarea = document.getElementById("assetArea").value;
//                var aarea1 = document.getElementById("assetArea1").value;
//                var bno = document.getElementById("blockNo").value;
//                var bno1 = document.getElementById("blockNo1").value;
//                var apno = document.getElementById("assetPlotNo"
//                        ).value;
//                var apno1 = document.getElementById("assetPlotNo1").value;
//                var way = document.getElementById("way").value;
//                var way1 = document.getElementById("way1").value;
//                var sno = document.getElementById("streetNo").value;
//                var sno1 = document.getElementById("streetNo1").value;
//                var pcode = document.getElementById("pinCode").value;
//                var pcode1 = document.getElementById("pinCode1").value;
//                var pbox = document.getElementById("poBox").value;
//                var pbox1 = document.getElementById("poBox1").value;
//                var aotype = document.getElementById("assetOwnerType").value;
//                var aotype1 = document.getElementById("assetOwnerType1").value;
//                var atype = document.getElementById("assetType").value;
//                var atype1 = document.getElementById("assetType1").value;
//                var carea = document.getElementById("classificationArea").value;
//                var carea1 = document.getElementById("classificationArea1").value;
                //                var acate = document.getElementById("assetCategory").value;
                //                var acate1 = document.getElementById("assetCategory1").value;
                //                var acla = document.getElementById("assetClass").value;
                //                var acla1 = document.getElementById("assetClass1").value;
                var barea = document.getElementById("buildedArea").value;
//                var barea1 = document.getElementById("buildedArea1").value;
                var noflr = document.getElementById("noOfFloors").value;
//                var noflr1 = document.getElementById("noOfFloors1").value;
                var tassetv = document.getElementById("totalAssetValue").value;
//                var tassetv1 = document.getElementById("totalAssetValue1").value;
                //                var minrent = document.getElementById("minimumRentGen").value;
                //                var minrent1 = document.getElementById("minimumRentGen1").value;
                //                var roi = document.getElementById("roi").value;
                //                var roi1 = document.getElementById("roi1").value;
//                var pcent = document.getElementById("percentage").value;
//                var pcent1 = document.getElementById("percentage1").value;
//                var amt = document.getElementById("amcamount").value;
//                var amt1 = document.getElementById("amcamount1").value;
                var cname = document.getElementById("ccname").value;
//                var cname1 = document.getElementById("ccname1").value;
                var bdate = document.getElementById("bcDate").value;
//                var bdate1 = document.getElementById("bcDate1").value;
                var snam = document.getElementById("sname").value;
//                var snam1 = document.getElementById("sname1").value;
                var scon = document.getElementById("scontact").value;
//                var scon1 = document.getElementById("scontact1").value;
                var smail = document.getElementById("semail").value;
//                var smail1 = document.getElementById("semail1").value;
                var saddr = document.getElementById("saddress").value;
//                var saddr1 = document.getElementById("saddress1").value;

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

                    if (aname === aname1 || abul === abul1 || aarea === aarea1 || bno === bno1 || apno === apno1
                            || way === way1 || sno === sno1 || pcode === pcode1 || pbox === pbox1 || aotype === aotype1
                            || atype === atype1 || carea === carea1 || barea === barea1
                            || noflr === noflr1 || tassetv === tassetv1 || pcent === pcent1 || amt === amt1
                            || cname === cname1 || bdate === bdate1 || snam === snam1 || scon === scon1 || smail === smail1
                            || saddr === saddr1) {
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
                   // text.style.display = "block";
                   $("#text").show();
                   $("#sname").prop('required',true);
                   $("#scontact").prop('required',true);
                   $("#semail").prop('required',true);
                   $("#saddress").prop('required',true);
                   
                } else {
                  //  text.style.display = "none";
                   $("#text").hide();
                      $("#sname").prop('required',false);
                   $("#scontact").prop('required',false);
                   $("#semail").prop('required',false);
                   $("#saddress").prop('required',false);
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

            var next = 1;
            $(document).on("click", ".add-more", function (e) {
                e.preventDefault();
                var addto = "#adiv" + next;
                next = next + 1;
                var newIn = '<div  id="adiv' + (next) + '" class="col-md-6 mt-2 col-sm-12 "><div class="d-flex"><button type="button" style="display: inline!important;" id="remove' + (next) + '" class="btn btn-danger remove-me">-</button><input style="display: inline!important;margin-left: 5px;margin-right: 3px;" class="form-control capitalize  validate[required]" id="attachname' + next + '" name="documentname" type="text" placeholder="Attachment Name" required=""><input style="display: none;"  id="field' + next + '" class="filecls form-control" name="attachments" type="file" onchange="readURL1(this);setAttachName(\'' + next + '\');" ><input type="button" id="btnb' + next + '" class="btn btn-primary" value="Browse..." onclick="browseFile(\'' + next + '\');" /><p id="field' + next + 'Error" style="color: red; font: bold; display: none; text-align: right;">Upload your valid attachment</p></div></div>';
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


            </script>
        <title>arête Assets Management</title>

        <script>
            
            function testsubmit(){
//                alert("i am here");
                
                var assetCode = document.getElementById("assetCode").value;
    var assetName = document.getElementById("assetName").value;
    var ccname = document.getElementById("ccname").value;
    var bcDate = document.getElementById("bcDate").value;
    var lifeSpanOfBld = document.getElementById("lifeSpanOfBld").value;
    var nextRevDate = document.getElementById("nextRevDate").value;
    var snames = document.getElementsByName("sname");
    var scontacts = document.getElementsByName("scontact");
    var semails = document.getElementsByName("semail");
    var saddresses = document.getElementsByName("saddress");

 

    var snameValues = [];
    var scontactValues = [];
    var semailValues = [];
    var saddressValues = [];

 

    for (var i = 1; i < snames.length; i++) {
        snameValues.push(snames[i].value);
        scontactValues.push(scontacts[i].value);
        semailValues.push(semails[i].value);
        saddressValues.push(saddresses[i].value);
    }

 

    var snameString = snameValues.join("<br>"); // Use "|" as the delimiter
    var scontactString = scontactValues.join("<br>");
    var semailString = semailValues.join("<br>");
    var saddressString = saddressValues.join("<br>");

 

    var url = "../assets/buildingFormSubmit.htm?assetCode=" + assetCode +
        "&assetName=" + assetName +
        "&ccname=" + ccname +
        "&bcDate=" + bcDate +
        "&lifeSpanOfBld=" + lifeSpanOfBld +
        "&nextRevDate=" + nextRevDate +
        "&sname=" + encodeURIComponent(snameString) +
        "&scontact=" + encodeURIComponent(scontactString) +
        "&semail=" + encodeURIComponent(semailString) +
        "&saddress=" + encodeURIComponent(saddressString);

 

    myWindow = window.open(url); 
            }
            
        </script>
        
    </head>
                    <body class="nav-md">
                        <jsp:include page="../login/menu.htm" />
                        <jsp:include page="../login/footer.jsp" />


                        <main id="main" class="main">
                            <div class="mt-3">
                                <jsp:include
                                    page="../login/headerlink.htm?submodule=Building History Management&tab=Building History Management&pagetype=form" />
                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h5>Building History Management</h5>
                                                </div>
                                                <form method="post" id="buildform" action="../assets/buildingFormSubmit.htm" enctype="multipart/form-data">
                                                    <div class="row" >  
                                                          <div class="col-md-4 form-floating mb-3">
                                                
                                                    
                                               
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(buildingHistorylist) > 0}">
                                                        <c:forEach items="${buildingHistorylist}" var="list">
                                                            <c:set value="${list.assetCode}" var="assetCode"/>
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" id="assetCode" name="assetCode" maxlength="40" value="${list.assetCode}" onkeypress="return isNumberKey3(event)">
                                                                    
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" id="assetCode" readonly="" value="${list.assetCode}">
                                                                    <input type="hidden" id="assetCode" name="assetCode" value="${list.assetCode}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Fill" required class="form-control"  id="assetCode" name="assetCode" maxlength="40" value=""  required onclick="return selectAccAssetDetails();">
                                                    </c:otherwise>        
                                                </c:choose>
                                                  <label class="control-label">Property Code <a  style="color:red;">*</a></label>      
                                            </div>
                                                            
                                                             
                                        


                                                                                   <div class="col-md-4 form-floating mb-3">
                                                
                                                    
                                               
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(buildingHistorylist) > 0}">
                                                        <c:forEach items="${buildingHistorylist}" var="list">
                                                            <c:set value="${list.assetCode}" var="assetCode"/>
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control"  id="assetName" name="assetName" maxlength="40" value="${list.assetName}" onkeypress="return isNumberKey3(event)">
                                                                    <%--    <input type="hidden" class="form-control"  id="assetName1" name="assetName1" maxlength="40" value="${list.assetName}" > --%>
                                                                    <input type="hidden" name="SNo" value="${list.sno}">
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
                                                        <input type="text" placeholder="Fill"  class="form-control" id="assetName" name="assetName" maxlength="40" value="" onkeypress="return isNumberKey3(event)" required>
                                                    </c:otherwise>        
                                                </c:choose>
                                                  <label class="control-label">Property Name <a  style="color:red;">*</a></label>      
                                            </div>

                                        
                                            <div class="col-md-4 form-floating mb-3">
                                                
                                               
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(buildingHistorylist) > 0}">
                                                        <c:forEach items="${buildingHistorylist}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control"  ${mand_status_53}  id="ccname" name="ccname" maxlength="60" value="${list.ccname}">
                                                                    <input type="hidden" readonly id="pk" name="pk" class="form-control" maxlength="500" value="${list.sno}" required>
                                                                    <%--  <input type="hidden" class="form-control"  ${mand_status_53}  id="ccname1" name="ccname1" maxlength="60" value="${list.ccname}" > --%>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="ccname" value="${list.ccname}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>   
                                                        <input type="text" placeholder="Fill" class="form-control" ${mand_status_53} id="ccname" name="ccname" maxlength="60" value="">
                                                    </c:otherwise>        
                                                </c:choose>
                                                        <label class="control-label">
                                                            Construction Company Name
                                                        </label>
                                            </div>
                                        
                                            <div class="col-md-4 form-floating mb-3 pick1">
                                                
                                                

                                                <c:choose>
                                                    <c:when test="${fn:length(buildingHistorylist) > 0}">
                                                        <c:forEach items="${buildingHistorylist}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input class="form-control  input-xlarge datepicker1" name="bcDate" id="bcDate" readonly type="text" value="<fmt:formatDate pattern="dd-MM-yyyy" value="${type.bcDate}"/>" maxlength="98" required onkeypress="firstToUpperCase1(event);"> 
                                                                    <%--   <input class="form-control  input-xlarge" ${mand_status_54} name="bcDate1" id="bcDate1" readonly type="hidden" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.bcDate}"/>" > --%>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input class="form-control  input-xlarge" readonly type="text" value="<fmt:formatDate pattern="dd-MM-yyyy" value="${type.bcDate}"/>">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input class="form-control  input-xlarge datepicker1" id="bcDate" name="bcDate"   placeholder="Select Date" readonly="" type="text" maxlength="98" required onkeypress="firstToUpperCase1(event);" >                                                    
                                                    </c:otherwise>        
                                                </c:choose>
                                                        <label class="control-label">Building Construction Date & Year
                                                 
                                                </label>
                                            </div>
                                 

                                        <!-- newly added by lakshmi-->
                                       
                                            <div class="col-md-4 form-floating mb-3 ">
                                                
                                                

                                                <c:choose>
                                                    <c:when test="${fn:length(buildingHistorylist) > 0}">
                                                        <c:forEach items="${buildingHistorylist}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input class="form-control " name="lifeSpanOfBld" id="lifeSpanOfBld"  type="text"  value="${type.lifeSpanOfBld}" onkeypress="return isNumberKey(event)"> 
                                                                    <%--       <input class="form-control " ${mand_status_853} name="lifeSpanOfBld" id="lifeSpanOfBld"  type="hidden" value="${type.lifeSpanOfBld}" >  --%>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input class="form-control " readonly type="text"  value="${type.lifeSpanOfBld}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input class="form-control " required="" placeholder='Fill' id="lifeSpanOfBld" name="lifeSpanOfBld"  type="text"  onblur="return getLifespanbldg();"onkeypress="return isNumberKey(event)">                                                    
                                                    </c:otherwise>        
                                                </c:choose>
                                                        <label class="control-label">Life Span of Building (in years)
                                               
                                                    <a style="color:red;">*</a>
                                              
                                                </label>
                                            </div>
                                        
                                            <div class="col-md-4 form-floating mb-3 my-auto pick3">
                                                
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(buildingHistorylist) > 0}">
                                                        <c:forEach items="${buildingHistorylist}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input class="form-control  input-xlarge datepicker1" name="nextRevDate" id="nextRevDate" readonly type="text" value="<fmt:formatDate pattern="dd-MM-yyyy" value="${type.nextRevDate}"/>" onkeypress="firstToUpperCase1(event);"> 
                                                                    <%--   <input class="form-control  input-xlarge" ${mand_status_854} name="nextRevDate" id="nextRevDate" readonly type="hidden" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.nextRevDate}"/>" > --%>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input class="form-control  input-xlarge" readonly type="text" value="<fmt:formatDate pattern="dd-MM-yyyy" value="${type.nextRevDate}"/>">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input class="form-control  input-xlarge datepicker1" id="nextRevDate" name="nextRevDate"   placeholder="Select Date" readonly="" type="text" onclick="validation();" onkeypress="firstToUpperCase3(event);">                                                    
                                                    </c:otherwise>        
                                                </c:choose>
                                                        <label class="control-label">Next Revaluation Date & Year <a style="color:red;">*</a>
                                                
                                                    
                                                
                                                </label>
                                            </div>
                                        

                                        <div class="col-md-4 d-flex align-items-center justify-content-between mb-3">
                                            <label onclick="myFunction();" class="control-label" for="myCheck">Owner Details<input class="" type="checkbox" id="myCheck"></label>                                         
                                        </div>
                                       </div>
                                            <div class="row" id="text">

                                            
                                                <div class="col-md-4 form-floating mb-3">
                                                    
                                                    
                                                    
                                                    <%--<c:choose>
                                                        <c:when test="${fn:length(buildingHistorylist) > 0}">
                                                            <c:forEach items="${buildingHistorylist}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control"  id="sname" name="sname" maxlength="60" value="${list.sname}" onkeypress="return isNumberKey4(event)">
                                                                        <%--  <input type="hidden" class="form-control"  ${mand_status_55}  id="sname1" name="sname1" maxlength="60" value="${list.sname}" > 
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="sname" value="${list.sname}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>   
                                                            <input type="text" placeholder="Fill" class="form-control" id="sname" name="sname" maxlength="60" value="" onkeypress="return isNumberKey4(event)">
                                                        </c:otherwise>        
                                                    </c:choose>--%>
                                                            <input type="text" placeholder="Fill" class="form-control" id="sname" name="sname" maxlength="60" value="" onkeypress="return isNumberKey4(event)">
                                                            <label class="control-label">Name
                                                           
                                                        <a  style="color:red;">*</a>
                                                   </label>
                                                </div>
                                            
                                                <div class="col-md-4 form-floating mb-3">
                                                     <div><a  style="color:red;">*</a>Mobile No</div>
                                                    <input type="tel" class="form-control" id="scontact" name="scontact" value="${list.scontact}" maxlength="10" onkeypress="return isNumberKey(event)">
                                                    <%--<c:choose>
                                                        <c:when test="${fn:length(buildingHistorylist) > 0}">
                                                            <c:forEach items="${buildingHistorylist}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="tel" class="form-control" id="scontact" name="scontact" value="${list.scontact}" maxlength="10" onkeypress="return isNumberKey(event)">
                                                                        <%--   <input type="hidden" class="form-control" ${mand_status_56} id="scontact1" name="scontact1" value="${list.scontact}" maxlength="10" > 
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="scontact" value="${list.scontact}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="tel" class="form-control" id="scontact" name="scontact" maxlength="10" value="" onkeypress="return isNumberKey(event)">
                                                        </c:otherwise>        
                                                    </c:choose>--%>
                                           
                                                </div>
                                            
                                            
                                                <div class="col-md-4 form-floating mb-3">
                                                    
                                                    
                                                    <%--<c:choose>
                                                        <c:when test="${fn:length(buildingHistorylist) > 0}">
                                                            <c:forEach items="${buildingHistorylist}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="email" class="form-control"  id="semail" name="semail" maxlength="60" value="${list.semail}" onchange="return validateEmail(this);">
                                                                        <%--    <input type="hidden" class="form-control"  ${mand_status_57}  id="semail1" name="semail1" maxlength="60" value="${list.semail}" > 
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="semail" value="${list.semail}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>   
                                                            <input type="email" placeholder="Fill" class="form-control" id="semail" name="semail" maxlength="60" value="" onchange="return validateEmail(this);">
                                                        </c:otherwise>        
                                                    </c:choose>--%>
                                                            <input type="email" placeholder="Fill" class="form-control" id="semail" name="semail" maxlength="60" value="" onchange="return validateEmail(this);">
                                                            <label class="control-label">E-Mail
                                                    
                                                        <a  style="color:red;">*</a>
                                                   
                                                    </label>
                                                </div>
                                              
                                            
                                                <div class="col-md-4 form-floating mb-3">
                                                    
                                                    
                                                    
                                                    <%--<c:choose>
                                                        <c:when test="${fn:length(buildingHistorylist) > 0}">
                                                            <c:forEach items="${buildingHistorylist}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control"  id="saddress" name="saddress" maxlength="60" value="${list.saddress}">
                                                                        <%--    <input type="hidden" class="form-control"  ${mand_status_58}  id="saddress1" name="saddress1" maxlength="60" value="${list.saddress}" > 
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="saddress" value="${list.saddress}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>   
                                                            <input type="text" placeholder="Fill" class="form-control" id="saddress" name="saddress" maxlength="60" value="">
                                                        </c:otherwise>        
                                                    </c:choose>--%>
                                                            <input type="text" placeholder="Fill" class="form-control" id="saddress" name="saddress" maxlength="60" value="">
                                                            <label class="control-label">Address   <a  style="color:red;">*</a></label>
                                                </div>
                                                <c:if test="${action ne 'view'}">
                                                       <div class="col-lg-12 mt-3 mb-3">
                                            <button type="button" class="btn btn-primary" style="" onclick="addOrderRow_test(event);"><i class="fa fa-plus-circle"></i> ADD</button>

                                        </div>
                                                       </c:if>
                                                       <c:if test="${action eq null}">
                                           <div class="my-3 col-lg-12" style="height: auto;width: 100%;border: 1px solid grey;overflow-x: scroll">

                                            <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                <thead>
                                                    <tr>


                                                        <th class="theader" style="">Name</th>
                                                        <th class="theader" style="">Mobile No</th>
                                                        <th class="theader" style="">E-Mail</th>
                                                        <th class="theader" style="">Address </th>
                                                        <th class="theader" style="">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="resourcetable">

                                                </tbody>              
                                                <script>
                                                    var count = 0;
                                                    function addOrderRow_test(e) {

                                                        var valid1 = true;
                                                        var sname = document.getElementById('sname').value;
                                                        var scontact = document.getElementById('scontact').value;
                                                        var semail = document.getElementById('semail').value;
                                                        var saddress = document.getElementById('saddress').value;
    
//                                                        var x = document.getElementById('sname').value &&
//                                                                document.getElementById('scontact').value &&
//                                                                document.getElementById('semail').value &&
//                                                                document.getElementById('saddress').value;
                                                            var x = sname && scontact && semail && saddress;
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

                                                            var rowlen = slNo1 + 1;
                                                            var tr = table.insertRow(slNo + 1);
                                                            tr.id = 'list_tr_' + slNo;

                                                            tr.innerHTML = '<td><input type="text" readonly class="form-control" name="sname" id="sname" value="' + sname +
                                                                    '" > </td> <td><input type="text" readonly  class="form-control" name="scontact"  id="scontact"  value="' + scontact +
                                                                    '"> </td>  <td><input type="text" readonly  class="form-control" name="semail"  id="semail"  value="' + semail +
                                                                    '"> </td>  </td> <td><input type="text" readonly  class="form-control" name="saddress"  id="saddress"  value="' + saddress +
                                                                    '"> </td><td align="center" class="tinput" style="vertical-align: middle;"><a href="javascript:" class="btn btn-light border" onclick="removeRow12('
                                                                    + slNo + ')"><i class="fa fa-trash-o text-danger"></i> </a></td>';
//                                                    document.getElementById('expensename').value = '';
//                                                    document.getElementById('expenseamount').value = '';

                                                            count++;

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
                                                <div class="my-3 col-lg-12" style="height: auto;width: 100%;border: 1px solid grey;overflow-x: scroll">

                                            <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                <thead>
                                                    <tr>


                                                        <th class="theader" style="">Name</th>
                                                        <th class="theader" style="">Mobile No</th>
                                                        <th class="theader" style="">E-Mail</th>
                                                        <th class="theader" style="">Address </th>
                                                        <!--<th class="theader" style="">Action</th>-->
                                                    </tr>
                                                </thead>
                                                <tbody id="resourcetable">
                                                    <c:if test="${action eq 'view'}">
                                                        <c:forEach items="${BuildingHistoryManagementGridId}" var="list">
                                                            <tr>
                                                                <td class="item-row-actions d-none">
                                
                                                                <input type="hidden" class="form-control-plaintext" id="assetCode" name="assetCode"
                                                                               value="${list.assetCode}" pattern=".*">
                                                                </td>
                                                                <td class=" "style="text-align: left;">${list.sname}</td>
                                                                <td class=" "style="text-align: left;">${list.scontact}</td>
                                                                <td class=" "style="text-align: left;">${list.semail}</td>
                                                                <td class=" "style="text-align: left;">${list.saddress}</td>
                                                                
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                </tbody>              
                                                <script>
                                                    var count = 0;
                                                    function addOrderRow_test(e) {

                                                        var valid1 = true;
                                                        var sname = document.getElementById('sname').value;
                                                        var scontact = document.getElementById('scontact').value;
                                                        var semail = document.getElementById('semail').value;
                                                        var saddress = document.getElementById('saddress').value;
    
                                                        var x = document.getElementById('sname').value &&
                                                                document.getElementById('scontact').value &&
                                                                document.getElementById('semail').value &&
                                                                document.getElementById('saddress').value;
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

                                                            var rowlen = slNo1 + 1;
                                                            var tr = table.insertRow(slNo + 1);
                                                            tr.id = 'list_tr_' + slNo;

                                                            tr.innerHTML = '<td><input type="text" readonly class="form-control" name="sname" id="sname" value="' + sname +
                                                                    '" > </td> <td><input type="text" readonly  class="form-control" name="scontact"  id="scontact"  value="' + scontact +
                                                                    '"> </td>  <td><input type="text" readonly  class="form-control" name="semail"  id="semail"  value="' + semail +
                                                                    '"> </td>  </td> <td><input type="text" readonly  class="form-control" name="saddress"  id="saddress"  value="' + saddress +
                                                                    '"> </td><td align="center" class="tinput" style="vertical-align: middle;"><a href="javascript:" class="btn btn-light border" onclick="removeRow12('
                                                                    + slNo + ')"><i class="fa fa-trash-o text-danger"></i> </a></td>';
//                                                    document.getElementById('expensename').value = '';
//                                                    document.getElementById('expenseamount').value = '';

                                                            count++;

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
                                            </div>
                                                    
                                                    
                                        
                                        <c:if test="${action ne 'view'}">
                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                <!--<button type="submit" class="btn btn-primary" style="">Save</button>-->
                                                <input id="save_button" class="btn btn-primary" type="button" value="Save" onclick="testsubmit();" />
                                                <a href="../assets/buildingHistoryManagementList.htm" class="btn btn-danger">Cancel</a>
                                            </div>
                                        </c:if>

                                        <c:if test="${action eq 'view'}">

                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                                <a href="../assets/buildingHistoryManagementList.htm" class="btn btn-danger">Cancel</a>
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
                     $('.datepicker1').datepicker({
                    format: 'dd-mm-yyyy',
//                    startDate: '0m +0m',
                    autoclose: true,
//                    todayHighlight: true,
                   
                    container: '.pick1'
                });
                
                  $('.datepicker2').datepicker({
                    format: 'dd-mm-yyyy',
                    startDate: '0m +0m',
                    autoclose: true,
                    todayHighlight: true,
                   
                    container: '.pick2'
                }).datepicker('update', new Date());
                
                    $('.datepicker3').datepicker({
                    format: 'dd-mm-yyyy',
                    startDate: '0m +0m',
                    autoclose: true,
                    todayHighlight: true,
                   
                    container: '.pick3'
                }).datepicker('update', new Date());
                
                
                
                             $('#buildform').on('submit', function(e){
                                 e.preventDefault();
                                 
                                 
                                 var test = $("#myCheck").val()
                                 
                             });
                             
                             
                        </script>
                        
                        <script>
    $(function(){
          var phone_number = window.intlTelInput(document.querySelector("#scontact"), {
          initialCountry: "om",
          separateDialCode: true,
          autoHideDialCode: false,
          onlyCountries:["om", "in", "ae"],
          hiddenInput: "full",
          utilsScript: "//cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.3/js/utils.js"
        });
        $("#scontact").change(function(){
                            
                        var full_number = phone_number.getNumber(intlTelInputUtils.numberFormat.E164);
                          $("#scontact").val(full_number);
                          
                          console.log(full_number)
                            //console.log(phone_number.isValidNumber());
                            if(phone_number.isValidNumber() == false){
                                $("#scontact").val("");
                                swal("Please Enter Valid Mobile Number & Country Code!");
                                return false;
                            } 
                            
                            })
    });
</script>
                        
                        
                        
                         <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha256-bqVeqGdJ7h/lYPq6xrPv/YGzMEb6dNxlfiTUHSgRCp8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js" integrity="sha512-DNeDhsl+FWnx5B1EQzsayHMyP6Xl/Mg+vcnFPXGNjUZrW28hQaa1+A4qL9M+AiOMmkAhKAWYHh1a+t6qxthzUw==" crossorigin="anonymous"></script>
    
                    </body>

                    </html>