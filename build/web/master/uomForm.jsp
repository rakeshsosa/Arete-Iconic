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

        <title>arête Assets Management</title>
		</head>
        <script>
            //method to validate unique category
            function test11() {
                var uomName = document.getElementById("uomName").value;
                //alert(contractCategory);
                $.ajax
                        ({
                            type: "POST",
                            url: '../master/uomListAvailabilty.htm',
                            data: {
                                uomName: uomName
                            },
                            success: function (data) {
    
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
    
                                    document.getElementById("uomName").value = "";
    
                                    return false;
                                }
    
                                // test12();
                            }
    
    
                        });
            }
    
            //method to validate Mandatory and submit form       
            function test12()
            {
                if (document.getElementById("uomName").value == "")
                {
                    alert("Enter UOM");
                    return false;
                }
                else {
    
                    document.forms["userform"].submit();
                }
    
            }
    
            function test()
            {
                var comp = document.getElementById("uomName").value;
                var comp1 = document.getElementById("uomName1").value;
                var desc = document.getElementById("uomDesc").value;
                var desc1 = document.getElementById("uomDesc1").value;
    
                if (document.getElementById("uomName").value == "")
                {
                    alert("Enter UOM");
                    return false;
                }
                else {
    
                    if (comp !== comp1 || desc !== desc1) {
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
    
            }
    
    //        function test()
    //        {
    //            if (document.getElementById("uomName").value == "")
    //            {
    //                alert("Enter UOM");
    //                return false;
    //            }
    //            else {
    //                if (confirm('Do you really want to Save this updated record')) {
    //                    document.forms["userform"].submit();
    //                    return true;
    //                } else {
    //                    return false;
    //                }
    //
    //            }
    //
    //        }
        </script>
    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>
               
                                
    <main id="main" class="main">
       <div>
        <jsp:include page="../login/headerlink.htm?submodule=Accessory Details&tab=UOM Master&pagetype=form"/>
    </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
                <div class="card-title"><h5>UOM Master Details</h5></div>
              

                <form id="userform" method="post" class="row" action="../master/uomFormSubmit.htm" onsubmit="return test12();">
                    <c:choose>
                        <c:when test="${fn:length(uomList) > 0}">
                            <c:forEach items="${uomList}" var="list">
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
                    <c:forEach items="${tab1}" var="list">                                       
                        <c:if test="${list[0] eq '480'}">
                            <c:set value="${list[1]}" var="field_480"/>
                            <c:set value="${list[2]}" var="fieldStatus_480"/>
                            <c:set value="${list[3]}" var="mand_status_480"/>
                            <c:set value="${list[4]}" var="max_length_480"/>
                        </c:if>
                        <c:if test="${list[0] eq '481'}">
                            <c:set value="${list[1]}" var="field_481"/>
                            <c:set value="${list[2]}" var="fieldStatus_481"/>
                            <c:set value="${list[3]}" var="mand_status_481"/>
                            <c:set value="${list[4]}" var="max_length_481"/>
                        </c:if>

                    </c:forEach> 
                    <c:if test="${fieldStatus_480 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">

                            <c:choose>
                                <c:when test="${fn:length(uomList) > 0}">
                                    <c:forEach items="${uomList}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input type="text" class="form-control" ${mand_status_480} maxlength="${max_length_480}" name="uomName" id="uomName" value="${list.uomName}" onchange="test11();">
                                                <input type="hidden" class="form-control" ${mand_status_480} maxlength="${max_length_480}" name="uomName1" id="uomName1" value="${list.uomName}" >
                                                <input name="pk" type="hidden" value="${list.sno}">
                                                <input name="status" type="hidden" value="${list.status}">
                                                <input type="hidden" placeholder="Fill" class="form-control"  name="uomId" id="uomId" value="${list.uomId}">
                                            </c:when>
                                            <c:otherwise>

                                                <input type="text" class="form-control" ${mand_status_480}  readonly="" name="uomName" value="${list.uomName}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>                                                    
                                    <input type="text" placeholder="Fill" class="form-control"  ${mand_status_480} maxlength="${max_length_480}" autocomplete="off" name="uomName" id="uomName" value="" onchange="test11();">
                                    <input type="hidden" placeholder="Fill" class="form-control"  name="uomId" id="uomId" value="">
                                    <input name="status" type="hidden" value="">
                                </c:otherwise>        
                            </c:choose>
                              <label class="control-label">${field_480}
                            <c:if test="${mand_status_480 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if>
                            </label>
                        </div>
                    </c:if>
                    
                    <c:if test="${fieldStatus_481 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">

                            <c:choose>
                                <c:when test="${fn:length(uomList) > 0}">
                                    <c:forEach items="${uomList}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input name="uomDesc" id="uomDesc" value="${list.uomDesc}" class="form-control" maxlength="${max_length_481}" rows="1" style="resize: none">
                                                <input id="uomDesc1" class="form-control"  rows="1" maxlength="300" style="resize: none" type="hidden" value="${list.uomDesc}">

                                            </c:when>
                                            <c:otherwise>
                                                <textarea readonly="" class="form-control"  name="uomDesc" rows="1" style="resize: none">${list.uomDesc}</textarea>
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <input name="uomDesc" class="form-control" placeholder="Fill" maxlength="${max_length_481}" rows="1" style="resize: none">
                                </c:otherwise>        
                            </c:choose>
                            <label style=""  class="control-label">${field_481}</label>
                        </div>
                    </c:if>
                    <c:if test="${fieldStatus_3 eq 'y'}">
                        <div class="col-md-4 form-floating">

                            <c:choose>
                                <c:when test="${fn:length(categorylst) > 0}">
                                    <c:forEach items="${categorylst}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input type="hidden" class="form-control" ${mand_status_3}  name="attribute1" id="attribute1" value="">

                                            </c:when>
                                            <c:otherwise>

                                                <input type="hidden" class="form-control" ${mand_status_3} readonly=""  name="attribute1" value="">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>                                                    
                                    <input type="hidden" placeholder="Fill" class="form-control"   name="attribute1" id="attribute1" value="">

                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label"></label>
                        </div>
                    </c:if>
                    
                    <c:if test="${fieldStatus_3 eq 'y'}">
                        <div class="col-md-4 form-floating">

                            <c:choose>
                                <c:when test="${fn:length(categorylst) > 0}">
                                    <c:forEach items="${categorylst}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input type="hidden" class="form-control" ${mand_status_3}  name="attribute2" id="attribute2" value="">

                                            </c:when>
                                            <c:otherwise>

                                                <input type="hidden" class="form-control" ${mand_status_3} readonly=""  name="attribute2" value="">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>                                                    
                                    <input type="hidden" placeholder="Fill" class="form-control"   name="attribute2" id="attribute2" value="">

                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label"></label>
                        </div>
                    </c:if>
                    
                    <c:if test="${fieldStatus_3 eq 'y'}">
                        <div class="col-md-4 form-floating">

                            <c:choose>
                                <c:when test="${fn:length(categorylst) > 0}">
                                    <c:forEach items="${categorylst}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input type="hidden" class="form-control" ${mand_status_3}  name="attribute3" id="attribute3" value="">

                                            </c:when>
                                            <c:otherwise>

                                                <input type="hidden" class="form-control" ${mand_status_3} readonly=""  name="attribute3" value="">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>                                                    
                                    <input type="hidden" placeholder="Fill" class="form-control"   name="attribute3" id="attribute3" value="">

                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label"></label>
                        </div>
                    </c:if>
                    
                    <c:if test="${fieldStatus_3 eq 'y'}">
                        <div class="col-md-4 form-floating">

                            <c:choose>
                                <c:when test="${fn:length(categorylst) > 0}">
                                    <c:forEach items="${categorylst}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input type="hidden" class="form-control" ${mand_status_3}  name="attribute4" id="attribute4" value="">

                                            </c:when>
                                            <c:otherwise>

                                                <input type="hidden" class="form-control" ${mand_status_3} readonly=""  name="attribute4" value="">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>                                                    
                                    <input type="hidden" placeholder="Fill" class="form-control"   name="attribute4" id="attribute4" value="">

                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label"></label>
                        </div>
                    </c:if>
                    <c:if test="${fieldStatus_3 eq 'y'}">
                        <div class="col-md-4 form-floating">

                            <c:choose>
                                <c:when test="${fn:length(categorylst) > 0}">
                                    <c:forEach items="${categorylst}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input type="hidden" class="form-control" ${mand_status_3}  name="attribute5" id="attribute5" value="">

                                            </c:when>
                                            <c:otherwise>

                                                <input type="hidden" class="form-control" ${mand_status_3} readonly=""  name="attribute5" value="">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>                                                    
                                    <input type="hidden" placeholder="Fill" class="form-control"   name="attribute5" id="attribute5" value="">

                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label"></label>

                        </div>
                    </c:if>


                    <c:if test="${action ne 'view' && action ne 'edit' }">

                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                            <button type="submit" class="btn btn-primary" style="" >Save</button>
                            <a href="../master/uomList.htm" class="btn btn-danger">Cancel</a>
                        </div>

                    </c:if>

                    <c:if test="${action eq 'edit'  }">

                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                            <button type="button" class="btn btn-primary" style="" onclick="return test();">Save</button>
                            <a href="../master/uomList.htm" class="btn btn-danger">Cancel</a>
                        </div>

                    </c:if>


                </form>
            </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->

<jsp:include page="../login/footer.jsp"/>

    </body>

</html>
