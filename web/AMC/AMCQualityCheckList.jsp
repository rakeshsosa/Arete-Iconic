
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
    </head>


    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>

        <main id="main" class="main">
            <div>
                <jsp:include page="../login/headerlink.htm?submodule=AMC Management&tab=AMC QualityCheck&pagetype=null"/>
            </div>
            <div class="pagetitle">

            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">

                            <div class="card-body">
                                <p id="successMessage" style="text-align: center;color: blue;font-family:bold;">${message}</p>
                                <c:remove var="message" scope="session" /> 
                                <div class="card-title"><h5>AMC QC List</h5></div> 
                                <!-- Table with stripped rows -->
                                
                                <div class="table-responsive">
                                    <table id="example" class="table datatable">
                                        <thead>

                                            <tr class="headings">
                                                <th>AMC Type</th>
                                                <th>Schedule</th>
                                                <th>Vendor</th>
                                                <th class=" no-link last"><span class="nobr">Action</span>
                                                </th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach items="${AMCMaintenanceList}" var="list">
                                                <tr class="even pointer">      
                                                    <td class=" " style="text-align: left;">${list.amcType}</td>
                                                    <td class=" " style="text-align: left;">${list.schedule}</td>
                                                    <td class=" " style="text-align: left;">${list.vendor}</td>
                                                    <td class=" last" style="text-align:center;width: 300px;">
                                                        <a href="../AMC/AMCMaintenanceFormEdit.htm?pk=${list.SNo}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;
                                                     
                                                            <a href="../AMC/AMCMaintenanceFormEdit.htm?pk=${list.SNo}&action=edit" class="fa fa-pencil fa-lg"title="Edit"></a>&nbsp;
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


    </div>
        <jsp:include page="../login/footer.jsp"/>
    </body>

</html>
