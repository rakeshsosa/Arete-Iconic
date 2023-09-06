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
    
       @media screen and (max-width: 600px){
                        
                            .table-responsive{
                                overflow-x: auto !important;
                            }
                             }
    </style> 
 

        </head>
        <body class="nav-md">
        <% java.util.Date d = new java.util.Date();%>
       
                <jsp:include page="../login/menu.htm"/>
               <jsp:include page="../login/footer.jsp"/>

                                
                                   <main id="main" class="main">
                                       <div class="mt-3">
                                <jsp:include
                                    page="../login/headerlink.htm?submodule=Petty Cash Manager&tab=Petty Cash Manager&pagetype=form" />
       </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
                <div class="card-title"><h5>Property Details Form</h5></div>
                                    <form class="row validateForm" id="userform" action="../tenant/pettyCashFormSubmit.htm"  method="post" enctype="multipart/form-data" onsubmit="return checkMand();">

                                   
                                            
                                      <%--  <c:if test="${fieldStatus_1 eq null}">
                                            <div class="col-md-4 form-floating mb-3">
                                                
                                                    
                                               
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:set value="${list.assetCode}" var="assetCode"/>
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_1}  id="transactionNumber" name="transactionNumber" maxlength="40" value="${list.transactionNumber}" onkeypress="return isNumberKey3(event)">
                                                                    <input type="hidden" class="form-control" ${mand_status_1}  id="assetName1" name="assetName1" maxlength="40" value="${list.assetName}" >
                                                                    <input type="hidden" name="pk" value="${list.SNo}">
                                                                    <input type="hidden" name="status" value="${list.status}">
                                                                    <input type="hidden" id="assetCode" name="assetCode" value="${list.assetCode}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" id="assetName" readonly="" value="${list.transactionNumber}">
                                                                    <input type="hidden" id="assetCode" name="assetCode" value="${list.assetCode}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Fill" class="form-control" ${mand_status_1} id="transactionNumber" name="transactionNumber" maxlength="40" value="" onkeypress="return isNumberKey3(event)" required>
                                                    </c:otherwise>        
                                                </c:choose>
                                                  <label class="control-label">Transaction Number<a  style="color:red;">*</a></label>      
                                            </div>
                                        </c:if> --%>
                                        <c:if test="${fieldStatus_2 eq null}">
                                            <div class="col-md-4 form-floating mb-3">
                                                
                                                    
                                               
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(pettyCashList) > 0}">
                                                        <c:forEach items="${pettyCashList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_2}  id="walletNumber" name="walletNumber" value="${list.walletNumber}" onkeypress="return isNumberKey(event);" maxlength="40" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="walletNumber" value="${list.walletNumber}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" placeholder="Fill" class="form-control" ${mand_status_2} id="walletNumber" name="walletNumber" onkeypress="return isNumberKey(event);" maxlength="40" value="" >
                                                    </c:otherwise>        
                                                </c:choose>
                                                        <label class="control-label">Wallet Number<a class="control-label-required" style="color:red;">*</a></label>
                                                        
                                            </div>
                                        </c:if>
                                          <%--<c:if test="${fieldStatus_3 eq null}">--%>
                                            <div class="col-md-4 form-floating mb-3">
                                                
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(pettyCashList) > 0}">
                                                        <c:forEach items="${pettyCashList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_3}  id="walletName" name="walletName" value="${list.walletName}" maxlength="40" >
                                                                    <input type="hidden" class="form-control"  id="pk" name="pk" value="${list.sNo}" maxlength="40">
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
                                                        <label class="control-label">Wallet Name </label>
                                            </div>
                                        <%--</c:if>--%>
                                            <c:if test="${fieldStatus_16 eq null}">
                                            <div class="col-md-4 form-floating mb-3">
                                                
                                                
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(pettyCashList) > 0}">
                                                        <c:forEach items="${pettyCashList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control"  ${mand_status_16}  id="custodianName" name="custodianName" maxlength="60" value="${list.custodianName}" onkeypress="return checkdigit(event, this, 10, 0);">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="custodianName" value="${list.custodianName}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>   
                                                        <input type="text" placeholder="Fill" class="form-control" ${mand_status_16} id="custodianName" name="custodianName" maxlength="60" value="" onkeypress="return checkdigit(event, this, 10, 0);">
                                                    </c:otherwise>        
                                                </c:choose>
                                                        <label class="control-label">Custodian Name</label>
                                            </div></c:if>
                                              <c:if test="${fieldStatus_4 eq null}">
                                            <div class="col-md-4 form-floating mb-3">
                                                
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(pettyCashList) > 0}">
                                                        <c:forEach items="${pettyCashList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <textarea placeholder="Fill" class="form-control"  id="description" name="description" maxlength="250">${list.description}</textarea>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    
                                                                    <textarea placeholder="Fill" class="form-control"  id="description" name="description" readonly="" maxlength="250">${list.description}</textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <textarea placeholder="Fill" class="form-control"  id="description" name="description" maxlength="250"></textarea>
                                                    </c:otherwise>        
                                                </c:choose>
                                                        <label class="control-label">Description</label>
                                            </div></c:if>
                                             <c:if test="${fieldStatus_5 eq null}">
                                            <div class="col-md-4 form-floating mb-3">
                                               
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(pettyCashList) > 0}">
                                                        <c:forEach items="${pettyCashList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_5} id="walletLimit" name="walletLimit" value="${list.walletLimit}" maxlength="40" onkeypress="return isNumberKey(event);">
                                                                    
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="assetPlotNo" value="${list.walletLimit}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Fill" class="form-control" ${mand_status_5} id="walletLimit" name="walletLimit" maxlength="40" value="" onkeypress="return isNumberKey(event);">
                                                    </c:otherwise>        
                                                </c:choose>
                                                        <label class="control-label">Wallet Limit</label>
                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_6 eq null}">
                                            <div class="col-md-4 form-floating mb-3">
                                                
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(pettyCashList) > 0}">
                                                        <c:forEach items="${pettyCashList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                     <select class="form-select" ${mand_status_6} id="way" name="currency" >
                                                                         <option value="${list.currency}" selected="">${list.currency}</option>
                                                            <option value="OMR">OMR</option>
                                                            <option value="INR">INR</option>
                                                            <option value="USD">USD</option>
                                                        </select>
                                                                  
                                                                    
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="currency" value="${list.currency}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>   
                                                        <select class="form-select" ${mand_status_6} id="currency" name="currency">
                                                            <option selected="" disabled="">Select an option</option>
                                                            <option value="OMR">OMR</option>
                                                            <option value="INR">INR</option>
                                                            <option value="USD">USD</option>
                                                        </select>
                                                
                                                    </c:otherwise>        
                                                </c:choose>
                                                        <label class="control-label">Currency</label>
                                            </div></c:if>
                                              <c:if test="${fieldStatus_7 eq null}">
                                            <div class="col-md-4 form-floating mb-3">
                                                
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(pettyCashList) > 0}">
                                                        <c:forEach items="${pettyCashList}" var="list">
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
                                                        <label class="control-label">Balance</label>
                                            </div></c:if>
                                            <c:if test="${fieldStatus_7 eq null}">
                                            <div class="col-md-4 form-floating mb-3">
                                                
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(pettyCashList) > 0}">
                                                        <c:forEach items="${pettyCashList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_7} id="wilayat" name="wilayat" value="${list.propertyName}" maxlength="40" onkeypress="return isNumberKey3(event)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="streetNo" value="${list.propertyName}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Fill" class="form-control" ${mand_status_7} id="wilayat" name="wilayat" maxlength="40" value="" onkeypress="return isNumberKey3(event)">
                                                    </c:otherwise>        
                                                </c:choose>
                                                        <label class="control-label">Property Name</label>
                                            </div></c:if>
                                        <div class="table-responsive">
                                        <table class='table table-bordered my-3 '>
                                            <c:if test="${action eq null}">
                                            <thead>
                                                <tr>
