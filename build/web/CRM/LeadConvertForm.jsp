<%-- 
    Document   : LeadConvertForm
    Created on : 14 Sep, 2016, 10:25:51 AM
    Author     : ebs-sdd27
--%>

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
        <title>arête Assets Management</title>
        <script type="text/javascript">
            $(document).ready(function () {
                $("input").on("keypress", function (e) {

                    if (e.which === 32 && !this.value.length)
                        e.preventDefault();
                });
                $("#llContactno").change(function () {
                    var phone = $('input[name="llContactno"]').val(),
                            intRegex = /[0-9 -()+]+$/;
                    if ((phone.length < 8) || (!intRegex.test(phone)))
                    {
                        $('#llContactno').val('');
                        alert('Please enter a valid phone number.');
                        return false;
                    }
                });
                $("#llWorkContactno").change(function () {
                    var phone = $('input[name="llWorkContactno"]').val(),
                            intRegex = /[0-9 -()+]+$/;
                    if ((phone.length < 8) || (!intRegex.test(phone)))
                    {
                        $('#llWorkContactno').val('');
                        alert('Please enter a valid phone number.');
                        return false;
                    }
                });
                $("#tenantContactno").change(function () {
                    var phone = $('input[name="tenantContactno"]').val();
                    intRegex = /[0-9 -()+]+$/;
                    if ((phone.length < 8) || (!intRegex.test(phone)))
                    {
                        $('#tenantContactno').val('');
                        alert('Please enter a valid phone number.');
                        return false;
                    }
                });
                $("#tenantWorkContactno").change(function () {
                    var phone = $('input[name="tenantWorkContactno"]').val(),
                            intRegex = /[0-9 -()+]+$/;
                    if ((phone.length < 8) || (!intRegex.test(phone)))
                    {
                        $('#tenantWorkContactno').val('');
                        alert('Please enter a valid phone number.');
                        return false;
                    }
                });
            });
            function selectLandLord()
            {
                myWindow = window.open("../tenant/selectLandLord.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
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
            function  emailValidate()
            {
                var emailId = document.getElementById("tenantMailid").value;
                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                if (!emailId.match(mailformat))
                {
                    alert("You have entered an invalid email address!");
                    $("#tenantMailid").val("");
                    return false;
                }

            }

//             function mobileNoValidation()
//            {
//
//                var mobileNo = document.getElementById("tenantContactno").value;
//                var mob = mobileNo.length;
//                if (mob < 8) {
//                    alert("Enter Valid Mobile No.");
//                    $('#tenantContactno').val("");
//                    return false;
//                }
//
//            }
//             function mobileNoValidation1()
//            {
//
//                var mobileNo = document.getElementById("tenantWorkContactno").value;
//                var mob = mobileNo.length;
//                if (mob < 8) {
//                    alert("Enter Valid Mobile No.");
//                    $('#tenantWorkContactno').val("");
//                    return false;
//                }
//
//            }


            function pstbxno()
            {

                var postbxno = document.getElementById("postboxNo").value;
                var mob = postbxno.length;
                if (mob < 4) {
                    alert("Enter Valid Post Box No.");
                    $('#postboxNo').val("");
                    return false;
                }


            }
            function pstbxno1()
            {

                var postbxno = document.getElementById("sponsorpostboxNo").value;
                var mob = postbxno.length;
                if (mob < 4) {
                    alert("Enter Valid Post Box No.");
                    $('#sponsorpostboxNo').val("");
                    return false;
                }


            }
            function pstbxno2()
            {

                var postbxno = document.getElementById("assetPostboxNo").value;
                var mob = postbxno.length;
                if (mob < 4) {
                    alert("Enter Valid Post Box No.");
                    $('#assetPostboxNo').val("");
                    return false;
                }


            }

            function postlcde()
            {

                var pincode = document.getElementById("postalCode").value;
                var mob = pincode.length;
                if (mob < 3) {
                    alert("Enter Valid Postal Code");
                    $('#postalCode').val("");
                    return false;
                }


            }
            function postlcde1()
            {

                var pincode = document.getElementById("sopnsorpostalCode").value;
                var mob = pincode.length;
                if (mob < 3) {
                    alert("Enter Valid Postal Code");
                    $('#sopnsorpostalCode').val("");
                    return false;
                }


            }
            function postlcde2()
            {

                var pincode = document.getElementById("assetPostalCode").value;
                var mob = pincode.length;
                if (mob < 3) {
                    alert("Enter Valid Postal Code");
                    $('#assetPostalCode').val("");
                    return false;
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
                        <form class="form-inline" action="../tenant/tenantDetailsFormSubmit.htm"  method="post" enctype="multipart/form-data">
                            <div class="col-md-6 col-xs-12">
                                <div class="x_panel">
                                    <jsp:include page="../login/headerlink.htm?submodule=Rent Quote&tab=Rent Quote&pagetype=form"/>

                                    <div class="x_title">
                                        <h2>Tenant Details</h2>
                                        <div class="clearfix"></div>
                                    </div>
                                    <br />
                                    <c:forEach items="${LeadConvertData}" var="list">
                                        <c:if test="${list[0] eq '132'}">
                                            <c:set value="${list[1]}" var="field_2"/>
                                            <c:set value="${list[2]}" var="fieldStatus_2"/>
                                            <c:set value="${list[3]}" var="mand_status_2"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '133'}">
                                            <c:set value="${list[1]}" var="field_3"/>
                                            <c:set value="${list[2]}" var="fieldStatus_3"/>
                                            <c:set value="${list[3]}" var="mand_status_3"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '134'}">
                                            <c:set value="${list[1]}" var="field_4"/>
                                            <c:set value="${list[2]}" var="fieldStatus_4"/>
                                            <c:set value="${list[3]}" var="mand_status_4"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '135'}">
                                            <c:set value="${list[1]}" var="field_5"/>
                                            <c:set value="${list[2]}" var="fieldStatus_5"/>
                                            <c:set value="${list[3]}" var="mand_status_5"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '136'}">
                                            <c:set value="${list[1]}" var="field_6"/>
                                            <c:set value="${list[2]}" var="fieldStatus_6"/>
                                            <c:set value="${list[3]}" var="mand_status_6"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '137'}">
                                            <c:set value="${list[1]}" var="field_7"/>
                                            <c:set value="${list[2]}" var="fieldStatus_7"/>
                                            <c:set value="${list[3]}" var="mand_status_7"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '138'}">
                                            <c:set value="${list[1]}" var="field_8"/>
                                            <c:set value="${list[2]}" var="fieldStatus_8"/>
                                            <c:set value="${list[3]}" var="mand_status_8"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '139'}">
                                            <c:set value="${list[1]}" var="field_9"/>
                                            <c:set value="${list[2]}" var="fieldStatus_9"/>
                                            <c:set value="${list[3]}" var="mand_status_9"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '140'}">
                                            <c:set value="${list[1]}" var="field_10"/>
                                            <c:set value="${list[2]}" var="fieldStatus_10"/>
                                            <c:set value="${list[3]}" var="mand_status_10"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '141'}">
                                            <c:set value="${list[1]}" var="field_11"/>
                                            <c:set value="${list[2]}" var="fieldStatus_11"/>
                                            <c:set value="${list[3]}" var="mand_status_11"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '142'}">
                                            <c:set value="${list[1]}" var="field_12"/>
                                            <c:set value="${list[2]}" var="fieldStatus_12"/>
                                            <c:set value="${list[3]}" var="mand_status_12"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '143'}">
                                            <c:set value="${list[1]}" var="field_13"/>
                                            <c:set value="${list[2]}" var="fieldStatus_13"/>
                                            <c:set value="${list[3]}" var="mand_status_13"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '144'}">
                                            <c:set value="${list[1]}" var="field_14"/>
                                            <c:set value="${list[2]}" var="fieldStatus_14"/>
                                            <c:set value="${list[3]}" var="mand_status_14"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '145'}">
                                            <c:set value="${list[1]}" var="field_15"/>
                                            <c:set value="${list[2]}" var="fieldStatus_15"/>
                                            <c:set value="${list[3]}" var="mand_status_15"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '146'}">
                                            <c:set value="${list[1]}" var="field_16"/>
                                            <c:set value="${list[2]}" var="fieldStatus_16"/>
                                            <c:set value="${list[3]}" var="mand_status_16"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '147'}">
                                            <c:set value="${list[1]}" var="field_17"/>
                                            <c:set value="${list[2]}" var="fieldStatus_17"/>
                                            <c:set value="${list[3]}" var="mand_status_17"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '148'}">
                                            <c:set value="${list[1]}" var="field_18"/>
                                            <c:set value="${list[2]}" var="fieldStatus_18"/>
                                            <c:set value="${list[3]}" var="mand_status_18"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '149'}">
                                            <c:set value="${list[1]}" var="field_19"/>
                                            <c:set value="${list[2]}" var="fieldStatus_19"/>
                                            <c:set value="${list[3]}" var="mand_status_19"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '150'}">
                                            <c:set value="${list[1]}" var="field_20"/>
                                            <c:set value="${list[2]}" var="fieldStatus_20"/>
                                            <c:set value="${list[3]}" var="mand_status_20"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '151'}">
                                            <c:set value="${list[1]}" var="field_21"/>
                                            <c:set value="${list[2]}" var="fieldStatus_21"/>
                                            <c:set value="${list[3]}" var="mand_status_21"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '152'}">
                                            <c:set value="${list[1]}" var="field_22"/>
                                            <c:set value="${list[2]}" var="fieldStatus_22"/>
                                            <c:set value="${list[3]}" var="mand_status_22"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '153'}">
                                            <c:set value="${list[1]}" var="field_23"/>
                                            <c:set value="${list[2]}" var="fieldStatus_23"/>
                                            <c:set value="${list[3]}" var="mand_status_23"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '154'}">
                                            <c:set value="${list[1]}" var="field_24"/>
                                            <c:set value="${list[2]}" var="fieldStatus_24"/>
                                            <c:set value="${list[3]}" var="mand_status_24"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '155'}">
                                            <c:set value="${list[1]}" var="field_25"/>
                                            <c:set value="${list[2]}" var="fieldStatus_25"/>
                                            <c:set value="${list[3]}" var="mand_status_25"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '156'}">
                                            <c:set value="${list[1]}" var="field_26"/>
                                            <c:set value="${list[2]}" var="fieldStatus_26"/>
                                            <c:set value="${list[3]}" var="mand_status_26"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '157'}">
                                            <c:set value="${list[1]}" var="field_27"/>
                                            <c:set value="${list[2]}" var="fieldStatus_27"/>
                                            <c:set value="${list[3]}" var="mand_status_27"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '158'}">
                                            <c:set value="${list[1]}" var="field_28"/>
                                            <c:set value="${list[2]}" var="fieldStatus_28"/>
                                            <c:set value="${list[3]}" var="mand_status_28"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '159'}">
                                            <c:set value="${list[1]}" var="field_29"/>
                                            <c:set value="${list[2]}" var="fieldStatus_29"/>
                                            <c:set value="${list[3]}" var="mand_status_29"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '160'}">
                                            <c:set value="${list[1]}" var="field_30"/>
                                            <c:set value="${list[2]}" var="fieldStatus_30"/>
                                            <c:set value="${list[3]}" var="mand_status_30"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '161'}">
                                            <c:set value="${list[1]}" var="field_31"/>
                                            <c:set value="${list[2]}" var="fieldStatus_31"/>
                                            <c:set value="${list[3]}" var="mand_status_31"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '162'}">
                                            <c:set value="${list[1]}" var="field_32"/>
                                            <c:set value="${list[2]}" var="fieldStatus_32"/>
                                            <c:set value="${list[3]}" var="mand_status_32"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '163'}">
                                            <c:set value="${list[1]}" var="field_33"/>
                                            <c:set value="${list[2]}" var="fieldStatus_33"/>
                                            <c:set value="${list[3]}" var="mand_status_33"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '164'}">
                                            <c:set value="${list[1]}" var="field_34"/>
                                            <c:set value="${list[2]}" var="fieldStatus_34"/>
                                            <c:set value="${list[3]}" var="mand_status_34"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '165'}">
                                            <c:set value="${list[1]}" var="field_35"/>
                                            <c:set value="${list[2]}" var="fieldStatus_35"/>
                                            <c:set value="${list[3]}" var="mand_status_35"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '166'}">
                                            <c:set value="${list[1]}" var="field_36"/>
                                            <c:set value="${list[2]}" var="fieldStatus_36"/>
                                            <c:set value="${list[3]}" var="mand_status_36"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '167'}">
                                            <c:set value="${list[1]}" var="field_37"/>
                                            <c:set value="${list[2]}" var="fieldStatus_37"/>
                                            <c:set value="${list[3]}" var="mand_status_37"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '168'}">
                                            <c:set value="${list[1]}" var="field_38"/>
                                            <c:set value="${list[2]}" var="fieldStatus_38"/>
                                            <c:set value="${list[3]}" var="mand_status_38"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '169'}">
                                            <c:set value="${list[1]}" var="field_39"/>
                                            <c:set value="${list[2]}" var="fieldStatus_39"/>
                                            <c:set value="${list[3]}" var="mand_status_39"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '170'}">
                                            <c:set value="${list[1]}" var="field_40"/>
                                            <c:set value="${list[2]}" var="fieldStatus_40"/>
                                            <c:set value="${list[3]}" var="mand_status_40"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '171'}">
                                            <c:set value="${list[1]}" var="field_41"/>
                                            <c:set value="${list[2]}" var="fieldStatus_41"/>
                                            <c:set value="${list[3]}" var="mand_status_41"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '172'}">
                                            <c:set value="${list[1]}" var="field_42"/>
                                            <c:set value="${list[2]}" var="fieldStatus_42"/>
                                            <c:set value="${list[3]}" var="mand_status_42"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '173'}">
                                            <c:set value="${list[1]}" var="field_43"/>
                                            <c:set value="${list[2]}" var="fieldStatus_43"/>
                                            <c:set value="${list[3]}" var="mand_status_43"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '174'}">
                                            <c:set value="${list[1]}" var="field_44"/>
                                            <c:set value="${list[2]}" var="fieldStatus_44"/>
                                            <c:set value="${list[3]}" var="mand_status_44"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '175'}">
                                            <c:set value="${list[1]}" var="field_45"/>
                                            <c:set value="${list[2]}" var="fieldStatus_45"/>
                                            <c:set value="${list[3]}" var="mand_status_45"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '176'}">
                                            <c:set value="${list[1]}" var="field_46"/>
                                            <c:set value="${list[2]}" var="fieldStatus_46"/>
                                            <c:set value="${list[3]}" var="mand_status_46"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '177'}">
                                            <c:set value="${list[1]}" var="field_47"/>
                                            <c:set value="${list[2]}" var="fieldStatus_47"/>
                                            <c:set value="${list[3]}" var="mand_status_47"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '178'}">
                                            <c:set value="${list[1]}" var="field_48"/>
                                            <c:set value="${list[2]}" var="fieldStatus_48"/>
                                            <c:set value="${list[3]}" var="mand_status_48"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '179'}">
                                            <c:set value="${list[1]}" var="field_49"/>
                                            <c:set value="${list[2]}" var="fieldStatus_49"/>
                                            <c:set value="${list[3]}" var="mand_status_49"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '180'}">
                                            <c:set value="${list[1]}" var="field_50"/>
                                            <c:set value="${list[2]}" var="fieldStatus_50"/>
                                            <c:set value="${list[3]}" var="mand_status_50"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '181'}">
                                            <c:set value="${list[1]}" var="field_51"/>
                                            <c:set value="${list[2]}" var="fieldStatus_51"/>
                                            <c:set value="${list[3]}" var="mand_status_51"/>
                                        </c:if>
                                    </c:forEach>


                                    <c:if test="${fieldStatus_2 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_2 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_2}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_2} readonly="" id="tenantType" name="tenantType" value="${list.tenantType}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="tenantType" value="${list.tenantType}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <!--<input type="text" placeholder="" class="form-control" id="tenantType" name="tenantType" value="">-->
                                                    <select id="tenantType" name="tenantType" ${mand_status_2} class="form-control validate[required]">
                                                        <option value="" disabled selected>Select your option</option>
                                                        <c:forEach items="${tenantType}" var="type">
                                                            <option>${type}</option>
                                                        </c:forEach>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                    <c:if test="${fieldStatus_3 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_3 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_3}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_3} readonly="" id="tenantCategory" name="tenantCategory" value="${list.tenantCategory}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="tenantCategory" value="${list.tenantCategory}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <!--<input type="text" placeholder="" class="form-control" ${mand_status_3} id="tenantCategory" name="tenantCategory" value="">-->
                                                    <select id="tenantCategory" name="tenantCategory" ${mand_status_3} class="form-control validate[required]">
                                                        <option value="" disabled selected>Select your option</option>
                                                        <c:forEach items="${tenantCategory}" var="type">
                                                            <option>${type}</option>
                                                        </c:forEach>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                    <c:if test="${fieldStatus_4 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_4 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_4}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_4} readonly="" id="tenantFname" name="tenantFname" value="${list.tenantFname}" onkeypress="return isNumberKey4(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="tenantFname" value="${list.tenantFname}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_4} id="tenantFname" name="tenantFname" value="" onkeypress="return isNumberKey4(event)">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                        <p>&nbsp;</p>

                                    <c:if test="${fieldStatus_5 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_5 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_5}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_5} readonly="" id="tenantLname" name="tenantLname" value="${list.tenantLname}" onkeypress="return isNumberKey4(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="tenantLname" value="${list.tenantLname}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_5} id="tenantLname" name="tenantLname" value="" onkeypress="return isNumberKey4(event)">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                    <c:if test="${fieldStatus_6 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_7 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_6}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_6} readonly="" id="tenantCitizenship" name="tenantCitizenship" value="${list.tenantCitizenship}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="tenantCitizenship" value="${list.tenantCitizenship}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_6} id="tenantCitizenship" name="tenantCitizenship" value="">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                    <c:if test="${fieldStatus_7 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_7 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_7}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_7} readonly="" id="tenantId" name="tenantId" value="${list.tenantId}" onkeypress="return isNumberKey3(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="tenantId" value="${list.tenantId}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_7} id="tenantId" name="tenantId" value="" onkeypress="return isNumberKey3(event)">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                        <p>&nbsp;</p>
                                    <c:if test="${fieldStatus_8 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_8 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_8}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_8} readonly="" maxlength="3" id="postalCode" name="postalCode" value="${list.postalCode}" onkeypress="return isNumberKey(event)" onchange="postlcde();">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="postalCode" value="${list.postalCode}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_8} id="postalCode" name="postalCode" maxlength="3" value="" onkeypress="return isNumberKey(event)" onchange="postlcde();">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                    <c:if test="${fieldStatus_9 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_9 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_9}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_9} readonly="" id="postboxNo" name="postboxNo" maxlength="4" value="${list.postboxNo}" onkeypress="return isNumberKey(event)" onchange="pstbxno();">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="postboxNo" value="${list.postboxNo}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_9} id="postboxNo" name="postboxNo" maxlength="4" value="" onkeypress="return isNumberKey(event)" onchange="pstbxno();">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>

                                    <c:if test="${fieldStatus_10 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_10 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_10}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class=" input-file uniform_on" ${mand_status_10} id="tenantAttachment" name="tenantAttachment" type="file" >
                                                                <input name="pk" type="hidden" value="${type.SNo}">
                                                                <c:if test="${not empty type.tenOrgfileName}">
                                                                    <a style="color: black" href="../tenant/tenanttAttachDownload.htm?sno=${type.SNo}" title="Click to download">
                                                                        <i class="fa fa-file-pdf-o" style="font-size: 15px" ></i>
                                                                        ${type.tenOrgfileName}
                                                                    </a>
                                                                </c:if> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:if test="${not empty type.tenOrgfileName}">
                                                                    <a style="color: black" href="../tenant/tenanttAttachDownload.htm?sno=${type.SNo}" title="Click to download">
                                                                        <i class="fa fa-file-pdf-o" style="font-size: 15px" ></i>
                                                                        ${type.tenOrgfileName}
                                                                    </a>
                                                                </c:if> 
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="form-control" style="border: none">
                                                        <input class="input-file uniform_on" ${mand_status_10} id="tenantAttachment"  type="file" value="" name="tenantAttachment"  onchange="Validate(this)">
                                                        <!--                                                            <p style="float: left"><a href="#" id="attachmentReference" class="btn btn-upload" onclick="add1();">Attach Documents</a></p><br>
                                                                                                                    <label class="control-label" style="padding-right: 20px;">(PDF,XLS,DOC,Image)</label>-->
                                                    </div>
                                                    <input name="pk" type="hidden" value="${type.SNo}">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div> 
                                    </c:if>
                                    <p>&nbsp;</p>
                                    <c:if test="${fieldStatus_11 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_11 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_11}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_11} readonly="" id="jointeeName1" name="jointeeName1" value="${list.jointeeName1}" onkeypress="return isNumberKey4(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="jointeeName1" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_11} id="jointeeName1" name="jointeeName1" value="" onkeypress="return isNumberKey4(event)">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                    <c:if test="${fieldStatus_12 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_12 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_12}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <textarea style="resize: none" type="text" class="form-control" ${mand_status_12} readonly="" id="jointeeAddress1" name="jointeeAddress1" value="${list.jointeeAddress1}">${list.jointeeAddress1}</textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea style="resize: none" type="text" class="form-control" readonly="" id="jointeeAddress1" value="${list.jointeeAddress1}">${list.jointeeAddress1}</textarea>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <textarea style="resize: none" type="text" placeholder="" class="form-control" ${mand_status_12} id="jointeeAddress1" name="jointeeAddress1" value=""></textarea>
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                    <c:if test="${fieldStatus_13 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_13 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_13}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_13} readonly="" id="jointeeName2" name="jointeeName2" value="${list.jointeeName2}" onkeypress="return isNumberKey4(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="jointeeName2" value="${list.jointeeName2}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_13} id="jointeeName2" name="jointeeName2" value="" onkeypress="return isNumberKey4(event)">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>

                                    <c:if test="${fieldStatus_14 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_14 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_14}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <textarea style="resize: none" type="text" class="form-control" ${mand_status_14} readonly="" id="jointeeAddress1" name="jointeeAddress1" value="${list.jointeeAddress1}">${list.jointeeAddress1}</textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea style="resize: none" type="text" class="form-control" readonly="" id="jointeeAddress1" value="${list.jointeeAddress1}">${list.jointeeAddress1}</textarea>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <textarea style="resize: none" type="text" placeholder="" class="form-control" ${mand_status_14} id="jointeeAddress1" name="jointeeAddress1" value=""></textarea>
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>

                                    <c:if test="${fieldStatus_15 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_15 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_15}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_15} readonly="" id="sponcerName" name="sponcerName" value="${list.sponcerName}" onkeypress="return isNumberKey4(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="sponcerName" value="${list.sponcerName}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_15} id="sponcerName" name="sponcerName" value="" onkeypress="return isNumberKey4(event)">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                    <c:if test="${fieldStatus_16 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_16 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_16}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_16} readonly="" id="sponcerName" name="sponcerName" value="${list.sponcerName}" onkeypress="return isNumberKey4(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="sponcerName" value="${list.sponcerName}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_16} id="sponcerName" name="sponcerName" value="" onkeypress="return isNumberKey4(event)">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>

                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>

                                    <c:if test="${fieldStatus_17 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_17 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_17}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_17} readonly="" id="companyName" name="companyName" value="${list.companyName}" onkeypress="return isNumberKey4(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="companyName" value="${list.companyName}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_17} id="companyName" name="companyName" value="" onkeypress="return isNumberKey4(event)">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                    <c:if test="${fieldStatus_18 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_18 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_18}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <textarea style="resize: none" type="text" class="form-control" ${mand_status_18} readonly="" id="companyAddress" name="companyAddress" value="${list.companyAddress}">${list.companyAddress}</textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea style="resize: none"type="text" class="form-control" readonly="" id="companyAddress" value="${list.companyAddress}">${list.companyAddress}</textarea>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <textarea style="resize: none" type="text" placeholder="" class="form-control" ${mand_status_18} id="companyAddress" name="companyAddress" value=""></textarea>
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                    <c:if test="${fieldStatus_19 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_19 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_19}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_19} readonly="" id="tenantCrNo" name="tenantCrNo" value="${list.tenantCrNo}" onkeypress="return isNumberKey3(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="tenantCrNo" value="${list.tenantCrNo}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_19} id="tenantCrNo" name="tenantCrNo" value="" onkeypress="return isNumberKey3(event)">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>

                                    <c:if test="${fieldStatus_20 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_20 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_20}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_20} readonly="" id="tenantContactno" name="tenantContactno" maxlength="11" value="${list.tenantContactno}" onkeypress="return isNumberKey(event)" onchange="mobileNoValidation()">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="tenantContactno" value="${list.tenantContactno}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_20} id="tenantContactno" name="tenantContactno" value="" maxlength="11" onkeypress="return isNumberKey(event)" onchange="mobileNoValidation()">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                    <c:if test="${fieldStatus_21 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_21 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_21}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_21} readonly="" id="tenantWorkContactno" name="tenantWorkContactno" maxlength="11" value="${list.tenantWorkContactno}" onkeypress="return isNumberKey(event)" onchange="mobileNoValidation1()">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="tenantWorkContactno" value="${list.tenantWorkContactno}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_21} id="tenantWorkContactno" name="tenantWorkContactno" value="" maxlength="11" onkeypress="return isNumberKey(event)" onchange="mobileNoValidation1()">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                    <c:if test="${fieldStatus_22 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_22 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_22}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_22} readonly="" id="tenantMailid" name="tenantMailid" value="${list.tenantMailid}" onchange="emailValidate();">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="tenantMailid" value="${list.tenantMailid}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_22} id="tenantMailid" name="tenantMailid" value=""  onchange="emailValidate();">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                        <p>&nbsp;</p>

                                    <c:if test="${fieldStatus_23 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_23 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_23}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <textarea type="text" class="form-control" style="resize: none" ${mand_status_23} readonly="" id="permanentAddress" name="permanentAddress" value="${list.permanentAddress}">${list.permanentAddress}</textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea type="text" class="form-control" style="resize: none" readonly="" id="permanentAddress" value="${list.permanentAddress}">${list.permanentAddress}</textarea>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <textarea type="text" placeholder="" style="resize: none" class="form-control" ${mand_status_23} id="permanentAddress" name="permanentAddress" value=""></textarea>
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                    <c:if test="${fieldStatus_24 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_24 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_24}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <textarea type="text" class="form-control" style="resize: none" ${mand_status_24} readonly="" id="correspondenceAddress" name="correspondenceAddress" value="${list.correspondenceAddress}">${list.correspondenceAddress}</textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea type="text" class="form-control" style="resize: none" readonly="" id="correspondenceAddress" value="${list.correspondenceAddress}">${list.correspondenceAddress}</textarea>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <textarea type="text" placeholder="" style="resize: none" class="form-control" ${mand_status_24} id="correspondenceAddress" name="correspondenceAddress" value=""></textarea>
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                    <c:if test="${fieldStatus_25 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_25 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_25}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <textarea type="text" class="form-control" placeholder="" style="resize: none" ${mand_status_25} readonly="" id="sponcerAddress" name="sponcerAddress" value="${list.sponcerAddress}">${list.sponcerAddress}</textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea type="text" class="form-control" placeholder="" style="resize: none" readonly="" id="sponcerAddress" value="${list.sponcerAddress}">${list.sponcerAddress}</textarea>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <textarea style="resize: none" class="form-control" type="text" placeholder=""  ${mand_status_25} id="sponcerAddress" name="sponcerAddress" value=""></textarea>
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                        <p>&nbsp;</p>

                                    <c:if test="${fieldStatus_26 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_26 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_26}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_26} readonly="" id="sopnsorpostalCode" maxlength="3" name="sopnsorpostalCode" value="${list.postalCode}" onkeypress="return isNumberKey(event)" onchange="postlcde1();">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="sopnsorpostalCode" maxlength="3" value="${list.postalCode}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_26} id="sopnsorpostalCode" maxlength="3" name="sopnsorpostalCode" value="" onkeypress="return isNumberKey(event)" onchange="postlcde1();">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                    <c:if test="${fieldStatus_27 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_27 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_27}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_27} readonly="" id="sponsorpostboxNo" name="sponsorpostboxNo" maxlength="4" value="${list.postboxNo}" onkeypress="return isNumberKey(event)" onchange="pstbxno1();">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="sponsorpostboxNo" value="${list.postboxNo}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_27} id="sponsorpostboxNo" name="sponsorpostboxNo" maxlength="4" value="" onkeypress="return isNumberKey(event)" onchange="pstbxno1();">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                    <c:if test="${fieldStatus_28 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_28 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_28}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <textarea style="resize: none" type="text" class="form-control" ${mand_status_28} readonly="" id="tenentHistory" name="tenentHistory" value="${list.jointeeAddress2}">${list.jointeeAddress2}</textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea style="resize: none" type="text" class="form-control" readonly="" id="tenentHistory" value="${list.jointeeAddress2}">${list.jointeeAddress2}</textarea>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <textarea style="resize: none" type="text" placeholder="" class="form-control" ${mand_status_28} id="tenentHistory" name="tenentHistory" value=""></textarea>
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>


                                        <p>&nbsp;</p>


                                    <c:if test="${fieldStatus_29 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_29 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_29}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <textarea style="resize: none" type="text" class="form-control" ${mand_status_29} readonly="" id="jointeeAddress2" name="jointeeAddress2" value="${list.jointeeAddress2}">${list.jointeeAddress2}</textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea style="resize: none" type="text" class="form-control" readonly="" id="jointeeAddress2" value="${list.jointeeAddress2}">${list.jointeeAddress2}</textarea>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <textarea style="resize: none" type="text" placeholder="" class="form-control" ${mand_status_29} id="jointeeAddress2" name="jointeeAddress2" value=""></textarea>
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>

                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>
                                        <div class="x_title">
                                            <h2>Asset Details</h2>
                                            <div class="clearfix"></div>
                                        </div>

                                        <p>&nbsp;</p>
                                    <c:if test="${fieldStatus_30 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_30 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_30}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_30} readonly="" id="assetName" name="assetName" value="${list.assetName}" onkeypress="return isNumberKey3(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="assetName" value="${list.assetName}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_30} id="assetName" name="assetName" value="" onkeypress="return isNumberKey3(event)">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                    <c:if test="${fieldStatus_31 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_31 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_31}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_31} readonly="" id="subclassifiedAstno" name="subclassifiedAstno" value="${list.subclassifiedAstno}" onkeypress="return isNumberKey3(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="subclassifiedAstno" value="${list.subclassifiedAstno}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_31} id="subclassifiedAstno" name="subclassifiedAstno" value="" onkeypress="return isNumberKey3(event)">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                    <c:if test="${fieldStatus_32 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_32 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_32}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_32} readonly="" id="buildingNo" name="buildingNo" value="${list.buildingNo}" onkeypress="return isNumberKey(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="buildingNo" value="${list.buildingNo}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_32} id="buildingNo" name="buildingNo" value="" onkeypress="return isNumberKey(event)">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div></c:if>
                                        <p>&nbsp;</p>
                                    <c:if test="${fieldStatus_33 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_33 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_33}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_33} readonly="" id="waterBillno" name="waterBillno" value="${list.waterBillno}" onkeypress="return isNumberKey(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="waterBillno" value="${list.waterBillno}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_33} id="waterBillno" name="waterBillno" value="" onkeypress="return isNumberKey(event)">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                    <c:if test="${fieldStatus_34 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_34 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_34}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_34} readonly="" id="assetArea" name="assetArea" value="${list.assetArea}" onkeypress="return isNumberKey3(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="assetArea" value="${list.assetArea}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_34} id="assetArea" name="assetArea" value="" onkeypress="return isNumberKey3(event)">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                    <c:if test="${fieldStatus_35 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_35 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_35}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_35} readonly="" id="blockNo" name="blockNo" value="${list.blockNo}" onkeypress="return isNumberKey3(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="blockNo" value="${list.blockNo}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_35} id="blockNo" name="blockNo" value="" onkeypress="return isNumberKey3(event)">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                        <p>&nbsp;</p>
                                    <c:if test="${fieldStatus_36 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_36 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_36}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_36} readonly="" id="plotNo" name="plotNo" value="${list.plotNo}" onkeypress="return isNumberKey3(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="plotNo" value="${list.plotNo}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_36} id="plotNo" name="plotNo" value="" onkeypress="return isNumberKey3(event)">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                    <c:if test="${fieldStatus_37 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_37 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_37}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_37} readonly="" id="electricityBillno" name="electricityBillno" value="${list.electricityBillno}" onkeypress="return isNumberKey(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="electricityBillno" value="${list.electricityBillno}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_37} id="electricityBillno" name="electricityBillno" value="" onkeypress="return isNumberKey(event)">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                    <c:if test="${fieldStatus_38 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_38 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_38}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_38} readonly="" id="wayNo" name="wayNo" value="${list.wayNo}" onkeypress="return isNumberKey3(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="wayNo" value="${list.wayNo}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_38} id="wayNo" name="wayNo" value="" onkeypress="return isNumberKey3(event)">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>

                                        <p>&nbsp;</p>
                                    <c:if test="${fieldStatus_39 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_39 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_39}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_39} readonly="" id="streetNo" name="streetNo" value="${list.streetNo}" onkeypress="return isNumberKey3(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="streetNo" value="${list.streetNo}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_39} id="streetNo" name="streetNo" value="" onkeypress="return isNumberKey3(event)">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                    <c:if test="${fieldStatus_40 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_40 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_40}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_40} readonly="" id="assetblockNo" name="assetblockNo" value="${list.blockNo}" onkeypress="return isNumberKey3(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="assetblockNo" value="${list.blockNo}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_40} id="assetblockNo" name="assetblockNo" value="" onkeypress="return isNumberKey3(event)">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                    <c:if test="${fieldStatus_41 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_41 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_41}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_41} readonly="" id="assetPostalCode" name="assetPostalCode" maxlength="3" value="${list.assetPostalCode}" onkeypress="return isNumberKey(event)" onchange="postlcde2();">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="assetPostalCode" value="${list.assetPostalCode}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_41} id="assetPostalCode" name="assetPostalCode" maxlength="3" value="" onkeypress="return isNumberKey(event)" onchange="postlcde2();">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>



                                        <p>&nbsp;</p>
                                    <c:if test="${fieldStatus_42 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_42 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_42}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_42} readonly="" id="assetPostboxNo" name="assetPostboxNo" maxlength="4" value="${list.assetPostboxNo}" onkeypress="return isNumberKey(event)" onchange="pstbxno2();">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="assetPostboxNo" value="${list.assetPostboxNo}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_42} id="assetPostboxNo" name="assetPostboxNo" value="" maxlength="4" onkeypress="return isNumberKey(event)" onchange="pstbxno2();">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>
                                        <div class="x_title">
                                            <h2>Contract Details</h2>
                                            <div class="clearfix"></div>
                                        </div>
                                        <p>&nbsp;</p>
                                    <c:if test="${fieldStatus_43 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_43 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_43}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_43} readonly="" id="contractCode" name="contractCode" value="${list.contractPeriod}" onkeypress="return isNumberKey3(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="contractCode" value="${list.contractPeriod}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text"  class="form-control" ${mand_status_43} id="contractCode" name="contractCode" readonly value="" placeholder="Select Contract Code" >
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                    <c:if test="${fieldStatus_44 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_44 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_44}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_44} readonly="" id="contractName" name="contractName" value="${list.contractPeriod}" onkeypress="return isNumberKey3(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="contractName" value="${list.contractPeriod}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_44} id="contractName" readonly name="contractName" value=""  onkeypress="return isNumberKey3(event)">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                    <c:if test="${fieldStatus_45 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_45 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_45}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_45} readonly="" id="startsFrom" name="startsFrom" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.startsFrom}"/>">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="startsFrom" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.startsFrom}"/>">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="Select Date" class="form-control" ${mand_status_45} readonly id="startsFrom" name="startsFrom" value="" onclick="javascript:NewCssCal('startsFrom', 'ddMMMyyyy', '', '', '', '', '')">
                                                </c:otherwise>        
                                            </c:choose>
                                            <p>&nbsp;</p>

                                        </div></c:if>
                                    <c:if test="${fieldStatus_46 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_46 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_46}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" placeholder="Select Date" ${mand_status_46} readonly="" id="endsTo" name="endsTo" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.endsTo}"/>">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="endsTo" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.endsTo}"/>">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="Select Date" class="form-control" ${mand_status_46} readonly id="endsTo" name="endsTo" value="" onclick="javascript:NewCssCal('endsTo', 'ddMMMyyyy', '', '', '', '', '')">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>


                                    <c:if test="${fieldStatus_47 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_47 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_47}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class=" input-file uniform_on" ${mand_status_47} id="contractAttachment" name="contractAttachment" type="file" >
                                                                <input name="pk" type="hidden" value="${type.SNo}">
                                                                <c:if test="${not empty type.contOrgfileName}">
                                                                    <a style="color: black" href="../tenant/tenantcAttachDownload.htm?sno=${type.SNo}" title="Click to download">
                                                                        <i class="fa fa-file-pdf-o" style="font-size: 15px" ></i>
                                                                        ${type.contOrgfileName}
                                                                    </a>
                                                                </c:if> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:if test="${not empty type.contOrgfileName}">
                                                                    <a style="color: black" href="../tenant/tenantcAttachDownload.htm?sno=${type.SNo}" title="Click to download">
                                                                        <i class="fa fa-file-pdf-o" style="font-size: 15px" ></i>
                                                                        ${type.contOrgfileName}
                                                                    </a>
                                                                </c:if> 
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="form-control" style="border: none">
                                                        <input class="input-file uniform_on" ${mand_status_47} id="contractAttachment"  type="file" value="" name="contractAttachment"  onchange="Validate(this)">
                                                        <!--                                                            <p style="float: left"><a href="#" id="attachmentReference" class="btn btn-upload" onclick="add1();">Attach Documents</a></p><br>
                                                                                                                    <label class="control-label" style="padding-right: 20px;">(PDF,XLS,DOC,Image)</label>-->
                                                    </div>
                                                    <input name="pk" type="hidden" value="${type.SNo}">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div> 
                                    </c:if>
                                    <c:if test="${fieldStatus_48 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_48 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_48}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_48} readonly="" id="minimumRentFixed" name="minimumRentFixed" value="${list.advanceAmount}" onkeypress="return isNumberKey(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="minimumRentFixed" value="${list.advanceAmount}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_48} id="minimumRentFixed" name="minimumRentFixed" value="" onkeypress="return isNumberKey(event)">
                                                </c:otherwise>        
                                            </c:choose>
                                            <p>&nbsp;</p>
                                        </div></c:if>
                                    <c:if test="${fieldStatus_49 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_49 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_49}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_49} readonly="" id="actualRentFixed" name="actualRentFixed" value="${list.advanceAmount}" onkeypress="return isNumberKey(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="actualRentFixed" value="${list.advanceAmount}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_49} id="actualRentFixed" name="actualRentFixed" value="" onkeypress="return isNumberKey(event)">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>
                                        <div class="x_title">
                                            <h2>Billing Cycle</h2>
                                            <div class="clearfix"></div>
                                        </div>
                                        <p>&nbsp;</p>
                                    <c:if test="${fieldStatus_50 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_50 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_50}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_50} readonly="" id="billingCycle" name="billingCycle" value="${list.billingCycle}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="billingCycle" value="${list.billingCycle}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <!--<input type="text" placeholder="" class="form-control" ${mand_status_50} id="billingCycle" name="billingCycle" value="" Monthly, quarterly, Half yearly, yearly>-->
                                                    <select id="billingCycle" name="billingCycle" ${mand_status_45} class="form-control">
                                                        <option value="" selected>Select your option</option>
                                                        <option value="Monthly">Monthly</option>
                                                        <option value="Quarterly">Quarterly</option>
                                                        <option value="Half Yearly">Half Yearly</option>
                                                        <option value="Yearly">Yearly</option>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                    <c:if test="${fieldStatus_51 eq 'y'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_51 eq 'required'}">
                                                <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_51}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(tenantDetails) > 0}">
                                                    <c:forEach items="${tenantDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" placeholder="Select Date" class="form-control" ${mand_status_51} readonly="" id="dueDate" name="dueDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.dueDate}"/>">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="dueDate" value="${list.dueDate}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="Select Date" class="form-control" ${mand_status_51} readonly  id="dueDate" name="dueDate" value="" onclick="javascript:NewCssCal('dueDate', 'ddMMMyyyy', '', '', '', '', '')">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div></c:if>
                                        <p>&nbsp;</p>

                                        <p>&nbsp;</p>
                                    <c:if test="${action ne 'view'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <button type="submit" class="btn btn-primary" style="">Save</button>
                                                <a href="../CRM/quoteList.htm"  class="btn btn-danger"  style="">Cancel</a>
                                            </div>
                                        </div> 
                                    </c:if>
                                    </form>

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