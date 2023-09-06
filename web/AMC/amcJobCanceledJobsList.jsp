<%-- Document : assetDetailsList Created on : Sep 15, 2016, 10:42:18 AM Author : Kondal Reddy N --%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
                    <jsp:include page="../login/menu.htm" />
                    <jsp:include page="../login/footer.jsp" />

                    <main id="main" class="main">
                        <div class="mt-3">
                          <jsp:include page="../login/headerlink.htm?submodule=AMC Job Tracking&tab=Canceled Jobs&pagetype=list"/>
                        </div>
                        <div class="pagetitle">

                        </div><!-- End Page Title -->
                        <section class="section">
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="card">

                                        <div class="card-body">
                                            <div class="card-title">
                                                <h5>AMC Job Tracking</h5>
                                            </div>
                                            <!-- Table with stripped rows -->

                                            <div class="table-responsive">
                                            <table class="table datatable table-hover table-bordered">
                                                <thead>
                                                    <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Flat Name / Flat_No.: activate to sort column ascending" style="width: 140px;">
                                                        Property Name
                                                    </th>
                                                    <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Property Code: activate to sort column ascending" style="width: 100px;">
                                                        AMC Id
                                                    </th>
                                                    <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Property Name: activate to sort column ascending" style="width: 100px;">
                                                        Job Type
                                                    </th>
                                                    <th>Service</th>
                                                    <th>Priority</th>
                                                    
                                                    <th>Due Date</th>
                                                    <th>Status</th>
                                                    <th>
                                                        <span class="nobr">Action</span>
                                                    </th>
                                                </thead>
                                                
                                                 <tbody>
                                            <c:forEach items="${AMCMaintenanceList}" var="list">
                                                
                                                <c:if test="${list.amsStatus eq 'Cancel'}">
                                             <tr class="even pointer">  
                                                 <td class=" " style="text-align: left;">${list.propertyName}</td>
                                                 <td class=" " style="text-align: left;">${list.amcId}</td>
                                                    <td class=" " style="text-align: left;">${list.amcType}</td>
                                                    <td class=" " style="text-align: left;">${list.serviceName}</td>
                                                    <td class=" " style="text-align: left;">${list.priority}</td>
                                                    <td class=" " style="text-align: left;"><fmt:formatDate pattern="dd-MM-yyyy" value="${list.dueDate}"/></td>
                                                    <td class=" " style="text-align: left;">${list.amsStatus}</td>
                                                    <td class=" last" style="text-align:center;">
                                                        <a href="../AMC/AMCMaintenanceForm.htm?pk=${list.SNo}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;
                                                     
                                                            
                                                    </td>
                                                </tr>
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

                     <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
        <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
        <script type="text/javascript">
        tippy('#information', {
            content: '<p>Search, View and Add Property Name, AMC Id, AMC Type, Service, Priority, Due date and Status.</p>\n\
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