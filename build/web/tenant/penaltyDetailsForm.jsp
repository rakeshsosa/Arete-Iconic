<%-- 
    Document   : penaltyDetailsForm
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
                var penaltyM = document.getElementById("penaltyType").value &&
                        document.getElementById("tenantCode").value &&
                        document.getElementById("penaltyamount").value;

                if (penaltyM == '')
                {
                    alert("Please Fill Mandatory Fields in Penalty Details");
                    return false;
                }

                else {
                    document.forms["penaltform"].submit();
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

            function selectTenant()
            {
                myWindow = window.open("../tenant/selectTenant.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }


            function selectPenaltyType()
            {
                myWindow = window.open("../tenant/selectPenaltyType.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }

            function TotalAmt() {
                document.getElementById("totalAmount").value = document.getElementById("penaltyamount").value;
            }

            function TotalCalc() {
                var penaltyamount = parseFloat(document.getElementById("penaltyamount").value);
                if (penaltyamount == '0') {
                    alert("Invalid Amount..");
                    return false;
                }
                else {
                    Totcalc();
                    return true;
                }
            }

            function Totcalc() {
                var penaltyamount = parseFloat(document.getElementById("penaltyamount").value);
                var interestPer = parseFloat(document.getElementById("interestPer").value);
                var interestAmount = penaltyamount * interestPer / 100;
                document.getElementById("totalAmount").value = penaltyamount + interestAmount;
            }

            function checkDates1() {

                var fromDate = document.getElementById("penaltyFromDate").value;
                var toDate = document.getElementById("penaltyToDate").value;

                var actD = fromDate.split("-");
                var inA = toDate.split("-");
                var or = new Date(actD[1] + '/' + actD[0] + '/' + actD[2]);
                var trd = new Date(inA[1] + '/' + inA[0] + '/' + inA[2]);
                if (trd < or) {
                    alert("To Date should be Greater Than From Date.");
                    document.getElementById("penaltyFromDate").value = '';
                    document.getElementById("penaltyToDate").value = '';
                    return false;
                }
            }

            function test()
            {
                var inper = document.getElementById("interestPer").value;
                var inper1 = document.getElementById("interestPer1").value;

                if (inper !== inper1) {
                    if (confirm('Do you really want to Save this updated record')) {
                        document.forms["penaltform"].submit();
                        return true;
                    } else {
                        return true;
                    }

                } else {
                    document.forms["penaltform"].submit();
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
                                <jsp:include page="../login/headerlink.htm?submodule=Penalty&tab=Penalty&pagetype=form"/>
                                <div class="x_title">
                                    <h2>Penalty Details</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />
                                    <form class="form-inline" id="penaltform" action="../tenant/penaltyDetailsFormSubmit.htm"  method="post" enctype="multipart/form-data">
                                        <c:choose>
                                            <c:when test="${fn:length(penaltyDetails) > 0}">
                                                <c:forEach items="${penaltyDetails}" var="list">
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
                                            <c:if test="${list[0] eq '625'}">
                                                <c:set value="${list[1]}" var="field_1"/>
                                                <c:set value="${list[2]}" var="fieldStatus_1"/>
                                                <c:set value="${list[3]}" var="mand_status_1"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '626'}">
                                                <c:set value="${list[1]}" var="field_2"/>
                                                <c:set value="${list[2]}" var="fieldStatus_2"/>
                                                <c:set value="${list[3]}" var="mand_status_2"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '627'}">
                                                <c:set value="${list[1]}" var="field_3"/>
                                                <c:set value="${list[2]}" var="fieldStatus_3"/>
                                                <c:set value="${list[3]}" var="mand_status_3"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '628'}">
                                                <c:set value="${list[1]}" var="field_4"/>
                                                <c:set value="${list[2]}" var="fieldStatus_4"/>
                                                <c:set value="${list[3]}" var="mand_status_4"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '629'}">
                                                <c:set value="${list[1]}" var="field_5"/>
                                                <c:set value="${list[2]}" var="fieldStatus_5"/>
                                                <c:set value="${list[3]}" var="mand_status_5"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '632'}">
                                                <c:set value="${list[1]}" var="field_6"/>
                                                <c:set value="${list[2]}" var="fieldStatus_6"/>
                                                <c:set value="${list[3]}" var="mand_status_6"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '633'}">
                                                <c:set value="${list[1]}" var="field_7"/>
                                                <c:set value="${list[2]}" var="fieldStatus_7"/>
                                                <c:set value="${list[3]}" var="mand_status_7"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '634'}">
                                                <c:set value="${list[1]}" var="field_8"/>
                                                <c:set value="${list[2]}" var="fieldStatus_8"/>
                                                <c:set value="${list[3]}" var="mand_status_8"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '635'}">
                                                <c:set value="${list[1]}" var="field_9"/>
                                                <c:set value="${list[2]}" var="fieldStatus_9"/>
                                                <c:set value="${list[3]}" var="mand_status_9"/>
                                            </c:if>

                                            <c:if test="${list[0] eq '630'}">
                                                <c:set value="${list[1]}" var="field_29"/>
                                                <c:set value="${list[2]}" var="fieldStatus_29"/>
                                                <c:set value="${list[3]}" var="mand_status_29"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '631'}">
                                                <c:set value="${list[1]}" var="field_30"/>
                                                <c:set value="${list[2]}" var="fieldStatus_30"/>
                                                <c:set value="${list[3]}" var="mand_status_30"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '636'}">
                                                <c:set value="${list[1]}" var="field_31"/>
                                                <c:set value="${list[2]}" var="fieldStatus_31"/>
                                                <c:set value="${list[3]}" var="mand_status_31"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '700'}">
                                                <c:set value="${list[1]}" var="field_32"/>
                                                <c:set value="${list[2]}" var="fieldStatus_32"/>
                                                <c:set value="${list[3]}" var="mand_status_32"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '701'}">
                                                <c:set value="${list[1]}" var="field_33"/>
                                                <c:set value="${list[2]}" var="fieldStatus_33"/>
                                                <c:set value="${list[3]}" var="mand_status_33"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '702'}">
                                                <c:set value="${list[1]}" var="field_34"/>
                                                <c:set value="${list[2]}" var="fieldStatus_34"/>
                                                <c:set value="${list[3]}" var="mand_status_34"/>
                                            </c:if>


                                        </c:forEach> 

                                        <c:if test="${fieldStatus_1 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_1 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if> 
                                                <label class="control-label">${field_1}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(penaltyDetails) > 0}">
                                                        <c:forEach items="${penaltyDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="penaltyFromDate" name="penaltyFromDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.penaltyFromDate}"/>" maxlength="20" onclick="javascript:NewCssCal('penaltyFromDate', 'ddMMMyyyy', '', '', '', '', '')" >
                                                                    <input type="hidden" name="pk" value="${list.SNo}">
                                                                    <input type="hidden" name="month" value="">
                                                                    <input type="hidden" name="year" value="">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="penaltyFromDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.penaltyFromDate}"/>">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when> 
                                                    <c:otherwise>                                                    
                                                        <input type="text" readonly="" placeholder="Select Date" class="form-control" id="penaltyFromDate" name="penaltyFromDate" value="" maxlength="20" onclick="javascript:NewCssCal('penaltyFromDate', 'ddMMMyyyy', '', '', '', '', '')" >
                                                        <input type="hidden" name="month" value="">
                                                        <input type="hidden" name="year" value="">

                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>       

                                        <c:if test="${fieldStatus_34 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_34 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if> 
                                                <label class="control-label">${field_34}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(penaltyDetails) > 0}">
                                                        <c:forEach items="${penaltyDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="penaltyToDate" name="penaltyToDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.penaltyToDate}"/>" maxlength="20" onclick="javascript:NewCssCal('penaltyToDate', 'ddMMMyyyy', '', '', '', '', '')" onchange="checkDates1();">
                                                                    <input type="hidden" name="month" value="">
                                                                    <input type="hidden" name="year" value="">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="penaltyToDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.penaltyToDate}"/>">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when> 
                                                    <c:otherwise>                                                    
                                                        <input type="text" readonly="" placeholder="Select Date" class="form-control" id="penaltyToDate" name="penaltyToDate" value="" maxlength="20" onclick="javascript:NewCssCal('penaltyToDate', 'ddMMMyyyy', '', '', '', '', '')" onchange="checkDates1();">
                                                        <input type="hidden" name="month" value="">
                                                        <input type="hidden" name="year" value="">

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
                                                    <c:when test="${fn:length(penaltyDetails) > 0}">
                                                        <c:forEach items="${penaltyDetails}" var="list">
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
                                                        <input type="text" class="form-control" placeholder="Select Tenant Details" readonly id="tenantCode" name="tenantCode" value="" onclick="return selectTenant();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                            <p>&nbsp;</p>
                                        <c:if test="${fieldStatus_4 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_4 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_4}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(penaltyDetails) > 0}">
                                                        <c:forEach items="${penaltyDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="tenantName" name="tenantName" maxlength="40" value="${list.tenantName}" >

                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="tenantName" value="${list.tenantName}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" class="form-control" placeholder="" readonly id="tenantName" name="tenantName" maxlength="40" value="" >

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
                                                    <c:when test="${fn:length(penaltyDetails) > 0}">
                                                        <c:forEach items="${penaltyDetails}" var="list">
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
                                        <c:if test="${fieldStatus_29 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_29 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if><a style="color:transparent;">*</a>
                                                <label class="control-label">${field_29}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(penaltyDetails) > 0}">
                                                        <c:forEach items="${penaltyDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="subassetCode" name="subassetCode" value="${list.subassetCode}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="subassetCode" value="${list.subassetCode}">
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
                                                    <c:when test="${fn:length(penaltyDetails) > 0}">
                                                        <c:forEach items="${penaltyDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="flotNo" name="flotNo" value="${list.flotNo}">
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

                                            </div></c:if>
                                        <c:if test="${fieldStatus_6 eq 'y'}">
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
                                                    <c:when test="${fn:length(penaltyDetails) > 0}">
                                                        <c:forEach items="${penaltyDetails}" var="list">
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
                                                    <c:when test="${fn:length(penaltyDetails) > 0}">
                                                        <c:forEach items="${penaltyDetails}" var="list">
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
                                                    <c:when test="${fn:length(penaltyDetails) > 0}">
                                                        <c:forEach items="${penaltyDetails}" var="list">
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

                                        <c:if test="${fieldStatus_2 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_2 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_2}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(penaltyDetails) > 0}">
                                                        <c:forEach items="${penaltyDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="penaltyType" name="penaltyType" maxlength="50" value="${list.penaltyType}" onblur="TotalAmt()">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="penaltyType" value="${list.penaltyType}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" readonly="" placeholder="Select Penalty Type" class="form-control" id="penaltyType" name="penaltyType" maxlength="50" value="" onclick="return selectPenaltyType();" onblur="TotalAmt()">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                            <p>&nbsp;</p> 
                                        <c:if test="${fieldStatus_31 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_31 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_31}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(penaltyDetails) > 0}">
                                                        <c:forEach items="${penaltyDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" id="penaltyamount" readonly="" name="penaltyamount" maxlength="15" value="${list.penaltyamount}" onkeypress="return isNumberKey(event)" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="penaltyamount" value="${list.penaltyamount}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" readonly="" placeholder="" class="form-control" id="penaltyamount" name="penaltyamount" maxlength="15" value="" onkeypress="return isNumberKey(event)" >
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
                                                    <c:when test="${fn:length(penaltyDetails) > 0}">
                                                        <c:forEach items="${penaltyDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" id="interestPer" name="interestPer" maxlength="15" value="${list.interestPer}" onkeypress="return isNumberKey(event)"   onchange="TotalCalc();">
                                                                    <input type="hidden" class="form-control" id="interestPer1" name="interestPer1" maxlength="15" value="${list.interestPer}" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="interestPer" value="${list.interestPer}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" id="interestPer" name="interestPer" maxlength="15" value="" onkeypress="return isNumberKey(event)"   onchange="TotalCalc();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>

                                        <c:if test="${fieldStatus_33 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_33 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_33}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(penaltyDetails) > 0}">
                                                        <c:forEach items="${penaltyDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="totalAmount" name="totalAmount" maxlength="15" value="${list.totalAmount}" onkeypress="return isNumberKey3(event)" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="interestAmount" value="${list.totalAmount}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" readonly id="totalAmount" name="totalAmount" maxlength="15" value="" onkeypress="return isNumberKey3(event)" >
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>
                                            <p>&nbsp;</p>                                        
                                            <p>&nbsp;</p> 

                                        <c:if test="${action ne 'view' && action ne 'edit'}">
                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                <button type="button" class="btn btn-primary" style="" onclick="return mandTest();">Save</button>
                                                <a href="../tenant/penaltyDetailsList.htm" class="btn btn-danger">Cancel</a>
                                            </div>
                                        </c:if>
                                        <c:if test="${action eq 'edit'  }">

                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                                <button type="button" class="btn btn-primary" style="" onclick="return test();">Save</button>
                                                <a href="../tenant/penaltyDetailsList.htm" class="btn btn-danger">Cancel</a>
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
