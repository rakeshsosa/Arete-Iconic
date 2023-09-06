<%-- 
    Document   : form1
    Created on : Feb 23, 2016, 3:24:29 PM
    Author     : Lakshmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript" charset="utf-8"></script>
        <script src="../common/validate/jquery.js" type="text/javascript" charset="utf-8"></script>


        <title>arête Assets Management</title>
    </head>
    <script>


        $(document).ready(function () {
            $('#phyQty').bind("cut copy paste", function (e) {
                e.preventDefault();
            });
        });

        var myWindow = null;
        function openWin1()
        {

            var type1 = document.getElementById('storeLocation').value;
            //(type1);
            myWindow = window.open("../quality/selectInventoryCount.htm?prcode=" + type1 + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");

            $("#batchNo").val('');
            $("#availQty").val('');
            $("#expiryDate").val('');

        }


        function batchNumber1() {
            $('#expiryDate').val('');
            $('#availQty').val('');
            $('#phyQty').val('');
            $('#varianceQty').val('');
            var itemCode = document.getElementById("itemCode").value;
            var fromLocation = document.getElementById("storeLocation").value;

            $.ajax
                    ({
                        type: "POST",
                        url: '../quality/getBatchNo.htm',
                        data: {
                            itemCode: itemCode,
                            fromLocation: fromLocation


                        },
                        success: function (data) {
                            //alert(data);
                            var c = data.split(",");
                            displayName1(data);

                            $('#batchNo').val(data);
                        }
                    });
        }


        function displayName1(data)
        {
            if (data !== null)
            {

                $('#batchNo').html("");

                var nameArray = data.split(",");
                var toAppend = '';


                for (var i = 0; i < nameArray.length - 1; i++) {
                    var nameArray1 = nameArray[i].split("/");
                    toAppend += '<option value=' + nameArray[i] + '>' + nameArray1[0] + '</option>';
                }
                $('#batchNo').append(toAppend);

            }
            else {
                alert("error");
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

        function stock(val1) {
            var batchvalue = val1.split("/");
            //            alert(batchvalue);
            $('#expiryDate').val(moment(batchvalue[1]).format('DD-MMM-YYYY'));
            $('#expiryDate1').val(batchvalue[1]);
            $('#availQty').val(parseFloat(batchvalue[2]).toFixed(3));
            $('#unitPrice').val(batchvalue[3]);


        }


        function isNumberKey(evt)
        {
            debugger;
            var charCode = (evt.which) ? evt.which : event.keyCode;
            if (charCode == 46 && evt.srcElement.value.split('.').length > 1) {
                return false;
            }
            if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;

            //            var charCode = (evt.which) ? evt.which : event.keyCode
            //            if (charCode >= 31 && (charCode < 48 || charCode > 57))
            //                return false;
            //            return true;


        }


        function checkGrid() {

            var table = document.getElementById("resourcetable");
            var length = table.rows.length;
            if (length <= 0) {
                alert("Add data into the grid!");
                return false;
            }
            return true;

        }




        function test1()
        {
            var sum = 0;
            var x = document.getElementById('availQty').value;
            var y = document.getElementById('phyQty').value;
            sum = parseFloat(y) - parseFloat(x);
            if (isNaN(sum) == true) {
                sum = 0;
            }
            if (sum > 0) {
                document.getElementById('varianceQty').value = "+" + sum.toFixed(3);
            } else {
                document.getElementById('varianceQty').value = sum.toFixed(3);
            }


        }


        function clearForm() {
            $('#itemCode').val('');
            $('#itemName').val('');
            $('#batchNo').empty();
            $('#expiryDate').val('');
            $('#uom').val('');
            $('#availQty').val('');
            $('#varianceQty').val('');
            $('#phyQty').val('');
            $('#unitPrice').val('');
        }
    </script>

    <body class="nav-md">

           <jsp:include page="../login/menu.htm" />

                    <main id="main" class="main">
                        <div>
                            <jsp:include page="../login/headerlink.htm?submodule=Stock Adjustment&tab=Stock Entry&pagetype=form"/>
                        </div>
                        <div class="pagetitle">

                        </div><!-- End Page Title -->
                        <section class="section">
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="card">

                                        <div class="card-body">
                                            <div class="card-title">
                                                <h5>Stock Entry Form</h5>
                                            </div>


                                    <form class="form-inline row" action="../quality/stockEntryFormSubmit.htm" method="post" id="imForm" enctype="multipart/form-data" onsubmit="return checkGrid();" enctype="multipart/form-data">


                                        <div class="col-md-4 form-floating mb-3">
                                            

                                            <c:choose>
                                                <c:when test="${fn:length(stocklist) > 0}">
                                                    <c:forEach items="${stocklist}" var="type">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <c:if test="${not empty storeName}">
                                                                    <input class="form-control" placeholder="Fill" id="storeLocation" name="storeLocation" required="" type="text" value="${storeName}" maxlength="80">
                                                                </c:if>
                                                                <input class="form-control" placeholder="Fill"   type="hidden" value="<%=session.getAttribute("orgId").toString()%>" maxlength="80">
                                                                <!--<input class="form-control" placeholder="Fill" id="storeLocation" autocomplete="off" type="text" name="storeLocation" value="" maxlength="80">-->
                                                                <c:if test="${empty storeName}">
                                                                    <select id="storeLocation" name="storeLocation" class="form-control" placeholder="Fill" required onchange="clearForm();" >
                                                                        <option selected value="${type.storeLocationName}">${type.storeLocationName}</option>
                                                                        <option  value="">Choose option</option>
                                                                        <c:forEach items="${store1}" var="list">
                                                                            <option value="${list.storeName}">${list.storeName}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </c:if>
                                                                <input name="pk" type="hidden" value="${type.SNo}">
                                                              <!--<input class="form-control" placeholder="Fill" autocomplete="off" id="storeLocation" name="storeLocation" type="text" value="${type.storeLocationName}" maxlength="80">-->
                                                                <input name="sno" type="hidden" value="${type.SNo}">
                                                                <input name="status" type="hidden" value="${type.status}">
                                                            </c:when>
                                                            <c:otherwise>

                                                                <input class="form-control" placeholder="Fill" readonly id="storeLocation" name="storeLocation" required="" type="text" value="${type.storeLocationName}">

                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:if test="${not empty storeName}">
                                                        <input class="form-control" placeholder="Fill" id="storeLocation" name="storeLocation" type="text" value="${storeName}" maxlength="80">
                                                    </c:if>
                                                    <input class="form-control" placeholder="Fill"   type="hidden" value="<%=session.getAttribute("orgId").toString()%>" maxlength="80">
                                                    <!--<input class="form-control" placeholder="Fill" id="storeLocation" autocomplete="off" type="text" name="storeLocation" value="" maxlength="80">-->
                                                    <c:if test="${empty storeName}">
                                                        <select id="storeLocation" name="storeLocation" class="form-control" placeholder="Fill" required onchange="clearForm();" >
                                                            <option selected value="">Choose option</option>
                                                            <c:forEach items="${store1}" var="list">

                                                                <option value="${list.storeName}">${list.storeName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </c:if>
                                                </c:otherwise>        
                                            </c:choose>
                                                    <label class="control-label"><span style="color: red">*</span> Store Location</label>
                                        </div>

                                        <div class="col-md-4 form-floating mb-3">
                                            

                                            <c:choose>
                                                <c:when test="${fn:length(stocklist) > 0}">
                                                    <c:forEach items="${stocklist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control" placeholder="Fill" autocomplete="off" id="itemCode"  name="itemCode" required="" type="text" value="${type.itemCode}" maxlength="80" onclick="openWin1();"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" placeholder="Fill" readonly name="itemCode" id="itemCode" type="text" value="${type.itemCode}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control" placeholder="Fill" placeholder="Click to select items" autocomplete="off" required="" readonly="" id="itemCode" name="itemCode"  type="text" value="" maxlength="80" onclick="openWin1();">
                                                    <!--<input id="unitPrice"  name="unitPrice" value="" type="hidden">-->
                                                    <input type="hidden" name="division" value="<%=session.getAttribute("orgCode").toString()%>">
                                                </c:otherwise>        
                                            </c:choose>
                                                    <label class="control-label" style="padding-right: 20px;"><span style="color: red">*</span> Item Code</label>
                                        </div>

                                        <div class="col-md-4 form-floating mb-3">
                                            

                                            <c:choose>
                                                <c:when test="${fn:length(stocklist) > 0}">
                                                    <c:forEach items="${stocklist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control col-md-6" autocomplete="off" id="itemName" name="itemName" type="text" value="${type.itemName}" maxlength="120"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control col-md-6" readonly name="itemName" id="itemName" type="text" value="${type.itemName}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control col-md-6" id="itemName" name="itemName" readonly="" autocomplete="off" placeholder=""  type="text" value="" maxlength="120">
                                                    <!--<div style="float: left;width: 110px;">-->
                                                    <!--                                                    <div style="float: right;"><button type="button" class="btn btn-group" style="float:right; margin-top: 1px;font-size: 10px;" onclick="batchNumber1();">Batch No</button></div>
                                                    -->

                                                </c:otherwise>        
                                            </c:choose>
                                                    <label class="control-label col-md-6"><span style="color: red">*</span> Item Name</label>
                                        </div>
                                      

                                        <div class="col-md-4 form-floating mb-3">
                                            

                                            <c:choose>
                                                <c:when test="${fn:length(stocklist) > 0}">
                                                    <c:forEach items="${stocklist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control validate[custom[required,onlyLetterSp]]"  autocomplete="off" id="itemDesc" name="itemDesc" type="text" value="${type.itemDesc}" maxlength="30"> 
                                                            </c:when>
                                                            <c:otherwise>

                                                                <input class="form-control" placeholder="Fill" readonly name="itemDesc" id="itemDesc" type="text" value="${type.itemDesc}">

                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control" placeholder="Fill" id="itemDesc"   autocomplete="off" name="itemDesc" type="text" value="" maxlength="30">
                                                </c:otherwise>        
                                            </c:choose>
                                                    <label class="control-label">Item Desc</label>
                                        </div>

                                        <div class="col-md-4 form-floating mb-3">
                                            

                                            <c:choose>
                                                <c:when test="${fn:length(stocklist) > 0}">
                                                    <c:forEach items="${stocklist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control" placeholder="Fill" autocomplete="off" id="phyQty" name="phyQty" type="text" value="${type.physicalQty}" maxlength="10"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" placeholder="Fill" readonly name="phyQty" id="phyQty" type="text" value="${type.physicalQty}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control" placeholder="Fill" required id="phyQty" name="phyQty" autocomplete="off" type="text" value="" maxlength="10" onkeypress=" return isNumberKey(event);" onkeyup="test1();">
                                                    <input class="" placeholder="Fill" readonly name="subCategory" id="subCategory" type="hidden" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                                    <label class="control-label"><span style="color: red">*</span> Physical Qty</label>
                                        </div>


                                        <div class="col-md-4 form-floating mb-3">
                                            

                                            <c:choose>
                                                <c:when test="${fn:length(stocklist) > 0}">
                                                    <c:forEach items="${stocklist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control" placeholder="Fill" autocomplete="off" id="expiryDate" name="expiryDate" type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.expiryDate}"/>" maxlength="50" onclick="NewCssCal11('expiryDate', 'ddMMMyyyy', '', '', '', '', 'future');"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" placeholder="Fill" readonly name="expiryDate" id="expiryDate" type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.expiryDate}"/>">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control" autocomplete="off" placeholder="Fill" required id="expiryDate" name="expiryDate"  type="text"  maxlength="50" onclick="NewCssCal11('expiryDate', 'ddMMMyyyy', '', '', '', '', 'future');">
                                                    <!--<input class="form-control  input-xlarge" ${mand_status_854} id="NextRevDate" name="NextRevDate"   placeholder="Select Date" readonly="" type="text" onclick="NewCssCal11('NextRevDate', 'ddMMMyyyy', '', '', '', '', '');" >-->                                                    
                                                    <!--<input class="form-control" placeholder="Fill" id="expiryDate1" name="expiryDate" type="hidden">-->
                                                </c:otherwise>        
                                            </c:choose>
                                                    <label class="control-label"><span style="color: red">*</span> Expiry Date</label>
                                        </div>
                                       
                                        <div class="col-md-4 form-floating mb-3">
                                            

                                            <c:choose>
                                                <c:when test="${fn:length(stocklist) > 0}">
                                                    <c:forEach items="${stocklist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control" placeholder="Fill" autocomplete="off" id="uom" name="uom" type="text" value="${type.uom}" maxlength="10"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" placeholder="Fill" readonly name="uom" id="uom" type="text" value="${type.uom}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control" placeholder="Fill" required id="uom" name="uom" readonly="" placeholder="" autocomplete="off"  type="text" value="" maxlength="10">
                                                </c:otherwise>        
                                            </c:choose>
                                                    <label class="control-label"><span style="color: red">*</span> UOM</label>
                                        </div>

                                        <div class="col-md-4 form-floating mb-3">
                                           

                                            <c:choose>
                                                <c:when test="${fn:length(stocklist) > 0}">
                                                    <c:forEach items="${stocklist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control" placeholder="Fill" autocomplete="off" id="date" name="date" type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.sDate}"/>" maxlength="50"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" placeholder="Fill" readonly name="date" id="date" type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.sDate}"/>">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control" autocomplete="off" placeholder="Fill" required id="date"  name="date" type="text" value="" maxlength="50" onclick="NewCssCal11('date', 'ddMMMyyyy', '', '', '', '', '');">
                                                    <input class="" placeholder="Fill" id="date" name="date" type="hidden">
                                                </c:otherwise>        
                                            </c:choose>
                                                     <label class="control-label"><span style="color: red">*</span>Date</label>
                                        </div>


                                        <div class="col-md-4 form-floating mb-3">
                                            

                                            <c:choose>
                                                <c:when test="${fn:length(stocklist) > 0}">
                                                    <c:forEach items="${stocklist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control" placeholder="Fill" autocomplete="off" id="unitPrice" name="unitPrice" type="text" value="<fmt:formatNumber value="${type.unitPrice}" pattern="0.000"/>"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" placeholder="Fill" readonly name="unitPrice" id="unitPrice" type="text" value="<fmt:formatNumber value="${type.unitPrice}" pattern="0.000"/>">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control" placeholder="Fill" required id="unitPrice" name="unitPrice" autocomplete="off" type="text" value="">

                                                </c:otherwise>        
                                            </c:choose>
                                                    <label class="control-label"><span style="color: red">*</span> Unit Price</label>
                                        </div>
                                      

                                        <div class="col-md-4 form-floating mb-3">
                                            

                                            <c:choose>
                                                <c:when test="${fn:length(stocklist) > 0}">
                                                    <c:forEach items="${stocklist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control" placeholder="Fill" autocomplete="off" id="totalPrice" name="totalPrice" type="text" value="<fmt:formatNumber value="${type.totalPrice}" pattern="0.000"/>"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" placeholder="Fill" readonly name="totalPrice" id="totalPrice" type="text" value="<fmt:formatNumber value="${type.totalPrice}" pattern="0.000"/>">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control" placeholder="Fill" required id="totalPrice" name="totalPrice" autocomplete="off" type="text" value="">

                                                </c:otherwise>        
                                            </c:choose>
                                                    <label class="control-label"><span style="color: red">*</span> Total Price</label>
                                        </div>

                                        <div class="col-md-4 form-floating mb-3">
                                            

                                            <c:choose>
                                                <c:when test="${fn:length(stocklist) > 0}">
                                                    <c:forEach items="${stocklist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control" placeholder="Fill" autocomplete="off" id="stockEntryNo" name="stockEntryNo" type="text" value="${type.stockEntryNo}" maxlength="10"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" placeholder="Fill" readonly name="stockEntryNo" id="stockEntryNo" type="text" value="${type.stockEntryNo}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control" placeholder="Fill" required id="stockEntryNo" name="stockEntryNo" autocomplete="off" type="text" value="" maxlength="10" onkeypress=" return isNumberKey(event);" onkeyup="test1();">
                                                    <input class="" placeholder="Fill" readonly name="stockEntryNo" id="stockEntryNo" type="hidden" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                                    <label class="control-label"><span style="color: red">*</span> Stock Entry No</label>
                                        </div>
                                        <div class="col-md-4 form-floating mb-3">
                                            

                                            <c:choose>
                                                <c:when test="${fn:length(stocklist) > 0}">
                                                    <c:forEach items="${stocklist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control" placeholder="Fill" autocomplete="off" id="remarks" name="remarks" type="text" value="${type.remarks}" maxlength="50"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" placeholder="Fill" readonly name="remarks" id="remarks" type="text" value="${type.remarks}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                    <input class="form-control" placeholder="Fill" id="remarks"  name="remarks" autocomplete="off"   type="text" value="" maxlength="50">

                                                </c:otherwise>        
                                            </c:choose>
                                                    <label class="control-label">Remarks</label>
                                        </div>

                                       
                                        <div class="col-md-4 form-floating mb-3">
                                           

                                            <c:choose>
                                                <c:when test="${fn:length(stocklist) > 0}">
                                                    <c:forEach items="${stocklist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control" placeholder="Fill" autocomplete="off" id="user" name="user" type="text" value="${type.preparedBy}" maxlength="50"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" placeholder="Fill" readonly name="user" id="user" type="text" value="${type.preparedBy}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                    <input class="form-control" placeholder="Fill" required id="user"  name="user" autocomplete="off" readonly=""  type="text" value="<%=session.getAttribute("userId")%>" maxlength="50">

                                                </c:otherwise>        
                                            </c:choose>
                                                     <label class="control-label"><span style="color: red">*</span> Prepared By</label>
                                        </div>
                                        <div class="col-md-4 form-floating mb-3" style="margin-top:0px;border:none;">
                                            
                                            <c:choose>
                                                <c:when test="${fn:length(itemCreatList) > 0}">
                                                    <c:forEach items="${itemCreatList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input style="" class=" input-file uniform_on" name="attachmentReference" type="file" value="${type.attachmentReference}">
                                                                <input style="border:none;" type="hidden" name="attachmentReference" value="${type.attachmentReference}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input style="border:none;" class=" input-xlarge" readonly type="text" value="${type.attachmentReference}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                 
                                                        <input class="input-file uniform_on form-control" id="attachmentReference"  type="file" value="" name="attachmentReference"  onchange="Validate(this)">
                                                
                                                    <input style="" class=" input-xlarge"  id="requisitionQty" type="hidden" min="0" max="999" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                                    <label class="control-label" >Upload Stock Entry (csv,excel)</label>
                                        </div>   


                                        <div class="clearfix"></div>
                                     


                                        <c:if test="${action ne 'view'}">
                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                <button type="submit" class="btn btn-primary" style="" onclick="test();">Save</button>
                                                <a href="../quality/stockEntryList.htm" class="btn btn-danger" style="">Cancel</a>
                                            </div>  
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

            $(document).ready(function () {

                jQuery("#imForm").validationEngine();
            });

            function Validate($this)
            {
                var fl = document.getElementById("attachmentReference").value;
                var fileSize = $this.files[0];
                var sizeInMb = fileSize.size / 1024;
                var sizeLimit = 1024 * 2;
                if (sizeInMb > sizeLimit) {
                    alert("File size exceeded(Only 2MB allowed)");
                    $($this).val('');
                    return;
                }
                var fmt = /^.*\.(jpg|JPG|gif|GIF|png|PNG|jpeg|JPEG|xls|XLS|xlsx|XLSX|doc|DOC|docx|DOCX|pdf|PDF)$/;
                if (!fl.match(fmt))
                {
                    alert('Invalid file');
                    $($this).val('');
                    return false;
                }

                else {
                    return true;
                }

            }
            function test()
            {

                var strloc = document.getElementById("storeLocation").value;
                var itemCode = document.getElementById("itemCode").value;
                var itemName = document.getElementById("itemName").value;
                var itemDesc = document.getElementById("itemDesc").value;
                var phyQty = document.getElementById("phyQty").value;
                var expiryDate = document.getElementById("expiryDate").value;
                var uom = document.getElementById("uom").value;
                var date = document.getElementById("date").value;
                var unitPrice = document.getElementById("unitPrice").value;
                var totalPrice = document.getElementById("totalPrice").value;
                var stockEntryNo = document.getElementById("stockEntryNo").value;
                var user = document.getElementById("user").value;

                if (strloc == "")
                {
                    alert("Enter store Location");
                    $('#storeLocation').focus();
                    //return false;
                } else if (itemCode == "")
                {
                    alert("Enter Item code");
                    return false;
                } else if (itemName == "")
                {
                    alert("Enter Item Name");
                    return false;
                } else if (itemDesc == "")
                {
                    alert("Enter Item Description");
                    return false;
                } else if (phyQty == "")
                {
                    alert("Enter Physical Quantity");
                    return false;
                } else if (expiryDate == "")
                {
                    alert("Enter Date");
                    return false;
                } else if (uom == "")
                {
                    alert("Enter uom");
                    return false;
                } else if (date == "")
                {
                    alert("Enter date");
                    return false;
                } else if (unitPrice == "")
                {
                    alert("Enter unit Price");
                    return false;
                } else if (totalPrice == "")
                {
                    alert("Enter total Price");
                    return false;
                } else if (stockEntryNo == "")
                {
                    alert("Enter stock Entry No");
                    return false;
                } else if (user == "")
                {
                    alert("Enter user");
                    return false;
                } else {
                    if (strloc == "" || itemCode == "" || itemName == "" || itemDesc == "" || phyQty == "" || expiryDate == "" || uom == "" || date == "" || unitPrice == "" || totalPrice == "" || stockEntryNo == "" || user == "")
                    {
                        alert("Please Fill Mandatory Fields");
                        $('#storeLocation').focus();
                        return false;
                    } else {
                        document.forms["imForm"].submit();
                    }
                }
            }
            
             $(document).ready(function () {
            $('#unitPrice').change(function () {
                var phyQty = document.getElementById("phyQty").value;
                var unitPrice = document.getElementById("unitPrice").value;
                var rentpMonth = parseFloat(unitPrice);
//                alert("schedule" + schedule);
//                alert("Enter AMCType");
//                alert("cost" + cost);
//                alert("rentpMonth" + rentpMonth);

                if (unitPrice !== '' && phyQty !== '') {
//                    alert("cute pavi");
               
//                        alert("cute pavi");
                        document.getElementById("totalPrice").value = (rentpMonth) *(phyQty);
                    }
                 
                  
               else {
//                    alert("Enter AMCTypejbhjhjh");
                    document.getElementById("totalPrice").value = '0';
                }

            });

        });
              
             $(document).ready(function () {
            $('#phyQty').change(function () {
                var phyQty = document.getElementById("phyQty").value;
                var unitPrice = document.getElementById("unitPrice").value;
                var rentpMonth = parseFloat(unitPrice);
//                alert("schedule" + schedule);
//                alert("Enter AMCType");
//                alert("cost" + cost);
//                alert("rentpMonth" + rentpMonth);

                if (unitPrice !== '' && phyQty !== '') {
//                    alert("cute pavi");
               
//                        alert("cute pavi");
                        document.getElementById("totalPrice").value = (rentpMonth) *(phyQty);
                    }
                 
                  
               else {
//                    alert("Enter AMCTypejbhjhjh");
                    document.getElementById("totalPrice").value = '0';
                }

            });

        });
        </script>
        <script src="../CRM/scripts/general-menu-scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/general-sales_scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/mioinvoice-menu-scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/mioinvoice-sales-scripts.js" type="text/javascript"></script>

        <script src="../master/scripts/general-attach-script.js" type="text/javascript"></script>
        <script src="../master/scripts/mioinvoice-attach-script.js" type="text/javascript"></script>


    </body>

</html>
