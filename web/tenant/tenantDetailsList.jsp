
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

        <!-- Bootstrap core CSS -->


    </head>


    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>

        <main id="main" class="main">
            <div>
                <jsp:include page="../login/headerlink.htm?submodule=Tenant Details&tab=Tenant Details&pagetype=list"/>
            </div>
            <div class="pagetitle">

            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">

                            <div class="card-body">
                                <p id="successMessage" style="text-align: center;color: blue;font-family:bold;">${message}</p>
                                <c:remove var="message" scope="session" /> 
                                <div class="card-title"><h5>Tenant Details List</h5></div> 
                                <!-- Table with stripped rows -->
                                <c:forEach items="${permission}" var="type">
                                    <c:set var="add" value="${type.newEntry}"></c:set>
                                    <c:set var="edit" value="${type.edit}"></c:set>
                                    <c:set var="inactive" value="${type.inactive}"></c:set>
                                    <c:set var="review" value="${type.review}"></c:set>
                                    <c:set var="approve" value="${type.approve}"></c:set>
                                </c:forEach>
                                <div class="table-responsive">
                                    <table class="table datatable">
                                        <thead>

                                            <tr class="headings">
                                                <th>Tenant Code</th>
                                                <th>Tenant Name</th>
                                                <th>Property Name</th>
                                                <th>Billing Cycle</th>
                                                <th>Created Date</th>
                                                <th>Tenant Status</th>
                                                <th>Contract Code</th>
                                                <th>Contract No.</th>
                                                <th>Approval Status</th>
                                                <th class=" no-link last"><span class="nobr">Action</span>
                                                </th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach items="${tenantDetails}" var="list">
                                                <c:forEach items="${contCreat}" var="type">
                                                    <c:if test="${type.contractCode eq list.contractPeriod}">
                                                        <c:set var="contractCode" value="${type.contractCode}"/>
                                                        <c:set var="contractNo" value="${type.contractTitle}"/>
                                                    </c:if>                                   
                                                </c:forEach>
                                               <tr class="even pointer">                                                                  
                                                    <td class=""style="text-align: left;">${list.tenantCode}</td> 
                                                    <td class=""style="text-align: left;">${list.tenantFname} ${list.tenantLname}</td>
                                                    <td class=" "style="text-align: left;">${list.assetNames}</td>
                                                    <td class=" "style="text-align: left;">${list.billingCycle}</td>
                                                    <td class=" "style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.creationDate}"/></td>
                                                    <td class=" "style="text-align: left;">
                                                        <c:if test="${list.vacatestatus eq null || list.vacatestatus eq ''}">${list.recordstatus}</c:if>
                                                        <c:if test="${list.vacatestatus ne null}">${list.vacatestatus}</c:if></td>
                                                    <td class=" "style="text-align: left;">${list.contractName}</td>
                                                    <td class=" "style="text-align: left;">${contractNo}</td>
                                                    <td class=" "style="text-align: left;">${list.appstatus}</td>
                                                    <td class="" style="width: 250px;text-align: center;">
                                                        <a href="../tenant/tenantDetailsForm.htm?pk=${list.SNo}&llId=${list.llId}&contractPeriod=${list.contractPeriod}&assetName=${list.assetName}&subclassifiedAstno=${list.subclassifiedAstno}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;
                                                        <c:if test="${list.appstatus ne 'CFO Approved' || list.appstatus ne 'GFC Approved'}">
                                                            <c:if test="${list.appstatus ne 'Recheck'}">
                                                                <c:if test="${edit eq 'y'}">
                                                                    <a href="../tenant/tenantDetailsForm.htm?pk=${list.SNo}&llId=${list.llId}&contractPeriod=${list.contractPeriod}&assetName=${list.assetName}&subclassifiedAstno=${list.subclassifiedAstno}&action=edit" class="fa fa-pencil fa-lg fa-lg"title="Edit"></a>&nbsp;
                                                                </c:if> </c:if>
                                                            <c:if test="${list.appstatus eq 'Recheck'}">
                                                                <c:if test="${review eq 'y'}">
                                                                    <a href="../tenant/tenantDetailsForm.htm?pk=${list.SNo}&llId=${list.llId}&contractPeriod=${list.contractPeriod}&assetName=${list.assetName}&subclassifiedAstno=${list.subclassifiedAstno}&action=Recheck" class="fa fa-check fa-lg">Recheck</i></a>&nbsp;
                                                                </c:if> 
                                                            </c:if> 
                                                        </c:if> 
                                                        <c:if test="${list.appstatus eq 'CFO Approved' && list.vacatestatus ne 'Vacated'}">
                                                            <a class="fa fa-envelope fa-lg" title="Send Email" onclick="sendEmail('${list.tenantCode}', '${list.tenantMailid}');" >
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${list.appstatus eq 'CFO Approved' && list.vacatestatus ne 'Vacated'}">
                                                            <a class="fa fa-comment fa-lg" title="Send SMS" onclick="sendSMS('${list.tenantCode}', '${list.tenantContactno}');" >
                                                                                           
                                                            </a> 
                                                        </c:if>
                                                         <c:if test="${list.extra3 eq 'Renewel'}">
                                                            <a href="../tenant/tenantContractRenew.htm?pk=${list.SNo}&llId=${list.llId}&contractPeriod=${list.contractPeriod}&assetName=${list.assetName}&subclassifiedAstno=${list.subclassifiedAstno}&action=Recheck" class="fa fa-refresh fa-lg" title="Renew">

                                                            </a>
                                                        </c:if>
                                                      
                                                            <a href="../tenant/tenantContractAdd.htm?pk=${list.SNo}&llId=${list.llId}&contractPeriod=${list.contractPeriod}&assetName=${list.assetName}&subclassifiedAstno=${list.subclassifiedAstno}&action=Recheck" class="fa fa-plus-circle " title="ADD">

                                                            </a>
                                                       
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
    </div>
    <script>
        function sendEmail(tC, Mail) {
            window.location.href = "../tenant/sendPOEmail.htm?tC=" + tC + "&tEmail=" + Mail + "&action=view";
        }
        
        function sendSMS(tC, Sms) {
            window.location.href = "../tenant/sendSMS.htm?tC=" + tC + "&tSms=" + Sms + "&action=view";
        }
    
        NProgress.done();
    </script>
        <jsp:include page="../login/footer.jsp"/>
    </body>

</html>
