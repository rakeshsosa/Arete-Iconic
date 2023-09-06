<%-- 
    Document   : customerfeedbackForm
    Created on : 9 Mar, 2016, 5:49:50 PM
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
        <link href="../common/validate/validationEngine.css" rel="stylesheet" type="text/css"/>
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.min.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.js" type="text/javascript"></script>
        <script src="../common/datepicker/datetimepicker_css.js" type="text/javascript"></script>
        <title>arête Assets Management</title>
        <script type="text/javascript">
            jQuery(document).ready(function () {

                jQuery("#customerfeedbackForm").validationEngine();


            });
            $(document).ready(function () {
                $("#txtDate1").datepicker();
                $('#workYear').datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: ' yy',
                    onClose: function () {
                        var iMonth = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
                        var iYear = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
                        $(this).datepicker('setDate', new Date(iYear, iMonth, 1));
                        $(this).datepicker('refresh');
                    },
                    beforeShow: function () {
                        if ((selDate = $(this).val()).length > 0) {
                            iYear = selDate.substring(selDate.length - 4, selDate.length);
                            iMonth = jQuery.inArray(selDate.substring(0, selDate.length - 5), $(this).datepicker('option', 'monthNames'));
                            $(this).datepicker('option', 'defaultDate', new Date(iYear, iMonth, 1));
                            $(this).datepicker('setDate', new Date(iYear, iMonth, 1));
                        }
                    }
                });

                $("#workYear").focus(function () {
                    $(".ui-datepicker-calendar").hide();
                    $("#ui-datepicker-div").position({
                        my: "center top",
                        at: "center bottom",
                        of: $(this)
                    });
                });

                $("#workYear").blur(function () {
                    $(".ui-datepicker-calendar").hide();
                });
            });



            function selectsalesorderNo() {
                var division = document.getElementById("division").value;
                if (division === '') {
                    alert("Please Select The Division");
                    return false;
                }
                else {
                    myWindow = window.open("../CRM/selectsalesorderNo.htm?division=" + division, "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                }
            }

            function selectemployeedetails()
            {
                var division = document.getElementById("division").value;


                if (division === '')
                {
                    alert("Please Select Division");
                    return false;
                }
                else {

                    myWindow = window.open("../CRM/selectEventOrganizer.htm?division=" + division, "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                }

            }

            function selectTenantDetails()
            {
                myWindow = window.open("../CRM/tenantDetailsForCustomerFeedback.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
        </script>
        <script>

            function mandTest() {
//                var llM = document.getElementById("llId").value;tenantName/feedbackDate/workYear/column4

                var tenantM = document.getElementById("tenantName").value &&
                        document.getElementById("feedbackDate").value &&
                        document.getElementById("workYear").value &&
                        document.getElementById("column1").value &&
                        document.getElementById("column2").value &&
                        document.getElementById("column3").value &&
                        document.getElementById("column4").value;


                if (tenantM == '')
                {

                    alert("Please Fill Mandatory Fields.");

                    $('#tenantName').focus();
                    $('#feedbackDate').focus();
                    $('#workYear').focus();
                    $('#column1').focus();
                    $('#column2').focus();
                    $('#column3').focus();
                    $('#column4').focus();
                    return false;
                }

                else {
                    document.forms["customerfeedbackForm"].submit();
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

                        <div class="page-title">

                        </div>
                        <div class="clearfix"></div>





                        <div class="col-md-6 col-xs-12">
                            <div class="x_panel">
                                <jsp:include page="../login/headerlink.htm?submodule=Customer Feedback&tab=Customer Feedback&pagetype=form"/>
                                <div class="x_title">
                                    <h2>Customer Feedback </h2>

                                    </li>

                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />
                                    <c:forEach items="${complaintFormData}" var="list">
                                        <c:if test="${list[0] eq '303'}">
                                            <c:set value="${list[1]}" var="field_1"/>
                                            <c:set value="${list[2]}" var="fieldStatus_1"/>
                                            <c:set value="${list[3]}" var="mand_status_1"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '304'}">
                                            <c:set value="${list[1]}" var="field_2"/>
                                            <c:set value="${list[2]}" var="fieldStatus_2"/>
                                            <c:set value="${list[3]}" var="mand_status_2"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '305'}">
                                            <c:set value="${list[1]}" var="field_3"/>
                                            <c:set value="${list[2]}" var="fieldStatus_3"/>
                                            <c:set value="${list[3]}" var="mand_status_3"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '306'}">
                                            <c:set value="${list[1]}" var="field_4"/>
                                            <c:set value="${list[2]}" var="fieldStatus_4"/>
                                            <c:set value="${list[3]}" var="mand_status_4"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '307'}">
                                            <c:set value="${list[1]}" var="field_5"/>
                                            <c:set value="${list[2]}" var="fieldStatus_5"/>
                                            <c:set value="${list[3]}" var="mand_status_5"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '308'}">
                                            <c:set value="${list[1]}" var="field_6"/>
                                            <c:set value="${list[2]}" var="fieldStatus_6"/>
                                            <c:set value="${list[3]}" var="mand_status_6"/>
                                        </c:if>
                                    </c:forEach>
                                    <c:forEach items="${customerfeedbackList}" var="type">
                                        <c:forEach items="${assetDetails}" var="asset">
                                            <c:if test="${asset.assetCode eq type.assetName}">
                                                <c:set var="assetName" value="${asset.assetName}"/>

                                            </c:if> 
                                        </c:forEach>
                                        <c:forEach items="${subAssetDetails}" var="subasset">
                                            <c:if test="${subasset.subAssetCode eq type.assetNo}">
                                                <c:set var="subAssetName" value="${subasset.subAssetName}"/>

                                            </c:if> 
                                        </c:forEach>

                                    </c:forEach>


                                    <form class="form-inline" id="customerfeedbackForm" accept-charset="UTF-8" method="post" action="../CRM/customerfeedbackFormSubmit.htm" >

                                        <c:if test="${fieldStatus_1 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_1 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_1}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(customerfeedbackList) > 0}">
                                                        <c:forEach items="${customerfeedbackList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input name="tenantName" id="tenantName" readonly="" type="text" maxlength="30" class="form-control" value="${type.tenantName}" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="tenantName"  name="tenantName" readonly class="form-control" value="${type.tenantName}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input name="tenantName" id="tenantName"  maxlength="30" type="text" readonly="" class="form-control "placeholder="Select Tenant Name"  value="" onclick="selectTenantDetails();"> 
                                                        <input name="custometFbCode" type="hidden" value="">
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
                                                    <c:when test="${fn:length(customerfeedbackList) > 0}">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="assetName" name="assetName" class="form-control validate[required]"  readonly value="${assetName}">

                                                                <input name="sno" type="hidden" value="${type.sno}">
                                                                <input name="status" type="hidden" value="${type.status}">

                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="assetName"  name="assetName" readonly class="form-control" value="${assetName}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" id="assetName1" name="assetName1"  readonly=""  class="form-control " placeholder="" onclick="selectcust();" value="">
                                                        <input type="hidden" id="assetName" name="assetName"  readonly=""  class="form-control "  value="">

                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                        </c:if>

                                        <c:if test="${fieldStatus_3 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_ eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_3}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(customerfeedbackList) > 0}">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="assetNo" name="assetNo" class="form-control validate[required]"  readonly value="${subAssetName}">

                                                                <input name="sno" type="hidden" value="${type.sno}">
                                                                <input name="status" type="hidden" value="${type.status}">

                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="assetNo"  name="assetNo" readonly class="form-control" value="${subAssetName}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" id="subAssetName" name="subAssetName"  readonly=""  class="form-control " onclick="selectcust();" placeholder="" value="">
                                                        <input type="hidden" id="assetNo" name="assetNo"  readonly=""  class="form-control" value="" >

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
                                                    <c:when test="${fn:length(customerfeedbackList) > 0}">
                                                        <c:forEach items="${customerfeedbackList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="feedbackDate" name="feedbackDate" onmouseover="" style="cursor: pointer;" placeholder="" readonly class="form-control validate[required]" onclick="javascript:NewCssCal('feedbackDate', 'ddMMMyyyy')" value="<fmt:formatDate pattern="dd-MMM-yyyy"  value="${type.date}"/>">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="feedbackDate" name="feedbackDate" onmouseover="" style="cursor: pointer;" placeholder="" class="form-control" readonly value="<fmt:formatDate pattern="dd-MMM-yyyy"  value="${type.date}"/>">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach> 
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" id="feedbackDate" name="feedbackDate" onmouseover="" style="cursor: pointer;" readonly placeholder="Select Date" class="form-control " onclick="javascript:NewCssCal('feedbackDate', 'ddMMMyyyy', '', '', '', '', 'past')" >
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                        </c:if>
                                        <!--                                      gfhgfh <c:if test="${fieldStatus_5 eq 'y'}">
                                                                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_5 eq 'required'}">
                                               <a class="control-label-required" style="color:red;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_5}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(customerfeedbackList) > 0}">
                                                    <c:forEach items="${customerfeedbackList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="workYear" name="workYear" readonly  class="form-control" value="${type.year}"/>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="workYear" name="workYear" readonly="" class="form-control"  value="${type.year}"/>
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <select id="workYear" name="workYear" class="form-control" onclick="loadAgeSelector();" >
                                                    <option value="" disabled selected>Select your option</option>
                                                    <option value="" disabled selected></option>
                                                </select>
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>
                                        </c:if>hfghfh-->


                                        <p>&nbsp;</p>  
                                        <p>&nbsp;</p>  


                                        <div id="POItablediv" style="">

                                            <center>
                                                <table id="POITable"  id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                                    <!--                                                <table  border="1" style="width: 850px; height: 400px; text-align: center;">-->
                                                    <thead>
                                                        <tr>
                                                            <th style="border:1px solid black;">Sl No</td>
                                                            <th style="border:1px solid black;">Key Parameters</td>
                                                            <th style="border:1px solid black;"><span style="color:red">*</span> Remarks</td>
                                                        </tr>
                                                    </thead>

                                                    <tr>
                                                        <td style="text-align: right;">1</td>
                                                        <td style="text-align: left;">Property Allocation </td>
                                                        <td> 
                                                            <c:choose>
                                                                <c:when test="${fn:length(customerfeedbackList) > 0}">
                                                                    <c:forEach items="${customerfeedbackList}" var="type">

                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
                                                                                <input name="column1" class="form-control" type="text" readonly value="${type.propertyAllocation}">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input name="column1" style="width: 100%;" class="form-control" type="text" readonly value="${type.propertyAllocation}">
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>

                                                                    <select id="column1" required="" name="column1" class="form-control ">
                                                                        <option value="" disabled selected>Select your option</option>
                                                                        <option>Extremely satisfied</option>
                                                                        <option>Satisfied</option>
                                                                        <option>Average</option>
                                                                        <option>Dissatisfied</option>
                                                                        <option>Extremely Dissatisfied</option>
                                                                    </select>
                                                                </c:otherwise>

                                                            </c:choose>
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right;">2</td>
                                                        <td style="text-align: left;" >Service</td>
                                                        <td> 
                                                            <c:choose>
                                                                <c:when test="${fn:length(customerfeedbackList) > 0}">
                                                                    <c:forEach items="${customerfeedbackList}" var="type">

                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
                                                                                <input name="column2" id="column2" class="form-control" type="text" readonly value="${type.service}">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input name="column2" style="width: 100%;" class="form-control" type="text" readonly value="${type.service}">
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>

                                                                    <select id="column2" required="" name="column2" class="form-control " >
                                                                        <option value="" disabled selected>Select your option</option>
                                                                        <option>Extremely satisfied</option>
                                                                        <option>Satisfied</option>
                                                                        <option>Average</option>
                                                                        <option>Dissatisfied</option>
                                                                        <option>Extremely Dissatisfied</option>
                                                                    </select>
                                                                </c:otherwise>

                                                            </c:choose>
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right;">3</td>
                                                        <td style="text-align: left;">Utilities management</td>
                                                        <td> 
                                                            <c:choose>
                                                                <c:when test="${fn:length(customerfeedbackList) > 0}">
                                                                    <c:forEach items="${customerfeedbackList}" var="type">

                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
                                                                                <input name="column3" id="column3" class="form-control" type="text" readonly value="${type.utilitiesManagement}">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input name="column3" style="width: 100%;" class="form-control" type="text" readonly value="${type.utilitiesManagement}">
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>

                                                                    <select id="column3" required="" name="column3" class="form-control ">
                                                                        <option value="" disabled selected>Select your option</option>
                                                                        <option>Extremely satisfied</option>
                                                                        <option>Satisfied</option>
                                                                        <option>Average</option>
                                                                        <option>Dissatisfied</option>
                                                                        <option>Extremely Dissatisfied</option>
                                                                    </select>
                                                                </c:otherwise>

                                                            </c:choose>
                                                        </td>

                                                    </tr><tr>
                                                        <td style="text-align: right;">4</td>
                                                        <td style="text-align: left;">Support</td>
                                                        <td> 
                                                            <c:choose>
                                                                <c:when test="${fn:length(customerfeedbackList) > 0}">
                                                                    <c:forEach items="${customerfeedbackList}" var="type">

                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
                                                                                <input name="column4" id="column4" class="form-control" type="text" readonly value="${type.support}">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input name="column4" style="width: 100%;" class="form-control" type="text" readonly value="${type.support}">
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>

                                                                    <select id="column4" required="" name="column4" class="form-control ">
                                                                        <option value="" disabled selected>Select your option</option>
                                                                        <option>Extremely satisfied</option>
                                                                        <option>Satisfied</option>
                                                                        <option>Average</option>
                                                                        <option>Dissatisfied</option>
                                                                        <option>Extremely Dissatisfied</option>
                                                                    </select>
                                                                </c:otherwise>

                                                            </c:choose>
                                                        </td>
                                                    </tr>




                                                </table>
                                            </center>
                                        </div>
                                        <div class="clearfix"></div>
                                </div> 




                                <p>&nbsp;</p> 
                                <c:if test="${fieldStatus_6 eq 'y'}">
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                        <c:if test="${mand_status_6 eq 'required'}">
                                            <a class="control-label-required" style="color:red;">*</a>
                                        </c:if>
                                        <a style="font-size: 15px;margin-top:-21px;color:transparent;font-weight: bold;">*</a>
                                        <label class="control-label">${field_6}</label>
                                        <c:choose>
                                            <c:when test="${fn:length(customerfeedbackList) > 0}">
                                                <c:forEach items="${customerfeedbackList}" var="type">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <textarea class="form-control" style="resize: none" rows="1" maxlength="200" autocomplete="off" name="remarks"  id="remarks" type="text" value="${type.overalRemarks}" >${type.remarks} </textarea>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <textarea class="form-control" style="resize: none" rows="1" maxlength="200" readonly type="text" value="${type.overalRemarks}">${type.overalRemarks}</textarea>
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <textarea class="form-control" style="resize: none" maxlength="200" rows="1" value="" autocomplete="off" name="remarks" id="remarks" type="text"></textarea>



                                            </c:otherwise>        
                                        </c:choose>
                                    </div>
                                </c:if>
                                <p>&nbsp;</p> <p>&nbsp;</p>
                                

                                <c:if test="${action ne 'view'}">
                                    <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                        <button type="submit" class="btn btn-primary" style="" onclick="return mandTest();" > Save </button>
                                        <a href="../CRM/customerfeedbackList.htm"  class="btn btn-danger"  style="">Cancel</a>
                                    </div>
                                </c:if>

                                </form>

                            </div>
                        </div>
                    </div>

                    <div class="clearfix"></div>

                    <br/>



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
            $(document).ready(function () {
                $("#customerfeedbackForm").validationEngine();

            });

            NProgress.done();
        </script>
        <script>
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
        </script>

        <script src="general-crm_scripts.js" type="text/javascript"></script>
        <script src="mioinvoice-crm-scripts.js" type="text/javascript"></script>
    </body>

</html>
