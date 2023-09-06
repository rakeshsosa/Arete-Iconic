
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
                <jsp:include page="../login/headerlink.htm?submodule=Property Area Management&tab=Accessories Tagging&pagetype=list"/>
            </div>
            <div class="pagetitle">

            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">

                            <div class="card-body">
                                <div class="card-title"><h5>Property Area List</h5></div> 
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
                                                <th>Flat Code</th>
                                                <th>Flat Name / Flat_No.</th>
                                                <th>Property Code</th>
                                                <th>Property Name</th>
                                                <!--<th>Type Sequence No</th>-->
                                                <th class=" no-link last"><span class="nobr">Action</span>
                                                </th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:set var="dupImNo" value="0"/>
                                            <c:forEach items="${accessoriesList}" var="list">
                                                <c:if test="${dupImNo != list[3]}">
                                                    <tr class="even pointer">                                                                   
                                                        <td class=" "style="text-align: left;">${list[3]}</td>
                                                        <td class=" "style="text-align: left;">${list[4]}</td>
                                                        <td class=" "style="text-align: left;">${list[0]}</td>
                                                        <td class=" "style="text-align: left;">${list[1]}</td>
                                                        <td class=" last" style="width: 250px;text-align: left;">
                                                            <a href="../assets/accessoriesDetailsForm.htm?pk=${list[2]}&assetCode=${list[0]}&subAssetCode=${list[3]}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;
                                                            <c:if test="${edit eq 'y'}">
                                                                <a href="../assets/accessoriesDetailsFormEdit.htm?pk=${list[2]}&assetCode=${list[0]}&subAssetCode=${list[3]}&action=edit" class="fa fa-pencil fa-lg"title="Edit"></a>&nbsp;
                                                            </c:if>
                                                        </td>
                                                    </tr>
                                                    <c:set value="${list[3]}" var="dupImNo"/>
                                                </c:if>
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
