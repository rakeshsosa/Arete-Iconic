
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

        <title>arête Assets Management</title>

        <!-- Bootstrap core CSS -->


    </head>


    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>

        <main id="main" class="main">
            <div>
                <jsp:include page="../login/headerlink.htm?submodule=Tenant Details&tab=Approval 1&pagetype=list"/>
            </div>
            <div class="pagetitle">

            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">

                            <div class="card-body">
                                <p id="successMessage" style="text-align: center;color: blue;font-family:bold;">${message}</p>
                                <c:remove var="message" scope="session" /> 
                                <div class="card-title"><h5>Tenant Details Approval 1 List</h5></div> 
                                <!-- Table with stripped rows -->
                                <c:forEach items="${permission}" var="type">
                                                        <c:set var="add" value="${type.newEntry}"></c:set>
                                                        <c:set var="edit" value="${type.edit}"></c:set>
                                                        <c:set var="inactive" value="${type.inactive}"></c:set>
                                                        <c:set var="review" value="${type.review}"></c:set>
                                                        <c:set var="approve" value="${type.approve}"></c:set>
                                                    </c:forEach>
                                <div class="table-responsive">
                                    <table class="table datatable">
                                        <thead>

                                            <tr class="headings">
                                                <th>Tenant Code</th>
                                                <th>Tenant Name</th>
                                                <th>Property Name</th>
                                                <th>Billing Cycle</th>
                                                <th>Created Date</th>
                                                <th>Tenant Status</th>
                                                <th>Approval Status</th>
                                                <th class=" no-link last"><span class="nobr">Action</span>
                                                </th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach items="${tenantDetails1}" var="list">
                                                <c:set var="TenantCode" value="${list.tenantCode}"></c:set>
                                            </c:forEach>
                                            <c:forEach items="${tenantDetails}" var="list">
                                                <tr class="even pointer">                                                                   
                                                    <td class=""style="text-align: left;">${list.tenantCode}</td>
                                                    <td class=""style="text-align: left;">${list.tenantFname} ${list.tenantLname}</td>
                                                    <td class=" "style="text-align: left;">${list.assetNames}</td>
                                                    <td class=" "style="text-align: left;">${list.billingCycle}</td>
                                                    <td class=" "style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.creationDate}"/></td>
                                                    <td class=" "style="text-align: left;">${list.recordstatus}</td>
                                                    <td class=" "style="text-align: left;">${list.appstatus}</td>
                                                    <td class=" last" style="width: 250px;text-align: center;">
                                                        <c:if test="${approve eq 'y'}">
                                                            <a href="../tenant/tenantDetailsAppForm.htm?pk=${list.SNo}&llId=${list.llId}&contractPeriod=${list.contractPeriod}&assetName=${list.assetName}&subclassifiedAstno=${list.subclassifiedAstno}&action=edit" class="fa fa-check-circle-o fa-lg" title="Need Approval" style="">
                                                            <!--<svg aria-hidden="true" data-fa-processed="" data-prefix="fa" role="img" viewBox="0 0 384 512" class="fa fa-check-circle-o fa-lg"><path fill="currentColor" d="M369.9 97.9L286 14C277 5 264.8-.1 252.1-.1H48C21.5 0 0 21.5 0 48v416c0 26.5 21.5 48 48 48h288c26.5 0 48-21.5 48-48V131.9c0-12.7-5.1-25-14.1-34zm-22.6 22.7c2.1 2.1 3.5 4.6 4.2 7.4H256V32.5c2.8.7 5.3 2.1 7.4 4.2l83.9 83.9zM336 480H48c-8.8 0-16-7.2-16-16V48c0-8.8 7.2-16 16-16h176v104c0 13.3 10.7 24 24 24h104v304c0 8.8-7.2 16-16 16zM180.7 192h22.6c6.9 0 12.4 5.8 12 12.7l-6.7 120c-.4 6.4-5.6 11.3-12 11.3h-9.3c-6.4 0-11.6-5-12-11.3l-6.7-120c-.3-6.9 5.2-12.7 12.1-12.7zM220 384c0 15.5-12.5 28-28 28s-28-12.5-28-28 12.5-28 28-28 28 12.5 28 28z"></path>-->
                                                            </a>&nbsp;
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <c:if test="${TenantCode ne null || TenantCode ne ''}">

                                                <c:forEach items="${tenantDetails1}" var="list">
                                                    <tr class="even pointer">                                                                   
                                                        <td class=""style="text-align: left;">${list.tenantCode}</td>
                                                        <td class=""style="text-align: left;">${list.tenantFname} ${list.tenantLname}</td>
                                                        <td class=" "style="text-align: left;">${list.assetNames}</td>
                                                        <td class=" "style="text-align: left;">${list.billingCycle}</td>
                                                        <td class=" "style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.creationDate}"/></td>
                                                        <td class=" "style="text-align: left;">${list.recordstatus}</td>
                                                        <td class=" "style="text-align: left;">${list.appstatus}</td>
                                                        <td class=" last" style="width: 250px;text-align: center;">
                                                            <c:if test="${approve eq 'y'}">
                                                                <a href="../tenant/tenantDetailsAppForm.htm?pk1=${list.SNo}&llId1=${list.llId}&contractPeriod1=${list.contractPeriod}&assetName1=${list.assetName}&subclassifiedAstno1=${list.subclassifiedAstno}&action=edit1" class="fa fa-check-circle-o fa-lg" title="Need Approval" style="">
                                                                <!--<svg aria-hidden="true" data-fa-processed="" data-prefix="fa" role="img" viewBox="0 0 384 512" class="fa fa-check-circle-o fa-lg"><path fill="currentColor" d="M369.9 97.9L286 14C277 5 264.8-.1 252.1-.1H48C21.5 0 0 21.5 0 48v416c0 26.5 21.5 48 48 48h288c26.5 0 48-21.5 48-48V131.9c0-12.7-5.1-25-14.1-34zm-22.6 22.7c2.1 2.1 3.5 4.6 4.2 7.4H256V32.5c2.8.7 5.3 2.1 7.4 4.2l83.9 83.9zM336 480H48c-8.8 0-16-7.2-16-16V48c0-8.8 7.2-16 16-16h176v104c0 13.3 10.7 24 24 24h104v304c0 8.8-7.2 16-16 16zM180.7 192h22.6c6.9 0 12.4 5.8 12 12.7l-6.7 120c-.4 6.4-5.6 11.3-12 11.3h-9.3c-6.4 0-11.6-5-12-11.3l-6.7-120c-.3-6.9 5.2-12.7 12.1-12.7zM220 384c0 15.5-12.5 28-28 28s-28-12.5-28-28 12.5-28 28-28 28 12.5 28 28z"></path>-->
                                                            </a>&nbsp;
                                                            </c:if>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>

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
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </section>

        </main><!-- End #main -->
    </div>
    <script>
        function sendEmail(tC, Mail) {
            window.location.href = "../tenant/sendPOEmail.htm?tC=" + tC + "&tEmail=" + Mail + "&action=view";
        }
        
        function sendSMS(tC, Sms) {
            window.location.href = "../tenant/sendSMS.htm?tC=" + tC + "&tSms=" + Sms + "&action=view";
        }
    
        NProgress.done();
    </script>
        <jsp:include page="../login/footer.jsp"/>
    </body>

</html>
