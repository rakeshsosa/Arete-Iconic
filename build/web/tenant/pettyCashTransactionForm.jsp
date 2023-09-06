<%-- 
    Document   : assetDetailsForm
    Created on : Sep 15, 2016, 10:42:18 AM
    Author     : Kondal Reddy N
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css" integrity="sha256-FAOaXTpl90/K8cXmSdsskbQN3nKYulhCpPbcFzGTWKI=" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css" integrity="sha512-gxWow8Mo6q6pLa1XH/CcH8JyiSDEtiwJV78E+D+QP0EVasFs8wKXq16G8CLD4CJ2SnonHr4Lm/yY2fSI2+cbmw==" crossorigin="anonymous" />

        <title>Arete Iconic</title>
        <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
        <style>
            .customTextArea{

            }
        </style>
        
         <script>
                                function selectPropertyUnitDetails()
            {
                myWindow = window.open("../tenant/selectPropertyName.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                //window.close();
            }
        </script>
    </head>
    <body class="nav-md">
        <% java.util.Date d = new java.util.Date();%>

        <jsp:include page="../login/menu.htm"/>

        <jsp:include page="../login/footer.jsp"/>

        <main id="main" class="main">
            <div clss="mt-3">
                <jsp:include page="../login/headerlink.htm?submodule=Petty Cash Manager&tab=Petty Cash Transaction&pagetype=form" />
            </div>
            <div class="pagetitle">

            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">
                            <div class="card-body">
                                <div class="card-title"><h5>Petty Cash Transaction</h5></div>
                                <form class="row validateForm" id="userform" action="../tenant/pettyCashTransactionFormSubmit.htm"  method="post" enctype="multipart/form-data" onsubmit="return checkMand();">



                                    <c:if test="${fieldStatus_1 eq null}">
                                        <div class="col-md-4 form-floating mb-3">




                                            <c:choose>
                                                <c:when test="${fn:length(pettyCashTransactionList) > 0}">
                                                    <c:forEach items="${pettyCashTransactionList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_1}  id="transactionNumber" name="transactionNumber" maxlength="40" value="${list.transactionNumber}" onkeypress="return isNumberKey(event)">
                                                                <input type="hidden" class="form-control"  id="pk" name="pk" value="${list.sNo}" maxlength="40">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" placeholder="Fill" class="form-control" readonly="" id="transactionNumber" name="transactionNumber" maxlength="40" value="${list.transactionNumber}" required>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="Fill" class="form-control" ${mand_status_1} id="transactionNumber" name="transactionNumber" maxlength="40" value="" onkeypress="return isNumberKey(event)" required>
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Wallet Number<a  style="color:red;">*</a></label>      
                                        </div>
                                    </c:if>
                                    <c:if test="${fieldStatus_2 eq null}">
                                        <div class="col-md-4 form-floating mb-3">




                                            <c:choose>
                                                <c:when test="${fn:length(pettyCashTransactionList) > 0}">
                                                    <c:forEach items="${pettyCashTransactionList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control"  id="walletNumber" name="walletNumber" value="${list.walletNumber}" maxlength="40" >
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="walletNumber" value="${list.walletNumber}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" placeholder="Fill" class="form-control" ${mand_status_2} id="walletNumber" name="walletNumber" maxlength="40" value="" >
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Custodian Number<a class="control-label-required" style="color:red;">*</a></label>

                                        </div>
                                    </c:if>
                                    <c:if test="${fieldStatus_3 eq null}">
                                        <div class="col-md-4 form-floating mb-3">


                                            <c:choose>
                                                <c:when test="${fn:length(pettyCashTransactionList) > 0}">
                                                    <c:forEach items="${pettyCashTransactionList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_3}  id="walletName" name="walletName" value="${list.walletName}" maxlength="40" >
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="walletName" value="${list.walletName}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="Fill" class="form-control" ${mand_status_3} id="walletName" name="walletName" maxlength="40" value="" >
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Credited By <a  style="color:red;">*</a></label>
                                        </div>
                                    </c:if>

                                    <c:if test="${fieldStatus_7 eq null}">
                                        <div class="col-md-4 form-floating mb-3">


                                            <c:choose>
                                                <c:when test="${fn:length(pettyCashTransactionList) > 0}">
                                                    <c:forEach items="${pettyCashTransactionList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="openBalance" name="openBalance" value="${list.openBalance}" maxlength="40" onkeypress="return isNumberKey(event)">

                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="openBalance" value="${list.openBalance}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="Fill" class="form-control" ${mand_status_7} id="openBalance" name="openBalance" maxlength="40" value="" onkeypress="return isNumberKey(event)">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Balance <a  style="color:red;">*</a></label>
                                        </div></c:if>


                                        <div class="table-responsive my-3">
                                            <table class='table table-bordered ' style="width: 1300px" id="casedeadline">
                                                <c:if test="${action eq null}">
                                                <thead>
                                                    <tr>
                                                        <th>Date <span class='text-danger'>*</span></th>
                                                        <!--                                                    <th>Ref Number <span class='text-danger'>*</span></th>
                                                                                                            <th>Voucher Number <span class='text-danger'>*</span></th>-->
                                                        <th>Narration <span class='text-danger'>*</span></th>
                                                        <th>Amount</th>
                                                        <th>TRF Number</th>
                                                        <th>Invoice/Bill Ref No</th>
                                                        <th>Property/Unit</th>
                                                        <!--<th>Attachment</th>-->
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td><input  type="text" class="form-control  datepicker" autocomplete="off"  id="cashDate" name="cashDate"></td>
                                                        <!--                                                    <td><input readonly type="text" class="form-control" name="" id=""></td>
                                                                                                            <td><input type="text" class="form-control" name="" id=""></td>-->
                                                        <td><input type="text" class="form-control" name="narration" id="narration"></td>
                                                        <td><input type="text" class="form-control" name="amount" id="amount"></td>
                                                        <td><input type="text" class="form-control" name="trfNumber" id="trfNumber"></td>
                                                        <td><input type="text" class="form-control" name="billRefNumber" id="billRefNumber"></td>
                                                        <td><input type="text" class="form-control" name="propertyUnit" id="propertyUnit" ></td>
                                                        <!--   <td class="d-flex " style="width:250px"><div class="me-2"><a class="btn btn-primary btn-sm">Select Property</a></div> <div><a class="btn btn-primary btn-sm">Select Unit Number</a></div></td>-->
                                                        <!--<td><input type="text" class="form-control" name="" id=""></td>-->
                                                        <td><i class="fa fa-trash fa-2x removeRow" onclick="removeRows(event)"></i> <i class="fa fa-plus fa-2x addRow" onclick="addRows()"></i></td>

                                                    </tr>
                                                </tbody>
                                                </c:if>
                                                <c:if test="${action eq 'view'}">
                                                <thead>
                                                    <tr>
                                                        <th>Date <span class='text-danger'>*</span></th>
                                                        <!--                                                    <th>Ref Number <span class='text-danger'>*</span></th>
                                                                                                            <th>Voucher Number <span class='text-danger'>*</span></th>-->
                                                        <th>Narration <span class='text-danger'>*</span></th>
                                                        <th>Amount</th>
                                                        <th>TRF Number</th>
                                                        <th>Invoice/Bill Ref No</th>
                                                        <th>Property/Unit</th>
                                                        <!--<th>Attachment</th>-->
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:if test="${action eq 'view'}">
                                                      <c:forEach items="${pettyCashTransactionId}" var="list">
                                                    <tr>
                                                        <td><input  type="text" class="form-control  datepicker" autocomplete="off" readonly="" id="cashDate" name="cashDate" value="<fmt:formatDate pattern="dd-MM-yyyy" value="${list.toDate}"/>"></td>
                                                        <!--                                                    <td><input readonly type="text" class="form-control" name="" id=""></td>
                                                                                                            <td><input type="text" class="form-control" name="" id=""></td>-->
                                                        <td><input type="text" class="form-control" readonly="" name="narration" id="narration" value="${list.narration}"></td>
                                                        <td><input type="text" class="form-control" readonly="" name="amount" id="amount" value="${list.amount}"></td>
                                                        <td><input type="text" class="form-control" readonly="" name="trfNumber" id="trfNumber" value="${list.trfNumber}"></td>
                                                        <td><input type="text" class="form-control" readonly="" name="billRefNumber" id="billRefNumber" value="${list.billRefNumber}"></td>
                                                        <td><input type="text" class="form-control" readonly="" name="propertyUnit" id="propertyUnit" value="${list.propertyUnit}" onclick="return selectPropertyUnitDetails();"></td>
                                                        <!--   <td class="d-flex " style="width:250px"><div class="me-2"><a class="btn btn-primary btn-sm">Select Property</a></div> <div><a class="btn btn-primary btn-sm">Select Unit Number</a></div></td>-->
                                                        <!--<td><input type="text" class="form-control" name="" id=""></td>-->
                                                        <td><i class="fa fa-trash fa-2x removeRow" onclick="removeRows(event)"></i> <i class="fa fa-plus fa-2x addRow" onclick="addRows()"></i></td>

                                                    </tr>
                                                    </c:forEach>
                                               </c:if>
                                                </tbody>
                                                </c:if>
                                                <c:if test="${action eq 'edit'}">
                                                <thead>
                                                    <tr>
                                                        <th>Date <span class='text-danger'>*</span></th>
                                                        <!--                                                    <th>Ref Number <span class='text-danger'>*</span></th>
                                                                                                            <th>Voucher Number <span class='text-danger'>*</span></th>-->
                                                        <th>Narration <span class='text-danger'>*</span></th>
                                                        <th>Amount</th>
                                                        <th>TRF Number</th>
                                                        <th>Invoice/Bill Ref No</th>
                                                        <th>Property/Unit</th>
                                                        <!--<th>Attachment</th>-->
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:if test="${action eq 'edit'}">
                                                      <c:forEach items="${pettyCashTransactionId}" var="list">
                                                    <tr>
                                                        <td><input  type="text" class="form-control  datepicker" autocomplete="off" id="cashDate" name="cashDate" value="${list.toDate}"></td>
                                                        <!--                                                    <td><input readonly type="text" class="form-control" name="" id=""></td>
                                                                                                            <td><input type="text" class="form-control" name="" id=""></td>-->
                                                        <td><input type="text" class="form-control"  name="narration" id="narration" value="${list.narration}"></td>
                                                        <td><input type="text" class="form-control"  name="amount" id="amount" value="${list.amount}"></td>
                                                        <td><input type="text" class="form-control"  name="trfNumber" id="trfNumber" value="${list.trfNumber}"></td>
                                                        <td><input type="text" class="form-control"  name="billRefNumber" id="billRefNumber" value="${list.billRefNumber}"></td>
                                                        <td><input type="text" class="form-control"  name="propertyUnit" id="propertyUnit" value="${list.propertyUnit}" ></td>
                                                        <!--   <td class="d-flex " style="width:250px"><div class="me-2"><a class="btn btn-primary btn-sm">Select Property</a></div> <div><a class="btn btn-primary btn-sm">Select Unit Number</a></div></td>-->
                                                        <!--<td><input type="text" class="form-control" name="" id=""></td>-->
                                                        <td><i class="fa fa-trash fa-2x removeRow" onclick="removeRows(event)"></i> <i class="fa fa-plus fa-2x addRow" onclick="addRows()"></i></td>

                                                    </tr>
                                                    </c:forEach>
                                               </c:if>
                                                </tbody>
                                                </c:if>
                                            </table>
                                        </div>


                                    <c:if test="${fieldStatus_7 eq null}">
                                        <div class="col-md-4 form-floating mb-3">


                                            <c:choose>
                                                <c:when test="${fn:length(pettyCashTransactionList) > 0}">
                                                    <c:forEach items="${pettyCashTransactionList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="closingBal" name="closingBal" value="${list.closingBal}" maxlength="40" onkeypress="return isNumberKey(event)">

                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="closingBal" value="${list.closingBal}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="Fill" class="form-control" ${mand_status_7} id="closingBal" name="closingBal" maxlength="40" value="" onkeypress="return isNumberKey(event)">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Closing Balance</label>
                                        </div></c:if>
                                    <c:if test="${fieldStatus_4 eq null}">
                                        <div class="col-md-4 form-floating mb-3">


                                            <c:choose>
                                                <c:when test="${fn:length(pettyCashTransactionList) > 0}">
                                                    <c:forEach items="${pettyCashTransactionList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input placeholder="Fill" class="form-control customTextArea"  id="remarks" name="remarks" value="${list.remarks}" maxlength="250"></textarea>

                                                            </c:when>
                                                            <c:otherwise>

                                                                <input placeholder="Fill" class="form-control" readonly="" id="remarks" name="remarks" value="${list.remarks}" maxlength="250"></textarea>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input placeholder="Fill" class="form-control customTextArea"  id="remarks" name="remarks" maxlength="250"></textarea>
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Note</label>
                                        </div></c:if>

                                        <div class='col-md-12'>
                                            <button class="btn btn-primary">History and Notes</button>
                                        </div>    

                                    <c:if test="${action ne 'view' && action ne 'edit'}">
                                        <div class="col-md-9 col-sm-9 mt-3 col-xs-12 col-md-offset-5">
                                            <button type="submit" class="btn btn-primary" style="">Save</button>
                                            <a href="../tenant/pettyCashTransactionList.htm" class="btn btn-danger">Cancel</a>
                                        </div>
                                    </c:if>

                                    <c:if test="${action eq 'edit'}">

                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                            <button type="submit" class="btn btn-primary" style="">Save</button>
                                            <a href="../tenant/pettyCashTransactionList.htm" class="btn btn-danger">Cancel</a>
                                        </div>

                                    </c:if>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </section>

        </main><!-- End #main -->
        <script>
            //window.onload = minRentGen();
        </script>
        
        <script>

            function addRows() {
                var trow = `<tr>            '<td><input class="form-control datepicker2" autocomplete="off"  name="" id="" type="" maxlength="50">sss</td>
                                                   
                                                        <td><input type="text" class="form-control" name="" id=""></td>
                                                        <td><input type="text" class="form-control" name="" id=""></td>
                                                        <td><input type="text" class="form-control" name="" id=""></td>
                                                        <td><input type="text" class="form-control" name="" id=""></td>
                                                        <td><input type="text" class="form-control" name="" id=""onclick="return selectPropertyUnitDetails();"></td>
                                                        <!--   <td class="d-flex " style="width:250px"><div class="me-2"><a class="btn btn-primary btn-sm">Select Property</a></div> <div><a class="btn btn-primary btn-sm">Select Unit Number</a></div></td>-->
                                                        <td><input type="text" class="form-control" name="" id=""></td>
                                                        <td><i class="fa fa-trash fa-2x removeRow" onclick="removeRows(event)"></i> <i class="fa fa-plus fa-2x addRow" onclick="addRows()"></i></td></tr>`;
                $("table").append(trow)
                $(".addRow").hide();
                $("table tr:last .addRow").show()
            
            
               var today = new Date();
        $('.datepicker2').datepicker({
                    format: 'dd-mm-yyyy',
                    autoclose: true,
                    todayHighlight: true,
                    startDate:today,
                    orientation:'bottom'
                });
            }
            $("table tr:first .removeRow").show()
            function removeRows(e) {
                $(e.target).parents("tr").remove()
            }
        </script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha256-bqVeqGdJ7h/lYPq6xrPv/YGzMEb6dNxlfiTUHSgRCp8=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js" integrity="sha512-DNeDhsl+FWnx5B1EQzsayHMyP6Xl/Mg+vcnFPXGNjUZrW28hQaa1+A4qL9M+AiOMmkAhKAWYHh1a+t6qxthzUw==" crossorigin="anonymous"></script>
    <script src="../common/theme/js/custom.js"></script>
        <script>
            var today = new Date();
            $('#cashDate').datepicker({
                format: 'dd-mm-yyyy',
                autoclose: true,
                todayHighlight: true,
                startDate: today,
                orientation: 'bottom'
            });
        </script>
        



       
       
    </body>

</html>

