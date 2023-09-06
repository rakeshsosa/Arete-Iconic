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
                                page="../login/headerlink.htm?submodule=Rent Posting and Tracking&tab=Rent Posting and Tracking&pagetype=list" />
                        </div>
                        <div class="pagetitle">

                        </div><!-- End Page Title -->
                        <section class="section">
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="card">

                                        <div class="card-body">
                                            <div class="card-title">
                                                
                                            </div>
                                            <!-- Table with stripped rows -->


                                             <table id="example" class="table datatable">
                            <thead>
                                <tr class="headings">
                                    
                                    <th>Invoice Date</th>
                                    <th>Invoice Number</th>
                                    <th>PD Cheque</th>
                                    <th>property Name</th>
                                    <th>Unit Number</th>
                                    <th>Due Date</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    
                                    <td id="qtnno">Test</td>
                                    <td>Test</td>
                                    <td>Test</td>
                                  
                                    <td>Test</td>
                                    <td>Test</td>
                                    <td>Test</td>

                                    <td>
                                        <select class="Status form-control">
                                            <option value="Active" selected>Active</option>
                                            <option value="Inactive"> Inactive </option>
                                            <option value="Quote on hold"> Quote on hold </option>
                                            <option value="Lost"> Lost Order </option>
                                        </select>
                                    </td>

                                    <td class="text-nowrap">
                                        <a class="fa fa-search-plus fa-lg" href="../invoice/rentInvoiceFormView.htm?sno=5005&amp;invoiceNo=INV-7&amp;action=view" data-toggle="tooltip" data-bs-original-title="View" aria-label="View"></a>
                                       </td>
                                </tr>
                            </tbody>
                        </table>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </section>

                    </main><!-- End #main -->

                    <jsp:include page="../login/footer.jsp" />
                </body>

                </html>