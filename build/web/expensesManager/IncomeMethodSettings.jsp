<%@page import="java.text.SimpleDateFormat"%>
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

                       <title>Arete Iconic</title>
        <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
                    </head>


                    <body class="nav-md">
                        <jsp:include page="../login/menu.htm" />
                        <jsp:include page="../login/footer.jsp" />


                        <main id="main" class="main">
                            <div class="mt-3">
                            <jsp:include page="../login/headerlink.htm?submodule=Expenses Settings&tab=Payment Method Settings"/>       
                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h5>Payment Mode Settings</h5>
                                                </div>
         <form class="myFormForValidation form-inline row" action="../Expenses/paymentMethodFormSubmit.htm" id="coustmermnForm">
                           <div class="col-md-4 form-floating mb-3">
                                                       
                                                        <c:choose>
                                                            <c:when test="${fn:length(paymentMethodList) > 0}">

                                                                <c:forEach items="${paymentMethodList}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" placeholder="fill" class="form-control" name="paymentMethodId" readonly="" maxlength="98" id="expno" required onkeypress="" value="${list.paymentMethodId}">                                                                        </c:when>
                                                                        <c:otherwise>

                                                                            <input type="text"  class="form-control" name="paymentMethodId" maxlength="98" id="expno" readonly="" onkeypress="" value="${list.paymentMethodId}">

                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>   
                                                                <input type="text" placeholder="gill" class="form-control" name="paymentMethodId" maxlength="98" id="expno" readonly="" value="${paymentMethodId}">

                                                            </c:otherwise>
                                                        </c:choose>
 <label class="control-label" > Payment Mode ID <span style="color:red">*</span></label>
                                                    </div>
                                                       
                                                       <div class="col-md-4 form-floating mb-3">
                                                       
                                                        <c:choose>
                                                            <c:when test="${fn:length(paymentMethodList) > 0}">
                                                                <c:forEach items="${paymentMethodList}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" placeholder="fill" name="paymentMethodName" value="${list.paymentMethodName}" maxlength="98" onkeypress="return isAlphabet(event)">
                                                                        
                                                                        
                                                                        </c:when>
                                                                        <c:otherwise>

                                                                            <input type="text" class="form-control" readonly="" value="${list.paymentMethodName}">

                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="fill" class="form-control" name="paymentMethodName" maxlength="98" id="expcat" required onkeypress="return isAlphabet(event)">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                                 <label class="control-label"> Payment Method Name <span style="color:red">*</span></label>
                                                    </div>
                                                     <div class="col-md-4 form-floating mb-3">
                                                      
                                                        <c:choose>
                                                            <c:when test="${fn:length(paymentMethodList) > 0}">
                                                                <c:forEach items="${paymentMethodList}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" placeholder="fill" name="paymentMethodDescription" value="${list.paymentMethodDescription}" maxlength="98">
                                                                        <input type="hidden" class="form-control" readonly="" name="paymentMethodNo" value="${list.paymentMethodNo}" maxlength="98">
                                                                        </c:when>
                                                                        <c:otherwise>

                                                                            <input type="text" class="form-control" readonly="" value="${list.paymentMethodDescription}">

                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>   
                                                               
                                                                <input type="text" placeholder="fill" class="form-control" name="paymentMethodDescription" maxlength="98" id="dname" required onkeypress="return isAlphaNumeric(event)">
                                                      
                                                                 </c:otherwise>        
                                                        </c:choose>
                                                                  <label class="control-label"> Description <span style="color:red">*</span></label>
                                                    </div>
                                                   

                               
                                             
                                                   <c:if test="${action ne 'view'}">
                                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                         
                                                                <button type="submit" id="savebtn" class="btn btn-primary mx-1">Save</button>
                                                                <a href="../tenant/IncomeMethodSettingsList.htm" class="btn mx-1 btn-danger">Cancel</a>
                                                            
                                                        </div> 
                                                    </c:if>
                                                
                                                
                                                
                                                <c:if test="${action eq 'view'}">
                                                         <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                         
                                                                <a href="../Expenses/incomeMethodList.htm" class="btn mx-1 btn-danger">Cancel</a>
                                                            
                                                        </div> 
                                                    </c:if>
                              
                        </form>
     </div>
                                    </div>

                                </div>
                                </div>
                            </section>

                        </main><!-- End #main -->

                        
</body>

</html>

