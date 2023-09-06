<%-- 
    Document   : form1
    Created on : Feb 23, 2016, 3:24:29 PM
    Author     : Sudhanshu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <script>
        function selectStoreCategory() {

            myWindow = window.open("../master/selectStoreCategory.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
        }

    </script>

    <body class="nav-md">

        <div class="container body">


            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">

                        <div class="col-md-6 col-xs-12">
                            <div class="x_panel">
                                <jsp:include page="../login/headerlink.htm?submodule=Store Master&tab=Store Type Master&pagetype=form"/>
                                <div class="x_title">
                                    <h2>Store Type Form</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br/>

                                    <form class="form-inline" action="../master/storeTypeMasterFormSubmit.htm" method="post" id="imForm">



                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label" style="padding-right: 20px;"><span style="color: red">*</span> Store Type ID</label>
                                            <c:choose>
                                                <c:when test="${fn:length(storeTypeData) > 0}">
                                                    <c:forEach items="${storeTypeData}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control validate[required]" required="" autocomplete="off" id="storeTypeID" name="storeTypeID" type="text" value="${type[1]}" maxlength="50" onkeyup="checkStore1();"> 
                                                                <input name="pk" type="hidden" value="${type[0]}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" readonly type="text" name="storeTypeID" value="${type[1]}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control validate[required]"  autocomplete="off" id="storeTypeID" name="storeTypeID" type="text" value="" maxlength="50" onkeyup="checkStore1();">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label" style="padding-right: 20px;"><span style="color: red">*</span>Store Type Category</label>
                                            <c:choose>
                                                <c:when test="${fn:length(storeTypeData) > 0}">
                                                    <c:forEach items="${storeTypeData}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control validate[required]" required=""  autocomplete="off" id="storeCategory" name="storeCategory" readonly type="text" value="${type[3]}" maxlength="50" onclick="selectStoreCategory()"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" readonly type="text" name="storeCategory" value="${type[3]}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control validate[required]"  autocomplete="off" id="storeCategory" readonly name="storeCategory" type="text" value="" maxlength="50" onclick="selectStoreCategory()">
                                                    <input id="categoryNo" class="form-control"  rows="1" maxlength="300" style="resize: none" type="hidden" value="${type.categoryNo}">
                                <!--<input id="storeCategory" class="form-control"  rows="1" maxlength="300" style="resize: none" type="text" value="${type.storeCategory}">-->
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label" style="padding-right: 20px;"><span style="color: red"></span>Description</label>
                                            <c:choose>
                                                <c:when test="${fn:length(storeTypeData) > 0}">
                                                    <c:forEach items="${storeTypeData}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control validate[required]" required="" autocomplete="off" id="storeTypeDesc" name="storeTypeDesc" type="text" value="${type[4]}" maxlength="50" onkeyup="checkStore1();"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" readonly type="text" name="storeTypeDesc" value="${type[4]}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control validate[required]"  autocomplete="off" id="storeTypeDesc" name="storeTypeDesc" type="text" value="" maxlength="50">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>

                                        <p>&nbsp;</p>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label" style="padding-right: 20px;"><span style="color: red">*</span>Store Type</label>
                                            <c:choose>
                                                <c:when test="${fn:length(storeTypeData) > 0}">
                                                    <c:forEach items="${storeTypeData}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <!--<input class="form-control validate[required]" required="" autocomplete="off" id="storeTypeName" name="storeTypeName" type="text" value="${type[2]}" maxlength="50" onkeyup="checkStore1();">--> 
                                                                <select class="form-control validate[required]"  name="storeType" data-rel="chosen" id="storeType">
                                                                    <option value="${type[2]}">${type[2]}</option>
                                                                    <option>movable</option>
                                                                    <option>Immovable</option>
                                                                    <option>Adhoc</option>

                                                                </select>  
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" readonly type="text" name="storeType" value="${type[2]}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <select class="form-control validate[required]"  name="storeType" data-rel="chosen" id="storeType">
                                                        <option value="">Choose the option</option>
                                                        <option>movable</option>
                                                        <option>Immovable</option>
                                                        <option>Adhoc</option>

                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>











                                        <div class="clearfix"></div>

                                        <c:if test="${action ne 'view' && action ne 'edit'}">
                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                                <button type="submit" class="btn btn-primary" onclick="return test();">Save</button>
                                                <a href="../master/storeTypeMasterList.htm" class="btn btn-danger">Cancel</a>
                                            </div>
                                        </c:if>

                                        <c:if test="${action eq 'edit'  }">

                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                                <button type="submit" class="btn btn-primary" style="" onclick="return test();">Save</button>
                                                <a href="../master/storeTypeMasterList.htm" class="btn btn-danger">Cancel</a>
                                            </div>

                                        </c:if>
                                    </form>
                                </div> 

                                <div class="clearfix"></div>

                                <div class="clearfix"></div>                

                                <!-- /page content -->



                            </div>

                        </div>
                    </div>
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
            NProgress.done();


        </script>
        <script>
            function test()
            {

                var storeTypeID = document.getElementById("storeTypeID").value;
                var storeCategory = document.getElementById("storeCategory").value;
                var storeType = document.getElementById("storeType").value;

                if (document.getElementById("storeTypeID").value == "")
                {
                    alert("Enter storeTypeID");
                    return false;
                }
                else
                if (document.getElementById("storeCategory").value == "")
                {
                    alert("Enter storeCategory");
                    return false;
                }
                else
                if (document.getElementById("storeType").value == "")
                {
                    alert("Enter storeType");
                    return false;
                }



            }
        </script>

    </body>

</html>
