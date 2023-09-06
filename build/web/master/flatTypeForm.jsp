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
        <link href="../common/theme/css/disableSelection.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>arête Assets Management</title>
        <script>
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
            function fetchType() {
                var flatType = document.getElementById("flatType").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../master/fetchFlatType.htm',
                            data: {
                                flatType: flatType
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("flatType").value = "";
                                    return false;
                                }
                            }
                        });
            }

            function test()
            {
                if (confirm('Do you really want to Save this updated record')) {
                    document.forms["userform"].submit();
                    return true;
                } else {
                    return false;
                }

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
                                <jsp:include page="../login/headerlink.htm?submodule=Masters&tab=Flat Type&pagetype=form"/>

                                <div class="x_title">
                                    <h2>Tenant Type Details</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />
                                    <form id="userform" class="row" action="../master/flatTypeFormSubmit.htm">
                                        <c:choose>
                                            <c:when test="${fn:length(type) > 0}">
                                                <c:forEach items="${type}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <script type="text/javascript">
                                                                $(document).ready(function () {


                                                                    var nFields = document.getElementsByClassName('x_panel')[0].getElementsByTagName('input');
                                                                    for (i = 0; i < nFields.length; i++)
                                                                    {
                                                                        debugger;
                                                                        if (!(nFields[i].readOnly)) {
                                                                            //console.log("ss" +readOnlyAttr);
                                                                            //$(nFields[i]).css("border-color", "red");
                                                                            $(nFields[i]).focus(function () {
                                                                                debugger;
                                                                                //alert('hi');
                                                                                $(this).css("border-color", "red");
                                                                                //$(this).attr("style", "border-color red !important");
                                                                            });
                                                                        }
                                                                    }
                                                                    var textFields = document.getElementsByTagName('textarea')
                                                                    for (i = 0; i < textFields.length; i++)
                                                                    {
                                                                        debugger;
                                                                        if (!(textFields[i].readOnly)) {
                                                                            //console.log("ss" +readOnlyAttr);
                                                                            //$(textFields[i]).css("border-color", "red");
                                                                            $(textFields[i]).focus(function () {
                                                                                debugger;
                                                                                //alert('hi');
                                                                                $(this).css("border-color", "red");
                                                                                //$(this).attr("style", "border-color red !important");
                                                                            });
                                                                        }
                                                                    }



                                                                });
                                                            </script>
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                        </c:choose>
                                        <c:forEach items="${test}" var="list">
                                            <c:if test="${list[0] eq '720'}">
                                                <c:set value="${list[1]}" var="field_1"/>
                                                <c:set value="${list[2]}" var="fieldStatus_1"/>
                                                <c:set value="${list[3]}" var="mand_status_1"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '721'}">
                                                <c:set value="${list[1]}" var="field_2"/>
                                                <c:set value="${list[2]}" var="fieldStatus_2"/>
                                                <c:set value="${list[3]}" var="mand_status_2"/>
                                            </c:if>
                                           
                                           

                                        </c:forEach> 
                                        <c:if test="${fieldStatus_1 eq 'y'}">
                                            <div class="col-md-4 form-floating">
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(type) > 0}">
                                                        <c:forEach items="${type}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_1} readonly="" id="flatType" name="flatType" value="${list.flatType}" maxlength="30" onkeypress="return isNumberKey4(event)">
                                                                    <input type="hidden" name="pk" value="${list.sno}">
                                                                    <input type="hidden" name="status" value="${list.status}">
                                                                    <input type="hidden" name="typeSeqNo" value="${list.typeSeqNo}">
                                                                    <input type="hidden" name="creationDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.creationDate}"/>">
                                                                </c:when>
                                                                <c:otherwise>

                                                                    <input type="text" class="form-control" readonly="" value="${list.tenantType}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <!--<input type="text" placeholder="Fill" class="form-control" ${mand_status_1} name="tenantType" id="tenantType" maxlength="30" onkeypress="return isNumberKey4(event)" onchange="fetchType();">-->
                                                        <input type="text" id="flatType" name="flatType" ${mand_status_1} class="form-control" placeholder="Fill" onchange="fetchType();">
                                                          
                                                    </c:otherwise>        
                                                </c:choose>
                                                <label class="control-label">${field_1}
												<c:if test="${mand_status_1 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
												</label>
                                            </div>
										</c:if>
										
                                        <c:if test="${fieldStatus_2 eq 'y'}">
                                            <div class="col-md-4 form-floating">
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(type) > 0}">
                                                        <c:forEach items="${type}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <textarea name="typeDesc" class="form-control" ${mand_status_2} rows="1" style="resize: none" maxlength="200" >${list.typeDesc}</textarea>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <textarea readonly="" class="form-control" rows="1" style="resize: none">${list.typeDesc}</textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <textarea name="typeDesc" class="form-control" ${mand_status_2} rows="1" style="resize: none" placeholder="Fill" maxlength="200"></textarea>
                                                    </c:otherwise>        
                                                </c:choose>
												<label style="margin-top:-18px;" class="control-label">${field_2}
												<c:if test="${mand_status_2 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
												</label>
                                            </div>
										</c:if>
                                        

                                            <p>&nbsp;</p>
                                        <c:if test="${action ne 'view' && action ne 'edit'}">

                                            <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
                                                <button type="submit" class="btn btn-primary" style="">Save</button>
                                                <a href="../master/flatTypeList.htm" class="btn btn-danger">Cancel</a>
                                            </div>

                                        </c:if>

                                        <c:if test="${action eq 'edit'  }">

                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                                <button type="button" class="btn btn-primary" style="" onclick="return test();">Save</button>
                                                <a href="../master/flatTypeList.htm" class="btn btn-danger">Cancel</a>
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
