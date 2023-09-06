<%-- 
    Document   : chartOfAccountsForm
    Created on : 30 Mar, 2017, 11:08:37 AM
    Author     : Akshata
--%>
<%@page import="java.util.Date"%>
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
            <a class="btn btn-primary btn-sm" href="../finance/earningDeductionMasterList.jsp"><i class="bi bi-eye"></i> Show Earning List</a>
        </div>
    </div>
    <div class="pagetitle"></div>
    <!-- End Page Title -->
    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title"><h5>Earning Deduction Master Form</h5></div>

                        <form class="row validateForm" id="coustmermnForm" accept-charset="UTF-8" method="post" action="../Transactional/chartOfAccountsSubmit.htm" enctype="multipart/form-data" commandName="coa">
                            <div id="spinner" class="spinner" style="display: none;">
                                <img id="img-spinner" src="spinner.gif" alt="Loading" />
                            </div>

                            <div class="col-md-4 form-floating mb-3">
                                <input type="text" autocomplete="off" id="costcentername" required name="costcentername" maxlength="50" class="form-control capitalize validate[required]" value="" placeholder="Account Description" />
                                <label class="control-label"><span style="color: red;">*</span>Earning Deduction Code</label>
                            </div>

                            <div class="col-md-4 form-floating mb-3">
                                <input type="text" autocomplete="off" id="costcentername" required name="costcentername" maxlength="50" class="form-control capitalize validate[required]" placeholder="Account Description">
                                <label class="control-label"><span style="color: red;">*</span>Earning Deduction Description</label>
                            </div>
                            <div class="col-md-4 mb-3 mt-3">
                                <label class="control-label"><span style="color: red;">*</span>Earning Deduction Flag</label>
                                <div>
                                    <input type="radio" name="edFlag" id="edFlag" value="Earnings" checked="" /> Earnings <input type="radio" name="edFlag" id="edFlag" value="Deductions" /> Deductions
                                </div>
                            </div>

                            <div class="col-md-4 form-floating mb-3">
                                <select type="text" required autocomplete="off" id="applicablefor" name="applicablefor" maxlength="20" class="form-select" value="" placeholder="Account Group">
                                    <option value="" selected="">Select an Option</option>
                                    <option value="Payable Account">Payable Account</option>
                                    <option value="Receivable Account">Receivable Account</option>
                                </select>
                                <label class="control-label"><span style="color: red;">*</span>Chart Of Accounts</label>
                            </div>

                        <c:if test="${action ne 'view'}">
                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                <button type="submit" class="btn btn-primary" id="savebtn">Save</button>
                                <a href="../finance/earningDeductionMasterList.jsp" class="btn btn-danger">Cancel</a>
                            </div>
                        </c:if>
                        <c:if test="${action eq 'view'}">
                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                <a href="../finance/earningDeductionMasterList.jsp" class="btn btn-danger">Cancel</a>
                            </div>
                        </c:if>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

</body>
</html>