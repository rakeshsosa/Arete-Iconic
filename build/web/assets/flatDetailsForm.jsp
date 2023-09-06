<%-- 
    Document   : flatDetailsForm
    Created on : 31 Mar, 2018, 11:57:06 AM
    Author     : ebs-sdd41
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
                $('#subassetsForm').validationEngine();
                $("input").on("keypress", function (e) {

                    if (e.which === 32 && !this.value.length)
                        e.preventDefault();
                });
                var subType1 = document.getElementById("assetType2").value;

                var y = document.getElementById("subAssetType1");
                var option = document.createElement("option");
                var types = ["Both", "Commercial", "Residential"];
                if (subType1 == 'Both') {
                    for (var i = 0; i < 3; i++) {
                        var type = new Option(types[i], types[i]);
                        y.options.add(type);
                    }
                }
                else {
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
                    }
                    else {
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
                    }
                    else {
                        document.getElementById("area1").value = area;
                    }
                }

            }
            function changeFloor() {
                var fld = document.getElementById('noOfFloors').value;
                var mezzanineFloor1 = document.getElementById('mezzanineFloor').value;

                if (mezzanineFloor1 == 'Y') {
                    var mezzanineFloor2 = "Mezzanine Floor";
                }
                $("#floor").empty();
                var x = document.getElementById("floor");
                var option = document.createElement("option");
                var floor1 = new Option(mezzanineFloor2, mezzanineFloor2);
                var floors = ["Ground Floor", "1ST Floor", "2ND Floor", "3RD Floor", "4TH Floor", "5TH Floor", "6TH Floor", "7TH Floor", "8TH Floor", "9TH Floor", "10TH Floor", "11TH Floor", "12TH Floor", "13TH Floor", "14TH Floor", "15TH Floor", "16TH Floor", "17TH Floor", "18TH Floor", "19TH Floor", "20TH Floor", "21ST Floor"];
                for (var i = 0; i < fld; i++) {
                    var floor = new Option(floors[i], floors[i]);
                    x.options.add(floor);
                    if (mezzanineFloor1 == 'Y') {
                        x.options.add(floor1);
                    }
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
                }
                else {
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
            function selectPropertyDetails()
            {
                myWindow = window.open("../assets/selectPropertyDetails.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }

            function selectSubAssetDetails()
            {
                var assetCode = document.getElementById("assetCode").value;

                myWindow = window.open("../assets/selectSubAssetDetails1.htm?assetCode=" + assetCode + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }

            function checkSubAssetName() {
                var subAssetName = document.getElementById('subAssetName').value;
                var assetCode = document.getElementById('assetCode').value;


                $.ajax({
                    type: "POST",
                    url: "../assets/subAssetType.htm",
                    data: {subAssetName: subAssetName, assetCode: assetCode},
                    dataType: "text",
                    success: function (data)
                    {
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
                                <jsp:include page="../login/headerlink.htm?submodule=Property Details&tab=Flat/Unit Details&pagetype=form"/>
                                <div class="x_title">
                                    <h2>Floor Details</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />
                                    <form class="form-inline" id="subassetsForm" action="../assets/flatDetailsFormSubmit.htm"  method="post" enctype="multipart/form-data" onsubmit="return checkGrid();">

                                        <c:forEach items="${subAssetDetails}" var="type">
                                            <c:set value="${type.subAssetName}" var="subAssetName1"/>
                                            <c:set value="${type.subAssetCode}" var="subAssetCode1"/>
                                        </c:forEach>
                                        <c:forEach items="${assetname}" var="list">
                                            <c:set value="${list.assetCode}" var="assetCode1"/>
                                            <c:set value="${list.assetName}" var="assetName1"/>
                                        </c:forEach>

                                        <div class="col-md-4 form-floating">
                                            <c:choose>
                                                <c:when test="${fn:length(subAssetDetails) > 0}">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" class="form-control" required readonly="" id="assetCode" name="assetCode" value="${assetCode1}">
                                                            <!--<input type="hidden" name="pk" value="${SNo}">-->
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" class="form-control" id="assetCode" readonly="" value="${assetCode1}">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="Select Property Code" class="form-control" required id="assetCode" readonly="" maxlength="40" value=""  onclick="return selectPropertyDetails();" >
                                                </c:otherwise>        
                                            </c:choose>
											<label class="control-label">Property Code <a style="color:red;">*</a></label>
                                        </div>

                                        <div class="col-md-4 form-floating">
                                            <c:choose>
                                                <c:when test="${fn:length(assetname) > 0}">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" class="form-control" required readonly="" id="assetName" name="assetName" value="${assetName1}">
                                                            <input type="hidden" id="assetType2" value="${assetType2}">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" class="form-control" readonly="" id="assetName" value="${assetName1}">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" placeholder="Fill"  class="form-control" required="" id="assetName" readonly="" maxlength="40" value="" onkeypress="return isNumberKey3(event)" onfocus="return changeFloor();">
                                                    <input type="hidden" id="assetType1" value="">
                                                </c:otherwise>        
                                            </c:choose>
											<label class="control-label">Property Name <a style="color:red;">*</a></label>
                                        </div>


                                        <div class="col-md-4 form-floating">
                                            <c:choose>
                                                <c:when test="${fn:length(subAssetDetails) > 0}">
                                                    <c:forEach items="${subAssetDetails}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control"  readonly="" id="floor"  maxlength="40" value="${list.subAssetCode}" >
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="floor" value="${list.subAssetCode}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" id="subAssetCode"  required class="form-control" readonly="" placeholder="Select Flat" onclick="selectSubAssetDetails();">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Flat Code <a style="color:red;">*</a></label>
                                        </div>

                                        <div class="col-md-4 form-floating">
                                            <c:choose>
                                                <c:when test="${fn:length(subAssetDetails) > 0}">
                                                    <c:forEach items="${subAssetDetails}" var="list">
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
                                                    <input type="text" placeholder="Fill" class="form-control" id="subAssetName" readonly=""  maxlength="40" value="" onkeypress="return isNumberKey3(event)" >
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Flat Name / Flat_No. <a style="color:red;">*</a></label>
                                        </div>

                                        <c:if test="${action ne 'view' && action ne 'edit'}" >


                                            <div class="col-md-4 form-floating">
<!--                                                <a style="font-size: 15px;margin-top:-21px;color:transparent;font-weight: bold;">*</a>-->
                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" id="area"  maxlength="20" value="${list.area}" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="area" value="${list.area}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>   
                                                        <input type="text" placeholder="Fill"  class="form-control" id="roomName"  maxlength="20" value="" >
                                                    </c:otherwise>        
                                                </c:choose>
                                                <label class="control-label">Room/Unit Name <a style="color:red;">*</a></label>
                                            </div>
											
                                            <div class="col-md-4 form-floating">
                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control"  readonly="" id="subAssetType"  value="${list.subAssetType}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="roomType" value="${list.subAssetType}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <select id="roomType"  class="form-select">
                                                            <option value="" disabled selected>Select your option</option>
                                                            <c:forEach items="${flattypes}" var="types1">
                                                                <option value="${types1}" >${types1}</option>                                            
                                                            </c:forEach>

                                                        </select>
                                                    </c:otherwise>        
                                                </c:choose>
                                                <label class="control-label">Room/Unit Type <a style="color:red;">*</a></label>
                                            </div>
											
                                            <%--<div class="col-md-4 form-floating">
                                                
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
                                                        <select id="parking" class="form-select">
                                                            <option value="" disabled selected>Select your option</option>
                                                            <option>Yes</option>                                     
                                                            <option>No</option>                                     


                                                        </select>
                                                    </c:otherwise>        
                                                </c:choose>
                                                <label class="control-label">Parking <a style="color:red;">*</a></label>
                                            </div>

                                            <div class="col-md-4 form-floating">
                                                
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
                                                <label class="control-label">Utility No.1 <a style="color:red;">*</a></label>
                                            </div>


                                            <div class="col-md-4 form-floating">
                                                
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
                                                <label class="control-label">Utility No.2 <a style="color:red;">*</a></label>
                                            </div>--%>


                                            <div class="col-md-4 form-floating">
                                                
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
                                                        <input type="text" placeholder="Fill" class="form-control" id="minimumRentFixed"  maxlength="10" value="" onchange="return calcArea();" onkeypress="return checkdigit(event, this, 10, 2);">
                                                    </c:otherwise>        
                                                </c:choose>
                                                <label class="control-label">Minimum Rent Fixed (OMR) <a style="color:red;">*</a></label>
                                            </div>

                                            <div class="col-md-4 form-floating">
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
                                                 <label class="control-label">Actual Rent (OMR) <a style="color:red;">*</a></label>
                                            </div>
											
                                            <div class="col-md-4 form-floating">
<!--                                                <a style="font-size: 15px;margin-top:-21px;color:transparent;font-weight: bold;">*</a>-->
                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control"  readonly="" id="remarks"  maxlength="200" value="${list.remarks}" onkeypress="return isNumberKey(event)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="remarks" value="${list.remarks}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <textarea  class="form-control" placeholder="Fill" id="remarks" style="resize: none" maxlength="200" value="" type="text"></textarea>
                                                    </c:otherwise>        
                                                </c:choose>
                                                <label class="control-label">Remarks <a style="color:red;">*</a></label>
                                            </div>
                                       

                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <button type="button" class="btn btn-succ" style="" onclick="addOrderRow_test();"><i class="fa fa-plus-circle" style="font-size: 15px"></i> ADD</button>

                                                </div>
                                            </div>

                                            <div class="clearfix"></div>



                                            <div style="overflow: scroll;height: auto;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">

                                                <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                    <thead>
                                                        <tr>
                                                            <th><i class="fa fa-trash fa-lg"></i></th>                                                
                                                            <th><span style="color:red">*</span> Property Name</th>
                                                            <th> <span style="color:red">*</span>Flat Name / Flat_No.</th>
                                                            <th><span style="color:red">*</span> Room/Unit Name</th>
                                                            <th> <span style="color:red">*</span>Room/Unit Type</th>
<!--                                                            <th> <span style="color:red">*</span>Parking</th>
                                                            <th> <span style="color:red">*</span>Utility No1</th>
                                                            <th><span style="color:red">*</span> Utility No2</th>-->
                                                            <th><span style="color:red">*</span>Minimum Rent Fixed</th>
                                                            <th><span style="color:red">*</span>Actual Rent</th>
                                                            <th>Remarks</th>
                                                        </tr>

                                                    </thead>
                                                    <tbody id="resourcetable">

                                                    </tbody>
                                                    <script>
                                                        var count = 0;
                                                        function addOrderRow_test() {


                                                            var valid1 = true;
                                                            var x = document.getElementById('assetName').value &&
                                                                    document.getElementById('subAssetName').value &&
                                                                    document.getElementById('roomName').value &&
                                                                    document.getElementById('roomType').value &&
                                                                    //document.getElementById('parking').value &&
//                                                                    document.getElementById('utilityNo1').value &&
//                                                                    document.getElementById('utilityNo2').value &&
                                                                    document.getElementById('minimumRentFixed').value &&
                                                                    document.getElementById('actualRent').value;
                                                            if (x == "" || x == null)
                                                            {
                                                                alert("Please Select Mandatory Fields");
                                                                valid1 = false;
                                                            }
//                                                            alert("hiii");



                                                            if (valid1 == true) {

                                                                var assetCode1 = document.getElementById('assetCode').value;
                                                                var assetName = document.getElementById('assetName').value;
                                                                var subAssetCode = document.getElementById('subAssetCode').value;
                                                                var subAssetName = document.getElementById('subAssetName').value;
                                                                var roomName = document.getElementById('roomName').value;
                                                                var roomType = document.getElementById('roomType').value;
                                                                //var parking = document.getElementById('parking').value;
//                                                                var utilityNo1 = document.getElementById('utilityNo1').value;
//                                                                var utilityNo2 = document.getElementById('utilityNo2').value;
                                                                var minimumRentFixed = document.getElementById('minimumRentFixed').value;
                                                                var actualRent = document.getElementById('actualRent').value;
                                                                var remarks = document.getElementById('remarks').value;



                                                                var table = document.getElementById("resourcetable");

                                                                $('#resourcetable tr').each(function () {
                                                                    var a = $(this).find('#roomName1').val();
                                                                    if (a == roomName) {
                                                                        alert('Room/Unit Name is already added');
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
                                                                        '<td ><input class="form-control " style="text-align:left;" type="text" readonly name="floor" value="' + assetName +
                                                                        '" ></td><td><input class="form-control " style="text-align:left;" type="text"readonly name="subAssetName" id="subAssetName1" value="' + subAssetName +
                                                                        '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text"readonly id="roomName1" name="roomName" value="' + roomName +
                                                                        '" style="border: none"></td><td><input class="form-control " style="text-align:right;" type="text"readonly name="roomType" value="' + roomType +
                                                                        //'" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text"readonly name="parking" value="' + parking +
//                                                                        '" style="border: none"></td><td><input class="form-control " style="text-align:right;" type="text"readonly name="utilityNo1" value="' + utilityNo1 +
//                                                                        '" style="border: none"></td><td><input class="form-control " style="text-align:right;" type="text"readonly name="utilityNo2" value="' + utilityNo2 +
                                                                        '" style="border: none"></td><td><input class="form-control " style="text-align:right;" type="text" readonly name="minimumRentFixed" value="' + minimumRentFixed +
                                                                        '" style="border: none"></td><td><input class="form-control " style="text-align:right;" type="text" readonly name="actualRent" value="' + actualRent +
                                                                        '" style="border: none"></td><td><input class="form-control " style="text-align:left;" type="text" readonly name="remarks" value="' + remarks +
                                                                        '" style="border: none">' +
                                                                        '<input type="hidden" name="recordStatus" value="Vacant">' +
                                                                        '<input type="hidden" name="assetCode" value="' + assetCode1 + '">' +
                                                                        '<input type="hidden" name="subAssetCode" value="' + subAssetCode + '">' +
                                                                        '</td>';
                                                                count++;
                                                                document.getElementById('roomName').value = "";
                                                                $("select#roomType")[0].selectedIndex = 0;
                                                                //$("select#parking")[0].selectedIndex = 0;
//                                                                document.getElementById('utilityNo1').value = "";
//                                                                document.getElementById('utilityNo2').value = "";
                                                                document.getElementById('minimumRentFixed').value = "";
                                                                document.getElementById('actualRent').value = "";
                                                                document.getElementById('remarks').value = "";

                                                            } else {
                                                                return;
                                                            }

                                                            document.getElementById('assetCode').disabled = true;
                                                            document.getElementById('subAssetCode').disabled = true;
                                                        }

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



                                            </c:if>
                                            <c:if test="${action eq 'view' || action eq 'edit'}" >
                                                <p>&nbsp;</p>
                                                <p>&nbsp;</p>
                                                <div style="overflow: scroll;height: auto;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">

                                                    <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                        <thead>
                                                            <tr>
                                                                <th> <span style="color:red">*</span>Room/Unit Code</th>
                                                                <th><span style="color:red">*</span> Room/Unit Name</th>
                                                                <th> <span style="color:red">*</span>Room/Unit Type</th>
<!--                                                                <th> <span style="color:red">*</span>Parking</th>
                                                                <th> <span style="color:red">*</span>Utility No1</th>
                                                                <th><span style="color:red">*</span> Utility No2</th>-->
                                                                <th><span style="color:red">*</span>Minimum Rent Fixed</th>
                                                                <th><span style="color:red">*</span>Actual Rent</th>
                                                                <th>Remarks</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="currencytablemed">
                                                            <c:forEach items="${flatRoomDetails}" var="type">
                                                                <tr class="item-row"> 
                                                                    <td>
                                                                        <input class="form-control" style="text-align: left;"  readonly="" name="roomCode" autocomplete="off" type="text" maxlength="30" value="${type.roomCode}"></td>
                                                                    <td>
                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
                                                                                <input class="form-control" style="text-align: left;" name="roomName" required autocomplete="off" type="text" maxlength="30" value="${type.roomName}">
                                                                                <input type="hidden" name="pk" value="${type.SNo}">
                                                                                <input type="hidden" name="status" value="${type.status}">
                                                                                <input type="hidden" name="assetCode" value="${type.assetCode}">
                                                                                <input type="hidden" name="subAssetCode" value="${type.subAssetCode}">
                                                                                <input type="hidden" name="recordStatus" value="${type.recordStatus}">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input class="form-control" style="text-align: left;"  readonly autocomplete="off" type="text" maxlength="30" value="${type.roomName}">
                                                                            </c:otherwise> 
                                                                        </c:choose>
                                                                    </td>
                                                                    <td>
                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">

                                                                                <select id="roomType" name="roomType" class="form-control">
                                                                                      <option>${type.roomType}</option>
                                                                                </select>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input class="form-control" style="text-align: left;" name="roomType" readonly  type="text" maxlength="100" value="${type.roomType}">
                                                                            </c:otherwise> 
                                                                        </c:choose>
                                                                    </td>
                                                                    <%--<td>
                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
<!--                                                                                <input class="form-control" style="text-align: center;" name="parking" readonly autocomplete="off" type="text" maxlength="30" value="${type.parking}">-->
                                                                                <select id="parking" name="parking" required="" class="form-control validate[required]">
                                                                                    <option>${type.parking}</option>
                                                                                    <option>Yes</option>
                                                                                    <option>No</option>

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
                                                                    </td>--%>
                                                                    
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



                                        </div>
                                        <p>&nbsp;</p>
                                        <div>
                                            <c:if test="${action ne 'view'}">
                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                    <button type="submit" class="btn btn-primary" style="">Save</button>
                                                    <a href="../assets/flatDetailsList.htm" class="btn btn-danger">Cancel</a>
                                                </div>
                                            </c:if>
                                        </div>
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

