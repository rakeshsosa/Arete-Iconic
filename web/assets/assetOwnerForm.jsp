<%-- 
    Document   : ssetOwnerForm
    Created on : 3 Oct, 2016, 10:50:13 AM
    Author     : Garun Mishra
--%>

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
        <meta charset="utf-29">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">         
        <script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>   
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

        <title>arête Assets Management</title>
    </head>
    <script>
        function formValidate() {
            var assetOwnerName = document.getElementById('assetOwnerName').value;
            //Ajax calling to check wether Owner Name Exist or not
            $.ajax({
                type: "POST",
                url: '../assetsm/assetOwnerCheck.htm',
                data: {
                    assetOwnerName: assetOwnerName
                },
                success: function (data) {
                    if (data !== "") {
                        alert('Asset Owner Type is already exist');
                        document.getElementById('assetOwnerName').value = '';
                        return false;
                    }
                }
            });
            return true;
        }
    </script>

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
                                <%--<jsp:include page="../login/assetdemolink.htm?submodule=Asset Details&tab=Fixed Assets Details&pagetype=form"/>  --%>

                                <jsp:include page="../login/headerlink.htm?submodule=Asset Details&tab=Asset Owner&pagetype=form"/>

                                <div class="x_title">
                                    <h2>Assets Owner's Details</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br/>
                                    <form id="userform" method="post" name="form" class="form-inline" action="../assetsm/assetOwnerFormSubmit.htm">
                                        <%-- Set the Attribute  --%>
                                        <c:forEach items="${asset_category}" var="list">
                                            <c:if test="${list[0] eq '423'}">
                                                <c:set value="${list[1]}" var="fieldname_1"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_1"/>
                                                <c:set value="${list[3]}" var="mand_status_1"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '424'}">
                                                <c:set value="${list[1]}" var="fieldname_2"/>   
                                                <c:set value="${list[2]}" var="fieldStatus_2"/>
                                                <c:set value="${list[3]}" var="mand_status_2"/>
                                            </c:if>                                                     
                                        </c:forEach>                                                  

                                        <c:if test="${fieldStatus_1 eq 'y'}"> 
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                <c:if test="${mand_status_1 eq 'required'}">
                                                    <a  class="control-label-required" style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label"  style="display: inline">${fieldname_1} </label>

                                                <c:choose>
                                                    <c:when test="${fn:length(assetsOwnerlist) > 0}">
                                                        <c:forEach items="${assetsOwnerlist}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" required="" id="assetOwnerName" name="assetOwnerName" value="${list.assetOwnerName}" onchange="formValidate();">
                                                                </c:when>
                                                                <c:otherwise>                                                                
                                                                    <input type="text" class="form-control" readonly="" value="${list.assetOwnerName}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" class="form-control" required="" id="assetOwnerName" name="assetOwnerName" autocomplete="off" onchange="formValidate();" >
                                                    </c:otherwise>        
                                                </c:choose>                                            
                                            </div> 
                                        </c:if>   

                                        <c:if test="${fieldStatus_2 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                <c:if test="${mand_status_2 eq 'required'}">
                                                    <a  class="control-label-required" style="color:red;">*</a>
                                                </c:if><a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label"  style="display: inline">${fieldname_2} </label>


                                                <c:choose>
                                                    <c:when test="${fn:length(assetsOwnerlist) > 0}">
                                                        <c:forEach items="${assetsOwnerlist}" var="list">
                                                            <c:choose> 
                                                                <c:when test="${action eq 'edit'}">
                                                                    <textarea class="form-control" name="assetOwnerDescription" id="assetOwnerDescription" rows="1" maxlength="300" style="resize: none">${list.assetOwnerDescription}</textarea>
                                                                    <input type="hidden" class="form-control" id="pk" name="pk" value="${list.SNo}" >
                                                                    <input type="hidden" class="form-control" id="created_user_dateTime" name="created_user_dateTime" value="<fmt:formatDate value="${list.createdDate}" pattern="dd-MMM-yyyy" /> " >
                                                                </c:when>
                                                                <c:otherwise>                                                                
                                                                    <textarea class="form-control" readonly="" rows="1" maxlength="300" style="resize: none">${list.assetOwnerDescription}</textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <textarea type="text" class="form-control"  id="assetOwnerDescription" name="assetOwnerDescription" autocomplete="off" rows="1" maxlength="300" style="resize: none"  type="text"></textarea>
                                                    </c:otherwise>        
                                                </c:choose>                                            
                                            </div> 
                                        </c:if>                                                 
                                        <%-- Keep Buttons here --%>  
                                        <br><br><br>
                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>  
                                        <p>&nbsp;</p> 
                                        <c:if test="${action ne 'view'}">

                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                <button type="submit" class="btn btn-primary">Save</button>                                                                                                                                       
                                                <a href="../assetsm/assetsOwnerList.htm"  class="btn btn-danger"  style="">Cancel</a>   
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
