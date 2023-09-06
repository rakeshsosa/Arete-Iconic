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
       
    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>
           <jsp:include page="../login/footer.jsp"/>    
                                
    <main id="main" class="main">
       <div class="mt-3">
        <jsp:include page="../login/headerlink.htm?submodule=Terms and Conditions&tab=${tab}&pagetype=form"/>
    </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
                <div class="card-title"><h5>${tab}</h5></div>
                <form class="row" action="../master/termsSubmit.htm" method="post" id="termsForm">
                    <c:choose>
                        <c:when test="${fn:length(termslist) > 0}">
                            <c:forEach items="${termslist}" var="list">
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
                    <c:if test="${tab eq 'Payment Terms'}">
                        <input name="termType" id="termType" type="hidden" value="Payment">
                    </c:if>
                    <c:if test="${tab eq 'Delivery Terms'}">
                        <input name="termType" id="termType" type="hidden" value="Delivery">
                    </c:if>    
                    <div class="col-md-4 form-floating mb-3">
                        
                        <c:choose>
                            <c:when test="${fn:length(termslist) > 0}">
                                <c:forEach items="${termslist}" var="type">
                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">
                                            <input class="form-control validate[required]" autocomplete="off" id="termCode" name="termCode" onchange="uniqueTerms();" type="text" value="${type.termCode}" maxlength="10" style="text-transform:uppercase">
                                            <input name="pk" type="hidden" value="${type.sno}">
                                            <input name="status" type="hidden" value="${type.status}">
                                        </c:when>
                                        <c:otherwise>
                                            <input class="form-control" readonly type="text" value="${type.termCode}">
                                        </c:otherwise> 
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>


                                <input class="form-control  validate[required]" id="termCode" autocomplete="off" type="text" name="termCode" value="" maxlength="10" placeholder="Fill" onchange="uniqueTerms();">
                            </c:otherwise>        
                        </c:choose>
                        <label class="control-label"> Term Code <span style="color: red">*</span></label>
                    </div>

                    <div class="col-md-4 form-floating mb-3">
                        
                        <c:choose>
                            <c:when test="${fn:length(termslist) > 0}">
                                <c:forEach items="${termslist}" var="type">
                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">
                                            <input class="form-control validate[required]" autocomplete="off" id="termName"  name="termName" type="text" value="${type.termName}" maxlength="100" onchange="uniqueTerms();"> 
                                            <input class="form-control validate[required]" autocomplete="off" id="termName1"  name="termName1" type="hidden" value="${type.termName}" maxlength="100" > 
                                        </c:when>
                                        <c:otherwise>
                                            <input class="form-control" readonly type="text" value="${type.termName}">
                                        </c:otherwise> 
                                    </c:choose>

                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <input class="form-control validate[required]" autocomplete="off" id="termName" name="termName" type="text" placeholder="Fill" value="" maxlength="100" onchange="uniqueTerms();">
                            </c:otherwise>        
                        </c:choose>
                        <label class="control-label" style="padding-right: 20px;"> Term Name <span style="color: red">*</span></label>
                    </div>

                    <div class="col-md-4 form-floating mb-3">

                        <c:choose>
                            <c:when test="${fn:length(termslist) > 0}">
                                <c:forEach items="${termslist}" var="type">
                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">
                                            <input class="form-control" autocomplete="off" id="termDesc" name="termDesc" type="text" value="${type.termDesc}" maxlength="200"> 
                                            <input class="form-control" autocomplete="off" id="termDesc1" name="termDesc1" type="hidden" value="${type.termDesc}" maxlength="200"> 
                                        </c:when>
                                        <c:otherwise>
                                            <input class="form-control" readonly type="text" value="${type.termDesc}">
                                        </c:otherwise> 
                                    </c:choose>

                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <input class="form-control" id="termDesc" autocomplete="off" placeholder="Fill" name="termDesc" type="text" value="" maxlength="200">
                            </c:otherwise>        
                        </c:choose>
                        <label class="control-label">Term Description</label>

                    </div>



                    <c:if test="${action ne 'view'}">
                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                            <button type="submit" class="btn btn-primary">Save</button>
                            <c:if test="${tab eq 'Payment Terms'}">
                                <a href="../master/paytermList.htm" class="btn btn-danger">Cancel</a>
                            </c:if>
                            <c:if test="${tab eq 'Delivery Terms'}">
                                <a href="../master/deltermList.htm" class="btn btn-danger">Cancel</a>
                            </c:if>

                        </div>
                
            </c:if>

            <c:if test="${action eq 'view'  }">

                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                    <c:if test="${tab eq 'Payment Terms'}">
                        <a href="../master/paytermList.htm" class="btn btn-danger">Cancel</a>
                    </c:if>
                    <c:if test="${tab eq 'Delivery Terms'}">
                        <a href="../master/deltermList.htm" class="btn btn-danger">Cancel</a>
                    </c:if>
                </div>

            </c:if>
            </form>
            </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->


<script>
    NProgress.done();
    function isNumberKey(evt) {
        debugger;
        var charCode = (evt.which) ? evt.which : event.keyCode;
        if (charCode == 46 && evt.srcElement.value.split('.').length > 1) {
            return false;
        }
        if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
        return true;
    }

    function test()
    {
        var comp = document.getElementById("termName").value;
        var comp1 = document.getElementById("termName1").value;
        var desc = document.getElementById("termDesc").value;
        var desc1 = document.getElementById("termDesc1").value;

        if((document.getElementById("termName").value == "")||(document.getElementById("termCode").value == ""))
        {
            alert("Enter mandetory fields");
            return false;
        }
        else {

            if (comp !== comp1 || desc !== desc1) {
                if (confirm('Do you really want to Save this updated record')) {
                    document.forms["termsForm"].submit();
                    return true;
                } else {
                    return true;
                }

            } else {
                document.forms["termsForm"].submit();
            }
        }

    }

    function validate() {
        var code = $("#curCode").val();
    <c:forEach items="${currencylist1}" var="list">
        var code1 = '${list.currencyCode}';
        if (code === code1) {
            alert(code + " already added to List");
            return false;
        }
    </c:forEach>
        return true;
    }

//                        function uniqueTerms() {
//                            var termType = document.getElementById("termType").value;
//                            var termCode = document.getElementById("termCode").value;
//                            $.ajax({
//                                type: "POST",
//                                url: '../master/getTerms.htm',
//                                data: {
//                                    termCode: termCode,
//                                    termType: termType,
//                                },
//                                success: function (data) {
//                                    if ($.trim(data) == 'Already Exists.') {
//                                        alert("Term Already Exist");
//                                        document.getElementById("termCode").value = "";
//                                        return false;
//                                    }
//                                }
//                            });
//                        }

    $(document).ready(function () {
        jQuery("#termsForm").validationEngine();
    });
</script>
    </body>

</html>
