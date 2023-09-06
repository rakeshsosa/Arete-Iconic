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
    
                var contractCategory = document.getElementById("contractCategory").value;
    
                $.ajax
                        ({
                            type: "POST",
                            url: '../master/CategoryAvailabilty.htm',
                            data: {
                                contractCategory: contractCategory
                            },
                            success: function (data) {
    
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    //alert("This Record Already Exist");
                                    //document.getElementById("contractCategory").value = "";
                                    return true;
                                }
    
                            }
    
    
                        });
            }
    
            function test()
            {
    
                var cdesc = document.getElementById("categoryDesc").value;
                var cdesc1 = document.getElementById("categoryDesc1").value;
                var ccategory = document.getElementById("contractCategory").value;
                
                if (document.getElementById("contractCategory").value == "")
                {
                    alert("Enter Contract category");
                    return false;
                }
                else
                if (cdesc !== cdesc1) {
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
                   <jsp:include page="../login/headerlink.htm?submodule=Masters&tab=Contract Category&pagetype=form"/>

       </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
                <div class="card-title"><h5>Contract Category Details</h5></div>
                <form id="userform" method="post" class="row" action="../master/contractCategoryFormSubmit.htm">
                    <c:choose>
                        <c:when test="${fn:length(categorylst) > 0}">
                            <c:forEach items="${categorylst}" var="list">
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
                        <c:if test="${list[0] eq '3'}">
                            <c:set value="${list[1]}" var="field_3"/>
                            <c:set value="${list[2]}" var="fieldStatus_3"/>
                            <c:set value="${list[3]}" var="mand_status_3"/>
                        </c:if>
                        <c:if test="${list[0] eq '4'}">
                            <c:set value="${list[1]}" var="field_4"/>
                            <c:set value="${list[2]}" var="fieldStatus_4"/>
                            <c:set value="${list[3]}" var="mand_status_4"/>
                        </c:if>

                    </c:forEach> 

                    <c:if test="${fieldStatus_3 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                            <c:if test="${mand_status_3 eq 'required'}">

                            </c:if>
                            
                            <c:choose>
                                <c:when test="${fn:length(categorylst) > 0}">
                                    <c:forEach items="${categorylst}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <select id="contractCategory"  name="contractCategory" ${mand_status_3} class="form-control validate[required]" onchange="test11();">
                                                    <!--<option selected  value="${list.contractCategory}">${list.contractCategory}</option>-->
                                                    <option disabled="" value="">Select your option</option>
                                                    <c:forEach items="${Dropdown}" var="list">


                                                        <c:if test="${list[0] eq 'F-12'}">
                                                            <option>${list[1]}</option>                                     
                                                        </c:if>
                                                    </c:forEach>  
                                                </select> 
                                                  <!--<input type="text" class="form-control" ${mand_status_3} readonly="" maxlength="50" name="contractCategory" id="contractCategory" value="${list.contractCategory}">-->
                                            </c:when>
                                            <c:otherwise>

                                                <input type="text" class="form-control col-md-4" ${mand_status_3} readonly="" maxlength="50" name="contractCategory" id="contractCategory" value="${list.contractCategory}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>  
                                    <select id="contractCategory" name="contractCategory" ${mand_status_3} class="form-select validate[required]" onchange="test11();">
                                        <option value="" disabled selected>Select your option</option>
                                        <c:forEach items="${Dropdown}" var="list">
                                            <c:if test="${list[0] eq 'F-12'}">
                                                <option>${list[1]}</option>                                     
                                            </c:if>

                                        </c:forEach>
                                    </select>                              
                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label">${field_3} <a style="color:red;">*</a></label>
                        </div>
                    </c:if>
                    
                    <c:if test="${fieldStatus_4 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                            
                            <c:choose>
                                <c:when test="${fn:length(categorylst) > 0}">
                                    <c:forEach items="${categorylst}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <textarea name="categoryDesc" id="categoryDesc" class="form-control col-md-4"  rows="1" maxlength="500" style="resize: none">${list.categoryDesc}</textarea>
                                                <input id="categoryDesc1" id="categoryDesc1" class="form-control col-md-4"  rows="1" maxlength="500" style="resize: none" type="hidden" value="${list.categoryDesc}">
                                                <input type="hidden"name="categoryId" value="${list.contractCategoryId}">
                                                <input name="pk" type="hidden" value="${list.sno}">
                                                <input name="status" type="hidden" value="${list.status}">
                                            </c:when>
                                            <c:otherwise>
                                                <textarea readonly="" class="form-control col-md-4"  name="categoryDesc" rows="1" maxlength="500" style="resize: none">${list.categoryDesc}</textarea>
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <textarea name="categoryDesc" class="form-control" placeholder="Fill" rows="1" maxlength="500" style="resize: none"></textarea>
                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label">${field_4}</label>
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

                    <c:if test="${action ne 'view'}">
                        <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
                            <button type="submit" class="btn btn-primary" style="">Save</button>
                            <a href="../master/contractCategoryList.htm" class="btn btn-danger">Cancel</a>
                        </div>
                    </c:if>

                    <c:if test="${action eq 'view'  }">
                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                            <a href="../master/contractCategoryList.htm" class="btn btn-danger">Cancel</a>
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
