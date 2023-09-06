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
<style>
    
       @media screen and (max-width: 600px){
                        
                            .table-responsive{
                                overflow-x: auto !important;
                            }
                             }
    </style> 

                </head>


                <body class="nav-md">
                    <jsp:include page="../login/menu.htm" />
                    <jsp:include page="../login/footer.jsp" />

                    <main id="main" class="main">
                        <div class="mt-3">
                            <jsp:include page="../login/headerlink.htm?submodule=Petty Cash Manager&tab=Petty Cash Transaction&pagetype=list" />
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
                                            <div class="row">
                                               <div class="col-md-4 mb-3 form-floating">
                                                <select class="form-select" id="" name="">
                                                    <option>Select an option</option>
                                                </select>
                                                    <label class="control-label">Select Wallet</label>
                                            </div>
                                            <div class="col-md-4 form-floating mb-3 pick1">
                                                <input placeholder="fill" class="form-control datepicker1" type="text">
                                                <label class="control-label">From</label>
                                            </div>
                                             <div class="col-md-4 form-floating mb-3 pick2">
                                                 <input placeholder="fill" class="form-control datepicker2" type="text">
                                                 <label class="control-label">To</label>
                                            </div>
                                                  </div>
                                              <div class="table-responsive">
                                                  
                                            <table class="table datatable table-hover table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>Wallet No</th>
                                                        <th>Wallet Name</th>
                                                        <th>Date</th>
                                                        <!--<th>Property Name</th>-->
                                                        <th>Opening Balance</th>
                                                        <th>Closing Balance</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                
                                                <tbody>
                                                    <c:forEach items="${pettyCashTransactionList}" var="type">
                                                    <tr>
                                                        <td>${type.transactionNumber}</td>
                                                        <td>${type.walletName}</td>
                                                        <td><fmt:formatDate pattern="dd-MM-yyyy" value="${type.lastmodifiedDate}"/></td>
                                                        <td>${type.openBalance}</td>
                                                        <td>${type.closingBal}</td>
                                                        <td class="text-nowrap last">
                                                            <a href="../tenant/pettyCashTransactionForm.htm?pk=${type.sNo}&transactionNumber=${type.transactionNumber}&action=view" class="fa fa-eye fa-lg" title="View"></a>
                                                            <a href="../tenant/pettyCashTransactionForm.htm?pk=${type.sNo}&transactionNumber=${type.transactionNumber}&action=edit" class="fa fa-pencil-square-o fa-lg" title="Edit"></a>
                                                          
                                                            <a href="#" class="fa fa-print fa-lg" title="Generate Statement"></a>
                                                           
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
            content: '<p>Create, Search, View, Edit, Add Amount, Generate Statement, and Inactivate with Wallet Number, Custodian Name, Deposit Amount, and Opening Balance with specific period, and wallet Option. </p>\n\
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
                     <script>
                           $(".datepicker1")
        .datepicker({
            format: "dd-M-yyyy",
            startDate: "0m +0m",
            autoclose: true,
            todayHighlight: true,
            container: ".pick1",
        })
        .datepicker("update", new Date());

   $(".datepicker2")
        .datepicker({
            format: "dd-M-yyyy",
            startDate: "0m +0m",
            autoclose: true,
            todayHighlight: true,
            container: ".pick2",
        })
        .datepicker("update", new Date());
                        
                        </script>
                </body>

                </html>