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
            function test11() {
                var serviceRequested = document.getElementById("serviceRequested").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../master/serviceAvailabilty.htm',
                            data: {
                                serviceRequested: serviceRequested
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("serviceRequested").value = "";
                                    return false;
                                }
                            }
                        });
            }
    
            function mandTest() {
                var serviceM = document.getElementById("serviceRequested").value &&
                        document.getElementById("serviceRequestedCost").value;
    
    
                if (serviceM == '')
                {
                    alert("Please Fill Mandatory Fields in Service Request Details");
                    return false;
                }
    
                else {
                    document.forms["userform"].submit();
                }
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
    
    
            function test()
            {
                var comp = document.getElementById("serviceRequested").value;
                var comp1 = document.getElementById("serviceRequested1").value;
                var desc = document.getElementById("serviceRequestedCost").value;
                var desc1 = document.getElementById("serviceRequestedCost1").value;
    
                if (document.getElementById("serviceRequested").value == "")
                {
                    alert("Enter Service Request");
                    return false;
                } else if (document.getElementById("serviceRequestedCost").value == "")
                {
                    alert("Enter Service RequestedCost");
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
    //            var serviceM = document.getElementById("serviceRequested").value &&
    //                    document.getElementById("serviceRequestedCost").value;
    //
    //
    //            if (serviceM == '')
    //            {
    //                alert("Please Fill Mandatory Fields in Service Request Details");
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
               
        <jsp:include page="../login/footer.jsp"/>
                        
    <main id="main" class="main">
        <div class="mt-3">
        <jsp:include page="../login/headerlink.htm?submodule=Service Request Type&tab=Service Request Type&pagetype=form"/>
    </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
                <div class="card-title"><h5>Service Request Type Details</h5></div>
                <form id="userform" method="post" class="row" action="../master/serviceRequestTypeSubmit.htm">
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
                        <c:if test="${list[0] eq '621'}">
                            <c:set value="${list[1]}" var="field_621"/>
                            <c:set value="${list[2]}" var="fieldStatus_621"/>
                            <c:set value="${list[3]}" var="mand_status_621"/>
                        </c:if>
                        <c:if test="${list[0] eq '622'}">
                            <c:set value="${list[1]}" var="field_622"/>
                            <c:set value="${list[2]}" var="fieldStatus_622"/>
                            <c:set value="${list[3]}" var="mand_status_622"/>
                        </c:if>

                    </c:forEach> 
                    <c:if test="${fieldStatus_621 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                            
                            <c:choose>
                                <c:when test="${fn:length(item) > 0}">
                                    <c:forEach items="${item}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input type="text" class="form-control" ${mand_status_621} autocomplete="off" maxlength="50" name="serviceRequested" id="serviceRequested" value="${list.serviceRequested}" onchange="test11();" onkeypress="return isNumberKey4(event)">
                                                <input type="hidden" class="form-control" ${mand_status_621} autocomplete="off" maxlength="50" name="serviceRequested1" id="serviceRequested1" value="${list.serviceRequested}" >
                                                <input name="pk" type="hidden" value="${list.sno}">
                                                <input name="status" type="hidden" value="${list.status}">
                                                <input type="hidden" placeholder="Fill" class="form-control"  name="serviceRequested" id="serviceRequested" value="${list.serviceRequested}">
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" class="form-control" ${mand_status_621}  readonly="" name="serviceRequested" value="${list.serviceRequested}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>                                                    
                                    <input type="text"  class="form-control" placeholder="Fill"  ${mand_status_621} autocomplete="off"  name="serviceRequested" maxlength="50" id="serviceRequested" onchange="test11();" onkeypress="return isNumberKey4(event)">
                                    <input type="hidden" placeholder="Fill" name="serviceRequested" id="serviceRequested" value="">
                                    <input name="status" type="hidden" value="">
                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label">${field_621}
                            <c:if test="${mand_status_621 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if>
                            </label>
                        </div>
                    </c:if>
                    
                    <c:if test="${fieldStatus_622 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                            
                            <c:choose>
                                <c:when test="${fn:length(item) > 0}">
                                    <c:forEach items="${item}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input type="text" class="form-control" ${mand_status_622} autocomplete="off" maxlength="50" name="serviceRequestedCost" id="serviceRequestedCost" value="${list.serviceRequestedCost}" onkeypress="return isNumberKey(event)">
                                                <input type="hidden" class="form-control" ${mand_status_622} autocomplete="off" maxlength="50" name="serviceRequestedCost1" id="serviceRequestedCost1" value="${list.serviceRequestedCost}" >
                                                <input name="pk" type="hidden" value="${list.sno}">
                                                <input name="status" type="hidden" value="${list.status}">
                                                <input type="hidden" placeholder="Fill" class="form-control"  name="serviceRequestedCost" id="serviceRequestedCost" value="${list.serviceRequestedCost}">
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" class="form-control" ${mand_status_622}  readonly="" name="serviceRequestedCost" value="${list.serviceRequestedCost}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>                                                    
                                    <input type="text"  class="form-control" placeholder="Fill" ${mand_status_622} autocomplete="off"  name="serviceRequestedCost" maxlength="50" id="serviceRequestedCost" value="" onkeypress="return isNumberKey(event)" >
                                    <input type="hidden" placeholder="Fill"  name="serviceRequestedCost" id="serviceRequestedCost" value="">
                                    <input name="status" type="hidden" value="">
                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label">${field_622}
                            <c:if test="${mand_status_622 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if>
                            </label>
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


                    <c:if test="${action ne 'view'}">

                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                            <button type="button" class="btn btn-primary" style="" onclick="return mandTest();">Save</button>
                            <a href="../master/serviceRequestTypeList.htm" class="btn btn-danger">Cancel</a>
                        </div>

                    </c:if>

                    <c:if test="${action eq 'view'  }">

                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                            <a href="../master/serviceRequestTypeList.htm" class="btn btn-danger">Cancel</a>
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
