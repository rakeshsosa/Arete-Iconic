<%-- 
    Document   : dailyWorkSheetForm
    Created on : 6 Oct, 2016, 3:57:28 PM
    Author     : ebs-sdd27
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../common/validate/validationEngine.css" type="text/css">
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript" charset="utf-8"></script>
        <script src="../common/validate/jquery.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript" src="../common/csspopup.js"></script>
        <script type="text/javascript" src="../common/datepicker/datetimepicker_css_2.js"></script>
        <link rel="stylesheet" type="text/css" href="../common/Timepicker/jquery.timepicker.css" /> 
        <script type="text/javascript" src="../common/Timepicker/jquery.timepicker.js"></script> 
        <link href="../common/theme/css/disableSelection.css" rel="stylesheet" type="text/css"/>

        <!--<link rel="stylesheet" type="text/css" href="../common/Time/css/time.css" />--> 

        <title>arête Assets Management</title>
        <script type="text/javascript">

            function selectLead()
            {

                myWindow = window.open("../CRM/selectLead.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }

            function test12()
            {
                var x = document.getElementById("empName").value &&
                        document.getElementById("empCode").value &&
                        document.getElementById("leadName").value;

                if (x == '')
                {
                    alert("Please Fill Mandatory Fields");
                    return false;
                }

                else {
                    document.forms["dailyworkshtForm"].submit();
                }

            }

            function validatedate() {
                var x = $("#timeIn").val();
                var y = $("#timeOut").val();

                if (y == null || y == "")
                {

                }
                else if (x >= y) {
                    alert("Time Out Should Be Greater Than Time In.");

                    $("#timeIn").val("");
                    $("#timeOut").val("");

                }
            }



            function validatedate1() {
                var y = $("#inTime").val();
                var x = $("#outTime").val();



                if (y >= x) {
                    alert("In Date Should Be Less Than Out Date");
                    $("#inTime").val("");
                    $("#outTime").val("");
                }


            }
            function TimeDiff()
            {
                var a = document.getElementById('timeOut').value;
                var b = document.getElementById('timeIn').value;
                var first = a.split(":")
                var second = b.split(":")
                var xx;
                var yy;
                if (parseInt(first[0]) < parseInt(second[0])) {
                    if (parseInt(first[1]) < parseInt(second[1])) {
                        yy = parseInt(first[1]) + 60 - parseInt(second[1]);
                        xx = parseInt(first[0]) + 24 - 1 - parseInt(second[0])
                    } else {
                        yy = parseInt(first[1]) - parseInt(second[1]);
                        xx = parseInt(first[0]) + 24 - parseInt(second[0])
                    }
                } else if (parseInt(first[0]) === parseInt(second[0])) {
                    if (parseInt(first[1]) < parseInt(second[1])) {
                        yy = parseInt(first[1]) + 60 - parseInt(second[1]);
                        xx = parseInt(first[0]) + 24 - 1 - parseInt(second[0])
                    } else {
                        yy = parseInt(first[1]) - parseInt(second[1]);
                        xx = parseInt(first[0]) - parseInt(second[0])
                    }
                } else {
                    if (parseInt(first[1]) < parseInt(second[1])) {
                        yy = parseInt(first[1]) + 60 - parseInt(second[1]);
                        xx = parseInt(first[0]) - 1 - parseInt(second[0])
                    } else {
                        yy = parseInt(first[1]) - parseInt(second[1]);
                        xx = parseInt(first[0]) - parseInt(second[0])
                    }
                }
                if (xx < 10)
                    xx = "0" + xx;
                if (yy < 10)
                    yy = "0" + yy;

            }

            function TimeGreater()
            {

                var b = document.getElementById('timeIn').value;
                var a = document.getElementById('timeOut').value;
                if (b == "")
                {
                    alert("Please Enter TimeIn First.")
                    $('#timeOut').val('');
                }
                if (a <= b) {

                    alert("Time Out Should Be Greater Than Time In.");
                    $('#timeOut').val('');
                    return false;
                }
            }

        </script>
    </head>

    <% java.util.Date d = new java.util.Date();%>
    <body class="nav-sm">

        <div class="container body">


            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">


                        <div class="clearfix"></div>





                        <div class="col-md-6 col-xs-12">
                            <div class="x_panel">
                                <jsp:include page="../login/headerlink.htm?submodule=Worksheet&tab=Daily Worksheet&pagetype=form"/>
                                <div class="x_title">
                                    <h2>Daily Worksheet List</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />
                                    <c:forEach items="${dailyWorkSheetData}" var="list">
                                        <c:if test="${list[0] eq '367'}">
                                            <c:set value="${list[1]}" var="field_1"/>
                                            <c:set value="${list[2]}" var="fieldStatus_1"/>
                                            <c:set value="${list[3]}" var="mand_status_1"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '368'}">
                                            <c:set value="${list[1]}" var="field_2"/>
                                            <c:set value="${list[2]}" var="fieldStatus_2"/>
                                            <c:set value="${list[3]}" var="mand_status_2"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '369'}">
                                            <c:set value="${list[1]}" var="field_3"/>
                                            <c:set value="${list[2]}" var="fieldStatus_3"/>
                                            <c:set value="${list[3]}" var="mand_status_3"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '370'}">
                                            <c:set value="${list[1]}" var="field_4"/>
                                            <c:set value="${list[2]}" var="fieldStatus_4"/>
                                            <c:set value="${list[3]}" var="mand_status_4"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '371'}">
                                            <c:set value="${list[1]}" var="field_5"/>
                                            <c:set value="${list[2]}" var="fieldStatus_5"/>
                                            <c:set value="${list[3]}" var="mand_status_5"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '372'}">
                                            <c:set value="${list[1]}" var="field_6"/>
                                            <c:set value="${list[2]}" var="fieldStatus_6"/>
                                            <c:set value="${list[3]}" var="mand_status_6"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '373'}">
                                            <c:set value="${list[1]}" var="field_7"/>
                                            <c:set value="${list[2]}" var="fieldStatus_7"/>
                                            <c:set value="${list[3]}" var="mand_status_7"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '374'}">
                                            <c:set value="${list[1]}" var="field_8"/>
                                            <c:set value="${list[2]}" var="fieldStatus_8"/>
                                            <c:set value="${list[3]}" var="mand_status_8"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '375'}">
                                            <c:set value="${list[1]}" var="field_9"/>
                                            <c:set value="${list[2]}" var="fieldStatus_9"/>
                                            <c:set value="${list[3]}" var="mand_status_9"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '376'}">
                                            <c:set value="${list[1]}" var="field_10"/>
                                            <c:set value="${list[2]}" var="fieldStatus_10"/>
                                            <c:set value="${list[3]}" var="mand_status_10"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '138'}">
                                            <c:set value="${list[1]}" var="field_11"/>
                                            <c:set value="${list[2]}" var="fieldStatus_11"/>
                                            <c:set value="${list[3]}" var="mand_status_11"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '138'}">
                                            <c:set value="${list[1]}" var="field_12"/>
                                            <c:set value="${list[2]}" var="fieldStatus_12"/>
                                            <c:set value="${list[3]}" var="mand_status_12"/>
                                        </c:if>
                                    </c:forEach>


                                    <form class="form-inline" id="dailyworkshtForm" accept-charset="UTF-8" method="post" action="../CRM/dailyWorkshtFormSubmit.htm" onsubmit="return  test12();" >
                                        <c:if test="${fieldStatus_1 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_1 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_1}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(dailyWorkSheet) > 0}">
                                                        <c:forEach items="${dailyWorkSheet}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="empName" name="empName" class="form-control" maxlength="30" value="${type.empName}">
                                                                    <input name="sno" type="hidden" value="${type.sno}">
                                                                    <input name="status" type="hidden" value="${type.status}">

                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="empName"  name="empName" readonly class="form-control" value="${type.empName}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" id="empName" name="empName" maxlength="30" class="form-control" value="">
                                                        <input name="dwsCode" type="hidden" value="">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                        </c:if>


                                        <c:if test="${fieldStatus_2 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_2 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_2}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(dailyWorkSheet) > 0}">
                                                        <c:forEach items="${dailyWorkSheet}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="empCode" name="empCode" maxlength="15" class="form-control" value="${type.empCode}">


                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="empCode"  name="empCode" readonly class="form-control" value="${type.empCode}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" id="empCode" name="empCode" maxlength="15" class="form-control" value="">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                        </c:if>


                                        <c:if test="${fieldStatus_3 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_3 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_3}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(dailyWorkSheet) > 0}">
                                                        <c:forEach items="${dailyWorkSheet}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="sheetDate" name="sheetDate" onmouseover="" style="cursor: pointer;" class="form-control" onclick="javascript:NewCssCal('sheetDate', 'ddMMMyyyy', '', '', '', '', 'past')" value="<fmt:formatDate pattern="dd-MMM-YYYY"  value="${type.sheetDate}"/>">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="sheetDate" name="sheetDate" readonly class="form-control" value="<fmt:formatDate pattern="dd-MMM-YYYY"  value="${type.date}"/>">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach> 
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" id="sheetDate" name="sheetDate" readonly="" onmouseover="" style="cursor: pointer;" value=""  placeholder="Select Date" class="form-control" onclick="javascript:NewCssCal('sheetDate', 'ddMMMyyyy', '', '', '', '', 'past')" >
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                        </c:if>
                                        <p>&nbsp;</p>
                                        <c:if test="${fieldStatus_4 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_4 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_4}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(dailyWorkSheet) > 0}">
                                                        <c:forEach items="${dailyWorkSheet}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="hidden" id="leadName" name="leadName1" class="form-control" value="${type.leadName}">
                                                                    <input type="text" id="firstName" name="leadName" maxlength="30" readonly="" class="form-control" value="${type.leadName}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="leadName"  name="leadName" readonly="" class="form-control" value="${type.leadName}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="hidden" id="leadCode" name="leadName1" class="form-control" onclick="selectLead();">
                                                        <input type="text" id="leadName" name="leadName"  class="form-control" maxlength="30" value=""  placeholder="">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>

                                        <c:if test="${fieldStatus_5 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_5 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_5}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(dailyWorkSheet) > 0}">
                                                        <c:forEach items="${dailyWorkSheet}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="timeIn" name="timeIn"  class="form-control" value="${type.inTime}"/>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="timeIn" name="timeIn" readonly="" class="form-control" value="${type.timeIn}"/>
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" id="timeIn" name="timeIn" placeholder="Select Time In" onchange="return validatedate();" class="form-control" value=""  >
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                        </c:if>

                                        <c:if test="${fieldStatus_6 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_6 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_6}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(dailyWorkSheet) > 0}">
                                                        <c:forEach items="${dailyWorkSheet}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="timeOut" name="timeOut"  class="form-control" value="${type.outTime}"/>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="timeOut" name="timeOut" readonly="" class="form-control" value="${type.timeOut}"/>
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <!--onclick="javascript:NewCssCal('timeOut', 'ddMMMyyyy', '', 'true', '', '', 'future');"              onchange="return validatedate1();"-->
                                                        <input type="text"  id="timeOut" name="timeOut" placeholder="Select Time Out" class="form-control" value="" onchange="TimeGreater();"   >
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                        </c:if>                                      
                                        <p>&nbsp;</p>

                                        <c:if test="${fieldStatus_7 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_7 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_7}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(dailyWorkSheet) > 0}">
                                                        <c:forEach items="${dailyWorkSheet}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="followUp" name="followUp"  readonly=""  class="form-control"  value="<fmt:formatDate pattern="dd-MMM-YYYY"  value="${type.followUp}"/>">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="followUp"  name="followUp" readonly="" value="<fmt:formatDate pattern="dd-MMM-YYYY"  value="${type.followUpDate}"/>" class="form-control">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" id="followUp" name="followUp" readonly="" placeholder="Select Date" class="form-control" onclick="javascript:NewCssCal('followUp', 'ddMMMyyyy', '', '', '', '', 'past');">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_8 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_8 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_8}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(dailyWorkSheet) > 0}">
                                                        <c:forEach items="${dailyWorkSheet}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <textarea class="form-control" style="resize: none" rows="1" name="history" maxlength="200" id="history" type="text" value="${type.specRemarks}" >${type.specRemarks} </textarea>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <textarea class="form-control" style="resize: none" rows="1" maxlength="200" readonly type="text" value="${type.followUpHistory}">${type.followUpHistory}</textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <textarea class="form-control" style="resize: none" value="" rows="1" maxlength="200" name="followUpHistory" id="followUpHistory" type="text"></textarea>



                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                        </c:if>

                                        <c:if test="${fieldStatus_9 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_9 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_9}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(dailyWorkSheet) > 0}">
                                                        <c:forEach items="${dailyWorkSheet}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <select class="form-control" id="stage" ${mand_status_9} name="stage" value="">
                                                                        <option>${type.stage}</option>
                                                                        <c:forEach items="${dailyWorkSheetData_dropDown_category}" var="list">
                                                                            <c:if test="${list[0] eq 'F-14'}">
                                                                                <option>${list[1]}</option>                                     
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </select>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input name="stage" class="form-control" type="text" readonly value="${type.stage}">
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <select class="form-control" id="stage" ${mand_status_9} name="stage" value="" >
                                                            <option value="" disabled selected>Select your option</option>
                                                            <c:forEach items="${dailyWorkSheetData_dropDown_category}" var="list">
                                                                <c:if test="${list[0] eq 'F-14'}">
                                                                    <option>${list[1]}</option>                                     
                                                                </c:if>
                                                            </c:forEach>                                                                              
                                                        </select>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <p>&nbsp;</p>

                                        <c:if test="${fieldStatus_10 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_10 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_10}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(dailyWorkSheet) > 0}">
                                                        <c:forEach items="${dailyWorkSheet}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <textarea class="form-control" style="resize: none" rows="1" name="remarks" maxlength="200" id="remarks" type="text" value="${type.remarks}" >${type.remarks} </textarea>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <textarea class="form-control" style="resize: none" rows="1" maxlength="200" readonly type="text" value="${type.remarks}">${type.remarks}</textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <textarea class="form-control" style="resize: none" value="" rows="1" maxlength="200" name="remarks" id="remarks" type="text"></textarea>



                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                        </c:if>



                                        <p>&nbsp;</p>
                                        <div class="clearfix"></div>
                                </div> 
                                <p>&nbsp;</p>
                                <!--                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                                                    <button type="submit" class="btn btn-primary" style="padding-right: 30px;padding-left: 30px;" > Save </button>
                                                                    <a href="../CRM/dailyWorkshtList.jsp"  class="btn btn-primary"  style="padding-right: 30px;padding-left: 30px;">Cancel</a>
                                                                </div>
                                                            </div>-->
                                <c:if test="${action ne 'view'}">
                                    <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                        <button type="submit" class="btn btn-primary" style="" > Save </button>
                                        <a href="../CRM/dailyWorkSheet.htm"  class="btn btn-danger"  style="">Cancel</a>
                                    </div>
                                </c:if>

                                </form>

                            </div>
                        </div>
                    </div>

                    <div class="clearfix"></div>

                    <br/>


                    <div class="clearfix"></div>

                    <div class="clearfix"></div>                

                    <!-- /page content -->

                </div>

            </div>
        </div>

        <div id="custom_notifications" class="custom-notifications dsp_none">
            <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
            </ul>
            <div class="clearfix"></div>
            <div id="notif-group" class="tabbed_notifications"></div>
        </div>
        <script>
            NProgress.done();
        </script>
        <script>
            jQuery(document).ready(function () {
                //                    $("#othr").toggle();
                //                    $("#members").toggle();
                //                    $("#dailywork").toggle();
                //                    $("#monthlywork").toggle();
                $("#dailyworkshtForm").validationEngine();

                //                $('#timeIn').timepicker({'timeFormat': 'H:i'});
                //                $('#timeOut').timepicker({'timeFormat': 'H:i'});
                $('#timeOut').timepicker({'timeFormat': 'H:i', 'disableTextInput': true});
                $('#timeIn').timepicker({'timeFormat': 'H:i', 'disableTextInput': true});

                $("input").on("keypress", function (e) {
                    if (e.which === 32 && !this.value.length)
                        e.preventDefault();



                });


            });
        </script>
        <style>
            .timepicker_wrap {width: 292px;
            } 
            .timepicki-input {width: 72px;
                              -webkit-user-select: none;
                              -moz-user-select: none;
                              -ms-user-select: none;
                              -o-user-select: none; 
                              user-select: none;   }
        </style>
        <script src="../CRM/general-crm_scripts.js" type="text/javascript"></script>
        <script src="../CRM/mioinvoice-crm-scripts.js" type="text/javascript"></script>
    </body>

</html>
