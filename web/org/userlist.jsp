
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
                <jsp:include page="../login/headerlink.htm?submodule=User&tab=User&pagetype=list"/>
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

                                <div class="table-responsive">
                                    <table class="table datatable table-hover table-bordered">
                                        <thead>

                                            <tr class="headings">
                                                <th style="width:22%;">Organisation Name</th>
                                                <th style="width:20%;">Department Name</th>
                                                <th style="width:15%;">Role Name</th>
                                                <th style="width:13%;">User Id</th>
                                                <th style="width:15%;">User Name</th>
                                                <th style="width:15%;" class=" no-link last"><span class="nobr">Action</span>
                                                </th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach items="${userlist}" var="list">

                                                <tr class="even pointer">
                                                    <td class=" " style="text-align: left;">${list.orgName}</td>
                                                    <td class=" " style="text-align: left;">${list.departmentName}</td>
                                                    <td class=" " style="text-align: left;">${list.roleName}</td>
                                                    <td class=" " style="text-align: left;">${list.userId}</td>
                                                    <td class=" " style="text-align: left;">${list.userFName}${list.userLName}</td>
                                                    <td class=" last " style="text-align: center;">
                                                        <a href="../login/useredit.htm?userId=${list.userId}&pk=${list.SNo}" class="fa fa-key fa-lg" title="Reset Password"></a>
                                                        <a href="../login/userformEdit.htm?userId=${list.userId}&pk=${list.SNo}&orgName=${list.orgName}&action=edit" class="fa fa-pencil-square-o fa-lg" title="Edit"></a>
                                                        <a class="fa fa-trash fa-lg" title="Inactive"  href="../login/userDel.htm?sno=${list.SNo}" onclick="if (confirm('Do you really want to delete this record?')) {
                                                                    return true;
                                                                } else {
                                                                    return false;
                                                                }">

                                                        </a>
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
            content: '<p>  Create, Reset, Edit, Inactivate, and Search Organisation Name, Department Name, Role Name, User ID, and User Name. </p>\n\
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