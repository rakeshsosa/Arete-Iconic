<%-- 
    Document   : followUpForm
    Created on : 29 Sep, 2016, 3:54:04 PM
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
        <link rel="stylesheet" href="../common/validate/validationEngine.css" type="text/css">
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript" charset="utf-8"></script>
        <script src="../common/validate/jquery.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript" src="../common/csspopup.js"></script>
        <script type="text/javascript" src="../common/datepicker/datetimepicker_css_2.js"></script>
        <link href="../common/theme/css/disableSelection.css" rel="stylesheet" type="text/css"/>

        <title>arête Assets Management</title>
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


            function isNumberKey(evt)
            {
                var charCode = (evt.which) ? evt.which : event.keyCode
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                {
                    alert("Please Enter Numeric value");
                    return false;
                }
                return true;
            }


            function selectTenantName() {

                myWindow = window.open("../CRM/selectTenantName.htm", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function selectPropertyName()
            {
                myWindow = window.open("../CRM/selectPropertyName.htm", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
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
                                <jsp:include page="../login/headerlink.htm?submodule=Lead Management&tab=Follow Up Details&pagetype=form"/>
                                <div class="x_title">
                                    <h2>FollowUp Details  </h2>

                                    </li>

                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />



                                    <form class="form-inline" id="complaintForm" accept-charset="UTF-8" method="post" action="../Lead/followUpFormSubmit.htm" enctype="multipart/form-data" >



                                        <c:forEach items="${FollowUpDate}" var="list">
                                            <c:if test="${list[0] eq '285'}">
                                                <c:set value="${list[1]}" var="name1"/>
                                                <c:set value="${list[2]}" var="status1"/>
                                                <c:set value="${list[3]}" var="mand_status_1"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '286'}">
                                                <c:set value="${list[1]}" var="name2"/>
                                                <c:set value="${list[2]}" var="status2"/>
                                                <c:set value="${list[3]}" var="mand_status_2"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '287'}">
                                                <c:set value="${list[1]}" var="name3"/>
                                                <c:set value="${list[2]}" var="status3"/>
                                                <c:set value="${list[3]}" var="mand_status_3"/>

                                            </c:if>
                                            <c:if test="${list[0] eq '288'}">
                                                <c:set value="${list[1]}" var="name4"/>
                                                <c:set value="${list[2]}" var="status4"/>
                                                <c:set value="${list[3]}" var="mand_status_4"/>

                                            </c:if>
                                            <c:if test="${list[0] eq '289'}">
                                                <c:set value="${list[1]}" var="name5"/>
                                                <c:set value="${list[2]}" var="status5"/>
                                                <c:set value="${list[3]}" var="mand_status_5"/>

                                            </c:if>
                                            <c:if test="${list[0] eq '35'}">
                                                <c:set value="${list[1]}" var="name6"/>
                                                <c:set value="${list[2]}" var="status6"/>
                                                <c:set value="${list[3]}" var="mand_status_6"/>

                                            </c:if>
                                            <c:if test="${list[0] eq '581'}">
                                                <c:set value="${list[1]}" var="name7"/>
                                                <c:set value="${list[2]}" var="status7"/>
                                                <c:set value="${list[3]}" var="mand_status_7"/>

                                            </c:if>



                                        </c:forEach>
                                        <%--<c:if test="${mand_status_1 eq 'required'}">
                                           <a class="control-label-required" style="color:red;">*</a>
                                        </c:if>
                                        <c:if test="${fieldStatus_1 eq 'y'}">--%>

                                        <c:if test="${status1 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_1 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                &nbsp;   <label class="control-label">${name1}</label>
                                                <c:forEach items="${fetchFolloeUpHistory}" var="type">
                                                    <input name="leadCode" id="leadCode" type="hidden" value="${type.leadCode}">
                                                    <input name="leadName" id="leadName"  maxlength="30" type="text" readonly="" class="form-control" ${mand_status_1} placeholder=""  value="${type.leadName}" > 

                                                </c:forEach>

                                            </div>
                                        </c:if>
                                        <c:if test="${status2 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_2 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${name2}</label>
                                                <c:forEach items="${fetchFolloeUpHistory}" var="type">
                                                    <!--onclick="selectPropertyName();"-->
                                                    <input name="assetCode" id="assetCode" type="hidden" value="${type.assetCode}">
                                                    <input type="text" id="assetName" name="assetName" style="text-transform: capitalize;"  readonly=""  ${mand_status_2} class="form-control " placeholder="" value="${type.assetName}"  >
                                                </c:forEach>

                                            </div>
                                        </c:if>
                                        <c:if test="${status3 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_3 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>

                                                <label class="control-label">${name3}</label>
                                                <c:forEach items="${fetchFolloeUpHistory}" var="type">
                                                    <input type="text" id="contactName" name="contactName" ${mand_status_3}  style="text-transform: capitalize;"  readonly=""   class="form-control "  value="${type.firstName}">

                                                </c:forEach>
                                            </div>
                                        </c:if>


                                        <p>&nbsp;</p>
                                        <div class="x_title">


                                            </li>

                                            </ul>
                                            <div class="clearfix"></div>
                                        </div>
                                        <p>&nbsp;</p>
                                        <c:if test="${status7 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_7 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${name7}</label>
                                                <c:forEach items="${fetchFolloeUpHistory}" var="type">
                                                    <!--onclick="selectPropertyName();"-->
                                                    <input name="assetCode" id="assetCode" type="hidden" value="${type.assetCode}">
                                                    <input type="text" id="salesPersonName" name="salesPersonName"  style="text-transform: capitalize;"  ${mand_status_7} class="form-control " placeholder="Enter Sales Person Name" value=""  >
                                                </c:forEach>

                                            </div>
                                        </c:if>

                                        <c:if test="${status4 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_4 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${name4}
                                                </label>
                                                <input type="text" id="followUpDate" name="followUpDate" readonly=""  style="cursor: pointer;" value="" placeholder="Select Date" class="form-control" onclick="javascript:NewCssCal('followUpDate', 'ddMMMyyyy', '', '', '', '', '')" >
                                            </div>
                                        </c:if>



                                        <c:if test="${status5 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_5 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label" style="margin-top:-20px;">${name5}
                                                </label>
                                                <textarea class="form-control" rows="1" style="resize: none" maxlength="200" value="" autocomplete="off" name="followUpRemarks" id="followUpRemarks" type="text"></textarea>
                                            </div>
                                        </c:if>







                                        <div class="clearfix"></div>
                                </div> 


                                <p>&nbsp;</p> 

                                <c:if test="${action ne 'view'}">
                                    <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                        <!--<button type="submit" class="btn btn-primary" style=""> Resolving Authority </button>-->
                                        <button type="submit" class="btn btn-primary" style=""> Save </button>
                                        <a href="../Lead/followUpList.htm"  class="btn btn-danger"  style="">Cancel</a>
                                    </div>
                                </c:if>

                                </form>

                            </div>
                        </div>
                    </div>

                    <div class="clearfix"></div>

                    <br/>


                    <div class="clearfix"></div>

                    <div class="clearfix"></div>                

                    <!-- /page content -->

                </div>

            </div>
        </div>

        <div id="custom_notifications" class="custom-notifications dsp_none">
            <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-inline">
            </ul>
            <div class="clearfix"></div>
            <div id="notif-inline" class="tabbed_notifications"></div>
        </div>
        <script>
            $(document).ready(function () {
                $("#complaintForm").validationEngine();

            });
            NProgress.done();
        </script>

    </body>

</html>
