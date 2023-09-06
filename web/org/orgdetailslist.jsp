
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
                <jsp:include page="../login/headerlink.htm?submodule=Organisation&tab=Organisation Details&pagetype=list"/>
            </div>
            <div class="pagetitle">

            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">

                            <div class="card-body">
                                <div class="card-title"><h5>Organisation List</h5></div> 
                                <!-- Table with stripped rows -->

                                <div class="table-responsive">
                                    <table class="table datatable table-hover table-bordered">

                                   
                                        <thead>

                                            <tr class="headings">
                                                <th style="width:20%;">Organisation Code</th>
                                                <th style="width:20%;">Organisation Name</th>
                                                <th style="width:20%;">Address</th>
                                                <th style="width:25%;" class=" no-link last"><span class="nobr">Action</span>
                                                </th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach items="${orglist}" var="list">
                                                <c:forEach items="${subgrouplist}" var="list1">
                                                    <c:if test="${list1.suborgCode eq list.suborgCode}">
                                                        <c:set var="sgname" value="${list1.suborgName}"/>
                                                        <c:set var="sgcode" value="${list1.suborgCode}"/>
                                                    </c:if>
                                                </c:forEach>
                                                <c:forEach items="${grouplist}" var="list2">
                                                    <c:if test="${list2.groupCode eq sgcode}">
                                                        <c:set var="gname" value="${list2.groupName}"/>
                                                    </c:if>
                                                </c:forEach>
                                                <tr class="even pointer">
                                                    <td class=" " style="text-align: left;">${list.orgCode}</td>
                                                    <td class=" " style="text-align: left;">${list.orgName}</td>
                                                    <td class=" " style="text-align: left;">${list.orgAddress}</td>
                                                    <td class=" last" style="">
                                                        <a href="../login/orgform.htm?pk=${list.sno}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;
                                                        <a href="../login/orgform.htm?pk=${list.sno}&action=edit" class="fa fa-pencil-square-o fa-lg" title="Edit"></a>&nbsp;
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

        <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
        <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
        <script type="text/javascript">
        tippy('#information', {
            content: '<p>View, Edit, Create and Search Organisation Code, Name, and Address. </p>\n\
             ',
            allowHTML: true,
            hideOnClick: true,
            trigger: 'click',
            onShow: function(reference){
		setTimeout(function() {
			reference.hide();
                         reference.reference.blur(); // for a second touch opening, lose focus
		}, 30000);
                    }
        });
        </script>
    </body>

</html>