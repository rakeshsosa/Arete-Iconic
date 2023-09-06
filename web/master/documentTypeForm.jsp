<%-- 
    Document   : documentTypeForm
    Created on : 7 Jan, 2022, 6:50:51 PM
    Author     : buvan
--%>
<%-- 
    Document   : documentCategoryForm
    Created on : 7 Jan, 2022, 6:41:12 PM
    Author     : buvan
--%>
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
                   <jsp:include page="../login/headerlink.htm?submodule=Document Type&tab=Document Type&pagetype=form"/>

       </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
                <div class="card-title"><h5>Document Type Details</h5></div>
                <form id="userform" method="post" class="row" action="../master/documentTypeFormSubmit.htm">
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

              

                
<!--                        <div class="col-md-4 form-floating mb-3">
                      
                            <c:choose>
                                <c:when test="${fn:length(DocumentTyeList) > 0}">
                                    <c:forEach items="${DocumentTyeList}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <select id="documentType"  name="documentType" class="form-control validate[required]" onchange="test11();">
                                                    <option selected  value="${list.documentType}">${list.documentType}</option>
                                                    <option disabled="" value="">Select your option</option>
                                                    <c:forEach items="${Dropdown}" var="list">
                                                        <c:if test="${list[0] eq 'F-12'}">
                                                            <option>${list[1]}</option>                                     
                                                        </c:if>
                                                    </c:forEach>  
                                                </select> 
                                            </c:when>
                                            <c:otherwise>

                                                <input type="text" class="form-control" maxlength="50" name="documentType" id="documentType" readonly="" value="${list.documentType}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>  
                                    <select id="documentType" name="documentType" class="form-select validate[required]" >
                                        <option value="" disabled selected>Select your option</option>
                                        <c:forEach items="${Dropdown}" var="list">
                                            <c:if test="${list[0] eq 'F-12'}">
                                                <option>${list[1]}</option>                                     
                                            </c:if>

                                        </c:forEach>
                                    </select>                              
                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label">Document Type Name <a style="color:red;">*</a></label>
                        </div>
                -->
                    
                       <div class="col-md-4 form-floating mb-3"> 
                        
                        <c:choose>
                            <c:when test="${fn:length(DocumentTyeList) > 0}">
                                <c:forEach items="${DocumentTyeList}" var="list">
                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">
                                            <input class="form-control" name="documentType"  id="documentType" autocomplete="off" maxlength="50" type="text" value="${list.documentType}">
                            
                                        </c:when>
                                        <c:otherwise>
                                            <input class="form-control" autocomplete="off" type="text" readonly="" value="${list.documentType}">
                                        </c:otherwise> 
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <input class="form-control" placeholder="Fill" name="documentType"  id="documentType" autocomplete="off" maxlength="50" type="text" value="${list.documentType}">
                            </c:otherwise>        
                        </c:choose>
                        <label class="control-label">Document Type Name</label>
                    </div>

                        <div class="col-md-4 form-floating mb-3">
                            
                            <c:choose>
                                <c:when test="${fn:length(DocumentTyeList) > 0}">
                                    <c:forEach items="${DocumentTyeList}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <textarea name="typeDesc" placehoder="Fill" id="typeDesc" class="form-control" rows="1" maxlength="500">${list.typeDesc}</textarea>
                                             
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" readonly="" class="form-control"  name="typeDesc" maxlength="500" value="${list.typeDesc}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <textarea name="typeDesc" placehoder="Fill" class="form-control" rows="1" maxlength="500"></textarea>
                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label">Description</label>
                        </div>
                 
               <div class="col-md-4 form-floating mb-3">
                            
                            <c:choose>
                                <c:when test="${fn:length(DocumentTyeList) > 0}">
                                    <c:forEach items="${DocumentTyeList}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <textarea name="remarks" placehoder="Fill" id="remarks" class="form-control" rows="1" maxlength="500">${list.remarks}</textarea>
                                             
                                            </c:when>
                                            <c:otherwise>
                                                <textarea readonly="" class="form-control"  name="remarks" rows="1" maxlength="500" style="resize: none">${list.remarks}</textarea>
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <textarea name="remarks" placehoder="Fill" class="form-control" rows="1" maxlength="500"></textarea>
                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label">Remarks</label>
                        </div>

                    <c:if test="${action ne 'view'}">

                        <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
                            <button type="submit" class="btn btn-primary" style="">Save</button>
                            <a href="../master/documenTypeList.htm" class="btn btn-danger">Cancel</a>
                        </div>

                    </c:if>

                    <c:if test="${action eq 'view'  }">

                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                            <a href="../master/documenTypeList.htm" class="btn btn-danger">Cancel</a>
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
