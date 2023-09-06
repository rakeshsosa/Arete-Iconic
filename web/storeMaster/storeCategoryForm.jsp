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


    <body class="nav-md">

        <div class="container body">


            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">

                        <div class="col-md-6 col-xs-12">
                            <div class="x_panel">
                                <jsp:include page="../login/headerlink.htm?submodule=Store Master&tab=Store Category&pagetype=form"/>
                                <div class="x_title">
                                    <h2>Store Category Form</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />


                                    <form class="form-inline" action="../master/storeCategoryFormSubmit.htm" method="post" id="imForm">




                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label" style="padding-right: 20px;"><span style="color: red">*</span> Store Category Number</label>
                                            <c:choose>
                                                <c:when test="${fn:length(storecatlist) > 0}">
                                                    <c:forEach items="${storecatlist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control validate[required]" required="" autocomplete="off" id="categoryNo" name="categoryNo" type="text" value="${type.categoryNo}" maxlength="50" onkeyup="checkStore1();"> 
                                                                <input name="pk" type="hidden" value="${type.sno}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" readonly type="text" name="categoryNo" value="${type.categoryNo}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control validate[required]"  autocomplete="off" id="categoryNo" name="categoryNo" type="text" value="" maxlength="50" onkeyup="checkStore1();">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label" style="padding-right: 20px;"><span style="color: red">*</span>Category Name</label>
                                            <c:choose>
                                                <c:when test="${fn:length(storecatlist) > 0}">
                                                    <c:forEach items="${storecatlist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <!--<input class="form-control validate[required]" required="" autocomplete="off" id="storeCategory" name="storeCategory" type="text" value="${type.storeCategory}" maxlength="50" onkeyup="checkStore1();">--> 
                                                                <select class="form-control validate[required]"  name="storeCategory" data-rel="chosen" id="storeCategory"  onchange="checkStore();">
                                                                    <option value="${type.storeCategory}">${type.storeCategory}</option>
                                                                    <option>minor Store</option>
                                                                    <option>major Store</option>
                                                                    <option>Clustered Store</option>
                                                                    <option>Warehouse Store</option>      
                                                                </select>   
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" readonly type="text" name="storeCategory" value="${type.storeCategory}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <select class="form-control validate[required]"  name="storeCategory" data-rel="chosen" id="storeCategory" onchange="checkStore();">
                                                        <option value="">Select an option</option>
                                                        <option>minor Store</option>
                                                        <option>major Store</option>
                                                        <option>Clustered Store</option>
                                                        <option>Warehouse Store</option>      
                                                    </select>       
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>


                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label" style="padding-right: 20px;"><span style="color: red"></span>Description</label>
                                            <c:choose>
                                                <c:when test="${fn:length(storecatlist) > 0}">
                                                    <c:forEach items="${storecatlist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control validate[required]" autocomplete="off" id="storeDesc" name="storeDesc" type="text" value="${type.storeDesc}" maxlength="50" onkeyup="checkStore1();"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" readonly type="text" name="storeDesc" value="${type.storeDesc}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control validate[required]"  autocomplete="off" id="storeDesc" name="storeDesc" type="text" value="" maxlength="50" onkeyup="checkStore1();">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>


                                        <p>&nbsp;</p>




                                        <div class="clearfix"></div>

                                        <c:if test="${action ne 'view' && action ne 'edit'}">
                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                                <button type="submit" class="btn btn-primary" onclick="return test();">Save</button>
                                                <a href="../master/storeMasterList.htm" class="btn btn-danger">Cancel</a>
                                            </div>
                                        </c:if>

                                        <c:if test="${action eq 'edit'  }">

                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                                <button type="submit" class="btn btn-primary" style="" onclick="return test();">Save</button>
                                                <a href="../master/storeMasterList.htm" class="btn btn-danger">Cancel</a>
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
              
                var categoryNo = document.getElementById("categoryNo").value;
                var storeCategory = document.getElementById("storeCategory").value;
            
                if (document.getElementById("categoryNo").value == "")
                {
                    alert("Enter categoryNumber");
                    return false;
                }
                else
                if (document.getElementById("storeCategory").value == "")
                {
                    alert("Enter storeCategory");
                    return false;
                }
                
                

            }
            </script>
    </body>

</html>
