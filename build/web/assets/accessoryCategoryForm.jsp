<%-- 
    Document   : tenantCategoryForm
    Created on : Mar 4, 2016, 10:42:01 AM
    Author     : Shweta s
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
        <script>
            function isNumberKey3(evt) {
                debugger;
                var charCode = (evt.which) ? evt.which : event.keyCode;

                if (charCode > 32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122) && charCode > 31 && (charCode < 48 || charCode > 57))
                {
//                    alert("Please Enter Only Alphanumerics");
                    return false;
                }
                return true;
            }
            function isNumberKey(evt)
            {
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                {
//                    alert("Please Enter Numeric value");
                    return false;
                }
                return true;
            }
            function isNumberKey4(evt) {
                debugger;
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if (charCode > 32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122))
                {
//                    alert("Please Enter Only Alphabets");
                    return false;
                }
                return true;
            }

            function checkAccessoryName()
            {
                var accessoryName = document.getElementById("accessoryName").value;
                $.ajax({
                    type: "POST",
                    url: "../assets/accessoryName.htm",
                    data: {accessoryName: accessoryName},
                    dataType: "text",
                    success: function (data)
                    {
                        if ($.trim(data) !== 'Data  available')
                        {
                            alert("This Accessory  is Already Added.!");
                            document.getElementById("accessoryName").value = "";
                            return false;
                        }
                    },
                    error: function (error) {
                        alert(error);
                    }
                });
            }
        </script>
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
                                <jsp:include page="../login/headerlink.htm?submodule=Masters&tab=Accessory Category&pagetype=form"/>

                                <div class="x_title">
                                    <h2>Accessory Category Details</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />


                                    <form class="form-inline" action="../assets/accessoryCategoryFormSubmit.htm">
                                        <c:forEach items="${test}" var="list">
                                            <c:if test="${list[0] eq '283'}">
                                                <c:set value="${list[1]}" var="field_1"/>
                                                <c:set value="${list[2]}" var="fieldStatus_1"/>
                                                <c:set value="${list[3]}" var="mand_status_1"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '284'}">
                                                <c:set value="${list[1]}" var="field_2"/>
                                                <c:set value="${list[2]}" var="fieldStatus_2"/>
                                                <c:set value="${list[3]}" var="mand_status_2"/>
                                            </c:if>

                                        </c:forEach> 
                                        <c:if test="${fieldStatus_1 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_1 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_1}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(accessories) > 0}">
                                                        <c:forEach items="${accessories}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" required="" id="accessoryName" name="accessoryName" value="${list.accessoryName}" maxlength="50" onkeypress="return isNumberKey4(event)" onchange="return checkAccessoryName();">
                                                                    <input type="hidden" name="pk" value="${list.SNo}">
                                                                    <input type="hidden" name="status" value="${list.status}">
                                                                    <input type="hidden" name="accessoryCode" value="${list.accessoryCode}">
                                                                </c:when>
                                                                <c:otherwise>

                                                                    <input type="text" class="form-control" readonly="" value="${list.accessoryName}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" required="" id="accessoryName" name="accessoryName" maxlength="50" onkeypress="return isNumberKey4(event)" onchange="return checkAccessoryName();">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div></c:if>

                                        <c:if test="${fieldStatus_2 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_2 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if>
                                                <label style="margin-top:-18px;" class="control-label">${field_2}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(accessories) > 0}">
                                                        <c:forEach items="${accessories}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <textarea name="accessoryDesc" class="form-control"  rows="1" style="resize: none" maxlength="250">${list.accessoryDesc}</textarea>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <textarea readonly="" class="form-control" rows="1" style="resize: none">${list.accessoryDesc}</textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <textarea name="accessoryDesc" class="form-control"  rows="1" style="resize: none" maxlength="250"></textarea>
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div></c:if>

                                            <!--                                        mmm<c:if test="${fieldStatus_3 eq 'y'}">
                                                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_3 eq 'required'}">
                                                <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_3}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(category) > 0}">
                                                    <c:forEach items="${category}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" required="" readonly="" name="categorySeqNo" value="${list.categorySeqNo}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                
                                                                <input type="text" class="form-control" readonly="" value="${list.categorySeqNo}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" required="" name="categorySeqNo">
                                                </c:otherwise>        
                                            </c:choose>
                                            
                                            </div></c:if>
                                        
                                        <c:if test="${fieldStatus_4 eq 'y'}">
                                          <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_4 eq 'required'}">
                                                <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_4}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(category) > 0}">
                                                    <c:forEach items="${category}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_4} readonly="" id="extra1" name="extra1" value="${list.extra1}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="extra1" value="${list.extra1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_4} name="extra1" id="extra1">
                                                </c:otherwise>        
                                            </c:choose>
                                            </div></c:if><p>&nbsp;</p>
                                        <c:if test="${fieldStatus_5 eq 'y'}">
                                          <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_5 eq 'required'}">
                                                <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_5}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(category) > 0}">
                                                    <c:forEach items="${category}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_5} readonly="" id="extra2" name="extra2" value="${list.extra2}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" value="${list.extra2}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_5} id="extra2" name="extra2">
                                                </c:otherwise>        
                                            </c:choose>
                                            </div></c:if>
                                        <c:if test="${fieldStatus_6 eq 'y'}">
                                          <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_6 eq 'required'}">
                                                <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_6}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(category) > 0}">
                                                    <c:forEach items="${category}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_6} readonly="" id="extra3" name="extra3" value="${list.extra3}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="extra3" value="${list.extra3}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_6} id="extra3" name="extra3">
                                                </c:otherwise>        
                                            </c:choose>
                                            </div></c:if>
                                        <c:if test="${fieldStatus_7 eq 'y'}">
                                          <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_7 eq 'required'}">
                                                <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_7}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(category) > 0}">
                                                    <c:forEach items="${category}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_7} readonly="" id="extra4" name="extra4" value="${list.extra4}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="extra4" value="${list.extra4}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_7} id="extra4"  name="extra4">
                                                </c:otherwise>        
                                            </c:choose>
                                            </div></c:if><p>&nbsp;</p>
                                        <c:if test="${fieldStatus_8 eq 'y'}">
                                          <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <c:if test="${mand_status_8 eq 'required'}">
                                                <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                            </c:if>
                                            <label class="control-label">${field_8}</label>
                                            <c:choose>
                                                <c:when test="${fn:length(category) > 0}">
                                                    <c:forEach items="${category}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_8} readonly="" id="extra5"  name="extra5" value="${list.extra5}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="extra5" value="${list.extra5}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" ${mand_status_8} id="extra5" name="extra5">
                                                </c:otherwise>        
                                            </c:choose>
                                            </div></c:if>jkku-->
                                            <p>&nbsp;</p>
                                            <p>&nbsp;</p>
                                            <p>&nbsp;</p>
                                        <c:if test="${action ne 'view'}">

                                            <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
                                                <button type="submit" class="btn btn-primary" style="">Save</button>
                                                <a href="../assets/accessoryCategoryList.htm" class="btn btn-danger">Cancel</a>
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
