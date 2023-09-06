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

                </head>


                <body class="nav-md">
                    <jsp:include page="../login/menu.htm" />
                    <jsp:include page="../login/footer.jsp" />

                    <main id="main" class="main">
                        <div class="mt-3">
                            <jsp:include page="../login/headerlink.htm?submodule=Vendor Details&tab=Vendor Details&pagetype=list" />
                        </div>
                        <div class="pagetitle">

                        </div><!-- End Page Title -->
                        <section class="section">
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="card">

                                        <div class="card-body">
                                            <div class="card-title">
                                                <h5>Supplier Details List</h5>
                                            </div>
                                            <!-- Table with stripped rows -->

                                            <div class="table-responsive">
                                            <table class="table datatable table-bordered table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>Vendor Code</th>
                                                    <th>Vendor Name</th>
                                                    <th>Mobile</th>
                                                    <th>Email</th>
                                                    <th>Action</th>
                                                    </tr>
                                                </thead>
                                                 <tbody>
                <c:forEach items="${vendorReqList}" var="list">
                    <tr class="even pointer">                                                                   
                        <td style="text-align: left;">${list[0]}</td>
                        <td style="text-align: left;">${list[1]}</td>
                        <td style="text-align: left;">${list[3]}</td>
                        <td style="text-align: left;">${list[4]}</td>

                        <td class="last text-nowrap">
                            <a href="../purchase/supplierDetailsView.htm?sno=${list[0]}&action=view" class="fa fa-eye fa-lg" title="View"></a>&nbsp;
                            <a href="../purchase/supplierDetailsForm.htm?sno=${list[0]}&action=edit" class="fa fa-pencil-square-o fa-lg" title="Edit"></a>&nbsp;
<!--                            <a href="#" class="fa fa-pencil fa-lg"title="Edit"></a>&nbsp;-->

                        </tr>
                </c:forEach> 

            </tbody>
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
            content: '<p>View, Edit, Add, and Search Vendor Code, Vendor Name, Mobile, and Email. </p>\n\
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