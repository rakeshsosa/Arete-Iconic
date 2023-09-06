<%-- 
    Document   : splitOfAssetForm
    Created on : 14 Oct, 2016, 12:01:04 PM
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
        <link href="../common/validate/css/opa-icons.css" rel="stylesheet" type="text/css"/>
        <link href="../common/theme/validationEngine.css" rel="stylesheet" type="text/css"/>
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.min.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.js" type="text/javascript"></script>
        <script src="../common/datepicker/datetimepicker_css.js" type="text/javascript"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
        <title>arête Assets Management</title>     
        <script>
            jQuery(document).ready(function () {
                $('#userform').validationEngine();
            });
            //pop up to select  assetcode, assetname, subassetcode and subassetname
            function SelectAssetDetailif() {
                myWindow = window.open("../assetsm/splitOfAssetPopUp.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=99,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function isNumber(evt) {
                evt = (evt) ? evt : window.event;
                var charCode = (evt.which) ? evt.which : evt.keyCode;
                if (charCode > 31 && (charCode < 46 || charCode > 57 || charCode === 47)) {
                    alert("Please enter valid number");
                    return false;
                }
                return true;
            }

            function  formValidate() {     //            
                var assetCode = document.getElementById('assetCode').value;
                var purchaseValue = document.getElementById('purchaseValue').value;
                var currentValueOfAsset1 = document.getElementById('currentValueOfAsset1').value;
                var currentValueOfAsset2 = document.getElementById('currentValueOfAsset2').value;
                var assetCurrentValue = document.getElementById('assetCurrentValue').value;
                if (assetCode === null || assetCode === '') {
                    alert('Please Select Property Code');
                    $("#assetCode").focus();
                    return  false;
                }

                if ((purchaseValue === null || purchaseValue === '') || (currentValueOfAsset1 === null || currentValueOfAsset1 === '') || (currentValueOfAsset2 === null || currentValueOfAsset2 === '') || (assetCurrentValue === null || assetCurrentValue === '')) {
                    alert('Please fill mandatory fields');
//                          $("#assetCode").focus();
                    return  false;
                }

            }

            function test()
            {
                var assetcurr = document.getElementById("assetCurrentValue").value;
                var assetcurr1 = document.getElementById("assetCurrentValue1").value;
                var assetprov1 = document.getElementById("assetSplittingProportionateValue1").value;
                var assetprov11 = document.getElementById("assetSplittingProportionateValue11").value;
                var pval = document.getElementById("purchaseValue").value;
                var pval1 = document.getElementById("purchaseValue1").value;
                var assetprov2 = document.getElementById("assetSplittingProportionateValue2").value;
                var assetprov22 = document.getElementById("assetSplittingProportionateValue22").value;
                var currvalasset1 = document.getElementById("currentValueOfAsset1").value;
                var currvalasset11 = document.getElementById("currentValueOfAsset11").value;
                var currvalasset2 = document.getElementById("currentValueOfAsset2").value;
                var currvalasset22 = document.getElementById("currentValueOfAsset22").value;
                var deasset1 = document.getElementById("depreciationForAsset1").value;
                var deasset11 = document.getElementById("depreciationForAsset11").value;
                var deasset2 = document.getElementById("depreciationForAsset2").value;
                var deasset22 = document.getElementById("depreciationForAsset22").value;
                var totalvalasset1 = document.getElementById("totalValueLeftoutAsset1").value;
                var totalvalasset11 = document.getElementById("totalValueLeftoutAsset11").value;
                var totalvalasset2 = document.getElementById("totalValueLeftoutAsset2").value;
                var totalvalasset22 = document.getElementById("totalValueLeftoutAsset22").value;

                if (document.getElementById("assetCurrentValue").value == "")
                {
                    alert("Enter  Property Current Value");
                    return false;
                } else if (document.getElementById("purchaseValue").value == "")
                {
                    alert("Enter Purchase Value");
                    return false;
                } else if (document.getElementById("currentValueOfAsset1").value == "")
                {
                    alert("Enter Current ValueOfAsset");
                    return false;
                } else if (document.getElementById("currentValueOfAsset2").value == "")
                {
                    alert("Enter Current ValueOfAsset");
                    return false;
                }
                else {

                    if (assetcurr !== assetcurr1 || assetprov1 !== assetprov11 || pval !== pval1 || assetprov2 !== assetprov22
                            || currvalasset1 !== currvalasset11 || currvalasset2 !== currvalasset22 || deasset1 !== deasset11 || deasset2 !== deasset22
                            || totalvalasset1 !== totalvalasset11 || totalvalasset2 !== totalvalasset22) {
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
                                <jsp:include page="../login/headerlink.htm?submodule=Property Split&tab=Property Split&pagetype=form"/>

                                <div class="x_title">
                                    <h2>Split of Property Details</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br/>


                                    <form id="userform" method="post" name="form" class="form-inline" action="../assetsm/splitOfAssetFormSubmit.htm" enctype="multipart/form-data" onsubmit="return formValidate();">
                                        <c:choose>
                                            <c:when test="${fn:length(assetSplitlist) > 0}">
                                                <c:forEach items="${assetSplitlist}" var="list">
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
                                        <%-- Set the Attribute  --%>

                                        <c:forEach items="${split_asset_category}" var="list">                                                       

                                            <c:if test="${list[0] eq '514'}">
                                                <c:set value="${list[1]}" var="fieldname_1"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_1"/>
                                                <c:set value="${list[3]}" var="mand_status_1"/>
                                            </c:if>  
                                            <c:if test="${list[0] eq '515'}">
                                                <c:set value="${list[1]}" var="fieldname_2"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_2"/>
                                                <c:set value="${list[3]}" var="mand_status_2"/>                                                          
                                            </c:if>
                                            <c:if test="${list[0] eq '516'}">
                                                <c:set value="${list[1]}" var="fieldname_3"/> 
                                                <c:set value="${list[2]}" var="fieldStatus_3"/>
                                                <c:set value="${list[3]}" var="mand_status_3"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '517'}">
                                                <c:set value="${list[1]}" var="fieldname_4"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_4"/>
                                                <c:set value="${list[3]}" var="mand_status_4"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '518'}">
                                                <c:set value="${list[1]}" var="fieldname_5"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_5"/>
                                                <c:set value="${list[3]}" var="mand_status_5"/>
                                            </c:if>                                                       
                                            <c:if test="${list[0] eq '519'}">
                                                <c:set value="${list[1]}" var="fieldname_6"/> 
                                                <c:set value="${list[2]}" var="fieldStatus_6"/>
                                                <c:set value="${list[3]}" var="mand_status_6"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '520'}">
                                                <c:set value="${list[1]}" var="fieldname_7"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_7"/>
                                                <c:set value="${list[3]}" var="mand_status_7"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '521'}">
                                                <c:set value="${list[1]}" var="fieldname_8"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_8"/>
                                                <c:set value="${list[3]}" var="mand_status_8"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '522'}">
                                                <c:set value="${list[1]}" var="fieldname_9"/> 
                                                <c:set value="${list[2]}" var="fieldStatus_9"/>
                                                <c:set value="${list[3]}" var="mand_status_9"/>
                                            </c:if>                                                      

                                            <c:if test="${list[0] eq '523'}">
                                                <c:set value="${list[1]}" var="fieldname_10"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_10"/>
                                                <c:set value="${list[3]}" var="mand_status_10"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '524'}">
                                                <c:set value="${list[1]}" var="fieldname_11"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_11"/>
                                                <c:set value="${list[3]}" var="mand_status_11"/>
                                            </c:if>                                                         
                                            <c:if test="${list[0] eq '525'}">
                                                <c:set value="${list[1]}" var="fieldname_12"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_12"/>
                                                <c:set value="${list[3]}" var="mand_status_12"/>
                                            </c:if>  
                                            <c:if test="${list[0] eq '536'}">
                                                <c:set value="${list[1]}" var="fieldname_13"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_13"/>
                                                <c:set value="${list[3]}" var="mand_status_13"/>
                                            </c:if>                                                         
                                            <c:if test="${list[0] eq '537'}">
                                                <c:set value="${list[1]}" var="fieldname_14"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_14"/>
                                                <c:set value="${list[3]}" var="mand_status_14"/>
                                            </c:if> 
                                            <c:if test="${list[0] eq '568'}">
                                                <c:set value="${list[1]}" var="fieldname_15"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_15"/>
                                                <c:set value="${list[3]}" var="mand_status_15"/>
                                            </c:if>                                                         
                                            <c:if test="${list[0] eq '569'}">
                                                <c:set value="${list[1]}" var="fieldname_16"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_16"/>
                                                <c:set value="${list[3]}" var="mand_status_16"/>
                                            </c:if> 
                                        </c:forEach> 

                                        <c:if test="${fieldStatus_1 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_1 eq 'required'}">
                                                    <a  class="control-label" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${fieldname_1}</label>                                              

                                                <c:choose>
                                                    <c:when test="${fn:length(assetSplitlist) > 0}">
                                                        <c:forEach items="${assetSplitlist}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" required="" name="assetCode" id="assetCode" value="${list.assetCode}" readonly="" onclick="SelectAssetDetailif();">                                           </c:when>
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
                                                <c:if test="${mand_status_3 eq 'required'}"> 
                                                    <a  class="control-label" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${fieldname_2}</label>                                         
                                                <c:choose>
                                                    <c:when test="${fn:length(assetSplitlist) > 0}">
                                                        <c:forEach items="${assetSplitlist}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <%--${list.assetDescription} 
                                                                    ${list.assetDescription}
                                                                    --%>
                                                                    <input type="text" class="form-control" readonly="" name="assetName" id="assetName" value="${list.assetName}">                                           </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" value="${list.assetName}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" class="form-control" placeholder="" readonly="" id="assetName" name="assetName" autocomplete="off">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_13 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_13 eq 'required'}">
                                                    <a  class="control-label" style="color:red;">*</a>
                                                </c:if> <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${fieldname_13}</label>                                              

                                                <c:choose>
                                                    <c:when test="${fn:length(assetSplitlist) > 0}">
                                                        <c:forEach items="${assetSplitlist}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" name="subAssetCode" id="subAssetCode" value="${list.subAssetCode}">                                           </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" value="${list.subAssetCode}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" class="form-control" placeholder="" readonly="" id="subAssetCode" name="subAssetCode" autocomplete="off">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <br><br><br> 

                                        <c:if test="${fieldStatus_14 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_14 eq 'required'}"> 
                                                    <a  class="control-label" style="color:red;">*</a>
                                                </c:if> <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${fieldname_14}</label>                                          
                                                <c:choose>
                                                    <c:when test="${fn:length(assetSplitlist) > 0}">
                                                        <c:forEach items="${assetSplitlist}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" name="subAssetName" id="subAssetName" value="${list.subAssetName}">     
                                                                </c:when>
                                                                <c:otherwise>                                                                                     
                                                                    <input type="text" class="form-control" readonly="" value="${list.subAssetName}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" class="form-control" placeholder="" readonly="" id="subAssetName" name="subAssetName" autocomplete="off">
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
                                                    <c:when test="${fn:length(assetSplitlist) > 0}">
                                                        <c:forEach items="${assetSplitlist}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" name="assetCurrentValue" id="assetCurrentValue" value="${list.assetCurrentValue}"  onkeypress="return checkdigit(event, this, 10, 2);" >                                          
                                                                    <input type="hidden" class="form-control" name="assetCurrentValue1" id="assetCurrentValue1" value="${list.assetCurrentValue}" >                                          
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" value="${list.assetCurrentValue}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" class="form-control" id="assetCurrentValue" name="assetCurrentValue" autocomplete="off" required="" onkeypress="return checkdigit(event, this, 10, 2);" >
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_4 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_4 eq 'required'}">
                                                    <a  class="control-label" style="color:red;">*</a>
                                                </c:if> <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label" for="selectError">${fieldname_4}</label>

                                                <c:choose>
                                                    <c:when test="${fn:length(assetSplitlist) > 0}">
                                                        <c:forEach items="${assetSplitlist}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" name="assetSplittingProportionateValue1" id="assetSplittingProportionateValue1" value="${list.assetSplittingProportionateValue1}" onkeypress="return checkdigit(event, this, 10, 2);" >
                                                                    <input type="hidden" class="form-control" name="assetSplittingProportionateValue11" id="assetSplittingProportionateValue11" value="${list.assetSplittingProportionateValue1}" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" value="${list.assetSplittingProportionateValue1}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" class="form-control" name="assetSplittingProportionateValue1" id="assetSplittingProportionateValue1" autocomplete="off"  onkeypress="return checkdigit(event, this, 10, 2);" >
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <br><br><br>
                                        <c:if test="${fieldStatus_5 eq 'y'}"> 
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_5 eq 'required'}">
                                                    <a  class="control-label" style="color:red;">*</a>
                                                </c:if> 
                                                <label class="control-label" for="selectError">${fieldname_5}</label>

                                                <c:choose>
                                                    <c:when test="${fn:length(assetSplitlist) > 0}">
                                                        <c:forEach items="${assetSplitlist}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" name="purchaseValue" value="${list.purchaseValue}" id="purchaseValue"  onkeypress="return checkdigit(event, this, 10, 2);" >
                                                                    <input type="hidden" class="form-control" name="purchaseValue1" value="${list.purchaseValue}" id="purchaseValue1" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" value="${list.purchaseValue}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                                   
                                                        <input type="text" class="form-control" required="" name="purchaseValue" id="purchaseValue" autocomplete="off"  onkeypress="return checkdigit(event, this, 10, 2);" >
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_6 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_6 eq 'required'}">
                                                    <a style="color:red;font-size: 15px;font-weight: bold;">*</a>
                                                </c:if> <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${fieldname_6}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(assetSplitlist) > 0}">
                                                        <c:forEach items="${assetSplitlist}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">                                                                                   
                                                                    <input type="text" class="form-control" name="assetSplittingProportionateValue2" value="${list.assetSplittingProportionateValue2}" id="assetSplittingProportionateValue2"  onkeypress="return checkdigit(event, this, 10, 2);" >
                                                                    <input type="hidden" class="form-control" name="assetSplittingProportionateValue22" value="${list.assetSplittingProportionateValue2}" id="assetSplittingProportionateValue22" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" value="${list.assetSplittingProportionateValue2}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" class="form-control" name="assetSplittingProportionateValue2" id="assetSplittingProportionateValue2" autocomplete="off"  onkeypress="return checkdigit(event, this, 10, 2);" >
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_9 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_9 eq 'required'}">
                                                    <a  class="control-label-required" style="color:red;">*</a>    
                                                </c:if>
                                                <label class="control-label">${fieldname_9}</label>                                                     
                                                <c:choose>
                                                    <c:when test="${fn:length(assetSplitlist) >0}">
                                                        <c:forEach items="${assetSplitlist}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">                                                                                   
                                                                    <input type="text" class="form-control" name="currentValueOfAsset1" value="${list.currentValueOfAsset1}" id="currentValueOfAsset1"   onkeypress="return checkdigit(event, this, 10, 2);" >
                                                                    <input type="hidden" class="form-control" name="currentValueOfAsset11" value="${list.currentValueOfAsset1}" id="currentValueOfAsset11" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" value="${list.currentValueOfAsset1}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" class="form-control" value="" required="" name="currentValueOfAsset1" id="currentValueOfAsset1" autocomplete="off"   onkeypress="return checkdigit(event, this, 10, 2);" >
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                        </c:if>
                                        <br><br><br>    
                                        <c:if test="${fieldStatus_10 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">                                        

                                                <c:if test="${mand_status_10 eq 'required'}"> 
                                                    <a  class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${fieldname_10}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(assetSplitlist) > 0}">
                                                        <c:forEach items="${assetSplitlist}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <%-- 
                                                                            ${list.currentValueOfAsset2}
                                                                    --%>
                                                                    <input type="hidden" class="form-control" id="pk" name="pk" value="${list.SNo}" >
                                                                    <input type="hidden" class="form-control" id="created_user_dateTime" name="created_user_dateTime" value="<fmt:formatDate value="${list.createdDate}" pattern="dd-MMM-yyyy" /> ">
                                                                    <input type="text" class="form-control"  name="currentValueOfAsset2" value="${list.currentValueOfAsset2}" id="currentValueOfAsset2"   onkeypress="return checkdigit(event, this, 10, 2);" >
                                                                    <input type="hidden" class="form-control"  name="currentValueOfAsset22" value="${list.currentValueOfAsset2}" id="currentValueOfAsset22" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" value="${list.currentValueOfAsset2}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise> 
                                                        <input type="text" class="form-control" required="" name="currentValueOfAsset2" id="currentValueOfAsset2" autocomplete="off"  onkeypress="return checkdigit(event, this, 10, 2);" >
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_15 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_15 eq 'required'}">
                                                    <a  class="control-label" style="color:red;">*</a>
                                                </c:if>   <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>                                       
                                                <label class="control-label ">${fieldname_15}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(assetSplitlist) > 0}">
                                                        <c:forEach items="${assetSplitlist}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control validate[custom[float]]" name="depreciationForAsset1" value="${list.depreciationForAsset1}" id="depreciationForAsset1"   onkeypress="return checkdigit(event, this, 4, 2);" >
                                                                    <input type="hidden" class="form-control validate[custom[float]]" name="depreciationForAsset11" value="${list.depreciationForAsset1}" id="depreciationForAsset11"  >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" value="${list.depreciationForAsset1}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" class="form-control validate[custom[float]]" name="depreciationForAsset1" id="depreciationForAsset1" autocomplete="off"  onkeypress="return checkdigit(event, this, 4, 2);"  > 
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_16 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_16 eq 'required'}">
                                                    <a  class="control-label" style="color:red;">*</a>
                                                </c:if><a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${fieldname_16}</label>                                          
                                                <c:choose>
                                                    <c:when test="${fn:length(assetSplitlist) >0}">
                                                        <c:forEach items="${assetSplitlist}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">                                                                                     
                                                                    <input type="text" class="form-control validate[custom[float]]" name="depreciationForAsset2" value="${list.depreciationForAsset2}" id="depreciationForAsset2"  onkeypress="return checkdigit(event, this, 4, 2);" >
                                                                    <input type="hidden" class="form-control validate[custom[float]]" name="depreciationForAsset22" value="${list.depreciationForAsset2}" id="depreciationForAsset22" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control " readonly="" value="${list.depreciationForAsset2}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" class="form-control validate[custom[float]]" value="" name="depreciationForAsset2" id="depreciationForAsset2" autocomplete="off"  onkeypress="return checkdigit(event, this, 4, 2);" >
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                        </c:if>
                                        <br><br><br>
                                        <c:if test="${fieldStatus_11 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">                                        
                                                <c:if test="${mand_status_11 eq 'required'}"> 
                                                    <a  class="control-label" style="color:red;">*</a>
                                                </c:if> <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${fieldname_11}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(assetSplitlist) > 0}">
                                                        <c:forEach items="${assetSplitlist}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">                                                                    
                                                                    <input type="text" class="form-control" name="totalValueLeftoutAsset1" value="${list.totalValueLeftoutAsset1}" id="totalValueLeftoutAsset1"  onkeypress="return checkdigit(event, this, 10, 2);" >
                                                                    <input type="hidden" class="form-control" name="totalValueLeftoutAsset11" value="${list.totalValueLeftoutAsset1}" id="totalValueLeftoutAsset11"  >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" value="${list.totalValueLeftoutAsset1}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise> 
                                                        <input type="text" class="form-control"  name="totalValueLeftoutAsset1" id="totalValueLeftoutAsset1" autocomplete="off"  onkeypress="return checkdigit(event, this, 10, 2);" >
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_12 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">                                        
                                                <c:if test="${mand_status_12 eq 'required'}"> 
                                                    <a  class="control-label-required" style="color:red;">*</a>
                                                </c:if><a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${fieldname_12}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(assetSplitlist) > 0}">
                                                        <c:forEach items="${assetSplitlist}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">                                                                    
                                                                    <input type="text" class="form-control" name="totalValueLeftoutAsset2" value="${list.totalValueLeftoutAsset2}" id="totalValueLeftoutAsset2"  onkeypress="return checkdigit(event, this, 10, 2);" >
                                                                    <input type="hidden" class="form-control" name="totalValueLeftoutAsset22" value="${list.totalValueLeftoutAsset2}" id="totalValueLeftoutAsset22" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" value="${list.totalValueLeftoutAsset2}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise> 
                                                        <input type="text" class="form-control"  name="totalValueLeftoutAsset2" id="totalValueLeftoutAsset2" autocomplete="off"  onkeypress="return checkdigit(event, this, 10, 2);" >
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <p>&nbsp;</p>                                    
                                        <div class="col-md-12 col-sm-12">                                 
                                            <label class="control-label" ><span style="color:transparent"></span>Attachment(s)</label>
                                            <input type="hidden" name="count" value="1" />
                                            <c:choose>
                                                <c:when test="${fn:length(assetSplitlist) > 0}">
                                                    <c:forEach items="${assetSplitlist}" var="list">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">   
                                                                <c:set var="i" value="1"/> 
                                                                <c:forEach items="${assetAttach}" var="list">


                                                                    <div class="removeattach" id="del${i}">
                                                                        <div id="field" class="col-md-12 col-sm-12">
                                                                            <button type="button" style="display: inline!important;" id="r1${i}" class="btn btn-danger r1">-</button>
                                                                            <a href="../assetsm/AttachDownload.htm?SNo=${list.SNo}"  >
                                                                                <input type="text" id="imgtxt" name="imgtxt" readonly="" class="form-control capitalize " value="${list.attachName}" > <span> </span>
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
                                                                <c:forEach items="${assetAttach}" var="list">
                                                                    <div>
                                                                        <div id="field" class="col-md-12 col-sm-12">

                                                                            <a href="../assetsm/AttachDownload.htm?SNo=${list.SNo}"  >
                                                                                <input type="text" id="imgtxt" name="imgtxt" readonly="" class="form-control capitalize " value="${list.attachName}" > 
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





                                        <!--                                        <div class="col-md-12 col-sm-12">
                                                                                    <label class="control-label" ><span style="color:red">*</span>Attachment(s)</label>
                                                                                    <input type="hidden" name="count" value="1" />
                                                                                    <div >
                                                                                        <div id="adiv1"  class="col-md-4 col-sm-12 ">
                                                                                            <button type="button" style="display: inline!important;opacity: 0.65;cursor: not-allowed;" id="1remove" class="btn btn-danger remove-me1">-</button>
                                                                                            <input style="display: inline!important;" class="form-control validate[required]" type="text" id="attachname1" name="documentname"  class="form-control" maxlength="20" value="" placeholder="Attachment Name" >
                                                                                            <input style="display: inline!important;" id="field1" name="attachments" type="file" value="" onchange="readURL1(this);">
                                                                                            <input style="display: none;" id="field1" class="filecls" name="attachments" type="file"  value="" onchange="readURL1(this);
                                                                                                    setAttachName(1);"> 
                                                                                            <input type="button" id="btnb1" class="btn btn-primary" value="Browse..." onclick="browseFile(1);" />
                                                                                            <span id="error7" style="color: red; font: bold; display: none; text-align: right;margin-left: 160px;">Please enter Atleast One Attachment....</span>
                                        
                                                                                        </div>
                                                                                        <button style="display: inline!important;color: white;font-weight: bold;" id="b1" class="btn add-more" type="button">+</button>
                                                                                        <span class="nowrap">(Press + to add another attachment)</span>
                                                                                    </div>
                                                                                </div>-->




                                        <%-- Keep Buttons here --%>                                                 
                                        <p>&nbsp;</p> 

                                        <c:if test="${action ne 'view' && action ne 'edit'}">

                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                <button type="submit" class="btn btn-primary">Save</button>  
                                                <a href="../assetsm/splitOfAssetList.htm"  class="btn btn-danger"  style="">Cancel</a>
                                            </div>

                                        </c:if>

                                        <c:if test="${action eq 'edit'  }">

                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                                <button type="button" class="btn btn-primary" style="" onclick="return test();">Save</button>
                                                <a href="../assetsm/splitOfAssetList.htm" class="btn btn-danger">Cancel</a>
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
