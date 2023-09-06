<%-- 
    Document   : monthlyWorkSheetForm
    Created on : 6 Oct, 2016, 3:57:44 PM
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
        <!--<link rel="stylesheet" href="../common/validate/validationEngine.css" type="text/css">-->
        <!--<script src="../common/validate/jquery-1.js" type="text/javascript"></script>-->
        <!--<script src="../common/validate/jquery_002.js" type="text/javascript" charset="utf-8"></script>-->
        <!--<script src="../common/validate/jquery.js" type="text/javascript" charset="utf-8"></script>-->
        <!--<script type="text/javascript" src="../common/csspopup.js"></script>-->
        <script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>
        <link href="../common/theme/css/disableSelection.css" rel="stylesheet" type="text/css"/>

        <title>arête Assets Management</title>
        <script type="text/javascript">
            jQuery(document).ready(function () {

                jQuery("#monthlyworkplanForm").validationEngine();


            });
            function deleteRow(btndel) {
                if ($("tr").length <= 2) {
                    alert('You cannot delete this row');
                    return false;
                } else {
                    $(btndel).closest("tr").remove();
                    return true;
                }
            }

            function loadAgeSelector()
            {
                var startyear = 1900;
                var endyear = new Date().getFullYear();


                for (var i = startyear; i <= endyear; i++) {
                    node = document.createElement("Option");
                    textnode = document.createTextNode(i);
                    node.appendChild(textnode);
                    document.getElementById("workYear").appendChild(node);
                }
                $("#workYear").val();
                myFunction();

            }


            function myFunction() {
                var month = new Array();
                month[0] = "January";
                month[1] = "February";
                month[2] = "March";
                month[3] = "April";
                month[4] = "May";
                month[5] = "June";
                month[6] = "July";
                month[7] = "August";
                month[8] = "September";
                month[9] = "October";
                month[10] = "November";
                month[11] = "December";

                var d = new Date();
                var n = month[d.getMonth()];
                //  $("#workMonth").append(new Option(n, n));
                //  document.getElementById("workMonth").innerHTML = n;

            }

            function checkdate() {
                var x = document.getElementById("workMonth").value;
                var $itemRow = $('#DayTable tr:last');

                if (x === 'January') {
                    var startday = "1";
                    var endday = "31";

                    for (var i = startday; i <= endday; i++) {

                        $itemRow.find("#workDate1").append(new Option(i, i));

                    }
                    //$itemRow.find("#workDate1 option").remove();

                }

                if (x === 'April') {
                    var startday = "1";
                    var endday = "30";



                    for (var i = startday; i <= endday; i++) {
                        node = document.createElement("Option");
                        textnode = document.createTextNode(i);
                        node.appendChild(textnode);
                        document.getElementById("workDate1").appendChild(node);

                    }
                }

            }



            function checkavl(test)
            {
                if (test === 'January' || test === 'March' || test === 'May' ||
                        test === 'July' || test === 'August' || test === 'October' || test === 'December')
                {

                    $("#exampleabc1").show();
                    $("#exampleabc2").show();
                    $("#exampleabc3").show();
                    $("#exampleabc4").show();
                    $("#exampleabc5").show();
                    $("#exampleabc6").show();
                    $("#exampleabc7").show();
                    $("#exampleabc8").show();
                    $("#exampleabc9").show();
                    $("#exampleabc10").show();
                    $("#exampleabc11").show();
                    $("#exampleabc12").show();
                    $("#exampleabc13").show();
                    $("#exampleabc14").show();
                    $("#exampleabc15").show();
                    $("#exampleabc16").show();
                    $("#exampleabc17").show();
                    $("#exampleabc18").show();
                    $("#exampleabc19").show();
                    $("#exampleabc20").show();
                    $("#exampleabc21").show();
                    $("#exampleabc22").show();
                    $("#exampleabc23").show();
                    $("#exampleabc24").show();
                    $("#exampleabc25").show();
                    $("#exampleabc26").show();
                    $("#exampleabc27").show();
                    $("#exampleabc28").show();
                    $("#exampleabc29").show();
                    $("#exampleabc30").show();
                    $("#exampleabc31").show();

                }
                else if (test === 'February')
                {

                    $("#exampleabc1").show();
                    $("#exampleabc2").show();
                    $("#exampleabc3").show();
                    $("#exampleabc4").show();
                    $("#exampleabc5").show();
                    $("#exampleabc6").show();
                    $("#exampleabc7").show();
                    $("#exampleabc8").show();
                    $("#exampleabc9").show();
                    $("#exampleabc10").show();
                    $("#exampleabc11").show();
                    $("#exampleabc12").show();
                    $("#exampleabc13").show();
                    $("#exampleabc14").show();
                    $("#exampleabc15").show();
                    $("#exampleabc16").show();
                    $("#exampleabc17").show();
                    $("#exampleabc18").show();
                    $("#exampleabc19").show();
                    $("#exampleabc20").show();
                    $("#exampleabc21").show();
                    $("#exampleabc22").show();
                    $("#exampleabc23").show();
                    $("#exampleabc24").show();
                    $("#exampleabc25").show();
                    $("#exampleabc26").show();
                    $("#exampleabc27").show();
                    $("#exampleabc28").show();
                    $("#exampleabc29").hide();
                    $("#exampleabc30").hide();
                    $("#exampleabc31").hide();
                }

                else if (test === 'April' || test === 'June' || test === 'September' || test === 'November')
                {

                    $("#exampleabc1").show();
                    $("#exampleabc2").show();
                    $("#exampleabc3").show();
                    $("#exampleabc4").show();
                    $("#exampleabc5").show();
                    $("#exampleabc6").show();
                    $("#exampleabc7").show();
                    $("#exampleabc8").show();
                    $("#exampleabc9").show();
                    $("#exampleabc10").show();
                    $("#exampleabc11").show();
                    $("#exampleabc12").show();
                    $("#exampleabc13").show();
                    $("#exampleabc14").show();
                    $("#exampleabc15").show();
                    $("#exampleabc16").show();
                    $("#exampleabc17").show();
                    $("#exampleabc18").show();
                    $("#exampleabc19").show();
                    $("#exampleabc20").show();
                    $("#exampleabc21").show();
                    $("#exampleabc22").show();
                    $("#exampleabc23").show();
                    $("#exampleabc24").show();
                    $("#exampleabc25").show();
                    $("#exampleabc26").show();
                    $("#exampleabc27").show();
                    $("#exampleabc28").show();
                    $("#exampleabc29").show();
                    $("#exampleabc30").show();
                    $("#exampleabc31").hide();
                }


            }
            function test12()
            {
                var x = document.getElementById("division").value &&
                        document.getElementById("empCode").value &&
                        document.getElementById("empName").value &&
                        document.getElementById("designation").value &&
                        document.getElementById("workYear").value
                document.getElementById("workMonth").value;

                if (x == '')
                {
                    alert("Please Fill Mandatory Fields");
                    return false;
                }

                else {
                    document.forms["monthlyworkplanForm"].submit();
                }

            }
            function xyz(obj) {

                var x = obj;
                var month = document.getElementById("workMonth").value;

                if (month === '') {
                    alert("Please Select The Month");
                    return false;

                }
                else {
                    myWindow = window.open("../CRM/selectLeadDetails.htm?x='" + x + "'", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0")

                }
            }

            function selectLeaddetailsMM($this) {

                var $itemRow = $($this).closest('tr');
                var rowCount = ($($this).closest("tr")[0].rowIndex);

                $itemRow.attr('id', "row" + rowCount);
                var rowid1 = "row" + rowCount;
                myWindow = window.open("../CRM/selectLeaddetailsMM.htm?rowid=" + rowid1, "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function mandTest() {
//           empName/empCode/workYear/workMonth

                var tenantM = document.getElementById("empName").value &&
                        document.getElementById("empCode").value &&
                        document.getElementById("workYear").value &&
                        document.getElementById("workMonth").value;

                if (tenantM == '')
                {

                    alert("Please Fill Mandatory Fields.");


                    $('#empName').focus();
                    $('#empCode').focus();
                    $('#workYear').focus();
                    $('#workMonth').focus();
                    return false;
                }

                else {
                    document.forms["monthlyworkplanForm"].submit();
                }
            }
        </script>
    </head>

    <% java.util.Date d = new java.util.Date();%>
    <!--    <body class="nav-sm">-->
    <body onload="loadAgeSelector()" class="nav-md">
        <div class="container body">


            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">


                        <div class="clearfix"></div>





                        <div class="col-md-6 col-xs-12">
                            <div class="x_panel">
                                <jsp:include page="../login/headerlink.htm?submodule=Worksheet&tab=Monthly Worksheet&pagetype=form"/>
                                <div class="x_title">
                                    <h2>Monthly Work Plan </h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />
                                    <c:forEach items="${monthlyWorkSheet}" var="list">
                                        <c:if test="${list[0] eq '438'}">
                                            <c:set value="${list[1]}" var="field_1"/>
                                            <c:set value="${list[2]}" var="fieldStatus_1"/>
                                            <c:set value="${list[3]}" var="mand_status_1"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '439'}">
                                            <c:set value="${list[1]}" var="field_2"/>
                                            <c:set value="${list[2]}" var="fieldStatus_2"/>
                                            <c:set value="${list[3]}" var="mand_status_2"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '440'}">
                                            <c:set value="${list[1]}" var="field_3"/>
                                            <c:set value="${list[2]}" var="fieldStatus_3"/>
                                            <c:set value="${list[3]}" var="mand_status_3"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '441'}">
                                            <c:set value="${list[1]}" var="field_4"/>
                                            <c:set value="${list[2]}" var="fieldStatus_4"/>
                                            <c:set value="${list[3]}" var="mand_status_4"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '442'}">
                                            <c:set value="${list[1]}" var="field_5"/>
                                            <c:set value="${list[2]}" var="fieldStatus_5"/>
                                            <c:set value="${list[3]}" var="mand_status_5"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '443'}">
                                            <c:set value="${list[1]}" var="field_6"/>
                                            <c:set value="${list[2]}" var="fieldStatus_6"/>
                                            <c:set value="${list[3]}" var="mand_status_6"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '444'}">
                                            <c:set value="${list[1]}" var="field_7"/>
                                            <c:set value="${list[2]}" var="fieldStatus_7"/>
                                            <c:set value="${list[3]}" var="mand_status_7"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '445'}">
                                            <c:set value="${list[1]}" var="field_8"/>
                                            <c:set value="${list[2]}" var="fieldStatus_8"/>
                                            <c:set value="${list[3]}" var="mand_status_8"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '446'}">
                                            <c:set value="${list[1]}" var="field_9"/>
                                            <c:set value="${list[2]}" var="fieldStatus_9"/>
                                            <c:set value="${list[3]}" var="mand_status_9"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '447'}">
                                            <c:set value="${list[1]}" var="field_10"/>
                                            <c:set value="${list[2]}" var="fieldStatus_10"/>
                                            <c:set value="${list[3]}" var="mand_status_10"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '448'}">
                                            <c:set value="${list[1]}" var="field_11"/>
                                            <c:set value="${list[2]}" var="fieldStatus_11"/>
                                            <c:set value="${list[3]}" var="mand_status_11"/>
                                        </c:if>

                                    </c:forEach>



                                    <form class="form-inline" id="monthlyworkplanForm" accept-charset="UTF-8" method="post" action="../CRM/monthlyworkshtFormSubmit.htm"  onsubmit="return  test12();" >


                                        <c:if test="${fieldStatus_1 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_1 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_1}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(monthlyWorkSheetListData) > 0}">
                                                        <c:forEach items="${monthlyWorkSheetListData}" var="type" end="0">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="empName" name="empName" class="form-control"autocomplete="off" maxlength="30" readonly value="${type.empName}">
                                                                    <input name="sno" type="hidden" value="${type.sno}">
                                                                    <input name="status" type="hidden" value="${type.status}">

                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="empName"  name="empName" readonly maxlength="30" class="form-control" value="${type.empName}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" id="empName" name="empName" value="" autocomplete="off" maxlength="30" class="form-control">
                                                        <input name="mwsCode" type="hidden" value="">
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
                                                    <c:when test="${fn:length(monthlyWorkSheetListData) > 0}">
                                                        <c:forEach items="${monthlyWorkSheetListData}" var="type" end="0">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="empCode" name="empCode" maxlength="15"autocomplete="off" class="form-control" readonly value="${type.empCode}">


                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="empCode"  name="empCode" readonly maxlength="15" class="form-control" value="${type.empCode}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" id="empCode" name="empCode" value="" maxlength="15" autocomplete="off" class="form-control">
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
                                                    <c:when test="${fn:length(monthlyWorkSheetListData) > 0}">
                                                        <c:forEach items="${monthlyWorkSheetListData}" var="type" end="0">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="workYear" name="workYear" readonly  class="form-control" value="${type.year}"/>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="workYear" name="workYear" readonly="" class="form-control" value="${type.year}"/>
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="hidden" id="leadCode" name="leadName1DD" class="form-control">
                                                        <select id="workYear" name="workYear"  placeholder="Select Year." class="form-control" >
                                                            <option value="" disabled selected>Select your option</option>

                                                        </select>
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
                                                    <c:when test="${fn:length(monthlyWorkSheetListData) > 0}">
                                                        <c:forEach items="${monthlyWorkSheetListData}" var="type" end="0">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="workMonth" name="workMonth" readonly class="form-control" value="${type.month}"/>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="workMonth" name="workMonth" readonly="" class="form-control" value="${type.month}"/>
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <!--                                                     <select id="workMonth1" name="workMonth" class="form-control" >
                                                                                                                <option></option>
                                                                                                            </select>-->
                                                        <select id="workMonth" name="workMonth" placeholder="Select Month." class="form-control"  onclick="checkavl(this.value);">
                                                            <option value="" disabled selected>Select your option</option>
                                                            <option>January</option>
                                                            <option>February</option>
                                                            <option>March</option>
                                                            <option>April</option>
                                                            <option>May</option>
                                                            <option>June</option>
                                                            <option>July</option>
                                                            <option>August</option>
                                                            <option>September</option>
                                                            <option>October</option>
                                                            <option>November</option>
                                                            <option>December</option>
                                                        </select>
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                        </c:if>


                                        <c:if test="${ action ne 'view' }">
                                            <p>&nbsp;</p>  <p>&nbsp;</p>
                                            <p>&nbsp;</p>
                                            <div style="overflow: scroll;height: 400px;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">
                                                <table id="DayTable" class="table table-striped responsive-utilities jambo_table bulk_action">
                                                    <thead>
                                                        <tr class="headings">                                

                                                            <th class="column-title"></th>
                                                            <th class="column-title">Date</th>
                                                            <th class="column-title">Lead/Client Name</th>

                                                            <th class="column-title">Source</th>
                                                            <th class="column-title">Remarks </th>

                                                            <th class="column-title">Follow Up</th>
                                                            <th class="column-title">Working With</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="">

                                                        <tr id="exampleabc1" class="headings">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>                                        

                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="01" class="form-control" value="1" ></td>
                                                            <td> <input type="text" id="leadName1" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>
                                                        </tr>
                                                        <tr id="exampleabc2" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o" ></i></button></td>                                        

                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="02" class="form-control" value="2" ></td>
                                                            <td> <input type="text" id="leadName2" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td> 
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>
                                                        </tr>
                                                        <tr id="exampleabc3" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="03" class="form-control" value="3"></td>
                                                            <td> <input type="text" id="leadName3" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td> 
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>
                                                        </tr>

                                                        <tr id="exampleabc4" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="04" class="form-control" value="4"></td>
                                                            <td> <input type="text" id="leadName4" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>                     
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>
                                                        </tr>

                                                        <tr id="exampleabc5" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="05" class="form-control" value="5"></td>
                                                            <td> <input type="text" id="leadName5" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>    
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>

                                                        </tr>
                                                        <tr id="exampleabc6" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="06" class="form-control" value="6"></td>
                                                            <td> <input type="text" id="leadName6" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>           
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>
                                                        </tr>
                                                        <tr id="exampleabc7" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="07" class="form-control" value="7"></td>
                                                            <td> <input type="text" id="leadName7" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>    
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>
                                                        </tr>
                                                        <tr id="exampleabc8" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="08" class="form-control" value="8"></td>
                                                            <td> <input type="text" id="leadName8" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>                   
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>
                                                        </tr>
                                                        <tr id="exampleabc9" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="09" class="form-control" value="9"></td>
                                                            <td> <input type="text" id="leadName9" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>              
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>
                                                        </tr>
                                                        <tr id="exampleabc10" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="10" class="form-control" value="10"></td>
                                                            <td> <input type="text" id="leadName10" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>                       
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>
                                                        </tr>

                                                        <tr id="exampleabc11" class="item-rowDay"> 
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="11" class="form-control" value="11"></td>
                                                            <td> <input type="text" id="leadName11" name="leadName" readonly=""  placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>
                                                        </tr>

                                                        <tr id="exampleabc12" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="12" class="form-control" value="12"></td>
                                                            <td> <input type="text" id="leadName12" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>                           
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>
                                                        </tr>

                                                        <tr id="exampleabc13" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="13" class="form-control" value="13"></td>
                                                            <td> <input type="text" id="leadName13" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>                                         
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>
                                                        </tr>
                                                        <tr id="exampleabc14" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="14" class="form-control" value="14"></td>
                                                            <td> <input type="text" id="leadName14" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>                                         
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>
                                                        </tr>

                                                        <tr id="exampleabc15" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="15" class="form-control" value="15"></td>
                                                            <td> <input type="text" id="leadName15" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>            
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>

                                                        </tr>
                                                        <tr id="exampleabc16" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="16" class="form-control" value="16"></td>
                                                            <td> <input type="text" id="leadName16" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>                 
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>
                                                        </tr>
                                                        <tr id="exampleabc17" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="17" class="form-control" value="17"></td>
                                                            <td> <input type="text" id="leadName17" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>               
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>
                                                        </tr>
                                                        <tr id="exampleabc18" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="18" class="form-control" value="18"></td>
                                                            <td> <input type="text" id="leadName18" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>                          
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>
                                                        </tr>
                                                        <tr id="exampleabc19" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="19" class="form-control" value="19"></td>
                                                            <td> <input type="text" id="leadName19" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>                  
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>
                                                        </tr>
                                                        <tr id="exampleabc20" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="20" class="form-control" value="20"></td>
                                                            <td> <input type="text" id="leadName20" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>                                   
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>
                                                        </tr>

                                                        <tr id="exampleabc21" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="21" class="form-control" value="21" ></td>
                                                            <td> <input type="text" id="leadName21" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>                            
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>
                                                        </tr>

                                                        <tr id="exampleabc22" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="22" class="form-control" value="22"> </td>
                                                            <td> <input type="text" id="leadName22" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>                                   
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>
                                                        </tr>

                                                        <tr id="exampleabc23" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="23" class="form-control" value="23"></td>
                                                            <td> <input type="text" id="leadName23" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>                                 
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>
                                                        </tr>
                                                        <tr id="exampleabc24" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="24" class="form-control" value="24"></td>
                                                            <td> <input type="text" id="leadName24" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>                                    
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>
                                                        </tr>

                                                        <tr id="exampleabc25" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="25" class="form-control" value="25"></td>
                                                            <td> <input type="text" id="leadName25" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>                                        
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>

                                                        </tr>
                                                        <tr id="exampleabc26" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="26" class="form-control" value="26"></td>
                                                            <td> <input type="text" id="leadName26" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>                                                    
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>
                                                        </tr>
                                                        <tr id="exampleabc27" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="27" class="form-control" value="27"></td>
                                                            <td> <input type="text" id="leadName27" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>                                           
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>
                                                        </tr>
                                                        <tr id="exampleabc28" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="28" class="form-control" value="28"></td>
                                                            <td> <input type="text" id="leadName28" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>                                                    
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>
                                                        </tr>
                                                        <tr id="exampleabc29" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="29" class="form-control" value="29"></td>
                                                            <td> <input type="text" id="leadName29" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>                                         
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>
                                                        </tr>
                                                        <tr id="exampleabc30" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="30" class="form-control" value="30"></td>
                                                            <td> <input type="text" id="leadName30" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>                                                   
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>
                                                        </tr>
                                                        <tr id="exampleabc31" class="item-rowDay">
                                                            <td align="center" onclick=""><button type="button" id="deleteDay"><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                            <td> <input type="text" id="workDate" name="workDate" readonly="" placeholder="31" class="form-control" value="31"></td>
                                                            <td> <input type="text" id="leadName31" name="leadName" readonly="" placeholder="Select Lead" class="form-control" onclick="xyz(this.id);"></td>                                                
                                                            <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control"></td>
                                                            <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control"></td>
                                                        </tr>
                                                    </tbody>

                                                </table>
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <!--<button id="addRowBtn" class="btn btn-danger" style=""><i class="glyphicon glyphicon-plus"></i>ADD</button>-->
                                                        <a  id="addRowDay" class="btn btn-succ" onclick="" tabindex=""><i class="glyphicon glyphicon-plus"></i> Add Item</a>

                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>

                                        
                                        <c:if test="${ action eq 'view' }">
                                            <p>&nbsp;</p>
                                       

                                        <!--//======For View-->
                                        <p>&nbsp;</p> 
                                            <div style="overflow: scroll;height: 400px;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">

                                                <table id="DayTable" class="table table-striped responsive-utilities">
                                                    <thead>
                                                        <tr class="item-rowDay">                                

                                                            <th style="background:#425567;color:#fff;text-align: center;"></th>
                                                            <th style="background:#425567;color:#fff;text-align: center;">Date</th>
                                                            <th style="background:#425567;color:#fff;text-align: center;">Lead/Client Name</th>

                                                            <th style="background:#425567;color:#fff;text-align: center;">Source</th>
                                                            <th style="background:#425567;color:#fff;text-align: center;">Remarks </th>

                                                            <th style="background:#425567;color:#fff;text-align: center;">Follow Up</th>
                                                            <th style="background:#425567;color:#fff;text-align: center;">Working With</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="">
                                                        <c:forEach items="${monthlyWorkSheetListData}" var="type">
                                                            <c:if test="${ type.leadName ne '' }">
                                                                <tr id="exampleabc31" class="item-rowDay">
                                                                    <td align="center" onclick=""><button type="button" id=""><i class="fa fa-trash fa-lg-o"></i></button></td>
                                                                    <td> <input type="text" id="workDate" name="workDate" readonly=""  class="form-control" value="${type.date}"></td>
                                                                    <td> <input type="text" id="leadName31" name="leadName" readonly=""  class="form-control" value="${type.leadName}" ></td>                                                      
                                                                    <td> <input type="text" id="travelSource" name="source" placeholder="" class="form-control" value="${type.source}"></td>
                                                                    <td> <input type="text" id="placeFrom" name="remarks" placeholder="" class="form-control" value="${type.remarks}"></td>
                                                                    <td> <input type="text" id="followUp" name="followUp" placeholder="" class="form-control" value="${type.followUp}"></td>
                                                                    <td> <input type="text" id="workWith" name="workWith" placeholder="" class="form-control" value="${type.workingWith}"></td>
                                                                </tr>
                                                            </c:if>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>

                                        </c:if>




                                        <p>&nbsp;</p>
                                        <c:if test="${action ne 'view'}">
                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                
                                                <button type="submit" class="btn btn-primary" style="" onclick="return mandTest();" > Save </button>
                                                <a href="../CRM/monthlyWorkSheet.htm"  class="btn btn-danger"  style="">Cancel</a>
                                            </div>
                                        </c:if>

                                    </form>

                                </div>
                            </div>
                        </div>

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
            <script src="crmScript.js" type="text/javascript"></script>
            <script src="general-crm_scripts.js" type="text/javascript"></script>
            <script src="mioinvoice-crm-scripts.js" type="text/javascript"></script>
    </body>

</html>