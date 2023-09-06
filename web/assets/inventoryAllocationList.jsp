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

                    <title>arête Assets Management</title>

                    <!-- Bootstrap core CSS -->


                </head>


                <body class="nav-md">
                    <jsp:include page="../login/menu.htm" />

                    <main id="main" class="main">
                        <div>
                            <jsp:include
                                page="../login/headerlink.htm?submodule=Inventory Allocation&tab=Inventory Allocation&pagetype=list" />
                        </div>
                        <div class="pagetitle">

                        </div><!-- End Page Title -->
                        <section class="section">
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="card">

                                        <div class="card-body">
                                            <div class="card-title">
                                                <h5>Inventory Allocation List</h5>
                                            </div>
                                            <!-- Table with stripped rows -->

                                            <div class="table-responsive">
                                            <table class="table datatable">
                                               
                                                            <thead>
                                                                <tr class="headings">



                                                                    <th>Item Code</th>
                                                                    <th>Item Name</th>
                                                                    <!--<th>PO No</th>-->

                                                                    <th>Total Stock</th>
                                                                    <th>UOM</th>
                                                                    <th>Store</th>
                                                                    <th>Actions</th>


                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                 <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    
                                                                    <td></td>
                                                                    <td class="no-link last" style="width: 200px">
                                                                        <a href="#" class=""><i data-toggle="tooltip" class="fa fa-plus-circle fa-lg" title="Add Inventory"></i></a>
                                                                       <a href="#" class=""><i data-toggle="tooltip" class="fa fa-bars fa-lg" title="Allocate Inventory"></i></a>
                                                                         <a href="../quality/inventoryCountForm.htm" class=""><i data-toggle="tooltip" class="fa fa-adjust fa-lg" title="Adjust Inventory"></i></a>
                                                                    </td>
                                                                </tr>
                                                               
                                                            </tbody>

                                                        
                                                
                                            </table>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </section>

                    </main><!-- End #main -->

                    <jsp:include page="../login/footer.jsp" />
                </body>

                </html>