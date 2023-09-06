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
                        <script src="../common/datepicker/datetimepicker_css.js" type="text/javascript"></script>
                        <title>Arête Property Management</title>
                        <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
                    </head>
                    <script>
                        function findDate()
                        {
                            var Frdate = $("#Frdate").val();
                            var todate = $("#todate").val();
                //            //newly added by lakshmi
                //            var propName = $("#propName").val();
                            var userId = $("#userId").val();
                            var orgId = $("#orgId").val();
                            if (Frdate == '' || todate == '' )
                            {
                                alert("Please Select From Date & To Date 1st!!!");
                            } else {
                                window.location.href = "../login/dashboard.htm?orgCode=" + orgId + "&userId=" + userId + "&Frdate=" + Frdate + "&todate=" + todate;
                
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
                                document.getElementById("todate").value = "";
                                return false;
                            }
                
                        }
                
                    </script>

                    <body class="nav-md">
                        <jsp:include page="../login/menu.htm" />


                        <main id="main" class="main">
                            
                            
                            <section class="section dashboard">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class=" pt-3">
                                            <div class="">

                                                       
<!--                                                            <div class="toast align-items-center" role="alert" aria-live="assertive" aria-atomic="true">
                                                              <div class="d-flex">
                                                                <div class="toast-body">
                                                                Please click on the boxes to view the particular lists.
                                                               </div>
                                                                <button type="button" class="btn-close me-2 m-auto btn-lg" data-bs-dismiss="toast" aria-label="Close"></button>
                                                              </div>
                                                            </div>-->
                                                                    
<div class="row mb-4">
    <div class="col-md-4">
         <div class="dropdown mb-2">
                                                                <a class="btn btn-primary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                                                                  Choose Dashboard Style
                                                                </a>

                                                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                                                  <li><a class="dropdown-item" href="../login/dashboard.htm?orgCode=1-${orgCode}"><i class="fa "></i>Numeric Dashboard</a></li>                                
<!--                                                                  <li><a class="dropdown-item" href="../login/dashboardgraph.htm?orgCode=1-${orgCode}"><i class="fa "></i>Pictorial Dashboard</a></li>-->
                                                                  <li><a class="dropdown-item" href="#" title="Coming Soon"><i class="fa "></i>Pictorial Dashboard</a></li>
                                                                </ul>
                                                              </div>
                                                                
                        
    </div>
    <div class="col-md-4">
                                                <div class="dropdown mb-2">
                                                                <a class="btn btn-primary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                                                                  Occupancy Portrayal
                                                                </a>

                                                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                                                  <li><a class="dropdown-item" href="../login/occupencyDashboard.htm?orgCode=1-${orgCode}"><i class="fa "></i>Numeric Dashboard</a></li>                                
                                                                  <li><a class="dropdown-item" href="../login/occupencyDashboardgraph.htm?orgCode=1-${orgCode}"><i class="fa "></i>Pictorial Dashboard</a></li>
                                                                </ul>
                                                              </div>
    </div>