<!--                                                    <th>Journal Entry Number</th>-->
                                                    <th style="width:20%;">Wallet Transaction Number</th>
                                                    <th style="width:15%;">Deposit Date</th>
                                                    <th style="width:15%;">Deposit Amount</th>
                                                    <th style="width:15%;">TRF Number</th>
                                                    <th style="width:20%;">Payment Type</th>
                                                    <th style="width:15%;">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
<!--                                                    <td><input readonly type="text" class="form-control" name="" id=""></td>-->
                                                    <td><input type="text" class="form-control" name="walletNumberGrid" id="walletNumberGrid" onkeypress="return isNumberKey(event);"></td>
                                                    <td><input type="text" class="form-control datepicker" name="depositDateGrid" id="depositDateGrid"></td>
                                                    <td><input type="text" class="form-control" name="depositAmountGrid" id="depositAmountGrid" onkeypress="return isNumberKey(event);"></td>
                                                    <td><input type="text" class="form-control" name="trfNumberGrid" id="trfNumberGrid" onkeypress="return isNumberKey(event);"></td>
                                                    <td><select class="form-select" id="paymentTypeGrid" name="paymentTypeGrid" aria-label="Default select example">
                                                        <option value="Bank Account">Bank Account</option>
                                                        <option value="Cheque">Cheque</option>
                                                        <option value="Credit Card">Credit Card</option>
                                                        <option value="Master Card">Master Card</option>
                                                      </select>
                                                    </td>
                                                    <td><i class="fa fa-trash fa-2x removeRow mx-3" onclick="removeRows(event)"></i> <i class="fa fa-plus fa-2x addRow" onclick="addRows()"></i></td>
                                                    
                                                </tr>
                                            </tbody>
                                            </c:if>
                                            <c:if test="${action eq 'view'}">
                                            <thead>
                                                <tr>
