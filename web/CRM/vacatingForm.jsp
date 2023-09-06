<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<script type="text/javascript">
    function dateValid() {
        var loadingDate = document.getElementById("contStartDate").value;
        var unloadingDate = document.getElementById("vfdate").value;
        var vacatingDate = document.getElementById("dateofvacate").value;
        var billingCycle = document.getElementById("billingCycle").value;
        var rentAmount = parseFloat(document.getElementById("rentAmount").value);

        var day = 1000 * 60 * 60 * 24;
        var loaddate = loadingDate.split("-");
        var unloaddate = unloadingDate.split("-");
        var vacatedate = vacatingDate.split("-");

        var loaddate1 = new Date(loaddate[1] + '/' + loaddate[0] + '/' + loaddate[2]);
        var unloaddate1 = new Date(unloaddate[1] + '/' + unloaddate[0] + '/' + unloaddate[2]);
        var tempdate = null;
        var month_count = 0;
        var diff = 0;
        var rentPerday = 0;
        if (billingCycle == 'Monthly') {
            while (loaddate1 <= unloaddate1) {
                tempdate = new Date(loaddate1.setMonth(loaddate1.getMonth() + 1));
                tempdate = new Date(tempdate.setDate(tempdate.getDate() - 1));
                if (tempdate <= unloaddate1) {
                    diff = ((new Date(unloaddate1).getTime()) - (new Date(tempdate).getTime())) / (1000 * 24 * 3600);
                    month_count++;
                }
            }
            rentPerday = parseFloat(rentAmount / 30.4).toFixed(0);
        }
        else if (billingCycle == 'Quarterly') {
            while (loaddate1 <= unloaddate1) {
                tempdate = new Date(loaddate1.setMonth(loaddate1.getMonth() + 3));
                tempdate = new Date(tempdate.setDate(tempdate.getDate() - 1));
                if (tempdate <= unloaddate1) {
                    diff = ((new Date(unloaddate1).getTime()) - (new Date(tempdate).getTime())) / (1000 * 24 * 3600);
                    month_count++;
                }
            }
            rentPerday = parseFloat(rentAmount / 91.2).toFixed(0);
        }
        else if (billingCycle == 'Half Yearly') {
            while (loaddate1 <= unloaddate1) {
                tempdate = new Date(loaddate1.setMonth(loaddate1.getMonth() + 6));
                tempdate = new Date(tempdate.setDate(tempdate.getDate() - 1));
                if (tempdate <= unloaddate1) {
                    diff = ((new Date(unloaddate1).getTime()) - (new Date(tempdate).getTime())) / (1000 * 24 * 3600);
                    month_count++;
                }
            }
            rentPerday = parseFloat(rentAmount / 182.5).toFixed(0);
        }
        else if (billingCycle == 'Yearly') {
            while (loaddate1 <= unloaddate1) {
                tempdate = new Date(loaddate1.setMonth(loaddate1.getMonth() + 12));
                tempdate = new Date(tempdate.setDate(tempdate.getDate() - 1));
                if (tempdate <= unloaddate1) {
                    diff = ((new Date(unloaddate1).getTime()) - (new Date(tempdate).getTime())) / (1000 * 24 * 3600);
                    month_count++;
                }
            }
            rentPerday = parseFloat(rentAmount / 365).toFixed(0);
        }
        document.getElementById("totMonths").value = month_count;
        if (rentAmount) {
            var renttoPay = parseFloat(rentAmount * month_count).toFixed(0);
            document.getElementById("totrenttoPay").value = renttoPay;

            if (diff > 0) {
                var gettotRent = parseFloat(document.getElementById("totrenttoPay").value);
                var perdayRent = parseFloat(rentPerday * diff + gettotRent).toFixed(0);
                document.getElementById("totrenttoPay").value = perdayRent;
            }
        }
    }

    function Validate($this) {
        var fl = document.getElementById("attachmentName").value;
        var fileSize = $this.files[0];
        var sizeInMb = fileSize.size / 1024;
        var sizeLimit = 1024 * 2;
        if (sizeInMb > sizeLimit) {
            alert("File Size Exceeded(Only 2MB Allowed)");
            $($this).val('');
            return;
        }
        var fmt = /^.*\.(jpg|JPG|gif|GIF|png|PNG|jpeg|JPEG|xls|XLS|xlsx|XLSX|doc|DOC|docx|DOCX|pdf|PDF)$/;
        if (!fl.match(fmt)) {
            alert('Invalid File');
            $($this).val('');
            return false;
        }

        else {
            return true;
        }

    }

    function CalculateFinalSettlement() {
        var tenantName = document.getElementById('tenantName').value;
        var advToPaid = parseFloat(document.getElementById('advToPaid').value);
        var rentDues = parseFloat(document.getElementById('rentDues').value);
        var advDues = parseFloat(document.getElementById('advDues').value);
        var serviceDues = parseFloat(document.getElementById('serviceDues').value);
        var utility1 = parseFloat(document.getElementById('utility1').value);
        var utility2 = parseFloat(document.getElementById('utility2').value);
        if (isNaN(utility1) == false && isNaN(utility2) == false) {
            var finalSettlement = parseFloat(advToPaid - (rentDues + advDues + serviceDues + utility1 + utility2));
            document.getElementById('finalSettlementAmmount').value = finalSettlement;
            //                    if (finalSettlement < 0) {
            //                        alert("Tenant " + tenantName + " need to pay dues amount of " + (-finalSettlement));
            ////                window.location.href = '../CRM/vacatingForm.htm';)||(utility1 == 0 || utility2 == 0)
            ////                document.getElementById("complaintForm").reset();
            ////                document.getElementById('submitbutton').disabled = true;
            //                        return false;
            //                    } else {
            ////                document.getElementById('submitbutton').disabled = false;
            //                        return true;
            //                    }
            return true;
        } else {
            document.getElementById('finalSettlementAmmount').value = "";
            return false;
        }
    }

    function formValidate() {
        var x = document.getElementById('tenantCode').value &&
            document.getElementById('vfdate').value &&
            document.getElementById('dateofvacate').value &&
            document.getElementById('advDues').value &&
            document.getElementById('rentDues').value &&
            document.getElementById('serviceDues').value &&
            document.getElementById('utility1').value &&
            document.getElementById('utility2').value &&
            document.getElementById('reasonforvac').value;
        if (x == '' || x == null) {
            alert("Please Select Mandatory Fields...!");
            return false;
        } else {
            var finalSettlement = document.getElementById('finalSettlementAmmount').value;
            var fs = parseFloat(finalSettlement);
            if (fs < 0) {
                if (confirm("Tenant need to pay dues amount of " + (-fs) + "\n\nDo you want to proceed!!!")) {
                    document.getElementById("complaintForm").submit = true;
                    return true;
                }
                return false;
            } else {
                if (confirm("Tenant paid extra amount of " + (fs) + "\n\nDo you want to proceed!!!")) {
                    document.getElementById("complaintForm").submit = true;
                    return true;
                }
                return false;
            }


        }
    }

    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            alert("Please Enter Numeric value");
            return false;
        }
        return true;
    }

    function selectAdvDues() {
        var tenantCode = document.getElementById('tenantCode').value;
        var Advance = "Advance";
        $.ajax({
            type: "POST",
            url: '../CRM/selectAdvDues.htm',
            data: {
                tenantCode: tenantCode,
                recieptType: Advance
            },
            success: function (data) {
                //                        if (data === "a") {
                ////                            alert("Tenant did not paid Advance, Please Check..!");
                ////                            document.getElementById('advDues').value = "0";
                ////                            window.location.href = '../CRM/vacatingForm.htm';
                //////                            document.getElementById("complaintForm").reset();
                //////                            document.getElementById('submitbutton').disabled = true;
                ////                            return false;
                //                        }                    
                //                        else {
                var dat = data.split("[");
                var dat1 = dat[1].split("]");
                document.getElementById('advDues').value = parseFloat(dat1[0]).toFixed(0);
                //                        }
            }
        });
        selectRentDues();
    }

    function selectRentDues() {
        var tenantCode = document.getElementById('tenantCode').value;
        var contStartDate = document.getElementById('contStartDate1').value;
        var contEndDate = document.getElementById('ceDate1').value;
        var rent = "Rent";
        $.ajax({
            type: "POST",
            url: '../CRM/selectRentDues.htm',
            data: {
                tenantCode: tenantCode,
                recieptType: rent,
                contStartDate: contStartDate,
                contEndDate: contEndDate
            },
            success: function (data) {
                if (data === "a") {
                    var totrenttoPay = parseFloat(document.getElementById("totrenttoPay").value);
                    document.getElementById('rentDues').value = parseFloat(totrenttoPay).toFixed(0);
                    return false;
                }
                else {
                    var totrenttoPay = parseFloat(document.getElementById("totrenttoPay").value);
                    var dat = data.split("[");
                    var dat1 = dat[1].split("]");
                    document.getElementById('rentDues').value = parseFloat(totrenttoPay - dat1[0]).toFixed(0);
                }
            }
        });
        getServiceDuesIssue();
        previousArrearsforBV();
    }
    var matIssamt = 0;
    function getServiceDuesIssue() {
        var tenantCode = document.getElementById('tenantCode').value;
        var service = "Service";
        $.ajax({
            type: "POST",
            url: '../CRM/selectServiceDuesIssue.htm',
            data: {
                tenantCode: tenantCode,
                recieptType: service
            },
            success: function (data) {
                if (data === "null" || data === "") {
                    matIssamt = 0;
                }
                else {
                    matIssamt = parseFloat(data).toFixed(0);
                }
            }
        });
        getServiceDues();
    }
    var matIssamt1 = 0;
    function getServiceDues() {
        var tenantCode = document.getElementById('tenantCode').value;
        var service = "Service";
        $.ajax({
            type: "POST",
            url: '../CRM/selectServiceDues.htm',
            data: {
                tenantCode: tenantCode,
                recieptType: service
            },
            success: function (data) {
                //                        data=data.toString();alert(data);
                if (data == null || data == "" || data == 'null') {
                    matIssamt1 = 0;
                }
                else {
                    matIssamt1 = parseFloat(data).toFixed(0);
                }
            }
        });
        //                calcMatIssue();
    }

    function calcMatIssue() {
        //                if (matIssamt > matIssamt1) {
        var totservDues = matIssamt - matIssamt1;
        document.getElementById('serviceDues').value = parseFloat(totservDues).toFixed(0);
        //                } else {
        //                    document.getElementById('serviceDues').value = "0";
        //                }
        CalculateFinalSettlement();
    }

    function previousArrearsforBV() {
        var tenantCode = document.getElementById('tenantCode').value;
        var startsFrom = document.getElementById("contStartDate").value;
        var startsFrom1 = startsFrom.split("-");
        var v1 = new Date(startsFrom1);
        var actualstartdatef = v1.getDate();
        var actualstartmonthf = v1.getMonth();
        var actualstartmonthf1 = actualstartmonthf + 1;
        var actuaystartf = v1.getFullYear();
        $.ajax
            ({
                type: "POST",
                url: '../tenant/previousArrearsforBV.htm',
                data: {
                    tenantCode: tenantCode,
                    startsFrom: startsFrom,
                    actualstartdatef: actualstartdatef,
                    actualstartmonthf1: actualstartmonthf1,
                    actuaystartf: actuaystartf,
                },
                success: function (data) {
                    if (data === 'a') {
                        return false;
                    } else {
                        var rentDues = parseFloat(document.getElementById('rentDues').value);
                        var dat = data.split(",");
                        document.getElementById("rentDues").value = parseFloat(dat[0]) + rentDues - parseFloat(dat[1]);
                    }
                }
            });
    }
    function selectTenantName() {
        $("#advDues").val("");
        $("#vfdate").val("");
        $("#utility1").val("");
        $("#utility2").val("");
        $("#finalSettlementAmmount").val("");
        myWindow = window.open("../CRM/selectTenantName.htm", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
    }


    function selectPropertyName() {
        myWindow = window.open("../CRM/selectPropertyName.htm", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
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


    function test() {
        if (document.getElementById("reasonforvac").value == "") {
            alert("Enter Reason For Vacating");
            return false;
        }
        else {
            var reasonforvac = document.getElementById("reasonforvac").value;
            var reasonforvac1 = document.getElementById("reasonforvac1").value;
            if (reasonforvac !== reasonforvac1) {
                if (confirm('Do you really want to Save this updated record')) {
                    document.forms["complaintForm"].submit();
                    return true;
                } else {
                    return true;
                }
            } else {
                document.forms["complaintForm"].submit();
            }

        }

    }
</script>

<body class="nav-md">
    <% java.util.Date d=new java.util.Date();%>
        <jsp:include page="../login/menu.htm" />


        <main id="main" class="main">
            <div>
                <jsp:include page="../login/headerlink.htm?submodule=Vacate&tab=Vacate&pagetype=form"/>
            </div>
            <div class="pagetitle">

            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h5>AMC Maintenance Details</h5>
                                </div>
                                <form class="form-inline row" id="complaintForm" accept-charset="UTF-8" method="post" action="../CRM/vacatingFormSubmit.htm" enctype="multipart/form-data">
                                    <c:choose>
                                        <c:when test="${fn:length(vacatingList) > 0}">
                                            <c:forEach items="${vacatingList}" var="list">
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
                                    <c:forEach items="${vacatFormData}" var="list">
                                        <c:if test="${list[0] eq '30'}">
                                            <c:set value="${list[1]}" var="name1"/>
                                            <c:set value="${list[2]}" var="status1"/>
                                            <c:set value="${list[3]}" var="mand_status_1"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '31'}">
                                            <c:set value="${list[1]}" var="name2"/>
                                            <c:set value="${list[2]}" var="status2"/>
                                            <c:set value="${list[3]}" var="mand_status_2"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '32'}">
                                            <c:set value="${list[1]}" var="name3"/>
                                            <c:set value="${list[2]}" var="status3"/>
                                            <c:set value="${list[3]}" var="mand_status_3"/>

                                        </c:if>
                                        <c:if test="${list[0] eq '33'}">
                                            <c:set value="${list[1]}" var="name4"/>
                                            <c:set value="${list[2]}" var="status4"/>
                                            <c:set value="${list[3]}" var="mand_status_4"/>

                                        </c:if>
                                        <c:if test="${list[0] eq '34'}">
                                            <c:set value="${list[1]}" var="name5"/>
                                            <c:set value="${list[2]}" var="status5"/>
                                            <c:set value="${list[3]}" var="mand_status_5"/>

                                        </c:if>
                                        <c:if test="${list[0] eq '35'}">
                                            <c:set value="${list[1]}" var="name6"/>
                                            <c:set value="${list[2]}" var="status6"/>
                                            <c:set value="${list[3]}" var="mand_status_6"/>

                                        </c:if>
                                        <c:if test="${list[0] eq '36'}">
                                            <c:set value="${list[1]}" var="name7"/>
                                            <c:set value="${list[2]}" var="status7"/>
                                            <c:set value="${list[3]}" var="mand_status_7"/>

                                        </c:if>
                                        <c:if test="${list[0] eq '37'}">
                                            <c:set value="${list[1]}" var="name8"/>
                                            <c:set value="${list[2]}" var="status8"/>
                                            <c:set value="${list[3]}" var="mand_status_8"/>

                                        </c:if>
                                        <c:if test="${list[0] eq '38'}">
                                            <c:set value="${list[1]}" var="name9"/>
                                            <c:set value="${list[2]}" var="status9"/>
                                            <c:set value="${list[3]}" var="mand_status_9"/>

                                        </c:if>

                                        <%-- Added by Garun {Advance, Rent Dues, Service Dues, utility 1 and 2} --%>

                                        <c:if test="${list[0] eq '592'}">
                                            <c:set value="${list[1]}" var="name590"/>
                                            <c:set value="${list[2]}" var="status590"/>
                                            <c:set value="${list[3]}" var="mand_status_590"/>

                                        </c:if>
                                        <c:if test="${list[0] eq '593'}">
                                            <c:set value="${list[1]}" var="name591"/>
                                            <c:set value="${list[2]}" var="status591"/>
                                            <c:set value="${list[3]}" var="mand_status_591"/>

                                        </c:if>
                                        <c:if test="${list[0] eq '594'}">
                                            <c:set value="${list[1]}" var="name592"/>
                                            <c:set value="${list[2]}" var="status592"/>
                                            <c:set value="${list[3]}" var="mand_status_592"/>

                                        </c:if>
                                        <c:if test="${list[0] eq '595'}">
                                            <c:set value="${list[1]}" var="name593"/>
                                            <c:set value="${list[2]}" var="status593"/>
                                            <c:set value="${list[3]}" var="mand_status_593"/>

                                        </c:if>
                                        <c:if test="${list[0] eq '596'}">
                                            <c:set value="${list[1]}" var="name594"/>
                                            <c:set value="${list[2]}" var="status594"/>
                                            <c:set value="${list[3]}" var="mand_status_594"/>

                                        </c:if>

                                        <c:if test="${list[0] eq '597'}">
                                            <c:set value="${list[1]}" var="name597"/>
                                            <c:set value="${list[2]}" var="status597"/>
                                            <c:set value="${list[3]}" var="mand_status_597"/>

                                        </c:if>
                                        <c:if test="${list[0] eq '598'}">
                                            <c:set value="${list[1]}" var="name598"/>
                                            <c:set value="${list[2]}" var="status598"/>
                                            <c:set value="${list[3]}" var="mand_status_598"/>

                                        </c:if>
                                        <c:if test="${list[0] eq '613'}">
                                            <c:set value="${list[1]}" var="name613"/>
                                            <c:set value="${list[2]}" var="status613"/>
                                            <c:set value="${list[3]}" var="mand_status_613"/>

                                        </c:if>
                                        <c:if test="${list[0] eq '856'}">
                                            <c:set value="${list[1]}" var="name614"/>
                                            <c:set value="${list[2]}" var="status614"/>
                                            <c:set value="${list[3]}" var="mand_status_614"/>

                                        </c:if>
                                    </c:forEach>
                                    <%--<c:if test="${mand_status_1 eq 'required'}">
                                        <a class="control-label" style="color:red;">*</a>
                                    </c:if>
                                    <c:if test="${fieldStatus_1 eq 'y'}">--%>

                                    <c:if test="${status1 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_1 eq 'required'}">
                                                <a class="control-label" style="color:red;">*</a>
                                            </c:if>
                                            <label class="control-label">${name1}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(vacatingList) > 0}">
                                                    <c:forEach items="${vacatingList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input name="tenantName" id="tenantName" readonly="" ${mand_status_1} type="text" maxlength="30" class="form-control" value="${type.tenantName}" >

                                                                <input name="sno" type="hidden" value="${type.sno}">
                                                                <input name="status" type="hidden" value="${type.status}">
                                                                <input name="vacatingCode" id="vacatingCode" type="hidden" value="${type.vacatingCode}">

                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="tenantName"  name="tenantName" readonly class="form-control" value="${type.tenantName}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input name="vacatingCode" id="vacatingCode" type="hidden" value="">
                                                    <input name="tenantCode" id="tenantCode" type="hidden" value="">
                                                    <input name="roomCode" id="roomCode" type="hidden" value="">
                                                    <input name="tenantName" id="tenantName"  maxlength="30" type="text" readonly="" class="form-control" ${mand_status_1} placeholder="Select Tenant Name"  value="" onclick="return selectTenantName();"> 

                                                </c:otherwise>        
                                            </c:choose>

                                        </div>
                                    </c:if>
                                    <c:if test="${status2 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_2 eq 'required'}">
                                                <a class="control-label" style="color:red;">*</a>
                                            </c:if>
                                            <label class="control-label">${name2}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(vacatingList) > 0}">
                                                    <c:forEach items="${vacatingList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="propertyName" name="propertyName" class="form-control " ${mand_status_2} readonly value="${type.propertyName}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="propertyName"  name="propertyName" readonly class="form-control" value="${type.propertyName}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <!--onclick="selectPropertyName();"-->
                                                    <input type="text" id="propertyName" name="propertyName"  readonly=""  ${mand_status_2} class="form-control " placeholder=""  >

                                                </c:otherwise>        
                                            </c:choose>

                                        </div>
                                    </c:if>

                                    <%--  Added by Garun for Asset Name --%>

                                    <c:if test="${status597 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_597 eq 'required'}">
                                                <a class="control-label" style="color:red;">*</a>
                                            </c:if>
                                            <label class="control-label">${name597}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(AssetName) > 0}">
                                                    <c:forEach items="${AssetName}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="assetName" name="assetName" class="form-control " ${mand_status_597} readonly value="${type.assetName}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="assetName"  name="assetName" readonly class="form-control" value="${type.assetName}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                                     
                                                    <input type="text" id="assetName" name="assetName"  readonly=""  ${mand_status_597} class="form-control " placeholder=""  >

                                                </c:otherwise>        
                                            </c:choose>

                                        </div>
                                    </c:if>
                                    <p>&nbsp;</p>
                                    <c:if test="${status3 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_3 eq 'required'}">
                                                <a class="control-label" style="color:red;">*</a>
                                            </c:if>

                                            <label class="control-label">${name3}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(vacatingList) > 0}">
                                                    <c:forEach items="${vacatingList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="propertyNo" name="propertyNo" class="form-control " ${mand_status_3}  readonly value="${type.propertyNo}">

                                                                <input name="sno" type="hidden" value="${type.sno}">
                                                                <input name="status" type="hidden" value="${type.status}">

                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="propertyNo"  name="propertyNo" readonly class="form-control" value="${type.propertyNo}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" id="propertyNo" name="propertyNo" ${mand_status_3}  readonly=""  class="form-control " value="">
                                                    <!--                                                                      <input name="subclassifiedAstno" id="subclassifiedAstno" type="hidden" value="">-->
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>
                                    </c:if>

                                    <c:if test="${status598 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_598 eq 'required'}">
                                                <a class="control-label" style="color:red;">*</a>
                                            </c:if>
                                            <label class="control-label">${name598}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(SubAssetName) > 0}">
                                                    <c:forEach items="${SubAssetName}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="subAssetName" name="subAssetName" class="form-control " ${mand_status_598}  readonly value="${type.subAssetName}">

                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="subAssetName"  name="subAssetName" readonly class="form-control" value="${type.subAssetName}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" id="subAssetName" name="subAssetName" ${mand_status_598}  readonly=""  class="form-control " onclick="selectcust();" value="">
                                                    <!--                                                                      <input name="subclassifiedAstno" id="subclassifiedAstno" type="hidden" value="">-->
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>
                                    </c:if>



                                    <c:if test="${status4 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_4 eq 'required'}">
                                                <a class="control-label" style="color:red;">*</a>
                                            </c:if>
                                            <label class="control-label">${name4}
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(vacatingList) > 0}">
                                                    <c:forEach items="${vacatingList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="vfdate" name="vfdate" onmouseover="" style="cursor: pointer;" class="form-control" readonly="" placeholder="Select Date" value="<fmt:formatDate pattern="dd-MMM-yyyy"  value="${type.vacatingFillDate}"/>" onclick="javascript:NewCssCal('vfdate', 'ddMMMyyyy', '', '', '', '', 'past')" > 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="vfdate"  name="vfdate" readonly class="form-control" value="<fmt:formatDate pattern="dd-MMM-yyyy"  value="${type.vacatingFillDate}"/>">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" id="vfdate" name="vfdate" onmouseover="" value="" style="cursor: pointer;" class="form-control" readonly="" placeholder="Select Date" onclick="javascript:NewCssCal('vfdate', 'ddMMMyyyy', '', '', '', '', '')" onchange="dateValid();
                                                            return selectAdvDues();" onblur="calcMatIssue();"> 
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                    </c:if>
                                    <p>&nbsp;</p>
                                    <c:if test="${status5 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_5 eq 'required'}">
                                                <a class="control-label" style="color:red;">*</a>
                                            </c:if>
                                            <label class="control-label">${name5}
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(vacatingList) > 0}">
                                                    <c:forEach items="${vacatingList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="ceDate" name="ceDate" onmouseover="" ${mand_status_5} style="cursor: pointer;" class="form-control" readonly=""  value="<fmt:formatDate pattern="dd-MMM-yyyy"  value="${type.contracrEndDate}"/>"  > 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="ceDate"  name="ceDate" readonly class="form-control" value="<fmt:formatDate pattern="dd-MMM-yyyy"  value="${type.contracrEndDate}"/>">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise> 
                                                    <input type="text" id="ceDate" name="ceDate" onmouseover="" value="" style="cursor: pointer;" class="form-control validation[required]" ${mand_status_5} readonly=""   > 
                                                    <input name="ceDate1" id="ceDate1" type="hidden" value="">
                                                    <input name="contractCode" id="contractCode" type="hidden" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                    </c:if>
                                    <c:if test="${status6 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_6 eq 'required'}">
                                                <a class="control-label" style="color:red;">*</a>
                                            </c:if>
                                            <a style="font-size: 15px;margin-top:-21px;color:transparent;font-weight: bold;">*</a>
                                            <label class="control-label">${name6}
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(vacatingList) > 0}">
                                                    <c:forEach items="${vacatingList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="noticePeriod" name="noticePeriod" readonly="" class="form-control" maxlength="3" value="${type.noticPeriod}"  autocomplete="off">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="noticePeriod"  name="noticePeriod" readonly class="form-control" value="${type.noticPeriod}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" id="noticePeriod" readonly="" name="noticePeriod" class="form-control" maxlength="3"  autocomplete="off">
                                                    <input name="contStartDate" id="contStartDate" type="hidden" value="">
                                                    <input name="contStartDate1" id="contStartDate1" type="hidden" value="">
                                                    <input name="billingCycle" id="billingCycle" type="hidden" value="">
                                                    <input name="totMonths" id="totMonths" type="hidden" value="">
                                                    <input name="rentAmount" id="rentAmount" type="hidden" value="">
                                                    <input name="totrenttoPay" id="totrenttoPay" type="hidden" value="">
                                                    <!--<input name="issuedserviceDues" id="issuedserviceDues" type="text" value="">-->
                                                    <!--<input name="paidserviceDues" id="paidserviceDues" type="text" value="">-->

                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                    </c:if>



                                    <%-- 
                                         Added by Garun for following 
                                              1. Advance
                                              2. Service Dues
                                              3. Rent Dues
                                              4. Utility 1
                                              5. Utility 2
                                    --%>                                        
                                    <c:if test="${status590 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_590 eq 'required'}">
                                                <a class="control-label" style="color:red;">*</a>
                                            </c:if>

                                            <label class="control-label" >${name590}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(vacatingList) > 0}">
                                                    <c:forEach items="${vacatingList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="advToPaid" readonly name="advToPaid" class="form-control" style="margin-top: 5px" ${mand_status_590} maxlength="6" value="${type.advanceeToBePaid}"  onkeypress="return isNumberKey(event)" autocomplete="off">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="advToPaid"  name="advToPaid" readonly class="form-control" style="margin-top: 5px" value="${type.advanceeToBePaid}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" id="advToPaid" readonly="" name="advToPaid" class="form-control" style="margin-top: 5px" maxlength="6" ${mand_status_590} onkeypress="return isNumberKey(event)"  autocomplete="off" style="margin-top:-15px">

                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                    </c:if>
                                    <p>&nbsp;</p>
                                    <c:if test="${status613 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_613 eq 'required'}">
                                                <a class="control-label" style="color:red;">*</a>
                                            </c:if>

                                            <label class="control-label" >${name613}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(vacatingList) > 0}">
                                                    <c:forEach items="${vacatingList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="advDues" readonly name="advDues" class="form-control" style="margin-top: 5px" ${mand_status_613} maxlength="6" value="${type.advDues}"  onkeypress="return isNumberKey(event)" autocomplete="off">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="advDues"  name="advDues" readonly class="form-control" style="margin-top: 5px" value="${type.advDues}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" id="advDues" readonly placeholder="" name="advDues" class="form-control" style="margin-top: 5px" maxlength="6" ${mand_status_613} onkeypress="return isNumberKey(event)"  autocomplete="off" style="margin-top:-15px;">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                    </c:if>
                                    <c:if test="${status591 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_591 eq 'required'}">
                                                <a class="control-label" style="color:red;">*</a>
                                            </c:if>

                                            <label class="control-label" >${name591}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(vacatingList) > 0}">
                                                    <c:forEach items="${vacatingList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="rentDues" readonly name="rentDues" class="form-control" style="margin-top: 5px" ${mand_status_591} maxlength="6" value="${type.rentDues}"  onkeypress="return isNumberKey(event)" autocomplete="off">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="rentDues"  name="rentDues" readonly class="form-control" style="margin-top: 5px" value="${type.rentDues}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" id="rentDues" readonly placeholder="" name="rentDues" class="form-control" style="margin-top: 5px" maxlength="6" ${mand_status_591} onkeypress="return isNumberKey(event)"  autocomplete="off" style="margin-top:-15px">

                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                    </c:if>

                                    <c:if test="${status592 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_592 eq 'required'}">
                                                <a class="control-label" style="color:red;">*</a>
                                            </c:if>

                                            <label class="control-label" >${name592}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(vacatingList) > 0}">
                                                    <c:forEach items="${vacatingList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="serviceDues" readonly name="serviceDues" class="form-control" style="margin-top: 5px" ${mand_status_592} maxlength="6" value="${type.serviceDues}"  onkeypress="return isNumberKey(event)" autocomplete="off" >
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="serviceDues"  name="serviceDues" readonly class="form-control" style="margin-top: 5px" value="${type.serviceDues}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" id="serviceDues" readonly placeholder="" name="serviceDues" class="form-control" style="margin-top: 5px" maxlength="6" ${mand_status_592} onkeypress="return isNumberKey(event)"  autocomplete="off" style="margin-top:-15px">

                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                    </c:if>
                                    <p>&nbsp;</p>
                                    <c:if test="${status593 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_593 eq 'required'}">
                                                <a class="control-label" style="color:red;">*</a>
                                            </c:if>

                                            <label class="control-label" >${name593}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(vacatingList) > 0}">
                                                    <c:forEach items="${vacatingList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">   
                                                                <input type="text" id="utility1" name="utility1" readonly class="form-control" style="margin-top: 5px" ${mand_status_593} maxlength="6" value="${type.utility1}"  onkeypress="return checkdigit(event, this, 10, 2);" autocomplete="off">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="utility1"  name="utility1" readonly class="form-control" style="margin-top: 5px" value="${type.utility1}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" id="utility1" name="utility1" class="form-control" style="margin-top: 5px" maxlength="6" ${mand_status_593} onkeypress="return checkdigit(event, this, 10, 2);"  autocomplete="off" style="margin-top:-15px" oninput="return CalculateFinalSettlement();">

                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                    </c:if>                                     

                                    <c:if test="${status594 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_594 eq 'required'}">
                                                <a class="control-label" style="color:red;">*</a>
                                            </c:if>

                                            <label class="control-label" >${name594}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(vacatingList) > 0}">
                                                    <c:forEach items="${vacatingList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}"> 
                                                                <input type="text" id="utility2" name="utility2" readonly class="form-control" style="margin-top: 5px" ${mand_status_594} maxlength="6" value="${type.utility2}"  onkeypress="return checkdigit(event, this, 10, 2);" autocomplete="off">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="utility2"  name="utility2" readonly class="form-control" style="margin-top: 5px" value="${type.utility2}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" id="utility2" name="utility2" class="form-control" style="margin-top: 5px" maxlength="6" ${mand_status_594} onkeypress="return checkdigit(event, this, 10, 2);"  autocomplete="off" style="margin-top:-15px" oninput="return CalculateFinalSettlement();">

                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                    </c:if>


                                    <%--Change the label name  --%>
                                    <c:if test="${status8 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_8 eq 'required'}">
                                                <a class="control-label" style="color:red;">*</a>
                                            </c:if>

                                            <label class="control-label" >${name8}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(vacatingList) > 0}">
                                                    <c:forEach items="${vacatingList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="finalSettlementAmmount" name="finalSettlementAmmount" readonly class="form-control" style="margin-top: 5px" ${mand_status_8} maxlength="6" value="${type.finalSettlementAmmount}"  onkeypress="return isNumberKey(event)" autocomplete="off">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="finalSettlementAmmount"  name="finalSettlementAmmount" readonly class="form-control" style="margin-top: 5px" value="${type.finalSettlementAmmount}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" readonly placeholder="Click here to Calculate" id="finalSettlementAmmount" name="finalSettlementAmmount" class="form-control" style="margin-top: 5px" maxlength="6" ${mand_status_8} onkeypress="return isNumberKey(event)"  autocomplete="off" style="margin-top:-15px" onclick="return CalculateFinalSettlement();">

                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                    </c:if>
                                    <p>&nbsp;</p>
                                    <c:if test="${status9 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_9 eq 'required'}">
                                                <a class="control-label" style="color:red;">*</a>
                                            </c:if>
                                            <label class="control-label" style="">${name9}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(vacatingList) > 0}">
                                                    <c:forEach items="${vacatingList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <textarea class="form-control" rows="1" ${mand_status_9} style="resize: none" maxlength="200" name="reasonforvac"  id="reasonforvac" type="text" value="${type.reasonForVacating}" >${type.reasonForVacating}</textarea>
                                                                <input class="form-control" type="hidden" id="reasonforvac1"   rows="1" ${mand_status_9} style="resize: none" maxlength="200" value="${type.reasonForVacating}" autocomplete="off">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea class="form-control" rows="1" style="resize: none"  maxlength="200" readonly type="text" value="${type.reasonForVacating}">${type.reasonForVacating}</textarea>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <textarea class="form-control " rows="1" ${mand_status_9} style="resize: none" maxlength="200" value="" name="reasonforvac" id="reasonforvac" type="text"></textarea>



                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                    </c:if>

                                    <c:if test="${status614 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_614 eq 'required'}">
                                                <a class="control-label" style="color:red;">*</a>
                                            </c:if>
                                            <label class="control-label">${name614}
                                            </label>
                                            <c:choose>
                                                <c:when test="${fn:length(vacatingList) > 0}">
                                                    <c:forEach items="${vacatingList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="dateofvacate" name="dateofvacate" onmouseover="" style="cursor: pointer;" class="form-control" readonly="" placeholder="Select Date" value="<fmt:formatDate pattern="dd-MMM-yyyy"  value="${type.dateofvacate}"/>" onclick="javascript:NewCssCal('dateofvacate', 'ddMMMyyyy', '', '', '', '', 'past')" > 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="dateofvacate"  name="dateofvacate" readonly class="form-control" value="<fmt:formatDate pattern="dd-MMM-yyyy"  value="${type.dateofvacate}"/>">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" id="dateofvacate" name="dateofvacate" onmouseover="" value="" style="cursor: pointer;" class="form-control" readonly="" placeholder="Select Date" onclick="javascript:NewCssCal('dateofvacate', 'ddMMMyyyy', '', '', '', '', '')" onchange="return dateValid();">

                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                    </c:if>
                                    <p>&nbsp;</p> 
                                    <p>&nbsp;</p> 
                                    <c:if test="${action ne 'view' && action ne 'edit'}">
                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                            <!--<button type="submit" class="btn btn-primary" style=""> Resolving Authority </button>-->
                                            <button type="submit" class="btn btn-primary" style="" id="submitbutton" onclick="return formValidate();" > Save </button>
                                            <a href="../CRM/vacatingList.htm"  class="btn btn-danger"  style="">Cancel</a>
                                        </div>
                                    </c:if>

                                    <c:if test="${action eq 'edit'  }">

                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                            <button type="button" class="btn btn-primary" style="" onclick="return test();">Save</button>
                                            <a href="../CRM/vacatingList.htm" class="btn btn-danger">Cancel</a>
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
            $(document).ready(function () {
                $("#complaintForm").validationEngine();
            });
        </script>
        <jsp:include page="../login/footer.jsp" />
</body>

</html>