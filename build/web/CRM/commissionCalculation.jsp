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
                            <jsp:include
                                page="../login/headerlink.htm?submodule=Commission Calculation&tab=Commission Calculation&pagetype=list" />
                        </div>
                        <div class="pagetitle">

                        </div><!-- End Page Title -->
                        <section class="section">
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="card">

                                        <div class="card-body">
                                            <div class="card-title">
                                                <h5>Commission Calculation List</h5>
                                            </div>
                                            <!-- Table with stripped rows -->


                                            <table class="table datatable table-hover table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>Lead Referral Type</th>
                                                        <th>Agent Name</th>
                                                        <th>Property Name</th>
                                                        <th>Unit Number</th>
                                                        <th>Commission Percentage</th>
                                                        <th>Status</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>Test</td>
                                                        <td>Test</td>
                                                         <td>Test</td>
                                                          <td>Test</td>
                                                          <td><input type="text" class="form-control"> </td>
                                                        <td>
                                                            <a href="#" class="fa fa-eye fa-lg"title="View"></a>&nbsp;
                                                            
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

                     <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
        <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
        <script type="text/javascript">
        tippy('#information', {
            content: '<p>Search and View Lead Referral Type, Agent Name, Property Name, Unit Number and Commision Percentage. </p>\n\
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