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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Arete Iconic</title>
    <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
</head>
<body class="nav-md">
<jsp:include page="../login/menu.htm"/>
<jsp:include page="../login/footer.jsp"/>

  <main id="main" class="main">
      <div class="mt-3">
        <ul class="nav nav-pills">
            <li class="nav-item"><a class="nav-link" href="../finance/ledgerList.jsp">Ledger</a></li>
            <li class="nav-item"><a class="nav-link" href="../finance/calendarMasterList.jsp">Calendar Period</a></li>
            <li class="nav-item"><a class="nav-link" href="../finance/bankMasterList.jsp">Bank</a></li>
            <li class="nav-item"><a class="nav-link active" href="../finance/earningDeductionMasterList.jsp">Earning Deduction</a></li>
            <li class="nav-item"><a class="nav-link" href="../finance/assetsList.jsp">Assets</a></li>
            <li class="nav-item"><a class="nav-link" href="../finance/liabiliatiesList.jsp">Liabilities</a></li>
        </ul>
        <br />
        <div class="text-end">
            <a class="btn btn-primary btn-sm" href="../finance/earningDeductionMasterForm.jsp"><i class="bi bi-plus"></i> Create Earning Deduction</a>
        </div>
    </div>

    <div class="pagetitle"></div>
    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title"><h5>Earning Deduction List</h5></div>

                        <div class="table-responsive">
                            <table id="example" class="table datatable table-hover table-bordered" style="overflow-y: scroll;">
                                <thead>
                                    <tr class="headings">
                                        <th style="width:25%;">Earning Deduction Code</th>
                                        <th style="width:23%;">Earning Deduction Description</th>
                                        <th style="width:17%;">Account Code</th>
                                        <th style="width:25%;">Earning Deduction Flag</th>
                                        <th style="width:10%;" class="no-link last"><span class="nobr">Action</span></th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <tr>
                                        <td>Test</td>
                                        <td>Test</td>
                                        <td>Test</td>
                                        <td>Test</td>
                                        <td>
                                            <a href="#" class="fa fa-eye fa-lg" data-toggle="tooltip" title="View"></a>
                                            <a class="fa fa-edit fa-lg" href="#" data-toggle="tooltip" title="Edit"> </a>
                                            <a
                                                class="fa fa-trash fa-lg"
                                                data-toggle="tooltip"
                                                title="Active"
                                                href="javascript:"
                                                onClick="
                                                swal({
                                                      text:'Do you really wish to make this earning deduction ACTIVE? Please confirm.',
                                                      buttons: ['Cancel','OK']
                                                  }).then(function(isConfirm){
                                                         if (isConfirm) {         
                                                            window.location.href = '../Expenses/expenseCategoryDel.htm?expensesCategoryNumber=${type[0]}&status=${type[1]}';
                                                         }
                                                         })"
                                            >
                                            </a>
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
</main>

 <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
        <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
        <script type="text/javascript">
        tippy('#information', {
            content: '<p>Create, Search, View, Edit and Activate ED Code, Description, Account code, and ED Flag. </p>\n\
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
