<%-- 
    Document   : occupencyDashboard
    Created on : 2 Jan, 2019, 6:35:29 PM
    Author     : ebs-sdd41
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


        <title>arête Assets Management</title>

    </head>

    <script>
        function findDate()
        {
            var Frdate = $("#Frdate").val();
            var todate = $("#todate").val();
            //newly added by lakshmi
            var propName = $("#propName").val();
            var userId = $("#userId").val();
            var orgId = $("#orgId").val();
            if (Frdate == '' || todate == '' || propName == '')
            {
                alert("Please Select From Date & To Date & Property Name 1st!!!");
            } else {
                window.location.href = "../login/occupencyDashboard.htm?orgCode=" + orgId + "&userId=" + userId + "&Frdate=" + Frdate + "&todate=" + todate + "&propName=" + propName;

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
        function selectProperty()
        {
            myWindow = window.open("../dashboard/selectProperty.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
        }

    </script>

    <body class="nav-md">

        
  
        <jsp:include page="../login/menu.htm" />

                        <jsp:include page="../login/footer.jsp" />

                        <main id="main" class="main">
                            
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                            <div class="card-body">
                    <div class="row">
                        <div class="col-md-2"></div>
                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline" style="margin-bottom:20px">
                            <label class="control-label"><span style="color: red">*</span> From Date</label>
                            <input class="form-control " name="Frdate" id="Frdate" readonly="" value=""  type="text" placeholder="Select Date"  onclick="NewCssCal('Frdate', 'ddMMMyyyy', '', '', ' ', '', 'past');" >
                        </div>
                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline" style="margin-bottom:20px">
                            <label class="control-label"><span style="color: red">*</span> To Date</label>
                            <input class="form-control " name="todate" id="todate" readonly="" value=""  type="text" placeholder="Select Date"  onclick="NewCssCal('todate', 'ddMMMyyyy', '', '', ' ', '', 'past');" onchange="dateValid();">
                            <input class="form-control " id="orgId" type="hidden"   value="<%=session.getAttribute("orgId")%>-<%=session.getAttribute("orgCode")%>"/>
                            <input class="form-control " id="userId" type="hidden"   value="<%=session.getAttribute("userId")%>"/>
                        </div>
                        <div class="col-md-2"></div></div>
                    <div class="row">
                        <div class="col-md-2"></div>
                        <!--newly added by lakshmi-->
                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline" style="margin-bottom:20px">
                            <label class="control-label"><span style="color: red">*</span> Property Name</label>
                            <!--                            <select name="propName" id="propName"  class="form-control validate[required]">
                                                            <option value="" disabled selected>Select your option</option>
                            <%--<c:forEach items="${propNames}" var="type">
                                <option>${type}</option>
                            </c:forEach>--%>
                        </select>-->
                            <input class="form-control " name="propName" id="propName"  value=""  type="text" placeholder="Select Property" onclick="return selectProperty();">
                        </div>
                        <!--<input class="form-control " name="propName" id="propName"  value=""  type="text" placeholder="" >-->

                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline" style="margin-bottom:20px; float:right">
                            <button id="addRowBtn" class="btn btn-info" style="background-color: #314b68;border-color: #314b68;" onclick="findDate();">Find</button>
                        </div>
                        <div class="col-md-2"></div>
                    </div>
                    <br/>
                    <c:forEach items="${deptlists}" var="dept">
                        <c:forEach items="${roleName}" var="user">
                            <c:if test="${user eq 'admin'}">

                                <c:if test="${dept eq 'Property Management' }">
                                    <jsp:include page="../dashboard/occupencyStatistics.htm"/>
                                </c:if>
                            </c:if>
                        </c:forEach> 

                    </c:forEach>

               </div>
                                        </div>

                                    </div>
                                </div>
                            </section>

                        </main><!-- End #main -->
        <!-- /datepicker -->
        <!-- /footer content -->
    </body>

</html>