</div>
                                                <div class="row align-items-end">
                                                    <!--                        <div class="col-md-2"></div>-->
                                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline" style="margin-bottom:20px">
                                                                                <label class="control-label"><span style="color: red">*</span> From Date</label>
                                                                                <input class="form-control " name="Frdate" id="Frdate" value=""  type="text" placeholder="Select Date"  onclick="NewCssCal('Frdate', 'ddMMMyyyy', '', '', ' ', '', 'past');" >
                                                                            </div>
                                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline" style="margin-bottom:20px">
                                                                                <label class="control-label"><span style="color: red">*</span> To Date</label>
                                                                                <input class="form-control " name="todate" id="todate" value=""  type="text" placeholder="Select Date"  onclick="NewCssCal('todate', 'ddMMMyyyy', '', '', ' ', '', 'past');" onchange="dateValid();">
                                                                                <input class="form-control " id="orgId" type="hidden"   value="<%=session.getAttribute("orgId")%>-<%=session.getAttribute("orgCode")%>"/>
                                                                                <input class="form-control " id="userId" type="hidden"   value="<%=session.getAttribute("userId")%>"/>
                                                                            </div>
                                                    <!--                        <div class="col-md-2"></div></div>
                                                                        <div class="row">-->
                                                                            <!--<div class="col-md-2"></div>-->
                                                                            <!--newly added by lakshmi-->
                                                    <!--                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline" style="margin-bottom:20px">
                                                                                <label class="control-label"><span style="color: red">*</span> Property Name</label>
                                                                                <input class="form-control " name="propName" id="propName"  value=""  type="text" placeholder="" >
                                                                            </div>-->
                                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline" style="margin-bottom:20px; float:right">
                                                                                <button id="addRowBtn" class="btn btn-primary" onclick="findDate();">Find</button>
                                                                            </div>
                                                    <!--                        <div class="col-md-2"></div>-->
                                                    <!--                    </div>-->
                                                                        <br/>
                                                                        <c:forEach items="${deptlists}" var="dept">
                                                                            <c:forEach items="${roleName}" var="user">
                                                                                <c:if test="${user eq 'admin'}">
                                                                                    <c:if test="${dept eq 'Property Management'}">
                                                                                        <jsp:include page="../dashboard/asset.htm"/>
                                                                                    </c:if>
                                                                                    <c:if test="${dept eq 'Contract Management'}">
                                                                                        <jsp:include page="../dashboard/contract.htm"/>
                                                                                    </c:if>
                                                                                    <c:if test="${dept eq 'Tenant Management'}">
                                                                                        <jsp:include page="../dashboard/tenant.htm"/>
                                                                                    </c:if>
                                                                                    <c:if test="${dept eq 'Correspondence Management'}">
                                                                                        <jsp:include page="../dashboard/crm.htm"/>
                                                                                    </c:if>
                                                                                    <c:if test="${dept eq 'Purchase Management'}">
                                                                                        <jsp:include page="../dashboard/purchase.htm"/>
                                                                                    </c:if>
                                                    
                                                    
                                                                                </c:if>
                                                                                <c:if test="${user eq 'Purchase Manager'}"><%--  or 'Purchase Officer' or 'Inventory Officer' or 'Finance Manager'--%>                        
                                                                                    <c:if test="${dept eq 'Purchase Management'}">
                                                                                        <jsp:include page="../dashboard/purchase.htm"/>
                                                                                    </c:if>
                                                                                    <c:if test="${dept eq 'Inventory Management'}">
                                                                                        <jsp:include page="../dashboard/inventory.htm"/>
                                                                                    </c:if>
                                                                                </c:if>
                                                                                <c:if test="${user eq 'Purchase Officer'}">
                                                                                    <c:if test="${dept eq 'Purchase Management'}">
                                                                                        <jsp:include page="../dashboard/purchase.htm"/>
                                                                                    </c:if>
                                                                                    <c:if test="${dept eq 'Inventory Management'}">
                                                                                        <jsp:include page="../dashboard/inventory.htm"/>
                                                                                    </c:if>
                                                                                </c:if>
                                                                                <c:if test="${user eq 'Inventory Officer'}">
                                                                                    <c:if test="${dept eq 'Purchase Management'}">
                                                                                        <jsp:include page="../dashboard/purchase.htm"/>
                                                                                    </c:if>
                                                                                    <c:if test="${dept eq 'Inventory Management'}">
                                                                                        <jsp:include page="../dashboard/inventory.htm"/>
                                                                                    </c:if>
                                                                                </c:if>
                                                                                <c:if test="${user eq 'Finance Manager'}">
                                                                                    <c:if test="${dept eq 'Purchase Management'}">
                                                                                        <jsp:include page="../dashboard/purchase.htm"/>
                                                                                    </c:if>
                                                                                    <c:if test="${dept eq 'Inventory Management'}">
                                                                                        <jsp:include page="../dashboard/inventory.htm"/>
                                                                                    </c:if>
                                                                                </c:if>
                                                                                <c:if test="${user eq 'Property Manager'}">
                                                                                    <c:if test="${dept eq 'Property Management'}">
                                                                                        <jsp:include page="../dashboard/asset.htm"/>
                                                                                    </c:if>                        
                                                                                </c:if>
                                                                                <c:if test="${user eq 'Approval 2'}">
                                                    
                                                                                    <c:if test="${dept eq 'Contract Management'}">
                                                                                        <jsp:include page="../dashboard/contract.htm"/>
                                                                                    </c:if>
                                                                                    <c:if test="${dept eq 'Tenant Management'}">
                                                                                        <jsp:include page="../dashboard/tenant.htm"/>
                                                                                    </c:if>
                                                                                    <c:if test="${dept eq 'Correspondence Management'}">
                                                                                        <jsp:include page="../dashboard/crm.htm"/>
                                                                                    </c:if>                        
                                                                                </c:if>
                                                                                <c:if test="${user eq 'Approval 1'}">
                                                    
                                                                                    <c:if test="${dept eq 'Contract Management'}">
                                                                                        <jsp:include page="../dashboard/contract.htm"/>
                                                                                    </c:if>
                                                                                    <c:if test="${dept eq 'Tenant Management'}">
                                                                                        <jsp:include page="../dashboard/tenant.htm"/>
                                                                                    </c:if>
                                                                                    <c:if test="${dept eq 'Correspondence Management'}">
                                                                                        <jsp:include page="../dashboard/crm.htm"/>
                                                                                    </c:if>                        
                                                                                </c:if>
                                                    
                                                                                <c:if test="${dept eq 'Inventory Management'}">
                                                                                    <jsp:include page="../dashboard/inventory.htm"/>
                                                                                </c:if>
                                                    
                                                                                <c:if test="${dept eq 'AMC Management'}">
                                                                                    <jsp:include page="../dashboard/AMCmanagement.htm"/>
                                                                                </c:if>
                                                    
                                                                                <c:if test="${dept eq 'AMC Management'}">
                                                                                    <jsp:include page="../dashboard/amcQualityCheck.htm"/>
                                                                                </c:if>
                                                    
                                                                                <%--</c:if>
                                                                                    <c:if test="${user eq 'salesmanager'}">
                                                                                        <c:if test="${dept eq 'Property Management'}">
                                                                                    <jsp:include page="../dashboard/asset.htm"/>
                                                                                </c:if>
                                                                                <c:if test="${dept eq 'Contract Management'}">
                                                                                    <jsp:include page="../dashboard/contract.htm"/>
                                                                                </c:if>
                                                                                    </c:if>
                                                                                <%--<c:if test="${user eq 'CFO'}">                               
                                                                            <c:if test="${dept eq 'Tenant Management'}">
                                                                                <jsp:include page="../dashboard/tenant.htm"/>
                                                                                
                                                                            </c:if>                       
                                                                                    
                                                                                </c:if>
                                                                                <c:if test="${user eq 'GFC'}">
                                                                                    <c:if test="${dept eq 'Tenant Management'}">
                                                                                <jsp:include page="../dashboard/tenant.htm"/>
                                                                            </c:if>
                                                                            <c:if test="${dept eq 'Correspondence Management'}">
                                                                                <jsp:include page="../dashboard/crm.htm"/>
                                                                            </c:if>
                                                                                </c:if>--%>
                                                                               <%-- <c:if test="${dept eq 'Property Management' }">
                                                                                    <jsp:include page="../dashboard/occupencyStatistics.htm"/>
                                                                                </c:if>--%>
                                                                            </c:forEach> 
                                                                            <c:forEach items="${roleName}" var="roleName">
                                                                                <c:if test="${dept eq 'Tenant Management' && roleName eq 'Tenant'}">
                                                                                    <jsp:include page="../dashboard/tenant1.htm"/>
                                                                                </c:if>
                                                                            </c:forEach>
                                                    
                                                    
                                                    
                                                                        </c:forEach>
                                                    
                                                    
                                                                        <!-- top tiles -->
                                                    
                                                                        <!-- /top tiles -->
                                                    
                                                    
                                                    
                                                    
                                                                        <!-- footer content -->
                                                    
                                                    
                                                                        <!-- /footer content -->
                                                                    </div>
                                                
                                        </div>
                                    </div>

                                </div>
                                </div>
                            </section>

                        </main><!-- End #main -->

                        
                        <jsp:include page="../login/footer.jsp" />
                    </body>

                    </html>