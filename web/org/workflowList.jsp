<%-- 
    Document   : assetDetailsList
    Created on : Sep 15, 2016, 10:42:18 AM
    Author     : Kondal Reddy N
--%>

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

         <title>Arete Iconic</title>
                     <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
        <!-- Bootstrap core CSS -->


    </head>


    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>
        <jsp:include page="../login/footer.jsp"/>

        <main id="main" class="main">
            <div class="mt-3">
                <jsp:include page="../login/headerlink.htm?submodule=Work Flow&tab=Work Flow Details&pagetype=list"/>
            </div>
            <div class="pagetitle">

            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">

                            <div class="card-body">
                                <div class="card-title"><h5>User List</h5></div> 
                                <!-- Table with stripped rows -->
                                <c:forEach items="${permission}" var="type">
                                                        <c:set var="add" value="${type.newEntry}"></c:set>
                                                        <c:set var="edit" value="${type.edit}"></c:set>
                                                        <c:set var="inactive" value="${type.inactive}"></c:set>
                                                        <c:set var="review" value="${type.review}"></c:set>
                                                        <c:set var="approve" value="${type.approve}"></c:set>
                                                    </c:forEach>
                                <div class="table-responsive">
                                    <table class="table datatable table-bordered table-hover">
                                        <thead>

                                            <tr class="headings">
                                                <th style="width:35%;">Submodule Name</th>
                                                <th style="width:35%;">Tab Name</th>
                                                <th style="width:30%;" class=" no-link last"><span class="nobr">Action</span>
                                                </th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach items="${wrklist}" var="list">
                                                <tr class="even pointer">      
                                                    <td class=" " style="text-align: left;">${list[0]}</td>
                                                    <td class=" " style="text-align: left;">${list[1]}</td>
                                                    <td class=" last">
                                                        <a href="../login/workflowView.htm?txn=${list[2]}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;
                                                        <a href="../login/workflowEdit.htm?txn=${list[2]}&action=edit" class="fa fa-pencil-square-o fa-lg"title="Edit"></a>&nbsp; 

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

    </body>

</html>
