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
                           <ul class="nav nav-pills">
                <li class="nav-item "><a class="nav-link" href="../tenant/serviceChargeList.jsp">Service</a></li> &nbsp;
                <li class="nav-item"><a class="nav-link active" href="../tenant/rateCardList.jsp">Rate Card</a></li>&nbsp; 
                <br>
                
              
                           </ul>  
                            
<!--                            <%--<jsp:include--%>
                                page="../login/headerlink.htm?submodule=Units Contracts Manager&tab=Contracts Creation&pagetype=list" />-->
                       
                         </div>   
                                
                                   
               
                <div class="pagetitle">

                        </div><!-- End Page Title -->
                        <section class="section">
                            <div class="row">
                               
                                <div class="col-lg-12">

                                    <div class="card">

                                        <div class="card-body">
                                            <div class="card-title">
<!--                                                <h5>Units Contract Template List</h5>-->
                                            </div>
                                            <!-- Table with stripped rows -->

                                            <div class="table-responsive">
                                            <table class="table datatable table-hover table-bordered">
					<thead>
                                                                <tr class="headings">
                                                                    <!--<th>Contract Code</th>-->
                                                                    <th>Rate Card ID</th>
                                                                    <th>Rate Card Name</th>
                                                                    <th>Property Name</th>
                                                                    <th>Adhoc Service Name</th>
                                                                     <th>Service Price</th>
                                                                     <th>VAT</th>
                                                                    <th>Final Price</th>
                                                                   
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                <%--<c:forEach items="${unitContractList}" var="list">--%>
                                                                <tr class="even pointer"> 
                                                                   
                                                                            <td style="text-align: left;">1</td>
                                                                        <td style="text-align: left;">painting 1st floor</td>
                                                                        <td style="text-align: left;">Samsung Group</td>
                                                                         <td style="text-align: left;">wall Painting</td>
                                                                         <td style="text-align: left;">10</td>
                                                                        <td style="text-align: left;">10%</td>
                                                                        <td style="text-align: left;">11</td>
                                                                        <!--<td style="text-align: left;"></td>-->
                                                                        <td class=" last " style="text-align: center;">
<!--                                                                             <a href="../insurance/tenantContractFormView.htm?contractCode=${list[0]}" class="fa fa-eye fa-lg"title="View"></a>&nbsp;
                                                                            <a href="../insurance/tenantContractFormEdit.htm?contractCode=${list[0]}" class="fa fa-pencil fa-lg"title="Edit" ></a>&nbsp;
                                                                            <a href="#" class="fa fa-thumbs-up fa-lg"title="Approval"></a>&nbsp;
                                                                            <a href="../insurance/tenantContractRenewForm.htm?contractCode=${list[0]}" class="fa fa-recycle fa-lg" data-toggle="tooltip" title="Renew"></a>&nbsp;   -->
                                                                            
                                                                            <a href="../tenant/rateCardView.jsp" class="fa fa-eye fa-lg"title="View"></a>&nbsp;
<!--                                                                            <a href="../tenant/rateCardAdd.jsp" class="fa fa-plus-circle fa-lg"title="Add"></a>&nbsp;
                                                                            <a href="../tenant/serviceChargeEdit.jsp" class="fa fa-edit fa-lg"title="Edit" ></a>&nbsp;-->
                                                                            <!--<a href="#" class="fa fa-thumbs-up fa-lg"title="Approval"></a>&nbsp;-->
                                                                            <!--<a href="../insurance/tenantContractRenewForm.htm" class="fa fa-recycle fa-lg" data-toggle="tooltip" title="Renew"></a>&nbsp;-->       

                                                                        </td>

                                                                    </tr>
                                                                    
                                                              
                                                                    <!--</tr>-->
                                                                <%--</c:forEach>--%> 

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
            content: '<p>Create, Search, View, Edit, Approve and Renew the Contract Code, Municipal Agreement Number, Property Name & Number, Contract Period, Renewal Date, and Approval Status. </p>\n\
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