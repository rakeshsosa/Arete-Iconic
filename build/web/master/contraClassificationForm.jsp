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
            //method to validate unique category
            function test11() {
                var contraClassification = document.getElementById("contraClassification").value;
                //alert(contraClassification);
                $.ajax
                        ({
                            type: "POST",
                            url: '../master/ClassificationAvailabilty.htm',
                            data: {
                                contraClassification: contraClassification
                            },
                            success: function (data) {
    
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    //alert("This Record Already Exist");
                                    //document.getElementById("contraClassification").value = "";
                                    return true;
                                }
    
                                //test12();
                            }
    
    
                        });
            }
    
            //method to validate Mandatory and submit form       
            function test12()
            {
                if (document.getElementById("contraClassification").value == "")
                {
                    alert("Enter Contract Type");
                    return false;
                }
                else {
    
                    document.forms["userform"].submit();
                }
    
            }
    
    //        function test()
    //        {
    //            if (confirm('Do you really want to Save this updated record')) {
    //                document.forms["userform"].submit();
    //                return true;
    //            } else {
    //                return false;
    //            }
    //
    //        }
    
            function test()
            {
                var desc = document.getElementById("contraClassficDesc").value;
                var desc1 = document.getElementById("contraClassficDesc1").value;
                var clas = document.getElementById("contraClassification").value;
    
                if (document.getElementById("contraClassification").value == "")
                {
                    alert("Enter Contract Type");
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
        </script>
    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>
               <jsp:include page="../login/footer.jsp"/>

                                
    <main id="main" class="main">
        <div class="mt-3">
        <jsp:include page="../login/headerlink.htm?submodule=Masters&tab=Contract Type&pagetype=form"/>
    </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
                <div class="card-title"><h5>Contract Category Details</h5></div>
                <form id="userform" method="post" class="form-inline" action="../master/contraClassificationFormSubmit.htm" onsubmit="return test12();">
                    <c:choose>
                        <c:when test="${fn:length(classification) > 0}">
                            <c:forEach items="${classification}" var="list">
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
                    <c:forEach items="${category}" var="list">                                       
                        <c:if test="${list[0] eq '7'}">
                            <c:set value="${list[1]}" var="field_7"/>
                            <c:set value="${list[2]}" var="fieldStatus_7"/>
                            <c:set value="${list[3]}" var="mand_status_7"/>
                        </c:if>
                        <c:if test="${list[0] eq '8'}">
                            <c:set value="${list[1]}" var="field_8"/>
                            <c:set value="${list[2]}" var="fieldStatus_8"/>
                            <c:set value="${list[3]}" var="mand_status_8"/>
                        </c:if>

                    </c:forEach> 
                                        <div class="row">
                    <c:if test="${fieldStatus_7 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                           
                            <c:choose>
                                <c:when test="${fn:length(classification) > 0}">
                                    <c:forEach items="${classification}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <select id="contraClassification" name="contraClassification" ${mand_status_7} class="form-control validate[required]">
                                                    <!--<option>${list.contraClassification}</option>-->
                                                    <option value="${list.contraClassification}">${list.contraClassification}</option>
                                                    <c:forEach items="${Dropdown}" var="list">
                                                        <c:if test="${list[0] eq 'F-19'}">
                                                            <option>${list[1]}</option>                                     
                                                        </c:if>
                                                    </c:forEach>
                                                </select>  
                                            <!--<input type="text" class="form-control" ${mand_status_7} readonly="" name="contraClassification" id="contraClassification" maxlength="50" value="${list.contraClassification}">-->
                                                <input type="hidden" class="form-control" ${mand_status_7} readonly="" name="contraClassification" id="contraClassification1" maxlength="50" value="${list.contraClassification}">

                                            </c:when>
                                            <c:otherwise>

                                                <input type="text" class="form-control" ${mand_status_7}  readonly="" name="contraClassification" maxlength="50" value="${list.contraClassification}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise> 
                                    <select id="contraClassification" name="contraClassification" ${mand_status_7} class="form-control validate[required]" onchange="test11();">
                                        <option value="" disabled selected>Select your option</option>
                                        <c:forEach items="${Dropdown}" var="list">
                                            <c:if test="${list[0] eq 'F-19'}">
                                                <option>${list[1]}</option>                                     
                                            </c:if>

                                        </c:forEach>
                                    </select>
<!--                                                        <input type="text" placeholder="Fill" class="form-control"  ${mand_status_7}  name="contraClassification" id="contraClassification" maxlength="50" value="">-->
                                    <input type="hidden" placeholder="Fill" class="form-control"  name="classificationId" id="classificationId" value="" maxlength="50">
                                </c:otherwise>        
                            </c:choose>
                            <label style="" class="control-label">${field_7}
                            <c:if test="${mand_status_7 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if>
                            </label>
                        </div>
                    </c:if>
                    
                    <c:if test="${fieldStatus_8 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3" >

                            <c:choose>
                                <c:when test="${fn:length(classification) > 0}">
                                    <c:forEach items="${classification}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <textarea name="contraClassficDesc" id="contraClassficDesc" class="form-control"  rows="1" maxlength="500" style="resize:none;">${list.contraClassficDesc}</textarea>
                                                <input id="contraClassficDesc1" class="form-control"  rows="1" maxlength="300" style="resize: none" type="hidden" value="${list.contraClassficDesc}">

                                                <input name="pk" type="hidden" value="${list.sno}">
                                                <input name="status" type="hidden" value="${list.status}">
                                                <input type="hidden" placeholder="Fill" class="form-control"  name="classificationId" id="classificationId" value="${list.classificationId}">
                                            </c:when>
                                            <c:otherwise>
                                                <textarea readonly="" class="form-control"  name="contraClassficDesc" maxlength="500" rows="1" style="resize:none;">${list.contraClassficDesc}</textarea>
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <textarea name="contraClassficDesc" class="form-control" placeholder="Fill" rows="1" maxlength="500" style="resize:none;"></textarea>
                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label">${field_8}</label>
                        </div>
                    </c:if>
                                        </div>
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
                            <a href="www.excelbizsolutions.com" target="_blank"
                              
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

                            <c:if test="${action ne 'view'}">
                                <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
                                    <button type="button" class="btn btn-primary" style="" onclick="test12();">Save</button>
                                    <a href="../master/contraClassificationList.htm" class="btn btn-danger">Cancel</a>
                                </div>
                            </c:if>
                            <c:if test="${action eq 'view' }">
                                <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
                                    <a href="../master/contraClassificationList.htm" class="btn btn-danger">Cancel</a>
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
