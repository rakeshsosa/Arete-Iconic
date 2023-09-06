<%-- 
    Document   : campaignMedia
    Created on : 30 Aug, 2016, 12:22:52 PM
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
        <script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>
        <title>arête Assets Management</title>
        <script type="text/javascript">



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
            function uniqueMediaCompany() {
                var campMediaName = document.getElementById("campaignMediaName").value;
                $.ajax({
                    type: "POST",
                    url: '../Master/mediaNameValidation.htm',
                    data: {
                        campMediaName: campMediaName,
                    },
                    success: function (data) {
                        if ($.trim(data) == 'Data Already Exists') {
                            alert("MediaName Is  Already Exist.");
                            document.getElementById("campaignMediaName").value = "";
                            return false;
                        }
                    }
                });
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
                                <jsp:include page="../login/headerlink.htm?submodule=Campaign Media&tab=Campaign Media&pagetype=form"/>
                                <div class="x_title">
                                    <h2>Campaign Media Details  </h2>

                                    </li>

                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />



                                    <form class="form-inline" id="complaintForm" accept-charset="UTF-8" method="post" action="../Master/campaignMediaSubmit.htm" enctype="multipart/form-data" >
                                        <c:forEach items="${test}" var="list">
                                            <c:if test="${list[0] eq '5'}">
                                                <c:set value="${list[1]}" var="field_1"/>
                                                <c:set value="${list[2]}" var="fieldStatus_1"/>
                                                <c:set value="${list[3]}" var="mand_status_1"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '6'}">
                                                <c:set value="${list[1]}" var="field_2"/>
                                                <c:set value="${list[2]}" var="fieldStatus_2"/>
                                                <c:set value="${list[3]}" var="mand_status_2"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '3'}">
                                                <c:set value="${list[1]}" var="field_3"/>
                                                <c:set value="${list[2]}" var="fieldStatus_3"/>
                                            </c:if>


                                        </c:forEach>
                                        <c:if test="${fieldStatus_1 eq 'y'}">
                                            <div class="col-md-4 form-floating">
                                               
                                                <c:choose>
                                                    <c:when test="${fn:length(campaignMediaList) > 0}">
                                                        <c:forEach items="${campaignMediaList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="campaignMediaName" name="campaignMediaName"  maxlength="30" class="form-control" ${mand_status_1} value="${type.mediaName}" autocomplete="off" onchange="uniqueMediaName();">
                                                                    <input name="sno" type="hidden" value="${type.sno}">
                                                                    <input name="status" type="hidden" value="${type.status}">
                                                                    <input name="mediaCode" type="hidden" value="${type.mediaCode}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="campaignMediaName"  name="campaignMediaName" class="form-control"  readonly value="${type.mediaName}">
                                                                </c:otherwise> 
                                                            </c:choose>

                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input name="mediaCode" type="hidden" value="">
                                                        <input type="text" id="campaignMediaName" name="campaignMediaName" placeholder="Fill" maxlength="30" value="" class="form-control"  ${mand_status_1} mand_status_1 autocomplete="off"  onchange="uniqueMediaCompany();">
                                                    </c:otherwise>        
                                                </c:choose>
                                                <label class="control-label">${field_1} <c:if test="${mand_status_1 eq 'required'}">
                                                    <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                                </c:if>
												</label>
                                            </div>
                                        </c:if>
										
                                        <c:if test="${fieldStatus_2 eq 'y'}">
                                            <div class="col-md-4 form-floating">
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(campaignMediaList) > 0}">
                                                        <c:forEach items="${campaignMediaList}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <textarea class="form-control "  ${mand_status_2} style="resize: none" maxlength="200" name="campaignMediaDesc"  id="campaignMediaDesc" type="text" value="${type.mediaDesc}" >${type.mediaDesc}</textarea>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <textarea class="form-control" style="resize: none"  maxlength="200" readonly type="text" value="${type.mediaDesc}">${type.mediaDesc}</textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <textarea class="form-control "  ${mand_status_2} style="resize: none" placeholder="Fill" value="" maxlength="200" name="campaignMediaDesc" id="campaignMediaDesc" type="text"></textarea>

                                                    </c:otherwise>        
                                                </c:choose>
												<label class="control-label"> ${field_1}
												<c:if test="${mand_status_2 eq 'required'}">
                                                    <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                                </c:if>
												</label>
                                            </div>
                                        </c:if>
                                       
                                </div> 


                                <p>&nbsp;</p> 
                                <c:if test="${action ne 'view'}">
                                    <div class="form-actions" >
                                        <!--<button type="submit" class="btn btn-primary" style=""> Resolving Authority </button>-->
                                        <button type="submit" class="btn btn-primary" style=""> Save </button>
                                        <a href="../Master/campaignMediaList.htm"  class="btn btn-danger"  style="">Cancel</a>
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
