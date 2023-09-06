
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
                <jsp:include page="../login/headerlink.htm?submodule=Vacate&tab=Vacate&pagetype=list"/>
            </div>
            <div class="pagetitle">

            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">

                            <div class="card-body">
                                <div class="card-title"><h5>Vacating Details List</h5></div> 
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

                                                <th>Vacate Form No </th>
                                                <th>Tenant Name </th>
                                                <th>Property Code</th>
                                                <th>Flat Code</th>


                                                <th class=" no-link last"><span class="nobr">Action</span>
                                                </th>
                                            </tr>
                                        </thead>

                                        <tbody>

                                            <c:forEach items="${vacatingList}" var="type">
                                                <c:forEach items="${assetDetails}" var="asset">
                                                    <c:if test="${asset.assetCode eq type.propertyName}">
                                                        <c:set var="assetName1" value="${asset.assetName}"/>
                                                        <c:set var="assetCode1" value="${asset.assetCode}"/>

                                                    </c:if> 
                                                </c:forEach>
                                                <c:forEach items="${subAssetDetails}" var="subasset">
                                                    <c:if test="${subasset.subAssetCode eq type.propertyNo}">
                                                        <c:set var="subAssetName1" value="${subasset.subAssetName}"/>
                                                        <c:set var="subAssetCode1" value="${subasset.subAssetCode}"/>

                                                    </c:if> 
                                                </c:forEach>
                                                <tr>
                                                    <td class="center" style="text-align: left;text-transform: capitalize;">${type.vacatingCode}</td>
                                                    <td class="center" style="text-align: left;text-transform: capitalize;">${type.tenantName}</td>
                                                    <td class="center" style="text-align: left;text-transform: capitalize;">${assetName1}</td>
                                                    <td class="center" style="text-align: left;text-transform: capitalize;">${subAssetName1}</td>




                                                    <td class="center" style="">
                                                        <a  href="../CRM/vacatingForm.htm?sno=${type.sno}&assetCode=${type.propertyName}&subAssetCode=${type.propertyNo}&action=view" class="fa fa-eye fa-lg"title="View" >
                                                                                                       
                                                        </a>
                                                        <c:if test="${edit eq 'y'}">
                                                            <a class="fa fa-pencil fa-lg" href="../CRM/vacatingForm.htm?sno=${type.sno}&assetCode=${type.propertyName}&subAssetCode=${type.propertyNo}&action=edit" title="Edit">
                                                                  
                                                            </a>
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
