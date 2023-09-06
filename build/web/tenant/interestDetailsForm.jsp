<%-- 
    Document   : interestDetailsForm
    Created on : 4 Sep, 2017, 3:55:37 PM
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

           function mandTest() {
                var penaltyM = document.getElementById("period").value &&
                        document.getElementById("toDate").value &&
                        document.getElementById("tenantCode").value;
                        

                if (penaltyM == '')
                {
                    alert("Please Fill Mandatory Fields in Penalty Details");
                    return false;
                }

                else {
                    document.forms["billform"].submit();
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
            function firstToUpperCase() {

                var str = document.getElementById("tenantFname").value;
                var a = str.charAt(0).toUpperCase() + str.substr(1);
                $("#tenantFname").val(a);
            }
            
            function firstToUpperCase1() {

                var str = document.getElementById("tenantLname").value;
                var a = str.charAt(0).toUpperCase() + str.substr(1);
                $("#tenantLname").val(a);
            }
            function fetchTCode() {
             // alert("Tenant Name already exist");
                var tenantCode = document.getElementById("tenantCode").value;
              //  var tenantLname = document.getElementById("tenantLname").value;
               var abc="0";
              
               
                $.ajax
                        ({
                            type: "POST",
                            url: '../tenant/fetchTCode.htm',
                            data: {
                                tenantCode: tenantCode,
                               // alert(abc);
                               // tenantLname: tenantLname
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("tenantCode").value = "";
                                    document.getElementById("tenantName").value = "";
                                    document.getElementById("assetNames").value = "";
                                    document.getElementById("buildingNo").value = "";
                                    document.getElementById("blockNo").value = "";
                                    document.getElementById("streetNo").value = "";
                                    document.getElementById("plotNo").value = "";
                                    document.getElementById("advanceAmount").value = "";
                                   // document.getElementById("tenantLname").value = "";
                                  // document.forms["billform"].submit();
                                    return false;
                                }else{
                        document.forms["billform"].submit();
                    }
                            }
                        });
                                        
                        
            }
            function TotalCalc() {
                var advanceAmount = parseFloat(document.getElementById("advanceAmount").value);
                var interestPer = parseFloat(document.getElementById("interestPer").value);
                // var EBPerUnit = parseFloat(document.getElementById("EBPerUnit").value);
                //var maintainceBill = parseFloat(document.getElementById("maintainceBill").value);
                if (advanceAmount == '0') {
                    alert("Invalid Amount..");
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
                    elcCalcMonth();
                    return true;
                }
            }

            function elcCalcMonth() {
                // var actualRent = parseFloat(document.getElementById("actualRent").value);
                // var totalEBUnints = parseFloat(document.getElementById("totalEBUnints").value);
                //var EBPerUnit = parseFloat(document.getElementById("EBPerUnit").value);
                var advanceAmount = parseFloat(document.getElementById("advanceAmount").value);
                var interestPer = parseFloat(document.getElementById("interestPer").value);
                var interestAmount = advanceAmount * interestPer / 100;
                // var EBPerUnit = parseFloat(document.getElementById("EBPerUnit").value);
                //var advanceAmount = parseFloat(document.getElementById("advanceAmount").value);
                //alert(electricBill);
                // document.getElementById("waterBill").value = totalWBUnints*WBPerUnit ;
                // var EBPerUnit = parseFloat(document.getElementById("EBPerUnit").value);
                //var maintainceBill = parseFloat(document.getElementById("maintainceBill").value);
                //var advanceAmount = parseFloat(document.getElementById("advanceAmount").value);
                //alert(electricBill);
                document.getElementById("interestAmount").value = advanceAmount+interestAmount;

            }

function checkDates() {
                //alert("Select from date...");
               // var receiptType = document.getElementById("receiptType").value;
                var tenantCode = document.getElementById("tenantCode").value;
                //var billCycle = document.getElementById("billCycle").value;
                var fromDate = document.getElementById("period").value;
                var toDate = document.getElementById("toDate").value;
                var actD = fromDate.split("-");
                var inA = toDate.split("-");
                var or = new Date(actD[1] + '/' + actD[0] + '/' + actD[2]);
                var trd = new Date(inA[1] + '/' + inA[0] + '/' + inA[2]);
               // if (actD == '' && receiptType != 'Rent') {
                   // alert("Select from date...");
                    //document.getElementById("period").value = '';
                    //document.getElementById("toDate").value = '';
                //}
                if (trd < or) {
                    alert("To Date should be Greater Than From Date");
                    document.getElementById("period").value = '';
                    document.getElementById("toDate").value = '';
                    return false;
                }
           <%--<c:if test="${action ne 'edit'}">--%>
                   // alert("Select from date...");
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
                                url: '../utility/getUtilityDates.htm',
                                data: {
                                   tenantCode: tenantCode,
                                    actualdatef: actualdatef,
                                    actualdatet: actualdatet,
                                    actualmonthf1: actualmonthf1,
                                    actualmontht1: actualmontht1,
                                    actuayf: actuayf,
                                    actuayt: actuayt,
                                    //receiptType: receiptType,
                                },
                                success: function (data) {
                                    if ($.trim(data) == 'Already Exists.Enter another') {
                                        alert("Interest Already Paid for this Month(s) " + fromDate + " to " + toDate);
                                        document.getElementById("period").value = "";
                                        document.getElementById("toDate").value = "";
                                        return false;
                                    }
                                }
                            }); 
                    
                    
                
           <%-- </c:if>--%>
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
          function selectTenantForInterest()
            {
                myWindow = window.open("../tenant/selectTenantForInterest.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
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
                                <jsp:include page="../login/headerlink.htm?submodule=PenaltyAndInterest&tab=Interest&pagetype=form"/>
                                <div class="x_title">
                                    <h2>Interest Details</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />
                                                                        
                                    <form class="form-inline" id="billform" action="../tenant/interestDetailsFormSubmit.htm"  method="post" enctype="multipart/form-data">
                                        <c:forEach items="${test}" var="list">
                                            <c:if test="${list[0] eq '683'}">
                                                <c:set value="${list[1]}" var="field_1"/>
                                                <c:set value="${list[2]}" var="fieldStatus_1"/>
                                                <c:set value="${list[3]}" var="mand_status_1"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '698'}">
                                                <c:set value="${list[1]}" var="field_698"/>
                                                <c:set value="${list[2]}" var="fieldStatus_698"/>
                                                <c:set value="${list[3]}" var="mand_status_698"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '699'}">
                                                <c:set value="${list[1]}" var="field_699"/>
                                                <c:set value="${list[2]}" var="fieldStatus_699"/>
                                                <c:set value="${list[3]}" var="mand_status_699"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '684'}">
                                                <c:set value="${list[1]}" var="field_2"/>
                                                <c:set value="${list[2]}" var="fieldStatus_2"/>
                                                <c:set value="${list[3]}" var="mand_status_2"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '685'}">
                                                <c:set value="${list[1]}" var="field_3"/>
                                                <c:set value="${list[2]}" var="fieldStatus_3"/>
                                                <c:set value="${list[3]}" var="mand_status_3"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '686'}">
                                                <c:set value="${list[1]}" var="field_4"/>
                                                <c:set value="${list[2]}" var="fieldStatus_4"/>
                                                <c:set value="${list[3]}" var="mand_status_4"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '687'}">
                                                <c:set value="${list[1]}" var="field_5"/>
                                                <c:set value="${list[2]}" var="fieldStatus_5"/>
                                                <c:set value="${list[3]}" var="mand_status_5"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '688'}">
                                                <c:set value="${list[1]}" var="field_6"/>
                                                <c:set value="${list[2]}" var="fieldStatus_6"/>
                                                <c:set value="${list[3]}" var="mand_status_6"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '689'}">
                                                <c:set value="${list[1]}" var="field_7"/>
                                                <c:set value="${list[2]}" var="fieldStatus_7"/>
                                                <c:set value="${list[3]}" var="mand_status_7"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '690'}">
                                                <c:set value="${list[1]}" var="field_8"/>
                                                <c:set value="${list[2]}" var="fieldStatus_8"/>
                                                <c:set value="${list[3]}" var="mand_status_8"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '691'}">
                                                <c:set value="${list[1]}" var="field_9"/>
                                                <c:set value="${list[2]}" var="fieldStatus_9"/>
                                                <c:set value="${list[3]}" var="mand_status_9"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '692'}">
                                                <c:set value="${list[1]}" var="field_10"/>
                                                <c:set value="${list[2]}" var="fieldStatus_10"/>
                                                <c:set value="${list[3]}" var="mand_status_10"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '693'}">
                                                <c:set value="${list[1]}" var="field_11"/>
                                                <c:set value="${list[2]}" var="fieldStatus_11"/>
                                                <c:set value="${list[3]}" var="mand_status_11"/>
                                            </c:if>


                                            <c:if test="${list[0] eq '694'}">
                                                <c:set value="${list[1]}" var="field_12"/>
                                                <c:set value="${list[2]}" var="fieldStatus_12"/>
                                                <c:set value="${list[3]}" var="mand_status_12"/>
                                            </c:if>



                                        </c:forEach> 
                                        <%--<c:if test="${fieldStatus_1 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_1 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_1}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(interestDetails) > 0}">
                                                        <c:forEach items="${interestDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="interestDate" name="interestDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.interestDate}"/>">
                                                                    <input type="hidden" name="pk" value="${list.SNo}">
                                                                    <input type="hidden" name="status" value="${list.status}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" id="interestDate" readonly="" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.interestDate}"/>">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" class="form-control" readonly id="interestDate" name="interestDate" value="<%= (new SimpleDateFormat("dd-MMM-yyyy")).format(new java.util.Date())%>">
                                                    </c:otherwise>        
                                                </c:choose>
                                              </div></c:if>--%>
                                        <c:if test="${fieldStatus_698 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_698 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if> 
                                                <label class="control-label">${field_698}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(interestDetails) > 0}">
                                                        <c:forEach items="${interestDetails}" var="list">
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
                                        <c:if test="${fieldStatus_699 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_699 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if> 
                                                <label class="control-label">${field_699}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(interestDetails) > 0}">
                                                        <c:forEach items="${interestDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="toDate" name="toDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.toDate}"/>" maxlength="20" onclick="javascript:NewCssCal('toDate', 'ddMMMyyyy', '', '', '', '', '')" onchange="checkDates();">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="toDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.toDate}"/>">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" readonly="" placeholder="Select Date" class="form-control" id="toDate" name="toDate" value="" maxlength="20" onclick="javascript:NewCssCal('toDate', 'ddMMMyyyy', '', '', '', '', '')" onchange="checkDates();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>


                                        <%--<c:if test="${fieldStatus_2 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_2 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_2}</label>
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
                                                            <select id="tenantType" name="tenantType" class="form-control validate[required]">
                                                                <option value="" disabled selected>Select your option</option>
                                                                <c:forEach items="${tenantType}" var="type">
                                                                    <option>${type}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>--%>




                                        <c:if test="${fieldStatus_3 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_3 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_3}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(interestDetails) > 0}">
                                                        <c:forEach items="${interestDetails}" var="list">
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
                                                        <input type="text" class="form-control" placeholder="Select Tenant Details" readonly id="tenantCode" name="tenantCode" value="" onclick="return selectTenantForInterest();">
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
                                                    <c:when test="${fn:length(interestDetails) > 0}">
                                                        <c:forEach items="${interestDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    
                                                               
                                                                    
                                                                    <input type="text" class="form-control" readonly="" id="tenantName" name="tenantName" maxlength="40" value="${list.tenantName}" onkeypress="return isNumberKey3(event)" >

                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantName" value="${list.tenantName}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" class="form-control" placeholder="" readonly id="tenantName" name="tenantName" maxlength="40" value="" onkeypress="return isNumberKey3(event)" >

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
                                                    <c:when test="${fn:length(interestDetails) > 0}">
                                                        <c:forEach items="${interestDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="assetNames" name="assetNames" value="${list.assetNames}">
                                                                    <input type="hidden" class="form-control" placeholder="" readonly id="assetNames" name="assetNames" value="${list.assetNames}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="assetNames" value="${list.assetNames}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" class="form-control" placeholder="" readonly id="assetNames" name="assetNames" value="">
                                                        <input type="hidden" class="form-control" placeholder="" readonly id="assetNames" name="assetNames" value="">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>

                                        <%-- <c:if test="${fieldStatus_6 eq 'y'}">
                                             <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                 <c:if test="${mand_status_6 eq 'required'}">
                                                     <a style="color:red;">*</a>
                                                 </c:if><a style="color:transparent;">*</a>
                                                 <label class="control-label">${field_6}</label>
                                                 <c:choose>
                                                     <c:when test="${fn:length(penaltyDetails) > 0}">
                                                         <c:forEach items="${penaltyDetails}" var="list">
                                                             <c:choose>
                                                                 <c:when test="${action eq 'edit'}">
                                                                     <input type="text" class="form-control" readonly="" id="advanceAmount" name="flotNo" value="${list.flotNo}">
                                                                 </c:when>
                                                                 <c:otherwise>
                                                                     <input type="text" class="form-control" readonly="" id="flotNo" value="${list.flotNo}">
                                                                 </c:otherwise> 
                                                             </c:choose>
                                                         </c:forEach>
                                                     </c:when>
                                                     <c:otherwise>                                                    
                                                         <input type="text" class="form-control" placeholder="" readonly id="flotNo" name="flotNo" value="">
                                                     </c:otherwise>        
                                                 </c:choose>

                                            </div></c:if>--%>

                                        <c:if test="${fieldStatus_7 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_7 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_7}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(interestDetails) > 0}">
                                                        <c:forEach items="${interestDetails}" var="list">
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

                                            </div></c:if><p>&nbsp;</p>


                                        <c:if test="${fieldStatus_8 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_8 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_8}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(interestDetails) > 0}">
                                                        <c:forEach items="${interestDetails}" var="list">
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

                                        <c:if test="${fieldStatus_9 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_9 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_9}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(interestDetails) > 0}">
                                                        <c:forEach items="${interestDetails}" var="list">
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


                                        <c:if test="${fieldStatus_10 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_10 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_10}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(interestDetails) > 0}">
                                                        <c:forEach items="${interestDetails}" var="list">
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

                                            </div></c:if><p>&nbsp;</p>

                                        <c:if test="${fieldStatus_6 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_6 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_6}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(interestDetails) > 0}">
                                                        <c:forEach items="${interestDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="advanceAmount" name="advanceAmount" value="${list.advanceAmount}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="advanceAmount" value="${list.advanceAmount}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" class="form-control" placeholder="" readonly id="advanceAmount" name="advanceAmount" value="">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                            
                                        <c:if test="${fieldStatus_11 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_11 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_11}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(interestDetails) > 0}">
                                                        <c:forEach items="${interestDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" id="interestPer" name="interestPer" maxlength="15" value="${list.interestPer}" onkeypress="return isNumberKey3(event)"   onchange="TotalCalc();">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="interestPer" value="${list.interestPer}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" id="interestPer" name="interestPer" maxlength="15" value="" onkeypress="return isNumberKey3(event)"   onchange="TotalCalc();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>


                                        <c:if test="${fieldStatus_12 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_12 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_12}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(interestDetails) > 0}">
                                                        <c:forEach items="${interestDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="interestAmount" name="interestAmount" maxlength="15" value="${list.interestAmount}" onkeypress="return isNumberKey3(event)" onchange="fetchCrno();">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="interestAmount" value="${list.interestAmount}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" readonly id="interestAmount" name="interestAmount" maxlength="15" value="" onkeypress="return isNumberKey3(event)" onchange="fetchCrno();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>

                                            <p>&nbsp;</p>                                        
                                            <p>&nbsp;</p>
                                        <c:if test="${action ne 'view'}">
                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                <button type="button" class="btn btn-primary" style="" onclick="return mandTest();"  onkeyup="firstToUpperCase1();">Save</button>
                                                <!--<button type="submit" class="btn btn-primary" style="" >Save</button>-->
                                                <a href="../tenant/interestDetailsList.htm" class="btn btn-danger">Cancel</a>
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
