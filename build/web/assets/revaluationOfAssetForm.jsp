<%-- 
    Document   : revaluationOfAssetForm
    Created on : 14 Oct, 2016, 12:03:01 PM
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
        <script>
            //pop up to select  assetcode, assetname, subassetcode and subassetname
            function SelectAssetDetailif() {
                myWindow = window.open("../assetsm/splitOfAssetPopUp.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=99,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
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
            function formValidate() {
                var startDate = document.getElementById('startDate').value;
                var assetCode = document.getElementById('assetCode').value;
                var selectAddSubAsset = document.getElementById('selectAddSubAsset').value;
                var normalValueOfAsset = parseInt(document.getElementById('currentValueOfAsset').value, 10);
                var addSubValueOfAsset = parseInt(document.getElementById('addSubValueOfAsset').value, 10);
                var newLifeSpan = parseInt(document.getElementById('newLifeSpan').value, 10);
                var currentValueIsNaN = isNaN(normalValueOfAsset);
                var newLifeSpanIsNaN = isNaN(newLifeSpan);
                var addSubValueOfAssetIsNaN = isNaN(addSubValueOfAsset);

                if (startDate === null || startDate === '') {
                    alert('Please Select Start Date');
                    $("#startDate").focus();
                    return false;
                }

                if (assetCode === null || assetCode === '') {
                    alert('Please Select Asset Code');
                    $("#assetCode").focus();
                    return false;
                }

                if (selectAddSubAsset === "Addition" || selectAddSubAsset === "Substraction") {
                    return true;
                } else {
                    alert('Please Select Depreciate and Appreciate option from dropdown.');
                    $("#selectAddSubAsset").focus();
                    return false;
                }

                if (newLifeSpan === null || newLifeSpan === '' || newLifeSpanIsNaN == "NaN") {
                    alert("Please fill new life span.");
                    return false;
                }
                if (normalValueOfAsset === null || normalValueOfAsset === '' || currentValueIsNaN == "NaN") {
                    alert("Please fill current value of asset");
                    return false;
                }
                if (addSubValueOfAsset === null || addSubValueOfAsset === '' || addSubValueOfAssetIsNaN == "NaN") {
                    alert("Please fille the value tyo depreciate or appreciate");
                    return false;
                }
                return true;
            }

            function autoCalculateDepreciationPercentage() {
                var newLifeSpan = parseInt(document.getElementById('newLifeSpan').value, 10);
                var depAppPercentage = (100 / newLifeSpan).toFixed(3);
                if (depAppPercentage === "NaN") {
                    depAppPercentage = 0;
                }
                document.getElementById('newDepreciation').value = depAppPercentage;
            }

            function DepreciationAppreciationCalculation() {
                autoCalculateDepreciationPercentage();
                var selectAddSubAsset = document.getElementById('selectAddSubAsset').value;
                var normalValueOfAsset = parseInt(document.getElementById('currentValueOfAsset').value, 10);
                var addSubValueOfAsset = parseInt(document.getElementById('addSubValueOfAsset').value, 10);
                var newLifeSpan = parseInt(document.getElementById('newLifeSpan').value, 10);
                var revaluedLeftOut = parseInt(document.getElementById('revaluedLeftOut').value, 10);
                var startDate = document.getElementById('startDate').value;
                var todayDate = document.getElementById('todayDate').value;
                if (newLifeSpan < 0 || newLifeSpan === 0) {
                    alert("Life span should be more than 0");
                    document.getElementById('newLifeSpan').value = '';
                    return false;
                }
                var startDateSplit = startDate.split("-");
                var todayDateSplit = todayDate.split("-");
                var srtDate = new Date(startDateSplit[1] + '/' + startDateSplit[0] + '/' + startDateSplit[2]);
                var currentDate = new Date(todayDateSplit[1] + '/' + todayDateSplit[0] + '/' + todayDateSplit[2]);
                var timeDiff = currentDate.getTime() - srtDate.getTime();
                var numberOfDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
                var revaluedLeftOut;
                // depreciation/appreciation Percentage 
                var depAppPercentage = (100 / newLifeSpan);
                document.getElementById('newDepreciationPercentage').value = depAppPercentage;
                if (selectAddSubAsset === "Addition" || selectAddSubAsset === "Substraction") {
                } else {
                    alert('Please Select Depreciate and Appreciate option from dropdown.');
                    $("#selectAddSubAsset").focus();
                    return false;
                }

                if (selectAddSubAsset === "Addition") {
                    var depreciatedAmountPerYear = (addSubValueOfAsset * depAppPercentage) / 100;
                    var depAmountPerDay = depreciatedAmountPerYear / 365;
                    var totalDepAmout = depAmountPerDay * numberOfDays;
                    revaluedLeftOut = (normalValueOfAsset + addSubValueOfAsset + totalDepAmout).toFixed(3);
                    var checkValue = isNaN(revaluedLeftOut);
                    if (checkValue === true)
                        document.getElementById('revaluedLeftOut').value = 0;
                    else
                        document.getElementById('revaluedLeftOut').value = revaluedLeftOut;
                }

                if (selectAddSubAsset === "Substraction") {
                    var depreciatedAmountPerYear = (addSubValueOfAsset * depAppPercentage) / 100;
                    var depAmountPerDay = depreciatedAmountPerYear / 365;
                    var totalDepAmout = depAmountPerDay * numberOfDays;
                    revaluedLeftOut = (normalValueOfAsset + addSubValueOfAsset - totalDepAmout).toFixed(3);
                    //                              document.getElementById('revaluedLeftOut').value = revaluedLeftOut;
                    var checkValue = isNaN(revaluedLeftOut);
                    if (checkValue === true)
                        document.getElementById('revaluedLeftOut').value = 0;
                    else
                        document.getElementById('revaluedLeftOut').value = revaluedLeftOut;
                }
                return true;
            }

            function test()
            {
                var asasset = document.getElementById("selectAddSubAsset").value;
                var asasset1 = document.getElementById("selectAddSubAsset1").value;
                var cvasset = document.getElementById("currentValueOfAsset").value;
                var cvasset1 = document.getElementById("currentValueOfAsset1").value;
                var asvasset = document.getElementById("addSubValueOfAsset").value;
                var asvasset1 = document.getElementById("addSubValueOfAsset1").value;
                var nlspan = document.getElementById("newLifeSpan").value;
                var nlspan1 = document.getElementById("newLifeSpan1").value;
                var reason = document.getElementById("reason").value;
                var reason1 = document.getElementById("reason1").value;


                if (document.getElementById("selectAddSubAsset").value == "")
                {
                    alert("Select Revaluation of Property");
                    return false;
                } else if (document.getElementById("currentValueOfAsset").value == "")
                {
                    alert("Enter Current Value Of Property");
                    return false;
                } else if (document.getElementById("addSubValueOfAsset").value == "")
                {
                    alert("Enter Add/Sub Value Of Property");
                    return false;
                } else if (document.getElementById("newLifeSpan").value == "")
                {
                    alert("Enter New Life Span");
                    return false;
                }
                else {

                    if (asasset !== asasset1 || cvasset !== cvasset1 || asvasset !== asvasset1
                            || nlspan !== nlspan1 || reason !== reason1) {
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
                var newIn = '<div id="adiv' + (next) + '" class="col-md-4 col-sm-12 "><button type="button" style="display: inline!important;" id="remove' + (next) + '" class="btn btn-danger remove-me">-</button><input style="display: inline!important;margin-left: 5px;margin-right: 3px;" class="form-control capitalize  validate[required]" id="attachname' + next + '" name="documentname" type="text" placeholder="Attachment Name" required=""><input style="display: none;"  id="field' + next + '" class="filecls" name="attachments" type="file" onchange="readURL1(this);setAttachName(\'' + next + '\');" ><input type="button" id="btnb' + next + '" class="btn btn-primary" value="Browse..." onclick="browseFile(\'' + next + '\');" /><p id="field' + next + 'Error" style="color: red; font: bold; display: none; text-align: right;">Upload your valid attachment</p></div>';
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
                                <jsp:include page="../login/headerlink.htm?submodule=Property Revaluation&tab=Property Revaluation&pagetype=form"/>

                                <div class="x_title">
                                    <h2>Revaluation of Property</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br/>


                                    <form id="userform" method="post" enctype="multipart/form-data" name="form" class="form-inline" action="../assetsm/revaluationOfAssetFormubmit.htm" onsubmit="return formValidate();">
                                        <c:choose>
                                            <c:when test="${fn:length(revaluationOfAsselist) > 0}">
                                                <c:forEach items="${revaluationOfAsselist}" var="list">
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
                                        <%-- Set the Attribute  --%>

                                        <c:forEach items="${revaluation_of_asset_category}" var="list">                                                       

                                            <c:if test="${list[0] eq '526'}">
                                                <c:set value="${list[1]}" var="fieldname_1"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_1"/>
                                                <c:set value="${list[3]}" var="mand_status_1"/>
                                            </c:if>  
                                            <c:if test="${list[0] eq '527'}">
                                                <c:set value="${list[1]}" var="fieldname_2"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_2"/>
                                                <c:set value="${list[3]}" var="mand_status_2"/>                                                          
                                            </c:if>
                                            <%-- SubAsset code and SubAsset Name 546 and 547  --%>
                                            <c:if test="${list[0] eq '546'}">
                                                <c:set value="${list[1]}" var="fieldname_13"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_13"/>
                                                <c:set value="${list[3]}" var="mand_status_13"/>
                                            </c:if>                                                         
                                            <c:if test="${list[0] eq '547'}">
                                                <c:set value="${list[1]}" var="fieldname_14"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_14"/>
                                                <c:set value="${list[3]}" var="mand_status_14"/>
                                            </c:if> 
                                            <c:if test="${list[0] eq '586'}">
                                                <c:set value="${list[1]}" var="fieldname_15"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_15"/>
                                                <c:set value="${list[3]}" var="mand_status_15"/>
                                            </c:if> 

                                            <c:if test="${list[0] eq '528'}">
                                                <c:set value="${list[1]}" var="fieldname_3"/> 
                                                <c:set value="${list[2]}" var="fieldStatus_3"/>
                                                <c:set value="${list[3]}" var="mand_status_3"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '529'}">
                                                <c:set value="${list[1]}" var="fieldname_4"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_4"/>
                                                <c:set value="${list[3]}" var="mand_status_4"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '530'}">
                                                <c:set value="${list[1]}" var="fieldname_5"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_5"/>
                                                <c:set value="${list[3]}" var="mand_status_5"/>
                                            </c:if>                                                       
                                            <c:if test="${list[0] eq '531'}">
                                                <c:set value="${list[1]}" var="fieldname_6"/> 
                                                <c:set value="${list[2]}" var="fieldStatus_6"/>
                                                <c:set value="${list[3]}" var="mand_status_6"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '532'}">
                                                <c:set value="${list[1]}" var="fieldname_7"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_7"/>
                                                <c:set value="${list[3]}" var="mand_status_7"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '533'}">
                                                <c:set value="${list[1]}" var="fieldname_8"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_8"/>
                                                <c:set value="${list[3]}" var="mand_status_8"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '534'}">
                                                <c:set value="${list[1]}" var="fieldname_9"/> 
                                                <c:set value="${list[2]}" var="fieldStatus_9"/>
                                                <c:set value="${list[3]}" var="mand_status_9"/>
                                            </c:if>                                                      

                                            <%--    <c:if test="${list[0] eq '535'}">
                                                    <c:set value="${list[1]}" var="fieldname_10"/>   
                                                    <c:set value="${list[2]}" var="fieldStatus_10"/>
                                                    <c:set value="${list[3]}" var="mand_status_10"/>
                                                </c:if>--%>
                                            <c:if test="${list[0] eq '716'}">
                                                <c:set value="${list[1]}" var="fieldname_716"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_716"/>
                                                <c:set value="${list[3]}" var="mand_status_716"/>
                                            </c:if>
                                        </c:forEach> 

                                        <c:if test="${fieldStatus_1 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_1 eq 'required'}">
                                                    <a  class="control-label" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${fieldname_1}</label>                                              

                                                <c:choose>
                                                    <c:when test="${fn:length(revaluationOfAsselist) > 0}">
                                                        <c:forEach items="${revaluationOfAsselist}" var="list">
                                                            <c:set value="${list.assetCode}" var="assetCode"/>
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" required="" name="assetCode" id="assetCode" value="${list.assetCode}" readonly="" onclick="SelectAssetDetailif();">
                                                                    <input type="hidden" name="pk" value="${list.SNo}">
                                                                    <input type="hidden" name="status" value="${list.status}">
                                                                    <input type="hidden" name="assetCode" value="${list.assetCode}">
                                                                    <input type="hidden" name="revaluationNo" value="${list.revaluationNo}">

                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" value="${list.assetCode}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" class="form-control" required="" placeholder="Select Property Code" id="assetCode" name="assetCode" autocomplete="off" readonly="" onclick="SelectAssetDetailif();">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>


                                        <c:if test="${fieldStatus_2 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_2 eq 'required'}"> 
                                                    <a  class="control-label-required" style="color:red;">*</a>
                                                </c:if><a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${fieldname_2}</label>                                          
                                                <c:choose>
                                                    <c:when test="${fn:length(revaluationOfAsselist) > 0}">
                                                        <c:forEach items="${revaluationOfAsselist}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">                                                                                    
                                                                    <input type="text" class="form-control" readonly="" required="" name="assetName" id="assetName" value="${list.assetName}">                                           </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" value="${list.assetName}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" class="form-control" placeholder="" required="" readonly="" id="assetName" name="assetName" autocomplete="off">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_13 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_13 eq 'required'}">
                                                    <a  class="control-label-required" style="color:red;">*</a>
                                                </c:if><a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${fieldname_13}</label>                                              

                                                <c:choose>
                                                    <c:when test="${fn:length(revaluationOfAsselist) > 0}">
                                                        <c:forEach items="${revaluationOfAsselist}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" required="" readonly="" name="subAssetCode" id="subAssetCode" value="${list.subAssetCode}">                                           </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" value="${list.subAssetCode}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" class="form-control" placeholder="" readonly="" required="" id="subAssetCode" name="subAssetCode" autocomplete="off">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <p>&nbsp;</p>

                                        <c:if test="${fieldStatus_14 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_14 eq 'required'}"> 
                                                    <a  class="control-label-required" style="color:red;">*</a>
                                                </c:if><a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${fieldname_14}</label>                                          
                                                <c:choose>
                                                    <c:when test="${fn:length(revaluationOfAsselist) > 0}">
                                                        <c:forEach items="${revaluationOfAsselist}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" required="" readonly="" name="subAssetName" id="subAssetName" value="${list.subAssetName}">     
                                                                </c:when>
                                                                <c:otherwise>                                                                                    
                                                                    <input type="text" class="form-control" readonly="" value="${list.subAssetName}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" class="form-control" required="" placeholder="" readonly="" id="subAssetName" name="subAssetName" autocomplete="off">
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
                                                    <c:when test="${fn:length(revaluationOfAsselist) > 0}">
                                                        <c:forEach items="${revaluationOfAsselist}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">   
                                                                    <input type="hidden" class="form-control" ${mand_status_3}  name="selectAddSubAsset1" id="selectAddSubAsset1" value="${list.revaluationOfAsset}" >

                                                                    <select  name="selectAddSubAsset" id="selectAddSubAsset"  ${mand_status_3} class="form-control" onchange="return DepreciationAppreciationCalculation();" >
                                                                         <option disabled="" value="">Select your option</option>                                                                                       
                                                                        <c:forEach items="${revaluation_dropdown_category}" var="list">
                                                                            <c:if test="${list[0] eq 'F-10'}">
                                                                                <option>${list[1]}</option>                                     
                                                                            </c:if>

                                                                        </c:forEach>                                                                                     
                                                                    </select> 
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" readonly="" class="form-control" name="selectAddSubAsset" value="${list.revaluationOfAsset}" id="selectAddSubAsset">  
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <select  id="selectAddSubAsset"  name="selectAddSubAsset" required="" ${mand_status_3} class="form-control" onchange="return DepreciationAppreciationCalculation();">
                                                            <option value="" disabled selected>Select your option</option>
                                                            <c:forEach items="${revaluation_dropdown_category}" var="list">
                                                                <c:if test="${list[0] eq 'F-10'}">
                                                                    <option>${list[1]}</option>                                     
                                                                </c:if>
                                                            </c:forEach>                                                                          
                                                        </select> 
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>                                            



                                        <c:if test="${fieldStatus_5 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_5 eq 'required'}">
                                                    <a  class="control-label-required" style="color:red;">*</a>
                                                </c:if> 
                                                <label class="control-label" >${fieldname_5}</label>

                                                <c:choose>
                                                    <c:when test="${fn:length(revaluationOfAsselist) > 0}">
                                                        <c:forEach items="${revaluationOfAsselist}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">                                                                                   
                                                                    <input type="text" class="form-control" required="" name="currentValueOfAsset" value="${list.currentValueOfAsset}" id="currentValueOfAsset"  onkeypress="return checkdigit(event, this, 10, 2);"  onchange="return
                                                                            DepreciationAppreciationCalculation();">
                                                                    <input type="hidden" class="form-control" required="" name="currentValueOfAsset1" value="${list.currentValueOfAsset}" id="currentValueOfAsset1"  >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" value="${list.currentValueOfAsset}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" class="form-control" required="" name="currentValueOfAsset" id="currentValueOfAsset" autocomplete="off" onkeypress="return checkdigit(event, this, 10, 2);"  onchange="return DepreciationAppreciationCalculation();">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <p>&nbsp;</p>
                                        <c:if test="${fieldStatus_6 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_6 eq 'required'}">
                                                    <a  class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${fieldname_6}</label>                                          
                                                <c:choose>
                                                    <c:when test="${fn:length(revaluationOfAsselist) > 0}">
                                                        <c:forEach items="${revaluationOfAsselist}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" required="" name="addSubValueOfAsset" id="addSubValueOfAsset" value="${list.addSubValueOfAsset}"  onkeypress="return checkdigit(event, this, 10, 2);"  onchange="return DepreciationAppreciationCalculation();" >
                                                                    <input type="hidden" class="form-control" required="" name="addSubValueOfAsset1" id="addSubValueOfAsset1" value="${list.addSubValueOfAsset}"   >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" value="${list.addSubValueOfAsset}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" class="form-control" required="" name="addSubValueOfAsset" id="addSubValueOfAsset" autocomplete="off"  onkeypress="return checkdigit(event, this, 10, 2);" onchange="return DepreciationAppreciationCalculation();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                        </c:if>

                                        <c:if test="${fieldStatus_8 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_8 eq 'required'}">
                                                    <a  class="control-label" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${fieldname_8}</label>                                          
                                                <c:choose>
                                                    <c:when test="${fn:length(revaluationOfAsselist) >0}">
                                                        <c:forEach items="${revaluationOfAsselist}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">                                                                                  
                                                                    <input type="text" class="form-control" name="newLifeSpan" value="${list.newLifeSpan}" id="newLifeSpan"   onkeypress="return checkdigit(event, this, 10, 2);"  onchange="return DepreciationAppreciationCalculation()
                                                                                    ;">
                                                                    <input type="hidden" class="form-control" name="newLifeSpan1" value="${list.newLifeSpan}" id="newLifeSpan1" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" value="${list.newLifeSpan}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" class="form-control" required="" value="" name="newLifeSpan" id="newLifeSpan" autocomplete="off"   onkeypress="return checkdigit(event, this, 10, 2);" onchange="return DepreciationAppreciationCalculation();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                        </c:if>

                                        <c:if test="${fieldStatus_15 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_15 eq 'required'}">
                                                    <a  class="control-label" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${fieldname_15}</label>                                          
                                                <c:choose>
                                                    <c:when test="${fn:length(revaluationOfAsselist) > 0}">
                                                        <c:forEach items="${revaluationOfAsselist}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}"> 
                                                                    <input type="text" class="form-control input-xlarge" readonly="" required="" name="startDate" id="startDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.startDate}"/>" onclick="javascript:NewCssCal('startDate', 'ddMMMyyyy', '', '', '', '', 'past')"  onchange="return DepreciationAppreciationCalculation();">
                                                                    <input type="hidden" class="form-control input-xlarge" name="todayDate" id="todayDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="<%= new java.util.Date()%>"/>" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.startDate}"/>">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" class="form-control input-xlarge" readonly="" placeholder="Select Start Date" required="" name="startDate" id="startDate" autocomplete="off" onclick="javascript:NewCssCal('startDate', 'ddMMMyyyy', '', '', '', '', 'past')"  onchange="return DepreciationAppreciationCalculation();">
                                                        <input type="hidden" class="form-control input-xlarge" name="todayDate" id="todayDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="<%= new java.util.Date()%>"/>" >
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                        </c:if>

                                        <p>&nbsp;</p>


                                        <c:if test="${fieldStatus_7 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_7 eq 'required'}">
                                                    <a  class="control-label-required" style="color:red;">*</a>
                                                </c:if>   <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>                                       
                                                <label class="control-label">${fieldname_7}</label>                                                          
                                                <c:choose>
                                                    <c:when test="${fn:length(revaluationOfAsselist) > 0}">
                                                        <c:forEach items="${revaluationOfAsselist}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">                                                                                     
                                                                    <input type="text" class="form-control validate[custom[float]]" name="newDepreciation" maxlength="3" value="${list.newDepreciation}" id="newDepreciation"  onkeypress="return checkdigit(event, this, 10, 2);" >
                                                                    <input type="hidden" class="form-control" readonly  name="newDepreciationPercentage" value="" id="newDepreciationPercentage" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" readonly="" value="${list.newDepreciation}">
                                                                    <input type="hidden" class="form-control" readonly  name="newDepreciationPercentage" value="" id="newDepreciationPercentage" >
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" class="form-control validate[custom[float]]" readonly="" name="newDepreciation" id="newDepreciation" maxlength="3"  autocomplete="off" onkeypress="return checkdigit(event, this, 10, 2);" > 
                                                        <input type="hidden" class="form-control" required="" readonly  name="newDepreciationPercentage" value="" id="newDepreciationPercentage" >
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
                                                    <c:when test="${fn:length(revaluationOfAsselist) > 0}">
                                                        <c:forEach items="${revaluationOfAsselist}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">                                                                                     
                                                                    <input type="hidden" class="form-control" id="pk" name="pk" value="${list.SNo}" >
                                                                    <input type="hidden" class="form-control" id="created_user_dateTime" name="created_user_dateTime" value="<fmt:formatDate value="${list.createdDate}" pattern="dd-MMM-yyyy" /> ">
                                                                    <input type="text" class="form-control" readonly="" name="revaluedLeftOut" value="${list.revaluedLeftOut}" id="revaluedLeftOut">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" value="${list.revaluedLeftOut}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise> 
                                                        <input type="text" class="form-control" placeholder="autocalculate" readonly="" name="revaluedLeftOut" id="revaluedLeftOut" autocomplete="off">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>

                                        <%--  <c:if test="${fieldStatus_10 eq 'y'}">
                                              <div class="col-md-4 col-sm-12 col-xs-12 form-inline" style="display: none;">                                        
                                                  <c:if test="${mand_status_10 eq 'required'}"> 
                                                      <a  class="control-label-required" style="color:red;">*</a>
                                                  </c:if>
                                                  <label class="control-label">${fieldname_10}</label>
                                                  <c:choose>
                                                      <c:when test="${fn:length(revaluationOfAsselist) > 0}">
                                                          <c:forEach items="${revaluationOfAsselist}" var="list">
                                                              <c:choose>
                                                                  <c:when test="${action eq 'edit'}">                                                                    
                                                                      <input type="text" class="form-control"  name="previousValueLeftOut" value="${list.previousValueLeftOut}" id="totalValueLeftoutAsset1"  onkeypress="return checkdigit(event, this, 10, 2);" >
                                                                  </c:when>
                                                                  <c:otherwise>
                                                                      <input type="text" class="form-control" readonly="" value="${list.previousValueLeftOut}">
                                                                  </c:otherwise> 
                                                              </c:choose>
                                                          </c:forEach>
                                                      </c:when>
                                                      <c:otherwise> 
                                                          <input type="text" class="form-control"   name="previousValueLeftOut" id="previousValueLeftOut" autocomplete="off"  onkeypress="return checkdigit(event, this, 10, 2);" >
                                                      </c:otherwise>        
                                                  </c:choose>
                                              </div>
                                          </c:if>   --%>
                                        <c:if test="${fieldStatus_716 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">                                        
                                                <c:if test="${mand_status_716 eq 'required'}"> 
                                                    <a  class="control-label" style="color:red;">*</a>
                                                </c:if> <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a> 
                                                <label class="control-label">${fieldname_716}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(revaluationOfAsselist) > 0}">
                                                        <c:forEach items="${revaluationOfAsselist}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">                                                                                     
                                                                    <textarea class="form-control" name="reason" id="reason" maxlength="${max_length_716}" autocomplete="off" style="resize: none;" ${mand_status_716}  rows="1">${list.reason}</textarea>
                                                                    <input id="reason1" class="form-control" type="hidden" value="${list.reason}">

                                                                </c:when>
                                                                <c:otherwise>
                                                                    <textarea class="form-control" name="reason" style="resize: none; " rows="1" readonly>${list.reason}</textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise> 
                                                        <textarea class="form-control" name="reason" maxlength="${max_length_716}" autocomplete="off" style="resize: none;" id="reason" ${mand_status_716}  rows="1"></textarea>
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>

                                        <p>&nbsp;</p>
                                        <div class="col-md-12 col-sm-12">                                 
                                            <label class="control-label" ><span style="color:transparent"></span>Attachment(s)</label>
                                            <input type="hidden" name="count" value="1" />
                                            <c:choose>
                                                <c:when test="${fn:length(revaluationOfAsselist) > 0}">
                                                    <c:forEach items="${revaluationOfAsselist}" var="list">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">   
                                                                <c:set var="i" value="1"/> 
                                                                <c:forEach items="${revaluationAttach}" var="list">


                                                                    <div class="removeattach" id="del${i}">
                                                                        <div id="field" class="col-md-12 col-sm-12">
                                                                            <button type="button" style="display: inline!important;" id="r1${i}" class="btn btn-danger r1">-</button>
                                                                            <a href="../assetsm/revaluationAttachDownload.htm?sno=${list.SNo}"  >
                                                                                <input type="text" id="imgtxt" name="imgtxt" readonly="" class="form-control capitalize " value="${list.filename}" > <span> </span>
                                                                            </a>                                                                        
                                                                            <input type="hidden" id="attsno${i}" name="attsno" value="${list.SNo}">
                                                                        </div>
                                                                    </div>

                                                                </c:forEach>
                                                                <c:set var="i" value="${i+1}"/>
                                                                <input type="hidden" id="tobedel" name="tobedel" value="">
                                                                <input type="hidden" name="count" value="1" />
                                                                <div >
                                                                    <div id="adiv1"  class="col-md-4 col-sm-12 ">
                                                                        <button type="button" style="display: inline!important;opacity: 0.65;cursor: not-allowed;" id="1remove" class="btn btn-danger remove-me1">-</button>
                                                                        <input style="display: inline!important;" class="form-control" type="text" id="attachname1" name="documentname"  class="form-control" maxlength="20" value="" placeholder="Attachment Name" >
                                                                        <!--<input style="display: inline!important;" id="field1" name="attachments" type="file" value="" onchange="readURL1(this);">-->
                                                                        <input style="display: none;" id="field1" class="filecls" name="attachments" type="file"  value="" onchange="readURL1(this);
                                                                                setAttachName(1);"> 
                                                                        <input type="button" id="btnb1" class="btn btn-primary" value="Browse..." onclick="browseFile(1);" />
                                                                        <!--<span id="error7" style="color: red; font: bold; display: none; text-align: right;margin-left: 160px;">Please enter Atleast One Attachment....</span>-->

                                                                    </div>
                                                                    <button style="display: inline!important;color: white;font-weight: bold;" id="b1" class="btn add-more" type="button">+</button>
                                                                    <span class="nowrap">(Click press + to add another attachment)</span>
                                                                </div> 


                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:forEach items="${revaluationAttach}" var="list">
                                                                    <div>
                                                                        <div id="field" class="col-md-12 col-sm-12">

                                                                            <a href="../assetsm/revaluationAttachDownload.htm?sno=${list.SNo}"  >
                                                                                <input type="text" id="imgtxt" name="imgtxt" readonly="" class="form-control capitalize " value="${list.filename}" > 
                                                                            </a><br><br/>
                                                                        </div>
                                                                    </div>
                                                                </c:forEach>

                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise> 
                                                    <div >
                                                        <div id="adiv1"  class="col-md-4 col-sm-12 ">
                                                            <button type="button" style="display: inline!important;opacity: 0.65;cursor: not-allowed;" id="1remove" class="btn btn-danger remove-me1">-</button>
                                                            <input style="display: inline!important;" class="form-control" type="text" id="attachname1" name="documentname"  class="form-control" maxlength="20" value="" placeholder="Attachment Name" >
                                                            <!--<input style="display: inline!important;" id="field1" name="attachments" type="file" value="" onchange="readURL1(this);">-->
                                                            <input style="display: none;" id="field1" class="filecls" name="attachments" type="file"  value="" onchange="readURL1(this);
                                                                    setAttachName(1);"> 
                                                            <input type="button" id="btnb1" class="btn btn-primary" value="Browse..." onclick="browseFile(1);" />
                                                            <!--<span id="error7" style="color: red; font: bold; display: none; text-align: right;margin-left: 160px;">Please enter Atleast One Attachment....</span>-->

                                                        </div>
                                                        <button style="display: inline!important;color: white;font-weight: bold;" id="b1" class="btn add-more" type="button">+</button>
                                                        <span class="nowrap">(Click press + to add another attachment)</span>
                                                    </div>                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                        <br>
                                        <p>&nbsp;</p>
                                        <c:if test="${action ne 'view' && action ne 'edit'}">

                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                <button type="submit" class="btn btn-primary" >Save</button>  
                                                <!--                                                                           <button type="button" class="btn btn-primary" >Save</button>  -->
                                                <a href="../assetsm/revaluationOfAsseList.htm"  class="btn btn-danger"  style="">Cancel</a>
                                            </div>

                                        </c:if>

                                        <c:if test="${action eq 'edit'  }">

                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                                <button type="button" class="btn btn-primary" style="" onclick="return test();">Save</button>
                                                <a href="../master/insuranceMasterList.htm" class="btn btn-danger">Cancel</a>
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
        <script src="../CRM/scripts/general-menu-scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/general-sales_scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/mioinvoice-menu-scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/mioinvoice-sales-scripts.js" type="text/javascript"></script>

        <script src="../master/scripts/general-attach-script.js" type="text/javascript"></script>
        <script src="../master/scripts/mioinvoice-attach-script.js" type="text/javascript"></script>
    </body>


</html>

