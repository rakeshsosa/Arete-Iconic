
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
                <jsp:include page="../login/headerlink.htm?submodule=User Role&tab=Department Module&pagetype=list"/>
            </div>
            <div class="pagetitle">

            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">

                            <div class="card-body">
                                <div class="card-title"><h5>Module List</h5></div> 
                                <!-- Table with stripped rows -->

                                <div class="table-responsive">
                                    <table class="table datatable table-bordered table-hover">
                                        <thead>

                                            <tr class="headings">
                                                <th style="width:18%;">Organisation</th>
                                                <th style="width:17%;">Module Name</th>
                                                <th style="width:20%;">SubModule Name</th>
                                                <th style="width:15%;">Tab Name</th>
                                                <th style="width:15%;">List</th>
                                                <th style="width:15%;">Form</th>
                                                <!--<th class=" no-link last"><span class="nobr">Action</span></th>-->
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach items="${modulelist}" var="list">
                                                <c:forEach items="${orglist}" var="list2">
                                                    <c:if test="${list2.sno eq list.orgCode}">
                                                        <c:set var="oname" value="${list2.orgName}"/>
                                                    </c:if>
                                                </c:forEach>
                                                <tr class="even pointer">
                                                    <td class=" " style="text-align: left;">${oname}</td>
                                                    <td class=" " style="text-align: left;">${list.moduleName}</td>
                                                    <td class=" " style="text-align: left;">${list.submoduleName}</td>
                                                    <td class=" " style="text-align: left;">${list.tabName}</td>
                                                    <td class=" " style="text-align: left;">${list.listLink}</td>
                                                    <td class=" " style="text-align: left;">${list.formLink}</td>
                                                    <!--<td class=" last"><a href="#">View</a></td>-->
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
            content: '<p>  View, Search and Create Organisation, Module, Sub-Module, and Tab Names, Lists, and Forms. </p>\n\
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