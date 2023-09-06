<%-- 
    Document   : registerLetterList
    Created on : 7 Mar, 2017, 3:27:51 PM
    Author     : Akshata
--%>
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
        <ul class="nav nav-pills">
          <li class="nav-item"><a class="nav-link active" href="../finance/paymentHistoryList.jsp">Payment History</a></li>
        </ul>
        <br />
<!--        <div class="text-end">
            <a class="btn btn-primary btn-sm" href="../finance/ledgerForm.htm"><i class="bi bi-plus"></i> Create New Ledger</a>
        </div>-->
    </div>

    <div class="pagetitle"></div>
    <!-- End Page Title -->
    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title"><h5>Ledger List</h5></div>
                        <div class="table-responsive">
                            <table id="example" class="table datatable" style="overflow-y: scroll;">
                                <thead>
                                    <tr class="headings">
                                    
                                        <th>Invoice Number</th>
                                        <th>Payment Date</th>
                                        <th>Payment Type</th>
                                        <th>Total Payable</th>
                                        <th>Amount Paid</th>
                                        <th>Transaction Ref No</th>
                                        <th class="no-link last"><span class="nobr">Action</span></th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach items="${ledgerList}" var="type">
                                                                <tr class="even pointer">
                                                                <td class="center">${type.ledgerGroup}</td>
                                                                <td class="center">${type.ledgerNo}</td>
                                                                <td class="center">${type.ledgerName}</td>
                                                                <td class="center">${type.ledgerDescription}</td>
                                                                <td class="center">${type.ledgerOpeningBalance}</td>
                                                                                                                                        
                                                                    <td>
                                            <a href="../finance/ledgerFormView.htm?SNo=${type.ledgerMasterPk}" class="fa fa-eye fa-lg" data-toggle="tooltip" title="View"></a>  <!-- &action=view -->

                                            <a class="fa fa-edit fa-lg" href="../finance/ledgerFormEdit.htm?SNo=${type.ledgerMasterPk}" data-toggle="tooltip" title="Edit"> </a>   <!-- &action=edit -->

                        <%--                    <a
                                                class="fa fa-trash fa-lg"
                                                data-toggle="tooltip"
                                                title="Active"
                                                href="javascript:"
                                                onClick="
                                                swal({
                                                      text:'Do you really wish to make this EXPENSE CATEGORY ACTIVE? Please confirm.',
                                                      buttons: ['Cancel','OK']
                                                  }).then(function(isConfirm){
                                                         if (isConfirm) {         
                                                            window.location.href = '../Expenses/expenseCategoryDel.htm?expensesCategoryNumber=&status=';
                                                         }
                                                         })"
                                            >
                                            </a>  --%>
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
</main>


    <jsp:include page="../login/footer.jsp"/>
     <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
        <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
        <script type="text/javascript">
        tippy('#information', {
            content: '<p>Create, View, Search, Edit, Activate and Inactivate Account Group, Ledger Code, Ledger Account Name, Ledger Account Description, and Opening Balance. </p>\n\
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
