
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
                <jsp:include page="../login/headerlink.htm?submodule=Utility Details&tab=Utility Details&pagetype=list"/>
            </div>
            <div class="pagetitle">

            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">

                            <div class="card-body">
                                <div class="card-title"><h5>Utility Details List</h5></div> 
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
                                                <th>SNo</th>
                                                <th>Tenant Name</th>
                                                <th>Tenant Category</th>
                                                <th>Tenant Code</th>                                                                    
                                                <th>From Date</th>
                                                <th>To Date</th>
                                                <th>Electric Bill</th>
                                                <th>Water Bill</th>
                                                <th>Parking Bill</th>
                                                <th>Maintaince Bill</th>
                                                <th>Contract No.</th>
                                                <th>Total Amount</th>
                                                <th class=" no-link last"><span class="nobr">Actions</span>
                                                </th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach items="${utilityDetails}" var="list">
                                                <tr class="even pointer">                                                             

                                                    <td style="text-align: left;">${list.SNo}</td>
                                                    <td style="text-align: left;">${list.tenantFname} ${list.tenantLname}</td>
                                                    <td style="text-align: left;">${list.tenantCategory}</td>
                                                    <td style="text-align: left;">${list.tenantCode}</td>                                                                        
                                                    <td class=" " style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.period}"/></td>
                                                    <td class=" " style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.toDate}"/></td>
                                                    <td style="text-align: left;">${list.electricBill}</td>
                                                    <td style="text-align: left;">${list.waterBill}</td>
                                                    <td style="text-align: left;">${list.parkingBill}</td>
                                                    <td style="text-align: left;">${list.maintainceBill}</td>
                                                    <td style="text-align: left;">${list.tenantContactno}</td>
                                                    <td style="text-align: left;">${list.totalAmount}</td>

                                                    <td class="sorting_2" >
                                                        <a href="../utility/utilityDetailsForm.htm?SNo=${list.SNo}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;

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
