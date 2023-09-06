<%-- 
    Document   : complaintForm
    Created on : 10 Mar, 2016, 3:12:32 PM
    Author     : ebs-sdd05
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
        <link href="../common/theme/css/disableSelection.css" rel="stylesheet" type="text/css"/>

        <title>Arete Iconic</title>
         <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
        <script type="text/javascript">
            function Validate($this)
            {
                var fl = document.getElementById("attachmentName").value;
                var fileSize = $this.files[0];
                var sizeInMb = fileSize.size / 1024;
                var sizeLimit = 1024 * 2;
                if (sizeInMb > sizeLimit) {
                    alert("File Size Exceeded(Only 2MB Allowed)");
                    $($this).val('');
                    return;
                }
                var fmt = /^.*\.(jpg|JPG|gif|GIF|png|PNG|jpeg|JPEG|xls|XLS|xlsx|XLSX|doc|DOC|docx|DOCX|pdf|PDF)$/;
                if (!fl.match(fmt))
                {
                    alert('Invalid File');
                    $($this).val('');
                    return false;
                }

                else {
                    return true;
                }

            }


            function selectcust()
            {
                var x = document.getElementById("division").value;


                if (x === '')
                {
                    alert("Please Select Division");
                    return false;
                }
                else {

                    myWindow = window.open("../CRM/selectCustomer.htm?division=" + x, "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                }

            }

            function selectTenantDetails()
            {
                myWindow = window.open("../CRM/tenantDetailsForComplaint.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function mandTest() {
//                var llM = document.getElementById("llId").value;

                var tenantM = document.getElementById("tenantName").value &&
                        document.getElementById("date").value &&
                        document.getElementById("remarks").value;

                if (tenantM == '')
                {

                    alert("Please Fill Mandatory Fields.");

                    $('#tenantName').focus();
                    $('#date').focus();
                    $('#remarks').focus();
                    return false;
                }

                else {
                    document.forms["complaintForm"].submit();
                }
            }

            function test()
            {
                var remark = document.getElementById("remarks").value;
                var remark1 = document.getElementById("remarks1").value;
                var com = document.getElementById("compensation").value;
                var com1 = document.getElementById("compensation1").value;

                if (document.getElementById("remarks").value == "")
                {
                    alert("Enter Remarks");
                    return false;
                }
                else {

                    if (remark !== remark1 || com !== com1) {
                        if (confirm('Do you really want to Save this updated record')) {
                            document.forms["complaintForm"].submit();
                            return true;
                        } else {
                            return true;
                        }

                    } else {
                        document.forms["complaintForm"].submit();
                    }
                }

            }
        </script>
        <script>
                function selectEmpDetails() {
                
                myWindow = window.open("../CRM/selectProperty.htm", "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
        </script>
    </head>

    <% java.util.Date d = new java.util.Date();%>
    <body class="nav-sm">

        <jsp:include page="../login/menu.htm" />

                        <jsp:include page="../login/footer.jsp" />

                        <main id="main" class="main">
                            <div class="mt-3">
                                <jsp:include page="../login/headerlink.htm?submodule=Complaints&tab=Complaints&pagetype=form"/>
                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h5>Complaint Details</h5>
                                                </div>
                                    <c:forEach items="${complaintFormData}" var="list">
                                        <c:if test="${list[0] eq '297'}">
                                            <c:set value="${list[1]}" var="field_1"/>
                                            <c:set value="${list[2]}" var="fieldStatus_1"/>
                                            <c:set value="${list[3]}" var="mand_status_1"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '298'}">
                                            <c:set value="${list[1]}" var="field_2"/>
                                            <c:set value="${list[2]}" var="fieldStatus_2"/>
                                            <c:set value="${list[3]}" var="mand_status_2"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '299'}">
                                            <c:set value="${list[1]}" var="field_3"/>
                                            <c:set value="${list[2]}" var="fieldStatus_3"/>
                                            <c:set value="${list[3]}" var="mand_status_3"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '300'}">
                                            <c:set value="${list[1]}" var="field_4"/>
                                            <c:set value="${list[2]}" var="fieldStatus_4"/>
                                            <c:set value="${list[3]}" var="mand_status_4"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '301'}">
                                            <c:set value="${list[1]}" var="field_5"/>
                                            <c:set value="${list[2]}" var="fieldStatus_5"/>
                                            <c:set value="${list[3]}" var="mand_status_5"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '302'}">
                                            <c:set value="${list[1]}" var="field_6"/>
                                            <c:set value="${list[2]}" var="fieldStatus_6"/>
                                            <c:set value="${list[3]}" var="mand_status_6"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '138'}">
                                            <c:set value="${list[1]}" var="field_7"/>
                                            <c:set value="${list[2]}" var="fieldStatus_7"/>
                                            <c:set value="${list[3]}" var="mand_status_7"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '707'}">
                                            <c:set value="${list[1]}" var="field_8"/>
                                            <c:set value="${list[2]}" var="fieldStatus_8"/>
                                            <c:set value="${list[3]}" var="mand_status_8"/>
                                        </c:if>
                                    </c:forEach>
                                    <c:forEach items="${complaintList}" var="type">
                                        <c:forEach items="${assetDetails}" var="asset">
                                            <c:if test="${asset.assetCode eq type.assetName}">
                                                <c:set var="assetName1" value="${asset.assetName}"/>

                                            </c:if> 
                                        </c:forEach>
                                        <c:forEach items="${subAssetDetails}" var="subasset">
                                            <c:if test="${subasset.subAssetCode eq type.assetNo}">
                                                <c:set var="subAssetName1" value="${subasset.subAssetName}"/>

                                            </c:if> 
                                        </c:forEach>
                                    </c:forEach>


                                    <form class="form-floating row" id="complaintForm" accept-charset="UTF-8" method="post" action="../CRM/complaintFormSubmit.htm" enctype="multipart/form-data" >
                                        <c:choose>
                                            <c:when test="${fn:length(complaintList) > 0}">
                                                <c:forEach items="${complaintList}" var="list">
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
                                                            
                                                                           <c:if test="${fieldStatus_1 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating">
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(complaintList) > 0}">
                                                        <c:forEach items="${complaintList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input name="tenantName" id="tenantName"  ${mand_status_1} type="text" placeholder="Fill" maxlength="30" class="form-control" value="${type.complaintCode}" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" placeholder="Fill" id="tenantName"  name="tenantName" readonly class="form-control" value="${type.complaintCode}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>

                                                        <input name="tenantName" placeholder="Fill" id="tenantName"  maxlength="30" ${mand_status_1} type="text" placeholder="Fill"  class="form-control " readonly  value="${orderNo}" > 
                                                        <input name="complaintCode" type="hidden" value="">

                                                    </c:otherwise>        
                                                </c:choose>
                                                        
                                                <label class="control-label">Complaint No </label>
                                            </div>
                                        </c:if>
                                                            <c:if test="${fieldStatus_1 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3 complaintdate1">
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(complaintList) > 0}">
                                                        <c:forEach items="${complaintList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input name="tenantName" id="tenantName"  ${mand_status_1} type="text" placeholder="Fill" maxlength="30" class="form-control" value="${type.tenantName}" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" placeholder="Fill" id="tenantName"  name="tenantName" readonly class="form-control" value="${type.date}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>

                                                        <input name="tenantName" id="tenantName"  maxlength="30" ${mand_status_1} type="text" placeholder="Fill"  class="form-control complaintdate" value="${type.tenantName}" > 
                                                        <input name="complaintCode" type="hidden" value="${type.complaintCode}">

                                                    </c:otherwise>        
                                                </c:choose>
                                                        
                                                <label class="control-label">Complaint Date <c:if test="${mand_status_1 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                    </label>
                                                </c:if>
                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_8 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating">
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(complaintList) > 0}">
                                                        <c:forEach items="${complaintList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input name="complaintType" id="complaintType"   type="text" placeholder="Fill" maxlength="30" class="form-control" ${mand_status_8} value="${type.complaintType}" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" placeholder="Fill" id="complaintType"  name="complaintType" readonly class="form-control" value="${type.complaintType}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <select class="form-select" placeholder="Fill"  id="complaintType" required name="complaintType" value="${type.complaintType}" >
                                                            <option value="" disabled selected>Select your option</option>
                                                            <c:forEach items="${complaintType}" var="list">
                                                                <option>${list}</option>                                     
                                                            </c:forEach>
                                                        </select>

                                                    </c:otherwise>        
                                                </c:choose>
                                                                    <label class="control-label">${field_8} <a class="text-danger">*</a></label>
                                            </div>
                                        </c:if>
                                         <c:if test="${fieldStatus_2 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating  mb-3">
                                               
                                                <!--<a style="font-size: 15px;margin-top:-21px;color:transparent;font-weight: bold;">*</a>-->
                                               

                                                <c:choose>
                                                    <c:when test="${fn:length(complaintList) > 0}">
                                                        <c:forEach items="${complaintList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                     <input type="text" placeholder="Fill"  ${mand_status_2} class="form-control validate[required]"  readonly value="${assetName1}">
                                                                     <input type="hidden" id="firstName" name="propertyName" ${mand_status_2} class="form-control validate[required]"  readonly value="${type.assetName}">

                                                                    <input name="sno" type="hidden" value="${type.sno}">
                                                                    <input name="complaintCode" type="hidden" value="${type.complaintCode}">

                                                                </c:when>
                                                                <c:otherwise>
                                                                      <input type="text" placeholder="Fill" id="propertyName"  name="propertyName" readonly class="form-control" value="${type.assetName}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" readonly id="assetName1" name="assetName1"   ${mand_status_2} class="form-control " placeholder="Fill"  value="" onclick="return selectEmpDetails(event);">
