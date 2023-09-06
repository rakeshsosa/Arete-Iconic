
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
                <jsp:include page="../login/headerlink.htm?submodule=Service Request&tab=Rejected Service&pagetype=list"/>
            </div>
            <div class="pagetitle">

            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">

                            <div class="card-body">
                                <div class="card-title"><h5>Service Request Rejected List</h5></div> 
                                <!-- Table with stripped rows -->
                             
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
                                            <c:forEach items="${serviceRejList}" var="list">
                                                <tr class="even pointer">                                                                   
                                                    <td class=" "style="text-align: left;">${list.serviceRequestNo}</td>
                                                    <td class=" "style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.serviceRequestDate}"/></td>
                                                    <td class=" "style="text-align: left;">${list.serviceRequesterName}</td>
                                                    <td class=" "style="text-align: left;">${list.tenantUniqueNo}</td>
                                                    <td class=" "style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.completedBy}"/></td>
                                                    <td class=" "style="text-align: left;">${list.recordstatus}</td>
                                                    <td class="center" style="text-align: center;">
                                                        <a  href="../serviceReq/serviceRejForm.htm?pk=${list.sno}&serviceRequestNo=${list.serviceRequestNo}&propertyName=${list.propertyName}&propertyNo=${list.propertyNo}&action=view" class="fa fa-eye fa-lg"title="View">
                                                            </a> 

                                                    </td>
                                                    <!--                                                                        <td class=" last" style="width: 250px">
                                                                                                                                <a href="../serviceReq/serviceRequestAppForm.htm?pk=${list.sno}&serviceRequestNo=${list.serviceRequestNo}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;
                                                                                                                                <a href="../serviceReq/serviceRequestForm.htm?pk=${list.sno}&serviceRequestNo=${list.serviceRequestNo}&action=edit" class="fa fa-pencil fa-lg"title="Edit"></a>&nbsp;
                                                                                                                                 </td>-->
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
