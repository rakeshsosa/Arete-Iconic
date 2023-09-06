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
            function uniqueMediaName() {
                var campMediaName = document.getElementById("campaignMediaName").value;
                $.ajax({
                    type: "POST",
                    url: '../Lead/getCompanyName.htm',
                    data: {
                        campMediaName: campMediaName,
                    },
                    success: function (data) {
                        if ($.trim(data) == 'Already Exists.') {
                            alert("Company Is  Already Exist");
                            document.getElementById("campMediaName").value = "";
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



                                    <form class="row" id="complaintForm" accept-charset="UTF-8" method="post" action="../Master/campaignMediaSubmit.htm" enctype="multipart/form-data" >

                                        <div class="col-md-4 form-floating">
                                            <label class="control-label"><span style="color:red">*</span>Campaign Media Name </label>

                                            <c:choose>
                                                <c:when test="${fn:length(leadmanagmentList) > 0}">
                                                    <c:forEach items="${leadmanagmentList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="campaignMediaName" name="campaignMediaName"  maxlength="30" class="form-control" value="${type.lastName}" autocomplete="off" onkeyup="uniqueMediaName();">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="campaignMediaName"  name="campaignMediaName" class="form-control"  readonly value="${type.lastName}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" id="campaignMediaName" name="campaignMediaName" maxlength="30" value="" class="form-control validate[contactPerson]" autocomplete="off" onkeyup="uniqueMediaName();" onchange="uniqueMediaCompany();">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>

                                        <div class="col-md-4 form-floating">
                                            
                                            <c:choose>
                                                <c:when test="${fn:length(complaintList) > 0}">
                                                    <c:forEach items="${complaintList}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <textarea class="form-control" style="resize: none" maxlength="200" name="campaignMediaDesc"  id="campaignMediaDesc" type="text" value="${type.compensation}" >${type.compensation} </textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea class="form-control" style="resize: none"  maxlength="200" readonly type="text" value="${type.compensation}">${type.compensation}</textarea>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <textarea class="form-control" style="resize: none" value="" maxlength="200" name="campaignMediaDesc" placeholder="Fill" id="campaignMediaDesc" type="text"></textarea>

                                                </c:otherwise>        
                                            </c:choose>
											<label class="control-label">Campaign Description </label>
                                        </div>
                                       
                                </div> 


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
