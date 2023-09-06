<%-- 
    Document   : assetDetailsForm
    Created on : Sep 15, 2016, 10:42:18 AM
    Author     : Kondal Reddy N
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
        <title>Arete Iconic</title>
        <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">        <style>
            #remarks {
                height: 100% !important;
                resize: none;
            }
        </style>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#subassetsForm').validationEngine();
                $("input").on("keypress", function (e) {

                    if (e.which === 32 && !this.value.length)
                        e.preventDefault();
                });
                var subType1 = document.getElementById("assetType").value;

                var y = document.getElementById("subAssetType");
                var option = document.createElement("option");
                var types = ["Both", "Commercial", "Residential"];
                if (subType1 == 'Both') {
                    for (var i = 0; i < 3; i++) {
                        var type = new Option(types[i], types[i]);
                        y.options.add(type);
                    }
                } else {
                    if (subType1 == 'Commercial') {
                        var type = new Option("Commercial", "Commercial");
                        y.options.add(type);
                    } else {
                        if (subType1 == 'Residential') {
                            var type = new Option("Residential", "Residential");
                            y.options.add(type);
                        }
                    }


                }

                var code = {};
//                $("select[name='parking'] > option").each(function () {
//                    if (code[this.text]) {
//                        $(this).remove();
//                    } else {
//                        code[this.text] = this.value;
//                    }
//                });
            });


            function isNumberKey3(evt) {

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

            function calcArea() {
                var width = document.getElementById('width').value;
                var length = document.getElementById('length').value;
                var area = parseFloat(width * length);
                if (document.getElementById("width").value == null || document.getElementById("width").value == "")
                {
                    document.getElementById("area").value = "";
                } else {
                    if (document.getElementById("length").value == null || document.getElementById("length").value == "")
                    {
                        document.getElementById("area").value = "";
                    } else {
                        document.getElementById("area").value = area;
                    }
                }

            }

            function editCalcArea() {
                var width = document.getElementById('width1').value;
                var length = document.getElementById('length1').value;
                var area = parseFloat(width * length);
                if (document.getElementById("width1").value == null || document.getElementById("width1").value == "")
                {
                    document.getElementById("area1").value = "";
                } else {
                    if (document.getElementById("length1").value == null || document.getElementById("length1").value == "")
                    {
                        document.getElementById("area1").value = "";
                    } else {
                        document.getElementById("area1").value = area;
                    }
                }

            }
            function changeFloor() {
                var fld = document.getElementById('noOfFloors').value;
                var mezzanineFloor1 = document.getElementById('mezzanineFloor').value;
                var basement3 = document.getElementById('basement').value;
                var basement5 = document.getElementById('basement').value;



                if (mezzanineFloor1 == 'Y' || basement3 == 'Y' || basement5 == 'Y') {

                    var basement4 = "Basement 1";
                    var basement6 = "Basement 2";
                    var mezzanineFloor2 = "Mezzanine Floor";
                }
//                
                $("#floor").empty();
                var x = document.getElementById("floor");
                var option = document.createElement("option");
                var floor1 = new Option(mezzanineFloor2, mezzanineFloor2);
                var floor2 = new Option(basement4, basement4);
                var floor3 = new Option(basement6, basement6);

//                var floors = ["Ground Floor", "1ST Floor", "2ND Floor", "3RD Floor", "4TH Floor", "5TH Floor", "6TH Floor", "7TH Floor", "8TH Floor", "9TH Floor", "10TH Floor", "11TH Floor", "12TH Floor", "13TH Floor", "14TH Floor", "15TH Floor", "16TH Floor", "17TH Floor", "18TH Floor", "19TH Floor", "20TH Floor", "21ST Floor"];
//                for (var i = 0; i < fld; i++) {
//                    var floor = new Option(floors[i], floors[i]);
//                    x.options.add(floor);
                if (mezzanineFloor1 == 'Y' || basement3 == 'Y' || basement5 == 'Y') {

                    x.options.add(floor2);
                    x.options.add(floor3);
                    x.options.add(floor1);
                }
                var floors = ["Ground Floor", "1st Floor", "2nd Floor", "3rd Floor", "4th Floor", "5th Floor", "6th Floor", "7th Floor", "8th Floor", "9th Floor", "10th Floor", "11th Floor", "12th Floor", "13th Floor", "14th Floor", "15th Floor", "16th Floor", "17th Floor", "18thFloor", "19th Floor", "20th Floor", "21th Floor"];
                for (var i = 0; i < fld; i++) {
                    var floor = new Option(floors[i], floors[i]);
                    x.options.add(floor);
                }
                // assetType();
            }
            function assetType() {
                var x = document.getElementById("subAssetType");
                var option1 = document.createElement("option");
                for (var i = 0; i < 3; i++) {
                    var type = new Option(null, null);
                    x.options.remove(type);
                }

                var assetType = document.getElementById('assetType1').value;
                var y = document.getElementById("subAssetType");
                var option = document.createElement("option");
                var types = ["Both", "Commercial", "Residential"];
                if (assetType == 'Both') {
                    for (var i = 0; i < 3; i++) {
                        var type = new Option(types[i], types[i]);
                        y.options.add(type);
                    }
                } else {
                    if (assetType == 'Commercial') {
                        var type = new Option("Commercial", "Commercial");
                        y.options.add(type);
                    } else {
                        if (assetType == 'Residential') {
                            var type = new Option("Residential", "Residential");
                            y.options.add(type);
                        }
                    }


                }
            }
            function selectAssetDetails()
            {
                myWindow = window.open("../assets/selectAssetDetails.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                window.close();
            }

            function checkSubAssetName() {
                debugger
                var subAssetName = document.getElementById('subAssetName').value;
                var assetCode = document.getElementById('assetCode').value;


                $.ajax({
                    type: "POST",
                    url: "../assets/subAssetType.htm",
                    data: {subAssetName: subAssetName, assetCode: assetCode},
                    dataType: "text",
                    success: function (data)
                    {
                        debugger
                        if ($.trim(data) !== 'Data  available')
                        {
                            alert("This Flat No. is already Tagged for the Property.!");
                            document.getElementById("subAssetName").value = "";
                            return false;
                        }
                    },
                    error: function (error) {
                        alert(error);
                    }
                });
            }

            function checkdigit(e, obj, intsize, deczize) {
                var keycode;
                if (window.event)
                    keycode = window.event.keyCode;
                else if (e) {
                    keycode = e.which;
                } else {
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
        </script>
    </head>
    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>
        <jsp:include page="../login/footer.jsp"/>


        <main id="main" class="main">
            <div class="mt-3">
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>
                <ul class="nav nav-pills">
                    <li class="nav-item">
                        <a class="nav-link active" href="../assets/subAssetsDetailsList.htm">Property Segments</a>
                    </li>
<!--                    <li class="nav-item">
                        <a class="nav-link" href="../assets/propertyWiseSegmentList.htm">Property Wise Segments</a>
                    </li>-->
                </ul>
                <br>
                <div class="text-end">
                    <a class="btn btn-primary btn-sm " href="../assets/subAssetsDetailsList.htm">
                        <i class="bi bi-eye "></i> Show Property Segments Records </a>
                </div>
            </div>
            <!--                                       <div class="mt-3">
            <%--<jsp:include page="../login/headerlink.htm?submodule=Property Segments&tab=Property Segments&pagetype=form"/>--%>
        </div>-->
            <div class="pagetitle">

            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">
                            <div class="card-body">
                                <div class="card-title"><h5>Floor Details Form</h5></div>
                                <form class="row" id="subassetsForm" action="../assets/subAssetsDetailsFormSubmit.htm"  method="post" enctype="multipart/form-data" onsubmit="return checkGrid();">
                                    <c:forEach items="${test}" var="list">
                                        <c:if test="${list[0] eq '247'}">
                                            <c:set value="${list[1]}" var="field_1"/>
                                            <c:set value="${list[2]}" var="fieldStatus_1"/>
                                            <c:set value="${list[3]}" var="mand_status_1"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '248'}">
                                            <c:set value="${list[1]}" var="field_2"/>
                                            <c:set value="${list[2]}" var="fieldStatus_2"/>
                                            <c:set value="${list[3]}" var="mand_status_2"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '249'}">
                                            <c:set value="${list[1]}" var="field_3"/>
                                            <c:set value="${list[2]}" var="fieldStatus_3"/>
                                            <c:set value="${list[3]}" var="mand_status_3"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '250'}">
                                            <c:set value="${list[1]}" var="field_4"/>
                                            <c:set value="${list[2]}" var="fieldStatus_4"/>
                                            <c:set value="${list[3]}" var="mand_status_4"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '251'}">
                                            <c:set value="${list[1]}" var="field_5"/>
                                            <c:set value="${list[2]}" var="fieldStatus_5"/>
                                            <c:set value="${list[3]}" var="mand_status_5"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '252'}">
                                            <c:set value="${list[1]}" var="field_6"/>
                                            <c:set value="${list[2]}" var="fieldStatus_6"/>
                                            <c:set value="${list[3]}" var="mand_status_6"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '253'}">
                                            <c:set value="${list[1]}" var="field_7"/>
                                            <c:set value="${list[2]}" var="fieldStatus_7"/>
                                            <c:set value="${list[3]}" var="mand_status_7"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '254'}">
                                            <c:set value="${list[1]}" var="field_8"/>
                                            <c:set value="${list[2]}" var="fieldStatus_8"/>
                                            <c:set value="${list[3]}" var="mand_status_8"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '255'}">
                                            <c:set value="${list[1]}" var="field_9"/>
                                            <c:set value="${list[2]}" var="fieldStatus_9"/>
                                            <c:set value="${list[3]}" var="mand_status_9"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '256'}">
                                            <c:set value="${list[1]}" var="field_10"/>
                                            <c:set value="${list[2]}" var="fieldStatus_10"/>
                                            <c:set value="${list[3]}" var="mand_status_10"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '257'}">
                                            <c:set value="${list[1]}" var="field_11"/>
                                            <c:set value="${list[2]}" var="fieldStatus_11"/>
                                            <c:set value="${list[3]}" var="mand_status_11"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '258'}">
                                            <c:set value="${list[1]}" var="field_12"/>
                                            <c:set value="${list[2]}" var="fieldStatus_12"/>
                                            <c:set value="${list[3]}" var="mand_status_12"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '259'}">
                                            <c:set value="${list[1]}" var="field_13"/>
                                            <c:set value="${list[2]}" var="fieldStatus_13"/>
                                            <c:set value="${list[3]}" var="mand_status_13"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '260'}">
                                            <c:set value="${list[1]}" var="field_14"/>
                                            <c:set value="${list[2]}" var="fieldStatus_14"/>
                                            <c:set value="${list[3]}" var="mand_status_14"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '261'}">
                                            <c:set value="${list[1]}" var="field_15"/>
                                            <c:set value="${list[2]}" var="fieldStatus_15"/>
                                            <c:set value="${list[3]}" var="mand_status_15"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '262'}">
                                            <c:set value="${list[1]}" var="field_16"/>
                                            <c:set value="${list[2]}" var="fieldStatus_16"/>
                                            <c:set value="${list[3]}" var="mand_status_16"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '263'}">
                                            <c:set value="${list[1]}" var="field_17"/>
                                            <c:set value="${list[2]}" var="fieldStatus_17"/>
                                            <c:set value="${list[3]}" var="mand_status_17"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '264'}">
                                            <c:set value="${list[1]}" var="field_18"/>
                                            <c:set value="${list[2]}" var="fieldStatus_18"/>
                                            <c:set value="${list[3]}" var="mand_status_18"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '265'}">
                                            <c:set value="${list[1]}" var="field_19"/>
                                            <c:set value="${list[2]}" var="fieldStatus_19"/>
                                            <c:set value="${list[3]}" var="mand_status_19"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '266'}">
                                            <c:set value="${list[1]}" var="field_20"/>
                                            <c:set value="${list[2]}" var="fieldStatus_20"/>
                                            <c:set value="${list[3]}" var="mand_status_20"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '267'}">
                                            <c:set value="${list[1]}" var="field_20"/>
                                            <c:set value="${list[2]}" var="fieldStatus_20"/>
                                            <c:set value="${list[3]}" var="mand_status_20"/>
                                        </c:if>


                                    </c:forEach> 

                                    <%--<c:forEach items="${subAssetDetails}" var="type">
                                        <c:set value="${type.SNo}" var="SNo"/>
                                        <c:set value="${type.assetCode}" var="assetCode1"/>
                                    </c:forEach>
                                    <c:forEach items="${assetname}" var="list">
                                        <c:set value="${list.assetName}" var="assetName1"/>
                                        <c:set value="${list.assetType}" var="assetType2"/>
                                    </c:forEach>--%>


                                    <c:if test="${fieldStatus_1 eq 'y'}">
                                        <div class="col-md-4 form-floating mb-3">


                                            <c:choose>
                                                <c:when test="${fn:length(subAssetDetails) > 0}">
                                                    <c:forEach items="${subAssetDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_1} readonly="" id="assetCode" name="assetCode" value="${list.assetCode}" onclick="return selectAssetDetails();" onchange="return changeFloor();" onblur="return changeFloor();">
                                                                <input type="hidden" name="pk" value="${list.SNo}">
                                                                <input type="hidden" name="assetCode" id="assetCode" value="">