<!--                                                       <input type="hidden" id="propertyName" name="propertyName"   ${mand_status_2} class="form-control " value="">-->

                                                    </c:otherwise>        
                                                </c:choose>
                                                         <label class="control-label">${field_2} <a class="text-danger">*</a></label>
                                            </div>
                                        </c:if>
                                          <c:if test="${fieldStatus_2 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-check mb-3">
                                               
                                                <!--<a style="font-size: 15px;margin-top:-21px;color:transparent;font-weight: bold;">*</a>-->
                                                

                                                <c:choose>
                                                    <c:when test="${fn:length(complaintList) > 0}">
                                                        <c:forEach items="${complaintList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
<!--                                                                     <input type="text" placeholder="Fill"  ${mand_status_2} class="form-control validate[required]"  readonly value="${assetName1}">-->
                                                                    <input type="checkbox" placeholder="Fill" id="maintenanceCheck" name="assetName1" value="">
                                                                     <input type="hidden" id="firstName" name="propertyName" ${mand_status_2} class="form-control validate[required]"  readonly value="${type.assetName}">

                                                                    <input name="sno" type="hidden" value="${type.sno}">
                                                                    <input name="complaintCode" type="hidden" value="${type.complaintCode}">

                                                                </c:when>
                                                                <c:otherwise>