<!--                                                    <th>Journal Entry Number</th>-->
                                                    <th style="width:20%;">Wallet Transaction Number</th>
                                                    <th style="width:15%;">Deposit Date</th>
                                                    <th style="width:15%;">Deposit Amount</th>
                                                    <th style="width:15%;">TRF Number</th>
                                                    <th style="width:20%;">Payment Type</th>
                                                    <th style="width:15%;">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:if test="${action eq 'view'}">
                                                      <c:forEach items="${PettyCashId}" var="list">
                                                <tr>
<!--                                                    <td><input readonly type="text" class="form-control" name="" id=""></td>-->
                                                    <td><input type="text" class="form-control" name="walletNumberGrid" id="walletNumberGrid" readonly="" value="${list.walletNumberGrid}"></td>
                                                    <td><input type="text" class="form-control datepicker" name="depositDateGrid" id="depositDateGrid" readonly="" value="${list.depositDateGrid}"></td>
                                                    <td><input type="text" class="form-control" name="depositAmountGrid" id="depositAmountGrid" readonly="" value="${list.depositAmountGrid}"></td>
                                                    <td><input type="text" class="form-control" name="trfNumberGrid" id="trfNumberGrid" readonly="" value="${list.trfNumberGrid}"></td>
                                                    <td><select class="form-select" id="paymentTypeGrid" name="paymentTypeGrid" aria-label="Default select example">
                                                           <option value="${list.paymentTypeGrid}" selected="selected">${list.paymentTypeGrid}</option> 
                                                            <option value="Bank Account">Bank Account</option>
                                                        <option value="Cheque">Cheque</option>
                                                        <option value="Credit Card">Credit Card</option>
                                                        <option value="Master Card">Master Card</option>
                                                      </select>
                                                    </td>
                                                    <td><i class="fa fa-trash fa-2x removeRow mx-3" onclick="removeRows(event)"></i> <i class="fa fa-plus fa-2x addRow" onclick="addRows()"></i></td>
                                                    
                                                </tr>
                                                </c:forEach>
                                               </c:if>
                                            </tbody>
                                            </c:if>
                                            <c:if test="${action eq 'edit'}">
                                            <thead>
                                                <tr>
<!--                                                    <th>Journal Entry Number</th>-->
                                                    <th style="width:20%;">Wallet Transaction Number</th>
                                                    <th style="width:15%;">Deposit Date</th>
                                                    <th style="width:15%;">Deposit Amount</th>
                                                    <th style="width:15%;">TRF Number</th>
                                                    <th style="width:20%;">Payment Type</th>
                                                    <th style="width:15%;">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:if test="${action eq 'edit'}">
                                                      <c:forEach items="${PettyCashId}" var="list">
                                                <tr>
<!--                                                    <td><input readonly type="text" class="form-control" name="" id=""></td>-->
                                                    <td><input type="text" class="form-control" name="walletNumberGrid" id="walletNumberGrid" readonly="" value="${list.walletNumberGrid}"></td>
                                                    <td><input type="text" class="form-control datepicker" name="depositDateGrid" id="depositDateGrid" readonly="" value="${list.depositDateGrid}"></td>
                                                    <td><input type="text" class="form-control" name="depositAmountGrid" id="depositAmountGrid" readonly="" value="${list.depositAmountGrid}"></td>
                                                    <td><input type="text" class="form-control" name="trfNumberGrid" id="trfNumberGrid" readonly="" value="${list.trfNumberGrid}"></td>
                                                    <td><select class="form-select" id="paymentTypeGrid" name="paymentTypeGrid" aria-label="Default select example">
                                                           <option value="${list.paymentTypeGrid}" selected="selected">${list.paymentTypeGrid}</option> 
                                                            <option value="Bank Account">Bank Account</option>
                                                        <option value="Cheque">Cheque</option>
                                                        <option value="Credit Card">Credit Card</option>
                                                        <option value="Master Card">Master Card</option>
                                                      </select>
                                                    </td>
                                                    <td><i class="fa fa-trash fa-2x removeRow mx-3" onclick="removeRows(event)"></i> <i class="fa fa-plus fa-2x addRow" onclick="addRows()"></i></td>
                                                    
                                                </tr>
                                                </c:forEach>
                                               </c:if>
                                            </tbody>
                                            </c:if>
                                        </table>
                                        </div>
                                        
                                        <c:if test="${fieldStatus_7 eq null}">
