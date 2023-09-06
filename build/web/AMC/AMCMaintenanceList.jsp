
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
                <jsp:include page="../login/headerlink.htm?submodule=AMC Management&tab=AMC Management&pagetype=list"/>
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
                                                <th>Property Name</th>
                                                <th>AMC ID</th>
                                                <th>Job Type</th>
                                                <th>Asset/Services</th>
                                                <th>Contact Person</th>
                                                
                                                <th class=" no-link last">Action </th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach items="${AMCMaintenanceList}" var="list">
                                             <tr class="even pointer">  
                                                 <td class=" " style="text-align: left;">${list.propertyName}</td>
                                                 <td class=" " style="text-align: left;">${list.amcId}</td>
                                                    <td class=" " style="text-align: left;">${list.amcType}</td>
                                                    <td class=" " style="text-align: left;">${list.serviceName}</td>
                                                    <td class=" " style="text-align: left;">${list.contactPerson}</td>
                                                    <td class="text-nowrap last">
                                                        <a href="../AMC/AMCMaintenanceForm.htm?pk=${list.SNo}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;
                                                     
                                                            <a href="../AMC/AMCMaintenanceForm.htm?pk=${list.SNo}&action=edit" class="fa fa-pencil-square-o fa-lg"title="Edit"></a>&nbsp;
                                                            <a href="../AMC/AMCMaintenanceForm.htm?pk=${list.SNo}&action=edit" class="fa fa-refresh fa-lg"title="Update"></a>&nbsp;

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
            content: '<p>Create, Search, View, Edit and Update Property Name, AMC ID, AMC Type, Asset/ Services, and Contact Person. </p>\n\
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
