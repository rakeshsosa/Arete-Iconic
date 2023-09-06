<%-- 
    Document   : rolepermission
    Created on : Mar 8, 2016, 6:16:10 PM
    Author     : Sudhanshu
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

        <title>arete Assets Management</title>
        <link rel="stylesheet" href="../common/accordion/smk-accordion.css" />

        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script>
            function test1() {
                var atLeastOneIsChecked = $('input[class="rolep"]:checked').length > 0;
                if (atLeastOneIsChecked == true) {
                    document.getElementById('rolepermission').submit = true;
                    return true;
                } else {
                    alert("Please Select at least one checkbox");
                    return false;
                }

            }

            function test()
            {

                if (confirm('Do you really want to Save this updated record')) {
                    document.forms["userform"].submit();
                    return true;
                } else {
                    return false;
                }



            }

        </script>
    </head>


    <body class="nav-md">

        <div class="container body">


            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <div class="clearfix"></div>
                        <div class="col-md-6 col-xs-12">
                            <div class="x_panel">
                                <jsp:include page="../login/headerlink.htm?submodule=User Role&tab=Role Permission&pagetype=form"/>

                                <div class="x_title">
                                    <h2>Role Permission</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />

                                    <c:forEach items="${permlist}" var="list">
                                        <c:forEach items="${rolelist}" var="type">
                                            <c:if test="${list.roleName eq type.roleName}">
                                                <c:set value="${type.departmentCode}" var="dept"/>   
                                            </c:if>
                                        </c:forEach>
                                        <c:set value="${list.orgId}" var="org"/>
                                        <c:set value="${list.roleName}" var="role"/>
                                    </c:forEach>
                                    <c:forEach items="${orglist}" var="list">
                                        <c:if test="${list.sno eq org}">
                                            <c:set value="${list.orgName}" var="orgname"/>
                                            <c:set value="${list.sno}" var="SNO"/>
                                        </c:if>
                                    </c:forEach>

                                    <form id="userform" class="form-inline" action="../login/permissionsubmit.htm" method="post" onsubmit="return test1();">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><a style="color:red;">*</a>Organisation Name</label>
                                            <input type="hidden" value="${org}" name="orgCode"/>
                                            <input type="text" placeholder="" class="form-control" readonly="" required="" value="${orgname}">
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><a style="color:red;">*</a>Department Name</label>
                                            <c:choose>
                                                <c:when test="${role eq 'admin'}">
                                                    <input type="text" placeholder="" name="departmentCode" class="form-control" readonly="" required="" value="All">
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" placeholder="" name="departmentCode" class="form-control" readonly="" required="" value="${dept}">
                                                </c:otherwise>
                                            </c:choose>
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><a style="color:red;">*</a>Role Name</label>
                                            <input type="text" placeholder="" name="roleName" class="form-control" readonly="" required="" value="${role}">
                                        </div>

                                        <p>&nbsp;</p>
                                        <div class="container_demo">
                                            <!-- Accordion begin -->
                                            <ul class="accordion_example">
                                                <!-- Section 3 -->
                                                <c:forEach items="${deptlist}" var="dept">
                                                    <li>
                                                        <div>
                                                            ${dept.departmentName}
                                                            <c:forEach var="role1" items="${fn:split(dept.departmentName, ' ')}">
                                                                <c:set var="role2" value="${role2}${role1}" />
                                                            </c:forEach>
                                                            <c:set var="i" value="0"/>
                                                            <c:forEach items="${permlist}" var="list">
                                                                <c:if test="${dept.departmentName==list.departmentName}">
                                                                    <c:if test="${i ne 1}">
                                                                        <input class="rolep" style="float: right;" type="checkbox" checked="checked" name="${role2}" id="${role2}" onclick="checkall('${role2}')">
                                                                        <c:set var="dept1" value="${list.departmentName}"></c:set>
                                                                        <c:set var="i" value="1"></c:set>
                                                                    </c:if>
                                                                </c:if>
                                                            </c:forEach>   
                                                            <c:if test="${dept1!=dept.departmentName}">
                                                                <input class="rolep" style="float: right;"  type="checkbox" name="${role2}" id="${role2}" onclick="checkall('${role2}')">
                                                            </c:if>
                                                        </div><!-- Head -->


                                                        <div>
                                                            <ul class="accordion_example ${role2}">
                                                                <c:forEach items="${modulelist1}" var="module">
                                                                    <c:if test="${module[0] eq dept.departmentCode}">
                                                                        <c:if test="${submod ne module[1]}">
                                                                            <li>
                                                                                <div>${module[1]}
                                                                                    <c:forEach var="module12" items="${fn:split(module[1], ' ')}">
                                                                                        <c:set var="module11" value="${module11}${module12}" />
                                                                                    </c:forEach>
                                                                                    <c:set var="j" value="0"/>
                                                                                    <c:forEach items="${permlist}" var="list">
                                                                                        <c:if test="${module[1]==list.submoduleName}">
                                                                                            <c:if test="${j ne 1}">
                                                                                                <input style="float: right;" id="${module11}"  type="checkbox" name="${module11}"  checked="checked" onclick="checkall('${module11}')">
                                                                                                <c:set var="mod1" value="${list.submoduleName}"></c:set>
                                                                                                <c:set var="j" value="1"/>
                                                                                            </c:if>
                                                                                        </c:if>
                                                                                    </c:forEach> 

                                                                                    <c:if test="${mod1!=module[1]}">
                                                                                        <c:forEach var="module12" items="${fn:split(module[1], ' ')}">
                                                                                            <c:set var="module11" value="${module11}${module12}" />
                                                                                        </c:forEach>
                                                                                        <input style="float: right;" id="${module11}"  type="checkbox" name="${module11}"  onclick="checkall('${module11}')">
                                                                                    </c:if>
                                                                                </div><!-- Head -->
                                                                                <div>
                                                                                    <c:forEach items="${modulelist}" var="module1">
                                                                                        <c:if test="${module[1] eq module1.submoduleName}">
                                                                                            <div class="${module11}">
                                                                                                <c:set var="k" value="0"/>
                                                                                                <c:forEach items="${permlist}" var="list">
                                                                                                    <c:if test="${module1.tabName==list.tabName && list.submoduleName==module1.submoduleName}">
                                                                                                        <label for="x" style="width: 250px;"><input type="checkbox" id="x" checked="" name="tabName" value="${dept.departmentName}%${module[1]}%${module1.tabName}%${module1.listLink}"/> 
                                                                                                            <span>${module1.tabName}</span></label>
                                                                                                            <c:if test="${list.newEntry ne 'n'}">
                                                                                                            <label for="y"><input type="checkbox" checked="" id="y" name="Add${module1.tabName}" value="${module1.formLink}"/> <span>Add</span></label>
                                                                                                                <c:set var="add" value="${list.tabName}"></c:set>
                                                                                                            </c:if>
                                                                                                            <c:if test="${add!=module1.tabName}">
                                                                                                            <label for="y"><input type="checkbox" id="y" name="Add${module1.tabName}" value="${module1.formLink}"/> <span>Add</span></label>
                                                                                                            </c:if>

                                                                                                        <c:if test="${list.edit ne 'n'}">
                                                                                                            <label for="z"><input type="checkbox" checked="" id="z" name="Edit${module1.tabName}" value="y"/> <span>Edit</span></label>
                                                                                                                <c:set var="edit1" value="${list.tabName}"></c:set>
                                                                                                            </c:if>
                                                                                                            <c:if test="${edit1!=module1.tabName}">
                                                                                                            <label for="z"><input type="checkbox" id="z" name="Edit${module1.tabName}" value="y"/> <span>Edit</span></label>
                                                                                                            </c:if>

                                                                                                        <c:if test="${list.inactive ne 'n'}">
                                                                                                            <label for="x"><input type="checkbox" checked="" id="x" name="Delete${module1.tabName}" value="y"/> <span>Delete</span></label>
                                                                                                                <c:set var="delete" value="${list.tabName}"></c:set>
                                                                                                            </c:if>
                                                                                                            <c:if test="${delete!=module1.tabName}">
                                                                                                            <label for="x"><input type="checkbox" id="x" name="Delete${module1.tabName}" value="y"/> <span>Delete</span></label>
                                                                                                            </c:if>

                                                                                                        <c:if test="${list.review ne 'n'}">
                                                                                                            <label for="y"><input type="checkbox" checked="" id="y" name="Review${module1.tabName}" value="y"/> <span>Review</span></label>
                                                                                                                <c:set var="review1" value="${list.tabName}"></c:set>
                                                                                                            </c:if>
                                                                                                            <c:if test="${review1!=module1.tabName}">
                                                                                                            <label for="y"><input type="checkbox" id="y" name="Review${module1.tabName}" value="y"/> <span>Review</span></label>
                                                                                                            </c:if>

                                                                                                        <c:if test="${list.approve ne 'n'}">
                                                                                                            <label for="z"><input type="checkbox" checked="" id="z" name="Approve${module1.tabName}" value="y"/> <span>Approve</span></label>
                                                                                                                <c:set var="approve1" value="${list.tabName}"></c:set>
                                                                                                            </c:if>
                                                                                                            <c:if test="${approve1!=module1.tabName}">
                                                                                                            <label for="z"><input type="checkbox" id="z" name="Approve${module1.tabName}" value="y"/> <span>Approve</span></label>
                                                                                                            </c:if>
                                                                                                            <c:set var="test3" value="${list.tabName}"></c:set>
                                                                                                        </c:if>
                                                                                                    </c:forEach>
                                                                                                    <c:if test="${test3!=module1.tabName}">
                                                                                                    <label for="x" style="width: 250px;"><input type="checkbox" id="x" name="tabName" value="${dept.departmentName}%${module[1]}%${module1.tabName}%${module1.listLink}"/> 
                                                                                                        <span>${module1.tabName}</span></label>
                                                                                                    <label for="y"><input type="checkbox" id="y" name="Add${module1.tabName}" value="${module1.formLink}"/> <span>Add</span></label>
                                                                                                    <label for="z"><input type="checkbox" id="z" name="Edit${module1.tabName}" value="y"/> <span>Edit</span></label>
                                                                                                    <label for="x"><input type="checkbox" id="x" name="Delete${module1.tabName}" value="y"/> <span>Delete</span></label>
                                                                                                    <label for="y"><input type="checkbox" id="y" name="Review${module1.tabName}" value="y"/> <span>Review</span></label>
                                                                                                    <label for="z"><input type="checkbox" id="z" name="Approve${module1.tabName}" value="y"/> <span>Approve</span></label>
                                                                                                    </c:if>

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
                                                    <c:set var="role2" value="" />
                                                </c:forEach>


                                            </ul>
                                            <!-- Accordion end -->




                                        </div>

                                        <p>&nbsp;</p>
                                       
                                        <%--        <c:if test="${role eq 'admin'}">--%>
                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                            <button type="button" class="btn btn-primary" style="" onclick="return test();">Save</button>

                                            <!--                                            <button type="submit" class="btn btn-primary" style="">Save</button>-->
                                            <a href="../login/permissionlist.htm" class="btn btn-danger">Cancel</a>
                                        </div> 
                                        <%--  </c:if>--%>
                                    </form>
                                </div> 

                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <div id="custom_notifications" class="custom-notifications dsp_none">
            <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group"></ul>
            <div class="clearfix"></div>
            <div id="notif-group" class="tabbed_notifications"></div>
        </div>
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
