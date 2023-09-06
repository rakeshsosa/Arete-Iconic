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
                var penaltyType = document.getElementById("penaltyType").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../master/penaltyAvailabilty.htm',
                            data: {
                                penaltyType: penaltyType
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
                var penaltyM = document.getElementById("penaltyType").value &&
                        document.getElementById("penaltyAmount").value;
    
    
                if (penaltyM == '')
                {
                    alert("Please Fill Mandatory Fields in Penalty Type  Details");
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
                var ptype = document.getElementById("penaltyType").value;
                var ptype1 = document.getElementById("penaltyType1").value;
                var desc = document.getElementById("penaltyTypeDescription").value;
                var desc1 = document.getElementById("penaltyTypeDescription1").value;
                var pamount = document.getElementById("penaltyAmount").value;
                var pamount1 = document.getElementById("penaltyAmount1").value;
    
                if (document.getElementById("penaltyType").value == "")
                {
                    alert("Enter Penalty Type");
                    return false;
                } else if (document.getElementById("penaltyAmount").value == "")
                {
                    alert("Enter Penalty Amount");
                    return false;
                }
                else {
    
                    if (ptype !== ptype1 || desc !== desc1 || pamount !== pamount1) {
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
    //            var penaltyM = document.getElementById("penaltyType").value &&
    //                    document.getElementById("penaltyAmount").value;
    //
    //
    //            if (penaltyM == '')
    //            {
    //                alert("Please Fill Mandatory Fields in Penalty Type  Details");
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
        <jsp:include page="../login/headerlink.htm?submodule=Penalty Type&tab=Penalty Type&pagetype=form"/>
    </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
                <div class="card-title"><h5>Penalty Type Details</h5></div>
                <form id="userform" method="post" class="row" action="../master/penaltyTypeFormSubmit.htm">
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
                        <c:if test="${list[0] eq '695'}">
                            <c:set value="${list[1]}" var="field_621"/>
                            <c:set value="${list[2]}" var="fieldStatus_621"/>
                            <c:set value="${list[3]}" var="mand_status_621"/>
                        </c:if>
                        <c:if test="${list[0] eq '696'}">
                            <c:set value="${list[1]}" var="field_622"/>
                            <c:set value="${list[2]}" var="fieldStatus_622"/>
                            <c:set value="${list[3]}" var="mand_status_622"/>
                        </c:if>
                        <c:if test="${list[0] eq '697'}">
                            <c:set value="${list[1]}" var="field_623"/>
                            <c:set value="${list[2]}" var="fieldStatus_623"/>
                            <c:set value="${list[3]}" var="mand_status_623"/>
                        </c:if>

                    </c:forEach> 
                    <c:if test="${fieldStatus_621 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                            
                            <c:choose>
                                <c:when test="${fn:length(item) > 0}">
                                    <c:forEach items="${item}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input type="text" class="form-control" ${mand_status_621} autocomplete="off" maxlength="50" name="penaltyType" id="penaltyType" value="${list.penaltyType}" onchange="test11();" onkeypress="return isNumberKey4(event)">
                                                <input type="hidden" class="form-control" ${mand_status_621} autocomplete="off" maxlength="50" name="penaltyType1" id="penaltyType1" value="${list.penaltyType}" >
                                                <input name="pk" type="hidden" value="${list.sno}">
                                                <input name="status" type="hidden" value="${list.status}">
                                                <input type="hidden" placeholder="Fill" class="form-control"  name="penaltyType" id="penaltyType" value="${list.penaltyType}">
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" class="form-control" ${mand_status_621}  readonly="" name="penaltyType" value="${list.penaltyType}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>                                                    
                                    <input type="text"  class="form-control" placeholder="Fill" ${mand_status_621} autocomplete="off"  name="penaltyType" maxlength="50" id="penaltyType" value="" onchange="test11();" onkeypress="return isNumberKey4(event)">
                                    <input type="hidden" placeholder="Fill"  name="penaltyType" id="penaltyType" value="">
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
                                                <input type="text" class="form-control" ${mand_status_622} autocomplete="off" maxlength="50" name="penaltyTypeDescription" id="penaltyTypeDescription" value="${list.penaltyTypeDescription}">
                                                <input type="hidden" class="form-control" ${mand_status_622} autocomplete="off" maxlength="50" name="penaltyTypeDescription1" id="penaltyTypeDescription1" value="${list.penaltyTypeDescription}" >
                                                <input name="pk" type="hidden" value="${list.sno}">
                                                <input name="status" type="hidden" value="${list.status}">
                                                <input type="hidden" placeholder="Fill" class="form-control"  name="penaltyTypeDescription" id="penaltyTypeDescription" value="${list.penaltyTypeDescription}">
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" class="form-control" ${mand_status_622}  readonly="" name="penaltyTypeDescription" value="${list.penaltyTypeDescription}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>                                                    
                                    <input type="text"  class="form-control" placeholder="Fill" ${mand_status_622} autocomplete="off"  name="penaltyTypeDescription" maxlength="50" id="penaltyTypeDescription" value="">
                                    <input type="hidden" placeholder="Fill" name="penaltyTypeDescription" id="penaltyTypeDescription" value="">
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
                    
                    <c:if test="${fieldStatus_623 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                            <c:if test="${mand_status_623 eq 'required'}">
                                
                            </c:if>
                            
                            <c:choose>
                                <c:when test="${fn:length(item) > 0}">
                                    <c:forEach items="${item}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input type="text" class="form-control" ${mand_status_623} autocomplete="off" maxlength="50" name="penaltyAmount" id="penaltyAmount" value="${list.penaltyAmount}" onkeypress="return isNumberKey(event)">
                                                <input type="hidden" class="form-control" ${mand_status_623} autocomplete="off" maxlength="50" name="penaltyAmount1" id="penaltyAmount1" value="${list.penaltyAmount}" >
                                                <input name="pk" type="hidden" value="${list.sno}">
                                                <input name="status" type="hidden" value="${list.status}">
                                                <input type="hidden" placeholder="Fill" class="form-control"  name="penaltyAmount" id="penaltyAmount" value="${list.penaltyAmount}">
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" class="form-control" ${mand_status_623}  readonly="" name="penaltyAmount" value="${list.penaltyAmount}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>                                                    
                                    <input type="text"  class="form-control" placeholder="Fill" ${mand_status_622} autocomplete="off"  name="penaltyAmount" maxlength="50" id="penaltyAmount" value="" onkeypress="return isNumberKey(event)" >
                                    <input type="hidden" placeholder="Fill"  name="penaltyAmount" id="penaltyAmount" value="">
                                    <input name="status" type="hidden" value="">
                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label">${field_623} <a style="color:red;">*</a></label>
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
                            <label class="control-label col-md-4" style="width:150px"></label>
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
                            <label class="control-label  col-md-4" style="width:150px"></label>
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
                            <label class="control-label col-md-4" style="width:150px"></label>
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
                            <label class="control-label  col-md-4" style="width:150px"></label>
                        </div>
                    </c:if>

                    <c:if test="${action ne 'view'}">

                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                            <button type="button" class="btn btn-primary" style="" onclick="return mandTest();">Save</button>
                            <a href="../master/penaltyTypeList.htm" class="btn btn-danger">Cancel</a>
                        </div>

                    </c:if>

                    <c:if test="${action eq 'view'  }">

                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                            <a href="../master/penaltyTypeList.htm" class="btn btn-danger">Cancel</a>
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