<!--                                                                     <input type="text" id="propertyName"  name="propertyName" readonly class="form-control" value="${assetName1}">-->
                                                                        <input type="checkbox" disabled id="maintenanceCheck" name="assetName1" value="">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                         <input type="checkbox" placeholder="Fill" id="maintenanceCheck" name="assetName1" >
                                                    </c:otherwise>        
                                                </c:choose>
                                                        <label class="form-check-label">Is Complaint Related To Maintenance?</label>
                                            </div>
                                        </c:if>
                                           <c:if test="${fieldStatus_1 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating servRequestFild  mb-3">
                                               
                                               
                                                <c:choose>
                                                    <c:when test="${fn:length(complaintList) > 0}">
                                                        <c:forEach items="${complaintList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input name="tenantName" id="serviceReqNo"  ${mand_status_1} type="text" placeholder="Fill" maxlength="30" class="form-control" value="${type.tenantName}" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" placeholder="Fill" id="serviceReqNo"  name="tenantName" readonly class="form-control" value="${type.tenantName}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>

                                                        <input name="tenantName" required id="serviceReqNo"  maxlength="30" ${mand_status_1} type="text" placeholder="Fill"  class="form-control "  value="" > 
                                                        <input name="complaintCode" type="hidden" value="">

                                                    </c:otherwise>        
                                                </c:choose>
                                                         <label class="control-label">Service Request No</label>
                                            </div>
                                        </c:if>
                                                              <c:if test="${fieldStatus_1 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">
                                               
                                               
                                                <c:choose>
                                                    <c:when test="${fn:length(complaintList) > 0}">
                                                        <c:forEach items="${complaintList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input name="tenantName" id="tenantName"  ${mand_status_1} type="text" placeholder="Fill" maxlength="30" class="form-control" value="${type.tenantName}" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" placeholder="Fill" id="tenantName"  name="tenantName" readonly class="form-control" value="${type.tenantName}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>

                                                        <input name="tenantName" id="tenantName"  maxlength="30" ${mand_status_1} type="text" placeholder="Fill"  class="form-control "  value="" > 
                                                        <input name="complaintCode" type="hidden" value="">

                                                    </c:otherwise>        
                                                </c:choose>
                                                         <label class="control-label">Asset/Service Name <a class="text-danger">*</a></label>
                                            </div>
                                        </c:if>
                                           <c:if test="${fieldStatus_1 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">
                                                
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(complaintList) > 0}">
                                                        <c:forEach items="${complaintList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input name="tenantName" id="serviceName"  ${mand_status_1} type="text" placeholder="Fill" maxlength="30" class="form-control" value="${type.tenantName}" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" placeholder="Fill" id="serviceName"  name="tenantName" readonly class="form-control" value="${type.attribute1}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>

                                                        <input name="tenantName" id="serviceName"  maxlength="30" ${mand_status_1} type="text" placeholder="Fill"  class="form-control "  value="" > 
                                                        <input name="complaintCode" type="hidden" value="">

                                                    </c:otherwise>        
                                                </c:choose>
                                                        <label class="control-label">Service Area <a class="text-danger">*</a> </label>
                                            </div>
                                        </c:if>                   
                                        
                                        <c:if test="${fieldStatus_1 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating">
                                               
                                               
                                                <c:choose>
                                                    <c:when test="${fn:length(complaintList) > 0}">
                                                        <c:forEach items="${complaintList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input name="tenantName" id="tenantName"  ${mand_status_1} type="text" placeholder="Fill" maxlength="30" class="form-control" value="${type.tenantName}" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" placeholder="Fill" id="tenantName"  name="tenantName" readonly class="form-control" value="${type.tenantName}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>

                                                        <input name="tenantName" id="tenantName"  maxlength="30" ${mand_status_1} type="text" placeholder="Fill"  class="form-control "  value="" > 
                                                        <input name="complaintCode" type="hidden" value="">

                                                    </c:otherwise>        
                                                </c:choose>
                                                         <label class="control-label">Complaint Description <a class="text-danger">*</a> </label>
                                            </div>
                                        </c:if>      
                                                             <c:if test="${fieldStatus_1 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating">
                                               
                                               
                                                <c:choose>
                                                    <c:when test="${fn:length(complaintList) > 0}">
                                                        <c:forEach items="${complaintList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input name="tenantName" id="tenantName"  ${mand_status_1} type="text" placeholder="Fill" maxlength="30" class="form-control" value="${type.tenantName}" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" placeholder="Fill" id="tenantName"  name="tenantName" readonly class="form-control" value="${type.tenantName}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>

