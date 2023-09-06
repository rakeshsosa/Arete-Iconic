
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
                     <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">                         <link rel="stylesheet" href="../common/accordion/smk-accordion.css" />

        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
                    </head>


                    <body class="nav-md">
                        <jsp:include page="../login/menu.htm" />
                            <jsp:include page="../login/footer.jsp" />


                        <main id="main" class="main">
                            <div class="mt-3">
                                <jsp:include page="../login/headerlink.htm?submodule=User Role&tab=Role Permission&pagetype=form"/>
                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h5>Role Permission</h5>
                                                </div>
                                                <form id="rolepermission" class="form-inline row" action="../login/permissionsubmit.htm" method="post" onsubmit="return test1();">
                                                    <div class="col-md-4 mb-3 form-floating">
                                                        
                                                        <select class="form-control" required="" name="orgCode" onchange="test(this.value)">
                                                            <option value="">Select an option</option>
                                                            <c:forEach items="${orglist}" var="list">
                                                                <option value="${list.sno}-${list.orgCode}">${list.orgName}</option>
                                                            </c:forEach>
                                                        </select>
                                                        <label class="control-label"><span style="color:red;font-weight: bold;">*</span>Organisation Name</label>
                                                    </div>
                                                    <div class="col-md-4 mb-3 form-floating">
                                                        
                                                        <select class="form-control" required="" name="departmentCode" id="deptCode" onchange="role(this.value)">
                                                            <option value="">Select an option</option>
                                                        </select>
                                                        <label class="control-label"><span style="color:red;font-weight: bold;">*</span>Department Name</label>
                                                        <script>
                                                            function test(val) {
                                                                $("#deptCode").empty();
                                                                $("#deptCode").append(new Option('', ''));
                                                                var val1 = val.split("-");
                                                            <c:forEach items="${deptlist}" var="list">
                                                                var comaparekey = "<c:out value="${list.orgCode}"/>";
                                                                if (comaparekey === val1[1]) {
                                                                    $("#deptCode").append(new Option('${list.departmentName}', '${list.departmentCode}-${list.departmentName}'));
                                                                            }
                                                            </c:forEach>
                                                                        }
                                                        </script>
                                                    </div>
            
                                                    <div class="col-md-4 mb-3 form-floating">
                                                        
                                                        <select class="form-control" required="" name="roleName" id="roleName">
                                                            <option value="">Select an option</option>
                                                        </select>
                                                        <label class="control-label"> <span style="color:red;font-weight: bold;">*</span>Role Name</label>
                                                        <script>
                                                            function role(val) {
                                                                $("#roleName").empty();
                                                                $("#roleName").append(new Option('', ''));
                                                                var val1 = val.split("-");
                                                            <c:forEach items="${rolelist}" var="list">
                                                                var comaparekey = "<c:out value="${list.departmentCode}"/>";
                                                                if (comaparekey === val1[0]) {
                                                                    $("#roleName").append(new Option('${list.roleName}', '${list.roleName}'));
                                                                }
                                                            </c:forEach>
                                                            }
                                                        </script>
                                                    </div>
            
                                                    <p>&nbsp;</p>
                                                    <div class="container_demo">
                                                        <!-- Accordion begin -->
                                                        <ul class="accordion_example">
                                                            <!-- Section 3 -->
                                                            <c:forEach items="${deptlist}" var="dept">
                                                                <li>
                                                                    <div>${dept.departmentName}
                                                                        <c:forEach var="role1" items="${fn:split(dept.departmentName, ' ')}">
                                                                            <c:set var="role" value="${role}${role1}" />
                                                                        </c:forEach>
                                                                        <input class="rolep" style="float: right;"  type="checkbox" name="${role}" id="${role}" onclick="checkall('${role}')">
                                                                    </div><!-- Head -->
                                                                    <div>
                                                                        <ul class="accordion_example ${role}">
                                                                            <c:forEach items="${modulelist1}" var="module">
                                                                                <c:if test="${module[0] eq dept.departmentCode}">
                                                                                    <c:if test="${submod ne module[1]}">
                                                                                        <li>
                                                                                            <div>${module[1]}
                                                                                                <c:forEach var="module12" items="${fn:split(module[1], ' ')}">
                                                                                                    <c:set var="module11" value="${module11}${module12}" />
                                                                                                </c:forEach>
                                                                                                <input class="rolep" style="float: right;" id="${module11}"  type="checkbox" name="${module11}" onclick="checkall('${module11}')">
                                                                                            </div><!-- Head -->
                                                                                            <div>
                                                                                                <c:forEach items="${modulelist}" var="module1">
                                                                                                    <c:if test="${module[1] eq module1.submoduleName}">
                                                                                                        <div class="${module11}">
                                                                                                            <label for="x" style="width: 250px;"><input type="checkbox" id="x" name="tabName" value="${dept.departmentName}%${module[1]}%${module1.tabName}%${module1.listLink}"/> 
                                                                                                                <span>${module1.tabName}</span></label>
                                                                                                            <label for="y"><input type="checkbox" id="y" name="Add${module1.tabName}" value="${module1.formLink}"/> <span>Add</span></label>
                                                                                                            <label for="z"><input type="checkbox" id="z" name="Edit${module1.tabName}" value="y"/> <span>Edit</span></label>
                                                                                                            <label for="x"><input type="checkbox" id="x" name="Delete${module1.tabName}" value="y"/> <span>Delete</span></label>
                                                                                                            <label for="y"><input type="checkbox" id="y" name="Review${module1.tabName}" value="y"/> <span>Review</span></label>
                                                                                                            <label for="z"><input type="checkbox" id="z" name="Approve${module1.tabName}" value="y"/> <span>Approve</span></label>
                                                                                                        </div>
                                                                                                    </c:if>
                                                                                                </c:forEach>
                                                                                            </div>
                                                                                        </li>
                                                                                    </c:if>
                                                                                    <c:set value="${module[1]}" var="submod"/>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                        </ul>
                                                                        <!-- Another Accordion here end -->
            
                                                                    </div>
                                                                </li>
                                                                <c:set var="role" value="" />
                                                            </c:forEach>
            
            
                                                        </ul>
                                                        <!-- Accordion end -->
            
            
            
            
                                                    </div>
            
                                                 <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
            
                                                        <button type="submit" class="btn btn-primary" style="">Save</button>
                                                        <a href="../login/permissionlist.htm" class="btn btn-danger">Cancel</a>
                                                        <!--                                            <button type="button" href="../login/permissionlist.htm" class="btn btn-danger" style="">CANCEL</button>-->
            
                                                    </div> 
            
                                                </form>
                                        </div>
                                    </div>

                                </div>
                                </div>
                            </section>

                        </main><!-- End #main -->
        <script type="text/javascript" src="../common/accordion/smk-accordion.js"></script>
        <script type="text/javascript">
                                                jQuery(document).ready(function ($) {
                                                    $(".accordion_example").smk_Accordion();

                                                });

                                                NProgress.done();

                                                function checkall(val) {
                                                    $('#' + val).change(function () {
                                                        $('.' + val + ' input:checkbox').prop('checked', $(this).prop("checked"));
                                                    });
                                                }
        </script>
                    </body>

                    </html>