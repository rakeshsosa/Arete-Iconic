
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
                                <jsp:include page="../login/headerlink.htm?submodule=User Role&tab=Department Roles&pagetype=form"/>
                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h5>Department Roles</h5>
                                                </div>
                                                <form class="row" action="../login/rolesubmit.htm">
                                                    <div class="col-md-4 form-floating mb-3">
                                                        <c:choose>
                                                            <c:when test="${fn:length(rolelist) > 0}">
                                                                <c:forEach items="${rolelist}" var="list">
                                                                    <c:forEach items="${deptlist}" var="list1">
                                                                        <c:if test="${list1.departmentCode eq list.departmentCode}">
                                                                            <c:set var="dname" value="${list1.departmentName}"/>
                                                                            <c:set var="dcode" value="${list1.orgCode}"/>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:forEach items="${orglist}" var="list2">
                                                                        <c:if test="${list2.orgCode eq dcode}">
                                                                            <c:set var="oname" value="${list2.orgName}"/>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control"  readonly="" value="${oname}">
                                                                            <input type="hidden" name="pk" value="${list.sno}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" value="${oname}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <select class="form-select" placeholder="fill" required="" onchange="test(this.value)">
                                                                    <option selected="" disabled="">Select an option</option>
                                                                    <c:forEach items="${orglist}" var="list">
                                                                        <option value="${list.orgCode}">${list.orgName}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </c:otherwise>        
                                                        </c:choose>
                                                                    <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Organisation Name</label>

                                                    </div>
            
                                                    <div class="col-md-4 form-floating mb-3">
                                                        <c:choose>
                                                            <c:when test="${fn:length(rolelist) > 0}">
                                                                <c:forEach items="${rolelist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" required="" readonly="" name="deptCode" value="${list.departmentCode}">
                                                                        </c:when>
                                                                        <c:otherwise>
            
                                                                            <input type="text" class="form-control" readonly="" value="${list.departmentCode}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <select class="form-control" required="" id="deptCode" name="deptCode">
                                                                    <option selected="" disabled="">Select an option</option>
                                                                </select>
                                                            </c:otherwise>        
                                                        </c:choose>
            
                                                        <script>
                                                            function test(val) {
                                                                $("#deptCode").empty();
                                                                $("#deptCode").append(new Option('', ''));
                                                            <c:forEach items="${deptlist}" var="list">
                                                                var comaparekey = "<c:out value="${list.orgCode}"/>";
                                                                if (comaparekey === val) {
                                                                    $("#deptCode").append(new Option('${list.departmentCode}', '${list.departmentName}'));
                                                                }
                                                            </c:forEach>
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
                                                        </script>
                                                                                                                <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Department Name</label>

                                                    </div>
                                                    <div class="col-md-4 form-floating mb-3">
                                                        <c:choose>
                                                            <c:when test="${fn:length(rolelist) > 0}">
                                                                <c:forEach items="${rolelist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" required="" readonly="" name="rolecode" value="${list.roleCode}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" value="${list.roleCode}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="fill" class="form-control" required="" name="rolecode">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                                    <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Role Code</label>

                                                    </div>
                                                  
                                                    <div class="col-md-4 form-floating mb-3">
                                                        <c:choose>
                                                            <c:when test="${fn:length(rolelist) > 0}">
                                                                <c:forEach items="${rolelist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" required="" readonly="" name="rolename" value="${list.roleName}" onkeypress="return isNumberKey4(event)">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" value="${list.roleName}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="fill" class="form-control" required="" name="rolename" onkeypress="return isNumberKey4(event)">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                                    <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Role Name</label>

                                                    </div>
                                                    <div class="col-md-4 form-floating mb-3">
                                                 
                                                        <c:choose>
                                                            <c:when test="${fn:length(rolelist) > 0}">
                                                                <c:forEach items="${rolelist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <textarea name="description" class="form-control"  rows="1" style="resize: none">${list.roleDesc}</textarea>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <textarea readonly="" class="form-control"  rows="1" style="resize: none">${list.roleDesc}</textarea>
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea name="description" class="form-control"  rows="1" style="resize: none"></textarea>
                                                            </c:otherwise>        
                                                        </c:choose>
                                                                       <label class="control-label">Description</label>
                                                    </div>
                                                  
                                                    <c:if test="${action ne 'view'}">
                                                        <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
            
                                                            <button type="submit" class="btn btn-primary" style="">Save</button>
                                                            <a href="../login/rolelist.htm" class="btn btn-danger">Cancel</a>
            
                                                        </div> 
            
                                                    </c:if>
                                                    <c:if test="${action eq 'view'}">
                                                        <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
                                                            <a href="../login/rolelist.htm" class="btn btn-danger">Cancel</a>
            
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