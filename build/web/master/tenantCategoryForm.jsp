<%-- 
    Document   : assetDetailsForm
    Created on : Sep 15, 2016, 10:42:18 AM
    Author     : Kondal Reddy N
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

        <title>Arete Iconic</title>
        <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
		</head>
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
            function fetchCategory() {
                var tenantCategory = document.getElementById("tenantCategory").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../master/fetchCategory.htm',
                            data: {
                                tenantCategory: tenantCategory
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("tenantCategory").value = "";
                                    return false;
                                }
                            }
                        });
            }

            function test()
            {

                var desc = document.getElementById("categoryDesc").value;
                var desc1 = document.getElementById("categoryDesc1").value;
                   var lanlosd1 = document.getElementById("tenantCategory").value;
                
                if (document.getElementById("tenantCategory").value == "")
                {
                    alert("Enter property/flat type");
                    return false;
                }
                else

                if (desc !== desc1) {
                    if (confirm('Do you really want to Save this updated record')) {
                        document.forms["userform"].submit();
                        return true;
                    } else {
                        return true;
                    }

                } else {
                    document.forms["userform"].submit();
                }


            }

//
//            function test()
//            {
//                if (confirm('Do you really want to Save this updated record')) {
//                    document.forms["userform"].submit();
//                    return true;
//                } else {
//                    return false;
//                }
//
//            }
        </script>
    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>
               <jsp:include page="../login/footer.jsp"/>

                                
    <main id="main" class="main">
        <div class="mt-3">
        <jsp:include page="../login/headerlink.htm?submodule=Masters&tab=Property/Flat/Tenant Type&pagetype=form"/>
    </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
                <div class="card-title"><h5>Property/Flat/Tenant Type Details</h5></div>
                <form id="userform" class="row" action="../master/tenantCategoryFormSubmit.htm">
                    <c:choose>
                        <c:when test="${fn:length(category) > 0}">
                            <c:forEach items="${category}" var="list">
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
                        <c:if test="${list[0] eq '12'}">
                            <c:set value="${list[1]}" var="field_1"/>
                            <c:set value="${list[2]}" var="fieldStatus_1"/>
                            <c:set value="${list[3]}" var="mand_status_1"/>
                        </c:if>
                        <c:if test="${list[0] eq '13'}">
                            <c:set value="${list[1]}" var="field_2"/>
                            <c:set value="${list[2]}" var="fieldStatus_2"/>
                            <c:set value="${list[3]}" var="mand_status_2"/>
                        </c:if>
                        <c:if test="${list[0] eq '14'}">
                            <c:set value="${list[1]}" var="field_3"/>
                            <c:set value="${list[2]}" var="fieldStatus_3"/>
                            <c:set value="${list[3]}" var="mand_status_3"/>
                        </c:if>
                        <c:if test="${list[0] eq '237'}">
                            <c:set value="${list[1]}" var="field_4"/>
                            <c:set value="${list[2]}" var="fieldStatus_4"/>
                            <c:set value="${list[3]}" var="mand_status_4"/>
                        </c:if>
                        <c:if test="${list[0] eq '238'}">
                            <c:set value="${list[1]}" var="field_5"/>
                            <c:set value="${list[2]}" var="fieldStatus_5"/>
                            <c:set value="${list[3]}" var="mand_status_5"/>
                        </c:if>
                        <c:if test="${list[0] eq '239'}">
                            <c:set value="${list[1]}" var="field_6"/>
                            <c:set value="${list[2]}" var="fieldStatus_6"/>
                            <c:set value="${list[3]}" var="mand_status_6"/>
                        </c:if>
                        <c:if test="${list[0] eq '240'}">
                            <c:set value="${list[1]}" var="field_7"/>
                            <c:set value="${list[2]}" var="fieldStatus_7"/>
                            <c:set value="${list[3]}" var="mand_status_7"/>
                        </c:if>
                        <c:if test="${list[0] eq '241'}">
                            <c:set value="${list[1]}" var="field_8"/>
                            <c:set value="${list[2]}" var="fieldStatus_8"/>
                            <c:set value="${list[3]}" var="mand_status_8"/>
                        </c:if>

                    </c:forEach> 
                    <c:if test="${fieldStatus_1 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                            
                            <c:choose>
                                <c:when test="${fn:length(category) > 0}">
                                    <c:forEach items="${category}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input type="text" class="form-control" ${mand_status_1}  name="tenantCategory" id="tenantCategory"value="${list.tenantCategory}" maxlength="50"> 
                                                <!--onkeypress="return isNumberKey4(event)">-->
                                                <input type="hidden" name="pk" value="${list.sno}">
                                                <input type="hidden" name="status" value="${list.status}">
                                                <input type="hidden" name="categorySeqNo" value="${list.categorySeqNo}">
                                                <input type="hidden" name="creationDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.creationDate}"/>">
                                            </c:when>
                                            <c:otherwise>

                                                <input type="text" class="form-control" readonly="" value="${list.tenantCategory}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>                                                    
                                    <!--<input type="text" placeholder="Fill" class="form-control" ${mand_status_1} name="tenantCategory" id="tenantCategory" maxlength="50" onkeypress="return isNumberKey4(event)" onchange="fetchCategory();">-->
                                    <input type="text" id="tenantCategory" name="tenantCategory" ${mand_status_1} class="form-control" placeholder="Fill" onchange="fetchCategory();">

                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label">${field_1}
                            <c:if test="${mand_status_1 eq 'required'}">
                                <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                            </c:if>
                            </label>
                        </div>
                    </c:if>
                    
                    <c:if test="${fieldStatus_2 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                            
                            <c:choose>
                                <c:when test="${fn:length(category) > 0}">
                                    <c:forEach items="${category}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <textarea name="categoryDesc" id="categoryDesc" class="form-control" ${mand_status_2} rows="1" style="resize: none" maxlength="200">${list.categoryDesc}</textarea>
                                                <input id="categoryDesc1" class="form-control"  rows="1" maxlength="300" style="resize: none" type="hidden" value="${list.categoryDesc}">

                                            </c:when>
                                            <c:otherwise>
                                                <textarea readonly="" class="form-control" rows="1" style="resize: none">${list.categoryDesc}</textarea>
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <textarea name="categoryDesc" class="form-control" ${mand_status_2} rows="1" style="resize: none" placeholder="Fill" maxlength="200"></textarea>
                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label">${field_2}
                            <c:if test="${mand_status_2 eq 'required'}">
                                <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                            </c:if>
                            </label>
                        </div>
                    </c:if>
                    
                    <c:if test="${fieldStatus_3 eq 'y'}">
                        <div class="col-md-4 form-floating">
                            
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
                                    <input type="text" placeholder="Fill" class="form-control" required="" name="categorySeqNo">
                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label">${field_3}
                            <c:if test="${mand_status_3 eq 'required'}">
                                <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                            </c:if>
                            </label>
                        </div>
                    </c:if>

                    <c:if test="${fieldStatus_4 eq 'y'}">
                        <div class="col-md-4 form-floating">
                            
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
                                    <input type="text" placeholder="Fill" class="form-control" ${mand_status_4} name="extra1" id="extra1">
                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label">${field_4}
                            <c:if test="${mand_status_4 eq 'required'}">
                                <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                            </c:if>
                            </label>
                        </div>
                    </c:if>
                    
                    <c:if test="${fieldStatus_5 eq 'y'}">
                        <div class="col-md-4 form-floating">
                            
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
                                    <input type="text" placeholder="Fill" class="form-control" ${mand_status_5} id="extra2" name="extra2">
                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label">${field_5}
                            <c:if test="${mand_status_5 eq 'required'}">
                                <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                            </c:if>
                            </label>
                        </div>
                    </c:if>
                    
                    <c:if test="${fieldStatus_6 eq 'y'}">
                        <div class="col-md-4 form-floating">
                            
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
                                    <input type="text" placeholder="Fill" class="form-control" ${mand_status_6} id="extra3" name="extra3">
                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label">${field_6}
                            <c:if test="${mand_status_6 eq 'required'}">
                                <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                            </c:if>
                            </label>
                        </div>
                    </c:if>
                    
                    <c:if test="${fieldStatus_7 eq 'y'}">
                        <div class="col-md-4 form-floating">
                            
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
                                    <input type="text" placeholder="Fill" class="form-control" ${mand_status_7} id="extra4"  name="extra4">
                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label">${field_7}
                            <c:if test="${mand_status_7 eq 'required'}">
                                <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                            </c:if>
                            </label>
                        </div>
                    </c:if>
                    
                    <c:if test="${fieldStatus_8 eq 'y'}">
                        <div class="col-md-4 form-floating">
                            
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
                                    <input type="text" placeholder="Fill" class="form-control" ${mand_status_8} id="extra5" name="extra5">
                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label">${field_8}
                            <c:if test="${mand_status_8 eq 'required'}">
                                <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                            </c:if>
                            </label>
                        </div>
                    </c:if>

                        
                    <c:if test="${action ne 'view'}">

                        <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
                            <button type="submit" class="btn btn-primary" style="">Save</button>
                            <a href="../master/tenantCategoryList.htm" class="btn btn-danger">Cancel</a>
                        </div>

                    </c:if>

                    <c:if test="${action eq 'view'}">

                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                            <a href="../master/tenantCategoryList.htm" class="btn btn-danger">Cancel</a>
                        </div>

                    </c:if>
                </form>
            </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->


    </body>

</html>
