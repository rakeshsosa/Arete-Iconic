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
            function test12()
            {
                if (document.getElementById("complaintType").value == "")
                {
                    alert("Enter Complaint Type");
                    return false;
                }
                else {

                    document.forms["paymentform"].submit();
                }

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
                var complaintType = document.getElementById("complaintType").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../master/fetchcomplaintType.htm',
                            data: {
                                complaintType: complaintType
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("complaintType").value = "";
                                    return false;
                                }
                            }
                        });
            }

            function test()
            {
                var comp = document.getElementById("complaintType").value;
                var comp1 = document.getElementById("complaintType1").value;
                var desc = document.getElementById("typeDesc").value;
                var desc1 = document.getElementById("typeDesc1").value;

                if (document.getElementById("complaintType").value == "")
                {
                    alert("Enter Complaint Type");
                    return false;
                }
                else {

                    if (comp !== comp1 || desc !== desc1) {
                        if (confirm('Do you really want to Save this updated record')) {
                            document.forms["paymentform"].submit();
                            return true;
                        } else {
                            return true;
                        }

                    } else {
                        document.forms["paymentform"].submit();
                    }
                }

            }

//            function test() {
//                if (document.getElementById("complaintType").value == "")
//                {
//                    alert("Enter Complaint Type");
//                    return false;
//                }
//                else {
//                    if (confirm('Do you really want to Save this updated record')) {
//                        document.forms["paymentform"].submit();
//                        return true;
//                    } else {
//                        return false;
//                    }
//
//                }
//
//            }
        </script>
    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>
           <jsp:include page="../login/footer.jsp"/>
    
                                
    <main id="main" class="main">
        <div class="mt-3">
        <jsp:include page="../login/headerlink.htm?submodule=Masters&tab=Complaint Type&pagetype=form"/>
    </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
                <div class="card-title"><h5>Complaint Type Details</h5></div>
                
                <form id="paymentform" class="row" action="../master/complaintTypeFormSubmit.htm">
                    <c:choose>
                        <c:when test="${fn:length(complaintType) > 0}">
                            <c:forEach items="${complaintType}" var="list">
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
                        <c:if test="${list[0] eq '705'}">
                            <c:set value="${list[1]}" var="field_705"/>
                            <c:set value="${list[2]}" var="fieldStatus_705"/>
                            <c:set value="${list[3]}" var="mand_status_705"/>
                        </c:if>
                        <c:if test="${list[0] eq '706'}">
                            <c:set value="${list[1]}" var="field_706"/>
                            <c:set value="${list[2]}" var="fieldStatus_706"/>
                            <c:set value="${list[3]}" var="mand_status_706"/>
                        </c:if>

                    </c:forEach> 
                    <c:if test="${fieldStatus_705 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                            
                            <c:choose>
                                <c:when test="${fn:length(complaintType) > 0}">
                                    <c:forEach items="${complaintType}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">

                                                <input type="text" class="form-control" ${mand_status_705} id="complaintType" name="complaintType" value="${list.complaintType}" maxlength="30">
                                                <input type="hidden" class="form-control" ${mand_status_705} id="complaintType1" name="complaintType1" value="${list.complaintType}" maxlength="30">
                                                <input type="hidden" name="pk" value="${list.sno}">
                                                <input type="hidden" name="status" value="${list.status}">
                                                <input type="hidden" name="complaintCode" value="${list.complaintCode}">
                                                <input type="hidden" name="creationDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.creationDate}"/>">
                                            </c:when>
                                            <c:otherwise>

                                                <input type="text" class="form-control" readonly="" name="complaintType" value="${list.complaintType}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>                                                    
                                    <input type="text" placeholder="Fill" class="form-control"  ${mand_status_705}  name="complaintType" id="complaintType" maxlength="30" value="" onchange="fetchType();">
                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label">${field_705}
                            <c:if test="${mand_status_705 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if>
                            </label>
                        </div>
                    </c:if>
                    
                    <c:if test="${fieldStatus_706 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                           
                            <c:choose>
                                <c:when test="${fn:length(complaintType) > 0}">
                                    <c:forEach items="${complaintType}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <textarea name="typeDesc" id="typeDesc" class="form-control" ${mand_status_706} rows="1" style="resize: none" name="typeDesc" maxlength="200" >${list.typeDesc}</textarea>
                                                <input id="typeDesc1" class="form-control"  rows="1" maxlength="300" style="resize: none" type="hidden" value="${list.typeDesc}">

                                            </c:when>
                                            <c:otherwise>
                                                <textarea readonly="" class="form-control" rows="1" name="typeDesc" style="resize: none">${list.typeDesc}</textarea>
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <textarea name="typeDesc" class="form-control" ${mand_status_706} rows="1" placeholder="Fill" style="resize: none" maxlength="200"></textarea>
                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label">${field_706}
                            <c:if test="${mand_status_706 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if>
                            </label>
                        </div>
                    </c:if>                                 
                       
                    <c:if test="${action ne 'view'}">

                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                            <button type="button" class="btn btn-primary" style="" onclick="test12();">Save</button>
                            <a href="../master/complaintTypeList.htm" class="btn btn-danger">Cancel</a>
                        </div>
                    </c:if>
                    <c:if test="${action eq 'view'}">

                        <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
                            <a href="../master/complaintTypeList.htm" class="btn btn-danger">Cancel</a>
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
