
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
                <jsp:include page="../login/headerlink.htm?submodule=Service Request&tab=Approval 2&pagetype=list"/>
            </div>
            <div class="pagetitle">

            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">

                            <div class="card-body">
                                <div class="card-title"><h5>Service Request Approval 2 List</h5></div> 
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
                                                <th>Service Request No</th>
                                                <th>Service Request Date</th>
                                                <th>Service Request Name</th>
                                                <th>Tenant Code</th>
                                                <th>Completed By</th>
                                                <th>Record Status</th>
                                                <th class=" no-link last"><span class="nobr">Action</span>
                                                </th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach items="${RequestList}" var="list">
                                                <tr class="even pointer">                                                                   
                                                    <td class=" "style="text-align: left;">${list.serviceRequestNo}</td>
                                                    <td class=" "style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.serviceRequestDate}"/></td>
                                                    <td class=" "style="text-align: left;">${list.serviceRequesterName}</td>
                                                    <td class=" "style="text-align: left;">${list.tenantUniqueNo}</td>
                                                    <td class=" "style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.completedBy}"/></td>
                                                    <td class=" "style="text-align: left;">${list.recordstatus}</td>
                                                    <!--                                                                        <td class=" last" style="width: 250px">
                                                                                                                                <a href="../serviceReq/serviceRequestAppForm.htm?pk=${list.sno}&serviceRequestNo=${list.serviceRequestNo}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;
                                                                                                                                <a href="../serviceReq/serviceRequestForm.htm?pk=${list.sno}&serviceRequestNo=${list.serviceRequestNo}&action=edit" class="fa fa-pencil fa-lg"title="Edit"></a>&nbsp;
                                                                                                                                 </td>-->
                                                    <td class="center" style="">
                                                        <a href="../serviceReq/serviceRequestAppForm1.htm?pk=${list.sno}&serviceRequestNo=${list.serviceRequestNo}&propertyName=${list.propertyName}&propertyNo=${list.propertyNo}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;
                                                        <c:if test="${list.recordstatus ne 'CFO Approved'}">
                                                            <c:if test="${approve eq 'y'}">
                                                                <a class="fa fa-file-exclamation fa-lg" title="Need Approval" style="" href="../serviceReq/serviceRequestAppForm1.htm?pk=${list.sno}&serviceRequestNo=${list.serviceRequestNo}&propertyName=${list.propertyName}&propertyNo=${list.propertyNo}&action=edit">
                                                                    <svg aria-hidden="true" data-fa-processed="" data-prefix="fal" data-icon="file-exclamation" role="img" viewBox="0 0 384 512" class="svg-inline--fa fa-file-exclamation fa-w-12 fa-fw"><path fill="currentColor" d="M369.9 97.9L286 14C277 5 264.8-.1 252.1-.1H48C21.5 0 0 21.5 0 48v416c0 26.5 21.5 48 48 48h288c26.5 0 48-21.5 48-48V131.9c0-12.7-5.1-25-14.1-34zm-22.6 22.7c2.1 2.1 3.5 4.6 4.2 7.4H256V32.5c2.8.7 5.3 2.1 7.4 4.2l83.9 83.9zM336 480H48c-8.8 0-16-7.2-16-16V48c0-8.8 7.2-16 16-16h176v104c0 13.3 10.7 24 24 24h104v304c0 8.8-7.2 16-16 16zM180.7 192h22.6c6.9 0 12.4 5.8 12 12.7l-6.7 120c-.4 6.4-5.6 11.3-12 11.3h-9.3c-6.4 0-11.6-5-12-11.3l-6.7-120c-.3-6.9 5.2-12.7 12.1-12.7zM220 384c0 15.5-12.5 28-28 28s-28-12.5-28-28 12.5-28 28-28 28 12.5 28 28z"></path>
                                                            </svg></a> 
                                                                </c:if>
                                                            </c:if>

                                                    </td>
                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </section>

        </main><!-- End #main -->

        <jsp:include page="../login/footer.jsp"/>
    </body>

</html>
