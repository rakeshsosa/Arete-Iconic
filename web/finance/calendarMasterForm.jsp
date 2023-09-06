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
            <li class="nav-item"><a class="nav-link active" href="../finance/calendarMasterList.jsp">Calendar Period</a></li>
            <li class="nav-item"><a class="nav-link" href="../finance/bankMasterList.jsp">Bank</a></li>
            <li class="nav-item"><a class="nav-link" href="../finance/earningDeductionMasterList.jsp">Earning Deduction</a></li>
            <li class="nav-item"><a class="nav-link" href="../finance/assetsList.jsp">Assets</a></li>
            <li class="nav-item"><a class="nav-link" href="../finance/liabiliatiesList.jsp">Liabilities</a></li>
        </ul>
        <br />
        <div class="text-end">
            <a class="btn btn-primary btn-sm" href="../finance/calendarMasterList.jsp"><i class="bi bi-eye"></i> Show Calendar List</a>
        </div>
    </div>
    <div class="pagetitle"></div>

    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title"><h5>Calendar Period Form</h5></div>

                        <form class="row validateForm" id="coustmermnForm" accept-charset="UTF-8" method="post" action="../Transactional/chartOfAccountsSubmit.htm" enctype="multipart/form-data" commandName="coa">
                            <div id="spinner" class="spinner" style="display: none;">
                                <img id="img-spinner" src="spinner.gif" alt="Loading" />
                            </div>

                            <div class="col-md-4 form-floating mb-3">
                                <input type="text" autocomplete="off" id="costcentername" required name="costcentername" maxlength="50" class="form-control capitalize validate[required]" value="" placeholder="Account Description" />
                                <label class="control-label"><span style="color: red;">*</span>Calendar Code</label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <select class="form-select" id="ledgerType" name="ledgerType">
                                    <option value="" selected="" disabled="">Select an option</option>
                                    <option value="General">General</option>
                                    <option value="Accounting">Accounting</option>
                                    <option value="Financial">Financial</option>
                                </select>
                                <label class="control-label"><span style="color: red;">*</span>Calendar Type</label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input type="text" rows="1" autocomplete="off" id="costcentername" required name="costcentername" maxlength="50" class="form-control capitalize validate[required]" placeholder="fill">
                                <label class="control-label"><span style="color: red;">*</span>Calendar Description</label>
                            </div>

                            <div class="col-md-4 form-floating mb-3 pick2">
                                <input type="text" required id="startDate" name="startDate" class="form-control datepicker2 capitalize validate[required]" placeholder="DD/MM/YYYY" value="" readonly="" />
                                <label class="control-label"><span style="color: red;">*</span>Start Date</label>
                            </div>
                            <div class="col-md-4 form-floating mb-3 pick3">
                                <input type="text" required id="endDate" name="endDate" class="form-control datepicker3 validate[required]" placeholder="DD/MM/YYYY" readonly="" />
                                <label class="control-label"><span style="color: red;">*</span>End Date</label>
                            </div>
                        
                        <c:if test="${action ne 'view'}">  
                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                <button type="submit" class="btn btn-primary" id="savebtn">Save</button>
                                <a href="../finance/calendarMasterList.jsp" class="btn btn-danger">Cancel</a>
                            </div>
                        </c:if>
                        <c:if test="${action eq 'view'}">  
                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                <a href="../finance/calendarMasterList.jsp" class="btn btn-danger">Cancel</a>
                            </div>
                        </c:if>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

    <script>
           $(document).ready(function () {
    $(".datepicker2")
        .datepicker({
            format: "dd-M-yyyy",
            startDate: "0m +0m",
            autoclose: true,
            todayHighlight: true,
            container: ".pick2",
        })
        .datepicker("update", new Date());

    $(".datepicker3")
        .datepicker({
            format: "dd-M-yyyy",
            startDate: "0m +0m",
            autoclose: true,
            todayHighlight: true,
            container: ".pick3",
        })
        .datepicker("update", new Date());
});

    </script>
</body>
</html>