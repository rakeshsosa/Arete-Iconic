<%-- 
    Document   : rentPostingForm
    Created on : 8 Sep, 2017, 11:30:48 AM
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
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script src="../common/theme/css/csspopup.js" type="text/javascript"></script>
        <link href="../common/theme/css/disableSelection.css" rel="stylesheet" type="text/css"/>
        <title>arête Assets Management</title>
        <script type="text/javascript">

            $(document).ready(function () {
                jQuery("#tenantform").validationEngine();
                $("#tag").toggle();
                $("#tag1").toggle();
                $("#tag2").toggle();
                $("#tag3").toggle();
                $("#tag4").toggle();
                $("input").on("keypress", function (e) {

                    if (e.which === 32 && !this.value.length)
                        e.preventDefault();
                });

            });

            function subassetDetails() {
                var status = document.getElementById("substatus").value;
                myWindow = window.open("../tenant/subassetDetails.htm?status=" + status + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }

            function selectLandlordProperty()
            {
                //var assetName = document.getElementById("assetName").value;
                //var flatno = document.getElementById("subclassifiedAstno").value;
                myWindow = window.open("../tenant/selectLandlordProperty.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
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

            function clearForm() {
                document.getElementById("landlordName").value = '';
                document.getElementById("contactNo").value = '';
                document.getElementById("advanceAmount").value = '';
                document.getElementById("rentAmount").value = '';
            }

            function validateEmail() {
                var tenantMailid = document.getElementById("mailId").value;
                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                if (tenantMailid.match(mailformat)) {
//                    return true;
                } else {
                    alert("You have entered an invalid email address!");
                    document.getElementById('mailId').value = "";
                }
//                $.ajax
//                        ({
//                            type: "POST",
//                            url: '../tenant/fetchTEmail.htm',
//                            data: {
//                                tenantMailid: tenantMailid
//                            },
//                            success: function (data) {
//                                if ($.trim(data) == 'Already Exists.Enter another') {
//                                    alert("Tenant email already exist");
//                                    document.getElementById("tenantMailid").value = "";
//                                    return false;
//                                }
//                            }
//                        });
            }
            function mandTest() {
                var assetM = document.getElementById("assetName").value;
                var ownerM = document.getElementById("rentpostingType").value &&
                        document.getElementById("landlordName").value &&
                        document.getElementById("contactNo").value &&
                        document.getElementById("advanceAmount").value &&
                        document.getElementById("rentAmount").value;

                if (assetM == '')
                {
                    callM();
                    alert("Please Fill Mandatory Fields in Property Details");
                    $('#assetName').focus();
                    return false;
                }
                if (ownerM == '')
                {
                    callM1();
                    alert("Please Fill Mandatory Fields in Owner Details");
                    return false;
                }

                else {
                    document.forms["tenantform"].submit();
                }
            }
        </script>
        <script>
            function call() {
                $("#tag").toggle();
            }

            function call1() {
                $("#tag1").toggle();
            }
            function callM() {
                $(window).scrollTop(0);
                $("#tag").toggle();
                $("#tag1").hide();

            }
            function callM1() {
                $(window).scrollTop(0);
                $("#tag").hide();
                $("#tag1").toggle();
            }

            function test()
            {
                var comp = document.getElementById("advanceAmount").value;
                var comp1 = document.getElementById("advanceAmount1").value;
                var desc = document.getElementById("rentAmount").value;
                var desc1 = document.getElementById("rentAmount1").value;

                if (document.getElementById("advanceAmount").value == "")
                {
                    alert("Enter Advance Amount");
                    return false;
                }
                else if (document.getElementById("rentAmount").value == "")
                {
                    alert("Enter Rent Amount");
                    return false;
                }
                else {

                    if (comp !== comp1 || desc !== desc1) {
                        if (confirm('Do you really want to Save this updated record')) {
                            document.forms["tenantform"].submit();
                            return true;
                        } else {
                            return true;
                        }

                    } else {
                        document.forms["tenantform"].submit();
                    }
                }

            }

//            function test()
//            {
//                if (document.getElementById("advanceAmount").value == "")
//                {
//                    alert("Enter Advance Amount");
//                    return false;
//                }
//                else if (document.getElementById("rentAmount").value == "")
//                {
//                    alert("Enter Rent Amount");
//                    return false;
//                } else {
//                    if (confirm('Do you really want to Save this updated record')) {
//                        document.forms["tenantform"].submit();
//                        return true;
//                    } else {
//                        return false;
//                    }
//
//                }
//
//            }

        </script>

    </head>
    <body class="nav-md">
        <div id="blanket" style="display: none;"></div>
        <div id="popUpDiv" style="display: none;"></div>
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <div class="clearfix"></div>
                        <div class="col-md-6 col-xs-12">
                            <div class="x_panel">
                                <jsp:include page="../login/headerlink.htm?submodule=Invoice Generation&tab=Rent Posting&pagetype=form"/>
                                <div class="x_title">
                                    <h2>Rent Posting</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />
                                    <form class="form-inline" id="tenantform" action="../tenant/rentPostingFormSubmit.htm"  method="post" enctype="multipart/form-data">                                      
                                        <c:choose>
                                            <c:when test="${fn:length(RentPosting) > 0}">
                                                <c:forEach items="${RentPosting}" var="list">
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
                                            <c:if test="${list[0] eq '662'}">
                                                <c:set value="${list[1]}" var="field_1"/>
                                                <c:set value="${list[2]}" var="fieldStatus_1"/>
                                                <c:set value="${list[3]}" var="mand_status_1"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '663'}">
                                                <c:set value="${list[1]}" var="field_2"/>
                                                <c:set value="${list[2]}" var="fieldStatus_2"/>
                                                <c:set value="${list[3]}" var="mand_status_2"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '664'}">
                                                <c:set value="${list[1]}" var="field_3"/>
                                                <c:set value="${list[2]}" var="fieldStatus_3"/>
                                                <c:set value="${list[3]}" var="mand_status_3"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '665'}">
                                                <c:set value="${list[1]}" var="field_4"/>
                                                <c:set value="${list[2]}" var="fieldStatus_4"/>
                                                <c:set value="${list[3]}" var="mand_status_4"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '666'}">
                                                <c:set value="${list[1]}" var="field_5"/>
                                                <c:set value="${list[2]}" var="fieldStatus_5"/>
                                                <c:set value="${list[3]}" var="mand_status_5"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '667'}">
                                                <c:set value="${list[1]}" var="field_6"/>
                                                <c:set value="${list[2]}" var="fieldStatus_6"/>
                                                <c:set value="${list[3]}" var="mand_status_6"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '668'}">
                                                <c:set value="${list[1]}" var="field_7"/>
                                                <c:set value="${list[2]}" var="fieldStatus_7"/>
                                                <c:set value="${list[3]}" var="mand_status_7"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '669'}">
                                                <c:set value="${list[1]}" var="field_8"/>
                                                <c:set value="${list[2]}" var="fieldStatus_8"/>
                                                <c:set value="${list[3]}" var="mand_status_8"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '670'}">
                                                <c:set value="${list[1]}" var="field_9"/>
                                                <c:set value="${list[2]}" var="fieldStatus_9"/>
                                                <c:set value="${list[3]}" var="mand_status_9"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '671'}">
                                                <c:set value="${list[1]}" var="field_10"/>
                                                <c:set value="${list[2]}" var="fieldStatus_10"/>
                                                <c:set value="${list[3]}" var="mand_status_10"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '672'}">
                                                <c:set value="${list[1]}" var="field_11"/>
                                                <c:set value="${list[2]}" var="fieldStatus_11"/>
                                                <c:set value="${list[3]}" var="mand_status_11"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '673'}">
                                                <c:set value="${list[1]}" var="field_12"/>
                                                <c:set value="${list[2]}" var="fieldStatus_12"/>
                                                <c:set value="${list[3]}" var="mand_status_12"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '674'}">
                                                <c:set value="${list[1]}" var="field_13"/>
                                                <c:set value="${list[2]}" var="fieldStatus_13"/>
                                                <c:set value="${list[3]}" var="mand_status_13"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '675'}">
                                                <c:set value="${list[1]}" var="field_14"/>
                                                <c:set value="${list[2]}" var="fieldStatus_14"/>
                                                <c:set value="${list[3]}" var="mand_status_14"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '676'}">
                                                <c:set value="${list[1]}" var="field_15"/>
                                                <c:set value="${list[2]}" var="fieldStatus_15"/>
                                                <c:set value="${list[3]}" var="mand_status_15"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '677'}">
                                                <c:set value="${list[1]}" var="field_16"/>
                                                <c:set value="${list[2]}" var="fieldStatus_16"/>
                                                <c:set value="${list[3]}" var="mand_status_16"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '678'}">
                                                <c:set value="${list[1]}" var="field_17"/>
                                                <c:set value="${list[2]}" var="fieldStatus_17"/>
                                                <c:set value="${list[3]}" var="mand_status_17"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '679'}">
                                                <c:set value="${list[1]}" var="field_18"/>
                                                <c:set value="${list[2]}" var="fieldStatus_18"/>
                                                <c:set value="${list[3]}" var="mand_status_18"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '680'}">
                                                <c:set value="${list[1]}" var="field_19"/>
                                                <c:set value="${list[2]}" var="fieldStatus_19"/>
                                                <c:set value="${list[3]}" var="mand_status_19"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '681'}">
                                                <c:set value="${list[1]}" var="field_20"/>
                                                <c:set value="${list[2]}" var="fieldStatus_20"/>
                                                <c:set value="${list[3]}" var="mand_status_20"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '682'}">
                                                <c:set value="${list[1]}" var="field_21"/>
                                                <c:set value="${list[2]}" var="fieldStatus_21"/>
                                                <c:set value="${list[3]}" var="mand_status_21"/>
                                            </c:if>                                           

                                        </c:forEach>

                                        <div class="box-header well" data-original-title onclick="call();" style="cursor: pointer;">
                                            <h4><b style="padding-left: 20px;">Property Details</b></h4><c:if test="${fn:length(message) > 0}"><a class="successalert" style="margin-left: 250px;">${message}</a></c:if>
                                            </div>

                                            <div class="box-content" id="tag"> 

                                            <c:if test="${fieldStatus_6 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_6 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_6}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(RentPosting) > 0}">
                                                            <c:forEach items="${RentPosting}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="assetName" name="assetName" maxlength="50" value="${list.assetName}" >
                                                                        <input type="hidden" id="substatus" name="substatus" value="Occupied">

                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="assetName" value="${list.assetName}">
                                                                        <input type="hidden" id="substatus" name="substatus" value="Occupied">

                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="Select Property" readonly="" class="form-control" id="assetName" name="assetName" maxlength="50" value="" onclick="subassetDetails();">
                                                            <input type="hidden" id="assetCode" name="assetCode" value="">
                                                            <input type="hidden" id="substatus" name="substatus" value="Occupied">

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
                                                        <c:when test="${fn:length(RentPosting) > 0}">
                                                            <c:forEach items="${RentPosting}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="subclassifiedAstno" name="subclassifiedAstno" maxlength="50" value="${list.subclassifiedAstno}" onkeypress="return isNumberKey3(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="subclassifiedAstno" value="${list.subclassifiedAstno}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" readonly="" class="form-control" id="subclassifiedAstno" name="subclassifiedAstno" maxlength="50" value="" onkeypress="return isNumberKey3(event)" >
                                                            <input type="hidden" id="subclassifiedAstno" name="subclassifiedAstno" value="">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_8 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_8 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <label class="control-label">${field_8}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(RentPosting) > 0}">
                                                            <c:forEach items="${RentPosting}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="buildingNo" name="buildingNo" maxlength="50" value="${list.buildingNo}" onkeypress="return isNumberKey(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="buildingNo" value="${list.buildingNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly="" class="form-control" id="buildingNo" name="buildingNo" maxlength="50" value="" onkeypress="return isNumberKey(event)">
                                                        </c:otherwise>        
                                                    </c:choose>
                                                </div></c:if>
                                                <p>&nbsp;</p>
                                            <c:if test="${fieldStatus_9 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_9 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <label class="control-label">${field_9}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(RentPosting) > 0}">
                                                            <c:forEach items="${RentPosting}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="wayNo" name="wayNo" maxlength="50" value="${list.wayNo}" onkeypress="return isNumberKey3(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="wayNo" value="${list.wayNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly="" class="form-control" id="wayNo" name="wayNo" maxlength="50" value="" onkeypress="return isNumberKey3(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_10 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_10 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <label class="control-label">${field_10}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(RentPosting) > 0}">
                                                            <c:forEach items="${RentPosting}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="assetArea" name="assetArea" maxlength="50" value="${list.assetArea}" >
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="assetArea" value="${list.assetArea}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly="" class="form-control" id="assetArea" name="assetArea" maxlength="50" value="" >
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
                                                        <c:when test="${fn:length(RentPosting) > 0}">
                                                            <c:forEach items="${RentPosting}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="blockNo" name="blockNo" maxlength="50" value="${list.blockNo}" onkeypress="return isNumberKey3(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="blockNo" value="${list.blockNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly="" class="form-control" id="blockNo" name="blockNo" maxlength="50" value="" onkeypress="return isNumberKey3(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if><p>&nbsp;</p>
                                            <c:if test="${fieldStatus_12 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_12 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <label class="control-label">${field_12}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(RentPosting) > 0}">
                                                            <c:forEach items="${RentPosting}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="plotNo" name="plotNo" maxlength="50" value="${list.plotNo}" onkeypress="return isNumberKey3(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="plotNo" value="${list.plotNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly="" class="form-control" id="plotNo" name="plotNo" maxlength="50" value="" onkeypress="return isNumberKey3(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_13 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_13 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <label class="control-label">${field_13}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(RentPosting) > 0}">
                                                            <c:forEach items="${RentPosting}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="streetNo" name="streetNo" maxlength="50" value="${list.streetNo}" onkeypress="return isNumberKey3(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="streetNo" value="${list.streetNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly="" class="form-control" id="streetNo" name="streetNo" maxlength="50" value="" onkeypress="return isNumberKey3(event)">
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
                                                        <c:when test="${fn:length(RentPosting) > 0}">
                                                            <c:forEach items="${RentPosting}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="assetPostalCode" name="assetPostalCode" maxlength="3" value="${list.assetPostalCode}" onkeypress="return isNumberKey(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="assetPostalCode" value="${list.assetPostalCode}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly="" class="form-control" id="assetPostalCode" name="assetPostalCode" maxlength="3" value="" onkeypress="return isNumberKey(event)">
                                                        </c:otherwise>        
                                                    </c:choose>
                                                </div></c:if><p>&nbsp;</p>
                                            <c:if test="${fieldStatus_15 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_15 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <label class="control-label">${field_15}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(RentPosting) > 0}">
                                                            <c:forEach items="${RentPosting}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="assetPostboxNo" name="assetPostboxNo" maxlength="4" value="${list.assetPostboxNo}" onkeypress="return isNumberKey(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="assetPostboxNo" value="${list.assetPostboxNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly="" class="form-control" id="assetPostboxNo" name="assetPostboxNo" maxlength="4" value="" onkeypress="return isNumberKey(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_16 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_16 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <label class="control-label">${field_16}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(RentPosting) > 0}">
                                                            <c:forEach items="${RentPosting}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="waterBillno" name="waterBillno" maxlength="50" value="${list.waterBillno}" onkeypress="return isNumberKey(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="waterBillno" value="${list.waterBillno}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly="" class="form-control" id="waterBillno" name="waterBillno" maxlength="50" value="" onkeypress="return isNumberKey(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_17 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_17 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <label class="control-label">${field_17}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(RentPosting) > 0}">
                                                            <c:forEach items="${RentPosting}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="electricityBillno" name="electricityBillno" maxlength="50" value="${list.electricityBillno}" onkeypress="return isNumberKey(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="electricityBillno" value="${list.electricityBillno}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly="" class="form-control" id="electricityBillno" name="electricityBillno" maxlength="50" value="" onkeypress="return isNumberKey(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                                <p>&nbsp;</p>

                                            <c:if test="${fieldStatus_20 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_20 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <label class="control-label">${field_20}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(RentPosting) > 0}">
                                                            <c:forEach items="${RentPosting}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="minimumRentFixed" name="minimumRentFixed" maxlength="50" value="${list.minimumRentFixed}" onkeypress="return isNumberKey(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="minimumRentFixed" value="${list.minimumRentFixed}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly="" class="form-control" id="minimumRentFixed" name="minimumRentFixed" maxlength="50" value="" onkeypress="return isNumberKey(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_21 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_21 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <label class="control-label">${field_21}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(RentPosting) > 0}">
                                                            <c:forEach items="${RentPosting}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'|| action eq 'Recheck'}">
                                                                        <input type="text" class="form-control" readonly="" id="actualRent" name="actualRent" maxlength="50" value="${list.actualRent}" onkeypress="return isNumberKey(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="actualRent" value="${list.actualRent}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" readonly="" class="form-control" id="actualRent" name="actualRent" maxlength="50" value="" onkeypress="return isNumberKey(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                                <p>&nbsp;</p>
                                                <p>&nbsp;</p>
                                            </div>
                                            <div class="box-header well" data-original-title onclick="call1();" style="cursor: pointer;">
                                                <h4><b style="padding-left: 20px;">Owner Details </b></h4><c:if test="${fn:length(message) > 0}"><a class="successalert" style="margin-left: 250px;">${message}</a></c:if>
                                            </div> 
                                            <div class="box-content" id="tag1"> 

                                            <c:if test="${fieldStatus_1 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_1 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <label class="control-label">${field_1}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(RentPosting) > 0}">
                                                            <c:forEach items="${RentPosting}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" readonly="" id="rentpostingDate" name="rentpostingDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.rentpostingDate}"/>">
                                                                        <input type="hidden" name="pk" value="${list.SNo}">

                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" id="rentpostingDate" readonly="" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.rentpostingDate}"/>">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" class="form-control" readonly id="rentpostingDate" name="rentpostingDate" value="<%= (new SimpleDateFormat("dd-MMM-yyyy")).format(new java.util.Date())%>">
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
                                                        <c:when test="${fn:length(RentPosting) > 0}">
                                                            <c:forEach items="${RentPosting}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" readonly="" id="rentpostingType" name="rentpostingType" value="${list.rentpostingType}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="rentpostingType" value="${list.rentpostingType}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <select id="rentpostingType" name="rentpostingType" class="form-control" onchange="clearForm();">
                                                                <option value="" disabled="" selected>Select your option</option>
                                                                <c:forEach items="${Dropdown}" var="list">
                                                                    <c:if test="${list[0] eq 'F-26'}">
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
                                                        <c:when test="${fn:length(RentPosting) > 0}">
                                                            <c:forEach items="${RentPosting}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" readonly="" id="landlordName" name="landlordName" maxlength="50" value="${list.landlordName}" onkeyup="firstToUpperCase();" >
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="landlordName" value="${list.landlordName}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="Select Owner Name" readonly="" class="form-control" id="landlordName" name="landlordName" maxlength="50" value="" onkeyup="firstToUpperCase();" onclick="return selectLandlordProperty();"  >
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                                <p>&nbsp;</p>
                                            <c:if test="${fieldStatus_4 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_4 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a><a style="color:transparent;">*</a>
                                                    <label class="control-label">${field_4}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(RentPosting) > 0}">
                                                            <c:forEach items="${RentPosting}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" readonly="" id="mailId" name="mailId" maxlength="50" value="${list.mailId}" onchange="return validateEmail(event);">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="mailId" value="${list.mailId}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" readonly="" id="mailId" name="mailId" maxlength="50" value="" onchange="return validateEmail(event);">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                            <c:if test="${fieldStatus_5 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_5 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_5}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(RentPosting) > 0}">
                                                            <c:forEach items="${RentPosting}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" readonly="" id="contactNo" name="contactNo" maxlength="50" value="${list.contactNo}" onkeypress="return isNumberKey(event)">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="contactNo" value="${list.contactNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" readonly="" id="contactNo" name="contactNo" maxlength="50" value="" onkeypress="return isNumberKey(event)">
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
                                                        <c:when test="${fn:length(RentPosting) > 0}">
                                                            <c:forEach items="${RentPosting}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" id="advanceAmount" name="advanceAmount" maxlength="50" value="${list.advanceAmount}" onkeypress="return isNumberKey(event)">
                                                                        <input type="hidden" class="form-control" id="advanceAmount1" name="advanceAmount1" maxlength="50" value="${list.advanceAmount}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="advanceAmount" value="${list.advanceAmount}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" id="advanceAmount" name="advanceAmount" maxlength="50" value="" onkeypress="return isNumberKey(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                                <p>&nbsp;</p>  

                                            <c:if test="${fieldStatus_19 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_19 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if><a style="color:transparent;">*</a>
                                                    <label class="control-label">${field_19}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(RentPosting) > 0}">
                                                            <c:forEach items="${RentPosting}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" id="rentAmount" name="rentAmount" maxlength="50" value="${list.rentAmount}" onkeypress="return isNumberKey(event)">
                                                                        <input type="hidden" class="form-control" id="rentAmount1" name="rentAmount1" maxlength="50" value="${list.rentAmount}" >
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="rentAmount" value="${list.rentAmount}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="" class="form-control" id="rentAmount" name="rentAmount" maxlength="50" value="" onkeypress="return isNumberKey(event)">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div></c:if>
                                                <p>&nbsp;</p>  
                                                
                                                                                            

                                            </div>                                    

                                            <p>&nbsp;</p>


                                        <c:if test="${action ne 'view' && action ne 'edit'}">
                                            <!--                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">-->
                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                <button type="button" class="btn btn-primary" style="" onclick="return mandTest();">Save</button>
                                                <a href="../tenant/rentPostingList.htm" class="btn btn-danger">Cancel</a>
                                            </div>
                                            <!--</div>--> 
                                        </c:if>

                                        <c:if test="${action eq 'edit'  }">

                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                                <button type="button" class="btn btn-primary" style="" onclick="return test();">Save</button>
                                                <a href="../tenant/rentPostingList.htm" class="btn btn-danger">Cancel</a>
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
