<%-- 
    Document   : groupform
    Created on : Feb 24, 2016, 5:02:35 PM
    Author     : Sudhanshu
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

        <title>arête Assets Management</title>
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
                                <jsp:include page="../login/headerlink.htm?submodule=Organisation&tab=Organisation Group&pagetype=form"/>

                                <div class="x_title">
                                    <h2>Organisation Group</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />


                                    <form class="form-inline" action="../login/groupsubmit.htm">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label">*Group Code</label>
                                            <c:choose>
                                                <c:when test="${fn:length(grouplist) > 0}">
                                                    <c:forEach items="${grouplist}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="requiredAtLoc" class="form-control" required="" readonly="" name="groupCode" value="${list.groupCode}">
                                                                <input type="hidden" name="pk" value="${list.sno}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" value="${list.groupCode}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" id="requiredAtLoc" class="form-control" required="" name="groupCode">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label">*Group Name</label>
                                            <c:choose>
                                                <c:when test="${fn:length(grouplist) > 0}">
                                                    <c:forEach items="${grouplist}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" placeholder="" id="groupname" readonly="" class="form-control" required="" name="groupName" value="${list.groupName}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" value="${list.groupName}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" placeholder="" id="groupname" class="form-control" required="" name="groupName">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label col-md-3 col-sm-3">Description</label>
                                            <c:choose>
                                                <c:when test="${fn:length(grouplist) > 0}">
                                                    <c:forEach items="${grouplist}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <textarea name="description" class="form-control"  rows="1" style="resize: none">${list.groupDesc}</textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea readonly="" class="form-control"  rows="1" style="resize: none">${list.groupDesc}</textarea>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <textarea name="description" class="form-control"  rows="1" style="resize: none"></textarea>
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>
                                        <p>&nbsp;</p>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label col-md-3 col-sm-3">Address</label>
                                            <c:choose>
                                                <c:when test="${fn:length(grouplist) > 0}">
                                                    <c:forEach items="${grouplist}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <textarea name="address" class="form-control"  rows="1" style="resize: none">${list.groupAddress}</textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea readonly="" class="form-control"  rows="1" style="resize: none">${list.groupAddress}</textarea>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <textarea name="address" class="form-control" rows="1"></textarea>
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>

                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>
                                        <c:if test="${action ne 'view'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                                    <button type="submit" class="btn btn-primary" style="">SAVE</button>
                                                    <a href="../login/grouplist.htm" class="btn btn-danger">CANCEL</a>
                                                </div>
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
