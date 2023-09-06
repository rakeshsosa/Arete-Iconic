
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
                <jsp:include page="../login/headerlink.htm?submodule=AMC Management&tab=AMC Jobs&pagetype=list"/>
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
                                <div class="card-title"><h5>AMC Jobs</h5></div> 
                                <!-- Table with stripped rows -->
                                
                                <div class="table-responsive">
                                    <table id="example" class="table datatable" style="overflow-y:scroll;">
                                        <thead>

                                            <tr class="headings">
                                               <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Flat Name / Flat_No.: activate to sort column ascending" style="width: 140px;">
                                                    Property Name
                                                </th>
                                                <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Property Code: activate to sort column ascending" style="width: 100px;">
                                                    AMC ID
                                                </th>
                                                <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Property Name: activate to sort column ascending" style="width: 100px;">
                                                    AMC Type
                                                </th>
                                                <th>Service</th>
                                                <th>Priority</th>
                                                <th>Assigned To</th>
                                                <th>Due Date</th>
                                                <th>Status</th>
                                                <th>
                                                    <span class="nobr">Action</span>
                                                </th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach items="${AMCJobsList}" var="list">
                                                <tr class="even pointer">      
                                                    <td class=" " style="text-align: left;">${list.amcType}</td>
                                                    <td class=" " style="text-align: left;">${list.priority}</td>
                                                    <td class=" " style="text-align: left;">${list.cost}</td>
                                                    <td class=" " style="text-align: left;">${list.dueDate}</td>
                                                    <td class=" last" style="text-align:center;width: 300px;">
                                                        <a href="../AMC/AMCJobsForm.htm?pk=${list.SNo}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;
                                                     
                                                            <a href="../AMC/AMCJobsForm.htm?pk=${list.SNo}&action=edit" class="fa fa-pencil fa-lg"title="Edit"></a>&nbsp;

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
