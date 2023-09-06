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
                var itemCategory = document.getElementById("itemCategory").value;
                //alert(contractCategory);
                $.ajax
                        ({
                            type: "POST",
                            url: '../master/itemCatAvailabilty.htm',
                            data: {
                                itemCategory: itemCategory
                            },
                            success: function (data) {
    
                                if ($.trim(data) == 'Already Exists.Enter another') {
    
    
                                    alert("This Record Already Exist");
                                    document.getElementById("itemCategory").value = "";
    
                                    return false;
                                }
    
                                // test12();
                            }
    
    
                        });
            }
    
            //method to validate Mandatory and submit form       
    //        function test12()
    //        {
    //            if (document.getElementById("itemCategory").value == "")
    //            {
    //                alert("Enter Item Category");
    //                return false;
    //            }
    //            else {
    //
    //                document.forms["userform"].submit();
    //            }
    //
    //        }
    
            function test()
            {
    
                var desc = document.getElementById("categoryDesc").value;
                var desc1 = document.getElementById("categoryDesc1").value;
                if (document.getElementById("itemCategory").value == "")
                {
                    alert("Enter Accessory Category");
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
    
    //        function test()
    //        {
    //            if (document.getElementById("itemCategory").value == "")
    //            {
    //                alert("Enter Item Category");
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
        <jsp:include page="../login/headerlink.htm?submodule=Accessory Details&tab=Accessory Category&pagetype=form"/>
    </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
                <div class="card-title"><h5>Accessory Category Details</h5></div>
                <form id="userform" method="post" class="row" action="../master/itemCategorySubmit.htm" onsubmit="return test12();">
                    <c:choose>
                        <c:when test="${fn:length(item) > 0}">
                            <c:forEach items="${item}" var="list">
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
                    <c:forEach items="${tablink}" var="list">                                       
                        <c:if test="${list[0] eq '436'}">
                            <c:set value="${list[1]}" var="field_436"/>
                            <c:set value="${list[2]}" var="fieldStatus_436"/>
                            <c:set value="${list[3]}" var="mand_status_436"/>
                        </c:if>
                        <c:if test="${list[0] eq '437'}">
                            <c:set value="${list[1]}" var="field_437"/>
                            <c:set value="${list[2]}" var="fieldStatus_437"/>
                            <c:set value="${list[3]}" var="mand_status_437"/>
                        </c:if>

                    </c:forEach>                                          

                    <c:if test="${fieldStatus_436 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                           
                            
                            <c:choose>
                                <c:when test="${fn:length(item) > 0}">
                                    <c:forEach items="${item}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input type="text" class="form-control" ${mand_status_436} autocomplete="off" maxlength="50" name="itemCategory" id="itemCategory" value="${list.itemCategory}" onchange="test11();">
                                                <input type="hidden" class="form-control" ${mand_status_436} autocomplete="off" maxlength="50" name="itemCategory1" id="itemCategory1" value="${list.itemCategory}">
                                                <input name="pk" type="hidden" value="${list.sno}">
                                                <input name="status" type="hidden" value="${list.status}">
                                                <input type="hidden" placeholder="Fill" class="form-control"  name="categoryId" id="categoryId" value="${list.categoryId}">
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" class="form-control" ${mand_status_436}  readonly="" name="itemCategory" value="${list.itemCategory}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>                 
                                    <input type="text"  class="form-control"  ${mand_status_436} autocomplete="off"  name="itemCategory" placeholder="Fill" maxlength="50" id="itemCategory" onchange="test11();" >
                                    <input type="hidden" placeholder="Fill" name="categoryId" id="categoryId" value="">
                                    <input name="status" type="hidden" value="">
                                </c:otherwise>        
                            </c:choose>
                                     <c:if test="${mand_status_436 eq 'required'}">
                                 <label class="control-label">${field_436}
                            <a style="color:red;">*</a>
                            </label>
                            </c:if>
                          
                        </div>
                    </c:if>
                    
                    <c:if test="${fieldStatus_437 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                            
                            <c:choose>
                                <c:when test="${fn:length(item) > 0}">
                                    <c:forEach items="${item}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input name="categoryDesc" id="categoryDesc" class="form-control" maxlength="300" rows="1" style="resize: none" value="${list.categoryDesc}">
                                                <input id="categoryDesc1" class="form-control"  rows="1" maxlength="300" style="resize: none" type="hidden" value="${list.categoryDesc}">

                                            </c:when>
                                            <c:otherwise>
                                                <input readonly="" class="form-control"  name="categoryDesc" rows="1" style="resize: none">${list.categoryDesc}
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <input placeholder="FIll" name="categoryDesc" class="form-control" maxlength="300" rows="1" placeholder="Fill">
                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label">${field_437}</label>
                        </div>
                    </c:if>
                    
                    <c:if test="${fieldStatus_3 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">                                            
                            
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
                        <div class="col-md-4 form-floating mb-3">                                            
                            
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
                        <div class="col-md-4 form-floating mb-3">                                               
                            
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
                        <div class="col-md-4 form-floating mb-3">

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
                        <div class="col-md-4 form-floating mb-3">

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


                    <c:if test="${action ne 'view' && action ne 'edit'}">

                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                            <button type="submit" class="btn btn-primary" style="">Save</button>
                            <a href="../master/itemCategoryList.htm" class="btn btn-danger">Cancel</a>
                        </div>

                    </c:if>

                    <c:if test="${action eq 'edit'  }">

                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                            <button type="button" class="btn btn-primary" style="" onclick="return test();">Save</button>
                            <a href="../master/itemCategoryList.htm" class="btn btn-danger">Cancel</a>
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