<!--                                            <div class="col-md-4 form-floating mb-3">
                                                
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_7} id="closingBal" name="closingBal" value="${list.closingBal}" maxlength="40" onkeypress="return isNumberKey3(event)">
                                                                    
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="closingBal" value="${list.closingBal}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Fill" readonly class="form-control" ${mand_status_7} id="closingBal" name="closingBal" maxlength="40" value="" onkeypress="return isNumberKey3(event)">
                                                    </c:otherwise>        
                                                </c:choose>
                                                        <label class="control-label">Closing Balance</label>
                                            </div>-->
                                        </c:if>
                                            <c:if test="${fieldStatus_4 eq null}">
                                            <div class="col-md-4 form-floating mb-3">
                                                
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(pettyCashList) > 0}">
                                                        <c:forEach items="${pettyCashList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <textarea placeholder="Fill" class="form-control"  id="remarks" name="remarks" maxlength="250">${list.remarks}</textarea>
                                                                    
                                                                </c:when>
                                                                <c:otherwise>
                                                                    
                                                                    <textarea placeholder="Fill" class="form-control"  id="remarks" name="remarks" readonly="" maxlength="250">${list.remarks}</textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <textarea placeholder="Fill" class="form-control"  id="remarks" name="remarks" maxlength="250"></textarea>
                                                    </c:otherwise>        
                                                </c:choose>
                                                        <label class="control-label">Remarks</label>
                                            </div></c:if>
                                            
                                            
                                        <c:if test="${action ne 'view' && action ne 'edit'}">
                                            <div class="col-md-9 col-sm-9 mt-3 col-xs-12 col-md-offset-5">
                                                <button type="submit" class="btn btn-primary" style="">Save</button>
                                                <a href="../assets/assetsDetailsList.htm" class="btn btn-danger">Cancel</a>
                                            </div>
                                        </c:if>

                                        <c:if test="${action eq 'edit'}">

                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                                <button type="submit" class="btn btn-primary" style="">Save</button>
                                                <a href="../assets/assetsDetailsList.htm" class="btn btn-danger">Cancel</a>
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
 <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha256-bqVeqGdJ7h/lYPq6xrPv/YGzMEb6dNxlfiTUHSgRCp8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js" integrity="sha512-DNeDhsl+FWnx5B1EQzsayHMyP6Xl/Mg+vcnFPXGNjUZrW28hQaa1+A4qL9M+AiOMmkAhKAWYHh1a+t6qxthzUw==" crossorigin="anonymous"></script>
     <script>
    
        function addRows(){
        var trow = `<tr>
                                                    <td><input type="text" class="form-control" name="walletNumberGrid" id="walletNumberGrid" onkeypress="return isNumberKey(event);"></td>
                                                    <td><input type="text" class="form-control datepicker" name="depositDateGrid" id="depositDateGrid"></td>
                                                    <td><input type="text" class="form-control" name="depositAmountGrid" id="depositAmountGrid" onkeypress="return isNumberKey(event);"></td>
                                                    <td><input type="text" class="form-control" name="trfNumberGrid" id="trfNumberGrid" onkeypress="return isNumberKey(event);"></td>
                                                    <td><select class="form-select" id="paymentTypeGrid" name="paymentTypeGrid" aria-label="Default select example">
                                                        <option selected>Bank Account</option>
                                                        <option value="1">Cheque</option>
                                                        <option value="2">Credit Card</option>
                                                        <option value="3">Master Card</option>
                                                      </select>
                                                    </td>
                                                    <td><i class="fa fa-trash fa-2x removeRow mx-3" onclick="removeRows(event)"></i> <i class="fa fa-plus fa-2x addRow" onclick="addRows()"></i></td></tr>`;
        $("table").append(trow)
        $(".addRow").hide();
        $("table tr:last .addRow").show();
        $(".datepicker")
        .datepicker({
            format: "dd-mm-yyyy",
            startDate: "0m +0m",
            autoclose: true,
            todayHighlight: true,
            orientation:"bottom",
        });
                                            }
                                            
                                            
                                             $("tbody tr:nth-child(1) .removeRow").hide()
                                            function removeRows(e){
                                                $(e.target).parents("tr").remove();
                                                $("table tr:last .addRow").show();
                                            }
</script>
<script>
           $(document).ready(function () {
    
    $(".datepicker")
        .datepicker({
            format: "dd-mm-yyyy",
            startDate: "0m +0m",
            autoclose: true,
            todayHighlight: true,
            orientation:"bottom",
        });
});

    </script>
    </body>

</html>

