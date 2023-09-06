<%-- 
    Document   : bookingDetailsRejList
    Created on : 10 Dec, 2018, 5:21:12 PM
    Author     : ebs-sdd41
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link href="../common/theme/css/disableSelection.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>arête Assets Management</title>

        <!-- Bootstrap core CSS -->


    </head>


    <body class="nav-md">
         <jsp:include page="../login/menu.htm" />

                    <main id="main" class="main">
                        <div>
                            <jsp:include page="../login/headerlink.htm?submodule=Booking Details&tab=Rejected&pagetype=list"/>
                        </div>
                        <div class="pagetitle">

                        </div><!-- End Page Title -->
                        <section class="section">
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="card">

                                        <div class="card-body">
                                            <div class="card-title">
                                                <h5>Booking Details Rejected List</h5>
                                            </div>
                                            <!-- Table with stripped rows -->


                                            <table class="table datatable">  
                                                <thead>

                                                                <tr class="headings">
                                                                    <th>Tenant Code</th>
                                                                    <th>Tenant Name</th>
                                                                    <th>Property Name</th>
                                                                    <th>Billing Cycle</th>
                                                                    <th>Created Date</th>
                                                                    <th>Created By</th>
                                                                    <th>Approval Status</th>
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>

                                                                <c:forEach items="${tenantDetailsRej}" var="list">
                                                                    <tr class="even pointer">                                                                   
                                                                        <td class=""style="text-align: left;">${list.tenantCode}</td>
                                                                        <td class=""style="text-align: left;">${list.tenantFname} ${list.tenantLname}</td>
                                                                        <td class=" "style="text-align: left;">${list.assetName}</td>
                                                                        <td class=" "style="text-align: left;"></td>
                                                                        <td class=" "style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.creationDate}"/></td>
                                                                        <td class=" "style="text-align: left;"></td>
                                                                        <td class=" "style="text-align: left;">${list.appstatus}</td>
                                                                        <td class=" last" style="width: 250px;text-align: center;">
                                                                            <%--<c:if test="${list.appstatus ne 'CFO Approved'}">--%>
                                                                            <a href="../tenant/bookingDetailsRejForm.htm?pk=${list.SNo}&assetName=${list.assetName}&tenantCode=${list.tenantCode}&assetCode=${list.assetCode}&subclassifiedAstno=${list.subclassifiedAstno}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;
                                                                            <%--</c:if>
                                                                            <c:if test="${list.appstatus ne 'CFO Approved'}">
                                                                            <a href="../tenant/tenantDetailsAppForm1.htm?pk=${list.SNo}&llId=${list.llId}&contractPeriod=${list.contractPeriod}&assetName=${list.assetName}&subclassifiedAstno=${list.subclassifiedAstno}&action=edit" class="myButton12"><i class="fa fa-undo">Need Approval</i></a>&nbsp;
                                                                            </c:if>
                                                                            <c:if test="${list.appstatus eq 'CFO Approved'}">
                                                                                <button class="myButton6">Approved</button>
                                                                            </c:if>--%>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                                <%--<c:forEach items="${levellist}" var="type">
                                                                   
                                                                        <c:if test="${type[1] eq userId}">
                                                                        <tr class="even pointer">  
                                                                    <td class=" ">${tenantCode}</td>
                                                                    <td class=" ">${tenantFname}</td>
                                                                    <td class=" ">${recordstatus}</td>
                                                                    <td class=" last" style="width: 450px">
                                                                        <a href="../tenant/tenantDetailsAppForm.htm?pk=${SNo}&llId=${llId}&contractPeriod=${contractPeriod}&assetName=${assetName}&subclassifiedAstno=${subclassifiedAstno}&action=edit" class="myButton12"><i class="fa fa-undo">Need Approval</i></a>&nbsp;
                                                                    </td>
                                                                   
                                                                    </c:if>
                                                                    </tr>
                                                                </c:forEach>--%>
                                                                <%--</c:forEach>--%>

                                                            </tbody>

                                                        </table>
                                                    </table>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </section>

                    </main><!-- End #main -->

                    <jsp:include page="../login/footer.jsp" />
<script>
    function sendEmail(tC, Mail) {
        window.location.href = "../tenant/sendPOEmail.htm?tC=" + tC + "&tEmail=" + Mail + "&action=view";
    }

    NProgress.done();
</script>
</body>

</html>
