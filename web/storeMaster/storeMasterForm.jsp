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
        <title>Arete Assets Management</title>
        <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
    </head>
       
    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>
               
         <jsp:include page="../login/footer.jsp"/>
                       
    <main id="main" class="main">
        <div class="mt-3">
        <jsp:include page="../login/headerlink.htm?submodule=Store Master&tab=Store Master&pagetype=form"/>
    </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
                <div class="card-title"><h5>Store Master Form</h5></div>
               
                <form class="row" action="../master/storeSubmit.htm" method="post" id="imForm">
                    <c:choose>
                        <c:when test="${fn:length(storelist) > 0}">
                            <c:forEach items="${storelist}" var="list">
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
                    <div class="col-md-4 form-floating mb-3">
                     

                        <c:choose>
                            <c:when test="${fn:length(storelist) > 0}">
                                <c:forEach items="${storelist}" var="type">
                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">
                                            <!--<input class="form-control validate[required]" required="" autocomplete="off" readonly id="division" name="division" type="text" value="${type.division}" maxlength="100">--> 

                                            <select class="form-control validate[required]"  id="division" name="division" >
                                                <option value="" disabled="">Select an option</option>
                                                <c:forEach items="${orglist}" var="org">                                                                
                                                    <option value="${org.orgCode}">${org.orgCode}</option> 
                                                </c:forEach>
                                            </select>
                                            <input name="pk" type="hidden" value="${type.sno}">
                                            <input name="status" type="hidden" value="${type.status}">
                                        </c:when>
                                        <c:otherwise>
                                            <input class="form-control"  readonly type="text" name="division" value="${type.division}">
                                        </c:otherwise> 
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>

                                <select class="form-select validate[required]" placeholder="Fill" id="division" name="division" >
                                    <option value="">Select an option</option>
                                    <c:forEach items="${orglist}" var="org">                                                                
                                        <option value="${org.orgCode}">${org.orgCode}</option> 
                                    </c:forEach>
                                </select>
                                <!--<input class="form-control" required="" autocomplete="off" id="division" name="division" type="text" value="" maxlength="100">-->
                            </c:otherwise>        
                        </c:choose>
                       <label class="control-label"><span style="color: red">*</span> Division</label>
                    </div>
                    <div class="col-md-4 form-floating mb-3">
                      

                        <c:choose>
                            <c:when test="${fn:length(storelist) > 0}">
                                <c:forEach items="${storelist}" var="type">
                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">
                                            <input class="form-control " readonly type="text"  id="storeType" name="storeType" readonly value="${type.storeType}" onclick="selectStoreType()">
                                        </c:when>
                                        <c:otherwise>
                                            <input class="form-control " readonly type="text" name="storeType" value="${type.storeType}">
                                        </c:otherwise> 
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>

                                <input class="form-control" required="" placeholder="Fill" id="storeType" name="storeType" readonly type="text" value="" maxlength="50" onclick="selectStoreType()">
                                <!--<input class="form-control " readonly type="hidden" id="storeTypeID" value="${type[1]}">-->
                            </c:otherwise>        
                        </c:choose>
                                  <label class="control-label"><span style="color: red">*</span> Store Type</label>
                    </div>              


                    <div class="col-md-4 form-floating mb-3">
                     
                        <c:choose>
                            <c:when test="${fn:length(storelist) > 0}">
                                <c:forEach items="${storelist}" var="type">
                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">
                                            <input class="form-control validate[required]" required="" autocomplete="off" id="storeName" name="storeName" type="text" value="${type.storeName}" maxlength="50" onkeyup="checkStore1();"> 
                                        </c:when>
                                        <c:otherwise>
                                            <input class="form-control" readonly type="text" name="storeName" value="${type.storeName}">
                                        </c:otherwise> 
                                    </c:choose>

                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <input class="form-control validate[required]" placeholder="Fill" autocomplete="off" id="storeName" name="storeName" type="text" value="" maxlength="50" onkeyup="checkStore1();">
                            </c:otherwise>        
                        </c:choose>
                                   <label class="control-label"><span style="color: red">*</span> Store Name</label>
                    </div>

                  

                    <div class="col-md-4 form-floating mb-3">
                       
                        <c:choose>
                            <c:when test="${fn:length(storelist) > 0}">
                                <c:forEach items="${storelist}" var="type">
                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">
                                            <input class="form-control validate[required]" required="" autocomplete="off" id="storeID" name="storeID" type="text" value="${type.storeID}" maxlength="50" onkeyup="checkStore1();"> 
                                        </c:when>
                                        <c:otherwise>
                                            <input class="form-control" readonly type="text" name="storeID" value="${type.storeID}">
                                        </c:otherwise> 
                                    </c:choose>

                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <input class="form-control validate[required]" placeholder="Fill" autocomplete="off" id="storeID" name="storeID" type="text" value="" maxlength="50" onkeyup="checkStore1();">
                            </c:otherwise>        
                        </c:choose>
                                 <label class="control-label"><span style="color: red">*</span> Store ID</label>
                    </div>

                    <div class="col-md-4 form-floating mb-3">
                      

                        <c:choose>
                            <c:when test="${fn:length(storelist) > 0}">
                                <c:forEach items="${storelist}" var="type">
                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">
                                            <input class="form-control validate[required]" style="resize: none;" id="storeCategory" readonly name="storeCategory" value="${type.storeCategory}" type="text"  maxlength="500">


                                        </c:when>
                                        <c:otherwise>

                                            <input type="text" class="form-control" name="storeCategory" readonly id="storeCategory" value="${type.storeCategory}">

                                        </c:otherwise> 
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>

                                <input class="form-control" placeholder="Fill"  id="storeCategory" readonly name="storeCategory" type="text" value="" maxlength="500">
                            </c:otherwise>        
                        </c:choose>
  <label class="control-label"><span style="color:red">*</span>Store Category</label>
                    </div>
                    <div class="col-md-4 form-floating mb-3">
                       

                        <c:choose>
                            <c:when test="${fn:length(storelist) > 0}">
                                <c:forEach items="${storelist}" var="type">
                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">
                                            <input class="form-control validate[required]" style="resize: none;" autocomplete="off" id="address" name="address" type="text" value="${type.address}"  maxlength="500">
                                            <input id="address1" class="form-control"  rows="1" maxlength="300" style="resize: none" type="hidden" value="${type.address}">

                                        </c:when>
                                        <c:otherwise>

                                            <input type="textarea" class="form-control" name="address" id="address" readonly value="${type.address}">

                                        </c:otherwise> 
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>

                                <input class="form-control" placeholder="Fill" style="resize: none;"  id="address" name="address" type="text" value="" maxlength="500">

                            </c:otherwise>        
                        </c:choose>
 <label class="control-label">Address</label>
                    </div>

                  

                    <c:if test="${action ne 'view'}">
                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                            <button type="submit" class="btn btn-primary" onclick="return test();">Save</button>
                            <a href="../master/storeMasterList.htm" class="btn btn-danger">Cancel</a>
                        </div>
                    </c:if>

                    <c:if test="${action eq 'view'  }">

                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                            <a href="../master/storeMasterList.htm" class="btn btn-danger">Cancel</a>
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



    $(document).ready(function () {

        jQuery("#imForm").validationEngine();
        $('#storeName').keyup(function () {
            this.value = this.value.toUpperCase();
        });
    });

    function test()
    {
//                alert("hello");
        var comp = document.getElementById("address").value;
        var comp1 = document.getElementById("address1").value;
        var storeCategory = document.getElementById("storeCategory").value;
        var storeType = document.getElementById("storeType").value;
        if (document.getElementById("storeCategory").value == "")
        {
            alert("Enter storeCategory");
            return false;
        }
        else
        if (document.getElementById("storeType").value == "")
        {
            alert("Enter storeType");
            return false;
        }
        else
        if (document.getElementById("division").value == "")
        {
            alert("Enter division");
            return false;
        }
        else

        if (comp !== comp1) {
            if (confirm('Do you really want to Save this updated record')) {
                document.forms["imForm"].submit();
                return true;
            } else {
                return true;
            }

        } else {
            document.forms["imForm"].submit();
        }

    }
    function selectStoreType() {

        myWindow = window.open("../master/selectStoreType.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
    }



    function checkStore() {

        var division = $('#division').val();
        var storeType = $('#storeType').val();

        $.ajax
                ({
                    type: "POST",
                    url: '../master/store.htm',
                    data: {
                        division: division,
                    },
                    success: function (data)
                    {
                        if ($.trim(data) === 'Already Exists.') {
                            alert("Data Already Exist");
                            $('#division').val("");

                            return false;
                        }
                    }
                });
    }


    function checkStore1() {

        var division = $('#division').val();
        var storeType = $('#storeType').val();
        var storeName = $('#storeName').val();

        $.ajax
                ({
                    type: "POST",
                    url: '../master/storeMaster.htm',
                    data: {
                        division: division,
                        storeType: storeType,
                        storeName: storeName
                    },
                    success: function (data)
                    {
                        if ($.trim(data) === 'Already Exists.') {
                            alert("Data Already Exist");
                            $('#division').val("");
                            $('#storeType').val("");
                            $('#storeName').val("");
                            return false;
                        }
                    }
                });
    }


</script>
    </body>

</html>
