<%-- 
    Document   : dashboardgraph
    Created on : 19 Jan, 2018, 3:12:22 PM
    Author     : ebs05
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>


        <title>Arête Property Management</title>
        <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">

    </head>
    <script>
        function findDate()
        {
            var Frdate = $("#Frdate").val();
            var todate = $("#todate").val();
            var userId = $("#userId").val();
            var orgId = $("#orgId").val();
            if (Frdate == '' || todate == '')
            {
                alert("Please Select From Date & To Date 1st!!!");
            } else {
                window.location.href = "../login/dashboardgraph.htm?orgCode=" + orgId + "&userId=" + userId + "&Frdate=" + Frdate + "&todate=" + todate;

            }
        }

        function dateValid() {


            var Frdate = document.getElementById("Frdate").value;
            var todate = document.getElementById("todate").value;

            var day = 1000 * 60 * 60 * 24;
            var loaddate = Frdate.split("-");
            var unloaddate = todate.split("-");

            var ldateday = loaddate[1];
            var ldatemon = loaddate[0];
            var ldateyear = loaddate[2];

            var uldateday = unloaddate[1];
            var uldatemon = unloaddate[0];
            var uldateyear = unloaddate[2];


            var ldate = ldateday + '/' + ldatemon + '/' + ldateyear;
            var uldate = uldateday + '/' + uldatemon + '/' + uldateyear;

            var diff = ((new Date(uldate).getTime()) - (new Date(ldate).getTime())) / (1000 * 24 * 3600);

            if ((diff < 0)) {
                alert("To Date Should Be Greater Than From Date");
                document.get
                ElementById("todate").value = "";
                return false;
            }

        }

    </script>

    <body class="nav-md">

       <jsp:include page="../login/menu.htm" />


                        <main id="main" class="main">
                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                        <label class="control-label"><span style="color: red">*</span> From Date</label>
                        <input class="form-control " name="Frdate" id="Frdate" readonly="" value=""  type="text" placeholder="Select Date"  onclick="NewCssCal('Frdate', 'ddMMMyyyy', '', '', '', '', 'past');">
                    </div>
                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                        <label class="control-label"><span style="color: red">*</span> To Date</label>
                        <input class="form-control " name="todate" id="todate" readonly="" value=""  type="text" placeholder="Select Date"  onclick="NewCssCal('todate', 'ddMMMyyyy', '', '', '', '', 'past');" onchange="dateValid();">
                        <input class="form-control " id="orgId" type="hidden"   value="<%=session.getAttribute("orgId")%>-<%=session.getAttribute("orgCode")%>"/>
                        <input class="form-control " id="userId" type="hidden"   value="<%=session.getAttribute("userId")%>"/>
                    </div>
                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                        <button id="addRowBtn" class="btn btn-info" style="background-color: #314b68;border-color: #314b68;" onclick="findDate();">Find</button>
                    </div>
                    <br/>
                    <br/>

                    <c:forEach items="${deptlists}" var="dept">
                        <c:forEach items="${roleName}" var="user">
                            <c:if test="${user eq 'admin'}">
                                <c:if test="${dept eq 'Property Management'}">
                                    <jsp:include page="../dashboard/assetgraph.htm"/>
                                </c:if>
                                <c:if test="${dept eq 'Contract Management'}">
                                    <jsp:include page="../dashboard/contractgraph.htm"/>
                                </c:if>
                                <c:if test="${dept eq 'Tenant Management'}">
                                    <jsp:include page="../dashboard/tenantgraph.htm"/>
                                </c:if>
                                <c:if test="${dept eq 'Correspondence Management'}">
                                    <jsp:include page="../dashboard/crmgraph.htm"/>
                                </c:if> 
                                <c:if test="${dept eq 'Purchase Management'}">
                                    <jsp:include page="../dashboard/purchsegraph.htm"/>
                                </c:if>
                                <c:if test="${dept eq 'Inventory Management'}">
                                    <jsp:include page="../dashboard/inventorygrph.htm"/>
                                </c:if>
                            </c:if>
                            <c:if test="${user eq 'Purchase Manager'}"><%--  or 'Purchase Officer' or 'Inventory Officer' or 'Finance Manager'--%>                        
                                <c:if test="${dept eq 'Purchase Management'}">
                                    <jsp:include page="../dashboard/purchsegraph.htm"/>
                                </c:if>
                                <c:if test="${dept eq 'Inventory Management'}">
                                    <jsp:include page="../dashboard/inventorygrph.htm"/>
                                </c:if>
                            </c:if>
                            <c:if test="${user eq 'Purchase Officer'}">
                                <c:if test="${dept eq 'Purchase Management'}">
                                    <jsp:include page="../dashboard/purchsegraph.htm"/>
                                </c:if>
                                <c:if test="${dept eq 'Inventory Management'}">
                                    <jsp:include page="../dashboard/inventorygrph.htm"/>
                                </c:if>
                            </c:if>
                            <c:if test="${user eq 'Inventory Officer'}">
                                <c:if test="${dept eq 'Purchase Management'}">
                                    <jsp:include page="../dashboard/purchsegraph.htm"/>
                                </c:if>
                                <c:if test="${dept eq 'Inventory Management'}">
                                    <jsp:include page="../dashboard/inventorygrph.htm"/>
                                </c:if>
                            </c:if>
                            <c:if test="${user eq 'Finance Manager'}">
                                <c:if test="${dept eq 'Purchase Management'}">
                                    <jsp:include page="../dashboard/purchsegraph.htm"/>
                                </c:if>
                                <c:if test="${dept eq 'Inventory Management'}">
                                    <jsp:include page="../dashboard/inventorygrph.htm"/>
                                </c:if>
                            </c:if>
                            <c:if test="${user eq 'Property Manager'}">
                                <c:if test="${dept eq 'Property Management'}">
                                    <jsp:include page="../dashboard/assetgraph.htm"/>
                                </c:if>                        
                            </c:if>
                            <c:if test="${user eq 'Approval 2'}">

                                <c:if test="${dept eq 'Contract Management'}">
                                    <jsp:include page="../dashboard/contractgraph.htm"/>
                                </c:if>
                                <c:if test="${dept eq 'Tenant Management'}">
                                    <jsp:include page="../dashboard/tenantgraph.htm"/>
                                </c:if>
                                <c:if test="${dept eq 'Correspondence Management'}">
                                    <jsp:include page="../dashboard/crmgraph.htm"/>
                                </c:if>                        
                            </c:if>
                            <c:if test="${user eq 'Approval 1'}">

                                <c:if test="${dept eq 'Contract Management'}">
                                    <jsp:include page="../dashboard/contractgraph.htm"/>
                                </c:if>
                                <c:if test="${dept eq 'Tenant Management'}">
                                    <jsp:include page="../dashboard/tenantgraph.htm"/>
                                </c:if>
                                <c:if test="${dept eq 'Correspondence Management'}">
                                    <jsp:include page="../dashboard/crmgraph.htm"/>
                                </c:if>                        
                            </c:if>                            


                            <%-- inventorygrph</c:if>
                              <c:if test="${user eq 'GFC'}">
                                   <c:if test="${dept eq 'Tenant Management'}">
                               <jsp:include page="../dashboard/tenantgraph.htm"/>
                           </c:if>
                           <c:if test="${dept eq 'Correspondence Management'}">
                               <jsp:include page="../dashboard/crmgraph.htm"/>
                           </c:if> 
                                   </c:if>
                                   <c:if test="${user eq 'salesmanager'}">
                                   <c:if test="${dept eq 'Contract Management'}">
                               <jsp:include page="../dashboard/contractgraph.htm"/>
                           </c:if>
                           <c:if test="${dept eq 'Tenant Management'}">
                               <jsp:include page="../dashboard/tenantgraph.htm"/>
                           </c:if>--%>


                        </c:forEach>

                        <c:forEach items="${roleName}" var="roleName">
                            <c:if test="${dept eq 'Tenant Management' && roleName eq 'Tenant'}">
                                <jsp:include page="../dashboard/tenantgraph1.htm"/>
                            </c:if>
                        </c:forEach>

                    </c:forEach>


                    <!-- top tiles -->

                    <!-- /top tiles -->




                    <!-- footer content -->


          </main><!-- End #main -->
                        <jsp:include page="../login/footer.jsp" />
        <!-- /datepicker -->
        <!-- /footer content -->

    </body>

</html>
