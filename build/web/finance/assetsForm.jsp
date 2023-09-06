<%-- 
    Document   : chartOfAccountsForm
    Created on : 30 Mar, 2017, 11:08:37 AM
    Author     : Akshata
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.text.SimpleDateFormat"%>
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
        <ul class="nav nav-pills">
            <li class="nav-item"><a class="nav-link" href="../finance/ledgerList.jsp">Ledger</a></li>
            <li class="nav-item"><a class="nav-link" href="../finance/calendarMasterList.jsp">Calendar Period</a></li>
            <li class="nav-item"><a class="nav-link" href="../finance/bankMasterList.jsp">Bank</a></li>
            <li class="nav-item"><a class="nav-link" href="../finance/earningDeductionMasterList.jsp">Earning Deduction</a></li>
            <li class="nav-item"><a class="nav-link active" href="../finance/assetList.htm">Assets</a></li>
            <li class="nav-item"><a class="nav-link" href="../finance/liabilitiesList.htm">Liabilities</a></li>
        </ul>
        <br />
        <div class="text-end">
            <a class="btn btn-primary btn-sm" href="../finance/assetList.htm"><i class="bi bi-eye"></i> Show Assets List</a>
        </div>
    </div>
    <div class="pagetitle"></div>
    <!-- End Page Title -->
    <section class="section">
        <div class="row">
            <c:forEach items="${assetList}" var="indvList">
                <c:set value="${indvList.assetClassId}" var="assetClassId"/>
                <c:set value="${indvList.assetClassName}" var="assetClassName"/>
                 <c:set value="${indvList.assetClassDescription}" var="assetClassDescription"/>
                <c:set value="${indvList.SNo}" var="SNo"/>
                
             </c:forEach> 
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">
                            <h5>Assets Form</h5>
                        </div>
                        <form class="" id="coustmermnForm" accept-charset="UTF-8" method="post" action="../finance/assetFormSubmit.htm" enctype="multipart/form-data" commandName="ledgersg2">
                            <div class="row">
                                <div class="col-md-4 form-floating mb-3">
                                    <input class="form-control validate[required]" id="groupName" name="assetClassId" type="text" value="Asset" maxlength="50" autocomplete="off" autocomplete="off" readonly="" placeholder="Automap" />
                                    <input class="form-control validate[required]" id="groupName" name="SNo" type="hidden" value="${SNo}" maxlength="50" readonly="" />
                                    <label class="control-label"><span style="color: red;">*</span>Account Group</label>
                                </div>

                                <div class="col-md-4 form-floating mb-3">
                                    <select id="sub_groupName" name="assetClassName" class="form-select capitalize validate[required]">
                                        <option value="" selected="">Select an Option</option>
                                        <option value="Current Asset">Current Assets</option>
                                        <option value="Fixed Assets">Fixed Assets</option>
                                        <option value="Investments">Investments</option>
                                    </select>
                                    <label class="control-label"><span style="color: red;">*</span>Sub Group Name</label>
                                </div>
                                <div class="col-md-4 form-floating mb-3">
                                    <input class="form-control validate[required]]" placeholder="Automap" rows="3" id="groupDesc" name="assetClassDescription" maxlength="500" />
                                    <label class="control-label"><span style="color: red;">*</span>Description</label>
                                </div>

                                <c:if test="${action ne 'view'}">
                                    <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5 mt-3">
                                        <button type="submit" class="btn btn-primary" id="savebtn">Save</button>
                                        <a href="../finance/assetList.htm" class="btn btn-danger">Cancel</a>
                                    </div>
                                </c:if>
                                
                                <c:if test="${action eq 'view'}">
                                    <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5 mt-3">
                                    <a href="../finance/assetList.htm" class="btn btn-danger">Cancel</a>
                                    </div>
                                </c:if>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

        
  </body>
</html>