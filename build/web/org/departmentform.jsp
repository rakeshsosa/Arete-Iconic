
<%-- Document : assetDetailsForm Created on : Sep 15, 2016, 10:42:18 AM Author : Kondal Reddy N --%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <%@page contentType="text/html" pageEncoding="UTF-8" %>
                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                        <!-- Meta, title, CSS, favicons, etc. -->
                        <meta charset="utf-8">
                        <meta http-equiv="X-UA-Compatible" content="IE=edge">
                        <meta name="viewport" content="width=device-width, initial-scale=1">

<title>Arete Iconic</title>
                     <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">                    </head>


                    <body class="nav-md">
                        <jsp:include page="../login/menu.htm" />
                        <jsp:include page="../login/footer.jsp" />


                        <main id="main" class="main">
                            <div class="mt-3">
                                <jsp:include page="../login/headerlink.htm?submodule=Department&tab=Department&pagetype=form"/>
                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h5>Department Details</h5>
                                                </div>
                                                <form class="row" action="../login/deptsubmit.htm">
                                                    <div class="col-md-4 form-floating mb-3">
                                                        
                                                        <c:choose>
                                                            <c:when test="${fn:length(deptlist) > 0}">
                                                                <c:forEach items="${deptlist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" name="subgorgCode"  readonly="" value="${list.orgCode}">
                                                                            <input type="hidden" name="pk" value="${list.sno}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" value="${list.orgCode}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <select class="form-control" required="" name="orgcode">
                                                                    <option disabled="" selected="">Select an option</option>
                                                                    <c:forEach items="${orglist}" var="list">
                                                                        <option value="${list.orgCode}">${list.orgName}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </c:otherwise>        
                                                        </c:choose>
            <label class="control-label"><a style="color:red;">*</a>Organisation Name</label>
                                                    </div>
            
            
            
                                                    <%--<div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                        <label class="control-label">*Department Code</label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(deptlist) > 0}">
                                                                <c:forEach items="${deptlist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" required="" readonly="" name="deptcode" value="${list.departmentCode}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            
                                                                            <input type="text" class="form-control" readonly="" value="${list.departmentCode}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="" class="form-control" required="" name="deptcode">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                        
                                                    </div>--%>
                                                    <div class="col-md-4 form-floating mb-3">
                                                      
                                                        <c:choose>
                                                            <c:when test="${fn:length(deptlist) > 0}">
                                                                <c:forEach items="${deptlist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" required="" readonly="" name="deptname" value="${list.departmentName}" onkeypress="return isNumberKey3(evt)">
                                                                        </c:when>
                                                                        <c:otherwise>
            
                                                                            <input type="text" class="form-control" readonly="" value="${list.departmentName}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="fill" class="form-control" required="" name="deptname" onkeypress="return isNumberKey3(event)">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                                  <label class="control-label"><a style="color:red;">*</a>Department Name</label>
                                                    </div>
                                                   
                                                    <c:if test="${action ne 'view'}">
                                                      <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
                                                            <button type="submit" class="btn btn-primary" style="">Save</button>
                                                            <a href="../login/deptlist.htm" class="btn btn-danger">Cancel</a>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${action eq 'view'}">
                                                      <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
                                                            <a href="../login/deptlist.htm" class="btn btn-danger">Cancel</a>
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
                
                            function isNumberKey3(evt) {
                                debugger;
                                var charCode = (evt.which) ? evt.which : event.keyCode;
                                if (charCode > 32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122) && charCode > 31 && (charCode < 48 || charCode > 57))
                                {
                //                    alert("Please Enter Only Alphanumerics");
                                    return false;
                                }
                                return true;
                            }
                        </script>
                    </body>

                    </html>