<!--                                                                <input type="hidden" name="status" value="${list.status}">-->
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" id="assetCode" readonly="" value="${list.assetCode}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="Select Property Code" class="form-control" ${mand_status_1} id="assetCode" readonly="" name="assetCode" maxlength="40" value=""  onclick="return selectAssetDetails();" onchange="return changeFloor();" onblur="return changeFloor();">
                                                    <!--<input type="text" name="assetCode" id="assetCode" value="">-->
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">${field_1}
                                                <c:if test="${mand_status_1 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                            </label>
                                        </div>
                                    </c:if>

                                    <c:if test="${fieldStatus_2 eq 'y'}">
                                        <div class="col-md-4 form-floating mb-3">


                                            <c:choose>
                                                <c:when test="${fn:length(assetname) > 0}">
                                                    <c:forEach items="${assetname}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_2} readonly="" id="assetName" name="assetName" value="${list.assetName}" onkeypress="return isNumberKey3(event)" onfocus="return changeFloor();">
                                                                <input type="hidden" id="assetType" value="${assetType}">
                                                                <input type="hidden" name="assetCode" id="assetCode" value="">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="assetName" value="${list.assetName}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" placeholder="Fill"  class="form-control" ${mand_status_2} id="assetName" readonly="" name="assetName" maxlength="40" value="" onkeypress="return isNumberKey3(event)" onfocus="return changeFloor();">
                                                    <input type="hidden" id="assetType1" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">${field_2}
                                                <c:if test="${mand_status_2 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                            </label>
                                        </div>
                                    </c:if>

                                    <c:if test="${action ne 'view' && action ne 'edit'}" >
                                        <c:if test="${fieldStatus_3 eq 'y'}">
                                            <div class="col-md-4 form-floating mb-3">


                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_3} readonly="" id="floor"  maxlength="40" value="${list.floor}" onkeypress="return isNumberKey3(event)" onfocus="return changeFloor();">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="floor" value="${list.floor}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
