<%-- 
    Document   : subgroupform
    Created on : Feb 29, 2016, 5:58:47 PM
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
                                <jsp:include page="../login/headerlink.htm?submodule=Organisation&tab=Sub-Organisation Group&pagetype=form"/>

                                <div class="x_title">
                                    <h2>Sub-Organisation Group</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />


                                    <form class="form-inline" action="../login/subgroupsubmit.htm">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label">*Group Name</label>
                                            <c:choose>
                                                <c:when test="${fn:length(subgrouplist) > 0}">
                                                    <c:forEach items="${subgrouplist}" var="list">
                                                        <c:forEach items="${grouplist}" var="list1">
                                                            <c:if test="${list1.groupCode eq list.groupCode}">
                                                                <c:set var="gname" value="${list1.groupName}"/>
                                                            </c:if>
                                                        </c:forEach>
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control"  readonly="" value="${gname}">
                                                                <input type="hidden" name="groupCode" value="${list.groupCode}">
                                                                <input type="hidden" name="pk" value="${list.sno}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" value="${gname}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <select class="form-control" required="" name="groupCode">
                                                        <option></option>
                                                        <c:forEach items="${grouplist}" var="list">
                                                            <option value="${list.groupCode}">${list.groupName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label">*SubGroup Code</label>
                                            <c:choose>
                                                <c:when test="${fn:length(subgrouplist) > 0}">
                                                    <c:forEach items="${subgrouplist}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="requiredAtLoc" class="form-control" required="" readonly="" name="suborgCode" value="${list.suborgCode}">
                                                            </c:when>
                                                            <c:otherwise>

                                                                <input type="text" class="form-control" readonly="" value="${list.suborgCode}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" required="" name="suborgCode">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label">*SubGroup Name</label>
                                            <c:choose>
                                                <c:when test="${fn:length(subgrouplist) > 0}">
                                                    <c:forEach items="${subgrouplist}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" id="requiredAtLoc" class="form-control" required="" readonly="" name="subgorgName" value="${list.suborgName}">
                                                            </c:when>
                                                            <c:otherwise>

                                                                <input type="text" class="form-control" readonly="" value="${list.suborgName}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" required="" name="subgorgName">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>
                                        <p>&nbsp;</p>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label col-md-3 col-sm-3">Description</label>
                                            <c:choose>
                                                <c:when test="${fn:length(subgrouplist) > 0}">
                                                    <c:forEach items="${subgrouplist}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <textarea name="description" class="form-control"  rows="1" style="resize: none">${list.suborgDesc}</textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea readonly="" class="form-control"  rows="1" style="resize: none">${list.suborgDesc}</textarea>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <textarea name="description" class="form-control"  rows="1" style="resize: none"></textarea>
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label col-md-3 col-sm-3">Address</label>
                                            <c:choose>
                                                <c:when test="${fn:length(subgrouplist) > 0}">
                                                    <c:forEach items="${subgrouplist}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <textarea name="address" class="form-control"  rows="1" style="resize: none">${list.suborgAddress}</textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea readonly="" class="form-control"  rows="1" style="resize: none">${list.suborgAddress}</textarea>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <textarea name="address" class="form-control"  rows="1" style="resize: none"></textarea>
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
                                                    <a href="../login/subgrouplist.htm" class="btn btn-danger">CANCEL</a>

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