<!--                                                        <input name="tenantName" id="tenantName"  maxlength="30" ${mand_status_1} type="text" placeholder="Fill" class="form-control "  value="" > -->
                                                        <select required="" class="form-select" id="" name="">
                                                            <option value="" disabled="" selected="">Select an option</option>
                                                            <option>Critical</option>
                                                            <option>High</option>
                                                            <option>Medium</option>
                                                            <option>Low</option>
                                                        </select>

                                                    </c:otherwise>        
                                                </c:choose>
                                                         <label class="control-label">Priority <a class="text-danger">*</a></label>
                                            </div>
                                        </c:if>
                                        
                                        <c:if test="${fieldStatus_3 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating  mb-3">
                                                
                                                

                                                <c:choose>
                                                    <c:when test="${fn:length(complaintList) > 0}">
                                                        <c:forEach items="${complaintList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" placeholder="Fill"  ${mand_status_3} class="form-control validate[required]"  readonly value="${subAssetName1}" onkeypress="return isNumberKey(event);">
                                                                    <input type="hidden" id="propertyNo" name="propertyNo" ${mand_status_3} class="form-control validate[required]"  readonly value="${type.assetNo}">

                                                                    <input name="sno" type="hidden" value="${type.sno}">
                                                                    <input name="status" type="hidden" value="${type.status}">

                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" placeholder="Fill" id="propertyNo"  name="propertyNo" readonly class="form-control" value="${subAssetName1}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" placeholder="Fill" id="subAssetName1" name="subAssetName1"   ${mand_status_3}  class="form-control " value="" onkeypress="return isNumberKey(event);">