<!--                                                        <input type="text" placeholder="Fill" class="form-control" ${mand_status_3} id="floor"  maxlength="40" value="" onkeypress="return isNumberKey3(event)">-->
                                                        <select id="floor" ${mand_status_3} class="form-control">
                                                            <option value="" disabled selected>Select your option</option>
                                                        </select>
                                                        <input type="hidden" id="noOfFloors" value="" onfocus="return changeFloor();">
                                                        <input type="hidden" id="mezzanineFloor" value="Y" onfocus="return changeFloor();">
                                                        <input type="hidden" id="basement" value="Y" onfocus="return changeFloor();">
                                                        <input type="hidden" id="subCode1" value="">
                                                    </c:otherwise>        
                                                </c:choose>
                                                <label class="control-label">${field_3}
                                                    <c:if test="${mand_status_3 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if>
                                                </label>

                                            </div></c:if>

                                        <c:if test="${fieldStatus_4 eq 'y'}">
                                            <div class="col-md-4 form-floating mb-3">


                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="subAssetName"  value="${list.subAssetName}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="subAssetName" value="${list.subAssetName}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Fill" class="form-control" id="subAssetName"  maxlength="40" value="" onkeypress="return isAlphaNumeric(event)" >   <!-- onchange="return checkSubAssetName();" -->
                                                    </c:otherwise>        
                                                </c:choose>
                                                <label class="control-label">Unit Name/Unit Number
                                                    <c:if test="${mand_status_4 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if>
                                                </label>

                                            </div>
                                        </c:if>



                                        <c:if test="${fieldStatus_5 eq 'y'}">
                                            <div class="col-md-4 form-floating mb-3">


                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <select id="subAssetType" name="subAssetType" ${mand_status_5} class="form-control">
                                                                        <option value="">Select</option>
                                                                        >
                                                                        <option value="${list.subAssetType}" selected>${list.subAssetType}</option>
                                                                        <c:forEach items="${flattypes}" var="types1">
                                                                            <option value="${types1}" >${types1}</option>                                            
                                                                        </c:forEach>
                                                                        <text type="hidden" id="" name="subAssetType" value="villa">
                                                                    </select>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="subAssetType" name="subAssetType" value="${list.subAssetType}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <select id="subAssetType" name="subAssetType" ${mand_status_5} class="form-control">
                                                            <option value="" disabled selected>Select your option</option>
                                                            <c:forEach items="${flattypes}" var="types1">
                                                                <option value="${types1}" >${types1}</option>                                            
                                                            </c:forEach>

                                                        </select>
                                                    </c:otherwise>        
                                                </c:choose>
                                                <label class="control-label">Unit Type
                                                    <c:if test="${mand_status_5 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if>
                                                </label>

                                            </div>
                                        </c:if>

                                        <!--                                                  <div class="col-md-4 form-floating mb-3">
                                        <c:choose>
                                            <c:when test="${fn:length(assetname) > 0}">
                                                <c:forEach items="${assetname}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" class="form-control" id="unitName" name="unitName" value="" onkeypress="return isNumberKey3(event)" >
                                                            
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" class="form-control" readonly="" id="unitName" value="${list.assetName}">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" placeholder="Fill"  class="form-control"  id="unitName" name="unitName" maxlength="40" value="" onkeypress="return isNumberKey3(event)">
                                              
                                            </c:otherwise>        
                                        </c:choose>
                                                 <label class="control-label">Room / Unit Name
                                        
                                            <a style="color:red;">*</a>
                                     
                                        </label>
                                    </div>
                                    <div class="col-md-4 form-floating mb-3">
                                        <c:choose>
                                            <c:when test="${fn:length(assetDetails) > 0}">
                                                <c:forEach items="${assetDetails}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" class="form-control" name="unittype" readonly="" id="unittype"  value="">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" class="form-control" readonly="" id="unittype" value="">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>                                                    
                                                <select id="unittype" name="unittype" class="form-control">
                                                    <option value="" disabled selected>Select your option</option>
                                                <c:forEach items="${flattypes}" var="types1">
                                                    <option value="${types1}" >${types1}</option>                                            
                                                </c:forEach>

                                            </select>
                                            </c:otherwise>        
                                        </c:choose>
                                        <label class="control-label">Room / Unit Type<a style="color:red;">*</a></label>

                                    </div>-->


                                        <c:if test="${fieldStatus_8 eq 'y'}">
                                            <div class="col-md-4 form-floating mb-3">



                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" id="area"  maxlength="20" value="${list.area}"onkeypress="return isNumberKey(event)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="area" value="${list.area}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>   
                                                        <input type="text" placeholder="Fill"  class="form-control" id="area" ${mand_status_8} maxlength="20" value="" onkeypress="return isNumberKey(event)">
                                                    </c:otherwise>        
                                                </c:choose>
                                                <label class="control-label">${field_8}
                                                    <c:if test="${mand_status_8 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if>
                                                </label>

                                            </div></c:if>

                                        <%--<c:if test="${fieldStatus_9 eq 'y'}">
                                            <div class="col-md-4 form-floating mb-3">
                                                <c:if test="${mand_status_9 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_9}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" readonly="" id="parking" value="${list.parking}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="parking" value="${list.parking}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>  
                                                        <select id="parking" class="form-control">
                                                            <option value="" disabled selected>Select your option</option>
                                                            <c:forEach items="${Dropdown}" var="list">
                                                                <c:if test="${list[0] eq 'F-04'}">
                                                                    <option>${list[1]}</option>                                     
                                                                </c:if>

                                                                </c:forEach>

                                                            </select>
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div>
                                            </c:if>

                                            <c:if test="${fieldStatus_10 eq 'y'}">
                                                <div class="col-md-4 form-floating mb-3">
                                                    <c:if test="${mand_status_10 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_10}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(assetDetails) > 0}">
                                                            <c:forEach items="${assetDetails}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" readonly="" id="utilityNo1" maxlength="20"  value="${list.utilityNo1}" >
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="utilityNo1" value="${list.utilityNo1}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="Fill" class="form-control"  id="utilityNo1"  maxlength="20" value="" >
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div>
                                            </c:if>

                                            <c:if test="${fieldStatus_11 eq 'y'}">
                                                <div class="col-md-4 form-floating mb-3">
                                                    <c:if test="${mand_status_11 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_11}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(assetDetails) > 0}">
                                                            <c:forEach items="${assetDetails}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" class="form-control" readonly="" id="utilityNo2"  maxlength="20" value="${list.utilityNo2}" >
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" readonly="" id="utilityNo2" value="${list.utilityNo2}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <input type="text" placeholder="Fill" class="form-control"  id="utilityNo2"  maxlength="20" value="" >
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div>
                                            </c:if>--%>


                                        <c:if test="${fieldStatus_13 eq 'y'}">
                                            <div class="col-md-4 form-floating mb-3">



                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control"  readonly="" id="valueOfSubAsset" maxlength="10" value="${list.valueOfSubAsset}" onkeypress="return isNumberKey(event)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="valueOfSubAsset" value="${list.valueOfSubAsset}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise> 
                                                        <input type="text" placeholder="Fill" class="form-control" id="valueOfSubAsset"  maxlength="10" value="" onkeypress="return isNumberKey(event)">
                                                    </c:otherwise>        
                                                </c:choose>
                                                <label class="control-label">Value of Unit/Shop
                                                    <c:if test="${mand_status_13 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if>
                                                </label>


                                            </div></c:if>

                                        <c:if test="${fieldStatus_14 eq 'y'}">
                                            <div class="col-md-4 form-floating mb-3">


                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control"  readonly="" id="minimumRentFixed"  maxlength="10" value="${list.minimumRentFixed}" onkeypress="return isNumberKey(event)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="minimumRentFixed" value="${list.minimumRentFixed}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Fill" class="form-control" id="minimumRentFixed"  maxlength="10" value="" onchange="return calcArea();" onkeypress="return isNumberKey(event)">
                                                    </c:otherwise>        
                                                </c:choose>
                                                <label class="control-label">${field_14}
                                                    <c:if test="${mand_status_14 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                </label>

                                            </div></c:if>

                                        <%--  <c:if test="${fieldStatus_15 eq 'y'}">
                                              <div class="col-md-4 form-floating mb-3">
                                                  
                                                  
                                                  <c:choose>
                                                      <c:when test="${fn:length(assetDetails) > 0}">
                                                          <c:forEach items="${assetDetails}" var="list">
                                                              <c:choose>
                                                                  <c:when test="${action eq 'edit'}">
                                                                      <input type="text" class="form-control"  readonly="" id="actualRent"  maxlength="10" value="${list.actualRent}" onkeypress="return checkdigit(event, this, 10, 2);">
                                                                  </c:when>
                                                                  <c:otherwise>
                                                                      <input type="text" class="form-control" readonly="" id="actualRent" value="${list.actualRent}">
                                                                  </c:otherwise> 
                                                              </c:choose>
                                                          </c:forEach>
                                                      </c:when>
                                                      <c:otherwise>                                                    
                                                          <input type="text" placeholder="Fill"  class="form-control"  id="actualRent"  maxlength="10" value="" onkeypress="return checkdigit(event, this, 10, 2);">
                                                      </c:otherwise>        
                                                  </c:choose>
                                                          <label class="control-label">${field_15}
                                                  <c:if test="${mand_status_15 eq 'required'}">
                                                      <a style="color:red;">*</a>
                                                  </c:if>
                                                  </label>

                                                </div></c:if> --%>

                                        <c:if test="${fieldStatus_16 eq 'y'}">
                                            <div class="col-md-4 form-floating mb-3">



                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_16} readonly="" id="remarks" rows="1"  maxlength="200" value="${list.remarks}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="remarks" value="${list.remarks}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <textarea  class="form-control" placeholder="Fill" ${mand_status_16} id="remarks" rows="1"  maxlength="200" value="" type="text"></textarea>
                                                    </c:otherwise>        
                                                </c:choose>
                                                <label  class="control-label">${field_16}
                                                    <c:if test="${mand_status_16 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if>
                                                </label>

                                            </div></c:if>


                                        <c:if test="${fieldStatus_17 eq 'y'}">
                                            <div class="col-md-4 form-floating mb-3">


                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_17} readonly="" id="attr1" name="attr1" maxlength="35" value="${list.attribute1}" onchange="return validateEmail(event);">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="attr1" value="${list.attribute1}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Fill" class="form-control" ${mand_status_17} id="attr1" name="attr1" maxlength="35" value="" onchange="return validateEmail(event);">
                                                    </c:otherwise>        
                                                </c:choose>
                                                <label class="control-label">${field_17}
                                                    <c:if test="${mand_status_17 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if>
                                                </label>

                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_18 eq 'y'}">
                                            <div class="col-md-4 form-floating mb-3">


                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_18} readonly="" id="attr2" name="attr2" maxlength="35" value="${list.attribute2}" onchange="return validateEmail(event);">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="attr2" value="${list.attribute2}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Fill" class="form-control" ${mand_status_18} id="attr2" name="attr2" maxlength="35" value="" onchange="return validateEmail(event);">
                                                    </c:otherwise>        
                                                </c:choose>
                                                <label class="control-label">${field_18}
                                                    <c:if test="${mand_status_18 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if>
                                                </label>

                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_19 eq 'y'}">
                                            <div class="col-md-4 form-floating mb-3">


                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_19} readonly="" id="attr3" name="attr3" maxlength="35" value="${list.attribute3}" onchange="return validateEmail(event);">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="attr3" value="${list.attribute3}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Fill" class="form-control" ${mand_status_19} id="attr3" name="attr3" maxlength="35" value="" onchange="return validateEmail(event);">
                                                    </c:otherwise>        
                                                </c:choose>
                                                <label class="control-label">${field_19}
                                                    <c:if test="${mand_status_19 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if>
                                                </label>

                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_20 eq 'y'}">
                                            <div class="col-md-4 form-floating mb-3">


                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_20} readonly="" id="attr4" name="attr4" maxlength="35" value="${list.attribute4}" onchange="return validateEmail(event);">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="attr4" value="${list.attribute4}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Fill" class="form-control" ${mand_status_20} id="attr4" name="attr4" maxlength="35" value="" onchange="return validateEmail(event);">
                                                    </c:otherwise>        
                                                </c:choose>
                                                <label class="control-label">${field_20}
                                                    <c:if test="${mand_status_20 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if>
                                                </label>

                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_21 eq 'y'}">
                                            <div class="col-md-4 form-floating mb-3">


                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_21} readonly="" id="attr5" name="attr5" maxlength="35" value="${list.attribute5}" onchange="return validateEmail(event);">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="attr5" value="${list.attribute5}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Fill" class="form-control" ${mand_status_21} id="attr5" name="attr5" maxlength="35" value="" onchange="return validateEmail(event);">
                                                    </c:otherwise>        
                                                </c:choose>
                                                <label class="control-label">${field_21}
                                                    <c:if test="${mand_status_21 eq 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if>
                                                </label>
                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_12 eq 'y'}">
                                            <div class="col-md-4 form-floating mb-3">


                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_12} readonly="" id="valueOfSubClassifiedAsset" maxlength="10" value="${list.valueOfSubClassifiedAsset}" onkeypress="return isNumberKey(event)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="valueOfSubClassifiedAsset" value="${list.valueOfSubClassifiedAsset}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>   
                                                        <input type="text" placeholder="Fill" class="form-control" ${mand_status_12} id="valueOfSubClassifiedAsset"  maxlength="10" value="" onkeypress="return checkdigit(event, this, 10, 2);">
                                                    </c:otherwise>        
                                                </c:choose>
                                                <label class="control-label">${field_12}
                                                    <c:if test="${mand_status_12 ne 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                </label>

                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_6 eq 'y'}">
                                            <div class="col-md-4 form-floating mb-3">

                                                <label class="control-label">${field_6}
                                                    <c:if test="${mand_status_6 ne 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if>
                                                </label>
                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_6} readonly="" id="width"  maxlength="10" value="${list.width}" onkeypress="return isNumberKey(event)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="width" value="${list.width}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Fill" class="form-control" ${mand_status_6} id="width"  maxlength="10" value="" onchange="return calcArea();" onkeypress="return isNumberKey(event)">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>

                                        <c:if test="${fieldStatus_7 eq 'y'}">
                                            <div class="col-md-4 form-floating mb-3">


                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_7} readonly="" id="length" maxlength="10" value="${list.length}" onkeypress="return isNumberKey(event)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="length" value="${list.length}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Fill"  class="form-control" ${mand_status_7} id="length"  maxlength="10" value="" onchange="return calcArea();" onkeypress="return isNumberKey(event)">
                                                    </c:otherwise>        
                                                </c:choose>
                                                <label class="control-label">${field_7}
                                                    <c:if test="${mand_status_7 ne 'required'}">
                                                        <a style="color:red;">*</a>
                                                    </c:if>
                                                </label>

                                            </div></c:if>


                                        <c:if test="${sno eq null}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group mb-2">
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <button type="button" class="btn btn-primary" style="" onclick="addOrderRow_test();"><i class="fa fa-plus-circle" style="font-size: 15px"></i> ADD</button>

                                                </div>
                                            </div>

                                            <div class="clearfix"></div>



                                            <div class="table-responsive mb-3" >

                                                <table  class="table table-bordered" id="membertable" style="width: 1600px;">
                                                    <thead>
                                                        <tr>
                                                            <th><i class="fa fa-trash fa-lg"></i></th>                                                
                                                            <th><span style="color:red">*</span> Floor</th>
                                                            <th> <span style="color:red">*</span>Unit Name/Unit No</th>
                                                            <th><span style="color:red">*</span> Unit Type</th>

                                                            <!--                                                                    <th><span style="color:red">*</span> Room / Unit Name</th>
                                                                                                                                  <th><span style="color:red">*</span> Room / Unit Type</th>-->

                                                            <th> Built Up Area(SQM)</th>
                                                            <!--                                                                <th> <span style="color:red">*</span>Parking</th>
                                                                                                                            <th> <span style="color:red">*</span>Utility No1</th>
                                                                                                                            <th><span style="color:red">*</span> Utility No2</th>-->
                                                            <th>Value of Unit/Shop</th>
                                                            <th><span style="color:red">*</span>Minimum Rent Fixed</th>

                                                            <th>Remarks</th>
                                                        </tr>

                                                    </thead>
                                                    <tbody id="resourcetable">

                                                    </tbody>
                                                    <script>
                                                        var count = 0;
                                                        function addOrderRow_test() {


                                                            var valid1 = true;
                                                            var x = document.getElementById('floor').value &&
                                                                    document.getElementById('subAssetName').value &&
                                                                    document.getElementById('subAssetType').value &&
//                                                                        document.getElementById('parking').value &&
//                                                                        document.getElementById('utilityNo1').value &&
//                                                                        document.getElementById('utilityNo2').value &&
                                                                    document.getElementById('minimumRentFixed').value;
                                                            if (x == "" || x == null)
                                                            {
                                                                alert("Please Select Mandatory Fields");
                                                                valid1 = false;
                                                            }



                                                            if (valid1 == true) {

                                                                var floor = document.getElementById('floor').value;
                                                                var assetCode = document.getElementById('assetCode').value;
                                                                var subAssetName = document.getElementById('subAssetName').value;
                                                                var subAssetType = document.getElementById('subAssetType').value;

//                                                                        var unitName = document.getElementById('unitName').value;
//                                                                          var unittype = document.getElementById('unittype').value;
                                                                var area = document.getElementById('area').value;
//                                                                    var parking = document.getElementById('parking').value;
//                                                                    var utilityNo1 = document.getElementById('utilityNo1').value;
//                                                                    var utilityNo2 = document.getElementById('utilityNo2').value;
                                                                var valueOfSubAsset = document.getElementById('valueOfSubAsset').value;
                                                                var minimumRentFixed = document.getElementById('minimumRentFixed').value;
//                                                                    var actualRent = document.getElementById('actualRent').value;
                                                                var remarks = document.getElementById('remarks').value;
                                                                var table = document.getElementById("resourcetable");

                                                                $('#resourcetable tr').each(function () {
                                                                    var a = $(this).find('#subAssetName1').val();
                                                                    if (a == subAssetName) {
                                                                        alert('subAssetName Is Already Added');
                                                                        document.getElementById('td').value = "";
                                                                        return false;
                                                                    } else {
                                                                        return true;
                                                                    }
                                                                })

                                                                var slNo = table.rows.length - 1;
                                                                var slNo1 = table.rows.length;
                                                                var id1 = slNo1;
                                                                var tr = table.insertRow(slNo + 1);
                                                                tr.id = 'list_tr_' + slNo;
                                                                tr.innerHTML = '<td align="center" class="tinput"><button type="button" class="fa fa-trash fa-lg-o" onclick="removeRow('
                                                                        + slNo + ')" ></button> </td>' +
                                                                        '<td ><input class="form-control " style="text-align:left;" type="text" readonly name="floor" value="' + floor +
                                                                        '" ></td><td><input class="form-control " style="text-align:left;" type="text"readonly name="subAssetName" id="subAssetName1" value="' + subAssetName +
                                                                        '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text"readonly name="subAssetType" value="' + subAssetType +
                                                                        '" style="border: none"></td><td><input class="form-control " style="text-align:right;" type="text"readonly name="area" value="' + area +
//                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text"readonly name="parking" value="' + parking +
//                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:right;" type="text"readonly name="utilityNo1" value="' + utilityNo1 +
//                                                                            '" style="border: none"></td><td><input class="form-control " style="text-align:right;" type="text"readonly name="utilityNo2" value="' + utilityNo2 +
                                                                        '" style="border: none"></td><td><input class="form-control " style="text-align:right;" type="text" readonly name="valueOfSubAsset" value="' + valueOfSubAsset +
                                                                        '" style="border: none"></td><td><input class="form-control " style="text-align:right;" type="text" readonly name="minimumRentFixed" value="' + minimumRentFixed +
                                                                        '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text" readonly name="remarks" value="' + remarks +
                                                                        '" style="border: none"><input class="form-control " style="text-align:center;" type="hidden"readonly name="assetCode"  value="' + assetCode +
                                                                        '" style="border: none"></td>';
                                                                count++;
                                                                document.getElementById('subAssetName').value = "";
                                                                document.getElementById('area').value = "";
//                                                                    document.getElementById('parking').value = "";
//                                                                    document.getElementById('utilityNo1').value = "";
//                                                                    document.getElementById('utilityNo2').value = "";
                                                                document.getElementById('valueOfSubAsset').value = "";
                                                                document.getElementById('minimumRentFixed').value = "";
                                                                document.getElementById('actualRent').value = "";
                                                                document.getElementById('remarks').value = "";

                                                            } else {
                                                                return;
                                                            }

                                                            document.getElementById('assetCode').disabled = true;
                                                        }
                                                        //                                                            function Validate($this)
                                                        //                                                            {
                                                        //                                                                //  var fl = $("UploadMedicalRepName").value;
                                                        //
                                                        //                                                                var table = document.getElementById("resourcetable");
                                                        //                                                                var $itemRow = $($this).closest('tr');
                                                        //                                                                // var fl = $("#UploadMedicalRepName").val();
                                                        //
                                                        //                                                                var fileSize = $this.files[0];
                                                        //                                                                var sizeInMb = fileSize.size / 1024;
                                                        //                                                                var sizeLimit = 1024 * 2;
                                                        //                                                                if (sizeInMb > sizeLimit) {
                                                        //                                                                    alert("File Size Exceeded(Only 2MB Allowed)");
                                                        //                                                                    $($this).val('');
                                                        //                                                                    return;
                                                        //                                                                }
                                                        //                                                                var fmt = /(\.jpg|\.png|\.JPG|\.PNG|\.jpeg|\.JPEG)$/;
                                                        //                                                                if (!fl.match(fmt))
                                                        //                                                                {
                                                        //                                                                    alert('Invalid File');
                                                        //                                                                    $($this).val('');
                                                        //                                                                    return false;
                                                        //                                                                }
                                                        //
                                                        //                                                                else {
                                                        //                                                                    return true;
                                                        //                                                                }
                                                        //
                                                        //                                                            }
                                                        function removeRow(id) {
                                                            count--;
                                                            var table = document.getElementById("resourcetable");
                                                            for (var i = 0; i < table.rows.length; i++) {
                                                                var lr = table.rows[i];
                                                                if (lr.id == 'list_tr_' + id) {
                                                                    table.deleteRow(i);
                                                                    return;
                                                                }
                                                            }
                                                        }
                                                        function checkGrid() {
                                                            var table = document.getElementById("resourcetable");
                                                            var slNo = table.rows.length - 1;
                                                            if (slNo < 0) {
                                                                alert("Please add data in grid");
                                                                $("#subAssetName").focus();
                                                                $("#floor").focus();
                                                                return false;
                                                            } else {
                                                                return true;
                                                            }
                                                        }

                                                    </script>

                                                </table>                        


                                            </div>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${action eq 'view' || action eq 'edit'}" >

                                        <div class="table-responsive mb-3">

                                            <table  class="table table-bordered" id="membertable" style="width: 1600px;">
                                                <thead>
                                                    <tr>
                                                        <th><span style="color:red">*</span> Floor</th>
                                                        <th> <span style="color:red">*</span>Flat Code</th>
                                                        <th> <span style="color:red">*</span>Flat Name / Flat_No.</th>
                                                        <th><span style="color:red">*</span> Unit Type</th>
                                                        <th>Built Up Area(Sq m)</th>
                                                        <!--                                                                <th> <span style="color:red">*</span>Parking</th>
                                                                                                                        <th> <span style="color:red">*</span>Utility No1</th>
                                                                                                                        <th><span style="color:red">*</span> Utility No2</th>-->
                                                        <th> Value of Unit/Shop</th>
                                                        <th> Minimum Rent Fixed</th>
                                                        <th><span style="color:red">*</span>Actual Rent</th>
                                                        <th>Remarks</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="currencytablemed">
                                                    <c:forEach items="${subAssetDetails}" var="type">
                                                        <tr class="item-row"> 

 <!--<td><input class="form-control" style="text-align: left;"   autocomplete="off" name="subAssetCode" type="text" maxlength="30" value="${type.subAssetCode}"></td>-->
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <select id="floor" name="floor"  autocomplete="off" class="form-control" value="${type.floor}"  onfocus="return changeFloor();">
                                                                            <option value="${type.floor}">${type.floor}</option>

                                                                            <!--                                                                                    <input type="hidden" id="noOfFloors" value="" onfocus="return changeFloor();">
                                                                                                                                                                <input type="hidden" id="mezzanineFloor" value="${type.floor}" onfocus="return changeFloor();">
                                                                                                                                                                <input type="hidden" id="subCode1" value="">
                                                                            -->

                                                                            <c:forEach items="${assetDetails}" var="list">
                                                                                <c:choose>
                                                                                    <c:when test="${type.assetCode eq list.assetCode}">
                                                                                        <input type="hidden" id="noOfFloors" value="${list.noOfFloors}" onfocus="return changeFloor();">
                                                                                    </c:when>
                                                                                </c:choose>
                                                                            </c:forEach>
                                                                            <input type="hidden" id="mezzanineFloor" value="Y" onfocus="return changeFloor();">
                                                                            <input type="hidden" id="subCode1" value="">
                                                                            <input type="hidden" id="basement" value="Y" onfocus="return changeFloor();">
                                                                        </select>

                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input class="form-control" style="text-align: left;"  readonly="" name="floor" autocomplete="off" type="text" maxlength="30" value="${type.floor}">
                                                                    </c:otherwise> 
                                                                </c:choose>

                                                            </td>

                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input class="form-control" style="text-align: left;"   autocomplete="off" name="subAssetCode" type="text" maxlength="30" value="${type.subAssetCode}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input class="form-control" style="text-align: left;"   readonly=" " autocomplete="off" name="subAssetCode" type="text" maxlength="30" value="${type.subAssetCode}">
                                                                    </c:otherwise>

                                                                </c:choose>
                                                            </td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input class="form-control" style="text-align: left;" name="subAssetName" required autocomplete="off" type="text" maxlength="30" value="${type.subAssetName}">
                                                                        <input type="hidden" name="assetCode" value="${type.assetCode}">
                                                                        <input type="hidden" name="recordStatus1" value="${type.recordStatus}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input class="form-control" style="text-align: left;"  readonly autocomplete="off" type="text" maxlength="30" value="${type.subAssetName}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <%--<input class="form-control" style="text-align: center;" name="subAssetType" readonly="" autocomplete="off" type="text" maxlength="100" value="${type.subAssetType}">--%>

                                                                        <select id="subAssetType" name="subAssetType"  ${mand_status_5} class="form-control" value="${type.subAssetType}">
                                                                            <option value="${type.subAssetType}"  selected>${type.subAssetType}</option>
                                                                            <c:forEach items="${flattypes}" var="types1">
                                                                                <option value="${types1}" >${types1}</option>                                            
                                                                            </c:forEach>

                                                                        </select>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input class="form-control" style="text-align: left;" readonly autocomplete="off" id="subAssetType" name="subAssetType" type="text" maxlength="100" value="${type.subAssetType}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input class="form-control" style="text-align: right;" name="area" id="area1" readonly="" autocomplete="off" type="text" maxlength="30" value="${type.area}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input class="form-control" style="text-align: right;" readonly autocomplete="off" type="text" maxlength="30" value="${type.area}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </td>
                                                            <!--                                                                    <td>
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input class="form-control" style="text-align: center;" name="parking" readonly autocomplete="off" type="text" maxlength="30" value="${type.parking}">
                                                                    <select id="parking" name="parking" required="" class="form-control validate[required]">
                                                                        <option>${type.parking}</option>
                                                                    <c:forEach items="${Dropdown}" var="list">
                                                                        <c:if test="${list[0] eq 'F-04'}">
                                                                            <option>${list[1]}</option>                                     
                                                                        </c:if>

                                                                    </c:forEach>

                                                                </select>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input class="form-control" style="text-align: left;"  readonly autocomplete="off" type="text" maxlength="30" value="${type.parking}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input class="form-control" style="text-align: right;" name="utilityNo1" required autocomplete="off" type="text" maxlength="30" value="${type.utilityNo1}" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input class="form-control" style="text-align: right;"  readonly autocomplete="off" type="text" maxlength="30" value="${type.utilityNo1}" onkeypress="return checkdigit(event, this, 10, 2);">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input class="form-control" style="text-align: right;" name="utilityNo2" required autocomplete="off" type="text" maxlength="30" value="${type.utilityNo2}" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input class="form-control" style="text-align: right;" readonly autocomplete="off" type="text" maxlength="30" value="${type.utilityNo2}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </td>-->
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input class="form-control" style="text-align: right;"  name="valueOfSubAsset" autocomplete="off" type="text" maxlength="30" value="${type.valueOfSubAsset}" onkeypress="return checkdigit(event, this, 10, 2);">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input class="form-control" style="text-align: right;" readonly autocomplete="off" type="text" maxlength="30" value="${type.valueOfSubAsset}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input class="form-control" style="text-align: right;"  name="minimumRentFixed" autocomplete="off" type="text" maxlength="30" value="${type.minimumRentFixed}" onkeypress="return checkdigit(event, this, 10, 2);">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input class="form-control" style="text-align: right;"  readonly autocomplete="off" type="text" maxlength="30" value="${type.minimumRentFixed}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input class="form-control" style="text-align: right;" required name="actualRent"  autocomplete="off" type="text" maxlength="30" value="${type.actualRent}" onkeypress="return checkdigit(event, this, 10, 2);">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input class="form-control" style="text-align: right;"  readonly autocomplete="off" type="text" maxlength="30" value="${type.actualRent}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input class="form-control" style="text-align: left;" name="remarks"  autocomplete="off" type="text" maxlength="30" value="${type.remarks}">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input class="form-control" style="text-align: left;"  readonly autocomplete="off" type="text" maxlength="30" value="${type.remarks}">
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>

                                            </table>

                                        </div>
                                    </c:if>

                                    <c:if test="${action ne 'view'}">
                                        <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
                                            <button type="submit" class="btn btn-primary" style="">Save</button>
                                            <a href="../assets/subAssetsDetailsList.htm" class="btn btn-danger">Cancel</a>
                                        </div>
                                    </c:if>
                                    <c:if test="${action eq 'view'}">
                                        <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
                                            <a href="../assets/subAssetsDetailsList.htm" class="btn btn-danger">Cancel</a>
                                        </div>
                                    </c:if>
                                </form></div>

                        </div>
                    </div>

                </div>
                </div>
            </section>

        </main><!-- End #main -->
        <script src="../common/theme/js/custom.js"></script>

    </body>

</html>