<!--                                                        <input type="hidden" id="propertyNo" name="propertyNo"   ${mand_status_3}  class="form-control " value="">-->

                                                    </c:otherwise>        
                                                </c:choose>
                                                        <label class="control-label">Unit Number</label>
                                            </div>
                                        </c:if>                                   
                                        
                                        <c:if test="${fieldStatus_1 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating">
                                               
                                               
                                                <c:choose>
                                                    <c:when test="${fn:length(complaintList) > 0}">
                                                        <c:forEach items="${complaintList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input name="tenantName" id="tenantName"  ${mand_status_1} type="text" placeholder="Fill" maxlength="30" class="form-control" value="${type.tenantName}" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" placeholder="Fill" id="tenantName"  name="tenantName" readonly class="form-control" value="${type.tenantName}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>

                                                        <input name="tenantName" id="tenantName"  maxlength="30" ${mand_status_1} type="text" placeholder="Fill" class="form-control "  value="" > 
                                                        <input name="complaintCode" type="hidden" value="">

                                                    </c:otherwise>        
                                                </c:choose>
                                                         <label class="control-label">Complaint Handled By <a class="text-danger">*</a></label>
                                            </div>
                                        </c:if>

                                        <c:if test="${fieldStatus_5 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">
                                               
                                               

                                                <c:choose>
                                                    <c:when test="${fn:length(complaintList) > 0}">
                                                        <c:forEach items="${complaintList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control " style="resize: none" ${mand_status_5} name="remarks"  id="remarks" type="text" placeholder="Fill" value="">${type.remarks}</textarea>
                                                                    <input id="remarks1" class="form-control" style="resize: none" type="hidden" value="${type.remarks}">

                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" style="resize: none"  maxlength="200" readonly rows="1" type="text" placeholder="Fill" value="">${type.remarks}</textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" class="form-control " style="resize: none" maxlength="200" rows="1" value=""  name="remarks" id="remarks" type="text" placeholder="Fill"></textarea>

                                                    </c:otherwise>        
                                                </c:choose>
                                                         <label class="control-label" style="margin-top: 0px;">${field_5}</label>
                                            </div>
                                        </c:if>
                                        
                                       <c:if test="${fieldStatus_1 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating">
                                               
                                               
                                                <c:choose>
                                                    <c:when test="${fn:length(complaintList) > 0}">
                                                        <c:forEach items="${complaintList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input name="tenantName" id="tenantName"  ${mand_status_1} type="text" placeholder="Fill" maxlength="30" class="form-control" value="${type.tenantName}" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" placeholder="Fill" id="tenantName"  name="tenantName" readonly class="form-control" value="${type.tenantName}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>

                                                        <input name="tenantName" id="tenantName"  maxlength="30" ${mand_status_1} type="text" placeholder="Fill" class="form-control "  value="" > 
                                                        <input name="complaintCode" type="hidden" value="">

                                                    </c:otherwise>        
                                                </c:choose>
                                                         <label class="control-label">Approximate Resolution Time <a class="text-danger">*</a></label>
                                            </div>
                                        </c:if>
                                 </form>

                                </div> 


                                
                                <!--                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating">
                                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                                                    <button type="submit" class="btn btn-primary" style="padding-right: 30px;padding-left: 30px;" > Save </button>
                                                                    <a href="../CRM/complaintList.jsp"  class="btn btn-primary"  style="padding-right: 30px;padding-left: 30px;">Cancel</a>
                                                                </div>
                                                            </div>-->
                                <%--<c:if test="${action ne 'view' && action ne 'edit' }">--%>
                                     <c:if test="${action ne 'view'}">
                                    <div class="col-md-9 col-sm-9 col-xs-12 m-3">
                                        <!--<button type="submit" class="btn btn-primary" style=""> Resolving Authority </button>-->
                                        <button type="submit" class="btn btn-primary"> Save </button>
                                        <a href="../CRM/complaintList.htm"  class="btn btn-danger"  style="">Cancel</a>
                                    </div>
                                </c:if>

                                <%--<c:if test="${action eq 'edit'  }">--%>
                                 <c:if test="${action eq 'view'  }">
                                    <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5 my-3" >
                                        <!--<button type="button" class="btn btn-primary" style="margin-left: 20px;" onclick="return test();">Save</button>-->
                                        <a href="../CRM/complaintList.htm" class="btn btn-danger" style="margin-left: 20px;">Cancel</a>
                                    </div>

                                </c:if>

                                <!--</form>-->

                             </div>
                                       
                               
                                        </div>

                                    </div>
                                <!--</div>-->
                            </section>

                        </main><!-- End #main -->
        <script>
            $(document).ready(function () {
                 var chkbox = $("#maintenanceCheck").prop('checked');
                    
                    if(chkbox == true){
                        $(".servRequestFild").show();
                    } else {
                        $(".servRequestFild").hide();
                    }
                $("#maintenanceCheck").change(function(event){
                     var chkbox = $("#maintenanceCheck").prop('checked');
                    
                    if(chkbox == true){
                        $(".servRequestFild").show();
                    } else {
                        $(".servRequestFild").hide();
                    }
                })
//                $("#complaintForm").validationEngine();
                
            });
  $(".complaintdate")
        .datepicker({
            format: "dd-mm-yyyy",
            startDate: "0m +0m",
            autoclose: true,
            todayHighlight: true,
            container: ".complaintdate1",
        })
        .datepicker("update", new Date());
        </script>

    </body>

</html>
